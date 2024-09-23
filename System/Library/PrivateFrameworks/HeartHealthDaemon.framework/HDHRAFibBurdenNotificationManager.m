@implementation HDHRAFibBurdenNotificationManager

- (HDHRAFibBurdenNotificationManager)initWithProfile:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  HDHRAFibBurdenNotificationModeDeterminer *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  HDHRAFibBurdenNotificationManager *v12;

  v4 = (objc_class *)MEMORY[0x1E0CB6360];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = -[HDHRAFibBurdenNotificationModeDeterminer initWithProfile:calendarCache:]([HDHRAFibBurdenNotificationModeDeterminer alloc], "initWithProfile:calendarCache:", v5, v6);
  objc_msgSend(MEMORY[0x1E0D294B8], "hdhr_aFibBurdenProtectedSyncedDomainForProfile:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0CB62B8]);
  HKHRAFibBurdenLogForCategory();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithLoggingCategory:healthDataSource:", v10, v5);
  v12 = -[HDHRAFibBurdenNotificationManager initWithProfile:modeDeterminer:notificationLastSentDateStore:calendarCache:dateGenerator:eventSubmissionManager:](self, "initWithProfile:modeDeterminer:notificationLastSentDateStore:calendarCache:dateGenerator:eventSubmissionManager:", v5, v7, v8, v6, &__block_literal_global_3, v11);

  return v12;
}

uint64_t __53__HDHRAFibBurdenNotificationManager_initWithProfile___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (HDHRAFibBurdenNotificationManager)initWithProfile:(id)a3 modeDeterminer:(id)a4 notificationLastSentDateStore:(id)a5 calendarCache:(id)a6 dateGenerator:(id)a7 eventSubmissionManager:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HDHRAFibBurdenNotificationManager *v18;
  HDHRAFibBurdenNotificationManager *v19;
  uint64_t v20;
  id dateGenerator;
  const char *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *queue;
  NSObject *v25;
  void *v26;
  id v27;
  id v29;
  id v30;
  objc_super v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v30 = a4;
  v29 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v31.receiver = self;
  v31.super_class = (Class)HDHRAFibBurdenNotificationManager;
  v18 = -[HDHRAFibBurdenNotificationManager init](&v31, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_profile, v14);
    v20 = MEMORY[0x1D17A8B4C](v16);
    dateGenerator = v19->_dateGenerator;
    v19->_dateGenerator = (id)v20;

    objc_storeStrong((id *)&v19->_eventSubmissionManager, a8);
    objc_storeStrong((id *)&v19->_modeDeterminer, a4);
    objc_storeStrong((id *)&v19->_notificationLastSentDateStore, a5);
    objc_storeStrong((id *)&v19->_calendarCache, a6);
    v22 = (const char *)HKDispatchQueueName();
    v23 = dispatch_queue_create(v22, 0);
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v23;

    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v33 = v26;
      v27 = v26;
      _os_log_impl(&dword_1CC29C000, v25, OS_LOG_TYPE_DEFAULT, "[%@] was created", buf, 0xCu);

    }
  }

  return v19;
}

- (void)sevenDayAnalysisScheduler:(id)a3 didSuccessfullyCompleteAnalysisWithSample:(id)a4 onboardedWithinAnalysisInterval:(BOOL)a5 featureStatus:(id)a6
{
  _BOOL8 v6;
  id v9;
  HDHRAFibBurdenNotificationModeDeterminer *modeDeterminer;
  void *v11;
  id v12;
  NSObject *queue;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v6 = a5;
  v9 = a6;
  modeDeterminer = self->_modeDeterminer;
  v18 = 0;
  -[HDHRAFibBurdenNotificationModeDeterminer notificationModeForCurrentValue:featureStatus:onboardedWithinAnalysisInterval:error:](modeDeterminer, "notificationModeForCurrentValue:featureStatus:onboardedWithinAnalysisInterval:error:", a4, v9, v6, &v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v18;
  if (v11)
  {
    queue = self->_queue;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __151__HDHRAFibBurdenNotificationManager_sevenDayAnalysisScheduler_didSuccessfullyCompleteAnalysisWithSample_onboardedWithinAnalysisInterval_featureStatus___block_invoke;
    v15[3] = &unk_1E87EFAE0;
    v15[4] = self;
    v16 = v11;
    v17 = v9;
    dispatch_sync(queue, v15);

  }
  else
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[HDHRAFibBurdenNotificationManager sevenDayAnalysisScheduler:didSuccessfullyCompleteAnalysisWithSample:onboardedWithinAnalysisInterval:featureStatus:].cold.1();

  }
}

void __151__HDHRAFibBurdenNotificationManager_sevenDayAnalysisScheduler_didSuccessfullyCompleteAnalysisWithSample_onboardedWithinAnalysisInterval_featureStatus___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __151__HDHRAFibBurdenNotificationManager_sevenDayAnalysisScheduler_didSuccessfullyCompleteAnalysisWithSample_onboardedWithinAnalysisInterval_featureStatus___block_invoke_2;
  v6[3] = &unk_1E87EF8E0;
  v7 = v2;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  objc_msgSend(v3, "_sendNotificationWithMode:completion:", v7, v6);

}

void __151__HDHRAFibBurdenNotificationManager_sevenDayAnalysisScheduler_didSuccessfullyCompleteAnalysisWithSample_onboardedWithinAnalysisInterval_featureStatus___block_invoke_2(_QWORD *a1)
{
  HDHRAFibBurdenNotificationAnalyticsEvent *v2;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;
  HDHRAFibBurdenNotificationAnalyticsEvent *v6;

  v2 = [HDHRAFibBurdenNotificationAnalyticsEvent alloc];
  v3 = a1[4];
  v4 = a1[5];
  WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 8));
  v6 = -[HDHRAFibBurdenNotificationAnalyticsEvent initWithNotificationMode:featureStatus:profile:](v2, "initWithNotificationMode:featureStatus:profile:", v3, v4, WeakRetained);

  objc_msgSend(*(id *)(a1[6] + 48), "submitEvent:error:", v6, 0);
}

- (void)_sendNotificationWithMode:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  HDHRAFibBurdenNotificationManager *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HDHRAFibBurdenNotificationManager _buildNotificationForMode:](self, "_buildNotificationForMode:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __74__HDHRAFibBurdenNotificationManager__sendNotificationWithMode_completion___block_invoke;
    v9[3] = &unk_1E87EF6C8;
    v9[4] = self;
    v10 = v6;
    -[HDHRAFibBurdenNotificationManager _sendNotificationRequest:completion:](self, "_sendNotificationRequest:completion:", v7, v9);

  }
  else
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = self;
      _os_log_impl(&dword_1CC29C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did not generate notification for mode, will not post notification", buf, 0xCu);
    }

  }
}

void __74__HDHRAFibBurdenNotificationManager__sendNotificationWithMode_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;

  if (a2)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 40);
    v6 = *(_QWORD *)(v4 + 16);
    v7 = *(void (**)(uint64_t))(v6 + 16);
    v9 = a3;
    v7(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNotificationSentDate:", v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (id)_userNotificationCenter
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "notificationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_generateExpirationDateWithCurrentDate:(id)a3
{
  HKCalendarCache *calendarCache;
  id v4;
  void *v5;
  void *v6;

  calendarCache = self->_calendarCache;
  v4 = a3;
  -[HKCalendarCache currentCalendar](calendarCache, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_dateByAddingDays:toDate:", 1, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_sendNotificationRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__HDHRAFibBurdenNotificationManager__sendNotificationRequest_completion___block_invoke;
  block[3] = &unk_1E87EFB08;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __73__HDHRAFibBurdenNotificationManager__sendNotificationRequest_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = (id)objc_opt_class();
    v3 = v9;
    _os_log_impl(&dword_1CC29C000, v2, OS_LOG_TYPE_DEFAULT, "[%@] About to show AFib Burden Report notification", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "_userNotificationCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__HDHRAFibBurdenNotificationManager__sendNotificationRequest_completion___block_invoke_212;
  v6[3] = &unk_1E87EF6C8;
  v5 = *(_QWORD *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "postNotificationWithRequest:completion:", v5, v6);

}

void __73__HDHRAFibBurdenNotificationManager__sendNotificationRequest_completion___block_invoke_212(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __73__HDHRAFibBurdenNotificationManager__sendNotificationRequest_completion___block_invoke_212_cold_1(a1, (uint64_t)v4, v5);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)_buildNotificationForMode:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  HDHRAFibBurdenNotificationManager *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  (*((void (**)(void))self->_dateGenerator + 2))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "type");
  if (v6 != 3)
  {
    if (v6 == 2)
    {
      _HKInitializeLogging();
      HKHRAFibBurdenLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
LABEL_10:

        -[HDHRAFibBurdenNotificationManager _buildValueNotificationForMode:currentDate:](self, "_buildValueNotificationForMode:currentDate:", v4, v5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      v16 = 138543362;
      v17 = self;
      v8 = "[%{public}@] Preparing notification with current and previous value";
    }
    else
    {
      if (v6 != 1)
      {
        v14 = 0;
        goto LABEL_12;
      }
      _HKInitializeLogging();
      HKHRAFibBurdenLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_10;
      v16 = 138543362;
      v17 = self;
      v8 = "[%{public}@] Preparing notification with current value only";
    }
    _os_log_impl(&dword_1CC29C000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v16, 0xCu);
    goto LABEL_10;
  }
  v9 = (void *)objc_opt_class();
  -[HDHRAFibBurdenNotificationManager _generateExpirationDateWithCurrentDate:](self, "_generateExpirationDateWithCurrentDate:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "shouldForwardToWatch");
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_buildNotificationForLackOfAFibBurdenWithCurrentDate:expirationDate:shouldForwardToWatch:uuid:", v5, v10, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v14;
}

- (id)_buildValueNotificationForMode:(id)a3 currentDate:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  unsigned int v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "currentPercentage");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_8;
  v9 = (void *)v8;
  objc_msgSend(v6, "currentValueClamped");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_7;
  v11 = (void *)v10;
  objc_msgSend(v6, "currentValueDateInterval");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {

LABEL_7:
    goto LABEL_8;
  }
  v13 = (void *)v12;
  objc_msgSend(v6, "currentValueUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)objc_opt_class();
    objc_msgSend(v6, "currentPercentage");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentValueClamped");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v31, "BOOLValue");
    objc_msgSend(v6, "previousPercentage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "previousValueClamped");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v30, "BOOLValue");
    objc_msgSend(v6, "currentValueDateInterval");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "startDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentValueDateInterval");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "endDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDHRAFibBurdenNotificationManager _generateExpirationDateWithCurrentDate:](self, "_generateExpirationDateWithCurrentDate:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentValueUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCalendarCache currentCalendar](self->_calendarCache, "currentCalendar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_buildNotificationForAFibBurdenCurrentPercentage:isCurrentValueClamped:previousPercentage:isPreviousValueClamped:startDate:endDate:currentDate:expirationDate:uuid:calendar:", v32, v28, v26, v25, v16, v17, v7, v18, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
LABEL_8:
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    -[HDHRAFibBurdenNotificationManager _buildValueNotificationForMode:currentDate:].cold.1((uint64_t)self, v23);

  v22 = 0;
LABEL_11:

  return v22;
}

+ (id)_buildNotificationBodyForCurrentPercentageString:(id)a3 isCurrentValueClamped:(BOOL)a4 previousPercentageString:(id)a5 isPreviousValueClamped:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v19;
  id v20;
  id v21;
  uint64_t v22;

  v6 = a6;
  v7 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a3;
  +[HDHRAFibBurdenNotificationManager _notificationBodyKeyForCurrentPercentageString:isCurrentValueClamped:previousPercentageString:isPreviousValueClamped:](HDHRAFibBurdenNotificationManager, "_notificationBodyKeyForCurrentPercentageString:isCurrentValueClamped:previousPercentageString:isPreviousValueClamped:", v10, v7, v9, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB3940];
  if (v9)
  {
    v19 = v10;
    v20 = v9;
    v13 = (void *)MEMORY[0x1E0C99D20];
    v14 = &v19;
    v15 = 2;
  }
  else
  {
    v21 = v10;
    v13 = (void *)MEMORY[0x1E0C99D20];
    v14 = &v21;
    v15 = 1;
  }
  objc_msgSend(v13, "arrayWithObjects:count:", v14, v15, v19, v20, v21, v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedUserNotificationStringForKey:arguments:", v11, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_notificationBodyKeyForCurrentPercentageString:(id)a3 isCurrentValueClamped:(BOOL)a4 previousPercentageString:(id)a5 isPreviousValueClamped:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v8;
  id v9;
  id v10;
  const __CFString *v11;
  const __CFString *v12;
  BOOL v13;
  const __CFString *v14;
  int v15;

  v6 = a6;
  v8 = a4;
  v9 = a3;
  v10 = a5;
  if (v10)
  {
    if (v8)
    {
      v11 = CFSTR("AFIB_BURDEN_TWO_WEEK_NOTIFICATION_BODY_FIRST_CLAMPED_SECOND_PERCENT");
      v12 = CFSTR("AFIB_BURDEN_TWO_WEEK_NOTIFICATION_BODY_FIRST_CLAMPED_SECOND_CLAMPED_SAME");
      v13 = !v6;
    }
    else
    {
      if (v6)
      {
        v14 = CFSTR("AFIB_BURDEN_TWO_WEEK_NOTIFICATION_BODY_FIRST_PERCENT_SECOND_CLAMPED");
        goto LABEL_11;
      }
      v15 = objc_msgSend(v9, "isEqualToString:", v10);
      v11 = CFSTR("AFIB_BURDEN_TWO_WEEK_NOTIFICATION_BODY_FIRST_PERCENT_SECOND_PERCENT");
      v12 = CFSTR("AFIB_BURDEN_TWO_WEEK_NOTIFICATION_BODY_FIRST_PERCENT_SECOND_PERCENT_SAME");
      v13 = v15 == 0;
    }
  }
  else
  {
    v11 = CFSTR("AFIB_BURDEN_SINGLE_WEEK_NOTIFICATION_BODY_PERCENT");
    v12 = CFSTR("AFIB_BURDEN_SINGLE_WEEK_NOTIFICATION_BODY_CLAMPED");
    v13 = !v8;
  }
  if (v13)
    v14 = v11;
  else
    v14 = v12;
LABEL_11:

  return (id)v14;
}

+ (id)_buildNotificationForAFibBurdenCurrentPercentage:(id)a3 isCurrentValueClamped:(BOOL)a4 previousPercentage:(id)a5 isPreviousValueClamped:(BOOL)a6 startDate:(id)a7 endDate:(id)a8 currentDate:(id)a9 expirationDate:(id)a10 uuid:(id)a11 calendar:(id)a12
{
  _BOOL8 v14;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  void *v38;
  void *v39;
  id v40;
  _BOOL4 v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  _QWORD v48[4];
  _QWORD v49[6];

  v14 = a6;
  v41 = a4;
  v49[4] = *MEMORY[0x1E0C80C00];
  v16 = a5;
  v47 = (id)*MEMORY[0x1E0D2FC48];
  v17 = (void *)MEMORY[0x1E0CB3940];
  v42 = a12;
  v44 = a11;
  v37 = a10;
  v18 = a9;
  v40 = a8;
  v19 = a7;
  v20 = a3;
  objc_msgSend(v17, "localizedUserNotificationStringForKey:arguments:", CFSTR("AFIB_BURDEN_NOTIFICATION_TITLE"), MEMORY[0x1E0C9AA60]);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v21, "setNumberStyle:", 1);
  objc_msgSend(v21, "setMaximumFractionDigits:", 0);
  objc_msgSend(v21, "stringFromNumber:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = v16;
  if (v16)
  {
    objc_msgSend(v21, "stringFromNumber:", v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }
  +[HDHRAFibBurdenNotificationManager _notificationBodyKeyForCurrentPercentageString:isCurrentValueClamped:previousPercentageString:isPreviousValueClamped:](HDHRAFibBurdenNotificationManager, "_notificationBodyKeyForCurrentPercentageString:isCurrentValueClamped:previousPercentageString:isPreviousValueClamped:", v22, v41, v23, v14, v37);
  v24 = objc_claimAutoreleasedReturnValue();
  +[HDHRAFibBurdenNotificationManager _buildNotificationBodyForCurrentPercentageString:isCurrentValueClamped:previousPercentageString:isPreviousValueClamped:](HDHRAFibBurdenNotificationManager, "_buildNotificationBodyForCurrentPercentageString:isCurrentValueClamped:previousPercentageString:isPreviousValueClamped:", v22, v41, v23, v14);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_alloc_init(MEMORY[0x1E0CEC6E0]);
  objc_msgSend(v26, "setTitle:", v46);
  objc_msgSend(v26, "setBody:", v25);
  objc_msgSend(v26, "setCategoryIdentifier:", v47);
  objc_msgSend(v26, "setThreadIdentifier:", v47);
  objc_msgSend(MEMORY[0x1E0CEC6E8], "soundWithAlertType:", 25);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setSound:");
  objc_msgSend(v26, "setDate:", v18);

  objc_msgSend(v26, "setExpirationDate:", v38);
  +[HDHRAFibBurdenNotificationManager _generateDateRangeStringForAnalysisSampleWithStartDate:endDate:calendar:](HDHRAFibBurdenNotificationManager, "_generateDateRangeStringForAnalysisSampleWithStartDate:endDate:calendar:", v19, v40, v42);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)MEMORY[0x1E0C99E08];
  v48[0] = CFSTR("currentPercentage");
  v48[1] = CFSTR("dateRange");
  v49[0] = v22;
  v49[1] = v27;
  v43 = (void *)v24;
  v49[2] = v24;
  v48[2] = CFSTR("watchBodyKey");
  v48[3] = CFSTR("firstValueClamped");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v41);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "dictionaryWithDictionary:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v23, CFSTR("previousPercentage"));
  objc_msgSend(MEMORY[0x1E0CB6380], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A78]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  _HKCreateURLForSampleType();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "absoluteString");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v34, *MEMORY[0x1E0CB7770]);

  objc_msgSend(v31, "setObject:forKeyedSubscript:", &unk_1E87FED80, *MEMORY[0x1E0CB7760]);
  objc_msgSend(v26, "setUserInfo:", v31);
  objc_msgSend(MEMORY[0x1E0CEC740], "requestWithIdentifier:content:trigger:", v44, v26, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

+ (id)_buildNotificationForLackOfAFibBurdenWithCurrentDate:(id)a3 expirationDate:(id)a4 shouldForwardToWatch:(BOOL)a5 uuid:(id)a6
{
  _BOOL4 v6;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v6 = a5;
  v9 = *MEMORY[0x1E0D2FC40];
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = a6;
  v12 = a4;
  v13 = a3;
  v14 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v10, "localizedUserNotificationStringForKey:arguments:", CFSTR("AFIB_BURDEN_LACK_OF_SAMPLE_NOTIFICATION_TITLE"), MEMORY[0x1E0C9AA60]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("AFIB_BURDEN_LACK_OF_SAMPLE_NOTIFICATION_BODY"), v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(MEMORY[0x1E0CEC6E0]);
  objc_msgSend(v17, "setTitle:", v15);
  objc_msgSend(v17, "setBody:", v16);
  objc_msgSend(v17, "setCategoryIdentifier:", v9);
  objc_msgSend(v17, "setThreadIdentifier:", v9);
  objc_msgSend(MEMORY[0x1E0CEC6E8], "soundWithAlertType:", 25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSound:", v18);
  objc_msgSend(v17, "setDate:", v13);

  objc_msgSend(v17, "setExpirationDate:", v12);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", MEMORY[0x1E0C9AA70]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6380], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A78]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  _HKCreateURLForSampleType();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "absoluteString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0CB7770]);

  objc_msgSend(v19, "setObject:forKeyedSubscript:", &unk_1E87FED80, *MEMORY[0x1E0CB7760]);
  objc_msgSend(v19, "setObject:forKeyedSubscript:", CFSTR("AFIB_BURDEN_LACK_OF_SAMPLE_NOTIFICATION_BODY"), CFSTR("watchBodyKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0CB7768]);

  objc_msgSend(v17, "setUserInfo:", v19);
  objc_msgSend(MEMORY[0x1E0CEC740], "requestWithIdentifier:content:trigger:", v11, v17, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)_generateDateRangeStringForAnalysisSampleWithStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5 isUnitTesting:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a6;
  v9 = a5;
  v10 = (objc_class *)MEMORY[0x1E0CB3590];
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(v10);
  if (v6)
  {
    objc_msgSend(v9, "locale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLocale:", v14);

    objc_msgSend(v9, "timeZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTimeZone:", v15);

  }
  objc_msgSend(v13, "setDateStyle:", 2);
  objc_msgSend(v13, "setTimeStyle:", 0);
  objc_msgSend(v11, "dateByAddingTimeInterval:", -1.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "stringFromDate:toDate:", v12, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_generateDateRangeStringForAnalysisSampleWithStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5
{
  return +[HDHRAFibBurdenNotificationManager _generateDateRangeStringForAnalysisSampleWithStartDate:endDate:calendar:isUnitTesting:](HDHRAFibBurdenNotificationManager, "_generateDateRangeStringForAnalysisSampleWithStartDate:endDate:calendar:isUnitTesting:", a3, a4, a5, 0);
}

+ (id)_julianDayFromDate:(id)a3 calendar:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "hk_dayIndexWithCalendar:", v5);
  objc_msgSend(v5, "components:fromDate:", 32, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "hour");
  objc_msgSend(MEMORY[0x1E0C99D68], "hk_dateOnDayIndex:atHour:calendar:", v7, v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_eventSubmissionManager, 0);
  objc_storeStrong((id *)&self->_notificationLastSentDateStore, 0);
  objc_storeStrong((id *)&self->_modeDeterminer, 0);
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_storeStrong(&self->_dateGenerator, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)sevenDayAnalysisScheduler:didSuccessfullyCompleteAnalysisWithSample:onboardedWithinAnalysisInterval:featureStatus:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_3(&dword_1CC29C000, v0, (uint64_t)v0, "[%{public}@] Not showing notification as we encountered an error when determining mode: %{public}@", v1);
  OUTLINED_FUNCTION_2();
}

void __73__HDHRAFibBurdenNotificationManager__sendNotificationRequest_completion___block_invoke_212_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 138412546;
  v8 = (id)objc_opt_class();
  v9 = 2112;
  v10 = a2;
  v5 = v8;
  OUTLINED_FUNCTION_1_3(&dword_1CC29C000, a3, v6, "[%@] error requesting notification: %@)", (uint8_t *)&v7);

}

- (void)_buildValueNotificationForMode:(uint64_t)a1 currentDate:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_1CC29C000, a2, OS_LOG_TYPE_FAULT, "[%{public}@] Current value indicated to be present but not all components of current value present.", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
