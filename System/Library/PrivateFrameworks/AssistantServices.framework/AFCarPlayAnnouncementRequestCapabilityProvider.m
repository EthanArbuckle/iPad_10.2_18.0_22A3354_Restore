@implementation AFCarPlayAnnouncementRequestCapabilityProvider

- (AFCarPlayAnnouncementRequestCapabilityProvider)initWithQueue:(id)a3
{
  id v5;
  AFCarPlayAnnouncementRequestCapabilityProvider *v6;
  AFCarPlayAnnouncementRequestCapabilityProvider *v7;
  void *v8;
  objc_class *v9;
  CARSessionStatus *v10;
  CARSessionStatus *carSessionStatus;
  uint64_t v12;
  NSHashTable *delegates;
  objc_super v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AFCarPlayAnnouncementRequestCapabilityProvider;
  v6 = -[AFCarPlayAnnouncementRequestCapabilityProvider init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_providerQueue, a3);
    v17 = 0;
    v18 = &v17;
    v19 = 0x2050000000;
    v8 = (void *)getCARSessionStatusClass_softClass;
    v20 = getCARSessionStatusClass_softClass;
    if (!getCARSessionStatusClass_softClass)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __getCARSessionStatusClass_block_invoke;
      v16[3] = &unk_1E3A365A8;
      v16[4] = &v17;
      __getCARSessionStatusClass_block_invoke((uint64_t)v16);
      v8 = (void *)v18[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v17, 8);
    v10 = (CARSessionStatus *)objc_alloc_init(v9);
    carSessionStatus = v7->_carSessionStatus;
    v7->_carSessionStatus = v10;

    -[CARSessionStatus addSessionObserver:](v7->_carSessionStatus, "addSessionObserver:", v7);
    v7->_lastKnownAvailableAnnouncementRequestTypes = 0;
    v7->_lastKnownEligibleAnnouncementRequestTypes = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v12 = objc_claimAutoreleasedReturnValue();
    delegates = v7->_delegates;
    v7->_delegates = (NSHashTable *)v12;

    if (AFDeviceSupportsCarPlay_onceToken != -1)
      dispatch_once(&AFDeviceSupportsCarPlay_onceToken, &__block_literal_global_245);
    v7->_lastKnownEligibleAnnouncementRequestTypes = -[AFCarPlayAnnouncementRequestCapabilityProvider _requestTypesForCarPlayAvailableOrConnected:](v7, "_requestTypesForCarPlayAvailableOrConnected:", AFDeviceSupportsCarPlay_supportsCarPlay);
  }

  return v7;
}

- (void)isCarPlayConnectedWithCompletion:(id)a3
{
  id v4;
  NSObject *providerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  providerQueue = self->_providerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__AFCarPlayAnnouncementRequestCapabilityProvider_isCarPlayConnectedWithCompletion___block_invoke;
  v7[3] = &unk_1E3A36FA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(providerQueue, v7);

}

- (void)_isCarPlayConnectedWithCompletion:(id)a3
{
  void (**v4)(void);
  void *v5;
  void (**v6)(void);

  v4 = (void (**)(void))a3;
  v6 = v4;
  if (AFDeviceSupportsCarPlay_onceToken != -1)
  {
    dispatch_once(&AFDeviceSupportsCarPlay_onceToken, &__block_literal_global_245);
    v4 = v6;
  }
  if (AFDeviceSupportsCarPlay_supportsCarPlay)
  {
    -[CARSessionStatus currentSession](self->_carSessionStatus, "currentSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[CARSessionStatus waitForSessionInitialization](self->_carSessionStatus, "waitForSessionInitialization");
      -[CARSessionStatus currentSession](self->_carSessionStatus, "currentSession");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    self->_isCarPlayConnected = v5 != 0;
    v6[2]();

  }
  else
  {
    ((void (*)(void (**)(void), _QWORD))v4[2])(v4, 0);
  }

}

- (void)updateForCarPlaySessionConnected:(BOOL)a3
{
  NSObject *providerQueue;
  _QWORD v4[5];
  BOOL v5;

  providerQueue = self->_providerQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__AFCarPlayAnnouncementRequestCapabilityProvider_updateForCarPlaySessionConnected___block_invoke;
  v4[3] = &unk_1E3A34D68;
  v4[4] = self;
  v5 = a3;
  dispatch_async(providerQueue, v4);
}

- (void)_updateForCarPlaySessionConnected:(BOOL)a3
{
  -[AFCarPlayAnnouncementRequestCapabilityProvider _setLastKnownAvailableAnnouncementRequestTypesAndNotifyObservers:](self, "_setLastKnownAvailableAnnouncementRequestTypesAndNotifyObservers:", -[AFCarPlayAnnouncementRequestCapabilityProvider _requestTypesForCarPlayAvailableOrConnected:](self, "_requestTypesForCarPlayAvailableOrConnected:", a3));
}

- (void)sessionDidConnect:(id)a3
{
  -[AFCarPlayAnnouncementRequestCapabilityProvider updateForCarPlaySessionConnected:](self, "updateForCarPlaySessionConnected:", 1);
}

- (void)sessionDidDisconnect:(id)a3
{
  -[AFCarPlayAnnouncementRequestCapabilityProvider updateForCarPlaySessionConnected:](self, "updateForCarPlaySessionConnected:", 0);
}

- (void)addDelegate:(id)a3
{
  -[NSHashTable addObject:](self->_delegates, "addObject:", a3);
}

- (unint64_t)lastKnownEligibleAnnouncementRequestTypes
{
  return self->_lastKnownEligibleAnnouncementRequestTypes;
}

- (void)fetchEligibleAnnouncementRequestTypesWithCompletion:(id)a3
{
  id v4;
  NSObject *providerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  providerQueue = self->_providerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __102__AFCarPlayAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke;
  v7[3] = &unk_1E3A36FA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(providerQueue, v7);

}

- (void)fetchAvailableAnnouncementRequestTypesWithCompletion:(id)a3
{
  id v4;
  NSObject *providerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  providerQueue = self->_providerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __103__AFCarPlayAnnouncementRequestCapabilityProvider_fetchAvailableAnnouncementRequestTypesWithCompletion___block_invoke;
  v7[3] = &unk_1E3A36FA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(providerQueue, v7);

}

- (void)_availableAnnouncementRequestTypesForCarPlayConnectionWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __119__AFCarPlayAnnouncementRequestCapabilityProvider__availableAnnouncementRequestTypesForCarPlayConnectionWithCompletion___block_invoke;
  v6[3] = &unk_1E3A34420;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AFCarPlayAnnouncementRequestCapabilityProvider isCarPlayConnectedWithCompletion:](self, "isCarPlayConnectedWithCompletion:", v6);

}

- (unint64_t)_requestTypesForCarPlayAvailableOrConnected:(BOOL)a3
{
  return a3;
}

- (void)_setLastKnownAvailableAnnouncementRequestTypesAndNotifyObservers:(unint64_t)a3
{
  if (self->_lastKnownAvailableAnnouncementRequestTypes != a3)
  {
    self->_lastKnownAvailableAnnouncementRequestTypes = a3;
    -[AFCarPlayAnnouncementRequestCapabilityProvider _notifyObserversOfUpdatedAvailableAnnouncementRequestTypes:](self, "_notifyObserversOfUpdatedAvailableAnnouncementRequestTypes:");
  }
}

- (void)_notifyObserversOfUpdatedAvailableAnnouncementRequestTypes:(unint64_t)a3
{
  NSObject *v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[AFCarPlayAnnouncementRequestCapabilityProvider _notifyObserversOfUpdatedAvailableAnnouncementRequestTypes:]";
    v18 = 2048;
    v19 = a3;
    _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s Notifying observers, available announcement request types changed: %lu", buf, 0x16u);
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_delegates;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "provider:availableAnnouncementRequestTypesChanged:", self, a3, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_providerQueue, 0);
  objc_storeStrong((id *)&self->_carSessionStatus, 0);
}

uint64_t __119__AFCarPlayAnnouncementRequestCapabilityProvider__availableAnnouncementRequestTypesForCarPlayConnectionWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_setLastKnownAvailableAnnouncementRequestTypesAndNotifyObservers:", objc_msgSend(*(id *)(a1 + 32), "_requestTypesForCarPlayAvailableOrConnected:", a2));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __103__AFCarPlayAnnouncementRequestCapabilityProvider_fetchAvailableAnnouncementRequestTypesWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_availableAnnouncementRequestTypesForCarPlayConnectionWithCompletion:", *(_QWORD *)(a1 + 40));
}

uint64_t __102__AFCarPlayAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "lastKnownEligibleAnnouncementRequestTypes"));
}

uint64_t __83__AFCarPlayAnnouncementRequestCapabilityProvider_updateForCarPlaySessionConnected___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateForCarPlaySessionConnected:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __83__AFCarPlayAnnouncementRequestCapabilityProvider_isCarPlayConnectedWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_isCarPlayConnectedWithCompletion:", *(_QWORD *)(a1 + 40));
}

+ (id)provider
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__AFCarPlayAnnouncementRequestCapabilityProvider_provider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (provider_onceToken_13379 != -1)
    dispatch_once(&provider_onceToken_13379, block);
  return (id)provider_provider_13380;
}

+ (int64_t)platform
{
  return 2;
}

+ (id)announceableIntentIdentifiersForUserNotificationAnnouncementType:(int64_t)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (a3 != 1)
    return 0;
  getINSearchForMessagesIntentIdentifier_13367();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)requiredIntentIdentifiersForUserNotificationAnnouncementType:(int64_t)a3
{
  void *v4;
  id *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 > 9)
    return 0;
  if ((unint64_t)(a3 - 2) < 6)
    return MEMORY[0x1E0C9AA60];
  if (a3 != 1)
    return 0;
  getINSearchForMessagesIntentIdentifier_13367();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v5 = (id *)getINSendMessageIntentIdentifierSymbolLoc_ptr_13368;
  v15 = getINSendMessageIntentIdentifierSymbolLoc_ptr_13368;
  if (!getINSendMessageIntentIdentifierSymbolLoc_ptr_13368)
  {
    v6 = IntentsLibrary_13369();
    v5 = (id *)dlsym(v6, "INSendMessageIntentIdentifier");
    v13[3] = (uint64_t)v5;
    getINSendMessageIntentIdentifierSymbolLoc_ptr_13368 = (uint64_t)v5;
  }
  _Block_object_dispose(&v12, 8);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getINSendMessageIntentIdentifier(void)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("AFCarPlayAnnouncementRequestCapabilityProvider.m"), 30, CFSTR("%s"), dlerror(), v12);

    __break(1u);
  }
  v17 = *v5;
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = v17;
  objc_msgSend(v7, "arrayWithObjects:count:", &v16, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __58__AFCarPlayAnnouncementRequestCapabilityProvider_provider__block_invoke()
{
  id v0;
  NSObject *v1;
  uint64_t v2;
  void *v3;
  dispatch_queue_t v4;

  v0 = objc_alloc((Class)objc_opt_class());
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("com.apple.assistant.announce.carplay", v1);

  v2 = objc_msgSend(v0, "initWithQueue:", v4);
  v3 = (void *)provider_provider_13380;
  provider_provider_13380 = v2;

}

@end
