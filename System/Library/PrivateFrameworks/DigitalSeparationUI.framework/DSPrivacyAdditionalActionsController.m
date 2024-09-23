@implementation DSPrivacyAdditionalActionsController

- (DSPrivacyAdditionalActionsController)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  DSPrivacyAdditionalActionsController *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationWithHierarchicalColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  DSUILocStringForKey(CFSTR("APP_ACCESS_COMPLETE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("APP_ACCESS_COMPLETE_DETAIL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("checklist.checked"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)DSPrivacyAdditionalActionsController;
  v9 = -[DSPrivacyAdditionalActionsController initWithTitle:detailText:icon:](&v11, sel_initWithTitle_detailText_icon_, v6, v7, v8);

  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DSPrivacyAdditionalActionsController;
  -[DSOBWelcomeController viewDidLoad](&v7, sel_viewDidLoad);
  DSUILocStringForKey(CFSTR("CONTINUE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSUIUtilities setUpBoldButtonForController:title:target:selector:](DSUIUtilities, "setUpBoldButtonForController:title:target:selector:", self, v3, self, sel_pushNextPane);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPrivacyAdditionalActionsController setBoldButton:](self, "setBoldButton:", v4);

  DSUILocStringForKey(CFSTR("REVIEW_MORE_APPS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[DSUIUtilities setUpLinkButtonForController:title:target:selector:](DSUIUtilities, "setUpLinkButtonForController:title:target:selector:", self, v5, self, sel_back);

}

- (void)back
{
  id v2;
  id v3;

  -[DSPrivacyAdditionalActionsController navigationController](self, "navigationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  id v3;

  -[DSPrivacyAdditionalActionsController boldButton](self, "boldButton", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hidesBusyIndicator");

}

- (void)pushNextPane
{
  void *v3;
  id v4;

  -[DSPrivacyAdditionalActionsController boldButton](self, "boldButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showsBusyIndicator");

  -[DSPrivacyAdditionalActionsController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushNextPane");

}

- (DSNavigationDelegate)delegate
{
  return (DSNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OBBoldTrayButton)boldButton
{
  return self->_boldButton;
}

- (void)setBoldButton:(id)a3
{
  objc_storeStrong((id *)&self->_boldButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boldButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
