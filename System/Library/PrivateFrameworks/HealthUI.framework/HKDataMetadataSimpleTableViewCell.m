@implementation HKDataMetadataSimpleTableViewCell

- (HKDataMetadataSimpleTableViewCell)initWithReuseIdentifier:(id)a3
{
  HKDataMetadataSimpleTableViewCell *v3;
  HKDataMetadataSimpleTableViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKDataMetadataSimpleTableViewCell;
  v3 = -[HKDataMetadataSimpleTableViewCell initWithStyle:reuseIdentifier:](&v6, sel_initWithStyle_reuseIdentifier_, 3, a3);
  v4 = v3;
  if (v3)
  {
    -[HKDataMetadataSimpleTableViewCell setupSubviews](v3, "setupSubviews");
    -[HKDataMetadataSimpleTableViewCell setupConstraints](v4, "setupConstraints");
    -[HKDataMetadataSimpleTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
  }
  return v4;
}

- (void)setupSubviews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[HKDataMetadataSimpleTableViewCell setSubtitleTextLabel:](self, "setSubtitleTextLabel:", v3);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subtitleTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_subtitleTextLabel, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4B10], 0x8000, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_subtitleTextLabel, "setFont:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_subtitleTextLabel, "setTextColor:", v6);

  -[HKDataMetadataSimpleTableViewCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_subtitleTextLabel);

  v8 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[HKDataMetadataSimpleTableViewCell setTitleTextLabel:](self, "setTitleTextLabel:", v8);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_titleTextLabel, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 0x8000, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v12, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleTextLabel, "setFont:", v9);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_titleTextLabel, "setTextColor:", v10);

  -[HKDataMetadataSimpleTableViewCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", self->_titleTextLabel);

}

- (void)_updateForCurrentSizeCategory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HKDataMetadataSimpleTableViewCell detailTextLabel](self, "detailTextLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_subtitleTextLabel, "setFont:", v4);

  -[HKDataMetadataSimpleTableViewCell textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleTextLabel, "setFont:", v6);

  -[HKDataMetadataSimpleTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double MinX;
  double Width;
  objc_super v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v23.receiver = self;
  v23.super_class = (Class)HKDataMetadataSimpleTableViewCell;
  -[HKDataMetadataSimpleTableViewCell layoutSubviews](&v23, sel_layoutSubviews);
  -[HKDataMetadataSimpleTableViewCell titleTextLabel](self, "titleTextLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[HKDataMetadataSimpleTableViewCell titleTextLabel](self, "titleTextLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataMetadataSimpleTableViewCell convertRect:fromView:](self, "convertRect:fromView:", v12, v5, v7, v9, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  if (-[UIView hk_isLeftToRight](self, "hk_isLeftToRight"))
  {
    v24.origin.x = v14;
    v24.origin.y = v16;
    v24.size.width = v18;
    v24.size.height = v20;
    MinX = CGRectGetMinX(v24);
  }
  else
  {
    -[HKDataMetadataSimpleTableViewCell bounds](self, "bounds");
    Width = CGRectGetWidth(v25);
    v26.origin.x = v14;
    v26.origin.y = v16;
    v26.size.width = v18;
    v26.size.height = v20;
    MinX = Width - CGRectGetMaxX(v26);
  }
  -[HKDataMetadataSimpleTableViewCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, MinX, 0.0, 0.0);
}

- (void)setupConstraints
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
  void *v34;
  void *v35;
  void *v36;
  id v37;

  -[HKDataMetadataSimpleTableViewCell subtitleTextLabel](self, "subtitleTextLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataMetadataSimpleTableViewCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6, 16.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  -[HKDataMetadataSimpleTableViewCell subtitleTextLabel](self, "subtitleTextLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataMetadataSimpleTableViewCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintLessThanOrEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  -[HKDataMetadataSimpleTableViewCell subtitleTextLabel](self, "subtitleTextLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataMetadataSimpleTableViewCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, 9.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  -[HKDataMetadataSimpleTableViewCell titleTextLabel](self, "titleTextLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataMetadataSimpleTableViewCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21, 16.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  -[HKDataMetadataSimpleTableViewCell titleTextLabel](self, "titleTextLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataMetadataSimpleTableViewCell contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintLessThanOrEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setActive:", 1);

  -[HKDataMetadataSimpleTableViewCell titleTextLabel](self, "titleTextLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataMetadataSimpleTableViewCell contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31, -9.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setActive:", 1);

  -[HKDataMetadataSimpleTableViewCell titleTextLabel](self, "titleTextLabel");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataMetadataSimpleTableViewCell subtitleTextLabel](self, "subtitleTextLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bottomAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintGreaterThanOrEqualToAnchor:constant:", v35, 1.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setActive:", 1);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKDataMetadataSimpleTableViewCell;
  -[HKDataMetadataSimpleTableViewCell traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HKDataMetadataSimpleTableViewCell traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
      -[HKDataMetadataSimpleTableViewCell _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
  }

}

- (void)updateAutomationIdentifiersWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v15[0] = v4;
    v15[1] = CFSTR("Value");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDataMetadataSimpleTableViewCell titleTextLabel](self, "titleTextLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityIdentifier:", v7);

    v14[0] = v5;
    v14[1] = CFSTR("Title");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDataMetadataSimpleTableViewCell subtitleTextLabel](self, "subtitleTextLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccessibilityIdentifier:", v10);

  }
  else
  {
    -[HKDataMetadataSimpleTableViewCell titleTextLabel](self, "titleTextLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAccessibilityIdentifier:", 0);

    -[HKDataMetadataSimpleTableViewCell subtitleTextLabel](self, "subtitleTextLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAccessibilityIdentifier:", 0);

  }
}

- (UILabel)titleTextLabel
{
  return self->_titleTextLabel;
}

- (void)setTitleTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleTextLabel, a3);
}

- (UILabel)subtitleTextLabel
{
  return self->_subtitleTextLabel;
}

- (void)setSubtitleTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleTextLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleTextLabel, 0);
  objc_storeStrong((id *)&self->_titleTextLabel, 0);
}

@end
