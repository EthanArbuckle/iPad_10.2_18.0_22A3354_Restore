@implementation GKChallengeDetailViewController

- (GKChallengeDetailViewController)initWithChallenge:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  GKChallengeDetailViewController *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_gkPlatformNibName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)GKChallengeDetailViewController;
  v7 = -[GKDashboardCollectionViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, v5, v6);

  if (v7)
    -[GKChallengeDetailViewController setChallenge:](v7, "setChallenge:", v4);

  return v7;
}

- (void)viewDidLoad
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
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)GKChallengeDetailViewController;
  -[GKDashboardCollectionViewController viewDidLoad](&v16, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reportEvent:type:", *MEMORY[0x1E0D25018], *MEMORY[0x1E0D24BB8]);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKChallengeDetailViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[GKChallengeDetailViewController playerAvatarView](self, "playerAvatarView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKChallengeDetailViewController iconView](self, "iconView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "_gkSpeechViewTintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKChallengeDetailViewController playerAvatarView](self, "playerAvatarView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTintColor:", v9);

  -[GKChallengeDetailViewController configureForChallenge](self, "configureForChallenge");
  -[GKChallengeDetailViewController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setAutoScrollEdgeTransitionDistance:", 40.0);

  -[GKChallengeDetailViewController navigationItem](self, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_setManualScrollEdgeAppearanceEnabled:", 1);

  -[GKChallengeDetailViewController title](self, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKChallengeDetailViewController navigationItem](self, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitle:", v13);

  -[GKChallengeDetailViewController navigationItem](self, "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLargeTitleDisplayMode:", 2);

  -[GKChallengeDetailViewController configureButtons](self, "configureButtons");
  -[GKChallengeDetailViewController adjustLabelFonts](self, "adjustLabelFonts");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKChallengeDetailViewController;
  -[GKDashboardCollectionViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x1E0D25238], "reporter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordPageWithID:pageContext:pageType:", CFSTR("challengeDetail"), CFSTR("dashboard"), CFSTR("challenge"));

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  double Height;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 1)
  {
    -[GKChallengeDetailViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    Height = CGRectGetHeight(v16);
    -[GKChallengeDetailViewController artworkStack](self, "artworkStack");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v8 = Height - CGRectGetHeight(v17);
    -[GKChallengeDetailViewController challengerStack](self, "challengerStack");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v10 = v8 - CGRectGetHeight(v18);
    -[GKChallengeDetailViewController actionStack](self, "actionStack");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v12 = v10 - CGRectGetHeight(v19);

    v13 = v12 / 3.0;
    -[GKChallengeDetailViewController artworkStackPortraitTopConstraint](self, "artworkStackPortraitTopConstraint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setConstant:", v13);

    -[GKChallengeDetailViewController actionStackPortraitBottomConstraint](self, "actionStackPortraitBottomConstraint");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setConstant:", v13);

  }
}

- (void)adjustLabelFonts
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[GKChallengeDetailViewController challengeByNameLabel](self, "challengeByNameLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DC4A88];
  -[GKChallengeDetailViewController adjustFontSizeForLabel:withTextStyle:](self, "adjustFontSizeForLabel:withTextStyle:", v3, *MEMORY[0x1E0DC4A88]);

  -[GKChallengeDetailViewController titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKChallengeDetailViewController adjustFontSizeForLabel:withTextStyle:](self, "adjustFontSizeForLabel:withTextStyle:", v5, v4);

  -[GKChallengeDetailViewController descriptionLabel](self, "descriptionLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKChallengeDetailViewController adjustFontSizeForLabel:withTextStyle:](self, "adjustFontSizeForLabel:withTextStyle:", v6, v4);

  -[GKChallengeDetailViewController playNowButton](self, "playNowButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKChallengeDetailViewController adjustFontSizeForLabel:withTextStyle:](self, "adjustFontSizeForLabel:withTextStyle:", v8, v4);

  -[GKChallengeDetailViewController declineButton](self, "declineButton");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKChallengeDetailViewController adjustFontSizeForLabel:withTextStyle:](self, "adjustFontSizeForLabel:withTextStyle:", v9, v4);

}

- (void)adjustFontSizeForLabel:(id)a3 withTextStyle:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0DC1350];
  v7 = a3;
  objc_msgSend(v5, "preferredFontForTextStyle:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  objc_msgSend(v7, "setAdjustsFontForContentSizeCategory:", 1);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  _BOOL4 IsAccessibilityCategory;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
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
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)GKChallengeDetailViewController;
  -[GKDashboardCollectionViewController traitCollectionDidChange:](&v45, sel_traitCollectionDidChange_, v4);
  -[GKChallengeDetailViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "horizontalSizeClass");
  if (v6 == objc_msgSend(v4, "horizontalSizeClass"))
  {
    -[GKChallengeDetailViewController traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "layoutDirection");
    if (v8 == objc_msgSend(v4, "layoutDirection"))
    {
      -[GKChallengeDetailViewController traitCollection](self, "traitCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "preferredContentSizeCategory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "preferredContentSizeCategory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 == v11)
        goto LABEL_15;
      goto LABEL_7;
    }

  }
LABEL_7:
  -[GKChallengeDetailViewController traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferredContentSizeCategory");
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();

  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v13);
  -[GKChallengeDetailViewController artworkStackPortraitTopConstraint](self, "artworkStackPortraitTopConstraint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (IsAccessibilityCategory)
  {
    objc_msgSend(v15, "setConstant:", 0.0);

    if (-[NSString isEqualToString:](v13, "isEqualToString:", *MEMORY[0x1E0DC48B8])
      || -[NSString isEqualToString:](v13, "isEqualToString:", *MEMORY[0x1E0DC48C0]))
    {
      -[GKChallengeDetailViewController challengerStackLandscapeTopConstraint](self, "challengerStackLandscapeTopConstraint");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setConstant:", 0.0);

      -[GKChallengeDetailViewController challengerStackPortraitTopConstraint](self, "challengerStackPortraitTopConstraint");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setConstant:", 3.0);

      -[GKChallengeDetailViewController actionStackPortraitTopConstraint](self, "actionStackPortraitTopConstraint");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = 0.0;
    }
    else
    {
      -[GKChallengeDetailViewController challengerStackLandscapeTopConstraint](self, "challengerStackLandscapeTopConstraint");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setConstant:", 60.0);

      -[GKChallengeDetailViewController challengerStackPortraitTopConstraint](self, "challengerStackPortraitTopConstraint");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setConstant:", 30.0);

      -[GKChallengeDetailViewController actionStackPortraitTopConstraint](self, "actionStackPortraitTopConstraint");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = 15.0;
    }
    objc_msgSend(v19, "setConstant:", v21);

    -[GKChallengeDetailViewController actionStackPortraitBottomConstraint](self, "actionStackPortraitBottomConstraint");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setConstant:", 0.0);

    -[GKChallengeDetailViewController artworkViewHeightConstraint](self, "artworkViewHeightConstraint");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setConstant:", 100.0);

    -[GKChallengeDetailViewController artworkStack](self, "artworkStack");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setSpacing:", 0.0);

    -[GKChallengeDetailViewController challengerStack](self, "challengerStack");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setSpacing:", 0.0);

    v39 = *MEMORY[0x1E0DC49E8];
    v40 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v41 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v42 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    -[GKChallengeDetailViewController playNowButton](self, "playNowButton");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setTitleEdgeInsets:", v39, v40, v41, v42);

    -[GKChallengeDetailViewController declineButton](self, "declineButton");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTitleEdgeInsets:", v39, v40, v41, v42);
  }
  else
  {
    objc_msgSend(v15, "setConstant:", 30.0);

    -[GKChallengeDetailViewController artworkViewHeightConstraint](self, "artworkViewHeightConstraint");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setConstant:", 200.0);

    -[GKChallengeDetailViewController challengerStackLandscapeTopConstraint](self, "challengerStackLandscapeTopConstraint");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setConstant:", 80.0);

    -[GKChallengeDetailViewController challengerStackPortraitTopConstraint](self, "challengerStackPortraitTopConstraint");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setConstant:", 40.0);

    -[GKChallengeDetailViewController actionStackPortraitTopConstraint](self, "actionStackPortraitTopConstraint");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setConstant:", 25.0);

    -[GKChallengeDetailViewController actionStackPortraitBottomConstraint](self, "actionStackPortraitBottomConstraint");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setConstant:", 25.0);

    -[GKChallengeDetailViewController artworkStack](self, "artworkStack");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setSpacing:", 8.0);

    -[GKChallengeDetailViewController challengerStack](self, "challengerStack");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setSpacing:", 10.0);

    -[GKChallengeDetailViewController playNowButton](self, "playNowButton");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKButtonStyle standardStyle](GKButtonStyle, "standardStyle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "applyButtonStyle:", v30);

    -[GKChallengeDetailViewController declineButton](self, "declineButton");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKButtonStyle standardStyle](GKButtonStyle, "standardStyle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "applyButtonStyle:", v32);

  }
  -[GKChallengeDetailViewController view](self, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "updateConstraintsIfNeeded");

LABEL_15:
}

- (id)title
{
  void *v2;
  void *v3;

  GKGameCenterUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)configureForChallenge
{
  void *v3;
  void *v4;
  char isKindOfClass;
  GKChallenge *challenge;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  GKChallenge *v16;
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
  id v32;

  -[GKChallenge issuingPlayer](self->_challenge, "issuingPlayer");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  -[GKChallengeDetailViewController playerAvatarView](self, "playerAvatarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPlayer:", v32);

  -[GKChallengeDetailViewController challenge](self, "challenge");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  challenge = self->_challenge;
  if ((isKindOfClass & 1) != 0)
  {
    -[GKChallenge achievement](challenge, "achievement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKChallengeDetailViewController titleLabel](self, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    objc_msgSend(v7, "unachievedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKChallengeDetailViewController descriptionLabel](self, "descriptionLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v10);

    GKGameCenterUIFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKChallengeDetailViewController categoryLabel](self, "categoryLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v13);

    +[AchievementUtils achievementBadgeWithAchievement:](_TtC12GameCenterUI16AchievementUtils, "achievementBadgeWithAchievement:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKChallengeDetailViewController updateIconViewWithSubView:](self, "updateIconViewWithSubView:", v15);

  }
  else
  {
    v16 = challenge;
    -[GKChallenge leaderboard](v16, "leaderboard");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "title");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKChallengeDetailViewController titleLabel](self, "titleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v18);

    -[GKChallenge score](v16, "score");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "formattedValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKChallengeDetailViewController descriptionLabel](self, "descriptionLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setText:", v21);

    GKGameCenterUIFrameworkBundle();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKChallengeDetailViewController categoryLabel](self, "categoryLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setText:", v24);

    -[GKChallengeDetailViewController updateLeaderboardImage](self, "updateLeaderboardImage");
  }
  v26 = (void *)MEMORY[0x1E0CB3940];
  GKGameCenterUIFrameworkBundle();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "alias");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKChallengeDetailViewController challengeByNameLabel](self, "challengeByNameLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setText:", v30);

}

- (void)configureButtons
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;

  objc_msgSend(MEMORY[0x1E0DC3518], "_gkXmarkedCloseButtonWithTarget:action:", self, sel_donePressed_);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v25);
  -[GKChallengeDetailViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

  -[GKChallengeDetailViewController playNowButton](self, "playNowButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[GKChallengeDetailViewController playNowButton](self, "playNowButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKButtonStyle standardStyle](GKButtonStyle, "standardStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applyButtonStyle:", v7);

  -[GKChallengeDetailViewController declineButton](self, "declineButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[GKChallengeDetailViewController declineButton](self, "declineButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKButtonStyle standardStyle](GKButtonStyle, "standardStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applyButtonStyle:", v10);

  -[GKChallengeDetailViewController playNowButton](self, "playNowButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:forState:", v13, 0);

  -[GKChallengeDetailViewController playNowButton](self, "playNowButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitle:forState:", v16, 4);

  -[GKChallengeDetailViewController declineButton](self, "declineButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTitle:forState:", v19, 0);

  -[GKChallengeDetailViewController declineButton](self, "declineButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTitle:forState:", v22, 4);

  v23 = -[GKChallengeDetailViewController shouldShowPlay](self, "shouldShowPlay") ^ 1;
  -[GKChallengeDetailViewController playNowButton](self, "playNowButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setHidden:", v23);

}

- (void)donePressed:(id)a3
{
  id v3;

  -[UIViewController _gkExtensionViewController](self, "_gkExtensionViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finish");

}

- (void)playNowPressed:(id)a3
{
  void *v4;
  id v5;

  -[UIViewController _gkExtensionViewController](self, "_gkExtensionViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finish");

  -[UIViewController _gkExtensionViewController](self, "_gkExtensionViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishAndPlayChallenge:", self->_challenge);

}

- (void)declinePressed:(id)a3
{
  void *v4;
  id v5;

  -[GKChallengeDetailViewController challenge](self, "challenge", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decline");

  -[UIViewController _gkRemoveViewController:animated:](self, "_gkRemoveViewController:animated:", self, 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", *MEMORY[0x1E0D24BB0], 0);

}

- (void)challengeOK:(id)a3
{
  -[UIViewController _gkRemoveViewController:animated:](self, "_gkRemoveViewController:animated:", self, 1);
}

- (void)updateLeaderboardImage
{
  GKChallenge *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  GKChallenge *challenge;
  _QWORD v14[5];

  v3 = self->_challenge;
  -[GKChallenge leaderboard](v3, "leaderboard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconLeaderboardListSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cachedImageForIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v8);
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCornerRadius:", 10.0);

    objc_msgSend(v9, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMasksToBounds:", 1);

    -[GKChallengeDetailViewController updateIconViewWithSubView:](self, "updateIconViewWithSubView:", v9);
  }
  else
  {
    objc_msgSend(v4, "imageURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    challenge = self->_challenge;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __57__GKChallengeDetailViewController_updateLeaderboardImage__block_invoke;
    v14[3] = &unk_1E59C4788;
    v14[4] = self;
    objc_msgSend(v6, "loadImageForURLString:reference:queue:handler:", v12, challenge, MEMORY[0x1E0C80D38], v14);

  }
}

void __57__GKChallengeDetailViewController_updateLeaderboardImage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "challenge");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v6);

  if (v8)
  {
    v9 = *MEMORY[0x1E0DC49E8];
    v10 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v11 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v12 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    if (!v20)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("list.bullet.below.star.filled"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "imageWithRenderingMode:", 2);
      v20 = (id)objc_claimAutoreleasedReturnValue();

    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v20);
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTintColor:", v15);

    objc_msgSend(v14, "setContentMode:", 2);
    v16 = *MEMORY[0x1E0CD2EA0];
    objc_msgSend(v14, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCompositingFilter:", v16);

    objc_msgSend(v14, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCornerRadius:", 10.0);

    objc_msgSend(v14, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setMasksToBounds:", 1);

    objc_msgSend(*(id *)(a1 + 32), "updateIconViewWithSubView:edgeInsets:", v14, v9, v10, v11, v12);
  }

}

- (void)updateIconViewWithSubView:(id)a3
{
  -[GKChallengeDetailViewController updateIconViewWithSubView:edgeInsets:](self, "updateIconViewWithSubView:edgeInsets:", a3, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
}

- (void)updateIconViewWithSubView:(id)a3 edgeInsets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v9 = a3;
  -[GKChallengeDetailViewController iconView](self, "iconView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v9);

  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[GKChallengeDetailViewController iconView](self, "iconView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClipsToBounds:", 0);

  v12 = (void *)MEMORY[0x1E0CB3718];
  -[GKChallengeDetailViewController iconView](self, "iconView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_gkInstallEdgeConstraintsForView:containedWithinParentView:edgeInsets:", v9, v13, top, left, bottom, right);

}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (BOOL)shouldShowPlay
{
  return self->_shouldShowPlay;
}

- (void)setShouldShowPlay:(BOOL)a3
{
  self->_shouldShowPlay = a3;
}

- (GKChallenge)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
  objc_storeStrong((id *)&self->_challenge, a3);
}

- (UIView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (UILabel)categoryLabel
{
  return self->_categoryLabel;
}

- (void)setCategoryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_categoryLabel, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (GKDashboardPlayerPhotoView)playerAvatarView
{
  return self->_playerAvatarView;
}

- (void)setPlayerAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_playerAvatarView, a3);
}

- (UILabel)challengeByNameLabel
{
  return self->_challengeByNameLabel;
}

- (void)setChallengeByNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_challengeByNameLabel, a3);
}

- (GKButton)playNowButton
{
  return self->_playNowButton;
}

- (void)setPlayNowButton:(id)a3
{
  objc_storeStrong((id *)&self->_playNowButton, a3);
}

- (GKButton)declineButton
{
  return self->_declineButton;
}

- (void)setDeclineButton:(id)a3
{
  objc_storeStrong((id *)&self->_declineButton, a3);
}

- (UIStackView)artworkStack
{
  return self->_artworkStack;
}

- (void)setArtworkStack:(id)a3
{
  objc_storeStrong((id *)&self->_artworkStack, a3);
}

- (UIStackView)challengerStack
{
  return self->_challengerStack;
}

- (void)setChallengerStack:(id)a3
{
  objc_storeStrong((id *)&self->_challengerStack, a3);
}

- (UIStackView)actionStack
{
  return self->_actionStack;
}

- (void)setActionStack:(id)a3
{
  objc_storeStrong((id *)&self->_actionStack, a3);
}

- (NSLayoutConstraint)artworkStackPortraitTopConstraint
{
  return self->_artworkStackPortraitTopConstraint;
}

- (void)setArtworkStackPortraitTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_artworkStackPortraitTopConstraint, a3);
}

- (NSLayoutConstraint)artworkViewHeightConstraint
{
  return self->_artworkViewHeightConstraint;
}

- (void)setArtworkViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_artworkViewHeightConstraint, a3);
}

- (NSLayoutConstraint)challengerStackLandscapeTopConstraint
{
  return self->_challengerStackLandscapeTopConstraint;
}

- (void)setChallengerStackLandscapeTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_challengerStackLandscapeTopConstraint, a3);
}

- (NSLayoutConstraint)challengerStackPortraitTopConstraint
{
  return self->_challengerStackPortraitTopConstraint;
}

- (void)setChallengerStackPortraitTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_challengerStackPortraitTopConstraint, a3);
}

- (NSLayoutConstraint)actionStackPortraitTopConstraint
{
  return self->_actionStackPortraitTopConstraint;
}

- (void)setActionStackPortraitTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_actionStackPortraitTopConstraint, a3);
}

- (NSLayoutConstraint)actionStackPortraitBottomConstraint
{
  return self->_actionStackPortraitBottomConstraint;
}

- (void)setActionStackPortraitBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_actionStackPortraitBottomConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionStackPortraitBottomConstraint, 0);
  objc_storeStrong((id *)&self->_actionStackPortraitTopConstraint, 0);
  objc_storeStrong((id *)&self->_challengerStackPortraitTopConstraint, 0);
  objc_storeStrong((id *)&self->_challengerStackLandscapeTopConstraint, 0);
  objc_storeStrong((id *)&self->_artworkViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_artworkStackPortraitTopConstraint, 0);
  objc_storeStrong((id *)&self->_actionStack, 0);
  objc_storeStrong((id *)&self->_challengerStack, 0);
  objc_storeStrong((id *)&self->_artworkStack, 0);
  objc_storeStrong((id *)&self->_declineButton, 0);
  objc_storeStrong((id *)&self->_playNowButton, 0);
  objc_storeStrong((id *)&self->_challengeByNameLabel, 0);
  objc_storeStrong((id *)&self->_playerAvatarView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_categoryLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_destroyWeak(&self->_delegate);
}

@end
