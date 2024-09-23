@implementation AAFAnalyticsEventSecurity

- (BOOL)permittedToSendMetrics
{
  return -[AAFAnalyticsEventSecurity isAAAFoundationAvailable](self, "isAAAFoundationAvailable")
      && -[AAFAnalyticsEventSecurity isAuthKitAvailable](self, "isAuthKitAvailable")
      && !-[AAFAnalyticsEventSecurity areTestsEnabled](self, "areTestsEnabled")
      && -[AAFAnalyticsEventSecurity canSendMetrics](self, "canSendMetrics");
}

- (AAFAnalyticsEventSecurity)initWithKeychainCircleMetrics:(id)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 eventName:(id)a7 testsAreEnabled:(BOOL)a8 canSendMetrics:(BOOL)a9 category:(id)a10
{
  _BOOL4 v10;
  id v16;
  id v17;
  AAFAnalyticsEventSecurity *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *queue;
  void *v22;
  objc_class *v23;
  void *v24;
  _QWORD *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  void *v34;
  AAFAnalyticsEvent *event;
  AAFAnalyticsEventSecurity *v36;
  id v38;
  id v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  objc_super v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  _BYTE v57[128];
  uint64_t v58;

  v10 = a8;
  v58 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v38 = a4;
  v41 = a5;
  v17 = a6;
  v39 = a7;
  v40 = a10;
  if (+[AAFAnalyticsEventSecurity isAAAFoundationAvailable](AAFAnalyticsEventSecurity, "isAAAFoundationAvailable")&& +[AAFAnalyticsEventSecurity isAuthKitAvailable](AAFAnalyticsEventSecurity, "isAuthKitAvailable")&& a9&& !v10)
  {
    v46.receiver = self;
    v46.super_class = (Class)AAFAnalyticsEventSecurity;
    v18 = -[AAFAnalyticsEventSecurity init](&v46, sel_init);
    if (v18)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = dispatch_queue_create("com.apple.security.aafanalyticsevent.queue", v19);
      queue = v18->_queue;
      v18->_queue = (OS_dispatch_queue *)v20;

      v18->_areTestsEnabled = 0;
      v18->_canSendMetrics = a9;
      *(_WORD *)&v18->_isAAAFoundationAvailable = 257;
      v53 = 0;
      v54 = &v53;
      v55 = 0x2050000000;
      v22 = (void *)getAAFAnalyticsEventClass_softClass;
      v56 = getAAFAnalyticsEventClass_softClass;
      if (!getAAFAnalyticsEventClass_softClass)
      {
        v48 = MEMORY[0x24BDAC760];
        v49 = 3221225472;
        v50 = (uint64_t)__getAAFAnalyticsEventClass_block_invoke;
        v51 = &unk_24C7B9780;
        v52 = &v53;
        __getAAFAnalyticsEventClass_block_invoke((uint64_t)&v48);
        v22 = (void *)v54[3];
      }
      v23 = objc_retainAutorelease(v22);
      _Block_object_dispose(&v53, 8);
      v24 = (void *)objc_msgSend([v23 alloc], "initWithEventName:eventCategory:initData:", v39, v40, 0);
      if (v41 && (objc_msgSend(v41, "isEqualToString:", &stru_24C7BB930) & 1) == 0)
      {
        v48 = 0;
        v49 = (uint64_t)&v48;
        v50 = 0x2020000000;
        v25 = (_QWORD *)getkAAFFlowIdSymbolLoc_ptr;
        v51 = (void *)getkAAFFlowIdSymbolLoc_ptr;
        if (!getkAAFFlowIdSymbolLoc_ptr)
        {
          v26 = (void *)AAAFoundationLibrary_1049();
          v25 = dlsym(v26, "kAAFFlowId");
          *(_QWORD *)(v49 + 24) = v25;
          getkAAFFlowIdSymbolLoc_ptr = (uint64_t)v25;
        }
        _Block_object_dispose(&v48, 8);
        if (!v25)
        {
          dlerror();
          abort_report_np();
          __break(1u);
        }
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v41, *v25);
      }
      if (v17 && (objc_msgSend(v17, "isEqualToString:", &stru_24C7BB930) & 1) == 0)
      {
        getkAAFDeviceSessionId();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v17, v27);
      }
      else
      {
        +[AAFAnalyticsEventSecurity fetchDeviceSessionIDFromAuthKit:](AAFAnalyticsEventSecurity, "fetchDeviceSessionIDFromAuthKit:", v38);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        getkAAFDeviceSessionId();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v27, v28);

      }
      if (v16)
      {
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        objc_msgSend(v16, "allKeys");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v57, 16);
        if (v30)
        {
          v31 = *(_QWORD *)v43;
          do
          {
            for (i = 0; i != v30; ++i)
            {
              if (*(_QWORD *)v43 != v31)
                objc_enumerationMutation(v29);
              v33 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
              objc_msgSend(v16, "objectForKeyedSubscript:", v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "setObject:forKeyedSubscript:", v34, v33);

            }
            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v57, 16);
          }
          while (v30);
        }

      }
      event = v18->_event;
      v18->_event = (AAFAnalyticsEvent *)v24;

    }
  }
  else
  {
    v47.receiver = self;
    v47.super_class = (Class)AAFAnalyticsEventSecurity;
    v18 = -[AAFAnalyticsEventSecurity init](&v47, sel_init);
    if (v18)
    {
      v18->_isAAAFoundationAvailable = +[AAFAnalyticsEventSecurity isAAAFoundationAvailable](AAFAnalyticsEventSecurity, "isAAAFoundationAvailable");
      v18->_isAuthKitAvailable = +[AAFAnalyticsEventSecurity isAuthKitAvailable](AAFAnalyticsEventSecurity, "isAuthKitAvailable");
      v18->_areTestsEnabled = v10;
      v18->_canSendMetrics = a9;
    }
  }
  v36 = v18;

  return v36;
}

- (AAFAnalyticsEventSecurity)initWithCKKSMetrics:(id)a3 altDSID:(id)a4 eventName:(id)a5 testsAreEnabled:(BOOL)a6 category:(id)a7 sendMetric:(BOOL)a8
{
  uint64_t v9;

  LOBYTE(v9) = a8;
  return -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:](self, "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:", a3, a4, 0, 0, a5, a6, v9, a7);
}

- (AAFAnalyticsEventSecurity)initWithKeychainCircleMetrics:(id)a3 altDSID:(id)a4 eventName:(id)a5 category:(id)a6
{
  uint64_t v7;

  LOBYTE(v7) = 1;
  return -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:](self, "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:", a3, a4, 0, 0, a5, 0, v7, a6);
}

- (void)populateUnderlyingErrorsStartingWithRootError:(id)a3
{
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a3;
  if (-[AAFAnalyticsEventSecurity permittedToSendMetrics](self, "permittedToSendMetrics"))
  {
    -[AAFAnalyticsEventSecurity queue](self, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__AAFAnalyticsEventSecurity_populateUnderlyingErrorsStartingWithRootError___block_invoke;
    block[3] = &unk_24C7B9728;
    block[4] = self;
    v7 = v5;
    dispatch_sync(v4, block);

  }
}

- (void)addMetrics:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  AAFAnalyticsEventSecurity *v8;

  v4 = a3;
  if (-[AAFAnalyticsEventSecurity permittedToSendMetrics](self, "permittedToSendMetrics"))
  {
    -[AAFAnalyticsEventSecurity queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __40__AAFAnalyticsEventSecurity_addMetrics___block_invoke;
    v6[3] = &unk_24C7B9728;
    v7 = v4;
    v8 = self;
    dispatch_async(v5, v6);

  }
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (AAFAnalyticsEvent)event
{
  return (AAFAnalyticsEvent *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEvent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)areTestsEnabled
{
  return self->_areTestsEnabled;
}

- (void)setAreTestsEnabled:(BOOL)a3
{
  self->_areTestsEnabled = a3;
}

- (BOOL)canSendMetrics
{
  return self->_canSendMetrics;
}

- (void)setCanSendMetrics:(BOOL)a3
{
  self->_canSendMetrics = a3;
}

- (BOOL)isAAAFoundationAvailable
{
  return self->_isAAAFoundationAvailable;
}

- (void)setIsAAAFoundationAvailable:(BOOL)a3
{
  self->_isAAAFoundationAvailable = a3;
}

- (BOOL)isAuthKitAvailable
{
  return self->_isAuthKitAvailable;
}

- (void)setIsAuthKitAvailable:(BOOL)a3
{
  self->_isAuthKitAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __40__AAFAnalyticsEventSecurity_addMetrics___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "event");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

void __75__AAFAnalyticsEventSecurity_populateUnderlyingErrorsStartingWithRootError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "event");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "populateUnderlyingErrorsStartingWithRootError:", *(_QWORD *)(a1 + 40));

}

+ (BOOL)isAAAFoundationAvailable
{
  if (isAAAFoundationAvailable_onceToken != -1)
    dispatch_once(&isAAAFoundationAvailable_onceToken, &__block_literal_global_1063);
  return isAAAFoundationAvailable_available;
}

+ (BOOL)isAuthKitAvailable
{
  if (isAuthKitAvailable_onceToken != -1)
    dispatch_once(&isAuthKitAvailable_onceToken, &__block_literal_global_17);
  return isAuthKitAvailable_available;
}

+ (id)fetchDeviceSessionIDFromAuthKit:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 buf;
  Class (*v19)(uint64_t);
  void *v20;
  uint64_t *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v4 = (void *)getAKAccountManagerClass_softClass;
  v17 = getAKAccountManagerClass_softClass;
  if (!getAKAccountManagerClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v19 = __getAKAccountManagerClass_block_invoke;
    v20 = &unk_24C7B9780;
    v21 = &v14;
    __getAKAccountManagerClass_block_invoke((uint64_t)&buf);
    v4 = (void *)v15[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v14, 8);
  objc_msgSend(v5, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    v13 = 0;
    objc_msgSend(v6, "authKitAccountWithAltDSID:error:", v3, &v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v13;
    if (v9)
    {
      secLogObjForScope("SecError");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v9;
        _os_log_impl(&dword_20D7B6000, v10, OS_LOG_TYPE_DEFAULT, "authKitAccountWithAltDSID returned error: %@", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  else
  {
    objc_msgSend(v6, "primaryAuthKitAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v7, "accountAccessTelemetryOptInForAccount:", v8))
  {
    objc_msgSend(v7, "telemetryDeviceSessionIDForAccount:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __47__AAFAnalyticsEventSecurity_isAuthKitAvailable__block_invoke()
{
  NSObject *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  if (!AuthKitLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_24C7B9760;
    v2 = 0;
    AuthKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (AuthKitLibraryCore_frameworkLibrary)
  {
    isAuthKitAvailable_available = 1;
  }
  else
  {
    secLogObjForScope("SecError");
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v1) = 0;
      _os_log_impl(&dword_20D7B6000, v0, OS_LOG_TYPE_DEFAULT, "aafanalyticsevent-security: failed to softlink AuthKit", (uint8_t *)&v1, 2u);
    }

  }
}

void __53__AAFAnalyticsEventSecurity_isAAAFoundationAvailable__block_invoke()
{
  NSObject *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  if (!AAAFoundationLibraryCore_frameworkLibrary_1052)
  {
    v1 = xmmword_24C7B9748;
    v2 = 0;
    AAAFoundationLibraryCore_frameworkLibrary_1052 = _sl_dlopen();
  }
  if (AAAFoundationLibraryCore_frameworkLibrary_1052)
  {
    isAAAFoundationAvailable_available = 1;
  }
  else
  {
    secLogObjForScope("SecError");
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v1) = 0;
      _os_log_impl(&dword_20D7B6000, v0, OS_LOG_TYPE_DEFAULT, "aafanalyticsevent-security: failed to softlink AAAFoundation", (uint8_t *)&v1, 2u);
    }

  }
}

@end
