@implementation APAVAudioSessionManager

- (APAVAudioSessionManager)initWithType:(unint64_t)a3
{
  APAVAudioSessionManager *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)APAVAudioSessionManager;
  v4 = -[APAVAudioSessionManager init](&v6, sel_init);
  if (v4)
  {
    v4->_mutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v4->_session = 0;
    v4->_type = a3;
    v4->_forceRAW = APSSettingsGetIntWithDefault() != 0;
    if (gLogCategory_APAVAudioSessionManager <= 50
      && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  FigSimpleMutexDestroy();

  v3.receiver = self;
  v3.super_class = (Class)APAVAudioSessionManager;
  -[APAVAudioSessionManager dealloc](&v3, sel_dealloc);
}

- (AVAudioSession)session
{
  AVAudioSession *session;

  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  if (self->_isSetUp)
  {
    session = self->_session;
  }
  else
  {
    APSLogErrorAt();
    if (gLogCategory_APAVAudioSessionManager <= 60
      && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    session = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
  return session;
}

- (void)setUpSessionWithIsMixable:(BOOL)a3
{
  uint64_t v3;
  unint64_t type;
  const char *v6;
  const char *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int Int64;
  unsigned int v14;
  void *session;
  AVAudioSession *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  LODWORD(v3) = a3;
  v21 = 0;
  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  if (!self->_isSetUp)
  {
    if (gLogCategory_APAVAudioSessionManager <= 50
      && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
    {
      type = self->_type;
      v6 = "?";
      if (type == 1)
        v6 = "Ambient";
      if (type)
        v7 = v6;
      else
        v7 = "Media";
      v17 = v7;
      v19 = v3;
      session = self;
      LogPrintF();
    }
    v8 = self->_type;
    if (v8 == 1)
    {
      self->_session = (AVAudioSession *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1858]), "initAuxiliarySession");
      v3 = 1;
    }
    else if (v8)
    {
      v3 = 0;
    }
    else
    {
      self->_session = (AVAudioSession *)(id)objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
      v3 = v3;
    }
    if (self->_forceRAW)
    {
      if (gLogCategory_APAVAudioSessionManager <= 50
        && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
      {
        session = self->_session;
        LogPrintF();
      }
      v9 = *MEMORY[0x24BDB15A0];
      v10 = *MEMORY[0x24BDB1630];
    }
    else
    {
      v9 = *MEMORY[0x24BDB15A8];
      v10 = *MEMORY[0x24BDB1618];
    }
    v11 = -[AVAudioSession setMXSessionProperty:value:error:](self->_session, "setMXSessionProperty:value:error:", *MEMORY[0x24BE64B08], MEMORY[0x24BDBD1C8], &v21, session, v17, v19);
    if (gLogCategory_APAVAudioSessionManager <= 50)
    {
      v12 = v11;
      if (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize())
      {
        v18 = v12;
        v20 = v21;
        v16 = self->_session;
        LogPrintF();
      }
    }
    if (self->_type || !APSMultiPrimariesEnabled())
      -[AVAudioSession setCategory:mode:routeSharingPolicy:options:error:](self->_session, "setCategory:mode:routeSharingPolicy:options:error:", v9, v10, 0, v3, 0, v16, v18, v20);
    else
      -[AVAudioSession setCategory:mode:options:error:](self->_session, "setCategory:mode:options:error:", v9, v10, v3, 0);
    Int64 = APSSettingsGetInt64();
    if (Int64)
    {
      v21 = 0;
      if (-[AVAudioSession setPreferredSampleRate:error:](self->_session, "setPreferredSampleRate:error:", &v21, (double)Int64))
      {
        if (gLogCategory_APAVAudioSessionManager <= 50
          && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
        {
LABEL_38:
          LogPrintF();
        }
      }
      else if (gLogCategory_APAVAudioSessionManager <= 60
             && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_38;
      }
    }
    v14 = APSSettingsGetInt64();
    if (v14)
    {
      v21 = 0;
      if (-[AVAudioSession setPreferredIOBufferFrameSize:error:](self->_session, "setPreferredIOBufferFrameSize:error:", v14, &v21))
      {
        if (gLogCategory_APAVAudioSessionManager > 50
          || gLogCategory_APAVAudioSessionManager == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_53;
        }
      }
      else if (gLogCategory_APAVAudioSessionManager > 60
             || gLogCategory_APAVAudioSessionManager == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_53;
      }
      LogPrintF();
    }
LABEL_53:
    self->_isSetUp = 1;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
}

- (void)resetSession
{
  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  if (self->_isSetUp)
  {
    if (gLogCategory_APAVAudioSessionManager <= 50
      && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    self->_session = 0;
    self->_isSetUp = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
}

- (BOOL)setAudioMode:(__CFString *)a3 isLongForm:(BOOL)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v9;
  int v10;
  unint64_t type;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _BOOL4 v16;
  unint64_t v19;
  const char *v20;
  const char *v21;
  void *session;
  const char *v23;
  __CFString *v24;

  LODWORD(v6) = a4;
  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  if (self->_isSetUp)
  {
    v9 = *MEMORY[0x24BDB1618];
    if (APSSettingsGetIntWithDefault())
      v10 = 1;
    else
      v10 = _os_feature_enabled_impl();
    type = self->_type;
    if (type == 1)
    {
      v6 = 0;
      goto LABEL_14;
    }
    if (!type)
    {
      if (a3 == CFSTR("moviePlayback"))
        goto LABEL_10;
      if (!a3)
      {
LABEL_12:
        v6 = v6;
LABEL_14:
        if (self->_forceRAW)
        {
          if (gLogCategory_APAVAudioSessionManager <= 50
            && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
          {
            session = self->_session;
            LogPrintF();
          }
          v15 = *MEMORY[0x24BDB15A0];
          v9 = *MEMORY[0x24BDB1630];
        }
        else
        {
          v15 = *MEMORY[0x24BDB15A8];
        }
        if (self->_type || !APSMultiPrimariesEnabled())
          v16 = -[AVAudioSession setCategory:mode:routeSharingPolicy:options:error:](self->_session, "setCategory:mode:routeSharingPolicy:options:error:", v15, v9, v6, -[AVAudioSession categoryOptions](self->_session, "categoryOptions", session, v23, v24), a5);
        else
          v16 = -[AVAudioSession setCategory:mode:options:error:](self->_session, "setCategory:mode:options:error:", v15, v9, -[AVAudioSession categoryOptions](self->_session, "categoryOptions"), a5);
        v14 = v16;
        if (v9 == *MEMORY[0x24BDB1640] && v16)
        {
          v14 = -[AVAudioSession setMXSessionProperty:value:error:](self->_session, "setMXSessionProperty:value:error:", *MEMORY[0x24BE64B10], MEMORY[0x24BDBD1C8], a5);
          if (gLogCategory_APAVAudioSessionManager <= 50
            && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
        }
        pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
        return v14;
      }
      if (CFEqual(a3, CFSTR("moviePlayback")))
      {
LABEL_10:
        v12 = (uint64_t *)MEMORY[0x24BDB1628];
      }
      else
      {
        if (!v10 || a3 != CFSTR("spokenAudio") && !CFEqual(a3, CFSTR("spokenAudio")))
          goto LABEL_12;
        if (gLogCategory_APAVAudioSessionManager <= 50
          && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
        {
          v19 = self->_type;
          v20 = "?";
          if (v19 == 1)
            v20 = "Ambient";
          if (v19)
            v21 = v20;
          else
            v21 = "Media";
          v23 = v21;
          v24 = a3;
          session = self;
          LogPrintF();
        }
        v12 = (uint64_t *)MEMORY[0x24BDB1640];
      }
      v9 = *v12;
      goto LABEL_12;
    }
    v13 = -6756;
  }
  else
  {
    APSLogErrorAt();
    if (gLogCategory_APAVAudioSessionManager <= 60
      && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v13 = -6718;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
  v14 = 0;
  if (a5)
    *a5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], v13, 0);
  return v14;
}

- (BOOL)setPrefersMultichannelAudio:(unsigned __int8)a3 error:(id *)a4
{
  _BOOL4 isSetUp;
  uint64_t v7;

  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  isSetUp = self->_isSetUp;
  if (self->_isSetUp)
  {
    v7 = 0;
  }
  else
  {
    APSLogErrorAt();
    if (gLogCategory_APAVAudioSessionManager <= 60
      && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v7 = -6718;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
  if (a4 && !isSetUp)
    *a4 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], v7, 0);
  return isSetUp;
}

- (BOOL)setActive:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  BOOL v7;

  v5 = a3;
  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  if (self->_isSetUp)
  {
    v7 = -[AVAudioSession setActive:error:](self->_session, "setActive:error:", v5, a4);
  }
  else
  {
    if (gLogCategory_APAVAudioSessionManager <= 60
      && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v7 = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
  return v7;
}

- (BOOL)setDuckOthers:(unsigned __int8)a3 error:(id *)a4
{
  int v5;
  uint64_t *v7;
  uint64_t v8;
  _QWORD *v9;
  BOOL v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  APAVAudioSessionManager *v17;
  const char *v18;

  v5 = a3;
  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  if (!self->_isSetUp)
  {
    if (gLogCategory_APAVAudioSessionManager <= 90
      && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
    {
      v17 = self;
      v18 = "-[APAVAudioSessionManager setDuckOthers:error:]";
      LogPrintF();
    }
    if (!a4)
      goto LABEL_29;
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BDD1100];
    v15 = -6718;
LABEL_27:
    v11 = 0;
    *a4 = (id)objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, v15, 0, v17, v18);
    goto LABEL_30;
  }
  if (self->_type != 1)
  {
    if (gLogCategory_APAVAudioSessionManager <= 90
      && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
    {
      v17 = self;
      LogPrintF();
    }
    if (!a4)
      goto LABEL_29;
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BDD1100];
    v15 = -6735;
    goto LABEL_27;
  }
  if (self->_forceRAW)
    v7 = (uint64_t *)MEMORY[0x24BDB15A0];
  else
    v7 = (uint64_t *)MEMORY[0x24BDB15A8];
  v8 = *v7;
  v9 = (_QWORD *)MEMORY[0x24BDB1630];
  if (!self->_forceRAW)
    v9 = (_QWORD *)MEMORY[0x24BDB1618];
  v10 = v5 == 0;
  v11 = 1;
  if (v10)
    v12 = 1;
  else
    v12 = 2;
  if (!-[AVAudioSession setCategory:mode:routeSharingPolicy:options:error:](self->_session, "setCategory:mode:routeSharingPolicy:options:error:", v8, *v9, 0, v12, a4))
  {
    if (gLogCategory_APAVAudioSessionManager <= 90
      && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
LABEL_29:
    v11 = 0;
  }
LABEL_30:
  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
  return v11;
}

- (BOOL)setPreferredOutputNumberOfChannels:(int64_t)a3 error:(id *)a4
{
  _BOOL4 isSetUp;
  uint64_t v7;

  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  isSetUp = self->_isSetUp;
  if (self->_isSetUp)
  {
    v7 = 0;
  }
  else
  {
    APSLogErrorAt();
    if (gLogCategory_APAVAudioSessionManager <= 60
      && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v7 = -6718;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
  if (a4 && !isSetUp)
    *a4 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], v7, 0);
  return isSetUp;
}

- (BOOL)setPreferredHardwareFormat:(int64_t)a3 error:(id *)a4
{
  _BOOL4 isSetUp;
  uint64_t v7;

  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  isSetUp = self->_isSetUp;
  if (self->_isSetUp)
  {
    v7 = 0;
  }
  else
  {
    APSLogErrorAt();
    if (gLogCategory_APAVAudioSessionManager <= 60
      && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v7 = -6718;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
  if (a4 && !isSetUp)
    *a4 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], v7, 0);
  return isSetUp;
}

+ (APAVAudioSessionManager)mediaSessionManager
{
  if (mediaSessionManager_onceToken != -1)
    dispatch_once(&mediaSessionManager_onceToken, &__block_literal_global_652);
  return (APAVAudioSessionManager *)mediaSessionManager_sessionManager;
}

+ (APAVAudioSessionManager)ambientSessionManager
{
  if (ambientSessionManager_onceToken != -1)
    dispatch_once(&ambientSessionManager_onceToken, &__block_literal_global_3);
  return (APAVAudioSessionManager *)ambientSessionManager_sessionManager;
}

APAVAudioSessionManager *__48__APAVAudioSessionManager_ambientSessionManager__block_invoke()
{
  APAVAudioSessionManager *result;

  result = -[APAVAudioSessionManager initWithType:]([APAVAudioSessionManager alloc], "initWithType:", 1);
  ambientSessionManager_sessionManager = (uint64_t)result;
  return result;
}

APAVAudioSessionManager *__46__APAVAudioSessionManager_mediaSessionManager__block_invoke()
{
  APAVAudioSessionManager *result;

  result = -[APAVAudioSessionManager initWithType:]([APAVAudioSessionManager alloc], "initWithType:", 0);
  mediaSessionManager_sessionManager = (uint64_t)result;
  return result;
}

@end
