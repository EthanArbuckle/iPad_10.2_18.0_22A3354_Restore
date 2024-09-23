@implementation HUAirPlayIconView

- (HUAirPlayIconView)initWithFrame:(CGRect)a3
{
  HUAirPlayIconView *v3;
  UIView *v4;
  UIView *airplayImageBackgroundView;
  void *v6;
  void *v7;
  UIImageView *v8;
  UIImageView *airplayImageView;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HUAirPlayIconView;
  v3 = -[HUAirPlayIconView initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    airplayImageBackgroundView = v3->_airplayImageBackgroundView;
    v3->_airplayImageBackgroundView = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    -[UIView setBackgroundColor:](v3->_airplayImageBackgroundView, "setBackgroundColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage hu_smallAirPlayAudioImage](UIImage, "hu_smallAirPlayAudioImage"));
    v8 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v7);
    airplayImageView = v3->_airplayImageView;
    v3->_airplayImageView = v8;

    -[UIImageView setContentMode:](v3->_airplayImageView, "setContentMode:", 2);
    -[HUAirPlayIconView addSubview:](v3, "addSubview:", v3->_airplayImageBackgroundView);
    -[HUAirPlayIconView addSubview:](v3, "addSubview:", v3->_airplayImageView);

  }
  return v3;
}

- (void)layoutSubviews
{
  double MidX;
  double MidY;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;
  CGRect v19;
  CGRect v20;

  v18.receiver = self;
  v18.super_class = (Class)HUAirPlayIconView;
  -[HUAirPlayIconView layoutSubviews](&v18, "layoutSubviews");
  -[HUAirPlayIconView bounds](self, "bounds");
  MidX = CGRectGetMidX(v19);
  -[HUAirPlayIconView bounds](self, "bounds");
  MidY = CGRectGetMidY(v20);
  -[HUAirPlayIconView bounds](self, "bounds");
  v6 = v5;
  -[HUAirPlayIconView bounds](self, "bounds");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HUAirPlayIconView airplayImageBackgroundView](self, "airplayImageBackgroundView"));
  objc_msgSend(v9, "setBounds:", 0.0, 0.0, v6, v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HUAirPlayIconView airplayImageBackgroundView](self, "airplayImageBackgroundView"));
  objc_msgSend(v10, "setCenter:", MidX, MidY);

  -[HUAirPlayIconView bounds](self, "bounds");
  v12 = v11 * 0.55;
  -[HUAirPlayIconView bounds](self, "bounds");
  v14 = v13 * 0.55;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HUAirPlayIconView airplayImageView](self, "airplayImageView"));
  objc_msgSend(v15, "setBounds:", 0.0, 0.0, v12, v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HUAirPlayIconView airplayImageView](self, "airplayImageView"));
  objc_msgSend(v16, "setCenter:", MidX, MidY);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  -[HUAirPlayIconView defineBorderWithRadius:borderWidth:borderColor:](self, "defineBorderWithRadius:borderWidth:borderColor:", v17, 17.0, 4.0);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 34.0;
  v3 = 34.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)defineBorderWithRadius:(double)a3 borderWidth:(double)a4 borderColor:(id)a5
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;

  -[HUAirPlayIconView bounds](self, "bounds", a5);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
  objc_msgSend(v17, "setFrame:", v9, v11, v13, v15);
  v25 = objc_retainAutorelease(v16);
  objc_msgSend(v17, "setPath:", objc_msgSend(v25, "CGPath"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[HUAirPlayIconView layer](self, "layer"));
  objc_msgSend(v18, "setMask:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1, v9, v11, v13, v15, a3, a3));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
  objc_msgSend(v20, "setFrame:", v9, v11, v13, v15);
  v21 = objc_retainAutorelease(v19);
  objc_msgSend(v20, "setPath:", objc_msgSend(v21, "CGPath"));
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor")));
  objc_msgSend(v20, "setStrokeColor:", objc_msgSend(v22, "CGColor"));

  v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
  objc_msgSend(v20, "setFillColor:", objc_msgSend(v23, "CGColor"));

  objc_msgSend(v20, "setLineWidth:", a4);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[HUAirPlayIconView layer](self, "layer"));
  objc_msgSend(v24, "addSublayer:", v20);

}

- (UIView)airplayImageBackgroundView
{
  return self->_airplayImageBackgroundView;
}

- (void)setAirplayImageBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_airplayImageBackgroundView, a3);
}

- (UIImageView)airplayImageView
{
  return self->_airplayImageView;
}

- (void)setAirplayImageView:(id)a3
{
  objc_storeStrong((id *)&self->_airplayImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airplayImageView, 0);
  objc_storeStrong((id *)&self->_airplayImageBackgroundView, 0);
}

@end
