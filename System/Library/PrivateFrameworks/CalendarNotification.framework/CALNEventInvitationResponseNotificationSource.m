@implementation CALNEventInvitationResponseNotificationSource

- (CALNEventInvitationResponseNotificationSource)initWithDataSource:(id)a3 notificationManager:(id)a4 iconIdentifierProvider:(id)a5 dateProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CALNEventInvitationResponseNotificationSource *v15;
  CALNEventInvitationResponseNotificationSource *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CALNEventInvitationResponseNotificationSource;
  v15 = -[CALNEventInvitationResponseNotificationSource init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_dataSource, a3);
    objc_storeWeak((id *)&v16->_notificationManager, v12);
    objc_storeStrong((id *)&v16->_iconIdentifierProvider, a5);
    objc_storeStrong((id *)&v16->_dateProvider, a6);
  }

  return v16;
}

- (NSString)sourceIdentifier
{
  return (NSString *)CFSTR("com.apple.calendar.notifications.EventInvitationResponse");
}

- (NSArray)categories
{
  if (categories_onceToken_7 != -1)
    dispatch_once(&categories_onceToken_7, &__block_literal_global_27);
  return (NSArray *)(id)categories_categories_7;
}

void __59__CALNEventInvitationResponseNotificationSource_categories__block_invoke()
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
  uint64_t v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  +[CALNBundle bundle](CALNBundle, "bundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("notification.hiddenPreviewsBodyPlaceholder.event.invitationResponse"), CFSTR("Invitation Response"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("EventInvitationResponseNotificationAcceptButton"), CFSTR("Accept"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("EventInvitationResponseNotificationDeclineButton"), CFSTR("Decline"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationAction actionWithIdentifier:title:systemImageName:](CALNNotificationAction, "actionWithIdentifier:title:systemImageName:", CFSTR("CALNNotificationAcceptAction"), v2, CFSTR("checkmark.circle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationAction actionWithIdentifier:title:systemImageName:](CALNNotificationAction, "actionWithIdentifier:title:systemImageName:", CFSTR("CALNNotificationDeclineAction"), v3, CFSTR("xmark.circle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v12[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationCategory categoryWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:](CALNNotificationCategory, "categoryWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:", CFSTR("com.apple.calendar.notifications.EventInvitationResponse"), MEMORY[0x24BDBD1A8], v1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationCategory categoryWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:](CALNNotificationCategory, "categoryWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:", CFSTR("EventInvitationResponse.ProposedTime"), v6, v1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)categories_categories_7;
  categories_categories_7 = v9;

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
  -[CALNEventInvitationResponseNotificationSource dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v4;
  objc_msgSend(v5, "fetchEventInvitationResponseNotificationSourceClientIdentifiers:", v4);
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
        -[CALNEventInvitationResponseNotificationSource contentForNotificationWithSourceClientIdentifier:](self, "contentForNotificationWithSourceClientIdentifier:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = [CALNNotificationRecord alloc];
          -[CALNEventInvitationResponseNotificationSource sourceIdentifier](self, "sourceIdentifier");
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
      v20 = "Refreshed event invitation response notifications in response to database change. Found %{public}@ notificat"
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
    v20 = "Refreshed event invitation response notifications. Found %{public}@ notifications.";
    goto LABEL_15;
  }

  -[CALNEventInvitationResponseNotificationSource notificationManager](self, "notificationManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNEventInvitationResponseNotificationSource sourceIdentifier](self, "sourceIdentifier");
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
  -[CALNEventInvitationResponseNotificationSource dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchEventInvitationResponseNotificationWithSourceClientIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CALNEventInvitationResponseNotificationSource contentForNotificationWithInfo:](self, "contentForNotificationWithInfo:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CALNEventInvitationNotificationSource contentForNotificationWithSourceClientIdentifier:].cold.1((uint64_t)v4, v8);

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
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[CALNBundle bundle](CALNBundle, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventInvitationNotification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("EventNotificationDefaultTitleAttendeeReply"), CFSTR("Attendee Response"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32 = v5;
  v33 = 0;
  -[CALNEventInvitationResponseNotificationSource _notificationBodyForNotificationInfo:contactIdentifier:](self, "_notificationBodyForNotificationInfo:contactIdentifier:", v4, &v33);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v33;
  +[CALNNotificationSound soundWithAlertType:alertTopic:](CALNNotificationSound, "soundWithAlertType:alertTopic:", 10, CFSTR("com.apple.mobilecal.bulletin-subsection.Responses"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNEventInvitationResponseNotificationSource iconIdentifierProvider](self, "iconIdentifierProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifierForIconWithDate:inCalendar:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setTitle:", v7);
  objc_msgSend(v14, "setBody:", v8);
  CUIKNewTimeProposerForNotification();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    v16 = CFSTR("EventInvitationResponse.ProposedTime");
  else
    v16 = CFSTR("com.apple.calendar.notifications.EventInvitationResponse");
  objc_msgSend(v14, "setCategoryIdentifier:", v16);
  objc_msgSend(v14, "setSectionIdentifier:", CFSTR("com.apple.mobilecal.bulletin-subsection.Responses"));
  objc_msgSend(v6, "startDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDate:", v17);

  objc_msgSend(v4, "expirationDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setExpirationDate:", v18);

  objc_msgSend(v4, "launchURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDefaultActionURL:", v19);

  objc_msgSend(v14, "setIconIdentifier:", v13);
  objc_msgSend(v14, "setShouldHideTime:", objc_msgSend(v6, "isAllDay"));
  objc_msgSend(v14, "setSound:", v9);
  if (objc_msgSend(v6, "cuik_isTimeSensitive"))
    v20 = 2;
  else
    v20 = 1;
  objc_msgSend(v14, "setInterruptionLevel:", v20);
  objc_msgSend(v6, "calendar");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "calendarIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFilterCriteria:", v22);

  if (objc_msgSend(v4, "isDelegate"))
  {
    objc_msgSend(v4, "sourceTitle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sourceIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[CALNNotificationSourceUtils updateSubtitleAndThreadIdentifierOnNotificationContent:forDelegateSourceWithTitle:identifier:](CALNNotificationSourceUtils, "updateSubtitleAndThreadIdentifierOnNotificationContent:forDelegateSourceWithTitle:identifier:", v14, v23, v24);

  }
  if (v31)
  {
    v38[0] = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPeopleIdentifiers:", v25);

  }
  objc_msgSend(v4, "eventRepresentationDictionary");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    +[CALNEventRepresentationSourceUtils setEventRepresentationDictionary:onNotificationContent:](CALNEventRepresentationSourceUtils, "setEventRepresentationDictionary:onNotificationContent:", v26, v14);
  +[CALNNotificationFilterUtils setFilterIdentifierForEKCalendarNotification:onNotificationContent:](CALNNotificationFilterUtils, "setFilterIdentifierForEKCalendarNotification:onNotificationContent:", v6, v14);
  +[CALNLegacyIdentifierUtils setLegacyIdentifierForCalendarNotification:onNotificationContent:](CALNLegacyIdentifierUtils, "setLegacyIdentifierForCalendarNotification:onNotificationContent:", v6, v14);
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "sourceClientIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v28;
    v36 = 2112;
    v37 = v14;
    _os_log_impl(&dword_215D9B000, v27, OS_LOG_TYPE_DEFAULT, "Fetched event invitation response notification with sourceClientIdentifier %{public}@. Content: %@", buf, 0x16u);

  }
  v29 = (void *)objc_msgSend(v14, "copy");

  return v29;
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
    _os_log_impl(&dword_215D9B000, v8, OS_LOG_TYPE_DEFAULT, "Received notification response for event invitation response %{public}@ with actionIdentifier = %{public}@", (uint8_t *)&v10, 0x16u);
  }

  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.CALNNotificationDefaultActionIdentifier")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.CALNNotificationDismissActionIdentifier")))
  {
    -[CALNEventInvitationResponseNotificationSource dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clearEventInvitationResponseWithSourceClientIdentifier:", v7);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("CALNNotificationAcceptAction")))
  {
    -[CALNEventInvitationResponseNotificationSource dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "acceptEventInvitationResponseWithSourceClientIdentifier:", v7);
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("CALNNotificationDeclineAction")))
      goto LABEL_7;
    -[CALNEventInvitationResponseNotificationSource dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "declineEventInvitationResponseWithSourceClientIdentifier:", v7);
  }

LABEL_7:
}

- (id)_notificationBodyForNotificationInfo:(id)a3 contactIdentifier:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(a3, "eventInvitationNotification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isAllDay");
  -[CALNEventInvitationResponseNotificationSource dateProvider](self, "dateProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNDateStringUtils dateTimeStringForEventDate:alwaysIncludeDate:allDayEvent:dateProvider:](CALNDateStringUtils, "dateTimeStringForEventDate:alwaysIncludeDate:allDayEvent:dateProvider:", v7, 1, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v10);
  CUIKMessageStringForEventInvitationNotification();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v6, "addObject:", v11);
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\n"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (CALNEventInvitationResponseNotificationDataSource)dataSource
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

- (CalDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_iconIdentifierProvider, 0);
  objc_destroyWeak((id *)&self->_notificationManager);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
