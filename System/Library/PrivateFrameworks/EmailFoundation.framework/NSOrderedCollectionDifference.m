@implementation NSOrderedCollectionDifference

void __79__NSOrderedCollectionDifference_EmailFoundationAdditions__ef_groupedInsertions__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  EFOrderedCollectionGroupedInsertion *v6;
  id v7;

  v7 = a4;
  v6 = -[EFOrderedCollectionGroupedInsertion initWithObjects:index:]([EFOrderedCollectionGroupedInsertion alloc], "initWithObjects:index:", v7, a2);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

- (void)_groupedInsertionsWithObjectsToInsert:(void *)a3 insertGroup:
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(id, uint64_t, uint64_t, void *);
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v17 = a3;
  if (!a1)
    goto LABEL_21;
  objc_msgSend(a1, "insertions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    goto LABEL_21;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a1, "insertions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v9)
  {

    goto LABEL_21;
  }
  v10 = 0;
  v11 = *(_QWORD *)v19;
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v19 != v11)
        objc_enumerationMutation(v8);
      v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "index");
        objc_msgSend(v14, "object");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v15);
      }
      else
      {
        if (objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "index") == v10 + v12)
        {
          objc_msgSend(v14, "object");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v15);
          ++v10;
          goto LABEL_16;
        }
        if (v10)
        {
          v16 = (void *)objc_msgSend(v5, "copy");
          v17[2](v17, v12, v10, v16);

        }
        v12 = objc_msgSend(v14, "index");
        objc_msgSend(v5, "removeAllObjects");
        objc_msgSend(v14, "object");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v15);
      }
      v10 = 1;
LABEL_16:

    }
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v9);

  if (v10)
    v17[2](v17, v12, v10, v5);
LABEL_21:

}

BOOL __84__NSOrderedCollectionDifference_EmailFoundationAdditions__ef_removalsExcludingMoves__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "associatedIndex") == 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_groupedInsertionsByObjectForCollection:(int)a3 inferMoves:
{
  id v5;
  void *v6;
  id *v7;
  id *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __110__NSOrderedCollectionDifference_EmailFoundationAdditions___groupedInsertionsByObjectForCollection_inferMoves___block_invoke;
      v13[3] = &unk_1E62A65A8;
      v7 = &v14;
      v14 = v5;
      v8 = &v15;
      v15 = v6;
      -[NSOrderedCollectionDifference _groupedInsertionAndMoves:](a1, v13);
    }
    else
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __110__NSOrderedCollectionDifference_EmailFoundationAdditions___groupedInsertionsByObjectForCollection_inferMoves___block_invoke_2;
      v10[3] = &unk_1E62A65D0;
      v7 = &v11;
      v11 = v5;
      v8 = &v12;
      v12 = v6;
      -[NSOrderedCollectionDifference _groupedInsertionsWithObjectsToInsert:insertGroup:](a1, 0, v10);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __110__NSOrderedCollectionDifference_EmailFoundationAdditions___groupedInsertionsByObjectForCollection_inferMoves___block_invoke(uint64_t a1, char *a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  char *v7;
  void *v9;
  EFOrderedCollectionGroupedInsertionByObject *v10;
  id v11;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "ef_subarrayWithRange:", a2, a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v7 - 1);
    v7 = (char *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(*(id *)(a1 + 32), "count") <= a4)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = -[EFOrderedCollectionGroupedInsertionByObject initWithObjects:previousObject:nextObject:isMove:]([EFOrderedCollectionGroupedInsertionByObject alloc], "initWithObjects:previousObject:nextObject:isMove:", v11, v7, v9, a5);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);

}

- (void)_groupedInsertionAndMoves:(void *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  void (**v9)(void *, void *);
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t *v29;
  _QWORD aBlock[4];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "insertions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v33 = 0;
      v34 = &v33;
      v35 = 0x3010000000;
      v36 = &unk_1B10E80F5;
      v7 = MEMORY[0x1E0C809B0];
      v37 = xmmword_1B10DD6F0;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __85__NSOrderedCollectionDifference_EmailFoundationAdditions___groupedInsertionAndMoves___block_invoke;
      aBlock[3] = &unk_1E62A65F8;
      v32 = &v33;
      v8 = v6;
      v31 = v8;
      v9 = (void (**)(void *, void *))_Block_copy(aBlock);
      v26[0] = v7;
      v26[1] = 3221225472;
      v26[2] = __85__NSOrderedCollectionDifference_EmailFoundationAdditions___groupedInsertionAndMoves___block_invoke_2;
      v26[3] = &unk_1E62A6648;
      v29 = &v33;
      v10 = v8;
      v27 = v10;
      v28 = v3;
      v11 = (void (**)(_QWORD))_Block_copy(v26);
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      objc_msgSend(a1, "insertions", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v38, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v23;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v23 != v14)
              objc_enumerationMutation(v12);
            v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v15);
            if (v34[4] == 0x7FFFFFFFFFFFFFFFLL)
            {
              v17 = objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v15), "index");
              v34[4] = v17;
            }
            else
            {
              v18 = objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v15), "index");
              v19 = v34[5];
              if (v18 != v19 + v34[4])
              {
                if (v19)
                  v11[2](v11);
                v20 = objc_msgSend(v16, "index");
                v21 = v34;
                v34[4] = v20;
                v21[5] = 0;
              }
            }
            v9[2](v9, v16);
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v38, 16);
        }
        while (v13);
      }

      if (v34[5])
        v11[2](v11);

      _Block_object_dispose(&v33, 8);
    }
  }

}

void __110__NSOrderedCollectionDifference_EmailFoundationAdditions___groupedInsertionsByObjectForCollection_inferMoves___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  EFOrderedCollectionGroupedInsertionByObject *v10;
  id v11;

  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "ef_subarrayWithRange:", a2, a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2 - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if (a2 + a3 >= (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = -[EFOrderedCollectionGroupedInsertionByObject initWithObjects:previousObject:nextObject:isMove:]([EFOrderedCollectionGroupedInsertionByObject alloc], "initWithObjects:previousObject:nextObject:isMove:", v11, v8, v9, 0);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);

}

void __85__NSOrderedCollectionDifference_EmailFoundationAdditions___groupedInsertionAndMoves___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v4 = v3;
  if (objc_msgSend(v3, "associatedIndex") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(v4, "index"));

}

void __85__NSOrderedCollectionDifference_EmailFoundationAdditions___groupedInsertionAndMoves___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(_QWORD *)(v2 + 32);
  v4 = *(_QWORD *)(v2 + 40);
  v5 = objc_msgSend(*(id *)(a1 + 32), "firstIndex");
  v6 = v4;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    v6 = objc_msgSend(*(id *)(a1 + 32), "firstIndex", v4) - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32);
  v7 = v4 + v3;
  if (v6)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__NSOrderedCollectionDifference_EmailFoundationAdditions___groupedInsertionAndMoves___block_invoke_3;
  v9[3] = &unk_1E62A6620;
  v8 = *(void **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = v7;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v8, "enumerateRangesUsingBlock:", v9);
  objc_msgSend(*(id *)(a1 + 32), "removeAllIndexes");

}

uint64_t __85__NSOrderedCollectionDifference_EmailFoundationAdditions___groupedInsertionAndMoves___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v7 = a2 + a3;
  if (v7 != *(_QWORD *)(a1 + 48))
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "indexGreaterThanIndex:", v7);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      v9 = *(_QWORD *)(a1 + 48);
    else
      v9 = v8;
    return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v7, v9 - v7);
  }
  return result;
}

@end
