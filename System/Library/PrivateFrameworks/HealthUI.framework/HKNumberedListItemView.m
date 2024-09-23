@implementation HKNumberedListItemView

- (HKNumberedListItemView)initWithInteger:(unint64_t)a3
{
  HKNumberedListItemView *v4;
  HKNumberedListItemView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKNumberedListItemView;
  v4 = -[HKNumberedListItemView init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_number = a3;
    -[HKNumberedListItemView _setUpUI](v4, "_setUpUI");
    -[HKNumberedListItemView _setUpConstraints](v5, "_setUpConstraints");
  }
  return v5;
}

- (void)layoutSubviews
{
  CGFloat v3;
  void *v4;
  void *v5;
  objc_super v6;
  CGRect v7;

  v6.receiver = self;
  v6.super_class = (Class)HKNumberedListItemView;
  -[HKNumberedListItemView layoutSubviews](&v6, sel_layoutSubviews);
  -[HKNumberedListItemView frame](self, "frame");
  v3 = CGRectGetWidth(v7) * 0.5;
  -[HKNumberedListItemView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", v3);

  -[HKNumberedListItemView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMasksToBounds:", 1);

}

- (void)setTintColor:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKNumberedListItemView;
  v4 = a3;
  -[HKNumberedListItemView setTintColor:](&v8, sel_setTintColor_, v4);
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "CGColor", v8.receiver, v8.super_class);

  -[HKNumberedListItemView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

}

- (void)_setUpUI
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[HKNumberedListItemView setNumberLabel:](self, "setNumberLabel:", v3);

  HKNumberFormatterFromTemplate(0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HKNumberedListItemView number](self, "number"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringFromNumber:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKNumberedListItemView numberLabel](self, "numberLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend((id)objc_opt_class(), "numberFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKNumberedListItemView numberLabel](self, "numberLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  -[HKNumberedListItemView numberLabel](self, "numberLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAdjustsFontForContentSizeCategory:", 1);

  -[HKNumberedListItemView numberLabel](self, "numberLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKNumberedListItemView numberLabel](self, "numberLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKNumberedListItemView addSubview:](self, "addSubview:", v11);

}

- (void)_setUpConstraints
{
  id v3;

  -[HKNumberedListItemView numberLabel](self, "numberLabel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_alignCenterConstraintsWithView:", self);

}

+ (id)createNumberedViewWithInteger:(unint64_t)a3
{
  HKNumberedListItemView *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[HKNumberedListItemView initWithInteger:]([HKNumberedListItemView alloc], "initWithInteger:", a3);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_appKeyColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKNumberedListItemView setTintColor:](v3, "setTintColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKNumberedListItemView numberLabel](v3, "numberLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v5);

  -[HKNumberedListItemView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v3;
}

+ (id)numberFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4A88], 2);
}

+ (CGSize)listItemSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  +[HKNumberedListItemView numberFont](HKNumberedListItemView, "numberFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 28.0);
  v4 = v3;

  v5 = v4;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (UILabel)numberLabel
{
  return self->_numberLabel;
}

- (void)setNumberLabel:(id)a3
{
  objc_storeStrong((id *)&self->_numberLabel, a3);
}

- (unint64_t)number
{
  return self->_number;
}

- (void)setNumber:(unint64_t)a3
{
  self->_number = a3;
}

- (UIView)numberLabelBackground
{
  return self->_numberLabelBackground;
}

- (void)setNumberLabelBackground:(id)a3
{
  objc_storeStrong((id *)&self->_numberLabelBackground, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberLabelBackground, 0);
  objc_storeStrong((id *)&self->_numberLabel, 0);
}

@end
