@implementation FCAssetsFetchOperation

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (void)setMaxConcurrentFetchCount:(unint64_t)a3
{
  self->_maxConcurrentFetchCount = a3;
}

- (void)setInterestTokenHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (FCAssetsFetchOperation)initWithAssetHandles:(id)a3
{
  id v4;
  FCAssetsFetchOperation *v5;
  uint64_t v6;
  NSArray *assetHandles;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCAssetsFetchOperation;
  v5 = -[FCFetchOperation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    assetHandles = v5->_assetHandles;
    v5->_assetHandles = (NSArray *)v6;

  }
  return v5;
}

- (void)performOperation
{
  FCAssetsFetchOperation *v2;
  unint64_t v3;
  NSArray *v4;
  void *v5;
  void (**v6)(_QWORD, __n128);
  NSArray *assetHandles;
  NSArray *v8;
  __n128 v9;
  NSArray *v10;
  dispatch_group_t v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  dispatch_semaphore_t v18;
  NSArray *v19;
  NSArray *v20;
  NSObject *v21;
  NSArray *v22;
  NSArray *v23;
  NSObject *v24;
  _QWORD v25[5];
  _QWORD v26[4];
  NSObject *v27;
  FCAssetsFetchOperation *v28;
  NSObject *v29;
  id v30;
  _QWORD v31[4];
  NSObject *v32;
  id v33;
  _QWORD aBlock[5];
  id v35;
  _QWORD *v36;
  _QWORD v37[4];

  v2 = self;
  if (self)
    self = (FCAssetsFetchOperation *)self->_assetHandles;
  v3 = -[FCAssetsFetchOperation fc_countOfObjectsPassingTest:](self, "fc_countOfObjectsPassingTest:", &__block_literal_global_188);
  if (-[FCFetchOperation cachePolicy](v2, "cachePolicy") == 3
    || (!v2 ? (v4 = 0) : (v4 = v2->_assetHandles), v3 == -[NSArray count](v4, "count")))
  {
    -[FCAssetsFetchOperation progressHandler](v2, "progressHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[FCAssetsFetchOperation progressHandler](v2, "progressHandler");
      v6 = (void (**)(_QWORD, __n128))objc_claimAutoreleasedReturnValue();
      if (v2)
        assetHandles = v2->_assetHandles;
      else
        assetHandles = 0;
      v8 = assetHandles;
      if (-[NSArray count](v8, "count"))
      {
        if (v2)
          v10 = v2->_assetHandles;
        else
          v10 = 0;
        v9.n128_f64[0] = (double)v3 / (double)-[NSArray count](v10, "count");
      }
      else
      {
        v9.n128_u64[0] = 1.0;
      }
      v6[2](v6, v9);

    }
    -[FCAssetsFetchOperation _finish]((id *)&v2->super.super.super.super.isa);
  }
  else
  {
    v11 = dispatch_group_create();
    v12 = objc_alloc_init(MEMORY[0x1E0D60B18]);
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    v13 = MEMORY[0x1E0C809B0];
    v37[3] = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __42__FCAssetsFetchOperation_performOperation__block_invoke_2;
    aBlock[3] = &unk_1E464B2E8;
    aBlock[4] = v2;
    v14 = v12;
    v35 = v14;
    v36 = v37;
    v15 = _Block_copy(aBlock);
    if (-[FCAssetsFetchOperation maxConcurrentFetchCount](v2, "maxConcurrentFetchCount"))
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = dispatch_queue_create("FCAssetsFetchOperation.serial", v16);
      if (v2)
        objc_storeStrong((id *)&v2->_serialQueue, v17);

      v18 = dispatch_semaphore_create(-[FCAssetsFetchOperation maxConcurrentFetchCount](v2, "maxConcurrentFetchCount"));
      if (v2)
        v19 = v2->_assetHandles;
      else
        v19 = 0;
      v20 = v19;
      v26[0] = v13;
      v26[1] = 3221225472;
      v26[2] = __42__FCAssetsFetchOperation_performOperation__block_invoke_7;
      v26[3] = &unk_1E464B338;
      v27 = v11;
      v28 = v2;
      v21 = v18;
      v29 = v21;
      v30 = v15;
      -[NSArray enumerateObjectsUsingBlock:](v20, "enumerateObjectsUsingBlock:", v26);

    }
    else
    {
      if (v2)
        v22 = v2->_assetHandles;
      else
        v22 = 0;
      v23 = v22;
      v31[0] = v13;
      v31[1] = 3221225472;
      v31[2] = __42__FCAssetsFetchOperation_performOperation__block_invoke_5;
      v31[3] = &unk_1E464B310;
      v32 = v11;
      v33 = v15;
      -[NSArray enumerateObjectsUsingBlock:](v23, "enumerateObjectsUsingBlock:", v31);

      v21 = v32;
    }

    if (FCDispatchGroupIsEmpty(v11))
    {
      -[FCAssetsFetchOperation _finish]((id *)&v2->super.super.super.super.isa);
    }
    else
    {
      FCDispatchQueueForQualityOfService(-[FCAssetsFetchOperation qualityOfService](v2, "qualityOfService"));
      v24 = objc_claimAutoreleasedReturnValue();
      v25[0] = v13;
      v25[1] = 3221225472;
      v25[2] = __42__FCAssetsFetchOperation_performOperation__block_invoke_11;
      v25[3] = &unk_1E463AB18;
      v25[4] = v2;
      dispatch_group_notify(v11, v24, v25);

    }
    _Block_object_dispose(v37, 8);

  }
}

BOOL __42__FCAssetsFetchOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "dataProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)_finish
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v2 = a1[56];
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v3)
    {
      v4 = v3;
      v5 = 0;
      v6 = 0;
      v7 = *(_QWORD *)v27;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v27 != v7)
            objc_enumerationMutation(v2);
          v9 = *(_QWORD **)(*((_QWORD *)&v26 + 1) + 8 * v8);
          objc_msgSend(v9, "dataProvider", v24);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            objc_msgSend(a1, "interestTokenHandler");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            if (v11)
            {
              objc_msgSend(a1, "interestTokenHandler");
              v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              if (v9)
                v13 = (void *)v9[11];
              else
                v13 = 0;
              v14 = v13;
              ((void (**)(_QWORD, id))v12)[2](v12, v14);

            }
            v6 = 1;
          }
          else
          {
            objc_msgSend(v9, "remoteURL");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "absoluteString");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", v16);

            if (!v5)
            {
              objc_msgSend(v9, "downloadError");
              v5 = (id)objc_claimAutoreleasedReturnValue();
            }
          }
          ++v8;
        }
        while (v4 != v8);
        v17 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        v4 = v17;
      }
      while (v17);

      if ((v6 & 1) != 0)
        goto LABEL_26;
    }
    else
    {

      v5 = 0;
    }
    if (objc_msgSend(a1[56], "count", v24))
    {
      v5 = v5;
      v18 = v5;
      if (!v5)
      {
        if (objc_msgSend(a1, "cachePolicy") == 3)
          objc_msgSend(MEMORY[0x1E0CB35C8], "fc_notCachedError");
        else
          objc_msgSend(MEMORY[0x1E0CB35C8], "fc_missingAssetErrorWithAssetHandles:", a1[56]);
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      +[FCFetchOperationResult resultWithStatus:fetchedObject:error:](FCFetchOperationResult, "resultWithStatus:fetchedObject:error:", 3, 0, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    }
LABEL_26:
    if (a1[56])
      v19 = a1[56];
    else
      v19 = (id)MEMORY[0x1E0C9AA60];
    +[FCFetchOperationResult resultWithStatus:fetchedObject:error:](FCFetchOperationResult, "resultWithStatus:fetchedObject:error:", 0, v19, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "archiveHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
      goto LABEL_38;
    v18 = a1[56];
    v22 = objc_msgSend(a1, "maxConcurrentFetchCount");
    if (v22)
      v23 = v22;
    else
      v23 = -1;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __33__FCAssetsFetchOperation__finish__block_invoke;
    v25[3] = &unk_1E4640710;
    v25[4] = a1;
    objc_msgSend(v18, "fc_visitSubarraysWithMaxCount:block:", v23, v25);
LABEL_37:

LABEL_38:
    objc_msgSend(v20, "setMissingObjectDescriptions:", v24);
    objc_msgSend(a1, "finishExecutingWithResult:", v20);

  }
}

- (id)interestTokenHandler
{
  return self->_interestTokenHandler;
}

- (id)archiveHandler
{
  return self->_archiveHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_assetHandles, 0);
  objc_storeStrong(&self->_archiveHandler, 0);
  objc_storeStrong(&self->_interestTokenHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
}

- (FCAssetsFetchOperation)initWithAssetHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  FCAssetsFetchOperation *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[FCAssetsFetchOperation initWithAssetHandles:](self, "initWithAssetHandles:", v6);

  }
  else
  {
    v7 = -[FCAssetsFetchOperation initWithAssetHandles:](self, "initWithAssetHandles:", MEMORY[0x1E0C9AA60]);
  }

  return v7;
}

void __42__FCAssetsFetchOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(_QWORD *, uint64_t, uint64_t);
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  v8 = objc_msgSend(v6, "relativePriority");
  v9 = objc_msgSend(*(id *)(a1 + 32), "flags");
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __42__FCAssetsFetchOperation_performOperation__block_invoke_3;
  v17 = &unk_1E464B2C0;
  v10 = *(id *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v19 = v11;
  v21 = *(_QWORD *)(a1 + 48);
  v12 = v5;
  v20 = v12;
  objc_msgSend(v7, "fetchDataProviderWithPriority:flags:completion:", v8, v9, &v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v13, v14, v15, v16, v17, v18, v19);

}

uint64_t __42__FCAssetsFetchOperation_performOperation__block_invoke_3(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  _QWORD v7[6];

  if (!a3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__FCAssetsFetchOperation_performOperation__block_invoke_4;
    v7[3] = &unk_1E463DF90;
    v4 = (void *)a1[4];
    v5 = a1[7];
    v7[4] = a1[5];
    v7[5] = v5;
    objc_msgSend(v4, "performWithLockSync:", v7);
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __42__FCAssetsFetchOperation_performOperation__block_invoke_4(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, double);
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "progressHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "progressHandler");
    v3 = (void (**)(_QWORD, double))objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      v5 = *(void **)(v4 + 448);
    else
      v5 = 0;
    v3[2](v3, (double)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)/ (double)(unint64_t)objc_msgSend(v5, "count"));

  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void __42__FCAssetsFetchOperation_performOperation__block_invoke_5(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v3 = *(NSObject **)(a1 + 32);
  v4 = a2;
  dispatch_group_enter(v3);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__FCAssetsFetchOperation_performOperation__block_invoke_6;
  v6[3] = &unk_1E463AB18;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, id, _QWORD *))(v5 + 16))(v5, v4, v6);

}

void __42__FCAssetsFetchOperation_performOperation__block_invoke_6(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __42__FCAssetsFetchOperation_performOperation__block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v4 = *(_QWORD **)(a1 + 40);
  if (v4)
    v5 = (void *)v4[57];
  else
    v5 = 0;
  v6 = v5;
  v7 = objc_msgSend(v4, "qualityOfService");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__FCAssetsFetchOperation_performOperation__block_invoke_8;
  v10[3] = &unk_1E4647DB0;
  v11 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v12 = v3;
  v13 = *(id *)(a1 + 32);
  v8 = v3;
  FCBlockWithQualityOfService(v7, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v6, v9);

}

void __42__FCAssetsFetchOperation_performOperation__block_invoke_8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__FCAssetsFetchOperation_performOperation__block_invoke_9;
  v4[3] = &unk_1E463AD10;
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 56);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, uint64_t, _QWORD *))(v3 + 16))(v3, v2, v4);

}

intptr_t __42__FCAssetsFetchOperation_performOperation__block_invoke_9(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __42__FCAssetsFetchOperation_performOperation__block_invoke_11(uint64_t a1)
{
  -[FCAssetsFetchOperation _finish](*(id **)(a1 + 32));
}

void __33__FCAssetsFetchOperation__finish__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void (**v5)(id, void *);

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "archiveHandler");
  v5 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentArchive");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5[2](v5, v4);
}

- (unint64_t)maxConcurrentFetchCount
{
  return self->_maxConcurrentFetchCount;
}

- (void)setArchiveHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

@end
