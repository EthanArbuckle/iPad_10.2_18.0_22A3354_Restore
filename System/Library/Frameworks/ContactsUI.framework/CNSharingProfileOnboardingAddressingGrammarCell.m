@implementation CNSharingProfileOnboardingAddressingGrammarCell

- (CNSharingProfileOnboardingAddressingGrammarCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNSharingProfileOnboardingAddressingGrammarCell *v4;
  CNSharingProfileOnboardingAddressingGrammarCell *v5;
  CNSharingProfileOnboardingAddressingGrammarCell *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNSharingProfileOnboardingAddressingGrammarCell;
  v4 = -[CNSharingProfileOnboardingAddressingGrammarCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CNSharingProfileOnboardingAddressingGrammarCell setAccessoryType:](v4, "setAccessoryType:", 1);
    v6 = v5;
  }

  return v5;
}

- (void)layoutSubviews
{
  uint64_t v3;
  void *v4;
  double Width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;
  CGRect v15;

  v14.receiver = self;
  v14.super_class = (Class)CNSharingProfileOnboardingAddressingGrammarCell;
  -[CNSharingProfileOnboardingAddressingGrammarCell layoutSubviews](&v14, sel_layoutSubviews);
  v3 = -[CNSharingProfileOnboardingAddressingGrammarCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  -[CNSharingProfileOnboardingAddressingGrammarCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  Width = CGRectGetWidth(v15);
  -[CNSharingProfileOnboardingAddressingGrammarCell layoutMargins](self, "layoutMargins");
  v7 = v6;
  -[CNSharingProfileOnboardingAddressingGrammarCell layoutMargins](self, "layoutMargins");
  v9 = v8;

  -[CNSharingProfileOnboardingAddressingGrammarCell layoutMargins](self, "layoutMargins");
  if (v3 == 1)
    v12 = v11;
  else
    v12 = v10;
  -[CNSharingProfileOnboardingAddressingGrammarCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  -[UILabel setFrame:](self->_addressingGrammarLabel, "setFrame:", v12, 0.0, Width - v7 - v9);

}

- (void)setAddressingGrammarLabel:(id)a3
{
  UILabel *v5;
  UILabel **p_addressingGrammarLabel;
  UILabel *addressingGrammarLabel;
  void *v8;
  void *v9;
  void *v10;
  UILabel *v11;

  v5 = (UILabel *)a3;
  p_addressingGrammarLabel = &self->_addressingGrammarLabel;
  addressingGrammarLabel = self->_addressingGrammarLabel;
  v11 = v5;
  if (addressingGrammarLabel != v5)
  {
    -[UILabel superview](addressingGrammarLabel, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSharingProfileOnboardingAddressingGrammarCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
      -[UILabel removeFromSuperview](*p_addressingGrammarLabel, "removeFromSuperview");
    objc_storeStrong((id *)&self->_addressingGrammarLabel, a3);
    -[CNSharingProfileOnboardingAddressingGrammarCell contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", *p_addressingGrammarLabel);

  }
  -[CNSharingProfileOnboardingAddressingGrammarCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)prepareForReuse
{
  UILabel *addressingGrammarLabel;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNSharingProfileOnboardingAddressingGrammarCell;
  -[CNSharingProfileOnboardingAddressingGrammarCell prepareForReuse](&v4, sel_prepareForReuse);
  -[UILabel removeFromSuperview](self->_addressingGrammarLabel, "removeFromSuperview");
  addressingGrammarLabel = self->_addressingGrammarLabel;
  self->_addressingGrammarLabel = 0;

}

- (UILabel)addressingGrammarLabel
{
  return self->_addressingGrammarLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressingGrammarLabel, 0);
}

+ (id)cellIdentifier
{
  return CFSTR("CNSharingProfileOnboardingAddressingGrammarCell");
}

@end
