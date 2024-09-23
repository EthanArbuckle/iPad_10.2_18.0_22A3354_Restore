@implementation CALNSharedCalendarInvitationNotificationSource

- (CALNSharedCalendarInvitationNotificationSource)initWithDataSource:(id)a3 notificationManager:(id)a4 iconIdentifierProvider:(id)a5 sourceEventRepresentationProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CALNSharedCalendarInvitationNotificationSource *v15;
  CALNSharedCalendarInvitationNotificationSource *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CALNSharedCalendarInvitationNotificationSource;
  v15 = -[CALNSharedCalendarInvitationNotificationSource init](&v18, sel_init);
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
  return (NSString *)CFSTR("com.apple.calendar.notifications.SharedCalendarInvitation");
}

- (NSArray)categories
{
  if (categories_onceToken_1 != -1)
    dispatch_once(&categories_onceToken_1, &__block_literal_global_3);
  return (NSArray *)(id)categories_categories_1;
}

void __60__CALNSharedCalendarInvitationNotificationSource_categories__block_invoke()
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
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  +[CALNBundle bundle](CALNBundle, "bundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("notification.hiddenPreviewsBodyPlaceholder.calendar.invitation"), CFSTR("Invitation"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("SharedCalendarInvitationJoinButton"), CFSTR("Join"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("SharedCalendarInvitationDeclineButton"), CFSTR("Decline"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("SharedCalendarInvitationReportJunkButton"), CFSTR("Report Junk"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationAction actionWithIdentifier:title:systemImageName:](CALNNotificationAction, "actionWithIdentifier:title:systemImageName:", CFSTR("CALNSharedCalendarInvitationJoinActionIdentifier"), v13, CFSTR("checkmark.circle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationAction actionWithIdentifier:title:systemImageName:](CALNNotificationAction, "actionWithIdentifier:title:systemImageName:", CFSTR("CALNNotificationDeclineAction"), v12, CFSTR("xmark.circle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationAction actionWithIdentifier:title:systemImageName:](CALNNotificationAction, "actionWithIdentifier:title:systemImageName:", CFSTR("CALNNotificationReportJunkCalendarAction"), v11, CFSTR("bin.xmark"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v2;
  v16[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationCategory categoryWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:](CALNNotificationCategory, "categoryWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:", CFSTR("CALNSharedCalendarInvitationDefaultCategory"), v5, v1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v15[1] = v3;
  v15[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationCategory categoryWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:](CALNNotificationCategory, "categoryWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:", CFSTR("CALNSharedCalendarInvitationCouldBeJunkCategory"), v7, v1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)categories_categories_1;
  categories_categories_1 = v9;

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
  -[CALNSharedCalendarInvitationNotificationSource dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v4;
  objc_msgSend(v5, "fetchSharedCalendarInvitationNotificationSourceClientIdentifiers:", v4);
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
        -[CALNSharedCalendarInvitationNotificationSource contentForNotificationWithSourceClientIdentifier:](self, "contentForNotificationWithSourceClientIdentifier:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = [CALNNotificationRecord alloc];
          -[CALNSharedCalendarInvitationNotificationSource sourceIdentifier](self, "sourceIdentifier");
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
      v20 = "Refreshed shared calendar invitation notifications in response to database change. Found %{public}@ notifica"
            "tions for changed objects.";
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
    v20 = "Refreshed shared calendar invitation notifications. Found %{public}@ notifications.";
    goto LABEL_15;
  }

  -[CALNSharedCalendarInvitationNotificationSource notificationManager](self, "notificationManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNSharedCalendarInvitationNotificationSource sourceIdentifier](self, "sourceIdentifier");
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
  -[CALNSharedCalendarInvitationNotificationSource dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchSharedCalendarInvitationNotificationWithSourceClientIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CALNSharedCalendarInvitationNotificationSource contentForNotificationWithInfo:](self, "contentForNotificationWithInfo:", v6);
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
  id v3;
  void *v4;
  void *v5;
  int v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
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
  NSObject *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[CALNBundle bundle](CALNBundle, "bundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendarNotification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationSound soundWithAlertType:alertTopic:](CALNNotificationSound, "soundWithAlertType:alertTopic:", 10, CFSTR("com.apple.mobilecal.bulletin-subsection.invitations"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "couldBeJunk");
  v7 = CFSTR("CALNSharedCalendarInvitationDefaultCategory");
  if (v6)
    v7 = CFSTR("CALNSharedCalendarInvitationCouldBeJunkCategory");
  v8 = v7;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v5, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Shared Calendar Invitation"), &stru_24D4856D0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Invitation to share a calendar with %@."), &stru_24D4856D0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v11;
  v35 = v4;
  if (objc_msgSend(v5, "couldBeJunk"))
  {
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Unknown Sender"), &stru_24D4856D0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CALNNotificationSourceUtils displayNameForJunkIdentity:](CALNNotificationSourceUtils, "displayNameForJunkIdentity:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", CFSTR("%@\n%@"), v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0;
  }
  else
  {
    CUIKDisplayStringForNotificationIdentity();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v11, v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "setTitle:", v10);
  objc_msgSend(v9, "setBody:", v15);
  objc_msgSend(v9, "setCategoryIdentifier:", v8);

  objc_msgSend(v9, "setSectionIdentifier:", CFSTR("com.apple.mobilecal.bulletin-subsection.invitations"));
  CUIKLaunchURLForInbox();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDefaultActionURL:", v18);

  objc_msgSend(v9, "setSound:", v37);
  -[CALNSharedCalendarInvitationNotificationSource iconIdentifierProvider](self, "iconIdentifierProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "identifierForIconWithDate:inCalendar:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIconIdentifier:", v22);

  objc_msgSend(v9, "setInterruptionLevel:", 1);
  objc_msgSend(v5, "calendar");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "calendarIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFilterCriteria:", v24);

  if (objc_msgSend(v3, "isDelegate"))
  {
    objc_msgSend(v3, "sourceTitle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sourceIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[CALNNotificationSourceUtils updateSubtitleAndThreadIdentifierOnNotificationContent:forDelegateSourceWithTitle:identifier:](CALNNotificationSourceUtils, "updateSubtitleAndThreadIdentifierOnNotificationContent:forDelegateSourceWithTitle:identifier:", v9, v25, v26);

  }
  if (v16)
  {
    v42[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPeopleIdentifiers:", v27);

  }
  -[CALNSharedCalendarInvitationNotificationSource sourceEventRepresentationProvider](self, "sourceEventRepresentationProvider");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "eventRepresentationDictionaryForSharedCalendarInvitationNotificationWithTitle:message:", v10, v15);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
    +[CALNEventRepresentationSourceUtils setEventRepresentationDictionary:onNotificationContent:](CALNEventRepresentationSourceUtils, "setEventRepresentationDictionary:onNotificationContent:", v29, v9);
  +[CALNNotificationFilterUtils setFilterIdentifierForEKCalendarNotification:onNotificationContent:](CALNNotificationFilterUtils, "setFilterIdentifierForEKCalendarNotification:onNotificationContent:", v5, v9);
  +[CALNLegacyIdentifierUtils setLegacyIdentifierForCalendarNotification:onNotificationContent:](CALNLegacyIdentifierUtils, "setLegacyIdentifierForCalendarNotification:onNotificationContent:", v5, v9);
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "sourceClientIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v39 = v31;
    v40 = 2112;
    v41 = v9;
    _os_log_impl(&dword_215D9B000, v30, OS_LOG_TYPE_DEFAULT, "Fetched shared calendar invitation notification with sourceClientIdentifier %{public}@. Content: %@", buf, 0x16u);

  }
  v32 = (void *)objc_msgSend(v9, "copy");

  return v32;
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
    _os_log_impl(&dword_215D9B000, v8, OS_LOG_TYPE_DEFAULT, "Received notification response for shared calendar invitation %{public}@ with actionIdentifier = %{public}@", (uint8_t *)&v10, 0x16u);
  }

  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.CALNNotificationDefaultActionIdentifier")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.CALNNotificationDismissActionIdentifier")))
  {
    -[CALNSharedCalendarInvitationNotificationSource dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clearSharedCalendarInvitationWithSourceClientIdentifier:", v7);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("CALNSharedCalendarInvitationJoinActionIdentifier")))
  {
    -[CALNSharedCalendarInvitationNotificationSource dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "joinSharedCalendarWithSourceClientIdentifier:", v7);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("CALNNotificationDeclineAction")))
  {
    -[CALNSharedCalendarInvitationNotificationSource dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "declineSharedCalendarWithSourceClientIdentifier:", v7);
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("CALNNotificationReportJunkCalendarAction")))
      goto LABEL_7;
    -[CALNSharedCalendarInvitationNotificationSource dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reportSharedCalendarAsJunkWithSourceClientIdentifier:", v7);
  }

LABEL_7:
}

- (CALNSharedCalendarInvitationNotificationDataSource)dataSource
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

+ (id)joinActionIdentifier
{
  return CFSTR("CALNSharedCalendarInvitationJoinActionIdentifier");
}

+ (id)declineActionIdentifier
{
  return CFSTR("CALNNotificationDeclineAction");
}

+ (id)reportJunkActionIdentifier
{
  return CFSTR("CALNNotificationReportJunkCalendarAction");
}

+ (id)categoryIdentifierWithoutReportJunk
{
  return CFSTR("CALNSharedCalendarInvitationDefaultCategory");
}

+ (id)categoryIdentifierWithReportJunk
{
  return CFSTR("CALNSharedCalendarInvitationCouldBeJunkCategory");
}

@end
