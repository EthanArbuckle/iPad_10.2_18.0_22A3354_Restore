@implementation NAGroupedItemDiff

+ (id)diffFromGroups:(id)a3 toGroups:(id)a4
{
  return (id)objc_msgSend(a1, "diffFromGroups:toGroups:changeTest:", a3, a4, &__block_literal_global_6);
}

+ (id)diffFromGroups:(id)a3 toGroups:(id)a4 changeTest:(id)a5
{
  id v7;
  id v8;
  id v9;
  NAGroupedItemDiff *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[NAGroupedItemDiff initWithFromGroups:toGroups:changeTest:]([NAGroupedItemDiff alloc], "initWithFromGroups:toGroups:changeTest:", v9, v8, v7);

  return v10;
}

+ (id)_groupedItemDiffWithGroupOperations:(id)a3 itemOperations:(id)a4
{
  id v5;
  id v6;
  NAGroupedItemDiff *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[NAGroupedItemDiff initWithFromGroups:toGroups:changeTest:]([NAGroupedItemDiff alloc], "initWithFromGroups:toGroups:changeTest:", 0, 0, &__block_literal_global_6);
  -[NAGroupedItemDiff setGroupOperations:](v7, "setGroupOperations:", v6);

  -[NAGroupedItemDiff setItemOperations:](v7, "setItemOperations:", v5);
  return v7;
}

- (NAGroupedItemDiff)initWithFromGroups:(id)a3 toGroups:(id)a4 changeTest:(id)a5
{
  id v8;
  id v9;
  id v10;
  NAGroupedItemDiff *v11;
  NAGroupedItemDiff *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)NAGroupedItemDiff;
  v11 = -[NAGroupedItemDiff init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[NAGroupedItemDiff setFromGroups:](v11, "setFromGroups:", v8);
    -[NAGroupedItemDiff setToGroups:](v12, "setToGroups:", v9);
    -[NAGroupedItemDiff setChangeTest:](v12, "setChangeTest:", v10);
    -[NAGroupedItemDiff _performDiff](v12, "_performDiff");
  }

  return v12;
}

- (NSArray)allOperations
{
  void *v3;
  void *v4;
  void *v5;

  -[NAGroupedItemDiff groupOperations](self, "groupOperations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NAGroupedItemDiff itemOperations](self, "itemOperations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (void)_performDiff
{
  NAUniqueArrayDiffOptions *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, uint64_t);
  void *v24;
  id v25;
  NAGroupedItemDiff *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  NAGroupedItemDiff *v32;
  _QWORD v33[4];
  id v34;
  NAGroupedItemDiff *v35;
  _QWORD v36[4];
  id v37;
  NAGroupedItemDiff *v38;

  v3 = objc_alloc_init(NAUniqueArrayDiffOptions);
  -[NAUniqueArrayDiffOptions setEqualComparator:](v3, "setEqualComparator:", &__block_literal_global_67);
  -[NAUniqueArrayDiffOptions setHashGenerator:](v3, "setHashGenerator:", &__block_literal_global_69_0);
  -[NAUniqueArrayDiffOptions setAllowMoves:](v3, "setAllowMoves:", 0);
  -[NAGroupedItemDiff fromGroups](self, "fromGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NAGroupedItemDiff toGroups](self, "toGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NAUniqueArrayDiff diffFromArray:toArray:options:](NAUniqueArrayDiff, "diffFromArray:toArray:options:", v4, v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "numberOfOperations"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __33__NAGroupedItemDiff__performDiff__block_invoke_3;
  v36[3] = &unk_1E6228710;
  v9 = v7;
  v37 = v9;
  v38 = self;
  objc_msgSend(v6, "enumerateDeletesUsingBlock:", v36);
  v33[0] = v8;
  v33[1] = 3221225472;
  v33[2] = __33__NAGroupedItemDiff__performDiff__block_invoke_4;
  v33[3] = &unk_1E6228738;
  v10 = v9;
  v34 = v10;
  v35 = self;
  objc_msgSend(v6, "enumerateMovesUsingBlock:", v33);
  v30[0] = v8;
  v30[1] = 3221225472;
  v30[2] = __33__NAGroupedItemDiff__performDiff__block_invoke_5;
  v30[3] = &unk_1E6228710;
  v31 = v10;
  v32 = self;
  v11 = v10;
  objc_msgSend(v6, "enumerateInsertsUsingBlock:", v30);
  v12 = (void *)MEMORY[0x1E0C99E08];
  -[NAGroupedItemDiff fromGroups](self, "fromGroups");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[NAGroupedItemDiff fromGroups](self, "fromGroups");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v8;
  v28[1] = 3221225472;
  v28[2] = __33__NAGroupedItemDiff__performDiff__block_invoke_6;
  v28[3] = &unk_1E6228760;
  v16 = v14;
  v29 = v16;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v28);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NAGroupedItemDiff toGroups](self, "toGroups");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v8;
  v22 = 3221225472;
  v23 = __33__NAGroupedItemDiff__performDiff__block_invoke_7;
  v24 = &unk_1E6228788;
  v25 = v16;
  v26 = self;
  v27 = v17;
  v19 = v17;
  v20 = v16;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", &v21);

  -[NAGroupedItemDiff setGroupOperations:](self, "setGroupOperations:", v11, v21, v22, v23, v24);
  -[NAGroupedItemDiff setItemOperations:](self, "setItemOperations:", v19);

}

uint64_t __33__NAGroupedItemDiff__performDiff__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "groupIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "isEqualToString:", v6);
  return v7;
}

uint64_t __33__NAGroupedItemDiff__performDiff__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "groupIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

void __33__NAGroupedItemDiff__performDiff__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "fromGroups");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NAGroupDiffOperation deleteOperationWithGroup:atIndex:](NAGroupDiffOperation, "deleteOperationWithGroup:atIndex:", v4, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

}

void __33__NAGroupedItemDiff__performDiff__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "toGroups");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NAGroupDiffOperation moveOperationWithGroup:fromIndex:toIndex:](NAGroupDiffOperation, "moveOperationWithGroup:fromIndex:toIndex:", v6, a2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7);

}

void __33__NAGroupedItemDiff__performDiff__block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "toGroups");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NAGroupDiffOperation insertOperationWithGroup:atIndex:](NAGroupDiffOperation, "insertOperationWithGroup:atIndex:", v4, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

}

void __33__NAGroupedItemDiff__performDiff__block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "groupIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);
}

void __33__NAGroupedItemDiff__performDiff__block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v13 = v5;
  objc_msgSend(v5, "groupIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "fromGroups");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v8, "unsignedIntegerValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  v11 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "_performItemDiffFromGroup:atIndex:toGroup:atIndex:", v10, v8, v13, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObjectsFromArray:", v12);

}

- (id)_performItemDiffFromGroup:(id)a3 atIndex:(id)a4 toGroup:(id)a5 atIndex:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  NAUniqueArrayDiffOptions *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  void *v44;
  _QWORD v46[4];
  id v47;
  id v48;
  unint64_t v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  unint64_t v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  id v62;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
    NSLog(CFSTR("Cannot perform an item diff for a deleted group! Group: %@"), v9);
  objc_msgSend(v9, "diffableItems");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = (void *)MEMORY[0x1E0C9AA60];
  if (v12)
    v15 = (void *)v12;
  else
    v15 = (void *)MEMORY[0x1E0C9AA60];
  v16 = v15;

  objc_msgSend(v11, "diffableItems");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (void *)v17;
  else
    v19 = v14;
  v20 = v19;

  v21 = objc_alloc_init(NAUniqueArrayDiffOptions);
  -[NAGroupedItemDiff changeTest](self, "changeTest");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NAUniqueArrayDiffOptions setChangeComparator:](v21, "setChangeComparator:", v22);

  +[NAUniqueArrayDiff diffFromArray:toArray:options:](NAUniqueArrayDiff, "diffFromArray:toArray:options:", v16, v20, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  v44 = v9;
  if (!v9)
  {
    objc_msgSend(v23, "insertedIndexes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");
    v27 = objc_msgSend(v24, "numberOfOperations");

    if (v26 != v27)
      NSLog(CFSTR("Found non-insert item operations in group diff for new group %@! Diff: %@"), v11, v24, 0);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v24, "numberOfOperations"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = MEMORY[0x1E0C809B0];
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __71__NAGroupedItemDiff__performItemDiffFromGroup_atIndex_toGroup_atIndex___block_invoke;
  v59[3] = &unk_1E62287B0;
  v30 = v10;
  v60 = v30;
  v31 = v28;
  v61 = v31;
  v32 = v16;
  v62 = v32;
  objc_msgSend(v24, "enumerateChangesUsingBlock:", v59);
  v55[0] = v29;
  v55[1] = 3221225472;
  v55[2] = __71__NAGroupedItemDiff__performItemDiffFromGroup_atIndex_toGroup_atIndex___block_invoke_2;
  v55[3] = &unk_1E62287B0;
  v33 = v30;
  v56 = v33;
  v34 = v31;
  v57 = v34;
  v58 = v32;
  v35 = v32;
  objc_msgSend(v24, "enumerateDeletesUsingBlock:", v55);
  v50[0] = v29;
  v50[1] = 3221225472;
  v50[2] = __71__NAGroupedItemDiff__performItemDiffFromGroup_atIndex_toGroup_atIndex___block_invoke_3;
  v50[3] = &unk_1E62287D8;
  v51 = v33;
  v54 = a6;
  v36 = v34;
  v52 = v36;
  v37 = v20;
  v53 = v37;
  v38 = v33;
  objc_msgSend(v24, "enumerateMovesUsingBlock:", v50);
  v46[0] = v29;
  v46[1] = 3221225472;
  v46[2] = __71__NAGroupedItemDiff__performItemDiffFromGroup_atIndex_toGroup_atIndex___block_invoke_4;
  v46[3] = &unk_1E6228800;
  v49 = a6;
  v39 = v36;
  v47 = v39;
  v48 = v37;
  v40 = v37;
  objc_msgSend(v24, "enumerateInsertsUsingBlock:", v46);
  v41 = v48;
  v42 = v39;

  return v42;
}

void __71__NAGroupedItemDiff__performItemDiffFromGroup_atIndex_toGroup_atIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB36B0], "na_indexPathForItem:inSection:", a2, objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NAItemDiffOperation reloadOperationWithItem:atIndexPath:](NAItemDiffOperation, "reloadOperationWithItem:atIndexPath:", v5, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

}

void __71__NAGroupedItemDiff__performItemDiffFromGroup_atIndex_toGroup_atIndex___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB36B0], "na_indexPathForItem:inSection:", a2, objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NAItemDiffOperation deleteOperationWithItem:atIndexPath:](NAItemDiffOperation, "deleteOperationWithItem:atIndexPath:", v5, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

}

void __71__NAGroupedItemDiff__performItemDiffFromGroup_atIndex_toGroup_atIndex___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB36B0], "na_indexPathForItem:inSection:", a2, objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "na_indexPathForItem:inSection:", a3, *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NAItemDiffOperation moveOperationWithItem:fromIndexPath:toIndexPath:](NAItemDiffOperation, "moveOperationWithItem:fromIndexPath:toIndexPath:", v7, v9, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v8);

}

void __71__NAGroupedItemDiff__performItemDiffFromGroup_atIndex_toGroup_atIndex___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB36B0], "na_indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 48));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NAItemDiffOperation insertOperationWithItem:atIndexPath:](NAItemDiffOperation, "insertOperationWithItem:atIndexPath:", v5, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

}

- (id)_briefDescriptionForOperations:(id)a3 type:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD v25[4];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = v5;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v27;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v7);
        switch(objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v14), "type"))
        {
          case 0:
            ++v8;
            break;
          case 1:
            ++v11;
            break;
          case 2:
            ++v10;
            break;
          case 3:
            ++v9;
            break;
          default:
            break;
        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v12);
  }

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __57__NAGroupedItemDiff__briefDescriptionForOperations_type___block_invoke;
  v21[3] = &unk_1E6228828;
  v16 = v15;
  v22 = v16;
  v24 = v25;
  v17 = v6;
  v23 = v17;
  v18 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1B5E0F7A8](v21);
  ((void (**)(_QWORD, uint64_t, const __CFString *))v18)[2](v18, v11, CFSTR("inserted"));
  ((void (**)(_QWORD, uint64_t, const __CFString *))v18)[2](v18, v10, CFSTR("deleted"));
  ((void (**)(_QWORD, uint64_t, const __CFString *))v18)[2](v18, v9, CFSTR("moved"));
  ((void (**)(_QWORD, uint64_t, const __CFString *))v18)[2](v18, v8, CFSTR("reloaded"));
  v19 = v16;

  _Block_object_dispose(v25, 8);
  return v19;
}

void __57__NAGroupedItemDiff__briefDescriptionForOperations_type___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  void *v9;

  if (a2)
  {
    v5 = (void *)a1[4];
    if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24))
      v6 = CFSTR(" ");
    else
      v6 = &stru_1E6228C10;
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = a3;
    objc_msgSend(v7, "numberWithUnsignedInteger:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@%@ %@ %@"), v6, v9, a1[5], v8);

    ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  -[NAGroupedItemDiff groupOperations](self, "groupOperations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NAGroupedItemDiff _briefDescriptionForOperations:type:](self, "_briefDescriptionForOperations:type:", v3, CFSTR("groups"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  -[NAGroupedItemDiff itemOperations](self, "itemOperations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NAGroupedItemDiff _briefDescriptionForOperations:type:](self, "_briefDescriptionForOperations:type:", v5, CFSTR("items"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(" "));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("(no changes)");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p %@>"), objc_opt_class(), self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[NAGroupedItemDiff _operationDescriptionWithPrefix:](self, "_operationDescriptionWithPrefix:", CFSTR("    "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> operations: (\n%@\n)"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)operationDescription
{
  return (NSString *)-[NAGroupedItemDiff _operationDescriptionWithPrefix:](self, "_operationDescriptionWithPrefix:", &stru_1E6228C10);
}

- (id)_operationDescriptionWithPrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[NAGroupedItemDiff allOperations](self, "allOperations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__NAGroupedItemDiff__operationDescriptionWithPrefix___block_invoke;
  v10[3] = &unk_1E6228850;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_map:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(",\n"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __53__NAGroupedItemDiff__operationDescriptionWithPrefix___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "operationDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)groupOperations
{
  return self->_groupOperations;
}

- (void)setGroupOperations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)itemOperations
{
  return self->_itemOperations;
}

- (void)setItemOperations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)fromGroups
{
  return self->_fromGroups;
}

- (void)setFromGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)toGroups
{
  return self->_toGroups;
}

- (void)setToGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)changeTest
{
  return self->_changeTest;
}

- (void)setChangeTest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeTest, 0);
  objc_storeStrong((id *)&self->_toGroups, 0);
  objc_storeStrong((id *)&self->_fromGroups, 0);
  objc_storeStrong((id *)&self->_itemOperations, 0);
  objc_storeStrong((id *)&self->_groupOperations, 0);
}

@end
