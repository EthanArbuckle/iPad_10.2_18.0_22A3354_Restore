@implementation _ASAccountSharingGroupOnBoardingViewController

- (_ASAccountSharingGroupOnBoardingViewController)initWithContentType:(unint64_t)a3 group:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _ASAccountSharingGroupOnBoardingViewController *v16;
  _ASAccountSharingGroupOnBoardingViewController *v17;
  _ASAccountSharingGroupOnBoardingViewController *v18;
  objc_super v20;

  v7 = a4;
  v8 = v7;
  switch(a3)
  {
    case 0uLL:
      +[_ASAccountSharingGroupOnBoardingCreateGroupContent headerTitle](_ASAccountSharingGroupOnBoardingCreateGroupContent, "headerTitle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[_ASAccountSharingGroupOnBoardingCreateGroupContent headerImage](_ASAccountSharingGroupOnBoardingCreateGroupContent, "headerImage");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 1uLL:
      objc_msgSend(v7, "displayName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent headerTitleForWelcomeViewWithGroupName:](_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent, "headerTitleForWelcomeViewWithGroupName:", v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent headerImageForWelcomeView](_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent, "headerImageForWelcomeView");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_5:
      v11 = (void *)v10;
      goto LABEL_6;
    case 2uLL:
      +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent headerTitleForMovingCredentialsToGroup](_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent, "headerTitleForMovingCredentialsToGroup");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent headerImageForMovingCredentialsToGroup](_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent, "headerImageForMovingCredentialsToGroup");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "displayName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent descriptionForMovingCredentialsToGroup:](_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent, "descriptionForMovingCredentialsToGroup:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3uLL:
      +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent headerTitleForRemovingDuplicateCredentialsInGroup](_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent, "headerTitleForRemovingDuplicateCredentialsInGroup");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent headerImageForRemovingDuplicateCredentialsInGroup](_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent, "headerImageForRemovingDuplicateCredentialsInGroup");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "displayName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent descriptionForRemovingDuplicateCredentialsInGroup:](_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent, "descriptionForRemovingDuplicateCredentialsInGroup:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v13 = (void *)v15;

      break;
    default:
      v9 = 0;
      v11 = 0;
LABEL_6:
      v13 = 0;
      break;
  }
  v20.receiver = self;
  v20.super_class = (Class)_ASAccountSharingGroupOnBoardingViewController;
  v16 = -[_ASAccountSharingGroupOnBoardingViewController initWithTitle:detailText:icon:contentLayout:](&v20, sel_initWithTitle_detailText_icon_contentLayout_, v9, v13, v11, 2);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_group, a4);
    v17->_contentType = a3;
    v18 = v17;
  }

  return v17;
}

- (void)viewDidLoad
{
  unint64_t contentType;
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)_ASAccountSharingGroupOnBoardingViewController;
  -[OBBaseWelcomeController viewDidLoad](&v24, sel_viewDidLoad);
  contentType = self->_contentType;
  if (contentType == 1)
  {
    +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent firstBulletTitleForWelcomeView](_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent, "firstBulletTitleForWelcomeView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent firstBulletDescriptionForWelcomeView](_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent, "firstBulletDescriptionForWelcomeView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent firstBulletImageForWelcomeView](_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent, "firstBulletImageForWelcomeView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ASAccountSharingGroupOnBoardingViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v13, v14, v15);

    -[KCSharingGroup currentUserParticipant](self->_group, "currentUserParticipant");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "permissionLevel");

    if (v17)
    {
      +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent secondBulletTitleForWelcomeView](_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent, "secondBulletTitleForWelcomeView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent secondBulletDescriptionForWelcomeView](_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent, "secondBulletDescriptionForWelcomeView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent secondBulletImageForWelcomeView](_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent, "secondBulletImageForWelcomeView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ASAccountSharingGroupOnBoardingViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v18, v19, v20);

    }
    +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent thirdBulletTitleForWelcomeView](_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent, "thirdBulletTitleForWelcomeView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent thirdBulletDescriptionForWelcomeView](_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent, "thirdBulletDescriptionForWelcomeView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent thirdBulletImageForWelcomeView](_ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent, "thirdBulletImageForWelcomeView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ASAccountSharingGroupOnBoardingViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v21, v22, v23);

    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidesBackButton:animated:", 1, 1);
    goto LABEL_7;
  }
  if (!contentType)
  {
    +[_ASAccountSharingGroupOnBoardingCreateGroupContent firstBulletTitle](_ASAccountSharingGroupOnBoardingCreateGroupContent, "firstBulletTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ASAccountSharingGroupOnBoardingCreateGroupContent firstBulletDescription](_ASAccountSharingGroupOnBoardingCreateGroupContent, "firstBulletDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ASAccountSharingGroupOnBoardingCreateGroupContent firstBulletImage](_ASAccountSharingGroupOnBoardingCreateGroupContent, "firstBulletImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ASAccountSharingGroupOnBoardingViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v4, v5, v6);

    +[_ASAccountSharingGroupOnBoardingCreateGroupContent secondBulletTitle](_ASAccountSharingGroupOnBoardingCreateGroupContent, "secondBulletTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ASAccountSharingGroupOnBoardingCreateGroupContent secondBulletDescription](_ASAccountSharingGroupOnBoardingCreateGroupContent, "secondBulletDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ASAccountSharingGroupOnBoardingCreateGroupContent secondBulletImage](_ASAccountSharingGroupOnBoardingCreateGroupContent, "secondBulletImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ASAccountSharingGroupOnBoardingViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v7, v8, v9);

    +[_ASAccountSharingGroupOnBoardingCreateGroupContent thirdBulletTitle](_ASAccountSharingGroupOnBoardingCreateGroupContent, "thirdBulletTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ASAccountSharingGroupOnBoardingCreateGroupContent thirdBulletDescription](_ASAccountSharingGroupOnBoardingCreateGroupContent, "thirdBulletDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ASAccountSharingGroupOnBoardingCreateGroupContent thirdBulletImage](_ASAccountSharingGroupOnBoardingCreateGroupContent, "thirdBulletImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ASAccountSharingGroupOnBoardingViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v10, v11, v12);

LABEL_7:
  }
  -[_ASAccountSharingGroupOnBoardingViewController _addButtons](self, "_addButtons");
}

- (void)_addButtons
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t contentType;
  id v7;

  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  switch(self->_contentType)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
      _WBSLocalizedString();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTitle:forState:", v4, 0);

      v3 = v7;
      break;
    default:
      break;
  }
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__continueButtonSelected, 64);
  -[_ASAccountSharingGroupOnBoardingViewController buttonTray](self, "buttonTray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addButton:", v7);

  contentType = self->_contentType;
  if (contentType - 2 >= 2)
  {
    if (!contentType)
      -[_ASAccountSharingGroupOnBoardingViewController _configureCancelButton](self, "_configureCancelButton");
  }
  else
  {
    -[_ASAccountSharingGroupOnBoardingViewController _configureNotNowButton](self, "_configureNotNowButton");
  }

}

- (void)_configureCancelButton
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:forState:", v3, 0);

  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__cancelButtonSelected, 64);
  -[_ASAccountSharingGroupOnBoardingViewController buttonTray](self, "buttonTray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addButton:", v5);

}

- (void)_configureNotNowButton
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:forState:", v3, 0);

  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__notNowButtonSelected, 64);
  -[_ASAccountSharingGroupOnBoardingViewController buttonTray](self, "buttonTray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addButton:", v5);

}

- (void)_continueButtonSelected
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  if (self->_contentType == 1)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v3, "startAnimating");
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", v3);
    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRightBarButtonItem:", v4);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "accountSharingGroupOnBoardingViewControllerDidSelectContinue:", self);

}

- (void)_cancelButtonSelected
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "accountSharingGroupOnBoardingViewControllerDidSelectCancel:", self);

}

- (void)_notNowButtonSelected
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "accountSharingGroupOnBoardingViewControllerDidSelectNotNow:", self);

}

- (KCSharingGroup)group
{
  return self->_group;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (_ASAccountSharingGroupOnBoardingViewControllerDelegate)delegate
{
  return (_ASAccountSharingGroupOnBoardingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_group, 0);
}

@end
