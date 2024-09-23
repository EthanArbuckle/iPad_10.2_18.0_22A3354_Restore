@implementation HKQuantity(HKMenstrualCycles)

+ (id)hkmc_quantityWithDegreesCelsius:()HKMenstrualCycles
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "degreeCelsiusUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "quantityWithUnit:doubleValue:", v3, a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)hkmc_quantityWithDegreesFahrenheit:()HKMenstrualCycles
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "degreeFahrenheitUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "quantityWithUnit:doubleValue:", v3, a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)hkmc_degreesCelsius
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x24BDD4048], "degreeCelsiusUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "doubleValueForUnit:", v2);
  v4 = v3;

  return v4;
}

- (double)hkmc_degreesFahrenheit
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x24BDD4048], "degreeFahrenheitUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "doubleValueForUnit:", v2);
  v4 = v3;

  return v4;
}

@end
