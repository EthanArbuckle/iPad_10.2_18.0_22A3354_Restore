@implementation FCPrivateDataContext

- (FCPuzzleTypeSettings)puzzleTypeSettings
{
  return self->_puzzleTypeSettings;
}

- (FCTagSettings)tagSettings
{
  return self->_tagSettings;
}

- (FCPersonalizationData)personalizationData
{
  FCPersonalizationData *personalizationData;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  personalizationData = self->_personalizationData;
  if (!personalizationData)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_personalizationData");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContext personalizationData]";
      v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      v10 = 1024;
      v11 = 267;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_personalizationData;
    }
    personalizationData = 0;
  }
  return personalizationData;
}

- (FCSubscriptionList)subscriptionList
{
  FCSubscriptionList *subscriptionList;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  subscriptionList = self->_subscriptionList;
  if (!subscriptionList)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_subscriptionList");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContext subscriptionList]";
      v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      v10 = 1024;
      v11 = 320;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_subscriptionList;
    }
    subscriptionList = 0;
  }
  return subscriptionList;
}

- (FCPrivateChannelMembershipController)privateChannelMembershipController
{
  FCPrivateChannelMembershipController *privateChannelMembershipController;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  privateChannelMembershipController = self->_privateChannelMembershipController;
  if (!privateChannelMembershipController)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_privateChannelMembershipController");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContext privateChannelMembershipController]";
      v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      v10 = 1024;
      v11 = 272;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_privateChannelMembershipController;
    }
    privateChannelMembershipController = 0;
  }
  return privateChannelMembershipController;
}

- (NSString)privateDataDirectory
{
  NSString *privateDataDirectory;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  privateDataDirectory = self->_privateDataDirectory;
  if (!privateDataDirectory)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_privateDataDirectory");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContext privateDataDirectory]";
      v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      v10 = 1024;
      v11 = 338;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_privateDataDirectory;
    }
    privateDataDirectory = 0;
  }
  return privateDataDirectory;
}

- (FCUserInfo)userInfo
{
  FCUserInfo *userInfo;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  userInfo = self->_userInfo;
  if (!userInfo)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_userInfo");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContext userInfo]";
      v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      v10 = 1024;
      v11 = 326;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_userInfo;
    }
    userInfo = 0;
  }
  return userInfo;
}

- (FCReadingHistory)readingHistory
{
  FCReadingHistory *readingHistory;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  readingHistory = self->_readingHistory;
  if (!readingHistory)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_readingHistory");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContext readingHistory]";
      v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      v10 = 1024;
      v11 = 278;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_readingHistory;
    }
    readingHistory = 0;
  }
  return readingHistory;
}

- (FCShortcutList)shortcutList
{
  FCShortcutList *shortcutList;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  shortcutList = self->_shortcutList;
  if (!shortcutList)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_shortcutList");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContext shortcutList]";
      v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      v10 = 1024;
      v11 = 296;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_shortcutList;
    }
    shortcutList = 0;
  }
  return shortcutList;
}

- (FCIssueReadingHistory)issueReadingHistory
{
  FCIssueReadingHistory *issueReadingHistory;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  issueReadingHistory = self->_issueReadingHistory;
  if (!issueReadingHistory)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_issueReadingHistory");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContext issueReadingHistory]";
      v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      v10 = 1024;
      v11 = 262;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_issueReadingHistory;
    }
    issueReadingHistory = 0;
  }
  return issueReadingHistory;
}

- (FCPrivateDataContextInternal)internalPrivateDataContext
{
  FCPrivateDataContextInternal *internalPrivateDataContext;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  internalPrivateDataContext = self->_internalPrivateDataContext;
  if (!internalPrivateDataContext)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_internalPrivateDataContext");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContext internalPrivateDataContext]";
      v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      v10 = 1024;
      v11 = 344;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_internalPrivateDataContext;
    }
    internalPrivateDataContext = 0;
  }
  return internalPrivateDataContext;
}

- (void)preparePrivateDataControllersForUse
{
  id v3;

  -[FCPrivateDataContext _privateDataControllers](self, "_privateDataControllers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeObjectsPerformSelector:", sel_prepareForUse);
  objc_msgSend(v3, "makeObjectsPerformSelector:withObject:", sel_addStateObserver_, self);
  objc_msgSend(v3, "makeObjectsPerformSelector:", sel_assertReadyForUse);

}

- (FCReadingList)readingList
{
  FCReadingList *readingList;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  readingList = self->_readingList;
  if (!readingList)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_readingList");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContext readingList]";
      v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      v10 = 1024;
      v11 = 284;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_readingList;
    }
    readingList = 0;
  }
  return readingList;
}

- (FCUserEventHistory)userEventHistory
{
  FCUserEventHistory *userEventHistory;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  userEventHistory = self->_userEventHistory;
  if (!userEventHistory)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_userEventHistory");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContext userEventHistory]";
      v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      v10 = 1024;
      v11 = 314;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_userEventHistory;
    }
    userEventHistory = 0;
  }
  return userEventHistory;
}

- (FCAudioPlaylist)audioPlaylist
{
  FCAudioPlaylist *audioPlaylist;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  audioPlaylist = self->_audioPlaylist;
  if (!audioPlaylist)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_audioPlaylist");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContext audioPlaylist]";
      v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      v10 = 1024;
      v11 = 308;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_audioPlaylist;
    }
    audioPlaylist = 0;
  }
  return audioPlaylist;
}

- (FCPuzzleHistory)puzzleHistory
{
  FCPuzzleHistory *puzzleHistory;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  puzzleHistory = self->_puzzleHistory;
  if (!puzzleHistory)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_puzzleHistory");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContext puzzleHistory]";
      v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      v10 = 1024;
      v11 = 290;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_puzzleHistory;
    }
    puzzleHistory = 0;
  }
  return puzzleHistory;
}

- (FCPrivateDataContext)initWithConfiguration:(id)a3 context:(id)a4 privateDataHostDirectory:(id)a5 privateDataActionProvider:(id)a6 encryptionDelegate:(id)a7 networkBehaviorMonitor:(id)a8 privateDataSyncingEnabled:(BOOL)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  FCCKPrivateDatabase *v20;
  void *v21;
  void *v22;
  id *v23;
  void *v24;
  void *v25;
  FCPrivateDataContext *v26;
  void *v28;
  void *v29;
  uint64_t v30;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (!v15 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "context != nil");
    *(_DWORD *)buf = 136315906;
    v33 = "-[FCPrivateDataContext initWithConfiguration:context:privateDataHostDirectory:privateDataActionProvider:encryp"
          "tionDelegate:networkBehaviorMonitor:privateDataSyncingEnabled:]";
    v34 = 2080;
    v35 = "FCPrivateDataContext.m";
    v36 = 1024;
    v37 = 97;
    v38 = 2114;
    v39 = v28;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (!v16 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "privateDataHostDirectory != nil");
    *(_DWORD *)buf = 136315906;
    v33 = "-[FCPrivateDataContext initWithConfiguration:context:privateDataHostDirectory:privateDataActionProvider:encryp"
          "tionDelegate:networkBehaviorMonitor:privateDataSyncingEnabled:]";
    v34 = 2080;
    v35 = "FCPrivateDataContext.m";
    v36 = 1024;
    v37 = 98;
    v38 = 2114;
    v39 = v29;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v20 = [FCCKPrivateDatabase alloc];
  objc_msgSend(v14, "privateDataContainerIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "privateDataSecureContainerIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[FCCKPrivateDatabase initWithContainerIdentifier:secureContainerIdentifier:productionEnvironment:encryptionDelegate:networkBehaviorMonitor:privateDataSyncingEnabled:](v20, v21, v22, objc_msgSend(v14, "isProductionPrivateDataEnvironment"), v18, v19, a9);

  objc_msgSend(v14, "privateDataContainerCombinationIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URLByAppendingPathComponent:isDirectory:", v24, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v30) = a9;
  v26 = -[FCPrivateDataContext initWithConfiguration:context:privateDatabase:privateDataDirectory:privateDataActionProvider:encryptionDelegate:networkBehaviorMonitor:privateDataSyncingEnabled:](self, "initWithConfiguration:context:privateDatabase:privateDataDirectory:privateDataActionProvider:encryptionDelegate:networkBehaviorMonitor:privateDataSyncingEnabled:", v14, v15, v23, v25, v17, v18, v19, v30);

  return v26;
}

- (FCPrivateDataContext)initWithConfiguration:(id)a3 context:(id)a4 privateDatabase:(id)a5 privateDataDirectory:(id)a6 privateDataActionProvider:(id)a7 encryptionDelegate:(id)a8 networkBehaviorMonitor:(id)a9 privateDataSyncingEnabled:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  FCPrivateDataContext *v21;
  FCPrivateDataContext *v22;
  void *v23;
  uint64_t v24;
  NSString *privateDataDirectory;
  void *v26;
  _QWORD *v27;
  void *v28;
  void *v29;
  id *v30;
  FCSubscriptionList *v31;
  FCSubscriptionList *subscriptionList;
  FCReadingList *v33;
  FCReadingList *readingList;
  FCPuzzleHistory *v35;
  FCPuzzleHistory *puzzleHistory;
  FCShortcutList *v37;
  FCShortcutList *shortcutList;
  FCShortcutCategoryList *v39;
  FCShortcutCategoryList *shortcutCategoryList;
  FCAudioPlaylist *v41;
  FCAudioPlaylist *audioPlaylist;
  FCUserEventHistoryStorage *v43;
  void *v44;
  FCUserEventHistoryStorage *v45;
  FCUserEventHistory *v46;
  FCUserEventHistory *userEventHistory;
  FCPrivateChannelMembershipController *v48;
  FCUserInfo *v49;
  uint64_t v50;
  FCTagSettings *tagSettings;
  uint64_t v52;
  FCPuzzleTypeSettings *puzzleTypeSettings;
  FCPersonalizationData *v54;
  FCPersonalizationData *personalizationData;
  void *v56;
  id v57;
  FCNonDestructivePrivateDataMigrationHandler *v58;
  id v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  FCReadingHistory *v66;
  FCIssueReadingHistory *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  objc_super v75;
  _QWORD v76[11];
  uint8_t buf[4];
  const char *v78;
  __int16 v79;
  char *v80;
  __int16 v81;
  int v82;
  __int16 v83;
  void *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v74 = a6;
  v73 = a7;
  v19 = a8;
  v72 = a9;
  if (!v17 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v60 = v19;
    v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "context != nil");
    *(_DWORD *)buf = 136315906;
    v78 = "-[FCPrivateDataContext initWithConfiguration:context:privateDatabase:privateDataDirectory:privateDataActionPro"
          "vider:encryptionDelegate:networkBehaviorMonitor:privateDataSyncingEnabled:]";
    v79 = 2080;
    v80 = "FCPrivateDataContext.m";
    v81 = 1024;
    v82 = 128;
    v83 = 2114;
    v84 = v61;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    v19 = v60;
    if (v18)
      goto LABEL_6;
  }
  else if (v18)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v62 = v19;
    v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "privateDatabase != nil");
    *(_DWORD *)buf = 136315906;
    v78 = "-[FCPrivateDataContext initWithConfiguration:context:privateDatabase:privateDataDirectory:privateDataActionPro"
          "vider:encryptionDelegate:networkBehaviorMonitor:privateDataSyncingEnabled:]";
    v79 = 2080;
    v80 = "FCPrivateDataContext.m";
    v81 = 1024;
    v82 = 129;
    v83 = 2114;
    v84 = v63;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    v19 = v62;
  }
LABEL_6:
  v20 = v74;
  if (!v74 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v64 = v19;
    v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "privateDataDirectory != nil");
    *(_DWORD *)buf = 136315906;
    v78 = "-[FCPrivateDataContext initWithConfiguration:context:privateDatabase:privateDataDirectory:privateDataActionPro"
          "vider:encryptionDelegate:networkBehaviorMonitor:privateDataSyncingEnabled:]";
    v79 = 2080;
    v80 = "FCPrivateDataContext.m";
    v81 = 1024;
    v82 = 130;
    v83 = 2114;
    v84 = v65;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    v19 = v64;
  }
  v75.receiver = self;
  v75.super_class = (Class)FCPrivateDataContext;
  v21 = -[FCPrivateDataContext init](&v75, sel_init);
  v22 = v21;
  if (v21)
  {
    v70 = v19;
    v71 = v16;
    objc_storeStrong((id *)&v21->_contentContext, a4);
    v22->_privateDataSyncingEnabled = a10;
    objc_msgSend(v74, "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    privateDataDirectory = v22->_privateDataDirectory;
    v22->_privateDataDirectory = (NSString *)v24;

    objc_storeStrong((id *)&v22->_networkBehaviorMonitor, a9);
    objc_msgSend(v74, "path");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[FCPushNotificationCenter initWithPrivateDatabase:storeDirectory:]([FCPushNotificationCenter alloc], v18, v26);
    objc_storeStrong((id *)&v22->_privatePushNotificationHandler, v27);
    v28 = (void *)objc_opt_new();
    objc_storeStrong((id *)&v22->_internalPrivateDataContext, v28);
    objc_msgSend(v17, "appActivityMonitor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAppActivityMonitor:", v29);

    objc_msgSend(v28, "setPrivateDatabase:", v18);
    v76[0] = CFSTR("AudioPlaylist");
    v76[1] = CFSTR("IssueReadingHistory");
    v76[2] = CFSTR("Subscriptions");
    v76[3] = CFSTR("Shortcuts");
    v76[4] = CFSTR("SensitiveSubscriptions");
    v76[5] = CFSTR("ReadingList");
    v76[6] = CFSTR("ReadingHistory");
    v76[7] = CFSTR("ChannelMemberships");
    v76[8] = CFSTR("UserInfo");
    v76[9] = CFSTR("UserEventHistory");
    v76[10] = CFSTR("PuzzleHistory");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 11);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[FCCKRecordZoneManager initWithDatabase:recordZoneNames:]([FCCKRecordZoneManager alloc], v18, v68);
    v69 = v28;
    objc_msgSend(v28, "setRecordZoneManager:", v30);

    v31 = -[FCSubscriptionList initWithContext:pushNotificationCenter:storeDirectory:]([FCSubscriptionList alloc], "initWithContext:pushNotificationCenter:storeDirectory:", v17, v27, v26);
    subscriptionList = v22->_subscriptionList;
    v22->_subscriptionList = v31;

    v67 = -[FCIssueReadingHistory initWithContext:pushNotificationCenter:storeDirectory:]([FCIssueReadingHistory alloc], "initWithContext:pushNotificationCenter:storeDirectory:", v17, v27, v26);
    objc_storeStrong((id *)&v22->_issueReadingHistory, v67);
    v66 = -[FCReadingHistory initWithContext:pushNotificationCenter:storeDirectory:]([FCReadingHistory alloc], "initWithContext:pushNotificationCenter:storeDirectory:", v17, v27, v26);
    objc_storeStrong((id *)&v22->_readingHistory, v66);
    v33 = -[FCReadingList initWithContext:pushNotificationCenter:storeDirectory:]([FCReadingList alloc], "initWithContext:pushNotificationCenter:storeDirectory:", v17, v27, v26);
    readingList = v22->_readingList;
    v22->_readingList = v33;

    v35 = -[FCPuzzleHistory initWithContext:pushNotificationCenter:storeDirectory:]([FCPuzzleHistory alloc], "initWithContext:pushNotificationCenter:storeDirectory:", v17, v27, v26);
    puzzleHistory = v22->_puzzleHistory;
    v22->_puzzleHistory = v35;

    v37 = -[FCShortcutList initWithContext:pushNotificationCenter:storeDirectory:]([FCShortcutList alloc], "initWithContext:pushNotificationCenter:storeDirectory:", v17, v27, v26);
    shortcutList = v22->_shortcutList;
    v22->_shortcutList = v37;

    v39 = -[FCShortcutCategoryList initWithContext:pushNotificationCenter:storeDirectory:]([FCShortcutCategoryList alloc], "initWithContext:pushNotificationCenter:storeDirectory:", v17, v27, v26);
    shortcutCategoryList = v22->_shortcutCategoryList;
    v22->_shortcutCategoryList = v39;

    v41 = -[FCAudioPlaylist initWithContext:pushNotificationCenter:storeDirectory:]([FCAudioPlaylist alloc], "initWithContext:pushNotificationCenter:storeDirectory:", v17, v27, v26);
    audioPlaylist = v22->_audioPlaylist;
    v22->_audioPlaylist = v41;

    v43 = [FCUserEventHistoryStorage alloc];
    objc_msgSend(v17, "appConfigurationManager");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = -[FCUserEventHistoryStorage initWithPrivateDataDirectory:configurationManager:](v43, "initWithPrivateDataDirectory:configurationManager:", v74, v44);

    v46 = -[FCUserEventHistory initWithContext:pushNotificationCenter:storeDirectory:sessionStorage:]([FCUserEventHistory alloc], "initWithContext:pushNotificationCenter:storeDirectory:sessionStorage:", v17, v27, v26, v45);
    userEventHistory = v22->_userEventHistory;
    v22->_userEventHistory = v46;

    v48 = -[FCPrivateChannelMembershipController initWithContext:pushNotificationCenter:storeDirectory:]([FCPrivateChannelMembershipController alloc], "initWithContext:pushNotificationCenter:storeDirectory:", v17, v27, v26);
    objc_storeStrong((id *)&v22->_privateChannelMembershipController, v48);
    v49 = -[FCUserInfo initWithContext:pushNotificationCenter:storeDirectory:]([FCUserInfo alloc], "initWithContext:pushNotificationCenter:storeDirectory:", v17, v27, v26);
    objc_storeStrong((id *)&v22->_userInfo, v49);
    -[FCUserInfo tagSettings](v22->_userInfo, "tagSettings");
    v50 = objc_claimAutoreleasedReturnValue();
    tagSettings = v22->_tagSettings;
    v22->_tagSettings = (FCTagSettings *)v50;

    -[FCUserInfo puzzleTypeSettings](v22->_userInfo, "puzzleTypeSettings");
    v52 = objc_claimAutoreleasedReturnValue();
    puzzleTypeSettings = v22->_puzzleTypeSettings;
    v22->_puzzleTypeSettings = (FCPuzzleTypeSettings *)v52;

    v54 = -[FCPersonalizationData initWithContext:pushNotificationCenter:storeDirectory:]([FCPersonalizationData alloc], "initWithContext:pushNotificationCenter:storeDirectory:", v17, v27, v26);
    personalizationData = v22->_personalizationData;
    v22->_personalizationData = v54;

    -[FCPrivateDataContext _privateDataControllers](v22, "_privateDataControllers");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v73)
    {
      v57 = v18;
      v58 = -[FCNonDestructivePrivateDataMigrationHandler initWithPrivateDataActionProvider:privateDataControllers:privateDataSyncingEnabled:]([FCNonDestructivePrivateDataMigrationHandler alloc], "initWithPrivateDataActionProvider:privateDataControllers:privateDataSyncingEnabled:", v73, v56, a10);
      -[FCNonDestructivePrivateDataMigrationHandler handleMigrationWithPrivateDataDirectory:](v58, "handleMigrationWithPrivateDataDirectory:", v22->_privateDataDirectory);

      v18 = v57;
    }
    if (a10)
      -[FCPushNotificationCenter enableSyncing](v27);
    else
      -[FCPushNotificationCenter disableSyncing]((uint64_t)v27);
    -[FCCKPrivateDatabase registerZoneRestorationSources:]((uint64_t)v18, v56);
    -[FCCKPrivateDatabase registerZonePruningAssistants:]((uint64_t)v18, v56);

    v19 = v70;
    v16 = v71;
    v20 = v74;
  }

  return v22;
}

- (id)_privateDataControllers
{
  FCIssueReadingHistory *issueReadingHistory;
  FCPersonalizationData *personalizationData;
  FCUserEventHistory *userEventHistory;
  FCReadingHistory *readingHistory;
  FCPrivateChannelMembershipController *privateChannelMembershipController;
  FCUserInfo *userInfo;
  __int128 v8;
  _QWORD v10[4];
  __int128 v11;
  FCShortcutList *shortcutList;
  FCPrivateChannelMembershipController *v13;
  FCUserInfo *v14;
  FCPersonalizationData *v15;
  FCUserEventHistory *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  issueReadingHistory = self->_issueReadingHistory;
  personalizationData = self->_personalizationData;
  userEventHistory = self->_userEventHistory;
  v10[0] = self->_audioPlaylist;
  v10[1] = issueReadingHistory;
  privateChannelMembershipController = self->_privateChannelMembershipController;
  readingHistory = self->_readingHistory;
  userInfo = self->_userInfo;
  v10[2] = self->_subscriptionList;
  v10[3] = readingHistory;
  v8 = *(_OWORD *)&self->_readingList;
  shortcutList = self->_shortcutList;
  v13 = privateChannelMembershipController;
  v11 = v8;
  v14 = userInfo;
  v15 = personalizationData;
  v16 = userEventHistory;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 11);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (FCPrivateDataContext)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPrivateDataContext init]";
    v9 = 2080;
    v10 = "FCPrivateDataContext.m";
    v11 = 1024;
    v12 = 86;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPrivateDataContext init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCShortcutCategoryList)shortcutCategoryList
{
  FCShortcutCategoryList *shortcutCategoryList;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  shortcutCategoryList = self->_shortcutCategoryList;
  if (!shortcutCategoryList)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_shortcutCategoryList");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContext shortcutCategoryList]";
      v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      v10 = 1024;
      v11 = 302;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_shortcutCategoryList;
    }
    shortcutCategoryList = 0;
  }
  return shortcutCategoryList;
}

- (FCPushNotificationHandling)privatePushNotificationHandler
{
  FCPushNotificationHandling *privatePushNotificationHandler;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  privatePushNotificationHandler = self->_privatePushNotificationHandler;
  if (!privatePushNotificationHandler)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_privatePushNotificationHandler");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContext privatePushNotificationHandler]";
      v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      v10 = 1024;
      v11 = 332;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_privatePushNotificationHandler;
    }
    privatePushNotificationHandler = 0;
  }
  return privatePushNotificationHandler;
}

- (id)privateStoreWithName:(id)a3 version:(unint64_t)a4 options:(unint64_t)a5
{
  id v8;
  FCKeyValueStore *v9;
  void *v10;
  FCKeyValueStore *v11;

  v8 = a3;
  v9 = [FCKeyValueStore alloc];
  -[FCPrivateDataContext privateDataDirectory](self, "privateDataDirectory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[FCKeyValueStore initWithName:directory:version:options:classRegistry:](v9, "initWithName:directory:version:options:classRegistry:", v8, v10, a4, a5, 0);

  return v11;
}

- (BOOL)isPrivateDataSyncingEnabled
{
  return self->_privateDataSyncingEnabled;
}

- (FCNetworkBehaviorMonitor)networkBehaviorMonitor
{
  return self->_networkBehaviorMonitor;
}

- (void)setInternalPrivateDataContext:(id)a3
{
  objc_storeStrong((id *)&self->_internalPrivateDataContext, a3);
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (void)setContentContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_internalPrivateDataContext, 0);
  objc_storeStrong((id *)&self->_networkBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_privatePushNotificationHandler, 0);
  objc_storeStrong((id *)&self->_tagSettings, 0);
  objc_storeStrong((id *)&self->_privateDataDirectory, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_subscriptionList, 0);
  objc_storeStrong((id *)&self->_userEventHistory, 0);
  objc_storeStrong((id *)&self->_audioPlaylist, 0);
  objc_storeStrong((id *)&self->_shortcutCategoryList, 0);
  objc_storeStrong((id *)&self->_shortcutList, 0);
  objc_storeStrong((id *)&self->_puzzleTypeSettings, 0);
  objc_storeStrong((id *)&self->_puzzleHistory, 0);
  objc_storeStrong((id *)&self->_readingList, 0);
  objc_storeStrong((id *)&self->_readingHistory, 0);
  objc_storeStrong((id *)&self->_privateChannelMembershipController, 0);
  objc_storeStrong((id *)&self->_personalizationData, 0);
  objc_storeStrong((id *)&self->_issueReadingHistory, 0);
}

@end
