@implementation AXSSDatabaseManager

+ (int64_t)preferredContextType
{
  return 0;
}

- (AXSSDatabaseManager)init
{
  AXSSDatabaseManager *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v4;
  uint64_t v5;
  AXDispatchTimer *identityChangeTimer;
  int *p_lockNotificationToken;
  const char **v8;
  uint64_t v9;
  const char *v10;
  AXSSDatabaseManager *v11;
  void *v12;
  _Unwind_Exception *v14;
  _QWORD v15[4];
  AXSSDatabaseManager *v16;
  objc_super v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v17.receiver = self;
  v17.super_class = (Class)AXSSDatabaseManager;
  v2 = -[AXSSDatabaseManager init](&v17, sel_init);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)userAuthDidChange, (CFStringRef)*MEMORY[0x1E0DDE038], 0, (CFNotificationSuspensionBehavior)0);
  v4 = objc_alloc(MEMORY[0x1E0CF3978]);
  v5 = objc_msgSend(v4, "initWithTargetSerialQueue:", MEMORY[0x1E0C80D38]);
  identityChangeTimer = v2->_identityChangeTimer;
  v2->_identityChangeTimer = (AXDispatchTimer *)v5;

  -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:](v2->_identityChangeTimer, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
  v2->_lockNotificationToken = -1;
  p_lockNotificationToken = &v2->_lockNotificationToken;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v8 = (const char **)getkSBSLockStateNotifyKeySymbolLoc_ptr;
  v22 = getkSBSLockStateNotifyKeySymbolLoc_ptr;
  v9 = MEMORY[0x1E0C809B0];
  if (!getkSBSLockStateNotifyKeySymbolLoc_ptr)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __getkSBSLockStateNotifyKeySymbolLoc_block_invoke;
    v18[3] = &unk_1E5F99048;
    v18[4] = &v19;
    __getkSBSLockStateNotifyKeySymbolLoc_block_invoke((uint64_t)v18);
    v8 = (const char **)v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (!v8)
  {
    v14 = (_Unwind_Exception *)+[AXSSMotionTrackingCameraInput motionTrackingCameraInputWithAVCaptureDevice:].cold.1();
    _Block_object_dispose(&v19, 8);
    _Unwind_Resume(v14);
  }
  v10 = *v8;
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __27__AXSSDatabaseManager_init__block_invoke;
  v15[3] = &unk_1E5F99F40;
  v11 = v2;
  v16 = v11;
  v12 = (void *)MEMORY[0x1E0C80D38];
  notify_register_dispatch(v10, p_lockNotificationToken, MEMORY[0x1E0C80D38], v15);

  return v11;
}

uint64_t __27__AXSSDatabaseManager_init__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t state64;

  state64 = 0;
  result = notify_get_state(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 8), &state64);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 12) = state64 == 1;
  return result;
}

- (id)databaseFilePath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Accessibility"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSDatabaseManager managedObjectModelName](self, "managedObjectModelName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathExtension:", CFSTR("sqlite"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setupDatabase
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1AF5CC000, log, OS_LOG_TYPE_ERROR, "Could not make directory: %@. error: %@", (uint8_t *)&v3, 0x16u);
}

void __36__AXSSDatabaseManager_setupDatabase__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (v3)
  {
    AXLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __36__AXSSDatabaseManager_setupDatabase__block_invoke_cold_1((uint64_t)v3, v4);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  notify_cancel(self->_lockNotificationToken);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AXSSDatabaseManager;
  -[AXSSDatabaseManager dealloc](&v4, sel_dealloc);
}

- (BOOL)canSave
{
  void *v2;
  int v3;

  if (self->_isScreenedLocked)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isPasscodeSet") ^ 1;

  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (id)cloudObjectFromLocalObjects:(id)a3 withTable:(id)a4 andObjectID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  BOOL v21;
  void *v22;
  id v23;
  AXSSDatabaseManager *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  void *v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v8;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v31)
  {
    v12 = *(_QWORD *)v35;
    v28 = *(_QWORD *)v35;
    v29 = v11;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v14;
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ = %@"), v10, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setPredicate:", v16);

        objc_msgSend(v15, "setReturnsObjectsAsFaults:", 0);
        -[AXSSDatabaseManager managedObjectContext](self, "managedObjectContext");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0;
        objc_msgSend(v17, "executeFetchRequest:error:", v15, &v33);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v33;

        objc_msgSend(v18, "lastObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          v21 = v19 == 0;
        else
          v21 = 0;
        if (!v21)
        {
          v22 = (void *)MEMORY[0x1E0C97B20];
          -[AXSSDatabaseManager managedObjectContext](self, "managedObjectContext");
          v23 = v10;
          v24 = self;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "insertNewObjectForEntityForName:inManagedObjectContext:", v9, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          self = v24;
          v10 = v23;
          v12 = v28;
          objc_msgSend(v26, "setValue:forKey:", v32, v10);
          v20 = v26;
          v11 = v29;
        }
        objc_msgSend(v11, "addObject:", v20);

      }
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v31);
  }

  return v11;
}

- (void)_identityDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  AXSSDatabaseManager *v9;

  -[AXSSDatabaseManager managedObjectContext](self, "managedObjectContext", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistentStoreCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__AXSSDatabaseManager__identityDidChange___block_invoke;
  v7[3] = &unk_1E5F98988;
  v8 = v5;
  v9 = self;
  v6 = v5;
  objc_msgSend(v6, "performBlock:", v7);

}

void __42__AXSSDatabaseManager__identityDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "databaseFilePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentStoreForURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "removePersistentStore:error:", v4, 0);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(v5 + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__AXSSDatabaseManager__identityDidChange___block_invoke_2;
  v7[3] = &unk_1E5F98868;
  v7[4] = v5;
  objc_msgSend(v6, "afterDelay:processBlock:", v7, 0.25);

}

uint64_t __42__AXSSDatabaseManager__identityDidChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setupDatabase");
}

- (void)_storesWillChange:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[AXSSDatabaseManager managedObjectContext](self, "managedObjectContext", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__AXSSDatabaseManager__storesWillChange___block_invoke;
  v5[3] = &unk_1E5F98868;
  v5[4] = self;
  objc_msgSend(v4, "performBlock:", v5);

}

void __41__AXSSDatabaseManager__storesWillChange___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasChanges");

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    v9 = 0;
    v5 = objc_msgSend(v4, "saveIfPossible:", &v9);
    v6 = v9;
    if ((v5 & 1) == 0)
    {
      AXLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v6;
        _os_log_impl(&dword_1AF5CC000, v7, OS_LOG_TYPE_DEFAULT, "Failed to save database due to storesWillChange: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    objc_msgSend(v4, "managedObjectContext");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reset");

  }
}

- (void)_contentDidUpdate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[AXSSDatabaseManager managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__AXSSDatabaseManager__contentDidUpdate___block_invoke;
  v7[3] = &unk_1E5F98988;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

void __41__AXSSDatabaseManager__contentDidUpdate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mergeChangesFromContextDidSaveNotification:", *(_QWORD *)(a1 + 40));

}

- (BOOL)saveIfPossible:(id *)a3
{
  void *v5;
  char v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__8;
  v13 = __Block_byref_object_dispose__8;
  v14 = 0;
  -[AXSSDatabaseManager managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__AXSSDatabaseManager_saveIfPossible___block_invoke;
  v8[3] = &unk_1E5F99F88;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = &v15;
  objc_msgSend(v5, "performBlockAndWait:", v8);

  if (a3)
    *a3 = objc_retainAutorelease((id)v10[5]);
  v6 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __38__AXSSDatabaseManager_saveIfPossible___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id obj;

  if (objc_msgSend(*(id *)(a1 + 32), "canSave"))
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "persistentStoreCoordinator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "persistentStores");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      obj = *(id *)(v7 + 40);
      objc_msgSend(v6, "save:", &obj);
      objc_storeStrong((id *)(v7 + 40), obj);

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                             + 40) == 0;
    }
  }
}

- (BOOL)clientCloudKitSyncs
{
  return self->_clientCloudKitSyncs;
}

- (void)setClientCloudKitSyncs:(BOOL)a3
{
  self->_clientCloudKitSyncs = a3;
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)setManagedObjectContext:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_identityChangeTimer, 0);
}

+ (id)sharedDatabase
{
  id result;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7_0();
  return result;
}

- (id)managedObjectModelName
{
  id result;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7_0();
  return result;
}

- (id)cloudKitContainer
{
  id result;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7_0();
  return result;
}

- (id)containerIdentifier
{
  id result;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7_0();
  return result;
}

- (id)apsConnectionMachServiceName
{
  id result;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7_0();
  return result;
}

- (void)userAuthChanged
{
  OUTLINED_FUNCTION_0_1();
  NSRequestConcreteImplementation();
}

void __36__AXSSDatabaseManager_setupDatabase__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AF5CC000, a2, OS_LOG_TYPE_ERROR, "DB err: resetting storage coordinator %@", (uint8_t *)&v2, 0xCu);
}

@end
