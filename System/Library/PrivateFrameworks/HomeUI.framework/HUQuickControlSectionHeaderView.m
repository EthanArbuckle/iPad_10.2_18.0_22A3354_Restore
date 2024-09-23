@implementation HUQuickControlSectionHeaderView

+ (id)_titleFont
{
  return (id)objc_msgSend(MEMORY[0x1E0D33718], "preferredFontForTextStyle:traits:", *MEMORY[0x1E0CEB568], 32770);
}

+ (double)estimatedHeight
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "_titleFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lineHeight");
  v4 = v3 + 16.0;

  return v4;
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUQuickControlSectionHeaderView)initWithFrame:(CGRect)a3
{
  HUQuickControlSectionHeaderView *v3;
  HUQuickControlSectionHeaderView *v4;
  NSString *titleText;
  UILabel *v6;
  UILabel *titleLabel;
  void *v8;
  void *v9;
  uint64_t v10;
  UIButton *accessoryButton;
  UIButton *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)HUQuickControlSectionHeaderView;
  v3 = -[HUQuickControlSectionHeaderView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    titleText = v3->_titleText;
    v3->_titleText = (NSString *)&stru_1E6F60E80;

    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v6;

    objc_msgSend((id)objc_opt_class(), "_titleFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_titleLabel, "setFont:", v8);

    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v9);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUQuickControlSectionHeaderView addSubview:](v4, "addSubview:", v4->_titleLabel);
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v10 = objc_claimAutoreleasedReturnValue();
    accessoryButton = v4->_accessoryButton;
    v4->_accessoryButton = (UIButton *)v10;

    -[UIButton addTarget:action:forEvents:](v4->_accessoryButton, "addTarget:action:forEvents:", v4, sel_accessoryButtonTapped, 64);
    if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseProxHandOffMaterials") & 1) == 0)
    {
      v12 = v4->_accessoryButton;
      objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTitleColor:forState:](v12, "setTitleColor:forState:", v13, 0);

    }
    objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0CEB568], 1024);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton titleLabel](v4->_accessoryButton, "titleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFont:", v14);

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_accessoryButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton titleLabel](v4->_accessoryButton, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTextAlignment:", 1);

    -[HUQuickControlSectionHeaderView addSubview:](v4, "addSubview:", v4->_accessoryButton);
    v4->_hideSeparator = 0;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSectionHeaderView setBackgroundColor:](v4, "setBackgroundColor:", v17);

  }
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  double width;
  double y;
  void *v5;
  id v6;

  width = a3.size.width;
  y = a3.origin.y;
  if (!-[HUQuickControlSectionHeaderView hideSeparator](self, "hideSeparator", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))
  {
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", 40.0, y, width + -80.0, 2.0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "separatorColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFill");

    objc_msgSend(v6, "fill");
  }
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUQuickControlSectionHeaderView;
  -[HUQuickControlSectionHeaderView prepareForReuse](&v3, sel_prepareForReuse);
  -[HUQuickControlSectionHeaderView setTitleText:](self, "setTitleText:", &stru_1E6F60E80);
  self->_hideSeparator = 0;
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (-[HUQuickControlSectionHeaderView isHidden](self, "isHidden")
    && !v3
    && -[HUQuickControlSectionHeaderView hideAccessoryButton](self, "hideAccessoryButton"))
  {
    -[HUQuickControlSectionHeaderView accessoryButton](self, "accessoryButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 1);

  }
  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlSectionHeaderView;
  -[HUQuickControlSectionHeaderView setHidden:](&v6, sel_setHidden_, v3);
}

- (void)setHideSeparator:(BOOL)a3
{
  if (self->_hideSeparator != a3)
  {
    self->_hideSeparator = a3;
    -[HUQuickControlSectionHeaderView setNeedsDisplay](self, "setNeedsDisplay");
  }
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
  objc_super v39;

  -[HUQuickControlSectionHeaderView labelConstraints](self, "labelConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSectionHeaderView titleLabel](self, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSectionHeaderView leadingAnchor](self, "leadingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, 40.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

    -[HUQuickControlSectionHeaderView titleLabel](self, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSectionHeaderView layoutMarginsGuide](self, "layoutMarginsGuide");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v13);

    -[HUQuickControlSectionHeaderView titleLabel](self, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSectionHeaderView layoutMarginsGuide](self, "layoutMarginsGuide");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v18);

    -[HUQuickControlSectionHeaderView setLabelConstraints:](self, "setLabelConstraints:", v4);
  }
  v19 = (void *)MEMORY[0x1E0CB3718];
  -[HUQuickControlSectionHeaderView labelConstraints](self, "labelConstraints");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activateConstraints:", v20);

  -[HUQuickControlSectionHeaderView accessoryButtonConstraints](self, "accessoryButtonConstraints");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSectionHeaderView accessoryButton](self, "accessoryButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSectionHeaderView layoutMarginsGuide](self, "layoutMarginsGuide");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v27);

    -[HUQuickControlSectionHeaderView accessoryButton](self, "accessoryButton");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSectionHeaderView layoutMarginsGuide](self, "layoutMarginsGuide");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v32);

    -[HUQuickControlSectionHeaderView accessoryButton](self, "accessoryButton");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSectionHeaderView trailingAnchor](self, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35, -40.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v36);

    -[HUQuickControlSectionHeaderView setAccessoryButtonConstraints:](self, "setAccessoryButtonConstraints:", v22);
  }
  v37 = (void *)MEMORY[0x1E0CB3718];
  -[HUQuickControlSectionHeaderView accessoryButtonConstraints](self, "accessoryButtonConstraints");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "activateConstraints:", v38);

  v39.receiver = self;
  v39.super_class = (Class)HUQuickControlSectionHeaderView;
  -[HUQuickControlSectionHeaderView updateConstraints](&v39, sel_updateConstraints);
}

- (void)setTitleText:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_titleText, a3);
  v5 = a3;
  -[HUQuickControlSectionHeaderView titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  -[HUQuickControlSectionHeaderView titleLabel](self, "titleLabel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeToFit");

}

- (void)setAttributedTitleText:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  objc_storeStrong((id *)&self->_attributedTitleText, a3);
  v5 = a3;
  -[HUQuickControlSectionHeaderView titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttributedText:", v5);

  -[HUQuickControlSectionHeaderView titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeToFit");

  -[HUQuickControlSectionHeaderView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)setAccessoryButtonTitleText:(id)a3
{
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_storeStrong((id *)&self->_accessoryButtonTitleText, a3);
  -[HUQuickControlSectionHeaderView accessoryButton](self, "accessoryButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:forState:", v9, 0);

  v6 = !v9
    || !objc_msgSend(v9, "length")
    || -[HUQuickControlSectionHeaderView hideAccessoryButton](self, "hideAccessoryButton");
  -[HUQuickControlSectionHeaderView accessoryButton](self, "accessoryButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v6);

  -[HUQuickControlSectionHeaderView accessoryButton](self, "accessoryButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeToFit");

}

- (void)setHideAccessoryButton:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_hideAccessoryButton != a3)
  {
    v3 = a3;
    self->_hideAccessoryButton = a3;
    -[HUQuickControlSectionHeaderView accessoryButton](self, "accessoryButton");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", v3);

  }
}

- (void)setHideHeaderText:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_hideHeaderText != a3)
  {
    v3 = a3;
    self->_hideHeaderText = a3;
    -[HUQuickControlSectionHeaderView titleLabel](self, "titleLabel");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", v3);

  }
}

- (void)accessoryButtonTapped
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  HUQuickControlSectionHeaderView *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[HUQuickControlSectionHeaderView accessoryButtonTarget](self, "accessoryButtonTarget");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315650;
    v8 = "-[HUQuickControlSectionHeaderView accessoryButtonTapped]";
    v9 = 2112;
    v10 = self;
    v11 = 2112;
    v12 = v6;
    _os_log_debug_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEBUG, "%s(%@) button target: %@", (uint8_t *)&v7, 0x20u);

  }
  -[HUQuickControlSectionHeaderView accessoryButtonTarget](self, "accessoryButtonTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSectionHeaderView itemSection](self, "itemSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemSection:accessoryButtonPressedInHeader:", v5, self);

}

- (void)updateUIForReachabilityState:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  UIButton *accessoryButton;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (a3 < 2)
  {
    -[HUQuickControlSectionHeaderView titleLabel](self, "titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", 0.5);

    -[HUQuickControlSectionHeaderView accessoryButton](self, "accessoryButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 0.5);

    -[HUQuickControlSectionHeaderView accessoryButton](self, "accessoryButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserInteractionEnabled:", 0);

    accessoryButton = self->_accessoryButton;
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v12 = (id)v8;
    -[UIButton setTitleColor:forState:](accessoryButton, "setTitleColor:forState:");

    return;
  }
  if (a3 == 2)
  {
    -[HUQuickControlSectionHeaderView titleLabel](self, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAlpha:", 1.0);

    -[HUQuickControlSectionHeaderView accessoryButton](self, "accessoryButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAlpha:", 1.0);

    -[HUQuickControlSectionHeaderView accessoryButton](self, "accessoryButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUserInteractionEnabled:", 1);

    if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseProxHandOffMaterials") & 1) == 0)
    {
      accessoryButton = self->_accessoryButton;
      objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
}

- (HFItemSection)itemSection
{
  return self->itemSection;
}

- (void)setItemSection:(id)a3
{
  objc_storeStrong((id *)&self->itemSection, a3);
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSAttributedString)attributedTitleText
{
  return self->_attributedTitleText;
}

- (NSString)accessoryButtonTitleText
{
  return self->_accessoryButtonTitleText;
}

- (BOOL)hideSeparator
{
  return self->_hideSeparator;
}

- (BOOL)hideAccessoryButton
{
  return self->_hideAccessoryButton;
}

- (BOOL)hideHeaderText
{
  return self->_hideHeaderText;
}

- (HFItemSectionAccessoryButtonHeaderDelegate)accessoryButtonTarget
{
  return (HFItemSectionAccessoryButtonHeaderDelegate *)objc_loadWeakRetained((id *)&self->_accessoryButtonTarget);
}

- (void)setAccessoryButtonTarget:(id)a3
{
  objc_storeWeak((id *)&self->_accessoryButtonTarget, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (NSArray)labelConstraints
{
  return self->_labelConstraints;
}

- (void)setLabelConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_labelConstraints, a3);
}

- (UIButton)accessoryButton
{
  return self->_accessoryButton;
}

- (void)setAccessoryButton:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryButton, a3);
}

- (NSArray)accessoryButtonConstraints
{
  return self->_accessoryButtonConstraints;
}

- (void)setAccessoryButtonConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryButtonConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryButtonConstraints, 0);
  objc_storeStrong((id *)&self->_accessoryButton, 0);
  objc_storeStrong((id *)&self->_labelConstraints, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_accessoryButtonTarget);
  objc_storeStrong((id *)&self->_accessoryButtonTitleText, 0);
  objc_storeStrong((id *)&self->_attributedTitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->itemSection, 0);
}

@end
