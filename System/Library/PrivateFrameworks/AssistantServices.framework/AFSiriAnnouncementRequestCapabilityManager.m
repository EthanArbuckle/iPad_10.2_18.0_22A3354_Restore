@implementation AFSiriAnnouncementRequestCapabilityManager

- (AFSiriAnnouncementRequestCapabilityManager)initWithPlatform:(int64_t)a3
{
  AFSiriAnnouncementRequestCapabilityManager *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  NSHashTable *observers;
  void *v9;
  uint64_t v10;
  AFAnnouncementRequestCapabilityProviding *capabilityProvider;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AFSiriAnnouncementRequestCapabilityManager;
  v4 = -[AFSiriAnnouncementRequestCapabilityManager init](&v13, sel_init);
  if (v4)
  {
    v5 = dispatch_queue_create("AFSiriAnnouncementRequestCapabilityManager", 0);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    observers = v4->_observers;
    v4->_observers = (NSHashTable *)v7;

    v9 = (void *)objc_msgSend((id)objc_opt_class(), "_classForPlatform:", a3);
    v4->_platform = objc_msgSend(v9, "platform");
    objc_msgSend(v9, "provider");
    v10 = objc_claimAutoreleasedReturnValue();
    capabilityProvider = v4->_capabilityProvider;
    v4->_capabilityProvider = (AFAnnouncementRequestCapabilityProviding *)v10;

    -[AFAnnouncementRequestCapabilityProviding addDelegate:](v4->_capabilityProvider, "addDelegate:", v4);
  }
  return v4;
}

- (void)fetchEligibleAnnouncementRequestTypesWithCompletion:(id)a3
{
  if (a3)
    -[AFAnnouncementRequestCapabilityProviding fetchEligibleAnnouncementRequestTypesWithCompletion:](self->_capabilityProvider, "fetchEligibleAnnouncementRequestTypesWithCompletion:");
}

- (void)fetchAvailableAnnouncementRequestTypesWithCompletion:(id)a3
{
  if (a3)
    -[AFAnnouncementRequestCapabilityProviding fetchAvailableAnnouncementRequestTypesWithCompletion:](self->_capabilityProvider, "fetchAvailableAnnouncementRequestTypesWithCompletion:");
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__AFSiriAnnouncementRequestCapabilityManager_addObserver___block_invoke;
  block[3] = &unk_1E3A33A28;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__AFSiriAnnouncementRequestCapabilityManager_removeObserver___block_invoke;
  block[3] = &unk_1E3A33A28;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)provider:(id)a3 eligibleAnnouncementRequestTypesChanged:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *queue;
  id v9;
  _QWORD block[4];
  id v11;
  id v12[2];
  _BYTE location[12];
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)location = 136315394;
    *(_QWORD *)&location[4] = "-[AFSiriAnnouncementRequestCapabilityManager provider:eligibleAnnouncementRequestTypesChanged:]";
    v14 = 2048;
    v15 = a4;
    _os_log_debug_impl(&dword_19AF50000, v7, OS_LOG_TYPE_DEBUG, "%s Notifying observers eligible announcement request types changed: %lu", location, 0x16u);
  }
  objc_initWeak((id *)location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__AFSiriAnnouncementRequestCapabilityManager_provider_eligibleAnnouncementRequestTypesChanged___block_invoke;
  block[3] = &unk_1E3A32F70;
  objc_copyWeak(v12, (id *)location);
  v12[1] = (id)a4;
  v11 = v6;
  v9 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(v12);
  objc_destroyWeak((id *)location);
}

- (void)provider:(id)a3 availableAnnouncementRequestTypesChanged:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *queue;
  id v9;
  _QWORD block[4];
  id v11;
  id v12[2];
  _BYTE location[12];
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)location = 136315394;
    *(_QWORD *)&location[4] = "-[AFSiriAnnouncementRequestCapabilityManager provider:availableAnnouncementRequestTypesChanged:]";
    v14 = 2048;
    v15 = a4;
    _os_log_debug_impl(&dword_19AF50000, v7, OS_LOG_TYPE_DEBUG, "%s Notifying observers available announcement request types changed: %lu", location, 0x16u);
  }
  objc_initWeak((id *)location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__AFSiriAnnouncementRequestCapabilityManager_provider_availableAnnouncementRequestTypesChanged___block_invoke;
  block[3] = &unk_1E3A32F70;
  objc_copyWeak(v12, (id *)location);
  v12[1] = (id)a4;
  v11 = v6;
  v9 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(v12);
  objc_destroyWeak((id *)location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilityProvider, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __96__AFSiriAnnouncementRequestCapabilityManager_provider_availableAnnouncementRequestTypesChanged___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = WeakRetained[2];
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "availableAnnouncementRequestTypesChanged:onPlatform:", *(_QWORD *)(a1 + 48), objc_msgSend((id)objc_opt_class(), "platform", (_QWORD)v9));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

void __95__AFSiriAnnouncementRequestCapabilityManager_provider_eligibleAnnouncementRequestTypesChanged___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = WeakRetained[2];
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "eligibleAnnouncementRequestTypesChanged:onPlatform:", *(_QWORD *)(a1 + 48), objc_msgSend((id)objc_opt_class(), "platform", (_QWORD)v9));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

void __61__AFSiriAnnouncementRequestCapabilityManager_removeObserver___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[2], "removeObject:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

void __58__AFSiriAnnouncementRequestCapabilityManager_addObserver___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[2], "addObject:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

+ (Class)_classForPlatform:(int64_t)a3
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v8;
  const char *v9;
  __int16 v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 < 5)
  {
    switch(a3)
    {
      case 0:
        v4 = AFSiriLogContextConnection;
        if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
          goto LABEL_6;
        v8 = 136315394;
        v9 = "+[AFSiriAnnouncementRequestCapabilityManager _classForPlatform:]";
        v10 = 2048;
        v11 = 0;
        v5 = v4;
        goto LABEL_9;
      case 1:
      case 2:
      case 3:
      case 4:
        goto LABEL_6;
      default:
        return (Class)a1;
    }
  }
  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v8 = 136315394;
    v9 = "+[AFSiriAnnouncementRequestCapabilityManager _classForPlatform:]";
    v10 = 2048;
    v11 = a3;
    v5 = v6;
LABEL_9:
    _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s platform %li is not valid, using headphones provider.", (uint8_t *)&v8, 0x16u);
  }
LABEL_6:
  objc_opt_class();
  a1 = (id)objc_claimAutoreleasedReturnValue();
  return (Class)a1;
}

+ (id)supportedAnnouncementTypesForBundleId:(id)a3 onPlatform:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t i;
  void *v18;
  NSObject *v19;
  id v20;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE buf[24];
  void *v29;
  uint64_t *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v7, "addObject:", &unk_1E3AA6E20);
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v8 = (void *)getLSApplicationRecordClass_softClass;
  v27 = getLSApplicationRecordClass_softClass;
  if (!getLSApplicationRecordClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getLSApplicationRecordClass_block_invoke;
    v29 = &unk_1E3A365A8;
    v30 = &v24;
    __getLSApplicationRecordClass_block_invoke((uint64_t)buf);
    v8 = (void *)v25[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v24, 8);
  v23 = 0;
  v10 = (void *)objc_msgSend([v9 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v6, 0, &v23);
  v11 = v23;
  if (v11)
  {
    v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "+[AFSiriAnnouncementRequestCapabilityManager supportedAnnouncementTypesForBundleId:onPlatform:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2112;
      v29 = v11;
      _os_log_error_impl(&dword_19AF50000, v12, OS_LOG_TYPE_ERROR, "%s Unable to retrieve LSApplicationRecord for bundle identifier %@: %@", buf, 0x20u);
    }
    v13 = v7;
  }
  else
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v14 = (void *)getINAppInfoClass_softClass;
    v27 = getINAppInfoClass_softClass;
    if (!getINAppInfoClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getINAppInfoClass_block_invoke;
      v29 = &unk_1E3A365A8;
      v30 = &v24;
      __getINAppInfoClass_block_invoke((uint64_t)buf);
      v14 = (void *)v25[3];
    }
    v15 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v24, 8);
    objc_msgSend(v15, "appInfoWithApplicationRecord:", v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "supportedIntents");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 8; ++i)
    {
      if (objc_msgSend(a1, "_supportsAnnouncementType:forSupportedIntents:forBundleId:onPlatform:", i, v16, v6, a4))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v18);

      }
    }
    v19 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "+[AFSiriAnnouncementRequestCapabilityManager supportedAnnouncementTypesForBundleId:onPlatform:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2112;
      v29 = v7;
      _os_log_debug_impl(&dword_19AF50000, v19, OS_LOG_TYPE_DEBUG, "%s application: %@ supports %@", buf, 0x20u);
    }
    v20 = v7;

  }
  return v7;
}

+ (id)_candidateAnnounceNotificationTypesFromApp:(id)a3 withIntentIDs:(id)a4 notificationContentType:(id)a5 onPlatform:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  id v29;
  void *v30;
  uint64_t v31;
  id obj;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v29 = a5;
  v33 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = (void *)objc_msgSend(a1, "_classForPlatform:", a6);
  v30 = v10;
  objc_msgSend((id)objc_opt_class(), "supportedAnnouncementTypesForBundleId:onPlatform:", v10, a6);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v39;
    do
    {
      v16 = 0;
      v31 = v14;
      do
      {
        if (*(_QWORD *)v39 != v15)
          objc_enumerationMutation(obj);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v16), "integerValue");
        objc_msgSend(v12, "announceableIntentIdentifiersForUserNotificationAnnouncementType:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18 && !objc_msgSend(v18, "count"))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
          v20 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addObject:", v20);
        }
        else
        {
          v36 = 0u;
          v37 = 0u;
          v34 = 0u;
          v35 = 0u;
          v20 = v19;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          if (v21)
          {
            v22 = v21;
            v23 = v12;
            v24 = *(_QWORD *)v35;
            while (2)
            {
              for (i = 0; i != v22; ++i)
              {
                if (*(_QWORD *)v35 != v24)
                  objc_enumerationMutation(v20);
                if (objc_msgSend(v11, "containsObject:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i)))
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "addObject:", v26);

                  goto LABEL_18;
                }
              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
              if (v22)
                continue;
              break;
            }
LABEL_18:
            v12 = v23;
            v14 = v31;
          }
        }

        ++v16;
      }
      while (v16 != v14);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v14);
  }
  if (((objc_msgSend(v29, "isEqualToString:", *MEMORY[0x1E0CEC870]) & 1) != 0
     || objc_msgSend(v29, "isEqualToString:", *MEMORY[0x1E0CEC880]))
    && (v27 = &unk_1E3AA6E38, (objc_msgSend(obj, "containsObject:", &unk_1E3AA6E38) & 1) != 0)
    || objc_msgSend(v29, "isEqualToString:", *MEMORY[0x1E0CEC858])
    && (v27 = &unk_1E3AA6E50, (objc_msgSend(obj, "containsObject:", &unk_1E3AA6E50) & 1) != 0)
    || objc_msgSend(v29, "isEqualToString:", *MEMORY[0x1E0CEC898])
    && (v27 = &unk_1E3AA6E68, (objc_msgSend(obj, "containsObject:", &unk_1E3AA6E68) & 1) != 0)
    || objc_msgSend(v29, "isEqualToString:", *MEMORY[0x1E0CEC848])
    && (v27 = &unk_1E3AA6E80, objc_msgSend(obj, "containsObject:", &unk_1E3AA6E80)))
  {
    objc_msgSend(v33, "addObject:", v27);
  }

  return v33;
}

+ (int64_t)notificationAnnouncementTypeForNotificationFromApp:(id)a3 withIntentIDs:(id)a4 notificationContent:(id)a5 onPlatform:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  int64_t v14;

  if (!a3)
    return 0;
  v10 = a4;
  v11 = a3;
  objc_msgSend(a5, "contentType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_candidateAnnounceNotificationTypesFromApp:withIntentIDs:notificationContentType:onPlatform:", v11, v10, v12, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v13, "containsObject:", &unk_1E3AA6E38) & 1) != 0)
  {
    v14 = 1;
  }
  else if ((objc_msgSend(v13, "containsObject:", &unk_1E3AA6E50) & 1) != 0)
  {
    v14 = 2;
  }
  else if ((objc_msgSend(v13, "containsObject:", &unk_1E3AA6E98) & 1) != 0)
  {
    v14 = 4;
  }
  else if ((objc_msgSend(v13, "containsObject:", &unk_1E3AA6E68) & 1) != 0)
  {
    v14 = 5;
  }
  else if ((objc_msgSend(v13, "containsObject:", &unk_1E3AA6EB0) & 1) != 0)
  {
    v14 = 6;
  }
  else if ((objc_msgSend(v13, "containsObject:", &unk_1E3AA6E80) & 1) != 0)
  {
    v14 = 7;
  }
  else if (objc_msgSend(v13, "containsObject:", &unk_1E3AA6E20))
  {
    v14 = 3;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)_requiredBundleIDsForNotificationAnnouncementType:(int64_t)a3
{
  if ((unint64_t)a3 > 9 || (unint64_t)(a3 - 2) > 4)
    return 0;
  else
    return (id)qword_1E3A32FC0[a3 - 2];
}

+ (id)_requiredPlatformsForNotificationAnnouncementType:(int64_t)a3
{
  if (a3 != 7)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E3AA6E38, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)_supportsAnnouncementType:(int64_t)a3 forSupportedIntents:(id)a4 forBundleId:(id)a5 onPlatform:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  BOOL v21;
  void *v22;
  NSObject *v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  __CFString *v37;
  __int16 v38;
  __CFString *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  objc_msgSend((id)objc_msgSend(a1, "_classForPlatform:", a6), "requiredIntentIdentifiersForUserNotificationAnnouncementType:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend((id)objc_opt_class(), "_requiredBundleIDsForNotificationAnnouncementType:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count") && !objc_msgSend(v13, "containsObject:", v11))
    {
      v21 = 0;
LABEL_21:

      goto LABEL_22;
    }
    v29 = v11;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v31;
LABEL_6:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v31 != v17)
          objc_enumerationMutation(v14);
        if (!objc_msgSend(v10, "containsObject:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v18)))
          break;
        if (v16 == ++v18)
        {
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
          if (v16)
            goto LABEL_6;
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:

      objc_msgSend((id)objc_opt_class(), "_requiredPlatformsForNotificationAnnouncementType:", a3);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v14, "count")
        || (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6),
            v19 = (void *)objc_claimAutoreleasedReturnValue(),
            v20 = objc_msgSend(v14, "containsObject:", v19),
            v19,
            (v20 & 1) != 0))
      {
        v21 = 1;
LABEL_19:
        v11 = v29;
LABEL_20:

        goto LABEL_21;
      }
      v22 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        v24 = v22;
        v11 = v29;
        if ((unint64_t)a3 > 9)
          v25 = CFSTR("(unknown)");
        else
          v25 = off_1E3A2D0D8[a3];
        v26 = v25;
        if ((unint64_t)a6 > 4)
          v27 = CFSTR("(unknown)");
        else
          v27 = off_1E3A33BB8[a6];
        v28 = v27;
        *(_DWORD *)buf = 136315650;
        v35 = "+[AFSiriAnnouncementRequestCapabilityManager _supportsAnnouncementType:forSupportedIntents:forBundleId:onPlatform:]";
        v36 = 2112;
        v37 = v26;
        v38 = 2112;
        v39 = v28;
        _os_log_debug_impl(&dword_19AF50000, v24, OS_LOG_TYPE_DEBUG, "%s rejecting announcementType %@ by platform %@", buf, 0x20u);

        v21 = 0;
        goto LABEL_20;
      }
    }
    v21 = 0;
    goto LABEL_19;
  }
  v21 = 0;
LABEL_22:

  return v21;
}

@end
