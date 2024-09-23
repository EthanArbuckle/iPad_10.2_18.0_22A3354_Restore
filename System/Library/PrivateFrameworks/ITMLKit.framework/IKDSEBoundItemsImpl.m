@implementation IKDSEBoundItemsImpl

- (IKDSEBoundItemsImpl)initWithDataSourceElement:(id)a3
{
  id v4;
  IKDSEBoundItemsImpl *v5;
  IKDSEBoundItemsImpl *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IKDSEBoundItemsImpl;
  v5 = -[IKDSEBoundItemsImpl init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_dataSourceElement, v4);

  return v6;
}

- (NSString)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKDSEBoundItemsImpl visibleIndexSet](self, "visibleIndexSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, visibleIndexSet = %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSArray)prototypes
{
  void *v3;
  void *v4;

  -[IKDSEBoundItemsImpl _initializePrototypeBundleIfNeeded](self, "_initializePrototypeBundleIfNeeded");
  -[IKDSEBoundItemsImpl prototypeBundle](self, "prototypeBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allPrototypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (int64_t)numberOfItems
{
  void *v2;
  void *v3;
  int64_t v4;

  -[IKDSEBoundItemsImpl dataSet](self, "dataSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)prototypeForItemAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;

  -[IKDSEBoundItemsImpl _initializePrototypeBundleIfNeeded](self, "_initializePrototypeBundleIfNeeded");
  -[IKDSEBoundItemsImpl prototypeBundle](self, "prototypeBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prototypeForItemAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)elementForItemAtIndex:(int64_t)a3
{
  void *v5;
  id v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__20;
  v13 = __Block_byref_object_dispose__20;
  v14 = 0;
  -[IKDSEBoundItemsImpl dataSourceElement](self, "dataSourceElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__IKDSEBoundItemsImpl_elementForItemAtIndex___block_invoke;
  v8[3] = &unk_1E9F4E3C0;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = a3;
  objc_msgSend(v5, "performImplicitUpdates:", v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __45__IKDSEBoundItemsImpl_elementForItemAtIndex___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_elementForItemAtIndex:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (int64_t)indexOfItemForElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int64_t v9;

  objc_msgSend(a3, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("itemID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "length");

    if (!v7)
    {
      v9 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_7;
    }
    -[IKDSEBoundItemsImpl dataSet](self, "dataSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "indexOfObject:", v6);

  }
  else
  {
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

LABEL_7:
  return v9;
}

- (NSDictionary)indexTitles
{
  void *v2;
  void *v3;

  -[IKDSEBoundItemsImpl dataSet](self, "dataSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexTitles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)unloadIndex:(int64_t)a3
{
  id v4;

  -[IKDSEBoundItemsImpl visibleIndexSet](self, "visibleIndexSet");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeIndex:", a3);

}

- (void)initializeWithElementFactory:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  IKDSEBoundItemsImpl *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  -[IKDSEBoundItemsImpl dataSourceElement](self, "dataSourceElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v4, "updateType");
  -[IKDSEBoundItemsImpl dataSourceElement](self, "dataSourceElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "domElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = v7;
  objc_msgSend(v7, "domib_appDataSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKDSEBoundItemsImpl setDataSet:](self, "setDataSet:", v8);

  v37 = self;
  -[IKDSEBoundItemsImpl dataSet](self, "dataSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "usedPrototypesByIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v35 = v10;
  objc_msgSend(v10, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v44 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v17, "usageIndexes");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

        if (v19)
        {
          +[IKDSEPrototypeMapping prototypeMappingFromAppPrototype:dataSourceElement:elementFactory:](IKDSEPrototypeMapping, "prototypeMappingFromAppPrototype:dataSourceElement:elementFactory:", v17, v4, v38);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, v21);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v14);
  }

  -[IKDSEBoundItemsImpl setUsedPrototypeMappingsByIdentifier:](v37, "setUsedPrototypeMappingsByIdentifier:", v11);
  if ((v33 & 0xFFFFFFFFFFFFFFFBLL) == 0)
  {
    v34 = v4;
    objc_msgSend(v4, "unfilteredChildren");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v24 = v22;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v40 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
          objc_msgSend(v29, "attributes");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("itemID"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v31, "length"))
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v29, v31);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v26);
    }

    v32 = (void *)objc_msgSend(v23, "copy");
    -[IKDSEBoundItemsImpl setChildrenByItemID:](v37, "setChildrenByItemID:", v32);

    v4 = v34;
  }

}

- (void)configureUpdatesWithImplementation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  IKChangeSet *v19;
  uint64_t v20;
  id v21;

  -[IKDSEBoundItemsImpl dataSourceElement](self, "dataSourceElement", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindingController");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "domElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "domib_itemsChangeSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKDSEBoundItemsImpl dataSourceElement](self, "dataSourceElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "updateType");

    if (v9 == 4)
    {
      -[IKDSEBoundItemsImpl dataSet](self, "dataSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "items");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v12)
      {
        v13 = 0;
        do
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v14, v15);

          ++v13;
          -[IKDSEBoundItemsImpl dataSet](self, "dataSet");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "items");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "count");

        }
        while (v13 < v18);
      }
      v19 = -[IKChangeSet initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:]([IKChangeSet alloc], "initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:", 0, 0, 0, v7);
      objc_msgSend(v6, "changeSetByConcatenatingChangeSet:", v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v20;
    }

  }
  -[IKDSEBoundItemsImpl setItemsChangeSet:](self, "setItemsChangeSet:", v6);

}

- (void)applyUpdatesWithImplementation:(id)a3 usingUpdater:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  void *v55;
  IKChangeSet *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t k;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  IKDSEBoundItemsImpl *v76;
  void *v77;
  void *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint8_t v91[128];
  uint8_t buf[4];
  void *v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = v6;
  objc_msgSend(v8, "dataSourceElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "updateType");

  -[IKDSEBoundItemsImpl setPrototypeBundle:](self, "setPrototypeBundle:", 0);
  v73 = (void *)objc_opt_new();
  objc_msgSend(v8, "itemsChangeSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKDSEBoundItemsImpl visibleIndexSet](self, "visibleIndexSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v74 = v11;
  v76 = self;
  if (v11)
  {

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKDSEBoundItemsImpl visibleIndexSet](self, "visibleIndexSet");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "firstIndex");

      while (v16 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v17 = objc_msgSend(v11, "newIndexForOldIndex:", v16);
        if (v17 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v18 = v17;
          objc_msgSend(v14, "addIndex:", v17);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "setObject:forKeyedSubscript:", v19, v20);

          v11 = v74;
        }
        -[IKDSEBoundItemsImpl visibleIndexSet](self, "visibleIndexSet");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v21, "indexGreaterThanIndex:", v16);

      }
      -[IKDSEBoundItemsImpl setVisibleIndexSet:](self, "setVisibleIndexSet:", v14);

    }
    objc_msgSend(v11, "removedIndexes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "mutableCopy");
    v24 = v23;
    if (v23)
    {
      v25 = v23;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    v26 = v25;

    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    objc_msgSend(v11, "updatedIndexesByNewIndex");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "allValues");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v88;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v88 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(v26, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * i), "integerValue"));
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
      }
      while (v30);
    }

    -[IKDSEBoundItemsImpl proxiedItemElementsByItemID](self, "proxiedItemElementsByItemID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKDSEBoundItemsImpl dataSet](self, "dataSet");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "itemIDs");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectsAtIndexes:", v26);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "removeObjectsForKeys:", v36);

    self = v76;
  }
  else
  {
    objc_msgSend(v12, "removeAllIndexes");

    -[IKDSEBoundItemsImpl proxiedItemElementsByItemID](self, "proxiedItemElementsByItemID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "removeAllObjects");
  }

  if ((v10 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    objc_msgSend(v8, "dataSet");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKDSEBoundItemsImpl setDataSet:](self, "setDataSet:", v37);

  }
  v7[2](v7);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if ((v10 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    v72 = v8;
    v40 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(v38, "unfilteredChildren");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "dictionaryWithCapacity:", objc_msgSend(v41, "count"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v71 = v39;
    objc_msgSend(v39, "unfilteredChildren");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v84;
      do
      {
        for (j = 0; j != v44; ++j)
        {
          if (*(_QWORD *)v84 != v45)
            objc_enumerationMutation(v42);
          v47 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * j);
          objc_msgSend(v47, "attributes");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("itemID"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v49, "length"))
          {
            objc_msgSend(v77, "setObject:forKeyedSubscript:", v47, v49);
            if (objc_msgSend(v47, "updateType"))
            {
              -[IKDSEBoundItemsImpl dataSet](v76, "dataSet");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "itemIDs");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = objc_msgSend(v51, "indexOfObject:", v49);

              if (v52 == 0x7FFFFFFFFFFFFFFFLL)
              {
                ITMLKitGetLogObject(0);
                v53 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v93 = v49;
                  _os_log_error_impl(&dword_1D95F2000, v53, OS_LOG_TYPE_ERROR, "child element not found in data set: %@", buf, 0xCu);
                }

              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v52);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v52);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "setObject:forKey:", v54, v55);

            }
          }

        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
      }
      while (v44);
    }

    -[IKDSEBoundItemsImpl setChildrenByItemID:](v76, "setChildrenByItemID:", v77);
    v56 = -[IKChangeSet initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:]([IKChangeSet alloc], "initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:", 0, 0, 0, v75);
    if (v74)
    {
      objc_msgSend(v74, "changeSetByConcatenatingChangeSet:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKDSEBoundItemsImpl setItemsChangeSet:](v76, "setItemsChangeSet:", v57);

    }
    else
    {
      -[IKDSEBoundItemsImpl setItemsChangeSet:](v76, "setItemsChangeSet:", v56);
    }
    objc_msgSend(v72, "usedPrototypeMappingsByIdentifier");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    objc_msgSend(v59, "allValues");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
    if (v61)
    {
      v62 = v61;
      v63 = *(_QWORD *)v80;
      do
      {
        for (k = 0; k != v62; ++k)
        {
          if (*(_QWORD *)v80 != v63)
            objc_enumerationMutation(v60);
          v65 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * k);
          -[IKDSEBoundItemsImpl dataSourceElement](v76, "dataSourceElement");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "viewElement");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "adoptElement:", v67);

        }
        v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
      }
      while (v62);
    }

    -[IKDSEBoundItemsImpl setUsedPrototypeMappingsByIdentifier:](v76, "setUsedPrototypeMappingsByIdentifier:", v59);
    -[IKDSEBoundItemsImpl proxiedItemElementsByItemID](v76, "proxiedItemElementsByItemID");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKDSEBoundItemsImpl childrenByItemID](v76, "childrenByItemID");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "allKeys");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "removeObjectsForKeys:", v70);

    v8 = v72;
    v58 = v74;
    v39 = v71;

  }
  else
  {
    v58 = v74;
    if (v10 == 4)
    {
      -[IKDSEBoundItemsImpl visibleIndexSet](self, "visibleIndexSet");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setVisibleIndexSet:");

    }
  }

}

- (void)updateStylesUsingUpdater:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t k;
  void *v20;
  void *v21;
  IKChangeSet *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  -[IKDSEBoundItemsImpl setPrototypeBundle:](self, "setPrototypeBundle:", 0);
  v4[2](v4);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[IKDSEBoundItemsImpl prototypes](self, "prototypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "appDocumentDidMarkStylesDirty");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v7);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[IKDSEBoundItemsImpl proxiedItemElements](self, "proxiedItemElements", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "appDocumentDidMarkStylesDirty");
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v12);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKDSEBoundItemsImpl visibleIndexSet](self, "visibleIndexSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = objc_msgSend(v16, "firstIndex");
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (k = v18; k != 0x7FFFFFFFFFFFFFFFLL; k = objc_msgSend(v17, "indexGreaterThanIndex:", k))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", k);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", k);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKey:", v20, v21);

      }
    }
  }
  v22 = -[IKChangeSet initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:]([IKChangeSet alloc], "initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:", 0, 0, 0, v15);
  -[IKDSEBoundItemsImpl itemsChangeSet](self, "itemsChangeSet");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    -[IKDSEBoundItemsImpl itemsChangeSet](self, "itemsChangeSet");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "changeSetByConcatenatingChangeSet:", v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKDSEBoundItemsImpl setItemsChangeSet:](self, "setItemsChangeSet:", v25);

  }
  else
  {
    -[IKDSEBoundItemsImpl setItemsChangeSet:](self, "setItemsChangeSet:", v22);
  }

}

- (void)resetUpdates
{
  -[IKDSEBoundItemsImpl setItemsChangeSet:](self, "setItemsChangeSet:", 0);
}

- (NSArray)masterPrototypes
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  -[IKDSEBoundItemsImpl usedPrototypeMappingsByIdentifier](self, "usedPrototypeMappingsByIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "viewElement", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
    v11 = (void *)objc_msgSend(v4, "copy");
  else
    v11 = 0;

  return (NSArray *)v11;
}

- (NSArray)proxiedItemElements
{
  void *v2;
  void *v3;

  -[IKDSEBoundItemsImpl proxiedItemElementsByItemID](self, "proxiedItemElementsByItemID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)masterPrototypeForItemAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[IKDSEBoundItemsImpl _prototypeMappingForItemAtIndex:](self, "_prototypeMappingForItemAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)resetImplicitUpdates
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[IKDSEBoundItemsImpl proxiedItemElements](self, "proxiedItemElements", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "resetImplicitUpdates");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)proxyElementForLoadedChildElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "_canProxiedItemElementsBeUpdatedWithLoadedElements"))
  {
    objc_msgSend(v4, "attributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("itemID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[IKDSEBoundItemsImpl proxiedItemElementsByItemID](self, "proxiedItemElementsByItemID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)canProxyUnloadedChildElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  objc_msgSend(a3, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("itemID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKDSEBoundItemsImpl dataSet](self, "dataSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v5);

  return v8;
}

+ (BOOL)_canProxiedItemElementsBeUpdatedWithLoadedElements
{
  if (_canProxiedItemElementsBeUpdatedWithLoadedElements_onceToken != -1)
    dispatch_once(&_canProxiedItemElementsBeUpdatedWithLoadedElements_onceToken, &__block_literal_global_41);
  return _canProxiedItemElementsBeUpdatedWithLoadedElements_canProxiedItemElementsBeUpdatedWithActualElements;
}

void __73__IKDSEBoundItemsImpl__canProxiedItemElementsBeUpdatedWithLoadedElements__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _canProxiedItemElementsBeUpdatedWithLoadedElements_canProxiedItemElementsBeUpdatedWithActualElements = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.TVHomeSharing")) ^ 1;

}

- (id)_prototypeMappingForItemAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[IKDSEBoundItemsImpl dataSet](self, "dataSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKDSEBoundItemsImpl usedPrototypeMappingsByIdentifier](self, "usedPrototypeMappingsByIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "prototypeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_elementForItemAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  -[IKDSEBoundItemsImpl dataSet](self, "dataSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKDSEBoundItemsImpl childrenByItemID](self, "childrenByItemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[IKDSEBoundItemsImpl proxiedItemElementsByItemID](self, "proxiedItemElementsByItemID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      -[IKDSEBoundItemsImpl _prototypeMappingForItemAtIndex:](self, "_prototypeMappingForItemAtIndex:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "viewElement");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_alloc((Class)objc_opt_class());
      -[IKDSEBoundItemsImpl dataSourceElement](self, "dataSourceElement");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v15, "initWithPrototypeElement:parent:appDataItem:", v14, v16, v7);

      -[IKDSEBoundItemsImpl proxiedItemElementsByItemID](self, "proxiedItemElementsByItemID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[IKDSEBoundItemsImpl setProxiedItemElementsByItemID:](self, "setProxiedItemElementsByItemID:", v18);

      }
      -[IKDSEBoundItemsImpl proxiedItemElementsByItemID](self, "proxiedItemElementsByItemID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v10, v20);

    }
  }

  return v10;
}

- (void)_appendVisibleIndexSetWithIndex:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  _QWORD *v21;
  id v22;
  _QWORD v23[6];
  id v24;
  id location;
  _QWORD v26[6];

  -[IKDSEBoundItemsImpl dataSet](self, "dataSet");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[IKDSEBoundItemsImpl visibleIndexSet](self, "visibleIndexSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsIndex:", a3);

    if ((v8 & 1) == 0)
    {
      -[IKDSEBoundItemsImpl visibleIndexSet](self, "visibleIndexSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v10 = objc_alloc_init(MEMORY[0x1E0CB3788]);
        -[IKDSEBoundItemsImpl setVisibleIndexSet:](self, "setVisibleIndexSet:", v10);

      }
      -[IKDSEBoundItemsImpl visibleIndexSet](self, "visibleIndexSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addIndex:", a3);

      if (!self->_visibleIndexRangeIsDirty)
      {
        self->_visibleIndexRangeIsDirty = 1;
        v26[0] = 0;
        v26[1] = v26;
        v26[2] = 0x3010000000;
        v26[4] = 0;
        v26[5] = 0;
        v26[3] = &unk_1D96B5DDD;
        objc_initWeak(&location, self);
        v12 = MEMORY[0x1E0C809B0];
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __55__IKDSEBoundItemsImpl__appendVisibleIndexSetWithIndex___block_invoke;
        v23[3] = &unk_1E9F4E408;
        objc_copyWeak(&v24, &location);
        v23[4] = self;
        v23[5] = v26;
        v13 = (void *)MEMORY[0x1DF092410](v23);
        v17 = v12;
        v18 = 3221225472;
        v19 = __55__IKDSEBoundItemsImpl__appendVisibleIndexSetWithIndex___block_invoke_2;
        v20 = &unk_1E9F4E430;
        objc_copyWeak(&v22, &location);
        v21 = v26;
        v14 = (void *)MEMORY[0x1DF092410](&v17);
        -[IKDSEBoundItemsImpl dataSourceElement](self, "dataSourceElement", v17, v18, v19, v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "bindingController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "scheduleUpdateUsingPreUpdate:update:", v13, v14);

        objc_destroyWeak(&v22);
        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);
        _Block_object_dispose(v26, 8);
      }
    }
  }
}

uint64_t __55__IKDSEBoundItemsImpl__appendVisibleIndexSetWithIndex___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "visibleIndexSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    objc_msgSend(*(id *)(a1 + 32), "dataSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "cyclicRangeForItemCount:includeAllIndexes:", objc_msgSend(v7, "count"), 1);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v9 + 32) = v8;
    *(_QWORD *)(v9 + 40) = v10;

    v3[8] = 0;
  }

  return 1;
}

void __55__IKDSEBoundItemsImpl__appendVisibleIndexSetWithIndex___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_msgSend(WeakRetained, "dataSourceElement");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bindingController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "domElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(_QWORD *)(v6 + 32) != objc_msgSend(v5, "domib_visibleIndexRange") || *(_QWORD *)(v6 + 40) != v7)
    {
      objc_msgSend(v5, "domib_setVisibleIndexRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
      objc_msgSend(v5, "childrenUpdatedWithUpdatedChildNodes:notify:", 0, 0);
    }

    WeakRetained = v9;
  }

}

- (void)_initializePrototypeBundleIfNeeded
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[IKDSEBoundItemsImpl prototypeBundle](self, "prototypeBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[IKDSEBoundItemsImpl dataSourceElement](self, "dataSourceElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __57__IKDSEBoundItemsImpl__initializePrototypeBundleIfNeeded__block_invoke;
    v5[3] = &unk_1E9F4BD18;
    v5[4] = self;
    objc_msgSend(v4, "performImplicitUpdates:", v5);

  }
}

void __57__IKDSEBoundItemsImpl__initializePrototypeBundleIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "usedPrototypeMappingsByIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v21 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v23;
    v5 = 0x1E0CB3000uLL;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        v7 = v5;
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v8, "viewElement");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "usageIndexes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "style");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "prototype");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("abstract"));

        if (v13)
        {
          v14 = objc_msgSend(v10, "firstIndex");
          v5 = v7;
          if (v14 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v15 = v14;
            do
            {
              objc_msgSend(*(id *)(a1 + 32), "_elementForItemAtIndex:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v5 + 1720), "indexSetWithIndex:", v15);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v2, "addPrototype:forIndexes:", v16, v17);

              v5 = v7;
              objc_msgSend(v8, "usageIndexes");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v18, "indexGreaterThanIndex:", v15);

            }
            while (v15 != 0x7FFFFFFFFFFFFFFFLL);
          }
        }
        else
        {
          objc_msgSend(v2, "addPrototype:forIndexes:", v9, v10);
          v5 = v7;
        }

      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v21);
  }

  objc_msgSend(*(id *)(a1 + 32), "setPrototypeBundle:", v2);
}

- (IKDataSourceElement)dataSourceElement
{
  return (IKDataSourceElement *)objc_loadWeakRetained((id *)&self->_dataSourceElement);
}

- (IKChangeSet)itemsChangeSet
{
  return self->_itemsChangeSet;
}

- (void)setItemsChangeSet:(id)a3
{
  objc_storeStrong((id *)&self->_itemsChangeSet, a3);
}

- (IKAppDataSet)dataSet
{
  return self->_dataSet;
}

- (void)setDataSet:(id)a3
{
  objc_storeStrong((id *)&self->_dataSet, a3);
}

- (NSDictionary)usedPrototypeMappingsByIdentifier
{
  return self->_usedPrototypeMappingsByIdentifier;
}

- (void)setUsedPrototypeMappingsByIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (_IKDSEPrototypeBundle)prototypeBundle
{
  return self->_prototypeBundle;
}

- (void)setPrototypeBundle:(id)a3
{
  objc_storeStrong((id *)&self->_prototypeBundle, a3);
}

- (NSDictionary)childrenByItemID
{
  return self->_childrenByItemID;
}

- (void)setChildrenByItemID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSMutableIndexSet)visibleIndexSet
{
  return self->_visibleIndexSet;
}

- (void)setVisibleIndexSet:(id)a3
{
  objc_storeStrong((id *)&self->_visibleIndexSet, a3);
}

- (NSMutableDictionary)proxiedItemElementsByItemID
{
  return self->_proxiedItemElementsByItemID;
}

- (void)setProxiedItemElementsByItemID:(id)a3
{
  objc_storeStrong((id *)&self->_proxiedItemElementsByItemID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxiedItemElementsByItemID, 0);
  objc_storeStrong((id *)&self->_visibleIndexSet, 0);
  objc_storeStrong((id *)&self->_childrenByItemID, 0);
  objc_storeStrong((id *)&self->_prototypeBundle, 0);
  objc_storeStrong((id *)&self->_usedPrototypeMappingsByIdentifier, 0);
  objc_storeStrong((id *)&self->_dataSet, 0);
  objc_storeStrong((id *)&self->_itemsChangeSet, 0);
  objc_destroyWeak((id *)&self->_dataSourceElement);
}

@end
