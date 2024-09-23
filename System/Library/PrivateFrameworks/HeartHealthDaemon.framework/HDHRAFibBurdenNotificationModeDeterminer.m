@implementation HDHRAFibBurdenNotificationModeDeterminer

- (HDHRAFibBurdenNotificationModeDeterminer)initWithProfile:(id)a3 calendarCache:(id)a4
{
  return -[HDHRAFibBurdenNotificationModeDeterminer initWithProfile:calendarCache:dateGenerator:](self, "initWithProfile:calendarCache:dateGenerator:", a3, a4, &__block_literal_global_14);
}

uint64_t __74__HDHRAFibBurdenNotificationModeDeterminer_initWithProfile_calendarCache___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "now");
}

- (HDHRAFibBurdenNotificationModeDeterminer)initWithProfile:(id)a3 calendarCache:(id)a4 dateGenerator:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDHRAFibBurdenNotificationModeDeterminer *v11;
  HDHRAFibBurdenNotificationModeDeterminer *v12;
  uint64_t v13;
  id dateGenerator;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HDHRAFibBurdenNotificationModeDeterminer;
  v11 = -[HDHRAFibBurdenNotificationModeDeterminer init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    objc_storeStrong((id *)&v12->_calendarCache, a4);
    v13 = MEMORY[0x1D17A8B4C](v10);
    dateGenerator = v12->_dateGenerator;
    v12->_dateGenerator = (id)v13;

  }
  return v12;
}

- (id)notificationModeForCurrentValue:(id)a3 featureStatus:(id)a4 onboardedWithinAnalysisInterval:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;

  v7 = a5;
  v10 = a4;
  v11 = a3;
  -[HDHRAFibBurdenNotificationModeDeterminer notificationModeForCurrentValue:featureStatus:onboardedWithinAnalysisInterval:endWeekdayToFire:error:](self, "notificationModeForCurrentValue:featureStatus:onboardedWithinAnalysisInterval:endWeekdayToFire:error:", v11, v10, v7, HKHRAFibBurdenSevenDayAnalysisNotificationEndWeekdayToFire(), a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)notificationModeForCurrentValue:(id)a3 featureStatus:(id)a4 onboardedWithinAnalysisInterval:(BOOL)a5 endWeekdayToFire:(int64_t)a6 error:(id *)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  int v28;
  HDHRAFibBurdenNotificationModeDeterminer *v29;
  uint64_t v30;

  v9 = a5;
  v30 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  if (!-[HDHRAFibBurdenNotificationModeDeterminer _shouldShowNotificationWithEndWeekdayToFire:](self, "_shouldShowNotificationWithEndWeekdayToFire:", a6))
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 138543362;
      v29 = self;
      v19 = "[%{public}@] Not showing notification as it is after the cutoff day";
LABEL_13:
      _os_log_impl(&dword_1CC29C000, v18, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v28, 0xCu);
    }
LABEL_14:

    -[HDHRAFibBurdenNotificationModeDeterminer _noNotification](self, "_noNotification");
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  objc_msgSend(v13, "requirementsEvaluationByContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D2FA00]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "areAllRequirementsSatisfied");

  if ((v16 & 1) == 0)
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[HDHRAFibBurdenNotificationModeDeterminer notificationModeForCurrentValue:featureStatus:onboardedWithinAnalysisInterval:endWeekdayToFire:error:].cold.1((uint64_t)self, v18, v20, v21, v22, v23, v24, v25);
    goto LABEL_14;
  }
  if ((HKHRAFibBurdenNotificationsEnabledWithFeatureStatus() & 1) == 0)
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 138543362;
      v29 = self;
      v19 = "[%{public}@] User has weekly notifications turned off, suppressing notification";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (v12)
    -[HDHRAFibBurdenNotificationModeDeterminer _notificationWithCurrentValue:errorOut:](self, "_notificationWithCurrentValue:errorOut:", v12, a7);
  else
    -[HDHRAFibBurdenNotificationModeDeterminer _noDataNotificationWithFeatureStatus:onboardedWithinAnalysisInterval:](self, "_noDataNotificationWithFeatureStatus:onboardedWithinAnalysisInterval:", v13, v9);
  v17 = objc_claimAutoreleasedReturnValue();
LABEL_15:
  v26 = (void *)v17;

  return v26;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_dayIndexRangeFromSample:(id)a3
{
  HKCalendarCache *calendarCache;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  calendarCache = self->_calendarCache;
  v4 = a3;
  objc_msgSend(v4, "_timeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCalendarCache calendarForTimeZone:](calendarCache, "calendarForTimeZone:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "hk_dayIndexRangeWithCalendar:", v6);
  v9 = v8;

  v10 = v9 - 1;
  v11 = v7;
  result.var1 = v10;
  result.var0 = v11;
  return result;
}

- (BOOL)_shouldShowNotificationWithEndWeekdayToFire:(int64_t)a3
{
  void *v5;
  void *v6;
  int64_t v7;

  -[HKCalendarCache currentCalendar](self->_calendarCache, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(void))self->_dateGenerator + 2))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "component:fromDate:", 512, v6);

  return v7 <= a3;
}

- (BOOL)_isSampleForPreviousCalendarWeek:(id)a3
{
  _QWORD *dateGenerator;
  void (*v5)(_QWORD *);
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  dateGenerator = self->_dateGenerator;
  v5 = (void (*)(_QWORD *))dateGenerator[2];
  v6 = a3;
  v5(dateGenerator);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCalendarCache currentCalendar](self->_calendarCache, "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = HKHRAFibBurdenPreviousWeekDayIndexRange();
  v11 = v10;

  v12 = -[HDHRAFibBurdenNotificationModeDeterminer _dayIndexRangeFromSample:](self, "_dayIndexRangeFromSample:", v6);
  v14 = v13;

  return v9 == v12 && v11 == v14;
}

- (void)_extractFromSample:(id)a3 percentageValue:(id *)a4 isClamped:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a3;
  objc_msgSend(v8, "quantity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_value");
  objc_msgSend(v7, "numberWithDouble:", v10 * 100.0);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v8, "metadata");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB5598]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithBool:", objc_msgSend(v12, "isEqual:", MEMORY[0x1E0C9AAB0]));
  *a5 = (id)objc_claimAutoreleasedReturnValue();

}

- (id)_previousSampleFromCurrentValue:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  id v15;

  v6 = a3;
  -[HKCalendarCache currentCalendar](self->_calendarCache, "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingUnit:value:toDate:options:", 16, -1, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  HDSampleEntityPredicateForStartDate();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0D29578];
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A78]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v11, "mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:", v12, WeakRetained, 0, v10, 0, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14
    && -[HDHRAFibBurdenNotificationModeDeterminer _isPreviousSampleSevenDaysBeforeCurrentSample:previousSample:](self, "_isPreviousSampleSevenDaysBeforeCurrentSample:previousSample:", v6, v14))
  {
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)_isPreviousSampleSevenDaysBeforeCurrentSample:(id)a3 previousSample:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = a4;
  v7 = -[HDHRAFibBurdenNotificationModeDeterminer _dayIndexRangeFromSample:](self, "_dayIndexRangeFromSample:", a3);
  v9 = v8;
  v10 = -[HDHRAFibBurdenNotificationModeDeterminer _dayIndexRangeFromSample:](self, "_dayIndexRangeFromSample:", v6);
  v12 = v11;

  return v7 - 7 == v10 && v9 == v12;
}

- (id)_noNotification
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D2FBA8]), "initWithType:shouldForwardToWatch:currentPercentage:currentValueClamped:currentValueDateInterval:currentValueUUID:previousPercentage:previousValueClamped:previousTimeZoneDiffersFromCurrent:", 0, 0, 0, 0, 0, 0, 0, 0, 0);
}

- (id)_noDataNotificationWithFeatureStatus:(id)a3 onboardedWithinAnalysisInterval:(BOOL)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint8_t buf[4];
  HDHRAFibBurdenNotificationModeDeterminer *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = self;
      _os_log_impl(&dword_1CC29C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarded within analysis interval, not posting no data notification", buf, 0xCu);
    }

    -[HDHRAFibBurdenNotificationModeDeterminer _noNotification](self, "_noNotification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a3, "requirementsEvaluationByContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4ED0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "areAllRequirementsSatisfied");

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2FBA8]), "initWithType:shouldForwardToWatch:currentPercentage:currentValueClamped:currentValueDateInterval:currentValueUUID:previousPercentage:previousValueClamped:previousTimeZoneDiffersFromCurrent:", 3, v9, 0, 0, 0, 0, 0, 0, 0);
  }
  return v6;
}

- (id)_notificationWithCurrentValue:(id)a3 errorOut:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;

  v6 = a3;
  if (-[HDHRAFibBurdenNotificationModeDeterminer _isSampleForPreviousCalendarWeek:](self, "_isSampleForPreviousCalendarWeek:", v6))
  {
    v36 = 0;
    v37 = 0;
    -[HDHRAFibBurdenNotificationModeDeterminer _extractFromSample:percentageValue:isClamped:](self, "_extractFromSample:percentageValue:isClamped:", v6, &v37, &v36);
    v33 = v37;
    v32 = v36;
    -[HDHRAFibBurdenNotificationModeDeterminer _previousSampleFromCurrentValue:error:](self, "_previousSampleFromCurrentValue:error:", v6, a4);
    v7 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v7;
    if (v7)
    {
      v8 = (void *)v7;
      v34 = 0;
      v35 = 0;
      -[HDHRAFibBurdenNotificationModeDeterminer _extractFromSample:percentageValue:isClamped:](self, "_extractFromSample:percentageValue:isClamped:", v7, &v35, &v34);
      v9 = v35;
      v31 = v34;
      v10 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "_timeZone");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_timeZone");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "isEqualToTimeZone:", v12) ^ 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = 2;
    }
    else
    {
      v9 = 0;
      v31 = 0;
      v13 = 0;
      v14 = 1;
    }
    v23 = objc_alloc(MEMORY[0x1E0D2FBA8]);
    v24 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v6, "startDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v24, "initWithStartDate:endDate:", v25, v26);
    objc_msgSend(v6, "UUID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v23, "initWithType:shouldForwardToWatch:currentPercentage:currentValueClamped:currentValueDateInterval:currentValueUUID:previousPercentage:previousValueClamped:previousTimeZoneDiffersFromCurrent:", v14, 1, v33, v32, v27, v28, v9, v31, v13);

  }
  else
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[HDHRAFibBurdenNotificationModeDeterminer _notificationWithCurrentValue:errorOut:].cold.1((uint64_t)self, v15, v16, v17, v18, v19, v20, v21);

    -[HDHRAFibBurdenNotificationModeDeterminer _noNotification](self, "_noNotification");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dateGenerator, 0);
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)notificationModeForCurrentValue:(uint64_t)a3 featureStatus:(uint64_t)a4 onboardedWithinAnalysisInterval:(uint64_t)a5 endWeekdayToFire:(uint64_t)a6 error:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1CC29C000, a2, a3, "[%{public}@] Attempting to post notification for analysis when analysis is not allowed", a5, a6, a7, a8, 2u);
}

- (void)_notificationWithCurrentValue:(uint64_t)a3 errorOut:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1CC29C000, a2, a3, "[%{public}@] Notified sample created, but most recent sample is not for previous calendar week", a5, a6, a7, a8, 2u);
}

@end
