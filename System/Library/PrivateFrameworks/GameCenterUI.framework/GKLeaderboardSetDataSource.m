@implementation GKLeaderboardSetDataSource

- (int64_t)allowedColumnCount:(int64_t)a3
{
  int64_t v4;
  uint64_t v5;

  v4 = -[GKLeaderboardSetDataSource itemCount](self, "itemCount");
  if (a3 >= v4)
    v5 = v4;
  else
    v5 = a3;
  if (v5 >= 3)
    v5 = 3;
  if (v5 <= 1)
    return 1;
  else
    return v5;
}

- (id)title
{
  void *v2;
  void *v3;

  GKGameCenterUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD *v14;
  _QWORD v15[6];
  _QWORD v16[3];
  char v17;

  v4 = a3;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = 0;
  v5 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/GameCenterUIService/GKLeaderboardSetDataSource.m", 60, "-[GKLeaderboardSetDataSource loadDataWithCompletionHandler:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dispatchGroupWithName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__GKLeaderboardSetDataSource_loadDataWithCompletionHandler___block_invoke;
  v15[3] = &unk_1E59C6FA0;
  v15[4] = self;
  v15[5] = v16;
  objc_msgSend(v7, "perform:", v15);
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __60__GKLeaderboardSetDataSource_loadDataWithCompletionHandler___block_invoke_5;
  v11[3] = &unk_1E59C6FC8;
  v9 = v4;
  v13 = v9;
  v14 = v16;
  v10 = v7;
  v12 = v10;
  objc_msgSend(v10, "notifyOnMainQueueWithBlock:", v11);

  _Block_object_dispose(v16, 8);
}

void __60__GKLeaderboardSetDataSource_loadDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D25328];
  objc_msgSend(*(id *)(a1 + 32), "gameRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__GKLeaderboardSetDataSource_loadDataWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E59C6F78;
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v10 = v3;
  v11 = v6;
  v9[4] = v7;
  v8 = v3;
  objc_msgSend(v4, "loadLeaderboardSetsForGame:withCompletionHandler:", v5, v9);

}

void __60__GKLeaderboardSetDataSource_loadDataWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "leaderboardSets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "count") == 0;

  objc_msgSend(*(id *)(a1 + 32), "leaderboardSets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v7) & 1) != 0)
  {

  }
  else
  {

    if (v7 || !a3)
    {
      objc_msgSend(*(id *)(a1 + 32), "setLeaderboardSets:", v7);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __60__GKLeaderboardSetDataSource_loadDataWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    v2 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 32), "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);

  }
}

- (void)removeLeaderboardSetsWithoutImages
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
  NSDictionary *leaderboardSetAssetNames;
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
  -[GKLeaderboardSetDataSource leaderboardSets](self, "leaderboardSets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[GKLeaderboardSetDataSource leaderboardSets](self, "leaderboardSets", 0);
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
        leaderboardSetAssetNames = self->_leaderboardSetAssetNames;
        objc_msgSend(v11, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](leaderboardSetAssetNames, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  -[GKLeaderboardSetDataSource setLeaderboardSets:](self, "setLeaderboardSets:", v5);
}

- (int64_t)itemCount
{
  void *v2;
  int64_t v3;

  -[GKLeaderboardSetDataSource leaderboardSets](self, "leaderboardSets");
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
  -[GKLeaderboardSetDataSource leaderboardSets](self, "leaderboardSets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6 <= objc_msgSend(v4, "item"))
  {
    v8 = 0;
  }
  else
  {
    -[GKLeaderboardSetDataSource leaderboardSets](self, "leaderboardSets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (CGSize)standardCellSizeForCollectionView:(id)a3
{
  id v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  CGSize result;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "horizontalSizeClass") == 1 && objc_msgSend(v4, "verticalSizeClass") == 2;
  objc_msgSend(v4, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v6))
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    *(double *)&v9 = 282.0;
    if (v8 == 1)
    {
      v10 = 696.0;
    }
    else if (v5)
    {
      objc_msgSend(v3, "frame");
      if (v12 + -20.0 <= 335.0)
        v10 = v12 + -20.0;
      else
        v10 = 335.0;
      if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DC48B8]))
      {
        *(double *)&v9 = 564.0;
      }
      else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DC48C0]))
      {
        *(double *)&v9 = 534.0;
      }
      else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DC48C8]))
      {
        *(double *)&v9 = 504.0;
      }
      else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DC48D0]))
      {
        *(double *)&v9 = 474.0;
      }
      else
      {
        *(double *)&v9 = 444.0;
      }
    }
    else
    {
      objc_msgSend(v3, "bounds");
      v16 = v15;
      objc_msgSend(v3, "superview");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "safeAreaInsets");
      v19 = v16 - v18;
      objc_msgSend(v3, "superview");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "safeAreaInsets");
      v10 = v19 - v21 + -32.0;

    }
  }
  else
  {
    if (v5)
    {
      objc_msgSend(v3, "frame");
      if (v11 + -20.0 <= 335.0)
        v10 = v11 + -20.0;
      else
        v10 = 335.0;
    }
    else
    {
      v10 = 335.0;
    }
    *(double *)&v9 = 276.0;
  }

  v13 = v10;
  v14 = *(double *)&v9;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)updateHighlightsInSectionHeader:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKGameLayerCollectionDataSource gameRecord](self, "gameRecord");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateHighlightsWithGameRecord:leaderboardCount:setCount:", v5, 0, -[GKLeaderboardSetDataSource itemCount](self, "itemCount"));

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
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v6 = a3;
  v7 = objc_msgSend(a4, "item");
  -[GKLeaderboardSetDataSource leaderboardSets](self, "leaderboardSets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 <= v7)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/GameCenterUIService/GKLeaderboardSetDataSource.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastPathComponent");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ (self.leaderboardSets.count > index)\n[%s (%s:%d)]"), v11, "-[GKLeaderboardSetDataSource prepareCell:forItemAtIndexPath:]", objc_msgSend(v13, "UTF8String"), 169);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
  }
  -[GKLeaderboardSetDataSource leaderboardSets](self, "leaderboardSets");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", v7);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  -[GKGameLayerCollectionDataSource gameRecord](self, "gameRecord");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBundleIdentifier:", v17);

  -[GKLeaderboardSetDataSource leaderboardSetAssetNames](self, "leaderboardSetAssetNames");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImageName:", v20);

  objc_msgSend(v6, "setLeaderboardSet:", v21);
}

- (void)handleSelectionInCollectionView:(id)a3 forItemAtIndexPath:(id)a4
{
  id v5;
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
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;

  v5 = a4;
  -[GKGameLayerCollectionDataSource presentationViewController](self, "presentationViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v5, "item");
    -[GKLeaderboardSetDataSource leaderboardSets](self, "leaderboardSets");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 <= v7)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/GameCenterUIService/GKLeaderboardSetDataSource.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ (self.leaderboardSets.count > index)\n[%s (%s:%d)]"), v11, "-[GKLeaderboardSetDataSource handleSelectionInCollectionView:forItemAtIndexPath:]", objc_msgSend(v13, "UTF8String"), 182);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
    }
    -[GKLeaderboardSetDataSource leaderboardSets](self, "leaderboardSets");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D25238], "reporter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "recordClickWithAction:targetId:targetType:pageId:pageType:", CFSTR("navigate"), v18, CFSTR("button"), CFSTR("leaderboardGroups"), CFSTR("leaderboard"));

    objc_msgSend(v16, "leaderboardIdentifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (v20 < 2)
    {
      v21 = (void *)MEMORY[0x1E0D25308];
      -[GKGameLayerCollectionDataSource gameRecord](self, "gameRecord");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __81__GKLeaderboardSetDataSource_handleSelectionInCollectionView_forItemAtIndexPath___block_invoke;
      v23[3] = &unk_1E59C6FF0;
      v23[4] = self;
      v24 = v16;
      objc_msgSend(v21, "loadLeaderboardsForGame:forSet:withPlayer:withCompletionHandler:", v22, v24, 0, v23);

    }
    else
    {
      -[GKLeaderboardSetDataSource presentLeaderboardsListWithSet:segueToLeaderboard:](self, "presentLeaderboardsListWithSet:segueToLeaderboard:", v16, 0);
    }

  }
}

void __81__GKLeaderboardSetDataSource_handleSelectionInCollectionView_forItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "presentLeaderboardsListWithSet:segueToLeaderboard:", *(_QWORD *)(a1 + 40), v3);

}

- (void)presentLeaderboardsListWithSet:(id)a3 segueToLeaderboard:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  GKLeaderboardScoreViewController *v12;
  void *v13;
  GKLeaderboardScoreViewController *v14;
  GKLeaderboardListViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  id v21;

  v21 = a3;
  v6 = a4;
  -[GKGameLayerCollectionDataSource presentationViewController](self, "presentationViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[GKGameLayerCollectionDataSource presentationViewController](self, "presentationViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "viewControllers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    if (v6)
    {
      v12 = [GKLeaderboardScoreViewController alloc];
      -[GKGameLayerCollectionDataSource gameRecord](self, "gameRecord");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[GKLeaderboardScoreViewController initWithGameRecord:leaderboard:](v12, "initWithGameRecord:leaderboard:", v13, v6);

      objc_msgSend(v11, "addObject:", v14);
    }
    else
    {
      v15 = [GKLeaderboardListViewController alloc];
      -[GKGameLayerCollectionDataSource gameRecord](self, "gameRecord");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[GKLeaderboardListViewController initWithGameRecord:leaderboardSet:](v15, "initWithGameRecord:leaderboardSet:", v16, v21);

      -[GKLeaderboardScoreViewController dataSource](v14, "dataSource");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAssetNames:", self->_leaderboardAssetNames);
      objc_msgSend(v11, "addObject:", v14);

    }
    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = (_QWORD *)MEMORY[0x1E0D24CB0];
    if (v6)
      v20 = (_QWORD *)MEMORY[0x1E0D24CA8];
    objc_msgSend(v18, "reportEvent:type:", *MEMORY[0x1E0D25060], *v20);

    objc_msgSend(v9, "setViewControllers:animated:", v11, 1);
  }

}

- (NSDictionary)leaderboardSetAssetNames
{
  return self->_leaderboardSetAssetNames;
}

- (void)setLeaderboardSetAssetNames:(id)a3
{
  objc_storeStrong((id *)&self->_leaderboardSetAssetNames, a3);
}

- (NSDictionary)leaderboardAssetNames
{
  return self->_leaderboardAssetNames;
}

- (void)setLeaderboardAssetNames:(id)a3
{
  objc_storeStrong((id *)&self->_leaderboardAssetNames, a3);
}

- (NSArray)leaderboardSets
{
  return self->_leaderboardSets;
}

- (void)setLeaderboardSets:(id)a3
{
  objc_storeStrong((id *)&self->_leaderboardSets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaderboardSets, 0);
  objc_storeStrong((id *)&self->_leaderboardAssetNames, 0);
  objc_storeStrong((id *)&self->_leaderboardSetAssetNames, 0);
}

@end
