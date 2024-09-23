@implementation CKVTaskManager

- (BOOL)handleTask:(unsigned __int16)a3 reason:(unsigned __int16)a4 shouldDefer:(id)a5 completion:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v7 = a4;
  v8 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  if ((_DWORD)v8 == 103)
  {
    -[CKVTaskManager _didTriggerMigration:reason:](self, "_didTriggerMigration:reason:", v11, v7);
LABEL_5:
    v14 = 1;
    goto LABEL_6;
  }
  -[CKVTaskManager _taskBlockForTask:reason:shouldDefer:](self, "_taskBlockForTask:reason:shouldDefer:", v8, v7, v10);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[CKVTaskManager _submitTask:reason:taskBlock:completion:](self, "_submitTask:reason:taskBlock:completion:", v8, v7, v12, v11);

    goto LABEL_5;
  }
  v16 = (void *)CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    v18 = v16;
    objc_msgSend(v17, "numberWithUnsignedShort:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 136315394;
    v21 = "-[CKVTaskManager handleTask:reason:shouldDefer:completion:]";
    v22 = 2112;
    v23 = v19;
    _os_log_error_impl(&dword_1A48B3000, v18, OS_LOG_TYPE_ERROR, "%s Failed to handle unknown task: %@", (uint8_t *)&v20, 0x16u);

  }
  v14 = 0;
LABEL_6:

  return v14;
}

- (id)_taskBlockForTask:(unsigned __int16)a3 reason:(unsigned __int16)a4 shouldDefer:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  __int16 v14;
  __int16 v15;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  if ((v6 - 1) > 0xA)
  {
    v10 = 0;
    switch((int)v6)
    {
      case 'e':
        -[CKVTaskManager _siriLanguageChangedTaskBlockWithReason:](self, "_siriLanguageChangedTaskBlockWithReason:", v5);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      case 'f':
        -[CKVTaskManager _maintenanceTaskBlockWithReason:shouldDefer:](self, "_maintenanceTaskBlockWithReason:shouldDefer:", v5, v8);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      case 'h':
        -[CKVTaskManager _wakePodcastsTaskBlockWithReason:](self, "_wakePodcastsTaskBlockWithReason:", v5);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      case 'i':
        -[CKVTaskManager _cleanUpDeletedAppDonationsTaskBlock:](self, "_cleanUpDeletedAppDonationsTaskBlock:", v5);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      default:
        break;
    }
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __55__CKVTaskManager__taskBlockForTask_reason_shouldDefer___block_invoke;
    v13[3] = &unk_1E4D29660;
    v13[4] = self;
    v14 = v6;
    v15 = v5;
    v9 = (uint64_t)_Block_copy(v13);
LABEL_3:
    v10 = (void *)v9;
  }
  -[CKVTaskManager _wrapperForTaskBlock:checkingEnablement:reason:](self, "_wrapperForTaskBlock:checkingEnablement:reason:", v10, v6, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __55__CKVTaskManager__taskBlockForTask_reason_shouldDefer___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "localization");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "taskForId:usingLocalization:", *(unsigned __int16 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "runWithType:reason:", *(unsigned __int16 *)(a1 + 40), *(unsigned __int16 *)(a1 + 42));
  v3 = *(unsigned __int16 *)(a1 + 40);
  switch(v3)
  {
    case 10:
      v4 = *(void **)(a1 + 32);
      v5 = "com.apple.siri.vocabulary.findmy_devices_changed";
      v6 = 27122;
      goto LABEL_6;
    case 3:
      objc_msgSend(*(id *)(a1 + 32), "_runInstalledAppDerivativeTasksWithReason:", *(unsigned __int16 *)(a1 + 42));
      break;
    case 2:
      v4 = *(void **)(a1 + 32);
      v5 = "com.apple.siri.vocabulary.contacts_changed";
      v6 = 19668;
LABEL_6:
      objc_msgSend(v4, "_postNotification:forChangeToItemType:", v5, v6);
      break;
  }

}

- (void)_submitTask:(unsigned __int16)a3 reason:(unsigned __int16)a4 taskBlock:(id)a5 completion:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  NSString *managerName;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  NSString *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v7 = a4;
  v8 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = (void *)CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    managerName = self->_managerName;
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = v12;
    objc_msgSend(v14, "numberWithUnsignedShort:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    CKVTaskIdDescription(v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 136316162;
    v20 = "-[CKVTaskManager _submitTask:reason:taskBlock:completion:]";
    v21 = 2112;
    v22 = managerName;
    v23 = 2112;
    v24 = v16;
    v25 = 2112;
    v26 = v17;
    v27 = 2112;
    v28 = v18;
    _os_log_impl(&dword_1A48B3000, v15, OS_LOG_TYPE_INFO, "%s (%@) Submitting task (%@) \"%@\" with reason (%@)", (uint8_t *)&v19, 0x34u);

  }
  -[CKVTaskCoalescer submitTaskWithId:taskBlock:completion:](self->_coalescer, "submitTaskWithId:taskBlock:completion:", v8, v10, v11);

}

- (CKVTaskManager)initWithManagerName:(id)a3 rootDirectoryURL:(id)a4 setEnumerator:(id)a5 settings:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CKVTaskManager *v15;
  CKVTaskManager *v16;
  CKVDonateTaskFactory *v17;
  void *v18;
  uint64_t v19;
  CKVDonateTaskProvider *donateTaskProvider;
  CKVTaskCoalescer *v21;
  CKVTaskCoalescer *coalescer;
  CKVTaskManager *v23;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)CKVTaskManager;
  v15 = -[CKVTaskManager init](&v25, sel_init);
  v16 = v15;
  if (!v15)
    goto LABEL_5;
  objc_storeStrong((id *)&v15->_managerName, a3);
  objc_storeStrong((id *)&v16->_settings, a6);
  objc_storeStrong((id *)&v16->_setEnumerator, a5);
  objc_storeStrong((id *)&v16->_rootDirectoryURL, a4);
  if (!-[CKVTaskManager _validateFilesystemState](v16, "_validateFilesystemState"))
    goto LABEL_6;
  v17 = [CKVDonateTaskFactory alloc];
  -[CKVTaskManagerInfo donateDirectory](v16->_info, "donateDirectory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[CKVDonateTaskFactory initWithDirectory:timeout:](v17, "initWithDirectory:timeout:", v18, 300.0);
  donateTaskProvider = v16->_donateTaskProvider;
  v16->_donateTaskProvider = (CKVDonateTaskProvider *)v19;

  if (!v16->_donateTaskProvider)
    goto LABEL_6;
  v21 = -[CKVTaskCoalescer initWithManagerName:coalescenceInterval:coalescenceDelay:dispatchQoS:settings:]([CKVTaskCoalescer alloc], "initWithManagerName:coalescenceInterval:coalescenceDelay:dispatchQoS:settings:", v16->_managerName, 25, v14, 10.0, 2.0);
  coalescer = v16->_coalescer;
  v16->_coalescer = v21;

  if (v16->_coalescer)
LABEL_5:
    v23 = v16;
  else
LABEL_6:
    v23 = 0;

  return v23;
}

- (BOOL)_validateFilesystemState
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  BOOL v6;
  NSObject *v7;
  NSObject *v8;
  const __CFString *v9;
  NSURL *rootDirectoryURL;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  NSURL *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  KVGetOrCreateDirectoryURL();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (__CFString *)0;

  if (v3)
  {
    -[CKVTaskManager _loadOrCreateTaskInfo](self, "_loadOrCreateTaskInfo");
    -[CKVTaskManagerInfo schemaVersion](self->_info, "schemaVersion");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(&unk_1E4D31BE0, "isEqual:", v5) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      v8 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
      {
        v9 = CFSTR("empty");
        *(_DWORD *)buf = 136315650;
        v13 = "-[CKVTaskManager _validateFilesystemState]";
        v14 = 2112;
        if (v5)
          v9 = v5;
        v15 = (NSURL *)&unk_1E4D31BE0;
        v16 = 2112;
        v17 = v9;
        _os_log_impl(&dword_1A48B3000, v8, OS_LOG_TYPE_INFO, "%s Current schema (expected: %@) not initialized yet (found: %@)", buf, 0x20u);
      }
      v6 = -[CKVTaskManager clearAllState](self, "clearAllState");
    }

  }
  else
  {
    v7 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      rootDirectoryURL = self->_rootDirectoryURL;
      *(_DWORD *)buf = 136315650;
      v13 = "-[CKVTaskManager _validateFilesystemState]";
      v14 = 2112;
      v15 = rootDirectoryURL;
      v16 = 2112;
      v17 = v4;
      _os_log_error_impl(&dword_1A48B3000, v7, OS_LOG_TYPE_ERROR, "%s Failed to resolve / create root directory: %@ error: %@", buf, 0x20u);
    }
    v6 = 0;
  }

  return v6;
}

- (BOOL)_loadOrCreateTaskInfo
{
  CKVTaskManagerInfo *v3;
  NSURL *rootDirectoryURL;
  CKVTaskManagerInfo *v5;
  id v6;
  CKVTaskManagerInfo *info;
  CKVTaskManagerInfo *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = [CKVTaskManagerInfo alloc];
  rootDirectoryURL = self->_rootDirectoryURL;
  v11 = 0;
  v5 = -[CKVTaskManagerInfo initWithRootDirectoryURL:error:](v3, "initWithRootDirectoryURL:error:", rootDirectoryURL, &v11);
  v6 = v11;
  info = self->_info;
  self->_info = v5;

  v8 = self->_info;
  if (!v8)
  {
    v9 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[CKVTaskManager _loadOrCreateTaskInfo]";
      v14 = 2112;
      v15 = v6;
      _os_log_error_impl(&dword_1A48B3000, v9, OS_LOG_TYPE_ERROR, "%s Failed to load / create info: %@", buf, 0x16u);
    }
  }

  return v8 != 0;
}

- (BOOL)clearAllState
{
  NSObject *v3;
  NSURL *rootDirectoryURL;
  int v5;
  NSURL *v6;
  void *v7;
  NSURL *v8;
  CKVTaskManagerInfo *info;
  BOOL v10;
  NSObject *v11;
  BOOL v12;
  uint64_t v13;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  NSURL *v18;
  id v19[3];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  NSURL *v23;
  __int16 v24;
  NSURL *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    rootDirectoryURL = self->_rootDirectoryURL;
    *(_DWORD *)buf = 136315394;
    v21 = "-[CKVTaskManager clearAllState]";
    v22 = 2112;
    v23 = rootDirectoryURL;
    _os_log_impl(&dword_1A48B3000, v3, OS_LOG_TYPE_INFO, "%s Clearing root directory: %@", buf, 0x16u);
  }
  v19[2] = 0;
  v5 = KVRemoveItemIfExistsAtURL();
  v6 = (NSURL *)0;
  if (!v5)
  {
LABEL_9:
    v13 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      v18 = self->_rootDirectoryURL;
      *(_DWORD *)buf = 136315650;
      v21 = "-[CKVTaskManager clearAllState]";
      v22 = 2112;
      v23 = v18;
      v24 = 2112;
      v25 = v6;
      v15 = "%s Failed to reset task handler root directory (%@) error: %@";
      v16 = v13;
      v17 = 32;
      goto LABEL_15;
    }
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  v19[1] = v6;
  KVGetOrCreateDirectoryURL();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;

  if (!v7)
  {
    v6 = v8;
    goto LABEL_9;
  }
  -[CKVTaskManager _loadOrCreateTaskInfo](self, "_loadOrCreateTaskInfo");
  info = self->_info;
  v19[0] = v8;
  v10 = -[CKVTaskManagerInfo updateSchemaVersion:error:](info, "updateSchemaVersion:error:", &unk_1E4D31BE0, v19);
  v6 = (NSURL *)v19[0];

  v11 = CKLogContextVocabulary;
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[CKVTaskManager clearAllState]";
      v22 = 2112;
      v23 = v6;
      v15 = "%s Failed to record schema version: %@";
      v16 = v11;
      v17 = 22;
LABEL_15:
      _os_log_error_impl(&dword_1A48B3000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  v12 = 1;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[CKVTaskManager clearAllState]";
    v22 = 2112;
    v23 = (NSURL *)&unk_1E4D31BE0;
    _os_log_impl(&dword_1A48B3000, v11, OS_LOG_TYPE_INFO, "%s Root directory initialized with schema version: %@", buf, 0x16u);
  }
LABEL_11:

  return v12;
}

- (BOOL)_didTriggerMigration:(id)a3 reason:(unsigned __int16)a4
{
  uint64_t v4;
  void (**v6)(_QWORD);
  BOOL v7;
  NSObject *v8;
  _BOOL4 v9;
  NSString *managerName;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  unsigned __int16 v18;
  NSObject *v19;
  BOOL v20;
  NSString *v21;
  const char *v22;
  NSString *v23;
  void (**v25)(_QWORD);
  _QWORD block[5];
  void (**v27)(_QWORD);
  _QWORD v28[4];
  NSObject *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  NSString *v38;
  uint64_t v39;

  v4 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a3;
  if (-[CKVTaskSettings isTaskEnabled:reason:](self->_settings, "isTaskEnabled:reason:", 103, v4))
  {
    v7 = -[CKVTaskManagerInfo shouldRunMigration](self->_info, "shouldRunMigration");
    v8 = CKLogContextVocabulary;
    v9 = os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v9)
      {
        managerName = self->_managerName;
        *(_DWORD *)buf = 136315394;
        v36 = "-[CKVTaskManager _didTriggerMigration:reason:]";
        v37 = 2112;
        v38 = managerName;
        _os_log_impl(&dword_1A48B3000, v8, OS_LOG_TYPE_INFO, "%s (%@) Starting migration.", buf, 0x16u);
      }
      -[CKVTaskSettings refreshLocalization](self->_settings, "refreshLocalization", v6);
      v11 = dispatch_group_create();
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      objc_msgSend((id)objc_opt_class(), "migrationDonateTasks");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      v14 = MEMORY[0x1E0C809B0];
      if (v13)
      {
        v15 = v13;
        v16 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v31 != v16)
              objc_enumerationMutation(v12);
            v18 = objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "unsignedIntValue");
            dispatch_group_enter(v11);
            v28[0] = v14;
            v28[1] = 3221225472;
            v28[2] = __46__CKVTaskManager__didTriggerMigration_reason___block_invoke;
            v28[3] = &unk_1E4D294D8;
            v29 = v11;
            -[CKVTaskManager handleTask:reason:shouldDefer:completion:](self, "handleTask:reason:shouldDefer:completion:", v18, 1, 0, v28);

          }
          v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v15);
      }

      v19 = dispatch_queue_create("DonateAll", 0);
      block[0] = v14;
      block[1] = 3221225472;
      block[2] = __46__CKVTaskManager__didTriggerMigration_reason___block_invoke_2;
      block[3] = &unk_1E4D29500;
      block[4] = self;
      v6 = v25;
      v27 = v25;
      dispatch_group_notify(v11, v19, block);

      v20 = 1;
      goto LABEL_21;
    }
    if (v9)
    {
      v23 = self->_managerName;
      *(_DWORD *)buf = 136315394;
      v36 = "-[CKVTaskManager _didTriggerMigration:reason:]";
      v37 = 2112;
      v38 = v23;
      v22 = "%s (%@) Migration not required";
      goto LABEL_17;
    }
  }
  else
  {
    v8 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      v21 = self->_managerName;
      *(_DWORD *)buf = 136315394;
      v36 = "-[CKVTaskManager _didTriggerMigration:reason:]";
      v37 = 2112;
      v38 = v21;
      v22 = "%s (%@) Skipping migration as vocabulary donation is not enabled on this platform.";
LABEL_17:
      _os_log_impl(&dword_1A48B3000, v8, OS_LOG_TYPE_INFO, v22, buf, 0x16u);
    }
  }
  if (v6)
    v6[2](v6);
  v20 = 0;
LABEL_21:

  return v20;
}

- (BOOL)_didLocalizationChange:(unsigned __int16)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void (**v24)(void);
  CKVTaskManagerInfo *info;
  BOOL v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  NSObject *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v3 = a3;
  v44 = *MEMORY[0x1E0C80C00];
  -[CKVTaskManagerInfo siriLanguageCode](self->_info, "siriLanguageCode");
  v5 = objc_claimAutoreleasedReturnValue();
  -[CKVTaskManagerInfo dictationLanguageCodes](self->_info, "dictationLanguageCodes");
  v6 = objc_claimAutoreleasedReturnValue();
  -[CKVTaskSettings localization](self->_settings, "localization");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "siriLanguageCode");
  v8 = objc_claimAutoreleasedReturnValue();

  -[CKVTaskSettings localization](self->_settings, "localization");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictationLanguageCodes");
  v10 = objc_claimAutoreleasedReturnValue();

  if (v8 | v5)
    v11 = objc_msgSend((id)v8, "isEqual:", v5) ^ 1;
  else
    v11 = 0;
  v12 = v10 | v6;
  if (v10 | v6)
    v12 = objc_msgSend((id)v10, "isEqual:", v6) ^ 1;
  LODWORD(v13) = v11 | v12;
  v14 = (void *)CKLogContextVocabulary;
  v15 = os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO);
  if ((_DWORD)v13 == 1)
  {
    if (v15)
    {
      v16 = v14;
      _localizationDescription((void *)v8, (void *)v10);
      v13 = objc_claimAutoreleasedReturnValue();
      _localizationDescription((void *)v5, (void *)v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v39 = "-[CKVTaskManager _didLocalizationChange:]";
      v40 = 2112;
      v41 = v13;
      v42 = 2112;
      v43 = v17;
      _os_log_impl(&dword_1A48B3000, v16, OS_LOG_TYPE_INFO, "%s Refreshed localization settings: %@ differ from stored settings: %@", buf, 0x20u);

      LOBYTE(v13) = 1;
    }
    if ((v11 & 1) != 0)
    {
      v31 = v5;
      v18 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v39 = "-[CKVTaskManager _didLocalizationChange:]";
        _os_log_impl(&dword_1A48B3000, v18, OS_LOG_TYPE_INFO, "%s Triggering Siri-language dependent donations", buf, 0xCu);
      }
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      objc_msgSend((id)objc_opt_class(), "siriLanguageDependentDonateTasks");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v34 != v22)
              objc_enumerationMutation(v19);
            -[CKVTaskManager _taskBlockForTask:reason:shouldDefer:](self, "_taskBlockForTask:reason:shouldDefer:", (unsigned __int16)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "unsignedIntValue"), v3, 0);
            v24 = (void (**)(void))objc_claimAutoreleasedReturnValue();
            v24[2]();

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v21);
      }

      v5 = v31;
      LOBYTE(v13) = 1;
    }
    info = self->_info;
    v32 = 0;
    v26 = -[CKVTaskManagerInfo updateSiriLanguageCode:dictationLanguageCodes:error:](info, "updateSiriLanguageCode:dictationLanguageCodes:error:", v8, v10, &v32);
    v27 = v32;
    if (!v26)
    {
      v28 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v39 = "-[CKVTaskManager _didLocalizationChange:]";
        v40 = 2112;
        v41 = v27;
        _os_log_error_impl(&dword_1A48B3000, v28, OS_LOG_TYPE_ERROR, "%s Failed to record updated localization: %@", buf, 0x16u);
      }
    }
    goto LABEL_25;
  }
  if (v15)
  {
    v27 = v14;
    _localizationDescription((void *)v5, (void *)v6);
    v29 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v39 = "-[CKVTaskManager _didLocalizationChange:]";
    v40 = 2112;
    v41 = v29;
    _os_log_impl(&dword_1A48B3000, v27, OS_LOG_TYPE_INFO, "%s Refreshed localization settings unchanged from stored settings: %@", buf, 0x16u);

LABEL_25:
  }

  return (char)v13;
}

- (id)_maintenanceTaskBlockWithReason:(unsigned __int16)a3 shouldDefer:(id)a4
{
  _QWORD v5[5];
  unsigned __int16 v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__CKVTaskManager__maintenanceTaskBlockWithReason_shouldDefer___block_invoke;
  v5[3] = &unk_1E4D29528;
  v5[4] = self;
  v6 = a3;
  return _Block_copy(v5);
}

- (id)_siriLanguageChangedTaskBlockWithReason:(unsigned __int16)a3
{
  _QWORD v4[5];
  unsigned __int16 v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__CKVTaskManager__siriLanguageChangedTaskBlockWithReason___block_invoke;
  v4[3] = &unk_1E4D29528;
  v4[4] = self;
  v5 = a3;
  return _Block_copy(v4);
}

- (id)_wakePodcastsTaskBlockWithReason:(unsigned __int16)a3
{
  _QWORD aBlock[4];
  unsigned __int16 v5;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__CKVTaskManager__wakePodcastsTaskBlockWithReason___block_invoke;
  aBlock[3] = &__block_descriptor_34_e5_v8__0l;
  v5 = a3;
  return _Block_copy(aBlock);
}

- (id)_findInstalledAppSet
{
  CCSetEnumerator *setEnumerator;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  setEnumerator = self->_setEnumerator;
  v12 = 0;
  -[CCSetEnumerator allSetsWithItemType:error:](setEnumerator, "allSetsWithItemType:error:", 36434, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (v4)
  {
    -[CKVTaskManager _descriptorForSiriLocale](self, "_descriptorForSiriLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKVTaskManager _firstSetWithItemType:matchingDescriptor:inSets:](self, "_firstSetWithItemType:matchingDescriptor:inSets:", 36434, v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = v7;
    }
    else
    {
      v10 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v14 = "-[CKVTaskManager _findInstalledAppSet]";
        v15 = 2112;
        v16 = v4;
        _os_log_error_impl(&dword_1A48B3000, v10, OS_LOG_TYPE_ERROR, "%s Failed to find expected InstalledApp set in sets: %@", buf, 0x16u);
      }
    }

  }
  else
  {
    v9 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[CKVTaskManager _findInstalledAppSet]";
      v15 = 2112;
      v16 = v5;
      _os_log_error_impl(&dword_1A48B3000, v9, OS_LOG_TYPE_ERROR, "%s Failed to enumerate sets: %@", buf, 0x16u);
    }
    v7 = 0;
  }

  return v7;
}

- (id)_findContactSet
{
  CCSetEnumerator *setEnumerator;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  setEnumerator = self->_setEnumerator;
  v12 = 0;
  -[CCSetEnumerator allSetsWithItemType:error:](setEnumerator, "allSetsWithItemType:error:", 19668, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (v4)
  {
    -[CKVTaskManager _firstSetWithItemType:inSets:](self, "_firstSetWithItemType:inSets:", 19668, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      v10 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v14 = "-[CKVTaskManager _findContactSet]";
        v15 = 2112;
        v16 = v4;
        _os_log_error_impl(&dword_1A48B3000, v10, OS_LOG_TYPE_ERROR, "%s Failed to find expected Contact set in sets: %@", buf, 0x16u);
      }
    }

  }
  else
  {
    v9 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[CKVTaskManager _findContactSet]";
      v15 = 2112;
      v16 = v5;
      _os_log_error_impl(&dword_1A48B3000, v9, OS_LOG_TYPE_ERROR, "%s Failed to enumerate sets: %@", buf, 0x16u);
    }
    v7 = 0;
  }

  return v7;
}

- (void)_runInstalledAppDerivativeTasksWithReason:(unsigned __int16)a3
{
  uint64_t v3;
  void (**v5)(void);
  void (**v6)(void);

  v3 = a3;
  -[CKVTaskManager _derivativeTaskBlockForTask:reason:](self, "_derivativeTaskBlockForTask:reason:", 9, a3);
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v5[2]();
  -[CKVTaskManager _taskBlockForTask:reason:shouldDefer:](self, "_taskBlockForTask:reason:shouldDefer:", 105, v3, 0);
  v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();

  v6[2]();
}

- (id)_blockToCollectInstalledAppBundleIds:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD aBlock[4];
  id v8;

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__CKVTaskManager__blockToCollectInstalledAppBundleIds___block_invoke;
  aBlock[3] = &unk_1E4D29570;
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);

  return v5;
}

- (id)_cleanUpDeletedAppDonationsTaskBlock:(unsigned __int16)a3
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__CKVTaskManager__cleanUpDeletedAppDonationsTaskBlock___block_invoke;
  aBlock[3] = &unk_1E4D294D8;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

- (BOOL)_isSet:(id)a3 excludedFromInstalledAppBundleIds:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  BOOL v11;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "descriptorWithKey:", *MEMORY[0x1E0D0D3C8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (!objc_msgSend(v6, "containsObject:", v8))
    {
      v11 = 1;
      goto LABEL_9;
    }
    v9 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_DEBUG))
    {
      v13 = 136315650;
      v14 = "-[CKVTaskManager _isSet:excludedFromInstalledAppBundleIds:]";
      v15 = 2112;
      v16 = v5;
      v17 = 2112;
      v18 = v8;
      _os_log_debug_impl(&dword_1A48B3000, v9, OS_LOG_TYPE_DEBUG, "%s No cleanup required for set: %@ which is associated with installed app: %@", (uint8_t *)&v13, 0x20u);
    }
  }
  else
  {
    v10 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      v13 = 136315394;
      v14 = "-[CKVTaskManager _isSet:excludedFromInstalledAppBundleIds:]";
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1A48B3000, v10, OS_LOG_TYPE_INFO, "%s Skipping cleanup for set: %@ with no sourceIdentifier", (uint8_t *)&v13, 0x16u);
    }
  }
  v11 = 0;
LABEL_9:

  return v11;
}

- (BOOL)_isClearRequiredForSet:(id)a3 installedAppBundleIds:(id)a4
{
  id v6;
  id v7;
  int v8;
  BOOL v9;
  int v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "itemType");
  v9 = 0;
  if (v8 <= 14024)
  {
    if (v8 == 3615)
      goto LABEL_8;
    v10 = 8194;
  }
  else
  {
    if (v8 == 14025 || v8 == 36059)
      goto LABEL_8;
    v10 = 34307;
  }
  if (v8 != v10)
    goto LABEL_15;
LABEL_8:
  if (!-[CKVTaskManager _isSet:excludedFromInstalledAppBundleIds:](self, "_isSet:excludedFromInstalledAppBundleIds:", v6, v7))
  {
LABEL_14:
    v9 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v6, "changePublisher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "localItemInstanceCount");

  v13 = CKLogContextVocabulary;
  if (!v12)
  {
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_DEBUG))
    {
      v16 = 136315394;
      v17 = "-[CKVTaskManager _isClearRequiredForSet:installedAppBundleIds:]";
      v18 = 2112;
      v19 = v6;
      _os_log_debug_impl(&dword_1A48B3000, v13, OS_LOG_TYPE_DEBUG, "%s Skipping clear for already empty set: %@", (uint8_t *)&v16, 0x16u);
    }
    goto LABEL_14;
  }
  v9 = 1;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    v14 = v13;
    v16 = 136315906;
    v17 = "-[CKVTaskManager _isClearRequiredForSet:installedAppBundleIds:]";
    v18 = 2112;
    v19 = v6;
    v20 = 1024;
    v21 = v12;
    v22 = 1024;
    v23 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1A48B3000, v14, OS_LOG_TYPE_INFO, "%s Clear required for set: %@ with %u local item instances whose sourceIdentifier does not match any of the %u installed appBundleIds", (uint8_t *)&v16, 0x22u);

  }
LABEL_15:

  return v9;
}

- (BOOL)_isDeleteRequiredForSet:(id)a3 installedAppBundleIds:(id)a4
{
  id v6;
  id v7;
  int v8;
  BOOL v9;
  int v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "itemType");
  v9 = 0;
  if (v8 > 25882)
  {
    if (v8 <= 38250)
    {
      if (v8 > 32964)
      {
        if (v8 == 32965 || v8 == 34307)
          goto LABEL_37;
        v10 = 36059;
      }
      else
      {
        if (v8 == 25883 || v8 == 26512)
          goto LABEL_37;
        v10 = 30598;
      }
    }
    else if (v8 <= 47340)
    {
      if (v8 == 38251 || v8 == 42611)
        goto LABEL_37;
      v10 = 44935;
    }
    else if (v8 > 61351)
    {
      if (v8 == 63369)
        goto LABEL_37;
      v10 = 61352;
    }
    else
    {
      if (v8 == 47341)
        goto LABEL_37;
      v10 = 53482;
    }
LABEL_36:
    if (v8 != v10)
      goto LABEL_42;
    goto LABEL_37;
  }
  if (v8 <= 12009)
  {
    if (v8 > 7718)
    {
      if (v8 == 7719 || v8 == 7822)
        goto LABEL_37;
      v10 = 8194;
    }
    else
    {
      if (v8 == 800 || v8 == 3615)
        goto LABEL_37;
      v10 = 5595;
    }
    goto LABEL_36;
  }
  if (v8 <= 14705)
  {
    if (v8 == 12010 || v8 == 13884)
      goto LABEL_37;
    v10 = 14025;
    goto LABEL_36;
  }
  if (v8 > 15571)
  {
    if (v8 == 15572)
      goto LABEL_37;
    v10 = 16251;
    goto LABEL_36;
  }
  if (v8 != 14706)
  {
    v10 = 14816;
    goto LABEL_36;
  }
LABEL_37:
  if (!-[CKVTaskManager _isSet:excludedFromInstalledAppBundleIds:](self, "_isSet:excludedFromInstalledAppBundleIds:", v6, v7))
  {
LABEL_41:
    v9 = 0;
    goto LABEL_42;
  }
  objc_msgSend(v6, "changePublisher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "sharedItemCount");

  v13 = CKLogContextVocabulary;
  v14 = os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v14)
    {
      v17 = 136315650;
      v18 = "-[CKVTaskManager _isDeleteRequiredForSet:installedAppBundleIds:]";
      v19 = 2112;
      v20 = v6;
      v21 = 1024;
      v22 = v12;
      _os_log_impl(&dword_1A48B3000, v13, OS_LOG_TYPE_INFO, "%s Skipping delete for nonempty set: %@ with %u shared items", (uint8_t *)&v17, 0x1Cu);
    }
    goto LABEL_41;
  }
  if (v14)
  {
    v16 = v13;
    v17 = 136315650;
    v18 = "-[CKVTaskManager _isDeleteRequiredForSet:installedAppBundleIds:]";
    v19 = 2112;
    v20 = v6;
    v21 = 1024;
    v22 = objc_msgSend(v7, "count");
    v9 = 1;
    _os_log_impl(&dword_1A48B3000, v16, OS_LOG_TYPE_INFO, "%s Delete required for empty set: %@ whose sourceIdentifier does not match any of the %u installed appBundleIds", (uint8_t *)&v17, 0x1Cu);

  }
  else
  {
    v9 = 1;
  }
LABEL_42:

  return v9;
}

- (void)enableSimulatedTasks:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[CKVDonateTaskProvider enableSimulatedTasks:](self->_donateTaskProvider, "enableSimulatedTasks:");
  -[CKVTaskSettings setTaskCoalescenceDisabled:](self->_settings, "setTaskCoalescenceDisabled:", v3);
}

- (id)_wrapperForTaskBlock:(id)a3 checkingEnablement:(unsigned __int16)a4 reason:(unsigned __int16)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD aBlock[5];
  id v13;
  unsigned __int16 v14;
  unsigned __int16 v15;

  v8 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__CKVTaskManager__wrapperForTaskBlock_checkingEnablement_reason___block_invoke;
  aBlock[3] = &unk_1E4D295E8;
  aBlock[4] = self;
  v13 = v8;
  v14 = a4;
  v15 = a5;
  v9 = v8;
  v10 = _Block_copy(aBlock);

  return v10;
}

- (id)_firstSetWithItemType:(unsigned __int16)a3 inSets:(id)a4
{
  return -[CKVTaskManager _firstSetWithItemType:matchingDescriptor:inSets:](self, "_firstSetWithItemType:matchingDescriptor:inSets:", a3, 0, a4);
}

- (id)_firstSetWithItemType:(unsigned __int16)a3 matchingDescriptor:(id)a4 inSets:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  const char *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id obj;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  const char *v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  id v75;
  __int16 v76;
  id v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v6 = a3;
  v81 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v67 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        if (objc_msgSend(v15, "itemType") == (_DWORD)v6)
          objc_msgSend(v9, "addObject:", v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v9, "count") < 2)
    {
      if (objc_msgSend(v9, "count") == 1)
      {
        v38 = (void *)CKLogContextVocabulary;
        if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
        {
          v39 = (void *)MEMORY[0x1E0D3E4C0];
          v40 = v38;
          objc_msgSend(v39, "descriptionForTypeIdentifier:", v6);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v71 = "-[CKVTaskManager _firstSetWithItemType:matchingDescriptor:inSets:]";
          v72 = 2112;
          v73 = (uint64_t)v41;
          v74 = 2112;
          v75 = v16;
          _os_log_impl(&dword_1A48B3000, v40, OS_LOG_TYPE_INFO, "%s Exactly one set found with itemType: %@ set: %@", buf, 0x20u);

        }
      }
    }
    else
    {
      v17 = (void *)CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
      {
        v18 = (void *)MEMORY[0x1E0D3E4C0];
        v19 = v17;
        objc_msgSend(v18, "descriptionForTypeIdentifier:", v6);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v71 = "-[CKVTaskManager _firstSetWithItemType:matchingDescriptor:inSets:]";
        v72 = 2112;
        v73 = (uint64_t)v20;
        v74 = 2112;
        v75 = v9;
        _os_log_impl(&dword_1A48B3000, v19, OS_LOG_TYPE_INFO, "%s More than one set with itemType: %@ sets: %@", buf, 0x20u);

      }
      if (v7)
      {
        v53 = v16;
        v54 = v10;
        v57 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        v55 = v9;
        obj = v9;
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v79, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v63;
          do
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v63 != v23)
                objc_enumerationMutation(obj);
              v25 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
              v58 = 0u;
              v59 = 0u;
              v60 = 0u;
              v61 = 0u;
              objc_msgSend(v25, "descriptors");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v58, v78, 16);
              if (v27)
              {
                v28 = v27;
                v29 = *(_QWORD *)v59;
                while (2)
                {
                  for (k = 0; k != v28; ++k)
                  {
                    if (*(_QWORD *)v59 != v29)
                      objc_enumerationMutation(v26);
                    if (objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * k), "isEqual:", v7))
                    {
                      objc_msgSend(v57, "addObject:", v25);
                      goto LABEL_30;
                    }
                  }
                  v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v58, v78, 16);
                  if (v28)
                    continue;
                  break;
                }
              }
LABEL_30:

            }
            v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v79, 16);
          }
          while (v22);
        }

        if (objc_msgSend(v57, "count") == 1)
        {
          objc_msgSend(v57, "firstObject");
          v31 = objc_claimAutoreleasedReturnValue();

          v32 = (void *)CKLogContextVocabulary;
          v10 = v54;
          v9 = v55;
          if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
          {
            v33 = (void *)MEMORY[0x1E0D3E4C0];
            v34 = v32;
            objc_msgSend(v33, "descriptionForTypeIdentifier:", v6);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315906;
            v71 = "-[CKVTaskManager _firstSetWithItemType:matchingDescriptor:inSets:]";
            v72 = 2112;
            v73 = v31;
            v74 = 2112;
            v75 = v35;
            v76 = 2112;
            v77 = v7;
            v36 = "%s Found set: %@ with itemType: %@ and descriptor: %@";
LABEL_46:
            _os_log_impl(&dword_1A48B3000, v34, OS_LOG_TYPE_INFO, v36, buf, 0x2Au);

          }
        }
        else
        {
          v10 = v54;
          v9 = v55;
          if ((unint64_t)objc_msgSend(v57, "count") < 2)
          {
            v45 = (void *)CKLogContextVocabulary;
            if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
            {
              v46 = (void *)MEMORY[0x1E0D3E4C0];
              v47 = v45;
              objc_msgSend(v46, "descriptionForTypeIdentifier:", v6);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315906;
              v71 = "-[CKVTaskManager _firstSetWithItemType:matchingDescriptor:inSets:]";
              v72 = 2112;
              v73 = (uint64_t)v48;
              v74 = 2112;
              v75 = v7;
              v76 = 2112;
              v77 = obj;
              _os_log_impl(&dword_1A48B3000, v47, OS_LOG_TYPE_INFO, "%s No sets have itemType: %@ and descriptor: %@. Arbitrarily selecting the first of sets: %@", buf, 0x2Au);

            }
            v31 = (uint64_t)v53;
            goto LABEL_50;
          }
          objc_msgSend(v57, "firstObject");
          v31 = objc_claimAutoreleasedReturnValue();

          v43 = (void *)CKLogContextVocabulary;
          if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
          {
            v44 = (void *)MEMORY[0x1E0D3E4C0];
            v34 = v43;
            objc_msgSend(v44, "descriptionForTypeIdentifier:", v6);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315906;
            v71 = "-[CKVTaskManager _firstSetWithItemType:matchingDescriptor:inSets:]";
            v72 = 2112;
            v73 = (uint64_t)v35;
            v74 = 2112;
            v75 = v7;
            v76 = 2112;
            v77 = v57;
            v36 = "%s Multiple sets with itemType: %@ have descriptor: %@ arbitrarily selecting the first set: %@";
            goto LABEL_46;
          }
        }
LABEL_50:

        v16 = (void *)v31;
        goto LABEL_51;
      }
      v42 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v71 = "-[CKVTaskManager _firstSetWithItemType:matchingDescriptor:inSets:]";
        v72 = 2112;
        v73 = (uint64_t)v16;
        _os_log_impl(&dword_1A48B3000, v42, OS_LOG_TYPE_INFO, "%s Arbitratily selecting the first set: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v37 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      v50 = (void *)MEMORY[0x1E0D3E4C0];
      v51 = v37;
      objc_msgSend(v50, "descriptionForTypeIdentifier:", v6);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v71 = "-[CKVTaskManager _firstSetWithItemType:matchingDescriptor:inSets:]";
      v72 = 2112;
      v73 = (uint64_t)v52;
      v74 = 2112;
      v75 = v10;
      _os_log_error_impl(&dword_1A48B3000, v51, OS_LOG_TYPE_ERROR, "%s No set found with itemType: %@ from sets: %@", buf, 0x20u);

    }
    v16 = 0;
  }
LABEL_51:

  return v16;
}

- (id)_descriptorForSiriLocale
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[CKVTaskSettings localization](self->_settings, "localization");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "siriLanguageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKVLocalization supportedNSLocaleFromLanguageCode:](CKVLocalization, "supportedNSLocaleFromLanguageCode:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D0D418]);
  v6 = *MEMORY[0x1E0D0D3C0];
  objc_msgSend(v4, "localeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v8 = (void *)objc_msgSend(v5, "initWithKey:value:error:", v6, v7, &v12);
  v9 = v12;

  v10 = CKLogContextVocabulary;
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v14 = "-[CKVTaskManager _descriptorForSiriLocale]";
      v15 = 2112;
      v16 = v8;
      v17 = 2112;
      v18 = v3;
      _os_log_impl(&dword_1A48B3000, v10, OS_LOG_TYPE_INFO, "%s Resolved locale descriptor: %@ from siriLanguageCode: %@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v14 = "-[CKVTaskManager _descriptorForSiriLocale]";
    v15 = 2112;
    v16 = v3;
    v17 = 2112;
    v18 = v9;
    _os_log_error_impl(&dword_1A48B3000, v10, OS_LOG_TYPE_ERROR, "%s Failed to resolve locale descriptor from siriLanguageCode: %@ error: %@", buf, 0x20u);
  }

  return v8;
}

- (void)_enumerateLocalInstancesOfSet:(id)a3 hasDelta:(BOOL *)a4 fromBookmark:(BOOL *)a5
{
  id v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  BOOL v14;
  id v15;
  id v16;
  int v17;
  id v18;
  void *v19;
  char v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[CKVTaskManagerInfo changeRegistry](self->_info, "changeRegistry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bookmarkForSet:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v11 = -[CKVTaskManager _enumerateLocalInstancesOfSet:priorBookmark:newBookmark:hasDelta:addedInstancesBlock:](self, "_enumerateLocalInstancesOfSet:priorBookmark:newBookmark:hasDelta:addedInstancesBlock:", v8, v10, &v25, a4, 0);
  v12 = v25;
  if (!v10 || v11)
  {
    if (!v11)
    {
      v16 = 0;
      if (!a5)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else
  {
    v13 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[CKVTaskManager _enumerateLocalInstancesOfSet:hasDelta:fromBookmark:]";
      v28 = 2112;
      v29 = v8;
      _os_log_impl(&dword_1A48B3000, v13, OS_LOG_TYPE_INFO, "%s Retrying enumeration without a bookmark for set: %@", buf, 0x16u);
    }

    v24 = v12;
    v14 = -[CKVTaskManager _enumerateLocalInstancesOfSet:priorBookmark:newBookmark:hasDelta:addedInstancesBlock:](self, "_enumerateLocalInstancesOfSet:priorBookmark:newBookmark:hasDelta:addedInstancesBlock:", v8, 0, &v24, 0, 0);
    v15 = v24;

    v10 = 0;
    v16 = 0;
    v12 = v15;
    if (!v14)
      goto LABEL_15;
  }
  v23 = 0;
  v17 = objc_msgSend(v9, "updateBookmark:forSet:error:", v12, v8, &v23);
  v18 = v23;
  v19 = v18;
  if (v17)
  {
    v22 = v18;
    v20 = objc_msgSend(v9, "commitAllBookmarkUpdates:", &v22);
    v16 = v22;

    if ((v20 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
    v16 = v18;
  }
  v21 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v27 = "-[CKVTaskManager _enumerateLocalInstancesOfSet:hasDelta:fromBookmark:]";
    v28 = 2112;
    v29 = v8;
    v30 = 2112;
    v31 = v16;
    _os_log_error_impl(&dword_1A48B3000, v21, OS_LOG_TYPE_ERROR, "%s Failed to commit registry update for set: %@ error: %@", buf, 0x20u);
    if (!a5)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_15:
  if (a5)
LABEL_16:
    *a5 = v10 != 0;
LABEL_17:

}

- (BOOL)_enumerateLocalInstancesOfSet:(id)a3 priorBookmark:(id)a4 newBookmark:(id *)a5 hasDelta:(BOOL *)a6 addedInstancesBlock:(id)a7
{
  uint64_t (*v10)(uint64_t, uint64_t);
  id v11;
  id v12;
  NSObject *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  id v18;
  id v19;
  int v20;
  int v21;
  NSObject *v22;
  BOOL v23;
  int v24;
  const __CFString *v25;
  NSObject *v26;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  _QWORD v33[4];
  uint64_t (*v34)(uint64_t, uint64_t);
  _BYTE *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  uint8_t v49[4];
  const char *v50;
  __int16 v51;
  _BYTE v52[10];
  __int16 v53;
  const __CFString *v54;
  __int16 v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  _BYTE buf[24];
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v10 = (uint64_t (*)(uint64_t, uint64_t))a3;
  v11 = a4;
  v12 = a7;
  v13 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    v14 = CFSTR("prior bookmark");
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[CKVTaskManager _enumerateLocalInstancesOfSet:priorBookmark:newBookmark:hasDelta:addedInstancesBlock:]";
    *(_WORD *)&buf[12] = 2112;
    if (!v11)
      v14 = CFSTR("NO bookmark");
    *(_QWORD *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2112;
    v58 = v10;
    _os_log_impl(&dword_1A48B3000, v13, OS_LOG_TYPE_INFO, "%s Enumerating from %@ for set: %@", buf, 0x20u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v58 = __Block_byref_object_copy__1628;
  v59 = __Block_byref_object_dispose__1629;
  v60 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 1;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  objc_msgSend(v10, "changePublisher");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __103__CKVTaskManager__enumerateLocalInstancesOfSet_priorBookmark_newBookmark_hasDelta_addedInstancesBlock___block_invoke;
  v33[3] = &unk_1E4D29610;
  v35 = buf;
  v17 = v10;
  v34 = v17;
  v36 = &v45;
  v29[0] = v16;
  v29[1] = 3221225472;
  v29[2] = __103__CKVTaskManager__enumerateLocalInstancesOfSet_priorBookmark_newBookmark_hasDelta_addedInstancesBlock___block_invoke_93;
  v29[3] = &unk_1E4D29638;
  v31 = &v41;
  v32 = &v37;
  v18 = v12;
  v30 = v18;
  v19 = (id)objc_msgSend(v15, "sinkWithBookmark:completion:receiveInput:", v11, v33, v29);

  v20 = *((unsigned __int8 *)v46 + 24);
  if (*((_BYTE *)v46 + 24))
  {
    v21 = *((_DWORD *)v42 + 6);
    if (v21 || *((_DWORD *)v38 + 6))
    {
      v22 = CKLogContextVocabulary;
      v23 = 1;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
      {
        v24 = *((_DWORD *)v38 + 6);
        v25 = CFSTR("prior");
        if (!v11)
          v25 = CFSTR("nil");
        *(_DWORD *)v49 = 136316162;
        v50 = "-[CKVTaskManager _enumerateLocalInstancesOfSet:priorBookmark:newBookmark:hasDelta:addedInstancesBlock:]";
        v51 = 1024;
        *(_DWORD *)v52 = v21;
        *(_WORD *)&v52[4] = 1024;
        *(_DWORD *)&v52[6] = v24;
        v53 = 2112;
        v54 = v25;
        v55 = 2112;
        v56 = v17;
        _os_log_impl(&dword_1A48B3000, v22, OS_LOG_TYPE_INFO, "%s Completed local instance enumeration counting %u adds and %u removes from %@ bookmark for set: %@", v49, 0x2Cu);
      }
    }
    else
    {
      v26 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v49 = 136315394;
        v50 = "-[CKVTaskManager _enumerateLocalInstancesOfSet:priorBookmark:newBookmark:hasDelta:addedInstancesBlock:]";
        v51 = 2112;
        *(_QWORD *)v52 = v17;
        _os_log_impl(&dword_1A48B3000, v26, OS_LOG_TYPE_INFO, "%s Completed enumeration with no local changes to set: %@", v49, 0x16u);
      }
      v23 = 0;
    }
    if (a6)
      *a6 = v23;
    if (a5)
      *a5 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  }

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(buf, 8);

  return v20 != 0;
}

- (void)_postNotification:(const char *)a3 forChangeToItemType:(unsigned __int16)a4
{
  uint64_t v4;
  CCSetEnumerator *setEnumerator;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  char v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  setEnumerator = self->_setEnumerator;
  v17 = 0;
  -[CCSetEnumerator allSetsWithItemType:error:](setEnumerator, "allSetsWithItemType:error:", a4, &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;
  if (v8)
  {
    -[CKVTaskManager _firstSetWithItemType:inSets:](self, "_firstSetWithItemType:inSets:", v4, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v16 = 0;
      -[CKVTaskManager _enumerateLocalInstancesOfSet:hasDelta:fromBookmark:](self, "_enumerateLocalInstancesOfSet:hasDelta:fromBookmark:", v10, &v16, 0);
      if (v16)
      {
        notify_post(a3);
        v11 = (void *)CKLogContextVocabulary;
        if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
        {
          v12 = (void *)MEMORY[0x1E0CB3940];
          v13 = v11;
          objc_msgSend(v12, "stringWithUTF8String:", a3);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v19 = "-[CKVTaskManager _postNotification:forChangeToItemType:]";
          v20 = 2112;
          v21 = v14;
          _os_log_impl(&dword_1A48B3000, v13, OS_LOG_TYPE_INFO, "%s Posted change notification: \"%@\", buf, 0x16u);

        }
      }
    }

  }
  else
  {
    v15 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[CKVTaskManager _postNotification:forChangeToItemType:]";
      v20 = 2112;
      v21 = v9;
      _os_log_error_impl(&dword_1A48B3000, v15, OS_LOG_TYPE_ERROR, "%s Failed to discover all sets: %@", buf, 0x16u);
    }
  }

}

- (id)_verificationTaskBlockForTask:(unsigned __int16)a3 reason:(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  _QWORD v10[5];
  __int16 v11;
  unsigned __int16 v12;

  v4 = a4;
  v5 = a3;
  if (a3 == 2)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__CKVTaskManager__verificationTaskBlockForTask_reason___block_invoke;
    v10[3] = &unk_1E4D29660;
    v10[4] = self;
    v11 = 2;
    v12 = a4;
    v7 = _Block_copy(v10);
  }
  else
  {
    v7 = 0;
  }
  -[CKVTaskManager _wrapperForTaskBlock:checkingEnablement:reason:](self, "_wrapperForTaskBlock:checkingEnablement:reason:", v7, v5, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_derivativeTaskBlockForTask:(unsigned __int16)a3 reason:(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  _QWORD v10[5];
  __int16 v11;
  unsigned __int16 v12;

  v4 = a4;
  v5 = a3;
  if (a3 == 9)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__CKVTaskManager__derivativeTaskBlockForTask_reason___block_invoke;
    v10[3] = &unk_1E4D29660;
    v10[4] = self;
    v11 = 9;
    v12 = a4;
    v7 = _Block_copy(v10);
  }
  else
  {
    v7 = 0;
  }
  -[CKVTaskManager _wrapperForTaskBlock:checkingEnablement:reason:](self, "_wrapperForTaskBlock:checkingEnablement:reason:", v7, v5, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CKVTaskSettings)settings
{
  return self->_settings;
}

- (CKVDonateTaskProvider)donateTaskProvider
{
  return self->_donateTaskProvider;
}

- (CKVTaskManagerInfo)info
{
  return self->_info;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_donateTaskProvider, 0);
  objc_storeStrong((id *)&self->_setEnumerator, 0);
  objc_storeStrong((id *)&self->_coalescer, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_rootDirectoryURL, 0);
  objc_storeStrong((id *)&self->_managerName, 0);
}

void __53__CKVTaskManager__derivativeTaskBlockForTask_reason___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  char v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  int v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  NSObject *v30;
  void *v31;
  int v32;
  id v33;
  void *v34;
  char v35;
  id v36;
  NSObject *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  NSObject *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_findInstalledAppSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "_blockToCollectInstalledAppBundleIds:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "changeRegistry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bookmarkForSet:", v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    v41 = 0;
    v8 = objc_msgSend(v7, "_enumerateLocalInstancesOfSet:priorBookmark:newBookmark:hasDelta:addedInstancesBlock:", v2, v6, &v41, 0, v4);
    v9 = v41;
    v10 = &unk_1ED0C7000;
    if ((v8 & 1) != 0)
      goto LABEL_7;
    if (!v6)
      goto LABEL_13;
    -[NSObject removeAllObjects](v3, "removeAllObjects");
    v11 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[CKVTaskManager _derivativeTaskBlockForTask:reason:]_block_invoke";
      _os_log_impl(&dword_1A48B3000, v11, OS_LOG_TYPE_INFO, "%s Retrying InstalledApp enumeration without a bookmark", buf, 0xCu);
    }
    v12 = *(void **)(a1 + 32);
    v40 = v9;
    v13 = objc_msgSend(v12, "_enumerateLocalInstancesOfSet:priorBookmark:newBookmark:hasDelta:addedInstancesBlock:", v2, 0, &v40, 0, v4);
    v14 = v40;

    v9 = v14;
    if ((v13 & 1) != 0)
    {
LABEL_7:
      v15 = -[NSObject count](v3, "count");
      v16 = CKLogContextVocabulary;
      v17 = os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO);
      if (v15)
      {
        if (v17)
        {
          v18 = *(unsigned __int16 *)(a1 + 40);
          v19 = v16;
          CKVTaskIdDescription(v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v43 = "-[CKVTaskManager _derivativeTaskBlockForTask:reason:]_block_invoke";
          v44 = 2112;
          v45 = v20;
          v46 = 2112;
          v47 = v3;
          _os_log_impl(&dword_1A48B3000, v19, OS_LOG_TYPE_INFO, "%s Running task \"%@\" with added / updated appBundleIds: [%@]", buf, 0x20u);

        }
        v21 = *(_QWORD *)(a1 + 32);
        v22 = *(void **)(v21 + 48);
        v23 = *(unsigned __int16 *)(a1 + 40);
        objc_msgSend(*(id *)(v21 + 24), "localization");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "derivativeTaskForId:usingLocalization:modifiedItemIds:", v23, v24, v3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "runWithType:reason:", *(unsigned __int16 *)(a1 + 40), *(unsigned __int16 *)(a1 + 42));
        v10 = &unk_1ED0C7000;
      }
      else if (v17)
      {
        *(_DWORD *)buf = 136315138;
        v43 = "-[CKVTaskManager _derivativeTaskBlockForTask:reason:]_block_invoke";
        _os_log_impl(&dword_1A48B3000, v16, OS_LOG_TYPE_INFO, "%s Zero InstalledApp adds / updates", buf, 0xCu);
      }
      v39 = 0;
      v32 = objc_msgSend(v5, "updateBookmark:forSet:error:", v9, v2, &v39);
      v33 = v39;
      v34 = v33;
      if (!v32
        || (v38 = v33,
            v35 = objc_msgSend(v5, "commitAllBookmarkUpdates:", &v38),
            v36 = v38,
            v34,
            v34 = v36,
            (v35 & 1) == 0))
      {
        v37 = *((_QWORD *)v10 + 408);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v43 = "-[CKVTaskManager _derivativeTaskBlockForTask:reason:]_block_invoke";
          v44 = 2112;
          v45 = v34;
          _os_log_error_impl(&dword_1A48B3000, v37, OS_LOG_TYPE_ERROR, "%s Failed to commit updated InstalledApp bookmark to registry: %@", buf, 0x16u);
        }
      }

    }
    else
    {
LABEL_13:
      v28 = (void *)CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        v29 = *(unsigned __int16 *)(a1 + 40);
        v30 = v28;
        CKVTaskIdDescription(v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v43 = "-[CKVTaskManager _derivativeTaskBlockForTask:reason:]_block_invoke";
        v44 = 2112;
        v45 = v31;
        _os_log_error_impl(&dword_1A48B3000, v30, OS_LOG_TYPE_ERROR, "%s Cannot run task \"%@\" without successful enumeration of InstalledApp set", buf, 0x16u);

      }
    }

    goto LABEL_23;
  }
  v26 = (void *)CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    v27 = *(unsigned __int16 *)(a1 + 40);
    v3 = v26;
    CKVTaskIdDescription(v27);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v43 = "-[CKVTaskManager _derivativeTaskBlockForTask:reason:]_block_invoke";
    v44 = 2112;
    v45 = v4;
    _os_log_error_impl(&dword_1A48B3000, v3, OS_LOG_TYPE_ERROR, "%s Cannot run task \"%@\" without InstalledApp set", buf, 0x16u);
LABEL_23:

  }
}

void __55__CKVTaskManager__verificationTaskBlockForTask_reason___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "verificationTaskForId:", *(unsigned __int16 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wasLastDonationAccepted");
  objc_msgSend(v2, "lastDonationAcceptedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "lastMaintenance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && objc_msgSend(v4, "compare:", v5) == -1)
  {
    v6 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      v7 = *(unsigned __int16 *)(a1 + 40);
      v8 = v6;
      CKVTaskIdDescription(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ISO8601String");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ISO8601String");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v14 = "-[CKVTaskManager _verificationTaskBlockForTask:reason:]_block_invoke";
      v15 = 2112;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1A48B3000, v8, OS_LOG_TYPE_INFO, "%s Skipping verification task (%@). No changes have been accepted (%@) since the last maintenance task (%@).", buf, 0x2Au);

    }
  }
  else
  {
    LOWORD(v12) = *(_WORD *)(a1 + 40);
    BYTE2(v12) = v3;
    objc_msgSend(v2, "runWithType:reason:completion:", MEMORY[0x1E0C809B0], 3221225472, __55__CKVTaskManager__verificationTaskBlockForTask_reason___block_invoke_100, &unk_1E4D29688, *(_QWORD *)(a1 + 32), v12);
  }

}

void __55__CKVTaskManager__verificationTaskBlockForTask_reason___block_invoke_100(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  const __CFString *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a2 < 0)
  {
    v12 = (void *)CKLogContextVocabulary;
    if (!os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      return;
    v13 = *(unsigned __int16 *)(a1 + 40);
    v4 = v12;
    CKVTaskIdDescription(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v17 = "-[CKVTaskManager _verificationTaskBlockForTask:reason:]_block_invoke";
    v18 = 2112;
    v19 = (uint64_t)v14;
    _os_log_error_impl(&dword_1A48B3000, v4, OS_LOG_TYPE_ERROR, "%s Failed to run verification task (%@).", buf, 0x16u);

    goto LABEL_16;
  }
  if (*(_WORD *)(a1 + 40) == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_findContactSet");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = v3;
      v15 = 0;
      objc_msgSend(*(id *)(a1 + 32), "_enumerateLocalInstancesOfSet:hasDelta:fromBookmark:", v3, (char *)&v15 + 1, &v15);
      v5 = (void *)CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
      {
        v6 = *(unsigned __int16 *)(a1 + 40);
        v7 = v5;
        CKVTaskIdDescription(v6);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        if ((_BYTE)v15)
          v10 = HIBYTE(v15) == 0;
        else
          v10 = 1;
        v11 = CFSTR("confirmed a ");
        *(_DWORD *)buf = 136315650;
        v17 = "-[CKVTaskManager _verificationTaskBlockForTask:reason:]_block_invoke";
        if (!v10)
          v11 = CFSTR("fixed an in");
        v18 = 2112;
        v19 = v8;
        v20 = 2112;
        v21 = v11;
        _os_log_impl(&dword_1A48B3000, v7, OS_LOG_TYPE_INFO, "%s Verification task (%@) %@consistent set", buf, 0x20u);

      }
      if ((_BYTE)v15)
      {
        if (*(_BYTE *)(a1 + 42))
          +[CKVAnalytics sendDonateVerification:isConsistent:](CKVAnalytics, "sendDonateVerification:isConsistent:", *(unsigned __int16 *)(a1 + 40), HIBYTE(v15) == 0);
      }
LABEL_16:

    }
  }
}

void __103__CKVTaskManager__enumerateLocalInstancesOfSet_priorBookmark_newBookmark_hasDelta_addedInstancesBlock___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "state"))
  {
    v7 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      v8 = a1[4];
      v9 = v7;
      objc_msgSend(v5, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315650;
      v12 = "-[CKVTaskManager _enumerateLocalInstancesOfSet:priorBookmark:newBookmark:hasDelta:addedInstancesBlock:]_block_invoke";
      v13 = 2112;
      v14 = v8;
      v15 = 2112;
      v16 = v10;
      _os_log_error_impl(&dword_1A48B3000, v9, OS_LOG_TYPE_ERROR, "%s Failed to enumerate set: %@ error: %@", (uint8_t *)&v11, 0x20u);

    }
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  }

}

void __103__CKVTaskManager__enumerateLocalInstancesOfSet_priorBookmark_newBookmark_hasDelta_addedInstancesBlock___block_invoke_93(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "addedLocalInstances");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += objc_msgSend(v4, "count");

  objc_msgSend(v3, "removedLocalInstances");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += objc_msgSend(v5, "count");

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v3, "addedLocalInstances", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = a1[4];
        if (v11)
          (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

void __65__CKVTaskManager__wrapperForTaskBlock_checkingEnablement_reason___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  int v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 40))
  {
    v11 = (void *)CKLogContextVocabulary;
    if (!os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      return;
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v13 = (void *)MEMORY[0x1E0CB37E8];
    v14 = *(unsigned __int16 *)(a1 + 48);
    v15 = v11;
    objc_msgSend(v13, "numberWithUnsignedShort:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    CKVTaskIdDescription(*(unsigned __int16 *)(a1 + 48));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 136315906;
    v22 = "-[CKVTaskManager _wrapperForTaskBlock:checkingEnablement:reason:]_block_invoke";
    v23 = 2112;
    v24 = v12;
    v25 = 2112;
    v26 = v16;
    v27 = 2112;
    v28 = v17;
    _os_log_error_impl(&dword_1A48B3000, v15, OS_LOG_TYPE_ERROR, "%s (%@) Missing taskBlock for task (%@) \"%@\", (uint8_t *)&v21, 0x2Au);
LABEL_10:

    return;
  }
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "isTaskEnabled:reason:", *(unsigned __int16 *)(a1 + 48), *(unsigned __int16 *)(a1 + 50));
  v3 = (void *)CKLogContextVocabulary;
  v4 = os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO);
  if (!v2)
  {
    if (!v4)
      return;
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v19 = (void *)MEMORY[0x1E0CB37E8];
    v20 = *(unsigned __int16 *)(a1 + 48);
    v15 = v3;
    objc_msgSend(v19, "numberWithUnsignedShort:", v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    CKVTaskIdDescription(*(unsigned __int16 *)(a1 + 48));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 136315906;
    v22 = "-[CKVTaskManager _wrapperForTaskBlock:checkingEnablement:reason:]_block_invoke";
    v23 = 2112;
    v24 = v18;
    v25 = 2112;
    v26 = v16;
    v27 = 2112;
    v28 = v17;
    _os_log_impl(&dword_1A48B3000, v15, OS_LOG_TYPE_INFO, "%s (%@) Ignoring task (%@) \"%@\" not enabled for current device configuration", (uint8_t *)&v21, 0x2Au);
    goto LABEL_10;
  }
  if (v4)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = *(unsigned __int16 *)(a1 + 48);
    v8 = v3;
    objc_msgSend(v6, "numberWithUnsignedShort:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CKVTaskIdDescription(*(unsigned __int16 *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 136315906;
    v22 = "-[CKVTaskManager _wrapperForTaskBlock:checkingEnablement:reason:]_block_invoke";
    v23 = 2112;
    v24 = v5;
    v25 = 2112;
    v26 = v9;
    v27 = 2112;
    v28 = v10;
    _os_log_impl(&dword_1A48B3000, v8, OS_LOG_TYPE_INFO, "%s (%@) Running task (%@) \"%@\", (uint8_t *)&v21, 0x2Au);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __55__CKVTaskManager__cleanUpDeletedAppDonationsTaskBlock___block_invoke(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  NSObject *v7;
  const __CFString *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  NSObject *v15;
  dispatch_semaphore_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  dispatch_time_t v21;
  NSObject *v22;
  dispatch_semaphore_t v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  dispatch_time_t v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  __int128 v32;
  __CFString *v33;
  void *v34;
  id obj;
  int v36;
  _QWORD aBlock[5];
  NSObject *v38;
  id v39;
  id v40;
  __int16 v41;
  _QWORD v42[5];
  NSObject *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  const __CFString *v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "allInstalledAppBundleIdentifiers");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString count](v2, "count"))
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v48 = 0;
    objc_msgSend(v3, "allSets:", &v48);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (__CFString *)v48;
    v6 = v5;
    if (v4)
    {
      v33 = v5;
      v36 = _os_feature_enabled_impl();
      v7 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
      {
        v8 = CFSTR("NO");
        if (v36)
          v8 = CFSTR("YES");
        *(_DWORD *)buf = 136315394;
        v50 = "-[CKVTaskManager _cleanUpDeletedAppDonationsTaskBlock:]_block_invoke";
        v51 = 2112;
        v52 = v8;
        _os_log_impl(&dword_1A48B3000, v7, OS_LOG_TYPE_INFO, "%s enableSetDeletion = %@", buf, 0x16u);
      }
      v46 = 0u;
      v47 = 0u;
      v45 = 0u;
      v44 = 0u;
      v34 = v4;
      obj = v4;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
      if (v9)
      {
        v11 = v9;
        v12 = *(_QWORD *)v45;
        *(_QWORD *)&v10 = 136315138;
        v32 = v10;
LABEL_9:
        v13 = 0;
        while (1)
        {
          if (*(_QWORD *)v45 != v12)
            objc_enumerationMutation(obj);
          v14 = *(__CFString **)(*((_QWORD *)&v44 + 1) + 8 * v13);
          if (objc_msgSend(*(id *)(a1 + 32), "_isClearRequiredForSet:installedAppBundleIds:", v14, v2, v32))
          {
            v15 = CKLogContextVocabulary;
            if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v50 = "-[CKVTaskManager _cleanUpDeletedAppDonationsTaskBlock:]_block_invoke";
              v51 = 2112;
              v52 = v14;
              _os_log_impl(&dword_1A48B3000, v15, OS_LOG_TYPE_INFO, "%s Submitting clear for set: %@", buf, 0x16u);
            }
            v16 = dispatch_semaphore_create(0);
            v17 = (void *)MEMORY[0x1E0D0D420];
            v18 = -[__CFString itemType](v14, "itemType");
            -[__CFString descriptors](v14, "descriptors");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v42[0] = MEMORY[0x1E0C809B0];
            v42[1] = 3221225472;
            v42[2] = __55__CKVTaskManager__cleanUpDeletedAppDonationsTaskBlock___block_invoke_75;
            v42[3] = &unk_1E4D29598;
            v42[4] = v14;
            v20 = v16;
            v43 = v20;
            objc_msgSend(v17, "fullSetDonationWithItemType:descriptors:completion:", v18, v19, v42);

            v21 = dispatch_time(0, 300000000000);
            if (dispatch_semaphore_wait(v20, v21))
            {
              v22 = CKLogContextVocabulary;
              if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v50 = "-[CKVTaskManager _cleanUpDeletedAppDonationsTaskBlock:]_block_invoke";
                v51 = 2112;
                v52 = v14;
                v53 = 2112;
                v54 = &unk_1E4D31BA8;
                _os_log_error_impl(&dword_1A48B3000, v22, OS_LOG_TYPE_ERROR, "%s Timed out waiting to clear set: %@ timeout: %@ seconds", buf, 0x20u);
              }
            }

          }
          if (v36
            && objc_msgSend(*(id *)(a1 + 32), "_isDeleteRequiredForSet:installedAppBundleIds:", v14, v2))
          {
            v23 = dispatch_semaphore_create(0);
            v41 = 0;
            v41 = -[__CFString itemType](v14, "itemType");
            -[__CFString descriptors](v14, "descriptors");
            v40 = (id)objc_claimAutoreleasedReturnValue();
            aBlock[0] = MEMORY[0x1E0C809B0];
            aBlock[1] = 3221225472;
            aBlock[2] = __55__CKVTaskManager__cleanUpDeletedAppDonationsTaskBlock___block_invoke_77;
            aBlock[3] = &unk_1E4D295C0;
            aBlock[4] = v14;
            v24 = v23;
            v38 = v24;
            v39 = _Block_copy(aBlock);
            objc_msgSend(MEMORY[0x1E0D0D420], "methodSignatureForSelector:", sel_deleteSetWithItemType_descriptors_completion_);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = CKLogContextVocabulary;
            if (v25)
            {
              if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                v50 = "-[CKVTaskManager _cleanUpDeletedAppDonationsTaskBlock:]_block_invoke";
                v51 = 2112;
                v52 = v14;
                _os_log_impl(&dword_1A48B3000, v26, OS_LOG_TYPE_INFO, "%s Submitting delete for set: %@", buf, 0x16u);
              }
              objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v25);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "setTarget:", objc_opt_class());
              objc_msgSend(v27, "setSelector:", sel_deleteSetWithItemType_descriptors_completion_);
              objc_msgSend(v27, "setArgument:atIndex:", &v41, 2);
              objc_msgSend(v27, "setArgument:atIndex:", &v40, 3);
              objc_msgSend(v27, "setArgument:atIndex:", &v39, 4);
              objc_msgSend(v27, "invoke");
              v28 = dispatch_time(0, 300000000000);
              if (dispatch_semaphore_wait(v24, v28))
              {
                v29 = CKLogContextVocabulary;
                if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  v50 = "-[CKVTaskManager _cleanUpDeletedAppDonationsTaskBlock:]_block_invoke";
                  v51 = 2112;
                  v52 = v14;
                  v53 = 2112;
                  v54 = &unk_1E4D31BA8;
                  _os_log_error_impl(&dword_1A48B3000, v29, OS_LOG_TYPE_ERROR, "%s Timed out waiting to delete set: %@ timeout: %@ seconds", buf, 0x20u);
                }
              }

            }
            else if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v32;
              v50 = "-[CKVTaskManager _cleanUpDeletedAppDonationsTaskBlock:]_block_invoke";
              _os_log_error_impl(&dword_1A48B3000, v26, OS_LOG_TYPE_ERROR, "%s Failed to resolve deleteSet method signature", buf, 0xCu);
            }

            if (!v25)
              break;
          }
          if (v11 == ++v13)
          {
            v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
            if (v11)
              goto LABEL_9;
            break;
          }
        }
      }

      v6 = v33;
      v4 = v34;
    }
    else
    {
      v31 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v50 = "-[CKVTaskManager _cleanUpDeletedAppDonationsTaskBlock:]_block_invoke";
        v51 = 2112;
        v52 = v6;
        _os_log_error_impl(&dword_1A48B3000, v31, OS_LOG_TYPE_ERROR, "%s Failed to enumerate all sets: %@", buf, 0x16u);
      }
    }

  }
  else
  {
    v30 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v50 = "-[CKVTaskManager _cleanUpDeletedAppDonationsTaskBlock:]_block_invoke";
      v51 = 2112;
      v52 = v2;
      _os_log_error_impl(&dword_1A48B3000, v30, OS_LOG_TYPE_ERROR, "%s Failed to resolve installed appBundleIds: %@", buf, 0x16u);
    }
  }

}

void __55__CKVTaskManager__cleanUpDeletedAppDonationsTaskBlock___block_invoke_75(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v5 = a3;
  v6 = objc_msgSend(a2, "finish:", &v11);
  v7 = v11;

  v8 = CKLogContextVocabulary;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v13 = "-[CKVTaskManager _cleanUpDeletedAppDonationsTaskBlock:]_block_invoke";
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1A48B3000, v8, OS_LOG_TYPE_INFO, "%s Successfully cleared set: %@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    v13 = "-[CKVTaskManager _cleanUpDeletedAppDonationsTaskBlock:]_block_invoke";
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v7;
    _os_log_error_impl(&dword_1A48B3000, v8, OS_LOG_TYPE_ERROR, "%s Failed to clear set: %@ error: %@", buf, 0x20u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __55__CKVTaskManager__cleanUpDeletedAppDonationsTaskBlock___block_invoke_77(uint64_t a1, void *a2)
{
  __CFString *v3;
  NSObject *v4;
  uint64_t v5;
  const __CFString *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = CFSTR("success");
    if (v3)
      v6 = v3;
    v7 = 136315650;
    v8 = "-[CKVTaskManager _cleanUpDeletedAppDonationsTaskBlock:]_block_invoke";
    v9 = 2112;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1A48B3000, v4, OS_LOG_TYPE_INFO, "%s Deletion completed for set: %@ with result: %@", (uint8_t *)&v7, 0x20u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __55__CKVTaskManager__blockToCollectInstalledAppBundleIds___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

  }
  else
  {
    v6 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315650;
      v8 = "-[CKVTaskManager _blockToCollectInstalledAppBundleIds:]_block_invoke";
      v9 = 2112;
      v10 = v3;
      v11 = 2112;
      v12 = v4;
      _os_log_error_impl(&dword_1A48B3000, v6, OS_LOG_TYPE_ERROR, "%s Unexpected instance: %@ content: %@", (uint8_t *)&v7, 0x20u);
    }
  }

}

void __51__CKVTaskManager__wakePodcastsTaskBlockWithReason___block_invoke(uint64_t a1)
{
  int v1;
  NSObject *v2;
  _BOOL4 v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = *(unsigned __int16 *)(a1 + 32);
  v2 = CKLogContextVocabulary;
  v3 = os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO);
  if (v1 == 14)
  {
    if (v3)
    {
      v4 = (void *)MEMORY[0x1E0CB37E8];
      v5 = v2;
      objc_msgSend(v4, "numberWithUnsignedShort:", 14);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 136315394;
      v8 = "-[CKVTaskManager _wakePodcastsTaskBlockWithReason:]_block_invoke";
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_1A48B3000, v5, OS_LOG_TYPE_INFO, "%s Skipping Podcasts wake for reason: %@", (uint8_t *)&v7, 0x16u);

    }
  }
  else
  {
    if (v3)
    {
      v7 = 136315138;
      v8 = "-[CKVTaskManager _wakePodcastsTaskBlockWithReason:]_block_invoke";
      _os_log_impl(&dword_1A48B3000, v2, OS_LOG_TYPE_INFO, "%s Waking Podcasts app up", (uint8_t *)&v7, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0D7F408], "openPodcastsWithOriginBundleId:", CFSTR("com.apple.siriknowledged"));
  }
}

uint64_t __58__CKVTaskManager__siriLanguageChangedTaskBlockWithReason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = 136315394;
    v6 = "-[CKVTaskManager _siriLanguageChangedTaskBlockWithReason:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A48B3000, v2, OS_LOG_TYPE_INFO, "%s (%@) Handling Siri language code change notification  - refreshing localization settings", (uint8_t *)&v5, 0x16u);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "refreshLocalization");
  return objc_msgSend(*(id *)(a1 + 32), "_didLocalizationChange:", *(unsigned __int16 *)(a1 + 40));
}

void __62__CKVTaskManager__maintenanceTaskBlockWithReason_shouldDefer___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  unsigned __int16 v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void (**v27)(void);
  NSObject *v28;
  void *v29;
  void (**v30)(void);
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void (**v38)(void);
  void (**v39)(void);
  NSObject *v40;
  void *v41;
  void *v42;
  char v43;
  id v44;
  NSObject *v45;
  __int128 v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  void *v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v2 = &unk_1ED0C7000;
  v3 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    *(_DWORD *)buf = 136315394;
    v58 = "-[CKVTaskManager _maintenanceTaskBlockWithReason:shouldDefer:]_block_invoke";
    v59 = 2112;
    v60 = v4;
    _os_log_impl(&dword_1A48B3000, v3, OS_LOG_TYPE_INFO, "%s (%@) Starting maintenance", buf, 0x16u);
  }
  v5 = objc_msgSend(*(id *)(a1 + 32), "_didTriggerMigration:reason:", 0, *(unsigned __int16 *)(a1 + 40));
  v6 = CKLogContextVocabulary;
  v7 = os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      *(_DWORD *)buf = 136315394;
      v58 = "-[CKVTaskManager _maintenanceTaskBlockWithReason:shouldDefer:]_block_invoke";
      v59 = 2112;
      v60 = v8;
      _os_log_impl(&dword_1A48B3000, v6, OS_LOG_TYPE_INFO, "%s (%@) Skipping maintenance as migration has been triggered", buf, 0x16u);
    }
  }
  else
  {
    if (v7)
    {
      v9 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      *(_DWORD *)buf = 136315394;
      v58 = "-[CKVTaskManager _maintenanceTaskBlockWithReason:shouldDefer:]_block_invoke";
      v59 = 2112;
      v60 = v9;
      _os_log_impl(&dword_1A48B3000, v6, OS_LOG_TYPE_INFO, "%s (%@) Refreshing localization settings", buf, 0x16u);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "refreshLocalization");
    if (objc_msgSend(*(id *)(a1 + 32), "_didLocalizationChange:", *(unsigned __int16 *)(a1 + 40)))
    {
      v10 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend((id)objc_opt_class(), "siriLanguageDependentDonateTasks");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setWithArray:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }
    v13 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      v14 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      *(_DWORD *)buf = 136315394;
      v58 = "-[CKVTaskManager _maintenanceTaskBlockWithReason:shouldDefer:]_block_invoke";
      v59 = 2112;
      v60 = v14;
      _os_log_impl(&dword_1A48B3000, v13, OS_LOG_TYPE_INFO, "%s (%@) Running daily donate tasks", buf, 0x16u);
    }
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend((id)objc_opt_class(), "dailyDonateTasks");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
    if (v16)
    {
      v18 = v16;
      v19 = *(_QWORD *)v53;
      *(_QWORD *)&v17 = 136315650;
      v46 = v17;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v53 != v19)
            objc_enumerationMutation(v15);
          v21 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          v22 = objc_msgSend(v21, "unsignedIntValue", v46);
          if (objc_msgSend(v12, "containsObject:", v21))
          {
            v23 = *((_QWORD *)v2 + 408);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              v24 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
              v25 = v23;
              CKVTaskIdDescription(v22);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v46;
              v58 = "-[CKVTaskManager _maintenanceTaskBlockWithReason:shouldDefer:]_block_invoke";
              v59 = 2112;
              v60 = v24;
              v2 = &unk_1ED0C7000;
              v61 = 2112;
              v62 = v26;
              _os_log_impl(&dword_1A48B3000, v25, OS_LOG_TYPE_INFO, "%s (%@) Skipping task (%@) which already ran after localization refresh.", buf, 0x20u);

            }
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "_taskBlockForTask:reason:shouldDefer:", v22, *(unsigned __int16 *)(a1 + 40), 0);
            v27 = (void (**)(void))objc_claimAutoreleasedReturnValue();
            v27[2]();

          }
        }
        v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
      }
      while (v18);
    }

    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "didCompleteMigrationMoreRecentlyThanMaintenance"))
    {
      v28 = *((_QWORD *)v2 + 408);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v29 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
        *(_DWORD *)buf = 136315394;
        v58 = "-[CKVTaskManager _maintenanceTaskBlockWithReason:shouldDefer:]_block_invoke";
        v59 = 2112;
        v60 = v29;
        _os_log_impl(&dword_1A48B3000, v28, OS_LOG_TYPE_INFO, "%s (%@) First maintenance post migration", buf, 0x16u);
      }
      objc_msgSend(*(id *)(a1 + 32), "_taskBlockForTask:reason:shouldDefer:", 104, *(unsigned __int16 *)(a1 + 40), 0);
      v30 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v30[2]();

    }
    v31 = *((_QWORD *)v2 + 408);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      *(_DWORD *)buf = 136315394;
      v58 = "-[CKVTaskManager _maintenanceTaskBlockWithReason:shouldDefer:]_block_invoke";
      v59 = 2112;
      v60 = v32;
      _os_log_impl(&dword_1A48B3000, v31, OS_LOG_TYPE_INFO, "%s (%@) Running verification tasks", buf, 0x16u);
    }
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    objc_msgSend((id)objc_opt_class(), "verificationTasks");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v49 != v36)
            objc_enumerationMutation(v33);
          objc_msgSend(*(id *)(a1 + 32), "_verificationTaskBlockForTask:reason:", (unsigned __int16)objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * j), "unsignedIntValue"), *(unsigned __int16 *)(a1 + 40));
          v38 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          v38[2]();

        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      }
      while (v35);
    }

    objc_msgSend(*(id *)(a1 + 32), "_taskBlockForTask:reason:shouldDefer:", 105, *(unsigned __int16 *)(a1 + 40), 0);
    v39 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v39[2]();
    v40 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      v41 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      *(_DWORD *)buf = 136315394;
      v58 = "-[CKVTaskManager _maintenanceTaskBlockWithReason:shouldDefer:]_block_invoke";
      v59 = 2112;
      v60 = v41;
      _os_log_impl(&dword_1A48B3000, v40, OS_LOG_TYPE_INFO, "%s (%@) Maintenance completed.", buf, 0x16u);
    }
    v42 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    v47 = 0;
    v43 = objc_msgSend(v42, "recordMaintenanceCompleted:", &v47);
    v44 = v47;
    if ((v43 & 1) == 0)
    {
      v45 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v58 = "-[CKVTaskManager _maintenanceTaskBlockWithReason:shouldDefer:]_block_invoke";
        v59 = 2112;
        v60 = v44;
        _os_log_error_impl(&dword_1A48B3000, v45, OS_LOG_TYPE_ERROR, "%s Failed to record maintenance completed: %@", buf, 0x16u);
      }
    }

  }
}

void __46__CKVTaskManager__didTriggerMigration_reason___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__CKVTaskManager__didTriggerMigration_reason___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void (**v9)(void);
  uint64_t v10;
  void *v11;
  uint64_t v12;
  char v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    *(_DWORD *)buf = 136315394;
    v25 = "-[CKVTaskManager _didTriggerMigration:reason:]_block_invoke_2";
    v26 = 2112;
    v27 = v3;
    _os_log_impl(&dword_1A48B3000, v2, OS_LOG_TYPE_INFO, "%s (%@) Running verification tasks following migration donate tasks", buf, 0x16u);
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend((id)objc_opt_class(), "verificationTasks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 32), "_verificationTaskBlockForTask:reason:", (unsigned __int16)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "unsignedIntValue"), 1);
        v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v9[2]();

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 32), "handleTask:reason:shouldDefer:completion:", 104, 1, 0, 0);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 56);
  v12 = *(_QWORD *)(v10 + 24);
  v18 = 0;
  v13 = objc_msgSend(v11, "recordMigrationCompletedWithSettings:error:", v12, &v18);
  v14 = v18;
  v15 = CKLogContextVocabulary;
  if ((v13 & 1) == 0 && os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[CKVTaskManager _didTriggerMigration:reason:]_block_invoke";
    v26 = 2112;
    v27 = v14;
    _os_log_error_impl(&dword_1A48B3000, v15, OS_LOG_TYPE_ERROR, "%s Failed to record migration completed: %@", buf, 0x16u);
    v15 = CKLogContextVocabulary;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    *(_DWORD *)buf = 136315394;
    v25 = "-[CKVTaskManager _didTriggerMigration:reason:]_block_invoke";
    v26 = 2112;
    v27 = v16;
    _os_log_impl(&dword_1A48B3000, v15, OS_LOG_TYPE_INFO, "%s (%@) Migration completed.", buf, 0x16u);
  }
  v17 = *(_QWORD *)(a1 + 40);
  if (v17)
    (*(void (**)(void))(v17 + 16))();

}

+ (id)defaultManager
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc((Class)objc_opt_class());
  KVTaskManagerRootDirectoryURL();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D0D408], "setEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKVTaskSettings defaultSettings](CKVTaskSettings, "defaultSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithManagerName:rootDirectoryURL:setEnumerator:settings:", CFSTR("Default"), v3, v4, v5);

  return v6;
}

+ (id)migrationDonateTasks
{
  return &unk_1E4D31D78;
}

+ (id)dailyDonateTasks
{
  return &unk_1E4D31D90;
}

+ (id)verificationTasks
{
  return &unk_1E4D31DA8;
}

+ (id)siriLanguageDependentDonateTasks
{
  return &unk_1E4D31DC0;
}

@end
