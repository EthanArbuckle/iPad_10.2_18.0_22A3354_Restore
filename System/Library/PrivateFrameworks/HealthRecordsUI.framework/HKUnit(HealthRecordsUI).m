@implementation HKUnit(HealthRecordsUI)

+ (id)safeUnitFromString:()HealthRecordsUI
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
