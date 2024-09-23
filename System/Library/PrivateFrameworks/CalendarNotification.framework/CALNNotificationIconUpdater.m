@implementation CALNNotificationIconUpdater

- (CALNNotificationIconUpdater)initWithIconIdentifierVersionProvider:(id)a3 protectedNotificationStorage:(id)a4 iconCache:(id)a5 iconIdentifierProvider:(id)a6 notificationManager:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CALNNotificationIconUpdater *v17;
  CALNNotificationIconUpdater *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CALNNotificationIconUpdater;
  v17 = -[CALNNotificationIconUpdater init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_identifierVersionProvider, a3);
    objc_storeStrong((id *)&v18->_protectedStorage, a4);
    objc_storeStrong((id *)&v18->_iconCache, a5);
    objc_storeStrong((id *)&v18->_iconIdentifierProvider, a6);
    objc_storeStrong((id *)&v18->_notificationManager, a7);
  }

  return v18;
}

- (void)updateIconsToNewVersionIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[16];

  -[CALNNotificationIconUpdater identifierVersionProvider](self, "identifierVersionProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "iconIdentifierVersion");
  -[CALNNotificationIconUpdater identifierVersionProvider](self, "identifierVersionProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "iconVersionToUpgradeTo");

  if (v4 < v6)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215D9B000, v7, OS_LOG_TYPE_DEFAULT, "IconUpdater: IconIdentifierVersion out of date, updating all icon identifiers in storage first.", buf, 2u);
    }

    -[CALNNotificationIconUpdater _updateAllIconIdentifiersInStorage:](self, "_updateAllIconIdentifiersInStorage:", self->_protectedStorage);
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215D9B000, v8, OS_LOG_TYPE_DEFAULT, "IconUpdater: Wiping icon cache directory to get rid of out dated icon files", buf, 2u);
    }

    -[CALNNotificationIconUpdater iconCache](self, "iconCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "forceRemoveAllCachedIconsWithError:", 0);

    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215D9B000, v10, OS_LOG_TYPE_DEFAULT, "IconUpdater: Regenerating icon files that are still in use in protectedStorage", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNNotificationIconUpdater protectedStorage](self, "protectedStorage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "notificationRecords");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __62__CALNNotificationIconUpdater_updateIconsToNewVersionIfNeeded__block_invoke;
    v21[3] = &unk_24D484AB8;
    v14 = v11;
    v22 = v14;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v21);

    -[CALNNotificationIconUpdater iconCache](self, "iconCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addIconsWithIdentifiers:error:", v16, 0);

    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215D9B000, v17, OS_LOG_TYPE_DEFAULT, "IconUpdater: icon update complete, setting icon version to current version", buf, 2u);
    }

    -[CALNNotificationIconUpdater identifierVersionProvider](self, "identifierVersionProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "iconVersionToUpgradeTo");
    -[CALNNotificationIconUpdater identifierVersionProvider](self, "identifierVersionProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setIconIdentifierVersion:", v19);

  }
}

void __62__CALNNotificationIconUpdater_updateIconsToNewVersionIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v8, "content");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "iconIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

  }
}

- (void)_updateAllIconIdentifiersInStorage:(id)a3
{
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  id obj;
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "notificationRecords");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v5)
  {
    v7 = v5;
    v27 = *(_QWORD *)v29;
    *(_QWORD *)&v6 = 138543618;
    v24 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v27)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v9, "content", v24);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "mutableCopy");

        objc_msgSend(v11, "iconIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          -[CALNNotificationIconUpdater iconIdentifierProvider](self, "iconIdentifierProvider");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "content");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "date");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "identifierForIconWithDate:inCalendar:", v15, v26);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setIconIdentifier:", v16);

        }
        v17 = (void *)objc_msgSend(v9, "mutableCopy");
        objc_msgSend(v17, "setContent:", v11);
        +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v9, "content");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "iconIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "content");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "iconIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v24;
          v33 = v20;
          v34 = 2114;
          v35 = v22;
          _os_log_impl(&dword_215D9B000, v18, OS_LOG_TYPE_DEFAULT, "IconUpdater: Updating iconIdentifiers in each notification storage entry, oldIdentifier:[%{public}@], newIdentifier:[%{public}@]", buf, 0x16u);

        }
        -[CALNNotificationIconUpdater notificationManager](self, "notificationManager");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "updateRecord:", v17);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v7);
  }

}

- (CALNIconIdentifierVersionProvider)identifierVersionProvider
{
  return self->_identifierVersionProvider;
}

- (CALNNotificationStorage)protectedStorage
{
  return self->_protectedStorage;
}

- (CALNIconCache)iconCache
{
  return self->_iconCache;
}

- (CALNCalendarIconIdentifierProvider)iconIdentifierProvider
{
  return self->_iconIdentifierProvider;
}

- (CALNNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_iconIdentifierProvider, 0);
  objc_storeStrong((id *)&self->_iconCache, 0);
  objc_storeStrong((id *)&self->_protectedStorage, 0);
  objc_storeStrong((id *)&self->_identifierVersionProvider, 0);
}

@end
