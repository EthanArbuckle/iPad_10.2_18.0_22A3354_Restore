@implementation CNSharingProfileOnboardingAudienceViewController

- (CNSharingProfileOnboardingAudienceViewController)initWithContact:(id)a3 selectedSharingAudience:(unint64_t)a4
{
  id v6;
  void *v7;
  CNSharingProfileOnboardingAudienceViewController *v8;
  CNSharingProfileAudienceDataSource *v9;
  CNSharingProfileAudienceDataSource *sharingAudienceDataSource;
  uint64_t v11;
  CNMutableContact *contact;
  CNSharingProfileOnboardingAudienceViewController *v13;
  objc_super v15;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "headerText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)CNSharingProfileOnboardingAudienceViewController;
  v8 = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v15, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v7, 0, 0, 0);

  if (v8)
  {
    v9 = -[CNSharingProfileAudienceDataSource initWithSelectedSharingAudience:]([CNSharingProfileAudienceDataSource alloc], "initWithSelectedSharingAudience:", a4);
    sharingAudienceDataSource = v8->_sharingAudienceDataSource;
    v8->_sharingAudienceDataSource = v9;

    v11 = objc_msgSend(v6, "mutableCopy");
    contact = v8->_contact;
    v8->_contact = (CNMutableContact *)v11;

    v13 = v8;
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CNSharingProfileOnboardingAudienceViewController;
  -[CNSharingProfileOnboardingAudienceViewController dealloc](&v4, sel_dealloc);
}

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
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  OBBoldTrayButton *v18;
  OBBoldTrayButton *confirmButton;
  OBBoldTrayButton *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  UITextField *v35;
  UITextField *givenNameField;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  UITextField *v42;
  UITextField *familyNameField;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  id traitCollectionChangeToken;
  _QWORD v59[4];
  id v60;
  id location;
  objc_super v62;

  v62.receiver = self;
  v62.super_class = (Class)CNSharingProfileOnboardingAudienceViewController;
  -[OBTableWelcomeController viewDidLoad](&v62, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0DC3D48]);
  -[CNSharingProfileOnboardingAudienceViewController view](self, "view");
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

  -[OBTableWelcomeController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setKeyboardDismissMode:", 2);

  -[OBTableWelcomeController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("Cell"));

  -[OBTableWelcomeController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  +[CNSharingProfileOnboardingNameCell cellIdentifier](CNSharingProfileOnboardingNameCell, "cellIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerClass:forCellReuseIdentifier:", v14, v15);

  -[OBTableWelcomeController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelegate:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDataSource:", self);

  objc_msgSend(MEMORY[0x1E0D65138], "boldButton");
  v18 = (OBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
  confirmButton = self->_confirmButton;
  self->_confirmButton = v18;

  v20 = self->_confirmButton;
  -[CNSharingProfileOnboardingAudienceViewController confirmButtonTitle](self, "confirmButtonTitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBoldTrayButton setTitle:forState:](v20, "setTitle:forState:", v21, 0);

  -[OBBoldTrayButton addTarget:action:forControlEvents:](self->_confirmButton, "addTarget:action:forControlEvents:", self, sel_handleConfirmButtonTapped_, 64);
  -[CNSharingProfileOnboardingAudienceViewController updateConfirmButtonEnabledState](self, "updateConfirmButtonEnabledState");
  -[CNSharingProfileOnboardingAudienceViewController buttonTray](self, "buttonTray");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addButton:", self->_confirmButton);

  -[CNSharingProfileOnboardingAudienceViewController setShouldAdjustScrollViewInsetForKeyboard:](self, "setShouldAdjustScrollViewInsetForKeyboard:", 1);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "userInterfaceIdiom");

  -[CNSharingProfileOnboardingAudienceViewController setShouldAdjustButtonTrayForKeyboard:](self, "setShouldAdjustButtonTrayForKeyboard:", (v24 & 0xFFFFFFFFFFFFFFFBLL) != 1);
  -[OBTableWelcomeController tableView](self, "tableView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "heightAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToConstant:", 400.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfileOnboardingAudienceViewController setTableViewHeightConstraint:](self, "setTableViewHeightConstraint:", v27);

  -[OBTableWelcomeController tableView](self, "tableView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfileOnboardingAudienceViewController tableViewHeightConstraint](self, "tableViewHeightConstraint");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addConstraint:", v29);

  v30 = objc_alloc(MEMORY[0x1E0DC3DB8]);
  v31 = *MEMORY[0x1E0C9D648];
  v32 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v33 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v34 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v35 = (UITextField *)objc_msgSend(v30, "initWithFrame:", *MEMORY[0x1E0C9D648], v32, v33, v34);
  givenNameField = self->_givenNameField;
  self->_givenNameField = v35;

  -[CNMutableContact givenName](self->_contact, "givenName");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](self->_givenNameField, "setText:", v37);

  v38 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setFont:](self->_givenNameField, "setFont:", v39);

  -[UITextField setAdjustsFontForContentSizeCategory:](self->_givenNameField, "setAdjustsFontForContentSizeCategory:", 1);
  -[UITextField setAutocorrectionType:](self->_givenNameField, "setAutocorrectionType:", 1);
  CNContactsUIBundle();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("SHARING_GIVEN_NAME_PLACEHOLDER"), &stru_1E20507A8, CFSTR("Localized"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setPlaceholder:](self->_givenNameField, "setPlaceholder:", v41);

  -[UITextField addTarget:action:forControlEvents:](self->_givenNameField, "addTarget:action:forControlEvents:", self, sel_givenNameDidChange_, 0x20000);
  -[UITextField setDelegate:](self->_givenNameField, "setDelegate:", self);
  v42 = (UITextField *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3DB8]), "initWithFrame:", v31, v32, v33, v34);
  familyNameField = self->_familyNameField;
  self->_familyNameField = v42;

  -[CNMutableContact familyName](self->_contact, "familyName");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](self->_familyNameField, "setText:", v44);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v38);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setFont:](self->_familyNameField, "setFont:", v45);

  -[UITextField setAdjustsFontForContentSizeCategory:](self->_familyNameField, "setAdjustsFontForContentSizeCategory:", 1);
  -[UITextField setAutocorrectionType:](self->_familyNameField, "setAutocorrectionType:", 1);
  CNContactsUIBundle();
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("SHARING_FAMILY_NAME_PLACEHOLDER"), &stru_1E20507A8, CFSTR("Localized"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setPlaceholder:](self->_familyNameField, "setPlaceholder:", v47);

  -[UITextField addTarget:action:forControlEvents:](self->_familyNameField, "addTarget:action:forControlEvents:", self, sel_familyNameDidChange_, 0x20000);
  -[UITextField setDelegate:](self->_familyNameField, "setDelegate:", self);
  v48 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  -[CNMutableContact givenName](self->_contact, "givenName");
  v49 = objc_claimAutoreleasedReturnValue();
  if (!v49
    || (v50 = (void *)v49,
        -[CNMutableContact familyName](self->_contact, "familyName"),
        v51 = (void *)objc_claimAutoreleasedReturnValue(),
        v51,
        v50,
        !v51))
  {
    v52 = objc_alloc_init(MEMORY[0x1E0CB3850]);

    -[CNMutableContact givenName](self->_contact, "givenName");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setGivenName:", v53);

    -[CNMutableContact familyName](self->_contact, "familyName");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setFamilyName:", v54);

    v48 = v52;
  }
  self->_nameOrder = objc_msgSend(MEMORY[0x1E0CB3858], "_nameOrderWithOverridesForComponents:options:", v48, 0);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = *MEMORY[0x1E0DC48E8];
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __63__CNSharingProfileOnboardingAudienceViewController_viewDidLoad__block_invoke;
  v59[3] = &unk_1E204C298;
  objc_copyWeak(&v60, &location);
  objc_msgSend(v55, "addObserverForName:object:queue:usingBlock:", v56, 0, 0, v59);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  traitCollectionChangeToken = self->_traitCollectionChangeToken;
  self->_traitCollectionChangeToken = v57;

  objc_destroyWeak(&v60);
  objc_destroyWeak(&location);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  objc_super v10;

  -[OBTableWelcomeController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNSharingProfileOnboardingAudienceViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutIfNeeded");

    -[OBTableWelcomeController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentSize");
    v8 = v7;
    -[CNSharingProfileOnboardingAudienceViewController tableViewHeightConstraint](self, "tableViewHeightConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setConstant:", v8);

  }
  v10.receiver = self;
  v10.super_class = (Class)CNSharingProfileOnboardingAudienceViewController;
  -[OBTableWelcomeController viewDidLayoutSubviews](&v10, sel_viewDidLayoutSubviews);
}

- (void)givenNameDidChange:(id)a3
{
  void *v4;

  objc_msgSend(a3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMutableContact setGivenName:](self->_contact, "setGivenName:", v4);

  -[CNSharingProfileOnboardingAudienceViewController updateConfirmButtonEnabledState](self, "updateConfirmButtonEnabledState");
}

- (void)familyNameDidChange:(id)a3
{
  void *v4;

  objc_msgSend(a3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMutableContact setFamilyName:](self->_contact, "setFamilyName:", v4);

  -[CNSharingProfileOnboardingAudienceViewController updateConfirmButtonEnabledState](self, "updateConfirmButtonEnabledState");
}

- (void)updateConfirmButtonEnabledState
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = *MEMORY[0x1E0D13848];
  -[CNMutableContact givenName](self->_contact, "givenName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(uint64_t, void *))(v3 + 16))(v3, v4))
  {
    -[CNMutableContact familyName](self->_contact, "familyName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (*(unsigned int (**)(uint64_t, void *))(v3 + 16))(v3, v5) ^ 1;

  }
  else
  {
    v6 = 1;
  }

  -[OBBoldTrayButton setEnabled:](self->_confirmButton, "setEnabled:", v6);
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNSharingProfileOnboardingAudienceViewController;
  -[CNSharingProfileOnboardingAudienceViewController traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, a3);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  -[CNSharingProfileOnboardingAudienceViewController setShouldAdjustButtonTrayForKeyboard:](self, "setShouldAdjustButtonTrayForKeyboard:", (v5 & 0xFFFFFFFFFFFFFFFBLL) != 1);
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  void *v4;
  id v5;

  -[OBTableWelcomeController tableView](self, "tableView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

  -[CNSharingProfileOnboardingAudienceViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

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

- (void)handleConfirmButtonTapped:(id)a3
{
  id v4;

  -[CNSharingProfileOnboardingAudienceViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audienceController:didFinishWithContact:sharingAudience:", self, self->_contact, -[CNSharingProfileAudienceDataSource selectedSharingAudience](self->_sharingAudienceDataSource, "selectedSharingAudience"));

}

- (id)cellForNameInTableView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v4 = a3;
  +[CNSharingProfileOnboardingNameCell cellIdentifier](CNSharingProfileOnboardingNameCell, "cellIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dequeueReusableCellWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setGivenNameField:familyNameField:", self->_givenNameField, self->_familyNameField);
  -[CNMutableContact givenName](self->_contact, "givenName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGivenName:", v7);

  -[CNMutableContact familyName](self->_contact, "familyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFamilyName:", v8);

  objc_msgSend(v6, "setNameOrder:", self->_nameOrder);
  v9 = objc_alloc(MEMORY[0x1E0DC3870]);
  -[CNMutableContact thumbnailImageData](self->_contact, "thumbnailImageData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithData:", v10);

  objc_msgSend(v6, "setAvatarImage:", v11);
  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
    return -[CNSharingProfileAudienceDataSource numberOfItems](self->_sharingAudienceDataSource, "numberOfItems", a3);
  else
    return 1;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4 < 1)
    return 0;
  -[CNSharingProfileAudienceDataSource sectionHeaderLabel](self->_sharingAudienceDataSource, "sectionHeaderLabel", a3, v4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4 < 1)
    return 0;
  -[CNSharingProfileAudienceDataSource sectionFooterLabel](self->_sharingAudienceDataSource, "sectionFooterLabel", a3, v4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  double v6;
  void *v8;
  double v9;
  double v10;

  v5 = a4;
  if (objc_msgSend(v5, "section") || objc_msgSend(v5, "row"))
  {
    v6 = *MEMORY[0x1E0DC53D8];
  }
  else
  {
    -[UITextField font](self->_givenNameField, "font");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lineHeight");
    v6 = v9 * 2.0 + 20.0;

    +[CNSharingProfileOnboardingNameCell desiredMinimumCellHeight](CNSharingProfileOnboardingNameCell, "desiredMinimumCellHeight");
    if (v6 < v10)
      v6 = v10;
  }

  return v6;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  unint64_t v6;
  id v7;

  v5 = a4;
  v6 = -[CNSharingProfileAudienceDataSource selectedIndex](self->_sharingAudienceDataSource, "selectedIndex");
  if (v6 == objc_msgSend(v5, "row"))
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v6, "section"))
  {
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("Cell"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNSharingProfileAudienceDataSource itemForIndex:](self->_sharingAudienceDataSource, "itemForIndex:", objc_msgSend(v6, "row"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v9);

    objc_msgSend(v8, "setSelectionStyle:", 0);
    objc_msgSend(v7, "accessoryView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v7, "accessoryView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAccessoryView:", v12);

    }
    else
    {
      objc_msgSend(v8, "setAccessoryView:", 0);
    }
    if (objc_msgSend(v7, "isSelected"))
      v13 = 3;
    else
      v13 = 0;
    objc_msgSend(v8, "setAccessoryType:", v13);
  }
  else
  {
    -[CNSharingProfileOnboardingAudienceViewController cellForNameInTableView:](self, "cellForNameInTableView:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = -[CNSharingProfileAudienceDataSource selectedIndex](self->_sharingAudienceDataSource, "selectedIndex");
  -[CNSharingProfileAudienceDataSource didSelectItemAtIndex:](self->_sharingAudienceDataSource, "didSelectItemAtIndex:", objc_msgSend(v6, "row"));
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v7, objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v8, "isEqual:", v6);
  objc_msgSend(v10, "deselectRowAtIndexPath:animated:", v6, 0);
  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(v6, "section"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reloadSections:withRowAnimation:", v9, 0);

  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  UITextField *v4;
  UITextField *v5;
  int64_t nameOrder;
  int *v7;

  v4 = (UITextField *)a3;
  v5 = v4;
  nameOrder = self->_nameOrder;
  if ((nameOrder != 2 || self->_familyNameField == v4) && self->_givenNameField == v4)
  {
    if (nameOrder == 2)
      v7 = &OBJC_IVAR___CNSharingProfileOnboardingAudienceViewController__givenNameField;
    else
      v7 = &OBJC_IVAR___CNSharingProfileOnboardingAudienceViewController__familyNameField;
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + *v7), "becomeFirstResponder");
  }
  else
  {
    -[UITextField resignFirstResponder](v4, "resignFirstResponder");
  }

  return 0;
}

- (void)textFieldDidEndEditing:(id)a3
{
  void *v4;
  id v5;

  -[UITextField text](self->_givenNameField, "text", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMutableContact setGivenName:](self->_contact, "setGivenName:", v4);

  -[UITextField text](self->_familyNameField, "text");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNMutableContact setFamilyName:](self->_contact, "setFamilyName:", v5);

}

- (CNSharingProfileOnboardingAudienceControllerDelegate)delegate
{
  return (CNSharingProfileOnboardingAudienceControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSLayoutConstraint)tableViewHeightConstraint
{
  return self->_tableViewHeightConstraint;
}

- (void)setTableViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewHeightConstraint, a3);
}

- (OBBoldTrayButton)confirmButton
{
  return self->_confirmButton;
}

- (void)setConfirmButton:(id)a3
{
  objc_storeStrong((id *)&self->_confirmButton, a3);
}

- (UITextField)givenNameField
{
  return self->_givenNameField;
}

- (void)setGivenNameField:(id)a3
{
  objc_storeStrong((id *)&self->_givenNameField, a3);
}

- (UITextField)familyNameField
{
  return self->_familyNameField;
}

- (void)setFamilyNameField:(id)a3
{
  objc_storeStrong((id *)&self->_familyNameField, a3);
}

- (id)traitCollectionChangeToken
{
  return self->_traitCollectionChangeToken;
}

- (void)setTraitCollectionChangeToken:(id)a3
{
  objc_storeStrong(&self->_traitCollectionChangeToken, a3);
}

- (CNMutableContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (CNSharingProfileAudienceDataSource)sharingAudienceDataSource
{
  return self->_sharingAudienceDataSource;
}

- (void)setSharingAudienceDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_sharingAudienceDataSource, a3);
}

- (double)keyboardHeight
{
  return self->_keyboardHeight;
}

- (void)setKeyboardHeight:(double)a3
{
  self->_keyboardHeight = a3;
}

- (int64_t)nameOrder
{
  return self->_nameOrder;
}

- (void)setNameOrder:(int64_t)a3
{
  self->_nameOrder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingAudienceDataSource, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong(&self->_traitCollectionChangeToken, 0);
  objc_storeStrong((id *)&self->_familyNameField, 0);
  objc_storeStrong((id *)&self->_givenNameField, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
  objc_storeStrong((id *)&self->_tableViewHeightConstraint, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __63__CNSharingProfileOnboardingAudienceViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "contentSizeCategoryDidChange:", v3);

}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_1_33801 != -1)
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_1_33801, &__block_literal_global_33802);
  return (id)descriptorForRequiredKeys_cn_once_object_1_33803;
}

+ (id)headerText
{
  void *v2;
  void *v3;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SHARING_SET_UP_NAME_AND_PHOTO_SHARING"), &stru_1E20507A8, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __77__CNSharingProfileOnboardingAudienceViewController_descriptorForRequiredKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C966C0];
  v6[0] = *MEMORY[0x1E0C966D0];
  v6[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNSharingProfileOnboardingAudienceViewController descriptorForRequiredKeys]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorWithKeyDescriptors:description:", v1, v3);
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)descriptorForRequiredKeys_cn_once_object_1_33803;
  descriptorForRequiredKeys_cn_once_object_1_33803 = v4;

}

@end
