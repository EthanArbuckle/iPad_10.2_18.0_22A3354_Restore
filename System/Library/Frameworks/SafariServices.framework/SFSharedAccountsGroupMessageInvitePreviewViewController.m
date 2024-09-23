@implementation SFSharedAccountsGroupMessageInvitePreviewViewController

- (SFSharedAccountsGroupMessageInvitePreviewViewController)initWithGroup:(id)a3 invitedGroupMemberData:(id)a4
{
  KCSharingGroup *v6;
  NSArray *v7;
  void *v8;
  void *v9;
  void *v10;
  KCSharingGroup *group;
  KCSharingGroup *v12;
  NSArray *invitedGroupMemberData;
  NSArray *v14;
  SFSharedAccountsGroupMessageInvitePreviewViewController *v15;
  objc_super v17;

  v6 = (KCSharingGroup *)a3;
  v7 = (NSArray *)a4;
  objc_msgSend(MEMORY[0x1E0C92628], "headerTitleForInvitedGroupMemberData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C92628], "headerSubtitleForInvitedGroupMemberData:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C92628], "headerImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  group = self->_group;
  self->_group = v6;
  v12 = v6;

  invitedGroupMemberData = self->_invitedGroupMemberData;
  self->_invitedGroupMemberData = v7;
  v14 = v7;

  v17.receiver = self;
  v17.super_class = (Class)SFSharedAccountsGroupMessageInvitePreviewViewController;
  v15 = -[SFSharedAccountsGroupMessageInvitePreviewViewController initWithTitle:detailText:icon:contentLayout:](&v17, sel_initWithTitle_detailText_icon_contentLayout_, v8, v9, v10, 2);

  return v15;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFSharedAccountsGroupMessageInvitePreviewViewController;
  -[OBBaseWelcomeController viewDidLoad](&v4, sel_viewDidLoad);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidesBackButton:animated:", 1, 1);

  -[SFSharedAccountsGroupMessageInvitePreviewViewController _setUpContentView](self, "_setUpContentView");
  -[SFSharedAccountsGroupMessageInvitePreviewViewController _addContinueAndCancelButtonsToButtonTray](self, "_addContinueAndCancelButtonsToButtonTray");
}

- (void)_setUpContentView
{
  SFSharedAccountsGroupAvatarStackView *v3;
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
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_invitedGroupMemberData, "count") != 1)
  {
    v3 = -[SFSharedAccountsGroupAvatarStackView initWithAvatarDiameter:avatarSpacing:maximumNumberOfAvatarsToDisplay:]([SFSharedAccountsGroupAvatarStackView alloc], "initWithAvatarDiameter:avatarSpacing:maximumNumberOfAvatarsToDisplay:", 5, 72.0, 58.0);
    -[SFSharedAccountsGroupAvatarStackView configureWithInvitedGroupMemberData:](v3, "configureWithInvitedGroupMemberData:", self->_invitedGroupMemberData);
    -[SFSharedAccountsGroupAvatarStackView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFSharedAccountsGroupMessageInvitePreviewViewController contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:", v3);
    v15 = (void *)MEMORY[0x1E0CB3718];
    -[SFSharedAccountsGroupAvatarStackView leadingAnchor](v3, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v20, 1.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v19;
    objc_msgSend(v4, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSharedAccountsGroupAvatarStackView trailingAnchor](v3, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v17, 1.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v16;
    -[SFSharedAccountsGroupAvatarStackView centerXAnchor](v3, "centerXAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerXAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v5;
    -[SFSharedAccountsGroupAvatarStackView topAnchor](v3, "topAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, 2.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22[3] = v8;
    objc_msgSend(v4, "bottomAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSharedAccountsGroupAvatarStackView bottomAnchor](v3, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, 2.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[4] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activateConstraints:", v12);

  }
}

- (void)_addContinueAndCancelButtonsToButtonTray
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C92628], "sendMessageButtonTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v3, 0);

  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__continueButtonSelected, 64);
  -[SFSharedAccountsGroupMessageInvitePreviewViewController buttonTray](self, "buttonTray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addButton:", v8);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C92628], "notNowButtonTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:forState:", v6, 0);

  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__cancelButtonSelected, 64);
  -[SFSharedAccountsGroupMessageInvitePreviewViewController buttonTray](self, "buttonTray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addButton:", v5);

}

- (void)_continueButtonSelected
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "groupMessageInvitePreviewViewControllerDidSelectContinue:", self);

}

- (void)_cancelButtonSelected
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "groupMessageInvitePreviewViewControllerDidSelectCancel:", self);

}

- (KCSharingGroup)group
{
  return self->_group;
}

- (NSArray)invitedGroupMemberData
{
  return self->_invitedGroupMemberData;
}

- (SFSharedAccountsGroupMessageInvitePreviewViewControllerDelegate)delegate
{
  return (SFSharedAccountsGroupMessageInvitePreviewViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_invitedGroupMemberData, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end
