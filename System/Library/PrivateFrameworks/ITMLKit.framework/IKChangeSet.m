@implementation IKChangeSet

- (IKChangeSet)initWithAddedIndexes:(id)a3 removedIndexes:(id)a4 movedIndexesByNewIndex:(id)a5 updatedIndexesByNewIndex:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  IKChangeSet *v14;
  uint64_t v15;
  NSIndexSet *addedIndexes;
  uint64_t v17;
  NSIndexSet *removedIndexes;
  uint64_t v19;
  NSDictionary *movedIndexesByNewIndex;
  uint64_t v21;
  NSDictionary *updatedIndexesByNewIndex;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)IKChangeSet;
  v14 = -[IKChangeSet init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    addedIndexes = v14->_addedIndexes;
    v14->_addedIndexes = (NSIndexSet *)v15;

    v17 = objc_msgSend(v11, "copy");
    removedIndexes = v14->_removedIndexes;
    v14->_removedIndexes = (NSIndexSet *)v17;

    v19 = objc_msgSend(v12, "copy");
    movedIndexesByNewIndex = v14->_movedIndexesByNewIndex;
    v14->_movedIndexesByNewIndex = (NSDictionary *)v19;

    v21 = objc_msgSend(v13, "copy");
    updatedIndexesByNewIndex = v14->_updatedIndexesByNewIndex;
    v14->_updatedIndexesByNewIndex = (NSDictionary *)v21;

  }
  return v14;
}

- (int64_t)newIndexForOldIndex:(int64_t)a3
{
  void *v5;
  char v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t i;
  uint64_t j;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, void *, void *);
  void *v26;
  id v27;
  id v28;
  _QWORD v29[6];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  -[IKChangeSet removedIndexes](self, "removedIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsIndex:", a3);

  v7 = 0x7FFFFFFFFFFFFFFFLL;
  if ((v6 & 1) == 0)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 0x7FFFFFFFFFFFFFFFLL;
    -[IKChangeSet movedIndexesByNewIndex](self, "movedIndexesByNewIndex");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __35__IKChangeSet_newIndexForOldIndex___block_invoke;
    v29[3] = &unk_1E9F4E1F8;
    v29[4] = &v30;
    v29[5] = a3;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v29);

    v7 = v31[3];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v31[3] = a3;
      -[IKChangeSet removedIndexes](self, "removedIndexes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[IKChangeSet removedIndexes](self, "removedIndexes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v11, "mutableCopy");

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }

      -[IKChangeSet addedIndexes](self, "addedIndexes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[IKChangeSet addedIndexes](self, "addedIndexes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v14, "mutableCopy");

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }

      -[IKChangeSet movedIndexesByNewIndex](self, "movedIndexesByNewIndex");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v9;
      v24 = 3221225472;
      v25 = __35__IKChangeSet_newIndexForOldIndex___block_invoke_2;
      v26 = &unk_1E9F4E220;
      v17 = v12;
      v27 = v17;
      v18 = v15;
      v28 = v18;
      objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", &v23);

      for (i = objc_msgSend(v17, "indexLessThanIndex:", a3, v23, v24, v25, v26);
            i != 0x7FFFFFFFFFFFFFFFLL;
            i = objc_msgSend(v17, "indexLessThanIndex:"))
      {
        --v31[3];
      }
      for (j = objc_msgSend(v18, "firstIndex"); j != 0x7FFFFFFFFFFFFFFFLL; j = objc_msgSend(v18, "indexGreaterThanIndex:"))
      {
        v21 = v31[3];
        if (j > v21)
          break;
        v31[3] = v21 + 1;
      }

      v7 = v31[3];
    }
    _Block_object_dispose(&v30, 8);
  }
  return v7;
}

void __35__IKChangeSet_newIndexForOldIndex___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(a3, "integerValue") == *(_QWORD *)(a1 + 40))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v7, "integerValue");
    *a4 = 1;
  }

}

uint64_t __35__IKChangeSet_newIndexForOldIndex___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "addIndex:", objc_msgSend(a3, "integerValue"));
  v7 = *(void **)(a1 + 40);
  v8 = objc_msgSend(v6, "integerValue");

  return objc_msgSend(v7, "addIndex:", v8);
}

- (int64_t)oldIndexForNewIndex:(int64_t)a3
{
  void *v5;
  char v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t i;
  int64_t v25;
  int64_t v26;
  int64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, void *, void *);
  void *v32;
  id v33;
  id v34;

  -[IKChangeSet addedIndexes](self, "addedIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsIndex:", a3);

  if ((v6 & 1) != 0)
    return 0x7FFFFFFFFFFFFFFFLL;
  -[IKChangeSet movedIndexesByNewIndex](self, "movedIndexesByNewIndex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_5;
  -[IKChangeSet movedIndexesByNewIndex](self, "movedIndexesByNewIndex");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v13, "integerValue");

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:
    -[IKChangeSet removedIndexes](self, "removedIndexes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[IKChangeSet removedIndexes](self, "removedIndexes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "mutableCopy");

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[IKChangeSet addedIndexes](self, "addedIndexes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[IKChangeSet addedIndexes](self, "addedIndexes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v18, "mutableCopy");

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[IKChangeSet movedIndexesByNewIndex](self, "movedIndexesByNewIndex");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __35__IKChangeSet_oldIndexForNewIndex___block_invoke;
    v32 = &unk_1E9F4E220;
    v21 = v16;
    v33 = v21;
    v22 = v19;
    v34 = v22;
    objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", &v29);

    v23 = objc_msgSend(v22, "indexLessThanIndex:", a3, v29, v30, v31, v32);
    if (v23 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (i = v23; i != 0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(v22, "indexLessThanIndex:", i))
        --a3;
    }
    v25 = objc_msgSend(v21, "firstIndex");
    if (v25 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v26 = v25;
      if (v25 <= a3)
      {
        do
        {
          ++a3;
          v27 = objc_msgSend(v21, "indexGreaterThanIndex:", v26);
          if (v27 == 0x7FFFFFFFFFFFFFFFLL)
            break;
          v26 = v27;
        }
        while (v27 <= a3);
      }
    }

    return a3;
  }
  return v7;
}

uint64_t __35__IKChangeSet_oldIndexForNewIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "addIndex:", objc_msgSend(a3, "integerValue"));
  v7 = *(void **)(a1 + 40);
  v8 = objc_msgSend(v6, "integerValue");

  return objc_msgSend(v7, "addIndex:", v8);
}

- (int64_t)newIndexByShiftingOldIndex:(int64_t)a3 grouped:(BOOL)a4
{
  int64_t v4;
  _BOOL4 v5;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t i;
  _BOOL4 v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, void *, void *);
  void *v26;
  id v27;
  id v28;

  v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = a4;
    -[IKChangeSet removedIndexes](self, "removedIndexes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[IKChangeSet removedIndexes](self, "removedIndexes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "mutableCopy");

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[IKChangeSet addedIndexes](self, "addedIndexes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[IKChangeSet addedIndexes](self, "addedIndexes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "mutableCopy");

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[IKChangeSet movedIndexesByNewIndex](self, "movedIndexesByNewIndex");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __50__IKChangeSet_newIndexByShiftingOldIndex_grouped___block_invoke;
    v26 = &unk_1E9F4E220;
    v15 = v10;
    v27 = v15;
    v16 = v13;
    v28 = v16;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", &v23);

    v17 = objc_msgSend(v15, "firstIndex", v23, v24, v25, v26);
    if (v17 >= a3)
    {
      v4 = a3;
    }
    else
    {
      v18 = v17;
      v4 = a3;
      do
      {
        --v4;
        v18 = objc_msgSend(v15, "indexGreaterThanIndex:", v18);
      }
      while (v18 < a3);
    }
    v19 = objc_msgSend(v16, "firstIndex", v18);
    if (v19 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (i = v19; i != 0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(v16, "indexGreaterThanIndex:"))
      {
        v21 = v4 == i && v5;
        if (i >= v4 && !v21)
          break;
        ++v4;
      }
    }

  }
  return v4;
}

uint64_t __50__IKChangeSet_newIndexByShiftingOldIndex_grouped___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "addIndex:", objc_msgSend(a3, "integerValue"));
  v7 = *(void **)(a1 + 40);
  v8 = objc_msgSend(v6, "integerValue");

  return objc_msgSend(v7, "addIndex:", v8);
}

- (id)inverseChangeSet
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  IKChangeSet *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  IKChangeSet *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t, uint64_t);
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;

  -[IKChangeSet removedIndexes](self, "removedIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKChangeSet addedIndexes](self, "addedIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E08];
  -[IKChangeSet movedIndexesByNewIndex](self, "movedIndexesByNewIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKChangeSet movedIndexesByNewIndex](self, "movedIndexesByNewIndex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __31__IKChangeSet_inverseChangeSet__block_invoke;
  v27[3] = &unk_1E9F4E248;
  v10 = v7;
  v28 = v10;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v27);

  v11 = (void *)MEMORY[0x1E0C99E08];
  -[IKChangeSet updatedIndexesByNewIndex](self, "updatedIndexesByNewIndex");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKChangeSet updatedIndexesByNewIndex](self, "updatedIndexesByNewIndex");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v9;
  v23 = 3221225472;
  v24 = __31__IKChangeSet_inverseChangeSet__block_invoke_2;
  v25 = &unk_1E9F4E248;
  v15 = v13;
  v26 = v15;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", &v22);

  v16 = [IKChangeSet alloc];
  v17 = objc_msgSend(v10, "count", v22, v23, v24, v25);
  if (v17)
    v18 = (void *)objc_msgSend(v10, "copy");
  else
    v18 = 0;
  if (!objc_msgSend(v15, "count"))
  {
    v20 = -[IKChangeSet initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:](v16, "initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:", v3, v4, v18, 0);
    if (!v17)
      goto LABEL_7;
    goto LABEL_6;
  }
  v19 = (void *)objc_msgSend(v15, "copy");
  v20 = -[IKChangeSet initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:](v16, "initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:", v3, v4, v18, v19);

  if (v17)
LABEL_6:

LABEL_7:
  v20->_reducing = 1;

  return v20;
}

uint64_t __31__IKChangeSet_inverseChangeSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a3);
}

uint64_t __31__IKChangeSet_inverseChangeSet__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a3);
}

- (id)changeSetByConcatenatingChangeSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  IKChangeSet *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  IKChangeSet *v66;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  _QWORD v74[5];
  id v75;
  id v76;
  _QWORD v77[4];
  id v78;
  id v79;
  _QWORD v80[4];
  id v81;
  id v82;
  _QWORD v83[4];
  id v84;
  id v85;
  _QWORD v86[5];
  id v87;
  _QWORD v88[4];
  id v89;
  id v90;

  v4 = a3;
  objc_msgSend(v4, "addedIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "addedIndexes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[IKChangeSet addedIndexes](self, "addedIndexes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[IKChangeSet addedIndexes](self, "addedIndexes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "firstIndex");

    while (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = objc_msgSend(v4, "newIndexForOldIndex:", v10);
      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v7, "addIndex:", v11);
      -[IKChangeSet addedIndexes](self, "addedIndexes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v12, "indexGreaterThanIndex:", v10);

    }
  }
  else
  {

  }
  -[IKChangeSet removedIndexes](self, "removedIndexes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[IKChangeSet removedIndexes](self, "removedIndexes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v4, "removedIndexes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v4, "removedIndexes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "firstIndex");

    while (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v19 = -[IKChangeSet oldIndexForNewIndex:](self, "oldIndexForNewIndex:", v18);
      if (v19 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v15, "addIndex:", v19);
      objc_msgSend(v4, "removedIndexes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v20, "indexGreaterThanIndex:", v18);

    }
  }
  else
  {

  }
  v21 = (void *)MEMORY[0x1E0C99E08];
  -[IKChangeSet movedIndexesByNewIndex](self, "movedIndexesByNewIndex");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");
  objc_msgSend(v4, "movedIndexesByNewIndex");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dictionaryWithCapacity:", objc_msgSend(v24, "count") + v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKChangeSet movedIndexesByNewIndex](self, "movedIndexesByNewIndex");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = MEMORY[0x1E0C809B0];
  v88[0] = MEMORY[0x1E0C809B0];
  v88[1] = 3221225472;
  v88[2] = __49__IKChangeSet_changeSetByConcatenatingChangeSet___block_invoke;
  v88[3] = &unk_1E9F4E220;
  v28 = v4;
  v89 = v28;
  v29 = v25;
  v90 = v29;
  objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v88);

  objc_msgSend(v28, "movedIndexesByNewIndex");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v27;
  v86[1] = 3221225472;
  v86[2] = __49__IKChangeSet_changeSetByConcatenatingChangeSet___block_invoke_2;
  v86[3] = &unk_1E9F4E220;
  v86[4] = self;
  v73 = v29;
  v87 = v73;
  objc_msgSend(v30, "enumerateKeysAndObjectsUsingBlock:", v86);

  v70 = v15;
  v71 = v7;
  if (objc_msgSend(v28, "isReducing"))
  {
    v68 = v28;
    objc_msgSend(v28, "addedIndexes");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKChangeSet removedIndexes](self, "removedIndexes");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v83[0] = v27;
    v83[1] = 3221225472;
    v83[2] = __49__IKChangeSet_changeSetByConcatenatingChangeSet___block_invoke_3;
    v83[3] = &unk_1E9F4E220;
    v31 = v15;
    v84 = v31;
    v32 = v7;
    v85 = v32;
    v33 = v73;
    objc_msgSend(v73, "enumerateKeysAndObjectsUsingBlock:", v83);
    v34 = objc_msgSend(v31, "firstIndex");
    if (v34 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (i = v34; i != 0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(v31, "indexGreaterThanIndex:", i))
      {
        v36 = objc_msgSend(v31, "indexLessThanIndex:", i);
        v37 = i;
        if (v36 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v38 = v36;
          v37 = i;
          do
          {
            --v37;
            v38 = objc_msgSend(v31, "indexLessThanIndex:", v38);
          }
          while (v38 != 0x7FFFFFFFFFFFFFFFLL);
        }
        v39 = objc_msgSend(v32, "firstIndex");
        if (v39 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v40 = v39;
          while (v40 < v37)
          {
            ++v37;
            v40 = objc_msgSend(v32, "indexGreaterThanIndex:", v40);
            if (v40 == 0x7FFFFFFFFFFFFFFFLL)
              goto LABEL_36;
          }
          if (objc_msgSend(v72, "containsIndex:", i)
            && (objc_msgSend(v69, "containsIndex:", v40) & 1) != 0)
          {
            goto LABEL_35;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectForKeyedSubscript:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v42, "isEqualToNumber:", v43);

          v33 = v73;
          if (v44)
          {
LABEL_35:
            objc_msgSend(v31, "removeIndex:", i);
            objc_msgSend(v32, "removeIndex:", v37);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "removeObjectForKey:", v45);

          }
        }
LABEL_36:
        ;
      }
    }
    v27 = MEMORY[0x1E0C809B0];
    v80[0] = MEMORY[0x1E0C809B0];
    v80[1] = 3221225472;
    v80[2] = __49__IKChangeSet_changeSetByConcatenatingChangeSet___block_invoke_4;
    v80[3] = &unk_1E9F4E220;
    v81 = v31;
    v82 = v32;
    objc_msgSend(v33, "enumerateKeysAndObjectsUsingBlock:", v80);

    v15 = v70;
    v7 = v71;
    v28 = v68;
  }
  v46 = (void *)MEMORY[0x1E0C99E08];
  -[IKChangeSet updatedIndexesByNewIndex](self, "updatedIndexesByNewIndex");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "count");
  objc_msgSend(v28, "updatedIndexesByNewIndex");
  v49 = v28;
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "dictionaryWithCapacity:", objc_msgSend(v50, "count") + v48);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKChangeSet updatedIndexesByNewIndex](self, "updatedIndexesByNewIndex");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = v27;
  v77[1] = 3221225472;
  v77[2] = __49__IKChangeSet_changeSetByConcatenatingChangeSet___block_invoke_5;
  v77[3] = &unk_1E9F4E220;
  v53 = v49;
  v78 = v53;
  v54 = v51;
  v79 = v54;
  objc_msgSend(v52, "enumerateKeysAndObjectsUsingBlock:", v77);

  objc_msgSend(v53, "updatedIndexesByNewIndex");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v27;
  v74[1] = 3221225472;
  v74[2] = __49__IKChangeSet_changeSetByConcatenatingChangeSet___block_invoke_6;
  v74[3] = &unk_1E9F4E270;
  v74[4] = self;
  v56 = v54;
  v75 = v56;
  v57 = v53;
  v76 = v57;
  objc_msgSend(v55, "enumerateKeysAndObjectsUsingBlock:", v74);

  v58 = [IKChangeSet alloc];
  v59 = objc_msgSend(v7, "count");
  if (v59)
    v60 = (void *)objc_msgSend(v7, "copy");
  else
    v60 = 0;
  v61 = objc_msgSend(v15, "count");
  if (v61)
    v62 = (void *)objc_msgSend(v15, "copy");
  else
    v62 = 0;
  v63 = objc_msgSend(v73, "count");
  if (v63)
    v64 = (void *)objc_msgSend(v73, "copy");
  else
    v64 = 0;
  if (objc_msgSend(v56, "count"))
  {
    v65 = (void *)objc_msgSend(v56, "copy");
    v66 = -[IKChangeSet initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:](v58, "initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:", v60, v62, v64, v65);

    if (!v63)
      goto LABEL_50;
    goto LABEL_49;
  }
  v66 = -[IKChangeSet initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:](v58, "initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:", v60, v62, v64, 0);
  if (v63)
LABEL_49:

LABEL_50:
  if (v61)

  if (v59)
  return v66;
}

void __49__IKChangeSet_changeSetByConcatenatingChangeSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = objc_msgSend(*(id *)(a1 + 32), "newIndexForOldIndex:", objc_msgSend(a2, "integerValue"));
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);

  }
}

void __49__IKChangeSet_changeSetByConcatenatingChangeSet___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = objc_msgSend(*(id *)(a1 + 32), "oldIndexForNewIndex:", objc_msgSend(a3, "integerValue"));
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v7);

  }
}

uint64_t __49__IKChangeSet_changeSetByConcatenatingChangeSet___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "addIndex:", objc_msgSend(a3, "integerValue"));
  v7 = *(void **)(a1 + 40);
  v8 = objc_msgSend(v6, "integerValue");

  return objc_msgSend(v7, "addIndex:", v8);
}

uint64_t __49__IKChangeSet_changeSetByConcatenatingChangeSet___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "removeIndex:", objc_msgSend(a3, "integerValue"));
  v7 = *(void **)(a1 + 40);
  v8 = objc_msgSend(v6, "integerValue");

  return objc_msgSend(v7, "removeIndex:", v8);
}

void __49__IKChangeSet_changeSetByConcatenatingChangeSet___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = objc_msgSend(*(id *)(a1 + 32), "newIndexForOldIndex:", objc_msgSend(a2, "integerValue"));
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);

  }
}

void __49__IKChangeSet_changeSetByConcatenatingChangeSet___block_invoke_6(id *a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = objc_msgSend(a1[4], "oldIndexForNewIndex:", objc_msgSend(a3, "integerValue"));
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v5;
    objc_msgSend(a1[5], "objectForKeyedSubscript:", v11);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7 && (v8 = (void *)v7, v9 = objc_msgSend(a1[6], "isReducing"), v8, v9))
    {
      objc_msgSend(a1[5], "removeObjectForKey:", v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v10, v11);

    }
  }

}

- (id)changeSetBySubtractingChangeSet:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "inverseChangeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKChangeSet changeSetByConcatenatingChangeSet:](self, "changeSetByConcatenatingChangeSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)changeSetByConvertingOldIndexesUsingChangeSet:(id)a3 andNewIndexesUsingChangeSet:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[IKChangeSet changeSetByConcatenatingChangeSet:](self, "changeSetByConcatenatingChangeSet:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inverseChangeSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "changeSetByConcatenatingChangeSet:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSIndexSet)addedIndexes
{
  return self->_addedIndexes;
}

- (NSIndexSet)removedIndexes
{
  return self->_removedIndexes;
}

- (NSDictionary)movedIndexesByNewIndex
{
  return self->_movedIndexesByNewIndex;
}

- (NSDictionary)updatedIndexesByNewIndex
{
  return self->_updatedIndexesByNewIndex;
}

- (BOOL)isReducing
{
  return self->_reducing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedIndexesByNewIndex, 0);
  objc_storeStrong((id *)&self->_movedIndexesByNewIndex, 0);
  objc_storeStrong((id *)&self->_removedIndexes, 0);
  objc_storeStrong((id *)&self->_addedIndexes, 0);
}

@end
