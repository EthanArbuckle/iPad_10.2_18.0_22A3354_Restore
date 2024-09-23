@implementation HMDBiomeEventManager

- (HMDBiomeEventManager)initWithNotificationCenter:(id)a3 actionSetStream:(id)a4 mediaAccessoryStream:(id)a5 accessoryStream:(id)a6 prunableStreamFactory:(id)a7 workQueue:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  HMDBiomeEventManager *v19;
  HMDBiomeEventManager *v20;
  void *v21;
  id prunableStreamFactory;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v28 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v30.receiver = self;
  v30.super_class = (Class)HMDBiomeEventManager;
  v19 = -[HMDBiomeEventManager init](&v30, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_workQueue, a8);
    objc_storeStrong((id *)&v20->_notificationCenter, a3);
    objc_storeStrong((id *)&v20->_actionSetStream, a4);
    objc_storeStrong((id *)&v20->_mediaAccessoryStream, a5);
    objc_storeStrong((id *)&v20->_hapAccessoryStream, a6);
    v21 = _Block_copy(v17);
    prunableStreamFactory = v20->_prunableStreamFactory;
    v20->_prunableStreamFactory = v21;

    -[HMDBiomeEventManager notificationCenter](v20, "notificationCenter", v28, v29);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v20, sel__handleAccessoryRemovedNotification_, CFSTR("HMDHomeAccessoryRemovedNotification"), 0);

    -[HMDBiomeEventManager notificationCenter](v20, "notificationCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v20, sel__handleActionSetEmptiedNotification_, CFSTR("HMDHomeActionSetEmptiedNotification"), 0);

    -[HMDBiomeEventManager notificationCenter](v20, "notificationCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v20, sel__handleServiceRemovedNotification_, CFSTR("HMDHomeServiceRemovedNotification"), 0);

    -[HMDBiomeEventManager notificationCenter](v20, "notificationCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v20, sel__handleHomeRemovedNotification_, CFSTR("HMDHomeRemovedNotification"), 0);

  }
  return v20;
}

- (HMDBiomeEventManager)init
{
  id v3;
  const char *v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  HMDBiomeEventManager *v12;

  HMDispatchQueueNameString();
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_BACKGROUND, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_queue_create(v4, v6);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0D02668]);
  v10 = objc_alloc_init(MEMORY[0x1E0D02680]);
  v11 = objc_alloc_init(MEMORY[0x1E0D02658]);
  v12 = -[HMDBiomeEventManager initWithNotificationCenter:actionSetStream:mediaAccessoryStream:accessoryStream:prunableStreamFactory:workQueue:](self, "initWithNotificationCenter:actionSetStream:mediaAccessoryStream:accessoryStream:prunableStreamFactory:workQueue:", v8, v9, v10, v11, &__block_literal_global_76921, v7);

  return v12;
}

- (void)_handleHomeRemovedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  HMDBiomeEventManager *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("HMDHomeNotificationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    -[HMDBiomeEventManager workQueue](self, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __55__HMDBiomeEventManager__handleHomeRemovedNotification___block_invoke;
    v14[3] = &unk_1E89C2328;
    v14[4] = self;
    v15 = v8;
    dispatch_async(v9, v14);

  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v13;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@No home found for home accessory notification: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)_handleAccessoryRemovedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  HMDBiomeEventManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDBiomeEventManager *v18;
  NSObject *v19;
  void *v20;
  _QWORD block[5];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("HMDAccessoryNotificationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v4, "object");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (v11)
    {
      -[HMDBiomeEventManager workQueue](self, "workQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__HMDBiomeEventManager__handleAccessoryRemovedNotification___block_invoke;
      block[3] = &unk_1E89C20C8;
      block[4] = self;
      v22 = v8;
      v23 = v11;
      dispatch_async(v12, block);

    }
    else
    {
      v17 = (void *)MEMORY[0x1D17BA0A0]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v25 = v20;
        v26 = 2112;
        v27 = v4;
        v28 = 2112;
        v29 = v8;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@No home found for removed accessory notification: %@ for accessory: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
    }

  }
  else
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v16;
      v26 = 2112;
      v27 = v4;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@No accessory found for removed accessory notification: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (void)_handleServiceRemovedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  HMDBiomeEventManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDBiomeEventManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDBiomeEventManager *v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("HMDServiceNotificationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v8, "accessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "home");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[HMDBiomeEventManager workQueue](self, "workQueue");
        v12 = objc_claimAutoreleasedReturnValue();
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __58__HMDBiomeEventManager__handleServiceRemovedNotification___block_invoke;
        v25[3] = &unk_1E89C07B8;
        v25[4] = self;
        v26 = v8;
        v27 = v10;
        v28 = v11;
        dispatch_async(v12, v25);

      }
      else
      {
        v21 = (void *)MEMORY[0x1D17BA0A0]();
        v22 = self;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v30 = v24;
          v31 = 2112;
          v32 = v4;
          v33 = 2112;
          v34 = v8;
          v35 = 2112;
          v36 = v10;
          _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@No home found for removed service notification: %@ for service: %@ on accessory: %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v21);
      }

    }
    else
    {
      v17 = (void *)MEMORY[0x1D17BA0A0]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v30 = v20;
        v31 = 2112;
        v32 = v4;
        v33 = 2112;
        v34 = v8;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@No accessory found for removed service notification: %@ for service: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
    }

  }
  else
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v16;
      v31 = 2112;
      v32 = v4;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@No service found for removed service notification: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (void)_handleActionSetEmptiedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMDBiomeEventManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDBiomeEventManager *v16;
  NSObject *v17;
  void *v18;
  _QWORD block[5];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("HMDActionSetNotificationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v8, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[HMDBiomeEventManager workQueue](self, "workQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__HMDBiomeEventManager__handleActionSetEmptiedNotification___block_invoke;
      block[3] = &unk_1E89C20C8;
      block[4] = self;
      v20 = v8;
      v21 = v9;
      dispatch_async(v10, block);

    }
    else
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v23 = v18;
        v24 = 2112;
        v25 = v4;
        v26 = 2112;
        v27 = v8;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@No home found for emptied action set notification: %@ for action set: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v15);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v14;
      v24 = 2112;
      v25 = v4;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@No action set found for emptied action set notification: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)fetchMostRecentEventWithCharacteristicType:(id)a3 serviceType:(id)a4 homeSPIClientIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  -[HMDBiomeEventManager workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __114__HMDBiomeEventManager_fetchMostRecentEventWithCharacteristicType_serviceType_homeSPIClientIdentifier_completion___block_invoke;
  v19[3] = &unk_1E89BDC18;
  objc_copyWeak(&v24, &location);
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, v19);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (void)deleteAllEvents
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[HMDBiomeEventManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__HMDBiomeEventManager_deleteAllEvents__block_invoke;
  v4[3] = &unk_1E89BE3F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)submitActionSetEvent:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDBiomeEventManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__HMDBiomeEventManager_submitActionSetEvent___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_submitActionSetEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMDBiomeEventManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDBiomeEventManager actionSetStream](self, "actionSetStream");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendEvent:", v4);

}

- (void)submitAccessoryEvent:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDBiomeEventManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__HMDBiomeEventManager_submitAccessoryEvent___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_submitAccessoryEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMDBiomeEventManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDBiomeEventManager hapAccessoryStream](self, "hapAccessoryStream");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendEvent:", v4);

}

- (void)submitMediaAccessoryEvent:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDBiomeEventManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__HMDBiomeEventManager_submitMediaAccessoryEvent___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_submitMediaAccessoryEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMDBiomeEventManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDBiomeEventManager mediaAccessoryStream](self, "mediaAccessoryStream");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendEvent:", v4);

}

- (BMHomeKitClientActionSetStream)actionSetStream
{
  return (BMHomeKitClientActionSetStream *)objc_getProperty(self, a2, 8, 1);
}

- (BMHomeKitClientMediaAccessoryControlStream)mediaAccessoryStream
{
  return (BMHomeKitClientMediaAccessoryControlStream *)objc_getProperty(self, a2, 16, 1);
}

- (BMHomeKitClientAccessoryControlStream)hapAccessoryStream
{
  return (BMHomeKitClientAccessoryControlStream *)objc_getProperty(self, a2, 24, 1);
}

- (id)prunableStreamFactory
{
  return objc_getProperty(self, a2, 32, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 40, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong(&self->_prunableStreamFactory, 0);
  objc_storeStrong((id *)&self->_hapAccessoryStream, 0);
  objc_storeStrong((id *)&self->_mediaAccessoryStream, 0);
  objc_storeStrong((id *)&self->_actionSetStream, 0);
}

uint64_t __50__HMDBiomeEventManager_submitMediaAccessoryEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_submitMediaAccessoryEvent:", *(_QWORD *)(a1 + 40));
}

uint64_t __45__HMDBiomeEventManager_submitAccessoryEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_submitAccessoryEvent:", *(_QWORD *)(a1 + 40));
}

uint64_t __45__HMDBiomeEventManager_submitActionSetEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_submitActionSetEvent:", *(_QWORD *)(a1 + 40));
}

void __39__HMDBiomeEventManager_deleteAllEvents__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[3];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v15 = WeakRetained;
    objc_msgSend(WeakRetained, "workQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    v3 = (void *)MEMORY[0x1D17BA0A0]();
    v4 = v15;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v6;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Deleting all events in biome", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v4, "hapAccessoryStream");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v7;
    objc_msgSend(v4, "mediaAccessoryStream");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v8;
    objc_msgSend(v4, "actionSetStream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, buf, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          -[HMDBiomeEventManager _deleteEventFromStartDate:toEndDate:stream:passingDeleteEventTest:](v4, *(void **)(*((_QWORD *)&v16 + 1) + 8 * v14++), &__block_literal_global_34);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, buf, 16);
      }
      while (v12);
    }

    WeakRetained = v15;
  }

}

- (void)_deleteEventFromStartDate:(void *)a3 toEndDate:stream:passingDeleteEventTest:
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void (**v21)(_QWORD, _QWORD);
  void *v22;
  id v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(a1, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = a1;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v41 = v11;
    v42 = 2112;
    v43 = 0;
    v44 = 2112;
    v45 = 0;
    v46 = 2112;
    v47 = v5;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Deleting matching biome events from: (%@) to: (%@) in stream: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v14 = v13;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  v17 = v16;

  v18 = (void *)MEMORY[0x1E0D01D20];
  objc_msgSend(v5, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "streamForStreamIdentifier:", v19);

  if (v20)
  {
    objc_msgSend(v9, "prunableStreamFactory");
    v21 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v21[2](v21, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = 0;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __90__HMDBiomeEventManager__deleteEventFromStartDate_toEndDate_stream_passingDeleteEventTest___block_invoke;
    v34[3] = &unk_1E89AF2A8;
    v35 = 0;
    v37 = v14;
    v38 = v17;
    v36 = v6;
    objc_msgSend(v22, "pruneEventsWithError:predicateBlock:", &v39, v34);
    v23 = v39;
    v24 = (void *)MEMORY[0x1D17BA0A0]();
    v25 = v9;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v41 = v27;
      v42 = 2112;
      v43 = 0;
      v44 = 2112;
      v45 = 0;
      v46 = 2112;
      v47 = v5;
      v48 = 2112;
      v49 = v28;
      v50 = 2112;
      v51 = v23;
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@Deleted matching biome events from: (%@) to: (%@) in stream: %@ with success: %@ (%@)", buf, 0x3Eu);

    }
    objc_autoreleasePoolPop(v24);

  }
  else
  {
    v29 = (void *)MEMORY[0x1D17BA0A0]();
    v30 = v9;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v32;
      v42 = 2112;
      v43 = v33;
      v44 = 2112;
      v45 = v5;
      _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to find public stream to prune for stream identifier: %@ of stream: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v29);
  }

}

uint64_t __90__HMDBiomeEventManager__deleteEventFromStartDate_toEndDate_stream_passingDeleteEventTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  double v6;
  _BOOL4 v7;
  double v8;
  uint64_t v9;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v3, "timestamp");
    v7 = v6 >= *(double *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v4, "timestamp");
      LOBYTE(v5) = v8 > *(double *)(a1 + 56);
    }
  }
  else
  {
    v7 = 1;
  }
  v9 = 0;
  if (v7 && (v5 & 1) == 0)
    v9 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return v9;
}

uint64_t __40__HMDBiomeEventManager__deleteAllEvents__block_invoke()
{
  return 1;
}

void __114__HMDBiomeEventManager_fetchMostRecentEventWithCharacteristicType_serviceType_homeSPIClientIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void (**v8)(id, void *);
  NSObject *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id WeakRetained;
  _QWORD v31[5];
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  _QWORD v47[2];
  _QWORD v48[4];

  v48[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v4 = *(void **)(a1 + 56);
  v29 = v2;
  v6 = v3;
  v7 = v5;
  v8 = v4;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v9);

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    v12 = v11;

    objc_msgSend(WeakRetained, "hapAccessoryStream");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "publisherFromStartTime:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = MEMORY[0x1E0C809B0];
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __115__HMDBiomeEventManager__fetchMostRecentEventWithCharacteristicType_serviceType_homeSPIClientIdentifier_completion___block_invoke;
    v43[3] = &unk_1E89AF0B0;
    v16 = v7;
    v44 = v16;
    v17 = v6;
    v45 = v17;
    v18 = v29;
    v46 = v18;
    objc_msgSend(v14, "filterWithIsIncluded:", v43);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "last");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__76889;
    v41 = __Block_byref_object_dispose__76890;
    v42 = 0;
    v32[0] = v15;
    v32[1] = 3221225472;
    v32[2] = __115__HMDBiomeEventManager__fetchMostRecentEventWithCharacteristicType_serviceType_homeSPIClientIdentifier_completion___block_invoke_28;
    v32[3] = &unk_1E89AF0D8;
    v36 = &v37;
    v32[4] = WeakRetained;
    v33 = v18;
    v34 = v17;
    v35 = v16;
    v31[0] = v15;
    v31[1] = 3221225472;
    v31[2] = __115__HMDBiomeEventManager__fetchMostRecentEventWithCharacteristicType_serviceType_homeSPIClientIdentifier_completion___block_invoke_30;
    v31[3] = &unk_1E89AF100;
    v31[4] = &v37;
    v21 = (id)objc_msgSend(v20, "sinkWithCompletion:shouldContinue:", v32, v31);
    if (v38[5])
    {
      v47[0] = CFSTR("HMDServiceSPIClientIdentifierKey");
      v22 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend((id)v38[5], "serviceUniqueIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v22, "initWithUUIDString:", v23);
      v47[1] = CFSTR("HMDAccessorySPIClientIdentifierKey");
      v48[0] = v24;
      v25 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend((id)v38[5], "accessoryUniqueIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v25, "initWithUUIDString:", v26);
      v48[1] = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v28 = (void *)MEMORY[0x1E0C9AA70];
    }
    v8[2](v8, v28);

    _Block_object_dispose(&v37, 8);
  }

}

uint64_t __115__HMDBiomeEventManager__fetchMostRecentEventWithCharacteristicType_serviceType_homeSPIClientIdentifier_completion___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)a1[4];
    objc_msgSend(v3, "base");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "homeUniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v5, "hmf_isEqualToUUIDString:", v7);

    v8 = (void *)a1[5];
    objc_msgSend(v4, "serviceType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v8, "isEqualToString:", v9);

    v10 = (void *)a1[6];
    objc_msgSend(v4, "characteristicType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v10, "isEqualToString:", v11);

    v12 = v5 & v8 & v10;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __115__HMDBiomeEventManager__fetchMostRecentEventWithCharacteristicType_serviceType_homeSPIClientIdentifier_completion___block_invoke_28(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) && objc_msgSend(v3, "state"))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 48);
      v13 = *(_QWORD *)(a1 + 56);
      v14 = 138544130;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Error fetching most revnet event of characeristic type: %@, service type: %@, in home with unique Identifier: %@", (uint8_t *)&v14, 0x2Au);

    }
    objc_autoreleasePoolPop(v7);
  }

}

uint64_t __115__HMDBiomeEventManager__fetchMostRecentEventWithCharacteristicType_serviceType_homeSPIClientIdentifier_completion___block_invoke_30(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "eventBody");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 0;
}

void __60__HMDBiomeEventManager__handleActionSetEmptiedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  _BYTE buf[24];
  void *v17;
  _BYTE v18[20];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "spiClientIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "spiClientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v3;
  v7 = v4;
  v8 = v5;
  v9 = v6;
  if (v2)
  {
    objc_msgSend(v2, "workQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v10);

    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = v2;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2112;
      v17 = v7;
      *(_WORD *)v18 = 2112;
      *(_QWORD *)&v18[2] = v8;
      *(_WORD *)&v18[10] = 2112;
      *(_QWORD *)&v18[12] = v9;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Deleting matching biome events for action set with uniqueIdentifier: %@, uuid: %@, in home with uniqueIdentifier: %@ uuid %@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v11);
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __113__HMDBiomeEventManager__deleteAllEventsForActionSetUniqueIdentifier_actionSetUUID_homeUniqueIdentifier_homeUUID___block_invoke;
    v17 = &unk_1E89AF208;
    *(_QWORD *)v18 = v15;
    *(_QWORD *)&v18[8] = v8;
    -[HMDBiomeEventManager _deleteActionSetEventsPassingTest:](v12, buf);

  }
}

uint64_t __113__HMDBiomeEventManager__deleteAllEventsForActionSetUniqueIdentifier_actionSetUUID_homeUniqueIdentifier_homeUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "actionSetUniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hmf_isEqualToUUIDString:", v5))
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(v3, "base");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "homeUniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "hmf_isEqualToUUIDString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_deleteActionSetEventsPassingTest:(void *)a1
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  objc_msgSend(a1, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  objc_msgSend(a1, "actionSetStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__HMDBiomeEventManager__deleteActionSetEventsPassingTest___block_invoke;
  v7[3] = &unk_1E89AF168;
  v6 = v3;
  v8 = v6;
  -[HMDBiomeEventManager _deleteEventFromStartDate:toEndDate:stream:passingDeleteEventTest:](a1, v5, v7);

}

uint64_t __58__HMDBiomeEventManager__deleteActionSetEventsPassingTest___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    v4 = 0;

  return v4;
}

void __58__HMDBiomeEventManager__handleServiceRemovedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  _BYTE buf[24];
  void *v21;
  _BYTE v22[30];
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "spiClientIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "spiClientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "spiClientIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v3;
  v9 = v4;
  v10 = v5;
  v11 = v6;
  v12 = v7;
  v13 = v8;
  if (v2)
  {
    objc_msgSend(v2, "workQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v14);

    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = v2;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      *(_QWORD *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2112;
      v21 = v11;
      *(_WORD *)v22 = 2112;
      *(_QWORD *)&v22[2] = v19;
      *(_WORD *)&v22[10] = 2112;
      *(_QWORD *)&v22[12] = v9;
      *(_WORD *)&v22[20] = 2112;
      *(_QWORD *)&v22[22] = v12;
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Deleting matching biome events for accessory's (uniqueIdentifier: %@ uuid: %@) service with uniqueIdentifier: %@, uuid: %@, in home with uniqueIdentifier: %@ uuid %@", buf, 0x48u);

    }
    objc_autoreleasePoolPop(v15);
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __167__HMDBiomeEventManager__deleteAllEventsForAccessoryServiceUniqueIdentifier_accessoryServiceUUID_accessoryUniqueIdentifier_accessoryUUID_homeUniqueIdentifier_homeUUID___block_invoke;
    v21 = &unk_1E89AF280;
    *(_QWORD *)v22 = v19;
    *(_QWORD *)&v22[8] = v10;
    *(_QWORD *)&v22[16] = v12;
    -[HMDBiomeEventManager _deleteAccessoryEventsPassingTest:](v16, buf);

  }
}

uint64_t __167__HMDBiomeEventManager__deleteAllEventsForAccessoryServiceUniqueIdentifier_accessoryServiceUUID_accessoryUniqueIdentifier_accessoryUUID_homeUniqueIdentifier_homeUUID___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a2;
  v4 = (void *)a1[4];
  objc_msgSend(v3, "serviceUniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hmf_isEqualToUUIDString:", v5))
  {
    v6 = (void *)a1[5];
    objc_msgSend(v3, "accessoryUniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "hmf_isEqualToUUIDString:", v7))
    {
      v8 = (void *)a1[6];
      objc_msgSend(v3, "base");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "homeUniqueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v8, "hmf_isEqualToUUIDString:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_deleteAccessoryEventsPassingTest:(void *)a1
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  objc_msgSend(a1, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  objc_msgSend(a1, "hapAccessoryStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__HMDBiomeEventManager__deleteAccessoryEventsPassingTest___block_invoke;
  v7[3] = &unk_1E89AF168;
  v6 = v3;
  v8 = v6;
  -[HMDBiomeEventManager _deleteEventFromStartDate:toEndDate:stream:passingDeleteEventTest:](a1, v5, v7);

}

uint64_t __58__HMDBiomeEventManager__deleteAccessoryEventsPassingTest___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    v4 = 0;

  return v4;
}

void __60__HMDBiomeEventManager__handleAccessoryRemovedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _BYTE buf[24];
  void *v23;
  _BYTE v24[20];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "spiClientIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "spiClientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v3;
  v7 = v4;
  v8 = v5;
  v9 = v6;
  if (v2)
  {
    objc_msgSend(v2, "workQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v10);

    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = v2;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2112;
      v23 = v7;
      *(_WORD *)v24 = 2112;
      *(_QWORD *)&v24[2] = v8;
      *(_WORD *)&v24[10] = 2112;
      *(_QWORD *)&v24[12] = v9;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Deleting matching biome events for accessory with uniqueIdentifier: %@, uuid: %@, in home with uniqueIdentifier: %@ uuid %@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v11);
    v15 = MEMORY[0x1E0C809B0];
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __113__HMDBiomeEventManager__deleteAllEventsForAccessoryUniqueIdentifier_accessoryUUID_homeUniqueIdentifier_homeUUID___block_invoke;
    v23 = &unk_1E89AF230;
    v16 = v18;
    *(_QWORD *)v24 = v16;
    v17 = v8;
    *(_QWORD *)&v24[8] = v17;
    -[HMDBiomeEventManager _deleteAccessoryEventsPassingTest:](v12, buf);
    v19[0] = v15;
    v19[1] = 3221225472;
    v19[2] = __113__HMDBiomeEventManager__deleteAllEventsForAccessoryUniqueIdentifier_accessoryUUID_homeUniqueIdentifier_homeUUID___block_invoke_2;
    v19[3] = &unk_1E89AF258;
    v20 = v16;
    v21 = v17;
    -[HMDBiomeEventManager _deleteMediaAccessoryEventsPassingTest:](v12, v19);

  }
}

uint64_t __113__HMDBiomeEventManager__deleteAllEventsForAccessoryUniqueIdentifier_accessoryUUID_homeUniqueIdentifier_homeUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "accessoryUniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hmf_isEqualToUUIDString:", v5))
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(v3, "base");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "homeUniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "hmf_isEqualToUUIDString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __113__HMDBiomeEventManager__deleteAllEventsForAccessoryUniqueIdentifier_accessoryUUID_homeUniqueIdentifier_homeUUID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "accessoryUniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hmf_isEqualToUUIDString:", v5))
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(v3, "base");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "homeUniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "hmf_isEqualToUUIDString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_deleteMediaAccessoryEventsPassingTest:(void *)a1
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  objc_msgSend(a1, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  objc_msgSend(a1, "mediaAccessoryStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__HMDBiomeEventManager__deleteMediaAccessoryEventsPassingTest___block_invoke;
  v7[3] = &unk_1E89AF168;
  v6 = v3;
  v8 = v6;
  -[HMDBiomeEventManager _deleteEventFromStartDate:toEndDate:stream:passingDeleteEventTest:](a1, v5, v7);

}

uint64_t __63__HMDBiomeEventManager__deleteMediaAccessoryEventsPassingTest___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    v4 = 0;

  return v4;
}

void __55__HMDBiomeEventManager__handleHomeRemovedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _BYTE buf[24];
  void *v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "spiClientIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v3;
  v5 = v4;
  if (v2)
  {
    objc_msgSend(v2, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = v2;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2112;
      v20 = v5;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Deleting matching biome events for home with uniqueIdentifier: %@, uuid: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    v11 = MEMORY[0x1E0C809B0];
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __73__HMDBiomeEventManager__deleteAllEventsForHomeUniqueIdentifier_homeUUID___block_invoke;
    v20 = &unk_1E89AF190;
    v12 = v14;
    v21 = v12;
    -[HMDBiomeEventManager _deleteActionSetEventsPassingTest:](v8, buf);
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __73__HMDBiomeEventManager__deleteAllEventsForHomeUniqueIdentifier_homeUUID___block_invoke_2;
    v17[3] = &unk_1E89AF1B8;
    v13 = v12;
    v18 = v13;
    -[HMDBiomeEventManager _deleteAccessoryEventsPassingTest:](v8, v17);
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __73__HMDBiomeEventManager__deleteAllEventsForHomeUniqueIdentifier_homeUUID___block_invoke_3;
    v15[3] = &unk_1E89AF1E0;
    v16 = v13;
    -[HMDBiomeEventManager _deleteMediaAccessoryEventsPassingTest:](v8, v15);

  }
}

uint64_t __73__HMDBiomeEventManager__deleteAllEventsForHomeUniqueIdentifier_homeUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "base");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeUniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "hmf_isEqualToUUIDString:", v4);

  return v5;
}

uint64_t __73__HMDBiomeEventManager__deleteAllEventsForHomeUniqueIdentifier_homeUUID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "base");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeUniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "hmf_isEqualToUUIDString:", v4);

  return v5;
}

uint64_t __73__HMDBiomeEventManager__deleteAllEventsForHomeUniqueIdentifier_homeUUID___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "base");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeUniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "hmf_isEqualToUUIDString:", v4);

  return v5;
}

id __28__HMDBiomeEventManager_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D02790]), "initWithPublicStream:", a2);
}

@end
