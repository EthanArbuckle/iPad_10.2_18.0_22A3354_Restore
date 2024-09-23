@implementation HMDHomeKitVersion

+ (HMDHomeKitVersion)currentVersion
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__HMDHomeKitVersion_currentVersion__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentVersion_onceToken != -1)
    dispatch_once(&currentVersion_onceToken, block);
  return (HMDHomeKitVersion *)(id)currentVersion_version;
}

void __35__HMDHomeKitVersion_currentVersion__block_invoke(uint64_t a1)
{
  __CFString *v2;
  __CFString *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (isInternalBuild()
    && (v2 = (__CFString *)CFPreferencesCopyAppValue(CFSTR("homeKitVersionOverride"), CFSTR("com.apple.homed"))) != 0)
  {
    v3 = v2;
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v6;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Version string is overridden to %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    v3 = CFSTR("12.0");
  }
  v7 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithVersionString:", v3);
  v8 = (void *)currentVersion_version;
  currentVersion_version = v7;

}

@end
