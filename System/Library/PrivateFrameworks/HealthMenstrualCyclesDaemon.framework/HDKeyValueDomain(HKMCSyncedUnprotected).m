@implementation HDKeyValueDomain(HKMCSyncedUnprotected)

+ (id)hdmc_cycleChartsHiddenRowsDomainWithProfile:()HKMCSyncedUnprotected
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BE40AD0];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithCategory:domainName:profile:", 1, *MEMORY[0x24BE46878], v4);

  return v6;
}

+ (id)hdmc_syncedUnprotectedDomainWithProfile:()HKMCSyncedUnprotected
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = [a1 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithCategory:domainName:profile:", 1, *MEMORY[0x24BE469D0], v4);

  return v6;
}

- (uint64_t)hdmc_onboardingTileLastDismissedDateWithError:()HKMCSyncedUnprotected
{
  void *v6;
  char v7;
  void *v9;
  void *v10;

  objc_msgSend(a1, "domainName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE469D0]);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKMenstrualCycles.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.domainName isEqualToString:HKMCMenstrualCyclesDefaultsDomain]"));

  }
  if (objc_msgSend(a1, "category") != 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKMenstrualCycles.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.category == HDKeyValueEntityCategoryNanoUserDefaults"));

  }
  return objc_msgSend(a1, "dateForKey:error:", *MEMORY[0x24BE46A90], a3);
}

- (uint64_t)hdmc_setOnboardingTileLastDismissedTimeIntervalSinceReferenceDate:()HKMCSyncedUnprotected error:
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v7 = a3;
  objc_msgSend(a1, "domainName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE469D0]);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKMenstrualCycles.m"), 102, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.domainName isEqualToString:HKMCMenstrualCyclesDefaultsDomain]"));

  }
  if (objc_msgSend(a1, "category") != 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKMenstrualCycles.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.category == HDKeyValueEntityCategoryNanoUserDefaults"));

    if (v7)
      goto LABEL_5;
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  if (!v7)
    goto LABEL_7;
LABEL_5:
  v10 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v14 = objc_msgSend(a1, "setDate:forKey:error:", v11, *MEMORY[0x24BE46A90], a4);

  return v14;
}

- (uint64_t)hdmc_setUpdatedFertileWindowNotificationFireDate:()HKMCSyncedUnprotected error:
{
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v12;
  void *v13;

  v7 = a3;
  objc_msgSend(a1, "domainName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE469D0]);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKMenstrualCycles.m"), 113, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.domainName isEqualToString:HKMCMenstrualCyclesDefaultsDomain]"));

  }
  if (objc_msgSend(a1, "category") != 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKMenstrualCycles.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.category == HDKeyValueEntityCategoryNanoUserDefaults"));

  }
  v10 = objc_msgSend(a1, "setDate:forKey:error:", v7, *MEMORY[0x24BE46B08], a4);

  return v10;
}

- (uint64_t)hdmc_updatedFertileWindowNotificationFireDateWithError:()HKMCSyncedUnprotected
{
  void *v6;
  char v7;
  void *v9;
  void *v10;

  objc_msgSend(a1, "domainName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE469D0]);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKMenstrualCycles.m"), 119, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.domainName isEqualToString:HKMCMenstrualCyclesDefaultsDomain]"));

  }
  if (objc_msgSend(a1, "category") != 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKMenstrualCycles.m"), 120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.category == HDKeyValueEntityCategoryNanoUserDefaults"));

  }
  return objc_msgSend(a1, "dateForKey:error:", *MEMORY[0x24BE46B08], a3);
}

@end
