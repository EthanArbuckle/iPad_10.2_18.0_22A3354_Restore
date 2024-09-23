@implementation HMDAppleAccessoryPairingControllerDataSource

- (HMDAppleAccessoryPairingControllerDataSource)initWithContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMDAppleAccessoryPairingControllerDataSource;
  return -[HMCContextProvider initWithContext:](&v4, sel_initWithContext_, a3);
}

- (NSArray)inProgressPairingAccessories
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__181577;
  v9 = __Block_byref_object_dispose__181578;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __76__HMDAppleAccessoryPairingControllerDataSource_inProgressPairingAccessories__block_invoke;
  v4[3] = &unk_24E78DD18;
  v4[4] = &v5;
  -[HMCContextProvider unsafeSynchronousBlock:](self, "unsafeSynchronousBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

- (HAPPairingIdentity)hh1ControllerIdentity
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  HMDAppleAccessoryPairingControllerDataSource *v7;
  NSObject *v8;
  void *v9;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1BC08], "systemStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v3, "getOrCreateLocalPairingIdentity:", &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;

  if (!v4)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v9;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to get controller identity for pairing controller: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

  return (HAPPairingIdentity *)v4;
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
}

- (id)timerWithInterval:(double)a3 options:(unint64_t)a4
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 12, a3);
}

- (void)updatePairingAccessoryState:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __76__HMDAppleAccessoryPairingControllerDataSource_updatePairingAccessoryState___block_invoke;
  v6[3] = &unk_24E78DD40;
  v7 = v4;
  v5 = v4;
  -[HMCContextProvider unsafeSynchronousBlock:](self, "unsafeSynchronousBlock:", v6);

}

- (void)deletePairingAccessoryState:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __76__HMDAppleAccessoryPairingControllerDataSource_deletePairingAccessoryState___block_invoke;
  v6[3] = &unk_24E78DD40;
  v7 = v4;
  v5 = v4;
  -[HMCContextProvider unsafeSynchronousBlock:](self, "unsafeSynchronousBlock:", v6);

}

- (HMDBulletinBoard)bulletinBoard
{
  return (HMDBulletinBoard *)+[HMDBulletinBoard sharedBulletinBoard](HMDBulletinBoard, "sharedBulletinBoard");
}

- (id)deviceForIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceForIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __76__HMDAppleAccessoryPairingControllerDataSource_deletePairingAccessoryState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "homeManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pairingAppleAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  __removeHomeState(v6, *(void **)(a1 + 32));
  objc_msgSend(v7, "setPairingAppleAccessories:", v6);
  objc_msgSend(v3, "save");

}

void __76__HMDAppleAccessoryPairingControllerDataSource_updatePairingAccessoryState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  objc_msgSend(v3, "homeManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pairingAppleAccessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __removeHomeState(v8, v10);

  objc_msgSend(v8, "addObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v11, "setPairingAppleAccessories:", v8);
  objc_msgSend(v3, "save");

}

void __76__HMDAppleAccessoryPairingControllerDataSource_inProgressPairingAccessories__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "homeManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pairingAppleAccessories");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

@end
