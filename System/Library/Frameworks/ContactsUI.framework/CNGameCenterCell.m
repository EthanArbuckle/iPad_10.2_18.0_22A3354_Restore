@implementation CNGameCenterCell

- (CNGameCenterCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNGameCenterCell *v4;
  CNGameCenterCell *v5;
  CNGameCenterCell *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNGameCenterCell;
  v4 = -[CNLabeledCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CNGameCenterCell setupViews](v4, "setupViews");
    v6 = v5;
  }

  return v5;
}

- (void)setCardGroupItem:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNGameCenterCell;
  v4 = a3;
  -[CNContactCell setCardGroupItem:](&v5, sel_setCardGroupItem_, v4);
  -[CNGameCenterCell updateViewsWithCardGroupItem:](self, "updateViewsWithCardGroupItem:", v4, v5.receiver, v5.super_class);

}

- (void)updateViewsWithCardGroupItem:(id)a3
{
  id v4;
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
  void *v39;
  _QWORD v40[7];

  v40[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNGameCenterCell playerView](self, "playerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CNGameCenterCell playerView](self, "playerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

  }
  objc_msgSend(v4, "relationshipResult");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "relatedPlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playerID");
  v39 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGameCenterCell setPlayerID:](self, "setPlayerID:", v8);

  v9 = (void *)objc_msgSend((Class)getGKGameCenterFriendPlayerViewClass[0](), "newWithRelationshipResult:", v38);
  -[CNGameCenterCell setPlayerView:](self, "setPlayerView:", v9);

  -[CNGameCenterCell playerView](self, "playerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CNGameCenterCell playerViewContainer](self, "playerViewContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGameCenterCell playerView](self, "playerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  v27 = (void *)MEMORY[0x1E0CB3718];
  -[CNGameCenterCell playerView](self, "playerView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGameCenterCell playerViewContainer](self, "playerViewContainer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v33;
  -[CNGameCenterCell playerView](self, "playerView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGameCenterCell playerViewContainer](self, "playerViewContainer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v28;
  -[CNGameCenterCell playerView](self, "playerView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGameCenterCell playerViewContainer](self, "playerViewContainer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v13;
  -[CNGameCenterCell playerView](self, "playerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGameCenterCell playerViewContainer](self, "playerViewContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v18;
  -[CNGameCenterCell playerView](self, "playerView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "heightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintGreaterThanOrEqualToConstant:", 70.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v40[4] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "activateConstraints:", v22);

}

- (void)setupViews
{
  UIView *v3;
  UIView *playerViewContainer;
  id v5;

  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  playerViewContainer = self->_playerViewContainer;
  self->_playerViewContainer = v3;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_playerViewContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNGameCenterCell contentView](self, "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", self->_playerViewContainer);

}

- (id)labelView
{
  UILabel *gameCenterLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;

  gameCenterLabel = self->_gameCenterLabel;
  if (!gameCenterLabel)
  {
    -[CNLabeledCell standardLabelView](self, "standardLabelView");
    v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
    v5 = self->_gameCenterLabel;
    self->_gameCenterLabel = v4;

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_gameCenterLabel, "setFont:", v6);

    CNContactsUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("GAME_CENTER_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_gameCenterLabel, "setText:", v8);

    gameCenterLabel = self->_gameCenterLabel;
  }
  return gameCenterLabel;
}

- (id)variableConstraints
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  _BOOL4 v9;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  objc_super v56;
  _QWORD v57[3];
  void *v58;
  _QWORD v59[6];

  v59[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  v56.receiver = self;
  v56.super_class = (Class)CNGameCenterCell;
  -[CNLabeledCell variableConstraints](&v56, sel_variableConstraints);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNGameCenterCell labelView](self, "labelView");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = 0x1E0C99000uLL;
  v55 = v5;
  if (v6
    && (v8 = (void *)v6,
        v9 = -[CNGameCenterCell showsGameCenterLabel](self, "showsGameCenterLabel"),
        v8,
        v9))
  {
    -[CNGameCenterCell gameCenterLabel](self, "gameCenterLabel");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGameCenterCell contentView](self, "contentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "layoutMarginsGuide");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v12;
    -[CNGameCenterCell gameCenterLabel](self, "gameCenterLabel");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "trailingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGameCenterCell contentView](self, "contentView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "layoutMarginsGuide");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v43);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v59[1] = v38;
    -[CNGameCenterCell gameCenterLabel](self, "gameCenterLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGameCenterCell contentView](self, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34, 13.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v59[2] = v33;
    -[CNGameCenterCell gameCenterLabel](self, "gameCenterLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGameCenterCell playerViewContainer](self, "playerViewContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v59[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v17);

    v18 = v39;
    v19 = v49;

    v7 = 0x1E0C99000;
    v20 = v41;

  }
  else
  {
    -[CNGameCenterCell playerViewContainer](self, "playerViewContainer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGameCenterCell contentView](self, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v10, 8.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v12);
  }

  -[CNGameCenterCell playerViewContainer](self, "playerViewContainer");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGameCenterCell contentView](self, "contentView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "layoutMarginsGuide");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "leadingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v46);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v44;
  -[CNGameCenterCell playerViewContainer](self, "playerViewContainer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGameCenterCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layoutMarginsGuide");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v24;
  -[CNGameCenterCell playerViewContainer](self, "playerViewContainer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGameCenterCell contentView](self, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v57[2] = v29;
  objc_msgSend(*(id *)(v7 + 3360), "arrayWithObjects:count:", v57, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "addObjectsFromArray:", v30);

  return v55;
}

- (id)constantConstraintsForVerticalLayout
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)constantConstraintsForHorizontalLayout
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)variableConstraintsForHorizontalLayout
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)presentPlayerProfile
{
  Class v3;
  void *v4;
  uint64_t v5;
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
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v3 = (Class)getGKDaemonProxyClass_46533[0]();
  -[objc_class currentLocalPlayer](getGKLocalPlayerClass_46536(), "currentLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class proxyForPlayer:](v3, "proxyForPlayer:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = getpid();
  objc_msgSend(v15, "utilityService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((Class)getGKGameClass[0](), "currentGame");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "internal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  getGKRemoteAlertDeeplinkActionKey[0]();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  getGKRemoteAlertDeeplinkActionPlayerProfileValue[0]();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  getGKRemoteAlertDeeplinkPlayerIdentifierKey[0]();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v11;
  -[CNGameCenterCell playerID](self, "playerID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  getGKDashboardLaunchContextContacts[0]();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "openDashboardAsRemoteAlertForGame:hostPID:deeplink:launchContext:", v8, v5, v13, v14);

}

- (void)dismissProfileViewController
{
  void *v3;
  void *v4;

  -[CNGameCenterCell presentingDelegate](self, "presentingDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGameCenterCell profileViewController](self, "profileViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sender:dismissViewController:", self, v4);

  -[CNGameCenterCell setProfileViewController:](self, "setProfileViewController:", 0);
}

- (BOOL)showsGameCenterLabel
{
  return self->_showsGameCenterLabel;
}

- (void)setShowsGameCenterLabel:(BOOL)a3
{
  self->_showsGameCenterLabel = a3;
}

- (UILabel)gameCenterLabel
{
  return self->_gameCenterLabel;
}

- (UIView)playerViewContainer
{
  return self->_playerViewContainer;
}

- (void)setPlayerViewContainer:(id)a3
{
  objc_storeStrong((id *)&self->_playerViewContainer, a3);
}

- (UIView)playerView
{
  return self->_playerView;
}

- (void)setPlayerView:(id)a3
{
  objc_storeStrong((id *)&self->_playerView, a3);
}

- (NSString)playerID
{
  return self->_playerID;
}

- (void)setPlayerID:(id)a3
{
  objc_storeStrong((id *)&self->_playerID, a3);
}

- (UIViewController)profileViewController
{
  return self->_profileViewController;
}

- (void)setProfileViewController:(id)a3
{
  objc_storeStrong((id *)&self->_profileViewController, a3);
}

- (CNPresenterDelegate)presentingDelegate
{
  return (CNPresenterDelegate *)objc_loadWeakRetained((id *)&self->_presentingDelegate);
}

- (void)setPresentingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentingDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingDelegate);
  objc_storeStrong((id *)&self->_profileViewController, 0);
  objc_storeStrong((id *)&self->_playerID, 0);
  objc_storeStrong((id *)&self->_playerView, 0);
  objc_storeStrong((id *)&self->_playerViewContainer, 0);
  objc_storeStrong((id *)&self->_gameCenterLabel, 0);
}

@end
