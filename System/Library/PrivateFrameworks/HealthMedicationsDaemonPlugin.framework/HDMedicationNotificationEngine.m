@implementation HDMedicationNotificationEngine

- (HDMedicationNotificationEngine)init
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

+ (id)generateForSchedules:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        +[HDMedicationNotificationEngine _generateForSchedule:configuration:error:]((uint64_t)a1, *(void **)(*((_QWORD *)&v23 + 1) + 8 * v14), v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObjectsFromArray:", v15, (_QWORD)v23);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
    }
    while (v12);
  }

  +[HDMedicationNotificationEngine _timeBatchItems:]((uint64_t)a1, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  HKLogMedication();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v28 = a1;
    v29 = 2114;
    v30 = v18;
    v31 = 2114;
    v32 = v19;
    v33 = 2114;
    v34 = v20;
    v35 = 2114;
    v36 = v21;
    _os_log_impl(&dword_1B815E000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Generated %{public}@ time batched schedule items: %{public}@, for %{public}@ schedules: %{public}@", buf, 0x34u);

  }
  return v16;
}

+ (id)_generateForSchedule:(uint64_t)a1 configuration:(void *)a2 error:(void *)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createdUTCOffset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimeZone:", v8);

  +[HDMedicationNotificationEngine _getStartGenerationDateForSchedule:configuration:calendar:]((uint64_t)HDMedicationNotificationEngine, v4, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[HDMedicationNotificationEngine _calculateTotalDaysForSchedule:configuration:calendar:startGenerationDate:]((uint64_t)HDMedicationNotificationEngine, v4, v5, v7, v9);
  v11 = v9;
  v12 = v11;
  v13 = v11;
  if (v10 >= 1)
  {
    v14 = v11;
    do
    {
      v15 = (void *)MEMORY[0x1BCCAD8D8]();
      +[HDMedicationNotificationEngine _generateScheduleItemsAtDate:withSchedule:startGenerationDate:calendar:]((uint64_t)HDMedicationNotificationEngine, v14, v4, v12, v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v16);

      +[HDMedicationNotificationEngine _calculateNextGenerationDateFromGenerationDate:calendar:]((uint64_t)HDMedicationNotificationEngine, v14, v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v15);
      v14 = v13;
      --v10;
    }
    while (v10);
  }

  return v6;
}

+ (id)_timeBatchItems:(uint64_t)a1
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v10 = objc_msgSend(v3, "indexOfObject:", v9, (_QWORD)v21);
        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v3, "addObject:", v9);
        }
        else
        {
          v11 = v10;
          objc_msgSend(v3, "objectAtIndexedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "doses");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v13, "mutableCopy");

          objc_msgSend(v9, "doses");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObjectsFromArray:", v15);

          v16 = objc_alloc(MEMORY[0x1E0D2C4A8]);
          objc_msgSend(v12, "scheduledDateTime");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v16, "initWithScheduledDateTime:notificationSent:doses:", v17, objc_msgSend(v12, "notificationSent"), v14);
          objc_msgSend(v3, "setObject:atIndexedSubscript:", v18, v11);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)_getStartGenerationDateForSchedule:(uint64_t)a1 configuration:(void *)a2 calendar:(void *)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  objc_msgSend(v4, "startGenerationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "startDateTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "hk_isAfterOrEqualToDate:", v6))
  {
    v8 = v7;

    v6 = v8;
  }

  return v6;
}

+ (uint64_t)_calculateTotalDaysForSchedule:(void *)a3 configuration:(void *)a4 calendar:(void *)a5 startGenerationDate:
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;

  v8 = a2;
  v9 = a4;
  v10 = a5;
  v11 = a3;
  objc_opt_self();
  objc_msgSend(v11, "endGenerationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "startOfDayForDate:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "endDateTime");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v15, "setDay:", 1);
    objc_msgSend(v8, "endDateTime");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateByAddingComponents:toDate:options:", v15, v16, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startOfDayForDate:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "hk_isAfterOrEqualToDate:", v18))
    {
      v19 = v18;

      v12 = v19;
    }

  }
  objc_msgSend(v9, "components:fromDate:toDate:options:", 16, v13, v12, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "day");

  return v21;
}

+ (id)_generateScheduleItemsAtDate:(void *)a3 withSchedule:(void *)a4 startGenerationDate:(void *)a5 calendar:
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  _BOOL4 v40;
  NSObject *v41;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  id v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v9;
  v13 = v11;
  v14 = objc_opt_self();
  v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_opt_self();
  v50 = v13;
  objc_msgSend(v13, "components:fromDate:", 636, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "weekday");

  objc_msgSend(v12, "timeIntervals");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v12, "frequencyType");
  switch(v18)
  {
    case 0:
    case 4:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", sel__generateScheduleItemsAtDate_withSchedule_startGenerationDate_calendar_, v14, CFSTR("HDMedicationNotificationEngine.m"), 217, CFSTR("frequency type %ld is not a supported schedule type."), v18);

      break;
    case 1:
      objc_msgSend(v12, "timeIntervals");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

      if (v21)
      {
        +[HDMedicationNotificationEngine _generateScheduleItemsAtDate:withMultiphasicSchedule:calendar:startGenerationDate:]((uint64_t)HDMedicationNotificationEngine, v8, v12, v50);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "addObjectsFromArray:", v22);

      }
      break;
    case 2:
      v47 = v14;
      v48 = v17;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v23 = v17;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v51, v69, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v52;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v52 != v26)
              objc_enumerationMutation(v23);
            +[HDMedicationNotificationEngine _makeScheduleItemAtDate:withMonophasicInterval:calendar:schedule:]((uint64_t)HDMedicationNotificationEngine, v8, *(void **)(*((_QWORD *)&v51 + 1) + 8 * i), v50, v12);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "addObject:", v28);

          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v51, v69, 16);
        }
        while (v25);
      }

      goto LABEL_23;
    case 3:
      v46 = v10;
      v47 = v14;
      v29 = v12;
      v30 = v8;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v48 = v17;
      v31 = v17;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v55, v70, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v56;
        do
        {
          for (j = 0; j != v33; ++j)
          {
            if (*(_QWORD *)v56 != v34)
              objc_enumerationMutation(v31);
            v36 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
            v37 = objc_msgSend(v36, "daysOfWeek");
            if ((+[HDMedicationNotificationEngine _optionForWeekday:]((uint64_t)HDMedicationNotificationEngine, v16) & v37) != 0)
            {
              +[HDMedicationNotificationEngine _makeScheduleItemAtDate:withMonophasicInterval:calendar:schedule:]((uint64_t)HDMedicationNotificationEngine, v30, v36, v50, v29);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "addObject:", v38);

            }
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v55, v70, 16);
        }
        while (v33);
      }

      v8 = v30;
      v12 = v29;
      v10 = v46;
LABEL_23:
      v14 = v47;
      v17 = v48;
      break;
    default:
      break;
  }
  _HKInitializeLogging();
  HKLogMedication();
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG);

  if (v40)
  {
    HKLogMedication();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v49, "count"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      HKSensitiveLogItem();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      HKSensitiveLogItem();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v60 = v14;
      v61 = 2114;
      v62 = v43;
      v63 = 2114;
      v64 = v44;
      v65 = 2114;
      v66 = v45;
      v67 = 2114;
      v68 = v8;
      _os_log_debug_impl(&dword_1B815E000, v41, OS_LOG_TYPE_DEBUG, "[%{public}@] Generated %{public}@ schedule items: %{public}@, for schedule: %{public}@, at date: %{public}@", buf, 0x34u);

    }
  }

  return v49;
}

+ (id)_calculateNextGenerationDateFromGenerationDate:(void *)a3 calendar:
{
  id v4;
  id v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v6, "setDay:", 1);
  objc_msgSend(v4, "dateByAddingComponents:toDate:options:", v6, v5, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)_optionForWeekday:(uint64_t)a1
{
  objc_opt_self();
  if ((unint64_t)(a2 - 1) > 6)
    return 0;
  else
    return qword_1B81B3460[a2 - 1];
}

+ (id)_makeScheduleItemAtDate:(void *)a3 withMonophasicInterval:(void *)a4 calendar:(void *)a5 schedule:
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = a2;
  v12 = objc_opt_self();
  +[HDMedicationNotificationEngine _makeScheduleItemAtDate:withMonophasicInterval:calendar:schedule:cyclicIntervalIndex:](v12, v11, v10, v9, v8, -1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_generateScheduleItemsAtDate:(uint64_t)a1 withMultiphasicSchedule:(void *)a2 calendar:(void *)a3 startGenerationDate:(void *)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = a4;
  v9 = objc_opt_self();
  v29 = v8;
  v30 = v6;
  v10 = +[HDMedicationNotificationEngine _indexForGenerationDate:schedule:calendar:](v9, v6, v7, v8);
  v11 = v7;
  objc_msgSend(v7, "timeIntervals");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __116__HDMedicationNotificationEngine__generateScheduleItemsAtDate_withMultiphasicSchedule_calendar_startGenerationDate___block_invoke;
  v35[3] = &__block_descriptor_40_e76___HKMedicationScheduleIntervalData_16__0__HKMedicationScheduleIntervalData_8l;
  v35[4] = v10;
  objc_msgSend(v12, "hk_map:", v35);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v32 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v20, "dose", v29);
        v21 = objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v22 = (void *)v21;
          objc_msgSend(v20, "dose");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "doubleValue");
          v25 = fabs(v24);

          if (v25 < 2.22044605e-16)
            continue;
        }
        +[HDMedicationNotificationEngine _makeScheduleItemAtDate:withMonophasicInterval:calendar:schedule:cyclicIntervalIndex:]((uint64_t)HDMedicationNotificationEngine, v30, v20, v29, v11, v10);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v26);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v17);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v14);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (uint64_t)_isLastScheduledDoseforScheduledDate:(void *)a3 schedule:(void *)a4 startGenerationDate:(void *)a5 calendar:(int)a6 cycleIntervalIndex:(void *)a7 interval:
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  NSObject *v43;
  int v45;
  void *v46;
  uint64_t v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = objc_opt_self();
  objc_msgSend(v13, "endDateTime");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v12;
  if (!v18)
  {
LABEL_32:
    v20 = 0;
    goto LABEL_33;
  }
  objc_msgSend(v16, "dose");
  v20 = objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    if (+[HDMedicationNotificationEngine _isLastScheduledTimeForDay:schedule:interval:calendar:](v17, v19, v13, v16, v15))
    {
      v20 = 0;
      v21 = v19;
      switch(objc_msgSend(v13, "frequencyType"))
      {
        case 1:
          if (!+[HDMedicationNotificationEngine _validateConfigurationForCyclicSchedule:cycleIntervalIndex:](v17, v13, a6))goto LABEL_32;
          v22 = 1;
          +[HDMedicationNotificationEngine _getNextDateFromDate:daysInFuture:calendar:](v17, v19, 1, v15);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (+[HDMedicationNotificationEngine _indexForGenerationDate:schedule:calendar:](v17, v23, v13, v15) != a6)
          {
            v48 = v16;
            v49 = v23;
            v50 = v14;
            v52 = v17;
            v24 = 1;
            while (1)
            {
              objc_msgSend(v13, "timeIntervals");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "count") - 1;

              objc_msgSend(v13, "timeIntervals");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = v27;
              v29 = v26 == a6 ? 0 : a6 + 1;
              objc_msgSend(v27, "objectAtIndexedSubscript:", v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v30, "dose");
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              if (v31)
                break;
              if (v26 == a6)
                a6 = 0;
              else
                ++a6;
              objc_msgSend(v30, "cycleIntervalDays");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v24 += objc_msgSend(v32, "intValue");

            }
            v14 = v50;
            v17 = v52;
            v22 = v24;
            v16 = v48;
            v23 = v49;
          }
          +[HDMedicationNotificationEngine _getNextDateFromDate:daysInFuture:calendar:](v17, v19, v22, v15);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_44;
        case 2:
          objc_msgSend(v13, "timeIntervals");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "count");

          if (v34)
          {
            +[HDMedicationNotificationEngine _getNextDateFromDate:daysInFuture:calendar:](v17, v19, 1, v15);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_44;
          }
          _HKInitializeLogging();
          HKLogMedication();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            +[HDMedicationNotificationEngine _isLastScheduledDoseforScheduledDate:schedule:startGenerationDate:calendar:cycleIntervalIndex:interval:].cold.1();
          goto LABEL_31;
        case 3:
          objc_msgSend(v13, "timeIntervals");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "count");

          if (v36)
          {
            v51 = v14;
            v53 = v17;
            v56 = 0u;
            v57 = 0u;
            v54 = 0u;
            v55 = 0u;
            objc_msgSend(v13, "timeIntervals");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
            if (v38)
            {
              v39 = v38;
              v40 = 0;
              v41 = *(_QWORD *)v55;
              do
              {
                for (i = 0; i != v39; ++i)
                {
                  if (*(_QWORD *)v55 != v41)
                    objc_enumerationMutation(v37);
                  v40 |= objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "daysOfWeek");
                }
                v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
              }
              while (v39);
            }
            else
            {
              v40 = 0;
            }

            v45 = 1;
            while (1)
            {
              +[HDMedicationNotificationEngine _getNextDateFromDate:daysInFuture:calendar:](v53, v19, v45, v15);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_self();
              objc_msgSend(v15, "components:fromDate:", 636, v21);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = objc_msgSend(v46, "weekday");

              if ((+[HDMedicationNotificationEngine _optionForWeekday:]((uint64_t)HDMedicationNotificationEngine, v47) & v40) != 0)break;
              if (++v45 == 8)
              {
                v21 = v19;
                goto LABEL_43;
              }
            }

LABEL_43:
            v14 = v51;
            v17 = v53;
LABEL_44:
            v20 = +[HDMedicationNotificationEngine _greaterThanOrEqualNextScheduledDate:endDate:calendar:](v17, v21, v18, v15);
            goto LABEL_34;
          }
          _HKInitializeLogging();
          HKLogMedication();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            +[HDMedicationNotificationEngine _isLastScheduledDoseforScheduledDate:schedule:startGenerationDate:calendar:cycleIntervalIndex:interval:].cold.2();
LABEL_31:

          break;
        case 4:
          goto LABEL_34;
        default:
          goto LABEL_44;
      }
    }
    goto LABEL_32;
  }
LABEL_33:
  v21 = v19;
LABEL_34:

  return v20;
}

+ (uint64_t)_isLastScheduledTimeForDay:(void *)a3 schedule:(void *)a4 interval:(void *)a5 calendar:
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v36;
  id v37;
  id v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_self();
  objc_msgSend(v11, "components:fromDate:", 224, v8);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setCalendar:", v11);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(v9, "timeIntervals");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (!v13)
  {
    v34 = 1;
    goto LABEL_19;
  }
  v14 = v13;
  v36 = v11;
  v37 = v9;
  v38 = v8;
  v15 = *(_QWORD *)v41;
  do
  {
    v16 = 0;
    do
    {
      if (*(_QWORD *)v41 != v15)
        objc_enumerationMutation(v12);
      v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v16);
      objc_msgSend(v10, "cycleIntervalDays", v36, v37, v38);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "cycleIntervalDays");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18 != v19)
        goto LABEL_9;
      objc_msgSend(v10, "cycleIndex");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "cycleIndex");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20 != v21)
      {

        v19 = v18;
LABEL_9:

        goto LABEL_10;
      }
      v22 = objc_msgSend(v10, "daysOfWeek");
      v23 = objc_msgSend(v17, "daysOfWeek");

      if (v22 == v23)
      {
        v24 = objc_alloc_init(MEMORY[0x1E0C99D78]);
        objc_msgSend(v17, "startTimeComponent");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "calendar");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setCalendar:", v26);

        objc_msgSend(v17, "startTimeComponent");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setHour:", objc_msgSend(v27, "hour"));

        objc_msgSend(v17, "startTimeComponent");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setMinute:", objc_msgSend(v28, "minute"));

        objc_msgSend(v17, "startTimeComponent");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setSecond:", objc_msgSend(v29, "second"));

        objc_msgSend(v39, "date");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "date");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v30, "compare:", v31);

        if (v32 == -1)
        {
          v34 = 0;
          goto LABEL_17;
        }
      }
LABEL_10:
      ++v16;
    }
    while (v14 != v16);
    v33 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    v14 = v33;
  }
  while (v33);
  v34 = 1;
LABEL_17:
  v9 = v37;
  v8 = v38;
  v11 = v36;
LABEL_19:

  return v34;
}

+ (id)_getNextDateFromDate:(int)a3 daysInFuture:(void *)a4 calendar:
{
  id v6;
  id v7;
  id v8;
  void *v9;

  v6 = a4;
  v7 = a2;
  objc_opt_self();
  v8 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v8, "setDay:", a3);
  objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v8, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (uint64_t)_validateConfigurationForCyclicSchedule:(int)a3 cycleIntervalIndex:
{
  id v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_opt_self();
  objc_msgSend(v4, "timeIntervals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (a3 < 0 || v6 <= 1)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[HDMedicationNotificationEngine _validateConfigurationForCyclicSchedule:cycleIntervalIndex:].cold.1();
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v4, "timeIntervals", 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "dose");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            v13 = 1;
            goto LABEL_17;
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          continue;
        break;
      }
    }

    _HKInitializeLogging();
    HKLogMedication();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[HDMedicationNotificationEngine _validateConfigurationForCyclicSchedule:cycleIntervalIndex:].cold.2();
  }
  v13 = 0;
LABEL_17:

  return v13;
}

+ (unint64_t)_indexForGenerationDate:(void *)a3 schedule:(void *)a4 calendar:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD v25[5];
  _QWORD v26[4];

  v6 = a2;
  v7 = a3;
  v8 = a4;
  v9 = objc_opt_self();
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0x8000000000000000;
  objc_msgSend(v7, "timeIntervals");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __76__HDMedicationNotificationEngine__indexForGenerationDate_schedule_calendar___block_invoke;
  v25[3] = &unk_1E6E012E0;
  v25[4] = v26;
  objc_msgSend(v10, "hk_map:", v25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "startDateTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "components:fromDate:", 124, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "cycleStartDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v7, "cycleStartDate");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = v13;
  }
  v16 = v15;

  objc_msgSend(v8, "dateFromComponents:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "components:fromDate:toDate:options:", 16, v17, v6, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "day");

  if (v19 < 0)
  {
    objc_msgSend(v11, "hk_reversed");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = +[HDMedicationNotificationEngine _indexThatDoesNotAddPastTotalDays:fromIntervalLengths:](v9, -v19, v21);
    v23 = objc_msgSend(v11, "count");
    objc_opt_self();
    v20 = v23 + ~v22;

  }
  else
  {
    v20 = +[HDMedicationNotificationEngine _indexThatAddsPastTotalDays:fromIntervalLengths:](v9, v19, v11);
  }

  _Block_object_dispose(v26, 8);
  return v20;
}

+ (BOOL)_greaterThanOrEqualNextScheduledDate:(void *)a3 endDate:(void *)a4 calendar:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;

  v6 = a4;
  v7 = a3;
  v8 = a2;
  objc_opt_self();
  v9 = objc_msgSend(v6, "compareDate:toDate:toUnitGranularity:", v8, v7, 16);

  return v9 == 1;
}

+ (id)_makeScheduleItemAtDate:(void *)a3 withMonophasicInterval:(void *)a4 calendar:(void *)a5 schedule:(int)a6 cyclicIntervalIndex:
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = a2;
  v14 = objc_opt_self();
  objc_msgSend(v12, "startTimeComponent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "components:fromDate:", 28, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHour:", objc_msgSend(v15, "hour"));
  objc_msgSend(v16, "setMinute:", objc_msgSend(v15, "minute"));
  objc_msgSend(v16, "setSecond:", objc_msgSend(v15, "second"));
  objc_msgSend(v16, "setCalendar:", v11);
  objc_msgSend(v16, "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = +[HDMedicationNotificationEngine _isLastScheduledDoseforScheduledDate:schedule:startGenerationDate:calendar:cycleIntervalIndex:interval:](v14, v17, v10, v13, v11, a6, v12);

  v19 = objc_alloc(MEMORY[0x1E0D2C4B0]);
  objc_msgSend(v10, "UUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dose");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "medicationIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)objc_msgSend(v19, "initWithScheduleUUID:dose:medicationIdentifier:isLastScheduledDose:", v20, v21, v22, v18);
  v24 = objc_alloc(MEMORY[0x1E0D2C4A8]);
  v28[0] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithScheduledDateTime:notificationSent:doses:", v17, 0, v25);

  return v26;
}

id __116__HDMedicationNotificationEngine__generateScheduleItemsAtDate_withMultiphasicSchedule_calendar_startGenerationDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "cycleIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "integerValue") == *(_QWORD *)(a1 + 32))
    v6 = v3;
  else
    v6 = 0;

  return v6;
}

id __76__HDMedicationNotificationEngine__indexForGenerationDate_schedule_calendar___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "cycleIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "integerValue") == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v6 = 0;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v5, "integerValue");
    objc_msgSend(v3, "cycleIntervalDays");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (unint64_t)_indexThatDoesNotAddPastTotalDays:(void *)a3 fromIntervalLengths:
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;

  v4 = a3;
  objc_opt_self();
  if (a2 < 1)
  {
    v6 = -1;
  }
  else
  {
    v5 = 0;
    v6 = -1;
    do
    {
      v6 = (v6 + 1) % objc_msgSend(v4, "count");
      objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 += objc_msgSend(v7, "integerValue");

    }
    while (v5 < a2);
  }

  return v6;
}

+ (unint64_t)_indexThatAddsPastTotalDays:(void *)a3 fromIntervalLengths:
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;

  v4 = a3;
  objc_opt_self();
  if (a2 < 0)
  {
    v6 = -1;
  }
  else
  {
    v5 = 0;
    v6 = -1;
    do
    {
      v6 = (v6 + 1) % objc_msgSend(v4, "count");
      objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 += objc_msgSend(v7, "integerValue");

    }
    while (v5 <= a2);
  }

  return v6;
}

+ (BOOL)unitTesting_isLastScheduledDoseforScheduledDate:(id)a3 schedule:(id)a4 startGenerationDate:(id)a5 calendar:(id)a6 cycleIntervalIndex:(int)a7 interval:(id)a8
{
  return +[HDMedicationNotificationEngine _isLastScheduledDoseforScheduledDate:schedule:startGenerationDate:calendar:cycleIntervalIndex:interval:]((uint64_t)a1, a3, a4, a5, a6, a7, a8);
}

+ (int64_t)unitTesting_calculateTotalDaysForSchedule:(id)a3 configuration:(id)a4 calendar:(id)a5 startGenerationDate:(id)a6
{
  return +[HDMedicationNotificationEngine _calculateTotalDaysForSchedule:configuration:calendar:startGenerationDate:]((uint64_t)a1, a3, a4, a5, a6);
}

+ (void)_isLastScheduledDoseforScheduledDate:schedule:startGenerationDate:calendar:cycleIntervalIndex:interval:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3(&dword_1B815E000, v0, v1, "[%{public}@] Error in _isLastScheduledDoseforScheduledDate: Daily schedule has no timeInterval objects.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)_isLastScheduledDoseforScheduledDate:schedule:startGenerationDate:calendar:cycleIntervalIndex:interval:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3(&dword_1B815E000, v0, v1, "[%{public}@] Error in _isLastScheduledDoseforScheduledDate: Day of Week schedule has no timeInterval objects.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)_validateConfigurationForCyclicSchedule:cycleIntervalIndex:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3(&dword_1B815E000, v0, v1, "[%{public}@] Error in _isLastScheduledDoseforScheduledDate: Cyclic schedule has less than 2 intervals, expected at least 2.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)_validateConfigurationForCyclicSchedule:cycleIntervalIndex:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3(&dword_1B815E000, v0, v1, "[%{public}@] Error in _isLastScheduledDoseforScheduledDate: Cyclic schedule has no active intervals.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
