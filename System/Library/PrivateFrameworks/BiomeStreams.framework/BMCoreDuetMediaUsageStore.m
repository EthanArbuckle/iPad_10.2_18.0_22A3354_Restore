@implementation BMCoreDuetMediaUsageStore

- (BMCoreDuetMediaUsageStore)init
{
  BMCoreDuetMediaUsageStore *v2;
  uint64_t v3;
  _DKKnowledgeSaving *knowledgeStore;
  uint64_t v5;
  _CDClientContext *contextStore;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BMCoreDuetMediaUsageStore;
  v2 = -[BMCoreDuetMediaUsageStore init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(get_DKKnowledgeStoreClass(), "userKnowledgeStore");
    v3 = objc_claimAutoreleasedReturnValue();
    knowledgeStore = v2->_knowledgeStore;
    v2->_knowledgeStore = (_DKKnowledgeSaving *)v3;

    objc_msgSend(get_CDClientContextClass(), "userContext");
    v5 = objc_claimAutoreleasedReturnValue();
    contextStore = v2->_contextStore;
    v2->_contextStore = (_CDClientContext *)v5;

  }
  return v2;
}

- (BOOL)addContextValue:(id)a3 toArrayAtKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[BMCoreDuetMediaUsageStore contextStore](self, "contextStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v8, "addObjects:toArrayAtKeyPath:", v9, v6);
  return (char)v7;
}

- (id)removeObjectsMatchingPredicate:(id)a3 fromArrayAtKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[BMCoreDuetMediaUsageStore contextStore](self, "contextStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectsMatchingPredicate:fromArrayAtKeyPath:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)saveKnowledgeEvent:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    -[BMCoreDuetMediaUsageStore knowledgeStore](self, "knowledgeStore");
    v7 = objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NSObject saveObjects:error:](v7, "saveObjects:error:", v8, a4);

  }
  else
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BMCoreDuetMediaUsageStore saveKnowledgeEvent:error:].cold.1();
    v9 = 0;
  }

  return v9;
}

- (_DKKnowledgeSaving)knowledgeStore
{
  return self->_knowledgeStore;
}

- (_CDClientContext)contextStore
{
  return self->_contextStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextStore, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

- (void)saveKnowledgeEvent:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_6_0(&dword_18D810000, v0, v1, "Cannot save nil event to knowledge store", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
