@implementation HKWorkoutEvent(HKDataMetadataDetailSection)

- (void)addDetailValuesToSection:()HKDataMetadataDetailSection
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  HKWorkoutDurationNumberFormatter *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  id v32;

  v4 = a3;
  HKDateFormatterFromTemplate(32);
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToDate:", v8);

  if (v9)
  {
    objc_msgSend(a1, "dateInterval");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringFromDate:", v11);
    v12 = (HKWorkoutDurationNumberFormatter *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DATE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEA7C0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addText:detail:baseIdentifier:", v12, v14, v15);
  }
  else
  {
    v12 = objc_alloc_init(HKWorkoutDurationNumberFormatter);
    -[HKTimePeriodWithSecondsNumberFormatter setAllowMillisecondPrecision:](v12, "setAllowMillisecondPrecision:", 1);
    v16 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "dateInterval");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "duration");
    objc_msgSend(v16, "numberWithDouble:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKTimePeriodWithSecondsNumberFormatter stringFromNumber:displayType:unitController:](v12, "stringFromNumber:displayType:unitController:", v18, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("DURATION"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEA7D8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addText:detail:baseIdentifier:", v13, v20, v21);

    objc_msgSend(a1, "dateInterval");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "startDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringFromDate:", v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "dateInterval");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "endDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringFromDate:", v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("START_TIME"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEA7F0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addText:detail:baseIdentifier:", v14, v27, v28);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("END_TIME"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEA808);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addText:detail:baseIdentifier:", v15, v30, v31);

    v4 = v29;
  }

}

- (id)startDate
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "dateInterval");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "startDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
