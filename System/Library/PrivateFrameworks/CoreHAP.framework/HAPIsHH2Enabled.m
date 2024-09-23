@implementation HAPIsHH2Enabled

void __HAPIsHH2Enabled_block_invoke()
{
  void *v0;
  void *v1;
  char v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", NSClassFromString(CFSTR("HMDHomeManager")));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundlePath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "containsString:", CFSTR("HomeKitDaemonLegacy.framework"));

  if ((v2 & 1) == 0)
    HAPIsHH2Enabled_hh2Enabled = 1;
  if (HAPIsInternalBuild())
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", NSClassFromString(CFSTR("HomeKitTestHostAppDelegate")));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundlePath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsString:", CFSTR("HomeKitTestHostApp.app"));

    if (v5)
    {
      HAPIsHH2Enabled_hh2Enabled = 0;
      v6 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543362;
        v15 = (uint64_t)v8;
        _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Detected unit test app. Switching the flag to HH1", (uint8_t *)&v14, 0xCu);

      }
      objc_autoreleasePoolPop(v6);
    }

  }
  v9 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = CFSTR("HH1");
    if (HAPIsHH2Enabled_hh2Enabled)
      v13 = CFSTR("HH2");
    v14 = 138543618;
    v15 = v11;
    v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@coreHAP Running in %@ mode", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v9);

}

@end
