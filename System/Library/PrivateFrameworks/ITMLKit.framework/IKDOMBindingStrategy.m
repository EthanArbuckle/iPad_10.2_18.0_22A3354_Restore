@implementation IKDOMBindingStrategy

- (IKDOMBindingStrategy)initWithDOMBindingController:(id)a3 itemsBindingKey:(id)a4
{
  id v6;
  id v7;
  IKDOMBindingStrategy *v8;
  IKDOMBindingStrategy *v9;
  uint64_t v10;
  NSString *itemsBindingKey;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IKDOMBindingStrategy;
  v8 = -[IKDOMBindingStrategy init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_domBindingController, v6);
    v10 = objc_msgSend(v7, "copy");
    itemsBindingKey = v9->_itemsBindingKey;
    v9->_itemsBindingKey = (NSString *)v10;

  }
  return v9;
}

- (NSArray)items
{
  void *v2;
  void *v3;
  void *v4;

  -[IKDOMBindingStrategy domBindingController](self, "domBindingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dombs_items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)keysAffectingChildren
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[IKDOMBindingStrategy itemsBindingKey](self, "itemsBindingKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)prototypeDependentKeys
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[IKDOMBindingStrategy itemsBindingKey](self, "itemsBindingKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)valueDidChangeForKey:(id)a3 propertyPath:(id)a4 extraInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[IKDOMBindingStrategy itemsBindingKey](self, "itemsBindingKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "isEqualToString:", v11);

  if (v12)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("changeSet"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[IKDOMBindingStrategy sourceItemsChangeSet](self, "sourceItemsChangeSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        -[IKDOMBindingStrategy sourceItemsChangeSet](self, "sourceItemsChangeSet");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "changeSetByConcatenatingChangeSet:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[IKDOMBindingStrategy setSourceItemsChangeSet:](self, "setSourceItemsChangeSet:", v16);

      }
      -[IKDOMBindingStrategy updatedItemIDs](self, "updatedItemIDs");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v36 = v8;
        -[IKDOMBindingStrategy domBindingController](self, "domBindingController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "dataItem");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v9;
        objc_msgSend(v19, "valueForPropertyPath:boxed:", v9, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[IKJSDataObservable toDataObservable:](IKJSDataSource, "toDataObservable:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v34 = v13;
        objc_msgSend(v13, "updatedIndexesByNewIndex");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "allKeys");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v38;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v38 != v26)
                objc_enumerationMutation(v23);
              objc_msgSend(v21, "valuesForSubscripts:boxed:", objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "integerValue"), 1, 1);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              +[IKJSDataObservable toDataObservable:](IKJSDataItem, "toDataObservable:", v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v30, "identifier");
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              if (v31)
              {
                -[IKDOMBindingStrategy updatedItemIDs](self, "updatedItemIDs");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "identifier");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "addObject:", v33);

              }
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
          }
          while (v25);
        }

        v9 = v35;
        v8 = v36;
        v13 = v34;
      }
    }
    else
    {
      -[IKDOMBindingStrategy setSourceItemsChangeSet:](self, "setSourceItemsChangeSet:", 0);
    }

  }
}

- (BOOL)applyValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[IKDOMBindingStrategy itemsBindingKey](self, "itemsBindingKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    +[IKJSDataObservable toDataObservable:](IKJSDataSource, "toDataObservable:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKDOMBindingStrategy _applyItemsValueWithDataSource:](self, "_applyItemsValueWithDataSource:", v10);

  }
  return 0;
}

- (void)didResolveKeys:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  -[IKDOMBindingStrategy dataSourceView](self, "dataSourceView", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[IKDOMBindingStrategy visibleItemsRange](self, "visibleItemsRange");
  objc_msgSend(v6, "setUsedIndexRange:", v4, v5);

}

- (_NSRange)visibleItemsRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = 0;
  v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)_applyItemsValueWithDataSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  IKChangeSet *v28;
  void *v29;
  IKChangeSet *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  uint64_t j;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  IKDiffEvaluator *v45;
  IKDiffEvaluator *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  __int128 v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t m;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  IKChangeSet *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  int v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  IKChangeSet *v84;
  uint64_t v85;
  void *v86;
  IKDOMBindingStrategy *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  IKChangeSet *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  id v102;
  __int128 v103;
  void *v104;
  void *v105;
  id v106;
  IKDOMBindingStrategy *v107;
  void *v108;
  id v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void (**v114)(_QWORD, _QWORD);
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _QWORD v127[4];
  id v128;
  id v129;
  IKDOMBindingStrategy *v130;
  id v131;
  _QWORD v132[4];
  id v133;
  id v134;
  id v135;
  uint8_t v136[128];
  uint8_t buf[4];
  uint64_t v138;
  __int16 v139;
  void *v140;
  _BYTE v141[128];
  _BYTE v142[128];
  uint64_t v143;

  v143 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IKDOMBindingStrategy domBindingController](self, "domBindingController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "domElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dombs_items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKDOMBindingStrategy filteredChangeSet](self, "filteredChangeSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valuesForSubscripts:boxed:", 0, 0x7FFFFFFFFFFFFFFFLL, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKDOMBindingStrategy sourceItemsChangeSet](self, "sourceItemsChangeSet");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  v107 = self;
  -[IKDOMBindingStrategy setSourceItemsChangeSet:](self, "setSourceItemsChangeSet:", v11);

  v12 = MEMORY[0x1E0C809B0];
  v132[0] = MEMORY[0x1E0C809B0];
  v132[1] = 3221225472;
  v132[2] = __55__IKDOMBindingStrategy__applyItemsValueWithDataSource___block_invoke;
  v132[3] = &unk_1E9F4F280;
  v13 = v10;
  v133 = v13;
  v106 = v5;
  v134 = v106;
  v109 = v9;
  v135 = v109;
  v114 = (void (**)(_QWORD, _QWORD))MEMORY[0x1DF092410](v132);
  v14 = (void *)objc_msgSend(v7, "mutableCopy");
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v113 = v16;

  v108 = v7;
  v110 = v8;
  v105 = v13;
  if (v111)
  {
    objc_msgSend(v111, "removedIndexes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");
    v19 = v18;
    if (v18)
    {
      v20 = v18;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v20;

    v125 = 0u;
    v126 = 0u;
    v123 = 0u;
    v124 = 0u;
    objc_msgSend(v111, "movedIndexesByNewIndex");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "allValues");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v123, v142, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v124;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v124 != v35)
            objc_enumerationMutation(v32);
          objc_msgSend(v21, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v123 + 1) + 8 * i), "integerValue"));
        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v123, v142, 16);
      }
      while (v34);
    }

    v37 = objc_msgSend(v21, "lastIndex");
    if (v37 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (j = v37; j != 0x7FFFFFFFFFFFFFFFLL; j = objc_msgSend(v21, "indexLessThanIndex:", j))
      {
        v39 = objc_msgSend(v8, "newIndexForOldIndex:", j);
        if (v39 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v113, "removeObjectAtIndex:", v39);
      }
    }
    v40 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v113, "valueForKey:", CFSTR("identifier"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setWithArray:", v41);
    v112 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (IKChangeSet *)objc_opt_new();
    objc_msgSend(v111, "addedIndexes");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v42, "mutableCopy");
    v44 = v43;
    if (v43)
    {
      v45 = v43;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v45 = (IKDiffEvaluator *)objc_claimAutoreleasedReturnValue();
    }
    v46 = v45;

    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
    objc_msgSend(v111, "movedIndexesByNewIndex");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "allKeys");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v119, v141, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v120;
      do
      {
        for (k = 0; k != v50; ++k)
        {
          if (*(_QWORD *)v120 != v51)
            objc_enumerationMutation(v48);
          -[IKDiffEvaluator addIndex:](v46, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v119 + 1) + 8 * k), "integerValue"));
        }
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v119, v141, 16);
      }
      while (v50);
    }

    objc_msgSend(v110, "removedIndexes");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      objc_msgSend(v110, "removedIndexes");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "firstIndex");

      while (v55 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v56 = objc_msgSend(v111, "newIndexForOldIndex:", v55);
        if (v56 != 0x7FFFFFFFFFFFFFFFLL)
          -[IKDiffEvaluator addIndex:](v46, "addIndex:", v56);
        objc_msgSend(v110, "removedIndexes");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v57, "indexGreaterThanIndex:", v55);

      }
    }
    else
    {

    }
    v58 = -[IKDiffEvaluator firstIndex](v46, "firstIndex");
    v104 = v6;
    if (v58 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_47:
      v117 = 0u;
      v118 = 0u;
      v115 = 0u;
      v116 = 0u;
      objc_msgSend(v111, "updatedIndexesByNewIndex", v103);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "allKeys");
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v115, v136, 16);
      if (v62)
      {
        v63 = v62;
        v64 = *(_QWORD *)v116;
        do
        {
          for (m = 0; m != v63; ++m)
          {
            if (*(_QWORD *)v116 != v64)
              objc_enumerationMutation(v61);
            v66 = objc_msgSend(*(id *)(*((_QWORD *)&v115 + 1) + 8 * m), "integerValue");
            v67 = -[IKChangeSet newIndexForOldIndex:](v30, "newIndexForOldIndex:", v66);
            if (v67 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v68 = v67;
              v114[2](v114, v66);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v113, "replaceObjectAtIndex:withObject:", v68, v69);

            }
          }
          v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v115, v136, 16);
        }
        while (v63);
      }

      v70 = v110;
      v71 = v111;
      objc_msgSend(v111, "changeSetByConvertingOldIndexesUsingChangeSet:andNewIndexesUsingChangeSet:", v110, v30);
      v72 = (IKChangeSet *)objc_claimAutoreleasedReturnValue();
      v6 = v104;
      goto LABEL_80;
    }
    v73 = v58;
    *(_QWORD *)&v59 = 134218242;
    v103 = v59;
    while (1)
    {
      v114[2](v114, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v74)
        goto LABEL_63;
      v75 = v74;
      objc_msgSend(v74, "identifier");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v112, "containsObject:", v76);

      if (v77)
        break;
      objc_msgSend(v113, "insertObject:atIndex:", v75, -[IKChangeSet newIndexForOldIndex:](v30, "newIndexForOldIndex:", v73));
      objc_msgSend(v75, "identifier");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "addObject:", v83);
LABEL_68:

      v73 = -[IKDiffEvaluator indexGreaterThanIndex:](v46, "indexGreaterThanIndex:", v73);
      if (v73 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_47;
    }
    ITMLKitGetLogObject(0);
    v78 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v75, "identifier");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = v103;
      v138 = v73;
      v139 = 2112;
      v140 = v86;
      _os_log_error_impl(&dword_1D95F2000, v78, OS_LOG_TYPE_ERROR, "Duplicate value at %ld - %@", buf, 0x16u);

    }
LABEL_63:
    -[IKChangeSet removedIndexes](v30, "removedIndexes", v103);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = (void *)objc_msgSend(v79, "mutableCopy");
    v81 = v80;
    if (v80)
      v82 = v80;
    else
      v82 = (id)objc_opt_new();
    v75 = v82;

    objc_msgSend(v75, "addIndex:", v73);
    v84 = [IKChangeSet alloc];
    v83 = (void *)objc_msgSend(v75, "copy");
    v85 = -[IKChangeSet initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:](v84, "initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:", 0, v83, 0, 0);

    v30 = (IKChangeSet *)v85;
    goto LABEL_68;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "removeAllObjects");
  if (objc_msgSend(v13, "count"))
  {
    v22 = 0;
    do
    {
      v114[2](v114, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23
        && (objc_msgSend(v23, "identifier"),
            v25 = (void *)objc_claimAutoreleasedReturnValue(),
            v26 = objc_msgSend(v21, "containsObject:", v25),
            v25,
            (v26 & 1) == 0))
      {
        objc_msgSend(v113, "addObject:", v24);
        objc_msgSend(v24, "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v27);

      }
      else
      {
        objc_msgSend(v112, "addIndex:", v22);
      }

      ++v22;
    }
    while (v22 < objc_msgSend(v13, "count"));
  }
  v28 = [IKChangeSet alloc];
  if (objc_msgSend(v112, "count"))
  {
    v29 = (void *)objc_msgSend(v112, "copy");
    v30 = -[IKChangeSet initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:](v28, "initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:", 0, v29, 0, 0);

  }
  else
  {
    v30 = -[IKChangeSet initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:](v28, "initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:", 0, 0, 0, 0);
  }
  v87 = v107;
  v70 = v110;
  if (!v108)
  {
    v72 = 0;
    v71 = 0;
    goto LABEL_81;
  }
  v46 = -[IKDiffEvaluator initWithObjects:oldObjects:hashing:]([IKDiffEvaluator alloc], "initWithObjects:oldObjects:hashing:", v113, v108, &__block_literal_global_29);
  -[IKDOMBindingStrategy updatedItemIDs](v107, "updatedItemIDs");
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  if (v88)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKDiffEvaluator oldIndexesByNewIndex](v46, "oldIndexesByNewIndex");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v127[0] = v12;
    v127[1] = 3221225472;
    v127[2] = __55__IKDOMBindingStrategy__applyItemsValueWithDataSource___block_invoke_2;
    v127[3] = &unk_1E9F4F2E8;
    v128 = v108;
    v129 = v113;
    v130 = v107;
    v91 = v89;
    v131 = v91;
    objc_msgSend(v90, "enumerateKeysAndObjectsUsingBlock:", v127);

    if (objc_msgSend(v91, "count"))
      v92 = (void *)objc_msgSend(v91, "copy");
    else
      v92 = 0;

  }
  else
  {
    -[IKDiffEvaluator oldIndexesByNewIndex](v46, "oldIndexesByNewIndex");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v93 = [IKChangeSet alloc];
  -[IKDiffEvaluator addedIndexes](v46, "addedIndexes");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKDiffEvaluator removedIndexes](v46, "removedIndexes");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKDiffEvaluator movedIndexesByNewIndex](v46, "movedIndexesByNewIndex");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = -[IKChangeSet initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:](v93, "initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:", v94, v95, v96, v92);

  v70 = v110;
  v71 = 0;
LABEL_80:

  v87 = v107;
LABEL_81:

  -[IKDOMBindingStrategy _adjustedIndexTitlesFromDataSource:filteredItems:filteredChangeSet:](v87, "_adjustedIndexTitlesFromDataSource:filteredItems:filteredChangeSet:", v4, v113, v30);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKDOMBindingStrategy willUpdateWithItems:indexTitles:usedPrototypesByIdentifier:changeSet:](v87, "willUpdateWithItems:indexTitles:usedPrototypesByIdentifier:changeSet:", v113, v97, v109, v72);
  v98 = (void *)objc_msgSend(v113, "copy");
  objc_msgSend(v6, "dombs_setItems:", v98);

  -[IKDOMBindingStrategy setFilteredChangeSet:](v87, "setFilteredChangeSet:", v30);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKDOMBindingStrategy setUpdatedItemIDs:](v87, "setUpdatedItemIDs:", v99);

  -[IKDOMBindingStrategy dataSourceView](v87, "dataSourceView");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "dataSource");
  v101 = (id)objc_claimAutoreleasedReturnValue();

  if (v101 != v4)
  {
    v102 = -[IKJSDataSourceView initForDataSource:]([IKJSDataSourceView alloc], "initForDataSource:", v4);
    -[IKDOMBindingStrategy setDataSourceView:](v87, "setDataSourceView:", v102);

  }
}

IKJSDataItem *__55__IKDOMBindingStrategy__applyItemsValueWithDataSource___block_invoke(id *a1, uint64_t a2)
{
  void *v4;
  IKJSDataItem *v5;
  IKJSDataItem *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  objc_msgSend(a1[4], "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isNull") & 1) != 0 || objc_msgSend(v4, "isUndefined"))
  {
    v5 = objc_alloc_init(IKJSDataItem);
  }
  else
  {
    +[IKJSDataObservable toDataObservable:](IKJSDataItem, "toDataObservable:", v4);
    v5 = (IKJSDataItem *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    ITMLKitGetLogObject(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __55__IKDOMBindingStrategy__applyItemsValueWithDataSource___block_invoke_cold_2(a2, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_19;
  }
  objc_msgSend(a1[5], "findPrototypeForDataItem:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    ITMLKitGetLogObject(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __55__IKDOMBindingStrategy__applyItemsValueWithDataSource___block_invoke_cold_1(a2, v19, v26, v27, v28, v29, v30, v31);
LABEL_19:

    v6 = 0;
    v8 = 0;
    goto LABEL_20;
  }
  v8 = v7;
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSDataItem setPrototypeIdentifier:](v6, "setPrototypeIdentifier:", v9);
  objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v8, v9);

  if (v6)
  {
    -[IKJSDataItem identifier](v6, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "domElement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[IKDOMBindingController parsedBindingForDOMElement:](IKDOMBindingController, "parsedBindingForDOMElement:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "keyValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("@"), "stringByAppendingString:", CFSTR("itemID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[IKJSDataObservable valueForPropertyPath:boxed:](v6, "valueForPropertyPath:boxed:", v15, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "isString"))
      {
        objc_msgSend(v16, "toString");
        v17 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v17;
      }

    }
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[IKJSDataItem setIdentifier:](v6, "setIdentifier:", v10);

  }
LABEL_20:

  return v6;
}

uint64_t __55__IKDOMBindingStrategy__applyItemsValueWithDataSource___block_invoke_17(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __55__IKDOMBindingStrategy__applyItemsValueWithDataSource___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(a1[4], "objectAtIndexedSubscript:", objc_msgSend(v5, "integerValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "objectAtIndexedSubscript:", objc_msgSend(v11, "integerValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 != v7
    || (objc_msgSend(a1[6], "updatedItemIDs"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "identifier"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "containsObject:", v9),
        v9,
        v8,
        v10))
  {
    objc_msgSend(a1[7], "setObject:forKeyedSubscript:", v5, v11);
  }

}

- (id)_adjustedIndexTitlesFromDataSource:(id)a3 filteredItems:(id)a4 filteredChangeSet:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  id obj;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v26 = a4;
  v8 = a5;
  if ((objc_msgSend(v7, "isBoxed") & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    v24 = v7;
    objc_msgSend(v7, "indexTitles");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v10, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sortedArrayUsingSelector:", sel_compare_);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v13;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v28;
LABEL_5:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(obj);
        v18 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v17), "integerValue");
        v19 = objc_msgSend(v8, "newIndexByShiftingOldIndex:grouped:", v18, 1);
        if (v19 >= objc_msgSend(v26, "count"))
          break;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, v22);

        if (v15 == ++v17)
        {
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          if (v15)
            goto LABEL_5;
          break;
        }
      }
    }

    if (objc_msgSend(v11, "count"))
      v9 = (void *)objc_msgSend(v11, "copy");
    else
      v9 = 0;

    v7 = v24;
  }

  return v9;
}

- (IKDOMBindingController)domBindingController
{
  return (IKDOMBindingController *)objc_loadWeakRetained((id *)&self->_domBindingController);
}

- (NSString)itemsBindingKey
{
  return self->_itemsBindingKey;
}

- (IKChangeSet)sourceItemsChangeSet
{
  return self->_sourceItemsChangeSet;
}

- (void)setSourceItemsChangeSet:(id)a3
{
  objc_storeStrong((id *)&self->_sourceItemsChangeSet, a3);
}

- (NSMutableSet)updatedItemIDs
{
  return self->_updatedItemIDs;
}

- (void)setUpdatedItemIDs:(id)a3
{
  objc_storeStrong((id *)&self->_updatedItemIDs, a3);
}

- (IKChangeSet)filteredChangeSet
{
  return self->_filteredChangeSet;
}

- (void)setFilteredChangeSet:(id)a3
{
  objc_storeStrong((id *)&self->_filteredChangeSet, a3);
}

- (IKJSDataSourceView)dataSourceView
{
  return self->_dataSourceView;
}

- (void)setDataSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceView, 0);
  objc_storeStrong((id *)&self->_filteredChangeSet, 0);
  objc_storeStrong((id *)&self->_updatedItemIDs, 0);
  objc_storeStrong((id *)&self->_sourceItemsChangeSet, 0);
  objc_storeStrong((id *)&self->_itemsBindingKey, 0);
  objc_destroyWeak((id *)&self->_domBindingController);
}

void __55__IKDOMBindingStrategy__applyItemsValueWithDataSource___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D95F2000, a2, a3, "Invalid value at %ld. Item value must have a valid prototype specification", a5, a6, a7, a8, 0);
}

void __55__IKDOMBindingStrategy__applyItemsValueWithDataSource___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D95F2000, a2, a3, "Invalid value at %ld. Item value must have an object", a5, a6, a7, a8, 0);
}

@end
