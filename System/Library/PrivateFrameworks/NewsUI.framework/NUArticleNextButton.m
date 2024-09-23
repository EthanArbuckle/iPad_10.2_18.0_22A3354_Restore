@implementation NUArticleNextButton

+ (id)titleLabelFont
{
  if (titleLabelFont_onceToken != -1)
    dispatch_once(&titleLabelFont_onceToken, &__block_literal_global_1);
  return (id)titleLabelFont_font;
}

void __37__NUArticleNextButton_titleLabelFont__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 13.0, *MEMORY[0x24BDF7860]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)titleLabelFont_font;
  titleLabelFont_font = v0;

}

+ (id)nextArrowImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__NUArticleNextButton_nextArrowImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (nextArrowImage_onceToken != -1)
    dispatch_once(&nextArrowImage_onceToken, block);
  return (id)nextArrowImage_image;
}

void __37__NUArticleNextButton_nextArrowImage__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", *(_QWORD *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("icon-article-next-arrow"), v4, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)nextArrowImage_image;
  nextArrowImage_image = v2;

}

- (NUArticleNextButton)initWithFrame:(CGRect)a3
{
  NUArticleNextButton *v3;
  id v4;
  uint64_t v5;
  UILabel *nextTitleLabel;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  UIImageView *nextArrowImageView;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NUArticleNextButton;
  v3 = -[NUArticleNextButton initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6B68]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    nextTitleLabel = v3->_nextTitleLabel;
    v3->_nextTitleLabel = (UILabel *)v5;

    -[UILabel setTextAlignment:](v3->_nextTitleLabel, "setTextAlignment:", 2);
    objc_msgSend((id)objc_opt_class(), "titleLabelFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_nextTitleLabel, "setFont:", v7);

    -[UILabel nu_supportViewDebugging](v3->_nextTitleLabel, "nu_supportViewDebugging");
    -[NUArticleNextButton addSubview:](v3, "addSubview:", v3->_nextTitleLabel);
    v8 = objc_alloc(MEMORY[0x24BDF6AE8]);
    objc_msgSend((id)objc_opt_class(), "nextArrowImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithImage:", v9);
    nextArrowImageView = v3->_nextArrowImageView;
    v3->_nextArrowImageView = (UIImageView *)v10;

    -[UIImageView setAlpha:](v3->_nextArrowImageView, "setAlpha:", 0.0);
    -[NUArticleNextButton addSubview:](v3, "addSubview:", v3->_nextArrowImageView);
    -[UIView nu_supportViewDebugging](v3, "nu_supportViewDebugging");
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double Width;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  objc_super v23;
  CGRect v24;
  CGRect v25;

  v23.receiver = self;
  v23.super_class = (Class)NUArticleNextButton;
  -[NUArticleNextButton layoutSubviews](&v23, sel_layoutSubviews);
  -[NUArticleNextButton center](self, "center");
  v4 = v3;
  v6 = v5;
  -[NUArticleNextButton nextArrowImageView](self, "nextArrowImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCenter:", v4, v6);

  -[NUArticleNextButton nextArrowImageView](self, "nextArrowImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[NUArticleNextButton frame](self, "frame");
  Width = CGRectGetWidth(v24);
  v25.origin.x = v10;
  v25.origin.y = v12;
  v25.size.width = v14;
  v25.size.height = v16;
  v18 = Width - CGRectGetWidth(v25);
  -[NUArticleNextButton nextArrowImageView](self, "nextArrowImageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v18, v12, v14, v16);

  -[NUArticleNextButton frame](self, "frame");
  v21 = v20;
  -[NUArticleNextButton nextTitleLabel](self, "nextTitleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", 0.0, 0.0, v18 + -10.0, v21);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NUArticleNextButton;
  -[NUArticleNextButton setHighlighted:](&v8, sel_setHighlighted_);
  if (v3)
    v5 = 0.5;
  else
    v5 = 1.0;
  -[NUArticleNextButton nextTitleLabel](self, "nextTitleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v5);

  -[NUArticleNextButton nextArrowImageView](self, "nextArrowImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v5);

}

- (void)setNextLabelTitle:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  if (a3)
  {
    v4 = a4;
    objc_msgSend(a3, "uppercaseString");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[NUArticleNextButton nextTitleLabel](self, "nextTitleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v16, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      if (v4)
      {
        objc_msgSend(MEMORY[0x24BDE57E8], "animation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setType:", *MEMORY[0x24BDE5E00]);
        objc_msgSend(v9, "setDuration:", 0.15);
        -[NUArticleNextButton nextTitleLabel](self, "nextTitleLabel");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "layer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addAnimation:forKey:", v9, CFSTR("crossfade"));

        -[NUArticleNextButton nextArrowImageView](self, "nextArrowImageView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "layer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addAnimation:forKey:", v9, CFSTR("crossfade"));

      }
      -[NUArticleNextButton nextTitleLabel](self, "nextTitleLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setText:", v16);

      -[NUArticleNextButton nextArrowImageView](self, "nextArrowImageView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAlpha:", 1.0);

    }
  }
}

- (UILabel)nextTitleLabel
{
  return self->_nextTitleLabel;
}

- (UIImageView)nextArrowImageView
{
  return self->_nextArrowImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextArrowImageView, 0);
  objc_storeStrong((id *)&self->_nextTitleLabel, 0);
}

@end
