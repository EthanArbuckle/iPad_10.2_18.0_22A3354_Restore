@implementation SFPrivateBrowsingExplanationItemCell

- (SFPrivateBrowsingExplanationItemCell)initWithFrame:(CGRect)a3
{
  SFPrivateBrowsingExplanationItemCell *v3;
  UIImageView *v4;
  UIImageView *imageView;
  void *v6;
  void *v7;
  void *v8;
  UILabel *v9;
  UILabel *titleLabel;
  void *v11;
  void *v12;
  UILabel *v13;
  UILabel *messageLabel;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSLayoutConstraint *imageViewWidthConstraint;
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
  id v31;
  SFPrivateBrowsingExplanationItemCell *v32;
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
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  objc_super v55;
  _QWORD v56[12];

  v56[10] = *MEMORY[0x1E0C80C00];
  v55.receiver = self;
  v55.super_class = (Class)SFPrivateBrowsingExplanationItemCell;
  v3 = -[SFPrivateBrowsingExplanationItemCell initWithFrame:](&v55, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 4);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v3->_imageView, "setPreferredSymbolConfiguration:", v6);

    -[UIImageView setTintAdjustmentMode:](v3->_imageView, "setTintAdjustmentMode:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v3->_imageView, "setTintColor:", v7);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFPrivateBrowsingExplanationItemCell contentView](v3, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v3->_imageView);
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v9;

    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v11);

    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v12);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v8, "addSubview:", v3->_titleLabel);
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    messageLabel = v3->_messageLabel;
    v3->_messageLabel = v13;

    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_messageLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_messageLabel, "setFont:", v15);

    -[UILabel setNumberOfLines:](v3->_messageLabel, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_messageLabel, "setTextColor:", v16);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_messageLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v8, "addSubview:", v3->_messageLabel);
    -[UIImageView widthAnchor](v3->_imageView, "widthAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToConstant:", 0.0);
    v18 = objc_claimAutoreleasedReturnValue();
    imageViewWidthConstraint = v3->_imageViewWidthConstraint;
    v3->_imageViewWidthConstraint = (NSLayoutConstraint *)v18;

    -[SFPrivateBrowsingExplanationItemCell _updateImageViewWidth](v3, "_updateImageViewWidth");
    v44 = (void *)MEMORY[0x1E0CB3718];
    v56[0] = v3->_imageViewWidthConstraint;
    -[UIImageView leadingAnchor](v3->_imageView, "leadingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leadingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v53);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v56[1] = v52;
    -[UIImageView firstBaselineAnchor](v3->_imageView, "firstBaselineAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel firstBaselineAnchor](v3->_titleLabel, "firstBaselineAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v50);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v56[2] = v49;
    -[UILabel leadingAnchor](v3->_titleLabel, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](v3->_imageView, "trailingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, 10.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v56[3] = v46;
    -[UILabel topAnchor](v3->_titleLabel, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v43);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v56[4] = v42;
    objc_msgSend(v8, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v3->_titleLabel, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v56[5] = v38;
    -[UILabel leadingAnchor](v3->_messageLabel, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](v3->_titleLabel, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v56[6] = v35;
    -[UILabel firstBaselineAnchor](v3->_messageLabel, "firstBaselineAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel lastBaselineAnchor](v3->_titleLabel, "lastBaselineAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v20, 1.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v56[7] = v21;
    v22 = v8;
    v41 = v8;
    objc_msgSend(v8, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v3->_messageLabel, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v56[8] = v25;
    objc_msgSend(v22, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v3->_messageLabel, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v56[9] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 10);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "activateConstraints:", v29);

    objc_msgSend(MEMORY[0x1E0DC3E88], "systemTraitsAffectingImageLookup");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (id)-[SFPrivateBrowsingExplanationItemCell registerForTraitChanges:withAction:](v3, "registerForTraitChanges:withAction:", v30, sel__updateImageViewWidth);

    v32 = v3;
  }

  return v3;
}

- (void)setItem:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_item, a3);
    objc_msgSend(v8, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_imageView, "setImage:", v5);

    objc_msgSend(v8, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_messageLabel, "setText:", v6);

    objc_msgSend(v8, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_titleLabel, "setText:", v7);

  }
}

- (void)_updateImageViewWidth
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPrivateBrowsingExplanationItemCell traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValueForValue:compatibleWithTraitCollection:", v4, 30.0);
  -[NSLayoutConstraint setConstant:](self->_imageViewWidthConstraint, "setConstant:");

  -[SFPrivateBrowsingExplanationItemCell invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (WBSPrivateBrowsingExplanationItem)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_imageViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
