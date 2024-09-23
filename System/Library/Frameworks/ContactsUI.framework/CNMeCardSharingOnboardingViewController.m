@implementation CNMeCardSharingOnboardingViewController

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  OBBoldTrayButton *v11;
  OBBoldTrayButton *confirmButton;
  OBBoldTrayButton *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CNMeCardSharingOnboardingViewController;
  -[OBTableWelcomeController viewDidLoad](&v21, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0DC3D48]);
  -[CNMeCardSharingOnboardingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = (void *)objc_msgSend(v3, "initWithFrame:style:", 1);
  -[OBTableWelcomeController setTableView:](self, "setTableView:", v5);

  -[OBTableWelcomeController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShowsVerticalScrollIndicator:", 0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setScrollEnabled:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTableWelcomeController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

  objc_msgSend(MEMORY[0x1E0D65138], "boldButton");
  v11 = (OBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
  confirmButton = self->_confirmButton;
  self->_confirmButton = v11;

  v13 = self->_confirmButton;
  -[CNMeCardSharingOnboardingViewController confirmButtonTitle](self, "confirmButtonTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBoldTrayButton setTitle:forState:](v13, "setTitle:forState:", v14, 0);

  -[OBBoldTrayButton addTarget:action:forControlEvents:](self->_confirmButton, "addTarget:action:forControlEvents:", self, sel_didTapDoneButton_, 64);
  -[CNMeCardSharingOnboardingViewController buttonTray](self, "buttonTray");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addButton:", self->_confirmButton);

  -[OBTableWelcomeController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "heightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToConstant:", 400.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharingOnboardingViewController setTableViewHeightConstraint:](self, "setTableViewHeightConstraint:", v18);

  -[OBTableWelcomeController tableView](self, "tableView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharingOnboardingViewController tableViewHeightConstraint](self, "tableViewHeightConstraint");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addConstraint:", v20);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  objc_super v9;

  -[OBTableWelcomeController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

  -[CNMeCardSharingOnboardingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  -[OBTableWelcomeController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentSize");
  v7 = v6;
  -[CNMeCardSharingOnboardingViewController tableViewHeightConstraint](self, "tableViewHeightConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstant:", v7);

  v9.receiver = self;
  v9.super_class = (Class)CNMeCardSharingOnboardingViewController;
  -[OBTableWelcomeController viewDidLayoutSubviews](&v9, sel_viewDidLayoutSubviews);
}

- (void)updateForContentSizeCategoryChange
{
  id v2;

  -[CNMeCardSharingOnboardingViewController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

}

- (id)confirmButtonTitle
{
  void *v2;
  void *v3;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SHARING_DONE"), &stru_1E20507A8, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (OBBoldTrayButton)confirmButton
{
  return self->_confirmButton;
}

- (void)setConfirmButton:(id)a3
{
  objc_storeStrong((id *)&self->_confirmButton, a3);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (NSLayoutConstraint)tableViewHeightConstraint
{
  return self->_tableViewHeightConstraint;
}

- (void)setTableViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
}

+ (id)headerText
{
  return &stru_1E20507A8;
}

@end
