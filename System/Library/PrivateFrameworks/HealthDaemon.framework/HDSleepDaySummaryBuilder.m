@implementation HDSleepDaySummaryBuilder

- (HDSleepDaySummaryBuilder)initWithProfile:(id)a3 dayIndexRange:(id)a4 weekday:(unint64_t)a5 options:(unint64_t)a6 gregorianCalendar:(id)a7 sourceOrderProvider:(id)a8
{
  int64_t var1;
  int64_t var0;
  id v14;
  id v15;
  id v16;
  HDSleepDaySummaryBuilder *v17;
  HDSleepDaySummaryBuilder *v18;
  uint64_t v19;
  NSDateInterval *dateInterval;
  NSMutableArray *v21;
  NSMutableArray *sleepAnalysisSamples;
  NSMutableArray *v23;
  NSMutableArray *sleepScheduleSamples;
  NSMutableArray *v25;
  NSMutableArray *sleepDurationGoalSamples;
  objc_super v28;

  var1 = a4.var1;
  var0 = a4.var0;
  v14 = a3;
  v15 = a7;
  v16 = a8;
  v28.receiver = self;
  v28.super_class = (Class)HDSleepDaySummaryBuilder;
  v17 = -[HDSleepDaySummaryBuilder init](&v28, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_profile, v14);
    objc_storeWeak((id *)&v18->_sourceOrderProvider, v16);
    v18->_dayIndexRange.start = var0;
    v18->_dayIndexRange.duration = var1;
    objc_msgSend((id)objc_opt_class(), "dateIntervalForDayIndexRange:gregorianCalendar:", var0, var1, v15);
    v19 = objc_claimAutoreleasedReturnValue();
    dateInterval = v18->_dateInterval;
    v18->_dateInterval = (NSDateInterval *)v19;

    v18->_weekday = a5;
    objc_storeStrong((id *)&v18->_gregorianCalendar, a7);
    v18->_options = a6;
    v18->_containsAsleepOrInBedData = 0;
    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    sleepAnalysisSamples = v18->_sleepAnalysisSamples;
    v18->_sleepAnalysisSamples = v21;

    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    sleepScheduleSamples = v18->_sleepScheduleSamples;
    v18->_sleepScheduleSamples = v23;

    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    sleepDurationGoalSamples = v18->_sleepDurationGoalSamples;
    v18->_sleepDurationGoalSamples = v25;

  }
  return v18;
}

- (HDSleepDaySummaryBuilder)initWithProfile:(id)a3 morningIndex:(int64_t)a4 weekday:(unint64_t)a5 options:(unint64_t)a6 gregorianCalendar:(id)a7 sourceOrderProvider:(id)a8
{
  return -[HDSleepDaySummaryBuilder initWithProfile:dayIndexRange:weekday:options:gregorianCalendar:sourceOrderProvider:](self, "initWithProfile:dayIndexRange:weekday:options:gregorianCalendar:sourceOrderProvider:", a3, a4, 1, a5, a6, a7, a8);
}

- (int64_t)morningIndex
{
  return self->_dayIndexRange.start;
}

- (int64_t)numberOfDays
{
  return self->_dayIndexRange.duration;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (NSCalendar)calendar
{
  return self->_gregorianCalendar;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)addOrderedSample:(id)a3
{
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSMutableArray *sleepScheduleSamples;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "sampleType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "code");

  switch(v6)
  {
    case 198:
      v7 = v10;
      if ((-[NSMutableArray containsObject:](self->_sleepScheduleSamples, "containsObject:", v7) & 1) != 0)
        break;
      sleepScheduleSamples = self->_sleepScheduleSamples;
LABEL_11:
      -[NSMutableArray addObject:](sleepScheduleSamples, "addObject:", v7);
      break;
    case 197:
      v7 = v10;
      if ((-[NSMutableArray containsObject:](self->_sleepDurationGoalSamples, "containsObject:", v7) & 1) != 0)
        break;
      sleepScheduleSamples = self->_sleepDurationGoalSamples;
      goto LABEL_11;
    case 63:
      v7 = v10;
      -[NSMutableArray addObject:](self->_sleepAnalysisSamples, "addObject:", v7);
      v8 = objc_msgSend(v7, "value");
      if (!self->_containsAsleepOrInBedData && v8 != 2)
        self->_containsAsleepOrInBedData = 1;
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSleepDaySummaryBuilder.m"), 125, CFSTR("%@: Invalid data type"), objc_opt_class());
      break;
  }

}

+ (id)dateIntervalForDayIndexRange:(id)a3 gregorianCalendar:(id)a4
{
  int64_t var1;
  int64_t var0;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  var1 = a3.var1;
  var0 = a3.var0;
  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a4;
  objc_msgSend(v6, "hk_sleepDayStartForMorningIndex:calendar:", var0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "hk_sleepDayStartForMorningIndex:calendar:", var0 + var1, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v8, v9);
  return v10;
}

- (id)sleepAnalysisSamples
{
  return self->_sleepAnalysisSamples;
}

- (id)sleepScheduleSamples
{
  return self->_sleepScheduleSamples;
}

- (id)sleepDurationGoalSamples
{
  return self->_sleepDurationGoalSamples;
}

- (BOOL)scheduleAppliesToWeekday:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (objc_msgSend(v4, "weekdays"))
    v5 = (self->_weekday & objc_msgSend(v4, "weekdays")) != 0;
  else
    v5 = 1;

  return v5;
}

- (id)applicableSleepSchedules
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  HDSleepDaySummaryBuilder *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v33;
  id v34;
  void *v35;
  HDSleepDaySummaryBuilder *v36;
  void *v37;
  int64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  id obj;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  -[HDSleepDaySummaryBuilder sleepScheduleSamples](self, "sleepScheduleSamples");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[HDSleepDaySummaryBuilder morningIndex](self, "morningIndex");
  -[HDSleepDaySummaryBuilder calendar](self, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSleepDaySummaryBuilder dateInterval](self, "dateInterval");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0CB65B0]);
  v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "hk_mapToSet:", &__block_literal_global_100);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_alloc_init(MEMORY[0x1E0CB6360]);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v33 = v3;
  v6 = v3;
  v7 = self;
  v8 = v5;
  objc_msgSend(v6, "reverseObjectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v45;
    v43 = v8;
    v36 = v7;
    v39 = *(_QWORD *)v45;
    do
    {
      v12 = 0;
      v41 = v10;
      do
      {
        if (*(_QWORD *)v45 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v12);
        if (-[HDSleepDaySummaryBuilder scheduleAppliesToWeekday:](v7, "scheduleAppliesToWeekday:", v13))
        {
          v14 = (void *)MEMORY[0x1E0C99E80];
          objc_msgSend(v13, "_timeZoneName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "timeZoneWithName:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v40, "calendarForTimeZone:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "weekdays"))
          {
            objc_msgSend(v13, "wakeDateComponentsForMorningIndex:calendar:", v38, v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "date");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "startDate");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "hk_isBeforeDate:", v19);

            if (v21)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v18, "hk_dayIndex"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v35, "containsObject:", v22);

              v8 = v43;
              if ((v23 & 1) != 0)
                goto LABEL_23;
LABEL_12:
              objc_msgSend(v13, "_timeZoneName");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = v4;
              objc_msgSend(v4, "timeZone");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "name");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v24, "isEqualToString:", v27);

              if (v28 && v19)
              {
                v4 = v25;
                objc_msgSend(v13, "bedtimeDateIntervalForWakeTime:calendar:", v19, v25);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v8 = v43;
              }
              else
              {
                v29 = v38;
                v8 = v43;
                if (!objc_msgSend(v13, "weekdays"))
                {
                  objc_msgSend(v13, "overrideDayIndex");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v29 = objc_msgSend(v30, "integerValue");

                  v8 = v43;
                }
                v4 = v25;
                objc_msgSend(v13, "bedtimeDateIntervalForMorningIndex:calendar:", v29, v25);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v7 = v36;
              if (objc_msgSend(v18, "intersectsDateInterval:", v37)
                && (objc_msgSend(v8, "hasOverlapWithInterval:", v18) & 1) == 0)
              {
                objc_msgSend(v8, "insertInterval:", v18);
                objc_msgSend(v34, "addObject:", v13);
              }
            }
            else
            {
              v8 = v43;
            }

LABEL_23:
            v11 = v39;
            v10 = v41;
            goto LABEL_24;
          }
          v19 = 0;
          goto LABEL_12;
        }
LABEL_24:
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v10);
  }

  v31 = (void *)objc_msgSend(v34, "copy");
  return v31;
}

id __52__HDSleepDaySummaryBuilder_applicableSleepSchedules__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "weekdays"))
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "wakeTimeComponents");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(v2, "overrideDayIndex");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v3;
}

uint64_t __57__HDSleepDaySummaryBuilder__creationIntervalFromSamples___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "_creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)createDaySummary
{
  HDSleepDaySummaryBuilder *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  HDSleepPeriodSegmentArrayBuilder *v7;
  id WeakRetained;
  uint64_t v9;
  NSCalendar *gregorianCalendar;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  BOOL v25;
  void *v26;
  HDSleepPeriodInfo *v27;
  void *v28;
  HDSleepPeriodInfo *v29;
  HDSleepPeriodArrayBuilder *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  HDSleepDaySummaryBuilder *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v56;
  void *v57;
  HDSleepDaySummaryBuilder *v58;
  id v59;
  id v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint64_t v67;

  v2 = self;
  v67 = *MEMORY[0x1E0C80C00];
  -[HDSleepDaySummaryBuilder sleepAnalysisSamples](self, "sleepAnalysisSamples");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (v2->_containsAsleepOrInBedData)
    {
      v59 = v3;
      v5 = v3;
      v6 = v2->_options & 1;
      v7 = [HDSleepPeriodSegmentArrayBuilder alloc];
      WeakRetained = objc_loadWeakRetained((id *)&v2->_profile);
      v9 = -[HDSleepDaySummaryBuilder morningIndex](v2, "morningIndex");
      gregorianCalendar = v2->_gregorianCalendar;
      v11 = objc_loadWeakRetained((id *)&v2->_sourceOrderProvider);
      v12 = -[HDSleepPeriodSegmentArrayBuilder initProfile:morningIndex:options:gregorianCalendar:sourceOrderProvider:](v7, "initProfile:morningIndex:options:gregorianCalendar:sourceOrderProvider:", WeakRetained, v9, v6, gregorianCalendar, v11);

      objc_msgSend(v12, "sortedSleepPeriodSegmentsFromSamples:", v5);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      v58 = v2;
      v56 = v2->_options & 1;
      v13 = v5;
      v60 = objc_alloc_init(MEMORY[0x1E0CB65B0]);
      objc_msgSend(v60, "setMergeIntervals:", 1);
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v63;
        v18 = *MEMORY[0x1E0CB7340];
        v19 = *MEMORY[0x1E0CB7348];
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v63 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * i), "metadata");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:", v18);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:", v19);
            v23 = objc_claimAutoreleasedReturnValue();
            v24 = (void *)v23;
            if (v22)
              v25 = v23 == 0;
            else
              v25 = 1;
            if (!v25 && objc_msgSend(v22, "compare:", v23) == -1)
            {
              v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v22, v24);
              objc_msgSend(v60, "insertInterval:", v26);

            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
        }
        while (v16);
      }

      v27 = [HDSleepPeriodInfo alloc];
      objc_msgSend(v60, "mergedIntervals");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[HDSleepPeriodInfo initWithUserSetSchedules:](v27, "initWithUserSetSchedules:", v28);

      v30 = -[HDSleepPeriodArrayBuilder initWithInfo:options:]([HDSleepPeriodArrayBuilder alloc], "initWithInfo:options:", v29, v56);
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v31 = v57;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
      v2 = v58;
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v63;
        do
        {
          for (j = 0; j != v33; ++j)
          {
            if (*(_QWORD *)v63 != v34)
              objc_enumerationMutation(v31);
            -[HDSleepPeriodArrayBuilder addOrderedSegment:](v30, "addOrderedSegment:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j));
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
        }
        while (v33);
      }

      -[HDSleepPeriodArrayBuilder finish](v30, "finish");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v59;
    }
    else
    {
      v36 = (void *)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    v36 = 0;
  }

  -[HDSleepDaySummaryBuilder applicableSleepSchedules](v2, "applicableSleepSchedules");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v52 = v4;
    v40 = 0;
    goto LABEL_30;
  }
  -[HDSleepDaySummaryBuilder sleepDurationGoalSamples](v2, "sleepDurationGoalSamples");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "lastObject");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "quantity");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = v4;
  if (!objc_msgSend(v41, "count"))
  {
LABEL_30:
    v51 = 0;
    goto LABEL_31;
  }
  objc_msgSend(v41, "sortedArrayUsingComparator:", &__block_literal_global_199_0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v42, "firstObject");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "_creationDate");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "lastObject");
  v61 = v37;
  v46 = v2;
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "_creationDate");
  v48 = v40;
  v49 = v36;
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)objc_msgSend(v43, "initWithStartDate:endDate:", v45, v50);

  v36 = v49;
  v40 = v48;

  v2 = v46;
  v37 = v61;

LABEL_31:
  objc_msgSend(MEMORY[0x1E0CB6BE0], "daySummaryWithMorningIndex:dateInterval:calendar:periods:schedules:sleepDurationGoal:creationInterval:", -[HDSleepDaySummaryBuilder morningIndex](v2, "morningIndex"), v2->_dateInterval, v2->_gregorianCalendar, v36, v37, v40, v51);
  v53 = v4;
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  return v54;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepDurationGoalSamples, 0);
  objc_storeStrong((id *)&self->_sleepScheduleSamples, 0);
  objc_storeStrong((id *)&self->_sleepAnalysisSamples, 0);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_destroyWeak((id *)&self->_sourceOrderProvider);
  objc_destroyWeak((id *)&self->_profile);
}

@end
