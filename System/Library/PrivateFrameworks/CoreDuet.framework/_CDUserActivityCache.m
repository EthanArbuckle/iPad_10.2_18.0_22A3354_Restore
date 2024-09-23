@implementation _CDUserActivityCache

- (unsigned)count
{
  _PASLock *deletionCache;
  unsigned int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  deletionCache = self->_deletionCache;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29___CDUserActivityCache_count__block_invoke;
  v5[3] = &unk_1E26E5A98;
  v5[4] = self;
  v5[5] = &v6;
  -[_PASLock runWithLockAcquired:](deletionCache, "runWithLockAcquired:", v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (_CDUserActivityCache)initWithKnowledgeStore:(id)a3
{
  id v5;
  _CDUserActivityCache *v6;
  double v7;
  void *v8;
  uint64_t v9;
  _PASLock *deletionCache;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CDUserActivityCache;
  v6 = -[_CDUserActivityCache init](&v12, sel_init);
  if (v6)
  {
    LODWORD(v7) = 953267991;
    objc_msgSend(MEMORY[0x1E0D81538], "bloomFilterInMemoryWithNumberOfValuesN:errorRateP:", 13355, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v8);
    deletionCache = v6->_deletionCache;
    v6->_deletionCache = (_PASLock *)v9;

    objc_storeStrong((id *)&v6->_knowledgeStore, a3);
    v6->_count = 0;

  }
  return v6;
}

- (id)hashArrayForSourceID:(id)a3 bundleID:(id)a4 itemID:(id)a5
{
  __CFString *v8;
  __CFString *v9;
  id v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  _PASLock *deletionCache;
  __CFString *v16;
  __CFString *v17;
  id v18;
  id v19;
  _QWORD v21[4];
  __CFString *v22;
  __CFString *v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v8 = (__CFString *)a3;
  v9 = (__CFString *)a4;
  v10 = a5;
  if (v8)
    v11 = v8;
  else
    v11 = &stru_1E26E9728;
  v12 = v11;
  if (v9)
    v13 = v9;
  else
    v13 = &stru_1E26E9728;
  v14 = v13;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__16;
  v30 = __Block_byref_object_dispose__16;
  v31 = 0;
  deletionCache = self->_deletionCache;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __61___CDUserActivityCache_hashArrayForSourceID_bundleID_itemID___block_invoke;
  v21[3] = &unk_1E26E5AC0;
  v25 = &v26;
  v16 = v12;
  v22 = v16;
  v17 = v14;
  v23 = v17;
  v18 = v10;
  v24 = v18;
  -[_PASLock runWithLockAcquired:](deletionCache, "runWithLockAcquired:", v21);
  v19 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v19;
}

- (void)addSourceID:(id)a3 bundleID:(id)a4 itemID:(id)a5
{
  void *v6;
  _PASLock *deletionCache;
  id v8;
  _QWORD v9[4];
  id v10;
  _CDUserActivityCache *v11;

  -[_CDUserActivityCache hashArrayForSourceID:bundleID:itemID:](self, "hashArrayForSourceID:bundleID:itemID:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  deletionCache = self->_deletionCache;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52___CDUserActivityCache_addSourceID_bundleID_itemID___block_invoke;
  v9[3] = &unk_1E26E5AE8;
  v10 = v6;
  v11 = self;
  v8 = v6;
  -[_PASLock runWithLockAcquired:](deletionCache, "runWithLockAcquired:", v9);

}

- (BOOL)containsObjectForSourceID:(id)a3 bundleID:(id)a4 itemID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _PASLock *deletionCache;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_CDUserActivityCache hashArrayForSourceID:bundleID:itemID:](self, "hashArrayForSourceID:bundleID:itemID:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  deletionCache = self->_deletionCache;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66___CDUserActivityCache_containsObjectForSourceID_bundleID_itemID___block_invoke;
  v15[3] = &unk_1E26E5A98;
  v17 = &v18;
  v13 = v11;
  v16 = v13;
  -[_PASLock runWithLockAcquired:](deletionCache, "runWithLockAcquired:", v15);
  LOBYTE(deletionCache) = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)deletionCache;
}

- (void)_populateAppActivityStream
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _DKKnowledgeQuerying *knowledgeStore;
  void *v8;
  char isKindOfClass;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *context;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  _BYTE v35[128];
  _QWORD v36[3];

  v2 = 0;
  v36[1] = *MEMORY[0x1E0C80C00];
  do
  {
    context = (void *)MEMORY[0x193FEE914](self, a2);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKSystemEventStreams appActivityStream](_DKSystemEventStreams, "appActivityStream");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v2;
    +[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:](_DKEventQuery, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v3, v5, v2, 100, 0);
    v6 = objc_claimAutoreleasedReturnValue();

    knowledgeStore = self->_knowledgeStore;
    v34 = 0;
    v26 = (void *)v6;
    -[_DKKnowledgeQuerying executeQuery:error:](knowledgeStore, "executeQuery:error:", v6, &v34);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v34;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v10 = 0;
    if ((isKindOfClass & 1) != 0)
      v10 = v8;
    v25 = v8;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v31 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v16, "source", v24, v25);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "sourceID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "source");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "bundleID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "source");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "itemID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[_CDUserActivityCache addSourceID:bundleID:itemID:](self, "addSourceID:bundleID:itemID:", v18, v20, v22);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v13);
    }
    v2 = v28 + 100;

    v23 = objc_msgSend(v11, "count");
    objc_autoreleasePoolPop(context);
  }
  while (v23 > 0x63);
}

- (void)_populateAppLocationActivityStream
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _DKBiomeQuery *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKSystemEventStreams appLocationActivityStream](_DKSystemEventStreams, "appLocationActivityStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:](_DKEventQuery, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v3, v5, 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_DKBiomeQuery initWithDKEventQuery:]([_DKBiomeQuery alloc], "initWithDKEventQuery:", v6);
  v13 = 0;
  -[_DKBiomeQuery publisherForQueryWithError:](v7, "publisherForQueryWithError:", &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  v10 = (void *)MEMORY[0x193FEE914]();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58___CDUserActivityCache__populateAppLocationActivityStream__block_invoke_2;
  v12[3] = &unk_1E26E5B10;
  v12[4] = self;
  v11 = (id)objc_msgSend(v8, "sinkWithCompletion:receiveInput:", &__block_literal_global_49, v12);
  objc_autoreleasePoolPop(v10);

}

- (void)populateCache
{
  void *v3;

  v3 = (void *)MEMORY[0x193FEE914](self, a2);
  -[_CDUserActivityCache _populateAppActivityStream](self, "_populateAppActivityStream");
  -[_CDUserActivityCache _populateAppLocationActivityStream](self, "_populateAppLocationActivityStream");
  objc_autoreleasePoolPop(v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletionCache, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

@end
