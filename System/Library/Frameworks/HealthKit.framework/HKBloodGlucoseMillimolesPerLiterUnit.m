@implementation HKBloodGlucoseMillimolesPerLiterUnit

void ___HKBloodGlucoseMillimolesPerLiterUnit_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  +[HKUnit moleUnitWithMetricPrefix:molarMass:](HKUnit, "moleUnitWithMetricPrefix:molarMass:", 4, 180.15588);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[HKUnit literUnit](HKUnit, "literUnit");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unitDividedByUnit:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_HKBloodGlucoseMillimolesPerLiterUnit_glucoseUnit;
  _HKBloodGlucoseMillimolesPerLiterUnit_glucoseUnit = v1;

}

@end
