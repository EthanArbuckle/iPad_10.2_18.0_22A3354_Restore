@implementation KnowledgeGraphTestEnvironment

- (KnowledgeGraphTestEnvironment)initWithKGGraph:(id)a3
{
  id v5;
  KnowledgeGraphTestEnvironment *v6;
  KnowledgeGraphTestEnvironment *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KnowledgeGraphTestEnvironment;
  v6 = -[KnowledgeGraphTestEnvironment init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_graph, a3);

  return v7;
}

- (void)closeAndDeleteEnvironment
{
  KGStoredGraph *graph;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  KGStoredGraph *v9;

  graph = self->_graph;
  if (graph)
  {
    -[KGStoredGraph store](graph, "store");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "close");

    -[KGStoredGraph store](self->_graph, "store");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_opt_class();
    -[KGStoredGraph store](self->_graph, "store");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "destroyAtURL:error:", v8, 0);

    v9 = self->_graph;
    self->_graph = 0;

  }
}

- (void)beginTransaction
{
  id v2;

  -[KGStoredGraph store](self->_graph, "store");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginTransactionWithError:", 0);

}

- (void)commitTransaction
{
  id v2;

  -[KGStoredGraph store](self->_graph, "store");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commitTransactionWithError:", 0);

}

- (id)placeholderNodeWithLabels:(id)a3 properties:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  +[KGPropertyValue kgPropertiesWithMAProperties:](KGPropertyValue, "kgPropertiesWithMAProperties:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGGraph entityFactory](self->_graph, "entityFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v6);

  objc_msgSend(v8, "nodeWithIdentifier:labels:properties:", 0, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)placeholderEdgeWithLabels:(id)a3 properties:(id)a4 sourceNode:(id)a5 targetNode:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  +[KGPropertyValue kgPropertiesWithMAProperties:](KGPropertyValue, "kgPropertiesWithMAProperties:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGGraph entityFactory](self->_graph, "entityFactory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v12);

  objc_msgSend(v14, "edgeWithIdentifier:labels:properties:sourceNode:targetNode:", 0, v15, v13, v11, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)addNodeWithLabels:(id)a3 properties:(id)a4
{
  id v6;
  id v7;
  KGGraphChangeRequest *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(KGGraphChangeRequest);
  -[KnowledgeGraphTestEnvironment placeholderNodeWithLabels:properties:](self, "placeholderNodeWithLabels:properties:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[KGGraphChangeRequest insertNode:](v8, "insertNode:", v9);
  -[KGMutableGraph performChangesAndWait:error:](self->_graph, "performChangesAndWait:error:", v8, 0);

  return v9;
}

- (id)addEdgeWithLabels:(id)a3 properties:(id)a4 sourceNode:(id)a5 targetNode:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  KGGraphChangeRequest *v14;
  void *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(KGGraphChangeRequest);
  -[KnowledgeGraphTestEnvironment placeholderEdgeWithLabels:properties:sourceNode:targetNode:](self, "placeholderEdgeWithLabels:properties:sourceNode:targetNode:", v13, v12, v11, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[KGGraphChangeRequest insertEdge:](v14, "insertEdge:", v15);
  -[KGMutableGraph performChangesAndWait:error:](self->_graph, "performChangesAndWait:error:", v14, 0);

  return v15;
}

- (id)refetchNode:(id)a3
{
  return -[KGGraph nodeForIdentifier:](self->_graph, "nodeForIdentifier:", objc_msgSend(a3, "identifier"));
}

- (id)refetchEdge:(id)a3
{
  return -[KGGraph edgeForIdentifier:](self->_graph, "edgeForIdentifier:", objc_msgSend(a3, "identifier"));
}

- (BOOL)deleteNode:(id)a3
{
  id v4;
  KGGraphChangeRequest *v5;

  v4 = a3;
  v5 = objc_alloc_init(KGGraphChangeRequest);
  -[KGGraphChangeRequest removeNode:](v5, "removeNode:", v4);

  LOBYTE(self) = -[KGMutableGraph performChangesAndWait:error:](self->_graph, "performChangesAndWait:error:", v5, 0);
  return (char)self;
}

- (BOOL)deleteEdge:(id)a3
{
  id v4;
  KGGraphChangeRequest *v5;

  v4 = a3;
  v5 = objc_alloc_init(KGGraphChangeRequest);
  -[KGGraphChangeRequest removeEdge:](v5, "removeEdge:", v4);

  LOBYTE(self) = -[KGMutableGraph performChangesAndWait:error:](self->_graph, "performChangesAndWait:error:", v5, 0);
  return (char)self;
}

- (void)populateGraph
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  -[KnowledgeGraphTestEnvironment beginTransaction](self, "beginTransaction");
  -[KnowledgeGraphTestEnvironment addNodeWithLabels:properties:](self, "addNodeWithLabels:properties:", &unk_1E83F6368, &unk_1E83F65E8);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  -[KnowledgeGraphTestEnvironment addNodeWithLabels:properties:](self, "addNodeWithLabels:properties:", &unk_1E83F6380, &unk_1E83F6610);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[KnowledgeGraphTestEnvironment addNodeWithLabels:properties:](self, "addNodeWithLabels:properties:", &unk_1E83F6398, &unk_1E83F6638);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[KnowledgeGraphTestEnvironment addNodeWithLabels:properties:](self, "addNodeWithLabels:properties:", &unk_1E83F63B0, &unk_1E83F6660);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KnowledgeGraphTestEnvironment addNodeWithLabels:properties:](self, "addNodeWithLabels:properties:", &unk_1E83F63C8, &unk_1E83F6688);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C9AA70];
  -[KnowledgeGraphTestEnvironment addNodeWithLabels:properties:](self, "addNodeWithLabels:properties:", &unk_1E83F63E0, MEMORY[0x1E0C9AA70]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[KnowledgeGraphTestEnvironment addNodeWithLabels:properties:](self, "addNodeWithLabels:properties:", &unk_1E83F63F8, v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[KnowledgeGraphTestEnvironment addNodeWithLabels:properties:](self, "addNodeWithLabels:properties:", &unk_1E83F6410, v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[KnowledgeGraphTestEnvironment addNodeWithLabels:properties:](self, "addNodeWithLabels:properties:", &unk_1E83F6428, v6);
  -[KnowledgeGraphTestEnvironment addNodeWithLabels:properties:](self, "addNodeWithLabels:properties:", &unk_1E83F6440, &unk_1E83F66B0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[KnowledgeGraphTestEnvironment addNodeWithLabels:properties:](self, "addNodeWithLabels:properties:", &unk_1E83F6458, &unk_1E83F66D8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[KnowledgeGraphTestEnvironment addNodeWithLabels:properties:](self, "addNodeWithLabels:properties:", &unk_1E83F6470, &unk_1E83F6700);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[KnowledgeGraphTestEnvironment addEdgeWithLabels:properties:sourceNode:targetNode:](self, "addEdgeWithLabels:properties:sourceNode:targetNode:", &unk_1E83F6488, v6, v25, v3);
  v13 = -[KnowledgeGraphTestEnvironment addEdgeWithLabels:properties:sourceNode:targetNode:](self, "addEdgeWithLabels:properties:sourceNode:targetNode:", &unk_1E83F64A0, v6, v25, v4);
  v14 = -[KnowledgeGraphTestEnvironment addEdgeWithLabels:properties:sourceNode:targetNode:](self, "addEdgeWithLabels:properties:sourceNode:targetNode:", &unk_1E83F64B8, v6, v5, v22);
  v15 = -[KnowledgeGraphTestEnvironment addEdgeWithLabels:properties:sourceNode:targetNode:](self, "addEdgeWithLabels:properties:sourceNode:targetNode:", &unk_1E83F64D0, v6, v25, v7);
  v16 = -[KnowledgeGraphTestEnvironment addEdgeWithLabels:properties:sourceNode:targetNode:](self, "addEdgeWithLabels:properties:sourceNode:targetNode:", &unk_1E83F64E8, v6, v3, v7);
  v17 = -[KnowledgeGraphTestEnvironment addEdgeWithLabels:properties:sourceNode:targetNode:](self, "addEdgeWithLabels:properties:sourceNode:targetNode:", &unk_1E83F6500, v6, v4, v23);
  v18 = -[KnowledgeGraphTestEnvironment addEdgeWithLabels:properties:sourceNode:targetNode:](self, "addEdgeWithLabels:properties:sourceNode:targetNode:", &unk_1E83F6518, v6, v24, v5);
  v19 = -[KnowledgeGraphTestEnvironment addEdgeWithLabels:properties:sourceNode:targetNode:](self, "addEdgeWithLabels:properties:sourceNode:targetNode:", &unk_1E83F6530, &unk_1E83F6728, v24, v3);
  v20 = -[KnowledgeGraphTestEnvironment addEdgeWithLabels:properties:sourceNode:targetNode:](self, "addEdgeWithLabels:properties:sourceNode:targetNode:", &unk_1E83F6548, &unk_1E83F6750, v9, v25);
  v21 = -[KnowledgeGraphTestEnvironment addEdgeWithLabels:properties:sourceNode:targetNode:](self, "addEdgeWithLabels:properties:sourceNode:targetNode:", &unk_1E83F6560, &unk_1E83F6778, v10, v11);
  -[KnowledgeGraphTestEnvironment commitTransaction](self, "commitTransaction");

}

- (unint64_t)nodeCount
{
  KGStoredGraph *graph;
  void *v3;
  void *v4;
  unint64_t v5;

  graph = self->_graph;
  +[KGElementFilter any](KGNodeFilter, "any");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGGraph nodeIdentifiersMatchingFilter:](graph, "nodeIdentifiersMatchingFilter:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (unint64_t)edgeCount
{
  KGStoredGraph *graph;
  void *v3;
  void *v4;
  unint64_t v5;

  graph = self->_graph;
  +[KGElementFilter any](KGEdgeFilter, "any");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGGraph edgeIdentifiersMatchingFilter:](graph, "edgeIdentifiersMatchingFilter:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (KGStoredGraph)graph
{
  return self->_graph;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graph, 0);
}

+ (id)temporaryURLWithFileExtension:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  NSTemporaryDirectory();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)environmentWithTestDBWithStoreType:(Class)a3 extraOptions:(unint64_t)a4
{
  void *v7;
  void *v8;
  id v9;
  char v10;
  id v11;
  KGLabelBasedEntityFactory *v12;
  id v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((Class)objc_opt_class() == a3)
  {
    v9 = objc_alloc_init(a3);
  }
  else
  {
    -[objc_class persistentStoreFileExtension](a3, "persistentStoreFileExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "temporaryURLWithFileExtension:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (id)objc_msgSend([a3 alloc], "initWithURL:", v8);
  }
  v16 = 0;
  v10 = objc_msgSend(v9, "openWithMode:error:", a4 | 6, &v16);
  v11 = v16;
  if ((v10 & 1) != 0)
  {
    v12 = objc_alloc_init(KGLabelBasedEntityFactory);
    v13 = -[KGStoredGraph initGraphWithStore:entityFactory:]([KGStoredGraph alloc], "initGraphWithStore:entityFactory:", v9, v12);
    v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKGGraph:", v13);

  }
  else
  {
    KGLoggingConnection();
    v12 = (KGLabelBasedEntityFactory *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v11;
      _os_log_error_impl(&dword_1CA0A5000, &v12->super, OS_LOG_TYPE_ERROR, "Error opening store %@", buf, 0xCu);
    }
    v14 = 0;
  }

  return v14;
}

+ (NSArray)matisseGraphs
{
  MAKGTestGraph *v3;
  void *v4;
  MAKGTestGraph *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = [MAKGTestGraph alloc];
  objc_msgSend(a1, "temporaryURLWithFileExtension:", CFSTR("kgdb"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MAGraph initWithPersistentStoreURL:options:error:](v3, "initWithPersistentStoreURL:options:error:", v4, 0, 0);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

+ (NSArray)testEnvironmentsForExistingStores
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  +[KnowledgeGraphTestEnvironment environmentWithTestDBWithStoreType:extraOptions:](KnowledgeGraphTestEnvironment, "environmentWithTestDBWithStoreType:extraOptions:", objc_opt_class(), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[KnowledgeGraphTestEnvironment environmentWithTestDBWithStoreType:extraOptions:](KnowledgeGraphTestEnvironment, "environmentWithTestDBWithStoreType:extraOptions:", objc_opt_class(), 0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  +[KnowledgeGraphTestEnvironment environmentWithTestDBWithStoreType:extraOptions:](KnowledgeGraphTestEnvironment, "environmentWithTestDBWithStoreType:extraOptions:", objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

+ (NSArray)testEnvironmentsForOnDiskExistingStores
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "testEnvironmentsForExistingStores");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "graph", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "store");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "persistentStoreFileExtension");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

@end
