@implementation BuddyExpressSetupFeatureCardCell

- (BuddyExpressSetupFeatureCardCell)initWithTitle:(id)a3 subtitle:(id)a4 state:(id)a5 accessoryView:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  UIColor *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  UIColor *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  NSArray *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  NSArray *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  NSArray *v54;
  BuddyExpressSetupFeatureCardCell *v55;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  objc_super v66;
  id obj;
  id v68;
  id v69;
  id location[2];
  id v71;
  _QWORD v72[4];
  _QWORD v73[5];
  _QWORD v74[2];

  v71 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v69 = 0;
  objc_storeStrong(&v69, a4);
  v68 = 0;
  objc_storeStrong(&v68, a5);
  obj = 0;
  objc_storeStrong(&obj, a6);
  v9 = v71;
  v71 = 0;
  v66.receiver = v9;
  v66.super_class = (Class)BuddyExpressSetupFeatureCardCell;
  v71 = -[BuddyExpressSetupFeatureCardCell initWithFrame:](&v66, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_storeStrong(&v71, v71);
  if (v71)
  {
    objc_storeStrong((id *)v71 + 1, obj);
    objc_msgSend(*((id *)v71 + 1), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v11 = (void *)*((_QWORD *)v71 + 3);
    *((_QWORD *)v71 + 3) = v10;

    objc_msgSend(*((id *)v71 + 3), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v12 = objc_msgSend(v71, "_titleFont");
    objc_msgSend(*((id *)v71 + 3), "setFont:", v12);

    objc_msgSend(*((id *)v71 + 3), "setText:", location[0]);
    objc_msgSend(*((id *)v71 + 3), "setNumberOfLines:", 0);
    if (v68)
    {
      v13 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      v14 = (void *)*((_QWORD *)v71 + 4);
      *((_QWORD *)v71 + 4) = v13;

      objc_msgSend(*((id *)v71 + 4), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v15 = +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
      objc_msgSend(*((id *)v71 + 4), "setTextColor:", v15);

      v16 = objc_msgSend(v71, "_stateFont");
      objc_msgSend(*((id *)v71 + 4), "setFont:", v16);

      objc_msgSend(*((id *)v71 + 4), "setText:", v68);
      LODWORD(v17) = 1148846080;
      objc_msgSend(*((id *)v71 + 4), "setContentHuggingPriority:forAxis:", 0, v17);
      LODWORD(v18) = 1148846080;
      objc_msgSend(*((id *)v71 + 4), "setContentHuggingPriority:forAxis:", 1, v18);
      LODWORD(v19) = 1148846080;
      objc_msgSend(*((id *)v71 + 3), "setContentHuggingPriority:forAxis:", 1, v19);
    }
    v20 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v21 = (void *)*((_QWORD *)v71 + 5);
    *((_QWORD *)v71 + 5) = v20;

    objc_msgSend(*((id *)v71 + 5), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v22 = +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
    objc_msgSend(*((id *)v71 + 5), "setTextColor:", v22);

    v23 = objc_msgSend(v71, "_bodyFont");
    objc_msgSend(*((id *)v71 + 5), "setFont:", v23);

    objc_msgSend(*((id *)v71 + 5), "setText:", v69);
    objc_msgSend(*((id *)v71 + 5), "setNumberOfLines:", 0);
    v24 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v25 = (void *)*((_QWORD *)v71 + 2);
    *((_QWORD *)v71 + 2) = v24;

    objc_msgSend(*((id *)v71 + 2), "setAxis:", 1);
    objc_msgSend(*((id *)v71 + 2), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (*((_QWORD *)v71 + 4))
    {
      v26 = objc_alloc((Class)UIStackView);
      v74[0] = *((_QWORD *)v71 + 3);
      v74[1] = *((_QWORD *)v71 + 4);
      v27 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v74, 2);
      v28 = objc_msgSend(v26, "initWithArrangedSubviews:", v27);
      v29 = (void *)*((_QWORD *)v71 + 6);
      *((_QWORD *)v71 + 6) = v28;

      objc_msgSend(*((id *)v71 + 6), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(*((id *)v71 + 6), "setDistribution:", 0);
      v30 = objc_msgSend(v71, "_stateStackViewAxis");
      objc_msgSend(*((id *)v71 + 6), "setAxis:", v30);
      objc_msgSend(*((id *)v71 + 2), "addArrangedSubview:", *((_QWORD *)v71 + 6));
    }
    else
    {
      objc_msgSend(*((id *)v71 + 2), "addArrangedSubview:", *((_QWORD *)v71 + 3));
    }
    objc_msgSend(*((id *)v71 + 2), "addArrangedSubview:", *((_QWORD *)v71 + 5));
    objc_msgSend(v71, "addSubview:", *((_QWORD *)v71 + 2));
    if (*((_QWORD *)v71 + 1))
    {
      objc_msgSend(v71, "addSubview:", *((_QWORD *)v71 + 1));
      v63 = v71;
      v65 = objc_msgSend(*((id *)v71 + 1), "widthAnchor");
      v64 = objc_msgSend(v65, "constraintEqualToConstant:", 29.0);
      v73[0] = v64;
      v62 = objc_msgSend(*((id *)v71 + 1), "heightAnchor");
      v59 = objc_msgSend(v62, "constraintEqualToConstant:", 29.0);
      v73[1] = v59;
      v31 = objc_msgSend(*((id *)v71 + 1), "leadingAnchor");
      v32 = objc_msgSend(v71, "leadingAnchor");
      v33 = objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, 6.0);
      v73[2] = v33;
      v34 = objc_msgSend(*((id *)v71 + 1), "topAnchor");
      v35 = objc_msgSend(v71, "topAnchor");
      v36 = objc_msgSend(v34, "constraintEqualToAnchor:", v35);
      v73[3] = v36;
      v37 = objc_msgSend(*((id *)v71 + 2), "leadingAnchor");
      v38 = objc_msgSend(*((id *)v71 + 1), "trailingAnchor");
      v39 = objc_msgSend(v37, "constraintEqualToAnchor:constant:", v38, 19.0);
      v73[4] = v39;
      v40 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v73, 5);
      objc_msgSend(v63, "addConstraints:", v40);

    }
    else
    {
      v41 = v71;
      v42 = objc_msgSend(*((id *)v71 + 2), "leadingAnchor");
      v43 = objc_msgSend(v71, "leadingAnchor");
      v44 = objc_msgSend(v42, "constraintEqualToAnchor:constant:", v43, 54.0);
      objc_msgSend(v41, "addConstraint:", v44);

    }
    v61 = objc_msgSend(*((id *)v71 + 2), "trailingAnchor", v71);
    v60 = objc_msgSend(v71, "trailingAnchor");
    v58 = objc_msgSend(v61, "constraintEqualToAnchor:");
    v72[0] = v58;
    v45 = objc_msgSend(*((id *)v71 + 2), "centerYAnchor");
    v46 = objc_msgSend(v71, "centerYAnchor");
    v47 = objc_msgSend(v45, "constraintEqualToAnchor:", v46);
    v72[1] = v47;
    v48 = objc_msgSend(*((id *)v71 + 2), "topAnchor");
    v49 = objc_msgSend(v71, "topAnchor");
    v50 = objc_msgSend(v48, "constraintEqualToAnchor:", v49);
    v72[2] = v50;
    v51 = objc_msgSend(*((id *)v71 + 2), "bottomAnchor");
    v52 = objc_msgSend(v71, "bottomAnchor");
    v53 = objc_msgSend(v51, "constraintEqualToAnchor:", v52);
    v72[3] = v53;
    v54 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v72, 4);
    objc_msgSend(v57, "addConstraints:", v54);

  }
  v55 = (BuddyExpressSetupFeatureCardCell *)v71;
  objc_storeStrong(&obj, 0);
  objc_storeStrong(&v68, 0);
  objc_storeStrong(&v69, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v71, 0);
  return v55;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v3;
  UILabel *v4;
  id v5;
  UILabel *v6;
  id v7;
  UILabel *v8;
  id v9;
  objc_super v10;
  id location[2];
  BuddyExpressSetupFeatureCardCell *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10.receiver = v12;
  v10.super_class = (Class)BuddyExpressSetupFeatureCardCell;
  -[BuddyExpressSetupFeatureCardCell traitCollectionDidChange:](&v10, "traitCollectionDidChange:", location[0]);
  v3 = -[BuddyExpressSetupFeatureCardCell _titleFont](v12, "_titleFont");
  v4 = -[BuddyExpressSetupFeatureCardCell titleLabel](v12, "titleLabel");
  -[UILabel setFont:](v4, "setFont:", v3);

  v5 = -[BuddyExpressSetupFeatureCardCell _bodyFont](v12, "_bodyFont");
  v6 = -[BuddyExpressSetupFeatureCardCell stateLabel](v12, "stateLabel");
  -[UILabel setFont:](v6, "setFont:", v5);

  v7 = -[BuddyExpressSetupFeatureCardCell _bodyFont](v12, "_bodyFont");
  v8 = -[BuddyExpressSetupFeatureCardCell subtitleLabel](v12, "subtitleLabel");
  -[UILabel setFont:](v8, "setFont:", v7);

  v9 = -[BuddyExpressSetupFeatureCardCell _stateStackViewAxis](v12, "_stateStackViewAxis");
  -[UIStackView setAxis:](v12->_stateStackView, "setAxis:", v9);
  objc_storeStrong(location, 0);
}

- (id)_titleFont
{
  UIFontDescriptor *v2;
  UIFont *v3;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  v2 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleSubheadline);
  location[0] = -[UIFontDescriptor fontDescriptorWithSymbolicTraits:](v2, "fontDescriptorWithSymbolicTraits:", 2);

  v3 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", location[0], 0.0);
  objc_storeStrong(location, 0);
  return v3;
}

- (id)_stateFont
{
  UIFontDescriptor *v2;
  UIFont *v3;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  v2 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleFootnote);
  location[0] = -[UIFontDescriptor fontDescriptorWithSymbolicTraits:](v2, "fontDescriptorWithSymbolicTraits:", 2);

  v3 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", location[0], 0.0);
  objc_storeStrong(location, 0);
  return v3;
}

- (id)_bodyFont
{
  UIFontDescriptor *v2;
  UIFont *v3;

  v2 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleSubheadline, a2, self);
  v3 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v2, 0.0);

  return v3;
}

- (int64_t)_stateStackViewAxis
{
  UIApplication *v2;
  NSString *v3;
  BOOL IsAccessibilityCategory;

  v2 = +[UIApplication sharedApplication](UIApplication, "sharedApplication");
  v3 = -[UIApplication preferredContentSizeCategory](v2, "preferredContentSizeCategory");
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (void)setAccessoryView:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryView, a3);
}

- (UIStackView)labelContainer
{
  return self->_labelContainer;
}

- (void)setLabelContainer:(id)a3
{
  objc_storeStrong((id *)&self->_labelContainer, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)stateLabel
{
  return self->_stateLabel;
}

- (void)setStateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_stateLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UIStackView)stateStackView
{
  return self->_stateStackView;
}

- (void)setStateStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stateStackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateStackView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_stateLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_labelContainer, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
}

@end
