@implementation FCTypicalDayProvider

- (FCTypicalDayProvider)initWithDateProvider:(id)a3 profile:(id)a4 serviceQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  FCTypicalDayProvider *v12;
  FCTypicalDayProvider *v13;
  id WeakRetained;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)FCTypicalDayProvider;
  v12 = -[FCTypicalDayProvider init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dateProvider, a3);
    objc_storeWeak((id *)&v13->_profile, v10);
    objc_storeStrong((id *)&v13->_serviceQueue, a5);
    WeakRetained = objc_loadWeakRetained((id *)&v13->_profile);
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v13, v13->_serviceQueue);

  }
  return v13;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  objc_super v5;

  if (notify_is_valid_token(self->_significantTimeChangeToken))
  {
    notify_cancel(self->_significantTimeChangeToken);
    self->_significantTimeChangeToken = -1;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "currentActivitySummaryHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)FCTypicalDayProvider;
  -[FCTypicalDayProvider dealloc](&v5, sel_dealloc);
}

- (void)profileDidBecomeReady:(id)a3
{
  NSObject *serviceQueue;
  id v5;
  id v6;
  void *v7;
  FITypicalDayActivityModel *v8;
  FITypicalDayActivityModel *typicalDayModel;
  NSDate *v10;
  NSDate *lastRebuildDate;
  NSObject *v12;
  void *v13;
  uint8_t v14[16];

  serviceQueue = self->_serviceQueue;
  v5 = a3;
  dispatch_assert_queue_V2(serviceQueue);
  v6 = objc_alloc(MEMORY[0x1E0D21790]);
  -[FCTypicalDayProvider _typicalDayIntervalFromToday](self, "_typicalDayIntervalFromToday");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (FITypicalDayActivityModel *)objc_msgSend(v6, "initForDateInterval:delegate:", v7, self);
  typicalDayModel = self->_typicalDayModel;
  self->_typicalDayModel = v8;

  -[FCCDateProvider coachingDate](self->_dateProvider, "coachingDate");
  v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastRebuildDate = self->_lastRebuildDate;
  self->_lastRebuildDate = v10;

  _HKInitializeLogging();
  v12 = *MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1CC30F000, v12, OS_LOG_TYPE_DEFAULT, "Loaded typical day model", v14, 2u);
  }
  objc_msgSend(v5, "currentActivitySummaryHelper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addObserver:", self);
  -[FCTypicalDayProvider _onqueue_registerForSignificantTimeChanges](self, "_onqueue_registerForSignificantTimeChanges");
}

- (void)_onqueue_registerForSignificantTimeChanges
{
  const char *v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  objc_initWeak(&location, self);
  v3 = (const char *)objc_msgSend(CFSTR("SignificantTimeChangeNotification"), "UTF8String");
  v4 = MEMORY[0x1E0C80D38];
  v5 = MEMORY[0x1E0C80D38];
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __66__FCTypicalDayProvider__onqueue_registerForSignificantTimeChanges__block_invoke;
  v10 = &unk_1E88009E0;
  objc_copyWeak(&v11, &location);
  notify_register_dispatch(v3, &self->_significantTimeChangeToken, v4, &v7);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v7, v8, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__significantTimeChangeOccurred_, *MEMORY[0x1E0C99690], 0);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __66__FCTypicalDayProvider__onqueue_registerForSignificantTimeChanges__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_significantTimeChangeOccurred:", 0);

}

- (void)_significantTimeChangeOccurred:(id)a3
{
  NSObject *v4;
  NSObject *serviceQueue;
  _QWORD block[5];
  uint8_t buf[16];

  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CC30F000, v4, OS_LOG_TYPE_DEFAULT, "Significant time change occurred", buf, 2u);
  }
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__FCTypicalDayProvider__significantTimeChangeOccurred___block_invoke;
  block[3] = &unk_1E8800798;
  block[4] = self;
  dispatch_async(serviceQueue, block);
}

uint64_t __55__FCTypicalDayProvider__significantTimeChangeOccurred___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_rebuildTypicalDayModelForced:", 0);
}

- (void)_onqueue_rebuildTypicalDayModelForced:(BOOL)a3
{
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  id WeakRetained;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  -[FCCDateProvider coachingDate](self->_dateProvider, "coachingDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    goto LABEL_7;
  if (self->_lastRebuildDate)
  {
    -[FCCDateProvider coachingCalendar](self->_dateProvider, "coachingCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isDate:inSameDayAsDate:", v5, self->_lastRebuildDate);

    if (v7)
    {
      _HKInitializeLogging();
      v8 = *MEMORY[0x1E0CB5298];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        v9 = "Already rebuilt the typical day model today";
LABEL_13:
        _os_log_impl(&dword_1CC30F000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, 2u);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isProtectedDataAvailable");

  if ((v12 & 1) != 0)
  {
LABEL_7:
    -[FCTypicalDayProvider _typicalDayIntervalFromToday](self, "_typicalDayIntervalFromToday");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v13;
      _os_log_impl(&dword_1CC30F000, v14, OS_LOG_TYPE_DEFAULT, "Rebuilding typical day model with interval: %@", (uint8_t *)&v15, 0xCu);
    }
    -[FITypicalDayActivityModel rebuildWithInterval:](self->_typicalDayModel, "rebuildWithInterval:", v13);

    goto LABEL_10;
  }
  _HKInitializeLogging();
  v8 = *MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    v9 = "Waiting for protected to be available before rebuilding typical day model";
    goto LABEL_13;
  }
LABEL_10:

}

- (void)_onqueue_handleUpdatedActivitySummary:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_currentActivitySummary, a3);
  v5 = a3;
  -[FITypicalDayActivityModel handleUpdatedCurrentActivitySummary:](self->_typicalDayModel, "handleUpdatedCurrentActivitySummary:", v5);

}

- (id)_typicalDayIntervalFromToday
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[FCCDateProvider coachingCalendar](self->_dateProvider, "coachingCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCDateProvider coachingDate](self->_dateProvider, "coachingDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startOfDayForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "hk_startOfDateBySubtractingDays:fromDate:", *MEMORY[0x1E0D21748], v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v6, v5);

  return v7;
}

- (id)currentDate
{
  return (id)-[FCCDateProvider coachingDate](self->_dateProvider, "coachingDate");
}

- (id)currentCalendar
{
  return (id)-[FCCDateProvider coachingCalendar](self->_dateProvider, "coachingCalendar");
}

- (id)firstOnWristDateToday
{
  return 0;
}

- (BOOL)enumerateActivitySummariesFromDateComponents:(id)a3 toDateComponents:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  id WeakRetained;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;

  v10 = a6;
  v11 = (objc_class *)MEMORY[0x1E0D29400];
  v12 = a4;
  v13 = a3;
  v14 = [v11 alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v16 = (void *)objc_msgSend(v14, "initWithProfile:", WeakRetained);

  objc_msgSend(v16, "setShouldIncludePrivateProperties:", 1);
  objc_msgSend(v16, "setShouldIncludeStatistics:", 1);
  HDActivityCacheEntityPredicateForCachesInDateComponentsRange();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __100__FCTypicalDayProvider_enumerateActivitySummariesFromDateComponents_toDateComponents_error_handler___block_invoke;
  v20[3] = &unk_1E8800A08;
  v21 = v10;
  v18 = v10;
  LOBYTE(a5) = objc_msgSend(v16, "enumerateActivitySummariesWithPredicate:error:handler:", v17, a5, v20);

  return (char)a5;
}

uint64_t __100__FCTypicalDayProvider_enumerateActivitySummariesFromDateComponents_toDateComponents_error_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)clientProvidedUserStartOfDay
{
  return self->_userStartOfDay;
}

- (id)clientProvidedUserEndOfDay
{
  return self->_userEndOfDay;
}

- (id)onServiceQueue_currentActivityCacheSummary
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  return self->_currentActivitySummary;
}

- (void)currentActivitySummaryHelper:(id)a3 didUpdateTodayActivitySummary:(id)a4 changedFields:(unint64_t)a5
{
  id v6;
  NSObject *serviceQueue;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__FCTypicalDayProvider_currentActivitySummaryHelper_didUpdateTodayActivitySummary_changedFields___block_invoke;
  block[3] = &unk_1E8800A30;
  objc_copyWeak(&v11, &location);
  v10 = v6;
  v8 = v6;
  dispatch_async(serviceQueue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __97__FCTypicalDayProvider_currentActivitySummaryHelper_didUpdateTodayActivitySummary_changedFields___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_onqueue_handleUpdatedActivitySummary:", *(_QWORD *)(a1 + 32));

}

- (void)currentActivitySummaryHelper:(id)a3 didUpdateYesterdayActivitySummary:(id)a4 changedFields:(unint64_t)a5
{
  NSObject *v7;
  NSObject *serviceQueue;
  _QWORD block[5];
  uint8_t buf[4];
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v11 = a5;
      _os_log_impl(&dword_1CC30F000, v7, OS_LOG_TYPE_DEFAULT, "Yesterday summary changed, rebuilding typical day model (changed fields = %lu", buf, 0xCu);
    }
    serviceQueue = self->_serviceQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __101__FCTypicalDayProvider_currentActivitySummaryHelper_didUpdateYesterdayActivitySummary_changedFields___block_invoke;
    block[3] = &unk_1E8800798;
    block[4] = self;
    dispatch_async(serviceQueue, block);
  }
}

uint64_t __101__FCTypicalDayProvider_currentActivitySummaryHelper_didUpdateYesterdayActivitySummary_changedFields___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_rebuildTypicalDayModelForced:", 1);
}

- (FITypicalDayActivityModel)typicalDayModel
{
  return self->_typicalDayModel;
}

- (NSDate)userStartOfDay
{
  return self->_userStartOfDay;
}

- (void)setUserStartOfDay:(id)a3
{
  objc_storeStrong((id *)&self->_userStartOfDay, a3);
}

- (NSDate)userEndOfDay
{
  return self->_userEndOfDay;
}

- (void)setUserEndOfDay:(id)a3
{
  objc_storeStrong((id *)&self->_userEndOfDay, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userEndOfDay, 0);
  objc_storeStrong((id *)&self->_userStartOfDay, 0);
  objc_storeStrong((id *)&self->_typicalDayModel, 0);
  objc_storeStrong((id *)&self->_currentActivitySummary, 0);
  objc_storeStrong((id *)&self->_lastRebuildDate, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_dateProvider, 0);
}

@end
