@implementation LUILogLocatorView

- (LUILogLocatorView)initWithFrame:(CGRect)a3
{
  LUILogLocatorView *v3;
  LUILogLocatorView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LUILogLocatorView;
  v3 = -[LUILogLocatorView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[LUILogLocatorView _setup](v3, "_setup");
  return v4;
}

- (void)_setup
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  UIButton *v8;
  UIButton *upArrowButton;
  UIButton *v10;
  UIButton *downArrowButton;
  UIButton *v12;
  UIButton *screenshotButton;
  UICollectionView *v14;
  UICollectionView *screenshotCollectionView;

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "CGColor");
  -[LUILogLocatorView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBorderColor:", v4);

  -[LUILogLocatorView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBorderWidth:", 1.5);

  -[LUILogLocatorView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", 5.0);

  -[LUILogLocatorView _createButtonWithImageName:](self, "_createButtonWithImageName:", CFSTR("UpArrowIcon"));
  v8 = (UIButton *)objc_claimAutoreleasedReturnValue();
  upArrowButton = self->_upArrowButton;
  self->_upArrowButton = v8;

  -[LUILogLocatorView _createButtonWithImageName:](self, "_createButtonWithImageName:", CFSTR("DownArrowIcon"));
  v10 = (UIButton *)objc_claimAutoreleasedReturnValue();
  downArrowButton = self->_downArrowButton;
  self->_downArrowButton = v10;

  -[LUILogLocatorView _createButtonWithImageName:](self, "_createButtonWithImageName:", CFSTR("CameraIcon"));
  v12 = (UIButton *)objc_claimAutoreleasedReturnValue();
  screenshotButton = self->_screenshotButton;
  self->_screenshotButton = v12;

  -[LUILogLocatorView _createScreenshotCollectionView](self, "_createScreenshotCollectionView");
  v14 = (UICollectionView *)objc_claimAutoreleasedReturnValue();
  screenshotCollectionView = self->_screenshotCollectionView;
  self->_screenshotCollectionView = v14;

  -[LUILogLocatorView addSubview:](self, "addSubview:", self->_screenshotCollectionView);
  -[LUILogLocatorView addSubview:](self, "addSubview:", self->_upArrowButton);
  -[LUILogLocatorView addSubview:](self, "addSubview:", self->_downArrowButton);
  -[LUILogLocatorView addSubview:](self, "addSubview:", self->_screenshotButton);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double Width;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  CGFloat v20;
  void *v21;
  CGFloat v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  void *v31;
  CGFloat v32;
  void *v33;
  CGFloat v34;
  void *v35;
  CGFloat v36;
  void *v37;
  CGFloat v38;
  void *v39;
  CGFloat v40;
  CGFloat v41;
  objc_super v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v42.receiver = self;
  v42.super_class = (Class)LUILogLocatorView;
  -[LUILogLocatorView layoutSubviews](&v42, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "interfaceOrientation");

  -[LUILogLocatorView bounds](self, "bounds");
  Width = CGRectGetWidth(v43);
  if ((unint64_t)(v7 - 1) > 1)
  {
    v29 = Width * 0.5;
    -[LUILogLocatorView bounds](self, "bounds");
    v30 = CGRectGetHeight(v51) + -20.0 + -25.0;
    -[LUILogLocatorView downArrowButton](self, "downArrowButton");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setCenter:", v29, v30);

    -[LUILogLocatorView bounds](self, "bounds");
    v32 = CGRectGetWidth(v52) * 0.5;
    -[LUILogLocatorView downArrowButton](self, "downArrowButton");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "frame");
    v34 = CGRectGetMinY(v53) + -20.0 + -25.0;
    -[LUILogLocatorView upArrowButton](self, "upArrowButton");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setCenter:", v32, v34);

    -[LUILogLocatorView bounds](self, "bounds");
    v36 = CGRectGetWidth(v54) * 0.5;
    -[LUILogLocatorView upArrowButton](self, "upArrowButton");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "frame");
    v38 = CGRectGetMinY(v55) + -20.0 + -25.0;
    -[LUILogLocatorView screenshotButton](self, "screenshotButton");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setCenter:", v36, v38);

    -[LUILogLocatorView bounds](self, "bounds");
    v40 = (CGRectGetWidth(v56) + -130.0) * 0.5;
    -[LUILogLocatorView screenshotButton](self, "screenshotButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "frame");
    v41 = CGRectGetMinY(v57) + -10.0 + -20.0;
    -[LUILogLocatorView screenshotCollectionView](self, "screenshotCollectionView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v28 = 130.0;
    v27 = 10.0;
    v26 = v40;
    v25 = v41;
  }
  else
  {
    v9 = Width + -20.0 + -25.0;
    -[LUILogLocatorView bounds](self, "bounds");
    v10 = CGRectGetHeight(v44) * 0.5;
    -[LUILogLocatorView downArrowButton](self, "downArrowButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCenter:", v9, v10);

    -[LUILogLocatorView downArrowButton](self, "downArrowButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v13 = CGRectGetMinX(v45) + -20.0 + -25.0;
    -[LUILogLocatorView bounds](self, "bounds");
    v14 = CGRectGetHeight(v46) * 0.5;
    -[LUILogLocatorView upArrowButton](self, "upArrowButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCenter:", v13, v14);

    -[LUILogLocatorView upArrowButton](self, "upArrowButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    v17 = CGRectGetMinX(v47) + -20.0 + -25.0;
    -[LUILogLocatorView bounds](self, "bounds");
    v18 = CGRectGetHeight(v48) * 0.5;
    -[LUILogLocatorView screenshotButton](self, "screenshotButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCenter:", v17, v18);

    -[LUILogLocatorView bounds](self, "bounds");
    v20 = (CGRectGetHeight(v49) + -130.0) * 0.5;
    -[LUILogLocatorView screenshotButton](self, "screenshotButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "frame");
    v22 = CGRectGetMinX(v50) + -10.0 + -20.0;
    -[LUILogLocatorView screenshotCollectionView](self, "screenshotCollectionView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = 130.0;
    v26 = 10.0;
    v27 = v20;
    v28 = v22;
  }
  objc_msgSend(v23, "setFrame:", v26, v27, v28, v25);

  -[LUILogLocatorView handleOrientationChange:](self, "handleOrientationChange:", v7);
}

- (void)handleOrientationChange:(int64_t)a3
{
  _BOOL8 v4;
  id v5;

  v4 = (unint64_t)(a3 - 1) < 2;
  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "setScrollDirection:", v4);
  -[UICollectionView setCollectionViewLayout:](self->_screenshotCollectionView, "setCollectionViewLayout:", v5);

}

- (id)_createElementStackViewWithElements:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDF6DD0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithArrangedSubviews:", v4);

  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "setAxis:", 0);
  objc_msgSend(v5, "setDistribution:", 3);
  objc_msgSend(v5, "setAlignment:", 3);
  return v5;
}

- (id)_createScreenshotCollectionView
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_opt_new();
  v3 = objc_alloc(MEMORY[0x24BDF68D8]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v2, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(MEMORY[0x24BDF6950], "grayColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorWithAlphaComponent:", 0.5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v6);

  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("screenshotCell"));
  return v4;
}

- (id)_createButtonWithImageName:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (objc_class *)MEMORY[0x24BDF6880];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "imageWithRenderingMode:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTintColor:", v8);

  objc_msgSend(v5, "setImage:forState:", v7, 0);
  objc_msgSend(v5, "widthAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToConstant:", 50.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  objc_msgSend(v5, "heightAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToConstant:", 50.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  return v5;
}

- (UIButton)upArrowButton
{
  return self->_upArrowButton;
}

- (void)setUpArrowButton:(id)a3
{
  objc_storeStrong((id *)&self->_upArrowButton, a3);
}

- (UIButton)downArrowButton
{
  return self->_downArrowButton;
}

- (void)setDownArrowButton:(id)a3
{
  objc_storeStrong((id *)&self->_downArrowButton, a3);
}

- (UIButton)screenshotButton
{
  return self->_screenshotButton;
}

- (void)setScreenshotButton:(id)a3
{
  objc_storeStrong((id *)&self->_screenshotButton, a3);
}

- (UICollectionView)screenshotCollectionView
{
  return self->_screenshotCollectionView;
}

- (void)setScreenshotCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_screenshotCollectionView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenshotCollectionView, 0);
  objc_storeStrong((id *)&self->_screenshotButton, 0);
  objc_storeStrong((id *)&self->_downArrowButton, 0);
  objc_storeStrong((id *)&self->_upArrowButton, 0);
}

@end
