@implementation HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager

- (HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager)initWithProfile:(id)a3
{
  void *v4;
  void *v5;
  HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager *v6;

  objc_msgSend(MEMORY[0x1E0D294B8], "hdhr_aFibBurdenProtectedSyncedDomainForProfile:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKCreateSerialDispatchQueue();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager initWithKeyValueDomain:dateGenerator:queue:](self, "initWithKeyValueDomain:dateGenerator:queue:", v4, &__block_literal_global_11, v5);

  return v6;
}

uint64_t __67__HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager_initWithProfile___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager)initWithKeyValueDomain:(id)a3 dateGenerator:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  id v11;
  HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager *v12;
  HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager *v13;
  uint64_t v14;
  id dateGenerator;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager;
  v12 = -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_keyValueDomain, a3);
    v14 = MEMORY[0x1D17A8B4C](v10);
    dateGenerator = v13->_dateGenerator;
    v13->_dateGenerator = (id)v14;

    objc_storeStrong((id *)&v13->_queue, a5);
  }

  return v13;
}

- (void)dropBreadcrumb:(int64_t)a3
{
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD block[5];
  id v9;
  int64_t v10;

  (*((void (**)(void))self->_dateGenerator + 2))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager_dropBreadcrumb___block_invoke;
  block[3] = &unk_1E87F03D0;
  v9 = v5;
  v10 = a3;
  block[4] = self;
  v7 = v5;
  dispatch_async(queue, block);

}

uint64_t __66__HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager_dropBreadcrumb___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_dropBreadcrumb:date:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)dropAnalysisResultBreadcrumbWithContext:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  (*((void (**)(void))self->_dateGenerator + 2))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager_dropAnalysisResultBreadcrumbWithContext___block_invoke;
  block[3] = &unk_1E87EFAE0;
  block[4] = self;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(queue, block);

}

uint64_t __91__HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager_dropAnalysisResultBreadcrumbWithContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_dropAnalysisResultBreadcrumbWithContext:date:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)fetchBreadcrumbsWithError:(id *)a3
{
  HDKeyValueDomain *keyValueDomain;
  void *v6;
  void *v7;
  void *v8;
  HDKeyValueDomain *v9;
  void *v10;
  void *v11;
  HDKeyValueDomain *v12;
  void *v13;
  void *v14;
  HDKeyValueDomain *v15;
  void *v16;
  void *v17;
  HDKeyValueDomain *v18;
  void *v19;
  void *v20;
  HDKeyValueDomain *v21;
  void *v22;
  void *v23;
  HDKeyValueDomain *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;

  keyValueDomain = self->_keyValueDomain;
  -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager _dateKeyForBreadcrumb:](self, "_dateKeyForBreadcrumb:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDKeyValueDomain dateForKey:error:](keyValueDomain, "dateForKey:error:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  if (!*a3)
  {
    v9 = self->_keyValueDomain;
    -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager _dateKeyForBreadcrumb:](self, "_dateKeyForBreadcrumb:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDKeyValueDomain dateForKey:error:](v9, "dateForKey:error:", v10, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (*a3)
    {
      v8 = 0;
    }
    else
    {
      v12 = self->_keyValueDomain;
      -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager _dateKeyForBreadcrumb:](self, "_dateKeyForBreadcrumb:", 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDKeyValueDomain dateForKey:error:](v12, "dateForKey:error:", v13, a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (*a3)
      {
        v8 = 0;
      }
      else
      {
        v15 = self->_keyValueDomain;
        -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager _dateKeyForBreadcrumb:](self, "_dateKeyForBreadcrumb:", 3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDKeyValueDomain dateForKey:error:](v15, "dateForKey:error:", v16, a3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (*a3)
        {
          v8 = 0;
        }
        else
        {
          v18 = self->_keyValueDomain;
          -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager _dateKeyForBreadcrumb:](self, "_dateKeyForBreadcrumb:", 4);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDKeyValueDomain dateForKey:error:](v18, "dateForKey:error:", v19, a3);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (*a3)
          {
            v8 = 0;
          }
          else
          {
            v21 = self->_keyValueDomain;
            -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager _dateKeyForBreadcrumb:](self, "_dateKeyForBreadcrumb:", 5);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDKeyValueDomain dateForKey:error:](v21, "dateForKey:error:", v22, a3);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (*a3)
            {
              v8 = 0;
            }
            else
            {
              v24 = self->_keyValueDomain;
              -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager _dateKeyForBreadcrumb:](self, "_dateKeyForBreadcrumb:", 6);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[HDKeyValueDomain dateForKey:error:](v24, "dateForKey:error:", v25, a3);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              if (*a3)
              {
                v8 = 0;
              }
              else
              {
                -[HDKeyValueDomain dateForKey:error:](self->_keyValueDomain, "dateForKey:error:", CFSTR("SevenDayAnalysisBreadcrumbAnalysisResultGiven"), a3);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                if (*a3)
                {
                  v8 = 0;
                }
                else
                {
                  v30 = v27;
                  -[HDKeyValueDomain stringForKey:error:](self->_keyValueDomain, "stringForKey:error:", CFSTR("SevenDayAnalysisBreadcrumbAnalysisResultContext"), a3);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  if (*a3)
                    v8 = 0;
                  else
                    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2FBB0]), "initWithAlarmFiredDate:xpcActivityFiredDate:maintenanceOperationRunDate:analysisStartedDate:tachogramsClassifiedDate:analysisEndedDate:analysisRetryLaterRequestedDate:lastAnalysisResultDate:lastAnalysisResultContext:", v7, v11, v14, v17, v20, v23, v26, v30, v28);

                  v27 = v30;
                }

              }
            }

          }
        }

      }
    }

  }
  return v8;
}

- (void)_queue_dropBreadcrumb:(int64_t)a3 date:(id)a4
{
  NSObject *queue;
  id v7;
  void *v8;
  HDKeyValueDomain *keyValueDomain;
  id v10;
  NSObject *v11;
  id v12;

  queue = self->_queue;
  v7 = a4;
  dispatch_assert_queue_V2(queue);
  -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager _dateKeyForBreadcrumb:](self, "_dateKeyForBreadcrumb:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  keyValueDomain = self->_keyValueDomain;
  v12 = 0;
  -[HDKeyValueDomain setDate:forKey:error:](keyValueDomain, "setDate:forKey:error:", v7, v8, &v12);

  v10 = v12;
  if (v10)
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager _queue_dropBreadcrumb:date:].cold.1();

  }
}

- (void)_queue_dropAnalysisResultBreadcrumbWithContext:(id)a3 date:(id)a4
{
  NSObject *queue;
  id v7;
  id v8;
  HDKeyValueDomain *keyValueDomain;
  id v10;
  NSObject *v11;
  HDKeyValueDomain *v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;

  queue = self->_queue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(queue);
  keyValueDomain = self->_keyValueDomain;
  v16 = 0;
  -[HDKeyValueDomain setDate:forKey:error:](keyValueDomain, "setDate:forKey:error:", v7, CFSTR("SevenDayAnalysisBreadcrumbAnalysisResultGiven"), &v16);

  v10 = v16;
  if (v10)
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager _queue_dropBreadcrumb:date:].cold.1();

  }
  v12 = self->_keyValueDomain;
  v15 = 0;
  -[HDKeyValueDomain setString:forKey:error:](v12, "setString:forKey:error:", v8, CFSTR("SevenDayAnalysisBreadcrumbAnalysisResultContext"), &v15);

  v13 = v15;
  if (v13)
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager _queue_dropAnalysisResultBreadcrumbWithContext:date:].cold.1();

  }
}

- (id)_dateKeyForBreadcrumb:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return CFSTR("SevenDayAnalysisBreadcrumbAlarmFired");
  else
    return off_1E87F03F0[a3 - 1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_dateGenerator, 0);
  objc_storeStrong((id *)&self->_keyValueDomain, 0);
}

- (void)_queue_dropBreadcrumb:date:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%{public}@] Error when saving date: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_queue_dropAnalysisResultBreadcrumbWithContext:date:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0(&dword_1CC29C000, v0, v1, "[%{public}@] Error when saving context: %{public}@");
  OUTLINED_FUNCTION_2();
}

@end
