@implementation CSAudioTapProvider

- (CSAudioTapProvider)init
{
  CSAudioTapProvider *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *loggingQueue;
  void *v8;
  uint64_t v9;
  NSString *UUIDString;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CSAudioTapProvider;
  v2 = -[CSAudioTapProvider init](&v12, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSAudioTapProvider audioDispatchQueue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("CSAudioTapProvider logging", v5);
    loggingQueue = v2->_loggingQueue;
    v2->_loggingQueue = (OS_dispatch_queue *)v6;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = objc_claimAutoreleasedReturnValue();
    UUIDString = v2->_UUIDString;
    v2->_UUIDString = (NSString *)v9;

    v2->_processedSampleCount = 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[CSAudioTapProvider _stopRecordingAudioQueueIfNeededWithCompletion:](self, "_stopRecordingAudioQueueIfNeededWithCompletion:", 0);
  -[CSAudioTapProvider _destroyRecordingAudioQueue](self, "_destroyRecordingAudioQueue");
  v3.receiver = self;
  v3.super_class = (Class)CSAudioTapProvider;
  -[CSAudioTapProvider dealloc](&v3, sel_dealloc);
}

- (id)UUID
{
  return self->_UUIDString;
}

- (void)setup
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D19028], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

}

- (void)_reset
{
  CSAudioCircularBuffer *circularBuffer;

  self->_processedSampleCount = 0;
  circularBuffer = self->_circularBuffer;
  if (circularBuffer)
    -[CSAudioCircularBuffer reset](circularBuffer, "reset");
}

- (BOOL)_setupRecordingAudioQueueIfNeededWithOption:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v14;
  OpaqueAudioQueue *v15;
  double v16;
  UInt32 v17;
  uint64_t i;
  OSStatus v19;
  NSObject *v20;
  const char *v21;
  __int128 v22;
  UInt32 ioDataSize;
  AudioQueueRef outAQ;
  AudioStreamBasicDescription inFormat;
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CSAudioTapProvider recordingAudioQueue](self, "recordingAudioQueue"))
  {
    v5 = 1;
    goto LABEL_21;
  }
  memset(&inFormat, 0, sizeof(inFormat));
  objc_msgSend(MEMORY[0x1E0D190F8], "lpcmMonoNonInterleavedASBD");
  outAQ = 0;
  if (!AudioQueueNewInput(&inFormat, (AudioQueueInputCallback)handleInputBuffer, self, 0, 0, 0x800u, &outAQ))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AA8]), "initWithStreamDescription:", &inFormat);
    if (objc_msgSend(v4, "requestTelephonyDownlinkAudioTap"))
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C924E8]), "initProcessTapWithFormat:PID:", v7, 4294967294);
    else
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C924E8]), "initSystemTapWithFormat:", v7);
    v9 = (void *)v8;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C924E0]), "initWithTapDescription:", v8);
    if (!v10)
    {
      v11 = *MEMORY[0x1E0D18F38];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      *(_DWORD *)buf = 136315138;
      v27 = "-[CSAudioTapProvider _setupRecordingAudioQueueIfNeededWithOption:]";
      v12 = "%s Failed to create ATAudioTap!";
LABEL_37:
      _os_log_error_impl(&dword_1C2614000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0xCu);
LABEL_17:
      if (outAQ)
        AudioQueueDispose(outAQ, 1u);
      goto LABEL_19;
    }
    if (AudioQueueSetProperty(outAQ, 0x71746F62u, v10, 8u))
    {
      v11 = *MEMORY[0x1E0D18F38];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      *(_DWORD *)buf = 136315138;
      v27 = "-[CSAudioTapProvider _setupRecordingAudioQueueIfNeededWithOption:]";
      v12 = "%s Failed to set Audio Queue Process Tap!";
      goto LABEL_37;
    }
    ioDataSize = 40;
    if (AudioQueueGetProperty(outAQ, 0x61716674u, &inFormat, &ioDataSize))
    {
      v14 = *MEMORY[0x1E0D18F38];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "-[CSAudioTapProvider _setupRecordingAudioQueueIfNeededWithOption:]";
        _os_log_error_impl(&dword_1C2614000, v14, OS_LOG_TYPE_ERROR, "%s Failed to get data format size!", buf, 0xCu);
      }
      if (outAQ)
        AudioQueueDispose(outAQ, 1u);
      goto LABEL_19;
    }
    if (outAQ)
    {
      -[CSAudioTapProvider setRecordingAudioQueue:](self, "setRecordingAudioQueue:");
      v15 = -[CSAudioTapProvider recordingAudioQueue](self, "recordingAudioQueue");
      objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingBufferDuration", *(_QWORD *)&inFormat.mSampleRate, *(_QWORD *)&inFormat.mFormatID, *(_QWORD *)&inFormat.mBytesPerPacket, *(_QWORD *)&inFormat.mBytesPerFrame, *(_QWORD *)&inFormat.mBitsPerChannel);
      *(float *)&v16 = v16;
      v17 = -[CSAudioTapProvider _calculateBufferSize:audioStreamBasicDescription:frameSizeInSec:](self, "_calculateBufferSize:audioStreamBasicDescription:frameSizeInSec:", v15, &v22, v16);
      for (i = 8; i != 40; i += 8)
        AudioQueueAllocateBuffer(-[CSAudioTapProvider recordingAudioQueue](self, "recordingAudioQueue"), v17, (AudioQueueBufferRef *)((char *)self + i));
      v19 = AudioQueueAddPropertyListener(-[CSAudioTapProvider recordingAudioQueue](self, "recordingAudioQueue"), 0x6171726Eu, (AudioQueuePropertyListenerProc)isRunningListenerCallback, self);
      v20 = *MEMORY[0x1E0D18F38];
      if (!v19)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v27 = "-[CSAudioTapProvider _setupRecordingAudioQueueIfNeededWithOption:]";
          _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_DEFAULT, "%s Successfully created audio Queue for tapping", buf, 0xCu);
        }
        v5 = 1;
        goto LABEL_20;
      }
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "-[CSAudioTapProvider _setupRecordingAudioQueueIfNeededWithOption:]";
        v21 = "%s Failed to add isRunning listener!";
LABEL_35:
        _os_log_error_impl(&dword_1C2614000, v20, OS_LOG_TYPE_ERROR, v21, buf, 0xCu);
      }
    }
    else
    {
      v20 = *MEMORY[0x1E0D18F38];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "-[CSAudioTapProvider _setupRecordingAudioQueueIfNeededWithOption:]";
        v21 = "%s recordingAudioQueue is nil!";
        goto LABEL_35;
      }
    }
LABEL_19:
    v5 = 0;
LABEL_20:

    goto LABEL_21;
  }
  v6 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[CSAudioTapProvider _setupRecordingAudioQueueIfNeededWithOption:]";
    _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, "%s Failed to create AudioQueue input!", buf, 0xCu);
  }
  if (outAQ)
    AudioQueueDispose(outAQ, 1u);
  v5 = 0;
LABEL_21:

  return v5;
}

- (void)destroyRecordingAudioQueue
{
  BOOL v3;
  NSObject *queue;
  _QWORD v5[5];
  BOOL v6;

  v3 = -[CSAudioTapProvider isRecording](self, "isRecording");
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__CSAudioTapProvider_destroyRecordingAudioQueue__block_invoke;
  v5[3] = &unk_1E7C28480;
  v6 = v3;
  v5[4] = self;
  dispatch_async(queue, v5);
}

- (void)_destroyRecordingAudioQueue
{
  OpaqueAudioQueue *recordingAudioQueue;
  uint64_t v4;
  os_log_t *v5;
  __int128 v6;
  AudioQueueBuffer *v7;
  OSStatus v8;
  OSStatus v9;
  NSObject *v10;
  OSStatus v11;
  NSObject *v12;
  OSStatus v13;
  __int128 v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  OSStatus v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  recordingAudioQueue = self->_recordingAudioQueue;
  if (recordingAudioQueue)
  {
    AudioQueueRemovePropertyListener(recordingAudioQueue, 0x6171726Eu, (AudioQueuePropertyListenerProc)isRunningListenerCallback, self);
    v4 = 0;
    v5 = (os_log_t *)MEMORY[0x1E0D18F38];
    *(_QWORD *)&v6 = 136315394;
    v14 = v6;
    do
    {
      v7 = self->_audioBuffers[v4];
      if (v7)
      {
        v8 = AudioQueueFreeBuffer(self->_recordingAudioQueue, v7);
        if (v8)
        {
          v9 = v8;
          v10 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v14;
            v16 = "-[CSAudioTapProvider _destroyRecordingAudioQueue]";
            v17 = 1024;
            v18 = v9;
            _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, "%s AudioQueueFreeBuffer error: %i", buf, 0x12u);
          }
        }
      }
      ++v4;
    }
    while (v4 != 4);
    v11 = AudioQueueDispose(self->_recordingAudioQueue, 1u);
    v12 = *v5;
    if (v11)
    {
      v13 = v11;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v14;
        v16 = "-[CSAudioTapProvider _destroyRecordingAudioQueue]";
        v17 = 1024;
        v18 = v13;
        _os_log_error_impl(&dword_1C2614000, v12, OS_LOG_TYPE_ERROR, "%s Failed to dispose Audio Queue with error: %i", buf, 0x12u);
      }
    }
    else if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[CSAudioTapProvider _destroyRecordingAudioQueue]";
      _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s Audio Queue has been disposed", buf, 0xCu);
    }
    self->_recordingAudioQueue = 0;
  }
  -[CSAudioTapProvider _reset](self, "_reset", v14);
  -[CSAudioTapProvider _releaseTransactionForStopListeningIfNeeded](self, "_releaseTransactionForStopListeningIfNeeded");
}

- (void)_holdTransactionForStartListening
{
  CSOSTransaction *v3;
  CSOSTransaction *transaction;

  if (!self->_transaction)
  {
    v3 = (CSOSTransaction *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19178]), "initWithDescription:", CFSTR("AudioTapProvider"));
    transaction = self->_transaction;
    self->_transaction = v3;

  }
}

- (void)_releaseTransactionForStopListeningIfNeeded
{
  CSOSTransaction *transaction;

  transaction = self->_transaction;
  if (transaction)
  {
    self->_transaction = 0;

  }
}

- (void)startAudioStream:(id)a3 option:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  CSAudioTapProvider *v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __57__CSAudioTapProvider_startAudioStream_option_completion___block_invoke;
  v25[3] = &unk_1E7C29128;
  v25[4] = self;
  v12 = v10;
  v26 = v12;
  v13 = (void *)MEMORY[0x1C3BC4734](v25);
  queue = self->_queue;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __57__CSAudioTapProvider_startAudioStream_option_completion___block_invoke_2;
  block[3] = &unk_1E7C27FA0;
  v20 = v8;
  v21 = v9;
  v22 = self;
  v23 = v13;
  v24 = v12;
  v15 = v12;
  v16 = v13;
  v17 = v9;
  v18 = v8;
  dispatch_async(queue, block);

}

- (void)stopAudioStream:(id)a3 option:(id)a4 completion:(id)a5
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a5;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__CSAudioTapProvider_stopAudioStream_option_completion___block_invoke;
  v9[3] = &unk_1E7C29150;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, v9);

}

- (void)_stopRecordingAudioQueueIfNeededWithCompletion:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  BOOL v8;
  OpaqueAudioQueue *recordingAudioQueue;
  OSStatus v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id aqStopCompletion;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, void *);
  void *v20;
  CSAudioTapProvider *v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __69__CSAudioTapProvider__stopRecordingAudioQueueIfNeededWithCompletion___block_invoke;
  v20 = &unk_1E7C29128;
  v21 = self;
  v5 = v4;
  v22 = v5;
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](&v17);
  -[CSAudioTapProvider aqStartCompletion](self, "aqStartCompletion", v17, v18, v19, v20, v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (!v8)
  {
    (*((void (**)(void))self->_aqStartCompletion + 2))();
    -[CSAudioTapProvider setAqStartCompletion:](self, "setAqStartCompletion:", 0);
  }
  recordingAudioQueue = self->_recordingAudioQueue;
  if (recordingAudioQueue)
  {
    v10 = AudioQueueStop(recordingAudioQueue, 1u);
    v11 = *MEMORY[0x1E0D18F38];
    v12 = *MEMORY[0x1E0D18F38];
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[CSAudioTapProvider _stopRecordingAudioQueueIfNeededWithCompletion:]";
        _os_log_error_impl(&dword_1C2614000, v11, OS_LOG_TYPE_ERROR, "%s Failed to stop Audio Queue", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v10, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        ((void (**)(_QWORD, _QWORD, void *))v6)[2](v6, 0, v13);
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[CSAudioTapProvider _stopRecordingAudioQueueIfNeededWithCompletion:]";
        _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s Stopped Audio Queue successfully", buf, 0xCu);
      }
      if (v5)
      {
        v15 = (void *)MEMORY[0x1C3BC4734](v5);
        aqStopCompletion = self->_aqStopCompletion;
        self->_aqStopCompletion = v15;

      }
      v13 = 0;
    }
  }
  else
  {
    v14 = *MEMORY[0x1E0D18F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[CSAudioTapProvider _stopRecordingAudioQueueIfNeededWithCompletion:]";
      _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s Recording queue does not exist, return as stopped successfully", buf, 0xCu);
    }
    v6[2](v6, 1, 0);
    v13 = 0;
  }

}

- (BOOL)isRecording
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__CSAudioTapProvider_isRecording__block_invoke;
  v5[3] = &unk_1E7C29228;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unsigned)_calculateBufferSize:(OpaqueAudioQueue *)a3 audioStreamBasicDescription:(AudioStreamBasicDescription *)a4 frameSizeInSec:(float)a5
{
  signed int mBytesPerPacket;
  UInt32 ioDataSize;
  signed int outData;

  mBytesPerPacket = a4->mBytesPerPacket;
  outData = mBytesPerPacket;
  if (!mBytesPerPacket)
  {
    ioDataSize = 4;
    AudioQueueGetProperty(a3, 0x786F7073u, &outData, &ioDataSize);
    mBytesPerPacket = outData;
  }
  return fmin(a4->mSampleRate * (double)mBytesPerPacket * a5, 57344.0);
}

- (void)CSAudioServerCrashMonitorDidReceiveServerCrash:(id)a3
{
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[CSAudioTapProvider CSAudioServerCrashMonitorDidReceiveServerCrash:]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s audiomxd/bridgeaudiod crashed", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__CSAudioTapProvider_CSAudioServerCrashMonitorDidReceiveServerCrash___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSAudioTapProvider CSAudioServerCrashMonitorDidReceiveServerRestart:]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s audiomxd/bridgeaudiod restarted", (uint8_t *)&v4, 0xCu);
  }
}

- (unint64_t)audioStreamId
{
  return 1;
}

- (BOOL)setCurrentContext:(id)a3 error:(id *)a4
{
  return 1;
}

- (id)audioStreamWithRequest:(id)a3 streamName:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  int v9;
  uint64_t v10;
  NSObject *queue;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  id v19;
  _QWORD block[5];

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "requiresHistoricalBuffer");
  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__CSAudioTapProvider_audioStreamWithRequest_streamName_error___block_invoke;
    block[3] = &unk_1E7C292C8;
    block[4] = self;
    dispatch_async(queue, block);
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19040]), "initWithAudioStreamProvider:streamName:streamRequest:", self, v8, v7);
  v13 = self->_queue;
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __62__CSAudioTapProvider_audioStreamWithRequest_streamName_error___block_invoke_19;
  v18[3] = &unk_1E7C292A0;
  v18[4] = self;
  v14 = v12;
  v19 = v14;
  dispatch_async(v13, v18);
  v15 = v19;
  v16 = v14;

  return v16;
}

- (void)audioStreamWithRequest:(id)a3 streamName:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id, _QWORD);
  void *v11;
  NSObject *queue;
  id v13;
  _QWORD v14[5];
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id, _QWORD))a5;
  if (v10)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19040]), "initWithAudioStreamProvider:streamName:streamRequest:", self, v9, v8);
    queue = self->_queue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __67__CSAudioTapProvider_audioStreamWithRequest_streamName_completion___block_invoke;
    v14[3] = &unk_1E7C292A0;
    v14[4] = self;
    v13 = v11;
    v15 = v13;
    dispatch_async(queue, v14);
    v10[2](v10, v13, 0);

  }
}

- (void)attachTandemStream:(id)a3 toPrimaryStream:(id)a4 completion:(id)a5
{
  void (**v5)(id, _QWORD, void *);
  void *v6;
  void (**v7)(id, _QWORD, void *);

  v5 = (void (**)(id, _QWORD, void *))a5;
  if (v5)
  {
    v7 = v5;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 2058, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v6);

    v5 = v7;
  }

}

- (BOOL)prepareAudioStreamSync:(id)a3 request:(id)a4 error:(id *)a5
{
  return 1;
}

- (void)prepareAudioStream:(id)a3 request:(id)a4 completion:(id)a5
{
  void (**v5)(id, uint64_t, _QWORD);

  v5 = (void (**)(id, uint64_t, _QWORD))a5;
  if (v5)
    v5[2](v5, 1, 0);

}

- (id)audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4
{
  return 0;
}

- (id)audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4 channelIdx:(unint64_t)a5
{
  return 0;
}

- (id)audioChunkToEndFrom:(unint64_t)a3
{
  return 0;
}

- (id)audioChunkToEndFrom:(unint64_t)a3 channelIdx:(unint64_t)a4
{
  return 0;
}

- (void)saveRecordingBufferFrom:(unint64_t)a3 to:(unint64_t)a4 toURL:(id)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  unint64_t v14;

  v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__CSAudioTapProvider_saveRecordingBufferFrom_to_toURL___block_invoke;
  v11[3] = &unk_1E7C283B8;
  v13 = a3;
  v14 = a4;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)saveRecordingBufferToEndFrom:(unint64_t)a3 toURL:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__CSAudioTapProvider_saveRecordingBufferToEndFrom_toURL___block_invoke;
  block[3] = &unk_1E7C28B58;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)_saveRecordingBufferFrom:(unint64_t)a3 to:(unint64_t)a4 toURL:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *loggingQueue;
  _QWORD v12[4];
  id v13;
  id v14;
  unint64_t v15;
  unint64_t v16;

  v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v9 = (void *)-[CSAudioCircularBuffer copySamplesFrom:to:](self->_circularBuffer, "copySamplesFrom:to:", a3, a4);
  v10 = v9;
  if (v9)
  {
    loggingQueue = self->_loggingQueue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __56__CSAudioTapProvider__saveRecordingBufferFrom_to_toURL___block_invoke;
    v12[3] = &unk_1E7C283B8;
    v15 = a3;
    v16 = a4;
    v13 = v9;
    v14 = v8;
    dispatch_async(loggingQueue, v12);

  }
}

- (id)holdAudioStreamWithDescription:(id)a3 option:(id)a4
{
  return 0;
}

- (BOOL)supportsDuckingOnCurrentRouteWithError:(id *)a3
{
  return 0;
}

- (id)recordRoute
{
  return 0;
}

- (id)recordDeviceInfo
{
  return 0;
}

- (id)audioDeviceInfo
{
  return 0;
}

- (id)recordSettings
{
  return 0;
}

- (BOOL)isNarrowBand
{
  return 0;
}

- (id)playbackRoute
{
  return 0;
}

- (OpaqueAudioQueue)recordingAudioQueue
{
  return self->_recordingAudioQueue;
}

- (void)setRecordingAudioQueue:(OpaqueAudioQueue *)a3
{
  self->_recordingAudioQueue = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)loggingQueue
{
  return self->_loggingQueue;
}

- (void)setLoggingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_loggingQueue, a3);
}

- (id)aqStartCompletion
{
  return self->_aqStartCompletion;
}

- (void)setAqStartCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)aqStopCompletion
{
  return self->_aqStopCompletion;
}

- (void)setAqStopCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)UUIDString
{
  return self->_UUIDString;
}

- (void)setUUIDString:(id)a3
{
  objc_storeStrong((id *)&self->_UUIDString, a3);
}

- (CSAudioCircularBuffer)circularBuffer
{
  return self->_circularBuffer;
}

- (void)setCircularBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_circularBuffer, a3);
}

- (CSAudioStream)audioStream
{
  return (CSAudioStream *)objc_loadWeakRetained((id *)&self->_audioStream);
}

- (void)setAudioStream:(id)a3
{
  objc_storeWeak((id *)&self->_audioStream, a3);
}

- (unint64_t)processedSampleCount
{
  return self->_processedSampleCount;
}

- (void)setProcessedSampleCount:(unint64_t)a3
{
  self->_processedSampleCount = a3;
}

- (CSOSTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_destroyWeak((id *)&self->_audioStream);
  objc_storeStrong((id *)&self->_circularBuffer, 0);
  objc_storeStrong((id *)&self->_UUIDString, 0);
  objc_storeStrong(&self->_aqStopCompletion, 0);
  objc_storeStrong(&self->_aqStartCompletion, 0);
  objc_storeStrong((id *)&self->_loggingQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __56__CSAudioTapProvider__saveRecordingBufferFrom_to_toURL___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[6];
    v4 = a1[7];
    v6 = 136315650;
    v7 = "-[CSAudioTapProvider _saveRecordingBufferFrom:to:toURL:]_block_invoke";
    v8 = 2050;
    v9 = v3;
    v10 = 2050;
    v11 = v4;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Saving circular buffer from %{public}lu to %{public}lu", (uint8_t *)&v6, 0x20u);
  }
  return objc_msgSend(MEMORY[0x1E0D191B0], "saveAudioChunck:toURL:", a1[4], a1[5]);
}

void *__57__CSAudioTapProvider_saveRecordingBufferToEndFrom_toURL___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *result;

  v2 = (_QWORD *)a1[4];
  result = (void *)v2[11];
  if (result)
    return (void *)objc_msgSend(v2, "_saveRecordingBufferFrom:to:toURL:", a1[6], objc_msgSend(result, "sampleCount"), a1[5]);
  return result;
}

uint64_t __55__CSAudioTapProvider_saveRecordingBufferFrom_to_toURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveRecordingBufferFrom:to:toURL:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

uint64_t __67__CSAudioTapProvider_audioStreamWithRequest_streamName_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAudioStream:", *(_QWORD *)(a1 + 40));
}

void __62__CSAudioTapProvider_audioStreamWithRequest_streamName_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  int v4;
  int v5;
  int v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88))
  {
    v2 = *MEMORY[0x1E0D18F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = "-[CSAudioTapProvider audioStreamWithRequest:streamName:error:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Create circular buffer", (uint8_t *)&v12, 0xCu);
    }
    v3 = objc_alloc(MEMORY[0x1E0D18FD8]);
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingDurationInSecs");
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    LODWORD(v7) = v6;
    LODWORD(v8) = v5;
    v9 = objc_msgSend(v3, "initWithNumChannels:recordingDuration:samplingRate:audioTimeConverter:", 1, 0, v8, v7);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 88);
    *(_QWORD *)(v10 + 88) = v9;

  }
}

uint64_t __62__CSAudioTapProvider_audioStreamWithRequest_streamName_error___block_invoke_19(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_reset");
  return objc_msgSend(*(id *)(a1 + 32), "setAudioStream:", *(_QWORD *)(a1 + 40));
}

uint64_t __69__CSAudioTapProvider_CSAudioServerCrashMonitorDidReceiveServerCrash___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_destroyRecordingAudioQueue");
  objc_msgSend(*(id *)(a1 + 32), "audioStream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioStreamProvider:didStopStreamUnexpectedly:", *(_QWORD *)(a1 + 32), -11785);

  return objc_msgSend(*(id *)(a1 + 32), "_releaseTransactionForStopListeningIfNeeded");
}

OpaqueAudioQueue *__33__CSAudioTapProvider_isRecording__block_invoke(uint64_t a1)
{
  OpaqueAudioQueue *result;

  result = *(OpaqueAudioQueue **)(*(_QWORD *)(a1 + 32) + 40);
  if (result)
  {
    result = (OpaqueAudioQueue *)isAudioQueueRecording(result, 0);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  }
  return result;
}

void __69__CSAudioTapProvider__stopRecordingAudioQueueIfNeededWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_releaseTransactionForStopListeningIfNeeded");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);

}

uint64_t __56__CSAudioTapProvider_stopAudioStream_option_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSAudioTapProvider stopAudioStream:option:completion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_stopRecordingAudioQueueIfNeededWithCompletion:", *(_QWORD *)(a1 + 40));
}

void __57__CSAudioTapProvider_startAudioStream_option_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  if ((a2 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_releaseTransactionForStopListeningIfNeeded");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);

}

void __57__CSAudioTapProvider_startAudioStream_option_completion___block_invoke_2(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t i;
  uint64_t v7;
  OSStatus v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  const char *v17;
  __int16 v18;
  OSStatus v19;
  AudioTimeStamp buf;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (os_log_t *)MEMORY[0x1E0D18F38];
  v3 = (id)*MEMORY[0x1E0D18F38];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf.mSampleTime) = 136315650;
    *(_QWORD *)((char *)&buf.mSampleTime + 4) = "-[CSAudioTapProvider startAudioStream:option:completion:]_block_invoke_2";
    WORD2(buf.mHostTime) = 2114;
    *(UInt64 *)((char *)&buf.mHostTime + 6) = (UInt64)v4;
    HIWORD(buf.mRateScalar) = 2114;
    buf.mWordClockTime = (UInt64)v5;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s stream: %{public}@, option: %{public}@", (uint8_t *)&buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 48), "_holdTransactionForStartListening");
  if (!objc_msgSend(*(id *)(a1 + 48), "_setupRecordingAudioQueueIfNeededWithOption:", *(_QWORD *)(a1 + 40)))
  {
    v12 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 2051, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

    return;
  }
  for (i = 8; i != 40; i += 8)
    AudioQueueEnqueueBuffer((AudioQueueRef)objc_msgSend(*(id *)(a1 + 48), "recordingAudioQueue"), *(AudioQueueBufferRef *)(*(_QWORD *)(a1 + 48) + i), 0, 0);
  v7 = mach_absolute_time();
  if ((objc_msgSend(*(id *)(a1 + 40), "requestHistoricalAudioDataWithHostTime") & 1) != 0)
    v7 = objc_msgSend(*(id *)(a1 + 40), "startRecordingHostTime");
  buf.mSampleTime = 0.0;
  memset(&buf.mRateScalar, 0, 40);
  buf.mHostTime = v7;
  *(_QWORD *)&buf.mFlags = 2;
  v8 = AudioQueueStart((AudioQueueRef)objc_msgSend(*(id *)(a1 + 48), "recordingAudioQueue"), &buf);
  if (v8)
  {
    v9 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315394;
      v17 = "-[CSAudioTapProvider startAudioStream:option:completion:]_block_invoke";
      v18 = 1024;
      v19 = v8;
      _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s Failed to start Audio Queue! %d", (uint8_t *)&v16, 0x12u);
    }
    v10 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v11);
  }
  else
  {
    if (!*(_QWORD *)(a1 + 64))
      return;
    v14 = MEMORY[0x1C3BC4734]();
    v15 = *(_QWORD *)(a1 + 48);
    v11 = *(void **)(v15 + 64);
    *(_QWORD *)(v15 + 64) = v14;
  }

}

uint64_t __48__CSAudioTapProvider_destroyRecordingAudioQueue__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 40))
  {
    v2 = *MEMORY[0x1E0D18F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[CSAudioTapProvider destroyRecordingAudioQueue]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Stopping current audio queue before destroying", (uint8_t *)&v5, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "_stopRecordingAudioQueueIfNeededWithCompletion:", 0);
    objc_msgSend(*(id *)(a1 + 32), "audioStream");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "audioStreamProvider:didStopStreamUnexpectedly:", *(_QWORD *)(a1 + 32), 8);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_destroyRecordingAudioQueue");
}

@end
