@implementation GKLeaderboardScoreDataSource

- (GKLeaderboardScoreDataSource)initWithGameRecord:(id)a3 leaderboard:(id)a4
{
  id v6;
  GKLeaderboardScoreDataSource *v7;
  GKLeaderboardScoreDataSource *v8;
  id v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GKLeaderboardScoreDataSource;
  v7 = -[GKGameLayerCollectionDataSource initWithGameRecord:](&v11, sel_initWithGameRecord_, a3);
  v8 = v7;
  if (v7)
  {
    -[GKLeaderboardScoreDataSource setLeaderboard:](v7, "setLeaderboard:", v6);
    -[GKLeaderboardScoreDataSource setAutoScrollToLocalPlayerPosition:](v8, "setAutoScrollToLocalPlayerPosition:", 1);
    v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[GKLeaderboardScoreDataSource setInvitedFriendContactIdentifiers:](v8, "setInvitedFriendContactIdentifiers:", v9);

  }
  return v8;
}

- (void)setPlayerScope:(int64_t)a3
{
  id v4;

  -[GKLeaderboardScoreDataSource leaderboard](self, "leaderboard");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlayerScope:", a3);

}

- (int64_t)playerScope
{
  void *v2;
  int64_t v3;

  -[GKLeaderboardScoreDataSource leaderboard](self, "leaderboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "playerScope");

  return v3;
}

- (void)setTimeScope:(int64_t)a3
{
  id v4;

  -[GKLeaderboardScoreDataSource leaderboard](self, "leaderboard");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeScope:", a3);

}

- (int64_t)timeScope
{
  void *v2;
  int64_t v3;

  -[GKLeaderboardScoreDataSource leaderboard](self, "leaderboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "timeScope");

  return v3;
}

- (void)setupCollectionView:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  GKLeaderboardScoreFlowLayout *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  -[GKLeaderboardScoreDataSource setCollectionView:](self, "setCollectionView:");
  +[GKLeaderboardScoreCell lowRankNib](GKLeaderboardScoreCell, "lowRankNib");
  v4 = objc_claimAutoreleasedReturnValue();
  +[GKLeaderboardScoreCell highRankNib](GKLeaderboardScoreCell, "highRankNib");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSObject _gkNib](GKLoadingCell, "_gkNib");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSObject _gkNib](GKLeaderboardAddFriendsCell, "_gkNib");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSObject _gkNib](GKLeaderboardAddFriendsCell, "_gkNib");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "instantiateWithOwner:options:", 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardScoreDataSource setSizingAddFriendsCell:](self, "setSizingAddFriendsCell:", v10);

  }
  v11 = objc_alloc_init(GKLeaderboardScoreFlowLayout);
  objc_msgSend(v19, "setCollectionViewLayout:", v11);

  v18 = (void *)v4;
  objc_msgSend(v19, "registerNib:forCellWithReuseIdentifier:", v4, CFSTR("lowRankCell"));
  objc_msgSend(v19, "registerNib:forCellWithReuseIdentifier:", v5, CFSTR("highRankCell"));
  objc_msgSend(v19, "registerNib:forCellWithReuseIdentifier:", v6, CFSTR("loadingCell"));
  objc_msgSend(v19, "registerNib:forCellWithReuseIdentifier:", v7, CFSTR("addFriendsCell"));
  v12 = (void *)MEMORY[0x1E0DC3A50];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "nibWithNibName:bundle:", CFSTR("GKLeaderboardScoreCellAX_iOS"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "registerNib:forCellWithReuseIdentifier:", v14, CFSTR("AXCell"));

  LODWORD(v14) = GKIsXRUIIdiomShouldUsePadUI();
  objc_msgSend(v19, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("friendSuggestionCell"));
  objc_msgSend(v19, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("inviteFriendButtonCell"));
  if ((_DWORD)v14)
  {
    v15 = (void *)MEMORY[0x1E0DC3A50];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "nibWithNibName:bundle:", CFSTR("GKChallengeListViewSectionHeader_xrOS"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[NSObject _gkNib](GKChallengeListViewSectionHeader, "_gkNib");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v19, "registerNib:forSupplementaryViewOfKind:withReuseIdentifier:", v17, *MEMORY[0x1E0DC48A8], CFSTR("GKCollectionDataSourceHeader"));

  objc_msgSend(v19, "setDataSource:", self);
  objc_msgSend(v19, "setDelegate:", self);

}

- (void)processEntries:(id)a3 localPlayerEntry:(id)a4 totalPlayerCount:(int64_t)a5 error:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  GKLeaderboardScoreDataSource *v28;
  id v29;
  id v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD v33[5];
  _QWORD v34[5];
  id v35;
  id v36;
  _QWORD *v37;
  _QWORD *v38;
  int64_t v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[3];
  char v43;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/GameCenterUIService/GKLeaderboardScoreDataSource.m", 268, "-[GKLeaderboardScoreDataSource processEntries:localPlayerEntry:totalPlayerCount:error:completionHandler:]");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dispatchGroupWithName:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v43 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__5;
  v40[4] = __Block_byref_object_dispose__5;
  v19 = v12;
  v41 = v19;
  v20 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __105__GKLeaderboardScoreDataSource_processEntries_localPlayerEntry_totalPlayerCount_error_completionHandler___block_invoke;
  v34[3] = &unk_1E59C7040;
  v39 = a5;
  v34[4] = self;
  v37 = v40;
  v21 = v13;
  v35 = v21;
  v22 = v14;
  v36 = v22;
  v38 = v42;
  objc_msgSend(v18, "perform:", v34);
  v33[0] = v20;
  v33[1] = 3221225472;
  v33[2] = __105__GKLeaderboardScoreDataSource_processEntries_localPlayerEntry_totalPlayerCount_error_completionHandler___block_invoke_81;
  v33[3] = &unk_1E59C4A28;
  v33[4] = self;
  objc_msgSend(v18, "perform:", v33);
  v26[0] = v20;
  v26[1] = 3221225472;
  v26[2] = __105__GKLeaderboardScoreDataSource_processEntries_localPlayerEntry_totalPlayerCount_error_completionHandler___block_invoke_85;
  v26[3] = &unk_1E59C7068;
  v23 = v15;
  v30 = v23;
  v31 = v42;
  v24 = v22;
  v27 = v24;
  v28 = self;
  v32 = v40;
  v25 = v21;
  v29 = v25;
  objc_msgSend(v18, "notifyOnMainQueueWithBlock:", v26);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v42, 8);

}

void __105__GKLeaderboardScoreDataSource_processEntries_localPlayerEntry_totalPlayerCount_error_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  _QWORD *v14;
  _QWORD v15[4];

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "playerScope"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "restrictToFriendsOnly"))
    {
      v15[0] = 0;
      v15[1] = v15;
      v15[2] = 0x2020000000;
      v15[3] = 1;
      v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __105__GKLeaderboardScoreDataSource_processEntries_localPlayerEntry_totalPlayerCount_error_completionHandler___block_invoke_2;
      v12 = &unk_1E59C7018;
      v14 = v15;
      v13 = *(id *)(a1 + 40);
      objc_msgSend(v4, "_gkFilterWithBlock:", &v9);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      _Block_object_dispose(v15, 8);
    }
    v8 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count", v9, v10, v11, v12);
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 72);
  }
  objc_msgSend(*(id *)(a1 + 32), "setMaxRange:", v8);
  objc_msgSend(*(id *)(a1 + 32), "setLocalPlayerEntry:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) || !*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "setEntries:");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }
  v3[2](v3);

}

id __105__GKLeaderboardScoreDataSource_processEntries_localPlayerEntry_totalPlayerCount_error_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  objc_msgSend(v3, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLocalPlayer");

  objc_msgSend(v3, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "friendBiDirectional");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToNumber:", &unk_1E5A5E058);

  if ((v8 & 1) != 0 || v5)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    objc_msgSend(v3, "internal");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRank:", v10);

    if (v5)
    {
      v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      objc_msgSend(*(id *)(a1 + 32), "internal");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setRank:", v12);

    }
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v9 = v3;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __105__GKLeaderboardScoreDataSource_processEntries_localPlayerEntry_totalPlayerCount_error_completionHandler___block_invoke_81(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __105__GKLeaderboardScoreDataSource_processEntries_localPlayerEntry_totalPlayerCount_error_completionHandler___block_invoke_2_83;
  v5[3] = &unk_1E59C46B8;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  +[GameCenterObjcHelper fetchSuggestedFriendsWithCompletionHandler:](_TtC12GameCenterUI20GameCenterObjcHelper, "fetchSuggestedFriendsWithCompletionHandler:", v5);

}

void __105__GKLeaderboardScoreDataSource_processEntries_localPlayerEntry_totalPlayerCount_error_completionHandler___block_invoke_2_83(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (!*MEMORY[0x1E0D25460])
      v7 = (id)GKOSLoggers();
    v8 = *MEMORY[0x1E0D25458];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25458], OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1AB361000, v8, OS_LOG_TYPE_INFO, "GKLeaderboardScoreDataSource: Unable to fetch suggested friends: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setSuggestedFriends:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __105__GKLeaderboardScoreDataSource_processEntries_localPlayerEntry_totalPlayerCount_error_completionHandler___block_invoke_85(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "setIsLoadingData:", 0);
    objc_msgSend(*(id *)(a1 + 40), "setShouldDisplayFriendSuggestions:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count") == 0);
    objc_msgSend(*(id *)(a1 + 40), "leaderboardScoreDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      if (objc_msgSend(*(id *)(a1 + 40), "playerScope")
        || !objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count"))
      {
        v9 = 0;
      }
      else
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "objectAtIndexedSubscript:", 0);
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (objc_msgSend(*(id *)(a1 + 48), "rank") >= 1
        && (v4 = objc_msgSend(*(id *)(a1 + 48), "rank"),
            v4 <= objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count")))
      {
        if (objc_msgSend(*(id *)(a1 + 48), "rank") < 2)
        {
          v5 = 0;
        }
        else
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 48), "rank") - 2);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v6 = objc_msgSend(*(id *)(a1 + 48), "rank");
        if (v6 >= objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count"))
        {
          v7 = 0;
        }
        else
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 48), "rank"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(*(id *)(a1 + 40), "leaderboardScoreDelegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "didLoadScoresWithLocalPlayerEntry:topPlayer:playerAbove:playerBelow:totalEntries:", *(_QWORD *)(a1 + 48), v9, v5, v7, objc_msgSend(*(id *)(a1 + 40), "maxRange"));

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "leaderboardScoreDelegate");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "didLoadScoresWithLocalPlayerEntry:topPlayer:playerAbove:playerBelow:totalEntries:", *(_QWORD *)(a1 + 48), v9, 0, 0, objc_msgSend(*(id *)(a1 + 40), "maxRange"));
      }

    }
  }
}

- (void)loadDataWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__GKLeaderboardScoreDataSource_loadDataWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E59C46B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "loadFriendsAsPlayersWithCompletionHandler:", v7);

}

void __62__GKLeaderboardScoreDataSource_loadDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (v5)
  {
    if (!*MEMORY[0x1E0D25460])
      v6 = (id)GKOSLoggers();
    v7 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      __62__GKLeaderboardScoreDataSource_loadDataWithCompletionHandler___block_invoke_cold_1((uint64_t)v5, v7);
  }
  v26 = v5;
  v8 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "setFriendCount:", 0);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v4;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0x1E0D25000uLL;
    v12 = *(_QWORD *)v30;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v15 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("expected GKPlayer, got %@"), v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/GameCenterUIService/GKLeaderboardScoreDataSource.m");
          v17 = v11;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "lastPathComponent");
          v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ ([player isKindOfClass:[GKPlayer class]])\n[%s (%s:%d)]"), v16, "-[GKLeaderboardScoreDataSource loadDataWithCompletionHandler:]_block_invoke", objc_msgSend(v19, "UTF8String"), 348);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = v17;
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v20);

        }
        objc_msgSend(v14, "friendBiDirectional");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "BOOLValue");

        if (v22)
          objc_msgSend(*(id *)(a1 + 32), "setFriendCount:", objc_msgSend(*(id *)(a1 + 32), "friendCount") + 1);
        objc_msgSend(v14, "internal");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "playerID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v24);

        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLocalPlayerFriendIDs:", v25);

  objc_msgSend(*(id *)(a1 + 32), "loadInitialDataWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

- (void)loadInitialDataWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  int64_t v19;
  uint64_t *v20;
  id v21;
  id v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;

  v4 = a3;
  -[GKLeaderboardScoreDataSource setFirstLoad:](self, "setFirstLoad:", 1);
  -[GKLeaderboardScoreDataSource setIsLoadingData:](self, "setIsLoadingData:", 1);
  -[GKLeaderboardScoreDataSource setIsLoadingNextData:](self, "setIsLoadingNextData:", 0);
  -[GKLeaderboardScoreDataSource setIsLoadingPreviousData:](self, "setIsLoadingPreviousData:", 0);
  -[GKLeaderboardScoreDataSource setAdditionalNextDataLoadToken:](self, "setAdditionalNextDataLoadToken:", 0);
  -[GKLeaderboardScoreDataSource setAdditionalPreviousDataLoadToken:](self, "setAdditionalPreviousDataLoadToken:", 0);
  v31 = 0;
  v32 = &v31;
  v33 = 0x3010000000;
  v35 = 0;
  v36 = 0;
  v34 = &unk_1AB8BD257;
  -[GKLeaderboardScoreDataSource leaderboard](self, "leaderboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "playerScope");

  v7 = v32;
  v8 = 100;
  if (v6 == 1)
    v8 = 600;
  v32[4] = 1;
  v7[5] = v8;
  -[GKLeaderboardScoreDataSource setStartingRank:](self, "setStartingRank:", 1);
  -[GKLeaderboardScoreDataSource leaderboard](self, "leaderboard");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "playerScope");

  -[GKLeaderboardScoreDataSource leaderboard](self, "leaderboard");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "timeScope");
  v23 = v4;

  -[GKLeaderboardScoreDataSource leaderboard](self, "leaderboard");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKLeaderboardScoreDataSource leaderboard](self, "leaderboard");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameLayerCollectionDataSource gameRecord](self, "gameRecord");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "gameDescriptor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[GKLeaderboardScoreDataSource playerScope](self, "playerScope");
  v19 = -[GKLeaderboardScoreDataSource timeScope](self, "timeScope");
  v20 = v32;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __69__GKLeaderboardScoreDataSource_loadInitialDataWithCompletionHandler___block_invoke;
  v24[3] = &unk_1E59C70B8;
  v28 = v10;
  v29 = v12;
  v24[4] = self;
  v21 = v14;
  v25 = v21;
  v22 = v23;
  v26 = v22;
  v27 = &v31;
  v30 = 1;
  objc_msgSend(v15, "loadEntriesWithGameDescriptor:fetchOptions:playerScope:timeScope:range:completionHandler:", v17, 1, v18, v19, v20[4], v20[5], v24);

  _Block_object_dispose(&v31, 8);
}

void __69__GKLeaderboardScoreDataSource_loadInitialDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[5];
  id v29;
  id v30;
  __int128 v31;

  v9 = a2;
  v10 = a3;
  v11 = a5;
  v12 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "leaderboard");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 != objc_msgSend(v13, "playerScope"))
    goto LABEL_9;
  v14 = *(_QWORD *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "leaderboard");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 != objc_msgSend(v15, "timeScope"))
  {

LABEL_9:
    goto LABEL_10;
  }
  v16 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "leaderboard");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = objc_msgSend(v16, "isEqualToString:", v18);

  if ((v16 & 1) == 0)
  {
LABEL_10:
    objc_msgSend(*(id *)(a1 + 32), "loadInitialDataWithCompletionHandler:", *(_QWORD *)(a1 + 48));
    goto LABEL_11;
  }
  v19 = objc_msgSend(*(id *)(a1 + 32), "autoScrollToLocalPlayerPosition");
  if (v9
    && v19
    && (unint64_t)objc_msgSend(v9, "rank") > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
                                                  + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = (100 * (objc_msgSend(v9, "rank") / 100)) | 1;
    objc_msgSend(*(id *)(a1 + 32), "setStartingRank:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
    objc_msgSend(*(id *)(a1 + 32), "leaderboard");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "gameRecord");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "gameDescriptor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(a1 + 80);
    v23 = objc_msgSend(*(id *)(a1 + 32), "playerScope");
    v24 = objc_msgSend(*(id *)(a1 + 32), "timeScope");
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[2] = __69__GKLeaderboardScoreDataSource_loadInitialDataWithCompletionHandler___block_invoke_2;
    v28[3] = &unk_1E59C7090;
    v26 = *(void **)(a1 + 40);
    v28[4] = *(_QWORD *)(a1 + 32);
    v28[1] = 3221225472;
    v31 = *(_OWORD *)(a1 + 64);
    v29 = v26;
    v30 = *(id *)(a1 + 48);
    objc_msgSend(v20, "loadEntriesWithGameDescriptor:fetchOptions:playerScope:timeScope:range:completionHandler:", v22, v27, v23, v24, *(_QWORD *)(v25 + 32), *(_QWORD *)(v25 + 40), v28);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "processEntries:localPlayerEntry:totalPlayerCount:error:completionHandler:", v10, v9, a4, v11, *(_QWORD *)(a1 + 48));
  }
LABEL_11:

}

void __69__GKLeaderboardScoreDataSource_loadInitialDataWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  v9 = a3;
  v10 = a5;
  v11 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "leaderboard");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 != objc_msgSend(v12, "playerScope"))
    goto LABEL_6;
  v13 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "leaderboard");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 != objc_msgSend(v14, "timeScope"))
  {

LABEL_6:
    goto LABEL_7;
  }
  v15 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "leaderboard");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = objc_msgSend(v15, "isEqualToString:", v17);

  if ((v15 & 1) == 0)
  {
LABEL_7:
    objc_msgSend(*(id *)(a1 + 32), "loadInitialDataWithCompletionHandler:", *(_QWORD *)(a1 + 48));
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "processEntries:localPlayerEntry:totalPlayerCount:error:completionHandler:", v9, v18, a4, v10, *(_QWORD *)(a1 + 48));
LABEL_8:

}

- (void)loadMoreDataWithStartIndex:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  int64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v6 = a4;
  -[GKLeaderboardScoreDataSource leaderboard](self, "leaderboard");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameLayerCollectionDataSource gameRecord](self, "gameRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "gameDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[GKLeaderboardScoreDataSource playerScope](self, "playerScope");
  v11 = -[GKLeaderboardScoreDataSource timeScope](self, "timeScope");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__GKLeaderboardScoreDataSource_loadMoreDataWithStartIndex_completionHandler___block_invoke;
  v13[3] = &unk_1E59C70E0;
  v13[4] = self;
  v14 = v6;
  v12 = v6;
  objc_msgSend(v7, "loadEntriesWithGameDescriptor:fetchOptions:playerScope:timeScope:range:completionHandler:", v9, 1, v10, v11, a3, 100, v13);

}

void __77__GKLeaderboardScoreDataSource_loadMoreDataWithStartIndex_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v9 = a5;
  objc_msgSend(*(id *)(a1 + 32), "setLocalPlayerEntry:", a2);
  if (!objc_msgSend(*(id *)(a1 + 32), "playerScope"))
    objc_msgSend(*(id *)(a1 + 32), "setMaxRange:", a4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "leaderboardScoreDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "leaderboardScoreDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "didLoadAdditionalScoresWithUpdatedTotalEntries:", objc_msgSend(*(id *)(a1 + 32), "maxRange"));

  }
}

- (id)localPlayerEntryIndexPath
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  -[GKLeaderboardScoreDataSource localPlayerEntry](self, "localPlayerEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rank");

  if (v4 < 1)
  {
    v9 = 0;
  }
  else
  {
    -[GKLeaderboardScoreDataSource localPlayerEntry](self, "localPlayerEntry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "rank");
    v7 = v6 - -[GKLeaderboardScoreDataSource startingRank](self, "startingRank");
    if (-[GKLeaderboardScoreDataSource startingRank](self, "startingRank") <= 1)
      v8 = v7;
    else
      v8 = v7 + 1;

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)indexPathForPlayerId:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  GKLeaderboardScoreDataSource *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[GKLeaderboardScoreDataSource entries](self, "entries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v20 = self;
    v8 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v10, "player");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "internal");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "playerID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v4);

        if ((v14 & 1) != 0)
        {
          v16 = objc_msgSend(v10, "rank");
          v17 = v16 - -[GKLeaderboardScoreDataSource startingRank](v20, "startingRank");
          if (-[GKLeaderboardScoreDataSource startingRank](v20, "startingRank") <= 1)
            v18 = v17;
          else
            v18 = v17 + 1;
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v18, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v7)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_14:

  return v15;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int64_t v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  int64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int64_t v32;
  int64_t v33;
  id v34;
  _QWORD v35[4];
  id v36;
  GKLeaderboardScoreDataSource *v37;
  id v38;
  id v39;
  int64_t v40;
  _QWORD v41[4];
  id v42;
  GKLeaderboardScoreDataSource *v43;
  id v44;
  id v45;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[GKLeaderboardScoreDataSource isLoadingData](self, "isLoadingData"))
    goto LABEL_15;
  -[GKLeaderboardScoreDataSource localPlayerEntryIndexPath](self, "localPlayerEntryIndexPath");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[GKLeaderboardScoreDataSource localPlayerEntryIndexPath](self, "localPlayerEntryIndexPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "compare:", v10);

    if (!v14)
    {
      -[GKLeaderboardScoreDataSource leaderboardScoreDelegate](self, "leaderboardScoreDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setPreferredFocusCell:", v9);

    }
  }
  if (!-[GKLeaderboardScoreDataSource isLoadingNextData](self, "isLoadingNextData"))
  {
    v16 = -[GKLeaderboardScoreDataSource startingRank](self, "startingRank");
    -[GKLeaderboardScoreDataSource entries](self, "entries");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = v16 + objc_msgSend(v17, "count") - 1;
    if (v18 >= -[GKLeaderboardScoreDataSource maxRange](self, "maxRange"))
    {
LABEL_9:

      goto LABEL_10;
    }
    v19 = objc_msgSend(v10, "item");
    v20 = -[GKLeaderboardScoreDataSource bottomLoadingCellItem](self, "bottomLoadingCellItem") - 25;

    if (v19 >= v20)
    {
      -[GKLeaderboardScoreDataSource setIsLoadingNextData:](self, "setIsLoadingNextData:", 1);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "UUIDString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLeaderboardScoreDataSource setAdditionalNextDataLoadToken:](self, "setAdditionalNextDataLoadToken:", v22);

      -[GKLeaderboardScoreDataSource additionalNextDataLoadToken](self, "additionalNextDataLoadToken");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[GKLeaderboardScoreDataSource startingRank](self, "startingRank");
      -[GKLeaderboardScoreDataSource entries](self, "entries");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "count") + v24;

      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __82__GKLeaderboardScoreDataSource_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke;
      v41[3] = &unk_1E59C7130;
      v42 = v23;
      v43 = self;
      v44 = v8;
      v45 = v10;
      v17 = v23;
      -[GKLeaderboardScoreDataSource loadMoreDataWithStartIndex:completionHandler:](self, "loadMoreDataWithStartIndex:completionHandler:", v26, v41);

      goto LABEL_9;
    }
  }
LABEL_10:
  if (!-[GKLeaderboardScoreDataSource isLoadingPreviousData](self, "isLoadingPreviousData")
    && -[GKLeaderboardScoreDataSource startingRank](self, "startingRank") >= 2)
  {
    v27 = objc_msgSend(v10, "item");
    if (v27 >= -[GKLeaderboardScoreDataSource topLoadingCellItem](self, "topLoadingCellItem"))
    {
      v28 = objc_msgSend(v10, "item");
      if (v28 <= -[GKLeaderboardScoreDataSource topLoadingCellItem](self, "topLoadingCellItem") + 25)
      {
        -[GKLeaderboardScoreDataSource setIsLoadingPreviousData:](self, "setIsLoadingPreviousData:", 1);
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "UUIDString");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[GKLeaderboardScoreDataSource setAdditionalPreviousDataLoadToken:](self, "setAdditionalPreviousDataLoadToken:", v30);

        -[GKLeaderboardScoreDataSource additionalPreviousDataLoadToken](self, "additionalPreviousDataLoadToken");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = -[GKLeaderboardScoreDataSource startingRank](self, "startingRank");
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v33 = v32 - 100;
        v35[2] = __82__GKLeaderboardScoreDataSource_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke_106;
        v35[3] = &unk_1E59C7180;
        v36 = v31;
        v37 = self;
        v40 = v32 - 100;
        v38 = v8;
        v39 = v10;
        v34 = v31;
        -[GKLeaderboardScoreDataSource loadMoreDataWithStartIndex:completionHandler:](self, "loadMoreDataWithStartIndex:completionHandler:", v33, v35);

      }
    }
  }
LABEL_15:

}

void __82__GKLeaderboardScoreDataSource_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "additionalNextDataLoadToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = objc_msgSend(v4, "isEqualToString:", v5);

    if ((_DWORD)v4)
    {
      v6 = MEMORY[0x1E0C809B0];
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __82__GKLeaderboardScoreDataSource_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke_2;
      v9[3] = &unk_1E59C7108;
      v7 = *(void **)(a1 + 48);
      v9[4] = *(_QWORD *)(a1 + 40);
      v10 = v3;
      v11 = *(id *)(a1 + 56);
      v12 = *(id *)(a1 + 48);
      v8[0] = v6;
      v8[1] = 3221225472;
      v8[2] = __82__GKLeaderboardScoreDataSource_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke_104;
      v8[3] = &unk_1E59C4430;
      v8[4] = *(_QWORD *)(a1 + 40);
      objc_msgSend(v7, "performBatchUpdates:completion:", v9, v8);

    }
  }

}

void __82__GKLeaderboardScoreDataSource_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  NSObject **v2;
  NSObject *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = (NSObject **)MEMORY[0x1E0D25460];
  v3 = *MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
  {
    v4 = (id)GKOSLoggers();
    v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v3;
    objc_msgSend(v5, "entries");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 134217984;
    v29 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1AB361000, v6, OS_LOG_TYPE_INFO, "GKLeaderboardScoreDataSource: performing batch update after fetching more data, previous entry count: %ld", (uint8_t *)&v28, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "entries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  objc_msgSend(*(id *)(a1 + 32), "entries");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayByAddingObjectsFromArray:", *(_QWORD *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setEntries:", v11);

  v12 = *v2;
  if (!*v2)
  {
    v13 = (id)GKOSLoggers();
    v12 = *v2;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v14 = *(void **)(a1 + 32);
    v15 = v12;
    objc_msgSend(v14, "entries");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    v28 = 134217984;
    v29 = v17;
    _os_log_impl(&dword_1AB361000, v15, OS_LOG_TYPE_INFO, "GKLeaderboardScoreDataSource: performing batch update after fetching more data, updated entry count: %ld", (uint8_t *)&v28, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "entries");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count") - v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(*(id *)(a1 + 32), "startingRank");
  objc_msgSend(*(id *)(a1 + 32), "entries");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v21 + objc_msgSend(v22, "count") - 1;
  if (v23 == objc_msgSend(*(id *)(a1 + 32), "maxRange"))
  {
    v24 = objc_msgSend(*(id *)(a1 + 32), "bottomLoadingCellItem") != -1;

    v19 -= v24;
  }
  else
  {

  }
  if (v19 >= 1)
  {
    do
    {
      if (objc_msgSend(*(id *)(a1 + 32), "startingRank") <= 1)
        v25 = v9;
      else
        v25 = v9 + 1;
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v25, objc_msgSend(*(id *)(a1 + 48), "section"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v26);

      ++v9;
      --v19;
    }
    while (v19);
  }
  objc_msgSend(*(id *)(a1 + 56), "collectionViewLayout");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setIsInsertingItemsAbove:", 0);

  objc_msgSend(*(id *)(a1 + 56), "insertItemsAtIndexPaths:", v20);
  objc_msgSend(*(id *)(a1 + 32), "setIsLoadingNextData:", 0);

}

uint64_t __82__GKLeaderboardScoreDataSource_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke_104(uint64_t a1)
{
  NSObject **v2;
  NSObject *v3;
  id v4;
  uint8_t v6[16];

  v2 = (NSObject **)MEMORY[0x1E0D25460];
  v3 = *MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
  {
    v4 = (id)GKOSLoggers();
    v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AB361000, v3, OS_LOG_TYPE_INFO, "GKLeaderboardScoreDataSource: performing batch update completed for load more action.", v6, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "setFirstLoad:", 0);
}

void __82__GKLeaderboardScoreDataSource_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke_106(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "additionalPreviousDataLoadToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = objc_msgSend(v4, "isEqualToString:", v5);

    if ((_DWORD)v4)
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      objc_msgSend(*(id *)(a1 + 40), "entries");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      objc_msgSend(*(id *)(a1 + 40), "setStartingRank:", *(_QWORD *)(a1 + 64));
      objc_msgSend(*(id *)(a1 + 48), "collectionViewLayout");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = MEMORY[0x1E0C809B0];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __82__GKLeaderboardScoreDataSource_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke_2_108;
      v16[3] = &unk_1E59C7158;
      v10 = *(void **)(a1 + 48);
      v16[4] = *(_QWORD *)(a1 + 40);
      v17 = v3;
      v21 = v7;
      v18 = *(id *)(a1 + 56);
      v19 = v8;
      v20 = *(id *)(a1 + 48);
      v13[0] = v9;
      v13[1] = 3221225472;
      v13[2] = __82__GKLeaderboardScoreDataSource_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke_109;
      v13[3] = &unk_1E59C5AC8;
      v11 = *(void **)(a1 + 48);
      v13[4] = *(_QWORD *)(a1 + 40);
      v14 = v19;
      v15 = v11;
      v12 = v19;
      objc_msgSend(v10, "performBatchUpdates:completion:", v16, v13);

    }
  }

}

void __82__GKLeaderboardScoreDataSource_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke_2_108(uint64_t a1)
{
  NSObject **v2;
  NSObject *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (NSObject **)MEMORY[0x1E0D25460];
  v3 = *MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
  {
    v4 = (id)GKOSLoggers();
    v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v3;
    objc_msgSend(v5, "entries");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 134217984;
    v23 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1AB361000, v6, OS_LOG_TYPE_INFO, "GKLeaderboardScoreDataSource: performing batch update after fetching previous data, previous entry count: %ld", (uint8_t *)&v22, 0xCu);

  }
  v8 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "entries");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setEntries:", v10);

  v11 = *v2;
  if (!*v2)
  {
    v12 = (id)GKOSLoggers();
    v11 = *v2;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v13 = *(void **)(a1 + 32);
    v14 = v11;
    objc_msgSend(v13, "entries");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");
    v22 = 134217984;
    v23 = v16;
    _os_log_impl(&dword_1AB361000, v14, OS_LOG_TYPE_INFO, "GKLeaderboardScoreDataSource: performing batch update after fetching previous data, updated entry count: %ld", (uint8_t *)&v22, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "entries");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count") - *(_QWORD *)(a1 + 72);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "startingRank") == 1)
    v18 -= objc_msgSend(*(id *)(a1 + 32), "topLoadingCellItem") != -1;
  if (v18 >= 1)
  {
    v20 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", ++v20, objc_msgSend(*(id *)(a1 + 48), "section"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v21);

    }
    while (v18 != v20);
  }
  objc_msgSend(*(id *)(a1 + 56), "setIsInsertingItemsAbove:", 1);
  objc_msgSend(*(id *)(a1 + 56), "collectionViewContentSize");
  objc_msgSend(*(id *)(a1 + 56), "setContentSizeBeforeInsertingItemsAbove:");
  objc_msgSend(*(id *)(a1 + 64), "insertItemsAtIndexPaths:", v19);

}

void __82__GKLeaderboardScoreDataSource_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke_109(uint64_t a1)
{
  NSObject **v2;
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = (NSObject **)MEMORY[0x1E0D25460];
  v3 = *MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
  {
    v4 = (id)GKOSLoggers();
    v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1AB361000, v3, OS_LOG_TYPE_INFO, "GKLeaderboardScoreDataSource: performing batch update completed for load previous data.", v9, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "setIsLoadingPreviousData:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setIsInsertingItemsAbove:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setFirstLoad:", 0);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  if (objc_msgSend(*(id *)(a1 + 32), "firstLoad"))
  {
    objc_msgSend(*(id *)(a1 + 32), "localPlayerEntryIndexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "localPlayerEntryIndexPath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "reloadItemsAtIndexPaths:", v8);

    }
  }
}

- (int64_t)itemCount
{
  void *v3;
  int64_t v4;
  int64_t v5;

  -[GKLeaderboardScoreDataSource setTopLoadingCellItem:](self, "setTopLoadingCellItem:", -1);
  -[GKLeaderboardScoreDataSource setBottomLoadingCellItem:](self, "setBottomLoadingCellItem:", -1);
  -[GKLeaderboardScoreDataSource setAddFriendCellItem:](self, "setAddFriendCellItem:", -1);
  -[GKLeaderboardScoreDataSource setNoFriendsCellItem:](self, "setNoFriendsCellItem:", -1);
  -[GKLeaderboardScoreDataSource entries](self, "entries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 < 1)
  {
    -[GKLeaderboardScoreDataSource setNoFriendsCellItem:](self, "setNoFriendsCellItem:", 0);
    return 1;
  }
  else
  {
    if (-[GKLeaderboardScoreDataSource startingRank](self, "startingRank") >= 2)
    {
      -[GKLeaderboardScoreDataSource setTopLoadingCellItem:](self, "setTopLoadingCellItem:", 0);
      ++v4;
    }
    v5 = -[GKLeaderboardScoreDataSource startingRank](self, "startingRank") + v4;
    if (v5 < -[GKLeaderboardScoreDataSource maxRange](self, "maxRange"))
    {
      -[GKLeaderboardScoreDataSource setBottomLoadingCellItem:](self, "setBottomLoadingCellItem:", v4);
      return ++v4;
    }
    if (-[GKLeaderboardScoreDataSource restrictToFriendsOnly](self, "restrictToFriendsOnly"))
    {
      -[GKLeaderboardScoreDataSource setAddFriendCellItem:](self, "setAddFriendCellItem:", v4);
      return ++v4;
    }
  }
  return v4;
}

- (int64_t)friendSuggestionsCount
{
  _BOOL4 showingAllFriendSuggestions;
  void *v3;
  unint64_t v4;
  int64_t v5;

  showingAllFriendSuggestions = self->_showingAllFriendSuggestions;
  -[GKLeaderboardScoreDataSource suggestedFriends](self, "suggestedFriends");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = 3;
  if (v4 < 3)
    v5 = v4;
  if (showingAllFriendSuggestions)
    return v4;
  else
    return v5;
}

- (BOOL)hasData
{
  void *v2;
  BOOL v3;

  -[GKLeaderboardScoreDataSource entries](self, "entries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)itemForIndexPath:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = -[GKLeaderboardScoreDataSource topLoadingCellItem](self, "topLoadingCellItem") != -1;
  v6 = objc_msgSend(v4, "item");

  v7 = v6 - v5;
  if (v7 < 0)
  {
    v10 = 0;
  }
  else
  {
    -[GKLeaderboardScoreDataSource entries](self, "entries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 >= (unint64_t)objc_msgSend(v8, "count"))
    {
      v10 = 0;
    }
    else
    {
      -[GKLeaderboardScoreDataSource entries](self, "entries");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v10;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int64_t v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  BOOL v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGSize result;

  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v8, "section"))
  {
    if (objc_msgSend(v8, "section") == 1)
    {
      objc_msgSend(v7, "bounds");
      +[GKDashboardFriendSuggestionCollectionViewCell sizeWithFitting:in:](_TtC12GameCenterUI45GKDashboardFriendSuggestionCollectionViewCell, "sizeWithFitting:in:", v7, v9, 0.0);
      v11 = v10;
      v13 = v12;
    }
    else
    {
      v11 = *MEMORY[0x1E0C9D820];
      v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
    goto LABEL_27;
  }
  objc_msgSend(v7, "frame");
  v11 = v14;
  v15 = -[GKLeaderboardScoreDataSource noFriendsCellItem](self, "noFriendsCellItem");
  v16 = objc_msgSend(v8, "item");
  v17 = -[GKLeaderboardScoreDataSource addFriendCellItem](self, "addFriendCellItem");
  v18 = objc_msgSend(v8, "item");
  objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "preferredContentSizeCategory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v20))
  {
    if ((objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0DC48F0]) & 1) != 0)
    {
      v13 = 72.0;
      goto LABEL_19;
    }
    v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0DC48F8]) == 0;
    v22 = 60.0;
    v23 = 72.0;
LABEL_16:
    if (v21)
      v13 = v22;
    else
      v13 = v23;
    goto LABEL_19;
  }
  if ((objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0DC48B8]) & 1) != 0)
  {
    v13 = 264.0;
    goto LABEL_19;
  }
  if ((objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0DC48C0]) & 1) != 0)
  {
    v13 = 234.0;
    goto LABEL_19;
  }
  if ((objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0DC48C8]) & 1) == 0)
  {
    v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0DC48D0]) == 0;
    v22 = 144.0;
    v23 = 174.0;
    goto LABEL_16;
  }
  v13 = 204.0;
LABEL_19:
  if (v15 == v16 || v17 == v18)
  {
    -[GKLeaderboardScoreDataSource sizingAddFriendsCell](self, "sizingAddFriendsCell");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v15 == v16)
      objc_msgSend(v24, "configureNoFriendsViewWithHandler:", &__block_literal_global_32);
    else
      objc_msgSend(v24, "configureAddFriendsLockupWithMetricsPageId:handler:", &stru_1E59EB978, &__block_literal_global_114_0);

    -[GKLeaderboardScoreDataSource sizingAddFriendsCell](self, "sizingAddFriendsCell");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "preferredLayoutSizeFittingSize:", v11, 1.79769313e308);
    v28 = v27;

    if (v13 < v28)
      v13 = v28;
  }

LABEL_27:
  v29 = v11;
  v30 = v13;
  result.height = v30;
  result.width = v29;
  return result;
}

- (double)cellSpacing
{
  return 0.0;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v4;
  int64_t v5;

  v4 = (void *)objc_msgSend(&unk_1E5A5EBD8, "mutableCopy", a3);
  if (-[GKLeaderboardScoreDataSource shouldDisplayFriendSuggestions](self, "shouldDisplayFriendSuggestions"))
    objc_msgSend(v4, "addObject:", &unk_1E5A5E088);
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  int64_t v7;

  v6 = a3;
  if (a4 == 1)
  {
    v7 = -[GKLeaderboardScoreDataSource friendSuggestionsCount](self, "friendSuggestionsCount") + 1;
  }
  else if (a4)
  {
    v7 = 0;
  }
  else
  {
    v7 = -[GKLeaderboardScoreDataSource itemCount](self, "itemCount");
  }

  return v7;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  id v31;
  GKLeaderboardScoreDataSource *v32;
  id v33;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *MEMORY[0x1E0DC48A8];
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC48A8]) && objc_msgSend(v10, "section") == 1)
  {
    objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v11, CFSTR("GKCollectionDataSourceHeader"), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    GKIsXRUIIdiomShouldUsePadUI();
    GKGameCenterUIFrameworkBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "titleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v14);

    objc_msgSend(v12, "leadingConstraint");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setConstant:", 12.0);

    objc_msgSend(v12, "trailingConstraint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setConstant:", 12.0);

    -[GKLeaderboardScoreDataSource suggestedFriends](self, "suggestedFriends");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v19 < 4)
    {
      objc_msgSend(v12, "secondaryLabel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setText:", 0);

      objc_msgSend(v12, "secondaryLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      v25 = 1;
    }
    else
    {
      -[GKLeaderboardScoreDataSource showingAllFriendSuggestions](self, "showingAllFriendSuggestions");
      GKGameCenterUIFrameworkBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "secondaryLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setText:", v21);

      objc_msgSend(v12, "secondaryLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      v25 = 0;
    }
    objc_msgSend(v23, "setHidden:", v25);

    objc_msgSend(v12, "secondaryLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setUserInteractionEnabled:", 1);

    objc_initWeak(&location, self);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __93__GKLeaderboardScoreDataSource_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke;
    v29[3] = &unk_1E59C71E8;
    objc_copyWeak(&v33, &location);
    v30 = v8;
    v31 = v10;
    v32 = self;
    objc_msgSend(v12, "setSecondaryLabelTapHandler:", v29);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __93__GKLeaderboardScoreDataSource_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = objc_msgSend(WeakRetained, "showingAllFriendSuggestions") ^ 1;
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "setShowingAllFriendSuggestions:", v4);

  v6 = *(void **)(a1 + 32);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
  objc_msgSend(v6, "reloadSections:", v7);

  objc_msgSend(*(id *)(a1 + 48), "leaderboardScoreDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didExpandOrContractFriendSuggestions");

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  int v29;
  _BOOL8 v30;
  uint64_t v32;
  __CFString *v33;
  __CFString *v34;
  void *v35;
  NSString *v36;
  _BOOL4 IsAccessibilityCategory;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  id location;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v7, "section"))
  {
    v10 = objc_msgSend(v7, "item");
    if (v10 == -[GKLeaderboardScoreDataSource bottomLoadingCellItem](self, "bottomLoadingCellItem")
      || (v11 = objc_msgSend(v7, "item"),
          v11 == -[GKLeaderboardScoreDataSource topLoadingCellItem](self, "topLoadingCellItem")))
    {
      objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("loadingCell"), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "activityIndicator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "startAnimating");

      goto LABEL_25;
    }
    v13 = objc_msgSend(v7, "item");
    if (v13 == -[GKLeaderboardScoreDataSource addFriendCellItem](self, "addFriendCellItem")
      || (v14 = objc_msgSend(v7, "item"),
          v14 == -[GKLeaderboardScoreDataSource noFriendsCellItem](self, "noFriendsCellItem")))
    {
      objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("addFriendsCell"), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setFriendCount:", -[GKLeaderboardScoreDataSource friendCount](self, "friendCount"));
      objc_initWeak(&location, self);
      v15 = objc_msgSend(v7, "item");
      if (v15 == -[GKLeaderboardScoreDataSource addFriendCellItem](self, "addFriendCellItem"))
      {
        -[GKLeaderboardScoreDataSource leaderboard](self, "leaderboard");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "baseLeaderboardID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = __70__GKLeaderboardScoreDataSource_collectionView_cellForItemAtIndexPath___block_invoke;
        v53[3] = &unk_1E59C48A0;
        v18 = &v54;
        objc_copyWeak(&v54, &location);
        objc_msgSend(v9, "configureAddFriendsLockupWithMetricsPageId:handler:", v17, v53);

      }
      else
      {
        v51[0] = MEMORY[0x1E0C809B0];
        v51[1] = 3221225472;
        v51[2] = __70__GKLeaderboardScoreDataSource_collectionView_cellForItemAtIndexPath___block_invoke_2;
        v51[3] = &unk_1E59C48A0;
        v18 = &v52;
        objc_copyWeak(&v52, &location);
        objc_msgSend(v9, "configureNoFriendsViewWithHandler:", v51);
      }
      objc_destroyWeak(v18);
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v7, "item") - 1, objc_msgSend(v7, "section"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLeaderboardScoreDataSource itemForIndexPath:](self, "itemForIndexPath:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v7, "item");
      v30 = 0;
      if (v27 != -[GKLeaderboardScoreDataSource noFriendsCellItem](self, "noFriendsCellItem"))
      {
        if (!v26
          || (objc_msgSend(v26, "player"),
              v28 = (void *)objc_claimAutoreleasedReturnValue(),
              v29 = objc_msgSend(v28, "isLocalPlayer"),
              v28,
              !v29))
        {
          v30 = 1;
        }
      }
      objc_msgSend(v9, "setLineVisible:", v30);

      objc_destroyWeak(&location);
      goto LABEL_25;
    }
    -[GKLeaderboardScoreDataSource itemForIndexPath:](self, "itemForIndexPath:", v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v21, "rank");
    v33 = CFSTR("lowRankCell");
    if (v32 > 99)
      v33 = CFSTR("highRankCell");
    v34 = v33;
    objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "preferredContentSizeCategory");
    v36 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v36);

    if (IsAccessibilityCategory)
    {

      v34 = CFSTR("AXCell");
    }
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v34, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKGameLayerCollectionDataSource presentationViewController](self, "presentationViewController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", v38);

    if (v21)
      objc_msgSend(v9, "setEntry:", v21);
    if (objc_msgSend(v7, "item") <= 0)
    {
      objc_msgSend(v9, "setLineVisible:", 0);
LABEL_42:
      -[GKLeaderboardScoreDataSource localPlayerFriendIDs](self, "localPlayerFriendIDs");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "player");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "internal");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "playerID");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setShouldShowContextMenu:", objc_msgSend(v44, "containsObject:", v47));

LABEL_17:
      goto LABEL_25;
    }
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v7, "item") - 1, objc_msgSend(v7, "section"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardScoreDataSource itemForIndexPath:](self, "itemForIndexPath:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "player");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v41, "isLocalPlayer"))
    {

LABEL_38:
      v43 = 0;
LABEL_41:
      objc_msgSend(v9, "setLineVisible:", v43);

      goto LABEL_42;
    }
    if (v40)
    {
      objc_msgSend(v40, "player");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v42, "isLocalPlayer");

      if ((v48 & 1) != 0)
        goto LABEL_38;
    }
    else
    {

    }
    v43 = 1;
    goto LABEL_41;
  }
  if (objc_msgSend(v7, "section") == 1)
  {
    v8 = objc_msgSend(v7, "item");
    if (v8 < -[GKLeaderboardScoreDataSource friendSuggestionsCount](self, "friendSuggestionsCount"))
    {
      objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("friendSuggestionCell"), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDisplayBackground:", 0);
      objc_msgSend(v9, "setWantsAdditionalHorizontalPadding:", 0);
      if (*MEMORY[0x1E0D253F8])
        objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setInviteButtonTitleColor:", v19);

      -[GKLeaderboardScoreDataSource suggestedFriends](self, "suggestedFriends");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndex:", objc_msgSend(v7, "item"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[GKLeaderboardScoreDataSource invitedFriendContactIdentifiers](self, "invitedFriendContactIdentifiers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "contact");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "applyWithSuggestedFriend:previouslyInvited:", v21, objc_msgSend(v22, "containsObject:", v24));

      objc_initWeak(&location, self);
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __70__GKLeaderboardScoreDataSource_collectionView_cellForItemAtIndexPath___block_invoke_3;
      v49[3] = &unk_1E59C4AA0;
      objc_copyWeak(&v50, &location);
      objc_msgSend(v9, "setTapHandler:", v49);
      objc_destroyWeak(&v50);
      objc_destroyWeak(&location);
      goto LABEL_17;
    }
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("inviteFriendButtonCell"), v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDisplayBackground:", 0);
    objc_msgSend(v9, "setWantsAdditionalHorizontalPadding:", 0);
  }
  else
  {
    v9 = 0;
  }
LABEL_25:

  return v9;
}

void __70__GKLeaderboardScoreDataSource_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  id v1;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 32));
  v1 = objc_loadWeakRetained(&to);
  objc_msgSend(v1, "presentFriendInvite");

  objc_destroyWeak(&to);
}

void __70__GKLeaderboardScoreDataSource_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  id v1;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 32));
  v1 = objc_loadWeakRetained(&to);
  objc_msgSend(v1, "presentFriendInvite");

  objc_destroyWeak(&to);
}

void __70__GKLeaderboardScoreDataSource_collectionView_cellForItemAtIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void (**v4)(_QWORD, _QWORD);
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "inviteFriendHandler");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v4)[2](v4, v3);

}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v6;
  int ShouldUsePadUI;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v6 = a3;
  if (a5 == 1)
  {
    ShouldUsePadUI = GKIsXRUIIdiomShouldUsePadUI();
    objc_msgSend(v6, "bounds");
    v9 = v8;
    if (ShouldUsePadUI)
      v10 = 50.0;
    else
      v10 = 30.0;
  }
  else
  {
    v9 = *MEMORY[0x1E0C9D820];
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v11 = v9;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  double v5;
  double v6;
  CGSize result;

  v5 = *MEMORY[0x1E0C9D820];
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v6;
  result.width = v5;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  int ShouldUsePadUI;
  double result;

  ShouldUsePadUI = GKIsXRUIIdiomShouldUsePadUI();
  result = 0.0;
  if (ShouldUsePadUI)
    return 2.0;
  return result;
}

- (void)handleSelectionInCollectionView:(id)a3 forItemAtIndexPath:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD);
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "section"))
  {
    if (objc_msgSend(v6, "section") == 1)
    {
      -[GKLeaderboardScoreDataSource inviteFriendHandler](self, "inviteFriendHandler");
      v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0);
LABEL_13:

    }
  }
  else
  {
    v8 = objc_msgSend(v6, "item");
    -[GKGameLayerCollectionDataSource presentationViewController](self, "presentationViewController");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (!v7
      || v8 == -[GKLeaderboardScoreDataSource topLoadingCellItem](self, "topLoadingCellItem")
      || v8 == -[GKLeaderboardScoreDataSource bottomLoadingCellItem](self, "bottomLoadingCellItem")
      || v8 == -[GKLeaderboardScoreDataSource addFriendCellItem](self, "addFriendCellItem"))
    {
      goto LABEL_13;
    }
    v9 = -[GKLeaderboardScoreDataSource noFriendsCellItem](self, "noFriendsCellItem");

    if (v8 != v9)
    {
      v10 = v8 - (-[GKLeaderboardScoreDataSource topLoadingCellItem](self, "topLoadingCellItem") != -1);
      if (v10 < 0
        || (-[GKLeaderboardScoreDataSource entries](self, "entries"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = objc_msgSend(v11, "count"),
            v11,
            v12 <= v10))
      {
        v13 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/GameCenterUIService/GKLeaderboardScoreDataSource.m");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lastPathComponent");
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ (index >= 0 && self.entries.count > index)\n[%s (%s:%d)]"), v14, "-[GKLeaderboardScoreDataSource handleSelectionInCollectionView:forItemAtIndexPath:]", objc_msgSend(v16, "UTF8String"), 963);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v17);
      }
      -[NSArray objectAtIndexedSubscript:](self->_entries, "objectAtIndexedSubscript:", v10);
      v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "player");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "internal");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "playerID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKGameLayerCollectionDataSource presentationViewController](self, "presentationViewController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[PlayerProfileViewController showProfileFor:from:completion:](_TtC12GameCenterUI27PlayerProfileViewController, "showProfileFor:from:completion:", v20, v21, 0);

      objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "reportEvent:type:", *MEMORY[0x1E0D25060], *MEMORY[0x1E0D24CE0]);

      goto LABEL_13;
    }
  }
  objc_msgSend(v23, "deselectItemAtIndexPath:animated:", v6, 1);

}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  id v5;

  -[GKLeaderboardScoreDataSource leaderboardScoreDelegate](self, "leaderboardScoreDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[GKLeaderboardScoreDataSource leaderboardScoreDelegate](self, "leaderboardScoreDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collectionViewDidScroll");

  }
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v8, "item");
  if (v9 == -[GKLeaderboardScoreDataSource topLoadingCellItem](self, "topLoadingCellItem")
    || v9 == -[GKLeaderboardScoreDataSource bottomLoadingCellItem](self, "bottomLoadingCellItem")
    || v9 == -[GKLeaderboardScoreDataSource addFriendCellItem](self, "addFriendCellItem")
    || v9 == -[GKLeaderboardScoreDataSource noFriendsCellItem](self, "noFriendsCellItem"))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v7, "cellForItemAtIndexPath:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0DC36B8];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __96__GKLeaderboardScoreDataSource_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke;
    v15[3] = &unk_1E59C7210;
    v15[4] = self;
    v16 = v8;
    v17 = v12;
    v14 = v12;
    objc_msgSend(v13, "configurationWithIdentifier:previewProvider:actionProvider:", v16, 0, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

id __96__GKLeaderboardScoreDataSource_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "itemForIndexPath:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_gkScore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "makeContextMenuForCell:withScore:", *(_QWORD *)(a1 + 48), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  objc_msgSend(a5, "setPreferredCommitStyle:", 0, a4);
}

- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  return -[GKLeaderboardScoreDataSource targetedPreviewForUIContextMenuConfiguration:inCollectionView:](self, "targetedPreviewForUIContextMenuConfiguration:inCollectionView:", a4, a3);
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  return -[GKLeaderboardScoreDataSource targetedPreviewForUIContextMenuConfiguration:inCollectionView:](self, "targetedPreviewForUIContextMenuConfiguration:inCollectionView:", a4, a3);
}

- (id)targetedPreviewForUIContextMenuConfiguration:(id)a3 inCollectionView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a4;
  objc_msgSend(a3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForItemAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v9);

  v10 = objc_alloc(MEMORY[0x1E0DC3B88]);
  objc_msgSend(v7, "center");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v7, "superview");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertPoint:fromView:", v15, v12, v14);
  v16 = (void *)objc_msgSend(v10, "initWithContainer:center:", v5);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:target:", v7, v8, v16);
  return v17;
}

- (id)makeContextMenuForCell:(id)a3 withScore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void **v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  void *v41;
  _QWORD v42[3];

  v42[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D252C0], "currentGame");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "internal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "supportsChallenges");
  v10 = MEMORY[0x1E0C809B0];
  if ((v9 & 1) != 0)
  {
    objc_msgSend(v5, "entry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "player");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isLocalPlayer");

    if ((v13 & 1) == 0)
    {
      v14 = (void *)MEMORY[0x1E0DC3428];
      GKGameCenterUIFrameworkBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v10;
      v38[1] = 3221225472;
      v38[2] = __65__GKLeaderboardScoreDataSource_makeContextMenuForCell_withScore___block_invoke;
      v38[3] = &unk_1E59C7238;
      v39 = v5;
      v40 = v6;
      objc_msgSend(v14, "actionWithTitle:image:identifier:handler:", v16, 0, 0, v38);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
  }
  else
  {

  }
  v17 = 0;
LABEL_6:
  v18 = (void *)MEMORY[0x1E0DC3428];
  GKGameCenterUIFrameworkBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.up"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v10;
  v33 = 3221225472;
  v34 = __65__GKLeaderboardScoreDataSource_makeContextMenuForCell_withScore___block_invoke_2;
  v35 = &unk_1E59C7238;
  v22 = v5;
  v36 = v22;
  v23 = v6;
  v37 = v23;
  objc_msgSend(v18, "actionWithTitle:image:identifier:handler:", v20, v21, 0, &v32);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x1E0DC39D0];
  if (v17)
  {
    v42[0] = v24;
    v42[1] = v17;
    v26 = (void *)MEMORY[0x1E0C99D20];
    v27 = (void **)v42;
    v28 = 2;
  }
  else
  {
    v41 = v24;
    v26 = (void *)MEMORY[0x1E0C99D20];
    v27 = &v41;
    v28 = 1;
  }
  objc_msgSend(v26, "arrayWithObjects:count:", v27, v28, v32, v33, v34, v35);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "menuWithTitle:children:", &stru_1E59EB978, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

void __65__GKLeaderboardScoreDataSource_makeContextMenuForCell_withScore___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "challengeWithScore:", *(_QWORD *)(a1 + 40));

  objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reportEvent:type:", *MEMORY[0x1E0D25060], *MEMORY[0x1E0D24CD8]);

}

void __65__GKLeaderboardScoreDataSource_makeContextMenuForCell_withScore___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shareWithScore:fromView:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reportEvent:type:", *MEMORY[0x1E0D25060], *MEMORY[0x1E0D24CE8]);

}

- (void)presentFriendInvite
{
  _QWORD v2[5];
  _QWORD v3[5];

  if (*MEMORY[0x1E0D253F8])
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __51__GKLeaderboardScoreDataSource_presentFriendInvite__block_invoke_2;
    v2[3] = &unk_1E59C58E0;
    v2[4] = self;
    +[FriendRequestFacilitator makeViewControllerWithRecipients:chatGUID:completionHandler:](_TtC12GameCenterUI24FriendRequestFacilitator, "makeViewControllerWithRecipients:chatGUID:completionHandler:", MEMORY[0x1E0C9AA60], 0, v2);
  }
  else
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __51__GKLeaderboardScoreDataSource_presentFriendInvite__block_invoke;
    v3[3] = &unk_1E59C7260;
    v3[4] = self;
    +[FriendRequestFacilitator makeViewControllerForRemoteInviteWithRecipients:chatGUID:resultHandler:](_TtC12GameCenterUI24FriendRequestFacilitator, "makeViewControllerForRemoteInviteWithRecipients:chatGUID:resultHandler:", MEMORY[0x1E0C9AA60], 0, v3);
  }
}

void __51__GKLeaderboardScoreDataSource_presentFriendInvite__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
    v6 = v10;
  else
    v6 = v5;
  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    v8 = v6;
    objc_msgSend(v7, "presentationViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presentViewController:animated:completion:", v8, 1, 0);

  }
}

void __51__GKLeaderboardScoreDataSource_presentFriendInvite__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "presentationViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentViewController:animated:completion:", v3, 1, 0);

}

- (id)addInvitedFriendContactIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, uint64_t, _BYTE *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  if (!v4)
    goto LABEL_8;
  -[GKLeaderboardScoreDataSource invitedFriendContactIdentifiers](self, "invitedFriendContactIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) != 0)
    goto LABEL_8;
  -[GKLeaderboardScoreDataSource invitedFriendContactIdentifiers](self, "invitedFriendContactIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = -1;
  -[GKLeaderboardScoreDataSource suggestedFriends](self, "suggestedFriends");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __66__GKLeaderboardScoreDataSource_addInvitedFriendContactIdentifier___block_invoke;
  v14 = &unk_1E59C7288;
  v15 = v4;
  v16 = &v17;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v11);

  if (v18[3] == -1
    || !-[GKLeaderboardScoreDataSource shouldDisplayFriendSuggestions](self, "shouldDisplayFriendSuggestions", v11, v12, v13, v14))
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v18[3], 1);
    self = (GKLeaderboardScoreDataSource *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
  }

  _Block_object_dispose(&v17, 8);
  if ((v9 & 1) != 0)
LABEL_8:
    self = 0;

  return self;
}

void __66__GKLeaderboardScoreDataSource_addInvitedFriendContactIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;

  objc_msgSend(a2, "contact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
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

- (BOOL)restrictToFriendsOnly
{
  return self->_restrictToFriendsOnly;
}

- (void)setRestrictToFriendsOnly:(BOOL)a3
{
  self->_restrictToFriendsOnly = a3;
}

- (int64_t)leaderboardOccurrence
{
  return self->_leaderboardOccurrence;
}

- (void)setLeaderboardOccurrence:(int64_t)a3
{
  self->_leaderboardOccurrence = a3;
}

- (GKLeaderboardScoreDelegate)leaderboardScoreDelegate
{
  return (GKLeaderboardScoreDelegate *)objc_loadWeakRetained((id *)&self->_leaderboardScoreDelegate);
}

- (void)setLeaderboardScoreDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_leaderboardScoreDelegate, a3);
}

- (int64_t)startingRank
{
  return self->_startingRank;
}

- (void)setStartingRank:(int64_t)a3
{
  self->_startingRank = a3;
}

- (BOOL)autoScrollToLocalPlayerPosition
{
  return self->_autoScrollToLocalPlayerPosition;
}

- (void)setAutoScrollToLocalPlayerPosition:(BOOL)a3
{
  self->_autoScrollToLocalPlayerPosition = a3;
}

- (id)inviteFriendHandler
{
  return self->_inviteFriendHandler;
}

- (void)setInviteFriendHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
  objc_storeStrong((id *)&self->_entries, a3);
}

- (BOOL)isLoadingData
{
  return self->_isLoadingData;
}

- (void)setIsLoadingData:(BOOL)a3
{
  self->_isLoadingData = a3;
}

- (BOOL)isLoadingNextData
{
  return self->_isLoadingNextData;
}

- (void)setIsLoadingNextData:(BOOL)a3
{
  self->_isLoadingNextData = a3;
}

- (BOOL)isLoadingPreviousData
{
  return self->_isLoadingPreviousData;
}

- (void)setIsLoadingPreviousData:(BOOL)a3
{
  self->_isLoadingPreviousData = a3;
}

- (NSString)additionalNextDataLoadToken
{
  return self->_additionalNextDataLoadToken;
}

- (void)setAdditionalNextDataLoadToken:(id)a3
{
  objc_storeStrong((id *)&self->_additionalNextDataLoadToken, a3);
}

- (NSString)additionalPreviousDataLoadToken
{
  return self->_additionalPreviousDataLoadToken;
}

- (void)setAdditionalPreviousDataLoadToken:(id)a3
{
  objc_storeStrong((id *)&self->_additionalPreviousDataLoadToken, a3);
}

- (int64_t)topLoadingCellItem
{
  return self->_topLoadingCellItem;
}

- (void)setTopLoadingCellItem:(int64_t)a3
{
  self->_topLoadingCellItem = a3;
}

- (int64_t)bottomLoadingCellItem
{
  return self->_bottomLoadingCellItem;
}

- (void)setBottomLoadingCellItem:(int64_t)a3
{
  self->_bottomLoadingCellItem = a3;
}

- (int64_t)addFriendCellItem
{
  return self->_addFriendCellItem;
}

- (void)setAddFriendCellItem:(int64_t)a3
{
  self->_addFriendCellItem = a3;
}

- (int64_t)noFriendsCellItem
{
  return self->_noFriendsCellItem;
}

- (void)setNoFriendsCellItem:(int64_t)a3
{
  self->_noFriendsCellItem = a3;
}

- (int64_t)maxRange
{
  return self->_maxRange;
}

- (void)setMaxRange:(int64_t)a3
{
  self->_maxRange = a3;
}

- (GKLeaderboardEntry)localPlayerEntry
{
  return self->_localPlayerEntry;
}

- (void)setLocalPlayerEntry:(id)a3
{
  objc_storeStrong((id *)&self->_localPlayerEntry, a3);
}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (void)setCollectionView:(id)a3
{
  objc_storeWeak((id *)&self->_collectionView, a3);
}

- (int64_t)friendCount
{
  return self->_friendCount;
}

- (void)setFriendCount:(int64_t)a3
{
  self->_friendCount = a3;
}

- (BOOL)firstLoad
{
  return self->_firstLoad;
}

- (void)setFirstLoad:(BOOL)a3
{
  self->_firstLoad = a3;
}

- (NSSet)localPlayerFriendIDs
{
  return self->_localPlayerFriendIDs;
}

- (void)setLocalPlayerFriendIDs:(id)a3
{
  objc_storeStrong((id *)&self->_localPlayerFriendIDs, a3);
}

- (GKLeaderboardAddFriendsCell)sizingAddFriendsCell
{
  return self->_sizingAddFriendsCell;
}

- (void)setSizingAddFriendsCell:(id)a3
{
  objc_storeStrong((id *)&self->_sizingAddFriendsCell, a3);
}

- (BOOL)shouldDisplayFriendSuggestions
{
  return self->_shouldDisplayFriendSuggestions;
}

- (void)setShouldDisplayFriendSuggestions:(BOOL)a3
{
  self->_shouldDisplayFriendSuggestions = a3;
}

- (NSArray)suggestedFriends
{
  return self->_suggestedFriends;
}

- (void)setSuggestedFriends:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedFriends, a3);
}

- (BOOL)showingAllFriendSuggestions
{
  return self->_showingAllFriendSuggestions;
}

- (void)setShowingAllFriendSuggestions:(BOOL)a3
{
  self->_showingAllFriendSuggestions = a3;
}

- (NSMutableSet)invitedFriendContactIdentifiers
{
  return self->_invitedFriendContactIdentifiers;
}

- (void)setInvitedFriendContactIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_invitedFriendContactIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitedFriendContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_suggestedFriends, 0);
  objc_storeStrong((id *)&self->_sizingAddFriendsCell, 0);
  objc_storeStrong((id *)&self->_localPlayerFriendIDs, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_storeStrong((id *)&self->_localPlayerEntry, 0);
  objc_storeStrong((id *)&self->_additionalPreviousDataLoadToken, 0);
  objc_storeStrong((id *)&self->_additionalNextDataLoadToken, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong(&self->_inviteFriendHandler, 0);
  objc_destroyWeak((id *)&self->_leaderboardScoreDelegate);
  objc_storeStrong((id *)&self->_leaderboard, 0);
}

void __62__GKLeaderboardScoreDataSource_loadDataWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AB361000, a2, OS_LOG_TYPE_ERROR, "cannot load local player's friends due to: %@", (uint8_t *)&v2, 0xCu);
}

@end
