@implementation HKKeyValueDomain(MenstrualCycles)

+ (id)hkmc_cycleChartsHiddenRowsDomainWithHealthStore:()MenstrualCycles
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDD3C98];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCategory:domainName:healthStore:", 4, CFSTR("com.apple.private.health.menstrual-cycles.cycle-charts-hidden-rows"), v4);

  return v5;
}

- (uint64_t)hkmc_setOnboardingTileLastDismissedDate:()MenstrualCycles error:
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;

  v7 = a3;
  objc_msgSend(a1, "domainName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.private.health.menstrual-cycles")))
  {

    goto LABEL_5;
  }
  v9 = objc_msgSend(a1, "category");

  if (v9 != 4)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKKeyValueDomain+MenstrualCycles.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.domainName isEqualToString:HKMCMenstrualCyclesDefaultsDomain] && self.category == HKKeyValueCategoryUbiquitousUserDefaults"));

  }
  v10 = objc_msgSend(a1, "setDate:forKey:error:", v7, CFSTR("OnboardingTileLastDismissedDate"), a4);

  return v10;
}

@end
