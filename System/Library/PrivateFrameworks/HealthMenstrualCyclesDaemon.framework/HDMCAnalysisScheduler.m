@implementation HDMCAnalysisScheduler

- (HDMCAnalysisScheduler)initWithDaemon:(id)a3 analysisManager:(id)a4 settingsManager:(id)a5 calendarCache:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HDMCAnalysisScheduler *v14;
  HDMCAnalysisScheduler *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HDMCAnalysisScheduler;
  v14 = -[HDMCAnalysisScheduler init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_analysisManager, a4);
    objc_storeStrong((id *)&v15->_settingsManager, a5);
    objc_storeStrong((id *)&v15->_calendarCache, a6);
    objc_msgSend(v10, "registerDaemonReadyObserver:queue:", v15, 0);
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  xpc_activity_unregister("com.apple.Health.menstrualcycles.analysisupdates");
  v3.receiver = self;
  v3.super_class = (Class)HDMCAnalysisScheduler;
  -[HDMCAnalysisScheduler dealloc](&v3, sel_dealloc);
}

- (void)_registerActivityAfterCompletion:(BOOL)a3
{
  void *v4;
  _QWORD handler[4];
  id v6;
  BOOL v7;
  id location;

  objc_initWeak(&location, self);
  v4 = (void *)*MEMORY[0x24BDAC5A0];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __58__HDMCAnalysisScheduler__registerActivityAfterCompletion___block_invoke;
  handler[3] = &unk_24DB22468;
  objc_copyWeak(&v6, &location);
  v7 = a3;
  xpc_activity_register("com.apple.Health.menstrualcycles.analysisupdates", v4, handler);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __58__HDMCAnalysisScheduler__registerActivityAfterCompletion___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_handleActivity:forceRescheduleOnCheckIn:", v4, *(unsigned __int8 *)(a1 + 40));

}

- (void)_handleActivity:(id)a3 forceRescheduleOnCheckIn:(BOOL)a4
{
  _BOOL4 v4;
  _xpc_activity_s *v6;
  xpc_activity_state_t state;
  uint64_t v8;
  xpc_object_t v9;
  void *v10;
  const char **v11;
  int64_t int64;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  id v16;
  const char *v17;
  void *v18;
  void *v19;
  void *v20;
  xpc_object_t v21;
  void *v22;
  double v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  int v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v4 = a4;
  v33 = *MEMORY[0x24BDAC8D0];
  v6 = (_xpc_activity_s *)a3;
  state = xpc_activity_get_state(v6);
  if (state == 2)
  {
    -[HDMCAnalysisScheduler _runAnalysis](self, "_runAnalysis");
    if ((xpc_activity_set_completion_status() & 1) == 0)
    {
      _HKInitializeLogging();
      v18 = (void *)*MEMORY[0x24BDD3030];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
        -[HDMCAnalysisScheduler _handleActivity:forceRescheduleOnCheckIn:].cold.2(v18);
    }
    -[HDMCAnalysisScheduler _registerActivityAfterCompletion:](self, "_registerActivityAfterCompletion:", 1);
  }
  else
  {
    v8 = state;
    if (!state)
    {
      v9 = xpc_activity_copy_criteria(v6);
      v10 = v9;
      v11 = (const char **)MEMORY[0x24BDAC5B8];
      if (v9)
      {
        int64 = xpc_dictionary_get_int64(v9, (const char *)*MEMORY[0x24BDAC5B8]);
        _HKInitializeLogging();
        v13 = (void *)*MEMORY[0x24BDD3030];
        v14 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_INFO);
        if (int64)
        {
          if (!v4)
          {
            if (v14)
            {
              v24 = v13;
              v25 = (void *)objc_opt_class();
              v26 = (void *)MEMORY[0x24BDD16E0];
              v27 = v25;
              objc_msgSend(v26, "numberWithLongLong:", int64);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = 138543618;
              v30 = v25;
              v31 = 2112;
              v32 = v28;
              _os_log_impl(&dword_21961B000, v24, OS_LOG_TYPE_INFO, "[%{public}@] Found existing valid criteria; not rescheduling. Delay: %@",
                (uint8_t *)&v29,
                0x16u);

            }
            goto LABEL_20;
          }
          if (v14)
          {
            v15 = v13;
            v29 = 138543362;
            v30 = (id)objc_opt_class();
            v16 = v30;
            v17 = "[%{public}@] Rescheduling for completed activity";
LABEL_18:
            _os_log_impl(&dword_21961B000, v15, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v29, 0xCu);

          }
        }
        else if (v14)
        {
          v15 = v13;
          v29 = 138543362;
          v30 = (id)objc_opt_class();
          v16 = v30;
          v17 = "[%{public}@] No delay found in existing criteria";
          goto LABEL_18;
        }
      }
      else
      {
        _HKInitializeLogging();
        v20 = (void *)*MEMORY[0x24BDD3030];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_INFO))
        {
          v15 = v20;
          v29 = 138543362;
          v30 = (id)objc_opt_class();
          v16 = v30;
          v17 = "[%{public}@] No existing criteria found";
          goto LABEL_18;
        }
      }
      v21 = xpc_dictionary_create(0, 0, 0);

      xpc_dictionary_set_BOOL(v21, (const char *)*MEMORY[0x24BDAC6C0], 1);
      xpc_dictionary_set_string(v21, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A8]);
      xpc_dictionary_set_BOOL(v21, (const char *)*MEMORY[0x24BDAC598], 1);
      xpc_dictionary_set_BOOL(v21, (const char *)*MEMORY[0x24BDAC6B8], 0);
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDMCAnalysisScheduler _delayUntilNextAnalysisSchedulingWindowStartDateAfterDate:](self, "_delayUntilNextAnalysisSchedulingWindowStartDateAfterDate:", v22);
      xpc_dictionary_set_int64(v21, *v11, (uint64_t)v23);
      xpc_dictionary_set_int64(v21, (const char *)*MEMORY[0x24BDAC5D8], 3600);
      xpc_activity_set_criteria(v6, v21);

      v10 = v21;
LABEL_20:

      goto LABEL_21;
    }
    _HKInitializeLogging();
    v19 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      -[HDMCAnalysisScheduler _handleActivity:forceRescheduleOnCheckIn:].cold.1(v19, (uint64_t)self, v8);
  }
LABEL_21:

}

- (double)_delayUntilNextAnalysisSchedulingWindowStartDateAfterDate:(id)a3
{
  id v4;
  HKMCSettingsManager *settingsManager;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  NSObject *v12;
  void *v13;
  HKCalendarCache *calendarCache;
  id v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  settingsManager = self->_settingsManager;
  -[HKCalendarCache currentCalendar](self->_calendarCache, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMCSettingsManager hdmc_nextAnalysisSchedulingWindowStartDateAfterDate:calendar:](settingsManager, "hdmc_nextAnalysisSchedulingWindowStartDateAfterDate:calendar:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "timeIntervalSinceDate:", v4);
    v9 = v8;
  }
  else
  {
    _HKInitializeLogging();
    v10 = (void *)*MEMORY[0x24BDD3030];
    v9 = 86400.0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_FAULT))
    {
      v12 = v10;
      v13 = (void *)objc_opt_class();
      calendarCache = self->_calendarCache;
      v15 = v13;
      -[HKCalendarCache currentCalendar](calendarCache, "currentCalendar");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v13;
      v19 = 2114;
      v20 = v4;
      v21 = 2114;
      v22 = v16;
      _os_log_fault_impl(&dword_21961B000, v12, OS_LOG_TYPE_FAULT, "[%{public}@] Next date to schedule analysis after %{public}@ should not be nil, calendar: %{public}@", (uint8_t *)&v17, 0x20u);

    }
  }

  return v9;
}

- (void)_runAnalysis
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4(a1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] We are firing this block at an unusual time inbetween midnight and 6pm at date of %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)daemonReady:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    *(_DWORD *)v7 = 138543362;
    *(_QWORD *)&v7[4] = objc_opt_class();
    v6 = *(id *)&v7[4];
    _os_log_impl(&dword_21961B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Daemon ready, scheduling activity", v7, 0xCu);

  }
  -[HDMCAnalysisScheduler _registerActivityAfterCompletion:](self, "_registerActivityAfterCompletion:", 0, *(_OWORD *)v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_storeStrong((id *)&self->_analysisManager, 0);
}

- (void)_handleActivity:(uint64_t)a3 forceRescheduleOnCheckIn:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  OUTLINED_FUNCTION_4(a1);
  v5 = (void *)OUTLINED_FUNCTION_3();
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = v5;
  objc_msgSend(v6, "numberWithLong:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1(&dword_21961B000, v8, v9, "[%{public}@] Unexpected activity registration state: %@", v10, v11, v12, v13, 2u);

}

- (void)_handleActivity:(void *)a1 forceRescheduleOnCheckIn:.cold.2(void *a1)
{
  NSObject *v1;
  id v2;
  int v3;
  id v4;

  v1 = OUTLINED_FUNCTION_4(a1);
  v3 = 138543362;
  v4 = (id)objc_opt_class();
  v2 = v4;
  _os_log_error_impl(&dword_21961B000, v1, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to update completion state", (uint8_t *)&v3, 0xCu);

}

@end
