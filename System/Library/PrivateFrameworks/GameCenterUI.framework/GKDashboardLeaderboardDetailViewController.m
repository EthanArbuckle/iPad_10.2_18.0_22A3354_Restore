@implementation GKDashboardLeaderboardDetailViewController

- (GKDashboardLeaderboardDetailViewController)initWithScore:(id)a3 leaderboard:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  GKDashboardLeaderboardDetailViewController *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "_gkPlatformNibName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "player");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isLocalPlayer") & 1) == 0 && (objc_msgSend(v9, "isFamiliarFriend") & 1) == 0)
  {
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("NoBubbles"));
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)GKDashboardLeaderboardDetailViewController;
  v12 = -[GKDashboardCollectionViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, v8, v11);

  if (v12)
  {
    -[GKDashboardLeaderboardDetailViewController setScore:](v12, "setScore:", v6);
    -[GKDashboardLeaderboardDetailViewController setLeaderboard:](v12, "setLeaderboard:", v7);
  }

  return v12;
}

- (void)viewDidLoad
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)GKDashboardLeaderboardDetailViewController;
  -[GKDetailViewController viewDidLoad](&v20, sel_viewDidLoad);
  -[GKScore player](self->_score, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLocalPlayer");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0D25018];
    objc_msgSend(v5, "reportEvent:type:", *MEMORY[0x1E0D25018], *MEMORY[0x1E0D24BD0]);

    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (uint64_t *)MEMORY[0x1E0D24BE8];
  }
  else
  {
    -[GKScore player](self->_score, "player");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isFamiliarFriend");

    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v6 = *MEMORY[0x1E0D25018];
    if (v10)
    {
      objc_msgSend(v11, "reportEvent:type:", *MEMORY[0x1E0D25018], *MEMORY[0x1E0D24BC0]);

      objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (uint64_t *)MEMORY[0x1E0D24BE0];
    }
    else
    {
      objc_msgSend(v11, "reportEvent:type:", *MEMORY[0x1E0D25018], *MEMORY[0x1E0D24BD8]);

      objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (uint64_t *)MEMORY[0x1E0D24BF0];
    }
  }
  v13 = *v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[GKScore rank](self->_score, "rank"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reportEvent:type:scoreRank:", v6, v13, v14);

  -[UIViewController _gkModifyTopConstraintToLayoutGuideForSubview:](self, "_gkModifyTopConstraintToLayoutGuideForSubview:", self->_playerView);
  if (!self->_reportProblemButton)
  {
    v15 = objc_alloc(MEMORY[0x1E0DC34F0]);
    GKGameCenterUIFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v15, "initWithTitle:style:target:action:", v17, 2, self, sel_report_);
    -[GKDashboardLeaderboardDetailViewController navigationItem](self, "navigationItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setRightBarButtonItem:", v18);

  }
  -[GKDashboardLeaderboardDetailViewController configureForScore](self, "configureForScore");
}

- (id)preferredFocusEnvironments
{
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (self->_firstButton)
  {
    v4[0] = self->_firstButton;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v2;
}

- (void)configureForScore
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
  UIButton **p_firstButton;
  char v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  UIButton **p_secondButton;
  UIButton *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  -[GKScore formattedValue](self->_score, "formattedValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_descriptionLabel, "setText:", v3);

  v4 = (void *)MEMORY[0x1E0CB3940];
  GKGameCenterUIFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKScore rank](self->_score, "rank");
  GKFormattedStringFromInteger();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKScore date](self->_score, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  GKAbsoluteTimeAsWhenString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_earnedOnLabel, "setText:", v10);

  objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  -[GKScore player](self->_score, "player");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardPlayerPhotoView setPlayer:](self->_playerView, "setPlayer:", v11);
  objc_msgSend(v11, "displayNameWithOptions:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_nameLabel, "setText:", v12);

  p_firstButton = &self->_firstButton;
  -[UIButton setHidden:](self->_firstButton, "setHidden:", 1);
  -[UIButton setHidden:](self->_secondButton, "setHidden:", 1);
  -[UIButton removeTarget:action:forControlEvents:](self->_firstButton, "removeTarget:action:forControlEvents:", self, 0, 64);
  -[UIButton removeTarget:action:forControlEvents:](self->_secondButton, "removeTarget:action:forControlEvents:", self, 0, 64);
  v14 = objc_msgSend(v33, "isUnderage");
  -[UILabel setHidden:](self->_infoLabel, "setHidden:", 1);
  v15 = objc_msgSend(v11, "isLocalPlayer");
  if (v15)
  {
    if (objc_msgSend(v33, "numberOfFriends"))
    {
      GKGameCenterUIFrameworkBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = 0;
      if ((v14 & 1) != 0)
      {
        v19 = 0;
        goto LABEL_19;
      }
    }
    else
    {
      v17 = 0;
      if ((v14 & 1) != 0)
      {
        v19 = 0;
        v18 = 0;
        goto LABEL_24;
      }
      v18 = 0;
    }
    goto LABEL_15;
  }
  if (!objc_msgSend(v11, "isFamiliarFriend"))
  {
    v17 = 0;
    v18 = 0;
    v19 = 1;
    goto LABEL_24;
  }
  -[GKLeaderboard localPlayerScore](self->_leaderboard, "localPlayerScore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    GKGameCenterUIFrameworkBundle();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0;
    if ((v14 & 1) != 0)
    {
      v19 = 1;
      goto LABEL_19;
    }
LABEL_15:
    v19 = v15 ^ 1u;
    if (v17)
      p_secondButton = &self->_secondButton;
    else
      p_secondButton = &self->_firstButton;
    v26 = *p_secondButton;
    GKGameCenterUIFrameworkBundle();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v26, "setTitle:forState:", v28, 0);

    -[UIButton addTarget:action:forControlEvents:](v26, "addTarget:action:forControlEvents:", self, sel_share_, 64);
    -[UIButton setHidden:](v26, "setHidden:", 0);

LABEL_19:
    if (v17)
    {
      objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
      v29 = objc_claimAutoreleasedReturnValue();

      -[UIButton setTitle:forState:](*p_firstButton, "setTitle:forState:", v29, 0);
      -[UIButton addTarget:action:forControlEvents:](*p_firstButton, "addTarget:action:forControlEvents:", self, sel_challenge_, 64);
      -[UIButton setHidden:](*p_firstButton, "setHidden:", 0);
      v17 = (void *)v29;
    }
    goto LABEL_21;
  }
  v22 = (void *)MEMORY[0x1E0CB3940];
  GKGameCenterUIFrameworkBundle();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboard localizedTitle](self->_leaderboard, "localizedTitle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", v23, v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  if ((v14 & 1) == 0)
    goto LABEL_15;
  v19 = 1;
LABEL_21:
  if (v18 && !v17)
  {
    -[UILabel setText:](self->_infoLabel, "setText:", v18);
    -[UILabel setHidden:](self->_infoLabel, "setHidden:", 0);
  }
LABEL_24:
  -[UIButton setEnabled:](self->_reportProblemButton, "setEnabled:", v19);
  if (!self->_reportProblemButton)
  {
    -[GKDashboardLeaderboardDetailViewController navigationItem](self, "navigationItem");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "rightBarButtonItem");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setEnabled:", v19);

  }
}

- (void)challenge:(id)a3
{
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
  GKChallengePlayerPickerViewController *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D253C8];
  -[GKScore game](self->_score, "game", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboard localPlayerScore](self->_leaderboard, "localPlayerScore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "challengeForGame:andPlayer:withScore:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKLeaderboard internal](self->_leaderboard, "internal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "internal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLeaderboard:", v9);

  -[GKScore player](self->_score, "player");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[GKScore player](self->_score, "player");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  v14 = -[GKChallengePlayerPickerViewController initWithChallenge:initiallySelectedPlayers:]([GKChallengePlayerPickerViewController alloc], "initWithChallenge:initiallySelectedPlayers:", v8, v13);
  -[UIViewController _gkOriginatingViewController](self, "_gkOriginatingViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_gkPushViewController:replaceCurrent:animated:", v14, 0, 1);

}

- (void)share:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  -[GKScore player](self->_score, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLocalPlayer");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0D25018];
    objc_msgSend(v6, "reportEvent:type:", *MEMORY[0x1E0D25018], *MEMORY[0x1E0D24C18]);

    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (uint64_t *)MEMORY[0x1E0D24C00];
LABEL_5:
    v13 = *v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[GKScore rank](self->_score, "rank"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reportEvent:type:scoreRank:", v7, v13, v14);

    goto LABEL_6;
  }
  -[GKScore player](self->_score, "player");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isFamiliarFriend");

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0D25018];
    objc_msgSend(v12, "reportEvent:type:", *MEMORY[0x1E0D25018], *MEMORY[0x1E0D24C10]);

    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (uint64_t *)MEMORY[0x1E0D24BF8];
    goto LABEL_5;
  }
LABEL_6:
  -[GKDetailViewController shareScore:fromLeaderboard:sendingView:](self, "shareScore:fromLeaderboard:sendingView:", self->_score, self->_leaderboard, v15);

}

- (void)report:(id)a3
{
  id v4;

  -[GKScore player](self->_score, "player", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GKDetailViewController reportProblemAboutPlayer:](self, "reportProblemAboutPlayer:", v4);

}

- (GKDashboardPlayerPhotoView)playerView
{
  return self->_playerView;
}

- (void)setPlayerView:(id)a3
{
  self->_playerView = (GKDashboardPlayerPhotoView *)a3;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  self->_nameLabel = (UILabel *)a3;
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  self->_descriptionLabel = (UILabel *)a3;
}

- (UILabel)earnedOnLabel
{
  return self->_earnedOnLabel;
}

- (void)setEarnedOnLabel:(id)a3
{
  self->_earnedOnLabel = (UILabel *)a3;
}

- (UILabel)infoLabel
{
  return self->_infoLabel;
}

- (void)setInfoLabel:(id)a3
{
  self->_infoLabel = (UILabel *)a3;
}

- (UIButton)firstButton
{
  return self->_firstButton;
}

- (void)setFirstButton:(id)a3
{
  self->_firstButton = (UIButton *)a3;
}

- (UIButton)secondButton
{
  return self->_secondButton;
}

- (void)setSecondButton:(id)a3
{
  self->_secondButton = (UIButton *)a3;
}

- (UIButton)reportProblemButton
{
  return self->_reportProblemButton;
}

- (void)setReportProblemButton:(id)a3
{
  self->_reportProblemButton = (UIButton *)a3;
}

- (GKLeaderboard)leaderboard
{
  return self->_leaderboard;
}

- (void)setLeaderboard:(id)a3
{
  objc_storeStrong((id *)&self->_leaderboard, a3);
}

- (GKScore)score
{
  return self->_score;
}

- (void)setScore:(id)a3
{
  objc_storeStrong((id *)&self->_score, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_leaderboard, 0);
}

@end
