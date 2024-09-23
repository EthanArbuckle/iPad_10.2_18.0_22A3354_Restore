@implementation MFMailboxPersistence_iOS

- (void)serverCountsForMailboxScope:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  char v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D1E1E0], "allMailboxesScope");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    v13 = 0;
LABEL_9:
    -[EDMailboxPersistence database](self, "database");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailboxPersistence_iOS serverCountsForMailboxScope:block:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __62__MFMailboxPersistence_iOS_serverCountsForMailboxScope_block___block_invoke;
    v17[3] = &unk_1E4E8CD40;
    v16 = v13;
    v18 = v16;
    v19 = v7;
    objc_msgSend(v14, "__performReadWithCaller:usingBlock:", v15, v17);

    goto LABEL_10;
  }
  v20 = 0;
  objc_msgSend(v6, "allMailboxObjectIDsWithMailboxTypeResolver:forExclusion:", self, &v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailboxPersistence_iOS mailboxDatabaseIDsForMailboxObjectIDs:createIfNecessary:](self, "mailboxDatabaseIDsForMailboxObjectIDs:createIfNecessary:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v20)
      objc_msgSend(v11, "notIn:", v10);
    else
      objc_msgSend(v11, "in:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }

LABEL_10:
}

- (id)mailboxDatabaseIDsForMailboxObjectIDs:(id)a3 createIfNecessary:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  MFMailboxPersistence_iOS *v13;
  BOOL v14;

  v6 = a3;
  -[MFMailboxPersistence_iOS library](self, "library");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__MFMailboxPersistence_iOS_mailboxDatabaseIDsForMailboxObjectIDs_createIfNecessary___block_invoke;
  v11[3] = &unk_1E4E8CCF8;
  v14 = a4;
  v12 = v7;
  v13 = self;
  v8 = v7;
  objc_msgSend(v6, "ef_compactMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (MFMailMessageLibrary)library
{
  return (MFMailMessageLibrary *)objc_loadWeakRetained((id *)&self->_library);
}

- (MFMailboxPersistence_iOS)initWithMailboxProvider:(id)a3 database:(id)a4 library:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  MFMailboxPersistence_iOS *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "persistence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hookRegistry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)MFMailboxPersistence_iOS;
  v13 = -[EDMailboxPersistence initWithMailboxProvider:database:hookRegistry:](&v15, sel_initWithMailboxProvider_database_hookRegistry_, v8, v9, v12);

  if (v13)
    objc_storeWeak((id *)&v13->_library, v10);

  return v13;
}

+ (OS_dispatch_queue)mailboxCacheQueue
{
  if (mailboxCacheQueue_onceToken != -1)
    dispatch_once(&mailboxCacheQueue_onceToken, &__block_literal_global_39);
  return (OS_dispatch_queue *)(id)mailboxCacheQueue_queue;
}

- (id)mailboxDatabaseIDsForMailboxURLStrings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ef_longestCommonPrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__14;
    v18 = __Block_byref_object_dispose__14;
    v19 = (id)0xAAAAAAAAAAAAAAAALL;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    -[EDMailboxPersistence database](self, "database");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailboxPersistence_iOS mailboxDatabaseIDsForMailboxURLStrings:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__MFMailboxPersistence_iOS_mailboxDatabaseIDsForMailboxURLStrings___block_invoke;
    v11[3] = &unk_1E4E89F60;
    v11[4] = v6;
    v12 = v4;
    v13 = &v14;
    objc_msgSend(v7, "__performReadWithCaller:usingBlock:", v8, v11);

    v9 = (id)v15[5];
    _Block_object_dispose(&v14, 8);

  }
  else
  {
    v9 = (id)MEMORY[0x1E0C9AA70];
  }

  return v9;
}

- (EDMailboxRowID_s)insertDatabaseRowForMailboxURL:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  EDMailboxRowID_s v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D1EB70]);
  v16 = 0;
  v17 = &v16;
  v18 = 0x2810000000;
  v19 = "";
  v20 = 0;
  -[EDMailboxPersistence database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailboxPersistence_iOS insertDatabaseRowForMailboxURL:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__MFMailboxPersistence_iOS_insertDatabaseRowForMailboxURL___block_invoke;
  v12[3] = &unk_1E4E89F60;
  v8 = v5;
  v13 = v8;
  v9 = v4;
  v14 = v9;
  v15 = &v16;
  objc_msgSend(v6, "__performWriteWithCaller:usingBlock:", v7, v12);

  v10.var0 = v17[4];
  _Block_object_dispose(&v16, 8);

  return v10;
}

- (id)mailboxURLForMailboxDatabaseID:(EDMailboxRowID_s)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  if (a3.var0)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__14;
    v13 = __Block_byref_object_dispose__14;
    v14 = 0;
    -[EDMailboxPersistence database](self, "database");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailboxPersistence_iOS mailboxURLForMailboxDatabaseID:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__MFMailboxPersistence_iOS_mailboxURLForMailboxDatabaseID___block_invoke;
    v8[3] = &unk_1E4E8A850;
    v8[4] = &v9;
    v8[5] = a3.var0;
    objc_msgSend(v4, "__performReadWithCaller:usingBlock:", v5, v8);

    v6 = (id)v10[5];
    _Block_object_dispose(&v9, 8);

    return v6;
  }
  else
  {
    return 0;
  }
}

- (BOOL)createMailbox:(id)a3 parentMailboxID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[EDMailboxPersistence mailboxProvider](self, "mailboxProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "legacyMailboxForObjectID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "newMailboxWithParent:name:", v9, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v10, "saveState");

  return v11 != 0;
}

- (BOOL)deleteMailbox:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[EDMailboxPersistence mailboxProvider](self, "mailboxProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "legacyMailboxForObjectID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "deleteMailbox:", v6);

  return v8;
}

- (BOOL)moveMailbox:(id)a3 newParentMailboxID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  -[EDMailboxPersistence mailboxProvider](self, "mailboxProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "legacyMailboxForObjectID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDMailboxPersistence mailboxProvider](self, "mailboxProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "legacyMailboxForObjectID:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = objc_msgSend(v12, "moveMailbox:intoParent:", v9, v11);

  return (char)v10;
}

- (BOOL)renameMailbox:(id)a3 newName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[EDMailboxPersistence mailboxProvider](self, "mailboxProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "legacyMailboxForObjectID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v10, "renameMailbox:newName:", v9, v7);

  return (char)v8;
}

- (void)recordFrecencyEventWithMailboxesWithIDs:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MFMailboxPersistence_iOS library](self, "library");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mailboxFrecencyController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordEventWithMailboxIDs:", v6);

}

- (void)testRecordFrecencyEventsForAllMailboxes
{
  void *v2;
  id v3;

  -[MFMailboxPersistence_iOS library](self, "library");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mailboxFrecencyController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "testRecordFrecencyEventsForAllMailboxes");

}

- (void)testResetFrecencyForAllMailboxes
{
  void *v2;
  id v3;

  -[MFMailboxPersistence_iOS library](self, "library");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mailboxFrecencyController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "testResetFrecencyForAllMailboxes");

}

- (BOOL)mailboxURLIsGmailLabel:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_library);
}

@end
