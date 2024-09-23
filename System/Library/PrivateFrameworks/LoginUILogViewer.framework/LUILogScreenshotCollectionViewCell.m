@implementation LUILogScreenshotCollectionViewCell

- (LUILogScreenshotCollectionViewCell)initWithFrame:(CGRect)a3
{
  LUILogScreenshotCollectionViewCell *v3;
  LUILogScreenshotCollectionViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LUILogScreenshotCollectionViewCell;
  v3 = -[LUILogScreenshotCollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[LUILogScreenshotCollectionViewCell _setup](v3, "_setup");
  return v4;
}

- (void)_setup
{
  UIImageView *v3;
  UIImageView *screenshotImageView;
  UILabel *v5;
  UILabel *screenshotDateLabel;
  UIButton *v7;
  UIButton *clearButton;
  void *v9;
  void *v10;
  id v11;

  -[LUILogScreenshotCollectionViewCell _createScreenshotImageView](self, "_createScreenshotImageView");
  v3 = (UIImageView *)objc_claimAutoreleasedReturnValue();
  screenshotImageView = self->_screenshotImageView;
  self->_screenshotImageView = v3;

  -[LUILogScreenshotCollectionViewCell _createScreenshotDateLabel](self, "_createScreenshotDateLabel");
  v5 = (UILabel *)objc_claimAutoreleasedReturnValue();
  screenshotDateLabel = self->_screenshotDateLabel;
  self->_screenshotDateLabel = v5;

  -[LUILogScreenshotCollectionViewCell _createClearButton](self, "_createClearButton");
  v7 = (UIButton *)objc_claimAutoreleasedReturnValue();
  clearButton = self->_clearButton;
  self->_clearButton = v7;

  -[LUILogScreenshotCollectionViewCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", self->_screenshotImageView);

  -[LUILogScreenshotCollectionViewCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", self->_screenshotDateLabel);

  -[LUILogScreenshotCollectionViewCell contentView](self, "contentView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", self->_clearButton);

}

- (void)layoutSubviews
{
  double Width;
  CGFloat v4;
  CGRect v5;
  CGRect v6;
  CGRect v7;
  CGRect v8;
  CGRect v9;

  -[LUILogScreenshotCollectionViewCell frame](self, "frame");
  Width = CGRectGetWidth(v5);
  -[LUILogScreenshotCollectionViewCell frame](self, "frame");
  -[UIImageView setFrame:](self->_screenshotImageView, "setFrame:", 0.0, 10.0, Width, CGRectGetHeight(v6) + -10.0 + -30.0);
  -[LUILogScreenshotCollectionViewCell frame](self, "frame");
  v4 = CGRectGetHeight(v7) + -30.0;
  -[LUILogScreenshotCollectionViewCell frame](self, "frame");
  -[UILabel setFrame:](self->_screenshotDateLabel, "setFrame:", 0.0, v4, CGRectGetWidth(v8), 30.0);
  -[LUILogScreenshotCollectionViewCell frame](self, "frame");
  -[UIButton setFrame:](self->_clearButton, "setFrame:", CGRectGetWidth(v9) + -20.0, 0.0, 20.0, 20.0);
}

- (id)_createClearButton
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", CFSTR("redDeleteIcon"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:forState:", v4, 0);

  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel_clearButtonTapped_, 64);
  return v3;
}

- (id)_createScreenshotDateLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextColor:", v3);

  objc_msgSend(v2, "setTextAlignment:", 1);
  return v2;
}

- (id)_createScreenshotImageView
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setContentMode:", 1);
  return v2;
}

- (void)clearButtonTapped:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[LUILogScreenshotCollectionViewCell clearButtonAction](self, "clearButtonAction", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[LUILogScreenshotCollectionViewCell clearButtonAction](self, "clearButtonAction");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (UIImageView)screenshotImageView
{
  return self->_screenshotImageView;
}

- (UILabel)screenshotDateLabel
{
  return self->_screenshotDateLabel;
}

- (UIButton)clearButton
{
  return self->_clearButton;
}

- (id)clearButtonAction
{
  return self->_clearButtonAction;
}

- (void)setClearButtonAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 672);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clearButtonAction, 0);
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_screenshotDateLabel, 0);
  objc_storeStrong((id *)&self->_screenshotImageView, 0);
}

@end
