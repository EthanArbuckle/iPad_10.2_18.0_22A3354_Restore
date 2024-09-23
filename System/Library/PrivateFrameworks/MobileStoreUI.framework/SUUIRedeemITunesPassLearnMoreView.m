@implementation SUUIRedeemITunesPassLearnMoreView

- (UIControl)button
{
  UIButton *button;
  UIButton *v4;
  UIButton *v5;
  UIButton *v6;
  void *v7;
  void *v8;
  void *v9;

  button = self->_button;
  if (!button)
  {
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_button;
    self->_button = v4;

    v6 = self->_button;
    -[SUUIRedeemITunesPassLearnMoreView backgroundColor](self, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[UIButton titleLabel](self->_button, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 18.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v9);

    -[SUUIRedeemITunesPassLearnMoreView addSubview:](self, "addSubview:", self->_button);
    button = self->_button;
  }
  return (UIControl *)button;
}

- (NSString)buttonTitle
{
  return -[UIButton titleForState:](self->_button, "titleForState:", 0);
}

- (NSString)explanationString
{
  return -[UILabel text](self->_explanationLabel, "text");
}

- (UIImage)headerImage
{
  return -[UIImageView image](self->_headerImageView, "image");
}

- (void)setButtonTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SUUIRedeemITunesPassLearnMoreView button](self, "button");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:forState:", v4, 0);

  -[SUUIRedeemITunesPassLearnMoreView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setExplanationString:(id)a3
{
  id v4;
  UILabel *explanationLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  id v14;

  v4 = a3;
  explanationLabel = self->_explanationLabel;
  v14 = v4;
  if (!explanationLabel)
  {
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    v7 = self->_explanationLabel;
    self->_explanationLabel = v6;

    v8 = self->_explanationLabel;
    -[SUUIRedeemITunesPassLearnMoreView backgroundColor](self, "backgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

    v10 = self->_explanationLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10, "setFont:", v11);

    -[UILabel setNumberOfLines:](self->_explanationLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](self->_explanationLabel, "setTextAlignment:", 1);
    v12 = self->_explanationLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.600000024);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12, "setTextColor:", v13);

    -[SUUIRedeemITunesPassLearnMoreView addSubview:](self, "addSubview:", self->_explanationLabel);
    v4 = v14;
    explanationLabel = self->_explanationLabel;
  }
  -[UILabel setText:](explanationLabel, "setText:", v4);
  -[SUUIRedeemITunesPassLearnMoreView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setHeaderImage:(id)a3
{
  id v4;
  UIImageView *headerImageView;
  UIImageView *v6;
  UIImageView *v7;
  UIImageView *v8;
  void *v9;
  id v10;

  v4 = a3;
  headerImageView = self->_headerImageView;
  v10 = v4;
  if (!headerImageView)
  {
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    v7 = self->_headerImageView;
    self->_headerImageView = v6;

    v8 = self->_headerImageView;
    -[SUUIRedeemITunesPassLearnMoreView backgroundColor](self, "backgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    -[SUUIRedeemITunesPassLearnMoreView addSubview:](self, "addSubview:", self->_headerImageView);
    v4 = v10;
    headerImageView = self->_headerImageView;
  }
  -[UIImageView setImage:](headerImageView, "setImage:", v4);
  -[SUUIRedeemITunesPassLearnMoreView setNeedsLayout](self, "setNeedsLayout");

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
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  float v23;
  CGFloat v24;
  CGFloat v25;
  float v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect v32;
  CGRect v33;

  -[SUUIRedeemITunesPassLearnMoreView bounds](self, "bounds");
  v30 = v3;
  v5 = v4;
  v6 = v4 + -20.0;
  v7 = v3 + -30.0;
  -[UIImageView frame](self->_headerImageView, "frame");
  -[UIImageView sizeThatFits:](self->_headerImageView, "sizeThatFits:", v7, 1.79769313e308);
  v9 = v8;
  v11 = v10;
  -[UILabel frame](self->_explanationLabel, "frame");
  -[UILabel sizeThatFits:](self->_explanationLabel, "sizeThatFits:", v7, 1.79769313e308);
  v13 = v12;
  v15 = v14;
  v28 = v14;
  -[UIButton frame](self->_button, "frame");
  -[UIButton sizeThatFits:](self->_button, "sizeThatFits:", v7, 1.79769313e308);
  v29 = v16;
  v31 = v17;
  v18 = v11 + v15 + v17;
  *(float *)&v17 = fmin((v6 - v18) * 0.5, 40.0);
  v19 = floorf(*(float *)&v17);
  *(float *)&v18 = v18 + v19 + -7.0 + v19;
  *(float *)&v17 = (v30 - v9) * 0.5;
  v20 = floorf(*(float *)&v17);
  *(float *)&v18 = (v5 - ceilf(*(float *)&v18)) * 0.5;
  v21 = floorf(*(float *)&v18);
  -[UIImageView setFrame:](self->_headerImageView, "setFrame:", v20, v21, v9, v11);
  v22 = v13;
  v23 = (v30 - v13) * 0.5;
  v24 = floorf(v23);
  v32.origin.x = v20;
  v32.origin.y = v21;
  v32.size.width = v9;
  v32.size.height = v11;
  v25 = CGRectGetMaxY(v32) + v19 + -7.0;
  -[UILabel setFrame:](self->_explanationLabel, "setFrame:", v24, v25, v13, v28);
  v26 = (v30 - v29) * 0.5;
  v27 = floorf(v26);
  v33.origin.x = v24;
  v33.origin.y = v25;
  v33.size.width = v22;
  v33.size.height = v28;
  -[UIButton setFrame:](self->_button, "setFrame:", v27, CGRectGetMaxY(v33) + v19, v29, v31);
}

- (void)setBackgroundColor:(id)a3
{
  UIButton *button;
  id v5;
  objc_super v6;

  button = self->_button;
  v5 = a3;
  -[UIButton setBackgroundColor:](button, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_explanationLabel, "setBackgroundColor:", v5);
  -[UIImageView setBackgroundColor:](self->_headerImageView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUIRedeemITunesPassLearnMoreView;
  -[SUUIRedeemITunesPassLearnMoreView setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerImageView, 0);
  objc_storeStrong((id *)&self->_explanationLabel, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
