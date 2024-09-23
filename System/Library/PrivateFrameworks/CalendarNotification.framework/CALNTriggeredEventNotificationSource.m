@implementation CALNTriggeredEventNotificationSource

- (CALNTriggeredEventNotificationSource)initWithDataSource:(id)a3 notificationManager:(id)a4 iconIdentifierProvider:(id)a5 sourceEventRepresentationProvider:(id)a6 triggerHelper:(id)a7 transitionProvider:(id)a8 bodyDescriptionProvider:(id)a9 travelAdvisoryTimelinessAuthority:(id)a10 dateProvider:(id)a11 notificationDataStorage:(id)a12 urlHandler:(id)a13 mapItemURLProvider:(id)a14 timeToLeaveRefreshStorage:(id)a15 snoozeUpdateTimer:(id)a16
{
  id v21;
  id v22;
  CALNTriggeredEventNotificationSource *v23;
  CALNTriggeredEventNotificationSource *v24;
  id v25;
  id v26;
  id v27;
  const char *v28;
  NSObject *v29;
  dispatch_queue_t v30;
  OS_dispatch_queue *workQueue;
  NSMutableDictionary *v32;
  NSMutableDictionary *eventURLToObjectIDMap;
  void *v34;
  void *v35;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  objc_super v51;

  v50 = a3;
  v21 = a4;
  v49 = a5;
  v48 = a6;
  v47 = a7;
  v46 = a8;
  v45 = a9;
  v44 = a10;
  v43 = a11;
  v42 = a12;
  v41 = a13;
  v40 = a14;
  v39 = a15;
  v22 = a16;
  v51.receiver = self;
  v51.super_class = (Class)CALNTriggeredEventNotificationSource;
  v23 = -[CALNTriggeredEventNotificationSource init](&v51, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_dataSource, a3);
    objc_storeWeak((id *)&v24->_notificationManager, v21);
    objc_storeStrong((id *)&v24->_iconIdentifierProvider, a5);
    objc_storeStrong((id *)&v24->_sourceEventRepresentationProvider, a6);
    objc_storeStrong((id *)&v24->_triggerHelper, a7);
    objc_storeStrong((id *)&v24->_transitionProvider, a8);
    objc_storeStrong((id *)&v24->_bodyDescriptionProvider, a9);
    objc_storeStrong((id *)&v24->_travelAdvisoryTimelinessAuthority, a10);
    objc_storeStrong((id *)&v24->_dateProvider, a11);
    objc_storeStrong((id *)&v24->_notificationDataStorage, a12);
    objc_storeStrong((id *)&v24->_urlHandler, a13);
    objc_storeStrong((id *)&v24->_mapItemURLProvider, a14);
    objc_storeStrong((id *)&v24->_timeToLeaveRefreshStorage, a15);
    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    v25 = v22;
    v26 = v21;
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v28 = (const char *)objc_msgSend(v27, "UTF8String");

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = dispatch_queue_create(v28, v29);
    workQueue = v24->_workQueue;
    v24->_workQueue = (OS_dispatch_queue *)v30;

    v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    eventURLToObjectIDMap = v24->_eventURLToObjectIDMap;
    v24->_eventURLToObjectIDMap = v32;

    objc_storeStrong((id *)&v24->_snoozeUpdateTimer, a16);
    -[CALNTriggeredEventNotificationSource dataSource](v24, "dataSource");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setDelegate:", v24);

    -[CALNTriggeredEventNotificationSource snoozeUpdateTimer](v24, "snoozeUpdateTimer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setDelegate:", v24);

    v21 = v26;
    v22 = v25;
  }

  return v24;
}

- (id)contentForNotificationWithSourceClientIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  v17 = 0;
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__CALNTriggeredEventNotificationSource_contentForNotificationWithSourceClientIdentifier___block_invoke;
  block[3] = &unk_24D4847B0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __89__CALNTriggeredEventNotificationSource_contentForNotificationWithSourceClientIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_contentForNotificationWithSourceClientIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)contentForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 isProtectedDataAvailable:(BOOL)a5
{
  _BOOL4 v5;
  __CFString *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString **v25;
  __CFString *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  double v35;
  double v36;
  _BOOL4 v37;
  __CFString **v38;
  _BOOL4 v39;
  _BOOL4 v40;
  NSObject *v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  CALNMutableNotificationContent *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  __CFString *v59;
  id v60;
  CALNTriggeredEventNotificationSource *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  int v68;
  BOOL v69;
  BOOL v70;
  __CFString *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  __CFString *v83;
  void *v84;
  uint8_t buf[4];
  __CFString *v86;
  __int16 v87;
  _BOOL4 v88;
  __int16 v89;
  _BOOL4 v90;
  __int16 v91;
  _BOOL4 v92;
  __int16 v93;
  _BOOL4 v94;
  __int16 v95;
  __CFString *v96;
  __int16 v97;
  void *v98;
  uint64_t v99;

  v5 = a5;
  v99 = *MEMORY[0x24BDAC8D0];
  v8 = (__CFString *)a3;
  v9 = a4;
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v86 = v8;
    _os_log_impl(&dword_215D9B000, v10, OS_LOG_TYPE_DEFAULT, "Getting content for source client identifier = %{public}@", buf, 0xCu);
  }

  +[CALNBundle bundle](CALNBundle, "bundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v11;
  if (objc_msgSend(v12, "length"))
  {
    v81 = v12;
  }
  else
  {
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Event"), &stru_24D4856D0, 0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CALNTriggeredEventNotificationSource contentForSourceClientIdentifier:sourceNotificationInfo:isProtectedDataAvailable:].cold.1();

    }
  }
  -[CALNTriggeredEventNotificationSource dataSource](self, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "eventID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alarmID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "notificationExpirationDateForEventID:alarmID:", v15, v16);
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  +[CALNNotificationSound soundWithAlertType:alertTopic:](CALNNotificationSound, "soundWithAlertType:alertTopic:", 10, CFSTR("com.apple.mobilecal.bulletin-subsection.upcomingEvents"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSource iconIdentifierProvider](self, "iconIdentifierProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "identifierForIconWithDate:inCalendar:", v18, v19);
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = CFSTR("com.apple.calendar.notifications.TriggeredEvent");
  objc_msgSend(v9, "alarmID");
  v21 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mapItemURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "conferenceURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mapItemURL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "mailtoURL");
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  v76 = v22;
  v77 = (void *)v21;
  v75 = v23;
  v72 = v24;
  if (v21 && !v24 && !v23 && !v82)
  {
    v25 = kCALNTriggeredEventNotificationCategoryIdentifier_Snooze;
LABEL_14:
    v71 = v8;
    v26 = *v25;

LABEL_15:
    objc_msgSend(v9, "startDate");
    v27 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v9, "isAllDay");
    -[CALNTriggeredEventNotificationSource dateProvider](self, "dateProvider");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "now");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[CALNSnoozeCategory snoozeCategoryForEventWithStartDate:endDate:now:isAllDay:](CALNSnoozeCategory, "snoozeCategoryForEventWithStartDate:endDate:now:isAllDay:", v27, v28, v31, v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "suffix");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v26, "stringByAppendingString:", v33);
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "expirationDateForEventWithStartDate:endDate:isAllDay:", v27, v28, v29);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "leeway");
    v36 = v35;

    v20 = (__CFString *)v27;
    v8 = v71;
    v22 = v76;
    v21 = (uint64_t)v77;
    v23 = v75;
LABEL_32:

    goto LABEL_33;
  }
  v37 = v24 == 0;
  if (v24 && !v21 && !v23 && !v82)
  {
    v38 = kCALNTriggeredEventNotificationCategoryIdentifier_Directions;
LABEL_31:
    v34 = *v38;
    v84 = 0;
    v36 = 0.0;
    goto LABEL_32;
  }
  v39 = v23 == 0;
  if (v23 && !v21 && !v24 && !v82)
  {
    v38 = kCALNTriggeredEventNotificationCategoryIdentifier_ConferenceCall;
    goto LABEL_31;
  }
  v40 = v82 == 0;
  if (v82 && !v21 && !v24 && !v23)
  {
    v38 = kCALNTriggeredEventNotificationCategoryIdentifier_MailOrganizer;
    goto LABEL_31;
  }
  if (v21 != 0 && v24 != 0 && !v23 && !v82)
  {
    v25 = kCALNTriggeredEventNotificationCategoryIdentifier_Directions_Snooze;
    goto LABEL_14;
  }
  if (v21 != 0 && v23 != 0 && !v24 && !v82)
  {
    v25 = kCALNTriggeredEventNotificationCategoryIdentifier_ConferenceCall_Snooze;
    goto LABEL_14;
  }
  if (v21 != 0 && v82 != 0 && !v24 && !v23)
  {
    v25 = kCALNTriggeredEventNotificationCategoryIdentifier_MailOrganizer_Snooze;
    goto LABEL_14;
  }
  v68 = v39 || v37;
  if (v23 != 0 && v24 != 0 && !v21 && !v82)
  {
    v38 = kCALNTriggeredEventNotificationCategoryIdentifier_Directions_ConferenceCall;
    goto LABEL_31;
  }
  v69 = v37 || v40;
  if (!v69 && !v21 && !v23)
  {
    v38 = kCALNTriggeredEventNotificationCategoryIdentifier_Directions_MailOrganizer;
    goto LABEL_31;
  }
  v70 = v39 || v40;
  if (!v70 && !v21 && !v24)
  {
    v38 = kCALNTriggeredEventNotificationCategoryIdentifier_ConferenceCall_MailOrganizer;
    goto LABEL_31;
  }
  if (!(v68 & 1 | (v21 == 0)) && !v82)
  {
    v25 = kCALNTriggeredEventNotificationCategoryIdentifier_Directions_ConferenceCall_Snooze;
    goto LABEL_14;
  }
  if (!(v68 & 1 | (v82 == 0)) && !v21)
  {
    v38 = kCALNTriggeredEventNotificationCategoryIdentifier_Directions_ConferenceCall_MailOrganizer;
    goto LABEL_31;
  }
  if (!v69 && v21 != 0 && !v23)
  {
    v25 = kCALNTriggeredEventNotificationCategoryIdentifier_Directions_MailOrganizer_Snooze;
    goto LABEL_14;
  }
  if (!v70 && v21 != 0 && !v24)
  {
    v25 = kCALNTriggeredEventNotificationCategoryIdentifier_ConferenceCall_MailOrganizer_Snooze;
    goto LABEL_14;
  }
  v71 = v8;
  if ((v68 | (v21 == 0) | v40) != 1)
  {
    v25 = kCALNTriggeredEventNotificationCategoryIdentifier_Directions_ConferenceCall_MailOrganizer_Snooze;
    goto LABEL_14;
  }
  if (v21)
  {
    v26 = v20;
    goto LABEL_15;
  }
  v84 = 0;
  v36 = 0.0;
  v34 = v20;
LABEL_33:
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544898;
    v86 = v34;
    v87 = 1024;
    v88 = v21 != 0;
    v89 = 1024;
    v90 = v72 != 0;
    v91 = 1024;
    v92 = v23 != 0;
    v93 = 1024;
    v94 = v82 != 0;
    v95 = 2112;
    v96 = v8;
    v97 = 2114;
    v98 = v84;
    _os_log_impl(&dword_215D9B000, v41, OS_LOG_TYPE_DEFAULT, "Category identifier for content = %{public}@, should include snooze action = (%{BOOL}d), should include directions action = (%{BOOL}d), should include conference call action = (%{BOOL}d), should include mail organizer action = (%{BOOL}d), source client identifier = %@, snoozeCategoryExpirationDate = %{public}@", buf, 0x38u);
  }
  v83 = v34;

  v42 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v9, "eventID");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
    objc_msgSend(v42, "setObject:forKeyedSubscript:", v43, CFSTR("entityID"));
  v73 = (void *)v43;
  if (v21)
    objc_msgSend(v42, "setObject:forKeyedSubscript:", v21, CFSTR("AlarmID"));
  if (v22)
  {
    objc_msgSend(v22, "absoluteString");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setObject:forKeyedSubscript:", v44, CFSTR("MapItemURL"));

  }
  if (v23)
  {
    objc_msgSend(v23, "absoluteString");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setObject:forKeyedSubscript:", v45, CFSTR("ConferenceURL"));

  }
  objc_msgSend(v9, "mailtoURL");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    objc_msgSend(v9, "mailtoURL");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "absoluteString");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setObject:forKeyedSubscript:", v48, CFSTR("mailto"));

  }
  if (v84)
  {
    objc_msgSend(v42, "setObject:forKeyedSubscript:", v84, CFSTR("snoozeCategoryExpirationDate"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v36);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setObject:forKeyedSubscript:", v49, CFSTR("snoozeCategoryExpirationLeeway"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v9, "isAllDay"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setObject:forKeyedSubscript:", v50, CFSTR("allDay"));

  objc_msgSend(v9, "endDate");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setObject:forKeyedSubscript:", v51, CFSTR("endDate"));

  buf[0] = 0;
  -[CALNTriggeredEventNotificationSource bodyDescriptionProvider](self, "bodyDescriptionProvider");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "bodyForSourceClientIdentifier:sourceNotificationInfo:bodyContainsTravelAdvice:", v8, v9, buf);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = objc_alloc_init(CALNMutableNotificationContent);
  -[CALNMutableNotificationContent setTitle:](v54, "setTitle:", v81);
  -[CALNMutableNotificationContent setBody:](v54, "setBody:", v53);
  -[CALNMutableNotificationContent setCategoryIdentifier:](v54, "setCategoryIdentifier:", v83);
  -[CALNMutableNotificationContent setSectionIdentifier:](v54, "setSectionIdentifier:", CFSTR("com.apple.mobilecal.bulletin-subsection.upcomingEvents"));
  objc_msgSend(v9, "startDate");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNMutableNotificationContent setDate:](v54, "setDate:", v55);

  -[CALNMutableNotificationContent setExpirationDate:](v54, "setExpirationDate:", v80);
  objc_msgSend(v9, "launchURL");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNMutableNotificationContent setDefaultActionURL:](v54, "setDefaultActionURL:", v56);

  -[CALNMutableNotificationContent setIconIdentifier:](v54, "setIconIdentifier:", v78);
  -[CALNMutableNotificationContent setShouldHideTime:](v54, "setShouldHideTime:", objc_msgSend(v9, "isAllDay"));
  -[CALNMutableNotificationContent setShouldSuppressSyncDismissalWhenRemoved:](v54, "setShouldSuppressSyncDismissalWhenRemoved:", 0);
  -[CALNMutableNotificationContent setSound:](v54, "setSound:", v79);
  -[CALNMutableNotificationContent setThreadIdentifier:](v54, "setThreadIdentifier:", CFSTR("upcomingEventsThread"));
  -[CALNMutableNotificationContent setUserInfo:](v54, "setUserInfo:", v42);
  if (objc_msgSend(v9, "isTimeSensitive"))
    v57 = 2;
  else
    v57 = 1;
  -[CALNMutableNotificationContent setInterruptionLevel:](v54, "setInterruptionLevel:", v57);
  objc_msgSend(v9, "calendarIdentifier");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNMutableNotificationContent setFilterCriteria:](v54, "setFilterCriteria:", v58);

  v59 = v8;
  if (buf[0])
    v60 = v53;
  else
    v60 = 0;
  v61 = self;
  -[CALNTriggeredEventNotificationSource _eventRepresentationDictionaryWithSourceNotificationInfo:hypothesisMessage:](self, "_eventRepresentationDictionaryWithSourceNotificationInfo:hypothesisMessage:", v9, v60);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (v62)
    +[CALNEventRepresentationSourceUtils setEventRepresentationDictionary:onNotificationContent:](CALNEventRepresentationSourceUtils, "setEventRepresentationDictionary:onNotificationContent:", v62, v54);
  objc_msgSend(v9, "legacyIdentifier");
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (v63)
  {
    objc_msgSend(v9, "legacyIdentifier");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    +[CALNLegacyIdentifierUtils setLegacyIdentifier:onNotificationContent:](CALNLegacyIdentifierUtils, "setLegacyIdentifier:onNotificationContent:", v64, v54);

  }
  -[CALNTriggeredEventNotificationSource _notificationResponseDataForSourceNotificationInfo:](v61, "_notificationResponseDataForSourceNotificationInfo:", v9);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSource _setNotificationResponseData:onNotificationContent:](v61, "_setNotificationResponseData:onNotificationContent:", v65, v54);
  v66 = (void *)-[CALNMutableNotificationContent copy](v54, "copy");

  return v66;
}

- (void)willPostNotification:(id)a3
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
  objc_msgSend(v4, "sourceClientIdentifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AlarmID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("snoozeCategoryExpirationDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("snoozeCategoryExpirationLeeway"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[CALNTriggeredEventNotificationSource snoozeUpdateTimer](self, "snoozeUpdateTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFireDate:leeway:forEventWithIdentifier:", v8, v11, (double)objc_msgSend(v9, "integerValue"));

  }
}

- (void)refreshNotifications:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__CALNTriggeredEventNotificationSource_refreshNotifications___block_invoke;
  block[3] = &unk_24D484760;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __61__CALNTriggeredEventNotificationSource_refreshNotifications___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refreshNotifications:", *(_QWORD *)(a1 + 40));
}

- (void)didReceiveResponse:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__CALNTriggeredEventNotificationSource_didReceiveResponse___block_invoke;
  block[3] = &unk_24D484760;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __59__CALNTriggeredEventNotificationSource_didReceiveResponse___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveResponse:", *(_QWORD *)(a1 + 40));
}

- (void)_didReceiveResponse:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
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
  _QWORD v21[10];
  _QWORD v22[10];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "actionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sourceClientIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v24 = v6;
    v25 = 2114;
    v26 = v8;
    _os_log_impl(&dword_215D9B000, v9, OS_LOG_TYPE_DEFAULT, "Received notification response with action identifier = %{public}@, source client identifier = %{public}@", buf, 0x16u);
  }

  v10 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.CALNNotificationDefaultActionIdentifier"));
  if ((v10 & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.CALNNotificationDismissActionIdentifier")))
  {
    objc_msgSend(v4, "notificationRecord");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "content");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("IsLocation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v14, "BOOLValue");

    -[CALNTriggeredEventNotificationSource dataSource](self, "dataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "acknowledgeEventWithSourceClientIdentifier:shouldMarkAsHavingReceivedLocation:", v8, v10 & v12);

  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("CALNNotificationDirectionsAction")))
  {
    -[CALNTriggeredEventNotificationSource _handleDirectionsActionWithResponse:](self, "_handleDirectionsActionWithResponse:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("CALNNotificationConferenceCallAction")))
  {
    -[CALNTriggeredEventNotificationSource _handleConferenceCallActionWithResponse:](self, "_handleConferenceCallActionWithResponse:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("Mail_identifier")))
  {
    -[CALNTriggeredEventNotificationSource _handleMailOrganizerActionWithResponse:](self, "_handleMailOrganizerActionWithResponse:", v4);
  }
  else
  {
    v21[0] = CFSTR("CALNTriggeredEventNotificationSnoozeActionIdentifier");
    v21[1] = CFSTR("CALNTriggeredEventNotificationSnooze5MinutesActionIdentifier");
    v22[0] = &unk_24D49BF08;
    v22[1] = &unk_24D49BF20;
    v21[2] = CFSTR("CALNTriggeredEventNotificationSnooze15MinutesActionIdentifier");
    v21[3] = CFSTR("CALNTriggeredEventNotificationSnooze30MinutesActionIdentifier");
    v22[2] = &unk_24D49BF38;
    v22[3] = &unk_24D49BF50;
    v21[4] = CFSTR("CALNTriggeredEventNotificationSnooze1HourActionIdentifier");
    v21[5] = CFSTR("CALNTriggeredEventNotificationSnoozeUntil30MinutesBeforeActionIdentifier");
    v22[4] = &unk_24D49BF68;
    v22[5] = &unk_24D49BF80;
    v21[6] = CFSTR("CALNTriggeredEventNotificationSnoozeUntil15MinutesBeforeActionIdentifier");
    v21[7] = CFSTR("CALNTriggeredEventNotificationSnoozeUntil5MinutesBeforeActionIdentifier");
    v22[6] = &unk_24D49BF98;
    v22[7] = &unk_24D49BFB0;
    v21[8] = CFSTR("CALNTriggeredEventNotificationSnoozeUntilStartActionIdentifier");
    v21[9] = CFSTR("CALNTriggeredEventNotificationSnoozeUntilEndActionIdentifier");
    v22[8] = &unk_24D49BFC8;
    v22[9] = &unk_24D49BFE0;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[CALNTriggeredEventNotificationSource dataSource](self, "dataSource");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "snoozeEventWithSourceClientIdentifier:snoozeType:", v8, objc_msgSend(v19, "unsignedIntegerValue"));

    }
  }
  if (-[CALNTriggeredEventNotificationSource _shouldCeaseRouteMonitoringEventForSourceClientIdentifier:](self, "_shouldCeaseRouteMonitoringEventForSourceClientIdentifier:", v8))
  {
    -[CALNTriggeredEventNotificationSource dataSource](self, "dataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ceaseRouteMonitoringEventForSourceClientIdentifier:", v8);

    -[CALNTriggeredEventNotificationSource _clearTravelAdvisoryFromNotificationMetaDataForSourceClientIdentifier:](self, "_clearTravelAdvisoryFromNotificationMetaDataForSourceClientIdentifier:", v8);
    -[CALNTriggeredEventNotificationSource dataSource](self, "dataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeTimeToLeaveRefreshTimerForSourceClientIdentifier:", v8);

  }
}

- (NSString)sourceIdentifier
{
  return (NSString *)CFSTR("com.apple.calendar.notifications.TimeTriggeredEvent");
}

- (NSArray)categories
{
  if (categories_onceToken_4 != -1)
    dispatch_once(&categories_onceToken_4, &__block_literal_global_16);
  return (NSArray *)(id)categories_categories_4;
}

void __50__CALNTriggeredEventNotificationSource_categories__block_invoke()
{
  void *v0;
  void *v1;
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
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  id v65;
  _QWORD v66[4];
  _QWORD v67[3];
  _QWORD v68[3];
  _QWORD v69[3];
  _QWORD v70[3];
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[2];
  _QWORD v76[2];
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  _QWORD v81[16];
  _QWORD v82[16];
  _QWORD v83[3];

  v83[1] = *MEMORY[0x24BDAC8D0];
  +[CALNBundle bundle](CALNBundle, "bundle");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "localizedStringForKey:value:table:", CFSTR("notification.hiddenPreviewsBodyPlaceholder.upcomingEvent"), CFSTR("Upcoming Event"), 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "localizedStringForKey:value:table:", CFSTR("%u more upcoming events"), &stru_24D4856D0, 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNTriggeredEventNotificationActionUtilities snoozeAction](CALNTriggeredEventNotificationActionUtilities, "snoozeAction");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v83, 1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v82[0] = v59;
  v81[0] = CFSTR("com.apple.calendar.notifications.TriggeredEvent");
  v81[1] = CFSTR("com.apple.calendar.notifications.TriggeredEvent.Snooze");
  +[CALNTriggeredEventNotificationActionUtilities snoozeAction](CALNTriggeredEventNotificationActionUtilities, "snoozeAction");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v56;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v80, 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = v55;
  v81[2] = CFSTR("com.apple.calendar.notifications.TriggeredEvent.Directions");
  +[CALNTriggeredEventNotificationActionUtilities directionsAction](CALNTriggeredEventNotificationActionUtilities, "directionsAction");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v54;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v79, 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v82[2] = v53;
  v81[3] = CFSTR("com.apple.calendar.notifications.TriggeredEvent.ConferenceCall");
  +[CALNTriggeredEventNotificationActionUtilities conferenceCallAction](CALNTriggeredEventNotificationActionUtilities, "conferenceCallAction");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v52;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v78, 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v82[3] = v51;
  v81[4] = CFSTR("com.apple.calendar.notifications.TriggeredEvent.MailOrganizer");
  +[CALNTriggeredEventNotificationActionUtilities mailOrganizerAction](CALNTriggeredEventNotificationActionUtilities, "mailOrganizerAction");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v50;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v77, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v82[4] = v49;
  v81[5] = CFSTR("com.apple.calendar.notifications.TriggeredEvent.Directions.Snooze");
  +[CALNTriggeredEventNotificationActionUtilities directionsAction](CALNTriggeredEventNotificationActionUtilities, "directionsAction");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v48;
  +[CALNTriggeredEventNotificationActionUtilities snoozeAction](CALNTriggeredEventNotificationActionUtilities, "snoozeAction");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v76[1] = v47;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v76, 2);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v82[5] = v46;
  v81[6] = CFSTR("com.apple.calendar.notifications.TriggeredEvent.ConferenceCall.Snooze");
  +[CALNTriggeredEventNotificationActionUtilities conferenceCallAction](CALNTriggeredEventNotificationActionUtilities, "conferenceCallAction");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = v45;
  +[CALNTriggeredEventNotificationActionUtilities snoozeAction](CALNTriggeredEventNotificationActionUtilities, "snoozeAction");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v75[1] = v44;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v75, 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v82[6] = v43;
  v81[7] = CFSTR("com.apple.calendar.notifications.TriggeredEvent.MailOrganizer.Snooze");
  +[CALNTriggeredEventNotificationActionUtilities mailOrganizerAction](CALNTriggeredEventNotificationActionUtilities, "mailOrganizerAction");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v42;
  +[CALNTriggeredEventNotificationActionUtilities snoozeAction](CALNTriggeredEventNotificationActionUtilities, "snoozeAction");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v74[1] = v41;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v74, 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v82[7] = v40;
  v81[8] = CFSTR("com.apple.calendar.notifications.TriggeredEvent.Directions.ConferenceCall");
  +[CALNTriggeredEventNotificationActionUtilities directionsAction](CALNTriggeredEventNotificationActionUtilities, "directionsAction");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v39;
  +[CALNTriggeredEventNotificationActionUtilities conferenceCallAction](CALNTriggeredEventNotificationActionUtilities, "conferenceCallAction");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v73[1] = v38;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v73, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v82[8] = v37;
  v81[9] = CFSTR("com.apple.calendar.notifications.TriggeredEvent.Directions.MailOrganizer");
  +[CALNTriggeredEventNotificationActionUtilities directionsAction](CALNTriggeredEventNotificationActionUtilities, "directionsAction");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v36;
  +[CALNTriggeredEventNotificationActionUtilities mailOrganizerAction](CALNTriggeredEventNotificationActionUtilities, "mailOrganizerAction");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = v35;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v72, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v82[9] = v34;
  v81[10] = CFSTR("com.apple.calendar.notifications.TriggeredEvent.ConferenceCall.MailOrganizer");
  +[CALNTriggeredEventNotificationActionUtilities conferenceCallAction](CALNTriggeredEventNotificationActionUtilities, "conferenceCallAction");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v33;
  +[CALNTriggeredEventNotificationActionUtilities mailOrganizerAction](CALNTriggeredEventNotificationActionUtilities, "mailOrganizerAction");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v71[1] = v32;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v71, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v82[10] = v31;
  v81[11] = CFSTR("com.apple.calendar.notifications.TriggeredEvent.Directions.ConferenceCall.Snooze");
  +[CALNTriggeredEventNotificationActionUtilities directionsAction](CALNTriggeredEventNotificationActionUtilities, "directionsAction");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v30;
  +[CALNTriggeredEventNotificationActionUtilities conferenceCallAction](CALNTriggeredEventNotificationActionUtilities, "conferenceCallAction");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v70[1] = v29;
  +[CALNTriggeredEventNotificationActionUtilities snoozeAction](CALNTriggeredEventNotificationActionUtilities, "snoozeAction");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v70[2] = v28;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v70, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v82[11] = v27;
  v81[12] = CFSTR("com.apple.calendar.notifications.TriggeredEvent.Directions.ConferenceCall.MailOrganizer");
  +[CALNTriggeredEventNotificationActionUtilities directionsAction](CALNTriggeredEventNotificationActionUtilities, "directionsAction");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v26;
  +[CALNTriggeredEventNotificationActionUtilities conferenceCallAction](CALNTriggeredEventNotificationActionUtilities, "conferenceCallAction");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v69[1] = v25;
  +[CALNTriggeredEventNotificationActionUtilities mailOrganizerAction](CALNTriggeredEventNotificationActionUtilities, "mailOrganizerAction");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v69[2] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v69, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v82[12] = v22;
  v81[13] = CFSTR("com.apple.calendar.notifications.TriggeredEvent.Directions.MailOrganizer.Snooze");
  +[CALNTriggeredEventNotificationActionUtilities directionsAction](CALNTriggeredEventNotificationActionUtilities, "directionsAction");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v21;
  +[CALNTriggeredEventNotificationActionUtilities mailOrganizerAction](CALNTriggeredEventNotificationActionUtilities, "mailOrganizerAction");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v68[1] = v20;
  +[CALNTriggeredEventNotificationActionUtilities snoozeAction](CALNTriggeredEventNotificationActionUtilities, "snoozeAction");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v68[2] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v68, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v82[13] = v1;
  v81[14] = CFSTR("com.apple.calendar.notifications.TriggeredEvent.ConferenceCall.MailOrganizer.Snooze");
  +[CALNTriggeredEventNotificationActionUtilities conferenceCallAction](CALNTriggeredEventNotificationActionUtilities, "conferenceCallAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v2;
  +[CALNTriggeredEventNotificationActionUtilities mailOrganizerAction](CALNTriggeredEventNotificationActionUtilities, "mailOrganizerAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = v3;
  +[CALNTriggeredEventNotificationActionUtilities snoozeAction](CALNTriggeredEventNotificationActionUtilities, "snoozeAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v67[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v67, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v82[14] = v5;
  v81[15] = CFSTR("com.apple.calendar.notifications.TriggeredEvent.Directions.ConferenceCall.MailOrganizer.Snooze");
  +[CALNTriggeredEventNotificationActionUtilities directionsAction](CALNTriggeredEventNotificationActionUtilities, "directionsAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v6;
  +[CALNTriggeredEventNotificationActionUtilities conferenceCallAction](CALNTriggeredEventNotificationActionUtilities, "conferenceCallAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v7;
  +[CALNTriggeredEventNotificationActionUtilities mailOrganizerAction](CALNTriggeredEventNotificationActionUtilities, "mailOrganizerAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v66[2] = v8;
  +[CALNTriggeredEventNotificationActionUtilities snoozeAction](CALNTriggeredEventNotificationActionUtilities, "snoozeAction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v66[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v66, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v82[15] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v82, v81, 16);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v24, "count"));
  +[CALNSnoozeCategory snoozeCategories](CALNSnoozeCategory, "snoozeCategories");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = MEMORY[0x24BDAC760];
  v61[1] = 3221225472;
  v61[2] = __50__CALNTriggeredEventNotificationSource_categories__block_invoke_2;
  v61[3] = &unk_24D484F80;
  v62 = v12;
  v63 = v58;
  v64 = v57;
  v65 = v11;
  v13 = v11;
  v14 = v57;
  v15 = v58;
  v16 = v12;
  objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v61);
  v17 = objc_msgSend(v13, "copy");
  v18 = (void *)categories_categories_4;
  categories_categories_4 = v17;

}

void __50__CALNTriggeredEventNotificationSource_categories__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[CALNTriggeredEventNotificationActionUtilities snoozeAction](CALNTriggeredEventNotificationActionUtilities, "snoozeAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    obj = *(id *)(a1 + 32);
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v13, "actions");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "suffix");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "stringByAppendingString:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          +[CALNNotificationCategory categoryWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:categorySummaryFormat:](CALNNotificationCategory, "categoryWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:categorySummaryFormat:", v17, v15, *(_QWORD *)(a1 + 40), 2, *(_QWORD *)(a1 + 48));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v18);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v10);
    }

  }
  else
  {
    +[CALNNotificationCategory categoryWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:categorySummaryFormat:](CALNNotificationCategory, "categoryWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:categorySummaryFormat:", v5, v6, *(_QWORD *)(a1 + 40), 2, *(_QWORD *)(a1 + 48));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v19);

  }
}

- (void)dataSource:(id)a3 triggeredWithSourceClientIdentifier:(id)a4 triggerData:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __99__CALNTriggeredEventNotificationSource_dataSource_triggeredWithSourceClientIdentifier_triggerData___block_invoke;
  block[3] = &unk_24D484800;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_sync(v9, block);

}

uint64_t __99__CALNTriggeredEventNotificationSource_dataSource_triggeredWithSourceClientIdentifier_triggerData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_triggeredWithSourceClientIdentifier:triggerData:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)dataSource:(id)a3 travelAdvisoryAuthorizationChanged:(BOOL)a4
{
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __86__CALNTriggeredEventNotificationSource_dataSource_travelAdvisoryAuthorizationChanged___block_invoke;
  v7[3] = &unk_24D484FA8;
  v7[4] = self;
  v8 = a4;
  dispatch_sync(v6, v7);

}

uint64_t __86__CALNTriggeredEventNotificationSource_dataSource_travelAdvisoryAuthorizationChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_travelAdvisoryAuthorizationChanged:", *(unsigned __int8 *)(a1 + 40));
}

- (void)dataSource:(id)a3 travelEngineEventSignificantlyChangedWithSourceClientIdentifier:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v5 = a4;
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __115__CALNTriggeredEventNotificationSource_dataSource_travelEngineEventSignificantlyChangedWithSourceClientIdentifier___block_invoke;
  block[3] = &unk_24D484760;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_sync(v6, block);

}

uint64_t __115__CALNTriggeredEventNotificationSource_dataSource_travelEngineEventSignificantlyChangedWithSourceClientIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_travelEngineEventSignificantlyChangedWithSourceClientIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)snoozeTimerFiredForEvents:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__CALNTriggeredEventNotificationSource_snoozeTimerFiredForEvents___block_invoke;
  block[3] = &unk_24D484760;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __66__CALNTriggeredEventNotificationSource_snoozeTimerFiredForEvents___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSnoozeOptionsForEvents:", *(_QWORD *)(a1 + 40));
}

- (void)_triggeredWithSourceClientIdentifier:(id)a3 triggerData:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL8 v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  CALNNotificationRecord *v48;
  void *v49;
  CALNNotificationRecord *v50;
  CALNNotificationRecord *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  CALNNotificationRecord *v56;
  void *v57;
  void *v58;
  id v59;
  NSObject *v60;
  void *v61;
  id v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint8_t buf[4];
  uint64_t v80;
  __int16 v81;
  id v82;
  __int16 v83;
  void *v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v80 = (uint64_t)v6;
    v81 = 2114;
    v82 = v7;
    _os_log_impl(&dword_215D9B000, v9, OS_LOG_TYPE_DEFAULT, "Triggered with source client identifier = %{public}@, trigger data = %{public}@", buf, 0x16u);
  }

  -[CALNTriggeredEventNotificationSource dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSource notificationManager](self, "notificationManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchTriggeredEventNotificationInfoWithSourceClientIdentifier:isProtectedDataAvailable:", v6, objc_msgSend(v11, "isProtectedDataAvailable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CALNTriggeredEventNotificationSource notificationManager](self, "notificationManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNTriggeredEventNotificationSource sourceIdentifier](self, "sourceIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fetchRecordsWithSourceIdentifier:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v80 = (uint64_t)v15;
      _os_log_impl(&dword_215D9B000, v16, OS_LOG_TYPE_INFO, "Existing records = %@.", buf, 0xCu);
    }

    -[CALNTriggeredEventNotificationSource _existingRecordMatchingEventForSourceClientIdentifier:existingRecords:](self, "_existingRecordMatchingEventForSourceClientIdentifier:existingRecords:", v6, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v17, "sourceClientIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v80 = (uint64_t)v6;
      v81 = 2114;
      v82 = v19;
      v83 = 2112;
      v84 = v17;
      _os_log_impl(&dword_215D9B000, v18, OS_LOG_TYPE_INFO, "Existing record matching event for source client identifier = %{public}@, existing record source client identifier = %{public}@, existing record = %@", buf, 0x20u);

    }
    -[CALNTriggeredEventNotificationSource _existingNotificationDataMatchingEventForSourceClientIdentifier:](self, "_existingNotificationDataMatchingEventForSourceClientIdentifier:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v80 = (uint64_t)v6;
      v81 = 2112;
      v82 = v20;
      _os_log_impl(&dword_215D9B000, v21, OS_LOG_TYPE_DEFAULT, "Existing notification data for source client identifier = %{public}@, existing notification data = %@", buf, 0x16u);
    }

    -[CALNTriggeredEventNotificationSource dateProvider](self, "dateProvider");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "now");
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v7, "trigger");
    objc_msgSend(v7, "hypothesis");
    v24 = objc_claimAutoreleasedReturnValue();
    v26 = v23 == 1 && v24 == 0;
    LOBYTE(v67) = 0;
    v76 = (void *)v24;
    -[CALNTriggeredEventNotificationSource _sourceNotificationInfoForSourceClientIdentifier:notificationInfo:existingNotificationData:hypothesis:shouldClearHypothesis:isOffsetFromTravelTimeStart:isForContentCreation:](self, "_sourceNotificationInfoForSourceClientIdentifier:notificationInfo:existingNotificationData:hypothesis:shouldClearHypothesis:isOffsetFromTravelTimeStart:isForContentCreation:", v6, v12, v20, v24, v26, objc_msgSend(v7, "isOffsetFromTravelTimeStart"), v67);
    v27 = objc_claimAutoreleasedReturnValue();
    -[CALNTriggeredEventNotificationSource triggerHelper](self, "triggerHelper");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = (void *)v27;
    v29 = objc_msgSend(v28, "shouldTriggerForSourceClientIdentifier:trigger:sourceNotificationInfo:oldNotificationData:", v6, v23, v27, v20);

    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v29);
      v74 = v20;
      v31 = v17;
      v32 = v7;
      v33 = v15;
      v34 = v12;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v80 = (uint64_t)v35;
      v81 = 2114;
      v82 = v6;
      _os_log_impl(&dword_215D9B000, v30, OS_LOG_TYPE_DEFAULT, "Determined that notification should trigger = %{public}@. source client identifier = %{public}@", buf, 0x16u);

      v12 = v34;
      v15 = v33;
      v7 = v32;
      v17 = v31;
      v20 = v74;
    }

    if ((v29 & 1) != 0)
    {
      v73 = v17;
      -[CALNTriggeredEventNotificationSource _updatedSourceNotificationInfoForContentCreation:](self, "_updatedSourceNotificationInfoForContentCreation:", v78);
      v36 = objc_claimAutoreleasedReturnValue();
      -[CALNTriggeredEventNotificationSource notificationManager](self, "notificationManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = (void *)v36;
      -[CALNTriggeredEventNotificationSource contentForSourceClientIdentifier:sourceNotificationInfo:isProtectedDataAvailable:](self, "contentForSourceClientIdentifier:sourceNotificationInfo:isProtectedDataAvailable:", v6, v36, objc_msgSend(v37, "isProtectedDataAvailable"));
      v38 = objc_claimAutoreleasedReturnValue();

      v75 = (void *)v38;
      if (v38)
      {
        -[CALNTriggeredEventNotificationSource transitionProvider](self, "transitionProvider");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "transitionForSourceClientIdentifier:sourceNotificationInfo:oldNotificationData:trigger:", v6, v78, v20, v23);

        +[CALNTriggeredEventNotificationTransitionUtilities descriptionForTransition:](CALNTriggeredEventNotificationTransitionUtilities, "descriptionForTransition:", v40);
        v71 = objc_claimAutoreleasedReturnValue();
        +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v80 = v71;
          v81 = 2114;
          v82 = v6;
          _os_log_impl(&dword_215D9B000, v41, OS_LOG_TYPE_DEFAULT, "Transition = %{public}@, source client identifier = %{public}@", buf, 0x16u);
        }

        v17 = v73;
        switch(v40)
        {
          case 0:
            +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              -[CALNTriggeredEventNotificationSource _triggeredWithSourceClientIdentifier:triggerData:].cold.3();
            goto LABEL_39;
          case 1:
            v70 = v12;
            objc_msgSend(v73, "sourceClientIdentifier");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[CALNTriggeredEventNotificationSource _resolvedSourceClientIdentifierForNewSourceClientIdentifier:oldSourceClientIdentifier:](self, "_resolvedSourceClientIdentifierForNewSourceClientIdentifier:oldSourceClientIdentifier:", v6, v47);
            v42 = objc_claimAutoreleasedReturnValue();

            v48 = [CALNNotificationRecord alloc];
            -[CALNTriggeredEventNotificationSource sourceIdentifier](self, "sourceIdentifier");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = -[CALNNotificationRecord initWithSourceIdentifier:sourceClientIdentifier:content:](v48, "initWithSourceIdentifier:sourceClientIdentifier:content:", v49, v42, v75);

            v51 = v50;
            -[CALNNotificationRecord sourceClientIdentifier](v50, "sourceClientIdentifier");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[CALNTriggeredEventNotificationSource _existingRecordMatchingEventForSourceClientIdentifier:existingRecords:](self, "_existingRecordMatchingEventForSourceClientIdentifier:existingRecords:", v52, v15);
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            if (v53)
            {
              objc_msgSend(v53, "sourceClientIdentifier");
              v54 = objc_claimAutoreleasedReturnValue();
              if (v54)
              {
                v55 = (void *)v54;
                -[CALNTriggeredEventNotificationSource notificationManager](self, "notificationManager");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                -[CALNTriggeredEventNotificationSource sourceIdentifier](self, "sourceIdentifier");
                v68 = v53;
                v56 = v51;
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v69, "removeRecordWithSourceIdentifier:sourceClientIdentifier:", v57, v55);

                v51 = v56;
                v53 = v68;

              }
            }
            -[CALNTriggeredEventNotificationSource _addRecord:sourceNotificationInfo:existingNotificationData:trigger:transition:now:](self, "_addRecord:sourceNotificationInfo:existingNotificationData:trigger:transition:now:", v51, v78, v20, objc_msgSend(v7, "trigger"), 1, v77);

            v12 = v70;
            v17 = v73;
            goto LABEL_39;
          case 2:
            if (v73)
            {
              v42 = objc_msgSend(v73, "mutableCopy");
              -[NSObject setContent:](v42, "setContent:", v75);
              -[CALNTriggeredEventNotificationSource notificationManager](self, "notificationManager");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v59 = v7;
              v60 = v15;
              v61 = v12;
              v62 = -[NSObject copy](v42, "copy");
              objc_msgSend(v58, "updateRecord:", v62);

              v12 = v61;
              v15 = v60;
              v7 = v59;
              v17 = v73;
LABEL_38:

            }
            else
            {
              +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v80 = (uint64_t)v6;
                _os_log_impl(&dword_215D9B000, v42, OS_LOG_TYPE_DEFAULT, "No existing delivered notification to perform replace transition, source client identifier = %{public}@", buf, 0xCu);
              }
            }
LABEL_39:

LABEL_40:
            if (-[CALNTriggeredEventNotificationSource _shouldUpdateStoredNotificationDataGivenTransition:](self, "_shouldUpdateStoredNotificationDataGivenTransition:", v40))
            {
              -[CALNTriggeredEventNotificationSource _updateStoredNotificationDataForSourceClientIdentifier:sourceNotificationInfo:existingNotificationData:transition:now:](self, "_updateStoredNotificationDataForSourceClientIdentifier:sourceNotificationInfo:existingNotificationData:transition:now:", v6, v78, v20, v40, v77);
            }
            objc_msgSend(v78, "hypothesis");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = objc_msgSend(v78, "allowsLocationAlerts");
            v65 = objc_msgSend(v78, "travelAdvisoryDisabled");
            v66 = v64;
            v43 = v78;
            -[CALNTriggeredEventNotificationSource _updateTimeToLeaveRefreshTimerForSourceClientIdentifier:hypothesis:allowsLocationAlerts:travelAdvisoryDisabled:](self, "_updateTimeToLeaveRefreshTimerForSourceClientIdentifier:hypothesis:allowsLocationAlerts:travelAdvisoryDisabled:", v6, v63, v66, v65);

            v45 = v76;
            v46 = v71;
            v44 = v72;
            break;
          case 3:
            -[CALNTriggeredEventNotificationSource notificationManager](self, "notificationManager");
            v42 = objc_claimAutoreleasedReturnValue();
            -[CALNTriggeredEventNotificationSource sourceIdentifier](self, "sourceIdentifier");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject removeRecordWithSourceIdentifier:sourceClientIdentifier:](v42, "removeRecordWithSourceIdentifier:sourceClientIdentifier:", v58, v6);
            goto LABEL_38;
          default:
            goto LABEL_40;
        }
      }
      else
      {
        +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v43 = v78;
          -[CALNTriggeredEventNotificationSource _triggeredWithSourceClientIdentifier:triggerData:].cold.2();
          v45 = v76;
        }
        else
        {
          v45 = v76;
          v43 = v78;
        }
        v44 = v72;
        v17 = v73;
      }

    }
    else
    {
      v43 = v78;
      objc_msgSend(v78, "hypothesis");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[CALNTriggeredEventNotificationSource _updateTimeToLeaveRefreshTimerForSourceClientIdentifier:hypothesis:allowsLocationAlerts:travelAdvisoryDisabled:](self, "_updateTimeToLeaveRefreshTimerForSourceClientIdentifier:hypothesis:allowsLocationAlerts:travelAdvisoryDisabled:", v6, v44, objc_msgSend(v78, "allowsLocationAlerts"), objc_msgSend(v78, "travelAdvisoryDisabled"));
      v45 = v76;
    }

  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CALNTriggeredEventNotificationSource _triggeredWithSourceClientIdentifier:triggerData:].cold.1();
  }

}

- (void)_travelEngineEventSignificantlyChangedWithSourceClientIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v4;
    _os_log_impl(&dword_215D9B000, v6, OS_LOG_TYPE_DEFAULT, "Travel engine event changed significantly. Will reset 'Time to Leave' display state for existing record if it exists. source client identifier = %{public}@", (uint8_t *)&v9, 0xCu);
  }

  -[CALNTriggeredEventNotificationSource _existingRecordMatchingEventForSourceClientIdentifier:](self, "_existingRecordMatchingEventForSourceClientIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[CALNTriggeredEventNotificationSource _resetStoredNotificationDataTimeToLeaveDisplayStateForSourceClientIdentifier:](self, "_resetStoredNotificationDataTimeToLeaveDisplayStateForSourceClientIdentifier:", v4);
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CALNTriggeredEventNotificationSource _travelEngineEventSignificantlyChangedWithSourceClientIdentifier:].cold.1();

  }
}

- (void)_travelAdvisoryAuthorizationChanged:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_215D9B000, v6, OS_LOG_TYPE_DEFAULT, "Travel advisory authorization changed. authorized = %{public}@", (uint8_t *)&v8, 0xCu);

  }
  if (!v3)
    -[CALNTriggeredEventNotificationSource _clearTravelAdvisoryHypotheses](self, "_clearTravelAdvisoryHypotheses");
}

- (void)_clearTravelAdvisoryHypotheses
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215D9B000, v4, OS_LOG_TYPE_DEFAULT, "Clearing travel advisory hypotheses", buf, 2u);
  }

  -[CALNTriggeredEventNotificationSource notificationManager](self, "notificationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSource sourceIdentifier](self, "sourceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRecordsWithSourceIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v7;
    _os_log_impl(&dword_215D9B000, v8, OS_LOG_TYPE_INFO, "Existing records = %@.", buf, 0xCu);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[CALNTriggeredEventNotificationSource _updateNotification:shouldClearHypothesis:](self, "_updateNotification:shouldClearHypothesis:", v14, 1, (_QWORD)v16);
        objc_msgSend(v14, "sourceClientIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CALNTriggeredEventNotificationSource _updateTimeToLeaveRefreshTimerForSourceClientIdentifier:](self, "_updateTimeToLeaveRefreshTimerForSourceClientIdentifier:", v15);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

}

- (BOOL)_shouldCeaseRouteMonitoringEventForSourceClientIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[CALNTriggeredEventNotificationSource _existingNotificationDataMatchingEventForSourceClientIdentifier:](self, "_existingNotificationDataMatchingEventForSourceClientIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v7 = v4
    && (objc_msgSend(v4, "hypothesis"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6)
    && -[CALNTriggeredEventNotificationSource _mayCeaseRouteMonitoringForExistingNotificationData:](self, "_mayCeaseRouteMonitoringForExistingNotificationData:", v5);

  return v7;
}

- (BOOL)_mayCeaseRouteMonitoringForExistingNotificationData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  char v9;

  objc_msgSend(a3, "hypothesis");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CALNTriggeredEventNotificationSource dateProvider](self, "dateProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "conservativeDepartureDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "CalIsBeforeOrSameAsDate:", v7);

    v9 = v8 ^ 1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (unint64_t)_travelAdvisoryTimelinessPeriodForHypothesis:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[CALNTriggeredEventNotificationSource travelAdvisoryTimelinessAuthority](self, "travelAdvisoryTimelinessAuthority");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "periodForHypothesis:", v4);

  return -[CALNTriggeredEventNotificationSource _calnTravelAdvisoryTimelinessPeriodFromEKTravelAvisoryTimelinessPeriod:](self, "_calnTravelAdvisoryTimelinessPeriodFromEKTravelAvisoryTimelinessPeriod:", v6);
}

- (unint64_t)_calnTravelAdvisoryTimelinessPeriodFromEKTravelAvisoryTimelinessPeriod:(unint64_t)a3
{
  if (a3 < 3)
    return a3 + 1;
  else
    return 0;
}

- (void)_updateTimeToLeaveRefreshTimerForSourceClientIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CALNTriggeredEventNotificationSource _existingNotificationDataMatchingEventForSourceClientIdentifier:](self, "_existingNotificationDataMatchingEventForSourceClientIdentifier:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "hypothesis");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[CALNTriggeredEventNotificationSource _updateTimeToLeaveRefreshTimerForSourceClientIdentifier:hypothesis:allowsLocationAlerts:travelAdvisoryDisabled:](self, "_updateTimeToLeaveRefreshTimerForSourceClientIdentifier:hypothesis:allowsLocationAlerts:travelAdvisoryDisabled:", v7, v6, 1, 0);

}

- (void)_updateTimeToLeaveRefreshTimerForSourceClientIdentifier:(id)a3 hypothesis:(id)a4 allowsLocationAlerts:(BOOL)a5 travelAdvisoryDisabled:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  _BYTE v27[22];
  __int16 v28;
  id v29;
  uint64_t v30;

  v6 = a6;
  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v27 = 138543362;
    *(_QWORD *)&v27[4] = v10;
    _os_log_impl(&dword_215D9B000, v13, OS_LOG_TYPE_DEFAULT, "Updating refresh timer for source client identifier = %{public}@", v27, 0xCu);
  }

  if (!a5)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v27 = 138543362;
      *(_QWORD *)&v27[4] = v10;
      v15 = "Location alerts are not allowed. Will remove the associated refresh timer for source client identifier = %{public}@";
      goto LABEL_9;
    }
LABEL_10:

LABEL_11:
    -[CALNTriggeredEventNotificationSource dataSource](self, "dataSource", *(_OWORD *)v27);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeTimeToLeaveRefreshTimerForSourceClientIdentifier:", v10);
    goto LABEL_12;
  }
  if (v6)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v27 = 138543362;
      *(_QWORD *)&v27[4] = v10;
      v15 = "Time to Leave alarm removed on the event. Will remove the associated refresh timer for source client identif"
            "ier = %{public}@";
LABEL_9:
      _os_log_impl(&dword_215D9B000, v14, OS_LOG_TYPE_DEFAULT, v15, v27, 0xCu);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (!v11)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    *(_DWORD *)v27 = 138543362;
    *(_QWORD *)&v27[4] = v10;
    v15 = "There is no hypothesis. Will remove the associated refresh timer for source client identifier = %{public}@";
    goto LABEL_9;
  }
  if (objc_msgSend(v11, "travelState") == 5)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    *(_DWORD *)v27 = 138543362;
    *(_QWORD *)&v27[4] = v10;
    v15 = "Hypothesis indicates user has arrived. Will remove associated refresh timer for source client identifier = %{public}@";
    goto LABEL_9;
  }
  v17 = -[CALNTriggeredEventNotificationSource _travelAdvisoryTimelinessPeriodForHypothesis:](self, "_travelAdvisoryTimelinessPeriodForHypothesis:", v11);
  if (v17 == 2)
  {
    -[CALNTriggeredEventNotificationSource travelAdvisoryTimelinessAuthority](self, "travelAdvisoryTimelinessAuthority");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "startOfRunningLatePeriodForHypothesis:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v27 = 138543618;
      *(_QWORD *)&v27[4] = v16;
      *(_WORD *)&v27[12] = 2114;
      *(_QWORD *)&v27[14] = v10;
      v20 = "Will refresh when the user will become late at %{public}@, source client identifier = %{public}@";
      v21 = v19;
      v22 = 22;
      goto LABEL_26;
    }
  }
  else
  {
    if (v17 != 1)
      goto LABEL_11;
    -[CALNTriggeredEventNotificationSource travelAdvisoryTimelinessAuthority](self, "travelAdvisoryTimelinessAuthority");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "startOfLeaveNowPeriodForHypothesis:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v27 = 138412802;
      *(_QWORD *)&v27[4] = v16;
      *(_WORD *)&v27[12] = 2114;
      *(_QWORD *)&v27[14] = v16;
      v28 = 2114;
      v29 = v10;
      v20 = "Will refresh at date: [%@] when the user needs to 'Leave Now' at %{public}@, source client identifier = %{public}@";
      v21 = v19;
      v22 = 32;
LABEL_26:
      _os_log_impl(&dword_215D9B000, v21, OS_LOG_TYPE_DEFAULT, v20, v27, v22);
    }
  }

  if (!v16)
    goto LABEL_13;
  objc_msgSend(v16, "dateBySubtractingCalSimulatedOffset");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v27 = 138543618;
    *(_QWORD *)&v27[4] = v24;
    *(_WORD *)&v27[12] = 2114;
    *(_QWORD *)&v27[14] = v10;
    _os_log_impl(&dword_215D9B000, v25, OS_LOG_TYPE_DEFAULT, "Will set up a refresh timer with an adjusted refresh date of %{public}@. source client identifier = %{public}@", v27, 0x16u);
  }

  -[CALNTriggeredEventNotificationSource dataSource](self, "dataSource");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setUpTimeToLeaveRefreshTimerWithTriggerDate:sourceClientIdentifier:", v24, v10);

LABEL_12:
LABEL_13:

}

- (void)_updateSnoozeOptionsForEvents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CALNTriggeredEventNotificationSource notificationManager](self, "notificationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSource sourceIdentifier](self, "sourceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRecordsWithSourceIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v13, "sourceClientIdentifier", (_QWORD)v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "containsObject:", v14))
          -[CALNTriggeredEventNotificationSource _refreshNotification:](self, "_refreshNotification:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (void)updateSnoozeOptionsForPostedNotifications
{
  void *v3;
  unint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[16];

  +[CALNSnoozeCategory snoozeCategories](CALNSnoozeCategory, "snoozeCategories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 > 1)
  {
    -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __81__CALNTriggeredEventNotificationSource_updateSnoozeOptionsForPostedNotifications__block_invoke;
    block[3] = &unk_24D484738;
    block[4] = self;
    dispatch_async(v6, block);

  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215D9B000, v5, OS_LOG_TYPE_INFO, "Not updating snooze options because there's only one option", buf, 2u);
    }

  }
}

void __81__CALNTriggeredEventNotificationSource_updateSnoozeOptionsForPostedNotifications__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  __int128 v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  __int128 v38;
  uint64_t v39;
  void *v40;
  unsigned int v41;
  uint64_t v42;
  id obj;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v1 = a1;
  v60 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "dateProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "now");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(v1 + 32), "notificationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v1 + 32), "sourceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRecordsWithSourceIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0x24D483000uLL;
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v54 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_215D9B000, v7, OS_LOG_TYPE_DEFAULT, "Checking snooze options for %lu posted notifications", buf, 0xCu);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v5;
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  if (v44)
  {
    v9 = *(_QWORD *)v50;
    *(_QWORD *)&v8 = 138543874;
    v38 = v8;
    v42 = *(_QWORD *)v50;
    v39 = v1;
    do
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v50 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v11, "content", v38);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "userInfo");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("AlarmID"));
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v14)
        {
          v45 = (void *)v14;
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("allDay"));
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = -[NSObject BOOLValue](v16, "BOOLValue");
          objc_msgSend(v12, "categoryIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "date");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("endDate"));
          v19 = objc_claimAutoreleasedReturnValue();
          v46 = v18;
          v47 = (void *)v19;
          if (v16)
            v20 = v19 == 0;
          else
            v20 = 1;
          if (v20)
            goto LABEL_25;
          v41 = v17;
          +[CALNSnoozeCategory snoozeCategoryForEventWithStartDate:endDate:now:isAllDay:](CALNSnoozeCategory, "snoozeCategoryForEventWithStartDate:endDate:now:isAllDay:", v48, v19, v40, v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "suffix");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v18, "hasSuffix:", v22))
            goto LABEL_21;
          v23 = objc_msgSend(v18, "length");
          v24 = objc_msgSend(CFSTR("Snooze"), "length");
          v25 = objc_msgSend(v22, "length") + v24;
          if (v23 > v25)
          {
            v26 = objc_msgSend(v46, "compare:options:range:", CFSTR("Snooze"), 0, objc_msgSend(v46, "length") - v25, v24);

            v1 = v39;
            if (!v26)
            {
              +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
              v27 = objc_claimAutoreleasedReturnValue();
              v9 = v42;
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v11, "sourceClientIdentifier");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v54 = (uint64_t)v28;
                _os_log_impl(&dword_215D9B000, v27, OS_LOG_TYPE_INFO, "Notification %{public}@ already has the correct snooze options.", buf, 0xCu);

              }
              objc_msgSend(0, "expirationDateForEventWithStartDate:endDate:isAllDay:", v48, v47, v41);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v39 + 32), "snoozeUpdateTimer");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(0, "leeway");
              v32 = v31;
              objc_msgSend(v11, "sourceClientIdentifier");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "setFireDate:leeway:forEventWithIdentifier:", v29, v33, v32);

              v6 = 0x24D483000;
              goto LABEL_29;
            }
          }
          else
          {
LABEL_21:

            v1 = v39;
          }
          v6 = 0x24D483000uLL;
          v9 = v42;
          if (!v22)
          {
LABEL_25:
            objc_msgSend(*(id *)(v6 + 2864), "calendar");
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v11, "sourceClientIdentifier");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v54 = (uint64_t)v37;
              _os_log_impl(&dword_215D9B000, v35, OS_LOG_TYPE_DEFAULT, "Refreshing notification %{public}@ because there's not enough information to determine if its snooze category is correct.", buf, 0xCu);

            }
            v22 = 0;
          }
          else
          {
            +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v11, "sourceClientIdentifier");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v38;
              v54 = (uint64_t)v36;
              v55 = 2114;
              v56 = v22;
              v57 = 2114;
              v58 = v46;
              _os_log_impl(&dword_215D9B000, v35, OS_LOG_TYPE_DEFAULT, "Refreshing notification %{public}@ because it should have snooze category \"%{public}@\" but has category \"%{public}@.", buf, 0x20u);

              v6 = 0x24D483000;
            }
          }

          objc_msgSend(*(id *)(v1 + 32), "_refreshNotification:", v11);
LABEL_29:

          v15 = v45;
          goto LABEL_30;
        }
        objc_msgSend(*(id *)(v6 + 2864), "calendar");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v11, "sourceClientIdentifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v54 = (uint64_t)v34;
          _os_log_impl(&dword_215D9B000, v16, OS_LOG_TYPE_INFO, "Notification %{public}@ can't be snoozed so it doesn't need refreshing.", buf, 0xCu);

          v9 = v42;
        }
LABEL_30:

      }
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    }
    while (v44);
  }

}

- (void)_refreshNotifications:(id)a3
{
  NSObject *v4;
  id v5;

  v5 = a3;
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[CALNTriggeredEventNotificationSource _refreshNotificationMetaDataWithObjectIDs:](self, "_refreshNotificationMetaDataWithObjectIDs:", v5);
  -[CALNTriggeredEventNotificationSource _refreshTimeToLeaveRefreshTimersWithObjectIDs:](self, "_refreshTimeToLeaveRefreshTimersWithObjectIDs:", v5);
  -[CALNTriggeredEventNotificationSource _refreshNotificationRecordsWithObjectIDs:](self, "_refreshNotificationRecordsWithObjectIDs:", v5);

}

- (void)_refreshNotificationRecordsWithObjectIDs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[CALNTriggeredEventNotificationSource notificationManager](self, "notificationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSource sourceIdentifier](self, "sourceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRecordsWithSourceIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v13);
        v15 = (void *)MEMORY[0x2199F1FA0](v10);
        objc_msgSend(v14, "sourceClientIdentifier", (_QWORD)v17);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v4
          || -[CALNTriggeredEventNotificationSource _notificationWithSourceClientIdentifier:affectedByChangesToObjects:](self, "_notificationWithSourceClientIdentifier:affectedByChangesToObjects:", v16, v4))
        {
          -[CALNTriggeredEventNotificationSource _refreshNotification:](self, "_refreshNotification:", v14);
        }

        objc_autoreleasePoolPop(v15);
        ++v13;
      }
      while (v11 != v13);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v11 = v10;
    }
    while (v10);
  }

}

- (void)_refreshNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "sourceClientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = v6;
    _os_log_impl(&dword_215D9B000, v7, OS_LOG_TYPE_DEFAULT, "Refreshing notification with source client identifier = %{public}@", (uint8_t *)&v12, 0xCu);
  }

  -[CALNTriggeredEventNotificationSource dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldWithdrawNotificationWithSourceClientIdentifier:", v6);

  if (v9)
  {
    -[CALNTriggeredEventNotificationSource notificationManager](self, "notificationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sourceIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeRecordWithSourceIdentifier:sourceClientIdentifier:", v11, v6);

  }
  else
  {
    -[CALNTriggeredEventNotificationSource _updateNotification:shouldClearHypothesis:](self, "_updateNotification:shouldClearHypothesis:", v4, 0);
  }

}

- (void)_refreshNotificationMetaDataWithObjectIDs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  CALNTriggeredEventNotificationSource *v11;

  v4 = a3;
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[CALNTriggeredEventNotificationSource notificationDataStorage](self, "notificationDataStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationData");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __82__CALNTriggeredEventNotificationSource__refreshNotificationMetaDataWithObjectIDs___block_invoke;
  v9[3] = &unk_24D484FD0;
  v10 = v4;
  v11 = self;
  v7 = v4;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v9);

}

void __82__CALNTriggeredEventNotificationSource__refreshNotificationMetaDataWithObjectIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (!*(_QWORD *)(a1 + 32)
    || objc_msgSend(*(id *)(a1 + 40), "_itemWithEventID:affectedByChangesToObjects:", v6))
  {
    objc_msgSend(*(id *)(a1 + 40), "_refreshNotificationMetaData:eventID:", v5, v6);
  }

}

- (void)_refreshNotificationMetaData:(id)a3 eventID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  LODWORD(v8) = -[CALNTriggeredEventNotificationSource _shouldRemoveNotificationMetaData:eventID:](self, "_shouldRemoveNotificationMetaData:eventID:", v7, v6);
  if ((_DWORD)v8)
  {
    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = v6;
      _os_log_impl(&dword_215D9B000, v9, OS_LOG_TYPE_DEFAULT, "Removing notification meta data due to refresh for eventID = %{public}@", (uint8_t *)&v11, 0xCu);
    }

    -[CALNTriggeredEventNotificationSource dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ceaseRouteMonitoringEventWithEventID:", v6);

    -[CALNTriggeredEventNotificationSource _removeStoredNotificationDataForEventWithEventID:](self, "_removeStoredNotificationDataForEventWithEventID:", v6);
  }

}

- (BOOL)_shouldRemoveNotificationMetaData:(id)a3 eventID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  char v10;
  void *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  LODWORD(v8) = -[CALNTriggeredEventNotificationSource _isNotificationMetaDataExpired:eventID:](self, "_isNotificationMetaDataExpired:eventID:", v7, v6);
  if ((_DWORD)v8)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543362;
      v14 = v6;
      _os_log_impl(&dword_215D9B000, v9, OS_LOG_TYPE_DEFAULT, "Notification meta data is expired for eventID = %{public}@. Should remove notification meta data.", (uint8_t *)&v13, 0xCu);
    }

    v10 = 1;
  }
  else
  {
    -[CALNTriggeredEventNotificationSource dataSource](self, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "shouldRemoveNotificationMetaDataWithEventID:", v6);

  }
  return v10;
}

- (BOOL)_isNotificationMetaDataExpired:(id)a3 eventID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  BOOL v13;
  NSObject *v14;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a3, "alarmID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSource dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notificationExpirationDateForEventID:alarmID:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CALNTriggeredEventNotificationSource dateProvider](self, "dateProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "now");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "timeIntervalSinceDate:", v11);
    v13 = v12 <= 0.0;

  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543362;
      v17 = v6;
      _os_log_impl(&dword_215D9B000, v14, OS_LOG_TYPE_DEFAULT, "Could not get an expiration date for notification meta data for eventID = %{public}@. Treating notification meta data as expired.", (uint8_t *)&v16, 0xCu);
    }

    v13 = 1;
  }

  return v13;
}

- (void)_refreshTimeToLeaveRefreshTimersWithObjectIDs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  CALNTriggeredEventNotificationSource *v11;

  v4 = a3;
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[CALNTriggeredEventNotificationSource timeToLeaveRefreshStorage](self, "timeToLeaveRefreshStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "refreshDates");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __86__CALNTriggeredEventNotificationSource__refreshTimeToLeaveRefreshTimersWithObjectIDs___block_invoke;
  v9[3] = &unk_24D484FF8;
  v10 = v4;
  v11 = self;
  v7 = v4;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v9);

}

void __86__CALNTriggeredEventNotificationSource__refreshTimeToLeaveRefreshTimersWithObjectIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (!*(_QWORD *)(a1 + 32)
    || objc_msgSend(*(id *)(a1 + 40), "_itemWithEventID:affectedByChangesToObjects:", v6))
  {
    objc_msgSend(*(id *)(a1 + 40), "_refreshTimeToLeaveRefreshTimerWithRefreshDate:eventID:", v5, v6);
  }

}

- (void)_refreshTimeToLeaveRefreshTimerWithRefreshDate:(id)a3 eventID:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = a3;
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  LODWORD(v7) = -[CALNTriggeredEventNotificationSource _shouldRemoveTimeToLeaveRefreshTimerWithRefreshDate:eventID:](self, "_shouldRemoveTimeToLeaveRefreshTimerWithRefreshDate:eventID:", v6, v9);
  if ((_DWORD)v7)
  {
    -[CALNTriggeredEventNotificationSource dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeTimeToLeaveRefreshTimerForEventID:", v9);

  }
}

- (BOOL)_shouldRemoveTimeToLeaveRefreshTimerWithRefreshDate:(id)a3 eventID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  char v13;
  NSObject *v14;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[CALNTriggeredEventNotificationSource dateProvider](self, "dateProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "timeIntervalSinceDate:", v10);
  if (v11 <= 0.0)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543362;
      v17 = v7;
      _os_log_impl(&dword_215D9B000, v14, OS_LOG_TYPE_DEFAULT, "Time to leave refresh date is expired for eventID = %{public}@. Should remove time to leave refresh timer.", (uint8_t *)&v16, 0xCu);
    }

    v13 = 1;
  }
  else
  {
    -[CALNTriggeredEventNotificationSource dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "shouldRemoveTimeToLeaveRefreshTimerWithRefreshDate:eventID:", v6, v7);

  }
  return v13;
}

- (BOOL)_notificationWithSourceClientIdentifier:(id)a3 affectedByChangesToObjects:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  BOOL v11;
  id v13;
  id v14;

  v6 = a4;
  v7 = a3;
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v13 = 0;
  v14 = 0;
  +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventID:andAlarmID:fromSourceClientIdentifier:](CALNTriggeredEventNotificationSourceClientIdentifierUtilities, "eventID:andAlarmID:fromSourceClientIdentifier:", &v14, &v13, v7);

  v9 = v14;
  v10 = v13;
  if (v10 && (objc_msgSend(v6, "containsObject:", v10) & 1) != 0)
  {
    v11 = 1;
  }
  else if (v9)
  {
    v11 = -[CALNTriggeredEventNotificationSource _itemWithEventID:affectedByChangesToObjects:](self, "_itemWithEventID:affectedByChangesToObjects:", v9, v6);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_itemWithEventID:(id)a3 affectedByChangesToObjects:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;

  v6 = a3;
  v7 = a4;
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_eventURLToObjectIDMap, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9
      || (-[CALNTriggeredEventNotificationSource dataSource](self, "dataSource"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v10, "eventObjectIDForEventID:", v9),
          v11 = objc_claimAutoreleasedReturnValue(),
          v10,
          !v11))
    {
      v12 = 1;
      goto LABEL_7;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_eventURLToObjectIDMap, "setObject:forKeyedSubscript:", v11, v6);

    v9 = (void *)v11;
  }
  v12 = objc_msgSend(v7, "containsObject:", v9);
LABEL_7:

  return v12;
}

- (id)_contentForNotificationWithSourceClientIdentifier:(id)a3
{
  return -[CALNTriggeredEventNotificationSource _contentForNotificationWithSourceClientIdentifier:shouldClearHypothesis:](self, "_contentForNotificationWithSourceClientIdentifier:shouldClearHypothesis:", a3, 0);
}

- (id)_contentForNotificationWithSourceClientIdentifier:(id)a3 shouldClearHypothesis:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v6;
    v16 = 2114;
    v17 = v9;
    _os_log_impl(&dword_215D9B000, v8, OS_LOG_TYPE_DEFAULT, "Getting content for notification with source client identifier = %{public}@, should clear hypothesis = %{public}@", (uint8_t *)&v14, 0x16u);

  }
  -[CALNTriggeredEventNotificationSource _sourceNotificationInfoForSourceClientIdentifier:shouldClearHypothesis:isForContentCreation:](self, "_sourceNotificationInfoForSourceClientIdentifier:shouldClearHypothesis:isForContentCreation:", v6, v4, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[CALNTriggeredEventNotificationSource notificationManager](self, "notificationManager");
    v11 = objc_claimAutoreleasedReturnValue();
    -[CALNTriggeredEventNotificationSource contentForSourceClientIdentifier:sourceNotificationInfo:isProtectedDataAvailable:](self, "contentForSourceClientIdentifier:sourceNotificationInfo:isProtectedDataAvailable:", v6, v10, -[NSObject isProtectedDataAvailable](v11, "isProtectedDataAvailable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CALNTriggeredEventNotificationSource _contentForNotificationWithSourceClientIdentifier:shouldClearHypothesis:].cold.1();
    v12 = 0;
  }

  return v12;
}

- (id)_sourceNotificationInfoForSourceClientIdentifier:(id)a3 shouldClearHypothesis:(BOOL)a4 isForContentCreation:(BOOL)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v18;

  v6 = a4;
  v8 = a3;
  -[CALNTriggeredEventNotificationSource dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSource notificationManager](self, "notificationManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchTriggeredEventNotificationInfoWithSourceClientIdentifier:isProtectedDataAvailable:", v8, objc_msgSend(v10, "isProtectedDataAvailable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CALNTriggeredEventNotificationSource _existingNotificationDataMatchingEventForSourceClientIdentifier:](self, "_existingNotificationDataMatchingEventForSourceClientIdentifier:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
      v14 = objc_msgSend(v12, "isOffsetFromTravelTimeStart");
    else
      v14 = 0;
    LOBYTE(v18) = a5;
    -[CALNTriggeredEventNotificationSource _sourceNotificationInfoForSourceClientIdentifier:notificationInfo:existingNotificationData:hypothesis:shouldClearHypothesis:isOffsetFromTravelTimeStart:isForContentCreation:](self, "_sourceNotificationInfoForSourceClientIdentifier:notificationInfo:existingNotificationData:hypothesis:shouldClearHypothesis:isOffsetFromTravelTimeStart:isForContentCreation:", v8, v11, v13, 0, v6, v14, v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CALNTriggeredEventNotificationSource _sourceNotificationInfoForSourceClientIdentifier:shouldClearHypothesis:isForContentCreation:].cold.1();

    v16 = 0;
  }

  return v16;
}

- (id)_sourceNotificationInfoForSourceClientIdentifier:(id)a3 notificationInfo:(id)a4 existingNotificationData:(id)a5 hypothesis:(id)a6 shouldClearHypothesis:(BOOL)a7 isOffsetFromTravelTimeStart:(BOOL)a8 isForContentCreation:(BOOL)a9
{
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  char v27;
  char v28;
  char v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  char v44;
  char v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  CALNTriggeredEventNotificationSourceNotificationInfo *v50;
  void *v51;
  BOOL v52;
  CALNTriggeredEventNotificationSourceNotificationInfo *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;

  v9 = a8;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities alarmIDForSourceClientIdentifier:](CALNTriggeredEventNotificationSourceClientIdentifierUtilities, "alarmIDForSourceClientIdentifier:", a3);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = v17;
LABEL_3:
    v19 = -[CALNTriggeredEventNotificationSource _travelAdvisoryTimelinessPeriodForHypothesis:](self, "_travelAdvisoryTimelinessPeriodForHypothesis:", v18);
    goto LABEL_6;
  }
  if (!a7)
  {
    if (!v16)
    {
      v38 = 0;
      v18 = 0;
      goto LABEL_12;
    }
    objc_msgSend(v16, "hypothesis");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v38 = 0;
      goto LABEL_7;
    }
    goto LABEL_3;
  }
  v18 = 0;
  v19 = 0;
LABEL_6:
  v38 = v19;
  if (v16)
  {
LABEL_7:
    objc_msgSend(v16, "lastFireTimeOfAlertOffsetFromTravelTime");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
LABEL_12:
  v20 = 0;
LABEL_13:
  objc_msgSend(v15, "eventID");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNTriggeredEventNotificationLaunchURLProvider launchURLForOptionalEventID:hypothesis:isTravelLaunchURL:](CALNTriggeredEventNotificationLaunchURLProvider, "launchURLForOptionalEventID:hypothesis:isTravelLaunchURL:");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "preferredLocation");
  v21 = objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSource mapItemURLProvider](self, "mapItemURLProvider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)v21;
  objc_msgSend(v22, "mapItemURLForOptionalEventLocation:hypothesis:", v21, v18);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = v17;
  v57 = v16;
  v63 = v18;
  v52 = v9;
  if (a9)
  {
    -[CALNTriggeredEventNotificationSource _updatedLastFireTimeOfAlertOffsetFromTravelTimeGivenIsOffsetFromTravelTime:](self, "_updatedLastFireTimeOfAlertOffsetFromTravelTimeGivenIsOffsetFromTravelTime:", v9);
    v23 = objc_claimAutoreleasedReturnValue();

    v60 = (void *)v23;
  }
  else
  {
    v60 = v20;
  }
  v50 = [CALNTriggeredEventNotificationSourceNotificationInfo alloc];
  objc_msgSend(v15, "title");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "location");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "locationWithoutPrediction");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "preferredLocation");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startDate");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "endDate");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v15, "isAllDay");
  v44 = objc_msgSend(v15, "isTimeSensitive");
  objc_msgSend(v15, "eventID");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "eventObjectID");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "calendarIdentifier");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "eventRepresentationDictionary");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "legacyIdentifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "conferenceURL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v15, "conferenceURLIsBroadcast");
  objc_msgSend(v15, "mailtoURL");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v15, "hasSuggestedLocation");
  v27 = objc_msgSend(v15, "eventHasAlarms");
  v28 = objc_msgSend(v15, "allowsLocationAlerts");
  v29 = objc_msgSend(v15, "forceDisplayOfNewTravelAdvisoryHypotheses");
  BYTE1(v37) = objc_msgSend(v15, "travelAdvisoryDisabled");
  LOBYTE(v37) = v29;
  LOBYTE(v36) = v28;
  LOBYTE(v35) = v52;
  BYTE1(v34) = v27;
  LOBYTE(v34) = v26;
  LOBYTE(v33) = v41;
  LOBYTE(v32) = 0;
  BYTE1(v31) = v44;
  LOBYTE(v31) = v45;
  v53 = -[CALNTriggeredEventNotificationSourceNotificationInfo initWithTitle:location:locationWithoutPrediction:preferredLocation:startDate:endDate:isAllDay:isTimeSensitive:launchURL:isLocationEvent:eventID:eventObjectID:calendarIdentifier:eventRepresentationDictionary:legacyIdentifier:mapItemURL:conferenceURL:conferenceURLIsBroadcast:mailtoURL:hasSuggestedLocation:eventHasAlarms:alarmID:isOffsetFromTravelTimeStart:lastFireTimeOfAlertOffsetFromTravelTime:allowsLocationAlerts:hypothesis:travelAdvisoryTimelinessPeriod:forceDisplayOfNewTravelAdvisoryHypotheses:travelAdvisoryDisabled:](v50, "initWithTitle:location:locationWithoutPrediction:preferredLocation:startDate:endDate:isAllDay:isTimeSensitive:launchURL:isLocationEvent:eventID:eventObjectID:calendarIdentifier:eventRepresentationDictionary:legacyIdentifier:mapItemURL:conferenceURL:conferenceURLIsBroadcast:mailtoURL:hasSuggestedLocation:eventHasAlarms:alarmID:isOffsetFromTravelTimeStart:lastFireTimeOfAlertOffsetFromTravelTime:allowsLocationAlerts:hypothesis:travelAdvisoryTimelinessPeriod:forceDisplayOfNewTravelAdvisoryHypotheses:travelAdvisoryDisabled:", v59, v51, v49, v48, v47, v46, v31, v62, v32, v58, v40, v43, v42,
          v39,
          v61,
          v24,
          v33,
          v25,
          v34,
          v64,
          v35,
          v60,
          v36,
          v63,
          v38,
          v37);

  return v53;
}

- (id)_updatedSourceNotificationInfoForContentCreation:(id)a3
{
  id v4;
  char v5;
  char v6;
  char v7;
  void *v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  char v33;
  void *v34;
  void *v35;
  CALNTriggeredEventNotificationSourceNotificationInfo *v36;
  CALNTriggeredEventNotificationSourceNotificationInfo *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;

  v4 = a3;
  -[CALNTriggeredEventNotificationSource _updatedLastFireTimeOfAlertOffsetFromTravelTimeGivenIsOffsetFromTravelTime:](self, "_updatedLastFireTimeOfAlertOffsetFromTravelTimeGivenIsOffsetFromTravelTime:", objc_msgSend(v4, "isOffsetFromTravelTimeStart"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = [CALNTriggeredEventNotificationSourceNotificationInfo alloc];
  objc_msgSend(v4, "title");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationWithoutPrediction");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredLocation");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v4, "isAllDay");
  v32 = objc_msgSend(v4, "isTimeSensitive");
  objc_msgSend(v4, "launchURL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v4, "isLocationEvent");
  objc_msgSend(v4, "eventID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventObjectID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendarIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventRepresentationDictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "legacyIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapItemURL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conferenceURL");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v4, "conferenceURLIsBroadcast");
  objc_msgSend(v4, "mailtoURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v4, "hasSuggestedLocation");
  v5 = objc_msgSend(v4, "eventHasAlarms");
  objc_msgSend(v4, "alarmID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isOffsetFromTravelTimeStart");
  v7 = objc_msgSend(v4, "allowsLocationAlerts");
  objc_msgSend(v4, "hypothesis");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "travelAdvisoryTimelinessPeriod");
  v10 = objc_msgSend(v4, "forceDisplayOfNewTravelAdvisoryHypotheses");
  v11 = objc_msgSend(v4, "travelAdvisoryDisabled");

  BYTE1(v19) = v11;
  LOBYTE(v19) = v10;
  LOBYTE(v18) = v7;
  LOBYTE(v17) = v6;
  BYTE1(v16) = v5;
  LOBYTE(v16) = v22;
  LOBYTE(v15) = v24;
  LOBYTE(v14) = v30;
  BYTE1(v13) = v32;
  LOBYTE(v13) = v33;
  v37 = -[CALNTriggeredEventNotificationSourceNotificationInfo initWithTitle:location:locationWithoutPrediction:preferredLocation:startDate:endDate:isAllDay:isTimeSensitive:launchURL:isLocationEvent:eventID:eventObjectID:calendarIdentifier:eventRepresentationDictionary:legacyIdentifier:mapItemURL:conferenceURL:conferenceURLIsBroadcast:mailtoURL:hasSuggestedLocation:eventHasAlarms:alarmID:isOffsetFromTravelTimeStart:lastFireTimeOfAlertOffsetFromTravelTime:allowsLocationAlerts:hypothesis:travelAdvisoryTimelinessPeriod:forceDisplayOfNewTravelAdvisoryHypotheses:travelAdvisoryDisabled:](v36, "initWithTitle:location:locationWithoutPrediction:preferredLocation:startDate:endDate:isAllDay:isTimeSensitive:launchURL:isLocationEvent:eventID:eventObjectID:calendarIdentifier:eventRepresentationDictionary:legacyIdentifier:mapItemURL:conferenceURL:conferenceURLIsBroadcast:mailtoURL:hasSuggestedLocation:eventHasAlarms:alarmID:isOffsetFromTravelTimeStart:lastFireTimeOfAlertOffsetFromTravelTime:allowsLocationAlerts:hypothesis:travelAdvisoryTimelinessPeriod:forceDisplayOfNewTravelAdvisoryHypotheses:travelAdvisoryDisabled:", v42, v41, v40, v39, v35, v34, v13, v31, v14, v29, v38, v28, v21,
          v27,
          v26,
          v25,
          v15,
          v23,
          v16,
          v20,
          v17,
          v43,
          v18,
          v8,
          v9,
          v19);

  return v37;
}

- (id)_existingRecordMatchingEventForSourceClientIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[CALNTriggeredEventNotificationSource notificationManager](self, "notificationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSource sourceIdentifier](self, "sourceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRecordsWithSourceIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v14 = 138412290;
    v15 = v8;
    _os_log_impl(&dword_215D9B000, v9, OS_LOG_TYPE_INFO, "Existing records = %@.", (uint8_t *)&v14, 0xCu);
  }

  -[CALNTriggeredEventNotificationSource _existingRecordMatchingEventForSourceClientIdentifier:existingRecords:](self, "_existingRecordMatchingEventForSourceClientIdentifier:existingRecords:", v4, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v10, "sourceClientIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v4;
    v16 = 2114;
    v17 = v12;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_215D9B000, v11, OS_LOG_TYPE_INFO, "Existing record matching event for source client identifier = %{public}@, existing record source client identifier = %{public}@, existing record = %@", (uint8_t *)&v14, 0x20u);

  }
  return v10;
}

- (id)_existingRecordMatchingEventForSourceClientIdentifier:(id)a3 existingRecords:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  CALNTriggeredEventNotificationSource *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __110__CALNTriggeredEventNotificationSource__existingRecordMatchingEventForSourceClientIdentifier_existingRecords___block_invoke;
  v15 = &unk_24D484828;
  v16 = self;
  v17 = v6;
  v8 = v6;
  v9 = objc_msgSend(v7, "indexOfObjectPassingTest:", &v12);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", v9, v12, v13, v14, v15, v16, v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

uint64_t __110__CALNTriggeredEventNotificationSource__existingRecordMatchingEventForSourceClientIdentifier_existingRecords___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "sourceClientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_sourceClientIdentifier:matchesEventForSourceClientIdentifier:", v4, *(_QWORD *)(a1 + 40));

  return v5;
}

- (void)_addRecord:(id)a3 sourceNotificationInfo:(id)a4 existingNotificationData:(id)a5 trigger:(unint64_t)a6 transition:(unint64_t)a7 now:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v14 = a8;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v16, "eventID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "eventObjectID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSource _addEventURL:mappingToEventObjectID:](self, "_addEventURL:mappingToEventObjectID:", v18, v19);

  -[CALNTriggeredEventNotificationSource notificationManager](self, "notificationManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addRecord:", v17);

  objc_msgSend(v17, "sourceClientIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSource _addNotificationDataForSourceClientIdentifier:sourceNotificationInfo:existingNotificationData:transition:now:](self, "_addNotificationDataForSourceClientIdentifier:sourceNotificationInfo:existingNotificationData:transition:now:", v21, v16, v15, a7, v14);

  objc_msgSend(v17, "sourceClientIdentifier");
  v22 = (id)objc_claimAutoreleasedReturnValue();

  -[CALNTriggeredEventNotificationSource _notificationAddedWithSourceClientIdentifier:sourceNotificationInfo:trigger:](self, "_notificationAddedWithSourceClientIdentifier:sourceNotificationInfo:trigger:", v22, v16, a6);
}

- (void)_notificationAddedWithSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 trigger:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v8;
    v17 = 2114;
    v18 = v11;
    _os_log_impl(&dword_215D9B000, v10, OS_LOG_TYPE_DEFAULT, "Notification added with source client identifier = %{public}@, trigger = %{public}@", (uint8_t *)&v15, 0x16u);

  }
  if (a5 == 2)
  {
    -[CALNTriggeredEventNotificationSource dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendFeedbackForAddedLeaveNowNotificationWithSourceClientIdentifier:", v8);
    goto LABEL_7;
  }
  if (a5 == 1)
  {
    objc_msgSend(v9, "hypothesis");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "travelAdvisoryTimelinessPeriod");
    -[CALNTriggeredEventNotificationSource dataSource](self, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendFeedbackForAddedTravelAdvisoryNotificationWithSourceClientIdentifier:hypothesis:travelAdvisoryTimelinessPeriod:", v8, v12, v13);

LABEL_7:
  }

}

- (void)_updateNotification:(id)a3 shouldClearHypothesis:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
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
  id v18;

  v4 = a4;
  v6 = a3;
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v6, "sourceClientIdentifier");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSource _sourceNotificationInfoForSourceClientIdentifier:shouldClearHypothesis:isForContentCreation:](self, "_sourceNotificationInfoForSourceClientIdentifier:shouldClearHypothesis:isForContentCreation:", v18, v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSource _updatedSourceNotificationInfoForContentCreation:](self, "_updatedSourceNotificationInfoForContentCreation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSource _existingNotificationDataMatchingEventForSourceClientIdentifier:](self, "_existingNotificationDataMatchingEventForSourceClientIdentifier:", v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSource notificationManager](self, "notificationManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSource contentForSourceClientIdentifier:sourceNotificationInfo:isProtectedDataAvailable:](self, "contentForSourceClientIdentifier:sourceNotificationInfo:isProtectedDataAvailable:", v18, v9, objc_msgSend(v11, "isProtectedDataAvailable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v13, "setContent:", v12);
  -[CALNTriggeredEventNotificationSource dateProvider](self, "dateProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[CALNTriggeredEventNotificationSource notificationManager](self, "notificationManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v16, "updateRecord:", v17);

  -[CALNTriggeredEventNotificationSource _updateStoredNotificationDataForSourceClientIdentifier:sourceNotificationInfo:existingNotificationData:transition:now:](self, "_updateStoredNotificationDataForSourceClientIdentifier:sourceNotificationInfo:existingNotificationData:transition:now:", v18, v8, v10, 2, v15);
}

- (void)_addEventURL:(id)a3 mappingToEventObjectID:(id)a4
{
  if (a3)
  {
    if (a4)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_eventURLToObjectIDMap, "setObject:forKeyedSubscript:", a4, a3);
  }
}

- (void)_commonHandleResponse:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  -[CALNTriggeredEventNotificationSource _launchURLForResponse:](self, "_launchURLForResponse:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CALNTriggeredEventNotificationSource urlHandler](self, "urlHandler");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject openURL:response:](v6, "openURL:response:", v5, v4);
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CALNTriggeredEventNotificationSource _commonHandleResponse:].cold.1(v4, v6);
  }

}

- (void)_handleDirectionsActionWithResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[CALNTriggeredEventNotificationSource _commonHandleResponse:](self, "_commonHandleResponse:", v4);
  objc_msgSend(v4, "notificationRecord");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "sourceClientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSource _notificationResponseDataForRecord:](self, "_notificationResponseDataForRecord:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hypothesis");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastFireTimeOfAlertOffsetFromTravelTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSource dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleDirectionsActionWithSourceClientIdentifier:hypothesis:lastFireTimeOfAlertOffsetFromTravelTime:", v5, v7, v8);

}

- (void)_handleConferenceCallActionWithResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CALNTriggeredEventNotificationSource _commonHandleResponse:](self, "_commonHandleResponse:", v4);
  objc_msgSend(v4, "notificationRecord");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "sourceClientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSource dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleConferenceCallActionWithSourceClientIdentifier:", v5);

}

- (void)_handleMailOrganizerActionWithResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[CALNTriggeredEventNotificationSource _commonHandleResponse:](self, "_commonHandleResponse:", v4);
  objc_msgSend(v4, "notificationRecord");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "sourceClientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSource _notificationResponseDataForRecord:](self, "_notificationResponseDataForRecord:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hypothesis");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSource dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleMailOrganizerActionWithSourceClientIdentifier:hypothesis:", v5, v7);

}

- (id)_existingNotificationDataMatchingEventForSourceClientIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventIDForSourceClientIdentifier:](CALNTriggeredEventNotificationSourceClientIdentifierUtilities, "eventIDForSourceClientIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CALNTriggeredEventNotificationSource notificationDataStorage](self, "notificationDataStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "notificationDataWithIdentifier:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_notificationDataForSourceNotificationInfo:(id)a3 existingNotificationData:(id)a4 transition:(unint64_t)a5 now:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  id v20;
  CALNMutableTriggeredEventNotificationData *v21;
  void *v22;
  void *v23;
  void *v24;

  v9 = a3;
  v10 = a6;
  v11 = a4;
  v12 = objc_msgSend(v11, "hasDisplayedLeaveByMessage");
  v13 = objc_msgSend(v11, "hasDisplayedLeaveNowMessage");
  v14 = objc_msgSend(v11, "hasDisplayedRunningLateMessage");
  objc_msgSend(v11, "lastFireTimeOfAlertOffsetFromTravelTime");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastTimeNotificationAdded");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5 - 1 <= 1)
  {
    v17 = objc_msgSend(v9, "travelAdvisoryTimelinessPeriod");
    if (v17 == 1)
      v18 = 1;
    else
      v18 = v12;
    if (v17 == 2)
      v19 = 1;
    else
      v19 = v13;
    if (v17 == 2)
      v18 = v12;
    if (v17 == 3)
      v14 = 1;
    else
      v14 = v14;
    if (v17 == 3)
      v13 = v13;
    else
      v13 = v19;
    if (v17 == 3)
      v12 = v12;
    else
      v12 = v18;

    if (objc_msgSend(v9, "isOffsetFromTravelTimeStart"))
      v15 = v10;
    else
      v15 = 0;
    v20 = v10;

    v16 = v20;
  }
  v21 = objc_alloc_init(CALNMutableTriggeredEventNotificationData);
  objc_msgSend(v9, "alarmID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNMutableTriggeredEventNotificationData setAlarmID:](v21, "setAlarmID:", v22);

  -[CALNMutableTriggeredEventNotificationData setIsOffsetFromTravelTimeStart:](v21, "setIsOffsetFromTravelTimeStart:", objc_msgSend(v9, "isOffsetFromTravelTimeStart"));
  -[CALNMutableTriggeredEventNotificationData setLastFireTimeOfAlertOffsetFromTravelTime:](v21, "setLastFireTimeOfAlertOffsetFromTravelTime:", v15);
  objc_msgSend(v9, "hypothesis");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNMutableTriggeredEventNotificationData setHypothesis:](v21, "setHypothesis:", v23);

  -[CALNMutableTriggeredEventNotificationData setHasDisplayedLeaveByMessage:](v21, "setHasDisplayedLeaveByMessage:", v12);
  -[CALNMutableTriggeredEventNotificationData setHasDisplayedLeaveNowMessage:](v21, "setHasDisplayedLeaveNowMessage:", v13);
  -[CALNMutableTriggeredEventNotificationData setHasDisplayedRunningLateMessage:](v21, "setHasDisplayedRunningLateMessage:", v14);
  -[CALNMutableTriggeredEventNotificationData setLastTimeNotificationAdded:](v21, "setLastTimeNotificationAdded:", v16);
  v24 = (void *)-[CALNMutableTriggeredEventNotificationData copy](v21, "copy");

  return v24;
}

- (void)_removeStoredNotificationDataForEventWithEventID:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CALNTriggeredEventNotificationSource notificationDataStorage](self, "notificationDataStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeNotificationDataWithIdentifier:", v5);

  -[NSMutableDictionary removeObjectForKey:](self->_eventURLToObjectIDMap, "removeObjectForKey:", v5);
}

- (void)_updateStoredNotificationDataForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 existingNotificationData:(id)a5 transition:(unint64_t)a6 now:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  int v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a7;
  v14 = a5;
  v15 = a4;
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v16);

  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v12;
    v23 = 2114;
    v24 = v18;
    _os_log_impl(&dword_215D9B000, v17, OS_LOG_TYPE_DEFAULT, "Updating stored notification data for source client identifier = %{public}@, transition = %{public}@", (uint8_t *)&v21, 0x16u);

  }
  -[CALNTriggeredEventNotificationSource _notificationDataForSourceNotificationInfo:existingNotificationData:transition:now:](self, "_notificationDataForSourceNotificationInfo:existingNotificationData:transition:now:", v15, v14, a6, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[CALNTriggeredEventNotificationSource _addNotificationData:forSourceClientIdentifier:](self, "_addNotificationData:forSourceClientIdentifier:", v19, v12);
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138543362;
      v22 = v12;
      _os_log_impl(&dword_215D9B000, v20, OS_LOG_TYPE_DEFAULT, "Could not get notification data for source client identifier = %{public}@", (uint8_t *)&v21, 0xCu);
    }

  }
}

- (void)_addNotificationDataForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 existingNotificationData:(id)a5 transition:(unint64_t)a6 now:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a7;
  v14 = a5;
  v15 = a4;
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v12;
    v21 = 2114;
    v22 = v17;
    _os_log_impl(&dword_215D9B000, v16, OS_LOG_TYPE_DEFAULT, "Adding notification data for source notification info. source client identifier = %{public}@, transition = %{public}@", (uint8_t *)&v19, 0x16u);

  }
  -[CALNTriggeredEventNotificationSource _notificationDataForSourceNotificationInfo:existingNotificationData:transition:now:](self, "_notificationDataForSourceNotificationInfo:existingNotificationData:transition:now:", v15, v14, a6, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[CALNTriggeredEventNotificationSource _addNotificationData:forSourceClientIdentifier:](self, "_addNotificationData:forSourceClientIdentifier:", v18, v12);
}

- (void)_addNotificationData:(id)a3 forSourceClientIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventIDForSourceClientIdentifier:](CALNTriggeredEventNotificationSourceClientIdentifierUtilities, "eventIDForSourceClientIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[CALNTriggeredEventNotificationSource notificationDataStorage](self, "notificationDataStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addNotificationData:withIdentifier:", v6, v8);

    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543874;
      v15 = v7;
      v16 = 2114;
      v17 = v8;
      v18 = 2112;
      v19 = v6;
      v11 = "Added notification data, source client identifier = %{public}@, event ID = %{public}@, notification data = %@";
      v12 = v10;
      v13 = 32;
LABEL_6:
      _os_log_impl(&dword_215D9B000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, v13);
    }
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = v7;
      v11 = "No event ID to add notification data for source client identifier = %{public}@";
      v12 = v10;
      v13 = 12;
      goto LABEL_6;
    }
  }

}

- (BOOL)_shouldRemoveStoredNotificationDataGivenShouldWithdrawNotification:(BOOL)a3 hasExistingTravelInformation:(BOOL)a4 mayCeaseRouteMonitoring:(BOOL)a5
{
  return (a5 | ~a4) & a3;
}

- (BOOL)_shouldUpdateStoredNotificationDataGivenTransition:(unint64_t)a3
{
  return a3 - 1 < 2;
}

- (void)_resetStoredNotificationDataTimeToLeaveDisplayStateForSourceClientIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v4;
    _os_log_impl(&dword_215D9B000, v6, OS_LOG_TYPE_DEFAULT, "Resetting stored notification data time to leave display state for source client identifier = %{public}@", (uint8_t *)&v9, 0xCu);
  }

  -[CALNTriggeredEventNotificationSource _existingNotificationDataMatchingEventForSourceClientIdentifier:](self, "_existingNotificationDataMatchingEventForSourceClientIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSource _updatedNotificationDataResettingTimeToLeaveDisplayState:](self, "_updatedNotificationDataResettingTimeToLeaveDisplayState:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationSource _addNotificationData:forSourceClientIdentifier:](self, "_addNotificationData:forSourceClientIdentifier:", v8, v4);

}

- (void)_clearTravelAdvisoryFromNotificationMetaDataForSourceClientIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[CALNTriggeredEventNotificationSource _existingNotificationDataMatchingEventForSourceClientIdentifier:](self, "_existingNotificationDataMatchingEventForSourceClientIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v7, "setHypothesis:", 0);
  v8 = (void *)objc_msgSend(v7, "copy");
  -[CALNTriggeredEventNotificationSource _addNotificationData:forSourceClientIdentifier:](self, "_addNotificationData:forSourceClientIdentifier:", v8, v4);

  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = v4;
    _os_log_impl(&dword_215D9B000, v9, OS_LOG_TYPE_DEFAULT, "Cleared travel advisory from notification meta data for source client identifier = %{public}@", (uint8_t *)&v10, 0xCu);
  }

}

- (id)_updatedNotificationDataResettingTimeToLeaveDisplayState:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v3, "setHasDisplayedLeaveByMessage:", 0);
  objc_msgSend(v3, "setHasDisplayedLeaveNowMessage:", 0);
  objc_msgSend(v3, "setHasDisplayedRunningLateMessage:", 0);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (BOOL)migrateToStorage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__CALNTriggeredEventNotificationSource_migrateToStorage___block_invoke;
  block[3] = &unk_24D485020;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __57__CALNTriggeredEventNotificationSource_migrateToStorage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  NSObject *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  if (v3 == v2)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215D9B000, v4, OS_LOG_TYPE_DEFAULT, "Storage migration: new storage is the same as existing storage; no work to be done",
        buf,
        2u);
    }
  }
  else
  {
    objc_msgSend(v3, "notificationData");
    v4 = objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v5)
    {
      v7 = v5;
      v8 = *(_QWORD *)v17;
      *(_QWORD *)&v6 = 138412290;
      v15 = v6;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v4);
          v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          -[NSObject objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v10, v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "notificationDataWithIdentifier:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend((id)objc_opt_class(), "_mergeDataFromUnprotectedStore:withDataInProtectedStore:", v11, v12);
            v13 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "addNotificationData:withIdentifier:", v13, v10);
            +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v21 = v10;
              v22 = 2112;
              v23 = v13;
              _os_log_impl(&dword_215D9B000, v14, OS_LOG_TYPE_DEFAULT, "Storage migration: key %@ had existing data; adding merged data: %@",
                buf,
                0x16u);
            }

          }
          else
          {
            objc_msgSend(*(id *)(a1 + 40), "addNotificationData:withIdentifier:", v11, v10);
            +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v15;
              v21 = v10;
              _os_log_impl(&dword_215D9B000, v13, OS_LOG_TYPE_DEFAULT, "Storage migration: copying data for key %@", buf, 0xCu);
            }
          }

        }
        v7 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v7);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 40));
  }

}

+ (id)_mergeDataFromUnprotectedStore:(id)a3 withDataInProtectedStore:(id)a4
{
  id v5;
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

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "alarmID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlarmID:", v8);

  objc_msgSend(v5, "hypothesis");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHypothesis:", v9);

  objc_msgSend(v7, "setHasDisplayedLeaveByMessage:", objc_msgSend(v5, "hasDisplayedLeaveByMessage"));
  objc_msgSend(v7, "setHasDisplayedLeaveNowMessage:", objc_msgSend(v5, "hasDisplayedLeaveNowMessage"));
  objc_msgSend(v7, "setHasDisplayedRunningLateMessage:", objc_msgSend(v5, "hasDisplayedRunningLateMessage"));
  objc_msgSend(v7, "setIsOffsetFromTravelTimeStart:", objc_msgSend(v6, "isOffsetFromTravelTimeStart"));
  objc_msgSend(v6, "lastFireTimeOfAlertOffsetFromTravelTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastFireTimeOfAlertOffsetFromTravelTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _laterOfTwoPossiblyNilDates(v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLastFireTimeOfAlertOffsetFromTravelTime:", v12);

  objc_msgSend(v6, "lastTimeNotificationAdded");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lastTimeNotificationAdded");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  _laterOfTwoPossiblyNilDates(v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLastTimeNotificationAdded:", v15);

  return v7;
}

- (id)_notificationResponseDataForRecord:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;

  v3 = a3;
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "userInfo");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("com.apple.calendar.notification.CALNTriggeredEventNotificationResponseDataPayloadUserInfoKey"));
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        +[CALNTriggeredEventNotificationResponseDataPayloadMapper notificationResponseDataForPayload:](CALNTriggeredEventNotificationResponseDataPayloadMapper, "notificationResponseDataForPayload:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

        goto LABEL_15;
      }
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CALNTriggeredEventNotificationSource _notificationResponseDataForRecord:].cold.3(v3, v10);

    }
    else
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[CALNTriggeredEventNotificationSource _notificationResponseDataForRecord:].cold.2(v3, v8);
    }
    v9 = 0;
    goto LABEL_14;
  }
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[CALNTriggeredEventNotificationSource _notificationResponseDataForRecord:].cold.1(v3, v7);
  v9 = 0;
LABEL_15:

  return v9;
}

- (id)_notificationResponseDataForSourceNotificationInfo:(id)a3
{
  id v3;
  CALNTriggeredEventNotificationResponseData *v4;
  void *v5;
  void *v6;
  CALNTriggeredEventNotificationResponseData *v7;

  v3 = a3;
  v4 = [CALNTriggeredEventNotificationResponseData alloc];
  objc_msgSend(v3, "hypothesis");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastFireTimeOfAlertOffsetFromTravelTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CALNTriggeredEventNotificationResponseData initWithHypothesis:lastFireTimeOfAlertOffsetFromTravelTime:](v4, "initWithHypothesis:lastFireTimeOfAlertOffsetFromTravelTime:", v5, v6);
  return v7;
}

- (void)_setNotificationResponseData:(id)a3 onNotificationContent:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  +[CALNTriggeredEventNotificationResponseDataPayloadMapper payloadForNotificationResponseData:](CALNTriggeredEventNotificationResponseDataPayloadMapper, "payloadForNotificationResponseData:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInfoValue:forKey:", v6, CFSTR("com.apple.calendar.notification.CALNTriggeredEventNotificationResponseDataPayloadUserInfoKey"));

}

- (id)_eventRepresentationDictionaryWithSourceNotificationInfo:(id)a3 hypothesisMessage:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v6 = a4;
  objc_msgSend(a3, "eventRepresentationDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && v6)
  {
    -[CALNTriggeredEventNotificationSource sourceEventRepresentationProvider](self, "sourceEventRepresentationProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateEventRepresentationDictionary:withHypothesisMessage:", v7, v6);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }

  return v7;
}

- (id)_resolvedSourceClientIdentifierForNewSourceClientIdentifier:(id)a3 oldSourceClientIdentifier:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v13;
  id v14;
  id v15;
  id v16;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v15 = 0;
    v16 = 0;
    +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventID:andAlarmID:fromSourceClientIdentifier:](CALNTriggeredEventNotificationSourceClientIdentifierUtilities, "eventID:andAlarmID:fromSourceClientIdentifier:", &v16, &v15, v5);
    v7 = v16;
    v8 = v15;
    v13 = 0;
    v14 = 0;
    +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventID:andAlarmID:fromSourceClientIdentifier:](CALNTriggeredEventNotificationSourceClientIdentifierUtilities, "eventID:andAlarmID:fromSourceClientIdentifier:", &v14, &v13, v6);
    v9 = v14;
    if (v13)
      v10 = v6;
    else
      v10 = v5;
    if (v8)
      v10 = v5;
    v11 = v10;

  }
  else
  {
    v11 = v5;
  }

  return v11;
}

- (BOOL)_sourceClientIdentifier:(id)a3 matchesEventForSourceClientIdentifier:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  id v15;
  id v16;
  id v17;
  id v18;

  v5 = a3;
  v6 = a4;
  v17 = 0;
  v18 = 0;
  +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventID:andAlarmID:fromSourceClientIdentifier:](CALNTriggeredEventNotificationSourceClientIdentifierUtilities, "eventID:andAlarmID:fromSourceClientIdentifier:", &v18, &v17, v5);
  v7 = v18;
  v8 = v17;
  if (v7)
  {
    v15 = 0;
    v16 = 0;
    +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventID:andAlarmID:fromSourceClientIdentifier:](CALNTriggeredEventNotificationSourceClientIdentifierUtilities, "eventID:andAlarmID:fromSourceClientIdentifier:", &v16, &v15, v6);
    v9 = v16;
    v10 = v15;
    if (v9)
    {
      v11 = objc_msgSend(v7, "isEqualToString:", v9);
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
      if (v11)
      {
        if (v13)
          -[CALNTriggeredEventNotificationSource _sourceClientIdentifier:matchesEventForSourceClientIdentifier:].cold.1();
      }
      else if (v13)
      {
        -[CALNTriggeredEventNotificationSource _sourceClientIdentifier:matchesEventForSourceClientIdentifier:].cold.2();
      }

    }
    else
    {
      LOBYTE(v11) = 0;
    }

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (id)_launchURLForResponse:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "notificationRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqualToString:", CFSTR("CALNNotificationDirectionsAction")))
  {
    objc_msgSend((id)objc_opt_class(), "_mapItemURLForNotification:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("CALNNotificationConferenceCallAction")))
  {
    objc_msgSend((id)objc_opt_class(), "_conferenceURLForNotification:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("Mail_identifier")))
    {
      v7 = 0;
      goto LABEL_8;
    }
    objc_msgSend((id)objc_opt_class(), "_mailtoURLForNotification:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
LABEL_8:

  return v7;
}

+ (id)_mapItemURLForNotification:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MapItemURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_conferenceURLForNotification:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ConferenceURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_mailtoURLForNotification:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mailto"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_updatedLastFireTimeOfAlertOffsetFromTravelTimeGivenIsOffsetFromTravelTime:(BOOL)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    -[CALNTriggeredEventNotificationSource dateProvider](self, "dateProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "now");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (CALNTriggeredEventNotificationDataSource)dataSource
{
  return self->_dataSource;
}

- (CALNNotificationManager)notificationManager
{
  return (CALNNotificationManager *)objc_loadWeakRetained((id *)&self->_notificationManager);
}

- (CALNCalendarIconIdentifierProvider)iconIdentifierProvider
{
  return self->_iconIdentifierProvider;
}

- (CALNSourceEventRepresentationProvider)sourceEventRepresentationProvider
{
  return self->_sourceEventRepresentationProvider;
}

- (CALNTriggeredEventNotificationTriggerHelper)triggerHelper
{
  return self->_triggerHelper;
}

- (CALNTriggeredEventNotificationTransitionProvider)transitionProvider
{
  return self->_transitionProvider;
}

- (CALNTriggeredEventNotificationBodyDescriptionProvider)bodyDescriptionProvider
{
  return self->_bodyDescriptionProvider;
}

- (CALNTravelAdvisoryTimelinessAuthority)travelAdvisoryTimelinessAuthority
{
  return self->_travelAdvisoryTimelinessAuthority;
}

- (CalDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (CALNTriggeredEventNotificationDataStorage)notificationDataStorage
{
  return self->_notificationDataStorage;
}

- (CALNTimeToLeaveRefreshStorage)timeToLeaveRefreshStorage
{
  return self->_timeToLeaveRefreshStorage;
}

- (CALNSnoozeUpdateTimer)snoozeUpdateTimer
{
  return self->_snoozeUpdateTimer;
}

- (NSMutableDictionary)eventURLToObjectIDMap
{
  return self->_eventURLToObjectIDMap;
}

- (CALNURLHandler)urlHandler
{
  return self->_urlHandler;
}

- (CALNTriggeredEventNotificationMapItemURLProvider)mapItemURLProvider
{
  return self->_mapItemURLProvider;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_mapItemURLProvider, 0);
  objc_storeStrong((id *)&self->_urlHandler, 0);
  objc_storeStrong((id *)&self->_eventURLToObjectIDMap, 0);
  objc_storeStrong((id *)&self->_snoozeUpdateTimer, 0);
  objc_storeStrong((id *)&self->_timeToLeaveRefreshStorage, 0);
  objc_storeStrong((id *)&self->_notificationDataStorage, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_travelAdvisoryTimelinessAuthority, 0);
  objc_storeStrong((id *)&self->_bodyDescriptionProvider, 0);
  objc_storeStrong((id *)&self->_transitionProvider, 0);
  objc_storeStrong((id *)&self->_triggerHelper, 0);
  objc_storeStrong((id *)&self->_sourceEventRepresentationProvider, 0);
  objc_storeStrong((id *)&self->_iconIdentifierProvider, 0);
  objc_destroyWeak((id *)&self->_notificationManager);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

+ (id)snoozeActionIdentifier
{
  return CFSTR("CALNTriggeredEventNotificationSnoozeActionIdentifier");
}

+ (id)directionsActionIdentifier
{
  return CFSTR("CALNNotificationDirectionsAction");
}

+ (id)conferenceCallActionIdentifier
{
  return CFSTR("CALNNotificationConferenceCallAction");
}

+ (id)mailOrganizerActionIdentifier
{
  return CFSTR("Mail_identifier");
}

+ (NSString)mapItemURLUserInfoKey
{
  return (NSString *)CFSTR("MapItemURL");
}

+ (NSString)conferenceURLUserInfoKey
{
  return (NSString *)CFSTR("ConferenceURL");
}

+ (NSString)mailToURLUserInfoKey
{
  return (NSString *)CFSTR("mailto");
}

- (void)refreshNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CALNTriggeredEventNotificationSource workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__CALNTriggeredEventNotificationSource_UnitTesting__refreshNotification___block_invoke;
  v7[3] = &unk_24D484760;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __73__CALNTriggeredEventNotificationSource_UnitTesting__refreshNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refreshNotification:", *(_QWORD *)(a1 + 40));
}

- (void)contentForSourceClientIdentifier:sourceNotificationInfo:isProtectedDataAvailable:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_215D9B000, v0, v1, "Using default title for notification content despite protected data being available, source client identifier = %{public}@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_triggeredWithSourceClientIdentifier:triggerData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_215D9B000, v0, v1, "Could not get notification info for event (%{public}@).", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_triggeredWithSourceClientIdentifier:triggerData:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_215D9B000, v1, OS_LOG_TYPE_ERROR, "Could not get notification content. source client identifier = %{public}@, source notification info = %@", v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_triggeredWithSourceClientIdentifier:triggerData:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_215D9B000, v0, v1, "Notification that should trigger cannot because we could not compute the transition type. source client identifier = %{public}@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_travelEngineEventSignificantlyChangedWithSourceClientIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_215D9B000, v0, v1, "Could not get existing record for source client identifier = %{public}@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_contentForNotificationWithSourceClientIdentifier:shouldClearHypothesis:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_215D9B000, v0, v1, "Failed to get source notification info. source client identifier = %{public}@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_sourceNotificationInfoForSourceClientIdentifier:shouldClearHypothesis:isForContentCreation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_215D9B000, v0, v1, "Failed to get notification info for event (%{public}@). Returning nil content", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_commonHandleResponse:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "notificationRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceClientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "actionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543874;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  v11 = 2112;
  v12 = a1;
  _os_log_error_impl(&dword_215D9B000, a2, OS_LOG_TYPE_ERROR, "Error: Could not get launch URL for action. notification identifier = %{public}@, action identifier = %{public}@, response = %@", (uint8_t *)&v7, 0x20u);

}

- (void)_notificationResponseDataForRecord:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "sourceClientIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_215D9B000, a2, v4, "No content available to get notification response data. source client identifier = %{public}@", v5);

  OUTLINED_FUNCTION_4_1();
}

- (void)_notificationResponseDataForRecord:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "sourceClientIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_215D9B000, a2, v4, "No user info available to get notification response data. source client identifier = %{public}@", v5);

  OUTLINED_FUNCTION_4_1();
}

- (void)_notificationResponseDataForRecord:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "sourceClientIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_215D9B000, a2, v4, "No notification response data payload in user info. source client identifier = %{public}@", v5);

  OUTLINED_FUNCTION_4_1();
}

- (void)_sourceClientIdentifier:matchesEventForSourceClientIdentifier:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_3(&dword_215D9B000, v0, v1, "Source client identifiers refer to the same event. Source client identifier: %{public}@. Other source client identifier: %{public}@.");
  OUTLINED_FUNCTION_1_0();
}

- (void)_sourceClientIdentifier:matchesEventForSourceClientIdentifier:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_3(&dword_215D9B000, v0, v1, "Source client identifiers do not refer to the same event. Source client identifier: %{public}@. Other source client identifier: %{public}@.");
  OUTLINED_FUNCTION_1_0();
}

@end
