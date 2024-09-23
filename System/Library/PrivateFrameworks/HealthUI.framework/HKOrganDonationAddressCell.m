@implementation HKOrganDonationAddressCell

- (HKOrganDonationAddressCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKOrganDonationAddressCell *v4;
  UILabel *v5;
  UILabel *titleLabel;
  UILabel *v7;
  void *v8;
  void *v9;
  UIView *v10;
  UIView *addressContainerView;
  UITextField *v12;
  UITextField *streetOneTextField;
  UITextField *v14;
  UITextField *streetTwoTextField;
  HKCaretOptionalTextField *v16;
  UITextField *stateTextField;
  UITextField *v18;
  UITextField *cityTextField;
  UITextField *v20;
  UITextField *zipCodeTextField;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  uint64_t v36;
  UIButton *stateShadowButton;
  UIView *v38;
  UIView *verticalSeparator;
  UIView *v40;
  UIView *horizontalSeparator;
  UIView *v42;
  UIView *stateZipSeparator;
  UIView *v44;
  UIView *addressSeparator;
  UIView *v46;
  UIView *citySeparator;
  UIView *v48;
  UIView *stateSeparator;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  UIView *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id obj;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  objc_super v76;
  _BYTE v77[128];
  _QWORD v78[6];
  _BYTE v79[128];
  _QWORD v80[5];
  _QWORD v81[7];

  v81[5] = *MEMORY[0x1E0C80C00];
  v76.receiver = self;
  v76.super_class = (Class)HKOrganDonationAddressCell;
  v4 = -[HKOrganDonationAddressCell initWithStyle:reuseIdentifier:](&v76, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v5;

    v7 = v4->_titleLabel;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OD_ADDRESS"), &stru_1E9C4C428);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v7, "setText:", v9);

    v10 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    addressContainerView = v4->_addressContainerView;
    v4->_addressContainerView = v10;

    v12 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    streetOneTextField = v4->_streetOneTextField;
    v4->_streetOneTextField = v12;

    v14 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    streetTwoTextField = v4->_streetTwoTextField;
    v4->_streetTwoTextField = v14;

    v16 = objc_alloc_init(HKCaretOptionalTextField);
    stateTextField = v4->_stateTextField;
    v4->_stateTextField = &v16->super;

    v18 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    cityTextField = v4->_cityTextField;
    v4->_cityTextField = v18;

    v20 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    zipCodeTextField = v4->_zipCodeTextField;
    v4->_zipCodeTextField = v20;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "localizedStringForKey:value:table:", CFSTR("OD_PLACEHOLDER_ADDRESS_1"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = v65;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "localizedStringForKey:value:table:", CFSTR("OD_PLACEHOLDER_ADDRESS_2"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v81[1] = v63;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("OD_PLACEHOLDER_STATE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v81[2] = v23;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("OD_PLACEHOLDER_CITY"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v81[3] = v25;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("OD_PLACEHOLDER_ZIP"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v81[4] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectEnumerator");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v80[0] = v4->_streetOneTextField;
    v80[1] = v4->_streetTwoTextField;
    v80[2] = v4->_stateTextField;
    v80[3] = v4->_cityTextField;
    v80[4] = v4->_zipCodeTextField;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 5);
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v73 != v32)
            objc_enumerationMutation(obj);
          v34 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
          objc_msgSend(v34, "addTarget:action:forControlEvents:", v4, sel_textFieldDidChangeValue_, 0x20000);
          objc_msgSend(v29, "nextObject");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setPlaceholder:", v35);

          objc_msgSend(v34, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          objc_msgSend(v34, "setDelegate:", v4);
          objc_msgSend(v34, "setAutocorrectionType:", 1);
          objc_msgSend(v34, "setAutocapitalizationType:", 1);
          -[UIView addSubview:](v4->_addressContainerView, "addSubview:", v34);
        }
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
      }
      while (v31);
    }

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
    v36 = objc_claimAutoreleasedReturnValue();
    stateShadowButton = v4->_stateShadowButton;
    v4->_stateShadowButton = (UIButton *)v36;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_stateShadowButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v4->_addressContainerView, "addSubview:", v4->_stateShadowButton);
    -[UIButton addTarget:action:forControlEvents:](v4->_stateShadowButton, "addTarget:action:forControlEvents:", v4, sel__stateShadowButtonTapped_, 64);
    v38 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    verticalSeparator = v4->_verticalSeparator;
    v4->_verticalSeparator = v38;

    v40 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    horizontalSeparator = v4->_horizontalSeparator;
    v4->_horizontalSeparator = v40;

    v42 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    stateZipSeparator = v4->_stateZipSeparator;
    v4->_stateZipSeparator = v42;

    v44 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    addressSeparator = v4->_addressSeparator;
    v4->_addressSeparator = v44;

    v46 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    citySeparator = v4->_citySeparator;
    v4->_citySeparator = v46;

    v48 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    stateSeparator = v4->_stateSeparator;
    v4->_stateSeparator = v48;

    v78[0] = v4->_horizontalSeparator;
    v78[1] = v4->_verticalSeparator;
    v78[2] = v4->_stateZipSeparator;
    v78[3] = v4->_addressSeparator;
    v78[4] = v4->_citySeparator;
    v78[5] = v4->_stateSeparator;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 6);
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v50 = (id)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v69;
      do
      {
        for (j = 0; j != v52; ++j)
        {
          if (*(_QWORD *)v69 != v53)
            objc_enumerationMutation(v50);
          v55 = *(UIView **)(*((_QWORD *)&v68 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0DC3658], "systemMidGrayColor");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView setBackgroundColor:](v55, "setBackgroundColor:", v56);

          -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v55, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          if (v55 == v4->_horizontalSeparator || v55 == v4->_verticalSeparator)
          {
            -[HKOrganDonationAddressCell contentView](v4, "contentView");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "addSubview:", v55);

          }
          else
          {
            -[UIView addSubview:](v4->_addressContainerView, "addSubview:", v55);
          }
        }
        v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
      }
      while (v52);
    }

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_addressContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HKOrganDonationAddressCell contentView](v4, "contentView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "addSubview:", v4->_titleLabel);

    -[HKOrganDonationAddressCell contentView](v4, "contentView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "addSubview:", v4->_addressContainerView);

    -[HKOrganDonationAddressCell contentView](v4, "contentView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "addSubview:", v4->_verticalSeparator);

    -[HKOrganDonationAddressCell contentView](v4, "contentView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addSubview:", v4->_horizontalSeparator);

    -[HKOrganDonationAddressCell _setupFonts](v4, "_setupFonts");
    -[HKOrganDonationAddressCell _setupLayoutConstraints](v4, "_setupLayoutConstraints");
    -[HKOrganDonationAddressCell setSelectionStyle:](v4, "setSelectionStyle:", 0);

  }
  return v4;
}

- (void)_setupFonts
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v3);

  v4 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setFont:](self->_streetOneTextField, "setFont:", v5);

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setFont:](self->_streetTwoTextField, "setFont:", v6);

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setFont:](self->_stateTextField, "setFont:", v7);

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setFont:](self->_cityTextField, "setFont:", v8);

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextField setFont:](self->_zipCodeTextField, "setFont:", v9);

}

- (void)_setupLayoutConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  UILabel *titleLabel;
  void *v18;
  id v19;
  UIView *addressContainerView;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  UIView *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  double v36;
  const __CFString *v37;
  _QWORD v38[3];

  v38[1] = *MEMORY[0x1E0C80C00];
  _NSDictionaryOfVariableBindings(CFSTR("_titleLabel, _addressContainerView, _streetOneTextField, _streetTwoTextField, _stateTextField, _cityTextField, _zipCodeTextField, _verticalSeparator, _horizontalSeparator, _stateZipSeparator, _addressSeparator, _citySeparator, _stateSeparator, _stateShadowButton"), self->_titleLabel, self->_addressContainerView, self->_streetOneTextField, self->_streetTwoTextField, self->_stateTextField, self->_cityTextField, self->_zipCodeTextField, self->_verticalSeparator, self->_horizontalSeparator, self->_stateZipSeparator, self->_addressSeparator, self->_citySeparator, self->_stateSeparator, self->_stateShadowButton, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = CFSTR("onePixel");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", HKUIOnePixel());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKOrganDonationAddressCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(20)-[_titleLabel(>=20)]-[_verticalSeparator(onePixel)]-(0)-[_addressContainerView]-(0)-|"), 0, v5, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addConstraints:", v7);

  -[HKOrganDonationAddressCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "hk_addConstraintsWithFormat:options:views:", CFSTR("H:|-(20)-[_horizontalSeparator]-(0)-|"), 0, v3);

  -[HKOrganDonationAddressCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "hk_addConstraintsWithFormat:options:views:", CFSTR("V:|-(10)-[_verticalSeparator]-(0)-|"), 0, v3);

  -[HKOrganDonationAddressCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "hk_addConstraintsWithFormat:options:views:", CFSTR("V:|-(10)-[_addressContainerView]-(0)-|"), 0, v3);

  -[HKOrganDonationAddressCell contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(>=10)-[_horizontalSeparator(onePixel)]-(0)-|"), 0, v5, v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addConstraints:", v15);

  -[HKOrganDonationAddressCell contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  titleLabel = self->_titleLabel;
  -[HKOrganDonationAddressCell contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v16, "hk_addEqualsConstraintWithItem:attribute:relatedTo:attribute:constant:", titleLabel, 10, v18, 10, 0.0);

  addressContainerView = self->_addressContainerView;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(10)-[_streetOneTextField]-(10)-[_addressSeparator(onePixel)]-(10)-[_streetTwoTextField(==_streetOneTextField)]-(10)-[_citySeparator(onePixel)]-(10)-[_cityTextField(==_streetOneTextField)]-(10)-[_stateSeparator(onePixel)]-(10)-[_stateTextField(==_streetOneTextField)]-(10)-|"), 0, v5, v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraints:](addressContainerView, "addConstraints:", v21);

  v22 = -[UIView hk_addConstraintsWithFormat:options:views:](self->_addressContainerView, "hk_addConstraintsWithFormat:options:views:", CFSTR("H:|-[_streetOneTextField]-|"), 0, v3);
  v23 = -[UIView hk_addConstraintsWithFormat:options:views:](self->_addressContainerView, "hk_addConstraintsWithFormat:options:views:", CFSTR("H:|-[_streetTwoTextField]-|"), 0, v3);
  v24 = -[UIView hk_addConstraintsWithFormat:options:views:](self->_addressContainerView, "hk_addConstraintsWithFormat:options:views:", CFSTR("H:|-[_cityTextField]-|"), 0, v3);
  v25 = -[UIView hk_addConstraintsWithFormat:options:views:](self->_addressContainerView, "hk_addConstraintsWithFormat:options:views:", CFSTR("H:|-(0)-[_addressSeparator]-(0)-|"), 0, v3);
  v26 = -[UIView hk_addConstraintsWithFormat:options:views:](self->_addressContainerView, "hk_addConstraintsWithFormat:options:views:", CFSTR("H:|-(0)-[_citySeparator]-(0)-|"), 0, v3);
  v27 = -[UIView hk_addConstraintsWithFormat:options:views:](self->_addressContainerView, "hk_addConstraintsWithFormat:options:views:", CFSTR("H:|-(0)-[_stateSeparator]-(0)-|"), 0, v3);
  v28 = -[UIView hk_addConstraintsWithFormat:options:views:](self->_addressContainerView, "hk_addConstraintsWithFormat:options:views:", CFSTR("V:[_stateSeparator]-(0)-[_stateZipSeparator]-(0)-|"), 0, v3);
  v29 = -[UIView hk_addEqualsConstraintWithItem:attribute:relatedTo:attribute:constant:](self->_addressContainerView, "hk_addEqualsConstraintWithItem:attribute:relatedTo:attribute:constant:", self->_stateTextField, 11, self->_zipCodeTextField, 11, 0.0);
  v30 = self->_addressContainerView;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[_stateTextField]-(10)-[_stateZipSeparator(onePixel)]-(10)-[_zipCodeTextField(==_stateTextField)]-|"), 0, v5, v3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraints:](v30, "addConstraints:", v31);

  v32 = -[UIView hk_addEqualsConstraintWithItem:attribute:relatedTo:attribute:constant:](self->_addressContainerView, "hk_addEqualsConstraintWithItem:attribute:relatedTo:attribute:constant:", self->_stateShadowButton, 8, self->_stateTextField, 8, 0.0);
  v33 = -[UIView hk_addEqualsConstraintWithItem:attribute:relatedTo:attribute:constant:](self->_addressContainerView, "hk_addEqualsConstraintWithItem:attribute:relatedTo:attribute:constant:", self->_stateShadowButton, 7, self->_stateTextField, 7, 0.0);
  v34 = -[UIView hk_addEqualsConstraintWithItem:attribute:relatedTo:attribute:constant:](self->_addressContainerView, "hk_addEqualsConstraintWithItem:attribute:relatedTo:attribute:constant:", self->_stateShadowButton, 9, self->_stateTextField, 9, 0.0);
  v35 = -[UIView hk_addEqualsConstraintWithItem:attribute:relatedTo:attribute:constant:](self->_addressContainerView, "hk_addEqualsConstraintWithItem:attribute:relatedTo:attribute:constant:", self->_stateShadowButton, 10, self->_stateTextField, 10, 0.0);
  LODWORD(v36) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_titleLabel, "setContentHuggingPriority:forAxis:", 0, v36);

}

- (void)_stateShadowButtonTapped:(id)a3
{
  -[UITextField becomeFirstResponder](self->_stateTextField, "becomeFirstResponder", a3);
}

- (void)beginEditing
{
  -[UITextField becomeFirstResponder](self->_streetOneTextField, "becomeFirstResponder");
}

- (BOOL)editDisabled
{
  return self->_editDisabled;
}

- (void)setEditDisabled:(BOOL)a3
{
  self->_editDisabled = a3;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return !self->_editDisabled;
}

- (void)textFieldDidChangeValue:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HKOrganDonationAddressCell delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textFieldDidChangeValue:forCell:", v4, self);

}

- (HKSimpleDataEntryCellDelegate)delegate
{
  return (HKSimpleDataEntryCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UITextField)streetOneTextField
{
  return self->_streetOneTextField;
}

- (void)setStreetOneTextField:(id)a3
{
  objc_storeStrong((id *)&self->_streetOneTextField, a3);
}

- (UITextField)streetTwoTextField
{
  return self->_streetTwoTextField;
}

- (void)setStreetTwoTextField:(id)a3
{
  objc_storeStrong((id *)&self->_streetTwoTextField, a3);
}

- (UITextField)stateTextField
{
  return self->_stateTextField;
}

- (void)setStateTextField:(id)a3
{
  objc_storeStrong((id *)&self->_stateTextField, a3);
}

- (UITextField)cityTextField
{
  return self->_cityTextField;
}

- (void)setCityTextField:(id)a3
{
  objc_storeStrong((id *)&self->_cityTextField, a3);
}

- (UITextField)zipCodeTextField
{
  return self->_zipCodeTextField;
}

- (void)setZipCodeTextField:(id)a3
{
  objc_storeStrong((id *)&self->_zipCodeTextField, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zipCodeTextField, 0);
  objc_storeStrong((id *)&self->_cityTextField, 0);
  objc_storeStrong((id *)&self->_stateTextField, 0);
  objc_storeStrong((id *)&self->_streetTwoTextField, 0);
  objc_storeStrong((id *)&self->_streetOneTextField, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stateShadowButton, 0);
  objc_storeStrong((id *)&self->_stateSeparator, 0);
  objc_storeStrong((id *)&self->_citySeparator, 0);
  objc_storeStrong((id *)&self->_addressSeparator, 0);
  objc_storeStrong((id *)&self->_stateZipSeparator, 0);
  objc_storeStrong((id *)&self->_horizontalSeparator, 0);
  objc_storeStrong((id *)&self->_verticalSeparator, 0);
  objc_storeStrong((id *)&self->_addressContainerView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
