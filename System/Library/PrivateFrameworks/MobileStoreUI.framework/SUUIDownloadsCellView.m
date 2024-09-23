@implementation SUUIDownloadsCellView

- (SUUIDownloadsCellView)init
{
  SUUIDownloadsCellView *v2;
  UILabel *v3;
  UILabel *titleLabel;
  UILabel *v5;
  UILabel *subtitleLabel;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  UIImageView *v11;
  UIImageView *imageView;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  UIImageView *v18;
  void *v19;
  uint64_t v20;
  UIButton *button;
  UISlider *v22;
  UISlider *progressSlider;
  UISlider *v24;
  id v25;
  void *v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)SUUIDownloadsCellView;
  v2 = -[SUUIDownloadsCellView init](&v28, sel_init);
  if (v2)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    titleLabel = v2->_titleLabel;
    v2->_titleLabel = v3;

    -[SUUIDownloadsCellView addSubview:](v2, "addSubview:", v2->_titleLabel);
    -[SUUIDownloadsCellView setAttributedTitle:](v2, "setAttributedTitle:", 0);
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    subtitleLabel = v2->_subtitleLabel;
    v2->_subtitleLabel = v5;

    v7 = v2->_subtitleLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v8);

    v9 = v2->_subtitleLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9, "setTextColor:", v10);

    -[SUUIDownloadsCellView addSubview:](v2, "addSubview:", v2->_subtitleLabel);
    -[SUUIDownloadsCellView setSubtitle:](v2, "setSubtitle:", 0);
    v11 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    imageView = v2->_imageView;
    v2->_imageView = v11;

    -[UIImageView setContentMode:](v2->_imageView, "setContentMode:", 1);
    -[UIImageView layer](v2->_imageView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v13, "setBorderColor:", objc_msgSend(v14, "CGColor"));

    -[UIImageView layer](v2->_imageView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scale");
    objc_msgSend(v15, "setBorderWidth:", 1.0 / v17);

    v18 = v2->_imageView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.8, 1.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v18, "setBackgroundColor:", v19);

    -[SUUIDownloadsCellView addSubview:](v2, "addSubview:", v2->_imageView);
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 0);
    v20 = objc_claimAutoreleasedReturnValue();
    button = v2->_button;
    v2->_button = (UIButton *)v20;

    -[UIButton setUserInteractionEnabled:](v2->_button, "setUserInteractionEnabled:", 0);
    -[SUUIDownloadsCellView addSubview:](v2, "addSubview:", v2->_button);
    v22 = (UISlider *)objc_alloc_init(MEMORY[0x24BEBD958]);
    progressSlider = v2->_progressSlider;
    v2->_progressSlider = v22;

    -[UISlider setUserInteractionEnabled:](v2->_progressSlider, "setUserInteractionEnabled:", 0);
    v24 = v2->_progressSlider;
    v25 = objc_alloc_init(MEMORY[0x24BEBD640]);
    -[UISlider setThumbImage:forState:](v24, "setThumbImage:forState:", v25, 0);

    -[SUUIDownloadsCellView addSubview:](v2, "addSubview:", v2->_progressSlider);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIDownloadsCellView setBackgroundColor:](v2, "setBackgroundColor:", v26);

  }
  return v2;
}

- (void)setAttributedTitle:(id)a3
{
  NSAttributedString *v5;
  UILabel *titleLabel;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = (NSAttributedString *)a3;
  if (self->_attributedTitle != v5)
  {
    objc_storeStrong((id *)&self->_attributedTitle, a3);
    titleLabel = self->_titleLabel;
    if (v5)
    {
      -[UILabel setAttributedText:](titleLabel, "setAttributedText:", v5);
    }
    else
    {
      v7 = objc_alloc(MEMORY[0x24BDD1458]);
      v11 = *MEMORY[0x24BEBB360];
      objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v7, "initWithString:attributes:", CFSTR(" "), v9);
      -[UILabel setAttributedText:](titleLabel, "setAttributedText:", v10);

    }
  }

}

- (void)setSubtitle:(id)a3
{
  const __CFString *v5;
  NSString *v6;

  v6 = (NSString *)a3;
  if (self->_subtitle != v6)
  {
    objc_storeStrong((id *)&self->_subtitle, a3);
    if (v6)
      v5 = (const __CFString *)v6;
    else
      v5 = CFSTR(" ");
    -[UILabel setText:](self->_subtitleLabel, "setText:", v5);
  }

}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UIImageView image](self->_imageView, "image");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    -[UIImageView setImage:](self->_imageView, "setImage:", v6);
    -[SUUIDownloadsCellView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setIsPad:(BOOL)a3
{
  if (self->_isPad != a3)
  {
    self->_isPad = a3;
    -[SUUIDownloadsCellView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)progress
{
  float v2;

  -[UISlider value](self->_progressSlider, "value");
  return v2;
}

- (void)setProgress:(double)a3
{
  *(float *)&a3 = a3;
  -[UISlider setValue:](self->_progressSlider, "setValue:", a3);
}

- (void)setButtonType:(int64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_buttonType != a3)
  {
    self->_buttonType = a3;
    if (a3 == 2)
    {
      v4 = (void *)MEMORY[0x24BEBD640];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = CFSTR("DownloadsResumeIcon");
    }
    else
    {
      if (a3 != 1)
      {
        v7 = 0;
        goto LABEL_8;
      }
      v4 = (void *)MEMORY[0x24BEBD640];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = CFSTR("DownloadsPauseIcon");
    }
    objc_msgSend(v4, "imageNamed:inBundle:", v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
    -[UIButton setHidden:](self->_button, "setHidden:", self->_buttonType == 0);
    -[SUUIDownloadsCellView tintColor](self, "tintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_flatImageWithColor:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[UIButton setImage:forState:](self->_button, "setImage:forState:", v9, 0);
    -[SUUIDownloadsCellView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIDownloadsCellView;
  v4 = a3;
  -[SUUIDownloadsCellView setBackgroundColor:](&v5, sel_setBackgroundColor_, v4);
  -[UISlider setBackgroundColor:](self->_progressSlider, "setBackgroundColor:", v4, v5.receiver, v5.super_class);
  -[UIButton setBackgroundColor:](self->_button, "setBackgroundColor:", v4);
  -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v4);
  -[UILabel setBackgroundColor:](self->_subtitleLabel, "setBackgroundColor:", v4);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double MaxX;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float v24;
  float v25;
  _BOOL4 isPad;
  void *v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  float v32;
  CGFloat v33;
  CGFloat v34;
  double MinX;
  double v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  double v48;
  double v49;
  objc_super v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v50.receiver = self;
  v50.super_class = (Class)SUUIDownloadsCellView;
  -[SUUIDownloadsCellView layoutSubviews](&v50, sel_layoutSubviews);
  -[SUUIDownloadsCellView bounds](self, "bounds");
  v7 = v6;
  if (self->_isPad)
    v8 = 15.0;
  else
    v8 = 10.0;
  v9 = v3 + v8;
  v49 = v4;
  v10 = v7;
  MaxX = CGRectGetMaxX(*(CGRect *)&v3);
  if (self->_isPad)
    v12 = 15.0;
  else
    v12 = 10.0;
  -[UIImageView image](self->_imageView, "image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[UIImageView image](self->_imageView, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "size");
    v16 = v15;
    v18 = v17;

    v19 = 75.0;
    if (!self->_isPad)
      v19 = 44.0;
    v20 = v19 / v16;
    if (v19 / v16 >= v19 / v18)
      v20 = v19 / v18;
    v21 = v16 * v20;
    v22 = v18 * v20;
  }
  else
  {
    v19 = 75.0;
    if (!self->_isPad)
      v19 = 44.0;
    v21 = v19;
    v22 = v19;
  }
  v23 = MaxX - v12;
  v24 = (v7 - v22) * 0.5;
  v25 = v9 + (v19 - v21) * 0.5;
  -[UIImageView setFrame:](self->_imageView, "setFrame:", roundf(v25), roundf(v24));
  isPad = self->_isPad;
  -[UIButton imageForState:](self->_button, "imageForState:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[UIButton sizeToFit](self->_button, "sizeToFit");
    -[UIButton frame](self->_button, "frame");
    v29 = v28;
    v31 = v30;
    v32 = (v7 - v30) * 0.5;
    v33 = roundf(v32);
    v34 = v23 - v28;
    -[UIButton setFrame:](self->_button, "setFrame:", v34, v33);
    v51.origin.x = v34;
    v51.origin.y = v33;
    v51.size.width = v29;
    v51.size.height = v31;
    MinX = CGRectGetMinX(v51);
    v36 = 15.0;
    if (!self->_isPad)
      v36 = 10.0;
    v23 = MinX - v36;
  }
  v37 = 90.0;
  if (!isPad)
    v37 = 54.0;
  v38 = v9 + v37;
  v39 = v23 - (v9 + v37);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v39, v7);
  v41 = v40;
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v39, v7);
  v43 = v42;
  v48 = v42;
  -[UISlider sizeThatFits:](self->_progressSlider, "sizeThatFits:", v39, v7);
  v45 = v44;
  *(float *)&v44 = (v7 - (v43 + v41 + -4.0 + -3.0 + 10.0 + v44 + 10.0 + -3.0 + -3.0)) * 0.5;
  v46 = v49 + roundf(*(float *)&v44) + -4.0;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v38, v46, v39, v41);
  v52.origin.x = v38;
  v52.origin.y = v46;
  v52.size.width = v39;
  v52.size.height = v41;
  v47 = CGRectGetMaxY(v52) + -3.0 + 10.0;
  -[UISlider setFrame:](self->_progressSlider, "setFrame:", v38, v47, v39, v45);
  v53.origin.x = v38;
  v53.origin.y = v47;
  v53.size.width = v39;
  v53.size.height = v45;
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v38, CGRectGetMaxY(v53) + 10.0 + -3.0, v39, v48);
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (UIButton)button
{
  return self->_button;
}

- (int64_t)buttonType
{
  return self->_buttonType;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (BOOL)isPad
{
  return self->_isPad;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_progressSlider, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
