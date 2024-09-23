@implementation HMDMemoryDiagnostic

+ (id)memoryLevelsMB
{
  return &unk_1E8B32328;
}

+ (void)configureMemoryDiagnostic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](a1, a2);
  objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "softwareVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buildVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(a1, "_previousLevelForBuild:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = (void *)v7;
    else
      v8 = &unk_1E8B35208;
    objc_msgSend(a1, "_nextLevelFromPreviousLevel:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = a1;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543874;
      v24 = v13;
      v25 = 2112;
      v26 = v6;
      v27 = 2112;
      v28 = v9;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Setting diagnostic memory limit for build %@ to %@MB", (uint8_t *)&v23, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v11, "_configureCurrentProcessLevel:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = v11;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v18;
        v25 = 2112;
        v26 = v14;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to set diagnostic memory limit: %@", (uint8_t *)&v23, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
    }
    else if ((objc_msgSend(v9, "isEqualToNumber:", v8) & 1) == 0)
    {
      objc_msgSend(v11, "_recordLevel:forBuild:", v9, v6);
    }

  }
  else
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = a1;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v22;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to get current build version, return", (uint8_t *)&v23, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
  }

  objc_autoreleasePoolPop(v3);
}

+ (id)_configureCurrentProcessLevel:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "intValue");
  getpid();
  v3 = memorystatus_control();
  if (!(_DWORD)v3)
    return 0;
  v4 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("memorystatus_control returned %d"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmfErrorWithCode:reason:", 15, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)_recordLevel:(id)a3 forBuild:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("buildVersion");
  v10[1] = CFSTR("memoryLevelMB");
  v11[0] = a4;
  v11[1] = a3;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("com.apple.homekit.MemoryDiagnosticLimit"));
}

+ (id)_previousLevelForBuild:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryForKey:", CFSTR("com.apple.homekit.MemoryDiagnosticLimit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "valueForKey:", CFSTR("buildVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && objc_msgSend(v4, "isEqualToString:", v7))
    {
      objc_msgSend(v6, "valueForKey:", CFSTR("memoryLevelMB"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1D17BA0A0]();
      v10 = a1;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543874;
        v15 = v12;
        v16 = 2112;
        v17 = v7;
        v18 = 2112;
        v19 = v8;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Previous diagnostic memory limit for build %@ is set to %@MB", (uint8_t *)&v14, 0x20u);

      }
      objc_autoreleasePoolPop(v9);
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_nextLevelFromPreviousLevel:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__177443;
  v16 = __Block_byref_object_dispose__177444;
  v4 = a3;
  v17 = v4;
  objc_msgSend(a1, "memoryLevelsMB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__HMDMemoryDiagnostic__nextLevelFromPreviousLevel___block_invoke;
  v9[3] = &unk_1E89C0828;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __51__HMDMemoryDiagnostic__nextLevelFromPreviousLevel___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v7;
  id v8;

  v8 = a2;
  v7 = objc_msgSend(v8, "intValue");
  if (v7 > (int)objc_msgSend(*(id *)(a1 + 32), "intValue"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

@end
