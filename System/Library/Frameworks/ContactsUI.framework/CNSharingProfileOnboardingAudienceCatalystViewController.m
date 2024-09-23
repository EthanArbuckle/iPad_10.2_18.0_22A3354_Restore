@implementation CNSharingProfileOnboardingAudienceCatalystViewController

- (CNSharingProfileOnboardingAudienceCatalystViewController)initWithContact:(id)a3 selectedSharingAudience:(unint64_t)a4
{
  id v6;
  void *v7;
  CNSharingProfileOnboardingAudienceCatalystViewController *v8;
  CNSharingProfileAudienceDataSource *v9;
  CNSharingProfileAudienceDataSource *sharingAudienceDataSource;
  uint64_t v11;
  CNMutableContact *contact;
  CNSharingProfileOnboardingAudienceCatalystViewController *v13;
  objc_super v15;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "headerText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)CNSharingProfileOnboardingAudienceCatalystViewController;
  v8 = -[CNSharingProfileOnboardingAudienceCatalystViewController initWithTitle:detailText:icon:](&v15, sel_initWithTitle_detailText_icon_, v7, 0, 0);

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
  v4.super_class = (Class)CNSharingProfileOnboardingAudienceCatalystViewController;
  -[CNSharingProfileOnboardingAudienceCatalystViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  OBLinkTrayButton *v3;
  OBLinkTrayButton *setupLaterButton;
  OBLinkTrayButton *v5;
  void *v6;
  void *v7;
  void *v8;
  CNOnboardingBoldButtonProvider *v9;
  OBBoldTrayButton *v10;
  OBBoldTrayButton *backButton;
  OBBoldTrayButton *v12;
  void *v13;
  void *v14;
  void *v15;
  OBBoldTrayButton *v16;
  OBBoldTrayButton *confirmButton;
  OBBoldTrayButton *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  objc_super v27;

  objc_msgSend(MEMORY[0x1E0D65178], "linkButton");
  v3 = (OBLinkTrayButton *)objc_claimAutoreleasedReturnValue();
  setupLaterButton = self->_setupLaterButton;
  self->_setupLaterButton = v3;

  v5 = self->_setupLaterButton;
  CNContactsUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SHARING_SET_UP_LATER"), &stru_1E20507A8, CFSTR("Localized"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBLinkTrayButton setTitle:forState:](v5, "setTitle:forState:", v7, 0);

  -[OBLinkTrayButton addTarget:action:forControlEvents:](self->_setupLaterButton, "addTarget:action:forControlEvents:", self, sel_handleSetupLaterTapped_, 64);
  -[CNSharingProfileOnboardingAudienceCatalystViewController buttonTray](self, "buttonTray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addButton:", self->_setupLaterButton);

  v9 = objc_alloc_init(CNOnboardingBoldButtonProvider);
  -[CNOnboardingBoldButtonProvider boldAlternateButton](v9, "boldAlternateButton");
  v10 = (OBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
  backButton = self->_backButton;
  self->_backButton = v10;

  v12 = self->_backButton;
  CNContactsUIBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SHARING_BACK"), &stru_1E20507A8, CFSTR("Localized"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBoldTrayButton setTitle:forState:](v12, "setTitle:forState:", v14, 0);

  -[OBBoldTrayButton addTarget:action:forControlEvents:](self->_backButton, "addTarget:action:forControlEvents:", self, sel_handleBackTapped_, 64);
  -[CNSharingProfileOnboardingAudienceCatalystViewController buttonTray](self, "buttonTray");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addButton:", self->_backButton);

  -[CNOnboardingBoldButtonProvider boldButton](v9, "boldButton");
  v16 = (OBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
  confirmButton = self->_confirmButton;
  self->_confirmButton = v16;

  v18 = self->_confirmButton;
  -[CNSharingProfileOnboardingAudienceCatalystViewController confirmButtonTitle](self, "confirmButtonTitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBoldTrayButton setTitle:forState:](v18, "setTitle:forState:", v19, 0);

  -[OBBoldTrayButton addTarget:action:forControlEvents:](self->_confirmButton, "addTarget:action:forControlEvents:", self, sel_handleConfirmButtonTapped_, 64);
  -[CNSharingProfileOnboardingAudienceCatalystViewController updateConfirmButtonEnabledState](self, "updateConfirmButtonEnabledState");
  -[CNSharingProfileOnboardingAudienceCatalystViewController buttonTray](self, "buttonTray");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addButton:", self->_confirmButton);

  -[CNMutableContact givenName](self->_contact, "givenName");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21
    && (v22 = (void *)v21,
        -[CNMutableContact familyName](self->_contact, "familyName"),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        v23,
        v22,
        v23))
  {
    v24 = 0;
  }
  else
  {
    v24 = objc_alloc_init(MEMORY[0x1E0CB3850]);
    -[CNMutableContact givenName](self->_contact, "givenName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setGivenName:", v25);

    -[CNMutableContact familyName](self->_contact, "familyName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFamilyName:", v26);

  }
  self->_nameOrder = objc_msgSend(MEMORY[0x1E0CB3858], "_nameOrderWithOverridesForComponents:options:", v24, 0);
  -[CNSharingProfileOnboardingAudienceCatalystViewController createAvatarView](self, "createAvatarView");
  -[CNSharingProfileOnboardingAudienceCatalystViewController createNameLabel](self, "createNameLabel");
  -[CNSharingProfileOnboardingAudienceCatalystViewController createNameTextFields](self, "createNameTextFields");
  -[CNSharingProfileOnboardingAudienceCatalystViewController createAudienceLabel](self, "createAudienceLabel");
  -[CNSharingProfileOnboardingAudienceCatalystViewController createAudiencePickerButton](self, "createAudiencePickerButton");
  -[CNSharingProfileOnboardingAudienceCatalystViewController updateMenuForAudiencePicker](self, "updateMenuForAudiencePicker");
  -[CNSharingProfileOnboardingAudienceCatalystViewController createAudienceDescriptionLabel](self, "createAudienceDescriptionLabel");
  -[CNSharingProfileOnboardingAudienceCatalystViewController createContentView](self, "createContentView");
  -[CNSharingProfileOnboardingAudienceCatalystViewController layoutContentView](self, "layoutContentView");
  v27.receiver = self;
  v27.super_class = (Class)CNSharingProfileOnboardingAudienceCatalystViewController;
  -[OBWelcomeFullCenterContentController viewDidLoad](&v27, sel_viewDidLoad);

}

- (void)createAvatarView
{
  id v3;
  UIImageView *v4;
  UIImageView *avatarImageView;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_alloc(MEMORY[0x1E0DC3890]);
  v4 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  avatarImageView = self->_avatarImageView;
  self->_avatarImageView = v4;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_avatarImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = objc_alloc(MEMORY[0x1E0DC3870]);
  -[CNMutableContact thumbnailImageData](self->_contact, "thumbnailImageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v6, "initWithData:", v7);

  -[UIImageView setImage:](self->_avatarImageView, "setImage:", v9);
  -[UIImageView setClipsToBounds:](self->_avatarImageView, "setClipsToBounds:", 1);
  -[UIImageView layer](self->_avatarImageView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", 75.0);

}

- (void)createNameLabel
{
  id v3;
  UILabel *v4;
  UILabel *nameLabel;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  nameLabel = self->_nameLabel;
  self->_nameLabel = v4;

  +[CNUIFontRepository catalystLabelsFont](CNUIFontRepository, "catalystLabelsFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_nameLabel, "setFont:", v6);

  LODWORD(v7) = 1144766464;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_nameLabel, "setContentCompressionResistancePriority:forAxis:", 0, v7);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_nameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNSharingProfileOnboardingAudienceCatalystViewController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextAlignment:](self->_nameLabel, "setTextAlignment:", 2 * (objc_msgSend(v8, "layoutDirection") == 0));

  CNContactsUIBundle();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SHARING_NAME_LABEL"), &stru_1E20507A8, CFSTR("Localized"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_nameLabel, "setText:", v9);

}

- (void)createNameTextFields
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UITextField *v8;
  UITextField *givenNameField;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UITextField *v14;
  UITextField *familyNameField;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = objc_alloc(MEMORY[0x1E0DC3DB8]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = (UITextField *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  givenNameField = self->_givenNameField;
  self->_givenNameField = v8;

  -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](self->_givenNameField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNMutableContact givenName](self->_contact, "givenName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](self->_givenNameField, "setText:", v10);

  +[CNUIFontRepository catalystNameTextFieldsFont](CNUIFontRepository, "catalystNameTextFieldsFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setFont:](self->_givenNameField, "setFont:", v11);

  -[UITextField setAdjustsFontForContentSizeCategory:](self->_givenNameField, "setAdjustsFontForContentSizeCategory:", 1);
  -[UITextField setAutocorrectionType:](self->_givenNameField, "setAutocorrectionType:", 1);
  CNContactsUIBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SHARING_GIVEN_NAME_PLACEHOLDER"), &stru_1E20507A8, CFSTR("Localized"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setPlaceholder:](self->_givenNameField, "setPlaceholder:", v13);

  -[UITextField addTarget:action:forControlEvents:](self->_givenNameField, "addTarget:action:forControlEvents:", self, sel_givenNameDidChange_, 0x20000);
  -[UITextField setBorderStyle:](self->_givenNameField, "setBorderStyle:", 3);
  -[UITextField setDelegate:](self->_givenNameField, "setDelegate:", self);
  v14 = (UITextField *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3DB8]), "initWithFrame:", v4, v5, v6, v7);
  familyNameField = self->_familyNameField;
  self->_familyNameField = v14;

  -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](self->_familyNameField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNMutableContact familyName](self->_contact, "familyName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](self->_familyNameField, "setText:", v16);

  +[CNUIFontRepository catalystNameTextFieldsFont](CNUIFontRepository, "catalystNameTextFieldsFont");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setFont:](self->_familyNameField, "setFont:", v17);

  -[UITextField setAdjustsFontForContentSizeCategory:](self->_familyNameField, "setAdjustsFontForContentSizeCategory:", 1);
  -[UITextField setAutocorrectionType:](self->_familyNameField, "setAutocorrectionType:", 1);
  CNContactsUIBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("SHARING_FAMILY_NAME_PLACEHOLDER"), &stru_1E20507A8, CFSTR("Localized"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setPlaceholder:](self->_familyNameField, "setPlaceholder:", v19);

  -[UITextField addTarget:action:forControlEvents:](self->_familyNameField, "addTarget:action:forControlEvents:", self, sel_familyNameDidChange_, 0x20000);
  -[UITextField setBorderStyle:](self->_familyNameField, "setBorderStyle:", 3);
  -[UITextField setDelegate:](self->_familyNameField, "setDelegate:", self);
}

- (void)createAudienceLabel
{
  id v3;
  UILabel *v4;
  UILabel *audienceLabel;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  audienceLabel = self->_audienceLabel;
  self->_audienceLabel = v4;

  +[CNUIFontRepository catalystLabelsFont](CNUIFontRepository, "catalystLabelsFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_audienceLabel, "setFont:", v6);

  -[UILabel setNumberOfLines:](self->_audienceLabel, "setNumberOfLines:", 2);
  LODWORD(v7) = 1144766464;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_audienceLabel, "setContentCompressionResistancePriority:forAxis:", 0, v7);
  CNContactsUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SHARING_AUDIENCE_LABEL"), &stru_1E20507A8, CFSTR("Localized"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_audienceLabel, "setText:", v9);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_audienceLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNSharingProfileOnboardingAudienceCatalystViewController traitCollection](self, "traitCollection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextAlignment:](self->_audienceLabel, "setTextAlignment:", 2 * (objc_msgSend(v10, "layoutDirection") == 0));

}

- (void)createAudiencePickerButton
{
  UIButton *v3;
  UIButton *audiencePickerButton;

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 124);
  v3 = (UIButton *)objc_claimAutoreleasedReturnValue();
  audiencePickerButton = self->_audiencePickerButton;
  self->_audiencePickerButton = v3;

  -[UIButton setContentHorizontalAlignment:](self->_audiencePickerButton, "setContentHorizontalAlignment:", 1);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_audiencePickerButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
}

- (void)updateMenuForAudiencePicker
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNSharingProfileAudienceDataSource numberOfItems](self->_sharingAudienceDataSource, "numberOfItems"))
  {
    v4 = 0;
    do
    {
      -[CNSharingProfileAudienceDataSource itemForIndex:](self->_sharingAudienceDataSource, "itemForIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0DC3428];
      objc_msgSend(v5, "label");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "label");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __87__CNSharingProfileOnboardingAudienceCatalystViewController_updateMenuForAudiencePicker__block_invoke;
      v12[3] = &unk_1E20504A8;
      v12[4] = self;
      v9 = v5;
      v13 = v9;
      objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v7, 0, v8, v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v9, "isSelected"))
        objc_msgSend(v10, "setState:", 1);
      objc_msgSend(v3, "addObject:", v10);

      ++v4;
    }
    while (v4 < -[CNSharingProfileAudienceDataSource numberOfItems](self->_sharingAudienceDataSource, "numberOfItems"));
  }
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", &stru_1E20507A8, v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setMenu:](self->_audiencePickerButton, "setMenu:", v11);

}

- (void)createAudienceDescriptionLabel
{
  UILabel *v3;
  UILabel *audienceDescriptionLabel;
  double v5;
  void *v6;
  id v7;

  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  audienceDescriptionLabel = self->_audienceDescriptionLabel;
  self->_audienceDescriptionLabel = v3;

  -[UILabel setNumberOfLines:](self->_audienceDescriptionLabel, "setNumberOfLines:", 0);
  LODWORD(v5) = 1132068864;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_audienceDescriptionLabel, "setContentCompressionResistancePriority:forAxis:", 0, v5);
  +[CNUIFontRepository catalystAudienceDetailsLabelFont](CNUIFontRepository, "catalystAudienceDetailsLabelFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_audienceDescriptionLabel, "setFont:", v6);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_audienceDescriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNSharingProfileAudienceDataSource sectionFooterLabel](self->_sharingAudienceDataSource, "sectionFooterLabel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_audienceDescriptionLabel, "setText:", v7);

}

- (void)createContentView
{
  id v3;
  void *v4;
  UIView *v5;
  UIView *customContentView;

  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[CNSharingProfileOnboardingAudienceCatalystViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = (UIView *)objc_msgSend(v3, "initWithFrame:");

  -[OBWelcomeFullCenterContentController setCenteredContentView:](self, "setCenteredContentView:", v5);
  customContentView = self->_customContentView;
  self->_customContentView = v5;

}

- (void)layoutContentView
{
  void *v3;
  void *v4;
  int64_t nameOrder;
  BOOL v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
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
  id v102;
  _QWORD v103[30];

  v103[28] = *MEMORY[0x1E0C80C00];
  -[CNSharingProfileOnboardingAudienceCatalystViewController customContentView](self, "customContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self->_avatarImageView);
  objc_msgSend(v3, "addSubview:", self->_nameLabel);
  objc_msgSend(v3, "addSubview:", self->_givenNameField);
  objc_msgSend(v3, "addSubview:", self->_familyNameField);
  objc_msgSend(v3, "addSubview:", self->_audienceLabel);
  objc_msgSend(v3, "addSubview:", self->_audiencePickerButton);
  v4 = v3;
  objc_msgSend(v3, "addSubview:", self->_audienceDescriptionLabel);
  nameOrder = self->_nameOrder;
  v6 = nameOrder == 2;
  if (nameOrder == 2)
    v7 = 1280;
  else
    v7 = 1272;
  v8 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v7);
  if (v6)
    v9 = 1272;
  else
    v9 = 1280;
  v10 = (objc_class *)MEMORY[0x1E0DC39A0];
  v102 = *(id *)((char *)&self->super.super.super.super.super.super.isa + v9);
  v11 = v8;
  v12 = objc_alloc_init(v10);
  objc_msgSend(v4, "addLayoutGuide:");
  objc_msgSend(v4, "widthAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "widthAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "constraintEqualToAnchor:", v99);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v103[0] = v98;
  -[UIImageView topAnchor](self->_avatarImageView, "topAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "constraintEqualToAnchor:", v96);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v103[1] = v95;
  -[UIImageView widthAnchor](self->_avatarImageView, "widthAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "constraintEqualToConstant:", 150.0);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v103[2] = v93;
  -[UIImageView heightAnchor](self->_avatarImageView, "heightAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView widthAnchor](self->_avatarImageView, "widthAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "constraintEqualToAnchor:", v91);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v103[3] = v90;
  -[UIImageView centerXAnchor](self->_avatarImageView, "centerXAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerXAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "constraintEqualToAnchor:", v88);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v103[4] = v87;
  objc_msgSend(v12, "leadingAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](self->_nameLabel, "trailingAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintEqualToAnchor:constant:", v85, 10.0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v103[5] = v84;
  objc_msgSend(v12, "trailingAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:", v82);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v103[6] = v81;
  -[UILabel leadingAnchor](self->_nameLabel, "leadingAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToAnchor:", v79);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v103[7] = v78;
  -[UILabel trailingAnchor](self->_nameLabel, "trailingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "leadingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToAnchor:constant:", v76, -10.0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v103[8] = v75;
  objc_msgSend(v12, "widthAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widthAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToAnchor:multiplier:", v72, 0.6);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v103[9] = v71;
  objc_msgSend(v11, "leadingAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "leadingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:", v69);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v103[10] = v68;
  objc_msgSend(v11, "trailingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "leadingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:constant:", v66, -10.0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v103[11] = v65;
  objc_msgSend(v11, "centerYAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel centerYAnchor](self->_nameLabel, "centerYAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:", v63);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v103[12] = v61;
  objc_msgSend(v11, "topAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView bottomAnchor](self->_avatarImageView, "bottomAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:constant:", v58, 36.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v103[13] = v57;
  objc_msgSend(v11, "widthAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "widthAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:multiplier:constant:", v55, 0.5, -5.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v103[14] = v54;
  objc_msgSend(v102, "widthAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v12;
  objc_msgSend(v12, "widthAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:multiplier:constant:", v52, 0.5, -5.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v103[15] = v50;
  objc_msgSend(v102, "trailingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trailingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v103[16] = v47;
  objc_msgSend(v102, "centerYAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v11;
  objc_msgSend(v11, "centerYAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v103[17] = v44;
  -[UILabel leadingAnchor](self->_audienceLabel, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v103[18] = v41;
  -[UILabel trailingAnchor](self->_audienceLabel, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton leadingAnchor](self->_audiencePickerButton, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, -10.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v103[19] = v38;
  -[UILabel centerYAnchor](self->_audienceLabel, "centerYAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton centerYAnchor](self->_audiencePickerButton, "centerYAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v103[20] = v35;
  -[UILabel trailingAnchor](self->_audienceLabel, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](self->_nameLabel, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v103[21] = v32;
  -[UILabel topAnchor](self->_audienceLabel, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, 10.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v103[22] = v29;
  -[UIButton trailingAnchor](self->_audiencePickerButton, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v4;
  v51 = v4;
  objc_msgSend(v4, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v103[23] = v26;
  -[UILabel leadingAnchor](self->_audienceDescriptionLabel, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton leadingAnchor](self->_audiencePickerButton, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v103[24] = v14;
  -[UILabel widthAnchor](self->_audienceDescriptionLabel, "widthAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton widthAnchor](self->_audiencePickerButton, "widthAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v103[25] = v17;
  -[UILabel topAnchor](self->_audienceDescriptionLabel, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton bottomAnchor](self->_audiencePickerButton, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, 6.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v103[26] = v20;
  -[UILabel bottomAnchor](self->_audienceDescriptionLabel, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintLessThanOrEqualToAnchor:constant:", v22, -10.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v103[27] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 28);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v62);
}

- (void)didSelectSharingAudience:(unint64_t)a3
{
  id v4;

  -[CNSharingProfileAudienceDataSource setSelectedSharingAudience:](self->_sharingAudienceDataSource, "setSelectedSharingAudience:", a3);
  -[CNSharingProfileOnboardingAudienceCatalystViewController updateMenuForAudiencePicker](self, "updateMenuForAudiencePicker");
  -[CNSharingProfileAudienceDataSource sectionFooterLabel](self->_sharingAudienceDataSource, "sectionFooterLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_audienceDescriptionLabel, "setText:", v4);

}

- (void)givenNameDidChange:(id)a3
{
  void *v4;

  objc_msgSend(a3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMutableContact setGivenName:](self->_contact, "setGivenName:", v4);

  -[CNSharingProfileOnboardingAudienceCatalystViewController updateConfirmButtonEnabledState](self, "updateConfirmButtonEnabledState");
}

- (void)familyNameDidChange:(id)a3
{
  void *v4;

  objc_msgSend(a3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMutableContact setFamilyName:](self->_contact, "setFamilyName:", v4);

  -[CNSharingProfileOnboardingAudienceCatalystViewController updateConfirmButtonEnabledState](self, "updateConfirmButtonEnabledState");
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

- (void)handleSetupLaterTapped:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CNSharingProfileOnboardingAudienceCatalystViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNSharingProfileOnboardingAudienceCatalystViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "audienceControllerDidTapSetupLater:", self);

  }
}

- (void)handleBackTapped:(id)a3
{
  id v4;

  -[CNSharingProfileOnboardingAudienceCatalystViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audienceController:didFinishWithContact:sharingAudience:", self, 0, -[CNSharingProfileAudienceDataSource selectedSharingAudience](self->_sharingAudienceDataSource, "selectedSharingAudience"));

}

- (void)handleConfirmButtonTapped:(id)a3
{
  id v4;

  -[CNSharingProfileOnboardingAudienceCatalystViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audienceController:didFinishWithContact:sharingAudience:", self, self->_contact, -[CNSharingProfileAudienceDataSource selectedSharingAudience](self->_sharingAudienceDataSource, "selectedSharingAudience"));

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
      v7 = &OBJC_IVAR___CNSharingProfileOnboardingAudienceCatalystViewController__givenNameField;
    else
      v7 = &OBJC_IVAR___CNSharingProfileOnboardingAudienceCatalystViewController__familyNameField;
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

- (UIView)customContentView
{
  return self->_customContentView;
}

- (void)setCustomContentView:(id)a3
{
  objc_storeStrong((id *)&self->_customContentView, a3);
}

- (OBLinkTrayButton)setupLaterButton
{
  return self->_setupLaterButton;
}

- (void)setSetupLaterButton:(id)a3
{
  objc_storeStrong((id *)&self->_setupLaterButton, a3);
}

- (OBBoldTrayButton)backButton
{
  return self->_backButton;
}

- (void)setBackButton:(id)a3
{
  objc_storeStrong((id *)&self->_backButton, a3);
}

- (OBBoldTrayButton)confirmButton
{
  return self->_confirmButton;
}

- (void)setConfirmButton:(id)a3
{
  objc_storeStrong((id *)&self->_confirmButton, a3);
}

- (UIImageView)avatarImageView
{
  return self->_avatarImageView;
}

- (void)setAvatarImageView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarImageView, a3);
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
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

- (UILabel)audienceLabel
{
  return self->_audienceLabel;
}

- (void)setAudienceLabel:(id)a3
{
  objc_storeStrong((id *)&self->_audienceLabel, a3);
}

- (UIButton)audiencePickerButton
{
  return self->_audiencePickerButton;
}

- (void)setAudiencePickerButton:(id)a3
{
  objc_storeStrong((id *)&self->_audiencePickerButton, a3);
}

- (UILabel)audienceDescriptionLabel
{
  return self->_audienceDescriptionLabel;
}

- (void)setAudienceDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_audienceDescriptionLabel, a3);
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
  objc_storeStrong((id *)&self->_audienceDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_audiencePickerButton, 0);
  objc_storeStrong((id *)&self->_audienceLabel, 0);
  objc_storeStrong((id *)&self->_familyNameField, 0);
  objc_storeStrong((id *)&self->_givenNameField, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_avatarImageView, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_setupLaterButton, 0);
  objc_storeStrong((id *)&self->_customContentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __87__CNSharingProfileOnboardingAudienceCatalystViewController_updateMenuForAudiencePicker__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didSelectSharingAudience:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1320), "sharingAudienceForItem:", *(_QWORD *)(a1 + 40)));
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_1_40044 != -1)
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_1_40044, &__block_literal_global_40045);
  return (id)descriptorForRequiredKeys_cn_once_object_1_40046;
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

void __85__CNSharingProfileOnboardingAudienceCatalystViewController_descriptorForRequiredKeys__block_invoke()
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
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNSharingProfileOnboardingAudienceCatalystViewController descriptorForRequiredKeys]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorWithKeyDescriptors:description:", v1, v3);
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)descriptorForRequiredKeys_cn_once_object_1_40046;
  descriptorForRequiredKeys_cn_once_object_1_40046 = v4;

}

@end
