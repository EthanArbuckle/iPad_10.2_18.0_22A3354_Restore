@implementation GKDashboardTurnDetailViewController

- (GKDashboardTurnDetailViewController)initWithTurnBasedMatch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  GKDashboardTurnDetailViewController *v7;
  GKDashboardTurnDetailDataSource *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_gkPlatformNibName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)GKDashboardTurnDetailViewController;
  v7 = -[GKDashboardCollectionViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, v5, v6);

  if (v7)
  {
    -[GKDashboardTurnDetailViewController setMatch:](v7, "setMatch:", v4);
    v8 = -[GKDashboardTurnDetailDataSource initWithMatch:]([GKDashboardTurnDetailDataSource alloc], "initWithMatch:", v4);
    -[GKCollectionDataSource setOnDarkBackground:](v8, "setOnDarkBackground:", 0);
    -[GKDashboardCollectionViewController setDataSource:](v7, "setDataSource:", v8);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)GKDashboardTurnDetailViewController;
  -[GKDashboardCollectionViewController dealloc](&v4, sel_dealloc);
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
  UIButton **p_firstButton;
  _BOOL4 shouldShowPlay;
  void *v14;
  char *v15;
  void *v16;
  char **v17;
  void *v18;
  void *v19;
  char *v20;
  char v21;
  void *v22;
  void *v23;
  UIButton **p_secondButton;
  UIButton *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)GKDashboardTurnDetailViewController;
  -[GKDetailViewController viewDidLoad](&v26, sel_viewDidLoad);
  -[UIViewController _gkModifyTopConstraintToLayoutGuideForSubview:](self, "_gkModifyTopConstraintToLayoutGuideForSubview:", self->_playingWithLabel);
  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsSelection:", 0);
  -[GKDashboardTurnDetailViewController match](self, "match");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_playingWithLabel, "setText:", v5);

  v6 = (void *)MEMORY[0x1E0CB3940];
  GKGameCenterUIFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatch creationDate](self->_match, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_gkFormattedDateForStyle:relative:", 2, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_createdLabel, "setText:", v11);

  p_firstButton = &self->_firstButton;
  -[UIButton removeTarget:action:forControlEvents:](self->_firstButton, "removeTarget:action:forControlEvents:", self, 0, 64);
  -[UIButton removeTarget:action:forControlEvents:](self->_secondButton, "removeTarget:action:forControlEvents:", self, 0, 64);
  -[UIButton setHidden:](self->_firstButton, "setHidden:", 1);
  -[UIButton setHidden:](self->_secondButton, "setHidden:", 1);
  shouldShowPlay = self->_shouldShowPlay;
  switch(-[GKTurnBasedMatch state](self->_match, "state"))
  {
    case 1u:
      GKGameCenterUIFrameworkBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = &selRef_acceptInvitation_;
      goto LABEL_5;
    case 2u:
    case 3u:
    case 4u:
    case 5u:
    case 6u:
      GKGameCenterUIFrameworkBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = &selRef_chooseMatch_;
LABEL_5:

      v15 = *v17;
      break;
    default:
      v14 = 0;
      v15 = 0;
      break;
  }
  switch(-[GKTurnBasedMatch state](self->_match, "state"))
  {
    case 1u:
      GKGameCenterUIFrameworkBundle();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = 0;
      v20 = sel_declineInvitation_;
      if (v19)
        goto LABEL_16;
      break;
    case 2u:
    case 3u:
    case 4u:
    case 6u:
      GKGameCenterUIFrameworkBundle();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = sel_quitMatch_;
      if (self->_shouldShowQuit)
      {
        v21 = 0;
        if (v19)
          goto LABEL_16;
      }
      else
      {
        v21 = -[GKTurnBasedMatch isMyTurn](self->_match, "isMyTurn");
        if (v19)
          goto LABEL_16;
      }
      break;
    case 5u:
      GKGameCenterUIFrameworkBundle();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = 0;
      v20 = sel_removeMatch_;
      if (v19)
      {
LABEL_16:
        if ((v21 & 1) == 0)
        {
          if (v14)
            p_secondButton = &self->_secondButton;
          else
            p_secondButton = &self->_firstButton;
          v25 = *p_secondButton;
          -[UIButton setTitle:forState:](v25, "setTitle:forState:", v19, 0);
          -[UIButton addTarget:action:forControlEvents:](v25, "addTarget:action:forControlEvents:", self, v20, 64);
          -[UIButton setHidden:](v25, "setHidden:", 0);

        }
      }
      break;
    default:
      v19 = 0;
      break;
  }
  if (shouldShowPlay && v14)
  {
    -[UIButton setTitle:forState:](*p_firstButton, "setTitle:forState:", v14, 0);
    -[UIButton addTarget:action:forControlEvents:](*p_firstButton, "addTarget:action:forControlEvents:", self, v15, 64);
    -[UIButton setHidden:](*p_firstButton, "setHidden:", 0);
  }

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

- (void)refreshPresenter
{
  id v2;

  -[UIViewController _gkOriginatingViewController](self, "_gkOriginatingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v2, "setNeedsRefresh");

}

- (void)acceptInvitation:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  GKTurnBasedMatch *match;
  _QWORD v8[5];
  uint8_t buf[16];

  v4 = a3;
  if (!*MEMORY[0x1E0D25460])
    v5 = (id)GKOSLoggers();
  v6 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AB361000, v6, OS_LOG_TYPE_INFO, "accepted invitation", buf, 2u);
  }
  match = self->_match;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__GKDashboardTurnDetailViewController_acceptInvitation___block_invoke;
  v8[3] = &unk_1E59C5D58;
  v8[4] = self;
  -[GKTurnBasedMatch acceptInviteWithCompletionHandler:](match, "acceptInviteWithCompletionHandler:", v8);

}

void __56__GKDashboardTurnDetailViewController_acceptInvitation___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_gkExtensionViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithTurnBasedMatch:", v3);

}

- (void)declineInvitation:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  GKTurnBasedMatch *match;
  _QWORD v8[5];
  uint8_t buf[16];

  v4 = a3;
  if (!*MEMORY[0x1E0D25460])
    v5 = (id)GKOSLoggers();
  v6 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AB361000, v6, OS_LOG_TYPE_INFO, "declineInvitation", buf, 2u);
  }
  -[GKDashboardTurnDetailViewController disableButtons](self, "disableButtons");
  match = self->_match;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__GKDashboardTurnDetailViewController_declineInvitation___block_invoke;
  v8[3] = &unk_1E59C45D8;
  v8[4] = self;
  -[GKTurnBasedMatch declineInviteWithCompletionHandler:](match, "declineInviteWithCompletionHandler:", v8);

}

uint64_t __57__GKDashboardTurnDetailViewController_declineInvitation___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "refreshPresenter");
  return objc_msgSend(*(id *)(a1 + 32), "_gkRemoveViewController:animated:", *(_QWORD *)(a1 + 32), 1);
}

- (void)chooseMatch:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[16];

  v4 = a3;
  if (!*MEMORY[0x1E0D25460])
    v5 = (id)GKOSLoggers();
  v6 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AB361000, v6, OS_LOG_TYPE_INFO, "chooseMatch", buf, 2u);
  }
  v7 = (void *)MEMORY[0x1E0D253E0];
  -[GKTurnBasedMatch matchID](self->_match, "matchID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__GKDashboardTurnDetailViewController_chooseMatch___block_invoke;
  v9[3] = &unk_1E59C5D58;
  v9[4] = self;
  objc_msgSend(v7, "loadTurnBasedMatchWithDetailsForMatchID:withCompletionHandler:", v8, v9);

}

void __51__GKDashboardTurnDetailViewController_chooseMatch___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_gkExtensionViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithTurnBasedMatch:", v3);

}

- (void)disableButtons
{
  -[UIButton setEnabled:](self->_firstButton, "setEnabled:", 0);
  -[UIButton setEnabled:](self->_secondButton, "setEnabled:", 0);
  -[GKDashboardTurnDetailViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
}

- (void)quitMatch:(id)a3
{
  id v4;
  NSObject **v5;
  id v6;
  NSObject *v7;
  GKTurnBasedMatch **p_match;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  GKTurnBasedMatch *v15;
  _QWORD v16[5];
  uint8_t buf[16];

  v4 = a3;
  v5 = (NSObject **)MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
    v6 = (id)GKOSLoggers();
  v7 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AB361000, v7, OS_LOG_TYPE_INFO, "quitMatch", buf, 2u);
  }
  -[GKDashboardTurnDetailViewController disableButtons](self, "disableButtons");
  p_match = &self->_match;
  if (-[GKTurnBasedMatch isMyTurn](self->_match, "isMyTurn"))
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_handleTurnBasedEvent_, *MEMORY[0x1E0D24D48], 0);

    -[UIViewController _gkExtensionViewController](self, "_gkExtensionViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "quitTurnBasedMatch:", *p_match);

  }
  else
  {
    -[GKTurnBasedMatch localPlayerParticipant](*p_match, "localPlayerParticipant");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "status");

    if (v12 == 4)
    {
      v13 = *v5;
      if (!*v5)
      {
        v14 = (id)GKOSLoggers();
        v13 = *v5;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[GKDashboardTurnDetailViewController quitMatch:].cold.1((void **)&self->_match, v13);
    }
    v15 = *p_match;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __49__GKDashboardTurnDetailViewController_quitMatch___block_invoke;
    v16[3] = &unk_1E59C45D8;
    v16[4] = self;
    -[GKTurnBasedMatch participantQuitOutOfTurnWithOutcome:withCompletionHandler:](v15, "participantQuitOutOfTurnWithOutcome:withCompletionHandler:", 1, v16);
  }

}

uint64_t __49__GKDashboardTurnDetailViewController_quitMatch___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "refreshPresenter");
  return objc_msgSend(*(id *)(a1 + 32), "_gkRemoveViewController:animated:", *(_QWORD *)(a1 + 32), 1);
}

- (void)removeMatch:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  GKTurnBasedMatch *match;
  _QWORD v8[5];
  uint8_t buf[16];

  v4 = a3;
  if (!*MEMORY[0x1E0D25460])
    v5 = (id)GKOSLoggers();
  v6 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AB361000, v6, OS_LOG_TYPE_INFO, "removeMatch", buf, 2u);
  }
  -[GKDashboardTurnDetailViewController disableButtons](self, "disableButtons");
  match = self->_match;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__GKDashboardTurnDetailViewController_removeMatch___block_invoke;
  v8[3] = &unk_1E59C45D8;
  v8[4] = self;
  -[GKTurnBasedMatch removeWithCompletionHandler:](match, "removeWithCompletionHandler:", v8);

}

uint64_t __51__GKDashboardTurnDetailViewController_removeMatch___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "refreshPresenter");
  return objc_msgSend(*(id *)(a1 + 32), "_gkRemoveViewController:animated:", *(_QWORD *)(a1 + 32), 1);
}

- (void)turnOK:(id)a3
{
  -[UIViewController _gkRemoveViewController:animated:](self, "_gkRemoveViewController:animated:", self, 1);
}

- (void)handleTurnBasedEvent:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  _QWORD block[5];

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedMatch matchID](self->_match, "matchID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__GKDashboardTurnDetailViewController_handleTurnBasedEvent___block_invoke;
    block[3] = &unk_1E59C4148;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __60__GKDashboardTurnDetailViewController_handleTurnBasedEvent___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "refreshPresenter");
  return objc_msgSend(*(id *)(a1 + 32), "_gkRemoveViewController:animated:", *(_QWORD *)(a1 + 32), 1);
}

- (GKTurnBasedMatch)match
{
  return self->_match;
}

- (void)setMatch:(id)a3
{
  objc_storeStrong((id *)&self->_match, a3);
}

- (BOOL)shouldShowPlay
{
  return self->_shouldShowPlay;
}

- (void)setShouldShowPlay:(BOOL)a3
{
  self->_shouldShowPlay = a3;
}

- (BOOL)shouldShowQuit
{
  return self->_shouldShowQuit;
}

- (void)setShouldShowQuit:(BOOL)a3
{
  self->_shouldShowQuit = a3;
}

- (UIView)contentVerticalCenteringView
{
  return self->_contentVerticalCenteringView;
}

- (void)setContentVerticalCenteringView:(id)a3
{
  self->_contentVerticalCenteringView = (UIView *)a3;
}

- (UIView)turnDetailContentView
{
  return self->_turnDetailContentView;
}

- (void)setTurnDetailContentView:(id)a3
{
  self->_turnDetailContentView = (UIView *)a3;
}

- (UILabel)playingWithLabel
{
  return self->_playingWithLabel;
}

- (void)setPlayingWithLabel:(id)a3
{
  self->_playingWithLabel = (UILabel *)a3;
}

- (UILabel)createdLabel
{
  return self->_createdLabel;
}

- (void)setCreatedLabel:(id)a3
{
  self->_createdLabel = (UILabel *)a3;
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

- (NSLayoutConstraint)secondButtonCenteringConstraint
{
  return self->_secondButtonCenteringConstraint;
}

- (void)setSecondButtonCenteringConstraint:(id)a3
{
  self->_secondButtonCenteringConstraint = (NSLayoutConstraint *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_match, 0);
}

- (void)quitMatch:(void *)a1 .cold.1(void **a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = a2;
  objc_msgSend(v3, "localPlayerParticipant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *a1;
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_debug_impl(&dword_1AB361000, v4, OS_LOG_TYPE_DEBUG, "localParticipant: %@ has unexpected status for being active in match: %@", (uint8_t *)&v7, 0x16u);

}

@end
