@implementation HMDAirPlayAccessory

- (HMDAirPlayAccessory)initWithTransaction:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  HMDAirPlayAccessory *v11;
  uint64_t v12;
  HMFPairingIdentity *pairingIdentity;
  uint64_t v14;
  NSString *password;
  HMDAirPlayAccessory *v16;
  HMDAirPlayAccessory *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    v22.receiver = self;
    v22.super_class = (Class)HMDAirPlayAccessory;
    v11 = -[HMDMediaAccessory initWithTransaction:home:](&v22, sel_initWithTransaction_home_, v8, v7);
    if (v11)
    {
      objc_msgSend(v10, "pairingIdentity");
      v12 = objc_claimAutoreleasedReturnValue();
      pairingIdentity = v11->_pairingIdentity;
      v11->_pairingIdentity = (HMFPairingIdentity *)v12;

      objc_msgSend(v10, "password");
      v14 = objc_claimAutoreleasedReturnValue();
      password = v11->_password;
      v11->_password = (NSString *)v14;

    }
    v16 = v11;
    v17 = v16;
  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Cannot initialize an AirPlay accessory without an AirPlay model.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    v17 = 0;
  }

  return v17;
}

- (void)configureWithHome:(id)a3 msgDispatcher:(id)a4 configurationTracker:(id)a5 initialConfiguration:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[5];
  NSObject *v19;
  objc_super v20;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v12)
    dispatch_group_enter(v12);
  v20.receiver = self;
  v20.super_class = (Class)HMDAirPlayAccessory;
  -[HMDAccessory configureWithHome:msgDispatcher:configurationTracker:initialConfiguration:](&v20, sel_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration_, v10, v11, v13, v6);
  -[HMDAccessory home](self, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "residentDeviceManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addDataSource:", self);

  -[HMDAccessory workQueue](self, "workQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __97__HMDAirPlayAccessory_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration___block_invoke;
  v18[3] = &unk_24E79C268;
  v18[4] = self;
  v19 = v13;
  v17 = v13;
  dispatch_async(v16, v18);

}

- (id)advertisement
{
  HMDMediaAccessoryBrowseOperation *v3;
  void *v4;
  HMDMediaAccessoryBrowseOperation *v5;
  void *v6;
  HMDMediaAccessoryAdvertisement *v7;
  void *v8;
  void *v9;

  v3 = [HMDMediaAccessoryBrowseOperation alloc];
  -[HMDAccessory identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMDMediaAccessoryBrowseOperation initWithAccessoryIdentifier:](v3, "initWithAccessoryIdentifier:", v4);

  -[HMDMediaAccessoryBrowseOperation setEndpointFeatures:](v5, "setEndpointFeatures:", 1);
  -[HMFOperation start](v5, "start");
  -[HMDMediaAccessoryBrowseOperation waitUntilFinished](v5, "waitUntilFinished");
  -[HMFOperation error](v5, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    -[HMDMediaAccessoryBrowseOperation outputDevices](v5, "outputDevices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[HMDMediaAccessoryAdvertisement initWithOutputDevice:]([HMDMediaAccessoryAdvertisement alloc], "initWithOutputDevice:", v9);
  }

  return v7;
}

- (void)setAdvertisement:(id)a3
{
  id v4;
  void *v5;
  HMDAirPlayAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory identifier](v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Ignoring setting the advertisement data for AirPlay accessory %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)handleUpdatedAdvertisement:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  HMDAirPlayAccessory *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMDAirPlayAccessory *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessory workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v20.receiver = self;
  v20.super_class = (Class)HMDAirPlayAccessory;
  -[HMDMediaAccessory handleUpdatedAdvertisement:](&v20, sel_handleUpdatedAdvertisement_, v4);
  if (v4)
  {
    -[HMDAccessory home](self, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "hasAnyResident")
      && (objc_msgSend(v6, "primaryResident"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = v7 == 0,
          v7,
          v8))
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v22 = v17;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Deferring configuration because there currently is not a primary resident", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v14);
      __startConfigurationRetryTimer(v15);
    }
    else
    {
      __updateAccessoryInformation(self, v4);
      __configurationFromAdvertisement(self, v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count"))
      {
        v10 = (void *)MEMORY[0x227676638]();
        v11 = self;
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v22 = v13;
          _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory out of sync, updating configuration", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v10);
        objc_initWeak((id *)buf, v11);
        v18[0] = MEMORY[0x24BDAC760];
        v18[1] = 3221225472;
        v18[2] = __50__HMDAirPlayAccessory_handleUpdatedAdvertisement___block_invoke;
        v18[3] = &unk_24E799B48;
        objc_copyWeak(&v19, (id *)buf);
        __updateConfiguration(v11, v9, v18);
        objc_destroyWeak(&v19);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        __stopConfigurationRetryTimer(self);
      }

    }
  }
  else
  {
    __stopConfigurationRetryTimer(self);
  }

}

- (void)_handleUpdatedName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HMDAirPlayAccessory *v9;
  id v10;
  void *v11;
  void *v12;
  HMDAirPlayAccessory *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;
  id location;
  _BYTE buf[24];
  void *v21;
  id v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HMDAirPlayAccessory;
  -[HMDAccessory _handleUpdatedName:](&v18, sel__handleUpdatedName_, v4);
  -[HMDAccessory room](self, "room");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessory getConfiguredName](self, "getConfiguredName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMDAccessory getConfiguredName](self, "getConfiguredName");
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  v9 = self;
  v10 = v6;
  v11 = v10;
  if (v9 && v10)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = v9;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v11;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Updating name to: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v23 = CFSTR("name");
    v24[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAirPlayAccessory configurationRetryTimer](v13, "configurationRetryTimer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reset");

    objc_initWeak(&location, v13);
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = ____updateName_block_invoke;
    v21 = &unk_24E799B48;
    objc_copyWeak(&v22, &location);
    __updateConfiguration(v13, v16, buf);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

  }
}

- (id)messageSendPolicy
{
  uint64_t v2;

  if (_os_feature_enabled_impl())
    v2 = 1;
  else
    v2 = 5;
  return -[HMDHomeManagerXPCMessageSendPolicy initWithEntitlements:options:]([HMDHomeManagerXPCMessageSendPolicy alloc], "initWithEntitlements:options:", v2, 257);
}

- (BOOL)supportsMinimumUserPrivilege
{
  return 1;
}

- (void)handleUpdatedMinimumUserPrivilege:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDAirPlayAccessory;
  -[HMDMediaAccessory handleUpdatedMinimumUserPrivilege:](&v7, sel_handleUpdatedMinimumUserPrivilege_);
  if (-[HMDAirPlayAccessory minimumUserPriviledge](self, "minimumUserPriviledge") != a3)
  {
    -[HMDAccessory workQueue](self, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __57__HMDAirPlayAccessory_handleUpdatedMinimumUserPrivilege___block_invoke;
    v6[3] = &unk_24E797C10;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(v5, v6);

  }
}

- (void)handleUpdatedPassword:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDAirPlayAccessory;
  -[HMDMediaAccessory handleUpdatedPassword:](&v10, sel_handleUpdatedPassword_, v4);
  -[HMDAirPlayAccessory password](self, "password");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HMFEqualObjects();

  if ((v6 & 1) == 0)
  {
    -[HMDAccessory workQueue](self, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __45__HMDAirPlayAccessory_handleUpdatedPassword___block_invoke;
    v8[3] = &unk_24E79C268;
    v8[4] = self;
    v9 = v4;
    dispatch_async(v7, v8);

  }
}

- (HMFPairingIdentity)pairingIdentity
{
  HMFPairingIdentity *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_pairingIdentity;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setPairingIdentity:(id)a3
{
  HMFPairingIdentity *v4;
  HMFPairingIdentity *pairingIdentity;
  id v6;

  v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v4 = (HMFPairingIdentity *)objc_msgSend(v6, "copy");
  pairingIdentity = self->_pairingIdentity;
  self->_pairingIdentity = v4;

  os_unfair_recursive_lock_unlock();
}

- (NSString)password
{
  NSString *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_password;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setPassword:(id)a3
{
  NSString *v4;
  NSString *password;
  id v6;

  v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  password = self->_password;
  self->_password = v4;

  os_unfair_recursive_lock_unlock();
}

- (int64_t)minimumUserPriviledge
{
  int64_t minimumUserPriviledge;

  os_unfair_recursive_lock_lock_with_options();
  minimumUserPriviledge = self->_minimumUserPriviledge;
  os_unfair_recursive_lock_unlock();
  return minimumUserPriviledge;
}

- (void)setMinimumUserPriviledge:(int64_t)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_minimumUserPriviledge = a3;
  os_unfair_recursive_lock_unlock();
}

- (id)backingStoreObjects:(int64_t)a3
{
  HMDAirPlayAccessoryModel *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAirPlayAccessoryModel *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v5 = [HMDAirPlayAccessoryModel alloc];
  -[HMDAccessory uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", 1, v6, v8);

  -[HMDAirPlayAccessory populateModelObject:version:](self, "populateModelObject:version:", v9, a3);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)HMDAirPlayAccessory;
  -[HMDAccessory backingStoreObjects:](&v13, sel_backingStoreObjects_, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v11);

  return v10;
}

- (void)populateModelObject:(id)a3 version:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;
  v12.receiver = self;
  v12.super_class = (Class)HMDAirPlayAccessory;
  -[HMDAccessory populateModelObject:version:](&v12, sel_populateModelObject_version_, v8, a4);
  -[HMDAirPlayAccessory pairingIdentity](self, "pairingIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPairingIdentity:", v9);

  -[HMDAirPlayAccessory password](self, "password");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPassword:", v10);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDAirPlayAccessory minimumUserPriviledge](self, "minimumUserPriviledge"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMinimumUserPriviledge:", v11);

}

- (id)transactionWithObjectChangeType:(unint64_t)a3
{
  HMDAirPlayAccessoryModel *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAirPlayAccessoryModel *v9;

  v5 = [HMDAirPlayAccessoryModel alloc];
  -[HMDAccessory uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", a3, v6, v8);

  return v9;
}

- (BOOL)supportsDisassociation
{
  return 0;
}

- (void)disassociateWithCompletionHandler:(id)a3
{
  void *v3;
  void (**v4)(id, id);
  id v5;

  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = (void (**)(id, id))a3;
  objc_msgSend(v3, "hmErrorWithCode:", 48);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5);

}

- (void)disassociatePairingIdentity:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAirPlayAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDAirPlayAccessory *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  _QWORD aBlock[4];
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Starting disassociation", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDAirPlayAccessory advertisement](v9, "advertisement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "outputDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "av_OutputDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__HMDAirPlayAccessory_disassociatePairingIdentity_completionHandler___block_invoke;
    aBlock[3] = &unk_24E786230;
    v28 = v6;
    v16 = _Block_copy(aBlock);
    objc_initWeak((id *)buf, v9);
    __outputDeviceConfigurationOptions();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v15;
    v23[1] = 3221225472;
    v23[2] = __69__HMDAirPlayAccessory_disassociatePairingIdentity_completionHandler___block_invoke_2;
    v23[3] = &unk_24E786258;
    v24 = v12;
    objc_copyWeak(&v26, (id *)buf);
    v25 = v7;
    objc_msgSend(v14, "configureUsingBlock:options:completionHandler:", v16, v17, v23);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);

    v18 = v28;
  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = v9;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v22;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Missing output device", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v18);
  }

}

- (BOOL)supportsUserManagement
{
  return 1;
}

- (void)addUser:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  HMDAirPlayAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;
  HMDAirPlayAccessory *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDAirPlayAccessory *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543618;
    v26 = v11;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Adding user: %@", (uint8_t *)&v25, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDAccessory home](v9, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isOwnerUser");

  if ((v13 & 1) != 0)
  {
    objc_msgSend(v6, "pairingIdentity");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      -[HMDAirPlayAccessory addUserPairingIdentity:isOwner:completionHandler:](v9, "addUserPairingIdentity:isOwner:completionHandler:", v14, objc_msgSend(v6, "isOwner"), v7);
    }
    else
    {
      v20 = (void *)MEMORY[0x227676638]();
      v21 = v9;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543618;
        v26 = v23;
        v27 = 2112;
        v28 = v6;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Failed to get pairing identity for user: %@", (uint8_t *)&v25, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v24);

      v15 = 0;
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = v9;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v19;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Only owner can add users", (uint8_t *)&v25, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v15);
  }

}

- (void)addUserPairingIdentity:(id)a3 isOwner:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDAirPlayAccessory *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  HMDAirPlayAccessory *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  HMDAirPlayAccessory *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD aBlock[4];
  id v41;
  _BYTE location[12];
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v6 = a4;
  v47 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[HMDAccessory home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isOwnerUser");

  if ((v11 & 1) != 0)
  {
    -[HMDAirPlayAccessory advertisement](self, "advertisement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "outputDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "av_OutputDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      +[HMDUser av_authorizedPeerForPairingIdentity:isOwner:](HMDUser, "av_authorizedPeerForPairingIdentity:isOwner:", v8, v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        v17 = MEMORY[0x24BDAC760];
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 3221225472;
        aBlock[2] = __72__HMDAirPlayAccessory_addUserPairingIdentity_isOwner_completionHandler___block_invoke;
        aBlock[3] = &unk_24E786230;
        v18 = v15;
        v41 = v18;
        v19 = _Block_copy(aBlock);
        objc_initWeak((id *)location, self);
        __outputDeviceConfigurationOptions();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = v17;
        v35[1] = 3221225472;
        v35[2] = __72__HMDAirPlayAccessory_addUserPairingIdentity_isOwner_completionHandler___block_invoke_2;
        v35[3] = &unk_24E786280;
        v36 = v12;
        objc_copyWeak(&v39, (id *)location);
        v37 = v18;
        v38 = v9;
        objc_msgSend(v14, "configureUsingBlock:options:completionHandler:", v19, v20, v35);

        objc_destroyWeak(&v39);
        objc_destroyWeak((id *)location);

        v21 = v41;
      }
      else
      {
        v30 = (void *)MEMORY[0x227676638]();
        v31 = self;
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)location = 138543874;
          *(_QWORD *)&location[4] = v33;
          v43 = 2112;
          v44 = v8;
          v45 = 2112;
          v46 = v34;
          _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@Failed to create authorized peer for pairing identity: %@ isOwner: %@", location, 0x20u);

        }
        objc_autoreleasePoolPop(v30);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v9 + 2))(v9, v21);
      }

    }
    else
    {
      v26 = (void *)MEMORY[0x227676638]();
      v27 = self;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138543362;
        *(_QWORD *)&location[4] = v29;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Missing output device", location, 0xCu);

      }
      objc_autoreleasePoolPop(v26);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v9 + 2))(v9, v16);
    }

  }
  else
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543362;
      *(_QWORD *)&location[4] = v25;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Only owner can add users identities", location, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v12);
  }

}

- (void)removeUser:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  HMDAirPlayAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDAirPlayAccessory *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v11;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Removing user: %@", (uint8_t *)&v18, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v6, "pairingIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[HMDAirPlayAccessory removeUserPairingIdentity:isOwner:completionHandler:](v9, "removeUserPairingIdentity:isOwner:completionHandler:", v12, objc_msgSend(v6, "isOwner"), v7);
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = v9;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v16;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Failed to get pairing identity for user: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v17);

  }
}

- (void)removeUserPairingIdentity:(id)a3 isOwner:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  HMDAirPlayAccessory *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDAirPlayAccessory *v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD aBlock[4];
  id v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v6 = a4;
  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (v6)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@User is the owner, disassociating from device", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDAirPlayAccessory disassociatePairingIdentity:completionHandler:](v11, "disassociatePairingIdentity:completionHandler:", v8, v9);
  }
  else
  {
    -[HMDAirPlayAccessory advertisement](self, "advertisement");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "outputDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "av_OutputDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = MEMORY[0x24BDAC760];
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __75__HMDAirPlayAccessory_removeUserPairingIdentity_isOwner_completionHandler___block_invoke;
      aBlock[3] = &unk_24E786230;
      v18 = v8;
      v32 = v18;
      v19 = _Block_copy(aBlock);
      objc_initWeak((id *)buf, self);
      __outputDeviceConfigurationOptions();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v17;
      v26[1] = 3221225472;
      v26[2] = __75__HMDAirPlayAccessory_removeUserPairingIdentity_isOwner_completionHandler___block_invoke_2;
      v26[3] = &unk_24E786280;
      v27 = v14;
      objc_copyWeak(&v30, (id *)buf);
      v28 = v18;
      v29 = v9;
      objc_msgSend(v16, "configureUsingBlock:options:completionHandler:", v19, v20, v26);

      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)buf);

      v21 = v32;
    }
    else
    {
      v22 = (void *)MEMORY[0x227676638]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v34 = v25;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Missing output device", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v22);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v9 + 2))(v9, v21);
    }

  }
}

- (void)pairingsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  HMDAirPlayAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDAirPlayAccessory *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HMDAirPlayAccessory *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Requesting pairings", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAccessory home](v6, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isOwnerUser");

  if ((v10 & 1) != 0)
  {
    -[HMDAirPlayAccessory advertisement](v6, "advertisement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "outputDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "av_OutputDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_initWeak((id *)buf, v6);
      __outputDeviceConfigurationOptions();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __53__HMDAirPlayAccessory_pairingsWithCompletionHandler___block_invoke_2;
      v24[3] = &unk_24E786258;
      v25 = v11;
      objc_copyWeak(&v27, (id *)buf);
      v26 = v4;
      objc_msgSend(v13, "configureUsingBlock:options:completionHandler:", &__block_literal_global_122997, v14, v24);

      objc_destroyWeak(&v27);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = v6;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v29 = v22;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Missing output device", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v23);

    }
  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = v6;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Only owner can remove users", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v11);
  }

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
  HMDAirPlayAccessory *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  HMDAirPlayAccessory *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *context;
  void *v36;
  void *v37;
  objc_super v38;
  objc_super v39;
  _QWORD aBlock[5];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
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

  v37 = v8;
  if (v13)
  {
    v41 = 0;
    v42 = &v41;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__122990;
    v45 = __Block_byref_object_dispose__122991;
    v46 = 0;
    objc_msgSend(v10, "responseHandler");
    v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __66__HMDAirPlayAccessory_transactionObjectUpdated_newValues_message___block_invoke;
      aBlock[3] = &unk_24E786DA0;
      aBlock[4] = &v41;
      v15 = _Block_copy(aBlock);
      objc_msgSend(v10, "setResponseHandler:", v15);

    }
    v39.receiver = self;
    v39.super_class = (Class)HMDAirPlayAccessory;
    -[HMDMediaAccessory transactionObjectUpdated:newValues:message:](&v39, sel_transactionObjectUpdated_newValues_message_, 0, v11, v10);
    v16 = self;
    v17 = v13;
    v18 = v10;
    objc_msgSend(v18, "transactionResult");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pairingIdentity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v17, "pairingIdentity");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAirPlayAccessory pairingIdentity](v16, "pairingIdentity");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "isEqual:", v21);

      if ((v22 & 1) == 0)
      {
        context = (void *)MEMORY[0x227676638]();
        v23 = v16;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "pairingIdentity");
          v25 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v48 = v34;
          v49 = 2112;
          v50 = v25;
          v33 = (void *)v25;
          _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Updated pairing identity: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(context);
        objc_msgSend(v17, "pairingIdentity");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAirPlayAccessory setPairingIdentity:](v23, "setPairingIdentity:", v26);

        objc_msgSend(v36, "markChanged");
      }
    }
    if (objc_msgSend(v17, "propertyWasSet:", CFSTR("password"), v33))
    {
      objc_msgSend(v17, "password");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAirPlayAccessory password](v16, "password");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = HMFEqualObjects();

      if ((v29 & 1) == 0)
      {
        objc_msgSend(v17, "password");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAirPlayAccessory setPassword:](v16, "setPassword:", v30);

        objc_msgSend(v36, "markChanged");
      }
    }
    if (objc_msgSend(v17, "propertyWasSet:", CFSTR("minimumUserPriviledge")))
    {
      objc_msgSend(v17, "minimumUserPriviledge");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "integerValue");

      if (-[HMDAirPlayAccessory minimumUserPriviledge](v16, "minimumUserPriviledge") != v32)
      {
        -[HMDAirPlayAccessory setMinimumUserPriviledge:](v16, "setMinimumUserPriviledge:", v32);
        objc_msgSend(v36, "markChanged");
      }
    }
    objc_msgSend(v18, "respondWithPayload:", 0);

    if (v14)
      v14[2](v14, v42[5], 0);

    _Block_object_dispose(&v41, 8);
  }
  else
  {
    v38.receiver = self;
    v38.super_class = (Class)HMDAirPlayAccessory;
    -[HMDMediaAccessory transactionObjectUpdated:newValues:message:](&v38, sel_transactionObjectUpdated_newValues_message_, v8, v11, v10);
  }

}

- (BOOL)supportsDeviceWithCapabilities:(id)a3
{
  return objc_msgSend(a3, "supportsWholeHouseAudio");
}

- (void)timerDidFire:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDAccessory workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__HMDAirPlayAccessory_timerDidFire___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (HMDAirPlayAccessory)initWithCoder:(id)a3
{
  id v4;
  HMDAirPlayAccessory *v5;
  uint64_t v6;
  HMFPairingIdentity *pairingIdentity;
  uint64_t v8;
  NSString *password;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDAirPlayAccessory;
  v5 = -[HMDMediaAccessory initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD4D00]);
    v6 = objc_claimAutoreleasedReturnValue();
    pairingIdentity = v5->_pairingIdentity;
    v5->_pairingIdentity = (HMFPairingIdentity *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.password"));
    v8 = objc_claimAutoreleasedReturnValue();
    password = v5->_password;
    v5->_password = (NSString *)v8;

    v5->_minimumUserPriviledge = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HM.minimumUserPriviledge"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  char v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "hmd_isForXPCTransport");
  v6 = objc_msgSend(v4, "hmd_isForLocalStore");
  v11.receiver = self;
  v11.super_class = (Class)HMDAirPlayAccessory;
  -[HMDMediaAccessory encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  -[HMDAirPlayAccessory pairingIdentity](self, "pairingIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v5 & 1) == 0)
  {
    if (v6)
    {
      objc_msgSend(v4, "encodeObject:forKey:", v7, *MEMORY[0x24BDD4D00]);
    }
    else if (v7)
    {
      objc_msgSend(v7, "publicPairingIdentity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v9, *MEMORY[0x24BDD4D00]);

    }
  }
  if ((objc_msgSend(v4, "hmd_isForLocalStore") & 1) != 0
    || objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount"))
  {
    -[HMDAirPlayAccessory password](self, "password");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("HM.password"));

    objc_msgSend(v4, "encodeInteger:forKey:", -[HMDAirPlayAccessory minimumUserPriviledge](self, "minimumUserPriviledge"), CFSTR("HM.minimumUserPriviledge"));
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDAccessory uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMFExponentialBackoffTimer)configurationRetryTimer
{
  return self->_configurationRetryTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationRetryTimer, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_pairingIdentity, 0);
}

void __36__HMDAirPlayAccessory_timerDidFire___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Retrying configuration", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "advertisement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "hasAnyResident")
      && objc_msgSend(v7, "isCurrentDevicePrimaryResident"))
    {
      __updateAccessoryInformation(*(void **)(a1 + 32), v6);
    }
    objc_msgSend(*(id *)(a1 + 32), "configurationRetryTimer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "suspend");

    __configurationFromAdvertisement(*(void **)(a1 + 32), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count") == 0;
    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v10)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v21;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Accessory no longer out of sync", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
      __stopConfigurationRetryTimer(*(void **)(a1 + 32));
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v15;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory out of sync, updating configuration", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      v16 = *(void **)(a1 + 32);
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __36__HMDAirPlayAccessory_timerDidFire___block_invoke_56;
      v22[3] = &unk_24E799B48;
      objc_copyWeak(&v23, (id *)buf);
      __updateConfiguration(v16, v9, v22);
      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);
    }

  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Missing advertisement, continuing configuration retries", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
  }

}

void __36__HMDAirPlayAccessory_timerDidFire___block_invoke_56(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x227676638]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v9;
      v16 = 2112;
      v17 = v3;
      v10 = "%{public}@Failed to update accessory configuration with error: %@";
      v11 = v8;
      v12 = OS_LOG_TYPE_DEFAULT;
      v13 = 22;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v11, v12, v10, (uint8_t *)&v14, v13);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v9;
    v10 = "%{public}@Successfully updated accessory configuration";
    v11 = v8;
    v12 = OS_LOG_TYPE_INFO;
    v13 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v5);
}

void __66__HMDAirPlayAccessory_transactionObjectUpdated_newValues_message___block_invoke(uint64_t a1, void *a2)
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

void __53__HMDAirPlayAccessory_pairingsWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v8)
  {
    v32 = v9;
    v12 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v8, "peersInHomeGroup");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayWithCapacity:", objc_msgSend(v13, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v8, "peersInHomeGroup");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v34;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v34 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v19), "hmd_pairingIdentity");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v17);
    }

    v21 = (void *)objc_msgSend(v14, "copy");
    v22 = (void *)MEMORY[0x227676638]();
    v23 = WeakRetained;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v25;
      v40 = 2112;
      v41 = v21;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Successfully requested pairing identities: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);

    v26 = 0;
    v9 = v32;
  }
  else
  {
    v27 = (void *)MEMORY[0x227676638]();
    v28 = WeakRetained;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v39 = v30;
      v40 = 2112;
      v41 = v10;
      v42 = 2112;
      v43 = v9;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to get peers with error: %@, cancellationReason: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 54, CFSTR("Communication failure"), CFSTR("Failed to get configuration."), 0, v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
  }
  v31 = *(_QWORD *)(a1 + 40);
  if (v31)
    (*(void (**)(uint64_t, void *, void *))(v31 + 16))(v31, v21, v26);

}

void __75__HMDAirPlayAccessory_removeUserPairingIdentity_isOwner_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removePeerWithIDFromHomeGroup:", v4);

}

void __75__HMDAirPlayAccessory_removeUserPairingIdentity_isOwner_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (v8)
  {
    v34 = v9;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v8, "peersInHomeGroup");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v36;
      while (2)
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v36 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v16), "peerID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17 == v18)
          {
            v24 = (void *)MEMORY[0x227676638]();
            v25 = WeakRetained;
            HMFGetOSLogHandle();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = *(void **)(a1 + 40);
              *(_DWORD *)buf = 138543618;
              v41 = v27;
              v42 = 2112;
              v43 = v28;
              _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to remove user pairing identity: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v24);
            objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 41);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_16;
          }
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        if (v14)
          continue;
        break;
      }
    }

    v19 = (void *)MEMORY[0x227676638]();
    v20 = WeakRetained;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v22;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully removed peer", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    v23 = 0;
LABEL_16:
    v9 = v34;
  }
  else
  {
    v29 = (void *)MEMORY[0x227676638]();
    v30 = WeakRetained;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v32;
      v42 = 2112;
      v43 = v10;
      v44 = 2112;
      v45 = v9;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to remove peer with error: %@, cancellationReason: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v29);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 54, CFSTR("Communication failure"), CFSTR("Failed to set configuration."), 0, v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33 = *(_QWORD *)(a1 + 48);
  if (v33)
    (*(void (**)(uint64_t, void *))(v33 + 16))(v33, v23);

}

uint64_t __72__HMDAirPlayAccessory_addUserPairingIdentity_isOwner_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addPeerToHomeGroup:", *(_QWORD *)(a1 + 32));
}

void __72__HMDAirPlayAccessory_addUserPairingIdentity_isOwner_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  char v13;
  void *v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  int v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!v8)
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = WeakRetained;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543874;
      v30 = v24;
      v31 = 2112;
      v32 = v10;
      v33 = 2112;
      v34 = v9;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to add peer with error: %@, cancellationReason: %@", (uint8_t *)&v29, 0x20u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 54, CFSTR("Communication failure"), CFSTR("Failed to set configuration."), 0, v10);
    v25 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  objc_msgSend(v8, "peersInHomeGroup");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", *(_QWORD *)(a1 + 40));

  v14 = (void *)MEMORY[0x227676638]();
  v15 = WeakRetained;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if ((v13 & 1) == 0)
  {
    if (v17)
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = *(void **)(a1 + 40);
      v29 = 138543618;
      v30 = v26;
      v31 = 2112;
      v32 = v27;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to add peer: %@", (uint8_t *)&v29, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v25 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v20 = (void *)v25;
    goto LABEL_13;
  }
  if (v17)
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(void **)(a1 + 40);
    v29 = 138543618;
    v30 = v18;
    v31 = 2112;
    v32 = v19;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully added peer: %@", (uint8_t *)&v29, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  v20 = 0;
LABEL_13:
  v28 = *(_QWORD *)(a1 + 48);
  if (v28)
    (*(void (**)(uint64_t, void *))(v28 + 16))(v28, v20);

}

void __69__HMDAirPlayAccessory_disassociatePairingIdentity_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "setDevicePassword:", &stru_24E79DB48);
  objc_msgSend(v3, "stopAutomaticallyAllowingConnectionsFromPeersInHomeGroup");
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removePeerWithIDFromHomeGroup:", v4);

}

void __69__HMDAirPlayAccessory_disassociatePairingIdentity_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!v8)
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = WeakRetained;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543874;
      v31 = v22;
      v32 = 2112;
      v33 = v10;
      v34 = 2112;
      v35 = v9;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to disassociate with error: %@, cancellationReason: %@", (uint8_t *)&v30, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 54, CFSTR("Communication failure"), CFSTR("Failed to set configuration."), 0, v10);
    v23 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  objc_msgSend(v8, "devicePassword");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = WeakRetained;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543362;
      v31 = v17;
      v18 = "%{public}@Failed to reset device password";
LABEL_12:
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v30, 0xCu);

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  if ((objc_msgSend(v8, "automaticallyAllowsConnectionsFromPeersInHomeGroup") & 1) != 0
    || objc_msgSend(v8, "onlyAllowsConnectionsFromPeersInHomeGroup"))
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = WeakRetained;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543362;
      v31 = v17;
      v18 = "%{public}@Failed to disable home peers";
      goto LABEL_12;
    }
LABEL_13:

    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 54);
    v23 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v24 = (void *)v23;
    goto LABEL_15;
  }
  v26 = (void *)MEMORY[0x227676638]();
  v27 = WeakRetained;
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138543362;
    v31 = v29;
    _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully disassociated", (uint8_t *)&v30, 0xCu);

  }
  objc_autoreleasePoolPop(v26);
  v24 = 0;
LABEL_15:
  v25 = *(_QWORD *)(a1 + 40);
  if (v25)
    (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v24);

}

void __45__HMDAirPlayAccessory_handleUpdatedPassword___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id location;
  _BYTE buf[24];
  void *v12;
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(void **)(a1 + 40);
  v2 = *(id *)(a1 + 32);
  v3 = v1;
  if (v2)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = v2;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Updating password to: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    if (v3)
    {
      v14 = CFSTR("password");
      v15[0] = v3;
    }
    else
    {
      v14 = CFSTR("password");
      v15[0] = &stru_24E79DB48;
    }
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configurationRetryTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reset");

    objc_initWeak(&location, v5);
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = ____updatePassword_block_invoke;
    v12 = &unk_24E799B48;
    objc_copyWeak(&v13, &location);
    __updateConfiguration(v5, v8, buf);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
}

void __57__HMDAirPlayAccessory_handleUpdatedMinimumUserPrivilege___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id location;
  _BYTE buf[24];
  void *v13;
  id v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(id *)(a1 + 32);
  if (v2)
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = v2;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      HMUserPrivilegeToString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Updating minimum user privilege to: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    v15 = CFSTR("privilege");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "configurationRetryTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reset");

    objc_initWeak(&location, v4);
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = ____updateMinimumUserPrivilege_block_invoke;
    v13 = &unk_24E799B48;
    objc_copyWeak(&v14, &location);
    __updateConfiguration(v4, v9, buf);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
}

void __50__HMDAirPlayAccessory_handleUpdatedAdvertisement___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x227676638]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v9;
      v16 = 2112;
      v17 = v3;
      v10 = "%{public}@Failed to update accessory configuration with error: %@";
      v11 = v8;
      v12 = OS_LOG_TYPE_DEFAULT;
      v13 = 22;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v11, v12, v10, (uint8_t *)&v14, v13);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v9;
    v10 = "%{public}@Successfully updated accessory configuration";
    v11 = v8;
    v12 = OS_LOG_TYPE_INFO;
    v13 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v5);
}

void __97__HMDAirPlayAccessory_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "advertisement");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v7 = (id)v2;
  if (v2)
  {
    objc_msgSend(v3, "advertisement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleUpdatedAdvertisement:", v4);

  }
  else
  {
    objc_msgSend(v3, "configurationRetryTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reset");

    __startConfigurationRetryTimer(*(void **)(a1 + 32));
  }
  v6 = *(NSObject **)(a1 + 40);
  if (v6)
    dispatch_group_leave(v6);

}

+ (void)initialize
{
  objc_msgSend(MEMORY[0x24BE3F248], "setDefaultValue:forPreferenceKey:", &unk_24E971488, CFSTR("airPlayConfigurationRetryMinimum"));
  objc_msgSend(MEMORY[0x24BE3F248], "setDefaultValue:forPreferenceKey:", &unk_24E971498, CFSTR("airPlayConfigurationRetryMaximum"));
  objc_msgSend(MEMORY[0x24BE3F248], "setDefaultValue:forPreferenceKey:", &unk_24E96B648, CFSTR("airPlayConfigurationRetryFactor"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t82_123057 != -1)
    dispatch_once(&logCategory__hmf_once_t82_123057, &__block_literal_global_67_123058);
  return (id)logCategory__hmf_once_v83_123059;
}

void __34__HMDAirPlayAccessory_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v83_123059;
  logCategory__hmf_once_v83_123059 = v0;

}

@end
