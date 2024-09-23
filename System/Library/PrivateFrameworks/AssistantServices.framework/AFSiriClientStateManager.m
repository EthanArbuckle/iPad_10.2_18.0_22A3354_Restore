@implementation AFSiriClientStateManager

- (AFSiriClientStateManager)initWithInstanceContext:(id)a3
{
  id v4;
  AFSiriClientStateManager *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  NSMapTable *statesByClient;
  void *v12;
  NSObject *v13;
  AFNotifyStatePublisher *v14;
  AFNotifyStatePublisher *publisher;
  dispatch_group_t v16;
  OS_dispatch_group *presentationTransitionGroup;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  AFSiriClientStateManager *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AFSiriClientStateManager;
  v5 = -[AFSiriClientStateManager init](&v19, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INITIATED, 0);
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = dispatch_queue_create("com.apple.siri.client-state-manager", v7);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 258, 0, 1);
    statesByClient = v5->_statesByClient;
    v5->_statesByClient = (NSMapTable *)v10;

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", "com.apple.siri.client-state-changed");
    AFNotifyGetEffectiveNotificationName(v12, v4);
    objc_claimAutoreleasedReturnValue();

    v13 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v21 = "-[AFSiriClientStateManager initWithInstanceContext:]";
      v22 = 2048;
      v23 = v5;
      v24 = 2112;
      v25 = v12;
      _os_log_debug_impl(&dword_19AF50000, v13, OS_LOG_TYPE_DEBUG, "%s %p %@", buf, 0x20u);
    }
    v14 = -[AFNotifyStatePublisher initWithName:queue:]([AFNotifyStatePublisher alloc], "initWithName:queue:", v12, v5->_queue);
    publisher = v5->_publisher;
    v5->_publisher = v14;

    v16 = dispatch_group_create();
    presentationTransitionGroup = v5->_presentationTransitionGroup;
    v5->_presentationTransitionGroup = (OS_dispatch_group *)v16;

  }
  return v5;
}

- (void)invalidateClient:(void *)a3
{
  NSObject *queue;
  _QWORD v4[6];

  if (a3)
  {
    queue = self->_queue;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __45__AFSiriClientStateManager_invalidateClient___block_invoke;
    v4[3] = &unk_1E3A353C0;
    v4[4] = self;
    v4[5] = a3;
    dispatch_async(queue, v4);
  }
}

- (void)beginSessionForClient:(void *)a3
{
  NSObject *queue;
  _QWORD v4[6];

  if (a3)
  {
    queue = self->_queue;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __50__AFSiriClientStateManager_beginSessionForClient___block_invoke;
    v4[3] = &unk_1E3A353C0;
    v4[4] = self;
    v4[5] = a3;
    dispatch_async(queue, v4);
  }
}

- (void)endSessionForClient:(void *)a3
{
  NSObject *queue;
  _QWORD v4[6];

  if (a3)
  {
    queue = self->_queue;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __48__AFSiriClientStateManager_endSessionForClient___block_invoke;
    v4[3] = &unk_1E3A353C0;
    v4[4] = self;
    v4[5] = a3;
    dispatch_async(queue, v4);
  }
}

- (void)beginRequestWithUUID:(id)a3 forClient:(void *)a4
{
  id v6;
  void *v7;
  NSObject *queue;
  _QWORD block[5];
  id v10;
  void *v11;

  v6 = a3;
  v7 = v6;
  if (v6 && a4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__AFSiriClientStateManager_beginRequestWithUUID_forClient___block_invoke;
    block[3] = &unk_1E3A353E8;
    block[4] = self;
    v10 = v6;
    v11 = a4;
    dispatch_async(queue, block);

  }
}

- (void)endRequestWithUUID:(id)a3 forClient:(void *)a4
{
  id v6;
  void *v7;
  NSObject *queue;
  _QWORD block[5];
  id v10;
  void *v11;

  v6 = a3;
  v7 = v6;
  if (v6 && a4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__AFSiriClientStateManager_endRequestWithUUID_forClient___block_invoke;
    block[3] = &unk_1E3A353E8;
    block[4] = self;
    v10 = v6;
    v11 = a4;
    dispatch_async(queue, block);

  }
}

- (void)beginListeningForClient:(void *)a3
{
  NSObject *queue;
  _QWORD v4[6];

  if (a3)
  {
    queue = self->_queue;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __52__AFSiriClientStateManager_beginListeningForClient___block_invoke;
    v4[3] = &unk_1E3A353C0;
    v4[4] = self;
    v4[5] = a3;
    dispatch_async(queue, v4);
  }
}

- (void)endListeningForClient:(void *)a3
{
  NSObject *queue;
  _QWORD v4[6];

  if (a3)
  {
    queue = self->_queue;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __50__AFSiriClientStateManager_endListeningForClient___block_invoke;
    v4[3] = &unk_1E3A353C0;
    v4[4] = self;
    v4[5] = a3;
    dispatch_async(queue, v4);
  }
}

- (void)beginSpeakingForClient:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__AFSiriClientStateManager_beginSpeakingForClient___block_invoke;
    v7[3] = &unk_1E3A36FC8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)endSpeakingForClient:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__AFSiriClientStateManager_endSpeakingForClient___block_invoke;
    v7[3] = &unk_1E3A36FC8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)beginTransaction
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__AFSiriClientStateManager_beginTransaction__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)endTransaction
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__AFSiriClientStateManager_endTransaction__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)beginPresentationTransition
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__AFSiriClientStateManager_beginPresentationTransition__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)endPresentationTransition
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__AFSiriClientStateManager_endPresentationTransition__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)getCurrentStateWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *queue;
  _QWORD block[5];
  id v8;
  uint64_t v9;

  v4 = a3;
  if (v4)
  {
    v5 = mach_absolute_time();
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__AFSiriClientStateManager_getCurrentStateWithCompletion___block_invoke;
    block[3] = &unk_1E3A35410;
    block[4] = self;
    v9 = v5;
    v8 = v4;
    dispatch_async(queue, block);

  }
}

- (id)_stateForClient:(void *)a3 createIfAbsent:(BOOL)a4
{
  _BOOL4 v4;
  _AFSiriClientState *v7;
  BOOL v8;

  v4 = a4;
  NSMapGet(self->_statesByClient, a3);
  v7 = (_AFSiriClientState *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = 1;
  else
    v8 = !v4;
  if (!v8)
  {
    v7 = objc_alloc_init(_AFSiriClientState);
    NSMapInsert(self->_statesByClient, a3, v7);
  }
  return v7;
}

- (void)_removeStateForClient:(void *)a3
{
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  NSMapRemove(self->_statesByClient, a3);
  if (!-[NSMapTable count](self->_statesByClient, "count"))
  {
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v6 = 136315138;
      v7 = "-[AFSiriClientStateManager _removeStateForClient:]";
      _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s Resetting transaction depth since last client has been invalidated", (uint8_t *)&v6, 0xCu);
    }
    if (self->_transactionDepth >= 1)
    {
      v5 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        v6 = 136315138;
        v7 = "-[AFSiriClientStateManager _removeStateForClient:]";
        _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s last client was removed before all transactions ended", (uint8_t *)&v6, 0xCu);
      }
    }
    self->_transactionDepth = 0;
  }
  -[AFSiriClientStateManager _aggregateStatesAndPublishIfNeeded](self, "_aggregateStatesAndPublishIfNeeded");
}

- (void)_beginSessionForClient:(void *)a3
{
  id v4;

  -[AFSiriClientStateManager _stateForClient:createIfAbsent:](self, "_stateForClient:createIfAbsent:", a3, 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHasActiveSession:", 1);
  -[AFSiriClientStateManager _aggregateStatesAndPublishIfNeeded](self, "_aggregateStatesAndPublishIfNeeded");

}

- (void)_endSessionForClient:(void *)a3
{
  id v4;

  -[AFSiriClientStateManager _stateForClient:createIfAbsent:](self, "_stateForClient:createIfAbsent:", a3, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHasActiveSession:", 0);
  -[AFSiriClientStateManager _aggregateStatesAndPublishIfNeeded](self, "_aggregateStatesAndPublishIfNeeded");

}

- (void)_beginRequestWithUUID:(id)a3 forClient:(void *)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[AFSiriClientStateManager _stateForClient:createIfAbsent:](self, "_stateForClient:createIfAbsent:", a4, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addRequestUUID:", v6);

  -[AFSiriClientStateManager _aggregateStatesAndPublishIfNeeded](self, "_aggregateStatesAndPublishIfNeeded");
}

- (void)_endRequestWithUUID:(id)a3 forClient:(void *)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[AFSiriClientStateManager _stateForClient:createIfAbsent:](self, "_stateForClient:createIfAbsent:", a4, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeRequestUUID:", v6);

  -[AFSiriClientStateManager _aggregateStatesAndPublishIfNeeded](self, "_aggregateStatesAndPublishIfNeeded");
}

- (void)_beginListeningForClient:(void *)a3
{
  id v4;

  -[AFSiriClientStateManager _stateForClient:createIfAbsent:](self, "_stateForClient:createIfAbsent:", a3, 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsListening:", 1);
  -[AFSiriClientStateManager _aggregateStatesAndPublishIfNeeded](self, "_aggregateStatesAndPublishIfNeeded");

}

- (void)_endListeningForClient:(void *)a3
{
  id v4;

  -[AFSiriClientStateManager _stateForClient:createIfAbsent:](self, "_stateForClient:createIfAbsent:", a3, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsListening:", 0);
  -[AFSiriClientStateManager _aggregateStatesAndPublishIfNeeded](self, "_aggregateStatesAndPublishIfNeeded");

}

- (void)_beginSpeakingForClient:(void *)a3
{
  id v4;

  -[AFSiriClientStateManager _stateForClient:createIfAbsent:](self, "_stateForClient:createIfAbsent:", a3, 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsSpeaking:", 1);
  -[AFSiriClientStateManager _aggregateStatesAndPublishIfNeeded](self, "_aggregateStatesAndPublishIfNeeded");

}

- (void)_endSpeakingForClient:(void *)a3
{
  id v4;

  -[AFSiriClientStateManager _stateForClient:createIfAbsent:](self, "_stateForClient:createIfAbsent:", a3, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsSpeaking:", 0);
  -[AFSiriClientStateManager _aggregateStatesAndPublishIfNeeded](self, "_aggregateStatesAndPublishIfNeeded");

}

- (void)_aggregateStatesAndPublishIfNeeded
{
  int64_t transactionDepth;
  NSObject *v3;
  unint64_t v5;
  NSObject *v6;
  AFNotifyStatePublisher *publisher;
  _QWORD v8[5];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  _BYTE v12[10];
  __int16 v13;
  unsigned int v14;
  __int16 v15;
  unsigned int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  transactionDepth = self->_transactionDepth;
  if (transactionDepth < 1)
  {
    v5 = -[AFSiriClientStateManager _aggregatedState](self, "_aggregatedState");
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316162;
      v10 = "-[AFSiriClientStateManager _aggregateStatesAndPublishIfNeeded]";
      v11 = 1024;
      *(_DWORD *)v12 = (v5 >> 1) & 1;
      *(_WORD *)&v12[4] = 1024;
      *(_DWORD *)&v12[6] = v5 & 1;
      v13 = 1024;
      v14 = (v5 >> 2) & 1;
      v15 = 1024;
      v16 = (v5 >> 3) & 1;
      _os_log_debug_impl(&dword_19AF50000, v6, OS_LOG_TYPE_DEBUG, "%s hasActiveSession = %d, hasActiveRequest = %d, isListening = %d, isSpeaking = %d", buf, 0x24u);
    }
    publisher = self->_publisher;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __62__AFSiriClientStateManager__aggregateStatesAndPublishIfNeeded__block_invoke;
    v8[3] = &__block_descriptor_40_e8_Q16__0Q8l;
    v8[4] = v5;
    -[AFNotifyStatePublisher publishStateWithBlock:](publisher, "publishStateWithBlock:", v8);
  }
  else
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[AFSiriClientStateManager _aggregateStatesAndPublishIfNeeded]";
      v11 = 2048;
      *(_QWORD *)v12 = transactionDepth;
      _os_log_debug_impl(&dword_19AF50000, v3, OS_LOG_TYPE_DEBUG, "%s Skipped because transaction depth is %ld", buf, 0x16u);
    }
  }
}

- (unint64_t)_aggregatedState
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMapTable objectEnumerator](self->_statesByClient, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 |= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "notifyState");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_beginPresentationTransition
{
  NSObject *v3;
  AFWatchdogTimer *presentationTransitionWatchdogTimer;
  AFWatchdogTimer *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  AFSafetyBlock *v10;
  AFSafetyBlock *presentationTransitionAssertion;
  AFWatchdogTimer *v12;
  OS_dispatch_queue *queue;
  AFWatchdogTimer *v14;
  AFWatchdogTimer *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[6];
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[AFSiriClientStateManager _beginPresentationTransition]";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  presentationTransitionWatchdogTimer = self->_presentationTransitionWatchdogTimer;
  if (presentationTransitionWatchdogTimer)
  {
    -[AFWatchdogTimer cancel](presentationTransitionWatchdogTimer, "cancel");
    v5 = self->_presentationTransitionWatchdogTimer;
    self->_presentationTransitionWatchdogTimer = 0;

  }
  v6 = MEMORY[0x1E0C809B0];
  if (self->_presentationTransitionAssertion)
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[AFSiriClientStateManager _beginPresentationTransition]";
      _os_log_error_impl(&dword_19AF50000, v7, OS_LOG_TYPE_ERROR, "%s Attempted to begin a presentation transition when there's already a current presentation transition.", buf, 0xCu);
    }
  }
  else
  {
    v8 = mach_absolute_time();
    v9 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[AFSiriClientStateManager _beginPresentationTransition]";
      _os_log_impl(&dword_19AF50000, v9, OS_LOG_TYPE_INFO, "%s Acquired presentation transition assertion.", buf, 0xCu);
    }
    dispatch_group_enter((dispatch_group_t)self->_presentationTransitionGroup);
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __56__AFSiriClientStateManager__beginPresentationTransition__block_invoke;
    v18[3] = &unk_1E3A35458;
    v18[4] = self;
    v18[5] = v8;
    v10 = -[AFSafetyBlock initWithBlock:]([AFSafetyBlock alloc], "initWithBlock:", v18);
    presentationTransitionAssertion = self->_presentationTransitionAssertion;
    self->_presentationTransitionAssertion = v10;

  }
  objc_initWeak((id *)buf, self);
  v12 = [AFWatchdogTimer alloc];
  queue = self->_queue;
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __56__AFSiriClientStateManager__beginPresentationTransition__block_invoke_12;
  v16[3] = &unk_1E3A35AE0;
  objc_copyWeak(&v17, (id *)buf);
  v14 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:](v12, "initWithTimeoutInterval:onQueue:timeoutHandler:", queue, v16, 4.0);
  v15 = self->_presentationTransitionWatchdogTimer;
  self->_presentationTransitionWatchdogTimer = v14;

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

- (void)_endPresentationTransitionForReason:(id)a3
{
  id v4;
  NSObject *v5;
  AFWatchdogTimer *presentationTransitionWatchdogTimer;
  AFWatchdogTimer *v7;
  AFSafetyBlock *presentationTransitionAssertion;
  AFSafetyBlock *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "-[AFSiriClientStateManager _endPresentationTransitionForReason:]";
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s reason = %@", (uint8_t *)&v11, 0x16u);
  }
  presentationTransitionWatchdogTimer = self->_presentationTransitionWatchdogTimer;
  if (presentationTransitionWatchdogTimer)
  {
    -[AFWatchdogTimer cancel](presentationTransitionWatchdogTimer, "cancel");
    v7 = self->_presentationTransitionWatchdogTimer;
    self->_presentationTransitionWatchdogTimer = 0;

  }
  presentationTransitionAssertion = self->_presentationTransitionAssertion;
  if (presentationTransitionAssertion)
  {
    -[AFSafetyBlock invokeWithSignal:](presentationTransitionAssertion, "invokeWithSignal:", 0);
    v9 = self->_presentationTransitionAssertion;
    self->_presentationTransitionAssertion = 0;

  }
  else
  {
    v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = "-[AFSiriClientStateManager _endPresentationTransitionForReason:]";
      _os_log_error_impl(&dword_19AF50000, v10, OS_LOG_TYPE_ERROR, "%s Attempted to end a presentation transition when there's no current presentation transition.", (uint8_t *)&v11, 0xCu);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationTransitionGroup, 0);
  objc_storeStrong((id *)&self->_presentationTransitionWatchdogTimer, 0);
  objc_storeStrong((id *)&self->_presentationTransitionAssertion, 0);
  objc_storeStrong((id *)&self->_statesByClient, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __56__AFSiriClientStateManager__beginPresentationTransition__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 56));
  v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    v6 = mach_absolute_time() - *(_QWORD *)(a1 + 40);
    if (_AFMachAbsoluteTimeRate_onceToken != -1)
      dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_652);
    v7 = 136315650;
    v8 = "-[AFSiriClientStateManager _beginPresentationTransition]_block_invoke";
    v9 = 2048;
    v10 = a2;
    v11 = 2048;
    v12 = *(double *)&_AFMachAbsoluteTimeRate_rate * (double)v6 / 1000000000.0;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s Relinquished presentation transition assertion. (signal = %ld, duration = %f)", (uint8_t *)&v7, 0x20u);

  }
}

void __56__AFSiriClientStateManager__beginPresentationTransition__block_invoke_12(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_endPresentationTransitionForReason:", CFSTR("Timeout"));

}

uint64_t __62__AFSiriClientStateManager__aggregateStatesAndPublishIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 136315650;
    v8 = "-[AFSiriClientStateManager _aggregateStatesAndPublishIfNeeded]_block_invoke";
    v9 = 2048;
    v10 = a2;
    v11 = 2048;
    v12 = v5;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s state: %llu -> %llu", (uint8_t *)&v7, 0x20u);
  }
  return *(_QWORD *)(a1 + 32);
}

void __58__AFSiriClientStateManager_getCurrentStateWithCompletion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;
  uint64_t v9;

  v2 = a1[4];
  v3 = (void *)a1[5];
  v4 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __58__AFSiriClientStateManager_getCurrentStateWithCompletion___block_invoke_2;
  block[3] = &unk_1E3A35410;
  v9 = a1[6];
  v5 = *(NSObject **)(v2 + 56);
  block[1] = 3221225472;
  v6 = v3;
  block[4] = a1[4];
  v8 = v6;
  dispatch_group_notify(v5, v4, block);

}

uint64_t __58__AFSiriClientStateManager_getCurrentStateWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  const char *v7;
  __int16 v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v3 = v2;
    v4 = mach_absolute_time() - *(_QWORD *)(a1 + 48);
    if (_AFMachAbsoluteTimeRate_onceToken != -1)
      dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_652);
    v6 = 136315394;
    v7 = "-[AFSiriClientStateManager getCurrentStateWithCompletion:]_block_invoke_2";
    v8 = 2048;
    v9 = *(double *)&_AFMachAbsoluteTimeRate_rate * (double)v4 / 1000000000.0;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s Took %f seconds to access current state.", (uint8_t *)&v6, 0x16u);

  }
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_aggregatedState"));
}

uint64_t __53__AFSiriClientStateManager_endPresentationTransition__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endPresentationTransitionForReason:", CFSTR("Client"));
}

uint64_t __55__AFSiriClientStateManager_beginPresentationTransition__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginPresentationTransition");
}

uint64_t __42__AFSiriClientStateManager_endTransaction__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  NSObject *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 32);
  v4 = v3 < 1;
  v5 = v3 - 1;
  if (v4)
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "-[AFSiriClientStateManager endTransaction]_block_invoke";
      _os_log_error_impl(&dword_19AF50000, v6, OS_LOG_TYPE_ERROR, "%s Attempting to decrement transaction depth below 0", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    *(_QWORD *)(v2 + 32) = v5;
  }
  return objc_msgSend(*(id *)(a1 + 32), "_aggregateStatesAndPublishIfNeeded");
}

uint64_t __44__AFSiriClientStateManager_beginTransaction__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

uint64_t __49__AFSiriClientStateManager_endSpeakingForClient___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endSpeakingForClient:", *(_QWORD *)(a1 + 40));
}

uint64_t __51__AFSiriClientStateManager_beginSpeakingForClient___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginSpeakingForClient:", *(_QWORD *)(a1 + 40));
}

uint64_t __50__AFSiriClientStateManager_endListeningForClient___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endListeningForClient:", *(_QWORD *)(a1 + 40));
}

uint64_t __52__AFSiriClientStateManager_beginListeningForClient___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginListeningForClient:", *(_QWORD *)(a1 + 40));
}

uint64_t __57__AFSiriClientStateManager_endRequestWithUUID_forClient___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endRequestWithUUID:forClient:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __59__AFSiriClientStateManager_beginRequestWithUUID_forClient___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginRequestWithUUID:forClient:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __48__AFSiriClientStateManager_endSessionForClient___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endSessionForClient:", *(_QWORD *)(a1 + 40));
}

uint64_t __50__AFSiriClientStateManager_beginSessionForClient___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginSessionForClient:", *(_QWORD *)(a1 + 40));
}

uint64_t __45__AFSiriClientStateManager_invalidateClient___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeStateForClient:", *(_QWORD *)(a1 + 40));
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_37929 != -1)
    dispatch_once(&sharedManager_onceToken_37929, &__block_literal_global_37930);
  return (id)sharedManager_sharedManager_37931;
}

void __41__AFSiriClientStateManager_sharedManager__block_invoke()
{
  AFSiriClientStateManager *v0;
  void *v1;

  v0 = -[AFSiriClientStateManager initWithInstanceContext:]([AFSiriClientStateManager alloc], "initWithInstanceContext:", 0);
  v1 = (void *)sharedManager_sharedManager_37931;
  sharedManager_sharedManager_37931 = (uint64_t)v0;

}

@end
