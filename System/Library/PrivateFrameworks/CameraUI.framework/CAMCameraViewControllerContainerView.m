@implementation CAMCameraViewControllerContainerView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (CAMCameraViewControllerContainerView)initWithFrame:(CGRect)a3
{
  CAMCameraViewControllerContainerView *v3;
  CAMCameraViewControllerContainerView *v4;
  CAMCameraViewControllerContainerView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMCameraViewControllerContainerView;
  v3 = -[CAMCameraViewControllerContainerView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CAMCameraViewControllerContainerView _commonCAMCameraViewControllerContainerViewInitialization](v3, "_commonCAMCameraViewControllerContainerViewInitialization");
    v5 = v4;
  }

  return v4;
}

- (CAMCameraViewControllerContainerView)initWithCoder:(id)a3
{
  CAMCameraViewControllerContainerView *v3;
  CAMCameraViewControllerContainerView *v4;
  CAMCameraViewControllerContainerView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMCameraViewControllerContainerView;
  v3 = -[CAMCameraViewControllerContainerView initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    -[CAMCameraViewControllerContainerView _commonCAMCameraViewControllerContainerViewInitialization](v3, "_commonCAMCameraViewControllerContainerViewInitialization");
    v5 = v4;
  }

  return v4;
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
  void *v11;
  double MidX;
  double MidY;
  objc_super v14;
  CGRect v15;
  CGRect v16;

  v14.receiver = self;
  v14.super_class = (Class)CAMCameraViewControllerContainerView;
  -[CAMCameraViewControllerContainerView layoutSubviews](&v14, sel_layoutSubviews);
  -[CAMCameraViewControllerContainerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMCameraViewControllerContainerView viewfinderView](self, "viewfinderView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  MidX = CGRectGetMidX(v15);
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  MidY = CGRectGetMidY(v16);
  objc_msgSend(v11, "setBounds:", v4, v6, v8, v10);
  objc_msgSend(v11, "setCenter:", MidX, MidY);

}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CAMCameraViewControllerContainerView viewfinderView](self, "viewfinderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemLayoutSizeFittingSize:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setViewfinderView:(id)a3
{
  UIView *v5;
  UIView *viewfinderView;
  UIView *v7;

  v5 = (UIView *)a3;
  viewfinderView = self->_viewfinderView;
  if (viewfinderView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](viewfinderView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_viewfinderView, a3);
    -[CAMCameraViewControllerContainerView verifyViewOrdering](self, "verifyViewOrdering");
    v5 = v7;
  }

}

- (void)setCustomOverlayView:(id)a3
{
  UIView *v5;
  UIView *customOverlayView;
  UIView *v7;

  v5 = (UIView *)a3;
  customOverlayView = self->_customOverlayView;
  if (customOverlayView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](customOverlayView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_customOverlayView, a3);
    -[CAMCameraViewControllerContainerView verifyViewOrdering](self, "verifyViewOrdering");
    v5 = v7;
  }

}

- (void)setAdditionalContentView:(id)a3
{
  UIView *v5;
  UIView *additionalContentView;
  UIView *v7;

  v5 = (UIView *)a3;
  additionalContentView = self->_additionalContentView;
  if (additionalContentView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](additionalContentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_additionalContentView, a3);
    -[CAMCameraViewControllerContainerView verifyViewOrdering](self, "verifyViewOrdering");
    v5 = v7;
  }

}

- (void)verifyViewOrdering
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  -[CAMCameraViewControllerContainerView viewfinderView](self, "viewfinderView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMCameraViewControllerContainerView customOverlayView](self, "customOverlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCameraViewControllerContainerView additionalContentView](self, "additionalContentView");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v7;
  v6 = (void *)v4;
  if (v7)
  {
    -[CAMCameraViewControllerContainerView addSubview:](self, "addSubview:", v7);
    -[CAMCameraViewControllerContainerView sendSubviewToBack:](self, "sendSubviewToBack:", v7);
    v5 = v7;
  }
  if (v3)
  {
    -[CAMCameraViewControllerContainerView addSubview:](self, "addSubview:", v3);
    -[CAMCameraViewControllerContainerView bringSubviewToFront:](self, "bringSubviewToFront:", v3);
    v5 = v7;
  }
  if (v5 && v6)
  {
    -[CAMCameraViewControllerContainerView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v6, v5);
  }
  else if (v3 && v6)
  {
    -[CAMCameraViewControllerContainerView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v6, v3);
  }

}

- (UIView)viewfinderView
{
  return self->_viewfinderView;
}

- (UIView)customOverlayView
{
  return self->_customOverlayView;
}

- (UIView)additionalContentView
{
  return self->_additionalContentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalContentView, 0);
  objc_storeStrong((id *)&self->_customOverlayView, 0);
  objc_storeStrong((id *)&self->_viewfinderView, 0);
}

@end
