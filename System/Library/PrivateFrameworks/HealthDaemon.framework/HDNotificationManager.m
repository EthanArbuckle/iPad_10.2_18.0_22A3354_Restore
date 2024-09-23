@implementation HDNotificationManager

- (HDNotificationManager)initWithProfile:(id)a3 bundle:(int64_t)a4
{
  id v7;
  HDNotificationManager *v8;
  id v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  HKObserverSet *observers;
  uint64_t v14;
  OS_dispatch_queue *clientQueue;
  uint64_t v16;
  OS_dispatch_queue *resourceQueue;
  id v18;
  void *v19;
  uint64_t v20;
  UNUserNotificationCenter *userNotificationCenter;
  UNUserNotificationCenter *v22;
  void *v23;
  void *v25;
  objc_super v26;
  _QWORD v27[5];

  v7 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HDNotificationManager;
  v8 = -[HDNotificationManager init](&v26, sel_init);
  if (v8)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("HDNotificationManager.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile"));

    }
    objc_storeWeak((id *)&v8->_profile, v7);
    v8->_bundle = a4;
    v9 = objc_alloc(MEMORY[0x1E0CB6988]);
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "initWithName:loggingCategory:", v11, *MEMORY[0x1E0CB5330]);
    observers = v8->_observers;
    v8->_observers = (HKObserverSet *)v12;

    HKCreateSerialDispatchQueue();
    v14 = objc_claimAutoreleasedReturnValue();
    clientQueue = v8->_clientQueue;
    v8->_clientQueue = (OS_dispatch_queue *)v14;

    HKCreateSerialDispatchQueue();
    v16 = objc_claimAutoreleasedReturnValue();
    resourceQueue = v8->_resourceQueue;
    v8->_resourceQueue = (OS_dispatch_queue *)v16;

    v18 = objc_alloc(MEMORY[0x1E0CEC7A0]);
    -[HDNotificationManager identifierForBundle:](v8, a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "initWithBundleIdentifier:", v19);
    userNotificationCenter = v8->_userNotificationCenter;
    v8->_userNotificationCenter = (UNUserNotificationCenter *)v20;

    if (v8->_bundle == 1)
    {
      v22 = v8->_userNotificationCenter;
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __70__HDNotificationManager__registerWithUserNotificationCenterIfRequired__block_invoke;
      v27[3] = &unk_1E6CE77C8;
      v27[4] = v8;
      -[UNUserNotificationCenter requestAuthorizationWithOptions:completionHandler:](v22, "requestAuthorizationWithOptions:completionHandler:", 39, v27);
    }
    objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObject:", v8);

  }
  return v8;
}

- (id)identifierForBundle:(id)a1
{
  id *v2;

  if (a1)
  {
    if (!a2)
    {
      v2 = (id *)MEMORY[0x1E0CB7630];
      goto LABEL_6;
    }
    if (a2 == 1)
    {
      v2 = (id *)MEMORY[0x1E0CB7800];
LABEL_6:
      a1 = *v2;
    }
  }
  return a1;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", self);

  v4.receiver = self;
  v4.super_class = (Class)HDNotificationManager;
  -[HDNotificationManager dealloc](&v4, sel_dealloc);
}

void __70__HDNotificationManager__registerWithUserNotificationCenterIfRequired__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  const __CFString *v11;
  int v12;
  void *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB5330];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5330], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD **)(a1 + 32);
    v8 = v7[2];
    v9 = v6;
    -[HDNotificationManager identifierForBundle:](v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("not granted");
    v12 = 138412802;
    v13 = v10;
    v14 = 2112;
    if (a2)
      v11 = CFSTR("granted");
    v15 = v11;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "[%@] UNUserNotificationCenter request %@ error: %@", (uint8_t *)&v12, 0x20u);

  }
}

- (BOOL)areHealthNotificationsAuthorized
{
  void *v2;
  uint64_t v3;

  -[UNUserNotificationCenter notificationSettings](self->_userNotificationCenter, "notificationSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "authorizationStatus");

  return v3 == 4 || (v3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)areHealthCriticalAlertsAuthorized
{
  void *v2;
  uint64_t v3;

  -[UNUserNotificationCenter notificationSettings](self->_userNotificationCenter, "notificationSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "criticalAlertSetting");

  return v3 == 2;
}

- (void)badgeForDomain:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *resourceQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__HDNotificationManager_badgeForDomain_completion___block_invoke;
  block[3] = &unk_1E6CF7C30;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(resourceQueue, block);

}

void __51__HDNotificationManager_badgeForDomain_completion___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD);
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v2 = *(void (***)(_QWORD, _QWORD, _QWORD))(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = v3;
  if (v2)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__HDNotificationManager__objectCompletionOnClientQueue___block_invoke;
    v10[3] = &unk_1E6CFC170;
    v10[4] = v2;
    v11 = v3;
    v2 = (void (**)(_QWORD, _QWORD, _QWORD))objc_msgSend(v10, "copy");

  }
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v9 = 0;
  objc_msgSend(v5, "_resourceQueue_badgeForDomain:error:", v6, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  ((void (**)(_QWORD, void *, id))v2)[2](v2, v7, v8);

}

- (BOOL)incrementBadgeForDomain:(int64_t)a3 count:(int64_t)a4 error:(id *)a5
{
  NSObject *resourceQueue;
  char v6;
  _QWORD block[9];
  _QWORD v9[5];
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__115;
  v9[4] = __Block_byref_object_dispose__115;
  v10 = 0;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__HDNotificationManager_incrementBadgeForDomain_count_error___block_invoke;
  block[3] = &unk_1E6CFC058;
  block[4] = self;
  block[5] = v9;
  block[7] = a3;
  block[8] = a4;
  block[6] = &v11;
  dispatch_sync(resourceQueue, block);
  v6 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(v9, 8);

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __61__HDNotificationManager_incrementBadgeForDomain_count_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  id v13;
  id obj;

  v2 = a1[7];
  v3 = (void *)a1[4];
  v4 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v3, "_resourceQueue_badgeForDomain:error:", v2, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  if (v5)
  {
    objc_msgSend(v5, "badgeByIncrementingByCount:", a1[8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *(_QWORD *)(a1[5] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = 0;

    v9 = a1[7];
    v10 = a1[4];
    v11 = *(_QWORD *)(a1[5] + 8);
    v13 = *(id *)(v11 + 40);
    v12 = -[HDNotificationManager _resourceQueue_setBadge:domain:error:](v10, v6, v9, &v13);
    objc_storeStrong((id *)(v11 + 40), v13);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v12;

  }
}

- (BOOL)_resourceQueue_setBadge:(uint64_t)a3 domain:(_QWORD *)a4 error:
{
  id v7;
  os_log_t *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  _BOOL8 v14;
  id v15;
  os_log_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  os_log_t v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  NSObject *v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  uint64_t v36;
  id v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (a1)
  {
    _HKInitializeLogging();
    v8 = (os_log_t *)MEMORY[0x1E0CB5330];
    v9 = (void *)*MEMORY[0x1E0CB5330];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5330], OS_LOG_TYPE_INFO))
    {
      v10 = v9;
      objc_msgSend(v7, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromHKNotificationDomain();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v39 = v11;
      v40 = 2112;
      v41 = v12;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_INFO, "Setting badge to %@ for domain %@", buf, 0x16u);

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    v37 = 0;
    v14 = +[HDUnprotectedKeyValueEntity setBadge:forDomain:profile:error:](HDUnprotectedKeyValueEntity, "setBadge:forDomain:profile:error:", v7, a3, WeakRetained, &v37);
    v15 = v37;

    _HKInitializeLogging();
    v16 = *v8;
    v17 = *v8;
    if (v14)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v16;
        objc_msgSend(v7, "description");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromHKNotificationDomain();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v19;
        v40 = 2114;
        v41 = v20;
        _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "Setting badge to %{public}@ for domain %{public}@", buf, 0x16u);

      }
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
      -[HDNotificationManager _resourceQueue_coaleseDomainBadges]((dispatch_queue_t *)a1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      _HKInitializeLogging();
      v22 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        v23 = v22;
        objc_msgSend(v21, "description");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v39 = v24;
        _os_log_impl(&dword_1B7802000, v23, OS_LOG_TYPE_DEFAULT, "Setting application badge to %{public}@", buf, 0xCu);

      }
      v25 = objc_alloc(MEMORY[0x1E0DC5B68]);
      v26 = (void *)objc_msgSend(v25, "initWithBundleIdentifier:", *MEMORY[0x1E0CB7630]);
      objc_msgSend(v21, "value");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setBadgeValue:", v27);

      v28 = *(void **)(a1 + 24);
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __62__HDNotificationManager__resourceQueue_setBadge_domain_error___block_invoke;
      v34[3] = &unk_1E6CFC148;
      v34[4] = a1;
      v35 = v7;
      v36 = a3;
      objc_msgSend(v28, "notifyObservers:", v34);
      if (notify_post((const char *)*MEMORY[0x1E0CB7628]))
      {
        _HKInitializeLogging();
        v29 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1B7802000, v29, OS_LOG_TYPE_ERROR, "Failed to post BadgesDidUpdateNotification", buf, 2u);
        }
      }

    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v32 = v16;
        NSStringFromHKNotificationDomain();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v39 = v7;
        v40 = 2114;
        v41 = v33;
        v42 = 2114;
        v43 = v15;
        _os_log_error_impl(&dword_1B7802000, v32, OS_LOG_TYPE_ERROR, "Error setting badge to %{public}@ for domain %{public}@: %{public}@", buf, 0x20u);

      }
      v30 = v15;
      if (v30)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v30);
        else
          _HKLogDroppedError();
      }

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)setBadge:(id)a3 forDomain:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *resourceQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  resourceQueue = self->_resourceQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__HDNotificationManager_setBadge_forDomain_completion___block_invoke;
  v13[3] = &unk_1E6CFC080;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v8;
  v12 = v9;
  dispatch_async(resourceQueue, v13);

}

void __55__HDNotificationManager_setBadge_forDomain_completion___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD);
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _BOOL8 v6;
  id v7;
  id v8;

  -[HDNotificationManager _actionCompletionOnClientQueue:](*(void **)(a1 + 32), *(void **)(a1 + 48));
  v2 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  v8 = 0;
  v6 = -[HDNotificationManager _resourceQueue_setBadge:domain:error:](v3, v4, v5, &v8);
  v7 = v8;
  ((void (**)(_QWORD, _BOOL8, id))v2)[2](v2, v6, v7);

}

- (id)_actionCompletionOnClientQueue:(void *)a1
{
  id v3;
  void *v4;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56__HDNotificationManager__actionCompletionOnClientQueue___block_invoke;
    v6[3] = &unk_1E6CED3F8;
    v6[4] = a1;
    v7 = v3;
    a1 = (void *)objc_msgSend(v6, "copy");

  }
  return a1;
}

- (void)unitTest_deliveredNotificationsOverride:(id)a3
{
  objc_storeStrong((id *)&self->_unitTest_deliveredNotifications, a3);
}

+ (id)createNotificationContentWithTitle:(id)a3 body:(id)a4 categoryIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0CEC6E0]);
  v11 = v10;
  if (v7)
    objc_msgSend(v10, "setTitle:", v7);
  if (v8)
    objc_msgSend(v11, "setBody:", v8);
  if (v9)
    objc_msgSend(v11, "setCategoryIdentifier:", v9);
  objc_msgSend(MEMORY[0x1E0CEC760], "soundWithAlertType:", 25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSound:", v12);

  return v11;
}

- (void)getDeliveredNotificationsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *resourceQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (_HDIsUnitTesting)
  {
    resourceQueue = self->_resourceQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __72__HDNotificationManager_getDeliveredNotificationsWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E6CE8C48;
    v7[4] = self;
    v8 = v4;
    dispatch_async(resourceQueue, v7);

  }
  else
  {
    -[UNUserNotificationCenter getDeliveredNotificationsWithCompletionHandler:](self->_userNotificationCenter, "getDeliveredNotificationsWithCompletionHandler:", v4);
  }

}

uint64_t __72__HDNotificationManager_getDeliveredNotificationsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
}

- (void)postNotificationWithIdentifier:(id)a3 content:(id)a4 trigger:(id)a5 completion:(id)a6
{
  void *v10;
  id v11;
  id v12;

  v10 = (void *)MEMORY[0x1E0CEC740];
  v11 = a6;
  objc_msgSend(v10, "requestWithIdentifier:content:trigger:", a3, a4, a5);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[HDNotificationManager postNotificationWithRequest:completion:](self, "postNotificationWithRequest:completion:", v12, v11);

}

- (void)postNotificationWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *resourceQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HDNotificationManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__HDNotificationManager_postNotificationWithRequest_completion___block_invoke;
  block[3] = &unk_1E6CEA160;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(resourceQueue, block);

}

void __64__HDNotificationManager_postNotificationWithRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int8x16_t v14;
  _QWORD aBlock[4];
  int8x16_t v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB5330];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5330], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v5;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "Posting notification: %{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(v7 + 48);
  *(_QWORD *)(v7 + 48) = v6;

  -[HDNotificationManager _actionCompletionOnClientQueue:](*(void **)(a1 + 40), *(void **)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__HDNotificationManager_postNotificationWithRequest_completion___block_invoke_208;
  aBlock[3] = &unk_1E6CFC0D0;
  v10 = v9;
  v17 = v10;
  v14 = *(int8x16_t *)(a1 + 32);
  v11 = (id)v14.i64[0];
  v16 = vextq_s8(v14, v14, 8uLL);
  v12 = _Block_copy(aBlock);
  v13 = v12;
  if (_HDIsUnitTesting)
    (*((void (**)(void *, _QWORD))v12 + 2))(v12, 0);
  else
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "addNotificationRequest:withCompletionHandler:", *(_QWORD *)(a1 + 32), v12);

}

void __64__HDNotificationManager_postNotificationWithRequest_completion___block_invoke_208(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  (*(void (**)(_QWORD, BOOL, uint64_t))(a1[6] + 16))(a1[6], a2 == 0, a2);
  v3 = a1[4];
  v4 = (void *)a1[5];
  v5 = *(void **)(v3 + 24);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__HDNotificationManager_postNotificationWithRequest_completion___block_invoke_2;
  v6[3] = &unk_1E6CFC0A8;
  v6[4] = v3;
  v7 = v4;
  objc_msgSend(v5, "notifyObservers:", v6);

}

uint64_t __64__HDNotificationManager_postNotificationWithRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "notificationManager:didPostNotification:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)postNotificationWithTitle:(id)a3 body:(id)a4 categoryIdentifier:(id)a5 subtitle:(id)a6 domain:(int64_t)a7 accessoryImageName:(id)a8 header:(id)a9 completion:(id)a10
{
  -[HDNotificationManager _postNotificationWithTitle:body:categoryIdentifier:subtitle:domain:url:accessoryImageName:header:completion:](self, a3, a4, a5, a6, a7, 0, a8, a9, a10);
}

- (void)_postNotificationWithTitle:(void *)a3 body:(void *)a4 categoryIdentifier:(void *)a5 subtitle:(uint64_t)a6 domain:(void *)a7 url:(void *)a8 accessoryImageName:(void *)a9 header:(void *)a10 completion:
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a5;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  if (a1)
  {
    v20 = a10;
    v21 = a4;
    v22 = a3;
    v23 = a2;
    objc_msgSend((id)objc_opt_class(), "createNotificationContentWithTitle:body:categoryIdentifier:", v23, v22, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
      objc_msgSend(v24, "setSubtitle:", v30);
    objc_msgSend(v24, "setAccessoryImageName:", v18);
    if (v19)
      objc_msgSend(v24, "setHeader:", v19);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0CB7760]);

    if (v17)
    {
      objc_msgSend(v17, "absoluteString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0CB7770]);

    }
    objc_msgSend(v24, "setUserInfo:", v25);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "UUIDString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "postNotificationWithIdentifier:content:trigger:completion:", v29, v24, 0, v20);

  }
}

- (void)postNotificationWithTitle:(id)a3 body:(id)a4 categoryIdentifier:(id)a5 subtitle:(id)a6 domain:(int64_t)a7 url:(id)a8 accessoryImageName:(id)a9 header:(id)a10 completion:(id)a11
{
  -[HDNotificationManager _postNotificationWithTitle:body:categoryIdentifier:subtitle:domain:url:accessoryImageName:header:completion:](self, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

- (void)postCompanionUserNotificationOfType:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *resourceQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__HDNotificationManager_postCompanionUserNotificationOfType_completion___block_invoke;
  block[3] = &unk_1E6CF7C30;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(resourceQueue, block);

}

void __72__HDNotificationManager_postCompanionUserNotificationOfType_completion___block_invoke(uint64_t a1)
{
  HDCodableCompanionUserNotificationConfiguration *v2;
  HDCodableCompanionUserNotificationRequest *v3;
  void *v4;
  void *v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v2 = objc_alloc_init(HDCodableCompanionUserNotificationConfiguration);
  -[HDCodableCompanionUserNotificationConfiguration setNotificationType:](v2, "setNotificationType:", *(unsigned int *)(a1 + 48));
  v3 = objc_alloc_init(HDCodableCompanionUserNotificationRequest);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableCompanionUserNotificationRequest setRequestIdentifier:](v3, "setRequestIdentifier:", v5);

  -[HDCodableCompanionUserNotificationRequest setNotificationConfiguration:](v3, "setNotificationConfiguration:", v2);
  v6 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "nanoSyncManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__HDNotificationManager_postCompanionUserNotificationOfType_completion___block_invoke_2;
  v10[3] = &unk_1E6CED3F8;
  v11 = v6;
  v12 = *(id *)(a1 + 40);
  v9 = v6;
  objc_msgSend(v8, "sendCompanionUserNotificationRequest:completion:", v3, v10);

}

void __72__HDNotificationManager_postCompanionUserNotificationOfType_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__HDNotificationManager_postCompanionUserNotificationOfType_completion___block_invoke_3;
  block[3] = &unk_1E6CEBCC8;
  v11 = a2;
  v9 = v5;
  v6 = *(NSObject **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v7 = v5;
  dispatch_async(v6, block);

}

uint64_t __72__HDNotificationManager_postCompanionUserNotificationOfType_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
    return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 32));
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB5330];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5330], OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_error_impl(&dword_1B7802000, v3, OS_LOG_TYPE_ERROR, "Error posting notification: %@", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)receivedCompanionUserNotificationRequest:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "notificationConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "notificationType");

  if (v8 == 1)
  {
    HKHealthKitFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("NEW_ELECTROCARDIOGRAM_NOTIFICATION_TITLE"), &stru_1E6D11BB8, CFSTR("Localizable-Cinnamon"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HKConditionallyRedactedHeartRhythmString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HKHealthKitFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("NEW_ELECTROCARDIOGRAM_NOTIFICATION_BODY"), &stru_1E6D11BB8, CFSTR("Localizable-Cinnamon"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HKConditionallyRedactedHeartRhythmString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "_hk_urlForElectrocardiogramType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __77__HDNotificationManager_receivedCompanionUserNotificationRequest_completion___block_invoke;
    v18[3] = &unk_1E6CED3F8;
    v18[4] = self;
    v19 = v6;
    -[HDNotificationManager _postNotificationWithTitle:body:categoryIdentifier:subtitle:domain:url:accessoryImageName:header:completion:](self, v11, v14, CFSTR("com.apple.private.health.heartrhythm.phoneonly"), 0, 4, v15, 0, 0, v18);

  }
  else
  {
    _HKInitializeLogging();
    v16 = *MEMORY[0x1E0CB5330];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5330], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v21 = v8;
      _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "Received unsupported user notification message of type %ld.", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Unsupported companion notification type."));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDNotificationManager _sendCompanionUserNotificationResponse:error:]((uint64_t)self, v6, v17);

  }
}

void __77__HDNotificationManager_receivedCompanionUserNotificationRequest_completion___block_invoke(uint64_t a1)
{
  -[HDNotificationManager _sendCompanionUserNotificationResponse:error:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), 0);
}

- (void)_sendCompanionUserNotificationResponse:(void *)a3 error:
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    v8 = *(NSObject **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __70__HDNotificationManager__sendCompanionUserNotificationResponse_error___block_invoke;
    v9[3] = &unk_1E6CE9C08;
    v10 = v6;
    v11 = v5;
    dispatch_async(v8, v9);

  }
}

void __70__HDNotificationManager__sendCompanionUserNotificationResponse_error___block_invoke(uint64_t a1)
{
  HDCodableCompanionUserNotificationResponse *v2;
  void *v3;
  HDCodableCompanionUserNotificationResponse *v4;

  v2 = objc_alloc_init(HDCodableCompanionUserNotificationResponse);
  v4 = v2;
  if (*(_QWORD *)(a1 + 32))
  {
    -[HDCodableCompanionUserNotificationResponse setSuccess:](v2, "setSuccess:", 0);
    objc_msgSend(*(id *)(a1 + 32), "hk_codableError");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableCompanionUserNotificationResponse setError:](v4, "setError:", v3);

  }
  else
  {
    -[HDCodableCompanionUserNotificationResponse setSuccess:](v2, "setSuccess:", 1);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)removePendingNotificationsWithIdentifiers:(id)a3
{
  id v4;
  HKObserverSet *observers;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[UNUserNotificationCenter removePendingNotificationRequestsWithIdentifiers:](self->_userNotificationCenter, "removePendingNotificationRequestsWithIdentifiers:", v4);
  observers = self->_observers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__HDNotificationManager_removePendingNotificationsWithIdentifiers___block_invoke;
  v7[3] = &unk_1E6CFC0A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v7);

}

void __67__HDNotificationManager_removePendingNotificationsWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "notificationManager:didRemovePendingNotificationsWithIdentifiers:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)removeDeliveredNotificationsWithIdentifiers:(id)a3
{
  id v4;
  HKObserverSet *observers;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[UNUserNotificationCenter removeDeliveredNotificationsWithIdentifiers:](self->_userNotificationCenter, "removeDeliveredNotificationsWithIdentifiers:", v4);
  observers = self->_observers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__HDNotificationManager_removeDeliveredNotificationsWithIdentifiers___block_invoke;
  v7[3] = &unk_1E6CFC0A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v7);

}

void __69__HDNotificationManager_removeDeliveredNotificationsWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "notificationManager:didRemoveDeliveredNotificationsWithIdentifiers:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)removeDeliveredNotificationsWithCategoryIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  UNUserNotificationCenter *userNotificationCenter;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  HDNotificationManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  userNotificationCenter = self->_userNotificationCenter;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __94__HDNotificationManager_removeDeliveredNotificationsWithCategoryIdentifier_completionHandler___block_invoke;
  v11[3] = &unk_1E6CFC0F8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  -[UNUserNotificationCenter getDeliveredNotificationsWithCompletionHandler:](userNotificationCenter, "getDeliveredNotificationsWithCompletionHandler:", v11);

}

void __94__HDNotificationManager_removeDeliveredNotificationsWithCategoryIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v9, "request");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "content");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "categoryIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", *(_QWORD *)(a1 + 32));

        if (v13)
        {
          objc_msgSend(v9, "request");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v15);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 40), "removeDeliveredNotificationsWithIdentifiers:", v19);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v17 = *(void **)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 40);
  v18 = *(void **)(v16 + 24);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __94__HDNotificationManager_removeDeliveredNotificationsWithCategoryIdentifier_completionHandler___block_invoke_2;
  v20[3] = &unk_1E6CFC0A8;
  v20[4] = v16;
  v21 = v17;
  objc_msgSend(v18, "notifyObservers:", v20);

}

void __94__HDNotificationManager_removeDeliveredNotificationsWithCategoryIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "notificationManager:didRemoveDeliveredNotificationsWithCategoryIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)addNotificationObserver:(id)a3
{
  if (self)
    -[HKObserverSet registerObserver:queue:](self->_observers, "registerObserver:queue:", a3, 0);
}

- (void)removeNotificationObserver:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (id)_badgeForDomain:(int64_t)a3 error:(id *)a4
{
  NSObject *resourceQueue;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[8];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_resourceQueue);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__115;
  v23 = __Block_byref_object_dispose__115;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__115;
  v17 = __Block_byref_object_dispose__115;
  v18 = 0;
  resourceQueue = self->_resourceQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__HDNotificationManager__badgeForDomain_error___block_invoke;
  v12[3] = &unk_1E6CFC120;
  v12[4] = self;
  v12[5] = &v13;
  v12[6] = &v19;
  v12[7] = a3;
  dispatch_sync(resourceQueue, v12);
  v8 = (id)v20[5];
  v9 = v8;
  if (v8)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v8);
    else
      _HKLogDroppedError();
  }

  v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __47__HDNotificationManager__badgeForDomain_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[7];
  v4 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "_resourceQueue_badgeForDomain:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[5] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)_aggregateBadge
{
  NSObject *resourceQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_resourceQueue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__115;
  v11 = __Block_byref_object_dispose__115;
  v12 = 0;
  resourceQueue = self->_resourceQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__HDNotificationManager__aggregateBadge__block_invoke;
  v6[3] = &unk_1E6CE8110;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(resourceQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __40__HDNotificationManager__aggregateBadge__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  -[HDNotificationManager _resourceQueue_coaleseDomainBadges](*(dispatch_queue_t **)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_resourceQueue_coaleseDomainBadges
{
  void *v2;
  uint64_t i;
  void *v4;
  uint64_t v5;

  if (a1)
  {
    dispatch_assert_queue_V2(a1[5]);
    objc_msgSend(MEMORY[0x1E0CB6338], "zeroBadge");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 17; ++i)
    {
      if ((HKNotificationDomainIsDeprecated() & 1) == 0)
      {
        -[HDNotificationManager _resourceQueue_badgeForDomain:](a1, i);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
        {
          objc_msgSend(v2, "badgeByAggregatingWithBadge:", v4);
          v5 = objc_claimAutoreleasedReturnValue();

          v2 = (void *)v5;
        }

      }
    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_resourceQueue_badgeForDomain:(dispatch_queue_t *)a1
{
  id v2;
  id v4;
  void *v5;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v2 = a1;
  v14 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(a1[5]);
    v9 = 0;
    objc_msgSend(v2, "_resourceQueue_badgeForDomain:error:", a2, &v9);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    v4 = v9;
    if (v4)
    {
      _HKInitializeLogging();
      v5 = (void *)*MEMORY[0x1E0CB5330];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5330], OS_LOG_TYPE_ERROR))
      {
        v7 = v5;
        NSStringFromHKNotificationDomain();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v11 = v8;
        v12 = 2114;
        v13 = v4;
        _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "Error getting badge for domain %{public}@: %{public}@", buf, 0x16u);

      }
    }

  }
  return v2;
}

- (id)_resourceQueue_badgeForDomain:(int64_t)a3 error:(id *)a4
{
  id WeakRetained;
  void *v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  +[HDUnprotectedKeyValueEntity badgeForDomain:profile:error:](HDUnprotectedKeyValueEntity, "badgeForDomain:profile:error:", a3, WeakRetained, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __62__HDNotificationManager__resourceQueue_setBadge_domain_error___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "notificationManager:didUpdateBadge:domain:", a1[4], a1[5], a1[6]);
}

void __56__HDNotificationManager__actionCompletionOnClientQueue___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__HDNotificationManager__actionCompletionOnClientQueue___block_invoke_2;
  block[3] = &unk_1E6CEBC78;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __56__HDNotificationManager__actionCompletionOnClientQueue___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

void __56__HDNotificationManager__objectCompletionOnClientQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__HDNotificationManager__objectCompletionOnClientQueue___block_invoke_2;
  block[3] = &unk_1E6CEBCA0;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __56__HDNotificationManager__objectCompletionOnClientQueue___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (id)diagnosticDescription
{
  id v3;
  NSObject *resourceQueue;
  id v5;
  void *v6;
  __CFString *v7;
  void *v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_resourceQueue);
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__115;
  v17 = __Block_byref_object_dispose__115;
  v18 = 0;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__HDNotificationManager_diagnosticDescription__block_invoke;
  block[3] = &unk_1E6CF6BF8;
  v12 = &v13;
  block[4] = self;
  v5 = v3;
  v11 = v5;
  dispatch_sync(resourceQueue, block);
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n%@"), v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("none");
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n\tLast notification since boot: %@\n\tBadge counts: %@"), v14[5], v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __46__HDNotificationManager_diagnosticDescription__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t i;
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;

  HKDiagnosticStringFromDate();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  for (i = 0; i != 17; ++i)
  {
    NSStringFromHKNotificationDomain();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("deprecated");
    if ((HKNotificationDomainIsDeprecated() & 1) == 0)
    {
      -[HDNotificationManager _resourceQueue_badgeForDomain:](*(dispatch_queue_t **)(a1 + 32), i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "description");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v9)
        v11 = (__CFString *)v9;
      else
        v11 = CFSTR("none");
      v7 = v11;

    }
    v12 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t\t%@: %@"), v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

  }
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong((id *)&self->_unitTest_deliveredNotifications, 0);
  objc_storeStrong((id *)&self->_lastNotificationDate, 0);
  objc_storeStrong((id *)&self->_resourceQueue, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
