@implementation HKKeyValueDomain(HeartHealth)

+ (id)hkhr_aFibBurdenDefaultsDomainWithHealthStore:()HeartHealth
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CB67F0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCategory:domainName:healthStore:", 1, CFSTR("com.apple.private.health.afib-burden"), v4);

  return v5;
}

+ (id)hkhr_aFibBurdenSyncedDefaultsDomainWithHealthStore:()HeartHealth
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CB67F0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCategory:domainName:healthStore:", 0, CFSTR("com.apple.private.health.afib-burden"), v4);

  return v5;
}

@end
