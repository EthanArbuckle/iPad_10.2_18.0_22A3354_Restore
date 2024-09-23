@implementation GKLeaderboardScoreViewController

- (GKLeaderboardScoreViewController)initWithGameRecord:(id)a3 leaderboard:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  void *v9;
  NSString *v10;
  _BOOL4 IsAccessibilityCategory;
  __CFString *v12;
  void *v13;
  GKLeaderboardScoreViewController *v14;
  void *v15;
  GKLeaderboardScoreDataSource *v16;
  GKLeaderboardScoreViewController *v17;
  _QWORD v19[4];
  GKLeaderboardScoreViewController *v20;
  id v21;
  id location;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  if ((GKIsXRUIIdiomShouldUsePadUI() & 1) != 0)
  {
    v8 = CFSTR("GKLeaderboardScoreViewController_xrOS");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferredContentSizeCategory");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v10);

    v12 = CFSTR("GKLeaderboardScoreViewController_iOS");
    if (IsAccessibilityCategory)
      v12 = CFSTR("GKLeaderboardScoreViewControllerAX_iOS");
    v8 = v12;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)GKLeaderboardScoreViewController;
  v14 = -[GKLoadingViewController initWithNibName:bundle:](&v23, sel_initWithNibName_bundle_, v8, v13);

  if (v14)
  {
    -[GKLeaderboardScoreViewController setInitialPlayerScope:](v14, "setInitialPlayerScope:", 1);
    -[GKLeaderboardScoreViewController setLeaderboard:](v14, "setLeaderboard:", v7);
    if (objc_msgSend(v7, "type") == 1)
      -[GKLeaderboardScoreViewController setCurrentOccurrence:](v14, "setCurrentOccurrence:", v7);
    objc_msgSend(v7, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardScoreViewController setTitle:](v14, "setTitle:", v15);

    -[GKLoadingViewController setLoadingIndicatorDelay:](v14, "setLoadingIndicatorDelay:", 0.0);
    v16 = -[GKLeaderboardScoreDataSource initWithGameRecord:leaderboard:]([GKLeaderboardScoreDataSource alloc], "initWithGameRecord:leaderboard:", v6, v7);
    objc_initWeak(&location, v14);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __67__GKLeaderboardScoreViewController_initWithGameRecord_leaderboard___block_invoke;
    v19[3] = &unk_1E59C8430;
    v17 = v14;
    v20 = v17;
    objc_copyWeak(&v21, &location);
    -[GKLeaderboardScoreDataSource setInviteFriendHandler:](v16, "setInviteFriendHandler:", v19);
    -[GKLeaderboardScoreViewController setDataSource:](v17, "setDataSource:", v16);
    objc_destroyWeak(&v21);

    objc_destroyWeak(&location);
  }

  return v14;
}

void __67__GKLeaderboardScoreViewController_initWithGameRecord_leaderboard___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  id *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!v3)
  {
    v11 = 2;
LABEL_7:
    objc_msgSend(*(id *)(a1 + 32), "leaderboard");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKMetricsBridge recordInviteFriendClickEventWithType:pageType:pageId:](_TtC12GameCenterUI15GKMetricsBridge, "recordInviteFriendClickEventWithType:pageType:pageId:", v11, CFSTR("leaderboard"), v13);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (!WeakRetained)
    {
LABEL_17:

      goto LABEL_18;
    }
    if (*MEMORY[0x1E0D253F8])
    {
      if (v4)
      {
        objc_msgSend(v4, "contact");
        v11 = objc_claimAutoreleasedReturnValue();
        v22[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = (void *)MEMORY[0x1E0C9AA60];
      }
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __67__GKLeaderboardScoreViewController_initWithGameRecord_leaderboard___block_invoke_3;
      v19[3] = &unk_1E59C58E0;
      v16 = &v20;
      v20 = WeakRetained;
      +[FriendRequestFacilitator makeViewControllerWithRecipients:chatGUID:completionHandler:](_TtC12GameCenterUI24FriendRequestFacilitator, "makeViewControllerWithRecipients:chatGUID:completionHandler:", v15, 0, v19);
      if (!v4)
        goto LABEL_16;
    }
    else
    {
      if (v4)
      {
        objc_msgSend(v4, "contact");
        v11 = objc_claimAutoreleasedReturnValue();
        v21 = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = (void *)MEMORY[0x1E0C9AA60];
      }
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __67__GKLeaderboardScoreViewController_initWithGameRecord_leaderboard___block_invoke_4;
      v17[3] = &unk_1E59C7260;
      v16 = &v18;
      v18 = WeakRetained;
      +[FriendRequestFacilitator makeViewControllerForRemoteInviteWithRecipients:chatGUID:resultHandler:](_TtC12GameCenterUI24FriendRequestFacilitator, "makeViewControllerForRemoteInviteWithRecipients:chatGUID:resultHandler:", v15, 0, v17);
      if (!v4)
        goto LABEL_16;
    }

LABEL_16:
    goto LABEL_17;
  }
  if (!objc_msgSend(v3, "supportsFriendingViaPush")
    || (objc_msgSend(v4, "contactAssociationID"), v5 = (void *)objc_claimAutoreleasedReturnValue(),
                                                  v5,
                                                  !v5))
  {
    v11 = 1;
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "leaderboard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKMetricsBridge recordInviteFriendClickEventWithType:pageType:pageId:](_TtC12GameCenterUI15GKMetricsBridge, "recordInviteFriendClickEventWithType:pageType:pageId:", 0, CFSTR("leaderboard"), v7);

  objc_msgSend(v4, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactAssociationID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[GameCenterObjcHelper sendFriendInvitationViaPushWithContactID:contactAssociationID:completionHandler:](_TtC12GameCenterUI20GameCenterObjcHelper, "sendFriendInvitationViaPushWithContactID:contactAssociationID:completionHandler:", v9, v10, &__block_literal_global_48);

LABEL_18:
}

uint64_t __67__GKLeaderboardScoreViewController_initWithGameRecord_leaderboard___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", a2, 1, 0);
}

void __67__GKLeaderboardScoreViewController_initWithGameRecord_leaderboard___block_invoke_4(uint64_t a1, void *a2, void *a3)
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

- (void)addLeaderboardHighlights
{
  void *v3;
  NSString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryIsAccessibilityCategory(v4))
  {
    v5 = CFSTR("GKLeaderboardMetadataViewAX_iOS");
  }
  else if ((GKIsXRUIIdiomShouldUsePadUI() & 1) != 0)
  {
    v5 = CFSTR("GKLeaderboardMetadataView_xrOS");
  }
  else
  {
    +[NSObject _gkPlatformNibName](GKLeaderboardMetadataView, "_gkPlatformNibName");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v14, "loadNibNamed:owner:options:", v5, self, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardScoreViewController setPersonalView:](self, "setPersonalView:", v7);

  objc_msgSend(v14, "loadNibNamed:owner:options:", v5, self, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardScoreViewController setSocialView:](self, "setSocialView:", v9);

  -[GKLeaderboardScoreViewController highlightView](self, "highlightView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardScoreViewController personalView](self, "personalView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addArrangedSubview:", v11);

  -[GKLeaderboardScoreViewController highlightView](self, "highlightView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardScoreViewController socialView](self, "socialView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addArrangedSubview:", v13);

  -[GKLeaderboardScoreViewController updateHighlights](self, "updateHighlights");
}

- (void)autoRefreshHighlightsPersonalView
{
  dispatch_time_t v3;
  _QWORD block[5];

  if (-[GKLeaderboardScoreViewController shouldAutoRefreshHighlights](self, "shouldAutoRefreshHighlights"))
  {
    if (!-[GKLeaderboardScoreViewController leaderboardOccurrence](self, "leaderboardOccurrence"))
      -[GKLeaderboardScoreViewController updateHighlightsPersonalView](self, "updateHighlightsPersonalView");
    v3 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__GKLeaderboardScoreViewController_autoRefreshHighlightsPersonalView__block_invoke;
    block[3] = &unk_1E59C4148;
    block[4] = self;
    dispatch_after(v3, MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __69__GKLeaderboardScoreViewController_autoRefreshHighlightsPersonalView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "autoRefreshHighlightsPersonalView");
}

- (id)attributedStringWithSymbol:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int ShouldUsePadUI;
  _QWORD *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CB3778];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = (void *)MEMORY[0x1E0DC12B0];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "textAttachmentWithImage:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  ShouldUsePadUI = GKIsXRUIIdiomShouldUsePadUI();
  v10 = (_QWORD *)MEMORY[0x1E0DC4B50];
  if (!ShouldUsePadUI)
    v10 = (_QWORD *)MEMORY[0x1E0DC4AE8];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendAttributedString:", v12);

  v13 = *MEMORY[0x1E0DC1140];
  v17[0] = *MEMORY[0x1E0DC1138];
  v17[1] = v13;
  v18[0] = v11;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAttributes:range:", v15, 0, objc_msgSend(v5, "length"));

  return v5;
}

- (BOOL)updateHighlightsPersonalView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
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
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  int64_t v39;
  unint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  _QWORD v76[2];

  v76[1] = *MEMORY[0x1E0C80C00];
  -[GKLeaderboardScoreViewController leaderboard](self, "leaderboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4 != 1)
  {
LABEL_4:
    if (-[GKLeaderboardScoreViewController hasData](self, "hasData")
      && (-[GKLeaderboardScoreViewController localPlayerEntry](self, "localPlayerEntry"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "rank"),
          v10,
          v11 >= 1))
    {
      -[GKLeaderboardScoreViewController leaderboard](self, "leaderboard");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "playerScope"))
      {

LABEL_8:
        -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "selectedSegmentIndex");
        v15 = (void *)MEMORY[0x1E0CB3940];
        GKGameCenterUIFrameworkBundle();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        GKGetLocalizedStringFromTableInBundle();
        if (v14 < 1)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[GKLeaderboardScoreViewController localPlayerEntry](self, "localPlayerEntry");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "localizedStringWithFormat:", v17, objc_msgSend(v19, "rank"), -[GKLeaderboardScoreViewController totalEntries](self, "totalEntries"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)MEMORY[0x1E0CB37E8];
          -[GKLeaderboardScoreViewController localPlayerEntry](self, "localPlayerEntry");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "numberWithInteger:", objc_msgSend(v19, "rank"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "localizedStringWithFormat:", v17, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

        }
        -[GKLeaderboardScoreViewController personalView](self, "personalView");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D25330], "local");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = v56;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[GKLeaderboardScoreViewController localPlayerEntry](self, "localPlayerEntry");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "formattedScore");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "configureWithPlayers:title:footnote:", v57, v59, v21);

        return 0;
      }
      v36 = -[GKLeaderboardScoreViewController totalEntries](self, "totalEntries");

      if (v36 < 1)
        goto LABEL_8;
      -[GKLeaderboardScoreViewController localPlayerEntry](self, "localPlayerEntry");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 100 * objc_msgSend(v37, "rank");
      v39 = v38 / -[GKLeaderboardScoreViewController totalEntries](self, "totalEntries");

      if (v39 <= 1)
        v40 = 1;
      else
        v40 = v39;
      -[GKLeaderboardScoreViewController localPlayerEntry](self, "localPlayerEntry");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "rank");

      if (v42 > 10)
      {
        if (v40 > 0xA)
          goto LABEL_8;
        -[GKLeaderboardScoreViewController personalView](self, "personalView");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D25330], "local");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v76[0] = v61;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 1);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = (void *)MEMORY[0x1E0CB3940];
        GKGameCenterUIFrameworkBundle();
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        GKGetLocalizedStringFromTableInBundle();
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v40);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "localizedStringWithFormat:", v65, v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = (void *)MEMORY[0x1E0CB3940];
        GKGameCenterUIFrameworkBundle();
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        GKGetLocalizedStringFromTableInBundle();
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "localizedStringWithFormat:", v70, -[GKLeaderboardScoreViewController totalEntries](self, "totalEntries"));
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "configureWithPlayers:title:footnote:", v62, v67, v71);

      }
      else
      {
        -[GKLeaderboardScoreViewController personalView](self, "personalView");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)MEMORY[0x1E0CB3940];
        GKGameCenterUIFrameworkBundle();
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        GKGetLocalizedStringFromTableInBundle();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)MEMORY[0x1E0CB37E8];
        -[GKLeaderboardScoreViewController localPlayerEntry](self, "localPlayerEntry");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "numberWithInteger:", objc_msgSend(v46, "rank"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "localizedStringWithFormat:", v44, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        GKGameCenterUIFrameworkBundle();
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        GKGetLocalizedStringFromTableInBundle();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = (void *)MEMORY[0x1E0CB3940];
        GKGameCenterUIFrameworkBundle();
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        GKGetLocalizedStringFromTableInBundle();
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "localizedStringWithFormat:", v53, -[GKLeaderboardScoreViewController totalEntries](self, "totalEntries"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "configureWithRank:title:footnote:vibrant:", v48, v50, v54, 1);

      }
    }
    else
    {
      -[GKLeaderboardScoreViewController personalView](self, "personalView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      GKGameCenterUIFrameworkBundle();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      GKGameCenterUIFrameworkBundle();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "configureWithRank:title:footnote:vibrant:", CFSTR("👏"), v24, v26, 0);

    }
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardScoreViewController leaderboard](self, "leaderboard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardScoreViewController leaderboard](self, "leaderboard");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "duration");
  objc_msgSend(v7, "dateByAddingTimeInterval:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "compare:", v9) != -1)
  {

    goto LABEL_4;
  }
  -[GKLeaderboardScoreViewController timeRemainingFromDate:toDate:](self, "timeRemainingFromDate:toDate:", v5, v9);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardScoreViewController attributedStringWithSymbol:](self, "attributedStringWithSymbol:", CFSTR("timer"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardScoreViewController personalView](self, "personalView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 1;
  objc_msgSend(v29, "configureWithRank:title:footnote:vibrant:", &stru_1E59EB978, v27, v31, 1);

  -[GKLeaderboardScoreViewController personalView](self, "personalView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "rank");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setAttributedText:", v28);

  -[GKLeaderboardScoreViewController personalView](self, "personalView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "configureVibrancy:", 1);

  return v32;
}

- (void)updateHighlights
{
  void *v3;
  uint64_t v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  _BOOL8 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  void *v67;
  _QWORD v68[2];

  v68[1] = *MEMORY[0x1E0C80C00];
  -[GKLeaderboardScoreViewController updateHighlightsPersonalView](self, "updateHighlightsPersonalView");
  if (!-[GKLeaderboardScoreViewController hasData](self, "hasData"))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectedSegmentIndex");
    GKGameCenterUIFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v10, 0);
    v64 = (id)objc_claimAutoreleasedReturnValue();

    -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "selectedSegmentIndex") == 1)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      GKGameCenterUIFrameworkBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringWithFormat:", v14, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      GKGameCenterUIFrameworkBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[GKLeaderboardScoreViewController socialView](self, "socialView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardScoreViewController formattedNumber:](self, "formattedNumber:", &unk_1E5A5E2F8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "configureWithRank:title:footnote:vibrant:", v17, v64, v15, 1);

    goto LABEL_20;
  }
  -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selectedSegmentIndex");

  if (v4 > 0)
  {
LABEL_3:
    -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "selectedSegmentIndex"))
    {
      v6 = -[GKLeaderboardScoreViewController totalEntries](self, "totalEntries");
    }
    else
    {
      -[GKLeaderboardScoreViewController localPlayerEntry](self, "localPlayerEntry");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "rank") > 0;
      v6 = -[GKLeaderboardScoreViewController totalEntries](self, "totalEntries") - v35;

    }
    v36 = (void *)MEMORY[0x1E0CB3940];
    -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v37, "selectedSegmentIndex"))
    {
      objc_msgSend(v36, "localizedStringWithFormat:", CFSTR("%ld"), v6);
      v64 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      GKGameCenterUIFrameworkBundle();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "localizedStringWithFormat:", v39, v6);
      v64 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v40, "selectedSegmentIndex") == 1)
    {
      v41 = (void *)MEMORY[0x1E0CB3940];
      GKGameCenterUIFrameworkBundle();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "localizedStringWithFormat:", v43, v6);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      GKGameCenterUIFrameworkBundle();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[GKLeaderboardScoreViewController socialView](self, "socialView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "configureWithRank:title:footnote:vibrant:", &stru_1E59EB978, v64, v44, 1);

    -[GKLeaderboardScoreViewController attributedStringWithSymbol:](self, "attributedStringWithSymbol:", CFSTR("globe"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardScoreViewController socialView](self, "socialView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "rank");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setAttributedText:", v46);

LABEL_20:
    return;
  }
  -[GKLeaderboardScoreViewController playerAboveEntry](self, "playerAboveEntry");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    -[GKLeaderboardScoreViewController playerBelowEntry](self, "playerBelowEntry");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49)
    {
      v50 = (void *)MEMORY[0x1E0D25310];
      -[GKLeaderboardScoreViewController localPlayerEntry](self, "localPlayerEntry");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLeaderboardScoreViewController playerBelowEntry](self, "playerBelowEntry");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "formattedDifferenceBetweenFirstScore:secondScore:", v51, v52);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v22, "length"))
        goto LABEL_30;
      -[GKLeaderboardScoreViewController socialView](self, "socialView");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLeaderboardScoreViewController playerBelowEntry](self, "playerBelowEntry");
      v65 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "player");
      v23 = v22;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLeaderboardScoreViewController playerBelowEntry](self, "playerBelowEntry");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "player");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "alias");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (void *)MEMORY[0x1E0CB3940];
      GKGameCenterUIFrameworkBundle();
      v55 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[GKLeaderboardScoreViewController localPlayerEntry](self, "localPlayerEntry");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "rank") < 2)
        goto LABEL_30;
      -[GKLeaderboardScoreViewController topPlayerEntry](self, "topPlayerEntry");
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v58)
        goto LABEL_3;
      v59 = (void *)MEMORY[0x1E0D25310];
      -[GKLeaderboardScoreViewController topPlayerEntry](self, "topPlayerEntry");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLeaderboardScoreViewController localPlayerEntry](self, "localPlayerEntry");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "formattedDifferenceBetweenFirstScore:secondScore:", v60, v61);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v22, "length"))
      {
LABEL_30:

        goto LABEL_3;
      }
      -[GKLeaderboardScoreViewController socialView](self, "socialView");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLeaderboardScoreViewController topPlayerEntry](self, "topPlayerEntry");
      v65 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "player");
      v23 = v22;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLeaderboardScoreViewController topPlayerEntry](self, "topPlayerEntry");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "player");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "alias");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (void *)MEMORY[0x1E0CB3940];
      GKGameCenterUIFrameworkBundle();
      v55 = (void *)objc_claimAutoreleasedReturnValue();
    }
    GKGetLocalizedStringFromTableInBundle();
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "localizedStringWithFormat:", v56, v23);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v63;
    objc_msgSend(v63, "configureWithPlayers:title:footnote:", v25, v53, v57);

    goto LABEL_25;
  }
  v19 = (void *)MEMORY[0x1E0D25310];
  -[GKLeaderboardScoreViewController playerAboveEntry](self, "playerAboveEntry");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardScoreViewController localPlayerEntry](self, "localPlayerEntry");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "formattedDifferenceBetweenFirstScore:secondScore:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v22, "length"))
    goto LABEL_30;
  -[GKLeaderboardScoreViewController socialView](self, "socialView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardScoreViewController playerAboveEntry](self, "playerAboveEntry");
  v65 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "player");
  v23 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardScoreViewController playerAboveEntry](self, "playerAboveEntry");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "player");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "alias");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x1E0CB3940];
  GKGameCenterUIFrameworkBundle();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "localizedStringWithFormat:", v31, v23);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v62;
  objc_msgSend(v62, "configureWithPlayers:title:footnote:", v25, v28, v32);

LABEL_25:
}

- (id)formattedNumber:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37F0], "localizedStringFromNumber:numberStyle:", a3, 1);
}

- (int64_t)initialTimeScope
{
  return sInitialTimeScope;
}

- (void)setInitialTimeScope:(int64_t)a3
{
  sInitialTimeScope = a3;
}

+ (BOOL)restrictToFriendsOnly
{
  return sRestrictToFriendsOnly;
}

+ (void)setRestrictToFriendsOnly:(BOOL)a3
{
  sRestrictToFriendsOnly = a3;
}

- (void)setupReleaseStateInfo
{
  void (**v3)(_QWORD);
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __57__GKLeaderboardScoreViewController_setupReleaseStateInfo__block_invoke;
  v25[3] = &unk_1E59C4148;
  v25[4] = self;
  v3 = (void (**)(_QWORD))_Block_copy(v25);
  if (_os_feature_enabled_impl()
    && (-[GKLeaderboardScoreViewController leaderboard](self, "leaderboard"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "releaseState"),
        v4,
        v5 == 2))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "symbolImageNamed:", CFSTR("clock.fill"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray2Color");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "CGColor");

    -[GKLeaderboardScoreViewController releaseStateInfoBox](self, "releaseStateInfoBox");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v8);

    -[GKLeaderboardScoreViewController releaseStateInfoBox](self, "releaseStateInfoBox");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCornerRadius:", 14.0);

    v13 = (void *)MEMORY[0x1E0DC1350];
    -[GKLeaderboardScoreViewController releaseStateInfoText](self, "releaseStateInfoText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "font");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pointSize");
    objc_msgSend(v13, "boldSystemFontOfSize:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = *MEMORY[0x1E0DC1138];
    v27[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0D25AC8], "PRERELEASE_ITEM");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithString:attributes:", v19, v17);
    -[GKLeaderboardScoreViewController releaseStateHeaderText](self, "releaseStateHeaderText");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAttributedText:", v20);

    objc_msgSend(MEMORY[0x1E0D25AC8], "LEADERBOARD_PENDING_APPROVAL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardScoreViewController releaseStateInfoText](self, "releaseStateInfoText");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setText:", v22);

    -[GKLeaderboardScoreViewController releaseStateIcon](self, "releaseStateIcon");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setImage:", v6);

  }
  else
  {
    v3[2](v3);
  }

}

void __57__GKLeaderboardScoreViewController_setupReleaseStateInfo__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "releaseStateInfoBox");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "heightAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToConstant:", 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:", 1);

  objc_msgSend(*(id *)(a1 + 32), "releaseStateInfoBox");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BYTE *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  int64_t timeScope;
  uint64_t v16;
  void *v17;
  void *v18;
  int64_t v19;
  void *v20;
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
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  void *v56;
  int v57;
  BOOL v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _BOOL4 v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  __CFString *v71;
  void *v72;
  NSString *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  const __CFString *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  void (*v85)(uint64_t, void *, void *, void *);
  void *v86;
  id v87;
  id location;
  objc_super v89;
  _QWORD v90[2];
  _QWORD v91[2];

  v91[1] = *MEMORY[0x1E0C80C00];
  v89.receiver = self;
  v89.super_class = (Class)GKLeaderboardScoreViewController;
  -[GKLeaderboardScoreViewController viewDidLoad](&v89, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0D25298], "daemonProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addDataUpdateDelegate:", self);

  -[UIViewController _gkExtensionViewController](self, "_gkExtensionViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardScoreViewController leaderboard](self, "leaderboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dashboardDidChangeToLeaderboardIdentifier:", v6);

  v7 = (_BYTE *)MEMORY[0x1E0D253F8];
  if (*MEMORY[0x1E0D253F8])
    -[GKLeaderboardScoreViewController setupVisualEffect](self, "setupVisualEffect");
  -[GKLeaderboardScoreViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardScoreViewController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setupCollectionView:", v8);

  -[GKLeaderboardScoreViewController dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPresentationViewController:", self);

  -[GKLeaderboardScoreViewController dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLeaderboardScoreDelegate:", self);

  -[GKLeaderboardScoreViewController leaderboard](self, "leaderboard");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "type") == 1;

  if (v13)
  {
    self->_timeScope = 2;
    -[GKLeaderboardScoreViewController timeScopeButton](self, "timeScopeButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLeaderboardOccurrence:", 0);

    self->_leaderboardOccurrence = 0;
    timeScope = self->_timeScope;
  }
  else
  {
    v16 = sInitialTimeScope;
    -[GKLeaderboardScoreViewController timeScopeButton](self, "timeScopeButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTimeScope:", v16);

    timeScope = sInitialTimeScope;
    self->_timeScope = sInitialTimeScope;
  }
  -[GKLeaderboardScoreViewController dataSource](self, "dataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTimeScope:", timeScope);

  v19 = -[GKLeaderboardScoreViewController initialPlayerScope](self, "initialPlayerScope");
  -[GKLeaderboardScoreViewController setPlayerScope:restrictToFriendsOnly:](self, "setPlayerScope:restrictToFriendsOnly:", v19, sRestrictToFriendsOnly);
  -[GKLeaderboardScoreViewController navigationItem](self, "navigationItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_setAutoScrollEdgeTransitionDistance:", 40.0);

  -[GKLeaderboardScoreViewController navigationItem](self, "navigationItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_setManualScrollEdgeAppearanceEnabled:", 1);

  -[GKLeaderboardScoreViewController navigationItem](self, "navigationItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setLargeTitleDisplayMode:", 2);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardScoreViewController collectionView](self, "collectionView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setBackgroundColor:", v23);

  -[GKLeaderboardScoreViewController collectionContainer](self, "collectionContainer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setCornerRadius:", 14.0);

  -[GKLeaderboardScoreViewController collectionContainer](self, "collectionContainer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

  -[GKLeaderboardScoreViewController collectionContainer](self, "collectionContainer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "layer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setMasksToBounds:", 1);

  -[GKLeaderboardScoreViewController configureCloseButton](self, "configureCloseButton");
  -[GKLeaderboardScoreViewController addLeaderboardHighlights](self, "addLeaderboardHighlights");
  -[GKLeaderboardScoreViewController addPlayerScopeControl](self, "addPlayerScopeControl");
  -[GKLeaderboardScoreViewController setupFadeGradient](self, "setupFadeGradient");
  objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "secondaryLabelCompositingFilter");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardScoreViewController timeScopeContainer](self, "timeScopeContainer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "layer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setCompositingFilter:", v32);

  -[GKLeaderboardScoreViewController configureTimeScopeMenu](self, "configureTimeScopeMenu");
  -[GKLeaderboardScoreViewController timeScopeButton](self, "timeScopeButton");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "titleLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setAdjustsFontForContentSizeCategory:", 1);

  -[GKLeaderboardScoreViewController scrollToTopButton](self, "scrollToTopButton");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "titleLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setAdjustsFontForContentSizeCategory:", 1);

  -[GKLeaderboardScoreViewController mainScrollView](self, "mainScrollView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setDelegate:", self);

  -[GKLeaderboardScoreViewController timeScopeButton](self, "timeScopeButton");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    v41 = objc_alloc_init(MEMORY[0x1E0DC37D0]);
    -[GKLeaderboardScoreViewController view](self, "view");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addLayoutGuide:", v41);

    -[GKLeaderboardScoreViewController timeScopeButton](self, "timeScopeButton");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v91[0] = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setPreferredFocusEnvironments:", v44);

    v45 = (void *)MEMORY[0x1E0CB3718];
    -[GKLeaderboardScoreViewController timeScopeButton](self, "timeScopeButton");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "superview");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "_gkInstallEdgeConstraintsForLayoutGuide:containedWithinParentView:", v41, v47);

  }
  if (*v7)
    goto LABEL_10;
  -[GKLeaderboardScoreViewController scrollToTopButton](self, "scrollToTopButton");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setTitleColor:forState:", v49, 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardScoreViewController view](self, "view");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setBackgroundColor:", v50);

  if (*v7)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "colorWithAlphaComponent:", 0.1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 1;
    v55 = v53;
  }
  else
  {
    v82 = (void *)MEMORY[0x1E0DC3658];
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "gk_dynamicColorWithLightColor:darkColor:", v52, v55);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0;
  }
  -[GKLeaderboardScoreViewController timeScopeContainer](self, "timeScopeContainer");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setBackgroundColor:", v53);

  if ((v54 & 1) == 0)
  v57 = *v7;
  v58 = *v7 == 0;
  v59 = (void *)MEMORY[0x1E0DC3658];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v60;
  if (v58)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "gk_dynamicColorWithLightColor:darkColor:", v61, v63);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v60, "colorWithAlphaComponent:", 0.08);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v62;
  }
  v64 = v57 == 0;
  -[GKLeaderboardScoreViewController collectionContainer](self, "collectionContainer");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setBackgroundColor:", v62);

  if (v64)
  -[GKLeaderboardScoreViewController collectionGradientView](self, "collectionGradientView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v90[0] = v66;
  -[GKLeaderboardScoreViewController highlightView](self, "highlightView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v90[1] = v67;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 2);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLoadingViewController setViewsToHideWhileLoading:](self, "setViewsToHideWhileLoading:", v68);

  objc_initWeak(&location, self);
  -[GKLeaderboardScoreViewController dataSource](self, "dataSource");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "gameRecord");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "name");
  v71 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "preferredContentSizeCategory");
  v73 = (NSString *)objc_claimAutoreleasedReturnValue();
  LODWORD(v70) = UIContentSizeCategoryIsAccessibilityCategory(v73);

  -[GKLeaderboardScoreViewController dataSource](self, "dataSource");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "gameRecord");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = MEMORY[0x1E0C809B0];
  v84 = 3221225472;
  v85 = __47__GKLeaderboardScoreViewController_viewDidLoad__block_invoke;
  v86 = &unk_1E59C8458;
  objc_copyWeak(&v87, &location);
  v76 = (id)objc_msgSend(v75, "loadIconForStyle:withCompletionHandler:", 1, &v83);

  -[GKLeaderboardScoreViewController scrollToTopButton](self, "scrollToTopButton", v83, v84, v85, v86);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v77;
  if ((_DWORD)v70)
    v79 = &stru_1E59EB978;
  else
    v79 = v71;
  objc_msgSend(v77, "setTitle:forState:", v79, 0);

  -[GKLeaderboardScoreViewController scrollToTopButton](self, "scrollToTopButton");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setContentHorizontalAlignment:", 4);

  -[GKLeaderboardScoreViewController scrollToTopButton](self, "scrollToTopButton");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setContentEdgeInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));

  -[GKLeaderboardScoreViewController setupReleaseStateInfo](self, "setupReleaseStateInfo");
  objc_destroyWeak(&v87);

  objc_destroyWeak(&location);
}

void __47__GKLeaderboardScoreViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id to;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7)
  {
    objc_copyWeak(&to, (id *)(a1 + 32));
    v10 = objc_loadWeakRetained(&to);
    objc_msgSend(v10, "gameIconImageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setImage:", v7);

    objc_destroyWeak(&to);
  }

}

- (id)timeRemainingFromDate:(id)a3 toDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_msgSend(v6, "timeIntervalSinceDate:", v5);
    v10 = v9;
    if (v9 < 0.0)
    {
      v11 = v5;

      v7 = v11;
    }
    if (v10 >= 259200.0)
    {
      v12 = (void *)MEMORY[0x1E0C99D68];
      v13 = v5;
      v14 = v7;
      v15 = 16;
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0C99D68];
      v13 = v5;
      v14 = v7;
      if (v10 < 86400.0)
      {
        v15 = 224;
        v16 = 1;
LABEL_11:
        objc_msgSend(v12, "_gkFormattedTimeIntervalStringWithStartDate:endDate:calendarUnits:style:", v13, v14, v15, v16);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      v15 = 48;
    }
    v16 = 2;
    goto LABEL_11;
  }
LABEL_12:

  return v8;
}

- (void)setupFadeGradient
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CD2790]);
  objc_msgSend(v3, "setLocations:", &unk_1E5A5EC08);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9[0] = objc_msgSend(v4, "CGColor");
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9[1] = objc_msgSend(v5, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColors:", v6);

  objc_msgSend(v3, "setStartPoint:", 0.5, 0.88);
  objc_msgSend(v3, "setEndPoint:", 0.5, 1.0);
  -[GKLeaderboardScoreViewController collectionGradientView](self, "collectionGradientView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMask:", v3);

  -[GKLeaderboardScoreViewController setCollectionViewFadeGradient:](self, "setCollectionViewFadeGradient:", v3);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[GKLeaderboardScoreViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDataSource:", 0);

  -[GKLeaderboardScoreViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  objc_msgSend(MEMORY[0x1E0D25298], "daemonProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeDataUpdateDelegate:", self);

  v6.receiver = self;
  v6.super_class = (Class)GKLeaderboardScoreViewController;
  -[GKLeaderboardScoreViewController dealloc](&v6, sel_dealloc);
}

- (void)viewWillAppear:(BOOL)a3
{
  __CFString *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)GKLeaderboardScoreViewController;
  -[GKLeaderboardScoreViewController viewWillAppear:](&v14, sel_viewWillAppear_, a3);
  -[GKLoadingViewController loadingState](self, "loadingState");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v4 == CFSTR("Initial"))
    -[GKLoadingViewController setLoadingState:](self, "setLoadingState:", CFSTR("LoadingState"));
  -[GKLeaderboardScoreViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  -[GKLeaderboardScoreViewController updatePlayerScopeLayoutForSize:](self, "updatePlayerScopeLayoutForSize:", v6, v7);

  -[GKLeaderboardScoreViewController enableDisableCollectionViewScrolling](self, "enableDisableCollectionViewScrolling");
  -[GKLeaderboardScoreViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionViewLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidateLayout");

  v10 = objc_alloc_init(MEMORY[0x1E0DC3D80]);
  objc_msgSend(v10, "addTarget:action:", self, sel_backButtonPressed_);
  objc_msgSend(v10, "setAllowedPressTypes:", &unk_1E5A5EC20);
  -[GKLeaderboardScoreViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addGestureRecognizer:", v10);

  -[GKLeaderboardScoreViewController leaderboard](self, "leaderboard");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "type");

  if (v13 == 1)
  {
    -[GKLeaderboardScoreViewController setShouldAutoRefreshHighlights:](self, "setShouldAutoRefreshHighlights:", 1);
    -[GKLeaderboardScoreViewController autoRefreshHighlightsPersonalView](self, "autoRefreshHighlightsPersonalView");
  }

}

- (void)backButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0DC37E0];
  objc_msgSend(MEMORY[0x1E0DC3F98], "keyWindow", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusSystemForEnvironment:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "focusedItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[GKLeaderboardScoreViewController setShouldPreferFocusToPlayerScopeControl:](self, "setShouldPreferFocusToPlayerScopeControl:", 1);
    -[GKLeaderboardScoreViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  }
  else
  {
    -[GKLeaderboardScoreViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "popViewControllerAnimated:", 1);

  }
}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  void **v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (-[GKLeaderboardScoreViewController shouldPreferFocusToPlayerScopeControl](self, "shouldPreferFocusToPlayerScopeControl")&& (-[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v3, v3))
  {
    -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v4;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = (void **)v19;
  }
  else
  {
    -[GKLeaderboardScoreViewController preferredFocusCell](self, "preferredFocusCell");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[GKLeaderboardScoreViewController preferredFocusCell](self, "preferredFocusCell");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v4;
      v5 = (void *)MEMORY[0x1E0C99D20];
      v6 = &v18;
    }
    else
    {
      -[GKLeaderboardScoreViewController dataSource](self, "dataSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localPlayerEntryIndexPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        goto LABEL_7;
      -[GKLeaderboardScoreViewController collectionView](self, "collectionView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cellForItemAtIndexPath:", v12);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
LABEL_7:
        -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          v15.receiver = self;
          v15.super_class = (Class)GKLeaderboardScoreViewController;
          -[GKLeaderboardScoreViewController preferredFocusEnvironments](&v15, sel_preferredFocusEnvironments);
          return (id)objc_claimAutoreleasedReturnValue();
        }
        -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v4;
        v5 = (void *)MEMORY[0x1E0C99D20];
        v6 = &v16;
      }
      else
      {
        v17 = v4;
        v5 = (void *)MEMORY[0x1E0C99D20];
        v6 = &v17;
      }
    }
  }
  objc_msgSend(v5, "arrayWithObjects:count:", v6, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)setupVisualEffect
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DC3F50], "_gkGameLayerBackgroundVisualEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundEffects:", v3);

  objc_msgSend(v7, "_setGroupName:", CFSTR("gameLayerGroup"));
  -[GKLeaderboardScoreViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertSubview:atIndex:", v7, 0);

  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)MEMORY[0x1E0CB3718];
  -[GKLeaderboardScoreViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_gkInstallEdgeConstraintsForView:containedWithinParentView:", v7, v6);

}

- (void)viewDidLayoutSubviews
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKLeaderboardScoreViewController;
  -[GKLeaderboardScoreViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__GKLeaderboardScoreViewController_viewDidLayoutSubviews__block_invoke;
  block[3] = &unk_1E59C4148;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __57__GKLeaderboardScoreViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "updateContentSize");
  objc_msgSend(*(id *)(a1 + 32), "collectionGradientView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "collectionViewFadeGradient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GKLeaderboardScoreViewController;
  -[GKLeaderboardScoreViewController viewDidAppear:](&v9, sel_viewDidAppear_, a3);
  self->_startTime = CFAbsoluteTimeGetCurrent();
  -[GKLeaderboardScoreViewController clearSelection](self, "clearSelection");
  -[GKLeaderboardScoreViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  -[GKLeaderboardScoreViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_rootSheetPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setShouldScaleDownBehindDescendantSheets:", 0);

  -[GKLeaderboardScoreViewController leaderboard](self, "leaderboard");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKMetricsBridge recordLeaderboardPageEventWithPageId:withReferrerData:](_TtC12GameCenterUI15GKMetricsBridge, "recordLeaderboardPageEventWithPageId:withReferrerData:", v8, -[GKLeaderboardScoreViewController isDeeplinked](self, "isDeeplinked"));

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v3 = a3;
  -[GKLeaderboardScoreViewController setShouldAutoRefreshHighlights:](self, "setShouldAutoRefreshHighlights:", 0);
  -[GKLeaderboardScoreViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllGestureRecognizers");

  objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D24D08];
  -[GKLeaderboardScoreViewController startTime](self, "startTime");
  objc_msgSend(v6, "reportScreenTimeEventForType:withStartTimestamp:", v7);

  v8.receiver = self;
  v8.super_class = (Class)GKLeaderboardScoreViewController;
  -[GKLeaderboardScoreViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, v3);
}

- (void)configureCloseButton
{
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0DC3518], "_gkXmarkedCloseButtonWithTarget:action:", self, sel_donePressed_);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D253F8];
  v7 = (id)v3;
  if (*MEMORY[0x1E0D253F8])
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v3);
  else
    v5 = 0;
  -[GKLeaderboardScoreViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

  if (v4)
}

- (void)loadData
{
  void *v3;
  _QWORD v4[5];

  -[GKLeaderboardScoreViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__GKLeaderboardScoreViewController_loadData__block_invoke;
  v4[3] = &unk_1E59C5DA0;
  v4[4] = self;
  objc_msgSend(v3, "loadDataWithCompletionHandler:", v4);

}

void __44__GKLeaderboardScoreViewController_loadData__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  uint64_t v21;
  id v22;

  v5 = a3;
  v6 = objc_msgSend(*(id *)(a1 + 32), "shouldRefreshAgain");
  v7 = *(void **)(a1 + 32);
  if (!v6)
  {
    objc_msgSend(v7, "dataUpdated:withError:", a2, v5);
    objc_msgSend(*(id *)(a1 + 32), "autoScrollToPlayerId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "autoScrollToPlayerId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "indexPathForPlayerId:", v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = objc_msgSend(v10, "autoScrollToLocalPlayerPosition");

      if (!v14)
      {
        v13 = 0;
LABEL_10:
        objc_msgSend(*(id *)(a1 + 32), "dataSource", v17, v18, v19, v20, v21);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setAutoScrollToLocalPlayerPosition:", 1);

        goto LABEL_11;
      }
      objc_msgSend(*(id *)(a1 + 32), "dataSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localPlayerEntryIndexPath");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }

    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "collectionView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setHidden:", 1);

      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __44__GKLeaderboardScoreViewController_loadData__block_invoke_2;
      v20 = &unk_1E59C4708;
      v21 = *(_QWORD *)(a1 + 32);
      v13 = v13;
      v22 = v13;
      dispatch_async(MEMORY[0x1E0C80D38], &v17);

    }
    goto LABEL_10;
  }
  objc_msgSend(v7, "setShouldRefreshAgain:", 0);
  objc_msgSend(*(id *)(a1 + 32), "loadData");
LABEL_11:

}

void __44__GKLeaderboardScoreViewController_loadData__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollToItemAtIndexPath:atScrollPosition:animated:", *(_QWORD *)(a1 + 40), 2, 0);

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsFocusUpdate");

}

- (BOOL)hasData
{
  void *v2;
  char v3;

  -[GKLeaderboardScoreViewController dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasData");

  return v3;
}

- (void)dataUpdated:(BOOL)a3 withError:(id)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSString *v25;
  _BOOL4 IsAccessibilityCategory;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v4 = a3;
  v32 = a4;
  -[GKLeaderboardScoreViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "itemCount");

  if (v7 >= 1)
  {
    -[GKLoadingViewController setLoadingState:](self, "setLoadingState:", CFSTR("LoadedState"));
    -[GKLeaderboardScoreViewController hideNoContentPlaceholder](self, "hideNoContentPlaceholder");
    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  -[GKLoadingViewController setLoadingState:](self, "setLoadingState:", CFSTR("NoContentState"));
  -[GKLeaderboardScoreViewController showNoContentPlaceholderForError:](self, "showNoContentPlaceholderForError:", v32);
  if (v4)
  {
LABEL_3:
    -[GKLeaderboardScoreViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentInset");
    v10 = -v9;
    -[GKLeaderboardScoreViewController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContentOffset:", 0.0, v10);

    -[GKLeaderboardScoreViewController collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reloadData");

    -[GKLeaderboardScoreViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  }
LABEL_4:
  -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "selectedSegmentIndex");

  if (!v14)
  {
    -[GKLeaderboardScoreViewController dataSource](self, "dataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "itemCount");

    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0D25018];
    v19 = *MEMORY[0x1E0D24BC8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reportEvent:type:friendsPlayedThisGame:", v18, v19, v20);

  }
  -[GKLeaderboardScoreViewController title](self, "title");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    -[GKLeaderboardScoreViewController leaderboard](self, "leaderboard");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "title");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardScoreViewController setTitle:](self, "setTitle:", v23);

    objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "preferredContentSizeCategory");
    v25 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v25);

    -[GKLeaderboardScoreViewController scrollToTopButton](self, "scrollToTopButton");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (IsAccessibilityCategory)
    {
      objc_msgSend(v27, "setTitle:forState:", &stru_1E59EB978, 0);
    }
    else
    {
      -[GKLeaderboardScoreViewController leaderboard](self, "leaderboard");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "title");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "uppercaseString");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setTitle:forState:", v31, 0);

    }
  }

}

- (void)showNoContentPlaceholderForError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  GKNoContentView *v8;
  GKNoContentView *v9;
  void *v10;
  void *v11;
  void *v12;
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
  void *v23;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[GKLeaderboardScoreViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[GKLeaderboardScoreViewController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 1);

    -[GKLeaderboardScoreViewController noContentView](self, "noContentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = [GKNoContentView alloc];
      -[UICollectionView bounds](self->_collectionView, "bounds");
      v9 = -[GKNoContentView initWithFrame:](v8, "initWithFrame:");
      -[GKLeaderboardScoreViewController setNoContentView:](self, "setNoContentView:", v9);

      -[GKLeaderboardScoreViewController noContentView](self, "noContentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[GKLeaderboardScoreViewController collectionView](self, "collectionView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "superview");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[GKLeaderboardScoreViewController noContentView](self, "noContentView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLeaderboardScoreViewController collectionView](self, "collectionView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "insertSubview:aboveSubview:", v13, v14);

      v15 = (void *)MEMORY[0x1E0CB3718];
      -[GKLeaderboardScoreViewController noContentView](self, "noContentView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLeaderboardScoreViewController collectionView](self, "collectionView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_gkConstraintsForView:withinView:insets:", v16, v17, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addConstraints:", v18);

      -[GKLeaderboardScoreViewController collectionGradientView](self, "collectionGradientView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLeaderboardScoreViewController highlightView](self, "highlightView", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v20;
      -[GKLeaderboardScoreViewController noContentView](self, "noContentView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24[2] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLoadingViewController setViewsToHideWhileLoading:](self, "setViewsToHideWhileLoading:", v22);

    }
    -[GKLeaderboardScoreViewController setupNoContentView:withError:](self, "setupNoContentView:withError:", self->_noContentView, v4);
    -[GKLeaderboardScoreViewController noContentView](self, "noContentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setHidden:", 0);

  }
}

- (void)hideNoContentPlaceholder
{
  void *v3;
  id v4;

  -[GKLeaderboardScoreViewController noContentView](self, "noContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[GKLeaderboardScoreViewController collectionView](self, "collectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

}

- (void)setupNoContentView:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t timeScope;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __65__GKLeaderboardScoreViewController_setupNoContentView_withError___block_invoke;
  v22 = &unk_1E59C8480;
  objc_copyWeak(&v23, &location);
  objc_msgSend(v6, "setButtonAction:", &v19);
  -[GKLeaderboardScoreViewController leaderboard](self, "leaderboard", v19, v20, v21, v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "type");

  if (v9 != 1)
  {
    timeScope = self->_timeScope;
    if (timeScope < 2)
    {
      GKGameCenterUIFrameworkBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTitle:", v14);

      GKGameCenterUIFrameworkBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setMessage:", v16);

      goto LABEL_7;
    }
    if (timeScope != 2)
      goto LABEL_8;
  }
  GKGameCenterUIFrameworkBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v11);

  objc_msgSend(v6, "setMessage:", 0);
LABEL_7:
  objc_msgSend(v6, "setButtonTitle:", 0);
LABEL_8:
  if (v7)
  {
    GKGameCenterUIFrameworkBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMessage:", v18);

  }
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

void __65__GKLeaderboardScoreViewController_setupNoContentView_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id to;

  v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 32));
  v4 = objc_loadWeakRetained(&to);

  if (v4)
  {
    v5 = objc_loadWeakRetained(&to);
    objc_msgSend(v5, "timeScopePressed:", v3);

  }
  objc_destroyWeak(&to);

}

- (void)addPlayerScopeControl
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  id v22;
  void *v23;
  void *v24;
  int64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  void *v32;
  id v33;
  double v34;
  uint64_t v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  GKGameCenterUIFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v4;
  GKGameCenterUIFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C58]), "initWithItems:", v7);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if (v10 == 1)
  {
    v11 = 140.0;
  }
  else if ((GKIsXRUIIdiomShouldUsePadUI() & 1) != 0)
  {
    v11 = 108.0;
  }
  else
  {
    -[GKLeaderboardScoreViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13;
    -[GKLeaderboardScoreViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v17 = v16;
    -[GKLeaderboardScoreViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    if (v14 >= v17)
      v21 = v20;
    else
      v21 = v19;
    v11 = (v21 + -40.0) / (double)(unint64_t)objc_msgSend(v7, "count");

  }
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = __57__GKLeaderboardScoreViewController_addPlayerScopeControl__block_invoke;
  v32 = &unk_1E59C5228;
  v22 = v8;
  v33 = v22;
  v34 = v11;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v29);
  objc_msgSend(v22, "addTarget:action:forControlEvents:", self, sel_playerScopeChanged_, 4096, v29, v30, v31, v32);
  v35 = *MEMORY[0x1E0CD2F28];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setBackgroundFilters:", v23);

  -[GKLeaderboardScoreViewController setPlayerScopeControl:](self, "setPlayerScopeControl:", v22);
  -[GKLeaderboardScoreViewController configurePlayerScopeFocusGuide](self, "configurePlayerScopeFocusGuide");
  v25 = -[GKLeaderboardScoreViewController playerScope](self, "playerScope");
  if (!v25)
  {
    -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = 1;
    goto LABEL_13;
  }
  if (v25 == 1)
  {
    -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = 0;
LABEL_13:
    objc_msgSend(v26, "setSelectedSegmentIndex:", v28);

  }
}

uint64_t __57__GKLeaderboardScoreViewController_addPlayerScopeControl__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setWidth:forSegmentAtIndex:", *(double *)(a1 + 40));
}

- (void)configurePlayerScopeFocusGuide
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  -[GKLeaderboardScoreViewController collectionContainer](self, "collectionContainer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0DC37D0]);
      -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPreferredFocusEnvironments:", v8);

      -[GKLeaderboardScoreViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addLayoutGuide:", v6);

      v20 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v6, "leadingAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLeaderboardScoreViewController view](self, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "leadingAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constraintEqualToAnchor:", v25);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v24;
      objc_msgSend(v6, "trailingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLeaderboardScoreViewController view](self, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "trailingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v21);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v28[1] = v19;
      objc_msgSend(v6, "topAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLeaderboardScoreViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "topAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v28[2] = v13;
      objc_msgSend(v6, "bottomAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLeaderboardScoreViewController collectionContainer](self, "collectionContainer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "topAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v28[3] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "activateConstraints:", v18);

    }
  }
}

- (void)updatePlayerScopeLayoutForSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
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
  void *v42;
  uint64_t v43;
  double v44;
  void *v45;
  uint64_t v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;

  height = a3.height;
  width = a3.width;
  if (GKIsXRUIIdiomShouldUsePadUI())
  {
    -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[GKLeaderboardScoreViewController addPlayerScopeControl](self, "addPlayerScopeControl");
    -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWidth:forSegmentAtIndex:", 0, 108.0);

    -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWidth:forSegmentAtIndex:", 1, 108.0);
LABEL_17:

    -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
    v62 = (id)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardScoreViewController navigationItem](self, "navigationItem");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setTitleView:", v62);

LABEL_22:
    return;
  }
  -[GKLeaderboardScoreViewController traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "verticalSizeClass");

  -[GKLeaderboardScoreViewController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_bottomPalette");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v10 == 2)
  {
    objc_msgSend(v12, "contentView");
    v62 = (id)objc_claimAutoreleasedReturnValue();

    -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "superview");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (!v62 || v15 != v62)
    {
      -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeFromSuperview");

      -[GKLeaderboardScoreViewController navigationItem](self, "navigationItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTitleView:", 0);

      v18 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4290]), "initWithContentView:", v18);
      -[GKLeaderboardScoreViewController navigationItem](self, "navigationItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_setBottomPalette:", v19);

      -[GKLeaderboardScoreViewController navigationItem](self, "navigationItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_bottomPalette");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "contentView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addSubview:", v24);

      v62 = v18;
    }
    -[GKLeaderboardScoreViewController navigationItem](self, "navigationItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_bottomPalette");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setPreferredHeight:", 60.0);

    objc_msgSend(v62, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v62, "widthAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "superview");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "widthAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setActive:", 1);

    objc_msgSend(v62, "heightAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToConstant:", 60.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setActive:", 1);

    -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "centerXAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "centerXAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setActive:", 1);

    -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40, -10.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setActive:", 1);

    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "userInterfaceIdiom");

    if (v43 == 1)
    {
      v44 = 140.0;
    }
    else if ((GKIsXRUIIdiom() & 1) != 0)
    {
      v44 = 100.0;
    }
    else
    {
      v44 = (width + -40.0) / 3.0;
    }
    -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setWidth:forSegmentAtIndex:", 0, v44);

    -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setWidth:forSegmentAtIndex:", 1, v44);

    -[GKLeaderboardScoreViewController configureFocusGuidesForPortraitNavigationBar](self, "configureFocusGuidesForPortraitNavigationBar");
    goto LABEL_22;
  }
  objc_msgSend(v12, "setPreferredHeight:", 0.0);

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "userInterfaceIdiom");

  if (v46 == 1)
    v47 = 140.0;
  else
    v47 = (height + -40.0) / 3.0;
  -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setWidth:forSegmentAtIndex:", 0, v47);

  -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setWidth:forSegmentAtIndex:", 1, v47);

  -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "superview");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardScoreViewController navigationItem](self, "navigationItem");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "titleView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51 != v53)
  {

LABEL_16:
    -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "removeFromSuperview");

    -[GKLeaderboardScoreViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_bottomPalette");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "contentView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "removeFromSuperview");

    goto LABEL_17;
  }
  -[GKLeaderboardScoreViewController navigationItem](self, "navigationItem");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "titleView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v59)
    goto LABEL_16;
}

- (void)configureFocusGuidesForPortraitNavigationBar
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
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
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[4];
  void *v63;
  _QWORD v64[4];
  _QWORD v65[3];

  v65[1] = *MEMORY[0x1E0C80C00];
  -[GKLeaderboardScoreViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0DC37D0]);
    -[GKLeaderboardScoreViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPreferredFocusEnvironments:", v8);

    -[GKLeaderboardScoreViewController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "navigationBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addLayoutGuide:", v5);

    v41 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v5, "leadingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardScoreViewController navigationController](self, "navigationController");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "navigationBar");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "leadingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v54);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v52;
    objc_msgSend(v5, "trailingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardScoreViewController navigationController](self, "navigationController");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "navigationBar");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v43);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v64[1] = v40;
    objc_msgSend(v5, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardScoreViewController navigationController](self, "navigationController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "navigationBar");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v64[2] = v12;
    objc_msgSend(v5, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardScoreViewController navigationController](self, "navigationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "navigationBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v16, 1.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v64[3] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "activateConstraints:", v18);

  }
  -[GKLeaderboardScoreViewController navigationItem](self, "navigationItem");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_bottomPalette");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "contentView");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
      return;
    v19 = objc_alloc_init(MEMORY[0x1E0DC37D0]);
    -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPreferredFocusEnvironments:", v25);

    -[GKLeaderboardScoreViewController navigationItem](self, "navigationItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_bottomPalette");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addLayoutGuide:", v19);

    v47 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v19, "centerXAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "centerXAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v59);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v57;
    objc_msgSend(v19, "centerYAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "centerYAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v51);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v62[1] = v49;
    objc_msgSend(v19, "widthAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardScoreViewController navigationItem](self, "navigationItem");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "_bottomPalette");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "widthAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v62[2] = v31;
    objc_msgSend(v19, "heightAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "heightAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v62[3] = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 4);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "activateConstraints:", v36);

  }
}

- (void)playerScopeChanged:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;

  v4 = a3;
  v5 = 1;
  -[GKLeaderboardScoreViewController setShouldPreferFocusToPlayerScopeControl:](self, "setShouldPreferFocusToPlayerScopeControl:", 1);
  -[GKLeaderboardScoreViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "playerScope");

  v8 = objc_msgSend(v4, "selectedSegmentIndex");
  if (v8)
  {
    if (v8 != 1)
    {
      v9 = 0;
      v5 = v7;
      goto LABEL_7;
    }
    v5 = 0;
    v9 = 0;
    v10 = (_QWORD *)MEMORY[0x1E0D24CD0];
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0D24CC8];
    v9 = 1;
  }
  objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reportEvent:type:", *MEMORY[0x1E0D25060], *v10);

LABEL_7:
  -[GKLeaderboardScoreViewController setPlayerScope:restrictToFriendsOnly:](self, "setPlayerScope:restrictToFriendsOnly:", v5, v9);
}

- (void)setPlayerScope:(int64_t)a3 restrictToFriendsOnly:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  -[GKLeaderboardScoreViewController setPlayerScope:](self, "setPlayerScope:");
  -[GKLeaderboardScoreViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlayerScope:", a3);

  objc_msgSend((id)objc_opt_class(), "setRestrictToFriendsOnly:", v4);
  -[GKLeaderboardScoreViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRestrictToFriendsOnly:", v4);

  -[UIViewController _gkExtensionViewController](self, "_gkExtensionViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dashboardDidChangeToLeaderboardPlayerScope:", a3);

  -[GKLeaderboardScoreViewController setNeedsRefresh](self, "setNeedsRefresh");
}

- (void)scrollToTopPressed:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];

  objc_msgSend(MEMORY[0x1E0D253C0], "reporter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportEvent:type:", *MEMORY[0x1E0D25060], *MEMORY[0x1E0D24CF0]);

  -[GKLeaderboardScoreViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "startingRank");

  if (v6 < 2)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__GKLeaderboardScoreViewController_scrollToTopPressed___block_invoke;
    v8[3] = &unk_1E59C4148;
    v8[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v8, 0.25);
  }
  else
  {
    -[GKLeaderboardScoreViewController dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAutoScrollToLocalPlayerPosition:", 0);

    -[GKLeaderboardScoreViewController setNeedsRefresh](self, "setNeedsRefresh");
  }
}

void __55__GKLeaderboardScoreViewController_scrollToTopPressed___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentInset");
  v3 = -v2;
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentOffset:", 0.0, v3);

}

- (void)configureTimeScopeMenu
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  -[GKLeaderboardScoreViewController timeScopeButton](self, "timeScopeButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContextMenuIsPrimary:", 1);

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__GKLeaderboardScoreViewController_configureTimeScopeMenu__block_invoke;
  v5[3] = &unk_1E59C84D0;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  -[GKLeaderboardScoreViewController timeScopeButton](self, "timeScopeButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setMenuProvider:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

id __58__GKLeaderboardScoreViewController_configureTimeScopeMenu__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  void *v30;
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[6];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "leaderboard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  v6 = (void *)MEMORY[0x1E0DC3428];
  GKGameCenterUIFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  if (v5 == 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __58__GKLeaderboardScoreViewController_configureTimeScopeMenu__block_invoke_2;
    v35[3] = &unk_1E59C84A8;
    v35[4] = WeakRetained;
    objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v8, 0, 0, v35);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setState:", objc_msgSend(*(id *)(a1 + 32), "leaderboardOccurrence") == 0);
    v11 = (void *)MEMORY[0x1E0DC3428];
    GKGameCenterUIFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v9;
    v34[1] = 3221225472;
    v34[2] = __58__GKLeaderboardScoreViewController_configureTimeScopeMenu__block_invoke_3;
    v34[3] = &unk_1E59C84A8;
    v34[4] = WeakRetained;
    objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", v13, 0, 0, v34);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setState:", objc_msgSend(*(id *)(a1 + 32), "leaderboardOccurrence") == 1);
    objc_msgSend(v3, "addObject:", v10);
    objc_msgSend(v3, "addObject:", v14);
    v15 = (void *)MEMORY[0x1E0DC39D0];
    GKGameCenterUIFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "menuWithTitle:children:", v17, v3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __58__GKLeaderboardScoreViewController_configureTimeScopeMenu__block_invoke_4;
    v33[3] = &unk_1E59C84A8;
    v33[4] = WeakRetained;
    objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v19, 0, 0, v33);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setState:", objc_msgSend(*(id *)(a1 + 32), "timeScope") == 0);
    v21 = (void *)MEMORY[0x1E0DC3428];
    GKGameCenterUIFrameworkBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v20;
    v32[1] = 3221225472;
    v32[2] = __58__GKLeaderboardScoreViewController_configureTimeScopeMenu__block_invoke_5;
    v32[3] = &unk_1E59C84A8;
    v32[4] = WeakRetained;
    objc_msgSend(v21, "actionWithTitle:image:identifier:handler:", v23, 0, 0, v32);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setState:", objc_msgSend(*(id *)(a1 + 32), "timeScope") == 1);
    v24 = (void *)MEMORY[0x1E0DC3428];
    GKGameCenterUIFrameworkBundle();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v20;
    v31[1] = 3221225472;
    v31[2] = __58__GKLeaderboardScoreViewController_configureTimeScopeMenu__block_invoke_6;
    v31[3] = &unk_1E59C84A8;
    v31[4] = WeakRetained;
    objc_msgSend(v24, "actionWithTitle:image:identifier:handler:", v26, 0, 0, v31);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setState:", objc_msgSend(*(id *)(a1 + 32), "timeScope") == 2);
    objc_msgSend(v3, "addObject:", v10);
    objc_msgSend(v3, "addObject:", v14);
    objc_msgSend(v3, "addObject:", v16);
    v27 = (void *)MEMORY[0x1E0DC39D0];
    GKGameCenterUIFrameworkBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "menuWithTitle:children:", v28, v3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

uint64_t __58__GKLeaderboardScoreViewController_configureTimeScopeMenu__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLeaderboardOccurrence:", 0);
}

uint64_t __58__GKLeaderboardScoreViewController_configureTimeScopeMenu__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLeaderboardOccurrence:", 1);
}

uint64_t __58__GKLeaderboardScoreViewController_configureTimeScopeMenu__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTimeScope:", 0);
}

uint64_t __58__GKLeaderboardScoreViewController_configureTimeScopeMenu__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTimeScope:", 1);
}

uint64_t __58__GKLeaderboardScoreViewController_configureTimeScopeMenu__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTimeScope:", 2);
}

- (void)setTimeScope:(int64_t)a3
{
  int64_t timeScope;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  timeScope = a3;
  if (self->_timeScope != a3)
  {
    if ((unint64_t)a3 <= 2)
    {
      v5 = (_QWORD *)qword_1E59C85A8[a3];
      objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "reportEvent:type:", *MEMORY[0x1E0D25060], *v5);

    }
    self->_timeScope = timeScope;
    -[GKLeaderboardScoreViewController dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTimeScope:", timeScope);

    -[GKLeaderboardScoreViewController setInitialTimeScope:](self, "setInitialTimeScope:", timeScope);
    -[UIViewController _gkExtensionViewController](self, "_gkExtensionViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dashboardDidChangeToLeaderboardTimeScope:", timeScope);

    -[GKLeaderboardScoreViewController setNeedsRefresh](self, "setNeedsRefresh");
    timeScope = self->_timeScope;
  }
  -[GKLeaderboardScoreViewController timeScopeButton](self, "timeScopeButton");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimeScope:", timeScope);

}

- (void)setLeaderboardOccurrence:(int64_t)a3
{
  int64_t timeScope;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  _QWORD v10[6];

  if (self->_leaderboardOccurrence != a3)
  {
    timeScope = self->_timeScope;
    -[GKLeaderboardScoreViewController dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTimeScope:", timeScope);

    if (a3)
    {
      if (a3 != 1)
      {
LABEL_7:
        -[GKLeaderboardScoreViewController timeScopeButton](self, "timeScopeButton");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setEnabled:", 0);

        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __61__GKLeaderboardScoreViewController_setLeaderboardOccurrence___block_invoke;
        v10[3] = &unk_1E59C84F8;
        v10[4] = self;
        v10[5] = a3;
        -[GKLeaderboardScoreViewController loadLeaderboardForOccurrence:handler:](self, "loadLeaderboardForOccurrence:handler:", a3, v10);
        return;
      }
      v7 = (_QWORD *)MEMORY[0x1E0D24CC0];
    }
    else
    {
      v7 = (_QWORD *)MEMORY[0x1E0D24CB8];
    }
    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reportEvent:type:", *MEMORY[0x1E0D25060], *v7);

    goto LABEL_7;
  }
}

void __61__GKLeaderboardScoreViewController_setLeaderboardOccurrence___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  id v13;

  if (a2 && !a3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = a2;
    objc_msgSend(v4, "leaderboard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPlayerScope:", objc_msgSend(v6, "playerScope"));

    objc_msgSend(v5, "setTimeScope:", 2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1248) = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "setLeaderboard:", v5);
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLeaderboard:", v5);

    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLeaderboardOccurrence:", v8);

    objc_msgSend(*(id *)(a1 + 32), "setNeedsRefresh");
  }
  v10 = *(_QWORD **)(a1 + 32);
  v11 = v10[156];
  objc_msgSend(v10, "timeScopeButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLeaderboardOccurrence:", v11);

  objc_msgSend(*(id *)(a1 + 32), "timeScopeButton");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEnabled:", 1);

}

- (void)loadLeaderboardForOccurrence:(int64_t)a3 handler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3 != 1)
  {
    -[GKLeaderboardScoreViewController currentOccurrence](self, "currentOccurrence");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[GKLeaderboardScoreViewController currentOccurrence](self, "currentOccurrence");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    v16 = (void *)MEMORY[0x1E0D25308];
    -[GKLeaderboardScoreViewController leaderboard](self, "leaderboard");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "baseLeaderboardID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __73__GKLeaderboardScoreViewController_loadLeaderboardForOccurrence_handler___block_invoke_2;
    v20[3] = &unk_1E59C46B8;
    v20[4] = self;
    v21 = v6;
    objc_msgSend(v16, "loadLeaderboardsWithIDs:completionHandler:", v19, v20);

    v15 = v21;
LABEL_9:

    goto LABEL_10;
  }
  -[GKLeaderboardScoreViewController previousOccurrence](self, "previousOccurrence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[GKLeaderboardScoreViewController leaderboard](self, "leaderboard");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardScoreViewController dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "gameRecord");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "gameDescriptor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __73__GKLeaderboardScoreViewController_loadLeaderboardForOccurrence_handler___block_invoke;
    v22[3] = &unk_1E59C8520;
    v22[4] = self;
    v23 = v6;
    objc_msgSend(v11, "loadPreviousOccurrenceWithGameDescriptor:completionHandler:", v14, v22);

    v15 = v23;
    goto LABEL_9;
  }
  -[GKLeaderboardScoreViewController previousOccurrence](self, "previousOccurrence");
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v10 = (void *)v8;
  (*((void (**)(id, uint64_t, _QWORD))v6 + 2))(v6, v8, 0);

LABEL_10:
}

void __73__GKLeaderboardScoreViewController_loadLeaderboardForOccurrence_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "setPreviousOccurrence:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __73__GKLeaderboardScoreViewController_loadLeaderboardForOccurrence_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "setCurrentOccurrence:", v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)setNeedsRefresh
{
  _QWORD block[5];

  if (-[GKLeaderboardScoreViewController isLoading](self, "isLoading"))
  {
    -[GKLeaderboardScoreViewController setShouldRefreshAgain:](self, "setShouldRefreshAgain:", 1);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__GKLeaderboardScoreViewController_setNeedsRefresh__block_invoke;
    block[3] = &unk_1E59C4148;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __51__GKLeaderboardScoreViewController_setNeedsRefresh__block_invoke()
{
  dispatch_time_t v0;

  gk_dispatch_debounce();
  v0 = dispatch_time(0, 1000000000);
  dispatch_after(v0, MEMORY[0x1E0C80D38], &__block_literal_global_184);
}

uint64_t __51__GKLeaderboardScoreViewController_setNeedsRefresh__block_invoke_2(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "isLoading") & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "setShouldRefreshAgain:", 1);
  else
    return objc_msgSend(*(id *)(a1 + 32), "setLoadingState:", CFSTR("RefreshingState"));
}

uint64_t __51__GKLeaderboardScoreViewController_setNeedsRefresh__block_invoke_3()
{
  return GKAtomicCompareAndSwap32();
}

- (BOOL)isLoading
{
  __CFString *v2;
  BOOL v3;

  -[GKLoadingViewController loadingState](self, "loadingState");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = 1;
  if (v2)
  {
    if (v2 != CFSTR("Initial") && v2 != CFSTR("LoadingState"))
      v3 = v2 == CFSTR("RefreshingState");
  }

  return v3;
}

- (void)didEnterLoadingState
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKLeaderboardScoreViewController;
  -[GKLoadingViewController didEnterLoadingState](&v3, sel_didEnterLoadingState);
  -[GKLeaderboardScoreViewController loadData](self, "loadData");
}

- (void)donePressed:(id)a3
{
  id v3;

  -[UIViewController _gkExtensionViewController](self, "_gkExtensionViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finish");

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  int IsAccessibilityCategory;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  GKLeaderboardScoreViewController *v17;
  void *v18;
  void *v19;
  void *v20;
  GKLeaderboardScoreViewController *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)GKLeaderboardScoreViewController;
  -[GKLeaderboardScoreViewController traitCollectionDidChange:](&v43, sel_traitCollectionDidChange_, v4);
  -[GKLeaderboardScoreViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = UIContentSizeCategoryIsAccessibilityCategory(v6);
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

  if ((_DWORD)v5 == IsAccessibilityCategory)
  {
    objc_msgSend(v4, "preferredContentSizeCategory");
    v33 = (NSString *)objc_claimAutoreleasedReturnValue();

    -[GKLeaderboardScoreViewController enableDisableCollectionViewScrolling](self, "enableDisableCollectionViewScrolling");
    -[GKLeaderboardScoreViewController collectionView](self, "collectionView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v33 == v6)
    {
      objc_msgSend(v34, "collectionViewLayout");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "invalidateLayout");

      -[GKLeaderboardScoreViewController updateHighlights](self, "updateHighlights");
    }
    else
    {
      objc_msgSend(v34, "reloadData");

      -[GKLeaderboardScoreViewController updateContentSize](self, "updateContentSize");
    }
  }
  else
  {
    -[GKLeaderboardScoreViewController playerScopeControl](self, "playerScopeControl");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");

    -[GKLeaderboardScoreViewController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_bottomPalette");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeFromSuperview");

    -[GKLeaderboardScoreViewController navigationItem](self, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_bottomPalette");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPreferredHeight:", 0.0);

    -[GKLeaderboardScoreViewController navigationItem](self, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_bottomPalette");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeFromSuperview");

    v17 = [GKLeaderboardScoreViewController alloc];
    -[GKLeaderboardScoreViewController dataSource](self, "dataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "gameRecord");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardScoreViewController leaderboard](self, "leaderboard");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[GKLeaderboardScoreViewController initWithGameRecord:leaderboard:](v17, "initWithGameRecord:leaderboard:", v19, v20);

    v22 = (void *)MEMORY[0x1E0C99DE8];
    -[GKLeaderboardScoreViewController navigationController](self, "navigationController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "viewControllers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "arrayWithArray:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v26 = v25;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v27)
    {
      v28 = v27;
      v29 = 0;
      v30 = *(_QWORD *)v40;
      while (2)
      {
        v31 = 0;
        v32 = v29 + v28;
        do
        {
          if (*(_QWORD *)v40 != v30)
            objc_enumerationMutation(v26);
          if (*(GKLeaderboardScoreViewController **)(*((_QWORD *)&v39 + 1) + 8 * v31) == self)
          {
            v32 = v29 + v31;
            goto LABEL_15;
          }
          ++v31;
        }
        while (v28 != v31);
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        v29 = v32;
        if (v28)
          continue;
        break;
      }
    }
    else
    {
      v32 = 0;
    }
LABEL_15:

    objc_msgSend(v26, "replaceObjectAtIndex:withObject:", v32, v21, (_QWORD)v39);
    -[GKLeaderboardScoreViewController navigationController](self, "navigationController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setViewControllers:", v26);

    -[GKLeaderboardScoreViewController view](self, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "removeFromSuperview");

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[7];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)GKLeaderboardScoreViewController;
  v7 = a4;
  -[GKLeaderboardScoreViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__GKLeaderboardScoreViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E59C5870;
  v8[4] = self;
  *(double *)&v8[5] = width;
  *(double *)&v8[6] = height;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

uint64_t __87__GKLeaderboardScoreViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updatePlayerScopeLayoutForSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)clearSelection
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[GKLeaderboardScoreViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        -[GKLeaderboardScoreViewController collectionView](self, "collectionView", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "deselectItemAtIndexPath:animated:", v10, 1);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)collectionViewDidScroll
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  -[GKLeaderboardScoreViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionViewContentSize");
  v6 = v5;
  -[GKLeaderboardScoreViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentOffset");
  v9 = v6 - v8;
  -[GKLeaderboardScoreViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v9 - v11;

  v13 = v12 / 20.0;
  if (v12 / 20.0 > 1.0)
    v13 = 1.0;
  if (v13 <= 0.0)
    v14 = 1.0;
  else
    v14 = 1.0 - v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v15;
  v18[1] = &unk_1E5A5E6F0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardScoreViewController collectionViewFadeGradient](self, "collectionViewFadeGradient");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setLocations:", v16);

}

- (void)didLoadScoresWithLocalPlayerEntry:(id)a3 topPlayer:(id)a4 playerAbove:(id)a5 playerBelow:(id)a6 totalEntries:(int64_t)a7
{
  id v12;
  id v13;
  id v14;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  -[GKLeaderboardScoreViewController setLocalPlayerEntry:](self, "setLocalPlayerEntry:", a3);
  -[GKLeaderboardScoreViewController setTopPlayerEntry:](self, "setTopPlayerEntry:", v14);

  -[GKLeaderboardScoreViewController setPlayerAboveEntry:](self, "setPlayerAboveEntry:", v13);
  -[GKLeaderboardScoreViewController setPlayerBelowEntry:](self, "setPlayerBelowEntry:", v12);

  -[GKLeaderboardScoreViewController setTotalEntries:](self, "setTotalEntries:", a7);
  -[GKLeaderboardScoreViewController updateHighlights](self, "updateHighlights");
  -[GKLeaderboardScoreViewController updateContentSize](self, "updateContentSize");
}

- (void)didLoadAdditionalScoresWithUpdatedTotalEntries:(unint64_t)a3
{
  if (-[GKLeaderboardScoreViewController totalEntries](self, "totalEntries") != a3)
  {
    -[GKLeaderboardScoreViewController setTotalEntries:](self, "setTotalEntries:", a3);
    -[GKLeaderboardScoreViewController updateHighlights](self, "updateHighlights");
  }
  -[GKLeaderboardScoreViewController updateContentSize](self, "updateContentSize");
}

- (void)updateContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;

  -[GKLeaderboardScoreViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionViewContentSize");
  v6 = v5;

  if (v6 <= 0.0)
    v6 = 300.0;
  -[GKLeaderboardScoreViewController timeScopeContainer](self, "timeScopeContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v6 + v8;
  -[GKLeaderboardScoreViewController collectionContainerHeight](self, "collectionContainerHeight");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConstant:", v9);

  -[GKLeaderboardScoreViewController collectionViewDidScroll](self, "collectionViewDidScroll");
}

- (void)shareScore:(id)a3 fromLeaderboard:(id)a4 sendingView:(id)a5 relativeRect:(CGRect)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  int v34;
  __CFString *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[2];
  _QWORD v42[2];
  const __CFString *v43;
  void *v44;
  _QWORD v45[3];

  v45[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "player");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isLocalPlayer");

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x1E0D25018];
    objc_msgSend(v14, "reportEvent:type:", *MEMORY[0x1E0D25018], *MEMORY[0x1E0D24C18]);

    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (uint64_t *)MEMORY[0x1E0D24C00];
  }
  else
  {
    objc_msgSend(v9, "player");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isFamiliarFriend");

    if (!v19)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x1E0D25018];
    objc_msgSend(v20, "reportEvent:type:", *MEMORY[0x1E0D25018], *MEMORY[0x1E0D24C10]);

    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (uint64_t *)MEMORY[0x1E0D24BF8];
  }
  v21 = *v17;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "rank"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "reportEvent:type:scoreRank:", v15, v21, v22);

LABEL_6:
  objc_msgSend(MEMORY[0x1E0D253B0], "shared");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "shouldAllowSharing");

  if (v24)
  {
    objc_msgSend(v9, "sharingScoreMessageFromLeaderboard:", v10);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v25;
    objc_msgSend(v9, "sharingScoreURL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (id)-[GKLeaderboardScoreViewController _gkPresentActivityViewControllerForActivityItems:fromView:withCompletionHandler:](self, "_gkPresentActivityViewControllerForActivityItems:fromView:withCompletionHandler:", v27, v11, 0);
  }
  else
  {
    GKGameCenterUIFrameworkBundle();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    GKGameCenterUIFrameworkBundle();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    GKGameCenterUIFrameworkBundle();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (id)-[GKLeaderboardScoreViewController _gkPresentAlertWithTitle:message:buttonTitle:dismissHandler:](self, "_gkPresentAlertWithTitle:message:buttonTitle:dismissHandler:", v26, v29, v31, 0);

  }
  objc_msgSend(v9, "player");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "isLocalPlayer");
  v35 = CFSTR("friendPlayer");
  if (v34)
    v35 = CFSTR("localPlayer");
  v36 = v35;

  objc_msgSend(MEMORY[0x1E0D25238], "reporter");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = CFSTR("location");
  v41[0] = CFSTR("scorer");
  v41[1] = CFSTR("scoreRank");
  v42[0] = v36;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "rank"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v38;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v39;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "recordClickWithAction:targetId:targetType:pageId:pageType:additionalFields:", CFSTR("share"), CFSTR("leaderboardEntry"), CFSTR("collectionViewCell"), CFSTR("leaderboardScores"), CFSTR("leaderboard"), v40);
}

- (void)challengeWithScore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[GKLeaderboardScoreViewController leaderboard](self, "leaderboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__GKLeaderboardScoreViewController_challengeWithScore___block_invoke;
  v9[3] = &unk_1E59C8588;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v5, "loadEntriesForPlayers:timeScope:completionHandler:", v7, 2, v9);

}

void __55__GKLeaderboardScoreViewController_challengeWithScore___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void **v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  GKChallengePlayerPickerViewController *v30;
  void *v31;
  BOOL v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  _QWORD v38[5];
  id v39;
  id location;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v34 = a2;
  v36 = a3;
  v37 = a4;
  objc_msgSend(v36, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_gkScore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0D253C8];
    objc_msgSend(MEMORY[0x1E0D252C0], "currentGame", v34);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "challengeForGame:andPlayer:withScore:", v10, v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "leaderboard");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "internal");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "internal");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLeaderboard:", v14);

    objc_msgSend(*(id *)(a1 + 40), "player");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(*(id *)(a1 + 40), "player");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = 0;
    }

    v30 = -[GKChallengePlayerPickerViewController initWithChallenge:initiallySelectedPlayers:]([GKChallengePlayerPickerViewController alloc], "initWithChallenge:initiallySelectedPlayers:", v12, v18);
    objc_initWeak(&location, v30);
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __55__GKLeaderboardScoreViewController_challengeWithScore___block_invoke_226;
    v38[3] = &unk_1E59C8430;
    v38[4] = *(_QWORD *)(a1 + 32);
    objc_copyWeak(&v39, &location);
    -[GKChallengePlayerPickerViewController setInviteFriendHandler:](v30, "setInviteFriendHandler:", v38);
    objc_msgSend(*(id *)(a1 + 32), "traitCollection");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "userInterfaceIdiom") == 1;

    if (!v32)
      -[GKChallengePlayerPickerViewController setModalPresentationStyle:](v30, "setModalPresentationStyle:", 5);
    objc_msgSend(*(id *)(a1 + 32), "_gkOriginatingViewController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "presentViewController:animated:completion:", v30, 1, 0);

    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);

  }
  else
  {
    v20 = *(void **)(a1 + 32);
    v19 = (void **)(a1 + 32);
    GKGameCenterUIFrameworkBundle();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    GKGameCenterUIFrameworkBundle();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    GKGameCenterUIFrameworkBundle();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (id)objc_msgSend(v20, "_gkPresentAlertWithTitle:message:buttonTitle:dismissHandler:", v22, v24, v26, 0, v34);

    if (!*MEMORY[0x1E0D25460])
      v28 = (id)GKOSLoggers();
    v29 = (void *)*MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      __55__GKLeaderboardScoreViewController_challengeWithScore___block_invoke_cold_1(v19, v29);
  }

}

void __55__GKLeaderboardScoreViewController_challengeWithScore___block_invoke_226(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __objc2_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  __objc2_class *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "supportsFriendingViaPush"))
    {
      objc_msgSend(v4, "contactAssociationID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(*(id *)(a1 + 32), "leaderboard");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[GKMetricsBridge recordInviteFriendClickEventWithType:pageType:pageId:](_TtC12GameCenterUI15GKMetricsBridge, "recordInviteFriendClickEventWithType:pageType:pageId:", 0, CFSTR("leaderboard"), v7);

        objc_msgSend(v4, "contact");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "contactAssociationID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[GameCenterObjcHelper sendFriendInvitationViaPushWithContactID:contactAssociationID:completionHandler:](_TtC12GameCenterUI20GameCenterObjcHelper, "sendFriendInvitationViaPushWithContactID:contactAssociationID:completionHandler:", v9, v10, &__block_literal_global_227);

        goto LABEL_20;
      }
    }
    v11 = 1;
  }
  else
  {
    v11 = 2;
  }
  v12 = _TtC12GameCenterUI15GKMetricsBridge;
  objc_msgSend(*(id *)(a1 + 32), "leaderboard");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKMetricsBridge recordInviteFriendClickEventWithType:pageType:pageId:](_TtC12GameCenterUI15GKMetricsBridge, "recordInviteFriendClickEventWithType:pageType:pageId:", v11, CFSTR("leaderboard"), v14);

  if (*MEMORY[0x1E0D253F8])
  {
    if (v4)
    {
      objc_msgSend(v4, "contact");
      v12 = (__objc2_class *)objc_claimAutoreleasedReturnValue();
      v21 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = (void *)MEMORY[0x1E0C9AA60];
    }
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __55__GKLeaderboardScoreViewController_challengeWithScore___block_invoke_4;
    v17[3] = &unk_1E59C6308;
    objc_copyWeak(&v18, (id *)(a1 + 40));
    +[FriendRequestFacilitator makeViewControllerWithRecipients:chatGUID:completionHandler:](_TtC12GameCenterUI24FriendRequestFacilitator, "makeViewControllerWithRecipients:chatGUID:completionHandler:", v15, 0, v17);
    if (v4)
    {

    }
    objc_destroyWeak(&v18);
  }
  else
  {
    if (v4)
    {
      objc_msgSend(v4, "contact");
      v12 = (__objc2_class *)objc_claimAutoreleasedReturnValue();
      v22[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0C9AA60];
    }
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __55__GKLeaderboardScoreViewController_challengeWithScore___block_invoke_3;
    v19[3] = &unk_1E59C6330;
    objc_copyWeak(&v20, (id *)(a1 + 40));
    +[FriendRequestFacilitator makeViewControllerForRemoteInviteWithRecipients:chatGUID:resultHandler:](_TtC12GameCenterUI24FriendRequestFacilitator, "makeViewControllerForRemoteInviteWithRecipients:chatGUID:resultHandler:", v16, 0, v19);
    if (v4)
    {

    }
    objc_destroyWeak(&v20);
  }
LABEL_20:

}

void __55__GKLeaderboardScoreViewController_challengeWithScore___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id WeakRetained;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v9)
    v6 = v9;
  else
    v6 = v5;
  if (v6)
  {
    v7 = v6;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v7, 1, 0);

  }
}

void __55__GKLeaderboardScoreViewController_challengeWithScore___block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v3, 1, 0);

}

- (void)shareWithScore:(id)a3 fromView:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[GKLeaderboardScoreViewController leaderboard](self, "leaderboard");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardScoreViewController shareScore:fromLeaderboard:sendingView:relativeRect:](self, "shareScore:fromLeaderboard:sendingView:relativeRect:", v7, v8, v6, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  v4 = a3;
  -[GKLeaderboardScoreViewController mainScrollView](self, "mainScrollView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[GKLeaderboardScoreViewController enableDisableCollectionViewScrolling](self, "enableDisableCollectionViewScrolling");
    -[GKLeaderboardScoreViewController collectionGradientView](self, "collectionGradientView");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[GKLeaderboardScoreViewController collectionViewFadeGradient](self, "collectionViewFadeGradient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  }
}

- (void)enableDisableCollectionViewScrolling
{
  void *v3;
  _BOOL4 IsAccessibilityCategory;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  _BOOL4 v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  BOOL v50;
  double v51;
  double v52;
  NSString *category;

  -[GKLeaderboardScoreViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  category = (NSString *)objc_claimAutoreleasedReturnValue();

  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(category);
  -[GKLeaderboardScoreViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "horizontalSizeClass") == 1)
  {
    -[GKLeaderboardScoreViewController traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "verticalSizeClass") == 2;

  }
  else
  {
    v7 = 0;
  }

  -[GKLeaderboardScoreViewController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "verticalSizeClass");

  if (!IsAccessibilityCategory)
  {
    if (GKIsXRUIIdiomShouldUsePadUI())
    {
      -[GKLeaderboardScoreViewController mainScrollView](self, "mainScrollView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setScrollEnabled:", 0);
LABEL_42:

      -[GKLeaderboardScoreViewController collectionView](self, "collectionView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setScrollEnabled:", 1);
      goto LABEL_43;
    }
    v15 = (_QWORD *)MEMORY[0x1E0DC48F0];
    if (v9 == 1)
    {
      if (-[NSString isEqualToString:](category, "isEqualToString:", *MEMORY[0x1E0DC48F8])
        || -[NSString isEqualToString:](category, "isEqualToString:", *v15))
      {
        -[GKLeaderboardScoreViewController highlightViewWidthConstraint](self, "highlightViewWidthConstraint");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        v18 = 210.0;
      }
      else
      {
        -[GKLeaderboardScoreViewController highlightViewWidthConstraint](self, "highlightViewWidthConstraint");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        v18 = 162.0;
      }
      objc_msgSend(v16, "setConstant:", v18);

      -[GKLeaderboardScoreViewController view](self, "view");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "bounds");
      v39 = v38;

      -[GKLeaderboardScoreViewController highlightViewLandscapeTopConstraint](self, "highlightViewLandscapeTopConstraint");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v40;
      if (v39 <= 320.0)
      {
        objc_msgSend(v40, "setConstant:", 20.0);

        -[GKLeaderboardScoreViewController collectionGradientViewLandscapeTopConstraint](self, "collectionGradientViewLandscapeTopConstraint");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v42;
        v44 = 20.0;
      }
      else
      {
        objc_msgSend(v40, "setConstant:", 44.0);

        -[GKLeaderboardScoreViewController collectionGradientViewLandscapeTopConstraint](self, "collectionGradientViewLandscapeTopConstraint");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v42;
        v44 = 32.0;
      }
      objc_msgSend(v42, "setConstant:", v44);

    }
    v45 = -[NSString isEqualToString:](category, "isEqualToString:", *v15);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "userInterfaceIdiom");

    if (v45)
    {
      if (v47 != 1)
      {
        v50 = GKIsXRUIIdiom() == 0;
        v51 = 145.0;
        v52 = 100.0;
        goto LABEL_38;
      }
      *(double *)&v48 = 100.0;
    }
    else
    {
      if (v47 != 1)
      {
        v50 = GKIsXRUIIdiom() == 0;
        v51 = 125.0;
        v52 = 54.0;
LABEL_38:
        if (v50)
          v49 = v51;
        else
          v49 = v52;
        goto LABEL_41;
      }
      *(double *)&v48 = 80.0;
    }
    v49 = *(double *)&v48;
LABEL_41:
    -[GKLeaderboardScoreViewController highlightViewHeightConstraint](self, "highlightViewHeightConstraint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setConstant:", v49);
    goto LABEL_42;
  }
  -[GKLeaderboardScoreViewController highlightViewHeightConstraint](self, "highlightViewHeightConstraint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  if (-[NSString isEqualToString:](category, "isEqualToString:", *MEMORY[0x1E0DC48B8]))
  {
    -[GKLeaderboardScoreViewController highlightViewHeightConstraint](self, "highlightViewHeightConstraint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = 544.0;
  }
  else if (-[NSString isEqualToString:](category, "isEqualToString:", *MEMORY[0x1E0DC48C0]))
  {
    -[GKLeaderboardScoreViewController highlightViewHeightConstraint](self, "highlightViewHeightConstraint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = 494.0;
  }
  else
  {
    if (!-[NSString isEqualToString:](category, "isEqualToString:", *MEMORY[0x1E0DC48C8]))
    {
      v32 = -[NSString isEqualToString:](category, "isEqualToString:", *MEMORY[0x1E0DC48D0]);
      -[GKLeaderboardScoreViewController highlightViewHeightConstraint](self, "highlightViewHeightConstraint");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v32)
      {
        v35 = 244.0;
        v36 = 404.0;
      }
      else
      {
        v35 = 204.0;
        v36 = 364.0;
      }
      if (v7)
        v35 = v36;
      objc_msgSend(v33, "setConstant:", v35);

      -[GKLeaderboardScoreViewController highlightView](self, "highlightView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = v7;
      goto LABEL_18;
    }
    -[GKLeaderboardScoreViewController highlightViewHeightConstraint](self, "highlightViewHeightConstraint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = 444.0;
  }
  objc_msgSend(v11, "setConstant:", v13);

  -[GKLeaderboardScoreViewController highlightView](self, "highlightView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  v21 = 1;
LABEL_18:
  objc_msgSend(v19, "setAxis:", v21);

  -[GKLeaderboardScoreViewController mainScrollView](self, "mainScrollView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "contentSize");
  if (v23 > 0.0
    && (objc_msgSend(v22, "contentOffset"),
        v25 = v24,
        objc_msgSend(v22, "contentSize"),
        v27 = v26,
        objc_msgSend(v22, "frame"),
        v25 >= v27 - v28))
  {
    -[GKLeaderboardScoreViewController collectionView](self, "collectionView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    v31 = 1;
  }
  else
  {
    -[GKLeaderboardScoreViewController collectionView](self, "collectionView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    v31 = 0;
  }
  objc_msgSend(v29, "setScrollEnabled:", v31);

LABEL_43:
}

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  GKLeaderboardScoreViewController *v10;
  unsigned int v11;

  v6 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__GKLeaderboardScoreViewController_refreshContentsForDataType_userInfo___block_invoke;
  block[3] = &unk_1E59C6D60;
  v11 = a3;
  v9 = v6;
  v10 = self;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __72__GKLeaderboardScoreViewController_refreshContentsForDataType_userInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a1 + 48) == 4)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D24B98]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "dataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addInvitedFriendContactIdentifier:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "collectionView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reloadItemsAtIndexPaths:", v6);

    }
  }
}

- (int64_t)initialPlayerScope
{
  return self->_initialPlayerScope;
}

- (void)setInitialPlayerScope:(int64_t)a3
{
  self->_initialPlayerScope = a3;
}

- (BOOL)isDeeplinked
{
  return self->_isDeeplinked;
}

- (void)setIsDeeplinked:(BOOL)a3
{
  self->_isDeeplinked = a3;
}

- (NSString)autoScrollToPlayerId
{
  return self->_autoScrollToPlayerId;
}

- (void)setAutoScrollToPlayerId:(id)a3
{
  objc_storeStrong((id *)&self->_autoScrollToPlayerId, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UIStackView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightView, a3);
}

- (GKUnfocusableButton)scrollToTopButton
{
  return self->_scrollToTopButton;
}

- (void)setScrollToTopButton:(id)a3
{
  objc_storeStrong((id *)&self->_scrollToTopButton, a3);
}

- (UIView)collectionContainer
{
  return self->_collectionContainer;
}

- (void)setCollectionContainer:(id)a3
{
  objc_storeStrong((id *)&self->_collectionContainer, a3);
}

- (UIView)timeScopeContainer
{
  return self->_timeScopeContainer;
}

- (void)setTimeScopeContainer:(id)a3
{
  objc_storeStrong((id *)&self->_timeScopeContainer, a3);
}

- (UIView)releaseStateInfoBox
{
  return self->_releaseStateInfoBox;
}

- (void)setReleaseStateInfoBox:(id)a3
{
  self->_releaseStateInfoBox = (UIView *)a3;
}

- (UIImageView)releaseStateIcon
{
  return self->_releaseStateIcon;
}

- (void)setReleaseStateIcon:(id)a3
{
  self->_releaseStateIcon = (UIImageView *)a3;
}

- (UIStackView)releaseStateInfoBoxContents
{
  return self->_releaseStateInfoBoxContents;
}

- (void)setReleaseStateInfoBoxContents:(id)a3
{
  objc_storeStrong((id *)&self->_releaseStateInfoBoxContents, a3);
}

- (UILabel)releaseStateHeaderText
{
  return self->_releaseStateHeaderText;
}

- (void)setReleaseStateHeaderText:(id)a3
{
  objc_storeStrong((id *)&self->_releaseStateHeaderText, a3);
}

- (UILabel)releaseStateInfoText
{
  return self->_releaseStateInfoText;
}

- (void)setReleaseStateInfoText:(id)a3
{
  objc_storeStrong((id *)&self->_releaseStateInfoText, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UISegmentedControl)playerScopeControl
{
  return self->_playerScopeControl;
}

- (void)setPlayerScopeControl:(id)a3
{
  objc_storeStrong((id *)&self->_playerScopeControl, a3);
}

- (NSLayoutConstraint)collectionContainerHeight
{
  return self->_collectionContainerHeight;
}

- (void)setCollectionContainerHeight:(id)a3
{
  objc_storeStrong((id *)&self->_collectionContainerHeight, a3);
}

- (UIView)collectionGradientView
{
  return self->_collectionGradientView;
}

- (void)setCollectionGradientView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionGradientView, a3);
}

- (NSLayoutConstraint)collectionGradientViewHeightConstraint
{
  return self->_collectionGradientViewHeightConstraint;
}

- (void)setCollectionGradientViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_collectionGradientViewHeightConstraint, a3);
}

- (UIScrollView)mainScrollView
{
  return self->_mainScrollView;
}

- (void)setMainScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_mainScrollView, a3);
}

- (NSLayoutConstraint)highlightViewHeightConstraint
{
  return self->_highlightViewHeightConstraint;
}

- (void)setHighlightViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_highlightViewHeightConstraint, a3);
}

- (NSLayoutConstraint)highlightViewWidthConstraint
{
  return self->_highlightViewWidthConstraint;
}

- (void)setHighlightViewWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_highlightViewWidthConstraint, a3);
}

- (NSLayoutConstraint)collectionGradientViewLandscapeTopConstraint
{
  return self->_collectionGradientViewLandscapeTopConstraint;
}

- (void)setCollectionGradientViewLandscapeTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_collectionGradientViewLandscapeTopConstraint, a3);
}

- (NSLayoutConstraint)highlightViewLandscapeTopConstraint
{
  return self->_highlightViewLandscapeTopConstraint;
}

- (void)setHighlightViewLandscapeTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_highlightViewLandscapeTopConstraint, a3);
}

- (UIImageView)gameIconImageView
{
  return self->_gameIconImageView;
}

- (void)setGameIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_gameIconImageView, a3);
}

- (GKTimeScopeButton)timeScopeButton
{
  return self->_timeScopeButton;
}

- (void)setTimeScopeButton:(id)a3
{
  objc_storeStrong((id *)&self->_timeScopeButton, a3);
}

- (GKLeaderboardScoreDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (GKLeaderboard)leaderboard
{
  return self->_leaderboard;
}

- (void)setLeaderboard:(id)a3
{
  objc_storeStrong((id *)&self->_leaderboard, a3);
}

- (GKLeaderboard)currentOccurrence
{
  return self->_currentOccurrence;
}

- (void)setCurrentOccurrence:(id)a3
{
  objc_storeStrong((id *)&self->_currentOccurrence, a3);
}

- (GKLeaderboard)previousOccurrence
{
  return self->_previousOccurrence;
}

- (void)setPreviousOccurrence:(id)a3
{
  objc_storeStrong((id *)&self->_previousOccurrence, a3);
}

- (int64_t)timeScope
{
  return self->_timeScope;
}

- (int64_t)playerScope
{
  return self->_playerScope;
}

- (void)setPlayerScope:(int64_t)a3
{
  self->_playerScope = a3;
}

- (int64_t)leaderboardOccurrence
{
  return self->_leaderboardOccurrence;
}

- (GKLeaderboardMetadataView)personalView
{
  return self->_personalView;
}

- (void)setPersonalView:(id)a3
{
  objc_storeStrong((id *)&self->_personalView, a3);
}

- (GKLeaderboardMetadataView)socialView
{
  return self->_socialView;
}

- (void)setSocialView:(id)a3
{
  objc_storeStrong((id *)&self->_socialView, a3);
}

- (GKNoContentView)noContentView
{
  return self->_noContentView;
}

- (void)setNoContentView:(id)a3
{
  objc_storeStrong((id *)&self->_noContentView, a3);
}

- (CAGradientLayer)collectionViewFadeGradient
{
  return self->_collectionViewFadeGradient;
}

- (void)setCollectionViewFadeGradient:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewFadeGradient, a3);
}

- (GKLeaderboardEntry)localPlayerEntry
{
  return self->_localPlayerEntry;
}

- (void)setLocalPlayerEntry:(id)a3
{
  objc_storeStrong((id *)&self->_localPlayerEntry, a3);
}

- (GKLeaderboardEntry)topPlayerEntry
{
  return self->_topPlayerEntry;
}

- (void)setTopPlayerEntry:(id)a3
{
  objc_storeStrong((id *)&self->_topPlayerEntry, a3);
}

- (GKLeaderboardEntry)playerAboveEntry
{
  return self->_playerAboveEntry;
}

- (void)setPlayerAboveEntry:(id)a3
{
  objc_storeStrong((id *)&self->_playerAboveEntry, a3);
}

- (GKLeaderboardEntry)playerBelowEntry
{
  return self->_playerBelowEntry;
}

- (void)setPlayerBelowEntry:(id)a3
{
  objc_storeStrong((id *)&self->_playerBelowEntry, a3);
}

- (int64_t)totalEntries
{
  return self->_totalEntries;
}

- (void)setTotalEntries:(int64_t)a3
{
  self->_totalEntries = a3;
}

- (BOOL)shouldAutoRefreshHighlights
{
  return self->_shouldAutoRefreshHighlights;
}

- (void)setShouldAutoRefreshHighlights:(BOOL)a3
{
  self->_shouldAutoRefreshHighlights = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (BOOL)shouldPreferFocusToPlayerScopeControl
{
  return self->_shouldPreferFocusToPlayerScopeControl;
}

- (void)setShouldPreferFocusToPlayerScopeControl:(BOOL)a3
{
  self->_shouldPreferFocusToPlayerScopeControl = a3;
}

- (UICollectionViewCell)preferredFocusCell
{
  return (UICollectionViewCell *)objc_loadWeakRetained((id *)&self->_preferredFocusCell);
}

- (void)setPreferredFocusCell:(id)a3
{
  objc_storeWeak((id *)&self->_preferredFocusCell, a3);
}

- (BOOL)shouldRefreshAgain
{
  return self->_shouldRefreshAgain;
}

- (void)setShouldRefreshAgain:(BOOL)a3
{
  self->_shouldRefreshAgain = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_preferredFocusCell);
  objc_storeStrong((id *)&self->_playerBelowEntry, 0);
  objc_storeStrong((id *)&self->_playerAboveEntry, 0);
  objc_storeStrong((id *)&self->_topPlayerEntry, 0);
  objc_storeStrong((id *)&self->_localPlayerEntry, 0);
  objc_storeStrong((id *)&self->_collectionViewFadeGradient, 0);
  objc_storeStrong((id *)&self->_noContentView, 0);
  objc_storeStrong((id *)&self->_socialView, 0);
  objc_storeStrong((id *)&self->_personalView, 0);
  objc_storeStrong((id *)&self->_previousOccurrence, 0);
  objc_storeStrong((id *)&self->_currentOccurrence, 0);
  objc_storeStrong((id *)&self->_leaderboard, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_timeScopeButton, 0);
  objc_storeStrong((id *)&self->_gameIconImageView, 0);
  objc_storeStrong((id *)&self->_highlightViewLandscapeTopConstraint, 0);
  objc_storeStrong((id *)&self->_collectionGradientViewLandscapeTopConstraint, 0);
  objc_storeStrong((id *)&self->_highlightViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_highlightViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_mainScrollView, 0);
  objc_storeStrong((id *)&self->_collectionGradientViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_collectionGradientView, 0);
  objc_storeStrong((id *)&self->_collectionContainerHeight, 0);
  objc_storeStrong((id *)&self->_playerScopeControl, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_releaseStateInfoText, 0);
  objc_storeStrong((id *)&self->_releaseStateHeaderText, 0);
  objc_storeStrong((id *)&self->_releaseStateInfoBoxContents, 0);
  objc_storeStrong((id *)&self->_timeScopeContainer, 0);
  objc_storeStrong((id *)&self->_collectionContainer, 0);
  objc_storeStrong((id *)&self->_scrollToTopButton, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_autoScrollToPlayerId, 0);
}

void __55__GKLeaderboardScoreViewController_challengeWithScore___block_invoke_cold_1(void **a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = a2;
  objc_msgSend(v2, "leaderboard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1AB361000, v3, OS_LOG_TYPE_ERROR, "Cannot issue challenge because localPlayer's score for this leaderboard is nil. Leaderboard: %@", (uint8_t *)&v5, 0xCu);

}

@end
