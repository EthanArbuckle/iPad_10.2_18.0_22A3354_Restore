@implementation IKDSEUnboundItemsImpl

- (IKDSEUnboundItemsImpl)initWithDataSourceElement:(id)a3
{
  id v4;
  IKDSEUnboundItemsImpl *v5;
  IKDSEUnboundItemsImpl *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IKDSEUnboundItemsImpl;
  v5 = -[IKDSEUnboundItemsImpl init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_dataSourceElement, v4);

  return v6;
}

- (NSArray)itemElements
{
  NSArray *itemElements;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  itemElements = self->_itemElements;
  if (!itemElements)
  {
    -[IKDSEUnboundItemsImpl dataSourceElement](self, "dataSourceElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unboundItemElements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSArray *)objc_msgSend(v5, "copy");
    v7 = self->_itemElements;
    self->_itemElements = v6;

    itemElements = self->_itemElements;
  }
  return itemElements;
}

- (NSArray)proxiedItemElements
{
  return 0;
}

- (int64_t)numberOfItems
{
  void *v2;
  int64_t v3;

  -[IKDSEUnboundItemsImpl itemElements](self, "itemElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)prototypeForItemAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[IKDSEUnboundItemsImpl itemElements](self, "itemElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)elementForItemAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[IKDSEUnboundItemsImpl itemElements](self, "itemElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)indexOfItemForElement:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[IKDSEUnboundItemsImpl itemElements](self, "itemElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (NSDictionary)indexTitles
{
  return 0;
}

- (void)applyUpdatesWithImplementation:(id)a3 usingUpdater:(id)a4
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
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  IKChangeSet *v49;
  IKChangeSet *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void (**v62)(void);
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  _QWORD v71[4];
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;

  v62 = (void (**)(void))a4;
  -[IKDSEUnboundItemsImpl dataSourceElement](self, "dataSourceElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unfilteredChildren");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKDSEUnboundItemsImpl itemElements](self, "itemElements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKDSEUnboundItemsImpl setItemElements:](self, "setItemElements:", 0);
  objc_msgSend(v8, "unfilteredChildren");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "impl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "itemElements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = v8;
  objc_msgSend(v8, "unfilteredChildrenChangeSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removedIndexes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v12, "removedIndexes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "firstIndex");

    while (v16 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v7, "indexOfObject:", v17);

      if (v18 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v13, "addIndex:", v18);
      objc_msgSend(v12, "removedIndexes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v19, "indexGreaterThanIndex:", v16);

    }
  }
  else
  {

  }
  v59 = v13;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addedIndexes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_msgSend(v12, "addedIndexes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "firstIndex");

    while (v23 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v11, "indexOfObject:", v24);

      if (v25 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v20, "addIndex:", v25);
      objc_msgSend(v12, "addedIndexes");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v26, "indexGreaterThanIndex:", v23);

    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "movedIndexesByNewIndex");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = MEMORY[0x1E0C809B0];
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __69__IKDSEUnboundItemsImpl_applyUpdatesWithImplementation_usingUpdater___block_invoke;
  v71[3] = &unk_1E9F4D8F8;
  v30 = v7;
  v72 = v30;
  v31 = v6;
  v73 = v31;
  v32 = v11;
  v74 = v32;
  v33 = v9;
  v75 = v33;
  v34 = v27;
  v76 = v34;
  objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", v71);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updatedIndexesByNewIndex");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v29;
  v63[1] = 3221225472;
  v63[2] = __69__IKDSEUnboundItemsImpl_applyUpdatesWithImplementation_usingUpdater___block_invoke_2;
  v63[3] = &unk_1E9F4D920;
  v58 = v30;
  v64 = v58;
  v57 = v31;
  v65 = v57;
  v56 = v32;
  v66 = v56;
  v55 = v33;
  v67 = v55;
  v37 = v35;
  v68 = v37;
  v38 = v59;
  v69 = v38;
  v39 = v20;
  v70 = v39;
  objc_msgSend(v36, "enumerateKeysAndObjectsUsingBlock:", v63);

  objc_msgSend(v61, "impl");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = [IKChangeSet alloc];
  v52 = objc_msgSend(v39, "count");
  if (v52)
    v40 = objc_msgSend(v39, "copy");
  else
    v40 = 0;
  v41 = objc_msgSend(v38, "count");
  v53 = v39;
  v54 = v38;
  if (v41)
    v42 = (void *)objc_msgSend(v38, "copy");
  else
    v42 = 0;
  v43 = objc_msgSend(v34, "count");
  v44 = v34;
  if (v43)
    v45 = (void *)objc_msgSend(v34, "copy");
  else
    v45 = 0;
  v46 = objc_msgSend(v37, "count");
  v51 = v37;
  if (v46)
    v47 = (void *)objc_msgSend(v37, "copy");
  else
    v47 = 0;
  v48 = (void *)v40;
  v49 = -[IKChangeSet initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:](v50, "initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:", v40, v42, v45, v47);
  objc_msgSend(v60, "setItemsChangeSet:", v49);

  if (v46)
  if (v43)

  if (v41)
  if (v52)

}

void __69__IKDSEUnboundItemsImpl_applyUpdatesWithImplementation_usingUpdater___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", objc_msgSend(a3, "integerValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "indexOfObject:", v6);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_4;
  v8 = v7;
  v9 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", objc_msgSend(v14, "integerValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "indexOfObject:", v10);

  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v6, v13);

LABEL_4:
  }

}

void __69__IKDSEUnboundItemsImpl_applyUpdatesWithImplementation_usingUpdater___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  v5 = (void *)a1[4];
  v6 = (void *)a1[5];
  v7 = a2;
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(a3, "integerValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "indexOfObject:", v8);

  v10 = (void *)a1[6];
  v11 = (void *)a1[7];
  v12 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "indexOfObject:", v13);

  if (v9 != 0x7FFFFFFFFFFFFFFFLL && v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v18 = (void *)a1[8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, v19);

    return;
  }
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      return;
    v16 = (void *)a1[10];
    v17 = v14;
  }
  else
  {
    v16 = (void *)a1[9];
    v17 = v9;
  }
  objc_msgSend(v16, "addIndex:", v17);
}

- (void)updateStylesUsingUpdater:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  IKDiffEvaluator *v8;
  IKChangeSet *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  IKChangeSet *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = (void (**)(_QWORD))a3;
  -[IKDSEUnboundItemsImpl itemElements](self, "itemElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4);

  -[IKDSEUnboundItemsImpl setItemElements:](self, "setItemElements:", 0);
  -[IKDSEUnboundItemsImpl itemElements](self, "itemElements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[IKViewElementStyle isHiddenStyleRegistered](IKViewElementStyle, "isHiddenStyleRegistered"))
  {
    v8 = -[IKDiffEvaluator initWithObjects:oldObjects:hashing:]([IKDiffEvaluator alloc], "initWithObjects:oldObjects:hashing:", v6, v5, &__block_literal_global_12);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __50__IKDSEUnboundItemsImpl_updateStylesUsingUpdater___block_invoke_2;
    v20[3] = &unk_1E9F4D988;
    v21 = v7;
    -[IKDiffEvaluator enumerateCommonObjectsUsingBlock:](v8, "enumerateCommonObjectsUsingBlock:", v20);

  }
  else
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __50__IKDSEUnboundItemsImpl_updateStylesUsingUpdater___block_invoke_3;
    v18[3] = &unk_1E9F4D1A0;
    v19 = v7;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v18);

    v8 = 0;
  }
  v9 = [IKChangeSet alloc];
  -[IKDiffEvaluator addedIndexes](v8, "addedIndexes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKDiffEvaluator removedIndexes](v8, "removedIndexes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKDiffEvaluator movedIndexesByNewIndex](v8, "movedIndexesByNewIndex");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v13 = (void *)objc_msgSend(v7, "copy");
    v14 = -[IKChangeSet initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:](v9, "initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:", v10, v11, v12, v13);

  }
  else
  {
    v14 = -[IKChangeSet initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:](v9, "initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:", v10, v11, v12, 0);
  }

  -[IKDSEUnboundItemsImpl itemsChangeSet](self, "itemsChangeSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[IKDSEUnboundItemsImpl itemsChangeSet](self, "itemsChangeSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "changeSetByConcatenatingChangeSet:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKDSEUnboundItemsImpl setItemsChangeSet:](self, "setItemsChangeSet:", v17);

  }
  else
  {
    -[IKDSEUnboundItemsImpl setItemsChangeSet:](self, "setItemsChangeSet:", v14);
  }

}

uint64_t __50__IKDSEUnboundItemsImpl_updateStylesUsingUpdater___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "itmlID");
}

void __50__IKDSEUnboundItemsImpl_updateStylesUsingUpdater___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  void *v7;
  void *v8;
  id v9;

  if (objc_msgSend(a3, "updateType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);

  }
}

void __50__IKDSEUnboundItemsImpl_updateStylesUsingUpdater___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  if (objc_msgSend(a2, "updateType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);

  }
}

- (void)resetUpdates
{
  -[IKDSEUnboundItemsImpl setItemsChangeSet:](self, "setItemsChangeSet:", 0);
}

- (IKDataSourceElement)dataSourceElement
{
  return (IKDataSourceElement *)objc_loadWeakRetained((id *)&self->_dataSourceElement);
}

- (void)setItemElements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
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
  objc_storeStrong((id *)&self->_itemElements, 0);
  objc_destroyWeak((id *)&self->_dataSourceElement);
}

@end
