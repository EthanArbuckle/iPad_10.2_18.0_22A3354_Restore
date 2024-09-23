@implementation GKDashboardLeaderboardCell

- (void)awakeFromNib
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKDashboardLeaderboardCell;
  -[GKDashboardLeaderboardCell awakeFromNib](&v4, sel_awakeFromNib);
  -[GKDashboardLeaderboardCell setClipsToBounds:](self, "setClipsToBounds:", 0);
  -[UIImageView setContentMode:](self->_iconView, "setContentMode:", 2);
  -[UILabel textColor](self->_titleLabel, "textColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardLeaderboardCell setTitleLabelColor:](self, "setTitleLabelColor:", v3);

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
    -[GKDashboardLeaderboardCell updateImage](self, "updateImage");
    v5 = v13;
  }

}

- (void)setLeaderboard:(id)a3
{
  void *v5;
  GKLeaderboard *v6;

  v6 = (GKLeaderboard *)a3;
  if (self->_leaderboard != v6)
  {
    objc_storeStrong((id *)&self->_leaderboard, a3);
    -[GKLeaderboard title](v6, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_titleLabel, "setText:", v5);

    -[GKDashboardLeaderboardCell updateRank](self, "updateRank");
    -[GKDashboardLeaderboardCell updateImage](self, "updateImage");
  }

}

- (void)updateRank
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (-[GKLeaderboard overallRankCount](self->_leaderboard, "overallRankCount") < 0
    || -[GKLeaderboard overallRank](self->_leaderboard, "overallRank") < 1)
  {
    GKGameCenterUIFrameworkBundle();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_countLabel, "setText:", v4);
  }
  else
  {
    if (-[GKLeaderboard friendRank](self->_leaderboard, "friendRank") < 1
      || -[GKLeaderboard friendRankCount](self->_leaderboard, "friendRankCount") < 2)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      GKGameCenterUIFrameworkBundle();
      v10 = (id)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLeaderboard overallRank](self->_leaderboard, "overallRank");
      GKFormattedStringWithGroupingFromInteger();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", v4, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](self->_countLabel, "setText:", v9);

    }
    else
    {
      v3 = (void *)MEMORY[0x1E0CB3940];
      GKGameCenterUIFrameworkBundle();
      v10 = (id)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLeaderboard friendRank](self->_leaderboard, "friendRank");
      GKFormattedStringWithGroupingFromInteger();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLeaderboard friendRankCount](self->_leaderboard, "friendRankCount");
      GKFormattedStringWithGroupingFromInteger();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", v4, v5, v6, -[GKLeaderboard friendRankCount](self->_leaderboard, "friendRankCount"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](self->_countLabel, "setText:", v7);

    }
  }

}

- (void)updateImage
{
  GKLeaderboardSet *leaderboardSet;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *leaderboard;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;

  -[UIImageView setImage:](self->_iconView, "setImage:", 0);
  leaderboardSet = self->_leaderboardSet;
  objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (leaderboardSet)
    objc_msgSend(v4, "iconLeaderboardSetListSource");
  else
    objc_msgSend(v4, "iconLeaderboardListSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIImageView image](self->_iconView, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    leaderboard = self->_leaderboardSet;
    if (!leaderboard)
      leaderboard = self->_leaderboard;
    objc_msgSend(leaderboard, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cachedImageForIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_iconView, "setImage:", v10);

  }
  -[UIImageView image](self->_iconView, "image");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[GKDashboardLeaderboardCell updateOverlay](self, "updateOverlay");
    -[GKDashboardLeaderboardCell setNeedsDisplay](self, "setNeedsDisplay");
  }
  else
  {
    v12 = self->_leaderboardSet;
    if (!v12)
      v12 = self->_leaderboard;
    objc_msgSend(v12, "imageURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self->_leaderboardSet;
    if (!v14)
      v14 = self->_leaderboard;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __41__GKDashboardLeaderboardCell_updateImage__block_invoke;
    v15[3] = &unk_1E59C4760;
    v15[4] = self;
    v16 = v6;
    objc_msgSend(v16, "loadImageForURLString:reference:queue:handler:", v13, v14, MEMORY[0x1E0C80D38], v15);

  }
}

void __41__GKDashboardLeaderboardCell_updateImage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "leaderboardSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v5))
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "leaderboard");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", v5);

    if (!v8)
      goto LABEL_7;
  }
  v9 = (uint64_t)v11;
  if (!v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "defaultImage");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (id)v9;
  objc_msgSend(*(id *)(a1 + 32), "iconView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImage:", v11);

  objc_msgSend(*(id *)(a1 + 32), "updateOverlay");
  objc_msgSend(*(id *)(a1 + 32), "setNeedsDisplay");
LABEL_7:

}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GKDashboardLeaderboardCell;
  -[GKDashboardLeaderboardCell setHighlighted:](&v7, sel_setHighlighted_);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "_gkSelectedCellBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[GKDashboardLeaderboardCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  if (v3)
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
  v8.super_class = (Class)GKDashboardLeaderboardCell;
  -[GKDashboardLeaderboardCell setSelected:](&v8, sel_setSelected_);
  -[GKDashboardLeaderboardCell layer](self, "layer");
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
  -[GKDashboardLeaderboardCell contentView](self, "contentView");
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

- (UIColor)titleLabelColor
{
  return self->_titleLabelColor;
}

- (void)setTitleLabelColor:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabelColor, 0);
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
