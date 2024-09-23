@implementation HUHubUnavailableView

- (HUHubUnavailableView)initWithFrame:(CGRect)a3
{
  HUHubUnavailableView *v3;
  HUHubUnavailableView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUHubUnavailableView;
  v3 = -[HUHubUnavailableView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[HUHubUnavailableView _setupView](v3, "_setupView");
  return v4;
}

- (void)_setupView
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  HUIconView *v8;
  HUIconView *networkIconView;
  void *v10;
  HUIconView *v11;
  void *v12;
  UILabel *v13;
  UILabel *titleLabel;
  void *v15;
  void *v16;
  UILabel *v17;
  UILabel *descriptionLabel;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 50.0);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0D33720]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = (HUIconView *)objc_msgSend(v3, "initWithFrame:contentMode:", 4, *MEMORY[0x1E0C9D648], v5, v6, v7);
  networkIconView = self->_networkIconView;
  self->_networkIconView = v8;

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUIconView setTintColor:](self->_networkIconView, "setTintColor:", v10);

  -[HUIconView setTranslatesAutoresizingMaskIntoConstraints:](self->_networkIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v11 = self->_networkIconView;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31460]), "initWithSystemImageNamed:configuration:", CFSTR("wifi.slash"), v22);
  -[HUIconView updateWithIconDescriptor:displayStyle:animated:](v11, "updateWithIconDescriptor:displayStyle:animated:", v12, 1, 0);

  -[HUHubUnavailableView addSubview:](self, "addSubview:", self->_networkIconView);
  v13 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v4, v5, v6, v7);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v13;

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v15);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", 0);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0CEB5B8], 1024);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v16);

  -[HUHubUnavailableView addSubview:](self, "addSubview:", self->_titleLabel);
  v17 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v4, v5, v6, v7);
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v17;

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_descriptionLabel, "setTextColor:", v19);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_descriptionLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_descriptionLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[UILabel setTextAlignment:](self->_descriptionLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_descriptionLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](self->_descriptionLabel, "setLineBreakMode:", 0);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0CEB538], 8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_descriptionLabel, "setFont:", v20);

  -[HUHubUnavailableView addSubview:](self, "addSubview:", self->_descriptionLabel);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHubUnavailableView setBackgroundColor:](self, "setBackgroundColor:", v21);

}

- (void)updateConstraints
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
  objc_super v53;

  -[HUHubUnavailableView layoutConstraints](self, "layoutConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHubUnavailableView networkIconView](self, "networkIconView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bottomAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHubUnavailableView titleLabel](self, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8, -12.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v9);

    -[HUHubUnavailableView networkIconView](self, "networkIconView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "centerXAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHubUnavailableView centerXAnchor](self, "centerXAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v13);

    -[HUHubUnavailableView networkIconView](self, "networkIconView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "widthAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToConstant:", 50.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v16);

    -[HUHubUnavailableView networkIconView](self, "networkIconView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "heightAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToConstant:", 50.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v19);

    -[HUHubUnavailableView titleLabel](self, "titleLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHubUnavailableView descriptionLabel](self, "descriptionLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23, -12.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v24);

    -[HUHubUnavailableView titleLabel](self, "titleLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "centerXAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHubUnavailableView centerXAnchor](self, "centerXAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v28);

    -[HUHubUnavailableView titleLabel](self, "titleLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHubUnavailableView leadingAnchor](self, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, 22.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v32);

    -[HUHubUnavailableView titleLabel](self, "titleLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHubUnavailableView trailingAnchor](self, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35, -22.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v36);

    -[HUHubUnavailableView descriptionLabel](self, "descriptionLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "centerXAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHubUnavailableView centerXAnchor](self, "centerXAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v40);

    -[HUHubUnavailableView descriptionLabel](self, "descriptionLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "centerYAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHubUnavailableView centerYAnchor](self, "centerYAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v44);

    -[HUHubUnavailableView descriptionLabel](self, "descriptionLabel");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHubUnavailableView leadingAnchor](self, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:constant:", v47, 22.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v48);

    -[HUHubUnavailableView descriptionLabel](self, "descriptionLabel");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHubUnavailableView trailingAnchor](self, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:constant:", v51, -22.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v52);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v4);
    -[HUHubUnavailableView setLayoutConstraints:](self, "setLayoutConstraints:", v4);

  }
  v53.receiver = self;
  v53.super_class = (Class)HUHubUnavailableView;
  -[HUHubUnavailableView updateConstraints](&v53, sel_updateConstraints);
}

- (void)setAccessoryName:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  if (!-[NSString isEqualToString:](self->_accessoryName, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_accessoryName, a3);
    -[HUHubUnavailableView accessoryName](self, "accessoryName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUHubUnavailable_Title"), CFSTR("%@"), v6, v7, v8, v9, v10, v11, (uint64_t)v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHubUnavailableView titleLabel](self, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);

    LODWORD(v12) = objc_msgSend(MEMORY[0x1E0D319D0], "useWLANInsteadOfWiFi");
    -[HUHubUnavailableView accessoryName](self, "accessoryName");
    v14 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v14;
    if ((_DWORD)v12)
      HULocalizedStringWithFormat(CFSTR("HUHubUnavailable_Description_WLAN"), CFSTR("%@"), v15, v16, v17, v18, v19, v20, v14);
    else
      HULocalizedStringWithFormat(CFSTR("HUHubUnavailable_Description_WIFI"), CFSTR("%@"), v15, v16, v17, v18, v19, v20, v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHubUnavailableView descriptionLabel](self, "descriptionLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setText:", v22);

    -[HUHubUnavailableView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (HUIconView)networkIconView
{
  return self->_networkIconView;
}

- (void)setNetworkIconView:(id)a3
{
  objc_storeStrong((id *)&self->_networkIconView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_layoutConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_networkIconView, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
}

@end
