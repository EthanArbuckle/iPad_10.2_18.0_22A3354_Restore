@implementation _REAudioFile

+ (id)audioFileWithStream:(SeekableInputStream *)a3 ownsStream:(BOOL)a4
{
  _REAudioFileAssetReader *v4;
  uint64_t v5;
  void *v6;
  _REAudioFile *v7;
  uint64_t v8;
  re *v9;
  re *v10;
  id v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  re *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = -[_REAudioFileAssetReader initWithStream:ownsStream:]([_REAudioFileAssetReader alloc], "initWithStream:ownsStream:", a3, a4);
  v5 = -[_REAudioFileAssetReader reader](v4, "reader");
  if (re::audio::AudioFileAssetReader::createExtAudioFile((AudioFileID *)v5))
  {
    v6 = 0;
  }
  else
  {
    v7 = [_REAudioFile alloc];
    v8 = *(_QWORD *)(v5 + 32);
    v14 = 0;
    v6 = (void *)-[_REAudioFile initForReadingFromExtAudioFile:error:](v7, "initForReadingFromExtAudioFile:error:", v8, &v14);
    v9 = (re *)v14;
    v10 = v9;
    if (v6)
    {
      v11 = v6;
    }
    else
    {
      v12 = *re::audioLogObjects(v9);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v10;
        _os_log_error_impl(&dword_224FE9000, v12, OS_LOG_TYPE_ERROR, "Failed to create AVAudioFile from ExtAudioFile: %@", buf, 0xCu);
      }
    }

  }
  objc_msgSend(v6, "setReader:", v4);

  return v6;
}

+ (id)audioFileWithData:(id)a3
{
  re *v4;
  uint64_t *v5;
  uint64_t v6;
  re *v7;
  void *v8;
  re *v10;

  v4 = (re *)a3;
  v5 = re::globalAllocators(v4);
  v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v5[2] + 32))(v5[2], 112, 8);
  v7 = v4;
  v10 = v7;
  re::DataSeekableInputStream::DataSeekableInputStream(v6, (id *)&v10, 0, 0);
  objc_msgSend(a1, "audioFileWithStream:ownsStream:", v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)getBackingData
{
  return -[_REAudioFileAssetReader getBackingData](self->_reader, "getBackingData");
}

- (id)processingFormat
{
  return (id)-[_REAudioFileAssetReader reader](self->_reader, "reader")[48];
}

- (unint64_t)getReaderFileLength
{
  return -[_REAudioFileAssetReader getFileLength](self->_reader, "getFileLength");
}

- (_REAudioFileAssetReader)reader
{
  return self->_reader;
}

- (void)setReader:(id)a3
{
  objc_storeStrong((id *)&self->_reader, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
