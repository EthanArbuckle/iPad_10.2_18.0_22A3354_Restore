@implementation FCSubscriptionController

id __68__FCSubscriptionController_subscribedTagIDsWithNotificationsEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "notificationsEnabled"))
  {
    objc_msgSend(v2, "tagID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __62__FCSubscriptionController_portraitExcludedAutoFavoriteTagIDs__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "subscriptionOrigin") == 8)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "tagID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

uint64_t __61__FCSubscriptionController_newlySubscribedTagIDsInDateRange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isTypeTag");
}

- (void)_fetchMissingTagsWithCompletion:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 16), "subscribedTagIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    v6 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(a1 + 40), "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "minusSet:", v8);

    if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= 5)
      v9 = 17;
    else
      v9 = 25;
    +[FCCachePolicy cachePolicyWithSoftMaxAge:](FCCachePolicy, "cachePolicyWithSoftMaxAge:", 1.79769313e308);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60__FCSubscriptionController__fetchMissingTagsWithCompletion___block_invoke;
    v12[3] = &unk_1E463CA08;
    v13 = v3;
    -[FCSubscriptionController _fetchTagsForIDs:cachePolicy:qualityOfService:completion:](a1, v11, v10, v9, v12);

  }
}

- (void)_fetchTagsForIDs:(void *)a3 cachePolicy:(uint64_t)a4 qualityOfService:(void *)a5 completion:
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  _QWORD block[5];
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD v28[4];
  NSObject *v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD v32[4];
  NSObject *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[5];
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;

  v9 = a2;
  v10 = a3;
  v11 = a5;
  if (a1)
  {
    v12 = dispatch_group_create();
    v13 = (void *)objc_opt_new();
    v14 = (void *)objc_opt_new();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke;
    v44[3] = &unk_1E463FD48;
    v15 = v13;
    v45 = v15;
    v16 = v14;
    v46 = v16;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v44);
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x3032000000;
    v42[3] = __Block_byref_object_copy__24;
    v42[4] = __Block_byref_object_dispose__24;
    v43 = 0;
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x3032000000;
    v40[3] = __Block_byref_object_copy__24;
    v40[4] = __Block_byref_object_dispose__24;
    v41 = 0;
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = __Block_byref_object_copy__24;
    v38[4] = __Block_byref_object_dispose__24;
    v39 = 0;
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x3032000000;
    v36[3] = __Block_byref_object_copy__24;
    v36[4] = __Block_byref_object_dispose__24;
    v37 = 0;
    v17 = objc_msgSend(v15, "count");
    if (v17 + objc_msgSend(v16, "count"))
    {
      if (objc_msgSend(v15, "count"))
      {
        dispatch_group_enter(v12);
        v18 = *(id *)(a1 + 32);
        FCDispatchQueueForQualityOfService(a4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke_2;
        v32[3] = &unk_1E463FD70;
        v34 = v42;
        v35 = v40;
        v33 = v12;
        objc_msgSend(v18, "fetchPuzzleTypesForPuzzleTypeIDs:cachePolicy:qualityOfService:callbackQueue:completionHandler:", v15, v10, a4, v19, v32);

      }
      if (objc_msgSend(v16, "count"))
      {
        dispatch_group_enter(v12);
        v20 = *(id *)(a1 + 24);
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke_3;
        v28[3] = &unk_1E463FD70;
        v30 = v38;
        v31 = v36;
        v29 = v12;
        objc_msgSend(v20, "fetchTagsForTagIDs:cachePolicy:qualityOfService:completionHandler:", v16, v10, a4, v28);

      }
      FCDispatchQueueForQualityOfService(a4);
      v21 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke_4;
      block[3] = &unk_1E46400D8;
      v24 = v36;
      v25 = v40;
      block[4] = a1;
      v26 = v42;
      v27 = v38;
      v23 = v11;
      dispatch_group_notify(v12, v21, block);

    }
    else if (v11)
    {
      (*((void (**)(id, _QWORD))v11 + 2))(v11, MEMORY[0x1E0C9AA70]);
    }
    _Block_object_dispose(v36, 8);

    _Block_object_dispose(v38, 8);
    _Block_object_dispose(v40, 8);

    _Block_object_dispose(v42, 8);
  }

}

uint64_t __60__FCSubscriptionController__fetchMissingTagsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __88__FCSubscriptionController_fetchSubscribedTagsWithCallbackQueue_preferCache_completion___block_invoke_3(_QWORD *a1)
{
  void *v1;
  NSObject *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v1 = (void *)a1[6];
  if (v1)
  {
    v3 = a1[4];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __88__FCSubscriptionController_fetchSubscribedTagsWithCallbackQueue_preferCache_completion___block_invoke_4;
    v5[3] = &unk_1E463B2D0;
    v4 = v1;
    v5[4] = a1[5];
    v6 = v4;
    dispatch_async(v3, v5);

  }
}

uint64_t __50__FCSubscriptionController_subscriptionsWithType___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[2];
  return objc_msgSend(v2, "subscriptionForTagID:type:", a2, *(_QWORD *)(a1 + 40));
}

- (id)mutedTagIDs
{
  void *v2;
  void *v3;

  if (self)
    self = (FCSubscriptionController *)self->_subscriptionList;
  -[FCSubscriptionController mutedTagIDs](self, "mutedTagIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)fetchSubscribedTagsWithCallbackQueue:(id)a3 preferCache:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  FCSubscriptionList *subscriptionList;
  _QWORD v13[5];
  NSObject *v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[FCSubscriptionController cachedSubscribedTags](self, "cachedSubscribedTags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "count") || !v6)
  {
    if (self)
      subscriptionList = self->_subscriptionList;
    else
      subscriptionList = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __88__FCSubscriptionController_fetchSubscribedTagsWithCallbackQueue_preferCache_completion___block_invoke_2;
    v13[3] = &unk_1E463DB98;
    v13[4] = self;
    v15 = v9;
    v14 = v8;
    -[FCPrivateDataController performFirstSyncWithCompletion:](subscriptionList, "performFirstSyncWithCompletion:", v13);

    v11 = v15;
    goto LABEL_8;
  }
  if (v9)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__FCSubscriptionController_fetchSubscribedTagsWithCallbackQueue_preferCache_completion___block_invoke;
    block[3] = &unk_1E463B2D0;
    v18 = v9;
    v17 = v10;
    dispatch_async(v8, block);

    v11 = v18;
LABEL_8:

  }
}

void __88__FCSubscriptionController_fetchSubscribedTagsWithCallbackQueue_preferCache_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "cachedSubscribedTags");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (id)cachedSubscribedTags
{
  if (self)
    self = (FCSubscriptionController *)self->_subscribedTagsByTagID;
  return (id)-[FCSubscriptionController allValues](self, "allValues");
}

void __88__FCSubscriptionController_fetchSubscribedTagsWithCallbackQueue_preferCache_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __88__FCSubscriptionController_fetchSubscribedTagsWithCallbackQueue_preferCache_completion___block_invoke_3;
  v5[3] = &unk_1E463DC60;
  v8 = *(id *)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  -[FCSubscriptionController _fetchMissingTagsWithCompletion:](v2, v5);

}

- (void)setLocalChannelsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_localChannelsProvider, a3);
}

- (FCSubscriptionController)initWithSubscriptionList:(id)a3 tagController:(id)a4 puzzleTypeController:(id)a5 notificationController:(id)a6 purchaseProvider:(id)a7 configurationManager:(id)a8 appConfigurationManager:(id)a9 appActivityMonitor:(id)a10 userInfo:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  FCSubscriptionController *v21;
  FCSubscriptionController *v22;
  uint64_t v23;
  NSHashTable *observers;
  FCThreadSafeMutableDictionary *v25;
  FCThreadSafeMutableDictionary *subscribedTagsByTagID;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id obj;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  objc_super v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  obj = a4;
  v18 = a4;
  v34 = a5;
  v19 = a5;
  v35 = a6;
  v45 = a6;
  v36 = a7;
  v44 = a7;
  v38 = a8;
  v43 = a8;
  v37 = a9;
  v42 = a9;
  v20 = a10;
  v39 = a11;
  v41 = a11;
  if (!v17 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "subscriptionList != nil", obj, v34, a6, a7, a9, a8, a11);
    *(_DWORD *)buf = 136315906;
    v48 = "-[FCSubscriptionController initWithSubscriptionList:tagController:puzzleTypeController:notificationController:"
          "purchaseProvider:configurationManager:appConfigurationManager:appActivityMonitor:userInfo:]";
    v49 = 2080;
    v50 = "FCSubscriptionController.m";
    v51 = 1024;
    v52 = 90;
    v53 = 2114;
    v54 = v29;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v18)
      goto LABEL_6;
  }
  else if (v18)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagController != nil");
    *(_DWORD *)buf = 136315906;
    v48 = "-[FCSubscriptionController initWithSubscriptionList:tagController:puzzleTypeController:notificationController:"
          "purchaseProvider:configurationManager:appConfigurationManager:appActivityMonitor:userInfo:]";
    v49 = 2080;
    v50 = "FCSubscriptionController.m";
    v51 = 1024;
    v52 = 91;
    v53 = 2114;
    v54 = v30;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (!v19 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "puzzleTypeController != nil");
    *(_DWORD *)buf = 136315906;
    v48 = "-[FCSubscriptionController initWithSubscriptionList:tagController:puzzleTypeController:notificationController:"
          "purchaseProvider:configurationManager:appConfigurationManager:appActivityMonitor:userInfo:]";
    v49 = 2080;
    v50 = "FCSubscriptionController.m";
    v51 = 1024;
    v52 = 92;
    v53 = 2114;
    v54 = v31;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v20)
      goto LABEL_11;
  }
  else if (v20)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "appActivityMonitor != nil");
    *(_DWORD *)buf = 136315906;
    v48 = "-[FCSubscriptionController initWithSubscriptionList:tagController:puzzleTypeController:notificationController:"
          "purchaseProvider:configurationManager:appConfigurationManager:appActivityMonitor:userInfo:]";
    v49 = 2080;
    v50 = "FCSubscriptionController.m";
    v51 = 1024;
    v52 = 93;
    v53 = 2114;
    v54 = v32;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_11:
  v46.receiver = self;
  v46.super_class = (Class)FCSubscriptionController;
  v21 = -[FCSubscriptionController init](&v46, sel_init);
  v22 = v21;
  if (v21)
  {
    if (v17 && v18 && v19)
    {
      objc_msgSend(v17, "addObserver:", v21);
      objc_storeStrong((id *)&v22->_subscriptionList, a3);
      objc_storeStrong((id *)&v22->_tagController, obj);
      objc_storeStrong((id *)&v22->_puzzleTypeController, v34);
      objc_storeStrong((id *)&v22->_notificationController, v35);
      objc_storeStrong((id *)&v22->_purchaseProvider, v36);
      objc_storeStrong((id *)&v22->_configurationManager, v38);
      objc_storeStrong((id *)&v22->_appConfigurationManager, v37);
      objc_storeStrong((id *)&v22->_userInfo, v39);
      objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
      v23 = objc_claimAutoreleasedReturnValue();
      observers = v22->_observers;
      v22->_observers = (NSHashTable *)v23;

      v25 = objc_alloc_init(FCThreadSafeMutableDictionary);
      subscribedTagsByTagID = v22->_subscribedTagsByTagID;
      v22->_subscribedTagsByTagID = v25;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addObserver:selector:name:object:", v22, sel__purchaseListDidAddTagIDs_, FCPurchaseAddedNotificationName, 0);
      objc_msgSend(v27, "addObserver:selector:name:object:", v22, sel__purchaseListDidRemoveTagIDs_, FCPurchaseRemovedNotificationName, 0);
      objc_msgSend(v20, "addObserver:", v22);
      -[FCSubscriptionController _fetchMissingTagsWithCompletion:]((uint64_t)v22, 0);
    }
    else
    {
      v27 = v21;
      v22 = 0;
    }

  }
  return v22;
}

- (id)orderedCachedSubscribedTags
{
  FCSubscriptionController *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  if (self)
    self = (FCSubscriptionController *)self->_subscribedTagsByTagID;
  -[FCSubscriptionController readOnlyDictionary](self, "readOnlyDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCSubscriptionController orderedSubscribedTagIDs]((uint64_t)v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nf_objectsForKeysWithoutMarker:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)orderedSubscribedTagIDs
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 16), "orderedSubscribedTagIDs");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v4)
  {
    if (self)
      observers = self->_observers;
    else
      observers = 0;
    if (-[NSHashTable containsObject:](observers, "containsObject:", v4)
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%p is already an observer"), v4);
      *(_DWORD *)buf = 136315906;
      v10 = "-[FCSubscriptionController addObserver:]";
      v11 = 2080;
      v12 = "FCSubscriptionController.m";
      v13 = 1024;
      v14 = 141;
      v15 = 2114;
      v16 = v8;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      if (self)
        goto LABEL_7;
    }
    else if (self)
    {
LABEL_7:
      v6 = self->_observers;
LABEL_8:
      -[NSHashTable addObject:](v6, "addObject:", v4);
      goto LABEL_11;
    }
    v6 = 0;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "observer != nil");
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCSubscriptionController addObserver:]";
    v11 = 2080;
    v12 = "FCSubscriptionController.m";
    v13 = 1024;
    v14 = 137;
    v15 = 2114;
    v16 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_11:

}

- (id)newlySubscribedTagIDsInDateRange:(id)a3
{
  id v4;
  void *v5;
  FCSubscriptionList *subscriptionList;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    subscriptionList = self->_subscriptionList;
  else
    subscriptionList = 0;
  -[FCSubscriptionList subscriptionsBySubscriptionID](subscriptionList, "subscriptionsBySubscriptionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_394);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filteredArrayUsingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    v23 = v10;
    objc_msgSend(v10, "sortedArrayUsingComparator:", &__block_literal_global_396);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v16, "tagID");
          v17 = objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v18 = (void *)v17;
            objc_msgSend(v16, "dateAdded");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v4, "containsDate:", v19);

            if (v20)
            {
              objc_msgSend(v16, "tagID");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v21);

            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v13);
    }

    v10 = v23;
  }

  return v5;
}

- (id)subscribedTagIDsWithNotificationsEnabled
{
  void *v2;
  void *v3;
  void *v4;

  if (self)
    self = (FCSubscriptionController *)self->_subscriptionList;
  -[FCSubscriptionController subscriptionsBySubscriptionID](self, "subscriptionsBySubscriptionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "fc_arrayByTransformingWithBlock:", &__block_literal_global_41);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)subscriptions
{
  void *v2;
  void *v3;

  if (self)
    self = (FCSubscriptionController *)self->_subscriptionList;
  -[FCSubscriptionController subscriptionsBySubscriptionID](self, "subscriptionsBySubscriptionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ignoredTagIDs
{
  void *v2;
  void *v3;

  if (self)
    self = (FCSubscriptionController *)self->_subscriptionList;
  -[FCSubscriptionController ignoredTagIDs](self, "ignoredTagIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)autoFavoriteTagIDs
{
  void *v3;
  FCNewsAppConfigurationManager *appConfigurationManager;
  FCNewsAppConfigurationManager *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  FCSubscriptionList *subscriptionList;
  FCSubscriptionList *v17;
  void *v18;
  _QWORD v20[4];
  id v21;

  v3 = (void *)MEMORY[0x1E0C99E60];
  if (self)
    appConfigurationManager = self->_appConfigurationManager;
  else
    appConfigurationManager = 0;
  v5 = appConfigurationManager;
  -[FCNewsAppConfigurationManager possiblyUnfetchedAppConfiguration](v5, "possiblyUnfetchedAppConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deprecatedSportsTopicTagIds");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = v7;
  else
    v9 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v3, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self)
  {
    subscriptionList = 0;
    goto LABEL_10;
  }
  NewsCoreUserDefaults();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringForKey:", CFSTR("news.demo.autofavorite_channels"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "componentsSeparatedByString:", CFSTR(","));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    subscriptionList = self->_subscriptionList;
LABEL_10:
    v17 = subscriptionList;
    -[FCSubscriptionList autoFavoriteTagIDs](v17, "autoFavoriteTagIDs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __46__FCSubscriptionController_autoFavoriteTagIDs__block_invoke;
    v20[3] = &unk_1E463C7A0;
    v21 = v10;
    objc_msgSend(v18, "fc_arrayOfObjectsPassingTest:", v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    goto LABEL_11;
  }
  v14 = v13;
  v15 = v14;
LABEL_11:

  return v15;
}

- (id)portraitExcludedAutoFavoriteTagIDs
{
  void *v2;
  void *v3;
  void *v4;

  -[FCSubscriptionController subscriptionsWithType:](self, "subscriptionsWithType:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fc_setByTransformingWithBlock:", &__block_literal_global_416);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)subscriptionsWithType:(unint64_t)a3
{
  FCSubscriptionList *subscriptionList;
  FCSubscriptionList *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];

  if (self)
    subscriptionList = self->_subscriptionList;
  else
    subscriptionList = 0;
  v6 = subscriptionList;
  -[FCSubscriptionList subscriptionsForType:](v6, "subscriptionsForType:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__FCSubscriptionController_subscriptionsWithType___block_invoke;
  v11[3] = &unk_1E463FCF8;
  v11[4] = self;
  v11[5] = a3;
  objc_msgSend(v7, "fc_setByTransformingWithBlock:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)subscribedTagIDs
{
  void *v2;
  void *v3;

  if (self)
    self = (FCSubscriptionController *)self->_subscriptionList;
  -[FCSubscriptionController subscribedTagIDs](self, "subscribedTagIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)groupableTagIDs
{
  void *v2;
  void *v3;

  if (self)
    self = (FCSubscriptionController *)self->_subscriptionList;
  -[FCSubscriptionController groupableTagIDs](self, "groupableTagIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (FCSubscriptionController)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCSubscriptionController init]";
    v9 = 2080;
    v10 = "FCSubscriptionController.m";
    v11 = 1024;
    v12 = 77;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCSubscriptionController init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  void *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v4)
  {
    if (self)
      observers = self->_observers;
    else
      observers = 0;
    -[NSHashTable removeObject:](observers, "removeObject:", v4);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "observer != nil");
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCSubscriptionController removeObserver:]";
    v9 = 2080;
    v10 = "FCSubscriptionController.m";
    v11 = 1024;
    v12 = 149;
    v13 = 2114;
    v14 = v6;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
}

- (id)subscribedTagForTagID:(id)a3
{
  if (self)
    self = (FCSubscriptionController *)self->_subscribedTagsByTagID;
  return (id)-[FCSubscriptionController objectForKey:](self, "objectForKey:", a3);
}

- (void)subscriptionsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  FCSubscriptionList *subscriptionList;
  FCSubscriptionList *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v4 = a3;
  -[FCSubscriptionController subscriptions](self, "subscriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  if (self)
    subscriptionList = self->_subscriptionList;
  else
    subscriptionList = 0;
  v7 = subscriptionList;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__FCSubscriptionController_subscriptionsWithCompletion___block_invoke;
  v10[3] = &unk_1E463FCB0;
  objc_copyWeak(&v13, &location);
  v8 = v4;
  v12 = v8;
  v9 = v5;
  v11 = v9;
  -[FCPrivateDataController syncWithCompletion:](v7, "syncWithCompletion:", v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __56__FCSubscriptionController_subscriptionsWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 40);
  if (WeakRetained)
  {
    if (v3)
    {
      v5 = WeakRetained;
      objc_msgSend(WeakRetained, "subscriptions");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

LABEL_6:
      WeakRetained = v5;
    }
  }
  else if (v3)
  {
    v5 = 0;
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
    goto LABEL_6;
  }

}

- (id)allSubscribedTagIDs
{
  void *v2;
  void *v3;

  if (self)
    self = (FCSubscriptionController *)self->_subscriptionList;
  -[FCSubscriptionController allSubscribedTagIDs](self, "allSubscribedTagIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)permanentChannelIDs
{
  void *v2;
  void *v3;

  if (self)
    self = (FCSubscriptionController *)self->_configurationManager;
  -[FCSubscriptionController configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "permanentChannelIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)appleNewsNotificationChannelIDs
{
  void *v2;
  void *v3;

  if (self)
    self = (FCSubscriptionController *)self->_configurationManager;
  -[FCSubscriptionController configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appleNewsNotificationChannelIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isChannelPermanentForTagID:(id)a3
{
  id v4;
  void *v5;
  char v6;

  if (!a3)
    return 0;
  v4 = a3;
  -[FCSubscriptionController permanentChannelIDs](self, "permanentChannelIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (BOOL)isAppleNewsNotificationForTagID:(id)a3
{
  id v4;
  void *v5;
  char v6;

  if (!a3)
    return 0;
  v4 = a3;
  -[FCSubscriptionController appleNewsNotificationChannelIDs](self, "appleNewsNotificationChannelIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

uint64_t __46__FCSubscriptionController_autoFavoriteTagIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (id)tagIDsWithType:(unint64_t)a3
{
  void *v3;
  void *v4;

  if (self)
    self = (FCSubscriptionController *)self->_subscriptionList;
  -[FCSubscriptionController subscriptionsForType:](self, "subscriptionsForType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)canAddSubscription
{
  FCSubscriptionList *subscriptionList;

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (self)
    subscriptionList = self->_subscriptionList;
  else
    subscriptionList = 0;
  return -[FCSubscriptionList canAddSubscription](subscriptionList, "canAddSubscription");
}

- (BOOL)canAddSubscriptionWithError:(id *)a3
{
  BOOL v5;
  BOOL v6;

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v5 = -[FCSubscriptionController canAddSubscription](self, "canAddSubscription");
  v6 = v5;
  if (a3 && !v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FCSubscriptionControllerErrorDomain"), 1, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (BOOL)hasSubscriptionToTag:(id)a3
{
  id v4;
  FCThreadSafeMutableDictionary *subscribedTagsByTagID;
  FCThreadSafeMutableDictionary *v6;
  void *v7;
  void *v8;
  void *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tag != nil");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCSubscriptionController hasSubscriptionToTag:]";
    v13 = 2080;
    v14 = "FCSubscriptionController.m";
    v15 = 1024;
    v16 = 321;
    v17 = 2114;
    v18 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (self)
      goto LABEL_4;
LABEL_7:
    subscribedTagsByTagID = 0;
    goto LABEL_5;
  }
  if (!self)
    goto LABEL_7;
LABEL_4:
  subscribedTagsByTagID = self->_subscribedTagsByTagID;
LABEL_5:
  v6 = subscribedTagsByTagID;
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCThreadSafeMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8 != 0;
}

- (BOOL)hasSubscriptionToTagID:(id)a3
{
  id v4;
  FCThreadSafeMutableDictionary *subscribedTagsByTagID;
  void *v6;
  BOOL v7;
  void *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagID != nil");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCSubscriptionController hasSubscriptionToTagID:]";
    v12 = 2080;
    v13 = "FCSubscriptionController.m";
    v14 = 1024;
    v15 = 327;
    v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (self)
      goto LABEL_4;
LABEL_7:
    subscribedTagsByTagID = 0;
    goto LABEL_5;
  }
  if (!self)
    goto LABEL_7;
LABEL_4:
  subscribedTagsByTagID = self->_subscribedTagsByTagID;
LABEL_5:
  -[FCThreadSafeMutableDictionary objectForKeyedSubscript:](subscribedTagsByTagID, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (id)subscriptionForTag:(id)a3
{
  id v4;
  FCSubscriptionList *subscriptionList;
  FCSubscriptionList *v6;
  void *v7;
  void *v8;
  void *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tag != nil");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCSubscriptionController subscriptionForTag:]";
    v13 = 2080;
    v14 = "FCSubscriptionController.m";
    v15 = 1024;
    v16 = 333;
    v17 = 2114;
    v18 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (self)
      goto LABEL_4;
LABEL_7:
    subscriptionList = 0;
    goto LABEL_5;
  }
  if (!self)
    goto LABEL_7;
LABEL_4:
  subscriptionList = self->_subscriptionList;
LABEL_5:
  v6 = subscriptionList;
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCSubscriptionList subscriptionForTagID:](v6, "subscriptionForTagID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)subscriptionForTagID:(id)a3
{
  id v4;
  FCSubscriptionList *subscriptionList;
  void *v6;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagID != nil");
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCSubscriptionController subscriptionForTagID:]";
    v11 = 2080;
    v12 = "FCSubscriptionController.m";
    v13 = 1024;
    v14 = 345;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (self)
      goto LABEL_4;
LABEL_7:
    subscriptionList = 0;
    goto LABEL_5;
  }
  if (!self)
    goto LABEL_7;
LABEL_4:
  subscriptionList = self->_subscriptionList;
LABEL_5:
  -[FCSubscriptionList subscriptionForTagIDOfAnyType:](subscriptionList, "subscriptionForTagIDOfAnyType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)addSubscriptionToTag:(id)a3 error:(id *)a4
{
  return -[FCSubscriptionController addSubscriptionToTag:notificationsEnabled:error:](self, "addSubscriptionToTag:notificationsEnabled:error:", a3, 0, a4);
}

- (BOOL)addSubscriptionToTag:(id)a3 notificationsEnabled:(BOOL)a4 error:(id *)a5
{
  return -[FCSubscriptionController addSubscriptionToTag:options:error:](self, "addSubscriptionToTag:options:error:", a3, a4, a5);
}

- (BOOL)addSubscriptionToTag:(id)a3 options:(int64_t)a4 error:(id *)a5
{
  char v6;
  id v8;
  FCSubscriptionList *subscriptionList;
  FCSubscriptionList *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  BOOL v15;
  BOOL v16;
  void *v17;
  FCPurchaseProviderType *purchaseProvider;
  FCPurchaseProviderType *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  FCNotificationController *notificationController;
  FCNotificationController *v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v6 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tag != nil");
    *(_DWORD *)buf = 136315906;
    v32 = "-[FCSubscriptionController addSubscriptionToTag:options:error:]";
    v33 = 2080;
    v34 = "FCSubscriptionController.m";
    v35 = 1024;
    v36 = 370;
    v37 = 2114;
    v38 = v29;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (self)
      goto LABEL_4;
  }
  else if (self)
  {
LABEL_4:
    subscriptionList = self->_subscriptionList;
    goto LABEL_5;
  }
  subscriptionList = 0;
LABEL_5:
  v10 = subscriptionList;
  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[FCSubscriptionList hasMutedSubscriptionForTagID:](v10, "hasMutedSubscriptionForTagID:", v11);

  if (v12)
  {
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCSubscriptionController removeSubscriptionForTagID:type:](self, "removeSubscriptionForTagID:type:", v13, 2);

  }
  if (!-[FCSubscriptionList canAddSubscription](v10, "canAddSubscription")
    || (objc_msgSend(v8, "identifier"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = -[FCSubscriptionList addSubscriptionForTagID:type:origin:groupID:notificationsEnabled:](v10, "addSubscriptionForTagID:type:origin:groupID:notificationsEnabled:", v14, 0, 0, 0, v6 & 1), v14, !v15))
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FCSubscriptionControllerErrorDomain"), 1, 0);
      v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  v30 = v8;
  v16 = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCSubscriptionController _integrateTags:]((uint64_t)self, v17);

  if ((v6 & 1) != 0)
  {
    if (self)
      purchaseProvider = self->_purchaseProvider;
    else
      purchaseProvider = 0;
    v19 = purchaseProvider;
    objc_msgSend(v8, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPurchaseProviderType purchasedTagIDs](v19, "purchasedTagIDs");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_msgSend(v21, "containsObject:", v20);
    if (self)
      notificationController = self->_notificationController;
    else
      notificationController = 0;
    v24 = notificationController;
    objc_msgSend(v8, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[FCNotificationController registerNotificationsForChannelID:isPaid:](v24, "registerNotificationsForChannelID:isPaid:", v25, v22);

    if (v26)
    {
      v16 = 1;
      goto LABEL_20;
    }
    objc_msgSend(v8, "identifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCSubscriptionList setNotificationsEnabled:forTagID:](v10, "setNotificationsEnabled:forTagID:", 0, v27);

LABEL_19:
    v16 = 0;
  }
LABEL_20:

  return v16;
}

- (void)_integrateTags:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v3 = a2;
  if (a1)
  {
    v9 = v3;
    objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    v4 = (void *)objc_opt_new();
    v5 = (void *)objc_opt_new();
    v6 = *(void **)(a1 + 40);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __43__FCSubscriptionController__integrateTags___block_invoke;
    v10[3] = &unk_1E4640090;
    v11 = v9;
    v7 = v5;
    v12 = v7;
    v8 = v4;
    v13 = v8;
    objc_msgSend(v6, "readWriteWithAccessor:", v10);
    if (objc_msgSend(v7, "count") || objc_msgSend(v8, "count"))
      -[FCSubscriptionController _notifyOfTagsAdded:tagsChanged:tagsMoved:tagsRemoved:subscriptionType:](a1, v7, v8, 0, 0, 0);

    v3 = v9;
  }

}

- (BOOL)appendSubscriptionToTag:(id)a3 notificationsEnabled:(BOOL)a4 error:(id *)a5
{
  id v7;
  FCSubscriptionList *subscriptionList;
  FCSubscriptionList *v9;
  void *v10;
  _BOOL4 v11;
  BOOL v12;
  void *v13;
  void *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tag != nil");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCSubscriptionController appendSubscriptionToTag:notificationsEnabled:error:]";
    v19 = 2080;
    v20 = "FCSubscriptionController.m";
    v21 = 1024;
    v22 = 428;
    v23 = 2114;
    v24 = v15;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (self)
      goto LABEL_4;
LABEL_13:
    subscriptionList = 0;
    goto LABEL_5;
  }
  if (!self)
    goto LABEL_13;
LABEL_4:
  subscriptionList = self->_subscriptionList;
LABEL_5:
  v9 = subscriptionList;
  if (-[FCSubscriptionList canAddSubscription](v9, "canAddSubscription")
    && (objc_msgSend(v7, "identifier"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = -[FCSubscriptionList appendSubscriptionForTagID:type:](v9, "appendSubscriptionForTagID:type:", v10, 0),
        v10,
        v11))
  {
    v16 = v7;
    v12 = 1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCSubscriptionController _integrateTags:]((uint64_t)self, v13);

  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FCSubscriptionControllerErrorDomain"), 1, 0);
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)removeSubscriptionToTag:(id)a3
{
  id v4;
  void *v5;
  FCSubscriptionList *subscriptionList;
  void *v7;
  int v8;
  FCThreadSafeMutableDictionary *subscribedTagsByTagID;
  void *v10;
  FCNotificationController *notificationController;
  void *v12;
  void *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tag != nil");
    *(_DWORD *)buf = 136315906;
    v15 = "-[FCSubscriptionController removeSubscriptionToTag:]";
    v16 = 2080;
    v17 = "FCSubscriptionController.m";
    v18 = 1024;
    v19 = 457;
    v20 = 2114;
    v21 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    subscriptionList = self->_subscriptionList;
  else
    subscriptionList = 0;
  -[FCSubscriptionList subscriptionForTagID:](subscriptionList, "subscriptionForTagID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "notificationsEnabled");
  if (self)
  {
    -[FCSubscriptionList removeSubscriptionForTagID:type:](self->_subscriptionList, "removeSubscriptionForTagID:type:", v5, 0);
    subscribedTagsByTagID = self->_subscribedTagsByTagID;
  }
  else
  {
    objc_msgSend(0, "removeSubscriptionForTagID:type:", v5, 0);
    subscribedTagsByTagID = 0;
  }
  -[FCThreadSafeMutableDictionary objectForKeyedSubscript:](subscribedTagsByTagID, "objectForKeyedSubscript:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("expected nil value for '%s'"), "self.subscribedTagsByTagID[identifier]");
    *(_DWORD *)buf = 136315906;
    v15 = "-[FCSubscriptionController removeSubscriptionToTag:]";
    v16 = 2080;
    v17 = "FCSubscriptionController.m";
    v18 = 1024;
    v19 = 465;
    v20 = 2114;
    v21 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v8)
      goto LABEL_14;
  }
  else if (!v8)
  {
    goto LABEL_14;
  }
  if (self)
    notificationController = self->_notificationController;
  else
    notificationController = 0;
  -[FCNotificationController unregisterNotificationsForChannelID:](notificationController, "unregisterNotificationsForChannelID:", v5);
LABEL_14:

}

- (void)removeSubscriptionForTagID:(id)a3 type:(unint64_t)a4
{
  void *v6;
  FCSubscriptionList *subscriptionList;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB3978];
  v8 = a3;
  objc_msgSend(v6, "isMainThread");
  if (self)
    subscriptionList = self->_subscriptionList;
  else
    subscriptionList = 0;
  -[FCSubscriptionList removeSubscriptionForTagID:type:](subscriptionList, "removeSubscriptionForTagID:type:", v8, a4);

}

- (BOOL)setNotificationsEnabled:(BOOL)a3 forTag:(id)a4 error:(id *)a5
{
  _BOOL8 v6;
  void *v8;

  v6 = a3;
  objc_msgSend(a4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[FCSubscriptionController setNotificationsEnabled:forTagID:error:](self, "setNotificationsEnabled:forTagID:error:", v6, v8, a5);

  return (char)a5;
}

- (BOOL)setNotificationsEnabled:(BOOL)a3 forTagID:(id)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  FCSubscriptionList *subscriptionList;
  _BOOL4 v10;
  _BOOL4 v11;
  FCPurchaseProviderType *purchaseProvider;
  id v13;
  void *v14;
  uint64_t v15;
  FCNotificationController *v16;
  BOOL v17;
  FCNotificationController *notificationController;
  FCSubscriptionList *v19;
  void *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v6 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagID != nil");
    *(_DWORD *)buf = 136315906;
    v23 = "-[FCSubscriptionController setNotificationsEnabled:forTagID:error:]";
    v24 = 2080;
    v25 = "FCSubscriptionController.m";
    v26 = 1024;
    v27 = 496;
    v28 = 2114;
    v29 = v21;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (self)
      goto LABEL_4;
LABEL_25:
    subscriptionList = 0;
    goto LABEL_5;
  }
  if (!self)
    goto LABEL_25;
LABEL_4:
  subscriptionList = self->_subscriptionList;
LABEL_5:
  v10 = -[FCSubscriptionList setNotificationsEnabled:forTagID:](subscriptionList, "setNotificationsEnabled:forTagID:", v6, v8);
  v11 = v10;
  if (a5 && !v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FCSubscriptionControllerErrorDomain"), 2, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!v11)
    goto LABEL_22;
  if (!v6)
  {
    if (self)
      notificationController = self->_notificationController;
    else
      notificationController = 0;
    if (-[FCNotificationController unregisterNotificationsForChannelID:](notificationController, "unregisterNotificationsForChannelID:", v8))
    {
      goto LABEL_15;
    }
    goto LABEL_19;
  }
  if (self)
    purchaseProvider = self->_purchaseProvider;
  else
    purchaseProvider = 0;
  v13 = v8;
  -[FCPurchaseProviderType purchasedTagIDs](purchaseProvider, "purchasedTagIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", v13);

  if (self)
    v16 = self->_notificationController;
  else
    v16 = 0;
  if (!-[FCNotificationController registerNotificationsForChannelID:isPaid:](v16, "registerNotificationsForChannelID:isPaid:", v13, v15))
  {
LABEL_19:
    if (self)
      v19 = self->_subscriptionList;
    else
      v19 = 0;
    -[FCSubscriptionList setNotificationsEnabled:forTagID:](v19, "setNotificationsEnabled:forTagID:", v6 ^ 1, v8);
LABEL_22:
    v17 = 0;
    goto LABEL_23;
  }
LABEL_15:
  v17 = 1;
LABEL_23:

  return v17;
}

- (BOOL)hasNotificationsEnabledForTag:(id)a3
{
  id v4;
  FCSubscriptionList *subscriptionList;
  FCSubscriptionList *v6;
  void *v7;
  BOOL v8;
  void *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tag != nil");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCSubscriptionController hasNotificationsEnabledForTag:]";
    v13 = 2080;
    v14 = "FCSubscriptionController.m";
    v15 = 1024;
    v16 = 537;
    v17 = 2114;
    v18 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (self)
      goto LABEL_4;
LABEL_7:
    subscriptionList = 0;
    goto LABEL_5;
  }
  if (!self)
    goto LABEL_7;
LABEL_4:
  subscriptionList = self->_subscriptionList;
LABEL_5:
  v6 = subscriptionList;
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FCSubscriptionList hasNotificationsEnabledForTagID:](v6, "hasNotificationsEnabledForTagID:", v7);

  return v8;
}

- (id)subscriptionSurfacingHeadline:(id)a3
{
  id v4;
  FCSubscriptionList *subscriptionList;
  FCSubscriptionList *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (self)
    subscriptionList = self->_subscriptionList;
  else
    subscriptionList = 0;
  v6 = subscriptionList;
  objc_msgSend(v4, "surfacedByChannelID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[FCSubscriptionList subscriptionForTagIDOfAnyType:](v6, "subscriptionForTagIDOfAnyType:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "surfacedByTopicID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCSubscriptionList subscriptionForTagIDOfAnyType:](v6, "subscriptionForTagIDOfAnyType:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)refreshAndNotifyAboutSubscribedTags
{
  uint64_t v3;
  void *v4;
  FCThreadSafeMutableDictionary *subscribedTagsByTagID;
  FCThreadSafeMutableDictionary *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  FCSubscriptionController *v38;
  id obj;
  uint64_t v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  FCSubscriptionController *v46;
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v42 = (void *)objc_opt_new();
  v3 = objc_opt_new();
  v4 = (void *)objc_opt_new();
  v38 = self;
  if (self)
    subscribedTagsByTagID = self->_subscribedTagsByTagID;
  else
    subscribedTagsByTagID = 0;
  v41 = (void *)v3;
  v6 = subscribedTagsByTagID;
  -[FCThreadSafeMutableDictionary readOnlyDictionary](v6, "readOnlyDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v37 = v7;
  objc_msgSend(v7, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v8)
  {
    v9 = v8;
    v40 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        v11 = v4;
        if (*(_QWORD *)v53 != v40)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "isNotificationEnabled");
        objc_msgSend(v12, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          v15 = v42;
        else
          v15 = v41;
        objc_msgSend(v15, "addObject:", v14);

        v16 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v12, "isNotificationEnabled");
        objc_msgSend(v12, "fetchDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lastModifiedDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "versionKey");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("tagID: %@ notifications: %d fetchedDate: %@ modifiedDate: %@ changeTag: %@"), v17, v18, v19, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v11;
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, v23);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    }
    while (v9);
  }

  -[FCSubscriptionController subscribedTagIDs](v38, "subscribedTagIDs");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __63__FCSubscriptionController_refreshAndNotifyAboutSubscribedTags__block_invoke;
  v50[3] = &unk_1E463C7A0;
  v26 = v37;
  v51 = v26;
  objc_msgSend(v24, "fc_arrayOfObjectsPassingTest:", v50);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCSubscriptionController autoFavoriteTagIDs](v38, "autoFavoriteTagIDs");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v25;
  v48[1] = 3221225472;
  v48[2] = __63__FCSubscriptionController_refreshAndNotifyAboutSubscribedTags__block_invoke_2;
  v48[3] = &unk_1E463C7A0;
  v29 = v26;
  v49 = v29;
  objc_msgSend(v28, "fc_arrayOfObjectsPassingTest:", v48);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D20], "fc_arrayByAddingObjectsFromArray:toArray:", v27, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
  {
    v33 = v32;
    v34 = objc_msgSend(v27, "count");
    v35 = objc_msgSend(v30, "count");
    *(_DWORD *)buf = 134218240;
    v57 = v34;
    v58 = 2048;
    v59 = v35;
    _os_log_impl(&dword_1A1B90000, v33, OS_LOG_TYPE_DEFAULT, "About to refresh %lu subscribedTagIDs and %lu autoFavoriteTagIDs", buf, 0x16u);

  }
  if (objc_msgSend(v31, "count"))
  {
    +[FCCachePolicy cachePolicyWithSoftMaxAge:](FCCachePolicy, "cachePolicyWithSoftMaxAge:", 60.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v25;
    v43[1] = 3221225472;
    v43[2] = __63__FCSubscriptionController_refreshAndNotifyAboutSubscribedTags__block_invoke_47;
    v43[3] = &unk_1E463FD20;
    v44 = v41;
    v45 = v4;
    v46 = v38;
    v47 = v42;
    -[FCSubscriptionController _fetchTagsForIDs:cachePolicy:qualityOfService:completion:]((uint64_t)v38, v31, v36, 9, v43);

  }
}

BOOL __63__FCSubscriptionController_refreshAndNotifyAboutSubscribedTags__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __63__FCSubscriptionController_refreshAndNotifyAboutSubscribedTags__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __63__FCSubscriptionController_refreshAndNotifyAboutSubscribedTags__block_invoke_47(_QWORD *a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  _QWORD *v30;
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  uint64_t m;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  unsigned int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  id *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  id v69;
  void *obj;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  uint8_t v94[128];
  _BYTE buf[24];
  void *v96;
  id v97;
  id v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = (void *)objc_opt_new();
  v4 = objc_opt_new();
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v75 = v2;
  objc_msgSend(v2, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v85;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v85 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "isNotificationEnabled");
        objc_msgSend(v10, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          v13 = v3;
        else
          v13 = (void *)v4;
        objc_msgSend(v13, "addObject:", v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
    }
    while (v7);
  }
  v67 = (void *)v4;

  objc_msgSend(v3, "intersectSet:", a1[4]);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v66 = v3;
  objc_msgSend(v3, "allObjects");
  obj = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
  if (v14)
  {
    v15 = v14;
    v73 = *(_QWORD *)v81;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v81 != v73)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * j);
        objc_msgSend(v75, "objectForKey:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "addObject:", v18);
        v19 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v18, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v18, "isNotificationEnabled");
        objc_msgSend(v18, "fetchDate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "lastModifiedDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "versionKey");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("tagID: %@ notifications: %d fetchedDate: %@ modifiedDate: %@ changeTag: %@"), v20, v21, v22, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = FCPushNotificationsLog;
        if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
        {
          v27 = (void *)a1[5];
          v28 = v26;
          objc_msgSend(v27, "objectForKeyedSubscript:", v17);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v29;
          _os_log_impl(&dword_1A1B90000, v28, OS_LOG_TYPE_DEFAULT, "Initial state %{public}@", buf, 0xCu);

          v26 = FCPushNotificationsLog;
        }
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v25;
          _os_log_impl(&dword_1A1B90000, v26, OS_LOG_TYPE_DEFAULT, "Latest state  %{public}@", buf, 0xCu);
        }

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
    }
    while (v15);
  }

  v30 = a1;
  if (objc_msgSend(v72, "count"))
  {
    v31 = a1[6];
    v32 = v72;
    if (v31)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
      v88 = 0u;
      v89 = 0u;
      v90 = 0u;
      v91 = 0u;
      v33 = (void *)objc_msgSend(*(id *)(v31 + 48), "copy");
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v88, buf, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v89;
        do
        {
          for (k = 0; k != v35; ++k)
          {
            if (*(_QWORD *)v89 != v36)
              objc_enumerationMutation(v33);
            v38 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * k);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v38, "subscriptionController:didFindTagsWithNotificationSupport:", v31, v32);
          }
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v88, buf, 16);
        }
        while (v35);
      }

    }
    v30 = a1;
  }
  objc_msgSend(v67, "intersectSet:", v30[7]);
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  objc_msgSend(v67, "allObjects");
  v69 = (id)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
  if (v74)
  {
    v71 = *(_QWORD *)v77;
    do
    {
      for (m = 0; m != v74; ++m)
      {
        if (*(_QWORD *)v77 != v71)
          objc_enumerationMutation(v69);
        v40 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * m);
        objc_msgSend(v75, "objectForKey:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v30[6], "setNotificationsEnabled:forTag:error:", 0, v41, 0);
        v42 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v41, "identifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v41, "isNotificationEnabled");
        objc_msgSend(v41, "fetchDate");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "lastModifiedDate");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "versionKey");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "stringWithFormat:", CFSTR("tagID: %@ notifications: %d fetchedDate: %@ modifiedDate: %@ changeTag: %@"), v43, v44, v45, v46, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        v49 = FCPushNotificationsLog;
        if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
        {
          v50 = (void *)v30[5];
          v51 = v49;
          objc_msgSend(v50, "objectForKeyedSubscript:", v40);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v52;
          _os_log_impl(&dword_1A1B90000, v51, OS_LOG_TYPE_DEFAULT, "Initial state %{public}@", buf, 0xCu);

          v49 = FCPushNotificationsLog;
        }
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v48;
          _os_log_impl(&dword_1A1B90000, v49, OS_LOG_TYPE_DEFAULT, "Latest state  %{public}@", buf, 0xCu);
        }

      }
      v74 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
    }
    while (v74);
  }

  v53 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
  {
    v54 = v53;
    v55 = objc_msgSend(v72, "count");
    v56 = objc_msgSend(v67, "count");
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v55;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v56;
    _os_log_impl(&dword_1A1B90000, v54, OS_LOG_TYPE_DEFAULT, "Found %lu tags with notifications enabled, %lu tags with notifications disabled", buf, 0x16u);

  }
  v57 = (id *)a1[6];
  objc_msgSend(v75, "allValues");
  v58 = (id)objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    v59 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v57, "localChannelsProvider");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "lastKnownChannelIDs");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setWithArray:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    v63 = (void *)MEMORY[0x1E0C99D20];
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __59__FCSubscriptionController__refreshSectionTagsWhereNeeded___block_invoke;
    v96 = &unk_1E463EFB0;
    v97 = v58;
    v98 = v62;
    v64 = v62;
    objc_msgSend(v63, "fc_array:", buf);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57[3], "fetchTagsForTagIDs:maximumCachedAge:qualityOfService:completionHandler:", v65, 9, 0, 60.0);

  }
}

void __59__FCSubscriptionController__refreshSectionTagsWhereNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        if (v9)
        {
          if (objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v8), "conformsToProtocol:", &unk_1EE68A2D8, (_QWORD)v15))v10 = v9;
          else
            v10 = 0;
        }
        else
        {
          v10 = 0;
        }
        v11 = v10;
        if ((objc_msgSend(v11, "isNewspaper") & 1) != 0
          || (objc_msgSend(v11, "isLocal") & 1) != 0
          || (v12 = *(void **)(a1 + 40),
              objc_msgSend(v11, "identifier"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              LODWORD(v12) = objc_msgSend(v12, "containsObject:", v13),
              v13,
              (_DWORD)v12))
        {
          objc_msgSend(v11, "sectionIDs", (_QWORD)v15);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v14);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

- (void)fetchAllTagsWithCallbackQueue:(id)a3 maximumCachedAge:(double)a4 qualityOfService:(int64_t)a5 completion:(id)a6
{
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  FCPuzzleTypeController *puzzleTypeController;
  FCPuzzleTypeController *v19;
  FCTagController *tagController;
  FCTagController *v21;
  NSObject *v22;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD v31[4];
  NSObject *v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD v35[4];
  NSObject *v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[5];
  id v44;
  _QWORD v45[5];
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  _QWORD v50[6];

  v24 = a3;
  v10 = a6;
  v11 = dispatch_group_create();
  v12 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __103__FCSubscriptionController_fetchAllTagsWithCallbackQueue_maximumCachedAge_qualityOfService_completion___block_invoke;
  v50[3] = &unk_1E463AA30;
  v50[4] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v50);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_new();
  v15 = (void *)objc_opt_new();
  v47[0] = v12;
  v47[1] = 3221225472;
  v47[2] = __103__FCSubscriptionController_fetchAllTagsWithCallbackQueue_maximumCachedAge_qualityOfService_completion___block_invoke_2;
  v47[3] = &unk_1E463FD48;
  v16 = v14;
  v48 = v16;
  v17 = v15;
  v49 = v17;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v47);
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__24;
  v45[4] = __Block_byref_object_dispose__24;
  v46 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__24;
  v43[4] = __Block_byref_object_dispose__24;
  v44 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__24;
  v41[4] = __Block_byref_object_dispose__24;
  v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__24;
  v39[4] = __Block_byref_object_dispose__24;
  v40 = 0;
  if (objc_msgSend(v16, "count"))
  {
    dispatch_group_enter(v11);
    if (self)
      puzzleTypeController = self->_puzzleTypeController;
    else
      puzzleTypeController = 0;
    v19 = puzzleTypeController;
    v35[0] = v12;
    v35[1] = 3221225472;
    v35[2] = __103__FCSubscriptionController_fetchAllTagsWithCallbackQueue_maximumCachedAge_qualityOfService_completion___block_invoke_384;
    v35[3] = &unk_1E463FD70;
    v37 = v45;
    v38 = v43;
    v36 = v11;
    -[FCPuzzleTypeController fetchPuzzleTypesForPuzzleTypeIDs:cachePolicy:qualityOfService:callbackQueue:completionHandler:](v19, "fetchPuzzleTypesForPuzzleTypeIDs:cachePolicy:qualityOfService:callbackQueue:completionHandler:", v16, 0, a5, v24, v35);

  }
  if (objc_msgSend(v17, "count"))
  {
    dispatch_group_enter(v11);
    if (self)
      tagController = self->_tagController;
    else
      tagController = 0;
    v21 = tagController;
    v31[0] = v12;
    v31[1] = 3221225472;
    v31[2] = __103__FCSubscriptionController_fetchAllTagsWithCallbackQueue_maximumCachedAge_qualityOfService_completion___block_invoke_386;
    v31[3] = &unk_1E463FD70;
    v33 = v41;
    v34 = v39;
    v32 = v11;
    -[FCTagController fetchTagsForTagIDs:maximumCachedAge:qualityOfService:completionHandler:](v21, "fetchTagsForTagIDs:maximumCachedAge:qualityOfService:completionHandler:", v17, a5, v31, a4);

  }
  FCDispatchQueueForQualityOfService(a5);
  v22 = objc_claimAutoreleasedReturnValue();
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __103__FCSubscriptionController_fetchAllTagsWithCallbackQueue_maximumCachedAge_qualityOfService_completion___block_invoke_2_387;
  block[3] = &unk_1E46400D8;
  v27 = v45;
  v28 = v41;
  block[4] = self;
  v26 = v10;
  v29 = v39;
  v30 = v43;
  v23 = v10;
  dispatch_group_notify(v11, v22, block);

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v45, 8);

}

void __103__FCSubscriptionController_fetchAllTagsWithCallbackQueue_maximumCachedAge_qualityOfService_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "subscribedTagIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObjectsFromArray:", v5);

  objc_msgSend(*(id *)(a1 + 32), "mutedTagIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObjectsFromArray:", v6);

  objc_msgSend(*(id *)(a1 + 32), "autoFavoriteTagIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObjectsFromArray:", v7);

  objc_msgSend(*(id *)(a1 + 32), "groupableTagIDs");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObjectsFromArray:", v8);

}

void __103__FCSubscriptionController_fetchAllTagsWithCallbackQueue_maximumCachedAge_qualityOfService_completion___block_invoke_2(uint64_t a1, void *a2)
{
  _BOOL4 v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  v3 = +[FCPuzzleType isPuzzleTypeIdentifier:](FCPuzzleType, "isPuzzleTypeIdentifier:", v5);
  v4 = 40;
  if (v3)
    v4 = 32;
  objc_msgSend(*(id *)(a1 + v4), "addObject:", v5);

}

void __103__FCSubscriptionController_fetchAllTagsWithCallbackQueue_maximumCachedAge_qualityOfService_completion___block_invoke_384(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = FCPuzzleLog;
    if (os_log_type_enabled((os_log_t)FCPuzzleLog, OS_LOG_TYPE_ERROR))
    {
      v14 = 138543362;
      v15 = v6;
      _os_log_error_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_ERROR, "failed to fetch some subscribed puzzle types with error: %{public}@", (uint8_t *)&v14, 0xCu);
    }
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v6;
  v13 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __103__FCSubscriptionController_fetchAllTagsWithCallbackQueue_maximumCachedAge_qualityOfService_completion___block_invoke_386(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __103__FCSubscriptionController_fetchAllTagsWithCallbackQueue_maximumCachedAge_qualityOfService_completion___block_invoke_2_387(uint64_t a1)
{
  void *v2;
  FCSubscribedTags *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  FCSubscribedTags *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  __int128 v15;

  if (*(_QWORD *)(a1 + 40))
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __103__FCSubscriptionController_fetchAllTagsWithCallbackQueue_maximumCachedAge_qualityOfService_completion___block_invoke_3;
    v14[3] = &unk_1E463FD98;
    v15 = *(_OWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D80], "fc_dictionary:", v14);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = [FCSubscribedTags alloc];
    -[FCSubscriptionController orderedSubscribedTagIDs](*(_QWORD *)(a1 + 32));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "nf_objectsForKeysWithoutMarker:", v13);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "mutedTagIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "nf_objectsForKeysWithoutMarker:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "autoFavoriteTagIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "nf_objectsForKeysWithoutMarker:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "groupableTagIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "nf_objectsForKeysWithoutMarker:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[FCSubscribedTags initWithSubscribedTags:mutedTags:autoFavoriteTags:groupableTags:](v3, "initWithSubscribedTags:mutedTags:autoFavoriteTags:groupableTags:", v4, v6, v8, v10);

    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    if (!v12)
      v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    (*(void (**)(_QWORD, FCSubscribedTags *, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v11, v12);

  }
}

void __103__FCSubscriptionController_fetchAllTagsWithCallbackQueue_maximumCachedAge_qualityOfService_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4 = a2;
  objc_msgSend(v4, "addEntriesFromDictionary:", v3);
  objc_msgSend(v4, "addEntriesFromDictionary:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

- (void)prewarmFromCacheWithCallbackQueue:(id)a3 completion:(id)a4
{
  NSObject *v6;
  id v7;
  void *v8;
  id *v9;
  FCSubscriptionList *subscriptionList;
  FCSubscriptionList *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  _QWORD block[4];
  id v20;

  v6 = a3;
  v7 = a4;
  -[FCSubscriptionController cachedSubscribedTags](self, "cachedSubscribedTags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "count"))
  {
    if (self)
      subscriptionList = self->_subscriptionList;
    else
      subscriptionList = 0;
    v11 = subscriptionList;
    -[FCSubscriptionList subscribedTagIDs](v11, "subscribedTagIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCCachePolicy cachedOnlyCachePolicy](FCCachePolicy, "cachedOnlyCachePolicy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __73__FCSubscriptionController_prewarmFromCacheWithCallbackQueue_completion___block_invoke_2;
    v16[3] = &unk_1E463FDC0;
    v9 = &v18;
    v18 = v7;
    v15 = v6;

    v17 = v15;
    -[FCSubscriptionController _fetchTagsForIDs:cachePolicy:qualityOfService:completion:]((uint64_t)self, v13, v14, 25, v16);

    goto LABEL_7;
  }
  if (v7)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__FCSubscriptionController_prewarmFromCacheWithCallbackQueue_completion___block_invoke;
    block[3] = &unk_1E463B598;
    v9 = &v20;
    v20 = v7;
    dispatch_async(v6, block);
LABEL_7:

  }
}

uint64_t __73__FCSubscriptionController_prewarmFromCacheWithCallbackQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__FCSubscriptionController_prewarmFromCacheWithCallbackQueue_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v2 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__FCSubscriptionController_prewarmFromCacheWithCallbackQueue_completion___block_invoke_3;
    block[3] = &unk_1E463B598;
    v4 = v1;
    dispatch_async(v2, block);

  }
}

uint64_t __73__FCSubscriptionController_prewarmFromCacheWithCallbackQueue_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __88__FCSubscriptionController_fetchSubscribedTagsWithCallbackQueue_preferCache_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __61__FCSubscriptionController_newlySubscribedTagIDsInDateRange___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "dateAdded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateAdded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (BOOL)moveSubscriptionForTagID:(id)a3 beforeTagID:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  FCSubscriptionList *subscriptionList;
  FCSubscriptionList *v10;
  void *v11;
  uint64_t v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v8 = 0;
  if (v6 && v7)
  {
    if (self)
      subscriptionList = self->_subscriptionList;
    else
      subscriptionList = 0;
    v10 = subscriptionList;
    -[FCSubscriptionList orderedSubscribedTagIDs](v10, "orderedSubscribedTagIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "indexOfObject:", v7);

    v8 = v12 != 0x7FFFFFFFFFFFFFFFLL
      && -[FCSubscriptionList moveSubscriptionForTagID:toIndex:](v10, "moveSubscriptionForTagID:toIndex:", v6, v12);

  }
  return v8;
}

- (void)reorderSubscriptionOrderForOrderedIdentifiers:(id)a3
{
  void *v4;
  FCSubscriptionList *subscriptionList;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB3978];
  v6 = a3;
  objc_msgSend(v4, "isMainThread");
  if (self)
    subscriptionList = self->_subscriptionList;
  else
    subscriptionList = 0;
  -[FCSubscriptionList reorderSubscriptionOrderForOrderedIdentifiers:](subscriptionList, "reorderSubscriptionOrderForOrderedIdentifiers:", v6);

}

- (BOOL)hasAutoFavoriteSubscriptionForTagID:(id)a3
{
  if (self)
    self = (FCSubscriptionController *)self->_subscriptionList;
  return -[FCSubscriptionController hasAutoFavoriteSubscriptionForTagID:](self, "hasAutoFavoriteSubscriptionForTagID:", a3);
}

- (BOOL)hasMutedSubscriptionForTagID:(id)a3
{
  if (self)
    self = (FCSubscriptionController *)self->_subscriptionList;
  return -[FCSubscriptionController hasMutedSubscriptionForTagID:](self, "hasMutedSubscriptionForTagID:", a3);
}

- (BOOL)addMutedSubscriptionForTagID:(id)a3
{
  return -[FCSubscriptionController addMutedSubscriptionForTagID:groupID:](self, "addMutedSubscriptionForTagID:groupID:", a3, CFSTR("tag"));
}

- (BOOL)addMutedSubscriptionForTagID:(id)a3 groupID:(id)a4
{
  id v6;
  id v7;
  FCSubscriptionList *subscriptionList;
  FCSubscriptionList *v9;
  FCTagController *tagController;
  void *v11;
  FCTagController *v12;
  id v13;
  FCSubscriptionList *v14;
  void *v15;
  BOOL v16;
  void *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self)
    subscriptionList = self->_subscriptionList;
  else
    subscriptionList = 0;
  v9 = subscriptionList;
  if (-[FCSubscriptionController hasSubscriptionToTagID:](self, "hasSubscriptionToTagID:", v6))
  {
    if (self)
      tagController = self->_tagController;
    else
      tagController = 0;
    -[FCTagController expectedFastCachedTagForID:](tagController, "expectedFastCachedTagForID:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCSubscriptionController removeSubscriptionToTag:](self, "removeSubscriptionToTag:", v11);

  }
  if (-[FCSubscriptionController hasAutoFavoriteSubscriptionForTagID:](self, "hasAutoFavoriteSubscriptionForTagID:", v6))
  {
    if (self)
      v12 = self->_tagController;
    else
      v12 = 0;
    -[FCTagController expectedFastCachedTagForID:](v12, "expectedFastCachedTagForID:", v6);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (self)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
      if (!v13 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tag != nil");
        *(_DWORD *)buf = 136315906;
        v20 = "-[FCSubscriptionController removeAutoFavoriteSubscriptionToTag:]";
        v21 = 2080;
        v22 = "FCSubscriptionController.m";
        v23 = 1024;
        v24 = 477;
        v25 = 2114;
        v26 = v18;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
      v14 = self->_subscriptionList;
      objc_msgSend(v13, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCSubscriptionList removeSubscriptionForTagID:type:](v14, "removeSubscriptionForTagID:type:", v15, 3);

    }
  }
  v16 = -[FCSubscriptionList addSubscriptionForTagID:type:origin:groupID:](v9, "addSubscriptionForTagID:type:origin:groupID:", v6, 2, 0, v7);

  return v16;
}

- (BOOL)hasIgnoredSubscriptionForTagID:(id)a3
{
  if (self)
    self = (FCSubscriptionController *)self->_subscriptionList;
  return -[FCSubscriptionController hasIgnoredSubscriptionForTagID:](self, "hasIgnoredSubscriptionForTagID:", a3);
}

- (BOOL)addIgnoredSubscriptionForTagID:(id)a3
{
  return -[FCSubscriptionController addIgnoredSubscriptionForTagID:groupID:](self, "addIgnoredSubscriptionForTagID:groupID:", a3, CFSTR("tag"));
}

- (BOOL)addIgnoredSubscriptionForTagID:(id)a3 groupID:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  FCTagController *tagController;
  void *v10;
  FCSubscriptionList *subscriptionList;

  v6 = a3;
  v7 = a4;
  if (-[FCSubscriptionController hasMutedSubscriptionForTagID:](self, "hasMutedSubscriptionForTagID:", v6))
  {
    v8 = 0;
  }
  else
  {
    if (-[FCSubscriptionController hasSubscriptionToTagID:](self, "hasSubscriptionToTagID:", v6))
    {
      if (self)
        tagController = self->_tagController;
      else
        tagController = 0;
      -[FCTagController expectedFastCachedTagForID:](tagController, "expectedFastCachedTagForID:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCSubscriptionController removeSubscriptionToTag:](self, "removeSubscriptionToTag:", v10);

    }
    if (self)
      subscriptionList = self->_subscriptionList;
    else
      subscriptionList = 0;
    v8 = -[FCSubscriptionList addSubscriptionForTagID:type:origin:groupID:](subscriptionList, "addSubscriptionForTagID:type:origin:groupID:", v6, 5, 0, v7);
  }

  return v8;
}

- (BOOL)removeIgnoredSubscriptionForTagID:(id)a3
{
  return -[FCSubscriptionController removeIgnoredSubscriptionForTagID:groupID:](self, "removeIgnoredSubscriptionForTagID:groupID:", a3, CFSTR("tag"));
}

- (BOOL)removeIgnoredSubscriptionForTagID:(id)a3 groupID:(id)a4
{
  id v5;
  _BOOL4 v6;
  FCSubscriptionList *subscriptionList;

  v5 = a3;
  v6 = -[FCSubscriptionController hasIgnoredSubscriptionForTagID:](self, "hasIgnoredSubscriptionForTagID:", v5);
  if (v6)
  {
    if (self)
      subscriptionList = self->_subscriptionList;
    else
      subscriptionList = 0;
    -[FCSubscriptionList removeSubscriptionForTagID:type:](subscriptionList, "removeSubscriptionForTagID:type:", v5, 5);
  }

  return v6;
}

- (void)removeAllAutoFavoriteSubscriptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  FCSubscriptionList *subscriptionList;
  FCSubscriptionList *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  -[FCSubscriptionController autoFavoriteTagIDs](self, "autoFavoriteTagIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  v11 = (void *)MEMORY[0x1E0C99E60];
  -[FCSubscriptionController groupableTagIDs](self, "groupableTagIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  if (self)
    subscriptionList = self->_subscriptionList;
  else
    subscriptionList = 0;
  v18 = subscriptionList;
  objc_msgSend(v10, "setByAddingObjectsFromSet:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v4;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __63__FCSubscriptionController_removeAllAutoFavoriteSubscriptions___block_invoke;
  v24[3] = &unk_1E463FE68;
  v25 = v10;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __63__FCSubscriptionController_removeAllAutoFavoriteSubscriptions___block_invoke_2;
  v22[3] = &unk_1E463FE90;
  v20 = v4;
  v21 = v10;
  -[FCSubscriptionList removeSubscriptionsForTagIDs:typeProvider:completion:](v18, "removeSubscriptionsForTagIDs:typeProvider:completion:", v19, v24, v22);

}

uint64_t __63__FCSubscriptionController_removeAllAutoFavoriteSubscriptions___block_invoke(uint64_t a1, uint64_t a2)
{
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2))
    return 3;
  else
    return 4;
}

uint64_t __63__FCSubscriptionController_removeAllAutoFavoriteSubscriptions___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)addAutoFavoriteSubscriptionForTagIDs:(id)a3 groupableSubscriptionForTagIDs:(id)a4 originProvider:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  FCSubscriptionList *subscriptionList;
  uint64_t v28;
  FCSubscriptionList *v29;
  FCSubscriptionList *v30;
  uint64_t v31;
  void (**v32)(id, id, void *, void *);
  id v33;
  id *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  _QWORD block[4];
  id v42;
  id v43;
  id v44;
  id v45;
  void (**v46)(id, id, void *, void *);
  _QWORD v47[4];
  id v48;
  NSObject *v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  NSObject *v56;
  _QWORD v57[4];
  id v58;
  id v59;
  _QWORD v60[5];
  id v61;
  id v62;
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  uint8_t buf[4];
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v36 = a6;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v13 = (void *)objc_opt_new();
  v14 = (void *)MEMORY[0x1E0C99E60];
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke;
  v65[3] = &unk_1E463B8A8;
  v15 = v10;
  v66 = v15;
  v16 = v11;
  v67 = v16;
  objc_msgSend(v14, "fc_set:", v65);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_2;
  v60[3] = &unk_1E463FEB8;
  v60[4] = self;
  v17 = v13;
  v61 = v17;
  v38 = v16;
  v62 = v38;
  v39 = v15;
  v63 = v39;
  v35 = v12;
  v64 = v35;
  objc_msgSend(v37, "fc_setByTransformingWithBlock:", v60);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCSubscriptionController subscriptionsWithType:](self, "subscriptionsWithType:", 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "fc_setByTransformingWithBlock:", &__block_literal_global_405);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCSubscriptionController subscriptionsWithType:](self, "subscriptionsWithType:", 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "fc_setByTransformingWithBlock:", &__block_literal_global_407);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v40, "fc_setByMinusingSet:", v39);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fc_setByMinusingSet:", v38);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setByAddingObjectsFromSet:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = FCProgressivePersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCProgressivePersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v69 = v18;
    _os_log_impl(&dword_1A1B90000, v25, OS_LOG_TYPE_DEBUG, "Subscribing to new tag IDs : %@", buf, 0xCu);
    v25 = FCProgressivePersonalizationLog;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v69 = v24;
    _os_log_impl(&dword_1A1B90000, v25, OS_LOG_TYPE_DEBUG, "Unsubscribing from existing tag IDs : %@", buf, 0xCu);
  }
  v26 = dispatch_group_create();
  if (objc_msgSend(v24, "count"))
  {
    dispatch_group_enter(v26);
    if (self)
      subscriptionList = self->_subscriptionList;
    else
      subscriptionList = 0;
    v28 = MEMORY[0x1E0C809B0];
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_408;
    v57[3] = &unk_1E463FF00;
    v58 = v40;
    v59 = v21;
    v54[0] = v28;
    v54[1] = 3221225472;
    v54[2] = __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_411;
    v54[3] = &unk_1E463FF28;
    v55 = v17;
    v56 = v26;
    -[FCSubscriptionList removeSubscriptionsForTagIDs:typeProvider:completion:](subscriptionList, "removeSubscriptionsForTagIDs:typeProvider:completion:", v24, v57, v54);

  }
  if (objc_msgSend(v18, "count"))
  {
    dispatch_group_enter(v26);
    objc_initWeak((id *)buf, self);
    if (self)
      v29 = self->_subscriptionList;
    else
      v29 = 0;
    v30 = v29;
    v31 = MEMORY[0x1E0C809B0];
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_2_412;
    v51[3] = &unk_1E463FF00;
    v52 = v39;
    v53 = v38;
    v47[0] = v31;
    v47[1] = 3221225472;
    v47[2] = __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_413;
    v47[3] = &unk_1E463FF78;
    objc_copyWeak(&v50, (id *)buf);
    v48 = v17;
    v49 = v26;
    -[FCSubscriptionList addSubscriptionsForTagIDs:typeProvider:originProvider:completion:](v30, "addSubscriptionsForTagIDs:typeProvider:originProvider:completion:", v18, v51, v35, v47);

    objc_destroyWeak(&v50);
    objc_destroyWeak((id *)buf);
  }
  if (FCDispatchGroupIsEmpty(v26))
  {
    v32 = (void (**)(id, id, void *, void *))v36;
    v46 = v32;
    v33 = v17;
    if (v32)
      v32[2](v32, v33, v18, v24);
    v34 = (id *)&v46;
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_4;
    block[3] = &unk_1E463DCB0;
    v45 = v36;
    v42 = v17;
    v43 = v18;
    v44 = v24;
    dispatch_group_notify(v26, MEMORY[0x1E0C80D38], block);

    v34 = &v45;
    v33 = v42;
  }

}

void __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "fc_safelyUnionSet:", v3);
  objc_msgSend(v4, "fc_safelyUnionSet:", *(_QWORD *)(a1 + 40));

}

id __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "subscriptionForTagID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mutedTagIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v3);

  if (!v6)
  {
    if (v4)
    {
      if (objc_msgSend(v4, "subscriptionType") != 3
        || objc_msgSend(v4, "subscriptionType") == 4 && (objc_msgSend(*(id *)(a1 + 48), "containsObject:", v3) & 1) != 0)
      {
        goto LABEL_10;
      }
      if (objc_msgSend(v4, "subscriptionType") == 3
        && objc_msgSend(*(id *)(a1 + 56), "containsObject:", v3))
      {
        v7 = objc_msgSend(v4, "subscriptionOrigin");
        if (v7 == (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))())
          goto LABEL_10;
LABEL_16:
        v11 = *(void **)(a1 + 32);
        v12 = v3;
        v13 = 3;
        goto LABEL_17;
      }
    }
    if (objc_msgSend(*(id *)(a1 + 56), "containsObject:", v3))
    {
      objc_msgSend(*(id *)(a1 + 32), "groupableTagIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "containsObject:", v3);

      if (v10)
      {
        v11 = *(void **)(a1 + 32);
        v12 = v3;
        v13 = 4;
LABEL_17:
        objc_msgSend(v11, "removeSubscriptionForTagID:type:", v12, v13);
      }
    }
    else
    {
      if (!objc_msgSend(*(id *)(a1 + 48), "containsObject:", v3))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown tag ID %@, not present in autoFavoriteTagIDs or groupableFavoriteTagIDs"), v3);
          *(_DWORD *)buf = 136315906;
          v19 = "-[FCSubscriptionController addAutoFavoriteSubscriptionForTagIDs:groupableSubscriptionForTagIDs:originPro"
                "vider:completion:]_block_invoke_2";
          v20 = 2080;
          v21 = "FCSubscriptionController.m";
          v22 = 1024;
          v23 = 1054;
          v24 = 2114;
          v25 = v17;
          _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
        goto LABEL_20;
      }
      objc_msgSend(*(id *)(a1 + 32), "autoFavoriteTagIDs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "containsObject:", v3);

      if (v15)
        goto LABEL_16;
    }
LABEL_20:
    v8 = v3;
    goto LABEL_21;
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
LABEL_10:
  v8 = 0;
LABEL_21:

  return v8;
}

uint64_t __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_404(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tagID");
}

uint64_t __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_2_406(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tagID");
}

uint64_t __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_408(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) != 0)
  {
LABEL_6:
    v4 = 3;
    goto LABEL_7;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v3) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Didn't find tag ID in either existing auto favorites or groupable favorites"));
      v7 = 136315906;
      v8 = "-[FCSubscriptionController addAutoFavoriteSubscriptionForTagIDs:groupableSubscriptionForTagIDs:originProvider"
           ":completion:]_block_invoke";
      v9 = 2080;
      v10 = "FCSubscriptionController.m";
      v11 = 1024;
      v12 = 1090;
      v13 = 2114;
      v14 = v6;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v7, 0x26u);

    }
    goto LABEL_6;
  }
  v4 = 4;
LABEL_7:

  return v4;
}

void __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_411(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_2_412(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) != 0)
  {
LABEL_6:
    v4 = 3;
    goto LABEL_7;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v3) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown tag ID %@, not present in autoFavoriteTagIDs or groupableFavoriteTagIDs"), v3);
      *(_DWORD *)buf = 136315906;
      v8 = "-[FCSubscriptionController addAutoFavoriteSubscriptionForTagIDs:groupableSubscriptionForTagIDs:originProvider"
           ":completion:]_block_invoke_2";
      v9 = 2080;
      v10 = "FCSubscriptionController.m";
      v11 = 1024;
      v12 = 1116;
      v13 = 2114;
      v14 = v6;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    goto LABEL_6;
  }
  v4 = 4;
LABEL_7:

  return v4;
}

void __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_413(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_2_414;
  v6[3] = &unk_1E463FF50;
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  v5 = v3;
  FCPerformIfNonNil(WeakRetained, v6);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_2_414(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObjectsFromArray:", v2);

}

uint64_t __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_4(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5], a1[6]);
  return result;
}

- (void)subscriptionList:(id)a3 didAddSubscriptions:(id)a4 changeSubscriptions:(id)a5 moveSubscriptions:(id)a6 removeSubscriptions:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  FCThreadSafeMutableDictionary *v27;
  id v28;
  void *v29;
  void *v30;
  FCThreadSafeMutableDictionary *v31;
  id v32;
  void *v33;
  void *v34;
  FCTagController *v35;
  void *v36;
  FCThreadSafeMutableDictionary *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  FCThreadSafeMutableDictionary *v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  _QWORD v64[4];
  id v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  _QWORD v73[4];
  id v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;

  v11 = a6;
  v12 = a7;
  v13 = a5;
  objc_msgSend(a4, "fc_dictionaryOfSortedSetsWithKeyBlock:", &__block_literal_global_418);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fc_dictionaryOfSortedSetsWithKeyBlock:", &__block_literal_global_420);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "fc_dictionaryOfSortedSetsWithKeyBlock:", &__block_literal_global_421);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v11;
  objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1E470A760);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", &unk_1E470A760);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", &unk_1E470A760);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v18;
  v22 = v19;
  v44 = v17;
  v23 = v20;
  v24 = v23;
  if (self)
  {
    v76 = 0;
    v77 = &v76;
    v78 = 0x3032000000;
    v79 = __Block_byref_object_copy__24;
    v80 = __Block_byref_object_dispose__24;
    v81 = 0;
    if (objc_msgSend(v23, "count"))
    {
      objc_msgSend(v24, "allObjects");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "fc_arrayByTransformingWithBlock:", &__block_literal_global_442);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = self->_subscribedTagsByTagID;
      v73[0] = MEMORY[0x1E0C809B0];
      v73[1] = 3221225472;
      v73[2] = __127__FCSubscriptionController__handleTagSubscriptionsAdded_tagSubscriptionsChanged_tagSubscriptionsMoved_tagSubscriptionsRemoved___block_invoke_2;
      v73[3] = &unk_1E4640120;
      v75 = &v76;
      v28 = v26;
      v74 = v28;
      -[FCThreadSafeMutableDictionary readWriteWithAccessor:](v27, "readWriteWithAccessor:", v73);

    }
    v67 = 0;
    v68 = &v67;
    v69 = 0x3032000000;
    v70 = __Block_byref_object_copy__24;
    v71 = __Block_byref_object_dispose__24;
    v72 = 0;
    if (objc_msgSend(v22, "count"))
    {
      objc_msgSend(v22, "allObjects");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "fc_arrayByTransformingWithBlock:", &__block_literal_global_443);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = self->_subscribedTagsByTagID;
      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = __127__FCSubscriptionController__handleTagSubscriptionsAdded_tagSubscriptionsChanged_tagSubscriptionsMoved_tagSubscriptionsRemoved___block_invoke_4;
      v64[3] = &unk_1E4640120;
      v66 = &v67;
      v32 = v30;
      v65 = v32;
      -[FCThreadSafeMutableDictionary readWriteWithAccessor:](v31, "readWriteWithAccessor:", v64);

    }
    v58 = 0;
    v59 = &v58;
    v60 = 0x3032000000;
    v61 = __Block_byref_object_copy__24;
    v62 = __Block_byref_object_dispose__24;
    v63 = 0;
    if (objc_msgSend(v21, "count"))
    {
      objc_msgSend(v21, "allObjects");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "fc_arrayByTransformingWithBlock:", &__block_literal_global_444);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = self->_tagController;
      -[FCTagController fastCachedTagsForIDs:](v35, "fastCachedTagsForIDs:", v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = self->_subscribedTagsByTagID;
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __127__FCSubscriptionController__handleTagSubscriptionsAdded_tagSubscriptionsChanged_tagSubscriptionsMoved_tagSubscriptionsRemoved___block_invoke_6;
      v54[3] = &unk_1E46401B0;
      v57 = &v58;
      v38 = v34;
      v55 = v38;
      v39 = v36;
      v56 = v39;
      -[FCThreadSafeMutableDictionary readWriteWithAccessor:](v37, "readWriteWithAccessor:", v54);

    }
    v48 = 0;
    v49 = &v48;
    v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__24;
    v52 = __Block_byref_object_dispose__24;
    v53 = 0;
    if (objc_msgSend(v44, "count"))
    {
      objc_msgSend(v44, "allObjects");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "fc_arrayByTransformingWithBlock:", &__block_literal_global_446);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = self->_subscribedTagsByTagID;
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __127__FCSubscriptionController__handleTagSubscriptionsAdded_tagSubscriptionsChanged_tagSubscriptionsMoved_tagSubscriptionsRemoved___block_invoke_9;
      v45[3] = &unk_1E46401F8;
      v47 = &v48;
      v43 = v41;
      v46 = v43;
      -[FCThreadSafeMutableDictionary readWithAccessor:](v42, "readWithAccessor:", v45);

    }
    if (objc_msgSend((id)v59[5], "count")
      || objc_msgSend((id)v68[5], "count")
      || objc_msgSend((id)v49[5], "count")
      || objc_msgSend((id)v77[5], "count"))
    {
      -[FCSubscriptionController _notifyOfTagsAdded:tagsChanged:tagsMoved:tagsRemoved:subscriptionType:]((uint64_t)self, (void *)v59[5], (void *)v68[5], (void *)v49[5], (void *)v77[5], 0);
    }
    -[FCSubscriptionController _fetchMissingTagsWithCompletion:]((uint64_t)self, 0);
    _Block_object_dispose(&v48, 8);

    _Block_object_dispose(&v58, 8);
    _Block_object_dispose(&v67, 8);

    _Block_object_dispose(&v76, 8);
  }

  -[FCSubscriptionController _handleNonTagSubscriptionType:addedSubscriptionsByType:removedSubscriptionsByType:changedSubscriptionsByType:]((uint64_t)self, 2, v14, v16, v15);
  -[FCSubscriptionController _handleNonTagSubscriptionType:addedSubscriptionsByType:removedSubscriptionsByType:changedSubscriptionsByType:]((uint64_t)self, 3, v14, v16, v15);
  -[FCSubscriptionController _handleNonTagSubscriptionType:addedSubscriptionsByType:removedSubscriptionsByType:changedSubscriptionsByType:]((uint64_t)self, 4, v14, v16, v15);
  -[FCSubscriptionController _handleNonTagSubscriptionType:addedSubscriptionsByType:removedSubscriptionsByType:changedSubscriptionsByType:]((uint64_t)self, 5, v14, v16, v15);

}

uint64_t __123__FCSubscriptionController_subscriptionList_didAddSubscriptions_changeSubscriptions_moveSubscriptions_removeSubscriptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "subscriptionType"));
}

uint64_t __123__FCSubscriptionController_subscriptionList_didAddSubscriptions_changeSubscriptions_moveSubscriptions_removeSubscriptions___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "subscriptionType"));
}

uint64_t __123__FCSubscriptionController_subscriptionList_didAddSubscriptions_changeSubscriptions_moveSubscriptions_removeSubscriptions___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "subscriptionType"));
}

- (void)_handleNonTagSubscriptionType:(void *)a3 addedSubscriptionsByType:(void *)a4 removedSubscriptionsByType:(void *)a5 changedSubscriptionsByType:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v44 = a1;
  if (a1)
  {
    if (a2 == 3)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", &unk_1E470A778);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count") == 1)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", &unk_1E470A760);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (v14 == 1)
        {
          objc_opt_class();
          objc_msgSend(v10, "allValues");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "firstObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "anyObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v18 = v17;
            else
              v18 = 0;
          }
          else
          {
            v18 = 0;
          }
          v19 = v18;

          if (!v19 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "removedSubscription");
            *(_DWORD *)buf = 136315906;
            v54 = "-[FCSubscriptionController _handleNonTagSubscriptionType:addedSubscriptionsByType:removedSubscriptions"
                  "ByType:changedSubscriptionsByType:]";
            v55 = 2080;
            v56 = "FCSubscriptionController.m";
            v57 = 1024;
            v58 = 1728;
            v59 = 2114;
            v60 = v41;
            _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          }
          objc_opt_class();
          objc_msgSend(v9, "allValues");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "firstObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "anyObject");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v23 = v22;
            else
              v23 = 0;
          }
          else
          {
            v23 = 0;
          }
          v24 = v23;

          if (!v24 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "addedSubscription");
            *(_DWORD *)buf = 136315906;
            v54 = "-[FCSubscriptionController _handleNonTagSubscriptionType:addedSubscriptionsByType:removedSubscriptions"
                  "ByType:changedSubscriptionsByType:]";
            v55 = 2080;
            v56 = "FCSubscriptionController.m";
            v57 = 1024;
            v58 = 1730;
            v59 = 2114;
            v60 = v42;
            _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          }
        }
      }
      else
      {

      }
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v10;
    objc_msgSend(v10, "objectForKeyedSubscript:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v9;
    objc_msgSend(v9, "objectForKeyedSubscript:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v27, "count"))
    {
      objc_msgSend(v27, "fc_setByTransformingWithBlock:", &__block_literal_global_454);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "allObjects");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObjectsFromArray:", v33);

    }
    else
    {
      v32 = 0;
    }
    if (objc_msgSend(v29, "count"))
    {
      objc_msgSend(v29, "fc_setByTransformingWithBlock:", &__block_literal_global_455);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "allObjects");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObjectsFromArray:", v35);

    }
    else
    {
      v34 = 0;
    }
    if (objc_msgSend(v31, "count"))
    {
      objc_msgSend(v31, "fc_setByTransformingWithBlock:", &__block_literal_global_456);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "allObjects");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObjectsFromArray:", v37);

    }
    else
    {
      v36 = 0;
    }
    if (objc_msgSend(v25, "count"))
    {
      v38 = *(id *)(v44 + 24);
      objc_msgSend(v25, "allObjects");
      v43 = v31;
      v39 = v32;
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __137__FCSubscriptionController__handleNonTagSubscriptionType_addedSubscriptionsByType_removedSubscriptionsByType_changedSubscriptionsByType___block_invoke_4;
      v47[3] = &unk_1E4640288;
      v48 = v34;
      v49 = v36;
      v50 = v39;
      v51 = v44;
      v52 = a2;
      objc_msgSend(v38, "fetchTagsForTagIDs:maximumCachedAge:qualityOfService:completionHandler:", v40, 17, v47, 1.79769313e308);

      v32 = v39;
      v31 = v43;

    }
    v10 = v45;
    v9 = v46;
  }

}

- (void)subscriptionListDidResetToEmpty:(id)a3
{
  FCSubscriptionController *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = self;
  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  if (self)
    self = (FCSubscriptionController *)self->_observers;
  v4 = (void *)-[FCSubscriptionController copy](self, "copy", a3, (_QWORD)v10);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "subscriptionControllerDidResetToEmpty:", v3);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)subscriptionListWillStartSyncingRemoteChanges:(id)a3
{
  FCSubscriptionController *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = self;
  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  if (self)
    self = (FCSubscriptionController *)self->_observers;
  v4 = (void *)-[FCSubscriptionController copy](self, "copy", a3, (_QWORD)v10);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "subscriptionControllerWillStartSyncingRemoteChanges:", v3);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)subscriptionListDidStopSyncingRemoteChanges:(id)a3
{
  FCSubscriptionController *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = self;
  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  if (self)
    self = (FCSubscriptionController *)self->_observers;
  v4 = (void *)-[FCSubscriptionController copy](self, "copy", a3, (_QWORD)v10);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "subscriptionControllerDidStopSyncingRemoteChanges:", v3);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)activityObservingApplicationDidEnterBackground
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  FCSubscriptionList *v11;
  FCNotificationController *v12;
  NSObject *v13;
  uint64_t block;
  uint64_t v15;
  void *v16;
  void *v17;
  FCSubscriptionController *v18;
  id v19;
  id location;

  if (self)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("FCSubscriptionControllerNotificationChannelsLastUpdateDateKey"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "integerForKey:", CFSTR("notification_channels_refresh_frequency"));

      if (v7 == -1)
      {
        -[FCCoreConfigurationManager configuration](self->_configurationManager, "configuration");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v8, "notificationEnabledChannelsRefreshFrequency");

      }
      objc_msgSend(v4, "dateByAddingTimeInterval:", (double)v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v5, "fc_isLaterThan:", v9);

      if (v10)
      {
        objc_initWeak(&location, self);
        v11 = self->_subscriptionList;
        block = MEMORY[0x1E0C809B0];
        v15 = 3221225472;
        v16 = __61__FCSubscriptionController__refreshNotificationRegistrations__block_invoke;
        v17 = &unk_1E4640068;
        objc_copyWeak(&v19, &location);
        v18 = self;
        -[FCPrivateDataController forceSyncWithCompletion:](v11, "forceSyncWithCompletion:", &block);

        v12 = self->_notificationController;
        -[FCNotificationController refreshNotificationsFromAppleNews](v12, "refreshNotificationsFromAppleNews");

        objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("FCSubscriptionControllerNotificationChannelsLastUpdateDateKey"));
        objc_destroyWeak(&v19);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("FCSubscriptionControllerNotificationChannelsLastUpdateDateKey"));
    }

    if ((NFInternalBuild() & 1) != 0)
    {
      FCPersistenceQueue();
      v13 = objc_claimAutoreleasedReturnValue();
      block = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __54__FCSubscriptionController__saveReadableSubscriptions__block_invoke;
      v17 = &unk_1E463AB18;
      v18 = self;
      dispatch_async(v13, &block);

    }
  }
  else
  {
    NFInternalBuild();
  }
}

- (void)_purchaseListDidAddTagIDs:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = a3;
  objc_msgSend(v4, "isMainThread");
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", FCPurchaseAddedTagIDsKey);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[FCSubscriptionController _updateNotificationsForPurchaseTagIDs:isPaid:]((id *)&self->super.isa, v7, 1);
}

- (void)_updateNotificationsForPurchaseTagIDs:(uint64_t)a3 isPaid:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a1 && v5)
  {
    objc_msgSend(a1, "subscriptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (!v8)
      goto LABEL_15;
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "tagID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "containsObject:", v13) && !objc_msgSend(v12, "subscriptionType"))
        {
          v14 = objc_msgSend(v12, "notificationsEnabled");

          if (!v14)
            continue;
          v15 = a1[7];
          objc_msgSend(v12, "tagID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "registerNotificationsForChannelID:isPaid:", v13, a3);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (!v9)
      {
LABEL_15:

        break;
      }
    }
  }

}

- (void)_purchaseListDidRemoveTagIDs:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = a3;
  objc_msgSend(v4, "isMainThread");
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", FCPurchaseRemovedTagIDsKey);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[FCSubscriptionController _updateNotificationsForPurchaseTagIDs:isPaid:]((id *)&self->super.isa, v7, 0);
}

void __61__FCSubscriptionController__refreshNotificationRegistrations__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  _QWORD v5[6];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__FCSubscriptionController__refreshNotificationRegistrations__block_invoke_2;
  v5[3] = &unk_1E4640040;
  v5[4] = *(_QWORD *)(a1 + 32);
  v5[5] = a2;
  FCPerformIfNonNil(WeakRetained, v5);

}

void __61__FCSubscriptionController__refreshNotificationRegistrations__block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 40) != 2)
  {
    if (v3)
      v5 = (void *)v3[8];
    else
      v5 = 0;
    objc_msgSend(v5, "purchasedTagIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    objc_msgSend(v4, "subscriptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (!objc_msgSend(v16, "subscriptionType", (_QWORD)v28)
            && objc_msgSend(v16, "notificationsEnabled"))
          {
            objc_msgSend(v16, "tagID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v7, "containsObject:", v17))
              v18 = v10;
            else
              v18 = v9;
            objc_msgSend(v18, "addObject:", v17);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v13);
    }

    v19 = *(_QWORD *)(a1 + 32);
    v20 = v9;
    if (v19)
    {
      objc_msgSend(*(id *)(v19 + 72), "configuration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "puzzlesConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "puzzleHubTagID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v23, "length") && objc_msgSend(*(id *)(v19 + 88), "puzzleNotificationsEnabled"))
        objc_msgSend(v20, "addObject:", v23);

    }
    if (v4)
      v24 = (void *)v4[7];
    else
      v24 = 0;
    v25 = v24;
    objc_msgSend(v20, "allObjects");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "refreshNotificationsForChannelIDs:paidChannelIDs:", v26, v27);

  }
}

void __43__FCSubscriptionController__integrateTags___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  id *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id *v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = a1[4];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    v8 = a1 + 6;
    v9 = a1 + 5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "identifier", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        v15 = v9;
        if (!v13 || (v16 = objc_msgSend(v13, "isEqualToTag:", v11), v15 = v8, (v16 & 1) == 0))
          objc_msgSend(*v15, "addObject:", v11);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

}

- (void)_notifyOfTagsAdded:(void *)a3 tagsChanged:(void *)a4 tagsMoved:(void *)a5 tagsRemoved:(uint64_t)a6 subscriptionType:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v22;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v17);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v18, "subscriptionController:didAddTags:changeTags:moveTags:removeTags:subscriptionType:", a1, v20, v10, v11, v12, a6);
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v15);
    }

  }
}

void __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke(uint64_t a1, void *a2)
{
  _BOOL4 v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  v3 = +[FCPuzzleType isPuzzleTypeIdentifier:](FCPuzzleType, "isPuzzleTypeIdentifier:", v5);
  v4 = 40;
  if (v3)
    v4 = 32;
  objc_msgSend(*(id *)(a1 + v4), "addObject:", v5);

}

void __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke_4(uint64_t a1)
{
  id v1;
  __int128 v2;
  _QWORD v3[5];
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke_5;
  v3[3] = &unk_1E46400D8;
  v3[4] = *(_QWORD *)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 56);
  v2 = *(_OWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 72);
  v1 = (id)v2;
  v4 = v2;
  FCPerformBlockOnMainThread(v3);

}

void __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id obj;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  __int128 v66;
  _BYTE v67[128];
  uint8_t v68[128];
  uint8_t buf[4];
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (!v3)
      goto LABEL_6;
  }
  v4 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v70 = v3;
    _os_log_error_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_ERROR, "failed to fetch some tags for subscription IDs with error: %{public}@", buf, 0xCu);
  }
LABEL_6:
  v5 = *(_QWORD **)(a1 + 32);
  v53 = v3;
  if (v5)
    v5 = (_QWORD *)v5[2];
  v6 = v5;
  v7 = MEMORY[0x1E0C809B0];
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke_431;
  v65[3] = &unk_1E463FD98;
  v66 = *(_OWORD *)(a1 + 64);
  objc_msgSend(MEMORY[0x1E0C99D80], "fc_dictionary:", v65);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subscribedTagIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v8;
  objc_msgSend(v8, "nf_objectsForKeysWithoutMarker:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_434);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fc_arrayByRemovingObjectsPassingTest:", &__block_literal_global_436);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = *(_QWORD **)(a1 + 32);
  if (v14)
    v14 = (_QWORD *)v14[10];
  v15 = v14;
  objc_msgSend(v15, "possiblyUnfetchedAppConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "deprecatedSportsTopicTagIds");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = v17;
  else
    v19 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v13, "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v63[0] = v7;
  v63[1] = 3221225472;
  v63[2] = __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke_4_437;
  v63[3] = &unk_1E463DA78;
  v49 = v20;
  v64 = v49;
  v51 = v11;
  objc_msgSend(v11, "fc_arrayOfObjectsPassingTest:", v63);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v12;
  -[FCSubscriptionController _integrateTags:](*(_QWORD *)(a1 + 32), v12);
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v21;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v60 != v24)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        objc_msgSend(v26, "replacementID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "length");
        objc_msgSend(v26, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v6, "hasNotificationsEnabledForTagID:", v29);

        objc_msgSend(v26, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "removeSubscriptionForTagID:type:", v31, 0);

        if (v28)
        {
          objc_msgSend(v6, "addSubscriptionForTagID:type:", v27, 0);
          if (v30)
          {
            v32 = *(void **)(a1 + 32);
            objc_msgSend(v26, "identifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setNotificationsEnabled:forTagID:error:", 0, v33, 0);

            objc_msgSend(*(id *)(a1 + 32), "setNotificationsEnabled:forTagID:error:", 1, v27, 0);
          }
        }
        else if (v30)
        {
          v34 = *(void **)(a1 + 32);
          objc_msgSend(v26, "identifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setNotificationsEnabled:forTagID:error:", 0, v35, 0);

        }
      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
    }
    while (v23);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v36 = v48;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v56;
    do
    {
      for (j = 0; j != v38; ++j)
      {
        if (*(_QWORD *)v56 != v39)
          objc_enumerationMutation(v36);
        v41 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
        objc_msgSend(v41, "identifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v6, "hasNotificationsEnabledForTagID:", v42);

        objc_msgSend(v41, "identifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "removeSubscriptionForTagID:type:", v44, 0);

        if (v43)
        {
          v45 = *(void **)(a1 + 32);
          objc_msgSend(v41, "identifier");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setNotificationsEnabled:forTagID:error:", 0, v46, 0);

        }
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
    }
    while (v38);
  }

  v47 = *(_QWORD *)(a1 + 40);
  if (v47)
    (*(void (**)(uint64_t, void *))(v47 + 16))(v47, v52);

}

void __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke_431(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4 = a2;
  objc_msgSend(v4, "addEntriesFromDictionary:", v3);
  objc_msgSend(v4, "addEntriesFromDictionary:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

uint64_t __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke_2_432(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSubscribable") ^ 1;
}

uint64_t __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke_3_435(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSubscribable") ^ 1;
}

uint64_t __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke_4_437(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a2;
  if ((objc_msgSend(v3, "isDeprecated") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "containsObject:", v6);

  }
  return v4;
}

uint64_t __127__FCSubscriptionController__handleTagSubscriptionsAdded_tagSubscriptionsChanged_tagSubscriptionsMoved_tagSubscriptionsRemoved___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tagID");
}

void __127__FCSubscriptionController__handleTagSubscriptionsAdded_tagSubscriptionsChanged_tagSubscriptionsMoved_tagSubscriptionsRemoved___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = *(_QWORD *)(a1 + 32);
  v9 = a2;
  objc_msgSend(v9, "nf_objectsForKeysWithoutMarker:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(v9, "removeObjectsForKeys:", *(_QWORD *)(a1 + 32));
}

uint64_t __127__FCSubscriptionController__handleTagSubscriptionsAdded_tagSubscriptionsChanged_tagSubscriptionsMoved_tagSubscriptionsRemoved___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tagID");
}

void __127__FCSubscriptionController__handleTagSubscriptionsAdded_tagSubscriptionsChanged_tagSubscriptionsMoved_tagSubscriptionsRemoved___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "nf_objectsForKeysWithoutMarker:", *(_QWORD *)(a1 + 32));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

uint64_t __127__FCSubscriptionController__handleTagSubscriptionsAdded_tagSubscriptionsChanged_tagSubscriptionsMoved_tagSubscriptionsRemoved___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tagID");
}

void __127__FCSubscriptionController__handleTagSubscriptionsAdded_tagSubscriptionsChanged_tagSubscriptionsMoved_tagSubscriptionsRemoved___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id v14;

  v3 = a2;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __127__FCSubscriptionController__handleTagSubscriptionsAdded_tagSubscriptionsChanged_tagSubscriptionsMoved_tagSubscriptionsRemoved___block_invoke_7;
  v12 = &unk_1E4640188;
  v13 = v3;
  v4 = *(void **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "fc_setByTransformingWithBlock:", &v9);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(v5, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 40), v9, v10, v11, v12);
}

id __127__FCSubscriptionController__handleTagSubscriptionsAdded_tagSubscriptionsChanged_tagSubscriptionsMoved_tagSubscriptionsRemoved___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t __127__FCSubscriptionController__handleTagSubscriptionsAdded_tagSubscriptionsChanged_tagSubscriptionsMoved_tagSubscriptionsRemoved___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tagID");
}

void __127__FCSubscriptionController__handleTagSubscriptionsAdded_tagSubscriptionsChanged_tagSubscriptionsMoved_tagSubscriptionsRemoved___block_invoke_9(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "nf_objectsForKeysWithoutMarker:", *(_QWORD *)(a1 + 32));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

uint64_t __137__FCSubscriptionController__handleNonTagSubscriptionType_addedSubscriptionsByType_removedSubscriptionsByType_changedSubscriptionsByType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tagID");
}

uint64_t __137__FCSubscriptionController__handleNonTagSubscriptionType_addedSubscriptionsByType_removedSubscriptionsByType_changedSubscriptionsByType___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tagID");
}

uint64_t __137__FCSubscriptionController__handleNonTagSubscriptionType_addedSubscriptionsByType_removedSubscriptionsByType_changedSubscriptionsByType___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tagID");
}

void __137__FCSubscriptionController__handleNonTagSubscriptionType_addedSubscriptionsByType_removedSubscriptionsByType_changedSubscriptionsByType___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __137__FCSubscriptionController__handleNonTagSubscriptionType_addedSubscriptionsByType_removedSubscriptionsByType_changedSubscriptionsByType___block_invoke_5;
  v12[3] = &unk_1E4640260;
  v13 = v6;
  v14 = v5;
  v15 = *(id *)(a1 + 32);
  v16 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 64);
  v17 = v7;
  v18 = v8;
  v19 = v9;
  v10 = v5;
  v11 = v6;
  FCPerformBlockOnMainThread(v12);

}

void __137__FCSubscriptionController__handleNonTagSubscriptionType_addedSubscriptionsByType_removedSubscriptionsByType_changedSubscriptionsByType___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      v19 = 138543362;
      v20 = v2;
      _os_log_error_impl(&dword_1A1B90000, v3, OS_LOG_TYPE_ERROR, "failed to fetch some tags for muted subscription IDs with error: %{public}@", (uint8_t *)&v19, 0xCu);
    }
  }
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nf_objectsForKeysWithoutMarker:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 56), "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nf_objectsForKeysWithoutMarker:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0C99E60];
  v15 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 64), "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "nf_objectsForKeysWithoutMarker:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count") || objc_msgSend(v13, "count") || objc_msgSend(v18, "count"))
    -[FCSubscriptionController _notifyOfTagsAdded:tagsChanged:tagsMoved:tagsRemoved:subscriptionType:](*(_QWORD *)(a1 + 72), v8, v13, 0, v18, *(_QWORD *)(a1 + 80));

}

void __54__FCSubscriptionController__saveReadableSubscriptions__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[5];
  id v36;
  uint8_t buf[4];
  id v38;
  _QWORD v39[7];
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v39[0] = CFSTR("subscribed");
  objc_msgSend(*(id *)(a1 + 32), "subscribedTagIDs");
  v40 = objc_claimAutoreleasedReturnValue();
  v39[1] = CFSTR("muted");
  objc_msgSend(*(id *)(a1 + 32), "mutedTagIDs");
  v41 = objc_claimAutoreleasedReturnValue();
  v39[2] = CFSTR("autofavorited");
  objc_msgSend(*(id *)(a1 + 32), "autoFavoriteTagIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v2;
  v39[3] = CFSTR("ignored");
  objc_msgSend(*(id *)(a1 + 32), "ignoredTagIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v3;
  v39[4] = CFSTR("groupable");
  objc_msgSend(*(id *)(a1 + 32), "groupableTagIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v4;
  v39[5] = CFSTR("purchased");
  v5 = *(_QWORD **)(a1 + 32);
  v32 = (void *)v41;
  v33 = (void *)v40;
  if (v5)
    v5 = (_QWORD *)v5[8];
  v6 = v5;
  objc_msgSend(v6, "purchasedTagIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v8;
  v39[6] = CFSTR("lastUpdated");
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSince1970");
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%f"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, v39, 7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v13, 1, &v36);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v36;
  v16 = v15;
  if (v14)
  {
    v17 = (void *)MEMORY[0x1E0C99E98];
    v18 = *(_QWORD *)(a1 + 32);
    if (v18)
      v19 = *(void **)(v18 + 16);
    else
      v19 = 0;
    objc_msgSend(v19, "localStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "storeDirectory");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fileURLWithPath:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "URLByAppendingPathComponent:", CFSTR("subscriptions"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "URLByAppendingPathExtension:", CFSTR("json"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v24, "path");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v16;
      v26 = objc_msgSend(v14, "writeToFile:options:error:", v25, 1, &v34);
      v27 = v34;

      v28 = FCPersonalizationLog;
      if (v26)
      {
        if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
        {
          v29 = v28;
          objc_msgSend(v24, "path");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v38 = v30;
          _os_log_debug_impl(&dword_1A1B90000, v29, OS_LOG_TYPE_DEBUG, "Successfully saved readable subscriptions at %@.", buf, 0xCu);

        }
      }
      else if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v27;
        _os_log_error_impl(&dword_1A1B90000, v28, OS_LOG_TYPE_ERROR, "Error when saving readable subscriptions: %@", buf, 0xCu);
      }
      v16 = v27;
    }
    else
    {
      v31 = FCPersonalizationLog;
      if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A1B90000, v31, OS_LOG_TYPE_ERROR, "Failed to construct file URL for saving readable subscriptions", buf, 2u);
      }
    }

  }
  else
  {
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __54__FCSubscriptionController__saveReadableSubscriptions__block_invoke_2;
    v35[3] = &unk_1E463AB18;
    v35[4] = v15;
    __54__FCSubscriptionController__saveReadableSubscriptions__block_invoke_2((uint64_t)v35);
  }

}

void __54__FCSubscriptionController__saveReadableSubscriptions__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "Error when saving readable subscriptions: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (FCLocalChannelsProvider)localChannelsProvider
{
  return self->_localChannelsProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_appConfigurationManager, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_purchaseProvider, 0);
  objc_storeStrong((id *)&self->_notificationController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_subscribedTagsByTagID, 0);
  objc_storeStrong((id *)&self->_puzzleTypeController, 0);
  objc_storeStrong((id *)&self->_tagController, 0);
  objc_storeStrong((id *)&self->_subscriptionList, 0);
  objc_storeStrong((id *)&self->_localChannelsProvider, 0);
}

@end
