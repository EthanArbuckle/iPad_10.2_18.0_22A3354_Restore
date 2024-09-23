@implementation IKAppPrototype

- (id)dsepm_viewElement
{
  return objc_getAssociatedObject(self, "dsepm_viewElement");
}

- (void)dsepm_setViewElement:(id)a3
{
  objc_setAssociatedObject(self, "dsepm_viewElement", a3, (void *)0x301);
}

- (IKAppPrototype)initWithPrototype:(id)a3 dataItem:(id)a4
{
  id v6;
  id v7;
  IKAppPrototype *v8;
  IKAppPrototype *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDictionary *groupingValues;
  IKAppPrototypeIdentifier *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  IKAppPrototypeIdentifier *identifier;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)IKAppPrototype;
  v8 = -[IKAppPrototype init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_prototype, v6);
    objc_msgSend(v6, "grouping");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v7, "dataDictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "grouping");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKAppPrototype _sparseObjectFromObject:usingPropertyPaths:](v9, "_sparseObjectFromObject:usingPropertyPaths:", v11, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      groupingValues = v9->_groupingValues;
      v9->_groupingValues = (NSDictionary *)v13;

    }
    else
    {
      v11 = v9->_groupingValues;
      v9->_groupingValues = 0;
    }

    v15 = [IKAppPrototypeIdentifier alloc];
    objc_msgSend(v6, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selector");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[IKAppPrototypeIdentifier initWithIdentifier:selector:groupingValues:](v15, "initWithIdentifier:selector:groupingValues:", v16, v17, v9->_groupingValues);
    identifier = v9->_identifier;
    v9->_identifier = (IKAppPrototypeIdentifier *)v18;

  }
  return v9;
}

- (NSIndexSet)usageIndexes
{
  return (NSIndexSet *)(id)-[NSMutableIndexSet copy](self->_usageIndexes, "copy");
}

- (void)addUsageForIndex:(int64_t)a3
{
  NSMutableIndexSet *usageIndexes;
  NSMutableIndexSet *v6;
  NSMutableIndexSet *v7;

  usageIndexes = self->_usageIndexes;
  if (!usageIndexes)
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v6 = (NSMutableIndexSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_usageIndexes;
    self->_usageIndexes = v6;

    usageIndexes = self->_usageIndexes;
  }
  -[NSMutableIndexSet addIndex:](usageIndexes, "addIndex:", a3);
}

- (void)removeUsageForIndex:(int64_t)a3
{
  -[NSMutableIndexSet removeIndex:](self->_usageIndexes, "removeIndex:", a3);
}

- (void)updateUsageIndexesWithChangeSet:(id)a3
{
  id v4;
  void *v5;
  NSMutableIndexSet *usageIndexes;
  NSMutableIndexSet *v7;
  NSMutableIndexSet *v8;
  NSMutableIndexSet *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  NSMutableIndexSet *v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  usageIndexes = self->_usageIndexes;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__IKAppPrototype_updateUsageIndexesWithChangeSet___block_invoke;
  v11[3] = &unk_1E9F4F910;
  v12 = v4;
  v7 = v5;
  v13 = v7;
  v10 = v4;
  -[NSMutableIndexSet enumerateIndexesUsingBlock:](usageIndexes, "enumerateIndexesUsingBlock:", v11);
  v8 = self->_usageIndexes;
  self->_usageIndexes = v7;
  v9 = v7;

}

uint64_t __50__IKAppPrototype_updateUsageIndexesWithChangeSet___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "newIndexForOldIndex:", a2);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
    return objc_msgSend(*(id *)(a1 + 40), "addIndex:", result);
  return result;
}

- (id)_sparseObjectFromObject:(id)a3 usingPropertyPaths:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v45;
  void *v46;
  void *v47;
  id obj;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (objc_msgSend(v6, "count"))
    {
      v46 = v5;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v45 = v6;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v59 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
            objc_msgSend(v13, "accessorSequence");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "firstObject");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v7, "objectForKeyedSubscript:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v16)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, v15);
            }
            objc_msgSend(v13, "propertyPathByRemovingFirstAccessor");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObject:", v17);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
        }
        while (v10);
      }

      objc_opt_class();
      v5 = v46;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = v46;
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v18, "count"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "count"))
        {
          v20 = 0;
          v21 = MEMORY[0x1E0C9AA70];
          do
          {
            objc_msgSend(v19, "addObject:", v21);
            ++v20;
          }
          while (v20 < objc_msgSend(v18, "count"));
        }
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        objc_msgSend(v7, "allKeys");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
        if (!v22)
          goto LABEL_42;
        v23 = v22;
        v24 = v18;
        v47 = v19;
        v25 = *(_QWORD *)v55;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v55 != v25)
              objc_enumerationMutation(obj);
            v27 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v28 = objc_msgSend(v27, "subscriptIndex");
              objc_msgSend(v24, "objectAtIndexedSubscript:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "objectForKeyedSubscript:", v27);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[IKAppPrototype _sparseObjectFromObject:usingPropertyPaths:](self, "_sparseObjectFromObject:usingPropertyPaths:", v29, v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v47, "setObject:atIndexedSubscript:", v31, v28);
            }
          }
          v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
        }
        while (v23);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v32 = (id)MEMORY[0x1E0C9AA70];
          goto LABEL_44;
        }
        v34 = v46;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v34, "count"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        objc_msgSend(v7, "allKeys");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
        if (!v35)
        {
LABEL_42:

          v32 = (id)objc_msgSend(v19, "copy");
LABEL_44:
          v6 = v45;

          goto LABEL_45;
        }
        v36 = v35;
        v47 = v19;
        v37 = *(_QWORD *)v51;
        do
        {
          for (k = 0; k != v36; ++k)
          {
            if (*(_QWORD *)v51 != v37)
              objc_enumerationMutation(obj);
            v39 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v39, "property");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "objectForKeyedSubscript:", v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "objectForKeyedSubscript:", v39);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              -[IKAppPrototype _sparseObjectFromObject:usingPropertyPaths:](self, "_sparseObjectFromObject:usingPropertyPaths:", v41, v42);
              v43 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v47, "setObject:forKeyedSubscript:", v43, v40);
            }
          }
          v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
        }
        while (v36);
      }
      v5 = v46;
      v19 = v47;
      goto LABEL_42;
    }
    v32 = 0;
  }
  else
  {
    v33 = (void *)MEMORY[0x1E0C9AA70];
    if (v5)
      v33 = v5;
    v32 = v33;
  }
LABEL_45:

  return v32;
}

- (IKAppPrototypeIdentifier)identifier
{
  return self->_identifier;
}

- (IKDOMPrototype)prototype
{
  return (IKDOMPrototype *)objc_loadWeakRetained((id *)&self->_prototype);
}

- (NSDictionary)groupingValues
{
  return self->_groupingValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupingValues, 0);
  objc_destroyWeak((id *)&self->_prototype);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_usageIndexes, 0);
}

@end
