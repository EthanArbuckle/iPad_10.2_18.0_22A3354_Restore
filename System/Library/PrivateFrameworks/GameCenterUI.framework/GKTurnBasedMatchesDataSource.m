@implementation GKTurnBasedMatchesDataSource

- (void)configureDataSource
{
  GKRawTurnsDataSource *v3;
  void *v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  objc_super v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)GKTurnBasedMatchesDataSource;
  -[GKSplittingDataSource configureDataSource](&v21, sel_configureDataSource);
  v3 = objc_alloc_init(GKRawTurnsDataSource);
  v20.receiver = self;
  v20.super_class = (Class)GKTurnBasedMatchesDataSource;
  -[GKSplittingDataSource setUnderlyingDataSource:](&v20, sel_setUnderlyingDataSource_, v3);

  GKGameCenterUIFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateSortKey"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSplittingDataSource addSectionWithTitle:sortDescriptors:](self, "addSectionWithTitle:sortDescriptors:", v5, v7);

  GKGameCenterUIFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateSortKey"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSplittingDataSource addSectionWithTitle:sortDescriptors:](self, "addSectionWithTitle:sortDescriptors:", v9, v11);

  GKGameCenterUIFrameworkBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateSortKey"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSplittingDataSource addSectionWithTitle:sortDescriptors:](self, "addSectionWithTitle:sortDescriptors:", v13, v15);

  GKGameCenterUIFrameworkBundle();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateSortKey"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSplittingDataSource addSectionWithTitle:sortDescriptors:](self, "addSectionWithTitle:sortDescriptors:", v17, v19);

}

- (void)collectionViewWillBecomeActive:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)GKTurnBasedMatchesDataSource;
  -[GKCollectionViewDataSource collectionViewWillBecomeActive:](&v13, sel_collectionViewWillBecomeActive_, a3);
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__GKTurnBasedMatchesDataSource_collectionViewWillBecomeActive___block_invoke;
  v12[3] = &unk_1E59C45B0;
  v12[4] = self;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSplittingDataSource setFilterPredicate:forSection:](self, "setFilterPredicate:forSection:", v5, 0);

  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __63__GKTurnBasedMatchesDataSource_collectionViewWillBecomeActive___block_invoke_2;
  v11[3] = &unk_1E59C45B0;
  v11[4] = self;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSplittingDataSource setFilterPredicate:forSection:](self, "setFilterPredicate:forSection:", v6, 1);

  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __63__GKTurnBasedMatchesDataSource_collectionViewWillBecomeActive___block_invoke_3;
  v10[3] = &unk_1E59C45B0;
  v10[4] = self;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSplittingDataSource setFilterPredicate:forSection:](self, "setFilterPredicate:forSection:", v7, 2);

  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __63__GKTurnBasedMatchesDataSource_collectionViewWillBecomeActive___block_invoke_4;
  v9[3] = &unk_1E59C45B0;
  v9[4] = self;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSplittingDataSource setFilterPredicate:forSection:](self, "setFilterPredicate:forSection:", v8, 3);

}

BOOL __63__GKTurnBasedMatchesDataSource_collectionViewWillBecomeActive___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  _BOOL8 v8;

  v3 = a2;
  objc_msgSend(v3, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "game");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if (v7)
    v8 = objc_msgSend(v3, "state") == 1;
  else
    v8 = 0;

  return v8;
}

BOOL __63__GKTurnBasedMatchesDataSource_collectionViewWillBecomeActive___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  _BOOL8 v8;

  v3 = a2;
  objc_msgSend(v3, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "game");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if (v7)
    v8 = (objc_msgSend(v3, "state") & 0xFFFFFFFE) == 2;
  else
    v8 = 0;

  return v8;
}

BOOL __63__GKTurnBasedMatchesDataSource_collectionViewWillBecomeActive___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  _BOOL8 v8;

  v3 = a2;
  objc_msgSend(v3, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "game");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if (v7)
    v8 = objc_msgSend(v3, "state") == 4;
  else
    v8 = 0;

  return v8;
}

BOOL __63__GKTurnBasedMatchesDataSource_collectionViewWillBecomeActive___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  _BOOL8 v8;

  v3 = a2;
  objc_msgSend(v3, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "game");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if (v7)
    v8 = objc_msgSend(v3, "state") == 5;
  else
    v8 = 0;

  return v8;
}

- (void)configureCollectionView:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKTurnBasedMatchesDataSource;
  v3 = a3;
  -[GKCollectionViewDataSource configureCollectionView:](&v4, sel_configureCollectionView_, v3);
  +[GKTurnParticipantCell registerCellClassesForCollectionView:](GKTurnParticipantCell, "registerCellClassesForCollectionView:", v3, v4.receiver, v4.super_class);

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[GKSplittingDataSource sectionInfoForSection:](self, "sectionInfoForSection:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_gkDequeueCellForClass:forIndexPath:", objc_opt_class(), v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setDetailPressedAction:", self->_detailPressedAction);
  objc_msgSend(v11, "setMatch:", v10);
  objc_msgSend(v10, "playingWithParticipantOrFirstKnownPlayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setParticipant:", v12);

  GKGameCenterUIFrameworkBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKEditAction deleteActionWithName:](GKEditAction, "deleteActionWithName:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEditActions:", v16);

  objc_msgSend(v11, "setInsets:", self->_cellMarginInsets.top, self->_cellMarginInsets.left, self->_cellMarginInsets.bottom, self->_cellMarginInsets.right);
  v17 = objc_msgSend(v6, "item");

  objc_msgSend(v8, "items");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count") - 1;

  if (v17 == v19)
  {
    objc_msgSend(v11, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCornerRadius:", 10.0);

    objc_msgSend(v11, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setMaskedCorners:", 12);

    objc_msgSend(v11, "divider");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setHidden:", 1);
  }
  else
  {
    objc_msgSend(v11, "divider");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setHidden:", 0);

    objc_msgSend(v11, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setCornerRadius:", 0.0);
  }

  return v11;
}

- (void)removeItemAtIndexPath:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id *v23;
  id *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void (**v33)(_QWORD, _QWORD);
  GKTurnBasedMatchesDataSource *v34;
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  id v38;
  _QWORD v39[2];
  _QWORD aBlock[5];
  id v41;
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  void *(*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _QWORD v49[4];
  id v50;

  v6 = a3;
  v7 = a4;
  v34 = self;
  -[GKSplittingDataSource sectionInfoForSection:](self, "sectionInfoForSection:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "state");
  v12 = MEMORY[0x1E0C809B0];
  if (v11 == 1)
  {
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __72__GKTurnBasedMatchesDataSource_removeItemAtIndexPath_completionHandler___block_invoke;
    v49[3] = &unk_1E59C45D8;
    v50 = v10;
    objc_msgSend(v50, "declineInviteWithCompletionHandler:", v49);

  }
  else if (objc_msgSend(v10, "state") == 5)
  {
    objc_msgSend(v10, "removeWithCompletionHandler:", 0);
  }
  else
  {
    -[GKTurnBasedMatchesDataSource delegate](v34, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "turnBasedMatchesDataSource:didQuitMatch:", v34, v10);

  }
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__0;
  v47 = __Block_byref_object_dispose__0;
  v48 = &__block_literal_global_1;
  v14 = objc_msgSend(&__block_literal_global_1, "copy");
  v31 = v10;
  v33 = (void (**)(_QWORD, _QWORD))v7;
  v15 = (void *)v44[5];
  v44[5] = v14;

  objc_msgSend(v8, "items");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    v18 = 0;
    v19 = v12;
    do
    {
      v20 = _Block_copy((const void *)v44[5]);
      if (v18 == objc_msgSend(v6, "item", v31))
      {
        aBlock[0] = v12;
        aBlock[1] = 3221225472;
        aBlock[2] = __72__GKTurnBasedMatchesDataSource_removeItemAtIndexPath_completionHandler___block_invoke_2;
        aBlock[3] = &unk_1E59C4620;
        v42 = v20;
        aBlock[4] = v34;
        v41 = v6;
        v21 = _Block_copy(aBlock);
        v22 = (void *)v44[5];
        v44[5] = (uint64_t)v21;
        v23 = &v41;
        v24 = &v42;
      }
      else
      {
        v37[0] = v12;
        v37[1] = 3221225472;
        v37[2] = __72__GKTurnBasedMatchesDataSource_removeItemAtIndexPath_completionHandler___block_invoke_3;
        v37[3] = &unk_1E59C4648;
        v39[0] = v20;
        v39[1] = v18;
        v37[4] = v34;
        v38 = v6;
        v25 = _Block_copy(v37);
        v22 = (void *)v44[5];
        v44[5] = (uint64_t)v25;
        v23 = &v38;
        v24 = (id *)v39;
      }

      v26 = objc_msgSend((id)v44[5], "copy");
      v12 = v19;
      v27 = (void *)v44[5];
      v44[5] = v26;

      ++v18;
    }
    while (v17 != v18);
  }
  v28 = objc_msgSend(v6, "item", v31);
  objc_msgSend(v8, "items");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v12;
  v36[1] = 3221225472;
  v36[2] = __72__GKTurnBasedMatchesDataSource_removeItemAtIndexPath_completionHandler___block_invoke_4;
  v36[3] = &__block_descriptor_40_e11__24__0_8Q16l;
  v36[4] = v28;
  objc_msgSend(v29, "_gkFilterWithBlock:", v36);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setItems:", v30);

  v35[0] = v12;
  v35[1] = 3221225472;
  v35[2] = __72__GKTurnBasedMatchesDataSource_removeItemAtIndexPath_completionHandler___block_invoke_5;
  v35[3] = &unk_1E59C4690;
  v35[4] = &v43;
  -[GKCollectionViewDataSource notifyBatchUpdate:](v34, "notifyBatchUpdate:", v35);
  if (v33)
    v33[2](v33, 0);
  _Block_object_dispose(&v43, 8);

}

uint64_t __72__GKTurnBasedMatchesDataSource_removeItemAtIndexPath_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeWithCompletionHandler:", 0);
}

void __72__GKTurnBasedMatchesDataSource_removeItemAtIndexPath_completionHandler___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(a1[6] + 16))();
  v2 = (void *)a1[4];
  v4[0] = a1[5];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyItemsRemovedAtIndexPaths:", v3);

}

void __72__GKTurnBasedMatchesDataSource_removeItemAtIndexPath_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", *(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(a1 + 40), "section"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", *(_QWORD *)(a1 + 56) - (*(_QWORD *)(a1 + 56) >= (unint64_t)objc_msgSend(*(id *)(a1 + 40), "item")), objc_msgSend(*(id *)(a1 + 40), "section"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyItemMovedFromIndexPath:toIndexPaths:", v4, v3);

}

id __72__GKTurnBasedMatchesDataSource_removeItemAtIndexPath_completionHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  if (*(_QWORD *)(a1 + 32) == a3)
    return 0;
  else
    return a2;
}

uint64_t __72__GKTurnBasedMatchesDataSource_removeItemAtIndexPath_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 16))();
}

- (unint64_t)numberOfMatches
{
  uint64_t v3;
  unint64_t v4;
  void *v5;

  v3 = 0;
  v4 = 0;
  do
  {
    -[GKSplittingDataSource itemsForSection:](self, "itemsForSection:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 += objc_msgSend(v5, "count");

    ++v3;
  }
  while (v3 != 4);
  return v4;
}

- (GKTurnBasedMatchesDataSourceDelegate)delegate
{
  return (GKTurnBasedMatchesDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegateWeak);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegateWeak, a3);
}

- (GKGame)game
{
  return self->_game;
}

- (void)setGame:(id)a3
{
  objc_storeStrong((id *)&self->_game, a3);
}

- (SEL)detailPressedAction
{
  return self->_detailPressedAction;
}

- (void)setDetailPressedAction:(SEL)a3
{
  self->_detailPressedAction = a3;
}

- (UIEdgeInsets)cellMarginInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_cellMarginInsets.top;
  left = self->_cellMarginInsets.left;
  bottom = self->_cellMarginInsets.bottom;
  right = self->_cellMarginInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setCellMarginInsets:(UIEdgeInsets)a3
{
  self->_cellMarginInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_game, 0);
  objc_destroyWeak((id *)&self->_delegateWeak);
}

@end
