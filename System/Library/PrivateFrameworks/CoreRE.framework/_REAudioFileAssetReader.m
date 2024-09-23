@implementation _REAudioFileAssetReader

- (_REAudioFileAssetReader)initWithStream:(SeekableInputStream *)a3 ownsStream:(BOOL)a4
{
  _REAudioFileAssetReader *v6;
  _REAudioFileAssetReader *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_REAudioFileAssetReader;
  v6 = -[_REAudioFileAssetReader init](&v9, sel_init);
  v7 = v6;
  if (v6)
    re::audio::AudioFileAssetReader::init(&v6->_reader, (re::SeekableInputStream *)a3, a4);
  return v7;
}

- (AudioFileAssetReader)reader
{
  return &self->_reader;
}

- (id)getBackingData
{
  void *seekableStream;
  SeekableInputStreamBufferedReader *backingData;
  re *v5;
  uint64_t *v6;
  uint64_t v7;
  SeekableInputStream *v8;
  _BOOL4 Next;

  seekableStream = self->_reader.seekableStream;
  if (seekableStream)
  {
    backingData = self->_reader.backingData;
    if (backingData)
    {
LABEL_5:
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", *((_QWORD *)backingData + 1), *((_QWORD *)backingData + 2), 0);
      seekableStream = (void *)objc_claimAutoreleasedReturnValue();
      return seekableStream;
    }
    v5 = (re *)(*(uint64_t (**)(void *, _QWORD))(*(_QWORD *)seekableStream + 56))(seekableStream, 0);
    v6 = re::globalAllocators(v5);
    v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6[2] + 32))(v6[2], 72, 8);
    v8 = self->_reader.seekableStream;
    *(_QWORD *)(v7 + 64) = 0;
    *(_DWORD *)(v7 + 56) = 0;
    *(_QWORD *)(v7 + 40) = 0;
    *(_QWORD *)(v7 + 48) = 0;
    *(_QWORD *)(v7 + 32) = 0;
    *(_DWORD *)(v7 + 24) = 0;
    *(_QWORD *)v7 = v8;
    *(_QWORD *)(v7 + 8) = 0;
    *(_QWORD *)(v7 + 16) = 0;
    self->_reader.backingData = (SeekableInputStreamBufferedReader *)v7;
    Next = re::SeekableInputStreamBufferedReader::readNext((re::SeekableInputStreamBufferedReader *)v7, 0xFFFFFFFFFFFFFFFFLL);
    seekableStream = 0;
    if (Next)
    {
      backingData = self->_reader.backingData;
      goto LABEL_5;
    }
  }
  return seekableStream;
}

- (unint64_t)getFileLength
{
  return self->_reader.fileLength;
}

- (void).cxx_destruct
{
  re::audio::AudioFileAssetReader::~AudioFileAssetReader((re::audio::AudioFileAssetReader *)&self->_reader);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_BYTE *)self + 16) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
