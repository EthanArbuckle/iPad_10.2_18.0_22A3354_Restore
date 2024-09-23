@implementation AMSPurchaseQueueBatchList

- (AMSPurchaseQueueBatchList)init
{
  AMSPurchaseQueueBatchList *v2;
  AMSThreadSafeObject *v3;
  void *v4;
  uint64_t v5;
  AMSThreadSafeObject *backingArray;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AMSPurchaseQueueBatchList;
  v2 = -[AMSPurchaseQueueBatchList init](&v8, sel_init);
  if (v2)
  {
    v3 = [AMSThreadSafeObject alloc];
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AMSThreadSafeObject initWithObject:](v3, "initWithObject:", v4);
    backingArray = v2->_backingArray;
    v2->_backingArray = (AMSThreadSafeObject *)v5;

  }
  return v2;
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[AMSPurchaseQueueBatchList backingArray](self, "backingArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__AMSPurchaseQueueBatchList_count__block_invoke;
  v5[3] = &unk_1E2544FD0;
  v5[4] = &v6;
  objc_msgSend(v2, "read:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__AMSPurchaseQueueBatchList_count__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)appendBatch:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[AMSPurchaseQueueBatchList backingArray](self, "backingArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__AMSPurchaseQueueBatchList_appendBatch___block_invoke;
  v7[3] = &unk_1E2544FF8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "readWrite:", v7);

}

id __41__AMSPurchaseQueueBatchList_appendBatch___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "addObject:", v2);
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  return v4;
}

- (id)nextPurchase
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__59;
  v10 = __Block_byref_object_dispose__59;
  v11 = 0;
  -[AMSPurchaseQueueBatchList backingArray](self, "backingArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__AMSPurchaseQueueBatchList_nextPurchase__block_invoke;
  v5[3] = &unk_1E2544FD0;
  v5[4] = &v6;
  objc_msgSend(v2, "read:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __41__AMSPurchaseQueueBatchList_nextPurchase__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "nextPurchase", (_QWORD)v11);
        v8 = objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          v10 = *(void **)(v9 + 40);
          *(_QWORD *)(v9 + 40) = v8;

          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

}

- (id)batchForPurchase:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__59;
  v16 = __Block_byref_object_dispose__59;
  v17 = 0;
  -[AMSPurchaseQueueBatchList backingArray](self, "backingArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__AMSPurchaseQueueBatchList_batchForPurchase___block_invoke;
  v9[3] = &unk_1E2545020;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "read:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __46__AMSPurchaseQueueBatchList_batchForPurchase___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "purchaseForPurchaseId:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v8);
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)popBatch:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[AMSPurchaseQueueBatchList backingArray](self, "backingArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__AMSPurchaseQueueBatchList_popBatch___block_invoke;
  v7[3] = &unk_1E2544FF8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "readWrite:", v7);

}

id __38__AMSPurchaseQueueBatchList_popBatch___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "removeObject:", v2);
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  return v4;
}

- (AMSThreadSafeObject)backingArray
{
  return self->_backingArray;
}

- (void)setBackingArray:(id)a3
{
  objc_storeStrong((id *)&self->_backingArray, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingArray, 0);
}

@end
