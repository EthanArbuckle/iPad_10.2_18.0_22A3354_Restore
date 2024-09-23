@implementation CPSPermissionItemView

- (CPSPermissionItemView)initWithTitle:(id)a3 label:(id)a4 description:(id)a5
{
  id v8;
  id v9;
  id v10;
  CPSPermissionItemView *v11;
  CPSPermissionItemView *v12;
  id v13;
  CPSVibrantLabel *v14;
  CPSVibrantLabel *v15;
  id v16;
  CPSVibrantLabel *v17;
  CPSVibrantLabel *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  CPSPermissionItemView *v28;
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
  CPSVibrantLabel *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  CPSPermissionItemView *v53;
  objc_super v54;
  _QWORD v55[10];

  v55[8] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v54.receiver = self;
  v54.super_class = (Class)CPSPermissionItemView;
  v11 = -[CPSPermissionItemView initWithFrame:](&v54, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v12 = v11;
  if (v11)
  {
    -[CPSPermissionItemView setAxis:](v11, "setAxis:", 1);
    -[CPSPermissionItemView setSpacing:](v12, "setSpacing:", 10.0);
    v53 = v12;
    v13 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    v14 = [CPSVibrantLabel alloc];
    v15 = -[CPSVibrantLabel initWithTextStyle:textVariant:vibrancyEffectStyle:](v14, "initWithTextStyle:textVariant:vibrancyEffectStyle:", *MEMORY[0x1E0CEB558], 256, 1);
    -[CPSVibrantLabel setTranslatesAutoresizingMaskIntoConstraints:](v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPSVibrantLabel setText:](v15, "setText:", v8);
    -[CPSVibrantLabel setAdjustsFontSizeToFitWidth:](v15, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v13, "addSubview:", v15);
    -[CPSPermissionItemView addArrangedSubview:](v12, "addArrangedSubview:", v13);
    -[CPSPermissionItemView setUpSwitchWithLabel:](v12, "setUpSwitchWithLabel:", v9);
    v16 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    v17 = [CPSVibrantLabel alloc];
    v18 = -[CPSVibrantLabel initWithTextStyle:textVariant:vibrancyEffectStyle:](v17, "initWithTextStyle:textVariant:vibrancyEffectStyle:", *MEMORY[0x1E0CEB548], 256, 1);
    -[CPSVibrantLabel setTranslatesAutoresizingMaskIntoConstraints:](v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPSVibrantLabel setNumberOfLines:](v18, "setNumberOfLines:", 0);
    -[CPSVibrantLabel setText:](v18, "setText:", v10);
    objc_msgSend(v16, "addSubview:", v18);
    -[CPSPermissionItemView addArrangedSubview:](v53, "addArrangedSubview:", v16);
    v39 = (void *)MEMORY[0x1E0CB3718];
    -[CPSVibrantLabel topAnchor](v15, "topAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "topAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v50);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v49;
    -[CPSVibrantLabel leadingAnchor](v15, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:constant:", v45, 10.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v44;
    v48 = v15;
    -[CPSVibrantLabel trailingAnchor](v15, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v13;
    objc_msgSend(v13, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v42);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v55[2] = v41;
    -[CPSVibrantLabel bottomAnchor](v15, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v38);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v55[3] = v36;
    -[CPSVibrantLabel topAnchor](v18, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v55[4] = v33;
    -[CPSVibrantLabel leadingAnchor](v18, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, 10.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v55[5] = v30;
    -[CPSVibrantLabel trailingAnchor](v18, "trailingAnchor");
    v52 = v8;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v16;
    objc_msgSend(v16, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v55[6] = v21;
    -[CPSVibrantLabel bottomAnchor](v18, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bottomAnchor");
    v23 = v10;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v55[7] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 8);
    v26 = v9;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "activateConstraints:", v27);

    v9 = v26;
    v12 = v53;

    v10 = v23;
    v8 = v52;

    v53->_blurEffectNeedsUpdate = 1;
    v28 = v53;

  }
  return v12;
}

- (CPSPermissionItemView)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("-[CPSPermissionItemView init:] is not available."), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CPSPermissionItemView)initWithFrame:(CGRect)a3
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("-[CPSPermissionItemView initWithFrame:] is not available."), 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CPSPermissionItemView)initWithCoder:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("-[CPSPermissionItemView initWithCoder:] is not available."), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (void)setUpSwitchWithLabel:(id)a3
{
  id v4;
  CPSVibrantLabel *v5;
  CPSVibrantLabel *v6;
  CPSVibrantLabel *v7;
  UIVisualEffectView *v8;
  UIVisualEffectView *switchWithLabelVisualEffectView;
  UIView *v10;
  UIView *switchWithLabelBackgroundView;
  void *v12;
  void *v13;
  UISwitch *v14;
  UISwitch *permissionSwitch;
  double v16;
  id v17;
  UISwitch *v18;
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
  CPSVibrantLabel *v48;
  _QWORD v49[8];
  _QWORD v50[4];

  v50[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [CPSVibrantLabel alloc];
  v6 = -[CPSVibrantLabel initWithTextStyle:textVariant:vibrancyEffectStyle:](v5, "initWithTextStyle:textVariant:vibrancyEffectStyle:", *MEMORY[0x1E0CEB590], 256, 0);
  -[CPSVibrantLabel setNumberOfLines:](v6, "setNumberOfLines:", 0);
  v7 = v6;
  v48 = v6;
  -[CPSVibrantLabel setText:](v6, "setText:", v4);

  v8 = (UIVisualEffectView *)objc_opt_new();
  switchWithLabelVisualEffectView = self->_switchWithLabelVisualEffectView;
  self->_switchWithLabelVisualEffectView = v8;

  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_switchWithLabelVisualEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIVisualEffectView _setContinuousCornerRadius:](self->_switchWithLabelVisualEffectView, "_setContinuousCornerRadius:", 12.0);
  v10 = (UIView *)objc_opt_new();
  switchWithLabelBackgroundView = self->_switchWithLabelBackgroundView;
  self->_switchWithLabelBackgroundView = v10;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_switchWithLabelBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemGroupedBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_switchWithLabelBackgroundView, "setBackgroundColor:", v12);

  -[UIView _setContinuousCornerRadius:](self->_switchWithLabelBackgroundView, "_setContinuousCornerRadius:", 12.0);
  -[UIVisualEffectView contentView](self->_switchWithLabelVisualEffectView, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", self->_switchWithLabelBackgroundView);

  v14 = (UISwitch *)objc_opt_new();
  permissionSwitch = self->_permissionSwitch;
  self->_permissionSwitch = v14;

  LODWORD(v16) = 1148846080;
  -[UISwitch setContentCompressionResistancePriority:forAxis:](self->_permissionSwitch, "setContentCompressionResistancePriority:forAxis:", 0, v16);
  v17 = objc_alloc(MEMORY[0x1E0CEA9E0]);
  v18 = self->_permissionSwitch;
  v50[0] = v7;
  v50[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v17, "initWithArrangedSubviews:", v19);

  objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v20, "setAxis:", 0);
  objc_msgSend(v20, "setAlignment:", 3);
  -[UIVisualEffectView contentView](self->_switchWithLabelVisualEffectView, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", v20);

  v38 = (void *)MEMORY[0x1E0CB3718];
  -[UIView topAnchor](self->_switchWithLabelBackgroundView, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView topAnchor](self->_switchWithLabelVisualEffectView, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v45;
  -[UIView leadingAnchor](self->_switchWithLabelBackgroundView, "leadingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView leadingAnchor](self->_switchWithLabelVisualEffectView, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v42;
  -[UIView trailingAnchor](self->_switchWithLabelBackgroundView, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView trailingAnchor](self->_switchWithLabelVisualEffectView, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v39;
  -[UIView bottomAnchor](self->_switchWithLabelBackgroundView, "bottomAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView bottomAnchor](self->_switchWithLabelVisualEffectView, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v35;
  objc_msgSend(v20, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView topAnchor](self->_switchWithLabelVisualEffectView, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, 10.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v49[4] = v32;
  objc_msgSend(v20, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView leadingAnchor](self->_switchWithLabelVisualEffectView, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, 10.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v49[5] = v29;
  -[UIVisualEffectView trailingAnchor](self->_switchWithLabelVisualEffectView, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, 10.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v49[6] = v24;
  -[UIVisualEffectView bottomAnchor](self->_switchWithLabelVisualEffectView, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, 10.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v49[7] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "activateConstraints:", v28);

  -[CPSPermissionItemView addArrangedSubview:](self, "addArrangedSubview:", self->_switchWithLabelVisualEffectView);
}

- (void)layoutSubviews
{
  double v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPSPermissionItemView;
  -[CPSPermissionItemView layoutSubviews](&v5, sel_layoutSubviews);
  if (self->_blurEffectNeedsUpdate)
  {
    self->_blurEffectNeedsUpdate = 0;
    v3 = 0.0;
    if (!self->_hasBlurEffect)
      v3 = 1.0;
    -[UIView setAlpha:](self->_switchWithLabelBackgroundView, "setAlpha:", v3);
    if (self->_hasBlurEffect)
    {
      objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 8);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView setEffect:](self->_switchWithLabelVisualEffectView, "setEffect:", v4);

    }
    else
    {
      -[UIVisualEffectView setEffect:](self->_switchWithLabelVisualEffectView, "setEffect:", 0);
    }
  }
}

- (void)setHasBlurEffect:(BOOL)a3
{
  if (self->_hasBlurEffect != a3)
  {
    -[CPSPermissionItemView layoutIfNeeded](self, "layoutIfNeeded");
    self->_hasBlurEffect = a3;
    self->_blurEffectNeedsUpdate = 1;
    -[CPSPermissionItemView setNeedsLayout](self, "setNeedsLayout");
    -[CPSPermissionItemView layoutSubviews](self, "layoutSubviews");
  }
}

- (BOOL)isOn
{
  return -[UISwitch isOn](self->_permissionSwitch, "isOn");
}

- (void)setOn:(BOOL)a3
{
  -[UISwitch setOn:](self->_permissionSwitch, "setOn:", a3);
}

- (BOOL)hasBlurEffect
{
  return self->_hasBlurEffect;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_permissionSwitch, 0);
  objc_storeStrong((id *)&self->_switchWithLabelBackgroundView, 0);
  objc_storeStrong((id *)&self->_switchWithLabelVisualEffectView, 0);
}

@end
