@implementation VCAudioRelay

- (VCAudioRelay)init
{
  VCAudioRelay *v2;
  VCAudioRelay *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCAudioRelay;
  v2 = -[VCAudioRelay init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_IOBufferDuration = NAN;
    pthread_mutex_init(&v2->_relayLock, 0);
    pthread_mutex_init(&v3->_clientIOInfo.lock, 0);
    pthread_mutex_init(&v3->_remoteIOInfo.lock, 0);
    v3->_clientIOInfo.ioFriendlyName = (NSString *)objc_msgSend(CFSTR("vcaudiorelay.client"), "copy");
    v3->_clientIOInfo.audioRecordingFileName = (NSString *)objc_msgSend(CFSTR("client_relay_io"), "copy");
    v3->_remoteIOInfo.ioFriendlyName = (NSString *)objc_msgSend(CFSTR("vcaudiorelay.remote"), "copy");
    v3->_remoteIOInfo.audioRecordingFileName = (NSString *)objc_msgSend(CFSTR("remote_relay_io"), "copy");
    v3->_remoteCodecInfo.codecType = 0;
    v3->_remoteCodecInfo.sampleRate = 24000.0;
  }
  return v3;
}

- (void)dealloc
{
  NSString *v3;
  NSString *v4;
  NSString *v5;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[VCAudioRelay stopClientIO](self, "stopClientIO");
  -[VCAudioRelay stopRemoteIO](self, "stopRemoteIO");
  -[VCAudioRelay destroyAudioConverters](self, "destroyAudioConverters");

  v3 = self->_clientIOInfo.audioRecordingFileName;
  v4 = self->_remoteIOInfo.ioFriendlyName;
  v5 = self->_remoteIOInfo.audioRecordingFileName;
  -[VCAudioRelay releasePTPClock](self, "releasePTPClock");
  pthread_mutex_destroy(&self->_relayLock);
  pthread_mutex_destroy(&self->_clientIOInfo.lock);
  pthread_mutex_destroy(&self->_remoteIOInfo.lock);
  v6.receiver = self;
  v6.super_class = (Class)VCAudioRelay;
  -[VCAudioRelay dealloc](&v6, sel_dealloc);
}

- (void)releasePTPClock
{
  if (self->_ptpClock)
  {
    TimeSyncClockDispose();
    self->_ptpClock = 0;
  }
}

- (void)lock
{
  pthread_mutex_lock(&self->_relayLock);
}

- (void)unlock
{
  pthread_mutex_unlock(&self->_relayLock);
}

- (BOOL)setIOBufferDuration:(double)a3 withError:(id *)a4
{
  _BOOL4 v7;

  -[VCAudioRelay lock](self, "lock");
  v7 = -[VCAudioRelay canSetPropertyWithError:](self, "canSetPropertyWithError:", a4);
  if (v7)
  {
    self->_IOBufferDuration = a3;
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCAudioRelay setIOBufferDuration:withError:].cold.1();
  }
  -[VCAudioRelay unlock](self, "unlock");
  return v7;
}

- (double)ioBufferDurationWithFirstIO:(id)a3 secondIO:(id)a4
{
  double v5;
  double v6;
  double v7;

  if (a3)
  {
    objc_msgSend(a3, "preferredIODuration");
    v6 = fmin(v5, 0.02);
    if (!a4)
      return v6;
  }
  else
  {
    v6 = 0.02;
    if (!a4)
      return v6;
  }
  objc_msgSend(a4, "preferredIODuration");
  if (v7 < v6)
    return v7;
  return v6;
}

- (void)updateRemoteCodecInfo:(const _VCRemoteCodecInfo *)a3
{
  if (a3)
  {
    self->_remoteCodecInfo = *a3;
  }
  else
  {
    self->_remoteCodecInfo.codecType = 0;
    self->_remoteCodecInfo.sampleRate = 24000.0;
  }
}

- (VCAudioRelayIO)remoteIO
{
  return self->_remoteIOInfo.relayIO;
}

- (BOOL)setRemoteIO:(id)a3 withError:(id *)a4
{
  VCAudioRelayIO *relayIO;
  _BOOL4 v8;
  BOOL v9;
  _opaque_pthread_mutex_t *p_lock;
  VCAudioRelayIO *v11;
  _VCRemoteCodecInfo remoteCodecInfo;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v14[0] = 0;
  -[VCAudioRelay lock](self, "lock");
  pthread_mutex_lock(&self->_remoteIOInfo.lock);
  -[VCAudioRelay destroyAudioConverters](self, "destroyAudioConverters");

  relayIO = (VCAudioRelayIO *)objc_msgSend(a3, "copy");
  self->_remoteIOInfo.relayIO = relayIO;
  if (relayIO)
  {
    if (!self->_clientIOInfo.relayIO)
      goto LABEL_5;
    v8 = -[VCAudioRelay createAudioConvertersWithError:](self, "createAudioConvertersWithError:", v14);
    relayIO = self->_remoteIOInfo.relayIO;
    if (!v8)
    {

      v9 = 0;
      self->_remoteIOInfo.relayIO = 0;
      goto LABEL_7;
    }
    if (relayIO)
    {
LABEL_5:
      -[VCAudioRelayIO setRelay:](relayIO, "setRelay:", self);
      relayIO = self->_remoteIOInfo.relayIO;
    }
  }
  -[VCAudioRelay updateRemoteCodecInfo:](self, "updateRemoteCodecInfo:", -[VCAudioRelayIO remoteCodecInfo](relayIO, "remoteCodecInfo"));
  v9 = 1;
LABEL_7:
  remoteCodecInfo = self->_remoteCodecInfo;
  pthread_mutex_unlock(&self->_remoteIOInfo.lock);
  -[VCAudioRelay unlock](self, "unlock", remoteCodecInfo);
  p_lock = &self->_clientIOInfo.lock;
  pthread_mutex_lock(&self->_clientIOInfo.lock);
  v11 = self->_clientIOInfo.relayIO;
  pthread_mutex_unlock(p_lock);
  -[VCAudioRelayIO didUpdateBasebandCodec:](v11, "didUpdateBasebandCodec:", &remoteCodecInfo);

  if (a4 && !v9)
    *a4 = (id)v14[0];
  return v9;
}

- (VCAudioRelayIO)clientIO
{
  return self->_clientIOInfo.relayIO;
}

- (BOOL)setClientIO:(id)a3 withError:(id *)a4
{
  VCAudioRelayIO *v7;
  BOOL v8;
  _VCRemoteCodecInfo remoteCodecInfo;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v11[0] = 0;
  -[VCAudioRelay lock](self, "lock");
  pthread_mutex_lock(&self->_clientIOInfo.lock);
  -[VCAudioRelay destroyAudioConverters](self, "destroyAudioConverters");

  v7 = (VCAudioRelayIO *)objc_msgSend(a3, "copy");
  self->_clientIOInfo.relayIO = v7;
  v8 = 1;
  if (self->_remoteIOInfo.relayIO
    && v7
    && !-[VCAudioRelay createAudioConvertersWithError:](self, "createAudioConvertersWithError:", v11))
  {

    v8 = 0;
    self->_clientIOInfo.relayIO = 0;
  }
  remoteCodecInfo = self->_remoteCodecInfo;
  pthread_mutex_unlock(&self->_clientIOInfo.lock);
  -[VCAudioRelay unlock](self, "unlock", remoteCodecInfo);
  objc_msgSend(a3, "didUpdateBasebandCodec:", &remoteCodecInfo);
  if (a4 && !v8)
    *a4 = (id)v11[0];
  return v8;
}

- (BOOL)canSetPropertyWithError:(id *)a3
{
  _BOOL4 isRelayRunning;

  isRelayRunning = self->_isRelayRunning;
  if (self->_isRelayRunning)
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a3, 32005, 0, 0, CFSTR("Cannot set VCAudioRelay property"), CFSTR("VCAudioRelay is running"));
  return !isRelayRunning;
}

- (BOOL)startRelayIO:(tagVCAudioRelayIOInfo *)a3 otherRelayIO:(tagVCAudioRelayIOInfo *)a4
{
  VCAudioRelayIO *relayIO;
  VCAudioRelayIO *v8;
  double v9;
  double v10;
  double *p_IOBufferDuration;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  VCAudioRelayIO *v15;
  NSObject *global_queue;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  _QWORD v26[6];
  BOOL v27;
  uint64_t v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v28 = 0;
  if (!a3 || !a3->relayIO)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = CFSTR("Can't start: relay IO is nil");
LABEL_26:
    v14 = 0;
    v28 = objc_msgSend(v18, "AVConferenceServiceError:detailCode:description:", 32016, 0, v19);
    goto LABEL_23;
  }
  if (!a4)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = CFSTR("Invalid IO");
    goto LABEL_26;
  }
  if (-[VCAudioRelayIO isRunning](a3->relayIO, "isRunning"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v30 = v20;
        v31 = 2080;
        v32 = "-[VCAudioRelay startRelayIO:otherRelayIO:]";
        v33 = 1024;
        v34 = 317;
        _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Relay IO is already started", buf, 0x1Cu);
      }
    }
    goto LABEL_22;
  }
  relayIO = a3->relayIO;
  if (-[VCAudioRelayIO isRunning](a4->relayIO, "isRunning"))
    v8 = a4->relayIO;
  else
    v8 = 0;
  -[VCAudioRelay ioBufferDurationWithFirstIO:secondIO:](self, "ioBufferDurationWithFirstIO:secondIO:", relayIO, v8);
  v10 = v9;
  if (-[VCAudioRelayIO isRunning](a4->relayIO, "isRunning")
    && (p_IOBufferDuration = &self->_IOBufferDuration, vabdd_f64(self->_IOBufferDuration, v10) > 2.22044605e-16))
  {
    pthread_mutex_lock(&a4->lock);
    -[VCAudioRelayIO destroyPacketThread](a4->relayIO, "destroyPacketThread");
    *p_IOBufferDuration = v10;
    v12 = -[VCAudioRelayIO createPacketThreadWithIOBufferDuration:name:error:](a4->relayIO, "createPacketThreadWithIOBufferDuration:name:error:", a4->ioFriendlyName, &v28, v10);
    pthread_mutex_unlock(&a4->lock);
    if (!v12)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioRelay startRelayIO:otherRelayIO:].cold.1();
      }
      -[VCAudioRelay internalStopRelayThread](self, "internalStopRelayThread");
      -[VCAudioRelayIO closeRecordings](a4->relayIO, "closeRecordings");
    }
  }
  else
  {
    self->_IOBufferDuration = v10;
    p_IOBufferDuration = &self->_IOBufferDuration;
  }
  pthread_mutex_lock(&a3->lock);
  v13 = -[VCAudioRelayIO createPacketThreadWithIOBufferDuration:name:error:](a3->relayIO, "createPacketThreadWithIOBufferDuration:name:error:", a3->ioFriendlyName, &v28, *p_IOBufferDuration);
  pthread_mutex_unlock(&a3->lock);
  if (!v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      v14 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      *(_DWORD *)buf = 136315906;
      v30 = v22;
      v31 = 2080;
      v32 = "-[VCAudioRelay startRelayIO:otherRelayIO:]";
      v33 = 1024;
      v34 = 346;
      v35 = 2112;
      v36 = v28;
      _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to create packet thread: %@", buf, 0x26u);
    }
LABEL_37:
    v14 = 0;
    goto LABEL_23;
  }
  if (-[VCAudioRelayIO isRunning](self->_clientIOInfo.relayIO, "isRunning")
    && -[VCAudioRelayIO isRunning](self->_remoteIOInfo.relayIO, "isRunning"))
  {
    goto LABEL_21;
  }
  if (!-[VCAudioRelay startRelayThreadWithError:](self, "startRelayThreadWithError:", &v28))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v30 = v24;
        v31 = 2080;
        v32 = "-[VCAudioRelay startRelayIO:otherRelayIO:]";
        v33 = 1024;
        v34 = 351;
        v35 = 2112;
        v36 = v28;
        _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to start the relay thread: %@", buf, 0x26u);
      }
    }
    -[VCAudioRelayIO destroyPacketThread](a3->relayIO, "destroyPacketThread");
    goto LABEL_37;
  }
  -[VCAudioRelay startPeriodicHealthPrint](self, "startPeriodicHealthPrint");
LABEL_21:
  -[VCAudioRelayIO createRecordingsWithName:](a3->relayIO, "createRecordingsWithName:", a3->audioRecordingFileName);
  -[VCAudioRelayIO printStreamFormats](a3->relayIO, "printStreamFormats");
LABEL_22:
  v14 = 1;
LABEL_23:
  v15 = a3->relayIO;
  global_queue = dispatch_get_global_queue(2, 0);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __42__VCAudioRelay_startRelayIO_otherRelayIO___block_invoke;
  v26[3] = &unk_1E9E52210;
  v27 = v14;
  v26[4] = v15;
  v26[5] = v28;
  dispatch_async(global_queue, v26);
  return v14;
}

uint64_t __42__VCAudioRelay_startRelayIO_otherRelayIO___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "startCompletionHandler");
  if (result)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "startCompletionHandler");
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)internalStopRelayThread
{
  NSObject *periodicHealthPrintDispatchSource;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  periodicHealthPrintDispatchSource = self->_periodicHealthPrintDispatchSource;
  if (periodicHealthPrintDispatchSource)
  {
    dispatch_source_cancel(periodicHealthPrintDispatchSource);
    v4 = self->_periodicHealthPrintDispatchSource;
    if (v4)
    {
      dispatch_release(v4);
      self->_periodicHealthPrintDispatchSource = 0;
    }
  }
  -[VCAudioRelay stopRelayThread](self, "stopRelayThread");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315650;
      v8 = v5;
      v9 = 2080;
      v10 = "-[VCAudioRelay internalStopRelayThread]";
      v11 = 1024;
      v12 = 384;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCAudioRelay stopped", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

- (void)stopRelayIO:(tagVCAudioRelayIOInfo *)a3 otherRelayIO:(tagVCAudioRelayIOInfo *)a4
{
  double v7;
  double v8;
  BOOL v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3 && a3->relayIO)
  {
    if (a4)
    {
      if (-[VCAudioRelayIO isRunning](a3->relayIO, "isRunning"))
      {
        if (!-[VCAudioRelayIO isRunning](self->_clientIOInfo.relayIO, "isRunning")
          || !-[VCAudioRelayIO isRunning](self->_remoteIOInfo.relayIO, "isRunning"))
        {
          -[VCAudioRelay internalStopRelayThread](self, "internalStopRelayThread");
        }
        -[VCAudioRelayIO closeRecordings](a3->relayIO, "closeRecordings");
        pthread_mutex_lock(&a3->lock);
        -[VCAudioRelayIO destroyPacketThread](a3->relayIO, "destroyPacketThread");
        pthread_mutex_unlock(&a3->lock);
        if (-[VCAudioRelayIO isRunning](a4->relayIO, "isRunning"))
        {
          -[VCAudioRelayIO preferredIODuration](a4->relayIO, "preferredIODuration");
          v8 = v7;
          if (vabdd_f64(self->_IOBufferDuration, v7) > 2.22044605e-16)
          {
            pthread_mutex_lock(&a4->lock);
            -[VCAudioRelayIO destroyPacketThread](a4->relayIO, "destroyPacketThread");
            self->_IOBufferDuration = v8;
            v9 = -[VCAudioRelayIO createPacketThreadWithIOBufferDuration:name:error:](a4->relayIO, "createPacketThreadWithIOBufferDuration:name:error:", a4->ioFriendlyName, 0, v8);
            pthread_mutex_unlock(&a4->lock);
            if (!v9)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  -[VCAudioRelay stopRelayIO:otherRelayIO:].cold.3();
              }
              -[VCAudioRelay internalStopRelayThread](self, "internalStopRelayThread");
              -[VCAudioRelayIO closeRecordings](a4->relayIO, "closeRecordings");
            }
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v12 = 136315650;
          v13 = v10;
          v14 = 2080;
          v15 = "-[VCAudioRelay stopRelayIO:otherRelayIO:]";
          v16 = 1024;
          v17 = 391;
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Relay IO is not started", (uint8_t *)&v12, 0x1Cu);
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioRelay stopRelayIO:otherRelayIO:].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCAudioRelay stopRelayIO:otherRelayIO:].cold.1();
  }
}

- (BOOL)startClientIO
{
  uint64_t v3;
  NSObject *v4;
  BOOL v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315650;
      v8 = v3;
      v9 = 2080;
      v10 = "-[VCAudioRelay startClientIO]";
      v11 = 1024;
      v12 = 424;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Starting client relay IO", (uint8_t *)&v7, 0x1Cu);
    }
  }
  -[VCAudioRelay lock](self, "lock");
  v5 = -[VCAudioRelay startRelayIO:otherRelayIO:](self, "startRelayIO:otherRelayIO:", &self->_clientIOInfo, &self->_remoteIOInfo);
  if (!v5 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCAudioRelay startClientIO].cold.1();
  }
  -[VCAudioRelay unlock](self, "unlock");
  return v5;
}

- (BOOL)startRemoteIO
{
  uint64_t v3;
  NSObject *v4;
  BOOL v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315650;
      v8 = v3;
      v9 = 2080;
      v10 = "-[VCAudioRelay startRemoteIO]";
      v11 = 1024;
      v12 = 436;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Starting remote relay IO", (uint8_t *)&v7, 0x1Cu);
    }
  }
  -[VCAudioRelay lock](self, "lock");
  v5 = -[VCAudioRelay startRelayIO:otherRelayIO:](self, "startRelayIO:otherRelayIO:", &self->_remoteIOInfo, &self->_clientIOInfo);
  if (!v5 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCAudioRelay startRemoteIO].cold.1();
  }
  -[VCAudioRelay unlock](self, "unlock");
  return v5;
}

- (void)stopClientIO
{
  int ErrorLogLevelForModule;
  os_log_t *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule > 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315650;
      v10 = v5;
      v11 = 2080;
      v12 = "-[VCAudioRelay stopClientIO]";
      v13 = 1024;
      v14 = 447;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Stopping client relay IO", (uint8_t *)&v9, 0x1Cu);
    }
  }
  -[VCAudioRelay lock](self, "lock");
  -[VCAudioRelay stopRelayIO:otherRelayIO:](self, "stopRelayIO:otherRelayIO:", &self->_clientIOInfo, &self->_remoteIOInfo);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315650;
      v10 = v7;
      v11 = 2080;
      v12 = "-[VCAudioRelay stopClientIO]";
      v13 = 1024;
      v14 = 450;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCAudioRelay client stopped", (uint8_t *)&v9, 0x1Cu);
    }
  }
  -[VCAudioRelay unlock](self, "unlock");
}

- (void)stopRemoteIO
{
  int ErrorLogLevelForModule;
  os_log_t *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule > 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315650;
      v10 = v5;
      v11 = 2080;
      v12 = "-[VCAudioRelay stopRemoteIO]";
      v13 = 1024;
      v14 = 455;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Stopping remote relay IO", (uint8_t *)&v9, 0x1Cu);
    }
  }
  -[VCAudioRelay lock](self, "lock");
  -[VCAudioRelay stopRelayIO:otherRelayIO:](self, "stopRelayIO:otherRelayIO:", &self->_remoteIOInfo, &self->_clientIOInfo);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315650;
      v10 = v7;
      v11 = 2080;
      v12 = "-[VCAudioRelay stopRemoteIO]";
      v13 = 1024;
      v14 = 458;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCAudioRelay remote stopped", (uint8_t *)&v9, 0x1Cu);
    }
  }
  -[VCAudioRelay unlock](self, "unlock");
}

- (BOOL)setNetworkClockID:(unint64_t)a3 withError:(id *)a4
{
  void *v7;
  BOOL v8;

  -[VCAudioRelay lock](self, "lock");
  if (!-[VCAudioRelay canSetPropertyWithError:](self, "canSetPropertyWithError:", a4))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioRelay setNetworkClockID:withError:].cold.2();
    }
    goto LABEL_12;
  }
  -[VCAudioRelay releasePTPClock](self, "releasePTPClock");
  if (*MEMORY[0x1E0DBF0F0] != a3)
  {
    v7 = (void *)TimeSyncClockCreateWithClockIdentifier();
    self->_ptpClock = v7;
    if (!v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioRelay setNetworkClockID:withError:].cold.1();
      }
      +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32016, 0, 0, CFSTR("Failed to create network clock"), CFSTR("Create network clock returned NULL value"));
LABEL_12:
      v8 = 0;
      goto LABEL_13;
    }
  }
  v8 = 1;
LABEL_13:
  -[VCAudioRelay unlock](self, "unlock");
  return v8;
}

- (BOOL)startRelayThreadWithError:(id *)a3
{
  _opaque_pthread_cond_t *p_wakeUpCondition;
  int v6;
  int v7;
  BOOL v8;
  void *v10;
  void *v11;
  CFDictionaryRef v12;
  int v13;
  void *values[2];
  void *keys[3];

  keys[2] = *(void **)MEMORY[0x1E0C80C00];
  p_wakeUpCondition = &self->_wakeUpCondition;
  v6 = pthread_cond_init(&self->_wakeUpCondition, 0);
  if (v6)
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a3, 32005, v6, 0, CFSTR("createRelayThreadWithError failed"), CFSTR("pthread_cond_init failed"));
    return 0;
  }
  v7 = pthread_mutex_init(&self->_wakeUpMutex, 0);
  if (v7)
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a3, 32005, v7, 0, CFSTR("createRelayThreadWithError failed"), CFSTR("pthread_mutex_init failed"));
    pthread_cond_destroy(p_wakeUpCondition);
    return 0;
  }
  self->_isRelayRunning = 1;
  v10 = (void *)*MEMORY[0x1E0CA52D0];
  keys[0] = *(void **)MEMORY[0x1E0CA52C8];
  keys[1] = v10;
  v11 = (void *)*MEMORY[0x1E0C9AE40];
  values[0] = CFSTR("com.apple.avconference.audiorelay");
  values[1] = v11;
  v12 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)keys, (const void **)values, 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v13 = FigThreadCreate();
  if (v12)
    CFRelease(v12);
  v8 = v13 == 0;
  if (v13)
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a3, 32005, v13, 0, CFSTR("createRelayThreadWithError failed"), CFSTR("pthread_create failed"));
    pthread_cond_destroy(p_wakeUpCondition);
    pthread_mutex_destroy(&self->_wakeUpMutex);
    self->_isRelayRunning = 0;
  }
  return v8;
}

- (void)stopRelayThread
{
  _opaque_pthread_mutex_t *p_wakeUpMutex;

  if (self->_isRelayRunning)
  {
    self->_isRelayRunning = 0;
    p_wakeUpMutex = &self->_wakeUpMutex;
    pthread_mutex_lock(&self->_wakeUpMutex);
    pthread_cond_signal(&self->_wakeUpCondition);
    pthread_mutex_unlock(p_wakeUpMutex);
    if (self->_relayThread)
    {
      FigThreadJoin();
      self->_relayThread = 0;
    }
    pthread_mutex_destroy(p_wakeUpMutex);
    pthread_cond_destroy(&self->_wakeUpCondition);
  }
}

- (BOOL)createAudioConvertersWithError:(id *)a3
{
  const tagVCAudioFrameFormat *v5;
  uint64_t v6;
  __int128 v7;
  const tagVCAudioFrameFormat *v8;
  uint64_t v9;
  __int128 v10;
  void *v11;
  const tagVCAudioFrameFormat *v12;
  uint64_t v13;
  __int128 v14;
  const tagVCAudioFrameFormat *v15;
  uint64_t v16;
  __int128 v17;
  BOOL result;
  void *v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = -[VCAudioRelayIO clientFormat](self->_remoteIOInfo.relayIO, "clientFormat");
  v6 = *(_QWORD *)&v5->format.mBitsPerChannel;
  v7 = *(_OWORD *)&v5->format.mBytesPerPacket;
  v23 = *(_OWORD *)&v5->format.mSampleRate;
  v24 = v7;
  v25 = v6;
  v8 = -[VCAudioRelayIO clientFormat](self->_clientIOInfo.relayIO, "clientFormat");
  v9 = *(_QWORD *)&v8->format.mBitsPerChannel;
  v10 = *(_OWORD *)&v8->format.mBytesPerPacket;
  v20 = *(_OWORD *)&v8->format.mSampleRate;
  v21 = v10;
  v22 = v9;
  v19 = 0;
  self->_remoteToClientConverter = -[VCAudioRelay newAudioConverterWithInputFormat:outputFormat:withError:](self, "newAudioConverterWithInputFormat:outputFormat:withError:", &v23, &v20, &v19);
  v11 = v19;
  if (v19)
  {
    if (!a3)
      return 0;
    goto LABEL_7;
  }
  v12 = -[VCAudioRelayIO clientFormat](self->_clientIOInfo.relayIO, "clientFormat");
  v13 = *(_QWORD *)&v12->format.mBitsPerChannel;
  v14 = *(_OWORD *)&v12->format.mBytesPerPacket;
  v23 = *(_OWORD *)&v12->format.mSampleRate;
  v24 = v14;
  v25 = v13;
  v15 = -[VCAudioRelayIO clientFormat](self->_remoteIOInfo.relayIO, "clientFormat");
  v16 = *(_QWORD *)&v15->format.mBitsPerChannel;
  v17 = *(_OWORD *)&v15->format.mBytesPerPacket;
  v20 = *(_OWORD *)&v15->format.mSampleRate;
  v21 = v17;
  v22 = v16;
  self->_clientToRemoteConverter = -[VCAudioRelay newAudioConverterWithInputFormat:outputFormat:withError:](self, "newAudioConverterWithInputFormat:outputFormat:withError:", &v23, &v20, &v19);
  if (v19)
  {
    -[VCAudioRelay destroyAudioConverters](self, "destroyAudioConverters");
    if (!a3)
      return 0;
    v11 = v19;
LABEL_7:
    result = 0;
    *a3 = v11;
    return result;
  }
  return 1;
}

- (OpaqueAudioConverter)newAudioConverterWithInputFormat:(AudioStreamBasicDescription *)a3 outputFormat:(AudioStreamBasicDescription *)a4 withError:(id *)a5
{
  OSStatus v8;
  OSStatus v9;
  int inPropertyData;
  AudioConverterRef outAudioConverter[2];

  outAudioConverter[1] = *(AudioConverterRef *)MEMORY[0x1E0C80C00];
  outAudioConverter[0] = 0;
  if (!memcmp(a4, a3, 0x28uLL))
    return 0;
  v8 = AudioConverterNew(a3, a4, outAudioConverter);
  if (v8)
  {
    v9 = v8;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioRelay newAudioConverterWithInputFormat:outputFormat:withError:].cold.2();
    }
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a5, 32005, v9, 0, CFSTR("newAudioConverterFromFormat failed"), CFSTR("AudioConverter new failed"));
    return 0;
  }
  inPropertyData = 2;
  if (AudioConverterSetProperty(outAudioConverter[0], 0x70726D6Du, 4u, &inPropertyData))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioRelay newAudioConverterWithInputFormat:outputFormat:withError:].cold.1();
    }
  }
  return outAudioConverter[0];
}

- (void)destroyAudioConverters
{
  OpaqueAudioConverter *clientToRemoteConverter;
  OpaqueAudioConverter *remoteToClientConverter;

  clientToRemoteConverter = self->_clientToRemoteConverter;
  if (clientToRemoteConverter)
  {
    AudioConverterDispose(clientToRemoteConverter);
    self->_clientToRemoteConverter = 0;
  }
  remoteToClientConverter = self->_remoteToClientConverter;
  if (remoteToClientConverter)
  {
    AudioConverterDispose(remoteToClientConverter);
    self->_remoteToClientConverter = 0;
  }
}

- (void)printStreamFormats
{
  int ErrorLogLevelForModule;
  os_log_t *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315650;
      v10 = v5;
      v11 = 2080;
      v12 = "-[VCAudioRelay printStreamFormats]";
      v13 = 1024;
      v14 = 648;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Remote relay IO:", (uint8_t *)&v9, 0x1Cu);
    }
  }
  -[VCAudioRelayIO printStreamFormats](self->_remoteIOInfo.relayIO, "printStreamFormats");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315650;
      v10 = v7;
      v11 = 2080;
      v12 = "-[VCAudioRelay printStreamFormats]";
      v13 = 1024;
      v14 = 650;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Client relay IO:", (uint8_t *)&v9, 0x1Cu);
    }
  }
  -[VCAudioRelayIO printStreamFormats](self->_clientIOInfo.relayIO, "printStreamFormats");
}

- (float)rmsPowerOfBuffer:(float *)a3 numSamples:(unsigned int)a4
{
  float __C;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  __C = NAN;
  vDSP_rmsqv(a3, 1, &__C, a4);
  return fmax(log10f(__C) * 20.0, -120.0);
}

- (void)forwardSamplesFromIO:(id)a3 toIO:(id)a4 withConverter:(OpaqueAudioConverter *)a5 withHostTime:(double)a6
{
  unsigned int v10;
  double v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  double v15;

  if (a3)
  {
    if (objc_msgSend(a3, "isRunning"))
    {
      v10 = *(_DWORD *)(objc_msgSend(a3, "relayFormat") + 40);
      VCAudioBufferList_SetSampleCount(objc_msgSend(a3, "speakerBuffer"), v10);
      VCAudioBufferList_SetTime(objc_msgSend(a3, "speakerBuffer"), objc_msgSend(a3, "speakerTimestamp"), a6);
      objc_msgSend(a3, "pullAudioSamples:", objc_msgSend(a3, "speakerBuffer"));
      objc_msgSend(a3, "setSpeakerTimestamp:", objc_msgSend(a3, "speakerTimestamp") + v10);
      if (*(_DWORD *)(objc_msgSend(a3, "relayFormat") + 24) == 4)
      {
        *(float *)&v11 = VCAudioBufferList_GetAveragePower(objc_msgSend(a3, "speakerBuffer"));
        objc_msgSend(a3, "setSpeakerPowerRMS:", v11);
      }
    }
  }
  if (a4 && objc_msgSend(a4, "isRunning"))
  {
    v12 = *(_DWORD *)(objc_msgSend(a4, "relayFormat") + 40);
    v13 = objc_msgSend(a4, "micBuffer");
    if (a3 && objc_msgSend(a3, "isRunning"))
    {
      v14 = objc_msgSend(a3, "speakerBuffer");
      if (a5)
        VCAudioBufferList_Convert(v14, objc_msgSend(a4, "micBuffer"), a5);
      else
        v13 = v14;
    }
    else
    {
      VCAudioBufferList_ZeroMemory(v13);
      VCAudioBufferList_SetPriority(v13, 1);
    }
    VCAudioBufferList_SetTime(v13, objc_msgSend(a4, "micTimestamp"), a6);
    VCAudioBufferList_SetSampleCount(v13, v12);
    *(float *)&v15 = VCAudioBufferList_GetAveragePower(v13);
    objc_msgSend(a4, "setMicPowerRMS:", v15);
    objc_msgSend(a4, "pushAudioSamples:", v13);
    objc_msgSend(a4, "setMicTimestamp:", objc_msgSend(a4, "micTimestamp") + v12);
  }
}

- (void)sleepForTime:(timespec *)a3
{
  _opaque_pthread_mutex_t *p_wakeUpMutex;

  p_wakeUpMutex = &self->_wakeUpMutex;
  pthread_mutex_lock(&self->_wakeUpMutex);
  pthread_cond_timedwait_relative_np(&self->_wakeUpCondition, p_wakeUpMutex, a3);
  pthread_mutex_unlock(p_wakeUpMutex);
}

- (void)updateRealTimeStats
{
  float v3;
  float v4;
  float v5;
  float v6;

  ++self->_blocksRelayedCount;
  -[VCAudioRelayIO speakerPowerRMS](-[VCAudioRelay clientIO](self, "clientIO"), "speakerPowerRMS");
  v4 = self->_clientUplinkPowerMovingAverage * 0.8 + v3 * 0.2;
  self->_clientUplinkPowerMovingAverage = v4;
  -[VCAudioRelayIO micPowerRMS](-[VCAudioRelay clientIO](self, "clientIO"), "micPowerRMS");
  v6 = self->_clientDownlinkPowerMovingAverage * 0.8 + v5 * 0.2;
  self->_clientDownlinkPowerMovingAverage = v6;
}

- (void)startPeriodicHealthPrint
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Periodic health print already initialized", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __40__VCAudioRelay_startPeriodicHealthPrint__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t ClockTimeAndGrandmasterIdentityLocalPortForHostTime;
  uint64_t v4;
  NSObject *v5;
  int v6;
  float v7;
  double v8;
  float v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  float v16;
  double v17;
  float v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v1 = objc_msgSend(*(id *)(a1 + 32), "strong");
  if (v1)
  {
    v2 = (void *)v1;
    if (*(_QWORD *)(v1 + 440))
    {
      mach_absolute_time();
      ClockTimeAndGrandmasterIdentityLocalPortForHostTime = TimeSyncClockGetClockTimeAndGrandmasterIdentityLocalPortForHostTime();
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v4 = VRTraceErrorLogLevelToCSTR();
        v5 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v6 = objc_msgSend(v2, "blocksRelayedCount");
          objc_msgSend(v2, "clientUplinkPowerMovingAverage");
          v8 = v7;
          objc_msgSend(v2, "clientDownlinkPowerMovingAverage");
          *(_DWORD *)buf = 136317186;
          v20 = v4;
          v21 = 2080;
          v22 = "-[VCAudioRelay startPeriodicHealthPrint]_block_invoke";
          v23 = 1024;
          v24 = 761;
          v25 = 1024;
          v26 = v6;
          v27 = 2048;
          v28 = v8;
          v29 = 2048;
          v30 = v9;
          v31 = 2048;
          v32 = ClockTimeAndGrandmasterIdentityLocalPortForHostTime;
          v33 = 2048;
          v34 = 0xAAAAAAAAAAAAAAAALL;
          v35 = 1024;
          v36 = 43690;
          v10 = " [%s] %s:%d @=@ Health: VCAudioRelay blocksRelayedCount=%d, clientUplinkPowerMovingAverage=%f, clientDow"
                "nlinkPowerMovingAverage=%f, currentPTPTime=%llu, ptpGMIdentity=%llu, ptpLocalPort=%u";
          v11 = v5;
          v12 = 80;
LABEL_9:
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_msgSend(v2, "blocksRelayedCount");
        objc_msgSend(v2, "clientUplinkPowerMovingAverage");
        v17 = v16;
        objc_msgSend(v2, "clientDownlinkPowerMovingAverage");
        *(_DWORD *)buf = 136316418;
        v20 = v13;
        v21 = 2080;
        v22 = "-[VCAudioRelay startPeriodicHealthPrint]_block_invoke";
        v23 = 1024;
        v24 = 767;
        v25 = 1024;
        v26 = v15;
        v27 = 2048;
        v28 = v17;
        v29 = 2048;
        v30 = v18;
        v10 = " [%s] %s:%d @=@ Health: VCAudioRelay blocksRelayedCount=%d, clientUplinkPowerMovingAverage=%f, clientDownl"
              "inkPowerMovingAverage=%f";
        v11 = v14;
        v12 = 54;
        goto LABEL_9;
      }
    }
  }
}

- (void)relayProcessSamples
{
  _opaque_pthread_mutex_t *p_lock;
  int v4;
  int v5;
  VCAudioRelayIO *relayIO;
  double v7;
  VCAudioRelayIO *v8;
  double v9;

  p_lock = &self->_clientIOInfo.lock;
  v4 = pthread_mutex_trylock(&self->_clientIOInfo.lock);
  v5 = pthread_mutex_trylock(&self->_remoteIOInfo.lock);
  if (v5)
  {
    relayIO = 0;
    if (v4)
      goto LABEL_3;
  }
  else
  {
    relayIO = self->_remoteIOInfo.relayIO;
    if (v4)
    {
LABEL_3:
      v7 = micro();
      -[VCAudioRelay forwardSamplesFromIO:toIO:withConverter:withHostTime:](self, "forwardSamplesFromIO:toIO:withConverter:withHostTime:", relayIO, 0, self->_remoteToClientConverter);
      -[VCAudioRelay forwardSamplesFromIO:toIO:withConverter:withHostTime:](self, "forwardSamplesFromIO:toIO:withConverter:withHostTime:", 0, relayIO, self->_clientToRemoteConverter, v7);
      -[VCAudioRelay updateRealTimeStats](self, "updateRealTimeStats");
      if (v5)
        return;
LABEL_7:
      pthread_mutex_unlock(&self->_remoteIOInfo.lock);
      return;
    }
  }
  v8 = self->_clientIOInfo.relayIO;
  v9 = micro();
  -[VCAudioRelay forwardSamplesFromIO:toIO:withConverter:withHostTime:](self, "forwardSamplesFromIO:toIO:withConverter:withHostTime:", relayIO, v8, self->_remoteToClientConverter);
  -[VCAudioRelay forwardSamplesFromIO:toIO:withConverter:withHostTime:](self, "forwardSamplesFromIO:toIO:withConverter:withHostTime:", v8, relayIO, self->_clientToRemoteConverter, v9);
  -[VCAudioRelay updateRealTimeStats](self, "updateRealTimeStats");
  pthread_mutex_unlock(p_lock);
  if (!v5)
    goto LABEL_7;
}

- (void)relayCallback
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d setRealTimeConstraints() failed with error %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3
{
  VCAudioRelayIO *v5;
  _VCRemoteCodecInfo remoteCodecInfo;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[VCAudioRelay lock](self, "lock");
  -[VCAudioRelay updateRemoteCodecInfo:](self, "updateRemoteCodecInfo:", a3);
  remoteCodecInfo = self->_remoteCodecInfo;
  pthread_mutex_lock(&self->_clientIOInfo.lock);
  v5 = self->_clientIOInfo.relayIO;
  pthread_mutex_unlock(&self->_clientIOInfo.lock);
  -[VCAudioRelay unlock](self, "unlock", remoteCodecInfo);
  -[VCAudioRelayIO didUpdateBasebandCodec:](v5, "didUpdateBasebandCodec:", &remoteCodecInfo);

}

- (BOOL)isRelayRunning
{
  return self->_isRelayRunning;
}

- (double)IOBufferDuration
{
  return self->_IOBufferDuration;
}

- (OpaqueAudioConverter)remoteToClientConverter
{
  return self->_remoteToClientConverter;
}

- (OpaqueAudioConverter)clientToRemoteConverter
{
  return self->_clientToRemoteConverter;
}

- (OS_dispatch_source)periodicHealthPrintDispatchSource
{
  return self->_periodicHealthPrintDispatchSource;
}

- (unsigned)blocksRelayedCount
{
  return self->_blocksRelayedCount;
}

- (float)clientDownlinkPowerMovingAverage
{
  return self->_clientDownlinkPowerMovingAverage;
}

- (float)clientUplinkPowerMovingAverage
{
  return self->_clientUplinkPowerMovingAverage;
}

- (void)setRemoteIO:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (void)setClientIO:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (void)setIOBufferDuration:withError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Trying to set the IO duration while relay is running", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startRelayIO:otherRelayIO:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to restart the other IO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)stopRelayIO:otherRelayIO:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Can't stop: relay IO is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)stopRelayIO:otherRelayIO:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Can't stop: invalid IO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)stopRelayIO:otherRelayIO:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to restart the other IO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startClientIO
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to start client IO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startRemoteIO
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to start remote IO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setNetworkClockID:withError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create PTP clock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setNetworkClockID:withError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Trying to set network clock while relay is running", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newAudioConverterWithInputFormat:outputFormat:withError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d AudioConverterSetProperty(kAudioConverterPrimeMethod) failed with error %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)newAudioConverterWithInputFormat:outputFormat:withError:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d newAudioConverterFromFormat failed with error %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

@end
