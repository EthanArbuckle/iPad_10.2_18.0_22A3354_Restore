@implementation FCReadingList

void __47__FCReadingList__readingListEntryForArticleID___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[12];
  v3 = a1[5];
  v7 = v2;
  objc_msgSend(v7, "objectForKey:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __41__FCReadingList_loadLocalCachesFromStore__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id *v14;
  _QWORD *v15;
  _QWORD *v16;
  id v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    objc_storeStrong((id *)(v3 + 96), v2);

  objc_msgSend(*(id *)(a1 + 32), "localStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((objc_msgSend((id)objc_opt_class(), "isLocalStoreKeyInternal:", v10) & 1) == 0)
        {
          objc_opt_class();
          objc_msgSend(v4, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v12 = v11;
            else
              v12 = 0;
          }
          else
          {
            v12 = 0;
          }
          v13 = v12;

          if (v13)
          {
            v14 = -[FCReadingListEntry initWithEntryID:dictionaryRepresentation:]((id *)[FCReadingListEntry alloc], v10, v13);
            if (v14)
            {
              v15 = *(_QWORD **)(a1 + 32);
              if (v15)
                v15 = (_QWORD *)v15[12];
              v16 = v15;
              v17 = v14[2];
              objc_msgSend(v16, "setObject:forKey:", v14, v17);

            }
          }
          else
          {
            v18 = (void *)FCDefaultLog;
            if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
            {
              v19 = v18;
              v20 = (objc_class *)objc_opt_class();
              NSStringFromClass(v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v27 = v21;
              v28 = 2114;
              v29 = v10;
              _os_log_error_impl(&dword_1A1B90000, v19, OS_LOG_TYPE_ERROR, "ERROR: Object of type %@ is not dictionary for key %{public}@", buf, 0x16u);

            }
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v7);
  }

}

- (BOOL)shouldHideHeadline:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;

  v4 = a3;
  if (objc_msgSend(v4, "isDeleted"))
  {
    objc_msgSend(v4, "articleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = !-[FCReadingList isArticleOnReadingList:](self, "isArticleOnReadingList:", v5);

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (unint64_t)localStoreVersion
{
  return 3;
}

+ (id)localStoreFilename
{
  return CFSTR("reading-list");
}

+ (id)commandStoreFileName
{
  return CFSTR("reading-list-commands");
}

+ (int64_t)commandQueueUrgency
{
  return 2;
}

- (BOOL)isArticleOnReadingList:(id)a3
{
  void *v3;
  BOOL v4;

  -[FCReadingList _readingListEntryForArticleID:]((id *)&self->super.super.isa, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)_readingListEntryForArticleID:(id *)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__26;
    v15 = __Block_byref_object_dispose__26;
    v16 = 0;
    if (v3)
    {
      v5 = a1[14];
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __47__FCReadingList__readingListEntryForArticleID___block_invoke;
      v8[3] = &unk_1E463AD58;
      v10 = &v11;
      v8[4] = a1;
      v9 = v4;
      objc_msgSend(v5, "performReadSync:", v8);

      v6 = (void *)v12[5];
    }
    else
    {
      v6 = 0;
    }
    a1 = v6;
    _Block_object_dispose(&v11, 8);

  }
  return a1;
}

- (void)loadLocalCachesFromStore
{
  FCMTWriterLock *itemsLock;
  _QWORD v3[5];

  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__FCReadingList_loadLocalCachesFromStore__block_invoke;
  v3[3] = &unk_1E463AB18;
  v3[4] = self;
  -[FCMTWriterLock performWriteSync:](itemsLock, "performWriteSync:", v3);
}

- (void)addObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCReadingList;
  -[FCPrivateDataController addObserver:](&v3, sel_addObserver_, a3);
}

- (FCReadingList)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5
{
  id v9;
  FCReadingList *v10;
  FCReadingList *v11;
  FCMTWriterLock *v12;
  FCMTWriterLock *itemsLock;
  uint64_t v14;
  NSMutableDictionary *entriesByArticleID;
  objc_super v17;

  v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FCReadingList;
  v10 = -[FCPrivateDataController initWithContext:pushNotificationCenter:storeDirectory:](&v17, sel_initWithContext_pushNotificationCenter_storeDirectory_, v9, a4, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_cloudContext, a3);
    v12 = objc_alloc_init(FCMTWriterLock);
    itemsLock = v11->_itemsLock;
    v11->_itemsLock = v12;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    entriesByArticleID = v11->_entriesByArticleID;
    v11->_entriesByArticleID = (NSMutableDictionary *)v14;

  }
  return v11;
}

- (void)addArticleToReadingList:(id)a3
{
  -[FCReadingList addArticleToReadingList:eventInitiationLevel:origin:](self, "addArticleToReadingList:eventInitiationLevel:origin:", a3, 0, 0);
}

- (void)addArticleToReadingList:(id)a3 eventInitiationLevel:(int64_t)a4 origin:(unint64_t)a5
{
  id v8;
  FCReadingListEntry *v9;
  void *v10;
  void *v11;
  id *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  FCMTWriterLock *itemsLock;
  id *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  FCModifyReadingListCommand *v24;
  void *v25;
  FCModifyReadingListCommand *v26;
  id *v27;
  _QWORD v28[5];
  id *v29;
  id v30;
  id *v31;
  id v32;
  _BYTE buf[24];
  int v34;
  __int16 v35;
  id *v36;
  _QWORD v37[4];

  v37[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v8)
  {
    v9 = [FCReadingListEntry alloc];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rl-%@"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[FCReadingListEntry initWithEntryID:articleID:dateAdded:origin:]((id *)&v9->super.isa, v10, v8, v11, (void *)a5);

    if (v12)
    {
      v37[0] = CFSTR("articleID");
      v13 = v12[2];
      *(_QWORD *)buf = v13;
      v37[1] = CFSTR("dateAdded");
      v14 = v12[3];
      *(_QWORD *)&buf[8] = v14;
      v37[2] = CFSTR("origin");
      if ((char *)v12[4] - 1 >= (char *)3)
        v15 = 0;
      else
        v15 = v12[4];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf[16] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v37, 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (self)
        itemsLock = self->_itemsLock;
      else
        itemsLock = 0;
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __69__FCReadingList_addArticleToReadingList_eventInitiationLevel_origin___block_invoke;
      v28[3] = &unk_1E463B228;
      v28[4] = self;
      v19 = v12;
      v29 = v19;
      v20 = v8;
      v30 = v20;
      -[FCMTWriterLock performWriteSync:](itemsLock, "performWriteSync:", v28);
      -[FCPrivateDataController localStore](self, "localStore");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v19[1];
      objc_msgSend(v21, "setObject:forKey:", v17, v22);

      v32 = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCReadingList _addedArticleIDs:removedArticleIDs:eventInitiationLevel:](self, v23, MEMORY[0x1E0C9AA60], a4);

      v24 = [FCModifyReadingListCommand alloc];
      v31 = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[FCModifyReadingListCommand initWithReadingListEntries:merge:](v24, "initWithReadingListEntries:merge:", v25, 0);

      -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v26);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v27 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "entry");
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[FCReadingList addArticleToReadingList:eventInitiationLevel:origin:]";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "FCReadingList.m";
      *(_WORD *)&buf[22] = 1024;
      v34 = 95;
      v35 = 2114;
      v36 = v27;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "articleID != nil");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[FCReadingList addArticleToReadingList:eventInitiationLevel:origin:]";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "FCReadingList.m";
    *(_WORD *)&buf[22] = 1024;
    v34 = 87;
    v35 = 2114;
    v36 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
LABEL_13:

  }
}

uint64_t __69__FCReadingList_addArticleToReadingList_eventInitiationLevel_origin___block_invoke(_QWORD *a1)
{
  _QWORD *v1;

  v1 = (_QWORD *)a1[4];
  if (v1)
    v1 = (_QWORD *)v1[12];
  return objc_msgSend(v1, "setObject:forKey:", a1[5], a1[6]);
}

- (void)_addedArticleIDs:(void *)a3 removedArticleIDs:(uint64_t)a4 eventInitiationLevel:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (!a1)
    goto LABEL_15;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "addedArticleIDs");
    *(_DWORD *)buf = 136315906;
    v23 = "-[FCReadingList _addedArticleIDs:removedArticleIDs:eventInitiationLevel:]";
    v24 = 2080;
    v25 = "FCReadingList.m";
    v26 = 1024;
    v27 = 442;
    v28 = 2114;
    v29 = v15;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v8)
    {
LABEL_5:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "removedArticleIDs");
        *(_DWORD *)buf = 136315906;
        v23 = "-[FCReadingList _addedArticleIDs:removedArticleIDs:eventInitiationLevel:]";
        v24 = 2080;
        v25 = "FCReadingList.m";
        v26 = 1024;
        v27 = 443;
        v28 = 2114;
        v29 = v16;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
    }
  }
  else if (!v8)
  {
    goto LABEL_5;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a1, "observers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14++), "readingList:didAddArticles:removeArticles:eventInitiationLevel:", a1, v7, v8, a4);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

LABEL_15:
}

- (void)removeArticleFromReadingList:(id)a3
{
  id v4;
  NSMutableDictionary *entriesByArticleID;
  id *v6;
  FCMTWriterLock *itemsLock;
  id v8;
  id v9;
  void *v10;
  void *v11;
  FCRemoveFromReadingListCommand *v12;
  id *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v4)
  {
    if (self)
      entriesByArticleID = self->_entriesByArticleID;
    else
      entriesByArticleID = 0;
    -[NSMutableDictionary objectForKey:](entriesByArticleID, "objectForKey:", v4);
    v6 = (id *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (self)
        itemsLock = self->_itemsLock;
      else
        itemsLock = 0;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __46__FCReadingList_removeArticleFromReadingList___block_invoke;
      v14[3] = &unk_1E463AD10;
      v14[4] = self;
      v8 = v4;
      v15 = v8;
      -[FCMTWriterLock performWriteSync:](itemsLock, "performWriteSync:", v14);
      v9 = v6[1];
      -[FCPrivateDataController localStore](self, "localStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObjectForKey:", v9);

      v16 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCReadingList _addedArticleIDs:removedArticleIDs:eventInitiationLevel:](self, MEMORY[0x1E0C9AA60], v11, 0);

      v12 = -[FCRemoveFromReadingListCommand initWithEntryID:]([FCRemoveFromReadingListCommand alloc], "initWithEntryID:", v9);
      -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v12);

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v13 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "entry");
      *(_DWORD *)buf = 136315906;
      v18 = "-[FCReadingList removeArticleFromReadingList:]";
      v19 = 2080;
      v20 = "FCReadingList.m";
      v21 = 1024;
      v22 = 121;
      v23 = 2114;
      v24 = v13;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "articleID != nil");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCReadingList removeArticleFromReadingList:]";
    v19 = 2080;
    v20 = "FCReadingList.m";
    v21 = 1024;
    v22 = 117;
    v23 = 2114;
    v24 = v6;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
LABEL_12:

  }
}

uint64_t __46__FCReadingList_removeArticleFromReadingList___block_invoke(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[12];
  return objc_msgSend(v1, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)clearArticlesFromReadingList
{
  void *v3;
  FCMTWriterLock *itemsLock;
  uint64_t v5;
  id v6;
  void *v7;
  FCRemoveFromReadingListCommand *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  -[FCReadingList _allEntriesInReadingList]((id *)&self->super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    if (self)
      itemsLock = self->_itemsLock;
    else
      itemsLock = 0;
    v5 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __45__FCReadingList_clearArticlesFromReadingList__block_invoke;
    v14[3] = &unk_1E463AB18;
    v14[4] = self;
    -[FCMTWriterLock performWriteSync:](itemsLock, "performWriteSync:", v14);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __45__FCReadingList_clearArticlesFromReadingList__block_invoke_2;
    v12[3] = &unk_1E4640360;
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v13;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v12);
    -[FCPrivateDataController localStore](self, "localStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectsForKeys:", v6);

    v8 = -[FCRemoveFromReadingListCommand initWithEntryIDs:]([FCRemoveFromReadingListCommand alloc], "initWithEntryIDs:", v6);
    -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v8);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __45__FCReadingList_clearArticlesFromReadingList__block_invoke_3;
    v10[3] = &unk_1E4640360;
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v11;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v10);
    -[FCReadingList _addedArticleIDs:removedArticleIDs:eventInitiationLevel:](self, MEMORY[0x1E0C9AA60], v9, 0);

  }
}

- (id)_allEntriesInReadingList
{
  id *v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v1 = a1;
  if (a1)
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x3032000000;
    v8 = __Block_byref_object_copy__26;
    v9 = __Block_byref_object_dispose__26;
    v10 = 0;
    v2 = a1[14];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __41__FCReadingList__allEntriesInReadingList__block_invoke;
    v4[3] = &unk_1E463AD80;
    v4[4] = v1;
    v4[5] = &v5;
    objc_msgSend(v2, "performReadSync:", v4);

    v1 = (id *)(id)v6[5];
    _Block_object_dispose(&v5, 8);

  }
  return v1;
}

uint64_t __45__FCReadingList_clearArticlesFromReadingList__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 96);
  else
    v2 = 0;
  return objc_msgSend(v2, "removeAllObjects");
}

void __45__FCReadingList_clearArticlesFromReadingList__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  if (a2)
    v3 = *(void **)(a2 + 8);
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v2, "addObject:", v4);

}

void __45__FCReadingList_clearArticlesFromReadingList__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  if (a2)
    v3 = *(void **)(a2 + 16);
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v2, "addObject:", v4);

}

- (id)dateArticleWasAdded:(id)a3
{
  _QWORD *v3;
  void *v4;
  _QWORD *v5;

  -[FCReadingList _readingListEntryForArticleID:]((id *)&self->super.super.isa, a3);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v3 = (_QWORD *)v3[3];
  v5 = v3;

  return v5;
}

- (id)allSortedArticleIDsInReadingList
{
  void *v2;
  void *v3;
  void *v4;

  if (self)
  {
    -[FCReadingList _allEntriesInReadingList]((id *)&self->super.super.isa);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_42_0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v3, "fc_arrayByTransformingWithBlock:", &__block_literal_global_42);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __49__FCReadingList_allSortedArticleIDsInReadingList__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return *(_QWORD *)(a2 + 16);
  else
    return 0;
}

- (unint64_t)countOfAllArticlesSavedOutsideOfNewsSince:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[FCReadingList _allEntriesInReadingList]((id *)&self->super.super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__FCReadingList_countOfAllArticlesSavedOutsideOfNewsSince___block_invoke;
  v9[3] = &unk_1E46403A8;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "fc_countOfObjectsPassingTest:", v9);

  return v7;
}

uint64_t __59__FCReadingList_countOfAllArticlesSavedOutsideOfNewsSince___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id *v4;
  id v5;
  uint64_t v6;

  v3 = a2;
  v4 = v3;
  if (v3 && v3[4])
  {
    v5 = v3[3];
    v6 = objc_msgSend(v5, "fc_isLaterThan:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)allNonConsumedArticleIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  char v16;
  void *v17;
  id v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCReadingList _allEntriesInReadingList]((id *)&self->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_24_1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCloudContext readingHistory](self->_cloudContext, "readingHistory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allConsumedArticleIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v12);
        if (v13)
          v14 = *(void **)(v13 + 16);
        else
          v14 = 0;
        v15 = v14;
        v16 = objc_msgSend(v7, "containsObject:", v15, (_QWORD)v21);

        if ((v16 & 1) == 0)
        {
          if (v13)
            v17 = *(void **)(v13 + 16);
          else
            v17 = 0;
          v18 = v17;
          objc_msgSend(v3, "addObject:", v18);

        }
        ++v12;
      }
      while (v10 != v12);
      v19 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v10 = v19;
    }
    while (v19);
  }

  return v3;
}

uint64_t __41__FCReadingList_allNonConsumedArticleIDs__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;

  v4 = a2;
  if (a3)
    v5 = *(void **)(a3 + 24);
  else
    v5 = 0;
  v6 = v5;
  if (v4)
    v7 = (void *)v4[3];
  else
    v7 = 0;
  v8 = v7;

  v9 = objc_msgSend(v6, "compare:", v8);
  return v9;
}

- (id)allNonConsumedArticleIDsIntersectingSet:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[FCReadingList allNonConsumedArticleIDs](self, "allNonConsumedArticleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__FCReadingList_allNonConsumedArticleIDsIntersectingSet___block_invoke;
  v9[3] = &unk_1E463C7A0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "fc_arrayOfObjectsPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __57__FCReadingList_allNonConsumedArticleIDsIntersectingSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (void)removeObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCReadingList;
  -[FCPrivateDataController removeObserver:](&v3, sel_removeObserver_, a3);
}

- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  FCMTWriterLock *itemsLock;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  FCReadingList *v20;
  id v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  -[FCPrivateDataController localStore](self, "localStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __65__FCReadingList_handleSyncWithChangedRecords_deletedRecordNames___block_invoke;
  v17[3] = &unk_1E46403F0;
  v18 = v6;
  v19 = v8;
  v20 = self;
  v21 = v9;
  v22 = v7;
  v23 = v10;
  v12 = v10;
  v13 = v7;
  v14 = v9;
  v15 = v8;
  v16 = v6;
  -[FCMTWriterLock performWriteSync:](itemsLock, "performWriteSync:", v17);
  -[FCReadingList _addedArticleIDs:removedArticleIDs:eventInitiationLevel:](self, v14, v12, 1);

}

void __65__FCReadingList_handleSyncWithChangedRecords_deletedRecordNames___block_invoke(uint64_t a1)
{
  __int128 v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  __int128 v37;
  id obj;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _QWORD v50[3];
  _QWORD v51[3];
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  char *v55;
  __int16 v56;
  int v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = *(id *)(a1 + 32);
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v60, 16);
  if (v40)
  {
    v39 = *(_QWORD *)v46;
    *(_QWORD *)&v2 = 136315906;
    v37 = v2;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v46 != v39)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v3);
        objc_msgSend(v4, "recordID", v37);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "recordName");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("articleID"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dateAdded"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("origin"));
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        v12 = &unk_1E470A838;
        if (v10)
          v12 = (void *)v10;
        v13 = v12;

        if (v7)
        {
          v14 = (void *)objc_msgSend(v7, "mutableCopy");
          v15 = v14;
          if (v8)
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v8, CFSTR("articleID"));
          if (v9)
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v9, CFSTR("dateAdded"));
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, CFSTR("origin"));
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v15, v6);
          if (v8)
          {
            v16 = -[FCReadingListEntry initWithEntryID:dictionaryRepresentation:]((id *)[FCReadingListEntry alloc], v6, v15);
            v17 = *(_QWORD *)(a1 + 48);
            if (v17)
              v18 = *(void **)(v17 + 96);
            else
              v18 = 0;
            objc_msgSend(v18, "setObject:forKey:", v16, v8);

          }
          goto LABEL_17;
        }
        if (v8)
        {
          if (v9)
          {
            v50[0] = CFSTR("articleID");
            v50[1] = CFSTR("dateAdded");
            v51[0] = v8;
            v51[1] = v9;
            v50[2] = CFSTR("origin");
            v51[2] = v13;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 3);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = -[FCReadingListEntry initWithEntryID:dictionaryRepresentation:]((id *)[FCReadingListEntry alloc], v6, v19);
            v21 = *(_QWORD *)(a1 + 48);
            if (v21)
              v22 = *(void **)(v21 + 96);
            else
              v22 = 0;
            objc_msgSend(v22, "setObject:forKey:", v20, v8);
            objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v19, v6);
            objc_msgSend(*(id *)(a1 + 56), "addObject:", v8);

            goto LABEL_18;
          }
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("should never have a reading list entry without an article ID"));
            *(_DWORD *)buf = v37;
            v53 = "-[FCReadingList handleSyncWithChangedRecords:deletedRecordNames:]_block_invoke";
            v54 = 2080;
            v55 = "FCReadingList.m";
            v56 = 1024;
            v57 = 284;
            v58 = 2114;
            v59 = v23;
            _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          }
          if (v9)
            goto LABEL_18;
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("should never have a reading list entry without a date added"));
          *(_DWORD *)buf = v37;
          v53 = "-[FCReadingList handleSyncWithChangedRecords:deletedRecordNames:]_block_invoke";
          v54 = 2080;
          v55 = "FCReadingList.m";
          v56 = 1024;
          v57 = 285;
          v58 = 2114;
          v59 = v15;
          _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
LABEL_17:

        }
LABEL_18:

        ++v3;
      }
      while (v40 != v3);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v60, 16);
      v40 = v24;
    }
    while (v24);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v25 = *(id *)(a1 + 64);
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v42;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v42 != v28)
          objc_enumerationMutation(v25);
        v30 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v29);
        objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v31;
        if (v31)
        {
          objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("articleID"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = *(_QWORD *)(a1 + 48);
          if (v34)
            v35 = *(void **)(v34 + 96);
          else
            v35 = 0;
          objc_msgSend(v35, "removeObjectForKey:", v33);
          objc_msgSend(*(id *)(a1 + 40), "removeObjectForKey:", v30);
          objc_msgSend(*(id *)(a1 + 72), "addObject:", v33);

        }
        ++v29;
      }
      while (v27 != v29);
      v36 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      v27 = v36;
    }
    while (v36);
  }

}

- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3
{
  NSMutableDictionary *entriesByArticleID;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3);
  if (self)
    entriesByArticleID = self->_entriesByArticleID;
  else
    entriesByArticleID = 0;
  -[NSMutableDictionary allValues](entriesByArticleID, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fc_arrayByTransformingWithBlock:", &__block_literal_global_36_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __59__FCReadingList_allKnownRecordNamesWithinRecordZoneWithID___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return *(_QWORD *)(a2 + 8);
  else
    return 0;
}

+ (BOOL)requiresPushNotificationSupport
{
  return 1;
}

+ (BOOL)requiresBatchedSync
{
  return 0;
}

+ (BOOL)requiresHighPriorityFirstSync
{
  return 0;
}

+ (id)backingRecordZoneIDs
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C95098]);
  v3 = (void *)objc_msgSend(v2, "initWithZoneName:ownerName:", CFSTR("ReadingList"), *MEMORY[0x1E0C94730]);
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)backingRecordIDs
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id *v14;
  FCModifyReadingListCommand *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  FCModifyReadingListCommand *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v5, "allKeys", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(a1, "isLocalStoreKeyInternal:", v12) & 1) == 0)
        {
          objc_msgSend(v5, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[FCReadingListEntry initWithEntryID:dictionaryRepresentation:]((id *)[FCReadingListEntry alloc], v12, v13);
          objc_msgSend(v6, "addObject:", v14);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v9);
  }

  v15 = -[FCModifyReadingListCommand initWithReadingListEntries:merge:]([FCModifyReadingListCommand alloc], "initWithReadingListEntries:merge:", v6, 1);
  v22 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)canHelpRestoreZoneName:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("ReadingList"));
}

- (id)recordsForRestoringZoneName:(id)a3
{
  void *v3;
  void *v4;

  -[FCReadingList _allEntriesInReadingList]((id *)&self->super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_arrayByTransformingWithBlock:", &__block_literal_global_39_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __45__FCReadingList_recordsForRestoringZoneName___block_invoke(uint64_t a1, _QWORD *a2)
{
  return -[FCReadingListEntry asCKRecord](a2);
}

void __41__FCReadingList__allEntriesInReadingList__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[12];
  v3 = v2;
  objc_msgSend(v3, "allValues");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v7, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

uint64_t __47__FCReadingList__allSortedEntriesInReadingList__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;

  v4 = a2;
  if (a3)
    v5 = *(void **)(a3 + 24);
  else
    v5 = 0;
  v6 = v5;
  if (v4)
    v7 = (void *)v4[3];
  else
    v7 = 0;
  v8 = v7;

  v9 = objc_msgSend(v6, "compare:", v8);
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsLock, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong((id *)&self->_entriesByArticleID, 0);
}

@end
