@implementation HMFLocationAuthorization

+ (id)logCategory
{
  if (qword_1ED012E70 != -1)
    dispatch_once(&qword_1ED012E70, &__block_literal_global_48);
  return (id)qword_1ED012E78;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("isAuthorized");
  v7[1] = CFSTR("authorized");
  v7[2] = CFSTR("isMonitoring");
  v7[3] = CFSTR("monitoring");
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", v7, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "containsObject:", v4);

  return v3 ^ 1;
}

- (void)registerObserver:(id)a3
{
  id v4;
  void *v5;
  HMFLocationAuthorization *v6;
  NSObject *v7;
  void *v8;
  HMFObjectObserver *v9;
  os_unfair_lock_s *p_lock;
  HMFLocationAuthorization *v11;
  HMFLocationAuthorization *v12;
  NSObject *v13;
  void *v14;
  NSObject *queue;
  void *context;
  _QWORD v17[4];
  id v18;
  id v19;
  id from;
  id location;
  _BYTE buf[24];
  void *v23;
  HMFLocationAuthorization *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1A1AC355C]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v4;
      _os_log_impl(&dword_19B546000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Registering location authorization observer: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v9 = -[HMFObjectObserver initWithObservedObject:]([HMFObjectObserver alloc], "initWithObservedObject:", v4);
    p_lock = &v6->_lock.lock;
    os_unfair_lock_lock_with_options();
    if ((-[NSMutableSet containsObject:](v6->_observers, "containsObject:", v9) & 1) == 0)
    {
      objc_initWeak(&location, v6);
      objc_initWeak(&from, v9);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __45__HMFLocationAuthorization_registerObserver___block_invoke;
      v17[3] = &unk_1E3B38218;
      objc_copyWeak(&v18, &location);
      objc_copyWeak(&v19, &from);
      -[HMFObjectObserver setDeallocationBlock:](v9, "setDeallocationBlock:", v17);
      -[NSMutableSet addObject:](v6->_observers, "addObject:", v9);
      v11 = v6;
      if (!v11->_state)
      {
        context = (void *)MEMORY[0x1A1AC355C]();
        v12 = v11;
        HMFGetOSLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier(v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v14;
          _os_log_impl(&dword_19B546000, v13, OS_LOG_TYPE_INFO, "%{public}@Starting to monitor location authorization", buf, 0xCu);

        }
        objc_autoreleasePoolPop(context);
        v12->_state = 1;
        if (!qword_1ED012E88)
        {
          *(_OWORD *)buf = xmmword_1E3B382F8;
          *(_QWORD *)&buf[16] = 0;
          qword_1ED012E88 = _sl_dlopen();
        }
        if (qword_1ED012E88)
        {
          queue = v12->_queue;
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = ____HMFLocationAuthorizationStartMonitoring_block_invoke;
          v23 = &unk_1E3B37AF8;
          v24 = v12;
          dispatch_async(queue, buf);

        }
      }

      objc_destroyWeak(&v19);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    os_unfair_lock_unlock(p_lock);

  }
}

void __45__HMFLocationAuthorization_registerObserver___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  char *v7;
  NSObject *v8;
  void *v9;
  os_unfair_lock_s *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = v4;
  if (WeakRetained && v4)
  {
    v6 = (void *)MEMORY[0x1A1AC355C]();
    v7 = (char *)WeakRetained;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v9;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_19B546000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Observer deallocated, stopping monitoring for observer: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    v10 = (os_unfair_lock_s *)(v7 + 8);
    os_unfair_lock_lock_with_options();
    objc_msgSend(*((id *)v7 + 5), "removeObject:", v5);
    if (objc_msgSend(*((id *)v7 + 5), "hmf_isEmpty"))
    {
      v11 = *((_QWORD *)v7 + 8);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__HMFLocationAuthorization_registerObserver___block_invoke_39;
      block[3] = &unk_1E3B37BF8;
      objc_copyWeak(&v13, v2);
      dispatch_async(v11, block);
      objc_destroyWeak(&v13);
    }
    os_unfair_lock_unlock(v10);
  }

}

- (HMFLocationAuthorization)initWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  HMFLocationAuthorization *v6;
  uint64_t v7;
  NSString *bundleIdentifier;
  objc_super v10;

  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure(CFSTR("bundleIdentifier"));
  v5 = v4;
  v10.receiver = self;
  v10.super_class = (Class)HMFLocationAuthorization;
  v6 = -[HMFLocationAuthorization init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v7;

    __HMFLocationAuthorizationInitialize(v6);
  }

  return v6;
}

void __47__HMFLocationAuthorization_sharedAuthorization__block_invoke()
{
  HMFLocationAuthorization *v0;
  void *v1;

  v0 = objc_alloc_init(HMFLocationAuthorization);
  v1 = (void *)qword_1ED012E68;
  qword_1ED012E68 = (uint64_t)v0;

}

- (HMFLocationAuthorization)init
{
  HMFLocationAuthorization *v2;
  HMFLocationAuthorization *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMFLocationAuthorization;
  v2 = -[HMFLocationAuthorization init](&v5, sel_init);
  v3 = v2;
  if (v2)
    __HMFLocationAuthorizationInitialize(v2);
  return v3;
}

void __68__HMFLocationAuthorization__requestAuthorization_completionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(_QWORD *)(a1 + 32))
  {
    v4 = objc_loadWeakRetained((id *)(a1 + 48));
    v5 = v4;
    if (v4)
      objc_msgSend(v4, "error");
    else
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__HMFLocationAuthorization__requestAuthorization_completionHandler___block_invoke_2;
    block[3] = &unk_1E3B37BF8;
    objc_copyWeak(&v9, v2);
    dispatch_async(v7, block);

    objc_destroyWeak(&v9);
  }

}

- (void)_requestAuthorization:(int64_t)a3 completionHandler:(id)a4
{
  void (**v6)(id, void *);
  NSObject *v7;
  void *v8;
  void *v9;
  HMFLocationAuthorization *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMFLocationAuthorization *v14;
  NSObject *v15;
  void *v16;
  __HMFLocationAuthorizationRequest *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  void (**v23)(id, void *);
  id v24;
  id v25;
  id location;
  _BYTE buf[24];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a4;
  -[HMFLocationAuthorization queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (!qword_1ED012E88)
  {
    *(_OWORD *)buf = xmmword_1E3B382F8;
    *(_QWORD *)&buf[16] = 0;
    qword_1ED012E88 = _sl_dlopen();
  }
  if (qword_1ED012E88)
  {
    if (self->_request)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 9, CFSTR("Location authorization in progress"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)MEMORY[0x1A1AC355C]();
        v10 = self;
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier(v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v12;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v8;
          _os_log_impl(&dword_19B546000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to request authorization with error: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v9);
        if (v6)
          v6[2](v6, v8);
      }
    }
    else
    {
      v17 = -[__HMFLocationAuthorizationRequest initWithType:authorization:]([__HMFLocationAuthorizationRequest alloc], "initWithType:authorization:", a3, self);
      -[HMFOperation setQualityOfService:](v17, "setQualityOfService:", 17);
      objc_initWeak((id *)buf, self);
      objc_initWeak(&location, v17);
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __68__HMFLocationAuthorization__requestAuthorization_completionHandler___block_invoke;
      v22 = &unk_1E3B38290;
      objc_copyWeak(&v24, (id *)buf);
      v23 = v6;
      objc_copyWeak(&v25, &location);
      -[__HMFLocationAuthorizationRequest setCompletionBlock:](v17, "setCompletionBlock:", &v19);
      objc_storeStrong((id *)&self->_request, v17);
      v18 = -[HMFScheduler performOperation:](self->_scheduler, "performOperation:", v17, v19, v20, v21, v22);
      objc_destroyWeak(&v25);

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);

      v8 = 0;
    }
    goto LABEL_15;
  }
  v13 = (void *)MEMORY[0x1A1AC355C]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v16;
    _os_log_impl(&dword_19B546000, v15, OS_LOG_TYPE_ERROR, "%{public}@Location support not available, unable to request authorization", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v13);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 5, CFSTR("CoreLocation not available"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v8);
LABEL_15:

  }
}

- (void)requestAuthorization:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  -[HMFLocationAuthorization queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__HMFLocationAuthorization_requestAuthorization_completionHandler___block_invoke;
  block[3] = &unk_1E3B38268;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

- (OS_dispatch_queue)queue
{
  hmf_unfair_data_lock_s *p_lock;
  OS_dispatch_queue *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_queue;
  os_unfair_lock_unlock(&p_lock->lock);
  return v4;
}

void __68__HMFLocationAuthorization__requestAuthorization_completionHandler___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[6], "unregisterFromKVO");
    v2 = v3[6];
    v3[6] = 0;

    WeakRetained = v3;
  }

}

- (BOOL)isMonitoring
{
  HMFLocationAuthorization *v2;
  hmf_unfair_data_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_state == 2;
  os_unfair_lock_unlock(&p_lock->lock);
  return (char)v2;
}

- (BOOL)isAuthorized
{
  return -[HMFLocationAuthorization status](self, "status") - 3 < 2;
}

- (int)status
{
  hmf_unfair_data_lock_s *p_lock;
  int status;
  HMFLocationAuthorization *v5;
  int v6;
  NSString *bundlePath;
  id CLLocationManagerClass;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_state)
  {
    status = self->_status;
  }
  else
  {
    v5 = self;
    if (!qword_1ED012E88)
      qword_1ED012E88 = _sl_dlopen();
    if (qword_1ED012E88)
    {
      if (v5->_bundleIdentifier)
      {
        v6 = objc_msgSend(getCLLocationManagerClass(), "authorizationStatusForBundleIdentifier:", v5->_bundleIdentifier);
      }
      else
      {
        bundlePath = v5->_bundlePath;
        CLLocationManagerClass = getCLLocationManagerClass();
        if (bundlePath)
          v6 = objc_msgSend(CLLocationManagerClass, "authorizationStatusForBundlePath:", v5->_bundlePath);
        else
          v6 = objc_msgSend(CLLocationManagerClass, "authorizationStatus");
      }
      status = v6;
    }
    else
    {
      status = 0;
    }

    v5->_status = status;
  }
  os_unfair_lock_unlock(&p_lock->lock);
  return status;
}

- (CLLocationManager)internal
{
  return (CLLocationManager *)objc_getProperty(self, a2, 88, 1);
}

uint64_t __67__HMFLocationAuthorization_requestAuthorization_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestAuthorization:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

+ (id)sharedAuthorization
{
  if (_MergedGlobals_3_0 != -1)
    dispatch_once(&_MergedGlobals_3_0, &__block_literal_global_10);
  return (id)qword_1ED012E68;
}

void __39__HMFLocationAuthorization_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("Location.Authorization"), CFSTR("com.apple.HMFoundation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED012E78;
  qword_1ED012E78 = v0;

}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  uint32_t v5;
  void *v6;
  HMFLocationAuthorization *v7;
  NSObject *v8;
  void *v9;
  HMFLocationAuthorization *v10;
  os_unfair_lock_s *v11;
  unsigned int v12;
  uint32_t os_unfair_lock_opaque;
  int v14;
  uint64_t v15;
  void *v16;
  os_unfair_lock_s *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "authorizationStatus");
  v6 = (void *)MEMORY[0x1A1AC355C]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v9;
    v24 = 1024;
    LODWORD(v25) = v5;
    _os_log_impl(&dword_19B546000, v8, OS_LOG_TYPE_INFO, "%{public}@Received notification of authorization status changing to %d", (uint8_t *)&v22, 0x12u);

  }
  objc_autoreleasePoolPop(v6);
  v10 = v7;
  v11 = (os_unfair_lock_s *)v10;
  if (v10)
  {
    -[HMFLocationAuthorization willChangeValueForKey:](v10, "willChangeValueForKey:", CFSTR("isAuthorized"));
    v12 = v5 - 3;
    os_unfair_lock_lock_with_options();
    os_unfair_lock_opaque = v11[6]._os_unfair_lock_opaque;
    if (os_unfair_lock_opaque != v5)
      v11[6]._os_unfair_lock_opaque = v5;
    v14 = (v12 < 2) ^ (os_unfair_lock_opaque - 3 < 2);
    v15 = *(_QWORD *)&v11[8]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v11 + 2);
    -[os_unfair_lock_s didChangeValueForKey:](v11, "didChangeValueForKey:", CFSTR("isAuthorized"));
    if (v15 == 1)
      __HMFLocationAuthorizationUpdateState(v11, 2);
    if (v14)
    {
      v16 = (void *)MEMORY[0x1A1AC355C]();
      v17 = v11;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier(v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString(v12 < 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v19;
        v24 = 2112;
        v25 = v20;
        _os_log_impl(&dword_19B546000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Posting authorization updated notification with isAuthorized: %@", (uint8_t *)&v22, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      +[HMFNotificationCenter defaultCenter](HMFNotificationCenter, "defaultCenter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "postNotificationName:object:", CFSTR("HMFLocationAuthorizationUpdatedNotification"), v17);

    }
  }

}

void __54__HMFLocationAuthorization_locationOperationCompleted__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "unregisterFromKVO");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = 0;

}

void __33__HMFLocationAuthorization__mark__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "locationOperationCompleted");

}

uint64_t __32__HMFLocationAuthorization_mark__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mark");
}

- (void)mark
{
  NSObject *v3;
  _QWORD block[5];

  -[HMFLocationAuthorization queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__HMFLocationAuthorization_mark__block_invoke;
  block[3] = &unk_1E3B37AF8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)locationOperationCompleted
{
  void *v3;
  HMFLocationAuthorization *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC355C](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_19B546000, v5, OS_LOG_TYPE_DEBUG, "%{public}@completing location authorization mark", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMFLocationAuthorization queue](v4, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__HMFLocationAuthorization_locationOperationCompleted__block_invoke;
  block[3] = &unk_1E3B37AF8;
  block[4] = v4;
  dispatch_async(v7, block);

}

- (void)_mark
{
  NSObject *v3;
  __HMFLocationAuthorizationMarkOperation *v4;
  __HMFLocationAuthorizationMarkOperation *operation;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  -[HMFLocationAuthorization queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!self->_operation)
  {
    v4 = -[__HMFLocationManagerOperation initWithAuthorization:]([__HMFLocationAuthorizationMarkOperation alloc], "initWithAuthorization:", self);
    operation = self->_operation;
    self->_operation = v4;

    -[HMFOperation setQualityOfService:](self->_operation, "setQualityOfService:", 17);
    objc_initWeak(&location, self);
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __33__HMFLocationAuthorization__mark__block_invoke;
    v10 = &unk_1E3B37BF8;
    objc_copyWeak(&v11, &location);
    -[__HMFLocationAuthorizationMarkOperation setCompletionBlock:](self->_operation, "setCompletionBlock:", &v7);
    v6 = -[HMFScheduler performOperation:](self->_scheduler, "performOperation:", self->_operation, v7, v8, v9, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (HMFLocationAuthorization)initWithScheduler:(id)a3
{
  id v5;
  void *v6;
  HMFLocationAuthorization *v7;
  HMFLocationAuthorization *v8;
  objc_super v10;

  v5 = a3;
  if (!v5)
    _HMFPreconditionFailure(CFSTR("scheduler"));
  v6 = v5;
  v10.receiver = self;
  v10.super_class = (Class)HMFLocationAuthorization;
  v7 = -[HMFLocationAuthorization init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    __HMFLocationAuthorizationInitialize(v7);
    objc_storeStrong((id *)&v8->_scheduler, a3);
  }

  return v8;
}

- (HMFLocationAuthorization)initWithBundle:(id)a3
{
  id v4;
  void *v5;
  HMFLocationAuthorization *v6;
  uint64_t v7;
  NSString *bundlePath;
  objc_super v10;

  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure(CFSTR("bundle"));
  v5 = v4;
  v10.receiver = self;
  v10.super_class = (Class)HMFLocationAuthorization;
  v6 = -[HMFLocationAuthorization init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "bundlePath");
    v7 = objc_claimAutoreleasedReturnValue();
    bundlePath = v6->_bundlePath;
    v6->_bundlePath = (NSString *)v7;

    __HMFLocationAuthorizationInitialize(v6);
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  __HMFLocationAuthorizationStopMonitoring(self);
  v3.receiver = self;
  v3.super_class = (Class)HMFLocationAuthorization;
  -[HMFLocationAuthorization dealloc](&v3, sel_dealloc);
}

- (id)attributeDescriptions
{
  hmf_unfair_data_lock_s *p_lock;
  HMFAttributeDescription *v4;
  void *v5;
  HMFAttributeDescription *v6;
  HMFAttributeDescription *v7;
  void *v8;
  HMFAttributeDescription *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = [HMFAttributeDescription alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_state);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMFAttributeDescription initWithName:value:](v4, "initWithName:value:", CFSTR("State"), v5);
  v12[0] = v6;
  v7 = [HMFAttributeDescription alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_status);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMFAttributeDescription initWithName:value:](v7, "initWithName:value:", CFSTR("Status"), v8);
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&p_lock->lock);
  return v10;
}

- (void)setQueue:(id)a3
{
  void *v4;
  id v5;
  id obj;

  obj = a3;
  os_unfair_lock_lock_with_options();
  if (self->_state >= 1)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Cannot set queue once the location authorization has started."), 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v5);
  }
  v4 = obj;
  if (!obj)
  {
    __HMFLocationAuthorizationCreateQueue(&self->super.super);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&self->_queue, v4);
  if (!obj)

  os_unfair_lock_unlock(&self->_lock.lock);
}

void __45__HMFLocationAuthorization_registerObserver___block_invoke_39(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    __HMFLocationAuthorizationStopMonitoring(WeakRetained);
    WeakRetained = v2;
  }

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  void *v5;
  HMFLocationAuthorization *v6;
  NSObject *v7;
  void *v8;
  NSMutableSet *observers;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  NSObject *queue;
  _QWORD block[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1A1AC355C]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v8;
      v26 = 2112;
      v27 = v4;
      _os_log_impl(&dword_19B546000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unregistering location authorization observer: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    os_unfair_lock_lock_with_options();
    observers = v6->_observers;
    v10 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __47__HMFLocationAuthorization_unregisterObserver___block_invoke;
    v21[3] = &unk_1E3B38240;
    v22 = v4;
    -[NSMutableSet objectsPassingTest:](observers, "objectsPassingTest:", v21);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v11);
          -[NSMutableSet removeObject:](v6->_observers, "removeObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v12);
    }

    if (-[NSMutableSet hmf_isEmpty](v6->_observers, "hmf_isEmpty"))
    {
      queue = v6->_queue;
      block[0] = v10;
      block[1] = 3221225472;
      block[2] = __47__HMFLocationAuthorization_unregisterObserver___block_invoke_2;
      block[3] = &unk_1E3B37AF8;
      block[4] = v6;
      dispatch_async(queue, block);
    }

    os_unfair_lock_unlock(&v6->_lock.lock);
  }

}

BOOL __47__HMFLocationAuthorization_unregisterObserver___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "observedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

void __47__HMFLocationAuthorization_unregisterObserver___block_invoke_2(uint64_t a1)
{
  __HMFLocationAuthorizationStopMonitoring(*(void **)(a1 + 32));
}

- (id)logIdentifier
{
  NSString *bundleIdentifier;
  NSString *v3;
  void *v5;

  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier || (bundleIdentifier = self->_bundlePath) != 0)
  {
    v3 = bundleIdentifier;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "processName");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)bundlePath
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_bundlePath, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end
