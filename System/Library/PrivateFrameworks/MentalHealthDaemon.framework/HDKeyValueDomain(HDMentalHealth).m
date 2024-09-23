@implementation HDKeyValueDomain(HDMentalHealth)

+ (id)hdmh_mentalHealthSyncedDefaultsDomainWithProfile:()HDMentalHealth
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = HDEntityCategoryForKeyValueCategory();
  v5 = objc_alloc(MEMORY[0x24BE40AD0]);
  v6 = (void *)objc_msgSend(v5, "initWithCategory:domainName:profile:", v4, *MEMORY[0x24BE65D20], v3);

  return v6;
}

@end
