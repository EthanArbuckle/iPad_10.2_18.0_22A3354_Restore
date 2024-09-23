@implementation ECTransferActionIMAPReplayer

- (id)moveItems:(id)a3 destinationMailboxURL:(id)a4
{
  -[ECTransferActionIMAPReplayer _transferItems:destinationMailboxURL:isMove:](self, "_transferItems:destinationMailboxURL:isMove:", a3, a4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyItems:(id)a3 destinationMailboxURL:(id)a4
{
  -[ECTransferActionIMAPReplayer _transferItems:destinationMailboxURL:isMove:](self, "_transferItems:destinationMailboxURL:isMove:", a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_transferItems:(id)a3 destinationMailboxURL:(id)a4 isMove:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  id v24;
  void *v25;
  int v26;
  NSObject *v27;
  ECTransferMessageActionResults *v28;
  ECTransferMessageActionResults *v29;
  NSObject *v30;
  void *v31;
  ECTransferMessageActionResults *v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  void *v37;
  id v38;
  id v39;
  unint64_t v40;
  void *v41;
  ECTransferMessageActionResults *v42;
  NSObject *v43;
  void *v44;
  ECTransferMessageActionResults *v45;
  id v46;
  id v47;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;
  id v70;
  uint8_t *v71;
  id v72;
  id v73;
  id v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[32];
  uint8_t buf[8];
  uint8_t *v82;
  uint64_t v83;
  int v84;
  _BYTE v85[128];
  uint64_t v86;

  v5 = a5;
  v86 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[ECTransferActionIMAPReplayer delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imapMailboxNameForMailboxURL:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)objc_opt_new();
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    objc_msgSend(v8, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v76, v85, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v77;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v77 != v15)
            objc_enumerationMutation(v13);
          v17 = objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * v16), "integerValue");
          if (v17)
            objc_msgSend(v12, "addIndex:", v17);
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v76, v85, 16);
      }
      while (v14);
    }

    -[ECTransferActionIMAPReplayer delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ECLocalActionReplayer action](self, "action");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "mailboxURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "flagsForIMAPUIDs:mailboxURL:", v12, v20);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[ECTransferActionIMAPReplayer serverInterface](self, "serverInterface");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = 0;
      v75 = 0;
      v22 = objc_msgSend(v21, "moveUIDs:toMailboxNamed:copyInfo:error:", v12, v11, &v75, &v74);
      v23 = v75;
      v24 = v74;

      if ((v22 & 1) == 0)
      {
LABEL_13:
        -[ECTransferActionIMAPReplayer serverInterface](self, "serverInterface");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "hasValidConnection");

        if (v26)
        {
          +[ECLocalActionReplayer log](ECLocalActionReplayer, "log");
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            -[ECLocalActionReplayer action](self, "action");
            objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "ef_publicDescription");
            objc_claimAutoreleasedReturnValue();
            -[ECTransferActionIMAPReplayer _transferItems:destinationMailboxURL:isMove:].cold.3();
          }

          v28 = [ECTransferMessageActionResults alloc];
          v56[0] = MEMORY[0x1E0C809B0];
          v56[1] = 3221225472;
          v56[2] = __76__ECTransferActionIMAPReplayer__transferItems_destinationMailboxURL_isMove___block_invoke_11;
          v56[3] = &unk_1E7121CA8;
          v57 = v8;
          v29 = -[ECTransferMessageActionResults initWithBuilder:](v28, "initWithBuilder:", v56);

        }
        else
        {
          v29 = 0;
        }
        -[ECLocalActionReplayer setError:](self, "setError:", v24);
LABEL_35:

        goto LABEL_36;
      }
    }
    else
    {
      -[ECTransferActionIMAPReplayer serverInterface](self, "serverInterface");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = 0;
      v73 = 0;
      v34 = objc_msgSend(v33, "copyUIDs:toMailboxNamed:copyInfo:error:", v12, v11, &v73, &v72);
      v23 = v73;
      v24 = v72;

      if (!v34)
        goto LABEL_13;
    }
    v52 = (void *)objc_opt_new();
    if (v23
      && (-[ECTransferActionIMAPReplayer delegate](self, "delegate"),
          v35 = (void *)objc_claimAutoreleasedReturnValue(),
          v36 = objc_msgSend(v35, "checkUIDValidity:mailboxURL:", objc_msgSend(v23, "uidValidity"), v9),
          v35,
          v36))
    {
      *(_QWORD *)buf = 0;
      v82 = buf;
      v83 = 0x2020000000;
      v84 = 0;
      v49 = (void *)objc_opt_new();
      objc_msgSend(v23, "sourceUIDsToDestinationUIDs");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v66[0] = MEMORY[0x1E0C809B0];
      v66[1] = 3221225472;
      v66[2] = __76__ECTransferActionIMAPReplayer__transferItems_destinationMailboxURL_isMove___block_invoke;
      v66[3] = &unk_1E7121C30;
      v38 = v8;
      v67 = v38;
      v68 = v53;
      v50 = v52;
      v69 = v50;
      v39 = v49;
      v70 = v39;
      v71 = buf;
      objc_msgSend(v37, "enumerateKeysAndObjectsUsingBlock:", v66);

      objc_msgSend(v38, "allValues");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "count");
      if (v40 >= objc_msgSend(v51, "count"))
      {
        v41 = 0;
      }
      else
      {
        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = __76__ECTransferActionIMAPReplayer__transferItems_destinationMailboxURL_isMove___block_invoke_2;
        v64[3] = &unk_1E7121C58;
        v65 = v39;
        objc_msgSend(v51, "ef_filter:", v64);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if (objc_msgSend(v41, "count"))
      {
        +[ECLocalActionReplayer log](ECLocalActionReplayer, "log");
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          -[ECLocalActionReplayer action](self, "action");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[ECTransferActionIMAPReplayer _transferItems:destinationMailboxURL:isMove:].cold.2(v44, (uint64_t)v80, objc_msgSend(v41, "count"), v43);
        }

      }
      v45 = [ECTransferMessageActionResults alloc];
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __76__ECTransferActionIMAPReplayer__transferItems_destinationMailboxURL_isMove___block_invoke_8;
      v60[3] = &unk_1E7121C80;
      v46 = v39;
      v61 = v46;
      v62 = v50;
      v63 = v41;
      v47 = v41;
      v29 = -[ECTransferMessageActionResults initWithBuilder:](v45, "initWithBuilder:", v60);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v42 = [ECTransferMessageActionResults alloc];
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __76__ECTransferActionIMAPReplayer__transferItems_destinationMailboxURL_isMove___block_invoke_2_10;
      v58[3] = &unk_1E7121CA8;
      v59 = v8;
      v29 = -[ECTransferMessageActionResults initWithBuilder:](v42, "initWithBuilder:", v58);

    }
    goto LABEL_35;
  }
  +[ECLocalActionReplayer log](ECLocalActionReplayer, "log");
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    -[ECLocalActionReplayer action](self, "action");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[ECTransferActionIMAPReplayer _transferItems:destinationMailboxURL:isMove:].cold.1(v31, buf, v30);
  }

  v32 = [ECTransferMessageActionResults alloc];
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __76__ECTransferActionIMAPReplayer__transferItems_destinationMailboxURL_isMove___block_invoke_12;
  v54[3] = &unk_1E7121CA8;
  v55 = v8;
  v29 = -[ECTransferMessageActionResults initWithBuilder:](v32, "initWithBuilder:", v54);
  v12 = v55;
LABEL_36:

  return v29;
}

void __76__ECTransferActionIMAPReplayer__transferItems_destinationMailboxURL_isMove___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  ECServerMessage *v10;
  id v11;
  ECServerMessage *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;
  id v21;
  unint64_t v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "unsignedIntegerValue");
  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  EFStringWithUnsignedInteger();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = [ECServerMessage alloc];
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __76__ECTransferActionIMAPReplayer__transferItems_destinationMailboxURL_isMove___block_invoke_4;
    v18 = &unk_1E7121C08;
    v11 = v9;
    v19 = v11;
    v20 = *(id *)(a1 + 40);
    v21 = v5;
    v22 = v7;
    v12 = -[ECServerMessage initWithIMAPServerMessageBuilder:](v10, "initWithIMAPServerMessageBuilder:", &v15);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v12, v15, v16, v17, v18);
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v11);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if (v7 > *(unsigned int *)(v13 + 24))
      *(_DWORD *)(v13 + 24) = v7;

  }
  else
  {
    +[ECLocalActionReplayer log](ECLocalActionReplayer, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v5;
      _os_log_impl(&dword_1B9ADE000, v14, OS_LOG_TYPE_DEFAULT, "Got unexpected Source UID %@ while replaying action", buf, 0xCu);
    }

  }
}

void __76__ECTransferActionIMAPReplayer__transferItems_destinationMailboxURL_isMove___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "destinationMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMessagePersistentID:", v4);

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setServerFlags:", v5);

  objc_msgSend(v6, "setImapUID:", *(unsigned int *)(a1 + 56));
}

uint64_t __76__ECTransferActionIMAPReplayer__transferItems_destinationMailboxURL_isMove___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

void __76__ECTransferActionIMAPReplayer__transferItems_destinationMailboxURL_isMove___block_invoke_8(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setPhaseForResults:", 3);
  objc_msgSend(v3, "setCompletedItems:", a1[4]);
  objc_msgSend(v3, "setCreatedServerMessages:", a1[5]);
  objc_msgSend(v3, "setFailedItems:", a1[6]);

}

void __76__ECTransferActionIMAPReplayer__transferItems_destinationMailboxURL_isMove___block_invoke_2_10(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setPhaseForResults:", 3);
  objc_msgSend(*(id *)(a1 + 32), "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompletedItems:", v3);

}

void __76__ECTransferActionIMAPReplayer__transferItems_destinationMailboxURL_isMove___block_invoke_11(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setPhaseForResults:", 3);
  objc_msgSend(*(id *)(a1 + 32), "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFailedItems:", v3);

}

void __76__ECTransferActionIMAPReplayer__transferItems_destinationMailboxURL_isMove___block_invoke_12(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setPhaseForResults:", 3);
  objc_msgSend(*(id *)(a1 + 32), "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFailedItems:", v3);

}

- (BOOL)deleteSourceMessagesFromTransferItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  ECMessageFlagChange *v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "sourceRemoteID", (_QWORD)v19);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "integerValue");

        if (v11)
          objc_msgSend(v5, "addIndex:", v11);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v5, "count"))
  {
    v12 = -[ECMessageFlagChange initWithBuilder:]([ECMessageFlagChange alloc], "initWithBuilder:", &__block_literal_global_22);
    -[ECTransferActionIMAPReplayer serverInterface](self, "serverInterface");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "storeFlagChange:forUIDs:", v12, v5);

    -[ECTransferActionIMAPReplayer serverInterface](self, "serverInterface");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "expungeUIDs:", v5);

    if ((v14 & 1) != 0)
    {
      v16 = 1;
    }
    else
    {
      -[ECTransferActionIMAPReplayer serverInterface](self, "serverInterface");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v17, "hasValidConnection");

    }
  }
  else
  {
    v16 = 1;
  }

  return v16;
}

uint64_t __70__ECTransferActionIMAPReplayer_deleteSourceMessagesFromTransferItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "changesDeletedTo:", 1);
}

- (id)fetchBodyDataForRemoteID:(id)a3 mailboxURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  -[ECTransferActionIMAPReplayer delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECLocalActionReplayer action](self, "action");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mailboxURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageDataForRemoteID:mailboxURL:", v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)downloadFailed
{
  void *v3;
  void *v4;
  _BOOL4 v5;

  -[ECLocalActionReplayer error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECTransferActionIMAPReplayer serverInterface](self, "serverInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasValidConnection") & 1) != 0)
  {
    LOBYTE(v5) = 1;
  }
  else if (v3)
  {
    v5 = !-[ECTransferActionIMAPReplayer isRecoverableError:](self, "isRecoverableError:", v3);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)isRecoverableError:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[ECTransferActionIMAPReplayer delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "errorIsIMAPError:", v4) ^ 1;

  return v6;
}

- (id)appendItem:(id)a3 mailboxURL:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  ECServerMessage *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  int v21;
  ECServerMessage *v22;
  uint64_t v23;
  ECServerMessage *v24;
  ECTransferMessageActionResults *v25;
  ECServerMessage *v26;
  ECTransferMessageActionResults *v27;
  id *v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  ECTransferMessageActionResults *v33;
  ECTransferMessageActionResults *v34;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  ECServerMessage *v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  ECServerMessage *v48;
  _QWORD v49[4];
  id v50;
  int v51;
  id v52;
  id v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v40 = a4;
  objc_msgSend(v39, "destinationMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECTransferActionIMAPReplayer delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imapMailboxNameForMailboxURL:", v40);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[ECLocalActionReplayer log](ECLocalActionReplayer, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[ECLocalActionReplayer action](self, "action");
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D1EF48], "ec_redactedStringForMailboxURL:", v40);
      objc_claimAutoreleasedReturnValue();
      -[ECTransferActionIMAPReplayer appendItem:mailboxURL:].cold.1();
    }

  }
  -[ECTransferActionIMAPReplayer delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "messageDataForMessage:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "length");
  v13 = 0;
  v14 = 0;
  if (v8)
  {
    if (v12)
    {
      -[ECTransferActionIMAPReplayer serverInterface](self, "serverInterface");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "flags");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dateReceived");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 0;
      v53 = 0;
      v18 = objc_msgSend(v15, "appendData:toMailboxNamed:flags:dateReceived:appendInfo:error:", v11, v8, v16, v17, &v53, &v52);
      v14 = v53;
      v13 = (ECServerMessage *)v52;

      if (v18)
      {
        if (!v14
          || (-[ECTransferActionIMAPReplayer delegate](self, "delegate"),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              v20 = objc_msgSend(v19, "checkUIDValidity:mailboxURL:", objc_msgSend(v14, "uidValidity"), v40),
              v19,
              !v20))
        {
          v34 = [ECTransferMessageActionResults alloc];
          v44[0] = MEMORY[0x1E0C809B0];
          v44[1] = 3221225472;
          v44[2] = __54__ECTransferActionIMAPReplayer_appendItem_mailboxURL___block_invoke_3;
          v44[3] = &unk_1E7121CA8;
          v45 = v39;
          v27 = -[ECTransferMessageActionResults initWithBuilder:](v34, "initWithBuilder:", v44);
          v28 = &v45;
          goto LABEL_20;
        }
        v21 = objc_msgSend(v14, "newMessageUID");
        v22 = [ECServerMessage alloc];
        v23 = MEMORY[0x1E0C809B0];
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __54__ECTransferActionIMAPReplayer_appendItem_mailboxURL___block_invoke;
        v49[3] = &unk_1E7121CF0;
        v50 = v6;
        v51 = v21;
        v24 = -[ECServerMessage initWithIMAPServerMessageBuilder:](v22, "initWithIMAPServerMessageBuilder:", v49);
        v25 = [ECTransferMessageActionResults alloc];
        v46[0] = v23;
        v46[1] = 3221225472;
        v46[2] = __54__ECTransferActionIMAPReplayer_appendItem_mailboxURL___block_invoke_2;
        v46[3] = &unk_1E7121D18;
        v47 = v39;
        v26 = v24;
        v48 = v26;
        v27 = -[ECTransferMessageActionResults initWithBuilder:](v25, "initWithBuilder:", v46);

        v28 = &v50;
LABEL_17:

LABEL_20:
        goto LABEL_21;
      }
    }
  }
  -[ECTransferActionIMAPReplayer serverInterface](self, "serverInterface");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "hasValidConnection"))
  {

LABEL_14:
    +[ECLocalActionReplayer log](ECLocalActionReplayer, "log");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      -[ECLocalActionReplayer action](self, "action");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v11, "length");
      objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringForString:", v8);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v55 = v36;
      v56 = 2048;
      v57 = v37;
      v58 = 2114;
      v59 = v38;
      _os_log_error_impl(&dword_1B9ADE000, v32, OS_LOG_TYPE_ERROR, "<%{public}@> Permanent error trying to append message (Message Data Length = %lu, mailboxName = %{public}@).", buf, 0x20u);

    }
    v33 = [ECTransferMessageActionResults alloc];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __54__ECTransferActionIMAPReplayer_appendItem_mailboxURL___block_invoke_17;
    v41[3] = &unk_1E7121D18;
    v42 = v39;
    v13 = v13;
    v43 = v13;
    v27 = -[ECTransferMessageActionResults initWithBuilder:](v33, "initWithBuilder:", v41);
    v28 = &v42;
    v26 = v43;
    goto LABEL_17;
  }
  -[ECTransferActionIMAPReplayer delegate](self, "delegate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "errorIsIMAPError:", v13);

  if (v31)
    goto LABEL_14;
  v27 = 0;
LABEL_21:

  return v27;
}

void __54__ECTransferActionIMAPReplayer_appendItem_mailboxURL___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "persistentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessagePersistentID:", v3);

  objc_msgSend(*(id *)(a1 + 32), "flags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setServerFlags:", v4);

  objc_msgSend(v5, "setImapUID:", *(unsigned int *)(a1 + 40));
}

void __54__ECTransferActionIMAPReplayer_appendItem_mailboxURL___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "setPhaseForResults:", 3);
  v7[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCompletedItems:", v4);

  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCreatedServerMessages:", v5);

}

void __54__ECTransferActionIMAPReplayer_appendItem_mailboxURL___block_invoke_3(uint64_t a1, void *a2)
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

void __54__ECTransferActionIMAPReplayer_appendItem_mailboxURL___block_invoke_17(uint64_t a1, void *a2)
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

  objc_msgSend(v3, "setError:", *(_QWORD *)(a1 + 40));
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

- (void)_transferItems:(void *)a1 destinationMailboxURL:(uint8_t *)buf isMove:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1B9ADE000, log, OS_LOG_TYPE_ERROR, "<%{public}@>. Unable to find a destination folder while copying items.", buf, 0xCu);

  OUTLINED_FUNCTION_3();
}

- (void)_transferItems:(uint64_t)a3 destinationMailboxURL:(NSObject *)a4 isMove:.cold.2(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138543618;
  *(_QWORD *)(a2 + 4) = a1;
  *(_WORD *)(a2 + 12) = 2048;
  *(_QWORD *)(a2 + 14) = a3;
  OUTLINED_FUNCTION_0_3(&dword_1B9ADE000, "<%{public}@>. Failed to copy %lu items", (uint8_t *)a2, a4);

  OUTLINED_FUNCTION_3();
}

- (void)_transferItems:destinationMailboxURL:isMove:.cold.3()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_0_3(&dword_1B9ADE000, "<%{public}@>. Server interface does not have a valid connection for copying items. Error: %{public}@", v5, v6);

  OUTLINED_FUNCTION_3();
}

- (void)appendItem:mailboxURL:.cold.1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_0_3(&dword_1B9ADE000, "<%{public}@> Couldn't find IMAP mailbox name for URL %{public}@", v5, v6);

  OUTLINED_FUNCTION_3();
}

@end
