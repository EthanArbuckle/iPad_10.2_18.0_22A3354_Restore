@implementation MFBaseSyncResponseQueue

- (MFBaseSyncResponseQueue)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFBaseSyncResponseQueue;
  return -[MFBufferedQueue initWithMaximumSize:latency:](&v3, sel_initWithMaximumSize_latency_, 256, 1.0);
}

- (BOOL)handleItems:(id)a3
{
  id v4;
  void *v5;
  unint64_t currentUID;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSArray *serverMessages;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  BOOL v22;
  unint64_t v23;
  unsigned int v24;
  NSMutableArray *missingUIDs;
  NSMutableArray *v27;
  NSMutableArray *v28;
  void *v29;
  uint64_t v30;
  MFLibraryIMAPStore *store;
  void *v32;
  MFLibraryIMAPStore *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSArray *v70;
  MFBaseSyncResponseQueue *v71;
  _QWORD v72[5];
  _QWORD v73[3];

  v73[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v72[0] = MEMORY[0x1E0C809B0];
  v72[1] = 3221225472;
  v72[2] = __39__MFBaseSyncResponseQueue_handleItems___block_invoke;
  v72[3] = &unk_1E4E8BCF0;
  v72[4] = self;
  objc_msgSend(v4, "sortedArrayUsingComparator:", v72);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  currentUID = self->_currentUID;
  v63 = v5;
  objc_msgSend(v5, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MFBaseSyncResponseQueue uidForItem:](self, "uidForItem:", v7);
  v9 = currentUID + 1;

  self->_currentUID = v8;
  if (v9 >= v8)
    v10 = v8;
  else
    v10 = v9;
  serverMessages = self->_serverMessages;
  v71 = self;
  if (serverMessages)
  {
    v70 = serverMessages;
  }
  else
  {
    -[MFLibraryStore library](self->_store, "library");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "persistence");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "serverMessagePersistenceFactory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFLibraryStore mailbox](self->_store, "mailbox");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "serverMessagePersistenceForMailboxURL:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", v10, v8 - v10 + 1);
    objc_msgSend(v17, "serverMessagesForIMAPUIDs:limit:returnLastEntries:", v18, *MEMORY[0x1E0D1E990], 0);
    v70 = (NSArray *)objc_claimAutoreleasedReturnValue();

  }
  v66 = objc_msgSend(v63, "count");
  v67 = -[NSArray count](v70, "count");
  if (v66)
  {
    objc_msgSend(v63, "objectAtIndex:", 0);
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
  if (v67)
  {
    -[NSArray objectAtIndex:](v70, "objectAtIndex:", 0);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  v62 = (void *)objc_opt_new();
  v21 = v19 != 0;
  v22 = v20 != 0;
  if (v19 | v20)
  {
    v64 = 0;
    v68 = 0;
    v69 = 0;
    while (1)
    {
      v23 = -[MFBaseSyncResponseQueue uidForItem:](v71, "uidForItem:", v19);
      v24 = objc_msgSend((id)v20, "imapUID");
      if (v21 && v70 != 0 && v23 == v24)
        break;
      if (v21)
      {
        if (!v22 || v23 < v24)
        {
          if (v71->_shouldFetch && (-[MFBaseSyncResponseQueue flagsForItem:](v71, "flagsForItem:", v19) & 2) == 0)
          {
            missingUIDs = v71->_missingUIDs;
            if (!missingUIDs)
            {
              v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v28 = v71->_missingUIDs;
              v71->_missingUIDs = v27;

              missingUIDs = v71->_missingUIDs;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](missingUIDs, "addObject:", v29);

          }
          if (++v68 >= v66)
          {
            v30 = 0;
          }
          else
          {
            objc_msgSend(v63, "objectAtIndex:");
            v30 = objc_claimAutoreleasedReturnValue();
          }
          v52 = (void *)v19;
          goto LABEL_56;
        }
LABEL_40:
        if (v71->_shouldCompact)
        {
          if (!v64)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend((id)v20, "remoteID");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "addObject:", v50);

        }
        if (++v69 < v67)
        {
          -[NSArray objectAtIndex:](v70, "objectAtIndex:");
          v51 = objc_claimAutoreleasedReturnValue();
          v52 = (void *)v20;
          v30 = v19;
          goto LABEL_49;
        }
        v52 = (void *)v20;
        v30 = v19;
LABEL_53:
        v20 = 0;
        goto LABEL_56;
      }
      if (v22)
        goto LABEL_40;
      v30 = 0;
      v20 = 0;
LABEL_57:
      v21 = v30 != 0;
      v22 = v20 != 0;
      v19 = v30;
      if (!(v30 | v20))
        goto LABEL_60;
    }
    if (-[MFBaseSyncResponseQueue shouldSyncFlags](v71, "shouldSyncFlags"))
    {
      store = v71->_store;
      MFFlagsObjectForFlags(-[MFBaseSyncResponseQueue flagsForItem:](v71, "flagsForItem:", v19));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = store;
      v34 = (id)v20;
      v35 = v32;
      v36 = (void *)MEMORY[0x1E0D1E778];
      v65 = v34;
      objc_msgSend(v34, "serverFlags");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "changeFrom:to:", v37, v35);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v38, "hasChanges"))
      {
        -[MFLibraryStore library](v33, "library");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "persistence");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "messageChangeManager");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "remoteID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v73[0] = v40;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFLibraryStore mailbox](v33, "mailbox");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "URL");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "reflectFlagChanges:forMessagesWithRemoteIDs:mailboxURL:", v38, v41, v43);

      }
      if (!v71->_isSearching)
      {
        v44 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v65, "messagePersistentID");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "numberWithLongLong:", objc_msgSend(v45, "longLongValue"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "addObject:", v46);

      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MFBaseSyncResponseQueue sequenceIdentifierForItem:](v71, "sequenceIdentifierForItem:", v19);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v47, "length"))
      {
        -[MFLibraryStore library](v71->_store, "library");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v20, "messagePersistentID");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setSequenceIdentifier:forMessageWithLibraryID:", v47, objc_msgSend(v49, "longLongValue"));

      }
    }
    if (++v68 >= v66)
    {
      v30 = 0;
    }
    else
    {
      objc_msgSend(v63, "objectAtIndex:");
      v30 = objc_claimAutoreleasedReturnValue();
    }

    if (++v69 >= v67)
    {
      v52 = (void *)v20;
      goto LABEL_53;
    }
    -[NSArray objectAtIndex:](v70, "objectAtIndex:");
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = (void *)v20;
LABEL_49:
    v20 = v51;
LABEL_56:

    goto LABEL_57;
  }
  v64 = 0;
LABEL_60:
  if (objc_msgSend(v62, "count"))
  {
    -[MFLibraryStore library](v71->_store, "library");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "clearServerSearchFlagsForMessagesWithLibraryIDs:", v62);

  }
  if (v64)
  {
    -[MFLibraryStore library](v71->_store, "library");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "persistence");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "messageChangeManager");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFLibraryStore mailbox](v71->_store, "mailbox");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "URL");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "reflectDeletedMessagesWithRemoteIDs:mailboxURL:", v64, v58);

  }
  return 1;
}

uint64_t __39__MFBaseSyncResponseQueue_handleItems___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a3;
  v6 = objc_msgSend(*(id *)(a1 + 32), "uidForItem:", a2);
  v7 = objc_msgSend(*(id *)(a1 + 32), "uidForItem:", v5);
  v8 = -1;
  if (v6 >= v7)
    v8 = 1;
  if (v6 == v7)
    v9 = 0;
  else
    v9 = v8;

  return v9;
}

- (unint64_t)uidForItem:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v7, "type", (_QWORD)v10) == 8)
        {
          v8 = objc_msgSend(v7, "uid");
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v8;
}

- (unint64_t)flagsForItem:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "type", (_QWORD)v9) == 10)
        {
          v4 = objc_msgSend(v7, "messageFlags");
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)sequenceIdentifierForItem:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    __assert_rtn("-[MFBaseSyncResponseQueue sequenceIdentifierForItem:]", "MFBaseSyncResponseQueue.m", 167, "[item isKindOfClass:[NSArray class]]");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
LABEL_4:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v6)
        objc_enumerationMutation(v4);
      v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
      if (objc_msgSend(v8, "type") == 11)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v5)
          goto LABEL_4;
        goto LABEL_10;
      }
    }
    v9 = objc_msgSend(v8, "modSequenceNumber");

    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_10:

LABEL_12:
    v10 = 0;
  }

  return v10;
}

- (BOOL)shouldSyncFlags
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverMessages, 0);
  objc_storeStrong((id *)&self->_missingUIDs, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end
