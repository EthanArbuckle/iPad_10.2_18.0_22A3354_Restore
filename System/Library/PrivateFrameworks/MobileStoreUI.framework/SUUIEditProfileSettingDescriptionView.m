@implementation SUUIEditProfileSettingDescriptionView

+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = *MEMORY[0x24BDBF148];
  v5 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  objc_msgSend(a1, "_baselineFontForTextStyle:", *MEMORY[0x24BEBE1D0], a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_scaledValueForValue:", 48.0);
  v8 = v7 + v7;

  v9 = a3;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  SUUIEditProfileSettingDescription **p_settingDescription;
  id v9;
  SUUIClientContext *v10;
  SUUIClientContext *clientContext;
  SUUIImageView *imageView;
  SUUIImageView *v13;
  SUUIImageView *v14;
  void *v15;
  UIButton *v16;
  UIButton *editButton;
  SUUIClientContext *v18;
  void *v19;
  void *v20;
  void *v21;
  UITextField *nameField;
  SUUIClientContext *v23;
  void *v24;
  UITextField *v25;
  UITextField *v26;
  void *v27;
  UITextField *handleField;
  SUUIClientContext *v29;
  void *v30;
  UITextField *v31;
  UITextField *v32;
  void *v33;
  CALayer *v34;
  CALayer *divider1;
  CALayer *v36;
  id v37;
  void *v38;
  uint64_t v39;
  id v40;

  v40 = a3;
  p_settingDescription = &self->_settingDescription;
  objc_storeStrong((id *)&self->_settingDescription, a3);
  v9 = a5;
  objc_msgSend(v9, "clientContext");
  v10 = (SUUIClientContext *)objc_claimAutoreleasedReturnValue();

  clientContext = self->_clientContext;
  self->_clientContext = v10;

  imageView = self->_imageView;
  if (!imageView)
  {
    v13 = objc_alloc_init(SUUIImageView);
    v14 = self->_imageView;
    self->_imageView = v13;

    -[SUUIEditProfileSettingDescriptionView addSubview:](self, "addSubview:", self->_imageView);
    imageView = self->_imageView;
  }
  -[SUUIEditProfileSettingDescription photo](*p_settingDescription, "photo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIImageView setImage:](imageView, "setImage:", v15);

  if (!self->_editButton)
  {
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v16 = (UIButton *)objc_claimAutoreleasedReturnValue();
    editButton = self->_editButton;
    self->_editButton = v16;

    v18 = self->_clientContext;
    if (v18)
      -[SUUIClientContext localizedStringForKey:inTable:](v18, "localizedStringForKey:inTable:", CFSTR("SETTINGS_PROFILE_EDIT_BUTTON_LABEL"), CFSTR("Settings"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("SETTINGS_PROFILE_EDIT_BUTTON_LABEL"), 0, CFSTR("Settings"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](self->_editButton, "setTitle:forState:", v19, 0);
    -[UIButton addTarget:action:forControlEvents:](self->_editButton, "addTarget:action:forControlEvents:", self, sel__editProfilePhoto, 64);
    -[UIButton titleLabel](self->_editButton, "titleLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFont:", v21);

    -[SUUIEditProfileSettingDescriptionView addSubview:](self, "addSubview:", self->_editButton);
  }
  nameField = self->_nameField;
  if (!nameField)
  {
    v23 = self->_clientContext;
    if (v23)
      -[SUUIClientContext localizedStringForKey:inTable:](v23, "localizedStringForKey:inTable:", CFSTR("SETTINGS_PROFILE_EDIT_NAME"), CFSTR("Settings"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("SETTINGS_PROFILE_EDIT_NAME"), 0, CFSTR("Settings"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIEditProfileSettingDescriptionView _textFieldWithPlaceholder:](self, "_textFieldWithPlaceholder:", v24);
    v25 = (UITextField *)objc_claimAutoreleasedReturnValue();
    v26 = self->_nameField;
    self->_nameField = v25;

    -[UITextField setAutocapitalizationType:](self->_nameField, "setAutocapitalizationType:", 1);
    -[UITextField setAutocorrectionType:](self->_nameField, "setAutocorrectionType:", 1);
    -[SUUIEditProfileSettingDescriptionView addSubview:](self, "addSubview:", self->_nameField);
    nameField = self->_nameField;
  }
  -[SUUIEditProfileSettingDescription name](*p_settingDescription, "name");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](nameField, "setText:", v27);

  handleField = self->_handleField;
  if (!handleField)
  {
    v29 = self->_clientContext;
    if (v29)
      -[SUUIClientContext localizedStringForKey:inTable:](v29, "localizedStringForKey:inTable:", CFSTR("SETTINGS_PROFILE_EDIT_HANDLE"), CFSTR("Settings"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("SETTINGS_PROFILE_EDIT_HANDLE"), 0, CFSTR("Settings"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIEditProfileSettingDescriptionView _textFieldWithPlaceholder:](self, "_textFieldWithPlaceholder:", v30);
    v31 = (UITextField *)objc_claimAutoreleasedReturnValue();
    v32 = self->_handleField;
    self->_handleField = v31;

    -[UITextField setAutocapitalizationType:](self->_handleField, "setAutocapitalizationType:", 0);
    -[UITextField setAutocorrectionType:](self->_handleField, "setAutocorrectionType:", 1);
    -[UITextField _setPrefix:](self->_handleField, "_setPrefix:", CFSTR("@"));
    -[SUUIEditProfileSettingDescriptionView addSubview:](self, "addSubview:", self->_handleField);
    handleField = self->_handleField;
  }
  -[SUUIEditProfileSettingDescription handle](*p_settingDescription, "handle");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](handleField, "setText:", v33);

  if (!self->_divider1)
  {
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v34 = (CALayer *)objc_claimAutoreleasedReturnValue();
    divider1 = self->_divider1;
    self->_divider1 = v34;

    v36 = self->_divider1;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
    v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](v36, "setBackgroundColor:", objc_msgSend(v37, "CGColor"));

    -[SUUIEditProfileSettingDescriptionView layer](self, "layer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addSublayer:", self->_divider1);

  }
  v39 = -[SUUIEditProfileSettingDescription isEditing](*p_settingDescription, "isEditing");
  -[UIButton setHidden:](self->_editButton, "setHidden:", v39 ^ 1);
  -[UITextField setEnabled:](self->_nameField, "setEnabled:", v39);
  -[UITextField setEnabled:](self->_handleField, "setEnabled:", v39);

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  if (objc_msgSend(a3, "isEqual:", self->_handleField))
    -[SUUIEditProfileSettingDescriptionView _updateHandleTextFieldValidity](self, "_updateHandleTextFieldValidity");
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  int v4;
  UITextField *handleField;

  v4 = objc_msgSend(a3, "isEqual:", self->_nameField);
  handleField = self->_handleField;
  if (v4)
    -[UITextField becomeFirstResponder](handleField, "becomeFirstResponder");
  else
    -[UITextField resignFirstResponder](handleField, "resignFirstResponder");
  return 0;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByReplacingCharactersInRange:withString:", location, length, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isEqual:", self->_nameField))
  {
    -[SUUIEditProfileSettingDescription setName:](self->_settingDescription, "setName:", v12);
  }
  else if (objc_msgSend(v9, "isEqual:", self->_handleField))
  {
    -[SUUIEditProfileSettingDescriptionView _updateHandleTextFieldValidity](self, "_updateHandleTextFieldValidity");
  }

  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  SUUIEditProfileSettingDescription *settingDescription;
  void *v5;
  SUUIEditProfileSettingDescription *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "isEqual:", self->_nameField))
  {
    settingDescription = self->_settingDescription;
    objc_msgSend(v7, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIEditProfileSettingDescription setName:](settingDescription, "setName:", v5);
LABEL_5:

    goto LABEL_6;
  }
  if (objc_msgSend(v7, "isEqual:", self->_handleField))
  {
    v6 = self->_settingDescription;
    objc_msgSend(v7, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIEditProfileSettingDescription setHandle:](v6, "setHandle:", v5);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  int ShouldReverseLayoutDirection;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  CGFloat v35;
  double v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  void *v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  CGFloat v50;
  objc_super v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v51.receiver = self;
  v51.super_class = (Class)SUUIEditProfileSettingDescriptionView;
  -[SUUIEditProfileSettingDescriptionView layoutSubviews](&v51, sel_layoutSubviews);
  -[SUUISettingDescriptionView layoutMargins](self, "layoutMargins");
  v4 = v3;
  v48 = v5;
  -[SUUIEditProfileSettingDescriptionView bounds](self, "bounds");
  v7 = v6;
  v46 = v8;
  v47 = v6;
  v10 = v9;
  v50 = v11;
  ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  -[UIButton titleLabel](self->_editButton, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v14);
  objc_msgSend(v14, "_scaledValueForValue:", 16.0);
  v16 = v15;
  -[UIButton sizeThatFits:](self->_editButton, "sizeThatFits:", 1.0, 1.0);
  v18 = v17;
  v20 = v19;
  v52.origin.y = 8.0;
  v52.origin.x = v4;
  v52.size.width = 56.0;
  v52.size.height = 56.0;
  v21 = v16 + CGRectGetMaxY(v52);
  objc_msgSend(v13, "_firstBaselineOffsetFromTop");
  v23 = v21 - v22;
  v53.origin.y = 8.0;
  v53.origin.x = v4;
  v53.size.width = 56.0;
  v53.size.height = 56.0;
  v24 = floor((CGRectGetWidth(v53) - v18) * 0.5);
  v54.origin.y = 8.0;
  v54.origin.x = v4;
  v54.size.width = 56.0;
  v54.size.height = 56.0;
  v25 = CGRectGetMinX(v54) + v24;
  v26 = v10;
  -[UIButton setFrame:](self->_editButton, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v25, v23, v18, v20, v7, v10, v50, v46));
  v27 = *MEMORY[0x24BEBE1D0];
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setFont:](self->_nameField, "setFont:", v28);
  -[UITextField setFont:](self->_handleField, "setFont:", v28);
  if (ShouldReverseLayoutDirection)
    v29 = 2;
  else
    v29 = 0;
  -[UITextField setTextAlignment:](self->_nameField, "setTextAlignment:", v29);
  -[UITextField setTextAlignment:](self->_handleField, "setTextAlignment:", v29);
  objc_msgSend((id)objc_opt_class(), "_baselineFontForTextStyle:", v27);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "_scaledValueForValue:", 30.0);
  v32 = v31;
  objc_msgSend(v30, "_scaledValueForValue:", 18.0);
  v45 = v32 + v33;
  -[UITextField _placeholderLabel](self->_nameField, "_placeholderLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v55.origin.y = 8.0;
  v55.origin.x = v4;
  v55.size.width = 56.0;
  v55.size.height = 56.0;
  v35 = CGRectGetMaxX(v55) + 16.0;
  objc_msgSend(v34, "_firstBaselineOffsetFromTop");
  v37 = v32 - v36;
  v44 = v32 - v36;
  v56.origin.x = v47;
  v56.origin.y = v10;
  v56.size.width = v50;
  v56.size.height = v46;
  v38 = CGRectGetWidth(v56) - v35 - v48;
  v57.origin.x = v47;
  v57.origin.y = v10;
  v57.size.width = v50;
  v57.size.height = v46;
  v43 = CGRectGetWidth(v57) - v35;
  -[UITextField sizeThatFits:](self->_nameField, "sizeThatFits:", v38, 1.0);
  v49 = v39;
  -[UITextField setFrame:](self->_nameField, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v35, v37 + 0.0, v38, v39, v47, v10, v50, v46));
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "scale");
  v42 = 1.0 / v41;

  -[CALayer setFrame:](self->_divider1, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v35, v45 + 0.0, v43, v42, v47, v26, v50, v46));
  -[UITextField setFrame:](self->_handleField, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v35, v45 + 0.0 + v44, v38, v49, v47, v26, v50, v46));
  -[SUUIImageView setFrame:](self->_imageView, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v4, 8.0, 56.0, 56.0, v47, v26, v50, v46));

}

+ (id)_baselineFontForTextStyle:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a3, 0, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_updateHandleTextFieldValidity
{
  SUUIEditProfileSettingDescription *settingDescription;
  void *v4;
  _BOOL4 v5;
  UITextField *handleField;
  id v7;

  settingDescription = self->_settingDescription;
  -[UITextField text](self->_handleField, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIEditProfileSettingDescription setHandle:](settingDescription, "setHandle:", v4);

  v5 = -[SUUIEditProfileSettingDescription isHandleValid](self->_settingDescription, "isHandleValid");
  handleField = self->_handleField;
  if (v5)
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextField setTextColor:](handleField, "setTextColor:", v7);

}

- (void)_editProfilePhoto
{
  -[SUUIEditProfileSettingDescription chooseNewProfilePhoto](self->_settingDescription, "chooseNewProfilePhoto");
}

- (id)_textFieldWithPlaceholder:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (objc_class *)MEMORY[0x24BEBDA48];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v8);
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v9);

  v10 = objc_alloc(MEMORY[0x24BDBCE70]);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithObjectsAndKeys:", v11, *MEMORY[0x24BEBB368], 0);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v5, v12);
  objc_msgSend(v7, "setAttributedPlaceholder:", v13);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingDescription, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_handleField, 0);
  objc_storeStrong((id *)&self->_nameField, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_divider1, 0);
}

@end
