@implementation NMSEpisodeFetchRequestItemEnumerator

- (NMSEpisodeFetchRequestItemEnumerator)initWithFetchRequest:(id)a3 ctx:(id)a4
{
  id v7;
  id v8;
  NMSEpisodeFetchRequestItemEnumerator *v9;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NMSEpisodeFetchRequestItemEnumerator;
  v9 = -[NMSEpisodeFetchRequestItemEnumerator init](&v11, sel_init);
  if (v9)
  {
    if (!objc_msgSend(v7, "fetchBatchSize"))
      objc_msgSend(v7, "setFetchBatchSize:", 3);
    objc_storeStrong((id *)&v9->_fetchRequest, a3);
    objc_storeStrong((id *)&v9->_ctx, a4);
  }

  return v9;
}

- (id)nextItem
{
  unint64_t itemIndex;
  void *v4;
  unint64_t v5;
  NSManagedObjectContext *ctx;
  id v7;
  NSArray *items;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  itemIndex = self->_itemIndex;
  -[NMSEpisodeFetchRequestItemEnumerator items](self, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (itemIndex >= v5)
  {
    items = self->_items;
    self->_items = 0;

    return 0;
  }
  else
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__9;
    v15 = __Block_byref_object_dispose__9;
    v16 = 0;
    ctx = self->_ctx;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __48__NMSEpisodeFetchRequestItemEnumerator_nextItem__block_invoke;
    v10[3] = &unk_24D646EB8;
    v10[4] = self;
    v10[5] = &v11;
    -[NSManagedObjectContext performBlockAndWait:](ctx, "performBlockAndWait:", v10);
    v7 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

    return v7;
  }
}

void __48__NMSEpisodeFetchRequestItemEnumerator_nextItem__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "downloadInfo");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
}

- (NSArray)items
{
  NSArray *items;
  NSManagedObjectContext *ctx;
  _QWORD v6[5];

  items = self->_items;
  if (!items)
  {
    if (self->_itemIndex)
      return (NSArray *)0;
    ctx = self->_ctx;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __45__NMSEpisodeFetchRequestItemEnumerator_items__block_invoke;
    v6[3] = &unk_24D646F30;
    v6[4] = self;
    -[NSManagedObjectContext performBlockAndWait:](ctx, "performBlockAndWait:", v6);
    items = self->_items;
  }
  return items;
}

void __45__NMSEpisodeFetchRequestItemEnumerator_items__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;

  v2 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v2 + 8);
  v3 = *(void **)(v2 + 16);
  v10 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v10);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v10;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 32);
  *(_QWORD *)(v7 + 32) = v5;

  if (v6)
  {
    NMLogForCategory(5);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __45__NMSEpisodeFetchRequestItemEnumerator_items__block_invoke_cold_1((uint64_t)v6, v9);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_ctx, 0);
  objc_storeStrong((id *)&self->_fetchRequest, 0);
}

void __45__NMSEpisodeFetchRequestItemEnumerator_items__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_216E27000, a2, OS_LOG_TYPE_ERROR, "NMSEpisodeFetchRequestItemEnumerator fetch request failed - %@", (uint8_t *)&v2, 0xCu);
}

@end
