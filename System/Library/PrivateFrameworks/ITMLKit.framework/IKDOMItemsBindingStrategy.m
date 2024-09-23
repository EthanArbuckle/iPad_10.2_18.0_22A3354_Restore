@implementation IKDOMItemsBindingStrategy

- (IKDOMItemsBindingStrategy)initWithDOMBindingController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IKDOMItemsBindingStrategy;
  return -[IKDOMBindingStrategy initWithDOMBindingController:itemsBindingKey:](&v4, sel_initWithDOMBindingController_itemsBindingKey_, a3, CFSTR("items"));
}

- (void)didResolveKeys:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IKDOMItemsBindingStrategy;
  -[IKDOMBindingStrategy didResolveKeys:](&v8, sel_didResolveKeys_, a3);
  -[IKDOMBindingStrategy domBindingController](self, "domBindingController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKDOMItemsBindingStrategy _updateChildDOMElements](self, "_updateChildDOMElements");
  -[IKDOMItemsBindingStrategy itemsChangeSet](self, "itemsChangeSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "domib_setItemsChangeSet:", v6);

  v7 = (void *)objc_opt_new();
  -[IKDOMItemsBindingStrategy setItemsChangeSet:](self, "setItemsChangeSet:", v7);

}

- (_NSRange)visibleItemsRange
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  -[IKDOMBindingStrategy domBindingController](self, "domBindingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "domib_visibleIndexRange");
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.length = v8;
  result.location = v7;
  return result;
}

- (void)willUpdateWithItems:(id)a3 indexTitles:(id)a4 usedPrototypesByIdentifier:(id)a5 changeSet:(id)a6
{
  id v10;
  id v11;
  IKDOMItemsBindingStrategy *v12;
  id v13;
  id v14;
  void *v15;
  IKChangeSet *v16;
  IKChangeSet *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  uint64_t v45;
  uint64_t k;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t m;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  IKAppPrototype *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t n;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  IKAppPrototype *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  IKAppDataSet *v97;
  void *v98;
  IKAppDataSet *v99;
  void *v100;
  IKDOMItemsBindingStrategy *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  IKChangeSet *v108;
  void *v109;
  id obj;
  void *v111;
  uint64_t v112;
  id v113;
  IKDOMItemsBindingStrategy *v114;
  void *v115;
  id v116;
  void *v117;
  uint64_t v118;
  void *v119;
  _QWORD v120[4];
  id v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  char v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  _BYTE v139[128];
  _BYTE v140[128];
  _BYTE v141[128];
  _BYTE v142[128];
  uint64_t v143;

  v143 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = self;
  v13 = v11;
  v116 = a5;
  v14 = a6;
  -[IKDOMBindingStrategy domBindingController](v12, "domBindingController");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "domElement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = v14;
  if (v14)
  {
    v16 = (IKChangeSet *)v14;
  }
  else
  {
    v17 = [IKChangeSet alloc];
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v10, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[IKChangeSet initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:](v17, "initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:", v18, 0, 0, 0);

  }
  objc_msgSend(v15, "domib_appDataSet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "items");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v107 = v20;
  v21 = (void *)objc_msgSend(v20, "mutableCopy");
  v22 = v21;
  if (v21)
  {
    v23 = v21;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  v117 = v23;

  v114 = v12;
  -[IKDOMItemsBindingStrategy usedAppPrototypesByIdentifier](v12, "usedAppPrototypesByIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "mutableCopy");
  v26 = v25;
  v106 = v13;
  if (v25)
  {
    v27 = v25;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v27 = (id)objc_claimAutoreleasedReturnValue();
  }
  v28 = v27;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = 0u;
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  v115 = v28;
  objc_msgSend(v28, "allValues");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v135, v142, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v136;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v136 != v32)
          objc_enumerationMutation(v29);
        objc_msgSend(*(id *)(*((_QWORD *)&v135 + 1) + 8 * i), "updateUsageIndexesWithChangeSet:", v16);
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v135, v142, 16);
    }
    while (v31);
  }

  -[IKChangeSet removedIndexes](v16, "removedIndexes");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v34, "mutableCopy");
  v36 = v35;
  if (v35)
  {
    v37 = v35;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v37 = (id)objc_claimAutoreleasedReturnValue();
  }
  v38 = v37;

  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  -[IKChangeSet movedIndexesByNewIndex](v16, "movedIndexesByNewIndex");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "allValues");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v131, v141, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v132;
    do
    {
      for (j = 0; j != v42; ++j)
      {
        if (*(_QWORD *)v132 != v43)
          objc_enumerationMutation(v40);
        objc_msgSend(v38, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v131 + 1) + 8 * j), "integerValue"));
      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v131, v141, 16);
    }
    while (v42);
  }

  v45 = objc_msgSend(v38, "lastIndex");
  if (v45 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (k = v45; k != 0x7FFFFFFFFFFFFFFFLL; k = objc_msgSend(v38, "indexLessThanIndex:", k))
      objc_msgSend(v117, "removeObjectAtIndex:", k);
  }
  -[IKChangeSet addedIndexes](v16, "addedIndexes");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v47, "mutableCopy");
  v49 = v48;
  v103 = v15;
  if (v48)
  {
    v50 = v48;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v50 = (id)objc_claimAutoreleasedReturnValue();
  }
  v51 = v50;

  v129 = 0u;
  v130 = 0u;
  v128 = 0u;
  v127 = 0u;
  -[IKChangeSet movedIndexesByNewIndex](v16, "movedIndexesByNewIndex");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "allKeys");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v127, v140, 16);
  if (v54)
  {
    v55 = v54;
    v56 = *(_QWORD *)v128;
    do
    {
      for (m = 0; m != v55; ++m)
      {
        if (*(_QWORD *)v128 != v56)
          objc_enumerationMutation(v53);
        objc_msgSend(v51, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v127 + 1) + 8 * m), "integerValue"));
      }
      v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v127, v140, 16);
    }
    while (v55);
  }

  v109 = v51;
  v58 = objc_msgSend(v51, "firstIndex");
  v108 = v16;
  v102 = v38;
  if (v58 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v59 = v58;
    do
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "prototypeIdentifier");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "objectForKeyedSubscript:", v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "variantForDataItem:", v60);
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      v64 = -[IKChangeSet oldIndexForNewIndex:](v16, "oldIndexForNewIndex:", v59);
      if (v64 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v65 = -[IKAppPrototype initWithPrototype:dataItem:]([IKAppPrototype alloc], "initWithPrototype:dataItem:", v63, v60);
        -[IKAppPrototype identifier](v65, "identifier");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "objectForKeyedSubscript:", v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        -[IKAppPrototype identifier](v65, "identifier");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = v61;
        if (v67)
        {
          objc_msgSend(v115, "objectForKeyedSubscript:", v68);
          v70 = objc_claimAutoreleasedReturnValue();

          v65 = (IKAppPrototype *)v70;
        }
        else
        {
          objc_msgSend(v115, "setObject:forKeyedSubscript:", v65, v68);
        }

        -[IKAppPrototype addUsageForIndex:](v65, "addUsageForIndex:", v59);
        v126 = 0;
        objc_msgSend(v63, "domElement");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        +[IKDOMBindingController parsedBindingForDOMElement:](IKDOMBindingController, "parsedBindingForDOMElement:", v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[IKAppPrototype identifier](v65, "identifier");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        -[IKDOMItemsBindingStrategy _appDataItemFromDataItem:binding:prototypeIdentifier:autoHighlighted:](v114, "_appDataItemFromDataItem:binding:prototypeIdentifier:autoHighlighted:", v60, v73, v74, &v126);
        v71 = (void *)objc_claimAutoreleasedReturnValue();

        if (v126)
          objc_msgSend(v111, "addIndex:", v59);

        v16 = v108;
        v61 = v69;
      }
      else
      {
        objc_msgSend(v107, "objectAtIndexedSubscript:", v64);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v117, "insertObject:atIndex:", v71, v59);
      v59 = objc_msgSend(v109, "indexGreaterThanIndex:", v59);

    }
    while (v59 != 0x7FFFFFFFFFFFFFFFLL);
  }
  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  -[IKChangeSet updatedIndexesByNewIndex](v16, "updatedIndexesByNewIndex");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "allKeys");
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v76;
  v77 = v117;
  v118 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v122, v139, 16);
  if (v118)
  {
    v112 = *(_QWORD *)v123;
    v113 = v10;
    do
    {
      for (n = 0; n != v118; ++n)
      {
        if (*(_QWORD *)v123 != v112)
          objc_enumerationMutation(obj);
        v79 = objc_msgSend(*(id *)(*((_QWORD *)&v122 + 1) + 8 * n), "integerValue");
        objc_msgSend(v10, "objectAtIndexedSubscript:", v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "prototypeIdentifier");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "objectForKeyedSubscript:");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "variantForDataItem:", v80);
        v82 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v77, "objectAtIndexedSubscript:", v79);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "prototypeIdentifier");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "objectForKeyedSubscript:", v84);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "removeUsageForIndex:", v79);

        v86 = -[IKAppPrototype initWithPrototype:dataItem:]([IKAppPrototype alloc], "initWithPrototype:dataItem:", v82, v80);
        -[IKAppPrototype identifier](v86, "identifier");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "objectForKeyedSubscript:", v87);
        v88 = (void *)objc_claimAutoreleasedReturnValue();

        -[IKAppPrototype identifier](v86, "identifier");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        if (v88)
        {
          objc_msgSend(v115, "objectForKeyedSubscript:", v89);
          v90 = objc_claimAutoreleasedReturnValue();

          v86 = (IKAppPrototype *)v90;
        }
        else
        {
          objc_msgSend(v115, "setObject:forKeyedSubscript:", v86, v89);
        }

        -[IKAppPrototype addUsageForIndex:](v86, "addUsageForIndex:", v79);
        v126 = 0;
        objc_msgSend(v82, "domElement");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        +[IKDOMBindingController parsedBindingForDOMElement:](IKDOMBindingController, "parsedBindingForDOMElement:", v91);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        -[IKAppPrototype identifier](v86, "identifier");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        -[IKDOMItemsBindingStrategy _appDataItemFromDataItem:binding:prototypeIdentifier:autoHighlighted:](v114, "_appDataItemFromDataItem:binding:prototypeIdentifier:autoHighlighted:", v80, v92, v93, &v126);
        v94 = (void *)objc_claimAutoreleasedReturnValue();

        if (v126)
          objc_msgSend(v111, "addIndex:", v79);
        v77 = v117;
        objc_msgSend(v117, "replaceObjectAtIndex:withObject:", v79, v94);

        v10 = v113;
      }
      v118 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v139, 16);
    }
    while (v118);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v120[0] = MEMORY[0x1E0C809B0];
  v120[1] = 3221225472;
  v120[2] = __98__IKDOMItemsBindingStrategy_willUpdateWithItems_indexTitles_usedPrototypesByIdentifier_changeSet___block_invoke;
  v120[3] = &unk_1E9F4BC70;
  v96 = v95;
  v121 = v96;
  objc_msgSend(v115, "enumerateKeysAndObjectsUsingBlock:", v120);
  objc_msgSend(v115, "removeObjectsForKeys:", v96);
  v97 = [IKAppDataSet alloc];
  v98 = (void *)objc_msgSend(v77, "copy");
  v99 = -[IKAppDataSet initWithItems:usedPrototypesByIdentifier:indexTitles:](v97, "initWithItems:usedPrototypesByIdentifier:indexTitles:", v98, v115, v106);
  objc_msgSend(v103, "domib_setAppDataSet:", v99);

  if (objc_msgSend(v111, "count"))
  {
    v100 = (void *)objc_msgSend(v111, "copy");
    v101 = v114;
    -[IKDOMItemsBindingStrategy setAutoHighlightedIndexes:](v114, "setAutoHighlightedIndexes:", v100);

  }
  else
  {
    v101 = v114;
    -[IKDOMItemsBindingStrategy setAutoHighlightedIndexes:](v114, "setAutoHighlightedIndexes:", 0);
  }
  -[IKDOMItemsBindingStrategy setUsedAppPrototypesByIdentifier:](v101, "setUsedAppPrototypesByIdentifier:", v115);
  -[IKDOMItemsBindingStrategy setItemsChangeSet:](v101, "setItemsChangeSet:", v105);
  -[IKDOMItemsBindingStrategy _reevaluateVisibleIndexRange](v101, "_reevaluateVisibleIndexRange");

}

void __98__IKDOMItemsBindingStrategy_willUpdateWithItems_indexTitles_usedPrototypesByIdentifier_changeSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(a3, "usageIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

- (void)_updateChildDOMElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  -[IKDOMBindingStrategy domBindingController](self, "domBindingController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "domElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKDOMBindingStrategy items](self, "items");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "domib_appDataSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "items");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v4;
  objc_msgSend(v4, "usedPrototypesByIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(v3, "childElements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v49 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v11, "getAttribute:", CFSTR("itemID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "length"))
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB36B8];
  v15 = objc_msgSend(v3, "domib_visibleIndexRange");
  objc_msgSend(v14, "indexSetWithIndexesInCyclicRange:itemCount:", v15, v16, objc_msgSend(v31, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addIndexes:", v17);

  -[IKDOMItemsBindingStrategy autoHighlightedIndexes](self, "autoHighlightedIndexes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[IKDOMItemsBindingStrategy autoHighlightedIndexes](self, "autoHighlightedIndexes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addIndexes:", v19);

    -[IKDOMItemsBindingStrategy setAutoHighlightedIndexes:](self, "setAutoHighlightedIndexes:", 0);
  }
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __52__IKDOMItemsBindingStrategy__updateChildDOMElements__block_invoke;
  v41[3] = &unk_1E9F4BC98;
  v32 = v31;
  v42 = v32;
  v20 = v5;
  v43 = v20;
  v21 = v33;
  v44 = v21;
  v22 = v34;
  v45 = v22;
  v23 = v35;
  v46 = v23;
  v24 = v3;
  v47 = v24;
  objc_msgSend(v13, "enumerateIndexesUsingBlock:", v41);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v20, "allValues");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v52, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v38 != v28)
          objc_enumerationMutation(v25);
        v30 = (id)objc_msgSend(v24, "removeChild:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j));
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v52, 16);
    }
    while (v27);
  }

}

void __52__IKDOMItemsBindingStrategy__updateChildDOMElements__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isPlaceholder") & 1) == 0)
  {
    objc_msgSend(v12, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(*(id *)(a1 + 40), "removeObjectForKey:", v4);
    objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 56);
    objc_msgSend(v6, "prototypeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "prototype");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (id)objc_msgSend((id)objc_opt_class(), "instantiateDOMElementForItem:withPrototype:parentDOMElement:existingDOMElement:", v12, v10, *(_QWORD *)(a1 + 72), v5);
  }

}

- (id)_appDataItemFromDataItem:(id)a3 binding:(id)a4 prototypeIdentifier:(id)a5 autoHighlighted:(BOOL *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  IKAppDataItem *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  IKAppDataItem *v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (a6)
  {
    objc_msgSend(v10, "keyValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("@"), "stringByAppendingString:", CFSTR("autoHighlight"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "valueForPropertyPath:boxed:", v14, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isString"))
        *a6 = 1;

    }
  }
  v16 = [IKAppDataItem alloc];
  objc_msgSend(v9, "type");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataDictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[IKAppDataItem initWithType:identifier:prototypeIdentifier:dataDictionary:](v16, "initWithType:identifier:prototypeIdentifier:dataDictionary:", v18, v19, v11, v20);

  if (!v17)
  return v21;
}

- (void)_reevaluateVisibleIndexRange
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[IKDOMItemsBindingStrategy itemsChangeSet](self, "itemsChangeSet");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[IKDOMItemsBindingStrategy itemsChangeSet](self, "itemsChangeSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addedIndexes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      -[IKDOMItemsBindingStrategy itemsChangeSet](self, "itemsChangeSet");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removedIndexes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        -[IKDOMItemsBindingStrategy itemsChangeSet](self, "itemsChangeSet");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "movedIndexesByNewIndex");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
          return;
        goto LABEL_6;
      }

    }
  }
LABEL_6:
  -[IKDOMBindingStrategy domBindingController](self, "domBindingController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "domElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "domib_appDataSet");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "itemIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v8, "childElements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "getAttribute:", CFSTR("itemID"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v9, "indexOfObject:", v16);
        if (v17 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v10, "addIndex:", v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v10, "count"))
  {
    v18 = objc_msgSend(v10, "cyclicRangeForItemCount:includeAllIndexes:", objc_msgSend(v9, "count"), 0);
    v20 = v19;
  }
  else
  {
    v18 = 0;
    v20 = 0;
  }
  objc_msgSend(v8, "domib_setVisibleIndexRange:", v18, v20);

}

- (NSIndexSet)autoHighlightedIndexes
{
  return self->_autoHighlightedIndexes;
}

- (void)setAutoHighlightedIndexes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)usedAppPrototypesByIdentifier
{
  return self->_usedAppPrototypesByIdentifier;
}

- (void)setUsedAppPrototypesByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_usedAppPrototypesByIdentifier, a3);
}

- (IKChangeSet)itemsChangeSet
{
  return self->_itemsChangeSet;
}

- (void)setItemsChangeSet:(id)a3
{
  objc_storeStrong((id *)&self->_itemsChangeSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsChangeSet, 0);
  objc_storeStrong((id *)&self->_usedAppPrototypesByIdentifier, 0);
  objc_storeStrong((id *)&self->_autoHighlightedIndexes, 0);
}

@end
