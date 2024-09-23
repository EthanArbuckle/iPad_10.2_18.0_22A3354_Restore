@implementation CAMReviewTransitionButton

- (CAMReviewTransitionButton)initWithFrame:(CGRect)a3
{
  CAMReviewTransitionButton *v3;
  id v4;
  id v5;
  void *v6;
  UIView *v7;
  UIView *innerCircle;
  UIImageView *v9;
  UIImageView *imageView;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CAMReviewTransitionButton;
  v3 = -[CAMReviewTransitionButton initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor")));
    v5 = objc_msgSend(v4, "CGColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CAMReviewTransitionButton layer](v3, "layer"));
    objc_msgSend(v6, "setBorderColor:", v5);

    v7 = (UIView *)objc_alloc_init((Class)UIView);
    innerCircle = v3->_innerCircle;
    v3->_innerCircle = v7;

    -[CAMReviewTransitionButton addSubview:](v3, "addSubview:", v3->_innerCircle);
    v9 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    imageView = v3->_imageView;
    v3->_imageView = v9;

    -[CAMReviewTransitionButton addSubview:](v3, "addSubview:", v3->_imageView);
  }
  return v3;
}

- (void)configureWithShutterButtonSpec:(CAMShutterButtonSpec *)a3
{
  double var1;
  double var0;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  var0 = a3->var0;
  var1 = a3->var1;
  v6 = a3->var0 + var1 * -2.0 + a3->var4 * -2.0;
  -[CAMReviewTransitionButton setBounds:](self, "setBounds:", 0.0, 0.0, a3->var0, a3->var0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CAMReviewTransitionButton layer](self, "layer"));
  objc_msgSend(v7, "setCornerRadius:", var0 * 0.5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CAMReviewTransitionButton layer](self, "layer"));
  objc_msgSend(v8, "setBorderWidth:", var1);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[CAMReviewTransitionButton innerCircle](self, "innerCircle"));
  objc_msgSend(v11, "setCenter:", UIRectGetCenter(-[CAMReviewTransitionButton bounds](self, "bounds")));
  objc_msgSend(v11, "setBounds:", 0.0, 0.0, v6, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layer"));
  objc_msgSend(v9, "setCornerRadius:", v6 * 0.5);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CAMReviewTransitionButton imageView](self, "imageView"));
  objc_msgSend(v11, "center");
  objc_msgSend(v10, "setCenter:");
  objc_msgSend(v11, "bounds");
  objc_msgSend(v10, "setBounds:");

}

- (UIView)innerCircle
{
  return self->_innerCircle;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_innerCircle, 0);
}

@end
