@implementation GKDashboardChallengePlayerPickerDataSource

- (GKDashboardChallengePlayerPickerDataSource)initWithChallenge:(id)a3
{
  id v4;
  GKDashboardChallengePlayerPickerDataSource *v5;
  GKDashboardChallengePlayerPickerDataSource *v6;
  id v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKDashboardChallengePlayerPickerDataSource;
  v5 = -[GKCollectionDataSource init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[GKDashboardChallengePlayerPickerDataSource setChallenge:](v5, "setChallenge:", v4);
    -[GKCollectionDataSource setUseStandardHeaders:](v6, "setUseStandardHeaders:", 1);
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[GKDashboardChallengePlayerPickerDataSource setInvitedFriendContactIdentifiers:](v6, "setInvitedFriendContactIdentifiers:", v7);

  }
  return v6;
}

- (void)setupCollectionView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKDashboardChallengePlayerPickerDataSource;
  v3 = a3;
  -[GKCollectionDataSource setupCollectionView:](&v6, sel_setupCollectionView_, v3);
  +[NSObject _gkNib](GKChallengeListViewSectionHeader, "_gkNib", v6.receiver, v6.super_class);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerNib:forSupplementaryViewOfKind:withReuseIdentifier:", v4, *MEMORY[0x1E0DC48A8], CFSTR("GKCollectionDataSourceHeader"));
  +[NSObject _gkNib](GKChallengePlayerPickerCell, "_gkNib");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerNib:forCellWithReuseIdentifier:", v5, CFSTR("friendCell"));
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("friendSuggestionCell"));
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("inviteFriendButtonCell"));
  objc_msgSend(v3, "setAllowsMultipleSelection:", 1);

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
  _QWORD *v13;
  _QWORD *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  id v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[3];
  char v23;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKDashboardChallengePlayerPickerDataSource.m", 122, "-[GKDashboardChallengePlayerPickerDataSource loadDataWithCompletionHandler:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dispatchGroupWithName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__1;
  v20[4] = __Block_byref_object_dispose__1;
  v21 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke;
  v16[3] = &unk_1E59C4A00;
  v18 = v20;
  v19 = v22;
  v16[4] = self;
  v9 = v7;
  v17 = v9;
  objc_msgSend(v9, "perform:", v16);
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_43;
  v15[3] = &unk_1E59C4A28;
  v15[4] = self;
  objc_msgSend(v9, "perform:", v15);
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_46;
  v11[3] = &unk_1E59C4A50;
  v10 = v4;
  v12 = v10;
  v13 = v22;
  v14 = v20;
  objc_msgSend(v9, "notifyOnMainQueueWithBlock:", v11);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);

}

void __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  __int128 v10;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E59C49D8;
  v5 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v7[1] = 3221225472;
  v10 = *(_OWORD *)(a1 + 48);
  v8 = v5;
  v9 = v3;
  v6 = v3;
  objc_msgSend(v4, "loadChallengableFriendsWithFetchOptions:completion:", 1, v7);

}

void __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v32 = a1;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  v7 = objc_msgSend(v5, "count");
  if (!v6 || v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "setPlayers:", v5, v6, v5);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v9 = *(id *)(*(_QWORD *)(a1 + 32) + 80);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v40 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          v15 = *(void **)(*(_QWORD *)(v32 + 32) + 88);
          objc_msgSend(v14, "referenceKey");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
            v17 = &unk_1E5A5DCC8;
          objc_msgSend(v14, "referenceKey");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, v18);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v11);
    }

    objc_msgSend(*(id *)(v32 + 32), "setPlayerStates:", v8);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v32 + 64) + 8) + 24) = 1;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(v32 + 32) + 72), "achievement");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_alloc(MEMORY[0x1E0D252C0]);
      objc_msgSend(*(id *)(*(_QWORD *)(v32 + 32) + 72), "internal");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "game");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v21, "initWithInternalRepresentation:", v23);

      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_33;
      v33[3] = &unk_1E59C49B0;
      v34 = v24;
      v35 = v19;
      v25 = *(_QWORD *)(v32 + 56);
      v37 = v20;
      v38 = v25;
      v26 = *(void **)(v32 + 40);
      v36 = *(_QWORD *)(v32 + 32);
      v27 = v20;
      v28 = v19;
      v29 = v24;
      objc_msgSend(v26, "perform:", v33);

    }
    v6 = v30;
    v5 = v31;
  }
  (*(void (**)(void))(*(_QWORD *)(v32 + 48) + 16))();

}

void __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_33(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_34;
  v11[3] = &unk_1E59C4988;
  v16 = *(_QWORD *)(a1 + 64);
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(void **)(a1 + 56);
  v12 = v7;
  v13 = v8;
  v14 = v9;
  v15 = v3;
  v10 = v3;
  objc_msgSend(v4, "getGameMatchesForAchievement:handler:", v6, v11);

}

void __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_34(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v12), "player");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  v14 = (void *)MEMORY[0x1E0D25240];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_3;
  v17[3] = &unk_1E59C4960;
  v21 = *(_QWORD *)(a1 + 64);
  v15 = *(_QWORD *)(a1 + 32);
  v17[4] = *(_QWORD *)(a1 + 40);
  v18 = v8;
  v19 = *(id *)(a1 + 48);
  v20 = *(id *)(a1 + 56);
  v16 = v8;
  objc_msgSend(v14, "loadAchievementsForGameV2:players:includeUnreported:includeHidden:withCompletionHandler:", v15, v7, 0, 0, v17);

}

void __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;

  v12 = a2;
  v5 = a3;
  if (v5)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count", v12));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPlayerAchievementDates:", v6);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_4;
  v14[3] = &unk_1E59C4938;
  v9 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 32);
  v15 = v9;
  v16 = v10;
  v17 = v8;
  v11 = v8;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v14);
  objc_msgSend(v7, "removeObjectsInArray:", v11);
  objc_msgSend(v7, "addObjectsFromArray:", v11);
  objc_msgSend(*(id *)(a1 + 32), "setPlayers:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_5;
  v8[3] = &unk_1E59C4910;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v9 = v5;
  v10 = v6;
  v11 = v7;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v8);

}

void __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  if (objc_msgSend(v14, "isCompleted"))
  {
    objc_msgSend(v14, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if (v4)
    {
      v5 = *(void **)(*(_QWORD *)(a1 + 40) + 80);
      objc_msgSend(v14, "player");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "indexOfObject:", v6);

      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "objectAtIndexedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lastReportedDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(void **)(*(_QWORD *)(a1 + 40) + 96);
        objc_msgSend(v8, "referenceKey");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

        if ((objc_msgSend(v14, "isReplayable") & 1) == 0)
        {
          v12 = *(void **)(*(_QWORD *)(a1 + 40) + 88);
          objc_msgSend(v8, "referenceKey");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E5A5DCE0, v13);

          objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);
        }

      }
    }
  }

}

void __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_43(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_45;
  v5[3] = &unk_1E59C46B8;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  +[GameCenterObjcHelper fetchSuggestedFriendsWithCompletionHandler:](_TtC12GameCenterUI20GameCenterObjcHelper, "fetchSuggestedFriendsWithCompletionHandler:", v5);

}

void __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_45(uint64_t a1, void *a2, void *a3)
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
      _os_log_impl(&dword_1AB361000, v8, OS_LOG_TYPE_INFO, "GKDashboardChallengePlayerPickerDataSource: Unable to fetch suggested friends: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setSuggestedFriends:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __76__GKDashboardChallengePlayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_46(_QWORD *a1)
{
  uint64_t result;

  result = a1[4];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  return result;
}

- (id)currentPlayers
{
  void *v3;
  uint64_t v4;
  int *v5;
  id v6;

  -[GKCollectionDataSource searchText](self, "searchText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  v5 = &OBJC_IVAR___GKDashboardChallengePlayerPickerDataSource__searchPlayers;
  if (!v4)
    v5 = &OBJC_IVAR___GKDashboardChallengePlayerPickerDataSource__players;
  v6 = *(id *)((char *)&self->super.super.isa + *v5);

  return v6;
}

- (int64_t)itemCount
{
  void *v2;
  int64_t v3;

  -[GKDashboardChallengePlayerPickerDataSource currentPlayers](self, "currentPlayers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (int64_t)friendSuggestionsCount
{
  _BOOL4 showingAllFriendSuggestions;
  void *v3;
  unint64_t v4;
  int64_t v5;

  showingAllFriendSuggestions = self->_showingAllFriendSuggestions;
  -[GKDashboardChallengePlayerPickerDataSource suggestedFriends](self, "suggestedFriends");
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

- (double)preferredCollectionHeight
{
  double result;

  +[GKDashboardPlayerCell preferredCollectionHeight](GKDashboardPlayerPickerCell, "preferredCollectionHeight");
  return result;
}

- (id)playerForIndexPath:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;

  v4 = objc_msgSend(a3, "item");
  -[GKDashboardChallengePlayerPickerDataSource currentPlayers](self, "currentPlayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") <= v4)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (NSArray)selectedPlayers
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSMutableDictionary *playerStates;
  void *v10;
  void *v11;
  uint64_t v12;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = self->_players;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        playerStates = self->_playerStates;
        objc_msgSend(v8, "referenceKey");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](playerStates, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "integerValue");

        if (v12 == 1)
          objc_msgSend(v14, "addObject:", v8);
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  return (NSArray *)v14;
}

- (void)clearSelection
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allKeys](self->_playerStates, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_playerStates, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "integerValue");

        if (v10 == 1)
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_playerStates, "setObject:forKeyedSubscript:", &unk_1E5A5DCC8, v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (id)indexPathForPlayer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (a3)
  {
    v4 = a3;
    -[GKDashboardChallengePlayerPickerDataSource currentPlayers](self, "currentPlayers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "indexOfObject:", v4);

    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v6, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)searchKeyForSection:(int64_t)a3
{
  return CFSTR("searchName");
}

- (void)searchTextHasChanged
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;

  -[GKCollectionDataSource searchText](self, "searchText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v5 = -[NSArray count](self->_players, "count");
    if (v5 >= 1)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", i, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray objectAtIndexedSubscript:](self->_players, "objectAtIndexedSubscript:", objc_msgSend(v8, "item"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[GKCollectionDataSource searchMatchesItem:inSection:](self, "searchMatchesItem:inSection:", v9, 0))
          objc_msgSend(v10, "addObject:", v9);

      }
    }
    -[GKDashboardChallengePlayerPickerDataSource setSearchPlayers:](self, "setSearchPlayers:", v10);

  }
  else
  {
    -[GKDashboardChallengePlayerPickerDataSource setSearchPlayers:](self, "setSearchPlayers:", 0);
  }
}

- (id)addInvitedFriendContactIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  if (v4
    && (-[GKDashboardChallengePlayerPickerDataSource invitedFriendContactIdentifiers](self, "invitedFriendContactIdentifiers"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "containsObject:", v4), v5, (v6 & 1) == 0))
  {
    -[GKDashboardChallengePlayerPickerDataSource invitedFriendContactIdentifiers](self, "invitedFriendContactIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v4);

    -[GKDashboardChallengePlayerPickerDataSource suggestedFriends](self, "suggestedFriends");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __80__GKDashboardChallengePlayerPickerDataSource_addInvitedFriendContactIdentifier___block_invoke;
    v12[3] = &unk_1E59C4A78;
    v13 = v4;
    v10 = objc_msgSend(v9, "indexOfObjectPassingTest:", v12);

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __80__GKDashboardChallengePlayerPickerDataSource_addInvitedFriendContactIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v4;
  int64_t v5;

  v4 = (void *)objc_msgSend(&unk_1E5A5EB30, "mutableCopy", a3);
  if (-[GKDashboardChallengePlayerPickerDataSource showingFriendSuggestions](self, "showingFriendSuggestions"))
    objc_msgSend(v4, "addObject:", &unk_1E5A5DD10);
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
    v7 = -[GKDashboardChallengePlayerPickerDataSource friendSuggestionsCount](self, "friendSuggestionsCount") + 1;
  }
  else if (a4)
  {
    v7 = 0;
  }
  else
  {
    v7 = -[GKDashboardChallengePlayerPickerDataSource itemCount](self, "itemCount");
  }

  return v7;
}

- (id)headerTextForSection:(int64_t)a3
{
  void *v3;
  void *v4;

  if ((unint64_t)a3 > 1)
  {
    v4 = 0;
  }
  else
  {
    GKGameCenterUIFrameworkBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *playerStates;
  void *v17;
  void *v18;
  uint64_t v19;
  NSMutableDictionary *playerAchievementDates;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t, void *);
  void *v47;
  id v48;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "section"))
  {
    if (objc_msgSend(v7, "section") != 1)
    {
      v9 = 0;
      goto LABEL_13;
    }
    v8 = objc_msgSend(v7, "item");
    if (v8 >= -[GKDashboardChallengePlayerPickerDataSource friendSuggestionsCount](self, "friendSuggestionsCount"))
    {
      objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("inviteFriendButtonCell"), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "updateTextColorWith:", v11);
    }
    else
    {
      objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("friendSuggestionCell"), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKDashboardChallengePlayerPickerDataSource suggestedFriends](self, "suggestedFriends");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v7, "item"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[GKDashboardChallengePlayerPickerDataSource invitedFriendContactIdentifiers](self, "invitedFriendContactIdentifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "contact");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "applyWithSuggestedFriend:previouslyInvited:", v11, objc_msgSend(v12, "containsObject:", v14));

      objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setInviteButtonTitleColor:", v15);

      objc_initWeak(&location, self);
      v44 = MEMORY[0x1E0C809B0];
      v45 = 3221225472;
      v46 = __84__GKDashboardChallengePlayerPickerDataSource_collectionView_cellForItemAtIndexPath___block_invoke;
      v47 = &unk_1E59C4AA0;
      objc_copyWeak(&v48, &location);
      objc_msgSend(v9, "setTapHandler:", &v44);
      objc_destroyWeak(&v48);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("friendCell"), v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardChallengePlayerPickerDataSource playerForIndexPath:](self, "playerForIndexPath:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPlayer:", v11);
    playerStates = self->_playerStates;
    objc_msgSend(v11, "referenceKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](playerStates, "objectForKey:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "integerValue");

    objc_msgSend(v9, "setSelectable:", v19 != 2);
    objc_msgSend(v9, "setSelected:", v19 == 1);
    if ((objc_msgSend(v9, "isSelectable") & 1) == 0)
    {
      playerAchievementDates = self->_playerAchievementDates;
      objc_msgSend(v11, "referenceKey");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](playerAchievementDates, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        -[GKChallenge achievement](self->_challenge, "achievement");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setStatusWithAchievementEarnedPoints:andDate:", objc_msgSend(v23, "maximumPoints"), v22);

      }
    }
    objc_msgSend(v11, "internal");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "contact");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setShowsPlayerSubtitle:", v25 != 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.0700000003);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setBackgroundColor:", v26);

    objc_msgSend(v9, "setDefaultContentBackgroundColor:", v26);
  }

LABEL_13:
  v28 = -[GKDashboardChallengePlayerPickerDataSource itemCount](self, "itemCount", v44, v45, v46, v47);
  if (objc_msgSend(v7, "section") == 1)
    v28 = -[GKDashboardChallengePlayerPickerDataSource friendSuggestionsCount](self, "friendSuggestionsCount") + 1;
  if (objc_msgSend(v7, "item"))
  {
    v29 = objc_msgSend(v7, "item");
    objc_msgSend(v9, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v29 != v28 - 1)
    {
      objc_msgSend(v30, "setMaskedCorners:", 0);

      objc_msgSend(v9, "layer");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setMasksToBounds:", 0);

      objc_msgSend(v9, "layer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setCornerRadius:", 0.0);
      goto LABEL_21;
    }
    objc_msgSend(v30, "setMasksToBounds:", 1);

    v32 = *MEMORY[0x1E0CD2A68];
    objc_msgSend(v9, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setCornerCurve:", v32);

    objc_msgSend(v9, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setCornerRadius:", 10.0);

    objc_msgSend(v9, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    v37 = 12;
  }
  else
  {
    objc_msgSend(v9, "layer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setMasksToBounds:", 1);

    v39 = *MEMORY[0x1E0CD2A68];
    objc_msgSend(v9, "layer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setCornerCurve:", v39);

    objc_msgSend(v9, "layer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setCornerRadius:", 10.0);

    objc_msgSend(v9, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    v37 = 3;
  }
  objc_msgSend(v35, "setMaskedCorners:", v37);
LABEL_21:

  return v9;
}

void __84__GKDashboardChallengePlayerPickerDataSource_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
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
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *MEMORY[0x1E0DC48A8];
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC48A8]))
  {
    objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v11, CFSTR("GKCollectionDataSourceHeader"), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardChallengePlayerPickerDataSource headerTextForSection:](self, "headerTextForSection:", objc_msgSend(v10, "section"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v13);

    if (objc_msgSend(v10, "section") == 1)
    {
      -[GKDashboardChallengePlayerPickerDataSource suggestedFriends](self, "suggestedFriends");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (v16 < 4)
      {
        objc_msgSend(v12, "secondaryLabel");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setText:", 0);

        objc_msgSend(v12, "secondaryLabel");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        v22 = 1;
      }
      else
      {
        -[GKDashboardChallengePlayerPickerDataSource showingAllFriendSuggestions](self, "showingAllFriendSuggestions");
        GKGameCenterUIFrameworkBundle();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        GKGetLocalizedStringFromTableInBundle();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "secondaryLabel");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setText:", v18);

        objc_msgSend(v12, "secondaryLabel");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        v22 = 0;
      }
      objc_msgSend(v20, "setHidden:", v22);

      objc_msgSend(v12, "secondaryLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setUserInteractionEnabled:", 1);

      objc_initWeak(&location, self);
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __107__GKDashboardChallengePlayerPickerDataSource_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke;
      v27[3] = &unk_1E59C4AC8;
      objc_copyWeak(&v30, &location);
      v28 = v8;
      v29 = v10;
      objc_msgSend(v12, "setSecondaryLabelTapHandler:", v27);

      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_msgSend(v12, "secondaryLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setHidden:", 1);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __107__GKDashboardChallengePlayerPickerDataSource_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = objc_msgSend(WeakRetained, "showingAllFriendSuggestions") ^ 1;
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "setShowingAllFriendSuggestions:", v4);

  v6 = *(void **)(a1 + 32);
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
  objc_msgSend(v6, "reloadSections:", v7);

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  NSString *v14;
  _BOOL4 IsAccessibilityCategory;
  double v16;
  double v17;
  CGSize result;

  v6 = a3;
  if (objc_msgSend(a5, "section"))
  {
    objc_msgSend(v6, "bounds");
    +[GKDashboardFriendSuggestionCollectionViewCell sizeWithFitting:in:](_TtC12GameCenterUI45GKDashboardFriendSuggestionCollectionViewCell, "sizeWithFitting:in:", v6, v7, 0.0);
    v9 = v8;
    v11 = v10;

  }
  else
  {
    +[GKDashboardPlayerPickerCell defaultSize](GKDashboardPlayerPickerCell, "defaultSize");
    v11 = v12;
    v9 = 0.0;
    objc_msgSend(v6, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "preferredContentSizeCategory");
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v14);

    if (IsAccessibilityCategory)
      v11 = v11 + v11;
  }
  v16 = v9;
  v17 = v11;
  result.height = v17;
  result.width = v16;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  NSMutableDictionary *playerStates;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = a4;
  if (objc_msgSend(v5, "section"))
  {
    v7 = 0;
    if (objc_msgSend(v5, "section") == 1)
    {
      v6 = objc_msgSend(v5, "item");
      if (v6 >= -[GKDashboardChallengePlayerPickerDataSource friendSuggestionsCount](self, "friendSuggestionsCount"))
        v7 = 1;
    }
  }
  else
  {
    -[GKDashboardChallengePlayerPickerDataSource playerForIndexPath:](self, "playerForIndexPath:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    playerStates = self->_playerStates;
    objc_msgSend(v8, "referenceKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](playerStates, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");

    v7 = v12 == 0;
  }

  return v7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  BOOL v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  void (**v9)(_QWORD, _QWORD);
  void (**v10)(_QWORD, _QWORD);
  NSMutableDictionary *playerStates;
  void *v12;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *v15;
  void *v16;
  id v17;

  v17 = a4;
  if (!objc_msgSend(v17, "section"))
  {
    -[GKDashboardChallengePlayerPickerDataSource playerForIndexPath:](self, "playerForIndexPath:", v17);
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9 = v10;
    if (v10)
    {
      playerStates = self->_playerStates;
      objc_msgSend(v10, "referenceKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](playerStates, "objectForKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "integerValue");

      if (!v14)
      {
        v15 = self->_playerStates;
        objc_msgSend(v9, "referenceKey");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", &unk_1E5A5DD28, v16);

      }
    }
    goto LABEL_9;
  }
  v5 = objc_msgSend(v17, "section") == 1;
  v6 = v17;
  if (v5)
  {
    v7 = objc_msgSend(v17, "item");
    v8 = v7 < -[GKDashboardChallengePlayerPickerDataSource friendSuggestionsCount](self, "friendSuggestionsCount");
    v6 = v17;
    if (!v8)
    {
      -[GKDashboardChallengePlayerPickerDataSource inviteFriendHandler](self, "inviteFriendHandler");
      v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v9[2](v9, 0);
LABEL_9:

      v6 = v17;
    }
  }

}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *playerStates;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableDictionary *v13;
  void *v14;
  id v15;

  v15 = a4;
  v5 = objc_msgSend(v15, "section");
  v6 = v15;
  if (!v5)
  {
    -[GKDashboardChallengePlayerPickerDataSource playerForIndexPath:](self, "playerForIndexPath:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      playerStates = self->_playerStates;
      objc_msgSend(v7, "referenceKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](playerStates, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "integerValue");

      if (v12 != 2)
      {
        v13 = self->_playerStates;
        objc_msgSend(v8, "referenceKey");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", &unk_1E5A5DCC8, v14);

      }
    }

    v6 = v15;
  }

}

- (BOOL)showingFriendSuggestions
{
  return self->_showingFriendSuggestions;
}

- (void)setShowingFriendSuggestions:(BOOL)a3
{
  self->_showingFriendSuggestions = a3;
}

- (id)inviteFriendHandler
{
  return self->_inviteFriendHandler;
}

- (void)setInviteFriendHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (GKChallenge)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
  objc_storeStrong((id *)&self->_challenge, a3);
}

- (NSArray)players
{
  return self->_players;
}

- (void)setPlayers:(id)a3
{
  objc_storeStrong((id *)&self->_players, a3);
}

- (NSMutableDictionary)playerStates
{
  return self->_playerStates;
}

- (void)setPlayerStates:(id)a3
{
  objc_storeStrong((id *)&self->_playerStates, a3);
}

- (NSMutableDictionary)playerAchievementDates
{
  return self->_playerAchievementDates;
}

- (void)setPlayerAchievementDates:(id)a3
{
  objc_storeStrong((id *)&self->_playerAchievementDates, a3);
}

- (NSArray)searchPlayers
{
  return self->_searchPlayers;
}

- (void)setSearchPlayers:(id)a3
{
  objc_storeStrong((id *)&self->_searchPlayers, a3);
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
  objc_storeStrong((id *)&self->_searchPlayers, 0);
  objc_storeStrong((id *)&self->_playerAchievementDates, 0);
  objc_storeStrong((id *)&self->_playerStates, 0);
  objc_storeStrong((id *)&self->_players, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong(&self->_inviteFriendHandler, 0);
}

@end
