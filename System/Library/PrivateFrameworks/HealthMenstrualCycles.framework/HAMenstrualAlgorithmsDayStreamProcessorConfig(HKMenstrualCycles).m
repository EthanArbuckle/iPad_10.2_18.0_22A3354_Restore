@implementation HAMenstrualAlgorithmsDayStreamProcessorConfig(HKMenstrualCycles)

+ (id)hkmc_configurationWithBirthDateComponents:()HKMenstrualCycles userReportedCycleLength:onDayIndex:userReportedMenstruationLength:onDayIndex:
{
  id v11;
  id v12;
  objc_class *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v11 = a4;
  v12 = a6;
  v13 = (objc_class *)MEMORY[0x24BE3F598];
  v14 = a3;
  v15 = objc_alloc_init(v13);
  objc_msgSend(v15, "setBirthDateComponents:", v14);

  if (v11)
  {
    v16 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDD4048], "dayUnit");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValueForUnit:", v17);
    objc_msgSend(v16, "numberWithDouble:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setUserReportedCycleLength:", v18);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setJulianDayOfUserReportedCycleLength:", v19);

  }
  if (v12)
  {
    v20 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDD4048], "dayUnit");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValueForUnit:", v21);
    objc_msgSend(v20, "numberWithDouble:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setUserReportedMenstruationLength:", v22);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setJulianDayOfUserReportedMenstruationLength:", v23);

  }
  return v15;
}

@end
