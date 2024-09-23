@implementation GKDashboardTurnDetailDataSource

- (GKDashboardTurnDetailDataSource)initWithMatch:(id)a3
{
  id v4;
  GKDashboardTurnDetailDataSource *v5;
  GKDashboardTurnDetailDataSource *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKDashboardTurnDetailDataSource;
  v5 = -[GKCollectionDataSource init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[GKDashboardTurnDetailDataSource setMatch:](v5, "setMatch:", v4);
    -[GKCollectionDataSource setUseStandardHeaders:](v6, "setUseStandardHeaders:", 1);
  }

  return v6;
}

- (void)setupCollectionView:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  +[NSObject _gkNib](GKDashboardTurnCell, "_gkNib");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerNib:forCellWithReuseIdentifier:", v5, CFSTR("turnCell"));
  v6.receiver = self;
  v6.super_class = (Class)GKDashboardTurnDetailDataSource;
  -[GKCollectionDataSource setupCollectionView:](&v6, sel_setupCollectionView_, v4);

}

- (void)loadDataWithCompletionHandler:(id)a3
{
  if (a3)
    (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

- (int64_t)itemCount
{
  void *v2;
  int64_t v3;

  -[GKTurnBasedMatch participants](self->_match, "participants");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
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
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[GKTurnBasedMatch participants](self->_match, "participants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6 <= objc_msgSend(v4, "item"))
  {
    v8 = 0;
  }
  else
  {
    -[GKTurnBasedMatch participants](self->_match, "participants");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)sectionHeaderText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  GKGameCenterUIFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v5, -[GKDashboardTurnDetailDataSource itemCount](self, "itemCount"));
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
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("turnCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "item");

  -[GKTurnBasedMatch participants](self->_match, "participants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 <= v8)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKDashboardTurnDetailDataSource.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastPathComponent");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ (_match.participants.count > index)\n[%s (%s:%d)]"), v12, "-[GKDashboardTurnDetailDataSource collectionView:cellForItemAtIndexPath:]", objc_msgSend(v14, "UTF8String"), 91);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v15);
  }
  -[GKTurnBasedMatch participants](self->_match, "participants");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setDisplayIndex:", v8 + 1);
  objc_msgSend(v7, "configureForParticipant:inMatch:", v17, self->_match);
  objc_msgSend(v7, "setOnDarkBackground:", -[GKCollectionDataSource onDarkBackground](self, "onDarkBackground"));

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

- (GKTurnBasedMatch)match
{
  return self->_match;
}

- (void)setMatch:(id)a3
{
  objc_storeStrong((id *)&self->_match, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_match, 0);
}

@end
