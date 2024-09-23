@implementation ExplanationCollectionViewCell

- (ExplanationCollectionViewCell)initWithFrame:(CGRect)a3
{
  ExplanationCollectionViewCell *v3;
  UILabel *v4;
  UILabel *headerLabel;
  void *v6;
  UILabel *v7;
  UILabel *bodyLabel;
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
  ExplanationCollectionViewCell *v20;
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
  objc_super v38;
  _QWORD v39[9];

  v39[7] = *MEMORY[0x1E0C80C00];
  v38.receiver = self;
  v38.super_class = (Class)ExplanationCollectionViewCell;
  v3 = -[ExplanationCollectionViewCell initWithFrame:](&v38, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    headerLabel = v3->_headerLabel;
    v3->_headerLabel = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_headerLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_headerLabel, "setTextColor:", v6);

    -[UILabel setTextAlignment:](v3->_headerLabel, "setTextAlignment:", 1);
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    bodyLabel = v3->_bodyLabel;
    v3->_bodyLabel = v7;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_bodyLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_bodyLabel, "setTextColor:", v9);

    -[UILabel setNumberOfLines:](v3->_bodyLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v3->_bodyLabel, "setTextAlignment:", 1);
    -[ExplanationCollectionViewCell contentView](v3, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemGroupedBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setBackgroundColor:", v10);

    objc_msgSend(v37, "_setOverrideUserInterfaceStyle:", 2);
    objc_msgSend(v37, "_setContinuousCornerRadius:", 8.0);
    UIEdgeInsetsMakeWithEdges();
    objc_msgSend(v37, "setLayoutMargins:");
    objc_msgSend(v37, "addSubview:", v3->_headerLabel);
    objc_msgSend(v37, "addSubview:", v3->_bodyLabel);
    objc_msgSend(v37, "layoutMarginsGuide");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel leadingAnchor](v3->_headerLabel, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v34;
    -[UILabel trailingAnchor](v3->_headerLabel, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v31;
    -[UILabel topAnchor](v3->_headerLabel, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v28;
    -[UILabel topAnchor](v3->_bodyLabel, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v3->_headerLabel, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v25, 1.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v39[3] = v24;
    -[UILabel leadingAnchor](v3->_bodyLabel, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v39[4] = v12;
    -[UILabel trailingAnchor](v3->_bodyLabel, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v39[5] = v15;
    -[UILabel bottomAnchor](v3->_bodyLabel, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v39[6] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "activateConstraints:", v19);

    v20 = v3;
  }

  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)ExplanationCollectionViewCell;
  -[ExplanationCollectionViewCell layoutSubviews](&v5, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_headerLabel, "setFont:", v3);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_bodyLabel, "setFont:", v4);

  -[UILabel bounds](self->_bodyLabel, "bounds");
  -[UILabel setPreferredMaxLayoutWidth:](self->_bodyLabel, "setPreferredMaxLayoutWidth:", CGRectGetWidth(v6));
}

- (UILabel)headerLabel
{
  return self->_headerLabel;
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
}

@end
