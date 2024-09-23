@implementation IMHandleOffGridStateManager

+ (id)sharedInstance
{
  if (qword_1ECFC74C0 != -1)
    dispatch_once(&qword_1ECFC74C0, &unk_1E3FB37C8);
  return (id)qword_1ECFC6F48;
}

- (IMHandleOffGridStateManager)init
{
  IMHandleOffGridStateManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *currentSubscriptionCache;
  NSMutableDictionary *v5;
  NSMutableDictionary *lastKnownSubscriptionCache;
  NSMutableSet *v7;
  NSMutableSet *pendingFetchesForCacheKeys;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *privateWorkQueue;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)IMHandleOffGridStateManager;
  v2 = -[IMHandleOffGridStateManager init](&v13, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    currentSubscriptionCache = v2->_currentSubscriptionCache;
    v2->_currentSubscriptionCache = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lastKnownSubscriptionCache = v2->_lastKnownSubscriptionCache;
    v2->_lastKnownSubscriptionCache = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    pendingFetchesForCacheKeys = v2->_pendingFetchesForCacheKeys;
    v2->_pendingFetchesForCacheKeys = v7;

    v2->_currentCacheGeneration = 0;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.Messages.IMHandleOffGridStateManager", v9);
    privateWorkQueue = v2->_privateWorkQueue;
    v2->_privateWorkQueue = (OS_dispatch_queue *)v10;

  }
  return v2;
}

- (SKStatusSubscriptionService)subscriptionService
{
  SKStatusSubscriptionService *subscriptionService;
  SKStatusSubscriptionService *v4;
  SKStatusSubscriptionService *v5;

  subscriptionService = self->_subscriptionService;
  if (!subscriptionService)
  {
    v4 = (SKStatusSubscriptionService *)objc_msgSend(objc_alloc((Class)MEMORY[0x1A1AE7D4C](CFSTR("SKStatusSubscriptionService"), CFSTR("StatusKit"))), "initWithStatusTypeIdentifier:", qword_1EE500EE8);
    v5 = self->_subscriptionService;
    self->_subscriptionService = v4;

    -[SKStatusSubscriptionService addDelegate:queue:](self->_subscriptionService, "addDelegate:queue:", self, MEMORY[0x1E0C80D38]);
    subscriptionService = self->_subscriptionService;
  }
  return subscriptionService;
}

- (int64_t)offGridModeForHandle:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int64_t v9;

  v4 = a3;
  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCarrierPigeonEnabled");

  if (v6)
  {
    -[IMHandleOffGridStateManager cachedStatusSubscriptionForHandle:](self, "cachedStatusSubscriptionForHandle:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[IMHandleOffGridStateManager _offGridModeFromStatusSubscription:handleID:](self, "_offGridModeFromStatusSubscription:handleID:", v7, v8);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)offGridModeForHandle:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t);
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isCarrierPigeonEnabled");

  if (v8)
  {
    -[IMHandleOffGridStateManager lastKnownSubscriptionCache](self, "lastKnownSubscriptionCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMHandleOffGridStateManager _cachedStatusSubscriptionForIMHandle:fromCache:cacheDescription:cacheMiss:](self, "_cachedStatusSubscriptionForIMHandle:fromCache:cacheDescription:cacheMiss:", v11, v9, CFSTR("LastKnown"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMHandleOffGridStateManager _fetchUpdatedStatusAndUpdateCachesForHandle:lastKnownStatus:completion:](self, "_fetchUpdatedStatusAndUpdateCachesForHandle:lastKnownStatus:completion:", v11, v10, v6);
  }
  else
  {
    v6[2](v6, 1);
  }

}

- (void)cachedOffGridModeAndLastPublisherForHandle:(id)a3 completion:(id)a4
{
  void (**v6)(id, int64_t, void *);
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, int64_t, void *))a4;
  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isCarrierPigeonEnabled");

  if (v8)
  {
    -[IMHandleOffGridStateManager cachedStatusSubscriptionForHandle:](self, "cachedStatusSubscriptionForHandle:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[IMHandleOffGridStateManager _offGridModeFromStatusSubscription:handleID:](self, "_offGridModeFromStatusSubscription:handleID:", v9, v10);
    -[IMHandleOffGridStateManager _identifierFromStatusSubscription:handleID:](self, "_identifierFromStatusSubscription:handleID:", v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v11, v12);

  }
  else
  {
    v6[2](v6, 1, 0);
  }

}

- (id)cachedStatusSubscriptionForHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char v10;

  v4 = a3;
  v10 = 0;
  -[IMHandleOffGridStateManager currentSubscriptionCache](self, "currentSubscriptionCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMHandleOffGridStateManager _cachedStatusSubscriptionForIMHandle:fromCache:cacheDescription:cacheMiss:](self, "_cachedStatusSubscriptionForIMHandle:fromCache:cacheDescription:cacheMiss:", v4, v5, CFSTR("Current"), &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[IMHandleOffGridStateManager lastKnownSubscriptionCache](self, "lastKnownSubscriptionCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMHandleOffGridStateManager _cachedStatusSubscriptionForIMHandle:fromCache:cacheDescription:cacheMiss:](self, "_cachedStatusSubscriptionForIMHandle:fromCache:cacheDescription:cacheMiss:", v4, v7, CFSTR("LastKnown"), 0);
    v8 = objc_claimAutoreleasedReturnValue();

    -[IMHandleOffGridStateManager _fetchUpdatedStatusAndUpdateCachesForHandle:lastKnownStatus:completion:](self, "_fetchUpdatedStatusAndUpdateCachesForHandle:lastKnownStatus:completion:", v4, v8, 0);
    v6 = (void *)v8;
  }

  return v6;
}

- (void)_fetchUpdatedStatusAndUpdateCachesForHandle:(id)a3 lastKnownStatus:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableSet *v16;
  char v17;
  int v18;
  char v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  IMHandleOffGridStateManager *v29;
  id v30;
  id v31[2];
  _BYTE buf[24];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isCarrierPigeonEnabled");

  if (v12)
  {
    objc_msgSend(v9, "currentStatus");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "statusUniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMHandleOffGridStateManager _subscriptionCacheKeyForHandle:](self, "_subscriptionCacheKeyForHandle:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = self->_pendingFetchesForCacheKeys;
    objc_sync_enter(v16);
    v17 = -[NSMutableSet containsObject:](self->_pendingFetchesForCacheKeys, "containsObject:", v15);
    if ((v17 & 1) == 0)
      -[NSMutableSet addObject:](self->_pendingFetchesForCacheKeys, "addObject:", v15);
    objc_sync_exit(v16);

    v18 = IMOSLoggingEnabled();
    v19 = v17 ^ 1;
    if (v10)
      v19 = 1;
    if ((v19 & 1) != 0)
    {
      if (v18)
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v15;
          _os_log_impl(&dword_19E239000, v21, OS_LOG_TYPE_INFO, "We do not have any pending fetches for cache key: \"%@\", buf, 0xCu);
        }

      }
      *(_QWORD *)buf = 0;
      objc_initWeak((id *)buf, self);
      objc_msgSend(v8, "ID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[IMHandleOffGridStateManager currentCacheGeneration](self, "currentCacheGeneration");
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = sub_19E2BADF4;
      v25[3] = &unk_1E3FB73A8;
      objc_copyWeak(v31, (id *)buf);
      v31[1] = v23;
      v30 = v10;
      v26 = v15;
      v24 = v22;
      v27 = v24;
      v28 = v14;
      v29 = self;
      -[IMHandleOffGridStateManager fetchUpdatedStatusForHandle:completion:](self, "fetchUpdatedStatusForHandle:completion:", v8, v25);

      objc_destroyWeak(v31);
      objc_destroyWeak((id *)buf);
    }
    else if (v18)
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v15;
        _os_log_impl(&dword_19E239000, v20, OS_LOG_TYPE_INFO, "We already have a pending subscription fetch for cache key: \"%@\". That fetch will notify if the subscription has changed. Taking no further action.", buf, 0xCu);
      }

    }
  }

}

- (id)_cachedStatusSubscriptionForIMHandle:(id)a3 fromCache:(id)a4 cacheDescription:(id)a5 cacheMiss:(BOOL *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[IMHandleOffGridStateManager _subscriptionCacheKeyForHandle:](self, "_subscriptionCacheKeyForHandle:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v11;
  objc_sync_enter(v14);
  if (v13)
  {
    objc_msgSend(v14, "objectForKey:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  objc_sync_exit(v14);

  if (!v15)
  {
    if (a6)
    {
      v16 = 0;
      *a6 = 1;
      goto LABEL_16;
    }
LABEL_15:
    v16 = 0;
    goto LABEL_16;
  }
  if (a6)
    *a6 = 0;
  MEMORY[0x1A1AE7D4C](CFSTR("SKStatusSubscription"), CFSTR("StatusKit"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      IMLogHandleForCategory("IMHandleOffGridStateManager");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        v19 = 138412802;
        v20 = v12;
        v21 = 2112;
        v22 = v13;
        v23 = 2112;
        v24 = v15;
        _os_log_fault_impl(&dword_19E239000, v17, OS_LOG_TYPE_FAULT, "Subscription cache hit (%@) for key \"%@\", but object in cache is of unknown type: \"%@\", (uint8_t *)&v19, 0x20u);
      }

    }
    goto LABEL_15;
  }
  v16 = v15;
LABEL_16:

  return v16;
}

- (void)fetchUpdatedStatusForHandle:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *privateWorkQueue;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[IMHandleOffGridStateManager subscriptionService](self, "subscriptionService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "matchesLoginHandleForAnyAccount"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v9;
        _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "Handle %@ matches login handle. Fetching personal status subscription", buf, 0xCu);
      }

    }
    privateWorkQueue = self->_privateWorkQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19E2BB708;
    block[3] = &unk_1E3FB73F8;
    v20 = v8;
    v21 = v7;
    v12 = v7;
    dispatch_async(privateWorkQueue, block);

    v13 = v20;
  }
  else
  {
    -[IMHandleOffGridStateManager _skHandleForHandle:](self, "_skHandleForHandle:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v9;
        _os_log_impl(&dword_19E239000, v15, OS_LOG_TYPE_INFO, "Initiating a subscription fetch for handle: \"%@\", buf, 0xCu);
      }

    }
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_19E2BB864;
    v16[3] = &unk_1E3FB7420;
    v17 = v14;
    v18 = v7;
    v13 = v7;
    v12 = v14;
    objc_msgSend(v8, "statusSubscriptionForHandle:completion:", v12, v16);

  }
}

- (int64_t)_offGridModeFromStatusSubscription:(id)a3 handleID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  int64_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v19;
  NSObject *v20;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_msgSend(v5, "currentStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v21 = 138412290;
          v22 = v6;
          _os_log_impl(&dword_19E239000, v16, OS_LOG_TYPE_INFO, "Current status not found for handle \"%@\", returning unknown off grid mode", (uint8_t *)&v21, 0xCu);
        }

      }
      v15 = 0;
      goto LABEL_26;
    }
    objc_msgSend(v7, "statusPayload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "payloadDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("m"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "integerValue");

      if (v12 == 2)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v21 = 138412290;
            v22 = v6;
            _os_log_impl(&dword_19E239000, v19, OS_LOG_TYPE_INFO, "Off grid mode enabled for \"%@\", (uint8_t *)&v21, 0xCu);
          }

        }
        v15 = 2;
        goto LABEL_25;
      }
      if (v12 == 1)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            v21 = 138412290;
            v22 = v6;
            _os_log_impl(&dword_19E239000, v20, OS_LOG_TYPE_INFO, "Off grid mode disabled for \"%@\", (uint8_t *)&v21, 0xCu);
          }

        }
        v15 = 1;
        goto LABEL_25;
      }
      if (!v12 && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v21 = 138412290;
          v22 = v6;
          _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_INFO, "Off grid mode unknown for \"%@\", (uint8_t *)&v21, 0xCu);
        }

      }
    }
    else
    {
      IMLogHandleForCategory("IMHandleOffGridStateManager");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_19E36D2B0();

    }
    v15 = 0;
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v21 = 138412290;
      v22 = v6;
      _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "Subscription not found for handle \"%@\", returning unknown off grid mode", (uint8_t *)&v21, 0xCu);
    }

  }
  v15 = 0;
LABEL_27:

  return v15;
}

- (id)_identifierFromStatusSubscription:(id)a3 handleID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_msgSend(v5, "currentStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "statusPayload");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "payloadDictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count")
        && (objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("id")),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v11,
            v11))
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("id"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        IMLogHandleForCategory("IMHandleOffGridStateManager");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          sub_19E36D310();

        v12 = 0;
      }

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v17 = 138412290;
          v18 = v6;
          _os_log_impl(&dword_19E239000, v15, OS_LOG_TYPE_INFO, "Current status not found for handle \"%@\", returning unknown identifier", (uint8_t *)&v17, 0xCu);
        }

      }
      v12 = 0;
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v17 = 138412290;
        v18 = v6;
        _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_INFO, "Subscription not found for handle \"%@\", no identifier to return", (uint8_t *)&v17, 0xCu);
      }

    }
    v12 = 0;
  }

  return v12;
}

- (void)subscriptionInvitationReceived:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Subscription invitation received, notifying UI to subscribe, if necessary. %@", (uint8_t *)&v7, 0xCu);
    }

  }
  -[IMHandleOffGridStateManager _clearCurrentSubscriptionCache](self, "_clearCurrentSubscriptionCache");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "__mainThreadPostNotificationName:object:", IMHandleOffGridInvitationReceivedNotification, v4);

}

- (void)subscriptionReceivedStatusUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Status update received, notifying UI to display updated status, if necessary. %@", (uint8_t *)&v7, 0xCu);
    }

  }
  -[IMHandleOffGridStateManager _clearCurrentSubscriptionCache](self, "_clearCurrentSubscriptionCache");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "__mainThreadPostNotificationName:object:", IMHandleOffGridChangedNotification, v4);

}

- (void)subscriptionStateChanged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Status state changed, notifying UI to refetch all relevant state. %@", (uint8_t *)&v7, 0xCu);
    }

  }
  -[IMHandleOffGridStateManager _clearCurrentSubscriptionCache](self, "_clearCurrentSubscriptionCache");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "__mainThreadPostNotificationName:object:", IMHandleOffGridStateChangedNotification, v4);

}

- (void)subscriptionServiceDaemonDisconnected:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Subscription service daemon was disconnected, (e.g. app is returning from backgrounded) notifying UI to refetch if necessary", v7, 2u);
    }

  }
  -[IMHandleOffGridStateManager _clearCurrentSubscriptionCache](self, "_clearCurrentSubscriptionCache");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "__mainThreadPostNotificationName:object:", IMHandleOffGridDaemonDisconnectedNotification, 0);

}

- (void)_postNotificationForUpdatedStatusWithSubscription:(id)a3
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_19E2BC48C;
  block[3] = &unk_1E3FB6B98;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (id)_subscriptionCacheKeyForHandle:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;

  v3 = a3;
  objc_msgSend(v3, "normalizedID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    IMLogHandleForCategory("IMHandleOffGridStateManager");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_19E36D370();

    objc_msgSend(v3, "ID");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }

  return v4;
}

- (id)_skHandleForHandle:(id)a3
{
  void *v3;
  void *v4;

  MEMORY[0x1A1AE7D34](a3, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)MEMORY[0x1A1AE7D4C](CFSTR("SKHandle"), CFSTR("StatusKit"))), "initWithString:", v3);

  return v4;
}

- (void)_clearCurrentSubscriptionCache
{
  NSMutableSet *v3;
  int64_t v4;
  NSObject *v5;
  int v6;
  int64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = self->_pendingFetchesForCacheKeys;
  objc_sync_enter(v3);
  v4 = self->_currentCacheGeneration + 1;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 134217984;
      v7 = v4;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Clearing current subscription cache. New cache generation: %ld", (uint8_t *)&v6, 0xCu);
    }

  }
  self->_currentCacheGeneration = v4;
  -[NSMutableDictionary removeAllObjects](self->_currentSubscriptionCache, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_pendingFetchesForCacheKeys, "removeAllObjects");
  objc_sync_exit(v3);

}

- (NSMutableDictionary)currentSubscriptionCache
{
  return self->_currentSubscriptionCache;
}

- (void)setCurrentSubscriptionCache:(id)a3
{
  objc_storeStrong((id *)&self->_currentSubscriptionCache, a3);
}

- (NSMutableDictionary)lastKnownSubscriptionCache
{
  return self->_lastKnownSubscriptionCache;
}

- (void)setLastKnownSubscriptionCache:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownSubscriptionCache, a3);
}

- (int64_t)currentCacheGeneration
{
  return self->_currentCacheGeneration;
}

- (void)setCurrentCacheGeneration:(int64_t)a3
{
  self->_currentCacheGeneration = a3;
}

- (NSMutableSet)pendingFetchesForCacheKeys
{
  return self->_pendingFetchesForCacheKeys;
}

- (void)setPendingFetchesForCacheKeys:(id)a3
{
  objc_storeStrong((id *)&self->_pendingFetchesForCacheKeys, a3);
}

- (void)setSubscriptionService:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionService, a3);
}

- (OS_dispatch_queue)privateWorkQueue
{
  return self->_privateWorkQueue;
}

- (void)setPrivateWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateWorkQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateWorkQueue, 0);
  objc_storeStrong((id *)&self->_subscriptionService, 0);
  objc_storeStrong((id *)&self->_pendingFetchesForCacheKeys, 0);
  objc_storeStrong((id *)&self->_lastKnownSubscriptionCache, 0);
  objc_storeStrong((id *)&self->_currentSubscriptionCache, 0);
}

@end
