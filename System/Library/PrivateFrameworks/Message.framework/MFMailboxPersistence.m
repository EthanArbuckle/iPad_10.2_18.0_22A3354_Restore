@implementation MFMailboxPersistence

uint64_t __62__MFMailboxPersistence_iOS_serverCountsForMailboxScope_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(MEMORY[0x1E0D1EB78], "mailboxesTableName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithResultColumn:table:", CFSTR("url"), v5);

  objc_msgSend(v6, "addResultColumn:", CFSTR("server_unread_count"));
  objc_msgSend(v6, "addResultColumn:", CFSTR("most_recent_status_count"));
  objc_msgSend(v6, "addResultColumn:", CFSTR("last_sync_status_count"));
  objc_msgSend(v6, "setWhere:", *(_QWORD *)(a1 + 32));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__MFMailboxPersistence_iOS_serverCountsForMailboxScope_block___block_invoke_2;
  v9[3] = &unk_1E4E8A470;
  v10 = *(id *)(a1 + 40);
  v7 = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v6, v9, 0);

  return v7;
}

void __62__MFMailboxPersistence_iOS_serverCountsForMailboxScope_block___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v4);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E1D8]), "initWithURL:", v5);
  objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "integerValue");

  objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "integerValue");

  objc_msgSend(v10, "objectAtIndexedSubscript:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "integerValue");

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __84__MFMailboxPersistence_iOS_mailboxDatabaseIDsForMailboxObjectIDs_createIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  objc_msgSend(v3, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(*(id *)(a1 + 32), "mailboxIDForURLString:createIfNecessary:", v5, 0);
  v7 = *MEMORY[0x1E0D1DC08];
  if (v6 == *MEMORY[0x1E0D1DC08])
  {
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 40), "mailboxProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "legacyMailboxForObjectID:", v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        v6 = objc_msgSend(*(id *)(a1 + 32), "mailboxIDForURLString:createIfNecessary:", v5, 1);
    }
  }
  if (v6 == v7)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

void __45__MFMailboxPersistence_iOS_mailboxCacheQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.mail.account.mailbox-cache", v2);
  v1 = (void *)mailboxCacheQueue_queue;
  mailboxCacheQueue_queue = (uint64_t)v0;

}

uint64_t __67__MFMailboxPersistence_iOS_mailboxDatabaseIDsForMailboxURLStrings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT rowid, url FROM mailboxes WHERE substr(url, 1, :length) IS :pattern ;"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    v16[0] = CFSTR(":pattern");
    v16[1] = CFSTR(":length");
    v17[0] = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT rowid, url FROM mailboxes;"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C9AA70];
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__MFMailboxPersistence_iOS_mailboxDatabaseIDsForMailboxURLStrings___block_invoke_2;
  v13[3] = &unk_1E4E8AEB0;
  v9 = *(id *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v14 = v9;
  v15 = v10;
  v11 = objc_msgSend(v5, "executeWithNamedBindings:usingBlock:error:", v8, v13, 0);

  return v11;
}

void __67__MFMailboxPersistence_iOS_mailboxDatabaseIDsForMailboxURLStrings___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4) & 1) != 0)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && v4)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v6, v4);

  }
}

uint64_t __59__MFMailboxPersistence_iOS_insertDatabaseRowForMailboxURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("INSERT OR IGNORE INTO mailboxes (url) values (?);"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearLastInsertedDatabaseID");
  objc_msgSend(*(id *)(a1 + 40), "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeWithIndexedBindings:usingBlock:error:", v6, &__block_literal_global_25, 0);

  v7 = objc_msgSend(v3, "lastInsertedDatabaseID");
  if (v7)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = v7;
  }
  else
  {

    objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT rowid FROM mailboxes WHERE url = ?;"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59__MFMailboxPersistence_iOS_insertDatabaseRowForMailboxURL___block_invoke_3;
    v11[3] = &unk_1E4E8A268;
    v11[4] = *(_QWORD *)(a1 + 48);
    objc_msgSend(v4, "executeWithIndexedBindings:usingBlock:error:", v9, v11, 0);

  }
  return 1;
}

void __59__MFMailboxPersistence_iOS_insertDatabaseRowForMailboxURL___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = objc_msgSend(v3, "int64Value");

}

uint64_t __59__MFMailboxPersistence_iOS_mailboxURLForMailboxDatabaseID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[5];
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "preparedStatementForQueryString:", CFSTR("SELECT url FROM mailboxes WHERE rowid IS :rowid ;"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR(":rowid");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__MFMailboxPersistence_iOS_mailboxURLForMailboxDatabaseID___block_invoke_2;
  v8[3] = &unk_1E4E8A268;
  v8[4] = *(_QWORD *)(a1 + 32);
  v6 = objc_msgSend(v3, "executeWithNamedBindings:usingBlock:error:", v5, v8, 0);

  return v6;
}

void __59__MFMailboxPersistence_iOS_mailboxURLForMailboxDatabaseID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "ef_urlWithString:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

@end
