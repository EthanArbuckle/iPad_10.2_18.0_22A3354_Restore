@implementation SUUIGiftTableSectionHeaderView

- (NSString)label
{
  return -[UILabel text](self->_label, "text");
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    -[SUUIGiftTableSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setLabel:(id)a3
{
  id v4;
  UILabel *label;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  id v15;

  v15 = a3;
  -[SUUIGiftTableSectionHeaderView label](self, "label");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v15 && (objc_msgSend(v15, "isEqualToString:", v4) & 1) == 0)
  {
    label = self->_label;
    if (v15)
    {
      if (!label)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
        v7 = self->_label;
        self->_label = v6;

        v8 = self->_label;
        -[SUUIGiftTableSectionHeaderView backgroundColor](self, "backgroundColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_label;
        objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 15.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        v12 = self->_label;
        objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v12, "setTextColor:", v13);

        -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", 4);
        -[SUUIGiftTableSectionHeaderView addSubview:](self, "addSubview:", self->_label);
        label = self->_label;
      }
      -[UILabel setText:](label, "setText:");
      -[UILabel sizeToFit](self->_label, "sizeToFit");
    }
    else
    {
      -[UILabel removeFromSuperview](label, "removeFromSuperview");
      v14 = self->_label;
      self->_label = 0;

    }
    -[SUUIGiftTableSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;

  -[SUUIGiftTableSectionHeaderView bounds](self, "bounds");
  v4 = v3;
  -[UILabel frame](self->_label, "frame");
  -[UILabel setFrame:](self->_label, "setFrame:", self->_contentInsets.left + 15.0, self->_contentInsets.top + 0.0, v4 + -15.0 - self->_contentInsets.right - (self->_contentInsets.left + 15.0));
}

- (void)setBackgroundColor:(id)a3
{
  UILabel *label;
  id v5;
  objc_super v6;

  label = self->_label;
  v5 = a3;
  -[UILabel setBackgroundColor:](label, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUIGiftTableSectionHeaderView;
  -[SUUIGiftTableSectionHeaderView setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  v7 = 22.0;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v7 = 24.0;
  v8 = v7 + self->_contentInsets.top + self->_contentInsets.bottom;
  v9 = width;
  result.height = v8;
  result.width = v9;
  return result;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
