@implementation BMPersistentDerivatives

- (BMPersistentDerivatives)initWithUpstream:(id)a3 derivativeDatabaseURL:(id)a4 derivedTableName:(id)a5
{
  id v9;
  id v10;
  id v11;
  BMPersistentDerivatives *v12;
  uint64_t v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  uint64_t v17;
  void *v18;
  BMPersistentDerivatives *v19;
  NSObject *v20;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)BMPersistentDerivatives;
  v12 = -[BMPersistentDerivatives init](&v22, sel_init);
  v13 = (uint64_t)v12;
  if (!v12)
    goto LABEL_4;
  objc_storeStrong((id *)&v12->_upstream, a3);
  objc_storeStrong((id *)(v13 + 8), a4);
  objc_storeStrong((id *)(v13 + 16), a5);
  objc_msgSend((id)v13, "upstream");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend((id)v13, "upstream");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "streamId");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(void **)(v13 + 24);
    *(_QWORD *)(v13 + 24) = v17;

LABEL_4:
    v19 = (BMPersistentDerivatives *)(id)v13;
    goto LABEL_8;
  }
  __biome_log_for_category();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    -[BMPersistentDerivatives initWithUpstream:derivativeDatabaseURL:derivedTableName:].cold.1(v13, v20);

  v19 = 0;
LABEL_8:

  return v19;
}

- (void)subscribe:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BMPersistentDerivatives subscribe:].cold.1((uint64_t)self, v5);

  v6 = objc_alloc(MEMORY[0x1E0D01BF0]);
  -[BMPersistentDerivatives url](self, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithURL:", v7);

  -[BMPersistentDerivatives tableName](self, "tableName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPersistentDerivatives streamName](self, "streamName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addManagedTable:derivedFromStream:", v9, v10);

  v11 = objc_alloc(MEMORY[0x1E0D02458]);
  -[BMPersistentDerivatives upstream](self, "upstream");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __37__BMPersistentDerivatives_subscribe___block_invoke;
  v15[3] = &unk_1E2648B10;
  v16 = v8;
  v13 = v8;
  v14 = (void *)objc_msgSend(v11, "initWithUpstream:receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:", v12, 0, v15, 0, 0, 0);
  objc_msgSend(v14, "subscribe:", v4);

}

uint64_t __37__BMPersistentDerivatives_subscribe___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "beginManagedSessionWithEvent:", a2);
}

- (id)upstreamPublishers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BMPersistentDerivatives upstream](self, "upstream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)startWithSubscriber:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = (objc_class *)MEMORY[0x1E0D01BF0];
  v5 = a3;
  v6 = [v4 alloc];
  -[BMPersistentDerivatives url](self, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithURL:", v7);
  -[BMPersistentDerivatives setManager:](self, "setManager:", v8);

  -[BMPersistentDerivatives manager](self, "manager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPersistentDerivatives tableName](self, "tableName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPersistentDerivatives streamName](self, "streamName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addManagedTable:derivedFromStream:", v10, v11);

  v14.receiver = self;
  v14.super_class = (Class)BMPersistentDerivatives;
  -[BMPersistentDerivatives startWithSubscriber:](&v14, sel_startWithSubscriber_, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)nextEvent
{
  void *v3;
  void *v4;
  void *v5;

  -[BMPersistentDerivatives upstream](self, "upstream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[BMPersistentDerivatives manager](self, "manager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "beginManagedSessionWithEvent:", v4);

  }
  return v4;
}

- (void)reset
{
  objc_super v3;

  -[BMPersistentDerivatives setManager:](self, "setManager:", 0);
  v3.receiver = self;
  v3.super_class = (Class)BMPersistentDerivatives;
  -[BMPersistentDerivatives reset](&v3, sel_reset);
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v6;
  id v7;
  BMPersistentDerivatives *v8;
  void *v9;
  void *v10;
  void *v11;
  BMPersistentDerivatives *v12;

  v6 = a3;
  v7 = a4;
  v8 = [BMPersistentDerivatives alloc];
  objc_msgSend(v7, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tableName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[BMPersistentDerivatives initWithUpstream:derivativeDatabaseURL:derivedTableName:](v8, "initWithUpstream:derivativeDatabaseURL:derivedTableName:", v9, v10, v11);

  return v12;
}

- (id)bookmarkableUpstreams
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BMPersistentDerivatives upstream](self, "upstream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 1;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (NSString)streamName
{
  return self->_streamName;
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (BMSQLStoreManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
  objc_storeStrong((id *)&self->_streamName, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)initWithUpstream:(uint64_t)a1 derivativeDatabaseURL:(NSObject *)a2 derivedTableName:.cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "%@ requires a BPSBiomeStorePublisher upstream.", (uint8_t *)&v5, 0xCu);

  OUTLINED_FUNCTION_0_0();
}

- (void)subscribe:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_18D810000, a2, OS_LOG_TYPE_DEBUG, "%@ - subscribe", (uint8_t *)&v5, 0xCu);

  OUTLINED_FUNCTION_0_0();
}

@end
