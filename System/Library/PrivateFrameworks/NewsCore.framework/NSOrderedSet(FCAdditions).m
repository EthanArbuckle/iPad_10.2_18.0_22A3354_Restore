@implementation NSOrderedSet(FCAdditions)

+ (id)fc_orderedSet:()FCAdditions
{
  void (**v3)(id, void *);
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v3[2](v3, v4);
  if (v4)
  {
    v5 = objc_msgSend(v4, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)fc_orderedSetByTransformingWithBlock:()FCAdditions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__NSOrderedSet_FCAdditions__fc_orderedSetByTransformingWithBlock___block_invoke;
  v11[3] = &unk_1E4647450;
  v13 = v4;
  v6 = v5;
  v12 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v11);
  v8 = v12;
  v9 = v6;

  return v9;
}

- (void)fc_enumerateObjectsPairwiseUsingBlock:()FCAdditions
{
  enumerateOrderedCollectionPairwise(a1, a3);
}

- (BOOL)fc_isSortedUsingComparator:()FCAdditions
{
  return isOrderedCollectionSorted(a1, a3);
}

- (id)fc_diffAgainstSortedOrderedCollection:()FCAdditions usingComparator:
{
  return diffSortedOrderedCollections(a3, a1, a4);
}

- (id)fc_objectInSortedOrderedCollectionWithFeature:()FCAdditions usingFeatureProvider:comparator:
{
  return findObjectWithFeatureInSortedOrderedCollection(a1, a3, a4, a5);
}

- (id)fc_diffAgainstOrderedSet:()FCAdditions withEqualityTest:identityValueProvider:
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  _QWORD aBlock[4];
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "left");
    *(_DWORD *)buf = 136315906;
    v37 = "-[NSOrderedSet(FCAdditions) fc_diffAgainstOrderedSet:withEqualityTest:identityValueProvider:]";
    v38 = 2080;
    v39 = "NSOrderedSet+FCAdditions.m";
    v40 = 1024;
    v41 = 65;
    v42 = 2114;
    v43 = v23;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v9)
      goto LABEL_6;
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "equalityTest");
    *(_DWORD *)buf = 136315906;
    v37 = "-[NSOrderedSet(FCAdditions) fc_diffAgainstOrderedSet:withEqualityTest:identityValueProvider:]";
    v38 = 2080;
    v39 = "NSOrderedSet+FCAdditions.m";
    v40 = 1024;
    v41 = 66;
    v42 = 2114;
    v43 = v24;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (!v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "identityValueProvider");
    *(_DWORD *)buf = 136315906;
    v37 = "-[NSOrderedSet(FCAdditions) fc_diffAgainstOrderedSet:withEqualityTest:identityValueProvider:]";
    v38 = 2080;
    v39 = "NSOrderedSet+FCAdditions.m";
    v40 = 1024;
    v41 = 67;
    v42 = 2114;
    v43 = v25;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__NSOrderedSet_FCAdditions__fc_diffAgainstOrderedSet_withEqualityTest_identityValueProvider___block_invoke;
  aBlock[3] = &unk_1E4647C70;
  v35 = v10;
  v27 = v10;
  v12 = _Block_copy(aBlock);
  objc_msgSend(v8, "fc_orderedSetByTransformingWithBlock:", v12);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fc_orderedSetByTransformingWithBlock:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fc_diffAgainstOrderedSet:", v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  v16 = (void *)objc_opt_new();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("deletedIndices"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("movedIndices"));
  v28[0] = v11;
  v28[1] = 3221225472;
  v28[2] = __93__NSOrderedSet_FCAdditions__fc_diffAgainstOrderedSet_withEqualityTest_identityValueProvider___block_invoke_2;
  v28[3] = &unk_1E4647C98;
  v29 = v17;
  v30 = (id)objc_claimAutoreleasedReturnValue();
  v32 = v16;
  v33 = v9;
  v31 = a1;
  v18 = v16;
  v19 = v9;
  v20 = v30;
  v21 = v17;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v28);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("updatedIndices"));

  return v15;
}

- (id)fc_diffAgainstOrderedSet:()FCAdditions
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD aBlock[4];
  id v42;
  _QWORD v43[4];
  _QWORD v44[4];
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = a1;
    objc_msgSend(v4, "set");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "set");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "fc_diffAgainstSet:", v28);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("FCInsertedElementsKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("FCDeletedElementsKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__NSOrderedSet_FCAdditions__fc_diffAgainstOrderedSet___block_invoke;
    aBlock[3] = &unk_1E4643668;
    v42 = v8;
    v26 = v8;
    v10 = _Block_copy(aBlock);
    v39[0] = v9;
    v39[1] = 3221225472;
    v39[2] = __54__NSOrderedSet_FCAdditions__fc_diffAgainstOrderedSet___block_invoke_2;
    v39[3] = &unk_1E4643668;
    v40 = v7;
    v25 = v7;
    v11 = _Block_copy(v39);
    v37[0] = v9;
    v37[1] = 3221225472;
    v37[2] = __54__NSOrderedSet_FCAdditions__fc_diffAgainstOrderedSet___block_invoke_3;
    v37[3] = &unk_1E46474C8;
    v12 = v10;
    v38 = v12;
    objc_msgSend(v4, "indexesOfObjectsPassingTest:", v37);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v9;
    v35[1] = 3221225472;
    v35[2] = __54__NSOrderedSet_FCAdditions__fc_diffAgainstOrderedSet___block_invoke_4;
    v35[3] = &unk_1E46474C8;
    v14 = v11;
    v36 = v14;
    objc_msgSend(v5, "indexesOfObjectsPassingTest:", v35);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_opt_new();
    v17 = (void *)objc_opt_new();
    v29[0] = v9;
    v29[1] = 3221225472;
    v29[2] = __54__NSOrderedSet_FCAdditions__fc_diffAgainstOrderedSet___block_invoke_5;
    v29[3] = &unk_1E4647CC0;
    v33 = v14;
    v34 = v12;
    v30 = v4;
    v31 = v16;
    v32 = v17;
    v18 = v17;
    v19 = v16;
    v20 = v12;
    v21 = v14;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v29);

    v43[0] = CFSTR("insertedIndices");
    v43[1] = CFSTR("deletedIndices");
    v44[0] = v15;
    v44[1] = v13;
    v43[2] = CFSTR("movedIndices");
    v43[3] = CFSTR("unmovedIndices");
    v44[2] = v19;
    v44[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "left");
      *(_DWORD *)buf = 136315906;
      v46 = "-[NSOrderedSet(FCAdditions) fc_diffAgainstOrderedSet:]";
      v47 = 2080;
      v48 = "NSOrderedSet+FCAdditions.m";
      v49 = 1024;
      v50 = 112;
      v51 = 2114;
      v52 = v24;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v22 = 0;
  }

  return v22;
}

- (id)fc_indexesOfObjectsInOrderedSet:()FCAdditions
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(a1, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v5, "addIndex:", v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)fc_firstObjectPassingTest:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "testBlock");
    *(_DWORD *)buf = 136315906;
    v10 = "-[NSOrderedSet(FCAdditions) fc_firstObjectPassingTest:]";
    v11 = 2080;
    v12 = "NSOrderedSet+FCAdditions.m";
    v13 = 1024;
    v14 = 192;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(a1, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fc_firstObjectPassingTest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)fc_containsObjectPassingTest:()FCAdditions
{
  id v4;
  void *v5;
  _BOOL8 v6;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "testBlock");
    *(_DWORD *)buf = 136315906;
    v10 = "-[NSOrderedSet(FCAdditions) fc_containsObjectPassingTest:]";
    v11 = 2080;
    v12 = "NSOrderedSet+FCAdditions.m";
    v13 = 1024;
    v14 = 199;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(a1, "fc_firstObjectPassingTest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (id)fc_orderedSetOfObjectsPassingTest:()FCAdditions
{
  unsigned int (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "testBlock");
    *(_DWORD *)buf = 136315906;
    v20 = "-[NSOrderedSet(FCAdditions) fc_orderedSetOfObjectsPassingTest:]";
    v21 = 2080;
    v22 = "NSOrderedSet+FCAdditions.m";
    v23 = 1024;
    v24 = 206;
    v25 = 2114;
    v26 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v4[2](v4, v11))
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (uint64_t)fc_orderedSetWithObjectsInRange:()FCAdditions
{
  return objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithOrderedSet:range:copyItems:", a1, a3, a4, 0);
}

- (id)fc_orderedSetWithObjectsAtIndexes:()FCAdditions
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(a1, "objectsAtIndexes:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "orderedSetWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)fc_orderedSetByMinusingOrderedSet:()FCAdditions
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99E10];
  v5 = a3;
  objc_msgSend(v4, "orderedSetWithOrderedSet:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minusOrderedSet:", v5);

  return v6;
}

- (id)fc_orderedSetByCollectingObjectsWithBlock:()FCAdditions
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "array", (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)fc_orderedSetByAddingObject:()FCAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "addObject:", v4);

  return v5;
}

- (BOOL)fc_isEqualToOrderedSet:()FCAdditions inRange:
{
  id v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;
  void *v14;
  void *v15;
  char v16;
  void *v18;

  v8 = a3;
  v18 = a1;
  v9 = objc_msgSend(a1, "count");
  v10 = objc_msgSend(v8, "count");
  v11 = a4 + a5;
  if (a4 >= a4 + a5)
  {
    v13 = 1;
  }
  else
  {
    v12 = v10;
    v13 = 0;
    do
    {
      if (a4 >= v9)
      {
        v14 = 0;
      }
      else
      {
        objc_msgSend(v18, "objectAtIndexedSubscript:", a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (a4 >= v12)
      {
        v15 = 0;
      }
      else
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v16 = objc_msgSend(MEMORY[0x1E0DE7910], "nf_object:isEqualToObject:", v14, v15);

      if ((v16 & 1) == 0)
        break;
      v13 = ++a4 >= v11;
      --a5;
    }
    while (a5);
  }

  return v13;
}

@end
