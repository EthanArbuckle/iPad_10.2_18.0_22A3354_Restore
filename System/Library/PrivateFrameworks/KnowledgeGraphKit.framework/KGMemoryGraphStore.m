@implementation KGMemoryGraphStore

- (id)initForSubclasses
{
  KGMemoryGraphStore *v2;
  uint64_t v3;
  NSMutableDictionary *memoryNodeByIdentifier;
  uint64_t v5;
  NSMutableDictionary *nodeIdentifiersByLabel;
  uint64_t v7;
  NSMutableDictionary *memoryEdgeByIdentifier;
  uint64_t v9;
  NSMutableDictionary *edgeIdentifiersByLabel;
  KGMutableDirectedBinaryAdjacency *v11;
  KGMutableDirectedBinaryAdjacency *edgeIdentifiersBySourceNodeIdentifier;
  KGMutableDirectedBinaryAdjacency *v13;
  KGMutableDirectedBinaryAdjacency *edgeIdentifiersByTargetNodeIdentifier;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)KGMemoryGraphStore;
  v2 = -[KGMemoryGraphStore init](&v16, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    memoryNodeByIdentifier = v2->_memoryNodeByIdentifier;
    v2->_memoryNodeByIdentifier = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    nodeIdentifiersByLabel = v2->_nodeIdentifiersByLabel;
    v2->_nodeIdentifiersByLabel = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    memoryEdgeByIdentifier = v2->_memoryEdgeByIdentifier;
    v2->_memoryEdgeByIdentifier = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    edgeIdentifiersByLabel = v2->_edgeIdentifiersByLabel;
    v2->_edgeIdentifiersByLabel = (NSMutableDictionary *)v9;

    v2->_nextNodeIdentifier = 1;
    v2->_nextEdgeIdentifier = 1;
    v2->_lock._os_unfair_lock_opaque = 0;
    v11 = objc_alloc_init(KGMutableDirectedBinaryAdjacency);
    edgeIdentifiersBySourceNodeIdentifier = v2->_edgeIdentifiersBySourceNodeIdentifier;
    v2->_edgeIdentifiersBySourceNodeIdentifier = v11;

    v13 = objc_alloc_init(KGMutableDirectedBinaryAdjacency);
    edgeIdentifiersByTargetNodeIdentifier = v2->_edgeIdentifiersByTargetNodeIdentifier;
    v2->_edgeIdentifiersByTargetNodeIdentifier = v13;

  }
  return v2;
}

- (KGMemoryGraphStore)init
{
  KGMemoryGraphStore *v2;
  uint64_t v3;
  NSUUID *graphIdentifier;

  v2 = -[KGMemoryGraphStore initForSubclasses](self, "initForSubclasses");
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    graphIdentifier = v2->_graphIdentifier;
    v2->_graphIdentifier = (NSUUID *)v3;

  }
  return v2;
}

- (NSUUID)graphIdentifier
{
  NSUUID *graphIdentifier;
  NSUUID *v4;
  NSUUID *v5;

  graphIdentifier = self->_graphIdentifier;
  if (!graphIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v5 = self->_graphIdentifier;
    self->_graphIdentifier = v4;

    graphIdentifier = self->_graphIdentifier;
  }
  return graphIdentifier;
}

- (BOOL)noFatalError
{
  return 1;
}

- (BOOL)addEdges:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  unint64_t nextEdgeIdentifier;
  NSMutableDictionary *memoryNodeByIdentifier;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  KGMemoryEdge *v19;
  void *v20;
  KGMemoryEdge *v21;
  NSMutableDictionary *memoryEdgeByIdentifier;
  void *v23;
  KGMutableDirectedBinaryAdjacency *edgeIdentifiersBySourceNodeIdentifier;
  void *v25;
  KGMutableDirectedBinaryAdjacency *edgeIdentifiersByTargetNodeIdentifier;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  KGMutableElementIdentifierSet *v34;
  id obj;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v5;
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v38)
  {
    v37 = *(_QWORD *)v49;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v49 != v37)
          objc_enumerationMutation(obj);
        v43 = v6;
        v7 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v6);
        nextEdgeIdentifier = self->_nextEdgeIdentifier;
        self->_nextEdgeIdentifier = nextEdgeIdentifier + 1;
        objc_msgSend(v7, "labels");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        memoryNodeByIdentifier = self->_memoryNodeByIdentifier;
        v10 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v7, "sourceNode");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "identifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](memoryNodeByIdentifier, "objectForKeyedSubscript:", v12);
        v13 = objc_claimAutoreleasedReturnValue();

        v14 = self->_memoryNodeByIdentifier;
        v15 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v7, "targetNode");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "identifier"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v17);
        v18 = objc_claimAutoreleasedReturnValue();

        v19 = [KGMemoryEdge alloc];
        v42 = v7;
        objc_msgSend(v7, "properties");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)v18;
        v41 = (void *)v13;
        v21 = -[KGMemoryEdge initWithIdentifier:labels:properties:sourceNode:targetNode:](v19, "initWithIdentifier:labels:properties:sourceNode:targetNode:", nextEdgeIdentifier, v39, v20, v13, v18);

        memoryEdgeByIdentifier = self->_memoryEdgeByIdentifier;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", nextEdgeIdentifier);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](memoryEdgeByIdentifier, "setObject:forKeyedSubscript:", v21, v23);

        edgeIdentifiersBySourceNodeIdentifier = self->_edgeIdentifiersBySourceNodeIdentifier;
        -[KGMemoryEdge sourceNode](v21, "sourceNode");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[KGMutableDirectedBinaryAdjacency insertSource:target:](edgeIdentifiersBySourceNodeIdentifier, "insertSource:target:", objc_msgSend(v25, "identifier"), nextEdgeIdentifier);

        edgeIdentifiersByTargetNodeIdentifier = self->_edgeIdentifiersByTargetNodeIdentifier;
        -[KGMemoryEdge targetNode](v21, "targetNode");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[KGMutableDirectedBinaryAdjacency insertSource:target:](edgeIdentifiersByTargetNodeIdentifier, "insertSource:target:", objc_msgSend(v27, "identifier"), nextEdgeIdentifier);

        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v28 = v39;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v45;
          do
          {
            for (i = 0; i != v30; ++i)
            {
              if (*(_QWORD *)v45 != v31)
                objc_enumerationMutation(v28);
              v33 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
              -[NSMutableDictionary objectForKeyedSubscript:](self->_edgeIdentifiersByLabel, "objectForKeyedSubscript:", v33);
              v34 = (KGMutableElementIdentifierSet *)objc_claimAutoreleasedReturnValue();
              if (!v34)
              {
                v34 = objc_alloc_init(KGMutableElementIdentifierSet);
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->_edgeIdentifiersByLabel, "setObject:forKeyedSubscript:", v34, v33);
              }
              -[KGMutableElementIdentifierSet addIdentifier:](v34, "addIdentifier:", nextEdgeIdentifier);

            }
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          }
          while (v30);
        }

        objc_msgSend(v42, "resolveIdentifier:", -[KGMemoryEdge identifier](v21, "identifier"));
        v6 = v43 + 1;
      }
      while (v43 + 1 != v38);
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v38);
  }

  os_unfair_lock_unlock(&self->_lock);
  return 1;
}

- (id)insertEdgeWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5 sourceNodeIdentifier:(unint64_t)a6 targetNodeIdentifier:(unint64_t)a7 error:(id *)a8
{
  id v13;
  id v14;
  NSMutableDictionary *memoryNodeByIdentifier;
  void *v16;
  uint64_t v17;
  NSMutableDictionary *v18;
  void *v19;
  uint64_t v20;
  KGMemoryEdge *v21;
  NSMutableDictionary *memoryEdgeByIdentifier;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  KGMutableElementIdentifierSet *v30;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  os_unfair_lock_lock(&self->_lock);
  memoryNodeByIdentifier = self->_memoryNodeByIdentifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](memoryNodeByIdentifier, "objectForKeyedSubscript:", v16);
  v17 = objc_claimAutoreleasedReturnValue();

  v18 = self->_memoryNodeByIdentifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", v19);
  v20 = objc_claimAutoreleasedReturnValue();

  v32 = (void *)v20;
  v33 = (void *)v17;
  v21 = -[KGMemoryEdge initWithIdentifier:labels:properties:sourceNode:targetNode:]([KGMemoryEdge alloc], "initWithIdentifier:labels:properties:sourceNode:targetNode:", a3, v13, v14, v17, v20);
  -[KGMutableDirectedBinaryAdjacency insertSource:target:](self->_edgeIdentifiersBySourceNodeIdentifier, "insertSource:target:", a6, a3);
  -[KGMutableDirectedBinaryAdjacency insertSource:target:](self->_edgeIdentifiersByTargetNodeIdentifier, "insertSource:target:", a7, a3);
  memoryEdgeByIdentifier = self->_memoryEdgeByIdentifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](memoryEdgeByIdentifier, "setObject:forKeyedSubscript:", v21, v23);

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v24 = v13;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v35 != v27)
          objc_enumerationMutation(v24);
        v29 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_edgeIdentifiersByLabel, "objectForKeyedSubscript:", v29);
        v30 = (KGMutableElementIdentifierSet *)objc_claimAutoreleasedReturnValue();
        if (!v30)
        {
          v30 = objc_alloc_init(KGMutableElementIdentifierSet);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_edgeIdentifiersByLabel, "setObject:forKeyedSubscript:", v30, v29);
        }
        -[KGMutableElementIdentifierSet addIdentifier:](v30, "addIdentifier:", a3);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v26);
  }

  self->_nextEdgeIdentifier = a3 + 1;
  os_unfair_lock_unlock(&self->_lock);

  return v21;
}

- (BOOL)addNodes:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t i;
  void *v7;
  unint64_t nextNodeIdentifier;
  void *v9;
  KGMemoryNode *v10;
  void *v11;
  uint64_t v12;
  NSMutableDictionary *memoryNodeByIdentifier;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  KGMutableElementIdentifierSet *v21;
  os_unfair_lock_t lock;
  id obj;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v5;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v34 != v25)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        nextNodeIdentifier = self->_nextNodeIdentifier;
        self->_nextNodeIdentifier = nextNodeIdentifier + 1;
        objc_msgSend(v7, "labels", lock);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = [KGMemoryNode alloc];
        v28 = v7;
        objc_msgSend(v7, "properties");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[KGMemoryNode initWithIdentifier:labels:properties:](v10, "initWithIdentifier:labels:properties:", nextNodeIdentifier, v9, v11);

        memoryNodeByIdentifier = self->_memoryNodeByIdentifier;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", nextNodeIdentifier);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)v12;
        -[NSMutableDictionary setObject:forKeyedSubscript:](memoryNodeByIdentifier, "setObject:forKeyedSubscript:", v12, v14);

        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v15 = v9;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v30;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v30 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
              -[NSMutableDictionary objectForKeyedSubscript:](self->_nodeIdentifiersByLabel, "objectForKeyedSubscript:", v20);
              v21 = (KGMutableElementIdentifierSet *)objc_claimAutoreleasedReturnValue();
              if (!v21)
              {
                v21 = objc_alloc_init(KGMutableElementIdentifierSet);
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->_nodeIdentifiersByLabel, "setObject:forKeyedSubscript:", v21, v20);
              }
              -[KGMutableElementIdentifierSet addIdentifier:](v21, "addIdentifier:", nextNodeIdentifier);

            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          }
          while (v17);
        }

        objc_msgSend(v28, "resolveIdentifier:", nextNodeIdentifier);
      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v26);
  }

  os_unfair_lock_unlock(lock);
  return 1;
}

- (id)insertNodeWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  KGMemoryNode *v11;
  NSMutableDictionary *memoryNodeByIdentifier;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  KGMutableElementIdentifierSet *v20;
  os_unfair_lock_t lock;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v11 = -[KGMemoryNode initWithIdentifier:labels:properties:]([KGMemoryNode alloc], "initWithIdentifier:labels:properties:", a3, v9, v10);
  memoryNodeByIdentifier = self->_memoryNodeByIdentifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](memoryNodeByIdentifier, "setObject:forKeyedSubscript:", v11, v13);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = v9;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_nodeIdentifiersByLabel, "objectForKeyedSubscript:", v19, lock);
        v20 = (KGMutableElementIdentifierSet *)objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          v20 = objc_alloc_init(KGMutableElementIdentifierSet);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_nodeIdentifiersByLabel, "setObject:forKeyedSubscript:", v20, v19);
        }
        -[KGMutableElementIdentifierSet addIdentifier:](v20, "addIdentifier:", a3);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v16);
  }

  self->_nextNodeIdentifier = a3 + 1;
  os_unfair_lock_unlock(lock);

  return v11;
}

- (id)_lock_snapshotEdgeForIdentifier:(unint64_t)a3 reusableNode:(id)a4 entityFactory:(id)a5
{
  id v8;
  id v9;
  NSMutableDictionary *memoryEdgeByIdentifier;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;

  v8 = a4;
  v9 = a5;
  os_unfair_lock_assert_owner(&self->_lock);
  memoryEdgeByIdentifier = self->_memoryEdgeByIdentifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](memoryEdgeByIdentifier, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "sourceNode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "targetNode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v8, "identifier");
    if (v15 != objc_msgSend(v13, "identifier") || (v16 = v8) == 0)
    {
      v17 = objc_msgSend(v13, "identifier");
      objc_msgSend(v13, "labels");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "properties");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "nodeWithIdentifier:labels:properties:", v17, v18, v19);
      v16 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (v15 != objc_msgSend(v14, "identifier") || (v20 = v8) == 0)
    {
      v21 = objc_msgSend(v14, "identifier");
      objc_msgSend(v14, "labels");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "properties");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "nodeWithIdentifier:labels:properties:", v21, v22, v23);
      v20 = (id)objc_claimAutoreleasedReturnValue();

    }
    v24 = objc_msgSend(v12, "identifier");
    objc_msgSend(v12, "labels");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "properties");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "edgeWithIdentifier:labels:properties:sourceNode:targetNode:", v24, v25, v26, v16, v20);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (id)edgeForIdentifier:(unint64_t)a3 entityFactory:(id)a4 error:(id *)a5
{
  os_unfair_lock_s *p_lock;
  id v8;
  void *v9;

  p_lock = &self->_lock;
  v8 = a4;
  os_unfair_lock_lock(p_lock);
  -[KGMemoryGraphStore _lock_snapshotEdgeForIdentifier:reusableNode:entityFactory:](self, "_lock_snapshotEdgeForIdentifier:reusableNode:entityFactory:", a3, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (id)_lock_arrayOfNodesWithIdentifiers:(id)a3 entityFactory:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v7 = a3;
  v8 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3350;
  v19 = __Block_byref_object_dispose__3351;
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__KGMemoryGraphStore__lock_arrayOfNodesWithIdentifiers_entityFactory_error___block_invoke;
  v12[3] = &unk_1E83E4898;
  v12[4] = self;
  v9 = v8;
  v13 = v9;
  v14 = &v15;
  objc_msgSend(v7, "enumerateIdentifiersWithBlock:", v12);
  v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (id)_lock_arrayOfEdgesWithIdentifiers:(id)a3 entityFactory:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v7 = a3;
  v8 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3350;
  v19 = __Block_byref_object_dispose__3351;
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__KGMemoryGraphStore__lock_arrayOfEdgesWithIdentifiers_entityFactory_error___block_invoke;
  v12[3] = &unk_1E83E4898;
  v12[4] = self;
  v9 = v8;
  v13 = v9;
  v14 = &v15;
  objc_msgSend(v7, "enumerateIdentifiersWithBlock:", v12);
  v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (id)arrayOfEdgesWithIdentifiers:(id)a3 entityFactory:(id)a4 error:(id *)a5
{
  os_unfair_lock_s *p_lock;
  id v9;
  id v10;
  void *v11;

  p_lock = &self->_lock;
  v9 = a4;
  v10 = a3;
  os_unfair_lock_lock(p_lock);
  -[KGMemoryGraphStore _lock_arrayOfEdgesWithIdentifiers:entityFactory:error:](self, "_lock_arrayOfEdgesWithIdentifiers:entityFactory:error:", v10, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (id)_lock_intersectionOfEdgesWithLabels:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  KGElementIdentifierSet *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v6)
  {
LABEL_15:

LABEL_16:
    v8 = objc_alloc_init(KGElementIdentifierSet);
    goto LABEL_17;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v15;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v15 != v9)
        objc_enumerationMutation(v5);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_edgeIdentifiersByLabel, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {

        goto LABEL_15;
      }
      v12 = v11;
      if (v8)
        -[KGElementIdentifierSet intersectWithIdentifierSet:](v8, "intersectWithIdentifierSet:", v11);
      else
        v8 = (KGElementIdentifierSet *)objc_msgSend(v11, "mutableCopy");

    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
      continue;
    break;
  }

  if (!v8)
    goto LABEL_16;
LABEL_17:

  return v8;
}

- (id)_lock_unionOfEdgesWithLabels:(id)a3
{
  id v4;
  KGMutableElementIdentifierSet *v5;
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
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = objc_alloc_init(KGMutableElementIdentifierSet);
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
        -[NSMutableDictionary objectForKeyedSubscript:](self->_edgeIdentifiersByLabel, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          -[KGMutableElementIdentifierSet unionWithIdentifierSet:](v5, "unionWithIdentifierSet:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_lock_allEdgeIdentifiers
{
  void *v3;
  void *v4;

  os_unfair_lock_assert_owner(&self->_lock);
  -[NSMutableDictionary allKeys](self->_edgeIdentifiersByLabel, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGMemoryGraphStore _lock_unionOfEdgesWithLabels:](self, "_lock_unionOfEdgesWithLabels:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_lock_edgeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  KGMutableElementIdentifierSet *v17;
  KGMutableElementIdentifierSet *v18;
  id v19;
  KGMutableElementIdentifierSet *v20;
  KGMutableElementIdentifierSet *v21;
  _QWORD v23[5];
  id v24;
  KGMutableElementIdentifierSet *v25;

  v7 = a3;
  v8 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend(v7, "requiredLabels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    objc_msgSend(v7, "requiredLabels");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[KGMemoryGraphStore _lock_intersectionOfEdgesWithLabels:](self, "_lock_intersectionOfEdgesWithLabels:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
LABEL_3:
      objc_msgSend(v12, "identifierSetByIntersectingIdentifierSet:", v8);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v13)
        v15 = (void *)v13;
      else
        v15 = v8;
      v16 = v15;

      v12 = v16;
    }
  }
  else
  {
    v12 = 0;
    if (v8)
      goto LABEL_3;
  }
  if (!v12)
  {
    -[KGMemoryGraphStore _lock_allEdgeIdentifiers](self, "_lock_allEdgeIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = objc_alloc_init(KGMutableElementIdentifierSet);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __88__KGMemoryGraphStore__lock_edgeIdentifiersMatchingFilter_intersectingIdentifiers_error___block_invoke;
  v23[3] = &unk_1E83E4848;
  v23[4] = self;
  v24 = v7;
  v18 = v17;
  v25 = v18;
  v19 = v7;
  objc_msgSend(v12, "enumerateIdentifiersWithBlock:", v23);
  v20 = v25;
  v21 = v18;

  return v21;
}

- (id)edgeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4 error:(id *)a5
{
  os_unfair_lock_s *p_lock;
  id v9;
  id v10;
  void *v11;

  p_lock = &self->_lock;
  v9 = a4;
  v10 = a3;
  os_unfair_lock_lock(p_lock);
  -[KGMemoryGraphStore _lock_edgeIdentifiersMatchingFilter:intersectingIdentifiers:error:](self, "_lock_edgeIdentifiersMatchingFilter:intersectingIdentifiers:error:", v10, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (id)_lock_snapshotNodeForIdentifier:(unint64_t)a3 entityFactory:(id)a4
{
  id v6;
  NSMutableDictionary *memoryNodeByIdentifier;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  memoryNodeByIdentifier = self->_memoryNodeByIdentifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](memoryNodeByIdentifier, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_msgSend(v9, "identifier");
    objc_msgSend(v9, "labels");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "properties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nodeWithIdentifier:labels:properties:", v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)nodeForIdentifier:(unint64_t)a3 entityFactory:(id)a4 error:(id *)a5
{
  os_unfair_lock_s *p_lock;
  id v8;
  void *v9;

  p_lock = &self->_lock;
  v8 = a4;
  os_unfair_lock_lock(p_lock);
  -[KGMemoryGraphStore _lock_snapshotNodeForIdentifier:entityFactory:](self, "_lock_snapshotNodeForIdentifier:entityFactory:", a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (id)arrayOfNodesWithIdentifiers:(id)a3 entityFactory:(id)a4 error:(id *)a5
{
  os_unfair_lock_s *p_lock;
  id v9;
  id v10;
  void *v11;

  p_lock = &self->_lock;
  v9 = a4;
  v10 = a3;
  os_unfair_lock_lock(p_lock);
  -[KGMemoryGraphStore _lock_arrayOfNodesWithIdentifiers:entityFactory:error:](self, "_lock_arrayOfNodesWithIdentifiers:entityFactory:error:", v10, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (id)_lock_intersectionOfNodesWithLabels:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  KGElementIdentifierSet *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v6)
  {
LABEL_15:

LABEL_16:
    v8 = objc_alloc_init(KGElementIdentifierSet);
    goto LABEL_17;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v15;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v15 != v9)
        objc_enumerationMutation(v5);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_nodeIdentifiersByLabel, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {

        goto LABEL_15;
      }
      v12 = v11;
      if (v8)
        -[KGElementIdentifierSet intersectWithIdentifierSet:](v8, "intersectWithIdentifierSet:", v11);
      else
        v8 = (KGElementIdentifierSet *)objc_msgSend(v11, "mutableCopy");

    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
      continue;
    break;
  }

  if (!v8)
    goto LABEL_16;
LABEL_17:

  return v8;
}

- (id)_lock_unionOfNodesWithLabels:(id)a3
{
  id v4;
  KGMutableElementIdentifierSet *v5;
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
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = objc_alloc_init(KGMutableElementIdentifierSet);
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
        -[NSMutableDictionary objectForKeyedSubscript:](self->_nodeIdentifiersByLabel, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          -[KGMutableElementIdentifierSet unionWithIdentifierSet:](v5, "unionWithIdentifierSet:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_lock_allNodeIdentifiers
{
  void *v3;
  void *v4;

  os_unfair_lock_assert_owner(&self->_lock);
  -[NSMutableDictionary allKeys](self->_nodeIdentifiersByLabel, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGMemoryGraphStore _lock_unionOfNodesWithLabels:](self, "_lock_unionOfNodesWithLabels:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)nodeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  os_unfair_lock_s *p_lock;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  KGMutableElementIdentifierSet *v18;
  KGMutableElementIdentifierSet *v19;
  id v20;
  KGMutableElementIdentifierSet *v21;
  KGMutableElementIdentifierSet *v22;
  _QWORD v24[5];
  id v25;
  KGMutableElementIdentifierSet *v26;

  v7 = a3;
  v8 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v7, "requiredLabels");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    objc_msgSend(v7, "requiredLabels");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[KGMemoryGraphStore _lock_intersectionOfNodesWithLabels:](self, "_lock_intersectionOfNodesWithLabels:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
LABEL_3:
      objc_msgSend(v13, "identifierSetByIntersectingIdentifierSet:", v8);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if (v14)
        v16 = (void *)v14;
      else
        v16 = v8;
      v17 = v16;

      v13 = v17;
    }
  }
  else
  {
    v13 = 0;
    if (v8)
      goto LABEL_3;
  }
  if (!v13)
  {
    -[KGMemoryGraphStore _lock_allNodeIdentifiers](self, "_lock_allNodeIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = objc_alloc_init(KGMutableElementIdentifierSet);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __82__KGMemoryGraphStore_nodeIdentifiersMatchingFilter_intersectingIdentifiers_error___block_invoke;
  v24[3] = &unk_1E83E4848;
  v24[4] = self;
  v25 = v7;
  v19 = v18;
  v26 = v19;
  v20 = v7;
  objc_msgSend(v13, "enumerateIdentifiersWithBlock:", v24);
  os_unfair_lock_unlock(p_lock);
  v21 = v26;
  v22 = v19;

  return v22;
}

- (id)edgeIdentifiersForNodeIdentifier:(unint64_t)a3 error:(id *)a4
{
  os_unfair_lock_s *p_lock;
  void *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[KGMemoryGraphStore _edgeIdentifiersForNodeIdentifier:](self, "_edgeIdentifiersForNodeIdentifier:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)_edgeIdentifiersForNodeIdentifier:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[KGDirectedBinaryAdjacency targetsForSourceIdentifier:](self->_edgeIdentifiersBySourceNodeIdentifier, "targetsForSourceIdentifier:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGDirectedBinaryAdjacency targetsForSourceIdentifier:](self->_edgeIdentifiersByTargetNodeIdentifier, "targetsForSourceIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEmpty"))
  {
    v7 = v6;
  }
  else if (objc_msgSend(v6, "isEmpty"))
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v6, "identifierSetByFormingUnion:", v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)_lock_edgeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 error:(id *)a5
{
  id v7;
  KGMutableDirectedBinaryAdjacency *edgeIdentifiersBySourceNodeIdentifier;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (a4 == 3)
  {
    -[KGDirectedBinaryAdjacency targetsForSources:](self->_edgeIdentifiersBySourceNodeIdentifier, "targetsForSources:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[KGDirectedBinaryAdjacency targetsForSources:](self->_edgeIdentifiersByTargetNodeIdentifier, "targetsForSources:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEmpty"))
    {
      v12 = v11;
    }
    else if (objc_msgSend(v11, "isEmpty"))
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(v11, "identifierSetByFormingUnion:", v10);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v12;

  }
  else
  {
    if (a4 == 2)
    {
      edgeIdentifiersBySourceNodeIdentifier = self->_edgeIdentifiersBySourceNodeIdentifier;
    }
    else
    {
      if (a4 != 1)
      {
        v9 = 0;
        goto LABEL_14;
      }
      edgeIdentifiersBySourceNodeIdentifier = self->_edgeIdentifiersByTargetNodeIdentifier;
    }
    -[KGDirectedBinaryAdjacency targetsForSources:](edgeIdentifiersBySourceNodeIdentifier, "targetsForSources:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_14:

  return v9;
}

- (id)edgeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 error:(id *)a5
{
  os_unfair_lock_s *p_lock;
  id v9;
  void *v10;

  p_lock = &self->_lock;
  v9 = a3;
  os_unfair_lock_lock(p_lock);
  -[KGMemoryGraphStore _lock_edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:error:](self, "_lock_edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:error:", v9, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (id)edgeIdentifiersWithStartNodeIdentifiers:(id)a3 intersectingEdgeIdentifiers:(id)a4 edgeDirection:(unint64_t)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;

  v10 = a4;
  -[KGMemoryGraphStore edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:error:](self, "edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:error:", a3, a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifierSetByIntersectingIdentifierSet:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)edgeIdentifiersBetween:(id)a3 endNodeIdentifiers:(id)a4 edgeFilter:(id)a5 edgeDirection:(unint64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v12 = a4;
  v13 = a5;
  -[KGMemoryGraphStore edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:error:](self, "edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:error:", a3, a6, a7);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    if (a6 - 1 > 2)
      v16 = 0;
    else
      v16 = qword_1CA1FE818[a6 - 1];
    -[KGMemoryGraphStore edgeIdentifiersWithStartNodeIdentifiers:intersectingEdgeIdentifiers:edgeDirection:error:](self, "edgeIdentifiersWithStartNodeIdentifiers:intersectingEdgeIdentifiers:edgeDirection:error:", v12, v14, v16, a7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[KGMemoryGraphStore edgeIdentifiersMatchingFilter:intersectingIdentifiers:error:](self, "edgeIdentifiersMatchingFilter:intersectingIdentifiers:error:", v13, v18, a7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)neighborNodeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 edgeFilter:(id)a5 error:(id *)a6
{
  char v8;
  id v10;
  id v11;
  os_unfair_lock_s *p_lock;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ((v8 & 2) != 0)
  {
    -[KGMemoryGraphStore _lock_edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:error:](self, "_lock_edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:error:", v10, 2, a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[KGMemoryGraphStore _lock_edgeIdentifiersMatchingFilter:intersectingIdentifiers:error:](self, "_lock_edgeIdentifiersMatchingFilter:intersectingIdentifiers:error:", v11, v14, a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[KGMemoryGraphStore _lock_nodeIdentifiersOfEdgesWithIdentifiers:edgeDirection:error:](self, "_lock_nodeIdentifiersOfEdgesWithIdentifiers:edgeDirection:error:", v15, 1, a6);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if ((v8 & 1) == 0)
      goto LABEL_9;
  }
  else
  {
    v13 = 0;
    if ((v8 & 1) == 0)
      goto LABEL_9;
  }
  -[KGMemoryGraphStore _lock_edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:error:](self, "_lock_edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:error:", v10, 1, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGMemoryGraphStore _lock_edgeIdentifiersMatchingFilter:intersectingIdentifiers:error:](self, "_lock_edgeIdentifiersMatchingFilter:intersectingIdentifiers:error:", v11, v16, a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[KGMemoryGraphStore _lock_nodeIdentifiersOfEdgesWithIdentifiers:edgeDirection:error:](self, "_lock_nodeIdentifiersOfEdgesWithIdentifiers:edgeDirection:error:", v17, 2, a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v13)
  {
    objc_msgSend(v13, "identifierSetByFormingUnion:", v18);
    v20 = objc_claimAutoreleasedReturnValue();

    v13 = (id)v20;
  }
  else
  {
    v13 = v18;
  }

LABEL_9:
  os_unfair_lock_unlock(p_lock);

  return v13;
}

- (id)transitiveClosureNeighborNodeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 edgeFilter:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  KGMutableElementIdentifierSet *v13;
  uint64_t v14;
  void *v15;
  id v16;
  KGMutableElementIdentifierSet *v17;

  v10 = a3;
  v11 = a5;
  v12 = (void *)objc_msgSend(v10, "copy");
  v13 = objc_alloc_init(KGMutableElementIdentifierSet);
  -[KGMemoryGraphStore neighborNodeIdentifiersWithStartNodeIdentifiers:edgeDirection:edgeFilter:error:](self, "neighborNodeIdentifiersWithStartNodeIdentifiers:edgeDirection:edgeFilter:error:", v12, a4, v11, a6);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    while (1)
    {
      v15 = (void *)v14;
      v16 = -[KGElementIdentifierSet mutableCopy](v13, "mutableCopy");
      objc_msgSend(v16, "unionWithIdentifierSet:", v15);
      if ((objc_msgSend(v16, "isEqual:", v13) & 1) != 0)
        break;
      -[KGMutableElementIdentifierSet unionWithIdentifierSet:](v13, "unionWithIdentifierSet:", v15);

      -[KGMemoryGraphStore neighborNodeIdentifiersWithStartNodeIdentifiers:edgeDirection:edgeFilter:error:](self, "neighborNodeIdentifiersWithStartNodeIdentifiers:edgeDirection:edgeFilter:error:", v15, a4, v11, a6);
      v14 = objc_claimAutoreleasedReturnValue();
      v12 = v15;
      if (!v14)
      {
        v17 = 0;
        v12 = v15;
        goto LABEL_7;
      }
    }

    v17 = v13;
  }
  else
  {
    v17 = 0;
  }
LABEL_7:

  return v17;
}

- (id)_lock_nodeIdentifiersOfEdgesWithIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 error:(id *)a5
{
  id v7;
  KGMutableElementIdentifierSet *v8;
  KGMutableElementIdentifierSet *v9;
  KGMutableElementIdentifierSet *v10;
  KGMutableElementIdentifierSet *v11;
  _QWORD v13[5];
  KGMutableElementIdentifierSet *v14;
  unint64_t v15;

  v7 = a3;
  v8 = objc_alloc_init(KGMutableElementIdentifierSet);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__KGMemoryGraphStore__lock_nodeIdentifiersOfEdgesWithIdentifiers_edgeDirection_error___block_invoke;
  v13[3] = &unk_1E83E4870;
  v13[4] = self;
  v15 = a4;
  v9 = v8;
  v14 = v9;
  objc_msgSend(v7, "enumerateIdentifiersWithBlock:", v13);

  v10 = v14;
  v11 = v9;

  return v11;
}

- (id)nodeIdentifiersOfEdgesWithIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 error:(id *)a5
{
  os_unfair_lock_s *p_lock;
  id v9;
  void *v10;

  p_lock = &self->_lock;
  v9 = a3;
  os_unfair_lock_lock(p_lock);
  -[KGMemoryGraphStore _lock_nodeIdentifiersOfEdgesWithIdentifiers:edgeDirection:error:](self, "_lock_nodeIdentifiersOfEdgesWithIdentifiers:edgeDirection:error:", v9, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (id)propertiesForNodesWithIdentifiers:(id)a3 propertyName:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  os_unfair_lock_s *p_lock;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  KGMutablePropertyValueArray *v21;

  v7 = a3;
  v8 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__3350;
  v20 = __Block_byref_object_dispose__3351;
  v21 = objc_alloc_init(KGMutablePropertyValueArray);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__KGMemoryGraphStore_propertiesForNodesWithIdentifiers_propertyName_error___block_invoke;
  v13[3] = &unk_1E83E4898;
  v13[4] = self;
  v15 = &v16;
  v10 = v8;
  v14 = v10;
  objc_msgSend(v7, "enumerateIdentifiersWithBlock:", v13);
  os_unfair_lock_unlock(p_lock);
  v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v11;
}

- (id)propertiesForEdgesWithIdentifiers:(id)a3 propertyName:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  os_unfair_lock_s *p_lock;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  KGMutablePropertyValueArray *v21;

  v7 = a3;
  v8 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__3350;
  v20 = __Block_byref_object_dispose__3351;
  v21 = objc_alloc_init(KGMutablePropertyValueArray);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__KGMemoryGraphStore_propertiesForEdgesWithIdentifiers_propertyName_error___block_invoke;
  v13[3] = &unk_1E83E4898;
  v13[4] = self;
  v15 = &v16;
  v10 = v8;
  v14 = v10;
  objc_msgSend(v7, "enumerateIdentifiersWithBlock:", v13);
  os_unfair_lock_unlock(p_lock);
  v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v11;
}

- (id)nodeLabels
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)MEMORY[0x1E0C99E60];
  -[NSMutableDictionary allKeys](self->_nodeIdentifiersByLabel, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)edgeLabels
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)MEMORY[0x1E0C99E60];
  -[NSMutableDictionary allKeys](self->_edgeIdentifiersByLabel, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)labelsOfNodesForIdentifiers:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v4, "indexArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_memoryNodeByIdentifier, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          objc_msgSend(v11, "labels");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "unionSet:", v13);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)labelsOfEdgesForIdentifiers:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v4, "indexArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_memoryEdgeByIdentifier, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          objc_msgSend(v11, "labels");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "unionSet:", v13);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)nodeIdentifiers:(id)a3 sortedByStringPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7
{
  return 0;
}

- (id)nodeIdentifiers:(id)a3 sortedByIntegerPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7
{
  return 0;
}

- (id)nodeIdentifiers:(id)a3 sortedByFloatPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7
{
  return 0;
}

- (id)nodeIdentifiers:(id)a3 sortedByUnsignedIntegerPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7
{
  return 0;
}

- (id)edgeIdentifiers:(id)a3 sortedByStringPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7
{
  return 0;
}

- (id)edgeIdentifiers:(id)a3 sortedByIntegerPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7
{
  return 0;
}

- (id)edgeIdentifiers:(id)a3 sortedByFloatPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7
{
  return 0;
}

- (id)_lock_targetsBySourceWithEdgeIdentifiers:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  KGMutableDirectedBinaryAdjacency *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __69__KGMemoryGraphStore__lock_targetsBySourceWithEdgeIdentifiers_error___block_invoke;
  v21[3] = &unk_1E83E48C0;
  v21[4] = self;
  v7 = v6;
  v22 = v7;
  objc_msgSend(v5, "enumerateIdentifiersWithBlock:", v21);
  v8 = objc_alloc_init(KGMutableDirectedBinaryAdjacency);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", v14, (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[KGMutableDirectedBinaryAdjacency setTargets:forSource:](v8, "setTargets:forSource:", v15, objc_msgSend(v14, "unsignedIntegerValue"));

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)_lock_sourcesByTargetWithEdgeIdentifiers:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  KGMutableDirectedBinaryAdjacency *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __69__KGMemoryGraphStore__lock_sourcesByTargetWithEdgeIdentifiers_error___block_invoke;
  v21[3] = &unk_1E83E48C0;
  v21[4] = self;
  v7 = v6;
  v22 = v7;
  objc_msgSend(v5, "enumerateIdentifiersWithBlock:", v21);
  v8 = objc_alloc_init(KGMutableDirectedBinaryAdjacency);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", v14, (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[KGMutableDirectedBinaryAdjacency setTargets:forSource:](v8, "setTargets:forSource:", v15, objc_msgSend(v14, "unsignedIntegerValue"));

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)targetsBySourceWithEdgeIdentifiers:(id)a3 error:(id *)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  void *v8;

  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  -[KGMemoryGraphStore _lock_targetsBySourceWithEdgeIdentifiers:error:](self, "_lock_targetsBySourceWithEdgeIdentifiers:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (id)sourcesByTargetWithEdgeIdentifiers:(id)a3 error:(id *)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  void *v8;

  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  -[KGMemoryGraphStore _lock_sourcesByTargetWithEdgeIdentifiers:error:](self, "_lock_sourcesByTargetWithEdgeIdentifiers:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (id)changesAfterToken:(id)a3 transactionLimit:(int64_t)a4 error:(id *)a5
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)nodeChangesAfterToken:(id)a3 transactionLimit:(int64_t)a4 nodeFilter:(id)a5 error:(id *)a6
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)edgeChangesAfterToken:(id)a3 transactionLimit:(int64_t)a4 edgeFilter:(id)a5 error:(id *)a6
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)orderedArrayOfEdgesWithIdentifiers:(id)a3 entityFactory:(id)a4 error:(id *)a5
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)orderedArrayOfNodesWithIdentifiers:(id)a3 entityFactory:(id)a4 error:(id *)a5
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)updateNodeForIdentifier:(unint64_t)a3 withProperties:(id)a4 error:(id *)a5
{
  id v7;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *memoryNodeByIdentifier;
  void *v10;
  void *v11;

  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  memoryNodeByIdentifier = self->_memoryNodeByIdentifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](memoryNodeByIdentifier, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v11, "setProperties:", v7);
  os_unfair_lock_unlock(p_lock);

  return v11 != 0;
}

- (BOOL)updateEdgeForIdentifier:(unint64_t)a3 withProperties:(id)a4 error:(id *)a5
{
  id v7;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *memoryEdgeByIdentifier;
  void *v10;
  void *v11;

  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  memoryEdgeByIdentifier = self->_memoryEdgeByIdentifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](memoryEdgeByIdentifier, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v11, "setProperties:", v7);
  os_unfair_lock_unlock(p_lock);

  return v11 != 0;
}

- (BOOL)removeEdgesForIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v6, "indexArray", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v10)
        objc_enumerationMutation(v7);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_memoryEdgeByIdentifier, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
        break;
      v13 = -[KGMemoryGraphStore _removeMemoryEdge:error:](self, "_removeMemoryEdge:error:", v12, a4);

      if (!v13)
      {
        LOBYTE(v12) = 0;
        break;
      }
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        LOBYTE(v12) = 1;
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    LOBYTE(v12) = 1;
  }

  os_unfair_lock_unlock(&self->_lock);
  return (char)v12;
}

- (BOOL)removeEdgeForIdentifier:(unint64_t)a3 error:(id *)a4
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *memoryEdgeByIdentifier;
  void *v9;
  void *v10;
  BOOL v11;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  memoryEdgeByIdentifier = self->_memoryEdgeByIdentifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](memoryEdgeByIdentifier, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = -[KGMemoryGraphStore _removeMemoryEdge:error:](self, "_removeMemoryEdge:error:", v10, a4);
  else
    v11 = 0;
  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (BOOL)_removeMemoryEdge:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  NSMutableDictionary *memoryEdgeByIdentifier;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  KGMutableDirectedBinaryAdjacency *edgeIdentifiersBySourceNodeIdentifier;
  void *v17;
  KGMutableDirectedBinaryAdjacency *edgeIdentifiersByTargetNodeIdentifier;
  BOOL v19;
  NSObject *v20;
  uint8_t v22[16];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "identifier");
  memoryEdgeByIdentifier = self->_memoryEdgeByIdentifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](memoryEdgeByIdentifier, "removeObjectForKey:", v8);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v5, "labels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
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
        -[NSMutableDictionary objectForKeyedSubscript:](self->_edgeIdentifiersByLabel, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          KGLoggingConnection();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v22 = 0;
            _os_log_error_impl(&dword_1CA0A5000, v20, OS_LOG_TYPE_ERROR, "Edge has a label and it's not in _edgeIdentifiersByLabel", v22, 2u);
          }

          v19 = 0;
          goto LABEL_13;
        }
        v15 = v14;
        objc_msgSend(v14, "removeIdentifier:", v6);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v11)
        continue;
      break;
    }
  }

  edgeIdentifiersBySourceNodeIdentifier = self->_edgeIdentifiersBySourceNodeIdentifier;
  objc_msgSend(v5, "sourceNode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGMutableDirectedBinaryAdjacency removeSource:target:](edgeIdentifiersBySourceNodeIdentifier, "removeSource:target:", objc_msgSend(v17, "identifier"), v6);

  edgeIdentifiersByTargetNodeIdentifier = self->_edgeIdentifiersByTargetNodeIdentifier;
  objc_msgSend(v5, "targetNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGMutableDirectedBinaryAdjacency removeSource:target:](edgeIdentifiersByTargetNodeIdentifier, "removeSource:target:", objc_msgSend(v9, "identifier"), v6);
  v19 = 1;
LABEL_13:

  return v19;
}

- (BOOL)_removeEdgesForMemoryNode:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  -[KGMemoryGraphStore _edgeIdentifiersForNodeIdentifier:](self, "_edgeIdentifiersForNodeIdentifier:", objc_msgSend(v6, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3350;
  v15 = __Block_byref_object_dispose__3351;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__KGMemoryGraphStore__removeEdgesForMemoryNode_error___block_invoke;
  v10[3] = &unk_1E83E48E8;
  v10[4] = self;
  v10[5] = &v17;
  v10[6] = &v11;
  objc_msgSend(v7, "enumerateIdentifiersWithBlock:", v10);
  if (a4)
    *a4 = objc_retainAutorelease((id)v12[5]);
  v8 = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (BOOL)removeNodesForIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  char v16;
  id *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v6, "indexArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v18 = a4;
    v10 = 0;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      v13 = v10;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v7);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v12), "unsignedIntegerValue", v18);
        v19 = v13;
        v15 = -[KGMemoryGraphStore _removeNode:error:](self, "_removeNode:error:", v14, &v19);
        v10 = v19;

        ++v12;
        v13 = v10;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);

    if (v18)
      v16 = v15;
    else
      v16 = 1;
    if ((v16 & 1) == 0)
    {
      v10 = objc_retainAutorelease(v10);
      *v18 = v10;
    }
  }
  else
  {

    v10 = 0;
  }
  os_unfair_lock_unlock(&self->_lock);

  return 1;
}

- (BOOL)removeNodeForIdentifier:(unint64_t)a3 error:(id *)a4
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(a4) = -[KGMemoryGraphStore _removeNode:error:](self, "_removeNode:error:", a3, a4);
  os_unfair_lock_unlock(p_lock);
  return (char)a4;
}

- (BOOL)_removeNode:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  unint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_memoryNodeByIdentifier, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
LABEL_18:
    v16 = 0;
    goto LABEL_19;
  }
  -[NSMutableDictionary removeObjectForKey:](self->_memoryNodeByIdentifier, "removeObjectForKey:", v7);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v8, "labels", 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_nodeIdentifiersByLabel, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          KGLoggingConnection();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1CA0A5000, v17, OS_LOG_TYPE_ERROR, "Node has a label and it's not in _nodeIdentifiersByLabel", buf, 2u);
          }

          goto LABEL_17;
        }
        v15 = v14;
        objc_msgSend(v14, "removeIdentifier:", a3);

      }
      v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v11)
        continue;
      break;
    }
  }

  if (!-[KGMemoryGraphStore _removeEdgesForMemoryNode:error:](self, "_removeEdgesForMemoryNode:error:", v8, a4))
  {
    KGLoggingConnection();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v24 = a3;
      _os_log_error_impl(&dword_1CA0A5000, v9, OS_LOG_TYPE_ERROR, "Cannot delete edges for node: %lu", buf, 0xCu);
    }
LABEL_17:

    goto LABEL_18;
  }
  v16 = 1;
LABEL_19:

  return v16;
}

- (BOOL)beginTransactionWithError:(id *)a3
{
  return 1;
}

- (BOOL)commitTransactionWithError:(id *)a3
{
  return 1;
}

- (BOOL)rollbackTransactionWithError:(id *)a3
{
  return 1;
}

- (BOOL)openWithMode:(unint64_t)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)copyToURL:(id)a3 error:(id *)a4
{
  return 1;
}

- (unint64_t)graphVersion
{
  return self->_graphVersion;
}

- (void)setGraphVersion:(unint64_t)a3
{
  self->_graphVersion = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (NSURL)url
{
  return self->_url;
}

- (unint64_t)nextNodeIdentifier
{
  return self->_nextNodeIdentifier;
}

- (void)setNextNodeIdentifier:(unint64_t)a3
{
  self->_nextNodeIdentifier = a3;
}

- (NSMutableDictionary)memoryNodeByIdentifier
{
  return self->_memoryNodeByIdentifier;
}

- (NSMutableDictionary)nodeIdentifiersByLabel
{
  return self->_nodeIdentifiersByLabel;
}

- (unint64_t)nextEdgeIdentifier
{
  return self->_nextEdgeIdentifier;
}

- (void)setNextEdgeIdentifier:(unint64_t)a3
{
  self->_nextEdgeIdentifier = a3;
}

- (NSMutableDictionary)memoryEdgeByIdentifier
{
  return self->_memoryEdgeByIdentifier;
}

- (NSMutableDictionary)edgeIdentifiersByLabel
{
  return self->_edgeIdentifiersByLabel;
}

- (KGMutableDirectedBinaryAdjacency)edgeIdentifiersBySourceNodeIdentifier
{
  return self->_edgeIdentifiersBySourceNodeIdentifier;
}

- (KGMutableDirectedBinaryAdjacency)edgeIdentifiersByTargetNodeIdentifier
{
  return self->_edgeIdentifiersByTargetNodeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeIdentifiersByTargetNodeIdentifier, 0);
  objc_storeStrong((id *)&self->_edgeIdentifiersBySourceNodeIdentifier, 0);
  objc_storeStrong((id *)&self->_edgeIdentifiersByLabel, 0);
  objc_storeStrong((id *)&self->_memoryEdgeByIdentifier, 0);
  objc_storeStrong((id *)&self->_nodeIdentifiersByLabel, 0);
  objc_storeStrong((id *)&self->_memoryNodeByIdentifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_graphIdentifier, 0);
}

void __54__KGMemoryGraphStore__removeEdgesForMemoryNode_error___block_invoke(_QWORD *a1, uint64_t a2, _BYTE *a3)
{
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  v4 = a1;
  v5 = *(void **)(a1[4] + 72);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)v4[4];
  v13 = 0;
  LOBYTE(v6) = objc_msgSend(v8, "_removeMemoryEdge:error:", v7, &v13);
  v9 = v13;
  *(_BYTE *)(*(_QWORD *)(v4[5] + 8) + 24) = (_BYTE)v6;
  v10 = *(_QWORD *)(v4[6] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;
  v12 = v9;

  LODWORD(v4) = *(unsigned __int8 *)(*(_QWORD *)(v4[5] + 8) + 24);
  if (!(_DWORD)v4)
    *a3 = 1;

}

void __69__KGMemoryGraphStore__lock_sourcesByTargetWithEdgeIdentifiers_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  KGMutableElementIdentifierSet *v10;
  id v11;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "targetNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "identifier");

  objc_msgSend(v11, "sourceNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "identifier");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9);
  v10 = (KGMutableElementIdentifierSet *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v10 = objc_alloc_init(KGMutableElementIdentifierSet);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v9);
  }
  -[KGMutableElementIdentifierSet addIdentifier:](v10, "addIdentifier:", v8);

}

void __69__KGMemoryGraphStore__lock_targetsBySourceWithEdgeIdentifiers_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  KGMutableElementIdentifierSet *v10;
  id v11;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "sourceNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "identifier");

  objc_msgSend(v11, "targetNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "identifier");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9);
  v10 = (KGMutableElementIdentifierSet *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v10 = objc_alloc_init(KGMutableElementIdentifierSet);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v9);
  }
  -[KGMutableElementIdentifierSet addIdentifier:](v10, "addIdentifier:", v8);

}

void __75__KGMemoryGraphStore_propertiesForEdgesWithIdentifiers_propertyName_error___block_invoke(_QWORD *a1, uint64_t a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = *(void **)(a1[4] + 72);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v13;
  if (!v13)
  {
    v9 = *(_QWORD *)(a1[6] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

    v8 = 0;
    *a3 = 1;
  }
  objc_msgSend(v8, "properties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", a1[5]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "appendValue:forIdentifier:", v12, a2);

}

void __75__KGMemoryGraphStore_propertiesForNodesWithIdentifiers_propertyName_error___block_invoke(_QWORD *a1, uint64_t a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = *(void **)(a1[4] + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v13;
  if (!v13)
  {
    v9 = *(_QWORD *)(a1[6] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

    v8 = 0;
    *a3 = 1;
  }
  objc_msgSend(v8, "properties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", a1[5]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "appendValue:forIdentifier:", v12, a2);

}

void __86__KGMemoryGraphStore__lock_nodeIdentifiersOfEdgesWithIdentifiers_edgeDirection_error___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = *(void **)(a1[4] + 72);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v5 = a1[6];
  if ((v5 & 1) != 0)
  {
    v6 = (void *)a1[5];
    objc_msgSend(v10, "targetNode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addIdentifier:", objc_msgSend(v7, "identifier"));

    v5 = a1[6];
  }
  if ((v5 & 2) != 0)
  {
    v8 = (void *)a1[5];
    objc_msgSend(v10, "sourceNode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addIdentifier:", objc_msgSend(v9, "identifier"));

  }
}

void __82__KGMemoryGraphStore_nodeIdentifiersMatchingFilter_intersectingIdentifiers_error___block_invoke(id *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a1[4], "memoryNodeByIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1[5], "matchesNode:", v6))
    objc_msgSend(a1[6], "addIdentifier:", objc_msgSend(v6, "identifier"));

}

void __88__KGMemoryGraphStore__lock_edgeIdentifiersMatchingFilter_intersectingIdentifiers_error___block_invoke(id *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a1[4], "memoryEdgeByIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1[5], "matchesEdge:", v6))
    objc_msgSend(a1[6], "addIdentifier:", objc_msgSend(v6, "identifier"));

}

void __76__KGMemoryGraphStore__lock_arrayOfEdgesWithIdentifiers_entityFactory_error___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_lock_snapshotEdgeForIdentifier:reusableNode:entityFactory:", a2, 0, *(_QWORD *)(a1 + 40));
  v5 = objc_claimAutoreleasedReturnValue();
  v8 = (id)v5;
  if (!v5)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

    v5 = 0;
    *a3 = 1;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v5);

}

void __76__KGMemoryGraphStore__lock_arrayOfNodesWithIdentifiers_entityFactory_error___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_lock_snapshotNodeForIdentifier:entityFactory:", a2, *(_QWORD *)(a1 + 40));
  v5 = objc_claimAutoreleasedReturnValue();
  v8 = (id)v5;
  if (!v5)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

    v5 = 0;
    *a3 = 1;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v5);

}

+ (NSString)persistentStoreFileExtension
{
  return 0;
}

+ (BOOL)copyFromURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return 1;
}

+ (BOOL)destroyAtURL:(id)a3 error:(id *)a4
{
  return 1;
}

+ (BOOL)migrateFromURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return 1;
}

@end
