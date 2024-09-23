@implementation SUUIGiftResultView

- (SUUIGiftResultView)initWithFrame:(CGRect)a3
{
  SUUIGiftResultView *v3;
  uint64_t v4;
  UIButton *giftAgainButton;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUIGiftResultView;
  v3 = -[SUUIGiftResultView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v4 = objc_claimAutoreleasedReturnValue();
    giftAgainButton = v3->_giftAgainButton;
    v3->_giftAgainButton = (UIButton *)v4;

    -[UIButton setAutoresizingMask:](v3->_giftAgainButton, "setAutoresizingMask:", 5);
    -[UIButton titleLabel](v3->_giftAgainButton, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 18.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v7);

    -[SUUIGiftResultView addSubview:](v3, "addSubview:", v3->_giftAgainButton);
  }
  return v3;
}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
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
        -[SUUIGiftResultView backgroundColor](self, "backgroundColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setBackgroundColor:](v9, "setBackgroundColor:", v10);

        -[SUUIGiftResultView addSubview:](self, "addSubview:", self->_imageView);
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
    -[SUUIGiftResultView setNeedsLayout](self, "setNeedsLayout");
    v5 = v12;
  }

}

- (void)setItemView:(id)a3
{
  SUUIGiftItemView *v5;
  SUUIGiftItemView **p_itemView;
  SUUIGiftItemView *itemView;
  SUUIGiftItemView *v8;
  void *v9;
  SUUIGiftItemView *v10;

  v5 = (SUUIGiftItemView *)a3;
  p_itemView = &self->_itemView;
  itemView = self->_itemView;
  if (itemView != v5)
  {
    v10 = v5;
    if (itemView)
      -[SUUIGiftItemView removeFromSuperview](itemView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_itemView, a3);
    v8 = *p_itemView;
    -[SUUIGiftResultView backgroundColor](self, "backgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftItemView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    if (*p_itemView)
      -[SUUIGiftResultView addSubview:](self, "addSubview:");
    -[SUUIGiftResultView setNeedsLayout](self, "setNeedsLayout");
    v5 = v10;
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
  -[SUUIGiftResultView title](self, "title");
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
        -[SUUIGiftResultView backgroundColor](self, "backgroundColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_titleLabel;
        objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 16.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
        -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
        v12 = self->_titleLabel;
        objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v12, "setTextColor:", v13);

        -[SUUIGiftResultView addSubview:](self, "addSubview:", self->_titleLabel);
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
    -[SUUIGiftResultView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *imageView;
  double v20;
  double v21;
  float v22;
  double v23;
  UIImageView *v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  float v29;
  float v30;
  double v31;
  UIImageView *v32;
  double v33;
  double v34;
  SUUIGiftItemView *itemView;
  double v36;
  SUUIGiftItemView *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  UILabel *titleLabel;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  float v48;
  double v49;
  UIButton *giftAgainButton;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  CGRect v58;
  CGRect v59;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceLayoutDirection");

  -[SUUIGiftResultView bounds](self, "bounds");
  v6 = v5;
  v57 = v7;
  v9 = v8;
  v11 = v10;
  v12 = v8 + -30.0;
  -[UIButton frame](self->_giftAgainButton, "frame");
  v14 = v13;
  v16 = v15;
  -[UILabel frame](self->_titleLabel, "frame");
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v12, 1.79769313e308);
  v18 = v17;
  imageView = self->_imageView;
  if (imageView || (imageView = self->_itemView) != 0)
  {
    objc_msgSend(imageView, "bounds");
    v21 = v20 + 15.0;
  }
  else
  {
    v21 = 0.0;
  }
  v56 = v11;
  v22 = (v11 - (v16 + v18 + v21)) * 0.5;
  v23 = floorf(v22);
  v24 = self->_imageView;
  if (v24)
  {
    v54 = v14;
    v55 = v6;
    v53 = v16;
    -[UIImageView frame](v24, "frame");
    v27 = v25;
    v28 = v26;
    v29 = (v9 - v25) * 0.5;
    v30 = floorf(v29);
    v31 = v30;
    v32 = self->_imageView;
    if (v4)
    {
      +[SUUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SUUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v30, v23, v25, v26, v55, v57, v9, v11);
    }
    else
    {
      v33 = v30;
      v34 = v23;
    }
    -[UIImageView setFrame:](v32, "setFrame:", v33, v34);
    v41 = 15.0;
  }
  else
  {
    itemView = self->_itemView;
    if (!itemView)
      goto LABEL_16;
    v53 = v16;
    v54 = v14;
    -[SUUIGiftItemView frame](itemView, "frame");
    v28 = v36;
    v37 = self->_itemView;
    v55 = v6;
    if (v4)
    {
      v31 = 15.0;
      +[SUUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SUUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", 15.0, v23, v12, v36, v6, v57, v9, v11);
    }
    else
    {
      v38 = 15.0;
      v39 = v23;
      v40 = v12;
      v31 = 15.0;
    }
    -[SUUIGiftItemView setFrame:](v37, "setFrame:", v38, v39, v40);
    v41 = 0.0;
    v27 = v12;
  }
  v58.origin.x = v31;
  v58.origin.y = v23;
  v58.size.width = v27;
  v58.size.height = v28;
  v23 = CGRectGetMaxY(v58) + v41;
  v16 = v53;
  v14 = v54;
  v6 = v55;
LABEL_16:
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", 15.0, v23, v12, v18);
  titleLabel = self->_titleLabel;
  v43 = 15.0;
  v44 = v23;
  v45 = v12;
  v46 = v18;
  if (v4)
    +[SUUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SUUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", 15.0, v23, v12, v18, v6, v57, v9, v56);
  -[UILabel setFrame:](titleLabel, "setFrame:", v43, v44, v45, v46);
  v59.origin.x = 15.0;
  v59.origin.y = v23;
  v59.size.width = v12;
  v59.size.height = v18;
  v47 = CGRectGetMaxY(v59) + 16.0;
  v48 = (v9 - v14) * 0.5;
  v49 = floorf(v48);
  giftAgainButton = self->_giftAgainButton;
  if (v4)
  {
    +[SUUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SUUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v49, v47, v14, v16, v6, v57, v9, v56);
    v14 = v51;
    v16 = v52;
  }
  -[UIButton setFrame:](giftAgainButton, "setFrame:", v49, v47, v14, v16);
}

- (UIButton)giftAgainButton
{
  return self->_giftAgainButton;
}

- (SUUIGiftItemView)itemView
{
  return self->_itemView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_itemView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_giftAgainButton, 0);
}

@end
