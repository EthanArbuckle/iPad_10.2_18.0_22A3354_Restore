@implementation HAMenstrualAlgorithmsWristTemperature(HKMenstrualCycles)

+ (id)hkmc_wristTemperatureWithTemperature:()HKMenstrualCycles
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x24BE3F5E0];
    v4 = a3;
    v5 = [v3 alloc];
    objc_msgSend(v4, "quantity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4048], "degreeCelsiusUnit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValueForUnit:", v7);
    v9 = v8;
    objc_msgSend(v4, "watchBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(v5, "initWithTemperature:forWatchIdentifier:", v10, v9);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

@end
