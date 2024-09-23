@implementation MAGraph

- (MAGraph)initWithSpecification:(id)a3
{
  id v4;
  MAGraph *v5;
  uint64_t v6;
  MAGraphSpecification *specification;
  MAGraphReference *v8;
  MAKGEntityFactory *v9;
  void *v10;
  MAKGEntityFactory *v11;
  KGMemoryGraphStore *v12;
  KGStoredGraph *v13;
  KGStoredGraph *graph;
  uint64_t v15;
  NSMutableDictionary *labelByDomain;
  uint64_t v17;
  NSMutableDictionary *domainByLabel;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MAGraph;
  v5 = -[MAGraph init](&v20, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = objc_msgSend(v4, "copy");
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "defaultSpecification");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    specification = v5->_specification;
    v5->_specification = (MAGraphSpecification *)v6;

    v8 = -[MAGraphReference initWithGraph:]([MAGraphReference alloc], "initWithGraph:", v5);
    -[MAGraphSpecification setRootGraphReference:](v5->_specification, "setRootGraphReference:", v8);

    v9 = [MAKGEntityFactory alloc];
    -[MAGraph specification](v5, "specification");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MAKGEntityFactory initWithSpecification:](v9, "initWithSpecification:", v10);

    v12 = objc_alloc_init(KGMemoryGraphStore);
    v13 = -[KGStoredGraph initGraphWithStore:entityFactory:]([KGStoredGraph alloc], "initGraphWithStore:entityFactory:", v12, v11);
    graph = v5->_graph;
    v5->_graph = v13;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    labelByDomain = v5->_labelByDomain;
    v5->_labelByDomain = (NSMutableDictionary *)v15;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    domainByLabel = v5->_domainByLabel;
    v5->_domainByLabel = (NSMutableDictionary *)v17;

    v5->_labelMapLock._os_unfair_lock_opaque = 0;
    v5->_databaseStatus = 1;

  }
  return v5;
}

- (MAGraph)initWithPersistenceOptions:(int64_t)a3
{
  MAGraph *v4;
  MAGraph *v5;

  v4 = -[MAGraph init](self, "init");
  v5 = v4;
  if (v4)
    -[MAGraphSpecification setPersistenceOptions:](v4->_specification, "setPersistenceOptions:", a3);
  return v5;
}

- (MAGraph)init
{
  return -[MAGraph initWithSpecification:](self, "initWithSpecification:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[MAGraph closePersistentStore](self, "closePersistentStore");
  v3.receiver = self;
  v3.super_class = (Class)MAGraph;
  -[MAGraph dealloc](&v3, sel_dealloc);
}

- (MAGraphReference)graphReference
{
  return -[MAGraphSpecification rootGraphReference](self->_specification, "rootGraphReference");
}

- (BOOL)noFatalError
{
  unint64_t databaseStatus;

  databaseStatus = self->_databaseStatus;
  if (databaseStatus == 1)
  {
    if (-[KGGraph noFatalError](self->_graph, "noFatalError"))
    {
      databaseStatus = self->_databaseStatus;
    }
    else
    {
      databaseStatus = 0;
      self->_databaseStatus = 0;
    }
  }
  return databaseStatus == 1;
}

- (void)setHadFatalError
{
  self->_databaseStatus = 0;
}

- (id)labelsForLabel:(id)a3 domain:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(&self->_labelMapLock);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_labelByDomain, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[MAKGDomainConversion kgLabelForMADomain:](MAKGDomainConversion, "kgLabelForMADomain:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_labelByDomain, "setObject:forKeyedSubscript:", v9, v8);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_domainByLabel, "setObject:forKeyedSubscript:", v8, v9);
    }
    os_unfair_lock_unlock(&self->_labelMapLock);
    objc_msgSend(v7, "addObject:", v9);

  }
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v7, "addObject:", v6);

  return v7;
}

- (void)labelAndDomainFromLabels:(id)a3 outLabel:(id *)a4 outDomain:(unsigned __int16 *)a5
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int16 v16;
  uint64_t v17;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  os_unfair_lock_lock(&self->_labelMapLock);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_domainByLabel, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = v14;
          v16 = objc_msgSend(v14, "unsignedShortValue");
        }
        else
        {
          v17 = +[MAKGDomainConversion maDomainForKGLabel:](MAKGDomainConversion, "maDomainForKGLabel:", v13);
          if ((_DWORD)v17 == 0xFFFF)
          {
            v15 = v10;
            v16 = -1;
            v10 = v13;
          }
          else
          {
            v16 = v17;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v17);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_domainByLabel, "setObject:forKeyedSubscript:", v15, v13);
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_labelByDomain, "setObject:forKeyedSubscript:", v13, v15);
          }
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
    v16 = -1;
  }

  os_unfair_lock_unlock(&self->_labelMapLock);
  if (a4)
    *a4 = objc_retainAutorelease(v10);
  if (a5)
    *a5 = v16;

}

- (id)description
{
  return (id)-[KGStoredGraph description](self->_graph, "description");
}

- (unint64_t)version
{
  void *v2;
  unint64_t v3;

  -[KGStoredGraph store](self->_graph, "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "graphVersion");

  return v3;
}

- (void)setVersion:(unint64_t)a3
{
  id v4;

  -[KGStoredGraph store](self->_graph, "store");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGraphVersion:", a3);

}

- (NSUUID)identifier
{
  void *v2;
  void *v3;

  -[KGStoredGraph store](self->_graph, "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "graphIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (void)enterBatch
{
  void *v3;
  char v4;
  id v5;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[KGStoredGraph store](self->_graph, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v4 = objc_msgSend(v3, "beginTransactionWithError:", &v6);
  v5 = v6;

  if ((v4 & 1) == 0)
  {
    -[MAGraph setHadFatalError](self, "setHadFatalError");
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v5;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error beginning transaction: %@", buf, 0xCu);
    }
  }

}

- (void)leaveBatch
{
  void *v3;
  char v4;
  id v5;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[KGStoredGraph store](self->_graph, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v4 = objc_msgSend(v3, "commitTransactionWithError:", &v6);
  v5 = v6;

  if ((v4 & 1) == 0)
  {
    -[MAGraph setHadFatalError](self, "setHadFatalError");
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v5;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error committing transaction: %@", buf, 0xCu);
    }
  }

}

- (void)rollbackBatch
{
  void *v3;
  char v4;
  id v5;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[KGStoredGraph store](self->_graph, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v4 = objc_msgSend(v3, "rollbackTransactionWithError:", &v6);
  v5 = v6;

  if ((v4 & 1) == 0)
  {
    -[MAGraph setHadFatalError](self, "setHadFatalError");
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v5;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error rolling back transaction: %@", buf, 0xCu);
    }
  }

}

- (BOOL)isReadOnly
{
  void *v2;
  unint64_t v3;

  -[MAGraph specification](self, "specification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "persistenceOptions") >> 2) & 1;

  return v3;
}

- (BOOL)usesClassADataProtection
{
  void *v2;
  unint64_t v3;

  -[MAGraph specification](self, "specification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "persistenceOptions") >> 3) & 1;

  return v3;
}

- (BOOL)usesClassBDataProtection
{
  void *v2;
  unint64_t v3;

  -[MAGraph specification](self, "specification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "persistenceOptions") >> 4) & 1;

  return v3;
}

- (BOOL)usesClassCDataProtection
{
  void *v2;
  unint64_t v3;

  -[MAGraph specification](self, "specification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "persistenceOptions") >> 5) & 1;

  return v3;
}

- (void)executeGraphChangeRequest:(id)a3
{
  id v4;
  KGGraphChangeRequest *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  KGStoredGraph *graph;
  BOOL v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  id v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(KGGraphChangeRequest);
  if (objc_msgSend(v4, "numberOfChanges"))
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v4, "nodesToInsert");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v33 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          -[KGGraphChangeRequest insertNode:](v5, "insertNode:", v11);
          -[MAGraph specification](self, "specification");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "rootGraphReference");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setGraphReference:", v13);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
      }
      while (v8);
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v4, "edgesToInsert");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
          -[KGGraphChangeRequest insertEdge:](v5, "insertEdge:", v19);
          -[MAGraph specification](self, "specification");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "rootGraphReference");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setGraphReference:", v21);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      }
      while (v16);
    }

    objc_msgSend(v4, "nodeIdentifiersToRemove");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "count"))
      -[KGGraphChangeRequest removeNodesForIdentifiers:](v5, "removeNodesForIdentifiers:", v22);
    objc_msgSend(v4, "edgeIdentifiersToRemove");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "count"))
      -[KGGraphChangeRequest removeEdgesForIdentifiers:](v5, "removeEdgesForIdentifiers:", v23);
    graph = self->_graph;
    v27 = 0;
    v25 = -[KGMutableGraph performChangesAndWait:error:](graph, "performChangesAndWait:error:", v5, &v27);
    v26 = v27;
    if (!v25)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v26;
        _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error executing request: %@", buf, 0xCu);
      }
      -[MAGraph setHadFatalError](self, "setHadFatalError");
    }

  }
}

- (Class)nodeClass
{
  return (Class)objc_opt_class();
}

- (id)_addNodeWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  objc_class *v13;
  id v14;
  double v15;
  void *v16;
  void *v17;
  MAGraphChangeRequest *v18;

  v7 = a4;
  v10 = a6;
  v11 = a3;
  -[MAGraph specification](self, "specification");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (objc_class *)objc_msgSend(v12, "nodeClassWithLabel:domain:", v11, v7);

  v14 = [v13 alloc];
  *(float *)&v15 = a5;
  v16 = (void *)objc_msgSend(v14, "initWithLabel:domain:weight:properties:", v11, v7, v10, v15);

  -[MAGraph graphReference](self, "graphReference");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setGraphReference:", v17);

  v18 = objc_alloc_init(MAGraphChangeRequest);
  -[MAGraphChangeRequest addNode:](v18, "addNode:", v16);
  -[MAGraph executeGraphChangeRequest:](self, "executeGraphChangeRequest:", v18);

  return v16;
}

- (id)addNodeWithLabel:(id)a3
{
  double v3;

  LODWORD(v3) = 1.0;
  return -[MAGraph addNodeWithLabel:domain:weight:properties:](self, "addNodeWithLabel:domain:weight:properties:", a3, 1, MEMORY[0x1E0C9AA70], v3);
}

- (id)addNodeWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6
{
  if (!a6)
    a6 = (id)MEMORY[0x1E0C9AA70];
  return -[MAGraph _addNodeWithLabel:domain:weight:properties:](self, "_addNodeWithLabel:domain:weight:properties:", a3, a4, a6);
}

- (id)addNodeFromBase:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  int v8;
  void *v9;
  double v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "domain");
  objc_msgSend(v4, "weight");
  v8 = v7;
  objc_msgSend(v4, "propertyDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v10) = v8;
  -[MAGraph _addNodeWithLabel:domain:weight:properties:](self, "_addNodeWithLabel:domain:weight:properties:", v5, v6, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)findAndResolveUniqueNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uniquelyIdentifyingFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAGraph nodeIdentifiersMatchingFilter:](self, "nodeIdentifiersMatchingFilter:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v8 = v7;
  if (v7)
  {
    if (v7 != 1)
    {
      KGLoggingConnection();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        v12 = 134218242;
        v13 = v8;
        v14 = 2112;
        v15 = v5;
        _os_log_fault_impl(&dword_1CA0A5000, v9, OS_LOG_TYPE_FAULT, "(%lu) nodes found for unique insert with filter %@", (uint8_t *)&v12, 0x16u);
      }

    }
    -[MAGraph graphReference](self, "graphReference");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setGraphReference:", v10);

    objc_msgSend(v4, "resolveIdentifier:", objc_msgSend(v6, "firstElement"));
  }

  return v8 != 0;
}

- (void)addUniqueNode:(id)a3 didInsert:(BOOL *)a4
{
  BOOL v6;
  MAGraphChangeRequest *v7;
  id v8;

  v8 = a3;
  v6 = -[MAGraph findAndResolveUniqueNode:](self, "findAndResolveUniqueNode:");
  if (a4)
    *a4 = !v6;
  if (!v6)
  {
    v7 = objc_alloc_init(MAGraphChangeRequest);
    -[MAGraphChangeRequest addNode:](v7, "addNode:", v8);
    -[MAGraph executeGraphChangeRequest:](self, "executeGraphChangeRequest:", v7);

  }
}

- (BOOL)findAndResolveUniqueEdge:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  KGElementIdentifierSet *v11;
  KGElementIdentifierSet *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1CAA4B20C]();
  objc_msgSend(v4, "sourceNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "identifier");

  objc_msgSend(v4, "targetNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "identifier");

  v10 = 0;
  if (v7 && v9)
  {
    v11 = -[KGElementIdentifierSet initWithElementIdentifier:]([KGElementIdentifierSet alloc], "initWithElementIdentifier:", v7);
    v12 = -[KGElementIdentifierSet initWithElementIdentifier:]([KGElementIdentifierSet alloc], "initWithElementIdentifier:", v9);
    objc_msgSend(v4, "uniquelyIdentifyingFilter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAGraph edgeIdentifiersOfType:betweenNodesForIdentifiers:andNodesForIdentifiers:matchingFilter:](self, "edgeIdentifiersOfType:betweenNodesForIdentifiers:andNodesForIdentifiers:matchingFilter:", 2, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");
    v10 = v15 != 0;
    if (v15)
    {
      v16 = v15;
      if (v15 != 1)
      {
        KGLoggingConnection();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          v20 = 134218242;
          v21 = v16;
          v22 = 2112;
          v23 = v13;
          _os_log_fault_impl(&dword_1CA0A5000, v17, OS_LOG_TYPE_FAULT, "(%lu) edges found for unique insert with filter %@", (uint8_t *)&v20, 0x16u);
        }

      }
      -[MAGraph graphReference](self, "graphReference");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setGraphReference:", v18);

      objc_msgSend(v4, "resolveIdentifier:", objc_msgSend(v14, "firstElement"));
    }

  }
  objc_autoreleasePoolPop(v5);

  return v10;
}

- (id)addUniqueNodeWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6 didCreate:(BOOL *)a7
{
  uint64_t v10;
  id v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  id v17;
  id v18;
  void *v19;

  v10 = a4;
  v12 = a3;
  v13 = a6;
  -[MAGraph nodesForLabel:domain:properties:](self, "nodesForLabel:domain:properties:", v12, v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "anyObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v17 = v15;
  }
  else
  {
    if (a7)
      *a7 = 1;
    if (v13)
      v18 = v13;
    else
      v18 = (id)MEMORY[0x1E0C9AA70];
    *(float *)&v16 = a5;
    -[MAGraph _addNodeWithLabel:domain:weight:properties:](self, "_addNodeWithLabel:domain:weight:properties:", v12, v10, v18, v16);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v17;

  return v19;
}

- (id)addUniquelyIdentifiedNodeWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6 didCreate:(BOOL *)a7
{
  uint64_t v10;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  double v25;
  uint64_t v26;
  void *v27;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v10 = a4;
  v12 = a3;
  v13 = a6;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  v39 = 0;
  v14 = (void *)MEMORY[0x1CAA4B20C]();
  -[MAGraph nodesForLabel:domain:properties:](self, "nodesForLabel:domain:properties:", v12, v10, MEMORY[0x1E0C9AA70]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __81__MAGraph_addUniquelyIdentifiedNodeWithLabel_domain_weight_properties_didCreate___block_invoke;
  v31[3] = &unk_1E83E2458;
  v16 = v13;
  v32 = v16;
  v33 = &v34;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v31);
  v18 = v35[5];
  if (v18)
  {
    objc_msgSend((id)v35[5], "changingPropertiesWithProperties:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "count"))
    {
      v20 = objc_msgSend((id)v35[5], "identifier");
      -[MAGraph persistModelProperties:forNodeWithIdentifier:clobberExisting:](self, "persistModelProperties:forNodeWithIdentifier:clobberExisting:", v19, v20, 0);
      v29 = v14;
      objc_msgSend((id)v35[5], "graphReference");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v35[5], "propertyDictionary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v21, "mutableCopy");

      objc_msgSend(v22, "addEntriesFromDictionary:", v19);
      v23 = objc_alloc((Class)objc_opt_class());
      objc_msgSend((id)v35[5], "label");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v25 = a5;
      v26 = objc_msgSend(v23, "initWithLabel:domain:weight:properties:", v24, v10, v22, v25);
      v27 = (void *)v35[5];
      v35[5] = v26;

      objc_msgSend((id)v35[5], "setIdentifier:", v20);
      objc_msgSend((id)v35[5], "setGraphReference:", v30);

      v14 = v29;
    }

  }
  else
  {
    if (a7)
      *a7 = 1;
    *(float *)&v17 = a5;
    -[MAGraph _addNodeWithLabel:domain:weight:properties:](self, "_addNodeWithLabel:domain:weight:properties:", v12, v10, v16, v17);
    v10 = objc_claimAutoreleasedReturnValue();
  }

  objc_autoreleasePoolPop(v14);
  if (v18)
    v10 = (uint64_t)(id)v35[5];
  _Block_object_dispose(&v34, 8);

  return (id)v10;
}

- (void)legacyRemoveNodes:(id)a3
{
  id v4;
  MAGraphChangeRequest *v5;
  MANodeCollection *v6;

  v4 = a3;
  v6 = -[MAElementCollection initWithSet:graph:]([MANodeCollection alloc], "initWithSet:graph:", v4, self);

  v5 = objc_alloc_init(MAGraphChangeRequest);
  -[MAGraphChangeRequest removeNodes:](v5, "removeNodes:", v6);
  -[MAGraph executeGraphChangeRequest:](self, "executeGraphChangeRequest:", v5);

}

- (id)nodeForIdentifier:(unint64_t)a3
{
  return -[KGGraph nodeForIdentifier:](self->_graph, "nodeForIdentifier:", a3);
}

- (id)nodesForIdentifiers:(id)a3
{
  void *v3;
  void *v4;

  -[KGGraph nodesForIdentifiers:](self->_graph, "nodesForIdentifiers:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)nodeIdentifiersMatchingFilter:(id)a3
{
  KGStoredGraph *graph;
  void *v4;
  void *v5;
  void *v6;
  KGElementIdentifierSet *v7;
  KGElementIdentifierSet *v8;

  graph = self->_graph;
  objc_msgSend(a3, "kgNodeFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGGraph nodeIdentifiersMatchingFilter:](graph, "nodeIdentifiersMatchingFilter:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = objc_alloc_init(KGElementIdentifierSet);
  v8 = v7;

  return v8;
}

- (id)nodeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4
{
  KGStoredGraph *graph;
  id v6;
  void *v7;
  void *v8;

  graph = self->_graph;
  v6 = a4;
  objc_msgSend(a3, "kgNodeFilter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGGraph nodeIdentifiersMatchingFilter:intersectingIdentifiers:](graph, "nodeIdentifiersMatchingFilter:intersectingIdentifiers:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)nodesForLabel:(id)a3 domain:(unsigned __int16)a4
{
  return -[MAGraph nodesForLabel:domain:properties:](self, "nodesForLabel:domain:properties:", a3, a4, MEMORY[0x1E0C9AA70]);
}

- (id)nodesForLabel:(id)a3
{
  return -[MAGraph nodesForLabel:domain:properties:](self, "nodesForLabel:domain:properties:", a3, 0, MEMORY[0x1E0C9AA70]);
}

- (id)anyNodeForLabel:(id)a3 domain:(unsigned __int16)a4
{
  void *v4;
  void *v5;

  -[MAGraph nodesForLabel:domain:](self, "nodesForLabel:domain:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)anyNodeForLabel:(id)a3
{
  return -[MAGraph anyNodeForLabel:domain:properties:](self, "anyNodeForLabel:domain:properties:", a3, 0, MEMORY[0x1E0C9AA70]);
}

- (unint64_t)nodesCountForLabel:(id)a3 domain:(unsigned __int16)a4
{
  return -[MAGraph nodesCountForLabel:domain:properties:](self, "nodesCountForLabel:domain:properties:", a3, a4, MEMORY[0x1E0C9AA70]);
}

- (unint64_t)nodesCountForLabel:(id)a3
{
  return -[MAGraph nodesCountForLabel:domain:properties:](self, "nodesCountForLabel:domain:properties:", a3, 0, MEMORY[0x1E0C9AA70]);
}

- (id)_nodeIdentifiersWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  MANodeFilter *v10;
  id v11;
  MANodeFilter *v12;
  void *v13;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = [MANodeFilter alloc];
  if (v8)
    v11 = v8;
  else
    v11 = (id)MEMORY[0x1E0C9AA70];
  v12 = -[MAElementFilter initWithLabel:domain:properties:](v10, "initWithLabel:domain:properties:", v9, v5, v11);

  -[MAGraph nodeIdentifiersMatchingFilter:](self, "nodeIdentifiersMatchingFilter:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)anyNodeMatchingFilter:(id)a3
{
  void *v4;
  void *v5;

  -[MAGraph nodeIdentifiersMatchingFilter:](self, "nodeIdentifiersMatchingFilter:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGGraph nodeForIdentifier:](self->_graph, "nodeForIdentifier:", objc_msgSend(v4, "firstElement"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)anyNodeForLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  MANodeFilter *v10;
  void *v11;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = -[MAElementFilter initWithLabel:domain:properties:]([MANodeFilter alloc], "initWithLabel:domain:properties:", v9, v5, v8);

  -[MAGraph anyNodeMatchingFilter:](self, "anyNodeMatchingFilter:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)nodesForLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  void *v6;
  void *v7;
  void *v8;

  -[MAGraph _nodeIdentifiersWithLabel:domain:properties:](self, "_nodeIdentifiersWithLabel:domain:properties:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGGraph nodesForIdentifiers:](self->_graph, "nodesForIdentifiers:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)numberOfNodesMatchingFilter:(id)a3
{
  void *v3;
  unint64_t v4;

  -[MAGraph nodeIdentifiersMatchingFilter:](self, "nodeIdentifiersMatchingFilter:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (unint64_t)nodesCountForLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  void *v5;
  unint64_t v6;

  -[MAGraph _nodeIdentifiersWithLabel:domain:properties:](self, "_nodeIdentifiersWithLabel:domain:properties:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (id)nodesForDomain:(unsigned __int16)a3
{
  return -[MAGraph nodesForLabel:domain:properties:](self, "nodesForLabel:domain:properties:", 0, a3, MEMORY[0x1E0C9AA70]);
}

- (id)nodesForDomain:(unsigned __int16)a3 properties:(id)a4
{
  return -[MAGraph nodesForLabel:domain:properties:](self, "nodesForLabel:domain:properties:", 0, a3, a4);
}

- (unint64_t)nodesCountForDomain:(unsigned __int16)a3
{
  return -[MAGraph nodesCountForLabel:domain:properties:](self, "nodesCountForLabel:domain:properties:", 0, a3, MEMORY[0x1E0C9AA70]);
}

- (unint64_t)nodesCount
{
  return -[MAGraph nodesCountForLabel:domain:properties:](self, "nodesCountForLabel:domain:properties:", 0, 0, MEMORY[0x1E0C9AA70]);
}

- (id)nodesLabels
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[KGGraph nodeLabels](self->_graph, "nodeLabels", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (+[MAKGDomainConversion maDomainForKGLabel:](MAKGDomainConversion, "maDomainForKGLabel:", v9) == 0xFFFF)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)nodesDomains
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[KGGraph nodeLabels](self->_graph, "nodeLabels", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = +[MAKGDomainConversion maDomainForKGLabel:](MAKGDomainConversion, "maDomainForKGLabel:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        if (v9 != 0xFFFF)
          objc_msgSend(v3, "addIndex:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)labelsAndDomainsOfNodesForIdentifiers:(id)a3 labels:(id *)a4 domains:(id *)a5
{
  id v7;

  -[KGGraph labelsOfNodesForIdentifiers:](self->_graph, "labelsOfNodesForIdentifiers:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  MALabelsAndDomainsFromKGLabels(v7, a4, a5);

}

- (void)labelsAndDomainsOfEdgesForIdentifiers:(id)a3 labels:(id *)a4 domains:(id *)a5
{
  id v7;

  -[KGGraph labelsOfEdgesForIdentifiers:](self->_graph, "labelsOfEdgesForIdentifiers:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  MALabelsAndDomainsFromKGLabels(v7, a4, a5);

}

- (id)adjacencyWithSources:(id)a3 relation:(id)a4
{
  return (id)objc_msgSend(a4, "adjacencyWithStartNodeIdentifiers:graph:", a3, self);
}

- (id)adjacencyWithStartNodeIdentifiers:(id)a3 edgeFilter:(id)a4 edgeType:(unint64_t)a5
{
  char v5;
  id v8;
  id v9;
  KGDirectedBinaryAdjacency *v10;
  KGDirectedBinaryAdjacency *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(KGDirectedBinaryAdjacency);
  v11 = objc_alloc_init(KGDirectedBinaryAdjacency);
  if ((v5 & 2) != 0)
  {
    -[MAGraph edgeIdentifiersOfType:onNodesForIdentifiers:matchingFilter:](self, "edgeIdentifiersOfType:onNodesForIdentifiers:matchingFilter:", 2, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAGraph targetsBySourceWithEdgeIdentifiers:](self, "targetsBySourceWithEdgeIdentifiers:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (KGDirectedBinaryAdjacency *)v13;
  }
  if ((v5 & 1) != 0)
  {
    -[MAGraph edgeIdentifiersOfType:onNodesForIdentifiers:matchingFilter:](self, "edgeIdentifiersOfType:onNodesForIdentifiers:matchingFilter:", 1, v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAGraph sourcesByTargetWithEdgeIdentifiers:](self, "sourcesByTargetWithEdgeIdentifiers:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v11 = (KGDirectedBinaryAdjacency *)v15;
  }
  -[KGDirectedBinaryAdjacency unionWith:](v10, "unionWith:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)adjacencyWithEndNodeIdentifiers:(id)a3 edgeFilter:(id)a4 edgeType:(unint64_t)a5
{
  char v5;
  id v8;
  id v9;
  KGDirectedBinaryAdjacency *v10;
  KGDirectedBinaryAdjacency *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(KGDirectedBinaryAdjacency);
  v11 = objc_alloc_init(KGDirectedBinaryAdjacency);
  if ((v5 & 2) != 0)
  {
    -[MAGraph edgeIdentifiersOfType:onNodesForIdentifiers:matchingFilter:](self, "edgeIdentifiersOfType:onNodesForIdentifiers:matchingFilter:", 1, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAGraph targetsBySourceWithEdgeIdentifiers:](self, "targetsBySourceWithEdgeIdentifiers:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (KGDirectedBinaryAdjacency *)v13;
  }
  if ((v5 & 1) != 0)
  {
    -[MAGraph edgeIdentifiersOfType:onNodesForIdentifiers:matchingFilter:](self, "edgeIdentifiersOfType:onNodesForIdentifiers:matchingFilter:", 2, v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAGraph sourcesByTargetWithEdgeIdentifiers:](self, "sourcesByTargetWithEdgeIdentifiers:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v11 = (KGDirectedBinaryAdjacency *)v15;
  }
  -[KGDirectedBinaryAdjacency unionWith:](v10, "unionWith:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)enumerateNodesWithIdentifiers:(id)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1CAA4B20C]();
  -[KGGraph nodesForIdentifiers:](self->_graph, "nodesForIdentifiers:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enumerateNodesUsingBlock:", v6);

  objc_autoreleasePoolPop(v7);
}

- (void)enumerateNodesWithIdentifiers:(id)a3 sortedByStringPropertyForName:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1CAA4B20C]();
  -[KGGraph nodesForIdentifiers:](self->_graph, "nodesForIdentifiers:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enumerateNodesSortedByStringPropertyForName:usingBlock:", v8, v9);

  objc_autoreleasePoolPop(v10);
}

- (void)enumerateNodesWithIdentifiers:(id)a3 sortedByIntegerPropertyForName:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1CAA4B20C]();
  -[KGGraph nodesForIdentifiers:](self->_graph, "nodesForIdentifiers:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enumerateNodesSortedByIntegerPropertyForName:usingBlock:", v8, v9);

  objc_autoreleasePoolPop(v10);
}

- (void)enumerateNodesWithIdentifiers:(id)a3 sortedByFloatPropertyForName:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1CAA4B20C]();
  -[KGGraph nodesForIdentifiers:](self->_graph, "nodesForIdentifiers:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enumerateNodesSortedByFloatPropertyForName:usingBlock:", v8, v9);

  objc_autoreleasePoolPop(v10);
}

- (void)enumerateNodeIdentifiers:(id)a3 sortedByStringPropertyForName:(id)a4 ascending:(BOOL)a5 usingBlock:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a5;
  v14 = a3;
  v10 = a4;
  v11 = a6;
  v12 = (void *)MEMORY[0x1CAA4B20C]();
  -[KGGraph nodesForIdentifiers:](self->_graph, "nodesForIdentifiers:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "enumerateIdentifiersSortedByStringPropertyForName:ascending:usingBlock:", v10, v7, v11);

  objc_autoreleasePoolPop(v12);
}

- (void)enumerateNodeIdentifiers:(id)a3 sortedByIntegerPropertyForName:(id)a4 ascending:(BOOL)a5 usingBlock:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a5;
  v14 = a3;
  v10 = a4;
  v11 = a6;
  v12 = (void *)MEMORY[0x1CAA4B20C]();
  -[KGGraph nodesForIdentifiers:](self->_graph, "nodesForIdentifiers:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "enumerateIdentifiersSortedByIntegerPropertyForName:ascending:usingBlock:", v10, v7, v11);

  objc_autoreleasePoolPop(v12);
}

- (void)enumerateNodeIdentifiers:(id)a3 sortedByDoublePropertyForName:(id)a4 ascending:(BOOL)a5 usingBlock:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a5;
  v14 = a3;
  v10 = a4;
  v11 = a6;
  v12 = (void *)MEMORY[0x1CAA4B20C]();
  -[KGGraph nodesForIdentifiers:](self->_graph, "nodesForIdentifiers:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "enumerateIdentifiersSortedByDoublePropertyForName:ascending:usingBlock:", v10, v7, v11);

  objc_autoreleasePoolPop(v12);
}

- (void)enumerateNodeIdentifiers:(id)a3 sortedByUnsignedIntegerPropertyForName:(id)a4 ascending:(BOOL)a5 usingBlock:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a5;
  v14 = a3;
  v10 = a4;
  v11 = a6;
  v12 = (void *)MEMORY[0x1CAA4B20C]();
  -[KGGraph nodesForIdentifiers:](self->_graph, "nodesForIdentifiers:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "enumerateIdentifiersSortedByUnsignedIntegerPropertyForName:ascending:usingBlock:", v10, v7, v11);

  objc_autoreleasePoolPop(v12);
}

- (void)enumerateNodesWithLabel:(id)a3 domain:(unsigned __int16)a4 usingBlock:(id)a5
{
  -[MAGraph enumerateNodesWithLabel:domain:properties:usingBlock:](self, "enumerateNodesWithLabel:domain:properties:usingBlock:", a3, a4, MEMORY[0x1E0C9AA70], a5);
}

- (void)enumerateNodesMatchingFilter:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[MAGraph nodeIdentifiersMatchingFilter:](self, "nodeIdentifiersMatchingFilter:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MAGraph enumerateNodesWithIdentifiers:usingBlock:](self, "enumerateNodesWithIdentifiers:usingBlock:", v7, v6);

}

- (void)enumerateNodesWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5 usingBlock:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  MANodeFilter *v13;

  v7 = a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = -[MAElementFilter initWithLabel:domain:properties:]([MANodeFilter alloc], "initWithLabel:domain:properties:", v12, v7, v11);

  -[MAGraph enumerateNodesMatchingFilter:usingBlock:](self, "enumerateNodesMatchingFilter:usingBlock:", v13, v10);
}

- (void)enumerateNodesInDomain:(unsigned __int16)a3 usingBlock:(id)a4
{
  -[MAGraph enumerateNodesWithLabel:domain:properties:usingBlock:](self, "enumerateNodesWithLabel:domain:properties:usingBlock:", 0, a3, MEMORY[0x1E0C9AA70], a4);
}

- (void)enumerateNodesWithBlock:(id)a3
{
  -[MAGraph enumerateNodesWithLabel:domain:properties:usingBlock:](self, "enumerateNodesWithLabel:domain:properties:usingBlock:", 0, 0, MEMORY[0x1E0C9AA70], a3);
}

- (id)allNodes
{
  return -[MAGraph nodesForLabel:domain:properties:](self, "nodesForLabel:domain:properties:", 0, 0, MEMORY[0x1E0C9AA70]);
}

- (id)neighborNodeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeType:(unint64_t)a4 edgeFilter:(id)a5
{
  KGStoredGraph *graph;
  id v8;
  void *v9;
  void *v10;

  graph = self->_graph;
  v8 = a3;
  objc_msgSend(a5, "kgEdgeFilter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGGraph neighborNodeIdentifiersWithStartNodeIdentifiers:edgeDirection:edgeFilter:](graph, "neighborNodeIdentifiersWithStartNodeIdentifiers:edgeDirection:edgeFilter:", v8, a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)transitiveClosureNeighborNodeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeType:(unint64_t)a4 edgeFilter:(id)a5
{
  KGStoredGraph *graph;
  id v8;
  void *v9;
  void *v10;

  graph = self->_graph;
  v8 = a3;
  objc_msgSend(a5, "kgEdgeFilter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGGraph transitiveClosureNeighborNodeIdentifiersWithStartNodeIdentifiers:edgeDirection:edgeFilter:](graph, "transitiveClosureNeighborNodeIdentifiersWithStartNodeIdentifiers:edgeDirection:edgeFilter:", v8, a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)orphanNodes
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x1CAA4B20C](self, a2);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __22__MAGraph_orphanNodes__block_invoke;
  v8[3] = &unk_1E83E5178;
  v9 = v4;
  v5 = v4;
  -[MAGraph enumerateNodesWithBlock:](self, "enumerateNodesWithBlock:", v8);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v6;
}

- (id)graphNode
{
  MAAbstractNode *v3;
  void *v4;
  void *v5;
  double v6;
  MAAbstractNode *v7;

  v3 = [MAAbstractNode alloc];
  -[MAGraph identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 1.0;
  v7 = -[MAAbstractNode initWithLabel:domain:weight:properties:](v3, "initWithLabel:domain:weight:properties:", v5, 1, MEMORY[0x1E0C9AA70], v6);

  return v7;
}

- (BOOL)edgesStoreWeakReferencesToNodes
{
  return 0;
}

- (id)_addEdgeWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
{
  uint64_t v9;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  objc_class *v19;
  id v20;
  double v21;
  void *v22;
  void *v23;
  KGGraphChangeRequest *v24;
  KGStoredGraph *graph;
  id v26;
  id v27;
  id v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v9 = a6;
  v32 = *MEMORY[0x1E0C80C00];
  v14 = a8;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  -[MAGraph specification](self, "specification");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (objc_class *)objc_msgSend(v18, "edgeClassWithLabel:domain:", v17, v9);

  v20 = [v19 alloc];
  *(float *)&v21 = a7;
  v22 = (void *)objc_msgSend(v20, "initWithLabel:sourceNode:targetNode:domain:weight:properties:", v17, v16, v15, v9, v14, v21);

  -[MAGraph graphReference](self, "graphReference");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setGraphReference:", v23);

  v24 = objc_alloc_init(KGGraphChangeRequest);
  -[KGGraphChangeRequest insertEdge:](v24, "insertEdge:", v22);
  graph = self->_graph;
  v29 = 0;
  LOBYTE(v17) = -[KGMutableGraph performChangesAndWait:error:](graph, "performChangesAndWait:error:", v24, &v29);
  v26 = v29;
  if ((v17 & 1) != 0)
  {
    v27 = v22;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v26;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error adding edge: %@", buf, 0xCu);
    }
    -[MAGraph setHadFatalError](self, "setHadFatalError");
    v27 = 0;
  }

  return v27;
}

- (id)addEdgeWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
{
  uint64_t v10;
  id v14;
  id v15;
  id v16;
  id v17;
  MAGraph *v18;
  double v19;
  id v20;
  void *v21;

  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v18 = self;
  objc_sync_enter(v18);
  if (v17)
    v20 = v17;
  else
    v20 = (id)MEMORY[0x1E0C9AA70];
  *(float *)&v19 = a7;
  -[MAGraph _addEdgeWithLabel:sourceNode:targetNode:domain:weight:properties:](v18, "_addEdgeWithLabel:sourceNode:targetNode:domain:weight:properties:", v14, v15, v16, v10, v20, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v18);

  return v21;
}

- (id)addEdgeWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5
{
  double v5;

  LODWORD(v5) = 1.0;
  return -[MAGraph addEdgeWithLabel:sourceNode:targetNode:domain:weight:properties:](self, "addEdgeWithLabel:sourceNode:targetNode:domain:weight:properties:", a3, a4, a5, 1, MEMORY[0x1E0C9AA70], v5);
}

- (id)addEdgeFromBase:(id)a3 sourceNode:(id)a4 targetNode:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  int v13;
  int v14;
  void *v15;
  double v16;
  void *v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "domain");
  objc_msgSend(v10, "weight");
  v14 = v13;
  objc_msgSend(v10, "propertyDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v16) = v14;
  -[MAGraph addEdgeWithLabel:sourceNode:targetNode:domain:weight:properties:](self, "addEdgeWithLabel:sourceNode:targetNode:domain:weight:properties:", v11, v9, v8, v12, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)legacyRemoveEdges:(id)a3
{
  id v4;
  MAGraphChangeRequest *v5;
  MAEdgeCollection *v6;

  v4 = a3;
  v6 = -[MAElementCollection initWithSet:graph:]([MAEdgeCollection alloc], "initWithSet:graph:", v4, self);

  v5 = objc_alloc_init(MAGraphChangeRequest);
  -[MAGraphChangeRequest removeEdges:](v5, "removeEdges:", v6);
  -[MAGraph executeGraphChangeRequest:](self, "executeGraphChangeRequest:", v5);

}

- (id)edgeForIdentifier:(unint64_t)a3
{
  return -[KGGraph edgeForIdentifier:](self->_graph, "edgeForIdentifier:", a3);
}

- (id)edgesForIdentifiers:(id)a3
{
  void *v3;
  void *v4;

  -[KGGraph edgesForIdentifiers:](self->_graph, "edgesForIdentifiers:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)edgeIdentifiersMatchingFilter:(id)a3
{
  KGStoredGraph *graph;
  void *v4;
  void *v5;
  void *v6;
  KGElementIdentifierSet *v7;
  KGElementIdentifierSet *v8;

  graph = self->_graph;
  objc_msgSend(a3, "kgEdgeFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGGraph edgeIdentifiersMatchingFilter:](graph, "edgeIdentifiersMatchingFilter:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = objc_alloc_init(KGElementIdentifierSet);
  v8 = v7;

  return v8;
}

- (id)edgeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4
{
  KGStoredGraph *graph;
  id v6;
  void *v7;
  void *v8;

  graph = self->_graph;
  v6 = a4;
  objc_msgSend(a3, "kgEdgeFilter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGGraph edgeIdentifiersMatchingFilter:intersectingIdentifiers:](graph, "edgeIdentifiersMatchingFilter:intersectingIdentifiers:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)numberOfEdgesMatchingFilter:(id)a3
{
  void *v3;
  unint64_t v4;

  -[MAGraph edgeIdentifiersMatchingFilter:](self, "edgeIdentifiersMatchingFilter:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)edgesForLabel:(id)a3
{
  return -[MAGraph edgesForLabel:domain:properties:](self, "edgesForLabel:domain:properties:", a3, 0, MEMORY[0x1E0C9AA70]);
}

- (id)edgesForLabel:(id)a3 domain:(unsigned __int16)a4
{
  return -[MAGraph edgesForLabel:domain:properties:](self, "edgesForLabel:domain:properties:", a3, a4, MEMORY[0x1E0C9AA70]);
}

- (id)_edgeIdentifiersWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  MAEdgeFilter *v10;
  id v11;
  MAEdgeFilter *v12;
  void *v13;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = [MAEdgeFilter alloc];
  if (v8)
    v11 = v8;
  else
    v11 = (id)MEMORY[0x1E0C9AA70];
  v12 = -[MAElementFilter initWithLabel:domain:properties:](v10, "initWithLabel:domain:properties:", v9, v5, v11);

  -[MAGraph edgeIdentifiersMatchingFilter:](self, "edgeIdentifiersMatchingFilter:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)edgesForLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  void *v6;
  void *v7;
  void *v8;

  -[MAGraph _edgeIdentifiersWithLabel:domain:properties:](self, "_edgeIdentifiersWithLabel:domain:properties:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGGraph edgesForIdentifiers:](self->_graph, "edgesForIdentifiers:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_anyEdgeWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
{
  uint64_t v9;
  id v13;
  id v14;
  id v15;
  id v16;
  KGElementIdentifierSet *v17;
  uint64_t v18;
  KGElementIdentifierSet *v19;
  void *v20;
  void *v21;
  KGElementIdentifierSet *v22;
  void *v23;
  void *v24;
  void *v25;
  MAEdgeFilter *v27;

  v9 = a6;
  v13 = a3;
  v14 = a5;
  v15 = a8;
  v16 = a4;
  v17 = [KGElementIdentifierSet alloc];
  v18 = objc_msgSend(v16, "identifier");

  v19 = -[KGElementIdentifierSet initWithElementIdentifier:](v17, "initWithElementIdentifier:", v18);
  -[KGGraph edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:](self->_graph, "edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:", v19, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[KGElementIdentifierSet isEmpty](v19, "isEmpty"))
  {
    v21 = 0;
  }
  else
  {
    v22 = -[KGElementIdentifierSet initWithElementIdentifier:]([KGElementIdentifierSet alloc], "initWithElementIdentifier:", objc_msgSend(v14, "identifier"));
    -[KGGraph edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:](self->_graph, "edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:", v22, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[KGElementIdentifierSet isEmpty](v22, "isEmpty"))
    {
      v21 = 0;
    }
    else
    {
      objc_msgSend(v23, "identifierSetByIntersectingIdentifierSet:", v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v24, "isEmpty") & 1) != 0)
      {
        v21 = 0;
      }
      else
      {
        v27 = -[MAElementFilter initWithLabel:domain:properties:]([MAEdgeFilter alloc], "initWithLabel:domain:properties:", v13, v9, v15);
        -[MAGraph edgeIdentifiersMatchingFilter:intersectingIdentifiers:](self, "edgeIdentifiersMatchingFilter:intersectingIdentifiers:", v27, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[KGGraph edgeForIdentifier:](self->_graph, "edgeForIdentifier:", objc_msgSend(v25, "firstElement"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  return v21;
}

- (id)addUniqueEdgeWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
{
  uint64_t v10;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  id v22;

  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v18 = (void *)MEMORY[0x1CAA4B20C]();
  *(float *)&v19 = a7;
  -[MAGraph _anyEdgeWithLabel:sourceNode:targetNode:domain:weight:properties:](self, "_anyEdgeWithLabel:sourceNode:targetNode:domain:weight:properties:", v14, v15, v16, v10, v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    if (v17)
      v22 = v17;
    else
      v22 = (id)MEMORY[0x1E0C9AA70];
    *(float *)&v21 = a7;
    -[MAGraph _addEdgeWithLabel:sourceNode:targetNode:domain:weight:properties:](self, "_addEdgeWithLabel:sourceNode:targetNode:domain:weight:properties:", v14, v15, v16, v10, v22, v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_autoreleasePoolPop(v18);

  return v20;
}

- (unint64_t)edgesCount
{
  return -[MAGraph edgesCountForLabel:domain:properties:](self, "edgesCountForLabel:domain:properties:", 0, 0, MEMORY[0x1E0C9AA70]);
}

- (unint64_t)edgesCountForLabel:(id)a3
{
  return -[MAGraph edgesCountForLabel:domain:properties:](self, "edgesCountForLabel:domain:properties:", a3, 0, MEMORY[0x1E0C9AA70]);
}

- (id)edgesLabels
{
  void *v2;
  void *v3;
  void *v4;

  -[KGGraph edgeLabels](self->_graph, "edgeLabels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (SELF beginswith 'domain')"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredSetUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)edgesDomains
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[KGGraph edgeLabels](self->_graph, "edgeLabels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF beginswith 'domain'"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredSetUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "substringFromIndex:", 7, (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addIndex:", objc_msgSend(v11, "integerValue"));

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (unint64_t)edgesCountForLabel:(id)a3 domain:(unsigned __int16)a4
{
  return -[MAGraph edgesCountForLabel:domain:properties:](self, "edgesCountForLabel:domain:properties:", a3, a4, MEMORY[0x1E0C9AA70]);
}

- (unint64_t)edgesCountForLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  void *v5;
  unint64_t v6;

  -[MAGraph _edgeIdentifiersWithLabel:domain:properties:](self, "_edgeIdentifiersWithLabel:domain:properties:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (void)enumerateEdgesWithIdentifiers:(id)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1CAA4B20C]();
  -[KGGraph edgesForIdentifiers:](self->_graph, "edgesForIdentifiers:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enumerateEdgesUsingBlock:", v6);

  objc_autoreleasePoolPop(v7);
}

- (void)enumerateEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4 usingBlock:(id)a5
{
  -[MAGraph enumerateEdgesWithLabel:domain:properties:usingBlock:](self, "enumerateEdgesWithLabel:domain:properties:usingBlock:", a3, a4, MEMORY[0x1E0C9AA70], a5);
}

- (void)enumerateEdgesMatchingFilter:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[MAGraph edgeIdentifiersMatchingFilter:](self, "edgeIdentifiersMatchingFilter:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MAGraph enumerateEdgesWithIdentifiers:usingBlock:](self, "enumerateEdgesWithIdentifiers:usingBlock:", v7, v6);

}

- (void)enumerateEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5 usingBlock:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  MAEdgeFilter *v13;

  v7 = a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = -[MAElementFilter initWithLabel:domain:properties:]([MAEdgeFilter alloc], "initWithLabel:domain:properties:", v12, v7, v11);

  -[MAGraph enumerateEdgesMatchingFilter:usingBlock:](self, "enumerateEdgesMatchingFilter:usingBlock:", v13, v10);
}

- (void)enumerateEdgesInDomain:(unsigned __int16)a3 usingBlock:(id)a4
{
  -[MAGraph enumerateEdgesWithLabel:domain:properties:usingBlock:](self, "enumerateEdgesWithLabel:domain:properties:usingBlock:", 0, a3, MEMORY[0x1E0C9AA70], a4);
}

- (void)enumerateEdgesWithBlock:(id)a3
{
  -[MAGraph enumerateEdgesWithLabel:domain:properties:usingBlock:](self, "enumerateEdgesWithLabel:domain:properties:usingBlock:", 0, 0, MEMORY[0x1E0C9AA70], a3);
}

- (id)allEdges
{
  return -[MAGraph edgesForLabel:domain:properties:](self, "edgesForLabel:domain:properties:", 0, 0, MEMORY[0x1E0C9AA70]);
}

- (id)abstractEdges
{
  MAGraph *v2;
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __24__MAGraph_abstractEdges__block_invoke;
  v6[3] = &unk_1E83E6378;
  v4 = v3;
  v7 = v4;
  -[MAGraph enumerateEdgesWithBlock:](v2, "enumerateEdgesWithBlock:", v6);

  objc_sync_exit(v2);
  return v4;
}

- (void)enumeratePropertyValuesForKey:(id)a3 ofNodesWithIdentifiers:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  KGNodeCollection *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v12 = -[KGElementCollection initWithIdentifiers:graph:]([KGNodeCollection alloc], "initWithIdentifiers:graph:", v9, self->_graph);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__MAGraph_enumeratePropertyValuesForKey_ofNodesWithIdentifiers_usingBlock___block_invoke;
  v13[3] = &unk_1E83E2480;
  v14 = v8;
  v11 = v8;
  -[KGNodeCollection enumeratePropertyValuesForKey:withBlock:](v12, "enumeratePropertyValuesForKey:withBlock:", v10, v13);

}

- (void)enumerateIntegerPropertyValuesForKey:(id)a3 ofNodesWithIdentifiers:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__MAGraph_enumerateIntegerPropertyValuesForKey_ofNodesWithIdentifiers_usingBlock___block_invoke;
  v10[3] = &unk_1E83E24A8;
  v11 = v8;
  v9 = v8;
  -[MAGraph enumeratePropertyValuesForKey:ofNodesWithIdentifiers:usingBlock:](self, "enumeratePropertyValuesForKey:ofNodesWithIdentifiers:usingBlock:", a3, a4, v10);

}

- (void)enumerateStringPropertyValuesForKey:(id)a3 ofNodesWithIdentifiers:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__MAGraph_enumerateStringPropertyValuesForKey_ofNodesWithIdentifiers_usingBlock___block_invoke;
  v10[3] = &unk_1E83E24A8;
  v11 = v8;
  v9 = v8;
  -[MAGraph enumeratePropertyValuesForKey:ofNodesWithIdentifiers:usingBlock:](self, "enumeratePropertyValuesForKey:ofNodesWithIdentifiers:usingBlock:", a3, a4, v10);

}

- (void)enumerateDoublePropertyValuesForKey:(id)a3 ofNodesWithIdentifiers:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__MAGraph_enumerateDoublePropertyValuesForKey_ofNodesWithIdentifiers_usingBlock___block_invoke;
  v10[3] = &unk_1E83E24A8;
  v11 = v8;
  v9 = v8;
  -[MAGraph enumeratePropertyValuesForKey:ofNodesWithIdentifiers:usingBlock:](self, "enumeratePropertyValuesForKey:ofNodesWithIdentifiers:usingBlock:", a3, a4, v10);

}

- (void)enumerateUnsignedIntegerPropertyValuesForKey:(id)a3 ofNodesWithIdentifiers:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90__MAGraph_enumerateUnsignedIntegerPropertyValuesForKey_ofNodesWithIdentifiers_usingBlock___block_invoke;
  v10[3] = &unk_1E83E24A8;
  v11 = v8;
  v9 = v8;
  -[MAGraph enumeratePropertyValuesForKey:ofNodesWithIdentifiers:usingBlock:](self, "enumeratePropertyValuesForKey:ofNodesWithIdentifiers:usingBlock:", a3, a4, v10);

}

- (void)enumerateUnsignedLongLongPropertyValuesForKey:(id)a3 ofNodesWithIdentifiers:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __91__MAGraph_enumerateUnsignedLongLongPropertyValuesForKey_ofNodesWithIdentifiers_usingBlock___block_invoke;
  v10[3] = &unk_1E83E24A8;
  v11 = v8;
  v9 = v8;
  -[MAGraph enumeratePropertyValuesForKey:ofNodesWithIdentifiers:usingBlock:](self, "enumeratePropertyValuesForKey:ofNodesWithIdentifiers:usingBlock:", a3, a4, v10);

}

- (void)enumeratePropertyValuesForKey:(id)a3 ofEdgesWithIdentifiers:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  KGEdgeCollection *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v12 = -[KGElementCollection initWithIdentifiers:graph:]([KGEdgeCollection alloc], "initWithIdentifiers:graph:", v9, self->_graph);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__MAGraph_enumeratePropertyValuesForKey_ofEdgesWithIdentifiers_usingBlock___block_invoke;
  v13[3] = &unk_1E83E2480;
  v14 = v8;
  v11 = v8;
  -[KGEdgeCollection enumeratePropertyValuesForKey:withBlock:](v12, "enumeratePropertyValuesForKey:withBlock:", v10, v13);

}

- (void)enumerateIntegerPropertyValuesForKey:(id)a3 ofEdgesWithIdentifiers:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__MAGraph_enumerateIntegerPropertyValuesForKey_ofEdgesWithIdentifiers_usingBlock___block_invoke;
  v10[3] = &unk_1E83E24A8;
  v11 = v8;
  v9 = v8;
  -[MAGraph enumeratePropertyValuesForKey:ofEdgesWithIdentifiers:usingBlock:](self, "enumeratePropertyValuesForKey:ofEdgesWithIdentifiers:usingBlock:", a3, a4, v10);

}

- (void)enumerateStringPropertyValuesForKey:(id)a3 ofEdgesWithIdentifiers:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__MAGraph_enumerateStringPropertyValuesForKey_ofEdgesWithIdentifiers_usingBlock___block_invoke;
  v10[3] = &unk_1E83E24A8;
  v11 = v8;
  v9 = v8;
  -[MAGraph enumeratePropertyValuesForKey:ofEdgesWithIdentifiers:usingBlock:](self, "enumeratePropertyValuesForKey:ofEdgesWithIdentifiers:usingBlock:", a3, a4, v10);

}

- (void)enumerateDoublePropertyValuesForKey:(id)a3 ofEdgesWithIdentifiers:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__MAGraph_enumerateDoublePropertyValuesForKey_ofEdgesWithIdentifiers_usingBlock___block_invoke;
  v10[3] = &unk_1E83E24A8;
  v11 = v8;
  v9 = v8;
  -[MAGraph enumeratePropertyValuesForKey:ofEdgesWithIdentifiers:usingBlock:](self, "enumeratePropertyValuesForKey:ofEdgesWithIdentifiers:usingBlock:", a3, a4, v10);

}

- (void)enumerateUnsignedIntegerPropertyValuesForKey:(id)a3 ofEdgesWithIdentifiers:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90__MAGraph_enumerateUnsignedIntegerPropertyValuesForKey_ofEdgesWithIdentifiers_usingBlock___block_invoke;
  v10[3] = &unk_1E83E24A8;
  v11 = v8;
  v9 = v8;
  -[MAGraph enumeratePropertyValuesForKey:ofEdgesWithIdentifiers:usingBlock:](self, "enumeratePropertyValuesForKey:ofEdgesWithIdentifiers:usingBlock:", a3, a4, v10);

}

- (void)enumerateUnsignedLongLongPropertyValuesForKey:(id)a3 ofEdgesWithIdentifiers:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __91__MAGraph_enumerateUnsignedLongLongPropertyValuesForKey_ofEdgesWithIdentifiers_usingBlock___block_invoke;
  v10[3] = &unk_1E83E24A8;
  v11 = v8;
  v9 = v8;
  -[MAGraph enumeratePropertyValuesForKey:ofEdgesWithIdentifiers:usingBlock:](self, "enumeratePropertyValuesForKey:ofEdgesWithIdentifiers:usingBlock:", a3, a4, v10);

}

- (id)targetsBySourceWithEdgeIdentifiers:(id)a3
{
  return -[KGGraph targetsBySourceWithEdgeIdentifiers:](self->_graph, "targetsBySourceWithEdgeIdentifiers:", a3);
}

- (id)sourcesByTargetWithEdgeIdentifiers:(id)a3
{
  return -[KGGraph sourcesByTargetWithEdgeIdentifiers:](self->_graph, "sourcesByTargetWithEdgeIdentifiers:", a3);
}

- (id)edgeIdentifiersOfType:(unint64_t)a3 sourceNodeIdentifier:(unint64_t)a4 targetNodeIdentifier:(unint64_t)a5
{
  void *v9;
  uint64_t v10;
  KGElementIdentifierSet *v11;
  void *v12;
  KGElementIdentifierSet *v13;
  KGElementIdentifierSet *v14;
  void *v15;
  void *v16;
  void *v17;
  KGElementIdentifierSet *v18;
  KGElementIdentifierSet *v19;

  v9 = (void *)MEMORY[0x1CAA4B20C](self, a2);
  if (a3 - 1 > 2)
    v10 = 0;
  else
    v10 = qword_1CA1FE818[a3 - 1];
  v11 = -[KGElementIdentifierSet initWithElementIdentifier:]([KGElementIdentifierSet alloc], "initWithElementIdentifier:", a4);
  -[KGGraph edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:](self->_graph, "edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:", v11, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEmpty"))
  {
    if (v12)
      v13 = v12;
    else
      v13 = objc_alloc_init(KGElementIdentifierSet);
    v19 = v13;
  }
  else
  {
    v14 = -[KGElementIdentifierSet initWithElementIdentifier:]([KGElementIdentifierSet alloc], "initWithElementIdentifier:", a5);
    -[KGGraph edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:](self->_graph, "edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:", v14, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifierSetByIntersectingIdentifierSet:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      v18 = v16;
    else
      v18 = objc_alloc_init(KGElementIdentifierSet);
    v19 = v18;

  }
  objc_autoreleasePoolPop(v9);
  return v19;
}

- (id)anyEdgeMatchingFilter:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__MAGraph_anyEdgeMatchingFilter___block_invoke;
  v7[3] = &unk_1E83E6328;
  v7[4] = &v8;
  -[MAGraph enumerateEdgesMatchingFilter:usingBlock:](self, "enumerateEdgesMatchingFilter:usingBlock:", v4, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)nodeIdentifiersRelatedToSourceNodeIdentifiers:(id)a3 relation:(id)a4
{
  id v6;
  id v7;
  KGMutableElementIdentifierSet *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(KGMutableElementIdentifierSet);
  objc_msgSend(v6, "unionAdjacencySetFromSourceNodeIdentifiers:toTargetNodeIdentifiers:graph:", v7, v8, self);

  return v8;
}

- (id)edgeIdentifiersOfType:(unint64_t)a3 onNodesForIdentifiers:(id)a4 matchingFilter:(id)a5
{
  KGStoredGraph *graph;
  id v9;
  void *v10;
  KGStoredGraph *v11;
  void *v12;
  void *v13;

  graph = self->_graph;
  v9 = a5;
  -[KGGraph edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:](graph, "edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:", a4, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = self->_graph;
  objc_msgSend(v9, "kgEdgeFilter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[KGGraph edgeIdentifiersMatchingFilter:intersectingIdentifiers:](v11, "edgeIdentifiersMatchingFilter:intersectingIdentifiers:", v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)edgeIdentifiersOfType:(unint64_t)a3 betweenNodesForIdentifiers:(id)a4 andNodesForIdentifiers:(id)a5 matchingFilter:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  KGElementIdentifierSet *v14;
  KGStoredGraph *graph;
  void *v16;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x1CAA4B20C]();
  if ((objc_msgSend(v10, "isEmpty") & 1) != 0 || objc_msgSend(v11, "isEmpty"))
  {
    v14 = objc_alloc_init(KGElementIdentifierSet);
  }
  else
  {
    graph = self->_graph;
    objc_msgSend(v12, "kgEdgeFilter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[KGGraph edgeIdentifiersBetweenStartNodeIdentifiers:endNodeIdentifiers:edgeFilter:edgeDirection:](graph, "edgeIdentifiersBetweenStartNodeIdentifiers:endNodeIdentifiers:edgeFilter:edgeDirection:", v10, v11, v16, a3);
    v14 = (KGElementIdentifierSet *)objc_claimAutoreleasedReturnValue();

  }
  objc_autoreleasePoolPop(v13);

  return v14;
}

- (id)nodeIdentifiersOfEdgeIdentifiers:(id)a3 ofType:(unint64_t)a4
{
  return -[KGGraph nodeIdentifiersOfEdgesForIdentifiers:edgeDirection:](self->_graph, "nodeIdentifiersOfEdgesForIdentifiers:edgeDirection:", a3, a4);
}

- (BOOL)isEqual:(id)a3
{
  MAGraph *v4;
  uint64_t v5;
  char v6;
  MAGraph *v7;
  void *v8;
  void *v9;

  v4 = (MAGraph *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      -[MAGraph identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAGraph identifier](v7, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = objc_msgSend(v8, "isEqual:", v9);
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MAGraph identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (MAGraphSpecification)specification
{
  return (MAGraphSpecification *)objc_getProperty(self, a2, 40, 1);
}

- (KGStoredGraph)graph
{
  return self->_graph;
}

- (unint64_t)databaseStatus
{
  return self->_databaseStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specification, 0);
  objc_storeStrong((id *)&self->_domainByLabel, 0);
  objc_storeStrong((id *)&self->_labelByDomain, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

void __33__MAGraph_anyEdgeMatchingFilter___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

void __91__MAGraph_enumerateUnsignedLongLongPropertyValuesForKey_ofEdgesWithIdentifiers_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "kgPropertyType") == 4 || objc_msgSend(v7, "kgPropertyType") == 1)
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, objc_msgSend(v7, "unsignedLongLongValue"), a4);

}

void __90__MAGraph_enumerateUnsignedIntegerPropertyValuesForKey_ofEdgesWithIdentifiers_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "kgPropertyType") == 4 || objc_msgSend(v7, "kgPropertyType") == 1)
    (*(void (**)(_QWORD, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, objc_msgSend(v7, "unsignedIntValue"), a4);

}

void __81__MAGraph_enumerateDoublePropertyValuesForKey_ofEdgesWithIdentifiers_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "kgPropertyType") == 2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "doubleValue");
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, a2, a4);
  }

}

void __81__MAGraph_enumerateStringPropertyValuesForKey_ofEdgesWithIdentifiers_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "kgPropertyType") == 3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __82__MAGraph_enumerateIntegerPropertyValuesForKey_ofEdgesWithIdentifiers_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "kgPropertyType") == 1)
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, objc_msgSend(v7, "integerValue"), a4);

}

void __75__MAGraph_enumeratePropertyValuesForKey_ofEdgesWithIdentifiers_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "kgPropertyValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v4 = v5;
  }

}

void __91__MAGraph_enumerateUnsignedLongLongPropertyValuesForKey_ofNodesWithIdentifiers_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "kgPropertyType") == 4 || objc_msgSend(v7, "kgPropertyType") == 1)
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, objc_msgSend(v7, "unsignedLongLongValue"), a4);

}

void __90__MAGraph_enumerateUnsignedIntegerPropertyValuesForKey_ofNodesWithIdentifiers_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "kgPropertyType") == 4 || objc_msgSend(v7, "kgPropertyType") == 1)
    (*(void (**)(_QWORD, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, objc_msgSend(v7, "unsignedIntValue"), a4);

}

void __81__MAGraph_enumerateDoublePropertyValuesForKey_ofNodesWithIdentifiers_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "kgPropertyType") == 2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "doubleValue");
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, a2, a4);
  }

}

void __81__MAGraph_enumerateStringPropertyValuesForKey_ofNodesWithIdentifiers_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "kgPropertyType") == 3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __82__MAGraph_enumerateIntegerPropertyValuesForKey_ofNodesWithIdentifiers_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "kgPropertyType") == 1)
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, objc_msgSend(v7, "integerValue"), a4);

}

void __75__MAGraph_enumeratePropertyValuesForKey_ofNodesWithIdentifiers_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "kgPropertyValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v4 = v5;
  }

}

void __24__MAGraph_abstractEdges__block_invoke(uint64_t a1, void *a2)
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  MAAbstractEdge *v6;
  uint64_t v7;
  double v8;
  MAAbstractEdge *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v3 = CFSTR("*");
  v4 = CFSTR("*");
  objc_msgSend(v12, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v12, "label");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v6 = [MAAbstractEdge alloc];
  v7 = objc_msgSend(v12, "domain");
  LODWORD(v8) = 1.0;
  v9 = -[MAAbstractEdge initWithLabel:domain:weight:properties:](v6, "initWithLabel:domain:weight:properties:", v3, v7, MEMORY[0x1E0C9AA70], v8);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v10, "addObject:", v12);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v9);
  }

}

void __22__MAGraph_orphanNodes__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "isOrphan"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __81__MAGraph_addUniquelyIdentifiedNodeWithLabel_domain_weight_properties_didCreate___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "isIdentifiedByProperties:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_420);
}

+ (id)graph
{
  return objc_alloc_init((Class)objc_opt_class());
}

+ (id)defaultSpecification
{
  return objc_alloc_init(MAGraphSpecification);
}

- (BOOL)hasPendingRead
{
  return 1;
}

- (BOOL)hasPendingWrite
{
  return 1;
}

- (void)writeUsingBlock:(id)a3
{
  (*((void (**)(id, MAGraph *))a3 + 2))(a3, self);
}

- (void)readUsingBlock:(id)a3
{
  (*((void (**)(id, MAGraph *))a3 + 2))(a3, self);
}

- (void)waitUntilQuiescentUsingBlock:(id)a3
{
  (*((void (**)(id, MAGraph *))a3 + 2))(a3, self);
}

- (id)mergeWithGraph:(id)a3 strictNodes:(BOOL)a4 strictEdges:(BOOL)a5
{
  return -[MAGraph mergeWithGraph:strictNodes:strictEdges:saveToDatabase:](self, "mergeWithGraph:strictNodes:strictEdges:saveToDatabase:", a3, a4, a5, 1);
}

- (id)mergeWithGraph:(id)a3 strictNodes:(BOOL)a4 strictEdges:(BOOL)a5 saveToDatabase:(BOOL)a6
{
  id v7;

  v7 = 0;
  -[MAGraph mergeWithGraph:strictNodes:strictEdges:saveToDatabase:createdNodes:createdEdges:](self, "mergeWithGraph:strictNodes:strictEdges:saveToDatabase:createdNodes:createdEdges:", a3, a4, a5, a6, &v7, 0);
  return v7;
}

- (void)mergeWithGraph:(id)a3 strictNodes:(BOOL)a4 strictEdges:(BOOL)a5 createdNodes:(id *)a6 createdEdges:(id *)a7
{
  -[MAGraph mergeWithGraph:strictNodes:strictEdges:saveToDatabase:createdNodes:createdEdges:](self, "mergeWithGraph:strictNodes:strictEdges:saveToDatabase:createdNodes:createdEdges:", a3, a4, a5, 1, a6, a7);
}

- (void)mergeWithGraph:(id)a3 strictNodes:(BOOL)a4 strictEdges:(BOOL)a5 saveToDatabase:(BOOL)a6 createdNodes:(id *)a7 createdEdges:(id *)a8
{
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  MAGraph *v25;
  id v26;
  BOOL v27;
  _QWORD v28[5];
  id v29;
  id v30;
  BOOL v31;

  v13 = (void *)MEMORY[0x1E0C99E20];
  v14 = a3;
  objc_msgSend(v13, "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __106__MAGraph_Merge_Private__mergeWithGraph_strictNodes_strictEdges_saveToDatabase_createdNodes_createdEdges___block_invoke;
  v28[3] = &unk_1E83E4538;
  v31 = a4;
  v28[4] = self;
  v19 = v17;
  v29 = v19;
  v22 = v15;
  v30 = v22;
  objc_msgSend(v14, "enumerateNodesWithBlock:", v28);
  v23[0] = v18;
  v23[1] = 3221225472;
  v23[2] = __106__MAGraph_Merge_Private__mergeWithGraph_strictNodes_strictEdges_saveToDatabase_createdNodes_createdEdges___block_invoke_2;
  v23[3] = &unk_1E83E4590;
  v27 = a5;
  v24 = v19;
  v25 = self;
  v20 = v16;
  v26 = v20;
  v21 = v19;
  objc_msgSend(v14, "enumerateEdgesWithBlock:", v23);

  if (a7)
    *a7 = objc_retainAutorelease(v22);
  if (a8)
    *a8 = objc_retainAutorelease(v20);

}

void __106__MAGraph_Merge_Private__mergeWithGraph_strictNodes_strictEdges_saveToDatabase_createdNodes_createdEdges___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v3 = a2;
  v4 = v3;
  if (!*(_BYTE *)(a1 + 56))
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__2705;
    v23 = __Block_byref_object_dispose__2706;
    objc_msgSend(*(id *)(a1 + 32), "nodeForIdentifier:", objc_msgSend(v3, "identifier"));
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v20;
    v7 = (void *)v20[5];
    if (v7)
    {
      v8 = objc_msgSend(v7, "isEqualToNode:", v4);
      v6 = v20;
      if ((v8 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v20[5], v4);
        _Block_object_dispose(&v19, 8);

        goto LABEL_3;
      }
      v9 = (void *)v20[5];
    }
    else
    {
      v9 = 0;
    }
    v6[5] = 0;

    v10 = *(void **)(a1 + 32);
    objc_msgSend(v4, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v4, "domain");
    objc_msgSend(v4, "propertyDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __106__MAGraph_Merge_Private__mergeWithGraph_strictNodes_strictEdges_saveToDatabase_createdNodes_createdEdges___block_invoke_2;
    v15[3] = &unk_1E83E4510;
    v16 = *(id *)(a1 + 40);
    v17 = v4;
    v18 = &v19;
    objc_msgSend(v10, "enumerateNodesWithLabel:domain:properties:usingBlock:", v11, v12, v13, v15);

    v14 = v20[5];
    _Block_object_dispose(&v19, 8);

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(*(id *)(a1 + 32), "addNodeFromBase:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v5, v4);

LABEL_3:
}

void __106__MAGraph_Merge_Private__mergeWithGraph_strictNodes_strictEdges_saveToDatabase_createdNodes_createdEdges___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "sourceNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 32);
  objc_msgSend(v3, "targetNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 || !v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("MAGraphInvalidGraph"), CFSTR("Graph invalid for edge \"%@\"), v3);
    goto LABEL_7;
  }
  if (!*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 40), "edgeForIdentifier:", objc_msgSend(v3, "identifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11;
    if (v11 && (objc_msgSend(v11, "isEqualToEdge:", v3) & 1) != 0)
      goto LABEL_5;
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__2705;
    v23 = __Block_byref_object_dispose__2706;
    v24 = 0;
    objc_msgSend(v3, "label");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v3, "domain");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __106__MAGraph_Merge_Private__mergeWithGraph_strictNodes_strictEdges_saveToDatabase_createdNodes_createdEdges___block_invoke_3;
    v15[3] = &unk_1E83E4568;
    v16 = v9;
    v17 = v3;
    v18 = &v19;
    objc_msgSend(v6, "enumerateEdgesWithLabel:domain:usingBlock:", v12, v13, v15);

    v14 = v20[5];
    _Block_object_dispose(&v19, 8);

    if (v14)
      goto LABEL_5;

  }
  objc_msgSend(*(id *)(a1 + 40), "addEdgeFromBase:sourceNode:targetNode:", v3, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);
LABEL_5:

LABEL_7:
}

void __106__MAGraph_Merge_Private__mergeWithGraph_strictNodes_strictEdges_saveToDatabase_createdNodes_createdEdges___block_invoke_3(_QWORD *a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "targetNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToNode:", a1[4]);

  if (v7 && objc_msgSend(v8, "isEqualToEdge:", a1[5]))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    *a3 = 1;
  }

}

void __106__MAGraph_Merge_Private__mergeWithGraph_strictNodes_strictEdges_saveToDatabase_createdNodes_createdEdges___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, *(_QWORD *)(a1 + 40));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = 1;
}

+ (MAGraph)graphWithMergedGraphs:(id)a3 strictNodes:(BOOL)a4 strictEdges:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v5 = a5;
  v6 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(a1, "graph");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = (id)objc_msgSend(v9, "mergeWithGraph:strictNodes:strictEdges:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14++), v6, v5, (_QWORD)v17);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return (MAGraph *)v9;
}

- (id)nodeFromFetchedRowWithIdentifier:(int)a3 domain:(signed __int16)a4 label:(id)a5 weight:(float)a6 properties:(id)a7
{
  id v10;
  id v11;
  id v12;

  v10 = a5;
  v11 = a7;
  KGMethodNotImplentedException(self, a2);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v12);
}

- (id)edgeFromFetchedRowWithIdentifier:(int)a3 domain:(signed __int16)a4 label:(id)a5 weight:(float)a6 properties:(id)a7 sourceNodeIdentifier:(int)a8 targetNodeIdentifier:(int)a9
{
  id v12;
  id v13;
  id v14;

  v12 = a5;
  v13 = a7;
  KGMethodNotImplentedException(self, a2);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v14);
}

- (BOOL)_shouldFail
{
  void *v2;
  unint64_t v3;

  -[MAGraph specification](self, "specification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "persistenceOptions") >> 8) & 1;

  return v3;
}

- (id)_instantiateGraphWithStoreAtURL:(id)a3 error:(id *)a4
{
  id v6;
  MAKGEntityFactory *v7;
  void *v8;
  MAKGEntityFactory *v9;
  KGDegasGraphStore *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  id v14;
  id v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = [MAKGEntityFactory alloc];
  -[MAGraph specification](self, "specification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MAKGEntityFactory initWithSpecification:](v7, "initWithSpecification:", v8);

  v10 = -[KGDegasGraphStore initWithURL:]([KGDegasGraphStore alloc], "initWithURL:", v6);
  if (-[MAGraph isReadOnly](self, "isReadOnly"))
    v11 = 1;
  else
    v11 = 6;
  if (-[MAGraph usesClassCDataProtection](self, "usesClassCDataProtection"))
  {
    v11 |= 0x10uLL;
  }
  else if (-[MAGraph usesClassBDataProtection](self, "usesClassBDataProtection"))
  {
    v11 |= 0x20uLL;
  }
  else if (-[MAGraph usesClassADataProtection](self, "usesClassADataProtection"))
  {
    v11 |= 0x40uLL;
  }
  if (-[MAGraph _shouldFail](self, "_shouldFail"))
    v12 = v11 | 0x10000;
  else
    v12 = v11;
  v18 = 0;
  v13 = -[KGDegasGraphStore openWithMode:error:](v10, "openWithMode:error:", v12, &v18);
  v14 = v18;
  if (v13)
  {
    v15 = -[KGStoredGraph initGraphWithStore:entityFactory:]([KGStoredGraph alloc], "initGraphWithStore:entityFactory:", v10, v9);
  }
  else
  {
    KGLoggingConnection();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v14;
      _os_log_error_impl(&dword_1CA0A5000, v16, OS_LOG_TYPE_ERROR, "Opening graph store failed: %@", buf, 0xCu);
    }

    -[MAGraph setHadFatalError](self, "setHadFatalError");
    v15 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v14);
  }

  return v15;
}

- (MAGraph)initWithPersistentStoreURL:(id)a3 options:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  MAGraph *v10;

  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultSpecification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPersistenceOptions:", a4);
  v10 = -[MAGraph initWithSpecification:persistenceStoreURL:error:](self, "initWithSpecification:persistenceStoreURL:error:", v9, v8, a5);

  return v10;
}

- (MAGraph)initWithSpecification:(id)a3 persistenceStoreURL:(id)a4 error:(id *)a5
{
  id v8;
  MAGraph *v9;
  MAGraph *v10;
  uint64_t v11;
  KGStoredGraph *graph;

  v8 = a4;
  v9 = -[MAGraph initWithSpecification:](self, "initWithSpecification:", a3);
  v10 = v9;
  if (v9)
  {
    -[MAGraph _instantiateGraphWithStoreAtURL:error:](v9, "_instantiateGraphWithStoreAtURL:error:", v8, a5);
    v11 = objc_claimAutoreleasedReturnValue();
    graph = v10->_graph;
    v10->_graph = (KGStoredGraph *)v11;

    if (!v10->_graph)
    {

      v10 = 0;
    }
  }

  return v10;
}

- (MAGraph)initWithSpecification:(id)a3 persistenceStoreURL:(id)a4 progressReporter:(id)a5
{
  return -[MAGraph initWithSpecification:persistenceStoreURL:error:](self, "initWithSpecification:persistenceStoreURL:error:", a3, a4, 0);
}

- (id)databaseURL
{
  void *v2;
  void *v3;

  -[KGStoredGraph store](self->_graph, "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)loadDomains:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  KGMethodNotImplentedException(self, a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)unloadEdge:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  KGMethodNotImplentedException(self, a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)unloadDomains:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  KGMethodNotImplentedException(self, a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (BOOL)savePersistentStore
{
  return 1;
}

- (BOOL)migratePersistentStoreToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  KGStoredGraph *graph;
  KGStoredGraph *v11;
  KGStoredGraph *v12;
  BOOL v13;

  v6 = a3;
  -[KGStoredGraph store](self->_graph, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[KGStoredGraph store](self->_graph, "store");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "close");

  graph = self->_graph;
  self->_graph = 0;

  if (objc_msgSend((id)objc_opt_class(), "migratePersistentStoreFromURL:toURL:error:", v8, v6, a4))
  {
    -[MAGraph _instantiateGraphWithStoreAtURL:error:](self, "_instantiateGraphWithStoreAtURL:error:", v6, a4);
    v11 = (KGStoredGraph *)objc_claimAutoreleasedReturnValue();
    v12 = self->_graph;
    self->_graph = v11;

    v13 = self->_graph != 0;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)closePersistentStore
{
  void *v3;
  KGStoredGraph *graph;

  -[KGStoredGraph store](self->_graph, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "close");

  graph = self->_graph;
  self->_graph = 0;

}

- (BOOL)copyPersistentStoreToURL:(id)a3 error:(id *)a4
{
  KGStoredGraph *graph;
  id v6;
  void *v7;

  graph = self->_graph;
  v6 = a3;
  -[KGStoredGraph store](graph, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "copyToURL:error:", v6, a4);

  return (char)a4;
}

- (BOOL)compareWithPersistedState
{
  return 1;
}

- (void)persistModelProperty:(id)a3 forKey:(id)a4 forNodeWithIdentifier:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  KGGraphChangeRequest *v14;
  KGStoredGraph *graph;
  BOOL v16;
  id v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  +[KGPropertyValue kgPropertyValueWithMAPropertyValue:](KGPropertyValue, "kgPropertyValueWithMAPropertyValue:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[KGGraph nodeForIdentifier:](self->_graph, "nodeForIdentifier:", a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "properties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, v9);
    v14 = objc_alloc_init(KGGraphChangeRequest);
    -[KGGraphChangeRequest updateNode:newProperties:](v14, "updateNode:newProperties:", v11, v13);
    graph = self->_graph;
    v19 = 0;
    v16 = -[KGMutableGraph performChangesAndWait:error:](graph, "performChangesAndWait:error:", v14, &v19);
    v17 = v19;
    if (!v16)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v11;
        _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error persisting node property for node %@", buf, 0xCu);
      }
      -[MAGraph setHadFatalError](self, "setHadFatalError");
    }

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v21 = v8;
    v22 = 2112;
    v23 = v18;
    _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error persisting node property %@ for node with identifier %@", buf, 0x16u);

  }
}

- (void)persistModelProperties:(id)a3 forNodeWithIdentifier:(unint64_t)a4 clobberExisting:(BOOL)a5
{
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  KGGraphChangeRequest *v14;
  KGStoredGraph *graph;
  BOOL v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  +[KGPropertyValue kgPropertiesWithMAProperties:](KGPropertyValue, "kgPropertiesWithMAProperties:", a3);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[KGGraph nodeForIdentifier:](self->_graph, "nodeForIdentifier:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!a5)
    {
      objc_msgSend(v10, "properties");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "mutableCopy");

      objc_msgSend(v13, "addEntriesFromDictionary:", v9);
      v9 = v13;
    }
    v14 = objc_alloc_init(KGGraphChangeRequest);
    -[KGGraphChangeRequest updateNode:newProperties:](v14, "updateNode:newProperties:", v11, v9);
    graph = self->_graph;
    v18 = 0;
    v16 = -[KGMutableGraph performChangesAndWait:error:](graph, "performChangesAndWait:error:", v14, &v18);
    v17 = v18;
    if (!v16)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v11;
        _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error persisting node properties for node %@", buf, 0xCu);
      }
      -[MAGraph setHadFatalError](self, "setHadFatalError");
    }

    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v20 = 0;
    v21 = 2112;
    v22 = v9;
    _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error persisting node properties %@ for node with identifier %@", buf, 0x16u);
LABEL_9:

  }
}

- (void)removeModelPropertyForKey:(id)a3 forNodeWithIdentifier:(unint64_t)a4
{
  KGStoredGraph *graph;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  KGGraphChangeRequest *v11;
  KGStoredGraph *v12;
  BOOL v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  graph = self->_graph;
  v7 = a3;
  -[KGGraph nodeForIdentifier:](graph, "nodeForIdentifier:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "removeObjectForKey:", v7);
  v11 = objc_alloc_init(KGGraphChangeRequest);
  -[KGGraphChangeRequest updateNode:newProperties:](v11, "updateNode:newProperties:", v8, v10);
  v12 = self->_graph;
  v15 = 0;
  v13 = -[KGMutableGraph performChangesAndWait:error:](v12, "performChangesAndWait:error:", v11, &v15);
  v14 = v15;
  if (!v13)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error removing node property for node %@", buf, 0xCu);
    }
    -[MAGraph setHadFatalError](self, "setHadFatalError");
  }

}

- (void)removeModelPropertiesForNodeWithIdentifier:(unint64_t)a3
{
  void *v4;
  KGGraphChangeRequest *v5;
  KGStoredGraph *graph;
  BOOL v7;
  id v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[KGGraph nodeForIdentifier:](self->_graph, "nodeForIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(KGGraphChangeRequest);
  -[KGGraphChangeRequest updateNode:newProperties:](v5, "updateNode:newProperties:", v4, MEMORY[0x1E0C9AA70]);
  graph = self->_graph;
  v9 = 0;
  v7 = -[KGMutableGraph performChangesAndWait:error:](graph, "performChangesAndWait:error:", v5, &v9);
  v8 = v9;
  if (!v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error removing node properties for node %@", buf, 0xCu);
    }
    -[MAGraph setHadFatalError](self, "setHadFatalError");
  }

}

- (void)persistModelProperty:(id)a3 forKey:(id)a4 forEdgeWithIdentifier:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  KGGraphChangeRequest *v14;
  KGStoredGraph *graph;
  BOOL v16;
  id v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  +[KGPropertyValue kgPropertyValueWithMAPropertyValue:](KGPropertyValue, "kgPropertyValueWithMAPropertyValue:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[KGGraph edgeForIdentifier:](self->_graph, "edgeForIdentifier:", a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "properties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, v9);
    v14 = objc_alloc_init(KGGraphChangeRequest);
    -[KGGraphChangeRequest updateEdge:newProperties:](v14, "updateEdge:newProperties:", v11, v13);
    graph = self->_graph;
    v19 = 0;
    v16 = -[KGMutableGraph performChangesAndWait:error:](graph, "performChangesAndWait:error:", v14, &v19);
    v17 = v19;
    if (!v16)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v11;
        _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error persisting edge property for edge %@", buf, 0xCu);
      }
      -[MAGraph setHadFatalError](self, "setHadFatalError");
    }

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v21 = v8;
    v22 = 2112;
    v23 = v18;
    _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error persisting edge property %@ for edge with identifier %@", buf, 0x16u);

  }
}

- (void)persistModelProperties:(id)a3 forEdgeWithIdentifier:(unint64_t)a4 clobberExisting:(BOOL)a5
{
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  KGGraphChangeRequest *v14;
  KGStoredGraph *graph;
  BOOL v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  +[KGPropertyValue kgPropertiesWithMAProperties:](KGPropertyValue, "kgPropertiesWithMAProperties:", a3);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[KGGraph edgeForIdentifier:](self->_graph, "edgeForIdentifier:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!a5)
    {
      objc_msgSend(v10, "properties");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "mutableCopy");

      objc_msgSend(v13, "addEntriesFromDictionary:", v9);
      v9 = v13;
    }
    v14 = objc_alloc_init(KGGraphChangeRequest);
    -[KGGraphChangeRequest updateEdge:newProperties:](v14, "updateEdge:newProperties:", v11, v9);
    graph = self->_graph;
    v18 = 0;
    v16 = -[KGMutableGraph performChangesAndWait:error:](graph, "performChangesAndWait:error:", v14, &v18);
    v17 = v18;
    if (!v16)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v11;
        _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error persisting edge properties for edge %@", buf, 0xCu);
      }
      -[MAGraph setHadFatalError](self, "setHadFatalError");
    }

    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v20 = 0;
    v21 = 2112;
    v22 = v9;
    _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error persisting edge properties %@ for edge with identifier %@", buf, 0x16u);
LABEL_9:

  }
}

- (void)removeModelPropertyForKey:(id)a3 forEdgeWithIdentifier:(unint64_t)a4
{
  KGStoredGraph *graph;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  KGGraphChangeRequest *v11;
  KGStoredGraph *v12;
  BOOL v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  graph = self->_graph;
  v7 = a3;
  -[KGGraph edgeForIdentifier:](graph, "edgeForIdentifier:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "removeObjectForKey:", v7);
  v11 = objc_alloc_init(KGGraphChangeRequest);
  -[KGGraphChangeRequest updateEdge:newProperties:](v11, "updateEdge:newProperties:", v8, v10);
  v12 = self->_graph;
  v15 = 0;
  v13 = -[KGMutableGraph performChangesAndWait:error:](v12, "performChangesAndWait:error:", v11, &v15);
  v14 = v15;
  if (!v13)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error persisting edge properties for node %@", buf, 0xCu);
    }
    -[MAGraph setHadFatalError](self, "setHadFatalError");
  }

}

- (void)removeModelPropertiesForEdgeWithIdentifier:(unint64_t)a3
{
  void *v4;
  KGGraphChangeRequest *v5;
  KGStoredGraph *graph;
  BOOL v7;
  id v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[KGGraph edgeForIdentifier:](self->_graph, "edgeForIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(KGGraphChangeRequest);
  -[KGGraphChangeRequest updateEdge:newProperties:](v5, "updateEdge:newProperties:", v4, MEMORY[0x1E0C9AA70]);
  graph = self->_graph;
  v9 = 0;
  v7 = -[KGMutableGraph performChangesAndWait:error:](graph, "performChangesAndWait:error:", v5, &v9);
  v8 = v9;
  if (!v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error persisting node properties for edge %@", buf, 0xCu);
    }
    -[MAGraph setHadFatalError](self, "setHadFatalError");
  }

}

- (void)persistWeight:(float)a3 forNodeWithIdentifier:(unint64_t)a4
{
  void *v6;
  float v7;
  float v8;
  KGGraphChangeRequest *v9;
  double v10;
  KGDoublePropertyValue *v11;
  uint64_t v12;
  KGStoredGraph *graph;
  id v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;
  __int16 v25;
  id v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  -[KGGraph nodeForIdentifier:](self->_graph, "nodeForIdentifier:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "weight");
  v8 = v7;
  v9 = objc_alloc_init(KGGraphChangeRequest);
  v27 = CFSTR("__weight");
  v10 = a3;
  v11 = -[KGDoublePropertyValue initWithValue:]([KGDoublePropertyValue alloc], "initWithValue:", v10);
  v28[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v12 = objc_claimAutoreleasedReturnValue();
  -[KGGraphChangeRequest updateNode:newProperties:](v9, "updateNode:newProperties:", v6, v12);

  graph = self->_graph;
  v16 = 0;
  LOBYTE(v12) = -[KGMutableGraph performChangesAndWait:error:](graph, "performChangesAndWait:error:", v9, &v16);
  v14 = v16;
  if ((v12 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend(v6, "identifier");
      *(_DWORD *)buf = 138413314;
      v18 = v6;
      v19 = 2048;
      v20 = v15;
      v21 = 2048;
      v22 = v8;
      v23 = 2048;
      v24 = v10;
      v25 = 2112;
      v26 = v14;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error persisting weight for node(%@) identifier(%lu) old weight(%f) new weight(%f) error(%@)", buf, 0x34u);
    }
    -[MAGraph setHadFatalError](self, "setHadFatalError");
  }

}

- (void)persistWeight:(float)a3 forEdgeWithIdentifier:(unint64_t)a4
{
  void *v6;
  float v7;
  float v8;
  KGGraphChangeRequest *v9;
  double v10;
  KGDoublePropertyValue *v11;
  uint64_t v12;
  KGStoredGraph *graph;
  id v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;
  __int16 v25;
  id v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  -[KGGraph edgeForIdentifier:](self->_graph, "edgeForIdentifier:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "weight");
  v8 = v7;
  v9 = objc_alloc_init(KGGraphChangeRequest);
  v27 = CFSTR("__weight");
  v10 = a3;
  v11 = -[KGDoublePropertyValue initWithValue:]([KGDoublePropertyValue alloc], "initWithValue:", v10);
  v28[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v12 = objc_claimAutoreleasedReturnValue();
  -[KGGraphChangeRequest updateEdge:newProperties:](v9, "updateEdge:newProperties:", v6, v12);

  graph = self->_graph;
  v16 = 0;
  LOBYTE(v12) = -[KGMutableGraph performChangesAndWait:error:](graph, "performChangesAndWait:error:", v9, &v16);
  v14 = v16;
  if ((v12 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend(v6, "identifier");
      *(_DWORD *)buf = 138413314;
      v18 = v6;
      v19 = 2048;
      v20 = v15;
      v21 = 2048;
      v22 = v8;
      v23 = 2048;
      v24 = v10;
      v25 = 2112;
      v26 = v14;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error persisting weight for edge(%@) identifier(%lu) old weight(%f) new weight(%f) error(%@)", buf, 0x34u);
    }
    -[MAGraph setHadFatalError](self, "setHadFatalError");
  }

}

+ (id)persistentStoreFileExtension
{
  return +[KGDegasGraphStore persistentStoreFileExtension](KGDegasGraphStore, "persistentStoreFileExtension");
}

+ (id)persistentStoreURLWithPath:(id)a3 andName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "persistentStoreFileExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "URLByAppendingPathComponent:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "URLByAppendingPathExtension:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)copyPersistentStoreFromURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return +[KGDegasGraphStore copyFromURL:toURL:error:](KGDegasGraphStore, "copyFromURL:toURL:error:", a3, a4, a5);
}

+ (BOOL)migratePersistentStoreFromURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return +[KGDegasGraphStore migrateFromURL:toURL:error:](KGDegasGraphStore, "migrateFromURL:toURL:error:", a3, a4, a5);
}

+ (BOOL)destroyPersistentStoreAtURL:(id)a3 error:(id *)a4
{
  return +[KGDegasGraphStore destroyAtURL:error:](KGDegasGraphStore, "destroyAtURL:error:", a3, a4);
}

- (id)_graphDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MAGraph identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MAGraph version](self, "version"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("version"));

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __41__MAGraph_File_Private___graphDictionary__block_invoke;
  v21[3] = &unk_1E83E5178;
  v22 = v7;
  v9 = v7;
  -[MAGraph enumerateNodesWithBlock:](self, "enumerateNodesWithBlock:", v21);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("identifier"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "sortedArrayUsingDescriptors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("nodes"));
  v16 = v8;
  v17 = 3221225472;
  v18 = __41__MAGraph_File_Private___graphDictionary__block_invoke_2;
  v19 = &unk_1E83E6378;
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = v20;
  -[MAGraph enumerateEdgesWithBlock:](self, "enumerateEdgesWithBlock:", &v16);
  objc_msgSend(v13, "sortedArrayUsingDescriptors:", v11, v16, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("edges"));

  return v3;
}

- (BOOL)writeDataToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;

  v6 = a3;
  -[MAGraph _graphDictionary](self, "_graphDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v6, "URLByDeletingLastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "fileExistsAtPath:", v10);

  if ((v11 & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    v18 = 0;
    objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v18);
    v12 = v18;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E48]), "initWithURL:append:", v6, 0);
  v14 = v13;
  if (v12 || !v13)
  {
    if (a4)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot write data to URL %@"), v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDescription:", v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a4) = 0;
    }
  }
  else
  {
    objc_msgSend(v13, "open");
    a4 = (id *)objc_msgSend(MEMORY[0x1E0CB38B0], "writePropertyList:toStream:format:options:error:", v7, v14, 200, 0, a4);
    objc_msgSend(v14, "close");
    if (a4)
      LOBYTE(a4) = 1;
    else
      objc_msgSend(v8, "removeItemAtURL:error:", v6, 0);
  }

  return (char)a4;
}

- (void)_loadWithGraphDictionary:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int16 v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  unsigned __int16 v34;
  void *v35;
  int v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  id v42;
  void *v43;
  id v44;
  id obj;
  id obja;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v43 = v4;
  objc_msgSend(v4, "objectForKey:", CFSTR("nodes"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v52 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKey:", CFSTR("label"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", CFSTR("domain"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "unsignedIntegerValue");

        objc_msgSend(v10, "objectForKey:", CFSTR("weight"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "floatValue");
        v16 = v15;

        objc_msgSend(v10, "objectForKey:", CFSTR("properties"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v18) = v16;
        -[MAGraph addNodeWithLabel:domain:weight:properties:](self, "addNodeWithLabel:domain:weight:properties:", v11, v13, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v19, "identifier"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("identifier"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, v21);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    }
    while (v7);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend(v43, "objectForKey:", CFSTR("edges"));
  v44 = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v22)
  {
    v23 = v22;
    obja = *(id *)v48;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(id *)v48 != obja)
          objc_enumerationMutation(v44);
        v25 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
        objc_msgSend(v25, "objectForKey:", CFSTR("sourceNodeIdentifier"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "unsignedIntegerValue");

        objc_msgSend(v25, "objectForKey:", CFSTR("targetNodeIdentifier"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "unsignedIntegerValue");

        objc_msgSend(v25, "objectForKey:", CFSTR("label"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKey:", CFSTR("domain"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "unsignedIntegerValue");

        objc_msgSend(v25, "objectForKey:", CFSTR("weight"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "floatValue");
        v37 = v36;

        objc_msgSend(v25, "objectForKey:", CFSTR("properties"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[MAGraph nodeForIdentifier:](self, "nodeForIdentifier:", v28);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[MAGraph nodeForIdentifier:](self, "nodeForIdentifier:", v31);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v41) = v37;
        v42 = -[MAGraph addEdgeWithLabel:sourceNode:targetNode:domain:weight:properties:](self, "addEdgeWithLabel:sourceNode:targetNode:domain:weight:properties:", v32, v39, v40, v34, v38, v41);

      }
      v23 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v23);
  }

}

- (MAGraph)initWithSpecification:(id)a3 dataURL:(id)a4 error:(id *)a5
{
  id v8;
  MAGraph *v9;
  void *v10;
  MAGraph *v11;
  void *v12;
  NSObject *v13;
  uint8_t v15[16];

  v8 = a4;
  v9 = -[MAGraph initWithSpecification:](self, "initWithSpecification:", a3);
  if (!v9)
  {
LABEL_5:
    v11 = v9;
    goto LABEL_10;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DB0]), "initWithURL:", v8);
  objc_msgSend(v10, "open");
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithStream:options:format:error:", v10, 0, 0, a5);
    v11 = (MAGraph *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "close");
    if (!v11)
    {

      goto LABEL_10;
    }
    -[MAGraph _loadWithGraphDictionary:](v9, "_loadWithGraphDictionary:", v11);

    goto LABEL_5;
  }
  +[MALogging sharedLogging](MALogging, "sharedLogging");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "loggingConnection");
  v13 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v15 = 0;
    _os_log_error_impl(&dword_1CA0A5000, v13, OS_LOG_TYPE_ERROR, "Bad data URL", v15, 2u);
  }

  v11 = 0;
LABEL_10:

  return v11;
}

- (MAGraph)initWithDataURL:(id)a3 error:(id *)a4
{
  return -[MAGraph initWithSpecification:dataURL:error:](self, "initWithSpecification:dataURL:error:", 0, a3, a4);
}

- (MAGraph)initWithGraphMLURL:(id)a3 error:(id *)a4
{
  id v6;
  id v7;

  v6 = a3;
  KGMethodNotImplentedException(self, a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (MAGraph)initWithGraphJSONURL:(id)a3 error:(id *)a4
{
  id v6;
  id v7;

  v6 = a3;
  KGMethodNotImplentedException(self, a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (id)_graphJSONDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MAGraph identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("id"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MAGraph version](self, "version"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("version"));

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __45__MAGraph_File_Private___graphJSONDictionary__block_invoke;
  v17[3] = &unk_1E83E5178;
  v18 = v7;
  v9 = v7;
  -[MAGraph enumerateNodesWithBlock:](self, "enumerateNodesWithBlock:", v17);
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("nodes"));
  v12 = v8;
  v13 = 3221225472;
  v14 = __45__MAGraph_File_Private___graphJSONDictionary__block_invoke_2;
  v15 = &unk_1E83E6378;
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = v16;
  -[MAGraph enumerateEdgesWithBlock:](self, "enumerateEdgesWithBlock:", &v12);
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("edges"), v12, v13, v14, v15);

  return v3;
}

- (BOOL)writeGraphJSONToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;

  v6 = a3;
  -[MAGraph _graphJSONDictionary](self, "_graphJSONDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v6, "URLByDeletingLastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "fileExistsAtPath:", v10);

  if ((v11 & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    v18 = 0;
    objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v18);
    v12 = v18;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E48]), "initWithURL:append:", v6, 0);
  v14 = v13;
  if (v12 || !v13)
  {
    if (a4)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot write data to URL %@"), v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDescription:", v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a4) = 0;
    }
  }
  else
  {
    objc_msgSend(v13, "open");
    a4 = (id *)objc_msgSend(MEMORY[0x1E0CB36D8], "writeJSONObject:toStream:options:error:", v7, v14, 0, a4);
    objc_msgSend(v14, "close");
    if (a4)
      LOBYTE(a4) = 1;
    else
      objc_msgSend(v8, "removeItemAtURL:error:", v6, 0);
  }

  return (char)a4;
}

void __45__MAGraph_File_Private___graphJSONDictionary__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a2;
  v14 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v5, CFSTR("id"));

  objc_msgSend(v4, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v6, CFSTR("name"));

  objc_msgSend(v4, "propertyDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v7, CFSTR("properties"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v4, "domain"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v8, CFSTR("domain"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "weight");
  objc_msgSend(v9, "numberWithFloat:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v10, CFSTR("weight"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = objc_msgSend(v4, "domain");

  objc_msgSend(v11, "numberWithUnsignedShort:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v13, CFSTR("cluster"));

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);
}

void __45__MAGraph_File_Private___graphJSONDictionary__block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a2;
  v17 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v5, CFSTR("id"));

  objc_msgSend(v4, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v6, CFSTR("name"));

  objc_msgSend(v4, "propertyDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v7, CFSTR("properties"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v4, "domain"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v8, CFSTR("domain"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "weight");
  objc_msgSend(v9, "numberWithFloat:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v10, CFSTR("weight"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "sourceNode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "identifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v13, CFSTR("source"));

  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "targetNode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "identifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v16, CFSTR("target"));

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v17);
}

void __41__MAGraph_File_Private___graphDictionary__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  double v12;
  void *v13;
  id v14;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a2;
  v14 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(v4, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v6, CFSTR("label"));

  objc_msgSend(v4, "propertyDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v7, CFSTR("properties"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v4, "domain"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v8, CFSTR("domain"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "weight");
  v11 = v10;

  LODWORD(v12) = v11;
  objc_msgSend(v9, "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v13, CFSTR("weight"));

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);
}

void __41__MAGraph_File_Private___graphDictionary__block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a2;
  v17 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(v4, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v6, CFSTR("label"));

  objc_msgSend(v4, "propertyDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v7, CFSTR("properties"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v4, "domain"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v8, CFSTR("domain"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "weight");
  objc_msgSend(v9, "numberWithFloat:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v10, CFSTR("weight"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "sourceNode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "identifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v13, CFSTR("sourceNodeIdentifier"));

  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "targetNode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "identifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v16, CFSTR("targetNodeIdentifier"));

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v17);
}

+ (id)graphMLURLWithPath:(id)a3 andName:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0C99E98];
  v6 = a4;
  objc_msgSend(v5, "fileURLWithPath:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URLByAppendingPathExtension:", CFSTR("graphml"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)graphJSONURLWithPath:(id)a3 andName:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0C99E98];
  v6 = a4;
  objc_msgSend(v5, "fileURLWithPath:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URLByAppendingPathExtension:", CFSTR("json"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)nodeSchemeWithLabel:(id)a3 domain:(unsigned __int16)a4
{
  uint64_t v4;
  __CFString *v6;
  double v7;
  __CFString *v8;
  void *v9;

  v4 = a4;
  v6 = (__CFString *)a3;
  if (!v6)
  {
    v6 = CFSTR("*");
    v8 = CFSTR("*");
  }
  LODWORD(v7) = 1.0;
  -[MAGraph addUniqueNodeWithLabel:domain:weight:properties:didCreate:](self, "addUniqueNodeWithLabel:domain:weight:properties:didCreate:", v6, v4, MEMORY[0x1E0C9AA70], 0, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)edgeSchemeWithLabel:(id)a3 domain:(unsigned __int16)a4 sourceNode:(id)a5 targetNode:(id)a6
{
  uint64_t v8;
  __CFString *v10;
  double v11;
  __CFString *v12;
  void *v13;

  v8 = a4;
  v10 = (__CFString *)a3;
  if (!v10)
  {
    v10 = CFSTR("*");
    v12 = CFSTR("*");
  }
  LODWORD(v11) = 1.0;
  -[MAGraph addUniqueEdgeWithLabel:sourceNode:targetNode:domain:weight:properties:](self, "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:weight:properties:", v10, a5, a6, v8, MEMORY[0x1E0C9AA70], v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)conformsToGraphSchema:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, _BYTE *);
  void *v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __49__MAGraph_Schema_Private__conformsToGraphSchema___block_invoke;
  v16 = &unk_1E83E6170;
  v6 = v4;
  v17 = v6;
  v19 = &v21;
  v20 = &v25;
  v7 = v5;
  v18 = v7;
  -[MAGraph enumerateNodesWithBlock:](self, "enumerateNodesWithBlock:", &v13);
  v8 = objc_msgSend(v7, "count", v13, v14, v15, v16);
  if (v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v7;
    _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Not verified nodes:%@\n", buf, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v9 = (void *)v26[3];
    *(_DWORD *)buf = 134217984;
    v30 = v9;
    _os_log_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Verified %lu nodes", buf, 0xCu);
  }
  if (v8)
    v10 = 1;
  else
    v10 = *((_BYTE *)v22 + 24) == 0;
  v11 = !v10;
  *((_BYTE *)v22 + 24) = v11;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v11;
}

- (id)schema:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v4 = a3;
  +[MAGraph graph](MAGraph, "graph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAGraph edgesLabels](self, "edgesLabels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __34__MAGraph_Schema_Private__schema___block_invoke;
  v14[3] = &unk_1E83E61C0;
  v14[4] = self;
  v15 = v4;
  v16 = v7;
  v8 = v5;
  v17 = v8;
  v9 = v7;
  v10 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v14);
  v11 = v17;
  v12 = v8;

  return v12;
}

void __34__MAGraph_Schema_Private__schema___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t j;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  uint64_t v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  unint64_t v47;
  uint64_t v48;
  void *v49;
  int v50;
  int v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  double v57;
  uint64_t v58;
  void *v59;
  double v60;
  void *v61;
  unsigned __int16 v62;
  double v63;
  id v64;
  id obj;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _QWORD v90[5];
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  const __CFString *v95;
  void *v96;
  const __CFString *v97;
  void *v98;
  const __CFString *v99;
  void *v100;
  const __CFString *v101;
  void *v102;
  _BYTE v103[128];
  _QWORD v104[4];
  _BYTE v105[128];
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v73 = a2;
  objc_msgSend(*(id *)(a1 + 32), "edgesForLabel:");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "valueForKeyPath:", CFSTR("domain"));
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v106, 16);
  if (v68)
  {
    v66 = *(_QWORD *)v92;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v92 != v66)
          objc_enumerationMutation(obj);
        v69 = v3;
        v4 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v3);
        v90[0] = MEMORY[0x1E0C809B0];
        v90[1] = 3221225472;
        v90[2] = __34__MAGraph_Schema_Private__schema___block_invoke_2;
        v90[3] = &unk_1E83E6198;
        v75 = v4;
        v90[4] = v4;
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v90);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "filteredSetUsingPredicate:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = 0u;
        v87 = 0u;
        v88 = 0u;
        v89 = 0u;
        v72 = v6;
        v7 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v86, v105, 16);
        if (v7)
        {
          v8 = v7;
          v78 = *(_QWORD *)v87;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v87 != v78)
                objc_enumerationMutation(v72);
              v10 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
              objc_msgSend(v10, "sourceNode");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "targetNode");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "label");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v104[0] = v13;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v11, "domain"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v104[1] = v14;
              objc_msgSend(v12, "label");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v104[2] = v15;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v12, "domain"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v104[3] = v16;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 4);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v80, "addObject:", v17);

            }
            v8 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v86, v105, 16);
          }
          while (v8);
        }

        v84 = 0u;
        v85 = 0u;
        v82 = 0u;
        v83 = 0u;
        v71 = v80;
        v76 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v82, v103, 16);
        if (v76)
        {
          v74 = *(_QWORD *)v83;
          do
          {
            for (j = 0; j != v76; ++j)
            {
              if (*(_QWORD *)v83 != v74)
                objc_enumerationMutation(v71);
              v19 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * j);
              objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
              v20 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "unsignedShortValue");

              objc_msgSend(v19, "objectAtIndexedSubscript:", 2);
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "objectAtIndexedSubscript:", 3);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "unsignedShortValue");

              v79 = (void *)v20;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NODE %@ %u"), v20, v22);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = *(void **)(a1 + 40);
              if (v26 && (objc_msgSend(v26, "containsIndex:", v22) & 1) != 0)
              {
                v27 = 0;
              }
              else
              {
                objc_msgSend(*(id *)(a1 + 32), "nodesForDomain:", v22);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "valueForKeyPath:", CFSTR("label"));
                v29 = (void *)objc_claimAutoreleasedReturnValue();

                v30 = objc_msgSend(v29, "count");
                v27 = v30 > 1;
                if (v30 >= 2)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NODE %u"), v22);
                  v31 = objc_claimAutoreleasedReturnValue();

                  v25 = (void *)v31;
                }

              }
              objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v25);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v32)
              {
                v33 = *(void **)(a1 + 56);
                if (v27)
                {
                  v34 = objc_msgSend(v33, "nodesCountForLabel:domain:properties:", 0, v22, MEMORY[0x1E0C9AA70]);
                  v35 = *(void **)(a1 + 56);
                  v101 = CFSTR("cid");
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v34);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v102 = v36;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(v38) = 1.0;
                  objc_msgSend(v35, "addUniqueNodeWithLabel:domain:weight:properties:didCreate:", 0, v22, v37, 0, v38);
                }
                else
                {
                  v39 = objc_msgSend(v33, "nodesCountForLabel:domain:properties:", v79, v22, MEMORY[0x1E0C9AA70]);
                  v40 = *(void **)(a1 + 56);
                  v99 = CFSTR("cid");
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v39);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v100 = v36;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(v41) = 1.0;
                  objc_msgSend(v40, "addNodeWithLabel:domain:weight:properties:", v79, v22, v37, v41);
                }
                v32 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v32, v25);
              }
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NODE %@ %u"), v81, v24);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = *(void **)(a1 + 40);
              v77 = v25;
              if (v43 && (objc_msgSend(v43, "containsIndex:", v24) & 1) != 0)
              {
                v44 = 0;
              }
              else
              {
                objc_msgSend(*(id *)(a1 + 32), "nodesForDomain:", v24);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "valueForKeyPath:", CFSTR("label"));
                v46 = (void *)objc_claimAutoreleasedReturnValue();

                v47 = objc_msgSend(v46, "count");
                v44 = v47 > 1;
                if (v47 >= 2)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NODE %u"), v24);
                  v48 = objc_claimAutoreleasedReturnValue();

                  v42 = (void *)v48;
                }

              }
              objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v42);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = objc_msgSend(v79, "isEqualToString:", v81);
              if ((_DWORD)v22 == (_DWORD)v24)
                v51 = v50;
              else
                v51 = 0;
              if (!v49 || v51)
              {
                v53 = *(void **)(a1 + 56);
                if (((!v44 | v51) & 1) != 0)
                {
                  v54 = objc_msgSend(v53, "nodesCountForLabel:domain:properties:", v81, v24, MEMORY[0x1E0C9AA70]);
                  v70 = *(void **)(a1 + 56);
                  v95 = CFSTR("cid");
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v54);
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  v96 = v55;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(v57) = 1.0;
                  objc_msgSend(v70, "addNodeWithLabel:domain:weight:properties:", v81, v24, v56, v57);
                }
                else
                {
                  v58 = objc_msgSend(v53, "nodesCountForLabel:domain:properties:", 0, v24, MEMORY[0x1E0C9AA70]);
                  v59 = *(void **)(a1 + 56);
                  v97 = CFSTR("cid");
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v58);
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  v98 = v55;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(v60) = 1.0;
                  objc_msgSend(v59, "addUniqueNodeWithLabel:domain:weight:properties:didCreate:", 0, v24, v56, 0, v60);
                }
                v52 = (void *)objc_claimAutoreleasedReturnValue();

                if ((v51 & 1) == 0)
                  objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v52, v42);
              }
              else
              {
                v52 = v49;
              }
              v61 = *(void **)(a1 + 56);
              v62 = objc_msgSend(v75, "intValue");
              LODWORD(v63) = 1.0;
              v64 = (id)objc_msgSend(v61, "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:weight:properties:", v73, v32, v52, v62, MEMORY[0x1E0C9AA70], v63);

            }
            v76 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v82, v103, 16);
          }
          while (v76);
        }

        v3 = v69 + 1;
      }
      while (v69 + 1 != v68);
      v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v106, 16);
    }
    while (v68);
  }

}

BOOL __34__MAGraph_Schema_Private__schema___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;

  v3 = objc_msgSend(a2, "domain");
  return v3 == (unsigned __int16)objc_msgSend(*(id *)(a1 + 32), "intValue");
}

void __49__MAGraph_Schema_Private__conformsToGraphSchema___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v5, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nodesForLabel:domain:", v7, objc_msgSend(v5, "domain"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "nodesForDomain:", objc_msgSend(v5, "domain"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "anyObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "label");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("*"));

    if ((v14 & 1) != 0)
    {
      if (v9)
        goto LABEL_2;
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    v9 = 0;
    goto LABEL_10;
  }
LABEL_2:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "conformsToNodeSchema:", v9);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) ^ 1;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    nodePrintableSchema(v5, CFSTR("REAL_NODE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    nodePrintableSchema(v9, CFSTR("DEFINITION_NODE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to verify:\n%@\n%@\n", (uint8_t *)&v15, 0x16u);

  }
LABEL_10:

}

- (id)matchWithDefinitions:(id)a3 constraints:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v46;
  void *v47;
  id v48;
  id obj;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[5];
  id v64;
  _QWORD v65[2];
  _QWORD v66[2];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    if (v7 && objc_msgSend(v7, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[MASubGraph subGraphWithGraph:](MASubGraph, "subGraphWithGraph:", self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count"))
      {
        v51 = v8;
        v52 = v6;
        v46 = v7;
        v53 = v9;
        while (1)
        {
          objc_msgSend(v8, "firstObject");
          v10 = objc_claimAutoreleasedReturnValue();
          if (!v10)
            break;
          v11 = (void *)v10;
          -[MAGraph selectBestRootNodeForPath:withDefinitions:](self, "selectBestRootNodeForPath:withDefinitions:", v10, v6);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v12)
            goto LABEL_39;
          v13 = v12;
          objc_msgSend(v12, "label");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v15, "count"))
          {

LABEL_39:
            break;
          }
          v47 = v11;
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          v62 = 0u;
          obj = v15;
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v60;
            do
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v60 != v19)
                  objc_enumerationMutation(obj);
                v21 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
                -[MAGraph nodeForIdentifier:](self, "nodeForIdentifier:", objc_msgSend(v21, "identifier"));
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v22, "isEqualToNode:", v21)
                  && (v23 = objc_msgSend(v22, "edgesCount"), v23 == objc_msgSend(v21, "edgesCount")))
                {
                  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v21);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  objc_msgSend(v21, "label");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v25, "isEqualToString:", CFSTR("*")))
                  {

                    v25 = 0;
                  }
                  v26 = objc_msgSend(v21, "domain");
                  objc_msgSend(v21, "propertyDictionary");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MAGraph nodesForLabel:domain:properties:](self, "nodesForLabel:domain:properties:", v25, v26, v27);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();

                }
                objc_msgSend(v16, "unionSet:", v24);

              }
              v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
            }
            while (v18);
          }

          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = 0u;
          v56 = 0u;
          v57 = 0u;
          v58 = 0u;
          v48 = v16;
          v29 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
          if (v29)
          {
            v30 = v29;
            v50 = *(_QWORD *)v56;
            do
            {
              for (j = 0; j != v30; ++j)
              {
                if (*(_QWORD *)v56 != v50)
                  objc_enumerationMutation(v48);
                v32 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j);
                v33 = (void *)MEMORY[0x1CAA4B20C]();
                objc_msgSend(MEMORY[0x1E0C99E20], "set");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = (void *)MEMORY[0x1E0C99DE8];
                v65[0] = CFSTR("node");
                v65[1] = CFSTR("label");
                v66[0] = v32;
                objc_msgSend(v13, "label");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v66[1] = v36;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "arrayWithObject:", v37);
                v38 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v51, "array");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v37) = -[MAGraph _matchNode:usingAbstractNode:fromEdge:atIteration:withDefinitions:constraints:unusedConstraints:andSubGraph:matchingNodeQueue:](self, "_matchNode:usingAbstractNode:fromEdge:atIteration:withDefinitions:constraints:unusedConstraints:andSubGraph:matchingNodeQueue:", v32, v13, 0, 0, v52, v39, v34, v53, v38);

                if ((_DWORD)v37)
                {
                  objc_msgSend(v13, "label");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "_addNode:withName:", v32, v40);

                }
                if (objc_msgSend(v28, "count"))
                  objc_msgSend(v28, "intersectSet:", v34);
                else
                  objc_msgSend(v28, "unionSet:", v34);

                objc_autoreleasePoolPop(v33);
              }
              v30 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
            }
            while (v30);
          }

          v8 = v51;
          objc_msgSend(v51, "intersectSet:", v28);

          v6 = v52;
          v9 = v53;
          v7 = v46;
          if (!objc_msgSend(v51, "count"))
            goto LABEL_35;
        }
        v41 = 0;
      }
      else
      {
LABEL_35:
        v41 = v9;
      }

    }
    else
    {
      +[MASubGraph subGraphWithGraph:](MASubGraph, "subGraphWithGraph:", self);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = __65__MAGraph_QueryInternal__matchWithDefinitions_constraints_error___block_invoke;
      v63[3] = &unk_1E83E62D8;
      v63[4] = self;
      v43 = v42;
      v64 = v43;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v63);
      v44 = v64;
      v41 = v43;

    }
  }
  else
  {
    v41 = 0;
  }

  return v41;
}

void __65__MAGraph_QueryInternal__matchWithDefinitions_constraints_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char isKindOfClass;
  char v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id *v18;
  id *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id obj;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = a3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        objc_opt_class();
        v12 = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) != 0)
        {
          v13 = v10;
          objc_msgSend(v13, "label");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "isEqualToString:", CFSTR("*")))
          {

            v14 = 0;
          }
          v15 = *(void **)(a1 + 32);
          v16 = objc_msgSend(v13, "domain");
          objc_msgSend(v13, "propertyDictionary");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __65__MAGraph_QueryInternal__matchWithDefinitions_constraints_error___block_invoke_2;
          v27[3] = &unk_1E83E6288;
          v28 = *(id *)(a1 + 40);
          v29 = v5;
          objc_msgSend(v15, "enumerateNodesWithLabel:domain:properties:usingBlock:", v14, v16, v17, v27);
          v19 = &v29;
          v18 = &v28;
        }
        else
        {
          if ((v12 & 1) == 0)
            continue;
          v20 = v10;
          objc_msgSend(v20, "label");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "isEqualToString:", CFSTR("*")))
          {

            v14 = 0;
          }
          v21 = *(void **)(a1 + 32);
          v22 = objc_msgSend(v20, "domain");
          objc_msgSend(v20, "propertyDictionary");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __65__MAGraph_QueryInternal__matchWithDefinitions_constraints_error___block_invoke_3;
          v24[3] = &unk_1E83E62B0;
          v25 = *(id *)(a1 + 40);
          v26 = v5;
          objc_msgSend(v21, "enumerateEdgesWithLabel:domain:properties:usingBlock:", v14, v22, v17, v24);
          v19 = &v26;
          v18 = &v25;
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v7);
  }

}

uint64_t __65__MAGraph_QueryInternal__matchWithDefinitions_constraints_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addNode:withName:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __65__MAGraph_QueryInternal__matchWithDefinitions_constraints_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addEdge:withName:", a2, *(_QWORD *)(a1 + 40));
}

- (BOOL)updateGraphWithVisualString:(id)a3
{
  id v4;
  int v5;
  id v6;
  id v7;
  id v8;
  char v9;
  id v10;
  id v12;
  id v13;
  id v14;
  id v15;

  v4 = a3;
  v14 = 0;
  v15 = 0;
  v13 = 0;
  v5 = objc_msgSend((id)objc_opt_class(), "scanMatchString:definitions:constraints:forCreation:error:", v4, &v15, &v14, 1, &v13);

  v6 = v15;
  v7 = v14;
  v8 = v13;
  if (v5)
  {
    v12 = v8;
    v9 = objc_msgSend((id)objc_opt_class(), "populateGraph:withDefinitions:constraints:error:", self, v6, v7, &v12);
    v10 = v12;

    v8 = v10;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_constraintAbstractEdgesFromAbstractNode:(id)a3 inConstraints:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id *v24;
  id v25;
  id obj;
  id v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v24 = a4;
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = *a4;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v29)
  {
    v28 = *(_QWORD *)v31;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v31 != v28)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v6);
        v8 = objc_msgSend(v5, "hasProperties", v24);
        v9 = objc_msgSend(v7, "nodesCount");
        if (!v9)
        {
          v12 = 0;
LABEL_19:
          objc_msgSend(v27, "addObject:", v7);
          goto LABEL_20;
        }
        v10 = v9;
        v11 = 0;
        v12 = 0;
        v13 = 1;
        v14 = v9;
        while (1)
        {
          v15 = v12;
          objc_msgSend(v7, "nodeAtIndex:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v12, "matchesNode:includingProperties:", v5, v8) & 1) != 0)
            break;
          ++v11;
          --v14;
          ++v13;
          if (v10 == v11)
            goto LABEL_19;
        }
        if (!v12)
          goto LABEL_19;
        if (v11)
        {
          objc_msgSend(v7, "edgeAtIndex:", v11 - 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v16);

          v17 = (void *)objc_msgSend(v7, "copy");
          if (v11 < v10)
          {
            do
            {
              objc_msgSend(v17, "removeLastEdge");
              --v14;
            }
            while (v14);
          }
          if (objc_msgSend(v17, "edgesCount"))
            objc_msgSend(v27, "addObject:", v17);

          v18 = v11;
        }
        else
        {
          v18 = 0;
        }
        if (v11 < v10 - 1)
        {
          objc_msgSend(v7, "edgeAtIndex:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v19);

          v20 = (void *)objc_msgSend(v7, "copy");
          do
          {
            objc_msgSend(v20, "removeFirstEdge");
            --v13;
          }
          while (v13);
          if (objc_msgSend(v20, "edgesCount"))
            objc_msgSend(v27, "addObject:", v20);

        }
LABEL_20:

        ++v6;
      }
      while (v6 != v29);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      v29 = v21;
    }
    while (v21);
  }

  v22 = objc_retainAutorelease(v27);
  *v24 = v22;

  return v25;
}

- (BOOL)_matchNode:(id)a3 usingAbstractNode:(id)a4 fromEdge:(id)a5 atIteration:(unint64_t)a6 withDefinitions:(id)a7 constraints:(id)a8 unusedConstraints:(id)a9 andSubGraph:(id)a10 matchingNodeQueue:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  void *v50;
  void *m;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t n;
  void *v60;
  char v61;
  void *v62;
  _BOOL4 v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t ii;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  BOOL v76;
  uint64_t v77;
  id v78;
  id v79;
  void *v80;
  void *jj;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t kk;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t mm;
  void *v96;
  char v97;
  void *v98;
  void *v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t nn;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  BOOL v113;
  id v114;
  void *v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t i;
  void *v123;
  id v124;
  void *v125;
  unint64_t v126;
  uint64_t v127;
  id obj;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  uint64_t v132;
  void *v133;
  void *v134;
  unint64_t v135;
  id v136;
  id v137;
  id v138;
  uint64_t v139;
  uint64_t v140;
  id v141;
  id v142;
  id v143;
  void *v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  void *context;
  void *contexta;
  void *contextb;
  id v151;
  void *v152;
  MAGraph *v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  id v157;
  id v158;
  void *v159;
  void *v160;
  id v161;
  char v162;
  id v163;
  id v164;
  void *v165;
  id v166;
  id v167;
  id v168;
  id v169;
  id v170;
  void *v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  _QWORD v188[4];
  id v189;
  id v190;
  id v191;
  void *v192;
  id v193;
  char v194;
  char v195;
  BOOL v196;
  char v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  _QWORD v206[4];
  id v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  _QWORD aBlock[4];
  id v221;
  id v222;
  id v223;
  id v224;
  char v225;
  char v226;
  char v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  id v240;
  _BYTE v241[128];
  _QWORD v242[2];
  _QWORD v243[2];
  _BYTE v244[128];
  _BYTE v245[128];
  _BYTE v246[128];
  _BYTE v247[128];
  _BYTE v248[128];
  _BYTE v249[128];
  _BYTE v250[128];
  _BYTE v251[128];
  _BYTE v252[128];
  _BYTE v253[128];
  _BYTE v254[128];
  uint64_t v255;

  v255 = *MEMORY[0x1E0C80C00];
  v166 = a3;
  v17 = a4;
  v161 = a5;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v124 = a10;
  v158 = a11;
  v240 = v19;
  v21 = v19;
  v153 = self;
  -[MAGraph _constraintAbstractEdgesFromAbstractNode:inConstraints:](self, "_constraintAbstractEdgesFromAbstractNode:inConstraints:", v17, &v240);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = v240;

  v165 = v17;
  v152 = v20;
  v125 = v21;
  v123 = v22;
  if (!objc_msgSend(v22, "count"))
  {
    objc_msgSend(v20, "addObjectsFromArray:", v21);
    objc_msgSend(v17, "label");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", v115);
    v116 = (void *)objc_claimAutoreleasedReturnValue();

    v117 = objc_msgSend(v17, "hasProperties");
    v236 = 0u;
    v237 = 0u;
    v238 = 0u;
    v239 = 0u;
    v114 = v116;
    v118 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v236, v254, 16);
    v23 = v18;
    if (v118)
    {
      v119 = v118;
      v120 = *(_QWORD *)v237;
      while (2)
      {
        for (i = 0; i != v119; ++i)
        {
          if (*(_QWORD *)v237 != v120)
            objc_enumerationMutation(v114);
          if ((objc_msgSend(v166, "matchesNode:includingProperties:", *(_QWORD *)(*((_QWORD *)&v236 + 1) + 8 * i), v117) & 1) != 0)
          {
            v113 = 1;
            goto LABEL_147;
          }
        }
        v119 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v236, v254, 16);
        if (v119)
          continue;
        break;
      }
      v113 = 0;
LABEL_147:
      v131 = v114;
      v17 = v165;
    }
    else
    {
      v113 = 0;
      v131 = v114;
    }
    goto LABEL_152;
  }
  v157 = v18;
  v131 = (void *)objc_opt_new();
  v232 = 0u;
  v233 = 0u;
  v234 = 0u;
  v235 = 0u;
  obj = v22;
  v130 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v232, v253, 16);
  if (v130)
  {
    v127 = 0;
    v135 = a6 + 1;
    v129 = *(_QWORD *)v233;
    v23 = v18;
LABEL_4:
    v24 = 0;
    while (1)
    {
      if (*(_QWORD *)v233 != v129)
        objc_enumerationMutation(obj);
      v132 = v24;
      v25 = *(void **)(*((_QWORD *)&v232 + 1) + 8 * v24);
      v133 = (void *)MEMORY[0x1CAA4B20C]();
      +[MASubGraph subGraphWithGraph:](MASubGraph, "subGraphWithGraph:", v153);
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "addObject:");
      objc_msgSend(v25, "oppositeNode:", v17);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v171 = v25;
      objc_msgSend(v25, "label");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKey:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v134 = v28;
      if (!objc_msgSend(v28, "count"))
      {
        v63 = 1;
        goto LABEL_126;
      }
      objc_msgSend(v26, "label");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKey:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v147 = v30;
      if (objc_msgSend(v30, "count"))
        break;
      v63 = 1;
LABEL_125:

LABEL_126:
      objc_autoreleasePoolPop(v133);
      if (v63)
      {
        v113 = 0;
        v114 = obj;
        goto LABEL_152;
      }
      v24 = v132 + 1;
      if (v132 + 1 == v130)
      {
        v112 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v232, v253, 16);
        v130 = v112;
        if (!v112)
          goto LABEL_143;
        goto LABEL_4;
      }
    }
    v31 = objc_msgSend(v171, "minimum");
    v32 = objc_msgSend(v171, "maximum");
    v162 = objc_msgSend(v171, "isDirected");
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v135;
    v136 = (id)v32;
    v160 = v26;
    v164 = v33;
    if (v135 >= v32)
    {
      v64 = 0;
    }
    else
    {
      v126 = v31;
      v231 = 0u;
      v230 = 0u;
      v229 = 0u;
      v228 = 0u;
      v167 = v134;
      v35 = objc_msgSend(v167, "countByEnumeratingWithState:objects:count:", &v228, v252, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v229;
        do
        {
          for (j = 0; j != v36; ++j)
          {
            if (*(_QWORD *)v229 != v37)
              objc_enumerationMutation(v167);
            v39 = *(void **)(*((_QWORD *)&v228 + 1) + 8 * j);
            v40 = (void *)MEMORY[0x1CAA4B20C]();
            objc_msgSend(v39, "label");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v41, "isEqualToString:", CFSTR("*")))
            {

              v41 = 0;
            }
            v227 = 0;
            objc_msgSend(v39, "propertyDictionary");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v165, "hasEdge:isIn:", v171, &v227))
            {
              aBlock[0] = MEMORY[0x1E0C809B0];
              aBlock[1] = 3221225472;
              aBlock[2] = __144__MAGraph_Query___matchNode_usingAbstractNode_fromEdge_atIteration_withDefinitions_constraints_unusedConstraints_andSubGraph_matchingNodeQueue___block_invoke;
              aBlock[3] = &unk_1E83E6210;
              v221 = v161;
              v222 = v42;
              v43 = v166;
              v223 = v43;
              v225 = v162;
              v226 = v227;
              v224 = v164;
              v44 = _Block_copy(aBlock);
              objc_msgSend(v43, "enumerateEdgesWithLabel:domain:usingBlock:", v41, objc_msgSend(v39, "domain"), v44);

            }
            objc_autoreleasePoolPop(v40);
          }
          v36 = objc_msgSend(v167, "countByEnumeratingWithState:objects:count:", &v228, v252, 16);
        }
        while (v36);
      }

      if (!objc_msgSend(v164, "count"))
      {
        v63 = 1;
        v33 = v164;
        v17 = v165;
        v26 = v160;
LABEL_124:

        goto LABEL_125;
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      context = (void *)objc_claimAutoreleasedReturnValue();
      v216 = 0u;
      v217 = 0u;
      v218 = 0u;
      v219 = 0u;
      v45 = v125;
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v216, v251, 16);
      v26 = v160;
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v217;
        do
        {
          for (k = 0; k != v47; ++k)
          {
            if (*(_QWORD *)v217 != v48)
              objc_enumerationMutation(v45);
            v50 = *(void **)(*((_QWORD *)&v216 + 1) + 8 * k);
            if (objc_msgSend(v50, "containsEdge:", v171))
              objc_msgSend(context, "addObject:", v50);
          }
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v216, v251, 16);
        }
        while (v47);
      }

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      v212 = 0u;
      v213 = 0u;
      v214 = 0u;
      v215 = 0u;
      v141 = v164;
      v168 = (id)objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v212, v250, 16);
      if (v168)
      {
        v139 = 0;
        v154 = *(_QWORD *)v213;
        do
        {
          for (m = 0; m != v168; m = (char *)m + 1)
          {
            if (*(_QWORD *)v213 != v154)
              objc_enumerationMutation(v141);
            v52 = *(void **)(*((_QWORD *)&v212 + 1) + 8 * (_QWORD)m);
            v53 = (void *)MEMORY[0x1CAA4B20C]();
            objc_msgSend(v52, "oppositeNode:", v166);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v208 = 0u;
            v209 = 0u;
            v210 = 0u;
            v211 = 0u;
            v55 = v158;
            v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v208, v249, 16);
            if (v56)
            {
              v57 = v56;
              v58 = *(_QWORD *)v209;
              while (2)
              {
                for (n = 0; n != v57; ++n)
                {
                  if (*(_QWORD *)v209 != v58)
                    objc_enumerationMutation(v55);
                  objc_msgSend(*(id *)(*((_QWORD *)&v208 + 1) + 8 * n), "objectForKeyedSubscript:", CFSTR("node"));
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  v61 = objc_msgSend(v60, "isEqual:", v54);

                  if ((v61 & 1) != 0)
                  {

                    v23 = v157;
                    goto LABEL_47;
                  }
                }
                v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v208, v249, 16);
                if (v57)
                  continue;
                break;
              }
            }

            v23 = v157;
            if (-[MAGraph _matchNode:usingAbstractNode:fromEdge:atIteration:withDefinitions:constraints:unusedConstraints:andSubGraph:matchingNodeQueue:](v153, "_matchNode:usingAbstractNode:fromEdge:atIteration:withDefinitions:constraints:unusedConstraints:andSubGraph:matchingNodeQueue:", v54, v165, v52, v135, v157, context, v152, v159, v55))
            {
              ++v139;
              objc_msgSend(v171, "label");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v159, "_addEdge:withName:", v52, v62);

            }
            else
            {
LABEL_47:
              objc_msgSend(v144, "addObject:", v52);
            }
            v26 = v160;

            objc_autoreleasePoolPop(v53);
          }
          v168 = (id)objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v212, v250, 16);
        }
        while (v168);
      }
      else
      {
        v139 = 0;
      }

      v206[0] = MEMORY[0x1E0C809B0];
      v206[1] = 3221225472;
      v206[2] = __144__MAGraph_Query___matchNode_usingAbstractNode_fromEdge_atIteration_withDefinitions_constraints_unusedConstraints_andSubGraph_matchingNodeQueue___block_invoke_2;
      v206[3] = &unk_1E83E6238;
      v207 = v141;
      objc_msgSend(v144, "enumerateObjectsUsingBlock:", v206);

      v33 = v164;
      v17 = v165;
      v34 = v135;
      v64 = v139;
      v31 = v126;
    }
    if (v34 < v31 || v34 > (unint64_t)v136)
    {
LABEL_121:
      v63 = v64 == 0;
      v111 = v127;
      if (v64)
        v111 = v127 + 1;
      v127 = v111;
    }
    else
    {
      v140 = v64;
      v204 = 0u;
      v205 = 0u;
      v202 = 0u;
      v203 = 0u;
      v137 = v134;
      v145 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v202, v248, 16);
      if (v145)
      {
        v142 = *(id *)v203;
        do
        {
          v65 = 0;
          do
          {
            if (*(id *)v203 != v142)
              objc_enumerationMutation(v137);
            v66 = *(void **)(*((_QWORD *)&v202 + 1) + 8 * v65);
            contexta = (void *)MEMORY[0x1CAA4B20C]();
            objc_msgSend(v66, "label");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v155 = v65;
            if (objc_msgSend(v67, "isEqualToString:", CFSTR("*")))
            {

              v67 = 0;
            }
            v200 = 0u;
            v201 = 0u;
            v198 = 0u;
            v199 = 0u;
            v169 = v147;
            v68 = objc_msgSend(v169, "countByEnumeratingWithState:objects:count:", &v198, v247, 16);
            if (v68)
            {
              v69 = v68;
              v70 = *(_QWORD *)v199;
              do
              {
                for (ii = 0; ii != v69; ++ii)
                {
                  if (*(_QWORD *)v199 != v70)
                    objc_enumerationMutation(v169);
                  v72 = *(void **)(*((_QWORD *)&v198 + 1) + 8 * ii);
                  v227 = 0;
                  if (objc_msgSend(v17, "hasEdge:isIn:", v171, &v227))
                  {
                    v73 = v67;
                    objc_msgSend(v66, "propertyDictionary");
                    v74 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v72, "graphReference");
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    v76 = v75 == 0;

                    if (v75)
                      LOBYTE(v77) = 0;
                    else
                      v77 = objc_msgSend(v72, "hasProperties");
                    v188[0] = MEMORY[0x1E0C809B0];
                    v188[1] = 3221225472;
                    v188[2] = __144__MAGraph_Query___matchNode_usingAbstractNode_fromEdge_atIteration_withDefinitions_constraints_unusedConstraints_andSubGraph_matchingNodeQueue___block_invoke_3;
                    v188[3] = &unk_1E83E6260;
                    v189 = v161;
                    v190 = v74;
                    v78 = v166;
                    v194 = v162;
                    v195 = v227;
                    v196 = v76;
                    v191 = v78;
                    v192 = v72;
                    v197 = v77;
                    v193 = v164;
                    v79 = v74;
                    v80 = _Block_copy(v188);
                    v67 = v73;
                    objc_msgSend(v78, "enumerateEdgesWithLabel:domain:usingBlock:", v73, objc_msgSend(v66, "domain"), v80);

                    v17 = v165;
                  }
                }
                v69 = objc_msgSend(v169, "countByEnumeratingWithState:objects:count:", &v198, v247, 16);
              }
              while (v69);
            }

            objc_autoreleasePoolPop(contexta);
            v23 = v157;
            v65 = v155 + 1;
            v26 = v160;
          }
          while (v155 + 1 != v145);
          v145 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v202, v248, 16);
        }
        while (v145);
      }

      if (objc_msgSend(v164, "count"))
      {
        v186 = 0u;
        v187 = 0u;
        v184 = 0u;
        v185 = 0u;
        v138 = v164;
        v146 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v184, v246, 16);
        if (!v146)
          goto LABEL_120;
        v143 = *(id *)v185;
        while (1)
        {
          for (jj = 0; jj != (void *)v146; jj = (char *)jj + 1)
          {
            if (*(id *)v185 != v143)
              objc_enumerationMutation(v138);
            v156 = *(void **)(*((_QWORD *)&v184 + 1) + 8 * (_QWORD)jj);
            objc_msgSend(v156, "oppositeNode:", v166);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            v180 = 0u;
            v181 = 0u;
            v182 = 0u;
            v183 = 0u;
            v163 = v147;
            v83 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v180, v245, 16);
            if (!v83)
              goto LABEL_118;
            v84 = v83;
            contextb = jj;
            v85 = *(_QWORD *)v181;
            while (2)
            {
              for (kk = 0; kk != v84; ++kk)
              {
                if (*(_QWORD *)v181 != v85)
                  objc_enumerationMutation(v163);
                v87 = *(void **)(*((_QWORD *)&v180 + 1) + 8 * kk);
                v88 = (void *)MEMORY[0x1CAA4B20C]();
                objc_msgSend(v87, "graphReference");
                v89 = (void *)objc_claimAutoreleasedReturnValue();

                if (v89)
                {
                  if (!objc_msgSend(v82, "isSameNodeAsNode:", v87))
                    goto LABEL_106;
                }
                else if ((objc_msgSend(v82, "matchesNode:includingProperties:", v87, objc_msgSend(v87, "hasProperties")) & 1) == 0)
                {
                  goto LABEL_106;
                }
                v170 = v88;
                v90 = v84;
                v178 = 0u;
                v179 = 0u;
                v176 = 0u;
                v177 = 0u;
                v91 = v158;
                v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v176, v244, 16);
                if (v92)
                {
                  v93 = v92;
                  v94 = *(_QWORD *)v177;
                  while (2)
                  {
                    for (mm = 0; mm != v93; ++mm)
                    {
                      if (*(_QWORD *)v177 != v94)
                        objc_enumerationMutation(v91);
                      objc_msgSend(*(id *)(*((_QWORD *)&v176 + 1) + 8 * mm), "objectForKeyedSubscript:", CFSTR("node"));
                      v96 = (void *)objc_claimAutoreleasedReturnValue();
                      v97 = objc_msgSend(v96, "isEqual:", v82);

                      if ((v97 & 1) != 0)
                      {

                        v84 = v90;
                        v88 = v170;
                        goto LABEL_106;
                      }
                    }
                    v93 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v176, v244, 16);
                    if (v93)
                      continue;
                    break;
                  }
                }

                v243[0] = v82;
                v242[0] = CFSTR("node");
                v242[1] = CFSTR("label");
                objc_msgSend(v160, "label");
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                v243[1] = v98;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v243, v242, 2);
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v91, "addObject:", v99);

                LODWORD(v98) = -[MAGraph _matchNode:usingAbstractNode:fromEdge:atIteration:withDefinitions:constraints:unusedConstraints:andSubGraph:matchingNodeQueue:](v153, "_matchNode:usingAbstractNode:fromEdge:atIteration:withDefinitions:constraints:unusedConstraints:andSubGraph:matchingNodeQueue:", v82, v160, v156, 0, v157, v151, v152, v159, v91);
                objc_msgSend(v91, "removeLastObject");
                v84 = v90;
                v88 = v170;
                if ((_DWORD)v98)
                {
                  v174 = 0u;
                  v175 = 0u;
                  v172 = 0u;
                  v173 = 0u;
                  v100 = v91;
                  v101 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v172, v241, 16);
                  if (v101)
                  {
                    v102 = v101;
                    v103 = *(_QWORD *)v173;
                    do
                    {
                      for (nn = 0; nn != v102; ++nn)
                      {
                        if (*(_QWORD *)v173 != v103)
                          objc_enumerationMutation(v100);
                        v105 = *(void **)(*((_QWORD *)&v172 + 1) + 8 * nn);
                        objc_msgSend(v105, "objectForKeyedSubscript:", CFSTR("node"));
                        v106 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v105, "objectForKeyedSubscript:", CFSTR("label"));
                        v107 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v159, "_addNode:withName:forKeyNode:", v106, v107, v82);
                        objc_msgSend(v160, "label");
                        v108 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v159, "_addNode:withName:forKeyNode:", v82, v108, v106);

                      }
                      v102 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v172, v241, 16);
                    }
                    while (v102);
                  }
                  ++v140;

                  v26 = v160;
                  objc_msgSend(v160, "label");
                  v109 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v159, "_addNode:withName:", v82, v109);

                  objc_msgSend(v171, "label");
                  v110 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v159, "_addEdge:withName:", v156, v110);

                  objc_autoreleasePoolPop(v170);
                  v17 = v165;
                  goto LABEL_117;
                }
LABEL_106:
                objc_autoreleasePoolPop(v88);
              }
              v84 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v180, v245, 16);
              if (v84)
                continue;
              break;
            }
            v17 = v165;
            v26 = v160;
LABEL_117:
            jj = contextb;
LABEL_118:

          }
          v146 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v184, v246, 16);
          if (!v146)
          {
LABEL_120:

            v23 = v157;
            v33 = v164;
            v64 = v140;
            goto LABEL_121;
          }
        }
      }
      v63 = 1;
      v33 = v164;
    }
    goto LABEL_124;
  }
  v127 = 0;
  v23 = v18;
LABEL_143:

  if (v127 == objc_msgSend(obj, "count"))
  {
    if (objc_msgSend(v131, "count") == 1)
      objc_msgSend(v131, "firstObject");
    else
      +[MASubGraph subGraphIntersectionsWithSubGraphs:](MASubGraph, "subGraphIntersectionsWithSubGraphs:", v131);
    v114 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "mergeWithSubGraph:", v114);
    v113 = 1;
LABEL_152:

    goto LABEL_153;
  }
  v113 = 0;
LABEL_153:

  return v113;
}

- (id)selectBestRootNodeForPath:(id)a3 withDefinitions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t j;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v44;
  void *v45;
  id v46;
  id obj;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  unint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "sourceNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = v6;
  objc_msgSend(v6, "targetNode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v7;
  objc_msgSend(v7, "objectForKey:", v12);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v10;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (!v13)
  {
    v15 = 0;
    v51 = 0;
    goto LABEL_20;
  }
  v14 = v13;
  v15 = 0;
  v51 = 0;
  v16 = *(_QWORD *)v57;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v57 != v16)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
      v19 = objc_msgSend(v18, "edgesCount");
      objc_msgSend(v18, "graphReference");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
        goto LABEL_13;
      -[MAGraph nodeForIdentifier:](self, "nodeForIdentifier:", objc_msgSend(v18, "identifier"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "isEqualToNode:", v18) & 1) == 0)
      {

LABEL_13:
        objc_msgSend(v18, "label");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "isEqualToString:", CFSTR("*")))
        {

          v25 = 0;
        }
        v26 = objc_msgSend(v18, "domain");
        objc_msgSend(v18, "propertyDictionary");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v51 += -[MAGraph nodesCountForLabel:domain:properties:](self, "nodesCountForLabel:domain:properties:", v25, v26, v27);

        goto LABEL_16;
      }
      v22 = objc_msgSend(v21, "edgesCount");
      v23 = objc_msgSend(v18, "edgesCount");

      v24 = v51;
      if (v22 == v23)
        v24 = v51 + 1;
      v51 = v24;
      if (v22 != v23)
        goto LABEL_13;
LABEL_16:
      v15 += v19;
    }
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  }
  while (v14);
LABEL_20:

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v46 = v49;
  v50 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  v28 = 0;
  v29 = 0;
  if (v50)
  {
    v48 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v50; ++j)
      {
        if (*(_QWORD *)v53 != v48)
          objc_enumerationMutation(v46);
        v31 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
        v32 = objc_msgSend(v31, "edgesCount");
        objc_msgSend(v31, "graphReference");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          -[MAGraph nodeForIdentifier:](self, "nodeForIdentifier:", objc_msgSend(v31, "identifier"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v34, "isEqualToNode:", v31) & 1) != 0)
          {
            v35 = objc_msgSend(v34, "edgesCount");
            v36 = objc_msgSend(v31, "edgesCount");

            if (v35 == v36)
            {
              ++v28;
              goto LABEL_33;
            }
          }
          else
          {

          }
        }
        objc_msgSend(v31, "label");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v37, "isEqualToString:", CFSTR("*")))
        {

          v37 = 0;
        }
        v38 = objc_msgSend(v31, "domain");
        objc_msgSend(v31, "propertyDictionary");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v28 += -[MAGraph nodesCountForLabel:domain:properties:](self, "nodesCountForLabel:domain:properties:", v37, v38, v39);

LABEL_33:
        v29 += v32;
      }
      v50 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    }
    while (v50);
  }

  if (v51 > v28 || v51 >= v28 && v15 >= v29)
  {
    v40 = v45;
    objc_msgSend(v45, "targetNode");
    v41 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v40 = v45;
    objc_msgSend(v45, "sourceNode");
    v41 = objc_claimAutoreleasedReturnValue();
  }
  v42 = (void *)v41;

  return v42;
}

- (id)matchWithVisualFormat:(id)a3 elements:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  MAGraph *v24;
  void *context;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v24 = self;
  v38 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v6 = a4;
  context = (void *)MEMORY[0x1CAA4B20C]();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v33 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v13, v24);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v15, v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v10);
  }

  v30 = 0;
  v31 = v7;
  v29 = 0;
  v16 = objc_msgSend((id)objc_opt_class(), "scanMatchString:definitions:constraints:forCreation:error:", v27, &v31, &v30, 0, &v29);
  v17 = v31;

  v18 = v30;
  v19 = v29;
  v20 = v19;
  if (v16)
  {
    v28 = v19;
    -[MAGraph matchWithDefinitions:constraints:error:](v24, "matchWithDefinitions:constraints:error:", v17, v18, &v28);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v28;

    v20 = v22;
  }
  else
  {
    v21 = 0;
  }

  objc_autoreleasePoolPop(context);
  if (a5)
    *a5 = objc_retainAutorelease(v20);

  return v21;
}

- (id)matchWithVisualString:(id)a3 error:(id *)a4
{
  return -[MAGraph matchWithVisualFormat:elements:error:](self, "matchWithVisualFormat:elements:error:", a3, MEMORY[0x1E0C9AA70], a4);
}

void __144__MAGraph_Query___matchNode_usingAbstractNode_fromEdge_atIteration_withDefinitions_constraints_unusedConstraints_andSubGraph_matchingNodeQueue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  if ((objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    if (objc_msgSend(v5, "hasProperties:", *(_QWORD *)(a1 + 40)))
    {
      objc_msgSend(v5, "targetNode");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "isSameNodeAsNode:", *(_QWORD *)(a1 + 48));

      if (!*(_BYTE *)(a1 + 64) || *(unsigned __int8 *)(a1 + 65) == v4)
        objc_msgSend(*(id *)(a1 + 56), "addObject:", v5);
    }
  }

}

uint64_t __144__MAGraph_Query___matchNode_usingAbstractNode_fromEdge_atIteration_withDefinitions_constraints_unusedConstraints_andSubGraph_matchingNodeQueue___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObject:", a2);
}

void __144__MAGraph_Query___matchNode_usingAbstractNode_fromEdge_atIteration_withDefinitions_constraints_unusedConstraints_andSubGraph_matchingNodeQueue___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  if ((objc_msgSend(v11, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) == 0
    && objc_msgSend(v11, "hasProperties:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(v11, "sourceNode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "targetNode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isSameNodeAsNode:", *(_QWORD *)(a1 + 48));
    v6 = v5;
    if (*(_BYTE *)(a1 + 72))
    {
      v7 = *(unsigned __int8 *)(a1 + 73);
      if (v5)
        v8 = v3;
      else
        v8 = v4;
      v9 = v8;
      if (v7 != v6)
        goto LABEL_18;
    }
    else
    {
      if (v5)
        v10 = v3;
      else
        v10 = v4;
      v9 = v10;
    }
    if (!*(_BYTE *)(a1 + 74))
      goto LABEL_22;
    if ((objc_msgSend(v9, "matchesNode:includingProperties:", *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 75)) & 1) != 0)
    {
LABEL_17:
      objc_msgSend(*(id *)(a1 + 64), "addObject:", v11);
      goto LABEL_18;
    }
    if (!*(_BYTE *)(a1 + 74))
    {
LABEL_22:
      if (objc_msgSend(v9, "isSameNodeAsNode:", *(_QWORD *)(a1 + 56)))
        goto LABEL_17;
    }
LABEL_18:

  }
}

+ (BOOL)scanGraphElementString:(id)a3 type:(unint64_t *)a4 optionalName:(id *)a5 label:(id *)a6 optionalDomains:(id *)a7 optionalProperties:(id *)a8 error:(id *)a9
{
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  uint64_t v18;
  id v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  id v32;
  const __CFString *v33;
  const __CFString *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  unint64_t *v42;
  char v43;
  id v44;
  uint64_t v45;
  BOOL v46;
  void *v47;
  __CFString *v48;
  void *v49;
  void *v50;
  char v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id *v57;
  id *v58;
  id *v59;
  id v60;
  id *v61;
  id v62;
  int v63;
  const __CFString *v64;
  uint64_t v65;
  void *v67;
  __CFString *v68;
  void *v69;
  id v70;
  id v71;
  uint64_t v72;
  id v73;
  id v74;
  _QWORD v75[2];
  _QWORD v76[4];

  v76[2] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3780], "alphanumericCharacterSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addCharactersInString:", CFSTR("_"));
  objc_msgSend(v15, "removeCharactersInString:", CFSTR("([:{';}])"));
  objc_msgSend(MEMORY[0x1E0CB3780], "alphanumericCharacterSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addCharactersInString:", CFSTR("_ -%:/+*.$^(?)><="));
  objc_msgSend(v16, "removeCharactersInString:", CFSTR("[{';}]"));
  if (objc_msgSend(v14, "scanString:intoString:", CFSTR("("), 0)
    && objc_msgSend(v14, "scanLocation") == 1)
  {
    v63 = 0;
    v17 = 1;
    v18 = 1;
  }
  else
  {
    if (!objc_msgSend(v14, "scanString:intoString:", CFSTR("["), 0))
    {
      v68 = 0;
      v69 = 0;
      v67 = 0;
      v19 = 0;
      v23 = 0;
      v17 = 0;
      goto LABEL_79;
    }
    v17 = 0;
    if (objc_msgSend(v14, "scanLocation") != 1)
    {
      v68 = 0;
      v69 = 0;
      v67 = 0;
      v19 = 0;
      v23 = 0;
      goto LABEL_79;
    }
    v63 = 1;
    v18 = 2;
  }
  v65 = v18;
  v74 = 0;
  objc_msgSend(v14, "scanCharactersFromSet:intoString:", v15, &v74);
  v19 = v74;
  if ((objc_msgSend(v14, "scanString:intoString:", CFSTR(":"), 0) & 1) != 0)
  {
    v73 = 0;
    objc_msgSend(v14, "scanCharactersFromSet:intoString:", v15, &v73);
    v20 = (const __CFString *)v73;
    v21 = CFSTR("*");
    if (v20)
      v21 = v20;
    v68 = (__CFString *)v21;
    v61 = a5;
    v62 = v19;
    if (!objc_msgSend(v14, "scanString:intoString:", CFSTR(":"), 0))
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:
      v69 = 0;
      if (objc_msgSend(v14, "scanString:intoString:", CFSTR("{"), 0))
      {
        v57 = a6;
        v58 = a7;
        v59 = a8;
        v60 = v13;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0;
        v26 = 0;
        while (1)
        {
          v27 = v25;
          v71 = v25;
          v28 = objc_msgSend(v14, "scanCharactersFromSet:intoString:", v15, &v71);
          v25 = v71;

          if (!v28
            || (objc_msgSend(v14, "scanString:intoString:", CFSTR(":"), 0) & 1) == 0
            && !objc_msgSend(v14, "scanUpToString:intoString:", CFSTR(":"), 0)
            || (objc_msgSend(v14, "scanString:intoString:", CFSTR("'"), 0) & 1) == 0
            && !objc_msgSend(v14, "scanUpToString:intoString:", CFSTR("'"), 0))
          {
            goto LABEL_59;
          }
          v29 = v15;
          v70 = v26;
          v30 = v16;
          v31 = objc_msgSend(v14, "scanCharactersFromSet:intoString:", v16, &v70);
          v32 = v70;

          if (!v31 || !objc_msgSend(v14, "scanString:intoString:", CFSTR("'"), 0))
          {
            v26 = v32;
            v16 = v30;
            v15 = v29;
LABEL_59:
            v19 = v62;
            goto LABEL_60;
          }
          v33 = CFSTR(">");
          if ((objc_msgSend(v32, "hasPrefix:", CFSTR(">")) & 1) == 0
            && !objc_msgSend(v32, "hasPrefix:", CFSTR("<")))
          {
            v36 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
            objc_msgSend(v36, "numberFromString:", v32);
            v37 = objc_claimAutoreleasedReturnValue();
            v38 = (void *)v37;
            if (v37)
              v39 = (id)v37;
            else
              v39 = v32;
            objc_msgSend(v69, "setObject:forKey:", v39, v25);
            v26 = v32;
            v16 = v30;
            goto LABEL_53;
          }
          v34 = CFSTR(">=");
          if ((objc_msgSend(v32, "hasPrefix:", CFSTR(">=")) & 1) != 0
            || (v34 = CFSTR("<="), (objc_msgSend(v32, "hasPrefix:", CFSTR("<=")) & 1) != 0))
          {
            v35 = 2;
            v64 = v34;
          }
          else
          {
            if ((objc_msgSend(v32, "hasPrefix:", CFSTR(">")) & 1) != 0)
            {
              v35 = 1;
            }
            else
            {
              v33 = CFSTR("<");
              v35 = 1;
              if (!objc_msgSend(v32, "hasPrefix:", CFSTR("<")))
              {
                v64 = 0;
                v26 = v32;
                goto LABEL_49;
              }
            }
            v64 = v33;
          }
          objc_msgSend(v32, "substringFromIndex:", v35);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          LOBYTE(v35) = 0;
LABEL_49:
          v36 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
          objc_msgSend(v36, "numberFromString:", v26);
          v40 = objc_claimAutoreleasedReturnValue();
          v38 = (void *)v40;
          v16 = v30;
          if ((v35 & 1) != 0 || !v40)
          {
            objc_msgSend(v69, "setObject:forKey:", v26, v25);
          }
          else
          {
            v75[0] = CFSTR("operator");
            v75[1] = CFSTR("value");
            v76[0] = v64;
            v76[1] = v40;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 2);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "setObject:forKey:", v41, v25);

          }
LABEL_53:
          v15 = v29;

          if ((objc_msgSend(v14, "scanString:intoString:", CFSTR(";"), 0) & 1) == 0)
          {
            v43 = objc_msgSend(v14, "scanString:intoString:", CFSTR("}"), 0);
            v19 = v62;
            if ((v43 & 1) != 0)
            {

              a8 = v59;
              v13 = v60;
              a6 = v57;
              a7 = v58;
              a5 = v61;
              break;
            }
LABEL_60:

            v17 = 0;
            a8 = v59;
            v13 = v60;
            a6 = v57;
            a7 = v58;
            a5 = v61;
            goto LABEL_74;
          }
        }
      }
      if (!v17 || objc_msgSend(v14, "scanString:intoString:", CFSTR(")"), 0))
      {
        if (!v63 || objc_msgSend(v14, "scanString:intoString:", CFSTR("]"), 0))
        {
          v44 = v19;
          v45 = objc_msgSend(v14, "scanLocation");
          v46 = v45 == objc_msgSend(v13, "length");
          v19 = v44;
          v17 = v46;
          goto LABEL_74;
        }
        goto LABEL_78;
      }
LABEL_77:
      v17 = 0;
      v23 = 1;
      goto LABEL_79;
    }
    v72 = 0;
    objc_msgSend(v14, "scanInteger:", &v72);
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", v72);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "scanString:intoString:", CFSTR(","), 0))
    {
      do
      {
        objc_msgSend(v14, "scanInteger:", &v72);
        objc_msgSend(v22, "addIndex:", v72);
      }
      while ((objc_msgSend(v14, "scanString:intoString:", CFSTR(","), 0) & 1) != 0);
    }
    if ((unint64_t)objc_msgSend(v22, "count") < 2
      || -[__CFString isEqualToString:](v68, "isEqualToString:", CFSTR("*")))
    {
      v67 = (void *)objc_msgSend(v22, "copy");

      v19 = v62;
      goto LABEL_26;
    }

    v69 = 0;
    v67 = 0;
    v17 = 0;
LABEL_63:
    v42 = a4;
    v19 = v62;
    goto LABEL_75;
  }
  if (!v19)
  {
    v68 = 0;
    v69 = 0;
    v67 = 0;
    v17 = 0;
LABEL_74:
    v42 = a4;
LABEL_75:
    v23 = v65;
    if (!v42)
      goto LABEL_83;
    goto LABEL_80;
  }
  if (v17 && (objc_msgSend(v14, "scanString:intoString:", CFSTR(")"), 0) & 1) != 0)
    goto LABEL_22;
  if (!v63)
  {
    v68 = 0;
    v69 = 0;
    v67 = 0;
    goto LABEL_77;
  }
  if (objc_msgSend(v14, "scanString:intoString:", CFSTR("]"), 0))
  {
LABEL_22:
    v62 = v19;
    v24 = objc_msgSend(v14, "scanLocation");
    if (v24 == objc_msgSend(v13, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = 0;
      v69 = 0;
      v17 = 1;
    }
    else
    {
      v68 = 0;
      v69 = 0;
      v67 = 0;
      v17 = 0;
    }
    goto LABEL_63;
  }
  v68 = 0;
  v69 = 0;
  v67 = 0;
LABEL_78:
  v17 = 0;
  v23 = 2;
LABEL_79:
  v42 = a4;
  if (!a4)
    goto LABEL_83;
LABEL_80:
  if (!v17)
    v23 = 0;
  *v42 = v23;
LABEL_83:
  if (a5)
  {
    if (v17)
      v47 = v19;
    else
      v47 = 0;
    *a5 = objc_retainAutorelease(v47);
  }
  if (a6)
  {
    if (v17)
      v48 = v68;
    else
      v48 = 0;
    *a6 = objc_retainAutorelease(v48);
  }
  if (a7)
  {
    if (v17)
      v49 = v67;
    else
      v49 = 0;
    *a7 = objc_retainAutorelease(v49);
  }
  if (a8)
  {
    if (v17)
    {
      if (objc_msgSend(v69, "count"))
        v50 = v69;
      else
        v50 = 0;
    }
    else
    {
      v50 = 0;
    }
    *a8 = objc_retainAutorelease(v50);
  }
  if (a9)
    v51 = v17;
  else
    v51 = 1;
  if ((v51 & 1) == 0)
  {
    v52 = v19;
    v53 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@' do not match element requirement."), v13);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v53;
    v19 = v52;
    objc_msgSend(v55, "errorWithDescription:", v54);
    *a9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

+ (id)scanGraphConstraintString:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("("))
    && objc_msgSend(v4, "hasSuffix:", CFSTR(")")))
  {
    v5 = (void *)objc_opt_new();
    v29 = 0;
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(\\(|<?-\\[)([\\w\\d\\,\\-\\ \\:\\{\\'\\;\\}\\#\\%\\+\\$\\^\\/\\(\\)\\?\\=]+)(\\)|\\](?:\\*\\d+\\.\\.\\d+)?->?)"),
      0,
      &v29);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v29;
    v8 = v7;
    v9 = 0;
    if (v6 && !v7)
    {
      objc_msgSend(v6, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v12 = v10;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v26;
          v24 = v11;
          while (2)
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v26 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
              if (objc_msgSend(v17, "numberOfRanges") != 4
                || ((v18 = objc_msgSend(v17, "rangeAtIndex:", 0), v18 != 0x7FFFFFFFFFFFFFFFLL)
                  ? (v20 = v19 == 0)
                  : (v20 = 1),
                    v20))
              {

                v9 = 0;
                v11 = v24;
                goto LABEL_25;
              }
              objc_msgSend(v4, "substringWithRange:", v18, v19);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v21);

            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
            v11 = v24;
            if (v14)
              continue;
            break;
          }
        }

        if (objc_msgSend(v5, "count"))
          v22 = v5;
        else
          v22 = 0;
        v9 = v22;
      }
      else
      {
        v9 = 0;
      }
LABEL_25:

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)scanGraphElementOptionsString:(id)a3 minimum:(unint64_t *)a4 maximum:(unint64_t *)a5 error:(id *)a6
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  BOOL v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _OWORD v30[4];
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v31 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("[\\w\\d\\,\\-\\ \\:\\{\\'\\;\\}\\#\\%\\+\\$\\^\\/\\(\\)\\?\\=]+\\](?:\\*(\\d+)\\.\\.(\\d+))?"),
    0,
    &v31);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v31;
  v11 = v10;
  *a4 = 1;
  *a5 = 1;
  if (v9)
    v12 = v10 == 0;
  else
    v12 = 0;
  if (v12)
  {
    objc_msgSend(v9, "matchesInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      memset(v30, 0, sizeof(v30));
      v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", v30, v32, 16);
      if (v17)
      {
        v18 = (void *)**((_QWORD **)&v30[0] + 1);
        if (objc_msgSend(**((id **)&v30[0] + 1), "numberOfRanges") == 3)
        {
          v19 = objc_msgSend(v18, "rangeAtIndex:", 1);
          v21 = v20;
          v22 = objc_msgSend(v18, "rangeAtIndex:", 2);
          v16 = 0;
          if (v19 != 0x7FFFFFFFFFFFFFFFLL)
          {
            if (v21)
            {
              v24 = v22;
              if (v22 != 0x7FFFFFFFFFFFFFFFLL)
              {
                if (v23)
                {
                  v25 = v21;
                  v26 = v23;
                  objc_msgSend(v8, "substringWithRange:", v19, v25);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v8, "substringWithRange:", v24, v26);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  *a4 = objc_msgSend(v27, "integerValue");
                  *a5 = objc_msgSend(v28, "integerValue");

                  v16 = 1;
                }
              }
            }
          }
        }
        else
        {
          v16 = 0;
        }
      }
      v13 = (v17 != 0) & v16;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)visualStringWithFormat:(id)a3 elements:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v5, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "visualString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v12, "visualStringWithName:", v11);
          v14 = objc_claimAutoreleasedReturnValue();

          v13 = (void *)v14;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", v15, v13, 0, 0, objc_msgSend(v6, "length"));

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  return v6;
}

+ (BOOL)scanMatchString:(id)a3 definitions:(id *)a4 constraints:(id *)a5 forCreation:(BOOL)a6 error:(id *)a7
{
  uint64_t v10;
  void *v11;
  MAAbstractGraph *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _UNKNOWN **v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  id v28;
  id v29;
  unsigned __int16 v30;
  void *v31;
  MAAbstractNode *v32;
  double v33;
  MAAbstractNode *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  unint64_t v49;
  unint64_t v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _BOOL4 v56;
  unsigned __int16 v57;
  id v58;
  double v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id *v68;
  id *v69;
  void *v70;
  void *v71;
  MAAbstractGraph *v72;
  void *v73;
  id obj;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  id v83;
  id *v84;
  void *v85;
  void *v86;
  unint64_t v87;
  uint64_t v88;
  void *v90;
  id v91;
  void *v92;
  id v93;
  void *v94;
  id v95;
  id v96;
  _OWORD v97[4];
  uint64_t v98;
  uint64_t v99;
  id v100;
  id v101;
  id v102;
  id v103;
  uint64_t v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _BYTE v109[128];
  _BYTE v110[128];
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v83 = a3;
  if (a4 && *a4)
  {
    v10 = objc_msgSend(*a4, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MAAbstractGraph);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("([\\(|\\[](?:[\\w\\|\\*\\ \\.;\\'\\{\\}\\:\\(\\)\\-\\>\\<\\[\\]\\%\\+\\$\\^\\/\\?\\=]|\\d,)+[\\)|\\]])"),
    0,
    a7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v14, "matchesInString:options:range:", v83, 0, 0, objc_msgSend(v83, "length"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v68 = a4;
      v69 = a5;
      v71 = v14;
      v72 = v12;
      v73 = v13;
      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      v70 = v15;
      obj = v15;
      v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v110, 16);
      if (v75)
      {
        v17 = &off_1E83DD000;
        v76 = *(_QWORD *)v106;
        v18 = 1;
        v82 = v11;
        v84 = a7;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v106 != v76)
            {
              v20 = v19;
              objc_enumerationMutation(obj);
              v19 = v20;
            }
            v77 = v19;
            v21 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v19);
            if ((unint64_t)objc_msgSend(v21, "numberOfRanges") >= 2)
            {
              v22 = 1;
              v85 = v21;
              while (2)
              {
                if (objc_msgSend(v21, "rangeAtIndex:", v22) == 0x7FFFFFFFFFFFFFFFLL || !v23)
                  goto LABEL_64;
                v24 = objc_msgSend(v21, "rangeAtIndex:", v22);
                objc_msgSend(v83, "substringWithRange:", v24, v25);
                v26 = objc_claimAutoreleasedReturnValue();
                v103 = 0;
                v104 = 0;
                v101 = 0;
                v102 = 0;
                v100 = 0;
                v86 = (void *)v26;
                v27 = objc_msgSend(a1, "scanGraphElementString:type:optionalName:label:optionalDomains:optionalProperties:error:", 0);
                v96 = v103;
                v28 = v102;
                v95 = v101;
                v93 = v100;
                v94 = v28;
                v87 = v22;
                if (v27 && v28)
                {
                  if (v104 != 2)
                  {
                    if (v104 == 1)
                    {
                      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v95, "count"));
                      v29 = (id)objc_claimAutoreleasedReturnValue();
                      v30 = objc_msgSend(v95, "firstIndex");
                      while (v30 != 0xFFFF)
                      {
                        v31 = v29;
                        v32 = [MAAbstractNode alloc];
                        LODWORD(v33) = 1.0;
                        v34 = -[MAAbstractNode initWithLabel:domain:weight:properties:](v32, "initWithLabel:domain:weight:properties:", v94, v30, v93, v33);
                        -[MANode setIdentifier:](v34, "setIdentifier:", v18);
                        v35 = (uint64_t)v96;
                        if (!v96)
                        {
                          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#NodeID%ld"), -[MANode identifier](v34, "identifier"));
                          v35 = objc_claimAutoreleasedReturnValue();
                        }
                        ++v18;
                        v96 = (id)v35;
                        objc_msgSend(v11, "objectForKey:", v35);
                        v36 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v36)
                        {
                          if (!a7)
                            goto LABEL_72;
                          v63 = (void *)MEMORY[0x1E0CB35C8];
                          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Query string malformed, node named '%@' has no matching definition."), v96);
                          goto LABEL_71;
                        }
                        v29 = v31;
                        objc_msgSend(v31, "addObject:", v34);
                        v30 = objc_msgSend(v95, "indexGreaterThanIndex:", v30);

                      }
                      goto LABEL_54;
                    }
                    if (a7)
                    {
                      v62 = (void *)MEMORY[0x1E0CB35C8];
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Query string malformed, element '%@' doesn't match any type."), v86);
                      v29 = (id)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v62, "errorWithDescription:", v29);
                      v56 = 0;
                      *a7 = (id)objc_claimAutoreleasedReturnValue();
                      goto LABEL_62;
                    }
                    v56 = 0;
LABEL_63:

                    if (!v56)
                    {

                      v12 = v72;
                      v13 = v73;
                      goto LABEL_88;
                    }
LABEL_64:
                    ++v22;
                    v21 = v85;
                    if (v22 >= objc_msgSend(v85, "numberOfRanges"))
                      goto LABEL_73;
                    continue;
                  }
                  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v95, "count"));
                  v29 = (id)objc_claimAutoreleasedReturnValue();
                  v57 = objc_msgSend(v95, "firstIndex");
                  while (v57 != 0xFFFF)
                  {
                    v31 = v29;
                    v58 = objc_alloc((Class)v17[226]);
                    LODWORD(v59) = 1.0;
                    v34 = (MAAbstractNode *)objc_msgSend(v58, "initWithLabel:domain:weight:properties:", v94, v57, v93, v59);
                    -[MANode setIdentifier:](v34, "setIdentifier:", v18);
                    v60 = (uint64_t)v96;
                    if (!v96)
                    {
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#EdgeID%ld"), -[MANode identifier](v34, "identifier"));
                      v60 = objc_claimAutoreleasedReturnValue();
                    }
                    ++v18;
                    v96 = (id)v60;
                    objc_msgSend(v11, "objectForKey:", v60);
                    v61 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v61)
                    {
                      if (a7)
                      {
                        v63 = (void *)MEMORY[0x1E0CB35C8];
                        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Query string malformed, edge named '%@' has no matching definition."), v96);
LABEL_71:
                        v64 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v63, "errorWithDescription:", v64);
                        *a7 = (id)objc_claimAutoreleasedReturnValue();

                      }
LABEL_72:

                      v56 = 0;
                      v22 = v87;
                      v29 = v31;
                      goto LABEL_62;
                    }
                    v29 = v31;
                    objc_msgSend(v31, "addObject:", v34);
                    v57 = objc_msgSend(v95, "indexGreaterThanIndex:", v57);

                  }
LABEL_54:
                  objc_msgSend(v11, "setObject:forKey:", v29, v96);
                  v56 = 1;
                  v22 = v87;
LABEL_62:

                  goto LABEL_63;
                }
                break;
              }
              objc_msgSend(a1, "scanGraphConstraintString:error:", v86, a7);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = (void *)objc_opt_new();
              +[MAPath path](MAPath, "path");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v98 = 1;
              v99 = 1;
              memset(v97, 0, sizeof(v97));
              v29 = v37;
              if (objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", v97, v109, 16))
              {
                v79 = v39;
                v80 = v38;
                v40 = v29;
                v41 = (void *)**((_QWORD **)&v97[0] + 1);
                objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(\\(|\\[)([\\w\\d\\,\\-\\ \\:\\{\\'\\;\\}\\#\\%\\+\\$\\^\\/\\(\\)\\?\\=]+)(\\)|\\])"),
                  0,
                  a7);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v42)
                  goto LABEL_44;
                v43 = v42;
                objc_msgSend(v42, "matchesInString:options:range:", v41, 0, 0, objc_msgSend(v41, "length"));
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v44, "count") != 1)
                {
                  v11 = v82;
                  if (a7)
                  {
                    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDescription:", CFSTR("Query string malformed, constraintString should match exactly once."));
                    *a7 = (id)objc_claimAutoreleasedReturnValue();
                  }

                  goto LABEL_60;
                }
                objc_msgSend(v44, "firstObject");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v45, "numberOfRanges") != 4)
                {
                  if (a7)
                  {
                    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDescription:", CFSTR("Query string malformed, constraint result has wrong number of ranges."));
                    *a7 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  goto LABEL_40;
                }
                v46 = objc_msgSend(v45, "rangeAtIndex:", 0);
                objc_msgSend(v41, "substringWithRange:", v46, v47);
                v88 = objc_claimAutoreleasedReturnValue();
                v48 = objc_msgSend(a1, "scanGraphElementString:type:optionalName:label:optionalDomains:optionalProperties:error:", a7);
                v49 = (unint64_t)0;
                v50 = (unint64_t)0;
                v91 = 0;
                v51 = 0;
                v90 = (void *)v50;
                if (v48)
                {
                  if (v50 | v49)
                  {
                    v22 = v87;
                    v92 = (void *)v49;
                    if (v84)
                    {
                      v53 = (void *)MEMORY[0x1E0CB35C8];
                      v81 = v51;
                      v52 = (void *)v88;
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Query string malformed, element '%@' has no matching type."), v88);
                      v54 = (void *)objc_claimAutoreleasedReturnValue();
                      v55 = v53;
                      v22 = v87;
                      objc_msgSend(v55, "errorWithDescription:", v54);
                      *v84 = (id)objc_claimAutoreleasedReturnValue();

                      v51 = v81;
                    }
                    else
                    {
                      v52 = (void *)v88;
                    }
LABEL_39:

                    a7 = v84;
LABEL_40:

LABEL_44:
                    v11 = v82;
LABEL_60:
                    v29 = v40;

                    v56 = 0;
LABEL_61:
                    v17 = &off_1E83DD000;
                    goto LABEL_62;
                  }
                  v92 = 0;
                }
                else
                {
                  v92 = (void *)v49;
                }
                v22 = v87;
                v52 = (void *)v88;
                goto LABEL_39;
              }

              objc_msgSend(v78, "addObject:", v38);
              if ((objc_msgSend(v39, "isEmpty") & 1) == 0)
                objc_msgSend(v73, "addObject:", v39);

              v56 = 1;
              v11 = v82;
              goto LABEL_61;
            }
LABEL_73:
            v19 = v77 + 1;
          }
          while (v77 + 1 != v75);
          v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v110, 16);
        }
        while (v75);
      }

      if (v68)
      {
        if (objc_msgSend(v11, "count"))
          v65 = v11;
        else
          v65 = 0;
        *v68 = objc_retainAutorelease(v65);
      }
      v12 = v72;
      v13 = v73;
      if (v69)
      {
        if (objc_msgSend(v73, "count"))
          v66 = v73;
        else
          v66 = 0;
        *v69 = objc_retainAutorelease(v66);
      }
      LOBYTE(v56) = 1;
LABEL_88:
      v16 = v70;
      v14 = v71;
    }
    else if (a7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDescription:", CFSTR("Query string malformed, not matching any expression."));
      LOBYTE(v56) = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      LOBYTE(v56) = 0;
    }

  }
  else
  {
    LOBYTE(v56) = 0;
  }

  return v56;
}

+ (MAGraph)graphWithVisualString:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  id v8;
  id v9;
  void *v10;
  id v12;
  id v13;

  v6 = a3;
  v12 = 0;
  v13 = 0;
  v7 = objc_msgSend((id)objc_opt_class(), "scanMatchString:definitions:constraints:forCreation:error:", v6, &v13, &v12, 1, a4);

  v8 = v13;
  v9 = v12;
  v10 = 0;
  if (v7)
  {
    objc_msgSend(a1, "graphWithDefinitions:constraints:error:", v8, v9, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (MAGraph *)v10;
}

+ (BOOL)populateGraph:(id)a3 withDefinitions:(id)a4 constraints:(id)a5 error:(id *)a6
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  id v15;
  BOOL v16;
  BOOL v17;
  id obj;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v8 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 1;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = a5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v30;
    v11 = MEMORY[0x1E0C809B0];
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v25[0] = v11;
        v25[1] = 3221225472;
        v25[2] = __66__MAGraph_Query__populateGraph_withDefinitions_constraints_error___block_invoke;
        v25[3] = &unk_1E83E61E8;
        v14 = v8;
        v26 = v14;
        v28 = &v33;
        v15 = v20;
        v27 = v15;
        objc_msgSend(v13, "enumerateWithBlock:", v25);
        if (!*((_BYTE *)v34 + 24))
        {

          goto LABEL_12;
        }
        v21[0] = v11;
        v21[1] = 3221225472;
        v21[2] = __66__MAGraph_Query__populateGraph_withDefinitions_constraints_error___block_invoke_2;
        v21[3] = &unk_1E83E61E8;
        v22 = v14;
        v24 = &v33;
        v23 = v15;
        objc_msgSend(v13, "enumerateWithBlock:", v21);
        v16 = *((_BYTE *)v34 + 24) == 0;

        if (v16)
          goto LABEL_12;
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_12:

  v17 = *((_BYTE *)v34 + 24) != 0;
  _Block_object_dispose(&v33, 8);

  return v17;
}

+ (MAGraph)graphWithDefinitions:(id)a3 constraints:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "graph");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(a1, "populateGraph:withDefinitions:constraints:error:", v10, v9, v8, a5);

  if ((_DWORD)a5)
    v11 = v10;
  else
    v11 = 0;

  return (MAGraph *)v11;
}

void __66__MAGraph_Query__populateGraph_withDefinitions_constraints_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  void *v20;
  _BYTE *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v6 = (void *)a1[4];
    objc_msgSend(a2, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count"))
    {
      v21 = a4;
      v22 = v8;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v24 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            v15 = (void *)a1[5];
            objc_msgSend(v14, "label", v21);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v14, "domain");
            objc_msgSend(v14, "propertyDictionary");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v19) = 1.0;
            objc_msgSend(v15, "addUniqueNodeWithLabel:domain:weight:properties:didCreate:", v16, v17, v18, 0, v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v20)
            {
              *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
              *v21 = 1;
              goto LABEL_13;
            }

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v11)
            continue;
          break;
        }
      }
LABEL_13:

      v8 = v22;
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
      *a4 = 1;
    }

  }
}

void __66__MAGraph_Query__populateGraph_withDefinitions_constraints_error___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  _QWORD *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  double v45;
  void *v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id obj;
  uint64_t v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
    goto LABEL_44;
  v7 = (void *)a1[4];
  objc_msgSend(v5, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sourceNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetNode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "count"))
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    *a4 = 1;
    goto LABEL_43;
  }
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
  if (!v13)
    goto LABEL_42;
  v14 = *(_QWORD *)v74;
  v53 = v9;
  v54 = v6;
  v51 = v10;
  v52 = v12;
  v48 = *(_QWORD *)v74;
  do
  {
    v15 = 0;
    v49 = v13;
    do
    {
      if (*(_QWORD *)v74 != v14)
        objc_enumerationMutation(v12);
      v50 = v15;
      v16 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v15);
      v17 = (void *)a1[4];
      objc_msgSend(v10, "label");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", v18);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v19, "count"))
      {
        *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
        *a4 = 1;
        goto LABEL_41;
      }
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      v19 = v19;
      v60 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
      if (!v60)
        goto LABEL_35;
      v59 = *(_QWORD *)v70;
      v55 = v19;
      v56 = v11;
      do
      {
        for (i = 0; i != v60; ++i)
        {
          if (*(_QWORD *)v70 != v59)
            objc_enumerationMutation(v19);
          v21 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
          v22 = (void *)a1[5];
          objc_msgSend(v21, "label");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v21, "domain");
          objc_msgSend(v21, "propertyDictionary");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "nodesForLabel:domain:properties:", v23, v24, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v26, "count") != 1)
          {
            *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
            *a4 = 1;

LABEL_40:
LABEL_41:
            v10 = v51;

            v9 = v53;
            v6 = v54;
            v12 = v52;
            goto LABEL_42;
          }
          objc_msgSend(v26, "anyObject");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (void *)a1[4];
          objc_msgSend(v11, "label");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKey:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v29, "count"))
          {
            *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
            v47 = 1;
            *a4 = 1;
            goto LABEL_32;
          }
          v67 = 0u;
          v68 = 0u;
          v65 = 0u;
          v66 = 0u;
          obj = v29;
          v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
          if (!v30)
          {
            v47 = 0;
            goto LABEL_31;
          }
          v31 = v30;
          v63 = *(_QWORD *)v66;
          v57 = v29;
          v58 = i;
          while (2)
          {
            v32 = 0;
            v33 = v26;
            do
            {
              if (*(_QWORD *)v66 != v63)
                objc_enumerationMutation(obj);
              v34 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v32);
              v35 = (void *)a1[5];
              objc_msgSend(v34, "label");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v34, "domain");
              objc_msgSend(v34, "propertyDictionary");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "nodesForLabel:domain:properties:", v36, v37, v38);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v26, "count") != 1)
              {
                *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
                v47 = 1;
                *a4 = 1;
LABEL_30:
                v19 = v55;
                v11 = v56;
                v29 = v57;
                i = v58;
                goto LABEL_31;
              }
              objc_msgSend(v26, "anyObject");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = a1;
              v41 = (void *)a1[5];
              objc_msgSend(v16, "label");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = objc_msgSend(v16, "domain");
              objc_msgSend(v16, "propertyDictionary");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v45) = 1.0;
              objc_msgSend(v41, "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:weight:properties:", v42, v64, v39, v43, v44, v45);
              v46 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v46)
              {
                a1 = v40;
                *(_BYTE *)(*(_QWORD *)(v40[6] + 8) + 24) = 0;
                v47 = 1;
                *a4 = 1;

                goto LABEL_30;
              }

              ++v32;
              v33 = v26;
              a1 = v40;
            }
            while (v31 != v32);
            v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
            v47 = 0;
            v19 = v55;
            v11 = v56;
            v29 = v57;
            i = v58;
            if (v31)
              continue;
            break;
          }
LABEL_31:

LABEL_32:
          if (v47)
            goto LABEL_40;
        }
        v60 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
      }
      while (v60);
LABEL_35:

      v15 = v50 + 1;
      v9 = v53;
      v6 = v54;
      v10 = v51;
      v12 = v52;
      v14 = v48;
    }
    while (v50 + 1 != v49);
    v13 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
  }
  while (v13);
LABEL_42:

LABEL_43:
LABEL_44:

}

- (id)shortestPathFromNode:(id)a3 toNode:(id)a4 directed:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  int v18;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD *v28;
  uint64_t *v29;
  uint64_t *v30;
  BOOL v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _QWORD v44[4];
  _QWORD aBlock[4];
  id v46;
  id v47;
  id v48;
  id v49;
  BOOL v50;

  v5 = a5;
  v7 = a3;
  v24 = a4;
  +[MAPath path](MAPath, "path");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  objc_msgSend(v8, "setObject:forKey:", &unk_1E83F60E8, v10);
  if (v5)
    v11 = 2;
  else
    v11 = 3;
  v21 = v10;
  while ((objc_msgSend(v10, "isEqual:", v24) & 1) == 0)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__MAGraph_Traversal__shortestPathFromNode_toNode_directed___block_invoke;
    aBlock[3] = &unk_1E83E6300;
    v12 = v23;
    v50 = v5;
    v46 = v12;
    v47 = v10;
    v13 = v9;
    v48 = v13;
    v49 = v8;
    v14 = v10;
    v15 = _Block_copy(aBlock);
    objc_msgSend(v14, "enumerateEdgesOfType:usingBlock:", v11, v15);
    objc_msgSend(v13, "firstObject");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v13, "removeObject:", v10);
    else
      v20 = v22;

    if (!v10)
      goto LABEL_17;
  }
  v16 = v24;

  do
  {
    if (!v16)
      break;
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x2020000000;
    v44[3] = 0;
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__5933;
    v42 = __Block_byref_object_dispose__5934;
    v43 = 0;
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__5933;
    v36 = __Block_byref_object_dispose__5934;
    v37 = 0;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __59__MAGraph_Traversal__shortestPathFromNode_toNode_directed___block_invoke_5;
    v25[3] = &unk_1E83E6350;
    v17 = v16;
    v26 = v17;
    v27 = v8;
    v28 = v44;
    v29 = &v38;
    v30 = &v32;
    v31 = v5;
    objc_msgSend(v17, "enumerateNeighborNodesUsingBlock:", v25);
    if (v33[5])
      objc_msgSend(v22, "addFirstEdge:");
    v16 = (id)v39[5];

    v18 = objc_msgSend(v16, "isEqual:", v21);
    _Block_object_dispose(&v32, 8);

    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(v44, 8);
  }
  while (!v18);
  v20 = v22;

LABEL_17:
  return v20;
}

- (void)depthFirstSearchFromNode:(id)a3 directed:(BOOL)a4 usingBlock:(id)a5
{
  id v7;
  uint64_t (**v8)(id, void *, _BYTE *);
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  int v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  char v21;

  v7 = a3;
  v8 = (uint64_t (**)(id, void *, _BYTE *))a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v9, "addObject:", v7);
  if (objc_msgSend(v9, "count"))
  {
    v11 = MEMORY[0x1E0C809B0];
    while (1)
    {
      objc_msgSend(v9, "lastObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v9, "count");
      if ((objc_msgSend(v10, "containsObject:", v12) & 1) != 0)
        goto LABEL_9;
      v14 = v8[2](v8, v12, &v21);
      if (v21)
      {

        goto LABEL_13;
      }
      v15 = v14;
      objc_msgSend(v10, "addObject:", v12);
      if (v15)
        break;
LABEL_10:

      if (!objc_msgSend(v9, "count"))
        goto LABEL_13;
    }
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __67__MAGraph_Traversal__depthFirstSearchFromNode_directed_usingBlock___block_invoke;
    v19[3] = &unk_1E83E6378;
    v16 = v9;
    v20 = v16;
    objc_msgSend(v12, "enumerateOutEdgesUsingBlock:", v19);
    if (!a4)
    {
      v17[0] = v11;
      v17[1] = 3221225472;
      v17[2] = __67__MAGraph_Traversal__depthFirstSearchFromNode_directed_usingBlock___block_invoke_2;
      v17[3] = &unk_1E83E6378;
      v18 = v16;
      objc_msgSend(v12, "enumerateInEdgesUsingBlock:", v17);

    }
LABEL_9:
    objc_msgSend(v9, "removeObjectAtIndex:", v13 - 1);
    goto LABEL_10;
  }
LABEL_13:

}

- (void)breadthFirstSearchFromNode:(id)a3 directed:(BOOL)a4 usingBlock:(id)a5
{
  id v7;
  uint64_t (**v8)(id, void *, _BYTE *);
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  char v20;

  v7 = a3;
  v8 = (uint64_t (**)(id, void *, _BYTE *))a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v9, "addObject:", v7);
  if (objc_msgSend(v9, "count"))
  {
    v11 = MEMORY[0x1E0C809B0];
    while (1)
    {
      objc_msgSend(v9, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "containsObject:", v12) & 1) != 0)
        goto LABEL_9;
      v13 = v8[2](v8, v12, &v20);
      if (v20)
      {

        goto LABEL_13;
      }
      v14 = v13;
      objc_msgSend(v10, "addObject:", v12);
      if (v14)
        break;
LABEL_10:

      if (!objc_msgSend(v9, "count"))
        goto LABEL_13;
    }
    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = __69__MAGraph_Traversal__breadthFirstSearchFromNode_directed_usingBlock___block_invoke;
    v18[3] = &unk_1E83E6378;
    v15 = v9;
    v19 = v15;
    objc_msgSend(v12, "enumerateOutEdgesUsingBlock:", v18);
    if (!a4)
    {
      v16[0] = v11;
      v16[1] = 3221225472;
      v16[2] = __69__MAGraph_Traversal__breadthFirstSearchFromNode_directed_usingBlock___block_invoke_2;
      v16[3] = &unk_1E83E6378;
      v17 = v15;
      objc_msgSend(v12, "enumerateInEdgesUsingBlock:", v16);

    }
LABEL_9:
    objc_msgSend(v9, "removeObject:", v12);
    goto LABEL_10;
  }
LABEL_13:

}

void __69__MAGraph_Traversal__breadthFirstSearchFromNode_directed_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "targetNode");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __69__MAGraph_Traversal__breadthFirstSearchFromNode_directed_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "sourceNode");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __67__MAGraph_Traversal__depthFirstSearchFromNode_directed_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "targetNode");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __67__MAGraph_Traversal__depthFirstSearchFromNode_directed_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "sourceNode");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __59__MAGraph_Traversal__shortestPathFromNode_toNode_directed___block_invoke(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  float v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v19);
  v4 = v19;
  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v19);
    objc_msgSend(v19, "targetNode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!*(_BYTE *)(a1 + 64) && objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 40)))
    {
      objc_msgSend(v19, "sourceNode");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    if ((objc_msgSend(*(id *)(a1 + 48), "containsObject:", v6) & 1) == 0)
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
    objc_msgSend(*(id *)(a1 + 56), "objectForKey:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;
    objc_msgSend(v19, "weight");
    v12 = v10 + v11;

    objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v14;

    if (v12 < v15
      || (objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v6),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v16,
          !v16))
    {
      v17 = *(void **)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKey:", v18, v6);

    }
    v4 = v19;
  }

}

void __59__MAGraph_Traversal__shortestPathFromNode_toNode_directed___block_invoke_5(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];

  v4 = a2;
  if (*(id *)(a1 + 32) != v4)
  {
    v15 = v4;
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v15;
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v15);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "doubleValue");
      v8 = v7;

      v4 = v15;
      if (v8 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
        || !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      {
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = 0;

        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8;
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
        v11 = (void *)MEMORY[0x1E0C99E20];
        objc_msgSend(*(id *)(a1 + 32), "edgesFromNode:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setWithSet:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!*(_BYTE *)(a1 + 72))
        {
          objc_msgSend(*(id *)(a1 + 32), "edgesTowardNode:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "unionSet:", v14);

        }
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __59__MAGraph_Traversal__shortestPathFromNode_toNode_directed___block_invoke_2;
        v16[3] = &unk_1E83E6328;
        v16[4] = *(_QWORD *)(a1 + 64);
        objc_msgSend(v13, "enumerateObjectsUsingBlock:", v16);

        v4 = v15;
      }
    }
  }

}

void __59__MAGraph_Traversal__shortestPathFromNode_toNode_directed___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void **v5;
  uint64_t v6;
  float v7;
  float v8;
  float v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(_QWORD *)(v4 + 40);
  v5 = (void **)(v4 + 40);
  v14 = v3;
  if (v6)
  {
    objc_msgSend(v3, "weight");
    v8 = v7;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "weight");
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = v14;
    if ((float)(v8 - v9) >= 0.0)
      v11 = *(void **)(v10 + 40);
    v5 = (void **)(v10 + 40);
  }
  else
  {
    v11 = v3;
  }
  v12 = v11;
  v13 = *v5;
  *v5 = v12;

}

@end
