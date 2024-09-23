@implementation MPSectionedIdentifierList

void __71__MPSectionedIdentifierList_performWithExclusiveAccessAndReturnObject___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = a1[5];
  +[MPDispatchQueueExclusiveAccessToken tokenWithQueue:owner:](MPDispatchQueueExclusiveAccessToken, "tokenWithQueue:owner:", *(_QWORD *)(a1[4] + 16));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __56__MPSectionedIdentifierList_performWithExclusiveAccess___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  +[MPDispatchQueueExclusiveAccessToken tokenWithQueue:owner:](MPDispatchQueueExclusiveAccessToken, "tokenWithQueue:owner:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __40__MPSectionedIdentifierList_hasSection___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_sectionHeadEntryMapWithExclusiveAccessToken:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3 != 0;

}

void __47__MPSectionedIdentifierList_hasItem_inSection___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_sectionHeadEntryMapWithExclusiveAccessToken:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifiersItemEntryMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v5 != 0;

}

uint64_t __38__MPSectionedIdentifierList_itemCount__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_itemCountWithExclusiveAccessToken:", a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)_itemCountWithExclusiveAccessToken:(id)a3
{
  objc_msgSend(a3, "assertHasExclusiveAccessForOwner:", self);
  return self->_itemCount;
}

uint64_t __77__MPSectionedIdentifierList_enumeratorWithOptions_startPosition_endPosition___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumeratorWithOptions:startPosition:endPosition:withExclusiveAccessToken:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
}

id __50__MPSectionedIdentifierList_allSectionIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_sectionHeadEntryMapWithExclusiveAccessToken:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (MPSectionedIdentifierList)initWithCoder:(id)a3
{
  id v4;
  MPSectionedIdentifierList *v5;
  MPSectionedIdentifierList *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *context;
  id v30;
  void *v31;
  _QWORD v32[4];
  id *v33;

  v4 = a3;
  v5 = -[MPSectionedIdentifierList init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[MPSectionedIdentifierList _beforeInitWithCoder:](v5, "_beforeInitWithCoder:", v4);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

    v6->_itemCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ic"));
    v6->_automaticallyReversesNonDestructiveDataSourceEdits = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("arne"));
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("el"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[MPSectionedIdentifierList _stitchWithPreviousEntry:list:cloneIndex:](v6, "_stitchWithPreviousEntry:list:cloneIndex:", 0, v12, v13);
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __43__MPSectionedIdentifierList_initWithCoder___block_invoke;
    v32[3] = &unk_1E315E048;
    v14 = v6;
    v33 = v14;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v32);
    objc_msgSend(v12, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSArray())
    {
      objc_msgSend(v15, "firstObject");
      v16 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v16;
    }
    objc_storeStrong(v14 + 4, v15);
    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("os"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_storeStrong(v14 + 7, v20);
    }
    else
    {
      v30 = v13;
      v31 = v12;
      context = (void *)MEMORY[0x19403A624]();
      objc_msgSend(v14, "enumeratorWithOptions:", 16777233);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "nextObject");
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = (void *)v22;
        do
        {
          if (objc_msgSend(v23, "entryType") == 2)
          {
            v24 = v14[7];
            objc_msgSend(v23, "trackingEntryResult");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "sectionIdentifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", v26);

          }
          objc_msgSend(v21, "nextObject");
          v27 = objc_claimAutoreleasedReturnValue();

          v23 = (void *)v27;
        }
        while (v27);
      }

      objc_autoreleasePoolPop(context);
      v13 = v30;
      v12 = v31;
    }

  }
  return v6;
}

- (MPSectionedIdentifierList)init
{
  return -[MPSectionedIdentifierList initWithIdentifier:](self, "initWithIdentifier:", 0);
}

- (MPSectionedIdentifierList)initWithIdentifier:(id)a3
{
  id v4;
  MPSectionedIdentifierList *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *accessQueue;
  NSString *v8;
  NSString *identifier;
  uint64_t v10;
  NSMutableDictionary *sectionHeadEntryMap;
  uint64_t v12;
  NSMutableDictionary *sectionTransactionCallouts;
  uint64_t v14;
  NSMutableArray *startEntries;
  uint64_t v16;
  NSMutableArray *orderedSections;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MPSectionedIdentifierList;
  v5 = -[MPSectionedIdentifierList init](&v19, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.mediaplayer.MPSectionedIdentifierList/accessQueue", 0);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v6;

    if (v4)
    {
      v8 = (NSString *)v4;
    }
    else
    {
      MSVNanoIDCreateTaggedPointer();
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    identifier = v5->_identifier;
    v5->_identifier = v8;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    sectionHeadEntryMap = v5->_sectionHeadEntryMap;
    v5->_sectionHeadEntryMap = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    sectionTransactionCallouts = v5->_sectionTransactionCallouts;
    v5->_sectionTransactionCallouts = (NSMutableDictionary *)v12;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    startEntries = v5->_startEntries;
    v5->_startEntries = (NSMutableArray *)v14;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    orderedSections = v5->_orderedSections;
    v5->_orderedSections = (NSMutableArray *)v16;

  }
  return v5;
}

void __70__MPSectionedIdentifierList__stitchWithPreviousEntry_list_cloneIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  id v7;

  v7 = a2;
  if (_NSIsNSArray())
  {
    objc_msgSend(*(id *)(a1 + 32), "_stitchWithPreviousEntry:list:cloneIndex:", *(_QWORD *)(a1 + 40), v7, *(_QWORD *)(a1 + 48));
  }
  else
  {
    v6 = v7;
    objc_msgSend(*(id *)(a1 + 32), "_stitchPreviousEntry:toEntry:cloneIndex:", *(_QWORD *)(a1 + 40), v6, *(_QWORD *)(a1 + 48));
    if (!a3)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
      if (objc_msgSend(v6, "entryType") == 4)
        objc_msgSend(*(id *)(a1 + 32), "_stitchLastItemEntryToHeadEntry:branchList:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
    }

  }
}

- (void)_stitchWithPreviousEntry:(id)a3 list:(id)a4 cloneIndex:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__38631;
  v36 = __Block_byref_object_dispose__38632;
  v22 = v8;
  v37 = v22;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v29;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v14);
        v16 = _NSIsNSArray();
        v17 = v15;
        v18 = (void *)v33[5];
        if (v16)
        {
          v19 = v18;
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __70__MPSectionedIdentifierList__stitchWithPreviousEntry_list_cloneIndex___block_invoke;
          v23[3] = &unk_1E315E070;
          v23[4] = self;
          v20 = v19;
          v24 = v20;
          v25 = v10;
          v27 = &v32;
          v21 = v17;
          v26 = v21;
          objc_msgSend(v21, "enumerateObjectsUsingBlock:", v23);

        }
        else
        {
          -[MPSectionedIdentifierList _stitchPreviousEntry:toEntry:cloneIndex:](self, "_stitchPreviousEntry:toEntry:cloneIndex:", v18, v17, v10, v22);
          v21 = (id)v33[5];
          v33[5] = (uint64_t)v17;
        }

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    }
    while (v12);
  }

  _Block_object_dispose(&v32, 8);
}

- (void)_stitchLastItemEntryToHeadEntry:(id)a3 branchList:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _QWORD v32[3];

  v32[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    v26 = v5;
    objc_msgSend(v5, "sectionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v6;
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((_NSIsNSArray() & 1) == 0)
    {
      v32[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v24 = v8;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v9, "reverseObjectEnumerator", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v10);
          v15 = *(id *)(*((_QWORD *)&v27 + 1) + 8 * i);
          if (_NSIsNSArray())
          {
            objc_msgSend(v15, "firstObject");
            v16 = objc_claimAutoreleasedReturnValue();

            v15 = (id)v16;
          }
          v17 = v15;
          if (objc_msgSend(v17, "entryType") == 3)
          {
            v18 = v17;
            if ((objc_msgSend(v18, "isUserCloned") & 1) == 0)
            {
              objc_msgSend(v18, "sectionIdentifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "isEqualToString:", v7);

              objc_msgSend(v18, "hostedSectionIdentifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "isEqualToString:", v7);

              if ((v20 & 1) != 0 || (v22 & 1) != 0)
              {
                objc_msgSend(v26, "setLastItemEntry:", v18);

                goto LABEL_20;
              }
            }

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_20:

    v6 = v25;
    v5 = v26;
  }

}

void __69__MPSectionedIdentifierList_replaceDataSource_forSection_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  void *v7;
  MPSectionedIdentifierListEnumerator *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  void *v24;
  uint8_t v25[16];
  uint8_t buf[16];

  v3 = a2;
  objc_msgSend(v3, "assertHasExclusiveAccessForOwner:", a1[4]);
  v4 = os_log_create("com.apple.amp.mediaplayer", "Default");
  v5 = v4;
  v6 = a1[8];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SIL-Replace-Enumerate", (const char *)&unk_193F291C9, buf, 2u);
  }

  objc_msgSend(*(id *)(a1[4] + 40), "objectForKeyedSubscript:", a1[5]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a1[9], a1[4], CFSTR("MPSectionedIdentifierList.m"), 344, CFSTR("Could not find head entry for section identifier: %@"), a1[5]);

  }
  v8 = -[MPSectionedIdentifierListEnumerator initWithSectionedIdentifierList:options:startEntry:endEntry:withExclusiveAccessToken:]([MPSectionedIdentifierListEnumerator alloc], "initWithSectionedIdentifierList:options:startEntry:endEntry:withExclusiveAccessToken:", a1[4], 33, v7, 0, v3);
  -[MPSectionedIdentifierListEnumerator nextObjectWithExclusiveAccessToken:](v8, "nextObjectWithExclusiveAccessToken:", v3);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    while (1)
    {
      if (objc_msgSend(v10, "entryType") == 3)
      {
        objc_msgSend(v10, "itemResult");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sectionIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", a1[5]);

        if (v13)
        {
          v14 = (void *)a1[6];
          objc_msgSend(v10, "itemResult");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "itemIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v16);

        }
      }
      else if (objc_msgSend(v10, "entryType") == 4)
      {
        objc_msgSend(v10, "trackingEntryResult");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "sectionIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", a1[5]);

        if ((v19 & 1) != 0)
        {
LABEL_14:

          break;
        }
      }
      -[MPSectionedIdentifierListEnumerator nextObjectWithExclusiveAccessToken:](v8, "nextObjectWithExclusiveAccessToken:", v3);
      v20 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v20;
      if (!v20)
        goto LABEL_14;
    }
  }
  objc_msgSend(v7, "setDataSource:", a1[7]);
  v21 = os_log_create("com.apple.amp.mediaplayer", "Default");
  v22 = v21;
  v23 = a1[8];
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)v25 = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v22, OS_SIGNPOST_INTERVAL_END, v23, "SIL-Replace-Enumerate", (const char *)&unk_193F291C9, v25, 2u);
  }

}

- (void)_stitchPreviousEntry:(id)a3 toEntry:(id)a4 cloneIndex:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSMutableDictionary *v12;
  void *v13;
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *sectionHeadEntryMap;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "setPreviousEntry:", v8);
  if (objc_msgSend(v9, "entryType") != 4)
  {
    if (v8)
      objc_msgSend(v8, "addNextEntry:", v9);
    else
      -[NSMutableArray addObject:](self->_startEntries, "addObject:", v9);
  }
  v11 = objc_msgSend(v9, "entryType");
  switch(v11)
  {
    case 4:
      objc_msgSend(v8, "setTailEntry:", v9);
      objc_msgSend(v9, "setSectionHeadEntry:", v8);
      break;
    case 3:
      v14 = v9;
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __69__MPSectionedIdentifierList__stitchPreviousEntry_toEntry_cloneIndex___block_invoke;
      v29[3] = &unk_1E315E098;
      v30 = v10;
      v15 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19403A810](v29);
      objc_msgSend(v14, "positionKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "generation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("1"));

      if (v18)
      {
        if (objc_msgSend(v14, "hasClones"))
        {
          objc_msgSend(v14, "sectionIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "itemIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, void *))v15)[2](v15, v19, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "setRootEntry:", v14);
        }
        sectionHeadEntryMap = self->_sectionHeadEntryMap;
        objc_msgSend(v14, "sectionIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](sectionHeadEntryMap, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "identifiersItemEntryMap");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "itemIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v14, v26);

      }
      else
      {
        objc_msgSend(v14, "sectionIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "itemIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, void *))v15)[2](v15, v27, v28);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "clonedEntries");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v14);
      }

      break;
    case 2:
      v12 = self->_sectionHeadEntryMap;
      objc_msgSend(v9, "sectionIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v9, v13);

      break;
  }

}

- (id)enumeratorWithOptions:(unint64_t)a3 startPosition:(id)a4 endPosition:(id)a5 withExclusiveAccessToken:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  __objc2_class **v14;
  void *v15;

  v10 = a6;
  v11 = a5;
  -[MPSectionedIdentifierList _entryForPosition:withExclusiveAccessToken:](self, "_entryForPosition:withExclusiveAccessToken:", a4, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSectionedIdentifierList _entryForPosition:withExclusiveAccessToken:](self, "_entryForPosition:withExclusiveAccessToken:", v11, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = off_1E3146BC8;
  if ((a3 & 8) != 0)
    v14 = off_1E3146BD8;
  v15 = (void *)objc_msgSend(objc_alloc(*v14), "initWithSectionedIdentifierList:options:startEntry:endEntry:withExclusiveAccessToken:", self, a3, v12, v13, v10);

  return v15;
}

- (id)_entryForPosition:(id)a3 withExclusiveAccessToken:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "assertHasExclusiveAccessForOwner:", self);
  if (v7)
  {
    switch(objc_msgSend(v7, "entryType"))
    {
      case 0:
      case 1:
      case 5:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPSectionedIdentifierList.m"), 1030, CFSTR("Unsupported position type"));
        v10 = 0;
        goto LABEL_10;
      case 2:
        -[MPSectionedIdentifierList _sectionHeadEntryMapWithExclusiveAccessToken:](self, "_sectionHeadEntryMapWithExclusiveAccessToken:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "sectionIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 3:
        objc_msgSend(v7, "itemIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "sectionIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSectionedIdentifierList _itemEntry:sectionIdentifier:withExclusiveAccessToken:](self, "_itemEntry:sectionIdentifier:withExclusiveAccessToken:", v9, v11, v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "latestUserClone");
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      case 4:
        -[MPSectionedIdentifierList _sectionHeadEntryMapWithExclusiveAccessToken:](self, "_sectionHeadEntryMapWithExclusiveAccessToken:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "sectionIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "tailEntry");
        v13 = objc_claimAutoreleasedReturnValue();
LABEL_8:
        v10 = (void *)v13;

LABEL_9:
LABEL_10:

        break;
      default:
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    v10 = 0;
  }

  return v10;
}

void __53__MPSectionedIdentifierList_isDeletedItem_inSection___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_sectionHeadEntryMapWithExclusiveAccessToken:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifiersItemEntryMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestUserClone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v6, "isRemoved");

}

- (id)_endEntryWithExclusiveAccessToken:(id)a3
{
  objc_msgSend(a3, "assertHasExclusiveAccessForOwner:", self);
  return self->_endEntry;
}

- (id)_sectionHeadEntryMapWithExclusiveAccessToken:(id)a3
{
  objc_msgSend(a3, "assertHasExclusiveAccessForOwner:", self);
  return self->_sectionHeadEntryMap;
}

- (id)_startEntriesWithExclusiveAccessToken:(id)a3
{
  objc_msgSend(a3, "assertHasExclusiveAccessForOwner:", self);
  return (id)-[NSMutableArray copy](self->_startEntries, "copy");
}

- (id)_itemEntry:(id)a3 sectionIdentifier:(id)a4 withExclusiveAccessToken:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v11, "assertHasExclusiveAccessForOwner:", self);
  -[MPSectionedIdentifierList _sectionHeadEntryMapWithExclusiveAccessToken:](self, "_sectionHeadEntryMapWithExclusiveAccessToken:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKeyedSubscript:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifiersItemEntryMap");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPSectionedIdentifierList.m"), 1055, CFSTR("No item exists at %@:%@"), v10, v9);

  }
  return v15;
}

- (BOOL)automaticallyReversesNonDestructiveDataSourceEdits
{
  return self->_automaticallyReversesNonDestructiveDataSourceEdits;
}

- (void)replaceDataSource:(id)a3 forSection:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  _MPIdentifierListSectionProxy *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  os_signpost_id_t v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  os_signpost_id_t v32;
  SEL v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = os_log_create("com.apple.amp.mediaplayer", "Default");
  v14 = os_signpost_id_make_with_pointer(v13, self);

  v15 = os_log_create("com.apple.amp.mediaplayer", "Default");
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_DWORD *)buf = 138543362;
    v35 = v10;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "SIL-Replace", "section=%{public}@", buf, 0xCu);
  }

  v17 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __69__MPSectionedIdentifierList_replaceDataSource_forSection_completion___block_invoke;
  v28[3] = &unk_1E315E110;
  v28[4] = self;
  v29 = v10;
  v32 = v14;
  v33 = a2;
  v30 = v12;
  v31 = v9;
  v18 = v9;
  v19 = v12;
  v20 = v10;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v28);
  v21 = os_log_create("com.apple.amp.mediaplayer", "Default");
  v22 = v21;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v14, "SIL-Replace-Reload", (const char *)&unk_193F291C9, buf, 2u);
  }

  v23 = -[_MPIdentifierListSectionProxy initWithSection:sectionedIdentifierList:existingItemIdentifiers:]([_MPIdentifierListSectionProxy alloc], "initWithSection:sectionedIdentifierList:existingItemIdentifiers:", v20, self, v19);
  v25[0] = v17;
  v25[1] = 3221225472;
  v25[2] = __69__MPSectionedIdentifierList_replaceDataSource_forSection_completion___block_invoke_43;
  v25[3] = &unk_1E315E138;
  v26 = v11;
  v27 = v14;
  v24 = v11;
  objc_msgSend(v18, "reloadSection:completion:", v23, v25);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)itemCount
{
  int64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__MPSectionedIdentifierList_itemCount__block_invoke;
  v4[3] = &unk_1E315E2C8;
  v4[4] = self;
  v4[5] = &v5;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isDeletedItem:(id)a3 inSection:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__MPSectionedIdentifierList_isDeletedItem_inSection___block_invoke;
  v11[3] = &unk_1E315E278;
  v14 = &v15;
  v11[4] = self;
  v8 = v7;
  v12 = v8;
  v9 = v6;
  v13 = v9;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v11);
  LOBYTE(self) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)self;
}

- (BOOL)hasItem:(id)a3 inSection:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__MPSectionedIdentifierList_hasItem_inSection___block_invoke;
  v11[3] = &unk_1E315E278;
  v14 = &v15;
  v11[4] = self;
  v8 = v7;
  v12 = v8;
  v9 = v6;
  v13 = v9;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v11);
  LOBYTE(self) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)self;
}

- (BOOL)hasSection:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__MPSectionedIdentifierList_hasSection___block_invoke;
  v7[3] = &unk_1E315E2A0;
  v9 = &v10;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (void)performWithExclusiveAccess:(id)a3
{
  uint64_t v4;
  void *v5;
  NSObject *accessQueue;
  void (**v7)(id, void *);
  _QWORD block[5];
  void (**v9)(id, void *);

  v7 = (void (**)(id, void *))a3;
  if (_MPSectionIdentifierListExclusivityDisabledPThreadKey_sOnceToken != -1)
    dispatch_once(&_MPSectionIdentifierListExclusivityDisabledPThreadKey_sOnceToken, &__block_literal_global_38628);
  v4 = _MPSectionIdentifierListExclusivityDisabledPThreadKey_sThreadKey;
  if (pthread_getspecific(_MPSectionIdentifierListExclusivityDisabledPThreadKey_sThreadKey))
  {
    +[MPPThreadKeyExclusiveAccessToken tokenWithKey:owner:](MPPThreadKeyExclusiveAccessToken, "tokenWithKey:owner:", v4, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v5);
  }
  else
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__MPSectionedIdentifierList_performWithExclusiveAccess___block_invoke;
    block[3] = &unk_1E3162560;
    block[4] = self;
    v9 = v7;
    dispatch_sync(accessQueue, block);
    v5 = v9;
  }

}

- (void)setAutomaticallyReversesNonDestructiveDataSourceEdits:(BOOL)a3
{
  self->_automaticallyReversesNonDestructiveDataSourceEdits = a3;
}

- (NSSet)allSectionIdentifiers
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__MPSectionedIdentifierList_allSectionIdentifiers__block_invoke;
  v3[3] = &unk_1E315E228;
  v3[4] = self;
  -[MPSectionedIdentifierList performWithExclusiveAccessAndReturnObject:](self, "performWithExclusiveAccessAndReturnObject:", v3);
  return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)enumeratorWithOptions:(unint64_t)a3 startPosition:(id)a4 endPosition:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;
  unint64_t v17;

  v8 = a4;
  v9 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__MPSectionedIdentifierList_enumeratorWithOptions_startPosition_endPosition___block_invoke;
  v14[3] = &unk_1E315E188;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = a3;
  v10 = v9;
  v11 = v8;
  -[MPSectionedIdentifierList performWithExclusiveAccessAndReturnObject:](self, "performWithExclusiveAccessAndReturnObject:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)performWithExclusiveAccessAndReturnObject:(id)a3
{
  void (**v4)(id, void *);
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *accessQueue;
  id v10;
  _QWORD block[5];
  void (**v13)(id, void *);
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = (void (**)(id, void *))a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__38631;
  v19 = __Block_byref_object_dispose__38632;
  v20 = 0;
  if (_MPSectionIdentifierListExclusivityDisabledPThreadKey_sOnceToken != -1)
    dispatch_once(&_MPSectionIdentifierListExclusivityDisabledPThreadKey_sOnceToken, &__block_literal_global_38628);
  v5 = _MPSectionIdentifierListExclusivityDisabledPThreadKey_sThreadKey;
  if (pthread_getspecific(_MPSectionIdentifierListExclusivityDisabledPThreadKey_sThreadKey))
  {
    +[MPPThreadKeyExclusiveAccessToken tokenWithKey:owner:](MPPThreadKeyExclusiveAccessToken, "tokenWithKey:owner:", v5, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v16[5];
    v16[5] = v7;

  }
  else
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__MPSectionedIdentifierList_performWithExclusiveAccessAndReturnObject___block_invoke;
    block[3] = &unk_1E315E160;
    v14 = &v15;
    block[4] = self;
    v13 = v4;
    dispatch_sync(accessQueue, block);
    v6 = v13;
  }

  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setAnnotationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_annotationDelegate, a3);
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;

  -[MPSectionedIdentifierList enumeratorWithOptions:](self, "enumeratorWithOptions:", 23);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSectionedIdentifierList _debugDescriptionWithEnumerator:lengths:](self, "_debugDescriptionWithEnumerator:lengths:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)_debugDescriptionWithEnumerator:(id)a3 lengths:(id *)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  int v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  _BOOL4 v37;
  void *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  uint64_t v43;
  char v44;
  const __CFString *v45;
  void *v46;
  const __CFString *v47;
  BOOL v48;
  const __CFString *v49;
  __CFString *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  __CFString *v64;
  void *v65;
  id v66;
  int64_t v67;
  void *v68;
  void *v69;
  uint64_t i;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  _BOOL4 v83;
  const __CFString *v84;
  const __CFString *v85;
  const __CFString *v86;
  void *v87;
  uint64_t v88;
  id v89;
  int64_t v90;
  void *v92;
  __CFString *v93;
  void *v94;
  __CFString *obj;
  id obja;
  void *context;
  void *contexta;
  void *v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _QWORD v114[5];
  id v115;
  _BYTE v116[128];
  _QWORD v117[5];
  _QWORD v118[7];

  v118[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v4;
  objc_msgSend(v4, "nextObject");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v94, "branchDepth");
  LODWORD(v104) = 0;
  LODWORD(v105) = 0;
  LODWORD(v102) = 0;
  LODWORD(v103) = 0;
  v7 = 0;
  v8 = 0;
  v93 = &stru_1E3163D10;
  do
  {
    v9 = v6;
    context = (void *)MEMORY[0x19403A624]();
    objc_msgSend(v92, "nextObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "branchDepth");
    v12 = v9 - v8;
    v108 = (void *)v11;
    if (v9 == v8)
    {
      v13 = v11;
    }
    else
    {
      v99 = v10;
      v14 = v9;
      if (v9 > v8)
      {
        v15 = (2 * v8) | 1;
        do
        {
          objc_msgSend(&stru_1E3163D10, "stringByPaddingToLength:withString:startingAtIndex:", v15, CFSTR(" ┃"), 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringByAppendingString:", CFSTR("⤵︎"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v118[0] = v17;
          v118[1] = &stru_1E3163D10;
          v118[2] = &stru_1E3163D10;
          v118[3] = &stru_1E3163D10;
          v118[4] = &stru_1E3163D10;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 5);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v18);

          v15 += 2;
          --v12;
        }
        while (v12);
      }
      v9 = v14;
      objc_msgSend(&stru_1E3163D10, "stringByPaddingToLength:withString:startingAtIndex:", 2 * v14, CFSTR("┃ "), 0);
      v19 = objc_claimAutoreleasedReturnValue();

      v93 = (__CFString *)v19;
      v13 = (uint64_t)v108;
      v10 = v99;
    }
    -[MPSectionedIdentifierList annotationDelegate](self, "annotationDelegate");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v10;
    v106 = (void *)v9;
    if (v10)
      v21 = v13 < v9;
    else
      v21 = 1;
    v22 = v21;
    switch(objc_msgSend(v94, "entryType"))
    {
      case 0:
        v23 = &stru_1E3163D10;
        v24 = &stru_1E3163D10;
        v25 = &stru_1E3163D10;
        v26 = &stru_1E3163D10;
        v27 = CFSTR("UNKNOWN");
        break;
      case 1:
        -[__CFString stringByAppendingString:](v93, "stringByAppendingString:", CFSTR("┏◨ START"));
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v23 = &stru_1E3163D10;
        v24 = &stru_1E3163D10;
        v25 = &stru_1E3163D10;
        v26 = &stru_1E3163D10;
        break;
      case 2:
        -[__CFString stringByAppendingString:](v93, "stringByAppendingString:", CFSTR("┣◑ HEAD"));
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "trackingEntryResult");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "sectionIdentifier");
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_46;
        objc_msgSend(v100, "debugDescriptionForSection:", v26);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v29)
          v23 = v29;
        else
          v23 = &stru_1E3163D10;

        goto LABEL_62;
      case 3:
        objc_msgSend(v94, "itemResult");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPSectionedIdentifierList+Debugging.m"), 81, CFSTR("debugDescription is counting on itemResult being an instance of %@"), objc_opt_class());

        }
        if (v22)
          v32 = CFSTR("┗◉ ITEM");
        else
          v32 = CFSTR("┣◉ ITEM");
        -[__CFString stringByAppendingString:](v93, "stringByAppendingString:", v32);
        obj = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "sectionIdentifier");
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "itemIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("- "), "stringByAppendingString:", v33);
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v34 = objc_msgSend(v31, "state");
        v88 = v35;
        v114[0] = MEMORY[0x1E0C809B0];
        v114[1] = 3221225472;
        v114[2] = __80__MPSectionedIdentifierList_Debugging___debugDescriptionWithEnumerator_lengths___block_invoke;
        v114[3] = &unk_1E31598C0;
        v114[4] = self;
        v36 = v31;
        v115 = v36;
        v37 = -[MPSectionedIdentifierList performWithExclusiveAccessAndReturnBOOL:](self, "performWithExclusiveAccessAndReturnBOOL:", v114);
        v38 = (void *)MEMORY[0x1E0CB3940];
        if ((v34 & 0x100) != 0)
          v39 = CFSTR("⛔️");
        else
          v39 = CFSTR("▫️");
        if ((v34 & 1) != 0)
          v40 = CFSTR("🔅");
        else
          v40 = CFSTR("▫️");
        if ((v34 & 0x1000000) != 0)
          v41 = CFSTR("🛑");
        else
          v41 = CFSTR("▫️");
        if ((v34 & 0x10000) != 0)
          v42 = CFSTR("🔆");
        else
          v42 = CFSTR("▫️");
        v43 = v34 & 0x10000000000;
        if ((v34 & 0x100000000) != 0)
        {
          v45 = CFSTR("🆔");
        }
        else
        {
          if (!v43)
            goto LABEL_49;
          v86 = v39;
          v87 = (void *)MEMORY[0x1E0CB3940];
          v84 = v41;
          v85 = v40;
          v83 = v37;
          v44 = objc_msgSend(v36, "isRemoved");
          v37 = v83;
          v41 = v84;
          v40 = v85;
          v39 = v86;
          v38 = v87;
          if ((v44 & 1) != 0)
          {
            v43 = 1;
            v45 = CFSTR("✴️");
          }
          else
          {
LABEL_49:
            v45 = CFSTR("❇️");
            if ((v34 & 0x1000000000000) == 0)
              v45 = CFSTR("▫️");
          }
        }
        v48 = !v37;
        v49 = CFSTR("🆘");
        if (!v48)
          v49 = CFSTR("✳️");
        if ((v34 & 0x100000000000000) == 0)
          v49 = CFSTR("▫️");
        objc_msgSend(v38, "stringWithFormat:", CFSTR("%@%@%@%@%@%@"), v39, v40, v41, v42, v45, v49);
        v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v24 = v50;
        if (v43)
        {
          -[__CFString stringByAppendingFormat:](v50, "stringByAppendingFormat:", CFSTR(" (%ld)"), v88);
          v51 = objc_claimAutoreleasedReturnValue();

          v24 = (__CFString *)v51;
        }
        v27 = obj;
        v23 = &stru_1E3163D10;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v36, "itemIdentifier");
          v52 = objc_claimAutoreleasedReturnValue();
          v89 = v36;
          objc_msgSend(v36, "sectionIdentifier");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = (void *)v52;
          objc_msgSend(v100, "debugDescriptionForItem:inSection:", v52, v53);
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          if (v55)
            v23 = v55;
          else
            v23 = &stru_1E3163D10;

          v27 = obj;
          v36 = v89;
        }

        break;
      case 4:
        objc_msgSend(v94, "trackingEntryResult");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "sectionIdentifier");
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v22)
          v47 = CFSTR("┗◐ TAIL");
        else
          v47 = CFSTR("┣◐ TAIL");
        -[__CFString stringByAppendingString:](v93, "stringByAppendingString:", v47);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_46:
        v23 = &stru_1E3163D10;
LABEL_62:
        v24 = &stru_1E3163D10;
        v25 = &stru_1E3163D10;
        break;
      case 5:
        v23 = &stru_1E3163D10;
        v24 = &stru_1E3163D10;
        v25 = &stru_1E3163D10;
        v26 = &stru_1E3163D10;
        v27 = CFSTR("┗◧ END");
        break;
      default:
        v23 = &stru_1E3163D10;
        v24 = &stru_1E3163D10;
        v25 = &stru_1E3163D10;
        v26 = &stru_1E3163D10;
        v27 = &stru_1E3163D10;
        break;
    }
    v56 = -[__CFString length](v27, "length");
    if ((int)v102 <= v56)
      v57 = v56;
    else
      v57 = v102;
    v102 = v57;
    v58 = -[__CFString length](v26, "length");
    if ((int)v103 <= v58)
      v59 = v58;
    else
      v59 = v103;
    v103 = v59;
    v60 = -[__CFString length](v25, "length");
    if ((int)v104 <= v60)
      v61 = v60;
    else
      v61 = v104;
    v104 = v61;
    v62 = -[__CFString length](v24, "length");
    if ((int)v105 <= v62)
      v63 = v62;
    else
      v63 = v105;
    v105 = v63;
    v64 = v27;
    v117[0] = v27;
    v117[1] = v26;
    v117[2] = v25;
    v117[3] = v24;
    v117[4] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 5);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v65);

    if (v7 <= 0xC7)
    {
      v66 = v20;

      v94 = v66;
    }
    else
    {
      v108 = v106;
    }
    v67 = v7 + 1;

    objc_autoreleasePoolPop(context);
    v6 = (uint64_t)v108;
    if (v7 > 0xC7)
      break;
    ++v7;
    v8 = (uint64_t)v106;
  }
  while (v94);
  v90 = v67;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  obja = v5;
  v101 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v110, v116, 16);
  if (v101)
  {
    contexta = *(void **)v111;
    do
    {
      for (i = 0; i != v101; ++i)
      {
        if (*(void **)v111 != contexta)
          objc_enumerationMutation(obja);
        v71 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * i);
        v109 = (void *)MEMORY[0x19403A624]();
        if ((unint64_t)objc_msgSend(v69, "length") >= 2)
          objc_msgSend(v69, "appendString:", CFSTR("\n"));
        objc_msgSend(v71, "objectAtIndexedSubscript:", 0);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "stringByPaddingToLength:withString:startingAtIndex:", v102, CFSTR(" "), 0);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "objectAtIndexedSubscript:", 1);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "stringByLeftPaddingToLength:withString:startingAtIndex:", v103, CFSTR(" "), 0);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "objectAtIndexedSubscript:", 2);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "stringByPaddingToLength:withString:startingAtIndex:", v104, CFSTR(" "), 0);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "objectAtIndexedSubscript:", 3);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "stringByPaddingToLength:withString:startingAtIndex:", v105, CFSTR(" "), 0);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "objectAtIndexedSubscript:", 4);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "appendFormat:", CFSTR("%@ %@ %@ %@ %@"), v72, v74, v76, v78, v79, 0);

        objc_autoreleasePoolPop(v109);
      }
      v101 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v110, v116, 16);
    }
    while (v101);
  }

  if (v90 < -[MPSectionedIdentifierList itemCount](self, "itemCount"))
    objc_msgSend(v69, "appendFormat:", CFSTR("... and %lld more"), -[MPSectionedIdentifierList itemCount](self, "itemCount") - v90);
  if (a4)
  {
    a4->var0 = v102;
    a4->var1 = v103;
    a4->var2 = v104;
    a4->var3 = v105;
  }

  return v69;
}

BOOL __80__MPSectionedIdentifierList_Debugging___debugDescriptionWithEnumerator_lengths___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;

  objc_msgSend(*(id *)(a1 + 32), "_sectionHeadEntryMapWithExclusiveAccessToken:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifiersItemEntryMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "itemIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == *(void **)(a1 + 40);

  return v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v3 = (void *)MEMORY[0x19403A624](self, a2);
  -[MPSectionedIdentifierList enumeratorWithOptions:](self, "enumeratorWithOptions:", 16777247);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      if ((unint64_t)(objc_msgSend(v6, "entryType") - 2) <= 2)
        objc_msgSend(v6, "prepareForDealloc");
      objc_msgSend(v4, "nextObject");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    while (v7);
  }

  objc_autoreleasePoolPop(v3);
  v8.receiver = self;
  v8.super_class = (Class)MPSectionedIdentifierList;
  -[MPSectionedIdentifierList dealloc](&v8, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  NSString *identifier;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  identifier = self->_identifier;
  -[NSMutableArray msv_compactDescription](self->_orderedSections, "msv_compactDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p id=%@ sections=[%@]>"), v4, self, identifier, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__MPSectionedIdentifierList_encodeWithCoder___block_invoke;
  v6[3] = &unk_1E315E0C0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v6);

}

- (void)encodeWithCoder:(id)a3 withExclusiveAccessToken:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = a3;
  objc_msgSend(v6, "assertHasExclusiveAccessForOwner:", self);
  objc_msgSend(v8, "encodeObject:forKey:", self->_identifier, CFSTR("id"));
  objc_msgSend(v8, "encodeInteger:forKey:", self->_itemCount, CFSTR("ic"));
  objc_msgSend(v8, "encodeBool:forKey:", self->_automaticallyReversesNonDestructiveDataSourceEdits, CFSTR("arne"));
  -[MPSectionedIdentifierList _encodeEntry:withExclusiveAccessToken:](self, "_encodeEntry:withExclusiveAccessToken:", self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("el"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_orderedSections, CFSTR("os"));

}

- (id)_encodeEntry:(id)a3 withExclusiveAccessToken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  MPSectionedIdentifierList *v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__38631;
  v28 = __Block_byref_object_dispose__38632;
  v9 = v6;
  v10 = v9;
  v11 = 0;
  v29 = v9;
  while (1)
  {
    objc_msgSend(v9, "encodableNextEntriesWithExclusiveAccessToken:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12 || !objc_msgSend(v12, "count"))
      break;
    if (objc_msgSend(v12, "count") == 1)
    {
      objc_msgSend(v12, "firstObject");
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v13);
      v14 = (id)v25[5];
      v25[5] = v13;
    }
    else
    {
      if ((unint64_t)objc_msgSend(v12, "count") < 2)
        goto LABEL_9;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __67__MPSectionedIdentifierList__encodeEntry_withExclusiveAccessToken___block_invoke;
      v19[3] = &unk_1E315E0E8;
      v14 = v15;
      v23 = &v24;
      v20 = v14;
      v21 = self;
      v22 = v7;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", v19);
      v16 = (void *)objc_msgSend(v14, "copy");
      objc_msgSend(v8, "addObject:", v16);

    }
LABEL_9:
    v9 = (id)v25[5];
    v11 = v12;
  }
  v17 = (void *)objc_msgSend(v8, "copy");
  _Block_object_dispose(&v24, 8);

  return v17;
}

- (BOOL)performWithExclusiveAccessAndReturnBOOL:(id)a3
{
  uint64_t (**v4)(id, void *);
  uint64_t v5;
  void *v6;
  char v7;
  NSObject *accessQueue;
  char v9;
  _QWORD block[5];
  uint64_t (**v12)(id, void *);
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = (uint64_t (**)(id, void *))a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  if (_MPSectionIdentifierListExclusivityDisabledPThreadKey_sOnceToken != -1)
    dispatch_once(&_MPSectionIdentifierListExclusivityDisabledPThreadKey_sOnceToken, &__block_literal_global_38628);
  v5 = _MPSectionIdentifierListExclusivityDisabledPThreadKey_sThreadKey;
  if (pthread_getspecific(_MPSectionIdentifierListExclusivityDisabledPThreadKey_sThreadKey))
  {
    +[MPPThreadKeyExclusiveAccessToken tokenWithKey:owner:](MPPThreadKeyExclusiveAccessToken, "tokenWithKey:owner:", v5, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4[2](v4, v6);
    *((_BYTE *)v15 + 24) = v7;
  }
  else
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__MPSectionedIdentifierList_performWithExclusiveAccessAndReturnBOOL___block_invoke;
    block[3] = &unk_1E315E160;
    v13 = &v14;
    block[4] = self;
    v12 = v4;
    dispatch_sync(accessQueue, block);
    v6 = v12;
  }

  v9 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (int64_t)performWithExclusiveAccessAndReturnInteger:(id)a3
{
  uint64_t (**v4)(id, void *);
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *accessQueue;
  int64_t v9;
  _QWORD block[5];
  uint64_t (**v12)(id, void *);
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = (uint64_t (**)(id, void *))a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  if (_MPSectionIdentifierListExclusivityDisabledPThreadKey_sOnceToken != -1)
    dispatch_once(&_MPSectionIdentifierListExclusivityDisabledPThreadKey_sOnceToken, &__block_literal_global_38628);
  v5 = _MPSectionIdentifierListExclusivityDisabledPThreadKey_sThreadKey;
  if (pthread_getspecific(_MPSectionIdentifierListExclusivityDisabledPThreadKey_sThreadKey))
  {
    +[MPPThreadKeyExclusiveAccessToken tokenWithKey:owner:](MPPThreadKeyExclusiveAccessToken, "tokenWithKey:owner:", v5, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4[2](v4, v6);
    v15[3] = v7;
  }
  else
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__MPSectionedIdentifierList_performWithExclusiveAccessAndReturnInteger___block_invoke;
    block[3] = &unk_1E315E160;
    v13 = &v14;
    block[4] = self;
    v12 = v4;
    dispatch_sync(accessQueue, block);
    v6 = v12;
  }

  v9 = v15[3];
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (id)enumeratorWithOptions:(unint64_t)a3
{
  return -[MPSectionedIdentifierList enumeratorWithOptions:startPosition:endPosition:](self, "enumeratorWithOptions:startPosition:endPosition:", a3, 0, 0);
}

- (void)addDataSourceAtStart:(id)a3 section:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__MPSectionedIdentifierList_addDataSourceAtStart_section_completion___block_invoke;
  v13[3] = &unk_1E315E1B0;
  v13[4] = self;
  v14 = v9;
  v15 = v8;
  v10 = v8;
  v12 = v9;
  v11 = a5;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v13);
  -[MPSectionedIdentifierList _loadDataSource:forSection:completion:](self, "_loadDataSource:forSection:completion:", v10, v12, v11);

}

- (void)addDataSource:(id)a3 section:(id)a4 afterHeadOfSection:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  SEL v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __81__MPSectionedIdentifierList_addDataSource_section_afterHeadOfSection_completion___block_invoke;
  v18[3] = &unk_1E315E1D8;
  v18[4] = self;
  v19 = v13;
  v21 = v11;
  v22 = a2;
  v20 = v12;
  v14 = v11;
  v15 = v12;
  v17 = v13;
  v16 = a6;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v18);
  -[MPSectionedIdentifierList _loadDataSource:forSection:completion:](self, "_loadDataSource:forSection:completion:", v14, v15, v16);

}

- (id)_firstSectionIDBeforePosition:(id)a3 withExclusiveAccessToken:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SEL v16;
  MPSectionedIdentifierList *v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  void *context;

  v7 = a3;
  v8 = a4;
  context = (void *)MEMORY[0x19403A624]();
  -[MPSectionedIdentifierList enumeratorWithOptions:startPosition:endPosition:withExclusiveAccessToken:](self, "enumeratorWithOptions:startPosition:endPosition:withExclusiveAccessToken:", 16777241, v7, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nextObjectWithExclusiveAccessToken:", v8);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    do
    {
      switch(objc_msgSend(v11, "entryType"))
      {
        case 0:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          v16 = a2;
          v17 = self;
          v18 = 513;
          v19 = CFSTR("Unexpected encounter of Unknown entry");
          goto LABEL_9;
        case 1:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          v16 = a2;
          v17 = self;
          v18 = 507;
          v19 = CFSTR("Unexpected encounter of Start entry");
          goto LABEL_9;
        case 2:
        case 4:
          objc_msgSend(v11, "trackingEntryResult");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "sectionIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
            goto LABEL_12;
          break;
        case 5:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          v16 = a2;
          v17 = self;
          v18 = 510;
          v19 = CFSTR("Unexpected encounter of End entry");
LABEL_9:
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", v16, v17, CFSTR("MPSectionedIdentifierList.m"), v18, v19);

          break;
        default:
          break;
      }
      objc_msgSend(v9, "nextObjectWithExclusiveAccessToken:", v8);
      v20 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v20;
    }
    while (v20);
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPSectionedIdentifierList.m"), 520, CFSTR("Could not find section identifier to update orderedSections"));

  v11 = 0;
  v13 = 0;
LABEL_12:

  objc_autoreleasePoolPop(context);
  return v13;
}

- (void)addDataSource:(id)a3 section:(id)a4 afterItem:(id)a5 inSection:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  SEL v27;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __82__MPSectionedIdentifierList_addDataSource_section_afterItem_inSection_completion___block_invoke;
  v22[3] = &unk_1E315E200;
  v22[4] = self;
  v23 = v15;
  v24 = v16;
  v25 = v14;
  v26 = v13;
  v27 = a2;
  v17 = v13;
  v18 = v14;
  v19 = v16;
  v21 = v15;
  v20 = a7;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v22);
  -[MPSectionedIdentifierList _loadDataSource:forSection:completion:](self, "_loadDataSource:forSection:completion:", v17, v18, v20);

}

- (void)addDataSource:(id)a3 section:(id)a4 afterTailOfSection:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  SEL v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __81__MPSectionedIdentifierList_addDataSource_section_afterTailOfSection_completion___block_invoke;
  v18[3] = &unk_1E315E1D8;
  v18[4] = self;
  v19 = v13;
  v21 = v11;
  v22 = a2;
  v20 = v12;
  v14 = v11;
  v15 = v12;
  v17 = v13;
  v16 = a6;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v18);
  -[MPSectionedIdentifierList _loadDataSource:forSection:completion:](self, "_loadDataSource:forSection:completion:", v14, v15, v16);

}

- (void)addDataSource:(id)a3 section:(id)a4 beforeTailOfSection:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  SEL v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __82__MPSectionedIdentifierList_addDataSource_section_beforeTailOfSection_completion___block_invoke;
  v18[3] = &unk_1E315E1D8;
  v18[4] = self;
  v19 = v13;
  v21 = v11;
  v22 = a2;
  v20 = v12;
  v14 = v11;
  v15 = v12;
  v17 = v13;
  v16 = a6;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v18);
  -[MPSectionedIdentifierList _loadDataSource:forSection:completion:](self, "_loadDataSource:forSection:completion:", v14, v15, v16);

}

- (void)addDataSourceAtEnd:(id)a3 section:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__MPSectionedIdentifierList_addDataSourceAtEnd_section_completion___block_invoke;
  v13[3] = &unk_1E315E1B0;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v10 = v9;
  v12 = v8;
  v11 = a5;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v13);
  -[MPSectionedIdentifierList _loadDataSource:forSection:completion:](self, "_loadDataSource:forSection:completion:", v12, v10, v11);

}

- (NSArray)orderedSectionIdentifiers
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__MPSectionedIdentifierList_orderedSectionIdentifiers__block_invoke;
  v3[3] = &unk_1E315E228;
  v3[4] = self;
  -[MPSectionedIdentifierList performWithExclusiveAccessAndReturnObject:](self, "performWithExclusiveAccessAndReturnObject:", v3);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)firstSectionMatching:(id)a3 containingItem:(id)a4 inSection:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  SEL v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__MPSectionedIdentifierList_firstSectionMatching_containingItem_inSection___block_invoke;
  v17[3] = &unk_1E315E250;
  v17[4] = self;
  v18 = v10;
  v20 = v9;
  v21 = a2;
  v19 = v11;
  v12 = v9;
  v13 = v11;
  v14 = v10;
  -[MPSectionedIdentifierList performWithExclusiveAccessAndReturnObject:](self, "performWithExclusiveAccessAndReturnObject:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)moveItemToStart:(id)a3 fromSection:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__MPSectionedIdentifierList_moveItemToStart_fromSection___block_invoke;
  v10[3] = &unk_1E315E1B0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v10);

}

- (void)moveItemToEnd:(id)a3 fromSection:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__MPSectionedIdentifierList_moveItemToEnd_fromSection___block_invoke;
  v10[3] = &unk_1E315E1B0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v10);

}

- (void)moveItem:(id)a3 fromSection:(id)a4 afterHeadOfSection:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  SEL v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__MPSectionedIdentifierList_moveItem_fromSection_afterHeadOfSection___block_invoke;
  v15[3] = &unk_1E315E1D8;
  v15[4] = self;
  v16 = v11;
  v18 = v10;
  v19 = a2;
  v17 = v9;
  v12 = v10;
  v13 = v9;
  v14 = v11;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v15);

}

- (void)moveItem:(id)a3 fromSection:(id)a4 afterItem:(id)a5 inSection:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __70__MPSectionedIdentifierList_moveItem_fromSection_afterItem_inSection___block_invoke;
  v18[3] = &unk_1E315E2F0;
  v18[4] = self;
  v19 = v12;
  v20 = v13;
  v21 = v10;
  v22 = v11;
  v14 = v11;
  v15 = v10;
  v16 = v13;
  v17 = v12;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v18);

}

- (void)moveItem:(id)a3 fromSection:(id)a4 afterTailOfSection:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  SEL v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__MPSectionedIdentifierList_moveItem_fromSection_afterTailOfSection___block_invoke;
  v15[3] = &unk_1E315E1D8;
  v15[4] = self;
  v16 = v11;
  v18 = v10;
  v19 = a2;
  v17 = v9;
  v12 = v10;
  v13 = v9;
  v14 = v11;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v15);

}

- (void)removeItem:(id)a3 fromSection:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__MPSectionedIdentifierList_removeItem_fromSection___block_invoke;
  v10[3] = &unk_1E315E1B0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v10);

}

- (void)dataSourceInsertItemsAtHead:(id)a3 inSection:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  SEL v21;

  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPSectionedIdentifierList.m"), 723, CFSTR("Invalid insertion (no item identifiers) in section: %@"), v8);

  }
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__MPSectionedIdentifierList_dataSourceInsertItemsAtHead_inSection___block_invoke;
  v18[3] = &unk_1E315E318;
  v18[4] = self;
  v10 = v8;
  v19 = v10;
  v21 = a2;
  v11 = v7;
  v20 = v11;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v18);
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __67__MPSectionedIdentifierList_dataSourceInsertItemsAtHead_inSection___block_invoke_2;
  v15[3] = &unk_1E3163698;
  v15[4] = self;
  v16 = v11;
  v17 = v10;
  v12 = v10;
  v13 = v11;
  -[MPSectionedIdentifierList _performDelegateCalloutForSection:block:](self, "_performDelegateCalloutForSection:block:", v12, v15);

}

- (void)dataSourceInsertItems:(id)a3 afterItem:(id)a4 inSection:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPSectionedIdentifierList.m"), 744, CFSTR("Invalid insertion (no item identifiers) in section: %@"), v11);

  }
  v12 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __71__MPSectionedIdentifierList_dataSourceInsertItems_afterItem_inSection___block_invoke;
  v22[3] = &unk_1E315E340;
  v22[4] = self;
  v23 = v10;
  v13 = v11;
  v24 = v13;
  v14 = v9;
  v25 = v14;
  v15 = v10;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v22);
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __71__MPSectionedIdentifierList_dataSourceInsertItems_afterItem_inSection___block_invoke_2;
  v19[3] = &unk_1E3163698;
  v19[4] = self;
  v20 = v14;
  v21 = v13;
  v16 = v13;
  v17 = v14;
  -[MPSectionedIdentifierList _performDelegateCalloutForSection:block:](self, "_performDelegateCalloutForSection:block:", v16, v19);

}

- (void)dataSourceInsertItemsAtTail:(id)a3 inSection:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  SEL v21;

  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPSectionedIdentifierList.m"), 765, CFSTR("Invalid insertion (no item identifiers) in section: %@"), v8);

  }
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__MPSectionedIdentifierList_dataSourceInsertItemsAtTail_inSection___block_invoke;
  v18[3] = &unk_1E315E318;
  v18[4] = self;
  v10 = v8;
  v19 = v10;
  v21 = a2;
  v11 = v7;
  v20 = v11;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v18);
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __67__MPSectionedIdentifierList_dataSourceInsertItemsAtTail_inSection___block_invoke_2;
  v15[3] = &unk_1E3163698;
  v15[4] = self;
  v16 = v11;
  v17 = v10;
  v12 = v10;
  v13 = v11;
  -[MPSectionedIdentifierList _performDelegateCalloutForSection:block:](self, "_performDelegateCalloutForSection:block:", v12, v15);

}

- (void)dataSourceMoveItemToHead:(id)a3 inSection:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  SEL v20;

  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__MPSectionedIdentifierList_dataSourceMoveItemToHead_inSection___block_invoke;
  v17[3] = &unk_1E315E318;
  v17[4] = self;
  v10 = v7;
  v18 = v10;
  v11 = v8;
  v19 = v11;
  v20 = a2;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v17);
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __64__MPSectionedIdentifierList_dataSourceMoveItemToHead_inSection___block_invoke_2;
  v14[3] = &unk_1E3163698;
  v14[4] = self;
  v15 = v10;
  v16 = v11;
  v12 = v11;
  v13 = v10;
  -[MPSectionedIdentifierList _performDelegateCalloutForSection:block:](self, "_performDelegateCalloutForSection:block:", v12, v14);

}

- (void)dataSourceMoveItem:(id)a3 afterItem:(id)a4 inSection:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  SEL v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __68__MPSectionedIdentifierList_dataSourceMoveItem_afterItem_inSection___block_invoke;
  v21[3] = &unk_1E315E1D8;
  v21[4] = self;
  v13 = v9;
  v22 = v13;
  v14 = v11;
  v23 = v14;
  v24 = v10;
  v25 = a2;
  v15 = v10;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v21);
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __68__MPSectionedIdentifierList_dataSourceMoveItem_afterItem_inSection___block_invoke_2;
  v18[3] = &unk_1E3163698;
  v18[4] = self;
  v19 = v13;
  v20 = v14;
  v16 = v14;
  v17 = v13;
  -[MPSectionedIdentifierList _performDelegateCalloutForSection:block:](self, "_performDelegateCalloutForSection:block:", v16, v18);

}

- (void)dataSourceMoveItemToTail:(id)a3 inSection:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  SEL v20;

  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__MPSectionedIdentifierList_dataSourceMoveItemToTail_inSection___block_invoke;
  v17[3] = &unk_1E315E318;
  v17[4] = self;
  v10 = v7;
  v18 = v10;
  v11 = v8;
  v19 = v11;
  v20 = a2;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v17);
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __64__MPSectionedIdentifierList_dataSourceMoveItemToTail_inSection___block_invoke_2;
  v14[3] = &unk_1E3163698;
  v14[4] = self;
  v15 = v10;
  v16 = v11;
  v12 = v11;
  v13 = v10;
  -[MPSectionedIdentifierList _performDelegateCalloutForSection:block:](self, "_performDelegateCalloutForSection:block:", v12, v14);

}

- (void)dataSourceRemoveItems:(id)a3 fromSection:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  MPSectionedIdentifierList *v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__MPSectionedIdentifierList_dataSourceRemoveItems_fromSection___block_invoke;
  v16[3] = &unk_1E315E1B0;
  v9 = v6;
  v17 = v9;
  v18 = self;
  v10 = v7;
  v19 = v10;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v16);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __63__MPSectionedIdentifierList_dataSourceRemoveItems_fromSection___block_invoke_2;
  v13[3] = &unk_1E3163698;
  v13[4] = self;
  v14 = v9;
  v15 = v10;
  v11 = v10;
  v12 = v9;
  -[MPSectionedIdentifierList _performDelegateCalloutForSection:block:](self, "_performDelegateCalloutForSection:block:", v11, v13);

}

- (void)dataSourceReloadItems:(id)a3 inSection:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__MPSectionedIdentifierList_dataSourceReloadItems_inSection___block_invoke;
  v10[3] = &unk_1E3163698;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[MPSectionedIdentifierList _performDelegateCalloutForSection:block:](self, "_performDelegateCalloutForSection:block:", v8, v10);

}

- (void)dataSourceUpdateSection:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__MPSectionedIdentifierList_dataSourceUpdateSection___block_invoke;
  v6[3] = &unk_1E31635F8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MPSectionedIdentifierList _performDelegateCalloutForSection:block:](self, "_performDelegateCalloutForSection:block:", v5, v6);

}

- (void)dataSourceBeginTransactionForSection:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  SEL v9;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__MPSectionedIdentifierList_dataSourceBeginTransactionForSection___block_invoke;
  v7[3] = &unk_1E315E368;
  v7[4] = self;
  v8 = v5;
  v9 = a2;
  v6 = v5;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v7);

}

- (void)dataSourceEndTransactionForSection:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id WeakRetained;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[5];
  id v19;
  SEL v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __64__MPSectionedIdentifierList_dataSourceEndTransactionForSection___block_invoke;
  v18[3] = &unk_1E315E390;
  v18[4] = self;
  v6 = v5;
  v19 = v6;
  v20 = a2;
  -[MPSectionedIdentifierList performWithExclusiveAccessAndReturnObject:](self, "performWithExclusiveAccessAndReturnObject:", v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "sectionedIdentifierList:dataSourceDidBeginTransactionForSection:", self, v6);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13) + 16))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13));
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
    }
    while (v11);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "sectionedIdentifierList:dataSourceDidEndTransactionForSection:", self, v6, (_QWORD)v14);

}

- (void)_addBranchToEntry:(id)a3 entries:(id)a4 withExclusiveAccessToken:(id)a5
{
  MPSectionedIdentifierListEntry *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MPSectionedIdentifierListEntry *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSMutableArray *v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  MPSectionedIdentifierListEntry *v31;
  MPSectionedIdentifierListEntry *endEntry;
  void *v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = (MPSectionedIdentifierListEntry *)a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v11, "assertHasExclusiveAccessForOwner:", self);
  if (objc_msgSend(v10, "count"))
  {
    if (v9)
    {
LABEL_3:
      -[MPSectionedIdentifierList _sectionHeadEntryMapWithExclusiveAccessToken:](self, "_sectionHeadEntryMapWithExclusiveAccessToken:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSectionedIdentifierListEntry sectionIdentifier](v9, "sectionIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "tailEntry");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "previousEntry");
      v16 = (MPSectionedIdentifierListEntry *)objc_claimAutoreleasedReturnValue();
      if (v16 == v9)
      {
        -[MPSectionedIdentifierListEntry sectionIdentifier](v9, "sectionIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v34 = v11;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "sectionIdentifier");
        v35 = v10;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v33, "isEqualToString:", v19) ^ 1;

        v10 = v35;
        v11 = v34;

      }
      else
      {
        v17 = 0;
      }

      -[MPSectionedIdentifierListEntry addBranch:forceBranchDepthIncrease:](v9, "addBranch:forceBranchDepthIncrease:", v10, v17);
      goto LABEL_16;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPSectionedIdentifierList.m"), 960, CFSTR("Cannot add empty branch"));

    if (v9)
      goto LABEL_3;
  }
  v21 = v11;
  v22 = self->_startEntries;
  v23 = -[NSMutableArray count](v22, "count");
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v24 = v10;
  v25 = v10;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v37;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v37 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v29++), "setBranchDepth:", v23);
      }
      while (v27 != v29);
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v27);
  }

  objc_msgSend(v25, "firstObject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v22, "addObject:", v30);

  v10 = v24;
  v11 = v21;
LABEL_16:
  if (self->_endEntry == v9)
  {
    objc_msgSend(v10, "lastObject");
    v31 = (MPSectionedIdentifierListEntry *)objc_claimAutoreleasedReturnValue();
    endEntry = self->_endEntry;
    self->_endEntry = v31;

  }
}

- (id)_dataSourceInsertItems:(id)a3 fromSection:(id)a4 afterEntry:(id)a5 withExclusiveAccessToken:(id)a6
{
  id v10;
  id v11;
  id v12;
  MPSectionedIdentifierList *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  MPSectionedIdentifierList *v24;
  void *v25;
  NSObject *v26;
  MPSectionedIdentifierList *v27;
  uint64_t v28;
  void *v29;
  void *v31;
  id v32;
  id obj;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = self;
  v32 = v12;
  v14 = a6;
  objc_msgSend(v14, "assertHasExclusiveAccessForOwner:", v13);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v34 = (id)objc_claimAutoreleasedReturnValue();
  v31 = v14;
  -[MPSectionedIdentifierList _sectionHeadEntryMapWithExclusiveAccessToken:](v13, "_sectionHeadEntryMapWithExclusiveAccessToken:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v11;
  objc_msgSend(v15, "objectForKeyedSubscript:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v10;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v36 != v20)
          objc_enumerationMutation(obj);
        v22 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        +[MPSectionedIdentifierListItemEntry itemEntryWithSectionIdentifier:itemIdentifier:](MPSectionedIdentifierListItemEntry, "itemEntryWithSectionIdentifier:itemIdentifier:", v16, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v13;
        if (-[MPSectionedIdentifierList automaticallyReversesNonDestructiveDataSourceEdits](v13, "automaticallyReversesNonDestructiveDataSourceEdits"))
        {
          objc_msgSend(v23, "setUserRemoved");
        }
        objc_msgSend(v34, "addObject:", v23);
        objc_msgSend(v17, "identifiersItemEntryMap");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v23, v22);

        v13 = v24;
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v19);
  }

  -[MPSectionedIdentifierList _addBranchToEntry:entries:withExclusiveAccessToken:](v13, "_addBranchToEntry:entries:withExclusiveAccessToken:", v32, v34, v31);
  if (-[MPSectionedIdentifierList automaticallyReversesNonDestructiveDataSourceEdits](v13, "automaticallyReversesNonDestructiveDataSourceEdits"))
  {
    v26 = os_log_create("com.apple.amp.mediaplayer", "SIL");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = v13;
      v28 = objc_msgSend(obj, "count");
      objc_msgSend(obj, "msv_compactDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v16;
      v41 = 2048;
      v42 = v28;
      v13 = v27;
      v43 = 2114;
      v44 = v29;
      _os_log_impl(&dword_193B9B000, v26, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] _dataSourceInsertItems:fromSection:afterEntry: | setUserRemoved [auto reversing datasource edits] items=(:%lld)[%{public}@]", buf, 0x20u);

    }
  }
  if (!-[MPSectionedIdentifierList automaticallyReversesNonDestructiveDataSourceEdits](v13, "automaticallyReversesNonDestructiveDataSourceEdits"))v13->_itemCount += objc_msgSend(v34, "count");

  return v34;
}

- (id)_dataSourceMoveItem:(id)a3 inSection:(id)a4 afterEntry:(id)a5 withExclusiveAccessToken:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "assertHasExclusiveAccessForOwner:", self);
  -[MPSectionedIdentifierList _itemEntry:sectionIdentifier:withExclusiveAccessToken:](self, "_itemEntry:sectionIdentifier:withExclusiveAccessToken:", v13, v12, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "newClonedEntry");
  objc_msgSend(v15, "setDataSourceCloned");
  v21[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSectionedIdentifierList _addBranchToEntry:entries:withExclusiveAccessToken:](self, "_addBranchToEntry:entries:withExclusiveAccessToken:", v11, v16, v10);

  objc_msgSend(v14, "setDataSourceMoved");
  -[MPSectionedIdentifierList _sectionHeadEntryMapWithExclusiveAccessToken:](self, "_sectionHeadEntryMapWithExclusiveAccessToken:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "objectForKeyedSubscript:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "identifiersItemEntryMap");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v15, v13);

  return v15;
}

- (void)_insertDataSourceHead:(id)a3 afterEntry:(id)a4 withExclusiveAccessToken:(id)a5
{
  id v8;
  MPSectionedIdentifierListEntry *v9;
  id v10;
  MPSectionedIdentifierListEntry *v11;
  MPSectionedIdentifierListEntry *endEntry;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (MPSectionedIdentifierListEntry *)a4;
  v10 = a5;
  objc_msgSend(v10, "assertHasExclusiveAccessForOwner:", self);
  if (self->_endEntry == v9)
  {
    objc_msgSend(v8, "tailEntry");
    v11 = (MPSectionedIdentifierListEntry *)objc_claimAutoreleasedReturnValue();
    endEntry = self->_endEntry;
    self->_endEntry = v11;

  }
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSectionedIdentifierList _addBranchToEntry:entries:withExclusiveAccessToken:](self, "_addBranchToEntry:entries:withExclusiveAccessToken:", v9, v13, v10);

}

- (void)_insertDataSource:(id)a3 forSection:(id)a4 afterEntry:(id)a5 withExclusiveAccessToken:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "assertHasExclusiveAccessForOwner:", self);
  +[MPSectionedIdentifierListHeadEntry headEntryWithSectionIdentifier:](MPSectionedIdentifierListHeadEntry, "headEntryWithSectionIdentifier:", v12);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDataSource:", v13);

  -[MPSectionedIdentifierList _sectionHeadEntryMapWithExclusiveAccessToken:](self, "_sectionHeadEntryMapWithExclusiveAccessToken:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, v12);

  -[MPSectionedIdentifierList _insertDataSourceHead:afterEntry:withExclusiveAccessToken:](self, "_insertDataSourceHead:afterEntry:withExclusiveAccessToken:", v15, v11, v10);
}

- (void)_loadDataSource:(id)a3 forSection:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _MPIdentifierListSectionProxy *v11;
  _MPIdentifierListSectionProxy *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [_MPIdentifierListSectionProxy alloc];
  v12 = -[_MPIdentifierListSectionProxy initWithSection:sectionedIdentifierList:existingItemIdentifiers:](v11, "initWithSection:sectionedIdentifierList:existingItemIdentifiers:", v9, self, MEMORY[0x1E0C9AA60]);

  objc_msgSend(v10, "reloadSection:completion:", v12, v8);
}

- (NSDictionary)_sectionDataSources
{
  void *v3;
  NSMutableDictionary *sectionHeadEntryMap;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_sectionHeadEntryMap, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sectionHeadEntryMap = self->_sectionHeadEntryMap;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__MPSectionedIdentifierList__sectionDataSources__block_invoke;
  v8[3] = &unk_1E315E3B8;
  v9 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sectionHeadEntryMap, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return (NSDictionary *)v6;
}

- (id)_tailEntryForSectionIdentifier:(id)a3 withExclusiveAccessToken:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "assertHasExclusiveAccessForOwner:", self);
  -[MPSectionedIdentifierList _sectionHeadEntryMapWithExclusiveAccessToken:](self, "_sectionHeadEntryMapWithExclusiveAccessToken:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tailEntry");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPSectionedIdentifierList.m"), 1085, CFSTR("No tail exists for %@"), v7);

  }
  return v11;
}

- (void)_performDelegateCalloutForSection:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  id v8;
  void (**v9)(void);
  _QWORD v10[5];
  id v11;
  void (**v12)(void);

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__MPSectionedIdentifierList__performDelegateCalloutForSection_block___block_invoke;
  v10[3] = &unk_1E315E3E0;
  v10[4] = self;
  v11 = v6;
  v9 = (void (**)(void))v7;
  v12 = v9;
  v8 = v6;
  if (-[MPSectionedIdentifierList performWithExclusiveAccessAndReturnBOOL:](self, "performWithExclusiveAccessAndReturnBOOL:", v10))
  {
    v9[2]();
  }

}

- (MPSectionedIdentifierListDelegate)delegate
{
  return (MPSectionedIdentifierListDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (MPSectionedIdentifierListAnnotationDelegate)annotationDelegate
{
  return (MPSectionedIdentifierListAnnotationDelegate *)objc_loadWeakRetained((id *)&self->_annotationDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_annotationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_orderedSections, 0);
  objc_storeStrong((id *)&self->_sectionTransactionCallouts, 0);
  objc_storeStrong((id *)&self->_sectionHeadEntryMap, 0);
  objc_storeStrong((id *)&self->_endEntry, 0);
  objc_storeStrong((id *)&self->_startEntries, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

BOOL __69__MPSectionedIdentifierList__performDelegateCalloutForSection_block___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1[4] + 48), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x19403A810](a1[6]);
  objc_msgSend(v2, "addObject:", v3);

  return v2 == 0;
}

void __48__MPSectionedIdentifierList__sectionDataSources__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "dataSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

id __64__MPSectionedIdentifierList_dataSourceEndTransactionForSection___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v5;

  objc_msgSend(*(id *)(a1[4] + 48), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("MPSectionedIdentifierList.m"), 937, CFSTR("Attempt to end transaction for section without active transaction: %@"), a1[5]);

  }
  objc_msgSend(*(id *)(a1[4] + 48), "objectForKeyedSubscript:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 48), "setObject:forKeyedSubscript:", 0, a1[5]);
  return v3;
}

void __66__MPSectionedIdentifierList_dataSourceBeginTransactionForSection___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1[4] + 48), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("MPSectionedIdentifierList.m"), 930, CFSTR("Attempted to begin transaction for section with active transaction: %@"), a1[5]);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 48), "setObject:forKeyedSubscript:", v4, a1[5]);

}

void __53__MPSectionedIdentifierList_dataSourceUpdateSection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "sectionedIdentifierList:dataSourceDidUpdateSection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __61__MPSectionedIdentifierList_dataSourceReloadItems_inSection___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 80));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "sectionedIdentifierList:dataSourceDidUpdateItems:inSection:", a1[4], a1[5], a1[6]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "sectionedIdentifierList:dataSourceDidChangeItems:inSection:", a1[4], a1[5], a1[6]);

}

void __63__MPSectionedIdentifierList_dataSourceRemoveItems_fromSection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 40), "_itemEntry:sectionIdentifier:withExclusiveAccessToken:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8), *(_QWORD *)(a1 + 48), v3, (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "latestUserClone");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isRemoved");

        if ((v11 & 1) == 0)
          --*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        objc_msgSend(v9, "setDataSourceRemoved");

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

void __63__MPSectionedIdentifierList_dataSourceRemoveItems_fromSection___block_invoke_2(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 80));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "sectionedIdentifierList:dataSourceDidRemoveItems:fromSection:", a1[4], a1[5], a1[6]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "sectionedIdentifierList:dataSourceDidChangeItems:inSection:", a1[4], a1[5], a1[6]);

}

void __64__MPSectionedIdentifierList_dataSourceMoveItemToTail_inSection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "automaticallyReversesNonDestructiveDataSourceEdits"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_itemEntry:sectionIdentifier:withExclusiveAccessToken:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "automaticallyReversesNonDestructiveDataSourceEdits"))
  {
    objc_msgSend(v4, "latestUserClone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "_sectionHeadEntryMapWithExclusiveAccessToken:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastItemEntry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("MPSectionedIdentifierList.m"), 855, CFSTR("Could not find tail item entry for section identifier: %@"), *(_QWORD *)(a1 + 48));

  }
  objc_msgSend(*(id *)(a1 + 32), "_dataSourceMoveItem:inSection:afterEntry:withExclusiveAccessToken:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v8, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_sectionHeadEntryMapWithExclusiveAccessToken:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLastItemEntry:", v9);

  if (objc_msgSend(*(id *)(a1 + 32), "automaticallyReversesNonDestructiveDataSourceEdits"))
  {
    if (v4)
    {
      if (v5)
        goto LABEL_12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("MPSectionedIdentifierList.m"), 861, CFSTR("entryToMove cannot be nil"));

      if (v5)
        goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("MPSectionedIdentifierList.m"), 862, CFSTR("entryToMoveLatestUserClone cannot be nil"));

LABEL_12:
    if (v4 == v5)
    {
      v12 = (void *)objc_msgSend(v9, "newClonedEntry");
      objc_msgSend(v9, "setUserMoved");
      v13 = *(void **)(a1 + 32);
      v18[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_addBranchToEntry:entries:withExclusiveAccessToken:", v4, v14, v3);

    }
  }

}

void __64__MPSectionedIdentifierList_dataSourceMoveItemToTail_inSection___block_invoke_2(_QWORD *a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 80));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = a1[4];
    v8[0] = a1[5];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "sectionedIdentifierList:dataSourceDidMoveItems:inSection:", v3, v4, a1[6]);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = a1[4];
    v7 = a1[5];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "sectionedIdentifierList:dataSourceDidChangeItems:inSection:", v5, v6, a1[6]);

  }
}

void __68__MPSectionedIdentifierList_dataSourceMoveItem_afterItem_inSection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "automaticallyReversesNonDestructiveDataSourceEdits"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_itemEntry:sectionIdentifier:withExclusiveAccessToken:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "automaticallyReversesNonDestructiveDataSourceEdits"))
  {
    objc_msgSend(v4, "latestUserClone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "_itemEntry:sectionIdentifier:withExclusiveAccessToken:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_dataSourceMoveItem:inSection:afterEntry:withExclusiveAccessToken:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_sectionHeadEntryMapWithExclusiveAccessToken:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastItemEntry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_sectionHeadEntryMapWithExclusiveAccessToken:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLastItemEntry:", v7);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "automaticallyReversesNonDestructiveDataSourceEdits"))
  {
    if (v4)
    {
      if (v5)
        goto LABEL_12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("MPSectionedIdentifierList.m"), 828, CFSTR("entryToMove cannot be nil"));

      if (v5)
        goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("MPSectionedIdentifierList.m"), 829, CFSTR("entryToMoveLatestUserClone cannot be nil"));

LABEL_12:
    if (v4 == v5)
    {
      v13 = (void *)objc_msgSend(v7, "newClonedEntry");
      objc_msgSend(v7, "setUserMoved");
      v14 = *(void **)(a1 + 32);
      v18[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_addBranchToEntry:entries:withExclusiveAccessToken:", v4, v15, v3);

    }
  }

}

void __68__MPSectionedIdentifierList_dataSourceMoveItem_afterItem_inSection___block_invoke_2(_QWORD *a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 80));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = a1[4];
    v8[0] = a1[5];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "sectionedIdentifierList:dataSourceDidMoveItems:inSection:", v3, v4, a1[6]);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = a1[4];
    v7 = a1[5];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "sectionedIdentifierList:dataSourceDidChangeItems:inSection:", v5, v6, a1[6]);

  }
}

void __64__MPSectionedIdentifierList_dataSourceMoveItemToHead_inSection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "automaticallyReversesNonDestructiveDataSourceEdits"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_itemEntry:sectionIdentifier:withExclusiveAccessToken:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "automaticallyReversesNonDestructiveDataSourceEdits"))
  {
    objc_msgSend(v4, "latestUserClone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "_sectionHeadEntryMapWithExclusiveAccessToken:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("MPSectionedIdentifierList.m"), 790, CFSTR("Could not find head entry for section identifier: %@"), *(_QWORD *)(a1 + 48));

  }
  objc_msgSend(*(id *)(a1 + 32), "_dataSourceMoveItem:inSection:afterEntry:withExclusiveAccessToken:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "automaticallyReversesNonDestructiveDataSourceEdits"))
  {
    if (v4)
    {
      if (v5)
        goto LABEL_12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("MPSectionedIdentifierList.m"), 794, CFSTR("entryToMove cannot be nil"));

      if (v5)
        goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("MPSectionedIdentifierList.m"), 795, CFSTR("entryToMoveLatestUserClone cannot be nil"));

LABEL_12:
    if (v4 == v5)
    {
      v9 = (void *)objc_msgSend(v8, "newClonedEntry");
      objc_msgSend(v8, "setUserMoved");
      v10 = *(void **)(a1 + 32);
      v15[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_addBranchToEntry:entries:withExclusiveAccessToken:", v4, v11, v3);

    }
  }

}

void __64__MPSectionedIdentifierList_dataSourceMoveItemToHead_inSection___block_invoke_2(_QWORD *a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 80));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = a1[4];
    v8[0] = a1[5];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "sectionedIdentifierList:dataSourceDidMoveItems:inSection:", v3, v4, a1[6]);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = a1[4];
    v7 = a1[5];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "sectionedIdentifierList:dataSourceDidChangeItems:inSection:", v5, v6, a1[6]);

  }
}

void __67__MPSectionedIdentifierList_dataSourceInsertItemsAtTail_inSection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_sectionHeadEntryMapWithExclusiveAccessToken:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tailEntry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previousEntry");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("MPSectionedIdentifierList.m"), 768, CFSTR("Could not find last entry (tailEntry.previous) for section identifier: %@"), *(_QWORD *)(a1 + 40));

    v8 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "_dataSourceInsertItems:fromSection:afterEntry:withExclusiveAccessToken:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_sectionHeadEntryMapWithExclusiveAccessToken:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLastItemEntry:", v10);

}

void __67__MPSectionedIdentifierList_dataSourceInsertItemsAtTail_inSection___block_invoke_2(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 80));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "sectionedIdentifierList:dataSourceDidAddItems:toSection:", a1[4], a1[5], a1[6]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "sectionedIdentifierList:dataSourceDidChangeItems:inSection:", a1[4], a1[5], a1[6]);

}

void __71__MPSectionedIdentifierList_dataSourceInsertItems_afterItem_inSection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_itemEntry:sectionIdentifier:withExclusiveAccessToken:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_dataSourceInsertItems:fromSection:afterEntry:withExclusiveAccessToken:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), v3, v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_sectionHeadEntryMapWithExclusiveAccessToken:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastItemEntry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v3)
  {
    objc_msgSend(v4, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_sectionHeadEntryMapWithExclusiveAccessToken:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLastItemEntry:", v8);

  }
}

void __71__MPSectionedIdentifierList_dataSourceInsertItems_afterItem_inSection___block_invoke_2(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 80));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "sectionedIdentifierList:dataSourceDidAddItems:toSection:", a1[4], a1[5], a1[6]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "sectionedIdentifierList:dataSourceDidChangeItems:inSection:", a1[4], a1[5], a1[6]);

}

void __67__MPSectionedIdentifierList_dataSourceInsertItemsAtHead_inSection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_sectionHeadEntryMapWithExclusiveAccessToken:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("MPSectionedIdentifierList.m"), 726, CFSTR("Could not find head entry for section identifier: %@"), *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 32), "_dataSourceInsertItems:fromSection:afterEntry:withExclusiveAccessToken:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v4, v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_sectionHeadEntryMapWithExclusiveAccessToken:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastItemEntry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v5, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_sectionHeadEntryMapWithExclusiveAccessToken:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLastItemEntry:", v9);

  }
}

void __67__MPSectionedIdentifierList_dataSourceInsertItemsAtHead_inSection___block_invoke_2(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 80));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "sectionedIdentifierList:dataSourceDidAddItems:toSection:", a1[4], a1[5], a1[6]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "sectionedIdentifierList:dataSourceDidChangeItems:inSection:", a1[4], a1[5], a1[6]);

}

void __52__MPSectionedIdentifierList_removeItem_fromSection___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_itemEntry:sectionIdentifier:withExclusiveAccessToken:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "latestUserClone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isRemoved") & 1) == 0)
    --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(v4, "setUserRemoved");
  v5 = os_log_create("com.apple.amp.mediaplayer", "SIL");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
    objc_msgSend(v4, "itemIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sectionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v6;
    v11 = 2114;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "[SIL:%{public}@] removeItem:%{public}@ fromSection:%{public}@ | removing [user removed]", (uint8_t *)&v9, 0x20u);

  }
}

void __69__MPSectionedIdentifierList_moveItem_fromSection_afterTailOfSection___block_invoke(uint64_t a1, void *a2)
{
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
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_sectionHeadEntryMapWithExclusiveAccessToken:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("MPSectionedIdentifierList.m"), 695, CFSTR("Could not head entry for section identifier: %@"), *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(v6, "tailEntry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("MPSectionedIdentifierList.m"), 697, CFSTR("Could not find tail entry for section identifier: %@"), *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 32), "_itemEntry:sectionIdentifier:withExclusiveAccessToken:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "latestUserClone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v9, "newClonedEntry");
  objc_msgSend(v10, "setUserCloned");
  objc_msgSend(v9, "setUserMoved");
  v11 = *(void **)(a1 + 32);
  v28[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_addBranchToEntry:entries:withExclusiveAccessToken:", v7, v12, v4);

  v13 = os_log_create("com.apple.amp.mediaplayer", "SIL");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
    objc_msgSend(v9, "itemIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sectionIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    v21 = v14;
    v22 = 2114;
    v23 = v15;
    v24 = 2114;
    v25 = v16;
    v26 = 2114;
    v27 = v17;
    _os_log_impl(&dword_193B9B000, v13, OS_LOG_TYPE_DEFAULT, "[SIL:%{public}@] moveItem:%{public}@ fromSection:%{public}@ afterTailOfSection:%{public}@ | moving [user moved]", buf, 0x2Au);

  }
}

void __70__MPSectionedIdentifierList_moveItem_fromSection_afterItem_inSection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = a2;
  objc_msgSend(v3, "_itemEntry:sectionIdentifier:withExclusiveAccessToken:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "latestUserClone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_itemEntry:sectionIdentifier:withExclusiveAccessToken:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "latestUserClone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v10, "newClonedEntry");
  objc_msgSend(v11, "setUserCloned");
  objc_msgSend(v10, "setUserMoved");
  v12 = *(void **)(a1 + 32);
  v30[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_addBranchToEntry:entries:withExclusiveAccessToken:", v8, v13, v6);

  v14 = os_log_create("com.apple.amp.mediaplayer", "SIL");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
    objc_msgSend(v10, "itemIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sectionIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sectionIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138544386;
    v21 = v15;
    v22 = 2114;
    v23 = v16;
    v24 = 2114;
    v25 = v17;
    v26 = 2114;
    v27 = v18;
    v28 = 2114;
    v29 = v19;
    _os_log_impl(&dword_193B9B000, v14, OS_LOG_TYPE_DEFAULT, "[SIL:%{public}@] moveItem:%{public}@ fromSection:%{public}@ afterItem:%{public}@ inSection:%{public}@ | moving [user moved]", (uint8_t *)&v20, 0x34u);

  }
}

void __69__MPSectionedIdentifierList_moveItem_fromSection_afterHeadOfSection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_sectionHeadEntryMapWithExclusiveAccessToken:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("MPSectionedIdentifierList.m"), 669, CFSTR("Could not find head entry for section identifier: %@"), *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 32), "_itemEntry:sectionIdentifier:withExclusiveAccessToken:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "latestUserClone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v8, "newClonedEntry");
  objc_msgSend(v9, "setUserCloned");
  objc_msgSend(v8, "setUserMoved");
  v10 = *(void **)(a1 + 32);
  v26[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_addBranchToEntry:entries:withExclusiveAccessToken:", v6, v11, v4);

  v12 = os_log_create("com.apple.amp.mediaplayer", "SIL");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
    objc_msgSend(v8, "itemIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sectionIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    v19 = v13;
    v20 = 2114;
    v21 = v14;
    v22 = 2114;
    v23 = v15;
    v24 = 2114;
    v25 = v16;
    _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_DEFAULT, "[SIL:%{public}@] moveItem:%{public}@ fromSection:%{public}@ afterHeadOfSection:%{public}@ | moving [user moved]", buf, 0x2Au);

  }
}

void __55__MPSectionedIdentifierList_moveItemToEnd_fromSection___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = a2;
  objc_msgSend(v3, "_itemEntry:sectionIdentifier:withExclusiveAccessToken:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "latestUserClone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v8, "newClonedEntry");
  objc_msgSend(v9, "setUserCloned");
  objc_msgSend(v8, "setUserMoved");
  v10 = (void *)a1[4];
  objc_msgSend(v10, "_endEntryWithExclusiveAccessToken:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_addBranchToEntry:entries:withExclusiveAccessToken:", v11, v12, v6);

  v13 = os_log_create("com.apple.amp.mediaplayer", "SIL");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1[4] + 72);
    objc_msgSend(v8, "itemIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sectionIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = v14;
    v19 = 2114;
    v20 = v15;
    v21 = 2114;
    v22 = v16;
    _os_log_impl(&dword_193B9B000, v13, OS_LOG_TYPE_DEFAULT, "[SIL:%{public}@] moveItemToEnd:%{public}@ fromSection:%{public}@ | moving [user moved]", (uint8_t *)&v17, 0x20u);

  }
}

void __57__MPSectionedIdentifierList_moveItemToStart_fromSection___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = a2;
  objc_msgSend(v3, "_itemEntry:sectionIdentifier:withExclusiveAccessToken:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "latestUserClone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v8, "newClonedEntry");
  objc_msgSend(v9, "setUserCloned");
  objc_msgSend(v8, "setUserMoved");
  v10 = (void *)a1[4];
  v22[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_addBranchToEntry:entries:withExclusiveAccessToken:", 0, v11, v6);

  v12 = os_log_create("com.apple.amp.mediaplayer", "SIL");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(a1[4] + 72);
    objc_msgSend(v8, "itemIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sectionIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543874;
    v17 = v13;
    v18 = 2114;
    v19 = v14;
    v20 = 2114;
    v21 = v15;
    _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_DEFAULT, "[SIL:%{public}@] moveItemToStart:%{public}@ fromSection:%{public}@ | moving [user moved]", (uint8_t *)&v16, 0x20u);

  }
}

id __75__MPSectionedIdentifierList_firstSectionMatching_containingItem_inSection___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "_itemEntry:sectionIdentifier:withExclusiveAccessToken:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("MPSectionedIdentifierList.m"), 585, CFSTR("No item exists at %@:%@"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    v5 = objc_msgSend(v3, "entryType");
    if (v5 == 4)
    {
      objc_msgSend(v3, "sectionIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v6);
LABEL_10:

      goto LABEL_11;
    }
    if (v5 == 2)
      break;
LABEL_11:
    objc_msgSend(v3, "previousEntry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v6;
    if (!v6)
      goto LABEL_12;
  }
  objc_msgSend(v3, "sectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", v6) & 1) != 0
    || !(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 56) + 16))())
  {
    goto LABEL_10;
  }

LABEL_12:
  return v6;
}

id __54__MPSectionedIdentifierList_orderedSectionIdentifiers__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
}

uint64_t __67__MPSectionedIdentifierList_addDataSourceAtEnd_section_completion___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = a2;
  objc_msgSend(v3, "_endEntryWithExclusiveAccessToken:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_insertDataSource:forSection:afterEntry:withExclusiveAccessToken:", v4, v5, v7, v6);

  return objc_msgSend(*(id *)(a1[4] + 56), "addObject:", a1[6]);
}

void __82__MPSectionedIdentifierList_addDataSource_section_beforeTailOfSection_completion___block_invoke(uint64_t a1, void *a2)
{
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
  void *v13;
  id v14;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_sectionHeadEntryMapWithExclusiveAccessToken:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("MPSectionedIdentifierList.m"), 551, CFSTR("Could not head entry for section identifier: %@"), *(_QWORD *)(a1 + 40));

    v6 = 0;
  }
  objc_msgSend(v6, "tailEntry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previousEntry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("MPSectionedIdentifierList.m"), 553, CFSTR("Could not find tail's previous entry for section identifier: %@"), *(_QWORD *)(a1 + 40));

  }
  v9 = *(void **)(a1 + 32);
  +[MPSectionedIdentifierListPosition positionForTailOfSection:](MPSectionedIdentifierListPosition, "positionForTailOfSection:", *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_firstSectionIDBeforePosition:withExclusiveAccessToken:", v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "insertObject:atIndex:", *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "indexOfObject:", v11) + 1);
  objc_msgSend(*(id *)(a1 + 32), "_insertDataSource:forSection:afterEntry:withExclusiveAccessToken:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), v8, v4);

}

void __81__MPSectionedIdentifierList_addDataSource_section_afterTailOfSection_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_sectionHeadEntryMapWithExclusiveAccessToken:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("MPSectionedIdentifierList.m"), 539, CFSTR("Could not head entry for section identifier: %@"), *(_QWORD *)(a1 + 40));

    v6 = 0;
  }
  objc_msgSend(v6, "tailEntry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("MPSectionedIdentifierList.m"), 541, CFSTR("Could not find tail entry for section identifier: %@"), *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "insertObject:atIndex:", *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "indexOfObject:", *(_QWORD *)(a1 + 40)) + 1);
  objc_msgSend(*(id *)(a1 + 32), "_insertDataSource:forSection:afterEntry:withExclusiveAccessToken:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), v7, v4);

}

void __82__MPSectionedIdentifierList_addDataSource_section_afterItem_inSection_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = a2;
  objc_msgSend(v3, "_itemEntry:sectionIdentifier:withExclusiveAccessToken:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "latestUserClone");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("MPSectionedIdentifierList.m"), 528, CFSTR("Could not find item entry for identifier: %@"), *(_QWORD *)(a1 + 40));

  }
  v8 = *(void **)(a1 + 32);
  +[MPSectionedIdentifierListPosition positionForItem:inSection:](MPSectionedIdentifierListPosition, "positionForItem:inSection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_firstSectionIDBeforePosition:withExclusiveAccessToken:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "insertObject:atIndex:", *(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "indexOfObject:", v10) + 1);
  objc_msgSend(*(id *)(a1 + 32), "_insertDataSource:forSection:afterEntry:withExclusiveAccessToken:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), v12, v6);

}

void __81__MPSectionedIdentifierList_addDataSource_section_afterHeadOfSection_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_sectionHeadEntryMapWithExclusiveAccessToken:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("MPSectionedIdentifierList.m"), 486, CFSTR("Could not find head entry for section identifier: %@"), *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "insertObject:atIndex:", *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "indexOfObject:", *(_QWORD *)(a1 + 40)) + 1);
  objc_msgSend(*(id *)(a1 + 32), "_insertDataSource:forSection:afterEntry:withExclusiveAccessToken:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), v7, v4);

}

void __69__MPSectionedIdentifierList_addDataSourceAtStart_section_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v5 = a2;
  objc_msgSend(v4, "insertObject:atIndex:", v3, 0);
  objc_msgSend(*(id *)(a1 + 32), "_insertDataSource:forSection:afterEntry:withExclusiveAccessToken:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0, v5);

}

void __72__MPSectionedIdentifierList_performWithExclusiveAccessAndReturnInteger___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  id v3;

  v2 = a1[5];
  +[MPDispatchQueueExclusiveAccessToken tokenWithQueue:owner:](MPDispatchQueueExclusiveAccessToken, "tokenWithQueue:owner:", *(_QWORD *)(a1[4] + 16));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = (*(uint64_t (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __69__MPSectionedIdentifierList_performWithExclusiveAccessAndReturnBOOL___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  id v3;

  v2 = a1[5];
  +[MPDispatchQueueExclusiveAccessToken tokenWithQueue:owner:](MPDispatchQueueExclusiveAccessToken, "tokenWithQueue:owner:", *(_QWORD *)(a1[4] + 16));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = (*(uint64_t (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __69__MPSectionedIdentifierList_replaceDataSource_forSection_completion___block_invoke_43(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "Default");
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SIL-Replace-Reload", (const char *)&unk_193F291C9, buf, 2u);
  }

  v7 = os_log_create("com.apple.amp.mediaplayer", "Default");
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 40);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SIL-Replace", (const char *)&unk_193F291C9, v10, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__MPSectionedIdentifierList__encodeEntry_withExclusiveAccessToken___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;

  v11 = a2;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v11);
    objc_msgSend(*(id *)(a1 + 40), "_encodeEntry:withExclusiveAccessToken:", v11, *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);

    v7 = *(void **)(a1 + 32);
    v8 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v7, "addObject:", v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = v11;
    v5 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
  }

}

uint64_t __45__MPSectionedIdentifierList_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "encodeWithCoder:withExclusiveAccessToken:", *(_QWORD *)(a1 + 40), a2);
}

_MPSectionedIdentifierListCloneIndexEntry *__69__MPSectionedIdentifierList__stitchPreviousEntry_toEntry_cloneIndex___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  _MPSectionedIdentifierListCloneIndexEntry *v5;

  objc_msgSend(MEMORY[0x1E0D4D0B8], "pairWithFirst:second:", a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v5 = (_MPSectionedIdentifierListCloneIndexEntry *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(_MPSectionedIdentifierListCloneIndexEntry);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v4);
  }

  return v5;
}

void __43__MPSectionedIdentifierList_initWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "clonedEntries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("positionKey"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingDescriptors:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v6, "rootEntry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClonedEntries:", v11);

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v17);
        objc_msgSend(v6, "rootEntry", (_QWORD)v27);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setRootEntry:", v19);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v15);
  }

  objc_msgSend(v6, "rootEntry");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "latestDataSourceClone");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(v5, "first");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "identifiersItemEntryMap");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "second");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v21, v26);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)_performWithoutRequiringExclusivity:(id)a3
{
  uint64_t v3;
  void (**v4)(_QWORD);
  pthread_key_t v5;

  v3 = _MPSectionIdentifierListExclusivityDisabledPThreadKey_sOnceToken;
  v4 = (void (**)(_QWORD))a3;
  if (v3 != -1)
    dispatch_once(&_MPSectionIdentifierListExclusivityDisabledPThreadKey_sOnceToken, &__block_literal_global_38628);
  v5 = _MPSectionIdentifierListExclusivityDisabledPThreadKey_sThreadKey;
  pthread_setspecific(_MPSectionIdentifierListExclusivityDisabledPThreadKey_sThreadKey, (const void *)1);
  v4[2](v4);

  pthread_setspecific(v5, 0);
}

@end
