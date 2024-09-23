@implementation KGDegasAllInMemoryGraphStore

- (KGDegasAllInMemoryGraphStore)initWithURL:(id)a3
{
  id v5;
  id *v6;
  KGDegasAllInMemoryGraphStore *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KGDegasAllInMemoryGraphStore;
  v6 = -[KGMemoryGraphStore initForSubclasses](&v9, sel_initForSubclasses);
  v7 = (KGDegasAllInMemoryGraphStore *)v6;
  if (v6)
    objc_storeStrong(v6 + 15, a3);

  return v7;
}

- (BOOL)openWithMode:(unint64_t)a3 error:(id *)a4
{
  KGDatabase *v7;
  KGDatabase *database;
  BOOL v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSURL *url;
  char v15;
  id v16;
  NSObject *v17;
  _QWORD v19[6];
  _QWORD v20[6];
  id v21;
  __int128 buf;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = -[KGDatabase initWithURL:]([KGDatabase alloc], "initWithURL:", self->_url);
  database = self->_database;
  self->_database = v7;

  v9 = -[KGDatabase openWithMode:error:](self->_database, "openWithMode:error:", a3, a4);
  if (v9)
  {
    v10 = (void *)MEMORY[0x1CAA4B20C]();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v23 = 0x2020000000;
    v24 = 0;
    v11 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __51__KGDegasAllInMemoryGraphStore_openWithMode_error___block_invoke;
    v20[3] = &unk_1E83E4300;
    v20[4] = self;
    v20[5] = &buf;
    -[KGDegasAllInMemoryGraphStore enumerateModelNodesWithBlock:](self, "enumerateModelNodesWithBlock:", v20);
    -[KGMemoryGraphStore setNextNodeIdentifier:](self, "setNextNodeIdentifier:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) + 1);
    _Block_object_dispose(&buf, 8);
    objc_autoreleasePoolPop(v10);
    v12 = (void *)MEMORY[0x1CAA4B20C]();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v23 = 0x2020000000;
    v24 = 0;
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __51__KGDegasAllInMemoryGraphStore_openWithMode_error___block_invoke_2;
    v19[3] = &unk_1E83E4328;
    v19[4] = self;
    v19[5] = &buf;
    -[KGDegasAllInMemoryGraphStore enumerateModelEdgesWithBlock:](self, "enumerateModelEdgesWithBlock:", v19);
    -[KGMemoryGraphStore setNextEdgeIdentifier:](self, "setNextEdgeIdentifier:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) + 1);
    _Block_object_dispose(&buf, 8);
    objc_autoreleasePoolPop(v12);
  }
  else
  {
    v13 = (void *)objc_opt_class();
    url = self->_url;
    v21 = 0;
    v15 = objc_msgSend(v13, "destroyAtURL:error:", url, &v21);
    v16 = v21;
    if ((v15 & 1) == 0)
    {
      KGLoggingConnection();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v16;
        _os_log_error_impl(&dword_1CA0A5000, v17, OS_LOG_TYPE_ERROR, "failed to open then failed to delete: %@", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  return v9;
}

- (void)close
{
  -[KGDatabase close](self->_database, "close");
}

- (unint64_t)graphVersion
{
  return -[KGDatabase graphVersion](self->_database, "graphVersion");
}

- (void)setGraphVersion:(unint64_t)a3
{
  -[KGDatabase setGraphVersion:](self->_database, "setGraphVersion:", a3);
}

- (id)graphIdentifier
{
  return -[KGDatabase graphIdentifier](self->_database, "graphIdentifier");
}

- (BOOL)copyToURL:(id)a3 error:(id *)a4
{
  return -[KGDatabase copyToURL:error:](self->_database, "copyToURL:error:", a3, a4);
}

- (BOOL)beginTransactionWithError:(id *)a3
{
  unint64_t transactionCounter;
  BOOL result;

  transactionCounter = self->_transactionCounter;
  if (transactionCounter)
  {
    result = 1;
  }
  else
  {
    result = -[KGDatabase beginTransactionWithError:](self->_database, "beginTransactionWithError:", a3);
    transactionCounter = self->_transactionCounter;
  }
  self->_transactionCounter = transactionCounter + 1;
  return result;
}

- (BOOL)commitTransactionWithError:(id *)a3
{
  unint64_t v3;

  v3 = self->_transactionCounter - 1;
  self->_transactionCounter = v3;
  return v3 || -[KGDatabase commitTransactionWithError:](self->_database, "commitTransactionWithError:", a3);
}

- (BOOL)rollbackTransactionWithError:(id *)a3
{
  unint64_t v5;
  NSObject *v6;
  uint8_t v8[16];

  v5 = self->_transactionCounter - 1;
  self->_transactionCounter = v5;
  if (v5)
  {
    KGLoggingConnection();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_fault_impl(&dword_1CA0A5000, v6, OS_LOG_TYPE_FAULT, "graph database transaction rollback called at non-root level!", v8, 2u);
    }

  }
  return -[KGDatabase rollbackTransactionWithError:](self->_database, "rollbackTransactionWithError:", a3);
}

- (void)enumerateModelNodesWithBlock:(id)a3
{
  id v4;
  KGDatabase *database;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  database = self->_database;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__KGDegasAllInMemoryGraphStore_enumerateModelNodesWithBlock___block_invoke;
  v7[3] = &unk_1E83E4350;
  v8 = v4;
  v6 = v4;
  -[KGDatabase enumerateNodesWithIdentifiers:block:](database, "enumerateNodesWithIdentifiers:block:", 0, v7);

}

- (void)enumerateModelEdgesWithBlock:(id)a3
{
  id v4;
  KGDatabase *database;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  database = self->_database;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__KGDegasAllInMemoryGraphStore_enumerateModelEdgesWithBlock___block_invoke;
  v7[3] = &unk_1E83E4378;
  v8 = v4;
  v6 = v4;
  -[KGDatabase enumerateEdgesWithIdentifiers:block:](database, "enumerateEdgesWithIdentifiers:block:", 0, v7);

}

- (BOOL)updateNodeForIdentifier:(unint64_t)a3 withProperties:(id)a4 error:(id *)a5
{
  id v8;
  BOOL v9;
  objc_super v11;

  v8 = a4;
  if (-[KGDatabase setNodeProperties:forIdentifier:error:](self->_database, "setNodeProperties:forIdentifier:error:", v8, a3, a5))
  {
    v11.receiver = self;
    v11.super_class = (Class)KGDegasAllInMemoryGraphStore;
    v9 = -[KGMemoryGraphStore updateNodeForIdentifier:withProperties:error:](&v11, sel_updateNodeForIdentifier_withProperties_error_, a3, v8, a5);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)updateEdgeForIdentifier:(unint64_t)a3 withProperties:(id)a4 error:(id *)a5
{
  id v8;
  BOOL v9;
  objc_super v11;

  v8 = a4;
  if (-[KGDatabase setEdgeProperties:forIdentifier:error:](self->_database, "setEdgeProperties:forIdentifier:error:", v8, a3, a5))
  {
    v11.receiver = self;
    v11.super_class = (Class)KGDegasAllInMemoryGraphStore;
    v9 = -[KGMemoryGraphStore updateEdgeForIdentifier:withProperties:error:](&v11, sel_updateEdgeForIdentifier_withProperties_error_, a3, v8, a5);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)addNodes:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KGDegasAllInMemoryGraphStore;
  if (-[KGMemoryGraphStore addNodes:error:](&v9, sel_addNodes_error_, v6, a4))
    v7 = -[KGDatabase addNodes:error:](self->_database, "addNodes:error:", v6, a4);
  else
    v7 = 0;

  return v7;
}

- (BOOL)addEdges:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KGDegasAllInMemoryGraphStore;
  if (-[KGMemoryGraphStore addEdges:error:](&v9, sel_addEdges_error_, v6, a4))
    v7 = -[KGDatabase addEdges:error:](self->_database, "addEdges:error:", v6, a4);
  else
    v7 = 0;

  return v7;
}

- (id)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

uint64_t __61__KGDegasAllInMemoryGraphStore_enumerateModelEdgesWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__KGDegasAllInMemoryGraphStore_enumerateModelNodesWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __51__KGDegasAllInMemoryGraphStore_openWithMode_error___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(_QWORD *)(v2 + 24);
  if (v3 <= a2)
    v3 = a2;
  *(_QWORD *)(v2 + 24) = v3;
  return (id)objc_msgSend(*(id *)(a1 + 32), "insertNodeWithIdentifier:labels:properties:error:");
}

id __51__KGDegasAllInMemoryGraphStore_openWithMode_error___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(_QWORD *)(v2 + 24);
  if (v3 <= a2)
    v3 = a2;
  *(_QWORD *)(v2 + 24) = v3;
  return (id)objc_msgSend(*(id *)(a1 + 32), "insertEdgeWithIdentifier:labels:properties:sourceNodeIdentifier:targetNodeIdentifier:error:");
}

+ (id)persistentStoreFileExtension
{
  __CFString *v2;

  v2 = CFSTR("kgdb");
  return CFSTR("kgdb");
}

+ (BOOL)copyFromURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return +[KGDatabase copyFromURL:toURL:error:](KGDatabase, "copyFromURL:toURL:error:", a3, a4, a5);
}

+ (BOOL)destroyAtURL:(id)a3 error:(id *)a4
{
  return +[KGDatabase destroyAtURL:error:](KGDatabase, "destroyAtURL:error:", a3, a4);
}

+ (BOOL)migrateFromURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return +[KGDatabase migrateFromURL:toURL:error:](KGDatabase, "migrateFromURL:toURL:error:", a3, a4, a5);
}

@end
