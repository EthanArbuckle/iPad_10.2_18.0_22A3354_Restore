@implementation CALNEventInvitationNotificationSource

- (CALNEventInvitationNotificationSource)initWithDataSource:(id)a3 notificationManager:(id)a4 iconIdentifierProvider:(id)a5 dateProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CALNEventInvitationNotificationSource *v15;
  CALNEventInvitationNotificationSource *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CALNEventInvitationNotificationSource;
  v15 = -[CALNEventInvitationNotificationSource init](&v18, sel_init);
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
  return (NSString *)CFSTR("com.apple.calendar.notifications.EventInvitation");
}

- (NSArray)categories
{
  if (categories_onceToken_0 != -1)
    dispatch_once(&categories_onceToken_0, &__block_literal_global_2);
  return (NSArray *)(id)categories_categories_0;
}

void __51__CALNEventInvitationNotificationSource_categories__block_invoke()
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
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[4];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  +[CALNBundle bundle](CALNBundle, "bundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("notification.hiddenPreviewsBodyPlaceholder.event.invitation"), CFSTR("Invitation"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("EventInvitationNotificationAcceptButton"), CFSTR("Accept"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("EventInvitationNotificationDeclineButton"), CFSTR("Decline"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("EventInvitationNotificationMaybeButton"), CFSTR("Maybe"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("EventInvitationNotificationReportJunkButton"), CFSTR("Report Junk"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationAction actionWithIdentifier:title:systemImageName:](CALNNotificationAction, "actionWithIdentifier:title:systemImageName:", CFSTR("CALNNotificationAcceptAction"), v15, CFSTR("checkmark.circle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationAction actionWithIdentifier:title:systemImageName:](CALNNotificationAction, "actionWithIdentifier:title:systemImageName:", CFSTR("CALNNotificationDeclineAction"), v14, CFSTR("xmark.circle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationAction actionWithIdentifier:title:systemImageName:](CALNNotificationAction, "actionWithIdentifier:title:systemImageName:", CFSTR("CALNNotificationMaybeAction"), v13, CFSTR("questionmark.circle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationAction actionWithIdentifier:title:systemImageName:](CALNNotificationAction, "actionWithIdentifier:title:systemImageName:", CFSTR("CALNNotificationReportJunkEventAction"), v12, CFSTR("bin.xmark"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v2;
  v18[1] = v3;
  v18[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  v17[1] = v2;
  v17[2] = v3;
  v17[3] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationCategory categoryWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:](CALNNotificationCategory, "categoryWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:", CFSTR("EventInvitation.CanRespond"), v6, v1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationCategory categoryWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:](CALNNotificationCategory, "categoryWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:", CFSTR("EventInvitation.CouldBeJunk"), v7, v1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)categories_categories_0;
  categories_categories_0 = v10;

}

- (id)contentForNotificationWithSourceClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  -[CALNEventInvitationNotificationSource dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchEventInvitationNotificationWithSourceClientIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CALNEventInvitationNotificationSource contentForNotificationWithInfo:](self, "contentForNotificationWithInfo:", v6);
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
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
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
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v39;
  void *v40;
  void *v41;
  id v42;
  const __CFString *v43;
  void *v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "eventInvitationNotification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "sourceClientIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invitedBy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v47 = v7;
    v48 = 2112;
    v49 = v8;
    v50 = 2112;
    v51 = v9;
    v52 = 2112;
    v53 = v10;
    v54 = 1024;
    v55 = objc_msgSend(v5, "type");
    v56 = 2112;
    v57 = v5;
    _os_log_impl(&dword_215D9B000, v6, OS_LOG_TYPE_INFO, "Fetching event invitation notification content with sourceClientIdentifier %{public}@. InvitedBy: %@. StartDate: %@. Location: %@. EKCalendarNotificationType: %d. EventInvitationNotification: %@", buf, 0x3Au);

  }
  +[CALNBundle bundle](CALNBundle, "bundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("EventInvitationNotificationDefaultTitle"), CFSTR("Invitation"), 0);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v40 = v11;
  v41 = (void *)v12;
  v42 = 0;
  -[CALNEventInvitationNotificationSource _notificationBodyForNotificationInfo:contactIdentifier:](self, "_notificationBodyForNotificationInfo:contactIdentifier:", v4, &v42);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v42;
  if (objc_msgSend(v5, "couldBeJunk"))
    v14 = CFSTR("EventInvitation.CouldBeJunk");
  else
    v14 = CFSTR("EventInvitation.CanRespond");
  +[CALNNotificationSound soundWithAlertType:alertTopic:](CALNNotificationSound, "soundWithAlertType:alertTopic:", 10, CFSTR("com.apple.mobilecal.bulletin-subsection.invitations"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNEventInvitationNotificationSource iconIdentifierProvider](self, "iconIdentifierProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identifierForIconWithDate:inCalendar:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v41;
  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "setTitle:", v41);
  objc_msgSend(v21, "setBody:", v13);
  objc_msgSend(v21, "setCategoryIdentifier:", v14);
  objc_msgSend(v21, "setSectionIdentifier:", CFSTR("com.apple.mobilecal.bulletin-subsection.invitations"));
  objc_msgSend(v5, "startDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDate:", v22);

  objc_msgSend(v4, "expirationDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setExpirationDate:", v23);

  objc_msgSend(v4, "launchURL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDefaultActionURL:", v24);

  objc_msgSend(v21, "setIconIdentifier:", v19);
  objc_msgSend(v21, "setShouldHideTime:", objc_msgSend(v5, "isAllDay"));
  objc_msgSend(v21, "setSound:", v15);
  if (objc_msgSend(v5, "cuik_isTimeSensitive"))
    v25 = 2;
  else
    v25 = 1;
  objc_msgSend(v21, "setInterruptionLevel:", v25);
  objc_msgSend(v5, "calendar");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "calendarIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFilterCriteria:", v27);

  if (objc_msgSend(v4, "isDelegate"))
  {
    objc_msgSend(v4, "sourceTitle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sourceIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[CALNNotificationSourceUtils updateSubtitleAndThreadIdentifierOnNotificationContent:forDelegateSourceWithTitle:identifier:](CALNNotificationSourceUtils, "updateSubtitleAndThreadIdentifierOnNotificationContent:forDelegateSourceWithTitle:identifier:", v21, v28, v29);

    v20 = v41;
  }
  if (v39)
  {
    v45 = v39;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setPeopleIdentifiers:", v30);

  }
  objc_msgSend(v4, "eventURI");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = CFSTR("entityID");
  v44 = v31;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setUserInfo:", v32);

  objc_msgSend(v4, "eventRepresentationDictionary");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend(v4, "eventRepresentationDictionary");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[CALNEventRepresentationSourceUtils setEventRepresentationDictionary:onNotificationContent:](CALNEventRepresentationSourceUtils, "setEventRepresentationDictionary:onNotificationContent:", v34, v21);

  }
  +[CALNNotificationFilterUtils setFilterIdentifierForEKCalendarNotification:onNotificationContent:](CALNNotificationFilterUtils, "setFilterIdentifierForEKCalendarNotification:onNotificationContent:", v5, v21);
  +[CALNLegacyIdentifierUtils setLegacyIdentifierForCalendarNotification:onNotificationContent:](CALNLegacyIdentifierUtils, "setLegacyIdentifierForCalendarNotification:onNotificationContent:", v5, v21);
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "sourceClientIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = v36;
    v48 = 2112;
    v49 = v21;
    _os_log_impl(&dword_215D9B000, v35, OS_LOG_TYPE_DEFAULT, "Fetched event invitation notification with sourceClientIdentifier %{public}@. Content: %@", buf, 0x16u);

  }
  v37 = (void *)objc_msgSend(v21, "copy");

  return v37;
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
  -[CALNEventInvitationNotificationSource dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v4;
  objc_msgSend(v5, "fetchEventInvitationNotificationSourceClientIdentifiers:", v4);
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
        -[CALNEventInvitationNotificationSource contentForNotificationWithSourceClientIdentifier:](self, "contentForNotificationWithSourceClientIdentifier:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = [CALNNotificationRecord alloc];
          -[CALNEventInvitationNotificationSource sourceIdentifier](self, "sourceIdentifier");
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
      v20 = "Refreshed event invitation notifications in response to database change. Found %{public}@ notifications for "
            "changed objects.";
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
    v20 = "Refreshed event invitation notifications. Found %{public}@ notifications.";
    goto LABEL_15;
  }

  -[CALNEventInvitationNotificationSource notificationManager](self, "notificationManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNEventInvitationNotificationSource sourceIdentifier](self, "sourceIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationRecordsDiffApplier refreshNotificationManager:withNotificationRecords:forSourceWithIdentifier:filteredBySourceClientIDs:](CALNNotificationRecordsDiffApplier, "refreshNotificationManager:withNotificationRecords:forSourceWithIdentifier:filteredBySourceClientIDs:", v21, v25, v22, v23);

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
    _os_log_impl(&dword_215D9B000, v8, OS_LOG_TYPE_DEFAULT, "Received notification response for event invitation %{public}@ with actionIdentifier = %{public}@", (uint8_t *)&v10, 0x16u);
  }

  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.CALNNotificationDefaultActionIdentifier")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.CALNNotificationDismissActionIdentifier")))
  {
    -[CALNEventInvitationNotificationSource dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clearEventInvitationWithSourceClientIdentifier:", v7);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("CALNNotificationAcceptAction")))
  {
    -[CALNEventInvitationNotificationSource dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "acceptEventInvitationWithSourceClientIdentifier:", v7);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("CALNNotificationDeclineAction")))
  {
    -[CALNEventInvitationNotificationSource dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "declineEventInvitationWithSourceClientIdentifier:", v7);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("CALNNotificationMaybeAction")))
  {
    -[CALNEventInvitationNotificationSource dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tentativeAcceptEventInvitationWithSourceClientIdentifier:", v7);
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("CALNNotificationReportJunkEventAction")))
      goto LABEL_7;
    -[CALNEventInvitationNotificationSource dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reportEventInvitationAsJunkWithSourceClientIdentifier:", v7);
  }

LABEL_7:
}

- (id)_notificationBodyForNotificationInfo:(id)a3 contactIdentifier:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
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
  void *v31;
  uint64_t v32;
  int v33;
  const __CFString *v34;
  const __CFString *v35;
  void *v36;
  NSObject *v37;
  id v38;
  uint8_t buf[4];
  _BOOL4 v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  *a4 = 0;
  v38 = v6;
  objc_msgSend(v6, "eventInvitationNotification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "type");
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110656;
    v40 = v8 == 1;
    v41 = 1024;
    v42 = objc_msgSend(v7, "timeChanged");
    v43 = 1024;
    v44 = objc_msgSend(v7, "dateChanged");
    v45 = 1024;
    v46 = objc_msgSend(v7, "titleChanged");
    v47 = 1024;
    v48 = objc_msgSend(v7, "locationChanged");
    v49 = 1024;
    v50 = objc_msgSend(v7, "videoConferenceChanged");
    v51 = 1024;
    v52 = objc_msgSend(v7, "recurrenceChanged");
    _os_log_impl(&dword_215D9B000, v9, OS_LOG_TYPE_INFO, "Generating Notification Body For Notification Info. isModification: %d. timeChanged: %d, dateChanged: %d, titleChanged: %d, locationChanged: %d, videoConferenceChanged: %d, recurrenceChanged: %d", buf, 0x2Cu);
  }

  objc_msgSend(v7, "startDateForNextOccurrence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(v7, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = objc_msgSend(v7, "isAllDay");
  -[CALNEventInvitationNotificationSource dateProvider](self, "dateProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNDateStringUtils dateTimeStringForEventDate:alwaysIncludeDate:allDayEvent:dateProvider:](CALNDateStringUtils, "dateTimeStringForEventDate:alwaysIncludeDate:allDayEvent:dateProvider:", v11, 1, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  +[CALNBundle bundle](CALNBundle, "bundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == 1)
  {
    if (objc_msgSend(v7, "timeChanged"))
    {
      v17 = CFSTR("Time changed to %@");
LABEL_14:
      objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_24D4856D0, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v20, v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v21);
LABEL_15:

LABEL_16:
      v18 = 0;
LABEL_17:
      v22 = 0;
LABEL_24:

      goto LABEL_25;
    }
    if (objc_msgSend(v7, "dateChanged"))
    {
      v17 = CFSTR("Date changed to %@");
      goto LABEL_14;
    }
    if (objc_msgSend(v7, "titleChanged"))
    {
      objc_msgSend(v7, "title");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Title changed to %@"), &stru_24D4856D0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v21, v20);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v31);

      goto LABEL_15;
    }
    if (!objc_msgSend(v7, "locationChanged"))
    {
      if (objc_msgSend(v7, "videoConferenceChanged"))
      {
        v35 = CFSTR("Video Call updated");
      }
      else if (objc_msgSend(v7, "recurrenceChanged"))
      {
        v35 = CFSTR("Repeat frequency or end date changed");
      }
      else
      {
        +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          -[CALNEventInvitationNotificationSource _notificationBodyForNotificationInfo:contactIdentifier:].cold.1(v37);

        v35 = CFSTR("Invitation updated");
      }
      objc_msgSend(v15, "localizedStringForKey:value:table:", v35, &stru_24D4856D0, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v20);
      goto LABEL_16;
    }
    objc_msgSend(v7, "location");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v20, "length");
    v33 = objc_msgSend(v7, "videoConferenceChanged");
    if (v32)
    {
      if (!v33)
      {
        objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Location changed to %@"), &stru_24D4856D0, 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v36, v20);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_49:
        objc_msgSend(v16, "addObject:", v18);
        goto LABEL_17;
      }
      v34 = CFSTR("Location changed and Video Call updated");
    }
    else if (v33)
    {
      v34 = CFSTR("Location removed and Video Call updated");
    }
    else
    {
      v34 = CFSTR("Location removed");
    }
    objc_msgSend(v15, "localizedStringForKey:value:table:", v34, &stru_24D4856D0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_49;
  }
  objc_msgSend(v7, "location");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Invitation From %@"), &stru_24D4856D0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "couldBeJunk"))
    +[CALNNotificationSourceUtils displayNameForJunkIdentity:](CALNNotificationSourceUtils, "displayNameForJunkIdentity:", v7);
  else
    CUIKDisplayStringForNotificationIdentity();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v19, v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v22);
  objc_msgSend(v16, "addObject:", v14);
  if (objc_msgSend(v18, "length"))
    objc_msgSend(v16, "addObject:", v18);

  if (v22 && objc_msgSend(v7, "couldBeJunk"))
  {
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Unknown Sender"), &stru_24D4856D0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "insertObject:atIndex:", v20, 0);
    goto LABEL_24;
  }
LABEL_25:
  objc_msgSend(v38, "conflictDetails");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_msgSend(MEMORY[0x24BE14830], "sharedGenerator");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "conflictStringForConflictDetails:maxTitleLength:", v24, 20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v26, "length"))
      objc_msgSend(v16, "addObject:", v26);

  }
  objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringByTrimmingCharactersInSet:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (CALNEventInvitationNotificationDataSource)dataSource
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

+ (id)defaultCategoryIdentifier
{
  return CFSTR("EventInvitation.CanRespond");
}

+ (id)couldBeJunkCategoryIdentifier
{
  return CFSTR("EventInvitation.CouldBeJunk");
}

+ (id)acceptActionIdentifier
{
  return CFSTR("CALNNotificationAcceptAction");
}

+ (id)maybeActionIdentifier
{
  return CFSTR("CALNNotificationMaybeAction");
}

+ (id)declineActionIdentifier
{
  return CFSTR("CALNNotificationDeclineAction");
}

+ (id)reportJunkActionIdentifier
{
  return CFSTR("CALNNotificationReportJunkEventAction");
}

- (void)contentForNotificationWithSourceClientIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_215D9B000, a2, OS_LOG_TYPE_ERROR, "Failed to get notification info for sourceClientIdentifier (%{public}@)", (uint8_t *)&v2, 0xCu);
}

- (void)_notificationBodyForNotificationInfo:(os_log_t)log contactIdentifier:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_215D9B000, log, OS_LOG_TYPE_ERROR, "Error: _notificationBodyForNotificationInfo could not generate a body for notification because the modification type could not be determined.", v1, 2u);
}

@end
