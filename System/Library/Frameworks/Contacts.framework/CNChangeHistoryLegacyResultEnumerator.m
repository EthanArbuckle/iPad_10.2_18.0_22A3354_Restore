@implementation CNChangeHistoryLegacyResultEnumerator

+ (id)contactEnumeratorWithChanges:(id)a3 keysToFetch:(id)a4 unifyResults:(BOOL)a5 contactStore:(id)a6
{
  id v9;
  id v10;
  id v11;
  id *v12;
  CNChangeHistoryLegacyResultEnumerator *v13;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = -[_CNChangeHistoryContactRefillStrategy initWithKeysToFetch:unifyResults:contactStore:]((id *)[_CNChangeHistoryContactRefillStrategy alloc], v10, a5, v9);

  v13 = -[CNChangeHistoryLegacyResultEnumerator initWithChanges:refillStrategy:]([CNChangeHistoryLegacyResultEnumerator alloc], "initWithChanges:refillStrategy:", v11, v12);
  return v13;
}

+ (id)groupEnumeratorWithChanges:(id)a3 contactStore:(id)a4
{
  id v5;
  id v6;
  _CNChangeHistoryGroupRefillStrategy *v7;
  CNChangeHistoryLegacyResultEnumerator *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[_CNChangeHistoryGroupRefillStrategy initWithContactStore:]([_CNChangeHistoryGroupRefillStrategy alloc], "initWithContactStore:", v5);

  v8 = -[CNChangeHistoryLegacyResultEnumerator initWithChanges:refillStrategy:]([CNChangeHistoryLegacyResultEnumerator alloc], "initWithChanges:refillStrategy:", v6, v7);
  return v8;
}

- (CNChangeHistoryLegacyResultEnumerator)initWithChanges:(id)a3 refillStrategy:(id)a4
{
  id v6;
  id v7;
  CNChangeHistoryLegacyResultEnumerator *v8;
  CNQueue *v9;
  CNQueue *changes;
  CNQueue *v11;
  CNQueue *batchFetchQueue;
  void *v13;
  CNChangeHistoryLegacyResultEnumerator *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CNChangeHistoryLegacyResultEnumerator;
  v8 = -[CNChangeHistoryLegacyResultEnumerator init](&v16, sel_init);
  if (v8)
  {
    v9 = (CNQueue *)objc_alloc_init(MEMORY[0x1E0D13B40]);
    changes = v8->_changes;
    v8->_changes = v9;

    v11 = (CNQueue *)objc_alloc_init(MEMORY[0x1E0D13B40]);
    batchFetchQueue = v8->_batchFetchQueue;
    v8->_batchFetchQueue = v11;

    objc_msgSend(v7, "batchesToRepresentObjects:suggestedBatchSize:", v6, 100);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNQueue enqueueObjectsFromArray:](v8->_batchFetchQueue, "enqueueObjectsFromArray:", v13);
    objc_storeStrong((id *)&v8->_refillStrategy, a4);
    v14 = v8;

  }
  return v8;
}

- (id)nextObject
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[CNChangeHistoryLegacyResultEnumerator changes](self, "changes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    -[CNChangeHistoryLegacyResultEnumerator _fetchNextBatch](self, "_fetchNextBatch");
  -[CNChangeHistoryLegacyResultEnumerator changes](self, "changes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_fetchNextBatch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CNChangeHistoryLegacyResultEnumerator batchFetchQueue](self, "batchFetchQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dequeue");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
  {
    -[CNChangeHistoryLegacyResultEnumerator refillStrategy](self, "refillStrategy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectsRepresentedByBatch:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNChangeHistoryLegacyResultEnumerator changes](self, "changes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enqueueObjectsFromArray:", v5);

  }
}

- (CNQueue)changes
{
  return self->_changes;
}

- (CNQueue)batchFetchQueue
{
  return self->_batchFetchQueue;
}

- (CNEnumeratorRefillStrategy)refillStrategy
{
  return self->_refillStrategy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refillStrategy, 0);
  objc_storeStrong((id *)&self->_batchFetchQueue, 0);
  objc_storeStrong((id *)&self->_changes, 0);
}

@end
