@implementation KGLabelBasedEntityFactory

- (KGLabelBasedEntityFactory)init
{
  KGLabelBasedEntityFactory *v2;
  uint64_t v3;
  NSMutableDictionary *classByNodeLabels;
  uint64_t v5;
  NSMutableDictionary *classByEdgeLabels;
  uint64_t v7;
  Class defaultNodeClass;
  uint64_t v9;
  Class defaultEdgeClass;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)KGLabelBasedEntityFactory;
  v2 = -[KGLabelBasedEntityFactory init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    classByNodeLabels = v2->_classByNodeLabels;
    v2->_classByNodeLabels = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    classByEdgeLabels = v2->_classByEdgeLabels;
    v2->_classByEdgeLabels = (NSMutableDictionary *)v5;

    objc_opt_class();
    v7 = objc_claimAutoreleasedReturnValue();
    defaultNodeClass = v2->_defaultNodeClass;
    v2->_defaultNodeClass = (Class)v7;

    objc_opt_class();
    v9 = objc_claimAutoreleasedReturnValue();
    defaultEdgeClass = v2->_defaultEdgeClass;
    v2->_defaultEdgeClass = (Class)v9;

  }
  return v2;
}

- (void)registerNodeClass:(Class)a3 forLabels:(id)a4
{
  id v6;
  KGSetWrapper *v7;

  v6 = a4;
  v7 = -[KGSetWrapper initWithArray:]([KGSetWrapper alloc], "initWithArray:", v6);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_classByNodeLabels, "setObject:forKeyedSubscript:", a3, v7);
}

- (void)registerEdgeClass:(Class)a3 forLabels:(id)a4
{
  id v6;
  KGSetWrapper *v7;

  v6 = a4;
  v7 = -[KGSetWrapper initWithArray:]([KGSetWrapper alloc], "initWithArray:", v6);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_classByEdgeLabels, "setObject:forKeyedSubscript:", a3, v7);
}

- (id)_generateAllPossibleLabelSetsForLabels:(id)a3 labelSetsCache:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  KGSetWrapper *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  v11 = -[KGSetWrapper initWithArray:]([KGSetWrapper alloc], "initWithArray:", v6);
  if (objc_msgSend(v8, "containsObject:", v11))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "count") >= 2 && objc_msgSend(v6, "count"))
    {
      v13 = 0;
      do
      {
        v14 = (void *)MEMORY[0x1CAA4B20C]();
        v15 = (void *)objc_msgSend(v6, "mutableCopy");
        objc_msgSend(v15, "removeObjectAtIndex:", v13);
        -[KGLabelBasedEntityFactory _generateAllPossibleLabelSetsForLabels:labelSetsCache:](self, "_generateAllPossibleLabelSetsForLabels:labelSetsCache:", v15, v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "unionSet:", v16);
        objc_msgSend(v10, "unionSet:", v16);

        objc_autoreleasePoolPop(v14);
        ++v13;
      }
      while (v13 < objc_msgSend(v6, "count"));
    }
  }

  return v12;
}

- (Class)_selectClassFromPossibleLabels:(id)a3 dictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  BOOL v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    -[KGLabelBasedEntityFactory _generateAllPossibleLabelSetsForLabels:labelSetsCache:](self, "_generateAllPossibleLabelSetsForLabels:labelSetsCache:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("count"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sortedArrayUsingDescriptors:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v12);
          v18 = objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), (_QWORD)v22);
          if (v15)
            v19 = 1;
          else
            v19 = v18 == 0;
          if (!v19)
            v15 = (void *)v18;
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v14);
    }
    else
    {
      v15 = 0;
    }

    v20 = v15;
  }
  else
  {
    v20 = 0;
  }

  return (Class)v20;
}

- (Class)classForEdgeLabels:(id)a3
{
  id v4;
  KGSetWrapper *v5;
  objc_class *defaultEdgeClass;
  objc_class *v7;

  v4 = a3;
  v5 = -[KGSetWrapper initWithArray:]([KGSetWrapper alloc], "initWithArray:", v4);
  defaultEdgeClass = (objc_class *)-[NSMutableDictionary objectForKeyedSubscript:](self->_classByEdgeLabels, "objectForKeyedSubscript:", v5);
  if (!defaultEdgeClass)
  {
    defaultEdgeClass = -[KGLabelBasedEntityFactory _selectClassFromPossibleLabels:dictionary:](self, "_selectClassFromPossibleLabels:dictionary:", v4, self->_classByEdgeLabels);
    if (!defaultEdgeClass)
      defaultEdgeClass = self->_defaultEdgeClass;
  }
  v7 = defaultEdgeClass;

  return v7;
}

- (Class)classForNodeLabels:(id)a3
{
  id v4;
  KGSetWrapper *v5;
  objc_class *defaultNodeClass;
  objc_class *v7;

  v4 = a3;
  v5 = -[KGSetWrapper initWithArray:]([KGSetWrapper alloc], "initWithArray:", v4);
  defaultNodeClass = (objc_class *)-[NSMutableDictionary objectForKeyedSubscript:](self->_classByNodeLabels, "objectForKeyedSubscript:", v5);
  if (!defaultNodeClass)
  {
    defaultNodeClass = -[KGLabelBasedEntityFactory _selectClassFromPossibleLabels:dictionary:](self, "_selectClassFromPossibleLabels:dictionary:", v4, self->_classByNodeLabels);
    if (!defaultNodeClass)
      defaultNodeClass = self->_defaultNodeClass;
  }
  v7 = defaultNodeClass;

  return v7;
}

- (id)nodeWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5
{
  id v8;
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[KGLabelBasedEntityFactory classForNodeLabels:](self, "classForNodeLabels:", v10);

  v12 = (void *)objc_msgSend([v11 alloc], "initWithIdentifier:labels:properties:", a3, v9, v8);
  return v12;
}

- (id)edgeWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5 sourceNode:(id)a6 targetNode:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  objc_class *v17;
  void *v18;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  objc_msgSend(v15, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[KGLabelBasedEntityFactory classForEdgeLabels:](self, "classForEdgeLabels:", v16);

  v18 = (void *)objc_msgSend([v17 alloc], "initWithIdentifier:labels:properties:sourceNode:targetNode:", a3, v15, v14, v13, v12);
  return v18;
}

- (Class)defaultNodeClass
{
  return self->_defaultNodeClass;
}

- (void)setDefaultNodeClass:(Class)a3
{
  objc_storeStrong((id *)&self->_defaultNodeClass, a3);
}

- (Class)defaultEdgeClass
{
  return self->_defaultEdgeClass;
}

- (void)setDefaultEdgeClass:(Class)a3
{
  objc_storeStrong((id *)&self->_defaultEdgeClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultEdgeClass, 0);
  objc_storeStrong((id *)&self->_defaultNodeClass, 0);
  objc_storeStrong((id *)&self->_classByEdgeLabels, 0);
  objc_storeStrong((id *)&self->_classByNodeLabels, 0);
}

@end
