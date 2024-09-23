@implementation HDAlarmEvent(HKMenstrualCycles)

- (id)hdmc_categoryIdentifier
{
  void *v2;
  void *v3;
  int v4;
  id v5;

  objc_msgSend(a1, "eventIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)*MEMORY[0x24BE46A68];
  v4 = objc_msgSend(v2, "containsString:", *MEMORY[0x24BE46A68]);

  if (v4)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(a1, "eventIdentifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (uint64_t)hdmc_fertileWindowEndDayIndex
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a1, "hdmc_categoryIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)*MEMORY[0x24BE46A68];

  if (v2 != v3)
    return 0;
  objc_msgSend(a1, "eventIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("_"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = HKMCNotificationDateComponentScalarFromCategory();

  return v8;
}

- (uint64_t)hdmc_fertileWindowDayShift
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "hdmc_categoryIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)*MEMORY[0x24BE46A68];

  if (v2 != v3)
    return 0;
  objc_msgSend(a1, "eventIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("_"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v7, "integerValue");

  }
  return v4;
}

@end
