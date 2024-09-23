@implementation SUUIRedeemResultMessageView

- (NSString)message
{
  return -[UILabel text](self->_messageLabel, "text");
}

- (void)setMessage:(id)a3
{
  id v4;
  UILabel *messageLabel;
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
  -[SUUIRedeemResultMessageView message](self, "message");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v15 && (objc_msgSend(v15, "isEqualToString:", v4) & 1) == 0)
  {
    messageLabel = self->_messageLabel;
    if (v15)
    {
      if (!messageLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
        v7 = self->_messageLabel;
        self->_messageLabel = v6;

        v8 = self->_messageLabel;
        -[SUUIRedeemResultMessageView backgroundColor](self, "backgroundColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_messageLabel;
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        -[UILabel setNumberOfLines:](self->_messageLabel, "setNumberOfLines:", 0);
        -[UILabel setTextAlignment:](self->_messageLabel, "setTextAlignment:", 1);
        v12 = self->_messageLabel;
        objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v12, "setTextColor:", v13);

        -[SUUIRedeemResultMessageView addSubview:](self, "addSubview:", self->_messageLabel);
        messageLabel = self->_messageLabel;
      }
      -[UILabel setText:](messageLabel, "setText:");
    }
    else
    {
      -[UILabel removeFromSuperview](messageLabel, "removeFromSuperview");
      v14 = self->_messageLabel;
      self->_messageLabel = 0;

    }
    -[SUUIRedeemResultMessageView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTitle:(id)a3
{
  id v4;
  UILabel *titleLabel;
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
  -[SUUIRedeemResultMessageView title](self, "title");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v15 && (objc_msgSend(v15, "isEqualToString:", v4) & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (v15)
    {
      if (!titleLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
        v7 = self->_titleLabel;
        self->_titleLabel = v6;

        v8 = self->_titleLabel;
        -[SUUIRedeemResultMessageView backgroundColor](self, "backgroundColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_titleLabel;
        objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 17.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 3);
        -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
        v12 = self->_titleLabel;
        objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v12, "setTextColor:", v13);

        -[SUUIRedeemResultMessageView addSubview:](self, "addSubview:", self->_titleLabel);
        titleLabel = self->_titleLabel;
      }
      -[UILabel setText:](titleLabel, "setText:");
    }
    else
    {
      -[UILabel removeFromSuperview](titleLabel, "removeFromSuperview");
      v14 = self->_titleLabel;
      self->_titleLabel = 0;

    }
    -[SUUIRedeemResultMessageView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  UILabel *titleLabel;
  void *v11;
  uint64_t v12;
  double v13;
  CGFloat v14;
  double v15;
  UILabel *messageLabel;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  CGRect v21;

  -[SUUIRedeemResultMessageView bounds](self, "bounds");
  v4 = v3;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  v7 = 60.0;
  v8 = 30.0;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    v7 = 30.0;
  v9 = v4 - v7;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel frame](titleLabel, "frame");
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceIdiom");

    if ((v12 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      v8 = 15.0;
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v9, 1.79769313e308);
    v14 = v13;
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v8, 0.0, v9, v13);
    v21.origin.y = 0.0;
    v21.origin.x = v8;
    v21.size.width = v9;
    v21.size.height = v14;
    v15 = CGRectGetMaxY(v21) + 13.0;
  }
  else
  {
    v15 = 0.0;
  }
  messageLabel = self->_messageLabel;
  if (messageLabel)
  {
    -[UILabel frame](messageLabel, "frame");
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "userInterfaceIdiom");

    if ((v18 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v19 = 30.0;
    else
      v19 = 15.0;
    -[UILabel sizeThatFits:](self->_messageLabel, "sizeThatFits:", v9, 1.79769313e308);
    -[UILabel setFrame:](self->_messageLabel, "setFrame:", v19, v15, v9, v20);
  }
}

- (void)setBackgroundColor:(id)a3
{
  UILabel *messageLabel;
  id v5;
  objc_super v6;

  messageLabel = self->_messageLabel;
  v5 = a3;
  -[UILabel setBackgroundColor:](messageLabel, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUIRedeemResultMessageView;
  -[SUUIRedeemResultMessageView setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  UILabel *titleLabel;
  double v10;
  double v11;
  UILabel *messageLabel;
  double v13;
  double v14;
  double v15;
  CGSize result;

  width = a3.width;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  v7 = 60.0;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    v7 = 30.0;
  v8 = width - v7;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel sizeThatFits:](titleLabel, "sizeThatFits:", width - v7, 1.79769313e308);
    v11 = v10 + 0.0;
  }
  else
  {
    v11 = 0.0;
  }
  messageLabel = self->_messageLabel;
  if (messageLabel)
  {
    -[UILabel sizeThatFits:](messageLabel, "sizeThatFits:", v8, 1.79769313e308);
    v11 = v11 + v13;
  }
  if (self->_titleLabel && self->_messageLabel)
    v11 = v11 + 13.0;
  v14 = width;
  v15 = v11;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
}

@end
