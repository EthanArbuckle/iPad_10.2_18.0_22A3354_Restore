@implementation GKLeaderboardListDataSource

- (GKLeaderboardListDataSource)initWithGameRecord:(id)a3 leaderboardSet:(id)a4
{
  id v6;
  GKLeaderboardListDataSource *v7;
  GKLeaderboardListDataSource *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)GKLeaderboardListDataSource;
  v7 = -[GKGameLayerCollectionDataSource initWithGameRecord:](&v10, sel_initWithGameRecord_, a3);
  v8 = v7;
  if (v7)
    -[GKLeaderboardListDataSource setLeaderboardSet:](v7, "setLeaderboardSet:", v6);

  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[GKLeaderboardListDataSource timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[GKLeaderboardListDataSource setTimer:](self, "setTimer:", 0);
  v4.receiver = self;
  v4.super_class = (Class)GKLeaderboardListDataSource;
  -[GKLeaderboardListDataSource dealloc](&v4, sel_dealloc);
}

- (void)setupCollectionView:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKLeaderboardListDataSource;
  v4 = a3;
  -[GKLeaderboardCollectionDataSource setupCollectionView:](&v5, sel_setupCollectionView_, v4);
  -[GKLeaderboardListDataSource setCollectionView:](self, "setCollectionView:", v4, v5.receiver, v5.super_class);

}

- (void)setupTimer
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[GKLeaderboardListDataSource timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[GKLeaderboardListDataSource timer](self, "timer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__GKLeaderboardListDataSource_setupTimer__block_invoke;
  v6[3] = &unk_1E59C6788;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 1, v6, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardListDataSource setTimer:](self, "setTimer:", v5);

}

void __41__GKLeaderboardListDataSource_setupTimer__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "leaderboards");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __41__GKLeaderboardListDataSource_setupTimer__block_invoke_2;
  v14[3] = &unk_1E59C6760;
  v6 = v3;
  v15 = v6;
  v7 = v2;
  v16 = v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v14);

  if (objc_msgSend(v6, "count"))
  {
    v8 = (void *)MEMORY[0x1E0D25308];
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __41__GKLeaderboardListDataSource_setupTimer__block_invoke_3;
    v11[3] = &unk_1E59C52E8;
    v9 = v7;
    v10 = *(_QWORD *)(a1 + 32);
    v12 = v9;
    v13 = v10;
    objc_msgSend(v8, "loadLeaderboardsWithIDs:completionHandler:", v6, v11);

  }
}

void __41__GKLeaderboardListDataSource_setupTimer__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  if (objc_msgSend(v14, "type") == 1)
  {
    objc_msgSend(v14, "nextStartDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", v6);
    v8 = v7;

    if (v8 <= 0.0)
    {
      v9 = *(void **)(a1 + 32);
      objc_msgSend(v14, "baseLeaderboardID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v10);

      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 40);
      objc_msgSend(v14, "baseLeaderboardID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

    }
  }

}

void __41__GKLeaderboardListDataSource_setupTimer__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v11 = *(void **)(a1 + 32);
        objc_msgSend(v10, "baseLeaderboardID", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "addObject:", v13);
        objc_msgSend(*(id *)(a1 + 40), "leaderboards");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:atIndexedSubscript:", v10, objc_msgSend(v13, "item"));

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "reloadItemsAtIndexPaths:", v4);

  }
}

- (id)title
{
  void *v3;
  void *v4;
  void *v5;

  -[GKLeaderboardListDataSource leaderboardSet](self, "leaderboardSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[GKLeaderboardListDataSource leaderboardSet](self, "leaderboardSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
  }
  else
  {
    GKGameCenterUIFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)loadDataWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD v21[3];
  char v22;
  _QWORD v23[3];
  char v24;

  v4 = a3;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  v5 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/GameCenterUIService/GKLeaderboardListDataSource.m", 116, "-[GKLeaderboardListDataSource loadDataWithCompletionHandler:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dispatchGroupWithName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __61__GKLeaderboardListDataSource_loadDataWithCompletionHandler___block_invoke;
  v17[3] = &unk_1E59C67B0;
  v17[4] = self;
  v19 = v23;
  v20 = v21;
  v9 = v7;
  v18 = v9;
  objc_msgSend(v9, "perform:", v17);
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __61__GKLeaderboardListDataSource_loadDataWithCompletionHandler___block_invoke_5;
  v12[3] = &unk_1E59C67D8;
  v15 = v21;
  v12[4] = self;
  v10 = v4;
  v14 = v10;
  v16 = v23;
  v11 = v9;
  v13 = v11;
  objc_msgSend(v11, "notifyOnMainQueueWithBlock:", v12);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);

}

void __61__GKLeaderboardListDataSource_loadDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  __int128 v13;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D25308];
  objc_msgSend(*(id *)(a1 + 32), "leaderboardSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "gameRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[2] = __61__GKLeaderboardListDataSource_loadDataWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E59C49D8;
  v8 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v10[1] = 3221225472;
  v13 = *(_OWORD *)(a1 + 48);
  v11 = v8;
  v12 = v3;
  v9 = v3;
  objc_msgSend(v4, "loadLeaderboardsWithIDs:setIdentifier:game:completionHandler:", 0, v6, v7, v10);

}

void __61__GKLeaderboardListDataSource_loadDataWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "leaderboards");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v7, "count") == 0;

  objc_msgSend(*(id *)(a1 + 32), "leaderboards");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqual:", v5) & 1) != 0)
  {
LABEL_14:

    goto LABEL_15;
  }

  if (v5 || !v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLeaderboards:", v9);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v5;
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v8);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "type", (_QWORD)v14) == 1)
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
            goto LABEL_14;
          }
        }
        v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v11)
          continue;
        break;
      }
    }
    goto LABEL_14;
  }
LABEL_15:
  objc_msgSend(*(id *)(a1 + 40), "setError:", v6, (_QWORD)v14);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __61__GKLeaderboardListDataSource_loadDataWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "setupTimer");
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    v3 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 40), "error");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);

  }
}

- (void)removeLeaderboardsWithoutImages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSDictionary *assetNames;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[GKLeaderboardListDataSource leaderboards](self, "leaderboards");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[GKLeaderboardListDataSource leaderboards](self, "leaderboards", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        assetNames = self->_assetNames;
        objc_msgSend(v11, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](assetNames, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  -[GKLeaderboardListDataSource setLeaderboards:](self, "setLeaderboards:", v5);
}

- (int64_t)itemCount
{
  void *v2;
  int64_t v3;

  -[GKLeaderboardListDataSource leaderboards](self, "leaderboards");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)itemForIndexPath:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[GKLeaderboardListDataSource leaderboards](self, "leaderboards");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6 <= objc_msgSend(v4, "item"))
  {
    v8 = 0;
  }
  else
  {
    -[GKLeaderboardListDataSource leaderboards](self, "leaderboards");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (CGSize)standardCellSizeForCollectionView:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  CGSize result;

  v4 = a3;
  if ((GKIsXRUIIdiomShouldUsePadUI() & 1) != 0)
  {
    *(double *)&v5 = 288.0;
    v6 = 188.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "horizontalSizeClass") == 1 && objc_msgSend(v7, "verticalSizeClass") == 2;
    objc_msgSend(v7, "preferredContentSizeCategory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v9))
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "userInterfaceIdiom");

      *(double *)&v5 = 282.0;
      if (v11 == 1)
      {
        v6 = 696.0;
      }
      else if (v8)
      {
        objc_msgSend(v4, "frame");
        if (v16 + -20.0 <= 335.0)
          v6 = v16 + -20.0;
        else
          v6 = 335.0;
        if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC48B8]))
        {
          *(double *)&v5 = 564.0;
        }
        else if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC48C0]))
        {
          *(double *)&v5 = 534.0;
        }
        else if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC48C8]))
        {
          *(double *)&v5 = 504.0;
        }
        else if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC48D0]))
        {
          *(double *)&v5 = 474.0;
        }
        else
        {
          *(double *)&v5 = 444.0;
        }
      }
      else
      {
        objc_msgSend(v4, "bounds");
        v20 = v19;
        objc_msgSend(v4, "superview");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "safeAreaInsets");
        v23 = v20 - v22;
        objc_msgSend(v4, "superview");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "safeAreaInsets");
        v6 = v23 - v25 + -32.0;

      }
    }
    else
    {
      if (v8)
      {
        objc_msgSend(v4, "frame");
        v13 = v12 + -20.0;
        -[GKLeaderboardCollectionDataSource cellSpacing](self, "cellSpacing");
        v15 = (v13 - v14) * 0.5;
        if (v15 <= 162.0)
          v6 = v15;
        else
          v6 = 162.0;
      }
      else
      {
        v6 = 162.0;
      }
      *(double *)&v5 = 276.0;
    }

  }
  v17 = v6;
  v18 = *(double *)&v5;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)updateHighlightsInSectionHeader:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKGameLayerCollectionDataSource gameRecord](self, "gameRecord");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateHighlightsWithGameRecord:leaderboardCount:setCount:", v5, -[GKLeaderboardListDataSource itemCount](self, "itemCount"), 0);

}

- (void)prepareCell:(id)a3 forItemAtIndexPath:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSDictionary *assetNames;
  void *v19;
  void *v20;
  id v21;

  v6 = a3;
  v7 = objc_msgSend(a4, "item");
  -[GKLeaderboardListDataSource leaderboards](self, "leaderboards");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 <= v7)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/GameCenterUIService/GKLeaderboardListDataSource.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastPathComponent");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ (self.leaderboards.count > index)\n[%s (%s:%d)]"), v11, "-[GKLeaderboardListDataSource prepareCell:forItemAtIndexPath:]", objc_msgSend(v13, "UTF8String"), 238);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
  }
  -[GKLeaderboardListDataSource leaderboards](self, "leaderboards");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", v7);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  -[GKGameLayerCollectionDataSource gameRecord](self, "gameRecord");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBundleIdentifier:", v17);

  assetNames = self->_assetNames;
  objc_msgSend(v21, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](assetNames, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImageName:", v20);

  objc_msgSend(v6, "setLeaderboard:", v21);
}

- (void)handleSelectionInCollectionView:(id)a3 forItemAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  GKLeaderboardScoreViewController *v19;
  void *v20;
  GKLeaderboardScoreViewController *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a4;
  -[GKGameLayerCollectionDataSource presentationViewController](self, "presentationViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v24;
  if (v5)
  {
    v7 = objc_msgSend(v24, "item");
    -[GKLeaderboardListDataSource leaderboards](self, "leaderboards");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 <= v7)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/GameCenterUIService/GKLeaderboardListDataSource.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ (self.leaderboards.count > index)\n[%s (%s:%d)]"), v11, "-[GKLeaderboardListDataSource handleSelectionInCollectionView:forItemAtIndexPath:]", objc_msgSend(v13, "UTF8String"), 252);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
    }
    -[GKLeaderboardListDataSource leaderboards](self, "leaderboards");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D25238], "reporter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "baseLeaderboardID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "recordClickWithAction:targetId:targetType:pageId:pageType:", CFSTR("navigate"), v18, CFSTR("button"), CFSTR("leaderboardCollection"), CFSTR("leaderboard"));

    v19 = [GKLeaderboardScoreViewController alloc];
    -[GKGameLayerCollectionDataSource gameRecord](self, "gameRecord");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[GKLeaderboardScoreViewController initWithGameRecord:leaderboard:](v19, "initWithGameRecord:leaderboard:", v20, v16);

    -[GKGameLayerCollectionDataSource presentationViewController](self, "presentationViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKDashboardPresentationController presentViewController:presentingViewController:animated:](GKDashboardPresentationController, "presentViewController:presentingViewController:animated:", v21, v22, 1);

    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "reportEvent:type:", *MEMORY[0x1E0D25060], *MEMORY[0x1E0D24CA8]);

    v6 = v24;
  }

}

- (NSDictionary)assetNames
{
  return self->_assetNames;
}

- (void)setAssetNames:(id)a3
{
  objc_storeStrong((id *)&self->_assetNames, a3);
}

- (GKLeaderboardSet)leaderboardSet
{
  return self->_leaderboardSet;
}

- (void)setLeaderboardSet:(id)a3
{
  objc_storeStrong((id *)&self->_leaderboardSet, a3);
}

- (NSMutableArray)leaderboards
{
  return self->_leaderboards;
}

- (void)setLeaderboards:(id)a3
{
  objc_storeStrong((id *)&self->_leaderboards, a3);
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (void)setCollectionView:(id)a3
{
  objc_storeWeak((id *)&self->_collectionView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_collectionView);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_leaderboards, 0);
  objc_storeStrong((id *)&self->_leaderboardSet, 0);
  objc_storeStrong((id *)&self->_assetNames, 0);
}

@end
