@implementation ASCredentialRequestLoginChoiceCell

- (ASCredentialRequestLoginChoiceCell)initWithLoginChoice:(id)a3 presentationContext:(id)a4 authorizationProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  ASCredentialRequestLoginChoiceCell *v12;
  ASCredentialRequestLoginChoiceCell *v13;
  ASCredentialRequestLoginChoiceCell *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ASCredentialRequestLoginChoiceCell;
  v12 = -[ASCredentialRequestLoginChoiceCell initWithStyle:reuseIdentifier:](&v16, sel_initWithStyle_reuseIdentifier_, 3, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_loginChoice, a3);
    objc_storeStrong((id *)&v13->_presentationContext, a4);
    objc_storeStrong((id *)&v13->_authorizationProvider, a5);
    -[ASCredentialRequestLoginChoiceCell _setUpFormat](v13, "_setUpFormat");
    -[ASCredentialRequestLoginChoiceCell _setUpContent](v13, "_setUpContent");
    -[ASCredentialRequestLoginChoiceCell _setUpAccessoryImageView](v13, "_setUpAccessoryImageView");
    v14 = v13;
  }

  return v13;
}

- (void)_setUpFormat
{
  void *v3;
  void *v4;
  UILabel *v5;
  UILabel *titleLabel;
  void *v7;
  void *v8;
  uint64_t v9;
  UILabel *v10;
  UILabel *detailLabel;
  void *v12;
  void *v13;
  UIImageView *v14;
  UIImageView *iconImageView;
  void *v16;
  CGColor *v17;
  void *v18;
  void *v19;
  id v20;
  UILabel *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  UIStackView *v26;
  UIStackView *iconAndTextStackView;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
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
  _QWORD v64[2];
  void *v65;
  _QWORD v66[5];
  _QWORD v67[2];
  _QWORD v68[4];

  v68[2] = *MEMORY[0x24BDAC8D0];
  +[ASViewServiceInterfaceUtilities cellBackgroundConfiguration](ASViewServiceInterfaceUtilities, "cellBackgroundConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCredentialRequestLoginChoiceCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v3);

  -[ASCredentialRequestLoginChoiceCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  -[ASCredentialRequestLoginChoiceCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v5;

  +[ASViewServiceInterfaceUtilities cellTitleColor](ASViewServiceInterfaceUtilities, "cellTitleColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v7);

  +[ASViewServiceInterfaceUtilities cellTitleFont](ASViewServiceInterfaceUtilities, "cellTitleFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v8);

  -[UILabel setAdjustsFontSizeToFitWidth:](self->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
  v9 = *MEMORY[0x24BEBE070];
  -[UILabel setMaximumContentSizeCategory:](self->_titleLabel, "setMaximumContentSizeCategory:", *MEMORY[0x24BEBE070]);
  -[UILabel setMinimumScaleFactor:](self->_titleLabel, "setMinimumScaleFactor:", 0.7);
  v10 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  detailLabel = self->_detailLabel;
  self->_detailLabel = v10;

  +[ASViewServiceInterfaceUtilities cellSubtitleColor](ASViewServiceInterfaceUtilities, "cellSubtitleColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_detailLabel, "setTextColor:", v12);

  +[ASViewServiceInterfaceUtilities cellSubtitleFont](ASViewServiceInterfaceUtilities, "cellSubtitleFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_detailLabel, "setFont:", v13);

  -[UILabel setAdjustsFontSizeToFitWidth:](self->_detailLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_detailLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[UILabel setMaximumContentSizeCategory:](self->_detailLabel, "setMaximumContentSizeCategory:", v9);
  -[UILabel setMinimumScaleFactor:](self->_detailLabel, "setMinimumScaleFactor:", 0.7);
  v14 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
  iconImageView = self->_iconImageView;
  self->_iconImageView = v14;

  +[ASViewServiceInterfaceUtilities cellIconTintColor](ASViewServiceInterfaceUtilities, "cellIconTintColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_iconImageView, "setTintColor:", v16);

  -[UIImageView setClipsToBounds:](self->_iconImageView, "setClipsToBounds:", 1);
  +[ASViewServiceInterfaceUtilities cellIconCornerRadius](ASViewServiceInterfaceUtilities, "cellIconCornerRadius");
  -[UIImageView _setContinuousCornerRadius:](self->_iconImageView, "_setContinuousCornerRadius:");
  v17 = +[ASViewServiceInterfaceUtilities iconBorderColor](ASViewServiceInterfaceUtilities, "iconBorderColor");
  -[UIImageView layer](self->_iconImageView, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBorderColor:", v17);

  +[ASViewServiceInterfaceUtilities cellIconDefaultSymbolConfiguration](ASViewServiceInterfaceUtilities, "cellIconDefaultSymbolConfiguration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setPreferredSymbolConfiguration:](self->_iconImageView, "setPreferredSymbolConfiguration:", v19);

  v20 = objc_alloc(MEMORY[0x24BEBD978]);
  v21 = self->_detailLabel;
  v68[0] = self->_titleLabel;
  v68[1] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v68, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v20, "initWithArrangedSubviews:", v22);

  objc_msgSend(v23, "setAxis:", 1);
  objc_msgSend(v23, "setSpacing:", 0.0);
  v24 = objc_alloc(MEMORY[0x24BEBD978]);
  v67[0] = self->_iconImageView;
  v67[1] = v23;
  v62 = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v67, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (UIStackView *)objc_msgSend(v24, "initWithArrangedSubviews:", v25);
  iconAndTextStackView = self->_iconAndTextStackView;
  self->_iconAndTextStackView = v26;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_iconAndTextStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v63 = v4;
  objc_msgSend(v4, "addSubview:", self->_iconAndTextStackView);
  -[ASCredentialRequestLoginChoiceCell contentView](self, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "layoutMarginsGuide");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  +[ASViewServiceInterfaceUtilities cellIconSize](ASViewServiceInterfaceUtilities, "cellIconSize");
  v31 = v30;
  v33 = v32;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    +[ASViewServiceInterfaceUtilities otherAccountsCellIconSize](ASViewServiceInterfaceUtilities, "otherAccountsCellIconSize");
    v31 = v34;
    v33 = v35;
  }
  v55 = (void *)MEMORY[0x24BDD1628];
  -[UIStackView leadingAnchor](self->_iconAndTextStackView, "leadingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "leadingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:", v59);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v58;
  -[UIStackView trailingAnchor](self->_iconAndTextStackView, "trailingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v29;
  objc_msgSend(v29, "trailingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:", v56);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v36;
  -[UIImageView widthAnchor](self->_iconImageView, "widthAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToConstant:", v31);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v66[2] = v38;
  -[UIImageView heightAnchor](self->_iconImageView, "heightAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToConstant:", v33);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v66[3] = v40;
  -[ASCredentialRequestLoginChoiceCell contentView](self, "contentView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "heightAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASViewServiceInterfaceUtilities tableViewRowHeight](ASViewServiceInterfaceUtilities, "tableViewRowHeight");
  objc_msgSend(v42, "constraintGreaterThanOrEqualToConstant:");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v66[4] = v43;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v66, 5);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "activateConstraints:", v44);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v45 = (void *)MEMORY[0x24BDD1628];
    -[UIStackView centerYAnchor](self->_iconAndTextStackView, "centerYAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v61;
    objc_msgSend(v61, "centerYAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v49;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v65, 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "activateConstraints:", v50);
  }
  else
  {
    v51 = (void *)MEMORY[0x24BDD1628];
    -[UIStackView topAnchor](self->_iconAndTextStackView, "topAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v61;
    objc_msgSend(v61, "topAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v49;
    -[UIStackView bottomAnchor](self->_iconAndTextStackView, "bottomAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "bottomAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v64[1] = v53;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v64, 2);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "activateConstraints:", v54);

  }
  -[ASCredentialRequestLoginChoiceCell _updateLayoutForCurrentContentSizeCategory](self, "_updateLayoutForCurrentContentSizeCategory");

}

- (UIImage)iconImage
{
  return -[UIImageView image](self->_iconImageView, "image");
}

- (void)setIconImage:(id)a3
{
  -[UIImageView setImage:](self->_iconImageView, "setImage:", a3);
}

- (void)_configureImageViewForSymbolImage
{
  void *v3;
  double v4;
  double v5;
  id v6;

  -[UIImageView setContentMode:](self->_iconImageView, "setContentMode:", 4);
  +[ASViewServiceInterfaceUtilities cellIconBackgroundColor](ASViewServiceInterfaceUtilities, "cellIconBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setBackgroundColor:](self->_iconImageView, "setBackgroundColor:", v3);

  +[ASViewServiceInterfaceUtilities iconBorderWidth](ASViewServiceInterfaceUtilities, "iconBorderWidth");
  v5 = v4;
  -[UIImageView layer](self->_iconImageView, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBorderWidth:", v5);

}

- (void)_configureImageViewForAppIcon
{
  double v3;
  double v4;
  id v5;

  -[UIImageView setContentMode:](self->_iconImageView, "setContentMode:", 1);
  -[UIImageView setBackgroundColor:](self->_iconImageView, "setBackgroundColor:", 0);
  +[ASViewServiceInterfaceUtilities iconBorderWidth](ASViewServiceInterfaceUtilities, "iconBorderWidth");
  v4 = v3;
  -[UIImageView layer](self->_iconImageView, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBorderWidth:", v4);

}

- (BOOL)_shouldUseAppIconImageViewStyle
{
  if (!-[ASCLoginChoiceProtocol loginChoiceKind](self->_loginChoice, "loginChoiceKind"))
    return 1;
  if (-[ASCLoginChoiceProtocol loginChoiceKind](self->_loginChoice, "loginChoiceKind") == 1)
    return -[ASCLoginChoiceProtocol isExternal](self->_loginChoice, "isExternal");
  return 0;
}

- (void)_configureIconImageStyle
{
  if (-[ASCredentialRequestLoginChoiceCell _shouldUseAppIconImageViewStyle](self, "_shouldUseAppIconImageViewStyle"))
    -[ASCredentialRequestLoginChoiceCell _configureImageViewForAppIcon](self, "_configureImageViewForAppIcon");
  else
    -[ASCredentialRequestLoginChoiceCell _configureImageViewForSymbolImage](self, "_configureImageViewForSymbolImage");
}

- (void)_setUpContent
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  ASCLoginChoiceProtocol *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  ASCLoginChoiceProtocol *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
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
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  ASCLoginChoiceProtocol *v57;
  ASCLoginChoiceProtocol *v58;

  -[ASCredentialRequestLoginChoiceCell _configureIconImageStyle](self, "_configureIconImageStyle");
  switch(-[ASCLoginChoiceProtocol loginChoiceKind](self->_loginChoice, "loginChoiceKind"))
  {
    case 0:
      -[ASCLoginChoiceProtocol user](self->_loginChoice, "user");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCredentialRequestLoginChoiceCell setTitle:](self, "setTitle:", v3);

      -[AKASAuthorizationProvider loginRowData](self->_authorizationProvider, "loginRowData");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "loginRowDetailText");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCredentialRequestLoginChoiceCell setDetailText:](self, "setDetailText:", v5);

      -[AKASAuthorizationProvider loginRowData](self->_authorizationProvider, "loginRowData");
      v57 = (ASCLoginChoiceProtocol *)objc_claimAutoreleasedReturnValue();
      -[ASCLoginChoiceProtocol loginRowIconImage](v57, "loginRowIconImage");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 1:
      -[ASCLoginChoiceProtocol username](self->_loginChoice, "username");
      v58 = (ASCLoginChoiceProtocol *)objc_claimAutoreleasedReturnValue();
      if (-[ASCLoginChoiceProtocol length](v58, "length"))
      {
        v7 = v58;
      }
      else
      {
        _WBSLocalizedString();
        v32 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BEBD4B8], "tertiaryLabelColor");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v33);

        v7 = (ASCLoginChoiceProtocol *)v32;
      }
      v57 = v7;
      -[ASCredentialRequestLoginChoiceCell setTitle:](self, "setTitle:", v7);
      -[ASCredentialRequestLoginChoiceCell _detailTextForPasswordLoginChoice:](self, "_detailTextForPasswordLoginChoice:", self->_loginChoice);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCredentialRequestLoginChoiceCell setDetailText:](self, "setDetailText:", v34);

      +[ASCredentialRequestIconGenerator iconForPasswordLoginChoice:presentationContext:](ASCredentialRequestIconGenerator, "iconForPasswordLoginChoice:presentationContext:", self->_loginChoice, self->_presentationContext);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 2:
      v57 = self->_loginChoice;
      -[ASCLoginChoiceProtocol externalCredentialProviderBundleID](v57, "externalCredentialProviderBundleID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[ASCLoginChoiceProtocol externalCredentialProviderBundleID](v57, "externalCredentialProviderBundleID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[ASViewServiceInterfaceUtilities cellIconSize](ASViewServiceInterfaceUtilities, "cellIconSize");
        +[ASCredentialRequestIconGenerator iconForApplicationIdentifier:size:](ASCredentialRequestIconGenerator, "iconForApplicationIdentifier:size:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCredentialRequestLoginChoiceCell setIconImage:](self, "setIconImage:", v10);

      }
      else
      {
        +[ASCredentialRequestIconGenerator systemPasskeyIcon](ASCredentialRequestIconGenerator, "systemPasskeyIcon");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCredentialRequestLoginChoiceCell setIconImage:](self, "setIconImage:", v9);
      }

      if (-[ASCLoginChoiceProtocol isRegistrationRequest](v57, "isRegistrationRequest"))
      {
        if (-[ASCAuthorizationPresentationContext shouldUseFallbackPasskeyUI](self->_presentationContext, "shouldUseFallbackPasskeyUI"))
        {
          objc_msgSend(MEMORY[0x24BE0B290], "biometryType");
LABEL_24:
          _WBSLocalizedString();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[ASCredentialRequestLoginChoiceCell setTitle:](self, "setTitle:", v24);

          goto LABEL_13;
        }
        if (!v8)
          goto LABEL_24;
        -[ASCLoginChoiceProtocol externalCredentialProviderName](v57, "externalCredentialProviderName");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCredentialRequestLoginChoiceCell setTitle:](self, "setTitle:", v35);

        v29 = (void *)MEMORY[0x24BDD17C8];
        _WBSLocalizedString();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCLoginChoiceProtocol externalCredentialProviderName](v57, "externalCredentialProviderName");
        v31 = objc_claimAutoreleasedReturnValue();
        goto LABEL_32;
      }
      -[ASCLoginChoiceProtocol userVisibleName](v57, "userVisibleName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCLoginChoiceProtocol identifier](v57, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCredentialRequestLoginChoiceCell _titleForPublicKeyCredentialAssertionWithName:identifier:](self, "_titleForPublicKeyCredentialAssertionWithName:identifier:", v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCredentialRequestLoginChoiceCell setTitle:](self, "setTitle:", v27);

      v28 = -[ASCAuthorizationPresentationContext shouldUseFallbackPasskeyUI](self->_presentationContext, "shouldUseFallbackPasskeyUI");
      v29 = (void *)MEMORY[0x24BDD17C8];
      if ((v28 & 1) != 0)
      {
        _WBSLocalizedString();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCAuthorizationPresentationContext serviceName](self->_presentationContext, "serviceName");
        v31 = objc_claimAutoreleasedReturnValue();
LABEL_32:
        v36 = (void *)v31;
        objc_msgSend(v29, "stringWithFormat:", v30, v31);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCredentialRequestLoginChoiceCell setDetailText:](self, "setDetailText:", v37);

LABEL_53:
        goto LABEL_54;
      }
      _WBSLocalizedString();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCLoginChoiceProtocol relyingPartyIdentifier](v57, "relyingPartyIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v39;
      if (!v39)
      {
        -[ASCAuthorizationPresentationContext serviceName](self->_presentationContext, "serviceName");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v29, "localizedStringWithFormat:", v38, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCredentialRequestLoginChoiceCell setDetailText:](self, "setDetailText:", v41);

      if (!v39)
      if (-[ASCLoginChoiceProtocol isSharedCredential](v57, "isSharedCredential"))
      {
        v42 = (void *)MEMORY[0x24BDD17C8];
        _WBSLocalizedString();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCLoginChoiceProtocol relyingPartyIdentifier](v57, "relyingPartyIdentifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v44;
        if (!v44)
        {
          -[ASCAuthorizationPresentationContext serviceName](self->_presentationContext, "serviceName");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v42, "localizedStringWithFormat:", v43, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCredentialRequestLoginChoiceCell setDetailText:](self, "setDetailText:", v46);

        if (!v44)
      }
      -[ASCLoginChoiceProtocol customTitle](v57, "customTitle");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "length");

      if (v48)
      {
        v49 = (void *)MEMORY[0x24BDD17C8];
        -[ASCLoginChoiceProtocol customTitle](v57, "customTitle");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCLoginChoiceProtocol relyingPartyIdentifier](v57, "relyingPartyIdentifier");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v50;
        if (!v50)
        {
          -[ASCAuthorizationPresentationContext serviceName](self->_presentationContext, "serviceName");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v49, "stringWithFormat:", CFSTR("%@ — %@"), v30, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCredentialRequestLoginChoiceCell setDetailText:](self, "setDetailText:", v52);

        if (!v50)
        goto LABEL_53;
      }
LABEL_54:

      return;
    case 3:
      v57 = self->_loginChoice;
      v11 = -[ASCLoginChoiceProtocol credentialKind](v57, "credentialKind");
      if (v11)
        v12 = v11 == 2;
      else
        v12 = 1;
      if (v12)
      {
        +[ASCredentialRequestIconGenerator systemSecurityKeysIcon](ASCredentialRequestIconGenerator, "systemSecurityKeysIcon");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCredentialRequestLoginChoiceCell setIconImage:](self, "setIconImage:", v13);

        _WBSLocalizedString();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCredentialRequestLoginChoiceCell setTitle:](self, "setTitle:", v14);

LABEL_13:
        _WBSLocalizedString();
        v15 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v11 != 1)
          goto LABEL_54;
        -[ASCredentialRequestLoginChoiceCell _publicKeyCredentialImageForPresentationContext:](self, "_publicKeyCredentialImageForPresentationContext:", self->_presentationContext);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          -[ASCredentialRequestLoginChoiceCell setIconImage:](self, "setIconImage:", v23);
        }
        else
        {
          +[ASCredentialRequestIconGenerator systemSecurityKeysIcon](ASCredentialRequestIconGenerator, "systemSecurityKeysIcon");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[ASCredentialRequestLoginChoiceCell setIconImage:](self, "setIconImage:", v53);

        }
        -[ASCLoginChoiceProtocol name](v57, "name");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCLoginChoiceProtocol identifier](v57, "identifier");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCredentialRequestLoginChoiceCell _titleForPublicKeyCredentialAssertionWithName:identifier:](self, "_titleForPublicKeyCredentialAssertionWithName:identifier:", v54, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCredentialRequestLoginChoiceCell setTitle:](self, "setTitle:", v56);

        -[ASCredentialRequestLoginChoiceCell _subtitleForPublicKeyCredentialAssertion](self, "_subtitleForPublicKeyCredentialAssertion");
        v15 = objc_claimAutoreleasedReturnValue();
      }
      v30 = (void *)v15;
      -[ASCredentialRequestLoginChoiceCell setDetailText:](self, "setDetailText:", v15);
      goto LABEL_53;
    case 4:
      _WBSLocalizedString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCredentialRequestLoginChoiceCell setTitle:](self, "setTitle:", v16);

      -[ASCredentialRequestLoginChoiceCell _cableIcon](self, "_cableIcon");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCredentialRequestLoginChoiceCell setIconImage:](self, "setIconImage:", v17);

      -[ASCAuthorizationPresentationContext shouldUseFallbackPasskeyUI](self->_presentationContext, "shouldUseFallbackPasskeyUI");
      -[ASCAuthorizationPresentationContext isRegistrationRequest](self->_presentationContext, "isRegistrationRequest");
      _WBSLocalizedString();
      v57 = (ASCLoginChoiceProtocol *)objc_claimAutoreleasedReturnValue();
      -[ASCredentialRequestLoginChoiceCell setDetailText:](self, "setDetailText:", v57);
      goto LABEL_54;
    case 5:
      _WBSLocalizedString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCredentialRequestLoginChoiceCell setTitle:](self, "setTitle:", v18);

      +[ASViewServiceInterfaceUtilities otherAccountsCellIconSize](ASViewServiceInterfaceUtilities, "otherAccountsCellIconSize");
      +[ASCredentialRequestIconGenerator passwordManagerIconWithSize:](ASCredentialRequestIconGenerator, "passwordManagerIconWithSize:");
      v57 = (ASCLoginChoiceProtocol *)objc_claimAutoreleasedReturnValue();
      -[ASCredentialRequestLoginChoiceCell setIconImage:](self, "setIconImage:", v57);
      goto LABEL_54;
    case 6:
      v19 = (void *)MEMORY[0x24BDD17C8];
      v20 = self->_loginChoice;
      -[ASCLoginChoiceProtocol providerName](v20, "providerName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@…"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCredentialRequestLoginChoiceCell setTitle:](self, "setTitle:", v22);

      -[ASCLoginChoiceProtocol providerExtensionContainingAppBundleID](v20, "providerExtensionContainingAppBundleID");
      v57 = (ASCLoginChoiceProtocol *)objc_claimAutoreleasedReturnValue();

      +[ASViewServiceInterfaceUtilities otherAccountsCellIconSize](ASViewServiceInterfaceUtilities, "otherAccountsCellIconSize");
      +[ASCredentialRequestIconGenerator iconForApplicationIdentifier:size:](ASCredentialRequestIconGenerator, "iconForApplicationIdentifier:size:", v57);
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_29:
      v30 = (void *)v6;
      -[ASCredentialRequestLoginChoiceCell setIconImage:](self, "setIconImage:", v6);
      goto LABEL_53;
    default:
      return;
  }
}

- (id)_publicKeyCredentialImageForPresentationContext:(id)a3
{
  return +[ASCredentialRequestIconGenerator iconForPublicKeyCredentialLoginChoiceWithPresentationContext:](ASCredentialRequestIconGenerator, "iconForPublicKeyCredentialLoginChoiceWithPresentationContext:", a3);
}

- (id)_titleForPublicKeyCredentialAssertionWithName:(id)a3 identifier:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v6, "credentialID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");
    if (v9 >= 6)
      v10 = 6;
    else
      v10 = v9;
    v11 = (void *)MEMORY[0x24BDD17C8];
    _WBSLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "substringWithRange:", 0, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v12, v13);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)_subtitleForPublicKeyCredentialAssertion
{
  -[ASCAuthorizationPresentationContext appIdentifier](self->_presentationContext, "appIdentifier");

  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (NSString)detailText
{
  return -[UILabel text](self->_detailLabel, "text");
}

- (void)setDetailText:(id)a3
{
  -[UILabel setText:](self->_detailLabel, "setText:", a3);
}

- (void)setIsSelectedLoginChoice:(BOOL)a3
{
  if (self->_isSelectedLoginChoice != a3)
  {
    self->_isSelectedLoginChoice = a3;
    -[ASCredentialRequestLoginChoiceCell _updateAccessoryImageView](self, "_updateAccessoryImageView");
  }
}

- (id)_detailTextForPasswordLoginChoice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[ASCLoginChoiceProtocol site](self->_loginChoice, "site");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[ASCAuthorizationPresentationContext hasExternalPasswords](self->_presentationContext, "hasExternalPasswords") & 1) != 0)
  {
    if ((objc_msgSend(v4, "isExternal") & 1) != 0)
      -[ASCredentialRequestLoginChoiceCell _detailTextForExternalPasswordLoginChoice:](self, "_detailTextForExternalPasswordLoginChoice:", v4);
    else
      -[ASCredentialRequestLoginChoiceCell _detailTextForPasswordLoginChoiceFromKeychain:](self, "_detailTextForPasswordLoginChoiceFromKeychain:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "customTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      v8 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v4, "customTitle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ — %@"), v9, v5);
    }
    else
    {
      objc_msgSend(v4, "groupName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "length");

      v12 = (void *)MEMORY[0x24BDD17C8];
      _WBSLocalizedString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringWithFormat:", v9, v5);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)_detailTextForPasswordLoginChoiceFromKeychain:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a3, "site");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ — %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_detailTextForExternalPasswordLoginChoice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v14;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDC1558];
  objc_msgSend(v3, "providerBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v4, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v5, 0, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;

  if (v6)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v3, "site");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ — %@"), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ASCredentialRequestLoginChoiceCell _detailTextForExternalPasswordLoginChoice:].cold.1(v12, v7);
    v11 = 0;
  }

  return v11;
}

- (id)_cableIcon
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("qrcode.viewfinder"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithAlignmentRectInsets:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_defaultPasskeyIcon
{
  return +[ASCredentialRequestIconGenerator passwordManagerIcon](ASCredentialRequestIconGenerator, "passwordManagerIcon");
}

- (void)_setUpAccessoryImageView
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc(MEMORY[0x24BEBD668]);
  -[ASCredentialRequestLoginChoiceCell _emptyRadioButtonImage](self, "_emptyRadioButtonImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "initWithImage:", v4);

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 20.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreferredSymbolConfiguration:", v5);

  objc_msgSend(v6, "sizeToFit");
  -[ASCredentialRequestLoginChoiceCell setAccessoryView:](self, "setAccessoryView:", v6);

}

- (void)_updateAccessoryImageView
{
  void *v3;
  id v4;

  -[ASCredentialRequestLoginChoiceCell accessoryView](self, "accessoryView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_isSelectedLoginChoice)
    -[ASCredentialRequestLoginChoiceCell _selectedRadioButtonImage](self, "_selectedRadioButtonImage");
  else
    -[ASCredentialRequestLoginChoiceCell _emptyRadioButtonImage](self, "_emptyRadioButtonImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v3);

}

- (id)_emptyRadioButtonImage
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("circle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemFillColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithTintColor:renderingMode:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_selectedRadioButtonImage
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithTintColor:renderingMode:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ASCredentialRequestLoginChoiceCell;
  v4 = a3;
  -[ASCredentialRequestLoginChoiceCell traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[ASCredentialRequestLoginChoiceCell traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqualToString:", v7);
  if ((v4 & 1) == 0)
    -[ASCredentialRequestLoginChoiceCell _updateLayoutForCurrentContentSizeCategory](self, "_updateLayoutForCurrentContentSizeCategory");
}

- (void)_updateLayoutForCurrentContentSizeCategory
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;

  -[ASCredentialRequestLoginChoiceCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory)
    v6 = 0;
  else
    v6 = 3;
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", v6);
  -[UILabel setNumberOfLines:](self->_detailLabel, "setNumberOfLines:", v6);
  if (-[ASCLoginChoiceProtocol loginChoiceKind](self->_loginChoice, "loginChoiceKind") == 6)
    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 1);
  -[UIStackView setAxis:](self->_iconAndTextStackView, "setAxis:", IsAccessibilityCategory);
  if (IsAccessibilityCategory)
    v7 = 1;
  else
    v7 = 3;
  -[UIStackView setAlignment:](self->_iconAndTextStackView, "setAlignment:", v7);
  if (IsAccessibilityCategory)
  {
    -[UIStackView setSpacing:](self->_iconAndTextStackView, "setSpacing:", 1.17549435e-38);
    v8 = 0.0;
  }
  else
  {
    +[ASViewServiceInterfaceUtilities cellIconMarginTrailing](ASViewServiceInterfaceUtilities, "cellIconMarginTrailing");
    -[UIStackView setSpacing:](self->_iconAndTextStackView, "setSpacing:");
    -[ASCredentialRequestLoginChoiceCell _additionalLeadingSeparatorInset](self, "_additionalLeadingSeparatorInset");
    v8 = v9;
  }
  -[ASCredentialRequestLoginChoiceCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v8, 0.0, 0.0);
}

- (double)_additionalLeadingSeparatorInset
{
  double v2;
  double v3;
  double v4;

  +[ASViewServiceInterfaceUtilities cellIconMarginTrailing](ASViewServiceInterfaceUtilities, "cellIconMarginTrailing");
  v3 = v2;
  +[ASViewServiceInterfaceUtilities cellIconSize](ASViewServiceInterfaceUtilities, "cellIconSize");
  return v3 + v4;
}

- (BOOL)isSelectedLoginChoice
{
  return self->_isSelectedLoginChoice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconAndTextStackView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_authorizationProvider, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_loginChoice, 0);
}

- (void)_detailTextForExternalPasswordLoginChoice:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_20E4D9000, v3, OS_LOG_TYPE_ERROR, "Could not get bundle record to fetch password manager name error: %{public}@.", (uint8_t *)&v5, 0xCu);

}

@end
