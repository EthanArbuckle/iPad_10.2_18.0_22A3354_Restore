@implementation HKSleepSchedule(HKDataMetadataDetailSection)

- (void)addDetailValuesToSection:()HKDataMetadataDetailSection
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v4 = a3;
  objc_msgSend(a1, "hk_localizedWeekdaysList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SLEEP_SCHEDULE_DAYS_ACTIVE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Eucalyptus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEA958);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addText:detail:baseIdentifier:", v5, v7, v8);

  objc_msgSend(a1, "hk_localizedBedtime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SLEEP_SCHEDULE_BEDTIME"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Eucalyptus"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEA970);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addText:detail:baseIdentifier:", v9, v11, v12);

  objc_msgSend(a1, "hk_localizedWakeTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SLEEP_SCHEDULE_WAKETIME"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Eucalyptus"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEA988);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addText:detail:baseIdentifier:", v13, v15, v16);

  v17.receiver = a1;
  v17.super_class = (Class)&off_1F022D500;
  objc_msgSendSuper2(&v17, sel_addDetailValuesToSection_, v4);

}

@end
