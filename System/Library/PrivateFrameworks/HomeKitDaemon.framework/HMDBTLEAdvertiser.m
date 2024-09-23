@implementation HMDBTLEAdvertiser

- (HMDBTLEAdvertiser)init
{
  HMDBTLEAdvertiser *v2;
  id v3;
  const char *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *workQueue;
  uint64_t v8;
  HAPBTLECentralManager *centralManager;
  HMDAccessoryQueues *v10;
  HMDAccessoryQueues *powerOnQueues;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)HMDBTLEAdvertiser;
  v2 = -[HMDBTLEAdvertiser init](&v21, sel_init);
  if (v2)
  {
    HMDispatchQueueNameString();
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (const char *)objc_msgSend(v3, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create(v4, v5);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v6;

    objc_msgSend(MEMORY[0x24BE1B9F8], "getInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    centralManager = v2->_centralManager;
    v2->_centralManager = (HAPBTLECentralManager *)v8;

    -[HAPBTLECentralManager registerCentralManagerDelegate:](v2->_centralManager, "registerCentralManagerDelegate:", v2);
    v10 = objc_alloc_init(HMDAccessoryQueues);
    powerOnQueues = v2->_powerOnQueues;
    v2->_powerOnQueues = v10;

    -[HMDAccessoryQueues createQueue:](v2->_powerOnQueues, "createQueue:", CFSTR("AdvertisementQueue"));
    -[HMDAccessoryQueues createQueue:](v2->_powerOnQueues, "createQueue:", CFSTR("ReachabilityQueue"));
    objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferenceForKey:", CFSTR("BTLEAdvertisingTimeout"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "numberValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "doubleValue");
    v2->_advertisementTimeInterval = v15;
    objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "preferenceForKey:", CFSTR("wirelessReachabilityTimeout"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "doubleValue");
    v2->_reachabilityTimeInterval = v19;

  }
  return v2;
}

- (void)_flushQueue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  -[HMDBTLEAdvertiser powerOnQueues](self, "powerOnQueues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "popAccessoryFromQueue:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    do
    {
      -[HMDBTLEAdvertiser _completePendingPowerOnRequest:](self, "_completePendingPowerOnRequest:", v5);
      -[HMDBTLEAdvertiser powerOnQueues](self, "powerOnQueues");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "popAccessoryFromQueue:", v8);
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
    while (v7);
  }

}

- (void)_flushQueues
{
  -[HMDBTLEAdvertiser _flushQueue:](self, "_flushQueue:", CFSTR("AdvertisementQueue"));
  -[HMDBTLEAdvertiser _flushQueue:](self, "_flushQueue:", CFSTR("ReachabilityQueue"));
}

- (void)didUpdateBTLEState:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[HMDBTLEAdvertiser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__HMDBTLEAdvertiser_didUpdateBTLEState___block_invoke;
  v6[3] = &unk_24E797C10;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)_clearAdvertiser
{
  void *v3;
  void *v4;

  -[HMDBTLEAdvertiser leAdvertiser](self, "leAdvertiser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HMDBTLEAdvertiser leAdvertiser](self, "leAdvertiser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[HMDBTLEAdvertiser setLeAdvertiser:](self, "setLeAdvertiser:", 0);
  }
}

- (void)_stopAdvertisement:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  -[HMDBTLEAdvertiser accessory](self, "accessory");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 && v5 == v4)
  {
    -[HMDBTLEAdvertiser leAdvertiser](self, "leAdvertiser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      -[HMDBTLEAdvertiser _clearAdvertiser](self, "_clearAdvertiser");
  }
}

- (void)stopAdvertisement:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDBTLEAdvertiser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__HMDBTLEAdvertiser_stopAdvertisement___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_completePendingPowerOnRequest:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isReachable") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 4, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v6)
  {
    -[HMDBTLEAdvertiser powerOnQueues](self, "powerOnQueues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAccessory:", v6);

    objc_msgSend(v6, "powerOnComplete:", v4);
  }

}

- (void)_cancelOn:(id)a3
{
  id v4;
  void *v5;
  HMDBTLEAdvertiser *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Wireless - Cancelling advertisement timer for %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (v4)
  {
    if ((objc_msgSend(v4, "custom1WoBLE") & 1) != 0
      && (-[HMDBTLEAdvertiser accessory](v6, "accessory"), (v10 = objc_claimAutoreleasedReturnValue()) != 0)
      && (v11 = (void *)v10,
          -[HMDBTLEAdvertiser accessory](v6, "accessory"),
          v12 = (id)objc_claimAutoreleasedReturnValue(),
          v12,
          v11,
          v12 == v4))
    {
      -[HMDBTLEAdvertiser setAccessory:](v6, "setAccessory:", 0);
      -[HMDBTLEAdvertiser advertisementTimer](v6, "advertisementTimer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[HMDBTLEAdvertiser advertisementTimer](v6, "advertisementTimer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "suspend");

        -[HMDBTLEAdvertiser setAdvertisementTimer:](v6, "setAdvertisementTimer:", 0);
      }
      -[HMDBTLEAdvertiser powerOnQueues](v6, "powerOnQueues");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "getContextForAccessory:", v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
        objc_msgSend(v16, "suspend");
      -[HMDBTLEAdvertiser _clearAdvertiser](v6, "_clearAdvertiser");
      -[HMDBTLEAdvertiser _completePendingPowerOnRequest:](v6, "_completePendingPowerOnRequest:", v4);
      -[HMDBTLEAdvertiser _startAdvertising](v6, "_startAdvertising");

    }
    else
    {
      -[HMDBTLEAdvertiser _completePendingPowerOnRequest:](v6, "_completePendingPowerOnRequest:", v4);
    }
  }

}

- (void)cancelOn:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDBTLEAdvertiser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __30__HMDBTLEAdvertiser_cancelOn___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_startAdvertising
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDBTLEAdvertiser *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[HMDBTLEAdvertiser leAdvertiser](self, "leAdvertiser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[HMDBTLEAdvertiser powerOnQueues](self, "powerOnQueues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countForQueue:", CFSTR("AdvertisementQueue"));

    if (v5)
    {
      -[HMDBTLEAdvertiser powerOnQueues](self, "powerOnQueues");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "popAccessoryFromQueue:", CFSTR("AdvertisementQueue"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDBTLEAdvertiser setAccessory:](self, "setAccessory:", v7);

      v8 = objc_alloc_init(MEMORY[0x24BE29780]);
      -[HMDBTLEAdvertiser setLeAdvertiser:](self, "setLeAdvertiser:", v8);

      v9 = objc_alloc(MEMORY[0x24BE3F1A0]);
      -[HMDBTLEAdvertiser accessory](self, "accessory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pairingUsername");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v9, "initWithAddressString:length:", v11, 6);

      objc_msgSend(v12, "data");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDBTLEAdvertiser leAdvertiser](self, "leAdvertiser");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setLgDeviceID:", v13);

      v15 = (void *)MEMORY[0x227676638]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDBTLEAdvertiser accessory](v16, "accessory");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543618;
        v27 = v18;
        v28 = 2112;
        v29 = v20;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Wireless - Starting BT LE Advertisement for %@", (uint8_t *)&v26, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      -[HMDBTLEAdvertiser leAdvertiser](v16, "leAdvertiser");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "activate");

      v22 = objc_alloc(MEMORY[0x24BE3F298]);
      -[HMDBTLEAdvertiser advertisementTimeInterval](v16, "advertisementTimeInterval");
      v23 = (void *)objc_msgSend(v22, "initWithTimeInterval:options:", 1);
      -[HMDBTLEAdvertiser setAdvertisementTimer:](v16, "setAdvertisementTimer:", v23);

      -[HMDBTLEAdvertiser advertisementTimer](v16, "advertisementTimer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setDelegate:", v16);

      -[HMDBTLEAdvertiser advertisementTimer](v16, "advertisementTimer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "resume");

    }
  }
}

- (void)powerOn:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDBTLEAdvertiser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __29__HMDBTLEAdvertiser_powerOn___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_advertisementTimeout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDBTLEAdvertiser *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDBTLEAdvertiser *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[HMDBTLEAdvertiser leAdvertiser](self, "leAdvertiser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HMDBTLEAdvertiser advertisementTimer](self, "advertisementTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suspend");

    -[HMDBTLEAdvertiser setAdvertisementTimer:](self, "setAdvertisementTimer:", 0);
    -[HMDBTLEAdvertiser accessory](self, "accessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBTLEAdvertiser setAccessory:](self, "setAccessory:", 0);
    v6 = (void *)MEMORY[0x227676638](-[HMDBTLEAdvertiser _clearAdvertiser](self, "_clearAdvertiser"));
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v9;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Wireless - Starting reachable timer for accessory: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    if ((objc_msgSend(v5, "isReachable") & 1) != 0)
    {
      -[HMDBTLEAdvertiser _completePendingPowerOnRequest:](v7, "_completePendingPowerOnRequest:", v5);
    }
    else
    {
      v15 = objc_alloc(MEMORY[0x24BE3F298]);
      -[HMDBTLEAdvertiser reachabilityTimeInterval](v7, "reachabilityTimeInterval");
      v16 = (void *)objc_msgSend(v15, "initWithTimeInterval:options:", 1);
      objc_msgSend(v16, "setDelegate:", v7);
      objc_msgSend(v16, "resume");
      -[HMDBTLEAdvertiser powerOnQueues](v7, "powerOnQueues");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addAccessory:toQueue:context:", v5, CFSTR("ReachabilityQueue"), v16);

    }
    -[HMDBTLEAdvertiser _startAdvertising](v7, "_startAdvertising");
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Wireless LE Timeout - no gleAdvertiser", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDBTLEAdvertiser accessory](v12, "accessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBTLEAdvertiser _completePendingPowerOnRequest:](v12, "_completePendingPowerOnRequest:", v5);
  }

}

- (void)timerDidFire:(id)a3
{
  id v4;
  void *v5;
  HMDBTLEAdvertiser *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[6];
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__59054;
  v13[4] = __Block_byref_object_dispose__59055;
  v4 = a3;
  v14 = v4;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDBTLEAdvertiser accessory](v6, "accessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v16 = v8;
    v17 = 2112;
    v18 = v4;
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Wireless Timer: %@ did fire for %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDBTLEAdvertiser workQueue](v6, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __34__HMDBTLEAdvertiser_timerDidFire___block_invoke;
  v12[3] = &unk_24E79B698;
  v12[4] = v6;
  v12[5] = v13;
  dispatch_async(v11, v12);

  _Block_object_dispose(v13, 8);
}

- (BOOL)isAdvertisingForAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    -[HMDBTLEAdvertiser workQueue](self, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__HMDBTLEAdvertiser_isAdvertisingForAccessory___block_invoke;
    block[3] = &unk_24E79C0A8;
    block[4] = self;
    v9 = v4;
    v10 = &v11;
    dispatch_sync(v5, block);

    v6 = *((_BYTE *)v12 + 24) != 0;
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isReady
{
  HMDBTLEAdvertiser *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  -[HMDBTLEAdvertiser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __28__HMDBTLEAdvertiser_isReady__block_invoke;
  v5[3] = &unk_24E79B698;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (CUBLEAdvertiser)leAdvertiser
{
  return self->_leAdvertiser;
}

- (void)setLeAdvertiser:(id)a3
{
  objc_storeStrong((id *)&self->_leAdvertiser, a3);
}

- (HMFTimer)advertisementTimer
{
  return self->_advertisementTimer;
}

- (void)setAdvertisementTimer:(id)a3
{
  objc_storeStrong((id *)&self->_advertisementTimer, a3);
}

- (HMDHAPAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_accessory, a3);
}

- (HAPBTLECentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
  objc_storeStrong((id *)&self->_centralManager, a3);
}

- (HMDAccessoryQueues)powerOnQueues
{
  return self->_powerOnQueues;
}

- (void)setPowerOnQueues:(id)a3
{
  objc_storeStrong((id *)&self->_powerOnQueues, a3);
}

- (double)advertisementTimeInterval
{
  return self->_advertisementTimeInterval;
}

- (void)setAdvertisementTimeInterval:(double)a3
{
  self->_advertisementTimeInterval = a3;
}

- (double)reachabilityTimeInterval
{
  return self->_reachabilityTimeInterval;
}

- (void)setReachabilityTimeInterval:(double)a3
{
  self->_reachabilityTimeInterval = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_powerOnQueues, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_advertisementTimer, 0);
  objc_storeStrong((id *)&self->_leAdvertiser, 0);
}

void __28__HMDBTLEAdvertiser_isReady__block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "centralManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state");

  if (v3 > 5 || ((1 << v3) & 0x29) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

void __47__HMDBTLEAdvertiser_isAdvertisingForAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "powerOnQueues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "whichQueueForAccessory:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3
    || (v4 = *(void **)(a1 + 40),
        objc_msgSend(*(id *)(a1 + 32), "accessory"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4 == v5))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

void __34__HMDBTLEAdvertiser_timerDidFire___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "advertisementTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "accessory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v9;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Wireless BTLE Advertisement timeout for %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(*(id *)(a1 + 32), "_advertisementTimeout");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "powerOnQueues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getAccessoryForContext:fromQueue:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("ReachabilityQueue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "suspend");
      objc_msgSend(*(id *)(a1 + 32), "_completePendingPowerOnRequest:", v5);
    }
    else
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "accessory");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v15;
        v20 = 2112;
        v21 = v17;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unexpected BTLE Advertisement timer for %@", (uint8_t *)&v18, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
    }

  }
}

void __29__HMDBTLEAdvertiser_powerOn___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "centralManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state");

  if (v3 > 5 || ((1 << v3) & 0x29) == 0)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Wireless - Ignoring power on request -- Bluetooth not in a state to turn on accessory: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 54, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "powerOnComplete:", v13);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "accessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);

    if (v5 != v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "powerOnQueues");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addAccessory:toQueue:context:", *(_QWORD *)(a1 + 40), CFSTR("AdvertisementQueue"), 0);

      objc_msgSend(*(id *)(a1 + 32), "_startAdvertising");
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "postNotificationName:object:", CFSTR("kHMDAccessoryWakeNotificationStarted"), *(_QWORD *)(a1 + 40));

    }
  }
}

uint64_t __30__HMDBTLEAdvertiser_cancelOn___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelOn:", *(_QWORD *)(a1 + 40));
}

uint64_t __39__HMDBTLEAdvertiser_stopAdvertisement___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopAdvertisement:", *(_QWORD *)(a1 + 40));
}

uint64_t __40__HMDBTLEAdvertiser_didUpdateBTLEState___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;
  void *v3;

  if (*(_QWORD *)(result + 40) != 5)
  {
    v1 = result;
    v2 = *(void **)(result + 32);
    objc_msgSend(v2, "accessory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stopAdvertisement:", v3);

    return objc_msgSend(*(id *)(v1 + 32), "_flushQueues");
  }
  return result;
}

+ (id)sharedAdvertiser
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__HMDBTLEAdvertiser_sharedAdvertiser__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAdvertiser_onceToken != -1)
    dispatch_once(&sharedAdvertiser_onceToken, block);
  return (id)sharedAdvertiser_sharedAdvertiser;
}

+ (id)initializeAdvertiser
{
  return +[HMDBTLEAdvertiser sharedAdvertiser](HMDBTLEAdvertiser, "sharedAdvertiser");
}

void __37__HMDBTLEAdvertiser_sharedAdvertiser__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedAdvertiser_sharedAdvertiser;
  sharedAdvertiser_sharedAdvertiser = (uint64_t)v1;

}

@end
