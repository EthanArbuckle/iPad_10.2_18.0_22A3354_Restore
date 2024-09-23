@implementation HKMedicalIDWeightPickerDataProvider

+ (double)defaultKilogramValue
{
  return 60.0;
}

+ (double)maximumWeightInKilograms
{
  return 658.0;
}

+ (int64_t)numberOfRows
{
  void *v2;
  uint64_t v3;
  int64_t v4;

  +[HKPersonWeightFormatter sharedFormatter](HKPersonWeightFormatter, "sharedFormatter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "localWeightUnit");

  v4 = 1316;
  if (v3 == 1538)
    v4 = 1451;
  if (v3 == 1539)
    return 1036;
  else
    return v4;
}

+ (int64_t)rowForWeightInKilograms:(double)a3
{
  void *v4;
  uint64_t v5;
  double v6;

  +[HKPersonWeightFormatter sharedFormatter](HKPersonWeightFormatter, "sharedFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "localWeightUnit");

  if (v5 == 1538)
  {
    v6 = a3 / 0.453592;
  }
  else if (v5 == 1539)
  {
    v6 = a3 / 6.35029 * 10.0;
  }
  else
  {
    v6 = a3 + a3;
  }
  return llround(v6);
}

+ (double)localWeightValueForRow:(int64_t)a3
{
  double v3;
  void *v4;
  uint64_t v5;

  v3 = (double)a3;
  +[HKPersonWeightFormatter sharedFormatter](HKPersonWeightFormatter, "sharedFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "localWeightUnit");

  if (v5 == 14)
    return v3 * 0.5;
  if (v5 == 1539)
    return v3 / 10.0;
  return v3;
}

+ (id)titleForRow:(int64_t)a3
{
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "localWeightValueForRow:", a3);
  v4 = v3;
  +[HKPersonWeightFormatter sharedFormatter](HKPersonWeightFormatter, "sharedFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "localWeightUnit");

  +[HKPersonWeightFormatter sharedFormatter](HKPersonWeightFormatter, "sharedFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromWeightValue:inUnit:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (double)getWeightInKilogramsForRow:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;

  +[HKPersonWeightFormatter sharedFormatter](HKPersonWeightFormatter, "sharedFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "localWeightUnit");

  v6 = (double)a3;
  if (v5 == 1538)
  {
    v7 = 0.453592;
  }
  else if (v5 == 1539)
  {
    v6 = v6 / 10.0;
    v7 = 6.35029;
  }
  else
  {
    v7 = 0.5;
  }
  return v6 * v7;
}

@end
