@implementation HMDMediaAccessory

- (HMDMediaAccessory)initWithTransaction:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  HMDMediaAccessory *v12;
  uint64_t v13;
  NSNotificationCenter *notificationCenter;
  uint64_t v15;
  HMDMediaProfile *mediaProfile;
  HMDMediaAccessory *v17;
  HMDMediaAccessory *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  const char *v22;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (!v10)
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v21;
      v22 = "%{public}@Cannot initialize a media accessory without an media model.";
LABEL_13:
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, v22, buf, 0xCu);

    }
LABEL_14:

    objc_autoreleasePoolPop(v19);
    v18 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v21;
      v22 = "%{public}@The media identifier is required";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v24.receiver = self;
  v24.super_class = (Class)HMDMediaAccessory;
  v12 = -[HMDAccessory initWithTransaction:home:](&v24, sel_initWithTransaction_home_, v8, v7);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = objc_claimAutoreleasedReturnValue();
    notificationCenter = v12->_notificationCenter;
    v12->_notificationCenter = (NSNotificationCenter *)v13;

    -[HMDMediaAccessory _createMediaProfile](v12, "_createMediaProfile");
    v15 = objc_claimAutoreleasedReturnValue();
    mediaProfile = v12->_mediaProfile;
    v12->_mediaProfile = (HMDMediaProfile *)v15;

    -[NSMutableSet addObject:](v12->super._accessoryProfiles, "addObject:", v12->_mediaProfile);
  }
  v17 = v12;
  v18 = v17;
LABEL_15:

  return v18;
}

- (HMDMediaAccessory)init
{
  HMDMediaAccessory *v2;
  uint64_t v3;
  NSMutableSet *accessoryProfiles;
  uint64_t v5;
  NSNotificationCenter *notificationCenter;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDMediaAccessory;
  v2 = -[HMDAccessory init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    accessoryProfiles = v2->super._accessoryProfiles;
    v2->super._accessoryProfiles = (NSMutableSet *)v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = objc_claimAutoreleasedReturnValue();
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = (NSNotificationCenter *)v5;

  }
  return v2;
}

- (unint64_t)supportedTransports
{
  return 16;
}

- (void)_registerForMessages
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDMediaAccessory;
  -[HMDAccessory _registerForMessages](&v5, sel__registerForMessages);
  -[HMDMediaAccessory notificationCenter](self, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleRoomChanged_, CFSTR("HMDNotificationAccessoryChangedRoom"), self);

  -[HMDMediaAccessory notificationCenter](self, "notificationCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_handleRoomNameChanged_, CFSTR("HMDRoomNameUpdatedNotification"), 0);

}

- (BOOL)_shouldFilterAccessoryProfileForUnentitledClients:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HMDMediaAccessory;
    v5 = -[HMDAccessory _shouldFilterAccessoryProfileForUnentitledClients:](&v7, sel__shouldFilterAccessoryProfileForUnentitledClients_, v4);
  }

  return v5;
}

- (id)_createMediaProfile
{
  return -[HMDMediaProfile initWithAccessory:]([HMDMediaProfile alloc], "initWithAccessory:", self);
}

- (void)addAdvertisement:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  HMDMediaAccessory *v9;
  NSObject *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDMediaAccessory;
  -[HMDAccessory addAdvertisement:](&v12, sel_addAdvertisement_, v4);
  v5 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    -[HMDMediaAccessory setAdvertisement:](self, "setAdvertisement:", v7);
    -[HMDAccessory setReachable:](self, "setReachable:", 1);
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid added advertisement: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)removeAdvertisement:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  HMDMediaAccessory *v10;
  NSObject *v11;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDMediaAccessory;
  -[HMDAccessory removeAdvertisement:](&v13, sel_removeAdvertisement_, v4);
  v5 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    -[HMDMediaAccessory setAdvertisement:](self, "setAdvertisement:", 0);
    -[HMDMediaAccessory mediaProfile](self, "mediaProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMediaSession:", 0);

    -[HMDAccessory setReachable:](self, "setReachable:", 0);
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid removed advertisement: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (BOOL)providesHashRouteID
{
  return 1;
}

- (id)name
{
  __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[HMDAccessory configuredName](self, "configuredName");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory room](self, "room");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v3)
  {
    objc_msgSend(v4, "name");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
      v3 = (__CFString *)v6;
    else
      v3 = CFSTR("Media Accessory");
  }

  return v3;
}

- (id)transportReports
{
  return 0;
}

- (void)handleRoomNameChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    -[HMDAccessory room](self, "room");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = HMFEqualObjects();

    if (v8)
    {
      -[HMDAccessory getConfiguredName](self, "getConfiguredName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        objc_msgSend(v14, "userInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "hmf_stringForKey:", CFSTR("kRoomOldNameKey"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMDMediaAccessory name](self, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = HMFEqualObjects();

        if ((v13 & 1) == 0)
          -[HMDAccessory notifyAccessoryNameChanged:](self, "notifyAccessoryNameChanged:", 1);

      }
    }
  }

}

- (void)handleRoomChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory uuid](self, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if (v9)
    {
      -[HMDAccessory getConfiguredName](self, "getConfiguredName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        objc_msgSend(v15, "userInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "hmf_stringForKey:", CFSTR("kRoomOldNameKey"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMDMediaAccessory name](self, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = HMFEqualObjects();

        if ((v14 & 1) == 0)
          -[HMDAccessory notifyAccessoryNameChanged:](self, "notifyAccessoryNameChanged:", 1);

      }
    }
  }

}

- (HMDMediaAccessoryAdvertisement)advertisement
{
  HMDMediaAccessoryAdvertisement *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_advertisement;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setAdvertisement:(id)a3
{
  id v5;

  v5 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if ((HMFEqualObjects() & 1) != 0)
  {
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    objc_storeStrong((id *)&self->_advertisement, a3);
    os_unfair_recursive_lock_unlock();
    -[HMDMediaAccessory handleUpdatedAdvertisement:](self, "handleUpdatedAdvertisement:", v5);
  }

}

- (void)handleUpdatedAdvertisement:(id)a3
{
  id v4;
  void *v5;
  HMDMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Updated with advertisement: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)notifyConnectivityChangedWithReachabilityState:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HMDAccessory workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__HMDMediaAccessory_notifyConnectivityChangedWithReachabilityState___block_invoke;
  v6[3] = &unk_1E89C2758;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (void)setRemotelyReachable:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  int v6;

  v3 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (self->super._remotelyReachable == v3)
  {
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    v5 = self->super._remotelyReachable || self->super._reachable;
    self->super._remotelyReachable = v3;
    v6 = self->super._reachable || v3;
    os_unfair_recursive_lock_unlock();
    if (v5 != v6)
      -[HMDMediaAccessory notifyConnectivityChangedWithReachabilityState:](self, "notifyConnectivityChangedWithReachabilityState:", v6 != 0);
  }
}

- (int64_t)reachableTransports
{
  int64_t v3;
  void *v4;
  int v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDMediaAccessory;
  v3 = -[HMDAccessory reachableTransports](&v7, sel_reachableTransports);
  if (-[HMDAccessory isReachable](self, "isReachable"))
    v3 |= 0x10uLL;
  -[HMDAccessory home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isResidentSupported");

  if (v5 && -[HMDAccessory isRemotelyReachable](self, "isRemotelyReachable"))
    return v3 | 8;
  return v3;
}

- (id)transactionWithObjectChangeType:(unint64_t)a3
{
  HMDMediaAccessoryModel *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDMediaAccessoryModel *v9;

  v5 = [HMDMediaAccessoryModel alloc];
  -[HMDAccessory uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", a3, v6, v8);

  return v9;
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  id v28;
  void *v29;
  HMDMediaAccessory *v30;
  objc_super v31;
  objc_super v32;
  _QWORD aBlock[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    v28 = v8;
    v29 = v13;
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__60405;
    v38 = __Block_byref_object_dispose__60406;
    v39 = 0;
    objc_msgSend(v10, "responseHandler");
    v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __64__HMDMediaAccessory_transactionObjectUpdated_newValues_message___block_invoke;
      aBlock[3] = &unk_1E89B1078;
      aBlock[4] = &v34;
      v15 = _Block_copy(aBlock);
      objc_msgSend(v10, "setResponseHandler:", v15);

    }
    v32.receiver = self;
    v32.super_class = (Class)HMDMediaAccessory;
    -[HMDAccessory transactionObjectUpdated:newValues:message:](&v32, sel_transactionObjectUpdated_newValues_message_, 0, v11, v10);
    v30 = self;
    v16 = v29;
    v17 = v10;
    objc_msgSend(v17, "transactionResult");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "roomUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v16, "roomUUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v20, "initWithUUIDString:", v21);

      if (v22 && -[HMDAccessory _updateRoom:source:](v30, "_updateRoom:source:", v22, objc_msgSend(v18, "source")))
      {
        objc_msgSend(v18, "markChanged");
        objc_msgSend(v18, "markSaveToAssistant");
      }

    }
    objc_msgSend(v16, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      -[HMDAccessory identifier](v30, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqual:", v25);

      if ((v26 & 1) == 0)
      {
        objc_msgSend(v16, "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessory setIdentifier:](v30, "setIdentifier:", v27);

        objc_msgSend(v18, "markChanged");
        objc_msgSend(v18, "markSaveToAssistant");
      }
    }
    objc_msgSend(v17, "respondWithPayload:", 0);

    if (v14)
      v14[2](v14, v35[5], 0);

    _Block_object_dispose(&v34, 8);
    v8 = v28;
    v13 = v29;
  }
  else
  {
    v31.receiver = self;
    v31.super_class = (Class)HMDMediaAccessory;
    -[HMDAccessory transactionObjectUpdated:newValues:message:](&v31, sel_transactionObjectUpdated_newValues_message_, v8, v11, v10);
  }

}

- (id)dumpState
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HMDMediaAccessory;
  -[HMDAccessory dumpState](&v10, sel_dumpState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = *MEMORY[0x1E0D27F80];
  objc_msgSend(v4, "hmf_stringForKey:", *MEMORY[0x1E0D27F80]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(", identifier: %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, v5);
  return v4;
}

- (id)dumpSimpleState
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HMDMediaAccessory;
  -[HMDAccessory dumpSimpleState](&v10, sel_dumpSimpleState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = *MEMORY[0x1E0D27F80];
  objc_msgSend(v4, "hmf_stringForKey:", *MEMORY[0x1E0D27F80]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(", identifier: %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, v5);
  return v4;
}

- (HMDMediaAccessory)initWithCoder:(id)a3
{
  HMDMediaAccessory *v3;
  uint64_t v4;
  NSNotificationCenter *notificationCenter;
  uint64_t v6;
  HMDMediaProfile *mediaProfile;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMDMediaAccessory;
  v3 = -[HMDAccessory initWithCoder:](&v9, sel_initWithCoder_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = objc_claimAutoreleasedReturnValue();
    notificationCenter = v3->_notificationCenter;
    v3->_notificationCenter = (NSNotificationCenter *)v4;

    -[HMDMediaAccessory _createMediaProfile](v3, "_createMediaProfile");
    v6 = objc_claimAutoreleasedReturnValue();
    mediaProfile = v3->_mediaProfile;
    v3->_mediaProfile = (HMDMediaProfile *)v6;

    -[NSMutableSet addObject:](v3->super._accessoryProfiles, "addObject:", v3->_mediaProfile);
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)HMDMediaAccessory;
  -[HMDAccessory encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  if (objc_msgSend(v4, "hmd_isForXPCTransport")
    && objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess"))
  {
    objc_msgSend(v4, "encodeBool:forKey:", 1, *MEMORY[0x1E0CB8098]);
  }

}

- (HMDMediaProfile)mediaProfile
{
  return (HMDMediaProfile *)objc_getProperty(self, a2, 464, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 472, 1);
}

- (void)setNotificationCenter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 472);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_mediaProfile, 0);
  objc_storeStrong((id *)&self->_advertisement, 0);
}

void __64__HMDMediaAccessory_transactionObjectUpdated_newValues_message___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

void __68__HMDMediaAccessory_notifyConnectivityChangedWithReachabilityState___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isResidentSupported");
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) != 0)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Notifying clients of updated media accessory reachability: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(v2, "notifyClientsOfReachabilityUpdateForAccessory:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring non-remote reachability change while remote access is enabled", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)urlString
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDMediaAccessory;
  -[HMDAccessory urlString](&v3, sel_urlString);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDictionary)assistantObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id *v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  objc_super v21;
  _QWORD v22[2];
  _QWORD v23[2];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)HMDMediaAccessory;
  -[HMDAccessory assistantObject](&v21, sel_assistantObject);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HMDAccessory category](self, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "categoryType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *MEMORY[0x1E0CB7A08]);

  if ((v7 & 1) != 0)
  {
    v8 = (id *)MEMORY[0x1E0D88BD8];
LABEL_5:
    v11 = *v8;
    v12 = (id)*MEMORY[0x1E0D88B40];
    v13 = v12;
    if (v11)
      v14 = v12 == 0;
    else
      v14 = 1;
    if (!v14)
    {
      v22[0] = CFSTR("objectServiceType");
      v22[1] = CFSTR("objectServiceSubType");
      v23[0] = v11;
      v23[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addEntriesFromDictionary:", v15);

    }
    goto LABEL_15;
  }
  objc_msgSend(v5, "categoryType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", *MEMORY[0x1E0CB7AA8]);

  if ((v10 & 1) != 0)
  {
    v8 = (id *)MEMORY[0x1E0D88C00];
    goto LABEL_5;
  }
  if (-[HMDMediaAccessory isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v18;
      v26 = 2112;
      v27 = v5;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Media accessory with invalid accessory category: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
  }
  v11 = 0;
  v13 = 0;
LABEL_15:
  v19 = (void *)objc_msgSend(v4, "copy");

  return (NSDictionary *)v19;
}

@end
