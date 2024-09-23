@implementation HMMTRVendorMetadataFileStore

- (HMMTRVendorMetadataFileStore)initWithFileURL:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  HMMTRFileManager *v7;
  HMMTRVendorMetadataFileStore *v8;

  v4 = (objc_class *)MEMORY[0x24BE28A08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = objc_alloc_init(HMMTRFileManager);
  v8 = -[HMMTRVendorMetadataFileStore initWithFileURL:uarpController:fileManager:](self, "initWithFileURL:uarpController:fileManager:", v5, v6, v7);

  return v8;
}

- (HMMTRVendorMetadataFileStore)initWithFileURL:(id)a3 uarpController:(id)a4 fileManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMMTRVendorMetadataFileStore *v13;
  HMMTRVendorMetadataFileStore *v14;
  NSMutableSet *batchedAccessories;
  HMMTRVendorMetadataFileStore *v17;
  SEL v18;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v12 = v11;
  if (!v11)
  {
LABEL_9:
    v17 = (HMMTRVendorMetadataFileStore *)_HMFPreconditionFailure();
    return (HMMTRVendorMetadataFileStore *)-[HMMTRVendorMetadataFileStore metadata](v17, v18);
  }
  v19.receiver = self;
  v19.super_class = (Class)HMMTRVendorMetadataFileStore;
  v13 = -[HMMTRVendorMetadataFileStore init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_fileURL, a3);
    objc_storeStrong((id *)&v14->_uarpController, a4);
    -[UARPController setDelegate:](v14->_uarpController, "setDelegate:", v14);
    batchedAccessories = v14->_batchedAccessories;
    v14->_batchedAccessories = 0;

    objc_storeStrong((id *)&v14->_fileManager, a5);
  }

  return v14;
}

- (HMMTRVendorMetadata)metadata
{
  void *v3;
  void *v4;
  void *v5;
  HMMTRVendorMetadata *v6;
  HMMTRVendorMetadata *v7;
  HMMTRVendorMetadata *v8;
  void *v9;
  void *v10;
  HMMTRVendorMetadataFileStore *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[HMMTRVendorMetadataFileStore fileManager](self, "fileManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRVendorMetadataFileStore fileURL](self, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithContentsOfURL:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = -[HMMTRVendorMetadata initWithDictionaryRepresentation:]([HMMTRVendorMetadata alloc], "initWithDictionaryRepresentation:", v5);
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      v10 = (void *)MEMORY[0x242656984]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v13;
        _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode vendor metadata from dictionary representation", (uint8_t *)&v15, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      v8 = objc_alloc_init(HMMTRVendorMetadata);
    }
    v9 = v8;

  }
  else
  {
    -[HMMTRVendorMetadataFileStore staticMetadata](self, "staticMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (HMMTRVendorMetadata *)v9;
}

- (void)fetchCloudMetadata
{
  void *v3;
  HMMTRVendorMetadataFileStore *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  HMMTRVendorMetadataFileStore *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  HMMTRVendorMetadataFileStore *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x242656984](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543362;
    v22 = v6;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@Fetching cloud metadata by requesting supported accessories from UARP controller", (uint8_t *)&v21, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMMTRVendorMetadataFileStore batchedAccessories](v4, "batchedAccessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x242656984]();
    v9 = v4;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRVendorMetadataFileStore batchedAccessories](v9, "batchedAccessories");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");
      v21 = 138543618;
      v22 = v11;
      v23 = 2048;
      v24 = v13;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Unexpected, found %lu batched accessories. Previous batch may not be complete", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMMTRVendorMetadataFileStore setBatchedAccessories:](v9, "setBatchedAccessories:", 0);
  }
  v14 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[HMMTRVendorMetadataFileStore setBatchedAccessories:](v4, "setBatchedAccessories:", v14);

  -[HMMTRVendorMetadataFileStore uarpController](v4, "uarpController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "getBatchedSupportedAccessories:assetLocationType:", 0, 15);

  if ((v16 & 1) == 0)
  {
    v17 = (void *)MEMORY[0x242656984]();
    v18 = v4;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v20;
      _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to request supported accessories from UARP controller", (uint8_t *)&v21, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
  }
}

- (id)staticMetadataFileURL
{
  void *v2;
  void *v3;
  HMMTRVendorMetadataFileStore *v5;
  SEL v6;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("vendor-metadata"), CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return v3;
  v5 = (HMMTRVendorMetadataFileStore *)_HMFPreconditionFailure();
  return -[HMMTRVendorMetadataFileStore staticMetadata](v5, v6);
}

- (id)staticMetadata
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  HMMTRVendorMetadata *v7;
  HMMTRVendorMetadata *v8;
  HMMTRVendorMetadata *v9;
  void *v10;
  HMMTRVendorMetadataFileStore *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMMTRVendorMetadata *v15;
  void *v16;
  HMMTRVendorMetadataFileStore *v17;
  NSObject *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[HMMTRVendorMetadataFileStore fileManager](self, "fileManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRVendorMetadataFileStore staticMetadataFileURL](self, "staticMetadataFileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v3, "dictionaryWithContentsOfURL:error:", v4, &v21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v21;

  if (v5)
  {
    v7 = -[HMMTRVendorMetadata initWithDictionaryRepresentation:]([HMMTRVendorMetadata alloc], "initWithDictionaryRepresentation:", v5);
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      v16 = (void *)MEMORY[0x242656984]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v23 = v19;
        _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode local vendor metadata from dictionary representation", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
      v9 = objc_alloc_init(HMMTRVendorMetadata);
    }
    v15 = v9;

  }
  else
  {
    v10 = (void *)MEMORY[0x242656984]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRVendorMetadataFileStore staticMetadataFileURL](v11, "staticMetadataFileURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v13;
      v24 = 2112;
      v25 = v14;
      v26 = 2112;
      v27 = v6;
      _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to load local vendor metadata at file URL %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v15 = objc_alloc_init(HMMTRVendorMetadata);
  }

  return v15;
}

- (void)_saveMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  HMMTRVendorMetadataFileStore *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMMTRVendorMetadataFileStore fileManager](self, "fileManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRVendorMetadataFileStore fileURL](self, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v8 = objc_msgSend(v5, "writeDictionary:toURL:error:", v6, v7, &v20);
  v9 = v20;

  v10 = (void *)MEMORY[0x242656984]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRVendorMetadataFileStore fileURL](v11, "fileURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v14;
      v23 = 2112;
      v24 = v15;
      v16 = "%{public}@Successfully saved metadata to %@";
      v17 = v13;
      v18 = OS_LOG_TYPE_INFO;
      v19 = 22;
LABEL_6:
      _os_log_impl(&dword_23E95B000, v17, v18, v16, buf, v19);

    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRVendorMetadataFileStore fileURL](v11, "fileURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v22 = v14;
    v23 = 2112;
    v24 = v15;
    v25 = 2112;
    v26 = v9;
    v16 = "%{public}@Failed to write vendor metadata to %@: %@";
    v17 = v13;
    v18 = OS_LOG_TYPE_ERROR;
    v19 = 32;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v10);
}

- (void)_addVendorInfoToMetadata:(id)a3 accessories:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  HMMTRMutableVendorMetadataVendor *v19;
  void *v20;
  void *v21;
  HMMTRVendorMetadataFileStore *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  HMMTRVendorMetadataFileStore *v27;
  NSObject *v28;
  void *v29;
  id v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v30 = a3;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = a4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v10, "hardwareID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = v11;
        else
          v12 = 0;
        v13 = v12;

        if (v13)
        {
          objc_msgSend(v13, "metadata");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v10, "productNumber");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("0000"));

            if (v16)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v13, "vendorID"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "vendorWithID:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = (HMMTRMutableVendorMetadataVendor *)objc_msgSend(v18, "mutableCopy");

              if (!v19)
              {
                v19 = -[HMMTRVendorMetadataVendor initWithIdentifier:]([HMMTRMutableVendorMetadataVendor alloc], "initWithIdentifier:", v17);
                objc_msgSend(v14, "vendorName");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                -[HMMTRVendorMetadataVendor setName:](v19, "setName:", v20);

                objc_msgSend(v30, "addVendor:", v19);
              }

            }
          }
          else
          {
            v26 = (void *)MEMORY[0x242656984]();
            v27 = self;
            HMFGetOSLogHandle();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v37 = v29;
              v38 = 2112;
              v39 = v13;
              _os_log_impl(&dword_23E95B000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find metadata on chip device information: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v26);
          }

        }
        else
        {
          v21 = (void *)MEMORY[0x242656984]();
          v22 = self;
          HMFGetOSLogHandle();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "hardwareID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v37 = v24;
            v38 = 2112;
            v39 = v25;
            _os_log_impl(&dword_23E95B000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Received supported vendor record with unexpected hardwareID: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v21);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v7);
  }

}

- (void)_addProductInfoToMetadata:(id)a3 accessories:(id)a4
{
  id v6;
  __int128 v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  HMMTRVendorMetadataFileStore *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  HMMTRVendorMetadataFileStore *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  HMMTRVendorMetadataFileStore *v36;
  NSObject *v37;
  void *v38;
  HMMTRMutableVendorMetadataProduct *v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  void *v44;
  HMMTRVendorMetadataFileStore *v45;
  uint64_t v46;
  void *v47;
  id obj;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  void *v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = a4;
  v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
  if (v49)
  {
    v8 = *(_QWORD *)v51;
    *(_QWORD *)&v7 = 138543874;
    v43 = v7;
    v44 = v6;
    v45 = self;
    v46 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v51 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(v10, "hardwareID", v43);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = v11;
        else
          v12 = 0;
        v13 = v12;

        if (v13)
        {
          objc_msgSend(v13, "metadata");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v10, "productNumber");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("0000"));

            if ((v16 & 1) == 0)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v13, "vendorID"));
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "vendorWithID:");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = (void *)objc_msgSend(v17, "mutableCopy");

              if (v18)
              {
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v13, "productID"));
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                +[HMMTRProtocolMap protocolMap](HMMTRProtocolMap, "protocolMap");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v14, "accessoryCategoryNumber"));
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v54 = v21;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v54, 1);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "categoriesForDeviceTypes:", v22);
                v23 = (void *)objc_claimAutoreleasedReturnValue();

                if (v23)
                {
                  objc_msgSend(v23, "firstObject");
                  v24 = objc_claimAutoreleasedReturnValue();
                  if (v24)
                    v25 = (void *)v24;
                  else
                    v25 = &unk_250F3F1B0;
                }
                else
                {
                  v25 = &unk_250F3F1B0;
                }
                v39 = -[HMMTRVendorMetadataProduct initWithIdentifier:categoryNumber:]([HMMTRMutableVendorMetadataProduct alloc], "initWithIdentifier:categoryNumber:", v19, v25);
                objc_msgSend(v14, "accessoryMarketingName");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                -[HMMTRVendorMetadataProduct setName:](v39, "setName:", v40);

                objc_msgSend(v14, "accessoryMarketingName");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                -[HMMTRVendorMetadataProduct setModel:](v39, "setModel:", v41);

                objc_msgSend(v14, "accessoryInstallationGuideURL");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                -[HMMTRVendorMetadataProduct setInstallationGuideURL:](v39, "setInstallationGuideURL:", v42);

                objc_msgSend(v18, "addProduct:", v39);
                v6 = v44;
                objc_msgSend(v44, "addVendor:", v18);

                self = v45;
              }
              else
              {
                v35 = (void *)MEMORY[0x242656984]();
                v36 = self;
                HMFGetOSLogHandle();
                v37 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                {
                  HMFGetLogIdentifier();
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v43;
                  v56 = v38;
                  v57 = 2112;
                  v58 = v47;
                  v59 = 2112;
                  v60 = v10;
                  _os_log_impl(&dword_23E95B000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Vendor %@ not found for product record %@", buf, 0x20u);

                  self = v45;
                }

                objc_autoreleasePoolPop(v35);
              }

              v8 = v46;
            }
          }
          else
          {
            v31 = (void *)MEMORY[0x242656984]();
            v32 = self;
            HMFGetOSLogHandle();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v56 = v34;
              v57 = 2112;
              v58 = v13;
              _os_log_impl(&dword_23E95B000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find metadata on chip device information: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v31);
          }

        }
        else
        {
          v26 = (void *)MEMORY[0x242656984]();
          v27 = self;
          HMFGetOSLogHandle();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "hardwareID");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v56 = v29;
            v57 = 2112;
            v58 = v30;
            _os_log_impl(&dword_23E95B000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Received supported accessory with unexpected hardwareID: %@", buf, 0x16u);

            v8 = v46;
          }

          objc_autoreleasePoolPop(v26);
        }

      }
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
    }
    while (v49);
  }

}

- (void)_processSupportedAccessories:(id)a3
{
  id v4;
  void *v5;
  HMMTRVendorMetadataFileStore *v6;
  NSObject *v7;
  void *v8;
  HMMTRMutableVendorMetadata *v9;
  void *v10;
  HMMTRVendorMetadataFileStore *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v8;
    v16 = 2048;
    v17 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Processing all supported accessories, number of entries: %lu", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (objc_msgSend(v4, "count"))
  {
    v9 = objc_alloc_init(HMMTRMutableVendorMetadata);
    -[HMMTRVendorMetadataFileStore _addVendorInfoToMetadata:accessories:](v6, "_addVendorInfoToMetadata:accessories:", v9, v4);
    -[HMMTRVendorMetadataFileStore _addProductInfoToMetadata:accessories:](v6, "_addProductInfoToMetadata:accessories:", v9, v4);
    -[HMMTRVendorMetadataFileStore _saveMetadata:](v6, "_saveMetadata:", v9);

  }
  else
  {
    v10 = (void *)MEMORY[0x242656984]();
    v11 = v6;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_ERROR, "%{public}@No vendor/product information available", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)supportedAccessories:(id)a3 forProductGroup:(id)a4 isComplete:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  HMMTRVendorMetadataFileStore *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v5 = a5;
  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x242656984]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v8, "count");
    HMFBooleanToString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v13;
    v31 = 2048;
    v32 = v14;
    v33 = 2112;
    v34 = v15;
    _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_INFO, "%{public}@Received batched supported accessories, number of entries: %lu, isComplete: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v25;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v20);
        -[HMMTRVendorMetadataFileStore batchedAccessories](v11, "batchedAccessories", (_QWORD)v24);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v18);
  }

  if (v5)
  {
    -[HMMTRVendorMetadataFileStore batchedAccessories](v11, "batchedAccessories");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRVendorMetadataFileStore _processSupportedAccessories:](v11, "_processSupportedAccessories:", v23);

    -[HMMTRVendorMetadataFileStore setBatchedAccessories:](v11, "setBatchedAccessories:", 0);
  }

}

- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5
{
  return 0;
}

- (NSURL)fileURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (UARPController)uarpController
{
  return (UARPController *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableSet)batchedAccessories
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBatchedAccessories:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (HMMTRFileManager)fileManager
{
  return (HMMTRFileManager *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_batchedAccessories, 0);
  objc_storeStrong((id *)&self->_uarpController, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t15 != -1)
    dispatch_once(&logCategory__hmf_once_t15, &__block_literal_global_685);
  return (id)logCategory__hmf_once_v16;
}

void __43__HMMTRVendorMetadataFileStore_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v16;
  logCategory__hmf_once_v16 = v0;

}

@end
