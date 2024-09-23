@implementation ASDAppStoreService

void __54__ASDAppStoreService_allBadgeMetricsWithReplyHandler___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(21, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__ASDAppStoreService_allBadgeMetricsWithReplyHandler___block_invoke_2_14;
  block[3] = &unk_1E37BDF10;
  v8 = *(id *)(a1 + 32);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __54__ASDAppStoreService_allBadgeMetricsWithReplyHandler___block_invoke_2_14(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __36__ASDAppStoreService_defaultService__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_30;
  _MergedGlobals_30 = (uint64_t)v1;

}

- (ASDAppStoreService)init
{
  id v3;
  ASDAppStoreService *v4;
  ASDAppStoreService *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *dispatchQueue;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *notificationQueue;
  NSObject *v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;
  _QWORD handler[4];
  id v18;
  objc_super v19;

  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (self
    && (v19.receiver = self,
        v19.super_class = (Class)ASDAppStoreService,
        (v4 = -[ASDAppStoreService init](&v19, sel_init)) != 0))
  {
    v5 = v4;
    objc_storeWeak((id *)&v4->_serviceBroker, v3);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.ASDAppStoreService.dispatch", v6);
    dispatchQueue = v5->_dispatchQueue;
    v5->_dispatchQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.ASDAppStoreService.notification", v9);
    notificationQueue = v5->_notificationQueue;
    v5->_notificationQueue = (OS_dispatch_queue *)v10;

    objc_initWeak(&v19.receiver, v5);
    v5->_badgesChangedNotificationToken = -1;
    dispatch_get_global_queue(21, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __26__ASDAppStoreService_init__block_invoke;
    handler[3] = &unk_1E37BE5E0;
    objc_copyWeak(&v18, &v19.receiver);
    notify_register_dispatch("com.apple.appstored.ASDAppStoreServiceBadgesChanged", &v5->_badgesChangedNotificationToken, v12, handler);

    v5->_badgesChangedForAppStoreNotificationToken = -1;
    v15[0] = v13;
    v15[1] = 3221225472;
    v15[2] = __26__ASDAppStoreService_init__block_invoke_2;
    v15[3] = &unk_1E37BE5E0;
    objc_copyWeak(&v16, &v19.receiver);
    notify_register_dispatch("com.apple.appstored.ASDAppStoreServiceBadgeChangedWithActionResponse", &v5->_badgesChangedForAppStoreNotificationToken, v12, v15);

    -[ASDAppStoreService _refreshCache:sendActionResponse:](v5, 0, 0);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v19.receiver);
  }
  else
  {

    return 0;
  }
  return v5;
}

void __26__ASDAppStoreService_init__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    -[ASDAppStoreService _refreshCache:sendActionResponse:](WeakRetained, 1, 0);
    WeakRetained = v2;
  }

}

- (void)_refreshCache:(int)a3 sendActionResponse:
{
  NSObject *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[6];
  char v11;
  char v12;
  _QWORD block[6];
  _BYTE buf[24];
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  ASDLogHandleForCategory(12);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a2;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = a3;
    v7 = *(id *)&buf[4];
    _os_log_impl(&dword_19A03B000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Refreshing caches with notify: %{BOOL}d sendActionResponse: %{BOOL}d", buf, 0x18u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  v8 = a1[2];
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__ASDAppStoreService__refreshCache_sendActionResponse___block_invoke;
  block[3] = &unk_1E37BDC70;
  block[4] = a1;
  block[5] = buf;
  dispatch_sync(v8, block);
  v10[0] = v9;
  v10[1] = 3221225472;
  v10[2] = __55__ASDAppStoreService__refreshCache_sendActionResponse___block_invoke_2;
  v10[3] = &unk_1E37BEA70;
  v11 = a2;
  v10[4] = a1;
  v10[5] = buf;
  v12 = a3;
  objc_msgSend(a1, "allBadgeMetricsWithReplyHandler:", v10);
  _Block_object_dispose(buf, 8);

}

void __54__ASDAppStoreService_allBadgeMetricsWithReplyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __54__ASDAppStoreService_allBadgeMetricsWithReplyHandler___block_invoke_2;
    v13[3] = &unk_1E37BDEE8;
    v7 = *(void **)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v7;
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __54__ASDAppStoreService_allBadgeMetricsWithReplyHandler___block_invoke_13;
    v11[3] = &unk_1E37BDC28;
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v8, "allBadgeMetricsWithReplyHandler:", v11);

  }
  else
  {
    ASDLogHandleForCategory(12);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v16 = (id)objc_opt_class();
      v17 = 2114;
      v18 = v5;
      v10 = v16;
      _os_log_error_impl(&dword_19A03B000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] allBadgeMetricsWithReplyHandler failed with error: %{public}@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

+ (id)interface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE392070);
}

- (void)allBadgeMetricsWithReplyHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__ASDAppStoreService_allBadgeMetricsWithReplyHandler___block_invoke;
  v7[3] = &unk_1E37BE930;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getAppStoreServiceWithCompletionHandler:", v7);

}

void __55__ASDAppStoreService__refreshCache_sendActionResponse___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __34__ASDAppStoreService_setObserver___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
}

uint64_t __47__ASDAppStoreService_addBadgeIDs_replyHandler___block_invoke_2_10(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __55__ASDAppStoreService__refreshCache_sendActionResponse___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id WeakRetained;
  char v39;
  NSObject *v40;
  void *v41;
  id v42;
  NSObject *v43;
  id v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  id v48;
  NSObject *v49;
  id v50;
  uint64_t v51;
  NSObject *v52;
  void *v53;
  id v54;
  NSObject *v55;
  void *v56;
  void *v57;
  id obj;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint8_t v70[128];
  _BYTE v71[24];
  void *v72;
  uint64_t v73;
  id v74;
  _BYTE block[24];
  void *v76;
  uint64_t v77;
  id v78;
  _BYTE buf[24];
  void *v80;
  uint64_t v81;
  id v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  if (*(_BYTE *)(a1 + 56))
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(a1 + 40), "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = v7;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v66;
      v14 = (void *)MEMORY[0x1E0C9AA70];
      do
      {
        v15 = 0;
        v59 = (id)v12;
        do
        {
          if (*(_QWORD *)v66 != v13)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * v15);
          if ((objc_msgSend(v10, "containsObject:", v16, v56) & 1) == 0)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            _ASA(v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (*(_BYTE *)(a1 + 57))
            {
              v19 = v14;
              if (v18)
              {
                objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("actionMetrics"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                if (v20)
                {
                  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("actionMetrics"));
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v19 = v14;
                }
                v12 = (uint64_t)v59;
              }
            }
            else
            {
              v19 = v14;
            }
            objc_msgSend(v57, "setValue:forKey:", v19, v16);

          }
          ++v15;
        }
        while (v12 != v15);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
      }
      while (v12);
    }

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v60 = v10;
    v21 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v62;
      v24 = (void *)MEMORY[0x1E0C9AA70];
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v62 != v23)
            objc_enumerationMutation(v60);
          v26 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
          if ((objc_msgSend(obj, "containsObject:", v26, v56) & 1) == 0)
          {
            objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            _ASA(v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (v28
              && (objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("metrics")),
                  v29 = (void *)objc_claimAutoreleasedReturnValue(),
                  v29,
                  v29))
            {
              objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("metrics"));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v30 = v24;
            }
            objc_msgSend(v56, "setValue:forKey:", v30, v26);

          }
        }
        v22 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
      }
      while (v22);
    }

    v31 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v60, "allObjects");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v56, "copy");
    v34 = (void *)objc_msgSend(v57, "copy");
    v35 = v32;
    v36 = v33;
    v37 = v34;
    if (v31)
    {
      WeakRetained = objc_loadWeakRetained((id *)(v31 + 40));
      v39 = objc_opt_respondsToSelector();

      if ((v39 & 1) != 0)
      {
        ASDLogHandleForCategory(12);
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          v41 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v41;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v35;
          v42 = v41;
          _os_log_impl(&dword_19A03B000, v40, OS_LOG_TYPE_INFO, "[%{public}@] Handling apps refreshed to %{public}@", buf, 0x16u);

        }
        v43 = *(NSObject **)(v31 + 24);
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __75__ASDAppStoreService__handleNotificationRefresh_addedBadges_removedBadges___block_invoke;
        v80 = &unk_1E37BDC98;
        v81 = v31;
        v82 = v35;
        dispatch_async(v43, buf);

      }
      v44 = objc_loadWeakRetained((id *)(v31 + 40));
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v45 = objc_msgSend(v36, "count");

        if (v45)
        {
          ASDLogHandleForCategory(12);
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            v47 = (void *)objc_opt_class();
            *(_DWORD *)block = 138543618;
            *(_QWORD *)&block[4] = v47;
            *(_WORD *)&block[12] = 2114;
            *(_QWORD *)&block[14] = v36;
            v48 = v47;
            _os_log_impl(&dword_19A03B000, v46, OS_LOG_TYPE_INFO, "[%{public}@] Handling didAddBadges %{public}@", block, 0x16u);

          }
          v49 = *(NSObject **)(v31 + 24);
          *(_QWORD *)block = MEMORY[0x1E0C809B0];
          *(_QWORD *)&block[8] = 3221225472;
          *(_QWORD *)&block[16] = __75__ASDAppStoreService__handleNotificationRefresh_addedBadges_removedBadges___block_invoke_55;
          v76 = &unk_1E37BDC98;
          v77 = v31;
          v78 = v36;
          dispatch_async(v49, block);

        }
      }
      else
      {

      }
      v50 = objc_loadWeakRetained((id *)(v31 + 40));
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v51 = objc_msgSend(v37, "count");

        if (v51)
        {
          ASDLogHandleForCategory(12);
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            v53 = (void *)objc_opt_class();
            *(_DWORD *)v71 = 138543618;
            *(_QWORD *)&v71[4] = v53;
            *(_WORD *)&v71[12] = 2114;
            *(_QWORD *)&v71[14] = v37;
            v54 = v53;
            _os_log_impl(&dword_19A03B000, v52, OS_LOG_TYPE_INFO, "[%{public}@] Handling didRemoveBadges %{public}@", v71, 0x16u);

          }
          v55 = *(NSObject **)(v31 + 24);
          *(_QWORD *)v71 = MEMORY[0x1E0C809B0];
          *(_QWORD *)&v71[8] = 3221225472;
          *(_QWORD *)&v71[16] = __75__ASDAppStoreService__handleNotificationRefresh_addedBadges_removedBadges___block_invoke_58;
          v72 = &unk_1E37BDC98;
          v73 = v31;
          v74 = v37;
          dispatch_async(v55, v71);

        }
      }
      else
      {

      }
    }

  }
}

void __55__ASDAppStoreService__refreshCache_sendActionResponse___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  __int16 v11;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(NSObject **)(v4 + 16);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[2] = __55__ASDAppStoreService__refreshCache_sendActionResponse___block_invoke_3;
  v8[3] = &unk_1E37BEA48;
  v8[1] = 3221225472;
  v8[4] = v4;
  v9 = v3;
  v11 = *(_WORD *)(a1 + 48);
  v10 = v5;
  v7 = v3;
  dispatch_async(v6, v8);

}

+ (id)defaultService
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__ASDAppStoreService_defaultService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECFFAA10 != -1)
    dispatch_once(&qword_1ECFFAA10, block);
  return (id)_MergedGlobals_30;
}

void __47__ASDAppStoreService_addBadgeIDs_replyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __47__ASDAppStoreService_addBadgeIDs_replyHandler___block_invoke_2;
    v13[3] = &unk_1E37BDEE8;
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = *(id *)(a1 + 48);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __47__ASDAppStoreService_addBadgeIDs_replyHandler___block_invoke_9;
    v11[3] = &unk_1E37BDB88;
    v8 = *(_QWORD *)(a1 + 40);
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v7, "addBadgeIDs:replyHandler:", v8, v11);

  }
  else
  {
    ASDLogHandleForCategory(12);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v16 = (id)objc_opt_class();
      v17 = 2114;
      v18 = v5;
      v10 = v16;
      _os_log_error_impl(&dword_19A03B000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] addBadgeIDs failed with error: %{public}@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)setObserver:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__ASDAppStoreService_setObserver___block_invoke;
  v7[3] = &unk_1E37BDC98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __47__ASDAppStoreService_addBadgeIDs_replyHandler___block_invoke_9(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  dispatch_get_global_queue(21, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__ASDAppStoreService_addBadgeIDs_replyHandler___block_invoke_2_10;
  block[3] = &unk_1E37BDF60;
  v7 = *(id *)(a1 + 32);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

- (void)addBadgeIDs:(id)a3 replyHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__ASDAppStoreService_addBadgeIDs_replyHandler___block_invoke;
  v11[3] = &unk_1E37BE9F8;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "getAppStoreServiceWithCompletionHandler:", v11);

}

void __26__ASDAppStoreService_init__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    -[ASDAppStoreService _refreshCache:sendActionResponse:](WeakRetained, 1, 1);
    WeakRetained = v2;
  }

}

- (void)dealloc
{
  int badgesChangedNotificationToken;
  int badgesChangedForAppStoreNotificationToken;
  objc_super v5;

  badgesChangedNotificationToken = self->_badgesChangedNotificationToken;
  if (badgesChangedNotificationToken != -1)
  {
    notify_cancel(badgesChangedNotificationToken);
    self->_badgesChangedNotificationToken = -1;
  }
  badgesChangedForAppStoreNotificationToken = self->_badgesChangedForAppStoreNotificationToken;
  if (badgesChangedForAppStoreNotificationToken != -1)
  {
    notify_cancel(badgesChangedForAppStoreNotificationToken);
    self->_badgesChangedForAppStoreNotificationToken = -1;
  }
  v5.receiver = self;
  v5.super_class = (Class)ASDAppStoreService;
  -[ASDAppStoreService dealloc](&v5, sel_dealloc);
}

- (ASDAppStoreChangedObserver)observer
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__ASDAppStoreService_observer__block_invoke;
  v5[3] = &unk_1E37BDC70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (ASDAppStoreChangedObserver *)v3;
}

void __30__ASDAppStoreService_observer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

void __47__ASDAppStoreService_addBadgeIDs_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 138543618;
    v8 = (id)objc_opt_class();
    v9 = 2114;
    v10 = v3;
    v6 = v8;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] addBadgeIDs failed with xpc error: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  (*(void (**)(_QWORD, _QWORD, id, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, v3, v5);

}

void __54__ASDAppStoreService_allBadgeMetricsWithReplyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 138543618;
    v8 = (id)objc_opt_class();
    v9 = 2114;
    v10 = v3;
    v6 = v8;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] allBadgeMetricsWithReplyHandler failed with xpc error: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  (*(void (**)(_QWORD, _QWORD, id, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, v3, v5);

}

- (void)allBadgeIDsWithReplyHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__ASDAppStoreService_allBadgeIDsWithReplyHandler___block_invoke;
  v7[3] = &unk_1E37BE930;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getAppStoreServiceWithCompletionHandler:", v7);

}

void __50__ASDAppStoreService_allBadgeIDsWithReplyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50__ASDAppStoreService_allBadgeIDsWithReplyHandler___block_invoke_2;
    v13[3] = &unk_1E37BDEE8;
    v7 = *(void **)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v7;
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __50__ASDAppStoreService_allBadgeIDsWithReplyHandler___block_invoke_16;
    v11[3] = &unk_1E37BDBD8;
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v8, "allBadgeIDsWithReplyHandler:", v11);

  }
  else
  {
    ASDLogHandleForCategory(12);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v16 = (id)objc_opt_class();
      v17 = 2114;
      v18 = v5;
      v10 = v16;
      _os_log_error_impl(&dword_19A03B000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] allBadgeIDsWithReplyHandler failed with error: %{public}@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __50__ASDAppStoreService_allBadgeIDsWithReplyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 138543618;
    v8 = (id)objc_opt_class();
    v9 = 2114;
    v10 = v3;
    v6 = v8;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] allBadgeIDsWithReplyHandler failed with xpc error: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  (*(void (**)(_QWORD, _QWORD, id, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA60], v3, v5);

}

void __50__ASDAppStoreService_allBadgeIDsWithReplyHandler___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(21, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ASDAppStoreService_allBadgeIDsWithReplyHandler___block_invoke_2_17;
  block[3] = &unk_1E37BDF10;
  v8 = *(id *)(a1 + 32);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __50__ASDAppStoreService_allBadgeIDsWithReplyHandler___block_invoke_2_17(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)badgeCountWithReplyHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__ASDAppStoreService_badgeCountWithReplyHandler___block_invoke;
  v7[3] = &unk_1E37BE930;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getAppStoreServiceWithCompletionHandler:", v7);

}

void __49__ASDAppStoreService_badgeCountWithReplyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __49__ASDAppStoreService_badgeCountWithReplyHandler___block_invoke_2;
    v13[3] = &unk_1E37BDEE8;
    v7 = *(void **)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v7;
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __49__ASDAppStoreService_badgeCountWithReplyHandler___block_invoke_19;
    v11[3] = &unk_1E37BE958;
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v8, "badgeIDCountWithReplyHandler:", v11);

  }
  else
  {
    ASDLogHandleForCategory(12);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v16 = (id)objc_opt_class();
      v17 = 2114;
      v18 = v5;
      v10 = v16;
      _os_log_error_impl(&dword_19A03B000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] badgeCountWithReplyHandler failed with error: %{public}@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __49__ASDAppStoreService_badgeCountWithReplyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 138543618;
    v8 = (id)objc_opt_class();
    v9 = 2114;
    v10 = v3;
    v6 = v8;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] badgeCountWithReplyHandler failed with xpc error: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  (*(void (**)(_QWORD, _QWORD, id, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, v3, v5);

}

uint64_t __49__ASDAppStoreService_badgeCountWithReplyHandler___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeAllBadgeIDsWithReplyHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__ASDAppStoreService_removeAllBadgeIDsWithReplyHandler___block_invoke;
  v7[3] = &unk_1E37BE930;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getAppStoreServiceWithCompletionHandler:", v7);

}

void __56__ASDAppStoreService_removeAllBadgeIDsWithReplyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__ASDAppStoreService_removeAllBadgeIDsWithReplyHandler___block_invoke_2;
    v13[3] = &unk_1E37BDEE8;
    v7 = *(void **)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v7;
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __56__ASDAppStoreService_removeAllBadgeIDsWithReplyHandler___block_invoke_21;
    v11[3] = &unk_1E37BDB88;
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v8, "removeAllBadgeIDsWithReplyHandler:", v11);

  }
  else
  {
    ASDLogHandleForCategory(12);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v16 = (id)objc_opt_class();
      v17 = 2114;
      v18 = v5;
      v10 = v16;
      _os_log_error_impl(&dword_19A03B000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] removeAllBadgeIDsWithReplyHandler failed with error: %{public}@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __56__ASDAppStoreService_removeAllBadgeIDsWithReplyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 138543618;
    v8 = (id)objc_opt_class();
    v9 = 2114;
    v10 = v3;
    v6 = v8;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] removeAllBadgeIDsWithReplyHandler failed with xpc error: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  (*(void (**)(_QWORD, _QWORD, id, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, v3, v5);

}

void __56__ASDAppStoreService_removeAllBadgeIDsWithReplyHandler___block_invoke_21(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  dispatch_get_global_queue(21, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__ASDAppStoreService_removeAllBadgeIDsWithReplyHandler___block_invoke_2_22;
  block[3] = &unk_1E37BDF60;
  v7 = *(id *)(a1 + 32);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __56__ASDAppStoreService_removeAllBadgeIDsWithReplyHandler___block_invoke_2_22(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)removeBadgeIDs:(id)a3 replyHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__ASDAppStoreService_removeBadgeIDs_replyHandler___block_invoke;
  v11[3] = &unk_1E37BE9F8;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "getAppStoreServiceWithCompletionHandler:", v11);

}

void __50__ASDAppStoreService_removeBadgeIDs_replyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50__ASDAppStoreService_removeBadgeIDs_replyHandler___block_invoke_2;
    v13[3] = &unk_1E37BDEE8;
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = *(id *)(a1 + 48);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __50__ASDAppStoreService_removeBadgeIDs_replyHandler___block_invoke_23;
    v11[3] = &unk_1E37BDB88;
    v8 = *(_QWORD *)(a1 + 40);
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v7, "removeBadgeIDs:replyHandler:", v8, v11);

  }
  else
  {
    ASDLogHandleForCategory(12);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v16 = (id)objc_opt_class();
      v17 = 2114;
      v18 = v5;
      v10 = v16;
      _os_log_error_impl(&dword_19A03B000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] removeBadgeIDs failed with error: %{public}@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __50__ASDAppStoreService_removeBadgeIDs_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 138543618;
    v8 = (id)objc_opt_class();
    v9 = 2114;
    v10 = v3;
    v6 = v8;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] removeBadgeIDs failed with xpc error: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  (*(void (**)(_QWORD, _QWORD, id, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, v3, v5);

}

void __50__ASDAppStoreService_removeBadgeIDs_replyHandler___block_invoke_23(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  dispatch_get_global_queue(21, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ASDAppStoreService_removeBadgeIDs_replyHandler___block_invoke_2_24;
  block[3] = &unk_1E37BDF60;
  v7 = *(id *)(a1 + 32);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __50__ASDAppStoreService_removeBadgeIDs_replyHandler___block_invoke_2_24(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)removeMetricsForBadgeIDs:(id)a3 replyHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__ASDAppStoreService_removeMetricsForBadgeIDs_replyHandler___block_invoke;
  v11[3] = &unk_1E37BE9F8;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "getAppStoreServiceWithCompletionHandler:", v11);

}

void __60__ASDAppStoreService_removeMetricsForBadgeIDs_replyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __60__ASDAppStoreService_removeMetricsForBadgeIDs_replyHandler___block_invoke_2;
    v13[3] = &unk_1E37BDEE8;
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = *(id *)(a1 + 48);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __60__ASDAppStoreService_removeMetricsForBadgeIDs_replyHandler___block_invoke_25;
    v11[3] = &unk_1E37BDB88;
    v8 = *(_QWORD *)(a1 + 40);
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v7, "removeBadgeMetricsForBadgeIDs:replyHandler:", v8, v11);

  }
  else
  {
    ASDLogHandleForCategory(12);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v16 = (id)objc_opt_class();
      v17 = 2114;
      v18 = v5;
      v10 = v16;
      _os_log_error_impl(&dword_19A03B000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] removeMetricsForBadgeIDs failed with error: %{public}@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __60__ASDAppStoreService_removeMetricsForBadgeIDs_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 138543618;
    v8 = (id)objc_opt_class();
    v9 = 2114;
    v10 = v3;
    v6 = v8;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] removeMetricsForBadgeIDs failed with xpc error: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  (*(void (**)(_QWORD, _QWORD, id, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, v3, v5);

}

void __60__ASDAppStoreService_removeMetricsForBadgeIDs_replyHandler___block_invoke_25(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  dispatch_get_global_queue(21, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__ASDAppStoreService_removeMetricsForBadgeIDs_replyHandler___block_invoke_2_26;
  block[3] = &unk_1E37BDF60;
  v7 = *(id *)(a1 + 32);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __60__ASDAppStoreService_removeMetricsForBadgeIDs_replyHandler___block_invoke_2_26(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)launchAppStoreWithURL:(id)a3 withReplyHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__ASDAppStoreService_launchAppStoreWithURL_withReplyHandler___block_invoke;
  v11[3] = &unk_1E37BE9F8;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "getAppStoreServiceWithCompletionHandler:", v11);

}

void __61__ASDAppStoreService_launchAppStoreWithURL_withReplyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __61__ASDAppStoreService_launchAppStoreWithURL_withReplyHandler___block_invoke_2;
    v17[3] = &unk_1E37BE980;
    v7 = *(void **)(a1 + 40);
    v17[4] = *(_QWORD *)(a1 + 32);
    v18 = v7;
    v19 = *(id *)(a1 + 48);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __61__ASDAppStoreService_launchAppStoreWithURL_withReplyHandler___block_invoke_27;
    v14[3] = &unk_1E37BE9D0;
    v9 = *(void **)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = v9;
    v16 = *(id *)(a1 + 48);
    objc_msgSend(v8, "launchAppStoreWithURL:withReplyHandler:", v15, v14);

  }
  else
  {
    ASDLogHandleForCategory(12);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_opt_class();
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v21 = v11;
      v22 = 2114;
      v23 = v12;
      v24 = 2114;
      v25 = v5;
      v13 = v11;
      _os_log_error_impl(&dword_19A03B000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to launch %{public}@ error: %{public}@", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __61__ASDAppStoreService_launchAppStoreWithURL_withReplyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_opt_class();
    v7 = *(_QWORD *)(a1 + 40);
    v9 = 138543874;
    v10 = v6;
    v11 = 2114;
    v12 = v7;
    v13 = 2114;
    v14 = v3;
    v8 = v6;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to launch %{public}@ error: %{public}@", (uint8_t *)&v9, 0x20u);

  }
  (*(void (**)(_QWORD, uint64_t, id, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 2, v3, v5);

}

void __61__ASDAppStoreService_launchAppStoreWithURL_withReplyHandler___block_invoke_27(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    ASDLogHandleForCategory(12);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_opt_class();
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v17 = v9;
      v18 = 2114;
      v19 = v10;
      v20 = 2048;
      v21 = a2;
      v11 = v9;
      _os_log_error_impl(&dword_19A03B000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to launch %{public}@ status: %ld", buf, 0x20u);

    }
  }
  dispatch_get_global_queue(21, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__ASDAppStoreService_launchAppStoreWithURL_withReplyHandler___block_invoke_28;
  block[3] = &unk_1E37BE9A8;
  v14 = *(id *)(a1 + 48);
  v15 = a2;
  v13 = v5;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __61__ASDAppStoreService_launchAppStoreWithURL_withReplyHandler___block_invoke_28(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (void)reloadWidgetOnConnectivityToEndpoint:(id)a3 parameters:(id)a4 replyHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  SEL v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __83__ASDAppStoreService_reloadWidgetOnConnectivityToEndpoint_parameters_replyHandler___block_invoke;
  v16[3] = &unk_1E37BEA20;
  v19 = v11;
  v20 = a2;
  v16[4] = self;
  v17 = v9;
  v18 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v11;
  objc_msgSend(v12, "getAppStoreServiceWithCompletionHandler:", v16);

}

void __83__ASDAppStoreService_reloadWidgetOnConnectivityToEndpoint_parameters_replyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  id v14;
  __int128 v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  const char *Name;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __83__ASDAppStoreService_reloadWidgetOnConnectivityToEndpoint_parameters_replyHandler___block_invoke_2;
    v18[3] = &unk_1E37BE000;
    v18[4] = *(_QWORD *)(a1 + 32);
    v15 = *(_OWORD *)(a1 + 56);
    v7 = (id)v15;
    v19 = v15;
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __83__ASDAppStoreService_reloadWidgetOnConnectivityToEndpoint_parameters_replyHandler___block_invoke_29;
    v16[3] = &unk_1E37BDB88;
    v17 = *(id *)(a1 + 56);
    objc_msgSend(v8, "reloadWidgetOnConnectivityToEndpoint:parameters:replyHandler:", v9, v10, v16);

  }
  else
  {
    ASDLogHandleForCategory(12);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_opt_class();
      v13 = *(const char **)(a1 + 64);
      v14 = v12;
      *(_DWORD *)buf = 138543874;
      v21 = v12;
      v22 = 2080;
      Name = sel_getName(v13);
      v24 = 2114;
      v25 = v5;
      _os_log_error_impl(&dword_19A03B000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] %s failed with error: %{public}@", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __83__ASDAppStoreService_reloadWidgetOnConnectivityToEndpoint_parameters_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  const char *v6;
  id v7;
  int v8;
  void *v9;
  __int16 v10;
  const char *Name;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_opt_class();
    v6 = *(const char **)(a1 + 48);
    v7 = v5;
    v8 = 138543874;
    v9 = v5;
    v10 = 2080;
    Name = sel_getName(v6);
    v12 = 2114;
    v13 = v3;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] %s failed with xpc error: %{public}@", (uint8_t *)&v8, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __83__ASDAppStoreService_reloadWidgetOnConnectivityToEndpoint_parameters_replyHandler___block_invoke_29(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  dispatch_get_global_queue(21, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__ASDAppStoreService_reloadWidgetOnConnectivityToEndpoint_parameters_replyHandler___block_invoke_2_30;
  block[3] = &unk_1E37BDF60;
  v7 = *(id *)(a1 + 32);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __83__ASDAppStoreService_reloadWidgetOnConnectivityToEndpoint_parameters_replyHandler___block_invoke_2_30(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __75__ASDAppStoreService__handleNotificationRefresh_addedBadges_removedBadges___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "service:badgesDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __75__ASDAppStoreService__handleNotificationRefresh_addedBadges_removedBadges___block_invoke_55(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "service:didAddBadges:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __75__ASDAppStoreService__handleNotificationRefresh_addedBadges_removedBadges___block_invoke_58(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "service:didRemoveBadges:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_serviceBroker);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_badges, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
