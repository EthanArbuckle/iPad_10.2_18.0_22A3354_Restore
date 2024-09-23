@implementation HKSleepSchedule

+ (HKSleepSchedule)sleepScheduleWithDate:(id)a3 weekdays:(unint64_t)a4 wakeTimeComponents:(id)a5 bedTimeComponents:(id)a6 overrideDayIndex:(id)a7 device:(id)a8 metadata:(id)a9
{
  return (HKSleepSchedule *)objc_msgSend(a1, "_sleepScheduleWithDate:weekdays:wakeTimeComponents:bedTimeComponents:overrideDayIndex:device:metadata:config:", a3, a4, a5, a6, a7, a8, a9, 0);
}

+ (id)_sleepScheduleWithDate:(id)a3 weekdays:(unint64_t)a4 wakeTimeComponents:(id)a5 bedTimeComponents:(id)a6 overrideDayIndex:(id)a7 device:(id)a8 metadata:(id)a9 config:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  objc_super v31;
  _QWORD aBlock[4];
  id v33;
  id v34;
  id v35;
  id v36;
  unint64_t v37;

  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a10;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __128__HKSleepSchedule__sleepScheduleWithDate_weekdays_wakeTimeComponents_bedTimeComponents_overrideDayIndex_device_metadata_config___block_invoke;
  aBlock[3] = &unk_1E37F83A0;
  v36 = v19;
  v37 = a4;
  v33 = v16;
  v34 = v17;
  v35 = v18;
  v20 = v19;
  v21 = v18;
  v22 = v17;
  v23 = v16;
  v24 = a9;
  v25 = a8;
  v26 = a3;
  v27 = _Block_copy(aBlock);
  +[HKObjectType sleepScheduleType](HKObjectType, "sleepScheduleType");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31.receiver = a1;
  v31.super_class = (Class)&OBJC_METACLASS___HKSleepSchedule;
  v29 = objc_msgSendSuper2(&v31, sel__newSampleFromDatesWithType_startDate_endDate_device_metadata_config_, v28, v26, v26, v25, v24, v27);

  return v29;
}

void __128__HKSleepSchedule__sleepScheduleWithDate_weekdays_wakeTimeComponents_bedTimeComponents_overrideDayIndex_device_metadata_config___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  *((_QWORD *)v4 + 12) = *(_QWORD *)(a1 + 64);
  objc_storeStrong((id *)v4 + 13, *(id *)(a1 + 32));
  objc_storeStrong((id *)v4 + 14, *(id *)(a1 + 40));
  objc_storeStrong((id *)v4 + 15, *(id *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 56);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (HKSleepSchedule)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HKSample startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromHKSleepScheduleWeekdays(-[HKSleepSchedule weekdays](self, "weekdays"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSleepSchedule wakeTimeComponents](self, "wakeTimeComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_dateOptionalDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSleepSchedule bedTimeComponents](self, "bedTimeComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_dateOptionalDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSleepSchedule overrideDayIndex](self, "overrideDayIndex");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p date: %@, days: %@, waketime: %@, bedtime: %@, day index: %@>"), v4, self, v5, v6, v8, v10, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  void *v5;
  void *v6;
  id v7;
  NSNumber *overrideDayIndex;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HKSleepSchedule;
  -[HKSample _validateWithConfiguration:](&v14, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
LABEL_10:
    v12 = v7;
    goto LABEL_11;
  }
  overrideDayIndex = self->_overrideDayIndex;
  if (self->_weekdays)
  {
    if (overrideDayIndex)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = objc_opt_class();
      v11 = CFSTR("Only sleep schedules without weekdays can specify an override day index.");
LABEL_9:
      objc_msgSend(v9, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v10, a2, v11);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  else if (!overrideDayIndex)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("Sleep schedules without weekdays must specify an override day index.");
    goto LABEL_9;
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (id)wakeDateComponentsForMorningIndex:(int64_t)a3 calendar:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  -[HKSleepSchedule wakeTimeComponents](self, "wakeTimeComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D78], "hk_componentsWithDayIndex:calendar:", a3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSleepSchedule wakeTimeComponents](self, "wakeTimeComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHour:", objc_msgSend(v9, "hour"));

    -[HKSleepSchedule wakeTimeComponents](self, "wakeTimeComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMinute:", objc_msgSend(v10, "minute"));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)bedtimeDateIntervalForWakeTime:(id)a3 calendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v13;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  HKSleepSchedule *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HKSleepSchedule bedTimeComponents](self, "bedTimeComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nextDateAfterDate:matchingComponents:options:", v6, v8, 516);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && objc_msgSend(v6, "hk_isAfterOrEqualToDate:", v9))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v9, v6);
  }
  else
  {
    _HKInitializeLogging();
    v11 = (void *)HKLogSleep;
    if (os_log_type_enabled((os_log_t)HKLogSleep, OS_LOG_TYPE_ERROR))
    {
      v13 = v11;
      v15 = 138544130;
      v16 = (id)objc_opt_class();
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v9;
      v21 = 2112;
      v22 = self;
      v14 = v16;
      _os_log_error_impl(&dword_19A0E6000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] Found invalid bedtime interval (%@ - %@) for schedule: %@", (uint8_t *)&v15, 0x2Au);

    }
    v10 = 0;
  }

  return v10;
}

- (id)bedtimeDateIntervalForMorningIndex:(int64_t)a3 calendar:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  -[HKSleepSchedule wakeDateComponentsForMorningIndex:calendar:](self, "wakeDateComponentsForMorningIndex:calendar:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HKSleepSchedule bedtimeDateIntervalForWakeTime:calendar:](self, "bedtimeDateIntervalForWakeTime:calendar:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)hasEquivalentTimesToSleepSchedule:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;

  v4 = a3;
  -[HKSleepSchedule wakeTimeComponents](self, "wakeTimeComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wakeTimeComponents");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    objc_msgSend(v4, "wakeTimeComponents");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
LABEL_10:

      goto LABEL_11;
    }
    v9 = (void *)v8;
    -[HKSleepSchedule wakeTimeComponents](self, "wakeTimeComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wakeTimeComponents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_11;
  }
  -[HKSleepSchedule bedTimeComponents](self, "bedTimeComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bedTimeComponents");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v13)
  {

LABEL_13:
    v19 = 1;
    goto LABEL_14;
  }
  v7 = (void *)v13;
  objc_msgSend(v4, "bedTimeComponents");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_10;
  v15 = (void *)v14;
  -[HKSleepSchedule bedTimeComponents](self, "bedTimeComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bedTimeComponents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isEqual:", v17);

  if ((v18 & 1) != 0)
    goto LABEL_13;
LABEL_11:
  v19 = 0;
LABEL_14:

  return v19;
}

- (BOOL)hasEquivalentOverrideDayToSleepSchedule:(id)a3
{
  id v4;
  BOOL v5;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v4 = a3;
  if (-[HKSleepSchedule weekdays](self, "weekdays") || objc_msgSend(v4, "weekdays"))
    goto LABEL_3;
  -[HKSleepSchedule overrideDayIndex](self, "overrideDayIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overrideDayIndex");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v7 == (void *)v8)
  {

LABEL_10:
    v5 = 1;
    goto LABEL_4;
  }
  v9 = (void *)v8;
  objc_msgSend(v4, "overrideDayIndex");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[HKSleepSchedule overrideDayIndex](self, "overrideDayIndex");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "overrideDayIndex");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if ((v14 & 1) != 0)
      goto LABEL_10;
  }
  else
  {

  }
LABEL_3:
  v5 = 0;
LABEL_4:

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKSleepSchedule;
  v4 = a3;
  -[HKSample encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_weekdays, CFSTR("Weekdays"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_wakeTimeComponents, CFSTR("WakeTimeComponents"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bedTimeComponents, CFSTR("BedTimeComponents"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_overrideDayIndex, CFSTR("OverrideDayIndex"));

}

- (HKSleepSchedule)initWithCoder:(id)a3
{
  id v4;
  HKSleepSchedule *v5;
  uint64_t v6;
  NSDateComponents *wakeTimeComponents;
  uint64_t v8;
  NSDateComponents *bedTimeComponents;
  uint64_t v10;
  NSNumber *overrideDayIndex;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKSleepSchedule;
  v5 = -[HKSample initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_weekdays = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Weekdays"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WakeTimeComponents"));
    v6 = objc_claimAutoreleasedReturnValue();
    wakeTimeComponents = v5->_wakeTimeComponents;
    v5->_wakeTimeComponents = (NSDateComponents *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BedTimeComponents"));
    v8 = objc_claimAutoreleasedReturnValue();
    bedTimeComponents = v5->_bedTimeComponents;
    v5->_bedTimeComponents = (NSDateComponents *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OverrideDayIndex"));
    v10 = objc_claimAutoreleasedReturnValue();
    overrideDayIndex = v5->_overrideDayIndex;
    v5->_overrideDayIndex = (NSNumber *)v10;

  }
  return v5;
}

+ (BOOL)supportsEquivalence
{
  return 1;
}

- (BOOL)isEquivalent:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  objc_super v29;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v29.receiver = self;
    v29.super_class = (Class)HKSleepSchedule;
    if (!-[HKSample isEquivalent:](&v29, sel_isEquivalent_, v5))
      goto LABEL_20;
    v6 = -[HKSleepSchedule weekdays](self, "weekdays");
    if (v6 != objc_msgSend(v5, "weekdays"))
      goto LABEL_20;
    -[HKSleepSchedule wakeTimeComponents](self, "wakeTimeComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "wakeTimeComponents");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      objc_msgSend(v5, "wakeTimeComponents");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
        goto LABEL_19;
      v11 = (void *)v10;
      -[HKSleepSchedule wakeTimeComponents](self, "wakeTimeComponents");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "wakeTimeComponents");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (!v14)
        goto LABEL_20;
    }
    -[HKSleepSchedule bedTimeComponents](self, "bedTimeComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bedTimeComponents");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v16)
    {

    }
    else
    {
      v9 = (void *)v16;
      objc_msgSend(v5, "bedTimeComponents");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
        goto LABEL_19;
      v18 = (void *)v17;
      -[HKSleepSchedule bedTimeComponents](self, "bedTimeComponents");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bedTimeComponents");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqual:", v20);

      if (!v21)
        goto LABEL_20;
    }
    -[HKSleepSchedule overrideDayIndex](self, "overrideDayIndex");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "overrideDayIndex");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v22)
    {

LABEL_24:
      v15 = 1;
      goto LABEL_21;
    }
    v9 = (void *)v22;
    objc_msgSend(v5, "overrideDayIndex");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (void *)v23;
      -[HKSleepSchedule overrideDayIndex](self, "overrideDayIndex");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "overrideDayIndex");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "isEqual:", v26);

      if ((v27 & 1) != 0)
        goto LABEL_24;
LABEL_20:
      v15 = 0;
LABEL_21:

      goto LABEL_22;
    }
LABEL_19:

    goto LABEL_20;
  }
  v15 = 0;
LABEL_22:

  return v15;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (unint64_t)weekdays
{
  return self->_weekdays;
}

- (void)_setWeekdays:(unint64_t)a3
{
  self->_weekdays = a3;
}

- (NSDateComponents)wakeTimeComponents
{
  return self->_wakeTimeComponents;
}

- (void)_setWakeTimeComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSDateComponents)bedTimeComponents
{
  return self->_bedTimeComponents;
}

- (void)_setBedTimeComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)overrideDayIndex
{
  return self->_overrideDayIndex;
}

- (void)_setOverrideDayIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDayIndex, 0);
  objc_storeStrong((id *)&self->_bedTimeComponents, 0);
  objc_storeStrong((id *)&self->_wakeTimeComponents, 0);
}

@end
