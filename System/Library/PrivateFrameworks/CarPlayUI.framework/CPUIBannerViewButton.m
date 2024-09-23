@implementation CPUIBannerViewButton

- (CPUIBannerViewButton)initWithFrame:(CGRect)a3
{
  CPUIBannerViewButton *v3;
  id v4;
  UIView *v5;
  void *v6;
  UIView *highlightView;
  UIView *v8;
  UIImageView *v9;
  UIImageView *imageView;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CPUIBannerViewButton;
  v3 = -[CPUIBannerViewButton initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6F90]);
    -[CPUIBannerViewButton bounds](v3, "bounds");
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[CPUIBannerViewButton addSubview:](v3, "addSubview:", v5);
    highlightView = v3->_highlightView;
    v3->_highlightView = v5;
    v8 = v5;

    v9 = (UIImageView *)objc_alloc_init(MEMORY[0x24BDF6AE8]);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setHidden:](v9, "setHidden:", 1);
    -[CPUIBannerViewButton addSubview:](v3, "addSubview:", v9);
    imageView = v3->_imageView;
    v3->_imageView = v9;

  }
  return v3;
}

+ (id)buttonWithOK
{
  void *v3;
  void *v4;

  CPUILocalizedStringForKey(CFSTR("BANNER_OKAY"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "buttonWithText:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)buttonWithText:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  CGFloat v9;
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
  _QWORD v49[12];
  CGRect v50;
  CGRect v51;

  v49[10] = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BDF6B68];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "setText:", v5);

  objc_msgSend(v7, "setTextAlignment:", 1);
  objc_msgSend(v7, "sizeToFit");
  v8 = objc_alloc((Class)a1);
  objc_msgSend(v7, "frame");
  v9 = CGRectGetWidth(v50) + 12.0;
  objc_msgSend(v7, "frame");
  v10 = (void *)objc_msgSend(v8, "initWithFrame:", 0.0, 0.0, v9, CGRectGetHeight(v51) + 8.0);
  objc_msgSend(v10, "setTextLabel:", v7);
  objc_msgSend(v10, "addSubview:", v7);
  objc_msgSend(v10, "_updateFontIfNecessary");
  objc_msgSend(v10, "highlightView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCornerRadius:", 6.0);

  objc_msgSend(v11, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCornerCurve:", *MEMORY[0x24BDE58E8]);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v14);

  objc_msgSend(v10, "setSelected:", 0);
  v36 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v10, "leftAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leftAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, -6.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v46;
  objc_msgSend(v10, "rightAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rightAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, 6.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v43;
  objc_msgSend(v10, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:constant:", v41, -4.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v40;
  objc_msgSend(v10, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:constant:", v38, 4.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v37;
  objc_msgSend(v10, "centerXAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "centerXAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v49[4] = v33;
  objc_msgSend(v10, "centerYAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "centerYAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v49[5] = v29;
  objc_msgSend(v11, "leftAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leftAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v49[6] = v26;
  objc_msgSend(v11, "rightAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v49[7] = v15;
  v32 = v11;
  objc_msgSend(v11, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v49[8] = v18;
  objc_msgSend(v11, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v49[9] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "activateConstraints:", v22);

  return v10;
}

+ (id)buttonWithChevronImage
{
  void *v2;
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
  _QWORD v35[10];

  v35[8] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFrame:", 0.0, 0.0, 29.0, 29.0);
  objc_msgSend(v2, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  objc_msgSend(v2, "setWantsChevronImage:", 1);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v4);

  objc_msgSend(v2, "highlightView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", 14.5);

  objc_msgSend(v2, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "centerXAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "centerXAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImageCenterConstraint:", v10);

  v25 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v2, "imageView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "centerYAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "centerYAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v31;
  objc_msgSend(v2, "imageCenterConstraint");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v30;
  objc_msgSend(v5, "widthAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToConstant:", 29.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v28;
  objc_msgSend(v5, "heightAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToConstant:", 29.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v26;
  objc_msgSend(v2, "leftAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leftAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v22;
  objc_msgSend(v2, "rightAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35[5] = v11;
  objc_msgSend(v2, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35[6] = v14;
  objc_msgSend(v2, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v35[7] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "activateConstraints:", v18);

  objc_msgSend(v2, "_setupImagesIfNecessary");
  objc_msgSend(v2, "_updateImageConstraint");
  objc_msgSend(v2, "setSelected:", 0);

  return v2;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPUIBannerViewButton;
  -[CPUIBannerViewButton setSelected:](&v9, sel_setSelected_);
  -[CPUIBannerViewButton highlightView](self, "highlightView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", !v3);

  if (v3)
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusLabelColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIBannerViewButton imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v6);

  -[CPUIBannerViewButton textLabel](self, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v6);

  -[CPUIBannerViewButton _setupImagesIfNecessary](self, "_setupImagesIfNecessary");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPUIBannerViewButton;
  -[CPUIBannerViewButton traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[CPUIBannerViewButton _updateFontIfNecessary](self, "_updateFontIfNecessary");
  -[CPUIBannerViewButton _setupImagesIfNecessary](self, "_setupImagesIfNecessary");
  -[CPUIBannerViewButton _updateImageConstraint](self, "_updateImageConstraint");
}

- (void)_setupImagesIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[CPUIBannerViewButton wantsChevronImage](self, "wantsChevronImage"))
  {
    v3 = (void *)objc_opt_class();
    -[CPUIBannerViewButton traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_chevronImageForTraitCollection:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    -[CPUIBannerViewButton imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v6);

  }
}

- (void)_updateFontIfNecessary
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  -[CPUIBannerViewButton textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDF6A78];
    v5 = *MEMORY[0x24BDF77B8];
    -[CPUIBannerViewButton traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = *MEMORY[0x24BDF78A0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7868]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *MEMORY[0x24BDF7770];
    v15 = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fontDescriptorByAddingAttributes:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v11, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIBannerViewButton textLabel](self, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFont:", v12);

  }
}

- (void)_updateImageConstraint
{
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  double v7;
  id v8;

  -[CPUIBannerViewButton traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layoutDirection");

  v5 = 0.0;
  if (v4 == 1)
  {
    -[CPUIBannerViewButton traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayScale");
    if (v7 <= 2.0)
      v5 = -2.5;
    else
      v5 = -2.0;

  }
  -[CPUIBannerViewButton imageCenterConstraint](self, "imageCenterConstraint");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstant:", v5);

}

+ (id)_chevronImageForTraitCollection:(id)a3
{
  void *v3;
  uint64_t v4;
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
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDF6A78];
  v4 = *MEMORY[0x24BDF77B8];
  v5 = a3;
  objc_msgSend(v3, "preferredFontDescriptorWithTextStyle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v6, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x24BDF78A0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7888]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = *MEMORY[0x24BDF7770];
  v18 = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontDescriptorByAddingAttributes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDF6AE0];
  objc_msgSend(v7, "pointSize");
  objc_msgSend(v12, "configurationWithPointSize:weight:scale:", 9, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configurationWithTraitCollection:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", CFSTR("chevron.forward"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightView, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (BOOL)wantsChevronImage
{
  return self->_wantsChevronImage;
}

- (void)setWantsChevronImage:(BOOL)a3
{
  self->_wantsChevronImage = a3;
}

- (NSLayoutConstraint)imageCenterConstraint
{
  return self->_imageCenterConstraint;
}

- (void)setImageCenterConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageCenterConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCenterConstraint, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
