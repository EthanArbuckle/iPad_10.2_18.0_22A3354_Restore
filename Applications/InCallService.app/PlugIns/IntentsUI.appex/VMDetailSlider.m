@implementation VMDetailSlider

- (VMDetailSlider)init
{
  return -[VMDetailSlider initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (VMDetailSlider)initWithCoder:(id)a3
{
  VMDetailSlider *v3;
  VMDetailSlider *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VMDetailSlider;
  v3 = -[VMDetailSlider initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[VMDetailSlider commonInit](v3, "commonInit");
  return v4;
}

- (VMDetailSlider)initWithFrame:(CGRect)a3
{
  VMDetailSlider *v3;
  VMDetailSlider *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VMDetailSlider;
  v3 = -[VMDetailSlider initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[VMDetailSlider commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  void *v3;
  MPDetailScrubController *v4;
  MPDetailScrubController *detailScrubController;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VMDetailSlider traitCollection](self, "traitCollection"));
  self->_accessibilityConstraintsEnabled = objc_msgSend(v3, "isPreferredContentSizeCategoryAccessible");

  v4 = (MPDetailScrubController *)objc_msgSend(objc_alloc((Class)MPDetailScrubController), "initWithScrubbingControl:", self);
  detailScrubController = self->_detailScrubController;
  self->_detailScrubController = v4;

  -[MPDetailScrubController setDelegate:](self->_detailScrubController, "setDelegate:", self);
  -[MPDetailScrubController setDetailedScrubbingEnabled:](self->_detailScrubController, "setDetailedScrubbingEnabled:", 0);
  self->_minimumTime = 0.0;
  -[VMDetailSlider setDeliversTouchesForGesturesToSuperview:](self, "setDeliversTouchesForGesturesToSuperview:", 0);
  -[VMDetailSlider updateThumbImage](self, "updateThumbImage");
  -[VMDetailSlider updateTrackImages](self, "updateTrackImages");
}

- (void)setMaximumTime:(double)a3
{
  void *v5;
  unsigned __int8 v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMDetailSlider detailScrubController](self, "detailScrubController"));
  v6 = objc_msgSend(v5, "isTracking");

  if ((v6 & 1) == 0 && vabdd_f64(self->_maximumTime, a3) > 2.22044605e-16)
  {
    self->_maximumTime = a3;
    v7 = (id)objc_claimAutoreleasedReturnValue(-[VMDetailSlider detailScrubController](self, "detailScrubController"));
    objc_msgSend(v7, "setDuration:", a3);

  }
}

- (void)setElapsedTime:(double)a3
{
  -[VMDetailSlider setElapsedTime:animated:](self, "setElapsedTime:animated:", 0, a3);
}

- (void)setElapsedTime:(double)a3 animated:(BOOL)a4
{
  -[VMDetailSlider setElapsedTime:animated:force:](self, "setElapsedTime:animated:force:", a4, 0, a3);
}

- (void)setElapsedTime:(double)a3 animated:(BOOL)a4 force:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  unsigned __int8 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v5 = a4;
  if (a5
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[VMDetailSlider detailScrubController](self, "detailScrubController")),
        v9 = objc_msgSend(v8, "isTracking"),
        v8,
        (v9 & 1) == 0))
  {
    v10 = a3;
    if (vabdd_f64(self->_elapsedTime, a3) > 2.22044605e-16)
    {
      -[VMDetailSlider minimumTime](self, "minimumTime");
      v12 = v11;
      -[VMDetailSlider maximumTime](self, "maximumTime");
      if (v12 >= v10)
        v14 = v12;
      else
        v14 = v10;
      if (v14 >= v13)
        v14 = v13;
      v15 = v14 / v13;
      self->_elapsedTime = v14;
      *(float *)&v15 = v15;
      -[VMDetailSlider setValue:animated:](self, "setValue:animated:", v5, v15);
    }
  }
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  char v21;
  void *v22;
  CGPoint v24;
  CGRect v25;

  v6 = a3;
  v7 = a4;
  -[VMDetailSlider thumbHitRect](self, "thumbHitRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v6, "locationInView:", self);
  v24.x = v16;
  v24.y = v17;
  v25.origin.x = v9;
  v25.origin.y = v11;
  v25.size.width = v13;
  v25.size.height = v15;
  if (CGRectContainsPoint(v25, v24))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[VMDetailSlider detailScrubController](self, "detailScrubController"));
    v19 = objc_msgSend(v18, "beginTrackingWithTouch:withEvent:", v6, v7);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[VMDetailSlider delegate](self, "delegate"));
    v21 = objc_opt_respondsToSelector(v20, "detailSliderTrackingDidBegin:");

    if ((v21 & 1) != 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[VMDetailSlider delegate](self, "delegate"));
      objc_msgSend(v22, "detailSliderTrackingDidBegin:", self);

    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)cancelTrackingWithEvent:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VMDetailSlider detailScrubController](self, "detailScrubController"));
  v5 = objc_msgSend(v4, "isTracking");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VMDetailSlider detailScrubController](self, "detailScrubController"));
    objc_msgSend(v6, "cancelTrackingWithEvent:", v11);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VMDetailSlider currentThumbImage](self, "currentThumbImage"));
    v8 = objc_claimAutoreleasedReturnValue(-[VMDetailSlider thumbImageView](self, "thumbImageView"));
    objc_msgSend((id)v8, "setImage:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VMDetailSlider delegate](self, "delegate"));
    LOBYTE(v8) = objc_opt_respondsToSelector(v9, "detailSliderTrackingDidCancel:");

    if ((v8 & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[VMDetailSlider delegate](self, "delegate"));
      objc_msgSend(v10, "detailSliderTrackingDidCancel:", self);

    }
  }

}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;

  v6 = a4;
  v7 = a3;
  if (-[VMDetailSlider isContinuous](self, "isContinuous"))
    -[VMDetailSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VMDetailSlider detailScrubController](self, "detailScrubController"));
  v9 = objc_msgSend(v8, "continueTrackingWithTouch:withEvent:", v7, v6);

  return v9;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VMDetailSlider detailScrubController](self, "detailScrubController"));
  v8 = objc_msgSend(v7, "isTracking");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VMDetailSlider detailScrubController](self, "detailScrubController"));
    objc_msgSend(v9, "endTrackingWithTouch:withEvent:", v14, v6);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VMDetailSlider currentThumbImage](self, "currentThumbImage"));
    v11 = objc_claimAutoreleasedReturnValue(-[VMDetailSlider thumbImageView](self, "thumbImageView"));
    objc_msgSend((id)v11, "setImage:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VMDetailSlider delegate](self, "delegate"));
    LOBYTE(v11) = objc_opt_respondsToSelector(v12, "detailSliderTrackingDidEnd:");

    if ((v11 & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[VMDetailSlider delegate](self, "delegate"));
      objc_msgSend(v13, "detailSliderTrackingDidEnd:", self);

    }
  }

}

- (id)createThumbView
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VMDetailSlider;
  v3 = -[VMDetailSlider createThumbView](&v5, "createThumbView");
  -[VMDetailSlider setThumbImageView:](self, "setThumbImageView:", v3);

  return (id)objc_claimAutoreleasedReturnValue(-[VMDetailSlider thumbImageView](self, "thumbImageView"));
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  double v4;
  objc_super v5;

  LODWORD(v4) = 0;
  v5.receiver = self;
  v5.super_class = (Class)VMDetailSlider;
  -[VMDetailSlider setValue:animated:](&v5, "setValue:animated:", a4, *(double *)&a3, v4);
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[VMDetailSlider isAccessibilityConstraintsEnabled](self, "isAccessibilityConstraintsEnabled"))
    v8 = 6.0;
  else
    v8 = 3.0;
  v13.receiver = self;
  v13.super_class = (Class)VMDetailSlider;
  -[VMDetailSlider trackRectForBounds:](&v13, "trackRectForBounds:", x, y, width, height);
  v12 = (height - v8) * 0.5;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v12;
  result.origin.x = v9;
  return result;
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double width;
  double height;
  objc_super v20;
  CGRect result;

  width = a4.size.width;
  height = a4.size.height;
  y = a4.origin.y;
  x = a4.origin.x;
  v7 = a3.size.height;
  v8 = a3.size.width;
  v9 = a3.origin.y;
  v10 = a3.origin.x;
  if (-[VMDetailSlider isAccessibilityConstraintsEnabled](self, "isAccessibilityConstraintsEnabled"))
    v12 = 12.0;
  else
    v12 = 6.0;
  v20.receiver = self;
  v20.super_class = (Class)VMDetailSlider;
  -[VMDetailSlider thumbRectForBounds:trackRect:value:](&v20, "thumbRectForBounds:trackRect:value:", v10, v9, v8, v7, x, y, width, height, LODWORD(a5));
  v16 = (v7 - v12) * 0.5;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v16;
  result.origin.x = v13;
  return result;
}

- (CGRect)thumbHitRect
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
  int v19;
  uint64_t v20;
  CGRect v21;

  -[VMDetailSlider bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VMDetailSlider bounds](self, "bounds");
  -[VMDetailSlider trackRectForBounds:](self, "trackRectForBounds:");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[VMDetailSlider value](self, "value");
  LODWORD(v20) = v19;
  -[VMDetailSlider thumbRectForBounds:trackRect:value:](self, "thumbRectForBounds:trackRect:value:", v4, v6, v8, v10, v12, v14, v16, v18, v20);
  return CGRectInset(v21, -15.0, -15.0);
}

- (void)detailScrubController:(id)a3 didChangeValue:(float)a4
{
  void *v5;
  char v6;
  id v7;

  -[VMDetailSlider setElapsedTime:animated:force:](self, "setElapsedTime:animated:force:", 0, 1, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMDetailSlider delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "detailSlider:didChangeElapsedTime:");

  if ((v6 & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[VMDetailSlider delegate](self, "delegate"));
    -[VMDetailSlider elapsedTime](self, "elapsedTime");
    objc_msgSend(v7, "detailSlider:didChangeElapsedTime:", self);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VMDetailSlider;
  -[VMDetailSlider traitCollectionDidChange:](&v10, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMDetailSlider traitCollection](self, "traitCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  if (v6 != v7)
  {
    v8 = objc_msgSend(v5, "isPreferredContentSizeCategoryAccessible");
    if ((_DWORD)v8 != -[VMDetailSlider isAccessibilityConstraintsEnabled](self, "isAccessibilityConstraintsEnabled"))
    {
      -[VMDetailSlider setAccessibilityConstraintsEnabled:](self, "setAccessibilityConstraintsEnabled:", v8);
      -[VMDetailSlider updateThumbImage](self, "updateThumbImage");
      -[VMDetailSlider updateTrackImages](self, "updateTrackImages");
      -[VMDetailSlider setNeedsLayout](self, "setNeedsLayout");
    }
  }
  v9 = objc_msgSend(v5, "userInterfaceStyle");
  if (v9 != objc_msgSend(v4, "userInterfaceStyle") && objc_msgSend(v5, "userInterfaceStyle"))
  {
    -[VMDetailSlider updateThumbImage](self, "updateThumbImage");
    -[VMDetailSlider updateTrackImages](self, "updateTrackImages");
    -[VMDetailSlider setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)updateThumbImage
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  CGFloat v7;
  void *v8;
  UIImage *ImageFromCurrentImageContext;
  void *v10;
  id v11;
  CGSize v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  v11 = (id)objc_claimAutoreleasedReturnValue(-[VMDetailSlider _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v3));

  if (-[VMDetailSlider isAccessibilityConstraintsEnabled](self, "isAccessibilityConstraintsEnabled"))
    v4 = 12.0;
  else
    v4 = 6.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v5, "scale");
  v7 = v6;
  v12.width = v4;
  v12.height = v4;
  UIGraphicsBeginImageContextWithOptions(v12, 0, v7);

  objc_msgSend(v11, "setFill");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v4, v4, v4 / 6.0 * 3.0));
  objc_msgSend(v8, "fill");

  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v10 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  -[VMDetailSlider setThumbImage:forState:](self, "setThumbImage:forState:", v10, 0);

}

- (void)updateTrackImages
{
  -[VMDetailSlider updateMinimumTrackImage](self, "updateMinimumTrackImage");
  -[VMDetailSlider updateMaximumTrackImage](self, "updateMaximumTrackImage");
}

- (void)updateMaximumTrackImage
{
  double v3;
  void *v4;
  double v5;
  CGFloat v6;
  void *v7;
  UIImage *ImageFromCurrentImageContext;
  void *v9;
  void *v10;
  id v11;
  CGSize v12;

  v11 = (id)objc_claimAutoreleasedReturnValue(-[VMDetailSlider maxTrackColor](self, "maxTrackColor"));
  if (-[VMDetailSlider isAccessibilityConstraintsEnabled](self, "isAccessibilityConstraintsEnabled"))
    v3 = 6.0;
  else
    v3 = 3.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v4, "scale");
  v6 = v5;
  v12.width = v3;
  v12.height = v3;
  UIGraphicsBeginImageContextWithOptions(v12, 0, v6);

  objc_msgSend(v11, "setFill");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v3, v3, v3 / 3.0));
  objc_msgSend(v7, "fill");

  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v9 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "resizableImageWithCapInsets:", v3 / 3.0, v3 / 3.0, v3 / 3.0, v3 / 3.0));
  -[VMDetailSlider setMaximumTrackImage:forState:](self, "setMaximumTrackImage:forState:", v10, 0);

}

- (void)updateMinimumTrackImage
{
  double v3;
  void *v4;
  double v5;
  CGFloat v6;
  void *v7;
  UIImage *ImageFromCurrentImageContext;
  void *v9;
  void *v10;
  id v11;
  CGSize v12;

  v11 = (id)objc_claimAutoreleasedReturnValue(-[VMDetailSlider trackColor](self, "trackColor"));
  if (-[VMDetailSlider isAccessibilityConstraintsEnabled](self, "isAccessibilityConstraintsEnabled"))
    v3 = 6.0;
  else
    v3 = 3.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v4, "scale");
  v6 = v5;
  v12.width = v3;
  v12.height = v3;
  UIGraphicsBeginImageContextWithOptions(v12, 0, v6);

  objc_msgSend(v11, "setFill");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v3, v3, v3 / 3.0));
  objc_msgSend(v7, "fill");

  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v9 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "resizableImageWithCapInsets:", v3 / 3.0, v3 / 3.0, v3 / 3.0, v3 / 3.0));
  -[VMDetailSlider setMinimumTrackImage:forState:](self, "setMinimumTrackImage:forState:", v10, 0);

}

- (UIColor)trackColor
{
  return +[UIColor systemGrayColor](UIColor, "systemGrayColor");
}

- (id)maxTrackColor
{
  void *v2;
  id v3;
  double v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VMDetailSlider traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v2, "userInterfaceStyle");
  v4 = 0.0;
  if (v3 == (id)2)
    v4 = 1.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v4, 0.1));

  return v5;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMDetailSlider;
  -[VMDetailSlider tintColorDidChange](&v3, "tintColorDidChange");
  -[VMDetailSlider updateThumbImage](self, "updateThumbImage");
}

- (VMDetailSliderDelegate)delegate
{
  return (VMDetailSliderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)maximumTime
{
  return self->_maximumTime;
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (BOOL)isAccessibilityConstraintsEnabled
{
  return self->_accessibilityConstraintsEnabled;
}

- (void)setAccessibilityConstraintsEnabled:(BOOL)a3
{
  self->_accessibilityConstraintsEnabled = a3;
}

- (double)minimumTime
{
  return self->_minimumTime;
}

- (UIImageView)thumbImageView
{
  return self->_thumbImageView;
}

- (void)setThumbImageView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbImageView, a3);
}

- (BOOL)isScrubbing
{
  return self->_scrubbing;
}

- (MPDetailScrubController)detailScrubController
{
  return self->_detailScrubController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailScrubController, 0);
  objc_storeStrong((id *)&self->_thumbImageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
