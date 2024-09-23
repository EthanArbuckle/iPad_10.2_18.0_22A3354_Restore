@implementation GKDashboardTurnDataSource

- (GKDashboardTurnDataSource)init
{
  GKDashboardTurnDataSource *v2;
  GKDashboardTurnDataSource *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKDashboardTurnDataSource;
  v2 = -[GKCollectionDataSource init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[GKCollectionDataSource setUseStandardHeaders:](v2, "setUseStandardHeaders:", 1);
  return v3;
}

- (void)setupCollectionView:(id)a3
{
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKDashboardTurnDataSource;
  v3 = a3;
  -[GKCollectionDataSource setupCollectionView:](&v5, sel_setupCollectionView_, v3);
  +[NSObject _gkNib](GKDashboardTurnCell, "_gkNib", v5.receiver, v5.super_class);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerNib:forCellWithReuseIdentifier:", v4, CFSTR("turnCell"));

}

- (void)loadDataWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D253E0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__GKDashboardTurnDataSource_loadDataWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E59C46B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "loadTurnBasedMatchSummariesIncludingCompatibleBundleID:withCompletionHandler:", 1, v7);

}

void __59__GKDashboardTurnDataSource_loadDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a2;
  objc_msgSend(v5, "predicateWithBlock:", &__block_literal_global_26);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredArrayUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "isEqualToArray:", v8) & 1) != 0 || !v6 && v11)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setMatches:", v8);
    v9 = 1;
  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, v9, v11);

}

BOOL __59__GKDashboardTurnDataSource_loadDataWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "status") != 2;
}

- (int64_t)itemCount
{
  return -[NSArray count](self->_matches, "count");
}

- (double)preferredCollectionHeight
{
  double result;

  +[GKDashboardPlayerCell preferredCollectionHeight](GKDashboardTurnCell, "preferredCollectionHeight");
  return result;
}

- (id)itemForIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;

  v4 = a3;
  v5 = -[NSArray count](self->_matches, "count");
  if (v5 <= objc_msgSend(v4, "item"))
  {
    v6 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_matches, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
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

  -[GKDashboardTurnDataSource itemCount](self, "itemCount");
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

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
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

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("turnCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "item");

  if (-[NSArray count](self->_matches, "count") <= v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKDashboardTurnDataSource.m");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastPathComponent");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ (_matches.count > index)\n[%s (%s:%d)]"), v10, "-[GKDashboardTurnDataSource collectionView:cellForItemAtIndexPath:]", objc_msgSend(v12, "UTF8String"), 107);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v13);
  }
  -[NSArray objectAtIndexedSubscript:](self->_matches, "objectAtIndexedSubscript:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configureForMatch:", v14);

  return v7;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  +[GKDashboardTurnCell defaultSize](GKDashboardTurnCell, "defaultSize", a3, a4, a5);
  v6 = 0.0;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
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
  GKDashboardTurnDetailViewController *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  -[GKCollectionDataSource presentationViewController](self, "presentationViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v6, "item");
    if (-[NSArray count](self->_matches, "count") <= v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKDashboardTurnDataSource.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ (_matches.count > index)\n[%s (%s:%d)]"), v10, "-[GKDashboardTurnDataSource collectionView:didSelectItemAtIndexPath:]", objc_msgSend(v12, "UTF8String"), 125);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v13);
    }
    -[NSArray objectAtIndexedSubscript:](self->_matches, "objectAtIndexedSubscript:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[GKDashboardTurnDetailViewController initWithTurnBasedMatch:]([GKDashboardTurnDetailViewController alloc], "initWithTurnBasedMatch:", v14);
    -[GKDashboardTurnDetailViewController setShouldShowPlay:](v15, "setShouldShowPlay:", self->_shouldShowPlay);
    -[GKDashboardTurnDetailViewController setShouldShowQuit:](v15, "setShouldShowQuit:", self->_shouldShowQuit);
    objc_msgSend(v18, "cellForItemAtIndexPath:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "popoverSourceView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKCollectionDataSource showViewController:popoverSourceView:](self, "showViewController:popoverSourceView:", v15, v17);

  }
}

- (BOOL)shouldShowPlay
{
  return self->_shouldShowPlay;
}

- (void)setShouldShowPlay:(BOOL)a3
{
  self->_shouldShowPlay = a3;
}

- (BOOL)shouldShowQuit
{
  return self->_shouldShowQuit;
}

- (void)setShouldShowQuit:(BOOL)a3
{
  self->_shouldShowQuit = a3;
}

- (NSArray)matches
{
  return self->_matches;
}

- (void)setMatches:(id)a3
{
  objc_storeStrong((id *)&self->_matches, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matches, 0);
}

@end
