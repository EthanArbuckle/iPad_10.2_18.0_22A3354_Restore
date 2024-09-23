@implementation MPSGraphViewerNodeRegionSPI

- (MPSGraphViewerNodeRegionSPI)initWithName:(id)a3 returnType:(id)a4 nodes:(id)a5
{
  id v9;
  id v10;
  id v11;
  MPSGraphViewerNodeRegionSPI *v12;
  MPSGraphViewerNodeRegionSPI *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MPSGraphViewerNodeRegionSPI;
  v12 = -[MPSGraphViewerNodeRegionSPI init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_returnType, a4);
    objc_storeStrong((id *)&v13->_nodes, a5);
  }

  return v13;
}

- (MPSGraphViewerNodeRegionSPI)initWithJSONDictionary:(id)a3
{
  id v4;
  MPSGraphViewerNodeRegionSPI *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *returnType;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  MPSGraphViewerNodeSPI *v16;
  MPSGraphViewerNodeSPI *v17;
  uint64_t v18;
  NSArray *nodes;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MPSGraphViewerNodeRegionSPI;
  v5 = -[MPSGraphViewerNodeRegionSPI init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "objectForKey:", CFSTR("returnType"));
    v8 = objc_claimAutoreleasedReturnValue();
    returnType = v5->_returnType;
    v5->_returnType = (NSString *)v8;

    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v4, "objectForKey:", CFSTR("nodes"));
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v22;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v11);
          v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14);
          v16 = [MPSGraphViewerNodeSPI alloc];
          v17 = -[MPSGraphViewerNodeSPI initWithJSONDictionary:](v16, "initWithJSONDictionary:", v15, (_QWORD)v21);
          objc_msgSend(v10, "addObject:", v17);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v12);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v10);
    v18 = objc_claimAutoreleasedReturnValue();
    nodes = v5->_nodes;
    v5->_nodes = (NSArray *)v18;

  }
  return v5;
}

- (id)jsonDictionary
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
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
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[MPSGraphViewerNodeRegionSPI nodes](self, "nodes", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v7), "jsonDictionary");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraphViewerNodeRegionSPI name](self, "name");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("name"));

  -[MPSGraphViewerNodeRegionSPI returnType](self, "returnType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = v11 == 0;

  if ((v10 & 1) == 0)
  {
    -[MPSGraphViewerNodeRegionSPI returnType](self, "returnType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v12, CFSTR("returnType"));

  }
  objc_msgSend(v9, "setObject:forKey:", v3, CFSTR("nodes"));
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)returnType
{
  return self->_returnType;
}

- (NSArray)nodes
{
  return self->_nodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_returnType, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
