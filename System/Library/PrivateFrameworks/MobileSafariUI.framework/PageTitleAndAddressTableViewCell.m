@implementation PageTitleAndAddressTableViewCell

+ (double)defaultHeight
{
  return 44.0;
}

- (PageTitleAndAddressTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PageTitleAndAddressTableViewCell *v4;
  PageTitleAndAddressTableViewCell *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  PageTitleAndAddressTableViewCell *v12;
  objc_super v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)PageTitleAndAddressTableViewCell;
  v4 = -[PageTitleAndAddressTableViewCell initWithStyle:reuseIdentifier:](&v14, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PageTitleAndAddressTableViewCell _updateNumberOfLines](v4, "_updateNumberOfLines");
    -[PageTitleAndAddressTableViewCell _updateFont](v5, "_updateFont");
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PageTitleAndAddressTableViewCell detailTextLabel](v5, "detailTextLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextColor:", v6);

    v16[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)-[PageTitleAndAddressTableViewCell registerForTraitChanges:withTarget:action:](v5, "registerForTraitChanges:withTarget:action:", v8, v5, sel__updateNumberOfLines);

    v15 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)-[PageTitleAndAddressTableViewCell registerForTraitChanges:withTarget:action:](v5, "registerForTraitChanges:withTarget:action:", v10, v5, sel__updateFont);

    v12 = v5;
  }

  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  objc_super v16;
  CGRect v17;

  v16.receiver = self;
  v16.super_class = (Class)PageTitleAndAddressTableViewCell;
  -[CompletionListTableViewCell layoutSubviews](&v16, sel_layoutSubviews);
  -[PageTitleAndAddressTableViewCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    objc_msgSend(v4, "size");
    +[CompletionListTableViewCell imageWidthSpace](CompletionListTableViewCell, "imageWidthSpace");
    -[PageTitleAndAddressTableViewCell textLabel](self, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    _SFRoundFloatToPixels();
    if (-[PageTitleAndAddressTableViewCell _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout"))
    {
      _SFRoundFloatToPixels();
      v13 = v12;
    }
    else
    {
      -[PageTitleAndAddressTableViewCell contentView](self, "contentView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bounds");
      CGRectGetMaxX(v17);
      _SFRoundFloatToPixels();
      v13 = v15;

    }
    objc_msgSend(v3, "setFrame:", v13, v6, v8, v10);

  }
}

- (void)setTitle:(id)a3 address:(id)a4 prompt:(id)a5 withQuery:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  if (a3)
    v9 = a3;
  else
    v9 = a4;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[PageTitleAndAddressTableViewCell textLabel](self, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v9);

  objc_msgSend(MEMORY[0x1E0CB3940], "safari_detailStringWithURLString:prompt:", v11, v10);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[PageTitleAndAddressTableViewCell detailTextLabel](self, "detailTextLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v15);

}

- (void)_updateNumberOfLines
{
  void *v3;
  NSString *v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[PageTitleAndAddressTableViewCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory(v4))
    v5 = 2;
  else
    v5 = 1;

  -[PageTitleAndAddressTableViewCell textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfLines:", v5);

  -[PageTitleAndAddressTableViewCell detailTextLabel](self, "detailTextLabel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNumberOfLines:", v5);

}

- (void)_updateFont
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[PageTitleAndAddressTableViewCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "verticalSizeClass");

  if (v4 == 1)
  {
    v5 = *MEMORY[0x1E0DC48D0];
    -[PageTitleAndAddressTableViewCell textLabel](self, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMaximumContentSizeCategory:", v5);

    -[PageTitleAndAddressTableViewCell detailTextLabel](self, "detailTextLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMaximumContentSizeCategory:", v5);

  }
  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC1438]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PageTitleAndAddressTableViewCell textLabel](self, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PageTitleAndAddressTableViewCell detailTextLabel](self, "detailTextLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v11);

}

@end
