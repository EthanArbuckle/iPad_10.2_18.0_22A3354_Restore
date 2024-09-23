@implementation NSDateInterval(Schedule)

+ (id)dnds_dateIntervalForScheduleSettings:()Schedule date:calendar:
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "scheduleEnabledSetting");
  v10 = DNDResolvedScheduleEnabledSetting();
  objc_msgSend(v7, "timePeriod");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "weekdays");
  v13 = 0;
  if (v10 == 2)
  {
    v14 = v12;
    if (v12 != *MEMORY[0x1E0D1D558])
    {
      objc_msgSend(v9, "component:fromDate:", 512, v8);
      v27 = 0;
      v28 = &v27;
      v29 = 0x3032000000;
      v30 = __Block_byref_object_copy__0;
      v31 = __Block_byref_object_dispose__0;
      v32 = 0;
      v21 = 0;
      v22 = &v21;
      v23 = 0x3032000000;
      v24 = __Block_byref_object_copy__0;
      v25 = __Block_byref_object_dispose__0;
      v26 = 0;
      v17 = MEMORY[0x1E0C809B0];
      v18 = v11;
      v19 = v9;
      v20 = v8;
      DNDEnumerateDaysOfWeekStartingOnDay();
      if (v28[5] && v22[5])
      {
        v15 = objc_alloc(MEMORY[0x1E0CB3588]);
        v13 = (void *)objc_msgSend(v15, "initWithStartDate:endDate:", v28[5], v22[5], v17, 3221225472, __79__NSDateInterval_Schedule__dnds_dateIntervalForScheduleSettings_date_calendar___block_invoke, &unk_1E86A5B10, v18, v19, v20, &v27, &v21, v14);
      }
      else
      {
        v13 = 0;
      }

      _Block_object_dispose(&v21, 8);
      _Block_object_dispose(&v27, 8);

    }
  }

  return v13;
}

+ (id)dnds_dateIntervalUntilEndOfScheduleForScheduleSettings:()Schedule startDate:calendar:
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "scheduleEnabledSetting");
  v10 = DNDResolvedScheduleEnabledSetting();
  objc_msgSend(v7, "timePeriod");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "weekdays");
  v13 = 0;
  if (v10 == 2 && v12 != *MEMORY[0x1E0D1D558])
  {
    objc_msgSend(v9, "component:fromDate:", 512, v8);
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__0;
    v24 = __Block_byref_object_dispose__0;
    v25 = 0;
    v17 = v11;
    v18 = v9;
    v14 = v8;
    v19 = v14;
    DNDEnumerateDaysOfWeekStartingOnDay();
    if (v21[5])
    {
      v15 = objc_alloc(MEMORY[0x1E0CB3588]);
      v13 = (void *)objc_msgSend(v15, "initWithStartDate:endDate:", v14, v21[5]);
    }
    else
    {
      v13 = 0;
    }

    _Block_object_dispose(&v20, 8);
  }

  return v13;
}

@end
