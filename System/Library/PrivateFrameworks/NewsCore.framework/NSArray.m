@implementation NSArray

uint64_t __53__NSArray_FCAdditions__fc_arrayOfObjectsPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__NSArray_FCAdditions__fc_arrayByTransformingWithBlockWithIndex___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);
    v2 = v3;
  }

}

uint64_t __56__NSArray_FCAdditions__fc_arrayByTransformingWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __54__NSArray_FCAdditions__fc_setByTransformingWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);
    v2 = v3;
  }

}

id __65__NSArray_FCAdditions__fc_dictionaryOfSortedObjectsWithKeyBlock___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

BOOL __59__NSArray_FCAdditions__fc_arrayByRemovingKeysInDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

void __53__NSArray_FCAdditions__fc_splitArrayWithTest_result___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t (*v8)(uint64_t, id, uint64_t, uint64_t);
  int v9;
  uint64_t v10;
  id v11;

  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(uint64_t (**)(uint64_t, id, uint64_t, uint64_t))(v7 + 16);
  v11 = a2;
  v9 = v8(v7, v11, a3, a4);
  v10 = 40;
  if (v9)
    v10 = 32;
  objc_msgSend(*(id *)(a1 + v10), "addObject:", v11);

}

void __50__NSArray_FCAdditions__fc_randomlyMergeWithArray___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  if (v3)
  {
    v5 = v3;
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
      v4 = arc4random_uniform(objc_msgSend(*(id *)(a1 + 32), "count"));
    else
      v4 = 0;
    objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v5, v4);
    v3 = v5;
  }

}

void __50__NSArray_FCAdditions__fc_randomlyMergeWithArray___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  id v7;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  v7 = a3;
  v6(v5, a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __60__NSArray_FCAdditions__fc_firstObjectFromIndex_passingTest___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

uint64_t __55__NSArray_FCAdditions__fc_firstObjectWithValue_forKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "valueForKey:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40));

  return v4;
}

uint64_t __46__NSArray_FCAdditions__fc_firstObjectOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __46__NSArray_FCAdditions__fc_allObjectsPassTest___block_invoke(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))() ^ 1;
}

void __70__NSArray_FCAdditions__fc_objectsOfMaxValueWithValueBlock_comparator___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          if (v7)
          {
            v12 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
            if (v12 == 1)
            {
              objc_msgSend(v3, "removeAllObjects");
              objc_msgSend(v3, "addObject:", v10);
              v13 = v11;

              v7 = v13;
            }
            else if (!v12)
            {
              objc_msgSend(v3, "addObject:", v10);
            }
          }
          else
          {
            objc_msgSend(v3, "addObject:", v10, (_QWORD)v14);
            v7 = v11;
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

}

void __70__NSArray_FCAdditions__fc_objectsOfMinValueWithValueBlock_comparator___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          if (v7)
          {
            v12 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
            if (v12)
            {
              if (v12 == -1)
              {
                objc_msgSend(v3, "removeAllObjects");
                objc_msgSend(v3, "addObject:", v10);
                v13 = v11;

                v7 = v13;
              }
            }
            else
            {
              objc_msgSend(v3, "addObject:", v10);
            }
          }
          else
          {
            objc_msgSend(v3, "addObject:", v10, (_QWORD)v14);
            v7 = v11;
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

}

void __51__NSArray_FCAdditions__fc_setOfObjectsPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __61__NSArray_FCAdditions__fc_orderedSetByTransformingWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);
    v2 = v3;
  }

}

uint64_t __53__NSArray_FCAdditions__fc_arrayOfObjectsFailingTest___block_invoke(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))() ^ 1;
}

uint64_t __61__NSArray_FCAdditions__fc_arrayByRemovingObjectsPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

BOOL __118__NSArray_FCAdditions__fc_arraysByPartitioningWithBudget_indicesOfOverBudgetObjects_appraiser_accumulator_comparator___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2) == -1;
}

void __118__NSArray_FCAdditions__fc_arraysByPartitioningWithBudget_indicesOfOverBudgetObjects_appraiser_accumulator_comparator___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  void (**v8)(_QWORD);
  uint64_t v9;
  uint64_t v10;
  void (**v11)(_QWORD);
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  id *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  id *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v5 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 56) + 16))())
  {
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
  }
  else
  {
    v30 = 0;
    v31 = (id *)&v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__54;
    v34 = __Block_byref_object_dispose__54;
    v35 = 0;
    v24 = 0;
    v25 = (id *)&v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__54;
    v28 = __Block_byref_object_dispose__54;
    v29 = 0;
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __118__NSArray_FCAdditions__fc_arraysByPartitioningWithBudget_indicesOfOverBudgetObjects_appraiser_accumulator_comparator___block_invoke_3;
    v19 = &unk_1E4647518;
    v20 = *(id *)(a1 + 40);
    v22 = &v30;
    v23 = &v24;
    v7 = v6;
    v21 = v7;
    v8 = (void (**)(_QWORD))_Block_copy(&v16);
    v11 = v8;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    {
      (*(void (**)(_QWORD, _QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v7, v9, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((*(unsigned int (**)(_QWORD, void *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v12, v13, v14, v15))
      {
        v11[2](v11);
      }
      else
      {
        objc_storeStrong(v31 + 5, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
        objc_storeStrong(v25 + 5, v12);
      }

    }
    else
    {
      v8[2](v8);
    }
    objc_msgSend(v31[5], "addObject:", v5, v16, v17, v18, v19);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v31[5]);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v25[5]);

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);

  }
}

void __118__NSArray_FCAdditions__fc_arraysByPartitioningWithBudget_indicesOfOverBudgetObjects_appraiser_accumulator_comparator___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;
  v5 = v2;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 40));
}

uint64_t __62__NSArray_FCAdditions__fc_indexOfFirstObjectWithValue_forKey___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned __int8 *a4)
{
  void *v6;

  objc_msgSend(a2, "valueForKey:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 40));

  return *a4;
}

uint64_t __55__NSArray_FCAdditions__fc_indexesOfObjectsIdenticalTo___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

uint64_t __55__NSArray_FCAdditions__fc_indexesOfObjectsPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __83__NSArray_FCAdditions__fc_arrayByMergingAdjacentObjectsWithMergePolicy_mergeBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v8 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = v8;
    v5 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }

}

uint64_t __45__NSArray_FCAdditions__fc_distanceFromArray___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

uint64_t __45__NSArray_FCAdditions__fc_distanceFromArray___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

uint64_t __46__NSArray_FCAdditions__fc_uniqueByValueBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v2) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t __79__NSArray_FCAdditions__fc_enumerateIslandsOfCommonValuesForKeyBlock_withBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0DE7910];
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "nf_object:isEqualToObject:", v3, *(_QWORD *)(a1 + 32)) ^ 1;

  return v4;
}

uint64_t __78__NSArray_FCAdditions__fc_sortedArrayStartingWithElementsSatisfying_sortedBy___block_invoke()
{
  return 0;
}

uint64_t __78__NSArray_FCAdditions__fc_sortedArrayStartingWithElementsSatisfying_sortedBy___block_invoke_2()
{
  return 0;
}

void __78__NSArray_FCAdditions__fc_sortedArrayStartingWithElementsSatisfying_sortedBy___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__NSArray_FCAdditions__fc_sortedArrayStartingWithElementsSatisfying_sortedBy___block_invoke_4;
  v12[3] = &unk_1E4647608;
  v6 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = v7;
  v13 = v4;
  v8 = v5;
  v11 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);
  objc_msgSend(v11, "sortedArrayUsingComparator:", *(_QWORD *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v9);

  objc_msgSend(v8, "sortedArrayUsingComparator:", *(_QWORD *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v10);

}

void __78__NSArray_FCAdditions__fc_sortedArrayStartingWithElementsSatisfying_sortedBy___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, id);
  int v5;
  uint64_t v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(uint64_t (**)(uint64_t, id))(v3 + 16);
  v7 = a2;
  v5 = v4(v3, v7);
  v6 = 40;
  if (v5)
    v6 = 32;
  objc_msgSend(*(id *)(a1 + v6), "addObject:", v7);

}

id __39__NSArray_FCArchivable__contentArchive__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  if (a2)
  {
    if (objc_msgSend(a2, "conformsToProtocol:", &unk_1EE666C30))
      v3 = a2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  objc_msgSend(v4, "contentArchive");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __40__NSArray_FCArchivable__contentManifest__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  if (a2)
  {
    if (objc_msgSend(a2, "conformsToProtocol:", &unk_1EE666C30))
      v3 = a2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  objc_msgSend(v4, "contentManifest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
