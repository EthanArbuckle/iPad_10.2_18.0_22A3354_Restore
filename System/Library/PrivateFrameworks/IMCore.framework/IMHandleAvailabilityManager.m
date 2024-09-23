@implementation IMHandleAvailabilityManager

+ (id)sharedInstance
{
  if (qword_1ECF12540 != -1)
    dispatch_once(&qword_1ECF12540, &unk_1E471DC18);
  return (id)qword_1ECF12560;
}

- (IMHandleAvailabilityManager)init
{
  IMHandleAvailabilityManager *v2;
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
  v13.super_class = (Class)IMHandleAvailabilityManager;
  v2 = -[IMHandleAvailabilityManager init](&v13, sel_init);
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
    v10 = dispatch_queue_create("com.apple.Messages.IMHandleAvailabilityManager", v9);
    privateWorkQueue = v2->_privateWorkQueue;
    v2->_privateWorkQueue = (OS_dispatch_queue *)v10;

  }
  return v2;
}

- (id)availabilityStatusPublishedDateForHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMHandleAvailabilityManager statusSubscriptionForHandle:](self, "statusSubscriptionForHandle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "currentStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "datePublished");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v14 = 138412290;
          v15 = v9;
          _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Determined status was published on: %@", (uint8_t *)&v14, 0xCu);
        }

      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v14 = 138412290;
          v15 = v6;
          _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Subscription has no published status, returning nil status creation date. Subscription: %@", (uint8_t *)&v14, 0xCu);
        }

      }
      v9 = 0;
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Subscription cache miss, returning nil for sync call for status creation date", (uint8_t *)&v14, 2u);
      }

    }
    v9 = 0;
  }

  return v9;
}

- (int64_t)availabilityForHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  objc_msgSend(v4, "ID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMHandleAvailabilityManager statusSubscriptionForHandle:](self, "statusSubscriptionForHandle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[IMHandleAvailabilityManager _availablityFromStatusSubscription:handleID:](self, "_availablityFromStatusSubscription:handleID:", v6, v5);
  return v7;
}

- (id)statusSubscriptionForHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char v10;

  v4 = a3;
  v10 = 0;
  -[IMHandleAvailabilityManager currentSubscriptionCache](self, "currentSubscriptionCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMHandleAvailabilityManager _cachedStatusSubscriptionForIMHandle:fromCache:cacheDescription:cacheMiss:](self, "_cachedStatusSubscriptionForIMHandle:fromCache:cacheDescription:cacheMiss:", v4, v5, CFSTR("Current"), &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[IMHandleAvailabilityManager lastKnownSubscriptionCache](self, "lastKnownSubscriptionCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMHandleAvailabilityManager _cachedStatusSubscriptionForIMHandle:fromCache:cacheDescription:cacheMiss:](self, "_cachedStatusSubscriptionForIMHandle:fromCache:cacheDescription:cacheMiss:", v4, v7, CFSTR("LastKnown"), 0);
    v8 = objc_claimAutoreleasedReturnValue();

    -[IMHandleAvailabilityManager fetchUpdatedStatusAndUpdateCachesForHandle:lastKnownStatus:](self, "fetchUpdatedStatusAndUpdateCachesForHandle:lastKnownStatus:", v4, v8);
    v6 = (void *)v8;
  }

  return v6;
}

- (void)fetchUpdatedStatusAndUpdateCachesForHandle:(id)a3 lastKnownStatus:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableSet *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21[2];
  _BYTE buf[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "currentStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "statusUniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMHandleAvailabilityManager _subscriptionCacheKeyForHandle:](self, "_subscriptionCacheKeyForHandle:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = self->_pendingFetchesForCacheKeys;
  objc_sync_enter(v11);
  if ((-[NSMutableSet containsObject:](self->_pendingFetchesForCacheKeys, "containsObject:", v10) & 1) != 0)
  {
    objc_sync_exit(v11);

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v10;
        _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "We already have a pending subscription fetch for cache key: \"%@\". That fetch will notify if the subscription has changed. Taking no further action.", buf, 0xCu);
      }

    }
  }
  else
  {
    -[NSMutableSet addObject:](self->_pendingFetchesForCacheKeys, "addObject:", v10);
    objc_sync_exit(v11);

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v10;
        _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "We do not have any pending fetches for cache key: \"%@\", buf, 0xCu);
      }

    }
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    objc_msgSend(v6, "ID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[IMHandleAvailabilityManager currentCacheGeneration](self, "currentCacheGeneration");
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_1A214DB54;
    v17[3] = &unk_1E47231B8;
    objc_copyWeak(v21, (id *)buf);
    v21[1] = v15;
    v18 = v10;
    v16 = v14;
    v19 = v16;
    v20 = v9;
    -[IMHandleAvailabilityManager fetchUpdatedStatusForHandle:completion:](self, "fetchUpdatedStatusForHandle:completion:", v6, v17);

    objc_destroyWeak(v21);
    objc_destroyWeak((id *)buf);
  }

}

- (void)fetchUpdatedStatusForHandle:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *privateWorkQueue;
  id v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  void (**v18)(id, _QWORD);
  _QWORD block[4];
  id v20;
  void (**v21)(id, _QWORD);
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (objc_msgSend(MEMORY[0x1E0D396B8], "isInAppleStoreDemoMode"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Not fetching subscription in Apple Store Demo mode.", buf, 2u);
      }

    }
    v7[2](v7, 0);
  }
  else
  {
    -[IMHandleAvailabilityManager subscriptionService](self, "subscriptionService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "matchesLoginHandleForAnyAccount"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v10;
          _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Handle %@ matches login handle. Fetching personal status subscription", buf, 0xCu);
        }

      }
      privateWorkQueue = self->_privateWorkQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1A214E2D0;
      block[3] = &unk_1E47231E0;
      v20 = v9;
      v21 = v7;
      dispatch_async(privateWorkQueue, block);

      v13 = v20;
    }
    else
    {
      -[IMHandleAvailabilityManager _skHandleForIMHandle:](self, "_skHandleForIMHandle:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v10;
          _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "Initiating a subscription fetch for handle: \"%@\", buf, 0xCu);
        }

      }
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = sub_1A214E42C;
      v16[3] = &unk_1E4723208;
      v17 = v14;
      v18 = v7;
      v13 = v14;
      objc_msgSend(v9, "statusSubscriptionForHandle:completion:", v13, v16);

    }
  }

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
  block[2] = sub_1A214E688;
  block[3] = &unk_1E471E348;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (int64_t)_availablityFromStatusSubscription:(id)a3 handleID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  int64_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  NSObject *v26;
  int v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
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
          v28 = 138412290;
          v29 = v6;
          _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "Current status not found for handle \"%@\", returning unknown availability", (uint8_t *)&v28, 0xCu);
        }

      }
      v15 = 0;
      goto LABEL_39;
    }
    objc_msgSend(v7, "statusUniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc((Class)MEMORY[0x1A858292C](CFSTR("AKAvailability"), CFSTR("AvailabilityKit"))), "initWithPublishedStatus:", v8);
    if (!v10)
    {
      IMLogHandleForCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_1A2198A18((uint64_t)v6, v17, v18, v19, v20, v21, v22, v23);

      v15 = 0;
      goto LABEL_38;
    }
    if (objc_msgSend(v5, "isPersonalStatusSubscription"))
    {
      v11 = objc_msgSend(v10, "isAvailable");
      v12 = IMOSLoggingEnabled();
      if (v11)
      {
        if (v12)
        {
          OSLogHandleForIMFoundationCategory();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            v28 = 138412546;
            v29 = v6;
            v30 = 2112;
            v31 = v9;
            _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Personal status subscription for handleID \"%@\" says we are AVAILABLE from status %@", (uint8_t *)&v28, 0x16u);
          }
LABEL_27:

          goto LABEL_28;
        }
        goto LABEL_28;
      }
      if (v12)
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v28 = 138412546;
          v29 = v6;
          v30 = 2112;
          v31 = v9;
          _os_log_impl(&dword_1A1FF4000, v26, OS_LOG_TYPE_INFO, "Personal status subscription for handleID \"%@\" says we are UNAVAILABLE from status %@", (uint8_t *)&v28, 0x16u);
        }
LABEL_36:

      }
    }
    else
    {
      v24 = objc_msgSend(v10, "isAvailableToMe");
      v25 = IMOSLoggingEnabled();
      if (v24)
      {
        if (v25)
        {
          OSLogHandleForIMFoundationCategory();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            v28 = 138412546;
            v29 = v6;
            v30 = 2112;
            v31 = v9;
            _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "StatusKit indicates handle \"%@\" is AVAILABLE from status %@", (uint8_t *)&v28, 0x16u);
          }
          goto LABEL_27;
        }
LABEL_28:
        v15 = 1;
LABEL_38:

LABEL_39:
        goto LABEL_40;
      }
      if (v25)
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v28 = 138412546;
          v29 = v6;
          v30 = 2112;
          v31 = v9;
          _os_log_impl(&dword_1A1FF4000, v26, OS_LOG_TYPE_INFO, "StatusKit indicates handle \"%@\" is UNAVAILABLE from status %@", (uint8_t *)&v28, 0x16u);
        }
        goto LABEL_36;
      }
    }
    v15 = 2;
    goto LABEL_38;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v28 = 138412290;
      v29 = v6;
      _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Subscription not found for handle \"%@\", returning unknown availability", (uint8_t *)&v28, 0xCu);
    }

  }
  v15 = 0;
LABEL_40:

  return v15;
}

- (void)fetchPersonalAvailabilityWithCompletion:(id)a3
{
  id v4;
  NSObject *privateWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  privateWorkQueue = self->_privateWorkQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1A214EB74;
  v7[3] = &unk_1E47231E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(privateWorkQueue, v7);

}

- (void)beginObservingAvailabilityForHandle:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D396B8], "isInAppleStoreDemoMode"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Not beginnign observing availability in Apple Store Demo mode.", buf, 2u);
      }

    }
  }
  else
  {
    objc_msgSend(v4, "ID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v6;
        _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Received request to begin observing availability for: %@", buf, 0xCu);
      }

    }
    -[IMHandleAvailabilityManager statusSubscriptionForHandle:](self, "statusSubscriptionForHandle:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "subscriptionIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v19 = v10;
          v20 = 2112;
          v21 = v6;
          _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Retaining transient subscription assertion on subscription: \"%@\" for handle: \"%@\", buf, 0x16u);
        }

      }
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = sub_1A214EF54;
      v15[3] = &unk_1E4721EC8;
      v16 = v10;
      v17 = v6;
      v12 = v10;
      objc_msgSend(v9, "retainTransientSubscriptionAssertionWithCompletion:", v15);

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "ID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v19 = v14;
        _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Could not find cached subscription for handle: \"%@\". Not observing availability (yet).", buf, 0xCu);

      }
    }

  }
}

- (void)endObservingAvailabilityForHandle:(id)a3
{
  id v4;
  int v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0D396B8], "isInAppleStoreDemoMode");
  v6 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Not ending observing availability in Apple Store Demo mode.", buf, 2u);
      }

    }
  }
  else
  {
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "ID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v23 = v9;
        _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Received request to end observing availability for: %@", buf, 0xCu);

      }
    }
    -[IMHandleAvailabilityManager statusSubscriptionForHandle:](self, "statusSubscriptionForHandle:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "subscriptionIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v23 = v12;
          v24 = 2112;
          v25 = v13;
          _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Releasing transient subscription assertion on subscription: \"%@\" for handle: \"%@\", buf, 0x16u);
        }

      }
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = sub_1A214F3B0;
      v19[3] = &unk_1E4721EC8;
      v20 = v13;
      v21 = v12;
      v15 = v12;
      v16 = v13;
      objc_msgSend(v11, "releaseTransientSubscriptionAssertionWithCompletion:", v19);

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "ID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v23 = v18;
        _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "Could not find cached subscription for handle: \"%@\". Not observing availability (yet).", buf, 0xCu);

      }
    }

  }
}

- (id)_subscriptionCacheKeyForHandle:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  objc_msgSend(v3, "normalizedID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1A2198B70((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);

    objc_msgSend(v3, "ID");
    v12 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v12;
  }

  return v4;
}

- (SKStatusSubscriptionService)subscriptionService
{
  SKStatusSubscriptionService *subscriptionService;
  objc_class *v4;
  id v5;
  SKStatusSubscriptionService *v6;
  SKStatusSubscriptionService *v7;

  subscriptionService = self->_subscriptionService;
  if (!subscriptionService)
  {
    v4 = (objc_class *)MEMORY[0x1A858292C](CFSTR("SKStatusSubscriptionService"), CFSTR("StatusKit"));
    v5 = *(id *)MEMORY[0x1A8582938]("AKAvailabilityStatusTypeIdentifier", CFSTR("AvailabilityKit"));
    v6 = (SKStatusSubscriptionService *)objc_msgSend([v4 alloc], "initWithStatusTypeIdentifier:", v5);
    v7 = self->_subscriptionService;
    self->_subscriptionService = v6;

    -[SKStatusSubscriptionService addDelegate:queue:](self->_subscriptionService, "addDelegate:queue:", self, MEMORY[0x1E0C80D38]);
    subscriptionService = self->_subscriptionService;
  }
  return subscriptionService;
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
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  int v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[IMHandleAvailabilityManager _subscriptionCacheKeyForHandle:](self, "_subscriptionCacheKeyForHandle:", v10);
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
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v23 = 138412546;
        v24 = v12;
        v25 = 2112;
        v26 = v13;
        _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "Subscription cache miss (%@) for key \"%@\", (uint8_t *)&v23, 0x16u);
      }

    }
    if (a6)
    {
      v16 = 0;
      *a6 = 1;
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (a6)
    *a6 = 0;
  MEMORY[0x1A858292C](CFSTR("SKStatusSubscription"), CFSTR("StatusKit"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      IMLogHandleForCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        v23 = 138412802;
        v24 = v12;
        v25 = 2112;
        v26 = v13;
        v27 = 2112;
        v28 = v15;
        _os_log_fault_impl(&dword_1A1FF4000, v21, OS_LOG_TYPE_FAULT, "Subscription cache hit (%@) for key \"%@\", but object in cache is of unknown type: \"%@\", (uint8_t *)&v23, 0x20u);
      }
      goto LABEL_26;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v23 = 138412546;
        v24 = v12;
        v25 = 2112;
        v26 = v13;
        _os_log_impl(&dword_1A1FF4000, v21, OS_LOG_TYPE_INFO, "Subscription cache hit (%@), we do not have a subscription for key: \"%@\", (uint8_t *)&v23, 0x16u);
      }
LABEL_26:

    }
LABEL_27:
    v16 = 0;
    goto LABEL_28;
  }
  v16 = v15;
  objc_msgSend(v16, "currentStatus");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "statusUniqueIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v23 = 138412802;
      v24 = v12;
      v25 = 2112;
      v26 = v13;
      v27 = 2112;
      v28 = v18;
      _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "Subscription cache hit (%@), found subscription for key: \"%@\" Status: %@", (uint8_t *)&v23, 0x20u);
    }

  }
LABEL_28:

  return v16;
}

- (id)_skHandleForIMHandle:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "normalizedID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMHandleAvailabilityManager _skHandleForString:](self, "_skHandleForString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_skHandleForString:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)MEMORY[0x1A858292C](CFSTR("SKHandle"), CFSTR("StatusKit"))), "initWithString:", v3);

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
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Clearing current subscription cache. New cache generation: %ld", (uint8_t *)&v6, 0xCu);
    }

  }
  self->_currentCacheGeneration = v4;
  -[NSMutableDictionary removeAllObjects](self->_currentSubscriptionCache, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_pendingFetchesForCacheKeys, "removeAllObjects");
  objc_sync_exit(v3);

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
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Subscription invitation received, clearing cache and notifying UI to subscribe, if necessary. %@", (uint8_t *)&v7, 0xCu);
    }

  }
  -[IMHandleAvailabilityManager _clearCurrentSubscriptionCache](self, "_clearCurrentSubscriptionCache");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "__mainThreadPostNotificationName:object:", IMHandleAvailabilityInvitationReceivedNotification, v4);

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
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Status update received, clearing cache and notifying UI to display updated status, if necessary. %@", (uint8_t *)&v7, 0xCu);
    }

  }
  -[IMHandleAvailabilityManager _clearCurrentSubscriptionCache](self, "_clearCurrentSubscriptionCache");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "__mainThreadPostNotificationName:object:", IMHandleAvailabilityChangedNotification, v4);

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
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Status state changed, clearing cache and notifying UI to refetch all relevant state. %@", (uint8_t *)&v7, 0xCu);
    }

  }
  -[IMHandleAvailabilityManager _clearCurrentSubscriptionCache](self, "_clearCurrentSubscriptionCache");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "__mainThreadPostNotificationName:object:", IMHandleAvailabilityStateChangedNotification, v4);

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
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Subscription service daemon was disconnected, (e.g. app is returning from backgrounded) clearing stale cached data and notifying UI to refetch if necessary", v7, 2u);
    }

  }
  -[IMHandleAvailabilityManager _clearCurrentSubscriptionCache](self, "_clearCurrentSubscriptionCache");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "__mainThreadPostNotificationName:object:", IMHandleAvailabilityDaemonDisconnectedNotification, 0);

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
