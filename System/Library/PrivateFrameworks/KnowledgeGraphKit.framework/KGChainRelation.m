@implementation KGChainRelation

- (KGChainRelation)initWithRelations:(id)a3
{
  id v5;
  KGChainRelation *v6;
  KGChainRelation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KGChainRelation;
  v6 = -[KGChainRelation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_relations, a3);

  return v7;
}

- (id)targetNodeIdentifiersFromSourceNodeIdentifiers:(id)a3 inGraph:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSArray *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = self->_relations;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  v11 = v8;
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v18;
    v11 = v8;
    do
    {
      v14 = 0;
      v15 = v11;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "targetNodeIdentifiersFromSourceNodeIdentifiers:inGraph:", v15, v7, (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        ++v14;
        v15 = v11;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return v11;
}

- (id)inverse
{
  id v3;
  NSUInteger i;
  void *v5;
  void *v6;

  if (-[NSArray count](self->_relations, "count"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    for (i = -[NSArray count](self->_relations, "count") - 1; ; --i)
    {
      -[NSArray objectAtIndex:](self->_relations, "objectAtIndex:", i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "inverse");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v6);

    }
  }
  return self;
}

- (id)adjacencyWithStartNodeIdentifiers:(id)a3 inGraph:(id)a4
{
  id v6;
  id v7;
  KGDirectedBinaryAdjacency *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  KGDirectedBinaryAdjacency *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(KGDirectedBinaryAdjacency);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = self->_relations;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    v13 = 1;
    do
    {
      v14 = 0;
      v15 = v8;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v14);
        if ((v13 & 1) != 0)
          objc_msgSend(v16, "adjacencyWithStartNodeIdentifiers:inGraph:", v6, v7);
        else
          objc_msgSend(v16, "adjacencyByJoiningWithAdjacency:inGraph:", v15, v7, (_QWORD)v18);
        v8 = (KGDirectedBinaryAdjacency *)objc_claimAutoreleasedReturnValue();

        v13 = 0;
        ++v14;
        v15 = v8;
      }
      while (v11 != v14);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v13 = 0;
    }
    while (v11);
  }

  return v8;
}

- (id)adjacencyByJoiningWithAdjacency:(id)a3 inGraph:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSArray *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = self->_relations;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  v11 = v8;
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v18;
    v11 = v8;
    do
    {
      v14 = 0;
      v15 = v11;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "adjacencyByJoiningWithAdjacency:inGraph:", v15, v7, (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        ++v14;
        v15 = v11;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return v11;
}

- (NSArray)relations
{
  return self->_relations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relations, 0);
}

@end
