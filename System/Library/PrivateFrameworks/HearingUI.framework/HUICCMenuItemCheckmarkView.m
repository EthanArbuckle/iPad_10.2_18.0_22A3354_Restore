@implementation HUICCMenuItemCheckmarkView

- (HUICCMenuItemCheckmarkView)initWithFrame:(CGRect)a3
{
  HUICCMenuItemCheckmarkView *v3;
  uint64_t v4;
  UIView *highlightedBackgroundView;
  UIView *v6;
  UIView *containerView;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UIStackView *v20;
  UIStackView *verticalTitleStack;
  uint64_t v22;
  uint64_t v23;
  UILabel *titleLabel;
  uint64_t v25;
  uint64_t v26;
  UILabel *v27;
  void *v28;
  uint64_t v29;
  UILabel *subtitleLabel;
  UILabel *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  UIImageView *checkmarkView;
  UIImageView *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSMutableDictionary *v49;
  NSMutableDictionary *categoriesToVisualStylingProviders;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  uint64_t v55;
  UISelectionFeedbackGenerator *feedbackGenerator;
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
  objc_super v82;
  _QWORD v83[8];
  _QWORD v84[7];

  v84[5] = *MEMORY[0x24BDAC8D0];
  v82.receiver = self;
  v82.super_class = (Class)HUICCMenuItemCheckmarkView;
  v3 = -[HUICCMenuItemCheckmarkView initWithFrame:](&v82, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE19B38], "_tertiaryView");
    v4 = objc_claimAutoreleasedReturnValue();
    highlightedBackgroundView = v3->_highlightedBackgroundView;
    v3->_highlightedBackgroundView = (UIView *)v4;

    -[UIView setAutoresizingMask:](v3->_highlightedBackgroundView, "setAutoresizingMask:", 18);
    -[UIView setAlpha:](v3->_highlightedBackgroundView, "setAlpha:", 0.0);
    -[HUICCMenuItemCheckmarkView addSubview:](v3, "addSubview:", v3->_highlightedBackgroundView);
    v6 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    containerView = v3->_containerView;
    v3->_containerView = v6;

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_containerView, "setBackgroundColor:", v8);

    -[UIView setUserInteractionEnabled:](v3->_containerView, "setUserInteractionEnabled:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUICCMenuItemCheckmarkView addSubview:](v3, "addSubview:", v3->_containerView);
    v70 = (void *)MEMORY[0x24BDD1628];
    -[UIView leadingAnchor](v3->_containerView, "leadingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCMenuItemCheckmarkView leadingAnchor](v3, "leadingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    CCUILayoutGutter();
    objc_msgSend(v80, "constraintEqualToAnchor:constant:", v78);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v84[0] = v76;
    -[UIView trailingAnchor](v3->_containerView, "trailingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCMenuItemCheckmarkView trailingAnchor](v3, "trailingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    CCUILayoutGutter();
    objc_msgSend(v74, "constraintEqualToAnchor:constant:", v72, -v9);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v84[1] = v68;
    -[UIView topAnchor](v3->_containerView, "topAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCMenuItemCheckmarkView topAnchor](v3, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CCUILayoutGutter();
    objc_msgSend(v66, "constraintEqualToAnchor:constant:", v10, v11 * 0.25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v84[2] = v12;
    -[UIView bottomAnchor](v3->_containerView, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCMenuItemCheckmarkView bottomAnchor](v3, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CCUILayoutGutter();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, v15 * -0.25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v84[3] = v16;
    -[UIView heightAnchor](v3->_containerView, "heightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintGreaterThanOrEqualToConstant:", 52.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v84[4] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v84, 5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "activateConstraints:", v19);

    v20 = (UIStackView *)objc_alloc_init(MEMORY[0x24BEBD978]);
    verticalTitleStack = v3->_verticalTitleStack;
    v3->_verticalTitleStack = v20;

    -[UIStackView setDistribution:](v3->_verticalTitleStack, "setDistribution:", 1);
    -[UIStackView setAxis:](v3->_verticalTitleStack, "setAxis:", 1);
    -[UIStackView setSpacing:](v3->_verticalTitleStack, "setSpacing:", 0.0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_verticalTitleStack, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v3->_containerView, "addSubview:", v3->_verticalTitleStack);
    v22 = objc_msgSend(MEMORY[0x24BEBDB00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[HUICCMenuItemCheckmarkView semanticContentAttribute](v3, "semanticContentAttribute"));
    HUICCMenuTextLabel();
    v23 = objc_claimAutoreleasedReturnValue();
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v23;

    v25 = 2 * (v22 == 1);
    if (v22 == 1)
      v26 = 7;
    else
      v26 = 8;
    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", v25);
    -[UILabel setLineBreakMode:](v3->_titleLabel, "setLineBreakMode:", 4);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    v27 = v3->_titleLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v27, "setTextColor:", v28);

    -[UILabel sizeToFit](v3->_titleLabel, "sizeToFit");
    -[UIStackView addArrangedSubview:](v3->_verticalTitleStack, "addArrangedSubview:", v3->_titleLabel);
    HUICCMenuTextLabel();
    v29 = objc_claimAutoreleasedReturnValue();
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (UILabel *)v29;

    -[UILabel setTextAlignment:](v3->_subtitleLabel, "setTextAlignment:", v25);
    -[UILabel setLineBreakMode:](v3->_subtitleLabel, "setLineBreakMode:", 4);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_subtitleLabel, "setNumberOfLines:", 0);
    v31 = v3->_subtitleLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v31, "setTextColor:", v32);

    -[UILabel sizeToFit](v3->_subtitleLabel, "sizeToFit");
    -[UIStackView addArrangedSubview:](v3->_verticalTitleStack, "addArrangedSubview:", v3->_subtitleLabel);
    v33 = objc_alloc(MEMORY[0x24BEBD668]);
    v34 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithTextStyle:", *MEMORY[0x24BEBE220]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "systemImageNamed:withConfiguration:", CFSTR("checkmark"), v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v33, "initWithImage:", v36);
    checkmarkView = v3->_checkmarkView;
    v3->_checkmarkView = (UIImageView *)v37;

    -[UIImageView setContentMode:](v3->_checkmarkView, "setContentMode:", v26);
    v39 = v3->_checkmarkView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v39, "setTintColor:", v40);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_checkmarkView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v3->_containerView, "addSubview:", v3->_checkmarkView);
    v64 = (void *)MEMORY[0x24BDD1628];
    -[UIStackView leadingAnchor](v3->_verticalTitleStack, "leadingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v3->_containerView, "leadingAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:", v79);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v83[0] = v77;
    -[UIStackView topAnchor](v3->_verticalTitleStack, "topAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v3->_containerView, "topAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:", v73);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v83[1] = v71;
    -[UIStackView bottomAnchor](v3->_verticalTitleStack, "bottomAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v3->_containerView, "bottomAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:", v67);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v83[2] = v65;
    -[UIImageView leadingAnchor](v3->_checkmarkView, "leadingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView trailingAnchor](v3->_verticalTitleStack, "trailingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v62);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v83[3] = v61;
    -[UIImageView trailingAnchor](v3->_checkmarkView, "trailingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v3->_containerView, "trailingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v59);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v83[4] = v58;
    -[UIImageView centerYAnchor](v3->_checkmarkView, "centerYAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v3->_containerView, "centerYAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v83[5] = v43;
    -[UIImageView heightAnchor](v3->_checkmarkView, "heightAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToConstant:", 18.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v83[6] = v45;
    -[UIImageView widthAnchor](v3->_checkmarkView, "widthAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToConstant:", 18.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v83[7] = v47;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v83, 8);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "activateConstraints:", v48);

    v49 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    categoriesToVisualStylingProviders = v3->_categoriesToVisualStylingProviders;
    v3->_categoriesToVisualStylingProviders = v49;

    HUICCBackgroundVisualStylingProviderForCategory(1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCMenuItemCheckmarkView setVisualStylingProvider:forCategory:](v3, "setVisualStylingProvider:forCategory:", v51, 1);

    HUICCBackgroundVisualStylingProviderForCategory(2);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCMenuItemCheckmarkView setVisualStylingProvider:forCategory:](v3, "setVisualStylingProvider:forCategory:", v52, 2);

    v53 = objc_alloc(MEMORY[0x24BEBD940]);
    objc_msgSend(MEMORY[0x24BEBDD18], "lightConfiguration");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v53, "initWithConfiguration:view:", v54, v3);
    feedbackGenerator = v3->_feedbackGenerator;
    v3->_feedbackGenerator = (UISelectionFeedbackGenerator *)v55;

  }
  return v3;
}

- (void)setMenuItem:(id)a3
{
  id v5;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_menuItem, a3);
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUICCMenuItemCheckmarkView titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  objc_msgSend(v5, "subtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUICCMenuItemCheckmarkView subtitleLabel](self, "subtitleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  -[HUICCMenuItemCheckmarkView subtitleLabel](self, "subtitleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUICCMenuItemCheckmarkView subtitleLabel](self, "subtitleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[HUICCMenuItemCheckmarkView subtitleLabel](self, "subtitleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", objc_msgSend(v14, "isEqualToString:", &stru_24DD62430));

  }
  else
  {
    objc_msgSend(v10, "setHidden:", 1);
  }

  -[HUICCMenuItemCheckmarkView checkmarkView](self, "checkmarkView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHidden:", objc_msgSend(v5, "isSelected") ^ 1);

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[HUICCMenuItemCheckmarkView requiredVisualStyleCategories](self, "requiredVisualStyleCategories", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[HUICCMenuItemCheckmarkView categoriesToVisualStylingProviders](self, "categoriesToVisualStylingProviders");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUICCMenuItemCheckmarkView setVisualStylingProvider:forCategory:](self, "setVisualStylingProvider:forCategory:", v23, objc_msgSend(v21, "integerValue"));

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v18);
  }

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUICCMenuItemCheckmarkView;
  -[HUICCMenuItemCheckmarkView setHighlighted:](&v9, sel_setHighlighted_);
  if (v3)
  {
    -[HUICCMenuItemCheckmarkView feedbackGenerator](self, "feedbackGenerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectionChanged");

    -[HUICCMenuItemCheckmarkView highlightedBackgroundView](self, "highlightedBackgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 1.0;
  }
  else
  {
    -[HUICCMenuItemCheckmarkView highlightedBackgroundView](self, "highlightedBackgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 0.0;
  }
  objc_msgSend(v6, "setAlpha:", v8);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[HUICCMenuItemCheckmarkView titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[HUICCMenuItemCheckmarkView subtitleLabel](self, "subtitleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;

  v2 = *MEMORY[0x24BEBDF00];
  -[HUICCMenuItemCheckmarkView checkmarkView](self, "checkmarkView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");

  v5 = *MEMORY[0x24BEBDF30];
  if (v4)
    v5 = 0;
  return v5 | v2;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_24DD6B2D8;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  HUICCMenuItemCheckmarkView *v14;

  v6 = a3;
  -[HUICCMenuItemCheckmarkView requiredVisualStyleCategories](self, "requiredVisualStyleCategories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if (v9)
  {
    -[HUICCMenuItemCheckmarkView categoriesToVisualStylingProviders](self, "categoriesToVisualStylingProviders");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, v11);

    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __67__HUICCMenuItemCheckmarkView_setVisualStylingProvider_forCategory___block_invoke;
    v12[3] = &unk_24DD61050;
    v13 = v6;
    v14 = self;
    dispatch_async(MEMORY[0x24BDAC9B8], v12);

  }
}

void __67__HUICCMenuItemCheckmarkView_setVisualStylingProvider_forCategory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "automaticallyUpdateView:withStyle:", v3, 0);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "subtitleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "automaticallyUpdateView:withStyle:", v5, 1);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "checkmarkView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "automaticallyUpdateView:withStyle:", v7, 0);

}

- (CCUIMenuModuleItem)menuItem
{
  return self->_menuItem;
}

- (UIView)highlightedBackgroundView
{
  return self->_highlightedBackgroundView;
}

- (void)setHighlightedBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedBackgroundView, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UIStackView)verticalTitleStack
{
  return self->_verticalTitleStack;
}

- (void)setVerticalTitleStack:(id)a3
{
  objc_storeStrong((id *)&self->_verticalTitleStack, a3);
}

- (UIImageView)checkmarkView
{
  return self->_checkmarkView;
}

- (void)setCheckmarkView:(id)a3
{
  objc_storeStrong((id *)&self->_checkmarkView, a3);
}

- (NSMutableDictionary)categoriesToVisualStylingProviders
{
  return self->_categoriesToVisualStylingProviders;
}

- (void)setCategoriesToVisualStylingProviders:(id)a3
{
  objc_storeStrong((id *)&self->_categoriesToVisualStylingProviders, a3);
}

- (UISelectionFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackGenerator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_categoriesToVisualStylingProviders, 0);
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_storeStrong((id *)&self->_verticalTitleStack, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_highlightedBackgroundView, 0);
  objc_storeStrong((id *)&self->_menuItem, 0);
}

@end
