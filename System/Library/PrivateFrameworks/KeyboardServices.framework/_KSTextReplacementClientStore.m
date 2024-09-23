@implementation _KSTextReplacementClientStore

- (_KSTextReplacementClientStore)init
{
  _KSTextReplacementClientStore *v2;
  uint64_t v3;
  _KSTextReplacementServerConnection *connection;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_KSTextReplacementClientStore;
  v2 = -[_KSTextReplacementClientStore init](&v6, sel_init);
  if (v2)
  {
    +[_KSTextReplacementServerConnection serviceConnection](_KSTextReplacementServerConnection, "serviceConnection");
    v3 = objc_claimAutoreleasedReturnValue();
    connection = v2->_connection;
    v2->_connection = (_KSTextReplacementServerConnection *)v3;

  }
  return v2;
}

- (void)modifyEntry:(id)a3 toEntry:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  NSObject *v11;
  int64_t v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  void (**v18)(id, _QWORD);
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  if (objc_msgSend(v9, "isEquivalentTo:", v8))
  {
    KSCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[_KSTextReplacementClientStore modifyEntry:toEntry:withCompletionHandler:]";
      _os_log_impl(&dword_21DFEB000, v11, OS_LOG_TYPE_INFO, "%s  not modifying entry as old and new are the same", buf, 0xCu);
    }

    v10[2](v10, 0);
  }
  else
  {
    v12 = +[_KSTextReplacementHelper validateTextReplacement:](_KSTextReplacementHelper, "validateTextReplacement:", v9);
    if (v12)
    {
      v13 = v12;
      objc_msgSend(v9, "setPriorValue:", v8);
      +[_KSTextReplacementHelper errorWithCode:forEntry:](_KSTextReplacementHelper, "errorWithCode:forEntry:", v13, v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *))v10)[2](v10, v14);

    }
    else
    {
      v20 = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __75___KSTextReplacementClientStore_modifyEntry_toEntry_withCompletionHandler___block_invoke;
      v17[3] = &unk_24E2055D8;
      v18 = v10;
      -[_KSTextReplacementClientStore addEntries:removeEntries:withCompletionHandler:](self, "addEntries:removeEntries:withCompletionHandler:", v15, v16, v17);

    }
  }

}

- (void)addEntries:(id)a3 removeEntries:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  _KSTextReplacementServerConnection *connection;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  connection = self->_connection;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __80___KSTextReplacementClientStore_addEntries_removeEntries_withCompletionHandler___block_invoke;
  v11[3] = &unk_24E205600;
  v12 = v8;
  v10 = v8;
  -[_KSTextReplacementServerConnection addEntries:removeEntries:withReply:](connection, "addEntries:removeEntries:withReply:", a3, a4, v11);

}

- (void)removeAllEntries
{
  -[_KSTextReplacementServerConnection removeAllEntries](self->_connection, "removeAllEntries");
}

- (void)requestSyncWithCompletionBlock:(id)a3
{
  id v4;
  _KSTextReplacementServerConnection *connection;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  connection = self->_connection;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64___KSTextReplacementClientStore_requestSyncWithCompletionBlock___block_invoke;
  v7[3] = &unk_24E205628;
  v8 = v4;
  v6 = v4;
  -[_KSTextReplacementServerConnection requestSyncWithReply:](connection, "requestSyncWithReply:", v7);

}

- (void)cancelPendingUpdates
{
  -[_KSTextReplacementServerConnection cancelPendingUpdatesWithReply:](self->_connection, "cancelPendingUpdatesWithReply:", &__block_literal_global_3);
}

- (id)textReplacementEntries
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  id v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  v16 = 0;
  v3 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55___KSTextReplacementClientStore_textReplacementEntries__block_invoke;
  v8[3] = &unk_24E205690;
  v10 = &v11;
  v4 = v3;
  v9 = v4;
  -[_KSTextReplacementClientStore queryTextReplacementsWithCallback:](self, "queryTextReplacementsWithCallback:", v8);
  v5 = dispatch_time(0, 1000000000);
  v6 = 0;
  if (!dispatch_semaphore_wait(v4, v5))
    v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)queryTextReplacementsWithCallback:(id)a3
{
  id v4;
  _KSTextReplacementServerConnection *connection;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  connection = self->_connection;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67___KSTextReplacementClientStore_queryTextReplacementsWithCallback___block_invoke;
  v7[3] = &unk_24E2056B8;
  v8 = v4;
  v6 = v4;
  -[_KSTextReplacementServerConnection queryTextReplacementEntriesWithReply:](connection, "queryTextReplacementEntriesWithReply:", v7);

}

- (void)queryTextReplacementsWithPredicate:(id)a3 callback:(id)a4
{
  id v6;
  _KSTextReplacementServerConnection *connection;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  connection = self->_connection;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __77___KSTextReplacementClientStore_queryTextReplacementsWithPredicate_callback___block_invoke;
  v9[3] = &unk_24E2056B8;
  v10 = v6;
  v8 = v6;
  -[_KSTextReplacementServerConnection queryTextReplacementsWithPredicate:reply:](connection, "queryTextReplacementsWithPredicate:reply:", a3, v9);

}

- (void)performTransaction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueToInsert");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)objc_opt_class();
    objc_msgSend(v6, "valueToInsert");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textReplaceEntryFromTIDictionaryValue:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v8, "addObject:", v13);

    }
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v6, "valueToDelete");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)objc_opt_class();
    objc_msgSend(v6, "valueToDelete");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "textReplaceEntryFromTIDictionaryValue:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(v9, "addObject:", v14);
  }
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __70___KSTextReplacementClientStore_performTransaction_completionHandler___block_invoke;
  v18[3] = &unk_24E2055D8;
  v19 = v7;
  v17 = v7;
  -[_KSTextReplacementClientStore addEntries:removeEntries:withCompletionHandler:](self, "addEntries:removeEntries:withCompletionHandler:", v8, v9, v18);

}

- (id)phraseShortcuts
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[_KSTextReplacementClientStore textReplacementEntries](self, "textReplacementEntries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend((id)objc_opt_class(), "transactionFromTextReplacementEntry:forDelete:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), 0, (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
