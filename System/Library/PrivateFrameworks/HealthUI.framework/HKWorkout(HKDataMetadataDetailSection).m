@implementation HKWorkout(HKDataMetadataDetailSection)

- (void)addDetailValuesToSection:()HKDataMetadataDetailSection
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HKWorkoutDurationNumberFormatter *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "workoutActivityType");
  HKUILocalizedWorkoutTypeName();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("WORKOUT_TYPE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sampleType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v8;
  v24[1] = CFSTR("Type");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addText:detail:baseIdentifier:", v21, v6, v10);

  v11 = objc_alloc_init(HKWorkoutDurationNumberFormatter);
  -[HKTimePeriodWithSecondsNumberFormatter setAllowMillisecondPrecision:](v11, "setAllowMillisecondPrecision:", 1);
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "duration");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTimePeriodWithSecondsNumberFormatter stringFromNumber:displayType:unitController:](v11, "stringFromNumber:displayType:unitController:", v13, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("DURATION"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sampleType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v18;
  v23[1] = CFSTR("Duration");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addText:detail:baseIdentifier:", v14, v16, v20);

  v22.receiver = a1;
  v22.super_class = (Class)&off_1F02237A8;
  objc_msgSendSuper2(&v22, sel_addDetailValuesToSection_, v4);

}

@end
