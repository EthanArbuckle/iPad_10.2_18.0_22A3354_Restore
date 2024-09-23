@implementation ATXIdleTimeEndAnchor

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

  objc_msgSend(v12, "_pas_filteredArrayWithTest:", &__block_literal_global_172);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

BOOL __71__ATXIdleTimeEndAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  NSObject *v12;
  _BOOL4 v13;

  objc_msgSend(a2, "endDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[_ATXActionUtils localHourOfDayFromDate:](_ATXActionUtils, "localHourOfDayFromDate:", v2);

  __atxlog_handle_anchor();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __71__ATXIdleTimeEndAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke_cold_3(v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = v3 - 4;
  __atxlog_handle_anchor();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v11 >= 8)
  {
    if (v13)
      __71__ATXIdleTimeEndAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke_cold_2();
  }
  else if (v13)
  {
    __71__ATXIdleTimeEndAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke_cold_1();
  }

  return v11 < 8;
}

+ (int64_t)anchorType
{
  return 4;
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
  return 0;
}

+ (BOOL)usesContextStoreForRealTimeNotifications
{
  return 1;
}

+ (id)keyPathForContextStore
{
  return (id)objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForDeviceLockStatus");
}

+ (id)predicateForContextStoreRegistration
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D15C90];
  objc_msgSend((id)objc_opt_class(), "keyPathForContextStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "minimumSecondsForBeingIdle");
  objc_msgSend(v2, "predicateForKeyPath:equalToValue:withMinimumDurationInPreviousState:", v3, &unk_1E83CD870);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)invalidationPredicateForContextStoreRegistration
{
  return 0;
}

+ (BOOL)shouldProcessContextStoreNotification
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  BOOL v14;
  BOOL v15;

  if (!objc_msgSend((id)objc_opt_class(), "shouldProcessContextStoreNotificationForNumber"))
    return 0;
  v2 = (void *)objc_opt_new();
  v3 = +[_ATXActionUtils localHourOfDayFromDate:](_ATXActionUtils, "localHourOfDayFromDate:", v2);

  __atxlog_handle_anchor();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[ATXIdleTimeEndAnchor shouldProcessContextStoreNotification].cold.3(v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = v3 - 4;
  __atxlog_handle_anchor();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  v14 = v11 >= 8;
  v15 = v11 < 8;
  if (v14)
  {
    if (v13)
      +[ATXIdleTimeEndAnchor shouldProcessContextStoreNotification].cold.2();
  }
  else if (v13)
  {
    +[ATXIdleTimeEndAnchor shouldProcessContextStoreNotification].cold.1();
  }

  return v15;
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

void __71__ATXIdleTimeEndAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Counting IdleTimeEnd Anchor occurrence because it's in the acceptable time window.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __71__ATXIdleTimeEndAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Not counting IdleTimeEnd Anchor occurrence because it's either too early or too late.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __71__ATXIdleTimeEndAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, a2, a3, "IdleTimeEnd Anchor occurred at local hour: %ld", a5, a6, a7, a8, 0);
}

+ (void)shouldProcessContextStoreNotification
{
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, a2, a3, "IdleTimeEnd Anchor fired at local hour: %ld", a5, a6, a7, a8, 0);
}

@end
