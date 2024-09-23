@implementation HKSleepDaySummary

- (HKSleepDaySummary)initWithMorningIndex:(int64_t)a3 dateInterval:(id)a4 calendar:(id)a5 periods:(id)a6 schedules:(id)a7 sleepDurationGoal:(id)a8 creationInterval:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  HKSleepDaySummary *v21;
  HKSleepDaySummary *v22;
  uint64_t v23;
  NSDateInterval *dateInterval;
  uint64_t v25;
  NSCalendar *gregorianCalendar;
  uint64_t v27;
  NSArray *periods;
  uint64_t v29;
  NSArray *schedules;
  uint64_t v31;
  HKQuantity *sleepDurationGoal;
  uint64_t v33;
  NSArray *periodDurations;
  uint64_t v35;
  _HKSleepDaySummaryDurations *totalDurations;
  uint64_t v37;
  NSDateInterval *creationInterval;
  objc_super v40;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v40.receiver = self;
  v40.super_class = (Class)HKSleepDaySummary;
  v21 = -[HKSleepDaySummary init](&v40, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_morningIndex = a3;
    v23 = objc_msgSend(v15, "copy");
    dateInterval = v22->_dateInterval;
    v22->_dateInterval = (NSDateInterval *)v23;

    v25 = objc_msgSend(v16, "copy");
    gregorianCalendar = v22->_gregorianCalendar;
    v22->_gregorianCalendar = (NSCalendar *)v25;

    v27 = objc_msgSend(v17, "copy");
    periods = v22->_periods;
    v22->_periods = (NSArray *)v27;

    v29 = objc_msgSend(v18, "copy");
    schedules = v22->_schedules;
    v22->_schedules = (NSArray *)v29;

    v31 = objc_msgSend(v19, "copy");
    sleepDurationGoal = v22->_sleepDurationGoal;
    v22->_sleepDurationGoal = (HKQuantity *)v31;

    -[HKSleepDaySummary _computePeriodDurationsForPeriods:dateInterval:](v22, "_computePeriodDurationsForPeriods:dateInterval:", v17, v15);
    v33 = objc_claimAutoreleasedReturnValue();
    periodDurations = v22->_periodDurations;
    v22->_periodDurations = (NSArray *)v33;

    -[HKSleepDaySummary _computeTotalDurationsFromPeriodDurations:](v22, "_computeTotalDurationsFromPeriodDurations:", v22->_periodDurations);
    v35 = objc_claimAutoreleasedReturnValue();
    totalDurations = v22->_totalDurations;
    v22->_totalDurations = (_HKSleepDaySummaryDurations *)v35;

    v37 = objc_msgSend(v20, "copy");
    creationInterval = v22->_creationInterval;
    v22->_creationInterval = (NSDateInterval *)v37;

  }
  return v22;
}

+ (id)daySummaryWithMorningIndex:(int64_t)a3 dateInterval:(id)a4 calendar:(id)a5 periods:(id)a6 schedules:(id)a7 sleepDurationGoal:(id)a8 creationInterval:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  HKSleepDaySummary *v21;

  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = -[HKSleepDaySummary initWithMorningIndex:dateInterval:calendar:periods:schedules:sleepDurationGoal:creationInterval:]([HKSleepDaySummary alloc], "initWithMorningIndex:dateInterval:calendar:periods:schedules:sleepDurationGoal:creationInterval:", a3, v20, v19, v18, v17, v16, v15);

  return v21;
}

+ (id)emptyDaySummaryWithMorningIndex:(int64_t)a3 dateInterval:(id)a4 calendar:(id)a5
{
  return (id)objc_msgSend(a1, "daySummaryWithMorningIndex:dateInterval:calendar:periods:schedules:sleepDurationGoal:creationInterval:", a3, a4, a5, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0, 0);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_morningIndex);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval startDate](self->_dateInterval, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval endDate](self->_dateInterval, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ (%@ - %@), goal = %@, schedules = %@, periods = %@, calendar = %@>"), v5, self, v6, v7, v8, self->_sleepDurationGoal, self->_schedules, self->_periods, self->_gregorianCalendar);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSString)hk_redactedDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_morningIndex);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval startDate](self->_dateInterval, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval endDate](self->_dateInterval, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ (%@ - %@)>"), v5, self, v6, v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSCalendar)calendar
{
  return self->_gregorianCalendar;
}

- (double)inBedDuration
{
  void *v2;
  double v3;
  double v4;

  -[HKSleepDaySummary totalDurations](self, "totalDurations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inBedDuration");
  v4 = v3;

  return v4;
}

- (double)sleepDuration
{
  void *v2;
  double v3;
  double v4;

  -[HKSleepDaySummary totalDurations](self, "totalDurations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sleepDuration");
  v4 = v3;

  return v4;
}

- (double)unspecifiedSleepDuration
{
  void *v2;
  double v3;
  double v4;

  -[HKSleepDaySummary totalDurations](self, "totalDurations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unspecifiedSleepDuration");
  v4 = v3;

  return v4;
}

- (double)coreSleepDuration
{
  void *v2;
  double v3;
  double v4;

  -[HKSleepDaySummary totalDurations](self, "totalDurations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coreSleepDuration");
  v4 = v3;

  return v4;
}

- (double)deepSleepDuration
{
  void *v2;
  double v3;
  double v4;

  -[HKSleepDaySummary totalDurations](self, "totalDurations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deepSleepDuration");
  v4 = v3;

  return v4;
}

- (double)remSleepDuration
{
  void *v2;
  double v3;
  double v4;

  -[HKSleepDaySummary totalDurations](self, "totalDurations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remSleepDuration");
  v4 = v3;

  return v4;
}

- (double)awakeDuration
{
  void *v2;
  double v3;
  double v4;

  -[HKSleepDaySummary totalDurations](self, "totalDurations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "awakeDuration");
  v4 = v3;

  return v4;
}

- (id)_computePeriodDurationsForPeriods:(id)a3 dateInterval:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__HKSleepDaySummary__computePeriodDurationsForPeriods_dateInterval___block_invoke;
  v9[3] = &unk_1E37EE3D0;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "hk_map:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __68__HKSleepDaySummary__computePeriodDurationsForPeriods_dateInterval___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[_HKSleepDaySummaryDurations durationsFromSleepPeriod:dateInterval:](_HKSleepDaySummaryDurations, "durationsFromSleepPeriod:dateInterval:", a2, *(_QWORD *)(a1 + 32));
}

- (id)_computeTotalDurationsFromPeriodDurations:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (v6)
        {
          objc_msgSend(v6, "durationsByAdding:", v9);
          v10 = objc_claimAutoreleasedReturnValue();

          v6 = (id)v10;
        }
        else
        {
          v6 = v9;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (HKSleepPeriod)lastSleepPeriod
{
  void *v2;
  void *v3;

  -[HKSleepDaySummary periods](self, "periods");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKSleepPeriod *)v3;
}

- (HKSleepPeriod)primarySleepPeriod
{
  void *v3;
  void *v4;
  unint64_t v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;

  -[HKSleepDaySummary periodDurations](self, "periodDurations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
    v4 = 0;
    v6 = 0.0;
    do
    {
      -[HKSleepDaySummary periodDurations](self, "periodDurations");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "maxDuration");
      v10 = v9;

      if (v10 > v6)
      {
        -[HKSleepDaySummary periods](self, "periods");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", v5);
        v12 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v12;
        v6 = v10;
      }
      ++v5;
      -[HKSleepDaySummary periodDurations](self, "periodDurations");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

    }
    while (v5 < v14);
  }
  return (HKSleepPeriod *)v4;
}

- (HKSleepSchedule)primarySchedule
{
  NSArray *schedules;
  _QWORD v4[5];

  schedules = self->_schedules;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__HKSleepDaySummary_primarySchedule__block_invoke;
  v4[3] = &unk_1E37EE3F8;
  v4[4] = self;
  -[NSArray hk_firstObjectWithMaximumValueUsingEvaluationBlock:](schedules, "hk_firstObjectWithMaximumValueUsingEvaluationBlock:", v4);
  return (HKSleepSchedule *)(id)objc_claimAutoreleasedReturnValue();
}

double __36__HKSleepDaySummary_primarySchedule__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(a2, "bedtimeDateIntervalForMorningIndex:calendar:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intersectionWithDateInterval:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "duration");
  v6 = v5;

  return v6;
}

- (BOOL)containsPeriodsWithAppleSleepTrackingData
{
  return -[NSArray hk_containsObjectPassingTest:](self->_periods, "hk_containsObjectPassingTest:", &__block_literal_global_48);
}

uint64_t __62__HKSleepDaySummary_containsPeriodsWithAppleSleepTrackingData__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsSegmentsWithAppleSleepTrackingData");
}

- (BOOL)hasSleepStageData
{
  double v3;
  double v4;
  double v6;

  -[HKSleepDaySummary coreSleepDuration](self, "coreSleepDuration");
  if (v3 > 0.0)
    return 1;
  -[HKSleepDaySummary deepSleepDuration](self, "deepSleepDuration");
  if (v4 > 0.0)
    return 1;
  -[HKSleepDaySummary remSleepDuration](self, "remSleepDuration");
  return v6 > 0.0;
}

- (BOOL)isWeeklyAggregatedSummary
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3588];
  v4 = -[HKSleepDaySummary morningIndex](self, "morningIndex");
  -[HKSleepDaySummary calendar](self, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_sleepWeekIntervalForMorningIndex:calendar:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSleepDaySummary dateInterval](self, "dateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "isEqual:", v7);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t morningIndex;
  id v5;

  morningIndex = self->_morningIndex;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", morningIndex, CFSTR("MorningIndex"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateInterval, CFSTR("DateInterval"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_gregorianCalendar, CFSTR("Calendar"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_periods, CFSTR("Periods"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_schedules, CFSTR("Schedules"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sleepDurationGoal, CFSTR("SleepDurationGoal"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationInterval, CFSTR("CreationInterval"));

}

- (HKSleepDaySummary)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HKSleepDaySummary *v15;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MorningIndex"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DateInterval"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Calendar"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("Periods"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E60];
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("Schedules"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SleepDurationGoal"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CreationInterval"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[HKSleepDaySummary initWithMorningIndex:dateInterval:calendar:periods:schedules:sleepDurationGoal:creationInterval:](self, "initWithMorningIndex:dateInterval:calendar:periods:schedules:sleepDurationGoal:creationInterval:", v5, v19, v17, v8, v12, v13, v14);
  return v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  void *v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  int64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;

  v6 = a3;
  -[HKSleepDaySummary schedules](self, "schedules");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  objc_msgSend(v6, "schedules");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v8 == v10)
  {
    -[HKSleepDaySummary schedules](self, "schedules");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      v13 = 0;
      do
      {
        -[HKSleepDaySummary schedules](self, "schedules");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "schedules");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v15, "isEquivalent:", v17);

        if ((v3 & 1) == 0)
          goto LABEL_11;
        ++v13;
        -[HKSleepDaySummary schedules](self, "schedules");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

      }
      while (v13 < v19);
    }
    v20 = -[HKSleepDaySummary morningIndex](self, "morningIndex");
    if (v20 == objc_msgSend(v6, "morningIndex"))
    {
      -[HKSleepDaySummary dateInterval](self, "dateInterval");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dateInterval");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21 != v22)
      {
        objc_msgSend(v6, "dateInterval");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v65)
        {
          v24 = 0;
          goto LABEL_62;
        }
        -[HKSleepDaySummary dateInterval](self, "dateInterval");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dateInterval");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v23, "isEqual:"))
        {
          v24 = 0;
LABEL_61:

          goto LABEL_62;
        }
        v63 = v23;
      }
      -[HKSleepDaySummary calendar](self, "calendar");
      v26 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "calendar");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = (void *)v26;
      if ((void *)v26 != v27)
      {
        objc_msgSend(v6, "calendar");
        v28 = objc_claimAutoreleasedReturnValue();
        if (!v28)
        {
LABEL_37:

LABEL_38:
          v24 = 0;
          goto LABEL_60;
        }
        v60 = (void *)v28;
        -[HKSleepDaySummary calendar](self, "calendar");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "calendar");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v4, "isEqual:", v29) & 1) == 0)
        {

LABEL_36:
          goto LABEL_37;
        }
        v58 = v29;
      }
      -[HKSleepDaySummary periods](self, "periods");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "periods");
      v61 = v30;
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30 == v62)
        goto LABEL_23;
      objc_msgSend(v6, "periods");
      v31 = objc_claimAutoreleasedReturnValue();
      if (!v31)
      {
        v59 = v4;
        v24 = 0;
        v36 = v58;
        v37 = v61;
        goto LABEL_55;
      }
      v56 = (void *)v31;
      -[HKSleepDaySummary periods](self, "periods");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "periods");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v30, "isEqual:", v32) & 1) != 0)
      {
        v53 = v32;
LABEL_23:
        -[HKSleepDaySummary sleepDurationGoal](self, "sleepDurationGoal");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "sleepDurationGoal");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v4;
        if (v33 == v57)
        {
          v54 = v33;
          v55 = v30;
        }
        else
        {
          objc_msgSend(v6, "sleepDurationGoal");
          v34 = objc_claimAutoreleasedReturnValue();
          if (!v34)
          {
            v24 = 0;
            v45 = v58;
            v46 = v61;
            goto LABEL_42;
          }
          v52 = (void *)v34;
          -[HKSleepDaySummary sleepDurationGoal](self, "sleepDurationGoal");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "sleepDurationGoal");
          v3 = objc_claimAutoreleasedReturnValue();
          v55 = v30;
          if ((objc_msgSend(v35, "isEqual:", v3) & 1) == 0)
          {

            v24 = 0;
LABEL_53:
            v37 = v61;
            v49 = v62;
            v36 = v58;
            if (v61 == v62)
              goto LABEL_56;

LABEL_55:
            v49 = v62;
LABEL_56:

            if (v66 != v27)
            {

              goto LABEL_58;
            }
            goto LABEL_59;
          }
          v50 = v35;
          v54 = v33;
        }
        -[HKSleepDaySummary creationInterval](self, "creationInterval");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "creationInterval");
        v39 = objc_claimAutoreleasedReturnValue();
        v24 = v38 == (void *)v39;
        if (v38 == (void *)v39)
        {

          v33 = v54;
          v47 = v57;
          if (v54 == v57)
            goto LABEL_48;
        }
        else
        {
          v40 = (void *)v39;
          v51 = (void *)v3;
          objc_msgSend(v6, "creationInterval");
          v41 = objc_claimAutoreleasedReturnValue();
          if (v41)
          {
            v42 = (void *)v41;
            -[HKSleepDaySummary creationInterval](self, "creationInterval");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "creationInterval");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v43, "isEqual:", v44);

            if (v54 == v57)
            {

            }
            else
            {

            }
            goto LABEL_53;
          }

          v33 = v54;
          v47 = v57;
          if (v54 == v57)
          {
LABEL_48:

            v46 = v61;
            v48 = v62;
            v45 = v58;
            v30 = v55;
            if (v61 == v62)
            {
LABEL_44:

              if (v66 != v27)
              {

LABEL_58:
              }
LABEL_59:

LABEL_60:
              v23 = v63;
              if (v21 != v22)
                goto LABEL_61;
LABEL_62:

              goto LABEL_12;
            }
LABEL_43:

            goto LABEL_44;
          }
        }

        v45 = v58;
        v46 = v61;
        v30 = v55;
LABEL_42:

        v48 = v62;
        if (v46 == v62)
          goto LABEL_44;
        goto LABEL_43;
      }

      if (v66 == v27)
      {

        goto LABEL_38;
      }

      goto LABEL_36;
    }
  }
LABEL_11:
  v24 = 0;
LABEL_12:

  return v24;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;

  v3 = -[HKSleepDaySummary morningIndex](self, "morningIndex");
  -[HKSleepDaySummary dateInterval](self, "dateInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[HKSleepDaySummary calendar](self, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[HKSleepDaySummary periods](self, "periods");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  -[HKSleepDaySummary schedules](self, "schedules");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  -[HKSleepDaySummary sleepDurationGoal](self, "sleepDurationGoal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hk_secondsNumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v9 ^ v11 ^ objc_msgSend(v13, "hash");
  -[HKSleepDaySummary creationInterval](self, "creationInterval");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash");

  return v16;
}

- (BOOL)getData:(id *)a3 error:(id *)a4
{
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v13;

  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (v7)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v7);
  }
  else
  {
    _HKInitializeLogging();
    v9 = (void *)HKLogSleep;
    if (os_log_type_enabled((os_log_t)HKLogSleep, OS_LOG_TYPE_ERROR))
      -[HKSleepDaySummary getData:error:].cold.1(v9, (uint64_t)self, (uint64_t)v8);
    v10 = v8;
    v11 = v10;
    if (v10)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v10);
      else
        _HKLogDroppedError(v10);
    }

  }
  return v7 != 0;
}

- (int64_t)bucketIndexForIntervalComponents:(id)a3 anchorDate:(id)a4
{
  return self->_morningIndex;
}

- (id)summaryFilteredToPrimaryPeriod
{
  void *v3;
  void *v4;

  -[HKSleepDaySummary primarySleepPeriod](self, "primarySleepPeriod");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSleepDaySummary _filterToPeriod:](self, "_filterToPeriod:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)summaryFilteredToLastPeriod
{
  void *v3;
  void *v4;

  -[HKSleepDaySummary lastSleepPeriod](self, "lastSleepPeriod");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSleepDaySummary _filterToPeriod:](self, "_filterToPeriod:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_filterToPeriod:(id)a3
{
  id v4;
  HKSleepDaySummary *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HKSleepDaySummary *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v4 = a3;
  v5 = [HKSleepDaySummary alloc];
  v6 = -[HKSleepDaySummary morningIndex](self, "morningIndex");
  -[HKSleepDaySummary dateInterval](self, "dateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSleepDaySummary calendar](self, "calendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSleepDaySummary schedules](self, "schedules");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSleepDaySummary sleepDurationGoal](self, "sleepDurationGoal");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSleepDaySummary creationInterval](self, "creationInterval");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HKSleepDaySummary initWithMorningIndex:dateInterval:calendar:periods:schedules:sleepDurationGoal:creationInterval:](v5, "initWithMorningIndex:dateInterval:calendar:periods:schedules:sleepDurationGoal:creationInterval:", v6, v7, v8, v9, v10, v11, v12);

  return v13;
}

- (int64_t)morningIndex
{
  return self->_morningIndex;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (NSArray)periods
{
  return self->_periods;
}

- (NSArray)schedules
{
  return self->_schedules;
}

- (HKQuantity)sleepDurationGoal
{
  return self->_sleepDurationGoal;
}

- (NSDateInterval)creationInterval
{
  return self->_creationInterval;
}

- (NSCalendar)gregorianCalendar
{
  return self->_gregorianCalendar;
}

- (NSArray)periodDurations
{
  return self->_periodDurations;
}

- (_HKSleepDaySummaryDurations)totalDurations
{
  return self->_totalDurations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalDurations, 0);
  objc_storeStrong((id *)&self->_periodDurations, 0);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_creationInterval, 0);
  objc_storeStrong((id *)&self->_sleepDurationGoal, 0);
  objc_storeStrong((id *)&self->_schedules, 0);
  objc_storeStrong((id *)&self->_periods, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

- (void)getData:(uint64_t)a3 error:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v7 = 138543874;
  v8 = (id)objc_opt_class();
  v9 = 2114;
  v10 = a2;
  v11 = 2114;
  v12 = a3;
  v6 = v8;
  _os_log_error_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Error archiving summary %{public}@ for caching: %{public}@", (uint8_t *)&v7, 0x20u);

}

@end
