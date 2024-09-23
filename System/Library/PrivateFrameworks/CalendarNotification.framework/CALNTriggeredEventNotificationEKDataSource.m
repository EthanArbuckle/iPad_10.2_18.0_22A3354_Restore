@implementation CALNTriggeredEventNotificationEKDataSource

- (CALNTriggeredEventNotificationEKDataSource)initWithEventStoreProvider:(id)a3 remoteMutator:(id)a4 dataSourceEventRepresentationProvider:(id)a5 coreLocationProvider:(id)a6 ttlEventTracker:(id)a7 alarmEngineMonitor:(id)a8 travelEngine:(id)a9 foundInAppsEventTracker:(id)a10 suggestionsServiceLogger:(id)a11 routeHypothesizerProvider:(id)a12 timeToLeaveRefreshMonitor:(id)a13 debugPreferences:(id)a14 mailtoURLProvider:(id)a15
{
  id v20;
  id v21;
  id v22;
  CALNTriggeredEventNotificationEKDataSource *v23;
  CALNTriggeredEventNotificationEKDataSource *v24;
  CALNCalendarCoreLocationManager *v25;
  CALNCalendarCoreLocationManager *coreLocationManager;
  void *v27;
  void *v28;
  void *v29;
  id v32;
  id v33;
  id v34;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  objc_super v46;

  v45 = a3;
  v32 = a4;
  v44 = a4;
  v33 = a5;
  v43 = a5;
  v20 = a6;
  v42 = a7;
  v34 = a8;
  v41 = a8;
  v40 = a9;
  v39 = a10;
  v38 = a11;
  v37 = a12;
  v36 = a13;
  v21 = a14;
  v22 = a15;
  v46.receiver = self;
  v46.super_class = (Class)CALNTriggeredEventNotificationEKDataSource;
  v23 = -[CALNTriggeredEventNotificationEKDataSource init](&v46, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_eventStoreProvider, a3);
    objc_storeStrong((id *)&v24->_remoteMutator, v32);
    objc_storeStrong((id *)&v24->_dataSourceEventRepresentationProvider, v33);
    v25 = -[CALNCalendarCoreLocationManager initWithCoreLocationProvider:]([CALNCalendarCoreLocationManager alloc], "initWithCoreLocationProvider:", v20);
    coreLocationManager = v24->_coreLocationManager;
    v24->_coreLocationManager = v25;

    objc_storeStrong((id *)&v24->_ttlEventTracker, a7);
    objc_storeStrong((id *)&v24->_alarmEngineMonitor, v34);
    objc_storeStrong((id *)&v24->_travelEngine, a9);
    objc_storeStrong((id *)&v24->_foundInAppsEventTracker, a10);
    objc_storeStrong((id *)&v24->_suggestionsServiceLogger, a11);
    objc_storeStrong((id *)&v24->_routeHypothesizerProvider, a12);
    objc_storeStrong((id *)&v24->_timeToLeaveRefreshMonitor, a13);
    objc_storeStrong((id *)&v24->_debugPreferences, a14);
    objc_storeStrong((id *)&v24->_mailtoURLProvider, a15);
    -[CALNTriggeredEventNotificationEKDataSource alarmEngineMonitor](v24, "alarmEngineMonitor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addAlarmsFiredObserver:selector:", v24, sel__alertsFired_);

    -[CALNTriggeredEventNotificationEKDataSource travelEngine](v24, "travelEngine");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setDelegate:", v24);

    -[CALNTriggeredEventNotificationEKDataSource timeToLeaveRefreshMonitor](v24, "timeToLeaveRefreshMonitor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setDelegate:", v24);

  }
  return v24;
}

- (id)fetchTriggeredEventNotificationInfoWithSourceClientIdentifier:(id)a3 isProtectedDataAvailable:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  CALNTriggeredEventNotificationInfo *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  uint64_t v32;
  void *v33;
  char v34;
  void *v35;
  char v36;
  CALNTriggeredEventNotificationInfo *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  void *v50;
  void *v51;
  char v52;
  void *v53;
  int v54;
  unsigned int v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  id v71;
  uint8_t buf[4];
  id v73;
  __int16 v74;
  CALNTriggeredEventNotificationInfo *v75;
  uint64_t v76;

  v4 = a4;
  v76 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v70 = 0;
  v71 = 0;
  +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventID:andAlarmID:fromSourceClientIdentifier:](CALNTriggeredEventNotificationSourceClientIdentifierUtilities, "eventID:andAlarmID:fromSourceClientIdentifier:", &v71, &v70, v6);
  v7 = v71;
  v8 = v70;
  -[CALNTriggeredEventNotificationEKDataSource eventStoreProvider](self, "eventStoreProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "eventStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v69 = v7;
  if (v7 && (objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7), (v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v12 = (void *)v11;
    objc_msgSend(v10, "_eventOccurrenceWithURI:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      goto LABEL_12;
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CALNTriggeredEventNotificationEKDataSource fetchTriggeredEventNotificationInfoWithSourceClientIdentifier:isProtectedDataAvailable:].cold.2();

    v12 = 0;
    v13 = 0;
  }
  if (!v4)
  {
LABEL_12:
    v61 = v8;
    v62 = v6;
    v59 = v12;
    v60 = v10;
    if (v13)
    {
      objc_msgSend(v13, "title");
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "location");
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "locationsWithoutPrediction");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "firstObject");
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "startDate");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "endDate");
      v20 = objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v13, "isAllDay");
      v67 = (void *)v20;
      if ((objc_msgSend(v13, "isAllDay") & 1) != 0 || (objc_msgSend(v13, "isBirthday") & 1) != 0)
      {
        LOBYTE(v54) = 0;
      }
      else
      {
        objc_msgSend(v13, "calendar");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v22, "isSubscribed") ^ 1;

      }
      v57 = (void *)v18;
      v58 = v17;
      -[CALNTriggeredEventNotificationEKDataSource dataSourceEventRepresentationProvider](self, "dataSourceEventRepresentationProvider");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeZone");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "eventRepresentationDictionaryForUpcomingEvent:date:displayTimeZone:", v13, v63, v24);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      v52 = objc_msgSend(v13, "hasPredictedLocation");
      objc_msgSend(v13, "preferredLocation");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "virtualConference");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "urlWithAllowedScheme");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        v68 = v26;
        objc_msgSend(v13, "virtualConference");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "joinMethods");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "firstObject");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "isBroadcast");

      }
      else
      {
        objc_msgSend(v13, "conferenceURLForDisplay");
        v68 = (id)objc_claimAutoreleasedReturnValue();
        v30 = 0;
      }
      v48 = v30;
      -[CALNTriggeredEventNotificationEKDataSource mailtoURLProvider](self, "mailtoURLProvider");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "mailtoURLForEvent:", v13);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      BYTE4(v49) = objc_msgSend(v13, "hasAlarms");
      objc_msgSend(v13, "eventOccurrenceID");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v49) = objc_msgSend(v13, "travelAdvisoryBehavior") == 2;

      v21 = v68;
    }
    else
    {
      v57 = 0;
      v58 = 0;
      v56 = 0;
      v63 = 0;
      v67 = 0;
      v55 = 0;
      v66 = 0;
      v52 = 0;
      v65 = 0;
      v21 = 0;
      v48 = 0;
      v64 = 0;
      v49 = 0;
      v51 = 0;
      LOBYTE(v54) = 1;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("x-apple-eventkit-alert-%@"), v69);
    v32 = objc_claimAutoreleasedReturnValue();
    -[CALNTriggeredEventNotificationEKDataSource coreLocationManager](self, "coreLocationManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "allowsLocationAlerts");

    -[CALNTriggeredEventNotificationEKDataSource debugPreferences](self, "debugPreferences");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "forceDisplayOfNewTravelAdvisoryHypotheses");

    v37 = [CALNTriggeredEventNotificationInfo alloc];
    objc_msgSend(v13, "objectID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringRepresentation");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v13;
    objc_msgSend(v13, "calendar");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "calendarIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE4(v47) = v49;
    BYTE3(v47) = v36;
    BYTE2(v47) = v34;
    BYTE1(v47) = BYTE4(v49);
    LOBYTE(v47) = v52;
    LOBYTE(v46) = v48;
    v45 = v32;
    v53 = (void *)v32;
    LOBYTE(v44) = v54;
    v15 = v58;
    v16 = -[CALNTriggeredEventNotificationInfo initWithTitle:location:locationWithoutPrediction:startDate:endDate:isAllDay:isTimeSensitive:eventID:eventOccurrenceID:eventObjectID:calendarIdentifier:eventRepresentationDictionary:legacyIdentifier:preferredLocation:conferenceURL:conferenceURLIsBroadcast:mailtoURL:hasSuggestedLocation:eventHasAlarms:allowsLocationAlerts:forceDisplayOfNewTravelAdvisoryHypotheses:travelAdvisoryDisabled:](v37, "initWithTitle:location:locationWithoutPrediction:startDate:endDate:isAllDay:isTimeSensitive:eventID:eventOccurrenceID:eventObjectID:calendarIdentifier:eventRepresentationDictionary:legacyIdentifier:preferredLocation:conferenceURL:conferenceURLIsBroadcast:mailtoURL:hasSuggestedLocation:eventHasAlarms:allowsLocationAlerts:forceDisplayOfNewTravelAdvisoryHypotheses:travelAdvisoryDisabled:", v58, v57, v56, v63, v67, v55, v44, v69, v51, v39, v41, v66, v45, v65,
            v21,
            v46,
            v64,
            v47);

    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v42 = objc_claimAutoreleasedReturnValue();
    v6 = v62;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v73 = v62;
      v74 = 2112;
      v75 = v16;
      _os_log_impl(&dword_215D9B000, v42, OS_LOG_TYPE_DEFAULT, "Fetched triggered event notification info with source client identifier: %{public}@. Triggered notification info: %@.", buf, 0x16u);
    }

    v10 = v60;
    v8 = v61;
    v12 = v59;
    v13 = v50;
    goto LABEL_25;
  }
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[CALNTriggeredEventNotificationEKDataSource fetchTriggeredEventNotificationInfoWithSourceClientIdentifier:isProtectedDataAvailable:].cold.1();
  v16 = 0;
LABEL_25:

  return v16;
}

- (BOOL)shouldWithdrawNotificationWithSourceClientIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0;
  v14 = 0;
  +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventID:andAlarmID:fromSourceClientIdentifier:](CALNTriggeredEventNotificationSourceClientIdentifierUtilities, "eventID:andAlarmID:fromSourceClientIdentifier:", &v14, &v13, v4);
  v5 = v14;
  v6 = v13;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[CALNTriggeredEventNotificationEKDataSource eventStoreProvider](self, "eventStoreProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "eventStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "_eventOccurrenceWithURI:", v7);
      v10 = objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = -[CALNTriggeredEventNotificationEKDataSource _shouldWithdrawNotificationWithSourceClientIdentifier:event:alarmID:](self, "_shouldWithdrawNotificationWithSourceClientIdentifier:event:alarmID:", v4, v10, v6);
        goto LABEL_9;
      }
    }
  }
  else
  {
    v7 = 0;
  }
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v4;
    _os_log_impl(&dword_215D9B000, v10, OS_LOG_TYPE_DEFAULT, "Failed to find event occurrence for sourceClientIdentifier %{public}@. Withdrawing notification.", buf, 0xCu);
  }
  v11 = 1;
LABEL_9:

  return v11;
}

- (BOOL)shouldRemoveNotificationMetaDataWithEventID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CALNTriggeredEventNotificationEKDataSource _eventForEventID:](self, "_eventForEventID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = v4;
      _os_log_impl(&dword_215D9B000, v6, OS_LOG_TYPE_DEFAULT, "Failed to find event occurrence for eventID = %{public}@. Should remove notification meta data.", (uint8_t *)&v8, 0xCu);
    }

  }
  return v5 == 0;
}

- (BOOL)shouldRemoveTimeToLeaveRefreshTimerWithRefreshDate:(id)a3 eventID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CALNTriggeredEventNotificationEKDataSource _eventForEventID:](self, "_eventForEventID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v6, "laterDate:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToDate:", v6);

    }
    else
    {
      v12 = 1;
    }

  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = v7;
      _os_log_impl(&dword_215D9B000, v13, OS_LOG_TYPE_DEFAULT, "Failed to find event occurrence for eventID = %{public}@. Should remove time to leave refresh timer.", (uint8_t *)&v15, 0xCu);
    }

    v12 = 1;
  }

  return v12;
}

- (id)notificationExpirationDateForEventID:(id)a3 alarmID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v20;
  void *v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CALNTriggeredEventNotificationEKDataSource _eventForEventID:](self, "_eventForEventID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend((id)objc_opt_class(), "_alarmForEvent:withAlarmID:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_alarmDateForAlarm:eventStartDate:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNTriggeredEventNotificationEKDataSource _notificationExpirationDateForNullableAlarmDate:eventEndDate:](self, "_notificationExpirationDateForNullableAlarmDate:eventEndDate:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "absoluteDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v9, "isAbsolute");
      v16 = CFSTR("NO");
      if (v15)
        v16 = CFSTR("YES");
      v20 = v16;
      v17 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v9, "relativeOffset");
      objc_msgSend(v17, "numberWithDouble:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545410;
      v23 = v6;
      v24 = 2114;
      v25 = v13;
      v26 = 2114;
      v27 = v10;
      v28 = 2114;
      v29 = v12;
      v30 = 2114;
      v31 = v7;
      v32 = 2114;
      v33 = v11;
      v34 = 2114;
      v35 = v21;
      v36 = 2114;
      v37 = v20;
      v38 = 2114;
      v39 = v18;
      _os_log_impl(&dword_215D9B000, v14, OS_LOG_TYPE_DEFAULT, "Computed notification expiration date for event id = %{public}@, expiration date = %{public}@, event start date = %{public}@, event end date = %{public}@, alarm id = %{public}@, alarm date = %{public}@, alarm absolute date = %{public}@, is alarm absolute = %{public}@, alarm relative offset %{public}@", buf, 0x5Cu);

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)_alarmDateForAlarm:(id)a3 eventStartDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  int v10;
  id v11;
  void *v12;

  v5 = a4;
  if (a3)
  {
    v6 = a3;
    objc_msgSend(v6, "absoluteDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "relativeOffset");
    v9 = v8;
    v10 = objc_msgSend(v6, "isAbsolute");

    if (v10)
    {
      v11 = v7;
    }
    else
    {
      if (!v5)
      {
        v12 = 0;
        goto LABEL_9;
      }
      objc_msgSend(v5, "dateByAddingTimeInterval:", v9);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;
LABEL_9:

    goto LABEL_10;
  }
  v12 = 0;
LABEL_10:

  return v12;
}

- (id)_notificationExpirationDateForNullableAlarmDate:(id)a3 eventEndDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
    if (v6)
    {
      -[CALNTriggeredEventNotificationEKDataSource _notificationExpirationDateForAlarmDate:eventEndDate:](self, "_notificationExpirationDateForAlarmDate:eventEndDate:", v6, v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v10;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_notificationExpirationDateForAlarmDate:(id)a3 eventEndDate:(id)a4
{
  id v5;
  id v6;
  double v7;
  id v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  if (v7 >= 0.0)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateByAddingDays:inCalendar:", 1, v9);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = v6;
  }

  return v8;
}

- (void)setUpTimeToLeaveRefreshTimerWithTriggerDate:(id)a3 sourceClientIdentifier:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;

  v6 = a3;
  +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventIDForSourceClientIdentifier:](CALNTriggeredEventNotificationSourceClientIdentifierUtilities, "eventIDForSourceClientIdentifier:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[CALNTriggeredEventNotificationEKDataSource setUpTimeToLeaveRefreshTimerWithTriggerDate:eventID:](self, "setUpTimeToLeaveRefreshTimerWithTriggerDate:eventID:", v6, v7);
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CALNTriggeredEventNotificationEKDataSource setUpTimeToLeaveRefreshTimerWithTriggerDate:sourceClientIdentifier:].cold.1();

  }
}

- (void)setUpTimeToLeaveRefreshTimerWithTriggerDate:(id)a3 eventID:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = a3;
  -[CALNTriggeredEventNotificationEKDataSource timeToLeaveRefreshMonitor](self, "timeToLeaveRefreshMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUpRefreshTimerWithTriggerDate:eventExternalURL:", v8, v6);

  -[CALNTriggeredEventNotificationEKDataSource _didSetUpTimeToLeaveRefreshTimerForEventID:triggerDate:](self, "_didSetUpTimeToLeaveRefreshTimerForEventID:triggerDate:", v6, v8);
}

- (void)removeTimeToLeaveRefreshTimerForSourceClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventIDForSourceClientIdentifier:](CALNTriggeredEventNotificationSourceClientIdentifierUtilities, "eventIDForSourceClientIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CALNTriggeredEventNotificationEKDataSource removeTimeToLeaveRefreshTimerForEventID:](self, "removeTimeToLeaveRefreshTimerForEventID:", v5);
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = v4;
      _os_log_impl(&dword_215D9B000, v6, OS_LOG_TYPE_DEFAULT, "No event ID available to remove time to leave refresh timer. source client identifier = %{public}@", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (void)removeTimeToLeaveRefreshTimerForEventID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CALNTriggeredEventNotificationEKDataSource timeToLeaveRefreshMonitor](self, "timeToLeaveRefreshMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeRefreshTimerForEventExternalURL:", v4);

  -[CALNTriggeredEventNotificationEKDataSource travelEngine](self, "travelEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancelHypothesisRefreshRequestForEventWithExternalURL:", v4);

  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_215D9B000, v7, OS_LOG_TYPE_DEFAULT, "Cancelled hypothesis refresh request for event ID = %{public}@", (uint8_t *)&v8, 0xCu);
  }

}

- (void)_didSetUpTimeToLeaveRefreshTimerForEventID:(id)a3 triggerDate:(id)a4
{
  id v6;
  id v7;
  double v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CALNTriggeredEventNotificationEKDataSource _requestHypothesisRefreshInterval](self, "_requestHypothesisRefreshInterval");
  objc_msgSend(v7, "dateByAddingTimeInterval:", -v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CALNTriggeredEventNotificationEKDataSource travelEngine](self, "travelEngine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestHypothesisRefreshAtDate:forEventWithExternalURL:", v9, v6);

  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543618;
    v13 = v6;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_215D9B000, v11, OS_LOG_TYPE_DEFAULT, "Requested hypothesis refresh date for event ID = %{public}@, requested hypothesis refresh date = %{public}@", (uint8_t *)&v12, 0x16u);
  }

}

- (double)_requestHypothesisRefreshInterval
{
  return 60.0;
}

- (void)ceaseRouteMonitoringEventForSourceClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventIDForSourceClientIdentifier:](CALNTriggeredEventNotificationSourceClientIdentifierUtilities, "eventIDForSourceClientIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CALNTriggeredEventNotificationEKDataSource ceaseRouteMonitoringEventWithEventID:](self, "ceaseRouteMonitoringEventWithEventID:", v5);
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CALNTriggeredEventNotificationEKDataSource ceaseRouteMonitoringEventForSourceClientIdentifier:].cold.1();

  }
}

- (void)ceaseRouteMonitoringEventWithEventID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CALNTriggeredEventNotificationEKDataSource travelEngine](self, "travelEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ceaseMonitoringForEventWithExternalURL:", v4);

  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_215D9B000, v6, OS_LOG_TYPE_DEFAULT, "Ceased route monitoring for event ID = %{public}@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)acknowledgeEventWithSourceClientIdentifier:(id)a3 shouldMarkAsHavingReceivedLocation:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v6;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_215D9B000, v7, OS_LOG_TYPE_DEFAULT, "Acknowledging event with source client identifier: %{public}@, shouldMarkAsHavingReceivedLocation = %{public}@", (uint8_t *)&v12, 0x16u);

  }
  -[CALNTriggeredEventNotificationEKDataSource _handleNotificationActionForSourceClientIdentifier:acknowledgeAlarm:eventActions:](self, "_handleNotificationActionForSourceClientIdentifier:acknowledgeAlarm:eventActions:", v6, 1, 0);
  if (v4)
  {
    -[CALNTriggeredEventNotificationEKDataSource coreLocationManager](self, "coreLocationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "allowsLocationAlerts");

    if ((v10 & 1) != 0)
    {
      -[CALNTriggeredEventNotificationEKDataSource coreLocationManager](self, "coreLocationManager");
      v11 = objc_claimAutoreleasedReturnValue();
      -[NSObject markAsHavingReceivedLocation](v11, "markAsHavingReceivedLocation");
    }
    else
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[CALNTriggeredEventNotificationEKDataSource acknowledgeEventWithSourceClientIdentifier:shouldMarkAsHavingReceivedLocation:].cold.1();
    }

  }
}

- (void)snoozeEventWithSourceClientIdentifier:(id)a3 snoozeType:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  CALNTriggeredEventNotificationEKDataSource *v10;
  unint64_t v11;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __95__CALNTriggeredEventNotificationEKDataSource_snoozeEventWithSourceClientIdentifier_snoozeType___block_invoke;
  v8[3] = &unk_24D4846C8;
  v10 = self;
  v11 = a4;
  v9 = v6;
  v7 = v6;
  -[CALNTriggeredEventNotificationEKDataSource _handleNotificationActionForSourceClientIdentifier:acknowledgeAlarm:eventActions:](self, "_handleNotificationActionForSourceClientIdentifier:acknowledgeAlarm:eventActions:", v7, 0, v8);

}

void __95__CALNTriggeredEventNotificationEKDataSource_snoozeEventWithSourceClientIdentifier_snoozeType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 48);
  switch(v7)
  {
    case 0:
      v8 = 540.0;
      goto LABEL_8;
    case 1:
      v8 = 300.0;
      goto LABEL_8;
    case 2:
      v8 = 900.0;
      goto LABEL_8;
    case 3:
      v8 = 1800.0;
      goto LABEL_8;
    case 4:
      v8 = 3600.0;
      goto LABEL_8;
    case 5:
      objc_msgSend(v5, "startDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = -1800.0;
      goto LABEL_12;
    case 6:
      objc_msgSend(v5, "startDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = -900.0;
      goto LABEL_12;
    case 7:
      objc_msgSend(v5, "startDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = -300.0;
LABEL_12:
      objc_msgSend(v10, "dateByAddingTimeInterval:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_16;
    case 8:
      objc_msgSend(v5, "startDate");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 9:
      objc_msgSend(v5, "endDate");
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v13 = (void *)v14;
LABEL_16:
      v15 = *(_QWORD *)(a1 + 48);
      v9 = v15 == 0;
      if (v13)
      {
        objc_msgSend(v5, "snoozeAlarm:untilTargetDate:pinsTriggerToStartDate:", v6, v13, v15 == 0);
        +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = *(_QWORD *)(a1 + 32);
          v20 = 138543618;
          v21 = v17;
          v22 = 2114;
          v23 = *(double *)&v13;
          _os_log_impl(&dword_215D9B000, v16, OS_LOG_TYPE_DEFAULT, "Snoozed event: %{public}@ until: %{public}@", (uint8_t *)&v20, 0x16u);
        }

      }
      else
      {
        v8 = 0.0;
LABEL_21:
        objc_msgSend(v5, "snoozeAlarm:withTimeIntervalFromNow:pinsTriggerToStartDate:", v6, v9, v8);
        +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = *(_QWORD *)(a1 + 32);
          v20 = 138543618;
          v21 = v19;
          v22 = 2048;
          v23 = v8;
          _os_log_impl(&dword_215D9B000, v18, OS_LOG_TYPE_DEFAULT, "Snoozed event: %{public}@ duration: %f", (uint8_t *)&v20, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 40), "remoteMutator");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setSnoozeTimeInterval:alarm:calendarItem:", v6, v5, v8);
      }

      return;
    default:
      v8 = 0.0;
LABEL_8:
      v9 = v7 == 0;
      goto LABEL_21;
  }
}

- (void)handleDirectionsActionWithSourceClientIdentifier:(id)a3 hypothesis:(id)a4 lastFireTimeOfAlertOffsetFromTravelTime:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138543362;
    v20 = v7;
    _os_log_impl(&dword_215D9B000, v9, OS_LOG_TYPE_DEFAULT, "Handling directions action with source client identifier (%{public}@)", (uint8_t *)&v19, 0xCu);
  }

  if (v8)
  {
    -[CALNTriggeredEventNotificationEKDataSource eventStoreProvider](self, "eventStoreProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "eventStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_eventOccurrenceWithURI:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferredLocation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isPrediction");

    objc_msgSend(v13, "calendar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "sharingStatus") != 0;

    -[CALNTriggeredEventNotificationEKDataSource ttlEventTracker](self, "ttlEventTracker");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[CALNTimeToLeaveEventTrackerUtilities trackDirectionsEngagedForNotificationUsingTTLEventTracker:hypothesis:hasSuggestedLocation:isOnSharedCalendar:](CALNTimeToLeaveEventTrackerUtilities, "trackDirectionsEngagedForNotificationUsingTTLEventTracker:hypothesis:hasSuggestedLocation:isOnSharedCalendar:", v18, v8, v15, v17);

  }
}

- (void)handleMailOrganizerActionWithSourceClientIdentifier:(id)a3 hypothesis:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138543362;
    v19 = v6;
    _os_log_impl(&dword_215D9B000, v8, OS_LOG_TYPE_DEFAULT, "Handling mail organizer action with source client identifier (%{public}@)", (uint8_t *)&v18, 0xCu);
  }

  if (v7)
  {
    -[CALNTriggeredEventNotificationEKDataSource eventStoreProvider](self, "eventStoreProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "eventStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_eventOccurrenceWithURI:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferredLocation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isPrediction");

    objc_msgSend(v12, "calendar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "sharingStatus") != 0;

    -[CALNTriggeredEventNotificationEKDataSource ttlEventTracker](self, "ttlEventTracker");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[CALNTimeToLeaveEventTrackerUtilities trackEmailEngagedForNotificationUsingTTLEventTracker:hypothesis:hasSuggestedLocation:isOnSharedCalendar:](CALNTimeToLeaveEventTrackerUtilities, "trackEmailEngagedForNotificationUsingTTLEventTracker:hypothesis:hasSuggestedLocation:isOnSharedCalendar:", v17, v7, v14, v16);

  }
}

- (void)travelEngine:(id)a3 receivedHypothesis:(id)a4 eventExternalURL:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  CALNTriggeredEventNotificationTriggerData *v13;
  int v14;
  NSObject *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  -[CALNTriggeredEventNotificationEKDataSource _eventForEventID:](self, "_eventForEventID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities sourceClientIdentifierForEventID:alarmID:](CALNTriggeredEventNotificationSourceClientIdentifierUtilities, "sourceClientIdentifierForEventID:alarmID:", v8, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543874;
      v15 = v10;
      v16 = 2114;
      v17 = v8;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_215D9B000, v11, OS_LOG_TYPE_DEFAULT, "Lastest hypothesis has been emitted to be trigged as a notification. source client identifier = %{public}@, event external url = %{public}@, hypothesis = %@", (uint8_t *)&v14, 0x20u);
    }

    -[CALNTriggeredEventNotificationEKDataSource delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = -[CALNTriggeredEventNotificationTriggerData initWithTrigger:alarmID:isOffsetFromTravelTimeStart:hypothesis:]([CALNTriggeredEventNotificationTriggerData alloc], "initWithTrigger:alarmID:isOffsetFromTravelTimeStart:hypothesis:", 1, 0, 0, v7);
      objc_msgSend(v12, "dataSource:triggeredWithSourceClientIdentifier:triggerData:", self, v10, v13);
    }
    else
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v13 = (CALNTriggeredEventNotificationTriggerData *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR))
        -[CALNTriggeredEventNotificationEKDataSource travelEngine:receivedHypothesis:eventExternalURL:].cold.2();
    }

  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CALNTriggeredEventNotificationEKDataSource travelEngine:receivedHypothesis:eventExternalURL:].cold.1();
  }

}

- (void)travelEngine:(id)a3 eventSignificantlyChangedWithEventExternalURL:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities sourceClientIdentifierForEventID:alarmID:](CALNTriggeredEventNotificationSourceClientIdentifierUtilities, "sourceClientIdentifierForEventID:alarmID:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = v6;
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_215D9B000, v7, OS_LOG_TYPE_DEFAULT, "Travel engine event changed significantly. source client identifier = %{public}@, event external url = %{public}@", (uint8_t *)&v10, 0x16u);
  }

  -[CALNTriggeredEventNotificationEKDataSource delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[CALNTriggeredEventNotificationEKDataSource delegate](self, "delegate");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject dataSource:travelEngineEventSignificantlyChangedWithSourceClientIdentifier:](v9, "dataSource:travelEngineEventSignificantlyChangedWithSourceClientIdentifier:", self, v6);
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CALNTriggeredEventNotificationEKDataSource travelEngine:eventSignificantlyChangedWithEventExternalURL:].cold.1();
  }

}

- (void)travelEngine:(id)a3 authorizationChanged:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a4;
  -[CALNTriggeredEventNotificationEKDataSource delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "dataSource:travelAdvisoryAuthorizationChanged:", self, v4);
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CALNTriggeredEventNotificationEKDataSource travelEngine:authorizationChanged:].cold.1(v4, v8, v9, v10, v11, v12, v13, v14);

  }
}

- (void)timeToLeaveRefreshMonitor:(id)a3 refreshTimerFiredForEventExternalURL:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  CALNTriggeredEventNotificationTriggerData *v10;
  int v11;
  NSObject *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[CALNTriggeredEventNotificationEKDataSource _eventForEventID:](self, "_eventForEventID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities sourceClientIdentifierForEventID:alarmID:](CALNTriggeredEventNotificationSourceClientIdentifierUtilities, "sourceClientIdentifierForEventID:alarmID:", v5, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543618;
      v12 = v7;
      v13 = 2114;
      v14 = v5;
      _os_log_impl(&dword_215D9B000, v8, OS_LOG_TYPE_DEFAULT, "Leave now refresh timer fired for source client identifier = %{public}@, event external url = %{public}@", (uint8_t *)&v11, 0x16u);
    }

    -[CALNTriggeredEventNotificationEKDataSource delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = -[CALNTriggeredEventNotificationTriggerData initWithTrigger:alarmID:isOffsetFromTravelTimeStart:hypothesis:]([CALNTriggeredEventNotificationTriggerData alloc], "initWithTrigger:alarmID:isOffsetFromTravelTimeStart:hypothesis:", 2, 0, 0, 0);
      objc_msgSend(v9, "dataSource:triggeredWithSourceClientIdentifier:triggerData:", self, v7, v10);
    }
    else
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v10 = (CALNTriggeredEventNotificationTriggerData *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR))
        -[CALNTriggeredEventNotificationEKDataSource timeToLeaveRefreshMonitor:refreshTimerFiredForEventExternalURL:].cold.2();
    }

  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CALNTriggeredEventNotificationEKDataSource timeToLeaveRefreshMonitor:refreshTimerFiredForEventExternalURL:].cold.1();
  }

}

- (void)sendFeedbackForAddedTravelAdvisoryNotificationWithSourceClientIdentifier:(id)a3 hypothesis:(id)a4 travelAdvisoryTimelinessPeriod:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v8;
    _os_log_impl(&dword_215D9B000, v10, OS_LOG_TYPE_DEFAULT, "Preparing to send feedback for added notification with source client identifier = %{public}@", buf, 0xCu);
  }

  -[CALNTriggeredEventNotificationEKDataSource _eventForSourceClientIdentifier:](self, "_eventForSourceClientIdentifier:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationEKDataSource foundInAppsEventTracker](self, "foundInAppsEventTracker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationEKDataSource suggestionsServiceLogger](self, "suggestionsServiceLogger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationEKDataSource ttlEventTracker](self, "ttlEventTracker");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNTriggeredEventNotificationFeedbackHelper recordDisplayOfInitialTimeToLeaveAlertForSourceClientIdentifier:event:hypothesis:travelAdvisoryTimelinessPeriod:foundInAppsEventTracker:suggestionsServiceLogger:ttlEventTracker:](CALNTriggeredEventNotificationFeedbackHelper, "recordDisplayOfInitialTimeToLeaveAlertForSourceClientIdentifier:event:hypothesis:travelAdvisoryTimelinessPeriod:foundInAppsEventTracker:suggestionsServiceLogger:ttlEventTracker:", v8, v11, v9, a5, v12, v13, v14);

  -[CALNTriggeredEventNotificationEKDataSource travelEngine](self, "travelEngine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNTriggeredEventNotificationFeedbackHelper sendFeedbackForPostingNotificationWithTravelAdvisoryTimelinessPeriod:sourceClientIdentifier:travelEngine:](CALNTriggeredEventNotificationFeedbackHelper, "sendFeedbackForPostingNotificationWithTravelAdvisoryTimelinessPeriod:sourceClientIdentifier:travelEngine:", a5, v8, v15);

}

- (void)sendFeedbackForAddedLeaveNowNotificationWithSourceClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventIDForSourceClientIdentifier:](CALNTriggeredEventNotificationSourceClientIdentifierUtilities, "eventIDForSourceClientIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CALNTriggeredEventNotificationEKDataSource travelEngine](self, "travelEngine");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject sendFeedbackForPostingLeaveNowNotificationForEventWithExternalURL:](v6, "sendFeedbackForPostingLeaveNowNotificationForEventWithExternalURL:", v5);
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CALNTriggeredEventNotificationEKDataSource sendFeedbackForAddedLeaveNowNotificationWithSourceClientIdentifier:].cold.1();
  }

}

- (void)didDismissUINotification:(unint64_t)a3 forPlannedDestination:(id)a4 dismissalType:(unint64_t)a5
{
  id v8;
  id v9;

  v8 = a4;
  -[CALNTriggeredEventNotificationEKDataSource routeHypothesizerProvider](self, "routeHypothesizerProvider");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didDismissUINotification:forPlannedDestination:dismissalType:", a3, v8, a5);

}

- (void)_alertsFired:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)os_transaction_create();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EKAlarmEngineAlarmOccurrencesKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67240192;
      v26 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_215D9B000, v10, OS_LOG_TYPE_DEFAULT, "Received alarm engine notification with %{public}d fired alerts", buf, 8u);
    }

    -[CALNTriggeredEventNotificationEKDataSource _filterAlerts:](self, "_filterAlerts:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    if (v12 != objc_msgSend(v7, "count"))
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = objc_msgSend(v7, "count");
        v15 = objc_msgSend(v11, "count");
        *(_DWORD *)buf = 67240192;
        v26 = v14 - v15;
        _os_log_impl(&dword_215D9B000, v13, OS_LOG_TYPE_DEFAULT, "Filtered out %{public}d fired alerts that referenced the same event as other alerts firing at the same time", buf, 8u);
      }

    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v11;
    v16 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v21;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v10);
          -[CALNTriggeredEventNotificationEKDataSource _alertFiredForAlertInfo:](self, "_alertFiredForAlertInfo:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19++), (_QWORD)v20);
        }
        while (v17 != v19);
        v17 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v17);
    }

  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[CALNTriggeredEventNotificationEKDataSource _alertsFired:].cold.1(v10);
  }

}

- (void)_alertFiredForAlertInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  CALNTriggeredEventNotificationTriggerData *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[CALNTriggeredEventNotificationEKDataSource _shouldTriggerForAlertInfo:](self, "_shouldTriggerForAlertInfo:", v4))
  {
    objc_msgSend((id)objc_opt_class(), "_sourceClientIdentifierForAlertInfo:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    -[CALNTriggeredEventNotificationEKDataSource delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "alarmID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[CALNTriggeredEventNotificationTriggerData initWithTrigger:alarmID:isOffsetFromTravelTimeStart:hypothesis:]([CALNTriggeredEventNotificationTriggerData alloc], "initWithTrigger:alarmID:isOffsetFromTravelTimeStart:hypothesis:", 0, v7, objc_msgSend(v4, "isOffsetFromTravelTimeStart"), 0);
      -[CALNTriggeredEventNotificationEKDataSource delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dataSource:triggeredWithSourceClientIdentifier:triggerData:", self, v5, v8);

    }
    else
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CALNTriggeredEventNotificationEKDataSource _alertFiredForAlertInfo:].cold.1();

    }
    goto LABEL_9;
  }
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "entityID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v6;
    _os_log_impl(&dword_215D9B000, v5, OS_LOG_TYPE_DEFAULT, "Should not trigger for fired alert. entity ID = %{public}@", (uint8_t *)&v11, 0xCu);
LABEL_9:

  }
}

- (BOOL)_shouldTriggerForAlertInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  char v9;
  NSObject *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "entityID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CALNTriggeredEventNotificationEKDataSource _shouldTriggerForAlertInfo:].cold.1(v3, v10);
    goto LABEL_12;
  }
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDC7578]) & 1) == 0)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CALNTriggeredEventNotificationEKDataSource _shouldTriggerForAlertInfo:].cold.2();
LABEL_12:

    v9 = 0;
    goto LABEL_13;
  }
  v6 = objc_msgSend(v3, "acknowledged");
  if (v6)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "entityID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v8;
      _os_log_impl(&dword_215D9B000, v7, OS_LOG_TYPE_DEFAULT, "Should not trigger for acknowledged alert info. entity ID = %{public}@", (uint8_t *)&v12, 0xCu);

    }
  }
  v9 = v6 ^ 1;
LABEL_13:

  return v9;
}

- (id)_filterAlerts:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v28 = objc_msgSend(v3, "count");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v28);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v35 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v9, "entityID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = v9;
          objc_msgSend(v4, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            objc_msgSend(v12, "alarmID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject alarmID](v11, "alarmID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v14, "compare:", v15);

            if (v16 == -1)
            {
              v17 = v13;

              v11 = v17;
            }
          }
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v10);

        }
        else
        {
          +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v40 = v9;
            _os_log_error_impl(&dword_215D9B000, v11, OS_LOG_TYPE_ERROR, "Received a fired alert, but the alert info has no entity ID: %@", buf, 0xCu);
          }
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    }
    while (v6);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v18 = obj;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v31 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
        objc_msgSend(v23, "entityID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24 && objc_msgSend(v23, "triggerType") && objc_msgSend(v23, "triggerType") != 1)
          objc_msgSend(v4, "removeObjectForKey:", v24);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v20);
  }

  if (objc_msgSend(v4, "count") == v28)
  {
    v25 = v18;
  }
  else
  {
    objc_msgSend(v4, "allValues");
    v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  v26 = v25;

  return v26;
}

+ (id)_alarmForEvent:(id)a3 withAlarmID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v5, "allAlarms", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v11, "externalID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v6, "isEqualToString:", v12);

          if ((v13 & 1) != 0)
          {
            v8 = v11;
            goto LABEL_12;
          }
        }
        v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_shouldWithdrawNotificationWithSourceClientIdentifier:(id)a3 event:(id)a4 alarmID:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  double v14;
  double v15;
  NSObject *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  NSObject *v26;
  int v28;
  id v29;
  __int16 v30;
  NSObject *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    objc_msgSend((id)objc_opt_class(), "_alarmForEvent:withAlarmID:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v28 = 138543362;
        v29 = v7;
        _os_log_impl(&dword_215D9B000, v12, OS_LOG_TYPE_DEFAULT, "Failed to find alarm for sourceClientIdentifier %{public}@. Withdrawing notification.", (uint8_t *)&v28, 0xCu);
      }
      v17 = 1;
      goto LABEL_24;
    }
    objc_msgSend(v10, "absoluteDate");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12
      && (objc_msgSend(MEMORY[0x24BDBCE60], "CalSimulatedDateForNow"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          -[NSObject timeIntervalSinceDate:](v12, "timeIntervalSinceDate:", v13),
          v15 = v14,
          v13,
          v15 > 0.0))
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v28 = 138543362;
        v29 = v7;
        _os_log_impl(&dword_215D9B000, v16, OS_LOG_TYPE_DEFAULT, "Withdrawing notification for event (%{public}@) whose alarm is now in the future.", (uint8_t *)&v28, 0xCu);
      }
    }
    else
    {
      objc_msgSend(v11, "acknowledgedDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        v17 = 0;
LABEL_24:

        goto LABEL_25;
      }
      objc_msgSend(v11, "absoluteDate");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        objc_msgSend(v8, "startDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(v11, "relativeOffset");
        objc_msgSend(v20, "dateWithTimeInterval:sinceDate:", v19);
        v16 = objc_claimAutoreleasedReturnValue();

      }
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "acknowledgedDate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543874;
        v29 = v7;
        v30 = 2114;
        v31 = v16;
        v32 = 2114;
        v33 = v22;
        _os_log_impl(&dword_215D9B000, v21, OS_LOG_TYPE_DEFAULT, "Computed fire date for event (%{public}@): %{public}@. Inspecting item's alarm acknowledged date to determine whether or not to withdraw notification. Events's alarm acknowledged date: %{public}@.", (uint8_t *)&v28, 0x20u);

      }
      objc_msgSend(v11, "acknowledgedDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "timeIntervalSinceDate:", v16);
      v25 = v24;

      if (v25 < 0.0)
      {
        v17 = 0;
LABEL_23:

        goto LABEL_24;
      }
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v28 = 138543362;
        v29 = v7;
        _os_log_impl(&dword_215D9B000, v26, OS_LOG_TYPE_DEFAULT, "Withdrawing notification for event (%{public}@) whose alarm has been acknowledged (probably on another device).", (uint8_t *)&v28, 0xCu);
      }

    }
    v17 = 1;
    goto LABEL_23;
  }
  v17 = objc_msgSend(v8, "travelAdvisoryBehavior") == 2;
LABEL_25:

  return v17;
}

- (void)_handleNotificationActionForSourceClientIdentifier:(id)a3 acknowledgeAlarm:(BOOL)a4 eventActions:(id)a5
{
  _BOOL4 v5;
  void (**v8)(id, void *, void *);
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v5 = a4;
  v29 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, void *, void *))a5;
  v21 = 0;
  v22 = 0;
  +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventID:andAlarmID:fromSourceClientIdentifier:](CALNTriggeredEventNotificationSourceClientIdentifierUtilities, "eventID:andAlarmID:fromSourceClientIdentifier:", &v22, &v21, a3);
  v9 = v22;
  v10 = v21;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationEKDataSource eventStoreProvider](self, "eventStoreProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "eventStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "_eventOccurrenceWithURI:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_alarmForEvent:withAlarmID:", v14, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "CalSimulatedDateForNow");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAcknowledgedDate:", v16);

    }
    if (v8)
      v8[2](v8, v14, v15);
    v20 = 0;
    v17 = objc_msgSend(v13, "saveEvent:span:error:", v14, 2, &v20);
    v18 = v20;
    if ((v17 & 1) == 0)
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v24 = v10;
        v25 = 2114;
        v26 = v9;
        v27 = 2112;
        v28 = v18;
        _os_log_error_impl(&dword_215D9B000, v19, OS_LOG_TYPE_ERROR, "Error acknowledging alarm (%{public}@) for event (%{public}@): %@", buf, 0x20u);
      }

    }
  }

}

- (id)_eventForSourceClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventIDForSourceClientIdentifier:](CALNTriggeredEventNotificationSourceClientIdentifierUtilities, "eventIDForSourceClientIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CALNTriggeredEventNotificationEKDataSource _eventForEventID:](self, "_eventForEventID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CALNTriggeredEventNotificationEKDataSource sendFeedbackForAddedLeaveNowNotificationWithSourceClientIdentifier:].cold.1();

    v6 = 0;
  }

  return v6;
}

- (id)_eventForEventID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CALNTriggeredEventNotificationEKDataSource eventStoreProvider](self, "eventStoreProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "eventStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "_eventOccurrenceWithURI:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CALNTriggeredEventNotificationEKDataSource _eventForEventID:].cold.1();

    v8 = 0;
  }

  return v8;
}

+ (id)_sourceClientIdentifierForAlertInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "entityID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "externalID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities sourceClientIdentifierForEventID:alarmID:](CALNTriggeredEventNotificationSourceClientIdentifierUtilities, "sourceClientIdentifierForEventID:alarmID:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)eventObjectIDForEventID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[CALNTriggeredEventNotificationEKDataSource eventStoreProvider](self, "eventStoreProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_eventOccurrenceWithURI:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CALNTriggeredEventNotificationDataSourceDelegate)delegate
{
  return (CALNTriggeredEventNotificationDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (EKEventStoreProvider)eventStoreProvider
{
  return self->_eventStoreProvider;
}

- (CALNRemoteMutator)remoteMutator
{
  return self->_remoteMutator;
}

- (CALNDataSourceEventRepresentationProvider)dataSourceEventRepresentationProvider
{
  return self->_dataSourceEventRepresentationProvider;
}

- (CALNCalendarCoreLocationManager)coreLocationManager
{
  return self->_coreLocationManager;
}

- (CALNTTLEventTracker)ttlEventTracker
{
  return self->_ttlEventTracker;
}

- (CALNAlarmEngineMonitor)alarmEngineMonitor
{
  return self->_alarmEngineMonitor;
}

- (CALNTravelEngine)travelEngine
{
  return self->_travelEngine;
}

- (CALNFoundInAppsEventTracker)foundInAppsEventTracker
{
  return self->_foundInAppsEventTracker;
}

- (CALNSuggestionsServiceLogger)suggestionsServiceLogger
{
  return self->_suggestionsServiceLogger;
}

- (CALNRouteHypothesizerProvider)routeHypothesizerProvider
{
  return self->_routeHypothesizerProvider;
}

- (CALNTimeToLeaveRefreshMonitor)timeToLeaveRefreshMonitor
{
  return self->_timeToLeaveRefreshMonitor;
}

- (CALNDebugPreferences)debugPreferences
{
  return self->_debugPreferences;
}

- (CALNTriggeredEventNotificationMailtoURLProvider)mailtoURLProvider
{
  return self->_mailtoURLProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailtoURLProvider, 0);
  objc_storeStrong((id *)&self->_debugPreferences, 0);
  objc_storeStrong((id *)&self->_timeToLeaveRefreshMonitor, 0);
  objc_storeStrong((id *)&self->_routeHypothesizerProvider, 0);
  objc_storeStrong((id *)&self->_suggestionsServiceLogger, 0);
  objc_storeStrong((id *)&self->_foundInAppsEventTracker, 0);
  objc_storeStrong((id *)&self->_travelEngine, 0);
  objc_storeStrong((id *)&self->_alarmEngineMonitor, 0);
  objc_storeStrong((id *)&self->_ttlEventTracker, 0);
  objc_storeStrong((id *)&self->_coreLocationManager, 0);
  objc_storeStrong((id *)&self->_dataSourceEventRepresentationProvider, 0);
  objc_storeStrong((id *)&self->_remoteMutator, 0);
  objc_storeStrong((id *)&self->_eventStoreProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (double)snoozeInterval
{
  return 540.0;
}

- (void)fetchTriggeredEventNotificationInfoWithSourceClientIdentifier:isProtectedDataAvailable:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_215D9B000, v0, v1, "Could not get event for source client identifier with protected data available. source client identifier = %{public}@, event ID = %{public}@. Could not get notification info as a result.");
  OUTLINED_FUNCTION_1_0();
}

- (void)fetchTriggeredEventNotificationInfoWithSourceClientIdentifier:isProtectedDataAvailable:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_215D9B000, v0, v1, "Could not get event ID url to use for fetching triggered event notification info. source client identifier = %{public}@, event ID = %{public}@");
  OUTLINED_FUNCTION_1_0();
}

- (void)setUpTimeToLeaveRefreshTimerWithTriggerDate:sourceClientIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "No event ID available to set up time to leave refresh timer. source client identifier = @{public}@, trigger date = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)ceaseRouteMonitoringEventForSourceClientIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Could not get event ID to cease route monitoring event for source client identifier = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)acknowledgeEventWithSourceClientIdentifier:shouldMarkAsHavingReceivedLocation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Cannot mark as having received location because location alerts are not allowed, source client identifier = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)travelEngine:receivedHypothesis:eventExternalURL:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215D9B000, v0, v1, "Could not fetch event for event id = %{public}@. Suppressing received hypothesis trigger as a result, hypothesis = %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)travelEngine:receivedHypothesis:eventExternalURL:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "No delegate to send travel advice received message. event external url = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)travelEngine:eventSignificantlyChangedWithEventExternalURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "No delegate to send travel engine event significantly changed. event external url = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)travelEngine:(uint64_t)a3 authorizationChanged:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, a2, a3, "No delegate to send travel engine authorization changed message. authorized = %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)timeToLeaveRefreshMonitor:refreshTimerFiredForEventExternalURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Could not fetch event for event id = %{public}@. Suppressing time to leave refresh timer trigger as a result.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)timeToLeaveRefreshMonitor:refreshTimerFiredForEventExternalURL:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "No delegate to send time to leave refresh timer fired message. event external url = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)sendFeedbackForAddedLeaveNowNotificationWithSourceClientIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Could not get event ID for source client identifier = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_alertsFired:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_215D9B000, log, OS_LOG_TYPE_ERROR, "Received alarm engine notification without any fired alarms", v1, 2u);
}

- (void)_alertFiredForAlertInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "No delegate available to send alert fired message. source client identifier = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_shouldTriggerForAlertInfo:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "entityID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_215D9B000, a2, OS_LOG_TYPE_ERROR, "Should not trigger for fired alert info without scheme. entity ID = %{public}@", v4, 0xCu);

}

- (void)_shouldTriggerForAlertInfo:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Should not trigger for fired alert with entity ID scheme = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_eventForEventID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Could not get event ID url for event ID = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
