@implementation CSAudioFileReader

- (CSAudioFileReader)initWithURL:(id)a3
{
  const __CFURL *v4;
  CSAudioFileReader *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  OSStatus v8;
  OSStatus v9;
  NSObject *v10;
  CSAudioFileReader *v11;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const __CFURL *v17;
  __int16 v18;
  OSStatus v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (const __CFURL *)a3;
  v13.receiver = self;
  v13.super_class = (Class)CSAudioFileReader;
  v5 = -[CSAudioFileReader init](&v13, sel_init);
  if (v5
    && (v6 = dispatch_queue_create("CSAudioFileReader Queue", 0),
        queue = v5->_queue,
        v5->_queue = (OS_dispatch_queue *)v6,
        queue,
        (v8 = ExtAudioFileOpenURL(v4, &v5->_fFile)) != 0))
  {
    v9 = v8;
    v10 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v15 = "-[CSAudioFileReader initWithURL:]";
      v16 = 2112;
      v17 = v4;
      v18 = 1024;
      v19 = v9;
      _os_log_error_impl(&dword_1B502E000, v10, OS_LOG_TYPE_ERROR, "%s ::: Error reading file %@, err: %d", buf, 0x1Cu);
    }
    v11 = 0;
  }
  else
  {
    v11 = v5;
  }

  return v11;
}

- (BOOL)setRecordBufferDuration:(double)a3
{
  self->_bufferDuration = a3;
  return 1;
}

- (BOOL)prepareRecording:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  float v15;
  float v16;
  void *v17;
  float v18;
  uint64_t v19;
  const char *v20;
  float v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  AudioFormatFlags v27;
  void *v28;
  UInt32 v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint32_t v34;
  OSStatus v35;
  OSStatus v36;
  uint64_t v37;
  BOOL v38;
  int v40;
  const char *v41;
  __int16 v42;
  OSStatus v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v19 = CSLogCategoryAudio;
    if (!os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    v40 = 136315138;
    v41 = "-[CSAudioFileReader prepareRecording:]";
    v20 = "%s CSAudioFileReader requires prepare recording settings to feed audio";
    goto LABEL_18;
  }
  v6 = *MEMORY[0x1E0C898E8];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C898E8]);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");

    if (v10 != 1819304813)
    {
      v19 = CSLogCategoryAudio;
      if (!os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
        goto LABEL_22;
      v40 = 136315138;
      v41 = "-[CSAudioFileReader prepareRecording:]";
      v20 = "%s CSAudioFileReader only support LinearPCM to feed";
LABEL_18:
      v33 = v19;
      v34 = 12;
LABEL_26:
      _os_log_error_impl(&dword_1B502E000, v33, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v40, v34);
      goto LABEL_22;
    }
  }
  v11 = *MEMORY[0x1E0C89978];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C89978]);
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12
    || (v13 = (void *)v12,
        objc_msgSend(v5, "objectForKeyedSubscript:", v11),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v14, "floatValue"),
        v16 = v15,
        v14,
        v13,
        v16 == 0.0))
  {
    +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
    self->_outASBD.mSampleRate = v21;
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "floatValue");
    self->_outASBD.mSampleRate = v18;

  }
  self->_outASBD.mFormatID = 1819304813;
  v22 = *MEMORY[0x1E0C89918];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C89918]);
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23
    && (v24 = (void *)v23,
        objc_msgSend(v5, "objectForKeyedSubscript:", v22),
        v25 = (void *)objc_claimAutoreleasedReturnValue(),
        v26 = objc_msgSend(v25, "BOOLValue"),
        v25,
        v24,
        (v26 & 1) != 0))
  {
    v27 = 9;
  }
  else
  {
    v27 = 12;
  }
  self->_outASBD.mFormatFlags = v27;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C898F8]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  self->_outASBD.mBitsPerChannel = objc_msgSend(v28, "unsignedIntValue");

  v29 = self->_outASBD.mBitsPerChannel >> 3;
  self->_outASBD.mBytesPerPacket = v29;
  self->_outASBD.mFramesPerPacket = 1;
  self->_outASBD.mBytesPerFrame = v29;
  v30 = *MEMORY[0x1E0C89938];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C89938]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    self->_outASBD.mChannelsPerFrame = objc_msgSend(v32, "unsignedIntValue");

  }
  else
  {
    self->_outASBD.mChannelsPerFrame = 1;
  }
  v35 = ExtAudioFileSetProperty(self->_fFile, 0x63666D74u, 0x28u, &self->_outASBD);
  if (!v35)
  {
    v38 = 1;
    goto LABEL_23;
  }
  v36 = v35;
  v37 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
  {
    v40 = 136315394;
    v41 = "-[CSAudioFileReader prepareRecording:]";
    v42 = 1024;
    v43 = v36;
    v20 = "%s Setting ExtAudioFileSetProperty failed : %d";
    v33 = v37;
    v34 = 18;
    goto LABEL_26;
  }
LABEL_22:
  v38 = 0;
LABEL_23:

  return v38;
}

- (BOOL)startRecording
{
  NSObject *v3;
  float bufferDuration;
  float mSampleRate;
  UInt32 mBytesPerFrame;
  UInt32 mChannelsPerFrame;
  OS_dispatch_source *v8;
  OS_dispatch_source *audioFeedTimer;
  NSObject *v10;
  uint64_t v11;
  NSObject *queue;
  _QWORD v14[5];
  _QWORD handler[4];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;
  __int16 v23;
  UInt32 v24;
  __int16 v25;
  UInt32 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    bufferDuration = self->_bufferDuration;
    mSampleRate = self->_outASBD.mSampleRate;
    mBytesPerFrame = self->_outASBD.mBytesPerFrame;
    mChannelsPerFrame = self->_outASBD.mChannelsPerFrame;
    *(_DWORD *)buf = 136316162;
    v18 = "-[CSAudioFileReader startRecording]";
    v19 = 2048;
    v20 = bufferDuration;
    v21 = 2048;
    v22 = mSampleRate;
    v23 = 1024;
    v24 = mBytesPerFrame;
    v25 = 1024;
    v26 = mChannelsPerFrame;
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s Starting audio file feed timer, bufferDuration = %f sampleRate = %f, bytesPerFrame = %d, channelsPerFrame = %d", buf, 0x2Cu);
  }
  v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
  audioFeedTimer = self->_audioFeedTimer;
  self->_audioFeedTimer = v8;

  dispatch_source_set_timer((dispatch_source_t)self->_audioFeedTimer, 0, (unint64_t)(self->_bufferDuration * 1000000000.0), 0x5F5E100uLL);
  objc_initWeak((id *)buf, self);
  v10 = self->_audioFeedTimer;
  v11 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __35__CSAudioFileReader_startRecording__block_invoke;
  handler[3] = &unk_1E6880FD0;
  objc_copyWeak(&v16, (id *)buf);
  dispatch_source_set_event_handler(v10, handler);
  dispatch_resume((dispatch_object_t)self->_audioFeedTimer);
  queue = self->_queue;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __35__CSAudioFileReader_startRecording__block_invoke_2;
  v14[3] = &unk_1E6881138;
  v14[4] = self;
  dispatch_async(queue, v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
  return 1;
}

- (void)_readAudioBufferAndFeed
{
  unint64_t v2;
  double mSampleRate;
  double v5;
  unint64_t v6;
  void *v7;
  id v8;
  OSStatus v9;
  UInt32 v10;
  NSObject *v11;
  id WeakRetained;
  char v13;
  id v14;
  UInt32 ioNumberFrames;
  AudioBufferList ioData;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  UInt32 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  mSampleRate = self->_outASBD.mSampleRate;
  v5 = self->_bufferDuration * mSampleRate;
  LODWORD(mSampleRate) = self->_outASBD.mBytesPerFrame;
  LODWORD(v2) = self->_outASBD.mChannelsPerFrame;
  v6 = (unint64_t)(v5 * (double)*(unint64_t *)&mSampleRate * (double)v2);
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&ioData.mNumberBuffers = 1;
  ioData.mBuffers[0].mNumberChannels = self->_outASBD.mChannelsPerFrame;
  ioData.mBuffers[0].mDataByteSize = v6;
  v8 = objc_retainAutorelease(v7);
  ioData.mBuffers[0].mData = (void *)objc_msgSend(v8, "bytes");
  ioNumberFrames = v6;
  v9 = ExtAudioFileRead(self->_fFile, &ioNumberFrames, &ioData);
  v10 = ioNumberFrames;
  if (v9 || !ioNumberFrames)
  {
    v11 = CSLogCategoryAudio;
    if (v9)
    {
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[CSAudioFileReader _readAudioBufferAndFeed]";
        v19 = 1024;
        v20 = v9;
        _os_log_error_impl(&dword_1B502E000, v11, OS_LOG_TYPE_ERROR, "%s ::: Error reading data from audio file : %d", buf, 0x12u);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[CSAudioFileReader _readAudioBufferAndFeed]";
        v19 = 1024;
        v20 = v10;
        _os_log_impl(&dword_1B502E000, v11, OS_LOG_TYPE_DEFAULT, "%s Reach to EOF, chunkSize = %d", buf, 0x12u);
      }
      memset((void *)objc_msgSend(objc_retainAutorelease(v8), "bytes"), 1, v6);
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v14, "audioFileReaderBufferAvailable:buffer:atTime:", self, v8, mach_absolute_time());

  }
}

- (void)stopRecording
{
  NSObject *v3;
  OS_dispatch_source *audioFeedTimer;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[CSAudioFileReader stopRecording]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s Stopping audio file feed timer", buf, 0xCu);
  }
  dispatch_source_cancel((dispatch_source_t)self->_audioFeedTimer);
  audioFeedTimer = self->_audioFeedTimer;
  self->_audioFeedTimer = 0;

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__CSAudioFileReader_stopRecording__block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async(queue, block);
  ExtAudioFileSeek(self->_fFile, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[CSAudioFileReader close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)CSAudioFileReader;
  -[CSAudioFileReader dealloc](&v3, sel_dealloc);
}

- (id)readSamplesFromChannelIdx:(unsigned int)a3
{
  return 0;
}

- (void)close
{
  OpaqueExtAudioFile *fFile;

  fFile = self->_fFile;
  if (fFile)
    ExtAudioFileDispose(fFile);
}

- (CSAudioFileReaderDelegate)delegate
{
  return (CSAudioFileReaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audioFeedTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __34__CSAudioFileReader_stopRecording__block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
    objc_msgSend(v4, "audioFileReaderDidStopRecording:forReason:", *(_QWORD *)(a1 + 32), 0);

  }
}

void __35__CSAudioFileReader_startRecording__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_readAudioBufferAndFeed");

}

void __35__CSAudioFileReader_startRecording__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
    objc_msgSend(v4, "audioFileReaderDidStartRecording:successfully:error:", *(_QWORD *)(a1 + 32), 1, 0);

  }
}

@end
