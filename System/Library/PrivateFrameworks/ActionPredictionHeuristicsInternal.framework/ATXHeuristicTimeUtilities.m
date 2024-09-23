@implementation ATXHeuristicTimeUtilities

+ (double)timestampByOffsettingStartOfTodayByNumberOfDays:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startOfDayForDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 16, a3, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    v9 = v8;

  }
  else
  {
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    v9 = v10;
  }

  return v9;
}

+ (double)timestampWithHour:(unint64_t)a3 minute:(unint64_t)a4 atDayOfTimestamp:(double)a5
{
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", a5);
  objc_msgSend(v8, "dateBySettingHour:minute:second:ofDate:options:", a3, a4, 0, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v12 = v11;

  return v12;
}

+ (double)timestampByOffsettingDays:(double)a3 dayOffset:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", a3);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 16, a4, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v9 = v8;

  return v9;
}

+ (id)usualAlarmTimeOfDayDataSourceWithEnvironment:(id)a3
{
  id v3;
  ATXSetAlarmTimeOfDayDataSource *v4;
  void *v5;
  ATXSetAlarmTimeOfDayDataSource *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v3 = a3;
  v4 = [ATXSetAlarmTimeOfDayDataSource alloc];
  objc_msgSend(v3, "heuristicDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXSetAlarmTimeOfDayDataSource initWithDevice:](v4, "initWithDevice:", v5);

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__16;
  v28 = __Block_byref_object_dispose__16;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__16;
  v22 = __Block_byref_object_dispose__16;
  v23 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __74__ATXHeuristicTimeUtilities_usualAlarmTimeOfDayDataSourceWithEnvironment___block_invoke;
  v17[3] = &unk_1E82C47E0;
  v17[4] = &v24;
  v17[5] = &v18;
  -[ATXSetAlarmTimeOfDayDataSource alarmTimeOfDay:](v6, "alarmTimeOfDay:", v17);
  if (v19[5])
  {
    __atxlog_handle_context_heuristic();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[ATXHeuristicTimeUtilities usualAlarmTimeOfDayDataSourceWithEnvironment:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

    v15 = 0;
  }
  else
  {
    v15 = (id)v25[5];
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v15;
}

void __74__ATXHeuristicTimeUtilities_usualAlarmTimeOfDayDataSourceWithEnvironment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

+ (id)enabledAlarmsFromTS:(double)a3 toTS:(double)a4 environment:(id)a5
{
  id v7;
  ATXAlarmsDataSource *v8;
  void *v9;
  ATXAlarmsDataSource *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v7 = a5;
  v8 = [ATXAlarmsDataSource alloc];
  objc_msgSend(v7, "heuristicDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ATXAlarmsDataSource initWithDevice:](v8, "initWithDevice:", v9);

  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__16;
  v34 = __Block_byref_object_dispose__16;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__16;
  v28 = __Block_byref_object_dispose__16;
  v29 = 0;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", a3);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", a4);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __66__ATXHeuristicTimeUtilities_enabledAlarmsFromTS_toTS_environment___block_invoke;
  v23[3] = &unk_1E82C47B8;
  v23[4] = &v30;
  v23[5] = &v24;
  -[ATXAlarmsDataSource alarmsFromDate:toDate:completionHandler:](v10, "alarmsFromDate:toDate:completionHandler:", v11, v12, v23);
  if (v25[5])
  {
    __atxlog_handle_context_heuristic();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[ATXHeuristicTimeUtilities enabledAlarmsFromTS:toTS:environment:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

    v21 = 0;
  }
  else
  {
    v21 = (id)v31[5];
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v21;
}

void __66__ATXHeuristicTimeUtilities_enabledAlarmsFromTS_toTS_environment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

+ (void)usualAlarmTimeOfDayDataSourceWithEnvironment:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1C99DF000, a1, a3, "Error querying data source %{public}s", a5, a6, a7, a8, 2u);
}

+ (void)enabledAlarmsFromTS:(uint64_t)a3 toTS:(uint64_t)a4 environment:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1C99DF000, a1, a3, "Error querying data source %{public}s", a5, a6, a7, a8, 2u);
}

@end
