@implementation GKDashboardChallengeDataSource

- (GKDashboardChallengeDataSource)initWithGameRecord:(id)a3
{
  id v4;
  GKDashboardChallengeDataSource *v5;
  GKDashboardChallengeDataSource *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKDashboardChallengeDataSource;
  v5 = -[GKCollectionDataSource init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[GKDashboardChallengeDataSource setGameRecord:](v5, "setGameRecord:", v4);
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
  +[NSObject _gkNib](GKChallengePlayerCell, "_gkNib");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerNib:forCellWithReuseIdentifier:", v5, CFSTR("challengeCell"));
  v6.receiver = self;
  v6.super_class = (Class)GKDashboardChallengeDataSource;
  -[GKCollectionDataSource setupCollectionView:](&v6, sel_setupCollectionView_, v4);

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
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD v16[4];
  id v17;
  GKDashboardChallengeDataSource *v18;
  _QWORD *v19;
  _QWORD v20[3];
  char v21;

  v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v5 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/GameCenterUIService/Legacy Challenges UI/GKDashboardChallengeDataSource.m", 72, "-[GKDashboardChallengeDataSource loadDataWithCompletionHandler:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dispatchGroupWithName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __64__GKDashboardChallengeDataSource_loadDataWithCompletionHandler___block_invoke;
  v16[3] = &unk_1E59C8778;
  v9 = v7;
  v17 = v9;
  v18 = self;
  v19 = v20;
  objc_msgSend(v9, "perform:", v16);
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __64__GKDashboardChallengeDataSource_loadDataWithCompletionHandler___block_invoke_5;
  v12[3] = &unk_1E59C6FC8;
  v10 = v4;
  v14 = v10;
  v15 = v20;
  v11 = v9;
  v13 = v11;
  objc_msgSend(v11, "notifyOnMainQueueWithBlock:", v12);

  _Block_object_dispose(v20, 8);
}

void __64__GKDashboardChallengeDataSource_loadDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D25280];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__GKDashboardChallengeDataSource_loadDataWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E59C8E88;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v10 = v5;
  v11 = v6;
  v12 = v3;
  v13 = v7;
  v8 = v3;
  objc_msgSend(v4, "loadReceivedPendingChallengesWithCompletionHandler:", v9);

}

void __64__GKDashboardChallengeDataSource_loadDataWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setError:", a3);
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "isEqualToArray:", v5) & 1) == 0 && (v5 || !a3))
  {
    objc_msgSend(*(id *)(a1 + 40), "setChallenges:", v5);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = *(id *)(*(_QWORD *)(a1 + 40) + 72);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      v10 = MEMORY[0x1E0C809B0];
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
          v13 = *(void **)(a1 + 32);
          v14[0] = v10;
          v14[1] = 3221225472;
          v14[2] = __64__GKDashboardChallengeDataSource_loadDataWithCompletionHandler___block_invoke_3;
          v14[3] = &unk_1E59C4A28;
          v14[4] = v12;
          objc_msgSend(v13, "perform:", v14);
          ++v11;
        }
        while (v8 != v11);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __64__GKDashboardChallengeDataSource_loadDataWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__GKDashboardChallengeDataSource_loadDataWithCompletionHandler___block_invoke_4;
  v6[3] = &unk_1E59C4DA8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "loadDetailsWithCompletionHandler:", v6);

}

uint64_t __64__GKDashboardChallengeDataSource_loadDataWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__GKDashboardChallengeDataSource_loadDataWithCompletionHandler___block_invoke_5(uint64_t a1)
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

- (int64_t)itemCount
{
  return -[NSArray count](self->_challenges, "count");
}

- (double)preferredCollectionHeight
{
  double result;

  +[GKDashboardPlayerCell preferredCollectionHeight](GKDashboardPlayerCell, "preferredCollectionHeight");
  return result;
}

- (id)itemForIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;

  v4 = a3;
  v5 = -[NSArray count](self->_challenges, "count");
  if (v5 <= objc_msgSend(v4, "item"))
  {
    v6 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_challenges, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)sectionHeaderText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  GKGameCenterUIFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v5, -[GKDashboardChallengeDataSource itemCount](self, "itemCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedUppercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("challengeCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "item");

  if (-[NSArray count](self->_challenges, "count") <= v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/GameCenterUIService/Legacy Challenges UI/GKDashboardChallengeDataSource.m");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastPathComponent");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ (_challenges.count > index)\n[%s (%s:%d)]"), v10, "-[GKDashboardChallengeDataSource collectionView:cellForItemAtIndexPath:]", objc_msgSend(v12, "UTF8String"), 135);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v13);
  }
  -[NSArray objectAtIndexedSubscript:](self->_challenges, "objectAtIndexedSubscript:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "issuingPlayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlayer:", v15);

  v16 = (void *)MEMORY[0x1E0CB3940];
  GKGameCenterUIFrameworkBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "issuingPlayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "displayNameWithOptions:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNameText:", v21);

  objc_msgSend(v14, "listTitleText");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStatusText:", v22);

  return v7;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  +[GKDashboardPlayerCell defaultSize](GKDashboardPlayerCell, "defaultSize", a3, a4, a5);
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
  GKChallengeDetailViewController *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a4;
  -[GKCollectionDataSource presentationViewController](self, "presentationViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v17;
  if (v5)
  {
    v7 = objc_msgSend(v17, "item");
    if (-[NSArray count](self->_challenges, "count") <= v7)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/GameCenterUIService/Legacy Challenges UI/GKDashboardChallengeDataSource.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ (_challenges.count > index)\n[%s (%s:%d)]"), v9, "-[GKDashboardChallengeDataSource collectionView:didSelectItemAtIndexPath:]", objc_msgSend(v11, "UTF8String"), 160);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v12);
    }
    -[NSArray objectAtIndexedSubscript:](self->_challenges, "objectAtIndexedSubscript:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[GKChallengeDetailViewController initWithChallenge:]([GKChallengeDetailViewController alloc], "initWithChallenge:", v13);
    -[GKChallengeDetailViewController setShouldShowPlay:](v14, "setShouldShowPlay:", self->_shouldShowPlay);
    -[GKChallengeDetailViewController setDelegate:](v14, "setDelegate:", self);
    -[GKCollectionDataSource presentationViewController](self, "presentationViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[GKCollectionDataSource presentationViewController](self, "presentationViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[GKDashboardPresentationController presentViewController:presentingViewController:animated:](GKDashboardPresentationController, "presentViewController:presentingViewController:animated:", v14, v16, 1);

    }
    v6 = v17;
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

- (GKGameRecord)gameRecord
{
  return self->_gameRecord;
}

- (void)setGameRecord:(id)a3
{
  objc_storeStrong((id *)&self->_gameRecord, a3);
}

- (NSArray)challenges
{
  return self->_challenges;
}

- (void)setChallenges:(id)a3
{
  objc_storeStrong((id *)&self->_challenges, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_challenges, 0);
  objc_storeStrong((id *)&self->_gameRecord, 0);
}

@end
