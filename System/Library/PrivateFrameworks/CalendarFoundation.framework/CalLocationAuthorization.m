@implementation CalLocationAuthorization

+ (id)logHandle
{
  if (logHandle_onceToken != -1)
    dispatch_once(&logHandle_onceToken, &__block_literal_global_0);
  return (id)logHandle_logHandle;
}

void __37__CalLocationAuthorization_logHandle__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("CalendarFoundation", "CalLocationAuthorization");
  v1 = (void *)logHandle_logHandle;
  logHandle_logHandle = (uint64_t)v0;

}

+ (id)locationAuthorizationAsyncCallersQueue
{
  if (locationAuthorizationAsyncCallersQueue_onceToken != -1)
    dispatch_once(&locationAuthorizationAsyncCallersQueue_onceToken, &__block_literal_global_20);
  return (id)locationAuthorizationAsyncCallersQueue_queue;
}

void __66__CalLocationAuthorization_locationAuthorizationAsyncCallersQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.CalendarFoundation.CalLocationAuthorization.AsyncCallers", v2);
  v1 = (void *)locationAuthorizationAsyncCallersQueue_queue;
  locationAuthorizationAsyncCallersQueue_queue = (uint64_t)v0;

}

+ (void)authorizationStatusForBundleIdentifier:(id)a3 completion:(id)a4
{
  objc_msgSend(a1, "authorizationStatusForBundleIdentifier:bundle:completion:", a3, 0, a4);
}

+ (void)authorizationStatusForBundle:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "authorizationStatusForBundleIdentifier:bundle:completion:", v8, v7, v6);

}

+ (void)authorizationStatusForBundleIdentifier:(id)a3 bundle:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  dispatch_block_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  void (**v23)(id, uint64_t);
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  objc_msgSend(a1, "_cachedInstanceForBundleID:bundle:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "authorizationStatus");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "status");

    v10[2](v10, v14);
  }
  else
  {
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __85__CalLocationAuthorization_authorizationStatusForBundleIdentifier_bundle_completion___block_invoke;
    v20 = &unk_1E2A83DB0;
    v24 = a1;
    v21 = v8;
    v22 = v9;
    v23 = v10;
    v15 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &v17);
    objc_msgSend(a1, "locationAuthorizationAsyncCallersQueue", v17, v18, v19, v20);
    v16 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v16, v15);

  }
}

uint64_t __85__CalLocationAuthorization_authorizationStatusForBundleIdentifier_bundle_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 56), "authorizationStatusForBundleIdentifier:bundle:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

+ (int)authorizationStatusForBundleIdentifier:(id)a3
{
  return objc_msgSend(a1, "authorizationStatusForBundleIdentifier:bundle:", a3, 0);
}

+ (int)authorizationStatusForBundle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(a1, "authorizationStatusForBundleIdentifier:bundle:", v5, v4);

  return (int)a1;
}

+ (int)authorizationStatusForBundleIdentifier:(id)a3 bundle:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  int v7;

  objc_msgSend(a1, "authorizationForBundleIdentifier:bundle:createIfNecessary:", a3, a4, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "authorizationStatus");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "status");

  }
  else
  {
    v7 = 2;
  }

  return v7;
}

+ (unint64_t)locationPrecisionForBundleIdentifier:(id)a3
{
  return objc_msgSend(a1, "locationPrecisionForBundleIdentifier:bundle:", a3, 0);
}

+ (unint64_t)locationPrecisionForBundleIdentifier:(id)a3 bundle:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  objc_msgSend(a1, "authorizationForBundleIdentifier:bundle:createIfNecessary:", a3, a4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "authorizationStatus");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "precision");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)preciseLocationAuthorizedForBundleIdentifier:(id)a3 completion:(id)a4
{
  objc_msgSend(a1, "preciseLocationAuthorizedForBundleIdentifier:bundle:completion:", a3, 0, a4);
}

+ (void)preciseLocationAuthorizedForBundle:(id)a3 completion:(id)a4
{
  objc_msgSend(a1, "preciseLocationAuthorizedForBundleIdentifier:bundle:completion:", 0, a3, a4);
}

+ (void)preciseLocationAuthorizedForBundleIdentifier:(id)a3 bundle:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  void *v16;
  dispatch_block_t v17;
  NSObject *v18;
  _QWORD block[4];
  void (**v20)(_QWORD);
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __91__CalLocationAuthorization_preciseLocationAuthorizedForBundleIdentifier_bundle_completion___block_invoke;
  v21[3] = &unk_1E2A83DB0;
  v25 = a1;
  v12 = v8;
  v22 = v12;
  v13 = v9;
  v23 = v13;
  v14 = v10;
  v24 = v14;
  v15 = (void (**)(_QWORD))MEMORY[0x19400A168](v21);
  objc_msgSend(a1, "_cachedInstanceForBundleID:bundle:", v12, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v15[2](v15);
  }
  else
  {
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __91__CalLocationAuthorization_preciseLocationAuthorizedForBundleIdentifier_bundle_completion___block_invoke_2;
    block[3] = &unk_1E2A83DD8;
    v20 = v15;
    v17 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    objc_msgSend(a1, "locationAuthorizationAsyncCallersQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v18, v17);

  }
}

uint64_t __91__CalLocationAuthorization_preciseLocationAuthorizedForBundleIdentifier_bundle_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 56), "preciseLocationAuthorizedForBundleIdentifier:bundle:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __91__CalLocationAuthorization_preciseLocationAuthorizedForBundleIdentifier_bundle_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)preciseLocationAuthorizedForBundleIdentifier:(id)a3
{
  return objc_msgSend(a1, "preciseLocationAuthorizedForBundleIdentifier:bundle:", a3, 0);
}

+ (BOOL)preciseLocationAuthorizedForBundle:(id)a3
{
  return objc_msgSend(a1, "preciseLocationAuthorizedForBundleIdentifier:bundle:", 0, a3);
}

+ (BOOL)preciseLocationAuthorizedForBundleIdentifier:(id)a3 bundle:(id)a4
{
  void *v4;
  BOOL v5;

  objc_msgSend(a1, "authorizationForBundleIdentifier:bundle:createIfNecessary:", a3, a4, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "waitForPrecision") == 2;

  return v5;
}

+ (void)initializeQueueAndInstancesIfNeeded
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__CalLocationAuthorization_initializeQueueAndInstancesIfNeeded__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initializeQueueAndInstancesIfNeeded_onceToken != -1)
    dispatch_once(&initializeQueueAndInstancesIfNeeded_onceToken, block);
}

void __63__CalLocationAuthorization_initializeQueueAndInstancesIfNeeded__block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;

  if (+[CalEntitlementsVerifier currentProcessHasBooleanEntitlement:](CalEntitlementsVerifier, "currentProcessHasBooleanEntitlement:", CFSTR("com.apple.locationd.effective_bundle")))
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = dispatch_queue_create("com.apple.CalendarFoundation.CalLocationAuthorization.Request", v2);
    v4 = (void *)locationAuthorizationQueue;
    locationAuthorizationQueue = (uint64_t)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    v6 = (void *)idInstances;
    idInstances = v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    v8 = (void *)bundleInstances;
    bundleInstances = v7;

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "logHandle");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __63__CalLocationAuthorization_initializeQueueAndInstancesIfNeeded__block_invoke_cold_1(v9);

  }
}

+ (id)_keyForBundleID:(id)a3 bundle:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(v6, "bundlePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(v6, "bundleURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "absoluteString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v8;
}

+ (id)_cachedInstanceForBundleID:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  uint64_t *v8;
  id v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "initializeQueueAndInstancesIfNeeded");
  v8 = &idInstances;
  if (v6)
    v8 = &bundleInstances;
  v9 = (id)*v8;
  objc_msgSend(a1, "_keyForBundleID:bundle:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock((os_unfair_lock_t)&instancesDictionaryLock);
  if (v10)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&instancesDictionaryLock);

  return v11;
}

+ (id)authorizationForBundleIdentifier:(id)a3 bundle:(id)a4 createIfNecessary:(BOOL)a5
{
  _BOOL4 v5;
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;
  id v11;
  uint64_t *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  _QWORD block[4];
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  id *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v5 = a5;
  v8 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  if (!(v8 | v9))
  {
    objc_msgSend(a1, "logHandle");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      +[CalLocationAuthorization authorizationForBundleIdentifier:bundle:createIfNecessary:].cold.1(v10);
    v11 = 0;
LABEL_18:

    goto LABEL_19;
  }
  objc_msgSend(a1, "initializeQueueAndInstancesIfNeeded");
  if (locationAuthorizationQueue)
  {
    v12 = &idInstances;
    if (v9)
      v12 = &bundleInstances;
    v10 = (id)*v12;
    objc_msgSend(a1, "_keyForBundleID:bundle:", v8, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v25 = (id *)&v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy_;
    v28 = __Block_byref_object_dispose_;
    v29 = 0;
    os_unfair_lock_lock((os_unfair_lock_t)&instancesDictionaryLock);
    if (v13)
    {
      -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    objc_storeStrong(v25 + 5, v14);
    if (v13)

    os_unfair_lock_unlock((os_unfair_lock_t)&instancesDictionaryLock);
    v15 = v25[5];
    if (!v15 && v5)
    {
      v16 = locationAuthorizationQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __86__CalLocationAuthorization_authorizationForBundleIdentifier_bundle_createIfNecessary___block_invoke;
      block[3] = &unk_1E2A83E20;
      v19 = v13;
      v23 = &v24;
      v20 = v10;
      v21 = (id)v8;
      v22 = (id)v9;
      dispatch_sync(v16, block);

      v15 = v25[5];
    }
    v11 = v15;
    _Block_object_dispose(&v24, 8);

    goto LABEL_18;
  }
  v11 = 0;
LABEL_19:

  return v11;
}

void __86__CalLocationAuthorization_authorizationForBundleIdentifier_bundle_createIfNecessary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  CalLocationAuthorization *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (*(_QWORD *)(a1 + 32))
  {
    os_unfair_lock_lock((os_unfair_lock_t)&instancesDictionaryLock);
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    os_unfair_lock_unlock((os_unfair_lock_t)&instancesDictionaryLock);
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v5 = [CalLocationAuthorization alloc];
    v6 = -[CalLocationAuthorization initWithBundleID:bundle:queue:](v5, "initWithBundleID:bundle:queue:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), locationAuthorizationQueue);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    if (*(_QWORD *)(a1 + 32))
    {
      os_unfair_lock_lock((os_unfair_lock_t)&instancesDictionaryLock);
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 32));
      os_unfair_lock_unlock((os_unfair_lock_t)&instancesDictionaryLock);
    }
  }
}

- (CalLocationAuthorization)initWithBundleID:(id)a3 bundle:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  CalLocationAuthorization *v11;
  CalLocationAuthorization *v12;
  void *v13;
  dispatch_group_t v14;
  OS_dispatch_group *initializationGroup;
  void *v16;
  void *v17;
  uint64_t v18;
  CalLocationAuthorizationStatus *v19;
  CalLocationAuthorizationStatus *status;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  CLLocationManager *locationManager;
  uint64_t v27;
  objc_super v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2(v10);
  v29.receiver = self;
  v29.super_class = (Class)CalLocationAuthorization;
  v11 = -[CalLocationAuthorization init](&v29, sel_init);
  v12 = v11;
  if (v11)
  {
    if (v9)
      v13 = v9;
    else
      v13 = v8;
    objc_storeStrong(&v11->_bundleOrBundleIdentifier, v13);
    v14 = dispatch_group_create();
    initializationGroup = v12->_initializationGroup;
    v12->_initializationGroup = (OS_dispatch_group *)v14;

    v16 = (void *)MEMORY[0x1E0C9E3C8];
    if (v9)
    {
      objc_msgSend(v9, "bundlePath");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "authorizationStatusForBundlePath:", v17);

    }
    else
    {
      v18 = objc_msgSend(MEMORY[0x1E0C9E3C8], "authorizationStatusForBundleIdentifier:", v8);
    }
    if ((int)v18 >= 3)
      dispatch_group_enter((dispatch_group_t)v12->_initializationGroup);
    v19 = -[CalLocationAuthorizationStatus initWithStatus:precision:]([CalLocationAuthorizationStatus alloc], "initWithStatus:precision:", v18, (int)v18 < 3);
    status = v12->_status;
    v12->_status = v19;

    objc_msgSend((id)objc_opt_class(), "logHandle");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v31 = v8;
      v32 = 1024;
      v33 = v18;
      _os_log_impl(&dword_18FC12000, v21, OS_LOG_TYPE_DEFAULT, "Got initial location auth status for %{public}@ = %d", buf, 0x12u);
    }

    v12->_initializedTimestamp = CalApproximateContinuousTime();
    v22 = objc_alloc(MEMORY[0x1E0C9E3C8]);
    v23 = v22;
    if (v9)
    {
      objc_msgSend(v9, "bundlePath");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "initWithEffectiveBundlePath:delegate:onQueue:", v24, v12, v10);
      locationManager = v12->_locationManager;
      v12->_locationManager = (CLLocationManager *)v25;

    }
    else
    {
      v27 = objc_msgSend(v22, "initWithEffectiveBundleIdentifier:delegate:onQueue:", v8, v12, v10);
      v24 = v12->_locationManager;
      v12->_locationManager = (CLLocationManager *)v27;
    }

  }
  return v12;
}

- (id)authorizationStatus
{
  os_unfair_lock_s *p_lock;
  CalLocationAuthorizationStatus *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_status;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  id bundleOrBundleIdentifier;
  int v8;
  _BOOL4 v9;
  uint64_t v10;
  CalLocationAuthorizationStatus *v11;
  unint64_t v12;
  uint64_t v13;
  double v14;
  os_log_type_t v15;
  NSObject *v16;
  const __CFString *v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  const __CFString *v24;
  id v25;
  uint8_t buf[4];
  double v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "authorizationStatus");
  objc_msgSend((id)objc_opt_class(), "logHandle");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    bundleOrBundleIdentifier = self->_bundleOrBundleIdentifier;
    *(_DWORD *)buf = 138543618;
    v27 = *(double *)&bundleOrBundleIdentifier;
    v28 = 1024;
    v29 = v5;
    _os_log_impl(&dword_18FC12000, v6, OS_LOG_TYPE_DEFAULT, "Got updated location auth status for %{public}@ = %d", buf, 0x12u);
  }

  v8 = objc_msgSend(v4, "_limitsPrecision");
  v9 = 1;
  if (v8)
    v10 = 1;
  else
    v10 = 2;
  v11 = -[CalLocationAuthorizationStatus initWithStatus:precision:]([CalLocationAuthorizationStatus alloc], "initWithStatus:precision:", v5, v10);
  os_unfair_lock_lock(&self->_lock);
  v12 = -[CalLocationAuthorizationStatus precision](self->_status, "precision");
  if (-[CalLocationAuthorizationStatus status](self->_status, "status") == (_DWORD)v5)
    v9 = -[CalLocationAuthorizationStatus precision](self->_status, "precision") != v10;
  objc_storeStrong((id *)&self->_status, v11);
  if (!self->_firstCallbackReceivedTimestamp)
  {
    self->_firstCallbackReceivedTimestamp = CalApproximateContinuousTime();
    v13 = CalApproximateContinuousTime();
    v14 = CalContinuousIntervalToNSTimeInterval(v13 - self->_initializedTimestamp);
    if (v14 <= 20.0)
      v15 = OS_LOG_TYPE_INFO;
    else
      v15 = OS_LOG_TYPE_ERROR;
    +[CalLocationAuthorization logHandle](CalLocationAuthorization, "logHandle");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, v15))
    {
      *(_DWORD *)buf = 134217984;
      v27 = v14;
      _os_log_impl(&dword_18FC12000, v16, v15, "It took %f seconds for CLLocationManager to deliver its first callback", buf, 0xCu);
    }

  }
  os_unfair_lock_unlock(&self->_lock);
  if (v12)
  {
    if (!v9)
      goto LABEL_25;
  }
  else
  {
    dispatch_group_leave((dispatch_group_t)self->_initializationGroup);
    if (!v9)
      goto LABEL_25;
  }
  if (locationManagerDidChangeAuthorization__onceToken != -1)
    dispatch_once(&locationManagerDidChangeAuthorization__onceToken, &__block_literal_global_31);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = CFSTR("CalLocationAuthorizationBundleIdentifierKey");
  else
    v17 = CFSTR("CalLocationAuthorizationBundleKey");
  v18 = self->_bundleOrBundleIdentifier;
  v24 = v17;
  v25 = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = locationManagerDidChangeAuthorization__notificationQueue;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __66__CalLocationAuthorization_locationManagerDidChangeAuthorization___block_invoke_2;
  v22[3] = &unk_1E2A83E68;
  v22[4] = self;
  v23 = v19;
  v21 = v19;
  dispatch_async(v20, v22);

LABEL_25:
}

void __66__CalLocationAuthorization_locationManagerDidChangeAuthorization___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.CalendarFoundation.CalLocationAuthorization.Notification", v2);
  v1 = (void *)locationManagerDidChangeAuthorization__notificationQueue;
  locationManagerDidChangeAuthorization__notificationQueue = (uint64_t)v0;

}

void __66__CalLocationAuthorization_locationManagerDidChangeAuthorization___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("CalLocationAuthorizationChangedNotification"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (unint64_t)waitForPrecision
{
  os_unfair_lock_s *p_lock;
  unint64_t v4;
  uint64_t v5;
  double v6;
  dispatch_time_t v7;
  NSObject *v8;
  CalABCReporter *v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[CalLocationAuthorizationStatus precision](self->_status, "precision");
  if (!v4)
  {
    if (self->_firstCallbackReceivedTimestamp
      || (v5 = CalApproximateContinuousTime(),
          v6 = 60.0 - CalContinuousIntervalToNSTimeInterval(v5 - self->_initializedTimestamp),
          v6 <= 0.0)
      || (v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0)),
          os_unfair_lock_unlock(p_lock),
          dispatch_group_wait((dispatch_group_t)self->_initializationGroup, v7),
          os_unfair_lock_lock(p_lock),
          (v4 = -[CalLocationAuthorizationStatus precision](self->_status, "precision")) == 0))
    {
      if (!self->_failedToInitializePrecision)
      {
        self->_failedToInitializePrecision = 1;
        +[CalLocationAuthorization logHandle](CalLocationAuthorization, "logHandle");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
          -[CalLocationAuthorization waitForPrecision].cold.1((uint64_t)self, v8);

        v9 = -[CalABCReporter initWithType:subtype:context:]([CalABCReporter alloc], "initWithType:subtype:context:", CFSTR("Foundation"), CFSTR("Location"), CFSTR("Precision Timeout"));
        -[CalABCReporter report](v9, "report");

      }
      v4 = 0;
    }
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

+ (void)ttlLocationStatusWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  dispatch_block_t v9;
  NSObject *v10;
  _QWORD block[4];
  void (**v12)(_QWORD);
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__CalLocationAuthorization_ttlLocationStatusWithCompletion___block_invoke;
  v13[3] = &unk_1E2A83E90;
  v15 = a1;
  v6 = v4;
  v14 = v6;
  v7 = (void (**)(_QWORD))MEMORY[0x19400A168](v13);
  objc_msgSend(a1, "_cachedInstanceForBundleID:bundle:", CFSTR("com.apple.mobilecal"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v7[2](v7);
  }
  else
  {
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __60__CalLocationAuthorization_ttlLocationStatusWithCompletion___block_invoke_2;
    block[3] = &unk_1E2A83DD8;
    v12 = v7;
    v9 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    objc_msgSend(a1, "locationAuthorizationAsyncCallersQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v10, v9);

  }
}

uint64_t __60__CalLocationAuthorization_ttlLocationStatusWithCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "ttlLocationStatus");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__CalLocationAuthorization_ttlLocationStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (unint64_t)ttlLocationStatus
{
  void *v3;
  int v4;
  unint64_t v5;

  if (+[CalLocationAuthorization authorizationStatusForBundleIdentifier:](CalLocationAuthorization, "authorizationStatusForBundleIdentifier:", CFSTR("com.apple.mobilecal")) < 3)return 1;
  +[CalLocationBundle bundle](CalLocationBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[CalLocationAuthorization authorizationStatusForBundle:](CalLocationAuthorization, "authorizationStatusForBundle:", v3);

  if (v4 != 3)
    return 3;
  v5 = +[CalLocationAuthorization locationPrecisionForBundleIdentifier:](CalLocationAuthorization, "locationPrecisionForBundleIdentifier:", CFSTR("com.apple.mobilecal"));
  if (v5 == 1)
    return 2;
  else
    return 4 * (v5 != 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_initializationGroup, 0);
  objc_storeStrong(&self->_bundleOrBundleIdentifier, 0);
}

void __63__CalLocationAuthorization_initializeQueueAndInstancesIfNeeded__block_invoke_cold_1(os_log_t log)
{
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138543362;
  v2 = CFSTR("com.apple.locationd.effective_bundle");
  _os_log_error_impl(&dword_18FC12000, log, OS_LOG_TYPE_ERROR, "Need the '%{public}@' entitlement in order to determine if current process has location authorization", (uint8_t *)&v1, 0xCu);
}

+ (void)authorizationForBundleIdentifier:(os_log_t)log bundle:createIfNecessary:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18FC12000, log, OS_LOG_TYPE_FAULT, "Attempted to get location authorization with neither bundle nor bundleID", v1, 2u);
}

- (void)waitForPrecision
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 8);
  v5 = CalApproximateContinuousTime();
  v6 = CalContinuousIntervalToNSTimeInterval(v5 - *(_QWORD *)(a1 + 48));
  v7 = 138412546;
  v8 = v4;
  v9 = 2048;
  v10 = v6;
  _os_log_fault_impl(&dword_18FC12000, a2, OS_LOG_TYPE_FAULT, "Timed out waiting on location precision for bundle %@ (initialization was %f seconds ago)", (uint8_t *)&v7, 0x16u);
}

@end
