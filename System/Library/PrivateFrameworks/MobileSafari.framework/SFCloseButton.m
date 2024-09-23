@implementation SFCloseButton

- (SFCloseButton)initWithStyle:(int64_t)a3 primaryAction:(id)a4
{
  id v6;
  SFCloseButton *v7;
  SFCloseButton *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  UIVisualEffectView *blurEffectView;
  uint64_t v13;
  UIVisualEffectView *vibrantEffectView;
  void *v15;
  uint64_t v16;
  UIImageView *imageView;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  UIImageView *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  UIImageView *opaqueImageView;
  void *v45;
  UIView *v46;
  UIView *opaqueBackgroundView;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  SFCloseButton *v66;
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
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  void *v109;
  int64_t v110;
  id v111;
  void *v112;
  void *v113;
  objc_super v114;
  _QWORD v115[12];
  _QWORD v116[6];
  _QWORD v117[4];

  v117[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v114.receiver = self;
  v114.super_class = (Class)SFCloseButton;
  v7 = -[SFCloseButton initWithFrame:](&v114, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v8 = v7;
  if (!v7)
    goto LABEL_16;
  if ((unint64_t)(a3 - 1) < 2)
  {
    v111 = v6;
    -[SFCloseButton _setContinuousCornerRadius:](v7, "_setContinuousCornerRadius:", 1.79769313e308);
    if (a3 == 1)
      v9 = 10;
    else
      v9 = 8;
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v10);
    blurEffectView = v8->_blurEffectView;
    v8->_blurEffectView = (UIVisualEffectView *)v11;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v8->_blurEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIVisualEffectView setUserInteractionEnabled:](v8->_blurEffectView, "setUserInteractionEnabled:", 0);
    -[SFCloseButton addSubview:](v8, "addSubview:", v8->_blurEffectView);
    v109 = (void *)v10;
    objc_msgSend(MEMORY[0x1E0DC3F08], "effectForBlurEffect:style:", v10, 1);
    v108 = objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v108);
    vibrantEffectView = v8->_vibrantEffectView;
    v8->_vibrantEffectView = (UIVisualEffectView *)v13;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v8->_vibrantEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIVisualEffectView setUserInteractionEnabled:](v8->_vibrantEffectView, "setUserInteractionEnabled:", 0);
    -[SFCloseButton addSubview:](v8, "addSubview:", v8->_vibrantEffectView);
    -[UIVisualEffectView contentView](v8->_vibrantEffectView, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCloseButton _makeXmarkImageView](v8, "_makeXmarkImageView");
    v16 = objc_claimAutoreleasedReturnValue();
    imageView = v8->_imageView;
    v8->_imageView = (UIImageView *)v16;

    v110 = a3;
    if (a3 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x1E0DC4918]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4AB8], v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0DC3888];
      objc_msgSend(v19, "pointSize");
      objc_msgSend(v20, "configurationWithPointSize:weight:scale:", 7, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIImageView setPreferredSymbolConfiguration:](v8->_imageView, "setPreferredSymbolConfiguration:", v21);
      v22 = 22.0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 7, 2, 15.0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setPreferredSymbolConfiguration:](v8->_imageView, "setPreferredSymbolConfiguration:", v42);

      -[SFCloseButton _makeXmarkImageView](v8, "_makeXmarkImageView");
      v43 = objc_claimAutoreleasedReturnValue();
      opaqueImageView = v8->_opaqueImageView;
      v8->_opaqueImageView = (UIImageView *)v43;

      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 7, 2, 15.0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setPreferredSymbolConfiguration:](v8->_opaqueImageView, "setPreferredSymbolConfiguration:", v45);

      v46 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      opaqueBackgroundView = v8->_opaqueBackgroundView;
      v8->_opaqueBackgroundView = v46;

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v8->_opaqueBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v8->_opaqueBackgroundView, "setBackgroundColor:", v48);

      -[UIView setUserInteractionEnabled:](v8->_opaqueBackgroundView, "setUserInteractionEnabled:", 0);
      -[UIView setAlpha:](v8->_opaqueBackgroundView, "setAlpha:", 0.0);
      -[UIView addSubview:](v8->_opaqueBackgroundView, "addSubview:", v8->_opaqueImageView);
      -[SFCloseButton addSubview:](v8, "addSubview:", v8->_opaqueBackgroundView);
      v93 = (void *)MEMORY[0x1E0CB3718];
      -[UIView centerXAnchor](v8->_opaqueBackgroundView, "centerXAnchor");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCloseButton centerXAnchor](v8, "centerXAnchor");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "constraintEqualToAnchor:", v105);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v116[0] = v103;
      -[UIView centerYAnchor](v8->_opaqueBackgroundView, "centerYAnchor");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCloseButton centerYAnchor](v8, "centerYAnchor");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "constraintEqualToAnchor:", v99);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v116[1] = v97;
      -[UIView widthAnchor](v8->_opaqueBackgroundView, "widthAnchor");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCloseButton widthAnchor](v8, "widthAnchor");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "constraintEqualToAnchor:", v91);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v116[2] = v87;
      -[UIView heightAnchor](v8->_opaqueBackgroundView, "heightAnchor");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCloseButton heightAnchor](v8, "heightAnchor");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "constraintEqualToAnchor:", v83);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v116[3] = v81;
      -[UIImageView centerXAnchor](v8->_opaqueImageView, "centerXAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView centerXAnchor](v8->_opaqueBackgroundView, "centerXAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "constraintEqualToAnchor:", v50);
      v113 = v15;
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v116[4] = v51;
      -[UIImageView centerYAnchor](v8->_opaqueImageView, "centerYAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView centerYAnchor](v8->_opaqueBackgroundView, "centerYAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "constraintEqualToAnchor:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v116[5] = v54;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 6);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "activateConstraints:", v55);

      v21 = v89;
      v15 = v113;

      v22 = 30.0;
    }

    objc_msgSend(v15, "addSubview:", v8->_imageView);
    v88 = (void *)MEMORY[0x1E0CB3718];
    -[UIVisualEffectView centerXAnchor](v8->_blurEffectView, "centerXAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCloseButton centerXAnchor](v8, "centerXAnchor");
    v94 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "constraintEqualToAnchor:", v94);
    v92 = objc_claimAutoreleasedReturnValue();
    v115[0] = v92;
    -[UIVisualEffectView centerYAnchor](v8->_blurEffectView, "centerYAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCloseButton centerYAnchor](v8, "centerYAnchor");
    v79 = objc_claimAutoreleasedReturnValue();
    v112 = v56;
    objc_msgSend(v56, "constraintEqualToAnchor:", v79);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v115[1] = v107;
    -[UIVisualEffectView widthAnchor](v8->_blurEffectView, "widthAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCloseButton widthAnchor](v8, "widthAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "constraintEqualToAnchor:", v104);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v115[2] = v102;
    -[UIVisualEffectView heightAnchor](v8->_blurEffectView, "heightAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCloseButton heightAnchor](v8, "heightAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "constraintEqualToAnchor:", v98);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v115[3] = v96;
    -[UIVisualEffectView centerXAnchor](v8->_vibrantEffectView, "centerXAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCloseButton centerXAnchor](v8, "centerXAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "constraintEqualToAnchor:", v84);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v115[4] = v82;
    -[UIVisualEffectView centerYAnchor](v8->_vibrantEffectView, "centerYAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCloseButton centerYAnchor](v8, "centerYAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:", v78);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v115[5] = v77;
    -[UIVisualEffectView widthAnchor](v8->_vibrantEffectView, "widthAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCloseButton widthAnchor](v8, "widthAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintEqualToAnchor:", v75);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v115[6] = v74;
    -[UIVisualEffectView heightAnchor](v8->_vibrantEffectView, "heightAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCloseButton heightAnchor](v8, "heightAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToAnchor:", v72);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v115[7] = v71;
    -[UIImageView centerXAnchor](v8->_imageView, "centerXAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "centerXAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:", v69);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v115[8] = v68;
    -[UIImageView centerYAnchor](v8->_imageView, "centerYAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "centerYAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v115[9] = v59;
    -[SFCloseButton widthAnchor](v8, "widthAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToConstant:", v22);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v115[10] = v61;
    -[SFCloseButton heightAnchor](v8, "heightAnchor");
    v62 = v15;
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToConstant:", v22);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v115[11] = v64;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 12);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "activateConstraints:", v65);

    v41 = (void *)v79;
    v35 = v62;
    v36 = v86;

    v38 = (void *)v92;
    v37 = (void *)v94;

    a3 = v110;
    v6 = v111;
    v34 = (void *)v108;
    v23 = v109;
    goto LABEL_12;
  }
  if (!a3)
  {
    v23 = objc_alloc_init(MEMORY[0x1E0DC3F58]);
    -[SFCloseButton bounds](v8, "bounds");
    objc_msgSend(v23, "setFrame:");
    objc_msgSend(v23, "setAutoresizingMask:", 18);
    v24 = (void *)MEMORY[0x1E0DC3F08];
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "effectForBlurEffect:style:", v25, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setEffect:", v26);

    objc_msgSend(v23, "setUserInteractionEnabled:", 0);
    -[SFCloseButton addSubview:](v8, "addSubview:", v23);
    v27 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark.circle.fill"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "initWithImage:", v28);
    v30 = v8->_imageView;
    v8->_imageView = (UIImageView *)v29;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v8->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3888], "_sf_staticConfigurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v8->_imageView, "setPreferredSymbolConfiguration:", v31);

    -[UIImageView _sf_setMatchesIntrinsicContentSize](v8->_imageView, "_sf_setMatchesIntrinsicContentSize");
    objc_msgSend(v23, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addSubview:", v8->_imageView);

    v33 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView centerYAnchor](v8->_imageView, "centerYAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "centerYAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v117[0] = v36;
    -[UIImageView centerXAnchor](v8->_imageView, "centerXAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "centerXAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v38);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v117[1] = v112;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 2);
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = v33;
    v41 = (void *)v39;
    objc_msgSend(v40, "activateConstraints:", v39);
LABEL_12:

  }
  v8->_style = a3;
  if (v6)
    -[SFCloseButton addAction:forControlEvents:](v8, "addAction:forControlEvents:", v6, 0x2000);
  v66 = v8;
LABEL_16:

  return v8;
}

- (id)_makeXmarkImageView
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0DC3890]);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithImage:", v3);

  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v5);

  objc_msgSend(v4, "_sf_setMatchesIntrinsicContentSize");
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;
  CGRect v5;

  v3.receiver = self;
  v3.super_class = (Class)SFCloseButton;
  -[SFCloseButton layoutSubviews](&v3, sel_layoutSubviews);
  -[SFCloseButton bounds](self, "bounds");
  -[UIVisualEffectView _setContinuousCornerRadius:](self->_blurEffectView, "_setContinuousCornerRadius:", CGRectGetWidth(v4) * 0.5);
  -[SFCloseButton bounds](self, "bounds");
  -[UIView _setContinuousCornerRadius:](self->_opaqueBackgroundView, "_setContinuousCornerRadius:", CGRectGetWidth(v5) * 0.5);
}

- (UIImageView)imageView
{
  UIImageView **p_opaqueImageView;
  double v4;

  p_opaqueImageView = &self->_opaqueImageView;
  -[UIImageView alpha](self->_opaqueImageView, "alpha");
  if (v4 == 0.0)
    p_opaqueImageView = &self->_imageView;
  return *p_opaqueImageView;
}

- (void)setOpaqueBackgroundVisibility:(double)a3
{
  double v5;

  if (self->_style == 2 && self->_opaqueBackgroundVisibility != a3)
  {
    self->_opaqueBackgroundVisibility = a3;
    -[UIView setAlpha:](self->_opaqueBackgroundView, "setAlpha:", a3);
    v5 = 1.0 - a3;
    -[UIVisualEffectView setAlpha:](self->_vibrantEffectView, "setAlpha:", v5);
    -[UIVisualEffectView setAlpha:](self->_blurEffectView, "setAlpha:", v5);
  }
}

- (double)opaqueBackgroundVisibility
{
  return self->_opaqueBackgroundVisibility;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opaqueBackgroundView, 0);
  objc_storeStrong((id *)&self->_opaqueImageView, 0);
  objc_storeStrong((id *)&self->_vibrantEffectView, 0);
  objc_storeStrong((id *)&self->_blurEffectView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
