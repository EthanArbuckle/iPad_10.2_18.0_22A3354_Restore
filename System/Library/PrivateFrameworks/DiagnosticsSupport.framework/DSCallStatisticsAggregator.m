@implementation DSCallStatisticsAggregator

- (DSCallStatisticsAggregator)init
{
  DSCallStatisticsAggregator *v3;
  DSCallStatisticsAggregator *v4;
  uint64_t v5;
  NSDate *referenceDate;
  uint64_t v7;
  NSCondition *generationLock;
  uint64_t v9;
  NSMutableArray *callLog;
  DSCallStatisticsAggregator *v11;
  objc_super v13;

  if (+[DSEntitlementUtilities currentProcessHasEntitlement:](DSEntitlementUtilities, "currentProcessHasEntitlement:", CFSTR("com.apple.DiagnosticsSupport.CallStatsAccess")))
  {
    v13.receiver = self;
    v13.super_class = (Class)DSCallStatisticsAggregator;
    v3 = -[DSCallStatisticsAggregator init](&v13, sel_init);
    v4 = v3;
    if (v3)
    {
      *(_WORD *)&v3->_futureDateDetected = 0;
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v5 = objc_claimAutoreleasedReturnValue();
      referenceDate = v4->_referenceDate;
      v4->_referenceDate = (NSDate *)v5;

      v7 = objc_opt_new();
      generationLock = v4->_generationLock;
      v4->_generationLock = (NSCondition *)v7;

      v4->_generationComplete = 0;
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 14);
      v9 = objc_claimAutoreleasedReturnValue();
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
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, void *);
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

  -[DSCallStatisticsAggregator generationLock](self, "generationLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[DSCallStatisticsAggregator setGenerationComplete:](self, "setGenerationComplete:", 0);
  -[DSCallStatisticsAggregator generationLock](self, "generationLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v5 = -[DSGeneralLogCollector initWithLogIDs:]([DSGeneralLogCollector alloc], "initWithLogIDs:", &unk_24E44DD18);
  objc_initWeak(&location, self);
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __46__DSCallStatisticsAggregator_beginAggregation__block_invoke;
  v12 = &unk_24E44A5F0;
  v13 = self;
  v14 = &v17;
  objc_copyWeak(&v15, &location);
  -[DSGeneralLogCollector enumerateLogLinesWithBlock:](v5, "enumerateLogLinesWithBlock:", &v9);
  -[DSCallStatisticsAggregator _flushAccumulatedLogDataWithDate:](self, "_flushAccumulatedLogDataWithDate:", v18[5], v9, v10, v11, v12, v13, v14);
  -[DSCallStatisticsAggregator generationLock](self, "generationLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");

  -[DSCallStatisticsAggregator setGenerationComplete:](self, "setGenerationComplete:", 1);
  -[DSCallStatisticsAggregator generationLock](self, "generationLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "signal");

  -[DSCallStatisticsAggregator generationLock](self, "generationLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v17, 8);
}

uint64_t __46__DSCallStatisticsAggregator_beginAggregation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  BOOL v18;
  uint64_t WeakRetained;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((_DWORD)v4)
  {
    DiagnosticLogHandleForCategory(3);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __46__DSCallStatisticsAggregator_beginAggregation__block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_getAndValidateDateFromLogLine:", v3);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v13 = objc_msgSend(*(id *)(a1 + 32), "_getDaysBetween:and:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v5);
      if (v13 < 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "setOutOfOrderDateDetected:", 1);
        DiagnosticLogHandleForCategory(3);
        WeakRetained = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)WeakRetained, OS_LOG_TYPE_ERROR))
          __46__DSCallStatisticsAggregator_beginAggregation__block_invoke_cold_3(WeakRetained, v27, v28, v29, v30, v31, v32, v33);
      }
      else
      {
        v14 = v13;
        v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        DiagnosticLogHandleForCategory(3);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
        if (v14)
          v18 = 1;
        else
          v18 = v15 == 0;
        if (v18)
        {
          if (v17)
          {
            v35 = 134217984;
            v36 = v14;
            _os_log_impl(&dword_21F54F000, v16, OS_LOG_TYPE_DEFAULT, "date change, flushing new log entry; daysElapsed=%ld",
              (uint8_t *)&v35,
              0xCu);
          }

          objc_msgSend(*(id *)(a1 + 32), "_flushAccumulatedLogDataWithDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
          objc_msgSend(*(id *)(a1 + 32), "_fillCallLogWithMissingDays:fromDate:", v14 - 1, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
        }
        else
        {
          if (v17)
          {
            LOWORD(v35) = 0;
            _os_log_impl(&dword_21F54F000, v16, OS_LOG_TYPE_DEFAULT, "new log line contains the same date as a previous one, accumulating", (uint8_t *)&v35, 2u);
          }

        }
        WeakRetained = (uint64_t)objc_loadWeakRetained((id *)(a1 + 48));
        if (WeakRetained)
        {
          *(_DWORD *)(WeakRetained + 28) += objc_msgSend(v3, "integerFromFieldAtIndex:", 12);
          *(_DWORD *)(WeakRetained + 32) += objc_msgSend(v3, "integerFromFieldAtIndex:", 14);
          *(_DWORD *)(WeakRetained + 36) += objc_msgSend(v3, "integerFromFieldAtIndex:", 15);
          *(_DWORD *)(WeakRetained + 40) += objc_msgSend(v3, "integerFromFieldAtIndex:", 4);
          *(_DWORD *)(WeakRetained + 44) += objc_msgSend(v3, "integerFromFieldAtIndex:", 5);
        }
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v5);
      }
    }
    else
    {
      DiagnosticLogHandleForCategory(3);
      WeakRetained = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)WeakRetained, OS_LOG_TYPE_ERROR))
        __46__DSCallStatisticsAggregator_beginAggregation__block_invoke_cold_2(WeakRetained, v20, v21, v22, v23, v24, v25, v26);
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
  void *v16;
  _QWORD v17[7];
  _QWORD v18[8];

  v18[7] = *MEMORY[0x24BDAC8D0];
  -[DSCallStatisticsAggregator generationLock](self, "generationLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  if (!-[DSCallStatisticsAggregator generationComplete](self, "generationComplete"))
  {
    do
    {
      -[DSCallStatisticsAggregator generationLock](self, "generationLock");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "wait");

    }
    while (!-[DSCallStatisticsAggregator generationComplete](self, "generationComplete"));
  }
  -[DSCallStatisticsAggregator generationLock](self, "generationLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  if (-[DSCallStatisticsAggregator isCancelled](self, "isCancelled"))
    return 0;
  v17[0] = CFSTR("futureDateDetected");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[DSCallStatisticsAggregator futureDateDetected](self, "futureDateDetected"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  v17[1] = CFSTR("outOfOrderDateDetected");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[DSCallStatisticsAggregator outOfOrderDateDetected](self, "outOfOrderDateDetected"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v8;
  v17[2] = CFSTR("totalLoggedDayCount");
  v9 = (void *)MEMORY[0x24BDD16E0];
  -[DSCallStatisticsAggregator callLog](self, "callLog");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v11;
  v17[3] = CFSTR("totalPlacedCallCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_totals.placedCallCount);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v12;
  v17[4] = CFSTR("totalDroppedCallCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_totals.droppedCallCount);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v13;
  v17[5] = CFSTR("totalDeviceDroppedCallCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_totals.deviceDroppedCallCount);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v14;
  v17[6] = CFSTR("callLog");
  -[DSCallStatisticsAggregator callLog](self, "callLog");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[6] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)_isDateInRange:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  int v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DSCallStatisticsAggregator referenceDate](self, "referenceDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  DiagnosticLogHandleForCategory(3);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = v7;
    _os_log_impl(&dword_21F54F000, v8, OS_LOG_TYPE_DEFAULT, "interval since now: %f", (uint8_t *)&v10, 0xCu);
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

  objc_msgSend(a3, "stringFromFieldAtIndex:", 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_5;
  +[DSDateFormatter sharedFormatter](DSDateFormatter, "sharedFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formatterWithType:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFromString:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

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
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[6];
  _QWORD v18[6];
  uint8_t buf[4];
  int64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = -[DSCallStatisticsAggregator missingDaysRemaining](self, "missingDaysRemaining");
  if (v7 >= a3)
    v8 = a3;
  else
    v8 = v7;
  DiagnosticLogHandleForCategory(3);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v20 = v8;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_21F54F000, v9, OS_LOG_TYPE_DEFAULT, "filling call log with empty data for %ld days starting from [%@]", buf, 0x16u);
  }

  if (v8 >= 1)
  {
    v10 = 0;
    do
    {
      objc_msgSend(v6, "dateByAddingTimeInterval:", (double)++v10 * 86400.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[DSDateFormatter sharedFormatter](DSDateFormatter, "sharedFormatter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "formatterWithType:", 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringFromDate:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v17[0] = CFSTR("date");
        v17[1] = CFSTR("placedCallCount");
        v18[0] = v14;
        v18[1] = &unk_24E44DCC0;
        v17[2] = CFSTR("droppedCallCount");
        v17[3] = CFSTR("deviceDroppedCallCount");
        v18[2] = &unk_24E44DCC0;
        v18[3] = &unk_24E44DCC0;
        v17[4] = CFSTR("droppedWiFiCallCount");
        v17[5] = CFSTR("droppedVoLTECallCount");
        v18[4] = &unk_24E44DCC0;
        v18[5] = &unk_24E44DCC0;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[DSCallStatisticsAggregator callLog](self, "callLog");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v15);

      }
    }
    while (v8 != v10);
  }
  -[DSCallStatisticsAggregator setMissingDaysRemaining:](self, "setMissingDaysRemaining:", -[DSCallStatisticsAggregator missingDaysRemaining](self, "missingDaysRemaining") - v8);

}

- (int64_t)_getDaysBetween:(id)a3 and:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int64_t v8;
  double v9;
  NSObject *v10;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  int64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_msgSend(v6, "timeIntervalSinceDate:", v5);
    v8 = (uint64_t)(v9 / 86400.0);
  }
  DiagnosticLogHandleForCategory(3);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412802;
    v13 = v5;
    v14 = 2112;
    v15 = v7;
    v16 = 2048;
    v17 = v8;
    _os_log_impl(&dword_21F54F000, v10, OS_LOG_TYPE_DEFAULT, "days between [%@] and [%@]: %ld", (uint8_t *)&v12, 0x20u);
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
  _QWORD v16[7];

  v16[6] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = a3;
    +[DSDateFormatter sharedFormatter](DSDateFormatter, "sharedFormatter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "formatterWithType:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromDate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v16[0] = v7;
      v15[0] = CFSTR("date");
      v15[1] = CFSTR("placedCallCount");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_accumulated.placedCallCount);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16[1] = v8;
      v15[2] = CFSTR("droppedCallCount");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_accumulated.droppedCallCount);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2] = v9;
      v15[3] = CFSTR("deviceDroppedCallCount");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_accumulated.deviceDroppedCallCount);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16[3] = v10;
      v15[4] = CFSTR("droppedWiFiCallCount");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_accumulated.droppedWiFiCallCount);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[4] = v11;
      v15[5] = CFSTR("droppedVoLTECallCount");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_accumulated.droppedVoLTECallCount);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[5] = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[DSCallStatisticsAggregator callLog](self, "callLog");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
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
  OUTLINED_FUNCTION_0(&dword_21F54F000, a1, a3, "scan cancelled, aborting", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __46__DSCallStatisticsAggregator_beginAggregation__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21F54F000, a1, a3, "log line date is unparseable or not valid, skipping", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __46__DSCallStatisticsAggregator_beginAggregation__block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21F54F000, a1, a3, "out of order date detected, skipping", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
