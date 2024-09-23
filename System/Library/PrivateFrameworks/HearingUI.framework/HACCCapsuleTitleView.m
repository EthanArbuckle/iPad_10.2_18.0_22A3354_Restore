@implementation HACCCapsuleTitleView

- (HACCCapsuleTitleView)initWithFrame:(CGRect)a3
{
  HACCCapsuleTitleView *v3;
  id v4;
  void *v5;
  uint64_t v6;
  UIVisualEffectView *titleContainer;
  _BOOL4 v8;
  UILabel *v9;
  UILabel *titleLabel;
  UILabel *v11;
  void *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
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
  objc_super v51;
  _QWORD v52[10];

  v52[8] = *MEMORY[0x24BDAC8D0];
  v51.receiver = self;
  v51.super_class = (Class)HACCCapsuleTitleView;
  v3 = -[HACCCapsuleTitleView initWithFrame:](&v51, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BEBDB38]);
    objc_msgSend(MEMORY[0x24BEBDAF0], "controlCenterSecondaryVibrancyEffect");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithEffect:", v5);
    titleContainer = v3->_titleContainer;
    v3->_titleContainer = (UIVisualEffectView *)v6;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HACCCapsuleTitleView addSubview:](v3, "addSubview:", v3->_titleContainer);
    v8 = objc_msgSend(MEMORY[0x24BEBDB00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[HACCCapsuleTitleView semanticContentAttribute](v3, "semanticContentAttribute")) == 1;
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v9;

    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BEBE220], 32770, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v3->_titleLabel;
    v12 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(v50, "pointSize");
    objc_msgSend(v12, "fontWithDescriptor:size:", v50);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v11, "setFont:", v13);

    v14 = v3->_titleLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v14, "setTextColor:", v15);

    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 2 * v8);
    -[UILabel setClipsToBounds:](v3->_titleLabel, "setClipsToBounds:", 0);
    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v3->_titleLabel, "setLineBreakMode:", 0);
    LODWORD(v16) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v16);
    LODWORD(v17) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v17);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIVisualEffectView contentView](v3->_titleContainer, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v3->_titleLabel);

    v38 = (void *)MEMORY[0x24BDD1628];
    -[UIVisualEffectView leadingAnchor](v3->_titleContainer, "leadingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[HACCCapsuleTitleView leadingAnchor](v3, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v48);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v47;
    -[UIVisualEffectView trailingAnchor](v3->_titleContainer, "trailingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[HACCCapsuleTitleView trailingAnchor](v3, "trailingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v45);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v44;
    -[UIVisualEffectView topAnchor](v3->_titleContainer, "topAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[HACCCapsuleTitleView topAnchor](v3, "topAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v42);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v52[2] = v41;
    -[UIVisualEffectView bottomAnchor](v3->_titleContainer, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[HACCCapsuleTitleView bottomAnchor](v3, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v39);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v52[3] = v37;
    -[UILabel leadingAnchor](v3->_titleLabel, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](v3->_titleContainer, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    CCUILayoutGutter();
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v52[4] = v33;
    -[UILabel trailingAnchor](v3->_titleLabel, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](v3->_titleContainer, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    CCUILayoutGutter();
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, -v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v52[5] = v20;
    -[UILabel topAnchor](v3->_titleLabel, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](v3->_titleContainer, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintGreaterThanOrEqualToAnchor:constant:", v23, 10.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v52[6] = v24;
    -[UILabel lastBaselineAnchor](v3->_titleLabel, "lastBaselineAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView lastBaselineAnchor](v3->_titleContainer, "lastBaselineAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, -10.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v52[7] = v27;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "activateConstraints:", v28);

  }
  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[HACCCapsuleTitleView titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBDF08];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIVisualEffectView)titleContainer
{
  return self->_titleContainer;
}

- (void)setTitleContainer:(id)a3
{
  objc_storeStrong((id *)&self->_titleContainer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleContainer, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
