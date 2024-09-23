@implementation HKTableViewFooterView

- (HKTableViewFooterView)init
{
  HKTableViewFooterView *v2;
  UILabel *v3;
  UILabel *label;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKTableViewFooterView;
  v2 = -[HKTableViewFooterView init](&v7, sel_init);
  if (v2)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v2->_label;
    v2->_label = v3;

    -[UILabel setNumberOfLines:](v2->_label, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v2->_label, "setTextColor:", v5);

    -[UILabel setTextAlignment:](v2->_label, "setTextAlignment:", 4);
    -[HKTableViewFooterView updateFont](v2, "updateFont");
    -[HKTableViewFooterView addSubview:](v2, "addSubview:", v2->_label);
  }
  return v2;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
  -[HKTableViewFooterView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[HKTableViewFooterView bounds](self, "bounds");
  -[UILabel setFrame:](self->_label, "setFrame:", v3 + self->_contentInsets.left, v4 + self->_contentInsets.top, v5 - (self->_contentInsets.left + self->_contentInsets.right), v6 - (self->_contentInsets.top + self->_contentInsets.bottom));
}

- (void)updateFont
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_label, "setFont:", v3);

  -[HKTableViewFooterView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setPreferredMaxLayoutWidth:(double)a3
{
  self->_preferredMaxLayoutWidth = a3;
  -[UILabel setPreferredMaxLayoutWidth:](self->_label, "setPreferredMaxLayoutWidth:", a3 - self->_contentInsets.left - self->_contentInsets.right);
}

- (CGSize)intrinsicContentSize
{
  double preferredMaxLayoutWidth;
  double v4;
  double v5;
  CGSize result;

  -[UILabel intrinsicContentSize](self->_label, "intrinsicContentSize");
  preferredMaxLayoutWidth = self->_preferredMaxLayoutWidth;
  v5 = v4 + self->_contentInsets.top + self->_contentInsets.bottom;
  result.height = v5;
  result.width = preferredMaxLayoutWidth;
  return result;
}

- (UILabel)label
{
  return self->_label;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)preferredMaxLayoutWidth
{
  return self->_preferredMaxLayoutWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
