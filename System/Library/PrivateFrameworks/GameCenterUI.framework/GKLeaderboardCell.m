@implementation GKLeaderboardCell

- (void)awakeFromNib
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)GKLeaderboardCell;
  -[GKLeaderboardCell awakeFromNib](&v16, sel_awakeFromNib);
  -[UILabel textColor](self->_titleLabel, "textColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardCell setTitleLabelColor:](self, "setTitleLabelColor:", v3);

  -[GKLeaderboardCell setClipsToBounds:](self, "setClipsToBounds:", 0);
  -[GKLeaderboardCell iconView](self, "iconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentMode:", 2);

  objc_msgSend(MEMORY[0x1E0DC1350], "_gkPreferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4A88], 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  v7 = *MEMORY[0x1E0CD2EA0];
  -[GKLeaderboardCell countLabel](self, "countLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCompositingFilter:", v7);

  -[GKLeaderboardCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerRadius:", 14.0);

  v12 = *MEMORY[0x1E0CD2A68];
  -[GKLeaderboardCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCornerCurve:", v12);

  -[GKLeaderboardCell addVisualEffect](self, "addVisualEffect");
  -[GKLeaderboardCell countLabel](self, "countLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", &stru_1E59EB978);

  -[GKLeaderboardCell _gkDisableDefaultFocusEffect](self, "_gkDisableDefaultFocusEffect");
  -[GKLeaderboardCell setupFallbackIcon](self, "setupFallbackIcon");
}

- (void)addVisualEffect
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = objc_alloc_init(MEMORY[0x1E0DC3F58]);
  objc_msgSend(MEMORY[0x1E0DC3F50], "_gkGameLayerModuleVisualEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundEffects:", v3);

  objc_msgSend(v8, "backgroundEffects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardCell setCustomBackgroundBlur:](self, "setCustomBackgroundBlur:", v4);

  objc_msgSend(v8, "_setGroupName:", CFSTR("gameLayerGroup"));
  -[GKLeaderboardCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertSubview:atIndex:", v8, 0);

  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = (void *)MEMORY[0x1E0CB3718];
  -[GKLeaderboardCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_gkInstallEdgeConstraintsForView:containedWithinParentView:", v8, v7);

  -[GKLeaderboardCell setEffectView:](self, "setEffectView:", v8);
}

- (void)setupFallbackIcon
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[GKLeaderboardCell iconView](self, "iconView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("list.bullet.below.star.filled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithRenderingMode:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setImage:", v3);
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v4);

  objc_msgSend(v7, "setContentMode:", 2);
  v5 = *MEMORY[0x1E0CD2EA0];
  objc_msgSend(v7, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCompositingFilter:", v5);

}

- (UIView)popoverSourceView
{
  return (UIView *)self->_iconView;
}

- (void)setLeaderboardSet:(id)a3
{
  GKLeaderboardSet *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  GKLeaderboardSet *v13;

  v5 = (GKLeaderboardSet *)a3;
  if (self->_leaderboardSet != v5)
  {
    v13 = v5;
    objc_storeStrong((id *)&self->_leaderboardSet, a3);
    -[GKLeaderboardSet title](v13, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_titleLabel, "setText:", v6);

    -[GKLeaderboardSet leaderboardIdentifiers](v13, "leaderboardIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "count");
    v8 = (void *)MEMORY[0x1E0CB3940];
    GKGameCenterUIFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    GKFormattedStringWithGroupingFromInteger();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setText:](self->_countLabel, "setText:", v12);
    -[GKLeaderboardCell updateLayout](self, "updateLayout");
    -[GKLeaderboardCell updateImage](self, "updateImage");
    v5 = v13;
  }

}

- (void)setLeaderboard:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  GKLeaderboard *v8;

  v8 = (GKLeaderboard *)a3;
  if (self->_leaderboard != v8)
  {
    objc_storeStrong((id *)&self->_leaderboard, a3);
    if (_os_feature_enabled_impl() && -[GKLeaderboard releaseState](v8, "releaseState") == 2)
    {
      -[GKLeaderboard title](v8, "title");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLeaderboard description](v8, "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[ItemWithReleaseState titleTextWithTitle:accessibilityDescription:systemSymbolName:tooltipText:paragraphStyle:](_TtC12GameCenterUI20ItemWithReleaseState, "titleTextWithTitle:accessibilityDescription:systemSymbolName:tooltipText:paragraphStyle:", v5, v6, CFSTR("clock.fill"), 0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", v7);

    }
    else
    {
      -[GKLeaderboard title](v8, "title");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](self->_titleLabel, "setText:", v5);
    }

    -[GKLeaderboardCell updateLayout](self, "updateLayout");
    -[GKLeaderboardCell updateSummary](self, "updateSummary");
    -[GKLeaderboardCell updateImage](self, "updateImage");
  }

}

- (void)updateLayout
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  void *v10;
  uint64_t v11;
  id v12;

  -[GKLeaderboardCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory)
  {
    -[GKLeaderboardCell iconContainerHeight](self, "iconContainerHeight");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setConstant:", 335.0);

    -[GKLeaderboardCell titleLabel](self, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v7;
    v8 = 2;
  }
  else
  {
    v9 = dbl_1AB7F82E0[self->_leaderboardSet == 0];
    -[GKLeaderboardCell iconContainerHeight](self, "iconContainerHeight");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setConstant:", v9);

    if (self->_leaderboardSet)
      v11 = 1;
    else
      v11 = 2;
    -[GKLeaderboardCell titleLabel](self, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v7;
    v8 = v11;
  }
  objc_msgSend(v7, "setNumberOfLines:", v8);

}

- (void)updateSummary
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
  GKLeaderboard *v14;

  v14 = self->_leaderboard;
  if (-[GKLeaderboard type](v14, "type") == GKLeaderboardTypeRecurring)
  {
    -[GKLeaderboard startDate](v14, "startDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboard duration](v14, "duration");
    objc_msgSend(v3, "dateByAddingTimeInterval:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLocale:", v6);

    objc_msgSend(v5, "setLocalizedDateFormatFromTemplate:", CFSTR("MMM d, jj:mm"));
    objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimeZone:", v7);

    objc_msgSend(v5, "stringFromDate:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    GKGameCenterUIFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardCell countLabel](self, "countLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);

  }
  else
  {
    -[GKLeaderboardCell updateRank](self, "updateRank");
  }

}

- (void)updateRank
{
  void *v3;
  void *v4;
  void *v5;
  GKLeaderboard *v6;
  void *v7;
  void *v8;
  GKLeaderboard *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  GKLeaderboardCell *v13;
  GKLeaderboard *v14;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardCell setDataToken:](self, "setDataToken:", v4);

  -[GKLeaderboardCell dataToken](self, "dataToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_leaderboard;
  objc_msgSend(MEMORY[0x1E0D252C0], "currentGame");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "gameDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __31__GKLeaderboardCell_updateRank__block_invoke;
  v11[3] = &unk_1E59C7CF8;
  v12 = v5;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v5;
  -[GKLeaderboard loadEntriesWithGameDescriptor:playerScope:timeScope:range:completionHandler:](v9, "loadEntriesWithGameDescriptor:playerScope:timeScope:range:completionHandler:", v8, 1, 2, 1, 600, v11);

}

void __31__GKLeaderboardCell_updateRank__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  _QWORD *v36;
  _QWORD v37[5];

  v8 = a2;
  v9 = a3;
  v10 = a5;
  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "dataToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v11, "isEqualToString:", v12);

  if (!(_DWORD)v11)
  {
    v15 = v9;
    goto LABEL_13;
  }
  v13 = MEMORY[0x1E0C809B0];
  if (!v9 || v10)
  {
    v15 = v9;
LABEL_10:
    v25 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0D252C0], "currentGame");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "gameDescriptor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v13;
    v31[1] = 3221225472;
    v31[2] = __31__GKLeaderboardCell_updateRank__block_invoke_42;
    v31[3] = &unk_1E59C7CD0;
    v28 = *(id *)(a1 + 32);
    v29 = *(_QWORD *)(a1 + 40);
    v32 = v28;
    v33 = v29;
    objc_msgSend(v25, "loadEntriesWithGameDescriptor:playerScope:timeScope:range:completionHandler:", v27, 0, 2, 1, 2, v31);

    goto LABEL_13;
  }
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v37[3] = 1;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __31__GKLeaderboardCell_updateRank__block_invoke_2;
  v34[3] = &unk_1E59C7018;
  v36 = v37;
  v14 = v8;
  v35 = v14;
  objc_msgSend(v9, "_gkFilterWithBlock:", v34);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "count");
  if (v16 < 2)
  {

    _Block_object_dispose(v37, 8);
    goto LABEL_10;
  }
  objc_msgSend(v14, "internal");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "rank");

  if (v18 < 1)
  {
    objc_msgSend(MEMORY[0x1E0D25AC8], "LEADERBOARD_LIST_ITEM_SUBTITLE_FRIENDS_PLAYINGWithCOUNT:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 696), "setText:", v19);
  }
  else
  {
    v30 = (void *)MEMORY[0x1E0CB3940];
    GKGameCenterUIFrameworkBundle();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "internal");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "rank");
    GKFormattedStringWithGroupingFromInteger();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    GKFormattedStringWithGroupingFromInteger();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", v20, v22, v23, v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 696), "setText:", v24);

  }
  _Block_object_dispose(v37, 8);
LABEL_13:

}

id __31__GKLeaderboardCell_updateRank__block_invoke_2(uint64_t a1, void *a2)
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
  v8 = objc_msgSend(v7, "isEqualToNumber:", &unk_1E5A5E250);

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

void __31__GKLeaderboardCell_updateRank__block_invoke_42(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "dataToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "isEqualToString:", v4);

  if ((_DWORD)v3)
  {
    if (objc_msgSend(v10, "rank") < 1)
    {
      GKGameCenterUIFrameworkBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 696), "setText:", v7);
    }
    else
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      GKGameCenterUIFrameworkBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "rank");
      GKFormattedStringWithGroupingFromInteger();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 696), "setText:", v9);

    }
  }

}

- (void)updateImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  GKLeaderboardSet *leaderboardSet;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  GKLeaderboardSet *v13;
  void *v14;
  void *leaderboard;
  uint64_t v16;
  id v17;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__7;
  v23 = __Block_byref_object_dispose__7;
  v24 = 0;
  -[GKLeaderboardCell iconView](self, "iconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompositingFilter:", 0);

  if (self->_leaderboardSet)
  {
    objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "iconLeaderboardSetListSource");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "iconLeaderboardListSource");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v20[5];
  if (v7)
    goto LABEL_9;
  leaderboardSet = self->_leaderboardSet;
  if (leaderboardSet)
    -[GKLeaderboardSet identifier](leaderboardSet, "identifier");
  else
    -[GKLeaderboard identifier](self->_leaderboard, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cachedImageForIdentifier:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v20[5];
  v20[5] = v10;

  v7 = v20[5];
  if (v7)
  {
LABEL_9:
    -[GKLeaderboardCell iconView](self, "iconView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImage:", v7);

    -[GKLeaderboardCell updateOverlay](self, "updateOverlay");
    -[GKLeaderboardCell setNeedsDisplay](self, "setNeedsDisplay");
  }
  else
  {
    v13 = self->_leaderboardSet;
    if (v13)
      -[GKLeaderboardSet imageURL](v13, "imageURL");
    else
      -[GKLeaderboard imageURL](self->_leaderboard, "imageURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    leaderboard = self->_leaderboardSet;
    if (!leaderboard)
      leaderboard = self->_leaderboard;
    v16 = MEMORY[0x1E0C80D38];
    v17 = MEMORY[0x1E0C80D38];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __32__GKLeaderboardCell_updateImage__block_invoke;
    v18[3] = &unk_1E59C7D20;
    v18[4] = self;
    v18[5] = &v19;
    objc_msgSend(v6, "loadImageForURLString:reference:queue:handler:", v14, leaderboard, v16, v18);

  }
  _Block_object_dispose(&v19, 8);

}

void __32__GKLeaderboardCell_updateImage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "leaderboardSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqual:", v6))
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "leaderboard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", v6);

    if (!v9)
      goto LABEL_8;
  }
  if (v12)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 32), "iconView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setImage:", v10);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setupFallbackIcon");
  }
  objc_msgSend(*(id *)(a1 + 32), "updateOverlay");
  objc_msgSend(*(id *)(a1 + 32), "setNeedsDisplay");
LABEL_8:

}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKLeaderboardCell;
  v6 = a4;
  -[GKLeaderboardCell didUpdateFocusInContext:withAnimationCoordinator:](&v8, sel_didUpdateFocusInContext_withAnimationCoordinator_, a3, v6);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__GKLeaderboardCell_didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
  v7[3] = &unk_1E59C4148;
  v7[4] = self;
  objc_msgSend(v6, "addCoordinatedAnimations:completion:", v7, 0);

}

uint64_t __70__GKLeaderboardCell_didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isFocused");
  objc_msgSend(*(id *)(a1 + 32), "customBackgroundBlur");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");

    v6 = (void *)MEMORY[0x1E0DC3F50];
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colorWithAlphaComponent:", 0.22);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "effectCompositingColor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

    objc_msgSend(*(id *)(a1 + 32), "effectView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundEffects:", v5);
    v4 = v5;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "effectView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundEffects:", v4);
  }

  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setHighlighted:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKLeaderboardCell;
  -[GKLeaderboardCell setHighlighted:](&v7, sel_setHighlighted_);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__GKLeaderboardCell_setHighlighted___block_invoke;
  v5[3] = &unk_1E59C5278;
  v5[4] = self;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v5, 0, 0.05);
}

void __36__GKLeaderboardCell_setHighlighted___block_invoke(uint64_t a1)
{
  float v1;
  double v2;
  id v3;

  if (*(_BYTE *)(a1 + 40))
    v1 = 0.5;
  else
    v1 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v2 = v1;
  objc_msgSend(v3, "setOpacity:", v2);

}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKLeaderboardCell;
  -[GKLeaderboardCell setSelected:](&v8, sel_setSelected_);
  -[GKLeaderboardCell layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", 0);

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "_gkSelectedCellBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[GKLeaderboardCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  if (v3)
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
  objc_storeStrong((id *)&self->_imageName, a3);
}

- (GKLeaderboardSet)leaderboardSet
{
  return self->_leaderboardSet;
}

- (GKLeaderboard)leaderboard
{
  return self->_leaderboard;
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)countLabel
{
  return self->_countLabel;
}

- (void)setCountLabel:(id)a3
{
  objc_storeStrong((id *)&self->_countLabel, a3);
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_overlayView, a3);
}

- (NSLayoutConstraint)iconContainerHeight
{
  return self->_iconContainerHeight;
}

- (void)setIconContainerHeight:(id)a3
{
  objc_storeStrong((id *)&self->_iconContainerHeight, a3);
}

- (NSLayoutConstraint)minimumIconHeight
{
  return self->_minimumIconHeight;
}

- (void)setMinimumIconHeight:(id)a3
{
  objc_storeStrong((id *)&self->_minimumIconHeight, a3);
}

- (UIView)iconContainer
{
  return self->_iconContainer;
}

- (void)setIconContainer:(id)a3
{
  objc_storeStrong((id *)&self->_iconContainer, a3);
}

- (UIStackView)containerStackView
{
  return self->_containerStackView;
}

- (void)setContainerStackView:(id)a3
{
  objc_storeStrong((id *)&self->_containerStackView, a3);
}

- (UIColor)titleLabelColor
{
  return self->_titleLabelColor;
}

- (void)setTitleLabelColor:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelColor, a3);
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_effectView, a3);
}

- (NSArray)customBackgroundBlur
{
  return self->_customBackgroundBlur;
}

- (void)setCustomBackgroundBlur:(id)a3
{
  objc_storeStrong((id *)&self->_customBackgroundBlur, a3);
}

- (NSString)dataToken
{
  return self->_dataToken;
}

- (void)setDataToken:(id)a3
{
  objc_storeStrong((id *)&self->_dataToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataToken, 0);
  objc_storeStrong((id *)&self->_customBackgroundBlur, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_titleLabelColor, 0);
  objc_storeStrong((id *)&self->_containerStackView, 0);
  objc_storeStrong((id *)&self->_iconContainer, 0);
  objc_storeStrong((id *)&self->_minimumIconHeight, 0);
  objc_storeStrong((id *)&self->_iconContainerHeight, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_countLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_leaderboard, 0);
  objc_storeStrong((id *)&self->_leaderboardSet, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
