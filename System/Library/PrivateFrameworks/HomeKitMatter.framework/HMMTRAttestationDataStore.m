@implementation HMMTRAttestationDataStore

- (HMMTRAttestationDataStore)initWithFileURL:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  HMMTRFileManager *v7;
  HMMTRAttestationDataStore *v8;

  v4 = (objc_class *)MEMORY[0x24BE28A08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = objc_alloc_init(HMMTRFileManager);
  v8 = -[HMMTRAttestationDataStore initWithFileURL:uarpController:fileManager:](self, "initWithFileURL:uarpController:fileManager:", v5, v6, v7);

  return v8;
}

- (HMMTRAttestationDataStore)initWithFileURL:(id)a3 uarpController:(id)a4 fileManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMMTRAttestationDataStore *v13;
  HMMTRAttestationDataStore *v14;
  HMMTRAttestationDataStore *v16;
  SEL v17;
  objc_super v18;

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
    v16 = (HMMTRAttestationDataStore *)_HMFPreconditionFailure();
    return (HMMTRAttestationDataStore *)-[HMMTRAttestationDataStore staticAttestationDataFileURL](v16, v17);
  }
  v18.receiver = self;
  v18.super_class = (Class)HMMTRAttestationDataStore;
  v13 = -[HMMTRAttestationDataStore init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_fileURL, a3);
    objc_storeStrong((id *)&v14->_uarpController, a4);
    -[UARPController setDelegate:](v14->_uarpController, "setDelegate:", v14);
    objc_storeStrong((id *)&v14->_fileManager, a5);
  }

  return v14;
}

- (id)staticAttestationDataFileURL
{
  void *v2;
  void *v3;
  HMMTRAttestationDataStore *v5;
  SEL v6;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("attestation-data-store"), CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return v3;
  v5 = (HMMTRAttestationDataStore *)_HMFPreconditionFailure();
  return -[HMMTRAttestationDataStore staticAttestationData](v5, v6);
}

- (id)staticAttestationData
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  HMMTRAttestationDataStore *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[HMMTRAttestationDataStore fileManager](self, "fileManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAttestationDataStore staticAttestationDataFileURL](self, "staticAttestationDataFileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v3, "dictionaryWithContentsOfURL:error:", v4, &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;

  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = (void *)MEMORY[0x242656984]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRAttestationDataStore staticAttestationDataFileURL](v9, "staticAttestationDataFileURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to load local attestation data at file URL %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = (id)MEMORY[0x24BDBD1B8];
  }

  return v7;
}

- (void)saveWithPaaCertificates:(id)a3 cdCertificates:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMMTRAttestationDataStore *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  HMMTRAttestationDataStore *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint32_t v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  _QWORD v34[4];
  _QWORD v35[5];

  v35[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v11;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Saving certificates to file", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  v34[0] = CFSTR("Version");
  v34[1] = CFSTR("SchemaVersion");
  v35[0] = &unk_250F40200;
  v35[1] = &unk_250F40200;
  v34[2] = CFSTR("PAACertificates");
  v34[3] = CFSTR("CDCertificates");
  v35[2] = v6;
  v35[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAttestationDataStore fileManager](v9, "fileManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAttestationDataStore fileURL](v9, "fileURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v15 = objc_msgSend(v13, "writeDictionary:toURL:error:", v12, v14, &v27);
  v16 = v27;

  v17 = (void *)MEMORY[0x242656984]();
  v18 = v9;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v15)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRAttestationDataStore fileURL](v18, "fileURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v21;
      v30 = 2112;
      v31 = v22;
      v23 = "%{public}@Successfully saved attestation data to %@";
      v24 = v20;
      v25 = OS_LOG_TYPE_INFO;
      v26 = 22;
LABEL_8:
      _os_log_impl(&dword_23E95B000, v24, v25, v23, buf, v26);

    }
  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAttestationDataStore fileURL](v18, "fileURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v29 = v21;
    v30 = 2112;
    v31 = v22;
    v32 = 2112;
    v33 = v16;
    v23 = "%{public}@Failed to write attestation data to %@: %@";
    v24 = v20;
    v25 = OS_LOG_TYPE_ERROR;
    v26 = 32;
    goto LABEL_8;
  }

  objc_autoreleasePoolPop(v17);
}

- (id)convertPEMtoDERforCertificate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-----BEGIN CERTIFICATE-----"), &stru_250F24B08);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-----END CERTIFICATE-----"), &stru_250F24B08);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_250F24B08);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\r"), &stru_250F24B08);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
    v3 = (id)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v3, 0);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)fetchCloudAttestationData
{
  void *v3;
  HMMTRAttestationDataStore *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  HMMTRAttestationDataStore *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x242656984](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v6;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@Fetching cloud PAA data from UARP controller", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMMTRAttestationDataStore uarpController](v4, "uarpController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "getAttestationCertificates:assetLocationType:", 0, 15);

  if ((v8 & 1) == 0)
  {
    v9 = (void *)MEMORY[0x242656984]();
    v10 = v4;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to request PAA certificates from UARP controller", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }
}

- (NSArray)paaCertificates
{
  void *v3;
  HMMTRAttestationDataStore *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HMMTRAttestationDataStore *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMMTRAttestationDataStore *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  HMMTRAttestationDataStore *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  HMMTRAttestationDataStore *v29;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  const char *v36;
  NSObject *v37;
  os_log_type_t v38;
  uint32_t v39;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x242656984](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v43 = v6;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@Loading locally stored PAA information", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMMTRAttestationDataStore fileManager](v4, "fileManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAttestationDataStore fileURL](v4, "fileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  objc_msgSend(v7, "dictionaryWithContentsOfURL:error:", v8, &v41);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v41;

  if (!v9)
  {
    v11 = (void *)MEMORY[0x242656984]();
    v12 = v4;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v14;
      _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@Locally stored PAA information not found. Loading static PAA information", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    -[HMMTRAttestationDataStore staticAttestationData](v12, "staticAttestationData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)MEMORY[0x242656984]();
  v16 = v4;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Version"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v43 = v18;
    v44 = 2112;
    v45 = (uint64_t)v19;
    _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_INFO, "%{public}@Data version %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  v20 = (void *)MEMORY[0x242656984]();
  v21 = v16;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SchemaVersion"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v43 = v23;
    v44 = 2112;
    v45 = (uint64_t)v24;
    _os_log_impl(&dword_23E95B000, v22, OS_LOG_TYPE_INFO, "%{public}@Schema version %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v20);
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PAACertificates"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (!v25)
  {
    v28 = (void *)MEMORY[0x242656984]();
    v29 = v21;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v35;
      v44 = 2112;
      v45 = (uint64_t)v9;
      v36 = "%{public}@Could not find PAAs in attestation data dictionary: %@";
      v37 = v30;
      v38 = OS_LOG_TYPE_ERROR;
      v39 = 22;
LABEL_20:
      _os_log_impl(&dword_23E95B000, v37, v38, v36, buf, v39);

    }
LABEL_21:

    objc_autoreleasePoolPop(v28);
    v34 = (id)MEMORY[0x24BDBD1A8];
    goto LABEL_22;
  }
  v27 = objc_msgSend(v25, "count");
  v28 = (void *)MEMORY[0x242656984]();
  v29 = v21;
  HMFGetOSLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = os_log_type_enabled(v30, OS_LOG_TYPE_INFO);
  if (!v27)
  {
    if (v31)
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v35;
      v36 = "%{public}@No PAAs found";
      v37 = v30;
      v38 = OS_LOG_TYPE_INFO;
      v39 = 12;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  if (v31)
  {
    HMFGetLogIdentifier();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v26, "count");
    *(_DWORD *)buf = 138543618;
    v43 = v32;
    v44 = 2048;
    v45 = v33;
    _os_log_impl(&dword_23E95B000, v30, OS_LOG_TYPE_INFO, "%{public}@Number of PAAs found: %tu", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v28);
  v34 = v26;
LABEL_22:

  return (NSArray *)v34;
}

- (NSArray)cdCertificates
{
  void *v3;
  HMMTRAttestationDataStore *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HMMTRAttestationDataStore *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMMTRAttestationDataStore *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  HMMTRAttestationDataStore *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  HMMTRAttestationDataStore *v29;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  const char *v36;
  NSObject *v37;
  os_log_type_t v38;
  uint32_t v39;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x242656984](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v43 = v6;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@Loading locally stored attestation information", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMMTRAttestationDataStore fileManager](v4, "fileManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAttestationDataStore fileURL](v4, "fileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  objc_msgSend(v7, "dictionaryWithContentsOfURL:error:", v8, &v41);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v41;

  if (!v9)
  {
    v11 = (void *)MEMORY[0x242656984]();
    v12 = v4;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v14;
      _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@Locally stored attestation information not found. Loading static attestation information", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    -[HMMTRAttestationDataStore staticAttestationData](v12, "staticAttestationData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)MEMORY[0x242656984]();
  v16 = v4;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Version"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v43 = v18;
    v44 = 2112;
    v45 = (uint64_t)v19;
    _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_INFO, "%{public}@Data version %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  v20 = (void *)MEMORY[0x242656984]();
  v21 = v16;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SchemaVersion"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v43 = v23;
    v44 = 2112;
    v45 = (uint64_t)v24;
    _os_log_impl(&dword_23E95B000, v22, OS_LOG_TYPE_INFO, "%{public}@Schema version %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v20);
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CDCertificates"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (!v25)
  {
    v28 = (void *)MEMORY[0x242656984]();
    v29 = v21;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v35;
      v44 = 2112;
      v45 = (uint64_t)v9;
      v36 = "%{public}@Could not find Certificate Declarations(CDs) in attestation data dictionary: %@";
      v37 = v30;
      v38 = OS_LOG_TYPE_ERROR;
      v39 = 22;
LABEL_20:
      _os_log_impl(&dword_23E95B000, v37, v38, v36, buf, v39);

    }
LABEL_21:

    objc_autoreleasePoolPop(v28);
    v34 = (id)MEMORY[0x24BDBD1A8];
    goto LABEL_22;
  }
  v27 = objc_msgSend(v25, "count");
  v28 = (void *)MEMORY[0x242656984]();
  v29 = v21;
  HMFGetOSLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = os_log_type_enabled(v30, OS_LOG_TYPE_INFO);
  if (!v27)
  {
    if (v31)
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v35;
      v36 = "%{public}@No Certificate Declarations(CDs) found";
      v37 = v30;
      v38 = OS_LOG_TYPE_INFO;
      v39 = 12;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  if (v31)
  {
    HMFGetLogIdentifier();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v26, "count");
    *(_DWORD *)buf = 138543618;
    v43 = v32;
    v44 = 2048;
    v45 = v33;
    _os_log_impl(&dword_23E95B000, v30, OS_LOG_TYPE_INFO, "%{public}@Number of Certificate Declarations(CDs) found: %tu", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v28);
  v34 = v26;
LABEL_22:

  return (NSArray *)v34;
}

- (void)attestationCertificates:(id)a3 forSubjectKeyIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMMTRAttestationDataStore *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  HMMTRAttestationDataStore *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  id obj;
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint8_t v47[128];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v12;
      v50 = 2048;
      v51 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_INFO, "%{public}@Received %tu PAA certificates from UARP controller", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    if (objc_msgSend(v6, "count"))
    {
      v28 = v7;
      v35 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v37 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v29 = v6;
      obj = v6;
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      if (!v31)
        goto LABEL_28;
      v30 = *(_QWORD *)v43;
      while (1)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v43 != v30)
            objc_enumerationMutation(obj);
          v34 = v13;
          v36 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v13);
          objc_msgSend(obj, "objectForKeyedSubscript:", v28);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "componentsSeparatedByString:", CFSTR(","));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v15 = v14;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v39;
            v19 = 1;
            do
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v39 != v18)
                  objc_enumerationMutation(v15);
                -[HMMTRAttestationDataStore convertPEMtoDERforCertificate:](v9, "convertPEMtoDERforCertificate:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (v21)
                {
                  if ((v19 & 1) != 0)
                  {
                    if (objc_msgSend(v15, "count") != 1)
                      goto LABEL_24;
                    v22 = v35;
                  }
                  else
                  {
                    v22 = v37;
                  }
                  objc_msgSend(v22, "addObject:", v21);
                }
                else
                {
                  v23 = (void *)MEMORY[0x242656984]();
                  v24 = v9;
                  HMFGetOSLogHandle();
                  v25 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v49 = v26;
                    v50 = 2112;
                    v51 = v36;
                    _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert certificate from PEM to DER. Skipping certificate from subject key ID : %@", buf, 0x16u);

                  }
                  objc_autoreleasePoolPop(v23);
                }
LABEL_24:

                v19 = 0;
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
              v19 = 0;
            }
            while (v17);
          }

          v13 = v34 + 1;
        }
        while (v34 + 1 != v31);
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        if (!v31)
        {
LABEL_28:

          -[HMMTRAttestationDataStore saveWithPaaCertificates:cdCertificates:](v9, "saveWithPaaCertificates:cdCertificates:", v35, v37);
          v7 = v28;
          v6 = v29;
          break;
        }
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v27;
      _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch PAA certificates", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5
{
  return 0;
}

- (UARPController)uarpController
{
  return (UARPController *)objc_getProperty(self, a2, 16, 1);
}

- (HMMTRFileManager)fileManager
{
  return (HMMTRFileManager *)objc_getProperty(self, a2, 24, 1);
}

- (NSURL)fileURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_uarpController, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t20 != -1)
    dispatch_once(&logCategory__hmf_once_t20, &__block_literal_global_9375);
  return (id)logCategory__hmf_once_v21;
}

void __40__HMMTRAttestationDataStore_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v21;
  logCategory__hmf_once_v21 = v0;

}

@end
