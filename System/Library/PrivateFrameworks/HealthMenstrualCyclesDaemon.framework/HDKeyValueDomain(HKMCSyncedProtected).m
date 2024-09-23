@implementation HDKeyValueDomain(HKMCSyncedProtected)

+ (id)hdmc_syncedMenstrualCyclesDefaultsDomainWithProfile:()HKMCSyncedProtected
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BE40AD0];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithCategory:domainName:profile:", 105, *MEMORY[0x24BE469D0], v4);

  return v6;
}

- (uint64_t)hdmc_legacyOnboardingVersionCompletedWithError:()HKMCSyncedProtected
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
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKMenstrualCycles.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.domainName isEqualToString:HKMCMenstrualCyclesDefaultsDomain]"));

  }
  if (objc_msgSend(a1, "category") != 105)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKMenstrualCycles.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults"));

  }
  return objc_msgSend(a1, "numberForKey:error:", *MEMORY[0x24BE469A0], a3);
}

- (uint64_t)hdmc_legacyOnboardingFirstCompletedDateWithError:()HKMCSyncedProtected
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
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKMenstrualCycles.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.domainName isEqualToString:HKMCMenstrualCyclesDefaultsDomain]"));

  }
  if (objc_msgSend(a1, "category") != 105)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKMenstrualCycles.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults"));

  }
  return objc_msgSend(a1, "dateForKey:error:", *MEMORY[0x24BE469A8], a3);
}

- (uint64_t)hdmc_setLastLoggedInCycleTrackingDate:()HKMCSyncedProtected error:
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
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKMenstrualCycles.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.domainName isEqualToString:HKMCMenstrualCyclesDefaultsDomain]"));

  }
  if (objc_msgSend(a1, "category") != 105)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKMenstrualCycles.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults"));

  }
  v10 = objc_msgSend(a1, "setDate:forKey:error:", v7, *MEMORY[0x24BE46998], a4);

  return v10;
}

- (uint64_t)hdmc_lastLoggedInCycleTrackingDateWithError:()HKMCSyncedProtected
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
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKMenstrualCycles.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.domainName isEqualToString:HKMCMenstrualCyclesDefaultsDomain]"));

  }
  if (objc_msgSend(a1, "category") != 105)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKMenstrualCycles.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults"));

  }
  return objc_msgSend(a1, "dateForKey:error:", *MEMORY[0x24BE46998], a3);
}

- (uint64_t)hdmc_setUnconfirmedDeviationDismissalDayIndex:()HKMCSyncedProtected error:
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
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKMenstrualCycles.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.domainName isEqualToString:HKMCMenstrualCyclesDefaultsDomain]"));

  }
  if (objc_msgSend(a1, "category") != 105)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKMenstrualCycles.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults"));

  }
  v10 = objc_msgSend(a1, "setNumber:forKey:error:", v7, *MEMORY[0x24BE46AF8], a4);

  return v10;
}

- (uint64_t)hdmc_unconfirmedDeviationDismissalDayIndexWithError:()HKMCSyncedProtected
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
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKMenstrualCycles.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.domainName isEqualToString:HKMCMenstrualCyclesDefaultsDomain]"));

  }
  if (objc_msgSend(a1, "category") != 105)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKMenstrualCycles.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults"));

  }
  return objc_msgSend(a1, "numberForKey:error:", *MEMORY[0x24BE46AF8], a3);
}

@end
