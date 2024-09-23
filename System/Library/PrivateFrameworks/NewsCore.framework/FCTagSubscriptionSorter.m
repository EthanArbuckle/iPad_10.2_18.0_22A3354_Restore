@implementation FCTagSubscriptionSorter

- (id)sortTagSubscriptions:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v29;
  id v30;
  id v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _BYTE *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD aBlock[4];
  id v42;
  _BYTE buf[24];
  _QWORD v44[5];

  v44[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagSubscriptions != nil");
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[FCTagSubscriptionSorter sortTagSubscriptions:]";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "FCTagSubscriptionSorter.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v44[0]) = 40;
      WORD2(v44[0]) = 2114;
      *(_QWORD *)((char *)v44 + 6) = v29;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    objc_msgSend(v4, "fc_dictionaryOfSortedObjectsWithKeyBlock:", &__block_literal_global_190);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", MEMORY[0x1E0C9AAB0]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = (void *)MEMORY[0x1E0C9AA60];
    if (v5)
      v8 = (void *)v5;
    else
      v8 = (void *)MEMORY[0x1E0C9AA60];
    v31 = v8;

    objc_msgSend(v32, "objectForKeyedSubscript:", MEMORY[0x1E0C9AAA0]);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (void *)v9;
    else
      v11 = v7;
    v30 = v11;

    objc_msgSend(v31, "sortedArrayUsingComparator:", &__block_literal_global_7_6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_9_4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(id *)(a1 + 8);
    objc_msgSend(v14, "rankTagIDsDescending:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__FCTagSubscriptionSorter_sortTagSubscriptions___block_invoke_4;
    aBlock[3] = &unk_1E464B618;
    v17 = v15;
    v42 = v17;
    v18 = _Block_copy(aBlock);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v44[0] = 0;
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v40 = 0;
    v33[0] = v16;
    v33[1] = 3221225472;
    v33[2] = __48__FCTagSubscriptionSorter_sortTagSubscriptions___block_invoke_5;
    v33[3] = &unk_1E464B640;
    v19 = v17;
    v34 = v19;
    v35 = buf;
    v36 = &v37;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v33);
    v20 = v38[3];
    if (v20 >= objc_msgSend(v12, "count"))
    {
      v21 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      objc_msgSend(v12, "fc_subarrayUpToIndex:inclusive:", v38[3], 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v22 = v38[3];
    if (v22 >= objc_msgSend(v12, "count"))
    {
      v23 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      objc_msgSend(v12, "fc_subarrayFromIndex:inclusive:", v38[3], 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v30, "sortedArrayUsingComparator:", v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v21, "mutableCopy");
    v26 = (id)objc_msgSend(v25, "fc_mergeSortedOrderedCollection:usingComparator:", v24, v18);
    objc_msgSend(MEMORY[0x1E0C99D20], "fc_arrayByAddingObjectsFromArray:toArray:", v23, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (id)initWithTagRanker:(id *)a1
{
  id v4;
  void *v5;
  id *v6;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = v4;
  if (a1)
  {
    if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagRanker != nil");
      *(_DWORD *)buf = 136315906;
      v11 = "-[FCTagSubscriptionSorter initWithTagRanker:]";
      v12 = 2080;
      v13 = "FCTagSubscriptionSorter.m";
      v14 = 1024;
      v15 = 28;
      v16 = 2114;
      v17 = v8;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v9.receiver = a1;
    v9.super_class = (Class)FCTagSubscriptionSorter;
    v6 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v6;
    if (v6)
      objc_storeStrong(v6 + 1, a2);
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagRanker, 0);
}

id __48__FCTagSubscriptionSorter_sortTagSubscriptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "order");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithInt:", v3 != 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __48__FCTagSubscriptionSorter_sortTagSubscriptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "order");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "order");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __48__FCTagSubscriptionSorter_sortTagSubscriptions___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tagID");
}

uint64_t __48__FCTagSubscriptionSorter_sortTagSubscriptions___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(a2, "tagID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v7, "tagID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "indexOfObject:", v12));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v9, "compare:", v13);
  return v14;
}

void __48__FCTagSubscriptionSorter_sortTagSubscriptions___block_invoke_5(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;

  v7 = (void *)a1[4];
  objc_msgSend(a2, "tagID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "indexOfObject:", v8);

  v10 = *(_QWORD *)(a1[5] + 8);
  if (v9 >= *(_QWORD *)(v10 + 24))
  {
    *(_QWORD *)(v10 + 24) = v9;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
  }
  else
  {
    *a4 = 1;
  }
}

@end
