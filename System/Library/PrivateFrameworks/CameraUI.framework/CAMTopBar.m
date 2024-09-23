@implementation CAMTopBar

- (CAMTopBar)initWithFrame:(CGRect)a3
{
  CAMTopBar *v3;
  CAMTopBar *v4;
  CAMTopBar *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMTopBar;
  v3 = -[CAMTopBar initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CAMTopBar _commonCAMTopBarInitialization](v3, "_commonCAMTopBarInitialization");
    v5 = v4;
  }

  return v4;
}

- (void)_commonCAMTopBarInitialization
{
  id v3;
  UIView *v4;
  UIView *backgroundView;

  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  backgroundView = self->__backgroundView;
  self->__backgroundView = v4;

  -[UIView setAutoresizingMask:](self->__backgroundView, "setAutoresizingMask:", 18);
  -[UIView setUserInteractionEnabled:](self->__backgroundView, "setUserInteractionEnabled:", 0);
  -[CAMTopBar addSubview:](self, "addSubview:", self->__backgroundView);
}

- (void)setStyle:(int64_t)a3
{
  -[CAMTopBar setStyle:animated:](self, "setStyle:animated:", a3, 0);
}

- (void)setStyle:(int64_t)a3 animated:(BOOL)a4
{
  double v4;

  if (self->_style != a3)
  {
    if (a4)
      v4 = 0.3;
    else
      v4 = 0.0;
    -[CAMTopBar _setMode:style:animationDuration:animationOptions:](self, "_setMode:style:animationDuration:animationOptions:", -[CAMTopBar _mode](self, "_mode"), a3, 0, v4);
  }
}

- (void)setVisibilityUpdateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_visibilityUpdateDelegate, a3);
}

- (CAMFlashButton)flashButton
{
  return self->_flashButton;
}

- (CAMHDRButton)HDRButton
{
  return self->_HDRButton;
}

- (BOOL)shouldHideHDRButtonForGraphConfiguration:(id)a3
{
  CAMTopBar *v3;
  void *v4;

  v3 = self;
  -[CAMTopBar HDRButton](self, "HDRButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[CAMTopBar _shouldHideSubview:](v3, "_shouldHideSubview:", v4);

  return (char)v3;
}

- (BOOL)_shouldHideSubview:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  BOOL v7;

  v4 = a3;
  -[CAMTopBar _expandedMenuButton](self, "_expandedMenuButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[CAMTopBar _shouldExpandButtonsHorizontally](self, "_shouldExpandButtonsHorizontally");
    v7 = v5 != v4 && v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CAMExpandableMenuButton)_expandedMenuButton
{
  return self->__expandedMenuButton;
}

- (CAMElapsedTimeView)elapsedTimeView
{
  return self->_elapsedTimeView;
}

- (BOOL)shouldHideElapsedTimeViewForGraphConfiguration:(id)a3
{
  CAMTopBar *v3;
  void *v4;

  v3 = self;
  -[CAMTopBar elapsedTimeView](self, "elapsedTimeView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[CAMTopBar _shouldHideSubview:](v3, "_shouldHideSubview:", v4);

  return (char)v3;
}

- (CAMLivePhotoButton)livePhotoButton
{
  return self->_livePhotoButton;
}

- (BOOL)shouldHideLivePhotoButtonForGraphConfiguration:(id)a3
{
  CAMTopBar *v3;
  void *v4;

  v3 = self;
  -[CAMTopBar livePhotoButton](self, "livePhotoButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[CAMTopBar _shouldHideSubview:](v3, "_shouldHideSubview:", v4);

  return (char)v3;
}

- (CAMFlipButton)flipButton
{
  return self->_flipButton;
}

- (PUReviewScreenDoneButton)doneButton
{
  return self->_doneButton;
}

- (BOOL)shouldHideDoneButtonForGraphConfiguration:(id)a3
{
  CAMTopBar *v3;
  void *v4;

  v3 = self;
  -[CAMTopBar doneButton](self, "doneButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[CAMTopBar _shouldHideSubview:](v3, "_shouldHideSubview:", v4);

  return (char)v3;
}

- (CAMFilterButton)filterButton
{
  return self->_filterButton;
}

- (BOOL)shouldHideFilterButtonForGraphConfiguration:(id)a3
{
  CAMTopBar *v3;
  void *v4;

  v3 = self;
  -[CAMTopBar filterButton](self, "filterButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[CAMTopBar _shouldHideSubview:](v3, "_shouldHideSubview:", v4);

  return (char)v3;
}

- (CAMTimerButton)timerButton
{
  return self->_timerButton;
}

- (BOOL)shouldHideTimerButtonForGraphConfiguration:(id)a3
{
  CAMTopBar *v3;
  void *v4;

  v3 = self;
  -[CAMTopBar timerButton](self, "timerButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[CAMTopBar _shouldHideSubview:](v3, "_shouldHideSubview:", v4);

  return (char)v3;
}

- (void)setFlashButton:(id)a3
{
  CAMFlashButton *v5;
  CAMFlashButton **p_flashButton;
  CAMFlashButton *flashButton;
  CAMFlashButton *v8;

  v5 = (CAMFlashButton *)a3;
  p_flashButton = &self->_flashButton;
  flashButton = self->_flashButton;
  v8 = v5;
  if (flashButton != v5)
  {
    -[CAMFlashButton removeFromSuperview](flashButton, "removeFromSuperview");
    -[CAMExpandableMenuButton setExpandableMenuDelegate:](*p_flashButton, "setExpandableMenuDelegate:", 0);
    objc_storeStrong((id *)&self->_flashButton, a3);
    -[CAMExpandableMenuButton setTappableEdgeInsets:](*p_flashButton, "setTappableEdgeInsets:", 10.0, 11.0, 10.0, 11.0);
    -[CAMExpandableMenuButton setExpandableMenuDelegate:](*p_flashButton, "setExpandableMenuDelegate:", self);
    -[CAMTopBar addSubview:](self, "addSubview:", v8);
  }

}

- (void)setTimerButton:(id)a3
{
  CAMTimerButton *v5;
  CAMTimerButton **p_timerButton;
  CAMTimerButton *timerButton;
  CAMTimerButton *v8;

  v5 = (CAMTimerButton *)a3;
  p_timerButton = &self->_timerButton;
  timerButton = self->_timerButton;
  v8 = v5;
  if (timerButton != v5)
  {
    -[CAMTimerButton removeFromSuperview](timerButton, "removeFromSuperview");
    -[CAMExpandableMenuButton setExpandableMenuDelegate:](*p_timerButton, "setExpandableMenuDelegate:", 0);
    objc_storeStrong((id *)&self->_timerButton, a3);
    -[CAMExpandableMenuButton setTappableEdgeInsets:](*p_timerButton, "setTappableEdgeInsets:", 11.0, 11.0, 11.0, 11.0);
    -[CAMExpandableMenuButton setExpandableMenuDelegate:](*p_timerButton, "setExpandableMenuDelegate:", self);
    -[CAMTopBar addSubview:](self, "addSubview:", v8);
  }

}

- (BOOL)shouldHideFlashButtonForGraphConfiguration:(id)a3
{
  CAMTopBar *v3;
  void *v4;

  v3 = self;
  -[CAMTopBar flashButton](self, "flashButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[CAMTopBar _shouldHideSubview:](v3, "_shouldHideSubview:", v4);

  return (char)v3;
}

- (BOOL)_shouldExpandButtonsHorizontally
{
  int64_t v3;
  BOOL result;

  v3 = -[CAMTopBar orientation](self, "orientation");
  result = -[CAMTopBar isFloating](self, "isFloating");
  if ((unint64_t)(v3 - 1) < 2)
    return 1;
  return result;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (BOOL)isFloating
{
  return +[CAMTopBar isFloatingStyle:](CAMTopBar, "isFloatingStyle:", -[CAMTopBar style](self, "style"));
}

- (int64_t)style
{
  return self->_style;
}

- (void)setHDRButton:(id)a3
{
  CAMHDRButton *v5;
  CAMHDRButton **p_HDRButton;
  CAMHDRButton *HDRButton;
  CAMHDRButton *v8;

  v5 = (CAMHDRButton *)a3;
  p_HDRButton = &self->_HDRButton;
  HDRButton = self->_HDRButton;
  v8 = v5;
  if (HDRButton != v5)
  {
    -[CAMHDRButton removeFromSuperview](HDRButton, "removeFromSuperview");
    -[CAMExpandableMenuButton setExpandableMenuDelegate:](*p_HDRButton, "setExpandableMenuDelegate:", 0);
    objc_storeStrong((id *)&self->_HDRButton, a3);
    -[CAMExpandableMenuButton setTappableEdgeInsets:](*p_HDRButton, "setTappableEdgeInsets:", 12.0, 11.0, 12.0, 11.0);
    -[CAMExpandableMenuButton setExpandableMenuDelegate:](*p_HDRButton, "setExpandableMenuDelegate:", self);
    -[CAMTopBar addSubview:](self, "addSubview:", v8);
  }

}

- (void)configureForMode:(int64_t)a3
{
  -[CAMTopBar configureForMode:animated:](self, "configureForMode:animated:", a3, 0);
}

- (void)configureForMode:(int64_t)a3 animated:(BOOL)a4
{
  double v4;

  if (a4)
    v4 = 0.25;
  else
    v4 = 0.0;
  -[CAMTopBar _setMode:style:animationDuration:animationOptions:](self, "_setMode:style:animationDuration:animationOptions:", a3, -[CAMTopBar style](self, "style"), 0, v4);
}

- (id)_allowedControlsForStillImageMode
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_flashButton)
    objc_msgSend(v3, "addObject:");
  if (self->_HDRButton)
    objc_msgSend(v4, "addObject:");
  if (self->_livePhotoButton)
    objc_msgSend(v4, "addObject:");
  if (self->_timerButton)
    objc_msgSend(v4, "addObject:");
  if (self->_filterButton)
    objc_msgSend(v4, "addObject:");
  if (self->_flipButton)
    objc_msgSend(v4, "addObject:");
  return v4;
}

- (void)setFilterButton:(id)a3
{
  CAMFilterButton *v5;
  CAMFilterButton *filterButton;
  double v7;
  CAMFilterButton *v8;

  v5 = (CAMFilterButton *)a3;
  filterButton = self->_filterButton;
  v8 = v5;
  if (filterButton != v5)
  {
    -[CAMFilterButton removeFromSuperview](filterButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_filterButton, a3);
    v7 = CAMPixelWidthForView(self);
    -[CAMFilterButton setTappableEdgeInsets:](self->_filterButton, "setTappableEdgeInsets:", v7 + 9.0, v7 + 9.0, v7 + 9.0, v7 + 9.0);
    -[CAMTopBar addSubview:](self, "addSubview:", v8);
  }

}

- (void)setBackgroundStyle:(int64_t)a3 animated:(BOOL)a4
{
  _QWORD v5[5];

  if (self->_backgroundStyle != a3)
  {
    self->_backgroundStyle = a3;
    if (a4)
    {
      -[CAMTopBar layoutIfNeeded](self, "layoutIfNeeded");
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __41__CAMTopBar_setBackgroundStyle_animated___block_invoke;
      v5[3] = &unk_1EA328868;
      v5[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 6, v5, 0, 0.3, 0.0);
    }
    else
    {
      -[CAMTopBar setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)collapseMenuButton:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a4;
  v16 = a3;
  if (objc_msgSend(v16, "isExpanded"))
  {
    -[CAMTopBar collapsedFrameForMenuButton:](self, "collapsedFrameForMenuButton:", v16);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[CAMTopBar _setExpandedMenuButton:](self, "_setExpandedMenuButton:", 0);
    v14 = (void *)MEMORY[0x1E0DC3F10];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __41__CAMTopBar_collapseMenuButton_animated___block_invoke;
    v17[3] = &unk_1EA328D90;
    v15 = v16;
    v18 = v15;
    v19 = v7;
    v20 = v9;
    v21 = v11;
    v22 = v13;
    objc_msgSend(v14, "performWithoutAnimation:", v17);
    objc_msgSend(v15, "finishCollapsingAnimated:", v4);
    -[CAMTopBar _updateControlVisibilityAnimated:](self, "_updateControlVisibilityAnimated:", v4);

  }
}

- (void)setOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    -[CAMTopBar _updateControlVisibilityAnimated:](self, "_updateControlVisibilityAnimated:", 1);
  }
}

- (void)_updateControlVisibilityAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CAMTopBar visibilityUpdateDelegate](self, "visibilityUpdateDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateControlVisibilityAnimated:", v3);

}

- (CAMControlVisibilityUpdateDelegate)visibilityUpdateDelegate
{
  return (CAMControlVisibilityUpdateDelegate *)objc_loadWeakRetained((id *)&self->_visibilityUpdateDelegate);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  _BOOL8 v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CAMTopBar;
  -[CAMTopBar layoutSubviews](&v16, sel_layoutSubviews);
  -[CAMTopBar _allowedControls](self, "_allowedControls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTopBar apertureButton](self, "apertureButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && objc_msgSend(v3, "containsObject:", v4))
  {
    objc_msgSend(v3, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4 != v5;

    objc_msgSend(v4, "setExpansionDirection:", 2 * v6);
  }
  v7 = -[CAMTopBar style](self, "style");
  v8 = v7;
  if (v7 == 1)
  {
    -[CAMTopBar _layoutFloatingStyle](self, "_layoutFloatingStyle");
  }
  else if (!v7)
  {
    -[CAMTopBar _layoutDefaultStyle](self, "_layoutDefaultStyle");
  }
  -[CAMTopBar _backgroundView](self, "_backgroundView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTopBar _opacityForBackgroundStyle:](self, "_opacityForBackgroundStyle:", -[CAMTopBar backgroundStyle](self, "backgroundStyle"));
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v11);

  objc_msgSend(v9, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTopBar _backgroundCornerRadiusForStyle:](self, "_backgroundCornerRadiusForStyle:", v8);
  v14 = v13;
  v15 = -[CAMTopBar _backgroundMasksToBoundsForStyle:](self, "_backgroundMasksToBoundsForStyle:", v8);
  objc_msgSend(v12, "setCornerRadius:", v14);
  objc_msgSend(v12, "setMasksToBounds:", v15);

}

- (void)_layoutDefaultStyle
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
  id v13;

  -[CAMTopBar bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMTopBar _backgroundView](self, "_backgroundView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v4, v6, v8, v10);
  -[CAMTopBar _allowedControls](self, "_allowedControls");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTopBar _expandedMenuButton](self, "_expandedMenuButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTopBar _layoutControls:apply:withExpandedMenuButton:collapsingMenuButton:collapsingFrame:](self, "_layoutControls:apply:withExpandedMenuButton:collapsingMenuButton:collapsingFrame:", v11, 1, v12, 0, 0);

}

- (UIView)_backgroundView
{
  return self->__backgroundView;
}

- (NSArray)_allowedControls
{
  return self->__allowedControls;
}

- (void)_layoutControls:(id)a3 apply:(BOOL)a4 withExpandedMenuButton:(id)a5 collapsingMenuButton:(id)a6 collapsingFrame:(CGRect *)a7
{
  _BOOL4 v10;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  char v24;
  id v25;
  unint64_t v26;
  void *v27;
  PUReviewScreenDoneButton *v28;
  PUReviewScreenDoneButton *v29;
  PUReviewScreenDoneButton *v30;
  double v31;
  double v32;
  double v33;
  PUReviewScreenDoneButton *v34;
  uint64_t v35;
  PUReviewScreenDoneButton *v36;
  void *v38;
  id v39;
  PUReviewScreenDoneButton *v40;
  PUReviewScreenDoneButton *v41;
  id v42;
  id v43;
  id v44;
  PUReviewScreenDoneButton *v45;
  void *v46;
  uint64_t v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  uint64_t v57;
  id v58;
  void *v59;
  void *v60;
  _BOOL4 v61;
  id v62;
  id v63;
  _QWORD v64[4];
  id v65;
  CAMTopBar *v66;
  id v67;
  _QWORD v68[4];
  id v69;
  PUReviewScreenDoneButton *v70;
  PUReviewScreenDoneButton *v71;
  double v72;
  double v73;
  double v74;
  uint64_t v75;
  _QWORD v76[5];
  PUReviewScreenDoneButton *v77;
  PUReviewScreenDoneButton *v78;
  id v79;
  id v80;
  id v81;
  uint64_t v82;
  double v83;
  double v84;
  double v85;
  uint64_t v86;
  char v87;

  v10 = a4;
  v63 = a3;
  v12 = a5;
  v62 = a6;
  -[CAMTopBar _backgroundView](self, "_backgroundView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  -[CAMTopBar alignmentRectForFrame:](self, "alignmentRectForFrame:");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = 448;
  v23 = objc_msgSend(v63, "containsObject:", self->_elapsedTimeView);
  v24 = v23;
  v58 = v12;
  v61 = v10;
  if (v23
    || objc_msgSend(v63, "count") == 1
    && (v22 = 496, objc_msgSend(v63, "containsObject:", self->_timerButton)))
  {
    v25 = *(id *)((char *)&self->super.super.super.isa + v22);
  }
  else
  {
    if ((unint64_t)objc_msgSend(v63, "count", v12) >= 2)
    {
      v26 = objc_msgSend(v63, "count");
      v27 = v63;
      if ((v26 & 1) != 0)
      {
        objc_msgSend(v63, "objectAtIndexedSubscript:", v26 >> 1);
        v57 = objc_claimAutoreleasedReturnValue();
        v27 = v63;
        v25 = (id)v57;
      }
      else
      {
        v25 = 0;
      }
      goto LABEL_10;
    }
    v25 = 0;
  }
  v27 = v63;
LABEL_10:
  objc_msgSend(v27, "firstObject", v58);
  v28 = (PUReviewScreenDoneButton *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28 == v25)
  {
    v30 = 0;
  }
  else if (v28 == self->_doneButton)
  {
    v30 = 0;
  }
  else
  {
    v30 = v28;
  }
  v31 = v15 + 11.0;
  v32 = v17 + 0.0;
  v33 = v19 + -22.0;
  v34 = v30;
  objc_msgSend(v63, "lastObject");
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = self->_doneButton;
  if (!v36)
  {
    if ((PUReviewScreenDoneButton *)v35 == v29 || v35 == (_QWORD)v25)
      v38 = 0;
    else
      v38 = (void *)v35;
    v36 = v38;
  }
  v60 = (void *)v35;
  v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v76[0] = MEMORY[0x1E0C809B0];
  v76[1] = 3221225472;
  v76[2] = __95__CAMTopBar__layoutControls_apply_withExpandedMenuButton_collapsingMenuButton_collapsingFrame___block_invoke;
  v76[3] = &unk_1EA32E128;
  v87 = v24 ^ 1;
  v83 = v31;
  v84 = v32;
  v85 = v33;
  v86 = v21;
  v82 = 0x4036000000000000;
  v76[4] = self;
  v40 = v34;
  v77 = v40;
  v41 = v36;
  v78 = v41;
  v42 = v25;
  v79 = v42;
  v43 = v13;
  v80 = v43;
  v44 = v39;
  v81 = v44;
  objc_msgSend(v63, "enumerateObjectsUsingBlock:", v76);
  if (!v42)
  {
    v46 = v59;
    if (!v40)
      goto LABEL_31;
    v45 = v40;
    if (!v41)
      goto LABEL_31;
LABEL_30:
    -[CAMTopBar _computeHorizontalLayoutForViewsBetweenLeftView:rightView:views:alignmentRects:](self, "_computeHorizontalLayoutForViewsBetweenLeftView:rightView:views:alignmentRects:", v45, v41, v63, v44);
    goto LABEL_31;
  }
  if (v40)
    -[CAMTopBar _computeHorizontalLayoutForViewsBetweenLeftView:rightView:views:alignmentRects:](self, "_computeHorizontalLayoutForViewsBetweenLeftView:rightView:views:alignmentRects:", v40, v42, v63, v44);
  v45 = (PUReviewScreenDoneButton *)v42;
  v46 = v59;
  if (v41)
    goto LABEL_30;
LABEL_31:
  if ((v24 & 1) == 0)
  {
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __95__CAMTopBar__layoutControls_apply_withExpandedMenuButton_collapsingMenuButton_collapsingFrame___block_invoke_2;
    v68[3] = &unk_1EA32E150;
    v69 = v44;
    v70 = v40;
    v72 = v31;
    v73 = v32;
    v74 = v33;
    v75 = v21;
    v71 = v41;
    objc_msgSend(v63, "enumerateObjectsUsingBlock:", v68);

  }
  if (v61)
  {
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __95__CAMTopBar__layoutControls_apply_withExpandedMenuButton_collapsingMenuButton_collapsingFrame___block_invoke_3;
    v64[3] = &unk_1EA32E178;
    v65 = v46;
    v66 = self;
    v67 = v44;
    objc_msgSend(v63, "enumerateObjectsUsingBlock:", v64);

  }
  if (a7)
  {
    v47 = objc_msgSend(v63, "indexOfObjectIdenticalTo:", v62);
    if (v47 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v48 = *MEMORY[0x1E0C9D648];
      v49 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v50 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v51 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    else
    {
      objc_msgSend(v44, "objectAtIndexedSubscript:", v47);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "CGRectValue");
      objc_msgSend(v62, "frameForAlignmentRect:expanded:", 0);
      v48 = v53;
      v49 = v54;
      v50 = v55;
      v51 = v56;

    }
    a7->origin.x = v48;
    a7->origin.y = v49;
    a7->size.width = v50;
    a7->size.height = v51;
  }

}

void __95__CAMTopBar__layoutControls_apply_withExpandedMenuButton_collapsingMenuButton_collapsingFrame___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double MinX;
  void *v12;
  id v13;
  CGRect v14;

  v13 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v13;
  else
    v3 = 0;
  v4 = v3;
  if (v4)
    objc_msgSend(v4, "intrinsicContentSizeForExpansion:", 0);
  else
    objc_msgSend(v13, "intrinsicContentSize");
  v7 = v5;
  v8 = v6;
  if (*(_BYTE *)(a1 + 120))
    v7 = *(double *)(a1 + 80);
  UIRoundToViewScale();
  v10 = v9;
  if (*(id *)(a1 + 40) == v13)
  {
    MinX = CGRectGetMinX(*(CGRect *)(a1 + 88));
  }
  else if (*(id *)(a1 + 48) == v13)
  {
    MinX = CGRectGetMaxX(*(CGRect *)(a1 + 88)) - v7;
  }
  else if (*(id *)(a1 + 56) == v13)
  {
    objc_msgSend(*(id *)(a1 + 64), "frame");
    CGRectGetMidX(v14);
    UIRoundToViewScale();
  }
  else
  {
    MinX = *MEMORY[0x1E0C9D648];
  }
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", MinX, v10, v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 72), "addObject:", v12);

}

- (void)_computeHorizontalLayoutForViewsBetweenLeftView:(id)a3 rightView:(id)a4 views:(id)a5 alignmentRects:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double MaxX;
  double MinX;
  unint64_t v35;
  double v36;
  double v37;
  unint64_t v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  id v47;
  CGRect v48;
  CGRect v49;

  v47 = a4;
  v9 = a5;
  v10 = a6;
  v11 = objc_msgSend(v9, "indexOfObjectIdenticalTo:", a3);
  v12 = objc_msgSend(v9, "indexOfObjectIdenticalTo:", v47);
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = v12;
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = v12 - v11;
      if (v12 - v11 != 1)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "CGRectValue");
        v17 = v16;
        v19 = v18;
        v21 = v20;
        v23 = v22;
        objc_msgSend(v10, "objectAtIndexedSubscript:", v13);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "CGRectValue");
        v26 = v25;
        v28 = v27;
        v30 = v29;
        v32 = v31;
        v48.origin.x = v17;
        v48.origin.y = v19;
        v48.size.width = v21;
        v48.size.height = v23;
        MaxX = CGRectGetMaxX(v48);
        v49.origin.x = v26;
        v49.origin.y = v28;
        v49.size.width = v30;
        v49.size.height = v32;
        MinX = CGRectGetMinX(v49);
        v35 = v11 + 1;
        if (v35 < v13)
        {
          v36 = MinX - MaxX;
          v37 = 0.0;
          v38 = v35;
          do
          {
            objc_msgSend(v10, "objectAtIndexedSubscript:", v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "CGRectValue");
            v37 = v37 + v40;

            ++v38;
          }
          while (v13 != v38);
          if (v35 < v13)
          {
            v41 = (v36 - v37) / (double)v14;
            v42 = MaxX + v41;
            do
            {
              objc_msgSend(v10, "objectAtIndexedSubscript:", v35);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "CGRectValue");
              v45 = v44;
              UIRoundToViewScale();
              v42 = v42 + v41 + v45;
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setObject:atIndexedSubscript:", v46, v35);

              ++v35;
            }
            while (v13 != v35);
          }
        }

      }
    }
  }

}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (double)_opacityForBackgroundStyle:(int64_t)a3
{
  double result;

  result = 0.0;
  if (a3 == 2)
    result = 1.0;
  if (!a3)
    return 0.3;
  return result;
}

- (double)_backgroundCornerRadiusForStyle:(int64_t)a3
{
  double result;

  result = 0.0;
  if (a3 == 1)
    return 4.0;
  return result;
}

- (BOOL)_backgroundMasksToBoundsForStyle:(int64_t)a3
{
  return a3 == 1;
}

- (CAMTopBar)initWithCoder:(id)a3
{
  CAMTopBar *v3;
  CAMTopBar *v4;
  CAMTopBar *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMTopBar;
  v3 = -[CAMTopBar initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    -[CAMTopBar _commonCAMTopBarInitialization](v3, "_commonCAMTopBarInitialization");
    v5 = v4;
  }

  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;
  CGPoint v14;
  CGRect v15;
  CGRect v16;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[CAMTopBar bounds](self, "bounds");
  v8 = fmax(y, CGRectGetMidY(v15));
  -[CAMTopBar _expandedMenuButton](self, "_expandedMenuButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v14.x = x;
  v14.y = v8;
  if (CGRectContainsPoint(v16, v14))
  {
    v10 = v9;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CAMTopBar;
    -[CAMTopBar hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  unsigned int v7;
  void *v8;
  int v9;
  objc_super v11;
  CGPoint v12;
  CGRect v13;

  y = a3.y;
  x = a3.x;
  v11.receiver = self;
  v11.super_class = (Class)CAMTopBar;
  v7 = -[CAMTopBar pointInside:withEvent:](&v11, sel_pointInside_withEvent_, a4);
  -[CAMTopBar _expandedMenuButton](self, "_expandedMenuButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v12.x = x;
  v12.y = y;
  v9 = v7 | CGRectContainsPoint(v13, v12);

  return v9;
}

- (double)_interpolatedFloatingBarHeight
{
  void *v2;
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGRect v13;

  -[CAMTopBar window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_referenceBounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v13.origin.x = v5;
  v13.origin.y = v7;
  v13.size.width = v9;
  v13.size.height = v11;
  return fmin(fmax(CGRectGetWidth(v13) * 0.0545455 + 17.5455, 35.0), 38.0);
}

- (void)_layoutFloatingStyle
{
  double v3;
  double v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  void *v10;
  void *v11;
  id v12;
  CGRect v13;
  CGRect v14;

  -[CAMTopBar bounds](self, "bounds");
  -[CAMTopBar alignmentRectForFrame:](self, "alignmentRectForFrame:");
  -[CAMTopBar _backgroundView](self, "_backgroundView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMTopBar _interpolatedFloatingBarHeight](self, "_interpolatedFloatingBarHeight");
  v4 = v3;
  UIRectCenteredIntegralRectScale();
  objc_msgSend(v12, "frameForAlignmentRect:", 0);
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  MidX = CGRectGetMidX(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  objc_msgSend(v12, "setCenter:", MidX, CGRectGetMidY(v14));
  objc_msgSend(v12, "setBounds:", 0.0, 0.0, 274.0, v4);
  -[CAMTopBar _allowedControls](self, "_allowedControls");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTopBar _expandedMenuButton](self, "_expandedMenuButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTopBar _layoutControls:apply:withExpandedMenuButton:collapsingMenuButton:collapsingFrame:](self, "_layoutControls:apply:withExpandedMenuButton:collapsingMenuButton:collapsingFrame:", v10, 1, v11, 0, 0);

}

void __95__CAMTopBar__layoutControls_apply_withExpandedMenuButton_collapsingMenuButton_collapsingFrame___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double MinX;
  void *v19;
  id v20;

  v20 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v20;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "intrinsicContentSizeForExpansion:", 0);
  else
    objc_msgSend(v20, "intrinsicContentSize");
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "CGRectValue");

  UIRectCenteredXInRectScale();
  v11 = v10;
  v13 = v12;
  v14 = v9;
  v16 = v15;
  if (*(id *)(a1 + 40) == v20)
  {
    MinX = CGRectGetMinX(*(CGRect *)(a1 + 56));
    if (v11 < MinX)
      v11 = MinX;
  }
  else if (*(id *)(a1 + 48) == v20)
  {
    v17 = CGRectGetMaxX(*(CGRect *)(a1 + 56)) - v9;
    if (v11 >= v17)
      v11 = v17;
  }
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v11, v13, v14, v16, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v19, a3);

}

void __95__CAMTopBar__layoutControls_apply_withExpandedMenuButton_collapsingMenuButton_collapsingFrame___block_invoke_3(id *a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;

  v19 = a2;
  if (a1[4] == v19)
  {
    objc_msgSend(a1[5], "expandedFrameForMenuButton:", v19);
    objc_msgSend(v19, "setFrame:");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v19;
    else
      v5 = 0;
    v6 = v5;
    objc_msgSend(a1[6], "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CGRectValue");
    if (v6)
      objc_msgSend(v6, "frameForAlignmentRect:expanded:", 0);
    else
      objc_msgSend(v19, "frameForAlignmentRect:");
    v12 = v8;
    v13 = v9;
    v14 = v10;
    v15 = v11;
    objc_msgSend(a1[5], "_controlsNeedingNonAnimatedLayout", v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsObject:", v19);

    if (v17)
    {
      v18 = (void *)MEMORY[0x1E0DC3F10];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __95__CAMTopBar__layoutControls_apply_withExpandedMenuButton_collapsingMenuButton_collapsingFrame___block_invoke_4;
      v20[3] = &unk_1EA328D90;
      v21 = v19;
      v22 = v12;
      v23 = v13;
      v24 = v14;
      v25 = v15;
      objc_msgSend(v18, "performWithoutAnimation:", v20);

    }
    else
    {
      objc_msgSend(v19, "setFrame:", v12, v13, v14, v15);
    }

  }
}

uint64_t __95__CAMTopBar__layoutControls_apply_withExpandedMenuButton_collapsingMenuButton_collapsingFrame___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

+ (BOOL)isFloatingStyle:(int64_t)a3
{
  return a3 == 1;
}

- (void)setBackgroundStyle:(int64_t)a3
{
  -[CAMTopBar setBackgroundStyle:animated:](self, "setBackgroundStyle:animated:", a3, 0);
}

uint64_t __41__CAMTopBar_setBackgroundStyle_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setElapsedTimeView:(id)a3
{
  CAMElapsedTimeView *v5;
  CAMElapsedTimeView *elapsedTimeView;
  CAMElapsedTimeView *v7;

  v5 = (CAMElapsedTimeView *)a3;
  elapsedTimeView = self->_elapsedTimeView;
  v7 = v5;
  if (elapsedTimeView != v5)
  {
    -[CAMElapsedTimeView removeFromSuperview](elapsedTimeView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_elapsedTimeView, a3);
    -[CAMTopBar addSubview:](self, "addSubview:", v7);
  }

}

- (void)setFlipButton:(id)a3
{
  CAMFlipButton *v5;
  CAMFlipButton *flipButton;
  double v7;
  CAMFlipButton *v8;

  v5 = (CAMFlipButton *)a3;
  flipButton = self->_flipButton;
  v8 = v5;
  if (flipButton != v5)
  {
    -[CAMFlipButton removeFromSuperview](flipButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_flipButton, a3);
    v7 = CAMPixelWidthForView(self);
    -[CAMFlipButton setTappableEdgeInsets:](self->_flipButton, "setTappableEdgeInsets:", v7 + 9.0, v7 + 9.0, v7 + 9.0, v7 + 9.0);
    -[CAMTopBar addSubview:](self, "addSubview:", v8);
  }

}

- (void)setApertureButton:(id)a3
{
  CEKApertureButton *v5;
  CEKApertureButton **p_apertureButton;
  CEKApertureButton *apertureButton;
  CAMTopBar *v8;
  CAMTopBar *v9;
  CEKApertureButton *v10;

  v5 = (CEKApertureButton *)a3;
  p_apertureButton = &self->_apertureButton;
  apertureButton = self->_apertureButton;
  if (apertureButton != v5)
  {
    v10 = v5;
    -[CEKApertureButton superview](apertureButton, "superview");
    v8 = (CAMTopBar *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[CEKApertureButton removeFromSuperview](*p_apertureButton, "removeFromSuperview");
    -[CEKApertureButton delegate](*p_apertureButton, "delegate");
    v9 = (CAMTopBar *)objc_claimAutoreleasedReturnValue();

    if (v9 == self)
      -[CEKApertureButton setDelegate:](*p_apertureButton, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_apertureButton, a3);
    -[CEKApertureButton setDelegate:](*p_apertureButton, "setDelegate:", self);
    -[CEKApertureButton setTappableEdgeInsets:](*p_apertureButton, "setTappableEdgeInsets:", 11.0, 11.0, 11.0, 11.0);
    -[CAMTopBar addSubview:](self, "addSubview:", v10);
    v5 = v10;
  }

}

- (void)setIntensityButton:(id)a3
{
  CAMIntensityButton *v5;
  CAMIntensityButton **p_intensityButton;
  CAMIntensityButton *intensityButton;
  CAMTopBar *v8;
  CAMIntensityButton *v9;

  v5 = (CAMIntensityButton *)a3;
  p_intensityButton = &self->_intensityButton;
  intensityButton = self->_intensityButton;
  if (intensityButton != v5)
  {
    v9 = v5;
    -[CAMIntensityButton superview](intensityButton, "superview");
    v8 = (CAMTopBar *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[CAMIntensityButton removeFromSuperview](*p_intensityButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_intensityButton, a3);
    -[CAMIntensityButton setTappableEdgeInsets:](*p_intensityButton, "setTappableEdgeInsets:", 11.0, 11.0, 11.0, 11.0);
    -[CAMTopBar addSubview:](self, "addSubview:", v9);
    v5 = v9;
  }

}

- (void)setLivePhotoButton:(id)a3
{
  CAMLivePhotoButton *v5;
  CAMLivePhotoButton **p_livePhotoButton;
  CAMLivePhotoButton *livePhotoButton;
  CAMLivePhotoButton *v8;

  v5 = (CAMLivePhotoButton *)a3;
  p_livePhotoButton = &self->_livePhotoButton;
  livePhotoButton = self->_livePhotoButton;
  v8 = v5;
  if (livePhotoButton != v5)
  {
    -[CAMLivePhotoButton removeFromSuperview](livePhotoButton, "removeFromSuperview");
    -[CAMExpandableMenuButton setExpandableMenuDelegate:](*p_livePhotoButton, "setExpandableMenuDelegate:", 0);
    objc_storeStrong((id *)&self->_livePhotoButton, a3);
    -[CAMExpandableMenuButton setExpandableMenuDelegate:](*p_livePhotoButton, "setExpandableMenuDelegate:", self);
    -[CAMExpandableMenuButton setTappableEdgeInsets:](v8, "setTappableEdgeInsets:", 11.0, 11.0, 11.0, 11.0);
    -[CAMTopBar addSubview:](self, "addSubview:", v8);
  }

}

- (void)setSharedLibraryButton:(id)a3
{
  CAMSharedLibraryButton *v5;
  CAMSharedLibraryButton **p_sharedLibraryButton;
  CAMSharedLibraryButton *sharedLibraryButton;
  CAMSharedLibraryButton *v8;

  v5 = (CAMSharedLibraryButton *)a3;
  p_sharedLibraryButton = &self->_sharedLibraryButton;
  sharedLibraryButton = self->_sharedLibraryButton;
  v8 = v5;
  if (sharedLibraryButton != v5)
  {
    -[CAMSharedLibraryButton removeFromSuperview](sharedLibraryButton, "removeFromSuperview");
    -[CAMExpandableMenuButton setExpandableMenuDelegate:](*p_sharedLibraryButton, "setExpandableMenuDelegate:", 0);
    objc_storeStrong((id *)&self->_sharedLibraryButton, a3);
    -[CAMExpandableMenuButton setExpandableMenuDelegate:](*p_sharedLibraryButton, "setExpandableMenuDelegate:", self);
    -[CAMExpandableMenuButton setTappableEdgeInsets:](v8, "setTappableEdgeInsets:", 11.0, 11.0, 11.0, 11.0);
    -[CAMTopBar addSubview:](self, "addSubview:", v8);
    -[CAMTopBar _setMode:style:animationDuration:animationOptions:](self, "_setMode:style:animationDuration:animationOptions:", -[CAMTopBar _mode](self, "_mode"), -[CAMTopBar style](self, "style"), 0, 0.0);
  }

}

- (void)setVideoConfigurationStatusIndicator:(id)a3
{
  CAMVideoConfigurationStatusIndicator *v5;
  CAMVideoConfigurationStatusIndicator **p_videoConfigurationStatusIndicator;
  CAMVideoConfigurationStatusIndicator *videoConfigurationStatusIndicator;
  CAMTopBar *v8;
  CAMTopBar *v9;
  CAMVideoConfigurationStatusIndicator *v10;

  v5 = (CAMVideoConfigurationStatusIndicator *)a3;
  p_videoConfigurationStatusIndicator = &self->_videoConfigurationStatusIndicator;
  videoConfigurationStatusIndicator = self->_videoConfigurationStatusIndicator;
  if (videoConfigurationStatusIndicator != v5)
  {
    v10 = v5;
    -[CAMVideoConfigurationStatusIndicator superview](videoConfigurationStatusIndicator, "superview");
    v8 = (CAMTopBar *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[CAMVideoConfigurationStatusIndicator removeFromSuperview](*p_videoConfigurationStatusIndicator, "removeFromSuperview");
    -[CAMControlStatusIndicator delegate](*p_videoConfigurationStatusIndicator, "delegate");
    v9 = (CAMTopBar *)objc_claimAutoreleasedReturnValue();

    if (v9 == self)
      -[CAMControlStatusIndicator setDelegate:](*p_videoConfigurationStatusIndicator, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_videoConfigurationStatusIndicator, a3);
    -[CAMControlStatusIndicator setDelegate:](*p_videoConfigurationStatusIndicator, "setDelegate:", self);
    -[CAMTopBar addSubview:](self, "addSubview:", *p_videoConfigurationStatusIndicator);
    v5 = v10;
  }

}

- (void)setPhotosButton:(id)a3
{
  CAMMessagesPhotosButton *v5;
  CAMMessagesPhotosButton **p_photosButton;
  CAMMessagesPhotosButton *photosButton;
  CAMMessagesPhotosButton *v8;

  v5 = (CAMMessagesPhotosButton *)a3;
  p_photosButton = &self->_photosButton;
  photosButton = self->_photosButton;
  if (photosButton != v5)
  {
    v8 = v5;
    -[CAMMessagesPhotosButton removeFromSuperview](photosButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_photosButton, a3);
    -[CAMMessagesPhotosButton setTappableEdgeInsets:](*p_photosButton, "setTappableEdgeInsets:", 11.0, 11.0, 11.0, 11.0);
    -[CAMTopBar addSubview:](self, "addSubview:", *p_photosButton);
    v5 = v8;
  }

}

- (void)setDoneButton:(id)a3
{
  PUReviewScreenDoneButton *v5;
  PUReviewScreenDoneButton **p_doneButton;
  PUReviewScreenDoneButton *doneButton;
  PUReviewScreenDoneButton *v8;

  v5 = (PUReviewScreenDoneButton *)a3;
  p_doneButton = &self->_doneButton;
  doneButton = self->_doneButton;
  if (doneButton != v5)
  {
    v8 = v5;
    -[PUReviewScreenDoneButton removeFromSuperview](doneButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_doneButton, a3);
    -[PUReviewScreenDoneButton setTappableEdgeInsets:](*p_doneButton, "setTappableEdgeInsets:", 11.0, 11.0, 11.0, 11.0);
    -[CAMTopBar addSubview:](self, "addSubview:", *p_doneButton);
    v5 = v8;
  }

}

- (id)_allowedControlsForPortraitMode
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_flashButton)
    objc_msgSend(v3, "addObject:");
  if (self->_HDRButton)
    objc_msgSend(v4, "addObject:");
  if (self->_timerButton)
    objc_msgSend(v4, "addObject:");
  if (self->_filterButton)
    objc_msgSend(v4, "addObject:");
  if (self->_intensityButton)
    objc_msgSend(v4, "addObject:");
  if (self->_apertureButton)
    objc_msgSend(v4, "addObject:");
  return v4;
}

- (id)_allowedControlsForSquareMode
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_flashButton)
    objc_msgSend(v3, "addObject:");
  if (self->_HDRButton)
    objc_msgSend(v4, "addObject:");
  if (self->_timerButton)
    objc_msgSend(v4, "addObject:");
  if (self->_filterButton)
    objc_msgSend(v4, "addObject:");
  if (self->_flipButton)
    objc_msgSend(v4, "addObject:");
  return v4;
}

- (id)_allowedControlsForVideoMode
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_flashButton)
    objc_msgSend(v3, "addObject:");
  if (self->_elapsedTimeView)
    objc_msgSend(v4, "addObject:");
  if (self->_videoConfigurationStatusIndicator)
    objc_msgSend(v4, "addObject:");
  if (self->_flipButton)
    objc_msgSend(v4, "addObject:");
  return v4;
}

- (id)_allowedControlsForPanoramaMode
{
  return (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
}

- (id)_allowedControlsForTimelapseMode
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_flipButton)
    objc_msgSend(v3, "addObject:");
  return v4;
}

- (id)_allowedControlsForMode:(int64_t)a3 style:(int64_t)a4
{
  uint64_t v6;
  void *v7;
  CAMSharedLibraryButton *sharedLibraryButton;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  switch(a3)
  {
    case 0:
      -[CAMTopBar _allowedControlsForStillImageMode](self, "_allowedControlsForStillImageMode");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 1:
    case 2:
      -[CAMTopBar _allowedControlsForVideoMode](self, "_allowedControlsForVideoMode");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      -[CAMTopBar _allowedControlsForPanoramaMode](self, "_allowedControlsForPanoramaMode");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 4:
      -[CAMTopBar _allowedControlsForSquareMode](self, "_allowedControlsForSquareMode");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 5:
      -[CAMTopBar _allowedControlsForTimelapseMode](self, "_allowedControlsForTimelapseMode");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 6:
      -[CAMTopBar _allowedControlsForPortraitMode](self, "_allowedControlsForPortraitMode");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v7 = (void *)v6;
      break;
    default:
      v7 = 0;
      break;
  }
  sharedLibraryButton = self->_sharedLibraryButton;
  if (sharedLibraryButton)
    objc_msgSend(v7, "insertObject:atIndex:", sharedLibraryButton, 0);
  v9 = +[CAMTopBar isFloatingStyle:](CAMTopBar, "isFloatingStyle:", a4);
  -[CAMTopBar photosButton](self, "photosButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && !v9)
  {
    -[CAMTopBar photosButton](self, "photosButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertObject:atIndex:", v11, 0);

  }
  -[CAMTopBar doneButton](self, "doneButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CAMTopBar doneButton](self, "doneButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v13);

  }
  return v7;
}

- (void)_setMode:(int64_t)a3 style:(int64_t)a4 animationDuration:(double)a5 animationOptions:(unint64_t)a6
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];

  if (a5 > 0.0)
    -[CAMTopBar layoutIfNeeded](self, "layoutIfNeeded");
  -[CAMTopBar _allowedControlsForMode:style:](self, "_allowedControlsForMode:style:", a3, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTopBar _allowedControls](self, "_allowedControls");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  self->__mode = a3;
  self->_style = a4;
  objc_storeStrong((id *)&self->__allowedControls, v11);
  -[CAMTopBar setNeedsLayout](self, "setNeedsLayout");
  if (a5 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "minusSet:", v14);

    -[CAMTopBar _setControlsNeedingNonAnimatedLayout:](self, "_setControlsNeedingNonAnimatedLayout:", v13);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __63__CAMTopBar__setMode_style_animationDuration_animationOptions___block_invoke;
    v15[3] = &unk_1EA328868;
    v15[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", a6 | 2, v15, 0, a5, 0.0);

  }
}

uint64_t __63__CAMTopBar__setMode_style_animationDuration_animationOptions___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "_setControlsNeedingNonAnimatedLayout:", 0);
}

- (BOOL)shouldHideApertureButtonForGraphConfiguration:(id)a3
{
  CAMTopBar *v3;
  void *v4;

  v3 = self;
  -[CAMTopBar apertureButton](self, "apertureButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[CAMTopBar _shouldHideSubview:](v3, "_shouldHideSubview:", v4);

  return (char)v3;
}

- (BOOL)shouldHideIntensityButtonForGraphConfiguration:(id)a3
{
  CAMTopBar *v3;
  void *v4;

  v3 = self;
  -[CAMTopBar intensityButton](self, "intensityButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[CAMTopBar _shouldHideSubview:](v3, "_shouldHideSubview:", v4);

  return (char)v3;
}

- (BOOL)shouldHideFlipButtonForGraphConfiguration:(id)a3
{
  CAMTopBar *v3;
  void *v4;

  v3 = self;
  -[CAMTopBar flipButton](self, "flipButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[CAMTopBar _shouldHideSubview:](v3, "_shouldHideSubview:", v4);

  return (char)v3;
}

- (BOOL)shouldHideSharedLibraryButtonForGraphConfiguration:(id)a3
{
  CAMTopBar *v3;
  void *v4;

  v3 = self;
  -[CAMTopBar sharedLibraryButton](self, "sharedLibraryButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[CAMTopBar _shouldHideSubview:](v3, "_shouldHideSubview:", v4);

  return (char)v3;
}

- (BOOL)shouldHideVideoConfigurationStatusIndicatorForGraphConfiguration:(id)a3
{
  CAMTopBar *v3;
  void *v4;

  v3 = self;
  -[CAMTopBar videoConfigurationStatusIndicator](self, "videoConfigurationStatusIndicator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[CAMTopBar _shouldHideSubview:](v3, "_shouldHideSubview:", v4);

  return (char)v3;
}

- (BOOL)shouldHidePhotosButtonForGraphConfiguration:(id)a3
{
  CAMTopBar *v3;
  void *v4;

  v3 = self;
  -[CAMTopBar photosButton](self, "photosButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[CAMTopBar _shouldHideSubview:](v3, "_shouldHideSubview:", v4);

  return (char)v3;
}

- (CGRect)collapsedFrameForMenuButton:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  CGRect result;

  v19 = 0u;
  v20 = 0u;
  v4 = a3;
  -[CAMTopBar _allowedControls](self, "_allowedControls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTopBar _layoutControls:apply:withExpandedMenuButton:collapsingMenuButton:collapsingFrame:](self, "_layoutControls:apply:withExpandedMenuButton:collapsingMenuButton:collapsingFrame:", v5, 0, 0, v4, &v19);

  objc_msgSend(v4, "intrinsicContentSizeForExpansion:", 0);
  v7 = v6;
  v9 = v8;

  if (*(double *)&v20 == v7 && *((double *)&v20 + 1) == v9)
  {
    -[CAMTopBar _expandedMenuButtonTappableInsets](self, "_expandedMenuButtonTappableInsets", v20);
    *(double *)&v19 = *(double *)&v19 - v14;
    *((double *)&v19 + 1) = *((double *)&v19 + 1) - v13;
    *(double *)&v20 = *(double *)&v20 - (-v11 - v14);
    *((double *)&v20 + 1) = *((double *)&v20 + 1) - (-v12 - v13);
  }
  v16 = *((double *)&v19 + 1);
  v15 = *(double *)&v19;
  v18 = *((double *)&v20 + 1);
  v17 = *(double *)&v20;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

uint64_t __41__CAMTopBar_collapseMenuButton_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "startCollapsingWithProposedFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (CGRect)expandedFrameForMenuButton:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect v35;
  CGRect v36;
  CGRect result;

  v4 = a3;
  v5 = objc_msgSend(v4, "orientation") - 3;
  -[CAMTopBar _backgroundView](self, "_backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  -[CAMTopBar alignmentRectForFrame:](self, "alignmentRectForFrame:");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[CAMTopBar collapsedFrameForMenuButton:](self, "collapsedFrameForMenuButton:", v4);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v4, "alignmentRectForFrame:expanded:", 0);
  if (v5 >= 2)
  {
    v20 = v12;
    v12 = v23;
  }
  else
  {
    v35.origin.x = v8;
    v35.origin.y = v10;
    v35.size.width = v12;
    v35.size.height = v14;
    CGRectGetHeight(v35);
    v36.origin.x = v16;
    v36.origin.y = v18;
    v36.size.width = v20;
    v36.size.height = v22;
    CGRectGetHeight(v36);
    UIRoundToViewScale();
    v10 = v24;
    v8 = v16;
  }
  objc_msgSend(v4, "frameForAlignmentRect:expanded:", 1, v8, v10, v20, v12);
  v28 = v27;
  v30 = v29;
  if (v5 < 2)
  {
    v22 = v26;
    v18 = v25;
  }

  v31 = v28;
  v32 = v18;
  v33 = v30;
  v34 = v22;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (void)expandMenuButton:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];
  id v28;

  v4 = a4;
  v20 = a3;
  if ((objc_msgSend(v20, "isExpanded") & 1) == 0)
  {
    -[CAMTopBar _expandedMenuButton](self, "_expandedMenuButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = MEMORY[0x1E0C809B0];
    if (v6)
    {
      v9 = (void *)MEMORY[0x1E0DC3F10];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __39__CAMTopBar_expandMenuButton_animated___block_invoke;
      v27[3] = &unk_1EA328A40;
      v27[4] = self;
      v28 = v6;
      objc_msgSend(v9, "performWithoutAnimation:", v27);

    }
    -[CAMTopBar _setExpandedMenuButton:](self, "_setExpandedMenuButton:", v20);
    -[CAMTopBar expandedFrameForMenuButton:](self, "expandedFrameForMenuButton:", v20);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = (void *)MEMORY[0x1E0DC3F10];
    v21[0] = v8;
    v21[1] = 3221225472;
    v21[2] = __39__CAMTopBar_expandMenuButton_animated___block_invoke_2;
    v21[3] = &unk_1EA328D90;
    v19 = v20;
    v22 = v19;
    v23 = v11;
    v24 = v13;
    v25 = v15;
    v26 = v17;
    objc_msgSend(v18, "performWithoutAnimation:", v21);
    objc_msgSend(v19, "finishExpansionAnimated:", v4);
    -[CAMTopBar _updateControlVisibilityAnimated:](self, "_updateControlVisibilityAnimated:", v4);

  }
}

uint64_t __39__CAMTopBar_expandMenuButton_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "collapsedFrameForMenuButton:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "startCollapsingWithProposedFrame:");
  return objc_msgSend(*(id *)(a1 + 40), "finishCollapsingAnimated:", 0);
}

uint64_t __39__CAMTopBar_expandMenuButton_animated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "startExpansionWithProposedFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (id)touchingRecognizersToCancel
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CAMTopBar _allowedControls](self, "_allowedControls", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "touchingGestureRecognizer");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)_iterateViewsInHUDManager:(id)a3 forHUDItem:(id)a4
{
  id v6;
  void (**v7)(id, id, _BYTE *);
  void *v8;
  id v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char v24;
  _BYTE v25[128];
  uint64_t v26;
  CGPoint v27;
  CGRect v28;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id, _BYTE *))a4;
  v24 = 0;
  -[CAMTopBar _expandedMenuButton](self, "_expandedMenuButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CAMTopBar _expandedMenuButton](self, "_expandedMenuButton");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9, &v24);
  }
  else
  {
    -[CAMTopBar _allowedControls](self, "_allowedControls");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationOfAccessibilityGestureInView:", self);
    v12 = v11;
    v14 = v13;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = v10;
    v15 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
LABEL_5:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v9);
        v19 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v18);
        objc_msgSend(v19, "frame", (_QWORD)v20);
        v27.x = v12;
        v27.y = v14;
        if (CGRectContainsPoint(v28, v27))
        {
          if (objc_msgSend(v19, "conformsToProtocol:", &unk_1F03116F0))
          {
            v7[2](v7, v19, &v24);
            if (v24)
              break;
          }
        }
        if (v16 == ++v18)
        {
          v16 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
          if (v16)
            goto LABEL_5;
          break;
        }
      }
    }

  }
}

- (id)hudItemForAccessibilityHUDManager:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__20;
  v15 = __Block_byref_object_dispose__20;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__CAMTopBar_hudItemForAccessibilityHUDManager___block_invoke;
  v8[3] = &unk_1EA328DB8;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  -[CAMTopBar _iterateViewsInHUDManager:forHUDItem:](self, "_iterateViewsInHUDManager:forHUDItem:", v5, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __47__CAMTopBar_hudItemForAccessibilityHUDManager___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a2, "hudItemForAccessibilityHUDManager:", *(_QWORD *)(a1 + 32));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = 1;
}

- (void)selectedByAccessibilityHUDManager:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__CAMTopBar_selectedByAccessibilityHUDManager___block_invoke;
  v6[3] = &unk_1EA328DE0;
  v7 = v4;
  v5 = v4;
  -[CAMTopBar _iterateViewsInHUDManager:forHUDItem:](self, "_iterateViewsInHUDManager:forHUDItem:", v5, v6);

}

uint64_t __47__CAMTopBar_selectedByAccessibilityHUDManager___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "selectedByAccessibilityHUDManager:", *(_QWORD *)(a1 + 32));
  *a3 = 1;
  return result;
}

- (CEKApertureButton)apertureButton
{
  return self->_apertureButton;
}

- (CAMIntensityButton)intensityButton
{
  return self->_intensityButton;
}

- (CAMSharedLibraryButton)sharedLibraryButton
{
  return self->_sharedLibraryButton;
}

- (CAMMessagesPhotosButton)photosButton
{
  return self->_photosButton;
}

- (CAMVideoConfigurationStatusIndicator)videoConfigurationStatusIndicator
{
  return self->_videoConfigurationStatusIndicator;
}

- (NSSet)_controlsNeedingNonAnimatedLayout
{
  return self->__controlsNeedingNonAnimatedLayout;
}

- (void)_setControlsNeedingNonAnimatedLayout:(id)a3
{
  objc_storeStrong((id *)&self->__controlsNeedingNonAnimatedLayout, a3);
}

- (void)_setExpandedMenuButton:(id)a3
{
  objc_storeStrong((id *)&self->__expandedMenuButton, a3);
}

- (UIEdgeInsets)_expandedMenuButtonTappableInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->__expandedMenuButtonTappableInsets.top;
  left = self->__expandedMenuButtonTappableInsets.left;
  bottom = self->__expandedMenuButtonTappableInsets.bottom;
  right = self->__expandedMenuButtonTappableInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)_setExpandedMenuButtonTappableInsets:(UIEdgeInsets)a3
{
  self->__expandedMenuButtonTappableInsets = a3;
}

- (int64_t)_mode
{
  return self->__mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__expandedMenuButton, 0);
  objc_storeStrong((id *)&self->__controlsNeedingNonAnimatedLayout, 0);
  objc_storeStrong((id *)&self->__allowedControls, 0);
  objc_storeStrong((id *)&self->__backgroundView, 0);
  objc_storeStrong((id *)&self->_videoConfigurationStatusIndicator, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_photosButton, 0);
  objc_storeStrong((id *)&self->_sharedLibraryButton, 0);
  objc_storeStrong((id *)&self->_livePhotoButton, 0);
  objc_storeStrong((id *)&self->_timerButton, 0);
  objc_storeStrong((id *)&self->_intensityButton, 0);
  objc_storeStrong((id *)&self->_apertureButton, 0);
  objc_storeStrong((id *)&self->_filterButton, 0);
  objc_storeStrong((id *)&self->_flipButton, 0);
  objc_storeStrong((id *)&self->_HDRButton, 0);
  objc_storeStrong((id *)&self->_elapsedTimeView, 0);
  objc_storeStrong((id *)&self->_flashButton, 0);
  objc_destroyWeak((id *)&self->_visibilityUpdateDelegate);
}

@end
