@implementation HDMHMentalHealthDailyAnalyticsEvent

- (HDMHMentalHealthDailyAnalyticsEvent)initWithProfile:(id)a3 settingsManager:(id)a4 userDefaults:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDMHMentalHealthDailyAnalyticsEvent *v11;
  HDMHMentalHealthDailyAnalyticsEvent *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HDMHMentalHealthDailyAnalyticsEvent;
  v11 = -[HDMHMentalHealthDailyAnalyticsEvent init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    objc_storeStrong((id *)&v12->_settingsManager, a4);
    objc_storeStrong((id *)&v12->_userDefaults, a5);
  }

  return v12;
}

- (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.health.mentalhealth.daily");
}

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
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
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v5 = (void *)MEMORY[0x24BDBCED8];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "environmentDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activePairedDeviceProductType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDD27A8]);

  objc_msgSend(v6, "environmentDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activePairedDeviceOSBuildNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BDD27A0]);

  -[HDMHMentalHealthDailyAnalyticsEvent _fetchDeviceContextAnalytics](self, "_fetchDeviceContextAnalytics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", v12);

  v13 = (void *)MEMORY[0x24BDD16E0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "notificationManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithBool:", objc_msgSend(v15, "areHealthNotificationsAuthorized"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BDD27B8]);

  v17 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v6, "environmentDataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "numberWithBool:", objc_msgSend(v18, "isImproveHealthAndActivityEnabled"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BDD27E8]);

  -[HDMHMentalHealthDailyAnalyticsEvent _hasLaunchedHealthAppInInterval:withDataSource:](self, "_hasLaunchedHealthAppInInterval:withDataSource:", 7, v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, CFSTR("hasLaunchedHealthAppInLastWeek"));

  -[HDMHMentalHealthDailyAnalyticsEvent _hasLaunchedHealthAppInInterval:withDataSource:](self, "_hasLaunchedHealthAppInInterval:withDataSource:", 30, v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, CFSTR("hasLaunchedHealthAppInLastMonth"));

  -[HDMHMentalHealthDailyAnalyticsEvent _weeksSinceLastHealthAppLaunchWithDataSource:](self, "_weeksSinceLastHealthAppLaunchWithDataSource:", v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, CFSTR("weeksSinceLastHealthAppLaunch"));

  -[HDMHMentalHealthDailyAnalyticsEvent _isFeatureOnboardedForFeatureIdentifier:dataSource:](self, "_isFeatureOnboardedForFeatureIdentifier:dataSource:", *MEMORY[0x24BDD2E90], v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v23, CFSTR("isOnboarded"));

  -[HDMHMentalHealthDailyAnalyticsEvent _weeksSinceOnboardingWithDataSource:](self, "_weeksSinceOnboardingWithDataSource:", v6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v24, CFSTR("weeksSinceOnboarded"));

  v25 = *MEMORY[0x24BDD2E50];
  -[HDMHMentalHealthDailyAnalyticsEvent _isFeatureOnboardedForFeatureIdentifier:dataSource:](self, "_isFeatureOnboardedForFeatureIdentifier:dataSource:", *MEMORY[0x24BDD2E50], v6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v26, CFSTR("wereAssessmentsDelivered"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HKMHSettingsManager hasAnyStateOfMindReminderEnabled](self->_settingsManager, "hasAnyStateOfMindReminderEnabled"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v27, CFSTR("hasStateOfMindNotificationEnabled"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HKMHSettingsManager middayNotificationsEnabled](self->_settingsManager, "middayNotificationsEnabled"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v28, CFSTR("hasStateOfMindMidDayNotificationEnabled"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HKMHSettingsManager endOfDayNotificationsEnabled](self->_settingsManager, "endOfDayNotificationsEnabled"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v29, CFSTR("hasStateOfMindEndOfDayNotificationEnabled"));

  v30 = (void *)MEMORY[0x24BDD16E0];
  -[HKMHSettingsManager customReminderSchedule](self->_settingsManager, "customReminderSchedule");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "numberWithInt:", objc_msgSend(v31, "count") != 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v32, CFSTR("hasStateOfMindCustomNotificationEnabled"));

  v33 = *MEMORY[0x24BDD2CA8];
  -[HDMHMentalHealthDailyAnalyticsEvent _isFeatureEnabledForFeatureIdentifier:dataSource:featureAvailabilityContext:](self, "_isFeatureEnabledForFeatureIdentifier:dataSource:featureAvailabilityContext:", v25, v6, *MEMORY[0x24BDD2CA8]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v34, CFSTR("hasScheduledQuestionnairesEnabled"));

  -[HDMHMentalHealthDailyAnalyticsEvent _isFeatureEnabledForFeatureIdentifier:dataSource:featureAvailabilityContext:](self, "_isFeatureEnabledForFeatureIdentifier:dataSource:featureAvailabilityContext:", *MEMORY[0x24BDD2E98], v6, v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v35, CFSTR("hasUnpleasantLoggingPatternsEnabled"));

  -[HDMHMentalHealthDailyAnalyticsEvent _hasLoggedStateOfMindInPastNDays:withDataSource:](self, "_hasLoggedStateOfMindInPastNDays:withDataSource:", 30, v6);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v36, CFSTR("hasLoggedStateOfMindInPast30Days"));

  -[HDMHMentalHealthDailyAnalyticsEvent _hasLoggedStateOfMindInPastNDays:withDataSource:](self, "_hasLoggedStateOfMindInPastNDays:withDataSource:", 7, v6);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v37, CFSTR("hasLoggedStateOfMindInPast7Days"));
  return v7;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
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
  id v19;

  v5 = (void *)MEMORY[0x24BDBCED8];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMHMentalHealthDailyAnalyticsEvent _IHAGatedDemographicsFieldsWithDataSource:](self, "_IHAGatedDemographicsFieldsWithDataSource:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", v8);

  -[HDMHMentalHealthDailyAnalyticsEvent _numDaysStateOfMindLoggedInPast30DaysWithDataSource:](self, "_numDaysStateOfMindLoggedInPast30DaysWithDataSource:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", v9);

  -[HDMHMentalHealthDailyAnalyticsEvent _numDaysStateOfMindLoggedInPastDayWithDataSource:](self, "_numDaysStateOfMindLoggedInPastDayWithDataSource:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", v10);

  objc_msgSend(MEMORY[0x24BDD3F08], "stateOfMindType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMHMentalHealthDailyAnalyticsEvent _determineDaysSinceLastSampleWithSampleType:dataSource:](self, "_determineDaysSinceLastSampleWithSampleType:dataSource:", v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("daysSinceLastStateOfMindLogged"));

  -[HDMHMentalHealthDailyAnalyticsEvent _numAssessmentsCompletedWithDataSource:](self, "_numAssessmentsCompletedWithDataSource:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", v13);

  objc_msgSend(MEMORY[0x24BDD3F18], "scoredAssessmentTypeForIdentifier:", *MEMORY[0x24BDD3720]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMHMentalHealthDailyAnalyticsEvent _determineDaysSinceLastSampleWithSampleType:dataSource:](self, "_determineDaysSinceLastSampleWithSampleType:dataSource:", v14, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD3F18], "scoredAssessmentTypeForIdentifier:", *MEMORY[0x24BDD3728]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMHMentalHealthDailyAnalyticsEvent _determineDaysSinceLastSampleWithSampleType:dataSource:](self, "_determineDaysSinceLastSampleWithSampleType:dataSource:", v16, v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 >= v17)
    v18 = v17;
  else
    v18 = v15;
  v19 = v18;
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, CFSTR("daysSinceLastAssessment"));

  return v7;
}

- (id)_fetchDeviceContextAnalytics
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v26[2];
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];
  _QWORD v30[4];
  _QWORD v31[5];

  v31[4] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "deviceContextManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberOfDeviceContextsPerDeviceType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", &unk_2511A6D70);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = (void *)v5;
    else
      v7 = &unk_2511A6D88;
    v8 = v7;

    objc_msgSend(v4, "objectForKeyedSubscript:", &unk_2511A6DA0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (void *)v9;
    else
      v11 = &unk_2511A6D88;
    v12 = v11;

    objc_msgSend(v4, "objectForKeyedSubscript:", &unk_2511A6DB8);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (void *)v13;
    else
      v15 = &unk_2511A6D88;
    v16 = v15;

    objc_msgSend(v4, "objectForKeyedSubscript:", &unk_2511A6DD0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = (void *)v17;
    else
      v19 = &unk_2511A6D88;
    v20 = v19;

    v21 = *MEMORY[0x24BDD27D8];
    v26[0] = *MEMORY[0x24BDD27C8];
    v26[1] = v21;
    v29[0] = v8;
    v29[1] = v16;
    v27 = *MEMORY[0x24BDD27E0];
    v28 = v27;
    v29[2] = v12;
    v29[3] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v26, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = *MEMORY[0x24BDD27D8];
    v30[0] = *MEMORY[0x24BDD27C8];
    v30[1] = v23;
    v31[0] = &unk_2511A6D58;
    v31[1] = &unk_2511A6D58;
    v24 = *MEMORY[0x24BDD27D0];
    v30[2] = *MEMORY[0x24BDD27E0];
    v30[3] = v24;
    v31[2] = &unk_2511A6D58;
    v31[3] = &unk_2511A6D58;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
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
  void *v13;

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

  if (v11)
    v12 = v11;
  else
    v12 = &unk_2511A6D58;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BDD27B0]);
  v13 = (void *)objc_msgSend(v4, "copy");

  return v13;
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

- (id)_isFeatureOnboardedForFeatureIdentifier:(id)a3 dataSource:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[HDMHMentalHealthDailyAnalyticsEvent _featureStatusForFeatureIdentifier:dataSource:error:](self, "_featureStatusForFeatureIdentifier:dataSource:error:", a3, a4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "isOnboardingRecordPresent"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (id)*MEMORY[0x24BDD2780];
  }
  v7 = v6;

  return v7;
}

- (id)_isFeatureEnabledForFeatureIdentifier:(id)a3 dataSource:(id)a4 featureAvailabilityContext:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;

  v8 = a5;
  -[HDMHMentalHealthDailyAnalyticsEvent _featureStatusForFeatureIdentifier:dataSource:error:](self, "_featureStatusForFeatureIdentifier:dataSource:error:", a3, a4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x24BDD2D10]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = (id)*MEMORY[0x24BDD2780];
  }
  v14 = v13;

  return v14;
}

- (id)_hasLaunchedHealthAppInInterval:(int64_t)a3 withDataSource:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  BOOL v14;
  void *v15;
  id v16;

  v6 = a4;
  -[HDMHMentalHealthDailyAnalyticsEvent _healthAppLastOpenedDate](self, "_healthAppLastOpenedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "environmentDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "environmentDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "calendarCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[HDMHMentalHealthDailyAnalyticsEvent numberOfDaysBetweenStartDate:endDate:withCalendar:](self, "numberOfDaysBetweenStartDate:endDate:withCalendar:", v7, v9, v12);
    v14 = v13 > -1 && v13 <= a3;
    v15 = (void *)MEMORY[0x24BDBD1C0];
    if (v14)
      v15 = (void *)MEMORY[0x24BDBD1C8];
    v16 = v15;

  }
  else
  {
    v16 = (id)*MEMORY[0x24BDD2780];
  }

  return v16;
}

- (id)_weeksSinceLastHealthAppLaunchWithDataSource:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  -[HDMHMentalHealthDailyAnalyticsEvent _healthAppLastOpenedDate](self, "_healthAppLastOpenedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HDMHMentalHealthDailyAnalyticsEvent _bucketedWeeksSinceDate:dataSource:](self, "_bucketedWeeksSinceDate:dataSource:", v5, v4));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (id)*MEMORY[0x24BDD2788];
  }
  v7 = v6;

  return v7;
}

- (id)_healthAppLastOpenedDate
{
  return (id)-[NSUserDefaults hk_dateForKey:](self->_userDefaults, "hk_dateForKey:", *MEMORY[0x24BDD45F8]);
}

- (id)_stateOfMindDaySummaryEnumeratorForPastNDays:(int64_t)a3 withDataSource:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  HDMHDaySummaryEnumerator *v13;
  id WeakRetained;
  HDMHDaySummaryEnumerator *v15;
  uint64_t v17;

  v6 = a4;
  objc_msgSend(v6, "environmentDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "environmentDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "calendarCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentCalendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v8, "hk_dayIndexWithCalendar:", v11) - a3;
  v13 = [HDMHDaySummaryEnumerator alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  LOBYTE(v17) = 1;
  v15 = -[HDMHDaySummaryEnumerator initWithProfile:dayIndexRange:gregorianCalendar:predicate:pendingDailyStateOfMind:ascending:](v13, "initWithProfile:dayIndexRange:gregorianCalendar:predicate:pendingDailyStateOfMind:ascending:", WeakRetained, v12, a3, v11, 0, 0, v17);

  return v15;
}

- (id)_numDaysStateOfMindLoggedInPast30DaysWithDataSource:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[9];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[4];
  _QWORD v38[4];
  _QWORD v39[4];
  _QWORD v40[5];

  v40[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HDMHMentalHealthDailyAnalyticsEvent _stateOfMindDaySummaryEnumeratorForPastNDays:withDataSource:](self, "_stateOfMindDaySummaryEnumeratorForPastNDays:withDataSource:", 30, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0x7FFFFFFFFFFFFFFFLL;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v16 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __91__HDMHMentalHealthDailyAnalyticsEvent__numDaysStateOfMindLoggedInPast30DaysWithDataSource___block_invoke;
  v15[3] = &unk_2511A23D0;
  v15[4] = &v17;
  v15[5] = &v33;
  v15[6] = &v29;
  v15[7] = &v25;
  v15[8] = &v21;
  v6 = objc_msgSend(v5, "enumerateWithError:handler:", &v16, v15);
  v7 = v16;
  if (v18[3] <= 29)
    v22[3] = 0;
  if ((v6 & 1) != 0)
  {
    v37[0] = CFSTR("numDaysDailyStateOfMindLoggedPast30Days");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v34[3]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v8;
    v37[1] = CFSTR("numDaysMomentaryStateOfMindLoggedPast30Days");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v30[3]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v9;
    v37[2] = CFSTR("numMomentaryStateOfMindLogsPerDayPast30DaysMax");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v26[3]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v10;
    v37[3] = CFSTR("numMomentaryStateOfMindLogsPerDayPast30DaysMin");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v22[3]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v38[3] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = *MEMORY[0x24BDD2788];
    v39[0] = CFSTR("numDaysDailyStateOfMindLoggedPast30Days");
    v39[1] = CFSTR("numDaysMomentaryStateOfMindLoggedPast30Days");
    v40[0] = v13;
    v40[1] = v13;
    v39[2] = CFSTR("numMomentaryStateOfMindLogsPerDayPast30DaysMax");
    v39[3] = CFSTR("numMomentaryStateOfMindLogsPerDayPast30DaysMin");
    v40[2] = v13;
    v40[3] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v12;
}

void __91__HDMHMentalHealthDailyAnalyticsEvent__numDaysStateOfMindLoggedInPast30DaysWithDataSource___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;

  ++*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  v3 = a2;
  objc_msgSend(v3, "dailyStateOfMind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  objc_msgSend(v3, "momentaryStatesOfMind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "count");
  if (v6)
    ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  v7 = *(_QWORD *)(a1[7] + 8);
  v8 = *(_QWORD *)(v7 + 24);
  if (v8 <= v6)
    v8 = v6;
  *(_QWORD *)(v7 + 24) = v8;
  v9 = *(_QWORD *)(a1[8] + 8);
  v10 = *(_QWORD *)(v9 + 24);
  if (v10 >= v6)
    v10 = v6;
  *(_QWORD *)(v9 + 24) = v10;
}

- (id)_numDaysStateOfMindLoggedInPastDayWithDataSource:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HDMHMentalHealthDailyAnalyticsEvent _stateOfMindDaySummaryEnumeratorForPastNDays:withDataSource:](self, "_stateOfMindDaySummaryEnumeratorForPastNDays:withDataSource:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v13[4] = &v15;
  v14 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __88__HDMHMentalHealthDailyAnalyticsEvent__numDaysStateOfMindLoggedInPastDayWithDataSource___block_invoke;
  v13[3] = &unk_2511A23F8;
  v6 = objc_msgSend(v5, "enumerateWithError:handler:", &v14, v13);
  v7 = v14;
  -[HDMHMentalHealthDailyAnalyticsEvent _numDailyStateOfMindLogsInPastNDays:withDataSource:](self, "_numDailyStateOfMindLogsInPastNDays:withDataSource:", 1, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 & 1) != 0)
  {
    v19[0] = CFSTR("numMomentaryStateOfMindLogsPastDay");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v16[3]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = CFSTR("numDailyStateOfMindLogsPastDay");
    v20[0] = v9;
    v20[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = *MEMORY[0x24BDD2788];
    v21[0] = CFSTR("numMomentaryStateOfMindLogsPastDay");
    v21[1] = CFSTR("numDailyStateOfMindLogsPastDay");
    v22[0] = v11;
    v22[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __88__HDMHMentalHealthDailyAnalyticsEvent__numDaysStateOfMindLoggedInPastDayWithDataSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "momentaryStatesOfMind");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "count");

}

- (id)_hasLoggedStateOfMindInPastNDays:(int64_t)a3 withDataSource:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a4;
  -[HDMHMentalHealthDailyAnalyticsEvent _stateOfMindDaySummaryEnumeratorForPastNDays:withDataSource:](self, "_stateOfMindDaySummaryEnumeratorForPastNDays:withDataSource:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  v19 = (id)MEMORY[0x24BDBD1C0];
  v12[4] = &v14;
  v13 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __87__HDMHMentalHealthDailyAnalyticsEvent__hasLoggedStateOfMindInPastNDays_withDataSource___block_invoke;
  v12[3] = &unk_2511A23F8;
  LODWORD(self) = objc_msgSend(v7, "enumerateWithError:handler:", &v13, v12);
  v8 = v13;
  v9 = (id *)(v15 + 5);
  if (!(_DWORD)self)
    v9 = (id *)MEMORY[0x24BDD2780];
  v10 = *v9;

  _Block_object_dispose(&v14, 8);
  return v10;
}

void __87__HDMHMentalHealthDailyAnalyticsEvent__hasLoggedStateOfMindInPastNDays_withDataSource___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "dailyStateOfMind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

LABEL_4:
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = MEMORY[0x24BDBD1C8];

    goto LABEL_5;
  }
  objc_msgSend(v7, "momentaryStatesOfMind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    goto LABEL_4;
LABEL_5:

}

- (id)_enumeratorForPastNDays:(int64_t)a3 withDataSource:(id)a4 forSampleType:(id)a5 withExtraPredicate:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id WeakRetained;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend(v12, "environmentDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "calendarCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "currentCalendar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "environmentDataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "currentDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "dateByAddingUnit:value:toDate:options:", 16, -a3, v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc(MEMORY[0x24BDD1508]);
  v20 = (void *)objc_msgSend(v19, "initWithStartDate:duration:", v18, (double)(*MEMORY[0x24BDD2818] * a3));
  v21 = (void *)objc_msgSend((id)objc_msgSend(v11, "dataObjectClass"), "hd_dataEntityClass");
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v21, "entityEnumeratorWithProfile:", WeakRetained);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x24BE40E48];
  HDSampleEntityPredicateForDateInterval();
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "compoundPredicateWithPredicate:otherPredicate:", v25, v10);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "setPredicate:", v26);
  return v23;
}

- (id)_numAssessmentsInPastNDays:(int64_t)a3 withDataSource:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[6];
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD3F18], "scoredAssessmentTypeForIdentifier:", *MEMORY[0x24BDD3728]);
  v7 = objc_claimAutoreleasedReturnValue();
  -[HDMHMentalHealthDailyAnalyticsEvent _enumeratorForPastNDays:withDataSource:forSampleType:withExtraPredicate:](self, "_enumeratorForPastNDays:withDataSource:forSampleType:withExtraPredicate:", a3, v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v15 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __81__HDMHMentalHealthDailyAnalyticsEvent__numAssessmentsInPastNDays_withDataSource___block_invoke;
  v14[3] = &unk_2511A2420;
  v14[4] = &v20;
  v14[5] = &v16;
  LOBYTE(v7) = objc_msgSend(v8, "enumerateWithError:handler:", &v15, v14);
  v9 = v15;
  if ((v7 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v21[3]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v10;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v17[3]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25[0] = *MEMORY[0x24BDD2788];
    v25[1] = v25[0];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v12;
}

uint64_t __81__HDMHMentalHealthDailyAnalyticsEvent__numAssessmentsInPastNDays_withDataSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

  return 1;
}

- (id)_numAssessmentsCompletedWithDataSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HDMHMentalHealthDailyAnalyticsEvent _numAssessmentsInPastNDays:withDataSource:](self, "_numAssessmentsInPastNDays:withDataSource:", 30, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMHMentalHealthDailyAnalyticsEvent _numAssessmentsInPastNDays:withDataSource:](self, "_numAssessmentsInPastNDays:withDataSource:", 180, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = CFSTR("numDepressionAssessmentsCompletedPast30Days");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v13[1] = CFSTR("numAnxietyAssessmentsCompletedPast30Days");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v8;
  v13[2] = CFSTR("numDepressionAssessmentsCompletedPast180Days");
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  v13[3] = CFSTR("numAnxietyAssessmentsCompletedPast180Days");
  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_numDailyStateOfMindLogsInPastNDays:(int64_t)a3 withDataSource:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[24];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(MEMORY[0x24BE40C18], "predicateForReflectiveInterval:equals:", 2, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3F08], "stateOfMindType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMHMentalHealthDailyAnalyticsEvent _enumeratorForPastNDays:withDataSource:forSampleType:withExtraPredicate:](self, "_enumeratorForPastNDays:withDataSource:forSampleType:withExtraPredicate:", a3, v6, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v17[4] = &v19;
  v18 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __90__HDMHMentalHealthDailyAnalyticsEvent__numDailyStateOfMindLogsInPastNDays_withDataSource___block_invoke;
  v17[3] = &unk_2511A2448;
  v10 = objc_msgSend(v9, "enumerateWithError:handler:", &v18, v17);
  v11 = v18;
  if (v11)
  {
    _HKInitializeLogging();
    v12 = (id)*MEMORY[0x24BDD3038];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_opt_class();
      -[HDMHMentalHealthDailyAnalyticsEvent _numDailyStateOfMindLogsInPastNDays:withDataSource:].cold.1(v13, (uint64_t)v11, (uint64_t)v23, v12);
    }

  }
  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v20[3]);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = (id)*MEMORY[0x24BDD2788];
  }
  v15 = v14;

  _Block_object_dispose(&v19, 8);
  return v15;
}

uint64_t __90__HDMHMentalHealthDailyAnalyticsEvent__numDailyStateOfMindLogsInPastNDays_withDataSource___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return 1;
}

- (id)_determineDaysSinceLastSampleWithSampleType:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v22;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "environmentDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "environmentDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "calendarCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BE40BC0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v22 = 0;
  objc_msgSend(v13, "mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:", v7, WeakRetained, 0, 0, 0, &v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v22;
  if (v16)
  {
    _HKInitializeLogging();
    v17 = (void *)*MEMORY[0x24BDD3038];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_ERROR))
    {
      -[HDMHMentalHealthDailyAnalyticsEvent _determineDaysSinceLastSampleWithSampleType:dataSource:].cold.1(v17, (uint64_t)self, (uint64_t)v16);
      if (v15)
        goto LABEL_4;
LABEL_6:
      v20 = (id)*MEMORY[0x24BDD2788];
      goto LABEL_7;
    }
  }
  if (!v15)
    goto LABEL_6;
LABEL_4:
  v18 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v15, "startDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "numberWithInteger:", -[HDMHMentalHealthDailyAnalyticsEvent numberOfDaysBetweenStartDate:endDate:withCalendar:](self, "numberOfDaysBetweenStartDate:endDate:withCalendar:", v19, v9, v12));
  v20 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v20;
}

- (int64_t)numberOfDaysBetweenStartDate:(id)a3 endDate:(id)a4 withCalendar:(id)a5
{
  void *v5;
  int64_t v6;

  objc_msgSend(a5, "components:fromDate:toDate:options:", 16, a3, a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "day");

  return v6;
}

- (id)_weeksSinceOnboardingWithDataSource:(id)a3
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
  -[HDMHMentalHealthDailyAnalyticsEvent _featureStatusForFeatureIdentifier:dataSource:error:](self, "_featureStatusForFeatureIdentifier:dataSource:error:", *MEMORY[0x24BDD2E90], v4, 0);
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
      objc_msgSend(v7, "numberWithInteger:", -[HDMHMentalHealthDailyAnalyticsEvent _bucketedWeeksSinceDate:dataSource:](self, "_bucketedWeeksSinceDate:dataSource:", v10, v4));
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_numDailyStateOfMindLogsInPastNDays:(uint64_t)a3 withDataSource:(NSObject *)a4 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  id v6;

  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  v6 = a1;
  _os_log_error_impl(&dword_2416F5000, a4, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving daily state of mind logs: %@", (uint8_t *)a3, 0x16u);

}

- (void)_determineDaysSinceLastSampleWithSampleType:(uint64_t)a3 dataSource:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v6 = 138543618;
  v7 = (id)objc_opt_class();
  v8 = 2112;
  v9 = a3;
  v5 = v7;
  _os_log_error_impl(&dword_2416F5000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving days since last sample: %@", (uint8_t *)&v6, 0x16u);

}

@end
