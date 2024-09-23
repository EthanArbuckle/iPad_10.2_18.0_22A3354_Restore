@implementation DNDModeConfigurationScheduleTrigger(Record)

+ (uint64_t)newWithDictionaryRepresentation:()Record context:
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v18;

  v3 = a3;
  objc_msgSend(v3, "bs_safeNumberForKey:", CFSTR("timePeriodStartTimeHour"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_safeNumberForKey:", CFSTR("timePeriodStartTimeMinute"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_safeNumberForKey:", CFSTR("timePeriodEndTimeHour"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_safeNumberForKey:", CFSTR("timePeriodEndTimeMinute"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_safeNumberForKey:", CFSTR("timePeriodWeekdays"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_safeNumberForKey:", CFSTR("creationDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_safeNumberForKey:", CFSTR("enabledSetting"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "unsignedIntegerValue");
  v11 = objc_alloc_init(MEMORY[0x1E0D1D718]);
  objc_msgSend(v11, "setHour:", objc_msgSend(v18, "unsignedIntegerValue"));
  objc_msgSend(v11, "setMinute:", objc_msgSend(v4, "unsignedIntegerValue"));
  v12 = objc_alloc_init(MEMORY[0x1E0D1D718]);
  objc_msgSend(v12, "setHour:", objc_msgSend(v5, "unsignedIntegerValue"));
  objc_msgSend(v12, "setMinute:", objc_msgSend(v6, "unsignedIntegerValue"));
  v13 = objc_alloc_init(MEMORY[0x1E0D1D720]);
  objc_msgSend(v13, "setStartTime:", v11);
  objc_msgSend(v13, "setEndTime:", v12);
  objc_msgSend(v13, "setWeekdays:", objc_msgSend(v7, "integerValue"));
  v14 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v8, "doubleValue");
  objc_msgSend(v14, "dateWithTimeIntervalSince1970:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1D680]), "initWithTimePeriod:creationDate:enabledSetting:", v13, v15, v10);

  return v16;
}

- (id)dictionaryRepresentationWithContext:()Record
{
  void *v2;
  void *v3;
  void *v4;
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
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[8];
  _QWORD v28[10];

  v28[8] = *MEMORY[0x1E0C80C00];
  v28[0] = CFSTR("DNDModeConfigurationScheduleTrigger");
  v27[0] = CFSTR("class");
  v27[1] = CFSTR("enabledSetting");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "enabledSetting"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v26;
  v27[2] = CFSTR("timePeriodStartTimeHour");
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "timePeriod");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "startTime");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v24, "hour"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v23;
  v27[3] = CFSTR("timePeriodStartTimeMinute");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "timePeriod");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "startTime");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v21, "minute"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v20;
  v27[4] = CFSTR("timePeriodEndTimeHour");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "timePeriod");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "endTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "hour"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v6;
  v27[5] = CFSTR("timePeriodEndTimeMinute");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "timePeriod");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v9, "minute"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[5] = v10;
  v27[6] = CFSTR("timePeriodWeekdays");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "timePeriod");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "weekdays"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[6] = v13;
  v27[7] = CFSTR("creationDate");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "creationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSince1970");
  objc_msgSend(v14, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[7] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
