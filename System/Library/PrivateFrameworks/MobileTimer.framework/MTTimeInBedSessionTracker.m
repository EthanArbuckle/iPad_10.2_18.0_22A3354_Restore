@implementation MTTimeInBedSessionTracker

+ (BOOL)_trackingEnabledForSleepAlarm:(id)a3
{
  return objc_msgSend(a3, "timeInBedTracking");
}

+ (BOOL)_shouldUseBedtimeDismissedDateForAlarm:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  BOOL v20;
  NSObject *v21;
  void *v22;
  int v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "bedtimeDismissedDate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5 && (v6 = (void *)v5, v7 = objc_msgSend(v4, "bedtimeDismissedAction"), v6, v7 == 2))
  {
    objc_msgSend(v4, "bedtimeComponents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bedtimeDismissedDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mtPreviousDateBeforeDate:matchingComponents:", v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "bedtimeDismissedDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mtNextDateAfterDate:matchingComponents:", v12, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "bedtimeDismissedDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", v11);
    v16 = v15;

    objc_msgSend(v4, "bedtimeDismissedDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", v17);
    v19 = v18;

    v20 = v16 < 4500.0 || v19 < 3600.0;
    if (!v20)
    {
      MTLogForCategory(7);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "bedtimeDismissedDate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543618;
        v25 = a1;
        v26 = 2112;
        v27 = v22;
        _os_log_impl(&dword_19AC4E000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring user bedtime %@.", (uint8_t *)&v24, 0x16u);

      }
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (Class)sessionClass
{
  return (Class)objc_opt_class();
}

- (void)endSessionWithDate:(id)a3 reason:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  MTTimeInBedSessionTracker *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  MTLogForCategory(7);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    MTSleepSessionEndReasonDescription(a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = self;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ stopping session with reason %{public}@", (uint8_t *)&v11, 0x16u);

  }
  -[MTTimeInBedSessionTracker _createSleepSessionWithUserWakeTime:endReason:](self, "_createSleepSessionWithUserWakeTime:endReason:", v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTSleepSessionTracker sleepSessionTrackerDelegate](self, "sleepSessionTrackerDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sleepSessionTracker:sessionDidComplete:", self, v9);

}

- (id)_createSleepSessionWithUserWakeTime:(id)a3 endReason:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  char v13;
  char v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id *v23;
  void *v24;
  id v25;
  id *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  _QWORD v36[2];
  id v37;
  _QWORD v38[3];
  _BYTE buf[24];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[MTSleepSessionTracker cachedAlarm](self, "cachedAlarm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "_shouldUseBedtimeDismissedDateForAlarm:", v6)
    && (objc_msgSend(v6, "bedtimeDismissedDate"), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    MTLogForCategory(7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ User bed time was: %@", buf, 0x16u);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bedtimeComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mtPreviousDateBeforeDate:matchingComponents:", v5, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    MTLogForCategory(7);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ User bed time unset.  Using: %@", buf, 0x16u);
    }

    if (!v7)
    {
      NSLog(CFSTR("Unexpected nil userBedtime"));
      v31 = 0;
      goto LABEL_27;
    }
  }
  objc_msgSend(v6, "dismissedDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v5, "isEqualToDate:", v12);
  if (a4)
    v14 = 0;
  else
    v14 = v13;

  if ((v14 & 1) == 0)
    NSLog(CFSTR("Wake times don't agree"));
  MTLogForCategory(7);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v5;
    _os_log_impl(&dword_19AC4E000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ User wake time was: %@", buf, 0x16u);
  }

  objc_msgSend(v6, "bedtimeComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mtDateNearestMatchingComponents:", v16);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dateComponents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mtDateNearestMatchingComponents:", v17);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v18 = (id *)getHKMetadataKeyTimeZoneSymbolLoc_ptr;
  v40 = getHKMetadataKeyTimeZoneSymbolLoc_ptr;
  if (!getHKMetadataKeyTimeZoneSymbolLoc_ptr)
  {
    v19 = (void *)HealthKitLibrary();
    v18 = (id *)dlsym(v19, "HKMetadataKeyTimeZone");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v18;
    getHKMetadataKeyTimeZoneSymbolLoc_ptr = (uint64_t)v18;
  }
  _Block_object_dispose(buf, 8);
  if (!v18)
    -[MTTimeInBedSessionTracker _createSleepSessionWithUserWakeTime:endReason:].cold.1();
  v20 = *v18;
  v36[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v22;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v23 = (id *)get_HKPrivateMetadataKeySleepAlarmUserSetBedtimeSymbolLoc_ptr;
  v40 = get_HKPrivateMetadataKeySleepAlarmUserSetBedtimeSymbolLoc_ptr;
  if (!get_HKPrivateMetadataKeySleepAlarmUserSetBedtimeSymbolLoc_ptr)
  {
    v24 = (void *)HealthKitLibrary();
    v23 = (id *)dlsym(v24, "_HKPrivateMetadataKeySleepAlarmUserSetBedtime");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v23;
    get_HKPrivateMetadataKeySleepAlarmUserSetBedtimeSymbolLoc_ptr = (uint64_t)v23;
  }
  _Block_object_dispose(buf, 8);
  if (!v23)
    -[MTTimeInBedSessionTracker _createSleepSessionWithUserWakeTime:endReason:].cold.2();
  v25 = *v23;
  v36[1] = v25;
  v38[1] = v34;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v26 = (id *)get_HKPrivateMetadataKeySleepAlarmUserWakeTimeSymbolLoc_ptr;
  v40 = get_HKPrivateMetadataKeySleepAlarmUserWakeTimeSymbolLoc_ptr;
  if (!get_HKPrivateMetadataKeySleepAlarmUserWakeTimeSymbolLoc_ptr)
  {
    v27 = (void *)HealthKitLibrary();
    v26 = (id *)dlsym(v27, "_HKPrivateMetadataKeySleepAlarmUserWakeTime");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v26;
    get_HKPrivateMetadataKeySleepAlarmUserWakeTimeSymbolLoc_ptr = (uint64_t)v26;
  }
  _Block_object_dispose(buf, 8);
  if (!v26)
    -[MTTimeInBedSessionTracker _createSleepSessionWithUserWakeTime:endReason:].cold.3();
  v37 = *v26;
  v38[2] = v33;
  v28 = (void *)MEMORY[0x1E0C99D80];
  v29 = v37;
  objc_msgSend(v28, "dictionaryWithObjects:forKeys:count:", v38, v36, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTTimeInBedSession timeInBedSessionWithStartDate:endDate:intervals:endReason:metadata:](MTTimeInBedSession, "timeInBedSessionWithStartDate:endDate:intervals:endReason:metadata:", v7, v5, 0, a4, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "setNeedsAdditionalProcessing:", 1);
LABEL_27:

  return v31;
}

- (id)processedSessionForSession:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  uint8_t v48[128];
  uint8_t buf[4];
  MTTimeInBedSessionTracker *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v34 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D158B0], "inBedDetector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v3;
  objc_msgSend(v3, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  v33 = v4;
  objc_msgSend(v4, "detectInBedBetweenBedtimeDate:wakupDate:error:", v5, v6, &v47);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v47;

  MTLogForCategory(7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(v7, "count");
    *(_DWORD *)buf = 138543618;
    v50 = self;
    v51 = 2048;
    v52 = v9;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Found %lu in-bed intervals", buf, 0x16u);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v44 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        MTLogForCategory(7);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v14, "startDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "endDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v50 = self;
          v51 = 2112;
          v52 = (uint64_t)v16;
          v53 = 2112;
          v54 = v17;
          _os_log_impl(&dword_19AC4E000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ _CDInBedDetection [%@ - %@]", buf, 0x20u);

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    }
    while (v11);
  }

  if (!obj || v36)
  {
    MTLogForCategory(7);
    v31 = objc_claimAutoreleasedReturnValue();
    v20 = v34;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[MTTimeInBedSessionTracker processedSessionForSession:].cold.1((uint64_t)self, (uint64_t)v36, v31);

    v30 = 0;
    v25 = v35;
  }
  else
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v18 = obj;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    v20 = v34;
    if (v19)
    {
      v21 = v19;
      v22 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v40 != v22)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "_mt_dateInterval");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "na_safeAddObject:", v24);

        }
        v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v21);
    }

    v25 = v35;
    objc_msgSend(v35, "startDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "endDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v35, "endReason");
    objc_msgSend(v35, "metadata");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTTimeInBedSession timeInBedSessionWithStartDate:endDate:intervals:endReason:metadata:](MTTimeInBedSession, "timeInBedSessionWithStartDate:endDate:intervals:endReason:metadata:", v26, v27, v34, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "setNeedsAdditionalProcessing:", 0);
  }

  return v30;
}

- (void)_createSleepSessionWithUserWakeTime:endReason:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getHKMetadataKeyTimeZone(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("MTTimeInBedSessionTracker.m"), 20, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

- (void)_createSleepSessionWithUserWakeTime:endReason:.cold.2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *get_HKPrivateMetadataKeySleepAlarmUserSetBedtime(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("MTTimeInBedSessionTracker.m"), 21, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

- (void)_createSleepSessionWithUserWakeTime:endReason:.cold.3()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *get_HKPrivateMetadataKeySleepAlarmUserWakeTime(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("MTTimeInBedSessionTracker.m"), 22, CFSTR("%s"), OUTLINED_FUNCTION_0_2());

  __break(1u);
}

- (void)processedSessionForSession:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_19AC4E000, log, OS_LOG_TYPE_ERROR, "%{public}@ In bed detector failed to detect time-in-bed with error: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
