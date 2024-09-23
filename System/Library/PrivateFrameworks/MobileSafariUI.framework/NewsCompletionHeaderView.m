@implementation NewsCompletionHeaderView

- (NewsCompletionHeaderView)initWithReuseIdentifier:(id)a3
{
  NewsCompletionHeaderView *v3;
  id v4;
  void *v5;
  uint64_t v6;
  UIImageView *newsImage;
  void *v8;
  UILabel *v9;
  UILabel *newsLabel;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NewsCompletionHeaderView *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)NewsCompletionHeaderView;
  v3 = -[NewsCompletionHeaderView initWithReuseIdentifier:](&v17, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("NewsSearchIcon"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithImage:", v5);
    newsImage = v3->_newsImage;
    v3->_newsImage = (UIImageView *)v6;

    -[NewsCompletionHeaderView contentView](v3, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v3->_newsImage);

    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    newsLabel = v3->_newsLabel;
    v3->_newsLabel = v9;

    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_newsLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v3->_newsLabel, "setBackgroundColor:", v11);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_newsLabel, "setFont:", v12);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_newsLabel, "setTextColor:", v13);

    -[NewsCompletionHeaderView contentView](v3, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v3->_newsLabel);

    v15 = v3;
  }

  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  int v7;
  double v8;
  double Height;
  UILabel *newsLabel;
  CGFloat v11;
  UIImageView **p_newsImage;
  objc_super v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v13.receiver = self;
  v13.super_class = (Class)NewsCompletionHeaderView;
  -[NewsCompletionHeaderView layoutSubviews](&v13, sel_layoutSubviews);
  -[NewsCompletionHeaderView frame](self, "frame");
  v4 = v3 * 0.5;
  v5 = 19.0;
  v6 = v3 * 0.5 * 1.6 + 19.0;
  v7 = -[NewsCompletionHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[NewsCompletionHeaderView frame](self, "frame");
  v8 = CGRectGetWidth(v14) - v6;
  -[NewsCompletionHeaderView frame](self, "frame");
  Height = CGRectGetHeight(v15);
  newsLabel = self->_newsLabel;
  if (v7)
  {
    -[UILabel setFrame:](newsLabel, "setFrame:", 0.0, 0.0, v8, Height);
    -[NewsCompletionHeaderView frame](self, "frame");
    v11 = CGRectGetWidth(v16) + -19.0;
    p_newsImage = &self->_newsImage;
    -[UIImageView frame](*p_newsImage, "frame");
    v5 = v11 - CGRectGetWidth(v17);
  }
  else
  {
    -[UILabel setFrame:](newsLabel, "setFrame:", v6, 0.0, v8, Height);
    p_newsImage = &self->_newsImage;
  }
  -[UIImageView setFrame:](*p_newsImage, "setFrame:", v5, v4 * 0.5, v4, v4);
}

- (void)setHeaderText:(id)a3
{
  -[UILabel setText:](self->_newsLabel, "setText:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newsLabel, 0);
  objc_storeStrong((id *)&self->_newsImage, 0);
}

@end
