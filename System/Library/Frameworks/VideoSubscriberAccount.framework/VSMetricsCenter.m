@implementation VSMetricsCenter

+ (id)sharedMetricsCenter
{
  if (sharedMetricsCenter___vs_lazy_init_predicate != -1)
    dispatch_once(&sharedMetricsCenter___vs_lazy_init_predicate, &__block_literal_global_16);
  return (id)sharedMetricsCenter___vs_lazy_init_variable;
}

void __38__VSMetricsCenter_sharedMetricsCenter__block_invoke()
{
  VSMetricsCenter *v0;
  void *v1;

  v0 = objc_alloc_init(VSMetricsCenter);
  v1 = (void *)sharedMetricsCenter___vs_lazy_init_variable;
  sharedMetricsCenter___vs_lazy_init_variable = (uint64_t)v0;

}

- (VSMetricsCenter)init
{
  VSMetricsCenter *v2;
  VSAnalyticsServiceConnection *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *eventQueue;
  NSOperationQueue *v6;
  NSOperationQueue *privateQueue;
  VSPreferences *v8;
  VSPreferences *preferences;
  VSRemoteNotifier *v10;
  VSRemoteNotifier *remoteNotifier;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VSMetricsCenter;
  v2 = -[VSMetricsCenter init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VSAnalyticsServiceConnection);
    -[VSMetricsCenter setAnalyticsService:](v2, "setAnalyticsService:", v3);

    v4 = dispatch_queue_create("EventQueue", 0);
    eventQueue = v2->_eventQueue;
    v2->_eventQueue = (OS_dispatch_queue *)v4;

    v6 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = v6;

    -[NSOperationQueue setName:](v2->_privateQueue, "setName:", CFSTR("VSMetricsCenter"));
    v8 = objc_alloc_init(VSPreferences);
    preferences = v2->_preferences;
    v2->_preferences = v8;

    v10 = -[VSRemoteNotifier initWithNotificationName:]([VSRemoteNotifier alloc], "initWithNotificationName:", CFSTR("VSAccountStoreDidChangeNotification"));
    remoteNotifier = v2->_remoteNotifier;
    v2->_remoteNotifier = v10;

    -[VSRemoteNotifier setDelegate:](v2->_remoteNotifier, "setDelegate:", v2);
    +[VSManagedProfileConnection sharedConnection](VSManagedProfileConnection, "sharedConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "registerObserver:", v2);
    -[VSMetricsCenter fetchSetTopBoxProfile](v2, "fetchSetTopBoxProfile");
    -[VSMetricsCenter accountStoreDidChange](v2, "accountStoreDidChange");

  }
  return v2;
}

- (void)recordSignInEventWithProviderIdentifier:(id)a3 supportedProvider:(BOOL)a4 channelAdamID:(id)a5 signInType:(id)a6 error:(id)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  NSObject *v25;
  id v26;
  _QWORD v27[5];
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v10 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a7;
  v15 = a6;
  VSDefaultLogObject();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v30 = v12;
    v31 = 2112;
    v32 = v14;
    v33 = 2112;
    v34 = v13;
    _os_log_impl(&dword_1D2419000, v16, OS_LOG_TYPE_DEFAULT, "Will publish sign in event with provider %@ error %@ from channel adam ID %@", buf, 0x20u);
  }

  -[VSMetricsCenter mutableBaseFields](self, "mutableBaseFields");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSMetricsCenter flexibleBaseFields](self, "flexibleBaseFields");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addEntriesFromDictionary:", v18);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v19, CFSTR("supported_provider"));

  objc_msgSend(v17, "setObject:forKey:", v15, CFSTR("sign_in_type"));
  if (v14)
  {
    v20 = v14;
    objc_msgSend(v20, "domain");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v21, CFSTR("error_type"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v20, "code"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v22, CFSTR("error_code"));

    -[VSMetricsCenter underlyingErrorsArray:](self, "underlyingErrorsArray:", v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setObject:forKey:", v23, CFSTR("errors_underlying"));
  }
  if (v13)
    v24 = (__CFString *)v13;
  else
    v24 = &stru_1E93A8CC0;
  objc_msgSend(v17, "setObject:forKey:", v24, CFSTR("requestor"));
  objc_msgSend(v17, "setObject:forKey:", v12, CFSTR("provider_id"));
  -[VSMetricsCenter eventQueue](self, "eventQueue");
  v25 = objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __108__VSMetricsCenter_recordSignInEventWithProviderIdentifier_supportedProvider_channelAdamID_signInType_error___block_invoke;
  v27[3] = &unk_1E939F138;
  v27[4] = self;
  v28 = v17;
  v26 = v17;
  dispatch_async(v25, v27);

}

uint64_t __108__VSMetricsCenter_recordSignInEventWithProviderIdentifier_supportedProvider_channelAdamID_signInType_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendFlexibleEventToAnalyticsService:data:", CFSTR("sign_in"), *(_QWORD *)(a1 + 40));
}

- (void)recordSignOutEventWithProviderIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "Will publish sign out event with provider %@.", buf, 0xCu);
  }

  -[VSMetricsCenter mutableBaseFields](self, "mutableBaseFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSMetricsCenter flexibleBaseFields](self, "flexibleBaseFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v7);

  objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("provider_id"));
  -[VSMetricsCenter eventQueue](self, "eventQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__VSMetricsCenter_recordSignOutEventWithProviderIdentifier___block_invoke;
  v10[3] = &unk_1E939F138;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  dispatch_async(v8, v10);

}

uint64_t __60__VSMetricsCenter_recordSignOutEventWithProviderIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendFlexibleEventToAnalyticsService:data:", CFSTR("signed_out"), *(_QWORD *)(a1 + 40));
}

- (void)recordMetadataRequestWithProviderIdentifier:(id)a3 channelAdamID:(id)a4 fulfilledByProvider:(BOOL)a5 error:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v7 = a5;
  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  VSDefaultLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v25 = v10;
    v26 = 2112;
    v27 = v11;
    _os_log_impl(&dword_1D2419000, v13, OS_LOG_TYPE_DEFAULT, "Will publish metadata request event with provider %@ from channel adam ID %@.", buf, 0x16u);
  }

  -[VSMetricsCenter mutableBaseFields](self, "mutableBaseFields");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSMetricsCenter flexibleBaseFields](self, "flexibleBaseFields");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addEntriesFromDictionary:", v15);

  if (v7)
    objc_msgSend(v14, "setObject:forKey:", CFSTR("app"), CFSTR("sign_in_type"));
  if (v12)
  {
    v16 = v12;
    objc_msgSend(v16, "domain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v17, CFSTR("error_type"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v16, "code"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v18, CFSTR("error_code"));

    -[VSMetricsCenter underlyingErrorsArray:](self, "underlyingErrorsArray:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setObject:forKey:", v19, CFSTR("errors_underlying"));
  }
  objc_msgSend(v14, "setObject:forKey:", v11, CFSTR("requestor"));
  objc_msgSend(v14, "setObject:forKey:", v10, CFSTR("provider_id"));
  -[VSMetricsCenter eventQueue](self, "eventQueue");
  v20 = objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __103__VSMetricsCenter_recordMetadataRequestWithProviderIdentifier_channelAdamID_fulfilledByProvider_error___block_invoke;
  v22[3] = &unk_1E939F138;
  v22[4] = self;
  v23 = v14;
  v21 = v14;
  dispatch_async(v20, v22);

}

uint64_t __103__VSMetricsCenter_recordMetadataRequestWithProviderIdentifier_channelAdamID_fulfilledByProvider_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendFlexibleEventToAnalyticsService:data:", CFSTR("user_metadata"), *(_QWORD *)(a1 + 40));
}

- (void)recordSTBOptOutEventWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v4;
    _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "Will publish opt out event with error %@.", buf, 0xCu);
  }

  -[VSMetricsCenter mutableBaseFields](self, "mutableBaseFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSMetricsCenter flexibleBaseFields](self, "flexibleBaseFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v7);

  if (v4)
  {
    v8 = v4;
    objc_msgSend(v8, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("error_type"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "code"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("error_code"));

    -[VSMetricsCenter underlyingErrorsArray:](self, "underlyingErrorsArray:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setObject:forKey:", v11, CFSTR("errors_underlying"));
  }
  -[VSMetricsCenter stbProfile](self, "stbProfile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [self stbProfile] parameter must not be nil."));
  -[VSMetricsCenter stbProfile](self, "stbProfile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "providerID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v14, CFSTR("requestor"));

  -[VSMetricsCenter eventQueue](self, "eventQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __49__VSMetricsCenter_recordSTBOptOutEventWithError___block_invoke;
  v17[3] = &unk_1E939F138;
  v17[4] = self;
  v18 = v6;
  v16 = v6;
  dispatch_async(v15, v17);

}

uint64_t __49__VSMetricsCenter_recordSTBOptOutEventWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendFlexibleEventToAnalyticsService:data:", CFSTR("stb_opt_out"), *(_QWORD *)(a1 + 40));
}

- (void)recordEnterEventWithPage:(id)a3 pageType:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  VSDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_1D2419000, v8, OS_LOG_TYPE_DEFAULT, "Will publish enter event with page %@", buf, 0xCu);
  }

  -[VSMetricsCenter mutableBaseFields](self, "mutableBaseFields");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSMetricsCenter eventQueue](self, "eventQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__VSMetricsCenter_recordEnterEventWithPage_pageType___block_invoke;
  v14[3] = &unk_1E939FA20;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v17 = v9;
  v11 = v9;
  v12 = v7;
  v13 = v6;
  dispatch_async(v10, v14);

}

uint64_t __53__VSMetricsCenter_recordEnterEventWithPage_pageType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendEnterEventToAnalyticsServiceWithPage:pageType:data:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)recordExitEventWithPage:(id)a3 pageType:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  VSDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2419000, v8, OS_LOG_TYPE_DEFAULT, "Will publish exit event.", buf, 2u);
  }

  -[VSMetricsCenter eventQueue](self, "eventQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__VSMetricsCenter_recordExitEventWithPage_pageType___block_invoke;
  block[3] = &unk_1E939F400;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __52__VSMetricsCenter_recordExitEventWithPage_pageType___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "mutableBaseFields");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sendExitEventToAnalyticsServiceWithPage:pageType:data:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v2);

}

- (void)recordClickEventWithPage:(id)a3 pageType:(id)a4 target:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  VSDefaultLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2419000, v11, OS_LOG_TYPE_DEFAULT, "Will publish click event.", buf, 2u);
  }

  -[VSMetricsCenter mutableBaseFields](self, "mutableBaseFields");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v10, *MEMORY[0x1E0D4DE68]);

  -[VSMetricsCenter eventQueue](self, "eventQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __60__VSMetricsCenter_recordClickEventWithPage_pageType_target___block_invoke;
  v17[3] = &unk_1E939FA20;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v12;
  v14 = v12;
  v15 = v9;
  v16 = v8;
  dispatch_async(v13, v17);

}

uint64_t __60__VSMetricsCenter_recordClickEventWithPage_pageType_target___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendClickEventToAnalyticsServiceWithPage:pageType:data:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)recordInvalidTemplateErrorWithProviderAppAdamID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "Will publish invalid template error with template for provider app %@", buf, 0xCu);
  }

  -[VSMetricsCenter mutableBaseFields](self, "mutableBaseFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("requestor"));
  -[VSMetricsCenter eventQueue](self, "eventQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__VSMetricsCenter_recordInvalidTemplateErrorWithProviderAppAdamID___block_invoke;
  v9[3] = &unk_1E939F138;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

}

uint64_t __67__VSMetricsCenter_recordInvalidTemplateErrorWithProviderAppAdamID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendFlexibleEventToAnalyticsService:data:", CFSTR("prohibited_template_error"), *(_QWORD *)(a1 + 40));
}

- (void)fetchSetTopBoxProfile
{
  void *v3;
  _QWORD v4[5];

  +[VSDevice currentDevice](VSDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__VSMetricsCenter_fetchSetTopBoxProfile__block_invoke;
  v4[3] = &unk_1E939FA48;
  v4[4] = self;
  objc_msgSend(v3, "fetchDeviceManagedSetTopBoxProfileWithCompletion:", v4);

}

uint64_t __40__VSMetricsCenter_fetchSetTopBoxProfile__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setStbProfile:", a2);
}

- (id)mutableBaseFields
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VSMetricsCenter hasSetTopBoxProfile](self, "hasSetTopBoxProfile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("has_stb_profile"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VSMetricsCenter currentProviderIsSetTopBoxProvider](self, "currentProviderIsSetTopBoxProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("selected_provider_profile"));

  -[VSMetricsCenter currentIdentityProvider](self, "currentIdentityProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (-[VSMetricsCenter currentIdentityProviderSupportsSTB](self, "currentIdentityProviderSupportsSTB"))
    {
      v7 = CFSTR("stb");
    }
    else if (-[VSMetricsCenter currentIdentityProviderIsFullySupported](self, "currentIdentityProviderIsFullySupported"))
    {
      v7 = CFSTR("supported");
    }
    else
    {
      v7 = CFSTR("unsupported");
    }
  }
  else
  {
    v7 = CFSTR("none");
  }
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("selected_provider"));
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v3, "setObject:forKey:", v9, *MEMORY[0x1E0D4DE58]);
  v10 = (void *)MEMORY[0x1E0CFDCA8];
  objc_msgSend(MEMORY[0x1E0CFDBD0], "currentProcess");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userAgentForProcessInfo:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, *MEMORY[0x1E0D4DE70]);

  return v3;
}

- (id)flexibleBaseFields
{
  void *v2;

  if (flexibleBaseFields_onceToken != -1)
    dispatch_once(&flexibleBaseFields_onceToken, &__block_literal_global_138);
  v2 = (void *)flexibleBaseFields_baseFields;
  if (!flexibleBaseFields_baseFields)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The baseFields parameter must not be nil."));
    v2 = (void *)flexibleBaseFields_baseFields;
  }
  return (id)objc_msgSend(v2, "mutableCopy");
}

uint64_t __37__VSMetricsCenter_flexibleBaseFields__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)flexibleBaseFields_baseFields;
  flexibleBaseFields_baseFields = (uint64_t)v0;

  return objc_msgSend((id)flexibleBaseFields_baseFields, "setObject:forKey:", CFSTR("iOS"), *MEMORY[0x1E0D4DE60]);
}

- (id)userID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  -[VSMetricsCenter preferences](self, "preferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metricUserID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSMetricsCenter preferences](self, "preferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metricUserIDLastGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (!v4)
      goto LABEL_9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The lastGeneratedOrNil parameter must not be nil."));
  objc_msgSend(v7, "timeIntervalSinceDate:", v6);
  v9 = v8;

  if (v9 < 15552000.0)
  {
    v10 = v4;
    goto LABEL_12;
  }
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSMetricsCenter preferences](self, "preferences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v10)
  {
    objc_msgSend(v12, "setMetricUserID:", v10);

  }
  else
  {
    v14 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The userIDOrNil parameter must not be nil."));
    objc_msgSend(v13, "setMetricUserID:", 0);

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v14, CFSTR("The userIDOrNil parameter must not be nil."));
  }
LABEL_12:

  return v10;
}

- (BOOL)currentProviderIsSetTopBoxProvider
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  if (!-[VSMetricsCenter hasSetTopBoxProfile](self, "hasSetTopBoxProfile"))
    return 0;
  -[VSMetricsCenter stbProfile](self, "stbProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [self stbProfile] parameter must not be nil."));
  -[VSMetricsCenter stbProfile](self, "stbProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "providerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSMetricsCenter currentIdentityProvider](self, "currentIdentityProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "uniqueID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "forceUnwrapObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "isEqualToString:", v5);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)hasSetTopBoxProfile
{
  void *v2;
  BOOL v3;

  -[VSMetricsCenter stbProfile](self, "stbProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)accountStoreDidChange
{
  void *v3;
  _QWORD v4[5];

  +[VSAccountStore sharedAccountStore](VSAccountStore, "sharedAccountStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__VSMetricsCenter_accountStoreDidChange__block_invoke;
  v4[3] = &unk_1E939EDB8;
  v4[4] = self;
  objc_msgSend(v3, "fetchAccountsWithCompletionHandler:", v4);

}

uint64_t __40__VSMetricsCenter_accountStoreDidChange__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__VSMetricsCenter_accountStoreDidChange__block_invoke_2;
  v3[3] = &unk_1E939FAB8;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "unwrapObject:error:", v3, &__block_literal_global_163);
}

void __40__VSMetricsCenter_accountStoreDidChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD block[5];
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  id v21;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v21 = 0;
    v4 = VSLoadInterfaceFramework((uint64_t)&v21);
    v5 = v21;
    if (v4)
    {
      objc_msgSend(v3, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [accounts firstObject] parameter must not be nil."));
      objc_msgSend(v3, "firstObject");
      v7 = objc_claimAutoreleasedReturnValue();
      -[NSObject identityProviderID](v7, "identityProviderID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "forceUnwrapObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)objc_msgSend(objc_alloc(NSClassFromString((NSString *)CFSTR("VSIdentityProviderFetchOperation"))), "initWithIdentityProviderID:", v9);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __40__VSMetricsCenter_accountStoreDidChange__block_invoke_3;
      v18[3] = &unk_1E939F138;
      v11 = *(_QWORD *)(a1 + 32);
      v19 = v10;
      v20 = v11;
      v12 = v10;
      VSMainThreadOperationWithBlock(v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addDependency:", v12);
      objc_msgSend(*(id *)(a1 + 32), "privateQueue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addOperation:", v12);

      VSEnqueueCompletionOperation(v13);
    }
    else
    {
      VSErrorLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __40__VSMetricsCenter_accountStoreDidChange__block_invoke_2_cold_1();

      objc_msgSend(*(id *)(a1 + 32), "eventQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __40__VSMetricsCenter_accountStoreDidChange__block_invoke_159;
      v17[3] = &unk_1E939EE88;
      v17[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(v7, v17);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "eventQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__VSMetricsCenter_accountStoreDidChange__block_invoke_2_160;
    block[3] = &unk_1E939EE88;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v5, block);
  }

}

void __40__VSMetricsCenter_accountStoreDidChange__block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceUnwrapObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__VSMetricsCenter_accountStoreDidChange__block_invoke_4;
  v4[3] = &unk_1E939FA90;
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "unwrapObject:error:", v4, &__block_literal_global_158);

}

void __40__VSMetricsCenter_accountStoreDidChange__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "eventQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__VSMetricsCenter_accountStoreDidChange__block_invoke_5;
  v6[3] = &unk_1E939F138;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __40__VSMetricsCenter_accountStoreDidChange__block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCurrentIdentityProvider:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setCurrentIdentityProviderSupportsSTB:", objc_msgSend(*(id *)(a1 + 40), "isSetTopBoxSupported"));
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentIdentityProviderIsFullySupported:", objc_msgSend(*(id *)(a1 + 40), "isFullySupportedForRequestsExpectingAuthenticationSchemes:", 0));
}

void __40__VSMetricsCenter_accountStoreDidChange__block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  VSErrorLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __40__VSMetricsCenter_accountStoreDidChange__block_invoke_6_cold_1();

}

uint64_t __40__VSMetricsCenter_accountStoreDidChange__block_invoke_159(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCurrentIdentityProvider:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentIdentityProviderIsFullySupported:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentIdentityProviderSupportsSTB:", 0);
}

uint64_t __40__VSMetricsCenter_accountStoreDidChange__block_invoke_2_160(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCurrentIdentityProvider:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentIdentityProviderIsFullySupported:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentIdentityProviderSupportsSTB:", 0);
}

void __40__VSMetricsCenter_accountStoreDidChange__block_invoke_3_162(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  VSErrorLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __40__VSMetricsCenter_accountStoreDidChange__block_invoke_3_162_cold_1();

}

- (id)underlyingErrorsArray:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "underlyingErrors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__VSMetricsCenter_underlyingErrorsArray___block_invoke;
  v9[3] = &unk_1E939FB00;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  return v7;
}

void __41__VSMetricsCenter_underlyingErrorsArray___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a2;
  v9 = objc_alloc_init(v3);
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v5, CFSTR("error_type"));

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = objc_msgSend(v4, "code");

  objc_msgSend(v6, "numberWithInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("error_code"));

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
}

- (void)sendFlexibleEventToAnalyticsService:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v6 = a4;
  v7 = a3;
  VSDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1D2419000, v8, OS_LOG_TYPE_DEFAULT, "Sending flexible event to analytics service", v11, 2u);
  }

  -[VSMetricsCenter analyticsService](self, "analyticsService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serviceWithErrorHandler:", &__block_literal_global_167);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recordMetricsCenterFlexibleEventWithName:data:", v7, v6);

}

void __60__VSMetricsCenter_sendFlexibleEventToAnalyticsService_data___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  VSErrorLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __60__VSMetricsCenter_sendFlexibleEventToAnalyticsService_data___block_invoke_cold_1();

}

- (void)sendClickEventToAnalyticsServiceWithPage:(id)a3 pageType:(id)a4 data:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  VSDefaultLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1D2419000, v11, OS_LOG_TYPE_DEFAULT, "Sending click event to analytics service", v14, 2u);
  }

  -[VSMetricsCenter analyticsService](self, "analyticsService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "serviceWithErrorHandler:", &__block_literal_global_168);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "recordMetricsCenterClickEventWithPage:pageType:data:", v10, v9, v8);

}

void __74__VSMetricsCenter_sendClickEventToAnalyticsServiceWithPage_pageType_data___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  VSErrorLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __60__VSMetricsCenter_sendFlexibleEventToAnalyticsService_data___block_invoke_cold_1();

}

- (void)sendEnterEventToAnalyticsServiceWithPage:(id)a3 pageType:(id)a4 data:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  VSDefaultLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1D2419000, v11, OS_LOG_TYPE_DEFAULT, "Sending enter event to analytics service", v14, 2u);
  }

  -[VSMetricsCenter analyticsService](self, "analyticsService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "serviceWithErrorHandler:", &__block_literal_global_169);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "recordMetricsCenterEnterEventWithPage:pageType:data:", v10, v9, v8);

}

void __74__VSMetricsCenter_sendEnterEventToAnalyticsServiceWithPage_pageType_data___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  VSErrorLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __60__VSMetricsCenter_sendFlexibleEventToAnalyticsService_data___block_invoke_cold_1();

}

- (void)sendExitEventToAnalyticsServiceWithPage:(id)a3 pageType:(id)a4 data:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  VSDefaultLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1D2419000, v11, OS_LOG_TYPE_DEFAULT, "Sending exit event to analytics service", v14, 2u);
  }

  -[VSMetricsCenter analyticsService](self, "analyticsService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "serviceWithErrorHandler:", &__block_literal_global_170);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "recordMetricsCenterExitEventWithPage:pageType:data:", v10, v9, v8);

}

void __73__VSMetricsCenter_sendExitEventToAnalyticsServiceWithPage_pageType_data___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  VSErrorLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __60__VSMetricsCenter_sendFlexibleEventToAnalyticsService_data___block_invoke_cold_1();

}

- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4
{
  NSObject *v5;
  uint8_t v6[16];

  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "Account store did change.", v6, 2u);
  }

  -[VSMetricsCenter accountStoreDidChange](self, "accountStoreDidChange");
}

- (OS_dispatch_queue)eventQueue
{
  return self->_eventQueue;
}

- (void)setEventQueue:(id)a3
{
  objc_storeStrong((id *)&self->_eventQueue, a3);
}

- (VSPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (VSRemoteNotifier)remoteNotifier
{
  return self->_remoteNotifier;
}

- (void)setRemoteNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_remoteNotifier, a3);
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (VSIdentityProvider)currentIdentityProvider
{
  return self->_currentIdentityProvider;
}

- (void)setCurrentIdentityProvider:(id)a3
{
  objc_storeStrong((id *)&self->_currentIdentityProvider, a3);
}

- (BOOL)currentIdentityProviderSupportsSTB
{
  return self->_currentIdentityProviderSupportsSTB;
}

- (void)setCurrentIdentityProviderSupportsSTB:(BOOL)a3
{
  self->_currentIdentityProviderSupportsSTB = a3;
}

- (BOOL)currentIdentityProviderIsFullySupported
{
  return self->_currentIdentityProviderIsFullySupported;
}

- (void)setCurrentIdentityProviderIsFullySupported:(BOOL)a3
{
  self->_currentIdentityProviderIsFullySupported = a3;
}

- (BOOL)fetchedSetTopBoxProfile
{
  return self->_fetchedSetTopBoxProfile;
}

- (void)setFetchedSetTopBoxProfile:(BOOL)a3
{
  self->_fetchedSetTopBoxProfile = a3;
}

- (VSSetTopBoxProfile)stbProfile
{
  return self->_stbProfile;
}

- (void)setStbProfile:(id)a3
{
  objc_storeStrong((id *)&self->_stbProfile, a3);
}

- (VSAnalyticsServiceConnection)analyticsService
{
  return self->_analyticsService;
}

- (void)setAnalyticsService:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsService, 0);
  objc_storeStrong((id *)&self->_stbProfile, 0);
  objc_storeStrong((id *)&self->_currentIdentityProvider, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_remoteNotifier, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
}

void __40__VSMetricsCenter_accountStoreDidChange__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error loading UI framework: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __40__VSMetricsCenter_accountStoreDidChange__block_invoke_6_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "error fetching identity provider for metrics: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __40__VSMetricsCenter_accountStoreDidChange__block_invoke_3_162_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error fetching updated accounts for metrics: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __60__VSMetricsCenter_sendFlexibleEventToAnalyticsService_data___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error connecting to analytics service:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
