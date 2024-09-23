@implementation HMIUpdatedFaceprintsResult

- (HMIUpdatedFaceprintsResult)initWithExistingAtCurrentVersion:(id)a3 createdAtCurrentVersion:(id)a4 existingAtOtherVersions:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMIUpdatedFaceprintsResult *v12;
  HMIUpdatedFaceprintsResult *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMIUpdatedFaceprintsResult;
  v12 = -[HMIUpdatedFaceprintsResult init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_existingAtCurrentVersion, a3);
    objc_storeStrong((id *)&v13->_createdAtCurrentVersion, a4);
    objc_storeStrong((id *)&v13->_existingAtOtherVersions, a5);
  }

  return v13;
}

- (NSSet)allAtCurrentVersion
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  HMIUpdatedFaceprintsResult *v15;
  id v16;
  _QWORD v17[5];
  id v18;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIUpdatedFaceprintsResult existingAtCurrentVersion](self, "existingAtCurrentVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __49__HMIUpdatedFaceprintsResult_allAtCurrentVersion__block_invoke;
  v17[3] = &unk_24DBEB880;
  v17[4] = self;
  v6 = v3;
  v18 = v6;
  objc_msgSend(v4, "na_each:", v17);

  -[HMIUpdatedFaceprintsResult createdAtCurrentVersion](self, "createdAtCurrentVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  v12 = 3221225472;
  v13 = __49__HMIUpdatedFaceprintsResult_allAtCurrentVersion__block_invoke_24;
  v14 = &unk_24DBEB880;
  v15 = self;
  v16 = v6;
  v8 = v6;
  objc_msgSend(v7, "na_each:", &v11);

  v9 = (void *)objc_msgSend(v8, "copy", v11, v12, v13, v14, v15);
  return (NSSet *)v9;
}

void __49__HMIUpdatedFaceprintsResult_allAtCurrentVersion__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "isSentinelFaceprint"))
  {
    v4 = (void *)MEMORY[0x220735570]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_219D45000, v6, OS_LOG_TYPE_INFO, "%{public}@Skipping sentinel faceprint in existingAtCurrentVersion", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }

}

void __49__HMIUpdatedFaceprintsResult_allAtCurrentVersion__block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "isSentinelFaceprint"))
  {
    v4 = (void *)MEMORY[0x220735570]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_219D45000, v6, OS_LOG_TYPE_INFO, "%{public}@Skipping sentinel faceprint in createdAtCurrentVersion", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }

}

- (NSSet)existingAtOtherVersions
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (NSSet)createdAtCurrentVersion
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)existingAtCurrentVersion
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingAtCurrentVersion, 0);
  objc_storeStrong((id *)&self->_createdAtCurrentVersion, 0);
  objc_storeStrong((id *)&self->_existingAtOtherVersions, 0);
}

@end
