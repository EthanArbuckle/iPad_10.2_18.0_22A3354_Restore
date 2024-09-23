@implementation FLTopLevelViewModel

- (FLTopLevelViewModel)initWithBundleIdentifier:(id)a3 clientIdentifier:(id)a4
{
  id v6;
  id v7;
  FLFollowUpController *v8;
  FLTopLevelViewModel *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[FLFollowUpController initWithClientIdentifier:]([FLFollowUpController alloc], "initWithClientIdentifier:", v6);

  v9 = -[FLTopLevelViewModel initWithBundleIdentifier:controller:](self, "initWithBundleIdentifier:controller:", v7, v8);
  return v9;
}

- (FLTopLevelViewModel)initWithBundleIdentifier:(id)a3 controller:(id)a4
{
  id v7;
  id v8;
  FLTopLevelViewModel *v9;
  FLTopLevelViewModel *v10;
  FLItemChangeObserver *v11;
  FLItemChangeObserver *observer;
  uint64_t v13;
  NSMutableDictionary *timersByID;
  void *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)FLTopLevelViewModel;
  v9 = -[FLTopLevelViewModel init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_controller, a4);
    objc_storeStrong((id *)&v10->_bundleIdentifier, a3);
    v11 = objc_alloc_init(FLItemChangeObserver);
    observer = v10->_observer;
    v10->_observer = v11;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    timersByID = v10->_timersByID;
    v10->_timersByID = (NSMutableDictionary *)v13;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v10, sel__updateTimerItems_, CFSTR("com.apple.PreferencesApp.willBecomeActive"), 0);

  }
  return v10;
}

- (id)_groupsForPrimaryAccount:(id)a3 secondaryAccounts:(id)a4 simpleAccountGrouping:(BOOL)a5
{
  id v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  FLGroupViewModelImpl *v13;
  void *v14;
  FLGroupViewModelImpl *v15;
  void *v16;
  FLGroupViewModelImpl *v17;
  FLGroupViewModelImpl *v18;
  void *v19;
  void *v20;
  FLGroupViewModelImpl *v21;
  void *v22;
  FLGroupViewModelImpl *v23;
  void *v24;
  void *v25;
  FLGroupViewModelImpl *v26;
  uint64_t v27;
  void *v28;
  FLGroupViewModelImpl *v29;
  FLTopLevelViewModel *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  char v42;
  FLGroupViewModelImpl *v43;
  void *v44;
  FLGroupViewModelImpl *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  unint64_t Nanoseconds;
  NSObject *v51;
  void *v52;
  FLGroupViewModelImpl *v54;
  FLGroupViewModelImpl *v55;
  FLGroupViewModelImpl *v56;
  FLGroupViewModelImpl *v57;
  FLTopLevelViewModel *v58;
  _BOOL4 v59;
  uint64_t v60;
  FLGroupViewModelImpl *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  FLGroupViewModelImpl *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  void *v71;
  _BYTE v72[128];
  uint64_t v73;

  v59 = a5;
  v73 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = _FLSignpostCreate();
  v60 = v10;
  _FLSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[FLTopLevelViewModel _groupsForPrimaryAccount:secondaryAccounts:simpleAccountGrouping:].cold.2(v9, v11);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[FLGroupViewModelImpl initWithIdentifier:]([FLGroupViewModelImpl alloc], "initWithIdentifier:", CFSTR("com.apple.followup.group.account"));
  FLLoc(CFSTR("ACCOUNT_MULTI_FOLLOW_LIST_TITLE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLGroupViewModelImpl setRowTitle:](v13, "setRowTitle:", v14);

  -[FLGroupViewModelImpl setAccountID:](v13, "setAccountID:", v7);
  -[FLGroupViewModelImpl setNeedsAccountID:](v13, "setNeedsAccountID:", 0);
  v61 = v13;
  objc_msgSend(v12, "addObject:", v13);
  v15 = -[FLGroupViewModelImpl initWithIdentifier:]([FLGroupViewModelImpl alloc], "initWithIdentifier:");
  -[FLGroupViewModelImpl setAccountID:](v15, "setAccountID:", v7);
  -[FLGroupViewModelImpl setNeedsAccountID:](v15, "setNeedsAccountID:", 0);
  FLLoc(CFSTR("SERVICES_MULTI_FOLLOW_LIST_TITLE"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLGroupViewModelImpl setRowTitle:](v15, "setRowTitle:", v16);

  v57 = v15;
  objc_msgSend(v12, "addObject:", v15);
  if (v7)
  {
    v17 = -[FLGroupViewModelImpl initWithIdentifier:]([FLGroupViewModelImpl alloc], "initWithIdentifier:", CFSTR("com.apple.followup.group.none"));
    -[FLGroupViewModelImpl setAccountID:](v17, "setAccountID:", v7);
    -[FLGroupViewModelImpl setNeedsAccountID:](v17, "setNeedsAccountID:", 1);
    objc_msgSend(v12, "addObject:", v17);

  }
  if (v8 && objc_msgSend(v8, "count"))
  {
    v18 = -[FLGroupViewModelImpl initWithIdentifier:]([FLGroupViewModelImpl alloc], "initWithIdentifier:", CFSTR("com.apple.followup.group.account"));
    FLLoc(CFSTR("ACCOUNT_MULTI_FOLLOW_LIST_TITLE"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[FLGroupViewModelImpl setRowTitle:](v18, "setRowTitle:", v19);

    objc_msgSend(v8, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[FLGroupViewModelImpl setAccountID:](v18, "setAccountID:", v20);

    -[FLGroupViewModelImpl setNeedsAccountID:](v18, "setNeedsAccountID:", 1);
    objc_msgSend(v12, "addObject:", v18);

  }
  v21 = -[FLGroupViewModelImpl initWithIdentifier:]([FLGroupViewModelImpl alloc], "initWithIdentifier:", CFSTR("com.apple.followup.group.none"));
  v63 = v8;
  objc_msgSend(v8, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLGroupViewModelImpl setAccountID:](v21, "setAccountID:", v22);

  -[FLGroupViewModelImpl setNeedsAccountID:](v21, "setNeedsAccountID:", 0);
  v56 = v21;
  objc_msgSend(v12, "addObject:", v21);
  v23 = -[FLGroupViewModelImpl initWithIdentifier:]([FLGroupViewModelImpl alloc], "initWithIdentifier:", CFSTR("com.apple.followup.group.device"));
  -[FLTopLevelViewModel localizedDeviceRowTitle](self, "localizedDeviceRowTitle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v9;
  if (v24)
  {
    -[FLGroupViewModelImpl setRowTitle:](v23, "setRowTitle:", v24);
  }
  else
  {
    FLLoc(CFSTR("MULTI_FOLLOW_LIST_TITLE"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[FLGroupViewModelImpl setRowTitle:](v23, "setRowTitle:", v25);

  }
  v64 = v7;

  v65 = v23;
  objc_msgSend(v12, "addObject:", v23);
  v26 = -[FLGroupViewModelImpl initWithIdentifier:]([FLGroupViewModelImpl alloc], "initWithIdentifier:", CFSTR("com.apple.followup.group.ndo"));
  FLLoc(CFSTR("NDO_MULTI_FOLLOW_LIST_TITLE"));
  v27 = objc_claimAutoreleasedReturnValue();
  -[FLGroupViewModelImpl setRowTitle:](v26, "setRowTitle:", v27);

  v55 = v26;
  objc_msgSend(v12, "addObject:", v26);
  +[FLEnvironment currentEnvironment](FLEnvironment, "currentEnvironment");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v27) = objc_msgSend(v28, "isInternal");

  if ((v27 & 1) != 0)
  {
    v29 = -[FLGroupViewModelImpl initWithIdentifier:]([FLGroupViewModelImpl alloc], "initWithIdentifier:", CFSTR("com.apple.followup.group.unknown"));
    -[FLGroupViewModelImpl setGroupTitle:](v29, "setGroupTitle:", CFSTR("Internal Only - APPROVAL REQUIRED:"));
    -[FLGroupViewModelImpl groupTitle](v29, "groupTitle");
    v30 = self;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[FLGroupViewModelImpl setRowTitle:](v29, "setRowTitle:", v31);

    self = v30;
    v32 = v12;
    v54 = v29;
    objc_msgSend(v12, "addObject:", v29);
  }
  else
  {
    v32 = v12;
    v54 = 0;
  }
  v58 = self;
  -[FLTopLevelViewModel allPendingItems](self, "allPendingItems");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", CFSTR("com.apple.followup.group.account"), CFSTR("com.apple.followup.group.device"), CFSTR("com.apple.followup.group.unknown"), CFSTR("com.apple.followup.group.services"), CFSTR("com.apple.followup.group.ndo"), CFSTR("com.apple.followup.group.none"), 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v35 = v33;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v67 != v38)
          objc_enumerationMutation(v35);
        v40 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        objc_msgSend(v40, "groupIdentifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v34, "containsObject:", v41);

        if ((v42 & 1) == 0)
        {
          v43 = [FLGroupViewModelImpl alloc];
          objc_msgSend(v40, "groupIdentifier");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = -[FLGroupViewModelImpl initWithIdentifier:](v43, "initWithIdentifier:", v44);
          objc_msgSend(v32, "addObject:", v45);

          objc_msgSend(v40, "groupIdentifier");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addObject:", v46);

          _FLLogSystem();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v40, "groupIdentifier");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v71 = v48;
            _os_log_impl(&dword_1B8D53000, v47, OS_LOG_TYPE_DEFAULT, "Adding dynamic group: %@", buf, 0xCu);

          }
        }
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
    }
    while (v37);
  }

  -[FLTopLevelViewModel mapItems:toGroups:unknownGroup:deviceGroup:simpleAccountGrouping:](v58, "mapItems:toGroups:unknownGroup:deviceGroup:simpleAccountGrouping:", v35, v32, v54, v65, v59);
  _FLLogSystem();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v71 = v32;
    _os_log_impl(&dword_1B8D53000, v49, OS_LOG_TYPE_DEFAULT, "Groups created: %@", buf, 0xCu);
  }

  Nanoseconds = _FLSignpostGetNanoseconds(v62, v60);
  _FLSignpostLogSystem();
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    -[FLTopLevelViewModel _groupsForPrimaryAccount:secondaryAccounts:simpleAccountGrouping:].cold.1(Nanoseconds, v62, v51);

  v52 = (void *)objc_msgSend(v32, "copy");
  return v52;
}

- (void)mapItems:(id)a3 toGroups:(id)a4 unknownGroup:(id)a5 deviceGroup:(id)a6 simpleAccountGrouping:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  BOOL v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  _FLLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v11;
    _os_log_impl(&dword_1B8D53000, v15, OS_LOG_TYPE_DEFAULT, "Starting to build groups from %@", buf, 0xCu);
  }

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __88__FLTopLevelViewModel_mapItems_toGroups_unknownGroup_deviceGroup_simpleAccountGrouping___block_invoke;
  v19[3] = &unk_1E6F1E998;
  v23 = a7;
  v20 = v12;
  v21 = v14;
  v22 = v13;
  v16 = v13;
  v17 = v14;
  v18 = v12;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v19);

}

- (NSString)localizedDeviceRowTitle
{
  return self->_localizedDeviceRowTitle;
}

- (id)allPendingItems
{
  NSObject *v3;
  FLFollowUpController *controller;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  BOOL v13;
  NSMutableDictionary *timersByID;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v24;
  id v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[6];
  id v32;
  uint8_t buf[8];
  uint8_t *v34;
  uint64_t v35;
  char v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  _FLLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8D53000, v3, OS_LOG_TYPE_DEFAULT, "allPendingItems", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v34 = buf;
  v35 = 0x2020000000;
  v36 = 0;
  controller = self->_controller;
  v32 = 0;
  -[FLFollowUpController pendingFollowUpItems:](controller, "pendingFollowUpItems:", &v32);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v32;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __38__FLTopLevelViewModel_allPendingItems__block_invoke;
  v31[3] = &unk_1E6F1E7C0;
  v31[4] = self;
  v31[5] = buf;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v31);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    _FLLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[FLTopLevelViewModel allPendingItems].cold.1((uint64_t)v25, v7);

  }
  if (v34[24])
    -[FLFollowUpController updateBadgesForTimer](self->_controller, "updateBadgesForTimer");
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v11, "expirationDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12 == 0;

        if (v13)
        {
          -[FLTopLevelViewModel _removeTimerForItem:](self, "_removeTimerForItem:", v11);
        }
        else
        {
          timersByID = self->_timersByID;
          objc_msgSend(v11, "uniqueIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](timersByID, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            v17 = self->_timersByID;
            objc_msgSend(v11, "uniqueIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "fireDate");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "_midnightAdjustedDate");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v20, "isEqualToDate:", v21);

            if ((v22 & 1) != 0)
              continue;
            -[FLTopLevelViewModel _removeTimerForItem:](self, "_removeTimerForItem:", v11);
          }
          -[FLTopLevelViewModel _configureTimerForItem:](self, "_configureTimerForItem:", v11);
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    }
    while (v8);
  }

  _Block_object_dispose(buf, 8);
  return obj;
}

- (void)setLocalizedDeviceRowTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setItemChangeHandler:(id)a3
{
  -[FLItemChangeObserver setItemChangeHandler:](self->_observer, "setItemChangeHandler:", a3);
}

- (id)groupsForPrimaryAccount:(id)a3 secondaryAccounts:(id)a4
{
  return -[FLTopLevelViewModel _groupsForPrimaryAccount:secondaryAccounts:simpleAccountGrouping:](self, "_groupsForPrimaryAccount:secondaryAccounts:simpleAccountGrouping:", a3, a4, 0);
}

- (FLTopLevelViewModel)initWithIdentifier:(id)a3
{
  return -[FLTopLevelViewModel initWithBundleIdentifier:clientIdentifier:](self, "initWithBundleIdentifier:clientIdentifier:", 0, a3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.PreferencesApp.willBecomeActive"), 0);

  v4.receiver = self;
  v4.super_class = (Class)FLTopLevelViewModel;
  -[FLTopLevelViewModel dealloc](&v4, sel_dealloc);
}

uint64_t __38__FLTopLevelViewModel_allPendingItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  char v7;
  NSObject *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isExpired"))
  {
    _FLLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v3;
      _os_log_impl(&dword_1B8D53000, v4, OS_LOG_TYPE_DEFAULT, "Item expired, not returning to UI %@", (uint8_t *)&v10, 0xCu);
    }

    v5 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    goto LABEL_13;
  }
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
LABEL_8:
    v5 = 1;
    goto LABEL_13;
  }
  objc_msgSend(v3, "targetBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24)) & 1) != 0)
  {
    v7 = objc_msgSend(v3, "displayStyle");

    if ((v7 & 8) == 0)
      goto LABEL_8;
  }
  else
  {

  }
  _FLLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1B8D53000, v8, OS_LOG_TYPE_DEFAULT, "Item %@ did not match, discarding...", (uint8_t *)&v10, 0xCu);
  }

  v5 = 0;
LABEL_13:

  return v5;
}

- (void)_updateTimerItems:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if (-[NSMutableDictionary count](self->_timersByID, "count", a3))
  {
    _FLLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B8D53000, v4, OS_LOG_TYPE_DEFAULT, "_updateItemTimers called", v5, 2u);
    }

    -[FLItemChangeObserver timerUpdated](self->_observer, "timerUpdated");
  }
}

- (void)_configureTimerForItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSMutableDictionary *timersByID;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0C99E88]);
  objc_msgSend(v4, "_midnightAdjustedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __46__FLTopLevelViewModel__configureTimerForItem___block_invoke;
  v12[3] = &unk_1E6F1E7E8;
  v7 = v4;
  v13 = v7;
  objc_copyWeak(&v14, &location);
  v8 = (void *)objc_msgSend(v5, "initWithFireDate:interval:repeats:block:", v6, 0, v12, 0.0);

  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addTimer:forMode:", v8, *MEMORY[0x1E0C99748]);

  timersByID = self->_timersByID;
  objc_msgSend(v7, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](timersByID, "setObject:forKeyedSubscript:", v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __46__FLTopLevelViewModel__configureTimerForItem___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id *WeakRetained;
  id *v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _FLLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1B8D53000, v2, OS_LOG_TYPE_DEFAULT, "Timer fired for removing item %@", (uint8_t *)&v8, 0xCu);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[2], "timerUpdated");
    objc_msgSend(v5[1], "updateBadgesForTimer");
    v6 = v5[4];
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v7);

  }
}

- (void)_removeTimerForItem:(id)a3
{
  NSMutableDictionary *timersByID;
  id v5;
  void *v6;
  NSMutableDictionary *v7;
  void *v8;
  id v9;

  timersByID = self->_timersByID;
  v5 = a3;
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](timersByID, "objectForKeyedSubscript:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "invalidate");
  v7 = self->_timersByID;
  objc_msgSend(v5, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", 0, v8);
}

- (void)refreshItemsForItem:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v13[0] = a3;
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__FLTopLevelViewModel_refreshItemsForItem_withCompletionHandler___block_invoke;
  v11[3] = &unk_1E6F1E810;
  v12 = v6;
  v10 = v6;
  -[FLTopLevelViewModel refreshItems:withCompletionHandler:](self, "refreshItems:withCompletionHandler:", v9, v11);

}

void __65__FLTopLevelViewModel_refreshItemsForItem_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = FLItemRefreshResultSuccess;
  v6 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, BOOL, id))(v4 + 16))(v4, objc_msgSend(v7, "count") == 1, v6);

}

- (void)refreshItems:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[FLTopLevelViewModel extensionToItemMapFromItems:](self, "extensionToItemMapFromItems:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__FLTopLevelViewModel_refreshItems_withCompletionHandler___block_invoke;
  v11[3] = &unk_1E6F1E838;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[FLTopLevelViewModel _refreshItemsWithExtensionToItemMap:completion:](self, "_refreshItemsWithExtensionToItemMap:completion:", v8, v11);

}

void __58__FLTopLevelViewModel_refreshItems_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "predicateWithBlock:", &__block_literal_global_11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", FLItemRefreshResultSuccess);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v11);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

BOOL __58__FLTopLevelViewModel_refreshItems_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "extensionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (id)extensionToItemMapFromItems:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__FLTopLevelViewModel_extensionToItemMapFromItems___block_invoke;
  v8[3] = &unk_1E6F1E860;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

void __51__FLTopLevelViewModel_extensionToItemMapFromItems___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "extensionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v3);
    }
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (void)_refreshItemsWithExtensionToItemMap:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  dispatch_group_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  CFAbsoluteTime Current;
  NSObject *v18;
  FLHeadlessExtensionLoader *v19;
  NSObject *v20;
  FLHeadlessExtensionLoader *v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v33;
  void *v34;
  id obj;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  _QWORD block[4];
  FLHeadlessExtensionLoader *v43;
  uint64_t v44;
  id v45;
  CFAbsoluteTime v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD aBlock[4];
  id v52;
  id v53;
  id v54;
  NSObject *v55;
  uint8_t buf[4];
  uint64_t v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v31 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = dispatch_group_create();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__FLTopLevelViewModel__refreshItemsWithExtensionToItemMap_completion___block_invoke;
  aBlock[3] = &unk_1E6F1E8B0;
  v28 = v7;
  v52 = v28;
  v9 = v5;
  v53 = v9;
  v29 = v6;
  v54 = v29;
  v10 = v8;
  v55 = v10;
  v11 = _Block_copy(aBlock);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v34 = v9;
  objc_msgSend(v9, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v48 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
        dispatch_group_enter(v10);
        Current = CFAbsoluteTimeGetCurrent();
        _FLLogSystem();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v57 = v16;
          _os_log_impl(&dword_1B8D53000, v18, OS_LOG_TYPE_DEFAULT, "Starting to refresh items for: %@", buf, 0xCu);
        }

        v19 = -[FLHeadlessExtensionLoader initWithIdentifier:]([FLHeadlessExtensionLoader alloc], "initWithIdentifier:", v16);
        +[FLHeadlessExtensionLoader sharedExtensionQueue](FLHeadlessExtensionLoader, "sharedExtensionQueue");
        v20 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __70__FLTopLevelViewModel__refreshItemsWithExtensionToItemMap_completion___block_invoke_26;
        block[3] = &unk_1E6F1E900;
        v43 = v19;
        v44 = v16;
        v46 = Current;
        v45 = v11;
        v21 = v19;
        dispatch_async(v20, block);

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
    }
    while (v13);
  }

  dispatch_get_global_queue(25, 0);
  v22 = objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __70__FLTopLevelViewModel__refreshItemsWithExtensionToItemMap_completion___block_invoke_30;
  v36[3] = &unk_1E6F1E970;
  v36[4] = self;
  v37 = v29;
  v38 = v33;
  v39 = v30;
  v40 = v28;
  v41 = v31;
  v23 = v31;
  v24 = v28;
  v25 = v30;
  v26 = v33;
  v27 = v29;
  dispatch_group_notify(v10, v22, v36);

}

void __70__FLTopLevelViewModel__refreshItemsWithExtensionToItemMap_completion___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v5 = a2;
  +[FLHeadlessExtensionLoader sharedExtensionQueue](FLHeadlessExtensionLoader, "sharedExtensionQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__FLTopLevelViewModel__refreshItemsWithExtensionToItemMap_completion___block_invoke_2;
  v8[3] = &unk_1E6F1E888;
  v14 = a3;
  v9 = a1[4];
  v10 = a1[5];
  v11 = v5;
  v12 = a1[6];
  v13 = a1[7];
  v7 = v5;
  dispatch_async(v6, v8);

}

void __70__FLTopLevelViewModel__refreshItemsWithExtensionToItemMap_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 72);
  v3 = *(void **)(a1 + 40);
  if (v2 == 1)
    v4 = *(void **)(a1 + 32);
  else
    v4 = *(void **)(a1 + 56);
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __70__FLTopLevelViewModel__refreshItemsWithExtensionToItemMap_completion___block_invoke_26(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "remoteInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "remoteInterface");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[2] = __70__FLTopLevelViewModel__refreshItemsWithExtensionToItemMap_completion___block_invoke_2_27;
    v5[3] = &unk_1E6F1E8D8;
    v4 = *(void **)(a1 + 48);
    v5[4] = *(_QWORD *)(a1 + 40);
    v5[1] = 3221225472;
    v8 = *(_QWORD *)(a1 + 56);
    v7 = v4;
    v6 = *(id *)(a1 + 32);
    objc_msgSend(v3, "followUpPerformUpdateWithCompletionHandler:", v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __70__FLTopLevelViewModel__refreshItemsWithExtensionToItemMap_completion___block_invoke_2_27(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _FLLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1B8D53000, v2, OS_LOG_TYPE_DEFAULT, "Refreshed items for %@ took %@", (uint8_t *)&v6, 0x16u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __70__FLTopLevelViewModel__refreshItemsWithExtensionToItemMap_completion___block_invoke_30(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "allPendingItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v2, "fl_map:", &__block_literal_global_34);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__FLTopLevelViewModel__refreshItemsWithExtensionToItemMap_completion___block_invoke_3;
  v12[3] = &unk_1E6F1E948;
  v7 = v5;
  v13 = v7;
  v14 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);
  v18[0] = FLItemRefreshResultSuccess;
  v18[1] = FLItemRefreshResultFailure;
  v9 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v19[0] = *(_QWORD *)(a1 + 48);
  v19[1] = v8;
  v18[2] = FLItemRefreshResultRemoved;
  v19[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _FLLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v10;
    _os_log_impl(&dword_1B8D53000, v11, OS_LOG_TYPE_DEFAULT, "Refresh completed with result: %@", buf, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

uint64_t __70__FLTopLevelViewModel__refreshItemsWithExtensionToItemMap_completion___block_invoke_2_32(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

void __70__FLTopLevelViewModel__refreshItemsWithExtensionToItemMap_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v6, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "containsObject:", v4);

  v5 = 48;
  if ((_DWORD)v3)
    v5 = 40;
  objc_msgSend(*(id *)(a1 + v5), "addObject:", v6);

}

- (id)groups
{
  return -[FLTopLevelViewModel _groupsForPrimaryAccount:secondaryAccounts:simpleAccountGrouping:](self, "_groupsForPrimaryAccount:secondaryAccounts:simpleAccountGrouping:", 0, 0, 1);
}

void __88__FLTopLevelViewModel_mapItems_toGroups_unknownGroup_deviceGroup_simpleAccountGrouping___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "groupIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v22 = a1;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v6)
  {

    if (v4)
      goto LABEL_21;
    v8 = 0;
    goto LABEL_24;
  }
  v7 = v6;
  v21 = v3;
  v8 = 0;
  v9 = *(_QWORD *)v24;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v24 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v10);
      objc_msgSend(v11, "identifier", v21);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", v4);

      if (v13)
      {
        if (*(_BYTE *)(v22 + 56))
          goto LABEL_8;
        objc_msgSend(v21, "accountIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v11, "accountID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "accountIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqualToString:", v17);

          if ((v18 & 1) != 0)
            goto LABEL_8;
        }
        else if ((objc_msgSend(v11, "needsAccountID") & 1) == 0)
        {
LABEL_8:
          v14 = v11;

          v8 = v14;
        }
      }
      ++v10;
    }
    while (v7 != v10);
    v19 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    v7 = v19;
  }
  while (v19);

  if (!v4)
  {
    v3 = v21;
LABEL_24:
    v20 = *(void **)(v22 + 48);
LABEL_25:
    objc_msgSend(v20, "addItem:", v3);

    goto LABEL_26;
  }
  v3 = v21;
  if (v8)
  {
    v20 = v8;
    goto LABEL_25;
  }
LABEL_21:
  objc_msgSend(*(id *)(v22 + 40), "addItem:", v3);
LABEL_26:

}

+ (id)redirectURLForItem:(id)a3 withAction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  FLTopLevelViewModel *v10;
  void *v11;
  FLTopLevelViewModel *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, uint64_t, _BYTE *);
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "groupIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [FLTopLevelViewModel alloc];
  objc_msgSend(v6, "targetBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[FLTopLevelViewModel initWithBundleIdentifier:clientIdentifier:](v10, "initWithBundleIdentifier:clientIdentifier:", v11, 0);

  -[FLTopLevelViewModel groups](v12, "groups");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__1;
  v34 = __Block_byref_object_dispose__1;
  v35 = 0;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __53__FLTopLevelViewModel_redirectURLForItem_withAction___block_invoke;
  v23 = &unk_1E6F1E9C0;
  v14 = v8;
  v24 = v14;
  v29 = a1;
  v15 = v6;
  v25 = v15;
  v28 = &v30;
  v16 = v9;
  v26 = v16;
  v17 = v7;
  v27 = v17;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v20);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v31[5], v20, v21, v22, v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v30, 8);
  return v18;
}

void __53__FLTopLevelViewModel_redirectURLForItem_withAction___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    _FLLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "items");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "shouldCoalesceItems"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v32 = v10;
      v33 = 2112;
      v34 = v13;
      v35 = 2112;
      v36 = v14;
      _os_log_impl(&dword_1B8D53000, v9, OS_LOG_TYPE_DEFAULT, "Group: %@ - %@ - %@", buf, 0x20u);

    }
    v15 = *(void **)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 40), "targetBundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_prefixFromBundleIdentifier:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      if (objc_msgSend(v6, "shouldCoalesceItems"))
        v18 = *(_QWORD *)(a1 + 32);
      else
        v18 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v17, "stringByAppendingString:", v18);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v21 = *(void **)(v20 + 40);
      *(_QWORD *)(v20 + 40) = v19;

      v22 = *(void **)(a1 + 56);
      v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v24 = *(_QWORD *)(a1 + 48);
      if (v22)
      {
        objc_msgSend(v22, "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringByAppendingFormat:", CFSTR("&itemId=%@&notificationActionId=%@&animated=true"), v24, v25);
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v28 = *(void **)(v27 + 40);
        *(_QWORD *)(v27 + 40) = v26;

      }
      else
      {
        objc_msgSend(v23, "stringByAppendingFormat:", CFSTR("&itemId=%@&animated=true"), *(_QWORD *)(a1 + 48));
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v25 = *(void **)(v30 + 40);
        *(_QWORD *)(v30 + 40) = v29;
      }

    }
    *a4 = 1;

  }
}

+ (id)_prefixFromBundleIdentifier:(id)a3
{
  id v3;
  __CFString **v4;
  __CFString *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Preferences")) & 1) != 0)
  {
    v4 = FLFollowUpPreferencesUrlPrefix;
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Bridge")))
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = FLFollowUpBridgeUrlPrefix;
  }
  v5 = *v4;
LABEL_7:

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDeviceRowTitle, 0);
  objc_storeStrong((id *)&self->_timersByID, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

- (void)allPendingItems
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B8D53000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch pending items, not much we can do here... so lets just log it  %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

- (void)_groupsForPrimaryAccount:(unint64_t)a1 secondaryAccounts:(uint64_t)a2 simpleAccountGrouping:(os_log_t)log .cold.1(unint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a2;
  v5 = 2048;
  v6 = (double)a1 / 1000000000.0;
  _os_log_debug_impl(&dword_1B8D53000, log, OS_LOG_TYPE_DEBUG, "END [%llu] %fs: Building groups", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_groupsForPrimaryAccount:(uint64_t)a1 secondaryAccounts:(NSObject *)a2 simpleAccountGrouping:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_1B8D53000, a2, OS_LOG_TYPE_DEBUG, "BEGIN [%llu]: Building groups", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

@end
