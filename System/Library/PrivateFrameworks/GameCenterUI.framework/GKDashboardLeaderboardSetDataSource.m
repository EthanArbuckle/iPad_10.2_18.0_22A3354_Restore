@implementation GKDashboardLeaderboardSetDataSource

- (GKDashboardLeaderboardSetDataSource)initWithGameRecord:(id)a3
{
  id v4;
  GKDashboardLeaderboardSetDataSource *v5;
  GKDashboardLeaderboardSetDataSource *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKDashboardLeaderboardSetDataSource;
  v5 = -[GKCollectionDataSource init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[GKDashboardLeaderboardSetDataSource setGameRecord:](v5, "setGameRecord:", v4);
    -[GKCollectionDataSource setUseStandardHeaders:](v6, "setUseStandardHeaders:", 1);
  }

  return v6;
}

- (void)setupCollectionView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  objc_msgSend(v4, "_gkFocusingLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFocusScaleFactor:", 1.0);
  +[NSObject _gkNib](GKDashboardLeaderboardCell, "_gkNib");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerNib:forCellWithReuseIdentifier:", v6, CFSTR("leaderboardSetCell"));
  v7.receiver = self;
  v7.super_class = (Class)GKDashboardLeaderboardSetDataSource;
  -[GKCollectionDataSource setupCollectionView:](&v7, sel_setupCollectionView_, v4);

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
  _QWORD v11[5];
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
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKDashboardLeaderboardSetDataSource.m", 83, "-[GKDashboardLeaderboardSetDataSource loadDataWithCompletionHandler:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dispatchGroupWithName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__GKDashboardLeaderboardSetDataSource_loadDataWithCompletionHandler___block_invoke;
  v15[3] = &unk_1E59C6FA0;
  v15[4] = self;
  v15[5] = v16;
  objc_msgSend(v7, "perform:", v15);
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __69__GKDashboardLeaderboardSetDataSource_loadDataWithCompletionHandler___block_invoke_5;
  v11[3] = &unk_1E59C57F8;
  v11[4] = self;
  v9 = v4;
  v13 = v9;
  v14 = v16;
  v10 = v7;
  v12 = v10;
  objc_msgSend(v10, "notifyOnMainQueueWithBlock:", v11);

  _Block_object_dispose(v16, 8);
}

void __69__GKDashboardLeaderboardSetDataSource_loadDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
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
  v9[2] = __69__GKDashboardLeaderboardSetDataSource_loadDataWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E59C6F78;
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v10 = v3;
  v11 = v6;
  v9[4] = v7;
  v8 = v3;
  objc_msgSend(v4, "loadLeaderboardSetsForGame:withCompletionHandler:", v5, v9);

}

void __69__GKDashboardLeaderboardSetDataSource_loadDataWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
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

void __69__GKDashboardLeaderboardSetDataSource_loadDataWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 48);
  if (v1)
  {
    v2 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 40), "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);

  }
}

- (void)removeLeaderboardSetsWithoutImages
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSDictionary *leaderboardSetAssetNames;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_leaderboardSets, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_leaderboardSets;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        leaderboardSetAssetNames = self->_leaderboardSetAssetNames;
        objc_msgSend(v9, "identifier", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](leaderboardSetAssetNames, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  -[GKDashboardLeaderboardSetDataSource setLeaderboardSets:](self, "setLeaderboardSets:", v3);
}

- (int64_t)itemCount
{
  return -[NSArray count](self->_leaderboardSets, "count");
}

- (double)preferredCollectionHeight
{
  return 95.0;
}

- (id)itemForIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;

  v4 = a3;
  v5 = -[NSArray count](self->_leaderboardSets, "count");
  if (v5 <= objc_msgSend(v4, "item"))
  {
    v6 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_leaderboardSets, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)sectionHeaderText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[GKDashboardLeaderboardSetDataSource itemCount](self, "itemCount");
  v2 = (void *)MEMORY[0x1E0CB3940];
  GKGameCenterUIFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  GKFormattedStringWithGroupingFromInteger();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSDictionary *leaderboardSetAssetNames;
  void *v17;
  void *v18;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("leaderboardSetCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "item");

  if (-[NSArray count](self->_leaderboardSets, "count") <= v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKDashboardLeaderboardSetDataSource.m");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastPathComponent");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ (_leaderboardSets.count > index)\n[%s (%s:%d)]"), v10, "-[GKDashboardLeaderboardSetDataSource collectionView:cellForItemAtIndexPath:]", objc_msgSend(v12, "UTF8String"), 153);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v13);
  }
  -[NSArray objectAtIndexedSubscript:](self->_leaderboardSets, "objectAtIndexedSubscript:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameRecord bundleIdentifier](self->_gameRecord, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBundleIdentifier:", v15);

  leaderboardSetAssetNames = self->_leaderboardSetAssetNames;
  objc_msgSend(v14, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](leaderboardSetAssetNames, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImageName:", v18);

  objc_msgSend(v7, "setLeaderboardSet:", v14);
  return v7;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  v5 = 58.0;
  v6 = 0.0;
  result.height = v5;
  result.width = v6;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") == 0;

  return v5;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  GKDashboardLeaderboardListViewController *v18;
  void *v19;
  void *v20;
  void *v21;
  GKGameRecord *gameRecord;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;

  v6 = a3;
  v7 = a4;
  -[GKCollectionDataSource presentationViewController](self, "presentationViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_msgSend(v7, "item");
    if (-[NSArray count](self->_leaderboardSets, "count") <= v9)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKDashboardLeaderboardSetDataSource.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ (_leaderboardSets.count > index)\n[%s (%s:%d)]"), v11, "-[GKDashboardLeaderboardSetDataSource collectionView:didSelectItemAtIndexPath:]", objc_msgSend(v13, "UTF8String"), 178);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
    }
    -[NSArray objectAtIndexedSubscript:](self->_leaderboardSets, "objectAtIndexedSubscript:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "leaderboardIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17 < 2)
    {
      gameRecord = self->_gameRecord;
      v23 = (void *)MEMORY[0x1E0D25308];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __79__GKDashboardLeaderboardSetDataSource_collectionView_didSelectItemAtIndexPath___block_invoke;
      v24[3] = &unk_1E59C8EB0;
      v24[4] = self;
      v25 = v6;
      v26 = v7;
      objc_msgSend(v23, "loadLeaderboardsForGame:forSet:withPlayer:withCompletionHandler:", gameRecord, v15, 0, v24);

    }
    else
    {
      v18 = -[GKDashboardLeaderboardListViewController initWithGameRecord:leaderboardSet:]([GKDashboardLeaderboardListViewController alloc], "initWithGameRecord:leaderboardSet:", self->_gameRecord, v15);
      -[GKDashboardCollectionViewController dataSource](v18, "dataSource");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAssetNames:", self->_leaderboardAssetNames);
      objc_msgSend(v6, "cellForItemAtIndexPath:", v7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "popoverSourceView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKCollectionDataSource showViewController:popoverSourceView:](self, "showViewController:popoverSourceView:", v18, v21);

    }
  }

}

void __79__GKDashboardLeaderboardSetDataSource_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  GKDashboardLeaderboardScoreViewController *v3;
  void *v4;
  GKDashboardLeaderboardScoreViewController *v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v3 = [GKDashboardLeaderboardScoreViewController alloc];
    objc_msgSend(*(id *)(a1 + 32), "gameRecord");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[GKDashboardLeaderboardScoreViewController initWithGameRecord:leaderboard:](v3, "initWithGameRecord:leaderboard:", v4, v7);

    objc_msgSend(*(id *)(a1 + 32), "presentationViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_gkPushViewController:animated:", v5, 1);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "deselectItemAtIndexPath:animated:", *(_QWORD *)(a1 + 48), 0);
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

- (GKGameRecord)gameRecord
{
  return self->_gameRecord;
}

- (void)setGameRecord:(id)a3
{
  objc_storeStrong((id *)&self->_gameRecord, a3);
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
  objc_storeStrong((id *)&self->_gameRecord, 0);
  objc_storeStrong((id *)&self->_leaderboardAssetNames, 0);
  objc_storeStrong((id *)&self->_leaderboardSetAssetNames, 0);
}

@end
