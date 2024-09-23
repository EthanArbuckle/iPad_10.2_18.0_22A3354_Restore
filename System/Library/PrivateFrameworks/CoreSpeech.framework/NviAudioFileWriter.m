@implementation NviAudioFileWriter

- (NviAudioFileWriter)initWithURL:(id)a3 inputFormat:(AudioStreamBasicDescription *)a4 outputFormat:(AudioStreamBasicDescription *)a5
{
  const __CFURL *v9;
  NviAudioFileWriter *v10;
  NviAudioFileWriter *v11;
  OpaqueExtAudioFile **p_fFile;
  OSStatus v13;
  OSStatus v14;
  NSObject *v15;
  OpaqueExtAudioFile *fFile;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const __CFURL *v26;
  __int16 v27;
  OSStatus v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = (const __CFURL *)a3;
  v22.receiver = self;
  v22.super_class = (Class)NviAudioFileWriter;
  v10 = -[NviAudioFileWriter init](&v22, sel_init);
  v11 = v10;
  if (v10)
  {
    a5->mSampleRate = a4->mSampleRate;
    p_fFile = &v10->fFile;
    v13 = ExtAudioFileCreateWithURL(v9, 0x57415645u, a5, 0, 1u, &v10->fFile);
    if (v13)
    {
      v14 = v13;
      v15 = NviLogContextFacility;
      if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v24 = "-[NviAudioFileWriter initWithURL:inputFormat:outputFormat:]";
        v25 = 2114;
        v26 = v9;
        v27 = 1026;
        v28 = v14;
        _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s ::: Error creating output file %{public}@, err: %{public}d", buf, 0x1Cu);
      }
    }
    if (*p_fFile)
    {
      objc_storeStrong((id *)&v11->_fileURL, a3);
      fFile = v11->fFile;
    }
    else
    {
      fFile = 0;
    }
    ExtAudioFileSetProperty(fFile, 0x63666D74u, 0x28u, a4);
    v17 = *(_QWORD *)&a4->mBitsPerChannel;
    v18 = *(_OWORD *)&a4->mBytesPerPacket;
    *(_OWORD *)&v11->inASBD.mSampleRate = *(_OWORD *)&a4->mSampleRate;
    *(_OWORD *)&v11->inASBD.mBytesPerPacket = v18;
    *(_QWORD *)&v11->inASBD.mBitsPerChannel = v17;
    v20 = *(_OWORD *)&a5->mSampleRate;
    v19 = *(_OWORD *)&a5->mBytesPerPacket;
    *(_QWORD *)&v11->outASBD.mBitsPerChannel = *(_QWORD *)&a5->mBitsPerChannel;
    *(_OWORD *)&v11->outASBD.mSampleRate = v20;
    *(_OWORD *)&v11->outASBD.mBytesPerPacket = v19;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[NviAudioFileWriter endAudio](self, "endAudio");
  v3.receiver = self;
  v3.super_class = (Class)NviAudioFileWriter;
  -[NviAudioFileWriter dealloc](&v3, sel_dealloc);
}

- (void)endAudio
{
  OpaqueExtAudioFile *fFile;

  fFile = self->fFile;
  if (fFile)
    ExtAudioFileDispose(fFile);
}

- (void)addSamples:(const void *)a3 numSamples:(int64_t)a4
{
  AudioBufferList *v4;
  uint64_t mChannelsPerFrame;
  unsigned int v6;
  int v7;
  void **p_mData;
  OSStatus v9;
  OSStatus v10;
  NSObject *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a4 >= 1)
  {
    v4 = (AudioBufferList *)&buf[-((24 * self->inASBD.mChannelsPerFrame + 15) & 0x3FFFFFFFF0)];
    mChannelsPerFrame = self->inASBD.mChannelsPerFrame;
    v4->mNumberBuffers = mChannelsPerFrame;
    if ((_DWORD)mChannelsPerFrame)
    {
      v6 = 0;
      v7 = self->inASBD.mBytesPerFrame * a4;
      p_mData = &v4->mBuffers[0].mData;
      do
      {
        *((_DWORD *)p_mData - 2) = 1;
        *((_DWORD *)p_mData - 1) = v7;
        *p_mData = (char *)a3 + v6;
        p_mData += 2;
        v6 += v7;
        --mChannelsPerFrame;
      }
      while (mChannelsPerFrame);
    }
    v9 = ExtAudioFileWrite(self->fFile, a4, v4);
    if (v9)
    {
      v10 = v9;
      v11 = NviLogContextFacility;
      if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[NviAudioFileWriter addSamples:numSamples:]";
        v14 = 2050;
        v15 = v10;
        _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s ::: Error writing to output wave file. : %{public}ld", buf, 0x16u);
      }
    }
  }
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
