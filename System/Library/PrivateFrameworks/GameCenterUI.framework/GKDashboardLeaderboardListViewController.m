@implementation GKDashboardLeaderboardListViewController

- (GKDashboardLeaderboardListViewController)initWithGameRecord:(id)a3 leaderboardSet:(id)a4
{
  id v6;
  id v7;
  GKDashboardLeaderboardListViewController *v8;
  GKDashboardLeaderboardListViewController *v9;
  GKDashboardLeaderboardListDataSource *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GKDashboardLeaderboardListViewController;
  v8 = -[GKDashboardCollectionViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    -[GKDashboardCollectionViewController setAutoWidthUsesTwoColumnsWhenSpace:](v8, "setAutoWidthUsesTwoColumnsWhenSpace:", 1);
    v10 = -[GKDashboardLeaderboardListDataSource initWithGameRecord:leaderboardSet:]([GKDashboardLeaderboardListDataSource alloc], "initWithGameRecord:leaderboardSet:", v6, v7);
    -[GKDashboardCollectionViewController setDataSource:](v9, "setDataSource:", v10);

    -[GKDashboardCollectionViewController dataSource](v9, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUseStandardHeaders:", 1);

  }
  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKDashboardLeaderboardListViewController;
  -[GKDashboardCollectionViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "sectionInset");
    objc_msgSend(v4, "setSectionInset:", v5 + 0.0);
  }

}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("GKCollectionLayoutTopHeaderKind")))
  {
    objc_msgSend(v10, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", CFSTR("GKCollectionLayoutTopHeaderKind"), CFSTR("logo-header"), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[GKDashboardCollectionViewController dataSource](self, "dataSource");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sectionHeaderText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);

    objc_msgSend(v10, "itemCount");
    v14 = (void *)MEMORY[0x1E0CB3940];
    GKGameCenterUIFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    GKFormattedStringWithGroupingFromInteger();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "subtitleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v18);

  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)GKDashboardLeaderboardListViewController;
    -[GKDashboardCollectionViewController collectionView:viewForSupplementaryElementOfKind:atIndexPath:](&v21, sel_collectionView_viewForSupplementaryElementOfKind_atIndexPath_, v10, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (GKLeaderboardSet)leaderboardSet
{
  return self->_leaderboardSet;
}

- (void)setLeaderboardSet:(id)a3
{
  objc_storeStrong((id *)&self->_leaderboardSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaderboardSet, 0);
}

@end
