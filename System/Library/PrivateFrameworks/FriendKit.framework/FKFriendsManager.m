@implementation FKFriendsManager

+ (id)managerForDomain:(id)a3
{
  id v3;
  FKFriendsManager *v4;

  v3 = a3;
  if (managerForDomain__onceToken != -1)
    dispatch_once(&managerForDomain__onceToken, &__block_literal_global_0);
  objc_msgSend((id)managerForDomain___sharedFriendListManagers, "objectForKey:", v3);
  v4 = (FKFriendsManager *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = -[FKFriendsManager initWithDomain:]([FKFriendsManager alloc], "initWithDomain:", v3);
    objc_msgSend((id)managerForDomain___sharedFriendListManagers, "setObject:forKey:", v4, v3);
  }

  return v4;
}

+ (void)setGroupSize:(unint64_t)a3 domain:(id)a4
{
  void *v5;
  __CFString *applicationID;

  v5 = (void *)MEMORY[0x24BDD16E0];
  applicationID = (__CFString *)a4;
  CFPreferencesSetAppValue(CFSTR("FKGroupSize"), (CFPropertyListRef)objc_msgSend(v5, "numberWithUnsignedInteger:", a3), applicationID);
  CFPreferencesAppSynchronize(applicationID);

}

- (id)_copyAndResetChangeLog
{
  NSObject *changeLogQueue;
  id v4;
  _QWORD v6[6];
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  id location;

  objc_initWeak(&location, self);
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  changeLogQueue = self->_changeLogQueue;
  v6[2] = __42__FKFriendsManager__copyAndResetChangeLog__block_invoke;
  v6[3] = &unk_24CCDFD98;
  v6[1] = 3221225472;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  v6[5] = &v8;
  dispatch_sync(changeLogQueue, v6);
  v4 = (id)v9[5];
  objc_destroyWeak(&v7);
  _Block_object_dispose(&v8, 8);

  objc_destroyWeak(&location);
  return v4;
}

+ (void)setMaxGroupCount:(unint64_t)a3 domain:(id)a4
{
  void *v5;
  __CFString *applicationID;

  v5 = (void *)MEMORY[0x24BDD16E0];
  applicationID = (__CFString *)a4;
  CFPreferencesSetAppValue(CFSTR("FKMaxGroupCount"), (CFPropertyListRef)objc_msgSend(v5, "numberWithUnsignedInteger:", a3), applicationID);
  CFPreferencesAppSynchronize(applicationID);

}

void __53__FKFriendsManager__postGroupListChangedNotification__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("FKFriendsManagerGroupListChanged"), 0);

}

void __37__FKFriendsManager_managerForDomain___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)managerForDomain___sharedFriendListManagers;
  managerForDomain___sharedFriendListManagers = v0;

}

- (FKFriendsManager)initWithDomain:(id)a3
{
  __CFString *v4;
  FKFriendsManager *v5;
  FKFriendsManager *v6;
  __CFString *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *cachedStatuses;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSHashTable *sourcedPersons;
  uint64_t v15;
  NSMapTable *identifiersToPersonMap;
  uint64_t v17;
  NPSManager *npsManager;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *saveQueue;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *changeLogQueue;
  CFIndex AppIntegerValue;
  uint64_t v26;
  CFIndex v27;
  uint64_t v28;
  int AppBooleanValue;
  BOOL v30;
  char v31;
  const __CFString *v32;
  const __CFString *friendsChangedExternallyNotificationName;
  const __CFString *v34;
  const __CFString *friendGroupTitleChangedExternallyNotificationName;
  int v36;
  BOOL v37;
  char v38;
  int v39;
  BOOL v40;
  char v41;
  int v42;
  BOOL v43;
  char v44;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v46;
  Boolean keyExistsAndHasValidFormat;
  objc_super v49;

  v4 = (__CFString *)a3;
  v49.receiver = self;
  v49.super_class = (Class)FKFriendsManager;
  v5 = -[FKFriendsManager init](&v49, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
      v7 = v4;
    else
      v7 = CFSTR("com.apple.ET");
    objc_storeStrong((id *)&v5->_domain, v7);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    cachedStatuses = v6->_cachedStatuses;
    v6->_cachedStatuses = v8;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    getCNContactStoreDidChangeNotification();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      getCNContactStoreDidChangeNotification();
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObserver:selector:name:object:", v6, sel__addressBookChanged_, v12, 0);
    }
    else
    {
      _FKGetLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[FKFriendsManager initWithDomain:].cold.1(v12);
    }

    objc_msgSend(v10, "addObserver:selector:name:object:", v6, sel__personValuesChanged_, CFSTR("FKPersonValuesChangedNotification"), 0);
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 0);
    v13 = objc_claimAutoreleasedReturnValue();
    sourcedPersons = v6->_sourcedPersons;
    v6->_sourcedPersons = (NSHashTable *)v13;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v15 = objc_claimAutoreleasedReturnValue();
    identifiersToPersonMap = v6->_identifiersToPersonMap;
    v6->_identifiersToPersonMap = (NSMapTable *)v15;

    v17 = objc_opt_new();
    npsManager = v6->_npsManager;
    v6->_npsManager = (NPSManager *)v17;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create("com.apple.FriendKit.FKFriendsManager.Save", v19);
    saveQueue = v6->_saveQueue;
    v6->_saveQueue = (OS_dispatch_queue *)v20;

    dispatch_queue_attr_make_with_qos_class(MEMORY[0x24BDAC9C0], QOS_CLASS_DEFAULT, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = dispatch_queue_create("com.apple.FriendKit.FKFriendsManager.ChangeLog", v22);
    changeLogQueue = v6->_changeLogQueue;
    v6->_changeLogQueue = (OS_dispatch_queue *)v23;

    keyExistsAndHasValidFormat = 0;
    AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("FKMaxGroupCount"), (CFStringRef)v6->_domain, &keyExistsAndHasValidFormat);
    v26 = 20;
    if (keyExistsAndHasValidFormat)
      v26 = AppIntegerValue;
    v6->_maxFriendGroups = v26;
    v27 = CFPreferencesGetAppIntegerValue(CFSTR("FKGroupSize"), (CFStringRef)v6->_domain, &keyExistsAndHasValidFormat);
    v28 = 12;
    if (keyExistsAndHasValidFormat)
      v28 = v27;
    v6->_maxFriendsPerGroup = v28;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("FKEmptyTrailingGroupEnabled"), (CFStringRef)v6->_domain, &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
      v30 = AppBooleanValue == 1;
    else
      v30 = 1;
    v31 = v30;
    v6->_shouldAddEmptyTrailingGroup = v31;
    v32 = (const __CFString *)CFPreferencesCopyAppValue(CFSTR("FKFriendsChangedExternallyNotificationName"), (CFStringRef)v6->_domain);
    v6->_friendsChangedExternallyNotificationName = (__CFString *)v32;
    if (v32 && CFStringGetLength(v32) >= 1)
      friendsChangedExternallyNotificationName = v6->_friendsChangedExternallyNotificationName;
    else
      friendsChangedExternallyNotificationName = CFSTR("FKFriendsChangedExternallyNotification");
    v6->_friendsChangedExternallyNotificationName = (__CFString *)friendsChangedExternallyNotificationName;
    v34 = (const __CFString *)CFPreferencesCopyAppValue(CFSTR("FKFriendGroupTitleChangedExternallyNotificationName"), (CFStringRef)v6->_domain);
    v6->_friendGroupTitleChangedExternallyNotificationName = (__CFString *)v34;
    if (v34 && CFStringGetLength(v34) >= 1)
      friendGroupTitleChangedExternallyNotificationName = v6->_friendGroupTitleChangedExternallyNotificationName;
    else
      friendGroupTitleChangedExternallyNotificationName = CFSTR("FKFriendGroupTitleChangedExternallyNotification");
    v6->_friendGroupTitleChangedExternallyNotificationName = (__CFString *)friendGroupTitleChangedExternallyNotificationName;
    v36 = CFPreferencesGetAppBooleanValue(CFSTR("FKDeduplicateFriendListEnabled"), (CFStringRef)v6->_domain, &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
      v37 = v36 == 1;
    else
      v37 = 1;
    v38 = v37;
    v6->_shouldDeduplicateFriendList = v38;
    v39 = CFPreferencesGetAppBooleanValue(CFSTR("FKRemoveDestinationlessFriendsEnabled"), (CFStringRef)v6->_domain, &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
      v40 = v39 == 1;
    else
      v40 = 0;
    v41 = v40;
    v6->_shouldRemoveDestinationlessFriends = v41;
    v42 = CFPreferencesGetAppBooleanValue(CFSTR("FKRefreshAgainstContactsOnInitEnabled"), (CFStringRef)v6->_domain, &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
      v43 = v42 == 1;
    else
      v43 = 1;
    v44 = v43;
    v6->_refreshAgainstContactsEnabled = v44;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)_FKFriendsChangedExternallyHandler, v6->_friendsChangedExternallyNotificationName, 0, CFNotificationSuspensionBehaviorDrop);
    v46 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v46, v6, (CFNotificationCallback)_FKFriendGroupTitleChangedExternallyHandler, v6->_friendGroupTitleChangedExternallyNotificationName, 0, CFNotificationSuspensionBehaviorDrop);
    -[FKFriendsManager _createEmptyFriendList](v6, "_createEmptyFriendList");
    -[FKFriendsManager _loadFriendList](v6, "_loadFriendList");
    -[FKFriendsManager _loadGroupTitles](v6, "_loadGroupTitles");

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v5;
  __CFString *friendsChangedExternallyNotificationName;
  __CFString *friendGroupTitleChangedExternallyNotificationName;
  objc_super v8;

  -[IDSBatchIDQueryController invalidate](self->_queryController, "invalidate");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, self->_friendsChangedExternallyNotificationName, 0);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self, self->_friendGroupTitleChangedExternallyNotificationName, 0);
  friendsChangedExternallyNotificationName = self->_friendsChangedExternallyNotificationName;
  if (friendsChangedExternallyNotificationName != CFSTR("FKFriendsChangedExternallyNotification"))
    CFRelease(friendsChangedExternallyNotificationName);
  friendGroupTitleChangedExternallyNotificationName = self->_friendGroupTitleChangedExternallyNotificationName;
  if (friendGroupTitleChangedExternallyNotificationName != CFSTR("FKFriendGroupTitleChangedExternallyNotification"))
    CFRelease(friendGroupTitleChangedExternallyNotificationName);
  v8.receiver = self;
  v8.super_class = (Class)FKFriendsManager;
  -[FKFriendsManager dealloc](&v8, sel_dealloc);
}

- (id)friendGroups
{
  return self->_friendGroups;
}

- (void)_addEmptyGroup
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  NSMutableArray *friendList;
  void *v7;
  FKFriendGroup *v8;

  v8 = -[FKFriendGroup initWithDelegate:groupSize:]([FKFriendGroup alloc], "initWithDelegate:groupSize:", self, self->_maxFriendsPerGroup);
  -[NSMutableArray addObject:](self->_friendGroups, "addObject:");
  v3 = self->_maxFriendsPerGroup + -[NSMutableArray count](self->_friendList, "count");
  v4 = -[NSMutableArray count](self->_friendList, "count");
  if (v4 < v3)
  {
    v5 = v4;
    do
    {
      friendList = self->_friendList;
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray setObject:atIndexedSubscript:](friendList, "setObject:atIndexedSubscript:", v7, v5);

      ++v5;
    }
    while (v3 != v5);
  }
  -[FKFriendsManager _postGroupListChangedNotification](self, "_postGroupListChangedNotification");

}

- (void)_createEmptyFriendList
{
  NSMutableArray *v3;
  NSMutableArray *friendList;
  NSMutableArray *v5;
  NSMutableArray *friendGroups;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  friendList = self->_friendList;
  self->_friendList = v3;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  friendGroups = self->_friendGroups;
  self->_friendGroups = v5;

  -[FKFriendsManager _addEmptyGroup](self, "_addEmptyGroup");
}

- (void)reloadFriendList
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _FKGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[FKFriendsManager reloadFriendList]";
    v6 = 1024;
    v7 = 312;
    _os_log_impl(&dword_211A80000, v3, OS_LOG_TYPE_DEFAULT, "%s (%d) \"a friend list reload was requested\", (uint8_t *)&v4, 0x12u);
  }

  -[FKFriendsManager _loadFriendList](self, "_loadFriendList");
}

- (void)_loadFriendList
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  const __CFString *v6;
  _BOOL4 didCompleteInitialLoading;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  _BOOL4 lastLoadHadChanges;
  _BYTE v12[18];
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  CFPreferencesAppSynchronize((CFStringRef)self->_domain);
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("FriendList"), (CFStringRef)self->_domain);
  _FKGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = &stru_24CCE02E8;
      didCompleteInitialLoading = self->_didCompleteInitialLoading;
      *(_QWORD *)&v12[4] = "-[FKFriendsManager _loadFriendList]";
      *(_DWORD *)v12 = 136315650;
      if (!didCompleteInitialLoading)
        v6 = CFSTR(" for the first time");
      *(_WORD *)&v12[12] = 1024;
      *(_DWORD *)&v12[14] = 321;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_211A80000, v4, OS_LOG_TYPE_DEFAULT, "%s (%d) \"loaded friend list%@\", v12, 0x1Cu);
    }

    -[FKFriendsManager _updateFriends:](self, "_updateFriends:", v3);
  }
  else
  {
    if (v5)
    {
      *(_DWORD *)v12 = 136315394;
      *(_QWORD *)&v12[4] = "-[FKFriendsManager _loadFriendList]";
      *(_WORD *)&v12[12] = 1024;
      *(_DWORD *)&v12[14] = 324;
      _os_log_impl(&dword_211A80000, v4, OS_LOG_TYPE_DEFAULT, "%s (%d) \"friend list does not yet exist, starting with an empty list\", v12, 0x12u);
    }

    -[FKFriendsManager _createEmptyFriendList](self, "_createEmptyFriendList");
    if (objc_msgSend(CFSTR("com.apple.ET"), "isEqualToString:", self->_domain))
    {
      -[FKFriendsManager markFriendListAsNormalized](self, "markFriendListAsNormalized");
      -[FKFriendsManager _curatedFriendList](self, "_curatedFriendList");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[FKFriendsManager _addCuratedFriends:](self, "_addCuratedFriends:", v8);

    }
    self->_needsFriendListSync = 1;
    -[FKFriendsManager save](self, "save");
  }
  -[FKFriendsManager _updateFriendGroups](self, "_updateFriendGroups", *(_OWORD *)v12);
  self->_lastLoadHadChanges = -[FKFriendsManager _changeLogCount](self, "_changeLogCount") != 0;
  if (self->_didCompleteInitialLoading)
  {
    _FKGetLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = &stru_24CCE02E8;
      lastLoadHadChanges = self->_lastLoadHadChanges;
      *(_QWORD *)&v12[4] = "-[FKFriendsManager _loadFriendList]";
      *(_DWORD *)v12 = 136315650;
      if (!lastLoadHadChanges)
        v10 = CFSTR(" no");
      *(_WORD *)&v12[12] = 1024;
      *(_DWORD *)&v12[14] = 345;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_211A80000, v9, OS_LOG_TYPE_DEFAULT, "%s (%d) \"friend list has%@ changes\", v12, 0x1Cu);
    }

  }
  else
  {
    self->_didCompleteInitialLoading = 1;
  }
  if (!-[FKFriendsManager refreshAgainstAddressBook](self, "refreshAgainstAddressBook", *(_QWORD *)v12, *(_QWORD *)&v12[8]))
  {
    -[FKFriendsManager _cleanUpFriendListIfNecessary](self, "_cleanUpFriendListIfNecessary");
    -[FKFriendsManager _postChangeNotificationIfNecessary](self, "_postChangeNotificationIfNecessary");
  }
  -[FKFriendsManager _createAddressToPersonDictionary](self, "_createAddressToPersonDictionary");
  -[FKFriendsManager _aggdLogFriendCount](self, "_aggdLogFriendCount");
  -[FKFriendsManager _aggdLogFriendGroupCount](self, "_aggdLogFriendGroupCount");

}

- (id)_curatedFriendList
{
  unint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38__FKFriendsManager__curatedFriendList__block_invoke;
  v8[3] = &unk_24CCDFB20;
  v8[4] = &v9;
  +[FKAddressBook performBlock:](FKAddressBook, "performBlock:", v8);
  v3 = objc_msgSend((id)v10[5], "count");
  if (v3)
  {
    if (v3 > self->_maxFriendGroups * self->_maxFriendsPerGroup)
      objc_msgSend((id)v10[5], "removeObjectsInRange:");
    _FKGetLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend((id)v10[5], "count");
      *(_DWORD *)buf = 136315650;
      v16 = "-[FKFriendsManager _curatedFriendList]";
      v17 = 1024;
      v18 = 412;
      v19 = 2048;
      v20 = v5;
      _os_log_impl(&dword_211A80000, v4, OS_LOG_TYPE_DEFAULT, "%s (%d) \"phone favorites import complete with %tu Digital Touch friends\", buf, 0x1Cu);
    }

    v6 = (void *)objc_msgSend((id)v10[5], "copy");
  }
  else
  {
    v6 = 0;
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __38__FKFriendsManager__curatedFriendList__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  _QWORD v47[3];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE025E8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "count");
  _FKGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315650;
      v39 = "-[FKFriendsManager _curatedFriendList]_block_invoke";
      v40 = 1024;
      v41 = 372;
      v42 = 2048;
      v43 = objc_msgSend(v4, "count");
      _os_log_impl(&dword_211A80000, v6, OS_LOG_TYPE_DEFAULT, "%s (%d) \"processing %tu phone favorites for Digital Touch friend import\", buf, 0x1Cu);
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v30 = v4;
    v12 = v4;
    v13 = v11;
    obj = v12;
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v35;
      v17 = 0x24CCDF000uLL;
      do
      {
        v18 = 0;
        v31 = v15;
        do
        {
          if (*(_QWORD *)v35 != v16)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v18);
          v20 = (void *)objc_msgSend(objc_alloc(*(Class *)(v17 + 1440)), "initWithFavorite:addressBook:", v19, a2);
          objc_msgSend(v20, "abRecordGUID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21 && -[NSObject containsObject:](v13, "containsObject:", v21))
          {
            _FKGetLogSystem();
            v22 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              goto LABEL_19;
            objc_msgSend(v19, "displayName");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "value");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136316162;
            v39 = "-[FKFriendsManager _curatedFriendList]_block_invoke";
            v40 = 1024;
            v41 = 382;
            v42 = 2112;
            v43 = (uint64_t)v23;
            v44 = 2112;
            v45 = v24;
            v46 = 2112;
            v47[0] = v21;
            _os_log_impl(&dword_211A80000, v22, OS_LOG_TYPE_DEFAULT, "%s (%d) \"not importing phone favorite [%@ | %@] with record GUID %@; person was already imported\",
              buf,
              0x30u);

            goto LABEL_18;
          }
          if (!v20)
            __38__FKFriendsManager__curatedFriendList__block_invoke_cold_1();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v20);
          if (v21)
            -[NSObject addObject:](v13, "addObject:", v21);
          _FKGetLogSystem();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v19, "displayName");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "value");
            v25 = v16;
            v26 = v13;
            v27 = a2;
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v19, "_abUid");
            *(_DWORD *)buf = 136316418;
            v39 = "-[FKFriendsManager _curatedFriendList]_block_invoke";
            v40 = 1024;
            v41 = 393;
            v42 = 2112;
            v43 = (uint64_t)v23;
            v44 = 2112;
            v45 = v28;
            v46 = 1024;
            LODWORD(v47[0]) = v29;
            WORD2(v47[0]) = 2112;
            *(_QWORD *)((char *)v47 + 6) = v21;
            _os_log_impl(&dword_211A80000, v22, OS_LOG_TYPE_DEFAULT, "%s (%d) \"imported phone favorite [%@ | %@] with record ID %d and GUID %@\", buf, 0x36u);

            a2 = v27;
            v13 = v26;
            v16 = v25;
            v17 = 0x24CCDF000;
LABEL_18:

            v15 = v31;
          }
LABEL_19:

          ++v18;
        }
        while (v15 != v18);
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
      }
      while (v15);
    }
    v6 = v13;

    v4 = v30;
  }
  else if (v7)
  {
    *(_DWORD *)buf = 136315394;
    v39 = "-[FKFriendsManager _curatedFriendList]_block_invoke";
    v40 = 1024;
    v41 = 396;
    _os_log_impl(&dword_211A80000, v6, OS_LOG_TYPE_DEFAULT, "%s (%d) \"no phone favorites found to import to Digital Touch friends\", buf, 0x12u);
  }

}

- (void)_addCuratedFriends:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t maxFriendsPerGroup;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSMutableArray *friendGroups;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  _QWORD v20[5];

  v16 = a3;
  v4 = objc_msgSend(v16, "count");
  v5 = v16;
  if (v4)
  {
    v6 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __39__FKFriendsManager__addCuratedFriends___block_invoke;
    v20[3] = &unk_24CCDFB48;
    v20[4] = self;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v20);
    v7 = -[NSMutableArray count](self->_friendList, "count");
    maxFriendsPerGroup = self->_maxFriendsPerGroup;
    if (v7 % maxFriendsPerGroup)
    {
      v9 = maxFriendsPerGroup - v7 % maxFriendsPerGroup;
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 <= 1)
        v9 = 1;
      do
      {
        -[NSMutableArray addObject:](self->_friendList, "addObject:", v10);
        --v9;
      }
      while (v9);

    }
    -[FKFriendsManager _updateFriendGroups](self, "_updateFriendGroups");
    v11 = -[NSMutableArray count](self->_friendGroups, "count") - 1;
    FriendKitBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("NUMBERED_FAVORITES_FORMAT_STRING"), &stru_24CCE02E8, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    friendGroups = self->_friendGroups;
    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __39__FKFriendsManager__addCuratedFriends___block_invoke_2;
    v17[3] = &unk_24CCDFB70;
    v18 = v13;
    v19 = v11;
    v15 = v13;
    -[NSMutableArray enumerateObjectsUsingBlock:](friendGroups, "enumerateObjectsUsingBlock:", v17);
    -[FKFriendsManager saveFriendGroupTitles](self, "saveFriendGroupTitles");

    v5 = v16;
  }

}

uint64_t __39__FKFriendsManager__addCuratedFriends___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:atIndexedSubscript:", a2, a3);
}

void __39__FKFriendsManager__addCuratedFriends___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a2;
  v11 = v5;
  if (!a3)
  {
    FriendKitBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("FAVORITES"), &stru_24CCE02E8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:", v10);

    goto LABEL_7;
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 > a3 || (v7 = v5, v6 == a3) && (v8 = objc_msgSend(v5, "count"), v7 = v11, v8))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", *(_QWORD *)(a1 + 32), (a3 + 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:", v9);
LABEL_7:

    v7 = v11;
  }

}

- (BOOL)_shouldAddEmptyGroup
{
  void *v3;
  BOOL v4;

  -[NSMutableArray lastObject](self->_friendGroups, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[FKFriendsManager _canAddFriendGroup](self, "_canAddFriendGroup")
      && objc_msgSend(v3, "count")
      && self->_shouldAddEmptyTrailingGroup;
  else
    v4 = 1;

  return v4;
}

- (void)_updateFriendGroups
{
  unint64_t v3;
  unint64_t v4;
  unint64_t maxFriendGroups;
  unint64_t v6;
  NSMutableArray *friendGroups;
  FKFriendGroup *v8;
  uint64_t i;
  void *v10;
  void *v11;

  v3 = -[NSMutableArray count](self->_friendGroups, "count");
  v4 = -[NSMutableArray count](self->_friendList, "count");
  if (v4 / self->_maxFriendsPerGroup >= self->_maxFriendGroups)
    maxFriendGroups = self->_maxFriendGroups;
  else
    maxFriendGroups = v4 / self->_maxFriendsPerGroup;
  if (v3 <= maxFriendGroups)
  {
    v6 = maxFriendGroups - v3;
    if (maxFriendGroups > v3)
    {
      do
      {
        friendGroups = self->_friendGroups;
        v8 = -[FKFriendGroup initWithDelegate:groupSize:]([FKFriendGroup alloc], "initWithDelegate:groupSize:", self, self->_maxFriendsPerGroup);
        -[NSMutableArray addObject:](friendGroups, "addObject:", v8);

        --v6;
      }
      while (v6);
    }
  }
  else
  {
    -[NSMutableArray removeObjectsInRange:](self->_friendGroups, "removeObjectsInRange:", maxFriendGroups, v3 - maxFriendGroups);
  }
  if (maxFriendGroups)
  {
    for (i = 0; i != maxFriendGroups; ++i)
    {
      -[NSMutableArray subarrayWithRange:](self->_friendList, "subarrayWithRange:", self->_maxFriendsPerGroup * i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_friendGroups, "objectAtIndexedSubscript:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setFriends:", v10);

    }
  }
  if (-[FKFriendsManager _shouldAddEmptyGroup](self, "_shouldAddEmptyGroup"))
  {
    -[FKFriendsManager _addEmptyGroup](self, "_addEmptyGroup");
  }
  else if (v3 > maxFriendGroups)
  {
    -[FKFriendsManager _postGroupListChangedNotification](self, "_postGroupListChangedNotification");
  }
}

- (BOOL)_canAddFriendGroup
{
  return -[NSMutableArray count](self->_friendGroups, "count") < self->_maxFriendGroups;
}

- (BOOL)canAddFriend
{
  uint64_t v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (-[FKFriendsManager _canAddFriendGroup](self, "_canAddFriendGroup"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v4 = self->_friendGroups;
    v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v5 = *(_QWORD *)v9;
      while (2)
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v4);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "isFull", (_QWORD)v8))
          {
            LOBYTE(v3) = 1;
            goto LABEL_13;
          }
        }
        v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v3;
}

- (unint64_t)groupIndexContainingFriend:(id)a3
{
  unint64_t v4;

  v4 = -[NSMutableArray indexOfObject:](self->_friendList, "indexOfObject:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    return 1;
  else
    return vcvtms_u32_f32((float)v4 / (float)self->_maxFriendsPerGroup);
}

- (void)_removeGroupAtIndex:(unint64_t)a3
{
  if (-[NSMutableArray count](self->_friendGroups, "count") > a3)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_friendGroups, "removeObjectAtIndex:", a3);
    -[NSMutableArray removeObjectsInRange:](self->_friendList, "removeObjectsInRange:", self->_maxFriendsPerGroup * a3);
    -[FKFriendsManager _postGroupListChangedNotification](self, "_postGroupListChangedNotification");
  }
}

- (void)syncFriendGroup:(id)a3
{
  id v4;
  unint64_t maxFriendsPerGroup;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = -[NSMutableArray indexOfObject:](self->_friendGroups, "indexOfObject:", v4);
  maxFriendsPerGroup = self->_maxFriendsPerGroup;
  v12 = v4;
  objc_msgSend(v4, "friends");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_maxFriendsPerGroup)
  {
    v7 = 0;
    v8 = maxFriendsPerGroup * v13;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_friendList, "objectAtIndexedSubscript:", v8 + v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 != v10)
      {
        -[NSMutableArray setObject:atIndexedSubscript:](self->_friendList, "setObject:atIndexedSubscript:", v10, v8 + v7);
        self->_needsFriendListSync = 1;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          _FKGetLogSystem();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v15 = "-[FKFriendsManager syncFriendGroup:]";
            v16 = 1024;
            v17 = 549;
            v18 = 2112;
            v19 = v10;
            v20 = 1024;
            v21 = v7;
            v22 = 1024;
            v23 = v13;
            _os_log_impl(&dword_211A80000, v11, OS_LOG_TYPE_DEFAULT, "%s (%d) @\"%@ was moved to position %u in group %u\", buf, 0x28u);
          }

        }
      }

      ++v7;
    }
    while (v7 < self->_maxFriendsPerGroup);
  }
  if (self->_needsFriendListSync)
    -[FKFriendsManager save](self, "save");
  if (-[FKFriendsManager _shouldAddEmptyGroup](self, "_shouldAddEmptyGroup"))
    -[FKFriendsManager _addEmptyGroup](self, "_addEmptyGroup");

}

- (void)purgeEmptyFriendGroups
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  void *v6;

  v3 = -[NSMutableArray count](self->_friendGroups, "count") - 2;
  if (v3 >= 0)
  {
    v4 = 0;
LABEL_3:
    v5 = v3;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_friendGroups, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v6, "count"))
      {
        -[FKFriendsManager _removeGroupAtIndex:](self, "_removeGroupAtIndex:", v5);

        v3 = v5 - 1;
        v4 = 1;
        if (v5)
          goto LABEL_3;
        goto LABEL_11;
      }

    }
    while (v5-- > 0);
    if ((v4 & 1) == 0)
      return;
LABEL_11:
    self->_needsFriendListSync = 1;
    -[FKFriendsManager save](self, "save");
  }
}

- (void)_aggdSetValue:(int64_t)a3 forScalarKey:(__CFString *)a4
{
  if (objc_msgSend(CFSTR("com.apple.ET"), "isEqualToString:", self->_domain))
    ADClientSetValueForScalarKey();
}

- (void)_aggdLogFriendCount
{
  -[FKFriendsManager _aggdSetValue:forScalarKey:](self, "_aggdSetValue:forScalarKey:", -[FKFriendsManager _numberOfFriendsInList:](self, "_numberOfFriendsInList:", self->_friendList), CFSTR("com.apple.et.friendList.size"));
}

- (void)_aggdLogFriendGroupCount
{
  -[FKFriendsManager _aggdSetValue:forScalarKey:](self, "_aggdSetValue:forScalarKey:", -[NSMutableArray count](self->_friendGroups, "count") - 1, CFSTR("com.apple.et.friendGroups.count"));
}

- (void)_postGroupListChangedNotification
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_88);
  -[FKFriendsManager _aggdLogFriendGroupCount](self, "_aggdLogFriendGroupCount");
}

+ (void)setEnableEmptyTrailingGroup:(BOOL)a3 domain:(id)a4
{
  _BOOL8 v4;
  void *v5;
  __CFString *applicationID;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD16E0];
  applicationID = (__CFString *)a4;
  CFPreferencesSetAppValue(CFSTR("FKEmptyTrailingGroupEnabled"), (CFPropertyListRef)objc_msgSend(v5, "numberWithBool:", v4), applicationID);
  CFPreferencesAppSynchronize(applicationID);

}

+ (void)setFriendsChangedExternallyNotificationName:(id)a3 domain:(id)a4
{
  __CFString *applicationID;

  applicationID = (__CFString *)a4;
  CFPreferencesSetAppValue(CFSTR("FKFriendsChangedExternallyNotificationName"), a3, applicationID);
  CFPreferencesAppSynchronize(applicationID);

}

+ (void)setFriendGroupTitleChangedExternallyNotificationName:(id)a3 domain:(id)a4
{
  __CFString *applicationID;

  applicationID = (__CFString *)a4;
  CFPreferencesSetAppValue(CFSTR("FKFriendGroupTitleChangedExternallyNotificationName"), a3, applicationID);
  CFPreferencesAppSynchronize(applicationID);

}

+ (void)setRefreshAgainstContactsOnInitEnabled:(BOOL)a3 domain:(id)a4
{
  _BOOL8 v4;
  void *v5;
  __CFString *applicationID;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD16E0];
  applicationID = (__CFString *)a4;
  CFPreferencesSetAppValue(CFSTR("FKRefreshAgainstContactsOnInitEnabled"), (CFPropertyListRef)objc_msgSend(v5, "numberWithBool:", v4), applicationID);
  CFPreferencesAppSynchronize(applicationID);

}

- (BOOL)shouldAllowAddingContact:(id)a3 withContactStore:(id)a4 personValueCache:(id)a5
{
  id v8;
  const void *v9;
  uint64_t RecordID;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a5;
  v9 = (const void *)objc_msgSend(a4, "personFromContact:", a3);
  RecordID = ABRecordGetRecordID(v9);
  v11 = (void *)ABRecordCopyValue(v9, *MEMORY[0x24BE027E8]);
  if (-[FKFriendsManager containsFriendWithABRecordGUID:](self, "containsFriendWithABRecordGUID:", v11))
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", RecordID);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v15 = (void *)MEMORY[0x24BDD16E0];
      +[FKPerson allValuesForPerson:](FKPerson, "allValuesForPerson:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "setObject:forKey:", v14, v13);
    }
    v12 = objc_msgSend(v14, "unsignedIntegerValue") != 0;

  }
  return v12;
}

- (void)friendGroup:(id)a3 didSetFriend:(id)a4 atPosition:(unint64_t)a5
{
  unint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;

  v11 = a4;
  v8 = -[FKFriendsManager _indexForPosition:inGroup:](self, "_indexForPosition:inGroup:", a5, a3);
  v9 = -[NSMutableArray count](self->_friendList, "count");
  v10 = v11;
  if (v8 < v9)
  {
    -[NSMutableArray setObject:atIndexedSubscript:](self->_friendList, "setObject:atIndexedSubscript:", v11, v8);
    -[NSHashTable removeObject:](self->_sourcedPersons, "removeObject:", v11);
    self->_needsFriendListSync = 1;
    -[FKFriendsManager _addEntryToChangeLogForPerson:changeType:](self, "_addEntryToChangeLogForPerson:changeType:", v11, CFSTR("FKFriendsManagerPersonAdded"));
    if (-[FKFriendsManager _shouldAddEmptyGroup](self, "_shouldAddEmptyGroup"))
      -[FKFriendsManager _addEmptyGroup](self, "_addEmptyGroup");
    -[FKFriendsManager _postChangeNotificationIfNecessary](self, "_postChangeNotificationIfNecessary");
    -[FKFriendsManager save](self, "save");
    v10 = v11;
  }

}

- (void)friendGroup:(id)a3 didRemoveFriend:(id)a4 atPosition:(unint64_t)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  NSMutableArray *friendList;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = -[FKFriendsManager _indexForPosition:inGroup:](self, "_indexForPosition:inGroup:", a5, v13);
  if (v9 < -[NSMutableArray count](self->_friendList, "count"))
  {
    v10 = -[FKFriendsManager groupIndexContainingFriend:](self, "groupIndexContainingFriend:", v8);
    friendList = self->_friendList;
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray setObject:atIndexedSubscript:](friendList, "setObject:atIndexedSubscript:", v12, v9);

    self->_needsFriendListSync = 1;
    if (v8)
    {
      -[FKFriendsManager _addEntryToChangeLogForPerson:changeType:](self, "_addEntryToChangeLogForPerson:changeType:", v8, CFSTR("FKFriendsManagerPersonDeleted"));
      -[FKFriendsManager _removePersonFromIdentifiersToPersonMap:](self, "_removePersonFromIdentifiersToPersonMap:", v8);
      if (!objc_msgSend(v13, "count") && self->_maxFriendGroups >= 2)
        -[FKFriendsManager _removeGroupAtIndex:](self, "_removeGroupAtIndex:", v10);
      -[FKFriendsManager _postChangeNotificationIfNecessary](self, "_postChangeNotificationIfNecessary");
    }
    -[FKFriendsManager save](self, "save");
  }

}

- (void)friendGroup:(id)a3 didMoveFriends:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t maxFriendsPerGroup;
  unint64_t v10;
  NSMutableArray *friendList;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  self->_needsFriendListSync = 1;
  v8 = -[NSMutableArray indexOfObject:](self->_friendGroups, "indexOfObject:", v6);
  maxFriendsPerGroup = self->_maxFriendsPerGroup;
  v10 = maxFriendsPerGroup * v8;
  friendList = self->_friendList;
  objc_msgSend(v6, "friends");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray replaceObjectsInRange:withObjectsFromArray:](friendList, "replaceObjectsInRange:withObjectsFromArray:", v10, maxFriendsPerGroup, v12);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        -[FKFriendsManager _addEntryToChangeLogForPerson:changeType:](self, "_addEntryToChangeLogForPerson:changeType:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17++), CFSTR("FKFriendsManagerPersonMoved"), (_QWORD)v18);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }

  -[FKFriendsManager _postChangeNotificationIfNecessary](self, "_postChangeNotificationIfNecessary");
}

- (id)allPeople
{
  void *v2;
  void *v3;

  -[NSMapTable objectEnumerator](self->_identifiersToPersonMap, "objectEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)addFriend:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_friendGroups;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (!objc_msgSend(v9, "isFull"))
        {
          v11 = 0;
          objc_msgSend(v9, "addFriend:error:", v4, &v11);
          LOBYTE(v6) = v11 == 0;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)isPersonFriend:(id)a3
{
  if (a3)
    return -[NSMutableArray containsObject:](self->_friendList, "containsObject:");
  else
    return 0;
}

- (unint64_t)positionOfFriendInGroup:(id)a3
{
  unint64_t v4;
  unint64_t result;

  v4 = -[NSMutableArray indexOfObject:](self->_friendList, "indexOfObject:", a3);
  result = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    return v4 % self->_maxFriendsPerGroup;
  return result;
}

- (BOOL)containsFriendWithABRecordGUID:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[NSMapTable objectForKey:](self->_identifiersToPersonMap, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = -[NSMutableArray containsObject:](self->_friendList, "containsObject:", v5);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)personLikePerson:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4 && -[NSMutableArray count](self->_friendList, "count"))
  {
    v5 = 0;
    while (1)
    {
      -[FKFriendsManager _friendAtPosition:](self, "_friendAtPosition:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        if ((objc_msgSend(v6, "isLikePerson:", v4) & 1) != 0)
          break;
      }

      if (++v5 >= (unint64_t)-[NSMutableArray count](self->_friendList, "count"))
        goto LABEL_7;
    }
  }
  else
  {
LABEL_7:
    v7 = 0;
  }

  return v7;
}

- (id)_friendAtPosition:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  if (-[NSMutableArray count](self->_friendList, "count") <= a3)
  {
    v7 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_friendList, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v6)
      v7 = 0;
    else
      v7 = v5;

  }
  return v7;
}

- (void)save
{
  NSObject *saveQueue;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  saveQueue = self->_saveQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__FKFriendsManager_save__block_invoke;
  block[3] = &unk_24CCDFBE0;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(saveQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __24__FKFriendsManager_save__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  FKDelayedOperation *v5;
  uint64_t v6;
  FKDelayedOperation *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "saveOperation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  v5 = [FKDelayedOperation alloc];
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __24__FKFriendsManager_save__block_invoke_2;
  v11[3] = &unk_24CCDFBB8;
  objc_copyWeak(&v12, v2);
  v7 = -[FKDelayedOperation initWithQueue:delay:block:](v5, "initWithQueue:delay:block:", v6, v11, 0.1);
  v8 = objc_loadWeakRetained(v2);
  objc_msgSend(v8, "setSaveOperation:", v7);

  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "saveOperation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "execute");

  objc_destroyWeak(&v12);
}

void __24__FKFriendsManager_save__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_save");

}

- (void)_save
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  NPSManager *npsManager;
  NSString *domain;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD block[4];
  id v26;
  uint8_t v27[128];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_saveQueue);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", self->_friendList);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "count");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      objc_msgSend(v3, "objectAtIndex:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10 == v7)
      {
        v12 = v8;
      }
      else
      {
        objc_msgSend(v10, "dictionaryRepresentation");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "needsSave"))
          objc_msgSend(v5, "addObject:", v11);
      }
      objc_msgSend(v4, "addObject:", v12);

    }
  }
  if (self->_needsFriendListSync || objc_msgSend(v5, "count"))
  {
    CFPreferencesSetAppValue(CFSTR("FriendList"), v4, (CFStringRef)self->_domain);
    CFPreferencesAppSynchronize((CFStringRef)self->_domain);
    if (self->_needsFriendListSync && NPSHasCompletedInitialSync())
    {
      npsManager = self->_npsManager;
      domain = self->_domain;
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("FriendList"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPSManager synchronizeUserDefaultsDomain:keys:](npsManager, "synchronizeUserDefaultsDomain:keys:", domain, v15);

    }
    _FKGetLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[FKFriendsManager _save]";
      v30 = 1024;
      v31 = 849;
      _os_log_impl(&dword_211A80000, v16, OS_LOG_TYPE_DEFAULT, "%s (%d) \"friend list saved\", buf, 0x12u);
    }

    objc_initWeak((id *)buf, self);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __25__FKFriendsManager__save__block_invoke;
    block[3] = &unk_24CCDFBB8;
    objc_copyWeak(&v26, (id *)buf);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v17 = v5;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v22 != v19)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "setNeedsSave:", 0);
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v18);
    }

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
  self->_needsFriendListSync = 0;

}

void __25__FKFriendsManager__save__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_incrementExternalChangePostCount");

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v4 = objc_loadWeakRetained(v1);
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)objc_msgSend(v4, "_notificationForExternalListChange"), 0, 0, 1u);

}

- (void)_incrementExternalChangePostCount
{
  ++self->_postCount;
}

- (__CFString)_notificationForExternalListChange
{
  return self->_friendsChangedExternallyNotificationName;
}

- (id)personWithDestinations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fkSanitizedDestinationSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMapTable keyEnumerator](self->_identifiersToPersonMap, "keyEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObjectCommonWithArray:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[NSMapTable objectForKey:](self->_identifiersToPersonMap, "objectForKey:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy_;
    v24 = __Block_byref_object_dispose_;
    v25 = 0;
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __43__FKFriendsManager_personWithDestinations___block_invoke;
    v17 = &unk_24CCDFC08;
    v19 = &v20;
    v18 = v7;
    +[FKAddressBook performBlock:](FKAddressBook, "performBlock:", &v14);
    -[FKFriendsManager _storeSourcedPerson:](self, "_storeSourcedPerson:", v21[5], v14, v15, v16, v17);
    v11 = (id)v21[5];

    _Block_object_dispose(&v20, 8);
  }
  v12 = v11;

  return v12;
}

void __43__FKFriendsManager_personWithDestinations___block_invoke(uint64_t a1, uint64_t a2)
{
  FKPerson *v3;
  uint64_t v4;
  void *v5;

  v3 = -[FKPerson initWithDestinations:addressBook:]([FKPerson alloc], "initWithDestinations:addressBook:", *(_QWORD *)(a1 + 32), a2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)personWithABRecordGUID:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_identifiersToPersonMap, "objectForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  if (!v5)
  {
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __43__FKFriendsManager_personWithABRecordGUID___block_invoke;
    v11 = &unk_24CCDFC08;
    v13 = &v14;
    v12 = v4;
    +[FKAddressBook performBlock:](FKAddressBook, "performBlock:", &v8);
    -[FKFriendsManager _storeSourcedPerson:](self, "_storeSourcedPerson:", v15[5], v8, v9, v10, v11);
    v5 = (id)v15[5];

  }
  v6 = v5;
  _Block_object_dispose(&v14, 8);

  return v6;
}

void __43__FKFriendsManager_personWithABRecordGUID___block_invoke(uint64_t a1, uint64_t a2)
{
  FKPerson *v3;
  uint64_t v4;
  void *v5;

  v3 = -[FKPerson initWithABRecordGUID:addressBook:]([FKPerson alloc], "initWithABRecordGUID:addressBook:", *(_QWORD *)(a1 + 32), a2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)_storeSourcedPerson:(id)a3
{
  NSHashTable *sourcedPersons;
  id v5;

  sourcedPersons = self->_sourcedPersons;
  v5 = a3;
  -[NSHashTable addObject:](sourcedPersons, "addObject:", v5);
  -[FKFriendsManager _addPersonToIdentifiersToPersonMap:](self, "_addPersonToIdentifiersToPersonMap:", v5);

}

- (void)_addPersonToIdentifiersToPersonMap:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMapTable *identifiersToPersonMap;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "fkMessageCanonicalRawAddress");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable setObject:forKey:](self->_identifiersToPersonMap, "setObject:forKey:", v4, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "abRecordGUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    identifiersToPersonMap = self->_identifiersToPersonMap;
    objc_msgSend(v4, "abRecordGUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](identifiersToPersonMap, "setObject:forKey:", v4, v14);

  }
}

- (void)_removePersonFromIdentifiersToPersonMap:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMapTable *identifiersToPersonMap;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "fkMessageCanonicalRawAddress");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable removeObjectForKey:](self->_identifiersToPersonMap, "removeObjectForKey:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "abRecordGUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    identifiersToPersonMap = self->_identifiersToPersonMap;
    objc_msgSend(v4, "abRecordGUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable removeObjectForKey:](identifiersToPersonMap, "removeObjectForKey:", v14);

  }
}

- (void)_createAddressToPersonDictionary
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[NSMapTable removeAllObjects](self->_identifiersToPersonMap, "removeAllObjects");
  if (-[NSMutableArray count](self->_friendList, "count"))
  {
    v3 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_friendList, "objectAtIndexedSubscript:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4 == v5)
        v6 = 0;
      else
        v6 = v4;
      v7 = v6;

      if (v7)
        -[FKFriendsManager _addPersonToIdentifiersToPersonMap:](self, "_addPersonToIdentifiersToPersonMap:", v7);

      ++v3;
    }
    while (v3 < -[NSMutableArray count](self->_friendList, "count"));
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_sourcedPersons;
  v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[FKFriendsManager _addPersonToIdentifiersToPersonMap:](self, "_addPersonToIdentifiersToPersonMap:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)setServiceName:(id)a3
{
  id v5;
  NSString *v6;
  NSString **p_serviceName;
  NSString *serviceName;
  NSObject *v9;
  NSString *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  serviceName = self->_serviceName;
  p_serviceName = &self->_serviceName;
  v6 = serviceName;
  if (!v5 && v6 || !-[NSString isEqualToString:](v6, "isEqualToString:", v5))
  {
    objc_storeStrong((id *)p_serviceName, a3);
    _FKGetLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *p_serviceName;
      v11 = 136315650;
      v12 = "-[FKFriendsManager setServiceName:]";
      v13 = 1024;
      v14 = 975;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_211A80000, v9, OS_LOG_TYPE_DEFAULT, "%s (%d) \"setting service name for reachability queries to %@\", (uint8_t *)&v11, 0x1Cu);
    }

  }
}

- (id)_destinations
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
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

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_friendList, "count"))
  {
    v4 = 0;
    do
    {
      -[FKFriendsManager _friendAtPosition:](self, "_friendAtPosition:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        v17 = 0u;
        v18 = 0u;
        v15 = 0u;
        v16 = 0u;
        objc_msgSend(v5, "allValues", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
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
              objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "fkMessageIDSIdentifier");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (v12)
                objc_msgSend(v3, "addObject:", v12);

              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          }
          while (v9);
        }

      }
      ++v4;
    }
    while (v4 < -[NSMutableArray count](self->_friendList, "count"));
  }
  objc_msgSend(v3, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_setupQueryController
{
  id v3;
  IDSBatchIDQueryController *v4;
  IDSBatchIDQueryController *queryController;

  -[IDSBatchIDQueryController invalidate](self->_queryController, "invalidate");
  if (self->_serviceName)
  {
    v3 = objc_alloc(MEMORY[0x24BE4FBF0]);
    v4 = (IDSBatchIDQueryController *)objc_msgSend(v3, "initWithService:delegate:queue:", self->_serviceName, self, MEMORY[0x24BDAC9B8]);
  }
  else
  {
    v4 = 0;
  }
  queryController = self->_queryController;
  self->_queryController = v4;

}

- (void)refreshDestinationStatuses
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  void *pendingDestinations;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (-[NSMutableSet count](self->_highPriorityDestinations, "count"))
  {
    _FKGetLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[NSMutableSet allObjects](self->_highPriorityDestinations, "allObjects");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315650;
      v11 = "-[FKFriendsManager refreshDestinationStatuses]";
      v12 = 1024;
      v13 = 1030;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_211A80000, v3, OS_LOG_TYPE_DEFAULT, "%s (%d) \"not starting batch query because high priority query is in progress for [ %@ ]\", (uint8_t *)&v10, 0x1Cu);

    }
    -[FKFriendsManager _destinations](self, "_destinations");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    pendingDestinations = self->_pendingDestinations;
    self->_pendingDestinations = v6;
  }
  else
  {
    -[FKFriendsManager _destinations](self, "_destinations");
    pendingDestinations = (void *)objc_claimAutoreleasedReturnValue();
    _FKGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(pendingDestinations, "componentsJoinedByString:", CFSTR(", "));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315650;
      v11 = "-[FKFriendsManager refreshDestinationStatuses]";
      v12 = 1024;
      v13 = 1012;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_211A80000, v8, OS_LOG_TYPE_DEFAULT, "%s (%d) \"setting destinations to [ %@ ]\", (uint8_t *)&v10, 0x1Cu);

    }
    -[FKFriendsManager _initiateIDSDestinationStatusQuery:](self, "_initiateIDSDestinationStatusQuery:", pendingDestinations);
  }

}

- (int64_t)_compareStatus:(int64_t)a3 toStatus:(int64_t)a4
{
  int64_t result;
  int64_t v5;
  BOOL v6;

  result = 1;
  if (a3 != 1 && a4 != 1)
  {
    if (a3 || a4 != 2)
    {
      if (a4 <= a3)
        v5 = a3;
      else
        v5 = a4;
      if (a4)
        v6 = 0;
      else
        v6 = a3 == 2;
      if (v6)
        return 0;
      else
        return v5;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)idStatusUpdatedForDestinations:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSMutableSet *highPriorityDestinations;
  void *v16;
  NSMutableDictionary *cachedStatuses;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  id v25;
  void *v26;
  int v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  NSObject *v32;
  void *v33;
  NSArray *pendingDestinations;
  id v35;
  id v36;
  NSMutableArray *obj;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  id v48;
  _QWORD block[4];
  id v50;
  id v51;
  id location;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint8_t v58[128];
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  int v62;
  __int16 v63;
  id v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v36 = v4;
    -[FKFriendsManager _stopIDSQueryTimeoutTimer](self, "_stopIDSQueryTimeoutTimer");
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v6 = v36;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v54 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "fkMessageCanonicalRawAddress");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v11, v12);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
      }
      while (v7);
    }

    _FKGetLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v60 = "-[FKFriendsManager idStatusUpdatedForDestinations:]";
      v61 = 1024;
      v62 = 1061;
      v63 = 2112;
      v64 = v6;
      _os_log_impl(&dword_211A80000, v13, OS_LOG_TYPE_DEFAULT, "%s (%d) \"IDS statusues updated: %@\", buf, 0x1Cu);
    }

    -[NSMutableDictionary addEntriesFromDictionary:](self->_cachedStatuses, "addEntriesFromDictionary:", v5);
    objc_initWeak(&location, self);
    v14 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__FKFriendsManager_idStatusUpdatedForDestinations___block_invoke;
    block[3] = &unk_24CCDFBE0;
    objc_copyWeak(&v51, &location);
    v35 = v5;
    v50 = v35;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    highPriorityDestinations = self->_highPriorityDestinations;
    if (!highPriorityDestinations || !-[NSMutableSet count](highPriorityDestinations, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      cachedStatuses = self->_cachedStatuses;
      v47[0] = v14;
      v47[1] = 3221225472;
      v47[2] = __51__FKFriendsManager_idStatusUpdatedForDestinations___block_invoke_2;
      v47[3] = &unk_24CCDFC30;
      v18 = v16;
      v48 = v18;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cachedStatuses, "enumerateKeysAndObjectsUsingBlock:", v47);
      v38 = v18;
      if (objc_msgSend(v18, "count"))
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        obj = self->_friendList;
        v20 = 0;
        v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v58, 16);
        if (v21)
        {
          v22 = *(_QWORD *)v44;
          do
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v44 != v22)
                objc_enumerationMutation(obj);
              v24 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
              if (v24 != v19)
              {
                v25 = v24;
                objc_msgSend(v25, "allValues");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v26, "intersectsSet:", v38);

                v20 += v27 ^ 1u;
              }
            }
            v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v58, 16);
          }
          while (v21);
        }

      }
      else
      {
        v20 = 0;
      }
      -[FKFriendsManager _aggdSetValue:forScalarKey:](self, "_aggdSetValue:forScalarKey:", v20, CFSTR("com.apple.et.unreachableFriends.count"));

    }
    objc_msgSend(v6, "allKeys");
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v39, v57, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v40;
      do
      {
        for (k = 0; k != v29; ++k)
        {
          if (*(_QWORD *)v40 != v30)
            objc_enumerationMutation(v28);
          -[NSMutableSet removeObject:](self->_highPriorityDestinations, "removeObject:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * k));
        }
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v39, v57, 16);
      }
      while (v29);
    }

    if (!-[NSMutableSet count](self->_highPriorityDestinations, "count")
      && -[NSArray count](self->_pendingDestinations, "count"))
    {
      _FKGetLogSystem();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        -[NSArray componentsJoinedByString:](self->_pendingDestinations, "componentsJoinedByString:", CFSTR(", "));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v60 = "-[FKFriendsManager idStatusUpdatedForDestinations:]";
        v61 = 1024;
        v62 = 1107;
        v63 = 2112;
        v64 = v33;
        _os_log_impl(&dword_211A80000, v32, OS_LOG_TYPE_DEFAULT, "%s (%d) \"High priority status request completed, starting query for pending destinations: [ %@ ]\", buf, 0x1Cu);

      }
      -[FKFriendsManager _initiateIDSDestinationStatusQuery:](self, "_initiateIDSDestinationStatusQuery:", self->_pendingDestinations);
      pendingDestinations = self->_pendingDestinations;
      self->_pendingDestinations = 0;

    }
    objc_destroyWeak(&v51);
    objc_destroyWeak(&location);

    v4 = v36;
  }

}

void __51__FKFriendsManager_idStatusUpdatedForDestinations___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v6 = CFSTR("FKFriendsManagerDestinationStatusUpdatedDestinationsKey");
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("FKFriendsManagerDestinationStatusUpdatedNotification"), WeakRetained, v5);

}

void __51__FKFriendsManager_idStatusUpdatedForDestinations___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "integerValue") == 1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (int64_t)statusForPerson:(id)a3 requery:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  unint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  const __CFString *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  __int16 v30;
  const __CFString *v31;
  _BYTE v32[128];
  uint64_t v33;

  v4 = a4;
  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[FKFriendsManager _shouldBypassDestinationStatusCheck](self, "_shouldBypassDestinationStatusCheck"))
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v6, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v21;
        v7 = -1;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v21 != v12)
              objc_enumerationMutation(v9);
            -[NSMutableDictionary objectForKey:](self->_cachedStatuses, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), (_QWORD)v20);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v14;
            if (v14)
              v16 = objc_msgSend(v14, "integerValue");
            else
              v16 = -1;
            v7 = -[FKFriendsManager _compareStatus:toStatus:](self, "_compareStatus:toStatus:", v7, v16);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
        }
        while (v11);
      }
      else
      {
        v7 = -1;
      }

      if (v4)
      {
        -[FKFriendsManager _queryDestinations:](self, "_queryDestinations:", v9);
        if (v7 == -1)
          v7 = 0;
      }
      _FKGetLogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        if (v7 > 2)
          v18 = CFSTR("unspecified");
        else
          v18 = off_24CCDFF08[v7];
        *(_DWORD *)buf = 136315906;
        v25 = "-[FKFriendsManager statusForPerson:requery:]";
        v26 = 1024;
        v27 = 1142;
        v28 = 2112;
        v29 = v6;
        v30 = 2112;
        v31 = v18;
        _os_log_impl(&dword_211A80000, v17, OS_LOG_TYPE_DEFAULT, "%s (%d) \"%@ has cached best status of: %@\", buf, 0x26u);
      }

    }
    else
    {
      v7 = 2;
    }

  }
  return v7;
}

- (id)reachableDestinationsForPerson:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSMutableDictionary *cachedStatuses;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v4 = (void *)MEMORY[0x24BDBCEF0];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  cachedStatuses = self->_cachedStatuses;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __51__FKFriendsManager_reachableDestinationsForPerson___block_invoke;
  v13[3] = &unk_24CCDFC30;
  v14 = v6;
  v8 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cachedStatuses, "enumerateKeysAndObjectsUsingBlock:", v13);
  v9 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v5, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setWithSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "intersectSet:", v8);
  return v11;
}

void __51__FKFriendsManager_reachableDestinationsForPerson___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "integerValue") == 1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (void)_queryDestinations:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSMutableSet *highPriorityDestinations;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_highPriorityDestinations)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    highPriorityDestinations = self->_highPriorityDestinations;
    self->_highPriorityDestinations = v5;

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v4;
  v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  v9 = v7;
  if (!v8)
    goto LABEL_16;
  v10 = v8;
  v11 = 0;
  v12 = *(_QWORD *)v19;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v19 != v12)
        objc_enumerationMutation(v7);
      objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "fkMessageIDSIdentifier", (_QWORD)v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 && (-[NSMutableSet containsObject:](self->_highPriorityDestinations, "containsObject:", v14) & 1) == 0)
      {
        -[NSMutableSet addObject:](self->_highPriorityDestinations, "addObject:", v14);
        v11 = 1;
      }

    }
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  }
  while (v10);

  if ((v11 & 1) != 0)
  {
    -[NSMutableSet allObjects](self->_highPriorityDestinations, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FKFriendsManager _initiateIDSDestinationStatusQuery:](self, "_initiateIDSDestinationStatusQuery:", v15);

    _FKGetLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[NSMutableSet allObjects](self->_highPriorityDestinations, "allObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR(", "));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v23 = "-[FKFriendsManager _queryDestinations:]";
      v24 = 1024;
      v25 = 1182;
      v26 = 2112;
      v27 = v17;
      _os_log_impl(&dword_211A80000, v9, OS_LOG_TYPE_DEFAULT, "%s (%d) \"started high-priority query for [ %@ ]\", buf, 0x1Cu);

    }
LABEL_16:

  }
}

- (void)_initiateIDSDestinationStatusQuery:(id)a3
{
  id v4;

  v4 = a3;
  -[FKFriendsManager _setupQueryController](self, "_setupQueryController");
  -[IDSBatchIDQueryController setDestinations:](self->_queryController, "setDestinations:", v4);

  -[FKFriendsManager _startIDSQueryTimeoutTimer](self, "_startIDSQueryTimeoutTimer");
}

- (void)_startIDSQueryTimeoutTimer
{
  NSTimer *v3;
  NSTimer *idsQueryTimeoutTimer;

  if (!self->_idsQueryTimeoutTimer)
  {
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__idsQueryTimeoutTimerFired, 0, 0, 30.0);
    v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    idsQueryTimeoutTimer = self->_idsQueryTimeoutTimer;
    self->_idsQueryTimeoutTimer = v3;

  }
}

- (void)_stopIDSQueryTimeoutTimer
{
  NSTimer *idsQueryTimeoutTimer;

  -[NSTimer invalidate](self->_idsQueryTimeoutTimer, "invalidate");
  idsQueryTimeoutTimer = self->_idsQueryTimeoutTimer;
  self->_idsQueryTimeoutTimer = 0;

}

- (void)_idsQueryTimeoutTimerFired
{
  NSTimer *idsQueryTimeoutTimer;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSArray *pendingDestinations;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  idsQueryTimeoutTimer = self->_idsQueryTimeoutTimer;
  self->_idsQueryTimeoutTimer = 0;

  _FKGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[FKFriendsManager _idsQueryTimeoutTimerFired]";
    v10 = 1024;
    v11 = 1223;
    _os_log_impl(&dword_211A80000, v4, OS_LOG_TYPE_DEFAULT, "%s (%d) \"IDS Query took too long to respond, clearing request queues\", (uint8_t *)&v8, 0x12u);
  }

  if (-[NSMutableSet count](self->_highPriorityDestinations, "count"))
  {
    -[NSMutableSet removeAllObjects](self->_highPriorityDestinations, "removeAllObjects");
    if (-[NSArray count](self->_pendingDestinations, "count"))
    {
      _FKGetLogSystem();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        -[NSArray componentsJoinedByString:](self->_pendingDestinations, "componentsJoinedByString:", CFSTR(", "));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 136315650;
        v9 = "-[FKFriendsManager _idsQueryTimeoutTimerFired]";
        v10 = 1024;
        v11 = 1233;
        v12 = 2112;
        v13 = v6;
        _os_log_impl(&dword_211A80000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"IDS Query timed out on high priority queue, starting query for pending destinations: [ %@ ]\", (uint8_t *)&v8, 0x1Cu);

      }
      -[FKFriendsManager _initiateIDSDestinationStatusQuery:](self, "_initiateIDSDestinationStatusQuery:", self->_pendingDestinations);
      pendingDestinations = self->_pendingDestinations;
      self->_pendingDestinations = 0;

    }
  }
}

- (BOOL)_shouldBypassDestinationStatusCheck
{
  _QWORD block[5];

  if (!self->_serviceName)
    return 1;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__FKFriendsManager__shouldBypassDestinationStatusCheck__block_invoke;
  block[3] = &unk_24CCDFA48;
  block[4] = self;
  if (_shouldBypassDestinationStatusCheck_once != -1)
    dispatch_once(&_shouldBypassDestinationStatusCheck_once, block);
  return _shouldBypassDestinationStatusCheck___shouldBypassDestinationStatusCheck != 0;
}

void __55__FKFriendsManager__shouldBypassDestinationStatusCheck__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistentDomainForName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ETSkipHasGizmoCheck"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _shouldBypassDestinationStatusCheck___shouldBypassDestinationStatusCheck = objc_msgSend(v3, "BOOLValue");

}

- (unint64_t)_indexForPosition:(unint64_t)a3 inGroup:(id)a4
{
  return a3 + self->_maxFriendsPerGroup * -[NSMutableArray indexOfObject:](self->_friendGroups, "indexOfObject:", a4);
}

- (int64_t)_firstEmptyPosition
{
  int64_t v3;
  void *v4;
  void *v5;

  if (!-[NSMutableArray count](self->_friendList, "count"))
    return 0x7FFFFFFFFFFFFFFFLL;
  v3 = 0;
  while (1)
  {
    -[NSMutableArray objectAtIndex:](self->_friendList, "objectAtIndex:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 == v5)
      break;
    if (++v3 >= (unint64_t)-[NSMutableArray count](self->_friendList, "count"))
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v3;
}

- (unint64_t)_numberOfFriendsInList:(id)a3
{
  id v3;
  void *v4;
  id v5;
  unint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__FKFriendsManager__numberOfFriendsInList___block_invoke;
  v8[3] = &unk_24CCDFC58;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __43__FKFriendsManager__numberOfFriendsInList___block_invoke(uint64_t result, uint64_t a2)
{
  if (*(_QWORD *)(result + 32) != a2)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
  return result;
}

- (void)_postChangeNotificationIfNecessary
{
  BOOL didCompleteInitialLoading;
  _QWORD block[4];
  id v5;
  BOOL v6;
  id location;

  objc_initWeak(&location, self);
  didCompleteInitialLoading = self->_didCompleteInitialLoading;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__FKFriendsManager__postChangeNotificationIfNecessary__block_invoke;
  block[3] = &unk_24CCDFC80;
  objc_copyWeak(&v5, &location);
  v6 = didCompleteInitialLoading;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __54__FKFriendsManager__postChangeNotificationIfNecessary__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  id v11;
  _BYTE v12[34];
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = (void *)objc_msgSend(WeakRetained, "_copyAndResetChangeLog");

  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      v6 = v5;
      _FKGetLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = CFSTR("entries");
        *(_DWORD *)v12 = 136316162;
        *(_QWORD *)&v12[4] = "-[FKFriendsManager _postChangeNotificationIfNecessary]_block_invoke";
        *(_WORD *)&v12[12] = 1024;
        *(_DWORD *)&v12[14] = 1299;
        *(_QWORD *)&v12[20] = CFSTR("FKFriendsManagerChangedNotification");
        *(_WORD *)&v12[18] = 2112;
        if (v6 == 1)
          v8 = CFSTR("entry");
        *(_WORD *)&v12[28] = 1024;
        *(_DWORD *)&v12[30] = v6;
        v13 = 2112;
        v14 = v8;
        _os_log_impl(&dword_211A80000, v7, OS_LOG_TYPE_DEFAULT, "%s (%d) \"posting %@ with %u changelog %@\", v12, 0x2Cu);
      }

    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", *(_OWORD *)v12, *(_OWORD *)&v12[16]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_loadWeakRetained(v2);
    objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("FKFriendsManagerChangedNotification"), v10, v4);

    v11 = objc_loadWeakRetained(v2);
    objc_msgSend(v11, "_aggdLogFriendCount");

  }
}

- (void)_personValuesChanged:(id)a3
{
  id v4;

  objc_msgSend(a3, "object");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FKFriendsManager _addEntryToChangeLogForPerson:changeType:](self, "_addEntryToChangeLogForPerson:changeType:", v4, CFSTR("FKFriendsManagerPersonUpdated"));
  -[FKFriendsManager _postChangeNotificationIfNecessary](self, "_postChangeNotificationIfNecessary");
  if (-[NSMutableArray containsObject:](self->_friendList, "containsObject:", v4))
    -[FKFriendsManager save](self, "save");

}

- (void)_friendsChangedExternally
{
  unint64_t postCount;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  postCount = self->_postCount;
  if (postCount)
  {
    self->_postCount = postCount - 1;
  }
  else
  {
    _FKGetLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315394;
      v6 = "-[FKFriendsManager _friendsChangedExternally]";
      v7 = 1024;
      v8 = 1319;
      _os_log_impl(&dword_211A80000, v4, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Handling external friends-changed event.\", (uint8_t *)&v5, 0x12u);
    }

    -[FKFriendsManager _loadFriendList](self, "_loadFriendList");
  }
}

- (void)_loadGroupTitles
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;

  CFPreferencesAppSynchronize((CFStringRef)self->_domain);
  v9 = (id)CFPreferencesCopyAppValue(CFSTR("ETFriendGroupTitles"), (CFStringRef)self->_domain);
  v3 = -[NSMutableArray count](self->_friendGroups, "count");
  v4 = objc_msgSend(v9, "count");
  if (v3 >= v4)
    v5 = v4;
  else
    v5 = v3;
  if (v5)
  {
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_friendGroups, "objectAtIndexedSubscript:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:", v7);

    }
  }

}

- (void)_groupTitleChangedExternally
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _FKGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[FKFriendsManager _groupTitleChangedExternally]";
    v6 = 1024;
    v7 = 1338;
    _os_log_impl(&dword_211A80000, v3, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Handling external group-title-changed event.\", (uint8_t *)&v4, 0x12u);
  }

  -[FKFriendsManager _loadGroupTitles](self, "_loadGroupTitles");
}

- (void)_addressBookChanged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _FKGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v9 = "-[FKFriendsManager _addressBookChanged:]";
    v10 = 1024;
    v11 = 1343;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_211A80000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"received %@\", buf, 0x1Cu);

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__FKFriendsManager__addressBookChanged___block_invoke;
  block[3] = &unk_24CCDFA48;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __40__FKFriendsManager__addressBookChanged___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "isValid") & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 137) = 1;
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), sel_refreshAgainstAddressBook, 0, 0, 0.2);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 88);
    *(_QWORD *)(v3 + 88) = v2;

  }
}

- (void)_updateFriends:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, ABAddressBookRef);
  void *v9;
  id v10;
  FKFriendsManager *v11;

  v4 = a3;
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __35__FKFriendsManager__updateFriends___block_invoke;
  v9 = &unk_24CCDFCF8;
  v10 = v4;
  v11 = self;
  v5 = v4;
  +[FKAddressBook performBlock:](FKAddressBook, "performBlock:", &v6);
  self->_needsAddressBookRefresh = -[FKFriendsManager _changeLogContainsFriendAdditionsOrUpdates](self, "_changeLogContainsFriendAdditionsOrUpdates", v6, v7, v8, v9);

}

void __35__FKFriendsManager__updateFriends___block_invoke(uint64_t a1, ABAddressBookRef a2)
{
  void *v4;
  ABAddressBookRef v5;
  ABAddressBookRef v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  CFTypeRef cf;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[5];
  id v33;
  ABAddressBookRef v34;
  _BYTE error[12];
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)ABAddressBookCopyUniqueIdentifier();

  if (v4)
  {
    cf = 0;
  }
  else
  {
    *(_QWORD *)error = 0;
    v5 = ABAddressBookCreateWithOptions(0, (CFErrorRef *)error);
    v6 = v5;
    if (*(_QWORD *)error)
    {
      if (v5)
        CFRelease(v5);
      v5 = a2;
    }
    cf = v6;
    a2 = v5;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __35__FKFriendsManager__updateFriends___block_invoke_2;
  v32[3] = &unk_24CCDFCA8;
  v9 = *(void **)(a1 + 32);
  v32[4] = *(_QWORD *)(a1 + 40);
  v34 = a2;
  v10 = v7;
  v33 = v10;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v32);
  v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "count");
  v12 = (unint64_t)((double)*(unint64_t *)(*(_QWORD *)(a1 + 40) + 24)
                         * ceilf((float)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "count")/ (float)*(unint64_t *)(*(_QWORD *)(a1 + 40) + 24)));
  if (v11 > v12)
  {
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", v12, v11 - v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(*(_QWORD *)(a1 + 40) + 64);
    v30[0] = v8;
    v30[1] = 3221225472;
    v30[2] = __35__FKFriendsManager__updateFriends___block_invoke_3;
    v30[3] = &unk_24CCDFCD0;
    v31 = v10;
    objc_msgSend(v14, "enumerateObjectsAtIndexes:options:usingBlock:", v13, 1, v30);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "removeObjectsAtIndexes:", v13);

  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v10;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        _FKGetLogSystem();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v19, "displayName");
          v21 = a1;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "abRecordGUID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)error = 136315906;
          *(_QWORD *)&error[4] = "-[FKFriendsManager _updateFriends:]_block_invoke";
          v36 = 1024;
          v37 = 1489;
          v38 = 2112;
          v39 = v22;
          v40 = 2112;
          v41 = v23;
          _os_log_impl(&dword_211A80000, v20, OS_LOG_TYPE_DEFAULT, "%s (%d) \"[%@] [ABGUID=%@] was displaced and removed\", error, 0x26u);

          a1 = v21;
        }

        objc_msgSend(*(id *)(a1 + 40), "_addEntryToChangeLogForPerson:changeType:", v19, CFSTR("FKFriendsManagerPersonDeleted"));
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
    }
    while (v16);
  }

  if (cf)
    CFRelease(cf);
  objc_msgSend(*(id *)(a1 + 40), "save");

}

void __35__FKFriendsManager__updateFriends___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  FKPerson *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  FKPerson *v18;
  unint64_t i;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  FKPerson *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *j;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count") <= a3)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("AllValues"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "count"))
      goto LABEL_55;
    v18 = -[FKPerson initWithDictionaryRepresentation:addressBook:]([FKPerson alloc], "initWithDictionaryRepresentation:addressBook:", v5, *(_QWORD *)(a1 + 48));
    while (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count") <= a3)
      objc_msgSend(*(id *)(a1 + 32), "_addEmptyGroup");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:atIndexedSubscript:", v18, a3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "removeObject:", v18);
    objc_msgSend(*(id *)(a1 + 32), "_addEntryToChangeLogForPerson:changeType:", v18, CFSTR("FKFriendsManagerPersonAdded"));
LABEL_30:

    goto LABEL_55;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
  {
    if (v6 != v7)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v18 = (FKPerson *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:atIndexedSubscript:", v18, a3);
    goto LABEL_30;
  }
  if (v6 == v7 || (objc_msgSend(v6, "isEqualToDictionaryRepresentation:", v5) & 1) == 0)
  {
    v32 = v7;
    for (i = a3 + 1; i < objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count"); ++i)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectAtIndexedSubscript:", i);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectAtIndexedSubscript:", i);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToDictionaryRepresentation:", v5);

        if ((v24 & 1) != 0)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectAtIndexedSubscript:", i);
          v10 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "_addEntryToChangeLogForPerson:changeType:", v10, CFSTR("FKFriendsManagerPersonMoved"));
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:atIndexedSubscript:", v27, i);

          if (v10)
            goto LABEL_47;
          break;
        }
      }
    }
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v28 = *(id *)(a1 + 40);
    v10 = (id)objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v10)
    {
      v29 = *(_QWORD *)v38;
      while (2)
      {
        for (j = 0; j != v10; j = (char *)j + 1)
        {
          if (*(_QWORD *)v38 != v29)
            objc_enumerationMutation(v28);
          v31 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j);
          if (objc_msgSend(v31, "isEqualToDictionaryRepresentation:", v5))
          {
            v10 = v31;
            objc_msgSend(*(id *)(a1 + 40), "removeObject:", v10);
            objc_msgSend(*(id *)(a1 + 32), "_addEntryToChangeLogForPerson:changeType:", v10, CFSTR("FKFriendsManagerPersonMoved"));
            goto LABEL_46;
          }
        }
        v10 = (id)objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_46:

LABEL_47:
    if (v6 != v32)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
    if (v10)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:atIndexedSubscript:", v10, a3);

    if (!v10)
      goto LABEL_6;
LABEL_52:
    if (objc_msgSend(v10, "updateFromDictionaryRepresentation:", v5))
      objc_msgSend(*(id *)(a1 + 32), "_addEntryToChangeLogForPerson:changeType:", v10, CFSTR("FKFriendsManagerPersonUpdated"));
    v6 = v10;
    goto LABEL_55;
  }
  v10 = v6;
  if (v6)
    goto LABEL_52;
LABEL_6:
  v11 = -[FKPerson initWithDictionaryRepresentation:addressBook:]([FKPerson alloc], "initWithDictionaryRepresentation:addressBook:", v5, *(_QWORD *)(a1 + 48));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v12 = *(id *)(*(_QWORD *)(a1 + 32) + 120);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v34;
LABEL_8:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v15)
        objc_enumerationMutation(v12);
      v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v16);
      if (-[FKPerson isLikePerson:](v11, "isLikePerson:", v17))
        break;
      if (v14 == ++v16)
      {
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v14)
          goto LABEL_8;
        goto LABEL_14;
      }
    }
    v25 = v17;

    if (!v25)
      goto LABEL_33;
    v26 = (FKPerson *)v25;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "removeObject:", v26);
    v11 = v26;
  }
  else
  {
LABEL_14:

LABEL_33:
    v26 = 0;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:atIndexedSubscript:", v11, a3);
  objc_msgSend(*(id *)(a1 + 32), "_addEntryToChangeLogForPerson:changeType:", v11, CFSTR("FKFriendsManagerPersonAdded"));

  v6 = 0;
LABEL_55:

}

void __35__FKFriendsManager__updateFriends___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v3 != v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v4 = v5;
  }

}

- (void)_cleanUpFriendListIfNecessary
{
  -[FKFriendsManager _deduplicateFriendListIfNecessary](self, "_deduplicateFriendListIfNecessary");
  -[FKFriendsManager _removeDestinationlessFriendsIfNecessary](self, "_removeDestinationlessFriendsIfNecessary");
  -[FKFriendsManager save](self, "save");
}

- (void)_deduplicateFriendListIfNecessary
{
  void *v3;
  void *v4;
  NSMutableArray *friendList;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  if (self->_shouldDeduplicateFriendList)
  {
    objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    friendList = self->_friendList;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __53__FKFriendsManager__deduplicateFriendListIfNecessary__block_invoke;
    v8[3] = &unk_24CCDFD20;
    v9 = v4;
    v10 = v3;
    v6 = v3;
    v7 = v4;
    -[NSMutableArray enumerateObjectsUsingBlock:](friendList, "enumerateObjectsUsingBlock:", v8);
    -[FKFriendsManager _removeFriendsAtIndices:](self, "_removeFriendsAtIndices:", v6);

  }
}

void __53__FKFriendsManager__deduplicateFriendListIfNecessary__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  char v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    objc_msgSend(v6, "abRecordGUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7);
    if (v7 && v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
      _FKGetLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "displayName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(a1 + 32);
        v13 = 136316418;
        v14 = "-[FKFriendsManager _deduplicateFriendListIfNecessary]_block_invoke";
        v15 = 1024;
        v16 = 1529;
        v17 = 2112;
        v18 = v10;
        v19 = 2112;
        v20 = v7;
        v21 = 2048;
        v22 = a3;
        v23 = 2112;
        v24 = v11;
        _os_log_impl(&dword_211A80000, v9, OS_LOG_TYPE_DEFAULT, "%s (%d) \"deduplicating friend [%@] [ABGUID=%@] at index %lu as it is already present in the set of friend ABGUIDs analyzed so far: %@\", (uint8_t *)&v13, 0x3Au);

      }
    }
    else
    {
      if (v7)
        v12 = v8;
      else
        v12 = 1;
      if ((v12 & 1) == 0)
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    }

  }
}

- (void)_removeDestinationlessFriendsIfNecessary
{
  void *v3;
  NSMutableArray *friendList;
  id v5;
  _QWORD v6[4];
  id v7;

  if (self->_shouldRemoveDestinationlessFriends)
  {
    objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    friendList = self->_friendList;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __60__FKFriendsManager__removeDestinationlessFriendsIfNecessary__block_invoke;
    v6[3] = &unk_24CCDFCD0;
    v7 = v3;
    v5 = v3;
    -[NSMutableArray enumerateObjectsUsingBlock:](friendList, "enumerateObjectsUsingBlock:", v6);
    -[FKFriendsManager _removeFriendsAtIndices:](self, "_removeFriendsAtIndices:", v5);

  }
}

void __60__FKFriendsManager__removeDestinationlessFriendsIfNecessary__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    if (!objc_msgSend(v6, "allValuesCount"))
    {
      objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
      _FKGetLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "displayName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "abRecordGUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 136315906;
        v11 = "-[FKFriendsManager _removeDestinationlessFriendsIfNecessary]_block_invoke";
        v12 = 1024;
        v13 = 1555;
        v14 = 2112;
        v15 = v8;
        v16 = 2112;
        v17 = v9;
        _os_log_impl(&dword_211A80000, v7, OS_LOG_TYPE_DEFAULT, "%s (%d) \"culling friend [%@] [ABGUID=%@] since its destination set has become empty\", (uint8_t *)&v10, 0x26u);

      }
    }

  }
}

- (void)_removeFriendsAtIndices:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __44__FKFriendsManager__removeFriendsAtIndices___block_invoke;
    v5[3] = &unk_24CCDFD48;
    v5[4] = self;
    objc_msgSend(v4, "enumerateIndexesUsingBlock:", v5);
    self->_needsFriendListSync = 1;
  }

}

void __44__FKFriendsManager__removeFriendsAtIndices___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectAtIndex:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_addEntryToChangeLogForPerson:changeType:", v7, CFSTR("FKFriendsManagerPersonDeleted"));
  v3 = objc_msgSend(*(id *)(a1 + 32), "groupIndexContainingFriend:", v7);
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "friendGroups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "removeFriendAtPosition:", objc_msgSend(*(id *)(a1 + 32), "positionOfFriendInGroup:", v7));
  }

}

- (unint64_t)_changeLogCount
{
  NSObject *changeLogQueue;
  unint64_t v4;
  _QWORD block[5];
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  id location;

  objc_initWeak(&location, self);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  changeLogQueue = self->_changeLogQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__FKFriendsManager__changeLogCount__block_invoke;
  block[3] = &unk_24CCDFD70;
  block[4] = &v8;
  objc_copyWeak(&v7, &location);
  dispatch_sync(changeLogQueue, block);
  v4 = v9[3];
  objc_destroyWeak(&v7);
  _Block_object_dispose(&v8, 8);
  objc_destroyWeak(&location);
  return v4;
}

void __35__FKFriendsManager__changeLogCount__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "changeLog");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "count");

}

void __42__FKFriendsManager__copyAndResetChangeLog__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "changeLog");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCE70];
    v7 = objc_loadWeakRetained(v2);
    objc_msgSend(v7, "changeLog");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithDictionary:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 104);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__FKFriendsManager__copyAndResetChangeLog__block_invoke_2;
    block[3] = &unk_24CCDFBB8;
    objc_copyWeak(&v14, v2);
    dispatch_barrier_async(v12, block);
    objc_destroyWeak(&v14);
  }
}

void __42__FKFriendsManager__copyAndResetChangeLog__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setChangeLog:", 0);

}

- (void)_addEntryToChangeLogForPerson:(id)a3 changeType:(id)a4
{
  id v6;
  id v7;
  NSObject *changeLogQueue;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_initWeak(&location, self);
    changeLogQueue = self->_changeLogQueue;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __61__FKFriendsManager__addEntryToChangeLogForPerson_changeType___block_invoke;
    v9[3] = &unk_24CCDFDC0;
    objc_copyWeak(&v12, &location);
    v10 = v6;
    v11 = v7;
    dispatch_barrier_async(changeLogQueue, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __61__FKFriendsManager__addEntryToChangeLogForPerson_changeType___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "changeLog");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "setChangeLog:", v5);

  }
  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "changeLog");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *(_QWORD *)(a1 + 32));
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v9 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = v9;
  objc_msgSend(v9, "addObject:", *(_QWORD *)(a1 + 40));
  v10 = objc_loadWeakRetained(v2);
  objc_msgSend(v10, "changeLog");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v13, *(_QWORD *)(a1 + 32));

}

- (BOOL)_changeLogContainsFriendAdditionsOrUpdates
{
  NSObject *changeLogQueue;
  _QWORD block[5];
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  id location;

  objc_initWeak(&location, self);
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  changeLogQueue = self->_changeLogQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__FKFriendsManager__changeLogContainsFriendAdditionsOrUpdates__block_invoke;
  block[3] = &unk_24CCDFE10;
  objc_copyWeak(&v6, &location);
  block[4] = &v7;
  dispatch_sync(changeLogQueue, block);
  LOBYTE(changeLogQueue) = *((_BYTE *)v8 + 24);
  objc_destroyWeak(&v6);
  _Block_object_dispose(&v7, 8);
  objc_destroyWeak(&location);
  return (char)changeLogQueue;
}

void __62__FKFriendsManager__changeLogContainsFriendAdditionsOrUpdates__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "changeLog");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __62__FKFriendsManager__changeLogContainsFriendAdditionsOrUpdates__block_invoke_2;
  v4[3] = &unk_24CCDFDE8;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);

}

void __62__FKFriendsManager__changeLogContainsFriendAdditionsOrUpdates__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "containsObject:", CFSTR("FKFriendsManagerPersonAdded")) & 1) != 0
    || objc_msgSend(v6, "containsObject:", CFSTR("FKFriendsManagerPersonUpdated")))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }

}

+ (id)collapseChangeLogsIntoChangeLog:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = MEMORY[0x24BDAC760];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v13[0] = v9;
        v13[1] = 3221225472;
        v13[2] = __52__FKFriendsManager_collapseChangeLogsIntoChangeLog___block_invoke;
        v13[3] = &unk_24CCDFE38;
        v14 = v4;
        objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v13);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

void __52__FKFriendsManager_collapseChangeLogsIntoChangeLog___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6
    || (objc_msgSend(v6, "containsObject:", CFSTR("FKFriendsManagerPersonDeleted")) & 1) == 0
    && (objc_msgSend(v5, "containsObject:", CFSTR("FKFriendsManagerPersonDeleted")) & 1) != 0
    || objc_msgSend(v7, "containsObject:", CFSTR("FKFriendsManagerPersonDeleted"))
    && objc_msgSend(v5, "containsObject:", CFSTR("FKFriendsManagerPersonAdded")))
  {
    v8 = v5;
  }
  else
  {
    objc_msgSend(v7, "setByAddingObjectsFromSet:", v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v8, v10);

}

- (int)_lastKnownAddressBookSequenceNumber
{
  void *v3;
  int v4;

  CFPreferencesAppSynchronize((CFStringRef)self->_domain);
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("ABSequenceNumber"), (CFStringRef)self->_domain);
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (void)_updateLastKnownAddressBookSequenceNumber:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (-[FKFriendsManager _lastKnownAddressBookSequenceNumber](self, "_lastKnownAddressBookSequenceNumber") != a3)
  {
    CFPreferencesSetAppValue(CFSTR("ABSequenceNumber"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3), (CFStringRef)self->_domain);
    CFPreferencesAppSynchronize((CFStringRef)self->_domain);
  }
}

- (BOOL)_addressBookSequenceNumberDidChange
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__FKFriendsManager__addressBookSequenceNumberDidChange__block_invoke;
  v4[3] = &unk_24CCDFC08;
  v4[4] = self;
  v4[5] = &v5;
  +[FKAddressBook performBlock:](FKAddressBook, "performBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __55__FKFriendsManager__addressBookSequenceNumberDidChange__block_invoke(uint64_t a1)
{
  int v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_lastKnownAddressBookSequenceNumber");
  result = ABAddressBookGetSequenceNumber();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 != (_DWORD)result;
  return result;
}

- (void)setRefreshAgainstContactsEnabled:(BOOL)a3
{
  if (self->_refreshAgainstContactsEnabled != a3)
  {
    self->_refreshAgainstContactsEnabled = a3;
    if (a3)
      -[FKFriendsManager refreshAgainstAddressBook](self, "refreshAgainstAddressBook");
  }
}

- (BOOL)refreshAgainstAddressBook
{
  _BOOL4 v3;
  _BOOL4 v4;
  NSObject *v5;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = self->_needsAddressBookRefresh
    || -[FKFriendsManager _addressBookSequenceNumberDidChange](self, "_addressBookSequenceNumberDidChange");
  v4 = self->_refreshAgainstContactsEnabled && v3;
  if (v4)
  {
    _FKGetLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[FKFriendsManager refreshAgainstAddressBook]";
      v10 = 1024;
      v11 = 1709;
      _os_log_impl(&dword_211A80000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"refreshing friends against address book\", buf, 0x12u);
    }

    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __45__FKFriendsManager_refreshAgainstAddressBook__block_invoke;
    v7[3] = &unk_24CCDFE80;
    v7[4] = self;
    +[FKAddressBook performBlock:](FKAddressBook, "performBlock:", v7);
    -[FKFriendsManager _cleanUpFriendListIfNecessary](self, "_cleanUpFriendListIfNecessary");
    -[FKFriendsManager _postChangeNotificationIfNecessary](self, "_postChangeNotificationIfNecessary");
    self->_needsAddressBookRefresh = 0;
  }
  return v4;
}

uint64_t __45__FKFriendsManager_refreshAgainstAddressBook__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v5[5];

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__FKFriendsManager_refreshAgainstAddressBook__block_invoke_2;
  v5[3] = &__block_descriptor_40_e25_v32__0__FKPerson_8Q16_B24l;
  v5[4] = a2;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);
  return objc_msgSend(*(id *)(a1 + 32), "_updateLastKnownAddressBookSequenceNumber:", ABAddressBookGetSequenceNumber());
}

void __45__FKFriendsManager_refreshAgainstAddressBook__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "refreshWithAddressBook:", *(_QWORD *)(a1 + 32));

}

- (void)saveFriendGroupTitles
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  NSObject *saveQueue;
  id v13;
  _QWORD v14[4];
  id v15;
  FKFriendsManager *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = self->_friendGroups;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "title");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v9)
          v11 = (const __CFString *)v9;
        else
          v11 = &stru_24CCE02E8;
        objc_msgSend(v3, "addObject:", v11);

      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  saveQueue = self->_saveQueue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __41__FKFriendsManager_saveFriendGroupTitles__block_invoke;
  v14[3] = &unk_24CCDFEA8;
  v15 = v3;
  v16 = self;
  v13 = v3;
  dispatch_async(saveQueue, v14);

}

void __41__FKFriendsManager_saveFriendGroupTitles__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  CFPreferencesSetAppValue(CFSTR("ETFriendGroupTitles"), *(CFPropertyListRef *)(a1 + 32), *(CFStringRef *)(*(_QWORD *)(a1 + 40) + 8));
  CFPreferencesAppSynchronize(*(CFStringRef *)(*(_QWORD *)(a1 + 40) + 8));
  if (NPSHasCompletedInitialSync())
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *(void **)(v2 + 80);
    v4 = *(_QWORD *)(v2 + 8);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("ETFriendGroupTitles"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "synchronizeUserDefaultsDomain:keys:", v4, v5);

  }
}

- (void)markFriendListAsNormalized
{
  NSObject *saveQueue;
  _QWORD block[5];

  saveQueue = self->_saveQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__FKFriendsManager_markFriendListAsNormalized__block_invoke;
  block[3] = &unk_24CCDFA48;
  block[4] = self;
  dispatch_async(saveQueue, block);
}

void __46__FKFriendsManager_markFriendListAsNormalized__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  CFPreferencesSetAppValue(CFSTR("DidNormalizeFriendListDestinations"), (CFPropertyListRef)*MEMORY[0x24BDBD270], *(CFStringRef *)(*(_QWORD *)(a1 + 32) + 8));
  CFPreferencesAppSynchronize(*(CFStringRef *)(*(_QWORD *)(a1 + 32) + 8));
  if (NPSHasCompletedInitialSync())
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 80);
    v4 = *(_QWORD *)(v2 + 8);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("DidNormalizeFriendListDestinations"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "synchronizeUserDefaultsDomain:keys:", v4, v5);

  }
}

- (BOOL)isRefreshAgainstContactsEnabled
{
  return self->_refreshAgainstContactsEnabled;
}

- (BOOL)didLastLoadHaveChanges
{
  return self->_lastLoadHadChanges;
}

- (void)setLastLoadHadChanges:(BOOL)a3
{
  self->_lastLoadHadChanges = a3;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (FKDelayedOperation)saveOperation
{
  return self->_saveOperation;
}

- (void)setSaveOperation:(id)a3
{
  objc_storeStrong((id *)&self->_saveOperation, a3);
}

- (NSMutableDictionary)changeLog
{
  return self->_changeLog;
}

- (void)setChangeLog:(id)a3
{
  objc_storeStrong((id *)&self->_changeLog, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeLog, 0);
  objc_storeStrong((id *)&self->_saveOperation, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_queryController, 0);
  objc_storeStrong((id *)&self->_idsQueryTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_cachedStatuses, 0);
  objc_storeStrong((id *)&self->_pendingDestinations, 0);
  objc_storeStrong((id *)&self->_highPriorityDestinations, 0);
  objc_storeStrong((id *)&self->_identifiersToPersonMap, 0);
  objc_storeStrong((id *)&self->_sourcedPersons, 0);
  objc_storeStrong((id *)&self->_changeLogQueue, 0);
  objc_storeStrong((id *)&self->_saveQueue, 0);
  objc_storeStrong((id *)&self->_addressBookRefreshTimer, 0);
  objc_storeStrong((id *)&self->_npsManager, 0);
  objc_storeStrong((id *)&self->_friendGroups, 0);
  objc_storeStrong((id *)&self->_friendList, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

- (void)initWithDomain:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = 136315394;
  v2 = "-[FKFriendsManager initWithDomain:]";
  v3 = 1024;
  v4 = 193;
  _os_log_error_impl(&dword_211A80000, log, OS_LOG_TYPE_ERROR, "%s (%d) \"Softlinking failure for CNContactStoreDidChangeNotification; we won't be able to listen for contact database changes.\",
    (uint8_t *)&v1,
    0x12u);
}

void __38__FKFriendsManager__curatedFriendList__block_invoke_cold_1()
{
  __assert_rtn("-[FKFriendsManager _curatedFriendList]_block_invoke", "FKFriendsManager.m", 386, "newFriend");
}

@end
