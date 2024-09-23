@implementation CSSelectiveChannelAudioFileWriter

- (CSSelectiveChannelAudioFileWriter)initWithURL:(id)a3 inputFormat:(AudioStreamBasicDescription *)a4 outputFormat:(AudioStreamBasicDescription *)a5 channelBitset:(unint64_t)a6
{
  const __CFURL *v10;
  CSSelectiveChannelAudioFileWriter *v11;
  CSSelectiveChannelAudioFileWriter *v12;
  OSStatus v13;
  NSObject *v14;
  const __CFURL *v15;
  NSURL *fileURL;
  OpaqueExtAudioFile *fFile;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  NSArray *selectedChannelList;
  _QWORD v25[5];
  objc_super v26;
  _BYTE buf[24];
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = (const __CFURL *)a3;
  v26.receiver = self;
  v26.super_class = (Class)CSSelectiveChannelAudioFileWriter;
  v11 = -[CSSelectiveChannelAudioFileWriter init](&v26, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_numberOfChannels = a4->mChannelsPerFrame;
    a5->mSampleRate = a4->mSampleRate;
    v13 = ExtAudioFileCreateWithURL(v10, 0x57415645u, a5, 0, 1u, &v11->fFile);
    if (v13)
    {
      v14 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[CSSelectiveChannelAudioFileWriter initWithURL:inputFormat:outputFormat:channelBitset:]";
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v10;
        *(_WORD *)&buf[22] = 1026;
        LODWORD(v28) = v13;
        _os_log_error_impl(&dword_1B502E000, v14, OS_LOG_TYPE_ERROR, "%s ::: Error creating output file %{public}@, err: %{public}d", buf, 0x1Cu);
      }
    }
    if (v12->fFile)
      v15 = v10;
    else
      v15 = 0;
    fileURL = v12->_fileURL;
    v12->_fileURL = (NSURL *)v15;

    fFile = v12->fFile;
    if (fFile)
      ExtAudioFileSetProperty(fFile, 0x63666D74u, 0x28u, a4);
    v12->isWriting = 1;
    v18 = *(_OWORD *)&a4->mSampleRate;
    v19 = *(_OWORD *)&a4->mBytesPerPacket;
    *(_QWORD *)&v12->inASBD.mBitsPerChannel = *(_QWORD *)&a4->mBitsPerChannel;
    *(_OWORD *)&v12->inASBD.mBytesPerPacket = v19;
    *(_OWORD *)&v12->inASBD.mSampleRate = v18;
    v20 = *(_OWORD *)&a5->mSampleRate;
    v21 = *(_OWORD *)&a5->mBytesPerPacket;
    *(_QWORD *)&v12->outASBD.mBitsPerChannel = *(_QWORD *)&a5->mBitsPerChannel;
    *(_OWORD *)&v12->outASBD.mSampleRate = v20;
    *(_OWORD *)&v12->outASBD.mBytesPerPacket = v21;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v28 = __Block_byref_object_copy__11238;
    v29 = __Block_byref_object_dispose__11239;
    v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __88__CSSelectiveChannelAudioFileWriter_initWithURL_inputFormat_outputFormat_channelBitset___block_invoke;
    v25[3] = &unk_1E6880EB0;
    v25[4] = buf;
    +[CSUtils iterateBitset:block:](CSUtils, "iterateBitset:block:", a6, v25);
    v22 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "mutableCopy");
    selectedChannelList = v12->selectedChannelList;
    v12->selectedChannelList = (NSArray *)v22;

    _Block_object_dispose(buf, 8);
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[CSSelectiveChannelAudioFileWriter endAudio](self, "endAudio");
  v3.receiver = self;
  v3.super_class = (Class)CSSelectiveChannelAudioFileWriter;
  -[CSSelectiveChannelAudioFileWriter dealloc](&v3, sel_dealloc);
}

- (BOOL)endAudio
{
  OpaqueExtAudioFile *fFile;

  fFile = self->fFile;
  if (fFile)
    ExtAudioFileDispose(fFile);
  self->isWriting = 0;
  return 1;
}

- (BOOL)addSamples:(const void *)a3 numSamples:(int64_t)a4
{
  BOOL v4;
  UInt32 mBytesPerFrame;
  AudioBufferList *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  char *v16;
  OSStatus v17;
  OSStatus v18;
  NSObject *v19;
  uint64_t v21;
  CSSelectiveChannelAudioFileWriter *v22;
  uint64_t *v23;
  int64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = 1;
  if (a4 >= 1 && self->isWriting)
  {
    v24 = a4;
    v23 = &v21;
    mBytesPerFrame = self->inASBD.mBytesPerFrame;
    v7 = (AudioBufferList *)((char *)&v21 - ((24 * self->inASBD.mChannelsPerFrame + 15) & 0x3FFFFFFFF0));
    v7->mNumberBuffers = self->inASBD.mChannelsPerFrame;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v22 = self;
    v8 = self->selectedChannelList;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = mBytesPerFrame * v24;
      v13 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v8);
          v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v16 = (char *)v7 + 16 * (v11 + i);
          *((_DWORD *)v16 + 2) = 1;
          *((_DWORD *)v16 + 3) = v12;
          *((_QWORD *)v16 + 2) = (char *)a3 + objc_msgSend(v15, "unsignedIntegerValue") * v12;
        }
        v11 += i;
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v10);
    }

    v17 = ExtAudioFileWrite(v22->fFile, v24, v7);
    v4 = v17 == 0;
    if (v17)
    {
      v18 = v17;
      v19 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v30 = "-[CSSelectiveChannelAudioFileWriter addSamples:numSamples:]";
        v31 = 2050;
        v32 = v18;
        _os_log_error_impl(&dword_1B502E000, v19, OS_LOG_TYPE_ERROR, "%s ::: Error writing to output wave file. : %{public}ld", buf, 0x16u);
      }
    }
  }
  return v4;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (unsigned)numberOfChannels
{
  return self->_numberOfChannels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->selectedChannelList, 0);
}

void __88__CSSelectiveChannelAudioFileWriter_initWithURL_inputFormat_outputFormat_channelBitset___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
