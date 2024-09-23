@implementation IMDNotificationsController

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1ABB74454;
  block[3] = &unk_1E5AB07F8;
  block[4] = a1;
  if (qword_1ED0D3A78 != -1)
    dispatch_once(&qword_1ED0D3A78, block);
  return (id)qword_1ED0D3A98;
}

+ (id)logger
{
  if (qword_1EEC403C8 != -1)
    dispatch_once(&qword_1EEC403C8, &unk_1E5AAEF88);
  return (id)qword_1EEC403C0;
}

- (IMDNotificationsController)init
{
  IMDNotificationsController *v2;
  IMDNotificationsController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMDNotificationsController;
  v2 = -[IMDNotificationsController init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[IMDNotificationsController _setupFirstLoad](v2, "_setupFirstLoad");
    -[IMDNotificationsController _setUpNotificationCenter](v3, "_setUpNotificationCenter");
    -[IMDNotificationsController _setupCriticalNotifications](v3, "_setupCriticalNotifications");
    -[IMDNotificationsController _setupBusinessNameManager](v3, "_setupBusinessNameManager");
    -[IMDNotificationsController _setupMeContactAndTokens](v3, "_setupMeContactAndTokens");
  }
  return v3;
}

- (void)_setupBusinessNameManager
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D39710], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDNotificationsController setBusinessNameManager:](self, "setBusinessNameManager:", v3);

}

- (UNUserNotificationCenter)notificationCenter
{
  sub_1ABB745CC(1);
  return self->_notificationCenter;
}

- (void)_setUpNotificationCenter
{
  UNUserNotificationCenter *v3;
  UNUserNotificationCenter *notificationCenter;
  id v5;

  v3 = (UNUserNotificationCenter *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEC7A0]), "initWithBundleIdentifier:", CFSTR("com.apple.MobileSMS"));
  notificationCenter = self->_notificationCenter;
  self->_notificationCenter = v3;

  -[IMDNotificationsController _makeNotificationCategories](self, "_makeNotificationCategories");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UNUserNotificationCenter setNotificationCategories:](self->_notificationCenter, "setNotificationCategories:", v5);

}

- (id)_makeNotificationCategories
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = (void *)MEMORY[0x1E0CEC6D0];
  v6 = *MEMORY[0x1E0CBD638];
  v26[0] = *MEMORY[0x1E0CBD630];
  v5 = v26[0];
  v26[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C9AA60];
  objc_msgSend(v4, "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("MessageExtension"), MEMORY[0x1E0C9AA60], v7, 14);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObject:", v24);
  -[IMDNotificationsController madridCategoryWithIdentifier:actions:](self, "madridCategoryWithIdentifier:actions:", CFSTR("MessageExtension-Madrid"), v8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v23);
  -[IMDNotificationsController madridGroupCategoryWithIdentifier:actions:](self, "madridGroupCategoryWithIdentifier:actions:", CFSTR("MessageExtension-MadridGroup"), v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v22);
  -[IMDNotificationsController madridBusinessCategoryWithIdentifier:actions:](self, "madridBusinessCategoryWithIdentifier:actions:", CFSTR("MessageExtension-MadridBusiness"), v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v21);
  -[IMDNotificationsController SMSCategoryWithIdentifier:actions:](self, "SMSCategoryWithIdentifier:actions:", CFSTR("MessageExtension-SMS"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);
  -[IMDNotificationsController noRelayCategoryWithIdentifier:actions:](self, "noRelayCategoryWithIdentifier:actions:", CFSTR("MessageExtension-NoRelay"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);
  -[IMDNotificationsController RCSCategoryWithIdentifier:actions:](self, "RCSCategoryWithIdentifier:actions:", CFSTR("MessageExtension-RCS"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);
  v12 = (void *)MEMORY[0x1E0CEC6D0];
  v25[0] = v5;
  v25[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("MessageExtension-AudioRaise"), v8, v13, 33554446);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObject:", v14);
  +[IMExtensionNotificationManager sharedInstance](IMExtensionNotificationManager, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "notificationCategories");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (void *)v16;
  else
    v18 = v8;
  v19 = v18;

  objc_msgSend(v3, "addObjectsFromArray:", v19);
  return v3;
}

- (void)_setupCriticalNotifications
{
  void *v3;
  int v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCriticalAlertingEnabled");

  if (v4)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = sub_1ABB74B98;
    v5[3] = &unk_1E5AB0868;
    v5[4] = self;
    sub_1ABB74B34(v5);
  }
}

- (id)defaultsSharedInstance
{
  return (id)objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
}

- (void)_setupMeContactAndTokens
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[IMDNotificationsController _IMDContactStore](self, "_IMDContactStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IMMentionContactKeysForMe();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v3, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v4, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  IMMentionMeTokensForContact();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDNotificationsController setMeTokens:](self, "setMeTokens:", v6);
  -[IMDNotificationsController setMeContact:](self, "setMeContact:", v5);

}

- (id)madridCategoryWithIdentifier:(id)a3 actions:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CEC6D0];
  v6 = *MEMORY[0x1E0CBD638];
  v15[0] = *MEMORY[0x1E0CBD630];
  v15[1] = v6;
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("MADRID_MESSAGE_FORMAT"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("SINGLE_SUMMARY_FORMAT"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "categoryWithIdentifier:actions:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:options:", v9, v8, v10, v11, v12, 14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)madridGroupCategoryWithIdentifier:(id)a3 actions:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CEC6D0];
  v6 = *MEMORY[0x1E0CBD638];
  v15[0] = *MEMORY[0x1E0CBD630];
  v15[1] = v6;
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("MADRID_MESSAGE_FORMAT"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("GROUP_SUMMARY_FORMAT"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "categoryWithIdentifier:actions:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:options:", v9, v8, v10, v11, v12, 14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)madridBusinessCategoryWithIdentifier:(id)a3 actions:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CEC6D0];
  v6 = *MEMORY[0x1E0CBD638];
  v15[0] = *MEMORY[0x1E0CBD630];
  v15[1] = v6;
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("MADRID_BUSINESS_MESSAGE_FORMAT"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("SINGLE_SUMMARY_FORMAT"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "categoryWithIdentifier:actions:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:options:", v9, v8, v10, v11, v12, 14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)SMSCategoryWithIdentifier:(id)a3 actions:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CEC6D0];
  v6 = *MEMORY[0x1E0CBD638];
  v15[0] = *MEMORY[0x1E0CBD630];
  v15[1] = v6;
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("TEXT_MESSAGE_FORMAT"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("SINGLE_SUMMARY_FORMAT"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "categoryWithIdentifier:actions:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:options:", v9, v8, v10, v11, v12, 14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)RCSCategoryWithIdentifier:(id)a3 actions:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CEC6D0];
  v6 = *MEMORY[0x1E0CBD638];
  v15[0] = *MEMORY[0x1E0CBD630];
  v15[1] = v6;
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("TEXT_MESSAGE_FORMAT"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("SINGLE_SUMMARY_FORMAT"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "categoryWithIdentifier:actions:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:options:", v9, v8, v10, v11, v12, 14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)noRelayCategoryWithIdentifier:(id)a3 actions:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CEC6D0];
  v6 = *MEMORY[0x1E0CBD638];
  v15[0] = *MEMORY[0x1E0CBD630];
  v15[1] = v6;
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("TEXT_MESSAGE_FORMAT"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("SINGLE_SUMMARY_FORMAT"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "categoryWithIdentifier:actions:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:options:", v9, v8, v10, v11, v12, 14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)_hasMigratedPreferences
{
  return IMGetDomainBoolForKey();
}

- (id)_legacyDatePreference
{
  return (id)IMGetCachedDomainValueForKey();
}

- (int64_t)_legacyRowIDPreference
{
  return IMGetDomainIntForKey();
}

- (int64_t)_legacyDateForMessageWithRowIDPreference:(int64_t)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  v3 = (void *)IMDMessageRecordCopyMessageForRowID(a3);
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "rawDate");
  else
    v5 = -1;

  return v5;
}

- (void)_setLastPostedDateFromMigration:(id)a3
{
  IMSetDomainValueForKey();
}

- (void)_setHasMigratedPreferenceTrue
{
  IMSetDomainBoolForKey();
}

- (void)_migrateLastedPostedPreferencesIfNeeded
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  int64_t v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!-[IMDNotificationsController _hasMigratedPreferences](self, "_hasMigratedPreferences"))
  {
    -[IMDNotificationsController _legacyDatePreference](self, "_legacyDatePreference");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v16 = 138412290;
        v17 = v3;
        _os_log_impl(&dword_1ABB60000, v4, OS_LOG_TYPE_INFO, "We have not migrated the SMSBBPlugin preferences to the new UserNotifications domain...doing so now with last posted date %@", (uint8_t *)&v16, 0xCu);
      }

    }
    if (v3 && objc_msgSend(v3, "integerValue"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          v16 = 138412290;
          v17 = v3;
          _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "We are setting the date to be %@", (uint8_t *)&v16, 0xCu);
        }

      }
      -[IMDNotificationsController _setLastPostedDateFromMigration:](self, "_setLastPostedDateFromMigration:", v3);
    }
    else
    {
      v6 = -[IMDNotificationsController _legacyRowIDPreference](self, "_legacyRowIDPreference");
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "The SMSBBPlugin last posted date was null, so migrating the rowid", (uint8_t *)&v16, 2u);
        }

      }
      if (v6 >= 1)
      {
        v8 = -[IMDNotificationsController _legacyDateForMessageWithRowIDPreference:](self, "_legacyDateForMessageWithRowIDPreference:", v6);
        v9 = IMOSLoggingEnabled();
        if (v8 == -1)
        {
          if (v9)
          {
            OSLogHandleForIMFoundationCategory();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = 138412290;
              v17 = v15;
              _os_log_impl(&dword_1ABB60000, v14, OS_LOG_TYPE_INFO, "lastAlertedMessage is null for the old rowid: %@ -- this device hasn't posted any message notifications", (uint8_t *)&v16, 0xCu);

            }
          }
        }
        else
        {
          if (v9)
          {
            OSLogHandleForIMFoundationCategory();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = 138412546;
              v17 = v11;
              v18 = 2112;
              v19 = v12;
              _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "The last posted rowid is %@ and the date for that message is %@", (uint8_t *)&v16, 0x16u);

            }
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDNotificationsController _setLastPostedDateFromMigration:](self, "_setLastPostedDateFromMigration:", v13);

        }
      }
    }

  }
  -[IMDNotificationsController _setHasMigratedPreferenceTrue](self, "_setHasMigratedPreferenceTrue");
}

- (void)_setupFirstLoad
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t MostRecentMessageDate;
  int64_t v8;
  int64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[IMDNotificationsController _migrateLastedPostedPreferencesIfNeeded](self, "_migrateLastedPostedPreferencesIfNeeded");
  IMGetCachedDomainValueForKey();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  IMGetCachedDomainValueForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "longLongValue");

  MostRecentMessageDate = IMDMessageRecordGetMostRecentMessageDate();
  if (v4 >= MostRecentMessageDate)
    v8 = MostRecentMessageDate;
  else
    v8 = v4;
  if (v6 >= MostRecentMessageDate)
    v9 = MostRecentMessageDate;
  else
    v9 = v6;
  if (MostRecentMessageDate == -1)
  {
    v8 = v4;
    v9 = v6;
  }
  self->_lastAlertedMessageDate = v8;
  self->_lastAlertedFailedMessageDate = v9;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_lastAlertedMessageDate);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_lastAlertedFailedMessageDate);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "Setup first load lastAlertedMessageDate %@ lastAlertedFailedMessageDate %@", (uint8_t *)&v13, 0x16u);

    }
  }
}

- (int64_t)lastAlertedMessageDate
{
  IMDNotificationsController *v2;
  int64_t lastAlertedMessageDate;

  v2 = self;
  objc_sync_enter(v2);
  lastAlertedMessageDate = v2->_lastAlertedMessageDate;
  objc_sync_exit(v2);

  return lastAlertedMessageDate;
}

- (int64_t)lastAlertedFailedMessageDate
{
  IMDNotificationsController *v2;
  int64_t lastAlertedFailedMessageDate;

  v2 = self;
  objc_sync_enter(v2);
  lastAlertedFailedMessageDate = v2->_lastAlertedFailedMessageDate;
  objc_sync_exit(v2);

  return lastAlertedFailedMessageDate;
}

- (void)_storeLastAlertedMessageDate:(int64_t)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1ABB75CB4;
  block[3] = &unk_1E5AB07F8;
  block[4] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_storeLastAlertedFailedMessageDate:(int64_t)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1ABB75D5C;
  block[3] = &unk_1E5AB07F8;
  block[4] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)setLastAlertedMessageDate:(int64_t)a3
{
  IMDNotificationsController *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  v4->_lastAlertedMessageDate = a3;
  -[IMDNotificationsController _storeLastAlertedMessageDate:](v4, "_storeLastAlertedMessageDate:", a3);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4->_lastAlertedMessageDate);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "setting last alerted message date to %@", (uint8_t *)&v7, 0xCu);

    }
  }
  objc_sync_exit(v4);

}

- (void)advanceLastAlertedMessageDate:(int64_t)a3
{
  IMDNotificationsController *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_lastAlertedMessageDate < a3)
    -[IMDNotificationsController setLastAlertedMessageDate:](obj, "setLastAlertedMessageDate:", a3);
  objc_sync_exit(obj);

}

- (void)setLastAlertedFailedMessageDate:(int64_t)a3
{
  IMDNotificationsController *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_lastAlertedFailedMessageDate = a3;
  -[IMDNotificationsController _storeLastAlertedFailedMessageDate:](obj, "_storeLastAlertedFailedMessageDate:", a3);
  objc_sync_exit(obj);

}

- (void)advanceLastAlertedFailedMessageDate:(int64_t)a3
{
  IMDNotificationsController *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_lastAlertedFailedMessageDate < a3)
    -[IMDNotificationsController setLastAlertedFailedMessageDate:](obj, "setLastAlertedFailedMessageDate:", a3);
  objc_sync_exit(obj);

}

- (BOOL)_overrideDNDForMessagesAddressingMe
{
  return IMGetDomainBoolForKeyWithDefaultValue();
}

- (id)_messagesSortedByDate:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &unk_1E5AB08A8);
}

- (id)_messages:(id)a3 newerThanDate:(int64_t)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v4 = (void *)MEMORY[0x1E0CB3880];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1ABB7618C;
  v9[3] = &unk_1E5AB08C8;
  v9[4] = a4;
  v5 = a3;
  objc_msgSend(v4, "predicateWithBlock:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_userNotificationForParticipantChangeMessageRecord:(id)a3
{
  const __CFArray **v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t buf[4];
  NSObject *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = (const __CFArray **)a3;
  v5 = IMDCreateIMItemFromIMDMessageRecord(v4, 0, 1, 0);
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1ABC57698();
    goto LABEL_8;
  }
  if (!objc_msgSend(v5, "changeType"))
  {
    if (objc_msgSend(v5, "isFromMe"))
    {
      IMLogHandleForCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        sub_1ABC576F8();
      goto LABEL_8;
    }
    objc_msgSend(v4, "chatRecord");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      IMLogHandleForCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        sub_1ABC5775C(v4, v28);

      goto LABEL_8;
    }
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    +[IMDDatabase synchronousDatabase](IMDDatabase, "synchronousDatabase");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject guid](v6, "guid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = sub_1ABB7685C;
    v30[3] = &unk_1E5AB0468;
    v30[4] = &v31;
    objc_msgSend(v9, "fetchScheduledMessageRecordsForChatRecordWithGUID:limit:completionHandler:", v10, 2, v30);

    if (v32[3])
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "guid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v12, CFSTR("__kmessageGUIDKey"));

      objc_msgSend(v4, "handleRecord");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v13, CFSTR("__kmessageHandleKey"));

      objc_msgSend(v4, "handleRecord");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDNotificationsController _displayNameForHandle:](self, "_displayNameForHandle:", v14);
      v15 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "otherHandleRecord");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDNotificationsController _displayNameForHandle:](self, "_displayNameForHandle:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x1E0CB3940];
      IMSharedUtilitiesFrameworkBundle();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("%@ added %@ to the conversation. %lu scheduled messages"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringWithFormat:", v20, v15, v17, v32[3]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v21, CFSTR("__kmessageTextKey"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "rawDate"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v22, CFSTR("__kmessageDateKey"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "rawDate"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v23, CFSTR("__kmessageDateDeliveredKey"));

      objc_msgSend(v4, "handleRecord");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDNotificationsController _setContactInMessageDictionary:messageDictionary:](self, "_setContactInMessageDictionary:messageDictionary:", v24, v11);

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = v32[3];
          *(_DWORD *)buf = 138412802;
          v36 = v15;
          v37 = 2112;
          v38 = v17;
          v39 = 2048;
          v40 = v26;
          _os_log_impl(&dword_1ABB60000, v25, OS_LOG_TYPE_INFO, "%@ added %@ and chat has scheduled message count: %lu", buf, 0x20u);
        }

      }
      buf[0] = 1;
      -[IMDNotificationsController _chatDictionaryForChatRecord:](self, "_chatDictionaryForChatRecord:", v6);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDNotificationsController _generateNotificationRequestForMessageRecord:messageDictionary:chatDictionary:isUrgentMessageTrigger:isCarouselUITriggered:shouldAdvanceLastAlertedMessageDate:](self, "_generateNotificationRequestForMessageRecord:messageDictionary:chatDictionary:isUrgentMessageTrigger:isCarouselUITriggered:shouldAdvanceLastAlertedMessageDate:", 0, v11, v27, 0, 0, buf);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      IMLogHandleForCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v7 = 0;
        goto LABEL_28;
      }
      v15 = v11;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        -[NSObject guid](v6, "guid");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1ABC577E8(v29, (uint64_t)buf, v15);
      }
      v7 = 0;
      v11 = v15;
    }

LABEL_28:
    _Block_object_dispose(&v31, 8);
    goto LABEL_9;
  }
  IMLogHandleForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_1ABC57834(v5, v6);
LABEL_8:
  v7 = 0;
LABEL_9:

  return v7;
}

- (id)_userNotificationsForMessageRecords:(id)a3 newerThanDate:(int64_t)a4 isUrgentMessageTrigger:(BOOL)a5 isCarouselUITriggered:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  id v26;
  void *v27;
  void *v28;
  id v29;
  int64_t v30;
  _BOOL4 v31;
  _BOOL4 v32;
  uint64_t v33;
  void *v34;
  char v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  id v39;
  __int16 v40;
  int64_t v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v32 = a6;
  v6 = a5;
  v44 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = v6;
  v26 = v9;
  v30 = a4;
  if (v6)
  {
    v11 = v9;
  }
  else
  {
    -[IMDNotificationsController _messages:newerThanDate:](self, "_messages:newerThanDate:", v9, a4, v9);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v28 = v11;
  -[IMDNotificationsController _messagesSortedByDate:](self, "_messagesSortedByDate:", v26);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v34, "count");
  if (v33)
  {
    v12 = 0;
    v13 = (double)a4;
    v29 = v10;
    do
    {
      v14 = (void *)MEMORY[0x1AF435474]();
      objc_msgSend(v34, "objectAtIndex:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "rawDate");
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)v16);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", v13);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218754;
          v37 = v16;
          v38 = 2112;
          v39 = v18;
          v40 = 2048;
          v41 = v30;
          v42 = 2112;
          v43 = v19;
          _os_log_impl(&dword_1ABB60000, v17, OS_LOG_TYPE_INFO, "iterating new messages for newMessageDate: [%lld]-[%@], last alerted date: [%lld]-[%@]", buf, 0x2Au);

        }
      }
      v35 = 1;
      if (objc_msgSend(v15, "itemType") == 1)
        -[IMDNotificationsController _userNotificationForParticipantChangeMessageRecord:](self, "_userNotificationForParticipantChangeMessageRecord:", v15);
      else
        -[IMDNotificationsController _generateNotificationRequestForMessageRecord:isUrgentMessageTrigger:isCarouselUITriggered:shouldAdvanceLastAlertedMessageDate:](self, "_generateNotificationRequestForMessageRecord:isUrgentMessageTrigger:isCarouselUITriggered:shouldAdvanceLastAlertedMessageDate:", v15, v31, v32, &v35);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v20, "identifier");
            v22 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "content");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "categoryIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v37 = (uint64_t)v22;
            v38 = 2112;
            v39 = v24;
            _os_log_impl(&dword_1ABB60000, v21, OS_LOG_TYPE_INFO, "Generated notification request for identifier %@ with category identifier %@", buf, 0x16u);

            v10 = v29;
          }

        }
        -[IMDNotificationsController advanceLastAlertedMessageDate:](self, "advanceLastAlertedMessageDate:", v16);
        objc_msgSend(v10, "addObject:", v20);
      }
      else if (v35)
      {
        -[IMDNotificationsController advanceLastAlertedMessageDate:](self, "advanceLastAlertedMessageDate:", v16);
      }

      objc_autoreleasePoolPop(v14);
      ++v12;
    }
    while (v33 != v12);
  }

  return v10;
}

- (id)_userNotificationsForFailedDeliveryMessageRecords:(id)a3 isCarouselUITriggered:(BOOL)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  BOOL v14;

  -[IMDNotificationsController _messagesSortedByDate:](self, "_messagesSortedByDate:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1ABB76CDC;
  v12[3] = &unk_1E5AB08F0;
  v12[4] = self;
  v14 = a4;
  v8 = v7;
  v13 = v8;
  objc_msgSend(v6, "enumerateObjectsWithOptions:usingBlock:", 2, v12);
  v9 = v13;
  v10 = v8;

  return v10;
}

- (void)__postNotifications
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[5];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v3, OS_LOG_TYPE_INFO, "Post notifications after coalescing, background threading", buf, 2u);
    }

  }
  v4 = (void *)IMDMessageRecordCopyNewMessagesForKnownRowIDs(0);
  objc_msgSend(v4, "objectForKey:", CFSTR("newMessages"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)IMDMessageRecordCopyNewParticipantChangeItems();
  v6 = -[IMDNotificationsController lastAlertedMessageDate](self, "lastAlertedMessageDate");
  v7 = -[IMDNotificationsController lastAlertedFailedMessageDate](self, "lastAlertedFailedMessageDate");
  IMGetCachedDomainValueForKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v8, "__im_nanosecondTimeInterval");

  objc_msgSend(v4, "objectForKey:", CFSTR("lastFailedDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "longLongValue");

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v21 = objc_msgSend(v5, "count");
      v20 = objc_msgSend(v23, "count");
      objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)v6);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)v7);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219778;
      v26 = v21;
      v27 = 2048;
      v28 = v20;
      v29 = 2048;
      v30 = v6;
      v31 = 2112;
      v32 = v12;
      v33 = 2048;
      v34 = v7;
      v35 = 2112;
      v36 = v13;
      v37 = 2048;
      v38 = v10;
      v39 = 2112;
      v40 = v14;
      _os_log_impl(&dword_1ABB60000, v11, OS_LOG_TYPE_INFO, "new messages number: [%lu] new participant changes number: [%lu] lastAlertedDate: [%lld]-[%@] lastFailedMessageAlertDate: [%lld]-[%@] lastFailedMessageDate: [%lld]-[%@]", buf, 0x52u);

    }
  }
  if (v10 >= v7 || v22 >= v7)
  {
    -[IMDNotificationsController _failedMessageRecordsAfterDateInNanoseconds:](self, "_failedMessageRecordsAfterDateInNanoseconds:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDNotificationsController _userNotificationsForFailedDeliveryMessageRecords:isCarouselUITriggered:](self, "_userNotificationsForFailedDeliveryMessageRecords:isCarouselUITriggered:", v16, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDNotificationsController _userNotificationsForMessageRecords:newerThanDate:isUrgentMessageTrigger:isCarouselUITriggered:](self, "_userNotificationsForMessageRecords:newerThanDate:isUrgentMessageTrigger:isCarouselUITriggered:", v17, v6, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") || objc_msgSend(v15, "count"))
  {
    -[IMDNotificationsController _postUnreadNotificationRequests:failedNotificationRequests:](self, "_postUnreadNotificationRequests:failedNotificationRequests:", v18, v15);
  }
  else if (!objc_msgSend(v5, "count"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1ABB60000, v19, OS_LOG_TYPE_INFO, "Queuing retraction of all delivered notifications, as we had nothing unread.", buf, 2u);
      }

    }
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = sub_1ABB7723C;
    v24[3] = &unk_1E5AB0868;
    v24[4] = self;
    sub_1ABB74B34(v24);
  }

}

- (void)_removeAllDeliveredMessageNotifications
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[16];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v2, OS_LOG_TYPE_INFO, "Retracting all unread message notifications", buf, 2u);
    }

  }
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[IMDNotificationsController notificationCenter](self, "notificationCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deliveredNotifications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "request");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "content");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "categoryIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "hasPrefix:", CFSTR("MessageExtension"));

        if (v13)
        {
          objc_msgSend(v9, "request");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v15);

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v6);
  }

  -[IMDNotificationsController notificationCenter](self, "notificationCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeDeliveredNotificationsWithIdentifiers:", v3);

}

- (id)_failedMessageRecordsAfterDateInNanoseconds:(int64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = (void *)IMDMessageRecordCopyNewestFailedOutgoingMessagesToLimitAfterDate(10, a3);
  objc_msgSend(v4, "addObjectsFromArray:", v5);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), *MEMORY[0x1E0D382D0], MEMORY[0x1E0C9AAB0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3880];
  v8 = *MEMORY[0x1E0D38298];
  objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("%K > %@"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  +[IMDDatabase synchronousDatabase](IMDDatabase, "synchronousDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3528];
  v24[0] = v6;
  v24[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_1ABB7767C;
  v21[3] = &unk_1E5AB0918;
  v22 = v11;
  v16 = v4;
  v23 = v16;
  v17 = v11;
  objc_msgSend(v12, "fetchMessageRecordsFilteredUsingPredicate:sortedUsingDescriptors:limit:completionHandler:", v15, 0, 10, v21);

  v18 = v23;
  v19 = v16;

  return v19;
}

- (void)_postUnreadNotificationRequests:(id)a3 failedNotificationRequests:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  IMDNotificationsController *v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1ABB7788C;
  v10[3] = &unk_1E5AB0940;
  v11 = v6;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v6;
  sub_1ABB74B34(v10);

}

- (void)_postUrgentNotificationRequests:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABB77984;
  v6[3] = &unk_1E5AAF5B8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  sub_1ABB74B34(v6);

}

- (void)_postNotificationRequests:(id)a3 isMostActiveDevice:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1ABB77A30;
  v8[3] = &unk_1E5AB0968;
  v8[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  sub_1ABB74B34(v8);

}

- (void)__postNotificationRequests:(id)a3 isMostActiveDevice:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  dispatch_semaphore_t v14;
  void *v15;
  NSObject *v16;
  dispatch_time_t v17;
  NSObject *v18;
  void *v19;
  id obj;
  uint8_t buf[16];
  _QWORD v22[5];
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[IMDNotificationsController notificationCenter](self, "notificationCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deliveredNotifications");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(obj);
        v12 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * v11);
        v13 = v12;
        if (!a4)
        {
          -[IMDNotificationsController _requestForNonMostActiveDeviceRequest:](self, "_requestForNonMostActiveDeviceRequest:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if (-[IMDNotificationsController _shouldPostNotificationRequest:withCurrentlyPostedNotifications:](self, "_shouldPostNotificationRequest:withCurrentlyPostedNotifications:", v13, v8))
        {
          v14 = dispatch_semaphore_create(0);
          -[IMDNotificationsController notificationCenter](self, "notificationCenter");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = sub_1ABB77CE0;
          v22[3] = &unk_1E5AB0990;
          v22[4] = v12;
          v16 = v14;
          v23 = v16;
          objc_msgSend(v15, "addNotificationRequest:withCompletionHandler:", v12, v22);

          v17 = dispatch_time(0, 3000000000);
          if (dispatch_semaphore_wait(v16, v17) && IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1ABB60000, v18, OS_LOG_TYPE_INFO, "timeout waiting for completionHandler from UNNotificationCenter", buf, 2u);
            }

          }
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);
  }

  -[IMDNotificationsController notificationCenter](self, "notificationCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "getNotificationSettingsWithCompletionHandler:", &unk_1E5AAE8D8);

}

- (id)_requestForNonMostActiveDeviceRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v17[16];
  uint8_t buf[16];

  v3 = a3;
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_INFO, "Coordinated Alerts -- this is not the most active device, suppressing the screen from lighting up and not playing sound for message", buf, 2u);
    }

  }
  objc_msgSend(v5, "setShouldIgnoreDoNotDisturb:", 0);
  objc_msgSend(v5, "setShouldSuppressScreenLightUp:", 1);
  objc_msgSend(v5, "setSound:", 0);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "Coordinated Alerts -- this is not the most active device, suppressing spoken messages", v17, 2u);
    }

  }
  if (objc_msgSend(v5, "interruptionLevel") == 3)
  {
    objc_msgSend(v5, "setShouldSuppressScreenLightUp:", 0);
    objc_msgSend(v5, "sound");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8
      || (v9 = (void *)v8,
          objc_msgSend(v5, "sound"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "alertType"),
          v10,
          v9,
          v11 == 2))
    {
      objc_msgSend(MEMORY[0x1E0CEC760], "defaultCriticalSound");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSound:", v12);

    }
  }
  v13 = (void *)MEMORY[0x1E0CEC740];
  objc_msgSend(v3, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "requestWithIdentifier:content:trigger:destinations:", v14, v5, 0, 15);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)postNotificationsWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "Post notifications called from client with context %@", (uint8_t *)&v9, 0xCu);
    }

  }
  if (-[IMDNotificationsController _haveMigrated](self, "_haveMigrated"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IMActiveAccountAliasesKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDNotificationsController setActiveAccountAliases:](self, "setActiveAccountAliases:", v7);

    }
    -[IMDNotificationsController __postNotifications](self, "__postNotifications");

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "We don't post notifications during system migration", (uint8_t *)&v9, 2u);
    }

  }
}

- (void)retractNotificationsForReadMessages:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "Withdrawing message notifications for message guids %@", buf, 0xCu);
    }

  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABB783F4;
  v7[3] = &unk_1E5AAF5B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  sub_1ABB74B34(v7);

}

- (void)repostNotificationsFromFirstUnlockWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "Retract and re-post iMessage notifications sent before first unlock", buf, 2u);
    }

  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABB785E8;
  v7[3] = &unk_1E5AAF5B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  sub_1ABB74B34(v7);

}

- (void)postUrgentNotificationForMessages:(id)a3 withContext:(id)a4
{
  const __CFArray *v6;
  id v7;
  NSObject *v8;
  const __CFArray *v9;
  void *v10;
  int v11;
  const __CFArray *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = (const __CFArray *)a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v11 = 138412546;
      v12 = v6;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "We need to post these urgent message requests %@ with context %@", (uint8_t *)&v11, 0x16u);
    }

  }
  v9 = IMDMessageRecordCopyMessagesForGUIDs(v6);
  -[IMDNotificationsController _userNotificationsForMessageRecords:newerThanDate:isUrgentMessageTrigger:isCarouselUITriggered:](self, "_userNotificationsForMessageRecords:newerThanDate:isUrgentMessageTrigger:isCarouselUITriggered:", v9, -[IMDNotificationsController lastAlertedMessageDate](self, "lastAlertedMessageDate"), 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDNotificationsController _postUrgentNotificationRequests:](self, "_postUrgentNotificationRequests:", v10);

}

- (void)updatePostedNotificationsForMessages:(id)a3 withContext:(id)a4
{
  NSObject *v6;
  const __CFArray *v7;
  id v8;
  const __CFArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  const __CFArray *v16;
  NSObject *v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  const __CFArray *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  char v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  const __CFArray *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v24 = (const __CFArray *)a3;
  v23 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v24;
      _os_log_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_INFO, "Updating posted notifications for messages %@", buf, 0xCu);
    }

  }
  v7 = IMDMessageRecordCopyMessagesForGUIDs(v24);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = v7;
  v10 = -[__CFArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v29 = 0;
        -[IMDNotificationsController _generateNotificationRequestForMessageRecord:isUrgentMessageTrigger:isCarouselUITriggered:shouldAdvanceLastAlertedMessageDate:](self, "_generateNotificationRequestForMessageRecord:isUrgentMessageTrigger:isCarouselUITriggered:shouldAdvanceLastAlertedMessageDate:", v13, 0, 0, &v29);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          objc_msgSend(v14, "identifier");
          v16 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v36 = v16;
              _os_log_impl(&dword_1ABB60000, v17, OS_LOG_TYPE_INFO, "Generated an updated notification request for notification: %@", buf, 0xCu);
            }

          }
          objc_msgSend(v15, "content");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[__CFArray length](v16, "length"))
            v19 = v18 == 0;
          else
            v19 = 1;
          if (!v19)
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, v16);

        }
        else
        {
          objc_msgSend(v13, "guid");
          v16 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v36 = v16;
              _os_log_impl(&dword_1ABB60000, v20, OS_LOG_TYPE_INFO, "Could not generate an updated notification request for edited message, message may have been retracted. Retracting outstanding notifications for messageGUID: %@", buf, 0xCu);
            }

          }
          if (-[__CFArray length](v16, "length"))
            objc_msgSend(v25, "addObject:", v16);
        }

      }
      v10 = -[__CFArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v10);
  }

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = sub_1ABB78B90;
  v26[3] = &unk_1E5AB0940;
  v26[4] = self;
  v27 = v8;
  v28 = v25;
  v21 = v25;
  v22 = v8;
  sub_1ABB74B34(v26);

}

- (void)postFirstUnlockMessage:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  __CFDictionary *Mutable;
  void *v13;
  char *v14;
  NSObject *v15;
  id v16;
  char *v17;
  NSObject *v18;
  _QWORD v19[5];
  char *v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    IMSharedUtilitiesFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MADRID_MESSAGE"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc_init(MEMORY[0x1E0CEC6E0]);
    objc_msgSend(v10, "setTitle:", v7);
    objc_msgSend(v10, "setBody:", v9);
    objc_msgSend(v10, "setCategoryIdentifier:", CFSTR("MessageExtension-Madrid"));
    objc_msgSend(v10, "setThreadIdentifier:", v7);
    objc_msgSend(v10, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    Mutable = (__CFDictionary *)objc_msgSend(v11, "mutableCopy");

    if (!Mutable)
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    CFDictionarySetValue(Mutable, CFSTR("CKBBContextKeyMessageGUID"), v6);
    CFDictionarySetValue(Mutable, CFSTR("CKBBContextKeyIsFirstUnlock"), MEMORY[0x1E0C9AAB0]);
    objc_msgSend(v10, "setUserInfo:", Mutable);
    objc_msgSend(MEMORY[0x1E0CEC790], "triggerWithTimeInterval:repeats:", 0, 0.1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEC740], "requestWithIdentifier:content:trigger:", v6, v10, v13);
    v14 = (char *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v14;
        v24 = 2112;
        v25 = v10;
        _os_log_impl(&dword_1ABB60000, v15, OS_LOG_TYPE_INFO, "adding notification request under first unlock %@ with content %@", buf, 0x16u);
      }

    }
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_1ABB791C4;
    v19[3] = &unk_1E5AB0940;
    v19[4] = self;
    v20 = v14;
    v21 = v10;
    v16 = v10;
    v17 = v14;
    sub_1ABB74B34(v19);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[IMDNotificationsController postFirstUnlockMessage:forIdentifier:]";
      _os_log_impl(&dword_1ABB60000, v18, OS_LOG_TYPE_INFO, "IMDNotificationsController - %s asked to post notification with nil messageGUID", buf, 0xCu);
    }

  }
}

- (void)postSharePlayNotificationForChatGUID:(id)a3 faceTimeConversationUUID:(id)a4 handleIdentifier:(id)a5 localizedApplicationName:(id)a6
{
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  int v13;
  NSObject *v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  NSObject *v41;
  __CFString *v42;
  __CFString *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  IMDNotificationsController *v47;
  __CFString *v48;
  __CFString *v49;
  __CFString *v50;
  char v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  void *v56;
  _BYTE v57[128];
  int buf;
  __CFString *v59;
  __int16 v60;
  __CFString *v61;
  __int16 v62;
  __CFString *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v10 = (__CFString *)a3;
  v11 = (__CFString *)a4;
  v12 = (__CFString *)a5;
  v50 = (__CFString *)a6;
  v13 = IMOSLoggingEnabled();
  v49 = v11;
  if (v10 && v11 && v12)
  {
    v47 = self;
    if (v13)
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        buf = 138412802;
        v59 = v10;
        v60 = 2112;
        v61 = v12;
        v62 = 2112;
        v63 = v50;
        _os_log_impl(&dword_1ABB60000, v14, OS_LOG_TYPE_INFO, "Posting SharePlay notification for chat GUID %@ and handle identifier %@ with app name %@", (uint8_t *)&buf, 0x20u);
      }

    }
    v15 = (__CFString *)IMDChatRecordCopyChatForGUID(v10);
    v48 = v15;
    if (!v15)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          buf = 138412290;
          v59 = v10;
          _os_log_impl(&dword_1ABB60000, v34, OS_LOG_TYPE_INFO, "No chat record for guid: %@", (uint8_t *)&buf, 0xCu);
        }

      }
      goto LABEL_47;
    }
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    -[__CFString handleRecords](v15, "handleRecords");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    if (v17)
    {
      v18 = 0;
      v19 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v53 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend(v21, "canonicalizedURIString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isEqualToString:", v12);

          if (v23)
          {
            v24 = v21;

            v18 = v24;
          }
        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      }
      while (v17);

      if (v18)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "__im_nanosecondTimeInterval");

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v10, v49);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v28, CFSTR("__kmessageGUIDKey"));

        objc_msgSend(v27, "setObject:forKeyedSubscript:", v18, CFSTR("__kmessageHandleKey"));
        if (v50)
        {
          v29 = (void *)MEMORY[0x1E0CB3940];
          IMSharedUtilitiesFrameworkBundle();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("SharePlay “%@” Together"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "localizedStringWithFormat:", v31, v50);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v32, CFSTR("__kmessageTextKey"));

        }
        else
        {
          IMSharedUtilitiesFrameworkBundle();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("SharePlay Together"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v31, CFSTR("__kmessageTextKey"));
        }

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v26);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v36, CFSTR("__kmessageDateKey"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v26);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v37, CFSTR("__kmessageDateDeliveredKey"));

        -[IMDNotificationsController _setContactInMessageDictionary:messageDictionary:](v47, "_setContactInMessageDictionary:messageDictionary:", v18, v27);
        -[IMDNotificationsController _chatDictionaryForChatRecord:](v47, "_chatDictionaryForChatRecord:", v48);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = 1;
        -[IMDNotificationsController _generateNotificationRequestForMessageRecord:messageDictionary:chatDictionary:isUrgentMessageTrigger:isCarouselUITriggered:shouldAdvanceLastAlertedMessageDate:](v47, "_generateNotificationRequestForMessageRecord:messageDictionary:chatDictionary:isUrgentMessageTrigger:isCarouselUITriggered:shouldAdvanceLastAlertedMessageDate:", 0, v27, v38, 0, 0, &v51);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = IMOSLoggingEnabled();
        if (v39)
        {
          if (v40)
          {
            OSLogHandleForIMFoundationCategory();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v39, "identifier");
              v42 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "content");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "categoryIdentifier");
              v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
              buf = 138412546;
              v59 = v42;
              v60 = 2112;
              v61 = v43;
              _os_log_impl(&dword_1ABB60000, v41, OS_LOG_TYPE_INFO, "Generated notification request for identifier %@ with category identifier %@", (uint8_t *)&buf, 0x16u);

            }
          }
          v56 = v39;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDNotificationsController _postNotificationRequests:isMostActiveDevice:](v47, "_postNotificationRequests:isMostActiveDevice:", v44, 1);

          if (v51)
            -[IMDNotificationsController advanceLastAlertedMessageDate:](v47, "advanceLastAlertedMessageDate:", v26);
        }
        else if (v40)
        {
          OSLogHandleForIMFoundationCategory();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            buf = 138412546;
            v59 = v10;
            v60 = 2112;
            v61 = v12;
            _os_log_impl(&dword_1ABB60000, v45, OS_LOG_TYPE_INFO, "Failed to generate SharePlay notification request for chat GUID %@ and handle identifier %@", (uint8_t *)&buf, 0x16u);
          }

        }
LABEL_47:

        goto LABEL_48;
      }
    }
    else
    {

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        buf = 138412290;
        v59 = v12;
        _os_log_impl(&dword_1ABB60000, v35, OS_LOG_TYPE_INFO, "No handle record for identifier: %@", (uint8_t *)&buf, 0xCu);
      }

    }
    goto LABEL_47;
  }
  if (v13)
  {
    OSLogHandleForIMFoundationCategory();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      buf = 138412802;
      v59 = v10;
      v60 = 2112;
      v61 = v11;
      v62 = 2112;
      v63 = v12;
      _os_log_impl(&dword_1ABB60000, v33, OS_LOG_TYPE_INFO, "Not posting SharePlay notification because chatGUID (%@), faceTimeConversationUUID (%@), or handleIdentifier (%@) were missing.", (uint8_t *)&buf, 0x20u);
    }

  }
LABEL_48:

}

- (BOOL)_isRaiseGestureEnabled
{
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;
  uint8_t v7[16];

  -[IMDNotificationsController defaultsSharedInstance](self, "defaultsSharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValueFromDomain:forKey:", CFSTR("com.apple.MobileSMS"), CFSTR("RaiseToListenEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_msgSend(v3, "BOOLValue");
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "We have never set the raise to listen default, marking it as enabled", v7, 2u);
      }

    }
    v4 = 1;
  }

  return v4;
}

- (void)_populateBasicNotificationIdentifyingContent:(id)a3 chatDictionary:(id)a4 messageDictionary:(id)a5 isCarouselUITriggered:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  char v18;
  _BOOL4 v19;
  _BOOL4 v20;
  void *v21;
  char v22;
  void *v23;
  int v24;
  _BOOL4 v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  const __CFString *v30;
  NSObject *v31;
  const __CFString *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v11, "objectForKey:", CFSTR("__kmessageDateKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "longLongValue");

  objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)v13);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDate:", v41);
  objc_msgSend(v10, "objectForKey:", CFSTR("__kchatChatIdentifierKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("__kmessageServiceKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0D38F58]);

  objc_msgSend(v11, "objectForKey:", CFSTR("__kmessageServiceKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0D38F50]);

  v19 = -[IMDNotificationsController _messageIsBusiness:](self, "_messageIsBusiness:", v11);
  v20 = v19;
  v21 = 0;
  v22 = v16 | v18;
  if ((v22 & 1) == 0 && !v19)
  {
    if (-[IMDNotificationsController _amIMentionedInMessage:](self, "_amIMentionedInMessage:", v11))
    {
      objc_msgSend(v11, "objectForKey:", CFSTR("__kmessageGUIDKey"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "__im_URLForChatIdentifier:entryBody:messageGUID:", v14, 0, v21);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("__kmessageFlagsKey"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v10;
  v24 = objc_msgSend(v23, "unsignedLongLongValue");

  if ((v24 & 0x200000) == 0)
  {
    objc_msgSend(v9, "setDefaultActionURL:", v40);
LABEL_14:
    v26 = v39;
    objc_msgSend(v39, "objectForKey:", CFSTR("__kchatStyleKey"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "longLongValue");

    if ((v22 & 1) != 0)
    {
      if (v16)
        v30 = CFSTR("MessageExtension-SMS");
      else
        v30 = CFSTR("MessageExtension-RCS");
      objc_msgSend(v9, "setCategoryIdentifier:", v30);
      if (MEMORY[0x1AF434F4C](v14))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1ABB60000, v31, OS_LOG_TYPE_INFO, "Do not relay notification", buf, 2u);
          }

        }
        objc_msgSend(v9, "setCategoryIdentifier:", CFSTR("MessageExtension-NoRelay"));
      }
    }
    else
    {
      if (v20)
      {
        v32 = CFSTR("MessageExtension-MadridBusiness");
      }
      else if (v29 == 43)
      {
        v32 = CFSTR("MessageExtension-MadridGroup");
      }
      else
      {
        v32 = CFSTR("MessageExtension-Madrid");
      }
      objc_msgSend(v9, "setCategoryIdentifier:", v32);
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1ABB60000, v33, OS_LOG_TYPE_INFO, "This was not an audio message", buf, 2u);
      }

    }
    goto LABEL_34;
  }
  v25 = -[IMDNotificationsController _isRaiseGestureEnabled](self, "_isRaiseGestureEnabled");
  objc_msgSend(v9, "setDefaultActionURL:", v40);
  if (!v25)
    goto LABEL_14;
  v26 = v39;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v27, OS_LOG_TYPE_INFO, "We got an audio message and raise to listen is enabled setting audio notification category", buf, 2u);
    }

  }
  objc_msgSend(v9, "setCategoryIdentifier:", CFSTR("MessageExtension-AudioRaise"));
LABEL_34:
  if (objc_msgSend(v14, "length"))
  {
    objc_msgSend(v9, "setThreadIdentifier:", v14);
  }
  else
  {
    IMLogHandleForCategory();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_1ABC579CC();

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v9, "date");
      v36 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "categoryIdentifier");
      v37 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "threadIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v43 = v36;
      v44 = 2112;
      v45 = v37;
      v46 = 2112;
      v47 = v38;
      _os_log_impl(&dword_1ABB60000, v35, OS_LOG_TYPE_INFO, "Setting the date %@ category identifier %@ thread identifier %@", buf, 0x20u);

    }
  }

}

- (void)_populateBodyForNotificationContent:(id)a3 messageDictionary:(id)a4
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
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("__kmessageAttributedBodyKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "__im_richCardsPreviewText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "__im_suggestedReplyPreviewText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v5, "setBody:", v9);
LABEL_18:

      goto LABEL_19;
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("__kmessageExpressiveSendStyleIDKey"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "isEqualToString:", *MEMORY[0x1E0D380A0]))
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      IMSharedUtilitiesFrameworkBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Message sent with Invisible Ink"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringWithFormat:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = *MEMORY[0x1E0D362F8];
      v15 = *MEMORY[0x1E0D36318];
    }
    else
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("__kmessageTextKey"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v13, "length"))
      {
        objc_msgSend(v6, "objectForKey:", CFSTR("__kmessageGUIDKey"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v27 = v22;
              _os_log_impl(&dword_1ABB60000, v23, OS_LOG_TYPE_INFO, "We don't have a message body for message guid %@", buf, 0xCu);
            }

          }
        }
        else
        {
          IMLogHandleForCategory();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            sub_1ABC57A2C();

        }
        goto LABEL_17;
      }
      v19 = objc_alloc_init(MEMORY[0x1E0CB3780]);
      v14 = *MEMORY[0x1E0D362F8];
      objc_msgSend(v19, "addCharactersInString:", *MEMORY[0x1E0D362F8]);
      v15 = *MEMORY[0x1E0D36318];
      objc_msgSend(v19, "addCharactersInString:", *MEMORY[0x1E0D36318]);
      if (!objc_msgSend(v13, "length"))
      {
LABEL_14:
        v20 = 0;
        goto LABEL_15;
      }
      v21 = 0;
      while ((objc_msgSend(v19, "characterIsMember:", objc_msgSend(v13, "characterAtIndex:", v21)) & 1) != 0)
      {
        if (++v21 >= (unint64_t)objc_msgSend(v13, "length"))
          goto LABEL_14;
      }

    }
    objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", v14, CFSTR(" "));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", v15, &stru_1E5AC1D70);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:", *MEMORY[0x1E0D37890], &stru_1E5AC1D70);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", *MEMORY[0x1E0D38CD8], &stru_1E5AC1D70);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v19, "length") < 0x3E9)
    {
LABEL_16:
      objc_msgSend(v5, "setBody:", v19);

LABEL_17:
      goto LABEL_18;
    }
    objc_msgSend(v19, "substringToIndex:", 1000);
    v20 = objc_claimAutoreleasedReturnValue();
LABEL_15:

    v19 = (id)v20;
    goto LABEL_16;
  }
  objc_msgSend(v5, "setBody:", v8);
LABEL_19:

}

- (void)_populateSubtitleForNotificationContent:(id)a3 chatDictionary:(id)a4 messageDictionary:(id)a5
{
  char v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  char v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  char v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t v69[128];
  uint8_t buf[4];
  void *v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v55 = a3;
  v57 = a4;
  v58 = a5;
  objc_msgSend(v58, "objectForKey:", CFSTR("__kmessageHandleKey"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_addressForHandle:", v60);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (v56 && (MEMORY[0x1AF434F1C]() & 1) != 0)
  {
    v53 = 0;
    v7 = 0;
  }
  else
  {
    objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("__kchatGroupNameKey"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 1;
  }
  objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("__kchatHandlesForChatKey"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v53;
  if (!objc_msgSend(v53, "length") && objc_msgSend(v54, "count"))
  {
    objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("__kchatStyleKey"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "longLongValue");

    v25 = v7 ^ 1;
    if (v24 == 45)
      v25 = 1;
    if ((v25 & 1) != 0)
    {
      v8 = v53;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v27 = v54;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
      if (v28)
      {
        v29 = *(_QWORD *)v66;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v66 != v29)
              objc_enumerationMutation(v27);
            v31 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
            v32 = objc_msgSend(v31, "rowID");
            if (v32 != objc_msgSend(v60, "rowID"))
            {
              -[IMDNotificationsController _displayNameForHandle:andContact:](self, "_displayNameForHandle:andContact:", v31, 0);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              if (v33)
              {
                objc_msgSend(v26, "addObject:", v33);
              }
              else if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v34 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("__kmessageGUIDKey"));
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v71 = v35;
                  _os_log_impl(&dword_1ABB60000, v34, OS_LOG_TYPE_INFO, "Unable to create formatted display string for other recipient handle from messageGUID %@", buf, 0xCu);

                }
              }

            }
          }
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
        }
        while (v28);
      }

      IMSharedUtilitiesFrameworkBundle();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("PARTICIPANT_ADDRESS_TO_YOU_ITEM"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v37 = v26;
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
      if (v38)
      {
        v39 = 0;
        v40 = *(_QWORD *)v62;
        do
        {
          v41 = 0;
          v42 = v8;
          do
          {
            if (*(_QWORD *)v62 != v40)
              objc_enumerationMutation(v37);
            v43 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v41);
            v44 = v39 + v41 == objc_msgSend(v37, "count") - 1;
            v45 = (void *)MEMORY[0x1E0CB3940];
            IMSharedUtilitiesFrameworkBundle();
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = v46;
            if (v44)
              v48 = CFSTR("PARTICIPANT_ADDRESS_FINAL_ITEM");
            else
              v48 = CFSTR("PARTICIPANT_ADDRESS_NON_FINAL_ITEM");
            objc_msgSend(v46, "localizedStringForKey:value:table:", v48, &stru_1E5AC1D70, CFSTR("IMSharedUtilities"));
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "localizedStringWithFormat:", v49, v43);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "stringByAppendingString:", v50);
            v8 = (void *)objc_claimAutoreleasedReturnValue();

            ++v41;
            v42 = v8;
          }
          while (v38 != v41);
          v39 += v38;
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
        }
        while (v38);
      }

    }
  }
  objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("__kmessageThreadOriginatorKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "objectForKey:", CFSTR("__kmessageServiceKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D38F58]);

  v12 = -[IMDNotificationsController _amIMentionedInMessage:](self, "_amIMentionedInMessage:", v58);
  if (!objc_msgSend(v8, "length"))
    goto LABEL_14;
  if (((v11 | !v12) & 1) == 0)
  {
    v51 = (void *)MEMORY[0x1E0CB3940];
    IMSharedUtilitiesFrameworkBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("GROUP_MENTION_RECEIVED_TITLE"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "localizedStringWithFormat:", v17, v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_51:

    goto LABEL_52;
  }
  if (!v9)
  {
LABEL_14:
    v22 = v8;
    goto LABEL_53;
  }
  objc_msgSend(v9, "objectForKey:", CFSTR("__kmessageHandleKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("__kmessageFlagsKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedLongLongValue");

  if (v13)
    v16 = (v15 & 4) == 0;
  else
    v16 = 0;
  if (v16)
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("__kmessageCNContactForSenderKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDNotificationsController _displayNameForHandle:andContact:](self, "_displayNameForHandle:andContact:", v13, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0CB3940];
    IMSharedUtilitiesFrameworkBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("GROUP_REPLY_RECEIVED_TITLE"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringWithFormat:", v21, v18, v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_50:
    v8 = (void *)v18;
    goto LABEL_51;
  }
  if ((v15 & 4) != 0)
  {
    v52 = (void *)MEMORY[0x1E0CB3940];
    IMSharedUtilitiesFrameworkBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("GROUP_REPLY_RECEIVED_TO_YOU_TITLE"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities"));
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "localizedStringWithFormat:", v18, v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v8;
    goto LABEL_50;
  }
  v22 = v8;
LABEL_52:

LABEL_53:
  if (objc_msgSend(v22, "length"))
    objc_msgSend(v55, "setSubtitle:", v22);

}

- (void)_populateBodyAndTitleForSendReceivedAsJunkNotificationContent:(id)a3 messageDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CFMutableDictionaryRef Mutable;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  IMSharedUtilitiesFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MESSAGE_SEND_RECEIVED_AS_JUNK_DEFAULT"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  IMSharedUtilitiesFrameworkBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("MESSAGE_SEND_RECEIVED_AS_JUNK_BODY_DEFAULT"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  Mutable = (CFMutableDictionaryRef)objc_msgSend(v12, "mutableCopy");

  if (!Mutable)
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("__kmessageHandleKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("__kmessageCNContactForSenderKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDNotificationsController _displayNameForHandle:andContact:](self, "_displayNameForHandle:andContact:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      IMSharedUtilitiesFrameworkBundle();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("MESSAGE_SEND_TO_%@_RECEIVED_AS_JUNK"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringWithFormat:", v19, v16);
      v20 = objc_claimAutoreleasedReturnValue();

      -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", v16, CFSTR("CKBBContextKeySenderName"));
      v9 = (void *)v20;
    }

  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("__kmessageDestinationCallerIDKey"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_20;
    OSLogHandleForIMFoundationCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v26, OS_LOG_TYPE_INFO, "Sender (self) ID not found (senderID is NULL). Displaying default summary for received-as-junk notification", buf, 2u);
    }
LABEL_19:

    goto LABEL_20;
  }
  if (!IMStringIsEmail())
  {
    if (MEMORY[0x1AF434F40](v21))
    {
      IMFormattedDisplayStringForNumber();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0CB3940];
      IMSharedUtilitiesFrameworkBundle();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("MESSAGE_SEND_RECEIVED_AS_JUNK_BODY_PHONE_NUMBER_%@"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringWithFormat:", v29, v31);
      v30 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v30;
      goto LABEL_20;
    }
    if (!IMOSLoggingEnabled())
      goto LABEL_20;
    OSLogHandleForIMFoundationCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v21;
      _os_log_impl(&dword_1ABB60000, v26, OS_LOG_TYPE_INFO, "Sender (self) ID \"%@\" type not identified as email or phone number. Displaying default summary for received-as-junk notification", buf, 0xCu);
    }
    goto LABEL_19;
  }
  v22 = (void *)MEMORY[0x1E0CB3940];
  IMSharedUtilitiesFrameworkBundle();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("MESSAGE_SEND_RECEIVED_AS_JUNK_BODY_EMAIL_ADDRESS_%@"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringWithFormat:", v24, v21);
  v25 = objc_claimAutoreleasedReturnValue();

  v11 = (void *)v25;
LABEL_20:
  objc_msgSend(v6, "setTitle:", v9);
  objc_msgSend(v6, "setBody:", v11);
  -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("CKBBContextKeyIsFailedMessage"));
  objc_msgSend(v6, "setUserInfo:", Mutable);

}

- (BOOL)_contentBodyHasLocationURL:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v16;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("__kmessageAttributedBodyKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__im_dataDetectedURLsFromAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count"))
  {
LABEL_10:
    v16 = 0;
    goto LABEL_11;
  }
  v5 = 0;
  while (1)
  {
    objc_msgSend(v4, "objectAtIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scheme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trimmedString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("http"));

    objc_msgSend(MEMORY[0x1E0D398E0], "locationInfoFromURL:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v10)
      goto LABEL_8;
    objc_msgSend(v11, "location");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_8:
      goto LABEL_9;
    }
    objc_msgSend(v12, "address");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      break;
LABEL_9:
    if (++v5 >= (unint64_t)objc_msgSend(v4, "count"))
      goto LABEL_10;
  }
  v16 = 1;
LABEL_11:

  return v16;
}

- (void)_populateNotificationContentForTranscriptSharing:(id)a3 chatDictionary:(id)a4 messageDictionary:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  BOOL v25;
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
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  int v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  id obj;
  void *v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  uint64_t v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v57 = a3;
  v56 = a4;
  v55 = a5;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v8, "isTranscriptSharingEnabled");

  if (!(_DWORD)a4)
    goto LABEL_32;
  v9 = (void *)MEMORY[0x1E0D39A60];
  objc_msgSend(v56, "objectForKey:", CFSTR("__kchatEmergencyUserInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "infoFromDictionary:isStewieTranscriptSharingMessage:", v10, 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v58)
    goto LABEL_32;
  objc_msgSend(v55, "objectForKey:", CFSTR("__kmessageIsInitialTranscriptSharingItem"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v55, "objectForKey:", CFSTR("__kmessageHandleKey"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_addressForHandle:", v54);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0D37DC0];
  v52 = objc_msgSend(v53, "hasSuffix:", *MEMORY[0x1E0D37DC0]);
  objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("__kchatHandlesForChatKey"));
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
  if (!v13)
  {
    v60 = 0;
    v61 = 0;
    goto LABEL_25;
  }
  v60 = 0;
  v61 = 0;
  v14 = *(_QWORD *)v63;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v63 != v14)
        objc_enumerationMutation(obj);
      v16 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
      objc_msgSend((id)objc_opt_class(), "_addressForHandle:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      _IMDCoreSpotlightCNContactForHandle(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v17, "hasSuffix:", v12) & 1) != 0)
      {
        IMSharedUtilitiesFrameworkBundle();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("TS_NOTIFICATION_EMERGENCY_SUBTITLE_DISPLAYNAME"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities-SYDROB_FEATURES"));
        v20 = objc_claimAutoreleasedReturnValue();

        v60 = (void *)v20;
        goto LABEL_21;
      }
      if (v18
        || (objc_msgSend(v58, "emergencyUserPersona"),
            v23 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v23, "suggestedDisplayName"),
            v24 = (void *)objc_claimAutoreleasedReturnValue(),
            v25 = v24 == 0,
            v24,
            v23,
            v25))
      {
        -[IMDNotificationsController _displayNameForHandle:andContact:](self, "_displayNameForHandle:andContact:", v16, v18);
        v21 = objc_claimAutoreleasedReturnValue();

        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v67 = v21;
            _os_log_impl(&dword_1ABB60000, v22, OS_LOG_TYPE_INFO, "Not using suggested display name for user in emergency. Using display name = %@", buf, 0xCu);
          }
          goto LABEL_19;
        }
      }
      else
      {
        objc_msgSend(v58, "emergencyUserPersona");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "suggestedDisplayName");
        v21 = objc_claimAutoreleasedReturnValue();

        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v67 = v21;
            _os_log_impl(&dword_1ABB60000, v22, OS_LOG_TYPE_INFO, "Using suggested display name for user in emergency = %@", buf, 0xCu);
          }
LABEL_19:

        }
      }
      v61 = (void *)v21;
LABEL_21:

    }
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
  }
  while (v13);
LABEL_25:

  v27 = (void *)MEMORY[0x1E0CB3940];
  IMSharedUtilitiesFrameworkBundle();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("TS_NOTIFICATION_EMERGENCY_SOS_HANDLE"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities-SYDROB_FEATURES"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localizedStringWithFormat:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = (void *)MEMORY[0x1E0CB3940];
  IMSharedUtilitiesFrameworkBundle();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("TS_EMERGENCY_USER_BODY_FIRST_MESSAGE"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities-SYDROB_FEATURES"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringWithFormat:", v33, v61);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)MEMORY[0x1E0CB3940];
  IMSharedUtilitiesFrameworkBundle();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("TS_EMERGENCY_USER_SUBTITLE_MESSAGE"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities-SYDROB_FEATURES"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "localizedStringWithFormat:", v37, v60, v61);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v52 & 1) == 0)
  {
    v39 = (void *)MEMORY[0x1E0CB3940];
    IMSharedUtilitiesFrameworkBundle();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("TS_EMERGENCY_USER_SUBTITLE_MESSAGE"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities-SYDROB_FEATURES"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringWithFormat:", v41, v61, v60);
    v42 = objc_claimAutoreleasedReturnValue();

    v38 = (void *)v42;
  }
  if (v51)
  {
    v43 = (void *)MEMORY[0x1E0CB3940];
    IMSharedUtilitiesFrameworkBundle();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("TS_NOTIFICATION_EMERGENCY_SUBTITLE_DISPLAYNAME_FIRST_MESSASGE"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities-SYDROB_FEATURES"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "stringWithFormat:", v45, v61);
    v46 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v57, "setBody:", v34);
    v38 = (void *)v46;
  }
  else if (((!-[IMDNotificationsController _contentBodyHasLocationURL:](self, "_contentBodyHasLocationURL:", v55) | v52) & 1) == 0)
  {
    v47 = (void *)MEMORY[0x1E0CB3940];
    IMSharedUtilitiesFrameworkBundle();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("TS_LOCATION_SHARED"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities-SYDROB_FEATURES"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "stringWithFormat:", v49, v61);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setBody:", v50);

  }
  objc_msgSend(v57, "setTitle:", v30);
  objc_msgSend(v57, "setSubtitle:", v38);

LABEL_32:
}

- (void)_populateBodyAndTitleForSendFailedNotificationContent:(id)a3 messageDictionary:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CFMutableDictionaryRef Mutable;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  char v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;

  v43 = a3;
  v6 = a4;
  IMSharedUtilitiesFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("MESSAGE_SEND_FAILED"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  IMSharedUtilitiesFrameworkBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("MESSAGE_SEND_TO_UNKNOWN_FAILED"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v43, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  Mutable = (CFMutableDictionaryRef)objc_msgSend(v11, "mutableCopy");

  if (!Mutable)
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("__kmessageHandleKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isCarrierPigeonEnabled");

  if (v15)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("__kmessageServiceKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0D38F70]);

    objc_msgSend(v6, "objectForKey:", CFSTR("__kmessageServiceKey"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0D38F60]);

    if ((v17 & 1) != 0 || v19)
    {
      IMSharedUtilitiesFrameworkBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("MESSAGE_SEND_FAILURE_VIA_SATELLITE_TITLE"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities"));
      v21 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v21;
    }
  }
  if (v13)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("__kmessageCNContactForSenderKey"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDNotificationsController _displayNameForHandle:andContact:](self, "_displayNameForHandle:andContact:", v13, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v24 = (void *)MEMORY[0x1E0CB3940];
      IMSharedUtilitiesFrameworkBundle();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("MESSAGE_SEND_TO_PERSON_FAILED_FORMAT"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringWithFormat:", v26, v23);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", v23, CFSTR("CKBBContextKeySenderName"));
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v25) = objc_msgSend(v28, "isCarrierPigeonEnabled");

      if (!(_DWORD)v25)
        goto LABEL_15;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("__kmessageFlagsKey"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "unsignedLongLongValue");

      objc_msgSend(v6, "objectForKey:", CFSTR("__kmessageServiceKey"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "isEqualToString:", *MEMORY[0x1E0D38F70]);

      objc_msgSend(v6, "objectForKey:", CFSTR("__kmessageServiceKey"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isEqualToString:", *MEMORY[0x1E0D38F60]);

      if ((v30 & 0x20000000000) == 0)
        goto LABEL_15;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("__kmessageItemTypeKey"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "longValue");

      v37 = v36 ? 1 : v32;
      if (((v37 | v34) & 1) == 0)
      {
        IMSharedUtilitiesFrameworkBundle();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("MESSAGE_SEND_FAILED_USER_OFFGRID"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities"));
        v42 = objc_claimAutoreleasedReturnValue();

        v39 = (void *)MEMORY[0x1E0CB3940];
        IMSharedUtilitiesFrameworkBundle();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("MESSAGE_SEND_TO_PERSON_FAILED_FORMAT_USER_OFFGRID"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "localizedStringWithFormat:", v41, v23);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = (void *)v42;
      }
      else
      {
LABEL_15:
        v10 = v27;
      }
    }

  }
  objc_msgSend(v43, "setTitle:", v8);
  objc_msgSend(v43, "setBody:", v10);
  objc_msgSend(v43, "setInterruptionLevel:", 2);
  -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("CKBBContextKeyIsFailedMessage"));
  objc_msgSend(v43, "setUserInfo:", Mutable);

}

- (void)_populateTitleForNotificationContent:(id)a3 chatDictionary:(id)a4 messageDictionary:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  CFMutableDictionaryRef Mutable;
  void *v20;
  char v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  _BOOL4 v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  CFMutableDictionaryRef v37;
  void *v38;
  void *v39;
  char v40;
  unsigned int v41;
  void *v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "objectForKey:", CFSTR("__kmessageHandleKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0D39A60];
  objc_msgSend(v8, "objectForKey:", CFSTR("__kchatEmergencyUserInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "infoFromDictionary:isStewieTranscriptSharingMessage:", v12, 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v13 = 0;
LABEL_21:
    v17 = 0;
    goto LABEL_33;
  }
  objc_msgSend((id)objc_opt_class(), "_addressForHandle:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "length"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("__kmessageGUIDKey"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v45 = v23;
        _os_log_impl(&dword_1ABB60000, v22, OS_LOG_TYPE_INFO, "Unable to create formatted display string for handle from messageGUID %@", buf, 0xCu);

      }
    }
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "stewieEnabled");

  if (v15 && (MEMORY[0x1AF434F4C](v13) & 1) != 0)
  {
    v40 = 0;
    LOBYTE(v41) = -1;
  }
  else
  {
    v41 = ~MEMORY[0x1AF434F1C](v13);
    v40 = 1;
  }
  objc_msgSend(v9, "objectForKey:", CFSTR("__kmessageCNContactForSenderKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDNotificationsController _displayNameForHandle:andContact:](self, "_displayNameForHandle:andContact:", v10, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17 && objc_msgSend(v17, "length"))
  {
    objc_msgSend(v43, "setTitle:", v17);
    objc_msgSend(v43, "userInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    Mutable = (CFMutableDictionaryRef)objc_msgSend(v18, "mutableCopy");

    if (!Mutable)
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", v17, CFSTR("CKBBContextKeySenderName"));
    v37 = Mutable;
    objc_msgSend(v43, "setUserInfo:", Mutable);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("__kchatHandlesForChatKey"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("__kmessageThreadOriginatorKey"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v39, "count") < 2)
    {
      v21 = 0;
    }
    else
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("__kchatStyleKey"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "longLongValue") == 45)
        v21 = 0;
      else
        v21 = v41 & v40;

    }
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isTranscriptSharingEnabled");

    if (v25)
      v21 &= v42 == 0;
    objc_msgSend(v9, "objectForKey:", CFSTR("__kmessageServiceKey"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEqualToString:", *MEMORY[0x1E0D38F58]);

    v28 = -[IMDNotificationsController _amIMentionedInMessage:](self, "_amIMentionedInMessage:", v9);
    if ((v21 & 1) != 0)
      goto LABEL_32;
    if (((v27 | !v28) & 1) != 0)
    {
      if (!v38)
        goto LABEL_32;
      objc_msgSend(v38, "objectForKey:", CFSTR("__kmessageFlagsKey"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "unsignedLongLongValue");

      if ((v30 & 4) == 0)
        goto LABEL_32;
      v31 = (void *)MEMORY[0x1E0CB3940];
      IMSharedUtilitiesFrameworkBundle();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("REPLY_RECEIVED_TITLE"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedStringWithFormat:", v33, v17);
      v34 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = (void *)MEMORY[0x1E0CB3940];
      IMSharedUtilitiesFrameworkBundle();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("MENTION_RECEIVED_TITLE"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "localizedStringWithFormat:", v33, v17);
      v34 = objc_claimAutoreleasedReturnValue();
    }
    v36 = (void *)v34;
    objc_msgSend(v43, "setTitle:", v34);

LABEL_32:
  }
LABEL_33:

}

- (void)_populateSoundAndDisplayActivationForNotificationContent:(id)a3 chatDictionary:(id)a4 messageDictionary:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  BOOL v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  int v24;
  int v25;
  const __CFString *v26;
  const __CFString *v27;
  int v28;
  id v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  const __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CEC6E8], "soundWithAlertType:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("__kmessageCNContactForSenderKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "valueForKey:", *MEMORY[0x1E0C96888]);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      -[NSObject vibration](v13, "vibration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setVibrationIdentifier:", v15);

      -[NSObject sound](v14, "sound");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setToneIdentifier:", v16);

      objc_msgSend(v10, "setShouldIgnoreRingerSwitch:", -[NSObject ignoreMute](v14, "ignoreMute"));
      objc_msgSend(v7, "setShouldIgnoreDoNotDisturb:", -[NSObject ignoreMute](v14, "ignoreMute"));
      if (-[NSObject ignoreMute](v14, "ignoreMute"))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            LOWORD(v28) = 0;
            _os_log_impl(&dword_1ABB60000, v17, OS_LOG_TYPE_INFO, "ignoreMute is YES. Contact is Emergency Broadcast enabled. Expecting notification to bypass system mute and/or system DND.", (uint8_t *)&v28, 2u);
          }

        }
      }
    }
LABEL_12:

    goto LABEL_13;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_1ABB60000, v14, OS_LOG_TYPE_INFO, "messageCNContactForSenderKey not found in messageDictionary.", (uint8_t *)&v28, 2u);
    }
    goto LABEL_12;
  }
LABEL_13:
  objc_msgSend(v9, "objectForKey:", CFSTR("__kmessageAssociatedMessageGUIDKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length") == 0;

  if (!v19)
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("__kmessageAssociatedMessageTypeKey"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "integerValue");

    if ((unint64_t)(v21 - 2000) <= 5)
      objc_msgSend(v10, "setAlertTopic:", **((_QWORD **)&unk_1E5AB0CF8 + v21 - 2000));
  }
  objc_msgSend(v7, "setShouldSuppressScreenLightUp:", 0);
  objc_msgSend(v7, "setSound:", v10);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "sound");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v7, "shouldIgnoreDoNotDisturb");
      v25 = objc_msgSend(v7, "shouldSuppressScreenLightUp");
      v26 = CFSTR("NO");
      if (v24)
        v27 = CFSTR("YES");
      else
        v27 = CFSTR("NO");
      v28 = 138412802;
      v29 = v23;
      v30 = 2112;
      v31 = v27;
      if (v25)
        v26 = CFSTR("YES");
      v32 = 2112;
      v33 = v26;
      _os_log_impl(&dword_1ABB60000, v22, OS_LOG_TYPE_INFO, "Populating sound and display sound %@ ignoreDND %@ suppress screen light up %@", (uint8_t *)&v28, 0x20u);

    }
  }

}

- (void)_populateIgnoresDoNotDisturb:(id)a3 chatDictionary:(id)a4 messageDictionary:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "objectForKey:", CFSTR("__kchatChatIdentifierKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (MEMORY[0x1AF434F4C]())
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v9, "objectForKey:", CFSTR("__kmessageGUIDKey"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412290;
        v17 = v12;
        _os_log_impl(&dword_1ABB60000, v11, OS_LOG_TYPE_INFO, "Chat is flagged as Stewie for message %@ punching through DND", (uint8_t *)&v16, 0xCu);

      }
    }
    if ((objc_msgSend(v10, "hasPrefix:", *MEMORY[0x1E0D394C8]) & 1) == 0)
      goto LABEL_13;
  }
  else if (!objc_msgSend(v10, "hasPrefix:", *MEMORY[0x1E0D394C8]))
  {
    goto LABEL_18;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v9, "objectForKey:", CFSTR("__kmessageGUIDKey"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v14;
      _os_log_impl(&dword_1ABB60000, v13, OS_LOG_TYPE_INFO, "Chat is flagged as Stewie TS for message %@ punching through DND", (uint8_t *)&v16, 0xCu);

    }
  }
LABEL_13:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1ABB60000, v15, OS_LOG_TYPE_INFO, "Setting ShouldIgnoreDoNotDisturb = YES", (uint8_t *)&v16, 2u);
    }

  }
  objc_msgSend(v7, "setShouldIgnoreDoNotDisturb:", 1);
LABEL_18:

}

- (void)_populateTimeSensitiveOrCriticalForNotificationContent:(id)a3 chatDictionary:(id)a4 messageDictionary:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  unsigned int v35;
  void *v36;
  id v37;
  id v38;
  _QWORD v39[8];
  _QWORD v40[8];
  uint8_t buf[4];
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  _BOOL4 v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v37 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v9, "isSOSAlertingEnabled");

  if (!(_DWORD)a4)
    goto LABEL_28;
  objc_msgSend(v8, "objectForKey:", CFSTR("__kmessageFlagsKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedLongLongValue");

  if ((v11 & 0x8000000000) != 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "Message has an SOS flag", buf, 2u);
      }

    }
    if (!-[IMDNotificationsController _messageIsSOSMapURL:](self, "_messageIsSOSMapURL:", v8))
    {
      v35 = 0;
      goto LABEL_15;
    }
  }
  else if (!-[IMDNotificationsController _messageIsSOSMapURL:](self, "_messageIsSOSMapURL:", v8))
  {
    goto LABEL_28;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v13, OS_LOG_TYPE_INFO, "Message has an SOS URL match", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trackEvent:", *MEMORY[0x1E0D38820]);

  v35 = 1;
LABEL_15:
  objc_msgSend(v8, "objectForKey:", CFSTR("__kmessageFlagsKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedLongLongValue");

  sub_1ABB7CCC0();
  v17 = v16 & 0x4000000000;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v18 = objc_msgSend(sub_1ABB7CCC0(), "isSOSMessagesUrgentAlertingEnabled");
    v19 = -[IMDNotificationsController _messageIsFromKnownContact:](self, "_messageIsFromKnownContact:", v8);
    if ((v17 != 0) & v18 & v19)
    {
      if ((unint64_t)objc_msgSend(v38, "realertCount") >= 4)
        v20 = objc_msgSend(v38, "realertCount");
      else
        v20 = 4;
      objc_msgSend(v38, "setRealertCount:", v20);
      v21 = 0;
      v34 = 1;
      v22 = 3;
      goto LABEL_23;
    }
  }
  else
  {
    v19 = -[IMDNotificationsController _messageIsFromKnownContact:](self, "_messageIsFromKnownContact:", v8);
    v18 = 0;
  }
  v34 = 0;
  v21 = 1;
  v22 = 2;
LABEL_23:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = objc_msgSend(v38, "realertCount");
      *(_DWORD *)buf = 67110144;
      v42 = v17 >> 38;
      v43 = 1024;
      v44 = v18;
      v45 = 1024;
      v46 = v19;
      v47 = 2048;
      v48 = v22;
      v49 = 2048;
      v50 = v24;
      _os_log_impl(&dword_1ABB60000, v23, OS_LOG_TYPE_INFO, "SOS Message - hasCriticalFlag:%{BOOL}d, prefEnabled:%{BOOL}d, isFromContact:%{BOOL}d => interruptionLevel:%tu, realertCount:%tu", buf, 0x28u);
    }

  }
  objc_msgSend(v38, "setInterruptionLevel:", v22);
  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = CFSTR("markedSOS");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (v11 >> 39) & 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v25;
  v39[1] = CFSTR("markedCritical");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17 != 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v26;
  v39[2] = CFSTR("sosMapURL");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v35);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v27;
  v39[3] = CFSTR("sosCriticalPrefEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v18);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v28;
  v39[4] = CFSTR("receivedFromContact");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v19);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v40[4] = v29;
  v39[5] = CFSTR("interruptionLevel");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v40[5] = v30;
  v39[6] = CFSTR("interruptionLevelTimeSensitive");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v21);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v40[6] = v31;
  v39[7] = CFSTR("interruptionLevelCritical");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v34);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v40[7] = v32;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 8);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "trackEvent:withDictionary:", *MEMORY[0x1E0D387F8], v33);

LABEL_28:
}

- (BOOL)_messageIsSOSMapURL:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  char v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("__kmessageServiceKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D38F58]);

  if (v5)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("__kmessageTextKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "im_matchesSOSMapURL");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_populateUserInfoOnContentForWatch:(id)a3 messageDictionary:(id)a4 chatDictionary:(id)a5 isCarouselUITriggered:(BOOL)a6
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  uint64_t v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t i;
  void *v38;
  char IsImage;
  void *v40;
  char IsMovie;
  char IsPass;
  char IsMap;
  char IsAudio;
  char IsVCard;
  int IsCalendar;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  __CFDictionary *theDict;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id obj;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  __CFDictionary *v73;
  _BYTE v74[128];
  _QWORD v75[3];

  v75[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v61 = a4;
  v58 = a5;
  v55 = v8;
  objc_msgSend(v8, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "mutableCopy");

  theDict = (__CFDictionary *)v10;
  if (!v10)
    theDict = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  objc_msgSend(v61, "objectForKey:", CFSTR("__kmessageGUIDKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(theDict, CFSTR("CKBBContextKeyMessageGUID"), v11);

  objc_msgSend(v58, "objectForKey:", CFSTR("__kchatChatIdentifierKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    CFDictionarySetValue(theDict, CFSTR("CKBBUserInfoKeyChatIdentifier"), v12);

  objc_msgSend(v58, "objectForKey:", CFSTR("__kchatChatGUIDKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13
    && (objc_msgSend(v58, "objectForKey:", CFSTR("__kchatChatGUIDKey")),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v75[0] = v14,
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 1),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        (v16 = v15) != 0))
  {
    v54 = v16;
    CFDictionarySetValue(theDict, CFSTR("CKBBContextKeyChatGUIDs"), v16);

  }
  else
  {
    v54 = 0;
  }
  objc_msgSend(v58, "objectForKey:", CFSTR("__kchatStyleKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "integerValue") == 43;

  if (v18)
  {
    objc_msgSend(v58, "objectForKey:", CFSTR("__kchatGroupIDKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      CFDictionarySetValue(theDict, CFSTR("CKBBContextKeyChatGroupID"), v19);
  }
  else
  {
    objc_msgSend(v61, "objectForKey:", CFSTR("__kmessageCNContactForSenderKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      CFDictionarySetValue(theDict, CFSTR("CKBBContextKeySenderPersonCentricID"), v20);

  }
  objc_msgSend(v61, "objectForKey:", CFSTR("__kmessageAssociatedMessageGUIDKey"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "length") == 0;

  if (!v22)
  {
    objc_msgSend(v61, "objectForKey:", CFSTR("__kmessageAssociatedMessageTypeKey"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "integerValue");

    if ((v24 & 0xFFFFFFFFFFFFFFF8) == 0x7D0)
    {
      v25 = CFSTR("CKBBContextKeyIsAcknowledgment");
    }
    else
    {
      if (v24 != 1000)
        goto LABEL_23;
      v25 = CFSTR("CKBBContextKeyIsSticker");
    }
    -[__CFDictionary setObject:forKey:](theDict, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v25);
  }
LABEL_23:
  objc_msgSend(v61, "objectForKey:", CFSTR("__kmessageBalloonBundleIDKey"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v57, "length"))
  {
    -[__CFDictionary setObject:forKey:](theDict, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("CKBBContextKeyIsBalloonPluginBulletin"));
    -[__CFDictionary setObject:forKey:](theDict, "setObject:forKey:", v57, CFSTR("CKBBContextKeyBalloonBundleID"));
  }
  objc_msgSend(v61, "objectForKey:", CFSTR("__kmessageExpressiveSendStyleIDKey"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "containsString:", *MEMORY[0x1E0D38098]))
  {

LABEL_28:
    objc_msgSend(v61, "objectForKey:", CFSTR("__kmessageExpressiveSendStyleIDKey"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFDictionary setObject:forKey:](theDict, "setObject:forKey:", v29, CFSTR("CKBBContextKeyEffectIdentifier"));

    v30 = 1;
    goto LABEL_30;
  }
  objc_msgSend(v61, "objectForKey:", CFSTR("__kmessageExpressiveSendStyleIDKey"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "containsString:", *MEMORY[0x1E0D37FF0]);

  if (v28)
    goto LABEL_28;
  v30 = 0;
LABEL_30:
  objc_msgSend(v61, "objectForKey:", CFSTR("__kmessageAttachmentsKey"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v56, "count"))
  {
    if (v30)
      -[__CFDictionary setObject:forKey:](theDict, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("CKBBContextKeyIsAttachmentWithEffectBulletin"));
    objc_msgSend(v55, "body");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFDictionary setObject:forKey:](theDict, "setObject:forKey:", v31, CFSTR("CKBBContentKeyAttachmentSummary"));

    v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    obj = v56;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v69;
      v60 = (void *)*MEMORY[0x1E0D39C18];
      v59 = (void *)*MEMORY[0x1E0D39C08];
      v63 = (void *)*MEMORY[0x1E0D39C10];
      v64 = (void *)*MEMORY[0x1E0D39C00];
      v65 = (void *)*MEMORY[0x1E0D39C68];
      v66 = (void *)*MEMORY[0x1E0D39C78];
      v35 = (void *)*MEMORY[0x1E0D39C70];
      v36 = (void *)*MEMORY[0x1E0D39C60];
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v69 != v34)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "utiString");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          IsImage = IMUTTypeIsImage();
          v40 = v36;
          if ((IsImage & 1) == 0)
          {
            IsMovie = IMUTTypeIsMovie();
            v40 = v35;
            if ((IsMovie & 1) == 0)
            {
              IsPass = IMUTTypeIsPass();
              v40 = v66;
              if ((IsPass & 1) == 0)
              {
                IsMap = IMUTTypeIsMap();
                v40 = v65;
                if ((IsMap & 1) == 0)
                {
                  IsAudio = IMUTTypeIsAudio();
                  v40 = v64;
                  if ((IsAudio & 1) == 0)
                  {
                    IsVCard = IMUTTypeIsVCard();
                    v40 = v63;
                    if ((IsVCard & 1) == 0)
                    {
                      IsCalendar = IMUTTypeIsCalendar();
                      v40 = v60;
                      if (IsCalendar)
                        v40 = v59;
                    }
                  }
                }
              }
            }
          }
          v47 = v40;
          if (v47)
          {
            objc_msgSend(v32, "objectForKey:", v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = v48;
            if (v48)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v48, "unsignedIntegerValue") + 1);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "setObject:forKey:", v50, v47);

            }
            else
            {
              objc_msgSend(v32, "setObject:forKey:", &unk_1E5ADC018, v47);
            }

          }
        }
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
      }
      while (v33);
    }

    if (objc_msgSend(v32, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(obj, "count"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFDictionary setObject:forKey:](theDict, "setObject:forKey:", v51, CFSTR("CKBBContentKeyAttachmentCount"));

      -[__CFDictionary setObject:forKey:](theDict, "setObject:forKey:", v32, CFSTR("CKBBContentKeyCountByAttachmentType"));
    }

  }
  if (-[IMDNotificationsController _amIMentionedInMessage:](self, "_amIMentionedInMessage:", v61))
    -[__CFDictionary setObject:forKey:](theDict, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("messageMentionsMe"));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v73 = theDict;
      _os_log_impl(&dword_1ABB60000, v52, OS_LOG_TYPE_INFO, "Set userInfo for dictionaries %@", buf, 0xCu);
    }

  }
  objc_msgSend(v55, "setUserInfo:", theDict);

}

- (void)_populateUserInfoForMessageContent:(id)a3 messageDictionary:(id)a4 messageIsAddressedToMe:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  CFMutableDictionaryRef Mutable;
  NSObject *v11;
  int v12;
  CFMutableDictionaryRef v13;
  uint64_t v14;

  v5 = a5;
  v14 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  Mutable = (CFMutableDictionaryRef)objc_msgSend(v9, "mutableCopy");

  if (Mutable)
  {
    if (!v5)
      goto LABEL_4;
    goto LABEL_3;
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (v5)
LABEL_3:
    -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("messageIsAddressedToMe"));
LABEL_4:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = Mutable;
      _os_log_impl(&dword_1ABB60000, v11, OS_LOG_TYPE_INFO, "Set userInfo for message content dictionaries %@", (uint8_t *)&v12, 0xCu);
    }

  }
  objc_msgSend(v7, "setUserInfo:", Mutable);

}

- (void)_populateAttachmentsForNotificationContent:(id)a3 messageDictionary:(id)a4 messageRecord:(id)a5 knownSender:(BOOL)a6
{
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t i;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  unsigned int v33;
  int v34;
  NSObject *v35;
  void *v36;
  int v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  const __CFArray **v53;
  void *v54;
  void *v55;
  char v56;
  id v57;
  void *v58;
  id v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  const __CFString *inConformsToUTI;
  _BOOL4 v66;
  id obj;
  id v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  id v73;
  id v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  id v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  id v87;
  uint64_t v88;
  const __CFString *v89;
  _BYTE v90[128];
  uint64_t v91;

  v66 = a6;
  v91 = *MEMORY[0x1E0C80C00];
  v57 = a3;
  v8 = a4;
  v53 = (const __CFArray **)a5;
  v55 = v8;
  objc_msgSend(v8, "objectForKey:", CFSTR("__kmessageAttributedBodyKey"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v54, "__im_isRichCardsOrSuggestedReply") & 1) == 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("__kmessageExpressiveSendStyleIDKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9
      || (objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("__kmessageExpressiveSendStyleIDKey")),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D380A0]),
          v10,
          (v11 & 1) == 0))
    {
      objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("__kmessageAttachmentsKey"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      obj = v12;
      v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v90, 16);
      if (v72)
      {
        v56 = 0;
        v69 = 0;
        v70 = *(_QWORD *)v77;
        inConformsToUTI = (const __CFString *)*MEMORY[0x1E0CA5B10];
        v60 = *MEMORY[0x1E0CEC7F8];
        do
        {
          for (i = 0; i != v72; ++i)
          {
            if (*(_QWORD *)v77 != v70)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
            objc_msgSend(v14, "utiString");
            v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "path");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "guid");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v14, "transferState");
            objc_msgSend(v71, "setObject:forKeyedSubscript:", v14, v17);
            if (objc_msgSend(v16, "length"))
              v19 = v18 == 5;
            else
              v19 = 0;
            if (v19)
            {
              objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v16, 0);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = UTTypeConformsTo(v15, inConformsToUTI);
              if (!v69)
              {
                if (v21)
                {
                  IMPreviewCachesDirectoryWithAttachmentURL();
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "lastPathComponent");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v62, "URLByAppendingPathComponent:isDirectory:", v61, 0);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "URLByAppendingPathExtension:", CFSTR("plist"));
                  v63 = (void *)objc_claimAutoreleasedReturnValue();

                  v75 = 0;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v63, &v75);
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  v59 = v75;
                  v23 = IMOSLoggingEnabled();
                  if (v64)
                  {
                    if (v23)
                    {
                      OSLogHandleForIMFoundationCategory();
                      v24 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412290;
                        v81 = v63;
                        _os_log_impl(&dword_1ABB60000, v24, OS_LOG_TYPE_INFO, "Successfully loaded contact plist at: %@", buf, 0xCu);
                      }

                    }
                    objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("contactFormatterTitle"));
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("organizationNameTitle"));
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v26, "length"))
                    {
                      v27 = v26;

                      v25 = v27;
                    }
                    +[IMDNotificationsController _truncateNameIfNeeded:](IMDNotificationsController, "_truncateNameIfNeeded:", v25);
                    v28 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v28)
                    {
                      objc_msgSend(v57, "setBody:", v28);
                      v56 = 1;
                    }
                    v69 = v14;

                  }
                  else
                  {
                    if (v23)
                    {
                      OSLogHandleForIMFoundationCategory();
                      v29 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412546;
                        v81 = v63;
                        v82 = 2112;
                        v83 = v59;
                        _os_log_impl(&dword_1ABB60000, v29, OS_LOG_TYPE_INFO, "Failed to load contact plist at: %@ (error: %@)", buf, 0x16u);
                      }

                    }
                    v69 = 0;
                  }

                }
                else
                {
                  v69 = 0;
                }
              }

            }
            if (objc_msgSend(v16, "length"))
              v30 = v18 == 5;
            else
              v30 = 0;
            if (v30)
            {
              objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v16, 0);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[IMDNotificationsController _notificationsSafePreviewFileURLForTransferURL:utiType:knownSender:](self, "_notificationsSafePreviewFileURLForTransferURL:utiType:knownSender:", v31, v15, v66);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v14, "isCommSafetySensitive");
              v34 = objc_msgSend(v14, "isAdaptiveImageGlyph");
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v35 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v33);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v81 = v36;
                  _os_log_impl(&dword_1ABB60000, v35, OS_LOG_TYPE_INFO, "CommSafety Sensitive value on the record: %@", buf, 0xCu);

                }
              }
              if (v32)
                v37 = v33;
              else
                v37 = 1;
              if (((v37 | v34) & 1) != 0)
              {
                if (IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v38 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v81 = v31;
                    _os_log_impl(&dword_1ABB60000, v38, OS_LOG_TYPE_INFO, "We didn't generate a previewFileURL for transfer %@ to generate a notification preview", buf, 0xCu);
                  }

                }
              }
              else
              {
                v88 = v60;
                v89 = CFSTR("public.jpeg");
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v74 = 0;
                objc_msgSend(MEMORY[0x1E0CEC718], "attachmentWithIdentifier:URL:options:error:", v17, v32, v41, &v74);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = v74;
                if (IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v44 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138413058;
                    v81 = v32;
                    v82 = 2112;
                    v83 = v31;
                    v84 = 2112;
                    v85 = v42;
                    v86 = 2112;
                    v87 = v43;
                    _os_log_impl(&dword_1ABB60000, v44, OS_LOG_TYPE_INFO, "generated previewfile url %@ for transfer %@ as unnotificationattachment %@ with error %@", buf, 0x2Au);
                  }

                }
                if (v42)
                  objc_msgSend(v58, "addObject:", v42);

              }
            }
            else if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v39 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v81 = v16;
                v82 = 2112;
                v83 = v40;
                v84 = 2112;
                v85 = v17;
                _os_log_impl(&dword_1ABB60000, v39, OS_LOG_TYPE_INFO, "Filename was null (%@) or transfer state was not finished (%@) for file transfer %@ -- did not generate attachment preview", buf, 0x20u);

              }
            }

          }
          v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v90, 16);
        }
        while (v72);
      }
      else
      {
        v56 = 0;
        v69 = 0;
      }

      v45 = IMDCreateIMItemFromIMDMessageRecordRefWithAccountLookup(v53, 0, 1, 0);
      if (v45)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v55, "objectForKey:", CFSTR("__kmessageHandleKey"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "objectForKey:", CFSTR("__kmessageCNContactForSenderKey"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDNotificationsController _displayNameForHandle:andContact:](self, "_displayNameForHandle:andContact:", v46, v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D397A8], "firstNameForCNContact:", v47);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v49, "length"))
          {
            v50 = v48;

            v49 = v50;
          }
          v73 = v71;
          IMSharedMessageSummaryCreateWithShortName();
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v51;
          if ((v56 & 1) == 0 && objc_msgSend(v51, "length"))
            objc_msgSend(v57, "setBody:", v52);

        }
      }
      if (objc_msgSend(v58, "count"))
        objc_msgSend(v57, "setAttachments:", v58);

    }
  }

}

+ (int)validateAlertCount:(int)a3
{
  if (a3 > 0xB)
    return 2;
  else
    return dword_1ABC697F0[a3];
}

+ (int)reminderAlertCount
{
  int result;
  __CFNotificationCenter *DarwinNotifyCenter;
  CFIndex AppIntegerValue;
  Boolean keyExistsAndHasValidFormat;

  result = dword_1ED0D2884;
  if (dword_1ED0D2884 == -1)
  {
    if ((byte_1ED0D3900 & 1) == 0)
    {
      byte_1ED0D3900 = 1;
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_1ABB7E3A0, CFSTR("com.apple.MobileSMS.IncomingMessageAlertCount.changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    keyExistsAndHasValidFormat = 0;
    CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
    AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("IncomingMessageAlertCount"), CFSTR("com.apple.MobileSMS"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat == 1)
      result = objc_msgSend(a1, "validateAlertCount:", AppIntegerValue);
    else
      result = 2;
    dword_1ED0D2884 = result;
  }
  return result;
}

- (void)_populateRealertCountForNotificationContent:(id)a3
{
  id v3;
  int v4;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend((id)objc_opt_class(), "reminderAlertCount") - 1;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6[0] = 67109120;
        v6[1] = v4;
        _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "Setting repeat alert count to %d", (uint8_t *)v6, 8u);
      }

    }
    objc_msgSend(v3, "setRealertCount:", v4);
  }

}

- (BOOL)_messageShouldBeSpoken:(id)a3 chatDictionary:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("__kmessageHandleKey"));
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
LABEL_7:
    LOBYTE(v10) = 0;
    goto LABEL_8;
  }
  if (-[IMDNotificationsController _chatIsMuted:](self, "_chatIsMuted:", v7))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v13 = 138412290;
        v14 = CFSTR("YES");
        _os_log_impl(&dword_1ABB60000, v9, OS_LOG_TYPE_INFO, "Chat has isMuted set %@, not marking as spoken message allowlisted", (uint8_t *)&v13, 0xCu);
      }

    }
    goto LABEL_7;
  }
  v10 = -[IMDNotificationsController _handleIsSpokenMessageAllowlisted:chat:message:](self, "_handleIsSpokenMessageAllowlisted:chat:message:", v8, v7, v6);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = 138412546;
      v14 = v8;
      v15 = 1024;
      v16 = v10;
      _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "Contact %@ isSpokenMessageAllowlisted: %d", (uint8_t *)&v13, 0x12u);
    }

  }
LABEL_8:

  return v10;
}

- (BOOL)_isMostActiveDevice
{
  id v2;
  id v3;
  id v4;
  dispatch_semaphore_t v5;
  id v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  char v10;
  uint8_t v12[8];
  _QWORD v13[4];
  id v14;
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  v2 = objc_alloc_init(MEMORY[0x1E0D97428]);
  objc_msgSend(v2, "setType:", 1);
  if (qword_1EEC40308 != -1)
    dispatch_once(&qword_1EEC40308, &unk_1E5AB0CC0);
  v3 = (id)qword_1EEC40310;
  objc_msgSend(v2, "setDispatchQueue:", v3);

  v4 = v2;
  v5 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1ABB7E908;
  v13[3] = &unk_1E5AB0A50;
  v16 = &v17;
  v6 = v4;
  v14 = v6;
  v7 = v5;
  v15 = v7;
  objc_msgSend(v6, "setCompletionHandler:", v13);
  objc_msgSend(v6, "start");
  v8 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(v7, v8) && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1ABB60000, v9, OS_LOG_TYPE_INFO, "timeout waiting for completionHandler from SFCoordinatedAlertRequest", v12, 2u);
    }

  }
  v10 = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (BOOL)_UTITypeMightBeAnimated:(id)a3
{
  const __CFString *v3;
  __CFString *v4;
  BOOL v5;

  v3 = (const __CFString *)a3;
  v4 = (__CFString *)v3;
  v5 = v3
    && (UTTypeConformsTo(v3, (CFStringRef)*MEMORY[0x1E0CA5B68])
     || UTTypeConformsTo(v4, (CFStringRef)*MEMORY[0x1E0CA5C10]));

  return v5;
}

- (BOOL)_fileURLIsActuallyAnimated:(id)a3
{
  return IMFileURLIsActuallyAnimated();
}

- (id)_notificationsSafePreviewFileURLForTransferURL:(id)a3 utiType:(id)a4 knownSender:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  _BOOL4 v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v5 = a5;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = -[IMDNotificationsController _UTITypeMightBeAnimated:](self, "_UTITypeMightBeAnimated:", v9);
  if (v5)
  {
    if (v10 && -[IMDNotificationsController _fileURLIsActuallyAnimated:](self, "_fileURLIsActuallyAnimated:", v8))
    {
      v11 = v8;
      if (!v11)
        goto LABEL_20;
      goto LABEL_13;
    }
  }
  else if (v10)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v9;
        _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "UTI might be animated (%@) but it was sent by an unknown sender, so skipping preview.", buf, 0xCu);
      }

    }
    v11 = 0;
    goto LABEL_20;
  }
  IMPreviewExtension();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  IMAttachmentPreviewFileURL();
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_20:
    v21 = 0;
    goto LABEL_21;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "fileExistsAtPath:", v15);

  if (!v16)
    goto LABEL_20;
  IMSafeTemporaryDirectory();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastPathComponent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByAppendingPathComponent:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v22, "copyItemAtURL:toURL:error:", v11, v21, &v26);
  v23 = v26;

  if (v23 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v23;
      _os_log_impl(&dword_1ABB60000, v24, OS_LOG_TYPE_INFO, "Error when copy preview image: [%@]", buf, 0xCu);
    }

  }
LABEL_21:

  return v21;
}

- (BOOL)_handleIsSpokenMessageAllowlisted:(id)a3 chat:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v25;
  double v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[IMDNotificationsController _getMessagesSpokenAllowlistLevel:](self, "_getMessagesSpokenAllowlistLevel:", 0);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v25 = 134217984;
      v26 = *(double *)&v11;
      _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "SpokenMessageAllowlistLevel: %lu", (uint8_t *)&v25, 0xCu);
    }

  }
  if (v11 == 3)
  {
LABEL_11:
    v13 = 1;
    goto LABEL_30;
  }
  if (v11 != 2)
  {
    if (v11 != 1 && -[IMDNotificationsController _messageIsFromKnownContact:](self, "_messageIsFromKnownContact:", v10))
    {
      if (v11 == 4)
      {
        v13 = -[IMDNotificationsController _messageIsFromFavorite:](self, "_messageIsFromFavorite:", v10);
        goto LABEL_30;
      }
      goto LABEL_11;
    }
    goto LABEL_29;
  }
  objc_msgSend(v9, "objectForKey:", CFSTR("__kchatLastMessageTimestamp"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "longLongValue");

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v25 = 134217984;
      v26 = (double)v15;
      _os_log_impl(&dword_1ABB60000, v16, OS_LOG_TYPE_INFO, "Last message timestamp: %f", (uint8_t *)&v25, 0xCu);
    }

  }
  if (!v15)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v9, "valueForKey:", CFSTR("__kchatChatGUIDKey"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138412290;
        v26 = *(double *)&v21;
        _os_log_impl(&dword_1ABB60000, v20, OS_LOG_TYPE_INFO, "Missing last read date for chatID %@", (uint8_t *)&v25, 0xCu);

      }
    }
LABEL_29:
    v13 = 0;
    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v25 = 138412290;
      v26 = *(double *)&v17;
      _os_log_impl(&dword_1ABB60000, v18, OS_LOG_TYPE_INFO, "Last message date: %@", (uint8_t *)&v25, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "isDateInToday:", v17) & 1) != 0)
    v13 = 1;
  else
    v13 = objc_msgSend(v19, "isDateInYesterday:", v17);

LABEL_30:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "valueForKey:", CFSTR("__kmessageGUIDKey"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412546;
      v26 = *(double *)&v23;
      v27 = 1024;
      v28 = v13;
      _os_log_impl(&dword_1ABB60000, v22, OS_LOG_TYPE_INFO, "Message: %@ is spoken message allowlisted: %d", (uint8_t *)&v25, 0x12u);

    }
  }

  return v13;
}

- (unint64_t)_getSpokenMessageAllowlistLevelVersion
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[IMDNotificationsController defaultsSharedInstance](self, "defaultsSharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValueFromDomain:forKey:", CFSTR("com.apple.MobileSMS"), CFSTR("kSpokenMessageWhitelistLevelVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (void)_setSpokenMessageAllowlistLevelVersion:(unint64_t)a3
{
  void *v4;
  id v5;

  -[IMDNotificationsController defaultsSharedInstance](self, "defaultsSharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forDomain:forKey:", v4, CFSTR("com.apple.MobileSMS"), CFSTR("kSpokenMessageWhitelistLevelVersion"));

}

- (id)_lastMessageTimeForChat:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[IMDNotificationsController _lastTwoMessagesForChat:](self, "_lastTwoMessagesForChat:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 2)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_lastTwoMessagesForChat:(id)a3
{
  return (id)IMDChatRecordCopyMessagesWithLimit((uint64_t)a3, 2);
}

- (BOOL)_messageIsFromFavorite:(id)a3
{
  id v3;
  IMDCNPersonAliasResolver *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(IMDCNPersonAliasResolver);
  objc_msgSend(v3, "objectForKey:", CFSTR("__kmessageCNContactForSenderKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = -[IMDCNPersonAliasResolver isCNContactFavorited:](v4, "isCNContactFavorited:", v5);
  return (char)v3;
}

- (unint64_t)_getMessagesSpokenAllowlistLevel:(BOOL *)a3
{
  unint64_t result;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize(CFSTR("com.apple.MobileSMS"));
  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppIntegerValue(CFSTR("kSpokenMessageWhitelistLevel"), CFSTR("com.apple.MobileSMS"), &keyExistsAndHasValidFormat);
  if (a3)
    *a3 = keyExistsAndHasValidFormat == 0;
  return result;
}

- (void)_setMessagesSpokenAllowlistLevelInPreferences:(unint64_t)a3
{
  void *v4;
  id v5;

  -[IMDNotificationsController defaultsSharedInstance](self, "defaultsSharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forDomain:forKey:", v4, CFSTR("com.apple.MobileSMS"), CFSTR("kSpokenMessageWhitelistLevel"));

}

+ (id)_truncateNameIfNeeded:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = v3;
  if ((unint64_t)objc_msgSend(v3, "length") >= 0xC9)
  {
    objc_msgSend(v3, "substringWithRange:", 0, 200);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (id)_addressBookNameForAddress:(id)a3 orContact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
    goto LABEL_11;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1ABB60000, v9, OS_LOG_TYPE_INFO, "We don't have a contact to use. Fetching one", (uint8_t *)&v15, 2u);
    }

  }
  objc_msgSend(v6, "_stripFZIDPrefix");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_IMDCoreSpotlightCNContactForAddress:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v15 = 138412546;
      v16 = v10;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_1ABB60000, v11, OS_LOG_TYPE_INFO, "Stripped address: %@, contactToUse: %@", (uint8_t *)&v15, 0x16u);
    }

  }
  if (v8)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0D397A8], "displayNameForContact:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v15 = 138412290;
        v16 = v12;
        _os_log_impl(&dword_1ABB60000, v13, OS_LOG_TYPE_INFO, "Contact to use valid. AddressBookName : %@", (uint8_t *)&v15, 0xCu);
      }

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)_uncanonicalizedAddressForHandle:(id)a3
{
  return (id)objc_msgSend(a3, "uncanonicalizedURIString");
}

+ (id)_addressForHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(v4, "canonicalizedURIString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || !objc_msgSend(v5, "length"))
  {
    objc_msgSend(a1, "_uncanonicalizedAddressForHandle:", v4);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }

  return v6;
}

+ (id)_countryCodeForHandle:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](a3, sel_countryCodeString);
}

+ (id)_formattedDisplayStringForAddress:(id)a3 countryCode:(id)a4
{
  return (id)IMFormattedDisplayStringForIDWithCountryCode();
}

+ (id)_database
{
  return +[IMDDatabase synchronousDatabase](IMDDatabase, "synchronousDatabase");
}

+ (id)_displayNameForHandle:(id)a3 andContact:(id)a4 businessNameManager:(id)a5 suggestionProvider:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  NSObject *v38;
  id v39;
  NSObject *v40;
  int v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  objc_msgSend((id)objc_opt_class(), "_addressForHandle:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "im_stripCategoryLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "hasSuffix:", *MEMORY[0x1E0D37DC0]))
  {
    IMSharedUtilitiesFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("TS_NOTIFICATION_EMERGENCY_SOS_HANDLE"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities-SYDROB_FEATURES"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "stewieEnabled");

  if (v19)
  {
    if (IMIsStringStewieEmergency())
    {
      IMSharedUtilitiesFrameworkBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("STEWIE_NOTIFICATION_EMERGENCY_SOS_HANDLE"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities-SYDROB_FEATURES"));
      v21 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    if (IMIsStringStewieRoadside())
    {
      objc_msgSend(a1, "_database");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "chatRecordsWithIdentifier:", v15);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(a1, "_displayNameForChatRecord:", v20);
        v25 = objc_claimAutoreleasedReturnValue();

        v17 = (void *)v25;
      }
      if (v17)
        goto LABEL_12;
      IMSharedUtilitiesFrameworkBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("STEWIE_NOTIFICATION_ROADSIDE_HANDLE"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities-Avocet"));
      v21 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v22 = (void *)v21;

      v17 = v22;
LABEL_12:

    }
  }
  if (!objc_msgSend(v17, "length")
    && ((MEMORY[0x1AF434F1C](v15) & 1) != 0 || objc_msgSend(v15, "__im_isChatBot")))
  {
    objc_msgSend((id)objc_opt_class(), "_displayNameForBusinessChatAddress:businessNameManager:", v15, v12);
    v26 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v26;
  }
  if (!objc_msgSend(v17, "length")
    && (!v11 || objc_msgSend(MEMORY[0x1E0D397A8], "isCNContactAKnownContact:", v11)))
  {
    objc_msgSend((id)objc_opt_class(), "_addressBookNameForAddress:orContact:", v15, v11);
    v27 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v27;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v42 = 138412802;
      v43 = v15;
      v44 = 2112;
      v45 = v17;
      v46 = 2112;
      v47 = v11;
      _os_log_impl(&dword_1ABB60000, v28, OS_LOG_TYPE_INFO, "Address: %@, displayName = %@. Contact = %@", (uint8_t *)&v42, 0x20u);
    }

  }
  v29 = objc_msgSend(v17, "length");
  if (v13 && !v29)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        LOWORD(v42) = 0;
        _os_log_impl(&dword_1ABB60000, v30, OS_LOG_TYPE_INFO, "We don't have an address book name, so going to try and suggest a name", (uint8_t *)&v42, 2u);
      }

    }
    v13[2](v13, v15);
    v31 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v31;
  }
  if (objc_msgSend(v17, "length"))
  {
    v32 = v17;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        LOWORD(v42) = 0;
        _os_log_impl(&dword_1ABB60000, v33, OS_LOG_TYPE_INFO, "Defaulting to the handle for the display name", (uint8_t *)&v42, 2u);
      }

    }
    objc_msgSend((id)objc_opt_class(), "_countryCodeForHandle:", v10);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_formattedDisplayStringForAddress:countryCode:", v15, v34);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "_uncanonicalizedAddressForHandle:", v10);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "lowercaseString");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v32, "isEqualToString:", v36);

    if (v37)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          LOWORD(v42) = 0;
          _os_log_impl(&dword_1ABB60000, v38, OS_LOG_TYPE_INFO, "Handle display name is equal to lowercase uncanonicalized address, falling back to preserve case", (uint8_t *)&v42, 2u);
        }

      }
      v39 = v35;

      v32 = v39;
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      v42 = 138412290;
      v43 = v32;
      _os_log_impl(&dword_1ABB60000, v40, OS_LOG_TYPE_INFO, "Display name = %@", (uint8_t *)&v42, 0xCu);
    }

  }
  return v32;
}

- (id)_displayNameForHandle:(id)a3 andContact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_class();
  -[IMDNotificationsController businessNameManager](self, "businessNameManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1ABB7FD00;
  v12[3] = &unk_1E5AB0A78;
  v12[4] = self;
  objc_msgSend(v8, "_displayNameForHandle:andContact:businessNameManager:suggestionProvider:", v7, v6, v9, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_displayNameForHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IMDNotificationsController contactForHandleRecord:](self, "contactForHandleRecord:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDNotificationsController _displayNameForHandle:andContact:](self, "_displayNameForHandle:andContact:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_suggestedDisplayNameForAddress:(id)a3
{
  return _IMDCoreSpotlightSuggestedNameForAddress(a3);
}

- (id)_nicknameDisplayNameForID:(id)a3
{
  void *v3;
  void *v4;

  _IMDCoreSpotlightNicknameForAddress(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _IMDContactNameForNickname(v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_displayNameForBusinessChatAddress:(id)a3 businessNameManager:(id)a4
{
  id v5;
  id v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  dispatch_time_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  uint8_t v19[16];
  _QWORD v20[4];
  NSObject *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v5 = a3;
  v6 = a4;
  v7 = dispatch_semaphore_create(0);
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_1ABB80020;
  v27 = sub_1ABB80030;
  v28 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1ABB80038;
  v20[3] = &unk_1E5AB0AA0;
  v22 = &v23;
  v8 = v7;
  v21 = v8;
  objc_msgSend(v6, "businessNameForUID:updateHandler:", v5, v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    v13 = dispatch_time(0, 3000000000);
    if (dispatch_semaphore_wait(v8, v13))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v19 = 0;
          _os_log_impl(&dword_1ABB60000, v14, OS_LOG_TYPE_INFO, "Business name lookup timed out", v19, 2u);
        }

      }
    }
    else
    {
      v15 = (void *)v24[5];
      if (v15)
      {
        v11 = v15;
        goto LABEL_3;
      }
    }
    IMSharedUtilitiesFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("BUSINESS_NOTIFICATION_TITLE"), &stru_1E5AC1D70, CFSTR("IMSharedUtilities"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  v11 = v9;
LABEL_3:
  v12 = v11;
LABEL_12:
  v17 = v12;

  _Block_object_dispose(&v23, 8);
  return v17;
}

- (BOOL)_filteringSettingConfirmed
{
  int v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  char v12;
  int v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = IMSharedHelperDeviceIsiPad();
  -[IMDNotificationsController defaultsSharedInstance](self, "defaultsSharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "getBoolFromDomain:forKey:", CFSTR("com.apple.carrier"), CFSTR("ShowMessagesConversationListFilteringPrompt"));

  if ((IMSharedHelperDeviceHasMultipleSubscriptions() & 1) != 0)
    v6 = objc_msgSend(MEMORY[0x1E0D39730], "IMMessagesFilteringSettingForPreferedSubscription");
  else
    v6 = v3 | v5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("NO");
      if (v3)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      if (v6)
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      v14 = 138412802;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      if (v5)
        v8 = CFSTR("YES");
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, " deviceIsiPad %@ allowPromptToConfirmSetting %@ carrier setting %@", (uint8_t *)&v14, 0x20u);
    }

  }
  if (!v6)
    return 1;
  -[IMDNotificationsController defaultsSharedInstance](self, "defaultsSharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "getBoolFromDomain:forKey:", CFSTR("com.apple.MobileSMS"), CFSTR("MessageFilteringSettingsConfirmed"));

  return v12;
}

- (BOOL)_deviceIsElgibileToBeForcedIntoFilteringUnknownSenders
{
  int v3;

  v3 = objc_msgSend(MEMORY[0x1E0D397F8], "IMDeviceRegionIsEligibleToBeForcedIntoFilteringUnknownSender");
  if (v3)
    LOBYTE(v3) = !-[IMDNotificationsController _filteringSettingConfirmed](self, "_filteringSettingConfirmed");
  return v3;
}

+ (BOOL)isUnknownSenderFilteringOn
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getValueFromDomain:forKey:", CFSTR("com.apple.MobileSMS"), CFSTR("IncomingMessageAlertFiltration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    LOBYTE(v5) = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    objc_msgSend(a1, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "_deviceIsElgibileToBeForcedIntoFilteringUnknownSenders");

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = CFSTR("NO");
        if (v5)
          v8 = CFSTR("YES");
        v10 = 138412290;
        v11 = v8;
        _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "We have never set the filtering default, check if we should be doing it by default %@", (uint8_t *)&v10, 0xCu);
      }

    }
  }

  return v5;
}

+ (BOOL)isSpamFilteringOn
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getBoolFromDomain:forKey:", CFSTR("com.apple.MobileSMS"), CFSTR("IncomingMessageAlertSpamFiltration"));

  return v3;
}

- (BOOL)_messageIsFromKnownContact:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "objectForKey:", CFSTR("__kmessageCNContactForSenderKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(MEMORY[0x1E0D397A8], "isCNContactAKnownContact:", v3);

  return v4;
}

- (BOOL)_messageIsBusiness:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "objectForKey:", CFSTR("__kmessageHandleKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_addressForHandle:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    if ((MEMORY[0x1AF434F1C](v4) & 1) != 0)
      v6 = 1;
    else
      v6 = objc_msgSend(v5, "__im_isChatBot");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_messageIsStewieEmergency:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  NSObject *v10;
  const __CFString *v11;
  int v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "stewieEnabled");

  if (v5)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("__kmessageHandleKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_addressForHandle:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
    {
      v9 = MEMORY[0x1AF434F4C](v7);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = CFSTR("NO");
          if (v9)
            v11 = CFSTR("YES");
          v13 = 138412290;
          v14 = v11;
          _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "Sender is Stewie emergency: %@", (uint8_t *)&v13, 0xCu);
        }

      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)_notificationIsFromAFilteredSender:(id)a3 messageDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  NSObject *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  BOOL v25;
  void *v27;
  void *v28;
  int v29;
  int v30;
  uint8_t buf[4];
  const __CFString *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  const __CFString *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKey:", CFSTR("__kmessageServiceKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D38F58]);
  v30 = objc_msgSend((id)objc_opt_class(), "isUnknownSenderFilteringOn");
  v10 = objc_msgSend((id)objc_opt_class(), "isSpamFilteringOn");
  objc_msgSend(v6, "objectForKey:", CFSTR("__kchatIsFilteredKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "BOOLValue") & 1) != 0)
  {
    v29 = 1;
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("__kchatWasReportedAsiMessageSpamKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v12, "BOOLValue");

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("__kchatSMSCategoryKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "intValue") == 1)
  {
    LODWORD(v14) = 1;
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("__kchatWasDetectedAsSMSSpamKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "BOOLValue") & 1) != 0)
    {
      LODWORD(v14) = 1;
    }
    else
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("__kchatWasReportedAsiMessageSpamKey"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "BOOLValue") & 1) != 0)
      {
        LODWORD(v14) = 1;
      }
      else
      {
        objc_msgSend(v6, "objectForKey:", CFSTR("__kchatWasDetectedAsiMessageSpamKey"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v28, "BOOLValue") & 1) != 0)
        {
          LODWORD(v14) = 1;
        }
        else
        {
          objc_msgSend(v7, "objectForKey:", CFSTR("__kmessageFlagsKey"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = ((unint64_t)objc_msgSend(v27, "integerValue") >> 27) & 1;

        }
      }

    }
  }

  v17 = -[IMDNotificationsController _messageIsFromKnownContact:](self, "_messageIsFromKnownContact:", v7);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = CFSTR("NO");
      if (v9)
        v20 = CFSTR("YES");
      else
        v20 = CFSTR("NO");
      if (v30)
        v21 = CFSTR("YES");
      else
        v21 = CFSTR("NO");
      *(_DWORD *)buf = 138413570;
      v32 = v20;
      if (v10)
        v22 = CFSTR("YES");
      else
        v22 = CFSTR("NO");
      v33 = 2112;
      v34 = v21;
      if (v29)
        v23 = CFSTR("YES");
      else
        v23 = CFSTR("NO");
      v35 = 2112;
      v36 = v22;
      if ((_DWORD)v14)
        v24 = CFSTR("YES");
      else
        v24 = CFSTR("NO");
      v37 = 2112;
      v38 = v23;
      if (v17)
        v19 = CFSTR("YES");
      v39 = 2112;
      v40 = v24;
      v41 = 2112;
      v42 = v19;
      _os_log_impl(&dword_1ABB60000, v18, OS_LOG_TYPE_INFO, "isSMS %@ unknownFilterinOn %@ smsSpamFilteringOn %@ chatIsFiltered %@ isSpam %@ isContact %@", buf, 0x3Eu);
    }

  }
  if (v9 | v14 ^ 1)
    v25 = v9 & v10 & v14 & !v17;
  else
    v25 = !v17;

  return v25;
}

- (BOOL)_chatIsMuted:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("__kchatIsMutedKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)_chatHasCategoryMuted:(id)a3 isFromContact:(BOOL)a4
{
  id v6;
  int v7;
  int v8;
  void *v9;
  uint64_t v10;
  BOOL result;
  void *v12;
  void *v13;
  const __CFString *v14;
  char v15;

  v6 = a3;
  v7 = objc_msgSend((id)objc_opt_class(), "isUnknownSenderFilteringOn");
  v8 = objc_msgSend((id)objc_opt_class(), "isSpamFilteringOn");
  objc_msgSend(v6, "objectForKey:", CFSTR("__kchatIsFilteredKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "intValue") & 0xF;
  switch(v10)
  {
    case 1:
      if (a4)
        return 0;
      -[IMDNotificationsController defaultsSharedInstance](self, "defaultsSharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("IncomingMessageAlertFiltrationUnknownSenders");
      break;
    case 2:
      return 1;
    case 3:
      result = 0;
      if ((v7 & v8) != 1 || a4)
        return result;
      -[IMDNotificationsController defaultsSharedInstance](self, "defaultsSharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("IncomingMessageAlertFiltrationPromotions");
      break;
    case 4:
      result = 0;
      if ((v7 & v8) != 1 || a4)
        return result;
      -[IMDNotificationsController defaultsSharedInstance](self, "defaultsSharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("IncomingMessageAlertFiltrationTransactions");
      break;
    default:
      return 0;
  }
  v15 = objc_msgSend(v12, "getBoolFromDomain:forKey:", CFSTR("com.apple.MobileSMS"), v14);

  return v15;
}

- (BOOL)_shouldPostNotificationForChat:(id)a3 messageDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  NSObject *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  int v20;
  const __CFString *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D396C0], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "shouldFilterIncomingMessages"))
  {
    v10 = 1;
    if (!v6)
      goto LABEL_26;
    goto LABEL_10;
  }
  -[IMDNotificationsController _handleIDsForChatDictionary:](self, "_handleIDsForChatDictionary:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "allowsConversationWithHandleIDs:", v9);
  if ((v10 & 1) == 0 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1ABB60000, v11, OS_LOG_TYPE_INFO, "We are not posting the notification in Assistive Access because this conversation is not allowed.", (uint8_t *)&v20, 2u);
    }

  }
  if (v6)
  {
LABEL_10:
    if (v10)
    {
      v12 = -[IMDNotificationsController _chatIsMuted:](self, "_chatIsMuted:", v6);
      v13 = -[IMDNotificationsController _notificationIsFromAFilteredSender:messageDictionary:](self, "_notificationIsFromAFilteredSender:messageDictionary:", v6, v7);
      v14 = -[IMDNotificationsController _chatHasCategoryMuted:isFromContact:](self, "_chatHasCategoryMuted:isFromContact:", v6, -[IMDNotificationsController _messageIsFromKnownContact:](self, "_messageIsFromKnownContact:", v7));
      if (v12 || v13 || v14)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            v16 = CFSTR("NO");
            if (v12)
              v17 = CFSTR("YES");
            else
              v17 = CFSTR("NO");
            if (v13)
              v18 = CFSTR("YES");
            else
              v18 = CFSTR("NO");
            v20 = 138412802;
            v21 = v17;
            v22 = 2112;
            v23 = v18;
            if (v14)
              v16 = CFSTR("YES");
            v24 = 2112;
            v25 = v16;
            _os_log_impl(&dword_1ABB60000, v15, OS_LOG_TYPE_INFO, "We are not posting the notification because chat is muted (%@)                                                 or it's from a filtered unknown sender (%@)                                                 or the chat category is muted (%@)", (uint8_t *)&v20, 0x20u);
          }

        }
        LOBYTE(v10) = 0;
      }
      else
      {
        LOBYTE(v10) = 1;
      }
    }
  }
LABEL_26:

  return v10;
}

- (BOOL)_isUnknownSenders:(id)a3
{
  void *v3;
  int v4;

  if (!a3)
    return 0;
  objc_msgSend(a3, "objectForKey:", CFSTR("__kchatIsFilteredKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4 == 1;
}

- (id)allTokens
{
  void *v3;
  void *v4;
  void *v5;

  -[IMDNotificationsController meTokens](self, "meTokens");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDNotificationsController activeAccountAliases](self, "activeAccountAliases");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_amIMentionedInMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  -[IMDNotificationsController allTokens](self, "allTokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "objectForKey:", CFSTR("__kmessageDestinationCallerIDKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "length"))
    objc_msgSend(v6, "addObject:", v8);
  if (objc_msgSend(v6, "count"))
    v9 = -[IMDNotificationsController areMyTokens:inMessage:](self, "areMyTokens:inMessage:", v6, v4);
  else
    v9 = 0;

  return v9;
}

- (BOOL)areMyTokens:(id)a3 inMessage:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v5 = a3;
  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  objc_msgSend(v6, "objectForKey:", CFSTR("__kmessageAttributedBodyKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");
  v9 = *MEMORY[0x1E0D381F0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1ABB81000;
  v12[3] = &unk_1E5AB0AC8;
  v10 = v5;
  v13 = v10;
  v14 = &v15;
  objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v8, 0, v12);
  LOBYTE(v8) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v8;
}

- (BOOL)_shouldOverrideChatSilencingBecauseImMentioned:(id)a3
{
  id v4;
  void *v5;
  int v6;
  _BOOL4 v7;
  _BOOL4 v8;
  BOOL v9;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  int v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("__kmessageServiceKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D38F58]);

  v7 = -[IMDNotificationsController _messageIsBusiness:](self, "_messageIsBusiness:", v4);
  v8 = v7;
  if ((v6 & 1) != 0
    || v7
    || !-[IMDNotificationsController _overrideDNDForMessagesAddressingMe](self, "_overrideDNDForMessagesAddressingMe"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = CFSTR("NO");
        if (v6)
          v12 = CFSTR("YES");
        else
          v12 = CFSTR("NO");
        v14 = 138412802;
        v15 = CFSTR("NO");
        v16 = 2112;
        v17 = v12;
        if (v8)
          v11 = CFSTR("YES");
        v18 = 2112;
        v19 = v11;
        _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "not overriding chat silencing because override message mentions me is (%@) isSMS (%@) isBusinessChat (%@).", (uint8_t *)&v14, 0x20u);
      }

    }
    v9 = 0;
  }
  else
  {
    v9 = -[IMDNotificationsController _amIMentionedInMessage:](self, "_amIMentionedInMessage:", v4);
  }

  return v9;
}

- (BOOL)_shouldPostNotificationRequest:(id)a3 withCurrentlyPostedNotifications:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  NSObject *v17;
  _BOOL4 v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  BOOL v22;
  NSObject *v24;
  NSObject *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v28;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v10)
        objc_enumerationMutation(v8);
      v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v11);
      objc_msgSend(v12, "request");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", v7);

      if (v15)
        break;

      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_20;
      }
    }
    v16 = v12;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v32 = v7;
        v33 = 2112;
        v34 = v13;
        v35 = 2112;
        v36 = v5;
        _os_log_impl(&dword_1ABB60000, v17, OS_LOG_TYPE_INFO, "Request %@ is already delivered {deliveredRequest: %@ currentRequest: %@}", buf, 0x20u);
      }

    }
    if (!v16)
      goto LABEL_21;
    v18 = -[IMDNotificationsController _shouldRepostNotification:withAlreadyPostedNotification:](self, "_shouldRepostNotification:withAlreadyPostedNotification:", v5, v16);
    v19 = IMOSLoggingEnabled();
    if (v18)
    {
      if (v19)
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v7;
          _os_log_impl(&dword_1ABB60000, v20, OS_LOG_TYPE_INFO, "Re-posting notification %@ that has already been delivered", buf, 0xCu);
        }

      }
      goto LABEL_21;
    }
    if (v19)
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v7;
        _os_log_impl(&dword_1ABB60000, v24, OS_LOG_TYPE_INFO, "Not re-posting notification %@ that has already been delivered", buf, 0xCu);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v7;
        _os_log_impl(&dword_1ABB60000, v25, OS_LOG_TYPE_INFO, "We will NOT post the notification request %@", buf, 0xCu);
      }

    }
    v22 = 0;
  }
  else
  {
LABEL_20:

    v16 = 0;
LABEL_21:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v7;
        _os_log_impl(&dword_1ABB60000, v21, OS_LOG_TYPE_INFO, "We will post the notification request %@", buf, 0xCu);
      }

    }
    v22 = 1;
  }

  return v22;
}

- (BOOL)_shouldRepostNotification:(id)a3 withAlreadyPostedNotification:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  char v24;
  NSObject *v25;
  NSObject *v26;
  BOOL v27;
  NSObject *v29;
  int v30;
  void *v31;
  __int16 v32;
  unint64_t v33;
  __int16 v34;
  unint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "content");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "content");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "interruptionLevel");
  v12 = objc_msgSend(v10, "interruptionLevel");
  if (v12 > v11 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v30 = 138412802;
      v31 = v7;
      v32 = 2048;
      v33 = v12;
      v34 = 2048;
      v35 = v11;
      _os_log_impl(&dword_1ABB60000, v13, OS_LOG_TYPE_INFO, "Will re-post notification request %@ because the requestedInterruptionLevel:%ld has been escalated above postedInterruptionLevel:%ld", (uint8_t *)&v30, 0x20u);
    }

  }
  objc_msgSend(v9, "communicationContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "communicationContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "notifyRecipientAnyway");
  if (((v16 | objc_msgSend(v15, "notifyRecipientAnyway") ^ 1) & 1) != 0)
  {
    if (v12 <= v11)
    {
      objc_msgSend(v9, "body");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "body");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v17, "length") || (objc_msgSend(v17, "isEqualToString:", v18) & 1) != 0)
      {

        objc_msgSend(v9, "attachments");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "attachments");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v19;
        v22 = v20;
        v23 = v22;
        if (v21 == v22)
        {

        }
        else
        {
          if (!v21 || !v22)
          {

LABEL_29:
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                v30 = 138412290;
                v31 = v7;
                _os_log_impl(&dword_1ABB60000, v29, OS_LOG_TYPE_INFO, "Will re-post notification request %@ because attachment are different", (uint8_t *)&v30, 0xCu);
              }

            }
            v27 = 1;
            goto LABEL_34;
          }
          v24 = objc_msgSend(v21, "isEqualToArray:", v22);

          if ((v24 & 1) == 0)
            goto LABEL_29;
        }
        v27 = 0;
LABEL_34:

        goto LABEL_25;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v30 = 138412290;
          v31 = v7;
          _os_log_impl(&dword_1ABB60000, v26, OS_LOG_TYPE_INFO, "Will re-post notification request %@ because the message content has been edited", (uint8_t *)&v30, 0xCu);
        }

      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v30 = 138412290;
      v31 = v7;
      _os_log_impl(&dword_1ABB60000, v25, OS_LOG_TYPE_INFO, "Will re-post notification request %@ because the notification has been escalated to notifyAnyway", (uint8_t *)&v30, 0xCu);
    }

  }
  v27 = 1;
LABEL_25:

  return v27;
}

- (unint64_t)screenTimeNotificationOptionsForContext:(id)a3
{
  id v3;
  int v4;
  int v5;
  NSObject *v6;
  unint64_t v7;
  NSObject *v8;
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = a3;
  if (!objc_msgSend(v3, "allowedByScreenTime"))
  {
LABEL_14:
    v7 = 4;
    goto LABEL_15;
  }
  if (!objc_msgSend(v3, "applicationCurrentlyLimited"))
  {
    v7 = 1;
    goto LABEL_15;
  }
  v4 = objc_msgSend(v3, "shouldBeAllowedByScreenTimeWhenLimited");
  v5 = IMOSLoggingEnabled();
  if (!v4)
  {
    if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "Disallowing notifications during ScreenTime Comm Limits", v10, 2u);
      }

    }
    goto LABEL_14;
  }
  if (v5)
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_INFO, "Disallowing notifications during ScreenTime Downtime", buf, 2u);
    }

  }
  v7 = 2;
LABEL_15:

  return v7;
}

- (unint64_t)screenTimeNotificationOptionsForChatDictionary:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  int v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[IMDNotificationsController _handleIDsForChatDictionary:](self, "_handleIDsForChatDictionary:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = (unint64_t)v5;
        _os_log_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_INFO, "fetch screenTimeNotificationOption for handleIDs: [%@]", (uint8_t *)&v12, 0xCu);
      }

    }
    if (qword_1ED0D39A0 != -1)
      dispatch_once(&qword_1ED0D39A0, &unk_1E5AB0AE8);
    if (objc_msgSend(v5, "count"))
    {
      v7 = (void *)objc_msgSend(objc_alloc((Class)qword_1ED0D3998), "initSynchronouslyWithBundleIdentifier:", CFSTR("com.apple.MobileSMS"));
      objc_msgSend(v7, "allowableByContactsHandles:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[IMDNotificationsController screenTimeNotificationOptionsForContext:](self, "screenTimeNotificationOptionsForContext:", v8);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v12 = 134217984;
          v13 = v9;
          _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "get screenTimeNotificationOption: [%tu]", (uint8_t *)&v12, 0xCu);
        }

      }
    }
    else
    {
      v9 = 1;
    }

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)_handleIDsForChatDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("__kchatHandlesForChatKey"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "canonicalizedURIString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_coreSpotlightChatParticipantsFromChatDictionary:(id)a3 senderHandleID:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  IMDCoreSpotlightChatParticipant *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "objectForKey:", CFSTR("__kchatParticipantsKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        _IMDCoreSpotlightHandleID(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          _IMDCoreSpotlightCNContactForHandle(v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[IMDCoreSpotlightChatParticipant initWithHandleID:contact:isSender:]([IMDCoreSpotlightChatParticipant alloc], "initWithHandleID:contact:isSender:", v14, v15, objc_msgSend(v5, "isEqualToString:", v14, (_QWORD)v19));
          objc_msgSend(v7, "addObject:", v16);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  v17 = (void *)objc_msgSend(v7, "copy");
  return v17;
}

- (id)_groupPhotoInternalFilePathForGroupPhotoGuid:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  void *v5;

  v3 = (__CFString *)a3;
  if (-[__CFString length](v3, "length"))
  {
    v4 = (__CFString *)IMDAttachmentRecordCopyAttachmentForGUID(v3);
    -[__CFString path](v4, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_synthesizedMessagingNotificationContentWithContent:(id)a3 chatDictionary:(id)a4 messageDictionary:(id)a5 isUrgentMessageTrigger:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  char v22;
  unint64_t v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  id v36;
  NSObject *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  int v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  __CFString *v75;
  id v76;
  id v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD aBlock[5];
  uint8_t buf[8];
  uint64_t v85;
  Class (*v86)(uint64_t);
  void *v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (-[IMDNotificationsController _messageIsBusiness:](self, "_messageIsBusiness:", v12))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1ABB60000, v13, OS_LOG_TYPE_INFO, "Not synthesizing notification content from intent, message is a business chat message", buf, 2u);
      }

    }
    v14 = v10;
  }
  else
  {
    objc_msgSend(v12, "objectForKey:", CFSTR("__kmessageGUIDKey"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "body");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("__kmessageDateKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "longLongValue");

    objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)v16);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("__kmessageServiceKey"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("__kmessageHandleKey"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "uncanonicalizedURIString");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    _IMDCoreSpotlightHandleID(v74);
    v75 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("__kchatChatGUIDKey"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("__kchatChatIdentifierKey"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("__kchatGroupNameKey"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("__kchatStyleKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "intValue");

    objc_msgSend(v11, "objectForKey:", CFSTR("__kchatLastAddressedHandleStringKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_stripFZIDPrefix");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectForKey:", CFSTR("__kchatGroupPhotoGuidKey"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDNotificationsController _groupPhotoInternalFilePathForGroupPhotoGuid:](self, "_groupPhotoInternalFilePathForGroupPhotoGuid:", v73);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[IMDNotificationsController _amIMentionedInMessage:](self, "_amIMentionedInMessage:", v12);
    objc_msgSend(v12, "objectForKey:", CFSTR("__kmessageThreadOriginatorKey"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "objectForKey:", CFSTR("__kmessageFlagsKey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "unsignedLongLongValue");

    if (a6)
    {
      LOBYTE(v23) = 1;
    }
    else
    {
      objc_msgSend(v12, "objectForKey:", CFSTR("__kmessageFlagsKey"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = ((unint64_t)objc_msgSend(v24, "unsignedLongLongValue") >> 35) & 1;

    }
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isTranscriptSharingEnabled");

    if (v26 && objc_msgSend(v72, "hasPrefix:", *MEMORY[0x1E0D394C8]))
    {
      objc_msgSend(v10, "subtitle");
      v27 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "body");
      v28 = objc_claimAutoreleasedReturnValue();

      v75 = CFSTR("stewie:eServices");
      v70 = (void *)v27;
      v71 = (void *)v28;
    }
    -[IMDNotificationsController _coreSpotlightChatParticipantsFromChatDictionary:senderHandleID:](self, "_coreSpotlightChatParticipantsFromChatDictionary:senderHandleID:", v11, v75);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1ABB82D3C;
    aBlock[3] = &unk_1E5AB0868;
    aBlock[4] = self;
    v60 = _Block_copy(aBlock);
    _IMDCoreSpotlightNewINInteractionForIncomingMessage(v67, v71, v66, v65, v75, v64, v63, v72, v70, v18, v69, v62, v73, v61, v20, (v22 & 4) != 0, v23, v60);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "intent");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v57 = v31;
      objc_msgSend(v10, "userInfo");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKey:", *MEMORY[0x1E0D38BD8]);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v59);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = 0;
      v90 = &v89;
      v91 = 0x2050000000;
      v33 = (void *)qword_1EEC40338;
      v92 = qword_1EEC40338;
      if (!qword_1EEC40338)
      {
        *(_QWORD *)buf = v29;
        v85 = 3221225472;
        v86 = sub_1ABB870FC;
        v87 = &unk_1E5AB0C88;
        v88 = &v89;
        sub_1ABB870FC((uint64_t)buf);
        v33 = (void *)v90[3];
      }
      v34 = objc_retainAutorelease(v33);
      _Block_object_dispose(&v89, 8);
      v35 = objc_msgSend(v34, "messageTypeFromURL:", v58);
      if ((objc_opt_respondsToSelector() & (v35 == 3)) == 1)
      {
        v14 = (id)objc_msgSend(v10, "mutableCopy");
        objc_msgSend(MEMORY[0x1E0CEC738], "iconNamed:shouldSuppressMask:", CFSTR("zelkovaTriggerNotificationIcon"), 1);
        v36 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setIcon:", v36);
        objc_msgSend(v14, "setShouldShowSubordinateIcon:", 1);
      }
      else
      {
        -[IMDNotificationsController _tapbackFromMessageDictionary:](self, "_tapbackFromMessageDictionary:", v12);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        if (v56)
        {
          -[IMDNotificationsController _senderDisplayNameForTapback:sendMessageIntent:chatParticipants:](self, "_senderDisplayNameForTapback:sendMessageIntent:chatParticipants:", v56, v57, v69);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDNotificationsController _attributedSummaryOfTapback:messageDictionary:senderDisplayName:](self, "_attributedSummaryOfTapback:messageDictionary:senderDisplayName:", v56, v12, v38);
          v55 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v55 = 0;
        }
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("__kmessageAttachmentsKey"));
        v81 = 0u;
        v82 = 0u;
        v79 = 0u;
        v80 = 0u;
        v39 = (id)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
        if (v40)
        {
          v41 = *(_QWORD *)v80;
          while (2)
          {
            for (i = 0; i != v40; ++i)
            {
              if (*(_QWORD *)v80 != v41)
                objc_enumerationMutation(v39);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * i), "isAdaptiveImageGlyph") & 1) != 0)
              {
                v43 = 0;
                goto LABEL_37;
              }
            }
            v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
            if (v40)
              continue;
            break;
          }
        }
        v43 = 1;
LABEL_37:

        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("__kmessageExpressiveSendStyleIDKey"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "isEqualToString:", *MEMORY[0x1E0D380A0]);

        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("__kmessageAttributedBodyKey"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v46;
        if (v55)
        {
          objc_msgSend((id)MEMORY[0x1AF434FF4](CFSTR("UNNotificationAttributedMessageContext"), CFSTR("UserNotifications")), "contextWithSendMessageIntent:attributedContent:", v57, v55);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = 0;
          objc_msgSend(v10, "contentByUpdatingWithAttributedMessageContext:error:", v48, &v78);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v78;

        }
        else if (((v43 | v45) & 1) == 0 && objc_msgSend(v46, "length") && (objc_opt_respondsToSelector() & 1) != 0)
        {
          -[IMDNotificationsController _attributedMessageBodyByInsertingAdaptiveImageGlyphsInMessageBody:attachments:](self, "_attributedMessageBodyByInsertingAdaptiveImageGlyphsInMessageBody:attachments:", v47, v39);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)MEMORY[0x1AF434FF4](CFSTR("UNNotificationAttributedMessageContext"), CFSTR("UserNotifications")), "contextWithSendMessageIntent:attributedContent:", v57, v54);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = 0;
          objc_msgSend(v10, "contentByUpdatingWithAttributedMessageContext:error:", v50, &v77);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v77;

        }
        else
        {
          v76 = 0;
          objc_msgSend(v10, "contentByUpdatingWithProvider:error:", v57, &v76);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v76;
        }
        v51 = v49;
        if (v36)
        {
          IMLogHandleForCategory();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            sub_1ABC57A8C();

          v51 = v10;
        }
        v14 = v51;

      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1ABB60000, v37, OS_LOG_TYPE_INFO, "Not synthesizing notification content from intent, intent was not generated for message", buf, 2u);
        }

      }
      v14 = v10;
    }

  }
  return v14;
}

- (id)_attributedSummaryOfTapback:(id)a3 messageDictionary:(id)a4 senderDisplayName:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  IMDNotificationsController *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  unint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  IMDNotificationsController *v47;
  _QWORD aBlock[4];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v44 = a3;
  v8 = a4;
  v43 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("__kmessageFlagsKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v9, "unsignedLongLongValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("__kmessageSummaryInfoDataKey"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  JWDecodeDictionary();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "__imami_attributedStringForKey:", *MEMORY[0x1E0D38338]);
  v10 = objc_claimAutoreleasedReturnValue();
  v42 = v8;
  v11 = v8;
  v12 = self;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("__kmessageAttachmentsKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)v10;
  -[IMDNotificationsController _attachmentRecordsForAssociatedMessagePartText:](v12, "_attachmentRecordsForAssociatedMessagePartText:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v16 = v13;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v55 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(v21, "guid", v38);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, v22);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    }
    while (v18);
  }

  v53 = 0u;
  v51 = 0u;
  v52 = 0u;
  v50 = 0u;
  v23 = v14;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v51 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
        objc_msgSend(v28, "guid", v38);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v28, v29);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    }
    while (v25);
  }

  v30 = (void *)objc_msgSend(v15, "copy");
  v31 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1ABB83180;
  aBlock[3] = &unk_1E5AB0B60;
  v32 = v30;
  v49 = v32;
  v33 = _Block_copy(aBlock);
  v45[0] = v31;
  v45[1] = 3221225472;
  v45[2] = sub_1ABB831BC;
  v45[3] = &unk_1E5AB0B88;
  v46 = v32;
  v47 = v12;
  v34 = v32;
  v35 = _Block_copy(v45);
  objc_msgSend(v44, "previewAttributedStringWithMessageSummaryInfo:isAdaptiveImageGlyphProvider:adaptiveImageGlyphProvider:senderDisplayName:isFromMe:effectString:", v40, v33, v35, v43, (v38 >> 2) & 1, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (id)_attachmentRecordsForAssociatedMessagePartText:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __CFString *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return MEMORY[0x1E0C9AA60];
  objc_msgSend(a3, "__im_transferGUIDsInAttributedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = (__CFString *)IMDAttachmentRecordCopyAttachmentForGUID(*(const __CFString **)(*((_QWORD *)&v13 + 1) + 8 * i));
        if (v10)
          objc_msgSend(v4, "addObject:", v10, (_QWORD)v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

- (id)_senderDisplayNameForTapback:(id)a3 sendMessageIntent:(id)a4 chatParticipants:(id)a5
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = a5;
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v20;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
      if ((objc_msgSend(v11, "isSender", (_QWORD)v19) & 1) != 0)
        break;
      if (v8 == (id)++v10)
      {
        v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v8 = v11;

    if (!v8)
    {
      v12 = 0;
      goto LABEL_22;
    }
    objc_msgSend(v8, "contact");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && objc_msgSend(MEMORY[0x1E0D397A8], "isCNContactAKnownContact:", v13))
    {
      objc_msgSend(MEMORY[0x1E0C972B8], "sharedDefaults");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "shortNameFormatPrefersNicknames"))
      {
        objc_msgSend(v13, "nickname");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
      if (!objc_msgSend(v12, "length"))
      {
        objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v13, 1000);
        v15 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v15;
      }

    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
LABEL_9:
    v12 = 0;
    v13 = v7;
  }

LABEL_22:
  if (!objc_msgSend(v12, "length", (_QWORD)v19))
  {
    objc_msgSend(v6, "sender");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "displayName");
    v17 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v17;
  }

  return v12;
}

- (id)_adaptiveImageGlyphForAttachment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v3 = a3;
  if (objc_msgSend(v3, "transferState") == 5)
  {
    objc_msgSend(v3, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      IMAttachmentEmojiImagePreviewFileURL();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v6, 1, &v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA1A0]), "initWithImageContent:", v7);
      else
        v8 = 0;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_attributedMessageBodyByInsertingAdaptiveImageGlyphsInMessageBody:(id)a3 attachments:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, uint64_t, uint64_t);
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  IMDNotificationsController *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v14, "guid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v8, "setObject:forKey:", v14, v15);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v11);
  }

  v16 = objc_msgSend(v6, "length");
  v17 = (void *)objc_msgSend(v6, "mutableCopy");
  v18 = *MEMORY[0x1E0D36430];
  v19 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = sub_1ABB83890;
  v30[3] = &unk_1E5AB0BB0;
  v31 = v8;
  v32 = self;
  v20 = v17;
  v33 = v20;
  v21 = v8;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v18, 0, v16, 0, v30);
  v25 = v19;
  v26 = 3221225472;
  v27 = sub_1ABB839F0;
  v28 = &unk_1E5AB0C00;
  v29 = v20;
  v22 = v20;
  objc_msgSend(v22, "enumerateAttributesInRange:options:usingBlock:", 0, v16, 0, &v25);
  v23 = (void *)objc_msgSend(v22, "copy", v25, v26, v27, v28);

  return v23;
}

- (id)_generateNotificationRequestForMessageRecord:(id)a3 isUrgentMessageTrigger:(BOOL)a4 isCarouselUITriggered:(BOOL)a5 shouldAdvanceLastAlertedMessageDate:(BOOL *)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  -[IMDNotificationsController _messageDictionaryForMessageRecord:copyThreadOriginator:](self, "_messageDictionaryForMessageRecord:copyThreadOriginator:", v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDNotificationsController _chatDictionaryForMessageRecord:](self, "_chatDictionaryForMessageRecord:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDNotificationsController _generateNotificationRequestForMessageRecord:messageDictionary:chatDictionary:isUrgentMessageTrigger:isCarouselUITriggered:shouldAdvanceLastAlertedMessageDate:](self, "_generateNotificationRequestForMessageRecord:messageDictionary:chatDictionary:isUrgentMessageTrigger:isCarouselUITriggered:shouldAdvanceLastAlertedMessageDate:", v10, v11, v12, v8, v7, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_generateNotificationRequestForMessageRecord:(id)a3 messageDictionary:(id)a4 chatDictionary:(id)a5 isUrgentMessageTrigger:(BOOL)a6 isCarouselUITriggered:(BOOL)a7 shouldAdvanceLastAlertedMessageDate:(BOOL *)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  unint64_t v26;
  id v27;
  int v28;
  const __CFString *v29;
  _BOOL8 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  char v50;
  BOOL v51;
  uint8_t buf[4];
  id v53;
  __int16 v54;
  const __CFString *v55;
  uint64_t v56;

  v9 = a7;
  v56 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v51 = a6;
  v17 = objc_alloc_init(MEMORY[0x1E0CEC6E0]);
  v18 = -[IMDNotificationsController _messageShouldBeSilentlyDeliveredForBusinessChat:](self, "_messageShouldBeSilentlyDeliveredForBusinessChat:", v15);
  if (!objc_msgSend(v16, "count"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v15, "objectForKey:", CFSTR("__kmessageGUIDKey"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v53 = v22;
        _os_log_impl(&dword_1ABB60000, v21, OS_LOG_TYPE_INFO, "This notification %@ hasn't been associated with a chat yet", buf, 0xCu);

      }
    }
    if (!a8)
      goto LABEL_68;
LABEL_12:
    *a8 = 0;
    goto LABEL_68;
  }
  if (v18)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v15, "objectForKey:", CFSTR("__kmessageGUIDKey"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v53 = v20;
        _os_log_impl(&dword_1ABB60000, v19, OS_LOG_TYPE_INFO, "Not notifying for %@ because it is a silent business chat message", buf, 0xCu);

      }
LABEL_51:

      goto LABEL_68;
    }
    goto LABEL_68;
  }
  if (-[IMDNotificationsController _areAllMessagePartsRetractedForMessageDictionary:](self, "_areAllMessagePartsRetractedForMessageDictionary:", v15))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v15, "objectForKey:", CFSTR("__kmessageGUIDKey"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v53 = v23;
        _os_log_impl(&dword_1ABB60000, v19, OS_LOG_TYPE_INFO, "Not generating notification request for %@ because all message parts have been retracted", buf, 0xCu);

      }
      goto LABEL_51;
    }
LABEL_68:

    v38 = 0;
    goto LABEL_69;
  }
  if (objc_msgSend((id)objc_opt_class(), "_isFacetimeHighlighted:", v15))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v15, "objectForKey:", CFSTR("__kmessageGUIDKey"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v53 = v24;
        _os_log_impl(&dword_1ABB60000, v19, OS_LOG_TYPE_INFO, "Not generating notification request for %@ because it's already highlighted in an ongoing FaceTime call", buf, 0xCu);

      }
      goto LABEL_51;
    }
    goto LABEL_68;
  }
  if (-[IMDNotificationsController _deviceUnderFirstUnlock](self, "_deviceUnderFirstUnlock"))
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_35;
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v25, OS_LOG_TYPE_INFO, "Device under first unlock, skip checking screentime", buf, 2u);
    }
    goto LABEL_34;
  }
  v26 = -[IMDNotificationsController screenTimeNotificationOptionsForChatDictionary:](self, "screenTimeNotificationOptionsForChatDictionary:", v16);
  if ((v26 & 4) != 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v15, "objectForKey:", CFSTR("__kmessageGUIDKey"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v53 = v39;
        _os_log_impl(&dword_1ABB60000, v19, OS_LOG_TYPE_INFO, "Not notifying for %@ because it is not allowed by Screen Time", buf, 0xCu);

      }
      goto LABEL_51;
    }
    goto LABEL_68;
  }
  objc_msgSend(v17, "setShouldIgnoreDowntime:", (v26 >> 1) & 1);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v15, "objectForKey:", CFSTR("__kmessageGUIDKey"));
      v27 = (id)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v17, "shouldIgnoreDowntime");
      v29 = CFSTR("NO");
      if (v28)
        v29 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v53 = v27;
      v54 = 2112;
      v55 = v29;
      _os_log_impl(&dword_1ABB60000, v25, OS_LOG_TYPE_INFO, "shouldIgnoreDowntime for %@ : %@ ", buf, 0x16u);

    }
LABEL_34:

  }
LABEL_35:
  v30 = -[IMDNotificationsController _shouldOverrideChatSilencingBecauseImMentioned:](self, "_shouldOverrideChatSilencingBecauseImMentioned:", v15)|| -[IMDNotificationsController _messageIsStewieEmergency:](self, "_messageIsStewieEmergency:", v15);
  -[IMDNotificationsController _messageShouldBeSpoken:chatDictionary:](self, "_messageShouldBeSpoken:chatDictionary:", v15, v16);
  if (!v9
    && !-[IMDNotificationsController _shouldPostNotificationForChat:messageDictionary:](self, "_shouldPostNotificationForChat:messageDictionary:", v16, v15)&& !v30)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("__kmessageGUIDKey"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v53 = v46;
        _os_log_impl(&dword_1ABB60000, v45, OS_LOG_TYPE_INFO, "suppressed notification generation for silenced message %@.", buf, 0xCu);

      }
    }
    if (!-[IMDNotificationsController _isUnknownSenders:](self, "_isUnknownSenders:", v16))
      goto LABEL_68;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v15, "objectForKey:", CFSTR("__kmessageGUIDKey"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v53 = v48;
        _os_log_impl(&dword_1ABB60000, v47, OS_LOG_TYPE_INFO, "This notification %@ mark as sending from unknown senders", buf, 0xCu);

      }
    }
    if (!a8)
      goto LABEL_68;
    goto LABEL_12;
  }
  -[IMDNotificationsController _populateBasicNotificationIdentifyingContent:chatDictionary:messageDictionary:isCarouselUITriggered:](self, "_populateBasicNotificationIdentifyingContent:chatDictionary:messageDictionary:isCarouselUITriggered:", v17, v16, v15, v9);
  -[IMDNotificationsController _populateBodyForNotificationContent:messageDictionary:](self, "_populateBodyForNotificationContent:messageDictionary:", v17, v15);
  -[IMDNotificationsController _populateTitleForNotificationContent:chatDictionary:messageDictionary:](self, "_populateTitleForNotificationContent:chatDictionary:messageDictionary:", v17, v16, v15);
  -[IMDNotificationsController _populateSubtitleForNotificationContent:chatDictionary:messageDictionary:](self, "_populateSubtitleForNotificationContent:chatDictionary:messageDictionary:", v17, v16, v15);
  -[IMDNotificationsController _populateSoundAndDisplayActivationForNotificationContent:chatDictionary:messageDictionary:](self, "_populateSoundAndDisplayActivationForNotificationContent:chatDictionary:messageDictionary:", v17, v16, v15);
  -[IMDNotificationsController _populateIgnoresDoNotDisturb:chatDictionary:messageDictionary:](self, "_populateIgnoresDoNotDisturb:chatDictionary:messageDictionary:", v17, v16, v15);
  if (v14)
    -[IMDNotificationsController _populateAttachmentsForNotificationContent:messageDictionary:messageRecord:knownSender:](self, "_populateAttachmentsForNotificationContent:messageDictionary:messageRecord:knownSender:", v17, v15, v14, -[IMDNotificationsController _messageIsFromKnownContact:](self, "_messageIsFromKnownContact:", v15));
  -[IMDNotificationsController _populateUserInfoOnContentForWatch:messageDictionary:chatDictionary:isCarouselUITriggered:](self, "_populateUserInfoOnContentForWatch:messageDictionary:chatDictionary:isCarouselUITriggered:", v17, v15, v16, v9);
  -[IMDNotificationsController _populateNotificationCategoryContent:messageDictionary:chatDictionary:](self, "_populateNotificationCategoryContent:messageDictionary:chatDictionary:", v17, v15, v16);
  -[IMDNotificationsController _populateUserInfoForMessageContent:messageDictionary:messageIsAddressedToMe:](self, "_populateUserInfoForMessageContent:messageDictionary:messageIsAddressedToMe:", v17, v15, v30);
  -[IMDNotificationsController _populateRealertCountForNotificationContent:](self, "_populateRealertCountForNotificationContent:", v17);
  -[IMDNotificationsController _populateNotificationContentForTranscriptSharing:chatDictionary:messageDictionary:](self, "_populateNotificationContentForTranscriptSharing:chatDictionary:messageDictionary:", v17, v16, v15);
  -[IMDNotificationsController _populateTimeSensitiveOrCriticalForNotificationContent:chatDictionary:messageDictionary:](self, "_populateTimeSensitiveOrCriticalForNotificationContent:chatDictionary:messageDictionary:", v17, v16, v15);
  objc_msgSend(v15, "objectForKey:", CFSTR("__kmessageGUIDKey"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  +[IMExtensionNotificationManager sharedInstance](IMExtensionNotificationManager, "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("__kmessageBalloonBundleIDKey"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("__kmessagePayloadDataKey"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", CFSTR("__kchatChatIdentifierKey"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "populateUserInfoForNotificationContent:messageBalloonBundleID:payloadData:chatIdentifier:isUrgentMessageTrigger:shouldSuppressNotification:", v17, v33, v34, v35, &v51, &v50);

  if (v50)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v15, "objectForKey:", CFSTR("__kmessageGUIDKey"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v53 = v37;
        _os_log_impl(&dword_1ABB60000, v36, OS_LOG_TYPE_INFO, "Suppressing notification for messageGUID %@", buf, 0xCu);

      }
    }
    v38 = 0;
  }
  else
  {
    if (objc_msgSend(v17, "interruptionLevel") == 3)
    {
      objc_msgSend(v17, "setShouldSuppressScreenLightUp:", 0);
      objc_msgSend(v17, "sound");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v40
        || (objc_msgSend(v17, "sound"),
            v41 = (void *)objc_claimAutoreleasedReturnValue(),
            v42 = objc_msgSend(v41, "alertType") == 2,
            v41,
            v40,
            v42))
      {
        objc_msgSend(MEMORY[0x1E0CEC760], "defaultCriticalSound");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setSound:", v43);

      }
    }
    -[IMDNotificationsController _synthesizedMessagingNotificationContentWithContent:chatDictionary:messageDictionary:isUrgentMessageTrigger:](self, "_synthesizedMessagingNotificationContentWithContent:chatDictionary:messageDictionary:isUrgentMessageTrigger:", v17, v16, v15, v51);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEC740], "requestWithIdentifier:content:trigger:destinations:", v31, v44, 0, 15);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_69:

  return v38;
}

- (BOOL)_areAllMessagePartsRetractedForMessageDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("__kmessageBalloonBundleIDKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMExtensionNotificationManager sharedInstance](IMExtensionNotificationManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canPopulateUserInfoForMessageBalloonBundleID:", v4);

  if (v6)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("__kmessageGUIDKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v16 = 138412546;
        v17 = v4;
        v18 = 2112;
        v19 = v7;
        _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "Delegating retracted check to IMExtensionNotificationManager for BalloonBundleID %@ messageGUID %@", (uint8_t *)&v16, 0x16u);
      }

    }
    +[IMExtensionNotificationManager sharedInstance](IMExtensionNotificationManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "shouldRetractedMessageForBalloonBundleID:", v4);
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("__kmessageAttributedBodyKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("__kmessageTextKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length")
      || objc_msgSend(v9, "length")
      || (objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("__kmessageDateEditedKey")),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "longLongValue"),
          v12,
          v13 < 1))
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v3, "objectForKey:", CFSTR("__kmessageGUIDKey"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = 138412290;
          v17 = v14;
          _os_log_impl(&dword_1ABB60000, v15, OS_LOG_TYPE_INFO, "Determined that all message parts have been retracted for messageGUID %@", (uint8_t *)&v16, 0xCu);
        }

      }
      v10 = 1;
    }
  }

  return v10;
}

+ (BOOL)_isFacetimeHighlighted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  __CFString *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSObject *v18;
  __CFString *v19;
  void *v20;
  char v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  const __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_pluginPayloadAttachmentPathsForMessage:", v4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("__kmessageTextKey"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v25);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_lpLinkMetadataForMessage:attachmentPaths:originalURL:", v4, v24, v5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "collaborationMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("YES");
      if (!v6)
        v8 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v33 = v8;
      _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "Message has collaboration meta data: %@", buf, 0xCu);
    }

  }
  if (v6)
  {
    objc_msgSend(v26, "collaborationMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collaborationIdentifier");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v10;
        _os_log_impl(&dword_1ABB60000, v11, OS_LOG_TYPE_INFO, "Read collaborationIdentifier from message: %@", buf, 0xCu);
      }

    }
    if (-[__CFString length](v10, "length"))
    {
      objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "conversationManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "activeConversations");
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v28;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v28 != v15)
              objc_enumerationMutation(v13);
            v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v17, "highlightIdentifiers");
                v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v33 = v19;
                _os_log_impl(&dword_1ABB60000, v18, OS_LOG_TYPE_INFO, "Read highlightIdentifiers from current FaceTime call: %@", buf, 0xCu);

              }
            }
            objc_msgSend(v17, "highlightIdentifiers");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "containsObject:", v10);

            if ((v21 & 1) != 0)
            {

              LOBYTE(v6) = 1;
              goto LABEL_28;
            }
          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          if (v14)
            continue;
          break;
        }
      }

    }
    LOBYTE(v6) = 0;
LABEL_28:

  }
  return (char)v6;
}

+ (id)_pluginPayloadAttachmentPathsForMessage:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("__kmessageRowIDKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  v5 = (void *)IMDMessageRecordCopyAttachmentsForIDWithLock(v4);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
        if (v12)
        {
          objc_msgSend(v12, "path", (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v6, "addObject:", v13);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v6;
}

+ (id)_lpLinkMetadataForMessage:(id)a3 attachmentPaths:(id)a4 originalURL:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  unint64_t v13;
  __CFArray *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (MEMORY[0x1AF434FF4](CFSTR("LPLinkMetadataPresentationTransformer"), CFSTR("LinkPresentation")))
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("__kmessagePayloadDataKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x1E0D397E0]);
    v26 = (void *)v10;
    objc_msgSend(v11, "setData:", v10);
    objc_msgSend(v7, "objectForKey:", CFSTR("__kmessageGUIDKey"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMessageGUID:");
    objc_msgSend(v7, "objectForKey:", CFSTR("__kmessageFlagsKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = ((unint64_t)objc_msgSend(v12, "unsignedLongLongValue") >> 2) & 1;

    objc_msgSend(v11, "setIsFromMe:", v13);
    objc_msgSend(v11, "setUrl:", v9);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (__CFArray *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v27 = v8;
    v15 = v8;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v29 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v14 && v20)
            CFArrayAppendValue(v14, v20);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v17);
    }

    objc_msgSend(v11, "setAttachments:", v14);
    objc_msgSend(MEMORY[0x1E0D39A68], "linkMetadataForPluginPayload:", v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "copy");

    v8 = v27;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (BOOL)_deviceUnderFirstUnlock
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D39B78], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUnderFirstDataProtectionLock");

  return v3;
}

- (id)_generateNotificationRequestForDeliveryError:(id)a3 isCarouselUITriggered:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[IMDNotificationsController _messageDictionaryForMessageRecord:](self, "_messageDictionaryForMessageRecord:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("__kmessageErrorKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "longValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("__kmessageFlagsKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedLongLongValue");

  if (v9 | v11 & 0x20000000000
    && (objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("__kmessageItemTypeKey")),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "longValue"),
        v12,
        !v13))
  {
    v16 = objc_alloc_init(MEMORY[0x1E0CEC6E0]);
    -[IMDNotificationsController _chatDictionaryForMessageRecord:](self, "_chatDictionaryForMessageRecord:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDNotificationsController _populateBasicNotificationIdentifyingContent:chatDictionary:messageDictionary:isCarouselUITriggered:](self, "_populateBasicNotificationIdentifyingContent:chatDictionary:messageDictionary:isCarouselUITriggered:", v16, v18, v7, v4);
    if (v9 == 43)
      -[IMDNotificationsController _populateBodyAndTitleForSendReceivedAsJunkNotificationContent:messageDictionary:](self, "_populateBodyAndTitleForSendReceivedAsJunkNotificationContent:messageDictionary:", v16, v7);
    else
      -[IMDNotificationsController _populateBodyAndTitleForSendFailedNotificationContent:messageDictionary:](self, "_populateBodyAndTitleForSendFailedNotificationContent:messageDictionary:", v16, v7);
    -[IMDNotificationsController _populateUserInfoOnContentForWatch:messageDictionary:chatDictionary:isCarouselUITriggered:](self, "_populateUserInfoOnContentForWatch:messageDictionary:chatDictionary:isCarouselUITriggered:", v16, v7, v18, v4);
    -[IMDNotificationsController _populateRealertCountForNotificationContent:](self, "_populateRealertCountForNotificationContent:", v16);
    objc_msgSend(v7, "objectForKey:", CFSTR("__kmessageGUIDKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEC740], "requestWithIdentifier:content:trigger:", v19, v16, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v20 = 138412290;
        v21 = v7;
        _os_log_impl(&dword_1ABB60000, v14, OS_LOG_TYPE_INFO, "We don't notify for delivery non-failures or failures of non-messages for messageDictionary %@", (uint8_t *)&v20, 0xCu);
      }

    }
    v15 = 0;
    v16 = 0;
  }

  return v15;
}

- (id)_messageDictionaryForMessageRecord:(id)a3
{
  return -[IMDNotificationsController _messageDictionaryForMessageRecord:copyThreadOriginator:](self, "_messageDictionaryForMessageRecord:copyThreadOriginator:", a3, 0);
}

- (id)_messageDictionaryForMessageRecord:(id)a3 copyThreadOriginator:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  __CFDictionary *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  __CFString *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  const __CFNumber *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  __CFString *v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  __CFDictionary *v55;
  __CFString *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  const __CFNumber *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  __CFString *v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  CFNumberRef v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  void *value;
  void *valuea;
  void *v104;
  id v105;
  id v106;
  const void *v107;
  const void *v108;
  void *v109;
  uint64_t v110;
  void *v111;
  __CFString *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  __int128 v119;
  void *v120;
  const void *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char v125;
  CFNumberRef v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;

  v4 = a4;
  v5 = a3;
  v6 = (__CFDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 20);
  v135 = 0;
  v136 = -1;
  v133 = 0;
  v134 = 0;
  v131 = 0;
  v132 = 0;
  v129 = 0;
  v130 = 0;
  v127 = 0;
  v128 = 0;
  v126 = 0;
  v125 = 0;
  v123 = 0;
  v124 = 0;
  v121 = 0;
  v122 = 0;
  v120 = 0;
  v119 = 0u;
  v117 = 0;
  v118 = 0;
  v116 = 0;
  v115 = 0;
  v114 = 0;
  v113 = 0;
  v112 = 0;
  v111 = 0;
  v110 = 0;
  v109 = 0;
  v108 = 0;
  v107 = 0;
  v104 = v5;
  IMDMessageRecordBulkCopy((uint64_t)v5, &v135, &v136, 0, &v131, &v134, &v133, &v132, 0, &v130, &v111, &v126, &v128, &v113, 0, &v121, &v129, &v123, &v124,
    &v125,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    &v120,
    &v122,
    &v119,
    &v127,
    &v115,
    &v116,
    0,
    &v118,
    0,
    0,
    0,
    0,
    &v114,
    0,
    0,
    &v112,
    0,
    0,
    0,
    0,
    &v110,
    &v109,
    0,
    &v117,
    &v108,
    &v107);
  v8 = v130;
  v7 = v131;
  v9 = v128;
  v10 = v129;
  v59 = v127;
  v94 = v126;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v125 != 0);
  v100 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v123);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v124);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v120;
  v86 = v117;
  v105 = v118;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v122);
  v90 = (id)objc_claimAutoreleasedReturnValue();
  v82 = v115;
  v84 = v116;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v119);
  v88 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v136);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v135);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v134);
  value = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v132);
  v98 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v133);
  v96 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v110);
  v14 = objc_claimAutoreleasedReturnValue();
  v76 = v114;
  v72 = (void *)v14;
  v74 = v113;
  v79 = v112;
  v67 = v109;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v108);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v107);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v111;
  if (v111)
  {
    JWDecodeCodableObjectWithStandardAllowlist();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
      CFDictionarySetValue(v6, CFSTR("__kmessageAttributedBodyKey"), v15);

  }
  objc_msgSend(v104, "handleRecord");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v16 = (__CFString *)IMDMessageRecordCopyMessageForGUID(v79);
    if (v16)
    {
      -[IMDNotificationsController _messageDictionaryForMessageRecord:](self, "_messageDictionaryForMessageRecord:", v16);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v63 = 0;
    }

  }
  else
  {
    v63 = 0;
  }
  if (v125)
  {
    objc_msgSend(v104, "attachmentRecords");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  v18 = v7;
  if (v18)
    CFDictionarySetValue(v6, CFSTR("__kmessageGUIDKey"), v18);

  v19 = v8;
  if (v19)
    CFDictionarySetValue(v6, CFSTR("__kmessageTextKey"), v19);

  v20 = v10;
  if (v20)
    CFDictionarySetValue(v6, CFSTR("__kmessageSubjectKey"), v20);

  v21 = v9;
  if (v21)
    CFDictionarySetValue(v6, CFSTR("__kmessageServiceKey"), v21);

  v22 = v59;
  if (v22)
    CFDictionarySetValue(v6, CFSTR("__kmessageBalloonBundleIDKey"), v22);

  v23 = v11;
  if (v23)
    CFDictionarySetValue(v6, CFSTR("__kmessageErrorKey"), v23);

  v24 = v12;
  if (v24)
    CFDictionarySetValue(v6, CFSTR("__kmessageRowIDKey"), v24);

  v25 = v13;
  if (v25)
    CFDictionarySetValue(v6, CFSTR("__kmessageItemTypeKey"), v25);

  v26 = value;
  valuea = v26;
  if (v26)
  {
    CFDictionarySetValue(v6, CFSTR("__kmessageDateKey"), v26);
    v26 = valuea;
  }

  v27 = v98;
  v99 = v27;
  if (v27)
  {
    CFDictionarySetValue(v6, CFSTR("__kmessageDateDeliveredKey"), v27);
    v27 = v99;
  }

  v28 = v96;
  v97 = v28;
  if (v28)
  {
    CFDictionarySetValue(v6, CFSTR("__kmessageDateReadKey"), v28);
    v28 = v97;
  }

  v29 = v100;
  v101 = v29;
  if (v29)
  {
    CFDictionarySetValue(v6, CFSTR("__kmessageHasAttachmentsKey"), v29);
    v29 = v101;
  }

  v30 = v17;
  if (v30)
    CFDictionarySetValue(v6, CFSTR("__kmessageAttachmentsKey"), v30);
  v60 = v30;

  v31 = v94;
  if (v31)
    CFDictionarySetValue(v6, CFSTR("__kmessageFlagsKey"), v31);

  v32 = v70;
  v95 = v32;
  if (v32)
  {
    CFDictionarySetValue(v6, CFSTR("__kmessageMadridTypeKey"), v32);
    v32 = v95;
  }

  v33 = v92;
  v93 = v33;
  if (v33)
  {
    CFDictionarySetValue(v6, CFSTR("__kmessageAssociatedMessageGUIDKey"), v33);
    v33 = v93;
  }

  v34 = v90;
  v91 = v34;
  if (v34)
  {
    CFDictionarySetValue(v6, CFSTR("__kmessageAssociatedMessageTypeKey"), v34);
    v34 = v91;
  }

  v35 = v88;
  v89 = v35;
  if (v35)
  {
    CFDictionarySetValue(v6, CFSTR("__kmessageAssociatedMessageRangeKey"), v35);
    v35 = v89;
  }

  v36 = v86;
  v87 = v36;
  if (v36)
  {
    CFDictionarySetValue(v6, CFSTR("__kmessageAssociatedMessageEmojiKey"), v36);
    v36 = v87;
  }

  v37 = v105;
  v106 = v37;
  if (v37)
  {
    CFDictionarySetValue(v6, CFSTR("__kmessageSummaryInfoDataKey"), v37);
    v37 = v106;
  }

  v38 = v84;
  v85 = v38;
  if (v38)
  {
    CFDictionarySetValue(v6, CFSTR("__kmessageExpressiveSendStyleIDKey"), v38);
    v38 = v85;
  }
  v71 = v22;

  v39 = v82;
  if (v39)
    CFDictionarySetValue(v6, CFSTR("__kmessagePayloadDataKey"), v39);
  v58 = v39;

  v40 = v61;
  if (v40)
    CFDictionarySetValue(v6, CFSTR("__kmessageHandleKey"), v40);

  v41 = v76;
  v83 = v41;
  if (v41)
  {
    CFDictionarySetValue(v6, CFSTR("__kmessageDestinationCallerIDKey"), v41);
    v41 = v83;
  }
  v77 = v18;

  v42 = v74;
  if (v42)
    CFDictionarySetValue(v6, CFSTR("__kmessageAccountKey"), v42);
  v75 = v19;

  v43 = v79;
  if (v43)
    CFDictionarySetValue(v6, CFSTR("__kmessageThreadOriginatorGUIDKey"), v43);
  v80 = v20;
  v57 = v43;

  v44 = v63;
  if (v44)
    CFDictionarySetValue(v6, CFSTR("__kmessageThreadOriginatorKey"), v44);
  v64 = v31;

  v45 = v67;
  if (v45)
    CFDictionarySetValue(v6, CFSTR("__kbiaReferenceIDKey"), v45);
  v62 = v42;
  v68 = v23;

  v46 = v65;
  if (v46)
    CFDictionarySetValue(v6, CFSTR("__kscheduleTypeKey"), v46);
  v47 = v24;
  v66 = v25;

  v48 = v69;
  if (v48)
    CFDictionarySetValue(v6, CFSTR("__kscheduleStateKey"), v48);
  v49 = v21;

  v50 = v72;
  if (v50)
    CFDictionarySetValue(v6, CFSTR("__kmessageDateEditedKey"), v50);

  v51 = v106;
  if (v106)
  {
    v73 = v49;
    JWDecodeDictionary();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "objectForKey:", *MEMORY[0x1E0D383C8]);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
      CFDictionarySetValue(v6, CFSTR("__kmessageIsInitialTranscriptSharingItem"), v53);

    objc_msgSend(v52, "objectForKey:", *MEMORY[0x1E0D383D0]);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (v54)
      CFDictionarySetValue(v6, CFSTR("__kmessageTranscriptSharingMessageType"), v54);

    v49 = v73;
    v51 = v106;
  }
  -[IMDNotificationsController _setContactInMessageDictionary:messageDictionary:](self, "_setContactInMessageDictionary:messageDictionary:", v40, v6);
  v55 = v6;

  return v55;
}

- (id)_chatDictionaryForMessageRecord:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "chatRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[IMDNotificationsController _chatDictionaryForChatRecord:](self, "_chatDictionaryForChatRecord:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v10 = 138412290;
        v11 = v4;
        _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "We didn't get any chat records for message record %@", (uint8_t *)&v10, 0xCu);
      }

    }
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 10);
  }
  v8 = (void *)v6;

  return v8;
}

+ (id)_displayNameForChatRecord:(id)a3
{
  id v4;

  v4 = 0;
  if (!a3)
    return 0;
  _IMDChatRecordBulkCopy((uint64_t)a3, 0, 0, 0, 0, 0, 0, 0, 0, &v4, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0);
  return v4;
}

- (id)_chatDictionaryForChatRecord:(id)a3
{
  id v4;
  __CFDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  NSObject *v20;
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
  int v33;
  int v34;
  _BOOL4 v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int v39;
  uint64_t v40;
  void *v41;
  void *value;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  const void *v47;
  const void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint8_t buf[4];
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (__CFDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 10);
  v54 = 0;
  v55 = 0;
  v52 = 0;
  v53 = 0;
  v50 = 0;
  v51 = 0;
  v48 = 0;
  v49 = 0;
  v47 = 0;
  if (v4)
  {
    _IMDChatRecordBulkCopy((uint64_t)v4, &v48, 0, 0, &v49, &v55, 0, &v54, 0, &v53, &v50, 0, &v52, 0, &v47, 0, 0, 0, 0,
      &v51,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0);
    v45 = v55;
    v46 = v54;
    value = v53;
    v43 = v52;
    v6 = v50;
    v44 = v51;
    v7 = v49;
    if (v49)
    {
      JWDecodeDictionary();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "valueForKey:", CFSTR("wasAutoDetectedForSpam"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      HIDWORD(v40) = objc_msgSend(v9, "BOOLValue");

      objc_msgSend(v8, "valueForKey:", CFSTR("wasDetectedAsiMessageSpam"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v40) = objc_msgSend(v10, "BOOLValue");

      objc_msgSend(v8, "valueForKey:", CFSTR("wasDetectedAsSMSSpam"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v11, "BOOLValue");

      objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D37788]);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "valueForKey:", CFSTR("SMSCategory"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "intValue");

      objc_msgSend(v8, "valueForKey:", CFSTR("SMSSubCategory"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "intValue");

      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isTranscriptSharingEnabled");

      if (v17)
      {
        objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D37768]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }

      v37 = v15;
      v38 = v13;
    }
    else
    {
      v40 = 0;
      v41 = 0;
      v39 = 0;
      v37 = 0;
      v38 = 0;
      v18 = 0;
    }
    objc_msgSend(v4, "handleRecords");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "count"))
    {
      if (v19)
        CFDictionarySetValue(v5, CFSTR("__kchatHandlesForChatKey"), v19);
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v57 = v46;
        _os_log_impl(&dword_1ABB60000, v20, OS_LOG_TYPE_INFO, "We got 0 handles back for chatRecord with guid %@", buf, 0xCu);
      }

    }
    IMSharedHelperCatalystNotificationDisabled();
    v36 = -[IMDNotificationsController _chatIsMutedBasedOnChatGUID:chatIdentifier:groupID:handles:lastAddressedHandleString:originalGroupID:style:](self, "_chatIsMutedBasedOnChatGUID:chatIdentifier:groupID:handles:lastAddressedHandleString:originalGroupID:style:", v46, v45, v43, v19, v6, v44, v48);
    -[IMDNotificationsController _lastMessageTimeForChat:](self, "_lastMessageTimeForChat:", v4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v21, "__im_nanosecondTimeInterval"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
        CFDictionarySetValue(v5, CFSTR("__kchatLastMessageTimestamp"), v23);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v48);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      CFDictionarySetValue(v5, CFSTR("__kchatStyleKey"), v24);

    if (v7)
      CFDictionarySetValue(v5, CFSTR("__kchatPropertiesDataKey"), v7);
    if (v45)
      CFDictionarySetValue(v5, CFSTR("__kchatChatIdentifierKey"), v45);
    if (v46)
      CFDictionarySetValue(v5, CFSTR("__kchatChatGUIDKey"), v46);
    if (value)
      CFDictionarySetValue(v5, CFSTR("__kchatGroupNameKey"), value);
    if (v41)
      CFDictionarySetValue(v5, CFSTR("__kchatGroupPhotoGuidKey"), v41);
    if (v19)
      CFDictionarySetValue(v5, CFSTR("__kchatParticipantsKey"), v19);
    if (v43)
      CFDictionarySetValue(v5, CFSTR("__kchatGroupIDKey"), v43);
    if (v44)
      CFDictionarySetValue(v5, CFSTR("__kchatOriginalGroupIDKey"), v44);
    if (v6)
      CFDictionarySetValue(v5, CFSTR("__kchatLastAddressedHandleStringKey"), v6);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v47);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
      CFDictionarySetValue(v5, CFSTR("__kchatIsFilteredKey"), v25);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", HIDWORD(v40));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      CFDictionarySetValue(v5, CFSTR("__kchatWasReportedAsiMessageSpamKey"), v26);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v40);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
      CFDictionarySetValue(v5, CFSTR("__kchatWasDetectedAsiMessageSpamKey"), v27);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v39);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
      CFDictionarySetValue(v5, CFSTR("__kchatWasDetectedAsSMSSpamKey"), v28);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v38);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
      CFDictionarySetValue(v5, CFSTR("__kchatSMSCategoryKey"), v29);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v37);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
      CFDictionarySetValue(v5, CFSTR("__kchatSMSSubCategoryKey"), v30);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v36);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
      CFDictionarySetValue(v5, CFSTR("__kchatIsMutedKey"), v31);

    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "isTranscriptSharingEnabled");

    if (v18)
      v34 = v33;
    else
      v34 = 0;
    if (v34 == 1)
      CFDictionarySetValue(v5, CFSTR("__kchatEmergencyUserInfo"), v18);

  }
  return v5;
}

- (BOOL)_messageShouldBeSilentlyDeliveredForBusinessChat:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("__kmessageHandleKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_addressForHandle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1AF434F1C]();

  if (v7)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("__kmessageSummaryInfoDataKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    JWDecodeDictionary();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D39C20]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_chatIsMutedBasedOnChatGUID:(id)a3 chatIdentifier:(id)a4 groupID:(id)a5 handles:(id)a6 lastAddressedHandleString:(id)a7 originalGroupID:(id)a8 style:(int64_t)a9
{
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;

  v13 = (void *)MEMORY[0x1E0D39970];
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  objc_msgSend(v13, "sharedList");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "__imArrayByApplyingBlock:", &unk_1E5AB0C40);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "muteIdentifiersForChatStyle:groupID:participantIDs:lastAddressedHandleID:originalGroupID:chatIdentifier:", a9, v17, v20, v15, v14, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v17) = objc_msgSend(v19, "isMutedChatForMuteIdentifiers:", v21);
  return (char)v17;
}

- (id)contactForHandleRecord:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_addressForHandle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((MEMORY[0x1AF434F1C](v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "_stripFZIDPrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0C967C0];
    v11[0] = *MEMORY[0x1E0C96888];
    v11[1] = v8;
    v9 = *MEMORY[0x1E0C966A0];
    v11[2] = *MEMORY[0x1E0C966A8];
    v11[3] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _IMDCoreSpotlightCNContactForAddressWithAdditionalPropertyKeys(v7, v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)_setContactInMessageDictionary:(id)a3 messageDictionary:(id)a4
{
  id v6;
  __CFDictionary *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (__CFDictionary *)a4;
  -[IMDNotificationsController contactForHandleRecord:](self, "contactForHandleRecord:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    CFDictionarySetValue(v7, CFSTR("__kmessageCNContactForSenderKey"), v8);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[__CFDictionary objectForKey:](v7, "objectForKey:", CFSTR("__kmessageCNContactForSenderKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_1ABB60000, v9, OS_LOG_TYPE_INFO, "CNContact for sender %@", (uint8_t *)&v11, 0xCu);

    }
  }

}

- (id)_stickerTapbackTransferGUIDFromMessageDictionary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("__kmessageAttachmentsKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") != 1)
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1ABC57BB4();
    v5 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "guid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "length"))
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1ABC57B88();
LABEL_8:

  }
  return v5;
}

- (id)_tapbackFromMessageDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("__kmessageAssociatedMessageTypeKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v8 = 0;
    goto LABEL_32;
  }
  v7 = objc_msgSend(v5, "integerValue");
  v8 = 0;
  if (v7 <= 2999)
  {
    if ((unint64_t)(v7 - 2000) >= 6)
    {
      if (v7 != 2006)
      {
        if (v7 == 2007)
        {
          -[IMDNotificationsController _stickerTapbackTransferGUIDFromMessageDictionary:](self, "_stickerTapbackTransferGUIDFromMessageDictionary:", v4);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "length"))
          {
            v10 = objc_alloc(MEMORY[0x1E0D39B20]);
            v11 = v9;
            v12 = 0;
LABEL_15:
            v13 = objc_msgSend(v10, "initWithTransferGUID:isRemoved:", v11, v12);
LABEL_21:
            v8 = (void *)v13;
LABEL_31:

            goto LABEL_32;
          }
          IMLogHandleForCategory();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            sub_1ABC57B88();
          goto LABEL_30;
        }
        goto LABEL_32;
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("__kmessageAssociatedMessageEmojiKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "length"))
      {
        IMLogHandleForCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          sub_1ABC57C38();
        goto LABEL_30;
      }
      v14 = objc_alloc(MEMORY[0x1E0D39830]);
      v15 = v9;
      v16 = 0;
LABEL_20:
      v13 = objc_msgSend(v14, "initWithEmoji:isRemoved:", v15, v16);
      goto LABEL_21;
    }
LABEL_10:
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39770]), "initWithAssociatedMessageType:", v7);
    goto LABEL_32;
  }
  if ((unint64_t)(v7 - 3000) < 6)
    goto LABEL_10;
  if (v7 == 3006)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("__kmessageAssociatedMessageEmojiKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "length"))
    {
      IMLogHandleForCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_1ABC57C0C();
      goto LABEL_30;
    }
    v14 = objc_alloc(MEMORY[0x1E0D39830]);
    v15 = v9;
    v16 = 1;
    goto LABEL_20;
  }
  if (v7 == 3007)
  {
    -[IMDNotificationsController _stickerTapbackTransferGUIDFromMessageDictionary:](self, "_stickerTapbackTransferGUIDFromMessageDictionary:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      v10 = objc_alloc(MEMORY[0x1E0D39B20]);
      v11 = v9;
      v12 = 1;
      goto LABEL_15;
    }
    IMLogHandleForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1ABC57BE0();
LABEL_30:

    v8 = 0;
    goto LABEL_31;
  }
LABEL_32:

  return v8;
}

+ (id)_IMDCoreSpotlightCNContactForAddress:(id)a3
{
  return _IMDCoreSpotlightCNContactForAddress(a3);
}

- (void)setNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCenter, a3);
}

- (UNNotificationCategory)incomingMessageNotificationCategory
{
  return self->_incomingMessageNotificationCategory;
}

- (void)setIncomingMessageNotificationCategory:(id)a3
{
  objc_storeStrong((id *)&self->_incomingMessageNotificationCategory, a3);
}

- (UNNotificationCategory)incomingFilesNotificationCategory
{
  return self->_incomingFilesNotificationCategory;
}

- (void)setIncomingFilesNotificationCategory:(id)a3
{
  objc_storeStrong((id *)&self->_incomingFilesNotificationCategory, a3);
}

- (IMBusinessNameManager)businessNameManager
{
  return self->_businessNameManager;
}

- (void)setBusinessNameManager:(id)a3
{
  objc_storeStrong((id *)&self->_businessNameManager, a3);
}

- (CNContact)meContact
{
  return self->_meContact;
}

- (void)setMeContact:(id)a3
{
  objc_storeStrong((id *)&self->_meContact, a3);
}

- (NSSet)meTokens
{
  return self->_meTokens;
}

- (void)setMeTokens:(id)a3
{
  objc_storeStrong((id *)&self->_meTokens, a3);
}

- (NSSet)activeAccountAliases
{
  return self->_activeAccountAliases;
}

- (void)setActiveAccountAliases:(id)a3
{
  objc_storeStrong((id *)&self->_activeAccountAliases, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAccountAliases, 0);
  objc_storeStrong((id *)&self->_meTokens, 0);
  objc_storeStrong((id *)&self->_meContact, 0);
  objc_storeStrong((id *)&self->_businessNameManager, 0);
  objc_storeStrong((id *)&self->_incomingFilesNotificationCategory, 0);
  objc_storeStrong((id *)&self->_incomingMessageNotificationCategory, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end
