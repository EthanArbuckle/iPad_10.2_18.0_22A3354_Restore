@implementation NSArray(HealthKit)

- (id)hk_map:()HealthKit
{
  void (**v5)(id, _QWORD);
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = a1;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v5[2](v5, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v6, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+HealthKit.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filter"));

    v6 = (id)objc_msgSend(a1, "copy");
  }

  return v6;
}

- (id)hk_filter:()HealthKit
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3880];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __32__NSArray_HealthKit__hk_filter___block_invoke;
  v10[3] = &unk_1E37EF368;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "predicateWithBlock:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filteredArrayUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)hk_firstObjectPassingTest:()HealthKit
{
  uint64_t (**v5)(id, void *);
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+HealthKit.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("testHandler"));

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = a1;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((v5[2](v5, v10) & 1) != 0)
        {
          v7 = v10;
          goto LABEL_13;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

  return v7;
}

+ (id)hk_arrayWithCount:()HealthKit generator:
{
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v7 = a4;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 >= 1)
    {
      do
      {
        v9 = (void *)MEMORY[0x19AEC7968]();
        v7[2](v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_autoreleasePoolPop(v9);
        if (v10)
          objc_msgSend(v8, "addObject:", v10);

        --a3;
      }
      while (a3);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+HealthKit.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (id)hk_map:()HealthKit error:
{
  void (**v7)(id, _QWORD, id *);
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = a1;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v24;
      while (2)
      {
        v14 = 0;
        v15 = v12;
        do
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v9);
          v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v14);
          v22 = v15;
          v7[2](v7, v16, &v22);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v22;

          if (!v17)
          {
            v18 = v12;
            v12 = v18;
            if (v18)
            {
              if (a4)
                *a4 = objc_retainAutorelease(v18);
              else
                _HKLogDroppedError(v18);
            }

            v19 = 0;
            goto LABEL_18;
          }
          objc_msgSend(v8, "addObject:", v17);

          ++v14;
          v15 = v12;
        }
        while (v11 != v14);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v11)
          continue;
        break;
      }
    }
    else
    {
      v12 = 0;
    }

    v19 = v8;
LABEL_18:

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+HealthKit.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filter"));

    v19 = (id)objc_msgSend(a1, "copy");
  }

  return v19;
}

- (id)hk_foldRightFrom:()HealthKit with:
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__24;
  v18 = __Block_byref_object_dispose__24;
  v19 = (id)objc_msgSend(v6, "copy");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__NSArray_HealthKit__hk_foldRightFrom_with___block_invoke;
  v11[3] = &unk_1E37EF390;
  v13 = &v14;
  v8 = v7;
  v12 = v8;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v11);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (BOOL)hk_containsObjectPassingTest:()HealthKit
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "hk_firstObjectPassingTest:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (uint64_t)hk_allObjectsPassTest:()HealthKit
{
  unsigned int (**v4)(id, _QWORD);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = a1;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (!v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9)))
        {
          v10 = 0;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (id)hk_averageUsingEvaluationBlock:()HealthKit
{
  double (**v4)(id, _QWORD);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(a1, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = a1;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      v9 = 0.0;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v9 = v9 + v4[2](v4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }
    else
    {
      v9 = 0.0;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9 / (double)(unint64_t)objc_msgSend(v5, "count", (_QWORD)v13));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (double)hk_sumUsingEvaluationBlock:()HealthKit
{
  double (**v4)(id, _QWORD);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = a1;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v9 = v9 + v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

- (id)hk_firstObjectWithMaximumValueUsingEvaluationBlock:()HealthKit
{
  double (**v4)(id, void *);
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = a1;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v18;
    v10 = -1.79769313e308;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = v4[2](v4, v12);
        if (v13 > v10)
        {
          v14 = v13;
          v15 = v12;

          v8 = v15;
          v10 = v14;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)hk_firstObjectWithMinimumValueUsingEvaluationBlock:()HealthKit
{
  double (**v4)(id, void *);
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = a1;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v18;
    v10 = 1.79769313e308;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = v4[2](v4, v12);
        if (v13 < v10)
        {
          v14 = v13;
          v15 = v12;

          v8 = v15;
          v10 = v14;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)hk_firstSortedObjectWithComparison:()HealthKit
{
  uint64_t (**v4)(id, id, _QWORD);
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = a1;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v8)
        {
          if (v4[2](v4, v8, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i)) == 1)
          {
            v12 = v11;

            v8 = v12;
          }
        }
        else
        {
          v8 = v11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (uint64_t)hk_containsObjectsInArray:()HealthKit
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = (objc_class *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithArray:", v5);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", a1);
  v8 = objc_msgSend(v6, "isSubsetOfSet:", v7);

  return v8;
}

- (BOOL)hk_allElementsUnique
{
  void *v2;
  uint64_t v3;
  _BOOL8 v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", a1);
  v3 = objc_msgSend(v2, "count");
  v4 = v3 == objc_msgSend(a1, "count");

  return v4;
}

- (uint64_t)hk_allElementsEqual
{
  void *v2;
  _BOOL8 v3;

  if (!objc_msgSend(a1, "count"))
    return 1;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", a1);
  v3 = objc_msgSend(v2, "count") == 1;

  return v3;
}

- (void)hk_partitionArrayWithPartitionSetupBlock:()HealthKit partitionMembershipCheckBlock:partitionExtendBlock:partitionFinalizeBlock:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[3];
  char v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(a1, "count"))
  {
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    v22 = 1;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __137__NSArray_HealthKit__hk_partitionArrayWithPartitionSetupBlock_partitionMembershipCheckBlock_partitionExtendBlock_partitionFinalizeBlock___block_invoke;
    v15[3] = &unk_1E37EF3B8;
    v20 = v21;
    v16 = v10;
    v17 = v11;
    v14 = (void (**)(_QWORD))v13;
    v18 = v14;
    v19 = v12;
    objc_msgSend(a1, "enumerateObjectsUsingBlock:", v15);
    v14[2](v14);

    _Block_object_dispose(v21, 8);
  }

}

- (id)hk_orPredicateWithPredicateBlock:()HealthKit
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(a1, "hk_map:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "orPredicateWithSubpredicates:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hk_mapToDictionary:()HealthKit
{
  void (**v5)(id, uint64_t, _QWORD *);
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v15;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = a1;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      v11 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          v16[0] = v11;
          v16[1] = 3221225472;
          v16[2] = __41__NSArray_HealthKit__hk_mapToDictionary___block_invoke;
          v16[3] = &unk_1E37E9E48;
          v17 = v6;
          v5[2](v5, v13, v16);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+HealthKit.m"), 228, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("map"));

    v6 = (id)objc_opt_new();
  }

  return v6;
}

- (id)hk_mapToSet:()HealthKit
{
  void (**v5)(id, _QWORD);
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = a1;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v5[2](v5, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v6, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+HealthKit.m"), 245, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filter"));

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)hk_enumeratePermutationsWithBlock:()HealthKit
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  char v15;

  v5 = a3;
  if (v5)
  {
    if (objc_msgSend(a1, "count"))
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v7 = (void *)objc_opt_class();
      v8 = (void *)objc_msgSend(a1, "mutableCopy");
      v9 = objc_msgSend(a1, "count");
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __56__NSArray_HealthKit__hk_enumeratePermutationsWithBlock___block_invoke;
      v12[3] = &unk_1E37EF3E0;
      v13 = v6;
      v14 = v5;
      v10 = v6;
      objc_msgSend(v7, "_permutationHelperForArray:number:permutationHandler:", v8, v9, v12);

    }
    else
    {
      v15 = 0;
      (*((void (**)(id, void *, char *))v5 + 2))(v5, a1, &v15);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+HealthKit.m"), 260, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
}

- (id)hk_reversed
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "reverseObjectEnumerator");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hk_shuffled
{
  void *v1;
  void *v2;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v1, "hk_shuffle");
  v2 = (void *)objc_msgSend(v1, "copy");

  return v2;
}

+ (uint64_t)_permutationHelperForArray:()HealthKit number:permutationHandler:
{
  id v8;
  uint64_t (**v9)(id, void *);
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v8 = a3;
  v9 = a5;
  if (a4 == 1)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v8);
    v11 = v9[2](v9, v10);

  }
  else if (a4 < 2)
  {
LABEL_10:
    v11 = objc_msgSend(a1, "_permutationHelperForArray:number:permutationHandler:", v8, a4 - 1, v9);
  }
  else
  {
    v12 = 0;
    while (objc_msgSend(a1, "_permutationHelperForArray:number:permutationHandler:", v8, a4 - 1, v9))
    {
      if ((a4 & 1) != 0)
        v13 = 0;
      else
        v13 = v12;
      objc_msgSend(v8, "exchangeObjectAtIndex:withObjectAtIndex:", v13, a4 - 1);
      if (a4 - 1 == ++v12)
        goto LABEL_10;
    }
    v11 = 0;
  }

  return v11;
}

- (void)hk_enumeratePermutationsOfSubsetsOfLength:()HealthKit block:
{
  void (**v7)(id, _QWORD, char *);
  void *v8;
  void *v9;
  void *v10;
  char v11;
  char v12;

  v7 = a4;
  if (v7)
  {
    if (objc_msgSend(a1, "count") < a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+HealthKit.m"), 320, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count <= self.count"));

    }
    if (objc_msgSend(a1, "count") >= a3)
    {
      if (objc_msgSend(a1, "count"))
      {
        if (a3)
        {
          objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", a3);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_permutationsWithCount:permutation:depth:block:", a3, v8, 0, v7);

        }
        else
        {
          v11 = 0;
          v7[2](v7, MEMORY[0x1E0C9AA60], &v11);
        }
      }
      else
      {
        v12 = 0;
        ((void (**)(id, void *, char *))v7)[2](v7, a1, &v12);
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+HealthKit.m"), 315, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
}

- (uint64_t)_permutationsWithCount:()HealthKit permutation:depth:block:
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void (**v22)(id, void *, _BYTE *);
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v22 = a6;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = a1;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        if ((objc_msgSend(v10, "containsObject:", v16, v22) & 1) == 0)
        {
          objc_msgSend(v10, "setObject:atIndexedSubscript:", v16, a5);
          if (a5 + 1 >= a3)
          {
            v23 = 0;
            v17 = objc_alloc(MEMORY[0x1E0C99D20]);
            objc_msgSend(v10, "array");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (void *)objc_msgSend(v17, "initWithArray:", v18);
            v22[2](v22, v19, &v23);

            if (v23)
            {
LABEL_15:
              v20 = 0;
              goto LABEL_16;
            }
          }
          else if (!objc_msgSend(v11, "_permutationsWithCount:permutation:depth:block:", a3, v10, a5 + 1, v22))
          {
            goto LABEL_15;
          }
          objc_msgSend(v10, "removeObjectAtIndex:", a5);
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v13)
        continue;
      break;
    }
  }
  v20 = 1;
LABEL_16:

  return v20;
}

- (id)hk_mutableSubarrayWithRange:()HealthKit
{
  uint64_t v4;
  void *i;
  void *v8;

  v4 = a4;
  for (i = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4); v4; --v4)
  {
    objc_msgSend(a1, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(i, "addObject:", v8);

    ++a3;
  }
  return i;
}

- (id)hk_splitWithBucketCount:()HealthKit
{
  uint64_t v3;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v16;

  v3 = a3;
  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+HealthKit.m"), 380, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count > 0"));

  }
  v5 = objc_msgSend(a1, "count");
  v6 = objc_msgSend(a1, "count");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v3);
  if (v3 >= 1)
  {
    v8 = 0;
    v9 = v6 % v3;
    v10 = MEMORY[0x1E0C9AA60];
    v11 = v5 / v3;
    do
    {
      if (v9 <= 0)
        v12 = v11;
      else
        v12 = v11 + 1;
      if (v8 < objc_msgSend(a1, "count") && v12)
      {
        objc_msgSend(a1, "subarrayWithRange:", v8, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

      }
      else
      {
        objc_msgSend(v7, "addObject:", v10);
      }
      v9 -= v9 > 0;
      v8 += v12;
      --v3;
    }
    while (v3);
  }
  return v7;
}

@end
