@implementation CALNCalendarResourceChangedNotificationSource

- (CALNCalendarResourceChangedNotificationSource)initWithDataSource:(id)a3 notificationManager:(id)a4 iconIdentifierProvider:(id)a5 sourceEventRepresentationProvider:(id)a6 dateProvider:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  CALNCalendarResourceChangedNotificationSource *v18;
  CALNCalendarResourceChangedNotificationSource *v19;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CALNCalendarResourceChangedNotificationSource;
  v18 = -[CALNCalendarResourceChangedNotificationSource init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_dataSource, a3);
    objc_storeWeak((id *)&v19->_notificationManager, v14);
    objc_storeStrong((id *)&v19->_iconIdentifierProvider, a5);
    objc_storeStrong((id *)&v19->_sourceEventRepresentationProvider, a6);
    objc_storeStrong((id *)&v19->_dateProvider, a7);
  }

  return v19;
}

- (NSString)sourceIdentifier
{
  return (NSString *)CFSTR("com.apple.calendar.notifications.CalendarResourceChanged");
}

- (NSArray)categories
{
  if (categories_onceToken_6 != -1)
    dispatch_once(&categories_onceToken_6, &__block_literal_global_22);
  return (NSArray *)(id)categories_categories_6;
}

void __59__CALNCalendarResourceChangedNotificationSource_categories__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  +[CALNBundle bundle](CALNBundle, "bundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("notification.hiddenPreviewsBodyPlaceholder.resourceChange"), CFSTR("Shared Event Change"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationCategory categoryWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:](CALNNotificationCategory, "categoryWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:", CFSTR("CALNResourceChangedCategoryIdentifier"), MEMORY[0x24BDBD1A8], v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)categories_categories_6;
  categories_categories_6 = v3;

}

- (void)refreshNotifications:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  CALNNotificationRecord *v14;
  void *v15;
  CALNNotificationRecord *v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  const char *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CALNCalendarResourceChangedNotificationSource dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v4;
  objc_msgSend(v5, "fetchCalendarResourceChangedNotificationSourceClientIdentifiers:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x2199F1FA0]();
        -[CALNCalendarResourceChangedNotificationSource contentForNotificationWithSourceClientIdentifier:](self, "contentForNotificationWithSourceClientIdentifier:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = [CALNNotificationRecord alloc];
          -[CALNCalendarResourceChangedNotificationSource sourceIdentifier](self, "sourceIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[CALNNotificationRecord initWithSourceIdentifier:sourceClientIdentifier:content:](v14, "initWithSourceIdentifier:sourceClientIdentifier:content:", v15, v11, v13);

          objc_msgSend(v25, "addObject:", v16);
        }

        objc_autoreleasePoolPop(v12);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v8);
  }

  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v23)
  {
    if (v18)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v19;
      v20 = "Refreshed calendar resource changed notifications in response to database change. Found %{public}@ notificat"
            "ions for changed objects.";
LABEL_15:
      _os_log_impl(&dword_215D9B000, v17, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);

    }
  }
  else if (v18)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v19;
    v20 = "Refreshed calendar resource changed notifications. Found %{public}@ notifications.";
    goto LABEL_15;
  }

  -[CALNCalendarResourceChangedNotificationSource notificationManager](self, "notificationManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNCalendarResourceChangedNotificationSource sourceIdentifier](self, "sourceIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationRecordsDiffApplier refreshNotificationManager:withNotificationRecords:forSourceWithIdentifier:filteredBySourceClientIDs:](CALNNotificationRecordsDiffApplier, "refreshNotificationManager:withNotificationRecords:forSourceWithIdentifier:filteredBySourceClientIDs:", v21, v25, v22, v23);

}

- (id)contentForNotificationWithSourceClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  -[CALNCalendarResourceChangedNotificationSource dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchCalendarResourceChangedNotificationWithSourceClientIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CALNCalendarResourceChangedNotificationSource contentForNotificationWithInfo:](self, "contentForNotificationWithInfo:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CALNCalendarResourceChangedNotificationSource contentForNotificationWithSourceClientIdentifier:].cold.1((uint64_t)v4, v8);

    v7 = 0;
  }

  return v7;
}

- (id)contentForNotificationWithInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
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
  NSObject *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[CALNBundle bundle](CALNBundle, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationSound soundWithAlertType:alertTopic:](CALNNotificationSound, "soundWithAlertType:alertTopic:", 10, CFSTR("com.apple.mobilecal.bulletin-subsection.resourceChanges"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v4, "calendarNotification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v37)
  {
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Shared Calendar Change"), &stru_24D4856D0, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "date");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v36)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "allDay");
  -[CALNCalendarResourceChangedNotificationSource dateProvider](self, "dateProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNDateStringUtils dateTimeStringForEventDate:alwaysIncludeDate:allDayEvent:dateProvider:](CALNDateStringUtils, "dateTimeStringForEventDate:alwaysIncludeDate:allDayEvent:dateProvider:", v8, 1, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  CUIKMessageStringForNotification();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  if (v11 && objc_msgSend(v11, "length"))
    objc_msgSend(v13, "appendString:", v11);
  if (v12 && objc_msgSend(v12, "length"))
  {
    if (objc_msgSend(v13, "length"))
      objc_msgSend(v13, "appendString:", CFSTR("\n"));
    objc_msgSend(v13, "appendString:", v12);
  }
  v33 = v12;
  v34 = v5;
  objc_msgSend(v6, "setTitle:", v37);
  objc_msgSend(v6, "setBody:", v13);
  objc_msgSend(v6, "setCategoryIdentifier:", CFSTR("CALNResourceChangedCategoryIdentifier"));
  objc_msgSend(v6, "setSectionIdentifier:", CFSTR("com.apple.mobilecal.bulletin-subsection.resourceChanges"));
  objc_msgSend(v4, "launchURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDefaultActionURL:", v14);

  objc_msgSend(v6, "setSound:", v35);
  -[CALNCalendarResourceChangedNotificationSource iconIdentifierProvider](self, "iconIdentifierProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifierForIconWithDate:inCalendar:", v36, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIconIdentifier:", v17);

  objc_msgSend(v6, "setInterruptionLevel:", 1);
  objc_msgSend(v7, "calendar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "calendarIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFilterCriteria:", v19);

  if (objc_msgSend(v4, "isDelegate"))
  {
    objc_msgSend(v4, "sourceTitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sourceIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[CALNNotificationSourceUtils updateSubtitleAndThreadIdentifierOnNotificationContent:forDelegateSourceWithTitle:identifier:](CALNNotificationSourceUtils, "updateSubtitleAndThreadIdentifierOnNotificationContent:forDelegateSourceWithTitle:identifier:", v6, v20, v21);

  }
  v22 = v11;
  if (objc_msgSend(v4, "changeType") != 3)
  {
    objc_msgSend(v4, "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDate:", v23);

  }
  objc_msgSend(v6, "setShouldHideTime:", objc_msgSend(v4, "allDay"));
  -[CALNCalendarResourceChangedNotificationSource sourceEventRepresentationProvider](self, "sourceEventRepresentationProvider");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeZone");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "eventRepresentationDictionaryForResourceChangeNotification:message:date:endDate:timeZone:", v7, v13, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
    +[CALNEventRepresentationSourceUtils setEventRepresentationDictionary:onNotificationContent:](CALNEventRepresentationSourceUtils, "setEventRepresentationDictionary:onNotificationContent:", v28, v6);
  +[CALNNotificationFilterUtils setFilterIdentifierForEKCalendarNotification:onNotificationContent:](CALNNotificationFilterUtils, "setFilterIdentifierForEKCalendarNotification:onNotificationContent:", v7, v6);
  +[CALNLegacyIdentifierUtils setLegacyIdentifierForCalendarNotification:onNotificationContent:](CALNLegacyIdentifierUtils, "setLegacyIdentifierForCalendarNotification:onNotificationContent:", v7, v6);
  if (objc_msgSend(v4, "changeType") != 3)
    +[CALNResourceChangedLaunchUtils setResourceChangedEventURLForCalendarNotification:onNotificationContent:](CALNResourceChangedLaunchUtils, "setResourceChangedEventURLForCalendarNotification:onNotificationContent:", v7, v6);
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "sourceClientIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v39 = v30;
    v40 = 2112;
    v41 = v6;
    _os_log_impl(&dword_215D9B000, v29, OS_LOG_TYPE_DEFAULT, "Fetched calendar resource changed notification with sourceClientIdentifier %{public}@. Content: %@", buf, 0x16u);

  }
  v31 = (void *)objc_msgSend(v6, "copy");

  return v31;
}

- (void)didReceiveResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "actionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sourceClientIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_215D9B000, v8, OS_LOG_TYPE_DEFAULT, "Received notification response for calendar resource changed %{public}@ with actionIdentifier = %{public}@", (uint8_t *)&v10, 0x16u);
  }

  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.CALNNotificationDefaultActionIdentifier")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.CALNNotificationDismissActionIdentifier")))
  {
    -[CALNCalendarResourceChangedNotificationSource dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clearCalendarResourceChangedNotificationWithSourceClientIdentifier:", v7);

  }
}

- (CALNCalendarResourceChangedNotificationDataSource)dataSource
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

- (CalDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_sourceEventRepresentationProvider, 0);
  objc_storeStrong((id *)&self->_iconIdentifierProvider, 0);
  objc_destroyWeak((id *)&self->_notificationManager);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (void)contentForNotificationWithSourceClientIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_215D9B000, a2, OS_LOG_TYPE_ERROR, "Failed to get content for calendar resource changed notification with sourceClientIdentifier = %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
