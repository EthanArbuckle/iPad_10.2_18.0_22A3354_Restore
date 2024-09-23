@implementation SUUIDonationResultView

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (NSString)message
{
  return -[UILabel text](self->_messageLabel, "text");
}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  UIImageView *imageView;
  UIImageView *v7;
  UIImageView *v8;
  UIImageView *v9;
  void *v10;
  UIImageView *v11;
  id v12;

  v12 = a3;
  -[UIImageView image](self->_imageView, "image");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v12;
  if (v4 != v12)
  {
    imageView = self->_imageView;
    if (v12)
    {
      if (!imageView)
      {
        v7 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
        v8 = self->_imageView;
        self->_imageView = v7;

        v9 = self->_imageView;
        -[SUUIDonationResultView backgroundColor](self, "backgroundColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setBackgroundColor:](v9, "setBackgroundColor:", v10);

        -[SUUIDonationResultView addSubview:](self, "addSubview:", self->_imageView);
        imageView = self->_imageView;
      }
      -[UIImageView setImage:](imageView, "setImage:");
      -[UIImageView sizeToFit](self->_imageView, "sizeToFit");
    }
    else
    {
      -[UIImageView removeFromSuperview](imageView, "removeFromSuperview");
      v11 = self->_imageView;
      self->_imageView = 0;

    }
    -[SUUIDonationResultView setNeedsLayout](self, "setNeedsLayout");
    v5 = v12;
  }

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
  -[SUUIDonationResultView message](self, "message");
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
        -[SUUIDonationResultView backgroundColor](self, "backgroundColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_messageLabel;
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        -[UILabel setNumberOfLines:](self->_messageLabel, "setNumberOfLines:", 0);
        -[UILabel setTextAlignment:](self->_messageLabel, "setTextAlignment:", 1);
        v12 = self->_messageLabel;
        objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v12, "setTextColor:", v13);

        -[SUUIDonationResultView addSubview:](self, "addSubview:", self->_messageLabel);
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
    -[SUUIDonationResultView setNeedsLayout](self, "setNeedsLayout");
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
  -[SUUIDonationResultView title](self, "title");
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
        -[SUUIDonationResultView backgroundColor](self, "backgroundColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_titleLabel;
        objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 17.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
        -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
        v12 = self->_titleLabel;
        objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v12, "setTextColor:", v13);

        -[SUUIDonationResultView addSubview:](self, "addSubview:", self->_titleLabel);
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
    -[SUUIDonationResultView setNeedsLayout](self, "setNeedsLayout");
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
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  double v23;
  float v24;
  CGFloat v25;
  double MaxY;
  void *v27;
  uint64_t v28;
  double v29;
  CGFloat v30;
  double v31;
  void *v32;
  uint64_t v33;
  double v34;
  double v35;
  CGRect v36;
  CGRect v37;

  -[SUUIDonationResultView bounds](self, "bounds");
  v4 = v3;
  v35 = v5;
  v6 = v3 + -60.0;
  -[UIImageView frame](self->_imageView, "frame");
  v8 = v7;
  v10 = v9;
  v11 = (v4 - v7) * 0.5;
  v12 = floorf(v11);
  -[UILabel frame](self->_titleLabel, "frame");
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v6, 1.79769313e308);
  v14 = v13;
  -[UILabel frame](self->_messageLabel, "frame");
  -[UILabel sizeThatFits:](self->_messageLabel, "sizeThatFits:", v6, 1.79769313e308);
  v16 = v15;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "userInterfaceIdiom");

  v19 = 8.0;
  if ((v18 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v19 = 46.0;
  v20 = v14 + v10 + v19;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "userInterfaceIdiom");

  v23 = 12.0;
  if ((v22 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v23 = 10.0;
  v24 = (v35 - (v16 + v20 + v23)) * 0.5;
  v25 = floorf(v24);
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v12, v25, v8, v10);
  v36.origin.x = v12;
  v36.origin.y = v25;
  v36.size.width = v8;
  v36.size.height = v10;
  MaxY = CGRectGetMaxY(v36);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "userInterfaceIdiom");

  v29 = 8.0;
  if ((v28 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v29 = 46.0;
  v30 = MaxY + v29;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", 30.0, v30, v6, v14);
  v37.origin.x = 30.0;
  v37.origin.y = v30;
  v37.size.width = v6;
  v37.size.height = v14;
  v31 = CGRectGetMaxY(v37);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "userInterfaceIdiom");

  v34 = 10.0;
  if ((v33 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    v34 = 12.0;
  -[UILabel setFrame:](self->_messageLabel, "setFrame:", 30.0, v31 + v34, v6, v16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
