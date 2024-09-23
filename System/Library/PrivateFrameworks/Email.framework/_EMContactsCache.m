@implementation _EMContactsCache

- (_EMContactsCache)initWithStore:(id)a3
{
  id v4;
  _EMContactsCache *v5;
  _EMContactsCache *v6;
  EFLazyCache *v7;
  EFLazyCache *addressesCache;
  EFLazyCache *v9;
  EFLazyCache *namesCache;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_EMContactsCache;
  v5 = -[_EMContactsCache init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_store, v4);
    v7 = (EFLazyCache *)objc_alloc_init(MEMORY[0x1E0D1EED8]);
    addressesCache = v6->_addressesCache;
    v6->_addressesCache = v7;

    v9 = (EFLazyCache *)objc_alloc_init(MEMORY[0x1E0D1EED8]);
    namesCache = v6->_namesCache;
    v6->_namesCache = v9;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v6, sel__contactsChanged_, *MEMORY[0x1E0C96870], 0);

  }
  return v6;
}

- (id)contactsForEmailAddress:(id)a3 keysToFetch:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v8 = a3;
  v9 = a4;
  -[_EMContactsCache addressesCache](self, "addressesCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62___EMContactsCache_contactsForEmailAddress_keysToFetch_error___block_invoke;
  v14[3] = &unk_1E70F2600;
  v11 = v8;
  v15 = v11;
  -[_EMContactsCache _contactsForKey:cache:keysToFetch:predicateBlock:error:](self, "_contactsForKey:cache:keysToFetch:predicateBlock:error:", v11, v10, v9, v14, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)contactsForName:(id)a3 keysToFetch:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v8 = a3;
  v9 = a4;
  -[_EMContactsCache namesCache](self, "namesCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54___EMContactsCache_contactsForName_keysToFetch_error___block_invoke;
  v14[3] = &unk_1E70F2600;
  v11 = v8;
  v15 = v11;
  -[_EMContactsCache _contactsForKey:cache:keysToFetch:predicateBlock:error:](self, "_contactsForKey:cache:keysToFetch:predicateBlock:error:", v11, v10, v9, v14, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_contactsForKey:(id)a3 cache:(id)a4 keysToFetch:(id)a5 predicateBlock:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t *v17;
  void *v18;
  id v19;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v12 = a5;
  v13 = a6;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__0;
  v33 = __Block_byref_object_dispose__0;
  v34 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __75___EMContactsCache__contactsForKey_cache_keysToFetch_predicateBlock_error___block_invoke;
  v24[3] = &unk_1E70F2628;
  v14 = v13;
  v26 = v14;
  v27 = &v29;
  v24[4] = self;
  v15 = v12;
  v25 = v15;
  v28 = &v35;
  objc_msgSend(a4, "objectForKey:generator:", a3, v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v30;
  v18 = (void *)v30[5];
  if (v18)
  {
    if (a7)
    {
      *a7 = 0;
      v18 = (void *)v17[5];
    }
    v19 = v18;
  }
  else
  {
    v21 = (void *)v36[5];
    if (v21)
    {
      v19 = 0;
      if (a7)
        *a7 = objc_retainAutorelease(v21);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsWithIdentifiers:", v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[_EMContactsCache store](self, "store");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "unifiedContactsMatchingPredicate:keysToFetch:error:", v22, v15, a7);
      v19 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v19;
}

- (id)allContactEmailAddressesWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id obja;
  id obj;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _QWORD v37[4];

  v37[1] = *MEMORY[0x1E0C80C00];
  -[_EMContactsCache store](self, "store");
  obja = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = *MEMORY[0x1E0C966A8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obja, "unifiedContactsMatchingPredicate:keysToFetch:error:", v4, v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v6;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v32;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v25);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        objc_msgSend(v8, "emailAddresses");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v28;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v28 != v11)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v12), "value");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "objectForKeyedSubscript:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (v14)
              {
                objc_msgSend(v8, "identifier");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "addObject:", v15);

              }
              else
              {
                v16 = objc_alloc(MEMORY[0x1E0C99DE8]);
                objc_msgSend(v8, "identifier");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = (void *)objc_msgSend(v16, "initWithObjects:", v17, 0);

                objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v13);
              }

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          }
          while (v10);
        }

        ++v25;
      }
      while (v25 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v24);
  }

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __54___EMContactsCache_allContactEmailAddressesWithError___block_invoke;
  v26[3] = &unk_1E70F2678;
  v26[4] = self;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v26);
  objc_msgSend(v7, "allKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)_contactsChanged:(id)a3
{
  -[EFLazyCache removeAllObjects](self->_addressesCache, "removeAllObjects", a3);
  -[EFLazyCache removeAllObjects](self->_namesCache, "removeAllObjects");
}

- (CNContactStore)store
{
  return (CNContactStore *)objc_loadWeakRetained((id *)&self->_store);
}

- (EFLazyCache)addressesCache
{
  return self->_addressesCache;
}

- (EFLazyCache)namesCache
{
  return self->_namesCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namesCache, 0);
  objc_storeStrong((id *)&self->_addressesCache, 0);
  objc_destroyWeak((id *)&self->_store);
}

@end
