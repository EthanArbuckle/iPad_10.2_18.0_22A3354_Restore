@implementation CSAttSiriAudioSessionStateClient

- (CSAttSiriAudioSessionStateClient)initWithDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  CSAttSiriAudioSessionStateClient *v6;
  CSAttSiriAudioSessionStateClient *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *stateNotificationQueue;
  id v10;
  void *v11;
  uint64_t v12;
  AFNotifyObserver *siriStateObserver;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[CSAttSiriAudioSessionStateClient initWithDelegate:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v15.receiver = self;
  v15.super_class = (Class)CSAttSiriAudioSessionStateClient;
  v6 = -[CSAttSiriAudioSessionStateClient init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_delegate, v4);
    *(_DWORD *)&v7->_isSpeaking = 0;
    v8 = dispatch_queue_create("SiriStateNotificationListener", 0);
    stateNotificationQueue = v7->_stateNotificationQueue;
    v7->_stateNotificationQueue = (OS_dispatch_queue *)v8;

    v10 = objc_alloc(MEMORY[0x1E0CFE958]);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", "com.apple.siri.client-state-changed");
    v12 = objc_msgSend(v10, "initWithName:options:queue:delegate:", v11, 1, v7->_stateNotificationQueue, v7);
    siriStateObserver = v7->_siriStateObserver;
    v7->_siriStateObserver = (AFNotifyObserver *)v12;

  }
  return v7;
}

- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4
{
  AFNotifyObserver *v6;
  os_log_t *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = (AFNotifyObserver *)a3;
  v7 = (os_log_t *)MEMORY[0x1E0D18F60];
  v8 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[CSAttSiriAudioSessionStateClient notifyObserver:didReceiveNotificationWithToken:]";
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v10, 0xCu);
  }
  if (self->_siriStateObserver == v6)
  {
    v9 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315394;
      v11 = "-[CSAttSiriAudioSessionStateClient notifyObserver:didReceiveNotificationWithToken:]";
      v12 = 1024;
      v13 = a4;
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s token:%d", (uint8_t *)&v10, 0x12u);
    }
  }

}

- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5
{
  AFNotifyObserver *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  unint64_t v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = (AFNotifyObserver *)a3;
  v9 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315650;
    v11 = "-[CSAttSiriAudioSessionStateClient notifyObserver:didChangeStateFrom:to:]";
    v12 = 2048;
    v13 = a4;
    v14 = 2048;
    v15 = a5;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s fromState:%llu, toState:%llu", (uint8_t *)&v10, 0x20u);
  }
  if (self->_siriStateObserver == v8)
    -[CSAttSiriAudioSessionStateClient dispatchStateChangedFrom:to:](self, "dispatchStateChangedFrom:to:", a4, a5);

}

- (void)dispatchStateChangedFrom:(unint64_t)a3 to:(unint64_t)a4
{
  int v5;
  os_log_t *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  unsigned __int8 v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  int v15;
  id WeakRetained;
  char v17;
  id v18;
  _BOOL4 isActiveSession;
  id v20;
  char v21;
  NSObject *v22;
  _BOOL4 isSpeaking;
  NSObject *v24;
  id v25;
  char v26;
  id v27;
  CSAttSiriSessionStateDelegate **p_delegate;
  id v29;
  void *v30;
  id v31;
  char v32;
  id v33;
  int v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v5 = a3;
  v40 = *MEMORY[0x1E0C80C00];
  v7 = (os_log_t *)MEMORY[0x1E0D18F60];
  v8 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v34 = 136315138;
    v35 = "-[CSAttSiriAudioSessionStateClient dispatchStateChangedFrom:to:]";
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v34, 0xCu);
  }
  if (((a4 ^ v5) & 2) != 0)
  {
    v9 = (v5 & 2) == 0 && (a4 >> 1) & 1;
    self->_isActiveSession = v9;
    v10 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v34 = 136315394;
      v35 = "-[CSAttSiriAudioSessionStateClient dispatchStateChangedFrom:to:]";
      v36 = 1024;
      v37 = v9;
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s SiriState - isActiveSession:%d", (uint8_t *)&v34, 0x12u);
    }
  }
  if (((a4 ^ v5) & 1) != 0)
  {
    v11 = v5 | ((a4 & 1) == 0);
    self->_isActiveRequest = (v11 ^ 1) & 1;
    v12 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v34 = 136315394;
      v35 = "-[CSAttSiriAudioSessionStateClient dispatchStateChangedFrom:to:]";
      v36 = 1024;
      v37 = (v11 ^ 1) & 1;
      _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s SiriState - isActiveRequest:%d", (uint8_t *)&v34, 0x12u);
    }
  }
  else
  {
    v11 = 0;
  }
  if (((a4 ^ v5) & 4) != 0)
  {
    v13 = (v5 & 4) == 0 && (a4 >> 2) & 1;
    self->_isListening = v13;
    v14 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v34 = 136315394;
      v35 = "-[CSAttSiriAudioSessionStateClient dispatchStateChangedFrom:to:]";
      v36 = 1024;
      v37 = v13;
      _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s SiriState - isListening:%d", (uint8_t *)&v34, 0x12u);
    }
  }
  if (((a4 ^ v5) & 8) == 0)
  {
    v15 = 0;
    goto LABEL_32;
  }
  if ((v5 & 8) == 0 && (a4 & 8) != 0)
  {
    self->_isSpeaking = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) == 0)
    {
      isActiveSession = 0;
      goto LABEL_29;
    }
    v18 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v18, "notifySiriSessionStateTTSOngoing:", 1);
    isActiveSession = 0;
    goto LABEL_27;
  }
  self->_isSpeaking = 0;
  isActiveSession = self->_isActiveSession;
  v20 = objc_loadWeakRetained((id *)&self->_delegate);
  v21 = objc_opt_respondsToSelector();

  if ((v21 & 1) != 0)
  {
    v18 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v18, "notifySiriSessionStateTTSOngoing:", 0);
LABEL_27:

  }
LABEL_29:
  v22 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    isSpeaking = self->_isSpeaking;
    v34 = 136315394;
    v35 = "-[CSAttSiriAudioSessionStateClient dispatchStateChangedFrom:to:]";
    v36 = 1024;
    v37 = isSpeaking;
    _os_log_impl(&dword_1C2614000, v22, OS_LOG_TYPE_DEFAULT, "%s SiriState - isSpeaking:%d", (uint8_t *)&v34, 0x12u);
  }
  v15 = isActiveSession;
LABEL_32:
  v24 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    v34 = 136315650;
    v35 = "-[CSAttSiriAudioSessionStateClient dispatchStateChangedFrom:to:]";
    v36 = 1024;
    v37 = v15;
    v38 = 1024;
    v39 = v11 & 1;
    _os_log_impl(&dword_1C2614000, v24, OS_LOG_TYPE_DEFAULT, "%s tts Finished:%u isRequestCompleted:%u", (uint8_t *)&v34, 0x18u);
  }
  if (v15)
  {
    v25 = objc_loadWeakRetained((id *)&self->_delegate);
    v26 = objc_opt_respondsToSelector();

    if ((v26 & 1) != 0)
    {
      v27 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v27, "notifySiriSessionStateChange:", 1);

    }
  }
  if ((v11 & 1) != 0 && (self->_isSpeaking & ~v15) == 0)
  {
    p_delegate = &self->_delegate;
    v29 = objc_loadWeakRetained((id *)p_delegate);
    if (v29)
    {
      v30 = v29;
      v31 = objc_loadWeakRetained((id *)p_delegate);
      v32 = objc_opt_respondsToSelector();

      if ((v32 & 1) != 0)
      {
        v33 = objc_loadWeakRetained((id *)p_delegate);
        objc_msgSend(v33, "notifyRequestCompletion");

      }
    }
  }
}

- (CSAttSiriSessionStateDelegate)delegate
{
  return (CSAttSiriSessionStateDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (AFNotifyObserver)siriStateObserver
{
  return self->_siriStateObserver;
}

- (void)setSiriStateObserver:(id)a3
{
  objc_storeStrong((id *)&self->_siriStateObserver, a3);
}

- (OS_dispatch_queue)stateNotificationQueue
{
  return self->_stateNotificationQueue;
}

- (void)setStateNotificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_stateNotificationQueue, a3);
}

- (BOOL)isSpeaking
{
  return self->_isSpeaking;
}

- (void)setIsSpeaking:(BOOL)a3
{
  self->_isSpeaking = a3;
}

- (BOOL)isListening
{
  return self->_isListening;
}

- (void)setIsListening:(BOOL)a3
{
  self->_isListening = a3;
}

- (BOOL)isActiveRequest
{
  return self->_isActiveRequest;
}

- (void)setIsActiveRequest:(BOOL)a3
{
  self->_isActiveRequest = a3;
}

- (BOOL)isActiveSession
{
  return self->_isActiveSession;
}

- (void)setIsActiveSession:(BOOL)a3
{
  self->_isActiveSession = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateNotificationQueue, 0);
  objc_storeStrong((id *)&self->_siriStateObserver, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
