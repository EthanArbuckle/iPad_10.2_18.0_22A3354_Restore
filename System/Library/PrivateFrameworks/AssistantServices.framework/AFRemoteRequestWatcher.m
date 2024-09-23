@implementation AFRemoteRequestWatcher

- (AFRemoteRequestWatcher)init
{
  AFRemoteRequestWatcher *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  AFSiriActivationListener *v7;
  uint64_t v8;
  uint64_t v9;
  AFSiriActivationListener *siriActivationListener;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AFRemoteRequestWatcher;
  v2 = -[AFRemoteRequestWatcher init](&v12, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("AFPersistentConnection", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v2->_speechRequestToken = -1;
    v7 = [AFSiriActivationListener alloc];
    if (AFIsHorseman_onceToken != -1)
      dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_139_40146);
    if (AFIsHorseman_isHorseman)
      v8 = 2;
    else
      v8 = 1;
    v9 = -[AFSiriActivationListener initWithServicePort:](v7, "initWithServicePort:", v8);
    siriActivationListener = v2->_siriActivationListener;
    v2->_siriActivationListener = (AFSiriActivationListener *)v9;

    -[AFSiriActivationListener startWithDelegate:](v2->_siriActivationListener, "startWithDelegate:", v2);
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DistributedCenter;
  int speechRequestToken;
  objc_super v5;

  -[AFSiriActivationListener invalidate](self->_siriActivationListener, "invalidate");
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterRemoveObserver(DistributedCenter, self, CFSTR("com.apple.assistant.request"), 0);
  speechRequestToken = self->_speechRequestToken;
  if (speechRequestToken != -1)
    notify_cancel(speechRequestToken);
  v5.receiver = self;
  v5.super_class = (Class)AFRemoteRequestWatcher;
  -[AFRemoteRequestWatcher dealloc](&v5, sel_dealloc);
}

- (void)siriActivationListener:(id)a3 prewarmWithRequestInfo:(id)a4 context:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v8 = a4;
  v9 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__AFRemoteRequestWatcher_siriActivationListener_prewarmWithRequestInfo_context_completion___block_invoke;
  block[3] = &unk_1E3A36E10;
  block[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, block);

}

- (void)siriActivationListener:(id)a3 activateWithRequestInfo:(id)a4 context:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  AFRemoteRequestWatcher *v18;
  id v19;
  id v20;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __92__AFRemoteRequestWatcher_siriActivationListener_activateWithRequestInfo_context_completion___block_invoke;
  v16[3] = &unk_1E3A346A0;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v20 = v11;
  v13 = v10;
  v14 = v11;
  v15 = v9;
  dispatch_async(queue, v16);

}

- (void)siriActivationListener:(id)a3 deactivateForReason:(int64_t)a4 options:(unint64_t)a5 context:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  int64_t v19;
  unint64_t v20;

  v11 = a6;
  v12 = a7;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__AFRemoteRequestWatcher_siriActivationListener_deactivateForReason_options_context_completion___block_invoke;
  block[3] = &unk_1E3A32DD8;
  v19 = a4;
  v20 = a5;
  block[4] = self;
  v17 = v11;
  v18 = v12;
  v14 = v12;
  v15 = v11;
  dispatch_async(queue, block);

}

- (void)siriActivationListener:(id)a3 handleIntent:(id)a4 inBackgroundAppWithBundleId:(id)a5 reply:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __96__AFRemoteRequestWatcher_siriActivationListener_handleIntent_inBackgroundAppWithBundleId_reply___block_invoke;
  v16[3] = &unk_1E3A346A0;
  v16[4] = self;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_async(queue, v16);

}

- (void)siriActivationListener:(id)a3 handleIntentForwardingAction:(id)a4 inBackgroundApplicationWithBundleIdentifier:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __140__AFRemoteRequestWatcher_siriActivationListener_handleIntentForwardingAction_inBackgroundApplicationWithBundleIdentifier_completionHandler___block_invoke;
  v16[3] = &unk_1E3A346A0;
  v16[4] = self;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_async(queue, v16);

}

- (void)siriActivationListener:(id)a3 handleButtonEventFromContext:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__AFRemoteRequestWatcher_siriActivationListener_handleButtonEventFromContext_completion___block_invoke;
  block[3] = &unk_1E3A36E10;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(queue, block);

}

- (void)_setupRequestListener
{
  NSObject *v3;
  __CFNotificationCenter *DistributedCenter;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[AFRemoteRequestWatcher _setupRequestListener]";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterAddObserver(DistributedCenter, self, (CFNotificationCallback)_StartUIRequest, CFSTR("com.apple.assistant.request"), 0, CFNotificationSuspensionBehaviorDrop);
}

- (void)setPrewarmHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__AFRemoteRequestWatcher_setPrewarmHandler___block_invoke;
  v7[3] = &unk_1E3A36FA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)setNewRequestHandler:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __47__AFRemoteRequestWatcher_setNewRequestHandler___block_invoke;
    v6[3] = &unk_1E3A310F0;
    v7 = v4;
    -[AFRemoteRequestWatcher setRequestHandler:](self, "setRequestHandler:", v6);

  }
  else
  {
    -[AFRemoteRequestWatcher setRequestHandler:](self, "setRequestHandler:", 0);
  }

}

- (void)setRequestHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__AFRemoteRequestWatcher_setRequestHandler___block_invoke;
  v7[3] = &unk_1E3A36FA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)setDismissalHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__AFRemoteRequestWatcher_setDismissalHandler___block_invoke;
  v7[3] = &unk_1E3A36FA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)setIntentHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__AFRemoteRequestWatcher_setIntentHandler___block_invoke;
  v7[3] = &unk_1E3A36FA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)setIntentForwardingActionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__AFRemoteRequestWatcher_setIntentForwardingActionHandler___block_invoke;
  v7[3] = &unk_1E3A36FA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)setButtonEventHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__AFRemoteRequestWatcher_setButtonEventHandler___block_invoke;
  v7[3] = &unk_1E3A36FA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)setActivationHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__AFRemoteRequestWatcher_setActivationHandler___block_invoke;
  v7[3] = &unk_1E3A36FA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_setupSpeechRequestListener
{
  NSObject *v3;
  NSObject *queue;
  uint32_t v5;
  NSObject *v6;
  _QWORD handler[4];
  id v8;
  id location;
  int out_token;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint32_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_speechRequestToken == -1)
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[AFRemoteRequestWatcher _setupSpeechRequestListener]";
      _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }
    out_token = -1;
    objc_initWeak(&location, self);
    queue = self->_queue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __53__AFRemoteRequestWatcher__setupSpeechRequestListener__block_invoke;
    handler[3] = &unk_1E3A344A0;
    objc_copyWeak(&v8, &location);
    v5 = notify_register_dispatch("com.apple.assistant.speech-request", &out_token, queue, handler);
    if (v5)
    {
      v6 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[AFRemoteRequestWatcher _setupSpeechRequestListener]";
        v13 = 1024;
        v14 = v5;
        _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s Notify register failed %u", buf, 0x12u);
      }
    }
    else
    {
      self->_speechRequestToken = out_token;
    }
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_dispatchSpeechRequestOptions:(id)a3
{
  id v4;
  void (**speechRequestHandler)(void);
  AFRequestInfo *v6;
  uint64_t v7;
  AFRequestInfo *v8;
  void *v9;

  v4 = a3;
  speechRequestHandler = (void (**)(void))self->_speechRequestHandler;
  if (speechRequestHandler)
  {
    v9 = v4;
    speechRequestHandler[2]();
LABEL_7:
    v4 = v9;
    goto LABEL_8;
  }
  if (self->_requestHandler)
  {
    v9 = v4;
    v6 = [AFRequestInfo alloc];
    v7 = objc_msgSend(v9, "activationEventMachAbsoluteTime");
    if (!v7)
      v7 = mach_absolute_time();
    v8 = -[AFRequestInfo initWithTimestamp:](v6, "initWithTimestamp:", v7);
    -[AFRequestInfo setSpeechRequestOptions:](v8, "setSpeechRequestOptions:", v9);
    (*((void (**)(void))self->_requestHandler + 2))();

    goto LABEL_7;
  }
LABEL_8:

}

- (void)setNewSpeechRequestHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__AFRemoteRequestWatcher_setNewSpeechRequestHandler___block_invoke;
  v7[3] = &unk_1E3A36FA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_activationHandler, 0);
  objc_storeStrong(&self->_buttonEventHandler, 0);
  objc_storeStrong(&self->_speechRequestHandler, 0);
  objc_storeStrong(&self->_intentForwardingActionHandler, 0);
  objc_storeStrong(&self->_intentHandler, 0);
  objc_storeStrong(&self->_dismissalHandler, 0);
  objc_storeStrong(&self->_requestHandler, 0);
  objc_storeStrong(&self->_prewarmHandler, 0);
  objc_storeStrong((id *)&self->_siriActivationListener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __53__AFRemoteRequestWatcher_setNewSpeechRequestHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1A1AC0C3C](*(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "_setupSpeechRequestListener");
}

void __53__AFRemoteRequestWatcher__setupSpeechRequestListener__block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  id WeakRetained;
  AFSpeechRequestOptions *v6;
  void *v7;
  _BYTE v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v8 = 136315138;
    *(_QWORD *)&v8[4] = "-[AFRemoteRequestWatcher _setupSpeechRequestListener]_block_invoke";
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s ", v8, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *(_QWORD *)v8 = 0;
    notify_get_state(a2, (uint64_t *)v8);
    v6 = -[AFSpeechRequestOptions initWithActivationEvent:]([AFSpeechRequestOptions alloc], "initWithActivationEvent:", 0);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFSpeechRequestOptions setNotifyState:](v6, "setNotifyState:", v7);

    objc_msgSend(WeakRetained, "_dispatchSpeechRequestOptions:", v6);
  }

}

void __47__AFRemoteRequestWatcher_setActivationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1A1AC0C3C](*(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 88);
  *(_QWORD *)(v3 + 88) = v2;

}

void __48__AFRemoteRequestWatcher_setButtonEventHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1A1AC0C3C](*(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = v2;

}

void __59__AFRemoteRequestWatcher_setIntentForwardingActionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1A1AC0C3C](*(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v2;

}

void __43__AFRemoteRequestWatcher_setIntentHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1A1AC0C3C](*(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

}

void __46__AFRemoteRequestWatcher_setDismissalHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1A1AC0C3C](*(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __44__AFRemoteRequestWatcher_setRequestHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1A1AC0C3C](*(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "_setupRequestListener");
}

void __47__AFRemoteRequestWatcher_setNewRequestHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v5 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
    v4 = v5;
  }

}

void __44__AFRemoteRequestWatcher_setPrewarmHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1A1AC0C3C](*(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

}

void __89__AFRemoteRequestWatcher_siriActivationListener_handleButtonEventFromContext_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1[4] + 80);
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, a1[5]);
    v3 = 0;
  }
  else
  {
    +[AFError errorWithCode:](AFError, "errorWithCode:", 2509);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = a1[6];
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

uint64_t __140__AFRemoteRequestWatcher_siriActivationListener_handleIntentForwardingAction_inBackgroundApplicationWithBundleIdentifier_completionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(a1[4] + 56);
  if (v1)
    return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(a1[4] + 56), a1[5], a1[6], a1[7]);
  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __96__AFRemoteRequestWatcher_siriActivationListener_handleIntent_inBackgroundAppWithBundleId_reply___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1[4] + 48);
  if (v1)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(a1[4] + 48), a1[5], a1[6], a1[7]);
  }
  else
  {
    v2 = a1[7];
    +[AFError errorWithCode:](AFError, "errorWithCode:", 2509);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

  }
}

void __96__AFRemoteRequestWatcher_siriActivationListener_deactivateForReason_options_context_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 56);
    v4 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("analyticsContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v2 + 16))(v2, v3, v4, v6);

    v7 = 0;
  }
  else
  {
    +[AFError errorWithCode:](AFError, "errorWithCode:", 2509);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
  {
    v9 = v7;
    (*(void (**)(void))(v8 + 16))();
    v7 = v9;
  }

}

void __92__AFRemoteRequestWatcher_siriActivationListener_activateWithRequestInfo_context_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
    if (v2)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __92__AFRemoteRequestWatcher_siriActivationListener_activateWithRequestInfo_context_completion___block_invoke_2;
      v10[3] = &unk_1E3A35B08;
      v11 = *(id *)(a1 + 56);
      (*(void (**)(uint64_t, uint64_t, _QWORD *))(v2 + 16))(v2, v1, v10);
      v3 = v11;
LABEL_7:

      return;
    }
  }
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88);
    if (v5)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __92__AFRemoteRequestWatcher_siriActivationListener_activateWithRequestInfo_context_completion___block_invoke_3;
      v8[3] = &unk_1E3A35B08;
      v9 = *(id *)(a1 + 56);
      (*(void (**)(uint64_t, uint64_t, _QWORD *))(v5 + 16))(v5, v4, v8);
      v3 = v9;
      goto LABEL_7;
    }
  }
  v6 = *(_QWORD *)(a1 + 56);
  if (v6)
  {
    +[AFError errorWithCode:](AFError, "errorWithCode:", 2509);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);

  }
}

uint64_t __92__AFRemoteRequestWatcher_siriActivationListener_activateWithRequestInfo_context_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __92__AFRemoteRequestWatcher_siriActivationListener_activateWithRequestInfo_context_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __91__AFRemoteRequestWatcher_siriActivationListener_prewarmWithRequestInfo_context_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1[4] + 24);
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, a1[5]);
    v3 = 0;
  }
  else
  {
    +[AFError errorWithCode:](AFError, "errorWithCode:", 2509);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = a1[6];
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

@end
