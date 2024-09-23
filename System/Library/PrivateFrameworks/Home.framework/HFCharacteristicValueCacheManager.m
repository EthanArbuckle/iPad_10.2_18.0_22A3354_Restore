@implementation HFCharacteristicValueCacheManager

- (BOOL)containsTransactionsReadingCharacteristic:(id)a3 filterBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__HFCharacteristicValueCacheManager_containsTransactionsReadingCharacteristic_filterBlock___block_invoke;
  v13[3] = &unk_1EA735480;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v8 = v7;
  v9 = v6;
  -[HFCharacteristicValueCacheManager _perfomUpdatedCacheRead:](self, "_perfomUpdatedCacheRead:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  return v11;
}

id __91__HFCharacteristicValueCacheManager_containsTransactionsReadingCharacteristic_filterBlock___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_msgSend(a1[4], "transactionsByCharacteristicID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transactionsReading");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __91__HFCharacteristicValueCacheManager_containsTransactionsReadingCharacteristic_filterBlock___block_invoke_2;
  v9[3] = &unk_1EA7354A8;
  v6 = a1[4];
  v10 = a1[5];
  v12 = &v13;
  v11 = a1[6];
  objc_msgSend(v6, "_enumerateTransactionsRemovingFailingItems:block:", v5, v9);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v14 + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v13, 8);
  return v7;
}

id __79__HFCharacteristicValueCacheManager_containsTransactionsWritingCharacteristic___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  objc_msgSend(*(id *)(a1 + 32), "transactionsByCharacteristicID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transactionsWriting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__HFCharacteristicValueCacheManager_containsTransactionsWritingCharacteristic___block_invoke_2;
  v9[3] = &unk_1EA7354F8;
  v6 = *(void **)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  v11 = v6;
  v12 = &v13;
  objc_msgSend(v10, "_enumerateTransactionsRemovingFailingItems:block:", v5, v9);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v14 + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (NSMutableDictionary)transactionsByCharacteristicID
{
  return self->_transactionsByCharacteristicID;
}

void __74__HFCharacteristicValueCacheManager__locked_updateWithRemovedTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "transactionsReading");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 32));

  objc_msgSend(v3, "transactionsWriting");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 32));
}

- (BOOL)containsTransactionsWritingCharacteristic:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v9;
  uint64_t v10;
  id (*v11)(uint64_t);
  void *v12;
  HFCharacteristicValueCacheManager *v13;
  id v14;

  v4 = a3;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __79__HFCharacteristicValueCacheManager_containsTransactionsWritingCharacteristic___block_invoke;
  v12 = &unk_1EA72DAE0;
  v13 = self;
  v14 = v4;
  v5 = v4;
  -[HFCharacteristicValueCacheManager _perfomUpdatedCacheRead:](self, "_perfomUpdatedCacheRead:", &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue", v9, v10, v11, v12, v13);

  return v7;
}

- (id)_perfomUpdatedCacheRead:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  HFCharacteristicValueCacheManager *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  HFCharacteristicValueCacheManager *v22;
  id v23;

  v4 = a3;
  if (dispatch_group_wait((dispatch_group_t)self->_dispatchGroup, 0))
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __61__HFCharacteristicValueCacheManager__perfomUpdatedCacheRead___block_invoke;
    v20[3] = &unk_1EA7356B0;
    v8 = v5;
    v21 = v8;
    v22 = self;
    v9 = v6;
    v23 = v9;
    v10 = -[HFCharacteristicValueCacheManager _performLock:block:](self, "_performLock:block:", &self->_unprocessedTransctionLock, v20);
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __61__HFCharacteristicValueCacheManager__perfomUpdatedCacheRead___block_invoke_2;
    v15[3] = &unk_1EA735700;
    v16 = v8;
    v17 = self;
    v18 = v9;
    v19 = v4;
    v11 = v9;
    v12 = v8;
    -[HFCharacteristicValueCacheManager _performLock:block:](self, "_performLock:block:", &self->_cacheLock, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HFCharacteristicValueCacheManager _performLock:block:](self, "_performLock:block:", &self->_cacheLock, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)_performLock:(os_unfair_lock_s *)a3 block:(id)a4
{
  void (**v5)(_QWORD);
  void *v6;

  v5 = (void (**)(_QWORD))a4;
  os_unfair_lock_lock(a3);
  v5[2](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(a3);
  return v6;
}

- (void)_enumerateTransactionsRemovingFailingItems:(id)a3 block:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CB3788];
  v7 = a3;
  objc_msgSend(v6, "indexSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__HFCharacteristicValueCacheManager__enumerateTransactionsRemovingFailingItems_block___block_invoke;
  v11[3] = &unk_1EA735728;
  v12 = v8;
  v13 = v5;
  v9 = v8;
  v10 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);
  objc_msgSend(v7, "removeObjectsAtIndexes:", v9);

}

- (id)cachedValueForCharacteristic:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__HFCharacteristicValueCacheManager_cachedValueForCharacteristic___block_invoke;
  v8[3] = &unk_1EA72DAE0;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[HFCharacteristicValueCacheManager _perfomUpdatedCacheRead:](self, "_perfomUpdatedCacheRead:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __66__HFCharacteristicValueCacheManager_cachedValueForCharacteristic___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "transactionsByCharacteristicID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transactionsWriting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__14;
  v15 = __Block_byref_object_dispose__14;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__HFCharacteristicValueCacheManager_cachedValueForCharacteristic___block_invoke_20;
  v8[3] = &unk_1EA735598;
  v9 = *(id *)(a1 + 40);
  v10 = &v11;
  objc_msgSend(v5, "enumerateObjectsWithOptions:usingBlock:", 2, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __56__HFCharacteristicValueCacheManager_transactionRemoved___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "unprocessedRemovedTransactions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  return 0;
}

uint64_t __54__HFCharacteristicValueCacheManager_transactionAdded___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "unprocessedAddedTransactions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  return 0;
}

uint64_t __61__HFCharacteristicValueCacheManager__perfomUpdatedCacheRead___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  _QWORD v7[5];

  v2 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__HFCharacteristicValueCacheManager__perfomUpdatedCacheRead___block_invoke_3;
  v7[3] = &unk_1EA7356D8;
  v3 = (void *)a1[4];
  v7[4] = a1[5];
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __61__HFCharacteristicValueCacheManager__perfomUpdatedCacheRead___block_invoke_4;
  v6[3] = &unk_1EA7356D8;
  v4 = (void *)a1[6];
  v6[4] = a1[5];
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

id __76__HFCharacteristicValueCacheManager_containsTransactionsExecutingActionSet___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, void *, _BYTE *);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  objc_msgSend(*(id *)(a1 + 32), "transactionsByActionSetID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __76__HFCharacteristicValueCacheManager_containsTransactionsExecutingActionSet___block_invoke_2;
  v11 = &unk_1EA735548;
  v5 = *(void **)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v13 = &v14;
  objc_msgSend(v5, "_enumerateTransactionsRemovingFailingItems:block:", v4, &v8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v15 + 24), v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v14, 8);
  return v6;
}

uint64_t __86__HFCharacteristicValueCacheManager__enumerateTransactionsRemovingFailingItems_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
  return result;
}

uint64_t __91__HFCharacteristicValueCacheManager_containsTransactionsReadingCharacteristic_filterBlock___block_invoke_2(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  v5 = a2;
  objc_msgSend(v5, "characteristicsToRead");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", a1[4]);

  v8 = *(_QWORD *)(a1[6] + 8);
  v9 = *(_BYTE *)(v8 + 24) != 0;
  if (!*(_BYTE *)(v8 + 24) && ((v7 ^ 1) & 1) == 0)
  {
    v10 = a1[5];
    if (v10)
    {
      v9 = (*(uint64_t (**)(uint64_t, id))(v10 + 16))(v10, v5);
      v8 = *(_QWORD *)(a1[6] + 8);
    }
    else
    {
      v9 = 1;
    }
  }
  *(_BYTE *)(v8 + 24) = v9;
  *a3 = *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24);

  return v7 ^ 1u;
}

- (void)transactionRemoved:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__HFCharacteristicValueCacheManager_transactionRemoved___block_invoke;
  v12[3] = &unk_1EA72DAE0;
  v12[4] = self;
  v6 = v4;
  v13 = v6;
  v7 = -[HFCharacteristicValueCacheManager _performLock:block:](self, "_performLock:block:", &self->_unprocessedTransctionLock, v12);
  dispatch_group_enter((dispatch_group_t)self->_dispatchGroup);
  queue = self->_queue;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __56__HFCharacteristicValueCacheManager_transactionRemoved___block_invoke_2;
  v10[3] = &unk_1EA727188;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  dispatch_async(queue, v10);

}

uint64_t __56__HFCharacteristicValueCacheManager_transactionRemoved___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_locked_updateWithRemovedTransaction:", *(_QWORD *)(a1 + 40));
  return 0;
}

- (void)_locked_updateWithRemovedTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  -[HFCharacteristicValueCacheManager transactionsByCharacteristicID](self, "transactionsByCharacteristicID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__HFCharacteristicValueCacheManager__locked_updateWithRemovedTransaction___block_invoke;
  v14[3] = &unk_1EA735660;
  v8 = v4;
  v15 = v8;
  objc_msgSend(v6, "na_each:", v14);

  -[HFCharacteristicValueCacheManager transactionsByActionSetID](self, "transactionsByActionSetID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __74__HFCharacteristicValueCacheManager__locked_updateWithRemovedTransaction___block_invoke_2;
  v12[3] = &unk_1EA735688;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "na_each:", v12);

}

- (NSMutableDictionary)transactionsByActionSetID
{
  return self->_transactionsByActionSetID;
}

- (void)_locked_updateWithAddedTransaction:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;

  v4 = a3;
  objc_msgSend(v4, "characteristicsToRead");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __72__HFCharacteristicValueCacheManager__locked_updateWithAddedTransaction___block_invoke;
  v20[3] = &unk_1EA72C168;
  v20[4] = self;
  v7 = v4;
  v21 = v7;
  objc_msgSend(v5, "na_each:", v20);

  objc_msgSend(v7, "writeCharacteristicRequests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  v18[1] = 3221225472;
  v18[2] = __72__HFCharacteristicValueCacheManager__locked_updateWithAddedTransaction___block_invoke_2;
  v18[3] = &unk_1EA7355E8;
  v18[4] = self;
  v9 = v7;
  v19 = v9;
  objc_msgSend(v8, "na_each:", v18);

  objc_msgSend(v9, "actionsToExecute");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __72__HFCharacteristicValueCacheManager__locked_updateWithAddedTransaction___block_invoke_3;
  v16[3] = &unk_1EA735610;
  v16[4] = self;
  v11 = v9;
  v17 = v11;
  objc_msgSend(v10, "na_each:", v16);

  objc_msgSend(v11, "actionSetsToExecute");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __72__HFCharacteristicValueCacheManager__locked_updateWithAddedTransaction___block_invoke_4;
  v14[3] = &unk_1EA735638;
  v14[4] = self;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "na_each:", v14);

}

uint64_t __54__HFCharacteristicValueCacheManager_transactionAdded___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_locked_updateWithAddedTransaction:", *(_QWORD *)(a1 + 40));
  return 0;
}

uint64_t __61__HFCharacteristicValueCacheManager__perfomUpdatedCacheRead___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_updateWithAddedTransaction:", a2);
}

- (void)transactionAdded:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__HFCharacteristicValueCacheManager_transactionAdded___block_invoke;
  v12[3] = &unk_1EA72DAE0;
  v12[4] = self;
  v6 = v4;
  v13 = v6;
  v7 = -[HFCharacteristicValueCacheManager _performLock:block:](self, "_performLock:block:", &self->_unprocessedTransctionLock, v12);
  dispatch_group_enter((dispatch_group_t)self->_dispatchGroup);
  queue = self->_queue;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __54__HFCharacteristicValueCacheManager_transactionAdded___block_invoke_2;
  v10[3] = &unk_1EA727188;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  dispatch_async(queue, v10);

}

uint64_t __61__HFCharacteristicValueCacheManager__perfomUpdatedCacheRead___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "unprocessedAddedTransactions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionOrderedSet:", v3);

  v4 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "unprocessedRemovedTransactions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionOrderedSet:", v5);

  objc_msgSend(*(id *)(a1 + 40), "unprocessedAddedTransactions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 40), "unprocessedRemovedTransactions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  return 0;
}

uint64_t __56__HFCharacteristicValueCacheManager_transactionRemoved___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "unprocessedRemovedTransactions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "unprocessedRemovedTransactions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 40));

  return 0;
}

- (NSMutableOrderedSet)unprocessedRemovedTransactions
{
  return self->_unprocessedRemovedTransactions;
}

uint64_t __54__HFCharacteristicValueCacheManager_transactionAdded___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "unprocessedAddedTransactions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "unprocessedAddedTransactions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 40));

  return 0;
}

- (NSMutableOrderedSet)unprocessedAddedTransactions
{
  return self->_unprocessedAddedTransactions;
}

void __72__HFCharacteristicValueCacheManager__locked_updateWithAddedTransaction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _HFCharacteristicReadAndWriteTransactions *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "transactionsByCharacteristicID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (_HFCharacteristicReadAndWriteTransactions *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    v5 = objc_alloc_init(_HFCharacteristicReadAndWriteTransactions);
  -[_HFCharacteristicReadAndWriteTransactions transactionsReading](v5, "transactionsReading");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "transactionsByCharacteristicID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, v8);

}

void __54__HFCharacteristicValueCacheManager_transactionAdded___block_invoke_2(uint64_t a1)
{
  void *v2;
  char *v3;
  uint64_t v4;
  id v5;
  void *v6;
  char *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v3 = *(char **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v11[2] = __54__HFCharacteristicValueCacheManager_transactionAdded___block_invoke_3;
  v11[3] = &unk_1EA7355C0;
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v13 = &v14;
  v11[4] = v3;
  v12 = v2;
  v5 = (id)objc_msgSend(v3, "_performLock:block:", v3 + 20, v11);
  if (*((_BYTE *)v15 + 24))
  {
    v7 = *(char **)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __54__HFCharacteristicValueCacheManager_transactionAdded___block_invoke_4;
    v9[3] = &unk_1EA72DAE0;
    v9[4] = v7;
    v10 = v6;
    v8 = (id)objc_msgSend(v7, "_performLock:block:", v7 + 16, v9);

  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 8));

  _Block_object_dispose(&v14, 8);
}

void __56__HFCharacteristicValueCacheManager_transactionRemoved___block_invoke_2(uint64_t a1)
{
  void *v2;
  char *v3;
  uint64_t v4;
  id v5;
  void *v6;
  char *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v3 = *(char **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v11[2] = __56__HFCharacteristicValueCacheManager_transactionRemoved___block_invoke_3;
  v11[3] = &unk_1EA7355C0;
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v13 = &v14;
  v11[4] = v3;
  v12 = v2;
  v5 = (id)objc_msgSend(v3, "_performLock:block:", v3 + 20, v11);
  if (*((_BYTE *)v15 + 24))
  {
    v7 = *(char **)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __56__HFCharacteristicValueCacheManager_transactionRemoved___block_invoke_4;
    v9[3] = &unk_1EA72DAE0;
    v9[4] = v7;
    v10 = v6;
    v8 = (id)objc_msgSend(v7, "_performLock:block:", v7 + 16, v9);

  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 8));

  _Block_object_dispose(&v14, 8);
}

- (BOOL)containsTransactionsExecutingActionSet:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v9;
  uint64_t v10;
  id (*v11)(uint64_t);
  void *v12;
  HFCharacteristicValueCacheManager *v13;
  id v14;

  v4 = a3;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __76__HFCharacteristicValueCacheManager_containsTransactionsExecutingActionSet___block_invoke;
  v12 = &unk_1EA72DAE0;
  v13 = self;
  v14 = v4;
  v5 = v4;
  -[HFCharacteristicValueCacheManager _perfomUpdatedCacheRead:](self, "_perfomUpdatedCacheRead:", &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue", v9, v10, v11, v12, v13);

  return v7;
}

- (HFCharacteristicValueCacheManager)init
{
  HFCharacteristicValueCacheManager *v2;
  HFCharacteristicValueCacheManager *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  dispatch_group_t v7;
  OS_dispatch_group *dispatchGroup;
  uint64_t v9;
  NSMutableDictionary *transactionsByCharacteristicID;
  uint64_t v11;
  NSMutableDictionary *transactionsByActionSetID;
  uint64_t v13;
  NSMutableOrderedSet *unprocessedAddedTransactions;
  uint64_t v15;
  NSMutableOrderedSet *unprocessedRemovedTransactions;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)HFCharacteristicValueCacheManager;
  v2 = -[HFCharacteristicValueCacheManager init](&v18, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->_cacheLock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("HFCharacteristicValueCacheManagerQueue", v4);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v5;

    v7 = dispatch_group_create();
    dispatchGroup = v3->_dispatchGroup;
    v3->_dispatchGroup = (OS_dispatch_group *)v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    transactionsByCharacteristicID = v3->_transactionsByCharacteristicID;
    v3->_transactionsByCharacteristicID = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    transactionsByActionSetID = v3->_transactionsByActionSetID;
    v3->_transactionsByActionSetID = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v13 = objc_claimAutoreleasedReturnValue();
    unprocessedAddedTransactions = v3->_unprocessedAddedTransactions;
    v3->_unprocessedAddedTransactions = (NSMutableOrderedSet *)v13;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v15 = objc_claimAutoreleasedReturnValue();
    unprocessedRemovedTransactions = v3->_unprocessedRemovedTransactions;
    v3->_unprocessedRemovedTransactions = (NSMutableOrderedSet *)v15;

  }
  return v3;
}

uint64_t __61__HFCharacteristicValueCacheManager__perfomUpdatedCacheRead___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_updateWithRemovedTransaction:", a2);
}

- (id)transactionsReadingCharacteristic:(id)a3 filterBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__HFCharacteristicValueCacheManager_transactionsReadingCharacteristic_filterBlock___block_invoke;
  v12[3] = &unk_1EA735480;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  -[HFCharacteristicValueCacheManager _perfomUpdatedCacheRead:](self, "_perfomUpdatedCacheRead:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __83__HFCharacteristicValueCacheManager_transactionsReadingCharacteristic_filterBlock___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  objc_msgSend(a1[4], "transactionsByCharacteristicID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transactionsReading");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__HFCharacteristicValueCacheManager_transactionsReadingCharacteristic_filterBlock___block_invoke_2;
  v12[3] = &unk_1EA735458;
  v7 = a1[4];
  v13 = a1[5];
  v15 = a1[6];
  v8 = v6;
  v14 = v8;
  objc_msgSend(v7, "_enumerateTransactionsRemovingFailingItems:block:", v5, v12);
  v9 = v14;
  v10 = v8;

  return v10;
}

uint64_t __83__HFCharacteristicValueCacheManager_transactionsReadingCharacteristic_filterBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(v3, "characteristicsToRead");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 32));

  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 48);
    if (!v6 || (*(unsigned int (**)(uint64_t, id))(v6 + 16))(v6, v3))
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }

  return v5 ^ 1u;
}

- (id)transactionsWritingCharacteristic:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__HFCharacteristicValueCacheManager_transactionsWritingCharacteristic___block_invoke;
  v8[3] = &unk_1EA72DAE0;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[HFCharacteristicValueCacheManager _perfomUpdatedCacheRead:](self, "_perfomUpdatedCacheRead:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __71__HFCharacteristicValueCacheManager_transactionsWritingCharacteristic___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "transactionsByCharacteristicID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transactionsWriting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__HFCharacteristicValueCacheManager_transactionsWritingCharacteristic___block_invoke_2;
  v12[3] = &unk_1EA7354D0;
  v7 = *(void **)(a1 + 40);
  v13 = *(id *)(a1 + 32);
  v14 = v7;
  v8 = v6;
  v15 = v8;
  objc_msgSend(v13, "_enumerateTransactionsRemovingFailingItems:block:", v5, v12);
  v9 = v15;
  v10 = v8;

  return v10;
}

uint64_t __71__HFCharacteristicValueCacheManager_transactionsWritingCharacteristic___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "_transaction:isWritingCharacteristic:", v3, *(_QWORD *)(a1 + 40));
  if (v4)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);

  return v4 ^ 1u;
}

uint64_t __79__HFCharacteristicValueCacheManager_containsTransactionsWritingCharacteristic___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  int v5;
  uint64_t v6;
  char v7;

  v5 = objc_msgSend(*(id *)(a1 + 32), "_transaction:isWritingCharacteristic:", a2, *(_QWORD *)(a1 + 40));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v6 + 24))
    v7 = 1;
  else
    v7 = v5;
  *(_BYTE *)(v6 + 24) = v7;
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  return v5 ^ 1u;
}

- (id)transactionsExecutingActionSet:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__HFCharacteristicValueCacheManager_transactionsExecutingActionSet___block_invoke;
  v8[3] = &unk_1EA72DAE0;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[HFCharacteristicValueCacheManager _perfomUpdatedCacheRead:](self, "_perfomUpdatedCacheRead:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __68__HFCharacteristicValueCacheManager_transactionsExecutingActionSet___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "transactionsByActionSetID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__HFCharacteristicValueCacheManager_transactionsExecutingActionSet___block_invoke_2;
  v11[3] = &unk_1EA735520;
  v6 = *(void **)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v7 = v5;
  v13 = v7;
  objc_msgSend(v6, "_enumerateTransactionsRemovingFailingItems:block:", v4, v11);
  v8 = v13;
  v9 = v7;

  return v9;
}

uint64_t __68__HFCharacteristicValueCacheManager_transactionsExecutingActionSet___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;

  v3 = a2;
  objc_msgSend(v3, "actionSetsToExecute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 32));

  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

  return v5 ^ 1u;
}

uint64_t __76__HFCharacteristicValueCacheManager_containsTransactionsExecutingActionSet___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  char v8;

  objc_msgSend(a2, "actionSetsToExecute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 32));

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v7 + 24))
    v8 = 1;
  else
    v8 = v6;
  *(_BYTE *)(v7 + 24) = v8;
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return v6 ^ 1u;
}

void __66__HFCharacteristicValueCacheManager_cachedValueForCharacteristic___block_invoke_20(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(a2, "writeCharacteristicRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__HFCharacteristicValueCacheManager_cachedValueForCharacteristic___block_invoke_2;
  v9[3] = &unk_1EA735570;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v10 = v7;
  v11 = v8;
  v12 = a4;
  objc_msgSend(v6, "na_each:", v9);

}

void __66__HFCharacteristicValueCacheManager_cachedValueForCharacteristic___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);

  if (v3 == v4)
  {
    objc_msgSend(v8, "value");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    **(_BYTE **)(a1 + 48) = 1;
  }

}

void __72__HFCharacteristicValueCacheManager__locked_updateWithAddedTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  _HFCharacteristicReadAndWriteTransactions *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "transactionsByCharacteristicID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "characteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v6 = (_HFCharacteristicReadAndWriteTransactions *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    v6 = objc_alloc_init(_HFCharacteristicReadAndWriteTransactions);
  -[_HFCharacteristicReadAndWriteTransactions transactionsWriting](v6, "transactionsWriting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "transactionsByCharacteristicID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "characteristic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v10);

}

void __72__HFCharacteristicValueCacheManager__locked_updateWithAddedTransaction___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _HFCharacteristicReadAndWriteTransactions *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a2;
  objc_opt_class();
  v14 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v14;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "transactionsByCharacteristicID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "characteristic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v8);
    v9 = (_HFCharacteristicReadAndWriteTransactions *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      v9 = objc_alloc_init(_HFCharacteristicReadAndWriteTransactions);
    -[_HFCharacteristicReadAndWriteTransactions transactionsWriting](v9, "transactionsWriting");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "transactionsByCharacteristicID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "characteristic");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, v13);

  }
}

void __72__HFCharacteristicValueCacheManager__locked_updateWithAddedTransaction___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "transactionsByActionSetID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "transactionsByActionSetID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

}

uint64_t __74__HFCharacteristicValueCacheManager__locked_updateWithRemovedTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObject:", *(_QWORD *)(a1 + 32));
}

- (BOOL)_transaction:(id)a3 isWritingCharacteristic:(id)a4
{
  return -[HFCharacteristicValueCacheManager _transaction:isWritingCharacteristic:allowingActions:](self, "_transaction:isWritingCharacteristic:allowingActions:", a3, a4, 1);
}

- (BOOL)_transaction:(id)a3 isWritingCharacteristic:(id)a4 allowingActions:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  char v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "writeCharacteristicRequests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __90__HFCharacteristicValueCacheManager__transaction_isWritingCharacteristic_allowingActions___block_invoke;
  v17[3] = &unk_1EA72BC18;
  v11 = v8;
  v18 = v11;
  v12 = objc_msgSend(v9, "na_any:", v17);

  if ((v12 & 1) == 0 && v5)
  {
    objc_msgSend(v7, "actionsToExecute");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __90__HFCharacteristicValueCacheManager__transaction_isWritingCharacteristic_allowingActions___block_invoke_2;
    v15[3] = &unk_1EA72BC40;
    v16 = v11;
    v12 = objc_msgSend(v13, "na_any:", v15);

  }
  return v12;
}

BOOL __90__HFCharacteristicValueCacheManager__transaction_isWritingCharacteristic_allowingActions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

BOOL __90__HFCharacteristicValueCacheManager__transaction_isWritingCharacteristic_allowingActions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _BOOL8 v8;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "characteristic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == *(void **)(a1 + 32);

  return v8;
}

- (void)setTransactionsByCharacteristicID:(id)a3
{
  objc_storeStrong((id *)&self->_transactionsByCharacteristicID, a3);
}

- (void)setTransactionsByActionSetID:(id)a3
{
  objc_storeStrong((id *)&self->_transactionsByActionSetID, a3);
}

- (void)setUnprocessedAddedTransactions:(id)a3
{
  objc_storeStrong((id *)&self->_unprocessedAddedTransactions, a3);
}

- (void)setUnprocessedRemovedTransactions:(id)a3
{
  objc_storeStrong((id *)&self->_unprocessedRemovedTransactions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unprocessedRemovedTransactions, 0);
  objc_storeStrong((id *)&self->_unprocessedAddedTransactions, 0);
  objc_storeStrong((id *)&self->_transactionsByActionSetID, 0);
  objc_storeStrong((id *)&self->_transactionsByCharacteristicID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
}

@end
