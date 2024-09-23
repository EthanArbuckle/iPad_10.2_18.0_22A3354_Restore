@implementation AXSSPunctuationManager

+ (NSString)overrideDatabasePath
{
  return (NSString *)(id)OverrideDatabasePath;
}

+ (void)setOverrideDatabasePath:(id)a3
{
  objc_storeStrong((id *)&OverrideDatabasePath, a3);
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000001"));
    v3 = (void *)AXSSVoiceOverPunctuationGroupAll;
    AXSSVoiceOverPunctuationGroupAll = v2;

    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000002"));
    v5 = (void *)AXSSVoiceOverPunctuationGroupSome;
    AXSSVoiceOverPunctuationGroupSome = v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000003"));
    v7 = (void *)AXSSVoiceOverPunctuationGroupNone;
    AXSSVoiceOverPunctuationGroupNone = v6;

  }
}

+ (id)sharedDatabase
{
  if (sharedDatabase_onceToken != -1)
    dispatch_once(&sharedDatabase_onceToken, &__block_literal_global);
  return (id)sharedDatabase_SharedDatabase;
}

void __40__AXSSPunctuationManager_sharedDatabase__block_invoke()
{
  AXSSPunctuationManager *v0;
  void *v1;

  v0 = -[AXSSPunctuationManager init]([AXSSPunctuationManager alloc], "init");
  v1 = (void *)sharedDatabase_SharedDatabase;
  sharedDatabase_SharedDatabase = (uint64_t)v0;

}

- (AXSSPunctuationManager)init
{
  AXSSPunctuationManager *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AXSSPunctuationManager;
  v2 = -[AXSSDatabaseManager init](&v9, sel_init);
  -[AXSSPunctuationManager _initializeDatabaseStartup](v2, "_initializeDatabaseStartup");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C978B0];
  -[AXSSDatabaseManager managedObjectContext](v2, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__managedObjectChanged_, v4, v5);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__cloudKitUpdated_, CFSTR("AXSSVoiceOverPunctuationCloudKitUpdateNotification"), 0);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)onKeybagLockStatusChange, (CFStringRef)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0D4E600]), 0, CFNotificationSuspensionBehaviorDrop);
  return v2;
}

- (void)_initializeDatabaseStartup
{
  void *v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  __int16 v7;
  __int16 v8;

  if (-[AXSSPunctuationManager isProtectedDataAvailable](self, "isProtectedDataAvailable"))
  {
    if (self->_finishedInitialization)
      return;
    -[AXSSPunctuationManager _setupDatabase](self, "_setupDatabase");
    -[AXSSPunctuationManager _initializeSystemGroups](self, "_initializeSystemGroups");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("AXSSVoiceOverPunctuationGroupsChangedNotification"), 0, 0);

    AXLogPunctuationStorage();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v8 = 0;
      v5 = "Finished initialization of database, posting groups have changed locally";
      v6 = (uint8_t *)&v8;
LABEL_7:
      _os_log_impl(&dword_1AF5CC000, v4, OS_LOG_TYPE_INFO, v5, v6, 2u);
    }
  }
  else
  {
    AXLogPunctuationStorage();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v7 = 0;
      v5 = "Protected data not available, not setting up database";
      v6 = (uint8_t *)&v7;
      goto LABEL_7;
    }
  }

}

- (void)_initializeSystemGroups
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[AXSSPunctuationManager punctuationGroups](self, "punctuationGroups");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "ax_containsObjectUsingBlock:", &__block_literal_global_15) & 1) == 0)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "setUuid:", AXSSVoiceOverPunctuationGroupAll);
    -[AXSSPunctuationManager updatePunctuationGroup:](self, "updatePunctuationGroup:", v3);

  }
  if ((objc_msgSend(v6, "ax_containsObjectUsingBlock:", &__block_literal_global_17) & 1) == 0)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setUuid:", AXSSVoiceOverPunctuationGroupSome);
    -[AXSSPunctuationManager updatePunctuationGroup:](self, "updatePunctuationGroup:", v4);

  }
  if ((objc_msgSend(v6, "ax_containsObjectUsingBlock:", &__block_literal_global_18) & 1) == 0)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setUuid:", AXSSVoiceOverPunctuationGroupNone);
    -[AXSSPunctuationManager updatePunctuationGroup:](self, "updatePunctuationGroup:", v5);

  }
}

uint64_t __49__AXSSPunctuationManager__initializeSystemGroups__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", AXSSVoiceOverPunctuationGroupAll);

  return v3;
}

uint64_t __49__AXSSPunctuationManager__initializeSystemGroups__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", AXSSVoiceOverPunctuationGroupSome);

  return v3;
}

uint64_t __49__AXSSPunctuationManager__initializeSystemGroups__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", AXSSVoiceOverPunctuationGroupNone);

  return v3;
}

- (void)setCloudKitPushInSameProcess:(BOOL)a3
{
  self->_cloudKitPushInSameProcess = a3;
  -[AXSSCloudKitHelper setObserveLocalDatabaseChanges:](self->_punctuationEntryCloudKitHelper, "setObserveLocalDatabaseChanges:");
  -[AXSSCloudKitHelper setObserveLocalDatabaseChanges:](self->_punctuationGroupCloudKitHelper, "setObserveLocalDatabaseChanges:", self->_cloudKitPushInSameProcess);
}

- (id)punctuationEntriesForGroupUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  AXSSPunctuationManager *v14;
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSDatabaseManager managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__AXSSPunctuationManager_punctuationEntriesForGroupUUID___block_invoke;
  v12[3] = &unk_1E5F98840;
  v13 = v4;
  v14 = self;
  v7 = v5;
  v15 = v7;
  v8 = v4;
  objc_msgSend(v6, "performBlockAndWait:", v12);

  v9 = v15;
  v10 = v7;

  return v10;
}

void __57__AXSSPunctuationManager_punctuationEntriesForGroupUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[AXSS_PunctuationEntry fetchRequest](AXSS_PunctuationEntry, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("groupUUID = %@"), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(v2, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v2, &v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v18;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 40), "_punctuationEntryFromManagedObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v9);
  }

}

- (void)_initializeCloudKitHelpers
{
  NSObject *v3;
  void *v4;
  void *v5;
  AXSSPunctuationEntryCloudKitHelper *v6;
  AXSSPunctuationEntryCloudKitHelper *punctuationEntryCloudKitHelper;
  AXSSPunctuationGroupCloudKitHelper *v8;
  AXSSPunctuationGroupCloudKitHelper *punctuationGroupCloudKitHelper;
  AXSSPunctuationEntryCloudKitHelper *v10;
  void *v11;
  AXSSPunctuationGroupCloudKitHelper *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  AXLogPunctuationStorage();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[AXSSDatabaseManager managedObjectContext](self, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v4;
    _os_log_impl(&dword_1AF5CC000, v3, OS_LOG_TYPE_INFO, "Initialization cloud kit helpers with object context: %@", (uint8_t *)&v14, 0xCu);

  }
  -[AXSSDatabaseManager managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = -[AXSSCloudKitHelper initWithContainerIdentifier:zoneName:]([AXSSPunctuationEntryCloudKitHelper alloc], "initWithContainerIdentifier:zoneName:", CFSTR("com.apple.accessibility.VoiceOverPunctuation"), CFSTR("com.accessibility.voiceover.punctuation"));
    punctuationEntryCloudKitHelper = self->_punctuationEntryCloudKitHelper;
    self->_punctuationEntryCloudKitHelper = v6;

    v8 = -[AXSSCloudKitHelper initWithContainerIdentifier:zoneName:]([AXSSPunctuationGroupCloudKitHelper alloc], "initWithContainerIdentifier:zoneName:", CFSTR("com.apple.accessibility.VoiceOverPunctuation"), CFSTR("com.accessibility.voiceover.punctuation"));
    punctuationGroupCloudKitHelper = self->_punctuationGroupCloudKitHelper;
    self->_punctuationGroupCloudKitHelper = v8;

    -[AXSSPunctuationManager _updateCloudKitHelpers](self, "_updateCloudKitHelpers");
    v10 = self->_punctuationEntryCloudKitHelper;
    -[AXSSDatabaseManager managedObjectContext](self, "managedObjectContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSCloudKitHelper observeChangesForManagedContext:](v10, "observeChangesForManagedContext:", v11);

    v12 = self->_punctuationGroupCloudKitHelper;
    -[AXSSDatabaseManager managedObjectContext](self, "managedObjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSCloudKitHelper observeChangesForManagedContext:](v12, "observeChangesForManagedContext:", v13);

  }
}

- (void)_updateCloudKitHelpers
{
  _BOOL8 v3;

  v3 = -[AXSSPunctuationManager isProtectedDataAvailable](self, "isProtectedDataAvailable");
  -[AXSSCloudKitHelper setIsProtectedDataAvailable:](self->_punctuationEntryCloudKitHelper, "setIsProtectedDataAvailable:", v3);
  -[AXSSCloudKitHelper setIsProtectedDataAvailable:](self->_punctuationGroupCloudKitHelper, "setIsProtectedDataAvailable:", v3);
}

- (BOOL)isProtectedDataAvailable
{
  return MKBGetDeviceLockState() != 1;
}

- (void)setCloudKitSync:(BOOL)a3
{
  BOOL v4;
  AXSSPunctuationGroupCloudKitHelper *punctuationGroupCloudKitHelper;
  AXSSPunctuationEntryCloudKitHelper *punctuationEntryCloudKitHelper;
  id v7;

  self->_cloudKitSync = a3;
  if (self->_punctuationEntryCloudKitHelper)
    v4 = 1;
  else
    v4 = !a3;
  if (v4)
  {
    if (!a3)
    {
      punctuationGroupCloudKitHelper = self->_punctuationGroupCloudKitHelper;
      self->_punctuationGroupCloudKitHelper = 0;

      punctuationEntryCloudKitHelper = self->_punctuationEntryCloudKitHelper;
      self->_punctuationEntryCloudKitHelper = 0;

    }
  }
  else
  {
    -[AXSSPunctuationManager _initializeCloudKitHelpers](self, "_initializeCloudKitHelpers");
  }
  -[AXSSCloudKitHelper setObserveLocalDatabaseChanges:](self->_punctuationEntryCloudKitHelper, "setObserveLocalDatabaseChanges:", self->_cloudKitPushInSameProcess);
  -[AXSSCloudKitHelper setObserveLocalDatabaseChanges:](self->_punctuationGroupCloudKitHelper, "setObserveLocalDatabaseChanges:", self->_cloudKitPushInSameProcess);
  -[AXSSDatabaseManager managedObjectContext](self, "managedObjectContext");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStalenessInterval:", 0.0);

}

- (void)_cloudKitUpdated:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  AXLogPunctuationStorage();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[AXSSPunctuationManager _cloudKitUpdated:].cold.1(self, v4);

  if (!-[AXSSPunctuationManager cloudKitSync](self, "cloudKitSync"))
  {
    -[AXSSDatabaseManager managedObjectContext](self, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __43__AXSSPunctuationManager__cloudKitUpdated___block_invoke;
    v7[3] = &unk_1E5F98868;
    v7[4] = self;
    objc_msgSend(v5, "performBlock:", v7);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("AXSSVoiceOverPunctuationGroupsChangedNotification"), 0, 0);

  }
}

void __43__AXSSPunctuationManager__cloudKitUpdated___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "refreshAllObjects");

}

- (void)_managedObjectChanged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  NSObject *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[AXSSPunctuationManager cloudKitPushInSameProcess](self, "cloudKitPushInSameProcess")
    || !-[AXSSPunctuationManager cloudKitSync](self, "cloudKitSync"))
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C97878]);
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C97840]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    AXLogPunctuationStorage();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "userInfo");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v45 = v10;
      v46 = 2112;
      v47 = v11;
      _os_log_impl(&dword_1AF5CC000, v9, OS_LOG_TYPE_INFO, "MOC changed: %@ %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0C97A20];
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0C97A20]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v15, "allObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObjectsFromArray:", v16);

    }
    v38 = v7;
    objc_msgSend(v4, "userInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v18, "allObjects");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObjectsFromArray:", v19);

    }
    v36 = v18;
    objc_msgSend(v4, "userInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v21, "allObjects");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObjectsFromArray:", v22);

    }
    v35 = v21;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v23 = objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v24 = v12;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v40 != v27)
            objc_enumerationMutation(v24);
          v29 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[NSObject addObject:](v23, "addObject:", v29);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[AXSSPunctuationManager _punctuationGroupForEntry:](self, "_punctuationGroupForEntry:", v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if (v30)
                -[NSObject addObject:](v23, "addObject:", v30);

            }
          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v26);
    }

    v5 = v38;
    if (-[NSObject count](v38, "count") || objc_msgSend(v37, "count") || -[NSObject count](v23, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "postNotificationName:object:", CFSTR("AXSSVoiceOverPunctuationGroupsChangedNotification"), 0);

      objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "postNotificationName:object:", CFSTR("AXSSVoiceOverPunctuationGroupsChangedNotification"), 0);

      AXLogPunctuationStorage();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v45 = v38;
        v46 = 2112;
        v47 = v37;
        _os_log_impl(&dword_1AF5CC000, v33, OS_LOG_TYPE_INFO, "MOC changed - posting groups changed because inserted/deleted count: %@/%@", buf, 0x16u);
      }

    }
    AXLogPunctuationStorage();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v23;
      _os_log_impl(&dword_1AF5CC000, v34, OS_LOG_TYPE_INFO, "Processing changes for groups: %@", buf, 0xCu);
    }

  }
  else
  {
    AXLogPunctuationStorage();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[AXSSPunctuationManager _managedObjectChanged:].cold.1(v5);
  }

}

- (id)nextDefaultGroupName
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  uint64_t v18;
  void *v19;
  int v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[AXSSPunctuationManager punctuationGroups](self, "punctuationGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isSystemPunctuationGroup") & 1) == 0)
        {
          ++v5;
          v10 = (void *)MEMORY[0x1E0CB3900];
          objc_msgSend(v9, "name");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "localizedScannerWithString:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "invertedSet");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setCharactersToBeSkipped:", v14);

          v21 = 0;
          objc_msgSend(v12, "scanInt:", &v21);
          if (v6 <= v21)
            v6 = v21;

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }

  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PUNCTUATION_DEFUALT_GROUP_NAME"), &stru_1E5F9A110, CFSTR("AccessibilitySharedSupport"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 <= 0)
    v18 = v5;
  else
    v18 = v6;
  objc_msgSend(v15, "localizedStringWithFormat:", v17, v18 + 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_databaseDirectoryPath
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend((id)AXCPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("Library"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "overrideDatabasePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "overrideDatabasePath");
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v4;
  }
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Accessibility"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("AXSSPunctuation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_databaseFilePath
{
  void *v2;
  void *v3;

  -[AXSSPunctuationManager _databaseDirectoryPath](self, "_databaseDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("AXSSPunctuation.sqlite"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)userAuthChanged
{
  void *v3;
  _QWORD v4[5];

  -[AXSSPunctuationManager _setupDatabase](self, "_setupDatabase");
  -[AXSSDatabaseManager managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__AXSSPunctuationManager_userAuthChanged__block_invoke;
  v4[3] = &unk_1E5F98868;
  v4[4] = self;
  objc_msgSend(v3, "performBlockAndWait:", v4);

}

uint64_t __41__AXSSPunctuationManager_userAuthChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveIfPossible");
}

- (void)_setupDatabase
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_0(&dword_1AF5CC000, v0, v1, "Punctuation db: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __40__AXSSPunctuationManager__setupDatabase__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;

  v4 = a3;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentStoreForURL:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (v4 || !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    AXLogPunctuationStorage();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __40__AXSSPunctuationManager__setupDatabase__block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 48), "setPersistentStoreCoordinator:", 0);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 56) + 56) = 0;

}

- (BOOL)_saveIfPossible
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;

  v3 = -[AXSSDatabaseManager canSave](self, "canSave");
  if (v3)
  {
    -[AXSSDatabaseManager managedObjectContext](self, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "persistentStoreCoordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "persistentStores");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      -[AXSSDatabaseManager managedObjectContext](self, "managedObjectContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      objc_msgSend(v8, "save:", &v12);
      v9 = v12;

      if (!v9)
      {
        LOBYTE(v3) = 1;
        return v3;
      }
      AXLogPunctuationStorage();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[AXSSPunctuationManager _saveIfPossible].cold.1();

    }
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)isBasePunctuationGroup:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqual:", AXSSVoiceOverPunctuationGroupSome) & 1) != 0
    || (objc_msgSend(v3, "isEqual:", AXSSVoiceOverPunctuationGroupAll) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqual:", AXSSVoiceOverPunctuationGroupNone);
  }

  return v4;
}

- (void)addCloudRecordToPurge:(id)a3 recordEntityType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[AXSSDatabaseManager managedObjectContext](self, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __65__AXSSPunctuationManager_addCloudRecordToPurge_recordEntityType___block_invoke;
    v10[3] = &unk_1E5F98840;
    v10[4] = self;
    v11 = v6;
    v12 = v7;
    objc_msgSend(v8, "performBlockAndWait:", v10);

  }
  else
  {
    AXLogPunctuationStorage();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AXSSPunctuationManager addCloudRecordToPurge:recordEntityType:].cold.1(v9);

  }
}

void __65__AXSSPunctuationManager_addCloudRecordToPurge_recordEntityType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B20];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("AXSS_PunctuationCloudDeletionCache"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setUuid:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setEntityType:", *(_QWORD *)(a1 + 48));
  AXLogPunctuationStorage();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1AF5CC000, v5, OS_LOG_TYPE_INFO, "Store purge record: %@ for %@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_saveIfPossible");
}

- (id)cloudRecordsToPurge:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  AXSSPunctuationManager *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  -[AXSSDatabaseManager managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__AXSSPunctuationManager_cloudRecordsToPurge___block_invoke;
  v9[3] = &unk_1E5F98938;
  v6 = v4;
  v10 = v6;
  v11 = self;
  v12 = &v13;
  objc_msgSend(v5, "performBlockAndWait:", v9);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __46__AXSSPunctuationManager_cloudRecordsToPurge___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("AXSS_PunctuationCloudDeletionCache"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("entityType = %@"), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(v2, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v2, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;

  if (v6)
  {
    AXLogPunctuationStorage();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __46__AXSSPunctuationManager_cloudRecordsToPurge___block_invoke_cold_1();

  }
  objc_msgSend(v5, "ax_filteredArrayUsingBlock:", &__block_literal_global_68);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "ax_mappedArrayUsingBlock:", &__block_literal_global_70);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

BOOL __46__AXSSPunctuationManager_cloudRecordsToPurge___block_invoke_66(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __46__AXSSPunctuationManager_cloudRecordsToPurge___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

- (void)removeAllRecordsForPurge
{
  void *v3;
  _QWORD v4[5];

  -[AXSSDatabaseManager managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__AXSSPunctuationManager_removeAllRecordsForPurge__block_invoke;
  v4[3] = &unk_1E5F98868;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

void __50__AXSSPunctuationManager_removeAllRecordsForPurge__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  +[AXSS_PunctuationCloudDeletionCache fetchRequest](AXSS_PunctuationCloudDeletionCache, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__AXSSPunctuationManager_removeAllRecordsForPurge__block_invoke_2;
  v7[3] = &unk_1E5F98960;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  if (v5)
  {
    AXLogPunctuationStorage();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __50__AXSSPunctuationManager_removeAllRecordsForPurge__block_invoke_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 32), "_saveIfPossible");

}

void __50__AXSSPunctuationManager_removeAllRecordsForPurge__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "managedObjectContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteObject:", v3);

}

- (void)removeCloudRecordForPurge:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  AXSSPunctuationManager *v9;

  v4 = a3;
  -[AXSSDatabaseManager managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__AXSSPunctuationManager_removeCloudRecordForPurge___block_invoke;
  v7[3] = &unk_1E5F98988;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

void __52__AXSSPunctuationManager_removeCloudRecordForPurge___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  +[AXSS_PunctuationCloudDeletionCache fetchRequest](AXSS_PunctuationCloudDeletionCache, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid = %@"), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(v2, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v2, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__AXSSPunctuationManager_removeCloudRecordForPurge___block_invoke_2;
  v8[3] = &unk_1E5F98960;
  v8[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);
  if (v6)
  {
    AXLogPunctuationStorage();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __50__AXSSPunctuationManager_removeAllRecordsForPurge__block_invoke_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 40), "_saveIfPossible");

}

void __52__AXSSPunctuationManager_removeCloudRecordForPurge___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "managedObjectContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteObject:", v3);

}

- (id)parentPunctuationGroup:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  AXSSPunctuationManager *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  -[AXSSDatabaseManager managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__AXSSPunctuationManager_parentPunctuationGroup___block_invoke;
  v9[3] = &unk_1E5F98938;
  v6 = v4;
  v10 = v6;
  v11 = self;
  v12 = &v13;
  objc_msgSend(v5, "performBlockAndWait:", v9);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __49__AXSSPunctuationManager_parentPunctuationGroup___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  +[AXSS_PunctuationGroup fetchRequest](AXSS_PunctuationGroup, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "basePunctuationUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("uuid = %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v5);

  objc_msgSend(v2, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v2, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;

  if (v8)
  {
    AXLogPunctuationStorage();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __49__AXSSPunctuationManager_parentPunctuationGroup___block_invoke_cold_1();

  }
  v10 = *(void **)(a1 + 40);
  objc_msgSend(v7, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_punctuationGroupFromManagedObject:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

}

- (id)mostBasePunctuationGroupForGroup:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;

  v4 = a3;
  if ((objc_msgSend(v4, "isSystemPunctuationGroup") & 1) != 0)
  {
    objc_msgSend(v4, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "basePunctuationUUID");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      while (1)
      {
        objc_msgSend(v4, "basePunctuationUUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[AXSSPunctuationManager isBasePunctuationGroup:](self, "isBasePunctuationGroup:", v8);

        if (v9)
          break;
        -[AXSSPunctuationManager parentPunctuationGroup:](self, "parentPunctuationGroup:", v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (v13)
        {

          break;
        }

        objc_msgSend(v10, "basePunctuationUUID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v10;
        if (!v7)
          goto LABEL_11;
      }
    }
    v10 = v4;
LABEL_11:
    objc_msgSend(v10, "basePunctuationUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v10;
  }

  return v5;
}

- (id)_punctuationGroupForEntry:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  AXSSPunctuationManager *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  -[AXSSDatabaseManager managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__AXSSPunctuationManager__punctuationGroupForEntry___block_invoke;
  v9[3] = &unk_1E5F989B0;
  v6 = v4;
  v11 = self;
  v12 = &v13;
  v10 = v6;
  objc_msgSend(v5, "performBlockAndWait:", v9);

  objc_msgSend((id)v14[5], "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __52__AXSSPunctuationManager__punctuationGroupForEntry___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;

  +[AXSS_PunctuationGroup fetchRequest](AXSS_PunctuationGroup, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "groupUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("uuid = %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v5);

  objc_msgSend(v2, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v2, &v12);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v12;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;

  if (v8)
  {
    AXLogPunctuationStorage();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __52__AXSSPunctuationManager__punctuationGroupForEntry___block_invoke_cold_1();

  }
}

- (void)importPunctuationGroup:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUuid:", v5);

  AXLogPunctuationStorage();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v25 = v7;
    _os_log_impl(&dword_1AF5CC000, v6, OS_LOG_TYPE_DEFAULT, "Importing group: %@", buf, 0xCu);

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v4, "entries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v20;
    *(_QWORD *)&v10 = 138412290;
    v18 = v10;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v13);
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID", v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setUuid:", v15);

        objc_msgSend(v4, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setGroupUUID:", v16);

        AXLogPunctuationStorage();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v18;
          v25 = v14;
          _os_log_impl(&dword_1AF5CC000, v17, OS_LOG_TYPE_DEFAULT, "Importing entry: %@", buf, 0xCu);
        }

        -[AXSSPunctuationManager updateEntry:](self, "updateEntry:", v14);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  -[AXSSPunctuationManager updatePunctuationGroup:](self, "updatePunctuationGroup:", v4);
}

- (id)punctuationEntryObjectFromLocalObjects:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  AXSSPunctuationManager *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy_;
    v16 = __Block_byref_object_dispose_;
    v17 = 0;
    -[AXSSDatabaseManager managedObjectContext](self, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__AXSSPunctuationManager_punctuationEntryObjectFromLocalObjects___block_invoke;
    v8[3] = &unk_1E5F989B0;
    v10 = self;
    v11 = &v12;
    v9 = v4;
    objc_msgSend(v5, "performBlockAndWait:", v8);

    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v13[5]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __65__AXSSPunctuationManager_punctuationEntryObjectFromLocalObjects___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("AXSS_PunctuationEntry"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "ax_mappedArrayUsingBlock:", &__block_literal_global_80);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("uuid IN %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v5);

  objc_msgSend(v2, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v2, &v12);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v12;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;

  if (v8)
  {
    AXLogPunctuationStorage();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __46__AXSSPunctuationManager_cloudRecordsToPurge___block_invoke_cold_1();

  }
}

id __65__AXSSPunctuationManager_punctuationEntryObjectFromLocalObjects___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    AXLogPunctuationStorage();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __65__AXSSPunctuationManager_punctuationEntryObjectFromLocalObjects___block_invoke_2_cold_1();

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v5;

  return v7;
}

- (void)updatePunctuationGroup:(id)a3
{
  -[AXSSPunctuationManager updatePunctuationGroup:fromCloudKit:](self, "updatePunctuationGroup:fromCloudKit:", a3, 0);
}

- (void)updatePunctuationGroup:(id)a3 fromCloudKit:(BOOL)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  AXSSPunctuationManager *v14;
  BOOL v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    AXLogPunctuationStorage();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_impl(&dword_1AF5CC000, v7, OS_LOG_TYPE_INFO, "1 storing entries: %@", buf, 0xCu);

    }
    -[AXSSDatabaseManager managedObjectContext](self, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __62__AXSSPunctuationManager_updatePunctuationGroup_fromCloudKit___block_invoke;
    v11[3] = &unk_1E5F98A18;
    v12 = v9;
    v13 = v6;
    v14 = self;
    v15 = a4;
    v10 = v9;
    objc_msgSend(v10, "performBlock:", v11);

  }
}

void __62__AXSSPunctuationManager_updatePunctuationGroup_fromCloudKit___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
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
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  NSObject *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "refreshAllObjects");
  +[AXSS_PunctuationGroup fetchRequest](AXSS_PunctuationGroup, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("uuid = %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v5);

  objc_msgSend(v2, "setReturnsObjectsAsFaults:", 0);
  v6 = *(void **)(a1 + 32);
  v35 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v2, &v35);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v35;
  objc_msgSend(v7, "lastObject");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = v8 == 0;
  else
    v11 = 0;
  if (v11)
  {
    v14 = (void *)v9;
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C97B20];
    objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("AXSS_PunctuationGroup"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      AXLogPunctuationStorage();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __62__AXSSPunctuationManager_updatePunctuationGroup_fromCloudKit___block_invoke_cold_1();

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "basePunctuationUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBasePunctuationUUID:", v16);

  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setUuid:", v17);

  v18 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "autoSwitchContexts");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "cloudObjectFromLocalObjects:withTable:andObjectID:", v19, CFSTR("AXSS_PunctuationContext"), CFSTR("contextIdentifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAutoSwitchContexts:", v20);

  objc_msgSend(*(id *)(a1 + 40), "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setName:", v21);

  objc_msgSend(v14, "setVersion:", 1);
  objc_msgSend(v14, "setInCloud:", objc_msgSend(*(id *)(a1 + 40), "inCloud"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLastModifiedDate:", v22);

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 40), "ckChangeTag");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCkChangeTag:", v23);

    objc_msgSend(*(id *)(a1 + 40), "ckRecordProcessDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCkRecordProcessDate:", v24);

  }
  else
  {
    objc_msgSend(v14, "setCkChangeTag:", 0);
    objc_msgSend(v14, "setCkRecordProcessDate:", 0);
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v14, "autoSwitchContexts");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v32 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "setGroup:", v14);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    }
    while (v27);
  }

  AXLogPunctuationStorage();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v14;
    _os_log_impl(&dword_1AF5CC000, v30, OS_LOG_TYPE_INFO, "2 storing entries: %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "setInDatabase:", 1);
  objc_msgSend(*(id *)(a1 + 48), "_saveIfPossible");

}

- (void)removePunctuationGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  AXSSPunctuationManager *v11;

  v4 = a3;
  if (objc_msgSend(v4, "inCloud"))
  {
    objc_msgSend(v4, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXSSPunctuationGroup description](AXSSPunctuationGroup, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSPunctuationManager addCloudRecordToPurge:recordEntityType:](self, "addCloudRecordToPurge:recordEntityType:", v5, v6);

  }
  -[AXSSDatabaseManager managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__AXSSPunctuationManager_removePunctuationGroup___block_invoke;
  v9[3] = &unk_1E5F98988;
  v10 = v4;
  v11 = self;
  v8 = v4;
  objc_msgSend(v7, "performBlockAndWait:", v9);

}

void __49__AXSSPunctuationManager_removePunctuationGroup___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "entries");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  v2 = 0;
  if (v33)
  {
    v32 = *(_QWORD *)v44;
    do
    {
      v3 = 0;
      v4 = v2;
      do
      {
        if (*(_QWORD *)v44 != v32)
          objc_enumerationMutation(obj);
        v35 = v3;
        v5 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v3);
        +[AXSS_PunctuationEntry fetchRequest](AXSS_PunctuationEntry, "fetchRequest");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x1E0CB3880];
        objc_msgSend(v5, "uuid");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "predicateWithFormat:", CFSTR("uuid = %@"), v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setPredicate:", v9);

        objc_msgSend(v6, "setReturnsObjectsAsFaults:", 0);
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v4;
        v34 = v6;
        objc_msgSend(v10, "executeFetchRequest:error:", v6, &v38);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v38;

        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v40;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v40 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
              if (objc_msgSend(v16, "inCloud"))
              {
                v17 = *(void **)(a1 + 40);
                objc_msgSend(v16, "uuid");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                +[AXSSPunctuationEntry description](AXSSPunctuationEntry, "description");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "addCloudRecordToPurge:recordEntityType:", v18, v19);

              }
              objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "deleteObject:", v16);

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          }
          while (v13);
        }

        v2 = v36;
        v3 = v35 + 1;
        v4 = v36;
      }
      while (v35 + 1 != v33);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v33);
  }

  +[AXSS_PunctuationGroup fetchRequest](AXSS_PunctuationGroup, "fetchRequest");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "predicateWithFormat:", CFSTR("uuid = %@"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPredicate:", v24);

  objc_msgSend(v21, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v2;
  objc_msgSend(v25, "executeFetchRequest:error:", v21, &v37);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v37;

  objc_msgSend(v26, "lastObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "deleteObject:", v28);

  }
  if (v27)
  {
    AXLogPunctuationStorage();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      __50__AXSSPunctuationManager_removeAllRecordsForPurge__block_invoke_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 40), "_saveIfPossible");

}

- (id)_punctuationEntryFromManagedObject:(id)a3
{
  id v4;
  AXSSPunctuationEntry *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (a3)
  {
    v4 = a3;
    v5 = -[AXSSPunctuationEntry init]([AXSSPunctuationEntry alloc], "init");
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSPunctuationEntry setUuid:](v5, "setUuid:", v6);

    objc_msgSend(v4, "punctuation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSPunctuationEntry setPunctuation:](v5, "setPunctuation:", v7);

    objc_msgSend(v4, "replacement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSPunctuationEntry setReplacement:](v5, "setReplacement:", v8);

    objc_msgSend(v4, "rule");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSPunctuationEntry setRule:](v5, "setRule:", -[AXSSPunctuationManager stringToRule:](self, "stringToRule:", v9));

    -[AXSSPunctuationEntry setVersion:](v5, "setVersion:", (unsigned __int16)objc_msgSend(v4, "version"));
    -[AXSSPunctuationEntry setInCloud:](v5, "setInCloud:", objc_msgSend(v4, "inCloud"));
    objc_msgSend(v4, "ckChangeTag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSPunctuationEntry setCkChangeTag:](v5, "setCkChangeTag:", v10);

    objc_msgSend(v4, "lastModifiedDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSPunctuationEntry setLastModifiedDate:](v5, "setLastModifiedDate:", v11);

    objc_msgSend(v4, "ckRecordProcessDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSPunctuationEntry setCkRecordProcessDate:](v5, "setCkRecordProcessDate:", v12);

    objc_msgSend(v4, "groupUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXSSPunctuationEntry setGroupUUID:](v5, "setGroupUUID:", v13);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_punctuationGroupFromManagedObject:(id)a3
{
  id v4;
  AXSSPunctuationGroup *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v5 = 0;
    goto LABEL_19;
  }
  v5 = -[AXSSPunctuationGroup init]([AXSSPunctuationGroup alloc], "init");
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSPunctuationGroup setUuid:](v5, "setUuid:", v6);

  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSPunctuationGroup setName:](v5, "setName:", v7);

  -[AXSSPunctuationGroup setInCloud:](v5, "setInCloud:", objc_msgSend(v4, "inCloud"));
  -[AXSSPunctuationGroup setVersion:](v5, "setVersion:", (unsigned __int16)objc_msgSend(v4, "version"));
  objc_msgSend(v4, "ckRecordProcessDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSPunctuationGroup setCkRecordProcessDate:](v5, "setCkRecordProcessDate:", v8);

  -[AXSSPunctuationGroup name](v5, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[AXSSPunctuationGroup uuid](v5, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", AXSSVoiceOverPunctuationGroupNone);

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("PUNCTUATION_GROUP_NONE");
LABEL_10:
      objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_1E5F9A110, CFSTR("AccessibilitySharedSupport"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXSSPunctuationGroup setName:](v5, "setName:", v19);

      goto LABEL_11;
    }
    -[AXSSPunctuationGroup uuid](v5, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqual:", AXSSVoiceOverPunctuationGroupSome);

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("PUNCTUATION_GROUP_SOME");
      goto LABEL_10;
    }
    -[AXSSPunctuationGroup uuid](v5, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqual:", AXSSVoiceOverPunctuationGroupAll);

    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("PUNCTUATION_GROUP_ALL");
      goto LABEL_10;
    }
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v4, "autoSwitchContexts", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v34 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "contextIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v26);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v23);
  }

  -[AXSSPunctuationGroup setAutoSwitchContexts:](v5, "setAutoSwitchContexts:", v20);
  -[AXSSPunctuationGroup uuid](v5, "uuid");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSPunctuationManager punctuationEntriesForGroupUUID:](self, "punctuationEntriesForGroupUUID:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSPunctuationGroup setEntries:](v5, "setEntries:", v28);

  objc_msgSend(v4, "basePunctuationUUID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSPunctuationGroup setBasePunctuationUUID:](v5, "setBasePunctuationUUID:", v29);

  -[AXSSPunctuationGroup setInDatabase:](v5, "setInDatabase:", 1);
  objc_msgSend(v4, "ckChangeTag");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSPunctuationGroup setCkChangeTag:](v5, "setCkChangeTag:", v30);

  objc_msgSend(v4, "lastModifiedDate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSPunctuationGroup setLastModifiedDate:](v5, "setLastModifiedDate:", v31);

LABEL_19:
  return v5;
}

- (id)punctuationGroupsForContexts
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[5];
  id v21;
  uint64_t *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[5];
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  +[AXSS_PunctuationContext fetchRequest](AXSS_PunctuationContext, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy_;
  v30[4] = __Block_byref_object_dispose_;
  v31 = 0;
  objc_msgSend(v3, "setReturnsObjectsAsFaults:", 0);
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  -[AXSSDatabaseManager managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __54__AXSSPunctuationManager_punctuationGroupsForContexts__block_invoke;
  v20[3] = &unk_1E5F98A40;
  v22 = &v24;
  v20[4] = self;
  v5 = v3;
  v21 = v5;
  v23 = v30;
  objc_msgSend(v4, "performBlockAndWait:", v20);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (id)v25[5];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v32, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "group", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXSSPunctuationManager _punctuationGroupFromManagedObject:](self, "_punctuationGroupFromManagedObject:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "contextIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, v14);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v32, 16);
    }
    while (v8);
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(v30, 8);

  return v6;
}

void __54__AXSSPunctuationManager_punctuationGroupsForContexts__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (NSArray)punctuationGroups
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[AXSSDatabaseManager managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__AXSSPunctuationManager_punctuationGroups__block_invoke;
  v6[3] = &unk_1E5F98AA8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performBlockAndWait:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __43__AXSSPunctuationManager_punctuationGroups__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[AXSS_PunctuationGroup fetchRequest](AXSS_PunctuationGroup, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &v20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v20;

  objc_msgSend(*(id *)(a1 + 32), "punctuationGroupsForContexts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(a1 + 32), "_punctuationGroupFromManagedObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14), (_QWORD)v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_filterAutoswitchContexts:punctuationGroupsForContexts:", v15, v6);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v12);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "sortUsingComparator:", &__block_literal_global_99);
}

uint64_t __43__AXSSPunctuationManager_punctuationGroups__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v20;
  void *v21;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", AXSSVoiceOverPunctuationGroupAll);

  if ((v7 & 1) != 0)
    goto LABEL_6;
  objc_msgSend(v5, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", AXSSVoiceOverPunctuationGroupAll);

  if ((v9 & 1) != 0)
    goto LABEL_8;
  objc_msgSend(v4, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", AXSSVoiceOverPunctuationGroupSome);

  if ((v11 & 1) == 0)
  {
    objc_msgSend(v5, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqual:", AXSSVoiceOverPunctuationGroupSome);

    if ((v13 & 1) == 0)
    {
      objc_msgSend(v4, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqual:", AXSSVoiceOverPunctuationGroupNone);

      if ((v15 & 1) != 0)
        goto LABEL_6;
      objc_msgSend(v5, "uuid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqual:", AXSSVoiceOverPunctuationGroupNone);

      if ((v18 & 1) == 0)
      {
        objc_msgSend(v4, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v20, "localizedCompare:", v21);

        goto LABEL_9;
      }
    }
LABEL_8:
    v16 = 1;
    goto LABEL_9;
  }
LABEL_6:
  v16 = -1;
LABEL_9:

  return v16;
}

- (void)_filterAutoswitchContexts:(id)a3 punctuationGroupsForContexts:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "autoSwitchContexts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v7, "mutableCopy");

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v5, "autoSwitchContexts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v12, v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqual:", v15);

        if ((v16 & 1) == 0)
          objc_msgSend(v17, "removeObject:", v12);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  objc_msgSend(v5, "setAutoSwitchContexts:", v17);
}

- (id)punctuationEntryForUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  AXSSPunctuationManager *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  -[AXSSDatabaseManager managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__AXSSPunctuationManager_punctuationEntryForUUID___block_invoke;
  v9[3] = &unk_1E5F98938;
  v6 = v4;
  v10 = v6;
  v11 = self;
  v12 = &v13;
  objc_msgSend(v5, "performBlockAndWait:", v9);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __50__AXSSPunctuationManager_punctuationEntryForUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  +[AXSS_PunctuationEntry fetchRequest](AXSS_PunctuationEntry, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid = %@"), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v2, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;

  if (v6)
  {
    AXLogPunctuationStorage();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __50__AXSSPunctuationManager_punctuationEntryForUUID___block_invoke_cold_1();

  }
  v8 = *(void **)(a1 + 40);
  objc_msgSend(v5, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_punctuationEntryFromManagedObject:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

- (id)punctuationGroupForUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  AXSSPunctuationManager *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  -[AXSSDatabaseManager managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__AXSSPunctuationManager_punctuationGroupForUUID___block_invoke;
  v9[3] = &unk_1E5F98938;
  v6 = v4;
  v10 = v6;
  v11 = self;
  v12 = &v13;
  objc_msgSend(v5, "performBlockAndWait:", v9);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __50__AXSSPunctuationManager_punctuationGroupForUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  +[AXSS_PunctuationGroup fetchRequest](AXSS_PunctuationGroup, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v2, "setShouldRefreshRefetchedObjects:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid = %@"), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v2, &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_punctuationGroupFromManagedObject:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  if (v6)
  {
    AXLogPunctuationStorage();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __50__AXSSPunctuationManager_punctuationGroupForUUID___block_invoke_cold_1();

  }
  v12 = *(void **)(a1 + 40);
  v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(v12, "punctuationGroupsForContexts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_filterAutoswitchContexts:punctuationGroupsForContexts:", v13, v14);

}

- (id)ruleToString:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 0;
  else
    return off_1E5F98AF0[a3];
}

- (int64_t)stringToRule:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AXSSPunctuationEntryRuleReplace")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AXSSPunctuationEntryRuleRemove")) & 1) != 0)
  {
    v4 = 2;
  }
  else
  {
    objc_msgSend(v3, "isEqualToString:", CFSTR("AXSSPunctuationEntryRuleIgnore"));
    v4 = 0;
  }

  return v4;
}

- (void)updateEntry:(id)a3
{
  -[AXSSPunctuationManager updateEntry:fromCloudKit:](self, "updateEntry:fromCloudKit:", a3, 0);
}

- (void)updateEntry:(id)a3 fromCloudKit:(BOOL)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  AXSSPunctuationManager *v13;
  BOOL v14;

  v6 = a3;
  objc_msgSend(v6, "groupUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    AXLogPunctuationStorage();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[AXSSPunctuationManager updateEntry:fromCloudKit:].cold.1();

  }
  -[AXSSDatabaseManager managedObjectContext](self, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__AXSSPunctuationManager_updateEntry_fromCloudKit___block_invoke;
  v11[3] = &unk_1E5F98AD0;
  v12 = v6;
  v13 = self;
  v14 = a4;
  v10 = v6;
  objc_msgSend(v9, "performBlock:", v11);

}

void __51__AXSSPunctuationManager_updateEntry_fromCloudKit___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  +[AXSS_PunctuationEntry fetchRequest](AXSS_PunctuationEntry, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("uuid = %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v5);

  objc_msgSend(v2, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v2, &v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v25;

  objc_msgSend(v7, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = v8 == 0;
  else
    v10 = 0;
  if (!v10)
  {
    v11 = (void *)MEMORY[0x1E0C97B20];
    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("AXSS_PunctuationEntry"), v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v13;
  }
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUuid:", v14);

  objc_msgSend(*(id *)(a1 + 32), "replacement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setReplacement:", v15);

  objc_msgSend(*(id *)(a1 + 32), "groupUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setGroupUUID:", v16);

  objc_msgSend(*(id *)(a1 + 32), "punctuation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPunctuation:", v17);

  objc_msgSend(*(id *)(a1 + 40), "ruleToString:", objc_msgSend(*(id *)(a1 + 32), "rule"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRule:", v18);

  objc_msgSend(v9, "setVersion:", (__int16)objc_msgSend(*(id *)(a1 + 32), "version"));
  objc_msgSend(*(id *)(a1 + 32), "ckRecordProcessDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCkRecordProcessDate:", v19);

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "ckChangeTag");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCkChangeTag:", v20);

  }
  else
  {
    objc_msgSend(v9, "setCkChangeTag:", 0);
  }
  objc_msgSend(v9, "setInCloud:", objc_msgSend(*(id *)(a1 + 32), "inCloud"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLastModifiedDate:", v21);

  if (v8)
  {
    AXLogPunctuationStorage();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      __51__AXSSPunctuationManager_updateEntry_fromCloudKit___block_invoke_cold_1();

  }
  AXLogPunctuationStorage();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v27 = v24;
    _os_log_impl(&dword_1AF5CC000, v23, OS_LOG_TYPE_INFO, "Updating entry: %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "_saveIfPossible");
}

- (void)removeEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  AXSSPunctuationManager *v11;

  v4 = a3;
  if (objc_msgSend(v4, "inCloud"))
  {
    objc_msgSend(v4, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXSSPunctuationEntry description](AXSSPunctuationEntry, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSPunctuationManager addCloudRecordToPurge:recordEntityType:](self, "addCloudRecordToPurge:recordEntityType:", v5, v6);

  }
  -[AXSSDatabaseManager managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__AXSSPunctuationManager_removeEntry___block_invoke;
  v9[3] = &unk_1E5F98988;
  v10 = v4;
  v11 = self;
  v8 = v4;
  objc_msgSend(v7, "performBlock:", v9);

}

void __38__AXSSPunctuationManager_removeEntry___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;

  +[AXSS_PunctuationEntry fetchRequest](AXSS_PunctuationEntry, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("uuid = %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v5);

  objc_msgSend(v2, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v2, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;

  objc_msgSend(v7, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deleteObject:", v9);

  }
  if (v8)
  {
    AXLogPunctuationStorage();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __38__AXSSPunctuationManager_removeEntry___block_invoke_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 40), "_saveIfPossible");

}

- (id)allPunctuationGroup
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)allPunctuationGroup_AllPunctuationGroup;
  if (!allPunctuationGroup_AllPunctuationGroup)
  {
    -[AXSSPunctuationManager punctuationGroupForUUID:](self, "punctuationGroupForUUID:", AXSSVoiceOverPunctuationGroupAll);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)allPunctuationGroup_AllPunctuationGroup;
    allPunctuationGroup_AllPunctuationGroup = v3;

    v2 = (void *)allPunctuationGroup_AllPunctuationGroup;
  }
  return v2;
}

- (id)somePunctuationGroup
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)somePunctuationGroup_SomePunctuationGroup;
  if (!somePunctuationGroup_SomePunctuationGroup)
  {
    -[AXSSPunctuationManager punctuationGroupForUUID:](self, "punctuationGroupForUUID:", AXSSVoiceOverPunctuationGroupSome);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)somePunctuationGroup_SomePunctuationGroup;
    somePunctuationGroup_SomePunctuationGroup = v3;

    v2 = (void *)somePunctuationGroup_SomePunctuationGroup;
  }
  return v2;
}

- (id)nonePunctuationGroup
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)nonePunctuationGroup_NonePunctuationGroup;
  if (!nonePunctuationGroup_NonePunctuationGroup)
  {
    -[AXSSPunctuationManager punctuationGroupForUUID:](self, "punctuationGroupForUUID:", AXSSVoiceOverPunctuationGroupNone);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)nonePunctuationGroup_NonePunctuationGroup;
    nonePunctuationGroup_NonePunctuationGroup = v3;

    v2 = (void *)nonePunctuationGroup_NonePunctuationGroup;
  }
  return v2;
}

- (BOOL)cloudKitSync
{
  return self->_cloudKitSync;
}

- (BOOL)cloudKitPushInSameProcess
{
  return self->_cloudKitPushInSameProcess;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_punctuationGroupCloudKitHelper, 0);
  objc_storeStrong((id *)&self->_punctuationEntryCloudKitHelper, 0);
}

- (void)_cloudKitUpdated:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  int v4;
  void *v5;
  _DWORD v6[2];
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a1, "cloudKitSync");
  objc_msgSend(a1, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 67109378;
  v6[1] = v4;
  v7 = 2112;
  v8 = v5;
  _os_log_debug_impl(&dword_1AF5CC000, a2, OS_LOG_TYPE_DEBUG, "Cloud kit updated itself: %d, %@", (uint8_t *)v6, 0x12u);

}

- (void)_managedObjectChanged:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1AF5CC000, log, OS_LOG_TYPE_DEBUG, "Cloud sync process, skipping local changes", v1, 2u);
}

void __40__AXSSPunctuationManager__setupDatabase__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, v0, v1, "Punctuation err: resetting storage coordinator %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_saveIfPossible
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, v0, v1, "Could not save punctuation: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)addCloudRecordToPurge:(os_log_t)log recordEntityType:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AF5CC000, log, OS_LOG_TYPE_ERROR, "Unable add nil uuid record to purge", v1, 2u);
}

void __46__AXSSPunctuationManager_cloudRecordsToPurge___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, v0, v1, "Could not fetch entries: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __50__AXSSPunctuationManager_removeAllRecordsForPurge__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, v0, v1, "Could not remove group: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __49__AXSSPunctuationManager_parentPunctuationGroup___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, v0, v1, "Could not get parent group: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __52__AXSSPunctuationManager__punctuationGroupForEntry___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, v0, v1, "Could not fetch group for entry: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __65__AXSSPunctuationManager_punctuationEntryObjectFromLocalObjects___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, v0, v1, "Unable to fetch uuid for entry: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __62__AXSSPunctuationManager_updatePunctuationGroup_fromCloudKit___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, v0, v1, "Could not fetch group: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __50__AXSSPunctuationManager_punctuationEntryForUUID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, v0, v1, "Could not get entry: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __50__AXSSPunctuationManager_punctuationGroupForUUID___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1AF5CC000, v1, OS_LOG_TYPE_ERROR, "Error getting group: %@ %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)updateEntry:fromCloudKit:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  _os_log_fault_impl(&dword_1AF5CC000, v0, OS_LOG_TYPE_FAULT, "Every entry being updated needs a group UUID: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __51__AXSSPunctuationManager_updateEntry_fromCloudKit___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, v0, v1, "Could not update entry: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __38__AXSSPunctuationManager_removeEntry___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, v0, v1, "Could not delete entry: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
