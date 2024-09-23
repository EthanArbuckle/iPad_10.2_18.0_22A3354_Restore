@implementation CNMeCardSharingPickerViewController

- (CNMeCardSharingPickerViewController)initWithContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CNMeCardSharingContactNameProvider *v8;
  CNMeCardSharingPickerViewController *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C97298]);
  objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CNMeCardSharingContactNameProvider initWithContact:]([CNMeCardSharingContactNameProvider alloc], "initWithContact:", v7);
  v9 = -[CNMeCardSharingPickerViewController initWithContactStore:contact:nameProvider:sharingEnabled:selectedNameFormat:selectedSharingAudience:mode:](self, "initWithContactStore:contact:nameProvider:sharingEnabled:selectedNameFormat:selectedSharingAudience:mode:", v4, v7, v8, 0, 2, 0, 1);

  return v9;
}

- (CNMeCardSharingPickerViewController)initWithContactStore:(id)a3 contact:(id)a4 nameProvider:(id)a5 sharingEnabled:(BOOL)a6 selectedNameFormat:(unint64_t)a7 selectedSharingAudience:(unint64_t)a8 mode:(unint64_t)a9
{
  id v15;
  id v16;
  id v17;
  CNMeCardSharingPickerViewController *v18;
  CNMeCardSharingPickerViewController *v19;
  uint64_t v20;
  CNMutableContact *draftContact;
  CNMutableContact *v22;
  CNMutableContact *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  CNMeCardSharingContactAvatarProvider *v28;
  CNMeCardSharingAvatarProvider *avatarProvider;
  CNMeCardSharingAvatarViewController *v30;
  CNMeCardSharingAvatarViewController *avatarViewController;
  void *v32;
  CNMeCardSharingEnabledDataSource *v33;
  CNMeCardSharingEnabledDataSource *enabledDataSource;
  CNMeCardSharingAudienceDataSource *v35;
  CNMeCardSharingAudienceDataSource *sharingAudienceDataSource;
  CNMeCardSharingHeaderViewController *v37;
  CNMeCardSharingHeaderViewController *headerViewController;
  uint64_t v39;
  NSArray *sectionDataSources;
  CNMeCardSharingPickerViewController *v41;
  objc_super v43;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v43.receiver = self;
  v43.super_class = (Class)CNMeCardSharingPickerViewController;
  v18 = -[CNMeCardSharingPickerViewController initWithNibName:bundle:](&v43, sel_initWithNibName_bundle_, 0, 0);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_contactStore, a3);
    v19->_sharingEnabled = a6;
    v19->_mode = a9;
    if (v16)
    {
      v20 = objc_msgSend(v16, "mutableCopy");
      draftContact = v19->_draftContact;
      v19->_draftContact = (CNMutableContact *)v20;

    }
    else
    {
      v22 = (CNMutableContact *)objc_alloc_init(MEMORY[0x1E0C97360]);
      v23 = v19->_draftContact;
      v19->_draftContact = v22;

      objc_msgSend(v17, "givenName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNMutableContact setGivenName:](v19->_draftContact, "setGivenName:", v24);

      objc_msgSend(v17, "middleName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNMutableContact setMiddleName:](v19->_draftContact, "setMiddleName:", v25);

      objc_msgSend(v17, "familyName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNMutableContact setFamilyName:](v19->_draftContact, "setFamilyName:", v26);

      v19->_shouldSetMeContact = 1;
    }
    if (a9)
      +[CNMeCardSharingPickerLayoutAttributes layoutAttributesForSettings](CNMeCardSharingPickerLayoutAttributes, "layoutAttributesForSettings");
    else
      +[CNMeCardSharingPickerLayoutAttributes layoutAttributesForBuddy](CNMeCardSharingPickerLayoutAttributes, "layoutAttributesForBuddy");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v19->_layoutAttributes, v27);

    v28 = -[CNMeCardSharingContactAvatarProvider initWithContact:]([CNMeCardSharingContactAvatarProvider alloc], "initWithContact:", v19->_draftContact);
    avatarProvider = v19->_avatarProvider;
    v19->_avatarProvider = (CNMeCardSharingAvatarProvider *)v28;

    v30 = -[CNMeCardSharingAvatarViewController initWithAvatarProvider:]([CNMeCardSharingAvatarViewController alloc], "initWithAvatarProvider:", v19->_avatarProvider);
    avatarViewController = v19->_avatarViewController;
    v19->_avatarViewController = v30;

    -[CNMeCardSharingAvatarViewController setDelegate:](v19->_avatarViewController, "setDelegate:", v19);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (a9 == 1)
    {
      v33 = -[CNMeCardSharingEnabledDataSource initWithSharingEnabled:]([CNMeCardSharingEnabledDataSource alloc], "initWithSharingEnabled:", v19->_sharingEnabled);
      enabledDataSource = v19->_enabledDataSource;
      v19->_enabledDataSource = v33;

      -[CNMeCardSharingEnabledDataSource setDelegate:](v19->_enabledDataSource, "setDelegate:", v19);
      objc_msgSend(v32, "addObject:", v19->_enabledDataSource);
    }
    v35 = -[CNMeCardSharingAudienceDataSource initWithSelectedSharingAudience:]([CNMeCardSharingAudienceDataSource alloc], "initWithSelectedSharingAudience:", a8);
    sharingAudienceDataSource = v19->_sharingAudienceDataSource;
    v19->_sharingAudienceDataSource = v35;

    objc_msgSend(v32, "addObject:", v19->_sharingAudienceDataSource);
    v37 = -[CNMeCardSharingHeaderViewController initWithAvatarViewController:name:layoutAttributes:]([CNMeCardSharingHeaderViewController alloc], "initWithAvatarViewController:name:layoutAttributes:", v19->_avatarViewController, &stru_1E20507A8, v19->_layoutAttributes);
    headerViewController = v19->_headerViewController;
    v19->_headerViewController = v37;

    v39 = objc_msgSend(v32, "copy");
    sectionDataSources = v19->_sectionDataSources;
    v19->_sectionDataSources = (NSArray *)v39;

    v41 = v19;
  }

  return v19;
}

- (void)loadView
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  OBBoldTrayButton *v10;
  OBBoldTrayButton *confirmButton;
  OBBoldTrayButton *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  OBLinkTrayButton *v18;
  OBLinkTrayButton *laterButton;
  OBLinkTrayButton *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  id v27;
  CGFloat v28;
  UIView *v29;
  UIView *buttonTray;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v34 = (id)objc_msgSend(v3, "initWithFrame:");

  v5 = objc_alloc(MEMORY[0x1E0DC3D48]);
  objc_msgSend(v34, "bounds");
  v6 = (void *)objc_msgSend(v5, "initWithFrame:style:", 1);
  -[CNMeCardSharingPickerViewController setTableView:](self, "setTableView:", v6);

  if (!self->_mode)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setBackgroundColor:", v7);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMeCardSharingPickerViewController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v8);

    objc_msgSend(MEMORY[0x1E0D65138], "boldButton");
    v10 = (OBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
    confirmButton = self->_confirmButton;
    self->_confirmButton = v10;

    v12 = self->_confirmButton;
    CNContactsUIBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SHARING_DONE"), &stru_1E20507A8, CFSTR("Localized"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBBoldTrayButton setTitle:forState:](v12, "setTitle:forState:", v14, 0);

    -[OBBoldTrayButton addTarget:action:forControlEvents:](self->_confirmButton, "addTarget:action:forControlEvents:", self, sel_didTapDoneButton_, 64);
    -[OBBoldTrayButton intrinsicContentSize](self->_confirmButton, "intrinsicContentSize");
    v16 = v15;
    objc_msgSend(v34, "bounds");
    -[OBBoldTrayButton setFrame:](self->_confirmButton, "setFrame:", 20.0, 10.0, v17 + -40.0, v16);
    -[OBBoldTrayButton setAutoresizingMask:](self->_confirmButton, "setAutoresizingMask:", 2);
    objc_msgSend(MEMORY[0x1E0D65178], "linkButton");
    v18 = (OBLinkTrayButton *)objc_claimAutoreleasedReturnValue();
    laterButton = self->_laterButton;
    self->_laterButton = v18;

    v20 = self->_laterButton;
    CNContactsUIBundle();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("SHARING_SET_UP_LATER"), &stru_1E20507A8, CFSTR("Localized"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBLinkTrayButton setTitle:forState:](v20, "setTitle:forState:", v22, 0);

    -[OBLinkTrayButton addTarget:action:forControlEvents:](self->_laterButton, "addTarget:action:forControlEvents:", self, sel_didTapSetUpLaterButton_, 64);
    -[OBLinkTrayButton intrinsicContentSize](self->_laterButton, "intrinsicContentSize");
    v24 = v23;
    -[OBBoldTrayButton frame](self->_confirmButton, "frame");
    v25 = CGRectGetMaxY(v35) + 10.0;
    objc_msgSend(v34, "bounds");
    -[OBLinkTrayButton setFrame:](self->_laterButton, "setFrame:", 20.0, v25, v26 + -40.0, v24);
    -[OBLinkTrayButton setAutoresizingMask:](self->_laterButton, "setAutoresizingMask:", 2);
    v27 = objc_alloc(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v34, "bounds");
    v28 = CGRectGetMaxY(v36) + -130.0;
    objc_msgSend(v34, "bounds");
    v29 = (UIView *)objc_msgSend(v27, "initWithFrame:", 0.0, v28, CGRectGetWidth(v37), 130.0);
    buttonTray = self->_buttonTray;
    self->_buttonTray = v29;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_buttonTray, "setBackgroundColor:", v31);

    -[UIView addSubview:](self->_buttonTray, "addSubview:", self->_confirmButton);
    -[UIView addSubview:](self->_buttonTray, "addSubview:", self->_laterButton);
    objc_msgSend(v34, "addSubview:", self->_buttonTray);
    -[UIView setAutoresizingMask:](self->_buttonTray, "setAutoresizingMask:", 10);
  }
  -[CNMeCardSharingPickerViewController tableView](self, "tableView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setAutoresizingMask:", 18);

  -[CNMeCardSharingPickerViewController tableView](self, "tableView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addSubview:", v33);

  if (self->_buttonTray)
    objc_msgSend(v34, "addSubview:");
  -[CNMeCardSharingPickerViewController setView:](self, "setView:", v34);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CNMeCardSharingPickerViewController;
  -[CNMeCardSharingPickerViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[CNMeCardSharingHeaderViewController view](self->_headerViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharingPickerViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  -[CNMeCardSharingHeaderViewController desiredHeight](self->_headerViewController, "desiredHeight");
  objc_msgSend(v3, "setFrame:", 0.0, 0.0, v6, v7);

  objc_msgSend(v3, "setAutoresizingMask:", 2);
  -[CNMeCardSharingPickerViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTableHeaderView:", v3);

  -[CNMeCardSharingPickerViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", self);

  -[CNMeCardSharingPickerViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDataSource:", self);

  -[CNMeCardSharingPickerViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("Cell"));

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double MaxY;
  void *v12;
  double v13;
  double v14;
  double Width;
  void *v16;
  double v17;
  void *v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v19.receiver = self;
  v19.super_class = (Class)CNMeCardSharingPickerViewController;
  -[CNMeCardSharingPickerViewController viewWillLayoutSubviews](&v19, sel_viewWillLayoutSubviews);
  -[CNMeCardSharingPickerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBoldTrayButton intrinsicContentSize](self->_confirmButton, "intrinsicContentSize");
  v5 = v4;
  objc_msgSend(v3, "bounds");
  -[OBBoldTrayButton setFrame:](self->_confirmButton, "setFrame:", 20.0, 10.0, v6 + -40.0, v5);
  -[OBLinkTrayButton intrinsicContentSize](self->_laterButton, "intrinsicContentSize");
  v8 = v7;
  -[OBBoldTrayButton frame](self->_confirmButton, "frame");
  v9 = CGRectGetMaxY(v20) + 10.0;
  objc_msgSend(v3, "bounds");
  -[OBLinkTrayButton setFrame:](self->_laterButton, "setFrame:", 20.0, v9, v10 + -40.0, v8);
  objc_msgSend(v3, "bounds");
  MaxY = CGRectGetMaxY(v21);
  -[CNMeCardSharingPickerViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safeAreaInsets");
  v14 = MaxY - (v13 + 130.0);
  objc_msgSend(v3, "bounds");
  Width = CGRectGetWidth(v22);
  -[CNMeCardSharingPickerViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "safeAreaInsets");
  -[UIView setFrame:](self->_buttonTray, "setFrame:", 0.0, v14, Width, v17 + 130.0);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_buttonTray, "setBackgroundColor:", v18);

}

- (NSString)sharedName
{
  return (NSString *)&stru_1E20507A8;
}

- (BOOL)sharingEnabled
{
  return self->_sharingEnabled;
}

- (unint64_t)selectedNameFormat
{
  return 2;
}

- (unint64_t)selectedSharingAudience
{
  return -[CNMeCardSharingAudienceDataSource selectedSharingAudience](self->_sharingAudienceDataSource, "selectedSharingAudience");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_sectionDataSources, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[NSArray objectAtIndexedSubscript:](self->_sectionDataSources, "objectAtIndexedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfItems");

  return v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[NSArray objectAtIndexedSubscript:](self->_sectionDataSources, "objectAtIndexedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionHeaderLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[NSArray objectAtIndexedSubscript:](self->_sectionDataSources, "objectAtIndexedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionFooterLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v5 = a4;
  -[NSArray objectAtIndexedSubscript:](self->_sectionDataSources, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "selectedIndex");
  if (v7 == objc_msgSend(v5, "row"))
    v8 = 0;
  else
    v8 = v5;

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("Cell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](self->_sectionDataSources, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "itemForIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  objc_msgSend(v7, "setSelectionStyle:", 0);
  objc_msgSend(v10, "accessoryView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v10, "accessoryView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessoryView:", v14);

  }
  else
  {
    objc_msgSend(v7, "setAccessoryView:", 0);
  }
  if (objc_msgSend(v10, "isSelected"))
    v15 = 3;
  else
    v15 = 0;
  objc_msgSend(v7, "setAccessoryType:", v15);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  CNMeCardSharingAudienceDataSource *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _BOOL4 sharingEnabled;
  char v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  -[NSArray objectAtIndexedSubscript:](self->_sectionDataSources, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v7 = (CNMeCardSharingAudienceDataSource *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNMeCardSharingAudienceDataSource selectedIndex](v7, "selectedIndex");
  -[CNMeCardSharingAudienceDataSource didSelectItemAtIndex:](v7, "didSelectItemAtIndex:", objc_msgSend(v6, "row"));
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v8, objc_msgSend(v6, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == self->_sharingAudienceDataSource)
  {
    -[CNMeCardSharingPickerViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[CNMeCardSharingPickerViewController delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sharingPicker:didSelectSharingAudience:", self, -[CNMeCardSharingAudienceDataSource selectedSharingAudience](self->_sharingAudienceDataSource, "selectedSharingAudience"));

    }
    if (self->_sharingEnabled)
    {
      if (-[CNMeCardSharingAudienceDataSource selectedSharingAudience](self->_sharingAudienceDataSource, "selectedSharingAudience"))
      {
        v13 = 1;
      }
      else
      {
        v13 = 2;
      }
    }
    else
    {
      v13 = 0;
    }
    -[CNMeCardSharingPickerViewController setMeCardSharingStatus:](self, "setMeCardSharingStatus:", v13);
    -[CNMeCardSharingPickerViewController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      sharingEnabled = self->_sharingEnabled;

      if (!sharingEnabled)
        goto LABEL_13;
      -[CNMeCardSharingPickerViewController delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sharingPicker:didSelectSharingStatus:", self, v13);
    }

  }
LABEL_13:
  v16 = objc_msgSend(v9, "isEqual:", v6);
  objc_msgSend(v18, "deselectRowAtIndexPath:animated:", v6, 0);
  if ((v16 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(v6, "section"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "reloadSections:withRowAnimation:", v17, 0);

  }
}

- (void)didTapDoneButton:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  -[CNMeCardSharingPickerViewController saveDraftContact](self, "saveDraftContact", a3);
  if (!self->_sharingEnabled)
  {
    self->_sharingEnabled = 1;
    -[CNMeCardSharingPickerViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[CNMeCardSharingPickerViewController delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sharingPicker:didChangeSharingState:", self, self->_sharingEnabled);

    }
  }
  -[CNMeCardSharingPickerViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CNMeCardSharingPickerViewController delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sharingPickerDidFinish:", self);

  }
}

- (void)didTapSetUpLaterButton:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CNMeCardSharingPickerViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNMeCardSharingPickerViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sharingPickerDidFinish:", self);

  }
}

- (void)saveDraftContact
{
  id v3;
  int v4;
  CNMutableContact *draftContact;
  CNContactStore *contactStore;
  id v7;
  void *v8;
  CNContactStore *v9;
  CNMutableContact *v10;
  id v11;
  void *v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v14;
  id v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C973D0]);
  v4 = -[CNMutableContact hasBeenPersisted](self->_draftContact, "hasBeenPersisted");
  draftContact = self->_draftContact;
  if (v4)
    objc_msgSend(v3, "updateContact:", draftContact);
  else
    objc_msgSend(v3, "addContact:toContainerWithIdentifier:", draftContact, 0);
  contactStore = self->_contactStore;
  v15 = 0;
  -[CNContactStore executeSaveRequest:error:](contactStore, "executeSaveRequest:error:", v3, &v15);
  v7 = v15;
  v8 = v7;
  if (v7)
  {
    NSLog(CFSTR("Unable to save contact: %@"), v7);
  }
  else
  {
    if (-[CNMeCardSharingPickerViewController shouldSetMeContact](self, "shouldSetMeContact"))
    {
      v9 = self->_contactStore;
      v10 = self->_draftContact;
      v14 = 0;
      -[CNContactStore setMeContact:error:](v9, "setMeContact:error:", v10, &v14);
      v11 = v14;
      v12 = v11;
      if (v11)
        NSLog(CFSTR("Unable to set me contact: %@"), v11);

    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)CNMeCardSharingPickerViewControllerDidSaveNotification, 0, 0, 0);
  }

}

- (void)avatarViewControllerWasTapped:(id)a3
{
  CNPhotoPickerViewController *v4;
  CNMutableContact *draftContact;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CNPhotoPickerViewController *v15;

  v4 = [CNPhotoPickerViewController alloc];
  draftContact = self->_draftContact;
  +[CNContactStyle defaultStyle](CNContactStyle, "defaultStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPhotoPickerConfiguration contactsConfiguration](CNPhotoPickerConfiguration, "contactsConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configurationBySettingAllowsPhotoCapture:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[CNPhotoPickerViewController initWithContact:style:configuration:](v4, "initWithContact:style:configuration:", draftContact, v6, v8);

  -[CNPhotoPickerViewController setDelegate:](v15, "setDelegate:", self);
  CNContactsUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SHARING_PHOTOPICKER_ASSIGN_TITLE_OVERRIDE"), &stru_1E20507A8, CFSTR("Localized"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityPickerViewController setAssignActionTitleOverride:](v15, "setAssignActionTitleOverride:", v10);

  -[CNMeCardSharingPickerViewController setPhotoPicker:](self, "setPhotoPicker:", v15);
  -[CNMeCardSharingPickerViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "endEditing:", 1);

  -[CNMeCardSharingPickerViewController photoPicker](self, "photoPicker");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPhotoPickerViewController navigationControllerForPicker:](CNPhotoPickerViewController, "navigationControllerForPicker:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNMeCardSharingPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
}

- (void)photoPickerDidCancel:(id)a3
{
  id v3;

  -[CNMeCardSharingPickerViewController presentedViewController](self, "presentedViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)photoPicker:(id)a3 didUpdatePhotoForContact:(id)a4 withContactImage:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  v7 = a5;
  objc_storeStrong((id *)&self->_draftContactImage, a5);
  if (v16)
  {
    objc_msgSend(v16, "imageData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMutableContact setImageData:](self->_draftContact, "setImageData:", v8);

    objc_msgSend(v16, "imageType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMutableContact setImageType:](self->_draftContact, "setImageType:", v9);

    objc_msgSend(v16, "imageHash");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMutableContact setImageHash:](self->_draftContact, "setImageHash:", v10);

    objc_msgSend(v16, "cropRect");
    -[CNMutableContact setCropRect:](self->_draftContact, "setCropRect:");
    objc_msgSend(v16, "thumbnailImageData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMutableContact setThumbnailImageData:](self->_draftContact, "setThumbnailImageData:", v11);

    objc_msgSend(v16, "fullscreenImageData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMutableContact setFullscreenImageData:](self->_draftContact, "setFullscreenImageData:", v12);

    objc_msgSend(v16, "preferredLikenessSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMutableContact setPreferredLikenessSource:](self->_draftContact, "setPreferredLikenessSource:", v13);

    if (self->_mode == 1)
      -[CNMeCardSharingPickerViewController saveDraftContact](self, "saveDraftContact");
    -[CNMeCardSharingPickerViewController avatarViewController](self, "avatarViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "reload");

  }
  -[CNMeCardSharingPickerViewController presentedViewController](self, "presentedViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)sharingEnabledDataSource:(id)a3 didChangeEnabledState:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = a4;
  v10 = a3;
  self->_sharingEnabled = v4;
  if (self->_mode == 1 && self->_shouldSetMeContact)
    -[CNMeCardSharingPickerViewController saveDraftContact](self, "saveDraftContact");
  -[CNMeCardSharingPickerViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CNMeCardSharingPickerViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sharingPicker:didChangeSharingState:", self, self->_sharingEnabled);

  }
  if (v4)
  {
    if (-[CNMeCardSharingAudienceDataSource selectedSharingAudience](self->_sharingAudienceDataSource, "selectedSharingAudience"))
    {
      v9 = 1;
    }
    else
    {
      v9 = 2;
    }
  }
  else
  {
    v9 = 0;
  }
  -[CNMeCardSharingPickerViewController setMeCardSharingStatus:](self, "setMeCardSharingStatus:", v9);

}

- (unint64_t)mode
{
  return self->_mode;
}

- (CNMeCardSharingPickerViewControllerDelegate)delegate
{
  return (CNMeCardSharingPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setSharingEnabled:(BOOL)a3
{
  self->_sharingEnabled = a3;
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

- (BOOL)shouldSetMeContact
{
  return self->_shouldSetMeContact;
}

- (void)setShouldSetMeContact:(BOOL)a3
{
  self->_shouldSetMeContact = a3;
}

- (CNMutableContact)draftContact
{
  return self->_draftContact;
}

- (void)setDraftContact:(id)a3
{
  objc_storeStrong((id *)&self->_draftContact, a3);
}

- (CNContactImage)draftContactImage
{
  return self->_draftContactImage;
}

- (void)setDraftContactImage:(id)a3
{
  objc_storeStrong((id *)&self->_draftContactImage, a3);
}

- (CNMeCardSharingHeaderViewController)headerViewController
{
  return self->_headerViewController;
}

- (void)setHeaderViewController:(id)a3
{
  objc_storeStrong((id *)&self->_headerViewController, a3);
}

- (CNMeCardSharingAvatarProvider)avatarProvider
{
  return self->_avatarProvider;
}

- (void)setAvatarProvider:(id)a3
{
  objc_storeStrong((id *)&self->_avatarProvider, a3);
}

- (CNMeCardSharingAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (void)setAvatarViewController:(id)a3
{
  objc_storeStrong((id *)&self->_avatarViewController, a3);
}

- (CNMeCardSharingEnabledDataSource)enabledDataSource
{
  return self->_enabledDataSource;
}

- (void)setEnabledDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_enabledDataSource, a3);
}

- (CNMeCardSharingAudienceDataSource)sharingAudienceDataSource
{
  return self->_sharingAudienceDataSource;
}

- (void)setSharingAudienceDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_sharingAudienceDataSource, a3);
}

- (CNMeCardSharingPickerLayoutAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (void)setLayoutAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_layoutAttributes, a3);
}

- (CNPhotoPickerViewController)photoPicker
{
  return self->_photoPicker;
}

- (void)setPhotoPicker:(id)a3
{
  objc_storeStrong((id *)&self->_photoPicker, a3);
}

- (NSArray)sectionDataSources
{
  return self->_sectionDataSources;
}

- (void)setSectionDataSources:(id)a3
{
  objc_storeStrong((id *)&self->_sectionDataSources, a3);
}

- (UIView)buttonTray
{
  return self->_buttonTray;
}

- (void)setButtonTray:(id)a3
{
  objc_storeStrong((id *)&self->_buttonTray, a3);
}

- (OBBoldTrayButton)confirmButton
{
  return self->_confirmButton;
}

- (void)setConfirmButton:(id)a3
{
  objc_storeStrong((id *)&self->_confirmButton, a3);
}

- (OBLinkTrayButton)laterButton
{
  return self->_laterButton;
}

- (void)setLaterButton:(id)a3
{
  objc_storeStrong((id *)&self->_laterButton, a3);
}

- (UISwitch)shareSwitch
{
  return self->_shareSwitch;
}

- (void)setShareSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_shareSwitch, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_shareSwitch, 0);
  objc_storeStrong((id *)&self->_laterButton, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
  objc_storeStrong((id *)&self->_buttonTray, 0);
  objc_storeStrong((id *)&self->_sectionDataSources, 0);
  objc_storeStrong((id *)&self->_photoPicker, 0);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
  objc_storeStrong((id *)&self->_sharingAudienceDataSource, 0);
  objc_storeStrong((id *)&self->_enabledDataSource, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_avatarProvider, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_draftContactImage, 0);
  objc_storeStrong((id *)&self->_draftContact, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_1_46828 != -1)
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_1_46828, &__block_literal_global_46829);
  return (id)descriptorForRequiredKeys_cn_once_object_1_46830;
}

void __64__CNMeCardSharingPickerViewController_descriptorForRequiredKeys__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[10];

  v11[9] = *MEMORY[0x1E0C80C00];
  +[CNMeCardSharingContactNameProvider descriptorForRequiredKeys](CNMeCardSharingContactNameProvider, "descriptorForRequiredKeys");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNVisualIdentityPickerViewController descriptorForRequiredKeys](CNPhotoPickerViewController, "descriptorForRequiredKeys", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0C96708];
  v11[1] = v1;
  v11[2] = v2;
  v3 = *MEMORY[0x1E0C966C8];
  v11[3] = *MEMORY[0x1E0C96890];
  v11[4] = v3;
  v4 = *MEMORY[0x1E0C968A8];
  v11[5] = *MEMORY[0x1E0C96700];
  v11[6] = v4;
  v11[7] = *MEMORY[0x1E0C968B8];
  +[CNSNaPSetupFlowManager descriptorForRequiredKeys](CNSNaPSetupFlowManager, "descriptorForRequiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[8] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNMeCardSharingPickerViewController descriptorForRequiredKeys]_block_invoke");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptorWithKeyDescriptors:description:", v6, v8);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)descriptorForRequiredKeys_cn_once_object_1_46830;
  descriptorForRequiredKeys_cn_once_object_1_46830 = v9;

}

- (void)setMeCardSharingStatus:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;

  if (a3)
  {
    if (a3 == 2)
    {
      v4 = 0;
    }
    else
    {
      if (a3 != 1)
      {
        v5 = 0;
        v4 = 0;
        self->_sharingEnabled = 0;
        goto LABEL_9;
      }
      v4 = 1;
    }
    v5 = 1;
    -[CNMeCardSharingEnabledDataSource setSharingEnabled:](self->_enabledDataSource, "setSharingEnabled:", 1);
    self->_sharingEnabled = 1;
  }
  else
  {
    -[CNMeCardSharingEnabledDataSource setSharingEnabled:](self->_enabledDataSource, "setSharingEnabled:");
    v5 = 0;
    v4 = 0;
    self->_sharingEnabled = 0;
  }
LABEL_9:
  -[CNMeCardSharingEnabledDataSource setSharingEnabled:](self->_enabledDataSource, "setSharingEnabled:", v5);
  -[CNMeCardSharingAudienceDataSource setSelectedSharingAudience:](self->_sharingAudienceDataSource, "setSelectedSharingAudience:", v4);
}

- (unint64_t)meCardSharingStatus
{
  if (!self->_sharingEnabled)
    return 0;
  if (-[CNMeCardSharingAudienceDataSource selectedSharingAudience](self->_sharingAudienceDataSource, "selectedSharingAudience"))
  {
    return 1;
  }
  return 2;
}

@end
