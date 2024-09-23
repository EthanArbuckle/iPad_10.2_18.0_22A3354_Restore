@implementation MAUnionRelation

- (MAUnionRelation)initWithRelations:(id)a3
{
  id v5;
  id *v6;
  MAUnionRelation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAUnionRelation;
  v6 = -[MARelation initForSubclassing](&v9, sel_initForSubclassing);
  v7 = (MAUnionRelation *)v6;
  if (v6)
    objc_storeStrong(v6 + 1, a3);

  return v7;
}

- (id)inverse
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  MAUnionRelation *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_relations;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "inverse", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = -[MAUnionRelation initWithRelations:]([MAUnionRelation alloc], "initWithRelations:", v3);
  return v10;
}

- (void)unionAdjacencySetFromSourceNodeIdentifiers:(id)a3 toTargetNodeIdentifiers:(id)a4 graph:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[MAUnionRelation relations](self, "relations", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "unionAdjacencySetFromSourceNodeIdentifiers:toTargetNodeIdentifiers:graph:", v8, v9, v10);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (id)adjacencyWithStartNodeIdentifiers:(id)a3 graph:(id)a4
{
  id v6;
  id v7;
  KGMutableDirectedBinaryAdjacency *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(KGMutableDirectedBinaryAdjacency);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = self->_relations;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "adjacencyWithStartNodeIdentifiers:graph:", v6, v7, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[KGMutableDirectedBinaryAdjacency formUnionWith:](v8, "formUnionWith:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)visualString
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(CFSTR("-{"), "mutableCopy");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_relations;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    v8 = 1;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if ((v8 & 1) == 0)
          objc_msgSend(v3, "appendString:", CFSTR(", "), (_QWORD)v13);
        objc_msgSend(v10, "visualString", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v11);

        v8 = 0;
        ++v9;
      }
      while (v6 != v9);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v8 = 0;
    }
    while (v6);
  }

  objc_msgSend(v3, "appendString:", CFSTR("}"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  MAUnionRelation *v4;
  NSArray *relations;
  void *v6;
  char v7;

  v4 = (MAUnionRelation *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      relations = self->_relations;
      -[MAUnionRelation relations](v4, "relations");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSArray isEqual:](relations, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_relations;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 ^= (v5 << 6)
            + (v5 >> 2)
            + 2654435769u
            + objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "hash", (_QWORD)v9);
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSArray)relations
{
  return self->_relations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relations, 0);
}

+ (id)scanRelationWithScanner:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  MAUnionRelation *v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "scanLocation");
  if ((objc_msgSend(v3, "scanString:intoString:", CFSTR("-{"), 0) & 1) != 0)
  {
    +[MARelation scanRelationWithScanner:](MARelation, "scanRelationWithScanner:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(v3, "setScanLocation:", v4);
      v9 = 0;
      goto LABEL_12;
    }
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v5, 0);
    if (objc_msgSend(v3, "scanString:intoString:", CFSTR(", "), 0))
    {
      while (1)
      {
        +[MARelation scanRelationWithScanner:](MARelation, "scanRelationWithScanner:", v3);
        v7 = objc_claimAutoreleasedReturnValue();
        if (!v7)
          break;
        v8 = (void *)v7;
        objc_msgSend(v6, "addObject:", v7);

        if ((objc_msgSend(v3, "scanString:intoString:", CFSTR(", "), 0) & 1) == 0)
          goto LABEL_6;
      }
    }
    else
    {
LABEL_6:
      if ((objc_msgSend(v3, "scanString:intoString:", CFSTR("}"), 0) & 1) != 0)
      {
        v9 = -[MAUnionRelation initWithRelations:]([MAUnionRelation alloc], "initWithRelations:", v6);
LABEL_10:

LABEL_12:
        goto LABEL_13;
      }
    }
    objc_msgSend(v3, "setScanLocation:", v4);
    v9 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v3, "setScanLocation:", v4);
  v9 = 0;
LABEL_13:

  return v9;
}

@end
