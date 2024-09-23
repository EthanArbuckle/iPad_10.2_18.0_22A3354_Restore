@implementation MKPlaceBatchController

- (MKPlaceBatchController)initWithItemIdentifiers:(id)a3 withBatchSize:(unint64_t)a4 minimumNumberOfItemBeforeFetching:(unint64_t)a5 shouldLoadFirstBatchImmediately:(BOOL)a6 usingBatchFetcher:(id)a7 usingBatchConsumer:(id)a8 displayedItemCount:(unint64_t)a9
{
  _BOOL4 v11;
  id v15;
  id v16;
  id v17;
  char *v18;
  uint64_t v19;
  MKPlaceBatchController *v20;
  uint64_t v21;
  void *v22;
  objc_super v24;

  v11 = a6;
  v15 = a3;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)MKPlaceBatchController;
  v18 = -[MKPlaceBatchController init](&v24, sel_init);
  if (!v18)
    goto LABEL_8;
  v19 = objc_msgSend(v15, "count");
  v20 = 0;
  if (a5 <= a4 && a4 && v19)
  {
    *((_QWORD *)v18 + 9) = a4;
    *((_QWORD *)v18 + 10) = a5;
    objc_storeWeak((id *)v18 + 11, v16);
    objc_storeWeak((id *)v18 + 12, v17);
    geo_dispatch_queue_create_with_qos();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)*((_QWORD *)v18 + 8);
    *((_QWORD *)v18 + 8) = v21;

    objc_msgSend(v18, "buildBatchesFromIdentifiers:", v15);
    *(_OWORD *)(v18 + 24) = xmmword_18B2A9250;
    *((_QWORD *)v18 + 1) = 0;
    if (v11)
    {
      *((_QWORD *)v18 + 7) = 0;
      objc_msgSend(v18, "didDisplayItemAtIndex:", a5);
    }
    else
    {
      *((_QWORD *)v18 + 7) = a9;
    }
LABEL_8:
    v20 = v18;
  }

  return v20;
}

- (void)didDisplayItemAtIndex:(unint64_t)a3
{
  NSObject *batchControllerQueue;
  _QWORD v4[6];

  batchControllerQueue = self->_batchControllerQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__MKPlaceBatchController_didDisplayItemAtIndex___block_invoke;
  v4[3] = &unk_1E20D7DC0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(batchControllerQueue, v4);
}

void __48__MKPlaceBatchController_didDisplayItemAtIndex___block_invoke(uint64_t a1)
{
  unint64_t v1;
  _QWORD *v2;
  NSObject *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  if (v1 <= v2[6] + v2[7] && v2[1] <= (int64_t)v1)
  {
    v2[1] = v1;
    MKGetCuratedCollectionsBatchControllerLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v20 = 134217984;
      v21 = v5;
      _os_log_impl(&dword_18B0B0000, v4, OS_LOG_TYPE_DEBUG, "[<-->] Last displayed cell : %ld", (uint8_t *)&v20, 0xCu);
    }

    v6 = *(_QWORD **)(a1 + 32);
    if (v6[4] != 1)
    {
      v6[4] = 2;
      v6 = *(_QWORD **)(a1 + 32);
    }
    v7 = v6[1];
    v8 = v6[7];
    v9 = objc_msgSend(v6, "minNumberOfItems");
    v10 = v8 - v9;
    if (v8 - v9 < 0)
      v10 = v9 - v8;
    if (v7 >= v10)
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(v11 + 24);
      if (v12 < objc_msgSend(*(id *)(v11 + 40), "count") - 1)
      {
        v13 = *(_QWORD *)(a1 + 32);
        if (*(_QWORD *)(v13 + 32) != 1)
        {
          ++*(_QWORD *)(v13 + 24);
          v14 = *(_QWORD *)(a1 + 32);
          v15 = *(_QWORD *)(v14 + 24);
          if (v15 < objc_msgSend(*(id *)(v14 + 40), "count"))
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectAtIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 1;
            MKGetCuratedCollectionsBatchControllerLog();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
              v19 = objc_msgSend(v16, "count");
              v20 = 134218240;
              v21 = v18;
              v22 = 2048;
              v23 = v19;
              _os_log_impl(&dword_18B0B0000, v17, OS_LOG_TYPE_INFO, "[<-->] Started Fetching Batch: %ld of %ld Items", (uint8_t *)&v20, 0x16u);
            }

            objc_msgSend(*(id *)(a1 + 32), "fetchBatchItemsWithIdentifiers:", v16);
          }
        }
      }
    }
  }
}

- (void)fetchBatchItemsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  -[MKPlaceBatchController batchConsumer](self, "batchConsumer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MKPlaceBatchController batchConsumer](self, "batchConsumer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didStartFetchingBatch");

  }
  objc_initWeak(&location, self);
  -[MKPlaceBatchController batchFetcher](self, "batchFetcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__MKPlaceBatchController_fetchBatchItemsWithIdentifiers___block_invoke;
  v9[3] = &unk_1E20D7DE8;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v8, "fetchGuidesWithIdentifiers:completion:", v4, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __57__MKPlaceBatchController_fetchBatchItemsWithIdentifiers___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleFetchGuidesCompleted:error:usingGuides:", a2, v10, v7);

}

- (void)handleFetchGuidesCompleted:(BOOL)a3 error:(id)a4 usingGuides:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  int64_t lastFetchedBatch;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  int64_t v18;
  unint64_t totalIdentifiersFetched;
  int v20;
  int64_t v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v6 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v8)
  {
    --self->_lastFetchedBatch;
    self->_state = 3;
    MKGetCuratedCollectionsBatchControllerLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      lastFetchedBatch = self->_lastFetchedBatch;
      v20 = 134218242;
      v21 = lastFetchedBatch;
      v22 = 2112;
      v23 = (unint64_t)v8;
      _os_log_impl(&dword_18B0B0000, v11, OS_LOG_TYPE_INFO, "[<-->] Failed Fetching Batch: %ld. Informing cosumer. Error: %@", (uint8_t *)&v20, 0x16u);
    }

    -[MKPlaceBatchController batchConsumer](self, "batchConsumer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = 0;
    v16 = 0;
LABEL_9:
    objc_msgSend(v13, "shouldConsumeBatch:fetchedBatch:", v15, v16);

    goto LABEL_10;
  }
  if (v6)
  {
    self->_state = 2;
    self->_totalIdentifiersFetched += objc_msgSend(v9, "count");
    MKGetCuratedCollectionsBatchControllerLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = self->_lastFetchedBatch;
      totalIdentifiersFetched = self->_totalIdentifiersFetched;
      v20 = 134218240;
      v21 = v18;
      v22 = 2048;
      v23 = totalIdentifiersFetched;
      _os_log_impl(&dword_18B0B0000, v17, OS_LOG_TYPE_INFO, "[<-->] Finished Fetching Batch: %ld. Informing cosumer.. Total Identifiers fetched: %ld", (uint8_t *)&v20, 0x16u);
    }

    -[MKPlaceBatchController batchConsumer](self, "batchConsumer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = 1;
    v16 = v10;
    goto LABEL_9;
  }
LABEL_10:

}

- (void)buildBatchesFromIdentifiers:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *batches;
  NSObject *v18;
  NSUInteger v19;
  int v20;
  NSUInteger v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_totalIdentifiers = objc_msgSend(v4, "count");
  v5 = -[MKPlaceBatchController batchSize](self, "batchSize");
  v6 = objc_msgSend(v4, "count") / v5;
  if (objc_msgSend(v4, "count") % v5)
    v7 = v6 + 1;
  else
    v7 = v6;
  self->_numberOfBatches = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", self->_numberOfBatches);
  if (self->_totalIdentifiers)
  {
    v10 = 0;
    v11 = 0;
    v12 = v5;
    do
    {
      v13 = v11 + v5;
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectsAtIndexes:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v15);

      v10 -= v5;
      v12 += v5;
      v11 = v13;
    }
    while (v13 < self->_totalIdentifiers);
  }
  v16 = (NSArray *)objc_msgSend(v8, "copy");
  batches = self->_batches;
  self->_batches = v16;

  MKGetCuratedCollectionsBatchControllerLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v19 = -[NSArray count](self->_batches, "count");
    v20 = 134218496;
    v21 = v19;
    v22 = 2048;
    v23 = objc_msgSend(v4, "count");
    v24 = 2048;
    v25 = v5;
    _os_log_impl(&dword_18B0B0000, v18, OS_LOG_TYPE_DEBUG, "[<-->] Built %ld batches from %ld identifiers. Maximum batch size: %ld", (uint8_t *)&v20, 0x20u);
  }

}

- (id)batchesForTesting
{
  NSObject *batchControllerQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  batchControllerQueue = self->_batchControllerQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__MKPlaceBatchController_batchesForTesting__block_invoke;
  v5[3] = &unk_1E20D7E10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(batchControllerQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__MKPlaceBatchController_batchesForTesting__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

- (int64_t)lastDisplayedIndexForTesting
{
  NSObject *batchControllerQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  batchControllerQueue = self->_batchControllerQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__MKPlaceBatchController_lastDisplayedIndexForTesting__block_invoke;
  v5[3] = &unk_1E20D7E10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(batchControllerQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__MKPlaceBatchController_lastDisplayedIndexForTesting__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

- (int64_t)lastFetchedBatchForTesting
{
  NSObject *batchControllerQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  batchControllerQueue = self->_batchControllerQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__MKPlaceBatchController_lastFetchedBatchForTesting__block_invoke;
  v5[3] = &unk_1E20D7E10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(batchControllerQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__MKPlaceBatchController_lastFetchedBatchForTesting__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

- (int64_t)stateForTesting
{
  NSObject *batchControllerQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  batchControllerQueue = self->_batchControllerQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__MKPlaceBatchController_stateForTesting__block_invoke;
  v5[3] = &unk_1E20D7E10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(batchControllerQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__MKPlaceBatchController_stateForTesting__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (unint64_t)minNumberOfItems
{
  return self->_minNumberOfItems;
}

- (void)setMinNumberOfItems:(unint64_t)a3
{
  self->_minNumberOfItems = a3;
}

- (MKPlaceBatchFetcher)batchFetcher
{
  return (MKPlaceBatchFetcher *)objc_loadWeakRetained((id *)&self->_batchFetcher);
}

- (void)setBatchFetcher:(id)a3
{
  objc_storeWeak((id *)&self->_batchFetcher, a3);
}

- (MKPlaceBatchConsumer)batchConsumer
{
  return (MKPlaceBatchConsumer *)objc_loadWeakRetained((id *)&self->_batchConsumer);
}

- (void)setBatchConsumer:(id)a3
{
  objc_storeWeak((id *)&self->_batchConsumer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_batchConsumer);
  objc_destroyWeak((id *)&self->_batchFetcher);
  objc_storeStrong((id *)&self->_batchControllerQueue, 0);
  objc_storeStrong((id *)&self->_batches, 0);
}

@end
