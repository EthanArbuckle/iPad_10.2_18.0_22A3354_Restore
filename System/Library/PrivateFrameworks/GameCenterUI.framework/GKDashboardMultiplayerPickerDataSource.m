@implementation GKDashboardMultiplayerPickerDataSource

- (GKDashboardMultiplayerPickerDataSource)initWithMaxSelectable:(int64_t)a3 previouslyInvitedPlayers:(id)a4 nearbyOnly:(BOOL)a5 pickerOrigin:(int64_t)a6
{
  _BOOL8 v7;
  id v10;
  GKDashboardMultiplayerPickerDataSource *v11;
  GKDashboardMultiplayerPickerDataSource *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  objc_super v23;

  v7 = a5;
  v10 = a4;
  v23.receiver = self;
  v23.super_class = (Class)GKDashboardMultiplayerPickerDataSource;
  v11 = -[GKCollectionDataSource init](&v23, sel_init);
  v12 = v11;
  if (v11)
  {
    -[GKDashboardMultiplayerPickerDataSource setMaxSelectable:](v11, "setMaxSelectable:", a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardMultiplayerPickerDataSource setPreviouslyInvitedPlayers:](v12, "setPreviouslyInvitedPlayers:", v13);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardMultiplayerPickerDataSource setNearbyPlayers:](v12, "setNearbyPlayers:", v14);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardMultiplayerPickerDataSource setFriendPlayers:](v12, "setFriendPlayers:", v15);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardMultiplayerPickerDataSource setSuggestedPlayers:](v12, "setSuggestedPlayers:", v16);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardMultiplayerPickerDataSource setSuggestedPlayerGroups:](v12, "setSuggestedPlayerGroups:", v17);

    v12->_friendSortFilterScope = -[GKDashboardMultiplayerPickerDataSource defaultFilterScopeFromPickerOrigin:](v12, "defaultFilterScopeFromPickerOrigin:", a6);
    -[GKDashboardMultiplayerPickerDataSource setNearbyOnly:](v12, "setNearbyOnly:", v7);
    -[GKDashboardMultiplayerPickerDataSource setIsShowingNearbyExpanded:](v12, "setIsShowingNearbyExpanded:", 0);
    -[GKDashboardMultiplayerPickerDataSource setShowsAllFriends:](v12, "setShowsAllFriends:", a6 != 1);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "userInterfaceIdiom");

    if (v19 == 1)
      v20 = 3;
    else
      v20 = 5;
    -[GKDashboardMultiplayerPickerDataSource setNumberOfFriendsToShowInitially:](v12, "setNumberOfFriendsToShowInitially:", v20);
    -[GKDashboardMultiplayerPickerDataSource setPickerOrigin:](v12, "setPickerOrigin:", a6);
    -[GKDashboardMultiplayerPickerDataSource setExcludesContacts:](v12, "setExcludesContacts:", a6 != 1);
    if (!-[GKDashboardMultiplayerPickerDataSource excludesContacts](v12, "excludesContacts"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKDashboardMultiplayerPickerDataSource setContactPlayers:](v12, "setContactPlayers:", v21);

    }
  }

  return v12;
}

- (id)collectionView
{
  void *v2;
  void *v3;

  -[GKDashboardMultiplayerPickerDataSource delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pickerCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setupCollectionView:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)GKDashboardMultiplayerPickerDataSource;
  v3 = a3;
  -[GKCollectionDataSource setupCollectionView:](&v17, sel_setupCollectionView_, v3);
  +[NSObject _gkNibWithBaseName:](GKDashboardPickerPlayerCell, "_gkNibWithBaseName:", CFSTR("GKDashboardPickerPlayerCell"), v17.receiver, v17.super_class);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerNib:forCellWithReuseIdentifier:", v4, CFSTR("playerCell"));

  objc_msgSend(v3, "setAllowsMultipleSelection:", 1);
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("playerPickerNearbyInstructionCell"));
  v5 = objc_opt_class();
  v6 = *MEMORY[0x1E0DC48A0];
  objc_msgSend(v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v5, *MEMORY[0x1E0DC48A0], CFSTR("friendsSectionFooterShowMoreFriendsReuseIdentifier"));
  +[NSObject _gkNibWithBaseName:](_TtC12GameCenterUI26GKSuggestionsContainerCell, "_gkNibWithBaseName:", CFSTR("GKSuggestionsContainerCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKSuggestionsContainerCell reuseIdentifier](_TtC12GameCenterUI26GKSuggestionsContainerCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerNib:forCellWithReuseIdentifier:", v7, v8);

  +[NSObject _gkNibWithBaseName:](GKDashboardPickerPlayerGroupCell, "_gkNibWithBaseName:", CFSTR("GKDashboardPickerPlayerGroupCell"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDashboardPickerPlayerGroupCell reuseIdentifier](GKDashboardPickerPlayerGroupCell, "reuseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerNib:forCellWithReuseIdentifier:", v9, v10);

  objc_msgSend(v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), v6, CFSTR("friendsSectionFooterPlayWithFriendsReuseIdentifier"));
  v11 = objc_opt_class();
  +[GKMultiplayerPickerNoFriendsCell reuseIdentifier](_TtC12GameCenterUI32GKMultiplayerPickerNoFriendsCell, "reuseIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", v11, v12);

  +[NSObject _gkNibWithBaseName:](GKDashboardPickerPlayerCell, "_gkNibWithBaseName:", CFSTR("GKDashboardPickerPlayerCellAX"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerNib:forCellWithReuseIdentifier:", v13, CFSTR("playerCellAX"));

  +[NSObject _gkNibWithBaseName:](GKDashboardPickerPlayerGroupCell, "_gkNibWithBaseName:", CFSTR("GKDashboardPickerPlayerGroupCellAX"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDashboardPickerPlayerGroupCell reuseIdentifierAX](GKDashboardPickerPlayerGroupCell, "reuseIdentifierAX");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerNib:forCellWithReuseIdentifier:", v14, v15);

  +[NSObject _gkNib](GKDashboardButtonSectionHeaderView, "_gkNib");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerNib:forSupplementaryViewOfKind:withReuseIdentifier:", v16, *MEMORY[0x1E0DC48A8], CFSTR("friendsSectionHeaderReuseIdentifier"));

}

- (int64_t)defaultFilterScopeFromPickerOrigin:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  void *v9;
  int64_t v10;

  objc_msgSend(MEMORY[0x1E0D252C0], "currentGame");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D253B0], "shared");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "recentPlayerPickerSortPreferenceForBundleID:", v5);

    if (!*MEMORY[0x1E0D25460])
      v8 = (id)GKOSLoggers();
    v9 = (void *)*MEMORY[0x1E0D25470];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_DEBUG))
      -[GKDashboardMultiplayerPickerDataSource defaultFilterScopeFromPickerOrigin:].cold.1((uint64_t)v5, v9, v7);
    if (v7 >= 2)
      v10 = a3 == 0;
    else
      v10 = v7;
  }
  else
  {
    v10 = a3 == 0;
  }

  return v10;
}

- (void)setFriendSortFilterScope:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (self->_friendSortFilterScope != a3)
  {
    self->_friendSortFilterScope = a3;
    objc_msgSend(MEMORY[0x1E0D252C0], "currentGame");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0D253B0], "shared");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRecentPlayerPickerSortPreference:forBundleID:", a3, v6);

      if (!*MEMORY[0x1E0D25460])
        v8 = (id)GKOSLoggers();
      v9 = (void *)*MEMORY[0x1E0D25470];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_DEBUG))
        -[GKDashboardMultiplayerPickerDataSource setFriendSortFilterScope:].cold.1((uint64_t)v6, v9, a3);
    }
    -[GKDashboardMultiplayerPickerDataSource friendPlayers](self, "friendPlayers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    if (a3)
      -[GKDashboardMultiplayerPickerDataSource sortPlayersByNickname:](self, "sortPlayersByNickname:", v11);
    else
      -[GKDashboardMultiplayerPickerDataSource sortPlayersByRecentlyPlayed:](self, "sortPlayersByRecentlyPlayed:", v11);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardMultiplayerPickerDataSource setFriendPlayers:](self, "setFriendPlayers:", v12);

  }
}

- (void)sortPlayersByNickname:(id)a3
{
  objc_msgSend(a3, "sortUsingComparator:", &__block_literal_global_49);
}

uint64_t __64__GKDashboardMultiplayerPickerDataSource_sortPlayersByNickname___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "sortName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "caseInsensitiveCompare:", v6);
  return v7;
}

- (void)sortPlayersByRecentlyPlayed:(id)a3
{
  objc_msgSend(a3, "sortUsingComparator:", &__block_literal_global_81_0);
}

uint64_t __70__GKDashboardMultiplayerPickerDataSource_sortPlayersByRecentlyPlayed___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;

  v4 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0D252C0], "currentGame");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPlayedGame");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToString:", v9);

  objc_msgSend(MEMORY[0x1E0D252C0], "currentGame");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPlayedGame");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "isEqualToString:", v14);

  if (v10 && v15)
    goto LABEL_3;
  v20 = v10 | v15;
  if (v10)
    v19 = -1;
  else
    v19 = 1;
  if ((v20 & 1) == 0)
  {
    objc_msgSend(v5, "lastPlayedDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {

    }
    else
    {
      objc_msgSend(v4, "lastPlayedDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        objc_msgSend(v4, "sortName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "sortName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "caseInsensitiveCompare:", v17);
        goto LABEL_4;
      }
    }
    objc_msgSend(v5, "lastPlayedDate");
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = (void *)v24;
      objc_msgSend(v4, "lastPlayedDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
      {
        v19 = 1;
        goto LABEL_9;
      }
    }
    objc_msgSend(v4, "lastPlayedDate");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v28 = (void *)v27;
      objc_msgSend(v5, "lastPlayedDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
        v19 = -1;
        goto LABEL_9;
      }
    }
LABEL_3:
    objc_msgSend(v5, "lastPlayedDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastPlayedDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "compare:", v17);
LABEL_4:
    v19 = v18;

  }
LABEL_9:

  return v19;
}

- (void)loadDataWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  uint64_t *v38;
  _QWORD v39[4];
  id v40;
  GKDashboardMultiplayerPickerDataSource *v41;
  _QWORD *v42;
  uint64_t *v43;
  _QWORD v44[4];
  id v45;
  _QWORD *v46;
  uint64_t *v47;
  _QWORD v48[5];
  id v49;
  _QWORD v50[5];
  id v51;
  _QWORD v52[5];
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKDashboardMultiplayerPickerDataSource.m", 330, "-[GKDashboardMultiplayerPickerDataSource loadDataWithCompletionHandler:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dispatchGroupWithName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 0;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = __Block_byref_object_copy__11;
  v52[4] = __Block_byref_object_dispose__11;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v53 = (id)objc_claimAutoreleasedReturnValue();
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = __Block_byref_object_copy__11;
  v50[4] = __Block_byref_object_dispose__11;
  v51 = (id)MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D253B0], "shared");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "multiplayerAllowedPlayerType");
  v13 = MEMORY[0x1E0C809B0];
  if (v12 == 2)
  {
    v14 = -[GKDashboardMultiplayerPickerDataSource excludesContacts](self, "excludesContacts");

    if (!v14)
    {
      v48[0] = v13;
      v48[1] = 3221225472;
      v48[2] = __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke;
      v48[3] = &unk_1E59C41C0;
      v48[4] = self;
      v15 = v7;
      v49 = v15;
      objc_msgSend(v15, "perform:", v48);
      v44[0] = v13;
      v44[1] = 3221225472;
      v44[2] = __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_3;
      v44[3] = &unk_1E59C8630;
      v45 = v9;
      v46 = v50;
      v47 = &v54;
      objc_msgSend(v15, "perform:", v44);

    }
  }
  else
  {

  }
  if (-[GKDashboardMultiplayerPickerDataSource nearbyOnly](self, "nearbyOnly"))
  {
    *((_BYTE *)v55 + 24) = 1;
  }
  else
  {
    v39[0] = v13;
    v39[1] = 3221225472;
    v39[2] = __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_100;
    v39[3] = &unk_1E59C86C0;
    v16 = v7;
    v40 = v16;
    v41 = self;
    v42 = v52;
    v43 = &v54;
    objc_msgSend(v16, "perform:", v39);
    objc_msgSend(MEMORY[0x1E0D253B0], "shared");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "multiplayerAllowedPlayerType");

    if (v18 == 2)
    {
      v35[0] = v13;
      v35[1] = 3221225472;
      v35[2] = __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_119;
      v35[3] = &unk_1E59C8778;
      v36 = v10;
      v37 = v8;
      v38 = &v54;
      objc_msgSend(v16, "perform:", v35);

    }
  }
  dispatch_get_global_queue(0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v13;
  v26[1] = 3221225472;
  v26[2] = __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_126;
  v26[3] = &unk_1E59C8850;
  v26[4] = self;
  v32 = v52;
  v20 = v8;
  v27 = v20;
  v21 = v9;
  v28 = v21;
  v22 = v10;
  v29 = v22;
  v33 = v50;
  v23 = v25;
  v31 = v23;
  v34 = &v54;
  v24 = v7;
  v30 = v24;
  objc_msgSend(v24, "notifyOnQueue:block:", v19, v26);

  _Block_object_dispose(v50, 8);
  _Block_object_dispose(v52, 8);

  _Block_object_dispose(&v54, 8);
}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  GKContactDataSource *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "contactSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc_init(GKContactDataSource);
    objc_msgSend(*(id *)(a1 + 32), "setContactSource:", v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "contactSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E59C6518;
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v11 = v7;
  v12 = v8;
  v13 = v3;
  v9 = v3;
  objc_msgSend(v6, "loadContactsWithHandler:", v10);

}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "setError:", v6);
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12);
          v14 = objc_alloc(MEMORY[0x1E0D25358]);
          v15 = (void *)objc_msgSend(v14, "initWithContact:", v13, (_QWORD)v16);
          objc_msgSend(v7, "addObject:", v15);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    objc_msgSend(*(id *)(a1 + 40), "setContactPlayers:", v7);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  __int128 v18;
  _QWORD v19[7];

  v19[6] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C96708];
  v19[0] = v4;
  v19[1] = v5;
  v6 = *MEMORY[0x1E0C966A8];
  v19[2] = *MEMORY[0x1E0C967C0];
  v19[3] = v6;
  v7 = *MEMORY[0x1E0C96700];
  v19[4] = *MEMORY[0x1E0C96890];
  v19[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D25298], "daemonProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "utilityServicePrivate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_4;
  v14[3] = &unk_1E59C8608;
  v15 = v8;
  v11 = *(id *)(a1 + 32);
  v18 = *(_OWORD *)(a1 + 40);
  v16 = v11;
  v17 = v3;
  v12 = v3;
  v13 = v8;
  objc_msgSend(v10, "getGameInviteFriendSuggestionsWithHandler:", v14);

}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  NSObject **v25;
  NSObject *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  NSObject *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t m;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  __CFString *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  uint64_t v80;
  uint64_t v82;
  void *v83;
  void *v84;
  id obj;
  char *obja;
  uint64_t v87;
  void *v88;
  void *v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  id v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __CFString *v111;
  _BYTE v112[128];
  _BYTE v113[128];
  uint8_t v114[4];
  uint64_t v115;
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  obj = v2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v118, 16);
  if (v3)
  {
    v4 = v3;
    v87 = *(_QWORD *)v108;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v108 != v87)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * i);
        v103 = 0u;
        v104 = 0u;
        v105 = 0u;
        v106 = 0u;
        objc_msgSend(v6, "recipients");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v103, v117, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v104;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v104 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * j);
              objc_msgSend(v12, "identifier");
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              if (v13)
              {
                objc_msgSend(v12, "handle");
                v14 = objc_claimAutoreleasedReturnValue();
                v15 = (void *)v14;
                if (v14)
                  v16 = (const __CFString *)v14;
                else
                  v16 = CFSTR("UNKNOWN_HANDLE");
                objc_msgSend(v12, "identifier");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v89, "setObject:forKey:", v16, v17);

              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v103, v117, 16);
          }
          while (v9);
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v118, 16);
    }
    while (v4);
  }

  v18 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v19 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(v89, "allKeys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "predicateForContactsWithIdentifiers:", v20);
  v21 = objc_claimAutoreleasedReturnValue();

  v22 = *(_QWORD *)(a1 + 32);
  v102 = 0;
  v76 = (void *)v21;
  v77 = v18;
  objc_msgSend(v18, "unifiedContactsMatchingPredicate:keysToFetch:error:", v21, v22, &v102);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v102;
  v25 = (NSObject **)MEMORY[0x1E0D25460];
  if (v24)
  {
    v26 = *MEMORY[0x1E0D25460];
    if (!*MEMORY[0x1E0D25460])
    {
      v27 = (id)GKOSLoggers();
      v26 = *v25;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_4_cold_2();
  }
  v75 = v24;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v23, "count"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v79 = v23;
  v29 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v98, v116, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v99;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v99 != v31)
          objc_enumerationMutation(v79);
        v33 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * k);
        v34 = *v25;
        if (!*v25)
        {
          v35 = (id)GKOSLoggers();
          v34 = *v25;
        }
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_4_cold_1(v114, v34, v33, &v115);
        objc_msgSend(v33, "identifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "objectForKeyedSubscript:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v37, "isEqualToString:", CFSTR("UNKNOWN_HANDLE")) & 1) == 0)
          objc_msgSend(v33, "setSuggestedHandle:", v37);
        v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D25358]), "initWithContact:", v33);
        objc_msgSend(v33, "identifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKey:", v38, v39);

      }
      v30 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v98, v116, 16);
    }
    while (v30);
  }

  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v78 = obj;
  v82 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v94, v113, 16);
  if (v82)
  {
    v80 = *(_QWORD *)v95;
    do
    {
      v40 = 0;
      do
      {
        if (*(_QWORD *)v95 != v80)
          objc_enumerationMutation(v78);
        obja = v40;
        v41 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)v40);
        v84 = (void *)objc_opt_new();
        v42 = (void *)MEMORY[0x1E0C99DE8];
        objc_msgSend(v41, "recipients");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "arrayWithCapacity:", objc_msgSend(v43, "count"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        v92 = 0u;
        v93 = 0u;
        v90 = 0u;
        v91 = 0u;
        v83 = v41;
        objc_msgSend(v41, "recipients");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v90, v112, 16);
        if (v46)
        {
          v47 = v46;
          v48 = *(_QWORD *)v91;
          do
          {
            for (m = 0; m != v47; ++m)
            {
              if (*(_QWORD *)v91 != v48)
                objc_enumerationMutation(v45);
              v50 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * m);
              objc_msgSend(v50, "identifier");
              v51 = objc_claimAutoreleasedReturnValue();
              if (v51)
              {
                v52 = (void *)v51;
                objc_msgSend(v50, "identifier");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "objectForKeyedSubscript:", v53);
                v54 = (void *)objc_claimAutoreleasedReturnValue();

                if (v54)
                {
                  objc_msgSend(v50, "identifier");
                  v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "objectForKeyedSubscript:", v55);
                  v56 = objc_claimAutoreleasedReturnValue();
LABEL_56:
                  v58 = (void *)v56;
                  goto LABEL_61;
                }
              }
              objc_msgSend(v50, "handle");
              v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
              if (!-[__CFString length](v55, "length"))
              {
                objc_msgSend(v50, "displayName");
                v57 = objc_claimAutoreleasedReturnValue();

                v55 = (__CFString *)v57;
              }
              if (!-[__CFString length](v55, "length"))
              {

                v55 = CFSTR("UNKNOWN_HANDLE");
              }
              objc_msgSend(v28, "objectForKeyedSubscript:", v55);
              v56 = objc_claimAutoreleasedReturnValue();
              if (v56)
                goto LABEL_56;
              v88 = (void *)MEMORY[0x1E0C97200];
              objc_msgSend(v50, "displayName");
              v59 = objc_claimAutoreleasedReturnValue();
              v60 = (void *)v59;
              if (v59)
                v61 = v59;
              else
                v61 = (uint64_t)v55;
              v111 = v55;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v111, 1);
              v62 = v47;
              v63 = v48;
              v64 = v44;
              v65 = v28;
              v66 = v45;
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "contactWithDisplayName:handleStrings:", v61, v67);
              v68 = (void *)objc_claimAutoreleasedReturnValue();

              v45 = v66;
              v28 = v65;
              v44 = v64;
              v48 = v63;
              v47 = v62;

              v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D25358]), "initWithContact:", v68);
              objc_msgSend(v28, "setObject:forKey:", v58, v55);

LABEL_61:
              objc_msgSend(v44, "addObject:", v58);

            }
            v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v90, v112, 16);
          }
          while (v47);
        }

        objc_msgSend(v84, "setPlayers:", v44);
        objc_msgSend(v84, "setSource:", 1);
        objc_msgSend(v83, "groupName");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "setGroupName:", v69);

        objc_msgSend(v83, "conversationIdentifier");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "setConversationIdentifier:", v70);

        objc_msgSend(v83, "messagesGroupIdentifier");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "setMessagesGroupIdentifier:", v71);

        objc_msgSend(*(id *)(a1 + 40), "addObject:", v84);
        v40 = obja + 1;
      }
      while (obja + 1 != (char *)v82);
      v82 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v94, v113, 16);
    }
    while (v82);
  }

  objc_msgSend(v28, "allValues");
  v72 = objc_claimAutoreleasedReturnValue();
  v73 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v74 = *(void **)(v73 + 40);
  *(_QWORD *)(v73 + 40) = v72;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_100(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  __int128 v15;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D25298], "proxyForPlayer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "friendServicePrivate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_102;
  v11[3] = &unk_1E59C8698;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v12 = v8;
  v13 = v9;
  v15 = *(_OWORD *)(a1 + 48);
  v14 = v3;
  v10 = v3;
  objc_msgSend(v6, "getFriendsForPlayer:fetchOptions:handler:", v7, 1, v11);

}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_102(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject **v7;
  id v8;
  os_log_t *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD v50[2];
  uint8_t buf[4];
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "_gkMapWithBlock:", &__block_literal_global_105);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (NSObject **)MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
    v8 = (id)GKOSLoggers();
  v9 = (os_log_t *)MEMORY[0x1E0D25470];
  v10 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v52 = v6;
    _os_log_impl(&dword_1AB361000, v10, OS_LOG_TYPE_INFO, "Loaded player list: %@", buf, 0xCu);
  }
  v11 = *v7;
  if (v5)
  {
    if (!v11)
      v12 = (id)GKOSLoggers();
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_102_cold_3();
    objc_msgSend(*(id *)(a1 + 32), "setError:", v5);
  }
  else
  {
    if (!v11)
    {
      v13 = (id)GKOSLoggers();
      v11 = *v7;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_102_cold_2();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("friendBiDirectional == %@"), &unk_1E5A5E340);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filteredArrayUsingPredicate:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    v17 = *v7;
    if (!*v7)
    {
      v18 = (id)GKOSLoggers();
      v17 = *v7;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_102_cold_1();
    v19 = objc_msgSend(*(id *)(a1 + 40), "friendSortFilterScope");
    v20 = *(void **)(a1 + 40);
    if (v19)
      objc_msgSend(v20, "sortPlayersByNickname:", v16);
    else
      objc_msgSend(v20, "sortPlayersByRecentlyPlayed:", v16);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setFriendPlayers:", v21);

    objc_msgSend(MEMORY[0x1E0D253B0], "shared");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "multiplayerAllowedPlayerType");

    if (v23 == 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("friendPlayedWith == %@"), &unk_1E5A5E340);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("friendPlayedNearby == %@"), &unk_1E5A5E340);
      v24 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("acceptedGameInviteFromThisFriend == %@ || initiatedGameInviteToThisFriend == %@"), &unk_1E5A5E340, &unk_1E5A5E340);
      v25 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("automatchedTogether == %@"), &unk_1E5A5E340);
      v46 = (void *)v24;
      v47 = v16;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0CB3528];
      v50[0] = v24;
      v50[1] = v25;
      v45 = (void *)v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "orPredicateWithSubpredicates:", v28);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v24);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = v30;
      objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v25);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v49[1] = v31;
      objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v26);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v49[2] = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 3);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "andPredicateWithSubpredicates:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = (void *)MEMORY[0x1E0CB3528];
      v48[0] = v44;
      v48[1] = v43;
      objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v48[2] = v36;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 3);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "andPredicateWithSubpredicates:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "filteredArrayUsingPredicate:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "mutableCopy");
      v41 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v42 = *(void **)(v41 + 40);
      *(_QWORD *)(v41 + 40) = v40;

      objc_msgSend(*(id *)(a1 + 40), "sortPlayersByRecentlyPlayed:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      v16 = v47;

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

id __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_3_103(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D25358];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithInternalRepresentation:", v3);

  return v4;
}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_119(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D25298], "daemonProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "multiplayerService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_120;
  v9[3] = &unk_1E59C8750;
  v10 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v12 = v3;
  v13 = v7;
  v11 = v6;
  v8 = v3;
  objc_msgSend(v5, "getMultiPlayerGroups:", v9);

}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_120(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  __int128 v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (NSObject **)MEMORY[0x1E0D25460];
    v8 = *MEMORY[0x1E0D25460];
    if (!*MEMORY[0x1E0D25460])
    {
      v9 = (id)GKOSLoggers();
      v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_120_cold_1();
  }
  v28 = v6;
  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_123_0);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v39;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v39 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v15);
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        objc_msgSend(v16, "participants");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v35;
          do
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v35 != v20)
                objc_enumerationMutation(v17);
              objc_msgSend(v10, "addObject:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v21++));
            }
            while (v19 != v21);
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          }
          while (v19);
        }

        ++v15;
      }
      while (v15 != v13);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v13);
  }

  objc_msgSend(MEMORY[0x1E0D25298], "daemonProxy");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "profileServicePrivate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_124;
  v29[3] = &unk_1E59C8728;
  v30 = *(id *)(a1 + 32);
  v31 = v11;
  v32 = *(id *)(a1 + 40);
  v27 = *(_OWORD *)(a1 + 48);
  v25 = (id)v27;
  v33 = v27;
  v26 = v11;
  objc_msgSend(v23, "getProfilesForPlayerIDs:fetchOptions:handler:", v24, 1, v29);

}

uint64_t __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_121(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "playedAt");
  if (v6 <= objc_msgSend(v5, "playedAt"))
  {
    v8 = objc_msgSend(v4, "playedAt");
    v7 = v8 != objc_msgSend(v5, "playedAt");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_124(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t j;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (NSObject **)MEMORY[0x1E0D25460];
    v8 = *MEMORY[0x1E0D25460];
    if (!*MEMORY[0x1E0D25460])
    {
      v9 = (id)GKOSLoggers();
      v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_124_cold_1();
  }
  v36 = v6;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v49 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D25358]), "initWithInternalRepresentation:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i));
        objc_msgSend(v16, "internal");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "playerID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v18);

        objc_msgSend(*(id *)(a1 + 32), "addObject:", v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v13);
  }
  v35 = v11;

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = *(id *)(a1 + 40);
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v39)
  {
    v38 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v45 != v38)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
        objc_msgSend(v20, "participants");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "count");

        if (v22)
        {
          v23 = a1;
          v24 = (void *)objc_opt_new();
          v25 = (void *)MEMORY[0x1E0C99DE8];
          objc_msgSend(v20, "participants");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "arrayWithCapacity:", objc_msgSend(v26, "count"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v42 = 0u;
          v43 = 0u;
          v40 = 0u;
          v41 = 0u;
          objc_msgSend(v20, "participants");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v41;
            do
            {
              for (k = 0; k != v30; ++k)
              {
                if (*(_QWORD *)v41 != v31)
                  objc_enumerationMutation(v28);
                objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * k));
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = v33;
                if (v33 && (objc_msgSend(v33, "isLocalPlayer") & 1) == 0)
                  objc_msgSend(v27, "addObject:", v34);

              }
              v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
            }
            while (v30);
          }

          objc_msgSend(v24, "setPlayers:", v27);
          a1 = v23;
          objc_msgSend(*(id *)(v23 + 48), "addObject:", v24);

        }
      }
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    }
    while (v39);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_126(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void (**v5)(void *, void *);
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(void *, void *);
  id v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  unint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  void (**v59)(void *, void *);
  void *v60;
  void *v61;
  void *v62;
  id v63;
  uint64_t v64;
  id v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  _QWORD block[5];
  id v72;
  id v73;
  uint64_t v74;
  _QWORD v75[5];
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD aBlock[4];
  id v90;
  uint64_t v91;
  _BYTE v92[128];
  uint64_t v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_127;
  aBlock[3] = &unk_1E59C87E0;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  v65 = v3;
  v90 = v3;
  v91 = v4;
  v5 = (void (**)(void *, void *))_Block_copy(aBlock);
  v6 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(*(id *)(a1 + 32), "friendPlayers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = v8;
  objc_msgSend(v8, "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v67 = a1;
  v9 = *(id *)(a1 + 40);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v86;
    v69 = *(_QWORD *)v86;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v86 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
        objc_msgSend(v14, "players", v65);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v15, "count") >= 2)
        {

LABEL_11:
          v5[2](v5, v14);
          continue;
        }
        objc_msgSend(v14, "players");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "count") == 1)
        {
          objc_msgSend(v14, "players");
          v17 = v5;
          v18 = v9;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v68, "containsObject:", v20);

          v9 = v18;
          v5 = v17;
          v12 = v69;

          if (v21)
            goto LABEL_11;
        }
        else
        {

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
    }
    while (v11);
  }

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v22 = *(id *)(*(_QWORD *)(*(_QWORD *)(v67 + 80) + 8) + 40);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v82;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v82 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * j);
        v28 = (void *)objc_opt_new();
        v93 = v27;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v93, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setPlayers:", v29);

        v5[2](v5, v28);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
    }
    while (v24);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v31 = *(id *)(v67 + 48);
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v78;
    do
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v78 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * k);
        objc_msgSend(v36, "players", v65);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "_gkPlayersIDsFromPlayers");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v38, "sortedArrayUsingComparator:", &__block_literal_global_133);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v30, "containsObject:", v39) & 1) == 0)
        {
          objc_msgSend(v30, "addObject:", v39);
          objc_msgSend(v70, "addObject:", v36);
        }

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
    }
    while (v33);
  }

  if (objc_msgSend(v70, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v67 + 32), "suggestedPlayerGroups");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "count");

    objc_msgSend(*(id *)(v67 + 32), "suggestedPlayerGroups");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (v42 > 4)
    {
      objc_msgSend(v43, "subarrayWithRange:", 0, 4);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "addObjectsFromArray:", v46);

      objc_msgSend(*(id *)(v67 + 32), "suggestedPlayerGroups");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "removeObjectsInRange:", 0, 4);
    }
    else
    {
      objc_msgSend(v40, "addObjectsFromArray:", v43);

      objc_msgSend(*(id *)(v67 + 32), "suggestedPlayerGroups");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "removeAllObjects");
    }

    objc_msgSend(v40, "addObjectsFromArray:", v70);
    objc_msgSend(*(id *)(v67 + 32), "suggestedPlayerGroups");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "count");

    if (v48)
    {
      objc_msgSend(*(id *)(v67 + 32), "suggestedPlayerGroups");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "addObjectsFromArray:", v49);

    }
    objc_msgSend(*(id *)(v67 + 32), "setSuggestedPlayerGroups:", v40, v65);

  }
  objc_msgSend(*(id *)(v67 + 32), "suggestedPlayerGroups", v65);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "count");

  if (v51 >= 0x11)
  {
    objc_msgSend(*(id *)(v67 + 32), "suggestedPlayerGroups");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "subarrayWithRange:", 0, 16);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)objc_msgSend(v53, "mutableCopy");
    objc_msgSend(*(id *)(v67 + 32), "setSuggestedPlayerGroups:", v54);

  }
  objc_msgSend(*(id *)(v67 + 56), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v67 + 80) + 8) + 40));
  objc_msgSend(*(id *)(v67 + 56), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v67 + 88) + 8) + 40));
  objc_msgSend(*(id *)(v67 + 56), "allObjects");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v67 + 32), "setSuggestedPlayers:", v55);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(v67 + 32), "itemCount"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = MEMORY[0x1E0C809B0];
  v75[0] = MEMORY[0x1E0C809B0];
  v75[1] = 3221225472;
  v75[2] = __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_5;
  v75[3] = &unk_1E59C8828;
  v75[4] = *(_QWORD *)(v67 + 32);
  v76 = v56;
  v58 = v56;
  v59 = (void (**)(void *, void *))_Block_copy(v75);
  objc_msgSend(*(id *)(v67 + 32), "nearbyPlayers");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2](v59, v60);

  objc_msgSend(*(id *)(v67 + 32), "friendPlayers");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2](v59, v61);

  objc_msgSend(*(id *)(v67 + 32), "suggestedPlayers");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2](v59, v62);

  objc_msgSend(*(id *)(v67 + 32), "setPlayerStates:", v58);
  block[0] = v57;
  block[1] = 3221225472;
  block[2] = __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_137;
  block[3] = &unk_1E59C57F8;
  block[4] = *(_QWORD *)(v67 + 32);
  v63 = *(id *)(v67 + 72);
  v64 = *(_QWORD *)(v67 + 96);
  v73 = v63;
  v74 = v64;
  v72 = *(id *)(v67 + 64);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_127(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "players");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_gkPlayersIDsFromPlayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_130);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    objc_msgSend(*(id *)(a1 + 40), "suggestedPlayerGroups");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

uint64_t __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_3_128(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_4_132(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 32), "playerStates");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "referenceKey");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "previouslyInvitedPlayers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v10) = objc_msgSend(v12, "containsObject:", v8);

        if ((_DWORD)v10)
        {

          v11 = &unk_1E5A5E358;
        }
        else if (!v11)
        {
          v11 = &unk_1E5A5E370;
        }
        v13 = *(void **)(a1 + 40);
        objc_msgSend(v8, "referenceKey");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, v14);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_137(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setDidLoad:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setBrowsingForNearbyPlayers:", objc_msgSend(*(id *)(a1 + 32), "supportsNearby"));
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    v3 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 40), "error");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);

  }
}

- (int64_t)itemCount
{
  void *v3;
  int64_t v4;

  if (!-[GKCollectionDataSource isSearching](self, "isSearching"))
    return -[GKDashboardMultiplayerPickerDataSource unmodifiedItemCount](self, "unmodifiedItemCount");
  -[GKDashboardMultiplayerPickerDataSource searchPlayersAndGroups](self, "searchPlayersAndGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)unmodifiedItemCount
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  if (-[GKDashboardMultiplayerPickerDataSource supportsNearby](self, "supportsNearby"))
  {
    -[GKDashboardMultiplayerPickerDataSource nearbyPlayers](self, "nearbyPlayers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      -[GKDashboardMultiplayerPickerDataSource nearbyPlayers](self, "nearbyPlayers");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "count");

    }
    else
    {
      v5 = 1;
    }

  }
  else
  {
    v5 = 0;
  }
  if (!-[GKDashboardMultiplayerPickerDataSource nearbyOnly](self, "nearbyOnly"))
  {
    -[GKDashboardMultiplayerPickerDataSource suggestedPlayers](self, "suggestedPlayers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    -[GKDashboardMultiplayerPickerDataSource friendPlayers](self, "friendPlayers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 += v7 + objc_msgSend(v8, "count");

  }
  return v5;
}

- (double)preferredCollectionHeight
{
  double result;

  +[GKDashboardPlayerCell preferredCollectionHeight](GKDashboardPlayerPickerCell, "preferredCollectionHeight");
  return result;
}

- (id)playersForSection:(int64_t)a3 ignoreSearch:(BOOL)a4
{
  void *v6;

  if (!a4 && -[GKCollectionDataSource isSearching](self, "isSearching"))
    goto LABEL_6;
  if (!a3)
  {
    -[GKDashboardMultiplayerPickerDataSource suggestedPlayers](self, "suggestedPlayers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  if (a3 == 1)
  {
    -[GKDashboardMultiplayerPickerDataSource friendPlayers](self, "friendPlayers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_6:
    v6 = 0;
  }
  return v6;
}

- (id)playerForIndexPath:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;

  v4 = a3;
  -[GKDashboardMultiplayerPickerDataSource playersForSection:ignoreSearch:](self, "playersForSection:ignoreSearch:", objc_msgSend(v4, "section"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "item");

  if (objc_msgSend(v5, "count") <= v6)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)isPlayerAtIndexPathCoreRecent:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "section"))
  {
    v5 = 0;
  }
  else
  {
    -[GKDashboardMultiplayerPickerDataSource playerForIndexPath:](self, "playerForIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isInContacts");

  }
  return v5;
}

- (id)playerForPlayerID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[GKDashboardMultiplayerPickerDataSource nearbyPlayers](self, "nearbyPlayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v37;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v37 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v9);
      objc_msgSend(v10, "internal");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "playerID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", v4);

      if ((v13 & 1) != 0)
        goto LABEL_26;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[GKDashboardMultiplayerPickerDataSource friendPlayers](self, "friendPlayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v33;
LABEL_11:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v16)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v17);
      objc_msgSend(v10, "internal");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "playerID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", v4);

      if ((v20 & 1) != 0)
        goto LABEL_26;
      if (v15 == ++v17)
      {
        v15 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
        if (v15)
          goto LABEL_11;
        break;
      }
    }
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[GKDashboardMultiplayerPickerDataSource suggestedPlayers](self, "suggestedPlayers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v29;
LABEL_19:
    v23 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v22)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v23);
      objc_msgSend(v10, "internal");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "playerID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqualToString:", v4);

      if ((v26 & 1) != 0)
        break;
      if (v21 == (id)++v23)
      {
        v21 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
        if (v21)
          goto LABEL_19;
        goto LABEL_27;
      }
    }
LABEL_26:
    v21 = v10;
  }
LABEL_27:

  return v21;
}

- (NSArray)selectedPlayers
{
  void *v3;
  id v4;
  void (**v5)(void *, void *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  GKDashboardMultiplayerPickerDataSource *v16;
  id v17;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __57__GKDashboardMultiplayerPickerDataSource_selectedPlayers__block_invoke;
  v15 = &unk_1E59C8828;
  v16 = self;
  v17 = v3;
  v4 = v3;
  v5 = (void (**)(void *, void *))_Block_copy(&v12);
  -[GKDashboardMultiplayerPickerDataSource nearbyPlayers](self, "nearbyPlayers", v12, v13, v14, v15, v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v6);

  -[GKDashboardMultiplayerPickerDataSource suggestedPlayers](self, "suggestedPlayers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v7);

  -[GKDashboardMultiplayerPickerDataSource friendPlayers](self, "friendPlayers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v8);

  if (!-[GKDashboardMultiplayerPickerDataSource excludesContacts](self, "excludesContacts"))
  {
    -[GKDashboardMultiplayerPickerDataSource contactPlayers](self, "contactPlayers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v9);

  }
  objc_msgSend(v4, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v10;
}

void __57__GKDashboardMultiplayerPickerDataSource_selectedPlayers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 32), "playerStates");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "referenceKey");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "integerValue");

        if (v12 == 1)
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

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
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_playerStates, "setObject:forKeyedSubscript:", &unk_1E5A5E370, v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)pickerWillSendInvites
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[GKDashboardMultiplayerPickerDataSource suggestedPlayerGroups](self, "suggestedPlayerGroups", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  v5 = (_QWORD *)MEMORY[0x1E0D25068];
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v9, "source") != 1 && objc_msgSend(v9, "source") != 2)
        {
          objc_msgSend(v9, "players");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "count");

          if (v11 >= 2
            && -[GKDashboardMultiplayerPickerDataSource shouldSelectPlayerGroup:](self, "shouldSelectPlayerGroup:", v9))
          {

            objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "reportEvent:type:", *v5, *MEMORY[0x1E0D24E78]);
            goto LABEL_14;
          }
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_14:

  -[GKDashboardMultiplayerPickerDataSource selectedMessageGroups](self, "selectedMessageGroups");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "reportEvent:type:", *v5, *MEMORY[0x1E0D24E80]);

  }
}

- (unint64_t)cornerMaskForItemAtIndexPath:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a3;
  v5 = -[GKDashboardMultiplayerPickerDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", objc_msgSend(v4, "section"));
  v6 = objc_msgSend(v4, "section");
  if (v6)
  {
    if (v6 == 1)
    {
      if (objc_msgSend(v4, "item") == v5 - 1
        && !-[GKDashboardMultiplayerPickerDataSource isShowingAddFriendsFooter](self, "isShowingAddFriendsFooter"))
      {
        if (-[GKDashboardMultiplayerPickerDataSource _canShowMoreFriends](self, "_canShowMoreFriends"))
          v7 = 0;
        else
          v7 = 12;
      }
      else
      {
        v7 = 0;
      }
      if (-[GKDashboardMultiplayerPickerDataSource hasFriends](self, "hasFriends"))
        v8 = v7;
      else
        v8 = 15;
      goto LABEL_20;
    }
LABEL_13:
    v8 = 0;
    goto LABEL_20;
  }
  if (!-[GKCollectionDataSource isSearching](self, "isSearching"))
    goto LABEL_13;
  if (objc_msgSend(v4, "item"))
    v8 = 0;
  else
    v8 = 3;
  if (objc_msgSend(v4, "item") == v5 - 1)
    v8 |= 0xCuLL;
LABEL_20:

  return v8;
}

- (id)fullContactWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[GKDashboardMultiplayerPickerDataSource contactSource](self, "contactSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fullContactWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)firstIndexPathForPlayer:(id)a3
{
  void *v3;
  void *v4;

  -[GKDashboardMultiplayerPickerDataSource indexPathsForPlayer:](self, "indexPathsForPlayer:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)indexPathsForPlayer:(id)a3
{
  id v4;
  void *v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 3; ++i)
  {
    -[GKDashboardMultiplayerPickerDataSource playersForSection:ignoreSearch:](self, "playersForSection:ignoreSearch:", i, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "indexOfObject:", v4);
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v8, i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v9);

    }
  }
  v10 = (void *)objc_msgSend(v5, "copy");

  return v10;
}

- (id)indexPathForPlayer:(id)a3 inSection:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  -[GKDashboardMultiplayerPickerDataSource playersForSection:ignoreSearch:](self, "playersForSection:ignoreSearch:", a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v6);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)indexPathForFirstPlayer
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = 0;
  while (1)
  {
    -[GKDashboardMultiplayerPickerDataSource playersForSection:ignoreSearch:](self, "playersForSection:ignoreSearch:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
      break;

    if (++v3 == 3)
    {
      v6 = 0;
      return v6;
    }
  }
  v7 = (void *)v5;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)searchKeyForSection:(int64_t)a3
{
  if (a3 == 1)
    return CFSTR("groupName");
  else
    return CFSTR("searchName");
}

- (id)alternateSearchKeyForSection:(int64_t)a3
{
  if (a3 == 1)
    return CFSTR("groupName");
  else
    return CFSTR("internal.messagesID");
}

- (void)searchTextHasChanged
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  uint64_t v28;
  void *v29;
  char v30;
  void *v31;
  id obj;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  void *v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (-[GKCollectionDataSource isSearching](self, "isSearching"))
  {
    v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[GKDashboardMultiplayerPickerDataSource nearbyPlayers](self, "nearbyPlayers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardMultiplayerPickerDataSource friendPlayers](self, "friendPlayers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithObjects:", v4, v5, 0);

    if (!-[GKDashboardMultiplayerPickerDataSource excludesContacts](self, "excludesContacts"))
    {
      -[GKDashboardMultiplayerPickerDataSource contactPlayers](self, "contactPlayers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v7);

    }
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    obj = v6;
    v34 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    if (v34)
    {
      v33 = *(_QWORD *)v53;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v53 != v33)
            objc_enumerationMutation(obj);
          v36 = v8;
          v9 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v8);
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v10 = v9;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v49;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v49 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
                if ((objc_msgSend(v15, "isLocalPlayer") & 1) == 0
                  && -[GKCollectionDataSource searchMatchesItem:inSection:](self, "searchMatchesItem:inSection:", v15, 0))
                {
                  v16 = (void *)objc_opt_new();
                  v58 = v15;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "setPlayers:", v17);

                  objc_msgSend(v15, "displayNameWithOptions:", 0);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "setGroupName:", v18);

                  objc_msgSend(v38, "addObject:", v16);
                  objc_msgSend(v39, "addObject:", v15);

                }
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
            }
            while (v12);
          }

          v8 = v36 + 1;
        }
        while ((id)(v36 + 1) != v34);
        v34 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      }
      while (v34);
    }

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    -[GKDashboardMultiplayerPickerDataSource suggestedPlayerGroups](self, "suggestedPlayerGroups");
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
    if (v19)
    {
      v20 = v19;
      v37 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v45 != v37)
            objc_enumerationMutation(v35);
          v22 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          objc_msgSend(v22, "players");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v41;
            while (2)
            {
              for (k = 0; k != v25; ++k)
              {
                if (*(_QWORD *)v41 != v26)
                  objc_enumerationMutation(v23);
                v28 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * k);
                if (-[GKCollectionDataSource searchMatchesItem:inSection:](self, "searchMatchesItem:inSection:", v28, 0))
                {
                  objc_msgSend(v22, "players");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((unint64_t)objc_msgSend(v29, "count") > 1)
                  {

LABEL_39:
                    objc_msgSend(v38, "addObject:", v22);

                    goto LABEL_40;
                  }
                  v30 = objc_msgSend(v39, "containsObject:", v28);

                  if ((v30 & 1) == 0)
                    goto LABEL_39;
                }
              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
              if (v25)
                continue;
              break;
            }
          }

          if (-[GKCollectionDataSource searchMatchesItem:inSection:](self, "searchMatchesItem:inSection:", v22, 1))
            objc_msgSend(v38, "addObject:", v22);
LABEL_40:
          ;
        }
        v20 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
      }
      while (v20);
    }

    objc_msgSend(v38, "array");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardMultiplayerPickerDataSource setSearchPlayersAndGroups:](self, "setSearchPlayersAndGroups:", v31);

  }
  else
  {
    -[GKDashboardMultiplayerPickerDataSource setSearchPlayersAndGroups:](self, "setSearchPlayersAndGroups:", 0);
  }
}

- (void)setSupportsNearby:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_supportsNearby != a3)
  {
    v3 = a3;
    self->_supportsNearby = a3;
    if (-[GKDashboardMultiplayerPickerDataSource didLoad](self, "didLoad"))
      -[GKDashboardMultiplayerPickerDataSource setBrowsingForNearbyPlayers:](self, "setBrowsingForNearbyPlayers:", v3);
  }
}

- (void)setBrowsingForNearbyPlayers:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v3 = a3;
  -[GKDashboardMultiplayerPickerDataSource nearbyDelegate](self, "nearbyDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (self->_browsingForNearbyPlayers != v3)
    {
      self->_browsingForNearbyPlayers = v3;
      if (v3)
      {
        objc_initWeak(&location, self);
        -[GKDashboardMultiplayerPickerDataSource nearbyDelegate](self, "nearbyDelegate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __70__GKDashboardMultiplayerPickerDataSource_setBrowsingForNearbyPlayers___block_invoke;
        v10[3] = &unk_1E59C8878;
        objc_copyWeak(&v11, &location);
        objc_msgSend(v6, "startBrowsingForNearbyPlayersWithReachableHandler:", v10);

        objc_destroyWeak(&v11);
        objc_destroyWeak(&location);
      }
      else
      {
        -[GKDashboardMultiplayerPickerDataSource nearbyDelegate](self, "nearbyDelegate");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stopBrowsingForNearbyPlayers");

      }
    }
  }
  else
  {
    if (!*MEMORY[0x1E0D25460])
      v7 = (id)GKOSLoggers();
    v8 = *MEMORY[0x1E0D25470];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_ERROR))
      -[GKDashboardMultiplayerPickerDataSource setBrowsingForNearbyPlayers:].cold.1(v8);
  }
}

void __70__GKDashboardMultiplayerPickerDataSource_setBrowsingForNearbyPlayers___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  id to;

  v5 = a2;
  objc_copyWeak(&to, (id *)(a1 + 32));
  v6 = objc_loadWeakRetained(&to);
  objc_msgSend(v6, "setNearbyPlayerID:reachable:", v5, a3);

  objc_destroyWeak(&to);
}

- (void)setNearbyPlayerID:(id)a3 reachable:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  BOOL v13;
  id location;
  _QWORD v15[2];

  v4 = a4;
  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[GKDashboardMultiplayerPickerDataSource playerForPlayerID:](self, "playerForPlayerID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[GKDashboardMultiplayerPickerDataSource setNearbyPlayer:reachable:](self, "setNearbyPlayer:reachable:", v7, v4);
  }
  else
  {
    objc_initWeak(&location, self);
    v8 = (void *)MEMORY[0x1E0D25358];
    v15[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__GKDashboardMultiplayerPickerDataSource_setNearbyPlayerID_reachable___block_invoke;
    v10[3] = &unk_1E59C88A0;
    objc_copyWeak(&v12, &location);
    v11 = v6;
    v13 = v4;
    objc_msgSend(v8, "loadPlayersForIdentifiersPrivate:withCompletionHandler:", v9, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __70__GKDashboardMultiplayerPickerDataSource_setNearbyPlayerID_reachable___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  id to;

  v5 = a2;
  v6 = a3;
  objc_copyWeak(&to, (id *)(a1 + 40));
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (!*MEMORY[0x1E0D25460])
      v8 = (id)GKOSLoggers();
    v9 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
    {
      __70__GKDashboardMultiplayerPickerDataSource_setNearbyPlayerID_reachable___block_invoke_cold_1(a1, (uint64_t)v6, v9);
      if (!v7)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  if (v7)
  {
LABEL_6:
    v10 = objc_loadWeakRetained(&to);
    objc_msgSend(v10, "setNearbyPlayer:reachable:", v7, *(unsigned __int8 *)(a1 + 48));

  }
LABEL_7:

  objc_destroyWeak(&to);
}

- (void)setNearbyPlayer:(id)a3 reachable:(BOOL)a4
{
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  GKDashboardMultiplayerPickerDataSource *v10;
  _QWORD *v11;
  BOOL v12;
  _QWORD v13[5];
  id v14;

  v6 = a3;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D252A8], "dispatchGroupWithName:", CFSTR("pickerDataSourceSetNearbyPlayer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3032000000;
    v13[3] = __Block_byref_object_copy__11;
    v13[4] = __Block_byref_object_dispose__11;
    v14 = v6;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __68__GKDashboardMultiplayerPickerDataSource_setNearbyPlayer_reachable___block_invoke;
    v8[3] = &unk_1E59C88C8;
    v11 = v13;
    v12 = a4;
    v9 = v14;
    v10 = self;
    objc_msgSend(v7, "notifyOnMainQueueWithBlock:", v8);

    _Block_object_dispose(v13, 8);
  }

}

void __68__GKDashboardMultiplayerPickerDataSource_setNearbyPlayer_reachable___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    return;
  if (!*MEMORY[0x1E0D25460])
    v2 = (id)GKOSLoggers();
  v3 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 138412546;
    v28 = v4;
    v29 = 1024;
    v30 = v5;
    _os_log_impl(&dword_1AB361000, v3, OS_LOG_TYPE_INFO, "setNearbyPlayer: %@ reachable: %d", buf, 0x12u);
  }
  objc_msgSend(*(id *)(a1 + 40), "nearbyPlayers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = *(unsigned __int8 *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "nearbyPlayers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", *(_QWORD *)(a1 + 32));

  if (!v8)
  {
    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 40), "nearbyPlayers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObject:", *(_QWORD *)(a1 + 32));

      objc_msgSend(*(id *)(a1 + 40), "updateStateForUnreachableNearbyPlayer:", *(_QWORD *)(a1 + 32));
    }
    goto LABEL_16;
  }
  if ((v10 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "nearbyPlayers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "insertObject:atIndex:", *(_QWORD *)(a1 + 32), 0);

    objc_msgSend(*(id *)(a1 + 40), "friendPlayers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "containsObject:", *(_QWORD *)(a1 + 32)))
    {
LABEL_13:

      goto LABEL_16;
    }
    objc_msgSend(*(id *)(a1 + 40), "suggestedPlayers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "containsObject:", *(_QWORD *)(a1 + 32)))
    {
LABEL_12:

      goto LABEL_13;
    }
    objc_msgSend(*(id *)(a1 + 32), "referenceKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(*(id *)(a1 + 40), "playerStates");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "referenceKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E5A5E370, v13);
      goto LABEL_12;
    }
  }
LABEL_16:
  if ((objc_msgSend(*(id *)(a1 + 40), "isSearching") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "nearbyPlayersChangedHandler");

  }
  if ((objc_msgSend(*(id *)(a1 + 40), "isSearching") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "nearbyPlayers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17 * v7
      || v17 + v7 < 1
      || (objc_msgSend(*(id *)(a1 + 40), "suggestedPlayerGroups"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v18, "count"),
          v18,
          v19))
    {
      objc_msgSend(*(id *)(a1 + 40), "suggestionContainerCell");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        objc_msgSend(*(id *)(a1 + 40), "collectionView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "cellForItemAtIndexPath:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          v20 = v23;
        else
          v20 = 0;

      }
      objc_msgSend(*(id *)(a1 + 40), "nearbyPlayers");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "updateNearbyPlayers:", v24);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "collectionView");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "reloadItemsAtIndexPaths:", v25);

    }
  }
}

- (void)updateStateForUnreachableNearbyPlayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[GKDashboardMultiplayerPickerDataSource friendPlayers](self, "friendPlayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsObject:", v4))
    goto LABEL_4;
  -[GKDashboardMultiplayerPickerDataSource suggestedPlayers](self, "suggestedPlayers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if ((v7 & 1) == 0)
  {
    -[GKDashboardMultiplayerPickerDataSource playerStates](self, "playerStates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "referenceKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v9);

    -[GKDashboardMultiplayerPickerDataSource delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pickerDatasource:didDeselectPlayers:inGroup:", self, v10, 0);

LABEL_4:
  }

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  if (-[GKCollectionDataSource isSearching](self, "isSearching", a3))
    return 1;
  else
    return 3;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v5;
  int64_t v6;
  void *v7;
  int64_t result;

  if (-[GKCollectionDataSource isSearching](self, "isSearching"))
  {
    -[GKDashboardMultiplayerPickerDataSource searchPlayersAndGroups](self, "searchPlayersAndGroups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    return v6;
  }
  -[GKDashboardMultiplayerPickerDataSource playersForSection:ignoreSearch:](self, "playersForSection:ignoreSearch:", a3, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "count");

  if (!a3)
    return -[GKDashboardMultiplayerPickerDataSource pickerOrigin](self, "pickerOrigin") == 1;
  if (a3 != 1)
  {
    if (a3 != 2)
      return v6;
    return -[GKDashboardMultiplayerPickerDataSource pickerOrigin](self, "pickerOrigin") == 1;
  }
  if (-[GKDashboardMultiplayerPickerDataSource nearbyOnly](self, "nearbyOnly"))
    return 0;
  if (!-[GKDashboardMultiplayerPickerDataSource hasFriends](self, "hasFriends"))
    return 1;
  if (-[GKDashboardMultiplayerPickerDataSource showsAllFriends](self, "showsAllFriends")
    || v6 == -[GKDashboardMultiplayerPickerDataSource numberOfFriendsToShowInitially](self, "numberOfFriendsToShowInitially")+ 1)
  {
    return v6;
  }
  LODWORD(result) = -[GKDashboardMultiplayerPickerDataSource numberOfFriendsToShowInitially](self, "numberOfFriendsToShowInitially");
  if (v6 >= (int)result)
    return (int)result;
  else
    return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[GKDashboardMultiplayerPickerDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", a4);
}

- (BOOL)hasFriends
{
  void *v2;
  BOOL v3;

  -[GKDashboardMultiplayerPickerDataSource friendPlayers](self, "friendPlayers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)playerCellForItemAtIndexPath:(id)a3 inCollectionView:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  NSString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *playerStates;
  void *v15;
  void *v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 v22;

  v6 = (void *)MEMORY[0x1E0DC3E88];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "currentTraitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferredContentSizeCategory");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryIsAccessibilityCategory(v10))
    v11 = CFSTR("playerCellAX");
  else
    v11 = CFSTR("playerCell");
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKDashboardMultiplayerPickerDataSource playerForIndexPath:](self, "playerForIndexPath:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  playerStates = self->_playerStates;
  objc_msgSend(v13, "referenceKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](playerStates, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "integerValue");

  objc_msgSend(v12, "setSelectable:", v17 != 2);
  v18 = -[GKDashboardMultiplayerPickerDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", objc_msgSend(v8, "section"));
  v19 = objc_msgSend(v8, "section");
  v20 = objc_msgSend(v8, "item");

  v21 = v18 - 1;
  if (v19 == 1)
    v22 = v20 != v21
       || -[GKDashboardMultiplayerPickerDataSource isShowingAddFriendsFooter](self, "isShowingAddFriendsFooter")
       || -[GKDashboardMultiplayerPickerDataSource _canShowMoreFriends](self, "_canShowMoreFriends");
  else
    v22 = v20 < v21;
  objc_msgSend(v12, "setLineVisible:", v22);

  return v12;
}

- (id)playerGroupCellForItemAtIndexPath:(id)a3 inCollectionView:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  NSString *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  int v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  NSString *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  _BOOL8 v52;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  NSString *v72;
  uint64_t v73;
  void *v74;
  void *v75;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0DC3E88];
  v8 = a4;
  objc_msgSend(v7, "currentTraitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferredContentSizeCategory");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryIsAccessibilityCategory(v10))
    +[GKDashboardPickerPlayerGroupCell reuseIdentifierAX](GKDashboardPickerPlayerGroupCell, "reuseIdentifierAX");
  else
    +[GKDashboardPickerPlayerGroupCell reuseIdentifier](GKDashboardPickerPlayerGroupCell, "reuseIdentifier");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v75, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setGroupCellDelegate:", self);
  -[GKCollectionDataSource searchText](self, "searchText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSearchText:", v12);

  -[GKDashboardMultiplayerPickerDataSource searchPlayersAndGroups](self, "searchPlayersAndGroups");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKDashboardMultiplayerPickerDataSource searchPlayersAndGroups](self, "searchPlayersAndGroups");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v15, "count");

  objc_msgSend(v14, "groupName");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v74 = v11;
  if (!-[__CFString length](v16, "length"))
  {
    objc_msgSend(v14, "players");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v17, "count") < 4)
    {
      if ((unint64_t)objc_msgSend(v17, "count") < 3)
      {
        if ((unint64_t)objc_msgSend(v17, "count") < 2)
        {
          if (!objc_msgSend(v17, "count"))
          {
LABEL_14:

            goto LABEL_15;
          }
          objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "displayNameWithOptions:", 0);
          v23 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v69 = (void *)MEMORY[0x1E0CB3940];
          GKGameCenterUIFrameworkBundle();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          GKGetLocalizedStringFromTableInBundle();
          v63 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "displayNameWithOptions:", 0);
          v72 = v10;
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "displayNameWithOptions:", 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "stringWithFormat:", v63, v30, v32);
          v33 = objc_claimAutoreleasedReturnValue();

          v23 = v33;
          v10 = v72;

          v16 = (__CFString *)v63;
        }
      }
      else
      {
        v62 = (void *)MEMORY[0x1E0CB3940];
        GKGameCenterUIFrameworkBundle();
        v71 = objc_claimAutoreleasedReturnValue();
        GKGetLocalizedStringFromTableInBundle();
        v68 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "displayNameWithOptions:", 0);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "displayNameWithOptions:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndexedSubscript:", 2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "displayNameWithOptions:", 0);
        v27 = v17;
        v28 = v10;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "stringWithFormat:", v68, v58, v25, v29);
        v23 = objc_claimAutoreleasedReturnValue();

        v10 = v28;
        v17 = v27;
        v24 = (void *)v71;

        v16 = (__CFString *)v68;
      }
    }
    else
    {
      v61 = (void *)MEMORY[0x1E0CB3940];
      GKGameCenterUIFrameworkBundle();
      v70 = objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v55 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "displayNameWithOptions:", 0);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "displayNameWithOptions:", 0);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", 2);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "displayNameWithOptions:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", 3);
      v67 = v17;
      v19 = v10;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "displayNameWithOptions:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "stringWithFormat:", v55, v56, v54, v18, v21);
      v22 = objc_claimAutoreleasedReturnValue();

      v23 = v22;
      v10 = v19;
      v17 = v67;
      v24 = (void *)v70;

      v16 = (__CFString *)v55;
    }

    v16 = (__CFString *)v23;
    goto LABEL_14;
  }
LABEL_15:
  v34 = objc_msgSend(v14, "isNearby");
  objc_msgSend(v14, "players");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "count");

  if (v34)
  {
    if (v36)
    {
      objc_msgSend(v14, "players");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "displayNameWithOptions:", 0);
      v39 = objc_claimAutoreleasedReturnValue();

      v16 = (__CFString *)v39;
    }
    else
    {

      if (!*MEMORY[0x1E0D25460])
        v47 = (id)GKOSLoggers();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
        -[GKDashboardMultiplayerPickerDataSource playerGroupCellForItemAtIndexPath:inCollectionView:].cold.1();
      v16 = 0;
    }
    GKGameCenterUIFrameworkBundle();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v46 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (v36 < 2)
  {
    v46 = 0;
  }
  else
  {
    v40 = (void *)MEMORY[0x1E0CB3940];
    GKGameCenterUIFrameworkBundle();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "players");
    v43 = v6;
    v44 = v10;
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "localizedStringWithFormat:", v42, objc_msgSend(v45, "count"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v44;
    v6 = v43;

  }
  objc_msgSend(v14, "players");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    v50 = v16;
  else
    v50 = &stru_1E59EB978;
  objc_msgSend(v14, "messagesGroupIdentifier");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "configureWithPlayers:title:subtitle:messagesGroupIdentifier:source:playerSelectionProxy:", v49, v50, v46, v51, objc_msgSend(v14, "source"), self);

  v52 = -[GKDashboardMultiplayerPickerDataSource shouldSelectPlayerGroup:](self, "shouldSelectPlayerGroup:", v14);
  objc_msgSend(v74, "setSelected:", v52);
  if (v52)
    -[GKDashboardMultiplayerPickerDataSource selectItemAtIndexPath:animated:scrollPosition:](self, "selectItemAtIndexPath:animated:scrollPosition:", v6, 0, 0);
  else
    -[GKDashboardMultiplayerPickerDataSource deselectItemAtIndexPath:animated:](self, "deselectItemAtIndexPath:animated:", v6, 0);
  objc_msgSend(v74, "setLineVisible:", objc_msgSend(v6, "item") < v73 - 1);

  return v74;
}

- (id)suggestionsCellForItemAtIndexPath:(id)a3 inCollectionView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (-[GKCollectionDataSource isSearching](self, "isSearching"))
  {
    -[GKDashboardMultiplayerPickerDataSource playerGroupCellForItemAtIndexPath:inCollectionView:](self, "playerGroupCellForItemAtIndexPath:inCollectionView:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[GKSuggestionsContainerCell reuseIdentifier](_TtC12GameCenterUI26GKSuggestionsContainerCell, "reuseIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v9, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[GKCollectionDataSource presentationViewController](self, "presentationViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPresentationViewController:", v10);

    objc_msgSend(v8, "setMultiplayerPickerDataSource:", self);
    -[GKDashboardMultiplayerPickerDataSource nearbyPlayers](self, "nearbyPlayers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configureWithDelegate:nearbyPlayers:", self, v11);

    -[GKDashboardMultiplayerPickerDataSource setSuggestionContainerCell:](self, "setSuggestionContainerCell:", v8);
  }

  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "section"))
  {
    if (objc_msgSend(v7, "section") == 2)
    {
      objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("playerPickerNearbyInstructionCell"), v7);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v7, "section") == 1 && !-[GKDashboardMultiplayerPickerDataSource hasFriends](self, "hasFriends"))
      {
        +[GKMultiplayerPickerNoFriendsCell reuseIdentifier](_TtC12GameCenterUI32GKMultiplayerPickerNoFriendsCell, "reuseIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_initWeak(&location, self);
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __80__GKDashboardMultiplayerPickerDataSource_collectionView_cellForItemAtIndexPath___block_invoke;
        v12[3] = &unk_1E59C48A0;
        objc_copyWeak(&v13, &location);
        objc_msgSend(v9, "setAddFriendsHandler:", v12);
        objc_destroyWeak(&v13);
        objc_destroyWeak(&location);
        goto LABEL_9;
      }
      -[GKDashboardMultiplayerPickerDataSource playerCellForItemAtIndexPath:inCollectionView:](self, "playerCellForItemAtIndexPath:inCollectionView:", v7, v6);
      v8 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[GKDashboardMultiplayerPickerDataSource suggestionsCellForItemAtIndexPath:inCollectionView:](self, "suggestionsCellForItemAtIndexPath:inCollectionView:", v7, v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
LABEL_9:

  return v9;
}

void __80__GKDashboardMultiplayerPickerDataSource_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "pickerDatasourceDidSelectAddFriend:", v3);

}

- (id)headerTextForSection:(int64_t)a3
{
  void *v4;
  void *v5;

  if (-[GKCollectionDataSource isSearching](self, "isSearching") || (unint64_t)a3 > 1)
  {
    v5 = 0;
  }
  else
  {
    GKGameCenterUIFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)isShowingAddFriendsFooter
{
  return !-[GKCollectionDataSource isSearching](self, "isSearching");
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  double v9;
  uint64_t v10;
  __objc2_class *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  v7 = a3;
  v8 = a5;
  if (-[GKCollectionDataSource isSearching](self, "isSearching"))
    goto LABEL_2;
  v10 = objc_msgSend(v8, "section");
  if (!v10)
  {
    -[GKDashboardMultiplayerPickerDataSource suggestedPlayerGroups](self, "suggestedPlayerGroups");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {

    }
    else
    {
      -[GKDashboardMultiplayerPickerDataSource nearbyPlayers](self, "nearbyPlayers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (!v16)
        goto LABEL_16;
    }
    +[GKSuggestionsContainerCell defaultCellHeight](_TtC12GameCenterUI26GKSuggestionsContainerCell, "defaultCellHeight");
    goto LABEL_14;
  }
  if (v10 != 1)
  {
    if (v10 == 2)
    {
      v11 = _TtC12GameCenterUI40GKMultiplayerPickerNearbyInstructionCell;
LABEL_11:
      objc_msgSend(v7, "bounds");
      -[__objc2_class itemHeightFitting:inTraitEnvironment:](v11, "itemHeightFitting:inTraitEnvironment:", v7, v13, v14);
      goto LABEL_14;
    }
LABEL_16:
    v18 = *MEMORY[0x1E0C9D820];
    v17 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    goto LABEL_15;
  }
  if (!-[GKDashboardMultiplayerPickerDataSource hasFriends](self, "hasFriends"))
  {
    v11 = _TtC12GameCenterUI32GKMultiplayerPickerNoFriendsCell;
    goto LABEL_11;
  }
LABEL_2:
  -[GKDashboardMultiplayerPickerDataSource playerCellHeightInCollectionView:](self, "playerCellHeightInCollectionView:", v7);
LABEL_14:
  v17 = v9;
  v18 = 0.0;
LABEL_15:

  v19 = v18;
  v20 = v17;
  result.height = v20;
  result.width = v19;
  return result;
}

- (BOOL)canSelectPlayerGroup:(id)a3 atIndexPath:(id)a4 inCollectionView:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  int64_t v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "players");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v11);
        v14 += -[GKDashboardMultiplayerPickerDataSource playerIsSelectable:](self, "playerIsSelectable:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }
  v17 = -[GKDashboardMultiplayerPickerDataSource maxSelectable](self, "maxSelectable");
  -[GKDashboardMultiplayerPickerDataSource selectedPlayers](self, "selectedPlayers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (!v14)
    goto LABEL_17;
  if (v14 == 1 && v17 == v19)
  {
    -[GKDashboardMultiplayerPickerDataSource showSelectionLimitAlert](self, "showSelectionLimitAlert");
LABEL_17:
    v20 = 0;
    goto LABEL_18;
  }
  v20 = 1;
  if (v14 >= 2 && v14 > v17 - v19)
  {
    -[GKDashboardMultiplayerPickerDataSource expandPlayerGroup:atIndexPath:inCollectionView:](self, "expandPlayerGroup:atIndexPath:inCollectionView:", v8, v9, v10);
    goto LABEL_17;
  }
LABEL_18:

  return v20;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  NSMutableDictionary *playerStates;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;

  v6 = a3;
  v7 = a4;
  if (!-[GKDashboardMultiplayerPickerDataSource selectionShouldSkipDelegateResponse](self, "selectionShouldSkipDelegateResponse"))
  {
    if (!objc_msgSend(v7, "section"))
    {
      if (!-[GKCollectionDataSource isSearching](self, "isSearching")
        || (v15 = objc_msgSend(v7, "item"),
            -[GKDashboardMultiplayerPickerDataSource searchPlayersAndGroups](self, "searchPlayersAndGroups"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = objc_msgSend(v16, "count"),
            v16,
            v15 >= v17))
      {
        v8 = 0;
        goto LABEL_19;
      }
      -[GKDashboardMultiplayerPickerDataSource searchPlayersAndGroups](self, "searchPlayersAndGroups");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v10, "fromPeopleSuggester"))
        -[GKDashboardMultiplayerPickerDataSource donateGroupToPeopleSuggester:](self, "donateGroupToPeopleSuggester:", v10);
      v8 = -[GKDashboardMultiplayerPickerDataSource canSelectPlayerGroup:atIndexPath:inCollectionView:](self, "canSelectPlayerGroup:atIndexPath:inCollectionView:", v10, v7, v6);
LABEL_18:

      goto LABEL_19;
    }
    -[GKDashboardMultiplayerPickerDataSource playerForIndexPath:](self, "playerForIndexPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9)
      goto LABEL_6;
    playerStates = self->_playerStates;
    objc_msgSend(v9, "referenceKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](playerStates, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue");

    if (v14 == 2)
    {
LABEL_6:
      v8 = 0;
      goto LABEL_18;
    }
    if (self->_maxSelectable >= 1)
    {
      -[GKDashboardMultiplayerPickerDataSource selectedPlayers](self, "selectedPlayers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v19, "count") >= self->_maxSelectable)
      {
        -[GKDashboardMultiplayerPickerDataSource selectedPlayers](self, "selectedPlayers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "containsObject:", v10);

        if ((v21 & 1) == 0)
        {
          -[GKDashboardMultiplayerPickerDataSource showSelectionLimitAlert](self, "showSelectionLimitAlert");
          goto LABEL_6;
        }
      }
      else
      {

      }
    }
    v8 = objc_msgSend(v7, "section") != 2;
    goto LABEL_18;
  }
  v8 = 1;
LABEL_19:

  return v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!-[GKDashboardMultiplayerPickerDataSource selectionShouldSkipDelegateResponse](self, "selectionShouldSkipDelegateResponse"))
  {
    if (objc_msgSend(v7, "section"))
    {
      -[GKDashboardMultiplayerPickerDataSource playerForIndexPath:](self, "playerForIndexPath:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v8)
      {
        v19[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __82__GKDashboardMultiplayerPickerDataSource_collectionView_didSelectItemAtIndexPath___block_invoke;
        v16[3] = &unk_1E59C54B8;
        v16[4] = self;
        v17 = v6;
        v18 = v9;
        -[GKDashboardMultiplayerPickerDataSource didSelectPlayers:indexPath:dataSourceIdentifier:completion:](self, "didSelectPlayers:indexPath:dataSourceIdentifier:completion:", v10, v7, CFSTR("GKPickerMainDataSourceIdentifier"), v16);

      }
      else
      {
        -[GKDashboardMultiplayerPickerDataSource deselectItemAtIndexPath:animated:](self, "deselectItemAtIndexPath:animated:", v7, 0);
      }
      goto LABEL_10;
    }
    if (-[GKCollectionDataSource isSearching](self, "isSearching"))
    {
      v11 = objc_msgSend(v7, "item");
      -[GKDashboardMultiplayerPickerDataSource searchPlayersAndGroups](self, "searchPlayersAndGroups");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v11 < v13)
      {
        objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "reportEvent:type:", *MEMORY[0x1E0D25068], *MEMORY[0x1E0D24EA0]);

        -[GKDashboardMultiplayerPickerDataSource searchPlayersAndGroups](self, "searchPlayersAndGroups");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[GKDashboardMultiplayerPickerDataSource didSelectPlayerGroup:indexPath:dataSourceIdentifier:completion:](self, "didSelectPlayerGroup:indexPath:dataSourceIdentifier:completion:", v15, v7, CFSTR("GKPickerMainDataSourceIdentifier"), 0);

LABEL_10:
        goto LABEL_11;
      }
    }
    -[GKDashboardMultiplayerPickerDataSource deselectItemAtIndexPath:animated:](self, "deselectItemAtIndexPath:animated:", v7, 0);
  }
LABEL_11:

}

void __82__GKDashboardMultiplayerPickerDataSource_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isSearching") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "cellForItemAtIndexPath:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5[0] = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "updateVisibleItemsWithPlayers:excludedIndexPath:", v4, 0);

    }
  }
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!-[GKDashboardMultiplayerPickerDataSource selectionShouldSkipDelegateResponse](self, "selectionShouldSkipDelegateResponse"))
  {
    if (objc_msgSend(v7, "section"))
    {
      -[GKDashboardMultiplayerPickerDataSource playerForIndexPath:](self, "playerForIndexPath:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __84__GKDashboardMultiplayerPickerDataSource_collectionView_didDeselectItemAtIndexPath___block_invoke;
      v15[3] = &unk_1E59C54B8;
      v15[4] = self;
      v16 = v6;
      v17 = v8;
      v10 = v8;
      -[GKDashboardMultiplayerPickerDataSource didDeselectPlayers:indexPath:dataSourceIdentifier:completion:](self, "didDeselectPlayers:indexPath:dataSourceIdentifier:completion:", v9, v7, CFSTR("GKPickerMainDataSourceIdentifier"), v15);

LABEL_4:
      goto LABEL_8;
    }
    if (-[GKCollectionDataSource isSearching](self, "isSearching"))
    {
      v11 = objc_msgSend(v7, "item");
      -[GKDashboardMultiplayerPickerDataSource searchPlayersAndGroups](self, "searchPlayersAndGroups");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v11 < v13)
      {
        -[GKDashboardMultiplayerPickerDataSource searchPlayersAndGroups](self, "searchPlayersAndGroups");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[GKDashboardMultiplayerPickerDataSource didDeselectPlayerGroup:indexPath:dataSourceIdentifier:completion:](self, "didDeselectPlayerGroup:indexPath:dataSourceIdentifier:completion:", v14, v7, CFSTR("GKPickerMainDataSourceIdentifier"), 0);

        goto LABEL_4;
      }
    }
  }
LABEL_8:

}

void __84__GKDashboardMultiplayerPickerDataSource_collectionView_didDeselectItemAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isSearching") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "cellForItemAtIndexPath:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5[0] = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "updateVisibleItemsWithPlayers:excludedIndexPath:", v4, 0);

    }
  }
}

- (BOOL)_canShowMoreFriends
{
  int64_t v3;
  BOOL v4;
  BOOL v5;
  void *v6;
  unint64_t v7;

  v3 = -[GKDashboardMultiplayerPickerDataSource pickerOrigin](self, "pickerOrigin");
  v4 = -[GKDashboardMultiplayerPickerDataSource showsAllFriends](self, "showsAllFriends");
  if (v3 != 1)
    return !v4;
  if (v4)
    return 0;
  -[GKDashboardMultiplayerPickerDataSource friendPlayers](self, "friendPlayers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v5 = v7 > -[GKDashboardMultiplayerPickerDataSource numberOfFriendsToShowInitially](self, "numberOfFriendsToShowInitially")+ 1;

  return v5;
}

- (BOOL)shouldSelectPlayerGroup:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "players");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (-[GKDashboardMultiplayerPickerDataSource playerIsSelectable:](self, "playerIsSelectable:", v10, (_QWORD)v12))
        {
          if (!-[GKDashboardMultiplayerPickerDataSource playerIsSelected:](self, "playerIsSelected:", v10))
            goto LABEL_12;
          v7 = 1;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
LABEL_12:
    v7 = 0;
  }

  return v7 & 1;
}

- (void)expandPlayerGroup:(id)a3 atIndexPath:(id)a4 inCollectionView:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _TtC12GameCenterUI29GKExpandedGroupViewController *v18;
  void *v19;
  _TtC12GameCenterUI29GKExpandedGroupViewController *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reportEvent:type:", *MEMORY[0x1E0D25068], *MEMORY[0x1E0D24E70]);

  objc_msgSend(v28, "groupName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(v28, "players");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayNameWithOptions:", 0);
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }
  objc_msgSend(v28, "players");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12 < 2)
  {
    v17 = 0;
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    GKGameCenterUIFrameworkBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "players");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringWithFormat:", v15, objc_msgSend(v16, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v18 = [_TtC12GameCenterUI29GKExpandedGroupViewController alloc];
  GKGameCenterUIFrameworkBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[GKExpandedGroupViewController initWithNibName:bundle:](v18, "initWithNibName:bundle:", CFSTR("GKExpandedGroupViewController_iOS"), v19);

  -[GKExpandedGroupViewController setModalPresentationStyle:](v20, "setModalPresentationStyle:", 8);
  v21 = *MEMORY[0x1E0C9D648];
  v22 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v23 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v24 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  -[GKExpandedGroupViewController view](v20, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:", v21, v22, v23, v24);

  objc_msgSend(v28, "players");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExpandedGroupViewController configureWithPlayers:groupName:caption:playerSelectionProxy:](v20, "configureWithPlayers:groupName:caption:playerSelectionProxy:", v26, v7, v17, self);

  -[GKCollectionDataSource presentationViewController](self, "presentationViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "presentViewController:animated:completion:", v20, 1, 0);

}

- (void)updatePlayerGroups:(id)a3 forPlayers:(id)a4 excludedIndexPath:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  unint64_t v29;
  void *v30;
  int v31;
  GKDashboardMultiplayerPickerDataSource *v32;
  void *v33;
  void *v34;
  id obj;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v32 = self;
  v47 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v36 = a4;
  v8 = a5;
  v9 = objc_msgSend(v7, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 >= 1)
  {
    for (i = 0; i != v9; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", i, 0, v32);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v12);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v10;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v42 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
        if (objc_msgSend(v17, "compare:", v8))
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v17, "item"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "players");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v36);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "intersectsSet:", v21))
            objc_msgSend(v34, "addObject:", v17);

        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v14);
  }

  v22 = v34;
  if (objc_msgSend(v34, "count"))
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v23 = v34;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v38;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v38 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * k);
          v29 = objc_msgSend(v28, "item");
          if (v29 < objc_msgSend(v7, "count"))
          {
            objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v28, "item"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v33, "shouldSelectPlayerGroup:", v30);

            if (v31)
              objc_msgSend(v33, "selectItemAtIndexPath:animated:scrollPosition:", v28, 0, 0);
            else
              objc_msgSend(v33, "deselectItemAtIndexPath:animated:", v28, 0);
          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v25);
    }

    v22 = v34;
  }

}

- (void)updateVisibleItemsWithPlayers:(id)a3 indexPath:(id)a4 dataSourceIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  BOOL v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void (**v44)(_QWORD);
  void *v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  id obj;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(_QWORD))a6;
  if (-[GKCollectionDataSource isSearching](self, "isSearching"))
  {
    -[GKDashboardMultiplayerPickerDataSource searchPlayersAndGroups](self, "searchPlayersAndGroups");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardMultiplayerPickerDataSource updatePlayerGroups:forPlayers:excludedIndexPath:](self, "updatePlayerGroups:forPlayers:excludedIndexPath:", v14, v10, v11);

    if (v13)
      goto LABEL_43;
    goto LABEL_44;
  }
  v44 = v13;
  -[GKDashboardMultiplayerPickerDataSource candidateIndexPaths](self, "candidateIndexPaths");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v15;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
  if (!v16)
    goto LABEL_40;
  v17 = v16;
  v18 = *(_QWORD *)v61;
  v46 = v11;
  v47 = v10;
  v48 = v12;
  v49 = *(_QWORD *)v61;
  do
  {
    v19 = 0;
    v50 = v17;
    do
    {
      if (*(_QWORD *)v61 != v18)
        objc_enumerationMutation(obj);
      v20 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v19);
      if (!objc_msgSend(v20, "isEqual:", v11)
        || (objc_msgSend(v12, "isEqualToString:", CFSTR("GKPickerMainDataSourceIdentifier")) & 1) == 0)
      {
        if (-[GKCollectionDataSource isSearching](self, "isSearching"))
        {
          objc_msgSend(v11, "section");
          goto LABEL_38;
        }
        if (objc_msgSend(v20, "section") == 1)
        {
          v21 = objc_msgSend(v20, "item");
          -[GKDashboardMultiplayerPickerDataSource friendPlayers](self, "friendPlayers");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "count");

          v24 = v21 >= v23;
          v18 = v49;
          v17 = v50;
          if (!v24)
          {
            v58 = 0u;
            v59 = 0u;
            v56 = 0u;
            v57 = 0u;
            v25 = v10;
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
            if (v26)
            {
              v27 = v26;
              v28 = *(_QWORD *)v57;
LABEL_17:
              v29 = 0;
              while (1)
              {
                if (*(_QWORD *)v57 != v28)
                  objc_enumerationMutation(v25);
                v30 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v29);
                -[GKDashboardMultiplayerPickerDataSource friendPlayers](self, "friendPlayers");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "objectAtIndexedSubscript:", objc_msgSend(v20, "item"));
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v30) = objc_msgSend(v30, "isEqual:", v32);

                if ((_DWORD)v30)
                  goto LABEL_35;
                if (v27 == ++v29)
                {
                  v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
                  if (v27)
                    goto LABEL_17;
                  goto LABEL_36;
                }
              }
            }
            goto LABEL_36;
          }
        }
        if (objc_msgSend(v20, "section") == 2)
        {
          v33 = objc_msgSend(v20, "item");
          -[GKDashboardMultiplayerPickerDataSource nearbyPlayers](self, "nearbyPlayers");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "count");

          v24 = v33 >= v35;
          v17 = v50;
          if (!v24)
          {
            v54 = 0u;
            v55 = 0u;
            v52 = 0u;
            v53 = 0u;
            v25 = v10;
            v36 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
            if (v36)
            {
              v37 = v36;
              v38 = *(_QWORD *)v53;
LABEL_28:
              v39 = 0;
              while (1)
              {
                if (*(_QWORD *)v53 != v38)
                  objc_enumerationMutation(v25);
                v40 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v39);
                -[GKDashboardMultiplayerPickerDataSource nearbyPlayers](self, "nearbyPlayers");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "objectAtIndexedSubscript:", objc_msgSend(v20, "item"));
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v40) = objc_msgSend(v40, "isEqual:", v42);

                if ((_DWORD)v40)
                  break;
                if (v37 == ++v39)
                {
                  v37 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
                  v12 = v48;
                  if (v37)
                    goto LABEL_28;
                  goto LABEL_34;
                }
              }
LABEL_35:
              objc_msgSend(v45, "addObject:", v20);
LABEL_36:

              v11 = v46;
              v10 = v47;
              v12 = v48;
            }
            else
            {
LABEL_34:

              v11 = v46;
              v10 = v47;
            }
            v18 = v49;
            v17 = v50;
          }
        }
      }
LABEL_38:
      ++v19;
    }
    while (v19 != v17);
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
  }
  while (v17);
LABEL_40:

  if (objc_msgSend(v45, "count"))
  {
    -[GKDashboardMultiplayerPickerDataSource collectionView](self, "collectionView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardMultiplayerPickerDataSource updateSelectionStateForCollectionView:indexPaths:](self, "updateSelectionStateForCollectionView:indexPaths:", v43, v45);

  }
  v13 = v44;
  if (v44)
LABEL_43:
    v13[2](v13);
LABEL_44:

}

- (void)selectItemAtIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;

  v6 = a4;
  v8 = a3;
  -[GKDashboardMultiplayerPickerDataSource setSelectionShouldSkipDelegateResponse:](self, "setSelectionShouldSkipDelegateResponse:", 1);
  -[GKDashboardMultiplayerPickerDataSource collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectItemAtIndexPath:animated:scrollPosition:", v8, v6, a5);

  -[GKDashboardMultiplayerPickerDataSource setSelectionShouldSkipDelegateResponse:](self, "setSelectionShouldSkipDelegateResponse:", 0);
}

- (void)deselectItemAtIndexPath:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  -[GKDashboardMultiplayerPickerDataSource setSelectionShouldSkipDelegateResponse:](self, "setSelectionShouldSkipDelegateResponse:", 1);
  -[GKDashboardMultiplayerPickerDataSource collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deselectItemAtIndexPath:animated:", v6, v4);

  -[GKDashboardMultiplayerPickerDataSource setSelectionShouldSkipDelegateResponse:](self, "setSelectionShouldSkipDelegateResponse:", 0);
}

- (void)updateSelectionStateForCollectionView:(id)a3 indexPaths:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  GKDashboardMultiplayerPickerDataSource *v16;
  NSMutableDictionary *playerStates;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = a4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    v21 = *(_QWORD *)v25;
    do
    {
      v10 = 0;
      v22 = v8;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v10);
        -[GKDashboardMultiplayerPickerDataSource playerForIndexPath:](self, "playerForIndexPath:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "cellForItemAtIndexPath:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = v6;
          v15 = v13;
          v16 = self;
          playerStates = self->_playerStates;
          objc_msgSend(v12, "referenceKey");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](playerStates, "objectForKey:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "integerValue");

          objc_msgSend(v15, "setSelectable:", v20 != 2);
          objc_msgSend(v15, "setSelected:", v20 == 1);
          if (objc_msgSend(v15, "isSelected"))
            -[GKDashboardMultiplayerPickerDataSource selectItemAtIndexPath:animated:scrollPosition:](v16, "selectItemAtIndexPath:animated:scrollPosition:", v11, 0, 0);
          else
            -[GKDashboardMultiplayerPickerDataSource deselectItemAtIndexPath:animated:](v16, "deselectItemAtIndexPath:animated:", v11, 0);
          self = v16;

          v6 = v14;
          v9 = v21;
          v8 = v22;
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }

}

- (double)playerCellHeightInCollectionView:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  BOOL v6;
  double v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v4))
  {
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC48B8]) & 1) != 0)
    {
      v5 = 362.0;
      goto LABEL_15;
    }
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC48C0]) & 1) != 0)
    {
      v5 = 332.0;
      goto LABEL_15;
    }
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC48C8]) & 1) != 0)
    {
      v5 = 282.0;
      goto LABEL_15;
    }
    v6 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC48D0]) == 0;
    v7 = 202.0;
    v8 = 252.0;
  }
  else
  {
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC48F0]) & 1) != 0)
    {
      v5 = 78.0;
      goto LABEL_15;
    }
    v6 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC48F8]) == 0;
    v7 = 60.0;
    v8 = 78.0;
  }
  if (v6)
    v5 = v7;
  else
    v5 = v8;
LABEL_15:

  return v5;
}

- (id)attributedFriendFilterTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[GKDashboardMultiplayerPickerDataSource friendSortFilterScope](self, "friendSortFilterScope");
  GKGameCenterUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingString:", CFSTR(" "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v4);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("chevron.down"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentWithImage:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendAttributedString:", v8);

  return v5;
}

- (unint64_t)cornerMaskForSectionHeader
{
  return 3;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id *p_from;
  _BOOL4 v43;
  void *v44;
  void *v45;
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id from;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC48A8]))
  {
    v47 = v8;
    objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, CFSTR("friendsSectionHeaderReuseIdentifier"), v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[GKDashboardMultiplayerPickerDataSource headerTextForSection:](self, "headerTextForSection:", objc_msgSend(v10, "section"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:", v12);

    v13 = -[GKDashboardMultiplayerPickerDataSource cornerMaskForSectionHeader](self, "cornerMaskForSectionHeader");
    v14 = *MEMORY[0x1E0CD2A68];
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "colorWithAlphaComponent:", 0.08);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setMaskedCorners:", v13);

    objc_msgSend(v11, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCornerRadius:", 14.0);

    objc_msgSend(v11, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCornerCurve:", v14);

    objc_msgSend(v11, "setBackgroundColor:", v16);
    v20 = *MEMORY[0x1E0CD2EA0];
    objc_msgSend(v11, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setCompositingFilter:", v20);

    objc_msgSend(v11, "backgroundPlatterView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setMaskedCorners:", v13);

    objc_msgSend(v11, "backgroundPlatterView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setCornerRadius:", 14.0);

    objc_msgSend(v11, "backgroundPlatterView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setCornerCurve:", v14);

    objc_msgSend(v11, "backgroundPlatterView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setBackgroundColor:", v16);

    objc_msgSend(v11, "backgroundPlatterView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setCompositingFilter:", v20);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "titleLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setTextColor:", v31);

    objc_msgSend(v11, "titleLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setCompositingFilter:", v20);

    objc_msgSend(MEMORY[0x1E0DC1350], "_gkPreferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4AB8], 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v35);
    if (objc_msgSend(v10, "section") == 1)
    {
      objc_msgSend(v11, "setButtonTarget:", self);
      -[GKDashboardMultiplayerPickerDataSource delegate](self, "delegate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "createSortPickerMenu");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setButtonMenu:", v37);

      -[GKDashboardMultiplayerPickerDataSource attributedFriendFilterTitle](self, "attributedFriendFilterTitle");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAttributedButtonTitle:", v38);

      objc_msgSend(v11, "setButtonHidden:", 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTintColor:", v39);

    }
    else
    {
      objc_msgSend(v11, "setButtonHidden:", 1);
    }
    objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("GKDashBoardMultiplayerPickerView.SectionHeader"));
    objc_msgSend(v11, "titleLabel");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setAccessibilityIdentifier:", CFSTR("GKDashBoardMultiplayerPickerView.SectionHeaderTitle"));

    v8 = v47;
  }
  else
  {
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC48A0])
      && -[GKDashboardMultiplayerPickerDataSource _canShowMoreFriends](self, "_canShowMoreFriends")
      && objc_msgSend(v10, "section") == 1)
    {
      objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, CFSTR("friendsSectionFooterShowMoreFriendsReuseIdentifier"), v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      objc_initWeak(&from, v8);
      GKGameCenterUIFrameworkBundle();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setShowMoreText:", v41);

      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __103__GKDashboardMultiplayerPickerDataSource_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke;
      v50[3] = &unk_1E59C88F0;
      objc_copyWeak(&v51, &location);
      objc_copyWeak(&v52, &from);
      objc_msgSend(v11, "setActionHandler:", v50);
      objc_msgSend(v11, "setHidden:", 0);
      objc_destroyWeak(&v52);
      objc_destroyWeak(&v51);
      p_from = &from;
    }
    else
    {
      v43 = -[GKDashboardMultiplayerPickerDataSource isShowingAddFriendsFooter](self, "isShowingAddFriendsFooter");
      objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, CFSTR("friendsSectionFooterPlayWithFriendsReuseIdentifier"), v10);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v44;
      if (!v43)
      {
        objc_msgSend(v44, "setHidden:", 1);
        goto LABEL_14;
      }
      v11 = v44;
      objc_initWeak(&location, self);
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __103__GKDashboardMultiplayerPickerDataSource_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke_2;
      v48[3] = &unk_1E59C48A0;
      objc_copyWeak(&v49, &location);
      objc_msgSend(v11, "setAddFriendsHandler:", v48);
      objc_msgSend(v11, "setHidden:", objc_msgSend(v10, "section") != 1);
      p_from = &v49;
    }
    objc_destroyWeak(p_from);
    objc_destroyWeak(&location);

  }
LABEL_14:

  return v11;
}

void __103__GKDashboardMultiplayerPickerDataSource_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id to;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setShowsAllFriends:", 1);
    objc_copyWeak(&to, (id *)(a1 + 40));
    v4 = objc_loadWeakRetained(&to);
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadSections:", v5);

    v6 = objc_loadWeakRetained(&to);
    objc_msgSend(v6, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsFocusUpdate");

    objc_destroyWeak(&to);
  }

}

void __103__GKDashboardMultiplayerPickerDataSource_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke_2(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "pickerDatasourceDidSelectAddFriend:", v3);

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v8 = a3;
  v9 = a4;
  if (!a5
    || (+[GKDashboardButtonSectionHeaderView defaultHeight](GKDashboardButtonSectionHeaderView, "defaultHeight"), v11 = v10, -[GKCollectionDataSource isSearching](self, "isSearching"))|| (v12 = -[GKDashboardMultiplayerPickerDataSource nearbyOnly](self, "nearbyOnly"), a5 == 2)|| v12|| (v13 = 0.0, a5 == 1) && !-[GKDashboardMultiplayerPickerDataSource hasFriends](self, "hasFriends"))
  {
    v13 = *MEMORY[0x1E0C9D820];
    v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v14 = v13;
  v15 = v11;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)boundingSizeForItemsInCollectionView:(id)a3
{
  id v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v3 = a3;
  objc_msgSend(v3, "bounds");
  v5 = v4;
  objc_msgSend(v3, "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "sectionInset");
    v5 = v5 - v7 - v8;
  }
  objc_msgSend(v3, "bounds");
  v10 = v9;

  v11 = v5;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v7 = a3;
  -[GKDashboardMultiplayerPickerDataSource boundingSizeForItemsInCollectionView:](self, "boundingSizeForItemsInCollectionView:", v7);
  v10 = 0.0;
  if (a5 == 1)
  {
    v11 = v8;
    v12 = v9;
    if (!-[GKDashboardMultiplayerPickerDataSource nearbyOnly](self, "nearbyOnly")
      && !-[GKCollectionDataSource isSearching](self, "isSearching"))
    {
      if (-[GKDashboardMultiplayerPickerDataSource _canShowMoreFriends](self, "_canShowMoreFriends"))
      {
        objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "preferredContentSizeCategory");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v14))
        {
          if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0DC48B8]))
            v10 = 100.0;
          else
            v10 = 50.0;
          if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0DC48C0]))
            v10 = v10 + 40.0;
          if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0DC48C8]))
            v10 = v10 + 30.0;
          if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0DC48D0]))
            v10 = v10 + 20.0;
          if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0DC48D8]))
            v10 = v10 + 10.0;
        }
        else
        {
          v10 = 50.0;
        }

      }
      else if (-[GKDashboardMultiplayerPickerDataSource hasFriends](self, "hasFriends")
             && -[GKDashboardMultiplayerPickerDataSource isShowingAddFriendsFooter](self, "isShowingAddFriendsFooter"))
      {
        +[GKMultiplayerPickerAddFriendsSupplementary preferredHeightFitting:inTraitEnvironment:](_TtC12GameCenterUI42GKMultiplayerPickerAddFriendsSupplementary, "preferredHeightFitting:inTraitEnvironment:", v7, v11, v12);
        v10 = v15;
      }
    }
  }

  v16 = 0.0;
  v17 = v10;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)showSelectionLimitAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (!-[GKDashboardMultiplayerPickerDataSource selectionShouldSkipDelegateResponse](self, "selectionShouldSkipDelegateResponse"))
  {
    v14 = (id)objc_opt_new();
    GKGameCenterUIFrameworkBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTitle:", v4);

    v5 = (void *)MEMORY[0x1E0CB3940];
    GKGameCenterUIFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v7, -[GKDashboardMultiplayerPickerDataSource maxSelectable](self, "maxSelectable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMessage:", v8);

    v9 = (void *)MEMORY[0x1E0DC3448];
    GKGameCenterUIFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAction:", v12);

    -[GKCollectionDataSource presentationViewController](self, "presentationViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "presentViewController:animated:completion:", v14, 1, 0);

  }
}

- (void)didRemoveRecipientPlayers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", -1, -1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__GKDashboardMultiplayerPickerDataSource_didRemoveRecipientPlayers___block_invoke;
  v7[3] = &unk_1E59C4708;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[GKDashboardMultiplayerPickerDataSource didDeselectPlayers:indexPath:dataSourceIdentifier:completion:](self, "didDeselectPlayers:indexPath:dataSourceIdentifier:completion:", v6, v5, CFSTR("GKPickerMainDataSourceIdentifier"), v7);

}

void __68__GKDashboardMultiplayerPickerDataSource_didRemoveRecipientPlayers___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "isSearching") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cellForItemAtIndexPath:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v3, "updateVisibleItemsWithPlayers:excludedIndexPath:", *(_QWORD *)(a1 + 40), 0);

  }
}

- (void)didAddRecipientPlayers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", -1, -1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__GKDashboardMultiplayerPickerDataSource_didAddRecipientPlayers___block_invoke;
  v7[3] = &unk_1E59C4708;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[GKDashboardMultiplayerPickerDataSource didSelectPlayers:indexPath:dataSourceIdentifier:completion:](self, "didSelectPlayers:indexPath:dataSourceIdentifier:completion:", v6, v5, CFSTR("GKPickerMainDataSourceIdentifier"), v7);

}

void __65__GKDashboardMultiplayerPickerDataSource_didAddRecipientPlayers___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "isSearching") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cellForItemAtIndexPath:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v3, "updateVisibleItemsWithPlayers:excludedIndexPath:", *(_QWORD *)(a1 + 40), 0);

  }
}

- (void)didPickContact:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D25358];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithContact:", v5);

  -[GKDashboardMultiplayerPickerDataSource contactPlayers](self, "contactPlayers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6);

  if ((v8 & 1) == 0)
  {
    -[GKDashboardMultiplayerPickerDataSource contactPlayers](self, "contactPlayers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v6);

  }
  -[GKDashboardMultiplayerPickerDataSource playerStates](self, "playerStates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "referenceKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    -[GKDashboardMultiplayerPickerDataSource playerStates](self, "playerStates");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "referenceKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = &unk_1E5A5E370;
    objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E5A5E370, v14);

  }
  if (objc_msgSend(v12, "integerValue") == 1)
  {
    -[GKDashboardMultiplayerPickerDataSource delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "highlightAlreadySelectedPlayers:inGroup:", v16, 0);

  }
  else if (!objc_msgSend(v12, "integerValue"))
  {
    v17 = -[GKDashboardMultiplayerPickerDataSource maxSelectable](self, "maxSelectable");
    -[GKDashboardMultiplayerPickerDataSource selectedPlayers](self, "selectedPlayers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v17 == v19)
    {
      -[GKDashboardMultiplayerPickerDataSource showSelectionLimitAlert](self, "showSelectionLimitAlert");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", -1, -1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __57__GKDashboardMultiplayerPickerDataSource_didPickContact___block_invoke;
      v22[3] = &unk_1E59C4708;
      v22[4] = self;
      v23 = v6;
      -[GKDashboardMultiplayerPickerDataSource didSelectPlayers:indexPath:dataSourceIdentifier:completion:](self, "didSelectPlayers:indexPath:dataSourceIdentifier:completion:", v21, v20, CFSTR("GKPickerMainDataSourceIdentifier"), v22);

    }
  }

}

void __57__GKDashboardMultiplayerPickerDataSource_didPickContact___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isSearching") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cellForItemAtIndexPath:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6[0] = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "updateVisibleItemsWithPlayers:excludedIndexPath:", v5, 0);

    }
  }
}

- (int64_t)getSelectedPlayerCount
{
  void *v2;
  int64_t v3;

  -[GKDashboardMultiplayerPickerDataSource selectedPlayers](self, "selectedPlayers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)didSelectPlayerGroup:(id)a3 indexPath:(id)a4 dataSourceIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v32 = a4;
  v31 = a5;
  v30 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = v10;
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v10, "players");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        -[GKDashboardMultiplayerPickerDataSource playerStates](self, "playerStates");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "referenceKey");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "integerValue");

        if (!v20)
        {
          objc_msgSend(v34, "addObject:", v16);
          -[GKDashboardMultiplayerPickerDataSource playerStates](self, "playerStates");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "referenceKey");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_1E5A5E388, v22);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v33, "fromPeopleSuggester"))
  {
    objc_msgSend(v33, "players");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (v24 >= 2)
    {
      -[GKDashboardMultiplayerPickerDataSource selectedMessageGroups](self, "selectedMessageGroups");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
        v26 = (void *)objc_opt_new();
        -[GKDashboardMultiplayerPickerDataSource setSelectedMessageGroups:](self, "setSelectedMessageGroups:", v26);

      }
      -[GKDashboardMultiplayerPickerDataSource selectedMessageGroups](self, "selectedMessageGroups");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addObject:", v33);

    }
  }
  -[GKDashboardMultiplayerPickerDataSource delegate](self, "delegate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "pickerDatasource:didSelectPlayers:inGroup:", self, v34, v33);

  objc_msgSend(v33, "players");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardMultiplayerPickerDataSource updateVisibleItemsWithPlayers:indexPath:dataSourceIdentifier:completion:](self, "updateVisibleItemsWithPlayers:indexPath:dataSourceIdentifier:completion:", v29, v32, v31, v30);

}

- (void)didSelectPlayers:(id)a3 indexPath:(id)a4 dataSourceIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v15);
        -[GKDashboardMultiplayerPickerDataSource playerStates](self, "playerStates");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "referenceKey");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "integerValue");

        if (!v20)
        {
          objc_msgSend(v27, "addObject:", v16);
          -[GKDashboardMultiplayerPickerDataSource playerStates](self, "playerStates");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "referenceKey");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_1E5A5E388, v22);

        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v13);
  }

  -[GKDashboardMultiplayerPickerDataSource delegate](self, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "pickerDatasource:didSelectPlayers:inGroup:", self, v27, 0);

  -[GKDashboardMultiplayerPickerDataSource updateVisibleItemsWithPlayers:indexPath:dataSourceIdentifier:completion:](self, "updateVisibleItemsWithPlayers:indexPath:dataSourceIdentifier:completion:", v11, v26, v25, v24);
}

- (void)didDeselectPlayerGroup:(id)a3 indexPath:(id)a4 dataSourceIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v29 = a4;
  v28 = a5;
  v27 = a6;
  -[GKDashboardMultiplayerPickerDataSource selectedMessageGroups](self, "selectedMessageGroups");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObject:", v10);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v30 = v10;
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v10, "players");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        -[GKDashboardMultiplayerPickerDataSource playerStates](self, "playerStates");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "referenceKey");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "integerValue");

        if (v21 == 1)
        {
          objc_msgSend(v31, "addObject:", v17);
          -[GKDashboardMultiplayerPickerDataSource playerStates](self, "playerStates");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "referenceKey");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", &unk_1E5A5E370, v23);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v14);
  }

  -[GKDashboardMultiplayerPickerDataSource delegate](self, "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "pickerDatasource:didDeselectPlayers:inGroup:", self, v31, v30);

  -[GKDashboardMultiplayerPickerDataSource updateMessageGroupsPlayerSelection](self, "updateMessageGroupsPlayerSelection");
  objc_msgSend(v30, "players");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardMultiplayerPickerDataSource updateVisibleItemsWithPlayers:indexPath:dataSourceIdentifier:completion:](self, "updateVisibleItemsWithPlayers:indexPath:dataSourceIdentifier:completion:", v25, v29, v28, v27);

  if (objc_msgSend(v30, "isNearby"))
  {
    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "reportEvent:type:", *MEMORY[0x1E0D25068], *MEMORY[0x1E0D24E88]);

  }
}

- (void)didDeselectPlayers:(id)a3 indexPath:(id)a4 dataSourceIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v40 = a4;
  v39 = a5;
  v38 = a6;
  if ((unint64_t)objc_msgSend(v10, "count") >= 2)
  {
    -[GKDashboardMultiplayerPickerDataSource selectedMessageGroups](self, "selectedMessageGroups");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      -[GKDashboardMultiplayerPickerDataSource selectedMessageGroups](self, "selectedMessageGroups");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v47;
LABEL_5:
        v17 = 0;
        while (1)
        {
          if (*(_QWORD *)v47 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v17);
          v19 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend(v18, "players");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setWithArray:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v21, "isEqualToSet:", v22) & 1) != 0)
            break;

          if (v15 == ++v17)
          {
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
            if (v15)
              goto LABEL_5;
            goto LABEL_14;
          }
        }
        v23 = v18;

        if (!v23)
          goto LABEL_15;
        -[GKDashboardMultiplayerPickerDataSource selectedMessageGroups](self, "selectedMessageGroups");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "removeObject:", v23);

        v13 = v23;
      }
LABEL_14:

    }
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v25 = v10;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v43 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        -[GKDashboardMultiplayerPickerDataSource playerStates](self, "playerStates");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "referenceKey");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKeyedSubscript:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "integerValue");

        if (v34 == 1)
        {
          objc_msgSend(v41, "addObject:", v30);
          -[GKDashboardMultiplayerPickerDataSource playerStates](self, "playerStates");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "referenceKey");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setObject:forKeyedSubscript:", &unk_1E5A5E370, v36);

        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v27);
  }

  -[GKDashboardMultiplayerPickerDataSource delegate](self, "delegate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "pickerDatasource:didDeselectPlayers:inGroup:", self, v41, 0);

  -[GKDashboardMultiplayerPickerDataSource updateMessageGroupsPlayerSelection](self, "updateMessageGroupsPlayerSelection");
  -[GKDashboardMultiplayerPickerDataSource updateVisibleItemsWithPlayers:indexPath:dataSourceIdentifier:completion:](self, "updateVisibleItemsWithPlayers:indexPath:dataSourceIdentifier:completion:", v25, v40, v39, v38);

}

- (void)updateMessageGroupsPlayerSelection
{
  uint64_t i;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id obj;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  _QWORD v33[5];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v28 = (void *)objc_opt_new();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[GKDashboardMultiplayerPickerDataSource selectedMessageGroups](self, "selectedMessageGroups");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v43 != v29)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v31 = v4;
        objc_msgSend(v4, "players");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v39;
          while (2)
          {
            for (j = 0; j != v7; ++j)
            {
              if (*(_QWORD *)v39 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
              -[GKDashboardMultiplayerPickerDataSource playerStates](self, "playerStates");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "referenceKey");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "objectForKeyedSubscript:", v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "integerValue");

              if (!v14)
              {
                objc_msgSend(v28, "addObject:", v31);
                goto LABEL_16;
              }
            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
            if (v7)
              continue;
            break;
          }
        }
LABEL_16:

      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v30);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = v28;
  v15 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v35;
    v18 = MEMORY[0x1E0C809B0];
    do
    {
      for (k = 0; k != v16; ++k)
      {
        if (*(_QWORD *)v35 != v17)
          objc_enumerationMutation(v32);
        v20 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * k);
        -[GKDashboardMultiplayerPickerDataSource selectedMessageGroups](self, "selectedMessageGroups");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "removeObject:", v20);

        -[GKDashboardMultiplayerPickerDataSource delegate](self, "delegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "players");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "pickerDatasource:didDeselectPlayers:inGroup:", self, v23, v20);

        objc_msgSend(v20, "players");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = v18;
        v33[1] = 3221225472;
        v33[2] = __76__GKDashboardMultiplayerPickerDataSource_updateMessageGroupsPlayerSelection__block_invoke;
        v33[3] = &unk_1E59C8918;
        v33[4] = self;
        objc_msgSend(v24, "_gkFilterWithBlock:", v33);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        -[GKDashboardMultiplayerPickerDataSource delegate](self, "delegate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "pickerDatasource:didSelectPlayers:inGroup:", self, v25, 0);

      }
      v16 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    }
    while (v16);
  }

}

id __76__GKDashboardMultiplayerPickerDataSource_updateMessageGroupsPlayerSelection__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "playerStates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "referenceKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  if (v7 == 1)
    v8 = v3;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

- (id)candidateIndexPaths
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[GKCollectionDataSource isSearching](self, "isSearching"))
  {
    -[GKDashboardMultiplayerPickerDataSource friendPlayers](self, "friendPlayers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5 >= 1)
    {
      for (i = 0; i != v5; ++i)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", i, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v7);

      }
    }
  }
  return v3;
}

- (BOOL)playerIsSelectable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  -[GKDashboardMultiplayerPickerDataSource playerStates](self, "playerStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "referenceKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  return v8 != 2;
}

- (BOOL)playerIsSelected:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  -[GKDashboardMultiplayerPickerDataSource playerStates](self, "playerStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "referenceKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  return v8 == 1;
}

- (void)donateGroupToPeopleSuggester:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v3 = objc_alloc_init(MEMORY[0x1E0D70970]);
  objc_msgSend(v15, "players");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v15, "players");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "suggestedHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v15;
    if (v8)
    {
      objc_msgSend(v15, "players");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "contact");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "suggestedHandle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "gameCenterSuggestionConsumedWithContactHandle:", v13);

LABEL_7:
      goto LABEL_8;
    }
  }
  else
  {

    v9 = v15;
  }
  objc_msgSend(v9, "conversationIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v15, "conversationIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "gameCenterSuggestionConsumedWithGroupIdentifier:", v10);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)didAttemptSelectingAlreadySelectedPlayers:(id)a3 inGroup:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[GKDashboardMultiplayerPickerDataSource delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[GKDashboardMultiplayerPickerDataSource delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "highlightAlreadySelectedPlayers:inGroup:", v9, v6);

  }
}

- (void)expandedGroupViewControllerWillDismiss
{
  -[GKDashboardMultiplayerPickerDataSource setShowingExpandedSearch:](self, "setShowingExpandedSearch:", 0);
}

- (void)handleLongPressGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  id v19;

  v4 = a3;
  -[GKDashboardMultiplayerPickerDataSource collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[GKDashboardMultiplayerPickerDataSource collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "indexPathForItemAtPoint:", v7, v9);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v19, "section"))
  {
    if (-[GKCollectionDataSource isSearching](self, "isSearching"))
    {
      if ((objc_msgSend(v19, "item") & 0x8000000000000000) == 0)
      {
        v11 = objc_msgSend(v19, "item");
        -[GKDashboardMultiplayerPickerDataSource searchPlayersAndGroups](self, "searchPlayersAndGroups");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        if (v11 < v13)
        {
          -[GKDashboardMultiplayerPickerDataSource searchPlayersAndGroups](self, "searchPlayersAndGroups");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v19, "item"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "players");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "count");

          if (v17 >= 2)
          {
            -[GKDashboardMultiplayerPickerDataSource collectionView](self, "collectionView");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[GKDashboardMultiplayerPickerDataSource expandPlayerGroup:atIndexPath:inCollectionView:](self, "expandPlayerGroup:atIndexPath:inCollectionView:", v15, v19, v18);

          }
        }
      }
    }
  }

}

- (NSMutableDictionary)playerStates
{
  return self->_playerStates;
}

- (void)setPlayerStates:(id)a3
{
  objc_storeStrong((id *)&self->_playerStates, a3);
}

- (int64_t)maxSelectable
{
  return self->_maxSelectable;
}

- (void)setMaxSelectable:(int64_t)a3
{
  self->_maxSelectable = a3;
}

- (BOOL)showsAllFriends
{
  return self->_showsAllFriends;
}

- (void)setShowsAllFriends:(BOOL)a3
{
  self->_showsAllFriends = a3;
}

- (int)numberOfFriendsToShowInitially
{
  return self->_numberOfFriendsToShowInitially;
}

- (void)setNumberOfFriendsToShowInitially:(int)a3
{
  self->_numberOfFriendsToShowInitially = a3;
}

- (BOOL)showingExpandedSearch
{
  return self->_showingExpandedSearch;
}

- (void)setShowingExpandedSearch:(BOOL)a3
{
  self->_showingExpandedSearch = a3;
}

- (BOOL)supportsNearby
{
  return self->_supportsNearby;
}

- (BOOL)nearbyOnly
{
  return self->_nearbyOnly;
}

- (void)setNearbyOnly:(BOOL)a3
{
  self->_nearbyOnly = a3;
}

- (GKDashboardNearbyBrowserDelegate)nearbyDelegate
{
  return self->_nearbyDelegate;
}

- (void)setNearbyDelegate:(id)a3
{
  self->_nearbyDelegate = (GKDashboardNearbyBrowserDelegate *)a3;
}

- (id)nearbyPlayersChangedHandler
{
  return self->_nearbyPlayersChangedHandler;
}

- (void)setNearbyPlayersChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (int64_t)friendSortFilterScope
{
  return self->_friendSortFilterScope;
}

- (GKDashboardMultiplayerPickerDatasourceDelegate)delegate
{
  return (GKDashboardMultiplayerPickerDatasourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableSet)selectedMessageGroups
{
  return self->_selectedMessageGroups;
}

- (void)setSelectedMessageGroups:(id)a3
{
  objc_storeStrong((id *)&self->_selectedMessageGroups, a3);
}

- (NSMutableArray)contactPlayers
{
  return self->_contactPlayers;
}

- (void)setContactPlayers:(id)a3
{
  objc_storeStrong((id *)&self->_contactPlayers, a3);
}

- (NSArray)friendPlayers
{
  return self->_friendPlayers;
}

- (void)setFriendPlayers:(id)a3
{
  objc_storeStrong((id *)&self->_friendPlayers, a3);
}

- (NSArray)suggestedPlayers
{
  return self->_suggestedPlayers;
}

- (void)setSuggestedPlayers:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedPlayers, a3);
}

- (NSMutableArray)suggestedPlayerGroups
{
  return self->_suggestedPlayerGroups;
}

- (void)setSuggestedPlayerGroups:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedPlayerGroups, a3);
}

- (NSMutableArray)nearbyPlayers
{
  return self->_nearbyPlayers;
}

- (void)setNearbyPlayers:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyPlayers, a3);
}

- (NSArray)searchPlayersAndGroups
{
  return self->_searchPlayersAndGroups;
}

- (void)setSearchPlayersAndGroups:(id)a3
{
  objc_storeStrong((id *)&self->_searchPlayersAndGroups, a3);
}

- (NSMutableSet)previouslyInvitedPlayers
{
  return self->_previouslyInvitedPlayers;
}

- (void)setPreviouslyInvitedPlayers:(id)a3
{
  objc_storeStrong((id *)&self->_previouslyInvitedPlayers, a3);
}

- (BOOL)browsingForNearbyPlayers
{
  return self->_browsingForNearbyPlayers;
}

- (BOOL)didLoad
{
  return self->_didLoad;
}

- (void)setDidLoad:(BOOL)a3
{
  self->_didLoad = a3;
}

- (BOOL)excludesContacts
{
  return self->_excludesContacts;
}

- (void)setExcludesContacts:(BOOL)a3
{
  self->_excludesContacts = a3;
}

- (int64_t)pickerOrigin
{
  return self->_pickerOrigin;
}

- (void)setPickerOrigin:(int64_t)a3
{
  self->_pickerOrigin = a3;
}

- (GKContactDataSource)contactSource
{
  return self->_contactSource;
}

- (void)setContactSource:(id)a3
{
  objc_storeStrong((id *)&self->_contactSource, a3);
}

- (BOOL)selectionShouldSkipDelegateResponse
{
  return self->_selectionShouldSkipDelegateResponse;
}

- (void)setSelectionShouldSkipDelegateResponse:(BOOL)a3
{
  self->_selectionShouldSkipDelegateResponse = a3;
}

- (BOOL)isShowingNearbyExpanded
{
  return self->_isShowingNearbyExpanded;
}

- (void)setIsShowingNearbyExpanded:(BOOL)a3
{
  self->_isShowingNearbyExpanded = a3;
}

- (_TtC12GameCenterUI26GKSuggestionsContainerCell)suggestionContainerCell
{
  return (_TtC12GameCenterUI26GKSuggestionsContainerCell *)objc_loadWeakRetained((id *)&self->_suggestionContainerCell);
}

- (void)setSuggestionContainerCell:(id)a3
{
  objc_storeWeak((id *)&self->_suggestionContainerCell, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_suggestionContainerCell);
  objc_storeStrong((id *)&self->_contactSource, 0);
  objc_storeStrong((id *)&self->_previouslyInvitedPlayers, 0);
  objc_storeStrong((id *)&self->_searchPlayersAndGroups, 0);
  objc_storeStrong((id *)&self->_nearbyPlayers, 0);
  objc_storeStrong((id *)&self->_suggestedPlayerGroups, 0);
  objc_storeStrong((id *)&self->_suggestedPlayers, 0);
  objc_storeStrong((id *)&self->_friendPlayers, 0);
  objc_storeStrong((id *)&self->_contactPlayers, 0);
  objc_storeStrong((id *)&self->_selectedMessageGroups, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_nearbyPlayersChangedHandler, 0);
  objc_storeStrong((id *)&self->_playerStates, 0);
}

- (void)defaultFilterScopeFromPickerOrigin:(uint64_t)a3 .cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  objc_msgSend(v4, "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_3_3(&dword_1AB361000, v7, v8, "Previous sort preference for %@: %@.", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_1_0();
}

- (void)setFriendSortFilterScope:(uint64_t)a3 .cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  objc_msgSend(v4, "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_3_3(&dword_1AB361000, v7, v8, "Remember sort preference for %@: %@.", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_1_0();
}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_4_cold_1(uint8_t *a1, void *a2, void *a3, _QWORD *a4)
{
  NSObject *v7;
  void *v8;

  v7 = a2;
  objc_msgSend(a3, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a4 = v8;
  _os_log_debug_impl(&dword_1AB361000, v7, OS_LOG_TYPE_DEBUG, "DashboardMultiplayerPickerDataSource - Adding player with contact identifier: %@", a1, 0xCu);

}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_4_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1AB361000, v0, v1, "DashboardMultiplayerPickerDatasource - error loading contacts from _PSRecipients: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_102_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1AB361000, v0, v1, "Filtered the array using predicate on friendBiDirectional:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_102_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1AB361000, v0, v1, "Going to filter the array using predicate (== 1) on friendBiDirectional: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_102_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1AB361000, v0, v1, "Multiplayer Player Picker->loadDataWithCompletionHandler: Error in player list: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_120_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1AB361000, v0, v1, "DashboardMultiplayerPickerDatasource - error loading player groups:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __72__GKDashboardMultiplayerPickerDataSource_loadDataWithCompletionHandler___block_invoke_2_124_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1AB361000, v0, v1, "DashboardMultiplayerPickerDatasource - error loading player profiles:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)setBrowsingForNearbyPlayers:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AB361000, log, OS_LOG_TYPE_ERROR, "nearbyDelegate is nil while setting browsing state for nearyby players", v1, 2u);
}

void __70__GKDashboardMultiplayerPickerDataSource_setNearbyPlayerID_reachable___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1AB361000, log, OS_LOG_TYPE_ERROR, "Error loading nearby player (%@) with identifier: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_4();
}

- (void)playerGroupCellForItemAtIndexPath:inCollectionView:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1AB361000, v0, v1, "playerGroupCellForItemAtIndexPath - Unexpected empty playerGroup at indexPath (%@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
