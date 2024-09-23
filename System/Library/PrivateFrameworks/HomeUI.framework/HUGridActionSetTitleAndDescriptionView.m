@implementation HUGridActionSetTitleAndDescriptionView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUGridActionSetTitleAndDescriptionView)initWithFrame:(CGRect)a3 titleLabelSuperview:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  HUGridActionSetTitleAndDescriptionView *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HUGridActionSetTitleAndDescriptionView;
  v10 = -[HUGridActionSetTitleAndDescriptionView initWithFrame:](&v23, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0CEA700]);
    -[HUGridActionSetTitleAndDescriptionView setTitleLabel:](v10, "setTitleLabel:", v11);

    -[HUGridActionSetTitleAndDescriptionView titleLabel](v10, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v12);

    -[HUGridActionSetTitleAndDescriptionView titleLabel](v10, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUGridActionSetTitleAndDescriptionView titleLabel](v10, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNumberOfLines:", 1);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridActionSetTitleAndDescriptionView titleLabel](v10, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTextColor:", v15);

    v17 = objc_alloc_init(MEMORY[0x1E0CEA700]);
    -[HUGridActionSetTitleAndDescriptionView setDescriptionLabel:](v10, "setDescriptionLabel:", v17);

    -[HUGridActionSetTitleAndDescriptionView descriptionLabel](v10, "descriptionLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridActionSetTitleAndDescriptionView addSubview:](v10, "addSubview:", v18);

    -[HUGridActionSetTitleAndDescriptionView descriptionLabel](v10, "descriptionLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUGridActionSetTitleAndDescriptionView descriptionLabel](v10, "descriptionLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setNumberOfLines:", 1);

    -[HUGridActionSetTitleAndDescriptionView descriptionLabel](v10, "descriptionLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setHidden:", 1);

  }
  return v10;
}

- (void)updateTitleText:(id)a3 descriptionText:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v6 = a4;
  -[HUGridActionSetTitleAndDescriptionView titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributedText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v24, "isEqualToAttributedString:", v8) & 1) != 0)
  {
    -[HUGridActionSetTitleAndDescriptionView descriptionLabel](self, "descriptionLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attributedText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "isEqualToAttributedString:", v10);

    if ((v11 & 1) != 0)
      goto LABEL_9;
  }
  else
  {

  }
  -[HUGridActionSetTitleAndDescriptionView titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAttributedText:", v24);

  -[HUGridActionSetTitleAndDescriptionView descriptionLabel](self, "descriptionLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAttributedText:", v6);

  -[HUGridActionSetTitleAndDescriptionView descriptionLabel](self, "descriptionLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isHidden");

  -[HUGridActionSetTitleAndDescriptionView descriptionLabel](self, "descriptionLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "text");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length") == 0;
  -[HUGridActionSetTitleAndDescriptionView descriptionLabel](self, "descriptionLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHidden:", v18);

  -[HUGridActionSetTitleAndDescriptionView descriptionLabel](self, "descriptionLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = objc_msgSend(v20, "isHidden");

  if (v15 != (_DWORD)v17)
  {
    -[HUGridActionSetTitleAndDescriptionView titleAndDescriptionConstraints](self, "titleAndDescriptionConstraints");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = (void *)MEMORY[0x1E0CB3718];
      -[HUGridActionSetTitleAndDescriptionView titleAndDescriptionConstraints](self, "titleAndDescriptionConstraints");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "deactivateConstraints:", v23);

    }
    -[HUGridActionSetTitleAndDescriptionView setTitleAndDescriptionConstraints:](self, "setTitleAndDescriptionConstraints:", 0);
    -[HUGridActionSetTitleAndDescriptionView setTitleDescriptionSpacingConstraint:](self, "setTitleDescriptionSpacingConstraint:", 0);
    -[HUGridActionSetTitleAndDescriptionView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
LABEL_9:

}

- (void)setTitleDescriptionLineSpacing:(double)a3
{
  id v4;

  self->_titleDescriptionLineSpacing = a3;
  -[HUGridActionSetTitleAndDescriptionView titleDescriptionSpacingConstraint](self, "titleDescriptionSpacingConstraint");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstant:", a3);

}

- (void)setTitleAndDescriptionLabelTintColor:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HUGridActionSetTitleAndDescriptionView titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v4);

  -[HUGridActionSetTitleAndDescriptionView descriptionLabel](self, "descriptionLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v4);

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
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_super v42;

  -[HUGridActionSetTitleAndDescriptionView titleAndDescriptionConstraints](self, "titleAndDescriptionConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridActionSetTitleAndDescriptionView titleLabel](self, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridActionSetTitleAndDescriptionView leadingAnchor](self, "leadingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

    -[HUGridActionSetTitleAndDescriptionView titleLabel](self, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridActionSetTitleAndDescriptionView trailingAnchor](self, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v12);

    -[HUGridActionSetTitleAndDescriptionView descriptionLabel](self, "descriptionLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridActionSetTitleAndDescriptionView leadingAnchor](self, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v16);

    -[HUGridActionSetTitleAndDescriptionView descriptionLabel](self, "descriptionLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridActionSetTitleAndDescriptionView trailingAnchor](self, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v20);

    -[HUGridActionSetTitleAndDescriptionView titleLabel](self, "titleLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridActionSetTitleAndDescriptionView topAnchor](self, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v24);

    -[HUGridActionSetTitleAndDescriptionView descriptionLabel](self, "descriptionLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = objc_msgSend(v25, "isHidden");

    if ((_DWORD)v22)
    {
      -[HUGridActionSetTitleAndDescriptionView titleLabel](self, "titleLabel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "bottomAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridActionSetTitleAndDescriptionView bottomAnchor](self, "bottomAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "constraintEqualToAnchor:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v29);

    }
    else
    {
      -[HUGridActionSetTitleAndDescriptionView descriptionLabel](self, "descriptionLabel");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "bottomAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridActionSetTitleAndDescriptionView bottomAnchor](self, "bottomAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v33);

      v34 = objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials");
      -[HUGridActionSetTitleAndDescriptionView descriptionLabel](self, "descriptionLabel");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "firstBaselineAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridActionSetTitleAndDescriptionView titleLabel](self, "titleLabel");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "lastBaselineAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        -[HUGridActionSetTitleAndDescriptionView titleDescriptionLineSpacing](self, "titleDescriptionLineSpacing");
        objc_msgSend(v36, "constraintEqualToAnchor:constant:", v38);
      }
      else
      {
        objc_msgSend(v36, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v38, 1.0);
      }
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridActionSetTitleAndDescriptionView setTitleDescriptionSpacingConstraint:](self, "setTitleDescriptionSpacingConstraint:", v39);

      -[HUGridActionSetTitleAndDescriptionView titleDescriptionSpacingConstraint](self, "titleDescriptionSpacingConstraint");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v26);
    }

    -[HUGridActionSetTitleAndDescriptionView setTitleAndDescriptionConstraints:](self, "setTitleAndDescriptionConstraints:", v4);
    v40 = (void *)MEMORY[0x1E0CB3718];
    -[HUGridActionSetTitleAndDescriptionView titleAndDescriptionConstraints](self, "titleAndDescriptionConstraints");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "activateConstraints:", v41);

  }
  v42.receiver = self;
  v42.super_class = (Class)HUGridActionSetTitleAndDescriptionView;
  -[HUGridActionSetTitleAndDescriptionView updateConstraints](&v42, sel_updateConstraints);
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

- (double)titleDescriptionLineSpacing
{
  return self->_titleDescriptionLineSpacing;
}

- (NSArray)titleAndDescriptionConstraints
{
  return self->_titleAndDescriptionConstraints;
}

- (void)setTitleAndDescriptionConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_titleAndDescriptionConstraints, a3);
}

- (NSLayoutConstraint)titleDescriptionSpacingConstraint
{
  return self->_titleDescriptionSpacingConstraint;
}

- (void)setTitleDescriptionSpacingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleDescriptionSpacingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleDescriptionSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_titleAndDescriptionConstraints, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
