@implementation _IKDOMPrototypeDerivationRules

+ (id)derivationRulesForDOMElement:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v33;
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
  v34 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    v33 = objc_msgSend(v3, "count");
    if (!v33)
      break;
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObjectAtIndex:", 0);
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(v4, "childElements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v40;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v40 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "nodeName");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("rules"));

          if (v11)
          {
            v6 = v9;
            goto LABEL_13;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_13:

    objc_msgSend(v4, "childElements");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v12);

    if (v6)
      goto LABEL_16;
  }
  v6 = 0;
LABEL_16:
  v13 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v6, "childElements");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayWithCapacity:", objc_msgSend(v14, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v6, "childElements");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(v16);
        +[IKDOMMutationRule mutationRuleWithDOMElement:mutable:](IKDOMMutationRule, "mutationRuleWithDOMElement:mutable:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j), 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          objc_msgSend(v15, "addObject:", v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v18);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parentNode");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (id)v23;
  while (v24 && v24 != v34)
  {
    v25 = v24;
    objc_msgSend(v24, "parentNode");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "childElements");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "indexOfObject:", v25);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "insertObject:atIndex:", v29, 0);

    objc_msgSend(v25, "parentNode");
    v24 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v33)
    v30 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIndexPath:mutationRules:", v22, v15);
  else
    v30 = 0;

  return v30;
}

+ (void)removeRulesFromDOMElement:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "childElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "nodeName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("rules"));

        if (v11)
          v12 = (id)objc_msgSend(v3, "removeChild:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (_IKDOMPrototypeDerivationRules)initWithIndexPath:(id)a3 mutationRules:(id)a4
{
  id v6;
  id v7;
  _IKDOMPrototypeDerivationRules *v8;
  uint64_t v9;
  NSArray *indexPath;
  uint64_t v11;
  NSArray *mutationRules;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_IKDOMPrototypeDerivationRules;
  v8 = -[_IKDOMPrototypeDerivationRules init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    indexPath = v8->_indexPath;
    v8->_indexPath = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    mutationRules = v8->_mutationRules;
    v8->_mutationRules = (NSArray *)v11;

  }
  return v8;
}

- (NSArray)mutationRules
{
  return self->_mutationRules;
}

- (NSArray)indexPath
{
  return self->_indexPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_mutationRules, 0);
}

@end
