@implementation FAFamilySharingFeaturesView

- (FAFamilySharingFeaturesView)initWithContext:(int64_t)a3 hideLocationSharing:(BOOL)a4
{
  FAFamilySharingFeaturesView *v6;
  FAFamilySharingFeaturesView *v7;
  uint64_t v8;
  UIStackView *stack;
  UIStackView *v10;
  void *v11;
  void *v12;
  void *v13;
  UIStackView *v14;
  void *v15;
  void *v16;
  void *v17;
  UIStackView *v18;
  void *v19;
  void *v20;
  void *v21;
  UIStackView *v22;
  void *v23;
  void *v24;
  void *v25;
  UIStackView *v26;
  void *v27;
  void *v28;
  void *v29;
  UIStackView *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  UIButton *learnMoreButton;
  UIButton *v36;
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
  objc_super v54;
  const __CFString *v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x24BDAC8D0];
  v54.receiver = self;
  v54.super_class = (Class)FAFamilySharingFeaturesView;
  v6 = -[FAFamilySharingFeaturesView initWithFrame:](&v54, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v7 = v6;
  if (v6)
  {
    v6->_context = a3;
    v6->_shouldHideLocationSharing = a4;
    v8 = objc_opt_new();
    stack = v7->_stack;
    v7->_stack = (UIStackView *)v8;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v7->_stack, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v7->_stack, "setAxis:", 1);
    -[UIStackView setAlignment:](v7->_stack, "setAlignment:", 0);
    -[UIStackView setDistribution:](v7->_stack, "setDistribution:", 0);
    -[UIStackView setSpacing:](v7->_stack, "setSpacing:", 16.0);
    v10 = v7->_stack;
    -[FAFamilySharingFeaturesView _imageViewWithIconNamed:addBorder:](v7, "_imageViewWithIconNamed:addBorder:", CFSTR("StoreIcon"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FAFamilySharingFeaturesView _labelWithStringAtKey:](v7, "_labelWithStringAtKey:", CFSTR("FAMILY_SHARE_PURCHASES_DESCRIPTION"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[FAFamilySharingFeaturesView rowForIcon:andLabel:](FAFamilySharingFeaturesView, "rowForIcon:andLabel:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView addArrangedSubview:](v10, "addArrangedSubview:", v13);

    v14 = v7->_stack;
    -[FAFamilySharingFeaturesView _imageViewWithIconNamed:addBorder:](v7, "_imageViewWithIconNamed:addBorder:", CFSTR("MusicIcon"), 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FAFamilySharingFeaturesView _labelWithStringAtKey:](v7, "_labelWithStringAtKey:", CFSTR("FAMILY_SHARE_MUSIC_DESCRIPTION"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[FAFamilySharingFeaturesView rowForIcon:andLabel:](FAFamilySharingFeaturesView, "rowForIcon:andLabel:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView addArrangedSubview:](v14, "addArrangedSubview:", v17);

    v18 = v7->_stack;
    -[FAFamilySharingFeaturesView _imageViewWithIconNamed:addBorder:](v7, "_imageViewWithIconNamed:addBorder:", CFSTR("PhotosIcon"), 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[FAFamilySharingFeaturesView _labelWithStringAtKey:](v7, "_labelWithStringAtKey:", CFSTR("FAMILY_SHARE_PHOTOS_DESCRIPTION"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[FAFamilySharingFeaturesView rowForIcon:andLabel:](FAFamilySharingFeaturesView, "rowForIcon:andLabel:", v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView addArrangedSubview:](v18, "addArrangedSubview:", v21);

    v22 = v7->_stack;
    -[FAFamilySharingFeaturesView _imageViewWithIconNamed:addBorder:](v7, "_imageViewWithIconNamed:addBorder:", CFSTR("CalendarIcon"), 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[FAFamilySharingFeaturesView _labelWithStringAtKey:](v7, "_labelWithStringAtKey:", CFSTR("FAMILY_SHARE_CALENDAR_DESCRIPTION"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[FAFamilySharingFeaturesView rowForIcon:andLabel:](FAFamilySharingFeaturesView, "rowForIcon:andLabel:", v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView addArrangedSubview:](v22, "addArrangedSubview:", v25);

    if (!v7->_shouldHideLocationSharing)
    {
      v26 = v7->_stack;
      -[FAFamilySharingFeaturesView _imageViewWithIconNamed:addBorder:](v7, "_imageViewWithIconNamed:addBorder:", CFSTR("FMFIcon"), 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[FAFamilySharingFeaturesView _labelWithStringAtKey:](v7, "_labelWithStringAtKey:", CFSTR("FAMILY_SHARE_LOCATION_DESCRIPTION"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[FAFamilySharingFeaturesView rowForIcon:andLabel:](FAFamilySharingFeaturesView, "rowForIcon:andLabel:", v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIStackView addArrangedSubview:](v26, "addArrangedSubview:", v29);

    }
    v30 = v7->_stack;
    -[FAFamilySharingFeaturesView _imageViewWithIconNamed:addBorder:](v7, "_imageViewWithIconNamed:addBorder:", CFSTR("FMIPIcon"), 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[FAFamilySharingFeaturesView _labelWithStringAtKey:](v7, "_labelWithStringAtKey:", CFSTR("FAMILY_HELP_LOCATE_DEVICES_DESCRIPTION"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[FAFamilySharingFeaturesView rowForIcon:andLabel:](FAFamilySharingFeaturesView, "rowForIcon:andLabel:", v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView addArrangedSubview:](v30, "addArrangedSubview:", v33);

    -[FAFamilySharingFeaturesView addSubview:](v7, "addSubview:", v7->_stack);
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v34 = objc_claimAutoreleasedReturnValue();
    learnMoreButton = v7->_learnMoreButton;
    v7->_learnMoreButton = (UIButton *)v34;

    v36 = v7->_learnMoreButton;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("FAMILY_SHARING_LEARN_MORE_BUTTON"), &stru_24C8A3000, CFSTR("Localizable"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v36, "setTitle:forState:", v38, 0);

    -[UIButton titleLabel](v7->_learnMoreButton, "titleLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setTextAlignment:", 1);

    -[UIButton addTarget:action:forControlEvents:](v7->_learnMoreButton, "addTarget:action:forControlEvents:", v7, sel__learnMoreButtonTapped_, 64);
    -[UIButton titleLabel](v7->_learnMoreButton, "titleLabel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setFont:", v41);

    -[UIButton titleLabel](v7->_learnMoreButton, "titleLabel");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setNumberOfLines:", 0);

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v7->_learnMoreButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[FAFamilySharingFeaturesView addSubview:](v7, "addSubview:", v7->_learnMoreButton);
    _NSDictionaryOfVariableBindings(CFSTR("_stack, _learnMoreButton"), v7->_stack, v7->_learnMoreButton, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_stack]|"), 0, 0, v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "activateConstraints:", v45);

    v46 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_learnMoreButton]|"), 0, 0, v43);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "activateConstraints:", v47);

    v48 = (void *)MEMORY[0x24BDD1628];
    v55 = CFSTR("learnMoreSpacing");
    v49 = (void *)MEMORY[0x24BDD16E0];
    UIRoundToViewScale();
    objc_msgSend(v49, "numberWithDouble:");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v50;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_stack]-(learnMoreSpacing)-[_learnMoreButton]|"), 0, v51, v43);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "activateConstraints:", v52);

  }
  return v7;
}

+ (id)rowForIcon:(id)a3 andLabel:(id)a4
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

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "addSubview:", v6);
  objc_msgSend(v7, "addSubview:", v5);
  _NSDictionaryOfVariableBindings(CFSTR("image, text"), v6, v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[image(iconSize)]-(iconToLabelSpace)-[text]|"), 0, &unk_24C8CD6D0, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v10);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(>=0)-[image(iconSize)]"), 0, &unk_24C8CD6D0, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v11);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[text]|"), 0, &unk_24C8CD6D0, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v12);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 10, 0, v6, 10, 1.0, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v13);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 10, 0, v6, 10, 1.0, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObject:", v14);
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v9);

  return v7;
}

- (id)_labelWithStringAtKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  -[FAFamilySharingFeaturesView _contextSensitiveLocalizedStringWithKey:](self, "_contextSensitiveLocalizedStringWithKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BEBD708]);
  v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v5, "setText:", v3);
  objc_msgSend(v5, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x24BEBB520], "aa_fontForPrimaryInformationLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  return v5;
}

- (id)_imageViewWithIconNamed:(id)a3 addBorder:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v4 = a4;
  v5 = (void *)MEMORY[0x24BEBD640];
  v6 = (void *)MEMORY[0x24BDD1488];
  v7 = a3;
  objc_msgSend(v6, "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:inBundle:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v9);
  v11 = v10;
  if (v4)
  {
    objc_msgSend(v10, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemMidGrayColor");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v12, "setBorderColor:", objc_msgSend(v13, "CGColor"));

    objc_msgSend(v11, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PSRoundToPixel();
    objc_msgSend(v14, "setBorderWidth:");

    objc_msgSend(v11, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCornerRadius:", 8.0);

  }
  return v11;
}

- (void)_learnMoreButtonTapped:(id)a3
{
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(v3, "fetchAAURLConfigurationWithCompletion:", &__block_literal_global_18);

}

void __54__FAFamilySharingFeaturesView__learnMoreButtonTapped___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  objc_msgSend(a2, "urlForEndpoint:", *MEMORY[0x24BE309B8]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "openURL:configuration:completionHandler:", v3, 0, 0);

  }
}

- (id)_contextSensitiveLocalizedStringWithKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  if (self->_context == 1)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    v4 = a3;
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@_INVITE_CONTEXT"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = v5;
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDD1488];
    v7 = a3;
    objc_msgSend(v9, "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6;
    v8 = v7;
  }
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24C8A3000, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_updateFonts
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[UIStackView arrangedSubviews](self->_stack, "arrangedSubviews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v7), "subviews");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BEBB520], "aa_fontForPrimaryInformationLabel");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setFont:", v10);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  -[UIButton titleLabel](self->_learnMoreButton, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v12);

  -[FAFamilySharingFeaturesView setNeedsLayout](self, "setNeedsLayout");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FAFamilySharingFeaturesView;
  v4 = a3;
  -[FAFamilySharingFeaturesView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "preferredContentSizeCategory", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FAFamilySharingFeaturesView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
    -[FAFamilySharingFeaturesView _updateFonts](self, "_updateFonts");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_learnMoreButton, 0);
}

@end
