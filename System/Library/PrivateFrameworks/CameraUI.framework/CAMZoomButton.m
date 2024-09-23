@implementation CAMZoomButton

+ (double)circleDiameterForContentSize:(id)a3
{
  double result;
  _BOOL4 v4;

  if ((objc_msgSend(a1, "shouldUseLargeButtonSizeForContentSize:", a3) & 1) != 0)
    return 50.0;
  v4 = +[CAMZoomButton _useOutline](CAMZoomButton, "_useOutline");
  result = 37.0;
  if (v4)
    return 36.0;
  return result;
}

+ (double)fontSizeForContentSize:(id)a3
{
  char v3;
  double result;
  BOOL v5;
  void *v6;
  double v7;
  double v8;

  v3 = objc_msgSend(a1, "shouldUseLargeButtonSizeForContentSize:", a3);
  result = 16.0;
  if ((v3 & 1) == 0)
  {
    v5 = +[CAMZoomButton _useOutline](CAMZoomButton, "_useOutline", 16.0);
    result = 13.0;
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen", 13.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "scale");
      v8 = 1.0 / v7;

      return v8 + 13.0;
    }
  }
  return result;
}

+ (BOOL)_useOutline
{
  void *v2;
  BOOL v3;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "zoomDialStyle") != 1;

  return v3;
}

- (void)_commonCAMZoomButtonInitialization
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIView *v9;
  UIView *contentContainerView;
  UIImageView *v11;
  UIImageView *backgroundImageView;
  CAMZoomFactorLabel *v13;
  CAMZoomFactorLabel *zoomFactorLabel;
  void *v15;
  UIImageView *v16;
  UIImageView *circleImageView;
  uint64_t v18;
  __int128 v19;

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomButton setTintColor:](self, "setTintColor:", v3);

  v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
  contentContainerView = self->__contentContainerView;
  self->__contentContainerView = v9;

  -[UIView setUserInteractionEnabled:](self->__contentContainerView, "setUserInteractionEnabled:", 0);
  -[CAMZoomButton addSubview:](self, "addSubview:", self->__contentContainerView);
  v11 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
  backgroundImageView = self->__backgroundImageView;
  self->__backgroundImageView = v11;

  -[CAMZoomButton _updateBackgroundImageViewAlpha](self, "_updateBackgroundImageViewAlpha");
  -[UIView addSubview:](self->__contentContainerView, "addSubview:", self->__backgroundImageView);
  v13 = -[CAMZoomFactorLabel initWithFrame:]([CAMZoomFactorLabel alloc], "initWithFrame:", v5, v6, v7, v8);
  zoomFactorLabel = self->__zoomFactorLabel;
  self->__zoomFactorLabel = v13;

  -[CAMZoomFactorLabel setShowZoomFactorSymbol:](self->__zoomFactorLabel, "setShowZoomFactorSymbol:", 1);
  -[CAMZoomFactorLabel setUseLeadingZero:](self->__zoomFactorLabel, "setUseLeadingZero:", 1);
  -[CAMZoomButton tintColor](self, "tintColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomFactorLabel setTintColor:](self->__zoomFactorLabel, "setTintColor:", v15);

  -[UIView addSubview:](self->__contentContainerView, "addSubview:", self->__zoomFactorLabel);
  if (+[CAMZoomButton _useOutline](CAMZoomButton, "_useOutline"))
  {
    v16 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    circleImageView = self->__circleImageView;
    self->__circleImageView = v16;

    -[UIView addSubview:](self->__contentContainerView, "addSubview:", self->__circleImageView);
  }
  -[CAMZoomButton _updateForContentSize](self, "_updateForContentSize");
  self->_zoomFactor = 1.0;
  -[CAMZoomButton _updateZoomFactorLabelIfNeeded](self, "_updateZoomFactorLabelIfNeeded");
  v18 = MEMORY[0x1E0C9BAA8];
  v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&self->_highlightingTransform.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&self->_highlightingTransform.c = v19;
  *(_OWORD *)&self->_highlightingTransform.tx = *(_OWORD *)(v18 + 32);
}

- (void)_updateForContentSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CAMZoomButton traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[CAMZoomButton _createBackgroundImageForContentSize:](self, "_createBackgroundImageForContentSize:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomButton _backgroundImageView](self, "_backgroundImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

  if (self->__circleImageView)
  {
    -[CAMZoomButton _createCircleImageForContentSize:](self, "_createCircleImageForContentSize:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMZoomButton _circleImageView](self, "_circleImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v6);

  }
  -[CAMZoomButton _accessoryBackgroundView](self, "_accessoryBackgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    -[CAMZoomButton _updateAccessoryBackgroundView](self, "_updateAccessoryBackgroundView");

}

- (CAMZoomButton)initWithFrame:(CGRect)a3
{
  CAMZoomButton *v3;
  CAMZoomButton *v4;
  CAMZoomButton *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMZoomButton;
  v3 = -[CAMZoomButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CAMZoomButton _commonCAMZoomButtonInitialization](v3, "_commonCAMZoomButtonInitialization");
    v5 = v4;
  }

  return v4;
}

- (CAMZoomButton)initWithCoder:(id)a3
{
  CAMZoomButton *v3;
  CAMZoomButton *v4;
  CAMZoomButton *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMZoomButton;
  v3 = -[CAMZoomButton initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    -[CAMZoomButton _commonCAMZoomButtonInitialization](v3, "_commonCAMZoomButtonInitialization");
    v5 = v4;
  }

  return v4;
}

- (void)setContentType:(int64_t)a3
{
  -[CAMZoomButton setContentType:animated:](self, "setContentType:animated:", a3, 0);
}

- (void)setContentType:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  char v6;
  char v7;
  double v8;
  _QWORD v9[5];
  char v10;
  char v11;
  char v12;

  if (self->_contentType != a3)
  {
    v4 = a4;
    self->_contentType = a3;
    if (a3 == 2)
    {
      -[CAMZoomButton _createFocalLengthLabelIfNeeded](self, "_createFocalLengthLabelIfNeeded");
      v7 = 0;
      v6 = 1;
    }
    else if (a3 == 1)
    {
      -[CAMZoomButton _createZoomSymbolViewIfNecessary](self, "_createZoomSymbolViewIfNecessary");
      -[CAMZoomButton _updateZoomSymbolViewAnimated:](self, "_updateZoomSymbolViewAnimated:", v4);
      v6 = 0;
      v7 = 1;
    }
    else
    {
      if (!a3)
        -[CAMZoomButton _updateZoomFactorLabelIfNeeded](self, "_updateZoomFactorLabelIfNeeded");
      v6 = 0;
      v7 = 0;
    }
    v8 = 0.25;
    if (!v4)
      v8 = 0.0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __41__CAMZoomButton_setContentType_animated___block_invoke;
    v9[3] = &unk_1EA32C688;
    v9[4] = self;
    v10 = v7;
    v11 = (v6 | v7) ^ 1;
    v12 = v6;
    +[CAMView animateIfNeededWithDuration:animations:](CAMView, "animateIfNeededWithDuration:animations:", v9, v8);
  }
}

void __41__CAMZoomButton_setContentType_animated___block_invoke(uint64_t a1, double a2)
{
  double v3;
  void *v4;
  unint64_t v5;
  double v6;
  void *v7;
  unint64_t v8;
  double v9;
  id v10;

  LOBYTE(a2) = *(_BYTE *)(a1 + 40);
  v3 = (double)*(unint64_t *)&a2;
  objc_msgSend(*(id *)(a1 + 32), "_zoomSymbolView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

  LOBYTE(v5) = *(_BYTE *)(a1 + 41);
  v6 = (double)v5;
  objc_msgSend(*(id *)(a1 + 32), "_zoomFactorLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v6);

  LOBYTE(v8) = *(_BYTE *)(a1 + 42);
  v9 = (double)v8;
  objc_msgSend(*(id *)(a1 + 32), "_focalLengthLabel");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", v9);

}

- (void)setZoomFactor:(double)a3
{
  if (self->_zoomFactor != a3)
  {
    self->_zoomFactor = a3;
    -[CAMZoomButton _updateZoomFactorLabelIfNeeded](self, "_updateZoomFactorLabelIfNeeded");
  }
}

- (void)setZoomSymbol:(int64_t)a3
{
  -[CAMZoomButton setZoomSymbol:animated:](self, "setZoomSymbol:animated:", a3, 0);
}

- (void)setZoomSymbol:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_zoomSymbol != a3)
  {
    self->_zoomSymbol = a3;
    -[CAMZoomButton _updateZoomSymbolViewAnimated:](self, "_updateZoomSymbolViewAnimated:", a4);
  }
}

- (void)_createZoomSymbolViewIfNecessary
{
  UIImageView *v3;
  UIImageView *zoomSymbolView;
  id v5;

  if (!self->__zoomSymbolView)
  {
    -[CAMZoomButton _imageForZoomSymbol:](self, "_imageForZoomSymbol:", -[CAMZoomButton zoomSymbol](self, "zoomSymbol"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v5);
    zoomSymbolView = self->__zoomSymbolView;
    self->__zoomSymbolView = v3;

    -[UIImageView _setAnimatesContents:](self->__zoomSymbolView, "_setAnimatesContents:", 1);
    -[UIView addSubview:](self->__contentContainerView, "addSubview:", self->__zoomSymbolView);
    -[CAMZoomButton setNeedsLayout](self, "setNeedsLayout");

  }
}

- (id)_imageForZoomSymbol:(int64_t)a3
{
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = CFSTR("arrow.up.left.and.arrow.down.right");
  if (a3 != 1)
    v3 = 0;
  if (a3)
    v4 = v3;
  else
    v4 = CFSTR("arrow.down.right.and.arrow.up.left");
  v5 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 16.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemImageNamed:withConfiguration:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_updateZoomSymbolViewAnimated:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  void *v6;
  double v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v3 = a3;
  v5 = -[CAMZoomButton contentType](self, "contentType");
  if (v5 && v5 != 2)
  {
    if (v5 == 1)
    {
      -[CAMZoomButton _imageForZoomSymbol:](self, "_imageForZoomSymbol:", -[CAMZoomButton zoomSymbol](self, "zoomSymbol"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    if (v3)
      v7 = 0.2;
    else
      v7 = 0.0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __47__CAMZoomButton__updateZoomSymbolViewAnimated___block_invoke;
    v9[3] = &unk_1EA328A40;
    v9[4] = self;
    v10 = v6;
    v8 = v6;
    +[CAMView animateIfNeededWithDuration:animations:](CAMView, "animateIfNeededWithDuration:animations:", v9, v7);

  }
}

void __47__CAMZoomButton__updateZoomSymbolViewAnimated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_zoomSymbolView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v1);

}

- (void)setFocalLength:(int64_t)a3
{
  -[CAMZoomButton setFocalLength:animated:](self, "setFocalLength:animated:", a3, 0);
}

- (void)setFocalLength:(int64_t)a3 animated:(BOOL)a4
{
  id v5;

  if (self->_focalLength != a3)
  {
    self->_focalLength = a3;
    -[CAMZoomButton _focalLengthLabel](self, "_focalLengthLabel");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFocalLength:", a3);

  }
}

- (void)_createFocalLengthLabelIfNeeded
{
  void *v3;
  void *v4;
  CAMFocalLengthLabel *v5;

  -[CAMZoomButton _focalLengthLabel](self, "_focalLengthLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v5 = objc_alloc_init(CAMFocalLengthLabel);
    -[CAMFocalLengthLabel setFocalLength:](v5, "setFocalLength:", -[CAMZoomButton focalLength](self, "focalLength"));
    -[CAMZoomButton _contentContainerView](self, "_contentContainerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:", v5);

    -[CAMZoomButton set_focalLengthLabel:](self, "set_focalLengthLabel:", v5);
    -[CAMZoomButton setNeedsLayout](self, "setNeedsLayout");
    v3 = v5;
  }

}

- (void)setAccessoryState:(int64_t)a3
{
  -[CAMZoomButton setAccessoryState:animated:](self, "setAccessoryState:animated:", a3, 0);
}

- (void)setAccessoryState:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  _QWORD *v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];

  if (self->_accessoryState == a3)
    return;
  v4 = a4;
  -[CAMZoomButton _accessoryBackgroundView](self, "_accessoryBackgroundView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMZoomButton _accessoryImageView](self, "_accessoryImageView");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (id)v8;
  if (!v7)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    -[CAMZoomButton _contentContainerView](self, "_contentContainerView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "insertSubview:atIndex:", v7, 0);

    -[CAMZoomButton set_accessoryBackgroundView:](self, "set_accessoryBackgroundView:", v7);
    -[CAMZoomButton _updateAccessoryBackgroundView](self, "_updateAccessoryBackgroundView");
    -[CAMZoomButton setNeedsLayout](self, "setNeedsLayout");
    if (v9)
      goto LABEL_4;
LABEL_11:
    v9 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTintColor:", v22);

    -[CAMZoomButton _contentContainerView](self, "_contentContainerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "insertSubview:atIndex:", v9, 1);

    -[CAMZoomButton set_accessoryImageView:](self, "set_accessoryImageView:", v9);
    -[CAMZoomButton _updateAccessoryAlphas](self, "_updateAccessoryAlphas");
    -[CAMZoomButton setNeedsLayout](self, "setNeedsLayout");
    goto LABEL_4;
  }
  if (!v8)
    goto LABEL_11;
LABEL_4:
  if (a3 == 1)
  {
    v10 = (void *)MEMORY[0x1E0DC3870];
    CAMCameraUIFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageNamed:inBundle:", CFSTR("CAMLowLightIndicator"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageWithRenderingMode:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", v13);

  }
  if (v4)
  {
    -[CAMZoomButton layoutIfNeeded](self, "layoutIfNeeded");
    self->_accessoryState = a3;
    -[CAMZoomButton setNeedsLayout](self, "setNeedsLayout");
    v14 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __44__CAMZoomButton_setAccessoryState_animated___block_invoke;
    v26[3] = &unk_1EA328868;
    v26[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 2, v26, 0, 0.4, 0.0, 1.0, 1.0);
    if (-[CAMZoomButton accessoryState](self, "accessoryState"))
    {
      v24[0] = v14;
      v24[1] = 3221225472;
      v24[2] = __44__CAMZoomButton_setAccessoryState_animated___block_invoke_3;
      v24[3] = &unk_1EA328868;
      v24[4] = self;
      v15 = 0.05;
      v16 = 1.0;
      v17 = 1.0;
      v18 = v24;
      v19 = 0.4;
      v20 = 2;
    }
    else
    {
      v25[0] = v14;
      v25[1] = 3221225472;
      v25[2] = __44__CAMZoomButton_setAccessoryState_animated___block_invoke_2;
      v25[3] = &unk_1EA328868;
      v25[4] = self;
      v19 = 0.25;
      v15 = 0.0;
      v16 = 1.0;
      v18 = v25;
      v17 = 1.0;
      v20 = 0;
    }
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", v20, v18, 0, v19, v15, v16, v17);
  }
  else
  {
    self->_accessoryState = a3;
    -[CAMZoomButton setNeedsLayout](self, "setNeedsLayout");
    -[CAMZoomButton _updateAccessoryAlphas](self, "_updateAccessoryAlphas");
  }

}

uint64_t __44__CAMZoomButton_setAccessoryState_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __44__CAMZoomButton_setAccessoryState_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAccessoryAlphas");
}

uint64_t __44__CAMZoomButton_setAccessoryState_animated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAccessoryAlphas");
}

- (void)setAccessoryPosition:(int64_t)a3
{
  -[CAMZoomButton setAccessoryPosition:animated:](self, "setAccessoryPosition:animated:", a3, 0);
}

- (void)setAccessoryPosition:(int64_t)a3 animated:(BOOL)a4
{
  _QWORD v6[5];

  if (self->_accessoryPosition != a3)
  {
    if (a4)
    {
      -[CAMZoomButton layoutIfNeeded](self, "layoutIfNeeded");
      self->_accessoryPosition = a3;
      -[CAMZoomButton setNeedsLayout](self, "setNeedsLayout");
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __47__CAMZoomButton_setAccessoryPosition_animated___block_invoke;
      v6[3] = &unk_1EA328868;
      v6[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 2, v6, 0, 0.4, 0.0, 1.0, 1.0);
    }
    else
    {
      self->_accessoryPosition = a3;
      -[CAMZoomButton setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

uint64_t __47__CAMZoomButton_setAccessoryPosition_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (CGRect)accessoryFrame
{
  CGFloat v3;
  double v4;
  double v5;
  CGFloat v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  int64_t v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double MaxX;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect result;

  v4 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  -[CAMZoomButton _accessoryBackgroundView](self, "_accessoryBackgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && -[CAMZoomButton accessoryState](self, "accessoryState"))
  {
    objc_msgSend(v7, "bounds");
    -[CAMZoomButton convertRect:fromView:](self, "convertRect:fromView:", v7);
    v4 = v8;
    v3 = v9;
    v5 = v10;
    v6 = v11;
    -[CAMZoomButton _backgroundImageView](self, "_backgroundImageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    -[CAMZoomButton convertRect:fromView:](self, "convertRect:fromView:", v12);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v21 = -[CAMZoomButton accessoryPosition](self, "accessoryPosition");
    if (v21 == 1)
    {
      v29.origin.x = v4;
      v29.origin.y = v3;
      v29.size.width = v5;
      v29.size.height = v6;
      MaxX = CGRectGetMaxX(v29);
      v30.origin.x = v14;
      v30.origin.y = v16;
      v30.size.width = v18;
      v30.size.height = v20;
      v5 = v5 - (MaxX - CGRectGetMinX(v30));
    }
    else if (!v21)
    {
      v28.origin.x = v14;
      v28.origin.y = v16;
      v28.size.width = v18;
      v28.size.height = v20;
      v22 = CGRectGetMaxX(v28);
      v5 = v5 - (v22 - v4);
      v4 = v22;
    }

  }
  v23 = v4;
  v24 = v3;
  v25 = v5;
  v26 = v6;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (void)_updateAccessoryAlphas
{
  double v3;
  void *v4;
  id v5;

  if (-[CAMZoomButton accessoryState](self, "accessoryState"))
    v3 = 1.0;
  else
    v3 = 0.0;
  -[CAMZoomButton _accessoryBackgroundView](self, "_accessoryBackgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

  -[CAMZoomButton _accessoryImageView](self, "_accessoryImageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v3);

}

- (void)_updateAccessoryBackgroundView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  id v10;

  -[CAMZoomButton _accessoryBackgroundView](self, "_accessoryBackgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CAMZoomButton traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMZoomButton _createBackgroundImageForContentSize:color:](self, "_createBackgroundImageForContentSize:color:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "size");
    objc_msgSend(v7, "resizableImageWithCapInsets:resizingMode:", 1, 0.0, v8 * 0.5, 0.0, v8 * 0.5);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    -[CAMZoomButton _accessoryBackgroundView](self, "_accessoryBackgroundView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", v10);

  }
}

- (void)setTappableEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_tappableEdgeInsets.left
    || a3.top != self->_tappableEdgeInsets.top
    || a3.right != self->_tappableEdgeInsets.right
    || a3.bottom != self->_tappableEdgeInsets.bottom)
  {
    self->_tappableEdgeInsets = a3;
    -[CAMZoomButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setOverPlatter:(BOOL)a3
{
  if (self->_overPlatter != a3)
  {
    self->_overPlatter = a3;
    -[CAMZoomButton _updateBackgroundImageViewAlpha](self, "_updateBackgroundImageViewAlpha");
  }
}

- (void)setShouldHideBackground:(BOOL)a3
{
  -[CAMZoomButton setShouldHideBackground:animationDuration:](self, "setShouldHideBackground:animationDuration:", a3, 0.0);
}

- (void)setShouldHideBackground:(BOOL)a3 animationDuration:(double)a4
{
  double v4;
  _QWORD v5[5];

  if (self->_shouldHideBackground != a3)
  {
    self->_shouldHideBackground = a3;
    v4 = 2.0;
    if (!a3)
      v4 = 0.0;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __59__CAMZoomButton_setShouldHideBackground_animationDuration___block_invoke;
    v5[3] = &unk_1EA328868;
    v5[4] = self;
    +[CAMView animateIfNeededWithDuration:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](CAMView, "animateIfNeededWithDuration:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v5, 0, a4, 1.0, v4);
  }
}

uint64_t __59__CAMZoomButton_setShouldHideBackground_animationDuration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateBackgroundImageViewAlpha");
}

- (void)_setHighlightingTransform:(CGAffineTransform *)a3
{
  CGAffineTransform *p_highlightingTransform;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CGAffineTransform v10;
  CGAffineTransform t1;

  p_highlightingTransform = &self->_highlightingTransform;
  v6 = *(_OWORD *)&self->_highlightingTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_highlightingTransform.a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_highlightingTransform.tx;
  v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v10.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tx = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v10))
  {
    v8 = *(_OWORD *)&a3->a;
    v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_highlightingTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_highlightingTransform->tx = v9;
    *(_OWORD *)&p_highlightingTransform->a = v8;
    -[CAMZoomButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[CAMZoomButton traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "circleDiameterForContentSize:", v3);
  v5 = v4;

  v6 = v5;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;
  id v6;

  objc_msgSend(a3, "preferredContentSizeCategory");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMZoomButton traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6 && (objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
  {
    -[CAMZoomButton _updateForContentSize](self, "_updateForContentSize");
    -[CAMZoomButton setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double MidX;
  double MidY;
  double *v19;
  __int128 v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  id WeakRetained;
  double v52;
  uint64_t v53;
  _OWORD v54[3];
  _OWORD v55[3];
  _OWORD v56[3];
  _OWORD v57[3];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  objc_super v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  v67.receiver = self;
  v67.super_class = (Class)CAMZoomButton;
  -[CAMZoomButton layoutSubviews](&v67, sel_layoutSubviews);
  -[CAMZoomButton bounds](self, "bounds");
  -[CAMZoomButton alignmentRectForFrame:](self, "alignmentRectForFrame:");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMZoomButton _contentContainerView](self, "_contentContainerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomButton _zoomFactorLabel](self, "_zoomFactorLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomButton _zoomSymbolView](self, "_zoomSymbolView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomButton _circleImageView](self, "_circleImageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomButton _backgroundImageView](self, "_backgroundImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "image");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v68.origin.x = v4;
  v68.origin.y = v6;
  v68.size.width = v8;
  v68.size.height = v10;
  MidX = CGRectGetMidX(v68);
  v69.origin.x = v4;
  v69.origin.y = v6;
  v69.size.width = v8;
  v69.size.height = v10;
  MidY = CGRectGetMidY(v69);
  v65 = 0u;
  v66 = 0u;
  v64 = 0u;
  -[CAMZoomButton _highlightingTransformForHighlighted:](self, "_highlightingTransformForHighlighted:", -[CAMZoomButton isHighlighted](self, "isHighlighted"));
  objc_msgSend(v11, "setBounds:", 0.0, 0.0, v8, v10);
  objc_msgSend(v11, "setCenter:", MidX, MidY);
  v61 = v64;
  v62 = v65;
  v63 = v66;
  objc_msgSend(v11, "setTransform:", &v61);
  v70.origin.x = 0.0;
  v70.origin.y = 0.0;
  v70.size.width = v8;
  v70.size.height = v10;
  CGRectGetMidX(v70);
  v71.origin.x = 0.0;
  v71.origin.y = 0.0;
  v71.size.width = v8;
  v71.size.height = v10;
  CGRectGetMidY(v71);
  objc_msgSend(v16, "size");
  v19 = (double *)MEMORY[0x1E0C9D648];
  v20 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v59 = *MEMORY[0x1E0C9D648];
  v60 = v20;
  v58 = *MEMORY[0x1E0C9D538];
  v62 = 0u;
  v63 = 0u;
  v61 = 0u;
  -[CAMZoomButton _transformForEnlargeText:orientation:](self, "_transformForEnlargeText:orientation:", -[CAMZoomButton abbreviateAndEnlargeText](self, "abbreviateAndEnlargeText"), -[CAMZoomButton orientation](self, "orientation"));
  +[CAMView convertRect:toCeiledBounds:andRoundedCenter:toViewScale:](CAMView, "convertRect:toCeiledBounds:andRoundedCenter:toViewScale:", &v59, &v58, self, 0.0, 0.0, v8, v10);
  objc_msgSend(v12, "setBounds:", v59, v60);
  objc_msgSend(v12, "setCenter:", v58);
  v57[0] = v61;
  v57[1] = v62;
  v57[2] = v63;
  objc_msgSend(v12, "setTransform:", v57);
  -[CAMZoomButton traitCollection](self, "traitCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "displayScale");
  v23 = v22;
  v53 = v22;

  v24 = *v19;
  v25 = v19[1];
  objc_msgSend(v13, "image");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "size");
  v28 = v27;
  v30 = v29;

  UIRectCenteredIntegralRectScale();
  UIRectGetCenter();
  v32 = v31;
  v34 = v33;
  v52 = v25;
  objc_msgSend(v13, "setBounds:", v24, v25, v28, v30, v23);
  objc_msgSend(v13, "setCenter:", v32, v34);
  v56[0] = v61;
  v56[1] = v62;
  v56[2] = v63;
  objc_msgSend(v13, "setTransform:", v56);
  UIRectCenteredAboutPointScale();
  objc_msgSend(v14, "setFrame:");
  UIRectCenteredAboutPointScale();
  objc_msgSend(v15, "setFrame:");
  -[CAMZoomButton _focalLengthLabel](self, "_focalLengthLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
  {
    objc_msgSend(v35, "intrinsicContentSize");
    CEKRectWithSize();
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v44 = v43;
    UIRectCenteredIntegralRectScale();
    objc_msgSend(v36, "setBounds:", v38, v40, v42, v44, v53);
    UIRectGetCenter();
    objc_msgSend(v36, "setCenter:");
    v55[0] = v61;
    v55[1] = v62;
    v55[2] = v63;
    objc_msgSend(v36, "setTransform:", v55);
  }
  -[CAMZoomButton _accessoryBackgroundView](self, "_accessoryBackgroundView");
  v45 = objc_claimAutoreleasedReturnValue();
  -[CAMZoomButton _accessoryImageView](self, "_accessoryImageView");
  v46 = objc_claimAutoreleasedReturnValue();
  if (v46 | v45)
  {
    objc_msgSend((id)v45, "intrinsicContentSize");
    UIRectCenteredAboutPoint();
    objc_msgSend((id)v46, "intrinsicContentSize");
    v48 = v47;
    v50 = v49;
    if (-[CAMZoomButton accessoryState](self, "accessoryState"))
      -[CAMZoomButton accessoryPosition](self, "accessoryPosition");
    UIRectCenteredAboutPointScale();
    UIRectGetCenter();
    objc_msgSend((id)v46, "setCenter:");
    objc_msgSend((id)v46, "setBounds:", v24, v52, v48, v50);
    v54[0] = v61;
    v54[1] = v62;
    v54[2] = v63;
    objc_msgSend((id)v46, "setTransform:", v54);
    UIRectIntegralWithScale();
    objc_msgSend((id)v45, "setFrame:");
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "zoomButtonDidLayout");

}

- (void)tintColorDidChange
{
  CAMZoomFactorLabel *zoomFactorLabel;
  id v3;

  zoomFactorLabel = self->__zoomFactorLabel;
  -[CAMZoomButton tintColor](self, "tintColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMZoomFactorLabel setTextColor:](zoomFactorLabel, "setTextColor:", v3);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  _OWORD v6[6];
  objc_super v7;

  v3 = a3;
  v5 = -[CAMZoomButton isHighlighted](self, "isHighlighted");
  v7.receiver = self;
  v7.super_class = (Class)CAMZoomButton;
  -[CAMZoomButton setHighlighted:](&v7, sel_setHighlighted_, v3);
  if (v5 != v3)
  {
    -[CAMZoomButton _highlightingTransformForHighlighted:](self, "_highlightingTransformForHighlighted:", v3);
    v6[0] = v6[3];
    v6[1] = v6[4];
    v6[2] = v6[5];
    -[CAMZoomButton _setHighlightingTransform:](self, "_setHighlightingTransform:", v6);
    -[CAMZoomButton _performHighlightAnimation](self, "_performHighlightAnimation");
  }
}

- (CGAffineTransform)_highlightingTransformForHighlighted:(SEL)a3
{
  double v5;
  _BOOL4 v6;

  v5 = 1.0;
  if (a4)
  {
    v6 = +[CAMZoomButton _useOutline](CAMZoomButton, "_useOutline", 1.0);
    v5 = 0.85;
    if (v6)
      v5 = 0.92;
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return CGAffineTransformMakeScale(retstr, v5, v5);
}

- (CGAffineTransform)_transformForEnlargeText:(SEL)a3 orientation:(BOOL)a4
{
  double v7;
  CGAffineTransform v9;
  CGAffineTransform t1;
  CGAffineTransform v11;
  CGAffineTransform v12;

  v7 = 1.3;
  memset(&v12.c, 0, 32);
  if (!a4)
    v7 = 1.0;
  *(_OWORD *)&v12.a = 0uLL;
  CGAffineTransformMakeScale(&v12, v7, v7);
  memset(&v11, 0, sizeof(v11));
  CAMOrientationTransform(-[CAMZoomButton orientation](self, "orientation"), (uint64_t)&v11);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  t1 = v11;
  v9 = v12;
  return CGAffineTransformConcat(retstr, &t1, &v9);
}

- (void)_updateBackgroundImageViewAlpha
{
  double v3;
  _BOOL4 v4;
  int v5;
  id v6;

  v3 = 0.0;
  if (!-[CAMZoomButton shouldHideBackground](self, "shouldHideBackground"))
  {
    if (+[CAMZoomButton _useOutline](CAMZoomButton, "_useOutline"))
    {
      if (-[CAMZoomButton isHighlighted](self, "isHighlighted"))
        v3 = 0.5;
      else
        v3 = 0.1;
    }
    else
    {
      v4 = -[CAMZoomButton isOverPlatter](self, "isOverPlatter");
      v5 = -[CAMZoomButton isHighlighted](self, "isHighlighted");
      if (v4)
      {
        if ((v5 & 1) != 0)
          v3 = 0.7;
        else
          v3 = -0.5 / (1.0 - 0.15) + 1.0;
      }
      else if (v5)
      {
        v3 = 0.6;
      }
      else
      {
        v3 = 0.5;
      }
    }
  }
  -[CAMZoomButton _backgroundImageView](self, "_backgroundImageView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v3);

}

- (void)_performHighlightAnimation
{
  uint64_t v3;
  double v4;
  uint64_t v5;
  float v6;
  float v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CATransform3D v19;
  CGAffineTransform m;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CATransform3D v26;
  CGAffineTransform v27;
  _QWORD v28[5];

  v3 = -[CAMZoomButton isHighlighted](self, "isHighlighted");
  v4 = 0.1;
  if ((_DWORD)v3)
  {
    v5 = 131078;
  }
  else
  {
    v4 = 0.25;
    v5 = 6;
  }
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __43__CAMZoomButton__performHighlightAnimation__block_invoke;
  v28[3] = &unk_1EA328868;
  v28[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", v5, v28, 0, v4, 0.0);
  UIAnimationDragCoefficient();
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMass:", 0.8);
  objc_msgSend(v8, "setDamping:", 12.0 / v7);
  objc_msgSend(v8, "setStiffness:", 300.0 / (float)(v7 * v7));
  objc_msgSend(v8, "durationForEpsilon:", 0.01);
  objc_msgSend(v8, "setDuration:");
  LODWORD(v9) = 1041865114;
  LODWORD(v10) = 0;
  LODWORD(v11) = 0.5;
  LODWORD(v12) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimingFunction:", v13);

  -[CAMZoomButton _contentContainerView](self, "_contentContainerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presentationLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "valueForKeyPath:", CFSTR("transform"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFromValue:", v17);

  memset(&v27, 0, sizeof(v27));
  -[CAMZoomButton _highlightingTransformForHighlighted:](self, "_highlightingTransformForHighlighted:", v3);
  memset(&v26, 0, sizeof(v26));
  m = v27;
  CATransform3DMakeAffineTransform(&v26, &m);
  v22 = *(_OWORD *)&v26.m31;
  v23 = *(_OWORD *)&v26.m33;
  v24 = *(_OWORD *)&v26.m41;
  v25 = *(_OWORD *)&v26.m43;
  *(_OWORD *)&m.a = *(_OWORD *)&v26.m11;
  *(_OWORD *)&m.c = *(_OWORD *)&v26.m13;
  *(_OWORD *)&m.tx = *(_OWORD *)&v26.m21;
  v21 = *(_OWORD *)&v26.m23;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &m);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setToValue:", v18);

  objc_msgSend(v15, "addAnimation:forKey:", v8, CFSTR("highlightAnimation"));
  v19 = v26;
  objc_msgSend(v15, "setTransform:", &v19);

}

uint64_t __43__CAMZoomButton__performHighlightAnimation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateBackgroundImageViewAlpha");
}

+ (NSNumberFormatter)zoomFactorFormatter
{
  if (zoomFactorFormatter_onceToken != -1)
    dispatch_once(&zoomFactorFormatter_onceToken, &__block_literal_global_29);
  return (NSNumberFormatter *)(id)zoomFactorFormatter_sharedFormatter;
}

uint64_t __36__CAMZoomButton_zoomFactorFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)zoomFactorFormatter_sharedFormatter;
  zoomFactorFormatter_sharedFormatter = (uint64_t)v0;

  objc_msgSend((id)zoomFactorFormatter_sharedFormatter, "setGeneratesDecimalNumbers:", 1);
  objc_msgSend((id)zoomFactorFormatter_sharedFormatter, "setNumberStyle:", 1);
  objc_msgSend((id)zoomFactorFormatter_sharedFormatter, "setMinimumFractionDigits:", 0);
  objc_msgSend((id)zoomFactorFormatter_sharedFormatter, "setMaximumFractionDigits:", 1);
  objc_msgSend((id)zoomFactorFormatter_sharedFormatter, "setRoundingIncrement:", &unk_1EA3B1A00);
  return objc_msgSend((id)zoomFactorFormatter_sharedFormatter, "setRoundingMode:", 2);
}

- (void)_updateZoomFactorLabelIfNeeded
{
  _BOOL4 v3;
  id v4;

  if (!-[CAMZoomButton contentType](self, "contentType"))
  {
    v3 = -[CAMZoomButton abbreviateAndEnlargeText](self, "abbreviateAndEnlargeText");
    -[CAMZoomButton _zoomFactorLabel](self, "_zoomFactorLabel");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CAMZoomButton zoomFactor](self, "zoomFactor");
    objc_msgSend(v4, "setZoomFactor:");
    objc_msgSend(v4, "setShowZoomFactorSymbol:", !v3);

  }
}

+ (id)textForZoomFactor:(double)a3 showZoomFactorSymbol:(BOOL)a4
{
  return (id)objc_msgSend(a1, "textForZoomFactor:showZoomFactorSymbol:useLeadingZero:", a4, 1, a3);
}

+ (id)textForZoomFactor:(double)a3 showZoomFactorSymbol:(BOOL)a4 useLeadingZero:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a5;
  +[CAMZoomButton zoomFactorFormatter](CAMZoomButton, "zoomFactorFormatter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = a3 >= 1.0 || v5;
  objc_msgSend(v8, "setMinimumIntegerDigits:", v10);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromNumber:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    CAMLocalizedFrameworkString(CFSTR("ZOOM_FACTOR_SYMBOL"), CFSTR("The multiplication symbol used for indicating zoom factor."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CAMLocalizedFrameworkString(CFSTR("ZOOM_FACTOR_TEXT"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v14, CFSTR("%@%@"), 0, v12, v13);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = v12;
  }

  return v15;
}

- (void)setAbbreviateAndEnlargeText:(BOOL)a3
{
  if (self->_abbreviateAndEnlargeText != a3)
  {
    self->_abbreviateAndEnlargeText = a3;
    -[CAMZoomButton _updateZoomFactorLabelIfNeeded](self, "_updateZoomFactorLabelIfNeeded");
    -[CAMZoomButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setUseLeadingZero:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CAMZoomButton _zoomFactorLabel](self, "_zoomFactorLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseLeadingZero:", v3);

}

- (BOOL)useLeadingZero
{
  void *v2;
  char v3;

  -[CAMZoomButton _zoomFactorLabel](self, "_zoomFactorLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "useLeadingZero");

  return v3;
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD v6[5];

  if (self->_orientation != a3)
  {
    v4 = a4;
    self->_orientation = a3;
    -[CAMZoomButton setNeedsLayout](self, "setNeedsLayout");
    if (v4)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __41__CAMZoomButton_setOrientation_animated___block_invoke;
      v6[3] = &unk_1EA328868;
      v6[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v6, 0, 0.3, 0.0);
    }
  }
}

uint64_t __41__CAMZoomButton_setOrientation_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (id)_createBackgroundImageForContentSize:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0DC3658];
  v5 = a3;
  objc_msgSend(v4, "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomButton _createBackgroundImageForContentSize:color:](self, "_createBackgroundImageForContentSize:color:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_createBackgroundImageForContentSize:(id)a3 color:(id)a4
{
  id v6;
  double width;
  void *v8;
  void *v9;
  CGSize v11;

  v6 = a4;
  -[CAMZoomButton _backgroundImageDiameterForContentSize:](self, "_backgroundImageDiameterForContentSize:", a3);
  width = v11.width;
  v11.height = v11.width;
  UIGraphicsBeginImageContextWithOptions(v11, 0, 0.0);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), width, width);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "set");

  objc_msgSend(v8, "fill");
  UIGraphicsGetImageFromCurrentImageContext();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v9;
}

- (id)_createCircleImageForContentSize:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  CGSize v13;
  CGRect v14;
  CGRect v15;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "circleDiameterForContentSize:", v4);
  v6 = v5;
  -[CAMZoomButton _circleLineWidthForContentSize:](self, "_circleLineWidthForContentSize:", v4);
  v8 = v7;

  v13.width = v6;
  v13.height = v6;
  UIGraphicsBeginImageContextWithOptions(v13, 0, 0.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "set");
  v14.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
  v14.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
  v14.size.width = v6;
  v14.size.height = v6;
  v15 = CGRectInset(v14, v8 * 0.5, v8 * 0.5);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLineWidth:", v8);
  objc_msgSend(v10, "stroke");
  UIGraphicsGetImageFromCurrentImageContext();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v11;
}

+ (BOOL)shouldUseLargeButtonSizeForContentSize:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC4908]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC4930]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC4920]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC4918]) & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC4900]) ^ 1;
  }

  return v4;
}

- (double)_circleLineWidthForContentSize:(id)a3
{
  void *v3;
  double v4;

  -[CAMZoomButton _circleImageView](self, "_circleImageView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 1.0;
  else
    v4 = 0.0;

  return v4;
}

- (double)_backgroundImageDiameterForContentSize:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "circleDiameterForContentSize:", v4);
  v6 = v5;
  -[CAMZoomButton _circleLineWidthForContentSize:](self, "_circleLineWidthForContentSize:", v4);
  v8 = v7;

  return v6 + (v8 - CAMPixelWidthForView(self)) * -2.0;
}

- (CAMZoomButtonDelegate)delegate
{
  return (CAMZoomButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)contentType
{
  return self->_contentType;
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (int64_t)zoomSymbol
{
  return self->_zoomSymbol;
}

- (int64_t)focalLength
{
  return self->_focalLength;
}

- (int64_t)accessoryState
{
  return self->_accessoryState;
}

- (int64_t)accessoryPosition
{
  return self->_accessoryPosition;
}

- (UIEdgeInsets)tappableEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_tappableEdgeInsets.top;
  left = self->_tappableEdgeInsets.left;
  bottom = self->_tappableEdgeInsets.bottom;
  right = self->_tappableEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (BOOL)shouldHideBackground
{
  return self->_shouldHideBackground;
}

- (BOOL)isOverPlatter
{
  return self->_overPlatter;
}

- (CGAffineTransform)highlightingTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[13].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[13].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[13].ty;
  return self;
}

- (BOOL)abbreviateAndEnlargeText
{
  return self->_abbreviateAndEnlargeText;
}

- (UIView)_contentContainerView
{
  return self->__contentContainerView;
}

- (CAMZoomFactorLabel)_zoomFactorLabel
{
  return self->__zoomFactorLabel;
}

- (UIImageView)_zoomSymbolView
{
  return self->__zoomSymbolView;
}

- (CAMFocalLengthLabel)_focalLengthLabel
{
  return self->__focalLengthLabel;
}

- (void)set_focalLengthLabel:(id)a3
{
  objc_storeStrong((id *)&self->__focalLengthLabel, a3);
}

- (UIImageView)_circleImageView
{
  return self->__circleImageView;
}

- (UIImageView)_backgroundImageView
{
  return self->__backgroundImageView;
}

- (UIImageView)_accessoryBackgroundView
{
  return self->__accessoryBackgroundView;
}

- (void)set_accessoryBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->__accessoryBackgroundView, a3);
}

- (UIImageView)_accessoryImageView
{
  return self->__accessoryImageView;
}

- (void)set_accessoryImageView:(id)a3
{
  objc_storeStrong((id *)&self->__accessoryImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__accessoryImageView, 0);
  objc_storeStrong((id *)&self->__accessoryBackgroundView, 0);
  objc_storeStrong((id *)&self->__backgroundImageView, 0);
  objc_storeStrong((id *)&self->__circleImageView, 0);
  objc_storeStrong((id *)&self->__focalLengthLabel, 0);
  objc_storeStrong((id *)&self->__zoomSymbolView, 0);
  objc_storeStrong((id *)&self->__zoomFactorLabel, 0);
  objc_storeStrong((id *)&self->__contentContainerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
