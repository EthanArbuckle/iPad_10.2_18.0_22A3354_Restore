@implementation AFSiriActivationHandlerFrontendProcess

- (AFSiriActivationHandlerFrontendProcess)init
{
  return -[AFSiriActivationHandlerFrontendProcess initWithConnection:](self, "initWithConnection:", 0);
}

- (AFSiriActivationHandlerFrontendProcess)initWithConnection:(id)a3
{
  id v5;
  AFSiriActivationHandlerFrontendProcess *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  AFNotifyObserver *v11;
  void *v12;
  uint64_t v13;
  AFNotifyObserver *clientStateObserver;
  NSMutableDictionary *v15;
  NSMutableDictionary *clientStateTransitionHandlersByTimestamp;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AFSiriActivationHandlerFrontendProcess;
  v6 = -[AFSiriActivationHandlerFrontendProcess init](&v18, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INTERACTIVE, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = dispatch_queue_create("com.apple.siri.activation.frontend-process-handler", v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_connection, a3);
    v11 = [AFNotifyObserver alloc];
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", "com.apple.siri.client-state-changed");
    v13 = -[AFNotifyObserver initWithName:options:queue:delegate:](v11, "initWithName:options:queue:delegate:", v12, 1, v6->_queue, v6);
    clientStateObserver = v6->_clientStateObserver;
    v6->_clientStateObserver = (AFNotifyObserver *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    clientStateTransitionHandlersByTimestamp = v6->_clientStateTransitionHandlersByTimestamp;
    v6->_clientStateTransitionHandlersByTimestamp = v15;

  }
  return v6;
}

- (BOOL)handleContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[AFSiriActivationHandlerFrontendProcess handleContext:completion:]";
    v18 = 2048;
    v19 = v6;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s context = %p", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__AFSiriActivationHandlerFrontendProcess_handleContext_completion___block_invoke;
  block[3] = &unk_1E3A36E10;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(queue, block);

  return 1;
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
  if (self->_clientStateObserver == v8)
  {
    v9 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v10 = 136315650;
      v11 = "-[AFSiriActivationHandlerFrontendProcess notifyObserver:didChangeStateFrom:to:]";
      v12 = 2048;
      v13 = a4;
      v14 = 2048;
      v15 = a5;
      _os_log_impl(&dword_19AF50000, v9, OS_LOG_TYPE_INFO, "%s state: %llu -> %llu", (uint8_t *)&v10, 0x20u);
    }
    if ((a5 & ~(_DWORD)a4 & 4) != 0)
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_clientStateTransitionHandlersByTimestamp, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_14);
  }

}

- (void)_waitUntilListeningForContext:(id)a3 timeoutInterval:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  AFSafetyBlock *v11;
  uint64_t v12;
  id v13;
  AFSafetyBlock *v14;
  NSMutableDictionary *clientStateTransitionHandlersByTimestamp;
  void *v16;
  AFWatchdogTimer *v17;
  OS_dispatch_queue *queue;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  AFSafetyBlock *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _BYTE *v26;
  _BYTE buf[24];
  double v28;
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v9)
  {
    v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[AFSiriActivationHandlerFrontendProcess _waitUntilListeningForContext:timeoutInterval:completion:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2048;
      v28 = a4;
      _os_log_impl(&dword_19AF50000, v10, OS_LOG_TYPE_INFO, "%s context = %@, timeoutInterval = %f", buf, 0x20u);
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v28 = COERCE_DOUBLE(__Block_byref_object_copy__20347);
    v29 = __Block_byref_object_dispose__20348;
    v30 = 0;
    v11 = [AFSafetyBlock alloc];
    v12 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __99__AFSiriActivationHandlerFrontendProcess__waitUntilListeningForContext_timeoutInterval_completion___block_invoke;
    v23[3] = &unk_1E3A31C90;
    v25 = v9;
    v23[4] = self;
    v13 = v8;
    v24 = v13;
    v26 = buf;
    v14 = -[AFSafetyBlock initWithBlock:](v11, "initWithBlock:", v23);
    clientStateTransitionHandlersByTimestamp = self->_clientStateTransitionHandlersByTimestamp;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v13, "timestamp"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](clientStateTransitionHandlersByTimestamp, "setObject:forKey:", v14, v16);

    if (a4 > 0.0)
    {
      v17 = [AFWatchdogTimer alloc];
      queue = self->_queue;
      v21[0] = v12;
      v21[1] = 3221225472;
      v21[2] = __99__AFSiriActivationHandlerFrontendProcess__waitUntilListeningForContext_timeoutInterval_completion___block_invoke_2;
      v21[3] = &unk_1E3A36F30;
      v22 = v14;
      v19 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:](v17, "initWithTimeoutInterval:onQueue:timeoutHandler:", queue, v21, a4);
      v20 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v19;

      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "start");
    }

    _Block_object_dispose(buf, 8);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientStateTransitionHandlersByTimestamp, 0);
  objc_storeStrong((id *)&self->_clientStateObserver, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __99__AFSiriActivationHandlerFrontendProcess__waitUntilListeningForContext_timeoutInterval_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  _QWORD block[5];
  id v11;
  uint64_t v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[AFSiriActivationHandlerFrontendProcess _waitUntilListeningForContext:timeoutInterval:completion:]_block_invoke";
    v15 = 2048;
    v16 = a2;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s signal = %ld", buf, 0x16u);
    v4 = AFSiriLogContextConnection;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[AFSiriActivationHandlerFrontendProcess _waitUntilListeningForContext:timeoutInterval:completion:]_block_invoke";
    v15 = 1024;
    LODWORD(v16) = a2 == 0;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s isListening = %d", buf, 0x12u);
  }
  (*(void (**)(void))(a1[6] + 16))();
  v5 = a1[4];
  v6 = (void *)a1[5];
  v7 = *(NSObject **)(v5 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__AFSiriActivationHandlerFrontendProcess__waitUntilListeningForContext_timeoutInterval_completion___block_invoke_16;
  block[3] = &unk_1E3A31C68;
  block[4] = v5;
  v8 = v6;
  v9 = a1[7];
  v11 = v8;
  v12 = v9;
  dispatch_async(v7, block);

}

uint64_t __99__AFSiriActivationHandlerFrontendProcess__waitUntilListeningForContext_timeoutInterval_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeWithSignal:", -2);
}

void __99__AFSiriActivationHandlerFrontendProcess__waitUntilListeningForContext_timeoutInterval_completion___block_invoke_16(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 40), "timestamp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "cancel");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

uint64_t __79__AFSiriActivationHandlerFrontendProcess_notifyObserver_didChangeStateFrom_to___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invokeWithSignal:", 0);
}

void __67__AFSiriActivationHandlerFrontendProcess_handleContext_completion___block_invoke(uint64_t a1)
{
  AFSiriActivationConnection *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  _QWORD v19[4];
  NSObject *v20;
  uint64_t v21;
  id v22;
  _QWORD *v23;
  uint64_t *v24;
  _QWORD v25[4];
  NSObject *v26;
  _QWORD *v27;
  _QWORD v28[3];
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint8_t buf[4];
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__20347;
  v34 = __Block_byref_object_dispose__20348;
  v35 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  if (!v35)
  {
    v2 = [AFSiriActivationConnection alloc];
    if (AFIsHorseman_onceToken != -1)
      dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_139_40146);
    if (AFIsHorseman_isHorseman)
      v3 = 2;
    else
      v3 = 1;
    v4 = -[AFSiriActivationConnection initWithServicePort:](v2, "initWithServicePort:", v3);
    v5 = (void *)v31[5];
    v31[5] = v4;

  }
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = 0;
  AFSiriActivationCreateRequestInfoFromContext(*(void **)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isSpeechRequest");

  if ((objc_msgSend(*(id *)(a1 + 40), "options") & 1) != 0)
    v8 = 0;
  else
    v8 = v7;
  v9 = MEMORY[0x1E0C809B0];
  if (v8 == 1)
  {
    v10 = dispatch_group_create();
    dispatch_group_enter(v10);
    v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v37 = "-[AFSiriActivationHandlerFrontendProcess handleContext:completion:]_block_invoke";
      _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s Begin waiting for listening...", buf, 0xCu);
    }
    v12 = *(void **)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    v25[0] = v9;
    v25[1] = 3221225472;
    v25[2] = __67__AFSiriActivationHandlerFrontendProcess_handleContext_completion___block_invoke_5;
    v25[3] = &unk_1E3A31BB0;
    v27 = v28;
    v14 = v10;
    v26 = v14;
    objc_msgSend(v12, "_waitUntilListeningForContext:timeoutInterval:completion:", v13, v25, 5.0);

  }
  else
  {
    v14 = 0;
  }
  v15 = (void *)v31[5];
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __67__AFSiriActivationHandlerFrontendProcess_handleContext_completion___block_invoke_7;
  v19[3] = &unk_1E3A31C20;
  v16 = *(_QWORD *)(a1 + 40);
  v22 = *(id *)(a1 + 48);
  v17 = v14;
  v18 = *(_QWORD *)(a1 + 32);
  v20 = v17;
  v21 = v18;
  v23 = v28;
  v24 = &v30;
  objc_msgSend(v15, "handleContext:completion:", v16, v19);

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v30, 8);

}

void __67__AFSiriActivationHandlerFrontendProcess_handleContext_completion___block_invoke_5(uint64_t a1, int a2)
{
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "-[AFSiriActivationHandlerFrontendProcess handleContext:completion:]_block_invoke";
    v7 = 1024;
    v8 = a2;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s End waiting for listening (isListening = %d).", (uint8_t *)&v5, 0x12u);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __67__AFSiriActivationHandlerFrontendProcess_handleContext_completion___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  __int128 v12;
  _QWORD block[4];
  id v14;
  __int128 v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[AFSiriActivationHandlerFrontendProcess handleContext:completion:]_block_invoke";
    v18 = 2112;
    v19 = v3;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s result = %@", buf, 0x16u);
  }
  if (*(_QWORD *)(a1 + 48))
  {
    if (objc_msgSend(v3, "actionType") == 1
      && (objc_msgSend(v3, "error"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, !v5)
      && (v9 = *(NSObject **)(a1 + 32)) != 0)
    {
      v10 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__AFSiriActivationHandlerFrontendProcess_handleContext_completion___block_invoke_8;
      block[3] = &unk_1E3A31BF8;
      v12 = *(_OWORD *)(a1 + 48);
      v11 = (id)v12;
      v15 = v12;
      v14 = v3;
      dispatch_group_notify(v9, v10, block);

    }
    else
    {
      v6 = *(_QWORD *)(a1 + 48);
      if (v6)
        (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
    }
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = 0;

  }
}

void __67__AFSiriActivationHandlerFrontendProcess_handleContext_completion___block_invoke_8(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "mutatedCopyWithMutator:", &__block_literal_global_20363);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 136315394;
      v6 = "-[AFSiriActivationHandlerFrontendProcess handleContext:completion:]_block_invoke";
      v7 = 2112;
      v8 = v4;
      _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s overrideResult = %@", (uint8_t *)&v5, 0x16u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void __67__AFSiriActivationHandlerFrontendProcess_handleContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[AFError errorWithCode:](AFError, "errorWithCode:", 2511);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setError:", v3);

}

@end
