@implementation SUUIDeveloperInfoLineItemView

- (SUUIDeveloperInfoLineItemView)initWithLabel:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  SUUIDeveloperInfoLineItemView *v8;
  UILabel *v9;
  UILabel *labelLabel;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  UILabel *v15;
  UILabel *valueLabel;
  UILabel *v17;
  void *v18;
  UILabel *v19;
  void *v20;
  UIView *v21;
  UIView *separatorView;
  UIView *v23;
  void *v24;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)SUUIDeveloperInfoLineItemView;
  v8 = -[SUUIDeveloperInfoLineItemView init](&v26, sel_init);
  if (v8)
  {
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    labelLabel = v8->_labelLabel;
    v8->_labelLabel = v9;

    v11 = v8->_labelLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v11, "setFont:", v12);

    -[UILabel setNumberOfLines:](v8->_labelLabel, "setNumberOfLines:", 2);
    -[UILabel setTextAlignment:](v8->_labelLabel, "setTextAlignment:", 1);
    v13 = v8->_labelLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v13, "setTextColor:", v14);

    -[UILabel setText:](v8->_labelLabel, "setText:", v6);
    -[SUUIDeveloperInfoLineItemView addSubview:](v8, "addSubview:", v8->_labelLabel);
    v15 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    valueLabel = v8->_valueLabel;
    v8->_valueLabel = v15;

    v17 = v8->_valueLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v17, "setFont:", v18);

    -[UILabel setNumberOfLines:](v8->_valueLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v8->_valueLabel, "setTextAlignment:", 1);
    v19 = v8->_valueLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v19, "setTextColor:", v20);

    -[UILabel setText:](v8->_valueLabel, "setText:", v7);
    -[SUUIDeveloperInfoLineItemView addSubview:](v8, "addSubview:", v8->_valueLabel);
    v21 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    separatorView = v8->_separatorView;
    v8->_separatorView = v21;

    v23 = v8->_separatorView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v23, "setBackgroundColor:", v24);

    -[SUUIDeveloperInfoLineItemView addSubview:](v8, "addSubview:", v8->_separatorView);
  }

  return v8;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double top;
  double v6;
  UILabel *labelLabel;
  double left;
  double v9;
  CGFloat v10;
  UILabel *valueLabel;
  double v12;
  double v13;
  CGFloat v14;
  void *v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;

  -[SUUIDeveloperInfoLineItemView bounds](self, "bounds");
  v4 = v3;
  top = self->_contentInset.top;
  v6 = v3 - self->_contentInset.left - self->_contentInset.right;
  labelLabel = self->_labelLabel;
  if (labelLabel)
  {
    -[UILabel frame](labelLabel, "frame");
    left = self->_contentInset.left;
    -[UILabel sizeThatFits:](self->_labelLabel, "sizeThatFits:", v6, 1.79769313e308);
    v10 = v9;
    -[UILabel setFrame:](self->_labelLabel, "setFrame:", left, top, v6, v9);
    v18.origin.x = left;
    v18.origin.y = top;
    v18.size.width = v6;
    v18.size.height = v10;
    top = CGRectGetMaxY(v18);
  }
  valueLabel = self->_valueLabel;
  if (valueLabel)
  {
    -[UILabel frame](valueLabel, "frame");
    v12 = self->_contentInset.left;
    if (self->_labelLabel)
      top = top + 3.0;
    -[UILabel sizeThatFits:](self->_valueLabel, "sizeThatFits:", v6, 1.79769313e308);
    v14 = v13;
    -[UILabel setFrame:](self->_valueLabel, "setFrame:", v12, top, v6, v13);
    v19.origin.x = v12;
    v19.origin.y = top;
    v19.size.width = v6;
    v19.size.height = v14;
    top = CGRectGetMaxY(v19);
  }
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scale");
  v17 = 1.0 / v16;

  -[UIView setFrame:](self->_separatorView, "setFrame:", self->_contentInset.left, top + self->_contentInset.bottom - v17, v4 - self->_contentInset.left, v17);
}

- (void)setBackgroundColor:(id)a3
{
  UILabel *labelLabel;
  id v5;
  objc_super v6;

  labelLabel = self->_labelLabel;
  v5 = a3;
  -[UILabel setBackgroundColor:](labelLabel, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_valueLabel, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUIDeveloperInfoLineItemView;
  -[SUUIDeveloperInfoLineItemView setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v5;
  double v6;
  UILabel *labelLabel;
  double v8;
  UILabel *valueLabel;
  double v10;
  double v11;
  double v12;
  CGSize result;

  width = a3.width;
  v5 = self->_contentInset.top + self->_contentInset.bottom;
  v6 = a3.width - self->_contentInset.left - self->_contentInset.right;
  labelLabel = self->_labelLabel;
  if (labelLabel)
  {
    -[UILabel sizeThatFits:](labelLabel, "sizeThatFits:", v6, 1.79769313e308);
    v5 = v5 + v8;
  }
  valueLabel = self->_valueLabel;
  if (valueLabel)
  {
    -[UILabel sizeThatFits:](valueLabel, "sizeThatFits:", v6, 1.79769313e308);
    v5 = v5 + v10;
  }
  if (self->_labelLabel && self->_valueLabel)
    v5 = v5 + 3.0;
  v11 = width;
  v12 = v5;
  result.height = v12;
  result.width = v11;
  return result;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_labelLabel, 0);
}

@end
