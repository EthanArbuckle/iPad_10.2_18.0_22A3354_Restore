@implementation CNAggregateContactStore

uint64_t __78__CNAggregateContactStore_unifiedContactsMatchingPredicate_keysToFetch_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)unifiedContactsMatchingPredicate:(id)a3 keysToFetch:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  id (*v27)(uint64_t, void *, uint64_t);
  void *v28;
  id v29;
  id v30;
  CNAggregateContactStore *v31;
  _QWORD v32[5];
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  +[CNAPITriageLogger setThreadEntryPoint:](CNAPITriageLogger, "setThreadEntryPoint:", a2);
  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);

  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Fetching", ", buf, 2u);
  }

  v15 = objc_alloc_init(MEMORY[0x1E0D13B88]);
  v16 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __78__CNAggregateContactStore_unifiedContactsMatchingPredicate_keysToFetch_error___block_invoke;
  v32[3] = &__block_descriptor_40_e5_v8__0l;
  v32[4] = v12;
  v17 = (void *)objc_msgSend(v32, "copy");
  objc_opt_self();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = _Block_copy(v18);
  objc_msgSend(v15, "push:", v19);

  v25 = v16;
  v26 = 3221225472;
  v27 = __78__CNAggregateContactStore_unifiedContactsMatchingPredicate_keysToFetch_error___block_invoke_24;
  v28 = &unk_1E29F80F8;
  v29 = v9;
  v20 = v10;
  v30 = v20;
  v31 = self;
  -[CNAggregateContactStore _allStoreResultsWithError:withBlock:](self, "_allStoreResultsWithError:withBlock:", a5, &v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAggregateContactStore _unifiedContactsFromContacts:unifyContactsFromMainStore:keysToFetch:error:](self, "_unifiedContactsFromContacts:unifyContactsFromMainStore:keysToFetch:error:", v21, 1, v20, a5, v25, v26, v27, v28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "popAllWithHandler:", &__block_literal_global_27);
  v23 = (id)objc_opt_self();

  return v22;
}

- (id)_allStoreResultsWithError:(id *)a3 withBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  v23 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__CNAggregateContactStore__allStoreResultsWithError_withBlock___block_invoke;
  v14[3] = &unk_1E29F80A8;
  v8 = v6;
  v16 = v8;
  v17 = &v18;
  v9 = v7;
  v15 = v9;
  -[CNAggregateContactStore _enumerateStoresUsingBlock:](self, "_enumerateStoresUsingBlock:", v14);
  v10 = (void *)v19[5];
  if (v10 && a3)
    *a3 = objc_retainAutorelease(v10);
  v11 = v15;
  v12 = v9;

  _Block_object_dispose(&v18, 8);
  return v12;
}

- (void)_enumerateStoresUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, char *);
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, char *))a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_contactStores;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v5);
      v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
      v11 = 0;
      v4[2](v4, v10, &v11);
      if (v11)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

void __63__CNAggregateContactStore__allStoreResultsWithError_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id obj;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v2 + 40);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v2 + 40), obj);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) && objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v3);

}

void __90__CNAggregateContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v10);
  if (*(_BYTE *)(a1 + 56))
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v10, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
  if (v5)
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v10, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, v9);

  }
}

- (id)_unifiedContactsFromContacts:(id)a3 unifyContactsFromMainStore:(BOOL)a4 keysToFetch:(id)a5 error:(id *)a6
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  CNContactFetchRequest *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v47;
  id v50;
  id obj;
  void *v52;
  id v53;
  _BOOL4 v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[5];
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  void *v82;
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v54 = a4;
  v86 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v50 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v78;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v78 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, v13);

        if (objc_msgSend(v12, "isUnified"))
        {
          v75 = 0u;
          v76 = 0u;
          v73 = 0u;
          v74 = 0u;
          objc_msgSend(v12, "linkedContacts");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
          if (v15)
          {
            v16 = *(_QWORD *)v74;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v74 != v16)
                  objc_enumerationMutation(v14);
                objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * j), "identifier");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, v18);

              }
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
            }
            while (v15);
          }

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", obj);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend(v47, "mutableCopy");
  v19 = objc_msgSend(v47, "count");
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  objc_msgSend(v47, "reverseObjectEnumerator");
  v53 = (id)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
  if (v56)
  {
    v55 = *(_QWORD *)v70;
    do
    {
      for (k = 0; k != v56; ++k)
      {
        if (*(_QWORD *)v70 != v55)
          objc_enumerationMutation(v53);
        v21 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * k);
        objc_msgSend(v21, "storeIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22 == 0;

        --v19;
        if (!v23)
        {
          objc_msgSend(v21, "storeInfo");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("CNContactMainStoreLinkedIdentifier"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            objc_msgSend(v8, "objectForKeyedSubscript:", v25);
            v26 = objc_claimAutoreleasedReturnValue();
            v27 = (id)v26;
            if (v26)
              goto LABEL_29;
            if (v54)
            {
              -[CNAggregateContactStore mainStore](self, "mainStore");
              v28 = (CNContactFetchRequest *)objc_claimAutoreleasedReturnValue();
              -[CNContactFetchRequest unifiedContactWithIdentifier:keysToFetch:error:](v28, "unifiedContactWithIdentifier:keysToFetch:error:", v25, v50, a6);
              v27 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v28 = -[CNContactFetchRequest initWithKeysToFetch:]([CNContactFetchRequest alloc], "initWithKeysToFetch:", v50);
              -[CNContactFetchRequest setUnifyResults:](v28, "setUnifyResults:", 0);
              v82 = v25;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              +[CNContact predicateForContactsWithIdentifiers:](CNContact, "predicateForContactsWithIdentifiers:", v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[CNContactFetchRequest setPredicate:](v28, "setPredicate:", v30);

              v63 = 0;
              v64 = &v63;
              v65 = 0x3032000000;
              v66 = __Block_byref_object_copy__2;
              v67 = __Block_byref_object_dispose__2;
              v68 = 0;
              -[CNAggregateContactStore mainStore](self, "mainStore");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v62[0] = MEMORY[0x1E0C809B0];
              v62[1] = 3221225472;
              v62[2] = 0x18F914000;
              v62[3] = &unk_1E29F80D0;
              v62[4] = &v63;
              objc_msgSend(v31, "enumerateContactsWithFetchRequest:error:usingBlock:", v28, a6, v62);

              v27 = (id)v64[5];
              _Block_object_dispose(&v63, 8);

            }
            if (v27)
            {
LABEL_29:
              objc_msgSend(v27, "identifier");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "objectForKeyedSubscript:", v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v33)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v27, "isUnified"))
                {
                  objc_msgSend(v27, "linkedContacts");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "addObjectsFromArray:", v34);

                }
                else
                {
                  objc_msgSend(v33, "addObject:", v27);
                }
                objc_msgSend(v57, "setObject:forKeyedSubscript:", v33, v32);
              }
              objc_msgSend(v33, "addObject:", v21);
              objc_msgSend(v52, "removeObjectAtIndex:", v19);
              if (!v26)
                objc_msgSend(v52, "addObject:", v27);

            }
          }

        }
      }
      v56 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
    }
    while (v56);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v52, "count"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v36 = v52;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v58, v81, 16);
  if (v37)
  {
    v38 = *(_QWORD *)v59;
    do
    {
      for (m = 0; m != v37; ++m)
      {
        if (*(_QWORD *)v59 != v38)
          objc_enumerationMutation(v36);
        v40 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * m);
        objc_msgSend(v40, "identifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v40;
        objc_msgSend(v57, "objectForKeyedSubscript:", v41);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (v43)
        {
          +[CN contactUnifyingContacts:includingMainStoreContacts:allowMutableContactFreeze:](CN, "contactUnifyingContacts:includingMainStoreContacts:allowMutableContactFreeze:", v43, v54, 1);
          v44 = objc_claimAutoreleasedReturnValue();

          v42 = (id)v44;
        }
        objc_msgSend(v35, "addObject:", v42);

      }
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v58, v81, 16);
    }
    while (v37);
  }

  -[CNAggregateContactStore applyPostFetchDecoratorsToContacts:keysToFetch:unifyContactsFromMainStore:](self, "applyPostFetchDecoratorsToContacts:keysToFetch:unifyContactsFromMainStore:", v35, v50, v54);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  return v45;
}

- (id)applyPostFetchDecoratorsToContacts:(id)a3 keysToFetch:(id)a4 unifyContactsFromMainStore:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = *MEMORY[0x1E0D137F8];
  -[CNAggregateContactStore postFetchDecoratorBlocks](self, "postFetchDecoratorBlocks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = (*(uint64_t (**)(uint64_t, void *))(v10 + 16))(v10, v11);

  if ((_DWORD)v10)
  {
    v12 = v8;
  }
  else
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__2;
    v23 = __Block_byref_object_dispose__2;
    v24 = v8;
    -[CNAggregateContactStore postFetchDecoratorBlocks](self, "postFetchDecoratorBlocks");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __101__CNAggregateContactStore_applyPostFetchDecoratorsToContacts_keysToFetch_unifyContactsFromMainStore___block_invoke;
    v15[3] = &unk_1E29F8390;
    v17 = &v19;
    v16 = v9;
    v18 = a5;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v15);

    v12 = (id)v20[5];
    _Block_object_dispose(&v19, 8);

  }
  return v12;
}

- (NSArray)postFetchDecoratorBlocks
{
  return self->_postFetchDecoratorBlocks;
}

- (void)didFetchContacts:(id)a3 forPredicate:(id)a4 fromStore:(id)a5 unifiedFetch:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;

  v6 = a6;
  v16 = a3;
  v10 = a4;
  v11 = a5;
  -[CNAggregateContactStore mainStore](self, "mainStore");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v11)
  {
    objc_opt_class();
    v13 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    objc_msgSend(v15, "mainStoreDidFetchContacts:unifiedFetch:", v16, v6);
  }

}

- (CNContactStore)mainStore
{
  CNContactStore **p_mainStore;
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_mainStore = &self->_mainStore;
  if (!self->_mainStore)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = self->_contactStores;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          objc_msgSend((id)objc_opt_class(), "storeIdentifier", (_QWORD)v11);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v9)
          {
            objc_storeStrong((id *)p_mainStore, v8);
            goto LABEL_12;
          }
        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return *p_mainStore;
}

uint64_t __61__CNAggregateContactStore_containersMatchingPredicate_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "containersMatchingPredicate:error:", *(_QWORD *)(a1 + 32), a3);
}

void __101__CNAggregateContactStore_applyPostFetchDecoratorsToContacts_keysToFetch_unifyContactsFromMainStore___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

id __63__CNAggregateContactStore_initWithContactStores_configuration___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v6;
  id v7;
  CNContactStoreContactsFetchResultSharedAvatarDecorator *v8;
  void *v9;

  v6 = a3;
  v7 = a2;
  v8 = -[CNContactStoreContactsFetchResultSharedAvatarDecorator initWithContacts:keysToFetch:unifyContactsFromMainStore:]([CNContactStoreContactsFetchResultSharedAvatarDecorator alloc], "initWithContacts:keysToFetch:unifyContactsFromMainStore:", v7, v6, a4);

  -[CNContactStoreContactsFetchResultSharedAvatarDecorator decoratedValue](v8, "decoratedValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)hasGroups
{
  void *v2;
  char v3;

  -[CNAggregateContactStore contactStores](self, "contactStores");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_cn_any:", &__block_literal_global_4_0);

  return v3;
}

- (id)unifiedContactCountWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CNAggregateContactStore contactStores](self, "contactStores", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v4);
      objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "unifiedContactCountWithError:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
        break;
      v11 = v10;
      v7 += objc_msgSend(v10, "unsignedIntegerValue");

      if (v6 == ++v9)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_11;
      }
    }
  }
  v7 = 0;
LABEL_11:

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)XPCDataMapperStore
{
  void *v2;
  void *v3;

  -[CNAggregateContactStore contactStores](self, "contactStores");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_firstObjectPassingTest:", &__block_literal_global_144);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)meContactIdentifiers:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  -[CNAggregateContactStore contactStores](self, "contactStores");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13A18], "eitherWithLeft:", MEMORY[0x1E0C9AA60]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_reduce:initialValue:", &__block_literal_global_34, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13748] + 16))())
  {
    objc_msgSend(v7, "left");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "right");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a3)
      *a3 = objc_retainAutorelease(v9);

    v8 = 0;
  }

  return v8;
}

- (NSArray)contactStores
{
  return self->_contactStores;
}

id __48__CNAggregateContactStore_meContactIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v14;

  v4 = a2;
  v5 = a3;
  if ((objc_msgSend(v4, "isLeft") & 1) != 0)
  {
    v14 = 0;
    objc_msgSend(v5, "meContactIdentifiers:", &v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14;
    v8 = v7;
    if (v7 && (CNIsErrorWithCode(v7, 200) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D13A18], "eitherWithRight:", v8);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0D13A18];
      objc_msgSend(v4, "left");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "eitherWithLeft:", v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v12 = v4;
  }

  return v12;
}

void __78__CNAggregateContactStore_unifiedContactsMatchingPredicate_keysToFetch_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  +[CNAPITriageLogger setThreadEntryPoint:](CNAPITriageLogger, "setThreadEntryPoint:", 0);
  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Fetching", ", v5, 2u);
  }

}

void __90__CNAggregateContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_4(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = (void *)a1[4];
  objc_msgSend(v6, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13830] + 16))() & 1) != 0)
    (*(void (**)(void))(a1[5] + 16))();
  else
    ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);

}

- (CNAggregateContactStore)initWithContactStores:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  CNAggregateContactStore *v8;
  CNAggregateContactStore *v9;
  CNAggregateContactStore *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CNAggregateContactStore;
  v8 = -[CNContactStore init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[CNAggregateContactStore setContactStores:](v8, "setContactStores:", v6);
    -[CNAggregateContactStore setPostFetchDecoratorBlocks:](v9, "setPostFetchDecoratorBlocks:", MEMORY[0x1E0C9AA60]);
    if (objc_msgSend(v7, "includeSharedPhotoContacts"))
      -[CNAggregateContactStore addPostFetchDecorator:](v9, "addPostFetchDecorator:", &__block_literal_global_6);
    v10 = v9;
  }

  return v9;
}

- (void)setContactStores:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)addPostFetchDecorator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CNAggregateContactStore postFetchDecoratorBlocks](self, "postFetchDecoratorBlocks");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = _Block_copy(v5);
  objc_msgSend(v8, "arrayByAddingObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAggregateContactStore setPostFetchDecoratorBlocks:](self, "setPostFetchDecoratorBlocks:", v7);

}

- (void)setPostFetchDecoratorBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_postFetchDecoratorBlocks, a3);
}

- (id)currentHistoryAnchor
{
  void *v2;
  void *v3;

  -[CNAggregateContactStore mainStore](self, "mainStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentHistoryAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)currentHistoryToken
{
  void *v2;
  void *v3;

  -[CNAggregateContactStore mainStore](self, "mainStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentHistoryToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __90__CNAggregateContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  id v18;
  uint64_t *v19;
  BOOL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = a2;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32) == (_QWORD)v5;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __90__CNAggregateContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_3;
  v16 = &unk_1E29F81B0;
  v19 = &v21;
  v20 = v7;
  v17 = *(id *)(a1 + 48);
  v18 = *(id *)(a1 + 56);
  LOBYTE(a3) = objc_msgSend(v5, "enumerateContactsAndMatchInfoWithFetchRequest:error:usingBlock:", v6, a3, &v13);
  v8 = *(void **)(a1 + 64);
  v9 = v22[5];
  objc_msgSend(*(id *)(a1 + 40), "predicate", v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didFetchContacts:forPredicate:fromStore:unifiedFetch:", v9, v10, v5, objc_msgSend(*(id *)(a1 + 40), "unifyResults"));

  if ((a3 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
  v11 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v11;
}

- (BOOL)enumerateContactsAndMatchInfoWithFetchRequest:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t v21;
  void *v22;
  void *v23;
  void *v24;
  id *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  BOOL v34;
  id v35;
  id v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  id v52;
  CNAggregateContactStore *v53;
  uint8_t *v54;
  id v55;
  _QWORD v56[5];
  id v57;
  id v58;
  uint8_t buf[8];
  uint8_t *v60;
  uint64_t v61;
  char v62;
  _QWORD v63[6];

  v9 = a3;
  v10 = a5;
  +[CNAPITriageLogger setThreadEntryPoint:](CNAPITriageLogger, "setThreadEntryPoint:", a2);
  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);

  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Fetching", ", buf, 2u);
  }

  v15 = objc_alloc_init(MEMORY[0x1E0D13B88]);
  v16 = MEMORY[0x1E0C809B0];
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __90__CNAggregateContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke;
  v63[3] = &__block_descriptor_40_e5_v8__0l;
  v63[4] = v12;
  v17 = (void *)objc_msgSend(v63, "copy");
  objc_opt_self();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = _Block_copy(v18);
  objc_msgSend(v15, "push:", v19);

  *(_QWORD *)buf = 0;
  v60 = buf;
  v61 = 0x2020000000;
  v62 = 1;
  if (objc_msgSend(v9, "onlyMainStore"))
  {
    -[CNAggregateContactStore mainStore](self, "mainStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v16;
    v56[1] = 3221225472;
    v56[2] = __90__CNAggregateContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_35;
    v56[3] = &unk_1E29F8188;
    v56[4] = self;
    v57 = v9;
    v58 = v10;
    v21 = objc_msgSend(v20, "enumerateContactsAndMatchInfoWithFetchRequest:error:usingBlock:", v57, a4, v56);
    v60[24] = v21;

    v22 = v57;
  }
  else
  {
    v38 = v10;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = a4;
    -[CNAggregateContactStore mainStore](self, "mainStore");
    v55 = 0;
    v48[0] = v16;
    v48[1] = 3221225472;
    v48[2] = __90__CNAggregateContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_2;
    v48[3] = &unk_1E29F81D8;
    v37 = (id)objc_claimAutoreleasedReturnValue();
    v49 = v37;
    v26 = v9;
    v50 = v26;
    v27 = v24;
    v51 = v27;
    v28 = v23;
    v52 = v28;
    v53 = self;
    v54 = buf;
    -[CNAggregateContactStore _allStoreResultsWithError:withBlock:](self, "_allStoreResultsWithError:withBlock:", &v55, v48);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v55;
    if (v60[24])
    {
      v30 = objc_msgSend(v26, "unifyResults");
      objc_msgSend(v26, "keysToFetch");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAggregateContactStore _unifiedContactsFromContacts:unifyContactsFromMainStore:keysToFetch:error:](self, "_unifiedContactsFromContacts:unifyContactsFromMainStore:keysToFetch:error:", v29, v30, v31, v25);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v44 = 0;
      v45 = &v44;
      v46 = 0x2020000000;
      v47 = 0;
      v40[0] = v16;
      v40[1] = 3221225472;
      v40[2] = __90__CNAggregateContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_4;
      v40[3] = &unk_1E29F8200;
      v41 = v28;
      v43 = &v44;
      v10 = v38;
      v42 = v38;
      objc_msgSend(v32, "enumerateObjectsUsingBlock:", v40);
      if (v45[3])
      {
        v33 = os_log_create("com.apple.contacts", "data-access-error");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          -[CNAggregateContactStore enumerateContactsAndMatchInfoWithFetchRequest:error:usingBlock:].cold.1(v33);

        v60[24] = 0;
        if (v25)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNErrorDomain"), 2, 0);
          *v25 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(MEMORY[0x1E0D13B78], "simulateCrashWithMessage:", CFSTR("enumerateContactsAndMatchInfoWithFetchRequest encountered NSNull %lu times where %lu CNContact objects where expcted"), v45[3], objc_msgSend(v32, "count"), v37);
      }

      _Block_object_dispose(&v44, 8);
    }
    else
    {
      if (v25)
        *v25 = objc_retainAutorelease(v39);
      v32 = v29;
    }

    v22 = v39;
  }

  v34 = v60[24] != 0;
  _Block_object_dispose(buf, 8);
  objc_msgSend(v15, "popAllWithHandler:", &__block_literal_global_44);
  v35 = (id)objc_opt_self();

  return v34;
}

void __90__CNAggregateContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  +[CNAPITriageLogger setThreadEntryPoint:](CNAPITriageLogger, "setThreadEntryPoint:", 0);
  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Fetching", ", v5, 2u);
  }

}

uint64_t __36__CNAggregateContactStore_hasGroups__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasGroups");
}

BOOL __56__CNAggregateContactStore_Favorites__XPCDataMapperStore__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNContactStore isXPCDataMapperStoreForFavorites:](CNContactStore, "isXPCDataMapperStoreForFavorites:", a2);
}

uint64_t __54__CNAggregateContactStore_requestAccessForEntityType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "requestAccessForEntityType:", *(_QWORD *)(a1 + 32));
}

uint64_t __54__CNAggregateContactStore_requestAccessForEntityType___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", MEMORY[0x1E0C9AAB0]);
}

uint64_t __88__CNAggregateContactStore_enumerateNonUnifiedContactsWithFetchRequest_error_usingBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __88__CNAggregateContactStore_enumerateNonUnifiedContactsWithFetchRequest_error_usingBlock___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  char v11;

  v11 = 0;
  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = a2;
  objc_msgSend(v6, "keysToFetch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applyPostFetchDecoratorsToContact:keysToFetch:unifyContactsFromMainStore:", v7, v8, objc_msgSend(*(id *)(a1 + 40), "unifyResults"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v10 = v11;
  *a3 = v11;
  **(_BYTE **)(a1 + 56) = v10;

}

- (id)applyPostFetchDecoratorsToContact:(id)a3 keysToFetch:(id)a4 unifyContactsFromMainStore:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  uint64_t v16;

  v5 = a5;
  v16 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAggregateContactStore applyPostFetchDecoratorsToContacts:keysToFetch:unifyContactsFromMainStore:](self, "applyPostFetchDecoratorsToContacts:keysToFetch:unifyContactsFromMainStore:", v11, v9, v5, v15, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postFetchDecoratorBlocks, 0);
  objc_storeStrong((id *)&self->_contactStoreForMatchingDictionaryWork, 0);
  objc_storeStrong((id *)&self->_contactStores, 0);
  objc_storeStrong((id *)&self->_mainStore, 0);
}

- (id)requestAccessForEntityType:(int64_t)a3
{
  NSArray *contactStores;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  contactStores = self->_contactStores;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__CNAggregateContactStore_requestAccessForEntityType___block_invoke;
  v8[3] = &__block_descriptor_40_e34___CNFuture_16__0__CNContactStore_8l;
  v8[4] = a3;
  -[NSArray _cn_map:](contactStores, "_cn_map:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13A68], "join:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flatMap:", &__block_literal_global_8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)contactWithUserActivityUserInfo:(id)a3 keysToFetch:(id)a4
{
  id v6;
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_contactStores;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "contactWithUserActivityUserInfo:keysToFetch:", v6, v7, (_QWORD)v16);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          goto LABEL_11;
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (id)userActivityUserInfoForContact:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_contactStores;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "userActivityUserInfoForContact:", v4, (_QWORD)v13);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)sectionListOffsetsForSortOrder:(int64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  -[CNAggregateContactStore mainStore](self, "mainStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionListOffsetsForSortOrder:error:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)policyWithDescription:(id)a3 error:(id *)a4
{
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->_contactStores;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "policyWithDescription:error:", v6, a4, (_QWORD)v15);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

void __88__CNAggregateContactStore_enumerateNonUnifiedContactsWithFetchRequest_error_usingBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  +[CNAPITriageLogger setThreadEntryPoint:](CNAPITriageLogger, "setThreadEntryPoint:", 0);
  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Fetching", ", v5, 2u);
  }

}

- (id)containersMatchingPredicate:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__CNAggregateContactStore_containersMatchingPredicate_error___block_invoke;
  v10[3] = &unk_1E29F8278;
  v11 = v6;
  v7 = v6;
  -[CNAggregateContactStore _allStoreResultsWithError:withBlock:](self, "_allStoreResultsWithError:withBlock:", a4, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)enumerateNonUnifiedContactsWithFetchRequest:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  id v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  CNAggregateContactStore *v30;
  id v31;
  uint64_t *v32;
  uint8_t *v33;
  uint8_t buf[8];
  uint8_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  _QWORD v44[6];

  v9 = a3;
  v10 = a5;
  +[CNAPITriageLogger setThreadEntryPoint:](CNAPITriageLogger, "setThreadEntryPoint:", a2);
  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);

  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Fetching", ", buf, 2u);
  }

  v15 = objc_alloc_init(MEMORY[0x1E0D13B88]);
  v16 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __88__CNAggregateContactStore_enumerateNonUnifiedContactsWithFetchRequest_error_usingBlock___block_invoke;
  v44[3] = &__block_descriptor_40_e5_v8__0l;
  v44[4] = v12;
  v17 = (void *)objc_msgSend(v44, "copy");
  objc_opt_self();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = _Block_copy(v18);
  objc_msgSend(v15, "push:", v19);

  if (objc_msgSend(v9, "unifyResults"))
  {
    v23 = (void *)MEMORY[0x1E0C99DA0];
    v24 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("Can't set -[CNContactFetchRequest unifyResults] to YES with %@"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v26, 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v27);
  }
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 1;
  *(_QWORD *)buf = 0;
  v35 = buf;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__2;
  v38 = __Block_byref_object_dispose__2;
  v39 = 0;
  v28[0] = v16;
  v28[1] = 3221225472;
  v28[2] = __88__CNAggregateContactStore_enumerateNonUnifiedContactsWithFetchRequest_error_usingBlock___block_invoke_49;
  v28[3] = &unk_1E29F8250;
  v32 = &v40;
  v33 = buf;
  v29 = v9;
  v30 = self;
  v31 = v10;
  -[CNAggregateContactStore _enumerateStoresUsingBlock:](self, "_enumerateStoresUsingBlock:", v28);
  v20 = *((_BYTE *)v41 + 24) != 0;
  if (a4 && !*((_BYTE *)v41 + 24))
    *a4 = objc_retainAutorelease(*((id *)v35 + 5));

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v40, 8);
  objc_msgSend(v15, "popAllWithHandler:", &__block_literal_global_50_0);
  v21 = (id)objc_opt_self();

  return v20;
}

- (CNAggregateContactStore)initWithContactStores:(id)a3
{
  return -[CNAggregateContactStore initWithContactStores:configuration:](self, "initWithContactStores:configuration:", a3, 0);
}

- (BOOL)store:(id)a3 supportsSelector:(SEL)a4
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a4);
  return v5 != +[CNContactStore instanceMethodForSelector:](CNContactStore, "instanceMethodForSelector:", a4);
}

- (BOOL)hasMultipleGroupsOrAccounts
{
  void *v2;
  char v3;

  -[CNAggregateContactStore contactStores](self, "contactStores");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_cn_any:", &__block_literal_global_3);

  return v3;
}

uint64_t __54__CNAggregateContactStore_hasMultipleGroupsOrAccounts__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasMultipleGroupsOrAccounts");
}

void __101__CNAggregateContactStore__unifiedContactsFromContacts_unifyContactsFromMainStore_keysToFetch_error___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v6;
  id *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v6 + 40);
  v7 = (id *)(v6 + 40);
  v8 = v9;
  if (v9)
  {
    *v7 = 0;

    *a3 = 1;
  }
  else
  {
    objc_storeStrong(v7, a2);
  }

}

- (id)contactCountForFetchRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[CNAggregateContactStore contactStores](self, "contactStores", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v18;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v11)
        objc_enumerationMutation(v7);
      objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "contactCountForFetchRequest:error:", v6, a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
        break;
      v14 = v13;
      v10 += objc_msgSend(v13, "unsignedIntegerValue");

      if (v9 == ++v12)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_11;
      }
    }
  }
  v10 = 0;
LABEL_11:

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __78__CNAggregateContactStore_unifiedContactsMatchingPredicate_keysToFetch_error___block_invoke_24(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a2;
  objc_msgSend(v7, "unifiedContactsMatchingPredicate:keysToFetch:error:", v5, v6, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "didFetchContacts:forPredicate:fromStore:unifiedFetch:", v8, *(_QWORD *)(a1 + 32), v7, 1);

  return v8;
}

- (id)_unifiedMeContactWithKeysToFetch:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v19;

  v6 = a3;
  -[CNAggregateContactStore contactStores](self, "contactStores");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_cn_map:", &__block_literal_global_30_0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_cn_filter:", *MEMORY[0x1E0D13748]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_cn_map:", *MEMORY[0x1E0D13758]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_cn_flatten");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNContact predicateForContactsWithIdentifiers:](CNContact, "predicateForContactsWithIdentifiers:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  -[CNAggregateContactStore unifiedContactsMatchingPredicate:keysToFetch:error:](self, "unifiedContactsMatchingPredicate:keysToFetch:error:", v12, v6, &v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v19;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D137F8] + 16))())
  {
    if (v14)
    {
      if (!a4)
        goto LABEL_9;
      goto LABEL_8;
    }
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 200, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
LABEL_8:
      v14 = objc_retainAutorelease(v14);
      v17 = 0;
      *a4 = v14;
      goto LABEL_10;
    }
LABEL_9:
    v17 = 0;
    goto LABEL_10;
  }
  v15 = *MEMORY[0x1E0D13830];
  objc_msgSend(v13, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = (*(uint64_t (**)(uint64_t, void *))(v15 + 16))(v15, v16);

  if (!(_DWORD)v15)
    goto LABEL_9;
  objc_msgSend(v13, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v17;
}

void __90__CNAggregateContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_35(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "keysToFetch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applyPostFetchDecoratorsToContact:keysToFetch:unifyContactsFromMainStore:", v8, v9, objc_msgSend(*(id *)(a1 + 40), "unifyResults"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __90__CNAggregateContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke_43(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __88__CNAggregateContactStore_enumerateNonUnifiedContactsWithFetchRequest_error_usingBlock___block_invoke_49(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  id v7;
  int8x16_t v8;
  _QWORD v9[4];
  int8x16_t v10;
  id v11;
  uint64_t v12;
  id v13;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v13 = *(id *)(v6 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __88__CNAggregateContactStore_enumerateNonUnifiedContactsWithFetchRequest_error_usingBlock___block_invoke_2;
  v9[3] = &unk_1E29F8228;
  v8 = *(int8x16_t *)(a1 + 32);
  v7 = (id)v8.i64[0];
  v10 = vextq_s8(v8, v8, 8uLL);
  v11 = *(id *)(a1 + 48);
  v12 = a3;
  LOBYTE(a3) = objc_msgSend(a2, "enumerateContactsWithFetchRequest:error:usingBlock:", v7, &v13, v9);
  objc_storeStrong((id *)(v6 + 40), v13);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3;

}

- (id)groupsMatchingPredicate:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__CNAggregateContactStore_groupsMatchingPredicate_error___block_invoke;
  v10[3] = &unk_1E29F8278;
  v11 = v6;
  v7 = v6;
  -[CNAggregateContactStore _allStoreResultsWithError:withBlock:](self, "_allStoreResultsWithError:withBlock:", a4, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __57__CNAggregateContactStore_groupsMatchingPredicate_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "groupsMatchingPredicate:error:", *(_QWORD *)(a1 + 32), a3);
}

- (id)groupWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->_contactStores;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "groupWithIdentifier:error:", v6, a4, (_QWORD)v15);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (id)membersOfGroupWithIdentifier:(id)a3 keysToFetch:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__CNAggregateContactStore_membersOfGroupWithIdentifier_keysToFetch_error___block_invoke;
  v14[3] = &unk_1E29F82A0;
  v15 = v8;
  v16 = v9;
  v10 = v9;
  v11 = v8;
  -[CNAggregateContactStore _allStoreResultsWithError:withBlock:](self, "_allStoreResultsWithError:withBlock:", a5, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __74__CNAggregateContactStore_membersOfGroupWithIdentifier_keysToFetch_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "membersOfGroupWithIdentifier:keysToFetch:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a3);
}

- (id)subgroupsOfGroupWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__CNAggregateContactStore_subgroupsOfGroupWithIdentifier_error___block_invoke;
  v10[3] = &unk_1E29F8278;
  v11 = v6;
  v7 = v6;
  -[CNAggregateContactStore _allStoreResultsWithError:withBlock:](self, "_allStoreResultsWithError:withBlock:", a4, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __64__CNAggregateContactStore_subgroupsOfGroupWithIdentifier_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "subgroupsOfGroupWithIdentifier:error:", *(_QWORD *)(a1 + 32), a3);
}

- (id)serverSearchContainersMatchingPredicate:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__CNAggregateContactStore_serverSearchContainersMatchingPredicate_error___block_invoke;
  v10[3] = &unk_1E29F8278;
  v11 = v6;
  v7 = v6;
  -[CNAggregateContactStore _allStoreResultsWithError:withBlock:](self, "_allStoreResultsWithError:withBlock:", a4, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __73__CNAggregateContactStore_serverSearchContainersMatchingPredicate_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "serverSearchContainersMatchingPredicate:error:", *(_QWORD *)(a1 + 32), a3);
}

- (id)defaultContainerIdentifier
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
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
  v2 = self->_contactStores;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "defaultContainerIdentifier", (_QWORD)v10);
        v7 = objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = (void *)v7;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (id)usedLabelsForPropertyWithKey:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__CNAggregateContactStore_usedLabelsForPropertyWithKey_error___block_invoke;
  v10[3] = &unk_1E29F8278;
  v11 = v6;
  v7 = v6;
  -[CNAggregateContactStore _allStoreResultsWithError:withBlock:](self, "_allStoreResultsWithError:withBlock:", a4, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __62__CNAggregateContactStore_usedLabelsForPropertyWithKey_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "usedLabelsForPropertyWithKey:error:", *(_QWORD *)(a1 + 32), a3);
}

- (BOOL)setMeContact:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  char v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;

  v6 = a3;
  -[CNAggregateContactStore contactStores](self, "contactStores");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __46__CNAggregateContactStore_setMeContact_error___block_invoke;
  v20[3] = &unk_1E29F82C8;
  v8 = v6;
  v21 = v8;
  objc_msgSend(v7, "_cn_map:", v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0D13748];
  objc_msgSend(v9, "_cn_firstObjectPassingTest:", *MEMORY[0x1E0D13748]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(v9, "_cn_firstObjectPassingTest:", *MEMORY[0x1E0D13750]);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  v15 = v14;
  v16 = (*(uint64_t (**)(void))(*(_QWORD *)v10 + 16))();
  if ((v16 & 1) == 0)
  {
    objc_msgSend(v15, "right");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a4)
      *a4 = objc_retainAutorelease(v17);

  }
  return v16;
}

id __46__CNAggregateContactStore_setMeContact_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v8;

  v2 = (void *)MEMORY[0x1E0D13A18];
  v3 = *(_QWORD *)(a1 + 32);
  v8 = 0;
  v4 = objc_msgSend(a2, "setMeContact:error:", v3, &v8);
  v5 = v8;
  objc_msgSend(v2, "eitherWithBool:error:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)setMeContact:(id)a3 forContainer:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  char v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  id (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  id v29;

  v8 = a3;
  v9 = a4;
  -[CNAggregateContactStore contactStores](self, "contactStores");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __59__CNAggregateContactStore_setMeContact_forContainer_error___block_invoke;
  v27 = &unk_1E29F82F0;
  v11 = v8;
  v28 = v11;
  v12 = v9;
  v29 = v12;
  objc_msgSend(v10, "_cn_map:", &v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x1E0D13748];
  objc_msgSend(v13, "_cn_firstObjectPassingTest:", *MEMORY[0x1E0D13748], v24, v25, v26, v27);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    objc_msgSend(v13, "_cn_firstObjectPassingTest:", *MEMORY[0x1E0D13750]);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  v19 = v18;
  v20 = (*(uint64_t (**)(void))(*(_QWORD *)v14 + 16))();
  if ((v20 & 1) == 0)
  {
    objc_msgSend(v19, "right");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a5)
      *a5 = objc_retainAutorelease(v21);

  }
  return v20;
}

id __59__CNAggregateContactStore_setMeContact_forContainer_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v9;

  v2 = (void *)MEMORY[0x1E0D13A18];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v9 = 0;
  v5 = objc_msgSend(a2, "setMeContact:forContainer:error:", v3, v4, &v9);
  v6 = v9;
  objc_msgSend(v2, "eitherWithBool:error:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)accountsMatchingPredicate:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__CNAggregateContactStore_accountsMatchingPredicate_error___block_invoke;
  v10[3] = &unk_1E29F8278;
  v11 = v6;
  v7 = v6;
  -[CNAggregateContactStore _allStoreResultsWithError:withBlock:](self, "_allStoreResultsWithError:withBlock:", a4, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __59__CNAggregateContactStore_accountsMatchingPredicate_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "accountsMatchingPredicate:error:", *(_QWORD *)(a1 + 32), a3);
}

- (BOOL)supportsSaveRequest:(id)a3
{
  id v4;
  NSArray *contactStores;
  id v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  contactStores = self->_contactStores;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__CNAggregateContactStore_supportsSaveRequest___block_invoke;
  v8[3] = &unk_1E29F8318;
  v9 = v4;
  v6 = v4;
  LOBYTE(contactStores) = -[NSArray _cn_any:](contactStores, "_cn_any:", v8);

  return (char)contactStores;
}

uint64_t __47__CNAggregateContactStore_supportsSaveRequest___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsSaveRequest:", *(_QWORD *)(a1 + 32));
}

- (BOOL)executeSaveRequest:(id)a3 error:(id *)a4
{
  return -[CNAggregateContactStore executeSaveRequest:response:authorizationContext:error:](self, "executeSaveRequest:response:authorizationContext:error:", a3, 0, 0, a4);
}

- (BOOL)executeSaveRequest:(id)a3 response:(id *)a4 authorizationContext:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  char v12;
  _UNKNOWN **v13;
  void *v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  CNAggregateContactStore *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = objc_msgSend(v10, "suppressChangeNotifications");
  v13 = &off_1E29F1000;
  if ((v12 & 1) == 0)
  {
    +[CNChangesNotifier sharedNotifier](CNChangesNotifier, "sharedNotifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "willSaveChanges");

  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v15 = self->_contactStores;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v16)
  {
    v17 = v16;
    v25 = self;
    v18 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v20, "supportsSaveRequest:", v10)
          && !objc_msgSend(v20, "executeSaveRequest:response:authorizationContext:error:", v10, a4, v11, a6))
        {
          v21 = 0;
          goto LABEL_14;
        }
      }
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v17)
        continue;
      break;
    }
    v21 = 1;
LABEL_14:
    self = v25;
    v13 = &off_1E29F1000;
  }
  else
  {
    v21 = 1;
  }

  if ((v12 & 1) == 0)
  {
    objc_msgSend(v13[387], "sharedNotifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "saveRequestIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "didSaveChangesSuccessfully:fromContactStore:requestIdentifier:", v21, self, v23);

  }
  return v21;
}

- (id)executeFetchRequest:(id)a3 progressiveResults:(id)a4 completion:(id)a5
{
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD aBlock[5];
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[5];
  uint8_t buf[16];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v31 = a4;
  v29 = a5;
  +[CNAPITriageLogger setThreadEntryPoint:](CNAPITriageLogger, "setThreadEntryPoint:", a2);
  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "Fetching", ", buf, 2u);
  }

  v27 = objc_alloc_init(MEMORY[0x1E0D13B88]);
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __77__CNAggregateContactStore_executeFetchRequest_progressiveResults_completion___block_invoke;
  v39[3] = &__block_descriptor_40_e5_v8__0l;
  v39[4] = v10;
  v13 = (void *)objc_msgSend(v39, "copy");
  objc_opt_self();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = _Block_copy(v14);
  objc_msgSend(v27, "push:", v15);

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v16 = self->_contactStores;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v36 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __77__CNAggregateContactStore_executeFetchRequest_progressiveResults_completion___block_invoke_52;
        aBlock[3] = &unk_1E29F8340;
        aBlock[4] = self;
        v21 = v30;
        v33 = v21;
        v34 = v31;
        v22 = _Block_copy(aBlock);
        objc_msgSend(v20, "executeFetchRequest:progressiveResults:completion:", v21, v22, v29);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23)
          v28 = v23;

        if (v24)
        {

          goto LABEL_16;
        }
      }
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      if (v17)
        continue;
      break;
    }
  }

  v28 = 0;
LABEL_16:
  objc_msgSend(v27, "popAllWithHandler:", &__block_literal_global_54_0);
  v25 = (id)objc_opt_self();

  return v28;
}

void __77__CNAggregateContactStore_executeFetchRequest_progressiveResults_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  +[CNAPITriageLogger setThreadEntryPoint:](CNAPITriageLogger, "setThreadEntryPoint:", 0);
  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Fetching", ", v5, 2u);
  }

}

void __77__CNAggregateContactStore_executeFetchRequest_progressiveResults_completion___block_invoke_52(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "keysToFetch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applyPostFetchDecoratorsToContacts:keysToFetch:unifyContactsFromMainStore:", v8, v9, objc_msgSend(*(id *)(a1 + 40), "unifyResults"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __77__CNAggregateContactStore_executeFetchRequest_progressiveResults_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)enumeratorForContactFetchRequest:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CNFetchResult *v21;
  void *v22;
  CNFetchResult *v23;
  id v24;
  id v26;
  CNFetchResult *v27;
  _QWORD v30[5];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[5];
  uint8_t buf[16];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[CNAPITriageLogger setThreadEntryPoint:](CNAPITriageLogger, "setThreadEntryPoint:", a2);
  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Fetching", ", buf, 2u);
  }

  v26 = objc_alloc_init(MEMORY[0x1E0D13B88]);
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __66__CNAggregateContactStore_enumeratorForContactFetchRequest_error___block_invoke;
  v36[3] = &__block_descriptor_40_e5_v8__0l;
  v36[4] = v7;
  v10 = (void *)objc_msgSend(v36, "copy");
  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = _Block_copy(v11);
  objc_msgSend(v26, "push:", v12);

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v13 = self->_contactStores;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v17, "enumeratorForContactFetchRequest:error:", v5, a4);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "value");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __66__CNAggregateContactStore_enumeratorForContactFetchRequest_error___block_invoke_57;
          v30[3] = &unk_1E29F8368;
          v30[4] = self;
          v31 = v5;
          objc_msgSend(v19, "_cn_compactMap:", v30);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = [CNFetchResult alloc];
          objc_msgSend(v18, "currentHistoryToken");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = -[CNFetchResult initWithValue:currentHistoryToken:](v21, "initWithValue:currentHistoryToken:", v20, v22);

          if (v23)
            v27 = v23;

          if (v23)
          {

            goto LABEL_17;
          }
        }
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (v14)
        continue;
      break;
    }
  }

  v27 = 0;
LABEL_17:
  objc_msgSend(v26, "popAllWithHandler:", &__block_literal_global_60_0);
  v24 = (id)objc_opt_self();

  return v27;
}

void __66__CNAggregateContactStore_enumeratorForContactFetchRequest_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  +[CNAPITriageLogger setThreadEntryPoint:](CNAPITriageLogger, "setThreadEntryPoint:", 0);
  +[CNAPITriageLogger os_log](CNAPITriageLogger, "os_log");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_18F8BD000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Fetching", ", v5, 2u);
  }

}

id __66__CNAggregateContactStore_enumeratorForContactFetchRequest_error___block_invoke_57(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "keysToFetch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applyPostFetchDecoratorsToContact:keysToFetch:unifyContactsFromMainStore:", v5, v6, objc_msgSend(*(id *)(a1 + 40), "unifyResults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __66__CNAggregateContactStore_enumeratorForContactFetchRequest_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)enumeratorForChangeHistoryFetchRequest:(id)a3 error:(id *)a4
{
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = self->_contactStores;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v12, "enumeratorForChangeHistoryFetchRequest:error:", v6, a4, (_QWORD)v16);
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = (void *)v13;
            goto LABEL_12;
          }
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_12:

  return v14;
}

- (CNContactStore)contactStoreForMatchingDictionaryWork
{
  cn_objectResultWithObjectLock();
  return (CNContactStore *)(id)objc_claimAutoreleasedReturnValue();
}

id __64__CNAggregateContactStore_contactStoreForMatchingDictionaryWork__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[4];
  if (!v3)
  {
    objc_msgSend(v2, "findContactStoreForMatchingDictionaryWork");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  return v3;
}

- (id)findContactStoreForMatchingDictionaryWork
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
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
  v3 = self->_contactStores;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(id *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        if ((objc_msgSend(v8, "supportsMatchingDictionaries", (_QWORD)v10) & 1) != 0)
        {

          return v8;
        }

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }

  -[CNAggregateContactStore mainContactStore](self, "mainContactStore");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)descriptorForRequiredKeysForMatchingDictionary
{
  void *v2;
  void *v3;

  -[CNAggregateContactStore contactStoreForMatchingDictionaryWork](self, "contactStoreForMatchingDictionaryWork");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorForRequiredKeysForMatchingDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)contactIdentifierWithMatchingDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNAggregateContactStore contactStoreForMatchingDictionaryWork](self, "contactStoreForMatchingDictionaryWork");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contactIdentifierWithMatchingDictionary:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)matchingDictionaryForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNAggregateContactStore contactStoreForMatchingDictionaryWork](self, "contactStoreForMatchingDictionaryWork");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "matchingDictionaryForContact:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)registerChangeHistoryClientIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = self->_contactStores;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "registerChangeHistoryClientIdentifier:error:", v6, a4, (_QWORD)v14) & 1) != 0)
        {
          v12 = 1;
          goto LABEL_11;
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)unregisterChangeHistoryClientIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = self->_contactStores;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "unregisterChangeHistoryClientIdentifier:error:", v6, a4, (_QWORD)v14) & 1) != 0)
        {
          v12 = 1;
          goto LABEL_11;
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (id)changeHistoryWithFetchRequest:(id)a3 error:(id *)a4
{
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->_contactStores;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "changeHistoryWithFetchRequest:error:", v6, a4, (_QWORD)v15);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)clearChangeHistoryForClientIdentifier:(id)a3 toChangeAnchor:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = self->_contactStores;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "clearChangeHistoryForClientIdentifier:toChangeAnchor:error:", v8, v9, a5, (_QWORD)v17) & 1) != 0)
        {
          v15 = 1;
          goto LABEL_11;
        }
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)executeChangeHistoryClearRequest:(id)a3 error:(id *)a4
{
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = self->_contactStores;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "executeChangeHistoryClearRequest:error:", v6, a4, (_QWORD)v14) & 1) != 0)
        {
          v12 = 1;
          goto LABEL_11;
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (id)getBackgroundColorOnImageData:(id)a3 bitmapFormat:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = self->_contactStores;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v24;
LABEL_3:
    v15 = 0;
    v16 = v13;
    while (1)
    {
      if (*(_QWORD *)v24 != v14)
        objc_enumerationMutation(v10);
      v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v15);
      v22 = v16;
      objc_msgSend(v17, "getBackgroundColorOnImageData:bitmapFormat:error:", v8, v9, &v22);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v22;

      if (v18)
        break;
      ++v15;
      v16 = v13;
      if (v12 == v15)
      {
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v12)
          goto LABEL_3;
        goto LABEL_11;
      }
    }
  }
  else
  {
    v13 = 0;
LABEL_11:
    v18 = 0;
  }

  v19 = v18;
  v20 = v19;
  if (a5 && !v19)
    *a5 = objc_retainAutorelease(v13);

  return v20;
}

- (BOOL)setBestMeIfNeededForGivenName:(id)a3 familyName:(id)a4 email:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[CNAggregateContactStore mainStore](self, "mainStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v13, "setBestMeIfNeededForGivenName:familyName:email:error:", v12, v11, v10, a6);

  return (char)a6;
}

- (id)identifierWithError:(id *)a3
{
  void *v4;
  void *v5;

  -[CNAggregateContactStore mainStore](self, "mainStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifierWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int)saveSequenceCount
{
  void *v2;
  int v3;

  -[CNAggregateContactStore mainStore](self, "mainStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "saveSequenceCount");

  return v3;
}

- (BOOL)moveContacts:(id)a3 fromContainer:(id)a4 toContainer:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[CNAggregateContactStore mainStore](self, "mainStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v13, "moveContacts:fromContainer:toContainer:error:", v12, v11, v10, a6);

  return (char)a6;
}

- (BOOL)resetSortDataIfNeededWithError:(id *)a3
{
  void *v4;

  -[CNAggregateContactStore mainStore](self, "mainStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "resetSortDataIfNeededWithError:", a3);

  return (char)a3;
}

- (BOOL)setDefaultAccountIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CNAggregateContactStore mainStore](self, "mainStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "setDefaultAccountIdentifier:error:", v6, a4);

  return (char)a4;
}

- (id)legacyTetheredSyncDeviceAnchor
{
  void *v2;
  void *v3;

  -[CNAggregateContactStore mainStore](self, "mainStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "legacyTetheredSyncDeviceAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setLegacyTetheredSyncDeviceAnchor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNAggregateContactStore mainStore](self, "mainStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLegacyTetheredSyncDeviceAnchor:", v4);

}

- (id)legacyTetheredSyncComputerAnchor
{
  void *v2;
  void *v3;

  -[CNAggregateContactStore mainStore](self, "mainStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "legacyTetheredSyncComputerAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setLegacyTetheredSyncComputerAnchor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNAggregateContactStore mainStore](self, "mainStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLegacyTetheredSyncComputerAnchor:", v4);

}

- (id)individualContactCountWithError:(id *)a3
{
  void *v4;
  void *v5;

  -[CNAggregateContactStore mainStore](self, "mainStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "individualContactCountWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)latestConsumedChangeHistoryAnchorForClientIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[CNAggregateContactStore mainStore](self, "mainStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "latestConsumedChangeHistoryAnchorForClientIdentifier:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)verifyChangeHistoryForClientIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CNAggregateContactStore mainStore](self, "mainStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "verifyChangeHistoryForClientIdentifier:error:", v6, a4);

  return (char)a4;
}

- (id)fetchLimitedAccessContactIdentifiersForBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNAggregateContactStore mainStore](self, "mainStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchLimitedAccessContactIdentifiersForBundle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)addLimitedAccessForBundle:(id)a3 contactIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CNAggregateContactStore mainStore](self, "mainStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addLimitedAccessForBundle:contactIdentifier:", v7, v6);

}

- (void)removeLimitedAccessForBundle:(id)a3 contactIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CNAggregateContactStore mainStore](self, "mainStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeLimitedAccessForBundle:contactIdentifier:", v7, v6);

}

- (id)getLimitedAccessContactsCountForBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNAggregateContactStore mainStore](self, "mainStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getLimitedAccessContactsCountForBundle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)populateSyncTableForLimitedAccessAboveSequenceNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNAggregateContactStore mainStore](self, "mainStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "populateSyncTableForLimitedAccessAboveSequenceNumber:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)purgeLimitedAccessRecordsForBundle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNAggregateContactStore mainStore](self, "mainStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "purgeLimitedAccessRecordsForBundle:", v4);

}

- (void)updateLimitedAccessTable:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNAggregateContactStore mainStore](self, "mainStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateLimitedAccessTable:", v4);

}

- (id)getLimitedAccessLastSyncSequenceNumber:(id *)a3
{
  void *v4;
  void *v5;

  -[CNAggregateContactStore mainStore](self, "mainStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getLimitedAccessLastSyncSequenceNumber:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)applyLimitedAccessSyncEvents:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNAggregateContactStore mainStore](self, "mainStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applyLimitedAccessSyncEvents:", v4);

}

- (void)dropAllLimitedAccessRows
{
  id v2;

  -[CNAggregateContactStore mainStore](self, "mainStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dropAllLimitedAccessRows");

}

- (void)dropAllLimitedAccessRowsAndSyncNotify
{
  id v2;

  -[CNAggregateContactStore mainStore](self, "mainStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dropAllLimitedAccessRowsAndSyncNotify");

}

- (void)setLimitedAccessTableCurrentSequenceNumber:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNAggregateContactStore mainStore](self, "mainStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLimitedAccessTableCurrentSequenceNumber:", v4);

}

- (BOOL)shouldAnalyzeDatabaseWithError:(id *)a3
{
  void *v4;

  -[CNAggregateContactStore mainStore](self, "mainStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "shouldAnalyzeDatabaseWithError:", a3);

  return (char)a3;
}

- (BOOL)analyzeDatabaseWithError:(id *)a3
{
  void *v4;

  -[CNAggregateContactStore mainStore](self, "mainStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "analyzeDatabaseWithError:", a3);

  return (char)a3;
}

- (id)getWatchLimitedAccessSyncDataStartingAtSequenceNumber:(int64_t)a3
{
  void *v4;
  void *v5;

  -[CNAggregateContactStore mainStore](self, "mainStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getWatchLimitedAccessSyncDataStartingAtSequenceNumber:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setContactStoreForMatchingDictionaryWork:(id)a3
{
  objc_storeStrong((id *)&self->_contactStoreForMatchingDictionaryWork, a3);
}

- (void)reindexSearchableItemsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNAggregateContactStore contactStoresSupportingSpotlightIndexing](self, "contactStoresSupportingSpotlightIndexing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v5;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "reindexSearchableItemsWithIdentifiers:", v4, (_QWORD)v11);
        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "logSpotlight");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CNAggregateContactStore(Spotlight) reindexSearchableItemsWithIdentifiers:].cold.1(v6);
  }

}

- (id)verifyIndexWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[CNAggregateContactStore firstContactStoreSupportingSpotlightIndexing](self, "firstContactStoreSupportingSpotlightIndexing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "verifyIndexWithError:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CNSetError(a3, 1002, 0);
    v6 = 0;
  }

  return v6;
}

- (id)contactStoresSupportingSpotlightIndexing
{
  void *v2;
  void *v3;
  void *v4;

  -[CNAggregateContactStore contactStores](self, "contactStores");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactStore IsSpotlightIndexingSupported](CNContactStore, "IsSpotlightIndexingSupported");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_filter:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)firstContactStoreSupportingSpotlightIndexing
{
  void *v2;
  void *v3;
  void *v4;

  -[CNAggregateContactStore contactStores](self, "contactStores");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactStore IsSpotlightIndexingSupported](CNContactStore, "IsSpotlightIndexingSupported");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_firstObjectPassingTest:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isSpotlightIndexingSupported
{
  void *v2;
  void *v3;
  char v4;

  -[CNAggregateContactStore contactStores](self, "contactStores");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactStore IsSpotlightIndexingSupported](CNContactStore, "IsSpotlightIndexingSupported");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "_cn_any:", v3);

  return v4;
}

- (id)iOSMapper
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
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
  -[CNAggregateContactStore contactStores](self, "contactStores", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "iOSMapper");
        v7 = objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = (void *)v7;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (id)originForSuggestion:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CNAggregateContactStore contactStores](self, "contactStores", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "originForSuggestion:error:", v6, a4);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (void)enumerateContactsAndMatchInfoWithFetchRequest:(os_log_t)log error:usingBlock:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18F8BD000, log, OS_LOG_TYPE_ERROR, "Encountered null object(s) (aggregate)", v1, 2u);
}

@end
