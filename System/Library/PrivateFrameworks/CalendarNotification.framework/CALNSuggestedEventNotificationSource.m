@implementation CALNSuggestedEventNotificationSource

- (CALNSuggestedEventNotificationSource)initWithDataSource:(id)a3 notificationManager:(id)a4 iconIdentifierProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  CALNSuggestedEventNotificationSource *v12;
  CALNSuggestedEventNotificationSource *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CALNSuggestedEventNotificationSource;
  v12 = -[CALNSuggestedEventNotificationSource init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dataSource, a3);
    objc_storeWeak((id *)&v13->_notificationManager, v10);
    objc_storeStrong((id *)&v13->_iconIdentifierProvider, a5);
  }

  return v13;
}

- (NSString)sourceIdentifier
{
  return (NSString *)CFSTR("com.apple.calendar.notifications.SuggestedEvent");
}

- (NSArray)categories
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__CALNSuggestedEventNotificationSource_categories__block_invoke;
  block[3] = &unk_24D484738;
  block[4] = self;
  if (categories_onceToken_3 != -1)
    dispatch_once(&categories_onceToken_3, block);
  return (NSArray *)(id)categories_categories_3;
}

void __50__CALNSuggestedEventNotificationSource_categories__block_invoke()
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[3];
  void *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "_bundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("Add to calendar button for a suggested event"), CFSTR("Add to Calendar"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_bundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Ignore button for a suggested event"), CFSTR("Ignore"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_bundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Delete button for a canceled suggested event"), CFSTR("Delete"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[CALNNotificationAction actionWithIdentifier:title:systemImageName:](CALNNotificationAction, "actionWithIdentifier:title:systemImageName:", CFSTR("CALNNotificationConfirmAction"), v16, CFSTR("checkmark.circle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationAction actionWithIdentifier:title:systemImageName:](CALNNotificationAction, "actionWithIdentifier:title:systemImageName:", CFSTR("CALNNotificationIgnoreAction"), v15, CFSTR("xmark.circle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationAction actionWithIdentifier:title:systemImageName:](CALNNotificationAction, "actionWithIdentifier:title:systemImageName:", CFSTR("CALNNotificationDeleteAction"), v14, CFSTR("trash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v3;
  v19[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE14858], "brandedOriginDescriptionStringWithAppName:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationCategory categoryWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:](CALNNotificationCategory, "categoryWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:", CFSTR("SuggestedEvent.Default"), v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationCategory categoryWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:](CALNNotificationCategory, "categoryWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:", CFSTR("SuggestedEvent.Coalesced"), MEMORY[0x24BDBD1A8], v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationCategory categoryWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:](CALNNotificationCategory, "categoryWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:", CFSTR("SuggestedEvent.Canceled"), v10, v7, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v8;
  v17[1] = v9;
  v17[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)categories_categories_3;
  categories_categories_3 = v12;

}

+ (id)_bundle
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__CALNSuggestedEventNotificationSource__bundle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_bundle_onceToken != -1)
    dispatch_once(&_bundle_onceToken, block);
  return (id)_bundle_bundle;
}

void __47__CALNSuggestedEventNotificationSource__bundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_bundle_bundle;
  _bundle_bundle = v0;

}

- (id)contentForNotificationWithSourceClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
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
  uint64_t v28;
  __CFString *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  const __CFString *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  id v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CALNSuggestedEventNotificationSource dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchSuggestedEventNotificationsWithSourceClientIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v44 = v4;
    if ((unint64_t)objc_msgSend(v6, "count") < 2)
    {
      if (objc_msgSend(v6, "count") == 1)
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "suggestionNotification");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "title");
        v20 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "allDescriptionStringsWithOptions:", 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "launchURL");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v26, "type");
        v29 = 0;
        if ((unint64_t)(v28 - 12) <= 2)
          v29 = off_24D484C28[v28 - 12];
        v43 = v29;
        objc_msgSend(v26, "startDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "expirationDate");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "originAppName");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "calendar");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "calendarIdentifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v45 = 0;
        v46 = 0;
        v47 = 0;
        v48 = 0;
        v43 = 0;
        v23 = 0;
        v49 = 0;
        v20 = 0;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v9 = v6;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v51 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
            objc_msgSend(v14, "suggestionNotification");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v15);
            objc_msgSend(v14, "expirationDate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v16);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
        }
        while (v11);
      }

      objc_msgSend(v8, "sortUsingSelector:", sel_compare_);
      v17 = (void *)MEMORY[0x24BE14858];
      v18 = (void *)objc_msgSend(v7, "copy");
      objc_msgSend(v17, "coalescedInfoForSuggestionNotifications:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "title");
      v20 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "descriptionText");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      CUIKLaunchURLForInbox();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "originAppName");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "calendar");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "calendarIdentifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "lastObject");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = 0;
      v43 = CFSTR("SuggestedEvent.Coalesced");
    }
    +[CALNNotificationSound soundWithAlertType:alertTopic:](CALNNotificationSound, "soundWithAlertType:alertTopic:", 10, CFSTR("com.apple.mobilecal.bulletin-subsection.suggestions"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v23;
    v33 = v32;
    if (!v32)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[CALNSuggestedEventNotificationSource iconIdentifierProvider](self, "iconIdentifierProvider");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "identifierForIconWithDate:inCalendar:", v33, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = (void *)MEMORY[0x24BDD17C8];
    -[CALNSuggestedEventNotificationSource sourceIdentifier](self, "sourceIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "stringWithFormat:", CFSTR("%@.%@"), v38, v47);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = (void *)objc_opt_new();
    objc_msgSend(v40, "setTitle:", v20);
    objc_msgSend(v40, "setBody:", v49);
    objc_msgSend(v40, "setCategoryIdentifier:", v43);
    objc_msgSend(v40, "setSectionIdentifier:", CFSTR("com.apple.mobilecal.bulletin-subsection.suggestions"));
    objc_msgSend(v40, "setDate:", v32);
    objc_msgSend(v40, "setExpirationDate:", v46);
    objc_msgSend(v40, "setDefaultActionURL:", v48);
    objc_msgSend(v40, "setIconIdentifier:", v36);
    objc_msgSend(v40, "setSound:", v31);
    objc_msgSend(v40, "setThreadIdentifier:", v39);
    objc_msgSend(v40, "setInterruptionLevel:", 1);
    objc_msgSend(v40, "setFilterCriteria:", v45);
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v41 = objc_claimAutoreleasedReturnValue();
    v4 = v44;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v55 = v44;
      v56 = 2112;
      v57 = v40;
      _os_log_impl(&dword_215D9B000, v41, OS_LOG_TYPE_DEFAULT, "Fetched suggested event notification with sourceClientIdentifier %{public}@. Content: %@", buf, 0x16u);
    }

    v24 = (void *)objc_msgSend(v40, "copy");
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[CALNSuggestedEventNotificationSource contentForNotificationWithSourceClientIdentifier:].cold.1((uint64_t)v4, v20);
    v24 = 0;
  }

  return v24;
}

- (void)refreshNotifications:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  CALNNotificationRecord *v13;
  void *v14;
  CALNNotificationRecord *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id obj;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  -[CALNSuggestedEventNotificationSource dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchSuggestedEventNotificationObjectIDs");
  v5 = objc_claimAutoreleasedReturnValue();

  v27 = (void *)objc_opt_new();
  v24 = (void *)v5;
  -[CALNSuggestedEventNotificationSource _sourceClientIdentifiersForObjectIDs:](self, "_sourceClientIdentifiersForObjectIDs:", v5);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x2199F1FA0]();
        -[CALNSuggestedEventNotificationSource contentForNotificationWithSourceClientIdentifier:](self, "contentForNotificationWithSourceClientIdentifier:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = [CALNNotificationRecord alloc];
          -[CALNSuggestedEventNotificationSource sourceIdentifier](self, "sourceIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[CALNNotificationRecord initWithSourceIdentifier:sourceClientIdentifier:content:](v13, "initWithSourceIdentifier:sourceClientIdentifier:content:", v14, v10, v12);

          objc_msgSend(v27, "addObject:", v15);
        }

        objc_autoreleasePoolPop(v11);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v25)
  {
    if (!v17)
      goto LABEL_16;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v33 = v18;
    v19 = "Refreshed suggested event notifications in response to database change. Found %{public}@ notifications for changed objects.";
  }
  else
  {
    if (!v17)
      goto LABEL_16;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v33 = v18;
    v19 = "Refreshed suggested event notifications. Found %{public}@ notifications.";
  }
  _os_log_impl(&dword_215D9B000, v16, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);

LABEL_16:
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v33 = v21;
    _os_log_impl(&dword_215D9B000, v20, OS_LOG_TYPE_DEFAULT, "Refreshed suggested event notifications. Found %{public}@ notifications.", buf, 0xCu);

  }
  -[CALNSuggestedEventNotificationSource notificationManager](self, "notificationManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNSuggestedEventNotificationSource sourceIdentifier](self, "sourceIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationRecordsDiffApplier refreshNotificationManager:withNotificationRecords:forSourceWithIdentifier:filteredBySourceClientIDs:](CALNNotificationRecordsDiffApplier, "refreshNotificationManager:withNotificationRecords:forSourceWithIdentifier:filteredBySourceClientIDs:", v22, v27, v23, 0);

}

- (id)_sourceClientIdentifiersForObjectIDs:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        -[CALNSuggestedEventNotificationSource dataSource](self, "dataSource", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "fetchSuggestedEventNotificationWithObjectID:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v13, "sourceClientIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)didReceiveResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "notificationRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "categoryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "actionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "sourceClientIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543618;
    v14 = v10;
    v15 = 2114;
    v16 = v8;
    _os_log_impl(&dword_215D9B000, v11, OS_LOG_TYPE_DEFAULT, "Received notification response for suggested event notification with source client identifier = %{public}@, actionIdentifier = %{public}@", (uint8_t *)&v13, 0x16u);
  }

  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.CALNNotificationDefaultActionIdentifier")) & 1) != 0
    || objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.CALNNotificationDismissActionIdentifier")))
  {
    -[CALNSuggestedEventNotificationSource dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "clearSuggestedEventNotificationWithSourceClientIdentifier:", v10);
LABEL_6:

    goto LABEL_7;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("SuggestedEvent.Default")))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("CALNNotificationConfirmAction")))
    {
      -[CALNSuggestedEventNotificationSource dataSource](self, "dataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "confirmSuggestedEventWithSourceClientIdentifier:", v10);
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("CALNNotificationIgnoreAction")))
        goto LABEL_7;
      -[CALNSuggestedEventNotificationSource dataSource](self, "dataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "ignoreSuggestedEventWithSourceClientIdentifier:", v10);
    }
    goto LABEL_6;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("SuggestedEvent.Canceled"))
    && objc_msgSend(v8, "isEqualToString:", CFSTR("CALNNotificationDeleteAction")))
  {
    -[CALNSuggestedEventNotificationSource dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deleteCanceledSuggestedEventWithSourceClientIdentifier:", v10);
    goto LABEL_6;
  }
LABEL_7:

}

- (CALNSuggestedEventNotificationDataSource)dataSource
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconIdentifierProvider, 0);
  objc_destroyWeak((id *)&self->_notificationManager);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

+ (id)defaultSuggestedEventCategoryIdentifier
{
  return CFSTR("SuggestedEvent.Default");
}

+ (id)coalescedSuggestedEventCategoryIdentifier
{
  return CFSTR("SuggestedEvent.Coalesced");
}

+ (id)suggestedEventCanceledCategoryIdentifier
{
  return CFSTR("SuggestedEvent.Canceled");
}

+ (id)confirmActionIdentifier
{
  return CFSTR("CALNNotificationConfirmAction");
}

+ (id)ignoreActionIdentifier
{
  return CFSTR("CALNNotificationIgnoreAction");
}

+ (id)deleteActionIdentifier
{
  return CFSTR("CALNNotificationDeleteAction");
}

- (void)contentForNotificationWithSourceClientIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_215D9B000, a2, OS_LOG_TYPE_ERROR, "Failed to get notification infos for sourceClientIdentifier (%{public}@)", (uint8_t *)&v2, 0xCu);
}

@end
