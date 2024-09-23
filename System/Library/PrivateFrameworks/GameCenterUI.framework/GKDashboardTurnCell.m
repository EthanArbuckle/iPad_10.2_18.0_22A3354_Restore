@implementation GKDashboardTurnCell

- (void)awakeFromNib
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GKDashboardTurnCell;
  -[GKDashboardPlayerCell awakeFromNib](&v10, sel_awakeFromNib);
  -[UILabel textColor](self->_dateLabel, "textColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardTurnCell setDateColor:](self, "setDateColor:", v3);

  -[UILabel textColor](self->_turnLabel, "textColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardTurnCell setTurnColor:](self, "setTurnColor:", v4);

  -[NSLayoutConstraint constant](self->_dateToNameConstraint, "constant");
  -[GKDashboardTurnCell setDateToNameConstant:](self, "setDateToNameConstant:");
  -[NSLayoutConstraint constant](self->_turnToNameConstraint, "constant");
  -[GKDashboardTurnCell setTurnToNameConstant:](self, "setTurnToNameConstant:");
  objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statusDotImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_actionIndicatorView, "setImage:", v6);

  -[UIImageView setHidden:](self->_actionIndicatorView, "setHidden:", 1);
  v7 = *MEMORY[0x1E0CD2EA0];
  -[GKDashboardTurnCell turnLabel](self, "turnLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCompositingFilter:", v7);

}

+ (CGSize)defaultSize
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___GKDashboardTurnCell;
  objc_msgSendSuper2(&v4, sel_defaultSize);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)wantsLocalPlayerAction:(id)a3
{
  int v3;

  v3 = objc_msgSend(a3, "state");
  return v3 == 2 || (v3 & 0xFFFFFFFD) == 1;
}

- (void)configureForMatch:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  if (objc_msgSend(v26, "status") == 2)
  {
    objc_msgSend(v26, "firstWinnerOrTiedOrLastLoser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "isLocalPlayer"))
    {
      objc_msgSend(v26, "playingWithParticipantOrFirstKnownPlayer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "player");
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
  }
  else
  {
    objc_msgSend(v26, "currentParticipant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0D25358], "automatchPlayer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  -[GKDashboardPlayerCell setPlayer:](self, "setPlayer:", v5);
  objc_msgSend(v26, "lastTurnDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v26, "creationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "_gkFormattedWhenStringWithOptions:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v26, "state"))
  {
    case 1u:
      objc_msgSend(v26, "currentParticipant");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "inviteMessage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v14, "length"))
        goto LABEL_18;
      goto LABEL_23;
    case 2u:
      objc_msgSend(v26, "activeExchanges");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "message");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v14, "length"))
      {
        GKGameCenterUIFrameworkBundle();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        GKGetLocalizedStringFromTableInBundle();
        v19 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v19;
      }
      goto LABEL_21;
    case 3u:
      goto LABEL_19;
    case 4u:
    case 6u:
      -[GKDashboardPlayerCell player](self, "player");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11
        && (-[GKDashboardPlayerCell player](self, "player"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v13 = objc_msgSend(v12, "isAutomatchPlayer"),
            v12,
            !v13))
      {
        v23 = (void *)MEMORY[0x1E0CB3940];
        GKGameCenterUIFrameworkBundle();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        GKGetLocalizedStringFromTableInBundle();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[GKDashboardPlayerCell player](self, "player");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "displayNameWithOptions:", 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", v17, v25);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
      }
      else
      {
LABEL_19:
        GKGameCenterUIFrameworkBundle();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        GKGetLocalizedStringFromTableInBundle();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_22;
    case 5u:
      objc_msgSend(v26, "localPlayerParticipant");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "participants");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "matchOutcomeStringForLocalPlayer:", objc_msgSend(v21, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v14, "length"))
        goto LABEL_23;
LABEL_18:
      GKGameCenterUIFrameworkBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v22 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v22;
LABEL_22:

LABEL_23:
      -[UILabel setText:](self->_dateLabel, "setText:", v10);
      -[UILabel setText:](self->_turnLabel, "setText:", v14);
      -[UIImageView setHidden:](self->_actionIndicatorView, "setHidden:", -[GKDashboardTurnCell wantsLocalPlayerAction:](self, "wantsLocalPlayerAction:", v26) ^ 1);

      return;
    default:
      v14 = 0;
      goto LABEL_23;
  }
}

- (void)configureForParticipant:(id)a3 inMatch:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  __CFString *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  double turnToNameConstant;
  double dateToNameConstant;
  void *v21;
  uint64_t v22;
  id v23;

  v23 = a3;
  v6 = a4;
  objc_msgSend(v23, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0D25358], "automatchPlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "internal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAutomatchPosition:", -[GKDashboardTurnCell displayIndex](self, "displayIndex"));

  }
  -[GKDashboardPlayerCell setPlayer:](self, "setPlayer:", v7);
  objc_msgSend(v23, "lastTurnDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_gkFormattedWhenStringWithOptions:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentParticipant");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v23)
  {
    objc_msgSend(v6, "localPlayerParticipant");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    GKGameCenterUIFrameworkBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = &stru_1E59EB978;
  }
  if (!-[__CFString length](v12, "length"))
  {
    if (objc_msgSend(v23, "status") == 5)
    {
      objc_msgSend(v6, "participants");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "matchOutcomeString:", -[__CFString count](v15, "count"));
      v16 = objc_claimAutoreleasedReturnValue();

      v12 = v15;
    }
    else
    {
      objc_msgSend(v23, "matchStatusString");
      v16 = objc_claimAutoreleasedReturnValue();
    }

    v12 = (__CFString *)v16;
  }
  -[UILabel setText:](self->_dateLabel, "setText:", v10);
  -[UILabel setText:](self->_turnLabel, "setText:", v12);
  -[UILabel text](self->_dateLabel, "text");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  turnToNameConstant = 0.0;
  dateToNameConstant = 0.0;
  if (v18)
    dateToNameConstant = self->_dateToNameConstant;
  -[NSLayoutConstraint setConstant:](self->_dateToNameConstraint, "setConstant:", dateToNameConstant);
  -[UILabel text](self->_turnLabel, "text");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "length");

  if (v22)
    turnToNameConstant = self->_turnToNameConstant;
  -[NSLayoutConstraint setConstant:](self->_turnToNameConstraint, "setConstant:", turnToNameConstant);

}

- (void)setOnDarkBackground:(BOOL)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKDashboardTurnCell;
  -[GKDashboardPlayerCell setOnDarkBackground:](&v7, sel_setOnDarkBackground_);
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_dateLabel, "setTextColor:", v5);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_turnLabel, "setTextColor:", v6);

  }
  else
  {
    -[UILabel setTextColor:](self->_dateLabel, "setTextColor:", self->_dateColor);
    -[UILabel setTextColor:](self->_turnLabel, "setTextColor:", self->_turnColor);
  }
}

- (int64_t)displayIndex
{
  return self->_displayIndex;
}

- (void)setDisplayIndex:(int64_t)a3
{
  self->_displayIndex = a3;
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (void)setDateLabel:(id)a3
{
  self->_dateLabel = (UILabel *)a3;
}

- (UILabel)turnLabel
{
  return self->_turnLabel;
}

- (void)setTurnLabel:(id)a3
{
  self->_turnLabel = (UILabel *)a3;
}

- (UIImageView)actionIndicatorView
{
  return self->_actionIndicatorView;
}

- (void)setActionIndicatorView:(id)a3
{
  self->_actionIndicatorView = (UIImageView *)a3;
}

- (NSLayoutConstraint)dateToNameConstraint
{
  return self->_dateToNameConstraint;
}

- (void)setDateToNameConstraint:(id)a3
{
  self->_dateToNameConstraint = (NSLayoutConstraint *)a3;
}

- (NSLayoutConstraint)turnToNameConstraint
{
  return self->_turnToNameConstraint;
}

- (void)setTurnToNameConstraint:(id)a3
{
  self->_turnToNameConstraint = (NSLayoutConstraint *)a3;
}

- (UIColor)dateColor
{
  return self->_dateColor;
}

- (void)setDateColor:(id)a3
{
  objc_storeStrong((id *)&self->_dateColor, a3);
}

- (UIColor)turnColor
{
  return self->_turnColor;
}

- (void)setTurnColor:(id)a3
{
  objc_storeStrong((id *)&self->_turnColor, a3);
}

- (double)dateToNameConstant
{
  return self->_dateToNameConstant;
}

- (void)setDateToNameConstant:(double)a3
{
  self->_dateToNameConstant = a3;
}

- (double)turnToNameConstant
{
  return self->_turnToNameConstant;
}

- (void)setTurnToNameConstant:(double)a3
{
  self->_turnToNameConstant = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnColor, 0);
  objc_storeStrong((id *)&self->_dateColor, 0);
}

@end
