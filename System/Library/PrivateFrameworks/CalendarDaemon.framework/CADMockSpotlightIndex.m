@implementation CADMockSpotlightIndex

- (CADMockSpotlightIndex)initWithProvider:(id)a3
{
  id v4;
  CADMockSpotlightIndex *v5;
  CADMockSpotlightIndex *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CADMockSpotlightIndex;
  v5 = -[CADMockSpotlightIndex init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_provider, v4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("CADMockSpotlightIndex", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

  }
  return v6;
}

- (double)_artificialDelay
{
  CADMockSpotlightIndexProvider **p_provider;
  id WeakRetained;
  double v4;
  uint64_t v5;
  id v6;
  double v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  p_provider = &self->_provider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  objc_msgSend(WeakRetained, "minArtificialDelay");
  v5 = (uint64_t)(v4 * 1000.0);

  v6 = objc_loadWeakRetained((id *)p_provider);
  objc_msgSend(v6, "maxArtificialDelay");
  v8 = (uint64_t)(v7 * 1000.0);

  v9 = v5 & ~(v5 >> 63);
  v10 = v8 & ~(v8 >> 63);
  if (v9 >= v10)
    v11 = v8 & ~(v8 >> 63);
  else
    v11 = v5 & ~(v5 >> 63);
  if (v10 > v9)
    v11 += arc4random_uniform(v10 - v11 + 1);
  return (double)v11 / 1000.0;
}

- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  double v8;
  dispatch_time_t v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[CADMockSpotlightIndex _artificialDelay](self, "_artificialDelay");
  v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__CADMockSpotlightIndex_deleteSearchableItemsWithDomainIdentifiers_completionHandler___block_invoke;
  block[3] = &unk_1E6A37650;
  v14 = v6;
  v15 = v7;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  dispatch_after(v9, queue, block);

}

void __86__CADMockSpotlightIndex_deleteSearchableItemsWithDomainIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  int v3;
  uint64_t v4;
  id WeakRetained;
  id v6;

  if ((objc_msgSend(*(id *)(a1 + 32), "_incrementAndCheckIfShouldFailCall") & 1) != 0
    || (v2 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8)),
        v3 = objc_msgSend(v2, "failDeleteSearchableItemsWithDomainIdentifiers"),
        v2,
        v3))
  {
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "_mockFailureError");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(WeakRetained, "deleteSearchableItemsWithDomainIdentifiers:", *(_QWORD *)(a1 + 40));

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

- (void)indexSearchableItems:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  double v8;
  dispatch_time_t v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[CADMockSpotlightIndex _artificialDelay](self, "_artificialDelay");
  v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__CADMockSpotlightIndex_indexSearchableItems_completionHandler___block_invoke;
  block[3] = &unk_1E6A37650;
  v14 = v6;
  v15 = v7;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  dispatch_after(v9, queue, block);

}

void __64__CADMockSpotlightIndex_indexSearchableItems_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  int v3;
  uint64_t v4;
  id WeakRetained;
  id v6;

  if ((objc_msgSend(*(id *)(a1 + 32), "_incrementAndCheckIfShouldFailCall") & 1) != 0
    || (v2 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8)),
        v3 = objc_msgSend(v2, "failIndexSearchableItems"),
        v2,
        v3))
  {
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "_mockFailureError");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(WeakRetained, "indexSearchableItems:", *(_QWORD *)(a1 + 40));

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

- (void)deleteAllSearchableItemsForBundleID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  double v8;
  dispatch_time_t v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[CADMockSpotlightIndex _artificialDelay](self, "_artificialDelay");
  v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__CADMockSpotlightIndex_deleteAllSearchableItemsForBundleID_completionHandler___block_invoke;
  block[3] = &unk_1E6A37650;
  v14 = v6;
  v15 = v7;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  dispatch_after(v9, queue, block);

}

void __79__CADMockSpotlightIndex_deleteAllSearchableItemsForBundleID_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  int v3;
  uint64_t v4;
  id WeakRetained;
  id v6;

  if ((objc_msgSend(*(id *)(a1 + 32), "_incrementAndCheckIfShouldFailCall") & 1) != 0
    || (v2 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8)),
        v3 = objc_msgSend(v2, "failDeleteAllSearchableItemsForBundleID"),
        v2,
        v3))
  {
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "_mockFailureError");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(WeakRetained, "deleteAllSearchableItemsForBundleID:", *(_QWORD *)(a1 + 40));

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

- (id)_mockFailureError
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CADMockSpotlightIndexProviderErrorDomain"), 1, 0);
}

- (BOOL)_incrementAndCheckIfShouldFailCall
{
  CADMockSpotlightIndexProvider **p_provider;
  id WeakRetained;
  id v4;
  uint64_t v5;
  id v6;
  BOOL v7;
  BOOL v8;

  p_provider = &self->_provider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  objc_msgSend(WeakRetained, "setNumCalls:", objc_msgSend(WeakRetained, "numCalls") + 1);

  v4 = objc_loadWeakRetained((id *)p_provider);
  v5 = objc_msgSend(v4, "failureMode");

  switch(v5)
  {
    case 3:
      return 1;
    case 2:
      v6 = objc_loadWeakRetained((id *)p_provider);
      v7 = objc_msgSend(v6, "numCalls") == 2;
      break;
    case 1:
      v6 = objc_loadWeakRetained((id *)p_provider);
      v7 = objc_msgSend(v6, "numCalls") == 1;
      break;
    default:
      return 0;
  }
  v8 = v7;

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_provider);
}

@end
