@implementation BMKnowledgeContextPublisher

- (BMKnowledgeContextPublisher)initWithQuery:(id)a3 store:(id)a4 context:(id)a5 includeLiveEvents:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BMKnowledgeContextPublisher *v31;
  BMKnowledgeContextPublisher *v33;
  BMKnowledgeContextPublisher *v34;
  objc_super v35;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_msgSend(v11, "eventStreams");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15 != 1)
  {
    __biome_log_for_category();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[BMKnowledgeContextPublisher initWithQuery:store:context:includeLiveEvents:].cold.2(v16, v24, v25, v26, v27, v28, v29, v30);
    goto LABEL_7;
  }
  if (objc_msgSend(v11, "resultType"))
  {
    __biome_log_for_category();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[BMKnowledgeContextPublisher initWithQuery:store:context:includeLiveEvents:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
LABEL_7:

    v31 = 0;
    goto LABEL_8;
  }
  v35.receiver = self;
  v35.super_class = (Class)BMKnowledgeContextPublisher;
  v33 = -[BMKnowledgeContextPublisher init](&v35, sel_init);
  v34 = v33;
  if (v33)
  {
    objc_storeStrong((id *)&v33->_query, a3);
    objc_storeStrong((id *)&v34->_store, a4);
    objc_storeStrong((id *)&v34->_context, a5);
    v34->_includeLiveEvents = a6;
  }
  self = v34;
  v31 = self;
LABEL_8:

  return v31;
}

- (id)withLiveEvents
{
  BMKnowledgeContextPublisher *v3;
  void *v4;
  void *v5;
  void *v6;
  BMKnowledgeContextPublisher *v7;

  v3 = [BMKnowledgeContextPublisher alloc];
  -[BMKnowledgeContextPublisher query](self, "query");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMKnowledgeContextPublisher store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMKnowledgeContextPublisher context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BMKnowledgeContextPublisher initWithQuery:store:context:includeLiveEvents:](v3, "initWithQuery:store:context:includeLiveEvents:", v4, v5, v6, 1);

  return v7;
}

- (void)subscribe:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BMKnowledgeContextPublisher _combinedPublisher](self, "_combinedPublisher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscribe:", v4);

}

- (id)_combinedPublisher
{
  void *v3;
  void *v4;
  void *v5;
  id DKBiomeQueryClass;
  void *v7;
  BPSKnowledgeStorePublisher *v8;
  id v9;
  NSObject *v10;
  BPSKnowledgeStorePublisher *v11;
  void (**v12)(void);
  void *v13;
  void *v14;
  BPSKnowledgeStorePublisher *v15;
  _QWORD v17[5];
  id v18;

  -[_DKEventQuery eventStreams](self->_query, "eventStreams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  DKBiomeQueryClass = get_DKBiomeQueryClass();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(DKBiomeQueryClass, "canShimDuetStreamNamed:", v5)
    && objc_msgSend(DKBiomeQueryClass, "instancesRespondToSelector:", sel_initWithDKEventQuery_)
    && objc_msgSend(DKBiomeQueryClass, "instancesRespondToSelector:", sel_publisherForQueryWithError_))
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)get_DKBiomeQueryClass()), "initWithDKEventQuery:", self->_query);
    v18 = 0;
    objc_msgSend(v7, "publisherForQueryWithError:", &v18);
    v8 = (BPSKnowledgeStorePublisher *)objc_claimAutoreleasedReturnValue();
    v9 = v18;
    if (v9)
    {
      __biome_log_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[BMKnowledgeContextPublisher _combinedPublisher].cold.1((uint64_t)v9, v10);

    }
  }
  else
  {
    v11 = [BPSKnowledgeStorePublisher alloc];
    -[BMKnowledgeContextPublisher query](self, "query");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMKnowledgeContextPublisher store](self, "store");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v8 = -[BPSKnowledgeStorePublisher initWithEventQuery:knowledgeStore:](v11, "initWithEventQuery:knowledgeStore:", v7, v9);
  }

  if (-[BMKnowledgeContextPublisher includeLiveEvents](self, "includeLiveEvents"))
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __49__BMKnowledgeContextPublisher__combinedPublisher__block_invoke;
    v17[3] = &unk_1E2649228;
    v17[4] = self;
    v12 = (void (**)(void))_Block_copy(v17);
    v12[2]();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bpsPublisher");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSKnowledgeStorePublisher mergeWithOther:](v8, "mergeWithOther:", v14);
    v15 = (BPSKnowledgeStorePublisher *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = v8;
  }

  return v15;
}

id __49__BMKnowledgeContextPublisher__combinedPublisher__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMKnowledgeContextMapping liveEventsForQuery:context:](BMKnowledgeContextMapping, "liveEventsForQuery:context:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)upstreamPublishers
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)startWithSubscriber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[BMKnowledgeContextPublisher _combinedPublisher](self, "_combinedPublisher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMKnowledgeContextPublisher setCombinedPublisher:](self, "setCombinedPublisher:", v5);

  -[BMKnowledgeContextPublisher combinedPublisher](self, "combinedPublisher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startWithSubscriber:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)nextEvent
{
  void *v2;
  void *v3;

  -[BMKnowledgeContextPublisher combinedPublisher](self, "combinedPublisher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nextEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)completed
{
  void *v2;
  char v3;

  -[BMKnowledgeContextPublisher combinedPublisher](self, "combinedPublisher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "completed");

  return v3;
}

- (void)reset
{
  void *v3;

  -[BMKnowledgeContextPublisher combinedPublisher](self, "combinedPublisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reset");

  -[BMKnowledgeContextPublisher setCombinedPublisher:](self, "setCombinedPublisher:", 0);
}

- (_DKEventQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (_DKKnowledgeQuerying)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (_CDUserContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (BOOL)includeLiveEvents
{
  return self->_includeLiveEvents;
}

- (void)setIncludeLiveEvents:(BOOL)a3
{
  self->_includeLiveEvents = a3;
}

- (BPSPublisher)combinedPublisher
{
  return self->_combinedPublisher;
}

- (void)setCombinedPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_combinedPublisher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedPublisher, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

- (void)initWithQuery:(uint64_t)a3 store:(uint64_t)a4 context:(uint64_t)a5 includeLiveEvents:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_18D810000, a1, a3, "BMCoreDuetStream requires type = _DKEventQueryResultEvents", a5, a6, a7, a8, 0);
}

- (void)initWithQuery:(uint64_t)a3 store:(uint64_t)a4 context:(uint64_t)a5 includeLiveEvents:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_18D810000, a1, a3, "BMCoreDuetStream requires exactly 1 coreduet stream to be specified by _DKEventQuery", a5, a6, a7, a8, 0);
}

- (void)_combinedPublisher
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "BMCoreDuetStream failed to create publisher with error, %@", (uint8_t *)&v2, 0xCu);
}

@end
