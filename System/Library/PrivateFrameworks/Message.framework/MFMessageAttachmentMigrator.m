@implementation MFMessageAttachmentMigrator

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__MFMessageAttachmentMigrator_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_17 != -1)
    dispatch_once(&log_onceToken_17, block);
  return (OS_os_log *)(id)log_log_17;
}

void __34__MFMessageAttachmentMigrator_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_17;
  log_log_17 = (uint64_t)v1;

}

- (MFMessageAttachmentMigrator)initWithLibrary:(id)a3
{
  id v4;
  MFMessageAttachmentMigrator *v5;
  MFMessageAttachmentMigrator *v6;
  uint64_t v7;
  EFScheduler *backgroundMigrationScheduler;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *contentProtectionQueue;
  uint64_t v12;
  NSConditionLock *migrationState;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MFMessageAttachmentMigrator;
  v5 = -[MFMessageAttachmentMigrator init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_library, v4);
    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.email.MFMessageAttachmentMigrator"), 9);
    v7 = objc_claimAutoreleasedReturnValue();
    backgroundMigrationScheduler = v6->_backgroundMigrationScheduler;
    v6->_backgroundMigrationScheduler = (EFScheduler *)v7;

    v6->_upgradeLock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.message.MFMessageAttachmentMigrator.contentProtectionQueue", v9);
    contentProtectionQueue = v6->_contentProtectionQueue;
    v6->_contentProtectionQueue = (OS_dispatch_queue *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
    migrationState = v6->_migrationState;
    v6->_migrationState = (NSConditionLock *)v12;

  }
  return v6;
}

- (void)startMigratingAttachments
{
  void *v3;
  _QWORD v4[5];

  -[MFMessageAttachmentMigrator backgroundMigrationScheduler](self, "backgroundMigrationScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__MFMessageAttachmentMigrator_startMigratingAttachments__block_invoke;
  v4[3] = &unk_1E4E88DC8;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

void __56__MFMessageAttachmentMigrator_startMigratingAttachments__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  __int128 *p_buf;
  _QWORD v19[4];
  id v20;
  __int128 buf;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D1EF08], "indexSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "library");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMessageAttachmentMigrator startMigratingAttachments]_block_invoke");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __56__MFMessageAttachmentMigrator_startMigratingAttachments__block_invoke_2;
  v19[3] = &unk_1E4E8AB20;
  v5 = v14;
  v20 = v5;
  objc_msgSend(v3, "__performReadWithCaller:usingBlock:", v4, v19);

  +[MFMessageAttachmentMigrator log](MFMessageAttachmentMigrator, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v5, "count");
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1A4F90000, v6, OS_LOG_TYPE_DEFAULT, "Found %lu messages to migrate", (uint8_t *)&buf, 0xCu);
  }

  EFRegisterContentProtectionObserver();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v22 = 0x2020000000;
  v23 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_checkContentProtectionState");
  objc_msgSend(*(id *)(a1 + 32), "_setMigratingAttachmentsOnThread:", 1);
  do
  {
    objc_msgSend(*(id *)(a1 + 32), "migrationState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lockWhenCondition:", 0);

    objc_msgSend(*(id *)(a1 + 32), "migrationState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unlock");

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMessageAttachmentMigrator startMigratingAttachments]_block_invoke");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __56__MFMessageAttachmentMigrator_startMigratingAttachments__block_invoke_2_20;
    v15[3] = &unk_1E4E8AA58;
    p_buf = &buf;
    v11 = v5;
    v12 = *(_QWORD *)(a1 + 32);
    v16 = v11;
    v17 = v12;
    objc_msgSend(v3, "__performWriteWithCaller:usingBlock:", v10, v15);

  }
  while (*(_QWORD *)(*((_QWORD *)&buf + 1) + 24) != 0x7FFFFFFFFFFFFFFFLL);
  objc_msgSend(*(id *)(a1 + 32), "_setMigratingAttachmentsOnThread:", 0);
  EFUnregisterContentProtectionObserver();
  objc_msgSend(*(id *)(a1 + 32), "library");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "attachmentMigrationFinished");

  _Block_object_dispose(&buf, 8);
}

uint64_t __56__MFMessageAttachmentMigrator_startMigratingAttachments__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v5[4];
  id v6;

  objc_msgSend(a2, "preparedStatementForQueryString:", CFSTR("SELECT ROWID FROM messages WHERE (((flags&(63<<10))>>10) BETWEEN 1 AND 62) AND global_message_id NOT IN (SELECT DISTINCT global_message_id FROM message_attachments)"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__MFMessageAttachmentMigrator_startMigratingAttachments__block_invoke_3;
  v5[3] = &unk_1E4E8A048;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v3, "executeUsingBlock:error:", v5, 0);

  return 1;
}

void __56__MFMessageAttachmentMigrator_startMigratingAttachments__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ROWID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "databaseIDValue");

  objc_msgSend(*(id *)(a1 + 32), "addIndex:", v4);
}

uint64_t __56__MFMessageAttachmentMigrator_startMigratingAttachments__block_invoke_2_20(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  char v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  const __CFString *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = 0;
  v5 = 1;
  do
  {
    v6 = (void *)MEMORY[0x1A85B0E24]();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "indexGreaterThanIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)+ 24));
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(a1 + 40), "library");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "messageWithLibraryID:options:inMailbox:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), 4227087, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9
        && (v5 = 0, (objc_msgSend(*(id *)(a1 + 40), "_migrateAttachmentsForMessage:connection:", v9, v3) & 1) != 0))
      {
        v7 = 0;
      }
      else
      {
        if ((objc_msgSend(*(id *)(a1 + 40), "_checkContentProtectionState") & 1) != 0)
        {
          v7 = 0;
LABEL_11:

          goto LABEL_12;
        }
        --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        v7 = 2;
      }
      v5 = 1;
      goto LABEL_11;
    }
    v7 = 2;
LABEL_12:
    objc_autoreleasePoolPop(v6);
    if (v7)
      break;
    objc_msgSend(*(id *)(a1 + 40), "migrationState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "tryLockWhenCondition:", 0);

    if (!v11)
      break;
    objc_msgSend(*(id *)(a1 + 40), "migrationState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "unlock");

    ++v4;
  }
  while (v4 != 500);
  +[MFMessageAttachmentMigrator log](MFMessageAttachmentMigrator, "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = CFSTR("unsuccessful");
    if ((v5 & 1) != 0)
      v14 = CFSTR("successful");
    v16 = 134218242;
    v17 = v4;
    v18 = 2112;
    v19 = v14;
    _os_log_impl(&dword_1A4F90000, v13, OS_LOG_TYPE_DEFAULT, "Migration for %lu messages was %@", (uint8_t *)&v16, 0x16u);
  }

  return v5 & 1;
}

- (void)migrateAttachmentsForMessageIfNecessary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v7 = a3;
  if (!-[MFMessageAttachmentMigrator _isMigratingAttachmentsOnThread](self, "_isMigratingAttachmentsOnThread"))
  {
    -[MFMessageAttachmentMigrator _setMigratingAttachmentsOnThread:](self, "_setMigratingAttachmentsOnThread:", 1);
    if (-[MFMessageAttachmentMigrator _messageHasAttachmentsToMigrate:](self, "_messageHasAttachmentsToMigrate:", v7))
    {
      -[MFMessageAttachmentMigrator library](self, "library");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "database");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMessageAttachmentMigrator migrateAttachmentsForMessageIfNecessary:]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __71__MFMessageAttachmentMigrator_migrateAttachmentsForMessageIfNecessary___block_invoke;
      v8[3] = &unk_1E4E8A760;
      v8[4] = self;
      v9 = v7;
      objc_msgSend(v5, "__performWriteWithCaller:usingBlock:", v6, v8);

    }
    -[MFMessageAttachmentMigrator _setMigratingAttachmentsOnThread:](self, "_setMigratingAttachmentsOnThread:", 0);
  }

}

uint64_t __71__MFMessageAttachmentMigrator_migrateAttachmentsForMessageIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "_migrateAttachmentsForMessage:connection:", *(_QWORD *)(a1 + 40), v3);
  +[MFMessageAttachmentMigrator log](MFMessageAttachmentMigrator, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v6;
    v10 = 1024;
    v11 = v4;
    _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_DEFAULT, "Did on demand migration for message %{public}@, success = %d", (uint8_t *)&v8, 0x12u);

  }
  return v4;
}

- (BOOL)_messageHasAttachmentsToMigrate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[MFMessageAttachmentMigrator library](self, "library");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageBasePathForAccount:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D1EB20];
  v9 = objc_msgSend(v4, "globalMessageID");
  objc_msgSend(v4, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messageDataDirectoryURLForGlobalMessageID:basePath:purgeable:", v9, v7, objc_msgSend(v10, "supportsPurge"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "URLByAppendingPathComponent:", CFSTR("Attachments"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v13, "fileExistsAtPath:", v14);

  return v9;
}

- (BOOL)_migrateAttachmentsForMessage:(id)a3 connection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  __CFString *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  id v41;
  void *v42;
  void *v43;
  NSObject *v44;
  __CFString *v45;
  void *v46;
  NSObject *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  void *v52;
  void *v53;
  id obj;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  void *v61;
  void *v62;
  id v63;
  os_activity_scope_state_s state;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t buf[4];
  const __CFString *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  void *v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[MFMessageAttachmentMigrator library](self, "library");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v5;
  objc_msgSend(v5, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageBasePathForAccount:", v7);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D1EB20];
  v9 = objc_msgSend(v5, "globalMessageID");
  objc_msgSend(v5, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messageDataDirectoryURLForGlobalMessageID:basePath:purgeable:", v9, v55, objc_msgSend(v10, "supportsPurge"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = v11;
  objc_msgSend(v11, "URLByAppendingPathComponent:", CFSTR("Attachments"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFAttachmentManager defaultManager](MFAttachmentManager, "defaultManager");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageAttachmentMigrator library](self, "library");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "persistence");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "attachmentPersistenceManager");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v53, "attachmentsForMessage:withSchemes:", v5, 0);
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
  if (v14)
  {
    v56 = *(_QWORD *)v66;
    do
    {
      v59 = v14;
      for (i = 0; i != v59; ++i)
      {
        if (*(_QWORD *)v66 != v56)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        v17 = _os_activity_create(&dword_1A4F90000, "Migrate message attachment", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
        state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
        state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
        v60 = v17;
        os_activity_scope_enter(v17, &state);
        +[MFMessageAttachmentMigrator log](MFMessageAttachmentMigrator, "log");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v61, "ef_publicDescription");
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "ef_publicDescription");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v70 = v19;
          v71 = 2112;
          v72 = v20;
          _os_log_impl(&dword_1A4F90000, v18, OS_LOG_TYPE_DEFAULT, "Migrating message %@ attachment %@", buf, 0x16u);

        }
        v21 = objc_alloc(MEMORY[0x1E0D1EB10]);
        v22 = objc_msgSend(v61, "globalMessageID");
        objc_msgSend(v16, "fileName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "part");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "partNumber");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "mailDropMetadata");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "directUrl");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = (void *)objc_msgSend(v21, "initWithGlobalMessageID:name:mimePart:attachmentID:remoteURL:", v22, v23, v25, 0, v27);

        v28 = v58;
        objc_msgSend(v16, "part");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "partNumber");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          objc_msgSend(v16, "part");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "partNumber");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "URLByAppendingPathComponent:", v32);
          v33 = objc_claimAutoreleasedReturnValue();

          v28 = (id)v33;
        }
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "path");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "contentsOfDirectoryAtPath:error:", v35, 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "firstObject");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          objc_msgSend(v28, "URLByAppendingPathComponent:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v55);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = 0;
          v40 = objc_msgSend(v57, "persistAttachmentWithURL:attachmentMetadata:basePath:error:", v38, v62, v39, &v63);
          v41 = v63;

          if (v40)
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "removeItemAtURL:error:", v38, 0);

            objc_msgSend(v16, "updatePath");
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "postNotificationName:object:", CFSTR("LibraryMessageAttachmentDataBecameAvailableNotification"), v61);

          }
        }
        else
        {
          +[MFMessageAttachmentMigrator log](MFMessageAttachmentMigrator, "log");
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v61, "ef_publicDescription");
            v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "ef_publicDescription");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v70 = v45;
            v71 = 2112;
            v72 = v46;
            _os_log_impl(&dword_1A4F90000, v44, OS_LOG_TYPE_DEFAULT, "No attachment file for message %@ attachment %@. Persisting attachment metadata", buf, 0x16u);

          }
          v40 = objc_msgSend(v57, "persistAttachmentMetadata:", v62);
          v41 = 0;
        }
        +[MFMessageAttachmentMigrator log](MFMessageAttachmentMigrator, "log");
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          if (v40)
            v48 = CFSTR("Successfully");
          else
            v48 = CFSTR("Unsuccessfully");
          objc_msgSend(v61, "ef_publicDescription");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "ef_publicDescription");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v70 = v48;
          v71 = 2112;
          v72 = v49;
          v73 = 2112;
          v74 = v50;
          _os_log_impl(&dword_1A4F90000, v47, OS_LOG_TYPE_DEFAULT, "%@ migrated message %@ attachment %@", buf, 0x20u);

        }
        os_activity_scope_leave(&state);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
    }
    while (v14);
  }
  else
  {
    LOBYTE(v40) = 1;
  }

  return v40;
}

- (BOOL)_checkContentProtectionState
{
  NSObject *v3;
  int v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[8];
  _QWORD block[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[MFMessageAttachmentMigrator contentProtectionQueue](self, "contentProtectionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MFMessageAttachmentMigrator__checkContentProtectionState__block_invoke;
  block[3] = &unk_1E4E8D288;
  block[4] = &v11;
  dispatch_sync(v3, block);

  v4 = *((unsigned __int8 *)v12 + 24);
  if (!*((_BYTE *)v12 + 24))
  {
    -[MFMessageAttachmentMigrator migrationState](self, "migrationState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lock");

    -[MFMessageAttachmentMigrator migrationState](self, "migrationState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unlockWithCondition:", 1);

    +[MFMessageAttachmentMigrator log](MFMessageAttachmentMigrator, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_DEFAULT, "Protected Index unavailable", v9, 2u);
    }

  }
  _Block_object_dispose(&v11, 8);
  return v4 != 0;
}

uint64_t __59__MFMessageAttachmentMigrator__checkContentProtectionState__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = EFProtectedDataAvailable();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)_setMigratingAttachmentsOnThread:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("com.apple.mail.attachmentMigrator"));
  else
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("com.apple.mail.attachmentMigrator"));

}

- (BOOL)_isMigratingAttachmentsOnThread
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.mail.attachmentMigrator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

+ (BOOL)migrateMaildropFileForMessage:(id)a3 mailDropMetadata:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  objc_class *v29;
  void *v30;
  NSObject *v31;
  void *v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    +[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject account](v7, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "messageBasePathForAccount:", v8);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0D1EB20];
    v10 = -[NSObject globalMessageID](v7, "globalMessageID");
    -[NSObject account](v7, "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "messageDataDirectoryURLForGlobalMessageID:basePath:purgeable:", v10, v34, objc_msgSend(v11, "supportsPurge"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = v12;
    objc_msgSend(v12, "URLByAppendingPathComponent:", CFSTR("Attachments"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "ef_sanitizedFileName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLByAppendingPathComponent:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = objc_msgSend(v17, "fileExistsAtPath:", v18);

    if ((_DWORD)v9)
    {
      objc_msgSend(v35, "persistence");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "attachmentPersistenceManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = objc_alloc(MEMORY[0x1E0D1EB10]);
      v22 = -[NSObject globalMessageID](v7, "globalMessageID");
      objc_msgSend(v6, "fileName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "directUrl");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v21, "initWithGlobalMessageID:name:mimePart:attachmentID:remoteURL:", v22, v23, 0, 0, v24);

      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v34);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v20, "persistAttachmentWithURL:attachmentMetadata:basePath:error:", v16, v25, v26, 0);

      if (v27)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "removeItemAtURL:error:", v16, 0);

      }
    }
    else
    {
      +[MFMessageAttachmentMigrator log](MFMessageAttachmentMigrator, "log");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v16;
        _os_log_impl(&dword_1A4F90000, v31, OS_LOG_TYPE_DEFAULT, "No file exists at this path to persist legacy file url: %@", buf, 0xCu);
      }

      LOBYTE(v27) = 0;
    }

  }
  else
  {
    +[MFMessageAttachmentMigrator log](MFMessageAttachmentMigrator, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v30;
      _os_log_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_DEFAULT, "Unable to migrateMaildropFileForMessage since current message with class %{public}@ is not MFLibraryMessage", buf, 0xCu);

    }
    LOBYTE(v27) = 0;
  }

  return v27;
}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  -[MFMessageAttachmentMigrator contentProtectionQueue](self, "contentProtectionQueue", a3, a4);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (a3 == 2)
  {
    +[MFMessageAttachmentMigrator log](MFMessageAttachmentMigrator, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1A4F90000, v10, OS_LOG_TYPE_DEFAULT, "Device about to lock", v12, 2u);
    }

    -[MFMessageAttachmentMigrator migrationState](self, "migrationState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lock");

    -[MFMessageAttachmentMigrator migrationState](self, "migrationState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unlockWithCondition:", 1);
  }
  else
  {
    if (a3)
      return;
    +[MFMessageAttachmentMigrator log](MFMessageAttachmentMigrator, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_DEFAULT, "Protected Index became available", buf, 2u);
    }

    -[MFMessageAttachmentMigrator migrationState](self, "migrationState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lock");

    -[MFMessageAttachmentMigrator migrationState](self, "migrationState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unlockWithCondition:", 0);
  }

}

- (MFMailMessageLibrary)library
{
  return (MFMailMessageLibrary *)objc_loadWeakRetained((id *)&self->_library);
}

- (void)setLibrary:(id)a3
{
  objc_storeWeak((id *)&self->_library, a3);
}

- (EFScheduler)backgroundMigrationScheduler
{
  return self->_backgroundMigrationScheduler;
}

- (void)setBackgroundMigrationScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundMigrationScheduler, a3);
}

- (OS_dispatch_queue)contentProtectionQueue
{
  return self->_contentProtectionQueue;
}

- (NSConditionLock)migrationState
{
  return self->_migrationState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationState, 0);
  objc_storeStrong((id *)&self->_contentProtectionQueue, 0);
  objc_storeStrong((id *)&self->_backgroundMigrationScheduler, 0);
  objc_destroyWeak((id *)&self->_library);
}

@end
