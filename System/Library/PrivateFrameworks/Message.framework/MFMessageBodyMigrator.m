@implementation MFMessageBodyMigrator

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__MFMessageBodyMigrator_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_18 != -1)
    dispatch_once(&log_onceToken_18, block);
  return (OS_os_log *)(id)log_log_18;
}

void __28__MFMessageBodyMigrator_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_18;
  log_log_18 = (uint64_t)v1;

}

- (MFMessageBodyMigrator)initWithLibrary:(id)a3
{
  id v4;
  MFMessageBodyMigrator *v5;
  MFMessageBodyMigrator *v6;
  uint64_t v7;
  EFLazyCache *directoryContentCache;
  uint64_t v9;
  EFScheduler *backgroundMigrationScheduler;
  uint64_t v11;
  NSMutableArray *mailboxesToCheck;
  void *v13;
  void *v14;
  MFMessageBodyMigrator *v15;
  _QWORD v17[4];
  MFMessageBodyMigrator *v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MFMessageBodyMigrator;
  v5 = -[MFMessageBodyMigrator init](&v19, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_library, v4);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1EED8]), "initWithCountLimit:", 5);
    directoryContentCache = v6->_directoryContentCache;
    v6->_directoryContentCache = (EFLazyCache *)v7;

    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.email.MFMessageBodyMigrator"), 9);
    v9 = objc_claimAutoreleasedReturnValue();
    backgroundMigrationScheduler = v6->_backgroundMigrationScheduler;
    v6->_backgroundMigrationScheduler = (EFScheduler *)v9;

    v11 = objc_opt_new();
    mailboxesToCheck = v6->_mailboxesToCheck;
    v6->_mailboxesToCheck = (NSMutableArray *)v11;

    objc_msgSend(v4, "database");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMessageBodyMigrator initWithLibrary:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __41__MFMessageBodyMigrator_initWithLibrary___block_invoke;
    v17[3] = &unk_1E4E8AB20;
    v15 = v6;
    v18 = v15;
    objc_msgSend(v13, "__performReadWithCaller:usingBlock:", v14, v17);

    v15->_upgradeLock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

uint64_t __41__MFMessageBodyMigrator_initWithLibrary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("url"), CFSTR("mailboxes"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__MFMessageBodyMigrator_initWithLibrary___block_invoke_2;
  v6[3] = &unk_1E4E8A048;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v4, v6, 0);

  return 1;
}

void __41__MFMessageBodyMigrator_initWithLibrary___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  +[MailAccount mailboxUidFromActiveAccountsForURL:](MailAccount, "mailboxUidFromActiveAccountsForURL:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", v4);

}

- (void)startMigratingBodies
{
  void *v3;
  _QWORD v4[5];

  -[MFMessageBodyMigrator backgroundMigrationScheduler](self, "backgroundMigrationScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__MFMessageBodyMigrator_startMigratingBodies__block_invoke;
  v4[3] = &unk_1E4E88DC8;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

void __45__MFMessageBodyMigrator_startMigratingBodies__block_invoke(uint64_t a1)
{
  os_unfair_lock_s *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  while (1)
  {
    v2 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
    os_unfair_lock_lock(v2);
    objc_msgSend(*(id *)(a1 + 32), "mailboxesToCheck");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(v2);
    v5 = *(void **)(a1 + 32);
    if (!v4)
      break;
    if ((objc_msgSend(v5, "_mailboxHasUnmigratedFiles:", v4) & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "_migrateAllFilesForMailbox:", v4);

  }
  objc_msgSend(v5, "library");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bodyMigrationFinished");

}

- (void)migrateBodyForMessageIfNecessary:(id)a3
{
  void *v4;
  _BOOL4 v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "mailbox");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MFMessageBodyMigrator _mailboxHasUnmigratedFiles:](self, "_mailboxHasUnmigratedFiles:", v4);

  if (v5)
    -[MFMessageBodyMigrator _migrateDataFilesForMessage:](self, "_migrateDataFilesForMessage:", v6);

}

- (void)_migrateDataFilesForMessage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  char v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  char v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  char v33;
  id v34;
  NSObject *v35;
  MFMessageBodyMigrator *v36;
  void *v37;
  void *v38;
  void *v39;
  id obj;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  uint8_t buf[4];
  id v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v44 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageBodyMigrator _filesForMessage:](self, "_filesForMessage:", v44);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v38, "count"))
  {
    v4 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v44, "mailbox");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fullPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("Messages"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileURLWithPath:", v7);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v44, "account");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageBodyMigrator library](self, "library");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v8, "messageBasePathForAccount:", v39);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D1EB20], "messageDataDirectoryURLForGlobalMessageID:basePath:purgeable:", objc_msgSend(v44, "globalMessageID"), v37, objc_msgSend(v39, "supportsPurge"));
    v36 = self;
    v52 = 0;
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_msgSend(v43, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
    v9 = 0;
    if ((v8 & 1) == 0)
    {
      +[MFMessageBodyMigrator log](MFMessageBodyMigrator, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[MFMessageBodyMigrator _migrateDataFilesForMessage:].cold.3((uint64_t)v9, v10, v11);

    }
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    obj = v38;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v49;
      do
      {
        v14 = 0;
        v15 = v9;
        do
        {
          if (*(_QWORD *)v49 != v13)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v14);
          objc_msgSend(v44, "externalID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "substringFromIndex:", objc_msgSend(v17, "length") + 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = CFSTR("full.emlx");
          if ((objc_msgSend(v18, "isEqualToString:", CFSTR("emlx")) & 1) == 0)
            v19 = v18;
          objc_msgSend(v42, "URLByAppendingPathComponent:", v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "URLByAppendingPathComponent:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v15;
          v22 = objc_msgSend(v43, "moveItemAtURL:toURL:error:", v20, v21, &v47);
          v9 = v47;

          if ((v22 & 1) == 0)
          {
            +[MFMessageBodyMigrator log](MFMessageBodyMigrator, "log");
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v54 = v9;
              _os_log_error_impl(&dword_1A4F90000, v23, OS_LOG_TYPE_ERROR, "Got error %@ creating body file directory", buf, 0xCu);
            }

          }
          ++v14;
          v15 = v9;
        }
        while (v12 != v14);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
      }
      while (v12);
    }

    -[MFMessageBodyMigrator legacyAttachmentDirectoryForMessage:](v36, "legacyAttachmentDirectoryForMessage:", v44);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "path");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v43, "fileExistsAtPath:", v25);

    if (v26)
    {
      -[MFMessageBodyMigrator _legacyAttachmentDataDirectoryURLForGlobalMessageID:basePath:purgeable:](v36, "_legacyAttachmentDataDirectoryURLForGlobalMessageID:basePath:purgeable:", objc_msgSend(v44, "globalMessageID"), v37, objc_msgSend(v39, "supportsPurge"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "URLByDeletingLastPathComponent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v9;
      v29 = objc_msgSend(v43, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v28, 1, 0, &v46);
      v30 = v46;

      if ((v29 & 1) == 0)
      {
        +[MFMessageBodyMigrator log](MFMessageBodyMigrator, "log");
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          -[MFMessageBodyMigrator _migrateDataFilesForMessage:].cold.2((uint64_t)v30, v31, v32);

      }
      v45 = v30;
      v33 = objc_msgSend(v43, "moveItemAtURL:toURL:error:", v24, v27, &v45);
      v34 = v45;

      if ((v33 & 1) == 0)
      {
        +[MFMessageBodyMigrator log](MFMessageBodyMigrator, "log");
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          -[MFMessageBodyMigrator _migrateDataFilesForMessage:].cold.1((uint64_t)v34, (uint64_t)v24, v35);

      }
    }
    else
    {
      v34 = v9;
    }

  }
}

- (BOOL)_mailboxHasUnmigratedFiles:(id)a3
{
  id v4;
  os_unfair_lock_s *p_upgradeLock;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  void *v18;

  v4 = a3;
  p_upgradeLock = &self->_upgradeLock;
  os_unfair_lock_lock(&self->_upgradeLock);
  -[MFMessageBodyMigrator mailboxesToCheck](self, "mailboxesToCheck");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if (v7)
  {
    objc_msgSend(v4, "fullPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("Messages"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[MFMessageBodyMigrator _directoryContentsForPath:](self, "_directoryContentsForPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
      goto LABEL_4;
    objc_msgSend(v4, "fullPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("Attachments"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentsOfDirectoryAtPath:error:", v12, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
LABEL_4:
      v16 = 1;
    }
    else
    {
      -[MFMessageBodyMigrator mailboxesToCheck](self, "mailboxesToCheck");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeObject:", v4);

      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }
  os_unfair_lock_unlock(p_upgradeLock);

  return v16;
}

- (id)_legacyAttachmentDataDirectoryURLForGlobalMessageID:(int64_t)a3 basePath:(id)a4 purgeable:(BOOL)a5
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D1EB20], "messageDataDirectoryURLForGlobalMessageID:basePath:purgeable:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("Attachments"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_migrateAllFilesForMailbox:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v4 = a3;
  +[MFMessageCriterion criterionForMailbox:](MFMessageCriterion, "criterionForMailbox:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageBodyMigrator library](self, "library");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__MFMessageBodyMigrator__migrateAllFilesForMailbox___block_invoke;
  v10[3] = &unk_1E4E8D508;
  v10[4] = self;
  objc_msgSend(v6, "iterateMessagesMatchingCriterion:options:handler:", v5, 6297663, v10);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fullPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeItemAtPath:error:", v8, 0);

  os_unfair_lock_lock(&self->_upgradeLock);
  -[MFMessageBodyMigrator mailboxesToCheck](self, "mailboxesToCheck");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObject:", v4);

  os_unfair_lock_unlock(&self->_upgradeLock);
}

uint64_t __52__MFMessageBodyMigrator__migrateAllFilesForMailbox___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_migrateDataFilesForMessage:", a2);
}

- (id)_filesForMessage:(id)a3
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
  _QWORD v14[4];
  id v15;
  _BYTE v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "externalID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "mailbox");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fullPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("Messages"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[MFMessageBodyMigrator _directoryContentsForPath:](self, "_directoryContentsForPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      os_unfair_lock_lock(&self->_upgradeLock);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __42__MFMessageBodyMigrator__filesForMessage___block_invoke;
      v14[3] = &unk_1E4E8D530;
      v15 = v5;
      objc_msgSend(v9, "ef_filter:", v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectsInArray:", v10);

      os_unfair_lock_unlock(&self->_upgradeLock);
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    +[MFMessageBodyMigrator log](MFMessageBodyMigrator, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "ef_publicDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageBodyMigrator _filesForMessage:].cold.1(v12, (uint64_t)v16, v11);
    }

    v10 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

uint64_t __42__MFMessageBodyMigrator__filesForMessage___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPrefix:", *(_QWORD *)(a1 + 32));
}

- (id)legacyAttachmentDirectoryForMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v3, "mailbox");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fullPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("Attachments"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "libraryID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_directoryContentsForPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[MFMessageBodyMigrator directoryContentCache](self, "directoryContentCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__MFMessageBodyMigrator__directoryContentsForPath___block_invoke;
  v9[3] = &unk_1E4E8D558;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "objectForKey:generator:", v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __51__MFMessageBodyMigrator__directoryContentsForPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentsOfDirectoryAtPath:error:", *(_QWORD *)(a1 + 32), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  return v4;
}

- (MFMailMessageLibrary)library
{
  return (MFMailMessageLibrary *)objc_loadWeakRetained((id *)&self->_library);
}

- (void)setLibrary:(id)a3
{
  objc_storeWeak((id *)&self->_library, a3);
}

- (EFLazyCache)directoryContentCache
{
  return self->_directoryContentCache;
}

- (void)setDirectoryContentCache:(id)a3
{
  objc_storeStrong((id *)&self->_directoryContentCache, a3);
}

- (EFScheduler)backgroundMigrationScheduler
{
  return self->_backgroundMigrationScheduler;
}

- (void)setBackgroundMigrationScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundMigrationScheduler, a3);
}

- (NSMutableArray)mailboxesToCheck
{
  return self->_mailboxesToCheck;
}

- (void)setMailboxesToCheck:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxesToCheck, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxesToCheck, 0);
  objc_storeStrong((id *)&self->_backgroundMigrationScheduler, 0);
  objc_storeStrong((id *)&self->_directoryContentCache, 0);
  objc_destroyWeak((id *)&self->_library);
}

- (void)_migrateDataFilesForMessage:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "Got error %@ moving attachment directory %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_5();
}

- (void)_migrateDataFilesForMessage:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a2, a3, "Got error %@ creating attachment parent directory", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

- (void)_migrateDataFilesForMessage:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a2, a3, "Got error %@ creating body file directory", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

- (void)_filesForMessage:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a3, (uint64_t)a3, "No externalID for message %{public}@", (uint8_t *)a2);

}

@end
