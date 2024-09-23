@implementation ATXIdleTimeBeginAnchor

+ (double)minimumSecondsForBeingIdle
{
  void *v2;
  double v3;
  double v4;

  +[ATXAnchorModelHyperParameters sharedInstance](ATXAnchorModelHyperParameters, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "idleTimeEndAnchorMinimumSecondsForBeingIdle");
  v4 = v3;

  return v4;
}

+ (Class)supportedDuetDataProviderClass
{
  return (Class)objc_opt_class();
}

+ (id)duetEventsPredicates
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithIntegerValue:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v3 = (void *)MEMORY[0x1E0D15AD0];
  objc_msgSend((id)objc_opt_class(), "minimumSecondsForBeingIdle");
  objc_msgSend(v3, "predicateForEventsWithMinimumDuration:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)fetchAnchorOccurrencesBetweenStartDate:(id)a3 endDate:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (objc_class *)MEMORY[0x1E0C99D20];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  objc_msgSend((id)objc_opt_class(), "duetEventsPredicates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithArray:", v9);

  objc_msgSend((id)objc_opt_class(), "supportedDuetDataProviderClass");
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "fetchEventsBetweenStartDate:andEndDate:withPredicates:", v7, v6, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "_pas_filteredArrayWithTest:", &__block_literal_global_43);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __73__ATXIdleTimeBeginAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;

  objc_msgSend(a2, "endDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[_ATXActionUtils localHourOfDayFromDate:](_ATXActionUtils, "localHourOfDayFromDate:", v2);

  __atxlog_handle_anchor();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __73__ATXIdleTimeBeginAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke_cold_1(v3, v4);

  return 1;
}

+ (id)anchorOccurenceDateFromDuetEvent:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0C99D68];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithTimeInterval:sinceDate:", v6, -10800.0);
  return v7;
}

+ (int64_t)anchorType
{
  return 3;
}

+ (id)longDescription
{
  return CFSTR("The user hasn't used their device for a prolonged period of time. Likely after waking up in the morning.");
}

+ (double)secondsOfInfluence
{
  return 10800.0;
}

+ (BOOL)shouldPredicateOnStartDate
{
  return 1;
}

+ (BOOL)usesContextStoreForRealTimeNotifications
{
  return 0;
}

+ (void)registerForNotificationsWithoutUsingContextStoreForObserver:(id)a3 enterSelector:(SEL)a4 exitSelector:(SEL)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  double v11;
  double v12;
  xpc_object_t v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  SEL v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(a1, "predictNextAnchorOccurrenceDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_anchor();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v20 = a1;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "Inference (%@): Setting up XPC activity for IdleTimeBegin Anchor to fire at %@...", buf, 0x16u);
  }

  v10 = (void *)objc_opt_new();
  objc_msgSend(v8, "timeIntervalSinceDate:", v10);
  v12 = v11;

  v13 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v13, (const char *)*MEMORY[0x1E0C80760], (uint64_t)v12);
  xpc_dictionary_set_int64(v13, (const char *)*MEMORY[0x1E0C80790], 60);
  xpc_dictionary_set_BOOL(v13, (const char *)*MEMORY[0x1E0C808B8], 1);
  xpc_dictionary_set_string(v13, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
  xpc_dictionary_set_BOOL(v13, (const char *)*MEMORY[0x1E0C80738], 1);
  xpc_dictionary_set_BOOL(v13, (const char *)*MEMORY[0x1E0C80898], 0);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __113__ATXIdleTimeBeginAnchor_registerForNotificationsWithoutUsingContextStoreForObserver_enterSelector_exitSelector___block_invoke;
  v16[3] = &unk_1E82DD7B8;
  v17 = v7;
  v18 = a4;
  v14 = v7;
  xpc_activity_register("com.apple.duetexpertd.idle_time_begin_trigger", v13, v16);
  __atxlog_handle_anchor();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = a1;
    _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, "Inference (%@): Done setting up XPC activity for IdleTimeBegin Anchor.", buf, 0xCu);
  }

}

void __113__ATXIdleTimeBeginAnchor_registerForNotificationsWithoutUsingContextStoreForObserver_enterSelector_exitSelector___block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v3 = a2;
  if (xpc_activity_get_state(v3) == 2 && (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked") & 1) == 0)
  {
    __atxlog_handle_anchor();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "Triggering IdleTimeBegin Anchor based on prescheduled XPC Activity.", v7, 2u);
    }

    v5 = (void *)MEMORY[0x1CAA48B6C]();
    v6 = *(void **)(a1 + 32);
    if (v6)
      ((void (*)(_QWORD, _QWORD))objc_msgSend(v6, "methodForSelector:", *(_QWORD *)(a1 + 40)))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    objc_autoreleasePoolPop(v5);
  }

}

+ (id)predictNextAnchorOccurrenceDate
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  long double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  long double v12;
  void *v13;
  double v14;
  uint64_t v15;
  NSObject *v16;
  int v18;
  void *v19;
  __int16 v20;
  long double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "historicalAnchorOccurrenceDatesForAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "weightedAverageOfHoursFromDates:", v5);
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  objc_msgSend(v8, "components:fromDate:", 62, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = fmod(v7, 24.0);
  v12 = fmod(v7, 1.0) * 60.0;
  objc_msgSend(v10, "setHour:", (uint64_t)v11);
  objc_msgSend(v10, "setMinute:", (uint64_t)v12);
  objc_msgSend(v8, "dateFromComponents:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceNow");
  if (v14 < -10.0)
  {
    objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", 16, 1, v13, 0);
    v15 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v15;
  }
  __atxlog_handle_anchor();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412546;
    v19 = v13;
    v20 = 2048;
    v21 = v7;
    _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_DEFAULT, "Prediction: %@ (%.3f)", (uint8_t *)&v18, 0x16u);
  }

  return v13;
}

+ (double)weightedAverageOfHoursFromDates:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  double v8;
  _QWORD v10[6];
  uint64_t v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __58__ATXIdleTimeBeginAnchor_weightedAverageOfHoursFromDates___block_invoke;
  v19[3] = &unk_1E82DD7E0;
  v6 = v4;
  v20 = v6;
  v21 = 96;
  objc_msgSend(v3, "_pas_mappedArrayWithTransform:", v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = (double *)&v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __58__ATXIdleTimeBeginAnchor_weightedAverageOfHoursFromDates___block_invoke_2;
  v10[3] = &unk_1E82DD808;
  v10[4] = &v15;
  v10[5] = &v11;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);
  v8 = v16[3] / (v12[3] + 1.0e-12);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v8;
}

id __58__ATXIdleTimeBeginAnchor_weightedAverageOfHoursFromDates___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  double v3;
  double v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "components:fromDate:", *(_QWORD *)(a1 + 40), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (double)objc_msgSend(v2, "hour");
  v4 = (double)objc_msgSend(v2, "minute") / 60.0 + v3;
  if (v4 < 12.0)
    v4 = v4 + 24.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

double __58__ATXIdleTimeBeginAnchor_weightedAverageOfHoursFromDates___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  double v5;
  double v6;
  uint64_t v7;
  double result;

  v5 = pow(0.9, (double)a3);
  objc_msgSend(a2, "doubleValue");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24)
                                                              + v6 * v5;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = v5 + *(double *)(v7 + 24);
  *(double *)(v7 + 24) = result;
  return result;
}

+ (id)keyPathForContextStore
{
  return 0;
}

+ (id)predicateForContextStoreRegistration
{
  return 0;
}

+ (id)invalidationPredicateForContextStoreRegistration
{
  return 0;
}

+ (BOOL)shouldProcessContextStoreNotification
{
  return 0;
}

+ (BOOL)isActive
{
  return 1;
}

+ (id)sampleEvent
{
  ATXScreenLockStateDuetEvent *v2;
  void *v3;
  void *v4;
  ATXScreenLockStateDuetEvent *v5;

  v2 = [ATXScreenLockStateDuetEvent alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -20.0);
  v4 = (void *)objc_opt_new();
  v5 = -[ATXScreenLockStateDuetEvent initWithScreenLockState:startDate:endDate:](v2, "initWithScreenLockState:startDate:endDate:", 0, v3, v4);

  return v5;
}

void __73__ATXIdleTimeBeginAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_DEBUG, "IdleTimeBegin Anchor occurred at local hour: %ld", (uint8_t *)&v2, 0xCu);
}

@end
