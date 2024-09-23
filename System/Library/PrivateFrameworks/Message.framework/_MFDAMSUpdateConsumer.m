@implementation _MFDAMSUpdateConsumer

- (void)drainMailbox
{
  void *v3;
  BOOL v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  MFMailMessageLibrary *library;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A85B0E24](self, a2);
  v4 = self->super.mailbox == 0;
  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      -[MFDAMailbox folderID](self->super.mailbox, "folderID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_DEFAULT, "Failed erasing messages for folderID %@ - no such local mailbox.", (uint8_t *)&v10, 0xCu);

    }
  }
  else
  {
    if (v6)
    {
      -[MFDAMailbox folderID](self->super.mailbox, "folderID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_DEFAULT, "Erasing locally cached messages for folderID %@", (uint8_t *)&v10, 0xCu);

    }
    library = self->super.library;
    -[MFMailboxUid URLString](self->super.mailbox, "URLString");
    v5 = objc_claimAutoreleasedReturnValue();
    -[MFMailMessageLibrary removeAllMessagesFromMailbox:removeMailbox:andNotify:](library, "removeAllMessagesFromMailbox:removeMailbox:andNotify:", v5, 0, 1);
  }

  objc_autoreleasePoolPop(v3);
}

- (BOOL)handleItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  MFDAMessageStore *store;
  void *v14;
  void *v15;
  MFDAMessage *v16;
  void *v17;
  MFDAMessage *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  MFMailMessageLibrary *library;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[128];
  uint8_t buf[24];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->super.error)
    goto LABEL_77;
  v45 = v4;
  v44 = (void *)MEMORY[0x1A85B0E24]();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v6 = v45;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
  if (!v7)
    goto LABEL_24;
  v8 = *(_QWORD *)v61;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v61 != v8)
        objc_enumerationMutation(v6);
      v10 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
      v11 = objc_msgSend(v10, "itemChangeType");
      if (v11 == 2)
      {
        objc_msgSend(v10, "message");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "remoteID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[MFDAMessageStore messageForRemoteID:](self->super.store, "messageForRemoteID:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v49, "addObject:", v15);
      }
      else
      {
        if (v11 == 1)
        {
          objc_msgSend(v10, "message");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "remoteID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[MFDAMessageStore messageForRemoteID:](self->super.store, "messageForRemoteID:", v15);
          v16 = (MFDAMessage *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            if (objc_msgSend(v12, "isDraft"))
            {
              v18 = -[MFDAMessage initWithDAMailMessage:mailbox:]([MFDAMessage alloc], "initWithDAMailMessage:mailbox:", v12, self->super.mailbox);
              -[MFDAMessage setMessageStore:](v18, "setMessageStore:", self->super.store);
              objc_msgSend(v48, "addObject:", v18);
              objc_msgSend(v49, "addObject:", v16);

            }
            else
            {
              objc_msgSend(v55, "setObject:forKey:", v12, v16);
            }
          }
        }
        else
        {
          if (v11)
            continue;
          objc_msgSend(v10, "message");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          store = self->super.store;
          objc_msgSend(v12, "remoteID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[MFDAMessageStore messageForRemoteID:](store, "messageForRemoteID:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            DALoggingwithCategory();
            v16 = (MFDAMessage *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v16->super.super.super, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v12, "remoteID");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v17;
              _os_log_impl(&dword_1A4F90000, &v16->super.super.super, OS_LOG_TYPE_DEFAULT, "received a redundant SyncAddAction for a message with remote-id %@", buf, 0xCu);

            }
          }
          else
          {
            v16 = -[MFDAMessage initWithDAMailMessage:mailbox:]([MFDAMessage alloc], "initWithDAMailMessage:mailbox:", v12, self->super.mailbox);
            -[MFDAMessage setMessageStore:](v16, "setMessageStore:", self->super.store);
            objc_msgSend(v48, "addObject:", v16);
          }
        }

      }
    }
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
  }
  while (v7);
LABEL_24:

  if (objc_msgSend(v55, "count"))
  {
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    objc_msgSend(v55, "allKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    if (!v21)
      goto LABEL_49;
    v22 = *(_QWORD *)v57;
    while (1)
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v57 != v22)
          objc_enumerationMutation(v20);
        v24 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * j);
        objc_msgSend(v55, "objectForKey:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "readIsSet"))
        {
          if (objc_msgSend(v25, "read"))
            v26 = v54;
          else
            v26 = v53;
          objc_msgSend(v26, "addObject:", v24);
        }
        if (objc_msgSend(v25, "flaggedIsSet"))
        {
          if (objc_msgSend(v25, "flagged"))
            v27 = v52;
          else
            v27 = v51;
          objc_msgSend(v27, "addObject:", v24);
        }
        if (objc_msgSend(v25, "verbIsSet"))
        {
          v28 = objc_msgSend(v25, "lastVerb");
          v29 = v50;
          if (v28 == 1)
            goto LABEL_46;
          if (v28 == 3)
          {
            v29 = v46;
LABEL_46:
            objc_msgSend(v29, "addObject:", v24);
            goto LABEL_47;
          }
          v29 = v47;
          if (v28 == 2)
            goto LABEL_46;
        }
LABEL_47:

      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
      if (!v21)
      {
LABEL_49:

        break;
      }
    }
  }
  if (objc_msgSend(v48, "count"))
  {
    *(_QWORD *)buf = 0;
    library = self->super.library;
    -[MFLibraryStore account](self->super.store, "account");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    self->super.numNewMessages = insertDAMessages(v48, library, v31, self->super.mailbox, 0, buf);

    if ((buf[0] & 1) != 0 && (buf[0] & 8) != 0 && self->super.numNewMessages)
    {
      v32 = 1;
      if ((buf[0] & 2) != 0)
        v32 = 2;
      if ((buf[0] & 4) != 0)
        v33 = 3;
      else
        v33 = v32;
      -[MFActivityMonitor setGotNewMessagesState:](self->super.monitor, "setGotNewMessagesState:", v33);
    }
  }
  -[MFMailMessageLibrary persistence](self->super.library, "persistence");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "messageChangeManager");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v53, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D1E778], "clearRead");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "reflectFlagChanges:forMessages:", v36, v53);

  }
  if (objc_msgSend(v54, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D1E778], "setRead");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "reflectFlagChanges:forMessages:", v37, v54);

  }
  if (objc_msgSend(v51, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D1E778], "clearFlagged");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "reflectFlagChanges:forMessages:", v38, v51);

  }
  if (objc_msgSend(v52, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D1E778], "setFlagged");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "reflectFlagChanges:forMessages:", v39, v52);

  }
  if (objc_msgSend(v50, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D1E778], "setReplied");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "reflectFlagChanges:forMessages:", v40, v50);

  }
  if (objc_msgSend(v47, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D1E778], "setReplied");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "reflectFlagChanges:forMessages:", v41, v47);

  }
  if (objc_msgSend(v46, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D1E778], "setForwarded");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "reflectFlagChanges:forMessages:", v42, v46);

  }
  if (objc_msgSend(v49, "count"))
    objc_msgSend(v35, "reflectDeletedMessages:", v49);

  v5 = v45;
  objc_autoreleasePoolPop(v44);
LABEL_77:

  return 1;
}

- (void)receiveSyncActions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        -[MFBufferedQueue addItem:](self, "addItem:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)handleResponse:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFDAMessageStore.m"), 1730, CFSTR("should only reach here in the error case."));

  }
  DALoggingwithCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_1A4F90000, v9, OS_LOG_TYPE_ERROR, "error syncing folder: %@", (uint8_t *)&v11, 0xCu);
  }

  objc_storeStrong((id *)&self->super.error, a4);
  -[MFBufferedQueue flush](self, "flush");

}

@end
