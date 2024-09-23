@implementation MPSGraphViewerSPI

- (MPSGraphViewerSPI)initWithName:(id)a3 nodes:(id)a4
{
  id v7;
  id v8;
  MPSGraphViewerSPI *v9;
  MPSGraphViewerSPI *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPSGraphViewerSPI;
  v9 = -[MPSGraphViewerSPI init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_nodes, a4);
  }

  return v10;
}

- (MPSGraphViewerSPI)initWithJSONDictionary:(id)a3
{
  id v4;
  MPSGraphViewerSPI *v5;
  uint64_t v6;
  NSString *name;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  MPSGraphViewerNodeSPI *v14;
  MPSGraphViewerNodeSPI *v15;
  uint64_t v16;
  NSArray *nodes;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MPSGraphViewerSPI;
  v5 = -[MPSGraphViewerSPI init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v4, "objectForKey:", CFSTR("nodes"));
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v20;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v9);
          v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12);
          v14 = [MPSGraphViewerNodeSPI alloc];
          v15 = -[MPSGraphViewerNodeSPI initWithJSONDictionary:](v14, "initWithJSONDictionary:", v13, (_QWORD)v19);
          objc_msgSend(v8, "addObject:", v15);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v10);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v8);
    v16 = objc_claimAutoreleasedReturnValue();
    nodes = v5->_nodes;
    v5->_nodes = (NSArray *)v16;

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
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[2];
  _QWORD v17[2];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[MPSGraphViewerSPI nodes](self, "nodes", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7), "jsonDictionary");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v5);
  }

  v16[0] = CFSTR("name");
  -[MPSGraphViewerSPI name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("nodes");
  v17[0] = v9;
  v17[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)nodes
{
  return self->_nodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
