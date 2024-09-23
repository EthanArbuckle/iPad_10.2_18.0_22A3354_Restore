@implementation HFMediaServiceManager

- (void)warmup
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__HFMediaServiceManager_warmup__block_invoke;
  v6[3] = &unk_1EA73EBB8;
  v6[4] = self;
  v5 = (id)objc_msgSend(v4, "addSuccessBlock:", v6);

}

void __31__HFMediaServiceManager_warmup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "hf_hasHomePods"))
    v3 = (id)objc_msgSend(*(id *)(a1 + 32), "fetchMediaServicesForHome:", v4);

}

- (id)mediaServicesForHome:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFMediaServiceManager _mediaServicesForHome:](self, "_mediaServicesForHome:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory(0xCuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Found cached media services %@ for home %@", (uint8_t *)&v8, 0x16u);
  }

  return v5;
}

- (id)_mediaServicesForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[HFMediaServiceManager homeIdentifierToMediaServicesMapping](self, "homeIdentifierToMediaServicesMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSMutableDictionary)homeIdentifierToMediaServicesMapping
{
  return self->_homeIdentifierToMediaServicesMapping;
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__HFMediaServiceManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED379E88 != -1)
    dispatch_once(&qword_1ED379E88, block);
  return (id)_MergedGlobals_326;
}

void __38__HFMediaServiceManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_326;
  _MergedGlobals_326 = (uint64_t)v1;

}

- (HFMediaServiceManager)init
{
  HFMediaServiceManager *v2;
  uint64_t v3;
  NSMutableDictionary *homeIdentifierToMediaServicesMapping;
  uint64_t v5;
  NSMutableDictionary *homeIdentifierToDefaultServiceMapping;
  uint64_t v7;
  NSMutableDictionary *homeIdentifierToReadRequestInFlightMapping;
  uint64_t v9;
  NSMutableDictionary *homeIdentifierToRefreshNeededMapping;
  uint64_t v11;
  NSHashTable *observers;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HFMediaServiceManager;
  v2 = -[HFMediaServiceManager init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    homeIdentifierToMediaServicesMapping = v2->_homeIdentifierToMediaServicesMapping;
    v2->_homeIdentifierToMediaServicesMapping = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    homeIdentifierToDefaultServiceMapping = v2->_homeIdentifierToDefaultServiceMapping;
    v2->_homeIdentifierToDefaultServiceMapping = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    homeIdentifierToReadRequestInFlightMapping = v2->_homeIdentifierToReadRequestInFlightMapping;
    v2->_homeIdentifierToReadRequestInFlightMapping = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    homeIdentifierToRefreshNeededMapping = v2->_homeIdentifierToRefreshNeededMapping;
    v2->_homeIdentifierToRefreshNeededMapping = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v11;

  }
  return v2;
}

- (void)addMediaServiceManagerObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFMediaServiceManager observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeMediaServiceManagerObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFMediaServiceManager observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (id)defaultMediaServiceForHome:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFMediaServiceManager _defaultMediaServiceForHome:](self, "_defaultMediaServiceForHome:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory(0xCuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Found cached default media service %@ for home %@", (uint8_t *)&v8, 0x16u);
  }

  return v5;
}

- (id)fetchMediaServicesForHome:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30[2];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory(0xCuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v32 = v7;
    v33 = 2112;
    v34 = v5;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "%@ Fetching media services for home %@", buf, 0x16u);

  }
  if (v5)
  {
    v8 = -[HFMediaServiceManager _isReadRequestInFlightForHome:](self, "_isReadRequestInFlightForHome:", v5);
    HFLogForCategory(0xCuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        NSStringFromSelector(a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v32 = v11;
        _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "%@ Read request already in-flight. Returning cached results.", buf, 0xCu);

      }
      v12 = (void *)MEMORY[0x1E0D519C0];
      -[HFMediaServiceManager _mediaServicesForHome:](self, "_mediaServicesForHome:", v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "futureWithResult:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v10)
      {
        NSStringFromSelector(a2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v32 = v18;
        v33 = 2112;
        v34 = v5;
        _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "%@ Will fetch media services for home %@ from MediaServiceConfigurationClass", buf, 0x16u);

      }
      -[HFMediaServiceManager homeIdentifierToReadRequestInFlightMapping](self, "homeIdentifierToReadRequestInFlightMapping");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "UUIDString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "na_safeSetObject:forKey:", MEMORY[0x1E0C9AAB0], v21);

      objc_initWeak((id *)buf, self);
      v22 = (void *)MEMORY[0x1E0D519C0];
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __51__HFMediaServiceManager_fetchMediaServicesForHome___block_invoke;
      v28[3] = &unk_1EA72B098;
      objc_copyWeak(v30, (id *)buf);
      v29 = v5;
      v30[1] = (id)a2;
      objc_msgSend(MEMORY[0x1E0D519E8], "globalAsyncScheduler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "futureWithBlock:scheduler:", v28, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "reschedule:", v25);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(v30);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    HFLogForCategory(0xCuLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v32 = v27;
      _os_log_error_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_ERROR, "%@ Cannot fetch media services without a home", buf, 0xCu);

    }
    v16 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 33);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "futureWithError:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

void __51__HFMediaServiceManager_fetchMediaServicesForHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13[2];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(getMediaServiceConfigurationClass(), "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__HFMediaServiceManager_fetchMediaServicesForHome___block_invoke_2;
  v10[3] = &unk_1EA740A50;
  objc_copyWeak(v13, (id *)(a1 + 40));
  v7 = *(id *)(a1 + 32);
  v8 = *(void **)(a1 + 48);
  v11 = v7;
  v13[1] = v8;
  v9 = v3;
  v12 = v9;
  objc_msgSend(v5, "getAvailableServices:completion:", v6, v10);

  objc_destroyWeak(v13);
}

void __51__HFMediaServiceManager_fetchMediaServicesForHome___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (v6)
  {
    objc_msgSend(WeakRetained, "homeIdentifierToReadRequestInFlightMapping");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeSetObject:forKey:", MEMORY[0x1E0C9AAA0], v11);

    HFLogForCategory(0xCuLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v17;
      v25 = 2112;
      v26 = v6;
      _os_log_error_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_ERROR, "%@ Failed to fetch media services with error %@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v6);
  }
  else
  {
    objc_msgSend(WeakRetained, "_fetchDefaultMediaServiceForHome:", *(_QWORD *)(a1 + 32));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __51__HFMediaServiceManager_fetchMediaServicesForHome___block_invoke_6;
    v18[3] = &unk_1EA740A28;
    v18[4] = v8;
    v19 = *(id *)(a1 + 32);
    v14 = *(id *)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 56);
    v20 = v14;
    v22 = v15;
    v21 = v5;
    v16 = (id)objc_msgSend(v13, "addCompletionBlock:", v18);

  }
}

void __51__HFMediaServiceManager_fetchMediaServicesForHome___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "homeIdentifierToReadRequestInFlightMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeSetObject:forKey:", MEMORY[0x1E0C9AAA0], v7);

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "homeIdentifierToRefreshNeededMapping");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "na_safeSetObject:forKey:", MEMORY[0x1E0C9AAA0], v10);

    HFLogForCategory(0xCuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "%@ Successfully fetched media services %@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "homeIdentifierToMediaServicesMapping");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "na_safeSetObject:forKey:", v15, v17);

    v18 = *(void **)(a1 + 32);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __51__HFMediaServiceManager_fetchMediaServicesForHome___block_invoke_7;
    v19[3] = &unk_1EA740A00;
    v20 = *(id *)(a1 + 56);
    objc_msgSend(v18, "_dispatchMessageToObserversWithBlock:", v19);
    objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", *(_QWORD *)(a1 + 56));

  }
}

void __51__HFMediaServiceManager_fetchMediaServicesForHome___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "mediaServicesDidUpdate:", *(_QWORD *)(a1 + 32));

}

- (id)removeMediaService:(id)a3 forHome:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  HFMediaServiceManager *v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HFLogForCategory(0xCuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v6;
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Removing media service %@ for home %@", buf, 0x16u);
  }

  v9 = (void *)MEMORY[0x1E0D519C0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __52__HFMediaServiceManager_removeMediaService_forHome___block_invoke;
  v18[3] = &unk_1EA73A238;
  v19 = v6;
  v20 = v7;
  v21 = self;
  v10 = (void *)MEMORY[0x1E0D519E8];
  v11 = v7;
  v12 = v6;
  objc_msgSend(v10, "globalAsyncScheduler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "futureWithBlock:scheduler:", v18, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reschedule:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __52__HFMediaServiceManager_removeMediaService_forHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  int8x16_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  int8x16_t v13;

  v3 = a2;
  objc_msgSend(getMediaServiceConfigurationClass(), "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__HFMediaServiceManager_removeMediaService_forHome___block_invoke_2;
  v10[3] = &unk_1EA740A78;
  v11 = v5;
  v12 = v3;
  v9 = *(int8x16_t *)(a1 + 40);
  v7 = (id)v9.i64[0];
  v13 = vextq_s8(v9, v9, 8uLL);
  v8 = v3;
  objc_msgSend(v4, "removeServiceFromHome:fromHome:completion:", v11, v6, v10);

}

void __52__HFMediaServiceManager_removeMediaService_forHome___block_invoke_2(id *a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    HFLogForCategory(0xCuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v12 = a1[4];
      *(_DWORD *)buf = 138412546;
      v16 = v12;
      v17 = 2112;
      v18 = v4;
      _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "Failed to remove media service %@ with error %@", buf, 0x16u);
    }

    objc_msgSend(a1[5], "finishWithError:", v4);
  }
  else
  {
    objc_msgSend(a1[6], "homeIdentifierToRefreshNeededMapping");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[7], "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_safeSetObject:forKey:", MEMORY[0x1E0C9AAB0], v8);

    HFLogForCategory(0xCuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = a1[4];
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Successfully removed media service %@", buf, 0xCu);
    }

    v11 = a1[6];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __52__HFMediaServiceManager_removeMediaService_forHome___block_invoke_15;
    v13[3] = &unk_1EA740A00;
    v14 = a1[4];
    objc_msgSend(v11, "_dispatchMessageToObserversWithBlock:", v13);
    objc_msgSend(a1[5], "finishWithNoResult");

  }
}

void __52__HFMediaServiceManager_removeMediaService_forHome___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "mediaServiceRemoved:", *(_QWORD *)(a1 + 32));

}

- (id)updateDefaultMediaService:(id)a3 forHome:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  HFMediaServiceManager *v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HFLogForCategory(0xCuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v6;
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Updating default media service to %@ for home %@", buf, 0x16u);
  }

  v9 = (void *)MEMORY[0x1E0D519C0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __59__HFMediaServiceManager_updateDefaultMediaService_forHome___block_invoke;
  v18[3] = &unk_1EA73A238;
  v19 = v6;
  v20 = v7;
  v21 = self;
  v10 = (void *)MEMORY[0x1E0D519E8];
  v11 = v7;
  v12 = v6;
  objc_msgSend(v10, "globalAsyncScheduler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "futureWithBlock:scheduler:", v18, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reschedule:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __59__HFMediaServiceManager_updateDefaultMediaService_forHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  int8x16_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  int8x16_t v13;

  v3 = a2;
  objc_msgSend(getMediaServiceConfigurationClass(), "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__HFMediaServiceManager_updateDefaultMediaService_forHome___block_invoke_2;
  v10[3] = &unk_1EA740A78;
  v11 = v5;
  v12 = v3;
  v9 = *(int8x16_t *)(a1 + 40);
  v7 = (id)v9.i64[0];
  v13 = vextq_s8(v9, v9, 8uLL);
  v8 = v3;
  objc_msgSend(v4, "updateDefaultMediaService:forHome:completion:", v11, v6, v10);

}

void __59__HFMediaServiceManager_updateDefaultMediaService_forHome___block_invoke_2(id *a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    HFLogForCategory(0xCuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v12 = a1[4];
      *(_DWORD *)buf = 138412546;
      v16 = v12;
      v17 = 2112;
      v18 = v4;
      _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "Failed to update default media service to %@ with error %@", buf, 0x16u);
    }

    objc_msgSend(a1[5], "finishWithError:", v4);
  }
  else
  {
    objc_msgSend(a1[6], "homeIdentifierToRefreshNeededMapping");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[7], "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_safeSetObject:forKey:", MEMORY[0x1E0C9AAB0], v8);

    HFLogForCategory(0xCuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = a1[4];
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Successfully updated default media service to %@", buf, 0xCu);
    }

    v11 = a1[6];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __59__HFMediaServiceManager_updateDefaultMediaService_forHome___block_invoke_19;
    v13[3] = &unk_1EA740A00;
    v14 = a1[4];
    objc_msgSend(v11, "_dispatchMessageToObserversWithBlock:", v13);
    objc_msgSend(a1[5], "finishWithNoResult");

  }
}

void __59__HFMediaServiceManager_updateDefaultMediaService_forHome___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "defaultMediaServiceDidUpdate:", *(_QWORD *)(a1 + 32));

}

- (id)updateProperty:(id)a3 forHome:(id)a4 withOptions:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  HFMediaServiceManager *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  HFLogForCategory(0xCuLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v28 = v10;
    v29 = 2112;
    v30 = v8;
    v31 = 2112;
    v32 = v9;
    _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "Updating properties %@ for media service %@ for home %@", buf, 0x20u);
  }

  v12 = (void *)MEMORY[0x1E0D519C0];
  v22 = MEMORY[0x1E0C809B0];
  v23 = v8;
  v24 = v9;
  v25 = v10;
  v26 = self;
  v13 = (void *)MEMORY[0x1E0D519E8];
  v14 = v10;
  v15 = v9;
  v16 = v8;
  objc_msgSend(v13, "globalAsyncScheduler", v22, 3221225472, __60__HFMediaServiceManager_updateProperty_forHome_withOptions___block_invoke, &unk_1EA737000);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "futureWithBlock:scheduler:", &v22, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reschedule:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

void __60__HFMediaServiceManager_updateProperty_forHome_withOptions___block_invoke(uint64_t *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  v3 = a2;
  objc_msgSend(getMediaServiceConfigurationClass(), "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a1[4];
  v6 = a1[5];
  v7 = (void *)a1[6];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__HFMediaServiceManager_updateProperty_forHome_withOptions___block_invoke_2;
  v9[3] = &unk_1EA740AA0;
  v10 = v7;
  v11 = (id)a1[4];
  v12 = v3;
  v13 = a1[7];
  v14 = (id)a1[5];
  v8 = v3;
  objc_msgSend(v4, "updateProperty:forHome:withOptions:completion:", v5, v6, v10, v9);

}

void __60__HFMediaServiceManager_updateProperty_forHome_withOptions___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    HFLogForCategory(0xCuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      v20 = 2112;
      v21 = v4;
      _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "Failed to update properties %@ for media service %@ with error %@", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "homeIdentifierToRefreshNeededMapping");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_safeSetObject:forKey:", MEMORY[0x1E0C9AAB0], v8);

    HFLogForCategory(0xCuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v17 = v10;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Successfully updated media service %@", buf, 0xCu);
    }

    v11 = *(void **)(a1 + 56);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __60__HFMediaServiceManager_updateProperty_forHome_withOptions___block_invoke_22;
    v14[3] = &unk_1EA740A00;
    v15 = *(id *)(a1 + 40);
    objc_msgSend(v11, "_dispatchMessageToObserversWithBlock:", v14);
    objc_msgSend(*(id *)(a1 + 48), "finishWithNoResult");

  }
}

void __60__HFMediaServiceManager_updateProperty_forHome_withOptions___block_invoke_22(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "mediaServiceDidUpdate:", *(_QWORD *)(a1 + 32));

}

- (id)_fetchDefaultMediaServiceForHome:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0xCuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Fetching default media service for home %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v6 = (void *)MEMORY[0x1E0D519C0];
  v11 = MEMORY[0x1E0C809B0];
  objc_copyWeak(&v13, (id *)buf);
  v7 = v4;
  v12 = v7;
  objc_msgSend(MEMORY[0x1E0D519E8], "globalAsyncScheduler", v11, 3221225472, __58__HFMediaServiceManager__fetchDefaultMediaServiceForHome___block_invoke, &unk_1EA72F630);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "futureWithBlock:scheduler:", &v11, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

  return v9;
}

void __58__HFMediaServiceManager__fetchDefaultMediaServiceForHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(getMediaServiceConfigurationClass(), "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__HFMediaServiceManager__fetchDefaultMediaServiceForHome___block_invoke_2;
  v8[3] = &unk_1EA740AC8;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v7 = v3;
  v9 = v7;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v5, "getDefaultMediaService:completion:", v6, v8);

  objc_destroyWeak(&v11);
}

void __58__HFMediaServiceManager__fetchDefaultMediaServiceForHome___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  HFLogForCategory(0xCuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412290;
      v16 = v6;
      _os_log_error_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_ERROR, "Failed to fetch default media service with error %@", (uint8_t *)&v15, 0xCu);
    }

    objc_msgSend(a1[4], "finishWithError:", v6);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v5;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Successfully fetched default media service %@", (uint8_t *)&v15, 0xCu);
    }

    objc_msgSend(WeakRetained, "homeIdentifierToDefaultServiceMapping");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "na_safeSetObject:forKey:", v5, v12);

    v13 = a1[4];
    objc_msgSend(WeakRetained, "_defaultMediaServiceForHome:", a1[5]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "finishWithResult:", v14);

  }
}

- (id)_defaultMediaServiceForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[HFMediaServiceManager homeIdentifierToDefaultServiceMapping](self, "homeIdentifierToDefaultServiceMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_isReadRequestInFlightForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[HFMediaServiceManager homeIdentifierToReadRequestInFlightMapping](self, "homeIdentifierToReadRequestInFlightMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_objectForKey:withDefaultValue:", v7, &__block_literal_global_231);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  return v9;
}

uint64_t __55__HFMediaServiceManager__isReadRequestInFlightForHome___block_invoke()
{
  return MEMORY[0x1E0C9AAA0];
}

- (BOOL)isRefreshNeededForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[HFMediaServiceManager homeIdentifierToRefreshNeededMapping](self, "homeIdentifierToRefreshNeededMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_objectForKey:withDefaultValue:", v7, &__block_literal_global_26_4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  return v9;
}

uint64_t __48__HFMediaServiceManager_isRefreshNeededForHome___block_invoke()
{
  return MEMORY[0x1E0C9AAA0];
}

- (void)_dispatchMessageToObserversWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HFMediaServiceManager observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    v10 = MEMORY[0x1E0C809B0];
    v11 = MEMORY[0x1E0C80D38];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        v15[0] = v10;
        v15[1] = 3221225472;
        v15[2] = __62__HFMediaServiceManager__dispatchMessageToObserversWithBlock___block_invoke;
        v15[3] = &unk_1EA728120;
        v14 = v4;
        v15[4] = v13;
        v16 = v14;
        dispatch_async(v11, v15);

        ++v12;
      }
      while (v8 != v12);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

}

uint64_t __62__HFMediaServiceManager__dispatchMessageToObserversWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)setHomeIdentifierToMediaServicesMapping:(id)a3
{
  objc_storeStrong((id *)&self->_homeIdentifierToMediaServicesMapping, a3);
}

- (NSMutableDictionary)homeIdentifierToDefaultServiceMapping
{
  return self->_homeIdentifierToDefaultServiceMapping;
}

- (void)setHomeIdentifierToDefaultServiceMapping:(id)a3
{
  objc_storeStrong((id *)&self->_homeIdentifierToDefaultServiceMapping, a3);
}

- (NSMutableDictionary)homeIdentifierToReadRequestInFlightMapping
{
  return self->_homeIdentifierToReadRequestInFlightMapping;
}

- (void)setHomeIdentifierToReadRequestInFlightMapping:(id)a3
{
  objc_storeStrong((id *)&self->_homeIdentifierToReadRequestInFlightMapping, a3);
}

- (NSMutableDictionary)homeIdentifierToRefreshNeededMapping
{
  return self->_homeIdentifierToRefreshNeededMapping;
}

- (void)setHomeIdentifierToRefreshNeededMapping:(id)a3
{
  objc_storeStrong((id *)&self->_homeIdentifierToRefreshNeededMapping, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_homeIdentifierToRefreshNeededMapping, 0);
  objc_storeStrong((id *)&self->_homeIdentifierToReadRequestInFlightMapping, 0);
  objc_storeStrong((id *)&self->_homeIdentifierToDefaultServiceMapping, 0);
  objc_storeStrong((id *)&self->_homeIdentifierToMediaServicesMapping, 0);
}

@end
