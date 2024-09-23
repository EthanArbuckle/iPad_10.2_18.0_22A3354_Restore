@implementation CAMSpatialCaptureRecordingIndicator

- (CAMSpatialCaptureRecordingIndicator)initWithFrame:(CGRect)a3
{
  CAMSpatialCaptureRecordingIndicator *v3;
  UIImageView *v4;
  UIImageView *imageView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CAMSpatialCaptureRecordingIndicator;
  v3 = -[CAMSpatialCaptureRecordingIndicator initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v3->__imageView;
    v3->__imageView = v4;

    CAMRedColor();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSpatialCaptureRecordingIndicator setBackgroundColor:](v3, "setBackgroundColor:", v6);

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", CFSTR("visionpro"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v3->__imageView, "setImage:", v8);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v3->__imageView, "setTintColor:", v9);

    -[CAMSpatialCaptureRecordingIndicator addSubview:](v3, "addSubview:", v3->__imageView);
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CAMSpatialCaptureRecordingIndicator;
  -[CAMSpatialCaptureRecordingIndicator layoutSubviews](&v15, sel_layoutSubviews);
  -[CAMSpatialCaptureRecordingIndicator bounds](self, "bounds");
  v4 = v3 * 0.5;
  -[CAMSpatialCaptureRecordingIndicator layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", v4);

  -[CAMSpatialCaptureRecordingIndicator bounds](self, "bounds");
  UIRectGetCenter();
  -[CAMSpatialCaptureRecordingIndicator _imageView](self, "_imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CAMViewAlignmentSize(v6);
  CEKRectWithSize();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  objc_msgSend(v6, "setCenter:");
  objc_msgSend(v6, "setBounds:", v8, v10, v12, v14);

}

- (void)setOrientation:(int64_t)a3
{
  -[CAMSpatialCaptureRecordingIndicator setOrientation:animated:](self, "setOrientation:animated:", a3, 0);
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  if (self->_orientation != a3)
  {
    v4 = a4;
    self->_orientation = a3;
    -[CAMSpatialCaptureRecordingIndicator _imageView](self, "_imageView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[CAMView rotateView:toInterfaceOrientation:animated:](CAMView, "rotateView:toInterfaceOrientation:animated:", v6, -[CAMSpatialCaptureRecordingIndicator orientation](self, "orientation"), v4);

  }
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (UIImageView)_imageView
{
  return self->__imageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__imageView, 0);
}

@end
