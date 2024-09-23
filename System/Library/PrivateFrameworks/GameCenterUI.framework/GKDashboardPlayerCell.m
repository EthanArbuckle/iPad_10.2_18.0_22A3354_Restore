@implementation GKDashboardPlayerCell

+ (CGSize)defaultSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 320.0;
  v3 = 58.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)preferredCollectionHeight
{
  return 81.0;
}

- (void)awakeFromNib
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKDashboardPlayerCell;
  -[GKFocusHighlightingCollectionViewCell awakeFromNib](&v5, sel_awakeFromNib);
  -[UILabel textColor](self->_nameLabel, "textColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardPlayerCell setNameColor:](self, "setNameColor:", v3);

  -[UILabel textColor](self->_statusLabel, "textColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardPlayerCell setStatusColor:](self, "setStatusColor:", v4);

  -[NSLayoutConstraint constant](self->_playerViewBottomToNameLabelTopConstraint, "constant");
  -[GKDashboardPlayerCell setPlayerViewBottomToNameLabelTopConstant:](self, "setPlayerViewBottomToNameLabelTopConstant:");
  -[GKDashboardPlayerCell setClipsToBounds:](self, "setClipsToBounds:", 0);
  -[GKDashboardPlayerCell setDefaultContentBackgroundColor:](self, "setDefaultContentBackgroundColor:", 0);
  -[UILabel setText:](self->_statusLabel, "setText:", 0);
}

- (UIView)popoverSourceView
{
  return (UIView *)self->_playerView;
}

- (void)setOnDarkBackground:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_onDarkBackground != a3)
  {
    self->_onDarkBackground = a3;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](self->_nameLabel, "setTextColor:", v4);

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](self->_statusLabel, "setTextColor:", v5);

    }
    else
    {
      -[UILabel setTextColor:](self->_nameLabel, "setTextColor:", self->_nameColor);
      -[UILabel setTextColor:](self->_statusLabel, "setTextColor:", self->_statusColor);
    }
  }
}

- (void)setPlayer:(id)a3
{
  void *v5;
  GKPlayer *v6;

  v6 = (GKPlayer *)a3;
  if (self->_player != v6)
  {
    objc_storeStrong((id *)&self->_player, a3);
    -[GKDashboardPlayerShadowView setPlayer:](self->_playerView, "setPlayer:", v6);
    -[GKPlayer displayNameWithOptions:](v6, "displayNameWithOptions:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardPlayerCell setNameText:](self, "setNameText:", v5);

  }
}

- (void)setNameText:(id)a3
{
  -[UILabel setText:](self->_nameLabel, "setText:", a3);
}

- (void)setStatusText:(id)a3
{
  -[UILabel setText:](self->_statusLabel, "setText:", a3);
}

- (void)setStatusWithLastPlayedDate:(id)a3
{
  id v4;

  objc_msgSend(a3, "_gkFormattedWhenStringWithOptions:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GKDashboardPlayerCell setStatusText:](self, "setStatusText:", v4);

}

- (void)updateLabelColorForDashboard
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardPlayerCell setNameColor:](self, "setNameColor:", v3);

  if (self->_onDarkBackground || (-[GKDashboardPlayerCell isFocused](self, "isFocused") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_nameLabel, "setTextColor:", v4);

  }
  else
  {
    -[UILabel setTextColor:](self->_nameLabel, "setTextColor:", self->_nameColor);
  }
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
  v7.super_class = (Class)GKDashboardPlayerCell;
  -[GKDashboardPlayerCell setHighlighted:](&v7, sel_setHighlighted_);
  if (v3)
    objc_msgSend(MEMORY[0x1E0DC3658], "_gkSelectedCellBackgroundColor");
  else
    -[GKDashboardPlayerCell defaultContentBackgroundColor](self, "defaultContentBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardPlayerCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

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
  v8.super_class = (Class)GKDashboardPlayerCell;
  -[GKDashboardPlayerCell setSelected:](&v8, sel_setSelected_);
  -[GKDashboardPlayerCell layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", 0);

  if (v3)
    objc_msgSend(MEMORY[0x1E0DC3658], "_gkSelectedCellBackgroundColor");
  else
    -[GKDashboardPlayerCell defaultContentBackgroundColor](self, "defaultContentBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardPlayerCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

}

- (GKPlayer)player
{
  return self->_player;
}

- (BOOL)onDarkBackground
{
  return self->_onDarkBackground;
}

- (UIColor)defaultContentBackgroundColor
{
  return self->_defaultContentBackgroundColor;
}

- (void)setDefaultContentBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_defaultContentBackgroundColor, a3);
}

- (GKDashboardPlayerShadowView)playerView
{
  return self->_playerView;
}

- (void)setPlayerView:(id)a3
{
  self->_playerView = (GKDashboardPlayerShadowView *)a3;
}

- (NSLayoutConstraint)playerViewBottomToNameLabelTopConstraint
{
  return self->_playerViewBottomToNameLabelTopConstraint;
}

- (void)setPlayerViewBottomToNameLabelTopConstraint:(id)a3
{
  self->_playerViewBottomToNameLabelTopConstraint = (NSLayoutConstraint *)a3;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  self->_nameLabel = (UILabel *)a3;
}

- (UILabel)statusLabel
{
  return self->_statusLabel;
}

- (void)setStatusLabel:(id)a3
{
  self->_statusLabel = (UILabel *)a3;
}

- (UIColor)nameColor
{
  return self->_nameColor;
}

- (void)setNameColor:(id)a3
{
  objc_storeStrong((id *)&self->_nameColor, a3);
}

- (UIColor)statusColor
{
  return self->_statusColor;
}

- (void)setStatusColor:(id)a3
{
  objc_storeStrong((id *)&self->_statusColor, a3);
}

- (double)playerViewBottomToNameLabelTopConstant
{
  return self->_playerViewBottomToNameLabelTopConstant;
}

- (void)setPlayerViewBottomToNameLabelTopConstant:(double)a3
{
  self->_playerViewBottomToNameLabelTopConstant = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusColor, 0);
  objc_storeStrong((id *)&self->_nameColor, 0);
  objc_storeStrong((id *)&self->_defaultContentBackgroundColor, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end
