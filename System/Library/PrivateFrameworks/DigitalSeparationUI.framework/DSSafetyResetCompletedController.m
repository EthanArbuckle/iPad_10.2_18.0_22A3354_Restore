@implementation DSSafetyResetCompletedController

- (DSSafetyResetCompletedController)init
{
  void *v3;
  void *v4;
  void *v5;
  DSSafetyResetCompletedController *v6;
  objc_super v8;

  DSUILocStringForKey(CFSTR("SAFETY_RESET_COMPLETED"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("SAFETY_RESET_COMPLETED_DETAIL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("checklist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)DSSafetyResetCompletedController;
  v6 = -[DSSafetyResetCompletedController initWithTitle:detailText:icon:](&v8, sel_initWithTitle_detailText_icon_, v3, v4, v5);

  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)DSSafetyResetCompletedController;
  -[DSOBWelcomeController viewDidLoad](&v14, sel_viewDidLoad);
  DSUILocStringForKey(CFSTR("CONTINUE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSSafetyResetCompletedController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[DSUIUtilities setUpBoldButtonForController:title:target:selector:](DSUIUtilities, "setUpBoldButtonForController:title:target:selector:", self, v3, v4, sel_pushNextPane);

  DSUILocStringForKey(CFSTR("SKIP"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[DSUIUtilities setUpLinkButtonForController:title:target:selector:](DSUIUtilities, "setUpLinkButtonForController:title:target:selector:", self, v6, self, sel_skip);

  DSUILocStringForKey(CFSTR("EMERGENCY_CONTACTS"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("EMERGENCY_CONTACTS_DETAIL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("1.circle.fill"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSSafetyResetCompletedController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v8, v9, v10);

  DSUILocStringForKey(CFSTR("DEVICE_ACCESS"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("DEVICE_ACCESS_DETAIL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("2.circle.fill"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSSafetyResetCompletedController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v11, v12, v13);

}

- (void)skip
{
  -[DSSafetyResetCompletedController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (DSNavigationDelegate)delegate
{
  return (DSNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
