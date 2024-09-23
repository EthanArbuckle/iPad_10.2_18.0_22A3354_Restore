@implementation HDHeadphoneExposureNotificationCenter

- (HDHeadphoneExposureNotificationCenter)initWithProfile:(id)a3 syncManager:(id)a4
{
  id v6;
  id v7;
  HDHeadphoneExposureNotificationCenter *v8;
  HDHeadphoneExposureNotificationCenter *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  HAENotificationCenter *notificationCenter;
  id WeakRetained;
  uint64_t v15;
  HDCloudSyncManager *cloudSyncManager;
  HDHeadphoneExposureNotificationCenter *v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HDHeadphoneExposureNotificationCenter;
  v8 = -[HDHeadphoneExposureNotificationCenter init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BE3E7F0]), "initWithBundleIdentifier:", v11);
    notificationCenter = v9->_notificationCenter;
    v9->_notificationCenter = (HAENotificationCenter *)v12;

    objc_storeStrong((id *)&v9->_notificationSyncManager, a4);
    WeakRetained = objc_loadWeakRetained((id *)&v9->_profile);
    objc_msgSend(WeakRetained, "cloudSyncManager");
    v15 = objc_claimAutoreleasedReturnValue();
    cloudSyncManager = v9->_cloudSyncManager;
    v9->_cloudSyncManager = (HDCloudSyncManager *)v15;

    v17 = v9;
  }

  return v9;
}

- (id)postSevenDayDoseNotification:(id)a3 nowDate:(id)a4 analyticsInfo:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id WeakRetained;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  NSObject *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  HDCloudSyncManager *cloudSyncManager;
  void *v47;
  double v48;
  double v49;
  uint64_t v50;
  id v51;
  void *v52;
  HDHeadphoneExposureNotificationSyncManager *notificationSyncManager;
  id v54;
  void *v55;
  id v56;
  void *v58;
  id *location;
  id v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  _QWORD v67[5];
  _QWORD v68[5];
  id v69;
  id v70;
  uint8_t buf[4];
  void *v72;
  void *v73;
  _QWORD v74[3];
  _QWORD v75[5];

  v75[3] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((objc_msgSend(MEMORY[0x24BE456A0], "isHeadphoneExposureNotificationsEnabled") & 1) != 0)
  {
    objc_msgSend(v10, "statistics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = 0;
    objc_msgSend(v13, "hk_hearingSevenDayDosePercentageWithError:", &v70);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v70;
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:underlyingError:", a6, 100, CFSTR("invalid statistics dose"), v15);
      v56 = 0;
LABEL_22:

      goto LABEL_23;
    }
    v69 = 0;
    objc_msgSend(v13, "hk_hearingSevenDayDoseDateIntervalEndingBeforeDate:error:", v11, &v69);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v69;
    v18 = v17;
    if (!v16)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:underlyingError:", a6, 100, CFSTR("invalid statistics interval"), v17);
      v56 = 0;
LABEL_21:

      goto LABEL_22;
    }
    v63 = v17;
    v64 = v15;
    objc_msgSend(v13, "averageQuantity");
    v65 = v16;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4048], "decibelAWeightedSoundPressureLevelUnit");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValueForUnit:", v20);
    v22 = v21;

    objc_msgSend(v13, "duration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValueForUnit:", v24);
    v26 = v25;

    v27 = *MEMORY[0x24BE3E7D0];
    v75[0] = v14;
    v28 = *MEMORY[0x24BE3E7D8];
    v74[0] = v27;
    v74[1] = v28;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v75[1] = v29;
    v74[2] = *MEMORY[0x24BE3E7E0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v10, "includesPrunableData"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v75[2] = v30;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v75, v74, 3);
    v31 = objc_claimAutoreleasedReturnValue();

    v16 = v65;
    v62 = (void *)v31;
    v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3E7F8]), "initWithEventType:exposureLevel:dateInterval:metadata:", 2003133803, v65, v31, v22);
    -[HAENotificationCenter addHAENotificationEvent:error:](self->_notificationCenter, "addHAENotificationEvent:error:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v33 = v32;
      location = (id *)&self->_profile;
      WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      objc_msgSend(WeakRetained, "dataManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v33;
      v73 = v33;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v73, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v35, "insertDataObjects:error:", v36, a6);

      if (!v37)
      {
        v56 = 0;
        v15 = v64;
        v16 = v65;
        v18 = v63;
        v32 = v60;
        goto LABEL_20;
      }
      _HKInitializeLogging();
      v38 = (void *)*MEMORY[0x24BDD3000];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
      {
        v39 = v38;
        v40 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v72 = v40;
        v41 = v40;
        _os_log_impl(&dword_21A0AA000, v39, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting nanoSync due to HAEN delivery.", buf, 0xCu);

      }
      v42 = objc_loadWeakRetained(location);
      objc_msgSend(v42, "nanoSyncManager");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = MEMORY[0x24BDAC760];
      v68[1] = 3221225472;
      v68[2] = __98__HDHeadphoneExposureNotificationCenter_postSevenDayDoseNotification_nowDate_analyticsInfo_error___block_invoke;
      v68[3] = &unk_24DC5F4F0;
      v68[4] = self;
      objc_msgSend(v43, "syncHealthDataWithOptions:reason:completion:", 0, CFSTR("HAEN HKCategorySample Inserted"), v68);

      _HKInitializeLogging();
      v44 = *MEMORY[0x24BDD3000];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21A0AA000, v44, OS_LOG_TYPE_DEFAULT, "Requesting cloudSync due to HAEN delivery.", buf, 2u);
      }
      v45 = objc_msgSend(objc_alloc(MEMORY[0x24BDD3998]), "initWithPush:pull:lite:", 1, 0, 1);
      cloudSyncManager = self->_cloudSyncManager;
      v58 = (void *)v45;
      v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3A00]), "initWithChangesSyncRequest:", v45);
      v67[0] = MEMORY[0x24BDAC760];
      v67[1] = 3221225472;
      v67[2] = __98__HDHeadphoneExposureNotificationCenter_postSevenDayDoseNotification_nowDate_analyticsInfo_error___block_invoke_204;
      v67[3] = &unk_24DC5F4F0;
      v67[4] = self;
      -[HDCloudSyncManager syncWithRequest:reason:completion:](cloudSyncManager, "syncWithRequest:reason:completion:", v47, CFSTR("HAEN HKCategorySample Inserted"), v67);

      v16 = v65;
      objc_msgSend(v65, "duration");
      v49 = v48;
      v50 = objc_msgSend(v10, "includesPrunableData");
      v51 = objc_loadWeakRetained(location);
      objc_msgSend(v51, "database");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDHeadphoneExposureNotificationCenter _reportHeadphoneNotificationWithNowDate:eventDuration:exposureLevel:exposureDuration:hasPrunableData:isDeviceLocked:analyticsInfo:](self, "_reportHeadphoneNotificationWithNowDate:eventDuration:exposureLevel:exposureDuration:hasPrunableData:isDeviceLocked:analyticsInfo:", v11, v50, objc_msgSend(v52, "isProtectedDataAvailable") ^ 1, v12, v49, v22, v26);

      notificationSyncManager = self->_notificationSyncManager;
      v66 = 0;
      LOBYTE(v50) = -[HDHeadphoneExposureNotificationSyncManager notifyHAENotificationAddedWithSample:error:](notificationSyncManager, "notifyHAENotificationAddedWithSample:error:", v60, &v66);
      v54 = v66;
      if ((v50 & 1) == 0)
      {
        _HKInitializeLogging();
        v55 = (void *)*MEMORY[0x24BDD3000];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_ERROR))
          -[HDHeadphoneExposureNotificationCenter postSevenDayDoseNotification:nowDate:analyticsInfo:error:].cold.1(v55);
      }
      v56 = v60;

      v32 = v60;
    }
    else
    {
      v56 = 0;
    }
    v18 = v63;
    v15 = v64;
LABEL_20:

    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a6, 111, CFSTR("Cannot Send 7-Day HAEN: Feature Disabled."));
  v56 = 0;
LABEL_23:

  return v56;
}

void __98__HDHeadphoneExposureNotificationCenter_postSevenDayDoseNotification_nowDate_analyticsInfo_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3000];
  v7 = *MEMORY[0x24BDD3000];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v6;
      v10 = 138543362;
      v11 = (id)objc_opt_class();
      v9 = v11;
      _os_log_impl(&dword_21A0AA000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully nano synced 7-Day HAEN HKCategorySample.", (uint8_t *)&v10, 0xCu);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __98__HDHeadphoneExposureNotificationCenter_postSevenDayDoseNotification_nowDate_analyticsInfo_error___block_invoke_cold_1(a1, v6);
  }

}

void __98__HDHeadphoneExposureNotificationCenter_postSevenDayDoseNotification_nowDate_analyticsInfo_error___block_invoke_204(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3000];
  v7 = *MEMORY[0x24BDD3000];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v6;
      v10 = 138543362;
      v11 = (id)objc_opt_class();
      v9 = v11;
      _os_log_impl(&dword_21A0AA000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully cloud synced 7-Day HAEN HKCategorySample.", (uint8_t *)&v10, 0xCu);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __98__HDHeadphoneExposureNotificationCenter_postSevenDayDoseNotification_nowDate_analyticsInfo_error___block_invoke_204_cold_1(a1, v6);
  }

}

- (void)_reportHeadphoneNotificationWithNowDate:(id)a3 eventDuration:(double)a4 exposureLevel:(double)a5 exposureDuration:(double)a6 hasPrunableData:(BOOL)a7 isDeviceLocked:(BOOL)a8 analyticsInfo:(id)a9
{
  id v11;
  id v12;
  id WeakRetained;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v11 = a3;
  v12 = a9;
  if (v12)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v14 = objc_msgSend(WeakRetained, "profileType");

    if (v14 == 1)
    {
      if (HKImproveHealthAndActivityAnalyticsAllowed())
      {
        v17 = v11;
        v18 = v12;
        AnalyticsSendEventLazy();

      }
    }
    else
    {
      _HKInitializeLogging();
      v16 = (void *)*MEMORY[0x24BDD3000];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_FAULT))
        -[HDHeadphoneExposureNotificationCenter _reportHeadphoneNotificationWithNowDate:eventDuration:exposureLevel:exposureDuration:hasPrunableData:isDeviceLocked:analyticsInfo:].cold.2(v16, (uint64_t)self, (id *)&self->_profile);
    }
  }
  else
  {
    _HKInitializeLogging();
    v15 = (void *)*MEMORY[0x24BDD3000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_FAULT))
      -[HDHeadphoneExposureNotificationCenter _reportHeadphoneNotificationWithNowDate:eventDuration:exposureLevel:exposureDuration:hasPrunableData:isDeviceLocked:analyticsInfo:].cold.1(v15);
  }

}

id __171__HDHeadphoneExposureNotificationCenter__reportHeadphoneNotificationWithNowDate_eventDuration_exposureLevel_exposureDuration_hasPrunableData_isDeviceLocked_analyticsInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[9];
  _QWORD v16[11];

  v16[9] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 544, *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = CFSTR("averageSoundLevel");
  +[HDAudioAnalyticsUtilities boundedIntegerForLEQ:](HDAudioAnalyticsUtilities, "boundedIntegerForLEQ:", *(double *)(a1 + 48));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v14;
  v15[1] = CFSTR("dayOfWeek");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v3, "valueForComponent:", 512));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v4;
  v15[2] = CFSTR("eventDuration");
  +[HDAudioAnalyticsUtilities boundedIntegerForEventDuration:](HDAudioAnalyticsUtilities, "boundedIntegerForEventDuration:", *(double *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v5;
  v15[3] = CFSTR("durationActualListeningTime");
  +[HDAudioAnalyticsUtilities boundedIntegerForExposureDuration:](HDAudioAnalyticsUtilities, "boundedIntegerForExposureDuration:", *(double *)(a1 + 64));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v6;
  v15[4] = CFSTR("hasPrunableData");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 72));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v7;
  v15[5] = CFSTR("hourOfDay");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v3, "valueForComponent:", 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v8;
  v15[6] = CFSTR("isDeviceLocked");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 73));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v9;
  v15[7] = CFSTR("minutesSinceLastUnlock");
  objc_msgSend(*(id *)(a1 + 40), "boundedIntegerForMinutesSinceLastUnlockWithNowDate:", *(_QWORD *)(a1 + 32));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[7] = v10;
  v15[8] = CFSTR("timeSinceLastNotification");
  objc_msgSend(*(id *)(a1 + 40), "boundedIntegerForTimeSinceLastNotificationWithNowDate:", *(_QWORD *)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudSyncManager, 0);
  objc_storeStrong((id *)&self->_notificationSyncManager, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)postSevenDayDoseNotification:(void *)a1 nowDate:analyticsInfo:error:.cold.1(void *a1)
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

  OUTLINED_FUNCTION_5(a1);
  v2 = (void *)OUTLINED_FUNCTION_2_0();
  v3 = OUTLINED_FUNCTION_0_2(v2);
  OUTLINED_FUNCTION_4(&dword_21A0AA000, v4, v5, "[%{public}@] Failure to send HAEN notification sync: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

void __98__HDHeadphoneExposureNotificationCenter_postSevenDayDoseNotification_nowDate_analyticsInfo_error___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_4_0(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_2_0();
  v4 = OUTLINED_FUNCTION_0_2(v3);
  OUTLINED_FUNCTION_4(&dword_21A0AA000, v5, v6, "[%{public}@] Failure to nano sync 7-Day HAEN HKCategorySample: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

void __98__HDHeadphoneExposureNotificationCenter_postSevenDayDoseNotification_nowDate_analyticsInfo_error___block_invoke_204_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_4_0(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_2_0();
  v4 = OUTLINED_FUNCTION_0_2(v3);
  OUTLINED_FUNCTION_4(&dword_21A0AA000, v5, v6, "[%{public}@] Failure to cloud sync 7-Day HAEN HKCategorySample: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

- (void)_reportHeadphoneNotificationWithNowDate:(void *)a1 eventDuration:exposureLevel:exposureDuration:hasPrunableData:isDeviceLocked:analyticsInfo:.cold.1(void *a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_5(a1);
  v2 = 138543362;
  v3 = objc_opt_class();
  _os_log_fault_impl(&dword_21A0AA000, v1, OS_LOG_TYPE_FAULT, "[%{public}@ Missing analyticsInfo for 7-Day HAEN analytics.", (uint8_t *)&v2, 0xCu);

}

- (void)_reportHeadphoneNotificationWithNowDate:(id *)a3 eventDuration:exposureLevel:exposureDuration:hasPrunableData:isDeviceLocked:analyticsInfo:.cold.2(void *a1, uint64_t a2, id *a3)
{
  NSObject *v3;
  uint64_t v5;
  id WeakRetained;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;

  OUTLINED_FUNCTION_5(a1);
  v5 = OUTLINED_FUNCTION_2_0();
  WeakRetained = objc_loadWeakRetained(a3);
  v7 = 138543618;
  v8 = v5;
  v9 = 2048;
  v10 = objc_msgSend(WeakRetained, "profileType");
  _os_log_fault_impl(&dword_21A0AA000, v3, OS_LOG_TYPE_FAULT, "[%{public}@ Only primary profiles should be able to trigger HAENs: %ld.", (uint8_t *)&v7, 0x16u);

  OUTLINED_FUNCTION_1();
}

@end
