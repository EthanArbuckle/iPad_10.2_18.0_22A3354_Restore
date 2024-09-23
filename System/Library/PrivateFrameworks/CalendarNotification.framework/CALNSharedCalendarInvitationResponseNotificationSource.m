@implementation CALNSharedCalendarInvitationResponseNotificationSource

- (CALNSharedCalendarInvitationResponseNotificationSource)initWithDataSource:(id)a3 notificationManager:(id)a4 iconIdentifierProvider:(id)a5 sourceEventRepresentationProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CALNSharedCalendarInvitationResponseNotificationSource *v15;
  CALNSharedCalendarInvitationResponseNotificationSource *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CALNSharedCalendarInvitationResponseNotificationSource;
  v15 = -[CALNSharedCalendarInvitationResponseNotificationSource init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_dataSource, a3);
    objc_storeWeak((id *)&v16->_notificationManager, v12);
    objc_storeStrong((id *)&v16->_iconIdentifierProvider, a5);
    objc_storeStrong((id *)&v16->_sourceEventRepresentationProvider, a6);
  }

  return v16;
}

- (NSString)sourceIdentifier
{
  return (NSString *)CFSTR("com.apple.calendar.notifications.SharedCalendarInvitationResponse");
}

- (NSArray)categories
{
  if (categories_onceToken != -1)
    dispatch_once(&categories_onceToken, &__block_literal_global_1);
  return (NSArray *)(id)categories_categories;
}

void __68__CALNSharedCalendarInvitationResponseNotificationSource_categories__block_invoke()
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
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("notification.hiddenPreviewsBodyPlaceholder.calendar.invitationResponse"), CFSTR("Invitation Response"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationCategory categoryWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:](CALNNotificationCategory, "categoryWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:", CFSTR("CALNSharedInvitationResponseCategoryIdentifier"), MEMORY[0x24BDBD1A8], v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)categories_categories;
  categories_categories = v3;

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
  -[CALNSharedCalendarInvitationResponseNotificationSource dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v4;
  objc_msgSend(v5, "fetchSharedCalendarInvitationResponseNotificationSourceClientIdentifiers:", v4);
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
        -[CALNSharedCalendarInvitationResponseNotificationSource contentForNotificationWithSourceClientIdentifier:](self, "contentForNotificationWithSourceClientIdentifier:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = [CALNNotificationRecord alloc];
          -[CALNSharedCalendarInvitationResponseNotificationSource sourceIdentifier](self, "sourceIdentifier");
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
      v20 = "Refreshed shared calendar invitation response notifications in response to database change. Found %{public}@"
            " notifications for changed objects.";
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
    v20 = "Refreshed shared calendar invitation response notifications. Found %{public}@ notifications.";
    goto LABEL_15;
  }

  -[CALNSharedCalendarInvitationResponseNotificationSource notificationManager](self, "notificationManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNSharedCalendarInvitationResponseNotificationSource sourceIdentifier](self, "sourceIdentifier");
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
  -[CALNSharedCalendarInvitationResponseNotificationSource dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchSharedCalendarInvitationResponseNotificationWithSourceClientIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CALNSharedCalendarInvitationResponseNotificationSource contentForNotificationWithInfo:](self, "contentForNotificationWithInfo:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CALNSharedCalendarInvitationResponseNotificationSource contentForNotificationWithSourceClientIdentifier:].cold.1((uint64_t)v4, v8);

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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[CALNBundle bundle](CALNBundle, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendarNotification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Shared Calendar Invitation"), &stru_24D4856D0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26 = v5;
  CUIKMessageStringForNotification();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationSound soundWithAlertType:alertTopic:](CALNNotificationSound, "soundWithAlertType:alertTopic:", 10, CFSTR("com.apple.mobilecal.bulletin-subsection.Responses"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setTitle:", v7);
  objc_msgSend(v10, "setBody:", v8);
  objc_msgSend(v10, "setCategoryIdentifier:", CFSTR("CALNSharedInvitationResponseCategoryIdentifier"));
  objc_msgSend(v10, "setSectionIdentifier:", CFSTR("com.apple.mobilecal.bulletin-subsection.Responses"));
  v25 = (void *)v9;
  objc_msgSend(v10, "setSound:", v9);
  -[CALNSharedCalendarInvitationResponseNotificationSource iconIdentifierProvider](self, "iconIdentifierProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifierForIconWithDate:inCalendar:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIconIdentifier:", v14);

  objc_msgSend(v10, "setInterruptionLevel:", 1);
  objc_msgSend(v6, "calendar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "calendarIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFilterCriteria:", v16);

  if (objc_msgSend(v4, "isDelegate"))
  {
    objc_msgSend(v4, "sourceTitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sourceIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[CALNNotificationSourceUtils updateSubtitleAndThreadIdentifierOnNotificationContent:forDelegateSourceWithTitle:identifier:](CALNNotificationSourceUtils, "updateSubtitleAndThreadIdentifierOnNotificationContent:forDelegateSourceWithTitle:identifier:", v10, v17, v18);

  }
  -[CALNSharedCalendarInvitationResponseNotificationSource sourceEventRepresentationProvider](self, "sourceEventRepresentationProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "eventRepresentationDictionaryForResponseNotificationWithTitle:message:", v7, v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    +[CALNEventRepresentationSourceUtils setEventRepresentationDictionary:onNotificationContent:](CALNEventRepresentationSourceUtils, "setEventRepresentationDictionary:onNotificationContent:", v20, v10);
  +[CALNNotificationFilterUtils setFilterIdentifierForEKCalendarNotification:onNotificationContent:](CALNNotificationFilterUtils, "setFilterIdentifierForEKCalendarNotification:onNotificationContent:", v6, v10);
  +[CALNLegacyIdentifierUtils setLegacyIdentifierForCalendarNotification:onNotificationContent:](CALNLegacyIdentifierUtils, "setLegacyIdentifierForCalendarNotification:onNotificationContent:", v6, v10);
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "sourceClientIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v22;
    v29 = 2112;
    v30 = v10;
    _os_log_impl(&dword_215D9B000, v21, OS_LOG_TYPE_DEFAULT, "Fetched shared calendar invitation response notification with sourceClientIdentifier %{public}@. Content: %@", buf, 0x16u);

  }
  v23 = (void *)objc_msgSend(v10, "copy");

  return v23;
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
    _os_log_impl(&dword_215D9B000, v8, OS_LOG_TYPE_DEFAULT, "Received notification response for shared calendar invitation response %{public}@ with actionIdentifier = %{public}@", (uint8_t *)&v10, 0x16u);
  }

  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.CALNNotificationDefaultActionIdentifier")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.CALNNotificationDismissActionIdentifier")))
  {
    -[CALNSharedCalendarInvitationResponseNotificationSource dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clearSharedCalendarInvitationResponseWithSourceClientIdentifier:", v7);

  }
}

- (CALNSharedCalendarInvitationResponseNotificationDataSource)dataSource
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

- (void).cxx_destruct
{
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
  _os_log_error_impl(&dword_215D9B000, a2, OS_LOG_TYPE_ERROR, "Failed to get content for shared calendar invitation notification with sourceClientIdentifier = %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
