@implementation CNMeCardSharingSettingsViewController

- (id)initForOnboardingWithContactStore:(id)a3 contact:(id)a4 avatarProvider:(id)a5 nameProvider:(id)a6 sharingEnabled:(BOOL)a7 selectedSharingAudience:(unint64_t)a8 showsWallpaperSuggestionsGalleryPicker:(BOOL)a9 headerMode:(int64_t)a10
{
  _BOOL8 v11;
  id v16;
  CNMeCardSharingSettingsViewController *v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;

  v11 = a7;
  v16 = a4;
  LOBYTE(v32) = 1;
  LOBYTE(v31) = a9;
  v17 = -[CNMeCardSharingSettingsViewController initWithContactStore:contact:avatarProvider:nameProvider:sharingEnabled:selectedSharingAudience:showsWallpaperSuggestionsGalleryPicker:headerMode:presentedInOnboarding:](self, "initWithContactStore:contact:avatarProvider:nameProvider:sharingEnabled:selectedSharingAudience:showsWallpaperSuggestionsGalleryPicker:headerMode:presentedInOnboarding:", a3, v16, a5, a6, v11, a8, v31, a10, v32);
  v18 = objc_alloc(MEMORY[0x1E0C97220]);
  objc_msgSend(v16, "imageData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "cropRect");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v18, "initWithImageData:cropRect:lastUsedDate:", v19, v28, v21, v23, v25, v27);
  -[CNMeCardSharingSettingsViewController setEditingContactImage:](v17, "setEditingContactImage:", v29);

  return v17;
}

- (CNMeCardSharingSettingsViewController)initWithContactStore:(id)a3 contact:(id)a4 avatarProvider:(id)a5 nameProvider:(id)a6 sharingEnabled:(BOOL)a7 selectedSharingAudience:(unint64_t)a8
{
  _BOOL8 v9;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  CNMeCardSharingSettingsViewController *v21;
  uint64_t v23;
  uint64_t v24;

  v9 = a7;
  v14 = (void *)MEMORY[0x1E0D13A38];
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  objc_msgSend(v14, "currentEnvironment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "featureFlags");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v24) = 0;
  LOBYTE(v23) = objc_msgSend(v20, "isFeatureEnabled:", 16);
  v21 = -[CNMeCardSharingSettingsViewController initWithContactStore:contact:avatarProvider:nameProvider:sharingEnabled:selectedSharingAudience:showsWallpaperSuggestionsGalleryPicker:headerMode:presentedInOnboarding:](self, "initWithContactStore:contact:avatarProvider:nameProvider:sharingEnabled:selectedSharingAudience:showsWallpaperSuggestionsGalleryPicker:headerMode:presentedInOnboarding:", v18, v17, v16, v15, v9, a8, v23, 0, v24);

  return v21;
}

- (CNMeCardSharingSettingsViewController)initWithContactStore:(id)a3 contact:(id)a4 avatarProvider:(id)a5 nameProvider:(id)a6 sharingEnabled:(BOOL)a7 selectedSharingAudience:(unint64_t)a8 showsWallpaperSuggestionsGalleryPicker:(BOOL)a9 headerMode:(int64_t)a10
{
  uint64_t v11;
  uint64_t v12;

  LOBYTE(v12) = 0;
  LOBYTE(v11) = a9;
  return -[CNMeCardSharingSettingsViewController initWithContactStore:contact:avatarProvider:nameProvider:sharingEnabled:selectedSharingAudience:showsWallpaperSuggestionsGalleryPicker:headerMode:presentedInOnboarding:](self, "initWithContactStore:contact:avatarProvider:nameProvider:sharingEnabled:selectedSharingAudience:showsWallpaperSuggestionsGalleryPicker:headerMode:presentedInOnboarding:", a3, a4, a5, a6, a7, a8, v11, a10, v12);
}

- (CNMeCardSharingSettingsViewController)initWithContactStore:(id)a3 contact:(id)a4 avatarProvider:(id)a5 nameProvider:(id)a6 sharingEnabled:(BOOL)a7 selectedSharingAudience:(unint64_t)a8 showsWallpaperSuggestionsGalleryPicker:(BOOL)a9 headerMode:(int64_t)a10 presentedInOnboarding:(BOOL)a11
{
  _BOOL8 v11;
  id v17;
  id v18;
  id v19;
  id v20;
  CNMeCardSharingSettingsViewController *v21;
  CNMeCardSharingSettingsViewController *v22;
  uint64_t v23;
  CNMutableContact *v24;
  CNMutableContact *v25;
  CNMutableContact *editingContact;
  uint64_t v27;
  CNMeCardSharingPickerLayoutAttributes *layoutAttributes;
  void *v29;
  uint64_t v30;
  int64_t v31;
  CNMeCardSharingSettingsHeaderViewController *v32;
  CNMeCardSharingSettingsHeaderViewController *headerViewController;
  CNSNaPSetupFlowManager *v34;
  CNSNaPSetupFlowManager *editAvatarPosterFlowManager;
  CNSharedProfileOnboardingController *v36;
  CNSharedProfileOnboardingController *snapOnboardingController;
  void *v38;
  id *p_nameProvider;
  CNMeCardSharingSettingsNameDataSource *v40;
  CNMeCardSharingSettingsNameDataSource *nameDataSource;
  CNMeCardSharingEnabledDataSource *v42;
  CNMeCardSharingEnabledDataSource *enabledDataSource;
  CNMeCardSharingAudienceDataSource *v44;
  CNMeCardSharingAudienceDataSource *sharingAudienceDataSource;
  uint64_t v46;
  NSArray *sectionDataSources;
  uint64_t v48;
  NSString *editingGivenName;
  uint64_t v50;
  NSString *editingFamilyName;
  CNSharingProfileLogger *v52;
  CNSharingProfileLogger *logger;
  CNMeCardSharingSettingsViewController *v54;
  void *v56;
  objc_super v58;

  v11 = a7;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v58.receiver = self;
  v58.super_class = (Class)CNMeCardSharingSettingsViewController;
  v21 = -[CNMeCardSharingSettingsViewController initWithNibName:bundle:](&v58, sel_initWithNibName_bundle_, 0, 0);
  v22 = v21;
  if (!v21)
    goto LABEL_14;
  objc_storeStrong((id *)&v21->_contactStore, a3);
  objc_storeStrong((id *)&v22->_contact, a4);
  v22->_isPresentedInOnboarding = a11;
  if (!v18)
  {
    v25 = (CNMutableContact *)objc_alloc_init(MEMORY[0x1E0C97360]);
    editingContact = v22->_editingContact;
    v22->_editingContact = v25;

LABEL_7:
    v22->_shouldSetAsMeContact = 1;
    goto LABEL_8;
  }
  v23 = objc_msgSend(v18, "mutableCopy");
  v24 = v22->_editingContact;
  v22->_editingContact = (CNMutableContact *)v23;

  if (v22->_isPresentedInOnboarding && (objc_msgSend(v18, "hasBeenPersisted") & 1) == 0)
    goto LABEL_7;
LABEL_8:
  +[CNMeCardSharingPickerLayoutAttributes layoutAttributesForSettings](CNMeCardSharingPickerLayoutAttributes, "layoutAttributesForSettings", v17);
  v27 = objc_claimAutoreleasedReturnValue();
  layoutAttributes = v22->_layoutAttributes;
  v22->_layoutAttributes = (CNMeCardSharingPickerLayoutAttributes *)v27;

  objc_storeStrong((id *)&v22->_avatarProvider, a5);
  v22->_showsWallpaperSuggestionsGalleryPicker = a9;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "userInterfaceIdiom");

  if ((v30 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v31 = 0;
  else
    v31 = a10;
  v22->_headerMode = v31;
  v32 = -[CNMeCardSharingSettingsHeaderViewController initWithAvatarProvider:mode:]([CNMeCardSharingSettingsHeaderViewController alloc], "initWithAvatarProvider:mode:", v22->_avatarProvider, v22->_headerMode);
  headerViewController = v22->_headerViewController;
  v22->_headerViewController = v32;

  -[CNMeCardSharingSettingsHeaderViewController setDelegate:](v22->_headerViewController, "setDelegate:", v22);
  v17 = v56;
  v34 = -[CNSNaPSetupFlowManager initWithPresenterDelegate:contactStore:mode:]([CNSNaPSetupFlowManager alloc], "initWithPresenterDelegate:contactStore:mode:", v22, v56, v22->_headerMode);
  editAvatarPosterFlowManager = v22->_editAvatarPosterFlowManager;
  v22->_editAvatarPosterFlowManager = v34;

  -[CNSNaPSetupFlowManager setDelegate:](v22->_editAvatarPosterFlowManager, "setDelegate:", v22);
  v36 = -[CNSharedProfileOnboardingController initWithContactStore:]([CNSharedProfileOnboardingController alloc], "initWithContactStore:", v56);
  snapOnboardingController = v22->_snapOnboardingController;
  v22->_snapOnboardingController = v36;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  p_nameProvider = (id *)&v22->_nameProvider;
  objc_storeStrong((id *)&v22->_nameProvider, a6);
  v40 = objc_alloc_init(CNMeCardSharingSettingsNameDataSource);
  nameDataSource = v22->_nameDataSource;
  v22->_nameDataSource = v40;

  objc_msgSend(v38, "addObject:", v22->_nameDataSource);
  v42 = -[CNMeCardSharingEnabledDataSource initWithSharingEnabled:]([CNMeCardSharingEnabledDataSource alloc], "initWithSharingEnabled:", v11);
  enabledDataSource = v22->_enabledDataSource;
  v22->_enabledDataSource = v42;

  -[CNMeCardSharingEnabledDataSource setDelegate:](v22->_enabledDataSource, "setDelegate:", v22);
  objc_msgSend(v38, "addObject:", v22->_enabledDataSource);
  v44 = -[CNMeCardSharingAudienceDataSource initWithSelectedSharingAudience:]([CNMeCardSharingAudienceDataSource alloc], "initWithSelectedSharingAudience:", a8);
  sharingAudienceDataSource = v22->_sharingAudienceDataSource;
  v22->_sharingAudienceDataSource = v44;

  if (v11)
    objc_msgSend(v38, "addObject:", v22->_sharingAudienceDataSource);
  v46 = objc_msgSend(v38, "copy");
  sectionDataSources = v22->_sectionDataSources;
  v22->_sectionDataSources = (NSArray *)v46;

  objc_msgSend(*p_nameProvider, "givenName");
  v48 = objc_claimAutoreleasedReturnValue();
  editingGivenName = v22->_editingGivenName;
  v22->_editingGivenName = (NSString *)v48;

  objc_msgSend(*p_nameProvider, "familyName");
  v50 = objc_claimAutoreleasedReturnValue();
  editingFamilyName = v22->_editingFamilyName;
  v22->_editingFamilyName = (NSString *)v50;

  v52 = objc_alloc_init(CNSharingProfileLogger);
  logger = v22->_logger;
  v22->_logger = v52;

  v54 = v22;
LABEL_14:

  return v22;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CNMeCardSharingSettingsViewController;
  -[CNMeCardSharingSettingsViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
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
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  double v38;
  double v39;
  double v40;
  double v41;
  UITextField *v42;
  UITextField *givenNameField;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  UITextField *v49;
  UITextField *familyNameField;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  id v109;
  objc_super v110;
  _QWORD v111[7];

  v111[5] = *MEMORY[0x1E0C80C00];
  v110.receiver = self;
  v110.super_class = (Class)CNMeCardSharingSettingsViewController;
  -[CNMeCardSharingSettingsViewController viewDidLoad](&v110, sel_viewDidLoad);
  -[CNMeCardSharingSettingsViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setBackgroundHidden:", 1);

  -[CNMeCardSharingSettingsViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLargeTitleDisplayMode:", 2);

  v5 = objc_alloc(MEMORY[0x1E0DC3D48]);
  -[CNMeCardSharingSettingsViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v7 = (void *)objc_msgSend(v5, "initWithFrame:style:", 2);
  -[CNMeCardSharingSettingsViewController setTableView:](self, "setTableView:", v7);

  -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAutoresizingMask:", 18);

  -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", self);

  -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDataSource:", self);

  -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("Cell"));

  -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  +[CNMeCardSharingSettingsNameCell cellIdentifier](CNMeCardSharingSettingsNameCell, "cellIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerClass:forCellReuseIdentifier:", v13, v14);

  -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_class();
  +[CNMeCardSharingSettingsPreferenceMenuCell cellIdentifier](CNMeCardSharingSettingsPreferenceMenuCell, "cellIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "registerClass:forCellReuseIdentifier:", v16, v17);

  -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setContentInsetAdjustmentBehavior:", 2);

  -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAutomaticallyAdjustsScrollIndicatorInsets:", 0);

  -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setShowsVerticalScrollIndicator:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBackgroundColor:", v21);

  -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_setTopPadding:", 0.0);

  -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharingSettingsViewController tabBarController](self, "tabBarController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "tabBar");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bounds");
  v28 = v27;
  objc_msgSend(v24, "_bottomPadding");
  objc_msgSend(v24, "_setBottomPadding:", v29 + v28);

  -[CNMeCardSharingSettingsViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addSubview:", v31);

  -[CNMeCardSharingSettingsViewController updateHeaderViewFrame](self, "updateHeaderViewFrame");
  -[CNMeCardSharingSettingsHeaderViewController view](self->_headerViewController, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setAutoresizingMask:", 2);

  -[CNMeCardSharingSettingsHeaderViewController willMoveToParentViewController:](self->_headerViewController, "willMoveToParentViewController:", self);
  -[CNMeCardSharingSettingsViewController addChildViewController:](self, "addChildViewController:", self->_headerViewController);
  -[CNMeCardSharingSettingsHeaderViewController view](self->_headerViewController, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setTableHeaderView:", v33);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharingSettingsHeaderViewController view](self->_headerViewController, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setBackgroundColor:", v35);

  -[CNMeCardSharingSettingsHeaderViewController didMoveToParentViewController:](self->_headerViewController, "didMoveToParentViewController:", self);
  v37 = objc_alloc(MEMORY[0x1E0DC3DB8]);
  v38 = *MEMORY[0x1E0C9D648];
  v39 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v40 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v41 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v42 = (UITextField *)objc_msgSend(v37, "initWithFrame:", *MEMORY[0x1E0C9D648], v39, v40, v41);
  givenNameField = self->_givenNameField;
  self->_givenNameField = v42;

  v44 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setFont:](self->_givenNameField, "setFont:", v45);

  -[UITextField setAdjustsFontForContentSizeCategory:](self->_givenNameField, "setAdjustsFontForContentSizeCategory:", 1);
  -[UITextField setAutocorrectionType:](self->_givenNameField, "setAutocorrectionType:", 1);
  -[CNMeCardSharingNameProvider givenName](self->_nameProvider, "givenName");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](self->_givenNameField, "setText:", v46);

  CNContactsUIBundle();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("SHARING_GIVEN_NAME_PLACEHOLDER"), &stru_1E20507A8, CFSTR("Localized"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setPlaceholder:](self->_givenNameField, "setPlaceholder:", v48);

  -[UITextField addTarget:action:forControlEvents:](self->_givenNameField, "addTarget:action:forControlEvents:", self, sel_givenNameDidChange_, 0x20000);
  -[UITextField setDelegate:](self->_givenNameField, "setDelegate:", self);
  v49 = (UITextField *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3DB8]), "initWithFrame:", v38, v39, v40, v41);
  familyNameField = self->_familyNameField;
  self->_familyNameField = v49;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v44);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setFont:](self->_familyNameField, "setFont:", v51);

  -[UITextField setAutocorrectionType:](self->_familyNameField, "setAutocorrectionType:", 1);
  -[UITextField setAdjustsFontForContentSizeCategory:](self->_familyNameField, "setAdjustsFontForContentSizeCategory:", 1);
  -[CNMeCardSharingNameProvider familyName](self->_nameProvider, "familyName");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](self->_familyNameField, "setText:", v52);

  CNContactsUIBundle();
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("SHARING_FAMILY_NAME_PLACEHOLDER"), &stru_1E20507A8, CFSTR("Localized"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setPlaceholder:](self->_familyNameField, "setPlaceholder:", v54);

  -[UITextField addTarget:action:forControlEvents:](self->_familyNameField, "addTarget:action:forControlEvents:", self, sel_familyNameDidChange_, 0x20000);
  -[UITextField setDelegate:](self->_familyNameField, "setDelegate:", self);
  -[CNContact givenName](self->_contact, "givenName");
  v55 = objc_claimAutoreleasedReturnValue();
  if (v55
    && (v56 = (void *)v55,
        -[CNContact familyName](self->_contact, "familyName"),
        v57 = (void *)objc_claimAutoreleasedReturnValue(),
        v57,
        v56,
        v57))
  {
    v58 = 0;
  }
  else
  {
    v58 = objc_alloc_init(MEMORY[0x1E0CB3850]);
    -[CNContact givenName](self->_contact, "givenName");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setGivenName:", v59);

    -[CNContact familyName](self->_contact, "familyName");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setFamilyName:", v60);

  }
  self->_nameOrder = objc_msgSend(MEMORY[0x1E0CB3858], "_nameOrderWithOverridesForComponents:options:", v58, 0);
  -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setKeyboardDismissMode:", 2);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "addObserver:selector:name:object:", self, sel_keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "addObserver:selector:name:object:", self, sel_keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "addObserver:selector:name:object:", self, sel_contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

  if (-[CNMeCardSharingSettingsViewController isPresentedInOnboarding](self, "isPresentedInOnboarding"))
  {
    objc_msgSend(MEMORY[0x1E0D65138], "boldButton");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMeCardSharingSettingsViewController setContinueButton:](self, "setContinueButton:", v65);

    -[CNMeCardSharingSettingsViewController continueButton](self, "continueButton");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    CNContactsUIBundle();
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "localizedStringForKey:value:table:", CFSTR("SHARING_DONE"), &stru_1E20507A8, CFSTR("Localized"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setTitle:forState:", v68, 0);

    -[CNMeCardSharingSettingsViewController continueButton](self, "continueButton");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "addTarget:action:forControlEvents:", self, sel_didTapContinueButton_, 64);

    -[CNMeCardSharingSettingsViewController continueButton](self, "continueButton");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D65150]), "initWithFrame:", v38, v39, v40, v41);
    -[CNMeCardSharingSettingsViewController setButtonTray:](self, "setButtonTray:", v71);

    -[CNMeCardSharingSettingsViewController buttonTray](self, "buttonTray");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CNMeCardSharingSettingsViewController buttonTray](self, "buttonTray");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMeCardSharingSettingsViewController continueButton](self, "continueButton");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "addButton:", v74);

    -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "backgroundColor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMeCardSharingSettingsViewController buttonTray](self, "buttonTray");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setBackgroundColor:", v76);

    -[CNMeCardSharingSettingsViewController view](self, "view");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMeCardSharingSettingsViewController buttonTray](self, "buttonTray");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "addSubview:", v79);

    v96 = (void *)MEMORY[0x1E0CB3718];
    -[CNMeCardSharingSettingsViewController buttonTray](self, "buttonTray");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "leadingAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMeCardSharingSettingsViewController view](self, "view");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "layoutMarginsGuide");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "leadingAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "constraintEqualToAnchor:", v104);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v111[0] = v103;
    -[CNMeCardSharingSettingsViewController buttonTray](self, "buttonTray");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "trailingAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMeCardSharingSettingsViewController view](self, "view");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "layoutMarginsGuide");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "trailingAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "constraintEqualToAnchor:", v98);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v111[1] = v97;
    -[CNMeCardSharingSettingsViewController buttonTray](self, "buttonTray");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "bottomAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMeCardSharingSettingsViewController view](self, "view");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "bottomAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:", v92);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v111[2] = v91;
    -[CNMeCardSharingSettingsViewController continueButton](self, "continueButton");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "leadingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMeCardSharingSettingsViewController buttonTray](self, "buttonTray");
    v109 = v58;
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "leadingAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:", v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v111[3] = v83;
    -[CNMeCardSharingSettingsViewController continueButton](self, "continueButton");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "trailingAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMeCardSharingSettingsViewController buttonTray](self, "buttonTray");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "trailingAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToAnchor:", v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v111[4] = v88;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v111, 5);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "activateConstraints:", v89);

    v58 = v109;
  }

}

- (void)viewIsAppearing:(BOOL)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNMeCardSharingSettingsViewController;
  -[CNMeCardSharingSettingsViewController viewIsAppearing:](&v5, sel_viewIsAppearing_, a3);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__CNMeCardSharingSettingsViewController_viewIsAppearing___block_invoke;
  v4[3] = &unk_1E20489A0;
  v4[4] = self;
  -[CNMeCardSharingSettingsViewController generateEditingContactWithCompletionHandler:](self, "generateEditingContactWithCompletionHandler:", v4);
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  -[CNMeCardSharingSettingsViewController updateTableViewBottomPaddingIfNeeded](self, "updateTableViewBottomPaddingIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)CNMeCardSharingSettingsViewController;
  -[CNMeCardSharingSettingsViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[CNMeCardSharingSettingsViewController updateHeaderViewFrameAndTableView](self, "updateHeaderViewFrameAndTableView");
}

- (void)presentErrorAlertForEmptyPhotoIfNeededWithCompletion:(id)a3
{
  void (**v3)(_QWORD);
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
  _QWORD v14[4];
  void (**v15)(_QWORD);

  v3 = (void (**)(_QWORD))a3;
  if ((objc_msgSend(MEMORY[0x1E0C97200], "nameAndPhotoSharingDebugUIEnabled") & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0DC3450];
    CNContactsUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Uh Oh"), &stru_1E20507A8, CFSTR("Localized"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CNContactsUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Empty image returned to Messages for Name + Photo"), &stru_1E20507A8, CFSTR("Localized"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0DC3448];
    CNContactsUIBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E20507A8, CFSTR("Localized"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __94__CNMeCardSharingSettingsViewController_presentErrorAlertForEmptyPhotoIfNeededWithCompletion___block_invoke;
    v14[3] = &unk_1E204E498;
    v15 = v3;
    objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 0, v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v13);

  }
  else
  {
    v3[2](v3);
  }

}

- (void)didTapContinueButton:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  -[CNMeCardSharingSettingsViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNMeCardSharingSettingsViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sharingSettingsViewController:didUpdateSharingState:", self, -[CNMeCardSharingSettingsViewController sharingEnabled](self, "sharingEnabled"));

  }
  -[CNMeCardSharingSettingsViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CNMeCardSharingSettingsViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sharingSettingsViewController:didSelectSharingAudience:", self, -[CNMeCardSharingAudienceDataSource selectedSharingAudience](self->_sharingAudienceDataSource, "selectedSharingAudience"));

  }
  -[CNMeCardSharingSettingsViewController promptForSavingToMeCardIfNeeded](self, "promptForSavingToMeCardIfNeeded");
}

- (id)sharingResultWithContactImage:(id)a3 wallpaper:(id)a4 watchWallpaperImageData:(id)a5 didSaveToMeCard:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  CNMeCardSharingResult *v13;
  NSString *editingGivenName;
  NSString *editingFamilyName;
  void *v16;
  CNMeCardSharingResult *v17;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = [CNMeCardSharingResult alloc];
  editingGivenName = self->_editingGivenName;
  editingFamilyName = self->_editingFamilyName;
  objc_msgSend(v12, "resizedContactImageForMeCardSharing");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[CNMeCardSharingResult initWithGivenName:familyName:contactImage:wallpaper:watchWallpaperImageData:didSaveImageToMeCard:](v13, "initWithGivenName:familyName:contactImage:wallpaper:watchWallpaperImageData:didSaveImageToMeCard:", editingGivenName, editingFamilyName, v16, v11, v10, v6);
  return v17;
}

- (void)notifyDelegateOfChangesWithDidSaveToMeCard:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  CNContactImage *editingContactImage;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  CNMutableContact *editingContact;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  BOOL v23;

  v3 = a3;
  -[CNMeCardSharingSettingsViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    editingContactImage = self->_editingContactImage;
    -[CNMutableContact imageData](self->_editingContact, "imageData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)-[CNContactImage copyWithNewImageData:](editingContactImage, "copyWithNewImageData:", v8);

    v10 = (void *)MEMORY[0x1E0C97400];
    -[CNMutableContact thumbnailImageData](self->_editingContact, "thumbnailImageData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fingerprintForData:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setVisualFingerprint:", v12);
    v13 = *MEMORY[0x1E0D13818];
    -[CNMutableContact wallpaper](self->_editingContact, "wallpaper");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "posterArchiveData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v15);

    -[CNMutableContact wallpaper](self->_editingContact, "wallpaper");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    editingContact = self->_editingContact;
    if ((v16 & 1) != 0)
    {
      -[CNMutableContact watchWallpaperImageData](self->_editingContact, "watchWallpaperImageData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNMeCardSharingSettingsViewController sharingResultWithContactImage:wallpaper:watchWallpaperImageData:didSaveToMeCard:](self, "sharingResultWithContactImage:wallpaper:watchWallpaperImageData:didSaveToMeCard:", v9, v17, v19, v3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNMeCardSharingSettingsViewController notifyDelegateOfChangesWithDidSaveMeCard:contactImage:sharingResult:](self, "notifyDelegateOfChangesWithDidSaveMeCard:contactImage:sharingResult:", v3, v9, v20);
    }
    else
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __84__CNMeCardSharingSettingsViewController_notifyDelegateOfChangesWithDidSaveToMeCard___block_invoke;
      v21[3] = &unk_1E20489C8;
      v21[4] = self;
      v22 = v9;
      v23 = v3;
      objc_msgSend(v17, "snapshotImageDataForWatchForContact:completion:", editingContact, v21);

    }
  }
}

- (void)notifyDelegateOfChangesWithDidSaveMeCard:(BOOL)a3 contactImage:(id)a4 sharingResult:(id)a5
{
  id v7;
  id v8;
  CNSharingProfileLogger *logger;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;

  v7 = a4;
  v8 = a5;
  logger = self->_logger;
  objc_msgSend(v8, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfileLogger logSettingsReturningSharingResultWithDescription:](logger, "logSettingsReturningSharingResultWithDescription:", v10);

  v11 = *MEMORY[0x1E0D13818];
  objc_msgSend(v7, "imageData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = (*(uint64_t (**)(uint64_t, void *))(v11 + 16))(v11, v12);

  if ((v11 & 1) == 0)
    goto LABEL_8;
  if (!self->_editingContactImage)
  {
    -[CNSharingProfileLogger logSettingsReturningEmptyImageForNoChange](self->_logger, "logSettingsReturningEmptyImageForNoChange");
LABEL_8:
    -[CNMeCardSharingSettingsViewController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sharingSettingsViewController:didUpdateWithSharingResult:", self, v8);

    goto LABEL_9;
  }
  if (objc_msgSend(v7, "source") == 1)
  {
    objc_msgSend(v7, "variant");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      -[CNSharingProfileLogger logSettingsReturningDefaultMonogram](self->_logger, "logSettingsReturningDefaultMonogram");
      goto LABEL_8;
    }
  }
  -[CNSharingProfileLogger logSettingsReturningEmptyImage](self->_logger, "logSettingsReturningEmptyImage");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __109__CNMeCardSharingSettingsViewController_notifyDelegateOfChangesWithDidSaveMeCard_contactImage_sharingResult___block_invoke;
  v15[3] = &unk_1E2050400;
  v15[4] = self;
  v16 = v8;
  -[CNMeCardSharingSettingsViewController presentErrorAlertForEmptyPhotoIfNeededWithCompletion:](self, "presentErrorAlertForEmptyPhotoIfNeededWithCompletion:", v15);

LABEL_9:
}

- (void)givenNameDidChange:(id)a3
{
  NSString *v4;
  NSString *editingGivenName;

  objc_msgSend(a3, "text");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  editingGivenName = self->_editingGivenName;
  self->_editingGivenName = v4;

}

- (void)familyNameDidChange:(id)a3
{
  NSString *v4;
  NSString *editingFamilyName;

  objc_msgSend(a3, "text");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  editingFamilyName = self->_editingFamilyName;
  self->_editingFamilyName = v4;

}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  id v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[CNMeCardSharingSettingsViewController view](self, "view");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "convertRect:fromWindow:", 0, v7, v9, v11, v13);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  objc_msgSend(v31, "convertRect:fromView:", 0, v16, v18, v20, v22);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  objc_msgSend(v31, "bounds");
  v34.origin.x = v24;
  v34.origin.y = v26;
  v34.size.width = v28;
  v34.size.height = v30;
  v33 = CGRectIntersection(v32, v34);
  -[CNMeCardSharingSettingsViewController adjustInsetsForKeyboardOverlap:](self, "adjustInsetsForKeyboardOverlap:", CGRectGetHeight(v33));

}

- (void)keyboardWillHide:(id)a3
{
  -[CNMeCardSharingSettingsViewController adjustInsetsForKeyboardOverlap:](self, "adjustInsetsForKeyboardOverlap:", a3, 0.0);
}

- (void)adjustInsetsForKeyboardOverlap:(double)a3
{
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  id v34;

  -[CNMeCardSharingSettingsViewController keyboardHeight](self, "keyboardHeight");
  if (v5 != a3)
    -[CNMeCardSharingSettingsViewController setKeyboardHeight:](self, "setKeyboardHeight:", a3);
  -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentInset");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  if (v12 >= a3)
  {
    if (a3 != 0.0)
      return;
    -[CNMeCardSharingSettingsViewController tableViewBottomInsets](self, "tableViewBottomInsets");
    v15 = v16;
  }
  else
  {
    -[CNMeCardSharingSettingsViewController setTableViewBottomInsets:](self, "setTableViewBottomInsets:", v12);
    v15 = v12 + a3;
  }
  if (v15 != v12)
  {
    -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "contentOffset");
    v19 = v18;
    v21 = v20;
    v22 = *MEMORY[0x1E0C9D538];
    v23 = *(double *)(MEMORY[0x1E0C9D538] + 8);

    -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setContentInset:", v8, v10, v15, v14);

    -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setScrollIndicatorInsets:", v8, v10, v15, v14);

    if (v22 == v19 && v23 == v21)
    {
      -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "contentOffset");
      v29 = v28;
      v30 = -v8;

      if (v29 != v30)
      {
        -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
        v34 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "contentOffset");
        v32 = v31;
        -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setContentOffset:", v32, v30);

      }
    }
  }
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  void *v4;

  -[CNMeCardSharingSettingsViewController tableView](self, "tableView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

  -[CNMeCardSharingSettingsViewController updateHeaderViewFrameAndTableView](self, "updateHeaderViewFrameAndTableView");
}

- (void)updateHeaderViewFrameAndTableView
{
  void *v3;
  id v4;

  -[CNMeCardSharingSettingsViewController updateHeaderViewFrame](self, "updateHeaderViewFrame");
  -[CNMeCardSharingSettingsHeaderViewController view](self->_headerViewController, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTableHeaderView:", v4);

}

- (void)updateHeaderViewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  BOOL v15;
  id v16;
  CGRect v17;
  CGRect v18;

  -[CNMeCardSharingSettingsViewController availableHeaderHeight](self, "availableHeaderHeight");
  v4 = v3;
  -[CNMeCardSharingSettingsHeaderViewController minHeight](self->_headerViewController, "minHeight");
  if (v4 >= v5)
    v6 = v4;
  else
    v6 = v5;
  -[CNMeCardSharingSettingsHeaderViewController maxHeight](self->_headerViewController, "maxHeight");
  if (v6 >= v7)
    v6 = v7;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if ((v9 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    -[CNMeCardSharingSettingsHeaderViewController minBottomPadding](self->_headerViewController, "minBottomPadding");
    v6 = v6 + fmax((v4 - v6 - v10) * 0.5, 0.0);
  }
  -[CNMeCardSharingSettingsViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;

  -[CNMeCardSharingSettingsHeaderViewController view](self->_headerViewController, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.width = v13;
  v18.size.height = v6;
  v15 = CGRectEqualToRect(v17, v18);

  if (!v15)
  {
    -[CNMeCardSharingSettingsHeaderViewController view](self->_headerViewController, "view");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFrame:", 0.0, 0.0, v13, v6);

  }
}

- (double)availableHeaderHeight
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;

  -[CNMeCardSharingSettingsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rectForSection:", 0);
  v8 = v7;

  -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rectForFooterInSection:", 0);
  v11 = v10;

  -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_bottomPadding");
  v14 = v5 - v8 - v11 - v13;
  -[CNMeCardSharingSettingsViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "safeAreaInsets");
  v17 = v14 - v16;

  return v17;
}

- (void)updateTableViewBottomPaddingIfNeeded
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  -[CNMeCardSharingSettingsViewController buttonTray](self, "buttonTray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  if (v5 > 0.0)
  {
    -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_bottomPadding");
    v8 = v7;

    if (v8 < v5)
    {
      -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_setBottomPadding:", v5);

    }
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
      v7 = &OBJC_IVAR___CNMeCardSharingSettingsViewController__givenNameField;
    else
      v7 = &OBJC_IVAR___CNMeCardSharingSettingsViewController__familyNameField;
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v7), "becomeFirstResponder");
  }
  else
  {
    -[UITextField resignFirstResponder](v4, "resignFirstResponder");
  }

  return 0;
}

- (void)textFieldDidEndEditing:(id)a3
{
  NSString *v4;
  NSString *editingGivenName;
  NSString *v6;
  NSString *editingFamilyName;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[UITextField text](self->_givenNameField, "text", a3);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  editingGivenName = self->_editingGivenName;
  self->_editingGivenName = v4;

  -[UITextField text](self->_familyNameField, "text");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  editingFamilyName = self->_editingFamilyName;
  self->_editingFamilyName = v6;

  -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadRowsAtIndexPaths:withRowAnimation:", v10, 100);

  if (!-[CNMeCardSharingSettingsViewController isPresentedInOnboarding](self, "isPresentedInOnboarding"))
    -[CNMeCardSharingSettingsViewController notifyDelegateOfChangesWithDidSaveToMeCard:](self, "notifyDelegateOfChangesWithDidSaveToMeCard:", 0);
}

- (BOOL)sharingEnabled
{
  return -[CNMeCardSharingEnabledDataSource sharingEnabled](self->_enabledDataSource, "sharingEnabled");
}

- (unint64_t)selectedSharingAudience
{
  return -[CNMeCardSharingAudienceDataSource selectedSharingAudience](self->_sharingAudienceDataSource, "selectedSharingAudience");
}

- (id)textFields
{
  int *v2;
  UITextField **p_givenNameField;
  UITextField *givenNameField;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  if (self->_nameOrder == 2)
  {
    v6[0] = self->_familyNameField;
    v2 = &OBJC_IVAR___CNMeCardSharingSettingsViewController__givenNameField;
    p_givenNameField = (UITextField **)v6;
  }
  else
  {
    givenNameField = self->_givenNameField;
    v2 = &OBJC_IVAR___CNMeCardSharingSettingsViewController__familyNameField;
    p_givenNameField = &givenNameField;
  }
  p_givenNameField[1] = *(UITextField **)((char *)&self->super.super.super.isa + *v2);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)textFieldForIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[CNMeCardSharingSettingsViewController textFields](self, "textFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 3;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[CNMeCardSharingSettingsViewController sharingAudienceDataSource](self, "sharingAudienceDataSource", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionFooterLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "row"))
  {
    v8 = objc_msgSend(v7, "row");

    if (v8 != 1)
    {
      +[CNMeCardSharingSettingsPreferenceMenuCell cellIdentifier](CNMeCardSharingSettingsPreferenceMenuCell, "cellIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setSharingAudience:", -[CNMeCardSharingSettingsViewController selectedSharingAudience](self, "selectedSharingAudience"));
      objc_msgSend(v10, "setEnabled:", -[CNMeCardSharingSettingsViewController sharingEnabled](self, "sharingEnabled"));
      objc_msgSend(v10, "setDelegate:", self);
      objc_msgSend(v10, "setSelectionStyle:", 0);
      goto LABEL_7;
    }
    +[CNMeCardSharingSettingsNameCell cellIdentifier](CNMeCardSharingSettingsNameCell, "cellIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNMeCardSharingSettingsViewController editingGivenName](self, "editingGivenName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMeCardSharingSettingsViewController editingFamilyName](self, "editingFamilyName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUpWithGivenName:familyName:", v11, v12);
  }
  else
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("Cell"), v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNMeCardSharingSettingsViewController enabledDataSource](self, "enabledDataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "itemForIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "label");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v14);

    objc_msgSend(v10, "setSelectionStyle:", 0);
    objc_msgSend(v11, "accessoryView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessoryView:", v12);
  }

LABEL_7:
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v17);

  return v10;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  objc_msgSend(a3, "cellForRowAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v5;
  else
    v7 = 0;

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  objc_msgSend(v8, "cellForRowAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CNMeCardSharingSettingsViewController presentNameEditor](self, "presentNameEditor");
    objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v6, 0);
  }

}

- (void)promptForSavingToMeCardIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CNMeCardSharingSettingsViewController *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[5];
  _QWORD v25[5];

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFeatureEnabled:", 15);

  if (v5)
  {
    -[CNMeCardSharingSettingsViewController performSaveToMeCardAction](self, "performSaveToMeCardAction");
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0DC3450];
    CNContactsUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SHARING_UPDATE_ME_CARD_PROMPT_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CNContactsUIBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SHARING_UPDATE_ME_CARD_PROMPT_MESSAGE"), &stru_1E20507A8, CFSTR("Localized"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v8, v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0DC3448];
    CNContactsUIBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SHARING_UPDATE_ME_CARD_PROMPT_CONFIRM"), &stru_1E20507A8, CFSTR("Localized"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __72__CNMeCardSharingSettingsViewController_promptForSavingToMeCardIfNeeded__block_invoke;
    v25[3] = &unk_1E204F7F0;
    v25[4] = self;
    objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 0, v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v16);

    v17 = (void *)MEMORY[0x1E0DC3448];
    CNContactsUIBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("SHARING_UPDATE_ME_CARD_PROMPT_CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v15;
    v24[1] = 3221225472;
    v24[2] = __72__CNMeCardSharingSettingsViewController_promptForSavingToMeCardIfNeeded__block_invoke_2;
    v24[3] = &unk_1E204F7F0;
    v24[4] = self;
    objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 1, v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v20);

    v21 = self;
    -[CNMeCardSharingSettingsViewController presentedViewController](v21, "presentedViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[CNMeCardSharingSettingsViewController presentedViewController](v21, "presentedViewController");
      v23 = objc_claimAutoreleasedReturnValue();

      v21 = (CNMeCardSharingSettingsViewController *)v23;
    }
    -[CNMeCardSharingSettingsViewController presentViewController:animated:completion:](v21, "presentViewController:animated:completion:", v11, 1, 0);

  }
}

- (void)performSaveToMeCardAction
{
  -[CNMeCardSharingSettingsViewController saveDraftContact](self, "saveDraftContact");
  -[CNMeCardSharingSettingsViewController notifyDelegateOfChangesWithDidSaveToMeCard:](self, "notifyDelegateOfChangesWithDidSaveToMeCard:", 1);
}

- (void)saveDraftContact
{
  id v3;
  CNMutableContact *v4;
  CNSharingProfileLogger *logger;
  void *v6;
  CNSharingProfileLogger *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  CNSharingProfileLogger *v12;
  void *v13;
  char v14;
  id v15;
  CNContact *v16;
  CNContact *contact;
  void *v18;
  char v19;
  CNSharingProfileLogger *v20;
  void *v21;
  void *v22;
  char v23;
  CNSharingProfileLogger *v24;
  id v25;
  id v26;

  v3 = objc_alloc_init(MEMORY[0x1E0C973D0]);
  if (self->_shouldSetAsMeContact)
  {
    -[CNMutableContact setGivenName:](self->_editingContact, "setGivenName:", self->_editingGivenName);
    -[CNMutableContact setFamilyName:](self->_editingContact, "setFamilyName:", self->_editingFamilyName);
    v4 = self->_editingContact;
    logger = self->_logger;
    -[CNMutableContact identifier](self->_editingContact, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSharingProfileLogger logSettingsSavingContact:](logger, "logSettingsSavingContact:", v6);

    objc_msgSend(v3, "addContact:toContainerWithIdentifier:", self->_editingContact, 0);
  }
  else if (-[CNContact hasBeenPersisted](self->_contact, "hasBeenPersisted"))
  {
    v4 = (CNMutableContact *)-[CNContact mutableCopy](self->_contact, "mutableCopy");
    -[CNMeCardSharingSettingsViewController updateContact:withImagePropertiesFromContact:](self, "updateContact:withImagePropertiesFromContact:", v4, self->_editingContact);
    v7 = self->_logger;
    -[CNMutableContact identifier](v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSharingProfileLogger logSettingsSavingContact:](v7, "logSettingsSavingContact:", v8);

    objc_msgSend(v3, "updateContact:", v4);
  }
  else
  {
    v4 = 0;
  }
  -[CNMeCardSharingSettingsViewController contactStore](self, "contactStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v10 = objc_msgSend(v9, "executeSaveRequest:error:", v3, &v26);
  v11 = v26;

  if ((v10 & 1) == 0)
  {
    v20 = self->_logger;
    objc_msgSend(v11, "localizedDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSharingProfileLogger logSettingsErrorSavingContactWithDescription:](v20, "logSettingsErrorSavingContactWithDescription:", v21);
LABEL_15:

    goto LABEL_16;
  }
  v12 = self->_logger;
  if (self->_shouldSetAsMeContact)
  {
    -[CNSharingProfileLogger logSettingsSettingMeContact](v12, "logSettingsSettingMeContact");
    -[CNMeCardSharingSettingsViewController contactStore](self, "contactStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v14 = objc_msgSend(v13, "setMeContact:error:", v4, &v25);
    v15 = v25;

    if ((v14 & 1) == 0)
    {
      v24 = self->_logger;
      objc_msgSend(v15, "localizedDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNSharingProfileLogger logSettingsErrorSettingMeContactWithDescription:](v24, "logSettingsErrorSettingMeContactWithDescription:", v21);

      goto LABEL_15;
    }
    self->_shouldSetAsMeContact = 0;
    v16 = (CNContact *)-[CNMutableContact copy](v4, "copy");
    contact = self->_contact;
    self->_contact = v16;

    -[CNSharingProfileLogger logSettingsSuccessSavingContact](self->_logger, "logSettingsSuccessSavingContact");
    -[CNMeCardSharingSettingsViewController delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) == 0)
      goto LABEL_16;
    goto LABEL_13;
  }
  -[CNSharingProfileLogger logSettingsSuccessSavingContact](v12, "logSettingsSuccessSavingContact");
  -[CNMeCardSharingSettingsViewController delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_opt_respondsToSelector();

  if ((v23 & 1) != 0)
  {
LABEL_13:
    -[CNMeCardSharingSettingsViewController delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sharingSettingsViewControllerDidUpdateContact:", self);
    goto LABEL_15;
  }
LABEL_16:

}

- (void)updateContact:(id)a3 withEditedContact:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[CNMeCardSharingSettingsViewController updateContact:withImagePropertiesFromContact:](self, "updateContact:withImagePropertiesFromContact:", v7, v6);
  -[CNMeCardSharingSettingsViewController updateContact:withNamePropertiesFromContact:](self, "updateContact:withNamePropertiesFromContact:", v7, v6);

}

- (void)updateContact:(id)a3 withImagePropertiesFromContact:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "imageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImageData:", v7);

  objc_msgSend(v5, "cropRect");
  objc_msgSend(v6, "setCropRect:");
  objc_msgSend(v5, "thumbnailImageData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setThumbnailImageData:", v8);

  objc_msgSend(v5, "fullscreenImageData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFullscreenImageData:", v9);

  objc_msgSend(v5, "preferredLikenessSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreferredLikenessSource:", v10);

  objc_msgSend(v5, "imageType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImageType:", v11);

  objc_msgSend(v5, "imageHash");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImageHash:", v12);

  objc_msgSend(v5, "memojiMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMemojiMetadata:", v13);

  objc_msgSend(v5, "wallpaper");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWallpaper:", v14);

  objc_msgSend(v5, "watchWallpaperImageData");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setWatchWallpaperImageData:", v15);
}

- (void)updateContact:(id)a3 withNamePropertiesFromContact:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "givenName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGivenName:", v7);

  objc_msgSend(v5, "familyName");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setFamilyName:", v8);
}

- (void)generateEditingContactWithCompletionHandler:(id)a3
{
  id v4;
  CNMeCardSharingContactAvatarProvider *editingContactAvatarProvider;
  CNMeCardSharingContactAvatarProvider *v6;
  int v7;
  CNMeCardSharingAvatarProvider *avatarProvider;
  CNMeCardSharingContactAvatarProvider *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;

  v4 = a3;
  editingContactAvatarProvider = self->_editingContactAvatarProvider;
  if (editingContactAvatarProvider)
  {
    v6 = editingContactAvatarProvider;
  }
  else
  {
    v7 = -[CNMeCardSharingAvatarProvider conformsToProtocol:](self->_avatarProvider, "conformsToProtocol:", &unk_1EE00B2B0);
    avatarProvider = self->_avatarProvider;
    if (!v7)
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __85__CNMeCardSharingSettingsViewController_generateEditingContactWithCompletionHandler___block_invoke;
      v22[3] = &unk_1E2049E20;
      v22[4] = self;
      v23 = v4;
      -[CNMeCardSharingAvatarProvider generateAvatarImageOfSize:imageHandler:](avatarProvider, "generateAvatarImageOfSize:imageHandler:", v22, 220.0, 220.0);

      goto LABEL_7;
    }
    v6 = avatarProvider;
  }
  v9 = v6;
  -[CNMeCardSharingContactAvatarProvider imageData](v6, "imageData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharingContactAvatarProvider cropRect](v9, "cropRect");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[CNMeCardSharingContactAvatarProvider thumbnailImageData](v9, "thumbnailImageData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharingContactAvatarProvider wallpaper](v9, "wallpaper");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)-[CNMutableContact mutableCopy](self->_editingContact, "mutableCopy");
  objc_msgSend(v21, "setImageData:", v10);
  objc_msgSend(v21, "setCropRect:", v12, v14, v16, v18);
  objc_msgSend(v21, "setThumbnailImageData:", v19);
  objc_msgSend(v21, "setGivenName:", self->_editingGivenName);
  objc_msgSend(v21, "setFamilyName:", self->_editingFamilyName);
  objc_msgSend(v21, "setWallpaper:", v20);
  (*((void (**)(id, void *))v4 + 2))(v4, v21);

LABEL_7:
}

- (void)sharingSettingsHeaderWasTapped:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __72__CNMeCardSharingSettingsViewController_sharingSettingsHeaderWasTapped___block_invoke;
  v3[3] = &unk_1E20489A0;
  v3[4] = self;
  -[CNMeCardSharingSettingsViewController generateEditingContactWithCompletionHandler:](self, "generateEditingContactWithCompletionHandler:", v3);
}

- (double)viewHeight
{
  void *v2;
  double v3;
  double v4;

  -[CNMeCardSharingSettingsViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;

  return v4;
}

- (void)presentPhotoPickerControllerForContact:(id)a3
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  CNPhotoPickerViewController *v7;
  CNPhotoPickerViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "featureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isFeatureEnabled:", 16))
  {

    goto LABEL_5;
  }
  v6 = -[CNMeCardSharingSettingsViewController showsWallpaperSuggestionsGalleryPicker](self, "showsWallpaperSuggestionsGalleryPicker");

  if (!v6)
  {
LABEL_5:
    v8 = [CNPhotoPickerViewController alloc];
    +[CNContactStyle defaultStyle](CNContactStyle, "defaultStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNPhotoPickerConfiguration contactsConfiguration](CNPhotoPickerConfiguration, "contactsConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configurationBySettingAllowsPhotoCapture:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CNPhotoPickerViewController initWithContact:style:configuration:](v8, "initWithContact:style:configuration:", v18, v9, v11);

    -[CNPhotoPickerViewController setDelegate:](v7, "setDelegate:", self);
    CNContactsUIBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SHARING_PHOTOPICKER_ASSIGN_TITLE_OVERRIDE"), &stru_1E20507A8, CFSTR("Localized"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityPickerViewController setAssignActionTitleOverride:](v7, "setAssignActionTitleOverride:", v13);

    +[CNVisualIdentityPickerViewController defaultContentSize](CNPhotoPickerViewController, "defaultContentSize");
    -[CNPhotoPickerViewController setPreferredContentSize:](v7, "setPreferredContentSize:");
    -[CNMeCardSharingSettingsViewController setPhotoPicker:](self, "setPhotoPicker:", v7);
    -[CNMeCardSharingSettingsViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "endEditing:", 1);

    -[CNMeCardSharingSettingsViewController photoPicker](self, "photoPicker");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNPhotoPickerViewController navigationControllerForPicker:](CNPhotoPickerViewController, "navigationControllerForPicker:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNMeCardSharingSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);
    goto LABEL_6;
  }
  -[CNMeCardSharingSettingsViewController editAvatarPosterFlowManager](self, "editAvatarPosterFlowManager");
  v7 = (CNPhotoPickerViewController *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerViewController startEditFlowWithSNaPContact:](v7, "startEditFlowWithSNaPContact:", v18);
LABEL_6:

}

- (void)preWarmContactPosterForContact:(id)a3
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer *v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "featureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isFeatureEnabled:", 16))
    v6 = -[CNMeCardSharingSettingsViewController showsWallpaperSuggestionsGalleryPicker](self, "showsWallpaperSuggestionsGalleryPicker");
  else
    v6 = 0;

  -[CNMeCardSharingSettingsViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceIdiom");

    if ((v11 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "nicknameProvider");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "nicknameAsContactForContact:", v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = -[CNAvatarPosterPairCollectionPreWarmer initWithContact:contactForSharedProfile:]([_TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer alloc], "initWithContact:contactForSharedProfile:", v17, v14);
        -[CNMeCardSharingSettingsViewController setCarouselPreWarmer:](self, "setCarouselPreWarmer:", v15);

        -[CNMeCardSharingSettingsViewController carouselPreWarmer](self, "carouselPreWarmer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "preWarmFirstPosterSnapshotIn:", v9);

      }
    }
  }

}

- (void)presentNameEditor
{
  CNMeCardSharingSettingsNameEditorViewController *v3;
  void *v4;
  void *v5;
  CNMeCardSharingSettingsNameEditorViewController *v6;

  v3 = [CNMeCardSharingSettingsNameEditorViewController alloc];
  -[CNMeCardSharingSettingsViewController textFields](self, "textFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNMeCardSharingSettingsNameEditorViewController initWithTextFields:](v3, "initWithTextFields:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v6);
  -[CNMeCardSharingSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

}

- (void)photoPickerDidCancel:(id)a3
{
  id v3;

  -[CNMeCardSharingSettingsViewController presentedViewController](self, "presentedViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)photoPicker:(id)a3 didUpdatePhotoForContact:(id)a4 withContactImage:(id)a5
{
  id v7;
  id v8;
  void *v9;
  CNMeCardSharingContactAvatarProvider *v10;
  CNMeCardSharingContactAvatarProvider *editingContactAvatarProvider;
  void *v12;
  _QWORD v13[5];

  v7 = a4;
  v8 = a5;
  objc_storeStrong((id *)&self->_editingContactImage, a5);
  if (v7)
  {
    -[CNMeCardSharingSettingsViewController updateContact:withImagePropertiesFromContact:](self, "updateContact:withImagePropertiesFromContact:", self->_editingContact, v7);
    if (self->_editingContactAvatarProvider)
    {
      -[CNMeCardSharingSettingsViewController headerViewController](self, "headerViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "reload");
    }
    else
    {
      v10 = -[CNMeCardSharingContactAvatarProvider initWithContact:]([CNMeCardSharingContactAvatarProvider alloc], "initWithContact:", self->_editingContact);
      editingContactAvatarProvider = self->_editingContactAvatarProvider;
      self->_editingContactAvatarProvider = v10;

      -[CNMeCardSharingSettingsViewController headerViewController](self, "headerViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "updateWithAvatarProvider:", self->_editingContactAvatarProvider);
    }

  }
  -[CNMeCardSharingSettingsViewController presentedViewController](self, "presentedViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __95__CNMeCardSharingSettingsViewController_photoPicker_didUpdatePhotoForContact_withContactImage___block_invoke;
  v13[3] = &unk_1E204F648;
  v13[4] = self;
  objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, v13);

}

- (void)notifyOfChangedEnablementState:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  v3 = a3;
  -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

  -[CNMeCardSharingSettingsViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CNMeCardSharingSettingsViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sharingSettingsViewController:didUpdateSharingState:", self, v3);

  }
  if (v3)
    -[CNMeCardSharingSettingsViewController notifyDelegateOfChangesWithDidSaveToMeCard:](self, "notifyDelegateOfChangesWithDidSaveToMeCard:", 0);
}

- (void)sharingEnabledDataSource:(id)a3 didChangeEnabledState:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  CNPhotoPickerNavigationViewController *v10;
  _QWORD v11[5];
  BOOL v12;
  _QWORD v13[4];
  id v14;
  CNMeCardSharingSettingsViewController *v15;
  BOOL v16;

  v4 = a4;
  v6 = a3;
  if (_os_feature_enabled_impl())
    v7 = !v4;
  else
    v7 = 1;
  if (v7
    || !-[CNMeCardSharingSettingsViewController multiplePhoneNumbersTiedToAppleID](self, "multiplePhoneNumbersTiedToAppleID"))
  {
    -[CNMeCardSharingSettingsViewController notifyOfChangedEnablementState:](self, "notifyOfChangedEnablementState:", v4);
  }
  else
  {
    v8 = (void *)objc_opt_new();
    v9 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __88__CNMeCardSharingSettingsViewController_sharingEnabledDataSource_didChangeEnabledState___block_invoke;
    v13[3] = &unk_1E20489F0;
    v14 = v6;
    v15 = self;
    v16 = v4;
    objc_msgSend(v8, "setOnCancel:", v13);
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __88__CNMeCardSharingSettingsViewController_sharingEnabledDataSource_didChangeEnabledState___block_invoke_2;
    v11[3] = &unk_1E2048A18;
    v11[4] = self;
    v12 = v4;
    objc_msgSend(v8, "setOnContinue:", v11);
    v10 = -[CNPhotoPickerNavigationViewController initWithRootViewController:]([CNPhotoPickerNavigationViewController alloc], "initWithRootViewController:", v8);
    -[CNPhotoPickerNavigationViewController setAllowRotation:](v10, "setAllowRotation:", 0);
    -[CNPhotoPickerNavigationViewController setModalPresentationStyle:](v10, "setModalPresentationStyle:", 0);
    -[CNMeCardSharingSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, &__block_literal_global_180);

  }
}

- (void)avatarPosterEditorFromFlowManager:(id)a3 didUpdateContact:(id)a4 withVisualIdentity:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  CNContactImage *v21;
  CNContactImage *editingContactImage;
  uint64_t v23;
  void *v24;
  CNMeCardSharingContactAvatarProvider *v25;
  CNMeCardSharingContactAvatarProvider *editingContactAvatarProvider;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];

  v7 = (objc_class *)MEMORY[0x1E0C97220];
  v8 = a5;
  v9 = a4;
  v10 = [v7 alloc];
  objc_msgSend(v8, "imageData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cropRect");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (CNContactImage *)objc_msgSend(v10, "initWithImageData:cropRect:lastUsedDate:", v11, v20, v13, v15, v17, v19);
  editingContactImage = self->_editingContactImage;
  self->_editingContactImage = v21;

  v23 = objc_msgSend(v8, "contactImageSource");
  -[CNContactImage setSource:](self->_editingContactImage, "setSource:", v23);
  -[CNMeCardSharingSettingsViewController updateContact:withEditedContact:](self, "updateContact:withEditedContact:", self->_editingContact, v9);

  if (self->_editingContactAvatarProvider)
  {
    -[CNMeCardSharingSettingsViewController headerViewController](self, "headerViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "reload");
  }
  else
  {
    v25 = -[CNMeCardSharingContactAvatarProvider initWithContact:]([CNMeCardSharingContactAvatarProvider alloc], "initWithContact:", self->_editingContact);
    editingContactAvatarProvider = self->_editingContactAvatarProvider;
    self->_editingContactAvatarProvider = v25;

    -[CNMeCardSharingSettingsViewController headerViewController](self, "headerViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "updateWithAvatarProvider:", self->_editingContactAvatarProvider);
  }

  -[CNMeCardSharingSettingsViewController preWarmContactPosterForContact:](self, "preWarmContactPosterForContact:", self->_editingContact);
  -[CNMeCardSharingSettingsViewController editingContact](self, "editingContact");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "givenName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharingSettingsViewController givenNameField](self, "givenNameField");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setText:", v28);

  -[CNMeCardSharingSettingsViewController editingContact](self, "editingContact");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "familyName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharingSettingsViewController familyNameField](self, "familyNameField");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setText:", v31);

  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __111__CNMeCardSharingSettingsViewController_avatarPosterEditorFromFlowManager_didUpdateContact_withVisualIdentity___block_invoke;
  v33[3] = &unk_1E204F648;
  v33[4] = self;
  -[CNMeCardSharingSettingsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v33);
}

- (void)sender:(id)a3 presentViewController:(id)a4
{
  -[CNMeCardSharingSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, 1, 0);
}

- (void)sender:(id)a3 dismissViewController:(id)a4
{
  -[CNMeCardSharingSettingsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)sender:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  -[CNMeCardSharingSettingsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, a5);
}

- (BOOL)isPresentingModalViewController
{
  void *v2;
  BOOL v3;

  -[CNMeCardSharingSettingsViewController presentedViewController](self, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)sharingSettingsPreferenceMenuCell:(id)a3 didSelectSharingAudience:(unint64_t)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  -[CNMeCardSharingSettingsViewController sharingAudienceDataSource](self, "sharingAudienceDataSource", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "setSelectedSharingAudience:", a4);

  -[CNMeCardSharingSettingsViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CNMeCardSharingSettingsViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sharingSettingsViewController:didSelectSharingAudience:", self, -[CNMeCardSharingAudienceDataSource selectedSharingAudience](self->_sharingAudienceDataSource, "selectedSharingAudience"));

  }
  -[CNMeCardSharingSettingsViewController tableView](self, "tableView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reloadData");

}

- (BOOL)multiplePhoneNumbersTiedToAppleID
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getIMNicknameControllerClass_softClass;
  v9 = getIMNicknameControllerClass_softClass;
  if (!getIMNicknameControllerClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getIMNicknameControllerClass_block_invoke;
    v5[3] = &unk_1E204EBC0;
    v5[4] = &v6;
    __getIMNicknameControllerClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  return objc_msgSend(v3, "multiplePhoneNumbersTiedToAppleID");
}

- (CNMeCardSharingSettingsViewControllerDelegate)delegate
{
  return (CNMeCardSharingSettingsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (CNMutableContact)editingContact
{
  return self->_editingContact;
}

- (void)setEditingContact:(id)a3
{
  objc_storeStrong((id *)&self->_editingContact, a3);
}

- (CNContactImage)editingContactImage
{
  return self->_editingContactImage;
}

- (void)setEditingContactImage:(id)a3
{
  objc_storeStrong((id *)&self->_editingContactImage, a3);
}

- (NSString)editingGivenName
{
  return self->_editingGivenName;
}

- (void)setEditingGivenName:(id)a3
{
  objc_storeStrong((id *)&self->_editingGivenName, a3);
}

- (NSString)editingFamilyName
{
  return self->_editingFamilyName;
}

- (void)setEditingFamilyName:(id)a3
{
  objc_storeStrong((id *)&self->_editingFamilyName, a3);
}

- (CNSharingProfileMeCardUpdater)meCardUpdater
{
  return self->_meCardUpdater;
}

- (void)setMeCardUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_meCardUpdater, a3);
}

- (CNMeCardSharingPickerLayoutAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (CNMeCardSharingSettingsHeaderViewController)headerViewController
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

- (CNMeCardSharingNameProvider)nameProvider
{
  return self->_nameProvider;
}

- (CNMeCardSharingSettingsNameDataSource)nameDataSource
{
  return self->_nameDataSource;
}

- (CNMeCardSharingEnabledDataSource)enabledDataSource
{
  return self->_enabledDataSource;
}

- (CNMeCardSharingAudienceDataSource)sharingAudienceDataSource
{
  return self->_sharingAudienceDataSource;
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

- (int64_t)nameOrder
{
  return self->_nameOrder;
}

- (void)setNameOrder:(int64_t)a3
{
  self->_nameOrder = a3;
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

- (CNMeCardSharingContactAvatarProvider)editingContactAvatarProvider
{
  return self->_editingContactAvatarProvider;
}

- (void)setEditingContactAvatarProvider:(id)a3
{
  objc_storeStrong((id *)&self->_editingContactAvatarProvider, a3);
}

- (BOOL)shouldSetAsMeContact
{
  return self->_shouldSetAsMeContact;
}

- (void)setShouldSetAsMeContact:(BOOL)a3
{
  self->_shouldSetAsMeContact = a3;
}

- (CNSharingProfileLogger)logger
{
  return self->_logger;
}

- (double)keyboardHeight
{
  return self->_keyboardHeight;
}

- (void)setKeyboardHeight:(double)a3
{
  self->_keyboardHeight = a3;
}

- (double)tableViewBottomInsets
{
  return self->_tableViewBottomInsets;
}

- (void)setTableViewBottomInsets:(double)a3
{
  self->_tableViewBottomInsets = a3;
}

- (CNSNaPSetupFlowManager)editAvatarPosterFlowManager
{
  return self->_editAvatarPosterFlowManager;
}

- (void)setEditAvatarPosterFlowManager:(id)a3
{
  objc_storeStrong((id *)&self->_editAvatarPosterFlowManager, a3);
}

- (_TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer)carouselPreWarmer
{
  return self->_carouselPreWarmer;
}

- (void)setCarouselPreWarmer:(id)a3
{
  objc_storeStrong((id *)&self->_carouselPreWarmer, a3);
}

- (CNSharedProfileOnboardingController)snapOnboardingController
{
  return self->_snapOnboardingController;
}

- (void)setSnapOnboardingController:(id)a3
{
  objc_storeStrong((id *)&self->_snapOnboardingController, a3);
}

- (OBButtonTray)buttonTray
{
  return self->_buttonTray;
}

- (void)setButtonTray:(id)a3
{
  objc_storeStrong((id *)&self->_buttonTray, a3);
}

- (OBBoldTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
}

- (BOOL)showsWallpaperSuggestionsGalleryPicker
{
  return self->_showsWallpaperSuggestionsGalleryPicker;
}

- (void)setShowsWallpaperSuggestionsGalleryPicker:(BOOL)a3
{
  self->_showsWallpaperSuggestionsGalleryPicker = a3;
}

- (int64_t)headerMode
{
  return self->_headerMode;
}

- (void)setHeaderMode:(int64_t)a3
{
  self->_headerMode = a3;
}

- (BOOL)isPresentedInOnboarding
{
  return self->_isPresentedInOnboarding;
}

- (void)setIsPresentedInOnboarding:(BOOL)a3
{
  self->_isPresentedInOnboarding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_buttonTray, 0);
  objc_storeStrong((id *)&self->_snapOnboardingController, 0);
  objc_storeStrong((id *)&self->_carouselPreWarmer, 0);
  objc_storeStrong((id *)&self->_editAvatarPosterFlowManager, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_editingContactAvatarProvider, 0);
  objc_storeStrong((id *)&self->_familyNameField, 0);
  objc_storeStrong((id *)&self->_givenNameField, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_shareSwitch, 0);
  objc_storeStrong((id *)&self->_sectionDataSources, 0);
  objc_storeStrong((id *)&self->_photoPicker, 0);
  objc_storeStrong((id *)&self->_sharingAudienceDataSource, 0);
  objc_storeStrong((id *)&self->_enabledDataSource, 0);
  objc_storeStrong((id *)&self->_nameDataSource, 0);
  objc_storeStrong((id *)&self->_nameProvider, 0);
  objc_storeStrong((id *)&self->_avatarProvider, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
  objc_storeStrong((id *)&self->_meCardUpdater, 0);
  objc_storeStrong((id *)&self->_editingFamilyName, 0);
  objc_storeStrong((id *)&self->_editingGivenName, 0);
  objc_storeStrong((id *)&self->_editingContactImage, 0);
  objc_storeStrong((id *)&self->_editingContact, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __111__CNMeCardSharingSettingsViewController_avatarPosterEditorFromFlowManager_didUpdateContact_withVisualIdentity___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "promptForSavingToMeCardIfNeeded");
}

uint64_t __88__CNMeCardSharingSettingsViewController_sharingEnabledDataSource_didChangeEnabledState___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(*(id *)(a1 + 32), "setSharingEnabled:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "notifyOfChangedEnablementState:", *(_BYTE *)(a1 + 48) == 0);
}

uint64_t __88__CNMeCardSharingSettingsViewController_sharingEnabledDataSource_didChangeEnabledState___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "dismissViewControllerAnimated:completion:", 1, 0);
  return objc_msgSend(*(id *)(a1 + 32), "notifyOfChangedEnablementState:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __95__CNMeCardSharingSettingsViewController_photoPicker_didUpdatePhotoForContact_withContactImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "promptForSavingToMeCardIfNeeded");
}

uint64_t __72__CNMeCardSharingSettingsViewController_sharingSettingsHeaderWasTapped___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "presentPhotoPickerControllerForContact:", a2);
  return result;
}

void __85__CNMeCardSharingSettingsViewController_generateEditingContactWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIImage *image;

  image = a2;
  v5 = a3;
  v6 = *(id **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v6, "logger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logErrorGeneratingAvatarForPhotoPickerWithDescription:", v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v9 = (void *)objc_msgSend(v6[125], "mutableCopy");
    UIImagePNGRepresentation(image);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImageData:", v10);
    objc_msgSend(v9, "setCropRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v9, "setThumbnailImageData:", v10);
    objc_msgSend(v9, "setGivenName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1016));
    objc_msgSend(v9, "setFamilyName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1024));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

uint64_t __72__CNMeCardSharingSettingsViewController_promptForSavingToMeCardIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSaveToMeCardAction");
}

uint64_t __72__CNMeCardSharingSettingsViewController_promptForSavingToMeCardIfNeeded__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyDelegateOfChangesWithDidSaveToMeCard:", 0);
}

void __109__CNMeCardSharingSettingsViewController_notifyDelegateOfChangesWithDidSaveMeCard_contactImage_sharingResult___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharingSettingsViewController:didUpdateWithSharingResult:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __84__CNMeCardSharingSettingsViewController_notifyDelegateOfChangesWithDidSaveToMeCard___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "wallpaper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13818] + 16))() & 1) == 0)
    objc_msgSend(v3, "setGeneratedWatchImageData:", v5);
  objc_msgSend(*(id *)(a1 + 32), "sharingResultWithContactImage:wallpaper:watchWallpaperImageData:didSaveToMeCard:", *(_QWORD *)(a1 + 40), v3, v5, *(unsigned __int8 *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "notifyDelegateOfChangesWithDidSaveMeCard:contactImage:sharingResult:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40), v4);

}

uint64_t __94__CNMeCardSharingSettingsViewController_presentErrorAlertForEmptyPhotoIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__CNMeCardSharingSettingsViewController_viewIsAppearing___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "preWarmContactPosterForContact:", a2);
  return result;
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_5 != -1)
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_5, &__block_literal_global_6221);
  return (id)descriptorForRequiredKeys_cn_once_object_5;
}

void __66__CNMeCardSharingSettingsViewController_descriptorForRequiredKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[13];

  v13[12] = *MEMORY[0x1E0C80C00];
  +[CNVisualIdentityPickerViewController descriptorForRequiredKeys](CNPhotoPickerViewController, "descriptorForRequiredKeys");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x1E0C96708];
  v13[0] = v0;
  v13[1] = v1;
  v2 = *MEMORY[0x1E0C966C8];
  v13[2] = *MEMORY[0x1E0C96890];
  v13[3] = v2;
  v3 = *MEMORY[0x1E0D13C50];
  v13[4] = *MEMORY[0x1E0C96700];
  v13[5] = v3;
  v4 = *MEMORY[0x1E0C968B0];
  v13[6] = *MEMORY[0x1E0C968A8];
  v13[7] = v4;
  v13[8] = *MEMORY[0x1E0C968B8];
  +[CNSNaPSetupFlowManager descriptorForRequiredKeys](CNSNaPSetupFlowManager, "descriptorForRequiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[9] = v5;
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[10] = v6;
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForNameOrder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[11] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNMeCardSharingSettingsViewController descriptorForRequiredKeys]_block_invoke");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptorWithKeyDescriptors:description:", v8, v10);
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)descriptorForRequiredKeys_cn_once_object_5;
  descriptorForRequiredKeys_cn_once_object_5 = v11;

}

@end
