@implementation ATXChangeAlarmBeforeHolidayDataSource

- (ATXChangeAlarmBeforeHolidayDataSource)initWithDevice:(id)a3
{
  id v5;
  ATXChangeAlarmBeforeHolidayDataSource *v6;
  ATXChangeAlarmBeforeHolidayDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXChangeAlarmBeforeHolidayDataSource;
  v6 = -[ATXChangeAlarmBeforeHolidayDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (void)scheduledBedTimeWithCallback:(id)a3
{
  void (**v3)(id, uint64_t, _QWORD);
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, uint64_t, _QWORD))a3;
  +[ATXHeuristicDevice sharedAlarmManager](ATXHeuristicDevice, "sharedAlarmManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepAlarmSync");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEnabled");
  __atxlog_handle_heuristic();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v6 & 1) != 0)
  {
    if (v8)
    {
      v10 = 134218240;
      v11 = objc_msgSend(v5, "bedtimeHour");
      v12 = 2048;
      v13 = objc_msgSend(v5, "bedtimeMinute");
      _os_log_impl(&dword_1C99DF000, v7, OS_LOG_TYPE_DEFAULT, "changeAlarmBeforeHoliday: Found scheduled bed time: %ld:%ld", (uint8_t *)&v10, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3600 * objc_msgSend(v5, "bedtimeHour") + 60 * objc_msgSend(v5, "bedtimeMinute"));
    v9 = objc_claimAutoreleasedReturnValue();
    v3[2](v3, v9, 0);

    v3 = (void (**)(id, uint64_t, _QWORD))v9;
  }
  else
  {
    if (v8)
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1C99DF000, v7, OS_LOG_TYPE_DEFAULT, "changeAlarmBeforeHoliday: No scheduled bed time", (uint8_t *)&v10, 2u);
    }

    v3[2](v3, (uint64_t)&unk_1E82D5620, 0);
  }

}

- (void)predictedBedTimeWithCallback:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  void (**v14)(id, void *, _QWORD);
  uint8_t buf[8];
  uint64_t v16;
  Class (*v17)(uint64_t);
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v3 = (void (**)(id, void *, _QWORD))a3;
  v4 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v5 = (void *)objc_msgSend(v4, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  v6 = objc_msgSend(v5, "integerForKey:", *MEMORY[0x1E0CF95F0]);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v3[2](v3, v7, 0);

  }
  else
  {
    __atxlog_handle_heuristic();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C99DF000, v8, OS_LOG_TYPE_DEFAULT, "changeAlarmBeforeHoliday: No cached predicted bed time; getting predicted bed time",
        buf,
        2u);
    }

    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v9 = (void *)getATXSleepSuggestionServerClass_softClass;
    v23 = getATXSleepSuggestionServerClass_softClass;
    v10 = MEMORY[0x1E0C809B0];
    if (!getATXSleepSuggestionServerClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __getATXSleepSuggestionServerClass_block_invoke;
      v18 = &unk_1E82C46C8;
      v19 = &v20;
      __getATXSleepSuggestionServerClass_block_invoke((uint64_t)buf);
      v9 = (void *)v21[3];
    }
    v11 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v20, 8);
    objc_msgSend(v11, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __70__ATXChangeAlarmBeforeHolidayDataSource_predictedBedTimeWithCallback___block_invoke;
    v13[3] = &unk_1E82C46A0;
    v14 = v3;
    objc_msgSend(v12, "predictedSleepSuggestionWithCompletionHandler:", v13);

  }
}

void __70__ATXChangeAlarmBeforeHolidayDataSource_predictedBedTimeWithCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void (*v12)(void);
  uint8_t v13[16];

  v5 = a3;
  objc_msgSend(a2, "occurrence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bedtimeComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 3600 * objc_msgSend(v7, "hour") + 60 * objc_msgSend(v7, "minute"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, 0);

  }
  else
  {
    __atxlog_handle_heuristic();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v5)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __70__ATXChangeAlarmBeforeHolidayDataSource_predictedBedTimeWithCallback___block_invoke_cold_1((uint64_t)v5, v11);

      v12 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1C99DF000, v11, OS_LOG_TYPE_DEFAULT, "changeAlarmBeforeHoliday: No suggested sleep schedule available", v13, 2u);
      }

      v12 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    v12();
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

void __70__ATXChangeAlarmBeforeHolidayDataSource_predictedBedTimeWithCallback___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C99DF000, a2, OS_LOG_TYPE_ERROR, "changeAlarmBeforeHoliday: Failed to get suggested sleep schedule with error: %@", (uint8_t *)&v2, 0xCu);
}

@end
