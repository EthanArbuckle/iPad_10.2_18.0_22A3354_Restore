@implementation HXUILabelWithBackgroundView

- (HXUILabelWithBackgroundView)initWithFrame:(CGRect)a3
{
  HXUILabelWithBackgroundView *v3;
  UILabel *v4;
  UILabel *label;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HXUILabelWithBackgroundView;
  v3 = -[HXUILabelWithBackgroundView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v3->_label;
    v3->_label = v4;

    objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_label, "setFont:", v6);

    -[UILabel setTextAlignment:](v3->_label, "setTextAlignment:", 1);
    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_label, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_label, "setTextColor:", v7);

    -[HXUILabelWithBackgroundView addSubview:](v3, "addSubview:", v3->_label);
    -[HXUILabelWithBackgroundView layer](v3, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCornerRadius:", 8.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HXUILabelWithBackgroundView setBackgroundColor:](v3, "setBackgroundColor:", v9);

  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;
  CGRect v5;

  v3.receiver = self;
  v3.super_class = (Class)HXUILabelWithBackgroundView;
  -[HXUILabelWithBackgroundView layoutSubviews](&v3, sel_layoutSubviews);
  -[HXUILabelWithBackgroundView bounds](self, "bounds");
  v5 = CGRectInset(v4, 12.0, 7.0);
  -[UILabel setFrame:](self->_label, "setFrame:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v3 = a3.width + -24.0;
  if (v3 < 0.0)
    v3 = 0.0;
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", v3, a3.height);
  v5 = v4 + 24.0;
  v7 = v6 + 14.0;
  result.height = v7;
  result.width = v5;
  return result;
}

- (void)setText:(id)a3
{
  -[UILabel setText:](self->_label, "setText:", a3);
  -[HXUILabelWithBackgroundView setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)text
{
  return -[UILabel text](self->_label, "text");
}

- (void)setTextColor:(id)a3
{
  -[UILabel setTextColor:](self->_label, "setTextColor:", a3);
}

- (UIColor)textColor
{
  return -[UILabel textColor](self->_label, "textColor");
}

- (void)setNumberOfLines:(int64_t)a3
{
  -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", a3);
}

- (int64_t)numberOfLines
{
  return -[UILabel numberOfLines](self->_label, "numberOfLines");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
