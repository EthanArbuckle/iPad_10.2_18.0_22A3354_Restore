@implementation ATXAlarmsDataSource

- (ATXAlarmsDataSource)initWithDevice:(id)a3
{
  id v5;
  ATXAlarmsDataSource *v6;
  ATXAlarmsDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXAlarmsDataSource;
  v6 = -[ATXAlarmsDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (void)alarmsFromDate:(id)a3 toDate:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  dispatch_semaphore_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t *v26;
  _QWORD v27[4];
  NSObject *v28;
  uint8_t *v29;
  uint8_t buf[8];
  uint8_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((ATXHeuristicCanLearnFromApp(&unk_1E82D54A0) & 1) == 0)
  {
    __atxlog_handle_heuristic();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C99DF000, v21, OS_LOG_TYPE_DEFAULT, "Learn from Clock is disabled. Can't fetch alarms", buf, 2u);
    }

    goto LABEL_7;
  }
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v11 = v10;
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  if (v11 > v12)
  {
LABEL_7:
    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, MEMORY[0x1E0C9AA60], 0);
    goto LABEL_8;
  }
  +[ATXHeuristicDevice sharedAlarmManager](ATXHeuristicDevice, "sharedAlarmManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = dispatch_semaphore_create(0);
  *(_QWORD *)buf = 0;
  v31 = buf;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__8;
  v34 = __Block_byref_object_dispose__8;
  v35 = 0;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v7, v8);
  objc_msgSend(v13, "nextAlarmsInRange:maxCount:includeSleepAlarm:", v15, 100, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __63__ATXAlarmsDataSource_alarmsFromDate_toDate_completionHandler___block_invoke;
  v27[3] = &unk_1E82C4BE8;
  v29 = buf;
  v18 = v14;
  v28 = v18;
  v19 = (id)objc_msgSend(v16, "addCompletionBlock:", v27);

  v20 = (void *)MEMORY[0x1E0D81598];
  v24[0] = v17;
  v24[1] = 3221225472;
  v24[2] = __63__ATXAlarmsDataSource_alarmsFromDate_toDate_completionHandler___block_invoke_8;
  v24[3] = &unk_1E82C4C10;
  v25 = v9;
  v26 = buf;
  v22[0] = v17;
  v22[1] = 3221225472;
  v22[2] = __63__ATXAlarmsDataSource_alarmsFromDate_toDate_completionHandler___block_invoke_2;
  v22[3] = &unk_1E82C4C38;
  v23 = v25;
  objc_msgSend(v20, "waitForSemaphore:timeoutSeconds:onAcquire:onTimeout:", v18, v24, v22, 5.0);

  _Block_object_dispose(buf, 8);
LABEL_8:

}

void __63__ATXAlarmsDataSource_alarmsFromDate_toDate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  id obj;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[13];
  _QWORD v39[13];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    __atxlog_handle_heuristic();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __63__ATXAlarmsDataSource_alarmsFromDate_toDate_completionHandler___block_invoke_cold_1((uint64_t)v6, v7);
  }
  else
  {
    v22 = 0;
    v23 = a1;
    v24 = v5;
    v8 = v5;
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v8;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v28)
    {
      v26 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v35 != v26)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v39[0] = v10;
          v38[0] = CFSTR("MTAlarm");
          v38[1] = CFSTR("alarmID");
          objc_msgSend(v10, "alarmID", v22, v23, v24);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "UUIDString");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v39[1] = v32;
          v38[2] = CFSTR("displayTitle");
          objc_msgSend(v10, "displayTitle");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v39[2] = v31;
          v38[3] = CFSTR("lastModifiedTS");
          v11 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v10, "lastModifiedDate");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "timeIntervalSinceReferenceDate");
          objc_msgSend(v11, "numberWithDouble:");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v39[3] = v29;
          v38[4] = CFSTR("hour");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "hour"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v39[4] = v12;
          v38[5] = CFSTR("minute");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "minute"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v39[5] = v13;
          v38[6] = CFSTR("isEnabled");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v10, "isEnabled"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v39[6] = v14;
          v38[7] = CFSTR("isRepeating");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v10, "repeats"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v39[7] = v15;
          v39[8] = MEMORY[0x1E0C9AAB0];
          v38[8] = CFSTR("playsOnThisDevice");
          v38[9] = CFSTR("isSleepAlarm");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v10, "isSleepAlarm"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v39[9] = v16;
          v38[10] = CFSTR("bedtimeHour");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "bedtimeHour"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v39[10] = v17;
          v38[11] = CFSTR("bedtimeMinute");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "bedtimeMinute"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v39[11] = v18;
          v38[12] = CFSTR("bedtimeReminderMinutes");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "bedtimeReminderMinutes"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v39[12] = v19;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 13);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v20);

        }
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v28);
    }

    a1 = v23;
    v5 = v24;
    v21 = *(_QWORD *)(*(_QWORD *)(v23 + 40) + 8);
    v7 = *(NSObject **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v27;
    v6 = v22;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __63__ATXAlarmsDataSource_alarmsFromDate_toDate_completionHandler___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0);
}

void __63__ATXAlarmsDataSource_alarmsFromDate_toDate_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  __atxlog_handle_heuristic();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __63__ATXAlarmsDataSource_alarmsFromDate_toDate_completionHandler___block_invoke_2_cold_1(v2);

  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 1, MEMORY[0x1E0C9AA70]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

void __63__ATXAlarmsDataSource_alarmsFromDate_toDate_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C99DF000, a2, OS_LOG_TYPE_ERROR, "Fetching alarms failed: %@", (uint8_t *)&v2, 0xCu);
}

void __63__ATXAlarmsDataSource_alarmsFromDate_toDate_completionHandler___block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C99DF000, log, OS_LOG_TYPE_ERROR, "XPC call to MobileTimer timed out.", v1, 2u);
}

@end
