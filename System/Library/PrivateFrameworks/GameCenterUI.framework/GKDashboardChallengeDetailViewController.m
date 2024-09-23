@implementation GKDashboardChallengeDetailViewController

- (GKDashboardChallengeDetailViewController)initWithChallenge:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  GKDashboardChallengeDetailViewController *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_gkPlatformNibName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)GKDashboardChallengeDetailViewController;
  v7 = -[GKDashboardCollectionViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, v5, v6);

  if (v7)
    -[GKDashboardChallengeDetailViewController setChallenge:](v7, "setChallenge:", v4);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKDashboardChallengeDetailViewController;
  -[GKDetailViewController viewDidLoad](&v4, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reportEvent:type:", *MEMORY[0x1E0D25018], *MEMORY[0x1E0D24BB8]);

  -[NSLayoutConstraint constant](self->_topConstraint, "constant");
  -[GKDashboardChallengeDetailViewController setTopMargin:](self, "setTopMargin:");
  -[GKAchievementIconView setIsDetail:](self->_iconView, "setIsDetail:", 1);
  -[GKDashboardChallengeDetailViewController configureForChallenge](self, "configureForChallenge");
}

- (void)viewWillLayoutSubviews
{
  double topMargin;
  void *v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKDashboardChallengeDetailViewController;
  -[GKDashboardChallengeDetailViewController viewWillLayoutSubviews](&v6, sel_viewWillLayoutSubviews);
  topMargin = self->_topMargin;
  -[GKDashboardChallengeDetailViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeAreaInsets");
  -[NSLayoutConstraint setConstant:](self->_topConstraint, "setConstant:", topMargin + v5);

}

- (id)preferredFocusEnvironments
{
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (self->_playButton)
  {
    v4[0] = self->_playButton;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v2;
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
  GKChallenge *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  -[GKChallenge detailFromText](self->_challenge, "detailFromText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("<friend>"), &stru_1E59EB978);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("</friend>"), &stru_1E59EB978);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  -[UILabel setText:](self->_fromLabel, "setText:", v19);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  challenge = self->_challenge;
  if ((isKindOfClass & 1) != 0)
  {
    -[GKChallenge achievement](challenge, "achievement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_titleLabel, "setText:", v8);

    objc_msgSend(v7, "unachievedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_descriptionLabel, "setText:", v9);

    -[GKAchievementIconView setupForAchievement:localAchievement:](self->_iconView, "setupForAchievement:localAchievement:", v7, v7);
  }
  else
  {
    v10 = challenge;
    -[GKChallenge leaderboard](v10, "leaderboard");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_titleLabel, "setText:", v12);

    v13 = (void *)MEMORY[0x1E0CB3940];
    GKGameCenterUIFrameworkBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKChallenge score](v10, "score");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "formattedValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_descriptionLabel, "setText:", v18);

    -[GKDashboardChallengeDetailViewController updateLeaderboardImage](self, "updateLeaderboardImage");
  }
  -[UIButton setHidden:](self->_playButton, "setHidden:", !self->_shouldShowPlay);

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
  GKChallenge *challenge;
  _QWORD v11[5];
  id v12;

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

  -[GKAchievementIconView setImage:](self->_iconView, "setImage:", v8);
  if (!v8)
  {
    objc_msgSend(v4, "imageURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    challenge = self->_challenge;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66__GKDashboardChallengeDetailViewController_updateLeaderboardImage__block_invoke;
    v11[3] = &unk_1E59C5780;
    v11[4] = self;
    v12 = v6;
    objc_msgSend(v12, "loadImageForURLString:reference:queue:handler:", v9, challenge, MEMORY[0x1E0C80D38], v11);

  }
}

void __66__GKDashboardChallengeDetailViewController_updateLeaderboardImage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "challenge");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v6);

  if (v8)
  {
    v9 = (uint64_t)v10;
    if (!v10)
    {
      objc_msgSend(*(id *)(a1 + 40), "defaultImage");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (id)v9;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "setImage:", v9);
  }

}

- (void)play:(id)a3
{
  void *v4;
  id WeakRetained;

  -[UIViewController _gkExtensionViewController](self, "_gkExtensionViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishAndPlayChallenge:", self->_challenge);

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  objc_msgSend(WeakRetained, "userDidSelectPlay:", self);

}

- (void)challengeOK:(id)a3
{
  -[UIViewController _gkRemoveViewController:animated:](self, "_gkRemoveViewController:animated:", self, 1);
}

- (void)decline:(id)a3
{
  id v4;

  -[GKChallenge decline](self->_challenge, "decline", a3);
  -[UIViewController _gkOriginatingViewController](self, "_gkOriginatingViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIViewController _gkRemoveViewController:animated:](self, "_gkRemoveViewController:animated:", self, 1);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "setNeedsRefresh");

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

- (GKAchievementIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  self->_iconView = (GKAchievementIconView *)a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  self->_titleLabel = (UILabel *)a3;
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  self->_descriptionLabel = (UILabel *)a3;
}

- (UILabel)fromLabel
{
  return self->_fromLabel;
}

- (void)setFromLabel:(id)a3
{
  self->_fromLabel = (UILabel *)a3;
}

- (UIButton)playButton
{
  return self->_playButton;
}

- (void)setPlayButton:(id)a3
{
  self->_playButton = (UIButton *)a3;
}

- (UIButton)declineButton
{
  return self->_declineButton;
}

- (void)setDeclineButton:(id)a3
{
  self->_declineButton = (UIButton *)a3;
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
  self->_topConstraint = (NSLayoutConstraint *)a3;
}

- (double)topMargin
{
  return self->_topMargin;
}

- (void)setTopMargin:(double)a3
{
  self->_topMargin = a3;
}

- (NSLayoutConstraint)iconHeightConstraint
{
  return self->_iconHeightConstraint;
}

- (void)setIconHeightConstraint:(id)a3
{
  self->_iconHeightConstraint = (NSLayoutConstraint *)a3;
}

- (NSLayoutConstraint)speechToFromConstraint
{
  return self->_speechToFromConstraint;
}

- (void)setSpeechToFromConstraint:(id)a3
{
  self->_speechToFromConstraint = (NSLayoutConstraint *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_destroyWeak(&self->_delegate);
}

@end
