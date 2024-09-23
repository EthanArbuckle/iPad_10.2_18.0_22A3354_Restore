@implementation NSString(HKMenstrualCycles)

+ (id)hkmc_stringForYears:()HKMenstrualCycles
{
  id v4;
  void *v5;

  v4 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v4, "setYear:", a3);
  objc_msgSend(MEMORY[0x24BDD14F8], "localizedStringFromDateComponents:unitsStyle:", v4, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hkmc_stringForMonths:()HKMenstrualCycles
{
  id v4;
  void *v5;

  v4 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v4, "setMonth:", a3);
  objc_msgSend(MEMORY[0x24BDD14F8], "localizedStringFromDateComponents:unitsStyle:", v4, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hkmc_stringForDays:()HKMenstrualCycles
{
  id v4;
  void *v5;

  v4 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v4, "setDay:", a3);
  objc_msgSend(MEMORY[0x24BDD14F8], "localizedStringFromDateComponents:unitsStyle:", v4, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
