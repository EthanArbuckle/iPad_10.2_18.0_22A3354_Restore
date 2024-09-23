@implementation HMDApplicationVendorIDStore

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)addVendorID:(id)a3 applicationBundleId:(id)a4 spiClient:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a4;
  -[HMDApplicationVendorIDStore clientQueue](self, "clientQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __73__HMDApplicationVendorIDStore_addVendorID_applicationBundleId_spiClient___block_invoke;
  v13[3] = &unk_24E796150;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDApplicationVendorIDStore applicationVendorIdMapping](self, "applicationVendorIdMapping");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.vendorIDStore"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMDApplicationVendorIDStore)init
{
  HMDApplicationVendorIDStore *v2;
  id v3;
  const char *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *clientQueue;
  uint64_t v8;
  NSMutableDictionary *applicationVendorIdMapping;
  uint64_t v10;
  NSMutableDictionary *applicationMachUUIDMapping;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HMDApplicationVendorIDStore;
  v2 = -[HMDApplicationVendorIDStore init](&v14, sel_init);
  if (v2)
  {
    HMDispatchQueueNameString();
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (const char *)objc_msgSend(v3, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create(v4, v5);
    clientQueue = v2->_clientQueue;
    v2->_clientQueue = (OS_dispatch_queue *)v6;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    applicationVendorIdMapping = v2->_applicationVendorIdMapping;
    v2->_applicationVendorIdMapping = (NSMutableDictionary *)v8;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    applicationMachUUIDMapping = v2->_applicationMachUUIDMapping;
    v2->_applicationMachUUIDMapping = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, sel___handleUninstalledApplication_, CFSTR("HMDApplicationUninstalledNotification"), 0);

  }
  return v2;
}

- (void)checkCorrectness
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDApplicationVendorIDStore clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__HMDApplicationVendorIDStore_checkCorrectness__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (id)vendorIDForApplication:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__125865;
    v15 = __Block_byref_object_dispose__125866;
    v16 = 0;
    -[HMDApplicationVendorIDStore clientQueue](self, "clientQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__HMDApplicationVendorIDStore_vendorIDForApplication___block_invoke;
    block[3] = &unk_24E79C0A8;
    v10 = &v11;
    block[4] = self;
    v9 = v4;
    dispatch_sync(v5, block);

    v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_vendorIDForApplication:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDApplicationVendorIDStore applicationVendorIdMapping](self, "applicationVendorIdMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (isWatch())
    {
      v6 = 0;
    }
    else
    {
      -[HMDApplicationVendorIDStore _extractVendorIDForApplication:](self, "_extractVendorIDForApplication:", v4);
      -[HMDApplicationVendorIDStore applicationVendorIdMapping](self, "applicationVendorIdMapping");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "vendorIdSha1");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543874;
        v15 = v10;
        v16 = 2112;
        v17 = v4;
        v18 = 2112;
        v19 = v11;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@There is no vendor id for %@, newly extracted vendor id is %@", (uint8_t *)&v14, 0x20u);

      }
      objc_autoreleasePoolPop(v8);
    }
  }
  objc_msgSend(v6, "vendorIdSha1");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_extractVendorIDForApplication:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, &v13);
  v6 = v13;
  if (v5)
  {
    objc_msgSend(v5, "deviceIdentifierForVendor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hm_generateSHA1");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDApplicationVendorIDStore _setAndSaveVendorID:applicationBundleId:companionAppBundleId:spiClient:](self, "_setAndSaveVendorID:applicationBundleId:companionAppBundleId:spiClient:", v9, v4, 0, 0);
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v15 = v12;
      v16 = 2112;
      v17 = v4;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Bundle ID: %@ cannot be extracted (or cannot determine): %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)addVendorID:(id)a3 applicationBundleId:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDApplicationVendorIDStore clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__HMDApplicationVendorIDStore_addVendorID_applicationBundleId___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)addVendorID:(id)a3 applicationBundleId:(id)a4 companionAppBundleId:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDApplicationVendorIDStore clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __84__HMDApplicationVendorIDStore_addVendorID_applicationBundleId_companionAppBundleId___block_invoke;
  v15[3] = &unk_24E79A910;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)_setAndSaveVendorID:(id)a3 applicationBundleId:(id)a4 companionAppBundleId:(id)a5 spiClient:(BOOL)a6
{
  if (-[HMDApplicationVendorIDStore _addVendorID:forApplication:companionAppBundleId:spiClient:](self, "_addVendorID:forApplication:companionAppBundleId:spiClient:", a3, a4, a5, a6))
  {
    -[HMDApplicationVendorIDStore _save](self, "_save");
  }
}

- (BOOL)_addVendorID:(id)a3 forApplication:(id)a4 companionAppBundleId:(id)a5 spiClient:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  HMDApplicationVendorIDStoreValue *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  char v27;
  HMDApplicationVendorIDStoreValue *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  __int16 v34;
  HMDApplicationVendorIDStoreValue *v35;
  __int16 v36;
  HMDApplicationVendorIDStoreValue *v37;
  uint64_t v38;

  v6 = a6;
  v38 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (HMDApplicationVendorIDStoreValue *)a4;
  v12 = a5;
  if (!v11)
  {
    v21 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543362;
      v33 = v23;
      v24 = "%{public}@Received invalid application bundle identifier";
LABEL_13:
      v25 = v22;
      v26 = 12;
      goto LABEL_14;
    }
LABEL_15:

    objc_autoreleasePoolPop(v21);
    v27 = 0;
    goto LABEL_16;
  }
  if (!v10)
  {
    v21 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543618;
      v33 = v23;
      v34 = 2112;
      v35 = v11;
      v24 = "%{public}@Vendor ID provided is invalid, cannot add entry for %@";
      v25 = v22;
      v26 = 22;
LABEL_14:
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, v24, (uint8_t *)&v32, v26);

      goto LABEL_15;
    }
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543362;
      v33 = v23;
      v24 = "%{public}@Invalid data type";
      goto LABEL_13;
    }
    goto LABEL_15;
  }
  v13 = v10;
  -[HMDApplicationVendorIDStore applicationVendorIdMapping](self, "applicationVendorIdMapping");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "vendorIdSha1");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToData:", v13);

  if ((v17 & 1) != 0)
  {
    v18 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543362;
      v33 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Already exists, do not need to proceed further.", (uint8_t *)&v32, 0xCu);

    }
  }
  else
  {
    v29 = -[HMDApplicationVendorIDStoreValue initWithVendorIDSha1:applicationBundleId:companionAppBundleId:spiClient:]([HMDApplicationVendorIDStoreValue alloc], "initWithVendorIDSha1:applicationBundleId:companionAppBundleId:spiClient:", v13, v11, v12, v6);

    -[HMDApplicationVendorIDStore applicationVendorIdMapping](self, "applicationVendorIdMapping");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, v11);

    v18 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543874;
      v33 = v31;
      v34 = 2112;
      v35 = v29;
      v36 = 2112;
      v37 = v11;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Updating new entry %@ for application bundle ID %@", (uint8_t *)&v32, 0x20u);

    }
    v15 = v29;
  }

  objc_autoreleasePoolPop(v18);
  v27 = v17 ^ 1;

LABEL_16:
  return v27;
}

- (void)removeVendorIDForApplicationBundleId:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDApplicationVendorIDStore *v9;

  v4 = a3;
  -[HMDApplicationVendorIDStore clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__HMDApplicationVendorIDStore_removeVendorIDForApplicationBundleId___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_save
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDApplicationVendorIDStore applicationVendorIdMapping](self, "applicationVendorIdMapping");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Archiving vendor id store %@", (uint8_t *)&v7, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  +[HMDPersistentStore archiveVendorStore:](HMDPersistentStore, "archiveVendorStore:", self);
}

- (id)machUUIDsForApplication:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__125865;
    v15 = __Block_byref_object_dispose__125866;
    v16 = 0;
    -[HMDApplicationVendorIDStore clientQueue](self, "clientQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__HMDApplicationVendorIDStore_machUUIDsForApplication___block_invoke;
    block[3] = &unk_24E79C0A8;
    v10 = &v11;
    block[4] = self;
    v9 = v4;
    dispatch_sync(v5, block);

    v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_machUUIDsForApplication:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDApplicationVendorIDStore applicationMachUUIDMapping](self, "applicationMachUUIDMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "machOUUIDs");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543874;
        v15 = v11;
        v16 = 2112;
        v17 = v4;
        v18 = 2112;
        v19 = v6;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating Mach UUID mapping with application bundle ID %@ and %@", (uint8_t *)&v14, 0x20u);

      }
      objc_autoreleasePoolPop(v9);
      -[HMDApplicationVendorIDStore applicationMachUUIDMapping](self, "applicationMachUUIDMapping");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v6, v4);

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (void)__handleUninstalledApplication:(id)a3
{
  id v4;
  NSObject *clientQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDApplicationVendorIDStore *v9;

  v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__HMDApplicationVendorIDStore___handleUninstalledApplication___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(clientQueue, v7);

}

- (HMDApplicationVendorIDStore)initWithCoder:(id)a3
{
  id v4;
  HMDApplicationVendorIDStore *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *applicationVendorIdMapping;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[HMDApplicationVendorIDStore init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v20[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("HM.vendorIDStore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543618;
        v17 = v12;
        v18 = 2112;
        v19 = v9;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Retrieved application vendor ID store: %@", (uint8_t *)&v16, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      v13 = objc_msgSend(v9, "mutableCopy");
      applicationVendorIdMapping = v5->_applicationVendorIdMapping;
      v5->_applicationVendorIdMapping = (NSMutableDictionary *)v13;

    }
  }

  return v5;
}

- (NSMutableDictionary)applicationVendorIdMapping
{
  return self->_applicationVendorIdMapping;
}

- (NSMutableDictionary)applicationMachUUIDMapping
{
  return self->_applicationMachUUIDMapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_applicationMachUUIDMapping, 0);
  objc_storeStrong((id *)&self->_applicationVendorIdMapping, 0);
}

void __62__HMDApplicationVendorIDStore___handleUninstalledApplication___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(v4, "bundleIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "removeVendorIDForApplicationBundleId:", v6);
    v5 = v6;
  }

}

void __55__HMDApplicationVendorIDStore_machUUIDsForApplication___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_machUUIDsForApplication:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __68__HMDApplicationVendorIDStore_removeVendorIDForApplicationBundleId___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  int v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "applicationVendorIdMapping");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = objc_msgSend(v3, "spiClient");
      v5 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
      if (!v4)
      {
        if (v7)
        {
          HMFGetLogIdentifier();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = *(_QWORD *)(a1 + 32);
          v25 = 138543618;
          v26 = v14;
          v27 = 2112;
          v28 = v15;
          _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Removing mapping for application bundle id %@", (uint8_t *)&v25, 0x16u);

        }
        objc_autoreleasePoolPop(v5);
        objc_msgSend(*(id *)(a1 + 40), "applicationVendorIdMapping");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

        if (isWatch())
        {
          objc_msgSend(v3, "companionAppBundleId");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(*(id *)(a1 + 40), "applicationVendorIdMapping");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "companionAppBundleId");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "removeObjectForKey:", v19);

          }
          else
          {
            v20 = (void *)MEMORY[0x227676638]();
            v21 = *(id *)(a1 + 40);
            HMFGetOSLogHandle();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = *(_QWORD *)(a1 + 32);
              v25 = 138543618;
              v26 = v23;
              v27 = 2112;
              v28 = v24;
              _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@WatchOS : Companion app does not exist for %@. Hence not removing the mapping.", (uint8_t *)&v25, 0x16u);

            }
            objc_autoreleasePoolPop(v20);
          }
        }
        objc_msgSend(*(id *)(a1 + 40), "_save");
        goto LABEL_21;
      }
      if (v7)
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543362;
        v26 = v8;
        _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@This is an internal client, do not remove it.", (uint8_t *)&v25, 0xCu);

      }
    }
    else
    {
      v5 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *(_QWORD *)(a1 + 32);
        v25 = 138543618;
        v26 = v12;
        v27 = 2112;
        v28 = v13;
        _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Unknown application %@, cannot remove", (uint8_t *)&v25, 0x16u);

      }
    }

    objc_autoreleasePoolPop(v5);
LABEL_21:

    return;
  }
  v9 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543362;
    v26 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Received invalid application bundle identifier, cannot remove", (uint8_t *)&v25, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
}

uint64_t __84__HMDApplicationVendorIDStore_addVendorID_applicationBundleId_companionAppBundleId___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAndSaveVendorID:applicationBundleId:companionAppBundleId:spiClient:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0);
}

uint64_t __63__HMDApplicationVendorIDStore_addVendorID_applicationBundleId___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAndSaveVendorID:applicationBundleId:companionAppBundleId:spiClient:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, 0);
}

uint64_t __73__HMDApplicationVendorIDStore_addVendorID_applicationBundleId_spiClient___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAndSaveVendorID:applicationBundleId:companionAppBundleId:spiClient:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(unsigned __int8 *)(a1 + 56));
}

void __54__HMDApplicationVendorIDStore_vendorIDForApplication___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_vendorIDForApplication:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __47__HMDApplicationVendorIDStore_checkCorrectness__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  __int128 v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id obj;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "applicationVendorIdMapping");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  v32 = a1;
  v33 = v2;
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v39;
    *(_QWORD *)&v4 = 138544130;
    v31 = v4;
    v34 = *(_QWORD *)v39;
    do
    {
      v7 = 0;
      v35 = v5;
      do
      {
        if (*(_QWORD *)v39 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 32), "applicationVendorIdMapping", v31);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v10, "spiClient") & 1) == 0)
        {
          if (!isWatch()
            || (objc_msgSend(v10, "companionAppBundleId"),
                v11 = (void *)objc_claimAutoreleasedReturnValue(),
                v11,
                v11))
          {
            v12 = objc_alloc(MEMORY[0x24BDC1540]);
            v37 = 0;
            v13 = (void *)objc_msgSend(v12, "initWithBundleIdentifier:allowPlaceholder:error:", v8, 0, &v37);
            v14 = v37;
            if (v13)
            {
              objc_msgSend(v13, "deviceIdentifierForVendor");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "UUIDString");
              v16 = objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v16, "hm_generateSHA1");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v10, "vendorIdSha1");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v16) = objc_msgSend(v17, "isEqualToData:", v18);

              if ((v16 & 1) == 0)
              {
                v19 = (void *)MEMORY[0x227676638]();
                HMFGetOSLogHandle();
                v20 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "vendorIdSha1");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v31;
                  v43 = v21;
                  v44 = 2112;
                  v45 = v22;
                  v46 = 2112;
                  v47 = v17;
                  v48 = 2112;
                  v49 = v8;
                  _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Vendor IDs are mismatching (Known: %@, Now: %@) for bundle ID: %@", buf, 0x2Au);

                  v2 = v33;
                  a1 = v32;
                }

                objc_autoreleasePoolPop(v19);
                objc_msgSend(v2, "addObject:", v8);
                if (isWatch())
                {
                  objc_msgSend(v10, "companionAppBundleId");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "addObject:", v23);

                  v2 = v33;
                }
              }
              v6 = v34;
LABEL_20:

              v5 = v35;
            }
            else
            {
              v24 = (void *)MEMORY[0x227676638]();
              HMFGetOSLogHandle();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v43 = v26;
                v44 = 2112;
                v45 = v8;
                v46 = 2112;
                v47 = v14;
                _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Bundle ID: %@ does not exist (or cannot determine) anymore, removing it from the store: %@", buf, 0x20u);

                v5 = v35;
              }

              objc_autoreleasePoolPop(v24);
              objc_msgSend(v2, "addObject:", v8);
              v6 = v34;
              if (isWatch())
              {
                objc_msgSend(v10, "companionAppBundleId");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v2, "addObject:", v17);
                goto LABEL_20;
              }
            }

          }
        }

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v2, "count"))
  {
    v27 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v29;
      v44 = 2112;
      v45 = v33;
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Removing the entries for bundle IDs: %@ from the store", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(*(id *)(v32 + 32), "applicationVendorIdMapping");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "removeObjectsForKeys:", v33);

    v2 = v33;
    objc_msgSend(*(id *)(v32 + 32), "_save");
  }

}

+ (id)sharedStore
{
  if (sharedStore_onceToken != -1)
    dispatch_once(&sharedStore_onceToken, &__block_literal_global_125890);
  return (id)store;
}

uint64_t __42__HMDApplicationVendorIDStore_sharedStore__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  HMDApplicationVendorIDStore *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  +[HMDPersistentStore unarchiveVendorStore](HMDPersistentStore, "unarchiveVendorStore");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)store;
  store = v0;

  v2 = (void *)store;
  if (!store)
  {
    v3 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v5;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@No archived vendor ID store, creating a new one", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    v6 = objc_alloc_init(HMDApplicationVendorIDStore);
    v7 = (void *)store;
    store = (uint64_t)v6;

    v2 = (void *)store;
  }
  return objc_msgSend(v2, "checkCorrectness");
}

@end
