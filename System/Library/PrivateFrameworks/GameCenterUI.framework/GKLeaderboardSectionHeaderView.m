@implementation GKLeaderboardSectionHeaderView

- (void)awakeFromNib
{
  void *v3;
  void *v4;
  NSString *v5;
  const __CFString *v6;
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
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)GKLeaderboardSectionHeaderView;
  -[GKLeaderboardSectionHeaderView awakeFromNib](&v26, sel_awakeFromNib);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardSectionHeaderView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryIsAccessibilityCategory(v5))
  {
    v6 = CFSTR("GKLeaderboardMetadataViewAX_iOS");
  }
  else if (GKIsXRUIIdiomShouldUsePadUI())
  {
    v6 = CFSTR("GKLeaderboardMetadataView_xrOS");
  }
  else
  {
    v6 = CFSTR("GKLeaderboardMetadataView_iOS");
  }
  objc_msgSend(v3, "loadNibNamed:owner:options:", v6, self, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardSectionHeaderView setPersonalView:](self, "setPersonalView:", v8);

  objc_msgSend(v3, "loadNibNamed:owner:options:", v6, self, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardSectionHeaderView setSocialView:](self, "setSocialView:", v10);

  -[GKLeaderboardSectionHeaderView container](self, "container");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardSectionHeaderView personalView](self, "personalView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addArrangedSubview:", v12);

  -[GKLeaderboardSectionHeaderView container](self, "container");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardSectionHeaderView socialView](self, "socialView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addArrangedSubview:", v14);

  -[GKLeaderboardSectionHeaderView personalView](self, "personalView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "configureWithRank:title:footnote:vibrant:", CFSTR("👏"), v17, v19, 0);

  -[GKLeaderboardSectionHeaderView socialView](self, "socialView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardSectionHeaderView formattedNumber:](self, "formattedNumber:", &unk_1E5A5DCB0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "configureWithRank:title:footnote:vibrant:", v21, v23, v25, 1);

  -[GKLeaderboardSectionHeaderView updateLayout](self, "updateLayout");
}

- (id)formattedNumber:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37F0], "localizedStringFromNumber:numberStyle:", a3, 1);
}

- (void)updateLayout
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  UIContentSizeCategory category;

  -[GKLeaderboardSectionHeaderView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  category = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryIsAccessibilityCategory(category))
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "horizontalSizeClass") == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "verticalSizeClass") == 2;

    }
    else
    {
      v6 = 0;
    }

    if (-[NSString isEqualToString:](category, "isEqualToString:", *MEMORY[0x1E0DC48D0]))
    {
      if (!v6)
      {
LABEL_8:
        -[GKLeaderboardSectionHeaderView container](self, "container");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = 0;
        goto LABEL_11;
      }
    }
    else if (-[NSString isEqualToString:](category, "isEqualToString:", *MEMORY[0x1E0DC48D8]) && !v6)
    {
      goto LABEL_8;
    }
    -[GKLeaderboardSectionHeaderView container](self, "container");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = 1;
    goto LABEL_11;
  }
  -[GKLeaderboardSectionHeaderView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "verticalSizeClass") == 1;

  -[GKLeaderboardSectionHeaderView container](self, "container");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = v8;
LABEL_11:
  objc_msgSend(v9, "setAxis:", v11);

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKLeaderboardSectionHeaderView;
  -[GKLeaderboardSectionHeaderView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[GKLeaderboardSectionHeaderView updateLayout](self, "updateLayout");
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

- (void)updateHighlightsWithGameRecord:(id)a3 leaderboardCount:(int64_t)a4 setCount:(int64_t)a5
{
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
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;

  v26 = a3;
  GKGameCenterUIFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  GKGameCenterUIFrameworkBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKLeaderboardSectionHeaderView personalView](self, "personalView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 < 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardSectionHeaderView formattedNumber:](self, "formattedNumber:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0CB3940];
    GKGameCenterUIFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringWithFormat:", v17, a4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardSectionHeaderView formattedNumber:](self, "formattedNumber:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB3940];
    GKGameCenterUIFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringWithFormat:", v17, a5);
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configureWithRank:title:footnote:altFootnote:vibrant:", v14, v19, v9, v11, 1);

  if (!-[GKLeaderboardSectionHeaderView dataUpdated](self, "dataUpdated"))
  {
    v20 = (void *)MEMORY[0x1E0D252A8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/GameCenterUIService/GKLeaderboardSectionHeaderView.m", 166, "-[GKLeaderboardSectionHeaderView updateHighlightsWithGameRecord:leaderboardCount:setCount:]");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dispatchGroupWithName:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __91__GKLeaderboardSectionHeaderView_updateHighlightsWithGameRecord_leaderboardCount_setCount___block_invoke;
    v29[3] = &unk_1E59C41C0;
    v30 = v26;
    v24 = v22;
    v31 = v24;
    objc_msgSend(v24, "perform:", v29);
    v27[0] = v23;
    v27[1] = 3221225472;
    v27[2] = __91__GKLeaderboardSectionHeaderView_updateHighlightsWithGameRecord_leaderboardCount_setCount___block_invoke_3;
    v27[3] = &unk_1E59C4708;
    v27[4] = self;
    v28 = v24;
    v25 = v24;
    objc_msgSend(v25, "notifyOnMainQueueWithBlock:", v27);

  }
}

void __91__GKLeaderboardSectionHeaderView_updateHighlightsWithGameRecord_leaderboardCount_setCount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gameStatServicePrivate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __91__GKLeaderboardSectionHeaderView_updateHighlightsWithGameRecord_leaderboardCount_setCount___block_invoke_2;
  v10[3] = &unk_1E59C46B8;
  v11 = *(id *)(a1 + 40);
  v12 = v3;
  v9 = v3;
  objc_msgSend(v5, "getGamesFriendsPlayed:type:withinSecs:matchingBundleIDs:handler:", 0, CFSTR("all"), 864000000, v8, v10);

}

uint64_t __91__GKLeaderboardSectionHeaderView_updateHighlightsWithGameRecord_leaderboardCount_setCount___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setResult:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __91__GKLeaderboardSectionHeaderView_updateHighlightsWithGameRecord_leaderboardCount_setCount___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setDataUpdated:", 1);
  objc_msgSend(*(id *)(a1 + 40), "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    goto LABEL_13;
  objc_msgSend(*(id *)(a1 + 40), "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {

LABEL_13:
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __91__GKLeaderboardSectionHeaderView_updateHighlightsWithGameRecord_leaderboardCount_setCount___block_invoke_4;
    v21[3] = &unk_1E59C46E0;
    v21[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0D25308], "loadHighlightsWithPlayerScope:timeScope:handler:", 0, 2, v21);
    return;
  }
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
LABEL_5:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v8)
        objc_enumerationMutation(v5);
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D25358]), "initWithInternalRepresentation:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v9));
      objc_msgSend(v4, "addObject:", v10);
      v11 = objc_msgSend(v4, "count");

      if (v11 > 2)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v7)
          goto LABEL_5;
        break;
      }
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "socialView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3940];
  GKGameCenterUIFrameworkBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringWithFormat:", v15, objc_msgSend(v5, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0CB3940];
  GKGameCenterUIFrameworkBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringWithFormat:", v19, objc_msgSend(v5, "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configureWithPlayers:title:footnote:", v4, v16, v20);

}

void __91__GKLeaderboardSectionHeaderView_updateHighlightsWithGameRecord_leaderboardCount_setCount___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void *v9;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v9 = *(void **)(a1 + 32);
  v10 = a2;
  objc_msgSend(v9, "socialView");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "formattedNumber:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB3940];
  GKGameCenterUIFrameworkBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  if (a7 > 99)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedTitle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "localizedStringWithFormat:", v23, a7, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "configureWithRank:title:footnote:vibrant:", &stru_1E59EB978, v13, v25, 1);

    objc_msgSend(*(id *)(a1 + 32), "attributedStringWithSymbol:", CFSTR("globe"));
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "socialView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "rank");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAttributedText:", v28);

    objc_msgSend(*(id *)(a1 + 32), "socialView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "configureVibrancy:", 1);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringWithFormat:", v16, a7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0CB3940];
    GKGameCenterUIFrameworkBundle();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedTitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "stringWithFormat:", v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "configureWithRank:title:footnote:vibrant:", v13, v17, v22, 1);

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

- (GKGameRecord)gameRecord
{
  return self->_gameRecord;
}

- (void)setGameRecord:(id)a3
{
  objc_storeStrong((id *)&self->_gameRecord, a3);
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

- (UIStackView)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (NSLayoutConstraint)contentInsetTop
{
  return self->_contentInsetTop;
}

- (void)setContentInsetTop:(id)a3
{
  objc_storeStrong((id *)&self->_contentInsetTop, a3);
}

- (NSLayoutConstraint)contentInsetBottom
{
  return self->_contentInsetBottom;
}

- (void)setContentInsetBottom:(id)a3
{
  objc_storeStrong((id *)&self->_contentInsetBottom, a3);
}

- (NSLayoutConstraint)contentInsetTrailing
{
  return self->_contentInsetTrailing;
}

- (void)setContentInsetTrailing:(id)a3
{
  objc_storeStrong((id *)&self->_contentInsetTrailing, a3);
}

- (NSLayoutConstraint)contentInsetLeading
{
  return self->_contentInsetLeading;
}

- (void)setContentInsetLeading:(id)a3
{
  objc_storeStrong((id *)&self->_contentInsetLeading, a3);
}

- (BOOL)dataUpdated
{
  return self->_dataUpdated;
}

- (void)setDataUpdated:(BOOL)a3
{
  self->_dataUpdated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentInsetLeading, 0);
  objc_storeStrong((id *)&self->_contentInsetTrailing, 0);
  objc_storeStrong((id *)&self->_contentInsetBottom, 0);
  objc_storeStrong((id *)&self->_contentInsetTop, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_socialView, 0);
  objc_storeStrong((id *)&self->_personalView, 0);
  objc_storeStrong((id *)&self->_gameRecord, 0);
  objc_storeStrong((id *)&self->_leaderboard, 0);
}

@end
