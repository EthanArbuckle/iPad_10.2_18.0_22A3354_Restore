@implementation CPSAppMetadataView

- (CPSAppMetadataView)initWithFrame:(CGRect)a3
{
  CPSAppMetadataView *v3;
  CPSAppMetadataView *v4;
  CPSAppMetadataView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPSAppMetadataView;
  v3 = -[CPSAppMetadataView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CPSAppMetadataView _setUpSubviews](v3, "_setUpSubviews");
    -[CPSAppMetadataView updateWithMetadata:](v4, "updateWithMetadata:", 0);
    v5 = v4;
  }

  return v4;
}

- (CPSAppMetadataView)initWithCoder:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("-initWithCoder: is not supported."), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0CEBDE0];
  v3 = *MEMORY[0x1E0CEBDE0];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_setUpSubviews
{
  void *v3;
  void *v4;
  UIImageView *v5;
  UIImageView *appIconView;
  double v7;
  CPSVibrantLabel *v8;
  CPSVibrantLabel *v9;
  CPSVibrantLabel *poweredByVibrantLabel;
  void *v11;
  CPSVibrantLabel *v12;
  CPSVibrantLabel *v13;
  CPSVibrantLabel *appNameVibrantLabel;
  CPSContentRatingContainerView *v15;
  CPSContentRatingContainerView *contentRatingContainerView;
  CPSAppStoreButton *v17;
  CPSAppStoreButton *appStoreButton;
  double v19;
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
  NSArray *v37;
  NSArray *leadingAppStoreButtonConstraints;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSArray *v48;
  NSArray *trailingAppStoreButtonConstraints;
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
  _QWORD v88[5];
  _QWORD v89[4];
  _QWORD v90[14];

  v90[12] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CEA658];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemFillColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cps_viewWithBackgroundColor:cornerRadius:", v4, 5.0);
  v5 = (UIImageView *)objc_claimAutoreleasedReturnValue();
  appIconView = self->_appIconView;
  self->_appIconView = v5;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_appIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setAccessibilityIgnoresInvertColors:](self->_appIconView, "setAccessibilityIgnoresInvertColors:", 1);
  LODWORD(v7) = 1144766464;
  -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_appIconView, "setContentCompressionResistancePriority:forAxis:", 0, v7);
  -[CPSAppMetadataView addSubview:](self, "addSubview:", self->_appIconView);
  v8 = [CPSVibrantLabel alloc];
  v9 = -[CPSVibrantLabel initWithTextStyle:textVariant:vibrancyEffectStyle:](v8, "initWithTextStyle:textVariant:vibrancyEffectStyle:", *MEMORY[0x1E0CEB550], 256, 1);
  poweredByVibrantLabel = self->_poweredByVibrantLabel;
  self->_poweredByVibrantLabel = v9;

  -[CPSVibrantLabel setTranslatesAutoresizingMaskIntoConstraints:](self->_poweredByVibrantLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  _CPSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSVibrantLabel setText:](self->_poweredByVibrantLabel, "setText:", v11);

  -[CPSVibrantLabel setAlpha:](self->_poweredByVibrantLabel, "setAlpha:", 0.0);
  -[CPSAppMetadataView addSubview:](self, "addSubview:", self->_poweredByVibrantLabel);
  v12 = [CPSVibrantLabel alloc];
  v13 = -[CPSVibrantLabel initWithTextStyle:textVariant:vibrancyEffectStyle:](v12, "initWithTextStyle:textVariant:vibrancyEffectStyle:", *MEMORY[0x1E0CEB558], 1280, 0);
  appNameVibrantLabel = self->_appNameVibrantLabel;
  self->_appNameVibrantLabel = v13;

  -[CPSVibrantLabel setTranslatesAutoresizingMaskIntoConstraints:](self->_appNameVibrantLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CPSVibrantLabel setText:](self->_appNameVibrantLabel, "setText:", *MEMORY[0x1E0D107C0]);
  -[CPSAppMetadataView addSubview:](self, "addSubview:", self->_appNameVibrantLabel);
  v15 = objc_alloc_init(CPSContentRatingContainerView);
  contentRatingContainerView = self->_contentRatingContainerView;
  self->_contentRatingContainerView = v15;

  -[CPSContentRatingContainerView setUserInteractionEnabled:](self->_contentRatingContainerView, "setUserInteractionEnabled:", 0);
  -[CPSContentRatingContainerView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentRatingContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CPSAppMetadataView addSubview:](self, "addSubview:", self->_contentRatingContainerView);
  v17 = objc_alloc_init(CPSAppStoreButton);
  appStoreButton = self->_appStoreButton;
  self->_appStoreButton = v17;

  -[CPSAppStoreButton setTranslatesAutoresizingMaskIntoConstraints:](self->_appStoreButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v19) = 1144766464;
  -[CPSAppStoreButton setContentCompressionResistancePriority:forAxis:](self->_appStoreButton, "setContentCompressionResistancePriority:forAxis:", 0, v19);
  -[CPSAppStoreButton setUserInteractionEnabled:](self->_appStoreButton, "setUserInteractionEnabled:", 0);
  -[CPSAppStoreButton setHidden:](self->_appStoreButton, "setHidden:", 1);
  -[CPSAppMetadataView addSubview:](self, "addSubview:", self->_appStoreButton);
  v63 = (void *)MEMORY[0x1E0CB3718];
  -[UIImageView centerYAnchor](self->_appIconView, "centerYAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSAppMetadataView centerYAnchor](self, "centerYAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintEqualToAnchor:", v81);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v90[0] = v78;
  -[UIImageView leadingAnchor](self->_appIconView, "leadingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSAppMetadataView leadingAnchor](self, "leadingAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToAnchor:", v73);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v90[1] = v72;
  -[UIImageView heightAnchor](self->_appIconView, "heightAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToConstant:", 28.0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v90[2] = v70;
  -[UIImageView widthAnchor](self->_appIconView, "widthAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView heightAnchor](self->_appIconView, "heightAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v68);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v90[3] = v67;
  -[CPSVibrantLabel topAnchor](self->_poweredByVibrantLabel, "topAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSAppMetadataView topAnchor](self, "topAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:", v65);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v90[4] = v64;
  -[CPSVibrantLabel leadingAnchor](self->_poweredByVibrantLabel, "leadingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView trailingAnchor](self->_appIconView, "trailingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:constant:", v61, 8.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v90[5] = v60;
  -[CPSVibrantLabel bottomAnchor](self->_poweredByVibrantLabel, "bottomAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSVibrantLabel topAnchor](self->_appNameVibrantLabel, "topAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:constant:", v58, -1.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v90[6] = v57;
  -[CPSVibrantLabel trailingAnchor](self->_poweredByVibrantLabel, "trailingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSAppMetadataView trailingAnchor](self, "trailingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintLessThanOrEqualToAnchor:", v55);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v90[7] = v54;
  -[CPSVibrantLabel leadingAnchor](self->_appNameVibrantLabel, "leadingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSVibrantLabel leadingAnchor](self->_poweredByVibrantLabel, "leadingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v52);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v90[8] = v51;
  -[CPSContentRatingContainerView leadingAnchor](self->_contentRatingContainerView, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSVibrantLabel trailingAnchor](self->_appNameVibrantLabel, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:constant:", v20, 4.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v90[9] = v21;
  -[CPSContentRatingContainerView bottomAnchor](self->_contentRatingContainerView, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSVibrantLabel firstBaselineAnchor](self->_appNameVibrantLabel, "firstBaselineAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, 1.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v90[10] = v24;
  -[CPSContentRatingContainerView trailingAnchor](self->_contentRatingContainerView, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSAppMetadataView trailingAnchor](self, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintLessThanOrEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v90[11] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 12);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "activateConstraints:", v28);

  -[CPSAppStoreButton leadingAnchor](self->_appStoreButton, "leadingAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSVibrantLabel leadingAnchor](self->_poweredByVibrantLabel, "leadingAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:constant:", v82, -2.0);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v89[0] = v79;
  -[CPSAppStoreButton topAnchor](self->_appStoreButton, "topAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSVibrantLabel bottomAnchor](self->_appNameVibrantLabel, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:constant:", v29, 1.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v89[1] = v30;
  -[CPSAppStoreButton trailingAnchor](self->_appStoreButton, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSAppMetadataView trailingAnchor](self, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintLessThanOrEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v89[2] = v33;
  -[CPSAppStoreButton bottomAnchor](self->_appStoreButton, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSAppMetadataView bottomAnchor](self, "bottomAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v89[3] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 4);
  v37 = (NSArray *)objc_claimAutoreleasedReturnValue();
  leadingAppStoreButtonConstraints = self->_leadingAppStoreButtonConstraints;
  self->_leadingAppStoreButtonConstraints = v37;

  -[CPSAppStoreButton leadingAnchor](self->_appStoreButton, "leadingAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSContentRatingContainerView trailingAnchor](self->_contentRatingContainerView, "trailingAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v83, 1.0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = v80;
  -[CPSAppStoreButton leadingAnchor](self->_appStoreButton, "leadingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSVibrantLabel trailingAnchor](self->_poweredByVibrantLabel, "trailingAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v87, 1.0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v88[1] = v74;
  -[CPSAppStoreButton trailingAnchor](self->_appStoreButton, "trailingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSAppMetadataView trailingAnchor](self, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v88[2] = v41;
  -[CPSAppStoreButton centerYAnchor](self->_appStoreButton, "centerYAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSAppMetadataView centerYAnchor](self, "centerYAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v88[3] = v44;
  -[CPSVibrantLabel bottomAnchor](self->_appNameVibrantLabel, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSAppMetadataView bottomAnchor](self, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v88[4] = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 5);
  v48 = (NSArray *)objc_claimAutoreleasedReturnValue();
  trailingAppStoreButtonConstraints = self->_trailingAppStoreButtonConstraints;
  self->_trailingAppStoreButtonConstraints = v48;

  -[CPSAppMetadataView _updateAppStoreButtonConstraints](self, "_updateAppStoreButtonConstraints");
}

- (void)updateWithMetadata:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "fullAppName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CPSVibrantLabel setAlpha:](self->_poweredByVibrantLabel, "setAlpha:", 1.0);
    -[CPSVibrantLabel setText:](self->_appNameVibrantLabel, "setText:", v4);
    if (objc_msgSend(v15, "hasAppMetadata") && (objc_msgSend(v15, "fullAppOnly") & 1) == 0)
      -[CPSAppStoreButton setHidden:](self->_appStoreButton, "setHidden:", 0);
    objc_msgSend(v15, "fullAppContentRating");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "cps_imageNamed:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "hasSuffix:", CFSTR("-Brazil"));
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "cps_imageNamed:", CFSTR("4+"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "size");

      -[CPSAppMetadataView traitCollection](self, "traitCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "displayScale");
      UISizeRoundToScale();
      v11 = v10;
      v13 = v12;

      objc_msgSend(v6, "cps_resizedImageWithSize:", v11, v13);
      v14 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v14;
    }
    -[CPSContentRatingContainerView setImage:usesVibrantAppearance:](self->_contentRatingContainerView, "setImage:usesVibrantAppearance:", v6, v7 ^ 1u);

  }
}

- (UIImage)appIcon
{
  return -[UIImageView image](self->_appIconView, "image");
}

- (void)setAppIcon:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D3A820]);
    v6 = objc_alloc(MEMORY[0x1E0D3A810]);
    v7 = objc_retainAutorelease(v4);
    v8 = objc_msgSend(v7, "CGImage");
    objc_msgSend(v7, "scale");
    v9 = (void *)objc_msgSend(v6, "initWithCGImage:scale:", v8);
    v18[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v5, "initWithImages:", v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D3A820], "genericApplicationIcon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", *MEMORY[0x1E0D3A890]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageForImageDescriptor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CEA638];
  v15 = objc_msgSend(v13, "CGImage");
  objc_msgSend(v13, "scale");
  objc_msgSend(v14, "imageWithCGImage:scale:orientation:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_appIconView, "setImage:", v16);

  -[UIImageView _setContinuousCornerRadius:](self->_appIconView, "_setContinuousCornerRadius:", 0.0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setBackgroundColor:](self->_appIconView, "setBackgroundColor:", v17);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CPSAppMetadataView;
  v4 = a3;
  -[CPSAppMetadataView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[CPSAppMetadataView traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqualToString:", v7);
  if ((v4 & 1) == 0)
    -[CPSAppMetadataView _updateAppStoreButtonConstraints](self, "_updateAppStoreButtonConstraints");

}

- (void)_updateAppStoreButtonConstraints
{
  void *v3;
  NSString *v4;
  _BOOL8 IsAccessibilityCategory;

  -[CPSAppMetadataView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  objc_msgSend(MEMORY[0x1E0CB3718], "cps_if:thenActivateConstraints:elseActivateConstraints:", IsAccessibilityCategory, self->_leadingAppStoreButtonConstraints, self->_trailingAppStoreButtonConstraints);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingAppStoreButtonConstraints, 0);
  objc_storeStrong((id *)&self->_leadingAppStoreButtonConstraints, 0);
  objc_storeStrong((id *)&self->_appStoreButton, 0);
  objc_storeStrong((id *)&self->_contentRatingContainerView, 0);
  objc_storeStrong((id *)&self->_appNameVibrantLabel, 0);
  objc_storeStrong((id *)&self->_poweredByVibrantLabel, 0);
  objc_storeStrong((id *)&self->_appIconView, 0);
}

@end
