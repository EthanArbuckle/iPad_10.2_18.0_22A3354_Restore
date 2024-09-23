@implementation ECTransferActionReplayer

- (id)replayAction
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;

  -[ECLocalActionReplayer action](self, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECTransferActionReplayer.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[transferAction isKindOfClass:[ECTransferMessageAction class]]"));

  }
  objc_msgSend(v4, "itemsToDownload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[ECTransferActionReplayer _downLoadSourceMessagesInAction:](self, "_downLoadSourceMessagesInAction:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "itemsToCopy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      objc_msgSend(v4, "mailboxURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "destinationMailboxURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (v14)
      {
        -[ECTransferActionReplayer _appendMessagesInAction:](self, "_appendMessagesInAction:", v4);
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (objc_msgSend(v4, "transferType") == 1)
        {
          -[ECLocalActionReplayer delegate](self, "delegate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "sourceMailboxURL");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "destinationMailboxURL");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v17, "moveSupportedFromMailboxURL:toURL:", v18, v19);

        }
        else
        {
          v20 = 0;
        }
        -[ECTransferActionReplayer _transferItemsInAction:isMove:](self, "_transferItemsInAction:isMove:", v4, v20);
        v7 = objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      objc_msgSend(v4, "itemsToDelete");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (!v16)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECTransferActionReplayer.m"), 36, CFSTR("The copy action had nothing to do, so it shouldn't have been created"));

      }
      -[ECTransferActionReplayer _deleteItemsInAction:](self, "_deleteItemsInAction:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
    }
  }
  v8 = (void *)v7;

  return v8;
}

- (id)_downLoadSourceMessagesInAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ECTransferMessageActionResults *v10;
  ECTransferMessageActionResults *v11;
  NSObject *v12;
  void *v13;
  ECTransferMessageActionResults *v14;
  _QWORD v16[4];
  id v17;
  ECTransferActionReplayer *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "itemsToDownload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sourceRemoteID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mailboxURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECTransferActionReplayer fetchBodyDataForRemoteID:mailboxURL:](self, "fetchBodyDataForRemoteID:mailboxURL:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "length"))
  {
    v10 = [ECTransferMessageActionResults alloc];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __60__ECTransferActionReplayer__downLoadSourceMessagesInAction___block_invoke;
    v19[3] = &unk_1E7121D18;
    v20 = v6;
    v21 = v9;
    v11 = -[ECTransferMessageActionResults initWithBuilder:](v10, "initWithBuilder:", v19);

  }
  else if (-[ECTransferActionReplayer downloadFailed](self, "downloadFailed"))
  {
    +[ECLocalActionReplayer log](ECLocalActionReplayer, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[ECLocalActionReplayer action](self, "action");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ECTransferActionReplayer _downLoadSourceMessagesInAction:].cold.1(v13, (uint64_t)v6, buf, v12);
    }

    v14 = [ECTransferMessageActionResults alloc];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __60__ECTransferActionReplayer__downLoadSourceMessagesInAction___block_invoke_13;
    v16[3] = &unk_1E7121D18;
    v17 = v6;
    v18 = self;
    v11 = -[ECTransferMessageActionResults initWithBuilder:](v14, "initWithBuilder:", v16);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __60__ECTransferActionReplayer__downLoadSourceMessagesInAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "setPhaseForResults:", 1);
  v9[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCompletedItems:", v4);

  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDownloadedDataByCopyItems:", v6);

}

void __60__ECTransferActionReplayer__downLoadSourceMessagesInAction___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "setPhaseForResults:", 1);
  v6[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFailedItems:", v4);

  objc_msgSend(*(id *)(a1 + 40), "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setError:", v5);

}

- (id)_transferItemsInAction:(id)a3 isMove:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  ECTransferMessageActionResults *v11;
  ECTransferMessageActionResults *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  ECTransferMessageActionResults *v27;
  _QWORD v29[4];
  __CFString *v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  __CFString *v37;
  uint64_t v38;

  v4 = a4;
  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v31 = 0;
  -[ECTransferActionReplayer _allCopyItemsBySourceRemoteIDsForAction:failedItems:](self, "_allCopyItemsBySourceRemoteIDsForAction:failedItems:", v6, &v31);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v31;
  if (objc_msgSend(v8, "count"))
  {
    +[ECLocalActionReplayer log](ECLocalActionReplayer, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[ECLocalActionReplayer action](self, "action");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ECTransferActionReplayer _transferItemsInAction:isMove:].cold.1(v10, buf, v9);
    }

    v11 = [ECTransferMessageActionResults alloc];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __58__ECTransferActionReplayer__transferItemsInAction_isMove___block_invoke;
    v29[3] = &unk_1E7121CA8;
    v30 = (__CFString *)v8;
    v12 = -[ECTransferMessageActionResults initWithBuilder:](v11, "initWithBuilder:", v29);
    v13 = v30;
  }
  else
  {
    if (v4)
    {
      objc_msgSend(v6, "destinationMailboxURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ECTransferActionReplayer moveItems:destinationMailboxURL:](self, "moveItems:destinationMailboxURL:", v7, v14);
      v12 = (ECTransferMessageActionResults *)objc_claimAutoreleasedReturnValue();

      -[ECLocalMessageActionResults error](v12, "error");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (void *)MEMORY[0x1E0CB3940];
        -[ECLocalMessageActionResults error](v12, "error");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("didn't work, error = %@"), v17);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v13 = CFSTR("worked");
      }

      +[ECLocalActionReplayer log](ECLocalActionReplayer, "log");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        -[ECLocalActionReplayer action](self, "action");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v7, "count");
        *(_DWORD *)buf = 138543874;
        v33 = v23;
        v34 = 2048;
        v35 = v24;
        v36 = 2114;
        v37 = v13;
        _os_log_impl(&dword_1B9ADE000, v22, OS_LOG_TYPE_DEFAULT, "Replaying move action %{public}@ for %lu items %{public}@", buf, 0x20u);

      }
    }
    else
    {
      objc_msgSend(v6, "destinationMailboxURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (ECTransferMessageActionResults *)-[ECTransferActionReplayer copyItems:destinationMailboxURL:](self, "copyItems:destinationMailboxURL:", v7, v18);

      -[ECLocalMessageActionResults error](v12, "error");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = (void *)MEMORY[0x1E0CB3940];
        -[ECLocalMessageActionResults error](v12, "error");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("didn't work, error = %@"), v21);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v13 = CFSTR("worked");
      }

      +[ECLocalActionReplayer log](ECLocalActionReplayer, "log");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        -[ECLocalActionReplayer action](self, "action");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v7, "count");
        *(_DWORD *)buf = 138543874;
        v33 = v25;
        v34 = 2048;
        v35 = v26;
        v36 = 2114;
        v37 = v13;
        _os_log_impl(&dword_1B9ADE000, v22, OS_LOG_TYPE_DEFAULT, "Replaying copy action %{public}@ for %lu items %{public}@", buf, 0x20u);

      }
    }

  }
  v27 = v12;

  return v27;
}

void __58__ECTransferActionReplayer__transferItemsInAction_isMove___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setPhaseForResults:", 3);
  objc_msgSend(v3, "setFailedItems:", *(_QWORD *)(a1 + 32));

}

- (id)_allCopyItemsBySourceRemoteIDsForAction:(id)a3 failedItems:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v18, "itemsToCopy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v20;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
      objc_msgSend(v11, "sourceRemoteID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12
        || (objc_msgSend(v11, "sourceMessage"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v13, "remoteID"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v13,
            v12))
      {
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12);
      }
      else
      {
        objc_msgSend(v6, "addObject:", v11);
      }
      v14 = (unint64_t)objc_msgSend(v5, "count") < 0x1F5;

      if (!v14)
        break;
      if (v8 == ++v10)
      {
        v15 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        v8 = v15;
        if (v15)
          goto LABEL_3;
        break;
      }
    }
  }

  v16 = objc_msgSend(v6, "count");
  if (a4 && v16)
    *a4 = objc_retainAutorelease(v6);

  return v5;
}

- (id)_appendMessagesInAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  ECTransferMessageActionResults *v13;
  ECTransferMessageActionResults *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "itemsToCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "destinationMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_3;
  objc_msgSend(v6, "destinationMessage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "flags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "deleted");

  if (!v10)
  {
    objc_msgSend(v4, "destinationMailboxURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ECTransferActionReplayer appendItem:mailboxURL:](self, "appendItem:mailboxURL:", v6, v15);
    v14 = (ECTransferMessageActionResults *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_3:
    +[ECLocalActionReplayer log](ECLocalActionReplayer, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[ECLocalActionReplayer action](self, "action");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v12;
      _os_log_impl(&dword_1B9ADE000, v11, OS_LOG_TYPE_DEFAULT, "<%{public}@>. Not appending deleted messages", buf, 0xCu);

    }
    v13 = [ECTransferMessageActionResults alloc];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __52__ECTransferActionReplayer__appendMessagesInAction___block_invoke;
    v17[3] = &unk_1E7121CA8;
    v18 = v6;
    v14 = -[ECTransferMessageActionResults initWithBuilder:](v13, "initWithBuilder:", v17);

  }
  return v14;
}

void __52__ECTransferActionReplayer__appendMessagesInAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "setPhaseForResults:", 3);
  v5[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFailedItems:", v4);

}

- (id)_deleteItemsInAction:(id)a3
{
  id v4;
  void *v5;
  int v6;
  __CFString *v7;
  __CFString *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  ECTransferMessageActionResults *v12;
  ECTransferMessageActionResults *v13;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "itemsToDelete");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ECTransferActionReplayer deleteSourceMessagesFromTransferItems:](self, "deleteSourceMessagesFromTransferItems:", v5);

  v7 = CFSTR("got connection error");
  if (v6)
    v7 = CFSTR("finished");
  v8 = v7;
  +[ECLocalActionReplayer log](ECLocalActionReplayer, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[ECLocalActionReplayer action](self, "action");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemsToDelete");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v10;
    v19 = 2048;
    v20 = objc_msgSend(v11, "count");
    v21 = 2114;
    v22 = v8;
    _os_log_impl(&dword_1B9ADE000, v9, OS_LOG_TYPE_DEFAULT, "Replaying delete action %{public}@ for %lu items %{public}@", buf, 0x20u);

  }
  if (v6)
  {
    v12 = [ECTransferMessageActionResults alloc];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __49__ECTransferActionReplayer__deleteItemsInAction___block_invoke;
    v15[3] = &unk_1E7121CA8;
    v16 = v4;
    v13 = -[ECTransferMessageActionResults initWithBuilder:](v12, "initWithBuilder:", v15);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __49__ECTransferActionReplayer__deleteItemsInAction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setPhaseForResults:", 4);
  objc_msgSend(*(id *)(a1 + 32), "itemsToDelete");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompletedItems:", v3);

}

- (id)failActionWithError:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  ECTransferMessageActionResults *v17;
  id v18;
  id v19;
  ECTransferMessageActionResults *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[ECLocalActionReplayer action](self, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECTransferActionReplayer.m"), 152, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[action isKindOfClass:[ECTransferMessageAction class]]"));

  }
  v7 = v6;
  objc_msgSend(v7, "itemsToDownload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    objc_msgSend(v7, "itemsToDownload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 1;
  }
  else
  {
    objc_msgSend(v7, "itemsToCopy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      objc_msgSend(v7, "itemsToCopy");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 3;
    }
    else
    {
      objc_msgSend(v7, "itemsToDelete");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECTransferActionReplayer.m"), 164, CFSTR("The copy action had nothing to do, so it shouldn't have been created"));

      }
      objc_msgSend(v7, "itemsToDelete");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 4;
    }
  }
  +[ECLocalActionReplayer log](ECLocalActionReplayer, "log");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    -[ECLocalActionReplayer action](self, "action");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ECLocalActionReplayer error](self, "error");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "ef_publicDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v22;
    v33 = 2114;
    v34 = v24;
    _os_log_error_impl(&dword_1B9ADE000, v16, OS_LOG_TYPE_ERROR, "<%{public}@>. Failed with error: %{public}@", buf, 0x16u);

  }
  v17 = [ECTransferMessageActionResults alloc];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __48__ECTransferActionReplayer_failActionWithError___block_invoke;
  v27[3] = &unk_1E7121D40;
  v30 = v11;
  v28 = v10;
  v18 = v5;
  v29 = v18;
  v19 = v10;
  v20 = -[ECTransferMessageActionResults initWithBuilder:](v17, "initWithBuilder:", v27);

  return v20;
}

void __48__ECTransferActionReplayer_failActionWithError___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setPhaseForResults:", a1[6]);
  objc_msgSend(v3, "setFailedItems:", a1[4]);
  objc_msgSend(v3, "setError:", a1[5]);

}

- (void)_downLoadSourceMessagesInAction:(uint8_t *)buf .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1B9ADE000, log, OS_LOG_TYPE_ERROR, "<%{public}@>. Download failed for item: %{publid}@", buf, 0x16u);

}

- (void)_transferItemsInAction:(os_log_t)log isMove:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1B9ADE000, log, OS_LOG_TYPE_ERROR, "<%{public}@>. Failed due to source messages without UIDs", buf, 0xCu);

}

@end
