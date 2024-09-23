@implementation GKDashboardLeaderboardScoreDataSource

- (GKDashboardLeaderboardScoreDataSource)initWithGameRecord:(id)a3 leaderboard:(id)a4
{
  id v6;
  id v7;
  GKDashboardLeaderboardScoreDataSource *v8;
  GKDashboardLeaderboardScoreDataSource *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GKDashboardLeaderboardScoreDataSource;
  v8 = -[GKCollectionDataSource init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[GKDashboardLeaderboardScoreDataSource setGameRecord:](v8, "setGameRecord:", v6);
    -[GKDashboardLeaderboardScoreDataSource setLeaderboard:](v9, "setLeaderboard:", v7);
    -[GKDashboardLeaderboardScoreDataSource setForceInitialShowMore:](v9, "setForceInitialShowMore:", 0);
    -[GKCollectionDataSource setUseStandardHeaders:](v9, "setUseStandardHeaders:", 0);
  }

  return v9;
}

- (void)setPlayerScope:(int64_t)a3
{
  -[GKLeaderboard setPlayerScope:](self->_leaderboard, "setPlayerScope:", a3);
}

- (int64_t)playerScope
{
  return -[GKLeaderboard playerScope](self->_leaderboard, "playerScope");
}

- (void)setTimeScope:(int64_t)a3
{
  -[GKLeaderboard setTimeScope:](self->_leaderboard, "setTimeScope:", a3);
}

- (int64_t)timeScope
{
  return -[GKLeaderboard timeScope](self->_leaderboard, "timeScope");
}

- (void)setupCollectionView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v4 = a3;
  +[GKDashboardLeaderboardScoreCell lowRankNib](GKDashboardLeaderboardScoreCell, "lowRankNib");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerNib:forCellWithReuseIdentifier:", v5, CFSTR("lowRankCell"));
  +[GKDashboardLeaderboardScoreCell highRankNib](GKDashboardLeaderboardScoreCell, "highRankNib");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "registerNib:forCellWithReuseIdentifier:", v6, CFSTR("highRankCell"));
  +[NSObject _gkNib](GKDashboardShowMoreTextCell, "_gkNib");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "registerNib:forCellWithReuseIdentifier:", v7, CFSTR("showMoreCell"));
  if (!-[GKCollectionDataSource useStandardHeaders](self, "useStandardHeaders"))
  {
    +[NSObject _gkNib](GKDashboardButtonSectionHeaderView, "_gkNib");
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "registerNib:forSupplementaryViewOfKind:withReuseIdentifier:", v8, *MEMORY[0x1E0DC48A8], CFSTR("sectionHeader"));
    v7 = (void *)v8;
  }
  if (-[GKDashboardLeaderboardScoreDataSource hasFriendsButton](self, "hasFriendsButton"))
  {
    +[NSObject _gkNib](GKDashboardSingleButtonReusableFooterView, "_gkNib");
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "registerNib:forSupplementaryViewOfKind:withReuseIdentifier:", v9, *MEMORY[0x1E0DC48A0], CFSTR("sectionFooter"));
    v7 = (void *)v9;
  }
  v10.receiver = self;
  v10.super_class = (Class)GKDashboardLeaderboardScoreDataSource;
  -[GKCollectionDataSource setupCollectionView:](&v10, sel_setupCollectionView_, v4);

}

- (void)loadDataWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[GKDashboardLeaderboardScoreDataSource leaderboard](self, "leaderboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRange:", 1, 100);

  -[GKDashboardLeaderboardScoreDataSource leaderboard](self, "leaderboard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardLeaderboardScoreDataSource gameRecord](self, "gameRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__GKDashboardLeaderboardScoreDataSource_loadDataWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E59C46B8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v6, "loadScoresForGame:withCompletionHandler:", v7, v9);

}

void __71__GKDashboardLeaderboardScoreDataSource_loadDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "scores");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v13) & 1) != 0)
  {

LABEL_5:
    v7 = 0;
    goto LABEL_12;
  }

  if (!v13 && v5)
    goto LABEL_5;
  objc_msgSend(*(id *)(a1 + 32), "setScores:");
  objc_msgSend(*(id *)(a1 + 32), "setForceInitialShowMore:", 0);
  objc_msgSend(*(id *)(a1 + 32), "scores");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v10 = *(void **)(a1 + 32);
  if (v9 >= 0x1A)
  {
    objc_msgSend(v10, "setVisibleItemCount:", 25);
  }
  else
  {
    objc_msgSend(v10, "scores");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setVisibleItemCount:", objc_msgSend(v11, "count"));

  }
  if (objc_msgSend(*(id *)(a1 + 32), "needsShowMoreCell"))
    objc_msgSend(*(id *)(a1 + 32), "setVisibleItemCount:", objc_msgSend(*(id *)(a1 + 32), "visibleItemCount") + 1);
  v7 = 1;
LABEL_12:
  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, v7, v5);

}

- (void)showMoreInCollectionView:(id)a3 section:(int64_t)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  char *__ptr32 *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  BOOL v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  unint64_t v28;
  void *v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  id *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[5];
  _QWORD v40[5];
  id v41;
  id v42;
  int64_t v43;
  _QWORD v44[5];
  _QWORD v45[3];

  v6 = a3;
  if (!-[GKDashboardLeaderboardScoreDataSource isShowingMoreScores](self, "isShowingMoreScores"))
  {
    objc_msgSend(MEMORY[0x1E0D252A8], "dispatchGroupWithName:", CFSTR("showMoreInCollectionView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardLeaderboardScoreDataSource setShowingMoreScores:](self, "setShowingMoreScores:", 1);
    v8 = -[GKDashboardLeaderboardScoreDataSource visibleItemCount](self, "visibleItemCount") + 25;
    -[GKDashboardLeaderboardScoreDataSource scores](self, "scores");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    v11 = MEMORY[0x1E0C809B0];
    v12 = &off_1AB7F7000;
    if (v8 <= v10)
    {

    }
    else
    {
      -[GKDashboardLeaderboardScoreDataSource scores](self, "scores");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");
      -[GKDashboardLeaderboardScoreDataSource leaderboard](self, "leaderboard");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "maxRange");

      v17 = v14 >= v16;
      v12 = &off_1AB7F7000;
      if (!v17)
      {
        -[GKDashboardLeaderboardScoreDataSource leaderboard](self, "leaderboard");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "range");
        -[GKDashboardLeaderboardScoreDataSource leaderboard](self, "leaderboard");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "maxRange");

        if (v19 >= v21)
        {
LABEL_11:
          v39[0] = v11;
          v39[1] = *((_QWORD *)v12 + 436);
          v39[2] = __74__GKDashboardLeaderboardScoreDataSource_showMoreInCollectionView_section___block_invoke_7;
          v39[3] = &unk_1E59C4148;
          v39[4] = self;
          objc_msgSend(v7, "notifyOnMainQueueWithBlock:", v39);

          goto LABEL_12;
        }
        -[GKDashboardLeaderboardScoreDataSource leaderboard](self, "leaderboard");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "range");
        v25 = v24;

        v26 = v23 + 100;
        -[GKDashboardLeaderboardScoreDataSource leaderboard](self, "leaderboard");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "maxRange");

        if (v26 <= v28)
        {
          -[GKDashboardLeaderboardScoreDataSource leaderboard](self, "leaderboard");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "maxRange");

          v12 = &off_1AB7F7000;
          if (v26 + v25 <= v35)
          {
LABEL_18:
            -[GKDashboardLeaderboardScoreDataSource leaderboard](self, "leaderboard");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setRange:", v26, v25);

            v40[0] = v11;
            v40[1] = *((_QWORD *)v12 + 436);
            v40[2] = __74__GKDashboardLeaderboardScoreDataSource_showMoreInCollectionView_section___block_invoke_3;
            v40[3] = &unk_1E59C7BF0;
            v40[4] = self;
            v33 = &v41;
            v38 = v7;
            v41 = v38;
            v42 = v6;
            v43 = a4;
            objc_msgSend(v38, "perform:", v40);

            goto LABEL_10;
          }
          -[GKDashboardLeaderboardScoreDataSource leaderboard](self, "leaderboard");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v36, "maxRange") - v26;
        }
        else
        {
          -[GKDashboardLeaderboardScoreDataSource leaderboard](self, "leaderboard");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "range");
          if (v30 > 0x63)
          {
            v25 = 100;
          }
          else
          {
            -[GKDashboardLeaderboardScoreDataSource leaderboard](self, "leaderboard");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "range");
            v25 = v32;

          }
          -[GKDashboardLeaderboardScoreDataSource leaderboard](self, "leaderboard");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v36, "maxRange") - v25;
        }

        goto LABEL_18;
      }
    }
    v44[0] = v11;
    v44[1] = 3221225472;
    v44[2] = __74__GKDashboardLeaderboardScoreDataSource_showMoreInCollectionView_section___block_invoke;
    v44[3] = &unk_1E59C6038;
    v44[4] = self;
    v33 = (id *)v45;
    v45[0] = v6;
    v45[1] = a4;
    objc_msgSend(v7, "perform:", v44);
LABEL_10:

    goto LABEL_11;
  }
LABEL_12:

}

void __74__GKDashboardLeaderboardScoreDataSource_showMoreInCollectionView_section___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__GKDashboardLeaderboardScoreDataSource_showMoreInCollectionView_section___block_invoke_2;
  v8[3] = &unk_1E59C4458;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "revealMoreItemsInCollectionView:section:completion:", v5, v6, v8);

}

uint64_t __74__GKDashboardLeaderboardScoreDataSource_showMoreInCollectionView_section___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__GKDashboardLeaderboardScoreDataSource_showMoreInCollectionView_section___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "leaderboard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "gameRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__GKDashboardLeaderboardScoreDataSource_showMoreInCollectionView_section___block_invoke_4;
  v10[3] = &unk_1E59C7BC8;
  v6 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v13 = v3;
  v14 = v8;
  v12 = v7;
  v9 = v3;
  objc_msgSend(v4, "loadScoresForGame:withCompletionHandler:", v5, v10);

}

void __74__GKDashboardLeaderboardScoreDataSource_showMoreInCollectionView_section___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "scores");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    if (v4)
    {
      objc_msgSend(v5, "scores");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setScores:", v7);

    }
    else
    {
      objc_msgSend(v5, "setScores:", v3);
    }

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __74__GKDashboardLeaderboardScoreDataSource_showMoreInCollectionView_section___block_invoke_5;
    v11[3] = &unk_1E59C6038;
    v8 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v9 = *(id *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 64);
    v12 = v9;
    v13 = v10;
    objc_msgSend(v8, "perform:", v11);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __74__GKDashboardLeaderboardScoreDataSource_showMoreInCollectionView_section___block_invoke_5(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__GKDashboardLeaderboardScoreDataSource_showMoreInCollectionView_section___block_invoke_6;
  v8[3] = &unk_1E59C4458;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "revealMoreItemsInCollectionView:section:completion:", v5, v6, v8);

}

uint64_t __74__GKDashboardLeaderboardScoreDataSource_showMoreInCollectionView_section___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __74__GKDashboardLeaderboardScoreDataSource_showMoreInCollectionView_section___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowingMoreScores:", 0);
}

- (void)revealMoreItemsInCollectionView:(id)a3 section:(int64_t)a4 completion:(id)a5
{
  int64_t visibleItemCount;
  int64_t v9;
  void *v10;
  NSUInteger v11;
  uint64_t v12;
  _BOOL4 v13;
  void *v14;
  int64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  int64_t v30;

  v23 = a3;
  v24 = a5;
  visibleItemCount = self->_visibleItemCount;
  v9 = visibleItemCount - 1;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", visibleItemCount - 1, a4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[GKDashboardLeaderboardScoreDataSource needsShowcaseCell](self, "needsShowcaseCell"))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", visibleItemCount - 2, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v11 = -[NSArray count](self->_scores, "count");
  if (v11 - visibleItemCount >= 0x19)
    v12 = 25;
  else
    v12 = v11 - visibleItemCount;
  v13 = -[GKDashboardLeaderboardScoreDataSource needsShowcaseCell](self, "needsShowcaseCell");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v15 = v9 - v13;
    v16 = v12;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v15, a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v17);

      ++v15;
      --v16;
    }
    while (v16);
  }
  self->_visibleItemCount += v12;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __92__GKDashboardLeaderboardScoreDataSource_revealMoreItemsInCollectionView_section_completion___block_invoke;
  v25[3] = &unk_1E59C7158;
  v25[4] = self;
  v26 = v10;
  v27 = v23;
  v28 = v14;
  v29 = v22;
  v30 = a4;
  v18 = v22;
  v19 = v14;
  v20 = v23;
  v21 = v10;
  objc_msgSend(v20, "performBatchUpdates:completion:", v25, v24);

}

void __92__GKDashboardLeaderboardScoreDataSource_revealMoreItemsInCollectionView_section_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(*(id *)(a1 + 32), "visibleItemCount") - 1, *(_QWORD *)(a1 + 72));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(*(id *)(a1 + 32), "visibleItemCount") - 2, *(_QWORD *)(a1 + 72));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 40))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "needsShowcaseCell");
    v5 = *(void **)(a1 + 48);
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 48), "moveItemAtIndexPath:toIndexPath:", *(_QWORD *)(a1 + 40), v3);
    }
    else
    {
      v11[0] = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deleteItemsAtIndexPaths:", v6);

      objc_msgSend(*(id *)(a1 + 56), "addObject:", v3);
    }
  }
  v7 = objc_msgSend(*(id *)(a1 + 32), "needsShowMoreCell");
  v8 = *(void **)(a1 + 48);
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 48), "moveItemAtIndexPath:toIndexPath:", *(_QWORD *)(a1 + 64), v2);
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteItemsAtIndexPaths:", v9);

    objc_msgSend(*(id *)(a1 + 56), "addObject:", v2);
  }
  objc_msgSend(*(id *)(a1 + 48), "insertItemsAtIndexPaths:", *(_QWORD *)(a1 + 56));

}

- (BOOL)needsShowMoreCell
{
  unint64_t visibleItemCount;
  NSUInteger v4;
  BOOL v5;

  visibleItemCount = self->_visibleItemCount;
  v4 = -[GKLeaderboard maxRange](self->_leaderboard, "maxRange");
  v5 = !self->_forceInitialShowMore && visibleItemCount >= v4;
  return !v5;
}

- (BOOL)isShowMoreIndexPath:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[GKDashboardLeaderboardScoreDataSource needsShowMoreCell](self, "needsShowMoreCell"))
    v5 = objc_msgSend(v4, "item") == self->_visibleItemCount - 1;
  else
    v5 = 0;

  return v5;
}

- (BOOL)isShowcaseIndexPath:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[GKDashboardLeaderboardScoreDataSource needsShowcaseCell](self, "needsShowcaseCell"))
    v5 = objc_msgSend(v4, "item") == self->_visibleItemCount - 2;
  else
    v5 = 0;

  return v5;
}

- (BOOL)hasFriendsButton
{
  return -[GKDashboardLeaderboardScoreDataSource playerScope](self, "playerScope") == 1;
}

- (BOOL)needsShowcaseCell
{
  void *v3;
  BOOL v4;
  void *v5;

  -[GKLeaderboard localPlayerScore](self->_leaderboard, "localPlayerScore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && -[GKLeaderboard playerScope](self->_leaderboard, "playerScope") == GKLeaderboardPlayerScopeGlobal)
  {
    -[GKLeaderboard localPlayerScore](self->_leaderboard, "localPlayerScore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "rank") > self->_visibleItemCount;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)itemCount
{
  return self->_visibleItemCount;
}

- (double)preferredCollectionHeight
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  double result;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Leaderboard scores are not intended to be embedded in a GKDashboardMultiCollectionViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKDashboardLeaderboardScoreDataSource.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v4, "-[GKDashboardLeaderboardScoreDataSource preferredCollectionHeight]", objc_msgSend(v6, "UTF8String"), 293);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v7);
  v9.receiver = self;
  v9.super_class = (Class)GKDashboardLeaderboardScoreDataSource;
  -[GKCollectionDataSource preferredCollectionHeight](&v9, sel_preferredCollectionHeight);
  return result;
}

- (id)itemForIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "item");
  if (-[GKDashboardLeaderboardScoreDataSource isShowcaseIndexPath:](self, "isShowcaseIndexPath:", v4))
  {
    -[GKLeaderboard localPlayerScore](self->_leaderboard, "localPlayerScore");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[GKDashboardLeaderboardScoreDataSource isShowMoreIndexPath:](self, "isShowMoreIndexPath:", v4)
      || -[NSArray count](self->_scores, "count") <= v5)
    {
      v7 = 0;
      goto LABEL_8;
    }
    -[NSArray objectAtIndexedSubscript:](self->_scores, "objectAtIndexedSubscript:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
LABEL_8:

  return v7;
}

- (id)sectionHeaderText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[GKLeaderboard maxRange](self->_leaderboard, "maxRange");
  if (-[GKLeaderboard playerScope](self->_leaderboard, "playerScope") == GKLeaderboardPlayerScopeFriendsOnly)
  {
    GKGameCenterUIFrameworkBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    GKGameCenterUIFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    GKFormattedStringWithGroupingFromInteger();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v3, v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (UIFont)sectionHeaderFont
{
  return 0;
}

- (void)sectionHeaderButtonPressed:(id)a3
{
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;
  void (*v8)(void *, SEL, id);
  void *v9;
  id v10;

  v10 = a3;
  -[GKDashboardLeaderboardScoreDataSource timeScopeTarget](self, "timeScopeTarget");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[GKDashboardLeaderboardScoreDataSource timeScopeAction](self, "timeScopeAction");

    if (v6)
    {
      -[GKDashboardLeaderboardScoreDataSource timeScopeTarget](self, "timeScopeTarget");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void (*)(void *, SEL, id))objc_msgSend(v7, "methodForSelector:", -[GKDashboardLeaderboardScoreDataSource timeScopeAction](self, "timeScopeAction"));

      -[GKDashboardLeaderboardScoreDataSource timeScopeTarget](self, "timeScopeTarget");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8(v9, -[GKDashboardLeaderboardScoreDataSource timeScopeAction](self, "timeScopeAction"), v10);

    }
  }

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
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
  id v13;
  void *v14;
  const __CFString *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  if (-[GKDashboardLeaderboardScoreDataSource isShowMoreIndexPath:](self, "isShowMoreIndexPath:", v7))
  {
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("showMoreCell"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[GKDashboardLeaderboardScoreDataSource itemForIndexPath:](self, "itemForIndexPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKDashboardLeaderboardScoreDataSource.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ (score)\n[%s (%s:%d)]"), v11, "-[GKDashboardLeaderboardScoreDataSource collectionView:cellForItemAtIndexPath:]", objc_msgSend(v13, "UTF8String"), 361);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
    }
    if (objc_msgSend(v9, "rank") >= 100)
      v15 = CFSTR("highRankCell");
    else
      v15 = CFSTR("lowRankCell");
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v15, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setScore:", v9);
    if (-[GKDashboardLeaderboardScoreDataSource needsShowcaseCell](self, "needsShowcaseCell"))
    {
      objc_msgSend(v9, "player");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setLinesVisible:", objc_msgSend(v16, "isLocalPlayer"));

    }
    else
    {
      objc_msgSend(v8, "setLinesVisible:", 0);
    }

  }
  return v8;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  _BOOL4 v5;
  __objc2_class **v6;
  double v7;
  double v8;
  CGSize result;

  v5 = -[GKDashboardLeaderboardScoreDataSource isShowMoreIndexPath:](self, "isShowMoreIndexPath:", a5, a4);
  v6 = off_1E59C2A08;
  if (!v5)
    v6 = off_1E59C2998;
  -[__objc2_class defaultSize](*v6, "defaultSize");
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGSize result;

  v8 = a3;
  v9 = a4;
  if (!-[GKCollectionDataSource useStandardHeaders](self, "useStandardHeaders"))
  {
    -[GKDashboardLeaderboardScoreDataSource sectionHeaderText](self, "sectionHeaderText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D25308], "localizedStringForTimeScope:", -[GKDashboardLeaderboardScoreDataSource timeScope](self, "timeScope"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKDashboardButtonSectionHeaderView platformSizeForTitle:buttonTitle:](GKDashboardButtonSectionHeaderView, "platformSizeForTitle:buttonTitle:", v14, v15);
LABEL_6:
    v11 = v16;
    v13 = v17;

    goto LABEL_7;
  }
  if (!-[GKDashboardLeaderboardScoreDataSource itemCount](self, "itemCount"))
  {
    -[GKDashboardLeaderboardScoreDataSource sectionHeaderText](self, "sectionHeaderText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardLeaderboardScoreDataSource sectionHeaderFont](self, "sectionHeaderFont");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKDashboardSectionHeaderView platformSizeForTitle:withFont:](GKDashboardSectionHeaderView, "platformSizeForTitle:withFont:", v14, v15);
    goto LABEL_6;
  }
  v20.receiver = self;
  v20.super_class = (Class)GKDashboardLeaderboardScoreDataSource;
  -[GKCollectionDataSource collectionView:layout:referenceSizeForHeaderInSection:](&v20, sel_collectionView_layout_referenceSizeForHeaderInSection_, v8, v9, a5);
  v11 = v10;
  v13 = v12;
LABEL_7:

  v18 = v11;
  v19 = v13;
  result.height = v19;
  result.width = v18;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  double v5;
  double v6;
  _BOOL4 v7;
  double v8;
  double v9;
  CGSize result;

  v5 = *MEMORY[0x1E0C9D820];
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v7 = -[GKDashboardLeaderboardScoreDataSource hasFriendsButton](self, "hasFriendsButton", a3, a4, a5);
  if (v7)
    v8 = 40.0;
  else
    v8 = v6;
  v9 = 0.0;
  if (!v7)
    v9 = v5;
  result.height = v8;
  result.width = v9;
  return result;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;
  _QWORD v22[5];
  id v23;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *MEMORY[0x1E0DC48A8];
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC48A8]))
  {
    if (-[GKCollectionDataSource useStandardHeaders](self, "useStandardHeaders"))
    {
      v24.receiver = self;
      v24.super_class = (Class)GKDashboardLeaderboardScoreDataSource;
      -[GKCollectionDataSource collectionView:viewForSupplementaryElementOfKind:atIndexPath:](&v24, sel_collectionView_viewForSupplementaryElementOfKind_atIndexPath_, v8, v9, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKDashboardLeaderboardScoreDataSource sectionHeaderFont](self, "sectionHeaderFont");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFont:", v13);

    }
    else
    {
      objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v11, CFSTR("sectionHeader"), v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKDashboardLeaderboardScoreDataSource sectionHeaderText](self, "sectionHeaderText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTitle:", v17);

      -[GKDashboardLeaderboardScoreDataSource sectionHeaderFont](self, "sectionHeaderFont");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFont:", v18);

      objc_msgSend(v12, "setOnDarkBackground:", -[GKCollectionDataSource onDarkBackground](self, "onDarkBackground"));
      objc_msgSend(MEMORY[0x1E0D25308], "localizedStringForTimeScope:", -[GKDashboardLeaderboardScoreDataSource timeScope](self, "timeScope"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setButtonTitle:", v19);

      objc_msgSend(v12, "setButtonTarget:", self);
      objc_msgSend(v12, "setButtonAction:", sel_sectionHeaderButtonPressed_);
    }
  }
  else
  {
    v14 = *MEMORY[0x1E0DC48A0];
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC48A0])
      && -[GKDashboardLeaderboardScoreDataSource hasFriendsButton](self, "hasFriendsButton"))
    {
      objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v14, CFSTR("sectionFooter"), v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      GKGameCenterUIFrameworkBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setButtonTitle:forState:", v16, 0);

      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __102__GKDashboardLeaderboardScoreDataSource_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke;
      v22[3] = &unk_1E59C4708;
      v22[4] = self;
      v23 = v8;
      objc_msgSend(v12, "setButtonTapHandler:", v22);

    }
    else
    {
      v21.receiver = self;
      v21.super_class = (Class)GKDashboardLeaderboardScoreDataSource;
      -[GKCollectionDataSource collectionView:viewForSupplementaryElementOfKind:atIndexPath:](&v21, sel_collectionView_viewForSupplementaryElementOfKind_atIndexPath_, v8, v9, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v12;
}

void __102__GKDashboardLeaderboardScoreDataSource_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  void *v12;
  _QWORD v13[4];
  void *v14;

  objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportEvent:type:", *MEMORY[0x1E0D25078], *MEMORY[0x1E0D24B50]);

  objc_msgSend(MEMORY[0x1E0D25238], "reporter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "leaderboard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordClickWithAction:targetId:targetType:pageId:pageType:", CFSTR("navigate"), CFSTR("invite"), CFSTR("button"), v5, CFSTR("leaderboard"));

  objc_msgSend(*(id *)(a1 + 40), "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rootViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (*MEMORY[0x1E0D253F8])
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __102__GKDashboardLeaderboardScoreDataSource_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke_3;
    v11[3] = &unk_1E59C58E0;
    v8 = &v12;
    v12 = v7;
    v9 = v7;
    +[FriendRequestFacilitator makeViewControllerWithRecipients:chatGUID:completionHandler:](_TtC12GameCenterUI24FriendRequestFacilitator, "makeViewControllerWithRecipients:chatGUID:completionHandler:", MEMORY[0x1E0C9AA60], 0, v11);
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __102__GKDashboardLeaderboardScoreDataSource_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke_2;
    v13[3] = &unk_1E59C7260;
    v8 = &v14;
    v14 = v7;
    v10 = v7;
    +[FriendRequestFacilitator makeViewControllerForRemoteInviteWithRecipients:chatGUID:resultHandler:](_TtC12GameCenterUI24FriendRequestFacilitator, "makeViewControllerForRemoteInviteWithRecipients:chatGUID:resultHandler:", MEMORY[0x1E0C9AA60], 0, v13);
  }

}

void __102__GKDashboardLeaderboardScoreDataSource_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
    v6 = v7;
  else
    v6 = v5;
  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v6, 1, 0);

}

uint64_t __102__GKDashboardLeaderboardScoreDataSource_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", a2, 1, 0);
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
  void *v7;
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
  id v20;

  v20 = a3;
  v6 = a4;
  if (-[GKDashboardLeaderboardScoreDataSource isShowMoreIndexPath:](self, "isShowMoreIndexPath:", v6))
  {
    objc_msgSend(v20, "deselectItemAtIndexPath:animated:", v6, 1);
    self->_forceInitialShowMore = 0;
    -[GKDashboardLeaderboardScoreDataSource showMoreInCollectionView:section:](self, "showMoreInCollectionView:section:", v20, objc_msgSend(v6, "section"));
  }
  else
  {
    -[GKCollectionDataSource presentationViewController](self, "presentationViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (-[GKDashboardLeaderboardScoreDataSource isShowcaseIndexPath:](self, "isShowcaseIndexPath:", v6))
      {
        -[GKLeaderboard localPlayerScore](self->_leaderboard, "localPlayerScore");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = objc_msgSend(v6, "item");
        if (-[NSArray count](self->_scores, "count") <= v9)
        {
          v10 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKDashboardLeaderboardScoreDataSource.m");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "lastPathComponent");
          v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ (_scores.count > index)\n[%s (%s:%d)]"), v11, "-[GKDashboardLeaderboardScoreDataSource collectionView:didSelectItemAtIndexPath:]", objc_msgSend(v13, "UTF8String"), 499);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
        }
        -[NSArray objectAtIndexedSubscript:](self->_scores, "objectAtIndexedSubscript:", v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v15 = v8;
      objc_msgSend(v8, "player");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "internal");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "playerID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKCollectionDataSource presentationViewController](self, "presentationViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[PlayerProfileViewController showProfileFor:from:completion:](_TtC12GameCenterUI27PlayerProfileViewController, "showProfileFor:from:completion:", v18, v19, 0);

    }
  }

}

- (GKLeaderboard)leaderboard
{
  return self->_leaderboard;
}

- (void)setLeaderboard:(id)a3
{
  objc_storeStrong((id *)&self->_leaderboard, a3);
}

- (id)timeScopeTarget
{
  return objc_loadWeakRetained(&self->_timeScopeTarget);
}

- (void)setTimeScopeTarget:(id)a3
{
  objc_storeWeak(&self->_timeScopeTarget, a3);
}

- (SEL)timeScopeAction
{
  return self->_timeScopeAction;
}

- (void)setTimeScopeAction:(SEL)a3
{
  self->_timeScopeAction = a3;
}

- (GKGameRecord)gameRecord
{
  return self->_gameRecord;
}

- (void)setGameRecord:(id)a3
{
  objc_storeStrong((id *)&self->_gameRecord, a3);
}

- (NSArray)scores
{
  return self->_scores;
}

- (void)setScores:(id)a3
{
  objc_storeStrong((id *)&self->_scores, a3);
}

- (int64_t)visibleItemCount
{
  return self->_visibleItemCount;
}

- (void)setVisibleItemCount:(int64_t)a3
{
  self->_visibleItemCount = a3;
}

- (BOOL)isShowingMoreScores
{
  return self->_showingMoreScores;
}

- (void)setShowingMoreScores:(BOOL)a3
{
  self->_showingMoreScores = a3;
}

- (BOOL)forceInitialShowMore
{
  return self->_forceInitialShowMore;
}

- (void)setForceInitialShowMore:(BOOL)a3
{
  self->_forceInitialShowMore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scores, 0);
  objc_storeStrong((id *)&self->_gameRecord, 0);
  objc_destroyWeak(&self->_timeScopeTarget);
  objc_storeStrong((id *)&self->_leaderboard, 0);
}

@end
