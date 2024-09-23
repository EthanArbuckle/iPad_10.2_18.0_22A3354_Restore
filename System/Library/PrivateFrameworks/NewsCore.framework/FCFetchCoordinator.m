@implementation FCFetchCoordinator

BOOL __50__FCFetchCoordinator_beginFetchesIfNeededWithLock__block_invoke(uint64_t a1, void *a2)
{
  _BYTE *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 40);
  else
    v5 = 0;
  objc_msgSend(v5, "objectForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = 0;
  else
    v7 = v3 && v3[9] || *(_BYTE *)(a1 + 40) == 0;

  return v7;
}

- (void)operationThrottlerPerformOperation:(id)a3
{
  NFMutexLock *accessLock;
  _QWORD v4[5];

  if (self)
    accessLock = self->_accessLock;
  else
    accessLock = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__FCFetchCoordinator_operationThrottlerPerformOperation___block_invoke;
  v4[3] = &unk_1E463AB18;
  v4[4] = self;
  -[NFMutexLock performWithLockSync:](accessLock, "performWithLockSync:", v4);
}

- (id)fetchKeys:(id)a3 context:(id)a4 qualityOfService:(int64_t)a5 relativePriority:(int64_t)a6 completionQueue:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  FCFetchGroup *v18;
  void *v19;
  id *v20;
  id *v21;
  void *v22;
  _QWORD v24[5];
  id *v25;

  v14 = a8;
  v15 = a7;
  v16 = a4;
  v17 = a3;
  v18 = [FCFetchGroup alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[FCFetchGroup initWithKeys:context:shouldFilter:qualityOfService:relativePriority:completionQueue:completion:]((id *)&v18->super.isa, v19, v16, 1, (void *)a5, (void *)a6, v15, v14);
  -[FCFetchCoordinator addFetchGroup:]((uint64_t)self, v20);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __101__FCFetchCoordinator_fetchKeys_context_qualityOfService_relativePriority_completionQueue_completion___block_invoke;
  v24[3] = &unk_1E463AD10;
  v24[4] = self;
  v25 = v20;
  v21 = v20;
  +[FCInterestToken interestTokenWithRemoveInterestBlock:](FCInterestToken, "interestTokenWithRemoveInterestBlock:", v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (void)addFetchGroup:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 48);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __36__FCFetchCoordinator_addFetchGroup___block_invoke;
    v6[3] = &unk_1E463AD10;
    v6[4] = a1;
    v7 = v3;
    objc_msgSend(v5, "performWithLockSync:", v6);

  }
}

- (id)fetchKeysUnconditionally:(id)a3 context:(id)a4 qualityOfService:(int64_t)a5 relativePriority:(int64_t)a6 completionQueue:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  FCFetchGroup *v18;
  void *v19;
  id *v20;
  id *v21;
  void *v22;
  _QWORD v24[5];
  id *v25;

  v14 = a8;
  v15 = a7;
  v16 = a4;
  v17 = a3;
  v18 = [FCFetchGroup alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[FCFetchGroup initWithKeys:context:shouldFilter:qualityOfService:relativePriority:completionQueue:completion:]((id *)&v18->super.isa, v19, v16, 0, (void *)a5, (void *)a6, v15, v14);
  -[FCFetchCoordinator addFetchGroup:]((uint64_t)self, v20);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __116__FCFetchCoordinator_fetchKeysUnconditionally_context_qualityOfService_relativePriority_completionQueue_completion___block_invoke;
  v24[3] = &unk_1E463AD10;
  v24[4] = self;
  v25 = v20;
  v21 = v20;
  +[FCInterestToken interestTokenWithRemoveInterestBlock:](FCInterestToken, "interestTokenWithRemoveInterestBlock:", v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FCFetchCoordinator)init
{
  FCFetchCoordinator *v2;
  uint64_t v3;
  NSHashTable *fetchGroups;
  uint64_t v5;
  FCMapTable *fetchOperationsByGroup;
  NSCountedSet *v7;
  NSCountedSet *allKeys;
  NFMutexLock *v9;
  NFMutexLock *accessLock;
  FCBoostableOperationThrottler *v11;
  FCBoostableOperationThrottler *fetchThrottler;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)FCFetchCoordinator;
  v2 = -[FCFetchCoordinator init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 512);
    v3 = objc_claimAutoreleasedReturnValue();
    fetchGroups = v2->_fetchGroups;
    v2->_fetchGroups = (NSHashTable *)v3;

    +[FCMapTable mapTableWithKeyOptions:valueOptions:](FCMapTable, "mapTableWithKeyOptions:valueOptions:", 512, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    fetchOperationsByGroup = v2->_fetchOperationsByGroup;
    v2->_fetchOperationsByGroup = (FCMapTable *)v5;

    v7 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    allKeys = v2->_allKeys;
    v2->_allKeys = v7;

    v9 = (NFMutexLock *)objc_alloc_init(MEMORY[0x1E0D60AE0]);
    accessLock = v2->_accessLock;
    v2->_accessLock = v9;

    v11 = -[FCBoostableOperationThrottler initWithDelegate:]([FCBoostableOperationThrottler alloc], "initWithDelegate:", v2);
    fetchThrottler = v2->_fetchThrottler;
    v2->_fetchThrottler = v11;

  }
  return v2;
}

- (void)removeFetchGroup:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 48);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39__FCFetchCoordinator_removeFetchGroup___block_invoke;
    v6[3] = &unk_1E463AD10;
    v6[4] = a1;
    v7 = v3;
    objc_msgSend(v5, "performWithLockSync:", v6);

  }
}

void __101__FCFetchCoordinator_fetchKeys_context_qualityOfService_relativePriority_completionQueue_completion___block_invoke(uint64_t a1)
{
  -[FCFetchCoordinator removeFetchGroup:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void __116__FCFetchCoordinator_fetchKeysUnconditionally_context_qualityOfService_relativePriority_completionQueue_completion___block_invoke(uint64_t a1)
{
  -[FCFetchCoordinator removeFetchGroup:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void __57__FCFetchCoordinator_operationThrottlerPerformOperation___block_invoke(uint64_t a1)
{
  id *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  char v12;
  void *v13;
  uint64_t v14;
  id *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  BOOL v37;
  void *v38;
  id v39;
  unint64_t v40;
  unint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  id obj;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[6];
  BOOL v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[5];
  char v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v1 = *(id **)(a1 + 32);
  if (v1)
  {
    v2 = a1;
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v3 = (void *)objc_msgSend(v1[5], "copy");
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
    if (v4)
    {
      v5 = v4;
      v57 = v2;
      v6 = 0;
      v7 = *(_QWORD *)v72;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v72 != v7)
            objc_enumerationMutation(v3);
          v9 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * v8);
          if (v9)
            v10 = *(_QWORD *)(v9 + 16);
          else
            v10 = 0;
          v11 = v1[4];
          v12 = objc_msgSend(v11, "intersectsSet:", v10);

          if ((v12 & 1) == 0)
          {
            objc_msgSend(v1[5], "objectForKey:", v9);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "cancel");
            objc_msgSend(v1[5], "removeObjectForKey:", v9);

            v6 = 1;
          }
          ++v8;
        }
        while (v5 != v8);
        v14 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
        v5 = v14;
      }
      while (v14);

      v2 = v57;
      if ((v6 & 1) != 0)
        objc_msgSend(v1[7], "tickle");
    }
    else
    {

    }
    v15 = *(id **)(v2 + 32);
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v17 = v15[5];
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
      if (!v18)
      {
        v20 = 0;
        goto LABEL_33;
      }
      v19 = v18;
      v20 = 0;
      v21 = *(_QWORD *)v68;
      while (1)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v68 != v21)
            objc_enumerationMutation(v17);
          v23 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
          if (v23)
          {
            v24 = *(_QWORD *)(v23 + 16);
            if (*(_BYTE *)(v23 + 9))
            {
              objc_msgSend(v16, "unionSet:", v24);
              v20 = 1;
              continue;
            }
          }
          else
          {
            v24 = 0;
          }
          objc_msgSend(v56, "unionSet:", v24);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
        if (!v19)
        {
LABEL_33:

          v25 = v15[3];
          objc_msgSend(v25, "allObjects");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "sortedArrayUsingSelector:", sel_comparePriority_);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v65[0] = MEMORY[0x1E0C809B0];
          v65[1] = 3221225472;
          v65[2] = __50__FCFetchCoordinator_beginFetchesIfNeededWithLock__block_invoke;
          v65[3] = &unk_1E4643770;
          v65[4] = v15;
          v66 = v20 & 1;
          v54 = v27;
          objc_msgSend(v27, "fc_arrayOfObjectsPassingTest:", v65);
          v61 = 0u;
          v62 = 0u;
          v63 = 0u;
          v64 = 0u;
          obj = (id)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, &v71, 16);
          v29 = v56;
          if (!v28)
            goto LABEL_75;
          v30 = v28;
          v58 = *(_QWORD *)v62;
          while (1)
          {
            v31 = 0;
            do
            {
              if (*(_QWORD *)v62 != v58)
                objc_enumerationMutation(obj);
              v32 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v31);
              if (!v32)
              {
                v33 = (void *)objc_msgSend(0, "mutableCopy");
                if (!objc_msgSend(v33, "count"))
                  goto LABEL_63;
LABEL_48:
                v37 = 0;
                goto LABEL_49;
              }
              v33 = (void *)objc_msgSend(*(id *)(v32 + 16), "mutableCopy");
              if (*(_BYTE *)(v32 + 8))
              {
                objc_msgSend(v15, "delegate");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "fetchCoordinator:filterKeysToFetch:isFirstAttempt:context:", v15, v33, *(_QWORD *)(v32 + 48) == 0, *(_QWORD *)(v32 + 24));

              }
              if (!objc_msgSend(v33, "count"))
              {
LABEL_63:
                -[FCFetchGroup fireCompletion]((void *)v32);
                objc_msgSend(v15[3], "removeObject:", v32);
                if (v32)
                  v52 = *(_QWORD *)(v32 + 16);
                else
                  v52 = 0;
                v46 = v15[4];
                objc_msgSend(v46, "minusSet:", v52);
LABEL_66:

                goto LABEL_67;
              }
              if (!*(_BYTE *)(v32 + 8))
                goto LABEL_48;
              v35 = objc_msgSend(v33, "count");
              if (*(_BYTE *)(v32 + 9))
                v36 = v16;
              else
                v36 = v29;
              objc_msgSend(v33, "minusSet:", v36);
              v37 = v35 != objc_msgSend(v33, "count");
LABEL_49:
              if (!objc_msgSend(v33, "count"))
                goto LABEL_67;
              v38 = v16;
              if (!objc_msgSend(v15, "maxConcurrentFetchCount")
                || (v39 = v15[5],
                    v40 = objc_msgSend(v39, "count"),
                    v41 = objc_msgSend(v15, "maxConcurrentFetchCount"),
                    v39,
                    v40 < v41))
              {
                objc_msgSend(v15, "delegate");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                if (v32)
                {
                  v43 = *(id *)(v32 + 24);
                  v44 = *(_QWORD *)(v32 + 32);
                  v45 = *(_QWORD *)(v32 + 40);
                }
                else
                {
                  v44 = 0;
                  v43 = 0;
                  v45 = 0;
                }
                objc_msgSend(v42, "fetchCoordinator:fetchOperationForKeys:context:qualityOfService:relativePriority:", v15, v33, v43, v44, v45);
                v46 = (id)objc_claimAutoreleasedReturnValue();

                if (v32)
                  v47 = *(_QWORD *)(v32 + 32);
                else
                  v47 = 0;
                v16 = v38;
                objc_msgSend(v46, "setQualityOfService:", v47);
                v59[0] = MEMORY[0x1E0C809B0];
                v59[1] = 3221225472;
                v59[2] = __50__FCFetchCoordinator_beginFetchesIfNeededWithLock__block_invoke_2;
                v59[3] = &unk_1E463B200;
                v59[4] = v15;
                v59[5] = v32;
                v60 = v37;
                objc_msgSend(v46, "setCompletionBlock:", v59);
                objc_msgSend(v15[5], "setObject:forKey:", v46, v32);
                v29 = v56;
                v48 = v56;
                if (v32)
                {
                  if (*(_BYTE *)(v32 + 9))
                    v48 = v16;
                  else
                    v48 = v56;
                }
                objc_msgSend(v48, "unionSet:", v33);
                objc_msgSend(v15, "delegate");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = v49;
                if (v32)
                  v51 = *(_QWORD *)(v32 + 24);
                else
                  v51 = 0;
                objc_msgSend(v49, "fetchCoordinator:addFetchOperation:context:", v15, v46, v51);

                goto LABEL_66;
              }
              v16 = v38;
              v29 = v56;
LABEL_67:

              ++v31;
            }
            while (v30 != v31);
            v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, &v71, 16);
            v30 = v53;
            if (!v53)
            {
LABEL_75:

              return;
            }
          }
        }
      }
    }
  }
}

- (FCFetchCoordinatorDelegate)delegate
{
  return (FCFetchCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

void __50__FCFetchCoordinator_beginFetchesIfNeededWithLock__block_invoke_3(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  int v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  void *v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[3];
  v3 = v2;
  if (objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    v4 = *(unsigned __int8 *)(a1 + 48);

    if (v4)
      goto LABEL_13;
    -[FCFetchGroup fireCompletion](*(void **)(a1 + 40));
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      v6 = *(void **)(v5 + 24);
    else
      v6 = 0;
    objc_msgSend(v6, "removeObject:", *(_QWORD *)(a1 + 40));
    v7 = *(_QWORD **)(a1 + 32);
    if (v7)
      v7 = (_QWORD *)v7[4];
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      v9 = *(_QWORD *)(v8 + 16);
    else
      v9 = 0;
    v3 = v7;
    objc_msgSend(v3, "minusSet:", v9);
  }

LABEL_13:
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    v11 = *(void **)(v10 + 40);
  else
    v11 = 0;
  objc_msgSend(v11, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    ++*(_QWORD *)(v12 + 48);
  v13 = *(_QWORD **)(a1 + 32);
  if (v13)
    v13 = (_QWORD *)v13[3];
  v14 = v13;
  objc_msgSend(v14, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sortedArrayUsingSelector:", sel_comparePriority_);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v21, "count"))
  {
    v16 = *(_QWORD **)(a1 + 32);
    if (v16)
      v16 = (_QWORD *)v16[7];
    v17 = v16;
    objc_msgSend(v21, "firstObject");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      v20 = *(_QWORD *)(v18 + 32);
    else
      v20 = 0;
    objc_msgSend(v17, "tickleWithQualityOfService:", v20);

  }
}

- (unint64_t)maxConcurrentFetchCount
{
  return self->_maxConcurrentFetchCount;
}

uint64_t __36__FCFetchCoordinator_addFetchGroup___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 24);
  else
    v3 = 0;
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 40));
  v4 = *(_QWORD **)(a1 + 32);
  if (v4)
    v4 = (_QWORD *)v4[4];
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    v6 = *(_QWORD *)(v5 + 16);
  else
    v6 = 0;
  v7 = v4;
  objc_msgSend(v7, "unionSet:", v6);

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    v9 = *(void **)(v8 + 56);
  else
    v9 = 0;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    v11 = *(_QWORD *)(v10 + 32);
  else
    v11 = 0;
  return objc_msgSend(v9, "tickleWithQualityOfService:", v11);
}

uint64_t __39__FCFetchCoordinator_removeFetchGroup___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 24);
  else
    v3 = 0;
  result = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
  {
    -[FCFetchGroup fireCompletion](*(void **)(a1 + 40));
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      v6 = *(void **)(v5 + 24);
    else
      v6 = 0;
    objc_msgSend(v6, "removeObject:", *(_QWORD *)(a1 + 40));
    v7 = *(_QWORD **)(a1 + 32);
    if (v7)
      v7 = (_QWORD *)v7[4];
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      v9 = *(_QWORD *)(v8 + 16);
    else
      v9 = 0;
    v10 = v7;
    objc_msgSend(v10, "minusSet:", v9);

    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      v12 = *(void **)(v11 + 56);
    else
      v12 = 0;
    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
      v14 = *(_QWORD *)(v13 + 32);
    else
      v14 = 0;
    return objc_msgSend(v12, "tickleWithQualityOfService:", v14);
  }
  return result;
}

uint64_t __50__FCFetchCoordinator_beginFetchesIfNeededWithLock__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD v5[6];
  char v6;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 48);
  else
    v2 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__FCFetchCoordinator_beginFetchesIfNeededWithLock__block_invoke_3;
  v5[3] = &unk_1E463B200;
  v3 = *(_QWORD *)(a1 + 40);
  v5[4] = v1;
  v5[5] = v3;
  v6 = *(_BYTE *)(a1 + 48);
  return objc_msgSend(v2, "performWithLockSync:", v5);
}

- (id)fetchKey:(id)a3 qualityOfService:(int64_t)a4 completionQueue:(id)a5 completion:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v10 = (void *)MEMORY[0x1E0C99D20];
  v11 = a6;
  v12 = a5;
  v13 = a3;
  objc_msgSend(v10, "arrayWithObjects:count:", &v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCFetchCoordinator fetchKeys:context:qualityOfService:relativePriority:completionQueue:completion:](self, "fetchKeys:context:qualityOfService:relativePriority:completionQueue:completion:", v14, 0, a4, 0, v12, v11, v17, v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)setMaxConcurrentFetchCount:(unint64_t)a3
{
  self->_maxConcurrentFetchCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchThrottler, 0);
  objc_storeStrong((id *)&self->_accessLock, 0);
  objc_storeStrong((id *)&self->_fetchOperationsByGroup, 0);
  objc_storeStrong((id *)&self->_allKeys, 0);
  objc_storeStrong((id *)&self->_fetchGroups, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
