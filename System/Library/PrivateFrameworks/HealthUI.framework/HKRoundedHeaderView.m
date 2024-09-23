@implementation HKRoundedHeaderView

- (HKRoundedHeaderView)initWithColor:(id)a3
{
  return -[HKRoundedHeaderView initWithColor:isInteractive:](self, "initWithColor:isInteractive:", a3, 1);
}

- (HKRoundedHeaderView)initWithColor:(id)a3 isInteractive:(BOOL)a4
{
  id v7;
  HKRoundedHeaderView *v8;
  HKRoundedHeaderView *v9;
  HKGradient *gradient;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKRoundedHeaderView;
  v8 = -[HKRoundedHeaderView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = v8;
  if (v8)
  {
    gradient = v8->_gradient;
    v8->_gradient = 0;

    objc_storeStrong((id *)&v9->_color, a3);
    v9->_isInteractive = a4;
    -[HKRoundedHeaderView _setupUI](v9, "_setupUI");
    -[HKRoundedHeaderView _setupConstraints](v9, "_setupConstraints");
  }

  return v9;
}

- (HKRoundedHeaderView)initWithGradient:(id)a3
{
  id v5;
  HKRoundedHeaderView *v6;
  HKRoundedHeaderView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKRoundedHeaderView;
  v6 = -[HKRoundedHeaderView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_gradient, a3);
    v7->_isInteractive = 1;
    -[HKRoundedHeaderView _setupUI](v7, "_setupUI");
    -[HKRoundedHeaderView _setupConstraints](v7, "_setupConstraints");
  }

  return v7;
}

- (HKRoundedHeaderView)initWithFrame:(CGRect)a3
{
  void *v4;
  HKRoundedHeaderView *v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HKRoundedHeaderView initWithColor:](self, "initWithColor:", v4);

  return v5;
}

- (void)setColor:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_color, a3);
  v5 = a3;
  -[HKRoundedHeaderView setBackgroundColor:](self, "setBackgroundColor:", v5);

}

- (void)setChevronColor:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_chevronColor, a3);
  v5 = a3;
  -[HKRoundedHeaderView chevronRightImageView](self, "chevronRightImageView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v5);

}

- (void)setGradient:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_gradient, a3);
  v5 = a3;
  -[HKRoundedHeaderView gradientView](self, "gradientView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGradient:", v5);

}

- (void)setImage:(id)a3
{
  id v5;
  void *v6;

  objc_storeStrong((id *)&self->_image, a3);
  v5 = a3;
  -[HKRoundedHeaderView imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v5);

  -[HKRoundedHeaderView _updateTextConstraints](self, "_updateTextConstraints");
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
  -[HKRoundedHeaderView _updateTextLabel](self, "_updateTextLabel");
  -[HKRoundedHeaderView _updateUI](self, "_updateUI");
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
  -[HKRoundedHeaderView _updateTextLabel](self, "_updateTextLabel");
}

- (void)setDetailText:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HKRoundedHeaderView detailTextLabel](self, "detailTextLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[HKRoundedHeaderView _updateUI](self, "_updateUI");
}

- (NSString)detailText
{
  void *v2;
  void *v3;

  -[HKRoundedHeaderView detailTextLabel](self, "detailTextLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setDetailTextColor:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_detailTextColor, a3);
  v5 = a3;
  -[HKRoundedHeaderView detailTextLabel](self, "detailTextLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v5);

}

- (void)setDetailTextCompositingFilter:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  self->_detailTextCompositingFilter = (NSString *)a3;
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView detailTextLabel](self, "detailTextLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCompositingFilter:", v6);

}

- (double)textHorizontalInset
{
  return 16.0;
}

+ (double)estimatedHeight
{
  double v2;
  double v3;
  double v4;

  objc_msgSend((id)objc_opt_class(), "_topToTextFirstBaseline");
  v3 = v2;
  objc_msgSend((id)objc_opt_class(), "_textLastBaselineToBottom");
  return v3 + v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKRoundedHeaderView;
  v4 = a3;
  -[HKRoundedHeaderView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[HKRoundedHeaderView traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqualToString:", v7);
  if ((v4 & 1) == 0)
    -[HKRoundedHeaderView _updateUI](self, "_updateUI");
}

- (BOOL)_isTextLabelTruncated
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  -[HKRoundedHeaderView textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *MEMORY[0x1E0DC1138];
  v5 = v26;
  objc_msgSend((id)objc_opt_class(), "_textFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeWithAttributes:", v7);
  v9 = v8;

  -[HKRoundedHeaderView detailTextLabel](self, "detailTextLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v5;
  objc_msgSend((id)objc_opt_class(), "_detailTextFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeWithAttributes:", v13);
  v15 = v14;

  -[HKRoundedHeaderView _headerViewWidth](self, "_headerViewWidth");
  v17 = v16;
  -[HKRoundedHeaderView textHorizontalInset](self, "textHorizontalInset");
  v19 = v15 + v18 * 3.0 + 8.0;
  -[HKRoundedHeaderView chevronRightImageView](self, "chevronRightImageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "frame");
  v22 = v17 - (v19 + v21);

  return v9 > v22;
}

- (double)_headerViewWidth
{
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  -[HKRoundedHeaderView frame](self, "frame");
  if (v3 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5 + -32.0;

  }
  else
  {
    -[HKRoundedHeaderView frame](self, "frame");
    return v7;
  }
  return v6;
}

- (void)_setupUI
{
  void *v3;
  HKGradientView *v4;
  void *v5;
  HKGradientView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  UIColor *chevronColor;
  void *v40;
  void *v41;
  id v42;

  -[HKRoundedHeaderView gradient](self, "gradient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [HKGradientView alloc];
    -[HKRoundedHeaderView gradient](self, "gradient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HKGradientView initWithGradient:](v4, "initWithGradient:", v5);
    -[HKRoundedHeaderView setGradientView:](self, "setGradientView:", v6);

    -[HKRoundedHeaderView gradientView](self, "gradientView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOpaque:", 1);

    -[HKRoundedHeaderView gradientView](self, "gradientView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setClipsToBounds:", 1);

    -[HKRoundedHeaderView gradientView](self, "gradientView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HKRoundedHeaderView gradientView](self, "gradientView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKRoundedHeaderView addSubview:](self, "addSubview:", v10);
  }
  else
  {
    -[HKRoundedHeaderView color](self, "color");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKRoundedHeaderView setBackgroundColor:](self, "setBackgroundColor:", v10);
  }

  -[HKRoundedHeaderView layer](self, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerRadius:", 10.0);

  -[HKRoundedHeaderView layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMasksToBounds:", 1);

  -[HKRoundedHeaderView layer](self, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMaskedCorners:", 3);

  v14 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  -[HKRoundedHeaderView setImageView:](self, "setImageView:", v14);

  -[HKRoundedHeaderView imageView](self, "imageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setClipsToBounds:", 1);

  -[HKRoundedHeaderView imageView](self, "imageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKRoundedHeaderView imageView](self, "imageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView addSubview:](self, "addSubview:", v17);

  v18 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[HKRoundedHeaderView setTextLabel:](self, "setTextLabel:", v18);

  -[HKRoundedHeaderView textLabel](self, "textLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setNumberOfLines:", 1);

  -[HKRoundedHeaderView textLabel](self, "textLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKRoundedHeaderView textLabel](self, "textLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAdjustsFontForContentSizeCategory:", 1);

  objc_msgSend((id)objc_opt_class(), "_textFont");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView textLabel](self, "textLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFont:", v22);

  -[HKRoundedHeaderView textLabel](self, "textLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView addSubview:](self, "addSubview:", v24);

  v25 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[HKRoundedHeaderView setDetailTextLabel:](self, "setDetailTextLabel:", v25);

  -[HKRoundedHeaderView detailTextLabel](self, "detailTextLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKRoundedHeaderView detailTextLabel](self, "detailTextLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAdjustsFontForContentSizeCategory:", 1);

  objc_msgSend((id)objc_opt_class(), "_detailTextFont");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView detailTextLabel](self, "detailTextLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFont:", v28);

  if (-[UIView hk_isLeftToRight](self, "hk_isLeftToRight"))
    v30 = 2;
  else
    v30 = 0;
  -[HKRoundedHeaderView detailTextLabel](self, "detailTextLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setTextAlignment:", v30);

  -[HKRoundedHeaderView detailTextLabel](self, "detailTextLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView addSubview:](self, "addSubview:", v32);

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4A88], 2);
  v42 = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  -[HKRoundedHeaderView setChevronRightImageView:](self, "setChevronRightImageView:", v33);

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v42, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView chevronRightImageView](self, "chevronRightImageView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setPreferredSymbolConfiguration:", v34);

  if (self->_isInteractive)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("chevron.forward"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKRoundedHeaderView chevronRightImageView](self, "chevronRightImageView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setImage:", v36);

  }
  -[HKRoundedHeaderView chevronRightImageView](self, "chevronRightImageView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  chevronColor = self->_chevronColor;
  -[HKRoundedHeaderView chevronRightImageView](self, "chevronRightImageView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setTintColor:", chevronColor);

  -[HKRoundedHeaderView chevronRightImageView](self, "chevronRightImageView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView addSubview:](self, "addSubview:", v41);

}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  double v5;
  double v6;
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
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
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
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
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
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;

  -[HKRoundedHeaderView gradient](self, "gradient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKRoundedHeaderView gradientView](self, "gradientView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hk_alignConstraintsWithView:", self);

  }
  -[HKRoundedHeaderView textHorizontalInset](self, "textHorizontalInset");
  v6 = v5;
  -[HKRoundedHeaderView imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView leadingAnchor](self, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  -[HKRoundedHeaderView imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "centerYAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView centerYAnchor](self, "centerYAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  -[HKRoundedHeaderView imageView](self, "imageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "widthAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToConstant:", 29.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  -[HKRoundedHeaderView imageView](self, "imageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "heightAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToConstant:", 29.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setActive:", 1);

  -[HKRoundedHeaderView textLabel](self, "textLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView leadingAnchor](self, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, v6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView setTextLeadingConstraintToView:](self, "setTextLeadingConstraintToView:", v24);

  -[HKRoundedHeaderView textLabel](self, "textLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView imageView](self, "imageView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v28, 12.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView setTextLeadingConstraintToImageView:](self, "setTextLeadingConstraintToImageView:", v29);

  -[HKRoundedHeaderView textLabel](self, "textLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "widthAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView widthAnchor](self, "widthAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintLessThanOrEqualToAnchor:multiplier:", v32, 0.66);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView setTextLabelWidthConstraint:](self, "setTextLabelWidthConstraint:", v33);

  -[HKRoundedHeaderView textLabelWidthConstraint](self, "textLabelWidthConstraint");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v35) = 1144750080;
  objc_msgSend(v34, "setPriority:", v35);

  -[HKRoundedHeaderView detailTextLabel](self, "detailTextLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "widthAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView widthAnchor](self, "widthAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintLessThanOrEqualToAnchor:multiplier:", v38, 0.34);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView setDetailTextLabelWidthConstraint:](self, "setDetailTextLabelWidthConstraint:", v39);

  -[HKRoundedHeaderView detailTextLabelWidthConstraint](self, "detailTextLabelWidthConstraint");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v41) = 1144750080;
  objc_msgSend(v40, "setPriority:", v41);

  -[HKRoundedHeaderView textLabel](self, "textLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "firstBaselineAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView topAnchor](self, "topAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView setTextLabelFirstBaselineConstraint:](self, "setTextLabelFirstBaselineConstraint:", v45);

  -[HKRoundedHeaderView textLabelFirstBaselineConstraint](self, "textLabelFirstBaselineConstraint");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v47) = 1144750080;
  objc_msgSend(v46, "setPriority:", v47);

  -[HKRoundedHeaderView textLabelFirstBaselineConstraint](self, "textLabelFirstBaselineConstraint");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setActive:", 1);

  -[HKRoundedHeaderView detailTextLabel](self, "detailTextLabel");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v50) = 1148846080;
  objc_msgSend(v49, "setContentCompressionResistancePriority:forAxis:", 0, v50);

  -[HKRoundedHeaderView chevronRightImageView](self, "chevronRightImageView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "layoutMarginsGuide");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "trailingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView trailingAnchor](self, "trailingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, -v6);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setActive:", 1);

  -[HKRoundedHeaderView chevronRightImageView](self, "chevronRightImageView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v57) = 1148846080;
  objc_msgSend(v56, "setContentCompressionResistancePriority:forAxis:", 0, v57);

  v119 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HKRoundedHeaderView detailTextLabel](self, "detailTextLabel");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "leadingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView textLabel](self, "textLabel");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "trailingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintGreaterThanOrEqualToAnchor:constant:", v61, v6);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v62);

  -[HKRoundedHeaderView detailTextLabel](self, "detailTextLabel");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "firstBaselineAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView textLabel](self, "textLabel");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "lastBaselineAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v67);

  -[HKRoundedHeaderView chevronRightImageView](self, "chevronRightImageView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "leadingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView detailTextLabel](self, "detailTextLabel");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "trailingAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:constant:", v71, 8.0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v72);

  -[HKRoundedHeaderView chevronRightImageView](self, "chevronRightImageView");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "centerYAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView detailTextLabel](self, "detailTextLabel");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "centerYAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:", v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v77);

  -[HKRoundedHeaderView bottomAnchor](self, "bottomAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView textLabel](self, "textLabel");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "lastBaselineAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintEqualToAnchor:", v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView setTextLabelBottomConstraint:](self, "setTextLabelBottomConstraint:", v81);

  -[HKRoundedHeaderView textLabelBottomConstraint](self, "textLabelBottomConstraint");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addObject:", v82);

  v83 = (void *)objc_msgSend(v119, "copy");
  -[HKRoundedHeaderView setRegularConstraints:](self, "setRegularConstraints:", v83);

  v84 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HKRoundedHeaderView textLabel](self, "textLabel");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "trailingAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView chevronRightImageView](self, "chevronRightImageView");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "leadingAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintLessThanOrEqualToAnchor:constant:", v88, -8.0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObject:", v89);

  -[HKRoundedHeaderView detailTextLabel](self, "detailTextLabel");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "leadingAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView textLabel](self, "textLabel");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "leadingAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "constraintEqualToAnchor:", v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObject:", v94);

  -[HKRoundedHeaderView detailTextLabel](self, "detailTextLabel");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "trailingAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView textLabel](self, "textLabel");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "trailingAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "constraintEqualToAnchor:", v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObject:", v99);

  -[HKRoundedHeaderView detailTextLabel](self, "detailTextLabel");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "firstBaselineAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView textLabel](self, "textLabel");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "lastBaselineAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "constraintEqualToAnchor:", v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView setDetailTextLabelFirstBaselineConstraint:](self, "setDetailTextLabelFirstBaselineConstraint:", v104);

  -[HKRoundedHeaderView detailTextLabelFirstBaselineConstraint](self, "detailTextLabelFirstBaselineConstraint");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObject:", v105);

  -[HKRoundedHeaderView bottomAnchor](self, "bottomAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView detailTextLabel](self, "detailTextLabel");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "lastBaselineAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "constraintEqualToAnchor:", v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView setDetailTextLabelBottomConstraint:](self, "setDetailTextLabelBottomConstraint:", v109);

  -[HKRoundedHeaderView detailTextLabelBottomConstraint](self, "detailTextLabelBottomConstraint");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObject:", v110);

  -[HKRoundedHeaderView chevronRightImageView](self, "chevronRightImageView");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "centerYAnchor");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView textLabel](self, "textLabel");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "topAnchor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "constraintEqualToAnchor:", v114);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRoundedHeaderView setLargeTextChevronCenterYConstraint:](self, "setLargeTextChevronCenterYConstraint:", v115);

  -[HKRoundedHeaderView largeTextChevronCenterYConstraint](self, "largeTextChevronCenterYConstraint");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObject:", v116);

  v117 = (void *)objc_msgSend(v84, "copy");
  -[HKRoundedHeaderView setLargeTextConstraints:](self, "setLargeTextConstraints:", v117);

  -[HKRoundedHeaderView chevronRightImageView](self, "chevronRightImageView");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "layoutIfNeeded");

  -[HKRoundedHeaderView _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
}

- (void)_updateTextLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[HKRoundedHeaderView text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3778];
    -[HKRoundedHeaderView text](self, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_textFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = 0.5;
    objc_msgSend(v4, "hk_initWithString:font:hyphenationFactor:", v5, v6, v7);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    -[HKRoundedHeaderView textColor](self, "textColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = *MEMORY[0x1E0DC1140];
      -[HKRoundedHeaderView textColor](self, "textColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKRoundedHeaderView text](self, "text");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addAttribute:value:range:", v9, v10, 0, objc_msgSend(v11, "length"));

    }
    -[HKRoundedHeaderView textLabel](self, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAttributedText:", v14);

  }
  else
  {
    -[HKRoundedHeaderView textLabel](self, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAttributedText:", 0);

    -[HKRoundedHeaderView textLabel](self, "textLabel");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", &stru_1E9C4C428);
  }

}

- (void)_updateTextConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int64_t v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  id v51;

  -[HKRoundedHeaderView image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKRoundedHeaderView imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "setHidden:", 0);

    -[HKRoundedHeaderView textLeadingConstraintToView](self, "textLeadingConstraintToView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setActive:", 0);

    -[HKRoundedHeaderView textLeadingConstraintToImageView](self, "textLeadingConstraintToImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 1;
  }
  else
  {
    objc_msgSend(v4, "setHidden:", 1);

    -[HKRoundedHeaderView textLeadingConstraintToView](self, "textLeadingConstraintToView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setActive:", 1);

    -[HKRoundedHeaderView textLeadingConstraintToImageView](self, "textLeadingConstraintToImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 0;
  }
  objc_msgSend(v7, "setActive:", v9);

  if (-[HKRoundedHeaderView _isLayingOutForAccessibility](self, "_isLayingOutForAccessibility")
    || -[HKRoundedHeaderView _isTextLabelTruncated](self, "_isTextLabelTruncated"))
  {
    -[HKRoundedHeaderView textLabelWidthConstraint](self, "textLabelWidthConstraint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setActive:", 0);

    -[HKRoundedHeaderView textLabel](self, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNumberOfLines:", 0);

    -[HKRoundedHeaderView detailTextLabel](self, "detailTextLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNumberOfLines:", 0);

    -[HKRoundedHeaderView detailTextLabelWidthConstraint](self, "detailTextLabelWidthConstraint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActive:", 0);

    -[HKRoundedHeaderView detailTextLabel](self, "detailTextLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextAlignment:", 4);

    objc_msgSend((id)objc_opt_class(), "_textLastBaselineToBottom");
    v17 = v16;
    -[HKRoundedHeaderView detailTextLabelFirstBaselineConstraint](self, "detailTextLabelFirstBaselineConstraint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setConstant:", v17);

    objc_msgSend((id)objc_opt_class(), "_detailTextLastBaselineToBottom");
    v20 = v19;
    -[HKRoundedHeaderView detailTextLabelBottomConstraint](self, "detailTextLabelBottomConstraint");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setConstant:", v20);

    v22 = (void *)MEMORY[0x1E0CB3718];
    -[HKRoundedHeaderView regularConstraints](self, "regularConstraints");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "deactivateConstraints:", v23);

    v24 = (void *)MEMORY[0x1E0CB3718];
    -[HKRoundedHeaderView largeTextConstraints](self, "largeTextConstraints");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HKRoundedHeaderView textLabelWidthConstraint](self, "textLabelWidthConstraint");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setActive:", 1);

    -[HKRoundedHeaderView textLabel](self, "textLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setNumberOfLines:", 1);

    -[HKRoundedHeaderView detailTextLabel](self, "detailTextLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setNumberOfLines:", 1);

    -[HKRoundedHeaderView detailTextLabelWidthConstraint](self, "detailTextLabelWidthConstraint");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setActive:", 1);

    -[HKRoundedHeaderView detailTextLabelFirstBaselineConstraint](self, "detailTextLabelFirstBaselineConstraint");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setConstant:", 0.0);

    objc_msgSend((id)objc_opt_class(), "_accessibilityContentSizeCategory");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[UIView hk_trailingTextAlignmentAtOrBelowSizeCategory:](self, "hk_trailingTextAlignmentAtOrBelowSizeCategory:", v31);
    -[HKRoundedHeaderView detailTextLabel](self, "detailTextLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setTextAlignment:", v32);

    objc_msgSend((id)objc_opt_class(), "_textLastBaselineToBottom");
    v35 = v34;
    -[HKRoundedHeaderView textLabelBottomConstraint](self, "textLabelBottomConstraint");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setConstant:", v35);

    v37 = (void *)MEMORY[0x1E0CB3718];
    -[HKRoundedHeaderView largeTextConstraints](self, "largeTextConstraints");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "deactivateConstraints:", v38);

    v24 = (void *)MEMORY[0x1E0CB3718];
    -[HKRoundedHeaderView regularConstraints](self, "regularConstraints");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v39 = (void *)v25;
  objc_msgSend(v24, "activateConstraints:", v25);

  -[HKRoundedHeaderView detailText](self, "detailText");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "hk_copyNonEmptyString");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v41)
  {
    -[HKRoundedHeaderView textLabelWidthConstraint](self, "textLabelWidthConstraint");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setActive:", 0);

    -[HKRoundedHeaderView detailTextLabelWidthConstraint](self, "detailTextLabelWidthConstraint");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setActive:", 0);

  }
  objc_msgSend((id)objc_opt_class(), "_topToTextFirstBaseline");
  v45 = v44;
  -[HKRoundedHeaderView textLabelFirstBaselineConstraint](self, "textLabelFirstBaselineConstraint");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setConstant:", v45);

  -[HKRoundedHeaderView textLabel](self, "textLabel");
  v51 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "font");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "lineHeight");
  v49 = v48 * 0.5;
  -[HKRoundedHeaderView largeTextChevronCenterYConstraint](self, "largeTextChevronCenterYConstraint");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setConstant:", v49);

}

+ (id)_accessibilityContentSizeCategory
{
  return (id)*MEMORY[0x1E0DC4918];
}

- (BOOL)_isLayingOutForAccessibility
{
  void *v2;
  BOOL IsLargerThanSizeCategory;

  objc_msgSend((id)objc_opt_class(), "_accessibilityContentSizeCategory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsLargerThanSizeCategory = HKUIApplicationContentSizeCategoryIsLargerThanSizeCategory(v2);

  return IsLargerThanSizeCategory;
}

+ (id)_textFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
}

+ (double)_topToTextFirstBaseline
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend((id)objc_opt_class(), "_textFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 28.0);
  v4 = v3;

  return v4;
}

+ (double)_textLastBaselineToBottom
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend((id)objc_opt_class(), "_textFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 16.0);
  v4 = v3;

  return v4;
}

+ (id)_detailTextFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
}

+ (double)_detailTextLastBaselineToBottom
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend((id)objc_opt_class(), "_detailTextFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 12.0);
  v4 = v3;

  return v4;
}

- (HKGradient)gradient
{
  return self->_gradient;
}

- (UIColor)color
{
  return self->_color;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)text
{
  return self->_text;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIColor)chevronColor
{
  return self->_chevronColor;
}

- (UIColor)detailTextColor
{
  return self->_detailTextColor;
}

- (NSString)detailTextCompositingFilter
{
  return self->_detailTextCompositingFilter;
}

- (HKGradientView)gradientView
{
  return self->_gradientView;
}

- (void)setGradientView:(id)a3
{
  objc_storeStrong((id *)&self->_gradientView, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (UILabel)detailTextLabel
{
  return self->_detailTextLabel;
}

- (void)setDetailTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_detailTextLabel, a3);
}

- (UIImageView)chevronRightImageView
{
  return self->_chevronRightImageView;
}

- (void)setChevronRightImageView:(id)a3
{
  objc_storeStrong((id *)&self->_chevronRightImageView, a3);
}

- (BOOL)isInteractive
{
  return self->_isInteractive;
}

- (NSLayoutConstraint)textLeadingConstraintToView
{
  return self->_textLeadingConstraintToView;
}

- (void)setTextLeadingConstraintToView:(id)a3
{
  objc_storeStrong((id *)&self->_textLeadingConstraintToView, a3);
}

- (NSLayoutConstraint)textLeadingConstraintToImageView
{
  return self->_textLeadingConstraintToImageView;
}

- (void)setTextLeadingConstraintToImageView:(id)a3
{
  objc_storeStrong((id *)&self->_textLeadingConstraintToImageView, a3);
}

- (NSLayoutConstraint)textLabelFirstBaselineConstraint
{
  return self->_textLabelFirstBaselineConstraint;
}

- (void)setTextLabelFirstBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textLabelFirstBaselineConstraint, a3);
}

- (NSLayoutConstraint)textLabelWidthConstraint
{
  return self->_textLabelWidthConstraint;
}

- (void)setTextLabelWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textLabelWidthConstraint, a3);
}

- (NSLayoutConstraint)textLabelBottomConstraint
{
  return self->_textLabelBottomConstraint;
}

- (void)setTextLabelBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textLabelBottomConstraint, a3);
}

- (NSLayoutConstraint)detailTextLabelFirstBaselineConstraint
{
  return self->_detailTextLabelFirstBaselineConstraint;
}

- (void)setDetailTextLabelFirstBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_detailTextLabelFirstBaselineConstraint, a3);
}

- (NSLayoutConstraint)detailTextLabelWidthConstraint
{
  return self->_detailTextLabelWidthConstraint;
}

- (void)setDetailTextLabelWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_detailTextLabelWidthConstraint, a3);
}

- (NSLayoutConstraint)detailTextLabelBottomConstraint
{
  return self->_detailTextLabelBottomConstraint;
}

- (void)setDetailTextLabelBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_detailTextLabelBottomConstraint, a3);
}

- (NSLayoutConstraint)largeTextChevronCenterYConstraint
{
  return self->_largeTextChevronCenterYConstraint;
}

- (void)setLargeTextChevronCenterYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_largeTextChevronCenterYConstraint, a3);
}

- (NSArray)regularConstraints
{
  return self->_regularConstraints;
}

- (void)setRegularConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_regularConstraints, a3);
}

- (NSArray)largeTextConstraints
{
  return self->_largeTextConstraints;
}

- (void)setLargeTextConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_largeTextConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeTextConstraints, 0);
  objc_storeStrong((id *)&self->_regularConstraints, 0);
  objc_storeStrong((id *)&self->_largeTextChevronCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_detailTextLabelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_detailTextLabelWidthConstraint, 0);
  objc_storeStrong((id *)&self->_detailTextLabelFirstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_textLabelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_textLabelWidthConstraint, 0);
  objc_storeStrong((id *)&self->_textLabelFirstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_textLeadingConstraintToImageView, 0);
  objc_storeStrong((id *)&self->_textLeadingConstraintToView, 0);
  objc_storeStrong((id *)&self->_chevronRightImageView, 0);
  objc_storeStrong((id *)&self->_detailTextLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_detailTextColor, 0);
  objc_storeStrong((id *)&self->_chevronColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_gradient, 0);
}

@end
