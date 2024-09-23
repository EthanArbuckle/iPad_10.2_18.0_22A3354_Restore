@implementation MediaControlsRoutingButtonView

- (MediaControlsRoutingButtonView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  MediaControlsRoutingButtonView *v7;
  uint64_t v8;
  CCUICAPackageView *packageView;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)MediaControlsRoutingButtonView;
  v7 = -[MPButton initWithFrame:](&v11, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D14770]), "initWithFrame:", x, y, width, height);
    packageView = v7->_packageView;
    v7->_packageView = (CCUICAPackageView *)v8;

    -[CCUICAPackageView setUserInteractionEnabled:](v7->_packageView, "setUserInteractionEnabled:", 0);
    -[MediaControlsRoutingButtonView addSubview:](v7, "addSubview:", v7->_packageView);
    -[MediaControlsRoutingButtonView setPointerInteractionEnabled:](v7, "setPointerInteractionEnabled:", 1);
    -[MediaControlsRoutingButtonView setPointerStyleProvider:](v7, "setPointerStyleProvider:", &__block_literal_global_14);
  }
  return v7;
}

id __48__MediaControlsRoutingButtonView_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (objc_class *)MEMORY[0x1E0DC3B78];
  v3 = a2;
  v4 = objc_alloc_init(v2);
  v5 = (void *)MEMORY[0x1E0DC3508];
  objc_msgSend(v3, "bounds");
  objc_msgSend(v5, "bezierPathWithOvalInRect:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVisiblePath:", v6);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", v3, v4);
  objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setAlpha:(double)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MediaControlsRoutingButtonView;
  -[MediaControlsRoutingButtonView setAlpha:](&v6, sel_setAlpha_);
  -[MediaControlsRoutingButtonView packageView](self, "packageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", a3);

  -[MediaControlsRoutingButtonView _updateGlyphState](self, "_updateGlyphState");
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
  v13.super_class = (Class)MediaControlsRoutingButtonView;
  -[MPButton layoutSubviews](&v13, sel_layoutSubviews);
  -[MediaControlsRoutingButtonView packageView](self, "packageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  -[MediaControlsRoutingButtonView bounds](self, "bounds");
  UIRectCenteredIntegralRect();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[MediaControlsRoutingButtonView packageView](self, "packageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)setCurrentMode:(int64_t)a3
{
  if (self->_currentMode != a3)
  {
    self->_currentMode = a3;
    -[MediaControlsRoutingButtonView _updateGlyphState](self, "_updateGlyphState");
  }
}

- (void)setDeviceType:(int64_t)a3
{
  if (self->_deviceType != a3)
  {
    self->_deviceType = a3;
    -[MediaControlsRoutingButtonView _updateGlyphPackage](self, "_updateGlyphPackage");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  _QWORD v6[5];
  BOOL v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MediaControlsRoutingButtonView;
  -[MediaControlsRoutingButtonView setHighlighted:](&v8, sel_setHighlighted_);
  v5 = 0.47;
  if (v3)
    v5 = 0.0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__MediaControlsRoutingButtonView_setHighlighted___block_invoke;
  v6[3] = &unk_1E5818D00;
  v6[4] = self;
  v7 = v3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 327684, v6, 0, v5, 0.0);
}

void __49__MediaControlsRoutingButtonView_setHighlighted___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  if (*(_BYTE *)(a1 + 40))
    v1 = 0.2;
  else
    v1 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "packageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  -[MediaControlsRoutingButtonView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[MediaControlsRoutingButtonView _updateGlyphPackage](self, "_updateGlyphPackage");
}

- (id)_glyphResource
{
  void *v3;
  _BOOL4 v4;
  int64_t deviceType;
  __CFString *v6;
  const __CFString *v7;

  -[MediaControlsRoutingButtonView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle") == 2 || !self->_userInterfaceStyleSwitchingEnabled;

  deviceType = self->_deviceType;
  if (deviceType == 2)
  {
    v6 = CFSTR("VideoRoutingControl-Light");
    v7 = CFSTR("VideoRoutingControl-Dark");
  }
  else
  {
    if (deviceType != 1)
      return 0;
    v6 = CFSTR("AudioRoutingControl-Light");
    v7 = CFSTR("AudioRoutingControl-Dark");
  }
  if (v4)
    v6 = (__CFString *)v7;
  return v6;
}

- (void)_updateGlyphPackage
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[MediaControlsRoutingButtonView _glyphResource](self, "_glyphResource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mediaControlsBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLForResource:withExtension:", v6, CFSTR("ca"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD27F8], "packageWithContentsOfURL:type:options:error:", v4, *MEMORY[0x1E0CD3078], 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUICAPackageView setPackage:](self->_packageView, "setPackage:", v5);

    -[MediaControlsRoutingButtonView _updateGlyphState](self, "_updateGlyphState");
  }
  -[MediaControlsRoutingButtonView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_updateGlyphState
{
  int64_t v3;
  void *v4;
  const __CFString *v5;
  id v6;

  v3 = -[MediaControlsRoutingButtonView currentMode](self, "currentMode");
  if (v3 == 2)
  {
    -[MediaControlsRoutingButtonView packageView](self, "packageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("playpause");
  }
  else if (v3 == 1)
  {
    -[MediaControlsRoutingButtonView packageView](self, "packageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("active");
  }
  else
  {
    if (v3)
      return;
    -[MediaControlsRoutingButtonView packageView](self, "packageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("null");
  }
  v6 = v4;
  objc_msgSend(v4, "setStateName:", v5);

}

- (int64_t)currentMode
{
  return self->_currentMode;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (BOOL)isUserInterfaceStyleSwitchingEnabled
{
  return self->_userInterfaceStyleSwitchingEnabled;
}

- (void)setUserInterfaceStyleSwitchingEnabled:(BOOL)a3
{
  self->_userInterfaceStyleSwitchingEnabled = a3;
}

- (CCUICAPackageView)packageView
{
  return self->_packageView;
}

- (void)setPackageView:(id)a3
{
  objc_storeStrong((id *)&self->_packageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageView, 0);
}

@end
