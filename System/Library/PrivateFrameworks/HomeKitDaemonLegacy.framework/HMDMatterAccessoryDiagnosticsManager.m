@implementation HMDMatterAccessoryDiagnosticsManager

- (HMDMatterAccessoryDiagnosticsManager)initWithAccessory:(id)a3
{
  HMDMatterAccessoryDiagnosticsManager *v3;
  uint64_t v4;
  HMSupportedAccessoryDiagnostics *supportedDiagnostics;
  HMDFileManager *v6;
  HMDFileManager *fileManager;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMDMatterAccessoryDiagnosticsManager;
  v3 = -[HMDAccessoryDiagnosticsManagerInternal initWithAccessory:](&v9, sel_initWithAccessory_, a3);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8D8]), "initWithSupportedTypes:format:audio:options:", 1, 2, 0, 0);
    supportedDiagnostics = v3->_supportedDiagnostics;
    v3->_supportedDiagnostics = (HMSupportedAccessoryDiagnostics *)v4;

    v6 = objc_alloc_init(HMDFileManager);
    fileManager = v3->_fileManager;
    v3->_fileManager = v6;

  }
  return v3;
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDAccessoryDiagnosticsManagerInternal workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__HMDMatterAccessoryDiagnosticsManager_start__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)shutDown
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDAccessoryDiagnosticsManagerInternal workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__HMDMatterAccessoryDiagnosticsManager_shutDown__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (id)_diagnosticsMetadataFromFile:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  HMDMatterAccessoryDiagnosticsManager *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  HMDMatterAccessoryDiagnosticsManager *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C99E98];
  HMDCreateHomeKitDaemonCacheDirectory();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileURLWithPath:", v8);
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)v9, "URLByAppendingPathComponent:", CFSTR("MatterDiagnostics"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDMatterAccessoryDiagnosticsManager fileManager](self, "fileManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  LOBYTE(v9) = objc_msgSend(v11, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v33);
  v12 = v33;
  if ((v9 & 1) != 0)
  {
    objc_msgSend(v6, "lastPathComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = v12;
    v15 = objc_msgSend(v11, "copyItemAtURL:toURL:error:", v6, v14, &v32);
    v16 = v32;

    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if ((v15 & 1) != 0)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "path");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v21;
        v36 = 2112;
        v37 = v22;
        _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Creating diagnostic metadata from path: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      v23 = objc_alloc(MEMORY[0x1E0CBA230]);
      objc_msgSend(v14, "path");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v23, "initWithSnapshotPath:urlParameters:privacyPolicyURL:uploadDestination:consentVersion:uploadType:", v24, 0, 0, 0, 0, 0);

    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v35 = v30;
        v36 = 2112;
        v37 = v14;
        v38 = 2112;
        v39 = v16;
        _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to copy file to path: %@ error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
      v25 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v16);
    }

  }
  else
  {
    v26 = (void *)MEMORY[0x1D17BA0A0]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v29;
      v36 = 2112;
      v37 = v10;
      v38 = 2112;
      v39 = v12;
      _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to create directory at path: %@ error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v26);
    if (a4)
    {
      v16 = objc_retainAutorelease(v12);
      v25 = 0;
      *a4 = v16;
    }
    else
    {
      v25 = 0;
      v16 = v12;
    }
  }

  return v25;
}

- (void)handleDiagnosticsTransferWithOptions:(id)a3 message:(id)a4
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
  -[HMDAccessoryDiagnosticsManagerInternal workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__HMDMatterAccessoryDiagnosticsManager_handleDiagnosticsTransferWithOptions_message___block_invoke;
  block[3] = &unk_1E89C20C8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (HMSupportedAccessoryDiagnostics)supportedDiagnostics
{
  return self->_supportedDiagnostics;
}

- (void)setSupportedDiagnostics:(id)a3
{
  objc_storeStrong((id *)&self->_supportedDiagnostics, a3);
}

- (MTRDevice)matterDevice
{
  return (MTRDevice *)objc_loadWeakRetained((id *)&self->_matterDevice);
}

- (void)setMatterDevice:(id)a3
{
  objc_storeWeak((id *)&self->_matterDevice, a3);
}

- (HMDFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
  objc_storeStrong((id *)&self->_fileManager, a3);
}

- (BOOL)isStarted
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_destroyWeak((id *)&self->_matterDevice);
  objc_storeStrong((id *)&self->_supportedDiagnostics, 0);
}

void __85__HMDMatterAccessoryDiagnosticsManager_handleDiagnosticsTransferWithOptions_message___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "matterDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 48), "matterLogType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = (void *)MEMORY[0x1D17BA0A0]();
      v5 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v7;
        v30 = 2112;
        v31 = &unk_1E8B32448;
        _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Invalid matter log type. Using type %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v4);
      v3 = &unk_1E8B32448;
    }
    objc_msgSend(*(id *)(a1 + 48), "delay");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 48), "delay");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      v11 = v10;

    }
    else
    {
      v11 = 300.0;
    }

    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "matterLogType");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v20;
      v30 = 2112;
      v31 = v21;
      v32 = 2112;
      v33 = v22;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Downloading matter log type: %@ for %@s", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    v23 = objc_msgSend(v3, "integerValue");
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __85__HMDMatterAccessoryDiagnosticsManager_handleDiagnosticsTransferWithOptions_message___block_invoke_19;
    v26[3] = &unk_1E89A3390;
    v25 = *(void **)(a1 + 40);
    v26[4] = *(_QWORD *)(a1 + 32);
    v27 = v25;
    objc_msgSend(v2, "downloadLogOfType:timeout:queue:completion:", v23, v24, v26, v11);

  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Lost reference to the matter device", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v16 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "respondWithError:", v3);
  }

}

void __85__HMDMatterAccessoryDiagnosticsManager_handleDiagnosticsTransferWithOptions_message___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v20 = v10;
    v21 = 2112;
    v22 = v5;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Did download to URL: %@. Error: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  if (v5)
  {
    v11 = *(void **)(a1 + 32);
    v16 = v6;
    objc_msgSend(v11, "_diagnosticsMetadataFromFile:outError:", v5, &v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v16;

    if (v12)
    {
      v17 = *MEMORY[0x1E0CB7BC0];
      encodeRootObject();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
    v13 = v6;
  }
  objc_msgSend(*(id *)(a1 + 40), "respondWithPayload:error:", v15, v13);

}

uint64_t __48__HMDMatterAccessoryDiagnosticsManager_shutDown__block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "isStarted");
  if ((_DWORD)result)
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping", (uint8_t *)&v7, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "setStarted:", 0);
    return objc_msgSend(*(id *)(a1 + 32), "notifyClientsOfDiagnosticsTransferSupport:supportDiagnosticsTransfer:", 0, 0);
  }
  return result;
}

void __45__HMDMatterAccessoryDiagnosticsManager_start__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isStarted") & 1) == 0)
  {
    v2 = (void *)MEMORY[0x1D17BA0A0]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v5;
      _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(*(id *)(a1 + 32), "setStarted:", 1);
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v6, "supportedDiagnostics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notifyClientsOfDiagnosticsTransferSupport:supportDiagnosticsTransfer:", 1, v7);

  }
}

@end
