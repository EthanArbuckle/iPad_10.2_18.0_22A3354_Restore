@implementation CNMeCardSharingOnboardingEditViewController

- (CNMeCardSharingOnboardingEditViewController)initWithContactStore:(id)a3 contact:(id)a4 nameProvider:(id)a5 avatarRecord:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  CNMeCardSharingOnboardingEditViewController *v16;
  uint64_t v17;
  CNMutableContact *editingContact;
  uint64_t v19;
  CNMutableContact *avatarCarouselEditingContact;
  CNMutableContact *v21;
  CNMutableContact *v22;
  CNMutableContact *v23;
  CNMutableContact *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  CNMeCardSharingPickerLayoutAttributes *layoutAttributes;
  CNSharingProfileLogger *v29;
  CNSharingProfileLogger *logger;
  CNMeCardSharingOnboardingEditViewController *v31;
  objc_super v33;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend((id)objc_opt_class(), "headerText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33.receiver = self;
  v33.super_class = (Class)CNMeCardSharingOnboardingEditViewController;
  v16 = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v33, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v15, 0, 0, 0);

  if (v16)
  {
    objc_storeStrong((id *)&v16->_contactStore, a3);
    objc_storeStrong((id *)&v16->_contact, a4);
    objc_storeStrong((id *)&v16->_nameProvider, a5);
    objc_storeStrong((id *)&v16->_avatarRecord, a6);
    if (v12)
    {
      v17 = objc_msgSend(v12, "mutableCopy");
      editingContact = v16->_editingContact;
      v16->_editingContact = (CNMutableContact *)v17;

      v19 = objc_msgSend(v12, "mutableCopy");
      avatarCarouselEditingContact = v16->_avatarCarouselEditingContact;
      v16->_avatarCarouselEditingContact = (CNMutableContact *)v19;

    }
    else
    {
      v21 = (CNMutableContact *)objc_alloc_init(MEMORY[0x1E0C97360]);
      v22 = v16->_editingContact;
      v16->_editingContact = v21;

      v23 = (CNMutableContact *)objc_alloc_init(MEMORY[0x1E0C97360]);
      v24 = v16->_avatarCarouselEditingContact;
      v16->_avatarCarouselEditingContact = v23;

      v16->_shouldSetAsMeContact = 1;
    }
    objc_msgSend(v13, "givenName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMutableContact setGivenName:](v16->_avatarCarouselEditingContact, "setGivenName:", v25);

    objc_msgSend(v13, "familyName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMutableContact setFamilyName:](v16->_avatarCarouselEditingContact, "setFamilyName:", v26);

    +[CNMeCardSharingPickerLayoutAttributes layoutAttributesForBuddy](CNMeCardSharingPickerLayoutAttributes, "layoutAttributesForBuddy");
    v27 = objc_claimAutoreleasedReturnValue();
    layoutAttributes = v16->_layoutAttributes;
    v16->_layoutAttributes = (CNMeCardSharingPickerLayoutAttributes *)v27;

    v29 = objc_alloc_init(CNSharingProfileLogger);
    logger = v16->_logger;
    v16->_logger = v29;

    v31 = v16;
  }

  return v16;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CNMeCardSharingOnboardingEditViewController;
  -[CNMeCardSharingOnboardingEditViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  CNMeCardSharingOnboardingAvatarCarouselViewController *v7;
  CNMeCardSharingOnboardingAvatarCarouselViewController *avatarCarouselViewController;
  void *v9;
  void *v10;
  double Width;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *v17;
  NSString *editingGivenName;
  NSString *v19;
  NSString *editingFamilyName;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  UITextField *v26;
  UITextField *givenNameField;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  UITextField *v33;
  UITextField *familyNameField;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_super v46;
  CGRect v47;

  v46.receiver = self;
  v46.super_class = (Class)CNMeCardSharingOnboardingEditViewController;
  -[CNMeCardSharingOnboardingViewController viewDidLoad](&v46, sel_viewDidLoad);
  -[OBTableWelcomeController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setKeyboardDismissMode:", 2);

  -[OBTableWelcomeController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  +[CNMeCardSharingTextFieldTableViewCell cellIdentifier](CNMeCardSharingTextFieldTableViewCell, "cellIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v5, v6);

  v7 = -[CNMeCardSharingOnboardingAvatarCarouselViewController initWithContact:avatarRecord:logger:]([CNMeCardSharingOnboardingAvatarCarouselViewController alloc], "initWithContact:avatarRecord:logger:", self->_avatarCarouselEditingContact, self->_avatarRecord, self->_logger);
  avatarCarouselViewController = self->_avatarCarouselViewController;
  self->_avatarCarouselViewController = v7;

  -[CNMeCardSharingOnboardingAvatarCarouselViewController view](self->_avatarCarouselViewController, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAutoresizingMask:", 2);

  -[OBTableWelcomeController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  Width = CGRectGetWidth(v47);
  -[CNMeCardSharingOnboardingAvatarCarouselViewController view](self->_avatarCarouselViewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", 0.0, 0.0, Width, 220.0);

  -[CNMeCardSharingOnboardingAvatarCarouselViewController setDelegate:](self->_avatarCarouselViewController, "setDelegate:", self);
  -[CNMeCardSharingOnboardingAvatarCarouselViewController view](self->_avatarCarouselViewController, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTableWelcomeController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTableHeaderView:", v13);

  -[OBTableWelcomeController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDelegate:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDataSource:", self);

  -[CNMeCardSharingNameProvider givenName](self->_nameProvider, "givenName");
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  editingGivenName = self->_editingGivenName;
  self->_editingGivenName = v17;

  -[CNMeCardSharingNameProvider familyName](self->_nameProvider, "familyName");
  v19 = (NSString *)objc_claimAutoreleasedReturnValue();
  editingFamilyName = self->_editingFamilyName;
  self->_editingFamilyName = v19;

  v21 = objc_alloc(MEMORY[0x1E0DC3DB8]);
  v22 = *MEMORY[0x1E0C9D648];
  v23 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v24 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v25 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v26 = (UITextField *)objc_msgSend(v21, "initWithFrame:", *MEMORY[0x1E0C9D648], v23, v24, v25);
  givenNameField = self->_givenNameField;
  self->_givenNameField = v26;

  -[CNMeCardSharingNameProvider givenName](self->_nameProvider, "givenName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](self->_givenNameField, "setText:", v28);

  CNContactsUIBundle();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("SHARING_GIVEN_NAME_PLACEHOLDER"), &stru_1E20507A8, CFSTR("Localized"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setPlaceholder:](self->_givenNameField, "setPlaceholder:", v30);

  v31 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setFont:](self->_givenNameField, "setFont:", v32);

  -[UITextField setAdjustsFontForContentSizeCategory:](self->_givenNameField, "setAdjustsFontForContentSizeCategory:", 1);
  -[UITextField setAutocorrectionType:](self->_givenNameField, "setAutocorrectionType:", 1);
  -[UITextField addTarget:action:forControlEvents:](self->_givenNameField, "addTarget:action:forControlEvents:", self, sel_givenNameDidChange_, 0x20000);
  -[UITextField setDelegate:](self->_givenNameField, "setDelegate:", self);
  v33 = (UITextField *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3DB8]), "initWithFrame:", v22, v23, v24, v25);
  familyNameField = self->_familyNameField;
  self->_familyNameField = v33;

  -[CNMeCardSharingNameProvider familyName](self->_nameProvider, "familyName");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](self->_familyNameField, "setText:", v35);

  CNContactsUIBundle();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("SHARING_FAMILY_NAME_PLACEHOLDER"), &stru_1E20507A8, CFSTR("Localized"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setPlaceholder:](self->_familyNameField, "setPlaceholder:", v37);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v31);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setFont:](self->_familyNameField, "setFont:", v38);

  -[UITextField setAdjustsFontForContentSizeCategory:](self->_familyNameField, "setAdjustsFontForContentSizeCategory:", 1);
  -[UITextField setAutocorrectionType:](self->_familyNameField, "setAutocorrectionType:", 1);
  -[UITextField addTarget:action:forControlEvents:](self->_familyNameField, "addTarget:action:forControlEvents:", self, sel_familyNameDidChange_, 0x20000);
  -[UITextField setDelegate:](self->_familyNameField, "setDelegate:", self);
  -[OBTableWelcomeController tableView](self, "tableView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setKeyboardDismissMode:", 2);

  v40 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  -[CNMeCardSharingNameProvider givenName](self->_nameProvider, "givenName");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setGivenName:", v41);

  -[CNMeCardSharingNameProvider familyName](self->_nameProvider, "familyName");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFamilyName:", v42);

  self->_nameOrder = objc_msgSend(MEMORY[0x1E0CB3858], "_nameOrderWithOverridesForComponents:options:", v40, 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addObserver:selector:name:object:", self, sel_keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addObserver:selector:name:object:", self, sel_keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addObserver:selector:name:object:", self, sel_contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNMeCardSharingOnboardingEditViewController;
  -[OBTableWelcomeController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[CNMeCardSharingOnboardingEditViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "effectiveUserInterfaceLayoutDirection");

  if (v5 == 1)
    -[CNMeCardSharingOnboardingAvatarCarouselViewController scrollToItemAtIndex:animated:](self->_avatarCarouselViewController, "scrollToItemAtIndex:animated:", 0, 0);
}

- (void)updateAvatarCarouselContactName
{
  -[CNMutableContact setGivenName:](self->_avatarCarouselEditingContact, "setGivenName:", self->_editingGivenName);
  -[CNMutableContact setFamilyName:](self->_avatarCarouselEditingContact, "setFamilyName:", self->_editingFamilyName);
}

- (void)saveDraftContact
{
  id v3;
  CNMutableContact *v4;
  CNSharingProfileLogger *logger;
  void *v6;
  void *v7;
  char v8;
  id v9;
  CNSharingProfileLogger *v10;
  void *v11;
  char v12;
  id v13;
  CNContact *v14;
  CNContact *contact;
  CNSharingProfileLogger *v16;
  CNSharingProfileLogger *v17;
  uint64_t v18;
  id v19;
  id v20;

  v3 = objc_alloc_init(MEMORY[0x1E0C973D0]);
  if (self->_shouldSetAsMeContact)
  {
    -[CNMutableContact setGivenName:](self->_editingContact, "setGivenName:", self->_editingGivenName);
    -[CNMutableContact setFamilyName:](self->_editingContact, "setFamilyName:", self->_editingFamilyName);
    v4 = self->_editingContact;
    objc_msgSend(v3, "addContact:toContainerWithIdentifier:", v4, 0);
  }
  else if (-[CNContact hasBeenPersisted](self->_contact, "hasBeenPersisted"))
  {
    v4 = (CNMutableContact *)-[CNContact mutableCopy](self->_contact, "mutableCopy");
    -[CNMeCardSharingOnboardingEditViewController updateContact:withImagePropertiesFromContact:](self, "updateContact:withImagePropertiesFromContact:", v4, self->_editingContact);
    objc_msgSend(v3, "updateContact:", v4);
  }
  else
  {
    v4 = 0;
  }
  logger = self->_logger;
  -[CNMutableContact identifier](v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfileLogger logOnboardingSavingContact:](logger, "logOnboardingSavingContact:", v6);

  -[CNMeCardSharingOnboardingEditViewController contactStore](self, "contactStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v8 = objc_msgSend(v7, "executeSaveRequest:error:", v3, &v20);
  v9 = v20;

  if ((v8 & 1) == 0)
  {
    v16 = self->_logger;
    objc_msgSend(v9, "localizedDescription");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[CNSharingProfileLogger logOnboardingErrorSavingContactWithDescription:](v16, "logOnboardingErrorSavingContactWithDescription:", v13);
LABEL_13:

    goto LABEL_14;
  }
  v10 = self->_logger;
  if (self->_shouldSetAsMeContact)
  {
    -[CNSharingProfileLogger logSettingsSettingMeContact](v10, "logSettingsSettingMeContact");
    -[CNMeCardSharingOnboardingEditViewController contactStore](self, "contactStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v12 = objc_msgSend(v11, "setMeContact:error:", v4, &v19);
    v13 = v19;

    if ((v12 & 1) != 0)
    {
      self->_shouldSetAsMeContact = 0;
      v14 = (CNContact *)-[CNMutableContact copy](v4, "copy");
      contact = self->_contact;
      self->_contact = v14;

      -[CNSharingProfileLogger logOnboardingSuccessSavingContact](self->_logger, "logOnboardingSuccessSavingContact");
    }
    else
    {
      v17 = self->_logger;
      objc_msgSend(v13, "localizedDescription");
      v18 = objc_claimAutoreleasedReturnValue();
      -[CNSharingProfileLogger logOnboardingErrorSettingMeContactWithDescription:](v17, "logOnboardingErrorSettingMeContactWithDescription:", v18);

      v13 = (id)v18;
    }
    goto LABEL_13;
  }
  -[CNSharingProfileLogger logOnboardingSuccessSavingContact](v10, "logOnboardingSuccessSavingContact");
LABEL_14:

}

- (void)givenNameDidChange:(id)a3
{
  NSString *v4;
  NSString *editingGivenName;

  objc_msgSend(a3, "text");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  editingGivenName = self->_editingGivenName;
  self->_editingGivenName = v4;

  -[CNMeCardSharingOnboardingEditViewController updateAvatarCarouselContactName](self, "updateAvatarCarouselContactName");
  -[CNMeCardSharingOnboardingAvatarCarouselViewController reloadForUpdatedMonogram](self->_avatarCarouselViewController, "reloadForUpdatedMonogram");
}

- (void)familyNameDidChange:(id)a3
{
  NSString *v4;
  NSString *editingFamilyName;

  objc_msgSend(a3, "text");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  editingFamilyName = self->_editingFamilyName;
  self->_editingFamilyName = v4;

  -[CNMeCardSharingOnboardingEditViewController updateAvatarCarouselContactName](self, "updateAvatarCarouselContactName");
  -[CNMeCardSharingOnboardingAvatarCarouselViewController reloadForUpdatedMonogram](self->_avatarCarouselViewController, "reloadForUpdatedMonogram");
}

- (id)confirmButtonTitle
{
  void *v2;
  void *v3;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SHARING_CONTINUE"), &stru_1E20507A8, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)handleConfirmButtonTapped
{
  void *v3;
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
  objc_class *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  CNPhotoPickerAnimojiProviderItem *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  -[UITextField text](self->_givenNameField, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextField text](self->_familyNameField, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)&self->_editingGivenName, v5);
  objc_storeStrong((id *)&self->_editingFamilyName, v8);
  -[CNMeCardSharingOnboardingEditViewController updateAvatarCarouselContactName](self, "updateAvatarCarouselContactName");
  -[CNMeCardSharingOnboardingAvatarCarouselViewController selectedItem](self->_avatarCarouselViewController, "selectedItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "imageType") == 3 && objc_msgSend(v9, "shouldShowVariants"))
  {
    +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "defaultSchedulerProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_msgSend(v11, "newSerialSchedulerWithName:", CFSTR("com.apple.ContactsUI.PhotoPickerAnimojiProvider.renderingQueue"));
    objc_msgSend(v11, "mainThreadScheduler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v27 = &v26;
    v28 = 0x2050000000;
    v14 = (void *)getAVTAvatarRecordImageProviderClass_softClass_50036;
    v29 = getAVTAvatarRecordImageProviderClass_softClass_50036;
    if (!getAVTAvatarRecordImageProviderClass_softClass_50036)
    {
      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __getAVTAvatarRecordImageProviderClass_block_invoke_50037;
      v24 = &unk_1E204EBC0;
      v25 = &v26;
      __getAVTAvatarRecordImageProviderClass_block_invoke_50037((uint64_t)&v21);
      v14 = (void *)v27[3];
    }
    v15 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v26, 8);
    v16 = objc_alloc_init(v15);
    v26 = 0;
    v27 = &v26;
    v28 = 0x2050000000;
    v17 = (void *)getAVTRenderingScopeClass_softClass_50038;
    v29 = getAVTRenderingScopeClass_softClass_50038;
    if (!getAVTRenderingScopeClass_softClass_50038)
    {
      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __getAVTRenderingScopeClass_block_invoke_50039;
      v24 = &unk_1E204EBC0;
      v25 = &v26;
      __getAVTRenderingScopeClass_block_invoke_50039((uint64_t)&v21);
      v17 = (void *)v27[3];
    }
    v18 = objc_retainAutorelease(v17);
    _Block_object_dispose(&v26, 8);
    objc_msgSend(v18, "gridThumbnailScope");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[CNPhotoPickerAnimojiProviderItem initWithAvatarRecord:imageProvider:renderingScope:renderingQueue:callbackQueue:]([CNPhotoPickerAnimojiProviderItem alloc], "initWithAvatarRecord:imageProvider:renderingScope:renderingQueue:callbackQueue:", self->_avatarRecord, v16, v19, v12, v13);
    -[CNMeCardSharingOnboardingEditViewController showAvatarPosePickerFromItem:](self, "showAvatarPosePickerFromItem:", v20);

  }
  else
  {
    -[CNMeCardSharingOnboardingEditViewController finishOnboardingWithProviderItem:](self, "finishOnboardingWithProviderItem:", v9);
  }

}

- (void)finishOnboardingWithProviderItem:(id)a3
{
  void *v4;
  UIImage *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "cachedImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v7, "imageType") == 2)
  {
    objc_msgSend(v7, "cachedImage");
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIImagePNGRepresentation(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMutableContact setImageData:](self->_editingContact, "setImageData:", v6);

    -[CNMutableContact updateImageInfoWithType:](self->_editingContact, "updateImageInfoWithType:", 2);
  }
  -[CNMeCardSharingOnboardingEditViewController promptForSavingToMeCard](self, "promptForSavingToMeCard");

}

- (void)promptForSavingToMeCard
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CNMeCardSharingOnboardingEditViewController *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[5];
  _QWORD v22[5];

  v3 = (void *)MEMORY[0x1E0DC3450];
  CNContactsUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SHARING_UPDATE_ME_CARD_PROMPT_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SHARING_UPDATE_ME_CARD_PROMPT_MESSAGE"), &stru_1E20507A8, CFSTR("Localized"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SHARING_UPDATE_ME_CARD_PROMPT_CONFIRM"), &stru_1E20507A8, CFSTR("Localized"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __70__CNMeCardSharingOnboardingEditViewController_promptForSavingToMeCard__block_invoke;
  v22[3] = &unk_1E204F7F0;
  v22[4] = self;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 0, v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v13);

  v14 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("SHARING_UPDATE_ME_CARD_PROMPT_CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v12;
  v21[1] = 3221225472;
  v21[2] = __70__CNMeCardSharingOnboardingEditViewController_promptForSavingToMeCard__block_invoke_2;
  v21[3] = &unk_1E204F7F0;
  v21[4] = self;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 1, v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v17);

  v18 = self;
  -[CNMeCardSharingOnboardingEditViewController presentedViewController](v18, "presentedViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[CNMeCardSharingOnboardingEditViewController presentedViewController](v18, "presentedViewController");
    v20 = objc_claimAutoreleasedReturnValue();

    v18 = (CNMeCardSharingOnboardingEditViewController *)v20;
  }
  -[CNMeCardSharingOnboardingEditViewController presentViewController:animated:completion:](v18, "presentViewController:animated:completion:", v8, 1, 0);

}

- (int64_t)contactImageSourceForType:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return 0;
  else
    return qword_18AF8BAC8[a3 - 1];
}

- (void)finishOnboardingWithDidSaveToMeContact:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  UIImage *v7;
  UIImage *v8;
  void *v9;
  id v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  _QWORD v13[6];
  BOOL v14;

  v3 = a3;
  -[CNMeCardSharingOnboardingAvatarCarouselViewController selectedItem](self->_avatarCarouselViewController, "selectedItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "imageType");
  objc_msgSend(v5, "cachedImage");
  v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(v5, "imageProvider");
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __86__CNMeCardSharingOnboardingEditViewController_finishOnboardingWithDidSaveToMeContact___block_invoke;
    v13[3] = &unk_1E204E470;
    v13[4] = self;
    v13[5] = v6;
    v14 = v3;
    ((void (**)(_QWORD, _QWORD *))v12)[2](v12, v13);
    goto LABEL_5;
  }
  UIImagePNGRepresentation(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0C97220]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void (**)(_QWORD, _QWORD))objc_msgSend(v10, "initWithImageData:cropRect:lastUsedDate:", v9, v11, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  objc_msgSend(v12, "setSource:", -[CNMeCardSharingOnboardingEditViewController contactImageSourceForType:](self, "contactImageSourceForType:", v6));
  if (v12)
  {
    -[CNMeCardSharingOnboardingEditViewController notifyDelegateWithContactImage:didSaveToMeContact:](self, "notifyDelegateWithContactImage:didSaveToMeContact:", v12, v3);
LABEL_5:

  }
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
    v14[2] = __100__CNMeCardSharingOnboardingEditViewController_presentErrorAlertForEmptyPhotoIfNeededWithCompletion___block_invoke;
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

- (void)notifyDelegateWithContactImage:(id)a3 didSaveToMeContact:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  CNMeCardSharingResult *v7;
  NSString *editingGivenName;
  NSString *editingFamilyName;
  void *v10;
  void *v11;
  void *v12;
  CNMeCardSharingResult *v13;
  CNSharingProfileLogger *logger;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id WeakRetained;
  void *v20;
  _QWORD v21[5];
  CNMeCardSharingResult *v22;

  v4 = a4;
  v6 = a3;
  v7 = [CNMeCardSharingResult alloc];
  editingGivenName = self->_editingGivenName;
  editingFamilyName = self->_editingFamilyName;
  objc_msgSend(v6, "resizedContactImageForMeCardSharing");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMutableContact wallpaper](self->_editingContact, "wallpaper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMutableContact watchWallpaperImageData](self->_editingContact, "watchWallpaperImageData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CNMeCardSharingResult initWithGivenName:familyName:contactImage:wallpaper:watchWallpaperImageData:didSaveImageToMeCard:](v7, "initWithGivenName:familyName:contactImage:wallpaper:watchWallpaperImageData:didSaveImageToMeCard:", editingGivenName, editingFamilyName, v10, v11, v12, v4);

  logger = self->_logger;
  -[CNMeCardSharingResult description](v13, "description");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfileLogger logOnboardingReturningSharingResultWithDescription:](logger, "logOnboardingReturningSharingResultWithDescription:", v15);

  -[CNMeCardSharingResult contactImage](v13, "contactImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "imageData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  if (!v18)
  {
    if (objc_msgSend(v6, "source") != 1
      || (objc_msgSend(v6, "variant"), v20 = (void *)objc_claimAutoreleasedReturnValue(), v20, v20))
    {
      -[CNSharingProfileLogger logOnboardingReturningEmptyImage](self->_logger, "logOnboardingReturningEmptyImage");
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __97__CNMeCardSharingOnboardingEditViewController_notifyDelegateWithContactImage_didSaveToMeContact___block_invoke;
      v21[3] = &unk_1E2050400;
      v21[4] = self;
      v22 = v13;
      -[CNMeCardSharingOnboardingEditViewController presentErrorAlertForEmptyPhotoIfNeededWithCompletion:](self, "presentErrorAlertForEmptyPhotoIfNeededWithCompletion:", v21);

      goto LABEL_6;
    }
    -[CNSharingProfileLogger logOnboardingReturningDefaultMonogram](self->_logger, "logOnboardingReturningDefaultMonogram");
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "meCardSharingOnboardingEditController:didFinishWithOnboardingResult:", self, v13);

LABEL_6:
}

- (void)showAvatarPosePickerFromItem:(id)a3
{
  CNPhotoPickerVariantsManager *v4;
  CNPhotoPickerVariantsManager *variantsManager;
  CNAvatarEditingManager *v6;
  void *v7;
  CNAvatarEditingManager *v8;
  CNAvatarEditingManager *posePicker;
  CNAvatarEditingManager *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CNPortraitOnlyNavigationController *v15;
  void *v16;
  CNPortraitOnlyNavigationController *v17;
  id v18;

  v18 = a3;
  if (!self->_variantsManager)
  {
    v4 = objc_alloc_init(CNPhotoPickerVariantsManager);
    variantsManager = self->_variantsManager;
    self->_variantsManager = v4;

  }
  if (+[CNPhotoPickerCapabilities allowsAvatarUI](CNPhotoPickerCapabilities, "allowsAvatarUI"))
  {
    v6 = [CNAvatarEditingManager alloc];
    objc_msgSend(v18, "avatarRecord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CNAvatarEditingManager initWithAvatarRecord:variantsManager:](v6, "initWithAvatarRecord:variantsManager:", v7, self->_variantsManager);

    -[CNAvatarEditingManager setDelegate:](v8, "setDelegate:", self);
    -[CNAvatarEditingManager setOriginalItem:](v8, "setOriginalItem:", v18);
    posePicker = self->_posePicker;
    self->_posePicker = v8;
    v10 = v8;

    -[CNMeCardSharingOnboardingEditViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "backgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarEditingManager viewController](v10, "viewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v12);

    v15 = [CNPortraitOnlyNavigationController alloc];
    -[CNAvatarEditingManager viewController](v10, "viewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = -[CNPortraitOnlyNavigationController initWithRootViewController:](v15, "initWithRootViewController:", v16);
    -[CNPortraitOnlyNavigationController setModalPresentationStyle:](v17, "setModalPresentationStyle:", 0);
    -[CNMeCardSharingOnboardingEditViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);

  }
}

- (void)avatarEditingManager:(id)a3 didFinishWithProviderItem:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  if (v8)
  {
    objc_msgSend(a3, "viewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMeCardSharingOnboardingEditViewController presentPhotoPickerVariantListForItem:FromViewController:](self, "presentPhotoPickerVariantListForItem:FromViewController:", v8, v7);

  }
  else
  {
    -[CNMeCardSharingOnboardingEditViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (void)presentPhotoPickerVariantListForItem:(id)a3 FromViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  CNPortraitOnlyNavigationController *v11;
  void *v12;
  uint64_t v13;
  CNPhotoPickerVariantListController *v14;

  v6 = a4;
  v7 = a3;
  v14 = -[CNPhotoPickerVariantListController initWithVariantsManager:originalItem:]([CNPhotoPickerVariantListController alloc], "initWithVariantsManager:originalItem:", self->_variantsManager, v7);

  -[CNPhotoPickerVariantListController setDelegate:](v14, "setDelegate:", self);
  -[CNMeCardSharingOnboardingEditViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "backgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerVariantListController view](v14, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

  v11 = -[CNPortraitOnlyNavigationController initWithRootViewController:]([CNPortraitOnlyNavigationController alloc], "initWithRootViewController:", v14);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  -[CNPortraitOnlyNavigationController setModalPresentationStyle:](v11, "setModalPresentationStyle:", 2 * ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1));
  objc_msgSend(v6, "presentViewController:animated:completion:", v11, 1, 0);

}

- (void)photoPickerVariantListControllerDidCancel:(id)a3
{
  id v3;

  -[CNMeCardSharingOnboardingEditViewController presentedViewController](self, "presentedViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)photoPickerVariantListController:(id)a3 didSelectProviderItem:(id)a4
{
  id v6;
  id v7;
  CNMeCardSharingOnboardingEditViewController *v8;
  void *v9;
  void *v10;
  CNMeCardSharingOnboardingEditViewController *v11;
  _QWORD v12[5];

  v6 = a3;
  v7 = a4;
  v8 = (CNMeCardSharingOnboardingEditViewController *)v6;
  -[CNMeCardSharingOnboardingEditViewController presentedViewController](self, "presentedViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharingOnboardingEditViewController presentingViewController](v8, "presentingViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v8;
  if (v9 == v10)
  {
    v11 = self;

  }
  objc_msgSend(v7, "updateContact:", self->_editingContact);
  -[CNMeCardSharingOnboardingEditViewController updateContact:withImagePropertiesFromContact:](self, "updateContact:withImagePropertiesFromContact:", self->_avatarCarouselEditingContact, self->_editingContact);
  -[CNMeCardSharingOnboardingAvatarCarouselViewController reloadForUpdatedContactPhoto](self->_avatarCarouselViewController, "reloadForUpdatedContactPhoto");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __102__CNMeCardSharingOnboardingEditViewController_photoPickerVariantListController_didSelectProviderItem___block_invoke;
  v12[3] = &unk_1E204F648;
  v12[4] = self;
  -[CNMeCardSharingOnboardingEditViewController dismissViewControllerAnimated:completion:](v11, "dismissViewControllerAnimated:completion:", 1, v12);

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
  id v13;

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
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setMemojiMetadata:", v13);
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
  void *v31;
  double v32;
  CGFloat v33;
  void *v34;
  double v35;
  CGFloat v36;
  void *v37;
  double v38;
  CGFloat v39;
  void *v40;
  double v41;
  CGFloat v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  void *v57;
  double Height;
  id v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[CNMeCardSharingOnboardingEditViewController view](self, "view");
  v59 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "convertRect:fromWindow:", 0, v7, v9, v11, v13);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  objc_msgSend(v59, "convertRect:fromView:", 0, v16, v18, v20, v22);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  objc_msgSend(v59, "bounds");
  v63.origin.x = v24;
  v63.origin.y = v26;
  v63.size.width = v28;
  v63.size.height = v30;
  v61 = CGRectIntersection(v60, v63);
  Height = CGRectGetHeight(v61);
  -[OBTableWelcomeController scrollView](self, "scrollView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "frame");
  v33 = v32;
  -[OBTableWelcomeController scrollView](self, "scrollView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "frame");
  v36 = v35;
  -[OBTableWelcomeController scrollView](self, "scrollView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "contentSize");
  v39 = v38;
  -[OBTableWelcomeController scrollView](self, "scrollView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "contentSize");
  v42 = v41;

  v62.origin.x = v24;
  v62.origin.y = v26;
  v62.size.width = v28;
  v62.size.height = v30;
  v64.origin.x = v33;
  v64.origin.y = v36;
  v64.size.width = v39;
  v64.size.height = v42;
  if (CGRectIntersectsRect(v62, v64))
  {
    -[CNMeCardSharingOnboardingEditViewController adjustInsetsForKeyboardOverlap:](self, "adjustInsetsForKeyboardOverlap:", Height);
    -[OBTableWelcomeController scrollView](self, "scrollView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "frame");
    v45 = Height - v44;

    -[OBTableWelcomeController scrollView](self, "scrollView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "frame");
    v48 = v45 + v47;
    -[OBTableWelcomeController scrollView](self, "scrollView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "contentSize");
    v51 = v50;

    if (v48 > v51)
    {
      -[OBTableWelcomeController scrollView](self, "scrollView");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "contentSize");
      v54 = v53;
      -[OBTableWelcomeController scrollView](self, "scrollView");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "frame");
      v45 = v54 - (v56 - Height);

    }
    -[OBTableWelcomeController scrollView](self, "scrollView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setContentOffset:", 0.0, v45);

  }
}

- (void)keyboardWillHide:(id)a3
{
  -[CNMeCardSharingOnboardingEditViewController adjustInsetsForKeyboardOverlap:](self, "adjustInsetsForKeyboardOverlap:", a3, 0.0);
}

- (void)adjustInsetsForKeyboardOverlap:(double)a3
{
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
  id v15;

  -[OBTableWelcomeController scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentInset");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  if (v11 != a3)
  {
    -[OBTableWelcomeController scrollView](self, "scrollView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContentInset:", v7, v9, a3, v13);

    -[OBTableWelcomeController scrollView](self, "scrollView");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setScrollIndicatorInsets:", v7, v9, a3, v13);

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
      v7 = &OBJC_IVAR___CNMeCardSharingOnboardingEditViewController__givenNameField;
    else
      v7 = &OBJC_IVAR___CNMeCardSharingOnboardingEditViewController__familyNameField;
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + *v7), "becomeFirstResponder");
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

  -[UITextField text](self->_givenNameField, "text", a3);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  editingGivenName = self->_editingGivenName;
  self->_editingGivenName = v4;

  -[UITextField text](self->_familyNameField, "text");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  editingFamilyName = self->_editingFamilyName;
  self->_editingFamilyName = v6;

  -[CNMeCardSharingOnboardingEditViewController updateAvatarCarouselContactName](self, "updateAvatarCarouselContactName");
  -[CNMeCardSharingOnboardingAvatarCarouselViewController reloadForUpdatedMonogram](self->_avatarCarouselViewController, "reloadForUpdatedMonogram");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  void *v4;
  double v5;
  double v6;
  double result;

  -[UITextField font](self->_givenNameField, "font", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lineHeight");
  v6 = v5 + 10.0;

  result = 44.0;
  if (v6 >= 44.0)
    return v6;
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  +[CNMeCardSharingTextFieldTableViewCell cellIdentifier](CNMeCardSharingTextFieldTableViewCell, "cellIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setSelectionStyle:", 0);
  v10 = objc_msgSend(v6, "row");

  -[CNMeCardSharingOnboardingEditViewController textFieldForIndex:](self, "textFieldForIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextField:", v11);

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v4;
  id v5;

  objc_msgSend(a3, "cellForRowAtIndexPath:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "becomeFirstResponder");

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  CNContactsUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SHARING_ONBOARDING_DISPLAY_NAME"), &stru_1E20507A8, CFSTR("Localized"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)textFieldForIndex:(int64_t)a3
{
  int *v4;
  UITextField **p_givenNameField;
  void *v6;
  void *v7;
  UITextField *givenNameField;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (self->_nameOrder == 2)
  {
    v10[0] = self->_familyNameField;
    v4 = &OBJC_IVAR___CNMeCardSharingOnboardingEditViewController__givenNameField;
    p_givenNameField = (UITextField **)v10;
  }
  else
  {
    givenNameField = self->_givenNameField;
    v4 = &OBJC_IVAR___CNMeCardSharingOnboardingEditViewController__familyNameField;
    p_givenNameField = &givenNameField;
  }
  p_givenNameField[1] = *(UITextField **)((char *)&self->super.super.super.super.super.super.super.isa + *v4);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)avatarCarouselViewControllerDidTapPhotoPickerCell:(id)a3
{
  CNPhotoPickerViewController *v4;
  CNMutableContact *avatarCarouselEditingContact;
  void *v6;
  void *v7;
  CNPhotoPickerViewController *v8;
  void *v9;
  void *v10;
  CNPhotoPickerViewController *photoPickerViewController;
  CNPhotoPickerViewController *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = [CNPhotoPickerViewController alloc];
  avatarCarouselEditingContact = self->_avatarCarouselEditingContact;
  +[CNContactStyle defaultStyle](CNContactStyle, "defaultStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPhotoPickerConfiguration contactsConfiguration](CNPhotoPickerConfiguration, "contactsConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNPhotoPickerViewController initWithContact:style:configuration:](v4, "initWithContact:style:configuration:", avatarCarouselEditingContact, v6, v7);

  -[CNPhotoPickerViewController setDelegate:](v8, "setDelegate:", self);
  CNContactsUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SHARING_PHOTOPICKER_ASSIGN_TITLE_OVERRIDE"), &stru_1E20507A8, CFSTR("Localized"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityPickerViewController setAssignActionTitleOverride:](v8, "setAssignActionTitleOverride:", v10);

  photoPickerViewController = self->_photoPickerViewController;
  self->_photoPickerViewController = v8;
  v12 = v8;

  -[CNMeCardSharingOnboardingEditViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "endEditing:", 1);

  +[CNPhotoPickerViewController navigationControllerForPicker:](CNPhotoPickerViewController, "navigationControllerForPicker:", v12);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[CNMeCardSharingOnboardingEditViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);
}

- (void)avatarCarouselViewControllerDidUpdateCenterMostItem:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "imageProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharingOnboardingViewController confirmButton](self, "confirmButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v5 != 0);

}

- (void)photoPickerDidCancel:(id)a3
{
  id v3;

  -[CNMeCardSharingOnboardingEditViewController presentedViewController](self, "presentedViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)photoPicker:(id)a3 didUpdatePhotoForContact:(id)a4 withContactImage:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    -[CNMeCardSharingOnboardingEditViewController updateContact:withImagePropertiesFromContact:](self, "updateContact:withImagePropertiesFromContact:", self->_editingContact, v8);
    -[CNMeCardSharingOnboardingEditViewController updateContact:withImagePropertiesFromContact:](self, "updateContact:withImagePropertiesFromContact:", self->_avatarCarouselEditingContact, v8);
  }
  if (objc_msgSend(v9, "source") == 1 || !objc_msgSend(v9, "source"))
  {
    objc_msgSend(v9, "variant");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = objc_alloc(MEMORY[0x1E0D70A78]);
      objc_msgSend(v9, "variant");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithColorName:", v12);
      -[CNMeCardSharingOnboardingAvatarCarouselViewController setMonogramColor:](self->_avatarCarouselViewController, "setMonogramColor:", v13);

    }
    else
    {
      -[CNMeCardSharingOnboardingAvatarCarouselViewController setMonogramColor:](self->_avatarCarouselViewController, "setMonogramColor:", 0);
    }
  }
  -[CNMeCardSharingOnboardingAvatarCarouselViewController reloadForUpdatedContactPhoto](self->_avatarCarouselViewController, "reloadForUpdatedContactPhoto");
  -[CNMeCardSharingOnboardingEditViewController presentedViewController](self, "presentedViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (CNMeCardSharingOnboardingEditViewControllerDelegate)delegate
{
  return (CNMeCardSharingOnboardingEditViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)delegateDoesRespondToOnboardingResultSelector
{
  return self->_delegateDoesRespondToOnboardingResultSelector;
}

- (void)setDelegateDoesRespondToOnboardingResultSelector:(BOOL)a3
{
  self->_delegateDoesRespondToOnboardingResultSelector = a3;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (CNContact)contact
{
  return self->_contact;
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setAvatarRecord:(id)a3
{
  objc_storeStrong((id *)&self->_avatarRecord, a3);
}

- (CNMeCardSharingPickerLayoutAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (void)setLayoutAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_layoutAttributes, a3);
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

- (BOOL)shouldSetAsMeContact
{
  return self->_shouldSetAsMeContact;
}

- (void)setShouldSetAsMeContact:(BOOL)a3
{
  self->_shouldSetAsMeContact = a3;
}

- (CNMutableContact)editingContact
{
  return self->_editingContact;
}

- (void)setEditingContact:(id)a3
{
  objc_storeStrong((id *)&self->_editingContact, a3);
}

- (CNMutableContact)avatarCarouselEditingContact
{
  return self->_avatarCarouselEditingContact;
}

- (void)setAvatarCarouselEditingContact:(id)a3
{
  objc_storeStrong((id *)&self->_avatarCarouselEditingContact, a3);
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

- (CNMeCardSharingNameProvider)nameProvider
{
  return self->_nameProvider;
}

- (void)setNameProvider:(id)a3
{
  objc_storeStrong((id *)&self->_nameProvider, a3);
}

- (CNMeCardSharingOnboardingAvatarCarouselViewController)avatarCarouselViewController
{
  return self->_avatarCarouselViewController;
}

- (void)setAvatarCarouselViewController:(id)a3
{
  objc_storeStrong((id *)&self->_avatarCarouselViewController, a3);
}

- (CNMeCardSharingOnboardingHeaderViewController)headerViewController
{
  return self->_headerViewController;
}

- (void)setHeaderViewController:(id)a3
{
  objc_storeStrong((id *)&self->_headerViewController, a3);
}

- (CNPhotoPickerViewController)photoPickerViewController
{
  return self->_photoPickerViewController;
}

- (void)setPhotoPickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_photoPickerViewController, a3);
}

- (CNPhotoPickerVariantsManager)variantsManager
{
  return self->_variantsManager;
}

- (void)setVariantsManager:(id)a3
{
  objc_storeStrong((id *)&self->_variantsManager, a3);
}

- (CNAvatarEditingManager)posePicker
{
  return self->_posePicker;
}

- (void)setPosePicker:(id)a3
{
  objc_storeStrong((id *)&self->_posePicker, a3);
}

- (CNSharingProfileLogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_posePicker, 0);
  objc_storeStrong((id *)&self->_variantsManager, 0);
  objc_storeStrong((id *)&self->_photoPickerViewController, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_avatarCarouselViewController, 0);
  objc_storeStrong((id *)&self->_nameProvider, 0);
  objc_storeStrong((id *)&self->_editingFamilyName, 0);
  objc_storeStrong((id *)&self->_editingGivenName, 0);
  objc_storeStrong((id *)&self->_avatarCarouselEditingContact, 0);
  objc_storeStrong((id *)&self->_editingContact, 0);
  objc_storeStrong((id *)&self->_familyNameField, 0);
  objc_storeStrong((id *)&self->_givenNameField, 0);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __102__CNMeCardSharingOnboardingEditViewController_photoPickerVariantListController_didSelectProviderItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "promptForSavingToMeCard");
}

void __97__CNMeCardSharingOnboardingEditViewController_notifyDelegateWithContactImage_didSaveToMeContact___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1264));
  objc_msgSend(WeakRetained, "meCardSharingOnboardingEditController:didFinishWithOnboardingResult:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __100__CNMeCardSharingOnboardingEditViewController_presentErrorAlertForEmptyPhotoIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __86__CNMeCardSharingOnboardingEditViewController_finishOnboardingWithDidSaveToMeContact___block_invoke(uint64_t a1, UIImage *image)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  UIImagePNGRepresentation(image);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C97220]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithImageData:cropRect:lastUsedDate:", v6, v4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  objc_msgSend(v5, "setSource:", objc_msgSend(*(id *)(a1 + 32), "contactImageSourceForType:", *(_QWORD *)(a1 + 40)));
  objc_msgSend(*(id *)(a1 + 32), "notifyDelegateWithContactImage:didSaveToMeContact:", v5, *(unsigned __int8 *)(a1 + 48));

}

uint64_t __70__CNMeCardSharingOnboardingEditViewController_promptForSavingToMeCard__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "saveDraftContact");
  return objc_msgSend(*(id *)(a1 + 32), "finishOnboardingWithDidSaveToMeContact:", 1);
}

uint64_t __70__CNMeCardSharingOnboardingEditViewController_promptForSavingToMeCard__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishOnboardingWithDidSaveToMeContact:", 0);
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_1_50085 != -1)
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_1_50085, &__block_literal_global_50086);
  return (id)descriptorForRequiredKeys_cn_once_object_1_50087;
}

+ (id)headerText
{
  void *v2;
  void *v3;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SHARING_ONBOARDING_NAME_AND_PHOTO_HEADER"), &stru_1E20507A8, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __72__CNMeCardSharingOnboardingEditViewController_descriptorForRequiredKeys__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[7];

  v9[6] = *MEMORY[0x1E0C80C00];
  +[CNMeCardSharingContactNameProvider descriptorForRequiredKeys](CNMeCardSharingContactNameProvider, "descriptorForRequiredKeys");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v0;
  +[CNVisualIdentityPickerViewController descriptorForRequiredKeys](CNPhotoPickerViewController, "descriptorForRequiredKeys");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0C96708];
  v9[1] = v1;
  v9[2] = v2;
  v3 = *MEMORY[0x1E0C966C8];
  v9[3] = *MEMORY[0x1E0C96890];
  v9[4] = v3;
  v9[5] = *MEMORY[0x1E0C96700];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNMeCardSharingOnboardingEditViewController descriptorForRequiredKeys]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptorWithKeyDescriptors:description:", v4, v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)descriptorForRequiredKeys_cn_once_object_1_50087;
  descriptorForRequiredKeys_cn_once_object_1_50087 = v7;

}

@end
