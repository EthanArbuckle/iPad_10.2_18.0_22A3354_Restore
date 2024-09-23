@implementation HKMedicalIDHeightPickerDataProvider

+ (double)defaultCentimeterValue
{
  void *v2;
  int v3;
  double result;

  +[HKPersonHeightFormatter sharedFormatter](HKPersonHeightFormatter, "sharedFormatter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesImperialUnits");

  result = 168.0;
  if (v3)
    return 167.64;
  return result;
}

+ (int64_t)numberOfRowsInComponent:(int64_t)a3
{
  void *v4;
  int v5;
  int64_t v6;

  +[HKPersonHeightFormatter sharedFormatter](HKPersonHeightFormatter, "sharedFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "usesImperialUnits");

  v6 = 12;
  if (!a3)
    v6 = 10;
  if (v5)
    return v6;
  else
    return 300;
}

+ (id)titleForRow:(int64_t)a3 inComponent:(int64_t)a4
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  double v10;
  uint64_t v11;
  void *v12;

  +[HKPersonHeightFormatter sharedFormatter](HKPersonHeightFormatter, "sharedFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "usesImperialUnits");

  if (v7)
  {
    +[HKPersonHeightFormatter sharedFormatter](HKPersonHeightFormatter, "sharedFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = (double)a3;
    if (a4)
      objc_msgSend(v8, "formattedValueForInches:", v10);
    else
      objc_msgSend(v8, "formattedValueForFeet:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[HKPersonHeightFormatter sharedFormatter](HKPersonHeightFormatter, "sharedFormatter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "formattedValueForCentimeters:", (double)a3);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;

  return v12;
}

+ (int64_t)heightValueForRow:(int64_t)a3 inComponent:(int64_t)a4
{
  return a3;
}

@end
