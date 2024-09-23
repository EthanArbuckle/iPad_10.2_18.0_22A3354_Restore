@implementation ECTransferUndownloadedActionIMAPReplayer

- (id)replayAction
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  BOOL v19;
  void *v20;
  ECTransferMessageActionResults *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  int v26;
  ECTransferMessageActionResults *v27;
  void *v28;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[ECLocalActionReplayer action](self, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECTransferUndownloadedActionIMAPReplayer.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.action isKindOfClass:[ECTransferUndownloadedMessageAction class]]"));

  }
  -[ECLocalActionReplayer action](self, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "transferType") != 1)
    goto LABEL_7;
  -[ECTransferUndownloadedActionIMAPReplayer delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourceMailboxURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "destinationMailboxURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "moveSupportedFromMailboxURL:toURL:", v8, v9);

  if (v10)
  {
    if (-[ECTransferUndownloadedActionIMAPReplayer _moveAllMessages](self, "_moveAllMessages"))
      goto LABEL_21;
  }
  else
  {
LABEL_7:
    if (objc_msgSend(v6, "transferType") == 3)
    {
      objc_msgSend(v6, "itemsToDelete");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v12)
      {
        v13 = (void *)objc_opt_new();
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        objc_msgSend(v6, "itemsToDelete");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v15)
        {
          v16 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v32 != v16)
                objc_enumerationMutation(v14);
              objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "sourceRemoteID");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addIndex:", objc_msgSend(v18, "integerValue"));

            }
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
          }
          while (v15);
        }

        v19 = -[ECTransferUndownloadedActionIMAPReplayer _deleteUIDs:](self, "_deleteUIDs:", v13);
        -[ECTransferUndownloadedActionIMAPReplayer serverInterface](self, "serverInterface");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "expungeUIDs:", v13);

        if (v19)
          goto LABEL_21;
      }
      else
      {
        -[ECTransferUndownloadedActionIMAPReplayer _uidIndexSet](self, "_uidIndexSet");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[ECTransferUndownloadedActionIMAPReplayer _deleteUIDs:](self, "_deleteUIDs:", v22);

        -[ECTransferUndownloadedActionIMAPReplayer serverInterface](self, "serverInterface");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "expunge");

        if (v23)
        {
LABEL_21:
          v21 = -[ECLocalMessageActionResults initWithError:]([ECTransferMessageActionResults alloc], "initWithError:", 0);
          goto LABEL_25;
        }
      }
    }
    else
    {
      v21 = -[ECTransferUndownloadedActionIMAPReplayer _copyAllMessages:](self, "_copyAllMessages:", objc_msgSend(v6, "transferType") == 1);
      if (v21)
        goto LABEL_25;
    }
  }
  -[ECTransferUndownloadedActionIMAPReplayer serverInterface](self, "serverInterface");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "hasValidConnection");

  if (v26)
  {
    v27 = [ECTransferMessageActionResults alloc];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ECLocalActionReplayErrorDomain"), 1, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[ECLocalMessageActionResults initWithError:](v27, "initWithError:", v28);

  }
  else
  {
    v21 = 0;
  }
LABEL_25:

  return v21;
}

- (BOOL)_moveAllMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[ECLocalActionReplayer action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECTransferUndownloadedActionIMAPReplayer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "destinationMailboxURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imapMailboxNameForMailboxURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ECTransferUndownloadedActionIMAPReplayer serverInterface](self, "serverInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECTransferUndownloadedActionIMAPReplayer _uidIndexSet](self, "_uidIndexSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v7, "moveUIDs:toMailboxNamed:copyInfo:error:", v8, v6, 0, 0);

  return (char)v5;
}

- (id)_copyAllMessages:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  ECTransferMessageActionItem *v18;
  ECTransferMessageActionItem *v19;
  ECTransferMessageActionResults *v20;
  id v21;
  ECTransferMessageActionResults *v22;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[5];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v3 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  -[ECLocalActionReplayer action](self, "action");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECTransferUndownloadedActionIMAPReplayer delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "destinationMailboxURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imapMailboxNameForMailboxURL:", v6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[ECTransferUndownloadedActionIMAPReplayer serverInterface](self, "serverInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECTransferUndownloadedActionIMAPReplayer _uidIndexSet](self, "_uidIndexSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v9 = objc_msgSend(v7, "copyUIDs:toMailboxNamed:copyInfo:error:", v8, v26, &v35, 0);
  v27 = v35;

  objc_msgSend(v27, "sourceUIDsToDestinationUIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allKeys");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && objc_msgSend(v24, "count"))
  {
    v11 = (void *)objc_opt_new();
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v12 = v24;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    v14 = MEMORY[0x1E0C809B0];
    if (v13)
    {
      v15 = *(_QWORD *)v32;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v32 != v15)
            objc_enumerationMutation(v12);
          v17 = objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v16), "unsignedIntegerValue", v24);
          v18 = [ECTransferMessageActionItem alloc];
          v30[0] = v14;
          v30[1] = 3221225472;
          v30[2] = __61__ECTransferUndownloadedActionIMAPReplayer__copyAllMessages___block_invoke;
          v30[3] = &__block_descriptor_40_e46_v16__0___ECTransferMessageActionItemBuilder__8l;
          v30[4] = v17;
          v19 = -[ECTransferMessageActionItem initWithBuilder:](v18, "initWithBuilder:", v30);
          objc_msgSend(v11, "addObject:", v19);

          ++v16;
        }
        while (v13 != v16);
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v13);
    }

    v20 = [ECTransferMessageActionResults alloc];
    v28[0] = v14;
    v28[1] = 3221225472;
    v28[2] = __61__ECTransferUndownloadedActionIMAPReplayer__copyAllMessages___block_invoke_2;
    v28[3] = &unk_1E7121CA8;
    v21 = v11;
    v29 = v21;
    v22 = -[ECTransferMessageActionResults initWithBuilder:](v20, "initWithBuilder:", v28);

  }
  else if (v9)
  {
    v22 = -[ECLocalMessageActionResults initWithError:]([ECTransferMessageActionResults alloc], "initWithError:", 0);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

void __61__ECTransferUndownloadedActionIMAPReplayer__copyAllMessages___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  EFStringWithInt();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSourceRemoteID:", v2);

}

void __61__ECTransferUndownloadedActionIMAPReplayer__copyAllMessages___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setPhaseForResults:", 3);
  objc_msgSend(v3, "setCompletedItems:", *(_QWORD *)(a1 + 32));

}

- (BOOL)_deleteUIDs:(id)a3
{
  id v4;
  ECMessageFlagChange *v5;
  void *v6;
  char v7;

  v4 = a3;
  v5 = -[ECMessageFlagChange initWithBuilder:]([ECMessageFlagChange alloc], "initWithBuilder:", &__block_literal_global_23);
  -[ECTransferUndownloadedActionIMAPReplayer serverInterface](self, "serverInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "storeFlagChange:forUIDs:", v5, v4);

  return v7;
}

uint64_t __56__ECTransferUndownloadedActionIMAPReplayer__deleteUIDs___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "changesDeletedTo:", 1);
}

- (id)_uidIndexSet
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v46;

  -[ECLocalActionReplayer action](self, "action");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "oldestPersistedRemoteID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4)
    {
      +[ECLocalActionReplayer log](ECLocalActionReplayer, "log");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[ECTransferUndownloadedActionIMAPReplayer _uidIndexSet].cold.2(v23, v24, v25, v26, v27, v28, v29, v30);

      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
      v31 = objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    v46 = 0;
    v6 = objc_retainAutorelease(v4);
    if (sscanf((const char *)objc_msgSend(v6, "UTF8String"), "%lld", &v46) == 1)
    {
      if (v46 <= 0)
      {
        +[ECLocalActionReplayer log](ECLocalActionReplayer, "log");
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[ECTransferUndownloadedActionIMAPReplayer _uidIndexSet].cold.3(v7, v38, v39, v40, v41, v42, v43, v44);
      }
      else
      {
        if (!HIDWORD(v46))
        {
          objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 1, v46 - 1);
          v31 = objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        }
        +[ECLocalActionReplayer log](ECLocalActionReplayer, "log");
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[ECTransferUndownloadedActionIMAPReplayer _uidIndexSet].cold.4((uint64_t)&v46, v7, v8, v9, v10, v11, v12, v13);
      }
    }
    else
    {
      +[ECLocalActionReplayer log](ECLocalActionReplayer, "log");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[ECTransferUndownloadedActionIMAPReplayer _uidIndexSet].cold.5((uint64_t)v6, v7, v32, v33, v34, v35, v36, v37);
    }

    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v31 = objc_claimAutoreleasedReturnValue();
LABEL_19:
    v22 = (void *)v31;

    goto LABEL_20;
  }
  +[ECLocalActionReplayer log](ECLocalActionReplayer, "log");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[ECTransferUndownloadedActionIMAPReplayer _uidIndexSet].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v22;
}

- (ECIMAPServerInterface)serverInterface
{
  return self->serverInterface;
}

- (void)setServerInterface:(id)a3
{
  objc_storeStrong((id *)&self->serverInterface, a3);
}

- (ECIMAPLocalActionReplayerDelegate)delegate
{
  return (ECIMAPLocalActionReplayerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->serverInterface, 0);
}

- (void)_uidIndexSet
{
  OUTLINED_FUNCTION_0_0(&dword_1B9ADE000, a2, a3, "Failed to scan '%{public}@' as oldest persisted remote ID.", a5, a6, a7, a8, 2u);
}

@end
