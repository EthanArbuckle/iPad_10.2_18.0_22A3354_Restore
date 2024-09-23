@implementation FCGoalProgressEvaluator

+ (id)nextScheduledDatesByEventIdentifiersForEvents:(id)a3 model:(id)a4 evaluationDelegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v21 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v15);
        v17 = (void *)MEMORY[0x1D17A8EB0]();
        objc_msgSend(v16, "eventIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_nextFireDateForEvent:model:", v16, v9);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, v18);

        objc_autoreleasePoolPop(v17);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);
  }

  return v10;
}

+ (id)evaluateEvents:(id)a3 withModel:(id)a4 evaluationDelegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(a1, "_eventDidCrossScheduledThreshold:withModel:evaluationDelegate:", v17, v9, v10, (_QWORD)v19)&& objc_msgSend(v17, "shouldFireWithTypicalDayModel:evaluationDelegate:", v9, v10))
        {
          objc_msgSend(v11, "addObject:", v17);
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  return v11;
}

+ (id)_nextFireDateForEvent:(id)a3 model:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  id v28;
  int v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "nextFireDateWithModel:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "projectedDayDuration");
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    v11 = v10;
    objc_msgSend(v6, "startOfToday");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    if (v11 < v13)
    {

      goto LABEL_5;
    }
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    v15 = v14;
    objc_msgSend(v6, "endOfToday");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceReferenceDate");
    v18 = v17;

    if (v15 > v18)
    {
LABEL_5:
      _HKInitializeLogging();
      v19 = (void *)*MEMORY[0x1E0CB5298];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_ERROR))
      {
        v20 = v19;
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "startOfToday");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "endOfToday");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138544130;
        v31 = (uint64_t)v22;
        v32 = 2112;
        v33 = (uint64_t)v7;
        v34 = 2112;
        v35 = v23;
        v36 = 2112;
        v37 = v24;
        _os_log_error_impl(&dword_1CC30F000, v20, OS_LOG_TYPE_ERROR, "Coaching progress reason %{public}@ returned a fire date outside the bounds of the current day. %@ was outside of [%@, %@]", (uint8_t *)&v30, 0x2Au);

LABEL_10:
        goto LABEL_11;
      }
      goto LABEL_11;
    }
  }
  objc_msgSend(v5, "minimumDayDuration");
  if (v9 >= v25)
  {
    v28 = v7;
    goto LABEL_13;
  }
  _HKInitializeLogging();
  v26 = (void *)*MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    v20 = v26;
    objc_msgSend(v5, "minimumDayDuration");
    v30 = 134218240;
    v31 = (uint64_t)v9;
    v32 = 2048;
    v33 = (uint64_t)v27;
    _os_log_impl(&dword_1CC30F000, v20, OS_LOG_TYPE_DEFAULT, "Duration in day too short for event (duration in day: %ld, minimum: %ld)", (uint8_t *)&v30, 0x16u);
    goto LABEL_10;
  }
LABEL_11:
  v28 = 0;
LABEL_13:

  return v28;
}

+ (BOOL)_eventDidCrossScheduledThreshold:(id)a3 withModel:(id)a4 evaluationDelegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  int v24;
  os_log_t *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  double v29;
  os_log_t v30;
  NSObject *v31;
  void *v32;
  _BOOL4 v34;
  os_log_t v35;
  NSObject *v36;
  void *v37;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  _BYTE v42[10];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  double v47;
  __int16 v48;
  double v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "eventIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastFiredDateForProgressEventIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_nextFireDateForEvent:model:", v8, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentCalendar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "projectedDayDuration");
  v17 = v16;

  objc_msgSend(v14, "timeIntervalSinceDate:", v13);
  v19 = v18;
  objc_msgSend(v14, "timeIntervalSinceReferenceDate");
  v21 = v20;
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  v23 = v22;
  if (v12)
    v24 = objc_msgSend(v15, "isDate:inSameDayAsDate:", v12, v14);
  else
    v24 = 0;
  _HKInitializeLogging();
  v25 = (os_log_t *)MEMORY[0x1E0CB5298];
  v26 = (void *)*MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_INFO))
  {
    v27 = v26;
    objc_msgSend(v8, "eventIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v40 = v28;
    v41 = 2112;
    *(_QWORD *)v42 = v12;
    *(_WORD *)&v42[8] = 2112;
    v43 = v13;
    v44 = 2112;
    v45 = v14;
    v46 = 2048;
    v47 = v17;
    v48 = 2048;
    v49 = v19;
    _os_log_impl(&dword_1CC30F000, v27, OS_LOG_TYPE_INFO, "Evaluating if event %{public}@ crossed the scheduled threshold - lastFired: %@, scheduledFireDate: %@, now: %@, durationOfToday: %lf, intervalBetweenScheduledDateAndNow: %lf", buf, 0x3Eu);

  }
  v29 = v17 * 0.25;
  _HKInitializeLogging();
  v30 = *v25;
  if (os_log_type_enabled(*v25, OS_LOG_TYPE_INFO))
  {
    v31 = v30;
    objc_msgSend(v8, "eventIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v40 = v32;
    v41 = 1024;
    *(_DWORD *)v42 = v21 >= v23;
    v25 = (os_log_t *)MEMORY[0x1E0CB5298];
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)&v42[6] = v24;
    LOWORD(v43) = 1024;
    *(_DWORD *)((char *)&v43 + 2) = v19 >= v29;
    _os_log_impl(&dword_1CC30F000, v31, OS_LOG_TYPE_INFO, "Evaluating if event %{public}@ crossed the scheduled threshold - scheduledDateInPast: %{BOOL}d, lastFiredDateWasToday: %{BOOL}d, scheduledDateIsTooLongAgoFromNow: %{BOOL}d", buf, 0x1Eu);

  }
  if (v21 < v23 || v13 == 0)
    v34 = 0;
  else
    v34 = (v19 < v29) & ~v24;
  _HKInitializeLogging();
  v35 = *v25;
  if (os_log_type_enabled(*v25, OS_LOG_TYPE_INFO))
  {
    v36 = v35;
    objc_msgSend(v8, "eventIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v40 = v37;
    v41 = 1024;
    *(_DWORD *)v42 = v34;
    _os_log_impl(&dword_1CC30F000, v36, OS_LOG_TYPE_INFO, "Event %{public}@ crossed the scheduled threshold result: %{BOOL}d", buf, 0x12u);

  }
  return v34;
}

@end
