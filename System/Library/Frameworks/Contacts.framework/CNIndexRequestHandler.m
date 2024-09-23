@implementation CNIndexRequestHandler

- (CNIndexRequestHandler)initWithContactStore:(id)a3
{
  Class (__cdecl *v4)();
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CNIndexRequestHandler *v10;

  v4 = (Class (__cdecl *)())getCSSearchableIndexClass[0];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(v4()), "initWithName:protectionClass:bundleIdentifier:", CFSTR("contacts"), *MEMORY[0x1E0CB2AC0], CFSTR("com.apple.MobileAddressBook"));
  +[CNContactsEnvironment currentEnvironment](CNContactsEnvironment, "currentEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "loggerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "spotlightIndexingLogger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[CNIndexRequestHandler initWithContactStore:searchableIndex:logger:batchSize:](self, "initWithContactStore:searchableIndex:logger:batchSize:", v5, v6, v9, 100);
  return v10;
}

- (CNIndexRequestHandler)initWithContactStore:(id)a3 searchableIndex:(id)a4 logger:(id)a5 batchSize:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  CNIndexRequestHandler *v14;
  CNIndexRequestHandler *v15;
  CNIndexClientState *clientState;
  CNIndexRequestHandler *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CNIndexRequestHandler;
  v14 = -[CNIndexRequestHandler init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_contactStore, a3);
    objc_storeStrong((id *)&v15->_index, a4);
    objc_storeStrong((id *)&v15->_logger, a5);
    v15->_isFullSyncNeeded = 0;
    clientState = v15->_clientState;
    v15->_batchSize = a6;
    v15->_clientState = 0;

    v17 = v15;
  }

  return v15;
}

- (void)performIndexing
{
  CNSpotlightIndexingLogger *logger;
  _QWORD v3[5];

  if (self)
    logger = self->_logger;
  else
    logger = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__CNIndexRequestHandler_performIndexing__block_invoke;
  v3[3] = &unk_1E29F7A70;
  v3[4] = self;
  -[CNSpotlightIndexingLogger indexingContacts:](logger, "indexingContacts:", v3);
}

void __40__CNIndexRequestHandler_performIndexing__block_invoke(uint64_t a1)
{
  -[CNIndexRequestHandler _performIndexingWithForcedReindexing:](*(_QWORD *)(a1 + 32), 0);
}

- (void)_performIndexingWithForcedReindexing:(uint64_t)a1
{
  CNIndexClientState *v4;
  void *v5;
  uint64_t v6;
  id v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  if (a1)
  {
    -[CNIndexRequestHandler registerForChangeHistory](a1);
    -[CNIndexRequestHandler fetchChangeHistory](a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
    {
      *(_BYTE *)(a1 + 8) = 1;
      v4 = objc_alloc_init(CNIndexClientState);
      v5 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v4;

    }
    else
    {
      -[CNIndexRequestHandler fetchAndCheckLastClientState](a1);
    }
    if (*(_BYTE *)(a1 + 8) && (-[CNIndexRequestHandler prepareForFullSync:](a1, v12) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "deferringReindexAsFailedToPrepareForReindexing");
    }
    else
    {
      v6 = *(_QWORD *)(a1 + 48);
      v7 = *(id *)(a1 + 32);
      objc_msgSend(v7, "willStartIndexingWithClientState:", v6);

      if (*(_BYTE *)(a1 + 8))
      {
        v8 = -[CNIndexRequestHandler fullSyncContacts](a1);
      }
      else
      {
        objc_msgSend(v12, "contactChanges");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (!v10)
        {
          objc_msgSend(*(id *)(a1 + 32), "noContactChangesToIndex");
          goto LABEL_16;
        }
        v8 = -[CNIndexRequestHandler deltaSyncContacts:](a1, v12);
      }
      v11 = v12;
      if (!v8 || !v12)
        goto LABEL_17;
      -[CNIndexRequestHandler consumeChangeHistory:](a1, v12);
    }
LABEL_16:
    v11 = v12;
LABEL_17:

  }
}

- (void)reindexAllSearchableItems
{
  CNSpotlightIndexingLogger *logger;
  _QWORD v3[5];

  if (self)
    logger = self->_logger;
  else
    logger = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__CNIndexRequestHandler_reindexAllSearchableItems__block_invoke;
  v3[3] = &unk_1E29F7A70;
  v3[4] = self;
  -[CNSpotlightIndexingLogger reindexingAllSearchableItems:](logger, "reindexingAllSearchableItems:", v3);
}

void __50__CNIndexRequestHandler_reindexAllSearchableItems__block_invoke(uint64_t a1)
{
  -[CNIndexRequestHandler _performIndexingWithForcedReindexing:](*(_QWORD *)(a1 + 32), 1);
}

- (void)reindexSearchableItemsWithIdentifiers:(id)a3
{
  id v4;
  CNSpotlightIndexingLogger *logger;
  id v6;
  _QWORD v7[4];
  id v8;
  CNIndexRequestHandler *v9;

  v4 = a3;
  if (self)
    logger = self->_logger;
  else
    logger = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__CNIndexRequestHandler_reindexSearchableItemsWithIdentifiers___block_invoke;
  v7[3] = &unk_1E29F7A98;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[CNSpotlightIndexingLogger reindexingSearchableItemsWithIdentifiers:](logger, "reindexingSearchableItemsWithIdentifiers:", v7);

}

void __63__CNIndexRequestHandler_reindexSearchableItemsWithIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_cn_slicesWithMaximumCount:", 100);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v6);
        v8 = *(_QWORD *)(a1 + 40);
        if (v8)
          v9 = *(void **)(v8 + 32);
        else
          v9 = 0;
        objc_msgSend(v9, "willReindexItemsWithIdentifiers:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v6));
        -[CNIndexRequestHandler searchableItemsForContactIdentifiers:](*(id *)(a1 + 40), v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "count"))
          -[CNIndexRequestHandler indexSearchableItems:](*(id **)(a1 + 40), v10);

        ++v6;
      }
      while (v4 != v6);
      v11 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v4 = v11;
    }
    while (v11);
  }

}

- (id)searchableItemsForContactIdentifiers:(id)a1
{
  id v2;
  id v3;
  CNContactFetchRequest *v4;
  void *v5;
  void *v6;
  CNContactFetchRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[2];

  v2 = a1;
  v25[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = a2;
    v4 = [CNContactFetchRequest alloc];
    +[CNContact descriptorForRequiredKeysForSearchableItem](CNContact, "descriptorForRequiredKeysForSearchableItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CNContactFetchRequest initWithKeysToFetch:](v4, "initWithKeysToFetch:", v6);

    +[CNContact predicateForContactsWithIdentifiers:](CNContact, "predicateForContactsWithIdentifiers:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactFetchRequest setPredicate:](v7, "setPredicate:", v8);

    -[CNContactFetchRequest setUnifyResults:](v7, "setUnifyResults:", 1);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v3);

    v11 = (void *)*((_QWORD *)v2 + 2);
    v24 = 0;
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __62__CNIndexRequestHandler_searchableItemsForContactIdentifiers___block_invoke;
    v20 = &unk_1E29F7B30;
    v12 = v9;
    v21 = v12;
    v13 = v10;
    v22 = v13;
    v23 = v2;
    v14 = v11;
    objc_msgSend(v14, "enumerateContactsWithFetchRequest:error:usingBlock:", v7, &v24, &v17);
    v15 = v24;

    if (objc_msgSend(v13, "count", v17, v18, v19, v20))
      objc_msgSend(*((id *)v2 + 4), "failedToFetchSearchableForContactIdentifiers:error:", v13, v15);
    v2 = v12;

  }
  return v2;
}

- (BOOL)indexSearchableItems:(id *)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _BOOL8 v9;
  id v10;
  void *v11;
  id v13;
  _QWORD v14[5];
  id v15;

  v3 = a2;
  if (a1)
  {
    -[CNIndexRequestHandler _futureForIndexSearchableItems:](a1, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __46__CNIndexRequestHandler_indexSearchableItems___block_invoke;
    v14[3] = &unk_1E29F7C70;
    v14[4] = a1;
    v5 = v3;
    v15 = v5;
    objc_msgSend(v4, "recover:", v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    objc_msgSend(v6, "result:", &v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v13;
    v9 = v7 != 0;

    if (!v7)
    {
      v10 = a1[4];
      objc_msgSend(v5, "valueForKey:", CFSTR("uniqueIdentifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "failedToJournalSearchableItemsForIndexingWithSpotlight:identifiers:willRetry:", v8, v11, 0);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)registerForChangeHistory
{
  void *v2;
  id v3;
  char v4;
  id v5;
  id v6;

  if (a1)
  {
    v2 = *(void **)(a1 + 16);
    v6 = 0;
    v3 = v2;
    v4 = objc_msgSend(v3, "registerChangeHistoryClientIdentifier:error:", CFSTR("com.apple.contacts.corespotlight"), &v6);
    v5 = v6;

    if ((v4 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "willReindexAsFailedToRegisterForChangeHistory:error:", CFSTR("com.apple.contacts.corespotlight"), v5);
      *(_BYTE *)(a1 + 8) = 1;
    }

  }
}

- (id)fetchChangeHistory
{
  void *v2;
  id v3;
  id v5;

  if (!a1)
    return 0;
  v5 = 0;
  -[CNIndexRequestHandler fetchChangeHistoryWithError:](a1, (uint64_t)&v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v5;
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "willReindexAsFailedToFetchChangeHistory:error:", CFSTR("com.apple.contacts.corespotlight"), v3);
    goto LABEL_6;
  }
  if (objc_msgSend(v2, "changesTruncated"))
  {
    objc_msgSend(*(id *)(a1 + 32), "willReindexAsChangeHistoryIsTruncated:", CFSTR("com.apple.contacts.corespotlight"));
LABEL_6:
    *(_BYTE *)(a1 + 8) = 1;
  }

  return v2;
}

- (void)fetchAndCheckLastClientState
{
  void *v2;
  id v3;
  id v4;

  if (a1)
  {
    if (-[CNIndexRequestHandler fetchLastClientState](a1))
    {
      if ((objc_msgSend(*(id *)(a1 + 48), "isFullSyncDone") & 1) != 0)
      {
        if (objc_msgSend(*(id *)(a1 + 48), "indexVersion") == 4)
          return;
        v2 = *(void **)(a1 + 32);
        v3 = *(id *)(a1 + 48);
        v4 = v2;
        objc_msgSend(v4, "willReindexAsIndexVersionChangedFrom:to:", objc_msgSend(v3, "indexVersion"), 4);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "willResumeReindexingAsNotFinished");
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "willReindexAsFailedToFetchClientState");
    }
    *(_BYTE *)(a1 + 8) = 1;
  }
}

- (uint64_t)prepareForFullSync:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 48), "setIndexVersion:", 4);
    objc_msgSend(*(id *)(a1 + 48), "setIsFullSyncDone:", 0);
    v4 = *(id *)(a1 + 48);
    if (objc_msgSend(v4, "fullSyncOffset") <= 0)
    {

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "fullSyncSnapshotAnchor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "latestChangeAnchor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "compare:", v6);

      if (v7)
      {
        v8 = *(void **)(a1 + 32);
        v9 = *(id *)(a1 + 48);
        v10 = v8;
        objc_msgSend(v9, "fullSyncSnapshotAnchor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "latestChangeAnchor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "willReindexAsSnapshotAnchorChangedFrom:to:", v11, v12);

        objc_msgSend(*(id *)(a1 + 48), "setFullSyncOffset:", 0);
      }
    }
    objc_msgSend(v3, "latestChangeAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setFullSyncSnapshotAnchor:", v13);

    if (objc_msgSend(*(id *)(a1 + 48), "fullSyncOffset"))
    {
      v14 = *(void **)(a1 + 32);
      v15 = *(id *)(a1 + 48);
      v16 = v14;
      objc_msgSend(v16, "willResumeIndexingAfterOffset:", objc_msgSend(v15, "fullSyncOffset"));

    }
    else if (!-[CNIndexRequestHandler deleteAllSearchableItems]((id *)a1))
    {
      a1 = 0;
      goto LABEL_11;
    }
    a1 = 1;
  }
LABEL_11:

  return a1;
}

- (uint64_t)fullSyncContacts
{
  uint64_t v1;
  CNContactFetchRequest *v2;
  void *v3;
  void *v4;
  CNContactFetchRequest *v5;
  id v6;
  int v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v12[9];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  _QWORD v32[2];

  v1 = a1;
  v32[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = [CNContactFetchRequest alloc];
    +[CNContact descriptorForRequiredKeysForSearchableItem](CNContact, "descriptorForRequiredKeysForSearchableItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CNContactFetchRequest initWithKeysToFetch:](v2, "initWithKeysToFetch:", v4);

    -[CNContactFetchRequest setUnifyResults:](v5, "setUnifyResults:", 1);
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy_;
    v22 = __Block_byref_object_dispose_;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v6 = *(id *)(v1 + 16);
    v13 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __41__CNIndexRequestHandler_fullSyncContacts__block_invoke;
    v12[3] = &unk_1E29F7AC0;
    v12[4] = v1;
    v12[5] = &v24;
    v12[6] = &v18;
    v12[7] = &v28;
    v12[8] = &v14;
    v7 = objc_msgSend(v6, "enumerateContactsWithFetchRequest:error:usingBlock:", v5, &v13, v12);
    v8 = v13;

    if (v7
      && !*((_BYTE *)v29 + 24)
      && -[CNIndexRequestHandler batchIndexUpdatingItems:fullSyncOffset:fullSyncDone:](v1, (void *)v19[5], v25[3], 1)&& (v9 = objc_msgSend((id)v19[5], "count"), v15[3] += v9, !*((_BYTE *)v29 + 24)))
    {
      v10 = *(id *)(v1 + 32);
      objc_msgSend(v10, "finishedIndexingForFullSyncWithCount:", v15[3]);
      v1 = 1;
    }
    else
    {
      v10 = *(id *)(v1 + 32);
      objc_msgSend(v10, "didNotFinishIndexingForFullSyncWithError:", v8);
      v1 = 0;
    }

    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v28, 8);

  }
  return v1;
}

- (uint64_t)deltaSyncContacts:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v13[10];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy_;
    v25 = __Block_byref_object_dispose_;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy_;
    v19 = __Block_byref_object_dispose_;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    +[CNContact descriptorForRequiredKeysForSearchableItem](CNContact, "descriptorForRequiredKeysForSearchableItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(id *)(a1 + 16);
    v14 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __43__CNIndexRequestHandler_deltaSyncContacts___block_invoke;
    v13[3] = &unk_1E29F7AE8;
    v13[4] = a1;
    v13[5] = &v21;
    v13[6] = &v15;
    v13[7] = &v35;
    v13[8] = &v31;
    v13[9] = &v27;
    v7 = objc_msgSend(v3, "enumerateContactChangesWithKeysToFetch:fromContactStore:error:usingBlock:", v5, v6, &v14, v13);
    v8 = v14;

    if (v7
      && !*((_BYTE *)v36 + 24)
      && -[CNIndexRequestHandler batchIndexUpdatingItems:deletingItemsWithIdentifiers:](a1, (void *)v22[5], (void *)v16[5])&& (v9 = objc_msgSend((id)v22[5], "count"), v32[3] += v9, v10 = objc_msgSend((id)v16[5], "count"), v28[3] += v10, !*((_BYTE *)v36 + 24)))
    {
      v11 = *(id *)(a1 + 32);
      objc_msgSend(v11, "finishedIndexingForDeltaSyncWithUpdateCount:deleteCount:", v32[3], v28[3]);
      a1 = 1;
    }
    else
    {
      v11 = *(id *)(a1 + 32);
      objc_msgSend(v11, "didNotFinishIndexingForDeltaSyncWithError:", v8);
      a1 = 0;
    }

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v35, 8);

  }
  return a1;
}

- (void)consumeChangeHistory:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  CNChangeHistoryClearRequest *v6;
  void *v7;
  void *v8;
  id v9;
  char v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v3 = a2;
  if (a1)
  {
    v4 = *(id *)(a1 + 32);
    objc_msgSend(v3, "latestChangeAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "willClearChangeHistory:toChangeAnchor:", CFSTR("com.apple.contacts.corespotlight"), v5);

    v6 = -[CNChangeHistoryClearRequest initWithClientIdentifier:]([CNChangeHistoryClearRequest alloc], "initWithClientIdentifier:", CFSTR("com.apple.contacts.corespotlight"));
    objc_msgSend(v3, "latestChangeAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNChangeHistoryClearRequest setToChangeAnchor:](v6, "setToChangeAnchor:", v7);

    v8 = *(void **)(a1 + 16);
    v14 = 0;
    v9 = v8;
    v10 = objc_msgSend(v9, "executeChangeHistoryClearRequest:error:", v6, &v14);
    v11 = v14;

    if ((v10 & 1) == 0)
    {
      v12 = *(id *)(a1 + 32);
      objc_msgSend(v3, "latestChangeAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "failedToClearChangeHistory:toChangeAnchor:error:", CFSTR("com.apple.contacts.corespotlight"), v13, v11);

    }
  }

}

- (id)fetchChangeHistoryWithError:(uint64_t)a1
{
  CNChangeHistoryFetchRequest *v4;
  void *v5;

  if (a1)
  {
    v4 = -[CNChangeHistoryFetchRequest initWithClientIdentifier:]([CNChangeHistoryFetchRequest alloc], "initWithClientIdentifier:", CFSTR("com.apple.contacts.corespotlight"));
    -[CNChangeHistoryFetchRequest setShouldUnifyResults:](v4, "setShouldUnifyResults:", 1);
    objc_msgSend(*(id *)(a1 + 16), "changeHistoryWithFetchRequest:error:", v4, a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)fetchLastClientState
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  _BOOL8 v8;
  id v9;
  uint64_t v10;
  void *v11;
  CNIndexClientState *v12;
  id v14;
  _QWORD v15[5];

  if (!a1)
    return 0;
  -[CNIndexRequestHandler _futureForFetchLastClientState]((_QWORD *)a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __45__CNIndexRequestHandler_fetchLastClientState__block_invoke;
  v15[3] = &unk_1E29F7C48;
  v15[4] = a1;
  objc_msgSend(v2, "recover:", v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *MEMORY[0x1E0D13880];
  v14 = 0;
  objc_msgSend(v3, "result:", &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7 != 0;
  if (v7)
  {
    v9 = *(id *)(a1 + 32);
    +[CNIndexClientState clientStateWithData:logger:](CNIndexClientState, "clientStateWithData:logger:", v7, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v10;

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "failedToFetchClientStateFromSpotlight:willRetry:", v6, 0);
    v12 = objc_alloc_init(CNIndexClientState);
    v9 = *(id *)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v12;
  }

  return v8;
}

- (BOOL)deleteAllSearchableItems
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _BOOL8 v6;
  id v8;
  _QWORD v9[5];

  if (!a1)
    return 0;
  -[CNIndexRequestHandler _futureForDeleteAllSearchableItems](a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__CNIndexRequestHandler_deleteAllSearchableItems__block_invoke;
  v9[3] = &unk_1E29F7C48;
  v9[4] = a1;
  objc_msgSend(v2, "recover:", v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  objc_msgSend(v3, "result:", &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  v6 = v4 != 0;

  if (!v4)
    objc_msgSend(a1[4], "failedToDeleteAllSearchableItemsWithSpotlight:willRetry:", v5, 0);

  return v6;
}

void __41__CNIndexRequestHandler_fullSyncContacts__block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a1[4];
  if (v5)
    v7 = *(void **)(v5 + 48);
  else
    v7 = 0;
  v6 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  if (v6 >= objc_msgSend(v7, "fullSyncOffset"))
  {
    objc_msgSend(v15, "searchableItemForIndexing");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "count");
      v10 = a1[4];
      if (v10)
        v11 = *(_QWORD *)(v10 + 40);
      else
        v11 = 0;
      if (v9 == v11)
      {
        if ((-[CNIndexRequestHandler batchIndexUpdatingItems:fullSyncOffset:fullSyncDone:](v10, *(void **)(*(_QWORD *)(a1[6] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24), 0) & 1) == 0)
        {
          *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
          *a3 = 1;

          goto LABEL_16;
        }
        *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) += objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "count");
        objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "removeAllObjects");
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v8);
    }
    else
    {
      v12 = (_QWORD *)a1[4];
      if (v12)
        v12 = (_QWORD *)v12[4];
      v13 = v12;
      objc_msgSend(v15, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "failedToCreateSearchableItemForContactIdentifier:", v14);

    }
  }
  ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
LABEL_16:

}

- (uint64_t)batchIndexUpdatingItems:(uint64_t)a3 fullSyncOffset:(uint64_t)a4 fullSyncDone:
{
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;

  if (result)
  {
    v7 = result;
    v8 = *(id *)(result + 32);
    v9 = a2;
    objc_msgSend(v8, "willBatchIndexForFullSyncWithCount:lastOffset:doneFullSync:", objc_msgSend(v9, "count"), a3, a4);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CNIndexRequestHandler _batchIndexUpdatingItems:deletingItemsWithIdentifiers:fullSyncOffset:fullSyncDone:](v7, v9, 0, v10, v11);

    return v12;
  }
  return result;
}

void __43__CNIndexRequestHandler_deltaSyncContacts___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  _QWORD *v18;
  id v19;

  v19 = a2;
  v5 = objc_msgSend(v19, "changeType");
  if (v5 <= 5)
  {
    if (((1 << v5) & 0x1B) != 0)
    {
      objc_msgSend(v19, "contact");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v19, "contact");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "searchableItemForIndexing");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
        {
          v17 = (_QWORD *)a1[4];
          if (v17)
            v17 = (_QWORD *)v17[4];
          v18 = v17;
          objc_msgSend(v19, "contact");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "identifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "failedToCreateSearchableItemForContactIdentifier:", v9);

          goto LABEL_21;
        }
        v9 = 0;
LABEL_8:
        v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "count");
        v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "count") + v11;
        v13 = a1[4];
        if (v13)
          v14 = *(_QWORD *)(v13 + 40);
        else
          v14 = 0;
        if (v12 == v14)
        {
          if ((-[CNIndexRequestHandler batchIndexUpdatingItems:deletingItemsWithIdentifiers:](v13, *(void **)(*(_QWORD *)(a1[5] + 8) + 40), *(void **)(*(_QWORD *)(a1[6] + 8) + 40)) & 1) == 0)
          {
            *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
            *a3 = 1;
            goto LABEL_21;
          }
          *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) += objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "count");
          *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24) += objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "count");
          objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "removeAllObjects");
          objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "removeAllObjects");
        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "_cn_addNonNilObject:", v8);
        objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "_cn_addNonNilObject:", v9);
LABEL_21:

        goto LABEL_22;
      }
      v15 = a1[4];
      if (v15)
        v16 = *(void **)(v15 + 32);
      else
        v16 = 0;
      objc_msgSend(v16, "failedToFetchContactForChange:", v19);
    }
    else
    {
      objc_msgSend(v19, "contactIdentifier");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v9 = (void *)v10;
        v8 = 0;
        goto LABEL_8;
      }
    }
  }
LABEL_22:

}

- (uint64_t)batchIndexUpdatingItems:(void *)a3 deletingItemsWithIdentifiers:
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;

  if (result)
  {
    v5 = result;
    v6 = *(id *)(result + 32);
    v7 = a3;
    v8 = a2;
    objc_msgSend(v6, "willBatchIndexForDeltaSyncWithUpdateCount:deleteCount:", objc_msgSend(v8, "count"), objc_msgSend(v7, "count"));

    v9 = -[CNIndexRequestHandler _batchIndexUpdatingItems:deletingItemsWithIdentifiers:fullSyncOffset:fullSyncDone:](v5, v8, v7, 0, 0);
    return v9;
  }
  return result;
}

- (uint64_t)_batchIndexUpdatingItems:(void *)a3 deletingItemsWithIdentifiers:(void *)a4 fullSyncOffset:(void *)a5 fullSyncDone:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    if (-[CNIndexRequestHandler beginIndexBatch](a1))
    {
      if (objc_msgSend(v9, "count") && !-[CNIndexRequestHandler indexSearchableItems:]((id *)a1, v9)
        || objc_msgSend(v10, "count") && !-[CNIndexRequestHandler deleteSearchableItemsWithIdentifiers:]((id *)a1, v10))
      {
        -[CNIndexRequestHandler endIndexBatchWithClientState]((id *)a1);
      }
      else
      {
        if (v11)
          objc_msgSend(*(id *)(a1 + 48), "setFullSyncOffset:", objc_msgSend(v11, "integerValue"));
        if (v12 && objc_msgSend(v12, "BOOLValue"))
        {
          *(_BYTE *)(a1 + 8) = 0;
          objc_msgSend(*(id *)(a1 + 48), "setIsFullSyncDone:", 1);
        }
        if (-[CNIndexRequestHandler endIndexBatchWithClientState]((id *)a1))
        {
          objc_msgSend(v9, "_cn_map:", &__block_literal_global);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "finishedBatchIndexWithUpdateIdentifiers:deleteIdentifiers:", v13, v10);

          a1 = 1;
          goto LABEL_16;
        }
      }
    }
    a1 = 0;
  }
LABEL_16:

  return a1;
}

- (uint64_t)beginIndexBatch
{
  id v1;

  if (result)
  {
    v1 = *(id *)(result + 24);
    objc_msgSend(v1, "beginIndexBatch");

    return 1;
  }
  return result;
}

- (BOOL)deleteSearchableItemsWithIdentifiers:(id *)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _BOOL8 v9;
  id v11;
  _QWORD v12[5];
  id v13;

  v3 = a2;
  if (a1)
  {
    -[CNIndexRequestHandler _futureForDeleteSearchableItemsWithIdentifiers:](a1, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__CNIndexRequestHandler_deleteSearchableItemsWithIdentifiers___block_invoke;
    v12[3] = &unk_1E29F7C70;
    v12[4] = a1;
    v5 = v3;
    v13 = v5;
    objc_msgSend(v4, "recover:", v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0;
    objc_msgSend(v6, "result:", &v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    v9 = v7 != 0;

    if (!v7)
      objc_msgSend(a1[4], "failedToJournalItemIdentifiersForDeletionWithSpotlight:identifiers:willRetry:", v8, v5, 0);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)endIndexBatchWithClientState
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _BOOL8 v9;
  id v11;
  _QWORD v12[5];
  id v13;

  if (!a1)
    return 0;
  v2 = a1[6];
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNIndexRequestHandler _futureForEndIndexBatchWithClientState:](a1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__CNIndexRequestHandler_endIndexBatchWithClientState__block_invoke;
  v12[3] = &unk_1E29F7C70;
  v12[4] = a1;
  v5 = v3;
  v13 = v5;
  objc_msgSend(v4, "recover:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  objc_msgSend(v6, "result:", &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  v9 = v7 != 0;

  if (!v7)
    objc_msgSend(a1[4], "failedToEndIndexBatchWithSpotlight:willRetry:", v8, 0);

  return v9;
}

uint64_t __107__CNIndexRequestHandler__batchIndexUpdatingItems_deletingItemsWithIdentifiers_fullSyncOffset_fullSyncDone___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

void __62__CNIndexRequestHandler_searchableItemsForContactIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "searchableItemForIndexing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v4 = *(void **)(a1 + 40);
    objc_msgSend(v8, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v5);
  }
  else
  {
    v6 = *(_QWORD **)(a1 + 48);
    if (v6)
      v6 = (_QWORD *)v6[4];
    v7 = v6;
    objc_msgSend(v8, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "failedToCreateSearchableItemForContactIdentifier:", v5);

  }
}

- (id)fetchSearchableItemsIndexedByContactIdentifierWithError:(uint64_t)a1
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v3 = *MEMORY[0x1E0CB2AC0];
  getMDItemUniqueIdentifier[0]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  getMDItemIndexOID[0]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v5;
  getMDItemDisplayName[0]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNCoreSpotlightSearch executeQuery:protectionClass:bundleID:fetchAttributes:error:](CNCoreSpotlightSearch, "executeQuery:protectionClass:bundleID:fetchAttributes:error:", CFSTR("kMDItemRole ==\"*\"), v3, CFSTR("com.apple.MobileAddressBook"), v7, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__CNIndexRequestHandler_fetchSearchableItemsIndexedByContactIdentifierWithError___block_invoke;
  v12[3] = &unk_1E29F7B58;
  v10 = v9;
  v13 = v10;
  objc_msgSend(v8, "_cn_each:", v12);

  return v10;
}

void __81__CNIndexRequestHandler_fetchSearchableItemsIndexedByContactIdentifierWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getMDItemUniqueIdentifier[0]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributeForKey:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v3, v6);
}

- (id)verifyIndexLoggingSummary:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  CNSpotlightIndexingLogger *logger;
  CNSpotlightIndexingLogger *v8;
  CNSpotlightIndexingLogger *v9;
  CNSpotlightIndexingLogger *v10;
  void *v11;
  id v12;
  _QWORD v14[7];
  BOOL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v5 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  if (self)
    logger = self->_logger;
  else
    logger = 0;
  v8 = logger;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__CNIndexRequestHandler_verifyIndexLoggingSummary_error___block_invoke;
  v14[3] = &unk_1E29F7BF8;
  v14[4] = self;
  v14[5] = &v16;
  v14[6] = &v22;
  v15 = !v5;
  -[CNSpotlightIndexingLogger verifyingIndex:](v8, "verifyingIndex:", v14);

  if (v5)
  {
    if (self)
      v9 = self->_logger;
    else
      v9 = 0;
    v10 = v9;
    -[CNSpotlightIndexingLogger verifiedIndexWithSummmary:](v10, "verifiedIndexWithSummmary:", v23[5]);

  }
  if (a4)
  {
    v11 = (void *)v17[5];
    if (v11)
      *a4 = (id)objc_msgSend(v11, "copy");
  }
  v12 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __57__CNIndexRequestHandler_verifyIndexLoggingSummary_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  CNContactFetchRequest *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  char v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  CNContactFormatter *v25;
  CNContactFormatter *v26;
  void *v27;
  const __CFString *data;
  id v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  CNContactFormatter *v34;
  id v35;
  _QWORD v36[5];
  char v37;
  _QWORD v38[4];
  id v39;
  uint64_t v40;
  char v41;
  _QWORD v42[4];
  id v43;
  uint64_t v44;
  char v45;
  _QWORD aBlock[4];
  CNContactFormatter *v47;
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  id v54;
  id v55[2];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v55[0] = *(id *)(v3 + 40);
  -[CNIndexRequestHandler fetchSearchableItemsIndexedByContactIdentifierWithError:](v2, (uint64_t)v55);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), v55[0]);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "appendFormat:", CFSTR("Verification skipped, spotlight error: %@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", CFSTR("identifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 56))
    {
      +[CNContactFormatter descriptorForRequiredKeysForStyle:](CNContactFormatter, "descriptorForRequiredKeysForStyle:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v6);

    }
    v7 = -[CNContactFetchRequest initWithKeysToFetch:]([CNContactFetchRequest alloc], "initWithKeysToFetch:", v5);
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
      v11 = *(void **)(v10 + 16);
    else
      v11 = 0;
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v54 = *(id *)(v12 + 40);
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __57__CNIndexRequestHandler_verifyIndexLoggingSummary_error___block_invoke_2;
    v50[3] = &unk_1E29F7B30;
    v13 = v4;
    v51 = v13;
    v14 = v8;
    v52 = v14;
    v15 = v9;
    v53 = v15;
    v16 = v11;
    v17 = objc_msgSend(v16, "enumerateContactsWithFetchRequest:error:usingBlock:", v7, &v54, v50);
    objc_storeStrong((id *)(v12 + 40), v54);

    if ((v17 & 1) != 0)
    {
      v18 = *(_QWORD *)(a1 + 32);
      v49 = 0;
      -[CNIndexRequestHandler fetchChangeHistoryWithError:](v18, (uint64_t)&v49);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v49;
      objc_msgSend(v19, "contactChanges");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

      if (v21)
      {
        v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        objc_msgSend(v19, "contactChanges");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "appendFormat:", CFSTR("Verification skipped, have pending change history to index, total = %ld.\n"), objc_msgSend(v23, "count"));

      }
      else if (objc_msgSend(v15, "count"))
      {
        v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v48 = *(id *)(v24 + 40);
        CNSetError(&v48, 1004, 0);
        objc_storeStrong((id *)(v24 + 40), v48);
        v25 = objc_alloc_init(CNContactFormatter);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __57__CNIndexRequestHandler_verifyIndexLoggingSummary_error___block_invoke_3;
        aBlock[3] = &unk_1E29F7B80;
        v26 = v25;
        v47 = v26;
        v27 = _Block_copy(aBlock);
        v34 = v26;
        if (-[CNIndexRequestHandler fetchLastClientState](*(_QWORD *)(a1 + 32)))
        {
          data = *(const __CFString **)(a1 + 32);
          if (data)
            data = (const __CFString *)data[1].data;
        }
        else
        {
          data = CFSTR("<no state>");
        }
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "appendFormat:", CFSTR("Client index state:\n%@\n"), data);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "appendFormat:", CFSTR("%ld not indexed:\n"), objc_msgSend(v15, "count"));
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __57__CNIndexRequestHandler_verifyIndexLoggingSummary_error___block_invoke_4;
        v42[3] = &unk_1E29F7BA8;
        v29 = v27;
        v30 = *(_QWORD *)(a1 + 48);
        v43 = v29;
        v44 = v30;
        v45 = *(_BYTE *)(a1 + 56);
        objc_msgSend(v15, "_cn_each:", v42);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "appendFormat:", CFSTR("%ld indexed:\n"), objc_msgSend(v14, "count"));
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __57__CNIndexRequestHandler_verifyIndexLoggingSummary_error___block_invoke_5;
        v38[3] = &unk_1E29F7BA8;
        v31 = *(_QWORD *)(a1 + 48);
        v39 = v29;
        v40 = v31;
        v41 = *(_BYTE *)(a1 + 56);
        v32 = v29;
        objc_msgSend(v14, "_cn_each:", v38);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "appendFormat:", CFSTR("%ld unknown in index:\n"), objc_msgSend(v13, "count"));
        objc_msgSend(v13, "allValues");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __57__CNIndexRequestHandler_verifyIndexLoggingSummary_error___block_invoke_6;
        v36[3] = &unk_1E29F7BD0;
        v37 = *(_BYTE *)(a1 + 56);
        v36[4] = *(_QWORD *)(a1 + 48);
        objc_msgSend(v33, "_cn_each:", v36);

      }
      else
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "appendFormat:", CFSTR("All contacts indexed, total = %ld\n"), objc_msgSend(v14, "count"));
      }

    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "appendFormat:", CFSTR("Verification skipped, contacts error: %@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    }

  }
}

void __57__CNIndexRequestHandler_verifyIndexLoggingSummary_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v9 = v3;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v9, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);
  }

}

void __57__CNIndexRequestHandler_verifyIndexLoggingSummary_error___block_invoke_3(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v7 = a3;
  v8 = a2;
  objc_msgSend(v7, "identifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "stringFromContact:", v7);
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "appendFormat:", CFSTR("<CNContact: identifier=%@, fullName=%@>\n"), v10, v9);
    v8 = (id)v9;
  }
  else
  {

    objc_msgSend(v8, "appendFormat:", CFSTR("<CNContact: identifier=%@>\n"), v10);
  }

}

uint64_t __57__CNIndexRequestHandler_verifyIndexLoggingSummary_error___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2, *(unsigned __int8 *)(a1 + 48));
}

uint64_t __57__CNIndexRequestHandler_verifyIndexLoggingSummary_error___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2, *(unsigned __int8 *)(a1 + 48));
}

void __57__CNIndexRequestHandler_verifyIndexLoggingSummary_error___block_invoke_6(uint64_t a1, void *a2)
{
  int v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4 = a2;
  objc_msgSend(v4, "attributeSet");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  getMDItemUniqueIdentifier[0]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "attributeForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    getMDItemIndexOID[0]();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributeForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributeSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    getMDItemDisplayName[0]();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attributeForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("<CSSearchableItem: identifier=%@, oid=%@, displayName=%@>\n"), v6, v9, v12);

  }
  else
  {

    getMDItemIndexOID[0]();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributeForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("<CSSearchableItem: identifier=%@, oid=%@>\n"), v6, v9);
  }

}

- (_QWORD)_futureForFetchLastClientState
{
  _QWORD *v1;
  id v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v1 = a1;
  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0D13B20]);
    v3 = (void *)v1[3];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__CNIndexRequestHandler__futureForFetchLastClientState__block_invoke;
    v6[3] = &unk_1E29F7C20;
    v7 = v2;
    v4 = v2;
    objc_msgSend(v3, "fetchLastClientStateWithCompletionHandler:", v6);
    objc_msgSend(v4, "future");
    v1 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

void __55__CNIndexRequestHandler__futureForFetchLastClientState__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
  }
  else
  {
    (*(void (**)(void))(*MEMORY[0x1E0D13878] + 16))();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithResult:", v4);

  }
}

_QWORD *__45__CNIndexRequestHandler_fetchLastClientState__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = *(void **)(v3 + 32);
  else
    v4 = 0;
  objc_msgSend(v4, "failedToFetchClientStateFromSpotlight:willRetry:", a2, 1);
  return -[CNIndexRequestHandler _futureForFetchLastClientState](*(_QWORD **)(a1 + 32));
}

- (id)_futureForEndIndexBatchWithClientState:(id *)a1
{
  id v3;
  id v4;
  id v5;
  void *v6;

  v3 = a2;
  if (a1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D13B20]);
    v5 = a1[3];
    objc_msgSend(v4, "errorOnlyCompletionHandlerAdapter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endIndexBatchWithClientState:completionHandler:", v3, v6);

    objc_msgSend(v4, "future");
    a1 = (id *)objc_claimAutoreleasedReturnValue();

  }
  return a1;
}

id *__53__CNIndexRequestHandler_endIndexBatchWithClientState__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = *(void **)(v3 + 32);
  else
    v4 = 0;
  objc_msgSend(v4, "failedToEndIndexBatchWithSpotlight:willRetry:", a2, 1);
  return -[CNIndexRequestHandler _futureForEndIndexBatchWithClientState:](*(id **)(a1 + 32), *(void **)(a1 + 40));
}

- (id)_futureForIndexSearchableItems:(id *)a1
{
  id *v2;
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  v2 = a1;
  if (a1)
  {
    v3 = (objc_class *)MEMORY[0x1E0D13B20];
    v4 = a2;
    v5 = objc_alloc_init(v3);
    v6 = v2[3];
    objc_msgSend(v5, "errorOnlyCompletionHandlerAdapter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexSearchableItems:completionHandler:", v4, v7);

    objc_msgSend(v5, "future");
    v2 = (id *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

id *__46__CNIndexRequestHandler_indexSearchableItems___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v4;
  void *v5;
  _QWORD *v6;
  id v7;
  void *v8;

  v4 = *(_QWORD **)(a1 + 32);
  if (v4)
    v4 = (_QWORD *)v4[4];
  v5 = *(void **)(a1 + 40);
  v6 = v4;
  v7 = a2;
  objc_msgSend(v5, "valueForKey:", CFSTR("uniqueIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "failedToJournalSearchableItemsForIndexingWithSpotlight:identifiers:willRetry:", v7, v8, 1);

  return -[CNIndexRequestHandler _futureForIndexSearchableItems:](*(id **)(a1 + 32), *(void **)(a1 + 40));
}

- (id)_futureForDeleteSearchableItemsWithIdentifiers:(id *)a1
{
  id *v2;
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  v2 = a1;
  if (a1)
  {
    v3 = (objc_class *)MEMORY[0x1E0D13B20];
    v4 = a2;
    v5 = objc_alloc_init(v3);
    v6 = v2[3];
    objc_msgSend(v5, "errorOnlyCompletionHandlerAdapter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deleteSearchableItemsWithIdentifiers:completionHandler:", v4, v7);

    objc_msgSend(v5, "future");
    v2 = (id *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

id *__62__CNIndexRequestHandler_deleteSearchableItemsWithIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = *(void **)(v3 + 32);
  else
    v4 = 0;
  objc_msgSend(v4, "failedToJournalItemIdentifiersForDeletionWithSpotlight:identifiers:willRetry:", a2, *(_QWORD *)(a1 + 40), 1);
  return -[CNIndexRequestHandler _futureForDeleteSearchableItemsWithIdentifiers:](*(id **)(a1 + 32), *(void **)(a1 + 40));
}

- (id)_futureForDeleteAllSearchableItems
{
  id *v1;
  id v2;
  id v3;
  void *v4;

  v1 = a1;
  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0D13B20]);
    v3 = v1[3];
    objc_msgSend(v2, "errorOnlyCompletionHandlerAdapter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deleteAllSearchableItemsWithCompletionHandler:", v4);

    objc_msgSend(v2, "future");
    v1 = (id *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

id *__49__CNIndexRequestHandler_deleteAllSearchableItems__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = *(void **)(v3 + 32);
  else
    v4 = 0;
  objc_msgSend(v4, "failedToDeleteAllSearchableItemsWithSpotlight:willRetry:", a2, 1);
  return -[CNIndexRequestHandler _futureForDeleteAllSearchableItems](*(id **)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientState, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
