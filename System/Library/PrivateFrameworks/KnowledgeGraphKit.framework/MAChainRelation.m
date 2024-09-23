@implementation MAChainRelation

- (MAChainRelation)initWithSteps:(id)a3
{
  id v5;
  id *v6;
  MAChainRelation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAChainRelation;
  v6 = -[MARelation initForSubclassing](&v9, sel_initForSubclassing);
  v7 = (MAChainRelation *)v6;
  if (v6)
    objc_storeStrong(v6 + 1, a3);

  return v7;
}

- (id)inverse
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  MAChainRelation *v10;
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
  -[NSArray reverseObjectEnumerator](self->_steps, "reverseObjectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "inverse");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = -[MAChainRelation initWithSteps:]([MAChainRelation alloc], "initWithSteps:", v3);
  return v10;
}

- (void)unionAdjacencySetFromSourceNodeIdentifiers:(id)a3 toTargetNodeIdentifiers:(id)a4 graph:(id)a5
{
  id v8;
  id v9;
  KGMutableElementIdentifierSet *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  KGMutableElementIdentifierSet *v16;
  void *v17;
  void *v18;
  id v19;
  KGMutableElementIdentifierSet *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v19 = a4;
  v9 = a5;
  v10 = (KGMutableElementIdentifierSet *)v8;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = self->_steps;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  v20 = v10;
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      v15 = 0;
      v16 = v10;
      do
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v15);
        v18 = (void *)MEMORY[0x1CAA4B20C]();
        v10 = objc_alloc_init(KGMutableElementIdentifierSet);
        objc_msgSend(v17, "unionAdjacencySetFromSourceNodeIdentifiers:toTargetNodeIdentifiers:graph:", v16, v10, v9);

        objc_autoreleasePoolPop(v18);
        ++v15;
        v16 = v10;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  objc_msgSend(v19, "unionWithIdentifierSet:", v10);
}

- (id)adjacencyWithStartNodeIdentifiers:(id)a3 graph:(id)a4
{
  id v6;
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = self->_steps;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v9)
  {

LABEL_14:
    +[KGDirectedBinaryAdjacency identityWith:](KGDirectedBinaryAdjacency, "identityWith:", v6, (_QWORD)v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v10 = v9;
  v11 = 0;
  v12 = *(_QWORD *)v18;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v18 != v12)
        objc_enumerationMutation(v8);
      v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
      if (v11)
      {
        objc_msgSend(v14, "adjacencyByJoiningWithAdjacency:graph:", v11, v7);
        v15 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v15;
      }
      else
      {
        objc_msgSend(v14, "adjacencyWithStartNodeIdentifiers:graph:", v6, v7, (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  }
  while (v10);

  if (!v11)
    goto LABEL_14;
LABEL_15:

  return v11;
}

- (id)adjacencyByJoiningWithAdjacency:(id)a3 graph:(id)a4
{
  id v6;
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_steps;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      v13 = v6;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "adjacencyByJoiningWithAdjacency:graph:", v13, v7, (_QWORD)v15);
        v6 = (id)objc_claimAutoreleasedReturnValue();

        ++v12;
        v13 = v6;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v6;
}

- (id)visualString
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_steps;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "visualString", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  MAChainRelation *v4;
  NSArray *steps;
  void *v6;
  char v7;

  v4 = (MAChainRelation *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      steps = self->_steps;
      -[MAChainRelation steps](v4, "steps");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSArray isEqual:](steps, "isEqual:", v6);

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
  v2 = self->_steps;
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

- (NSArray)steps
{
  return self->_steps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_steps, 0);
}

+ (id)scanRelationWithScanner:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  MAChainRelation *v9;
  MAChainRelation *v10;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[MARelation _scanNonChainRelationWithScanner:](MARelation, "_scanNonChainRelationWithScanner:", v3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      objc_msgSend(v4, "addObject:", v6);
      +[MARelation _scanNonChainRelationWithScanner:](MARelation, "_scanNonChainRelationWithScanner:", v3);
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    while (v7);
  }
  v8 = objc_msgSend(v4, "count");
  if (v8)
  {
    if (v8 == 1)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v9 = (MAChainRelation *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = -[MAChainRelation initWithSteps:]([MAChainRelation alloc], "initWithSteps:", v4);
    }
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
