@implementation AVTCaptureButtonView

- (AVTCaptureButtonView)initWithFrame:(CGRect)a3
{
  AVTCaptureButtonView *v3;
  uint64_t v4;
  UIButton *button;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVTCaptureButtonView;
  v3 = -[AVTCaptureButtonView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v4 = objc_claimAutoreleasedReturnValue();
    button = v3->_button;
    v3->_button = (UIButton *)v4;

    -[UIButton sizeToFit](v3->_button, "sizeToFit");
    -[AVTCaptureButtonView addSubview:](v3, "addSubview:", v3->_button);
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AVTCaptureButtonView;
  -[AVTCaptureButtonView layoutSubviews](&v13, sel_layoutSubviews);
  -[AVTCaptureButtonView button](self, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  -[AVTCaptureButtonView bounds](self, "bounds");
  UIRectCenteredIntegralRect();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[AVTCaptureButtonView button](self, "button");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
}

@end
