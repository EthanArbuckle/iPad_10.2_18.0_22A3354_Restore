@implementation SUUIGiftFooterLabelTableViewCell

- (NSString)footerLabel
{
  return -[UILabel text](self->_footerLabel, "text");
}

- (void)setFooterLabel:(id)a3
{
  id v4;
  UILabel *footerLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  void *v14;
  UILabel *v15;
  id v16;

  v16 = a3;
  -[SUUIGiftFooterLabelTableViewCell footerLabel](self, "footerLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v16 && (objc_msgSend(v16, "isEqualToString:", v4) & 1) == 0)
  {
    footerLabel = self->_footerLabel;
    if (v16)
    {
      if (!footerLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
        v7 = self->_footerLabel;
        self->_footerLabel = v6;

        v8 = self->_footerLabel;
        -[SUUIGiftFooterLabelTableViewCell backgroundColor](self, "backgroundColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_footerLabel;
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 15.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        -[UILabel setNumberOfLines:](self->_footerLabel, "setNumberOfLines:", 2);
        -[UILabel setTextAlignment:](self->_footerLabel, "setTextAlignment:", 1);
        v12 = self->_footerLabel;
        objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v12, "setTextColor:", v13);

        -[SUUIGiftFooterLabelTableViewCell contentView](self, "contentView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addSubview:", self->_footerLabel);

        footerLabel = self->_footerLabel;
      }
      -[UILabel setText:](footerLabel, "setText:");
    }
    else
    {
      -[UILabel removeFromSuperview](footerLabel, "removeFromSuperview");
      v15 = self->_footerLabel;
      self->_footerLabel = 0;

    }
    -[SUUIGiftFooterLabelTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUIGiftFooterLabelTableViewCell;
  -[SUUIGiftFooterLabelTableViewCell layoutSubviews](&v8, sel_layoutSubviews);
  -[SUUIGiftFooterLabelTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[UILabel setFrame:](self->_footerLabel, "setFrame:", 15.0, 6.0, v5 + -30.0, v7 + -6.0);
}

- (void)setBackgroundColor:(id)a3
{
  UILabel *footerLabel;
  id v5;
  objc_super v6;

  footerLabel = self->_footerLabel;
  v5 = a3;
  -[UILabel setBackgroundColor:](footerLabel, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUIGiftFooterLabelTableViewCell;
  -[SUUIGiftFooterLabelTableViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[UILabel sizeThatFits:](self->_footerLabel, "sizeThatFits:", a3.width + -30.0, 1.79769313e308);
  v5 = v4 + 6.0;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerLabel, 0);
}

@end
