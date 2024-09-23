@implementation HMDSecureClassBulletinUserAttributionTime

void __HMDSecureClassBulletinUserAttributionTime_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceForKey:", CFSTR("HMDSecureClassBulletinUserAttributionTime"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "numberValue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValue");
  HMDSecureClassBulletinUserAttributionTime__hmf_once_v11 = v2;

}

@end
