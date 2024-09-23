@implementation CLSCurationDebugCluster

- (CLSCurationDebugCluster)initWithDebugItems:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  CLSCurationDebugCluster *v8;
  uint64_t v9;
  NSSet *unclusteredDebugItems;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CLSCurationDebugCluster;
  v8 = -[CLSCurationDebugObject init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    unclusteredDebugItems = v8->_unclusteredDebugItems;
    v8->_unclusteredDebugItems = (NSSet *)v9;

    objc_storeStrong((id *)&v8->_reason, a4);
  }

  return v8;
}

- (id)allDebugItems
{
  NSSet *debugClusters;
  NSSet *v4;
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  debugClusters = self->_debugClusters;
  if (debugClusters && -[NSSet count](debugClusters, "count"))
  {
    v4 = (NSSet *)-[NSSet mutableCopy](self->_unclusteredDebugItems, "mutableCopy");
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = self->_debugClusters;
    v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "allDebugItems", (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSSet unionSet:](v4, "unionSet:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = self->_unclusteredDebugItems;
  }
  return v4;
}

- (void)setDebugClusters:(id)a3
{
  id v4;
  void *v5;
  NSSet *v6;
  NSSet *debugClusters;
  NSSet *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSSet *unclusteredDebugItems;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[8];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_debugClusters)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Clusters already set.", buf, 2u);
    }
  }
  else
  {
    v6 = (NSSet *)objc_msgSend(v4, "copy");
    debugClusters = self->_debugClusters;
    self->_debugClusters = v6;

    v8 = (NSSet *)-[NSSet mutableCopy](self->_unclusteredDebugItems, "mutableCopy");
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "allDebugItems", (_QWORD)v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSSet minusSet:](v8, "minusSet:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v11);
    }

    unclusteredDebugItems = self->_unclusteredDebugItems;
    self->_unclusteredDebugItems = v8;

  }
}

- (void)addDebugClusters:(id)a3
{
  id v4;
  NSSet *debugClusters;
  id v6;
  void *v7;
  NSSet *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSSet *unclusteredDebugItems;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  debugClusters = self->_debugClusters;
  if (debugClusters)
    v6 = (id)-[NSSet mutableCopy](debugClusters, "mutableCopy");
  else
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v7 = v6;
  objc_msgSend(v6, "unionSet:", v4);
  objc_storeStrong((id *)&self->_debugClusters, v7);
  v8 = (NSSet *)-[NSSet mutableCopy](self->_unclusteredDebugItems, "mutableCopy");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "allDebugItems", (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSSet minusSet:](v8, "minusSet:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  unclusteredDebugItems = self->_unclusteredDebugItems;
  self->_unclusteredDebugItems = v8;

}

- (void)resetWithReason:(id)a3 agent:(id)a4 stage:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSSet *v11;
  NSSet *unclusteredDebugItems;
  NSSet *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSSet *debugClusters;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CLSCurationDebugCluster;
  -[CLSCurationDebugObject resetWithReason:agent:stage:](&v23, sel_resetWithReason_agent_stage_, v8, v9, v10);
  -[CLSCurationDebugCluster allDebugItems](self, "allDebugItems");
  v11 = (NSSet *)objc_claimAutoreleasedReturnValue();
  unclusteredDebugItems = self->_unclusteredDebugItems;
  self->_unclusteredDebugItems = v11;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = self->_unclusteredDebugItems;
  v14 = -[NSSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v17++), "resetWithReason:agent:stage:", v8, v9, v10, (_QWORD)v19);
      }
      while (v15 != v17);
      v15 = -[NSSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v15);
  }

  debugClusters = self->_debugClusters;
  self->_debugClusters = 0;

}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSSet *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  char isKindOfClass;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  objc_super v52;
  const __CFString *v53;
  id v54;
  _QWORD v55[2];
  _QWORD v56[2];
  _BYTE v57[128];
  void *v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v52.receiver = self;
  v52.super_class = (Class)CLSCurationDebugCluster;
  -[CLSCurationDebugObject dictionaryRepresentation](&v52, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[CLSCurationDebugCluster allDebugItems](self, "allDebugItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v4;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("totalNumberOfItems"));

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v9 = self->_unclusteredDebugItems;
  v10 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v49;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v49 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "addObject:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
    }
    while (v11);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v14 = self->_debugClusters;
  v15 = -[NSSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v44, v59, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v45;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v45 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(v8, "addObject:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v18++));
      }
      while (v16 != v18);
      v16 = -[NSSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v44, v59, 16);
    }
    while (v16);
  }

  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("timestamp"), 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortUsingDescriptors:", v22);

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v23 = v8;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v57, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v41;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v41 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v27);
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v30 = v28;
        v31 = v30;
        if ((isKindOfClass & 1) != 0)
        {
          if (objc_msgSend(v20, "count"))
          {
            v55[0] = CFSTR("itemIdentifiers");
            v55[1] = CFSTR("totalNumberOfItems");
            v56[0] = v20;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v20, "count"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v56[1] = v32;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v33);

            v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v20 = v34;
          }
          objc_msgSend(v31, "dictionaryRepresentation");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v35);
        }
        else
        {
          objc_msgSend(v30, "item");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "clsIdentifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v35);

          v31 = v36;
        }

        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v57, 16);
    }
    while (v25);
  }

  if (objc_msgSend(v20, "count"))
  {
    v53 = CFSTR("itemIdentifiers");
    v54 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v37);

  }
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v19, CFSTR("sortedObjects"));

  return v39;
}

- (id)timestamp
{
  NSSet *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSSet *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v3 = self->_unclusteredDebugItems;
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "timestamp");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v6)
        {
          objc_msgSend(v6, "earlierDate:", v9);
          v11 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v11;
        }
        else
        {
          v6 = (void *)v9;
        }
      }
      v5 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = self->_debugClusters;
  v13 = -[NSSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "timestamp", (_QWORD)v21);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        if (v6)
        {
          objc_msgSend(v6, "earlierDate:", v17);
          v19 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v19;
        }
        else
        {
          v6 = (void *)v17;
        }
      }
      v14 = -[NSSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v14);
  }

  return v6;
}

- (NSSet)unclusteredDebugItems
{
  return self->_unclusteredDebugItems;
}

- (void)setUnclusteredDebugItems:(id)a3
{
  objc_storeStrong((id *)&self->_unclusteredDebugItems, a3);
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_unclusteredDebugItems, 0);
  objc_storeStrong((id *)&self->_debugClusters, 0);
}

@end
