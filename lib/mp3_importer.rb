require "pry"

class MP3Importer
  attr_reader :path, :files

  def initialize(file_path)
    @path = file_path
  end

  def files
    @files = Dir.glob("#{@path}/**/*.mp3")
    @formatted_files = @files.map do |file|
      File.basename(file)
    end
  end

  def import
    formatted_files = self.files
    formatted_files.each do |file|
      Song.new_by_filename(file)
    end
  end
end
