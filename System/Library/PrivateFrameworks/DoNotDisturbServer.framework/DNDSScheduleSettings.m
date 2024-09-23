@implementation DNDSScheduleSettings

+ (id)defaultScheduleSettings
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0D1D738]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DNDSScheduleSettings settingsWithClientSettings:creationDate:](DNDSScheduleSettings, "settingsWithClientSettings:creationDate:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)settingsWithClientSettings:(id)a3 creationDate:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)a1);
  v9 = objc_msgSend(v7, "scheduleEnabledSetting");
  objc_msgSend(v7, "timePeriod");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "bedtimeBehaviorEnabledSetting");

  v12 = (void *)objc_msgSend(v8, "initWithScheduleEnabledSetting:timePeriod:bedtimeBehaviorEnabledSetting:creationDate:", v9, v10, v11, v6);
  return v12;
}

- (DNDSScheduleSettings)initWithScheduleEnabledSetting:(unint64_t)a3 timePeriod:(id)a4 bedtimeBehaviorEnabledSetting:(unint64_t)a5 creationDate:(id)a6
{
  id v10;
  DNDSScheduleSettings *v11;
  uint64_t v12;
  NSDate *creationDate;
  objc_super v15;

  v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)DNDSScheduleSettings;
  v11 = -[DNDScheduleSettings initWithScheduleEnabledSetting:timePeriod:bedtimeBehaviorEnabledSetting:](&v15, sel_initWithScheduleEnabledSetting_timePeriod_bedtimeBehaviorEnabledSetting_, a3, a4, a5);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    creationDate = v11->_creationDate;
    v11->_creationDate = (NSDate *)v12;

  }
  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DNDSScheduleSettings;
  v3 = -[DNDScheduleSettings hash](&v7, sel_hash);
  -[DNDSScheduleSettings creationDate](self, "creationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  DNDSScheduleSettings *v4;
  DNDSScheduleSettings *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  objc_super v14;

  v4 = (DNDSScheduleSettings *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v14.receiver = self;
      v14.super_class = (Class)DNDSScheduleSettings;
      if (-[DNDScheduleSettings isEqual:](&v14, sel_isEqual_, v5))
      {
        -[DNDSScheduleSettings creationDate](self, "creationDate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSScheduleSettings creationDate](v5, "creationDate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6 == v7)
        {
          v12 = 1;
        }
        else
        {
          -[DNDSScheduleSettings creationDate](self, "creationDate");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            -[DNDSScheduleSettings creationDate](v5, "creationDate");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if (v9)
            {
              -[DNDSScheduleSettings creationDate](self, "creationDate");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              -[DNDSScheduleSettings creationDate](v5, "creationDate");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v10, "isEqual:", v11);

            }
            else
            {
              v12 = 0;
            }

          }
          else
          {
            v12 = 0;
          }

        }
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[DNDScheduleSettings scheduleEnabledSetting](self, "scheduleEnabledSetting");
  DNDEnabledSettingToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDScheduleSettings timePeriod](self, "timePeriod");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDScheduleSettings bedtimeBehaviorEnabledSetting](self, "bedtimeBehaviorEnabledSetting");
  DNDEnabledSettingToString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSScheduleSettings creationDate](self, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<schedule: enabled: %@; %@; bedtime: %@; creation: %@>"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)replacementObjectForCoder:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v4 = objc_alloc(MEMORY[0x1E0D1D738]);
  v5 = -[DNDScheduleSettings scheduleEnabledSetting](self, "scheduleEnabledSetting");
  -[DNDScheduleSettings timePeriod](self, "timePeriod");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithScheduleEnabledSetting:timePeriod:bedtimeBehaviorEnabledSetting:", v5, v6, -[DNDScheduleSettings bedtimeBehaviorEnabledSetting](self, "bedtimeBehaviorEnabledSetting"));

  return v7;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
}

+ (id)settingsForRecord:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  DNDSScheduleSettings *v21;

  v3 = (objc_class *)MEMORY[0x1E0D1D718];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "timePeriodStartTimeHour");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHour:", objc_msgSend(v6, "unsignedIntegerValue"));

  objc_msgSend(v4, "timePeriodStartTimeMinute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinute:", objc_msgSend(v7, "unsignedIntegerValue"));

  v8 = objc_alloc_init(MEMORY[0x1E0D1D718]);
  objc_msgSend(v4, "timePeriodEndTimeHour");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHour:", objc_msgSend(v9, "unsignedIntegerValue"));

  objc_msgSend(v4, "timePeriodEndTimeMinute");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMinute:", objc_msgSend(v10, "unsignedIntegerValue"));

  objc_msgSend(v4, "timePeriodWeekdays");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  v13 = objc_alloc_init(MEMORY[0x1E0D1D720]);
  objc_msgSend(v13, "setStartTime:", v5);
  objc_msgSend(v13, "setEndTime:", v8);
  objc_msgSend(v13, "setWeekdays:", v12);
  objc_msgSend(v4, "scheduleEnabledSetting");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntegerValue");

  objc_msgSend(v4, "bedtimeBehaviorEnabledSetting");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntegerValue");

  v18 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "lastUpdatedTimestamp");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "doubleValue");
  objc_msgSend(v18, "dateWithTimeIntervalSinceReferenceDate:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = -[DNDSScheduleSettings initWithScheduleEnabledSetting:timePeriod:bedtimeBehaviorEnabledSetting:creationDate:]([DNDSScheduleSettings alloc], "initWithScheduleEnabledSetting:timePeriod:bedtimeBehaviorEnabledSetting:creationDate:", v15, v13, v17, v20);
  return v21;
}

- (id)makeRecord
{
  DNDSMutableScheduleSettingsRecord *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = objc_alloc_init(DNDSMutableScheduleSettingsRecord);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[DNDSScheduleSettings creationDate](self, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableScheduleSettingsRecord setLastUpdatedTimestamp:](v3, "setLastUpdatedTimestamp:", v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DNDScheduleSettings scheduleEnabledSetting](self, "scheduleEnabledSetting"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableScheduleSettingsRecord setScheduleEnabledSetting:](v3, "setScheduleEnabledSetting:", v7);

  -[DNDScheduleSettings timePeriod](self, "timePeriod");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "weekdays");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableScheduleSettingsRecord setTimePeriodWeekdays:](v3, "setTimePeriodWeekdays:", v10);

  objc_msgSend(v8, "startTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "hour"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableScheduleSettingsRecord setTimePeriodStartTimeHour:](v3, "setTimePeriodStartTimeHour:", v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "minute"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableScheduleSettingsRecord setTimePeriodStartTimeMinute:](v3, "setTimePeriodStartTimeMinute:", v13);

  objc_msgSend(v8, "endTime");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "hour"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableScheduleSettingsRecord setTimePeriodEndTimeHour:](v3, "setTimePeriodEndTimeHour:", v15);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "minute"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableScheduleSettingsRecord setTimePeriodEndTimeMinute:](v3, "setTimePeriodEndTimeMinute:", v16);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DNDScheduleSettings bedtimeBehaviorEnabledSetting](self, "bedtimeBehaviorEnabledSetting"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableScheduleSettingsRecord setBedtimeBehaviorEnabledSetting:](v3, "setBedtimeBehaviorEnabledSetting:", v17);

  return v3;
}

@end
