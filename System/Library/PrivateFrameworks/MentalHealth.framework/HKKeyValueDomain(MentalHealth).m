@implementation HKKeyValueDomain(MentalHealth)

+ (id)hkmh_mentalHealthSyncedDefaultsDomainWithHealthStore:()MentalHealth
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDD3C98];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCategory:domainName:healthStore:", 0, CFSTR("com.apple.private.health.mental-health"), v4);

  return v5;
}

@end
