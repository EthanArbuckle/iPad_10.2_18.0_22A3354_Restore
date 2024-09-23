@implementation MTSyncChangeQueue

- (MTSyncChangeQueue)initWithChangeStore:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  dispatch_group_t v14;
  void *v15;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MTSyncChangeQueue;
  v6 = -[MTSyncChangeQueue init](&v17, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)+[MTScheduler defaultPriority](MTScheduler, "defaultPriority"), -1);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.MTSyncChangeQueue.serial", v7);
    v9 = (void *)*((_QWORD *)v6 + 1);
    *((_QWORD *)v6 + 1) = v8;

    objc_msgSend(MEMORY[0x1E0D519E8], "schedulerWithDispatchQueue:", *((_QWORD *)v6 + 1));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v6 + 2);
    *((_QWORD *)v6 + 2) = v10;

    objc_storeStrong((id *)v6 + 4, a3);
    v12 = objc_opt_new();
    v13 = (void *)*((_QWORD *)v6 + 5);
    *((_QWORD *)v6 + 5) = v12;

    v14 = dispatch_group_create();
    v15 = (void *)*((_QWORD *)v6 + 3);
    *((_QWORD *)v6 + 3) = v14;

    dispatch_group_enter(*((dispatch_group_t *)v6 + 3));
  }

  return (MTSyncChangeQueue *)v6;
}

- (void)loadChanges
{
  NSObject *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  uint8_t buf[4];
  MTSyncChangeQueue *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v8 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_INFO, "%{public}@ loading changes", buf, 0xCu);
  }

  -[MTSyncChangeStore loadChanges](self->_changeStore, "loadChanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__MTSyncChangeQueue_loadChanges__block_invoke;
  v6[3] = &unk_1E39CE6F0;
  v6[4] = self;
  v5 = (id)objc_msgSend(v4, "addSuccessBlock:", v6);

}

void __32__MTSyncChangeQueue_loadChanges__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__MTSyncChangeQueue_loadChanges__block_invoke_2;
  v7[3] = &unk_1E39CB7B0;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "performBlock:", v7);

}

void __32__MTSyncChangeQueue_loadChanges__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(6);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = objc_msgSend(*(id *)(a1 + 40), "count");
    v5 = 138543618;
    v6 = v3;
    v7 = 2048;
    v8 = v4;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_INFO, "%{public}@ loaded %lu changes", (uint8_t *)&v5, 0x16u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)performBlockOnceChangesAreLoaded:(id)a3 async:(BOOL)a4
{
  NSObject *changesLoaded;
  id v6;

  changesLoaded = self->_changesLoaded;
  if (a4)
  {
    dispatch_group_notify(changesLoaded, (dispatch_queue_t)self->_serialQueue, a3);
  }
  else
  {
    v6 = a3;
    dispatch_group_wait(changesLoaded, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_sync((dispatch_queue_t)self->_serialQueue, v6);
  }

}

- (void)persistChanges
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __35__MTSyncChangeQueue_persistChanges__block_invoke;
  v2[3] = &unk_1E39CB858;
  v2[4] = self;
  -[MTSyncChangeQueue performBlockOnceChangesAreLoaded:async:](self, "performBlockOnceChangesAreLoaded:async:", v2, 1);
}

void __35__MTSyncChangeQueue_persistChanges__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  v3 = (id)objc_msgSend(*(id *)(v1 + 40), "copy");
  objc_msgSend(v2, "persistChanges:", v3);

}

- (void)enqueueChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  MTSyncChangeQueue *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__MTSyncChangeQueue_enqueueChange___block_invoke;
  v6[3] = &unk_1E39CB7B0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[MTSyncChangeQueue performBlockOnceChangesAreLoaded:async:](self, "performBlockOnceChangesAreLoaded:async:", v6, 1);

}

uint64_t __35__MTSyncChangeQueue_enqueueChange___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;

  v2 = (uint64_t *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "syncType"))
  {
    MTLogForCategory(6);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __35__MTSyncChangeQueue_enqueueChange___block_invoke_cold_1(a1, v2, v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_enqueueAction:", *(_QWORD *)(a1 + 32));
  }
  return objc_msgSend(*(id *)(a1 + 40), "persistChanges");
}

- (void)_enqueueAction:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MTSyncChangeQueue *v9;
  uint8_t buf[4];
  MTSyncChangeQueue *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(6);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_INFO, "%{public}@ enqueuing action %{public}@", buf, 0x16u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__MTSyncChangeQueue__enqueueAction___block_invoke;
  v7[3] = &unk_1E39CF180;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[MTSyncChangeQueue _enqueueChange:changeCompareBlock:](self, "_enqueueChange:changeCompareBlock:", v6, v7);

}

uint64_t __36__MTSyncChangeQueue__enqueueAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "syncType")
    && (objc_msgSend(*(id *)(a1 + 32), "syncIdentifier"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "syncIdentifier"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v4, "isEqualToString:", v5),
        v5,
        v4,
        (v6 & 1) == 0))
  {
    MTLogForCategory(6);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v11 = 138543618;
      v12 = v9;
      v13 = 2114;
      v14 = v3;
      _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%{public}@ jumping over pending change %{public}@", (uint8_t *)&v11, 0x16u);
    }

    v7 = 2;
  }
  else
  {
    v7 = 4;
  }

  return v7;
}

- (void)_enqueueChange:(id)a3 changeCompareBlock:(id)a4
{
  uint64_t (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  NSMutableArray *v23;
  NSMutableArray *changeQueue;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  __int128 v30;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  MTSyncChangeQueue *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v6 = (uint64_t (**)(id, _QWORD))a4;
  v7 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[NSMutableArray reverseObjectEnumerator](self->_changeQueue, "reverseObjectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
  if (!v9)
  {

LABEL_27:
    objc_msgSend(v7, "addObject:", v32, v30);
    goto LABEL_28;
  }
  v11 = v9;
  v12 = 0;
  v13 = *(_QWORD *)v38;
  v14 = 1;
  *(_QWORD *)&v10 = 138543874;
  v30 = v10;
  do
  {
    v15 = 0;
    do
    {
      if (*(_QWORD *)v38 != v13)
        objc_enumerationMutation(v8);
      v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v15);
      if ((v14 & 1) != 0)
      {
        v12 = v6[2](v6, *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v15));
        v14 = 1;
        switch(v12)
        {
          case 0uLL:
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTSyncChangeQueue.m"), 150, CFSTR("Undetermined enqueue result returned"));

            v12 = 0;
            v14 = 1;
            break;
          case 1uLL:
            objc_msgSend(v7, "addObject:", v32);
            objc_msgSend(v7, "addObject:", v16);
            v14 = 0;
            v12 = 1;
            break;
          case 2uLL:
            objc_msgSend(v7, "addObject:", v16);
            v14 = 1;
            v12 = 2;
            break;
          case 3uLL:
            objc_msgSend(v16, "merge:", v32);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              v19 = v7;
              v20 = v18;
            }
            else
            {
              MTLogForCategory(6);
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v30;
                v43 = self;
                v44 = 2114;
                v45 = v32;
                v46 = 2114;
                v47 = v16;
                _os_log_error_impl(&dword_19AC4E000, v21, OS_LOG_TYPE_ERROR, "%{public}@ unable to merge %{public}@ into %{public}@", buf, 0x20u);
              }

              v19 = v7;
              v20 = v16;
            }
            objc_msgSend(v19, "addObject:", v20, v30);

            v14 = 0;
            v12 = 3;
            break;
          case 5uLL:
            objc_msgSend(v7, "addObject:", v16);
            v14 = 0;
            v12 = 5;
            break;
          case 6uLL:
            v14 = 0;
            v12 = 6;
            break;
          default:
            break;
        }
      }
      else
      {
        objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v15));
        v14 = 0;
      }
      ++v15;
    }
    while (v11 != v15);
    v22 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
    v11 = v22;
  }
  while (v22);

  if (v12 <= 4 && ((1 << v12) & 0x15) != 0)
    goto LABEL_27;
LABEL_28:
  v23 = (NSMutableArray *)objc_opt_new();
  changeQueue = self->_changeQueue;
  self->_changeQueue = v23;

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v7, "reverseObjectEnumerator");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v34 != v28)
          objc_enumerationMutation(v25);
        -[NSMutableArray addObject:](self->_changeQueue, "addObject:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i), v30);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v27);
  }

}

- (void)dequeueChanges:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__MTSyncChangeQueue_dequeueChanges___block_invoke;
  v6[3] = &unk_1E39CB7B0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MTSyncChangeQueue performBlockOnceChangesAreLoaded:async:](self, "performBlockOnceChangesAreLoaded:async:", v6, 1);

}

uint64_t __36__MTSyncChangeQueue_dequeueChanges___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(6);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ dequeing changes %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectsInArray:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "persistChanges");
}

- (BOOL)hasPendingChanges
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__MTSyncChangeQueue_hasPendingChanges__block_invoke;
  v4[3] = &unk_1E39CBB50;
  v4[4] = self;
  v4[5] = &v5;
  -[MTSyncChangeQueue performBlockOnceChangesAreLoaded:async:](self, "performBlockOnceChangesAreLoaded:async:", v4, 0);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __38__MTSyncChangeQueue_hasPendingChanges__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (id)pendingChanges
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__17;
  v9 = __Block_byref_object_dispose__17;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__MTSyncChangeQueue_pendingChanges__block_invoke;
  v4[3] = &unk_1E39CBB50;
  v4[4] = self;
  v4[5] = &v5;
  -[MTSyncChangeQueue performBlockOnceChangesAreLoaded:async:](self, "performBlockOnceChangesAreLoaded:async:", v4, 0);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __35__MTSyncChangeQueue_pendingChanges__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)removePendingChanges
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __41__MTSyncChangeQueue_removePendingChanges__block_invoke;
  v2[3] = &unk_1E39CB858;
  v2[4] = self;
  -[MTSyncChangeQueue performBlockOnceChangesAreLoaded:async:](self, "performBlockOnceChangesAreLoaded:async:", v2, 1);
}

uint64_t __41__MTSyncChangeQueue_removePendingChanges__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
  return objc_msgSend(*(id *)(a1 + 32), "persistChanges");
}

- (id)resolveChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__17;
  v15 = __Block_byref_object_dispose__17;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__MTSyncChangeQueue_resolveChange___block_invoke;
  v8[3] = &unk_1E39CB8A8;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[MTSyncChangeQueue performBlockOnceChangesAreLoaded:async:](self, "performBlockOnceChangesAreLoaded:async:", v8, 0);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __35__MTSyncChangeQueue_resolveChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_resolveChange:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "persistChanges");
}

- (id)_resolveChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v8[5];
  uint8_t buf[4];
  MTSyncChangeQueue *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(6);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_INFO, "%{public}@ resolving incoming change %{public}@", buf, 0x16u);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__MTSyncChangeQueue__resolveChange___block_invoke;
  v8[3] = &unk_1E39CF1A8;
  v8[4] = self;
  -[MTSyncChangeQueue _resolveChange:resolutionHandler:](self, "_resolveChange:resolutionHandler:", v4, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __36__MTSyncChangeQueue__resolveChange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "conflicts:", v5))
  {
    MTLogForCategory(6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v16 = 138543874;
      v17 = v8;
      v18 = 2114;
      v19 = v5;
      v20 = 2114;
      v21 = v6;
      _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ incoming change %{public}@ conflicts with pending change %{public}@", (uint8_t *)&v16, 0x20u);
    }

    objc_msgSend(v6, "preferred:", v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    MTLogForCategory(6);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9 == v5)
    {
      if (v11)
      {
        v14 = *(_QWORD *)(a1 + 32);
        v16 = 138543618;
        v17 = v14;
        v18 = 2114;
        v19 = v6;
        _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ dropping conflicting pending change %{public}@", (uint8_t *)&v16, 0x16u);
      }
      v13 = 4;
    }
    else
    {
      if (v11)
      {
        v12 = *(_QWORD *)(a1 + 32);
        v16 = 138543618;
        v17 = v12;
        v18 = 2114;
        v19 = v5;
        _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ dropping conflicting incoming change %{public}@", (uint8_t *)&v16, 0x16u);
      }
      v13 = 5;
    }

  }
  else
  {
    v13 = 2;
  }

  return v13;
}

- (id)_resolveChange:(id)a3 resolutionHandler:(id)a4
{
  id v7;
  uint64_t (**v8)(id, id, _QWORD);
  void *v9;
  id v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSMutableArray *v19;
  NSMutableArray *changeQueue;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (uint64_t (**)(id, id, _QWORD))a4;
  v9 = (void *)objc_opt_new();
  v10 = v7;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = self->_changeQueue;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  v22 = v10;
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (!v10)
        {
LABEL_10:
          objc_msgSend(v9, "addObject:", v16);
          continue;
        }
        v17 = v8[2](v8, v10, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
        switch(v17)
        {
          case 5:
            objc_msgSend(v9, "addObject:", v16);

            v10 = 0;
            break;
          case 4:
            continue;
          case 2:
            goto LABEL_10;
          default:
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTSyncChangeQueue.m"), 262, CFSTR("Invalid conflict result returned"));

            break;
        }
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
  }

  v19 = (NSMutableArray *)objc_msgSend(v9, "mutableCopy");
  changeQueue = self->_changeQueue;
  self->_changeQueue = v19;

  return v10;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
  objc_storeStrong((id *)&self->_serializer, a3);
}

- (OS_dispatch_group)changesLoaded
{
  return self->_changesLoaded;
}

- (void)setChangesLoaded:(id)a3
{
  objc_storeStrong((id *)&self->_changesLoaded, a3);
}

- (MTSyncChangeStore)changeStore
{
  return self->_changeStore;
}

- (void)setChangeStore:(id)a3
{
  objc_storeStrong((id *)&self->_changeStore, a3);
}

- (NSMutableArray)changeQueue
{
  return self->_changeQueue;
}

- (void)setChangeQueue:(id)a3
{
  objc_storeStrong((id *)&self->_changeQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeQueue, 0);
  objc_storeStrong((id *)&self->_changeStore, 0);
  objc_storeStrong((id *)&self->_changesLoaded, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __35__MTSyncChangeQueue_enqueueChange___block_invoke_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *a2;
  v5 = 138543618;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  _os_log_error_impl(&dword_19AC4E000, log, OS_LOG_TYPE_ERROR, "%{public}@ unsupported change type %{public}@", (uint8_t *)&v5, 0x16u);
}

@end
