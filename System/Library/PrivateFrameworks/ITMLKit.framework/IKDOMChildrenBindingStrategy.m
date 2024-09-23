@implementation IKDOMChildrenBindingStrategy

- (IKDOMChildrenBindingStrategy)initWithDOMBindingController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IKDOMChildrenBindingStrategy;
  return -[IKDOMBindingStrategy initWithDOMBindingController:itemsBindingKey:](&v4, sel_initWithDOMBindingController_itemsBindingKey_, a3, CFSTR("children"));
}

- (void)willUpdateWithItems:(id)a3 indexTitles:(id)a4 usedPrototypesByIdentifier:(id)a5 changeSet:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a3;
  v9 = a5;
  v10 = a6;
  -[IKDOMBindingStrategy domBindingController](self, "domBindingController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "domElement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "childElements");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_28);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "filterUsingPredicate:", v15);

  if (v10
    && (v16 = objc_msgSend(v14, "count"),
        -[IKDOMBindingStrategy items](self, "items"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v17, "count"),
        v17,
        v16 == v18))
  {
    v19 = (void *)objc_msgSend(v14, "copy");
    -[IKDOMChildrenBindingStrategy _updateChildDOMElements:withItems:usedPrototypesByIdentifier:changeSet:](self, "_updateChildDOMElements:withItems:usedPrototypesByIdentifier:changeSet:", v19, v20, v9, v10);
  }
  else
  {
    v19 = (void *)objc_msgSend(v14, "copy");
    -[IKDOMChildrenBindingStrategy _regenerateChildDOMElements:withItems:usedPrototypesByIdentifier:](self, "_regenerateChildDOMElements:withItems:usedPrototypesByIdentifier:", v19, v20, v9);
  }

}

uint64_t __101__IKDOMChildrenBindingStrategy_willUpdateWithItems_indexTitles_usedPrototypesByIdentifier_changeSet___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "nodeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("prototypes")) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v2, "nodeName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("rules")) ^ 1;

  }
  return v4;
}

- (void)_regenerateChildDOMElements:(id)a3 withItems:(id)a4 usedPrototypesByIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[IKDOMBindingStrategy domBindingController](self, "domBindingController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "domElement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v8, "mutableCopy");
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __97__IKDOMChildrenBindingStrategy__regenerateChildDOMElements_withItems_usedPrototypesByIdentifier___block_invoke;
  v28[3] = &unk_1E9F4F258;
  v14 = v10;
  v29 = v14;
  v15 = v13;
  v30 = v15;
  v16 = v12;
  v31 = v16;
  v17 = v11;
  v32 = v17;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v28);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = v15;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v25;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v18);
        v23 = (id)objc_msgSend(v16, "removeChild:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v22++), (_QWORD)v24);
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v20);
  }

}

void __97__IKDOMChildrenBindingStrategy__regenerateChildDOMElements_withItems_usedPrototypesByIdentifier___block_invoke(id *a1, void *a2)
{
  id *v2;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v13 = a2;
  objc_msgSend(v13, "prototypeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "variantForDataItem:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = a1[5];
  if (v7)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __97__IKDOMChildrenBindingStrategy__regenerateChildDOMElements_withItems_usedPrototypesByIdentifier___block_invoke_2;
    v14[3] = &unk_1E9F4F230;
    v2 = &v15;
    v15 = v13;
    v8 = objc_msgSend(v7, "indexOfObjectPassingTest:", v14);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = 0;
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v10 = v8;
      objc_msgSend(a1[5], "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        v11 = (id)objc_msgSend(a1[6], "removeChild:", v9);
    }
  }
  else
  {
    v9 = 0;
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_msgSend((id)objc_opt_class(), "instantiateDOMElementForItem:withPrototype:parentDOMElement:existingDOMElement:", v13, v6, a1[6], v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 == v9)
    objc_msgSend(a1[5], "removeObjectAtIndex:", v10);

  if (v7)
}

BOOL __97__IKDOMChildrenBindingStrategy__regenerateChildDOMElements_withItems_usedPrototypesByIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "dataItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKJSDataObservable toDataObservable:](IKJSDataObservable, "toDataObservable:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == *(void **)(a1 + 32);

  return v5;
}

- (void)_updateChildDOMElements:(id)a3 withItems:(id)a4 usedPrototypesByIdentifier:(id)a5 changeSet:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  uint64_t v41;
  unint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t k;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  id obj;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
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
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v79 = a4;
  v78 = a5;
  v73 = a6;
  -[IKDOMBindingStrategy domBindingController](self, "domBindingController");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "domElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "mutableCopy");
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  objc_msgSend(v73, "removedIndexes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");
  v18 = v17;
  if (v17)
  {
    v19 = v17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = v19;

  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  objc_msgSend(v73, "movedIndexesByNewIndex");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "allValues");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v88, v94, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v89;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v89 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(v20, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * i), "integerValue"));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v88, v94, 16);
    }
    while (v24);
  }

  v27 = objc_msgSend(v20, "lastIndex");
  if (v27 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v28 = v27;
    do
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (id)objc_msgSend(v11, "removeChild:", v29);
      objc_msgSend(v15, "removeObjectAtIndex:", v28);
      v28 = objc_msgSend(v20, "indexLessThanIndex:", v28);

    }
    while (v28 != 0x7FFFFFFFFFFFFFFFLL);
  }
  objc_msgSend(v73, "addedIndexes");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "mutableCopy");
  v33 = v32;
  v72 = v10;
  if (v32)
  {
    v34 = v32;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v34 = (id)objc_claimAutoreleasedReturnValue();
  }
  v69 = v20;
  v71 = v34;

  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  objc_msgSend(v73, "movedIndexesByNewIndex");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "allKeys");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v85;
    do
    {
      for (j = 0; j != v38; ++j)
      {
        if (*(_QWORD *)v85 != v39)
          objc_enumerationMutation(v36);
        objc_msgSend(v71, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * j), "integerValue", v69));
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
    }
    while (v38);
  }

  v41 = objc_msgSend(v71, "firstIndex");
  if (v41 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v42 = v41;
    do
    {
      objc_msgSend(v79, "objectAtIndexedSubscript:", v42, v69);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "prototypeIdentifier");
      v44 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "objectForKeyedSubscript:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "variantForDataItem:", v43);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = objc_msgSend(v73, "oldIndexForNewIndex:", v42);
      if (v47 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v48 = (void *)v44;
        v49 = v46;
        objc_msgSend(v46, "instantiateDOMElement");
      }
      else
      {
        v49 = v46;
        v48 = (void *)v44;
        objc_msgSend(v72, "objectAtIndexedSubscript:", v47);
      }
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (v42 < objc_msgSend(v15, "count")
        && (objc_msgSend(v15, "objectAtIndexedSubscript:", v42), (v51 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v52 = (void *)v51;
        v53 = (id)objc_msgSend(v11, "insertBefore::", v50, v51);

      }
      else
      {
        v54 = (id)objc_msgSend(v11, "appendChild:", v50);
      }
      objc_msgSend((id)objc_opt_class(), "instantiateDOMElementForItem:withPrototype:parentDOMElement:existingDOMElement:", v43, v49, v11, v50);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "insertObject:atIndex:", v55, v42);
      v42 = objc_msgSend(v71, "indexGreaterThanIndex:", v42);

    }
    while (v42 != 0x7FFFFFFFFFFFFFFFLL);
  }
  v75 = v15;
  v76 = v11;
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  objc_msgSend(v73, "updatedIndexesByNewIndex", v69);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "allKeys");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v57;
  v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
  if (v58)
  {
    v59 = v58;
    v60 = *(_QWORD *)v81;
    do
    {
      for (k = 0; k != v59; ++k)
      {
        if (*(_QWORD *)v81 != v60)
          objc_enumerationMutation(obj);
        v62 = objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * k), "integerValue");
        objc_msgSend(v75, "objectAtIndexedSubscript:", v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "objectAtIndexedSubscript:", v62);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "prototypeIdentifier");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "objectForKeyedSubscript:", v65);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "variantForDataItem:", v64);
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend((id)objc_opt_class(), "instantiateDOMElementForItem:withPrototype:parentDOMElement:existingDOMElement:", v64, v67, v76, v63);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "replaceObjectAtIndex:withObject:", v62, v68);

      }
      v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
    }
    while (v59);
  }

}

@end
