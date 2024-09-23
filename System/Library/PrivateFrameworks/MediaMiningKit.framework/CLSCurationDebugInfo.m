@implementation CLSCurationDebugInfo

- (CLSCurationDebugInfo)initWithItems:(id)a3
{
  id v4;
  CLSCurationDebugInfo *v5;
  void *v6;
  uint64_t v7;
  NSMapTable *debugItemByItem;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CLSCurationDebugItem *v15;
  CLSCurationDebugItem *v16;
  CLSCurationDebugCluster *v17;
  CLSCurationDebugCluster *rootCluster;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CLSCurationDebugInfo;
  v5 = -[CLSCurationDebugInfo init](&v24, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v4, "count"));
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    debugItemByItem = v5->_debugItemByItem;
    v5->_debugItemByItem = (NSMapTable *)v7;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13);
          v15 = [CLSCurationDebugItem alloc];
          v16 = -[CLSCurationDebugItem initWithItem:](v15, "initWithItem:", v14, (_QWORD)v20);
          -[NSMapTable setObject:forKey:](v5->_debugItemByItem, "setObject:forKey:", v16, v14);
          objc_msgSend(v6, "addObject:", v16);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v11);
    }

    v17 = -[CLSCurationDebugCluster initWithDebugItems:reason:]([CLSCurationDebugCluster alloc], "initWithDebugItems:reason:", v6, CFSTR("Root"));
    rootCluster = v5->_rootCluster;
    v5->_rootCluster = v17;

  }
  return v5;
}

- (CLSCurationDebugInfo)initWithDebugCluster:(id)a3
{
  id v5;
  CLSCurationDebugInfo *v6;
  CLSCurationDebugInfo *v7;
  uint64_t v8;
  NSMapTable *debugItemByItem;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSMapTable *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CLSCurationDebugInfo;
  v6 = -[CLSCurationDebugInfo init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rootCluster, a3);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    debugItemByItem = v7->_debugItemByItem;
    v7->_debugItemByItem = (NSMapTable *)v8;

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v5, "allDebugItems", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          v16 = v7->_debugItemByItem;
          objc_msgSend(v15, "item");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable setObject:forKey:](v16, "setObject:forKey:", v15, v17);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v12);
    }

  }
  return v7;
}

- (id)debugInfoForCluster:(id)a3
{
  void *v3;
  CLSCurationDebugInfo *v4;

  -[CLSCurationDebugInfo debugClusterForCluster:](self, "debugClusterForCluster:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CLSCurationDebugInfo initWithDebugCluster:]([CLSCurationDebugInfo alloc], "initWithDebugCluster:", v3);

  return v4;
}

- (id)debugItemForItem:(id)a3
{
  return -[NSMapTable objectForKey:](self->_debugItemByItem, "objectForKey:", a3);
}

- (id)debugItemsForItems:(id)a3
{
  id v4;
  void *v5;
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
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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
        -[NSMapTable objectForKey:](self->_debugItemByItem, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)debugClusterForCluster:(id)a3
{
  return -[NSMapTable objectForKey:](self->_debugClusterByCluster, "objectForKey:", a3);
}

- (void)setClusters:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMapTable *v9;
  NSMapTable *debugClusterByCluster;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  CLSCurationDebugCluster *v18;
  id v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[16];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_debugClusterByCluster)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Clusters already set. To reset them, use resetWithReason first", buf, 2u);
    }
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v6, "count"));
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v9 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    debugClusterByCluster = self->_debugClusterByCluster;
    self->_debugClusterByCluster = v9;

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v19 = v6;
    obj = v6;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v15, "clsCurationItems", v19);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[CLSCurationDebugInfo debugItemsForItems:](self, "debugItemsForItems:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[CLSCurationDebugCluster initWithDebugItems:reason:]([CLSCurationDebugCluster alloc], "initWithDebugItems:reason:", v17, v7);
          -[NSMapTable setObject:forKey:](self->_debugClusterByCluster, "setObject:forKey:", v18, v15);
          objc_msgSend(v8, "addObject:", v18);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v12);
    }

    -[CLSCurationDebugCluster setDebugClusters:](self->_rootCluster, "setDebugClusters:", v8);
    v6 = v19;
  }

}

- (void)addClusters:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMapTable *v9;
  NSMapTable *debugClusterByCluster;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  CLSCurationDebugCluster *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v6, "count"));
  if (!self->_debugClusterByCluster)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v9 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    debugClusterByCluster = self->_debugClusterByCluster;
    self->_debugClusterByCluster = v9;

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v6;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v15, "clsCurationItems");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[CLSCurationDebugInfo debugItemsForItems:](self, "debugItemsForItems:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[CLSCurationDebugCluster initWithDebugItems:reason:]([CLSCurationDebugCluster alloc], "initWithDebugItems:reason:", v17, v7);
        -[NSMapTable setObject:forKey:](self->_debugClusterByCluster, "setObject:forKey:", v18, v15);
        objc_msgSend(v8, "addObject:", v18);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  -[CLSCurationDebugCluster addDebugClusters:](self->_rootCluster, "addDebugClusters:", v8);
}

- (void)setState:(unint64_t)a3 ofCluster:(id)a4 withReason:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint8_t v18[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[CLSCurationDebugInfo debugClusterForCluster:](self, "debugClusterForCluster:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setState:withReason:agent:stage:", a3, v9, self->_agent, self->_stage);
    objc_msgSend(v8, "clsCurationItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSCurationDebugInfo debugItemsForItems:](self, "debugItemsForItems:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "setState:withReason:agent:stage:", a3, v9, self->_agent, self->_stage);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v15);
    }

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v18 = 0;
    _os_log_error_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Cluster unknown", v18, 2u);
  }

}

- (void)setState:(unint64_t)a3 ofItem:(id)a4 withReason:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  -[CLSCurationDebugInfo debugItemForItem:](self, "debugItemForItem:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setState:withReason:agent:stage:", a3, v8, self->_agent, self->_stage);

}

- (void)setState:(unint64_t)a3 ofItems:(id)a4 withReason:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[CLSCurationDebugInfo debugItemsForItems:](self, "debugItemsForItems:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "setState:withReason:agent:stage:", a3, v8, self->_agent, self->_stage);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)forceState:(unint64_t)a3 ofItem:(id)a4 withReason:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  -[CLSCurationDebugInfo debugItemForItem:](self, "debugItemForItem:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resetWithReason:agent:stage:", v8, self->_agent, self->_stage);
  objc_msgSend(v9, "setState:withReason:agent:stage:", a3, v8, self->_agent, self->_stage);

}

- (void)setUnclusteredItemsState:(unint64_t)a3 withReason:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CLSCurationDebugCluster unclusteredDebugItems](self->_rootCluster, "unclusteredDebugItems", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v12, "state") != 4)
          objc_msgSend(v12, "setState:withReason:agent:stage:", a3, v6, self->_agent, self->_stage);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)chooseItem:(id)a3 inCluster:(id)a4 withReason:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;

  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = a5;
  v10 = a4;
  if (a3)
    objc_msgSend(v8, "setWithObject:", a3);
  else
    objc_msgSend(v8, "set");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[CLSCurationDebugInfo chooseItems:inCluster:withReason:](self, "chooseItems:inCluster:withReason:", v11, v10, v9);

}

- (void)chooseItem:(id)a3 inItems:(id)a4 withReason:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;

  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = a5;
  v10 = a4;
  if (a3)
    objc_msgSend(v8, "setWithObject:", a3);
  else
    objc_msgSend(v8, "set");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[CLSCurationDebugInfo chooseItems:inItems:withReason:](self, "chooseItems:inItems:withReason:", v11, v10, v9);

}

- (void)chooseItems:(id)a3 inCluster:(id)a4 withReason:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint8_t v15[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CLSCurationDebugInfo debugClusterForCluster:](self, "debugClusterForCluster:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (objc_msgSend(v8, "count"))
      v12 = 1;
    else
      v12 = 2;
    objc_msgSend(v11, "setState:withReason:agent:stage:", v12, v10, self->_agent, self->_stage);
    objc_msgSend(v9, "clsCurationItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSCurationDebugInfo chooseItems:inItems:withReason:](self, "chooseItems:inItems:withReason:", v8, v14, v10);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v15 = 0;
    _os_log_error_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Cluster unknown", v15, 2u);
  }

}

- (void)chooseItems:(id)a3 inItems:(id)a4 withReason:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[CLSCurationDebugInfo debugItemsForItems:](self, "debugItemsForItems:", a4);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v14, "item");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "containsObject:", v15))
          v16 = 1;
        else
          v16 = 2;

        objc_msgSend(v14, "setState:withReason:agent:stage:", v16, v9, self->_agent, self->_stage);
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

}

- (void)requireItems:(id)a3 inCluster:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v6 = a3;
  v7 = a4;
  -[CLSCurationDebugInfo debugClusterForCluster:](self, "debugClusterForCluster:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setState:withReason:agent:stage:", 1, CFSTR("Items required"), self->_agent, self->_stage);
    objc_msgSend(v7, "clsCurationItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSCurationDebugInfo requireItems:inItems:](self, "requireItems:inItems:", v6, v11);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v12 = 0;
    _os_log_error_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Cluster unknown", v12, 2u);
  }

}

- (void)requireItems:(id)a3 inItems:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CLSCurationDebugInfo debugItemsForItems:](self, "debugItemsForItems:", a4);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "item");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "containsObject:", v12))
          v13 = 4;
        else
          v13 = 2;

        objc_msgSend(v11, "setState:withReason:agent:stage:", v13, CFSTR("Items required"), self->_agent, self->_stage);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

- (void)dedupItems:(id)a3 toItem:(id)a4 withDedupingType:(unint64_t)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CLSCurationDebugInfo _dedupItems:toItems:chosenState:withDedupingType:](self, "_dedupItems:toItems:chosenState:withDedupingType:", v10, v11, 1, a5, v12, v13);
}

- (void)dedupItems:(id)a3 toItems:(id)a4 withDedupingType:(unint64_t)a5
{
  -[CLSCurationDebugInfo _dedupItems:toItems:chosenState:withDedupingType:](self, "_dedupItems:toItems:chosenState:withDedupingType:", a3, a4, 1, a5);
}

- (void)dedupItems:(id)a3 toRequiredItems:(id)a4 withDedupingType:(unint64_t)a5
{
  -[CLSCurationDebugInfo _dedupItems:toItems:chosenState:withDedupingType:](self, "_dedupItems:toItems:chosenState:withDedupingType:", a3, a4, 4, a5);
}

- (void)_dedupItems:(id)a3 toItems:(id)a4 chosenState:(unint64_t)a5 withDedupingType:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSCurationDebugInfo debugItemForItem:](self, "debugItemForItem:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v34 = v10;
    -[CLSCurationDebugInfo debugItemsForItems:](self, "debugItemsForItems:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "stringForDedupingType:", a6);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB3940];
    v17 = objc_msgSend(v14, "count");
    v18 = objc_msgSend(v11, "count");
    v19 = &stru_1E84F9D30;
    if (a5 == 4)
      v19 = CFSTR(" because they are required");
    v32 = (void *)v15;
    objc_msgSend(v16, "stringWithFormat:", CFSTR("Deduping (%@) %lu items to %lu%@"), v15, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v11;
    if ((unint64_t)objc_msgSend(v11, "count") < 2)
    {
      objc_msgSend(v13, "setState:withReason:agent:stage:", a5, v20, self->_agent, self->_stage);
      v21 = 0;
    }
    else
    {
      -[CLSCurationDebugInfo debugItemsForItems:](self, "debugItemsForItems:", v11);
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v40;
        do
        {
          v25 = 0;
          do
          {
            if (*(_QWORD *)v40 != v24)
              objc_enumerationMutation(v21);
            objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v25++), "setState:withReason:agent:stage:", a5, v20, self->_agent, self->_stage);
          }
          while (v23 != v25);
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        }
        while (v23);
      }

    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v26 = v14;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v36;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v36 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v30);
          if (v31 != v13
            && (!v21 || (objc_msgSend(v21, "containsObject:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v30)) & 1) == 0))
          {
            objc_msgSend(v31, "dupeToDebugItem:withDedupingType:", v13, a6);
            objc_msgSend(v31, "setState:withReason:agent:stage:", 2, v20, self->_agent, self->_stage);
          }
          ++v30;
        }
        while (v28 != v30);
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v28);
    }

    v11 = v33;
    v10 = v34;
  }

}

- (void)resetWithReason:(id)a3
{
  NSMapTable *debugClusterByCluster;
  id v5;

  debugClusterByCluster = self->_debugClusterByCluster;
  self->_debugClusterByCluster = 0;
  v5 = a3;

  -[CLSCurationDebugCluster resetWithReason:agent:stage:](self->_rootCluster, "resetWithReason:agent:stage:", v5, self->_agent, self->_stage);
}

- (void)beginTentativeSection
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  NSAllMapTableValues(self->_debugItemByItem);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "beginTentativeSection", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)endTentativeSectionWithSuccess:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  NSAllMapTableValues(self->_debugItemByItem);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "endTentativeSectionWithSuccess:", v3, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)dictionaryRepresentationWithAppendExtraItemInfoBlock:(id)a3
{
  void (**v4)(id, void *, void *);
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CLSCurationDebugInfo *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _QWORD v33[4];

  v33[2] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, void *))a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v26 = self;
  NSAllMapTableValues(self->_debugItemByItem);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("timestamp"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("identifier"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingDescriptors:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v17, "dictionaryRepresentation", v26);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v18, "mutableCopy");

        if (v19)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14 + i);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("index"));

          if (v4)
          {
            objc_msgSend(v17, "item");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v4[2](v4, v21, v19);

          }
          objc_msgSend(v17, "item");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "clsIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, v23);
        }

      }
      v14 += i;
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v13);
  }

  objc_msgSend(v27, "setObject:forKeyedSubscript:", v5, CFSTR("items"));
  -[CLSCurationDebugCluster dictionaryRepresentation](v26->_rootCluster, "dictionaryRepresentation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v24, CFSTR("rootCluster"));

  return v27;
}

- (NSString)agent
{
  return self->_agent;
}

- (void)setAgent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)stage
{
  return self->_stage;
}

- (void)setStage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stage, 0);
  objc_storeStrong((id *)&self->_agent, 0);
  objc_storeStrong((id *)&self->_debugClusterByCluster, 0);
  objc_storeStrong((id *)&self->_debugItemByItem, 0);
  objc_storeStrong((id *)&self->_rootCluster, 0);
}

@end
