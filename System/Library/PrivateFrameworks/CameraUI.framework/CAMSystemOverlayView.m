@implementation CAMSystemOverlayView

- (CAMSystemOverlayView)initWithFrame:(CGRect)a3
{
  CAMSystemOverlayView *v3;
  CAMSystemOverlayView *v4;
  void *v5;
  CAMSystemOverlayVisibility *v6;
  id *p_menuVisibility;
  CAMSystemOverlayVisibility *menuVisibility;
  CFIndex AppIntegerValue;
  double v10;
  uint64_t v11;
  CAMOverlaySliderState *sliderState;
  void *v13;
  id v14;
  void *v15;
  UIView *v16;
  UIView *tipAnchor;
  CAMScreenLuminanceObserverLayer *v18;
  CAMScreenLuminanceObserverLayer *screenLuminanceObserverLayer;
  void *v20;
  _QWORD v22[4];
  id v23;
  id location;
  objc_super v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)CAMSystemOverlayView;
  v3 = -[CAMSystemOverlayView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CAMSystemOverlayView traitOverrides](v3, "traitOverrides");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUserInterfaceStyle:", 2);

    v4->_orientation = 1;
    v4->_sliderContent = 0;
    v4->_alignment = 1;
    v6 = objc_alloc_init(CAMSystemOverlayVisibility);
    p_menuVisibility = (id *)&v4->__menuVisibility;
    menuVisibility = v4->__menuVisibility;
    v4->__menuVisibility = v6;

    -[CAMSystemOverlayVisibility setDelegate:](v4->__menuVisibility, "setDelegate:", v4);
    AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("systemOverlay.menuHidingDelayMilliseconds"), CFSTR("com.apple.camera"), 0);
    v10 = (double)AppIntegerValue / 1000.0;
    if (AppIntegerValue <= 0)
      v10 = 4.0;
    objc_msgSend(*p_menuVisibility, "setDelayedHideDuration:", v10);
    objc_msgSend(*p_menuVisibility, "setName:", CFSTR("MenuVisibility"));
    +[CAMOverlaySliderState hiddenState](CAMOverlaySliderState, "hiddenState");
    v11 = objc_claimAutoreleasedReturnValue();
    sliderState = v4->_sliderState;
    v4->_sliderState = (CAMOverlaySliderState *)v11;

    v26[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)-[CAMSystemOverlayView registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v13, sel__updateValueLabelFont);

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", v4, sel__handlePan_);
    objc_msgSend(v15, "_wantsGESEvents:", 1);
    -[CAMSystemOverlayView addGestureRecognizer:](v4, "addGestureRecognizer:", v15);
    -[CAMSystemOverlayView _setPanGestureRecognizer:](v4, "_setPanGestureRecognizer:", v15);
    v4->__dropletScale = 1.0;
    v4->_halfPressEnabled = 1;
    v16 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    tipAnchor = v4->_tipAnchor;
    v4->_tipAnchor = v16;

    -[CAMSystemOverlayView addSubview:](v4, "addSubview:", v4->_tipAnchor);
    v18 = objc_alloc_init(CAMScreenLuminanceObserverLayer);
    screenLuminanceObserverLayer = v4->__screenLuminanceObserverLayer;
    v4->__screenLuminanceObserverLayer = v18;

    -[CAMSystemOverlayView layer](v4, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSublayer:", v4->__screenLuminanceObserverLayer);

    objc_initWeak(&location, v4);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __38__CAMSystemOverlayView_initWithFrame___block_invoke;
    v22[3] = &unk_1EA32B2C8;
    objc_copyWeak(&v23, &location);
    -[CAMScreenLuminanceObserverLayer setGainModulationCallback:](v4->__screenLuminanceObserverLayer, "setGainModulationCallback:", v22);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
  return v4;
}

void __38__CAMSystemOverlayView_initWithFrame___block_invoke(uint64_t a1, double a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "sliderIfLoaded");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAMSystemOverlayView _applyGainModulationToElement:withInputAmount:](CAMSystemOverlayView, "_applyGainModulationToElement:withInputAmount:", v4, v3);

    objc_msgSend(WeakRetained, "menu");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAMSystemOverlayView _applyGainModulationToElement:withInputAmount:](CAMSystemOverlayView, "_applyGainModulationToElement:withInputAmount:", v5, v3);

    objc_msgSend(WeakRetained, "_handleBarView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAMSystemOverlayView _applyGainModulationToElement:withInputAmount:](CAMSystemOverlayView, "_applyGainModulationToElement:withInputAmount:", v6, v3);

    objc_msgSend(WeakRetained, "_valueLabelContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAMSystemOverlayView _applyGainModulationToElement:withInputAmount:](CAMSystemOverlayView, "_applyGainModulationToElement:withInputAmount:", v7, v3);

  }
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
  void *v12;
  uint64_t v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  double v19;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double MaxX;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  int64_t v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  double v43;
  unint64_t v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  uint64_t v63;
  id v64;
  id v65;
  void *v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  unsigned int v72;
  CGFloat v73;
  double v74;
  CGFloat v75;
  double v76;
  CGFloat v77;
  double v78;
  void *v79;
  CGFloat v80;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  void *v84;
  void *v85;
  _QWORD v86[5];
  _QWORD v87[4];
  id v88;
  id v89;
  CGFloat v90;
  CGFloat v91;
  CGFloat v92;
  CGFloat v93;
  BOOL v94;
  CGAffineTransform v95;
  CGAffineTransform v96;
  CGAffineTransform v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;

  -[CAMSystemOverlayView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMSystemOverlayView _backgroundContext](self, "_backgroundContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[CAMSystemOverlayView traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayScale");

  v13 = -[CAMSystemOverlayView orientation](self, "orientation");
  v14 = -[CAMSystemOverlayView isSliderVisible](self, "isSliderVisible");
  -[CAMSystemOverlayView sliderIfLoaded](self, "sliderIfLoaded");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSystemOverlayView menu](self, "menu");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSystemOverlayView _handleBarView](self, "_handleBarView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[CAMSystemOverlayView sliderContent](self, "sliderContent");
  -[CAMSystemOverlayView _frameForSliderVisible:content:scale:](self, "_frameForSliderVisible:content:scale:", v14, 0, 1.0);
  v19 = 0.0;
  v99 = CGRectInset(v98, 0.0, -16.0);
  x = v99.origin.x;
  y = v99.origin.y;
  width = v99.size.width;
  height = v99.size.height;
  if (v18)
    v19 = 20.0;
  v24 = v19 + CGRectGetMaxX(v99);
  v100.origin.x = x;
  v77 = y;
  v100.origin.y = y;
  v100.size.width = width;
  v100.size.height = height;
  objc_msgSend(v15, "setCenter:", v24, CGRectGetMidY(v100));
  v73 = width;
  v75 = height;
  CEKRectWithSize();
  objc_msgSend(v15, "setBounds:");
  -[CAMSystemOverlayView _frameForSliderVisible:content:scale:](self, "_frameForSliderVisible:content:scale:", v14, 1, 1.0);
  v102 = CGRectInset(v101, 0.0, -16.0);
  v25 = v102.origin.x;
  v26 = v102.origin.y;
  v27 = v102.size.width;
  v28 = v102.size.height;
  MaxX = CGRectGetMaxX(v102);
  v103.origin.x = v25;
  v103.origin.y = v26;
  v103.size.width = v27;
  v103.size.height = v28;
  objc_msgSend(v16, "setCenter:", MaxX, CGRectGetMidY(v103));
  CEKRectWithSize();
  objc_msgSend(v16, "setBounds:");
  -[CAMSystemOverlayView _valueLabel](self, "_valueLabel");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSystemOverlayView _valueTextSize](self, "_valueTextSize");
  CEKRectWithSize();
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  memset(&v97, 0, sizeof(v97));
  CAMOrientationTransform(v13, (uint64_t)&v97);
  v96 = v97;
  v104.origin.x = v31;
  v81 = v35;
  v82 = v33;
  v104.origin.y = v33;
  v104.size.width = v35;
  v80 = v37;
  v104.size.height = v37;
  CGRectApplyAffineTransform(v104, &v96);
  v38 = -[CAMSystemOverlayView sliderContent](self, "sliderContent");
  -[CAMSystemOverlayView _dropletScale](self, "_dropletScale");
  -[CAMSystemOverlayView _frameForSliderVisible:content:scale:](self, "_frameForSliderVisible:content:scale:", v14, v38);
  v39 = v105.origin.x;
  v40 = v105.origin.y;
  v41 = v105.size.width;
  v42 = v105.size.height;
  CGRectGetMidY(v105);
  v106.origin.x = v39;
  v106.origin.y = v40;
  v106.size.width = v41;
  v106.size.height = v42;
  v83 = v31;
  CGRectGetMidY(v106);
  if (v14 && -[CAMSystemOverlayView isHandleBarVisible](self, "isHandleBarVisible"))
    v43 = 0.5;
  else
    v43 = 0.0;
  v78 = v43;
  v44 = -[CAMSystemOverlayView alignment](self, "alignment", *(_QWORD *)&v73, *(_QWORD *)&v75);
  if (v44 == 1)
  {
    if (v14)
    {
      v109.origin.x = v39;
      v109.origin.y = v40;
      v109.size.width = v41;
      v109.size.height = v42;
      CGRectGetMinX(v109);
    }
    v110.origin.x = v39;
    v110.origin.y = v40;
    v110.size.width = v41;
    v110.size.height = v42;
    CGRectGetMinX(v110);
  }
  else if (!v44)
  {
    if (v14)
    {
      v107.origin.x = v39;
      v107.origin.y = v40;
      v107.size.width = v41;
      v107.size.height = v42;
      CGRectGetMaxX(v107);
    }
    v108.origin.x = v39;
    v108.origin.y = v40;
    v108.size.width = v41;
    v108.size.height = v42;
    CGRectGetMaxX(v108);
  }
  -[CAMSystemOverlayView _valueLabelContainer](self, "_valueLabelContainer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  objc_msgSend(v45, "setCenter:");
  v95 = v97;
  objc_msgSend(v45, "setTransform:", &v95);
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  objc_msgSend(v17, "setCenter:");
  objc_msgSend(v17, "setBounds:", 0.0, 0.0, 3.0, 53.0);
  objc_msgSend(v17, "layer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setCornerRadius:", 1.5);

  -[CAMSystemOverlayView _frameForSliderVisible:content:scale:](self, "_frameForSliderVisible:content:scale:", 1, -[CAMSystemOverlayView sliderContent](self, "sliderContent"), 1.0);
  UIRectInsetEdges();
  v48 = v47;
  v50 = v49;
  v52 = v51;
  v54 = v53;
  -[CAMSystemOverlayView _hitTestingBackground](self, "_hitTestingBackground");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setFrame:", v48, v50, v52, v54);

  v84 = v16;
  v85 = v17;
  v56 = v15;
  if (v14)
  {
    objc_msgSend(v45, "frame");
    v57 = CGRectGetMinX(v111) + -20.0;
    v58 = v77;
    v59 = v76;
    v60 = v8 - v74;
  }
  else
  {
    v57 = *MEMORY[0x1E0C9D648];
    v58 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v60 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v59 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[CAMSystemOverlayView _screenLuminanceObserverLayer](self, "_screenLuminanceObserverLayer");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setFrame:", v57, v58, v60, v59);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  v62 = (void *)MEMORY[0x1E0DC3F10];
  v63 = MEMORY[0x1E0C809B0];
  v87[0] = MEMORY[0x1E0C809B0];
  v87[1] = 3221225472;
  v87[2] = __38__CAMSystemOverlayView_layoutSubviews__block_invoke;
  v87[3] = &unk_1EA32B2F0;
  v90 = v83;
  v91 = v82;
  v92 = v81;
  v93 = v80;
  v88 = v45;
  v64 = v79;
  v89 = v64;
  v94 = v13 == 1;
  v65 = v45;
  objc_msgSend(v62, "performWithoutAnimation:", v87);
  if (v13 == 1)
  {
    UIRectGetCenter();
    objc_msgSend(v64, "setCenter:");
  }
  -[CAMSystemOverlayView tipAnchor](self, "tipAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSystemOverlayView _frameForSliderVisible:content:scale:](self, "_frameForSliderVisible:content:scale:", 0, 0, 1.0);
  v67 = v112.origin.x;
  v68 = v112.origin.y;
  v69 = v112.size.width;
  v70 = v112.size.height;
  v71 = CGRectGetMaxX(v112) + -10.0;
  v113.origin.x = v67;
  v113.origin.y = v68;
  v113.size.width = v69;
  v113.size.height = v70;
  objc_msgSend(v66, "setCenter:", v71, CGRectGetMidY(v113));
  CEKRectWithSize();
  objc_msgSend(v66, "setBounds:");
  if (v18)
    v72 = 0;
  else
    v72 = v14;
  if (!v18)
    LODWORD(v14) = 0;
  objc_msgSend(v56, "setAlpha:", (double)v72);
  objc_msgSend(v84, "setAlpha:", (double)v14);
  objc_msgSend(v85, "setAlpha:", v78);
  v86[0] = v63;
  v86[1] = 3221225472;
  v86[2] = __38__CAMSystemOverlayView_layoutSubviews__block_invoke_2;
  v86[3] = &unk_1EA328868;
  v86[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v86);

}

uint64_t __38__CAMSystemOverlayView_layoutSubviews__block_invoke(uint64_t a1)
{
  double x;
  double y;
  double width;
  double height;
  uint64_t result;
  CGRect v7;

  v7 = CGRectInset(*(CGRect *)(a1 + 48), -5.0, 0.0);
  x = v7.origin.x;
  y = v7.origin.y;
  width = v7.size.width;
  height = v7.size.height;
  objc_msgSend(*(id *)(a1 + 32), "setBounds:");
  result = objc_msgSend(*(id *)(a1 + 40), "setBounds:", x, y, width, height);
  if (!*(_BYTE *)(a1 + 80))
  {
    UIRectGetCenter();
    return objc_msgSend(*(id *)(a1 + 40), "setCenter:");
  }
  return result;
}

uint64_t __38__CAMSystemOverlayView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateValueLabelVisibility");
}

- (void)_updateValueLabelVisibility
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int64_t v12;
  double v13;
  double v14;
  int v15;
  CGAffineTransform v16;
  CGAffineTransform v17;

  -[CAMSystemOverlayView _valueLabel](self, "_valueLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSystemOverlayView sliderIfLoaded](self, "sliderIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "style");

  v6 = 1.0;
  if (v5 == 5)
  {
    if (-[CAMSystemOverlayView sliderContent](self, "sliderContent"))
      v6 = 1.0;
    else
      v6 = 0.0;
  }
  v7 = -[CAMSystemOverlayView isSliderVisible](self, "isSliderVisible");
  -[CAMSystemOverlayView _valueLabelPresentationProgress](self, "_valueLabelPresentationProgress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSystemOverlayView delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSystemOverlayView menu](self, "menu");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isControlEnabledAtIndex:", objc_msgSend(v10, "selectedControlIndex"));

  v12 = -[CAMSystemOverlayView sliderContent](self, "sliderContent");
  if (v8)
  {
    objc_msgSend(v8, "presentationValue");
    v14 = fmax(v13, 0.0);
  }
  else
  {
    v14 = (double)v7;
  }
  if (v12 == 1)
    v15 = v11;
  else
    v15 = 1;
  if (!v15)
    v6 = 0.6;
  CGAffineTransformMakeScale(&v17, v14, v14);
  v16 = v17;
  objc_msgSend(v3, "setTransform:", &v16);
  objc_msgSend(v3, "setAlpha:", v6 * v14);

}

- (CGRect)_frameForSliderVisible:(BOOL)a3 content:(int64_t)a4 scale:(double)a5
{
  _BOOL4 v6;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  unint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  CGAffineTransform v31;
  CGRect result;

  v6 = a3;
  if (a4 == 1)
  {
    v9 = 31.0;
    v8 = 220.0;
  }
  else
  {
    v8 = 0.0;
    v9 = 0.0;
    if (!a4)
    {
      -[CAMSystemOverlayView sliderIfLoaded](self, "sliderIfLoaded");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "style");

      v9 = 18.0;
      v8 = 180.0;
      if (v11 == 5)
      {
        if ((unint64_t)(-[CAMSystemOverlayView orientation](self, "orientation") - 1) >= 2)
          v9 = 22.0;
        else
          v9 = 29.0;
      }
    }
  }
  CGAffineTransformMakeScale(&v31, a5, a5);
  v30 = v8 * v31.c + v31.a * v9;
  CEKRectWithSize();
  -[CAMSystemOverlayView _frameForButton](self, "_frameForButton");
  -[CAMSystemOverlayView traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayScale");
  v29 = v13;
  UIRectCenteredYInRectScale();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = -[CAMSystemOverlayView alignment](self, "alignment", v29);
  if (v22 == 1)
  {
    -[CAMSystemOverlayView bounds](self, "bounds");
    v25 = 0.0;
    if (v6)
      v25 = v30;
    v23 = v24 - v25;
  }
  else
  {
    v23 = -v30;
    if (v6)
      v23 = 0.0;
    if (v22)
      v23 = v15;
  }
  v26 = v17;
  v27 = v19;
  v28 = v21;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v23;
  return result;
}

- (CGRect)_frameForButton
{
  void *v3;
  unint64_t v4;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect result;
  CGRect v28;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CAMSystemOverlayView alignment](self, "alignment");
  if (v4 == 1)
  {
    objc_msgSend(v3, "frameForPhysicalButton:", 6);
    goto LABEL_5;
  }
  height = 0.0;
  width = 0.0;
  y = 0.0;
  x = 0.0;
  if (!v4)
  {
    objc_msgSend(v3, "frameForPhysicalButton:", 1);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(v3, "frameForPhysicalButton:", 2);
    v28.origin.x = v17;
    v28.origin.y = v18;
    v28.size.width = v19;
    v28.size.height = v20;
    v25.origin.x = v10;
    v25.origin.y = v12;
    v25.size.width = v14;
    v25.size.height = v16;
    v26 = CGRectUnion(v25, v28);
LABEL_5:
    x = v26.origin.x;
    y = v26.origin.y;
    width = v26.size.width;
    height = v26.size.height;
  }

  v21 = x;
  v22 = y;
  v23 = width;
  v24 = height;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CAMSystemOverlayView *v5;
  CAMSystemOverlayView *v6;
  CAMSystemOverlayView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CAMSystemOverlayView;
  -[CAMSystemOverlayView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (CAMSystemOverlayView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v5 = 0;
  v7 = v5;

  return v7;
}

- (void)setAlignment:(unint64_t)a3
{
  void *v5;
  void *v6;

  if (self->_alignment != a3)
  {
    self->_alignment = a3;
    -[CAMSystemOverlayView sliderIfLoaded](self, "sliderIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlignment:", a3);

    -[CAMSystemOverlayView menu](self, "menu");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlignment:", a3);

    -[CAMSystemOverlayView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)isSliderVisible
{
  void *v2;
  char v3;

  -[CAMSystemOverlayView sliderState](self, "sliderState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_presented");

  return v3;
}

- (BOOL)isSliderPresented
{
  return self->_sliderPresented && -[CAMSystemOverlayView isSliderVisible](self, "isSliderVisible");
}

- (void)setSliderState:(id)a3
{
  -[CAMSystemOverlayView setSliderState:animated:](self, "setSliderState:animated:", a3, 0);
}

- (void)setSliderState:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  CAMOverlaySliderState *sliderState;
  CAMOverlaySliderState *v8;
  CAMOverlaySliderState *v9;
  CAMOverlaySliderState *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a4;
  v15 = a3;
  if ((objc_msgSend(v15, "isEqualToState:", self->_sliderState) & 1) == 0)
  {
    -[CAMSystemOverlayView _createSliderIfNeeded](self, "_createSliderIfNeeded");
    if (objc_msgSend(v15, "_presented")
      && !-[CAMOverlaySliderState _presented](self->_sliderState, "_presented"))
    {
      -[CAMSystemOverlayView _createValueLabelIfNeeded](self, "_createValueLabelIfNeeded");
      -[CAMSystemOverlayView _updateValueLabelText](self, "_updateValueLabelText");
      -[CAMSystemOverlayView _createHandleBarViewIfNeeded](self, "_createHandleBarViewIfNeeded");
      -[CAMSystemOverlayView _menuVisibility](self, "_menuVisibility");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "hideImmediately");

      -[CAMSystemOverlayView _setSliderContent:](self, "_setSliderContent:", 0);
    }
    if (v4)
    {
      -[CAMSystemOverlayView layoutIfNeeded](self, "layoutIfNeeded");
      -[CAMSystemOverlayView _resetDropletBackgroundIfNeededFromState:toState:](self, "_resetDropletBackgroundIfNeededFromState:toState:", self->_sliderState, v15);
    }
    sliderState = self->_sliderState;
    v8 = (CAMOverlaySliderState *)v15;
    v9 = self->_sliderState;
    self->_sliderState = v8;
    v10 = sliderState;

    -[CAMSystemOverlayView setNeedsLayout](self, "setNeedsLayout");
    -[CAMSystemOverlayView _setSliderPresented:](self, "_setSliderPresented:", -[CAMOverlaySliderState _presented](v8, "_presented") & !v4);
    -[CAMSystemOverlayView _sliderPresentationProgress](self, "_sliderPresentationProgress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidate");

    -[CAMSystemOverlayView _setSliderPresentationProgress:](self, "_setSliderPresentationProgress:", 0);
    v12 = -[CAMSystemOverlayView isSliderVisible](self, "isSliderVisible");
    -[CAMSystemOverlayView _hitTestingBackground](self, "_hitTestingBackground");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHitTestsAsOpaque:", v12);

    -[CAMSystemOverlayView _updateDropletBackgroundFromState:toState:animated:interactive:](self, "_updateDropletBackgroundFromState:toState:animated:interactive:", v10, v8, v4, 0);
    LOBYTE(v8) = -[CAMOverlaySliderState _presented](v8, "_presented");

    if ((v8 & 1) == 0)
      -[CAMSystemOverlayView setHandleBarVisible:animated:](self, "setHandleBarVisible:animated:", 0, v4);
    -[CAMSystemOverlayView _updateScaleForSliderContent:withMode:sliderContentDidChange:updateDropletScale:](self, "_updateScaleForSliderContent:withMode:sliderContentDidChange:updateDropletScale:", 0, 3, 0, 0);
  }

}

- (void)performMenuPresentation:(unint64_t)a3
{
  void *v4;
  id v5;

  if (a3 == 2)
  {
    -[CAMSystemOverlayView _menuVisibility](self, "_menuVisibility");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hideImmediately");

    -[CAMSystemOverlayView _setSliderContent:animated:](self, "_setSliderContent:animated:", 0, 1);
  }
  else
  {
    if (a3 == 1)
    {
      -[CAMSystemOverlayView _menuVisibility](self, "_menuVisibility");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addReason:", 0);
    }
    else
    {
      if (a3)
        return;
      -[CAMSystemOverlayView _menuVisibility](self, "_menuVisibility");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeReason:", 0);
    }

  }
}

- (void)_setSliderContent:(int64_t)a3
{
  -[CAMSystemOverlayView _setSliderContent:animated:](self, "_setSliderContent:animated:", a3, 0);
}

- (void)_setSliderContent:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  if (self->_sliderContent != a3)
  {
    v4 = a4;
    if (a3 == 1)
    {
      -[CAMSystemOverlayView _createMenuIfNeeded](self, "_createMenuIfNeeded");
      -[CAMSystemOverlayView menu](self, "menu");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHighlightCurrentSelectedIndex:animated:", 0, 0);

    }
    -[CAMSystemOverlayView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "overlayView:menuWillChangePresented:", self, a3 == 1);

    if (a3)
      -[CAMSystemOverlayView setHandleBarVisible:animated:](self, "setHandleBarVisible:animated:", 0, v4);
    if (v4)
      -[CAMSystemOverlayView layoutIfNeeded](self, "layoutIfNeeded");
    self->_sliderContent = a3;
    -[CAMSystemOverlayView setNeedsLayout](self, "setNeedsLayout");
    v9 = 1;
    -[CAMSystemOverlayView _updateValueLabelTextWithForcedMeasurement:](self, "_updateValueLabelTextWithForcedMeasurement:", 1);
    -[CAMSystemOverlayView _updateValueLabelVisibility](self, "_updateValueLabelVisibility");
    -[CAMSystemOverlayView _touchingSliderGestureRecognizer](self, "_touchingSliderGestureRecognizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEnabled:", 0);

    -[CAMSystemOverlayView _touchingSliderGestureRecognizer](self, "_touchingSliderGestureRecognizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEnabled:", 1);

    if (a3)
    {
      if (a3 != 1)
      {
LABEL_13:
        -[CAMSystemOverlayView _setSliderPresented:](self, "_setSliderPresented:", -[CAMSystemOverlayView isSliderVisible](self, "isSliderVisible") & !v4);
        -[CAMSystemOverlayView _sliderPresentationProgress](self, "_sliderPresentationProgress");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "invalidate");

        -[CAMSystemOverlayView _setSliderPresentationProgress:](self, "_setSliderPresentationProgress:", 0);
        -[CAMSystemOverlayView sliderState](self, "sliderState");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMSystemOverlayView sliderState](self, "sliderState");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMSystemOverlayView _updateDropletBackgroundFromState:toState:animated:interactive:](self, "_updateDropletBackgroundFromState:toState:animated:interactive:", v14, v15, v4, 0);

        -[CAMSystemOverlayView delegate](self, "delegate");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "overlayView:menuDidChangePresented:", self, a3 == 1);

        return;
      }
      v9 = 0;
      v12 = 1;
    }
    else
    {
      v12 = 0;
    }
    -[CAMSystemOverlayView _updateScaleForSliderContent:withMode:sliderContentDidChange:updateDropletScale:](self, "_updateScaleForSliderContent:withMode:sliderContentDidChange:updateDropletScale:", 0, 3, 1, 0);
    -[CAMSystemOverlayView _updateScaleForSliderContent:withMode:sliderContentDidChange:updateDropletScale:](self, "_updateScaleForSliderContent:withMode:sliderContentDidChange:updateDropletScale:", 1, 3, 1, 0);
    -[CAMSystemOverlayView _sliderContent:blurred:](self, "_sliderContent:blurred:", 0, v12);
    -[CAMSystemOverlayView _sliderContent:blurred:](self, "_sliderContent:blurred:", 1, v9);
    goto LABEL_13;
  }
}

- (void)_createMenuIfNeeded
{
  _TtC8CameraUI17OverlayMenuSlider *v3;
  _TtC8CameraUI17OverlayMenuSlider *menu;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  if (!self->_menu)
  {
    v3 = objc_alloc_init(_TtC8CameraUI17OverlayMenuSlider);
    menu = self->_menu;
    self->_menu = v3;

    -[OverlayMenuSlider setOrientation:](self->_menu, "setOrientation:", -[CAMSystemOverlayView orientation](self, "orientation"));
    -[OverlayMenuSlider setDelegate:](self->_menu, "setDelegate:", self);
    -[OverlayMenuSlider setAlignment:](self->_menu, "setAlignment:", -[CAMSystemOverlayView alignment](self, "alignment"));
    -[CAMSystemOverlayView _blurFilter](self, "_blurFilter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v5;
    -[CAMSystemOverlayView _progressiveEdgeBlurFilter](self, "_progressiveEdgeBlurFilter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OverlayMenuSlider layer](self->_menu, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFilters:", v7);

    -[OverlayMenuSlider setAnchorPoint:](self->_menu, "setAnchorPoint:", 1.0, 0.5);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel__handleTouchingMenu_);
    objc_msgSend(v9, "_wantsGESEvents:", 1);
    objc_msgSend(v9, "setMinimumPressDuration:", 0.0);
    objc_msgSend(v9, "setDelegate:", self);
    -[OverlayMenuSlider addGestureRecognizer:](self->_menu, "addGestureRecognizer:", v9);
    -[CAMSystemOverlayView _dialEffectMesh](self, "_dialEffectMesh");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OverlayMenuSlider layer](self->_menu, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMeshTransform:", v10);

    -[CAMSystemOverlayView traitCollection](self, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayScale");
    v14 = v13;
    -[OverlayMenuSlider layer](self->_menu, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setRasterizationScale:", v14);

    -[OverlayMenuSlider layer](self->_menu, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAllowsGroupBlending:", 1);

    -[CAMSystemOverlayView addSubview:](self, "addSubview:", self->_menu);
  }
}

- (void)_createSliderIfNeeded
{
  id v3;
  CAMSystemOverlaySlider *v4;
  CAMSystemOverlaySlider *slider;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  DRPDropletContextView *v12;
  DRPDropletContextView *backgroundContext;
  void *v14;
  DRPDropletContainerView *v15;
  DRPDropletContainerView *backgroundDroplet;
  DRPDropletAnimationCoordinator *v17;
  DRPDropletAnimationCoordinator *backgroundAnimator;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  if (!self->_slider)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[CAMSystemOverlayView addSubview:](self, "addSubview:", v3);
    -[CAMSystemOverlayView _setHitTestingBackground:](self, "_setHitTestingBackground:", v3);
    v4 = objc_alloc_init(CAMSystemOverlaySlider);
    slider = self->_slider;
    self->_slider = v4;

    -[CAMSystemOverlaySlider setAlignment:](self->_slider, "setAlignment:", -[CAMSystemOverlayView alignment](self, "alignment"));
    -[CAMSystemOverlaySlider setDelegate:](self->_slider, "setDelegate:", self);
    -[CAMSystemOverlaySlider setFeedbackDisabled:](self->_slider, "setFeedbackDisabled:", self->_sliderFeedbackDisabled);
    -[CAMSystemOverlayView _blurFilter](self, "_blurFilter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v6;
    -[CAMSystemOverlayView _progressiveEdgeBlurFilter](self, "_progressiveEdgeBlurFilter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSystemOverlaySlider layer](self->_slider, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFilters:", v8);

    -[CAMSystemOverlaySlider setAnchorPoint:](self->_slider, "setAnchorPoint:", 1.0, 0.5);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel__handleTouchingSlider_);
    objc_msgSend(v10, "_wantsGESEvents:", 1);
    objc_msgSend(v10, "setMinimumPressDuration:", 0.0);
    objc_msgSend(v10, "setDelegate:", self);
    -[CAMSystemOverlaySlider addGestureRecognizer:](self->_slider, "addGestureRecognizer:", v10);
    -[CAMSystemOverlayView _setTouchingSliderGestureRecognizer:](self, "_setTouchingSliderGestureRecognizer:", v10);
    v11 = objc_alloc(MEMORY[0x1E0D1D8E8]);
    -[CAMSystemOverlayView bounds](self, "bounds");
    v12 = (DRPDropletContextView *)objc_msgSend(v11, "initWithFrame:");
    backgroundContext = self->__backgroundContext;
    self->__backgroundContext = v12;

    -[DRPDropletContextView layer](self->__backgroundContext, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAllowsHitTesting:", 0);

    -[CAMSystemOverlayView addSubview:](self, "addSubview:", self->__backgroundContext);
    -[DRPDropletContextView addContainerWithContentView:](self->__backgroundContext, "addContainerWithContentView:", 0);
    v15 = (DRPDropletContainerView *)objc_claimAutoreleasedReturnValue();
    backgroundDroplet = self->__backgroundDroplet;
    self->__backgroundDroplet = v15;

    v17 = (DRPDropletAnimationCoordinator *)objc_alloc_init(MEMORY[0x1E0D1D8E0]);
    backgroundAnimator = self->__backgroundAnimator;
    self->__backgroundAnimator = v17;

    self->__backgroundHintNeedsReset = 1;
    -[CAMSystemOverlayView addSubview:](self, "addSubview:", self->_slider);
    -[CAMSystemOverlayView _dialEffectMesh](self, "_dialEffectMesh");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSystemOverlaySlider layer](self->_slider, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setMeshTransform:", v19);

    -[CAMSystemOverlayView traitCollection](self, "traitCollection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "displayScale");
    v23 = v22;
    -[CAMSystemOverlaySlider layer](self->_slider, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setRasterizationScale:", v23);

    -[CAMSystemOverlaySlider layer](self->_slider, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAllowsGroupBlending:", 1);

    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleSliderTap_);
    objc_msgSend(v26, "setDelegate:", self);
    objc_msgSend(v26, "_wantsGESEvents:", 1);
    -[CAMSystemOverlayView _setTapGestureRecognizer:](self, "_setTapGestureRecognizer:", v26);
    -[CAMSystemOverlayView addGestureRecognizer:](self, "addGestureRecognizer:", v26);

  }
}

- (CAMSystemOverlaySlider)slider
{
  -[CAMSystemOverlayView _createSliderIfNeeded](self, "_createSliderIfNeeded");
  return self->_slider;
}

- (CAMSystemOverlaySlider)sliderIfLoaded
{
  return self->_slider;
}

- (void)setSliderFeedbackDisabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_sliderFeedbackDisabled != a3)
  {
    v3 = a3;
    self->_sliderFeedbackDisabled = a3;
    -[CAMSystemOverlayView sliderIfLoaded](self, "sliderIfLoaded");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFeedbackDisabled:", v3);

  }
}

- (void)setHandleBarVisible:(BOOL)a3
{
  -[CAMSystemOverlayView setHandleBarVisible:animated:](self, "setHandleBarVisible:animated:", a3, 0);
}

- (void)setHandleBarVisible:(BOOL)a3 animated:(BOOL)a4
{
  _QWORD v5[5];

  if (self->_handleBarVisible != a3)
  {
    self->_handleBarVisible = a3;
    if (a4)
    {
      -[CAMSystemOverlayView layoutIfNeeded](self, "layoutIfNeeded");
      -[CAMSystemOverlayView setNeedsLayout](self, "setNeedsLayout");
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __53__CAMSystemOverlayView_setHandleBarVisible_animated___block_invoke;
      v5[3] = &unk_1EA328868;
      v5[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v5, 0, 0.3, 0.0);
    }
    else
    {
      -[CAMSystemOverlayView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

uint64_t __53__CAMSystemOverlayView_setHandleBarVisible_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)updateUIForButtonStage:(unint64_t)a3
{
  void *v4;
  int v5;

  -[CAMSystemOverlayView _setButtonStage:](self, "_setButtonStage:", a3);
  -[CAMSystemOverlayView sliderState](self, "sliderState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_presented");

  if (v5)
    -[CAMSystemOverlayView _updateScaleForSliderContent:withMode:sliderContentDidChange:updateDropletScale:](self, "_updateScaleForSliderContent:withMode:sliderContentDidChange:updateDropletScale:", -[CAMSystemOverlayView sliderContent](self, "sliderContent"), 3, 0, 1);
}

- (void)_handleSliderTap:(id)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = -[CAMSystemOverlayView sliderContent](self, "sliderContent");
  if (v4 == 1)
  {
    -[CAMSystemOverlayView menu](self, "menu");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "locationInView:", self);
    v7 = objc_msgSend(v6, "indexOfImageClosestToPoint:in:", self);
    if (v7 == objc_msgSend(v6, "selectedControlIndex"))
    {
      -[CAMSystemOverlayView delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMSystemOverlayView menu](self, "menu");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isControlEnabledAtIndex:", objc_msgSend(v9, "selectedControlIndex"));

      if (v10)
      {
        -[CAMSystemOverlayView _menuVisibility](self, "_menuVisibility");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "hideImmediately");

        -[CAMSystemOverlayView _setSliderContent:animated:](self, "_setSliderContent:animated:", 0, 1);
      }
    }
    else
    {
      objc_msgSend(v6, "setSelectedControlIndex:animated:", v7, 1);
    }

  }
  else if (!v4 && -[CAMSystemOverlayView isSliderVisible](self, "isSliderVisible"))
  {
    -[CAMSystemOverlayView _menuVisibility](self, "_menuVisibility");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "showTransiently");

    -[CAMSystemOverlayView _setSliderContent:animated:](self, "_setSliderContent:animated:", 1, 1);
  }

}

- (void)_handleTouchingMenu:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = objc_msgSend(a3, "state");
  if ((unint64_t)(v4 - 3) >= 2)
  {
    if (v4 != 1)
      return;
    -[CAMSystemOverlayView _menuVisibility](self, "_menuVisibility");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addReason:", 1);
  }
  else
  {
    -[CAMSystemOverlayView _menuVisibility](self, "_menuVisibility");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeReason:", 1);
  }

}

- (void)_handleTouchingSlider:(id)a3
{
  if ((unint64_t)(objc_msgSend(a3, "state") - 3) <= 1)
    -[CAMSystemOverlayView _updateScaleForSliderContent:withMode:sliderContentDidChange:updateDropletScale:](self, "_updateScaleForSliderContent:withMode:sliderContentDidChange:updateDropletScale:", 0, 3, 0, 1);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;
  double v10;
  double v11;
  CGRect v13;

  v6 = a4;
  v7 = a3;
  -[CAMSystemOverlayView _tapGestureRecognizer](self, "_tapGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    objc_msgSend(v6, "locationInView:", self);
    v11 = v10;
    -[CAMSystemOverlayView bounds](self, "bounds");
    v9 = vabdd_f64(v11, CGRectGetMaxX(v13)) < 40.0;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)_handlePan:(id)a3
{
  double v4;
  double v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  CAMSystemOverlayView *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a3;
  objc_msgSend(v19, "translationInView:", self);
  v5 = v4;
  v6 = -[CAMSystemOverlayView sliderContent](self, "sliderContent");
  v7 = v6;
  if (v6 == 1)
  {
    -[CAMSystemOverlayView menu](self, "menu");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6)
      goto LABEL_6;
    -[CAMSystemOverlayView slider](self, "slider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_6:
  if (objc_msgSend(v19, "state") == 3)
  {
    -[CAMSystemOverlayView _updateScaleForSliderContent:withMode:sliderContentDidChange:updateDropletScale:](self, "_updateScaleForSliderContent:withMode:sliderContentDidChange:updateDropletScale:", -[CAMSystemOverlayView sliderContent](self, "sliderContent"), 3, 0, 1);
    if (v5 < 0.0)
      v9 = 10.0;
    else
      v9 = 3.0;
    -[CAMSystemOverlayView delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSystemOverlayView menu](self, "menu");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isControlEnabledAtIndex:", objc_msgSend(v11, "selectedControlIndex"));

    if (fabs(v5) > v9)
    {
      if (v7 == 1)
      {
        if (v5 >= 0.0)
          v14 = v12;
        else
          v14 = 0;
        if (v14 == 1)
        {
          -[CAMSystemOverlayView _menuVisibility](self, "_menuVisibility");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "hideImmediately");

          v16 = self;
          v17 = 0;
          goto LABEL_23;
        }
      }
      else if (!v7)
      {
        if (v5 >= 0.0)
        {
          -[CAMSystemOverlayView delegate](self, "delegate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "overlayView:performedDismissGesture:", self, v19);

          goto LABEL_24;
        }
        -[CAMSystemOverlayView _menuVisibility](self, "_menuVisibility");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "showTransiently");

        v16 = self;
        v17 = 1;
LABEL_23:
        -[CAMSystemOverlayView _setSliderContent:animated:](v16, "_setSliderContent:animated:", v17, 1);
      }
    }
  }
  else if (objc_msgSend(v19, "state") == 2)
  {
    -[CAMSystemOverlayView _updateScaleForSliderContent:withMode:sliderContentDidChange:updateDropletScale:](self, "_updateScaleForSliderContent:withMode:sliderContentDidChange:updateDropletScale:", -[CAMSystemOverlayView sliderContent](self, "sliderContent"), 5, 0, 1);
  }
LABEL_24:

}

- (CEKFluidBehaviorSettings)_scaleSettings
{
  CEKFluidBehaviorSettings *scaleSettings;
  CEKFluidBehaviorSettings *v4;
  CEKFluidBehaviorSettings *v5;

  scaleSettings = self->__scaleSettings;
  if (!scaleSettings)
  {
    v4 = (CEKFluidBehaviorSettings *)objc_alloc_init(MEMORY[0x1E0D0D060]);
    v5 = self->__scaleSettings;
    self->__scaleSettings = v4;

    -[CEKFluidBehaviorSettings setDefaultValues](self->__scaleSettings, "setDefaultValues");
    -[CEKFluidBehaviorSettings setDampingRatio:](self->__scaleSettings, "setDampingRatio:", 1.0);
    -[CEKFluidBehaviorSettings setResponse:](self->__scaleSettings, "setResponse:", 0.4);
    scaleSettings = self->__scaleSettings;
  }
  return scaleSettings;
}

- (void)_sliderContent:(int64_t)a3 blurred:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a4;
  if (a3 == 1)
  {
    -[CAMSystemOverlayView menu](self, "menu");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v6 = 0;
  }
  else
  {
    -[CAMSystemOverlayView slider](self, "slider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = v6;
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = !v4;
  if (v4)
    v9 = &unk_1EA3B1870;
  else
    v9 = &unk_1EA3B1880;
  if (v8)
    v10 = &unk_1EA3B1870;
  else
    v10 = &unk_1EA3B1880;
  -[CAMSystemOverlayView _springAnimationWithKeyPath:](self, "_springAnimationWithKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFromValue:", v10);
  objc_msgSend(v11, "setToValue:", v9);
  objc_msgSend(v11, "setDuration:", 0.3);
  objc_msgSend(v7, "addAnimation:forKey:", v11, CFSTR("blurRadiusAnimation"));
  objc_msgSend(v13, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:forKeyPath:", v9, CFSTR("filters.gaussianBlur.inputRadius"));

}

- (id)_springAnimationWithKeyPath:(id)a3
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMass:", 2.0);
  objc_msgSend(v3, "setStiffness:", 300.0);
  objc_msgSend(v3, "setDamping:", 50.0);
  return v3;
}

- (void)_updateScaleForSliderContent:(int64_t)a3 withMode:(int64_t)a4 sliderContentDidChange:(BOOL)a5 updateDropletScale:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  void *v11;
  int v12;
  unint64_t v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  long double v20;
  double v21;
  double v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  _QWORD v30[4];
  id v31;
  double v32;

  v6 = a6;
  v7 = a5;
  -[CAMSystemOverlayView sliderState](self, "sliderState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "_presented");

  if (v12)
  {
    v13 = -[CAMSystemOverlayView _buttonStage](self, "_buttonStage");
    if (v13 == 4)
    {
      v14 = 1.2;
    }
    else
    {
      v14 = 1.0;
      if ((v13 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        if (-[CAMSystemOverlayView halfPressEnabled](self, "halfPressEnabled"))
          v14 = 1.1;
        else
          v14 = 1.0;
      }
    }
    -[CAMSystemOverlayView _touchingSliderGestureRecognizer](self, "_touchingSliderGestureRecognizer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "state");

    if ((unint64_t)(v16 - 1) < 2)
      v14 = 1.25;
    -[CAMSystemOverlayView _panGestureRecognizer](self, "_panGestureRecognizer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "state") == 2)
    {
      objc_msgSend(v17, "translationInView:", self);
      v19 = v18;
      v20 = log(fabs(v18) / 100.0 + 1.0);
      v21 = v20 / (v20 + 1.0);
      v22 = 0.2;
      if (v19 >= 0.0)
        v22 = -0.5;
      v14 = v22 * v21 + 1.0;
    }
    if (v7 && -[CAMSystemOverlayView sliderContent](self, "sliderContent") != a3)
    {
      if (a3 == 1)
      {
        v14 = 0.4;
      }
      else if (!a3)
      {
        v14 = 1.5;
      }
    }

  }
  else
  {
    v14 = 0.2;
  }
  v23 = a4 - 3;
  if (v6)
    -[CAMSystemOverlayView _setDropletScale:animated:interactive:](self, "_setDropletScale:animated:interactive:", v23 < 3, a4 == 5, v14);
  if (a3 == 1)
  {
    -[CAMSystemOverlayView menu](self, "menu");
    v24 = objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  if (!a3)
  {
    -[CAMSystemOverlayView slider](self, "slider");
    v24 = objc_claimAutoreleasedReturnValue();
LABEL_28:
    v25 = (void *)v24;
    goto LABEL_30;
  }
  v25 = 0;
LABEL_30:
  if (v23 > 2)
  {
    CGAffineTransformMakeScale(&v29, v14, v14);
    v28 = v29;
    objc_msgSend(v25, "setTransform:", &v28);
  }
  else
  {
    v26 = (void *)MEMORY[0x1E0DC3F10];
    -[CAMSystemOverlayView _scaleSettings](self, "_scaleSettings");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __104__CAMSystemOverlayView__updateScaleForSliderContent_withMode_sliderContentDidChange_updateDropletScale___block_invoke;
    v30[3] = &unk_1EA328B18;
    v31 = v25;
    v32 = v14;
    objc_msgSend(v26, "cek_animateWithSettings:mode:animations:completion:", v27, a4, v30, 0);

  }
}

uint64_t __104__CAMSystemOverlayView__updateScaleForSliderContent_withMode_sliderContentDidChange_updateDropletScale___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

- (void)_setDropletScale:(double)a3
{
  -[CAMSystemOverlayView _setDropletScale:animated:interactive:](self, "_setDropletScale:animated:interactive:", 0, 0, a3);
}

- (void)_setDropletScale:(double)a3 animated:(BOOL)a4 interactive:(BOOL)a5
{
  _BOOL8 v6;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];

  if (self->__dropletScale != a3)
  {
    v6 = a5;
    if (a4)
    {
      -[CAMSystemOverlayView layoutIfNeeded](self, "layoutIfNeeded");
      self->__dropletScale = a3;
      -[CAMSystemOverlayView sliderState](self, "sliderState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMSystemOverlayView sliderState](self, "sliderState");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMSystemOverlayView _updateDropletBackgroundFromState:toState:animated:interactive:](self, "_updateDropletBackgroundFromState:toState:animated:interactive:", v8, v9, 1, v6);

      -[CAMSystemOverlayView setNeedsLayout](self, "setNeedsLayout");
      if (v6)
        v10 = 5;
      else
        v10 = 3;
      v11 = (void *)MEMORY[0x1E0DC3F10];
      -[CAMSystemOverlayView _scaleSettings](self, "_scaleSettings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __62__CAMSystemOverlayView__setDropletScale_animated_interactive___block_invoke;
      v15[3] = &unk_1EA328868;
      v15[4] = self;
      objc_msgSend(v11, "cek_animateWithSettings:mode:animations:completion:", v12, v10, v15, 0);

    }
    else
    {
      self->__dropletScale = a3;
      -[CAMSystemOverlayView sliderState](self, "sliderState");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMSystemOverlayView sliderState](self, "sliderState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMSystemOverlayView _updateDropletBackgroundFromState:toState:animated:interactive:](self, "_updateDropletBackgroundFromState:toState:animated:interactive:", v13, v14, 0, v6);

      -[CAMSystemOverlayView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

uint64_t __62__CAMSystemOverlayView__setDropletScale_animated_interactive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)reloadValueLabel
{
  -[CAMSystemOverlayView _updateValueLabelText](self, "_updateValueLabelText");
  -[CAMSystemOverlayView _updateValueLabelVisibility](self, "_updateValueLabelVisibility");
}

- (void)_createValueLabelIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  -[CAMSystemOverlayView _valueLabel](self, "_valueLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextColor:", v4);

    objc_msgSend(v13, "setTextAlignment:", 1);
    objc_msgSend(v13, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = 1045220557;
    objc_msgSend(v5, "setShadowOpacity:", v6);

    objc_msgSend(v13, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShadowRadius:", 15.0);

    v8 = *MEMORY[0x1E0C9D820];
    v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    objc_msgSend(v13, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShadowOffset:", v8, v9);

    objc_msgSend(v13, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShadowPathIsBounds:", 1);

    v12 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v12, "addSubview:", v13);
    -[CAMSystemOverlayView addSubview:](self, "addSubview:", v12);
    -[CAMSystemOverlayView _setValueLabelContainer:](self, "_setValueLabelContainer:", v12);
    -[CAMSystemOverlayView _setValueLabel:](self, "_setValueLabel:", v13);
    -[CAMSystemOverlayView _updateValueLabelFont](self, "_updateValueLabelFont");

  }
}

- (void)_updateValueLabelLayoutMetrics
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v11;

  -[CAMSystemOverlayView _valueLabel](self, "_valueLabel");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "intrinsicContentSize");
  -[CAMSystemOverlayView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  UISizeCeilToScale();
  v5 = v4;
  v7 = v6;

  -[CAMSystemOverlayView _valueTextSize](self, "_valueTextSize");
  if (v5 != v9 || v7 != v8)
  {
    -[CAMSystemOverlayView _setValueTextSize:](self, "_setValueTextSize:", v5, v7);
    -[CAMSystemOverlayView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_updateValueLabelFont
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  -[CAMSystemOverlayView _valueLabel](self, "_valueLabel");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMSystemOverlayView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[CAMZoomButton fontSizeForContentSize:](CAMZoomButton, "fontSizeForContentSize:", v4);
  v6 = v5;
  objc_msgSend(v11, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pointSize");
  v9 = v8;

  if (v6 != v9)
  {
    +[CAMFont cameraMonospacedFontOfSize:weight:](CAMFont, "cameraMonospacedFontOfSize:weight:", v6, *MEMORY[0x1E0DC1448]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v10);

    -[CAMSystemOverlayView _updateValueLabelLayoutMetrics](self, "_updateValueLabelLayoutMetrics");
  }

}

- (void)_updateValueLabelText
{
  -[CAMSystemOverlayView _updateValueLabelTextWithForcedMeasurement:](self, "_updateValueLabelTextWithForcedMeasurement:", 0);
}

- (void)_updateValueLabelTextWithForcedMeasurement:(BOOL)a3
{
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v5 = -[CAMSystemOverlayView sliderContent](self, "sliderContent");
  if (v5)
  {
    if (v5 != 1)
    {
      v17 = 0;
      goto LABEL_7;
    }
    -[CAMSystemOverlayView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSystemOverlayView menu](self, "menu");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "menuTitleForControlAtIndex:", objc_msgSend(v7, "selectedControlIndex"));
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CAMSystemOverlayView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueTextForCurrentControl");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  -[CAMSystemOverlayView _valueLabel](self, "_valueLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v17);
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "componentsSeparatedByCharactersInSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsSeparatedByCharactersInSet:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (a3 || (v16 = objc_msgSend(v17, "length"), v16 != objc_msgSend(v9, "length")) || v12 != v15)
    -[CAMSystemOverlayView _updateValueLabelLayoutMetrics](self, "_updateValueLabelLayoutMetrics");

}

- (void)_createHandleBarViewIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  -[CAMSystemOverlayView _handleBarView](self, "_handleBarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

    -[CAMSystemOverlayView addSubview:](self, "addSubview:", v5);
    -[CAMSystemOverlayView _setHandleBarView:](self, "_setHandleBarView:", v5);

  }
}

- (double)_dropletCenterYFromState:(id)a3 toState:(id)a4
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v9;
  CGRect v11;
  CGRect v12;

  objc_msgSend(a4, "_effectiveNormalizedButtonOffsetFromState:", a3);
  -[CAMSystemOverlayView _frameForButton](self, "_frameForButton");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  CGRectGetMinY(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  CGRectGetMaxY(v12);
  CEKInterpolateClamped();
  return v9 + (double)arc4random_uniform(0x5F5E100u) / 100000000.0;
}

- (void)_resetDropletBackgroundIfNeededFromState:(id)a3 toState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  if (-[CAMSystemOverlayView _backgroundHintNeedsReset](self, "_backgroundHintNeedsReset"))
  {
    -[CAMSystemOverlayView _backgroundAnimator](self, "_backgroundAnimator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSystemOverlayView _backgroundDroplet](self, "_backgroundDroplet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSystemOverlayView _backgroundContext](self, "_backgroundContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSystemOverlayView bounds](self, "bounds");
    v11 = v10;
    v13 = v12;
    -[CAMSystemOverlayView _dropletCenterYFromState:toState:](self, "_dropletCenterYFromState:toState:", v18, v6);
    v15 = v14;
    if (-[CAMSystemOverlayView alignment](self, "alignment"))
      v16 = 8;
    else
      v16 = 2;
    objc_msgSend(MEMORY[0x1E0D1D8F0], "edgeHintWithCanvasSize:hintSize:edge:centerAlongEdge:progress:dropletRadius:", v16, v11, v13, 53.0, v15, 0.0, 25.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "applyViewConfiguration:animated:tracking:containerView:contextView:", v17, 0, 0, v8, v9);
    -[CAMSystemOverlayView _setBackgroundHintNeedsReset:](self, "_setBackgroundHintNeedsReset:", 0);

  }
}

- (void)_updateDropletBackgroundFromState:(id)a3 toState:(id)a4 animated:(BOOL)a5 interactive:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  int64_t v33;
  double v34;
  void *v35;
  unint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  _BOOL4 v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  id location[2];

  v47 = a6;
  v6 = a5;
  v9 = a3;
  v10 = a4;
  -[CAMSystemOverlayView _backgroundDroplet](self, "_backgroundDroplet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSystemOverlayView _backgroundContext](self, "_backgroundContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CAMSystemOverlayView sliderContent](self, "sliderContent");
  -[CAMSystemOverlayView _dropletScale](self, "_dropletScale");
  -[CAMSystemOverlayView _frameForSliderVisible:content:scale:](self, "_frameForSliderVisible:content:scale:", 1, v13);
  v15 = v14;
  v17 = v16;
  -[CAMSystemOverlayView _dropletCenterYFromState:toState:](self, "_dropletCenterYFromState:toState:", v9, v10);
  v19 = v18;
  -[CAMSystemOverlayView bounds](self, "bounds");
  v21 = v20;
  v23 = v22;
  if (-[CAMSystemOverlayView alignment](self, "alignment"))
    v24 = 8;
  else
    v24 = 2;
  objc_initWeak(location, self);
  v25 = objc_msgSend(v10, "_sliderMode");
  if (v25)
  {
    if (v25 == 1)
    {
      objc_msgSend(MEMORY[0x1E0D1D8F0], "edgeHintWithCanvasSize:hintSize:edge:centerAlongEdge:progress:dropletRadius:", v24, v21, v23, 53.0, v19, 100.0, 25.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
    if (v25 != 2)
    {
      v28 = 0;
      goto LABEL_34;
    }
    v26 = MEMORY[0x1E0C809B0];
    if (v47)
    {
      v27 = 0;
      objc_msgSend(MEMORY[0x1E0D1D8F0], "edgeContentPresentedWithCanvasSize:edge:lengthAlongEdge:protrusionFromEdge:centerAlongEdge:inflationProgress:dropletRadius:", v24, v21, v23, v17, v15, v19, 0.0, 12.0, 0);
    }
    else
    {
      v29 = (void *)MEMORY[0x1E0D0D068];
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __87__CAMSystemOverlayView__updateDropletBackgroundFromState_toState_animated_interactive___block_invoke_3;
      v52[3] = &unk_1EA329490;
      objc_copyWeak(&v53, location);
      objc_msgSend(v29, "animatablePropertyWithFunctionalCompletion:", v52);
      v46 = objc_claimAutoreleasedReturnValue();
      -[CAMSystemOverlayView _setSliderPresentationProgress:](self, "_setSliderPresentationProgress:");
      if ((objc_msgSend(v9, "_presented") & 1) != 0)
      {
        v27 = 0;
      }
      else
      {
        -[CAMSystemOverlayView _valueLabelPresentationProgress](self, "_valueLabelPresentationProgress");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v27)
        {
          -[CAMSystemOverlayView _createValueLabelProgressProperty](self, "_createValueLabelProgressProperty");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setValue:", -1.0);
          -[CAMSystemOverlayView _setValueLabelPresentationProgress:](self, "_setValueLabelPresentationProgress:", v27);
        }
      }
      objc_destroyWeak(&v53);
      v26 = MEMORY[0x1E0C809B0];
      objc_msgSend(MEMORY[0x1E0D1D8F0], "edgeContentPresentedWithCanvasSize:edge:lengthAlongEdge:protrusionFromEdge:centerAlongEdge:inflationProgress:dropletRadius:", v24, v21, v23, v17, v15, v19, 0.0, 12.0, v46);
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[CAMSystemOverlayView sliderContent](self, "sliderContent");
    if (v33)
    {
      if (v33 != 1)
      {
LABEL_32:
        v48[0] = v26;
        v48[1] = 3221225472;
        v48[2] = __87__CAMSystemOverlayView__updateDropletBackgroundFromState_toState_animated_interactive___block_invoke_4;
        v48[3] = &unk_1EA32B368;
        v31 = v45;
        v49 = v31;
        v32 = v27;
        v50 = v32;
        objc_copyWeak(&v51, location);
        objc_msgSend(v28, "addAlongsideAnimationBlockForKeyPath:animationBlock:", CFSTR("centerX"), v48);
        objc_destroyWeak(&v51);

LABEL_33:
        goto LABEL_34;
      }
      v34 = 13.0;
      objc_msgSend(v28, "setContainerCornerRadius:", 16.0);
LABEL_31:
      objc_msgSend(v28, "setDropletRadius:", v34);
      goto LABEL_32;
    }
    -[CAMSystemOverlayView sliderIfLoaded](self, "sliderIfLoaded");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "style") == 5)
    {
      v36 = -[CAMSystemOverlayView orientation](self, "orientation") - 1;

      v37 = v36 > 1;
      v26 = MEMORY[0x1E0C809B0];
      if (!v37)
      {
        v34 = 12.0;
        objc_msgSend(v28, "setContainerCornerRadius:", 12.0);
        goto LABEL_31;
      }
    }
    else
    {

    }
    v34 = 10.0;
    objc_msgSend(v28, "setContainerCornerRadius:", 10.0);
    goto LABEL_31;
  }
  if (objc_msgSend(v9, "_sliderMode") == 1)
  {
    objc_msgSend(MEMORY[0x1E0D1D8F0], "edgeHintWithCanvasSize:hintSize:edge:centerAlongEdge:progress:dropletRadius:", v24, v21, v23, 53.0, v19, 0.0, 25.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1D8F0], "edgeContentPresentedWithCanvasSize:edge:lengthAlongEdge:protrusionFromEdge:centerAlongEdge:inflationProgress:dropletRadius:", v24, v21, v23, 53.0, 0.0, v19, 0.0, 12.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __87__CAMSystemOverlayView__updateDropletBackgroundFromState_toState_animated_interactive___block_invoke;
    v56[3] = &unk_1EA32B318;
    objc_copyWeak(&v57, location);
    objc_msgSend(v28, "addAlongsideAnimationBlockForKeyPath:animationBlock:", CFSTR("centerX"), v56);
    objc_destroyWeak(&v57);
  }
  if (objc_msgSend(v9, "_presented"))
  {
    -[CAMSystemOverlayView _valueLabelPresentationProgress](self, "_valueLabelPresentationProgress");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v30)
    {
      -[CAMSystemOverlayView _createValueLabelProgressProperty](self, "_createValueLabelProgressProperty");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setValue:", 1.0);
      -[CAMSystemOverlayView _setValueLabelPresentationProgress:](self, "_setValueLabelPresentationProgress:", v30);
    }
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __87__CAMSystemOverlayView__updateDropletBackgroundFromState_toState_animated_interactive___block_invoke_2;
    v54[3] = &unk_1EA32B340;
    v31 = v30;
    v55 = v31;
    objc_msgSend(v28, "addAlongsideAnimationBlockForKeyPath:animationBlock:", CFSTR("centerX"), v54);
    v32 = v55;
    goto LABEL_33;
  }
LABEL_34:
  v38 = objc_msgSend(v9, "_sliderMode");
  v39 = objc_msgSend(v10, "_sliderMode");
  if (v6)
  {
    -[CAMSystemOverlayView _backgroundAnimationSettings](self, "_backgroundAnimationSettings");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setBehaviorSettingsForKeyPath:behaviorSettings:", CFSTR("centerX"), v40);
    objc_msgSend(v28, "setBehaviorSettingsForKeyPath:behaviorSettings:", CFSTR("centerY"), v40);
    objc_msgSend(v28, "setBehaviorSettingsForKeyPath:behaviorSettings:", CFSTR("containerWidth"), v40);
    objc_msgSend(v28, "setBehaviorSettingsForKeyPath:behaviorSettings:", CFSTR("containerHeight"), v40);

  }
  -[CAMSystemOverlayView _backgroundAnimator](self, "_backgroundAnimator");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  v44 = v38 == 1 && v39 == 1 || v47;
  objc_msgSend(v41, "applyViewConfiguration:animated:tracking:containerView:contextView:", v28, v6, v44, v11, v12);

  objc_destroyWeak(location);
}

void __87__CAMSystemOverlayView__updateDropletBackgroundFromState_toState_animated_interactive___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "layoutIfNeeded");

}

uint64_t __87__CAMSystemOverlayView__updateDropletBackgroundFromState_toState_animated_interactive___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:", -1.0);
}

void __87__CAMSystemOverlayView__updateDropletBackgroundFromState_toState_animated_interactive___block_invoke_3(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setSliderPresented:", 1);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "_setSliderPresentationProgress:", 0);

}

void __87__CAMSystemOverlayView__updateDropletBackgroundFromState_toState_animated_interactive___block_invoke_4(id *a1)
{
  id WeakRetained;

  objc_msgSend(a1[4], "setValue:", 1.0);
  objc_msgSend(a1[5], "setValue:", 1.0);
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "layoutIfNeeded");

}

- (CEKFluidBehaviorSettings)_backgroundAnimationSettings
{
  CEKFluidBehaviorSettings *backgroundAnimationSettings;
  CEKFluidBehaviorSettings *v4;
  CEKFluidBehaviorSettings *v5;
  CEKFluidBehaviorSettings *v6;
  CAFrameRateRange v8;

  backgroundAnimationSettings = self->__backgroundAnimationSettings;
  if (!backgroundAnimationSettings)
  {
    v4 = (CEKFluidBehaviorSettings *)objc_alloc_init(MEMORY[0x1E0D0D060]);
    v5 = self->__backgroundAnimationSettings;
    self->__backgroundAnimationSettings = v4;

    -[CEKFluidBehaviorSettings setDampingRatio:](self->__backgroundAnimationSettings, "setDampingRatio:", 0.7);
    -[CEKFluidBehaviorSettings setResponse:](self->__backgroundAnimationSettings, "setResponse:", 0.5);
    v6 = self->__backgroundAnimationSettings;
    v8 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    -[CEKFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](v6, "setFrameRateRange:highFrameRateReason:", 1441796, *(double *)&v8.minimum, *(double *)&v8.maximum, *(double *)&v8.preferred);
    backgroundAnimationSettings = self->__backgroundAnimationSettings;
  }
  return backgroundAnimationSettings;
}

- (id)_createValueLabelProgressProperty
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id v9;
  id from;
  id location;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC3F30]);
  objc_initWeak(&location, v3);
  objc_initWeak(&from, self);
  v4 = (void *)MEMORY[0x1E0DC3F10];
  v12[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__CAMSystemOverlayView__createValueLabelProgressProperty__block_invoke;
  v7[3] = &unk_1EA32B390;
  objc_copyWeak(&v8, &location);
  objc_copyWeak(&v9, &from);
  objc_msgSend(v4, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  return v3;
}

void __57__CAMSystemOverlayView__createValueLabelProgressProperty__block_invoke(uint64_t a1)
{
  id v2;
  char v3;
  id v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v2 && WeakRetained)
  {
    v3 = objc_msgSend(WeakRetained, "isInvalidated");

    if ((v3 & 1) == 0)
    {
      objc_msgSend(v2, "_updateValueLabelVisibility");
      objc_msgSend(WeakRetained, "presentationValue");
      objc_msgSend(WeakRetained, "value");
      if (BSFloatEqualToFloat())
      {
        objc_msgSend(WeakRetained, "invalidate");
        objc_msgSend(v2, "_valueLabelPresentationProgress");
        v4 = (id)objc_claimAutoreleasedReturnValue();

        if (WeakRetained == v4)
          objc_msgSend(v2, "_setValueLabelPresentationProgress:", 0);
      }
    }
  }
  else
  {

  }
}

+ (void)_applyGainModulationToElement:(id)a3 withInputAmount:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
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
  id v19;

  v19 = a3;
  if (v19)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = *MEMORY[0x1E0CD2C78];
    v7 = a4;
    objc_msgSend(v5, "stringWithFormat:", CFSTR("filters.%@"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v8, *MEMORY[0x1E0CD2CB8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForKeyPath:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setValue:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CD2CA8]);
      v13 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(v19, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "filters");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "arrayWithArray:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "addObject:", v12);
      objc_msgSend(v19, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setFilters:", v16);

    }
    objc_msgSend(v19, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setValue:forKeyPath:", v7, v9);

  }
}

- (id)_blurFilter
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", &unk_1EA3B1880, CFSTR("inputRadius"));
  objc_msgSend(v2, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("inputNormalizeEdgesTransparent"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("low"), CFSTR("inputQuality"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("low"), CFSTR("inputIntermediateBitDepth"));
  return v2;
}

- (CAFilter)_progressiveEdgeBlurFilter
{
  CAFilter **p_progressiveEdgeBlurFilter;
  CAFilter *progressiveEdgeBlurFilter;
  CGColorSpace *DeviceRGB;
  CGContext *v6;
  CGColorSpace *v7;
  CGGradient *v8;
  CGImageRef Image;
  void *v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  CGFloat locations;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  CGPoint v29;
  CGPoint v30;

  v28 = *MEMORY[0x1E0C80C00];
  p_progressiveEdgeBlurFilter = &self->__progressiveEdgeBlurFilter;
  progressiveEdgeBlurFilter = self->__progressiveEdgeBlurFilter;
  if (progressiveEdgeBlurFilter)
    return progressiveEdgeBlurFilter;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v6 = CGBitmapContextCreate(0, 1uLL, 0x14uLL, 8uLL, 0, DeviceRGB, 1u);
  v7 = CGColorSpaceCreateDeviceRGB();
  locations = 0.0;
  v26 = xmmword_1DB9A55B0;
  v27 = xmmword_1DB9A55C0;
  v20 = 0;
  v22 = 0u;
  v18 = 0u;
  v19 = 0u;
  v15 = 0;
  v17 = 0u;
  v12 = 0;
  v14 = 0u;
  v11 = 0u;
  v13 = 0x3FF0000000000000;
  v16 = 0x3FB999999999999ALL;
  v21 = 0x3FB999999999999ALL;
  v23 = 0;
  v24 = 0x3FF0000000000000;
  v8 = CGGradientCreateWithColorComponents(v7, (const CGFloat *)&v11, &locations, 5uLL);
  v29.x = 0.0;
  v29.y = 0.0;
  v30.x = 0.0;
  v30.y = 20.0;
  CGContextDrawLinearGradient(v6, v8, v29, v30, 0);
  Image = CGBitmapContextCreateImage(v6);
  CGColorSpaceRelease(v7);
  CGGradientRelease(v8);
  CGContextRelease(v6);
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F00]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", Image, CFSTR("inputMaskImage"));
  objc_msgSend(v10, "setValue:forKey:", &unk_1EA3B1890, *MEMORY[0x1E0CD2D90]);
  objc_msgSend(v10, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("inputNormalizeEdgesTransparent"));
  objc_msgSend(v10, "setValue:forKey:", CFSTR("low"), CFSTR("inputQuality"));
  objc_msgSend(v10, "setValue:forKey:", CFSTR("low"), CFSTR("inputIntermediateBitDepth"));
  objc_storeStrong((id *)p_progressiveEdgeBlurFilter, v10);

  return (CAFilter *)v10;
}

- (CAMutableMeshTransform)_dialEffectMesh
{
  CAMutableMeshTransform *dialEffectMesh;
  CAMutableMeshTransform *v3;
  uint64_t v5;
  double *v6;
  double v7;
  long double v8;
  long double v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  CAMutableMeshTransform *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  dialEffectMesh = self->__dialEffectMesh;
  if (dialEffectMesh)
  {
    v3 = dialEffectMesh;
  }
  else
  {
    MEMORY[0x1E0C80A78]();
    v5 = 0;
    v6 = (double *)&v18;
    v19 = xmmword_1DB9A55D0;
    do
    {
      v7 = (double)v5 / 19.0;
      v8 = pow(v7 + -0.5 + v7 + -0.5, 3.0);
      *(v6 - 6) = 0.0;
      v9 = v7 + v8 * -0.11;
      *(v6 - 5) = v7;
      *(v6 - 4) = 0.0;
      *(v6 - 3) = v9;
      *((_OWORD *)v6 - 1) = v19;
      *v6 = v7;
      v6[1] = 1.0;
      v6[2] = v9;
      v6[3] = 0.0;
      ++v5;
      v6 += 10;
    }
    while (v5 != 20);
    MEMORY[0x1E0C80A78]();
    v10 = &v16;
    v11 = -38;
    do
    {
      *((_DWORD *)v10 - 2) = v11 + 38;
      *((_DWORD *)v10 - 1) = v11 + 39;
      *(_DWORD *)v10 = v11 + 41;
      *((_DWORD *)v10 + 1) = v11 + 40;
      v10[1] = 0;
      v10[2] = 0;
      v10 += 4;
      v11 += 2;
    }
    while (v11);
    objc_msgSend(MEMORY[0x1E0CD27F0], "meshTransformWithVertexCount:vertices:faceCount:faces:depthNormalization:", 40, &v17, 19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSubdivisionSteps:", 2);
    v13 = self->__dialEffectMesh;
    self->__dialEffectMesh = (CAMutableMeshTransform *)v12;
    v14 = v12;

    v3 = self->__dialEffectMesh;
  }
  return v3;
}

- (void)setOrientation:(int64_t)a3
{
  -[CAMSystemOverlayView setOrientation:animated:](self, "setOrientation:animated:", a3, 0);
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  if (self->_orientation != a3)
  {
    v4 = a4;
    if (a4)
    {
      -[CAMSystemOverlayView layoutIfNeeded](self, "layoutIfNeeded");
      self->_orientation = a3;
      -[CAMSystemOverlayView setNeedsLayout](self, "setNeedsLayout");
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __48__CAMSystemOverlayView_setOrientation_animated___block_invoke;
      v11[3] = &unk_1EA328868;
      v11[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v11, 0, 0.3, 0.0);
    }
    else
    {
      self->_orientation = a3;
      -[CAMSystemOverlayView setNeedsLayout](self, "setNeedsLayout");
    }
    -[CAMSystemOverlayView menu](self, "menu");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOrientation:animated:", a3, v4);

    -[CAMSystemOverlayView slider](self, "slider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOrientation:animated:", a3, v4);

    -[CAMSystemOverlayView sliderState](self, "sliderState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSystemOverlayView sliderState](self, "sliderState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSystemOverlayView _updateDropletBackgroundFromState:toState:animated:interactive:](self, "_updateDropletBackgroundFromState:toState:animated:interactive:", v9, v10, v4, 0);

  }
}

uint64_t __48__CAMSystemOverlayView_setOrientation_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)overlaySliderWillBeginScrolling:(id)a3
{
  void *v4;

  -[CAMSystemOverlayView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overlayViewSliderWillBeginScrolling:", self);

  -[CAMSystemOverlayView _updateScaleForSliderContent:withMode:sliderContentDidChange:updateDropletScale:](self, "_updateScaleForSliderContent:withMode:sliderContentDidChange:updateDropletScale:", 0, 3, 0, 1);
}

- (void)overlaySliderDidEndScrolling:(id)a3
{
  id v4;

  -[CAMSystemOverlayView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overlayViewSliderDidEndScrolling:", self);

}

- (void)overlaySliderDidChangeCurrentValue:(id)a3
{
  void *v4;

  -[CAMSystemOverlayView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overlayViewSliderDidChangeCurrentValue:", self);

  -[CAMSystemOverlayView _updateValueLabelText](self, "_updateValueLabelText");
}

- (id)overlaySlider:(id)a3 cellConfigurationForValue:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[CAMSystemOverlayView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "overlayView:cellConfigurationForNumber:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)overlayMenuSliderWillBeginScrolling:(id)a3
{
  id v3;

  -[CAMSystemOverlayView _menuVisibility](self, "_menuVisibility", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addReason:", 2);

}

- (void)overlayMenuSliderDidEndScrolling:(id)a3
{
  id v3;

  -[CAMSystemOverlayView _menuVisibility](self, "_menuVisibility", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeReason:", 2);

}

- (void)overlayMenuSlider:(id)a3 didSelectControlAt:(int64_t)a4
{
  void *v5;
  void *v6;

  -[CAMSystemOverlayView delegate](self, "delegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSystemOverlayView menu](self, "menu");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "overlayView:menuDidSelectControlAtIndex:", self, objc_msgSend(v6, "selectedControlIndex"));

  -[CAMSystemOverlayView _updateValueLabelText](self, "_updateValueLabelText");
  -[CAMSystemOverlayView _updateValueLabelVisibility](self, "_updateValueLabelVisibility");
}

- (void)systemOverlayVisibility:(id)a3 changedForReason:(int64_t)a4
{
  -[CAMSystemOverlayView _setSliderContent:animated:](self, "_setSliderContent:animated:", objc_msgSend(a3, "isVisible"), 1);
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)_setSliderPresented:(BOOL)a3
{
  self->_sliderPresented = a3;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (void)_setSlider:(id)a3
{
  objc_storeStrong((id *)&self->_slider, a3);
}

- (_TtC8CameraUI17OverlayMenuSlider)menu
{
  return self->_menu;
}

- (void)_setMenu:(id)a3
{
  objc_storeStrong((id *)&self->_menu, a3);
}

- (int64_t)sliderContent
{
  return self->_sliderContent;
}

- (UIView)tipAnchor
{
  return self->_tipAnchor;
}

- (CAMSystemOverlayViewDelegate)delegate
{
  return (CAMSystemOverlayViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isSliderFeedbackDisabled
{
  return self->_sliderFeedbackDisabled;
}

- (BOOL)halfPressEnabled
{
  return self->_halfPressEnabled;
}

- (void)setHalfPressEnabled:(BOOL)a3
{
  self->_halfPressEnabled = a3;
}

- (BOOL)isHandleBarVisible
{
  return self->_handleBarVisible;
}

- (CAMOverlaySliderState)sliderState
{
  return self->_sliderState;
}

- (DRPDropletContextView)_backgroundContext
{
  return self->__backgroundContext;
}

- (void)_setBackgroundContext:(id)a3
{
  objc_storeStrong((id *)&self->__backgroundContext, a3);
}

- (DRPDropletContainerView)_backgroundDroplet
{
  return self->__backgroundDroplet;
}

- (void)_setBackgroundContainer:(id)a3
{
  objc_storeStrong((id *)&self->__backgroundDroplet, a3);
}

- (DRPDropletAnimationCoordinator)_backgroundAnimator
{
  return self->__backgroundAnimator;
}

- (void)_setBackgroundAnimator:(id)a3
{
  objc_storeStrong((id *)&self->__backgroundAnimator, a3);
}

- (BOOL)_backgroundHintNeedsReset
{
  return self->__backgroundHintNeedsReset;
}

- (void)_setBackgroundHintNeedsReset:(BOOL)a3
{
  self->__backgroundHintNeedsReset = a3;
}

- (CAMScreenLuminanceObserverLayer)_screenLuminanceObserverLayer
{
  return self->__screenLuminanceObserverLayer;
}

- (CAMSystemOverlayVisibility)_menuVisibility
{
  return self->__menuVisibility;
}

- (UIView)_hitTestingBackground
{
  return self->__hitTestingBackground;
}

- (void)_setHitTestingBackground:(id)a3
{
  objc_storeStrong((id *)&self->__hitTestingBackground, a3);
}

- (UIView)_valueLabelContainer
{
  return self->__valueLabelContainer;
}

- (void)_setValueLabelContainer:(id)a3
{
  objc_storeStrong((id *)&self->__valueLabelContainer, a3);
}

- (UILabel)_valueLabel
{
  return self->__valueLabel;
}

- (void)_setValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->__valueLabel, a3);
}

- (CGSize)_valueTextSize
{
  double width;
  double height;
  CGSize result;

  width = self->__valueTextSize.width;
  height = self->__valueTextSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setValueTextSize:(CGSize)a3
{
  self->__valueTextSize = a3;
}

- (UIView)_handleBarView
{
  return self->__handleBarView;
}

- (void)_setHandleBarView:(id)a3
{
  objc_storeStrong((id *)&self->__handleBarView, a3);
}

- (UIGestureRecognizer)_touchingSliderGestureRecognizer
{
  return self->__touchingSliderGestureRecognizer;
}

- (void)_setTouchingSliderGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->__touchingSliderGestureRecognizer, a3);
}

- (UIPanGestureRecognizer)_panGestureRecognizer
{
  return self->__panGestureRecognizer;
}

- (void)_setPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->__panGestureRecognizer, a3);
}

- (UITapGestureRecognizer)_tapGestureRecognizer
{
  return self->__tapGestureRecognizer;
}

- (void)_setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->__tapGestureRecognizer, a3);
}

- (double)_dropletScale
{
  return self->__dropletScale;
}

- (void)set_dropletScale:(double)a3
{
  self->__dropletScale = a3;
}

- (unint64_t)_buttonStage
{
  return self->__buttonStage;
}

- (void)_setButtonStage:(unint64_t)a3
{
  self->__buttonStage = a3;
}

- (UIViewFloatAnimatableProperty)_sliderPresentationProgress
{
  return self->__sliderPresentationProgress;
}

- (void)_setSliderPresentationProgress:(id)a3
{
  objc_storeStrong((id *)&self->__sliderPresentationProgress, a3);
}

- (UIViewFloatAnimatableProperty)_valueLabelPresentationProgress
{
  return self->__valueLabelPresentationProgress;
}

- (void)_setValueLabelPresentationProgress:(id)a3
{
  objc_storeStrong((id *)&self->__valueLabelPresentationProgress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__valueLabelPresentationProgress, 0);
  objc_storeStrong((id *)&self->__sliderPresentationProgress, 0);
  objc_storeStrong((id *)&self->__tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__touchingSliderGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__handleBarView, 0);
  objc_storeStrong((id *)&self->__valueLabel, 0);
  objc_storeStrong((id *)&self->__valueLabelContainer, 0);
  objc_storeStrong((id *)&self->__hitTestingBackground, 0);
  objc_storeStrong((id *)&self->__menuVisibility, 0);
  objc_storeStrong((id *)&self->__screenLuminanceObserverLayer, 0);
  objc_storeStrong((id *)&self->__backgroundAnimator, 0);
  objc_storeStrong((id *)&self->__backgroundDroplet, 0);
  objc_storeStrong((id *)&self->__backgroundContext, 0);
  objc_storeStrong((id *)&self->_sliderState, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tipAnchor, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->__progressiveEdgeBlurFilter, 0);
  objc_storeStrong((id *)&self->__dialEffectMesh, 0);
  objc_storeStrong((id *)&self->__scaleSettings, 0);
  objc_storeStrong((id *)&self->__backgroundAnimationSettings, 0);
}

@end
