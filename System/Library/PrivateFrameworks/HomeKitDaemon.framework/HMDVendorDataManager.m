@implementation HMDVendorDataManager

- (HMDVendorDataManager)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDVendorDataManager)initWithWorkQueue:(id)a3 urlSession:(id)a4 fetchTimer:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDVendorDataManager *v12;
  HMDVendorDataManager *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDVendorDataManager;
  v12 = -[HMDVendorDataManager init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_workQueue, a3);
    objc_storeStrong((id *)&v13->_urlSession, a4);
    objc_storeStrong((id *)&v13->_fetchTimer, a5);
    objc_msgSend(v11, "setDelegate:", v13);
  }

  return v13;
}

- (HMDVendorDataManager)initWithDefaults
{
  uint64_t v3;
  double v4;
  double v5;
  void *v6;
  HMDVendorDataManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  const char *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  HMDVendorDataManager *v23;
  void *v24;
  HMDVendorDataManager *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  const __CFString *v49;
  __int16 v50;
  const __CFString *v51;
  __int16 v52;
  void *v53;
  const __CFString *v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x24BDAC8D0];
  v3 = HMFUptime();
  v5 = v4;
  v6 = (void *)MEMORY[0x227676638](v3);
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v41 = v9;
    v42 = 2114;
    v43 = CFSTR("vendorDataManagerStart");
    v44 = 2112;
    v45 = CFSTR("Vendor Data Manager loading");
    v46 = 2114;
    v47 = CFSTR("state");
    v48 = 2112;
    v49 = CFSTR("start");
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x24BE4F1D0]);
  v54 = CFSTR("state");
  v55[0] = CFSTR("start");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithTag:data:", CFSTR("vendorDataManagerStart"), v12);
  objc_msgSend(MEMORY[0x24BE3F138], "currentTagProcessorList");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "submitTaggedEvent:processorList:", v13, v14);

  HMDispatchQueueNameString();
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v16 = (const char *)objc_msgSend(v15, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = dispatch_queue_create(v16, v17);

  objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHTTPCookieAcceptPolicy:", 1);
  objc_msgSend(v19, "setHTTPCookieStorage:", 0);
  objc_msgSend(v19, "setHTTPShouldSetCookies:", 0);
  objc_msgSend(v19, "setURLCredentialStorage:", 0);
  objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc(MEMORY[0x24BE3F298]);
  v22 = (void *)objc_msgSend(v21, "initWithTimeInterval:options:", 5, *(double *)&vendorInfoFetchPeriod);
  v23 = -[HMDVendorDataManager initWithWorkQueue:urlSession:fetchTimer:](v7, "initWithWorkQueue:urlSession:fetchTimer:", v18, v20, v22);
  v24 = (void *)MEMORY[0x227676638](-[HMDVendorDataManager _loadDatabaseFromLocalFiles](v23, "_loadDatabaseFromLocalFiles"));
  v25 = v23;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x24BDD17C8];
    HMFUptime();
    objc_msgSend(v28, "stringWithFormat:", CFSTR("%.3f"), v29 - v5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v41 = v27;
    v42 = 2114;
    v43 = CFSTR("vendorDataManagerDone");
    v44 = 2112;
    v45 = CFSTR("Vendor Data Manager loaded");
    v46 = 2114;
    v47 = CFSTR("state");
    v48 = 2112;
    v49 = CFSTR("end");
    v50 = 2114;
    v51 = CFSTR("duration");
    v52 = 2112;
    v53 = v30;
    _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x48u);

  }
  objc_autoreleasePoolPop(v24);
  objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_alloc(MEMORY[0x24BE4F1D0]);
  v33 = (void *)MEMORY[0x24BDD17C8];
  HMFUptime();
  objc_msgSend(v33, "stringWithFormat:", CFSTR("%.3f"), v34 - v5);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  HMDTaggedLoggingCreateDictionary();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v32, "initWithTag:data:", CFSTR("vendorDataManagerDone"), v36, CFSTR("state"), CFSTR("end"), CFSTR("duration"), v35);
  objc_msgSend(MEMORY[0x24BE3F138], "currentTagProcessorList");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "submitTaggedEvent:processorList:", v37, v38);

  return v25;
}

- (id)modelCollectionForManufacturer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDVendorDataManager collectionsByManufacturer](self, "collectionsByManufacturer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)vendorModelEntryForManufacturer:(id)a3 model:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  -[HMDVendorDataManager modelCollectionForManufacturer:](self, "modelCollectionForManufacturer:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "lookupModel:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)vendorModelEntryForProductData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDVendorDataManager *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD14A8];
  v5 = a3;
  objc_msgSend(v4, "whitespaceCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[HMDAccessory validateProductData:](HMDAccessory, "validateProductData:", v8))
  {
    -[HMDVendorDataManager entriesByProductData](self, "entriesByProductData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

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
      v16 = 138543618;
      v17 = v14;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Invalid product data: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

- (BOOL)databaseContainsManufacturer:(id)a3
{
  void *v3;
  BOOL v4;

  -[HMDVendorDataManager modelCollectionForManufacturer:](self, "modelCollectionForManufacturer:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (NSURL)urlForBundledPlist
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("ManufacturerDatabase"), CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)urlForBundledInternalPlist
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("ManufacturerDatabase-local"), CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (BOOL)_loadDatabaseFromDictionary:(id)a3
{
  _BOOL4 v4;
  id v5;
  id v6;
  id v8;
  id v9;
  uint64_t v10;

  v9 = 0;
  v10 = 0;
  v8 = 0;
  v4 = -[HMDVendorDataManager _parseDatabaseFromDictionary:dataVersion:collectionsByManufacturer:entriesByProductData:](self, "_parseDatabaseFromDictionary:dataVersion:collectionsByManufacturer:entriesByProductData:", a3, &v10, &v9, &v8);
  v5 = v9;
  v6 = v8;
  if (v4)
  {
    -[HMDVendorDataManager setDataVersion:](self, "setDataVersion:", v10);
    -[HMDVendorDataManager setCollectionsByManufacturer:](self, "setCollectionsByManufacturer:", v5);
    -[HMDVendorDataManager setEntriesByProductData:](self, "setEntriesByProductData:", v6);
  }

  return v4;
}

- (BOOL)_loadDatabaseFromFileURL:(id)a3 fileDescription:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  HMDVendorDataManager *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  BOOL v15;
  HMDVendorDataManager *v16;
  NSObject *v17;
  void *v18;
  BOOL v19;
  void *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v25 = 0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:error:", v6, &v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v25;
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v20;
      v28 = 2112;
      v29 = v7;
      v30 = 2112;
      v31 = v9;
      v21 = "%{public}@Failed to read %@ plist file on disk: %@";
      v22 = v13;
      v23 = 32;
LABEL_12:
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);

    }
LABEL_13:
    v19 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v14;
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Read data from %@ plist file on disk", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  v15 = -[HMDVendorDataManager _loadDatabaseFromDictionary:](v11, "_loadDatabaseFromDictionary:", v8);
  v10 = (void *)MEMORY[0x227676638]();
  v16 = v11;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  v13 = v17;
  if (!v15)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v20;
      v28 = 2112;
      v29 = v7;
      v21 = "%{public}@Failed to parse %@ plist file on disk";
      v22 = v13;
      v23 = 22;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v18;
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Loaded database from %@ plist file on disk", buf, 0x16u);

  }
  v19 = 1;
LABEL_14:

  objc_autoreleasePoolPop(v10);
  return v19;
}

- (BOOL)_loadDatabaseFromFilePath:(id)a3 fileDescription:(id)a4
{
  void *v6;
  id v7;
  void *v8;

  v6 = (void *)MEMORY[0x24BDBCF48];
  v7 = a4;
  objc_msgSend(v6, "fileURLWithPath:isDirectory:", a3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[HMDVendorDataManager _loadDatabaseFromFileURL:fileDescription:](self, "_loadDatabaseFromFileURL:fileDescription:", v8, v7);

  return (char)self;
}

- (void)_loadDatabaseFromLocalFiles
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __51__HMDVendorDataManager__loadDatabaseFromLocalFiles__block_invoke;
  v2[3] = &unk_24E79C240;
  v2[4] = self;
  objc_msgSend(MEMORY[0x24BE3F138], "activityWithName:parent:options:block:", CFSTR("ManufacturerDB.load"), 0, 1, v2);
}

- (void)_start
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDVendorDataManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__HMDVendorDataManager__start__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_fetchDataFromServer
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDVendorDataManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  HMDVendorDataManager *v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id location;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDD16B0]);
  objc_msgSend((id)objc_opt_class(), "dbURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithURL:", v4);

  objc_msgSend(v5, "setHTTPMethod:", CFSTR("GET"));
  -[HMDVendorDataManager urlSession](self, "urlSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configuration");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v7, "URLCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cachedResponseForRequest:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "response");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v7) = objc_opt_isKindOfClass();

  if ((v7 & 1) != 0)
  {
    objc_msgSend(v9, "response");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v15;
      v30 = 2112;
      v31 = v11;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Found a cached vendor info response: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);

  }
  objc_initWeak(&location, self);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:parent:options:", CFSTR("ManufacturerDB.fetch"), 0, 1);
  -[HMDVendorDataManager urlSession](self, "urlSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __44__HMDVendorDataManager__fetchDataFromServer__block_invoke;
  v24[3] = &unk_24E78C288;
  objc_copyWeak(&v26, &location);
  v18 = v16;
  v25 = v18;
  objc_msgSend(v17, "dataTaskWithRequest:completionHandler:", v5, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x227676638]();
  v21 = self;
  HMFGetOSLogHandle();
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v23;
    v30 = 2112;
    v31 = v19;
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Resuming task: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v20);
  objc_msgSend(v19, "resume");

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

- (void)_handleServerResponse:(id)a3 withData:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  HMDVendorDataManager *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  HMDVendorDataManager *v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDVendorDataManager fetchTimer](self, "fetchTimer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "kick");

  if (v10)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543618;
      v27 = v15;
      v28 = 2112;
      v29 = (uint64_t)v10;
      v16 = "%{public}@Failed to get the vendor info with error: %@";
      v17 = v14;
      v18 = 22;
LABEL_9:
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v26, v18);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v15;
      v16 = "%{public}@Failed to receive HTTP response";
      v17 = v14;
      v18 = 12;
      goto LABEL_9;
    }
LABEL_10:

    objc_autoreleasePoolPop(v12);
    goto LABEL_11;
  }
  v19 = v8;
  v20 = objc_msgSend(v19, "statusCode");
  if (v20 == 200)
  {
    -[HMDVendorDataManager _handleDataFromServer:](self, "_handleDataFromServer:", v9);
  }
  else
  {
    v21 = v20;
    v22 = (void *)MEMORY[0x227676638]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543618;
      v27 = v25;
      v28 = 2048;
      v29 = v21;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Received status code %ld from vendor info request", (uint8_t *)&v26, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
  }

LABEL_11:
}

- (void)_handleDataFromServer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _BOOL4 v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  HMDVendorDataManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDVendorDataManager *v29;
  NSObject *v30;
  void *v31;
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  id v38;
  const __CFString *v39;
  void *v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v38 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v4, 0, 0, &v38);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v38;
  if (v5)
  {
    v36 = 0;
    v37 = 0;
    v35 = 0;
    v7 = -[HMDVendorDataManager _parseDatabaseFromDictionary:dataVersion:collectionsByManufacturer:entriesByProductData:](self, "_parseDatabaseFromDictionary:dataVersion:collectionsByManufacturer:entriesByProductData:", v5, &v37, &v36, &v35);
    v8 = v36;
    v9 = v35;
    v10 = v9;
    if (v7)
    {
      v32 = v9;
      v11 = (void *)MEMORY[0x227676638]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v42 = v14;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully parsed database from server, saving to disk", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(v4, "writeToFile:atomically:", CFSTR("/var/mobile/Library/homed/vendor-database"), 1);
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __46__HMDVendorDataManager__handleDataFromServer___block_invoke;
      v33[3] = &unk_24E78C2B0;
      v33[4] = v12;
      v16 = v15;
      v34 = v16;
      objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v33);
      v17 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(v8, "allKeys");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setWithArray:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x24BDBCEF0];
      -[HMDVendorDataManager collectionsByManufacturer](v12, "collectionsByManufacturer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "allKeys");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setWithArray:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "minusSet:", v19);
      if (objc_msgSend(v23, "count"))
      {
        objc_msgSend(v23, "allObjects");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObjectsFromArray:", v24);

      }
      -[HMDVendorDataManager setDataVersion:](v12, "setDataVersion:", v37);
      -[HMDVendorDataManager setCollectionsByManufacturer:](v12, "setCollectionsByManufacturer:", v8);
      v10 = v32;
      -[HMDVendorDataManager setEntriesByProductData:](v12, "setEntriesByProductData:", v32);
      if (objc_msgSend(v16, "count"))
      {
        v39 = CFSTR("ChangedManufacturer");
        objc_msgSend(v16, "allObjects");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v25;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "postNotificationName:object:userInfo:", CFSTR("kHMDVendorInfoUpdatedNotification"), v12, v26);

        v10 = v32;
      }

    }
  }
  else
  {
    v28 = (void *)MEMORY[0x227676638]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v31;
      v43 = 2112;
      v44 = v6;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Error while deserializing plist from server data: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v28);
  }

}

- (BOOL)_parseDatabaseFromDictionary:(id)a3 dataVersion:(int64_t *)a4 collectionsByManufacturer:(id *)a5 entriesByProductData:(id *)a6
{
  id v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  HMDVendorDataManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int64_t v26;
  void *v27;
  HMDVendorDataManager *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  id v33;
  id v34;
  void *v35;
  HMDVendorDataManager *v36;
  NSObject *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  HMDVendorDataManager *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  HMDVendorDataManager *v57;
  NSObject *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  BOOL v62;
  void *v64;
  uint64_t v65;
  NSObject *v66;
  NSObject *v67;
  uint64_t v68;
  double v69;
  void *v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  HMDVendorDataManager *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  HMDVendorDataManager *v90;
  NSObject *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  BOOL v104;
  void *v105;
  void *v106;
  void *context;
  void *contexta;
  HMDVendorDataManager *v109;
  void *v110;
  id v111;
  id v112;
  uint8_t buf[4];
  void *v114;
  __int16 v115;
  const __CFString *v116;
  __int16 v117;
  const __CFString *v118;
  __int16 v119;
  const __CFString *v120;
  __int16 v121;
  const __CFString *v122;
  __int16 v123;
  const __CFString *v124;
  __int16 v125;
  void *v126;
  __int16 v127;
  const __CFString *v128;
  __int16 v129;
  void *v130;
  __int16 v131;
  const __CFString *v132;
  __int16 v133;
  void *v134;
  const __CFString *v135;
  _QWORD v136[3];

  v136[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = HMFUptime();
  v13 = v12;
  v14 = (void *)MEMORY[0x227676638](v11);
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v114 = v17;
    v115 = 2114;
    v116 = CFSTR("vendorDataManagerStart");
    v117 = 2112;
    v118 = CFSTR("Parsing vendor database");
    v119 = 2114;
    v120 = CFSTR("state");
    v121 = 2112;
    v122 = CFSTR("vendorDataManagerParsingData");
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v14);
  objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc(MEMORY[0x24BE4F1D0]);
  v135 = CFSTR("state");
  v136[0] = CFSTR("vendorDataManagerParsingData");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v136, &v135, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithTag:data:", CFSTR("vendorDataManagerStart"), v20);
  objc_msgSend(MEMORY[0x24BE3F138], "currentTagProcessorList");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "submitTaggedEvent:processorList:", v21, v22);

  objc_msgSend(v10, "hmf_numberForKey:", CFSTR("SchemaVersion"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "integerValue");

  if (v24 != 1)
  {
    v35 = (void *)MEMORY[0x227676638]();
    v36 = v15;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
    v39 = (void *)MEMORY[0x24BDBD1C0];
    if (v38)
    {
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "hmf_numberForKey:", CFSTR("SchemaVersion"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545410;
      v114 = v40;
      v115 = 2114;
      v116 = CFSTR("vendorDataManagerStart");
      v117 = 2112;
      v118 = CFSTR("Error: Unsupported schema version");
      v119 = 2114;
      v120 = CFSTR("state");
      v121 = 2112;
      v122 = CFSTR("vendorDataManagerParsedData");
      v123 = 2114;
      v124 = CFSTR("success");
      v125 = 2112;
      v126 = v39;
      v127 = 2114;
      v128 = CFSTR("DataVersion");
      v129 = 2112;
      v130 = v41;
      _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x5Cu);

    }
    objc_autoreleasePoolPop(v35);
    objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v42 = objc_alloc(MEMORY[0x24BE4F1D0]);
    objc_msgSend(v10, "hmf_numberForKey:", CFSTR("SchemaVersion"));
    v34 = (id)objc_claimAutoreleasedReturnValue();
    HMDTaggedLoggingCreateDictionary();
    v43 = (id)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_msgSend(v42, "initWithTag:data:", CFSTR("vendorDataManagerStart"), v43, CFSTR("state"), CFSTR("vendorDataManagerParsedData"), CFSTR("success"), v39, CFSTR("DataVersion"), v34);
    v45 = (void *)MEMORY[0x24BE3F138];
    goto LABEL_20;
  }
  objc_msgSend(v10, "hmf_numberForKey:", CFSTR("DataVersion"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "integerValue");

  if (v26 <= 52)
  {
    v27 = (void *)MEMORY[0x227676638]();
    v28 = v15;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "hmf_numberForKey:", CFSTR("DataVersion"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545922;
      v114 = v30;
      v115 = 2114;
      v116 = CFSTR("vendorDataManagerStart");
      v117 = 2112;
      v118 = CFSTR("Error: Data version is lower than minimum");
      v119 = 2114;
      v120 = CFSTR("state");
      v121 = 2112;
      v122 = CFSTR("vendorDataManagerParsedData");
      v123 = 2114;
      v124 = CFSTR("success");
      v125 = 2112;
      v126 = (void *)MEMORY[0x24BDBD1C0];
      v127 = 2114;
      v128 = CFSTR("DataVersion");
      v129 = 2112;
      v130 = v31;
      v131 = 2114;
      v132 = CFSTR("MinVersion");
      v133 = 2112;
      v134 = &unk_24E96C098;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x70u);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v33 = objc_alloc(MEMORY[0x24BE4F1D0]);
    objc_msgSend(v10, "hmf_numberForKey:", CFSTR("DataVersion"));
    v34 = (id)objc_claimAutoreleasedReturnValue();
    v97 = v34;
    v93 = MEMORY[0x24BDBD1C0];
LABEL_19:
    HMDTaggedLoggingCreateDictionary();
    v43 = (id)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_msgSend(v33, "initWithTag:data:", CFSTR("vendorDataManagerStart"), v43, CFSTR("state"), CFSTR("vendorDataManagerParsedData"), CFSTR("success"), v93, CFSTR("DataVersion"), v97);
    v45 = (void *)MEMORY[0x24BE3F138];
LABEL_20:
    objc_msgSend(v45, "currentTagProcessorList");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString submitTaggedEvent:processorList:](v32, "submitTaggedEvent:processorList:", v44, v53);
LABEL_21:

LABEL_22:
    v62 = 0;
    goto LABEL_23;
  }
  if (v26 < -[HMDVendorDataManager dataVersion](v15, "dataVersion"))
  {
    v46 = (void *)MEMORY[0x227676638]();
    v47 = v15;
    HMFGetOSLogHandle();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v26);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -[HMDVendorDataManager dataVersion](v47, "dataVersion"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545922;
      v114 = v49;
      v115 = 2114;
      v116 = CFSTR("vendorDataManagerStart");
      v117 = 2112;
      v118 = CFSTR("Error: Data version is lower than current");
      v119 = 2114;
      v120 = CFSTR("state");
      v121 = 2112;
      v122 = CFSTR("vendorDataManagerParsedData");
      v123 = 2114;
      v124 = CFSTR("success");
      v125 = 2112;
      v126 = (void *)MEMORY[0x24BDBD1C0];
      v127 = 2114;
      v128 = CFSTR("DataVersion");
      v129 = 2112;
      v130 = v50;
      v131 = 2114;
      v132 = CFSTR("CurrentVersion");
      v133 = 2112;
      v134 = v51;
      _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_ERROR, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x70u);

    }
    objc_autoreleasePoolPop(v46);
    objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v52 = objc_alloc(MEMORY[0x24BE4F1D0]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v26);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -[HMDVendorDataManager dataVersion](v47, "dataVersion"));
    v43 = (id)objc_claimAutoreleasedReturnValue();
    v94 = MEMORY[0x24BDBD1C0];
    HMDTaggedLoggingCreateDictionary();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v52, "initWithTag:data:", CFSTR("vendorDataManagerStart"), v44, CFSTR("state"), CFSTR("vendorDataManagerParsedData"), CFSTR("success"), v94, CFSTR("DataVersion"), v34, CFSTR("CurrentVersion"), v43);
    objc_msgSend(MEMORY[0x24BE3F138], "currentTagProcessorList");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString submitTaggedEvent:processorList:](v32, "submitTaggedEvent:processorList:", v53, v54);

    goto LABEL_21;
  }
  v55 = -[HMDVendorDataManager dataVersion](v15, "dataVersion");
  v56 = (void *)MEMORY[0x227676638]();
  v57 = v15;
  HMFGetOSLogHandle();
  v58 = objc_claimAutoreleasedReturnValue();
  v59 = v58;
  if (v26 == v55)
  {
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v26);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545410;
      v114 = v60;
      v115 = 2114;
      v116 = CFSTR("vendorDataManagerStart");
      v117 = 2112;
      v118 = CFSTR("Data version is the same as current");
      v119 = 2114;
      v120 = CFSTR("state");
      v121 = 2112;
      v122 = CFSTR("vendorDataManagerParsedData");
      v123 = 2114;
      v124 = CFSTR("success");
      v125 = 2112;
      v126 = (void *)MEMORY[0x24BDBD1C0];
      v127 = 2114;
      v128 = CFSTR("DataVersion");
      v129 = 2112;
      v130 = v61;
      _os_log_impl(&dword_2218F0000, v59, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x5Cu);

    }
    objc_autoreleasePoolPop(v56);
    objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v33 = objc_alloc(MEMORY[0x24BE4F1D0]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v26);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    v97 = v34;
    v93 = MEMORY[0x24BDBD1C0];
    goto LABEL_19;
  }
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v114 = v64;
    v115 = 2048;
    v116 = (const __CFString *)v26;
    _os_log_impl(&dword_2218F0000, v59, OS_LOG_TYPE_DEFAULT, "%{public}@Parsing data version %ld", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v56);
  objc_msgSend(v10, "hmf_dictionaryForKey:", CFSTR("Manufacturers"));
  v65 = objc_claimAutoreleasedReturnValue();
  if (!v65)
  {
    v74 = (void *)MEMORY[0x227676638]();
    v75 = v57;
    HMFGetOSLogHandle();
    v76 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Manufacturers"));
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545410;
      v114 = v77;
      v115 = 2114;
      v116 = CFSTR("vendorDataManagerStart");
      v117 = 2112;
      v118 = CFSTR("Error: Data contains invalid manufacturers");
      v119 = 2114;
      v120 = CFSTR("state");
      v121 = 2112;
      v122 = CFSTR("vendorDataManagerParsedData");
      v123 = 2114;
      v124 = CFSTR("success");
      v125 = 2112;
      v126 = (void *)MEMORY[0x24BDBD1C0];
      v127 = 2114;
      v128 = CFSTR("Manufacturers");
      v129 = 2112;
      v130 = v78;
      _os_log_impl(&dword_2218F0000, v76, OS_LOG_TYPE_ERROR, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x5Cu);

    }
    objc_autoreleasePoolPop(v74);
    objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    v79 = objc_alloc(MEMORY[0x24BE4F1D0]);
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Manufacturers"));
    v43 = (id)objc_claimAutoreleasedReturnValue();
    v95 = MEMORY[0x24BDBD1C0];
    HMDTaggedLoggingCreateDictionary();
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = (void *)objc_msgSend(v79, "initWithTag:data:", CFSTR("vendorDataManagerStart"), v80, CFSTR("state"), CFSTR("vendorDataManagerParsedData"), CFSTR("success"), v95, CFSTR("Manufacturers"), v43);
    objc_msgSend(MEMORY[0x24BE3F138], "currentTagProcessorList");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "submitTaggedEvent:processorList:", v81, v82);

    v32 = 0;
    goto LABEL_22;
  }
  v32 = (__CFString *)v65;
  v111 = 0;
  v112 = 0;
  v104 = -[HMDVendorDataManager _parseManufacturersList:collectionsByManufacturer:entriesByProductData:](v57, "_parseManufacturersList:collectionsByManufacturer:entriesByProductData:", v65, &v112, &v111);
  v34 = v112;
  v43 = v111;
  context = (void *)MEMORY[0x227676638]();
  v109 = v57;
  HMFGetOSLogHandle();
  v66 = objc_claimAutoreleasedReturnValue();
  v67 = v66;
  if (!v104)
  {
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      v114 = v83;
      v115 = 2114;
      v116 = CFSTR("vendorDataManagerStart");
      v117 = 2112;
      v118 = CFSTR("Error: Manufacturers failed to parse");
      v119 = 2114;
      v120 = CFSTR("state");
      v121 = 2112;
      v122 = CFSTR("vendorDataManagerParsedData");
      v123 = 2114;
      v124 = CFSTR("success");
      v125 = 2112;
      v126 = (void *)MEMORY[0x24BDBD1C0];
      _os_log_impl(&dword_2218F0000, v67, OS_LOG_TYPE_ERROR, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x48u);

    }
    objc_autoreleasePoolPop(context);
    objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_alloc(MEMORY[0x24BE4F1D0]);
    v96 = MEMORY[0x24BDBD1C0];
    HMDTaggedLoggingCreateDictionary();
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = (void *)objc_msgSend(v85, "initWithTag:data:", CFSTR("vendorDataManagerStart"), v86, CFSTR("state"), CFSTR("vendorDataManagerParsedData"), CFSTR("success"), v96);
    objc_msgSend(MEMORY[0x24BE3F138], "currentTagProcessorList");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "submitTaggedEvent:processorList:", v87, v88);

    v89 = (void *)MEMORY[0x227676638]();
    v90 = v109;
    HMFGetOSLogHandle();
    v91 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v114 = v92;
      v115 = 2112;
      v116 = v32;
      _os_log_impl(&dword_2218F0000, v91, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse manufacturers: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v89);
    goto LABEL_22;
  }
  if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v68 = objc_claimAutoreleasedReturnValue();
    v101 = (void *)MEMORY[0x24BDD17C8];
    v105 = (void *)v68;
    HMFUptime();
    objc_msgSend(v101, "stringWithFormat:", CFSTR("%.3f"), v69 - v13);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v26);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545922;
    v114 = v105;
    v115 = 2114;
    v116 = CFSTR("vendorDataManagerStart");
    v117 = 2112;
    v118 = CFSTR("Parsing succeeded");
    v119 = 2114;
    v120 = CFSTR("state");
    v121 = 2112;
    v122 = CFSTR("vendorDataManagerParsedData");
    v123 = 2114;
    v124 = CFSTR("duration");
    v125 = 2112;
    v126 = v102;
    v127 = 2114;
    v128 = CFSTR("success");
    v129 = 2112;
    v130 = (void *)MEMORY[0x24BDBD1C8];
    v131 = 2114;
    v132 = CFSTR("DataVersion");
    v133 = 2112;
    v134 = v99;
    _os_log_impl(&dword_2218F0000, v67, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x70u);

  }
  objc_autoreleasePoolPop(context);
  objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = objc_alloc(MEMORY[0x24BE4F1D0]);
  v70 = (void *)MEMORY[0x24BDD17C8];
  HMFUptime();
  objc_msgSend(v70, "stringWithFormat:", CFSTR("%.3f"), v71 - v13);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v26);
  contexta = (void *)objc_claimAutoreleasedReturnValue();
  v98 = MEMORY[0x24BDBD1C8];
  HMDTaggedLoggingCreateDictionary();
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = (void *)objc_msgSend(v103, "initWithTag:data:", CFSTR("vendorDataManagerStart"), v100, CFSTR("state"), CFSTR("vendorDataManagerParsedData"), CFSTR("duration"), v106, CFSTR("success"), v98, CFSTR("DataVersion"), contexta);
  objc_msgSend(MEMORY[0x24BE3F138], "currentTagProcessorList");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "submitTaggedEvent:processorList:", v72, v73);

  *a4 = v26;
  v34 = objc_retainAutorelease(v34);
  *a5 = v34;
  v43 = objc_retainAutorelease(v43);
  *a6 = v43;
  v62 = 1;
LABEL_23:

  return v62;
}

- (id)_modelsStringForManufacturer:(id)a3 model:(id)a4 dictionary:(id)a5 key:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDVendorDataManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v12, "hmf_stringForKey:", v13);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "length"))
    {
      if (v17)
        goto LABEL_11;
      goto LABEL_7;
    }
  }
  else
  {
    v17 = 0;
  }

LABEL_7:
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v13);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138544386;
      v25 = v21;
      v26 = 2112;
      v27 = v10;
      v28 = 2112;
      v29 = v11;
      v30 = 2112;
      v31 = v13;
      v32 = 2112;
      v33 = v22;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Models dictionary for %@:%@ contains an invalid %@ value: %@", (uint8_t *)&v24, 0x34u);

    }
    objc_autoreleasePoolPop(v18);
    v17 = 0;
  }
LABEL_11:

  return v17;
}

- (id)_parseVendorModelEntryForManufacturer:(id)a3 model:(id)a4 dictionary:(id)a5
{
  id v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  id v10;
  void *v11;
  HMDVendorDataManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  HMDVendorDataManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMDVendorModelEntry *v26;
  void *context;
  void *contexta;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _BYTE *v35;
  _BYTE buf[24];
  uint64_t (*v37)(uint64_t, uint64_t);
  _BYTE v38[20];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (uint64_t (*)(uint64_t, uint64_t))a4;
  v10 = a5;
  -[HMDVendorDataManager _modelsStringForManufacturer:model:dictionary:key:](self, "_modelsStringForManufacturer:model:dictionary:key:", v8, v9, v10, CFSTR("BundleID"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDVendorDataManager _modelsStringForManufacturer:model:dictionary:key:](self, "_modelsStringForManufacturer:model:dictionary:key:", v8, v9, v10, CFSTR("StoreID"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDVendorDataManager _modelsStringForManufacturer:model:dictionary:key:](self, "_modelsStringForManufacturer:model:dictionary:key:", v8, v9, v10, CFSTR("FirmwareVersion"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDVendorDataManager _modelsStringForManufacturer:model:dictionary:key:](self, "_modelsStringForManufacturer:model:dictionary:key:", v8, v9, v10, CFSTR("ProductData"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && !+[HMDAccessory validateProductData:](HMDAccessory, "validateProductData:", v11))
  {
    context = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ProductData"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2112;
      v37 = v9;
      *(_WORD *)v38 = 2112;
      *(_QWORD *)&v38[2] = CFSTR("ProductData");
      *(_WORD *)&v38[10] = 2112;
      *(_QWORD *)&v38[12] = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Models dictionary for %@:%@ contains an invalid %@ value: %@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(context);

    v11 = 0;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ProductDataChangeAllowedTo"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v10, "hmf_arrayForKey:", CFSTR("ProductDataChangeAllowedTo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v17, "count"))
      goto LABEL_13;
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v37 = __Block_byref_object_copy__170942;
    *(_QWORD *)v38 = __Block_byref_object_dispose__170943;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v17, "count"));
    *(_QWORD *)&v38[8] = objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __79__HMDVendorDataManager__parseVendorModelEntryForManufacturer_model_dictionary___block_invoke;
    v33[3] = &unk_24E78C2D8;
    v19 = v18;
    v34 = v19;
    v35 = buf;
    objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v33);
    v20 = *(void **)(*(_QWORD *)&buf[8] + 40);
    v21 = v20 ? (void *)objc_msgSend(v20, "copy") : 0;

    _Block_object_dispose(buf, 8);
    if (!v21)
    {
LABEL_13:
      contexta = (void *)MEMORY[0x227676638]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ProductDataChangeAllowedTo"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        *(_QWORD *)&buf[4] = v24;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v8;
        *(_WORD *)&buf[22] = 2112;
        v37 = v9;
        *(_WORD *)v38 = 2112;
        *(_QWORD *)&v38[2] = CFSTR("ProductDataChangeAllowedTo");
        *(_WORD *)&v38[10] = 2112;
        *(_QWORD *)&v38[12] = v25;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Models dictionary for %@:%@ contains an invalid %@ value: %@", buf, 0x34u);

      }
      objc_autoreleasePoolPop(contexta);
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }
  v26 = -[HMDVendorModelEntry initWithManufacturer:model:appBundleID:appStoreID:firmwareVersion:productData:productDataAlternates:]([HMDVendorModelEntry alloc], "initWithManufacturer:model:appBundleID:appStoreID:firmwareVersion:productData:productDataAlternates:", v8, v9, v32, v31, v30, v11, v21);

  return v26;
}

- (BOOL)_parseManufacturersList:(id)a3 collectionsByManufacturer:(id *)a4 entriesByProductData:(id *)a5
{
  __CFString *v6;
  void *v7;
  HMDVendorDataManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  uint64_t i;
  void *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  HMDVendorDataManager *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  HMDVendorDataManager *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  HMDVendorDataManager *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  __CFString *v55;
  void *v56;
  void *v57;
  HMDVendorDataManager *v58;
  NSObject *v59;
  void *v60;
  HMDVendorDataManager *v61;
  void *v62;
  void *v63;
  HMDVendorDataManager *v64;
  NSObject *v65;
  void *v66;
  BOOL v67;
  void *v68;
  HMDVendorDataManager *v69;
  NSObject *v70;
  void *v71;
  id *v73;
  __CFString *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  __CFString *v85;
  void *v86;
  void *v87;
  HMDVendorModelCollection *v88;
  id obj;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint8_t v98[128];
  uint8_t buf[4];
  void *v100;
  __int16 v101;
  const __CFString *v102;
  __int16 v103;
  id v104;
  _BYTE v105[128];
  uint64_t v106;

  v73 = a4;
  v106 = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v100 = v10;
    v101 = 2112;
    v102 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Parsing manufacturers dictionary: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v85 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v12 = v6;
  v83 = -[__CFString countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v94, v105, 16);
  if (v83)
  {
    v82 = *(_QWORD *)v95;
    v75 = v12;
    v86 = v11;
    while (2)
    {
      for (i = 0; i != v83; ++i)
      {
        if (*(_QWORD *)v95 != v82)
          objc_enumerationMutation(v12);
        v14 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x227676638]();
        v16 = v14;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v17 = v16;
        else
          v17 = 0;
        v18 = v17;

        -[__CFString stringByTrimmingCharactersInSet:](v18, "stringByTrimmingCharactersInSet:", v87);
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (!-[__CFString length](v19, "length"))
        {
          v68 = (void *)MEMORY[0x227676638]();
          v69 = v8;
          HMFGetOSLogHandle();
          v70 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v100 = v71;
            v101 = 2112;
            v102 = v16;
            _os_log_impl(&dword_2218F0000, v70, OS_LOG_TYPE_ERROR, "%{public}@Manufacturers dictionary contains invalid key: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v68);

          objc_autoreleasePoolPop(v15);
LABEL_58:

          v67 = 0;
          v11 = v86;
          goto LABEL_59;
        }
        -[__CFString lowercaseString](v19, "lowercaseString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString objectForKeyedSubscript:](v85, "objectForKeyedSubscript:", v20);
        v88 = (HMDVendorModelCollection *)objc_claimAutoreleasedReturnValue();
        if (!v88)
        {
          v88 = objc_alloc_init(HMDVendorModelCollection);
          -[__CFString setObject:forKeyedSubscript:](v85, "setObject:forKeyedSubscript:");
        }
        -[__CFString hmf_dictionaryForKey:](v12, "hmf_dictionaryForKey:", v19, v73);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21)
        {
          objc_msgSend(v21, "hmf_dictionaryForKey:", CFSTR("Models"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v23)
          {
            v76 = i;
            v77 = v20;
            v92 = 0u;
            v93 = 0u;
            v90 = 0u;
            v91 = 0u;
            obj = v23;
            v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v98, 16);
            if (v25)
            {
              v26 = v25;
              v27 = *(_QWORD *)v91;
              v79 = v24;
              v80 = v15;
              v84 = v22;
LABEL_18:
              v28 = 0;
              while (1)
              {
                if (*(_QWORD *)v91 != v27)
                  objc_enumerationMutation(obj);
                v29 = *(id *)(*((_QWORD *)&v90 + 1) + 8 * v28);
                objc_opt_class();
                v30 = (objc_opt_isKindOfClass() & 1) != 0 ? v29 : 0;
                v31 = v30;

                objc_msgSend(v31, "stringByTrimmingCharactersInSet:", v87);
                v32 = (void *)objc_claimAutoreleasedReturnValue();

                if (!objc_msgSend(v32, "length"))
                  break;
                objc_msgSend(obj, "hmf_dictionaryForKey:", v32);
                v33 = objc_claimAutoreleasedReturnValue();
                if (!v33)
                {
                  v57 = (void *)MEMORY[0x227676638]();
                  v61 = v8;
                  HMFGetOSLogHandle();
                  v59 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543874;
                    v100 = v62;
                    v101 = 2112;
                    v102 = v19;
                    v103 = 2112;
                    v104 = v32;
                    _os_log_impl(&dword_2218F0000, v59, OS_LOG_TYPE_ERROR, "%{public}@Manufacturer %@ contains an invalid model entry for %@", buf, 0x20u);

                  }
LABEL_46:
                  v12 = v75;
                  v24 = v79;
                  v15 = v80;
                  v22 = v84;

                  objc_autoreleasePoolPop(v57);
                  v43 = 1;
                  i = v76;
                  goto LABEL_47;
                }
                v34 = (void *)v33;
                v35 = v8;
                v36 = v19;
                -[HMDVendorDataManager _parseVendorModelEntryForManufacturer:model:dictionary:](v8, "_parseVendorModelEntryForManufacturer:model:dictionary:", v19, v32, v33);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                -[HMDVendorModelCollection addEntry:](v88, "addEntry:", v37);
                objc_msgSend(v37, "productData");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                if (v38)
                {
                  objc_msgSend(v86, "objectForKeyedSubscript:", v38);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v40 = v39;
                  if (!v39 || objc_msgSend(v39, "compare:", v37) == -1)
                    objc_msgSend(v86, "setObject:forKeyedSubscript:", v37, v38);

                }
                ++v28;
                v8 = v35;
                v19 = v36;
                if (v26 == v28)
                {
                  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v98, 16);
                  v12 = v75;
                  v24 = v79;
                  v15 = v80;
                  v22 = v84;
                  if (v26)
                    goto LABEL_18;
                  goto LABEL_33;
                }
              }
              v57 = (void *)MEMORY[0x227676638]();
              v58 = v8;
              HMFGetOSLogHandle();
              v59 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v100 = v60;
                v101 = 2112;
                v102 = v19;
                v103 = 2112;
                v104 = v29;
                _os_log_impl(&dword_2218F0000, v59, OS_LOG_TYPE_ERROR, "%{public}@Models dictionary for %@ contains invalid key: %@", buf, 0x20u);

              }
              goto LABEL_46;
            }
LABEL_33:

            objc_msgSend(v22, "hmf_dictionaryForKey:", CFSTR("DefaultModel"));
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            i = v76;
            if (v41)
            {
              -[HMDVendorDataManager _parseVendorModelEntryForManufacturer:model:dictionary:](v8, "_parseVendorModelEntryForManufacturer:model:dictionary:", v19, CFSTR("DefaultModel"), v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDVendorModelCollection setDefaultEntry:](v88, "setDefaultEntry:", v42);

            }
            v43 = 0;
LABEL_47:
            v20 = v77;
          }
          else
          {
            v81 = v15;
            v49 = (void *)MEMORY[0x227676638]();
            v50 = v8;
            HMFGetOSLogHandle();
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("Models"));
              v78 = v20;
              v53 = v22;
              v54 = i;
              v55 = v19;
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v100 = v52;
              v101 = 2112;
              v102 = CFSTR("Models");
              v103 = 2112;
              v104 = v56;
              _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_ERROR, "%{public}@Manufacturers dictionary contains an invalid %@ value: %@", buf, 0x20u);

              v19 = v55;
              i = v54;
              v22 = v53;
              v20 = v78;

              v12 = v75;
            }

            objc_autoreleasePoolPop(v49);
            v43 = 1;
            v24 = 0;
            v15 = v81;
          }

        }
        else
        {
          v44 = v20;
          v45 = (void *)MEMORY[0x227676638]();
          v46 = v8;
          HMFGetOSLogHandle();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v100 = v48;
            v101 = 2112;
            v102 = v19;
            _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_ERROR, "%{public}@Manufacturers dictionary contains an invalid entry for %@", buf, 0x16u);

            v12 = v75;
          }

          objc_autoreleasePoolPop(v45);
          v43 = 1;
          v20 = v44;
          v22 = 0;
        }

        objc_autoreleasePoolPop(v15);
        if (v43)
          goto LABEL_58;
      }
      v83 = -[__CFString countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v94, v105, 16);
      v11 = v86;
      if (v83)
        continue;
      break;
    }
  }

  v63 = (void *)MEMORY[0x227676638]();
  v64 = v8;
  HMFGetOSLogHandle();
  v65 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v100 = v66;
    v101 = 2112;
    v102 = v85;
    _os_log_impl(&dword_2218F0000, v65, OS_LOG_TYPE_DEBUG, "%{public}@Prepared vendor model entries: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v63);
  *v73 = (id)-[__CFString copy](v85, "copy");
  *a5 = (id)objc_msgSend(v11, "copy");
  v67 = 1;
LABEL_59:

  return v67;
}

- (void)timerDidFire:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDVendorDataManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__HMDVendorDataManager_timerDidFire___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (HMFTimer)fetchTimer
{
  return self->_fetchTimer;
}

- (int64_t)dataVersion
{
  return self->_dataVersion;
}

- (void)setDataVersion:(int64_t)a3
{
  self->_dataVersion = a3;
}

- (NSDictionary)collectionsByManufacturer
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCollectionsByManufacturer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDictionary)entriesByProductData
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEntriesByProductData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entriesByProductData, 0);
  objc_storeStrong((id *)&self->_collectionsByManufacturer, 0);
  objc_storeStrong((id *)&self->_fetchTimer, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

uint64_t __37__HMDVendorDataManager_timerDidFire___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v5;
    v9 = 2048;
    v10 = vendorInfoFetchPeriod;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Timer fired after %.0lf sec", (uint8_t *)&v7, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_fetchDataFromServer");
}

void __79__HMDVendorDataManager__parseVendorModelEntryForManufacturer_model_dictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v12;
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v7, "stringByTrimmingCharactersInSet:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "lowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && +[HMDAccessory validateProductData:](HMDAccessory, "validateProductData:", v9))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v9);
  }
  else
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = 0;

    *a4 = 1;
  }

}

void __46__HMDVendorDataManager__handleDataFromServer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "collectionsByManufacturer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 || (objc_msgSend(v7, "isEqual:", v5) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

}

void __44__HMDVendorDataManager__fetchDataFromServer__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __44__HMDVendorDataManager__fetchDataFromServer__block_invoke_2;
    block[3] = &unk_24E79AD20;
    v14 = *(id *)(a1 + 32);
    v15 = v11;
    v16 = v8;
    v17 = v7;
    v18 = v9;
    dispatch_async(v12, block);

  }
}

uint64_t __44__HMDVendorDataManager__fetchDataFromServer__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "begin");
  objc_msgSend(*(id *)(a1 + 40), "_handleServerResponse:withData:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "end");
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __30__HMDVendorDataManager__start__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "fetchTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resume");

  return objc_msgSend(*(id *)(a1 + 32), "_fetchDataFromServer");
}

void __51__HMDVendorDataManager__loadDatabaseFromLocalFiles__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  char v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("allowVendorDataOverride"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "BOOLValue"))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "_loadDatabaseFromFilePath:fileDescription:", CFSTR("/var/mobile/Library/homed/vendor-database-local"), CFSTR("side-loaded"));

    if ((v4 & 1) != 0)
      return;
  }
  else
  {

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "_loadDatabaseFromFilePath:fileDescription:", CFSTR("/var/mobile/Library/homed/vendor-database"), CFSTR("cached")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferenceForKey:", CFSTR("allowVendorDataOverride"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    v8 = *(void **)(a1 + 32);
    if (v7)
    {
      objc_msgSend(v8, "urlForBundledInternalPlist");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("bundled internal");
    }
    else
    {
      objc_msgSend(v8, "urlForBundledPlist");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("bundled");
    }
    v11 = objc_msgSend(v8, "_loadDatabaseFromFileURL:fileDescription:", v9, v10);

    if ((v11 & 1) == 0)
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543362;
        v17 = v15;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to read any local database files", (uint8_t *)&v16, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(*(id *)(a1 + 32), "setDataVersion:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setCollectionsByManufacturer:", MEMORY[0x24BDBD1B8]);
    }
  }
}

+ (id)sharedVendorDataManager
{
  if (sharedVendorDataManager_onceToken != -1)
    dispatch_once(&sharedVendorDataManager_onceToken, &__block_literal_global_171078);
  return (id)sharedVendorDataManager_sharedInstance;
}

+ (id)dbURL
{
  if (dbURL_onceToken != -1)
    dispatch_once(&dbURL_onceToken, &__block_literal_global_44_171073);
  return (id)dbURL_url;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t39_171068 != -1)
    dispatch_once(&logCategory__hmf_once_t39_171068, &__block_literal_global_122_171069);
  return (id)logCategory__hmf_once_v40_171070;
}

void __35__HMDVendorDataManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v40_171070;
  logCategory__hmf_once_v40_171070 = v0;

}

void __29__HMDVendorDataManager_dbURL__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  if (isInternalBuild())
  {
    v0 = (id)vendorInfoDatabaseServerURLOverride;
    if (objc_msgSend(v0, "length"))
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v0);
      v1 = objc_claimAutoreleasedReturnValue();
      v2 = (void *)dbURL_url;
      dbURL_url = v1;

    }
  }
  if (!dbURL_url)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    v4 = (id)homeKitConfigurationPath;
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@"), v4, CFSTR("/v1/ManufacturerDatabase.plist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (objc_class *)MEMORY[0x24BDD1808];
    v11 = v5;
    v7 = objc_alloc_init(v6);
    objc_msgSend(v7, "setScheme:", CFSTR("https"));
    objc_msgSend(v7, "setHost:", appleConfigurationServer);
    objc_msgSend(v7, "setPath:", v11);

    objc_msgSend(v7, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");

    v10 = (void *)dbURL_url;
    dbURL_url = v9;

  }
}

uint64_t __47__HMDVendorDataManager_sharedVendorDataManager__block_invoke()
{
  HMDVendorDataManager *v0;
  void *v1;

  v0 = -[HMDVendorDataManager initWithDefaults]([HMDVendorDataManager alloc], "initWithDefaults");
  v1 = (void *)sharedVendorDataManager_sharedInstance;
  sharedVendorDataManager_sharedInstance = (uint64_t)v0;

  return objc_msgSend((id)sharedVendorDataManager_sharedInstance, "_start");
}

@end
