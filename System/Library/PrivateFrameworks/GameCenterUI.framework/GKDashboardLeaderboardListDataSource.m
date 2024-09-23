@implementation GKDashboardLeaderboardListDataSource

- (GKDashboardLeaderboardListDataSource)initWithGameRecord:(id)a3 leaderboardSet:(id)a4
{
  id v6;
  id v7;
  GKDashboardLeaderboardListDataSource *v8;
  GKDashboardLeaderboardListDataSource *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GKDashboardLeaderboardListDataSource;
  v8 = -[GKCollectionDataSource init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[GKDashboardLeaderboardListDataSource setGameRecord:](v8, "setGameRecord:", v6);
    -[GKDashboardLeaderboardListDataSource setLeaderboardSet:](v9, "setLeaderboardSet:", v7);
    -[GKCollectionDataSource setUseStandardHeaders:](v9, "setUseStandardHeaders:", 1);
  }

  return v9;
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
  objc_msgSend(v4, "registerNib:forCellWithReuseIdentifier:", v6, CFSTR("leaderboardListCell"));
  v7.receiver = self;
  v7.super_class = (Class)GKDashboardLeaderboardListDataSource;
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
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;
  _QWORD *v18;
  _QWORD v19[3];
  char v20;

  v4 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  v5 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKDashboardLeaderboardListDataSource.m", 82, "-[GKDashboardLeaderboardListDataSource loadDataWithCompletionHandler:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dispatchGroupWithName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __70__GKDashboardLeaderboardListDataSource_loadDataWithCompletionHandler___block_invoke;
  v16[3] = &unk_1E59C57D0;
  v16[4] = self;
  v18 = v19;
  v9 = v7;
  v17 = v9;
  objc_msgSend(v9, "perform:", v16);
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __70__GKDashboardLeaderboardListDataSource_loadDataWithCompletionHandler___block_invoke_5;
  v12[3] = &unk_1E59C57F8;
  v12[4] = self;
  v10 = v4;
  v14 = v10;
  v15 = v19;
  v11 = v9;
  v13 = v11;
  objc_msgSend(v11, "notifyOnMainQueueWithBlock:", v12);

  _Block_object_dispose(v19, 8);
}

void __70__GKDashboardLeaderboardListDataSource_loadDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D25308];
  objc_msgSend(*(id *)(a1 + 32), "gameRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "leaderboardSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__GKDashboardLeaderboardListDataSource_loadDataWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E59C57A8;
  v7 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 48);
  v10[4] = v8;
  v11 = v7;
  v12 = v3;
  v9 = v3;
  objc_msgSend(v4, "loadLeaderboardsForGame:forSet:withPlayer:withCompletionHandler:", v5, v6, 0, v10);

}

void __70__GKDashboardLeaderboardListDataSource_loadDataWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v6 = a4;
  objc_msgSend(*(id *)(a1 + 32), "leaderboards");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v7, "count") == 0;

  objc_msgSend(*(id *)(a1 + 32), "leaderboards");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqual:", v9) & 1) != 0)
  {

  }
  else
  {

    if (v9 || !v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "setLeaderboards:", v9);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "setError:", v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __70__GKDashboardLeaderboardListDataSource_loadDataWithCompletionHandler___block_invoke_5(uint64_t a1)
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

- (void)removeLeaderboardsWithoutImages
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSDictionary *assetNames;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_leaderboards, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_leaderboards;
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
        assetNames = self->_assetNames;
        objc_msgSend(v9, "identifier", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](assetNames, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  -[GKDashboardLeaderboardListDataSource setLeaderboards:](self, "setLeaderboards:", v3);
}

- (int64_t)itemCount
{
  return -[NSArray count](self->_leaderboards, "count");
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
  v5 = -[NSArray count](self->_leaderboards, "count");
  if (v5 <= objc_msgSend(v4, "item"))
  {
    v6 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_leaderboards, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
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

  -[GKDashboardLeaderboardListDataSource itemCount](self, "itemCount");
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
  NSDictionary *assetNames;
  void *v17;
  void *v18;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("leaderboardListCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "item");

  if (-[NSArray count](self->_leaderboards, "count") <= v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKDashboardLeaderboardListDataSource.m");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastPathComponent");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ (_leaderboards.count > index)\n[%s (%s:%d)]"), v10, "-[GKDashboardLeaderboardListDataSource collectionView:cellForItemAtIndexPath:]", objc_msgSend(v12, "UTF8String"), 153);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v13);
  }
  -[NSArray objectAtIndexedSubscript:](self->_leaderboards, "objectAtIndexedSubscript:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameRecord bundleIdentifier](self->_gameRecord, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBundleIdentifier:", v15);

  assetNames = self->_assetNames;
  objc_msgSend(v14, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](assetNames, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImageName:", v18);

  objc_msgSend(v7, "setLeaderboard:", v14);
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
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  GKDashboardLeaderboardScoreViewController *v14;
  void *v15;
  id v16;

  v16 = a4;
  -[GKCollectionDataSource presentationViewController](self, "presentationViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v16;
  if (v5)
  {
    v7 = objc_msgSend(v16, "item");
    if (-[NSArray count](self->_leaderboards, "count") <= v7)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKDashboardLeaderboardListDataSource.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ (_leaderboards.count > index)\n[%s (%s:%d)]"), v9, "-[GKDashboardLeaderboardListDataSource collectionView:didSelectItemAtIndexPath:]", objc_msgSend(v11, "UTF8String"), 186);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v12);
    }
    -[NSArray objectAtIndexedSubscript:](self->_leaderboards, "objectAtIndexedSubscript:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[GKDashboardLeaderboardScoreViewController initWithGameRecord:leaderboard:]([GKDashboardLeaderboardScoreViewController alloc], "initWithGameRecord:leaderboard:", self->_gameRecord, v13);
    -[GKCollectionDataSource presentationViewController](self, "presentationViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_gkPushViewController:animated:", v14, 1);

    v6 = v16;
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

- (GKGameRecord)gameRecord
{
  return self->_gameRecord;
}

- (void)setGameRecord:(id)a3
{
  objc_storeStrong((id *)&self->_gameRecord, a3);
}

- (GKLeaderboardSet)leaderboardSet
{
  return self->_leaderboardSet;
}

- (void)setLeaderboardSet:(id)a3
{
  objc_storeStrong((id *)&self->_leaderboardSet, a3);
}

- (NSArray)leaderboards
{
  return self->_leaderboards;
}

- (void)setLeaderboards:(id)a3
{
  objc_storeStrong((id *)&self->_leaderboards, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaderboards, 0);
  objc_storeStrong((id *)&self->_leaderboardSet, 0);
  objc_storeStrong((id *)&self->_gameRecord, 0);
  objc_storeStrong((id *)&self->_assetNames, 0);
}

@end
