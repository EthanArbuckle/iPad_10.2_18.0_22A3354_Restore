@implementation _ActivityGoalLineAnnotationFormatter

- (BOOL)returnsUnitWithValueForDisplay
{
  return 0;
}

- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  HKDecimalFormatter(objc_msgSend(a4, "roundingMode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("GOAL_LINE_AXIS_LABEL %@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromNumber:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringWithFormat:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
