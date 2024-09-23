@implementation _SSSScreenshotAnnotationControllerAKOverlayContainerView

- (_SSSScreenshotAnnotationControllerAKOverlayContainerView)initWithFrame:(CGRect)a3
{
  _SSSScreenshotAnnotationControllerAKOverlayContainerView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SSSScreenshotAnnotationControllerAKOverlayContainerView;
  v3 = -[_SSSScreenshotAnnotationControllerAKOverlayContainerView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[_SSSScreenshotAnnotationControllerAKOverlayContainerView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  return v3;
}

- (void)setManagedView:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CGAffineTransform v23;
  CGAffineTransform v24;

  v5 = a3;
  -[UIView removeFromSuperview](self->_managedView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_managedView, a3);
  if (v5)
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
    objc_msgSend(v6, "setAnchorPoint:", 0.5, 0.5);

    memset(&v24, 0, sizeof(v24));
    CGAffineTransformMakeScale(&v24, 1.0, -1.0);
    v23 = v24;
    objc_msgSend(v5, "setTransform:", &v23);
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_SSSScreenshotAnnotationControllerAKOverlayContainerView bounds](self, "bounds");
    objc_msgSend(v5, "setFrame:");
    -[_SSSScreenshotAnnotationControllerAKOverlayContainerView addSubview:](self, "addSubview:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationControllerAKOverlayContainerView managedView](self, "managedView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "centerXAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationControllerAKOverlayContainerView centerXAnchor](self, "centerXAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
    objc_msgSend(v10, "setActive:", 1);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationControllerAKOverlayContainerView managedView](self, "managedView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "centerYAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationControllerAKOverlayContainerView centerYAnchor](self, "centerYAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
    objc_msgSend(v14, "setActive:", 1);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationControllerAKOverlayContainerView managedView](self, "managedView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "widthAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationControllerAKOverlayContainerView widthAnchor](self, "widthAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
    objc_msgSend(v18, "setActive:", 1);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationControllerAKOverlayContainerView managedView](self, "managedView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "heightAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationControllerAKOverlayContainerView heightAnchor](self, "heightAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
    objc_msgSend(v22, "setActive:", 1);

    -[_SSSScreenshotAnnotationControllerAKOverlayContainerView setNeedsLayout](self, "setNeedsLayout");
    +[CATransaction commit](CATransaction, "commit");
  }

}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationControllerAKOverlayContainerView managedView](self, "managedView"));
  objc_msgSend(v2, "systemLayoutSizeFittingSize:", CGSizeZero.width, CGSizeZero.height);
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UIView)managedView
{
  return self->_managedView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedView, 0);
}

@end
