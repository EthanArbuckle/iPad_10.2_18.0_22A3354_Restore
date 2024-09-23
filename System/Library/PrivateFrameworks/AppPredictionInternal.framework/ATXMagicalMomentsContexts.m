@implementation ATXMagicalMomentsContexts

+ (id)getCurrentLOI
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "locationOfInterestAtCurrentLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (unint64_t)minDistanceFromDate:(id)a3 toDateRange:(_NSRange)a4
{
  NSUInteger location;
  NSUInteger v5;
  double v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;

  location = a4.location;
  v5 = a4.location + a4.length;
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  v7 = (unint64_t)v6;
  v8 = (unint64_t)v6 - v5;
  if ((unint64_t)v6 < v5)
    v8 = 0;
  v9 = location >= v7;
  v10 = location - v7;
  if (v10 != 0 && v9)
    return v10;
  else
    return v8;
}

+ (unint64_t)getMinTemporalDistanceFromDate:(id)a3 toVisitsToLOI:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a4, "visits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    v11 = -1;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "rangeValue");
        v15 = objc_msgSend(a1, "minDistanceFromDate:toDateRange:", v6, v13, v14);
        if (v15 < v11)
          v11 = v15;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }
  else
  {
    v11 = -1;
  }

  return v11;
}

+ (id)locationOfInterestForDate:(id)a3 dateIntervalForSearch:(id)a4
{
  id v5;
  id v6;
  void *v7;
  dispatch_semaphore_t v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  __int16 v14;
  _QWORD v15[4];
  id v16;
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = dispatch_semaphore_create(0);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__21;
  v23 = __Block_byref_object_dispose__21;
  v24 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__ATXMagicalMomentsContexts_locationOfInterestForDate_dateIntervalForSearch___block_invoke;
  v15[3] = &unk_1E82DDA78;
  v9 = v5;
  v16 = v9;
  v18 = &v19;
  v10 = v8;
  v17 = v10;
  objc_msgSend(v7, "fetchLocationsOfInterestVisitedDuring:handler:", v6, v15);
  if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v10, 2.0))
  {
    __atxlog_handle_default();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 0;
      _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "LOI fetch near date timed out", (uint8_t *)&v14, 2u);
    }

    v12 = 0;
  }
  else
  {
    v12 = (id)v20[5];
  }

  _Block_object_dispose(&v19, 8);
  return v12;
}

void __77__ATXMagicalMomentsContexts_locationOfInterestForDate_dateIntervalForSearch___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    v7 = 900;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v6)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
      v10 = +[ATXMagicalMomentsContexts getMinTemporalDistanceFromDate:toVisitsToLOI:](ATXMagicalMomentsContexts, "getMinTemporalDistanceFromDate:toVisitsToLOI:", *(_QWORD *)(a1 + 32), v9, (_QWORD)v12);
      if (v10 < v7)
      {
        v11 = v10;
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v9);
        v7 = v11;
        if (!v11)
          break;
      }
      if (v5 == ++v8)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (id)timeOfDayPredicatesWithRequestedDurationInHours:(unint64_t)a3 shouldPredicateOnStartDate:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  unint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  id v16;

  if (!a3)
    return MEMORY[0x1E0C9AA60];
  v4 = a4;
  if (a3 >= 0x18)
    v5 = 24;
  else
    v5 = a3;
  v6 = 0x18 / v5;
  if ((v6 * v5) != 24)
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      +[ATXMagicalMomentsContexts timeOfDayPredicatesWithRequestedDurationInHours:shouldPredicateOnStartDate:].cold.1(v7);

  }
  v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v6);
  v8 = 0;
  v9 = 0;
  if (v4)
    v10 = CFSTR("startDateSecondsAfterMidnight");
  else
    v10 = CFSTR("endDateSecondsAfterMidnight");
  v11 = 3600 * v5;
  v12 = 3600 * v5;
  v13 = v5;
  do
  {
    if (v9 % 0x18 >= v13 % 0x18)
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K < %lu OR %K >= %lu"), v10, v12 - 86400 * (v13 / 0x18), v10, v8 - 86400 * (v9 / 0x18));
    else
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %lu AND %K < %lu"), v10, v8 - 86400 * (v9 / 0x18), v10, v12 - 86400 * (v13 / 0x18));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v14);

    v13 += v5;
    v12 += v11;
    v9 += v5;
    v8 += v11;
    --v6;
  }
  while (v6);
  return v16;
}

+ (id)partOfWeekPredicatesUsingStartDate:(BOOL)a3
{
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  if (a3)
    v3 = CFSTR("isStartDateOnWeekday");
  else
    v3 = CFSTR("isEndDateOnWeekday");
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == YES"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == NO"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)eventIdentifierPredicateForValue:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXMagicalMomentsContexts.m"), 157, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventIdentifier"));

  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("identifier = %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)loiPredicateForUUIDString:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXMagicalMomentsContexts.m"), 163, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uuidString"));

  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("locationIdentifierUUIDString = %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)timeOfDayPredicatesWithRequestedDurationInHours:(os_log_t)log shouldPredicateOnStartDate:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "Attempted to create Time of Day predicate for number of hours that doesn't evenly split a day.", v1, 2u);
}

@end
