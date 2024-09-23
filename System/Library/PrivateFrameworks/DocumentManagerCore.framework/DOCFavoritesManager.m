@implementation DOCFavoritesManager

void __36__DOCFavoritesManager_sharedManager__block_invoke()
{
  DOCFavoritesManager *v0;
  void *v1;
  id v2;

  objc_msgSend((id)objc_opt_class(), "favoritesCollection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[DOCItemCollectionObserver initWithItemCollection:]([DOCFavoritesManager alloc], "initWithItemCollection:", v2);
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;

}

+ (id)favoritesCollection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDC82F0], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newFavoritesCollection");

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setItemFilteringPredicate:", v4);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:comparator:", CFSTR("favoriteRank"), 0, &__block_literal_global_9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reorderItemsWithSortDescriptors:", v6);

  return v3;
}

- (BOOL)isGathering
{
  void *v4;
  char v5;
  void *v7;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCFavoritesManager.m"), 83, CFSTR("Must call from main thread"));

  }
  -[DOCItemCollectionObserver itemCollection](self, "itemCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isGathering");

  return v5;
}

- (NSArray)favoritedLocations
{
  void *v4;
  void *v5;
  void *v7;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCFavoritesManager.m"), 78, CFSTR("Must call from main thread"));

  }
  -[DOCItemCollectionObserver itemCollection](self, "itemCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__DOCFavoritesManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (id)sharedManager_sharedManager;
}

uint64_t __42__DOCFavoritesManager_favoritesCollection__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[DOCManagedPermission defaultPermission](DOCManagedPermission, "defaultPermission");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "canHostAppPerformAction:targetNode:", 2, v2);

    objc_msgSend(v2, "favoriteRank");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = v4 & ~objc_msgSend(v2, "isTrashed");
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __42__DOCFavoritesManager_favoritesCollection__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "unsignedIntegerValue");
  if (v6 <= objc_msgSend(v5, "unsignedIntegerValue"))
  {
    v8 = objc_msgSend(v4, "unsignedIntegerValue");
    if (v8 >= objc_msgSend(v5, "unsignedIntegerValue"))
      v7 = 0;
    else
      v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)addFavorite:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = (void *)MEMORY[0x20BD0D5D4](a4);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __46__DOCFavoritesManager_addFavorite_completion___block_invoke;
  v11[3] = &unk_24C0FE3A0;
  v12 = v7;
  v8 = v7;
  v9 = (void *)MEMORY[0x20BD0D5D4](v11);
  v10 = (void *)MEMORY[0x20BD0D5D4]();
  -[DOCFavoritesManager insertFavorite:atIndex:completion:](self, "insertFavorite:atIndex:completion:", v6, 0, v10);

}

uint64_t __46__DOCFavoritesManager_addFavorite_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)insertFavorites:(id)a3 atIndex:(int64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v8 = a3;
  v9 = (void *)MEMORY[0x20BD0D5D4](a5);
  v10 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __58__DOCFavoritesManager_insertFavorites_atIndex_completion___block_invoke;
  v18[3] = &unk_24C0FE3A0;
  v19 = v9;
  v11 = v9;
  v12 = (void *)MEMORY[0x20BD0D5D4](v18);
  v13 = (void *)MEMORY[0x20BD0D5D4]();
  v14 = (void *)objc_msgSend(v8, "mutableCopy");

  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __58__DOCFavoritesManager_insertFavorites_atIndex_completion___block_invoke_2;
  v16[3] = &unk_24C0FE3A0;
  v17 = v13;
  v15 = v13;
  -[DOCFavoritesManager _reverseInsertAll:atIndex:completion:](self, "_reverseInsertAll:atIndex:completion:", v14, a4, v16);

}

uint64_t __58__DOCFavoritesManager_insertFavorites_atIndex_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __58__DOCFavoritesManager_insertFavorites_atIndex_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_reverseInsertAll:(id)a3 atIndex:(int64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  void (**v19)(_QWORD, _QWORD);
  _QWORD *v20;
  _QWORD v21[4];
  _QWORD v22[4];
  id v23;

  v8 = a3;
  v9 = (void *)MEMORY[0x20BD0D5D4](a5);
  v10 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __60__DOCFavoritesManager__reverseInsertAll_atIndex_completion___block_invoke;
  v22[3] = &unk_24C0FE3A0;
  v11 = v9;
  v23 = v11;
  v12 = (void *)MEMORY[0x20BD0D5D4](v22);
  v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD0D5D4]();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeLastObject");
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    v21[3] = a4;
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __60__DOCFavoritesManager__reverseInsertAll_atIndex_completion___block_invoke_2;
    v16[3] = &unk_24C0FE418;
    v16[4] = self;
    v15 = v14;
    v17 = v15;
    v20 = v21;
    v18 = v8;
    v19 = v13;
    -[DOCFavoritesManager insertFavorite:atIndex:completion:](self, "insertFavorite:atIndex:completion:", v15, a4, v16);

    _Block_object_dispose(v21, 8);
  }
  else
  {
    v13[2](v13, 1);
  }

}

uint64_t __60__DOCFavoritesManager__reverseInsertAll_atIndex_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __60__DOCFavoritesManager__reverseInsertAll_atIndex_completion___block_invoke_2(uint64_t a1, char a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  char v12;

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__DOCFavoritesManager__reverseInsertAll_atIndex_completion___block_invoke_3;
  v7[3] = &unk_24C0FE3F0;
  v4 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 64);
  v8 = v5;
  v11 = v6;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v12 = a2;
  DOCRunInMainThread(v7);

}

void __60__DOCFavoritesManager__reverseInsertAll_atIndex_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  char v9;

  objc_msgSend(*(id *)(a1 + 32), "favoritedLocations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexOfObject:", *(_QWORD *)(a1 + 40));

  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v3;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__DOCFavoritesManager__reverseInsertAll_atIndex_completion___block_invoke_4;
  v7[3] = &unk_24C0FE3C8;
  v6 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v9 = *(_BYTE *)(a1 + 72);
  objc_msgSend(v4, "_reverseInsertAll:atIndex:completion:", v6, v5, v7);

}

uint64_t __60__DOCFavoritesManager__reverseInsertAll_atIndex_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a1 + 40))
    a2 = a2;
  else
    a2 = 0;
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2);
}

- (void)updateFavoritesRanksToMatchOrderedFavorites:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  DOCFavoritesManager *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  unint64_t i;
  void *v35;
  unint64_t v36;
  id v37;
  id v38;
  DOCFavoritesManager *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;

  v6 = a3;
  v7 = (void *)MEMORY[0x20BD0D5D4](a4);
  v51[0] = MEMORY[0x24BDAC760];
  v51[1] = 3221225472;
  v51[2] = __78__DOCFavoritesManager_updateFavoritesRanksToMatchOrderedFavorites_completion___block_invoke;
  v51[3] = &unk_24C0FE3A0;
  v8 = v7;
  v52 = v8;
  v9 = (void *)MEMORY[0x20BD0D5D4](v51);
  v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD0D5D4]();
  if (objc_msgSend(v6, "count"))
  {
    -[DOCFavoritesManager favoritedLocations](self, "favoritedLocations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "count");
    if (v12 != objc_msgSend(v11, "count"))
    {
      v20 = docPickerLogHandle;
      if (!docPickerLogHandle)
      {
        DOCInitLogging();
        v20 = docPickerLogHandle;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[DOCFavoritesManager updateFavoritesRanksToMatchOrderedFavorites:completion:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);
      v10[2](v10, 0);
      goto LABEL_20;
    }
    v40 = v11;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = MEMORY[0x24BDAC760];
    v49[1] = 3221225472;
    v49[2] = __78__DOCFavoritesManager_updateFavoritesRanksToMatchOrderedFavorites_completion___block_invoke_19;
    v49[3] = &unk_24C0FE440;
    v14 = v13;
    v50 = v14;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v49);
    v45 = 0;
    v46 = &v45;
    v47 = 0x2020000000;
    v48 = 0;
    v15 = objc_msgSend(v14, "count");
    v39 = self;
    if (v15 == objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if ((v18 & 1) == 0)
      {
        objc_msgSend(v6, "doc_computeNewRankForIndex:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(v14, "replaceObjectAtIndex:withObject:", 0, v19);
        else
          *((_BYTE *)v46 + 24) = 1;

      }
      v28 = v46;
      if (!*((_BYTE *)v46 + 24))
      {
        objc_msgSend(v14, "firstObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "unsignedLongLongValue");

        objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        for (i = 1; i < objc_msgSend(v14, "count", v39); ++i)
        {
          objc_msgSend(v14, "objectAtIndexedSubscript:", i);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "unsignedLongLongValue");

          if (v36 >= v32)
          {
            objc_msgSend(v33, "addIndex:", i);
            v36 = v32;
          }
          v32 = v36;
        }
        v41[0] = MEMORY[0x24BDAC760];
        v41[1] = 3221225472;
        v41[2] = __78__DOCFavoritesManager_updateFavoritesRanksToMatchOrderedFavorites_completion___block_invoke_2;
        v41[3] = &unk_24C0FE468;
        v37 = v6;
        v42 = v37;
        v38 = v14;
        v43 = v38;
        v44 = &v45;
        objc_msgSend(v33, "enumerateRangesUsingBlock:", v41);

        if (!*((_BYTE *)v46 + 24))
        {
          -[DOCFavoritesManager favoriteItems:ranks:completion:](v39, "favoriteItems:ranks:completion:", v37, v38, v10);
          goto LABEL_19;
        }
LABEL_18:
        v29 = v39;
        -[DOCFavoritesManager _newlyComputedRanksForItems:](v39, "_newlyComputedRanksForItems:", v6, v39);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[DOCFavoritesManager favoriteItems:ranks:completion:](v29, "favoriteItems:ranks:completion:", v6, v30, v10);

LABEL_19:
        _Block_object_dispose(&v45, 8);

        v11 = v40;
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
      v28 = v46;
    }
    *((_BYTE *)v28 + 24) = 1;
    goto LABEL_18;
  }
  v10[2](v10, 1);
LABEL_21:

}

uint64_t __78__DOCFavoritesManager_updateFavoritesRanksToMatchOrderedFavorites_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __78__DOCFavoritesManager_updateFavoritesRanksToMatchOrderedFavorites_completion___block_invoke_19(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;

  objc_msgSend(a2, "favoriteRank");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    v6 = v7;
  }
  else
  {
    *a4 = 1;
  }

}

void __78__DOCFavoritesManager_updateFavoritesRanksToMatchOrderedFavorites_completion___block_invoke_2(uint64_t a1, unint64_t a2, unint64_t a3, _BYTE *a4)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;

  v5 = a3;
  v6 = a2;
  v8 = a2 - 1;
  v9 = a2 + a3;
  v10 = objc_msgSend(*(id *)(a1 + 32), "count");
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9 >= v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "doc_ranksForInsertingBelowRank:count:", v11, v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend(*(id *)(a1 + 40), "replaceObjectsInRange:withObjectsFromArray:", v6, v5, v17);
    else
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

  }
  else
  {
    v13 = objc_msgSend(v11, "unsignedLongLongValue");

    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedLongLongValue");

    v16 = v13 + ~v15;
    if (v5 <= v16)
    {
      if (v6 < v9)
      {
        v18 = v16 / v5;
        do
        {
          v13 -= v18;
          v19 = *(void **)(a1 + 40);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v13);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "replaceObjectAtIndex:withObject:", v6, v20);

          ++v6;
          --v5;
        }
        while (v5);
      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

- (void)moveFavorite:(id)a3 toTargetIndex:(int64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  int64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[5];
  id v32;
  void (**v33)(_QWORD, _QWORD);
  int64_t v34;
  _QWORD v35[4];
  id v36;
  void *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void *)MEMORY[0x20BD0D5D4](a5);
  v10 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __61__DOCFavoritesManager_moveFavorite_toTargetIndex_completion___block_invoke;
  v35[3] = &unk_24C0FE3A0;
  v11 = v9;
  v36 = v11;
  v12 = (void *)MEMORY[0x20BD0D5D4](v35);
  v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD0D5D4]();
  -[DOCFavoritesManager favoritedLocations](self, "favoritedLocations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "indexOfObject:", v8);

  if (v15 == 0x7FFFFFFFFFFFFFFFLL || v15 == a4)
  {
    v13[2](v13, 0);
  }
  else
  {
    -[DOCFavoritesManager favoritedLocations](self, "favoritedLocations");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

    objc_msgSend(v17, "removeObjectAtIndex:", v15);
    v18 = objc_msgSend(v17, "count");
    if (v18 >= a4)
      v19 = a4;
    else
      v19 = v18;
    objc_msgSend(v17, "doc_computeNewRankForIndex:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v38[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v20;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[DOCFavoritesManager favoriteItems:ranks:completion:](self, "favoriteItems:ranks:completion:", v21, v22, v13);

    }
    else
    {
      v23 = docPickerLogHandle;
      if (!docPickerLogHandle)
      {
        DOCInitLogging();
        v23 = docPickerLogHandle;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[DOCFavoritesManager moveFavorite:toTargetIndex:completion:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);
      v31[0] = v10;
      v31[1] = 3221225472;
      v31[2] = __61__DOCFavoritesManager_moveFavorite_toTargetIndex_completion___block_invoke_24;
      v31[3] = &unk_24C0FE490;
      v31[4] = self;
      v32 = v8;
      v34 = a4;
      v33 = v13;
      -[DOCFavoritesManager redistributeRanksCompletion:](self, "redistributeRanksCompletion:", v31);

    }
  }

}

uint64_t __61__DOCFavoritesManager_moveFavorite_toTargetIndex_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __61__DOCFavoritesManager_moveFavorite_toTargetIndex_completion___block_invoke_24(uint64_t a1, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "moveFavorite:toTargetIndex:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)removeFavorite:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  id v13;
  void *v14;
  DOCModifyFavoritesOperation *v15;
  void *v16;
  void *v17;
  DOCModifyFavoritesOperation *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  void (**v25)(_QWORD, _QWORD);
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x20BD0D5D4](a4);
  v8 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __49__DOCFavoritesManager_removeFavorite_completion___block_invoke;
  v28[3] = &unk_24C0FE3A0;
  v9 = v7;
  v29 = v9;
  v10 = (void *)MEMORY[0x20BD0D5D4](v28);
  v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD0D5D4]();
  -[DOCFavoritesManager favoritedLocations](self, "favoritedLocations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v8;
  v26[1] = 3221225472;
  v26[2] = __49__DOCFavoritesManager_removeFavorite_completion___block_invoke_2;
  v26[3] = &unk_24C0FE4B8;
  v13 = v6;
  v27 = v13;
  objc_msgSend(v12, "indexesOfObjectsPassingTest:", v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "count"))
  {
    v15 = [DOCModifyFavoritesOperation alloc];
    v30[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[DOCUndoManager shared](DOCUndoManager, "shared");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[DOCModifyFavoritesOperation initWithItemsToUnfavorite:undoManager:](v15, "initWithItemsToUnfavorite:undoManager:", v16, v17);

    v20 = v8;
    v21 = 3221225472;
    v22 = __49__DOCFavoritesManager_removeFavorite_completion___block_invoke_3;
    v23 = &unk_24C0FE4E0;
    v24 = v13;
    v25 = v11;
    -[FPActionOperation setActionCompletionBlock:](v18, "setActionCompletionBlock:", &v20);
    objc_msgSend(MEMORY[0x24BDC82F0], "defaultManager", v20, v21, v22, v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "scheduleAction:", v18);

  }
  else
  {
    v11[2](v11, 0);
  }

}

uint64_t __49__DOCFavoritesManager_removeFavorite_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __49__DOCFavoritesManager_removeFavorite_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((_DWORD)v8)
    *a4 = 1;
  return v8;
}

void __49__DOCFavoritesManager_removeFavorite_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = docPickerLogHandle;
    if (!docPickerLogHandle)
    {
      DOCInitLogging();
      v4 = docPickerLogHandle;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __49__DOCFavoritesManager_removeFavorite_completion___block_invoke_3_cold_1();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)insertFavorite:(id)a3 atIndex:(int64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[5];
  id v29;
  id v30;
  int64_t v31;
  _QWORD v32[4];
  id v33;
  void *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void *)MEMORY[0x20BD0D5D4](a5);
  v10 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __57__DOCFavoritesManager_insertFavorite_atIndex_completion___block_invoke;
  v32[3] = &unk_24C0FE3A0;
  v11 = v9;
  v33 = v11;
  v12 = (void *)MEMORY[0x20BD0D5D4](v32);
  v13 = (void *)MEMORY[0x20BD0D5D4]();
  -[DOCFavoritesManager favoritedLocations](self, "favoritedLocations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "indexOfObject:", v8);

  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[DOCFavoritesManager favoritedLocations](self, "favoritedLocations");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doc_computeNewRankForIndex:", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v35[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v17;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[DOCFavoritesManager favoriteItems:ranks:completion:](self, "favoriteItems:ranks:completion:", v18, v19, v13);

    }
    else
    {
      v20 = docPickerLogHandle;
      if (!docPickerLogHandle)
      {
        DOCInitLogging();
        v20 = docPickerLogHandle;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[DOCFavoritesManager insertFavorite:atIndex:completion:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);
      v28[0] = v10;
      v28[1] = 3221225472;
      v28[2] = __57__DOCFavoritesManager_insertFavorite_atIndex_completion___block_invoke_29;
      v28[3] = &unk_24C0FE490;
      v28[4] = self;
      v29 = v8;
      v31 = a4;
      v30 = v13;
      -[DOCFavoritesManager redistributeRanksCompletion:](self, "redistributeRanksCompletion:", v28);

    }
  }
  else
  {
    -[DOCFavoritesManager moveFavorite:toTargetIndex:completion:](self, "moveFavorite:toTargetIndex:completion:", v8, a4 - (v15 < a4), v13);
  }

}

uint64_t __57__DOCFavoritesManager_insertFavorite_atIndex_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __57__DOCFavoritesManager_insertFavorite_atIndex_completion___block_invoke_29(uint64_t a1, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "insertFavorite:atIndex:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)redistributeRanksCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = (void *)MEMORY[0x20BD0D5D4](a3, a2);
  v5 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __51__DOCFavoritesManager_redistributeRanksCompletion___block_invoke;
  v13[3] = &unk_24C0FE3A0;
  v6 = v4;
  v14 = v6;
  v7 = (void *)MEMORY[0x20BD0D5D4](v13);
  v8 = (void *)MEMORY[0x20BD0D5D4]();
  -[DOCFavoritesManager favoritedLocations](self, "favoritedLocations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v9, "count") >= 2)
  {
    -[DOCFavoritesManager _newlyComputedRanksForItems:](self, "_newlyComputedRanksForItems:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __51__DOCFavoritesManager_redistributeRanksCompletion___block_invoke_2;
    v11[3] = &unk_24C0FE3A0;
    v12 = v8;
    -[DOCFavoritesManager favoriteItems:ranks:completion:](self, "favoriteItems:ranks:completion:", v9, v10, v11);

  }
}

uint64_t __51__DOCFavoritesManager_redistributeRanksCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __51__DOCFavoritesManager_redistributeRanksCompletion___block_invoke_2(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__DOCFavoritesManager_redistributeRanksCompletion___block_invoke_3;
  v3[3] = &unk_24C0FE508;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  DOCRunInMainThread(v3);

}

uint64_t __51__DOCFavoritesManager_redistributeRanksCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (id)_newlyComputedRanksForItems:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  objc_msgSend(v4, "numberWithUnsignedLongLong:", (unint64_t)(v6 * 1000.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  DOCRandomRankBetween(0, 0x3E8uLL);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v10 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v7, "unsignedLongLongValue") - objc_msgSend(v8, "unsignedLongLongValue") * v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v11);

      ++v10;
    }
    while (objc_msgSend(v3, "count") > v10);
  }

  return v9;
}

- (void)favoriteItems:(id)a3 ranks:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  DOCModifyFavoritesOperation *v14;
  void *v15;
  DOCModifyFavoritesOperation *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x20BD0D5D4](a5);
  v10 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __54__DOCFavoritesManager_favoriteItems_ranks_completion___block_invoke;
  v29[3] = &unk_24C0FE3A0;
  v30 = v9;
  v11 = v9;
  v12 = (void *)MEMORY[0x20BD0D5D4](v29);
  v13 = (void *)MEMORY[0x20BD0D5D4]();
  v14 = [DOCModifyFavoritesOperation alloc];
  +[DOCUndoManager shared](DOCUndoManager, "shared");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[DOCModifyFavoritesOperation initWithItemsToFavorite:favoriteRanks:undoManager:](v14, "initWithItemsToFavorite:favoriteRanks:undoManager:", v7, v8, v15);

  v26[0] = v10;
  v26[1] = 3221225472;
  v26[2] = __54__DOCFavoritesManager_favoriteItems_ranks_completion___block_invoke_2;
  v26[3] = &unk_24C0FE4E0;
  v27 = v7;
  v17 = v13;
  v28 = v17;
  v18 = v7;
  -[FPActionOperation setActionCompletionBlock:](v16, "setActionCompletionBlock:", v26);
  v21 = v10;
  v22 = 3221225472;
  v23 = __54__DOCFavoritesManager_favoriteItems_ranks_completion___block_invoke_31;
  v24 = &unk_24C0FE530;
  v25 = v17;
  v19 = v17;
  -[FPActionOperation setErrorRecoveryHandler:](v16, "setErrorRecoveryHandler:", &v21);
  objc_msgSend(MEMORY[0x24BDC82F0], "defaultManager", v21, v22, v23, v24);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "scheduleAction:", v16);

}

uint64_t __54__DOCFavoritesManager_favoriteItems_ranks_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __54__DOCFavoritesManager_favoriteItems_ranks_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = docPickerLogHandle;
    if (!docPickerLogHandle)
    {
      DOCInitLogging();
      v4 = docPickerLogHandle;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __54__DOCFavoritesManager_favoriteItems_ranks_completion___block_invoke_2_cold_1();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __54__DOCFavoritesManager_favoriteItems_ranks_completion___block_invoke_31(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)runInMainThread:(id)a3
{
  void *v3;
  void (**block)(void);

  v3 = (void *)MEMORY[0x24BDD17F0];
  block = (void (**)(void))a3;
  if (objc_msgSend(v3, "isMainThread"))
    block[2]();
  else
    dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)updateFavoritesRanksToMatchOrderedFavorites:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2090A2000, a1, a3, "Unable to update ordering, an invalid new ordering was provided (size mismatch)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)moveFavorite:(uint64_t)a3 toTargetIndex:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2090A2000, a1, a3, "Collision while moving ranked favorites", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void __49__DOCFavoritesManager_removeFavorite_completion___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_2090A2000, v0, v1, "Failed to unfavorite item %@. Error: %@");
}

- (void)insertFavorite:(uint64_t)a3 atIndex:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2090A2000, a1, a3, "Collision while inserting ranked favorites", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void __54__DOCFavoritesManager_favoriteItems_ranks_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_2090A2000, v0, v1, "Failed to favorite items %@. Error: %@");
}

@end
