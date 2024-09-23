@implementation CNPhotoPickerSectionHeader

- (CNPhotoPickerSectionHeader)initWithFrame:(CGRect)a3
{
  CNPhotoPickerSectionHeader *v3;
  UILabel *v4;
  UILabel *titleLabel;
  void *v6;
  double v7;
  uint64_t v8;
  UIButton *actionButton;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  id v14;
  void *v15;
  uint64_t v16;
  UIStackView *stackView;
  void *v18;
  CNPhotoPickerSectionHeader *v19;
  objc_super v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)CNPhotoPickerSectionHeader;
  v3 = -[CNPhotoPickerSectionHeader initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend((id)objc_opt_class(), "titleLabelFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v6);

    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    LODWORD(v7) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v7);
    +[CNPhotoPickerHeaderButton buttonWithType:](CNPhotoPickerHeaderButton, "buttonWithType:", 1);
    v8 = objc_claimAutoreleasedReturnValue();
    actionButton = v3->_actionButton;
    v3->_actionButton = (UIButton *)v8;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_actionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend((id)objc_opt_class(), "actionButtonFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton titleLabel](v3->_actionButton, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v10);

    -[UIButton titleLabel](v3->_actionButton, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAdjustsFontForContentSizeCategory:", 1);

    LODWORD(v13) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v3->_actionButton, "setContentHuggingPriority:forAxis:", 0, v13);
    -[UIButton addTarget:action:forControlEvents:](v3->_actionButton, "addTarget:action:forControlEvents:", v3, sel_actionButtonPressed_, 64);
    v14 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v22[0] = v3->_titleLabel;
    v22[1] = v3->_actionButton;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithArrangedSubviews:", v15);
    stackView = v3->_stackView;
    v3->_stackView = (UIStackView *)v16;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setDistribution:](v3->_stackView, "setDistribution:", 3);
    -[CNPhotoPickerSectionHeader addSubview:](v3, "addSubview:", v3->_stackView);
    +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerSectionHeader updateStyle:](v3, "updateStyle:", v18);

    -[CNPhotoPickerSectionHeader setupConstraints](v3, "setupConstraints");
    -[CNPhotoPickerSectionHeader updateDynamicStackViewProperties](v3, "updateDynamicStackViewProperties");
    v19 = v3;
  }

  return v3;
}

- (void)updateStyle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CNPhotoPickerSectionHeader setBackgroundColor:](self, "setBackgroundColor:", v5);
  }
  else
  {
    +[CNUIColorRepository photoPickerBackgroundColor](CNUIColorRepository, "photoPickerBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerSectionHeader setBackgroundColor:](self, "setBackgroundColor:", v6);

  }
  objc_msgSend(v4, "textColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[CNPhotoPickerSectionHeader titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v8);

}

- (void)setupConstraints
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
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v15 = (void *)objc_opt_new();
  -[CNPhotoPickerSectionHeader safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNPhotoPickerSectionHeader stackView](self, "stackView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  -[CNPhotoPickerSectionHeader stackView](self, "stackView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerSectionHeader safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v13;
  -[CNPhotoPickerSectionHeader stackView](self, "stackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerSectionHeader topAnchor](self, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v7;
  -[CNPhotoPickerSectionHeader stackView](self, "stackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerSectionHeader bottomAnchor](self, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v12);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v15);
}

- (void)updateDynamicStackViewProperties
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  -[CNPhotoPickerSectionHeader stackView](self, "stackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "setAxis:", 1);

    -[CNPhotoPickerSectionHeader stackView](self, "stackView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v7 = 1;
  }
  else
  {
    objc_msgSend(v4, "setAxis:", 0);

    -[CNPhotoPickerSectionHeader stackView](self, "stackView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v7 = 0;
  }
  objc_msgSend(v6, "setAlignment:", v7);

}

- (void)actionButtonPressed:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[CNPhotoPickerSectionHeader actionBlock](self, "actionBlock", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNPhotoPickerSectionHeader actionBlock](self, "actionBlock");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNPhotoPickerSectionHeader;
  -[CNPhotoPickerSectionHeader prepareForReuse](&v5, sel_prepareForReuse);
  -[CNPhotoPickerSectionHeader titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  -[CNPhotoPickerSectionHeader actionButton](self, "actionButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:forState:", 0, 0);

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNPhotoPickerSectionHeader;
  -[CNPhotoPickerSectionHeader traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[CNPhotoPickerSectionHeader updateDynamicStackViewProperties](self, "updateDynamicStackViewProperties");
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

+ (id)titleLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
}

+ (id)actionButtonFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

+ (id)reusableIdentifier
{
  return CFSTR("CNPhotoPickerSectionHeader");
}

+ (double)heightNeededForAccessibilityLayoutIncludingActionButton:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");

  objc_msgSend(a1, "titleLabelFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lineHeight");
  UIRoundToScale();
  v8 = v7;

  if (v3)
  {
    objc_msgSend(a1, "actionButtonFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lineHeight");
    UIRoundToScale();
    v8 = v8 + v10;

  }
  return v8;
}

@end
