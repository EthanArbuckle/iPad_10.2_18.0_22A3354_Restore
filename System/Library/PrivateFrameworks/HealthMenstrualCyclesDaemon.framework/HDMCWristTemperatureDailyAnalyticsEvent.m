@implementation HDMCWristTemperatureDailyAnalyticsEvent

- (HDMCWristTemperatureDailyAnalyticsEvent)initWithProfile:(id)a3 analysisManager:(id)a4 sleepStore:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  HDMCWristTemperatureDailyAnalyticsEvent *v16;

  v8 = (objc_class *)MEMORY[0x24BE46C08];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend([v8 alloc], "initWithObservationEnabled:", 0);
  objc_msgSend(v11, "wristDetectionSettingManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x24BDBCF50]);
  v15 = (void *)objc_msgSend(v14, "initWithSuiteName:", *MEMORY[0x24BDD46C0]);
  v16 = -[HDMCWristTemperatureDailyAnalyticsEvent initWithProfile:analysisManager:settingsManager:sleepStore:wristDetectionSettingManager:privacyDefaults:](self, "initWithProfile:analysisManager:settingsManager:sleepStore:wristDetectionSettingManager:privacyDefaults:", v11, v10, v12, v9, v13, v15);

  return v16;
}

- (HDMCWristTemperatureDailyAnalyticsEvent)initWithProfile:(id)a3 analysisManager:(id)a4 settingsManager:(id)a5 sleepStore:(id)a6 wristDetectionSettingManager:(id)a7 privacyDefaults:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HDMCWristTemperatureDailyAnalyticsEvent *v18;
  HDMCWristTemperatureDailyAnalyticsEvent *v19;
  id v21;
  id v22;
  objc_super v23;

  v14 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HDMCWristTemperatureDailyAnalyticsEvent;
  v18 = -[HDMCWristTemperatureDailyAnalyticsEvent init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_profile, v14);
    objc_storeStrong((id *)&v19->_analysisManager, a4);
    objc_storeStrong((id *)&v19->_settingsManager, a5);
    objc_storeStrong((id *)&v19->_sleepStore, a6);
    objc_storeStrong((id *)&v19->_wristDetectionSettingManager, a7);
    objc_storeStrong((id *)&v19->_privacyDefaults, a8);
  }

  return v19;
}

- (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.health.wristtemperature.daily");
}

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  v5 = a3;
  objc_msgSend(v5, "environmentDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "environmentDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "calendarCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "environmentDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithBool:", objc_msgSend(v13, "isImproveHealthAndActivityEnabled"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("isImproveHealthAndActivityAllowed"));

  objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_24DB30240, CFSTR("algorithmVersion"));
  -[HDMCWristTemperatureDailyAnalyticsEvent _isHeartRateEnabledInPrivacy](self, "_isHeartRateEnabledInPrivacy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("isHeartRateEnabled"));

  -[HDMCWristTemperatureDailyAnalyticsEvent _areRespiratoryRateMeasurementsEnabledWithDataSource:](self, "_areRespiratoryRateMeasurementsEnabledWithDataSource:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("isRespiratoryRateEnabled"));

  -[HDMCWristTemperatureDailyAnalyticsEvent _areBloodOxygenMeasurementsEnabledWithDataSource:](self, "_areBloodOxygenMeasurementsEnabledWithDataSource:", v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("isBloodOxygenEnabled"));

  -[HDMCWristTemperatureDailyAnalyticsEvent _isCycleTrackingWristTemperatureInputEnabledWithDataSource:](self, "_isCycleTrackingWristTemperatureInputEnabledWithDataSource:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("isCTWristTempInputEnabled"));

  -[HDMCWristTemperatureDailyAnalyticsEvent _isWristTemperatureEnabledWithDataSource:](self, "_isWristTemperatureEnabledWithDataSource:", v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, CFSTR("isWristTempEnabled"));

  -[HDMCWristTemperatureDailyAnalyticsEvent _isWristDetectionEnabled](self, "_isWristDetectionEnabled");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, CFSTR("isWristDetectionEnabled"));

  objc_msgSend(v5, "environmentDataSource");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "calendarCache");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMCWristTemperatureDailyAnalyticsEvent _lastSleepDayHasSleepDataWithCurrentDate:calendarCache:](self, "_lastSleepDayHasSleepDataWithCurrentDate:calendarCache:", v7, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v23, CFSTR("hasWatchSleepPastDay"));

  -[HDMCWristTemperatureDailyAnalyticsEvent _lastSleepDayHasSleepDataFromCompatibleProductTypeWithCurrentDate:gregorianCalendar:](self, "_lastSleepDayHasSleepDataFromCompatibleProductTypeWithCurrentDate:gregorianCalendar:", v7, v10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v24, CFSTR("internalOnly_sleepPastDayFromCompatibleProductType"));

  -[HDMCWristTemperatureDailyAnalyticsEvent _lastSleepDayHasWristTemperatureDataWithCurrentDate:gregorianCalendar:](self, "_lastSleepDayHasWristTemperatureDataWithCurrentDate:gregorianCalendar:", v7, v10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v25, CFSTR("hasTempPastDay"));

  -[HDMCWristTemperatureDailyAnalyticsEvent _weeksSinceDeliveryWithDataSource:](self, "_weeksSinceDeliveryWithDataSource:", v5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v26, CFSTR("weeksSinceOnboarded"));

  -[HDMCWristTemperatureDailyAnalyticsEvent _preferredSleepingWristTemperatureUnit](self, "_preferredSleepingWristTemperatureUnit");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v27, CFSTR("tempDisplayUnit"));

  -[HDMCWristTemperatureDailyAnalyticsEvent _countOfLast30DaysWithSleepingWristTemperatureSamplesWithCurrentDate:gregorianCalendar:](self, "_countOfLast30DaysWithSleepingWristTemperatureSamplesWithCurrentDate:gregorianCalendar:", v7, v10);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v28, CFSTR("numDaysTempPast30Days"));

  objc_msgSend(v5, "environmentDataSource");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "calendarCache");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMCWristTemperatureDailyAnalyticsEvent _countOfLast30DaysWithSleepSamplesWithCurrentDate:calendarCache:](self, "_countOfLast30DaysWithSleepSamplesWithCurrentDate:calendarCache:", v7, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v31, CFSTR("numDaysWatchSleepPast30Days"));

  -[HDMCWristTemperatureDailyAnalyticsEvent _daysWithStandHoursInLast30DaysWithCurrentDate:gregorianCalendar:](self, "_daysWithStandHoursInLast30DaysWithCurrentDate:gregorianCalendar:", v7, v10);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v32, CFSTR("numDaysWatchWornPast30Days"));

  -[HDMCWristTemperatureDailyAnalyticsEvent _sleepingWristTemperatureDominantWatchSampleCountOverLast30DaysWithCurrentDate:gregorianCalendar:](self, "_sleepingWristTemperatureDominantWatchSampleCountOverLast30DaysWithCurrentDate:gregorianCalendar:", v7, v10);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v33, CFSTR("numDaysTempCalcPast30Days"));

  -[HDMCWristTemperatureDailyAnalyticsEvent _wristTemperatureCompatibleDeviceFields](self, "_wristTemperatureCompatibleDeviceFields");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addEntriesFromDictionary:", v34);

  -[HDMCWristTemperatureDailyAnalyticsEvent _dominantWatchLast30DaysFieldsWithCurrentDate:gregorianCalendar:](self, "_dominantWatchLast30DaysFieldsWithCurrentDate:gregorianCalendar:", v7, v10);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addEntriesFromDictionary:", v35);

  -[HDMCWristTemperatureDailyAnalyticsEvent _countOfUniqueSourcesOfWristTemperatureSamplesFieldsWithCurrentDate:gregorianCalendar:](self, "_countOfUniqueSourcesOfWristTemperatureSamplesFieldsWithCurrentDate:gregorianCalendar:", v7, v10);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addEntriesFromDictionary:", v36);

  -[HDMCWristTemperatureDailyAnalyticsEvent _sleepFields](self, "_sleepFields");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addEntriesFromDictionary:", v37);

  -[HDMCWristTemperatureDailyAnalyticsEvent _allNoiseFieldsWithCurrentDate:gregorianCalendar:](self, "_allNoiseFieldsWithCurrentDate:gregorianCalendar:", v7, v10);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addEntriesFromDictionary:", v38);

  objc_msgSend(v5, "environmentDataSource");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v39, "isImproveHealthAndActivityEnabled");
  if ((v5 & 1) == 0)
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("stdDevPast30Days"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("stdDevFilteredPast30Days"));
  }
  v40 = (void *)objc_msgSend(v11, "copy");

  return v40;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a3;
  objc_msgSend(v5, "environmentDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "environmentDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "calendarCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMCWristTemperatureDailyAnalyticsEvent _hasCycleFactorsActive](self, "_hasCycleFactorsActive");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("hasCycleFactorsActive"));

  -[HDMCWristTemperatureDailyAnalyticsEvent _isIRNEnabledWithDataSource:](self, "_isIRNEnabledWithDataSource:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("isIRNEnabled"));

  -[HDMCWristTemperatureDailyAnalyticsEvent _isAFibHistoryEnabledWithDataSource:](self, "_isAFibHistoryEnabledWithDataSource:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("isAFibHistoryEnabled"));

  -[HDMCWristTemperatureDailyAnalyticsEvent _hoursAsleepDuringLastSleepDayWithCurrentDate:gregorianCalendar:](self, "_hoursAsleepDuringLastSleepDayWithCurrentDate:gregorianCalendar:", v7, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("watchSleepHoursPastDay"));

  -[HDMCWristTemperatureDailyAnalyticsEvent _lastSleepDayRelativeSleepingWristTemperatureWithCurrentDate:gregorianCalendar:](self, "_lastSleepDayRelativeSleepingWristTemperatureWithCurrentDate:gregorianCalendar:", v7, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("tempDisplayedPastDay"));

  -[HDMCWristTemperatureDailyAnalyticsEvent _IHAGatedDemographicsFieldsWithDataSource:](self, "_IHAGatedDemographicsFieldsWithDataSource:", v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addEntriesFromDictionary:", v17);
  -[HDMCWristTemperatureDailyAnalyticsEvent _IHAGatedSleepingWristTemperatureStatisticsFieldsWithCurrentDate:gregorianCalendar:](self, "_IHAGatedSleepingWristTemperatureStatisticsFieldsWithCurrentDate:gregorianCalendar:", v7, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addEntriesFromDictionary:", v18);

  -[HDMCWristTemperatureDailyAnalyticsEvent _IHAGatedLastSleepDayWristTemperatureFieldsWithCurrentDate:gregorianCalendar:](self, "_IHAGatedLastSleepDayWristTemperatureFieldsWithCurrentDate:gregorianCalendar:", v7, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addEntriesFromDictionary:", v19);

  v20 = (void *)objc_msgSend(v11, "copy");
  return v20;
}

- (id)_IHAGatedDemographicsFieldsWithDataSource:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "healthDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "biologicalSexWithError:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    HKAnalyticsPropertyValueForBiologicalSex();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDD27C0]);

  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", *MEMORY[0x24BDD27F8], *MEMORY[0x24BDD27C0]);
  }
  objc_msgSend(v3, "healthDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "environmentDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ageWithCurrentDate:error:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BDD27B0]);

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

- (id)_wristTemperatureCompatibleDeviceFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HDMCWristTemperatureDailyAnalyticsEvent _pairedWristTemperatureCompatibleDevice](self, "_pairedWristTemperatureCompatibleDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "valueForProperty:", *MEMORY[0x24BE6B3B0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("compatibleWatchProductType"));

    objc_msgSend(v2, "valueForProperty:", *MEMORY[0x24BE6B3E0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("compatiblePairedWatchBuild"));

    objc_msgSend(v2, "valueForProperty:", *MEMORY[0x24BE6B308]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("compatibleWatchHousingColorAndMaterial"));

    v7 = (void *)objc_msgSend(v3, "copy");
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1B8];
  }

  return v7;
}

- (id)_pairedWristTemperatureCompatibleDevice
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getActivePairedDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && -[HDMCWristTemperatureDailyAnalyticsEvent _isDeviceWristTemperatureCompatible:](self, "_isDeviceWristTemperatureCompatible:", v4))
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(v3, "getPairedDevices");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = (void *)MEMORY[0x24BDBD1A8];
    if (v6)
      v8 = (void *)v6;
    v9 = v8;

    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __82__HDMCWristTemperatureDailyAnalyticsEvent__pairedWristTemperatureCompatibleDevice__block_invoke;
    v11[3] = &unk_24DB22020;
    v11[4] = self;
    objc_msgSend(v9, "hk_firstObjectPassingTest:", v11);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

uint64_t __82__HDMCWristTemperatureDailyAnalyticsEvent__pairedWristTemperatureCompatibleDevice__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_isDeviceWristTemperatureCompatible:", a2);
}

- (BOOL)_isDeviceWristTemperatureCompatible:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (objc_class *)MEMORY[0x24BDD1880];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", CFSTR("CBC78224-8F5E-4D43-8666-69ADBE2A6277"));
  v6 = objc_msgSend(v4, "supportsCapability:", v5);

  return v6;
}

- (id)_dominantWatchLast30DaysFieldsWithCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[HDMCWristTemperatureDailyAnalyticsEvent _dominantSleepingWristTemperatureSourceOverLastNDays:currentDate:gregorianCalendar:](self, "_dominantSleepingWristTemperatureSourceOverLastNDays:currentDate:gregorianCalendar:", 30, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_productType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("dominantWatchPast30DaysProductType"));

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAppleInternalInstall");

  if (v9)
  {
    v10 = (void *)MEMORY[0x24BE40AD0];
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v10, "_wristTemperatureIdentifierDomainWithProfile:", WeakRetained);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "_wristTemperatureSerialNumbersBySourceIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("internalOnly_dominantWatchPast30DaysSerialNumber"));
  }
  v16 = (void *)objc_msgSend(v6, "copy");

  return v16;
}

- (id)_isHeartRateEnabledInPrivacy
{
  void *v2;
  void *v3;
  id v4;

  -[NSUserDefaults objectForKey:](self->_privacyDefaults, "objectForKey:", *MEMORY[0x24BDD46D8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x24BDBD1C8];
  v4 = v2;

  return v4;
}

- (id)_isWristDetectionEnabled
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HKWristDetectionSettingManager isWristDetectEnabled](self->_wristDetectionSettingManager, "isWristDetectEnabled"));
}

- (id)_isWristTemperatureEnabledWithDataSource:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;

  -[HDMCWristTemperatureDailyAnalyticsEvent _featureStatusForFeatureIdentifier:dataSource:error:](self, "_featureStatusForFeatureIdentifier:dataSource:error:", *MEMORY[0x24BDD2E88], a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDD2CA8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x24BDD2D10]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v4, "isOnboardingRecordPresent") & v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (id)*MEMORY[0x24BDD2780];
  }
  v8 = v7;

  return v8;
}

- (id)_isCycleTrackingWristTemperatureInputEnabledWithDataSource:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;

  -[HDMCWristTemperatureDailyAnalyticsEvent _featureStatusForFeatureIdentifier:dataSource:error:](self, "_featureStatusForFeatureIdentifier:dataSource:error:", *MEMORY[0x24BDD2E40], a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDD2CA8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x24BDD2D10]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v4, "isOnboardingRecordPresent") & v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (id)*MEMORY[0x24BDD2780];
  }
  v8 = v7;

  return v8;
}

- (id)_isIRNEnabledWithDataSource:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  id v10;
  void *v11;

  -[HDMCWristTemperatureDailyAnalyticsEvent _featureStatusForFeatureIdentifier:dataSource:error:](self, "_featureStatusForFeatureIdentifier:dataSource:error:", *MEMORY[0x24BDD2E00], a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = *MEMORY[0x24BDD2CA8];
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDD2CA8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x24BDD2D10]);

    if (v7)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x24BDD2D38]);

    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v4, "isOnboardingRecordPresent") & v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (id)*MEMORY[0x24BDD2780];
  }
  v11 = v10;

  return v11;
}

- (id)_isAFibHistoryEnabledWithDataSource:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;

  -[HDMCWristTemperatureDailyAnalyticsEvent _featureStatusForFeatureIdentifier:dataSource:error:](self, "_featureStatusForFeatureIdentifier:dataSource:error:", *MEMORY[0x24BDD2DC8], a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDD2CA8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x24BDD2D10]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v4, "isOnboardingRecordPresent") & v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (id)*MEMORY[0x24BDD2780];
  }
  v8 = v7;

  return v8;
}

- (id)_areRespiratoryRateMeasurementsEnabledWithDataSource:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;

  -[HDMCWristTemperatureDailyAnalyticsEvent _featureStatusForFeatureIdentifier:dataSource:error:](self, "_featureStatusForFeatureIdentifier:dataSource:error:", *MEMORY[0x24BDD2E58], a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDD2CA8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x24BDD2D10]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v4, "isOnboardingRecordPresent") & v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (id)*MEMORY[0x24BDD2780];
  }
  v8 = v7;

  return v8;
}

- (id)_areBloodOxygenMeasurementsEnabledWithDataSource:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;

  -[HDMCWristTemperatureDailyAnalyticsEvent _featureStatusForFeatureIdentifier:dataSource:error:](self, "_featureStatusForFeatureIdentifier:dataSource:error:", *MEMORY[0x24BDD2E48], a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDD2CA8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x24BDD2CD8]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v4, "isOnboardingRecordPresent") & v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (id)*MEMORY[0x24BDD2780];
  }
  v8 = v7;

  return v8;
}

- (id)_sleepFields
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCED8];
  v21 = CFSTR("isSleepFocusSetUp");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HKSPSleepStore hasSleepFocusMode](self->_sleepStore, "hasSleepFocusMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPSleepStore currentSleepSettingsWithError:](self->_sleepStore, "currentSleepSettingsWithError:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v7, "sleepTracking"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("isWatchSleepTrackingEnabled"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (objc_msgSend(v8, "sleepModeOptions") >> 14) & 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("isSleepScreenEnabled"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "scheduledSleepMode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("isAutomatedSleepFocusEnabled"));

  }
  else
  {
    v12 = *MEMORY[0x24BDD2780];
    objc_msgSend(v6, "setObject:forKeyedSubscript:", *MEMORY[0x24BDD2780], CFSTR("isWatchSleepTrackingEnabled"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("isSleepScreenEnabled"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("isAutomatedSleepFocusEnabled"));
  }
  -[HKSPSleepStore currentSleepScheduleWithError:](self->_sleepStore, "currentSleepScheduleWithError:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v13, "isEnabled"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("isSleepScheduleEnabled"));

  }
  else
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", *MEMORY[0x24BDD2780], CFSTR("isSleepScheduleEnabled"));
  }
  -[HKSPSleepStore currentSleepEventRecordWithError:](self->_sleepStore, "currentSleepEventRecordWithError:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v16, "isAnySleepTrackingOnboardingCompleted"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("isSleepOnWatchOnboarded"));

  }
  else
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", *MEMORY[0x24BDD2780], CFSTR("isSleepOnWatchOnboarded"));
  }
  v19 = (void *)objc_msgSend(v6, "copy");

  return v19;
}

- (id)_IHAGatedSleepingWristTemperatureStatisticsFieldsWithCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  -[HDMCWristTemperatureDailyAnalyticsEvent _dominantSleepingWristTemperatureSourceEntityPredicateOverLastNDays:currentDate:gregorianCalendar:](self, "_dominantSleepingWristTemperatureSourceEntityPredicateOverLastNDays:currentDate:gregorianCalendar:", 30, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[HDMCWristTemperatureDailyAnalyticsEvent _discreteSleepingWristTemperatureStatisticsLast30DaysWithCurrentDate:gregorianCalendar:dominantWatchSourceEntityPredicate:](self, "_discreteSleepingWristTemperatureStatisticsLast30DaysWithCurrentDate:gregorianCalendar:dominantWatchSourceEntityPredicate:", v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    -[HDMCWristTemperatureDailyAnalyticsEvent _discreteRelativeSleepingWristTemperatureStatisticsLast30DaysWithCurrentDate:gregorianCalendar:dominantWatchSourceEntityPredicate:](self, "_discreteRelativeSleepingWristTemperatureStatisticsLast30DaysWithCurrentDate:gregorianCalendar:dominantWatchSourceEntityPredicate:", v6, v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addEntriesFromDictionary:", v11);

    -[HDMCWristTemperatureDailyAnalyticsEvent _medianSleepingWristTemperatureLast30DaysWithCurrentDate:gregorianCalendar:dominantWatchSourceEntityPredicate:](self, "_medianSleepingWristTemperatureLast30DaysWithCurrentDate:gregorianCalendar:dominantWatchSourceEntityPredicate:", v6, v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("aggTempPast30DaysMedian"));

    v14 = (void *)objc_msgSend(v10, "copy");
  }
  else
  {
    v14 = (void *)MEMORY[0x24BDBD1B8];
  }

  return v14;
}

- (id)_discreteSleepingWristTemperatureStatisticsLast30DaysWithCurrentDate:(id)a3 gregorianCalendar:(id)a4 dominantWatchSourceEntityPredicate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id WeakRetained;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[3];
  _QWORD v35[4];

  v35[3] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  _HKMCAppleSleepingWristTemperatureType();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE40C28], "calculatorForQuantityType:intervalCollection:options:mergeStrategy:", v11, 0, 14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMCWristTemperatureDailyAnalyticsEvent _predicateForAppleWatchSamplesInLastNSleepDays:currentDate:gregorianCalendar:sampleType:sourceEntityPredicate:](self, "_predicateForAppleWatchSamplesInLastNSleepDays:currentDate:gregorianCalendar:sampleType:sourceEntityPredicate:", 30, v10, v9, v11, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(MEMORY[0x24BE40C38]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v16 = (void *)objc_msgSend(v14, "initForProfile:quantityType:predicate:restrictedSourceEntities:", WeakRetained, v11, v13, 0);

  objc_msgSend(v12, "setDataSource:", v16);
  v33 = 0;
  v17 = objc_msgSend(v12, "queryForInitialStatisticsWithError:", &v33);
  v18 = v33;
  objc_msgSend(v12, "currentStatistics");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  v21 = (void *)MEMORY[0x24BDBD1B8];
  if (v17 && v19 && objc_msgSend(v19, "dataCount"))
  {
    v34[0] = CFSTR("aggTempPast30DaysMin");
    objc_msgSend(v20, "minimumQuantity");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDMCWristTemperatureDailyAnalyticsEvent _celsiusValueFromQuantity:scale:](self, "_celsiusValueFromQuantity:scale:", v32, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringValue");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v30;
    v34[1] = CFSTR("aggTempPast30DaysMax");
    objc_msgSend(v20, "maximumQuantity");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDMCWristTemperatureDailyAnalyticsEvent _celsiusValueFromQuantity:scale:](self, "_celsiusValueFromQuantity:scale:", v29, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringValue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v27;
    v34[2] = CFSTR("aggTempPast30DaysMean");
    objc_msgSend(v20, "averageQuantity");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDMCWristTemperatureDailyAnalyticsEvent _celsiusValueFromQuantity:scale:](self, "_celsiusValueFromQuantity:scale:", v22, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringValue");
    v24 = v18;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v24;
  }

  return v21;
}

- (id)_discreteRelativeSleepingWristTemperatureStatisticsLast30DaysWithCurrentDate:(id)a3 gregorianCalendar:(id)a4 dominantWatchSourceEntityPredicate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id WeakRetained;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  id v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  _HKMCAppleSleepingWristTemperatureType();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE40C28], "calculatorForQuantityType:intervalCollection:options:mergeStrategy:", v11, 0, _HKStatisticsOptionBaselineRelativeQuantities() | 0xE, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMCWristTemperatureDailyAnalyticsEvent _predicateForAppleWatchSamplesInLastNSleepDays:currentDate:gregorianCalendar:sampleType:sourceEntityPredicate:](self, "_predicateForAppleWatchSamplesInLastNSleepDays:currentDate:gregorianCalendar:sampleType:sourceEntityPredicate:", 30, v10, v9, v11, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(MEMORY[0x24BE40C48]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v11, "_rollingBaselineConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initForProfile:quantityType:predicate:restrictedSourceEntities:configuration:currentDate:", WeakRetained, v11, v13, 0, v16, v10);

  objc_msgSend(v12, "setDataSource:", v17);
  v28 = 0;
  v18 = objc_msgSend(v12, "queryForInitialStatisticsWithError:", &v28);
  v19 = v28;
  objc_msgSend(v12, "currentStatistics");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  v22 = (void *)MEMORY[0x24BDBD1B8];
  if (v18 && v20 && objc_msgSend(v20, "dataCount"))
  {
    v29[0] = CFSTR("aggTempDisplayedPast30DaysMin");
    objc_msgSend(v21, "minimumQuantity");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDMCWristTemperatureDailyAnalyticsEvent _changeInCelsiusStringFromQuantity:scale:](self, "_changeInCelsiusStringFromQuantity:scale:", v27, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = CFSTR("aggTempDisplayedPast30DaysMax");
    v30[0] = v23;
    objc_msgSend(v21, "maximumQuantity");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDMCWristTemperatureDailyAnalyticsEvent _changeInCelsiusStringFromQuantity:scale:](self, "_changeInCelsiusStringFromQuantity:scale:", v24, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v22;
}

- (id)_medianSleepingWristTemperatureLast30DaysWithCurrentDate:(id)a3 gregorianCalendar:(id)a4 dominantWatchSourceEntityPredicate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id WeakRetained;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  _HKMCAppleSleepingWristTemperatureType();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE40C28], "calculatorForQuantityType:intervalCollection:options:mergeStrategy:", v11, 0, _HKStatisticsOptionPercentile(), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE40C58]), "initWithPercentile:", &unk_24DB30558);
  objc_msgSend(v12, "setStatisticsConfiguration:", v13);

  -[HDMCWristTemperatureDailyAnalyticsEvent _predicateForAppleWatchSamplesInLastNSleepDays:currentDate:gregorianCalendar:sampleType:sourceEntityPredicate:](self, "_predicateForAppleWatchSamplesInLastNSleepDays:currentDate:gregorianCalendar:sampleType:sourceEntityPredicate:", 30, v10, v9, v11, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc(MEMORY[0x24BE40C38]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v17 = (void *)objc_msgSend(v15, "initForProfile:quantityType:predicate:restrictedSourceEntities:", WeakRetained, v11, v14, 0);

  objc_msgSend(v12, "setDataSource:", v17);
  v24 = 0;
  v18 = objc_msgSend(v12, "queryForInitialStatisticsWithError:", &v24);
  objc_msgSend(v12, "currentStatistics");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  v21 = 0;
  if (v18 && v19)
  {
    if (objc_msgSend(v19, "dataCount"))
    {
      objc_msgSend(v20, "percentileQuantity");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDMCWristTemperatureDailyAnalyticsEvent _celsiusValueFromQuantity:scale:](self, "_celsiusValueFromQuantity:scale:", v22, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = 0;
    }
  }

  return v21;
}

- (id)_sleepingWristTemperatureDominantWatchSampleCountOverLast30DaysWithCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HDMCWristTemperatureDailyAnalyticsEvent _sleepingWristTemperatureSampleCountBySourceOverLastNDays:currentDate:gregorianCalendar:](self, "_sleepingWristTemperatureSampleCountBySourceOverLastNDays:currentDate:gregorianCalendar:", 30, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_firstObjectWithMaximumValueUsingEvaluationBlock:", &__block_literal_global_2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = &unk_24DB30258;
  v8 = v7;

  return v8;
}

uint64_t __140__HDMCWristTemperatureDailyAnalyticsEvent__sleepingWristTemperatureDominantWatchSampleCountOverLast30DaysWithCurrentDate_gregorianCalendar___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "doubleValue");
}

- (id)_countOfLast30DaysWithSleepingWristTemperatureSamplesWithCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id WeakRetained;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  _QWORD v41[4];
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _HKMCAppleSleepingWristTemperatureType();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_sleepDayStartWithCalendar:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingUnit:value:toDate:options:", 16, -30, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v11, "setCalendar:", v7);
  objc_msgSend(v11, "setDay:", 1);
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD41C0]), "initWithAnchorDate:intervalComponents:", v10, v11);
  objc_msgSend(MEMORY[0x24BE40C28], "calculatorForQuantityType:intervalCollection:options:mergeStrategy:", v8, v35, _HKStatisticsOptionPresence(), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMCWristTemperatureDailyAnalyticsEvent _predicateForAppleWatchSamplesInLast30SleepDaysRelativeToCurrentDate:gregorianCalendar:sampleType:](self, "_predicateForAppleWatchSamplesInLast30SleepDaysRelativeToCurrentDate:gregorianCalendar:sampleType:", v6, v7, v8);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x24BE40C38]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v34 = (void *)v13;
  v16 = objc_msgSend(v14, "initForProfile:quantityType:predicate:restrictedSourceEntities:", WeakRetained, v8, v13, 0);

  v33 = (void *)v16;
  objc_msgSend(v12, "setDataSource:", v16);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3FF8]), "initWithAnchorDate:statisticsInterval:", v10, v11);
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __130__HDMCWristTemperatureDailyAnalyticsEvent__countOfLast30DaysWithSleepingWristTemperatureSamplesWithCurrentDate_gregorianCalendar___block_invoke;
  v41[3] = &unk_24DB22088;
  v18 = v17;
  v42 = v18;
  objc_msgSend(v12, "setStatisticsHandler:", v41);
  v40 = 0;
  LODWORD(v13) = objc_msgSend(v12, "queryForInitialStatisticsWithError:", &v40);
  v19 = v40;
  v20 = 0;
  if ((_DWORD)v13)
  {
    v29 = v19;
    v30 = v10;
    v31 = v9;
    v32 = v6;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v18, "statistics");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    if (v22)
    {
      v23 = v22;
      v24 = 0;
      v25 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v37 != v25)
            objc_enumerationMutation(v21);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "dataCount"))
            ++v24;
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
      }
      while (v23);
    }
    else
    {
      v24 = 0;
    }

    if (v24 >= 30)
      v27 = 30;
    else
      v27 = v24;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v31;
    v6 = v32;
    v19 = v29;
    v10 = v30;
  }

  return v20;
}

uint64_t __130__HDMCWristTemperatureDailyAnalyticsEvent__countOfLast30DaysWithSleepingWristTemperatureSamplesWithCurrentDate_gregorianCalendar___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_insertStatistics:");
}

- (id)_countOfLast30DaysWithSleepSamplesWithCurrentDate:(id)a3 calendarCache:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id WeakRetained;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "hk_morningIndexWithCalendar:", v8);

  v10 = v9 - 30;
  v11 = objc_alloc(MEMORY[0x24BE40C00]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v7, "currentCalendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v11, "initWithProfile:cachingSession:gregorianCalendar:morningIndexRange:ascending:options:debugIdentifier:", WeakRetained, 0, v13, v10, 30, 1, 1, v15);

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __107__HDMCWristTemperatureDailyAnalyticsEvent__countOfLast30DaysWithSleepSamplesWithCurrentDate_calendarCache___block_invoke;
  v19[3] = &unk_24DB220B0;
  v19[4] = &v20;
  if ((objc_msgSend(v16, "enumerateWithError:handler:", 0, v19) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v21[3]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  _Block_object_dispose(&v20, 8);

  return v17;
}

uint64_t __107__HDMCWristTemperatureDailyAnalyticsEvent__countOfLast30DaysWithSleepSamplesWithCurrentDate_calendarCache___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "containsPeriodsWithAppleSleepTrackingData");
  if ((_DWORD)result)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

- (id)_hoursAsleepDuringLastSleepDayWithCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id WeakRetained;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  uint64_t i;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v38;
  HDMCWristTemperatureDailyAnalyticsEvent *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  _BYTE v51[128];
  _QWORD v52[4];

  v52[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2A28]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE40C28], "calculatorForCategoryType:intervalCollection:options:mergeStrategy:", v8, 0, 65, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMCWristTemperatureDailyAnalyticsEvent _predicateForAppleWatchSamplesInLastNSleepDays:currentDate:gregorianCalendar:sampleType:](self, "_predicateForAppleWatchSamplesInLastNSleepDays:currentDate:gregorianCalendar:sampleType:", 1, v6, v7, v8);
  v10 = objc_claimAutoreleasedReturnValue();
  HKCategoryValueSleepAnalysisAsleepValues();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HDCategorySampleEntityPredicateEqualToValues();
  v13 = objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BE40E20];
  v44 = (void *)v13;
  v45 = (void *)v10;
  v52[0] = v10;
  v52[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "predicateMatchingAllPredicates:", v15);
  v16 = objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc(MEMORY[0x24BE40C38]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v43 = (void *)v16;
  v19 = (void *)objc_msgSend(v17, "initForProfile:categoryType:predicate:restrictedSourceEntities:", WeakRetained, v8, v16, 0);

  objc_msgSend(v9, "setDataSource:", v19);
  v20 = objc_alloc(MEMORY[0x24BE40C40]);
  v21 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v19, "quantityType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v20, "initWithProfile:quantityType:", v21, v22);

  objc_msgSend(v9, "setSourceOrderProvider:", v23);
  v50 = 0;
  LODWORD(v16) = objc_msgSend(v9, "queryForInitialStatisticsWithError:", &v50);
  v42 = v50;
  objc_msgSend(v9, "currentStatistics");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  v26 = 0;
  if ((_DWORD)v16 && v24)
  {
    v38 = v23;
    v39 = self;
    v40 = v8;
    v41 = v7;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(v24, "sources");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v47;
      v31 = 0.0;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v47 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(v25, "durationForSource:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "doubleValueForUnit:", v34);
          v36 = v35;

          if (v36 > v31)
            v31 = v36;
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      }
      while (v29);
    }
    else
    {
      v31 = 0.0;
    }

    -[HDMCWristTemperatureDailyAnalyticsEvent _roundDouble:scale:](v39, "_roundDouble:scale:", 0, v31 / 3600.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v41;
    v8 = v40;
    v23 = v38;
  }

  return v26;
}

- (id)_daysWithStandHoursInLast30DaysWithCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
  HDProfile **p_profile;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;

  p_profile = &self->_profile;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  HDAnalyticsCountOfSleepDaysWithStandHoursPriorToDate();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_lastSleepDayHasSleepDataWithCurrentDate:(id)a3 calendarCache:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id WeakRetained;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "hk_morningIndexWithCalendar:", v8);

  v10 = v9 - 1;
  v11 = objc_alloc(MEMORY[0x24BE40C00]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v7, "currentCalendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v11, "initWithProfile:cachingSession:gregorianCalendar:morningIndexRange:ascending:options:debugIdentifier:", WeakRetained, 0, v13, v10, 1, 1, 1, v15);

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __98__HDMCWristTemperatureDailyAnalyticsEvent__lastSleepDayHasSleepDataWithCurrentDate_calendarCache___block_invoke;
  v19[3] = &unk_24DB220B0;
  v19[4] = &v20;
  if ((objc_msgSend(v16, "enumerateWithError:handler:", 0, v19) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v21[3] > 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  _Block_object_dispose(&v20, 8);

  return v17;
}

uint64_t __98__HDMCWristTemperatureDailyAnalyticsEvent__lastSleepDayHasSleepDataWithCurrentDate_calendarCache___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "containsPeriodsWithAppleSleepTrackingData");
  if ((_DWORD)result)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

- (id)_lastSleepDayHasSleepDataFromCompatibleProductTypeWithCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAppleInternalInstall");

  if (v9)
  {
    -[HDMCWristTemperatureDailyAnalyticsEvent _firstPartySleepSamplesFromLastNSleepDays:currentDate:gregorianCalendar:](self, "_firstPartySleepSamplesFromLastNSleepDays:currentDate:gregorianCalendar:", 1, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24DB30500);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __127__HDMCWristTemperatureDailyAnalyticsEvent__lastSleepDayHasSleepDataFromCompatibleProductTypeWithCurrentDate_gregorianCalendar___block_invoke;
      v16[3] = &unk_24DB220D8;
      v17 = v11;
      v12 = v11;
      v13 = objc_msgSend(v10, "hk_containsObjectPassingTest:", v16);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __127__HDMCWristTemperatureDailyAnalyticsEvent__lastSleepDayHasSleepDataFromCompatibleProductTypeWithCurrentDate_gregorianCalendar___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "sourceRevision");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_productType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "containsObject:", v5);

  return v6;
}

- (id)_lastSleepDayHasWristTemperatureDataWithCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
  void *v4;
  void *v5;

  -[HDMCWristTemperatureDailyAnalyticsEvent _sleepingWristTemperatureSamplesFromLastNSleepDays:currentDate:gregorianCalendar:sourceEntityPredicate:](self, "_sleepingWristTemperatureSamplesFromLastNSleepDays:currentDate:gregorianCalendar:sourceEntityPredicate:", 1, a3, a4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v4, "count") != 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_IHAGatedLastSleepDayWristTemperatureFieldsWithCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  -[HDMCWristTemperatureDailyAnalyticsEvent _sleepingWristTemperatureSamplesFromLastNSleepDays:currentDate:gregorianCalendar:sourceEntityPredicate:](self, "_sleepingWristTemperatureSamplesFromLastNSleepDays:currentDate:gregorianCalendar:sourceEntityPredicate:", 1, a3, a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "quantity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDMCWristTemperatureDailyAnalyticsEvent _celsiusValueFromQuantity:scale:](self, "_celsiusValueFromQuantity:scale:", v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = &unk_24DB30568;
    if (objc_msgSend(v8, "compare:", &unk_24DB30568) == -1
      || (v9 = &unk_24DB30578, objc_msgSend(v8, "compare:", &unk_24DB30578) == 1))
    {

      v8 = v9;
    }
    v10 = (void *)MEMORY[0x24BDBCED8];
    v20 = CFSTR("tempPastDay");
    objc_msgSend(v8, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryWithDictionary:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "metadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDD4400]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[HDMCWristTemperatureDailyAnalyticsEvent _celsiusValueFromQuantity:scale:](self, "_celsiusValueFromQuantity:scale:", v15, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("tempUncorrectedPastDay"));

    }
    v18 = (void *)objc_msgSend(v13, "copy");

  }
  else
  {
    v18 = (void *)MEMORY[0x24BDBD1B8];
  }

  return v18;
}

- (id)_lastSleepDayRelativeSleepingWristTemperatureWithCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;

  v6 = a4;
  v7 = a3;
  _HKMCAppleSleepingWristTemperatureType();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE40C28], "calculatorForQuantityType:intervalCollection:options:mergeStrategy:", v8, 0, _HKStatisticsOptionBaselineRelativeQuantities() | 0x20, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMCWristTemperatureDailyAnalyticsEvent _predicateForAppleWatchSamplesInLastNSleepDays:currentDate:gregorianCalendar:sampleType:](self, "_predicateForAppleWatchSamplesInLastNSleepDays:currentDate:gregorianCalendar:sampleType:", 1, v7, v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x24BE40C48]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v8, "_rollingBaselineConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initForProfile:quantityType:predicate:restrictedSourceEntities:configuration:currentDate:", WeakRetained, v8, v10, 0, v13, v7);

  objc_msgSend(v9, "setDataSource:", v14);
  v20 = 0;
  LODWORD(v13) = objc_msgSend(v9, "queryForInitialStatisticsWithError:", &v20);
  objc_msgSend(v9, "currentStatistics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  v17 = 0;
  if ((_DWORD)v13 && v15)
  {
    if (objc_msgSend(v15, "dataCount"))
    {
      objc_msgSend(v16, "mostRecentQuantity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v16, "mostRecentQuantity");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDMCWristTemperatureDailyAnalyticsEvent _changeInCelsiusStringFromQuantity:scale:](self, "_changeInCelsiusStringFromQuantity:scale:", v18, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (id)_allNoiseFieldsWithCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  -[HDMCWristTemperatureDailyAnalyticsEvent _dominantSleepingWristTemperatureSourceEntityPredicateOverLastNDays:currentDate:gregorianCalendar:](self, "_dominantSleepingWristTemperatureSourceEntityPredicateOverLastNDays:currentDate:gregorianCalendar:", 30, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[HDMCWristTemperatureDailyAnalyticsEvent _sleepingWristTemperatureSamplesFromLastNSleepDays:currentDate:gregorianCalendar:sourceEntityPredicate:](self, "_sleepingWristTemperatureSamplesFromLastNSleepDays:currentDate:gregorianCalendar:sourceEntityPredicate:", 30, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDMCWristTemperatureDailyAnalyticsEvent _noiseMetricsFromSleepingWristTemperatureSamples:gregorianCalendar:](self, "_noiseMetricsFromSleepingWristTemperatureSamples:gregorianCalendar:", v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(v9, "hk_map:", &__block_literal_global_317);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDMCWristTemperatureDailyAnalyticsEvent _sampleStandardDeviationOfValues:](self, "_sampleStandardDeviationOfValues:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v13, "doubleValue");
      -[HDMCWristTemperatureDailyAnalyticsEvent _roundDouble:scale:](self, "_roundDouble:scale:", 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("stdDevPast30Days"));

    }
    v16 = (void *)objc_msgSend(v11, "copy");

  }
  else
  {
    v16 = (void *)MEMORY[0x24BDBD1B8];
  }

  return v16;
}

id __92__HDMCWristTemperatureDailyAnalyticsEvent__allNoiseFieldsWithCurrentDate_gregorianCalendar___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a2, "quantity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "degreeCelsiusUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValueForUnit:", v4);
  objc_msgSend(v2, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_noiseMetricsFromSleepingWristTemperatureSamples:(id)a3 gregorianCalendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  HDMCWristTemperatureDailyAnalyticsEvent *v49;
  void *v50;
  void *v51;

  v6 = a3;
  v7 = a4;
  v49 = self;
  -[HDMCWristTemperatureDailyAnalyticsEvent _samplesByMorningIndex:gregorianCalendar:](self, "_samplesByMorningIndex:gregorianCalendar:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hk_morningIndexWithCalendar:", v7);

  v51 = v6;
  objc_msgSend(v6, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hk_morningIndexWithCalendar:", v7);

  v50 = v8;
  objc_msgSend(v8, "hk_map:", &__block_literal_global_319);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 < v14)
  {
    v18 = v11 + 1;
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v18 - 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", ++v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        v25 = v22 == 0;
      else
        v25 = 1;
      if (!v25)
      {
        objc_msgSend(v20, "doubleValue");
        v27 = v26;
        objc_msgSend(v22, "doubleValue");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v27 - v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v29);

        if (v24)
        {
          objc_msgSend(v20, "doubleValue");
          v31 = v30;
          objc_msgSend(v22, "doubleValue");
          v33 = v31 + v32 * -0.5;
          objc_msgSend(v24, "doubleValue");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v33 + v34 * -0.5);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v35);

        }
      }

    }
    while (v18 - 1 != v14);
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMCWristTemperatureDailyAnalyticsEvent _sampleStandardDeviationOfValues:](v49, "_sampleStandardDeviationOfValues:", v16);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v37)
  {
    objc_msgSend(v37, "doubleValue");
    -[HDMCWristTemperatureDailyAnalyticsEvent _roundDouble:scale:](v49, "_roundDouble:scale:", 2, v39 / 1.22474487);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "stringValue");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v41, CFSTR("dayToDayNoisePast30Days"));

  }
  -[HDMCWristTemperatureDailyAnalyticsEvent _sampleStandardDeviationOfValues:](v49, "_sampleStandardDeviationOfValues:", v17);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42;
  if (v42)
  {
    objc_msgSend(v42, "doubleValue");
    -[HDMCWristTemperatureDailyAnalyticsEvent _roundDouble:scale:](v49, "_roundDouble:scale:", 2, v44 / 1.41421356);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "stringValue");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v46, CFSTR("stdDevFilteredPast30Days"));

  }
  v47 = (void *)objc_msgSend(v36, "copy");

  return v47;
}

void __110__HDMCWristTemperatureDailyAnalyticsEvent__noiseMetricsFromSleepingWristTemperatureSamples_gregorianCalendar___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  void (**v6)(id, id, id);
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  v6 = a4;
  v7 = a2;
  objc_msgSend(a3, "quantity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "degreeCelsiusUnit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValueForUnit:", v9);
  v11 = v10;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7, v12);

}

- (id)_samplesByMorningIndex:(id)a3 gregorianCalendar:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  id obj;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v29 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v11, "endDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "hk_morningIndexWithCalendar:", v29);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "endDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "startDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "timeIntervalSinceDate:", v19);
          v21 = v20;

          objc_msgSend(v11, "endDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "startDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "timeIntervalSinceDate:", v23);
          v25 = v24;

          if (v21 <= v25)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v13);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, v26);

          }
        }
        else
        {
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, v16);
          v17 = v16;
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v8);
  }

  return v6;
}

- (id)_countOfUniqueSourcesOfWristTemperatureSamplesFieldsWithCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[HDMCWristTemperatureDailyAnalyticsEvent _sleepingWristTemperatureSamplesFromLastNSleepDays:currentDate:gregorianCalendar:sourceEntityPredicate:](self, "_sleepingWristTemperatureSamplesFromLastNSleepDays:currentDate:gregorianCalendar:sourceEntityPredicate:", 30, v7, v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMCWristTemperatureDailyAnalyticsEvent _sleepingWristTemperatureSamplesFromLastNSleepDays:currentDate:gregorianCalendar:sourceEntityPredicate:](self, "_sleepingWristTemperatureSamplesFromLastNSleepDays:currentDate:gregorianCalendar:sourceEntityPredicate:", 365, v7, v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDBCED8];
  v19[0] = CFSTR("numUniqueWatchesPast30Days");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HDMCWristTemperatureDailyAnalyticsEvent _countOfUniqueSourcesFromSamples:](self, "_countOfUniqueSourcesFromSamples:", v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("numUniqueWatchesPastYear");
  v20[0] = v11;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HDMCWristTemperatureDailyAnalyticsEvent _countOfUniqueSourcesFromSamples:](self, "_countOfUniqueSourcesFromSamples:", v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithDictionary:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v15, "isAppleInternalInstall");

  if ((_DWORD)v12)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HDMCWristTemperatureDailyAnalyticsEvent _countOfUniqueSerialNumbersFromSamples:](self, "_countOfUniqueSerialNumbersFromSamples:", v8));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("numUniqueWatchSerialsPast30Days"));

  }
  v17 = (void *)objc_msgSend(v14, "copy");

  return v17;
}

- (int64_t)_countOfUniqueSourcesFromSamples:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "sourceRevision", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "source");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = objc_msgSend(v4, "count");
  return v12;
}

- (int64_t)_countOfUniqueSerialNumbersFromSamples:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BE40AD0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v5, "_wristTemperatureIdentifierDomainWithProfile:", WeakRetained);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_wristTemperatureSerialNumbersBySourceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v14), "sourceRevision", (_QWORD)v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "source");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "bundleIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend(v9, "addObject:", v18);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  v19 = objc_msgSend(v9, "count");
  return v19;
}

- (id)_weeksSinceDeliveryWithDataSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[HDMCWristTemperatureDailyAnalyticsEvent _featureStatusForFeatureIdentifier:dataSource:error:](self, "_featureStatusForFeatureIdentifier:dataSource:error:", *MEMORY[0x24BDD2E88], v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "isOnboardingRecordPresent"))
    {
      v7 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v6, "onboardingRecord");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "onboardingCompletion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "completionDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberWithInteger:", -[HDMCWristTemperatureDailyAnalyticsEvent _bucketedWeeksSinceDate:dataSource:](self, "_bucketedWeeksSinceDate:dataSource:", v10, v4));
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = (id)*MEMORY[0x24BDD2780];
  }

  return v11;
}

- (int64_t)_bucketedWeeksSinceDate:(id)a3 dataSource:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int64_t v10;

  v5 = a3;
  objc_msgSend(a4, "environmentDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bucketedNumberOfWeeksSinceDate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)*MEMORY[0x24BDD2788];
  if (v7)
    v8 = v7;
  v9 = v8;

  v10 = objc_msgSend(v9, "integerValue");
  return v10;
}

- (id)_hasCycleFactorsActive
{
  HDMCAnalysisManager *analysisManager;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  analysisManager = self->_analysisManager;
  if (analysisManager
    && ((-[HDMCAnalysisManager currentAnalysis](analysisManager, "currentAnalysis"),
         (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
     || (-[HDMCAnalysisManager analyzeWithError:](self->_analysisManager, "analyzeWithError:", 0),
         (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0)))
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "ongoingCycleFactors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberWithBool:", HKMCForceDisableFertileWindowProjectionsFromCycleFactorSamples());
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (id)*MEMORY[0x24BDD2780];
  }
  return v7;
}

- (id)_preferredSleepingWristTemperatureUnit
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  const __CFString *v8;
  void *v9;
  int v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "unitPreferencesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _HKMCAppleSleepingWristTemperatureType();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredUnitForType:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD4048], "degreeCelsiusUnit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if ((v7 & 1) != 0)
    {
      v8 = CFSTR("C");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD4048], "degreeFahrenheitUnit");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v5, "isEqual:", v9);

      if (v10)
        v8 = CFSTR("F");
      else
        v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return (id)v8;
}

- (id)_featureStatusForFeatureIdentifier:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = a3;
  objc_msgSend(a4, "healthDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "featureStatusProviderForIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "featureStatusWithError:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_sleepingWristTemperatureSamplesFromLastNSleepDays:(int64_t)a3 currentDate:(id)a4 gregorianCalendar:(id)a5 sourceEntityPredicate:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  _HKMCAppleSleepingWristTemperatureType();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BE40B90];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v14, "entityEnumeratorWithType:profile:", v13, WeakRetained);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDMCWristTemperatureDailyAnalyticsEvent _predicateForAppleWatchSamplesInLastNSleepDays:currentDate:gregorianCalendar:sampleType:sourceEntityPredicate:](self, "_predicateForAppleWatchSamplesInLastNSleepDays:currentDate:gregorianCalendar:sampleType:sourceEntityPredicate:", a3, v12, v11, v13, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setPredicate:", v17);
  objc_msgSend(MEMORY[0x24BE40E40], "orderingTermWithProperty:entityClass:ascending:", *MEMORY[0x24BE40940], objc_opt_class(), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setOrderingTerms:", v19);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __146__HDMCWristTemperatureDailyAnalyticsEvent__sleepingWristTemperatureSamplesFromLastNSleepDays_currentDate_gregorianCalendar_sourceEntityPredicate___block_invoke;
  v26[3] = &unk_24DB22180;
  v21 = v20;
  v27 = v21;
  LOBYTE(v12) = objc_msgSend(v16, "enumerateWithError:handler:", &v28, v26);
  v22 = v28;
  if ((v12 & 1) != 0)
  {
    v23 = v21;
  }
  else
  {
    _HKInitializeLogging();
    HKLogAnalytics();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[HDMCWristTemperatureDailyAnalyticsEvent _sleepingWristTemperatureSamplesFromLastNSleepDays:currentDate:gregorianCalendar:sourceEntityPredicate:].cold.1();

    v23 = (id)MEMORY[0x24BDBD1A8];
  }

  return v23;
}

uint64_t __146__HDMCWristTemperatureDailyAnalyticsEvent__sleepingWristTemperatureSamplesFromLastNSleepDays_currentDate_gregorianCalendar_sourceEntityPredicate___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

- (id)_firstPartySleepSamplesFromLastNSleepDays:(int64_t)a3 currentDate:(id)a4 gregorianCalendar:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v8 = (void *)MEMORY[0x24BDD3990];
  v9 = *MEMORY[0x24BDD2A28];
  v10 = a5;
  v11 = a4;
  objc_msgSend(v8, "categoryTypeForIdentifier:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BE40A50];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v13, "entityEnumeratorWithType:profile:", v12, WeakRetained);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDMCWristTemperatureDailyAnalyticsEvent _predicateForAppleWatchSamplesInLastNSleepDays:currentDate:gregorianCalendar:sampleType:sourceEntityPredicate:](self, "_predicateForAppleWatchSamplesInLastNSleepDays:currentDate:gregorianCalendar:sampleType:sourceEntityPredicate:", a3, v11, v10, v12, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setPredicate:", v16);
  objc_msgSend(MEMORY[0x24BE40E40], "orderingTermWithProperty:entityClass:ascending:", *MEMORY[0x24BE40940], objc_opt_class(), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setOrderingTerms:", v18);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __115__HDMCWristTemperatureDailyAnalyticsEvent__firstPartySleepSamplesFromLastNSleepDays_currentDate_gregorianCalendar___block_invoke;
  v25[3] = &unk_24DB22180;
  v20 = v19;
  v26 = v20;
  LOBYTE(v11) = objc_msgSend(v15, "enumerateWithError:handler:", &v27, v25);
  v21 = v27;
  if ((v11 & 1) != 0)
  {
    v22 = v20;
  }
  else
  {
    _HKInitializeLogging();
    HKLogAnalytics();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[HDMCWristTemperatureDailyAnalyticsEvent _firstPartySleepSamplesFromLastNSleepDays:currentDate:gregorianCalendar:].cold.1();

    v22 = (id)MEMORY[0x24BDBD1A8];
  }

  return v22;
}

uint64_t __115__HDMCWristTemperatureDailyAnalyticsEvent__firstPartySleepSamplesFromLastNSleepDays_currentDate_gregorianCalendar___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

- (id)_dominantSleepingWristTemperatureSourceOverLastNDays:(int64_t)a3 currentDate:(id)a4 gregorianCalendar:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[4];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v8 = a4;
  v9 = a5;
  -[HDMCWristTemperatureDailyAnalyticsEvent _sleepingWristTemperatureSamplesFromLastNSleepDays:currentDate:gregorianCalendar:sourceEntityPredicate:](self, "_sleepingWristTemperatureSamplesFromLastNSleepDays:currentDate:gregorianCalendar:sourceEntityPredicate:", a3, v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    -[HDMCWristTemperatureDailyAnalyticsEvent _sleepingWristTemperatureSampleCountBySourceOverLastNDays:currentDate:gregorianCalendar:](self, "_sleepingWristTemperatureSampleCountBySourceOverLastNDays:currentDate:gregorianCalendar:", a3, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__3;
    v20 = __Block_byref_object_dispose__3;
    v21 = 0;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = 0;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __126__HDMCWristTemperatureDailyAnalyticsEvent__dominantSleepingWristTemperatureSourceOverLastNDays_currentDate_gregorianCalendar___block_invoke;
    v14[3] = &unk_24DB221A8;
    v14[4] = v15;
    v14[5] = &v16;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v14);
    v12 = (id)v17[5];
    _Block_object_dispose(v15, 8);
    _Block_object_dispose(&v16, 8);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __126__HDMCWristTemperatureDailyAnalyticsEvent__dominantSleepingWristTemperatureSourceOverLastNDays_currentDate_gregorianCalendar___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "integerValue") > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "integerValue");
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

- (id)_dominantSleepingWristTemperatureSourceEntityPredicateOverLastNDays:(int64_t)a3 currentDate:(id)a4 gregorianCalendar:(id)a5
{
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[HDMCWristTemperatureDailyAnalyticsEvent _dominantSleepingWristTemperatureSourceOverLastNDays:currentDate:gregorianCalendar:](self, "_dominantSleepingWristTemperatureSourceOverLastNDays:currentDate:gregorianCalendar:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "sourceManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allSourcesForBundleIdentifier:error:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && objc_msgSend(v10, "count"))
    {
      HDDataEntityPredicateForSourceEntitySet();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_sleepingWristTemperatureSampleCountBySourceOverLastNDays:(int64_t)a3 currentDate:(id)a4 gregorianCalendar:(id)a5
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[HDMCWristTemperatureDailyAnalyticsEvent _sleepingWristTemperatureSamplesFromLastNSleepDays:currentDate:gregorianCalendar:sourceEntityPredicate:](self, "_sleepingWristTemperatureSamplesFromLastNSleepDays:currentDate:gregorianCalendar:sourceEntityPredicate:", a3, a4, a5, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v20 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v11), "sourceRevision");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "source");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            v15 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v6, "objectForKeyedSubscript:", v13);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v16, "integerValue") + 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, v13);

          }
          else
          {
            objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_24DB30240, v13);
          }

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

    v18 = (void *)objc_msgSend(v6, "copy");
    v5 = v20;
  }
  else
  {
    v18 = (void *)MEMORY[0x24BDBD1B8];
  }

  return v18;
}

- (id)_predicateForAppleWatchSamplesInLastNSleepDays:(int64_t)a3 currentDate:(id)a4 gregorianCalendar:(id)a5 sampleType:(id)a6 sourceEntityPredicate:(id)a7
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v12 = a7;
  -[HDMCWristTemperatureDailyAnalyticsEvent _predicateForAppleWatchSamplesInLastNSleepDays:currentDate:gregorianCalendar:sampleType:](self, "_predicateForAppleWatchSamplesInLastNSleepDays:currentDate:gregorianCalendar:sampleType:", a3, a4, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    v15 = (void *)MEMORY[0x24BE40E20];
    v19[0] = v13;
    v19[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "predicateMatchingAllPredicates:", v16);
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = v13;
  }

  return v17;
}

- (id)_predicateForAppleWatchSamplesInLast30SleepDaysRelativeToCurrentDate:(id)a3 gregorianCalendar:(id)a4 sampleType:(id)a5
{
  return -[HDMCWristTemperatureDailyAnalyticsEvent _predicateForAppleWatchSamplesInLastNSleepDays:currentDate:gregorianCalendar:sampleType:](self, "_predicateForAppleWatchSamplesInLastNSleepDays:currentDate:gregorianCalendar:sampleType:", 30, a3, a4, a5);
}

- (id)_predicateForAppleWatchSamplesInLastNSleepDays:(int64_t)a3 currentDate:(id)a4 gregorianCalendar:(id)a5 sampleType:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v9 = a6;
  v10 = a5;
  objc_msgSend(a4, "hk_sleepDayStartWithCalendar:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateByAddingUnit:value:toDate:options:", 16, -a3, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v12, v11);
  v14 = (void *)MEMORY[0x24BE40E20];
  HDSampleEntityPredicateForDataType();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v15;
  HDSampleEntityPredicateForDateInterval();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = v16;
  HDDataEntityPredicateForObjectsFromAppleWatchSources();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "predicateMatchingAllPredicates:", v18, v21, v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_sampleStandardDeviationOfValues:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  _QWORD v12[5];

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    objc_msgSend(v3, "hk_averageUsingEvaluationBlock:", &__block_literal_global_341);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6;

    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __76__HDMCWristTemperatureDailyAnalyticsEvent__sampleStandardDeviationOfValues___block_invoke_2;
    v12[3] = &__block_descriptor_40_e18_d16__0__NSNumber_8l;
    v12[4] = v7;
    objc_msgSend(v3, "hk_sumUsingEvaluationBlock:", v12);
    v9 = v8;
    v10 = objc_msgSend(v3, "count");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", sqrt(v9 / (double)(unint64_t)(v10 - 1)));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __76__HDMCWristTemperatureDailyAnalyticsEvent__sampleStandardDeviationOfValues___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "doubleValue");
}

double __76__HDMCWristTemperatureDailyAnalyticsEvent__sampleStandardDeviationOfValues___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v3 = a2;
  objc_msgSend(v3, "doubleValue");
  v5 = v4 - *(double *)(a1 + 32);
  objc_msgSend(v3, "doubleValue");
  v7 = v6;

  return v5 * (v7 - *(double *)(a1 + 32));
}

- (id)_celsiusValueFromQuantity:(id)a3 scale:(signed __int16)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;

  v4 = a4;
  v6 = (void *)MEMORY[0x24BDD4048];
  v7 = a3;
  objc_msgSend(v6, "degreeCelsiusUnit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValueForUnit:", v8);
  v10 = v9;

  return -[HDMCWristTemperatureDailyAnalyticsEvent _roundDouble:scale:](self, "_roundDouble:scale:", v4, v10);
}

- (id)_changeInCelsiusStringFromQuantity:(id)a3 scale:(signed __int16)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  __CFString *v11;
  void *v12;

  v4 = a4;
  v6 = (void *)MEMORY[0x24BDD4048];
  v7 = a3;
  objc_msgSend(v6, "_changeInDegreeCelsiusUnit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_baselineRelativeDoubleValueForUnit:", v8);
  v10 = v9;

  if (v10 == 1.79769313e308)
  {
    v11 = CFSTR("collecting");
  }
  else if (v10 == 1.0)
  {
    v11 = CFSTR("unavailable");
  }
  else
  {
    -[HDMCWristTemperatureDailyAnalyticsEvent _roundDouble:scale:](self, "_roundDouble:scale:", v4, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringValue");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)_roundDouble:(double)a3 scale:(signed __int16)a4
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1520], "decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", 0, a4, 0, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithDouble:", a3);
  objc_msgSend(v6, "decimalNumberByRoundingAccordingToBehavior:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyDefaults, 0);
  objc_storeStrong((id *)&self->_wristDetectionSettingManager, 0);
  objc_storeStrong((id *)&self->_sleepStore, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_storeStrong((id *)&self->_analysisManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_sleepingWristTemperatureSamplesFromLastNSleepDays:currentDate:gregorianCalendar:sourceEntityPredicate:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_5_0(v0);
  OUTLINED_FUNCTION_1_2(&dword_21961B000, v2, v3, "[%{public}@] Error querying sleeping wrist temperature samples: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

- (void)_firstPartySleepSamplesFromLastNSleepDays:currentDate:gregorianCalendar:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_5_0(v0);
  OUTLINED_FUNCTION_1_2(&dword_21961B000, v2, v3, "[%{public}@] Error querying sleep samples: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

@end
