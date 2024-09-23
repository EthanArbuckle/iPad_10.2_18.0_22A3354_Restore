@implementation DSCallStatisticsAggregator

- (DSCallStatisticsAggregator)init
{
  DSCallStatisticsAggregator *v3;
  DSCallStatisticsAggregator *v4;
  uint64_t v5;
  NSDate *referenceDate;
  NSCondition *v7;
  NSCondition *generationLock;
  uint64_t v9;
  NSMutableArray *callLog;
  DSCallStatisticsAggregator *v11;
  objc_super v13;

  if (+[DSEntitlementUtilities currentProcessHasEntitlement:](DSEntitlementUtilities, "currentProcessHasEntitlement:", CFSTR("com.apple.DiagnosticsSupport.CallStatsAccess")))
  {
    v13.receiver = self;
    v13.super_class = (Class)DSCallStatisticsAggregator;
    v3 = -[DSCallStatisticsAggregator init](&v13, "init");
    v4 = v3;
    if (v3)
    {
      *(_WORD *)&v3->_futureDateDetected = 0;
      v5 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      referenceDate = v4->_referenceDate;
      v4->_referenceDate = (NSDate *)v5;

      v7 = objc_opt_new(NSCondition);
      generationLock = v4->_generationLock;
      v4->_generationLock = v7;

      v4->_generationComplete = 0;
      v9 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 14));
      callLog = v4->_callLog;
      v4->_callLog = (NSMutableArray *)v9;

      v4->_missingDaysRemaining = 14;
      *(_QWORD *)&v4->_totals.droppedCallCount = 0;
      *(_QWORD *)&v4->_totals.droppedVoLTECallCount = 0;
      v4->_totals.deviceDroppedCallCount = 0;
      *(_QWORD *)&v4->_accumulated.droppedVoLTECallCount = 0;
      *(_QWORD *)&v4->_accumulated.droppedCallCount = 0;
      v4->_accumulated.deviceDroppedCallCount = 0;
    }
    self = v4;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)beginAggregation
{
  void *v3;
  void *v4;
  DSGeneralLogCollector *v5;
  void *v6;
  void *v7;
  void *v8;
  void **v9;
  uint64_t v10;
  id (*v11)(uint64_t, void *);
  void *v12;
  DSCallStatisticsAggregator *v13;
  uint64_t *v14;
  id v15;
  id location;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DSCallStatisticsAggregator generationLock](self, "generationLock"));
  objc_msgSend(v3, "lock");

  -[DSCallStatisticsAggregator setGenerationComplete:](self, "setGenerationComplete:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DSCallStatisticsAggregator generationLock](self, "generationLock"));
  objc_msgSend(v4, "unlock");

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v5 = -[DSGeneralLogCollector initWithLogIDs:]([DSGeneralLogCollector alloc], "initWithLogIDs:", &off_1C138);
  objc_initWeak(&location, self);
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = __46__DSCallStatisticsAggregator_beginAggregation__block_invoke;
  v12 = &unk_18A10;
  v13 = self;
  v14 = &v17;
  objc_copyWeak(&v15, &location);
  -[DSGeneralLogCollector enumerateLogLinesWithBlock:](v5, "enumerateLogLinesWithBlock:", &v9);
  -[DSCallStatisticsAggregator _flushAccumulatedLogDataWithDate:](self, "_flushAccumulatedLogDataWithDate:", v18[5], v9, v10, v11, v12, v13, v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DSCallStatisticsAggregator generationLock](self, "generationLock"));
  objc_msgSend(v6, "lock");

  -[DSCallStatisticsAggregator setGenerationComplete:](self, "setGenerationComplete:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DSCallStatisticsAggregator generationLock](self, "generationLock"));
  objc_msgSend(v7, "signal");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DSCallStatisticsAggregator generationLock](self, "generationLock"));
  objc_msgSend(v8, "unlock");

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v17, 8);
}

id __46__DSCallStatisticsAggregator_beginAggregation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  _BOOL4 v19;
  BOOL v20;
  id v21;
  NSObject *WeakRetained;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v39;
  unint64_t v40;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((_DWORD)v4)
  {
    v5 = DiagnosticLogHandleForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __46__DSCallStatisticsAggregator_beginAggregation__block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_getAndValidateDateFromLogLine:", v3));
    if (v6)
    {
      v14 = (unint64_t)objc_msgSend(*(id *)(a1 + 32), "_getDaysBetween:and:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v6);
      if ((v14 & 0x8000000000000000) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "setOutOfOrderDateDetected:", 1);
        v30 = DiagnosticLogHandleForCategory(3);
        WeakRetained = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
          __46__DSCallStatisticsAggregator_beginAggregation__block_invoke_cold_3(WeakRetained, v31, v32, v33, v34, v35, v36, v37);
      }
      else
      {
        v15 = v14;
        v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        v17 = DiagnosticLogHandleForCategory(3);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
        if (v15)
          v20 = 1;
        else
          v20 = v16 == 0;
        if (v20)
        {
          if (v19)
          {
            v39 = 134217984;
            v40 = v15;
            _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "date change, flushing new log entry; daysElapsed=%ld",
              (uint8_t *)&v39,
              0xCu);
          }

          objc_msgSend(*(id *)(a1 + 32), "_flushAccumulatedLogDataWithDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
          objc_msgSend(*(id *)(a1 + 32), "_fillCallLogWithMissingDays:fromDate:", v15 - 1, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
        }
        else
        {
          if (v19)
          {
            LOWORD(v39) = 0;
            _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "new log line contains the same date as a previous one, accumulating", (uint8_t *)&v39, 2u);
          }

        }
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
        if (WeakRetained)
        {
          HIDWORD(WeakRetained[3].isa) += objc_msgSend(v3, "integerFromFieldAtIndex:", 12);
          LODWORD(WeakRetained[4].isa) += objc_msgSend(v3, "integerFromFieldAtIndex:", 14);
          HIDWORD(WeakRetained[4].isa) += objc_msgSend(v3, "integerFromFieldAtIndex:", 15);
          LODWORD(WeakRetained[5].isa) += objc_msgSend(v3, "integerFromFieldAtIndex:", 4);
          HIDWORD(WeakRetained[5].isa) += objc_msgSend(v3, "integerFromFieldAtIndex:", 5);
        }
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v6);
      }
    }
    else
    {
      v21 = DiagnosticLogHandleForCategory(3);
      WeakRetained = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
        __46__DSCallStatisticsAggregator_beginAggregation__block_invoke_cold_2(WeakRetained, v23, v24, v25, v26, v27, v28, v29);
    }

  }
  return v4;
}

- (void)cancel
{
  -[DSCallStatisticsAggregator setCancelled:](self, "setCancelled:", 1);
}

- (id)getSynchronousResult
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[7];
  _QWORD v17[7];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DSCallStatisticsAggregator generationLock](self, "generationLock"));
  objc_msgSend(v3, "lock");

  if (!-[DSCallStatisticsAggregator generationComplete](self, "generationComplete"))
  {
    do
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[DSCallStatisticsAggregator generationLock](self, "generationLock"));
      objc_msgSend(v4, "wait");

    }
    while (!-[DSCallStatisticsAggregator generationComplete](self, "generationComplete"));
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DSCallStatisticsAggregator generationLock](self, "generationLock"));
  objc_msgSend(v5, "unlock");

  if (-[DSCallStatisticsAggregator isCancelled](self, "isCancelled"))
    return 0;
  v16[0] = CFSTR("futureDateDetected");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[DSCallStatisticsAggregator futureDateDetected](self, "futureDateDetected")));
  v17[0] = v7;
  v16[1] = CFSTR("outOfOrderDateDetected");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[DSCallStatisticsAggregator outOfOrderDateDetected](self, "outOfOrderDateDetected")));
  v17[1] = v8;
  v16[2] = CFSTR("totalLoggedDayCount");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DSCallStatisticsAggregator callLog](self, "callLog"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count")));
  v17[2] = v10;
  v16[3] = CFSTR("totalPlacedCallCount");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_totals.placedCallCount));
  v17[3] = v11;
  v16[4] = CFSTR("totalDroppedCallCount");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_totals.droppedCallCount));
  v17[4] = v12;
  v16[5] = CFSTR("totalDeviceDroppedCallCount");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_totals.deviceDroppedCallCount));
  v17[5] = v13;
  v16[6] = CFSTR("callLog");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DSCallStatisticsAggregator callLog](self, "callLog"));
  v17[6] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 7));

  return v15;
}

- (BOOL)_isDateInRange:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  NSObject *v9;
  int v11;
  double v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DSCallStatisticsAggregator referenceDate](self, "referenceDate"));
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  v8 = DiagnosticLogHandleForCategory(3);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134217984;
    v12 = v7;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "interval since now: %f", (uint8_t *)&v11, 0xCu);
  }

  if (v7 <= 86400.0)
    return v7 > -1209600.0;
  -[DSCallStatisticsAggregator setFutureDateDetected:](self, "setFutureDateDetected:", 1);
  return 0;
}

- (id)_getAndValidateDateFromLogLine:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringFromFieldAtIndex:", 10));
  if (!v4)
    goto LABEL_5;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DSDateFormatter sharedFormatter](DSDateFormatter, "sharedFormatter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "formatterWithType:", 3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateFromString:", v4));

  if (v7 && !-[DSCallStatisticsAggregator _isDateInRange:](self, "_isDateInRange:", v7))
  {

LABEL_5:
    v7 = 0;
  }

  return v7;
}

- (void)_resetAccumulator
{
  *(_QWORD *)&self->_accumulated.droppedVoLTECallCount = 0;
  *(_QWORD *)&self->_accumulated.droppedCallCount = 0;
  self->_accumulated.deviceDroppedCallCount = 0;
}

- (void)_fillCallLogWithMissingDays:(int64_t)a3 fromDate:(id)a4
{
  id v6;
  int64_t v7;
  int64_t v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[6];
  _QWORD v19[6];
  uint8_t buf[4];
  int64_t v21;
  __int16 v22;
  id v23;

  v6 = a4;
  v7 = -[DSCallStatisticsAggregator missingDaysRemaining](self, "missingDaysRemaining");
  if (v7 >= a3)
    v8 = a3;
  else
    v8 = v7;
  v9 = DiagnosticLogHandleForCategory(3);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v21 = v8;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "filling call log with empty data for %ld days starting from [%@]", buf, 0x16u);
  }

  if (v8 >= 1)
  {
    v11 = 0;
    do
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingTimeInterval:", (double)++v11 * 86400.0));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[DSDateFormatter sharedFormatter](DSDateFormatter, "sharedFormatter"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "formatterWithType:", 4));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringFromDate:", v12));

      if (v15)
      {
        v18[0] = CFSTR("date");
        v18[1] = CFSTR("placedCallCount");
        v19[0] = v15;
        v19[1] = &off_1C0E0;
        v18[2] = CFSTR("droppedCallCount");
        v18[3] = CFSTR("deviceDroppedCallCount");
        v19[2] = &off_1C0E0;
        v19[3] = &off_1C0E0;
        v18[4] = CFSTR("droppedWiFiCallCount");
        v18[5] = CFSTR("droppedVoLTECallCount");
        v19[4] = &off_1C0E0;
        v19[5] = &off_1C0E0;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 6));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[DSCallStatisticsAggregator callLog](self, "callLog"));
        objc_msgSend(v17, "addObject:", v16);

      }
    }
    while (v8 != v11);
  }
  -[DSCallStatisticsAggregator setMissingDaysRemaining:](self, "setMissingDaysRemaining:", (char *)-[DSCallStatisticsAggregator missingDaysRemaining](self, "missingDaysRemaining") - v8);

}

- (int64_t)_getDaysBetween:(id)a3 and:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int64_t v8;
  double v9;
  id v10;
  NSObject *v11;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  int64_t v18;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_msgSend(v6, "timeIntervalSinceDate:", v5);
    v8 = (uint64_t)(v9 / 86400.0);
  }
  v10 = DiagnosticLogHandleForCategory(3);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412802;
    v14 = v5;
    v15 = 2112;
    v16 = v7;
    v17 = 2048;
    v18 = v8;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "days between [%@] and [%@]: %ld", (uint8_t *)&v13, 0x20u);
  }

  return v8;
}

- (void)_flushAccumulatedLogDataWithDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[6];
  _QWORD v16[6];

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[DSDateFormatter sharedFormatter](DSDateFormatter, "sharedFormatter"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "formatterWithType:", 4));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringFromDate:", v4));

    if (v7)
    {
      v16[0] = v7;
      v15[0] = CFSTR("date");
      v15[1] = CFSTR("placedCallCount");
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_accumulated.placedCallCount));
      v16[1] = v8;
      v15[2] = CFSTR("droppedCallCount");
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_accumulated.droppedCallCount));
      v16[2] = v9;
      v15[3] = CFSTR("deviceDroppedCallCount");
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_accumulated.deviceDroppedCallCount));
      v16[3] = v10;
      v15[4] = CFSTR("droppedWiFiCallCount");
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_accumulated.droppedWiFiCallCount));
      v16[4] = v11;
      v15[5] = CFSTR("droppedVoLTECallCount");
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_accumulated.droppedVoLTECallCount));
      v16[5] = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 6));

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[DSCallStatisticsAggregator callLog](self, "callLog"));
      objc_msgSend(v14, "addObject:", v13);

      self->_totals.deviceDroppedCallCount += self->_accumulated.deviceDroppedCallCount;
      *(int32x4_t *)&self->_totals.droppedCallCount = vaddq_s32(*(int32x4_t *)&self->_totals.droppedCallCount, *(int32x4_t *)&self->_accumulated.droppedCallCount);

    }
  }
  -[DSCallStatisticsAggregator _resetAccumulator](self, "_resetAccumulator");
}

- (BOOL)futureDateDetected
{
  return self->_futureDateDetected;
}

- (void)setFutureDateDetected:(BOOL)a3
{
  self->_futureDateDetected = a3;
}

- (BOOL)outOfOrderDateDetected
{
  return self->_outOfOrderDateDetected;
}

- (void)setOutOfOrderDateDetected:(BOOL)a3
{
  self->_outOfOrderDateDetected = a3;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (NSMutableArray)callLog
{
  return self->_callLog;
}

- (void)setCallLog:(id)a3
{
  objc_storeStrong((id *)&self->_callLog, a3);
}

- (NSCondition)generationLock
{
  return self->_generationLock;
}

- (void)setGenerationLock:(id)a3
{
  objc_storeStrong((id *)&self->_generationLock, a3);
}

- (BOOL)generationComplete
{
  return self->_generationComplete;
}

- (void)setGenerationComplete:(BOOL)a3
{
  self->_generationComplete = a3;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (int64_t)missingDaysRemaining
{
  return self->_missingDaysRemaining;
}

- (void)setMissingDaysRemaining:(int64_t)a3
{
  self->_missingDaysRemaining = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generationLock, 0);
  objc_storeStrong((id *)&self->_callLog, 0);
  objc_storeStrong((id *)&self->_referenceDate, 0);
}

void __46__DSCallStatisticsAggregator_beginAggregation__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_0, a1, a3, "scan cancelled, aborting", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __46__DSCallStatisticsAggregator_beginAggregation__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_0, a1, a3, "log line date is unparseable or not valid, skipping", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __46__DSCallStatisticsAggregator_beginAggregation__block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_0, a1, a3, "out of order date detected, skipping", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
