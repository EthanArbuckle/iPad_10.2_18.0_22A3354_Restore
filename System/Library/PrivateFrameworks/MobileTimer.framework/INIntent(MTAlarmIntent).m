@implementation INIntent(MTAlarmIntent)

+ (MTCreateAlarmIntent)mt_intentForAlarmCreate:()MTAlarmIntent
{
  id v4;
  MTCreateAlarmIntent *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  v5 = objc_alloc_init(MTCreateAlarmIntent);
  -[MTCreateAlarmIntent _setExtensionBundleId:](v5, "_setExtensionBundleId:", CFSTR("com.apple.mobiletimer-framework.MobileTimerIntents"));
  -[MTCreateAlarmIntent _setLaunchId:](v5, "_setLaunchId:", CFSTR("com.apple.mobiletimer"));
  objc_msgSend(a1, "mt_nanoAlarmBundleIDForAlarm:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTCreateAlarmIntent _setNanoLaunchId:](v5, "_setNanoLaunchId:", v6);

  objc_msgSend(v4, "intentLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTCreateAlarmIntent setLabel:](v5, "setLabel:", v7);

  objc_msgSend(v4, "dateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTCreateAlarmIntent setDateComponents:](v5, "setDateComponents:", v8);

  v9 = objc_msgSend(v4, "repeatSchedule");
  MTRepeatDaysForAlarmRepeatSchedule(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTCreateAlarmIntent setRepeatSchedule:](v5, "setRepeatSchedule:", v10);

  return v5;
}

+ (MTUpdateAlarmIntent)mt_intentForAlarmUpdate:()MTAlarmIntent
{
  id v4;
  MTUpdateAlarmIntent *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(MTUpdateAlarmIntent);
  -[MTUpdateAlarmIntent _setExtensionBundleId:](v5, "_setExtensionBundleId:", CFSTR("com.apple.mobiletimer-framework.MobileTimerIntents"));
  -[MTUpdateAlarmIntent _setLaunchId:](v5, "_setLaunchId:", CFSTR("com.apple.mobiletimer"));
  objc_msgSend(a1, "mt_nanoAlarmBundleIDForAlarm:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTUpdateAlarmIntent _setNanoLaunchId:](v5, "_setNanoLaunchId:", v6);

  objc_msgSend(v4, "alarmIDIntentObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTUpdateAlarmIntent setAlarmID:](v5, "setAlarmID:", v7);
  return v5;
}

+ (MTToggleAlarmIntent)mt_intentForAlarmEnable:()MTAlarmIntent
{
  id v4;
  MTToggleAlarmIntent *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(MTToggleAlarmIntent);
  -[MTToggleAlarmIntent _setExtensionBundleId:](v5, "_setExtensionBundleId:", CFSTR("com.apple.mobiletimer-framework.MobileTimerIntents"));
  -[MTToggleAlarmIntent _setLaunchId:](v5, "_setLaunchId:", CFSTR("com.apple.mobiletimer"));
  objc_msgSend(a1, "mt_nanoAlarmBundleIDForAlarm:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTToggleAlarmIntent _setNanoLaunchId:](v5, "_setNanoLaunchId:", v6);

  objc_msgSend(v4, "intentAlarm");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTToggleAlarmIntent setAlarm:](v5, "setAlarm:", v7);
  -[MTToggleAlarmIntent setOperation:](v5, "setOperation:", 1);
  -[MTToggleAlarmIntent setState:](v5, "setState:", 1);
  return v5;
}

+ (MTToggleAlarmIntent)mt_intentForAlarmDisable:()MTAlarmIntent
{
  id v4;
  MTToggleAlarmIntent *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(MTToggleAlarmIntent);
  -[MTToggleAlarmIntent _setExtensionBundleId:](v5, "_setExtensionBundleId:", CFSTR("com.apple.mobiletimer-framework.MobileTimerIntents"));
  -[MTToggleAlarmIntent _setLaunchId:](v5, "_setLaunchId:", CFSTR("com.apple.mobiletimer"));
  objc_msgSend(a1, "mt_nanoAlarmBundleIDForAlarm:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTToggleAlarmIntent _setNanoLaunchId:](v5, "_setNanoLaunchId:", v6);

  objc_msgSend(v4, "intentAlarm");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTToggleAlarmIntent setAlarm:](v5, "setAlarm:", v7);
  -[MTToggleAlarmIntent setOperation:](v5, "setOperation:", 1);
  -[MTToggleAlarmIntent setState:](v5, "setState:", 2);
  return v5;
}

- (id)mt_initWithAlarm:()MTAlarmIntent verb:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setHour:", objc_msgSend(v7, "hour"));
  objc_msgSend(v8, "setMinute:", objc_msgSend(v7, "minute"));
  objc_msgSend(v7, "displayTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alarmIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 7);
  v12 = objc_msgSend(v7, "repeatSchedule");

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __49__INIntent_MTAlarmIntent__mt_initWithAlarm_verb___block_invoke;
  v17[3] = &unk_1E39CCCD8;
  v13 = v11;
  v18 = v13;
  MTAlarmRepeatScheduleEnumerateDays(v12, v17);
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "na_safeSetObject:forKey:", v8, CFSTR("time"));
  objc_msgSend(v14, "na_safeSetObject:forKey:", v9, CFSTR("label"));
  objc_msgSend(v14, "na_safeSetObject:forKey:", v10, CFSTR("identifier"));
  if (objc_msgSend(v13, "count"))
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("repeat"));
  v15 = (void *)objc_msgSend(a1, "initWithDomain:verb:parametersByName:", CFSTR("Alarm"), v6, v14);

  return v15;
}

+ (void)mt_deleteDonationsForAlarm:()MTAlarmIntent completion:
{
  id v5;
  id v6;
  __CFString *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = CFSTR("com.apple.mobiletimer");
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v8 = (void *)getCSSearchableIndexClass_softClass;
  v17 = getCSSearchableIndexClass_softClass;
  if (!getCSSearchableIndexClass_softClass)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __getCSSearchableIndexClass_block_invoke;
    v13[3] = &unk_1E39CB690;
    v13[4] = &v14;
    __getCSSearchableIndexClass_block_invoke((uint64_t)v13);
    v8 = (void *)v15[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v14, 8);
  objc_msgSend(v9, "defaultSearchableIndex");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alarmIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deleteInteractionsWithGroupIdentifiers:bundleID:protectionClass:completionHandler:", v12, v7, 0, v6);

}

+ (__CFString)mt_nanoAlarmBundleIDForAlarm:()MTAlarmIntent
{
  return CFSTR("com.apple.NanoAlarm");
}

@end
