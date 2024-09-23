@implementation AVTFixedSizeViewContainer

- (AVTFixedSizeViewContainer)initWithFixedSizeView:(id)a3
{
  id v5;
  AVTFixedSizeViewContainer *v6;
  AVTFixedSizeViewContainer *v7;
  id *p_fixedSizeView;
  objc_super v10;

  v5 = a3;
  objc_msgSend(v5, "frame");
  v10.receiver = self;
  v10.super_class = (Class)AVTFixedSizeViewContainer;
  v6 = -[AVTFixedSizeViewContainer initWithFrame:](&v10, sel_initWithFrame_);
  v7 = v6;
  if (v6)
  {
    p_fixedSizeView = (id *)&v6->_fixedSizeView;
    objc_storeStrong((id *)&v6->_fixedSizeView, a3);
    objc_msgSend(*p_fixedSizeView, "setAutoresizingMask:", 0);
    objc_msgSend(*p_fixedSizeView, "_setSafeAreaInsetsFrozen:", 1);
    -[AVTFixedSizeViewContainer addSubview:](v7, "addSubview:", v5);
  }

  return v7;
}

- (void)layoutSubviews
{
  double MidX;
  double MidY;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v11;
  void *v12;
  void *v13;
  _OWORD v14[9];
  CGRect v15;
  CGRect v16;

  -[AVTFixedSizeViewContainer bounds](self, "bounds");
  MidX = CGRectGetMidX(v15);
  -[AVTFixedSizeViewContainer bounds](self, "bounds");
  MidY = CGRectGetMidY(v16);
  -[AVTFixedSizeViewContainer fixedSizeView](self, "fixedSizeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "center");
  v7 = v6;
  v9 = v8;

  if (MidX != v7 || MidY != v9)
  {
    -[AVTFixedSizeViewContainer fixedSizeView](self, "fixedSizeView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCenter:", MidX, MidY);

  }
  -[AVTFixedSizeViewContainer fixedSizeView](self, "fixedSizeView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");

  -[AVTFixedSizeViewContainer bounds](self, "bounds");
  _UIScaleTransformForAspectFitOfSizeInTargetSize();
  -[AVTFixedSizeViewContainer fixedSizeView](self, "fixedSizeView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v14, 0, sizeof(v14));
  objc_msgSend(v13, "setTransform:", v14);

}

- (UIView)fixedSizeView
{
  return self->_fixedSizeView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fixedSizeView, 0);
}

@end
