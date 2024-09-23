@implementation MASubGraph

- (MASubGraph)init
{
  MASubGraph *v2;
  MASubGraph *v3;
  MAGraph *graph;
  NSMutableDictionary *v5;
  NSMutableDictionary *nodesByIdentifier;
  NSMutableDictionary *v7;
  NSMutableDictionary *nodesByLabel;
  NSMutableDictionary *v9;
  NSMutableDictionary *nodesByName;
  NSMutableDictionary *v11;
  NSMutableDictionary *edgesByIdentifier;
  NSMutableDictionary *v13;
  NSMutableDictionary *edgesByLabel;
  NSMutableDictionary *v15;
  NSMutableDictionary *edgesByName;
  NSMutableDictionary *v17;
  NSMutableDictionary *nodesByNameGroupByNodes;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MASubGraph;
  v2 = -[MASubGraph init](&v20, sel_init);
  v3 = v2;
  if (v2)
  {
    graph = v2->_graph;
    v2->_graph = 0;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    nodesByIdentifier = v3->_nodesByIdentifier;
    v3->_nodesByIdentifier = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    nodesByLabel = v3->_nodesByLabel;
    v3->_nodesByLabel = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    nodesByName = v3->_nodesByName;
    v3->_nodesByName = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    edgesByIdentifier = v3->_edgesByIdentifier;
    v3->_edgesByIdentifier = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    edgesByLabel = v3->_edgesByLabel;
    v3->_edgesByLabel = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    edgesByName = v3->_edgesByName;
    v3->_edgesByName = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    nodesByNameGroupByNodes = v3->_nodesByNameGroupByNodes;
    v3->_nodesByNameGroupByNodes = v17;

  }
  return v3;
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  void *v33;
  uint64_t v34;
  objc_class *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
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
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  -[MASubGraph nodesLabels](self, "nodesLabels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v57 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "appendFormat:", CFSTR("[%@](%ld), "), *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i), -[MASubGraph nodesCountForLabel:](self, "nodesCountForLabel:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i)));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
    }
    while (v6);
  }

  -[MASubGraph nodesLabels](self, "nodesLabels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
    objc_msgSend(v3, "deleteCharactersInRange:", objc_msgSend(v3, "length") - 2, 2);
  v11 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  -[MASubGraph edgesLabels](self, "edgesLabels");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v53 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v11, "appendFormat:", CFSTR("[%@](%ld), "), *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j), -[MASubGraph edgesCountForLabel:](self, "edgesCountForLabel:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j)));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    }
    while (v14);
  }

  -[MASubGraph edgesLabels](self, "edgesLabels");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
    objc_msgSend(v11, "deleteCharactersInRange:", objc_msgSend(v11, "length") - 2, 2);
  v43 = v3;
  v19 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  -[MASubGraph nodesNames](self, "nodesNames");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v49;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v49 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(v19, "appendFormat:", CFSTR("[%@](%ld), "), *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * k), -[MASubGraph nodesCountForName:](self, "nodesCountForName:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * k)));
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
    }
    while (v22);
  }

  -[MASubGraph nodesNames](self, "nodesNames");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");

  if (v26)
    objc_msgSend(v19, "deleteCharactersInRange:", objc_msgSend(v19, "length") - 2, 2);
  v27 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[MASubGraph edgesNames](self, "edgesNames");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v45;
    do
    {
      for (m = 0; m != v30; ++m)
      {
        if (*(_QWORD *)v45 != v31)
          objc_enumerationMutation(v28);
        objc_msgSend(v27, "appendFormat:", CFSTR("[%@](%ld), "), *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * m), -[MASubGraph edgesCountForName:](self, "edgesCountForName:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * m)));
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
    }
    while (v30);
  }

  -[MASubGraph edgesNames](self, "edgesNames");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "count");

  if (v34)
    objc_msgSend(v27, "deleteCharactersInRange:", objc_msgSend(v27, "length") - 2, 2);
  v42 = (void *)MEMORY[0x1E0CB3940];
  v35 = (objc_class *)objc_opt_class();
  NSStringFromClass(v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[MASubGraph graph](self, "graph");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "identifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "UUIDString");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "stringWithFormat:", CFSTR("[%@] id:[%@] nodesCount:[%ld] edgesCount:[%ld]\n\tnodesLabels:[%@]\n\tedgesLabels:[%@]\n\tnodesNames:[%@]\n\tedgesNames:[%@]"), v36, v39, -[MASubGraph nodesCount](self, "nodesCount"), -[MASubGraph edgesCount](self, "edgesCount"), v43, v11, v19, v27);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

- (void)mergeWithSubGraph:(id)a3
{
  id v4;
  MASubGraph *v5;
  id *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *context;
  id obj;
  uint64_t v25;
  uint64_t v26;
  id *v27;
  id *p_isa;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  _QWORD v38[5];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (id *)v4;
  objc_sync_enter(v6);
  v27 = v6;
  p_isa = (id *)&v5->super.isa;
  -[MASubGraph graph](v5, "graph");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "graph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    context = (void *)MEMORY[0x1CAA4B20C]();
    v9 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __32__MASubGraph_mergeWithSubGraph___block_invoke;
    v38[3] = &unk_1E83E4A98;
    v38[4] = p_isa;
    objc_msgSend(v6, "enumerateNodesByNameUsingBlock:", v38);
    v37[0] = v9;
    v37[1] = 3221225472;
    v37[2] = __32__MASubGraph_mergeWithSubGraph___block_invoke_2;
    v37[3] = &unk_1E83E4A98;
    v37[4] = p_isa;
    objc_msgSend(v6, "enumerateEdgesByNameUsingBlock:", v37);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v6[8], "keyEnumerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    if (v26)
    {
      obj = v10;
      v25 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v34 != v25)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v27[8], "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(p_isa[8], "objectForKey:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v31 = 0u;
            v32 = 0u;
            v29 = 0u;
            v30 = 0u;
            objc_msgSend(v13, "keyEnumerator");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
            if (v16)
            {
              v17 = *(_QWORD *)v30;
              do
              {
                for (j = 0; j != v16; ++j)
                {
                  if (*(_QWORD *)v30 != v17)
                    objc_enumerationMutation(v15);
                  v19 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
                  objc_msgSend(v13, "objectForKey:", v19);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "objectForKey:", v19);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v22 = v21;
                  if (v21)
                    objc_msgSend(v21, "unionSet:", v20);
                  else
                    objc_msgSend(v14, "setObject:forKey:", v20, v19);

                }
                v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
              }
              while (v16);
            }

          }
          else
          {
            objc_msgSend(p_isa[8], "setObject:forKey:", v13, v12);
          }

        }
        v10 = obj;
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      }
      while (v26);
    }

    v6 = v27;
    objc_autoreleasePoolPop(context);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("MASubGraphInvalidGraph"), CFSTR("SubGraph invalid for graph \"%@\"), v5->_graph);
  }
  objc_sync_exit(v6);

  objc_sync_exit(p_isa);
}

- (void)addNodes:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
  MASubGraph *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v9);
        -[MASubGraph _addNode:withName:](v8, "_addNode:withName:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), v7, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

- (void)_addNode:(id)a3 withName:(id)a4
{
  id v6;
  MASubGraph *v7;
  NSMutableDictionary *nodesByIdentifier;
  void *v9;
  NSMutableDictionary *nodesByLabel;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  nodesByIdentifier = v7->_nodesByIdentifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v16, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](nodesByIdentifier, "setObject:forKey:", v16, v9);

  nodesByLabel = v7->_nodesByLabel;
  objc_msgSend(v16, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](nodesByLabel, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v7->_nodesByLabel;
    objc_msgSend(v16, "label");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v12, v14);

  }
  objc_msgSend(v12, "addObject:", v16);
  -[NSMutableDictionary objectForKey:](v7->_nodesByName, "objectForKey:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v7->_nodesByName, "setObject:forKey:", v15, v6);
  }
  objc_msgSend(v15, "addObject:", v16);

  objc_sync_exit(v7);
}

- (void)_addNode:(id)a3 withName:(id)a4 forKeyNode:(id)a5
{
  id v8;
  id v9;
  MASubGraph *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  -[NSMutableDictionary objectForKey:](v10->_nodesByNameGroupByNodes, "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v10->_nodesByNameGroupByNodes, "setObject:forKey:", v11, v8);
  }
  objc_msgSend(v11, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, v9);
  }
  objc_msgSend(v12, "addObject:", v13);

  objc_sync_exit(v10);
}

- (id)nodeForIdentifier:(unint64_t)a3
{
  NSMutableDictionary *nodesByIdentifier;
  void *v4;
  void *v5;

  nodesByIdentifier = self->_nodesByIdentifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](nodesByIdentifier, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)nodesForLabel:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKey:](self->_nodesByLabel, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)nodesForName:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKey:](self->_nodesByName, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)nodesForNames:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[NSMutableDictionary objectForKey:](self->_nodesByName, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "set");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "unionSet:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)nodesForName:(id)a3 fromNode:(id)a4
{
  NSMutableDictionary *nodesByNameGroupByNodes;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  nodesByNameGroupByNodes = self->_nodesByNameGroupByNodes;
  v6 = a4;
  -[NSMutableDictionary objectForKey:](nodesByNameGroupByNodes, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)nodesCountForLabel:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NSMutableDictionary objectForKey:](self->_nodesByLabel, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (unint64_t)nodesCountForName:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NSMutableDictionary objectForKey:](self->_nodesByName, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (unint64_t)nodesCountForName:(id)a3 fromNode:(id)a4
{
  NSMutableDictionary *nodesByNameGroupByNodes;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;

  nodesByNameGroupByNodes = self->_nodesByNameGroupByNodes;
  v6 = a4;
  -[NSMutableDictionary objectForKey:](nodesByNameGroupByNodes, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "count");
  return v9;
}

- (id)nodesForLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  int v5;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v5 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[NSMutableDictionary objectForKey:](self->_nodesByLabel, "objectForKey:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v11 = objc_msgSend(v8, "count") == 0;
  else
    v11 = 1;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v16);
        if ((!v5 || objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v16), "domain", (_QWORD)v20) == v5)
          && (v11 || objc_msgSend(v17, "hasProperties:", v8)))
        {
          objc_msgSend(v10, "addObject:", v17, (_QWORD)v20);
        }
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (unint64_t)nodesCount
{
  return -[NSMutableDictionary count](self->_nodesByIdentifier, "count");
}

- (id)nodesLabels
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[NSMutableDictionary allKeys](self->_nodesByLabel, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)nodesNames
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary keyEnumerator](self->_nodesByName, "keyEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v9, "hasPrefix:", CFSTR("#")) & 1) == 0)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)allNodes
{
  MASubGraph *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x1E0C99E10];
  -[NSMutableDictionary allValues](v2->_nodesByIdentifier, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedSetWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v6;
}

- (id)allNamedNodes
{
  MASubGraph *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[MASubGraph nodesNames](v2, "nodesNames", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary objectForKeyedSubscript:](v2->_nodesByName, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionOrderedSet:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  objc_msgSend(v3, "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v9;
}

- (void)enumerateNodesByNameUsingBlock:(id)a3
{
  id v4;
  NSMutableDictionary *nodesByName;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (v4)
  {
    nodesByName = self->_nodesByName;
    v7[1] = 3221225472;
    v7[2] = __45__MASubGraph_enumerateNodesByNameUsingBlock___block_invoke;
    v7[3] = &unk_1E83E4AC0;
    v6 = v4;
    v7[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](nodesByName, "enumerateKeysAndObjectsUsingBlock:", v7);

    v4 = v6;
  }

}

- (void)enumerateNodesWithLabel:(id)a3 domain:(unsigned __int16)a4 usingBlock:(id)a5
{
  int v5;
  void (**v8)(id, uint64_t, char *);
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  char v22;
  _BYTE v23[128];
  uint64_t v24;

  v5 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, uint64_t, char *))a5;
  if (v8)
  {
    v22 = 0;
    v9 = (void *)MEMORY[0x1E0C99E40];
    -[NSMutableDictionary objectForKey:](self->_nodesByLabel, "objectForKey:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "orderedSetWithOrderedSet:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
LABEL_4:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16);
        if (!v5 || objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16), "domain", (_QWORD)v18) == v5)
        {
          v8[2](v8, v17, &v22);
          if (v22)
            break;
        }
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
          if (v14)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

- (void)enumerateNodesWithName:(id)a3 usingBlock:(id)a4
{
  void (**v6)(id, _QWORD, char *);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD, char *))a4;
  if (v6)
  {
    v19 = 0;
    v7 = (void *)MEMORY[0x1E0C99E40];
    -[NSMutableDictionary objectForKey:](self->_nodesByName, "objectForKey:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "orderedSetWithOrderedSet:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
LABEL_4:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        v6[2](v6, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14), &v19);
        if (v19)
          break;
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
          if (v12)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

- (void)enumerateNodesWithBlock:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, char *))a3;
  if (v4)
  {
    v24 = 0;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[NSMutableDictionary objectEnumerator](self->_nodesByLabel, "objectEnumerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithOrderedSet:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 0u;
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v11 = v10;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v17;
            while (2)
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v17 != v14)
                  objc_enumerationMutation(v11);
                v4[2](v4, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j), &v24);
                if (v24)
                {

                  goto LABEL_19;
                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
              if (v13)
                continue;
              break;
            }
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v7);
    }
LABEL_19:

  }
}

- (void)enumerateNodesWithName:(id)a3 fromNode:(id)a4 usingBlock:(id)a5
{
  NSMutableDictionary *nodesByNameGroupByNodes;
  id v8;
  id v9;
  void *v10;
  id v11;

  if (a5)
  {
    nodesByNameGroupByNodes = self->_nodesByNameGroupByNodes;
    v8 = a5;
    v9 = a4;
    -[NSMutableDictionary objectForKey:](nodesByNameGroupByNodes, "objectForKey:", a3);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v8);
  }
}

- (void)addEdges:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
  MASubGraph *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v9);
        -[MASubGraph _addEdge:withName:](v8, "_addEdge:withName:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), v7, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

- (void)_addEdge:(id)a3 withName:(id)a4
{
  id v6;
  MASubGraph *v7;
  NSMutableDictionary *edgesByIdentifier;
  void *v9;
  NSMutableDictionary *edgesByLabel;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  edgesByIdentifier = v7->_edgesByIdentifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v16, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](edgesByIdentifier, "setObject:forKey:", v16, v9);

  edgesByLabel = v7->_edgesByLabel;
  objc_msgSend(v16, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](edgesByLabel, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v7->_edgesByLabel;
    objc_msgSend(v16, "label");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v12, v14);

  }
  objc_msgSend(v12, "addObject:", v16);
  -[NSMutableDictionary objectForKey:](v7->_edgesByName, "objectForKey:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v7->_edgesByName, "setObject:forKey:", v15, v6);
  }
  objc_msgSend(v15, "addObject:", v16);

  objc_sync_exit(v7);
}

- (id)edgeForIdentifier:(unint64_t)a3
{
  NSMutableDictionary *edgesByIdentifier;
  void *v4;
  void *v5;

  edgesByIdentifier = self->_edgesByIdentifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](edgesByIdentifier, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)edgesForLabel:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKey:](self->_edgesByLabel, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)edgesForName:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKey:](self->_edgesByName, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)edgesForLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  int v5;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v5 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[NSMutableDictionary objectForKey:](self->_edgesByLabel, "objectForKey:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v11 = objc_msgSend(v8, "count") == 0;
  else
    v11 = 1;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v16);
        if ((!v5 || objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v16), "domain", (_QWORD)v20) == v5)
          && (v11 || objc_msgSend(v17, "hasProperties:", v8)))
        {
          objc_msgSend(v10, "addObject:", v17, (_QWORD)v20);
        }
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (unint64_t)edgesCount
{
  return -[NSMutableDictionary count](self->_edgesByIdentifier, "count");
}

- (unint64_t)edgesCountForLabel:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NSMutableDictionary objectForKey:](self->_edgesByLabel, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (unint64_t)edgesCountForName:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NSMutableDictionary objectForKey:](self->_edgesByName, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)edgesLabels
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[NSMutableDictionary allKeys](self->_edgesByLabel, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)edgesNames
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary keyEnumerator](self->_edgesByName, "keyEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v9, "hasPrefix:", CFSTR("#")) & 1) == 0)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)allEdges
{
  MASubGraph *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x1E0C99E10];
  -[NSMutableDictionary allValues](v2->_edgesByIdentifier, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedSetWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v6;
}

- (id)allNamedEdges
{
  MASubGraph *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[MASubGraph edgesNames](v2, "edgesNames", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary objectForKeyedSubscript:](v2->_edgesByName, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionOrderedSet:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  objc_msgSend(v3, "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v9;
}

- (void)enumerateEdgesByNameUsingBlock:(id)a3
{
  id v4;
  NSMutableDictionary *edgesByName;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  edgesByName = self->_edgesByName;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__MASubGraph_enumerateEdgesByNameUsingBlock___block_invoke;
  v7[3] = &unk_1E83E4AC0;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](edgesByName, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void)enumerateEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4 usingBlock:(id)a5
{
  int v5;
  void (**v8)(id, uint64_t, char *);
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  char v22;
  _BYTE v23[128];
  uint64_t v24;

  v5 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, uint64_t, char *))a5;
  v22 = 0;
  v9 = (void *)MEMORY[0x1E0C99E40];
  -[NSMutableDictionary objectForKey:](self->_edgesByLabel, "objectForKey:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "orderedSetWithOrderedSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
LABEL_3:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v15)
        objc_enumerationMutation(v12);
      v17 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16);
      if (!v5 || objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16), "domain", (_QWORD)v18) == v5)
      {
        v8[2](v8, v17, &v22);
        if (v22)
          break;
      }
      if (v14 == ++v16)
      {
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        if (v14)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)enumerateEdgesWithName:(id)a3 usingBlock:(id)a4
{
  void (**v6)(id, _QWORD, char *);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD, char *))a4;
  v19 = 0;
  v7 = (void *)MEMORY[0x1E0C99E40];
  -[NSMutableDictionary objectForKey:](self->_edgesByName, "objectForKey:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "orderedSetWithOrderedSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v13)
        objc_enumerationMutation(v10);
      v6[2](v6, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14), &v19);
      if (v19)
        break;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        if (v12)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)enumerateEdgesWithBlock:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, char *))a3;
  v24 = 0;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_edgesByLabel, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithOrderedSet:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v17;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v17 != v14)
                objc_enumerationMutation(v11);
              v4[2](v4, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j), &v24);
              if (v24)
              {

                goto LABEL_18;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
            if (v13)
              continue;
            break;
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v7);
  }
LABEL_18:

}

- (id)graphRepresentation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  BOOL v36;
  void *v37;
  uint64_t v38;
  void *v39;
  double v40;
  id v41;
  id v42;
  MASubGraph *v44;
  uint64_t v45;
  id obj;
  id obja;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAGraph graph](MAGraph, "graph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v44 = self;
  -[NSMutableDictionary objectEnumerator](self->_nodesByName, "objectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
  if (v50)
  {
    v48 = *(_QWORD *)v67;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v67 != v48)
          objc_enumerationMutation(obj);
        v52 = v5;
        v6 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v5);
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v63;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v63 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
              objc_msgSend(v12, "label");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v12, "domain");
              objc_msgSend(v12, "propertyDictionary");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v16) = 1.0;
              objc_msgSend(v4, "addUniqueNodeWithLabel:domain:weight:properties:didCreate:", v13, v14, v15, 0, v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "identifier"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "setObject:forKey:", v17, v18);

            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
          }
          while (v9);
        }

        v5 = v52 + 1;
      }
      while (v52 + 1 != v50);
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
    }
    while (v50);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  -[NSMutableDictionary objectEnumerator](v44->_edgesByName, "objectEnumerator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  obja = (id)objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
  if (obja)
  {
    v20 = *(_QWORD *)v59;
    v45 = *(_QWORD *)v59;
    v51 = v19;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v59 != v20)
          objc_enumerationMutation(v19);
        v49 = v21;
        v22 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v21);
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v23 = v22;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
        if (v24)
        {
          v25 = v24;
          v53 = *(_QWORD *)v55;
          while (2)
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v55 != v53)
                objc_enumerationMutation(v23);
              v27 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
              v28 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v27, "sourceNode");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "numberWithUnsignedInteger:", objc_msgSend(v29, "identifier"));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "objectForKey:", v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              v32 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v27, "targetNode");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "numberWithUnsignedInteger:", objc_msgSend(v33, "identifier"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "objectForKey:", v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              if (v31)
                v36 = v35 == 0;
              else
                v36 = 1;
              if (v36)
              {
                objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("MASubGraphInvalidGraph"), CFSTR("Graph invalid for edge \"%@\"), v27);

                v42 = 0;
                goto LABEL_35;
              }
              objc_msgSend(v27, "label");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = objc_msgSend(v27, "domain");
              objc_msgSend(v27, "propertyDictionary");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v40) = 1.0;
              v41 = (id)objc_msgSend(v4, "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:weight:properties:", v37, v31, v35, v38, v39, v40);

            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
            if (v25)
              continue;
            break;
          }
        }

        v21 = v49 + 1;
        v20 = v45;
        v19 = v51;
      }
      while ((id)(v49 + 1) != obja);
      obja = (id)objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
    }
    while (obja);
  }

  v42 = v4;
LABEL_35:

  return v42;
}

- (MAGraph)graph
{
  return self->_graph;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodesByNameGroupByNodes, 0);
  objc_storeStrong((id *)&self->_edgesByName, 0);
  objc_storeStrong((id *)&self->_edgesByLabel, 0);
  objc_storeStrong((id *)&self->_edgesByIdentifier, 0);
  objc_storeStrong((id *)&self->_nodesByName, 0);
  objc_storeStrong((id *)&self->_nodesByLabel, 0);
  objc_storeStrong((id *)&self->_nodesByIdentifier, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

void __45__MASubGraph_enumerateEdgesByNameUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  id v7;
  id v8;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a2;
  objc_msgSend(a3, "set");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, uint64_t))(v6 + 16))(v6, v7, v8, a4);

}

void __45__MASubGraph_enumerateNodesByNameUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  id v7;
  id v8;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a2;
  objc_msgSend(a3, "set");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, uint64_t))(v6 + 16))(v6, v7, v8, a4);

}

uint64_t __32__MASubGraph_mergeWithSubGraph___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addNodes:withName:", a3, a2);
}

uint64_t __32__MASubGraph_mergeWithSubGraph___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addEdges:withName:", a3, a2);
}

+ (id)subGraphWithGraph:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)v4[1];
  v4[1] = v3;

  return v4;
}

+ (id)subGraphIntersectionsWithSubGraphs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  uint64_t v45;
  void *v46;
  id *v47;
  void *v48;
  void *v49;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id obj;
  id *v58;
  uint64_t v59;
  id *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[4];
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[4];
  id v85;
  _QWORD v86[4];
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "graph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "subGraphWithGraph:", v6);
  v7 = (id *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v10 = v4;
  v55 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v88, v96, 16);
  if (v55)
  {
    v54 = *(_QWORD *)v89;
    v58 = v7;
    v52 = v10;
    v53 = v8;
    v51 = v9;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v89 != v54)
          objc_enumerationMutation(v10);
        v12 = *(id **)(*((_QWORD *)&v88 + 1) + 8 * v11);
        objc_msgSend(v7, "graph");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "graph");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 != v14)
        {
          v48 = (void *)MEMORY[0x1E0C99DA0];
          objc_msgSend(v7, "graph");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "raise:format:", CFSTR("MASubGraphInvalidGraph"), CFSTR("SubGraph invalid for graph \"%@\"), v49);

          v47 = 0;
          goto LABEL_48;
        }
        v56 = v11;
        v15 = MEMORY[0x1E0C809B0];
        v86[0] = MEMORY[0x1E0C809B0];
        v86[1] = 3221225472;
        v86[2] = __49__MASubGraph_subGraphIntersectionsWithSubGraphs___block_invoke;
        v86[3] = &unk_1E83E4A98;
        v61 = v8;
        v87 = v61;
        objc_msgSend(v12, "enumerateNodesByNameUsingBlock:", v86);
        v84[0] = v15;
        v84[1] = 3221225472;
        v84[2] = __49__MASubGraph_subGraphIntersectionsWithSubGraphs___block_invoke_2;
        v84[3] = &unk_1E83E4A98;
        v85 = v9;
        objc_msgSend(v12, "enumerateEdgesByNameUsingBlock:", v84);
        v82 = 0u;
        v83 = 0u;
        v80 = 0u;
        v81 = 0u;
        objc_msgSend(v12[8], "keyEnumerator");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
        if (v62)
        {
          v59 = *(_QWORD *)v81;
          v60 = v12;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v81 != v59)
                objc_enumerationMutation(obj);
              v63 = v16;
              v17 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * v16);
              objc_msgSend(v61, "objectForKey:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12[8], "objectForKey:", v17);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7[8], "objectForKey:", v17);
              v20 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E20], "set");
              v64 = v20;
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = (id)v20;
              if (!v20)
              {
                v21 = v19;
                objc_msgSend(v7[8], "setObject:forKey:", v21, v17);
              }
              v78 = 0u;
              v79 = 0u;
              v76 = 0u;
              v77 = 0u;
              objc_msgSend(v19, "keyEnumerator");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
              if (v23)
              {
                v24 = v23;
                v25 = *(_QWORD *)v77;
                do
                {
                  for (i = 0; i != v24; ++i)
                  {
                    if (*(_QWORD *)v77 != v25)
                      objc_enumerationMutation(v22);
                    v27 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * i);
                    if ((objc_msgSend(v18, "containsObject:", v27) & 1) != 0)
                    {
                      if (v64)
                      {
                        v28 = v19;
                        objc_msgSend(v19, "objectForKey:", v27);
                        v29 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v21, "objectForKey:", v27);
                        v30 = (void *)objc_claimAutoreleasedReturnValue();
                        v31 = v30;
                        if (v30)
                          objc_msgSend(v30, "unionSet:", v29);
                        else
                          objc_msgSend(v21, "setObject:forKey:", v29, v27);

                        v19 = v28;
                      }
                    }
                    else
                    {
                      objc_msgSend(v65, "addObject:", v27);
                    }
                  }
                  v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
                }
                while (v24);
              }

              v74[0] = MEMORY[0x1E0C809B0];
              v74[1] = 3221225472;
              v74[2] = __49__MASubGraph_subGraphIntersectionsWithSubGraphs___block_invoke_3;
              v74[3] = &unk_1E83E5178;
              v75 = v21;
              v32 = v21;
              objc_msgSend(v65, "enumerateObjectsUsingBlock:", v74);

              v16 = v63 + 1;
              v7 = v58;
              v12 = v60;
            }
            while (v63 + 1 != v62);
            v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
          }
          while (v62);
        }

        v11 = v56 + 1;
        v10 = v52;
        v8 = v53;
        v9 = v51;
      }
      while (v56 + 1 != v55);
      v55 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v88, v96, 16);
      if (v55)
        continue;
      break;
    }
  }

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  objc_msgSend(v8, "keyEnumerator");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v70, v93, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v71;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v71 != v36)
          objc_enumerationMutation(v33);
        v38 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * j);
        objc_msgSend(v8, "objectForKey:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addNodes:withName:", v39, v38);

      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v70, v93, 16);
    }
    while (v35);
  }

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  objc_msgSend(v9, "keyEnumerator");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v66, v92, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v67;
    do
    {
      for (k = 0; k != v42; ++k)
      {
        if (*(_QWORD *)v67 != v43)
          objc_enumerationMutation(v40);
        v45 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * k);
        objc_msgSend(v9, "objectForKey:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addNodes:withName:", v46, v45);

      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v66, v92, 16);
    }
    while (v42);
  }

  v47 = v7;
LABEL_48:

  return v47;
}

void __49__MASubGraph_subGraphIntersectionsWithSubGraphs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "intersectSet:", v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v8, v9);
  }

}

void __49__MASubGraph_subGraphIntersectionsWithSubGraphs___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "intersectSet:", v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v8, v9);
  }

}

void __49__MASubGraph_subGraphIntersectionsWithSubGraphs___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *i;
  NSMapEnumerator enumerator;

  v3 = a2;
  memset(&enumerator, 0, sizeof(enumerator));
  NSEnumerateMapTable(&enumerator, *(NSMapTable **)(a1 + 32));
  for (i = 0; NSNextMapEnumeratorPair(&enumerator, 0, &i); objc_msgSend(i, "removeObject:", v3))
    ;
  NSEndMapTableEnumeration(&enumerator);

}

@end
