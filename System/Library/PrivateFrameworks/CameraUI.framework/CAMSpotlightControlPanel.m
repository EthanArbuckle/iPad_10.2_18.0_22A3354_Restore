@implementation CAMSpotlightControlPanel

- (CAMSpotlightControlPanel)initWithFrame:(CGRect)a3
{
  CAMSpotlightControlPanel *v3;
  uint64_t v4;
  UIButton *controlIconView;
  void *v6;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *openByControl;
  objc_super v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)CAMSpotlightControlPanel;
  v3 = -[CAMSpotlightControlPanel initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v4 = objc_claimAutoreleasedReturnValue();
    controlIconView = v3->__controlIconView;
    v3->__controlIconView = (UIButton *)v4;

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v3->__controlIconView, "setTintColor:", v6);

    -[UIButton addTarget:action:forControlEvents:](v3->__controlIconView, "addTarget:action:forControlEvents:", v3, sel__handleIconViewReleased_, 64);
    -[CAMSpotlightControlPanel addSubview:](v3, "addSubview:", v3->__controlIconView);
    v12[0] = &unk_1EA3B0B68;
    v12[1] = &unk_1EA3B0B80;
    v13[0] = MEMORY[0x1E0C9AAA0];
    v13[1] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "mutableCopy");
    openByControl = v3->__openByControl;
    v3->__openByControl = (NSMutableDictionary *)v8;

  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  int64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v3 = -[CAMSpotlightControlPanel spotlightControl](self, "spotlightControl");
  if (v3 == 2)
  {
    -[CAMSpotlightControlPanel exposureSlider](self, "exposureSlider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3 != 3)
    {
      v7 = *MEMORY[0x1E0C9D820];
      v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      goto LABEL_7;
    }
    -[CAMSpotlightControlPanel apertureSlider](self, "apertureSlider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  objc_msgSend(v4, "intrinsicContentSize");
  v7 = v6;
  v9 = v8;

LABEL_7:
  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  id v24;
  CGRect v25;

  -[CAMSpotlightControlPanel exposureSlider](self, "exposureSlider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSpotlightControlPanel _layoutFullWidthCustomView:](self, "_layoutFullWidthCustomView:", v3);

  -[CAMSpotlightControlPanel apertureSlider](self, "apertureSlider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSpotlightControlPanel _layoutFullWidthCustomView:](self, "_layoutFullWidthCustomView:", v4);

  -[CAMSpotlightControlPanel _controlIconView](self, "_controlIconView");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  CAMViewAlignmentSize(v24);
  CEKRectWithSize();
  v22 = v6;
  v23 = v5;
  v21 = v7;
  v9 = v8;
  -[CAMSpotlightControlPanel bounds](self, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[CAMSpotlightControlPanel traitCollection](self, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "displayScale");
  v20 = v19;
  UIRectCenteredXInRectScale();

  v25.origin.x = v11;
  v25.origin.y = v13;
  v25.size.width = v15;
  v25.size.height = v17;
  CGRectGetMaxY(v25);
  UIRectGetCenter();
  objc_msgSend(v24, "setCenter:", v20);
  objc_msgSend(v24, "setBounds:", v23, v22, v21, v9);
  -[CAMSpotlightControlPanel _updateControlsVisibilityAnimated:](self, "_updateControlsVisibilityAnimated:", 0);

}

- (void)setSpotlightControl:(int64_t)a3
{
  -[CAMSpotlightControlPanel setSpotlightControl:animated:](self, "setSpotlightControl:animated:", a3, 0);
}

- (void)setSpotlightControl:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  if (self->_spotlightControl != a3)
  {
    v4 = a4;
    if (-[CAMSpotlightControlPanel isControlTypeOpen:](self, "isControlTypeOpen:"))
      -[CAMSpotlightControlPanel _loadSliderIfNeededForControlType:](self, "_loadSliderIfNeededForControlType:", a3);
    self->_spotlightControl = a3;
    -[CAMSpotlightControlPanel _updateControlsVisibilityAnimated:](self, "_updateControlsVisibilityAnimated:", v4);
    -[CAMSpotlightControlPanel _updateControlIcon](self, "_updateControlIcon");
  }
}

- (BOOL)isExposureSliderVisible
{
  return -[CAMSpotlightControlPanel isControlTypeVisible:](self, "isControlTypeVisible:", 2);
}

- (BOOL)isApertureSliderVisible
{
  return -[CAMSpotlightControlPanel isControlTypeVisible:](self, "isControlTypeVisible:", 3);
}

- (BOOL)isExposureSliderOpen
{
  return -[CAMSpotlightControlPanel isControlTypeOpen:](self, "isControlTypeOpen:", 2);
}

- (void)setExposureSliderOpen:(BOOL)a3
{
  -[CAMSpotlightControlPanel setExposureSliderOpen:animated:](self, "setExposureSliderOpen:animated:", a3, 0);
}

- (void)setExposureSliderOpen:(BOOL)a3 animated:(BOOL)a4
{
  -[CAMSpotlightControlPanel setControlType:open:animated:](self, "setControlType:open:animated:", 2, a3, a4);
}

- (BOOL)isApertureSliderOpen
{
  return -[CAMSpotlightControlPanel isControlTypeOpen:](self, "isControlTypeOpen:", 3);
}

- (void)setApertureSliderOpen:(BOOL)a3
{
  -[CAMSpotlightControlPanel setApertureSliderOpen:animated:](self, "setApertureSliderOpen:animated:", a3, 0);
}

- (void)setApertureSliderOpen:(BOOL)a3 animated:(BOOL)a4
{
  -[CAMSpotlightControlPanel setControlType:open:animated:](self, "setControlType:open:animated:", 3, a3, a4);
}

- (BOOL)isControlTypeVisible:(int64_t)a3
{
  return -[CAMSpotlightControlPanel spotlightControl](self, "spotlightControl") == a3
      && -[CAMSpotlightControlPanel isControlTypeOpen:](self, "isControlTypeOpen:", a3);
}

- (BOOL)isControlTypeOpen:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[CAMSpotlightControlPanel _openByControl](self, "_openByControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (void)setControlType:(int64_t)a3 open:(BOOL)a4 animated:(BOOL)a5
{
  -[CAMSpotlightControlPanel _setControlType:open:animated:notifyDelegate:](self, "_setControlType:open:animated:notifyDelegate:", a3, a4, a5, 0);
}

- (void)_setControlType:(int64_t)a3 open:(BOOL)a4 animated:(BOOL)a5 notifyDelegate:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  if (-[CAMSpotlightControlPanel isControlTypeOpen:](self, "isControlTypeOpen:") != a4)
  {
    if (-[CAMSpotlightControlPanel spotlightControl](self, "spotlightControl") == a3)
      -[CAMSpotlightControlPanel _loadSliderIfNeededForControlType:](self, "_loadSliderIfNeededForControlType:", a3);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSpotlightControlPanel _openByControl](self, "_openByControl");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

    -[CAMSpotlightControlPanel _updateControlsVisibilityAnimated:](self, "_updateControlsVisibilityAnimated:", v7);
    if (v6)
    {
      -[CAMSpotlightControlPanel delegate](self, "delegate");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "spotlightControlPanel:didChangeOpenForSpotlight:", self, a3);

    }
  }
}

- (void)_layoutFullWidthCustomView:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[CAMSpotlightControlPanel bounds](self, "bounds");
  objc_msgSend(v4, "intrinsicContentSize");
  -[CAMSpotlightControlPanel traitCollection](self, "traitCollection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  v6 = v5;
  UIRectCenteredYInRectScale();
  objc_msgSend(v4, "setFrame:", v6);

}

- (void)_updateControlsVisibilityAnimated:(BOOL)a3
{
  double v3;
  _QWORD v4[5];

  v3 = 0.0;
  if (a3)
    v3 = 0.5;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__CAMSpotlightControlPanel__updateControlsVisibilityAnimated___block_invoke;
  v4[3] = &unk_1EA328868;
  v4[4] = self;
  +[CAMView animateIfNeededWithDuration:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](CAMView, "animateIfNeededWithDuration:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 2, v4, 0, v3, 1.0, 1.0);
}

void __62__CAMSpotlightControlPanel__updateControlsVisibilityAnimated___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  double v4;
  void *v5;
  unint64_t v6;
  void *v7;
  double v8;
  id v9;

  if (objc_msgSend(*(id *)(a1 + 32), "isApertureSliderVisible"))
    v2 = 1.0;
  else
    v2 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "apertureSlider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

  if (objc_msgSend(*(id *)(a1 + 32), "isExposureSliderVisible"))
    v4 = 1.0;
  else
    v4 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "exposureSlider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v4);

  v6 = objc_msgSend(*(id *)(a1 + 32), "spotlightControl");
  if (v6 - 2 < 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_controlIconView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 1.0;
  }
  else
  {
    if (v6 > 1)
      return;
    objc_msgSend(*(id *)(a1 + 32), "_controlIconView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0.0;
  }
  v9 = v7;
  objc_msgSend(v7, "setAlpha:", v8);

}

- (void)_updateControlIcon
{
  int64_t v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = -[CAMSpotlightControlPanel spotlightControl](self, "spotlightControl");
  if (v3 == 3)
  {
    v4 = CFSTR("f.cursive");
  }
  else
  {
    if (v3 != 2)
      return;
    v4 = CFSTR("plusminus.circle");
  }
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSpotlightControlPanel _controlIconView](self, "_controlIconView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:forState:", v5, 0);

  -[CAMSpotlightControlPanel setNeedsLayout](self, "setNeedsLayout");
}

- (void)_configureAndInstallDiscreteSlider:(id)a3
{
  id v4;

  v4 = a3;
  -[CAMSpotlightControlPanel _scrubberGradientEdgeInsets](self, "_scrubberGradientEdgeInsets");
  objc_msgSend(v4, "setGradientInsets:");
  objc_msgSend(v4, "setTitleAlignment:", 2);
  objc_msgSend(v4, "setFontStyle:", -[CAMSpotlightControlPanel _sliderFontStyle](self, "_sliderFontStyle"));
  objc_msgSend(v4, "setUseTextLegibilityShadows:", 1);
  objc_msgSend(v4, "setUseTickMarkLegibilityShadows:", 1);
  objc_msgSend(v4, "setTitleText:", &stru_1EA3325A0);
  objc_msgSend(v4, "setTransparentGradients");
  -[CAMSpotlightControlPanel insertSubview:atIndex:](self, "insertSubview:atIndex:", v4, 0);
  -[CAMSpotlightControlPanel _layoutFullWidthCustomView:](self, "_layoutFullWidthCustomView:", v4);

  -[CAMSpotlightControlPanel _updateControlsVisibilityAnimated:](self, "_updateControlsVisibilityAnimated:", 0);
  -[CAMSpotlightControlPanel _updateTextOrientation](self, "_updateTextOrientation");
}

- (void)_loadSliderIfNeededForControlType:(int64_t)a3
{
  if (a3 == 3)
  {
    -[CAMSpotlightControlPanel _loadApertureSliderIfNeeded](self, "_loadApertureSliderIfNeeded");
  }
  else if (a3 == 2)
  {
    -[CAMSpotlightControlPanel _loadExposureSliderIfNeeded](self, "_loadExposureSliderIfNeeded");
  }
}

- (void)_loadApertureSliderIfNeeded
{
  CEKApertureSlider *v3;
  CEKApertureSlider *apertureSlider;
  id v5;

  if (!self->_apertureSlider)
  {
    v3 = (CEKApertureSlider *)objc_alloc_init(MEMORY[0x1E0D0D018]);
    apertureSlider = self->_apertureSlider;
    self->_apertureSlider = v3;

    -[CAMSpotlightControlPanel _configureAndInstallDiscreteSlider:](self, "_configureAndInstallDiscreteSlider:", self->_apertureSlider);
    -[CEKApertureSlider addTarget:action:forControlEvents:](self->_apertureSlider, "addTarget:action:forControlEvents:", self, sel__apertureSliderDidChangeValue, 4096);
    -[CAMSpotlightControlPanel delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "spotlightControlPanelDidCreateApertureSlider:", self);

  }
}

- (void)_loadExposureSliderIfNeeded
{
  CAMExposureSlider *v3;
  CAMExposureSlider *exposureSlider;
  id v5;

  if (!self->_exposureSlider)
  {
    v3 = objc_alloc_init(CAMExposureSlider);
    exposureSlider = self->_exposureSlider;
    self->_exposureSlider = v3;

    -[CAMSpotlightControlPanel _configureAndInstallDiscreteSlider:](self, "_configureAndInstallDiscreteSlider:", self->_exposureSlider);
    -[CAMExposureSlider addTarget:action:forControlEvents:](self->_exposureSlider, "addTarget:action:forControlEvents:", self, sel__exposureSliderDidChangeValue, 4096);
    -[CAMSpotlightControlPanel delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "spotlightControlPanelDidCreateExposureSlider:", self);

  }
}

- (void)_handleIconViewReleased:(id)a3
{
  int64_t v4;

  v4 = -[CAMSpotlightControlPanel spotlightControl](self, "spotlightControl", a3);
  -[CAMSpotlightControlPanel _setControlType:open:animated:notifyDelegate:](self, "_setControlType:open:animated:notifyDelegate:", v4, -[CAMSpotlightControlPanel isControlTypeOpen:](self, "isControlTypeOpen:", v4) ^ 1, 1, 1);
}

- (void)_apertureSliderDidChangeValue
{
  id v3;

  -[CAMSpotlightControlPanel delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spotlightControlPanel:didChangeValueForSpotlight:", self, 3);

}

- (void)_exposureSliderDidChangeValue
{
  id v3;

  -[CAMSpotlightControlPanel delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spotlightControlPanel:didChangeValueForSpotlight:", self, 2);

}

- (unint64_t)_sliderFontStyle
{
  void *v2;
  unint64_t v3;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sfCameraFontSupported");

  return v3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_scrubberGradientEdgeInsets
{
  double v2;
  double v3;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v2 = 20.0;
  v3 = 20.0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setOrientation:(int64_t)a3
{
  -[CAMSpotlightControlPanel setOrientation:animated:](self, "setOrientation:animated:", a3, 0);
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;

  if (self->_orientation != a3)
  {
    v4 = a4;
    self->_orientation = a3;
    -[CAMSpotlightControlPanel _updateTextOrientation](self, "_updateTextOrientation");
    -[CAMSpotlightControlPanel setNeedsLayout](self, "setNeedsLayout");
    -[CAMSpotlightControlPanel _controlIconView](self, "_controlIconView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    +[CAMView rotateView:toInterfaceOrientation:animated:](CAMView, "rotateView:toInterfaceOrientation:animated:", v7, a3, v4);

  }
}

- (void)_updateTextOrientation
{
  int64_t v3;
  uint64_t v4;

  v3 = -[CAMSpotlightControlPanel orientation](self, "orientation");
  switch(v3)
  {
    case 1:
      v4 = 0;
      break;
    case 3:
      v4 = 2;
      break;
    case 4:
      v4 = 1;
      break;
    default:
      return;
  }
  -[CAMSpotlightControlPanel _applyTextOrientation:](self, "_applyTextOrientation:", v4);
}

- (void)_applyTextOrientation:(int64_t)a3
{
  void *v5;
  id v6;

  -[CAMSpotlightControlPanel apertureSlider](self, "apertureSlider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextOrientation:", a3);

  -[CAMSpotlightControlPanel exposureSlider](self, "exposureSlider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextOrientation:", a3);

}

- (int64_t)orientation
{
  return self->_orientation;
}

- (int64_t)spotlightControl
{
  return self->_spotlightControl;
}

- (CAMSpotlightControlPanelDelegate)delegate
{
  return (CAMSpotlightControlPanelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CAMExposureSlider)exposureSlider
{
  return self->_exposureSlider;
}

- (CEKApertureSlider)apertureSlider
{
  return self->_apertureSlider;
}

- (UIButton)_controlIconView
{
  return self->__controlIconView;
}

- (NSMutableDictionary)_openByControl
{
  return self->__openByControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__openByControl, 0);
  objc_storeStrong((id *)&self->__controlIconView, 0);
  objc_storeStrong((id *)&self->_apertureSlider, 0);
  objc_storeStrong((id *)&self->_exposureSlider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
