@implementation GKLeaderboardScoreCell

+ (CGSize)defaultSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 60.0;
  v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

+ (id)lowRankNib
{
  return (id)objc_msgSend((id)objc_opt_class(), "_gkNibWithBaseName:", CFSTR("GKLeaderboardScoreLowRankCell"));
}

+ (id)highRankNib
{
  return (id)objc_msgSend((id)objc_opt_class(), "_gkNibWithBaseName:", CFSTR("GKLeaderboardScoreHighRankCell"));
}

- (void)awakeFromNib
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
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)GKLeaderboardScoreCell;
  -[GKFocusHighlightingCollectionViewCell awakeFromNib](&v17, sel_awakeFromNib);
  -[GKLeaderboardScoreCell playerView](self, "playerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUseDarkerPlaceholder:", 1);

  -[GKLeaderboardScoreCell playerView](self, "playerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAvatarSize:", 0x10000);

  objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "secondaryLabelCompositingFilter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardScoreCell scoreLabel](self, "scoreLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCompositingFilter:", v6);

  objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "secondaryLabelCompositingFilter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardScoreCell rankLabel](self, "rankLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCompositingFilter:", v10);

  objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "secondaryLabelCompositingFilter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardScoreCell subtitleLabel](self, "subtitleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCompositingFilter:", v14);

}

- (void)setEntry:(id)a3
{
  void *v5;
  GKLeaderboardEntry *v6;
  GKLeaderboardEntry *v7;

  v7 = (GKLeaderboardEntry *)a3;
  if (self->_entry != v7)
  {
    objc_storeStrong((id *)&self->_entry, a3);
LABEL_4:
    -[GKLeaderboardScoreCell setupForLeaderboardEntry:](self, "setupForLeaderboardEntry:", v7);
    v6 = v7;
    goto LABEL_5;
  }
  -[GKDashboardPlayerPhotoView player](self->_playerView, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (!v5)
    goto LABEL_4;
LABEL_5:

}

- (void)setShouldShowContextMenu:(BOOL)a3
{
  self->_shouldShowContextMenu = a3;
}

- (id)cellBackgroundColor:(BOOL)a3
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (!*MEMORY[0x1E0D253F8])
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v4 = (void *)v5;
      return v4;
    }
LABEL_6:
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!a3)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.05);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setupForLeaderboardEntry:(id)a3
{
  void *v3;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
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
  _BOOL4 v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL8 v34;
  void *v35;
  id v36;

  v36 = a3;
  objc_msgSend(v36, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardScoreCell setIsLocalPlayerScore:](self, "setIsLocalPlayerScore:", objc_msgSend(v5, "isLocalPlayer"));
  -[GKLeaderboardScoreCell cellBackgroundColor:](self, "cellBackgroundColor:", -[GKLeaderboardScoreCell isLocalPlayerScore](self, "isLocalPlayerScore"));
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v6, "CGColor");
  -[GKLeaderboardScoreCell layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

  -[GKLeaderboardScoreCell monogramColorView](self, "monogramColorView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 0);

  -[GKLeaderboardScoreCell playerView](self, "playerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPlayer:", v5);

  -[GKLeaderboardScoreCell playerView](self, "playerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUserInteractionEnabled:", 0);

  objc_msgSend(v5, "displayNameWithOptions:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardScoreCell nameLabel](self, "nameLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  objc_msgSend(v36, "formattedScore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardScoreCell scoreLabel](self, "scoreLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v14);

  v16 = objc_msgSend(v36, "rank");
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16 < 100)
  {
    -[GKLeaderboardScoreCell rankLabel](self, "rankLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTextColor:", v18);

    objc_msgSend(v36, "rank");
    GKFormattedStringWithGroupingFromInteger();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardScoreCell rankLabel](self, "rankLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setText:", v22);
  }
  else
  {
    objc_msgSend(v17, "colorWithAlphaComponent:", 0.5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardScoreCell rankLabel](self, "rankLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTextColor:", v19);

    v21 = (void *)MEMORY[0x1E0CB3940];
    GKGameCenterUIFrameworkBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "rank");
    GKFormattedStringWithGroupingFromInteger();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", v23, v3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLeaderboardScoreCell rankLabel](self, "rankLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setText:", v24);

  }
  v27 = -[GKLeaderboardScoreCell isLocalPlayerScore](self, "isLocalPlayerScore");
  v28 = v27;
  if (v27)
  {
    GKGameCenterUIFrameworkBundle();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
  }
  else
  {
    objc_msgSend(v5, "internal");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "contact");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_gkCompositeName");
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardScoreCell subtitleLabel](self, "subtitleLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setText:", v30);

  if (!v28)
  {

    v30 = v3;
  }

  -[GKLeaderboardScoreCell subtitleLabel](self, "subtitleLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "text");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "length") == 0;
  -[GKLeaderboardScoreCell subtitleLabel](self, "subtitleLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setHidden:", v34);

}

- (void)updateLayerMask:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0DC3508];
  v4 = a3;
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v6, "setFrame:");
  v8 = objc_retainAutorelease(v5);
  objc_msgSend(v6, "setPath:", objc_msgSend(v8, "CGPath"));
  objc_msgSend(v4, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setMask:", v6);
}

- (void)setLineVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !a3;
  -[GKLeaderboardScoreCell topLine](self, "topLine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (BOOL)lineVisible
{
  return !-[UIView isHidden](self->_topLine, "isHidden");
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKLeaderboardScoreCell;
  -[GKLeaderboardScoreCell prepareForReuse](&v6, sel_prepareForReuse);
  -[GKLeaderboardScoreCell playerView](self, "playerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPlayer:", 0);

  -[GKLeaderboardScoreCell cellBackgroundColor:](self, "cellBackgroundColor:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardScoreCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (void)setHighlighted:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKLeaderboardScoreCell;
  -[GKLeaderboardScoreCell setHighlighted:](&v7, sel_setHighlighted_);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__GKLeaderboardScoreCell_setHighlighted___block_invoke;
  v5[3] = &unk_1E59C5278;
  v5[4] = self;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v5, 0, 0.05);
}

void __41__GKLeaderboardScoreCell_setHighlighted___block_invoke(uint64_t a1)
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
  v8.super_class = (Class)GKLeaderboardScoreCell;
  -[GKLeaderboardScoreCell setSelected:](&v8, sel_setSelected_);
  -[GKLeaderboardScoreCell layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", 0);

  if (v3)
    objc_msgSend(MEMORY[0x1E0DC3658], "_gkSelectedCellBackgroundColor");
  else
    -[GKLeaderboardScoreCell cellBackgroundColor:](self, "cellBackgroundColor:", -[GKLeaderboardScoreCell isLocalPlayerScore](self, "isLocalPlayerScore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardScoreCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

}

- (GKLeaderboardEntry)entry
{
  return self->_entry;
}

- (GKLeaderboardScoreActionDelegate)delegate
{
  return (GKLeaderboardScoreActionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldShowContextMenu
{
  return self->_shouldShowContextMenu;
}

- (GKDashboardPlayerPhotoView)playerView
{
  return self->_playerView;
}

- (void)setPlayerView:(id)a3
{
  objc_storeStrong((id *)&self->_playerView, a3);
}

- (NSLayoutConstraint)playerViewHeightConstraint
{
  return self->_playerViewHeightConstraint;
}

- (void)setPlayerViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_playerViewHeightConstraint, a3);
}

- (BOOL)isLocalPlayerScore
{
  return self->_isLocalPlayerScore;
}

- (void)setIsLocalPlayerScore:(BOOL)a3
{
  self->_isLocalPlayerScore = a3;
}

- (UILabel)rankLabel
{
  return self->_rankLabel;
}

- (void)setRankLabel:(id)a3
{
  objc_storeStrong((id *)&self->_rankLabel, a3);
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UILabel)scoreLabel
{
  return self->_scoreLabel;
}

- (void)setScoreLabel:(id)a3
{
  objc_storeStrong((id *)&self->_scoreLabel, a3);
}

- (UIView)topLine
{
  return self->_topLine;
}

- (void)setTopLine:(id)a3
{
  objc_storeStrong((id *)&self->_topLine, a3);
}

- (UIView)monogramColorView
{
  return self->_monogramColorView;
}

- (void)setMonogramColorView:(id)a3
{
  objc_storeStrong((id *)&self->_monogramColorView, a3);
}

- (UIView)backView
{
  return self->_backView;
}

- (void)setBackView:(id)a3
{
  objc_storeStrong((id *)&self->_backView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backView, 0);
  objc_storeStrong((id *)&self->_monogramColorView, 0);
  objc_storeStrong((id *)&self->_topLine, 0);
  objc_storeStrong((id *)&self->_scoreLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_rankLabel, 0);
  objc_storeStrong((id *)&self->_playerViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_playerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_entry, 0);
}

@end
