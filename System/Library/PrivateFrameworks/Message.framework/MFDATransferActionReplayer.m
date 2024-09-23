@implementation MFDATransferActionReplayer

- (id)replayActionUsingStore:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MFDATransferActionReplayer setStore:](self, "setStore:", v4);
  -[ECTransferActionReplayer replayAction](self, "replayAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)appendItem:(id)a3 mailboxURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  MFDAMessageStoreSaveDraftRequest *v21;
  void *v22;
  MFDAMessageStoreSaveDraftRequest *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[3];

  v49[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[MFDATransferActionReplayer store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECLocalActionReplayer action](self, "action");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mailboxURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mailboxUidForURL:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "type") == 3)
  {
    v12 = objc_alloc(MEMORY[0x1E0D1E7D8]);
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __52__MFDATransferActionReplayer_appendItem_mailboxURL___block_invoke;
    v47[3] = &unk_1E4E8BF28;
    v48 = v5;
    v13 = (void *)objc_msgSend(v12, "initWithBuilder:", v47);
    v14 = v48;
LABEL_10:

    goto LABEL_15;
  }
  if (objc_msgSend(v11, "type") != 5)
  {
    v28 = objc_alloc(MEMORY[0x1E0D1E7D8]);
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __52__MFDATransferActionReplayer_appendItem_mailboxURL___block_invoke_2;
    v45[3] = &unk_1E4E8BF28;
    v46 = v5;
    v13 = (void *)objc_msgSend(v28, "initWithBuilder:", v45);
    v14 = v46;
    goto LABEL_10;
  }
  objc_msgSend(v11, "folderID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "syncAnchorForFolderID:mailbox:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
    objc_msgSend(v6, "fetchNumMessages:preservingUID:options:", 0, 0, 0);
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = objc_alloc(MEMORY[0x1E0C99E20]);
  v49[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v18, "initWithArray:", v19);

  v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "destinationMessage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = [MFDAMessageStoreSaveDraftRequest alloc];
    objc_msgSend(v11, "folderID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[MFDAMessageStoreSaveDraftRequest initWithMessage:mailbox:](v21, "initWithMessage:mailbox:", v20, v22);

    v24 = (void *)objc_opt_new();
    objc_msgSend(v7, "addRequest:consumer:mailbox:", v23, v24, v11);
    if (objc_msgSend(v24, "success"))
    {
      objc_msgSend(v17, "addObject:", v5);
      objc_msgSend(v36, "removeObject:", v5);
      v25 = objc_alloc(MEMORY[0x1E0D1E798]);
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __52__MFDATransferActionReplayer_appendItem_mailboxURL___block_invoke_3;
      v42[3] = &unk_1E4E8BF50;
      v43 = v20;
      v44 = v24;
      v26 = (void *)objc_msgSend(v25, "initWithServerMessageBuilder:", v42);
      objc_msgSend(v35, "addObject:", v26);

      v27 = 0;
    }
    else
    {
      objc_msgSend(v24, "error");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v27 = 0;
  }
  v29 = objc_alloc(MEMORY[0x1E0D1E7D8]);
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __52__MFDATransferActionReplayer_appendItem_mailboxURL___block_invoke_4;
  v37[3] = &unk_1E4E8BF78;
  v30 = v17;
  v38 = v30;
  v31 = v36;
  v39 = v31;
  v32 = v35;
  v40 = v32;
  v41 = v27;
  v33 = v27;
  v13 = (void *)objc_msgSend(v29, "initWithBuilder:", v37);

LABEL_15:
  return v13;
}

void __52__MFDATransferActionReplayer_appendItem_mailboxURL___block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(v3, "setCompletedItems:", v4);

}

void __52__MFDATransferActionReplayer_appendItem_mailboxURL___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "setPhaseForResults:", 3);
  v6[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFailedItems:", v4);

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1E4F0], 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setError:", v5);

}

void __52__MFDATransferActionReplayer_appendItem_mailboxURL___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "persistentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessagePersistentID:", v3);

  objc_msgSend(*(id *)(a1 + 40), "serverId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteID:", v4);

}

void __52__MFDATransferActionReplayer_appendItem_mailboxURL___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setPhaseForResults:", 3);
  objc_msgSend(v4, "setCompletedItems:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFailedItems:", v3);

  objc_msgSend(v4, "setCreatedServerMessages:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setError:", *(_QWORD *)(a1 + 56));

}

- (BOOL)deleteSourceMessagesFromTransferItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  char v16;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[ECLocalActionReplayer action](self, "action", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFDATransferActionReplayer store](self, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E778]), "initWithBuilder:", &__block_literal_global_30);
  objc_msgSend(v18, "itemsToDelete");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v12, "sourceRemoteID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13
          || (objc_msgSend(v12, "sourceMessage"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v14, "remoteID"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v14,
              v13))
        {
          objc_msgSend(v7, "addObject:", v13);
        }

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v9);
  }

  MFExchangeLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v7;
    _os_log_impl(&dword_1A4F90000, v15, OS_LOG_TYPE_DEFAULT, "Deleting source messages from transfer: %{public}@", buf, 0xCu);
  }

  v19 = 0;
  v16 = objc_msgSend(v4, "replayFlagChange:forRemoteIDs:error:completed:", v5, v7, &v19, 0);

  return v16;
}

uint64_t __68__MFDATransferActionReplayer_deleteSourceMessagesFromTransferItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "changesDeletedTo:", 1);
}

- (id)copyItems:(id)a3 destinationMailboxURL:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFDATransferActionReplayer.m"), 116, CFSTR("Copy is not supported for DA accounts"));

  return 0;
}

- (id)moveItems:(id)a3 destinationMailboxURL:(id)a4
{
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
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
  void *v21;
  _BOOL4 v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  id v30;
  void *v31;
  MFDAMoveResponseConsumer *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  NSObject *v51;
  MFDAMoveResponseConsumer *v52;
  NSObject *v53;
  void *v54;
  id v55;
  id v56;
  id v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  _QWORD v71[4];
  id v72;
  _QWORD v73[4];
  id v74;
  _QWORD v75[4];
  id v76;
  id v77;
  id v78;
  MFDAMoveResponseConsumer *v79;
  _QWORD v80[4];
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint8_t buf[4];
  id v95;
  __int16 v96;
  id v97;
  __int16 v98;
  uint64_t v99;
  _BYTE v100[128];
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  -[MFDATransferActionReplayer store](self, "store", a3, a4);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "account");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECLocalActionReplayer action](self, "action");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "itemsToCopy");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v61, "count");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v5);
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v7 = v61;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v90, v101, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v91;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v91 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
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
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, v12);
        }

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v90, v101, 16);
    }
    while (v8);
  }

  objc_msgSend(v67, "sourceMailboxURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "absoluteString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "mailboxUidForURL:", v15);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v68, "folderID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "destinationMailboxURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "absoluteString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "mailboxUidForURL:", v18);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v66, "folderID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "account");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20 == v69)
  {
    objc_msgSend(v66, "account");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v21 == v69 && v16 != 0 && v19 != 0;

    if (v24)
    {
      v64 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v63 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
      v88 = 0u;
      v89 = 0u;
      v86 = 0u;
      v87 = 0u;
      v25 = v6;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v86, v100, 16);
      if (v26)
      {
        v27 = *(_QWORD *)v87;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v87 != v27)
              objc_enumerationMutation(v25);
            v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1C2C0]), "initMoveRequestWithMessage:fromFolder:toFolder:", *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * j), v16, v19);
            if (v29)
              objc_msgSend(v70, "addObject:", v29);

          }
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v86, v100, 16);
        }
        while (v26);
      }

      if (objc_msgSend(v70, "count"))
      {
        v60 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v5);
        v30 = objc_alloc(MEMORY[0x1E0C99E60]);
        objc_msgSend(v25, "allKeys");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = (void *)objc_msgSend(v30, "initWithArray:", v31);

        v32 = -[MFDAMoveResponseConsumer initWithSourceRemoteIDs:destinationRemoteIDsBySourceRemoteIDs:failures:]([MFDAMoveResponseConsumer alloc], "initWithSourceRemoteIDs:destinationRemoteIDsBySourceRemoteIDs:failures:", v59, v62, v60);
        objc_msgSend(v69, "accountConduit");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "performMoveRequests:consumer:", v70, v32);

        -[MFDAMailAccountConsumer waitUntilDone](v32, "waitUntilDone");
        +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFDAMoveResponseConsumer error](v32, "error");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setError:", v35);

        v36 = -[MFDAMoveResponseConsumer statusCode](v32, "statusCode");
        if (-[MFDAMailAccountConsumer shouldRetryRequest](v32, "shouldRetryRequest"))
        {
          v37 = 0;
        }
        else
        {
          v48 = (void *)objc_opt_new();
          v80[0] = MEMORY[0x1E0C809B0];
          v80[1] = 3221225472;
          v80[2] = __62__MFDATransferActionReplayer_moveItems_destinationMailboxURL___block_invoke;
          v80[3] = &unk_1E4E8BFC0;
          v81 = v60;
          v49 = v63;
          v82 = v49;
          v83 = v62;
          v50 = v64;
          v84 = v50;
          v58 = v48;
          v85 = v58;
          objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v80);
          DALoggingwithCategory();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            v95 = v50;
            v96 = 2112;
            v97 = v49;
            v98 = 2048;
            v99 = v36;
            _os_log_impl(&dword_1A4F90000, v51, OS_LOG_TYPE_INFO, "Transfer action completed with successful items: %@. Failed items: %@. StatusCode: %lu", buf, 0x20u);
          }

          v52 = v32;
          if (objc_msgSend(v49, "count") && v36 == 15)
          {
            DALoggingwithCategory();
            v53 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A4F90000, v53, OS_LOG_TYPE_DEFAULT, "Transfer failed with Invalid Source Error. Moving the messages locally", buf, 2u);
            }

            objc_msgSend(v50, "addObjectsFromArray:", v49);
            objc_msgSend(v49, "removeAllObjects");
            +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "setError:", 0);

            v52 = v32;
          }
          v55 = objc_alloc(MEMORY[0x1E0D1E7D8]);
          v75[0] = MEMORY[0x1E0C809B0];
          v75[1] = 3221225472;
          v75[2] = __62__MFDATransferActionReplayer_moveItems_destinationMailboxURL___block_invoke_22;
          v75[3] = &unk_1E4E8BF78;
          v76 = v50;
          v56 = v58;
          v77 = v56;
          v78 = v49;
          v79 = v52;
          v37 = (void *)objc_msgSend(v55, "initWithBuilder:", v75);

        }
        v47 = v60;
      }
      else
      {
        v46 = objc_alloc(MEMORY[0x1E0D1E7D8]);
        v73[0] = MEMORY[0x1E0C809B0];
        v73[1] = 3221225472;
        v73[2] = __62__MFDATransferActionReplayer_moveItems_destinationMailboxURL___block_invoke_2_23;
        v73[3] = &unk_1E4E8BF28;
        v74 = v7;
        v37 = (void *)objc_msgSend(v46, "initWithBuilder:", v73);
        v47 = v74;
      }

      goto LABEL_53;
    }
  }
  else
  {

  }
  objc_msgSend(v68, "account");
  v38 = objc_claimAutoreleasedReturnValue();
  +[LocalAccount localAccount](LocalAccount, "localAccount");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if ((void *)v38 == v39)
  {
    objc_msgSend(v66, "account");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40 == v69)
    {
      v42 = (void *)v38;
      v43 = objc_msgSend(v66, "type") == 3;

      if (!v43)
      {
        v37 = 0;
        goto LABEL_54;
      }
      objc_msgSend(v7, "ef_compactMap:", &__block_literal_global_26);
      v64 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "library");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "compactMessages:", v64);

      v45 = objc_alloc(MEMORY[0x1E0D1E7D8]);
      v71[0] = MEMORY[0x1E0C809B0];
      v71[1] = 3221225472;
      v71[2] = __62__MFDATransferActionReplayer_moveItems_destinationMailboxURL___block_invoke_4;
      v71[3] = &unk_1E4E8BF28;
      v72 = v7;
      v37 = (void *)objc_msgSend(v45, "initWithBuilder:", v71);
      v41 = v72;
    }
    else
    {
      v64 = (id)v38;

      v37 = 0;
      v41 = (void *)v38;
    }

  }
  else
  {
    v64 = (id)v38;
    v37 = 0;

  }
LABEL_53:

LABEL_54:
  return v37;
}

void __62__MFDATransferActionReplayer_moveItems_destinationMailboxURL___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(a1[4], "containsObject:", v5))
  {
    objc_msgSend(a1[5], "addObject:", v6);
  }
  else
  {
    objc_msgSend(a1[6], "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(a1[7], "addObject:", v6);
      v8 = objc_alloc(MEMORY[0x1E0D1E798]);
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __62__MFDATransferActionReplayer_moveItems_destinationMailboxURL___block_invoke_2;
      v15 = &unk_1E4E8BF50;
      v16 = v6;
      v17 = v7;
      v9 = (void *)objc_msgSend(v8, "initWithServerMessageBuilder:", &v12);
      objc_msgSend(a1[8], "addObject:", v9, v12, v13, v14, v15);

    }
    else
    {
      DALoggingwithCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "destinationMessage");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v19 = v11;
        _os_log_impl(&dword_1A4F90000, v10, OS_LOG_TYPE_DEFAULT, "message %@ was successfully transferred, but we don't have a new remote ID for it", buf, 0xCu);

      }
    }

  }
}

void __62__MFDATransferActionReplayer_moveItems_destinationMailboxURL___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "destinationMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessagePersistentID:", v4);

  objc_msgSend(v5, "setRemoteID:", *(_QWORD *)(a1 + 40));
}

void __62__MFDATransferActionReplayer_moveItems_destinationMailboxURL___block_invoke_22(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setPhaseForResults:", 3);
  objc_msgSend(v4, "setCompletedItems:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setCreatedServerMessages:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setFailedItems:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setError:", v3);

}

void __62__MFDATransferActionReplayer_moveItems_destinationMailboxURL___block_invoke_2_23(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setPhaseForResults:", 3);
  objc_msgSend(v3, "setFailedItems:", *(_QWORD *)(a1 + 32));

}

id __62__MFDATransferActionReplayer_moveItems_destinationMailboxURL___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  objc_msgSend(a2, "sourceMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

void __62__MFDATransferActionReplayer_moveItems_destinationMailboxURL___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setPhaseForResults:", 3);
  objc_msgSend(v3, "setCompletedItems:", *(_QWORD *)(a1 + 32));

}

- (id)fetchBodyDataForRemoteID:(id)a3 mailboxURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[MFDATransferActionReplayer store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchBodyDataForRemoteID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)downloadFailed
{
  void *v3;
  _BOOL4 v4;

  -[ECLocalActionReplayer error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = !-[MFDATransferActionReplayer isRecoverableError:](self, "isRecoverableError:", v3);
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (BOOL)isRecoverableError:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D1C3B8]) ^ 1;

  return v4;
}

- (MFDAMessageStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
