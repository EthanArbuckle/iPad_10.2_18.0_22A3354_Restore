@implementation ANAudioSessionManager

- (ANAudioSessionManager)initWithAudioSession:(id)a3 queue:(id)a4 endpointID:(id)a5
{
  id v9;
  id v10;
  id v11;
  ANAudioSessionManager *v12;
  ANAudioSessionManager *v13;
  OS_dispatch_queue *v14;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v16;
  id v17;
  uint64_t v18;
  OS_os_log *log;
  ANTelephonyObserver *v20;
  ANTelephonyObserver *telephonyObserver;
  id waitForCallEndCompletion;
  ANTimer *callEndTimer;
  objc_super v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)ANAudioSessionManager;
  v12 = -[ANAudioSessionManager init](&v25, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_audioSession, a3);
    if (v10)
    {
      v14 = (OS_dispatch_queue *)v10;
      queue = v13->_queue;
      v13->_queue = v14;
    }
    else
    {
      v16 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
      v17 = MEMORY[0x1E0C80D38];
      queue = v13->_queue;
      v13->_queue = v16;
    }

    ANLogBuildCategoryName();
    ANLogWithCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    log = v13->_log;
    v13->_log = (OS_os_log *)v18;

    objc_storeStrong((id *)&v13->_endpointUUID, a5);
    v20 = -[ANTelephonyObserver initWithQueue:]([ANTelephonyObserver alloc], "initWithQueue:", v13->_queue);
    telephonyObserver = v13->_telephonyObserver;
    v13->_telephonyObserver = v20;

    waitForCallEndCompletion = v13->_waitForCallEndCompletion;
    v13->_waitForCallEndCompletion = 0;

    callEndTimer = v13->_callEndTimer;
    v13->_callEndTimer = 0;

  }
  return v13;
}

- (void)dealloc
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D23A0000, log, OS_LOG_TYPE_DEBUG, "Released", v1, 2u);
}

- (BOOL)activateAudioSessionWithError:(id *)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[ANAudioSessionManager deactivationTimer](self, "deactivationTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ANAudioSessionManager deactivationTimer](self, "deactivationTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancel");

    -[ANAudioSessionManager setActivationRetryTimer:](self, "setActivationRetryTimer:", 0);
    -[ANAudioSessionManager log](self, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1D23A0000, v7, OS_LOG_TYPE_DEFAULT, "Canceled pending audio session deactivation", (uint8_t *)&v20, 2u);
    }

  }
  -[ANAudioSessionManager audioSession](self, "audioSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "setActive:error:", 1, a3);

  -[ANAudioSessionManager log](self, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((v9 & 1) != 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[ANAudioSessionManager audioSession](self, "audioSession");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v12;
      _os_log_impl(&dword_1D23A0000, v11, OS_LOG_TYPE_DEFAULT, "Activated Audio Session %@", (uint8_t *)&v20, 0xCu);

    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    -[ANAudioSessionManager activateAudioSessionWithError:].cold.1((uint64_t)a3, v11, v13, v14, v15, v16, v17, v18);
  }

  return v9;
}

- (void)activateAudioSessionWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ANAudioSessionManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__ANAudioSessionManager_activateAudioSessionWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E938F8E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __67__ANAudioSessionManager_activateAudioSessionWithCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCanRetryAudioSessionActivation:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_activateAudioSessionWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

- (void)deactivateAudioSessionAfterDelay:(double)a3
{
  void *v5;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[ANAudioSessionManager deactivationTimer](self, "deactivationTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ANAudioSessionManager log](self, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D23A0000, v6, OS_LOG_TYPE_DEFAULT, "Request to deactivate audio session when deactivation already in progress. Ignoring.", buf, 2u);
    }

  }
  else
  {
    -[ANAudioSessionManager log](self, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (a3 <= 0.0)
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D23A0000, v7, OS_LOG_TYPE_DEFAULT, "Will deactivate audio session immediately", buf, 2u);
      }

      -[ANAudioSessionManager _deactivateAudioSession](self, "_deactivateAudioSession");
    }
    else
    {
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v9;
        _os_log_impl(&dword_1D23A0000, v7, OS_LOG_TYPE_DEFAULT, "Will deactivate audio session in (%@) seconds", buf, 0xCu);

      }
      v10 = (void *)MEMORY[0x1E0CF7E90];
      -[ANAudioSessionManager makeTimerIdentifier](self, "makeTimerIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timerWithLabel:identifier:", CFSTR("AudioSessionDeactivation"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ANAudioSessionManager setDeactivationTimer:](self, "setDeactivationTimer:", v12);

      objc_initWeak((id *)buf, self);
      -[ANAudioSessionManager deactivationTimer](self, "deactivationTimer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ANAudioSessionManager queue](self, "queue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __58__ANAudioSessionManager_deactivateAudioSessionAfterDelay___block_invoke;
      v15[3] = &unk_1E938F518;
      objc_copyWeak(&v16, (id *)buf);
      objc_msgSend(v13, "startWithValue:queue:handler:", v14, v15, a3);

      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __58__ANAudioSessionManager_deactivateAudioSessionAfterDelay___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "deactivationTimer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cancel");

  objc_msgSend(WeakRetained, "setDeactivationTimer:", 0);
  objc_msgSend(WeakRetained, "_deactivateAudioSession");

}

- (id)makeTimerIdentifier
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[ANAudioSessionManager endpointUUID](self, "endpointUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (void)_activateAudioSessionWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ANAudioSessionManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[ANAudioSessionManager endpointUUID](self, "endpointUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ANAudioSessionManager endpointUUID](self, "endpointUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "an_isLocalDevice");

    if (!v8)
      goto LABEL_7;
  }
  -[ANAudioSessionManager telephonyObserver](self, "telephonyObserver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasCalls");

  if (v10)
  {
    -[ANAudioSessionManager log](self, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = _Block_copy(v4);
      *(_DWORD *)buf = 138412290;
      v37 = v12;
      _os_log_impl(&dword_1D23A0000, v11, OS_LOG_TYPE_DEFAULT, "There is an active call, wait for call to end then call completion handler: %@", buf, 0xCu);

    }
    -[ANAudioSessionManager setWaitForCallEndCompletion:](self, "setWaitForCallEndCompletion:", v4);
  }
  else
  {
LABEL_7:
    v35 = 0;
    -[ANAudioSessionManager activateAudioSessionWithError:](self, "activateAudioSessionWithError:", &v35);
    v13 = v35;
    if (objc_msgSend(v13, "code") == 561017449
      && -[ANAudioSessionManager canRetryAudioSessionActivation](self, "canRetryAudioSessionActivation"))
    {
      objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "numberForDefault:", *MEMORY[0x1E0CF7B10]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "doubleValue");
      v17 = v16;

      -[ANAudioSessionManager log](self, "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[ANAudioSessionManager _activateAudioSessionWithCompletionHandler:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);

      -[ANAudioSessionManager activationRetryTimer](self, "activationRetryTimer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "cancel");

      -[ANAudioSessionManager setCanRetryAudioSessionActivation:](self, "setCanRetryAudioSessionActivation:", 0);
      v27 = (void *)MEMORY[0x1E0CF7E90];
      -[ANAudioSessionManager makeTimerIdentifier](self, "makeTimerIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "timerWithLabel:identifier:", CFSTR("AudioSessionActivationRetry"), v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[ANAudioSessionManager setActivationRetryTimer:](self, "setActivationRetryTimer:", v29);

      objc_initWeak((id *)buf, self);
      -[ANAudioSessionManager activationRetryTimer](self, "activationRetryTimer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[ANAudioSessionManager queue](self, "queue");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __68__ANAudioSessionManager__activateAudioSessionWithCompletionHandler___block_invoke;
      v32[3] = &unk_1E938F908;
      objc_copyWeak(&v34, (id *)buf);
      v33 = v4;
      objc_msgSend(v30, "startWithValue:queue:handler:", v31, v32, v17);

      objc_destroyWeak(&v34);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      (*((void (**)(id, id))v4 + 2))(v4, v13);
    }

  }
}

void __68__ANAudioSessionManager__activateAudioSessionWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_activateAudioSessionWithCompletionHandler:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "activationRetryTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (void)_deactivateAudioSession
{
  OUTLINED_FUNCTION_0(&dword_1D23A0000, a2, a3, "Failed to deactivate Audio Session. Error = %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)setWaitForCallEndCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  ANTimer *v7;
  void *v8;
  NSObject *v9;
  ANTimer *callEndTimer;
  ANTimer *v11;
  id waitForCallEndCompletion;
  NSObject *v13;
  ANTimer *v14;
  void *v15;
  void (**v16)(id, void *);
  void *v17;
  void *v18;
  int v19;
  ANTimer *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ANAudioSessionManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[ANAudioSessionManager log](self, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (ANTimer *)_Block_copy(self->_waitForCallEndCompletion);
    v8 = _Block_copy(v4);
    v19 = 138412546;
    v20 = v7;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_1D23A0000, v6, OS_LOG_TYPE_DEFAULT, "Set wait for call end completion \n old handler: %@ \n new handler: %@", (uint8_t *)&v19, 0x16u);

  }
  -[ANAudioSessionManager log](self, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    callEndTimer = self->_callEndTimer;
    v19 = 138412290;
    v20 = callEndTimer;
    _os_log_impl(&dword_1D23A0000, v9, OS_LOG_TYPE_DEFAULT, "Call end timer set to nil [%@]", (uint8_t *)&v19, 0xCu);
  }

  v11 = self->_callEndTimer;
  self->_callEndTimer = 0;

  waitForCallEndCompletion = self->_waitForCallEndCompletion;
  if (v4)
  {
    if (waitForCallEndCompletion)
    {
      -[ANAudioSessionManager log](self, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (ANTimer *)_Block_copy(self->_waitForCallEndCompletion);
        v15 = _Block_copy(v4);
        v19 = 138412546;
        v20 = v14;
        v21 = 2112;
        v22 = v15;
        _os_log_impl(&dword_1D23A0000, v13, OS_LOG_TYPE_DEFAULT, "Existing call end completion handler, replacing with new handler.\n old handler: %@ \n new handler: %@", (uint8_t *)&v19, 0x16u);

      }
      v16 = (void (**)(id, void *))self->_waitForCallEndCompletion;
      objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:", 1018);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2](v16, v17);

    }
    -[ANAudioSessionManager startCallEndTimer](self, "startCallEndTimer");
    v18 = _Block_copy(v4);
    waitForCallEndCompletion = self->_waitForCallEndCompletion;
  }
  else
  {
    v18 = 0;
  }
  self->_waitForCallEndCompletion = v18;

}

- (void)startCallEndTimer
{
  NSObject *v3;
  void *v4;
  void *v5;
  ANTimer *v6;
  ANTimer *callEndTimer;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  ANTimer *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[ANAudioSessionManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x1E0CF7E90];
  -[ANAudioSessionManager makeTimerIdentifier](self, "makeTimerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timerWithLabel:identifier:", CFSTR("CallEndTimer"), v5);
  v6 = (ANTimer *)objc_claimAutoreleasedReturnValue();
  callEndTimer = self->_callEndTimer;
  self->_callEndTimer = v6;

  -[ANAudioSessionManager log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[ANAudioSessionManager callEndTimer](self, "callEndTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v9;
    _os_log_impl(&dword_1D23A0000, v8, OS_LOG_TYPE_DEFAULT, "Call End Timer Created [%@]", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberForDefault:", *MEMORY[0x1E0CF7B28]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  v14 = self->_callEndTimer;
  -[ANAudioSessionManager queue](self, "queue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __42__ANAudioSessionManager_startCallEndTimer__block_invoke;
  v16[3] = &unk_1E938F518;
  objc_copyWeak(&v17, (id *)buf);
  -[ANTimer startWithValue:queue:handler:](v14, "startWithValue:queue:handler:", v15, v16, v13);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __42__ANAudioSessionManager_startCallEndTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "callEndTimer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1D23A0000, v2, OS_LOG_TYPE_DEFAULT, "Call End Timer Fired [%@]", buf, 0xCu);

  }
  objc_msgSend(WeakRetained, "waitForCallEndCompletion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v7 = 0;
    objc_msgSend(WeakRetained, "activateAudioSessionWithError:", &v7);
    v5 = v7;
    objc_msgSend(WeakRetained, "waitForCallEndCompletion");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v5);

    objc_msgSend(WeakRetained, "setWaitForCallEndCompletion:", 0);
  }

}

- (void)observer:(id)a3 didUpdateActiveCallStatus:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  void *v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;
  uint8_t buf[4];
  _BOOL4 v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x1E0C80C00];
  -[ANAudioSessionManager log](self, "log", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v12 = v4;
    _os_log_impl(&dword_1D23A0000, v6, OS_LOG_TYPE_DEFAULT, "CallIsActive changed to %d", buf, 8u);
  }

  -[ANAudioSessionManager waitForCallEndCompletion](self, "waitForCallEndCompletion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (!v4)
    {
      v10 = 0;
      -[ANAudioSessionManager activateAudioSessionWithError:](self, "activateAudioSessionWithError:", &v10);
      v8 = v10;
      -[ANAudioSessionManager waitForCallEndCompletion](self, "waitForCallEndCompletion");
      v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v9)[2](v9, v8);

      -[ANAudioSessionManager setWaitForCallEndCompletion:](self, "setWaitForCallEndCompletion:", 0);
    }
  }
}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSUUID)endpointUUID
{
  return self->_endpointUUID;
}

- (OS_os_log)log
{
  return self->_log;
}

- (ANTimer)deactivationTimer
{
  return self->_deactivationTimer;
}

- (void)setDeactivationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_deactivationTimer, a3);
}

- (ANTimer)activationRetryTimer
{
  return self->_activationRetryTimer;
}

- (void)setActivationRetryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_activationRetryTimer, a3);
}

- (BOOL)canRetryAudioSessionActivation
{
  return self->_canRetryAudioSessionActivation;
}

- (void)setCanRetryAudioSessionActivation:(BOOL)a3
{
  self->_canRetryAudioSessionActivation = a3;
}

- (ANTelephonyObserver)telephonyObserver
{
  return self->_telephonyObserver;
}

- (id)waitForCallEndCompletion
{
  return self->_waitForCallEndCompletion;
}

- (ANTimer)callEndTimer
{
  return self->_callEndTimer;
}

- (void)setCallEndTimer:(id)a3
{
  objc_storeStrong((id *)&self->_callEndTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callEndTimer, 0);
  objc_storeStrong(&self->_waitForCallEndCompletion, 0);
  objc_storeStrong((id *)&self->_telephonyObserver, 0);
  objc_storeStrong((id *)&self->_activationRetryTimer, 0);
  objc_storeStrong((id *)&self->_deactivationTimer, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
}

- (void)activateAudioSessionWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D23A0000, a2, a3, "Failed to set AVAudioSession active: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_activateAudioSessionWithCompletionHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D23A0000, a1, a3, "Failed to activate audio session due to insufficient priority, will try again in %f seconds", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

@end
