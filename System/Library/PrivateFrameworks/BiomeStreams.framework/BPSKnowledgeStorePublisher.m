@implementation BPSKnowledgeStorePublisher

- (BPSKnowledgeStorePublisher)initWithEventQuery:(id)a3 knowledgeStore:(id)a4
{
  id v7;
  id v8;
  BPSKnowledgeStorePublisher *v9;
  BPSKnowledgeStorePublisher *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BPSKnowledgeStorePublisher;
  v9 = -[BPSKnowledgeStorePublisher init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_query, a3);
    objc_storeStrong((id *)&v10->_store, a4);
  }

  return v10;
}

- (void)subscribe:(id)a3
{
  id v4;
  _BPSInnerKnowledgeSubscription *v5;
  void *v6;
  void *v7;
  _BPSInnerKnowledgeSubscription *v8;

  v4 = a3;
  v5 = [_BPSInnerKnowledgeSubscription alloc];
  -[BPSKnowledgeStorePublisher query](self, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSKnowledgeStorePublisher store](self, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_BPSInnerKnowledgeSubscription initWithQuery:downstream:store:](v5, "initWithQuery:downstream:store:", v6, v4, v7);

  objc_msgSend(v4, "receiveSubscription:", v8);
}

- (id)upstreamPublishers
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)startWithSubscriber:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  -[BPSKnowledgeStorePublisher query](self, "query", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "limit"))
  {

    goto LABEL_5;
  }
  -[BPSKnowledgeStorePublisher query](self, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "limit");

  if (v6 < 0)
  {
LABEL_5:
    -[BPSKnowledgeStorePublisher setRemaining:](self, "setRemaining:", 0x7FFFFFFFFFFFFFFFLL);
    return -[BPSKnowledgeStorePublisher _updateCachedQueryResults](self, "_updateCachedQueryResults");
  }
  -[BPSKnowledgeStorePublisher query](self, "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSKnowledgeStorePublisher setRemaining:](self, "setRemaining:", objc_msgSend(v7, "limit"));

  return -[BPSKnowledgeStorePublisher _updateCachedQueryResults](self, "_updateCachedQueryResults");
}

- (id)_updateCachedQueryResults
{
  void *v3;
  uint64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  -[BPSKnowledgeStorePublisher results](self, "results");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {

    return 0;
  }
  v5 = -[BPSKnowledgeStorePublisher remaining](self, "remaining");

  if (v5 < 1)
    return 0;
  v6 = -[BPSKnowledgeStorePublisher remaining](self, "remaining");
  -[BPSKnowledgeStorePublisher query](self, "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLimit:", v6);

  -[BPSKnowledgeStorePublisher store](self, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSKnowledgeStorePublisher query](self, "query");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v8, "executeQuery:error:", v9, &v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v16;

  if (-[BPSKnowledgeStorePublisher remaining](self, "remaining") != 0x7FFFFFFFFFFFFFFFLL)
    -[BPSKnowledgeStorePublisher setRemaining:](self, "setRemaining:", -[BPSKnowledgeStorePublisher remaining](self, "remaining") - objc_msgSend(v10, "count"));
  -[BPSKnowledgeStorePublisher query](self, "query");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setOffset:", objc_msgSend(v12, "offset") + objc_msgSend(v10, "count"));

  if (v11)
  {
    -[BPSKnowledgeStorePublisher setRemaining:](self, "setRemaining:", 0);
    v13 = (void *)objc_opt_new();
    -[BPSKnowledgeStorePublisher setResults:](self, "setResults:", v13);

    v14 = v11;
  }
  else
  {
    v15 = (void *)objc_msgSend(v10, "mutableCopy");
    -[BPSKnowledgeStorePublisher setResults:](self, "setResults:", v15);

  }
  return v11;
}

- (id)nextEvent
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[BPSKnowledgeStorePublisher _updateCachedQueryResults](self, "_updateCachedQueryResults");
  -[BPSKnowledgeStorePublisher results](self, "results");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[BPSKnowledgeStorePublisher results](self, "results");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[BPSKnowledgeStorePublisher results](self, "results");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectAtIndex:", 0);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)completed
{
  void *v2;
  BOOL v3;

  -[BPSKnowledgeStorePublisher results](self, "results");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (void)reset
{
  void *v3;

  v3 = (void *)objc_opt_new();
  -[BPSKnowledgeStorePublisher setResults:](self, "setResults:", v3);

  -[BPSKnowledgeStorePublisher setRemaining:](self, "setRemaining:", 0);
}

- (_DKEventQuery)query
{
  return self->_query;
}

- (_DKKnowledgeQuerying)store
{
  return self->_store;
}

- (int64_t)remaining
{
  return self->_remaining;
}

- (void)setRemaining:(int64_t)a3
{
  self->_remaining = a3;
}

- (NSMutableArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end
