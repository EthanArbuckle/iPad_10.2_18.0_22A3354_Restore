@implementation HKActivitySummaryAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HKActivitySummary");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;

  __UIAccessibilitySafeClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeEnergyBurnedGoal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValueForUnit:", v4);
  v6 = v5;

  if (v6 > 0.0)
  {
    objc_msgSend(v2, "activeEnergyBurned");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValueForUnit:", v8);

  }
  objc_msgSend(v2, "appleExerciseTimeGoal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValueForUnit:", v10);
  v12 = v11;

  if (v12 > 0.0)
  {
    objc_msgSend(v2, "appleExerciseTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValueForUnit:", v14);

  }
  objc_msgSend(v2, "appleStandHoursGoal");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValueForUnit:", v16);
  v18 = v17;

  if (v18 > 0.0)
  {
    objc_msgSend(v2, "appleStandHours");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValueForUnit:", v20);

  }
  v35 = v2;
  v21 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("move.percentage"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatFloatWithPercentage();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("exercise.percentage"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatFloatWithPercentage();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("stand.percentage"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatFloatWithPercentage();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringWithFormat:", v30, v31);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

@end
