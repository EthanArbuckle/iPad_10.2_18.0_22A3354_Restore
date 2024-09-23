@implementation MAPaths

- (MAPaths)init
{
  MAPaths *v2;
  uint64_t v3;
  NSMutableArray *paths;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MAPaths;
  v2 = -[MAPaths init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    paths = v2->_paths;
    v2->_paths = (NSMutableArray *)v3;

  }
  return v2;
}

- (id)description
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR("["));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __22__MAPaths_description__block_invoke;
  v6[3] = &unk_1E83E6140;
  v4 = v3;
  v7 = v4;
  -[MAPaths enumerateWithBlock:](self, "enumerateWithBlock:", v6);
  if ((unint64_t)objc_msgSend(v4, "length") >= 2)
    objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 2, 2);
  objc_msgSend(v4, "appendString:", CFSTR("]"));

  return v4;
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_paths, "count");
}

- (id)pathAtIndex:(unint64_t)a3
{
  void *v5;

  if (-[MAPaths count](self, "count") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("MAPathsInvalidIndex"), CFSTR("Out of bounds result path index \"%ld\"), a3);
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_paths, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)addPath:(id)a3
{
  MAPaths *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableArray addObject:](v4->_paths, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)setPaths:(id)a3
{
  id v4;
  MAPaths *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableArray removeAllObjects](v5->_paths, "removeAllObjects");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        -[MAPaths addPath:](v5, "addPath:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)removeAllPaths
{
  MAPaths *obj;

  obj = self;
  objc_sync_enter(obj);
  -[NSMutableArray removeAllObjects](obj->_paths, "removeAllObjects");
  objc_sync_exit(obj);

}

- (id)graphRepresentationWithStrictNodes:(BOOL)a3 strictEdges:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = a4;
  v5 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  +[MAGraph graph](MAGraph, "graph");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = self->_paths;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v13, "graphRepresentation");
        v14 = objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("MAPathsInvalidGraph"), CFSTR("Graph invalid for path \"%@\"), v13);

          v17 = 0;
          goto LABEL_11;
        }
        v15 = (void *)v14;
        v16 = (id)objc_msgSend(v7, "mergeWithGraph:strictNodes:strictEdges:", v14, v5, v4);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v10)
        continue;
      break;
    }
  }

  v17 = v7;
LABEL_11:

  return v17;
}

- (void)enumerateWithBlock:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, char *))a3;
  v14 = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_paths;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v8)
        objc_enumerationMutation(v5);
      v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9), &v14);
      if (v14)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)uniqueNodesForLabel:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
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
  v6 = self->_paths;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "nodesForLabel:", v4, (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)uniqueEdgesForLabel:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
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
  v6 = self->_paths;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "edgesForLabel:", v4, (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paths, 0);
}

void __22__MAPaths_description__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "description");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("%@, "), v3);

}

+ (id)paths
{
  return objc_alloc_init((Class)objc_opt_class());
}

+ (id)pathsWithPaths:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setPaths:", v3);

  return v4;
}

@end
