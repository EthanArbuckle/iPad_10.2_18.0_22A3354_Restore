@implementation TabExplanationView

- (id)_basicLabel
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc(MEMORY[0x1E0DC3990]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v3, "setTextAlignment:", 1);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setOpaque:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "sf_colorNamed:", CFSTR("TabExplanationLabelColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v5);

  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BD0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCompositingFilter:", v6);

  return v3;
}

- (TabExplanationView)initWithVariant:(unint64_t)a3 query:(id)a4
{
  id v6;
  TabExplanationView *v7;
  id v8;
  uint64_t v9;
  UIView *labelsContainer;
  void *v11;
  uint64_t v12;
  UILabel *title;
  UILabel *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  UILabel *message;
  UILabel *v20;
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
  uint64_t v32;
  NSArray *defaultHorizontalPaddingConstraints;
  uint64_t v34;
  NSArray *accessibilityHorizontalPaddingConstraints;
  void *v36;
  void *v37;
  double v38;
  uint64_t v39;
  NSLayoutConstraint *spaceBetweenTitleAndMessageConstraint;
  UIView *v41;
  void *v42;
  UIView *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  UIView *v51;
  void *v52;
  void *v53;
  void *v54;
  UIView *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  TabExplanationView *v63;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  unint64_t v73;
  objc_super v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD v77[2];
  _QWORD v78[6];

  v78[4] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v74.receiver = self;
  v74.super_class = (Class)TabExplanationView;
  v7 = -[TabExplanationView initWithFrame:](&v74, sel_initWithFrame_, 0.0, 0.0, 320.0, 300.0);
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v9 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    labelsContainer = v7->_labelsContainer;
    v7->_labelsContainer = (UIView *)v9;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v7->_labelsContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView layer](v7->_labelsContainer, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsGroupBlending:", 0);

    -[TabExplanationView addSubview:](v7, "addSubview:", v7->_labelsContainer);
    -[TabExplanationView _basicLabel](v7, "_basicLabel");
    v12 = objc_claimAutoreleasedReturnValue();
    title = v7->_title;
    v7->_title = (UILabel *)v12;

    v14 = v7->_title;
    objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", *MEMORY[0x1E0DC4B50]);
    v72 = v6;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 27.0);
    v73 = a3;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scaledFontForFont:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v14, "setFont:", v17);

    -[UILabel setAdjustsFontForContentSizeCategory:](v7->_title, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setNumberOfLines:](v7->_title, "setNumberOfLines:", 0);
    -[UIView addSubview:](v7->_labelsContainer, "addSubview:", v7->_title);
    -[TabExplanationView _basicLabel](v7, "_basicLabel");
    v18 = objc_claimAutoreleasedReturnValue();
    message = v7->_message;
    v7->_message = (UILabel *)v18;

    v20 = v7->_message;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v20, "setFont:", v21);

    -[UILabel setAdjustsFontForContentSizeCategory:](v7->_message, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setNumberOfLines:](v7->_message, "setNumberOfLines:", 0);
    -[UIView addSubview:](v7->_labelsContainer, "addSubview:", v7->_message);
    -[TabExplanationView _updateLabelBlendMode](v7, "_updateLabelBlendMode");
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7->_labelsContainer, 9, 0, v7, 9, 1.0, 0.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabExplanationView addConstraint:](v7, "addConstraint:", v22);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7->_labelsContainer, 10, 0, v7, 10, 1.0, 0.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabExplanationView addConstraint:](v7, "addConstraint:", v23);

    v65 = (void *)MEMORY[0x1E0CB3718];
    -[UIView leadingAnchor](v7->_labelsContainer, "leadingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabExplanationView leadingAnchor](v7, "leadingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintGreaterThanOrEqualToAnchor:", v69);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = v68;
    -[UIView trailingAnchor](v7->_labelsContainer, "trailingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabExplanationView trailingAnchor](v7, "trailingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintLessThanOrEqualToAnchor:", v66);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v78[1] = v24;
    -[UIView topAnchor](v7->_labelsContainer, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabExplanationView topAnchor](v7, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintGreaterThanOrEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v78[2] = v27;
    -[UIView bottomAnchor](v7->_labelsContainer, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabExplanationView bottomAnchor](v7, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintLessThanOrEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v78[3] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "activateConstraints:", v31);

    _NSDictionaryOfVariableBindings((NSString *)CFSTR("_labelsContainer"), v7->_labelsContainer, 0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(>=horizontalPadding)-[_labelsContainer]-(>=horizontalPadding)-|"), 0, &unk_1E9D62720, v71);
    v32 = objc_claimAutoreleasedReturnValue();
    defaultHorizontalPaddingConstraints = v7->_defaultHorizontalPaddingConstraints;
    v7->_defaultHorizontalPaddingConstraints = (NSArray *)v32;

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[_labelsContainer]-|"), 0, 0, v71);
    v34 = objc_claimAutoreleasedReturnValue();
    accessibilityHorizontalPaddingConstraints = v7->_accessibilityHorizontalPaddingConstraints;
    v7->_accessibilityHorizontalPaddingConstraints = (NSArray *)v34;

    -[UILabel topAnchor](v7->_message, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v7->_title, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 18.0;
    if (v73 == 2)
      v38 = 10.0;
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, v38);
    v39 = objc_claimAutoreleasedReturnValue();
    spaceBetweenTitleAndMessageConstraint = v7->_spaceBetweenTitleAndMessageConstraint;
    v7->_spaceBetweenTitleAndMessageConstraint = (NSLayoutConstraint *)v39;

    -[NSLayoutConstraint setActive:](v7->_spaceBetweenTitleAndMessageConstraint, "setActive:", 1);
    v41 = v7->_labelsContainer;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7->_title, 3, 0, v41, 3, 1.0, 0.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v41, "addConstraint:", v42);

    v43 = v7->_labelsContainer;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7->_message, 4, 0, v43, 4, 1.0, 0.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v43, "addConstraint:", v44);

    v45 = (void *)MEMORY[0x1E0CB3718];
    -[UIView widthAnchor](v7->_labelsContainer, "widthAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintGreaterThanOrEqualToConstant:", 124.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = v47;
    -[UIView widthAnchor](v7->_labelsContainer, "widthAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintLessThanOrEqualToConstant:", 439.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v77[1] = v49;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 2);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "activateConstraints:", v50);

    v51 = v7->_labelsContainer;
    v52 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings((NSString *)CFSTR("_title"), v7->_title, 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_title]|"), 0, 0, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraints:](v51, "addConstraints:", v54);

    v55 = v7->_labelsContainer;
    v56 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings((NSString *)CFSTR("_message"), v7->_message, 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_message]|"), 0, 0, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraints:](v55, "addConstraints:", v58);

    v6 = v72;
    -[TabExplanationView setVariant:query:](v7, "setVariant:query:", v73, v72);
    v76 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (id)-[TabExplanationView registerForTraitChanges:withTarget:action:](v7, "registerForTraitChanges:withTarget:action:", v59, v7, sel_setNeedsUpdateConstraints);

    v75 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (id)-[TabExplanationView registerForTraitChanges:withTarget:action:](v7, "registerForTraitChanges:withTarget:action:", v61, v7, sel__updateLabelBlendMode);

    v63 = v7;
  }

  return v7;
}

- (void)setVariant:(unint64_t)a3 query:(id)a4
{
  void *v6;
  double v7;
  void *v8;
  id v9;

  v9 = a4;
  self->_variant = a3;
  if (a3 == 2 || a3 == 1)
  {
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[UILabel setText:](self->_title, "setText:", v6);

  v7 = 18.0;
  if (a3 == 2)
    v7 = 10.0;
  -[NSLayoutConstraint setConstant:](self->_spaceBetweenTitleAndMessageConstraint, "setConstant:", v7);
  messageForVariant(a3, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_message, "setText:", v8);

}

- (void)setQuery:(id)a3
{
  id v4;

  messageForVariant(self->_variant, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_message, "setText:", v4);

}

- (CGRect)labelsContainerFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIView frame](self->_labelsContainer, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)updateConstraints
{
  void *v3;
  NSString *v4;
  _BOOL8 IsAccessibilityCategory;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TabExplanationView;
  -[TabExplanationView updateConstraints](&v6, sel_updateConstraints);
  -[TabExplanationView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  objc_msgSend(MEMORY[0x1E0CB3718], "sf_setConstraints:active:", self->_accessibilityHorizontalPaddingConstraints, IsAccessibilityCategory);
  objc_msgSend(MEMORY[0x1E0CB3718], "sf_setConstraints:active:", self->_defaultHorizontalPaddingConstraints, IsAccessibilityCategory ^ 1);
}

- (void)_updateLabelBlendMode
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;

  -[TabExplanationView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  v5 = (_QWORD *)MEMORY[0x1E0CD2BC0];
  if (v4 == 2)
    v5 = (_QWORD *)MEMORY[0x1E0CD2BD0];
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel layer](self->_title, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCompositingFilter:", v8);

  -[UILabel layer](self->_message, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCompositingFilter:", v8);

}

- (unint64_t)variant
{
  return self->_variant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityHorizontalPaddingConstraints, 0);
  objc_storeStrong((id *)&self->_defaultHorizontalPaddingConstraints, 0);
  objc_storeStrong((id *)&self->_spaceBetweenTitleAndMessageConstraint, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_labelsContainer, 0);
}

@end
