@implementation CNContactViewServiceViewController

- (CNContactViewServiceViewController)init
{
  CNContactViewServiceViewController *v2;
  id v3;
  void *v4;
  uint64_t v5;
  CNContactContentViewController *contactContentVC;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNContactViewServiceViewController;
  v2 = -[CNContactViewServiceViewController init](&v8, sel_init);
  v3 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "classForContentViewControllerImpl"));
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "initWithEnvironment:", v4);
  contactContentVC = v2->_contactContentVC;
  v2->_contactContentVC = (CNContactContentViewController *)v5;

  -[CNContactContentViewController setDelegate:](v2->_contactContentVC, "setDelegate:", v2);
  -[CNContactContentViewController setPptDelegate:](v2->_contactContentVC, "setPptDelegate:", v2);
  return v2;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNContactViewServiceViewController;
  -[CNContactViewServiceViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[CNContactViewServiceViewController contactContentVC](self, "contactContentVC");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController cnui_addChildViewController:](self, "cnui_addChildViewController:", v3);

}

- (BOOL)shouldPerformDefaultActionForContact:(id)a3 propertyKey:(id)a4 propertyIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CNContactViewServiceViewController extensionContext](self, "extensionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "shouldPerformDefaultActionForContact:propertyKey:propertyIdentifier:", v10, v9, v8);

  return v12;
}

- (void)updateEditing:(BOOL)a3 doneButtonEnabled:(BOOL)a4 doneButtonText:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  id v9;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  -[CNContactViewServiceViewController extensionContext](self, "extensionContext");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateEditing:doneButtonEnabled:doneButtonText:", v6, v5, v8);

}

- (void)didCompleteWithContact:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNContactViewServiceViewController extensionContext](self, "extensionContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didCompleteWithContact:", v4);

}

- (void)didDeleteContact:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNContactViewServiceViewController extensionContext](self, "extensionContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didDeleteContact:", v4);

}

- (void)isPresentingFullscreen:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CNContactViewServiceViewController extensionContext](self, "extensionContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "isPresentingFullscreen:", v3);

}

- (void)isPresentingEditingController:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CNContactViewServiceViewController extensionContext](self, "extensionContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "isPresentingEditingController:", v3);

}

- (void)didChangePreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  id v5;

  height = a3.height;
  width = a3.width;
  -[CNContactViewServiceViewController extensionContext](self, "extensionContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didChangePreferredContentSize:", width, height);

}

- (void)viewDidAppear
{
  id v2;

  -[CNContactViewServiceViewController extensionContext](self, "extensionContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewDidAppear");

}

- (void)didExecuteClearRecentsDataAction
{
  id v2;

  -[CNContactViewServiceViewController extensionContext](self, "extensionContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didExecuteClearRecentsDataAction");

}

- (void)didExecuteDeleteFromDowntimeWhitelistAction
{
  id v2;

  -[CNContactViewServiceViewController extensionContext](self, "extensionContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didExecuteDeleteFromDowntimeWhitelistAction");

}

- (void)presentCancelConfirmationAlert
{
  id v2;

  -[CNContactViewServiceViewController extensionContext](self, "extensionContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentCancelConfirmationAlert");

}

- (CNContactContentViewController)contactContentVC
{
  return self->_contactContentVC;
}

- (void)setContactContentVC:(id)a3
{
  objc_storeStrong((id *)&self->_contactContentVC, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactContentVC, 0);
}

+ (Class)classForContentViewControllerImpl
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "featureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "isFeatureEnabled:", 4);

  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

@end
