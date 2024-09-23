@implementation FCTopicallyOrderGroups

double __FCTopicallyOrderGroups_block_invoke()
{
  return 0.0;
}

id __FCTopicallyOrderGroups_block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

void __FCTopicallyOrderGroups_block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __FCTopicallyOrderGroups_block_invoke_4;
  v6[3] = &unk_1E463BEF8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void __FCTopicallyOrderGroups_block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "allObjects");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKeyPath:", CFSTR("topics"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

BOOL __FCTopicallyOrderGroups_block_invoke_5(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;

  objc_msgSend(a1[4], "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fc_arrayByTransformingWithBlock:", &__block_literal_global_125);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("@unionOfArrays.self"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "count");
  v6 = objc_msgSend(a1[5], "count");
  v7 = v6 == objc_msgSend(a1[6], "count") + v5;

  return v7;
}

uint64_t __FCTopicallyOrderGroups_block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "allObjects");
}

void __FCTopicallyOrderGroups_block_invoke_131(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __FCTopicallyOrderGroups_block_invoke_2_132;
  v6[3] = &unk_1E463BF90;
  v4 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __FCTopicallyOrderGroups_block_invoke_2_132(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0CB3550]);
  v5 = *(void **)(a1 + 32);
  v6 = (void *)MEMORY[0x1E0CB3880];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __FCTopicallyOrderGroups_block_invoke_3_135;
  v14[3] = &unk_1E463BF68;
  v7 = v3;
  v15 = v7;
  objc_msgSend(v6, "predicateWithBlock:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v4, "initWithArray:", v9);

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;
    v13 = v12;
  }
  else
  {
    v13 = (void *)objc_opt_new();
    v12 = 0;
  }

  objc_msgSend(v13, "addObject:", v7);
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v13, v10);

}

uint64_t __FCTopicallyOrderGroups_block_invoke_3_135(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsObject:", *(_QWORD *)(a1 + 32));
}

void __FCTopicallyOrderGroups_block_invoke_4_140(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __int128 v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  __int128 v10;
  __int128 v11;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __FCTopicallyOrderGroups_block_invoke_5_141;
  v7[3] = &unk_1E463BFB8;
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = v3;
  v5 = *(_OWORD *)(a1 + 64);
  v10 = *(_OWORD *)(a1 + 48);
  v11 = v5;
  v6 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __FCTopicallyOrderGroups_block_invoke_5_141(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v5, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "count") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expected to find some displayed elements for %@ in %@"), v5, *(_QWORD *)(a1 + 32));
    *(_DWORD *)buf = 136315906;
    v14 = "NSOrderedSet<NSString *> * _Nonnull FCTopicallyOrderGroups(NSDictionary<NSString *,NSSet<FCTopicalNodeElement "
          "*> *> * _Nonnull __strong, NSArray<NSSet<NSString *> *> * _Nonnull __strong, double (^ _Nullable __strong)(NSS"
          "et<NSString *> * _Nonnull __strong), NSString * _Nonnull (^ _Nullable __strong)(NSString * _Nonnull __strong),"
          " double, double, double, double)_block_invoke_5";
    v15 = 2080;
    v16 = "FCHeadlineClusterOrdering.m";
    v17 = 1024;
    v18 = 601;
    v19 = 2114;
    v20 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v10 = *(void **)(a1 + 40);
  v11 = -[FCTopicalNode initWithIdentifier:displayedElements:allTopicCollections:relatednessThreshold:relatednessKWeight:topicScoreWeight:highestScoringRelativeScoreMultiplier:]((id *)[FCTopicalNode alloc], v5, v9, v7, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

  objc_msgSend(v10, "addObject:", v11);
}

uint64_t __FCTopicallyOrderGroups_block_invoke_146(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", CFSTR("identifiers"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fc_arrayByTransformingWithBlock:", &__block_literal_global_150);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("@unionOfArrays.self"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "count");
  if (v6 == objc_msgSend(v5, "count"))
  {
    v7 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(a1 + 40), "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToSet:", v5);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __FCTopicallyOrderGroups_block_invoke_2_149(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "allObjects");
}

void __FCTopicallyOrderGroups_block_invoke_153(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  v5 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __FCTopicallyOrderGroups_block_invoke_2_154;
  v8[3] = &unk_1E463C028;
  v9 = v5;
  v10 = v3;
  v11 = v4;
  v6 = v4;
  v7 = v3;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v8);

}

void __FCTopicallyOrderGroups_block_invoke_2_154(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __FCTopicallyOrderGroups_block_invoke_3_155;
  v6[3] = &unk_1E463C028;
  v7 = v3;
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void __FCTopicallyOrderGroups_block_invoke_3_155(id *a1, id a2)
{
  id v3;
  FCTopicalEdge *v4;
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id *v14;
  id *v15;
  id v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  _QWORD v21[2];
  _BYTE v22[22];
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a1[4] == a2)
    return;
  v3 = a2;
  v4 = [FCTopicalEdge alloc];
  v5 = a1[4];
  v6 = v3;
  if (!v4)
    goto LABEL_13;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "node1");
    *(_DWORD *)v22 = 136315906;
    *(_QWORD *)&v22[4] = "-[FCTopicalEdge initWithNode:andNode:]";
    *(_WORD *)&v22[12] = 2080;
    *(_QWORD *)&v22[14] = "FCHeadlineClusterOrdering.m";
    v23 = 1024;
    v24 = 431;
    v25 = 2114;
    v26 = v18;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v22, 0x26u);

    if (v6)
      goto LABEL_8;
  }
  else if (v6)
  {
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "node2");
    *(_DWORD *)v22 = 136315906;
    *(_QWORD *)&v22[4] = "-[FCTopicalEdge initWithNode:andNode:]";
    *(_WORD *)&v22[12] = 2080;
    *(_QWORD *)&v22[14] = "FCHeadlineClusterOrdering.m";
    v23 = 1024;
    v24 = 432;
    v25 = 2114;
    v26 = v19;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v22, 0x26u);

  }
LABEL_8:
  *(_QWORD *)v22 = v4;
  *(_QWORD *)&v22[8] = FCTopicalEdge;
  v7 = objc_msgSendSuper2((objc_super *)v22, sel_init);
  if (v7)
  {
    if (v6 && v5)
    {
      v21[0] = v5;
      v21[1] = v6;
      v20 = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_81);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v20[2];
      v20[2] = v10;

      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v20[3];
      v20[3] = v12;

    }
    else
    {
      v9 = v7;
      v20 = 0;
    }

    goto LABEL_16;
  }
LABEL_13:
  v20 = 0;
LABEL_16:

  v14 = a1 + 5;
  if ((objc_msgSend(a1[5], "containsObject:", v20) & 1) == 0)
  {
    v16 = a1[6];
    v15 = a1 + 6;
    if ((objc_msgSend(v16, "containsObject:", v20) & 1) == 0)
    {
      -[FCTopicalEdge calculateRelatedness](v20);
      v17 = v20;
      if (v20)
      {
        if ((objc_msgSend(v20, "relatednessCalculated") & 1) == 0)
          -[FCTopicalEdge calculateRelatedness](v20);
        v17 = v20;
        if (v20[5])
        {
          if (v20[4] + v20[6])
            v15 = v14;
        }
      }
      v20 = v17;
      objc_msgSend(*v15, "addObject:", v17);
    }
  }

}

uint64_t __FCTopicallyOrderGroups_block_invoke_4_157(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
    a2 = *(_QWORD *)(a2 + 24);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, a2);
}

void __FCTopicallyOrderGroups_block_invoke_5_159(uint64_t a1, _QWORD *a2)
{
  double *v4;
  void *v5;
  void *v6;
  double *v7;
  _QWORD *v8;

  if (a2)
    v4 = (double *)a2[2];
  else
    v4 = 0;
  v5 = *(void **)(a1 + 32);
  v8 = a2;
  -[FCTopicalNode considerEdge:withNodeScorer:](v4, v8, v5);
  if (a2)
  {
    v6 = v8;
    v7 = (double *)v8[3];
  }
  else
  {
    v7 = 0;
    v6 = v8;
  }
  -[FCTopicalNode considerEdge:withNodeScorer:](v7, v6, *(void **)(a1 + 32));

}

void __FCTopicallyOrderGroups_block_invoke_6_163(uint64_t a1, void *a2)
{
  id *v3;
  id *v4;
  id WeakRetained;
  id *v6;

  v3 = a2;
  if (v3)
  {
    v4 = v3 + 7;
    v6 = v3;
    WeakRetained = objc_loadWeakRetained(v3 + 7);

    v3 = v6;
    if (!WeakRetained)
    {
      objc_storeWeak(v4, *(id *)(a1 + 32));
      v3 = v6;
    }
  }

}

void __FCTopicallyOrderGroups_block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __FCTopicallyOrderGroups_block_invoke_8;
  v6[3] = &unk_1E463C0A0;
  v7 = v4;
  v8 = v3;
  v5 = v3;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v6);

}

void __FCTopicallyOrderGroups_block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __FCTopicallyOrderGroups_block_invoke_9;
  v6[3] = &unk_1E463C0A0;
  v7 = v3;
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void __FCTopicallyOrderGroups_block_invoke_9(uint64_t a1, void *a2)
{
  id *v3;
  id *v4;
  id *WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id *v9;

  v3 = a2;
  v4 = *(id **)(a1 + 32);
  if (v4 != v3)
  {
    v9 = v3;
    if (v3)
    {
      WeakRetained = (id *)objc_loadWeakRetained(v3 + 7);
      v4 = *(id **)(a1 + 32);
    }
    else
    {
      WeakRetained = 0;
    }

    v3 = v9;
    if (WeakRetained == v4)
    {
      objc_opt_class();
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 && (objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        v8 = v7;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 0;
      }

      objc_msgSend(v8, "addObject:", v9);
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, *(_QWORD *)(a1 + 32));

      v3 = v9;
    }
  }

}

void __FCTopicallyOrderGroups_block_invoke_10(int a1, uint64_t a2, id obj)
{
  if (a2)
    objc_storeStrong((id *)(a2 + 64), obj);
}

uint64_t __FCTopicallyOrderGroups_block_invoke_11(uint64_t a1, void *a2, uint64_t a3)
{
  double *v4;
  double v5;
  double v6;
  uint64_t v7;

  v4 = a2;
  v5 = 0.0;
  v6 = 0.0;
  if (a3)
    v6 = *(double *)(a3 + 8) * *(double *)(a3 + 72);
  if (v4)
    v5 = v4[1] * v4[9];
  if (v6 < v5)
    v7 = -1;
  else
    v7 = v6 > v5;

  return v7;
}

id __FCTopicallyOrderGroups_block_invoke_12(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD aBlock[4];
  id v17;

  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __FCTopicallyOrderGroups_block_invoke_13;
  aBlock[3] = &unk_1E463C150;
  v17 = *(id *)(a1 + 40);
  v3 = _Block_copy(aBlock);
  v13[0] = v2;
  v13[1] = 3221225472;
  v13[2] = __FCTopicallyOrderGroups_block_invoke_15;
  v13[3] = &unk_1E463C1C8;
  v14 = *(id *)(a1 + 48);
  v4 = v3;
  v15 = v4;
  v5 = _Block_copy(v13);
  v6 = _Block_copy(v5);
  v7 = *(_QWORD **)(a1 + 32);
  if (v7)
    v7 = (_QWORD *)v7[8];
  v8 = v7;
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingComparator:", *(_QWORD *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  (*((void (**)(void *, void *, void *))v5 + 2))(v5, v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __FCTopicallyOrderGroups_block_invoke_13(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  if (a2)
    v3 = *(void **)(a2 + 24);
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __FCTopicallyOrderGroups_block_invoke_14;
  v8[3] = &unk_1E463C128;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v5, "sortedArrayUsingComparator:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __FCTopicallyOrderGroups_block_invoke_14(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  double v12;
  uint64_t v13;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a2;
  objc_msgSend(v6, "setWithObject:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (*(double (**)(uint64_t, void *))(v5 + 16))(v5, v8);
  v10 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (*(double (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  if (v9 < v12)
    v13 = -1;
  else
    v13 = v9 > v12;

  return v13;
}

id __FCTopicallyOrderGroups_block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C99D20];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __FCTopicallyOrderGroups_block_invoke_16;
  v12[3] = &unk_1E463C1A0;
  v13 = v6;
  v14 = v5;
  v15 = *(id *)(a1 + 32);
  v16 = *(id *)(a1 + 40);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "fc_array:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __FCTopicallyOrderGroups_block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __FCTopicallyOrderGroups_block_invoke_17;
  v6[3] = &unk_1E463C178;
  v7 = v3;
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void __FCTopicallyOrderGroups_block_invoke_17(_QWORD *a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;

  v12 = a2;
  if (v12 && v12[8])
  {
    v3 = (void *)a1[4];
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))a1[5];
    v5 = _Block_copy(v4);
    v6 = v12[8];
    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sortedArrayUsingComparator:", a1[6]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v4)[2](v4, v5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v9);

  }
  v10 = (void *)a1[4];
  (*(void (**)(void))(a1[7] + 16))();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v11);

}

id __FCTopicallyOrderGroups_block_invoke_18(uint64_t a1, void *a2)
{
  void *v2;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id WeakRetained;
  id v12;
  void *v13;
  id v14;
  __CFString *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  id *v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;

  v4 = a2;
  v5 = (uint64_t)v4;
  v27 = (void *)MEMORY[0x1E0CB3940];
  if (v4)
    v6 = (void *)v4[3];
  else
    v6 = 0;
  v7 = v6;
  v8 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __FCTopicallyOrderGroups_block_invoke_19;
  v36[3] = &unk_1E463C218;
  v37 = *(id *)(a1 + 32);
  objc_msgSend(v7, "fc_arrayByTransformingWithBlock:", v36);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(","));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -[FCTopicalNode individualScoreWithTopicScoreProvider:](v5, *(_QWORD *)(a1 + 40)));
  v29 = v7;
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v9;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(v5 + 8) * *(double *)(v5 + 72));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(v5 + 56));
    v26 = WeakRetained == 0;
    if (WeakRetained)
    {
      v12 = objc_loadWeakRetained((id *)(v5 + 56));
      v2 = v12;
      if (v12)
        v13 = (void *)*((_QWORD *)v12 + 3);
      else
        v13 = 0;
      v14 = v13;
      v34[0] = v8;
      v34[1] = 3221225472;
      v34[2] = __FCTopicallyOrderGroups_block_invoke_20;
      v34[3] = &unk_1E463C218;
      v24 = &v35;
      v35 = *(id *)(a1 + 32);
      v25 = v14;
      objc_msgSend(v14, "fc_arrayByTransformingWithBlock:", v34);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR(","));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = CFSTR("nil");
    }
    v16 = *(void **)(v5 + 64);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = 0;
    v16 = 0;
    v26 = 1;
    v15 = CFSTR("nil");
  }
  v17 = v16;
  objc_msgSend(v17, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v8;
  v32[1] = 3221225472;
  v32[2] = __FCTopicallyOrderGroups_block_invoke_21;
  v32[3] = &unk_1E463C240;
  v33 = *(id *)(a1 + 32);
  objc_msgSend(v18, "fc_arrayByTransformingWithBlock:", v32);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "componentsJoinedByString:", CFSTR(","));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringWithFormat:", CFSTR("Node : %@ (Individual Score : %@ Final Score : %@) Parent : %@ Children : %@"), v31, v30, v10, v15, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {

  }
  return v21;
}

id __FCTopicallyOrderGroups_block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("root")))
  {
    v4 = v3;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

id __FCTopicallyOrderGroups_block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("root")))
  {
    v4 = v3;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

id __FCTopicallyOrderGroups_block_invoke_21(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  if (a2)
    v2 = *(void **)(a2 + 24);
  else
    v2 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __FCTopicallyOrderGroups_block_invoke_22;
  v7[3] = &unk_1E463C218;
  v8 = *(id *)(a1 + 32);
  v3 = v2;
  objc_msgSend(v3, "fc_arrayByTransformingWithBlock:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __FCTopicallyOrderGroups_block_invoke_22(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("root")))
  {
    v4 = v3;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

id __FCTopicallyOrderGroups_block_invoke_178(uint64_t a1, void *a2)
{
  id *v3;
  id *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;

  v3 = a2;
  v4 = v3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  if (v3 && (v6 = v3[2]) != 0)
  {
    v26 = v6;
    v7 = (void *)*((_QWORD *)v6 + 3);
  }
  else
  {
    v26 = 0;
    v7 = 0;
  }
  v8 = v7;
  v9 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __FCTopicallyOrderGroups_block_invoke_2_179;
  v32[3] = &unk_1E463C218;
  v33 = *(id *)(a1 + 32);
  objc_msgSend(v8, "fc_arrayByTransformingWithBlock:", v32);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR(","));
  v28 = v10;
  v29 = v8;
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v11 = v4[3];
    v12 = v11;
    if (v11)
    {
      v13 = (void *)*((_QWORD *)v11 + 3);
      goto LABEL_7;
    }
  }
  else
  {
    v12 = 0;
  }
  v13 = 0;
LABEL_7:
  v30[0] = v9;
  v30[1] = 3221225472;
  v30[2] = __FCTopicallyOrderGroups_block_invoke_3_180;
  v30[3] = &unk_1E463C218;
  v31 = *(id *)(a1 + 32);
  v14 = v13;
  objc_msgSend(v14, "fc_arrayByTransformingWithBlock:", v30);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "componentsJoinedByString:", CFSTR(","));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v17 = v4[4];
  else
    v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v19 = v4[5];
  else
    v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v21 = v4[6];
  else
    v21 = 0;
  v22 = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("Edge from %@ to %@ with { %@ -- %@ -- %@ }"), v27, v16, v18, v20, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

id __FCTopicallyOrderGroups_block_invoke_2_179(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("root")))
  {
    v4 = v3;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

id __FCTopicallyOrderGroups_block_invoke_3_180(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("root")))
  {
    v4 = v3;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

@end
