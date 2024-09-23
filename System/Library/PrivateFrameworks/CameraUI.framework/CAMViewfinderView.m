@implementation CAMViewfinderView

- (CAMViewfinderView)initWithLayoutStyle:(int64_t)a3
{
  CAMViewfinderView *v4;
  CAMViewfinderView *v5;
  CAMViewfinderView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMViewfinderView;
  v4 = -[CAMViewfinderView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    -[CAMViewfinderView _commonCAMViewfinderViewInitializationWithLayoutStyle:](v4, "_commonCAMViewfinderViewInitializationWithLayoutStyle:", a3);
    v6 = v5;
  }

  return v5;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)_commonCAMViewfinderViewInitializationWithLayoutStyle:(int64_t)a3
{
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIView *v10;
  UIView *previewContainerView;
  UIView *v12;
  void *v13;
  CAMPreviewContainerMaskingView *v14;
  CAMPreviewContainerMaskingView *previewContainerMaskingView;
  CAMPreviewContainerMaskingView *v16;
  void *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *descriptionOverlayViewByKey;

  self->_layoutStyle = a3;
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMViewfinderView setBackgroundColor:](self, "setBackgroundColor:", v4);

  v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = (UIView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
  previewContainerView = self->__previewContainerView;
  self->__previewContainerView = v10;

  v12 = self->__previewContainerView;
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v13);

  v14 = -[CAMPreviewContainerMaskingView initWithFrame:]([CAMPreviewContainerMaskingView alloc], "initWithFrame:", v6, v7, v8, v9);
  previewContainerMaskingView = self->__previewContainerMaskingView;
  self->__previewContainerMaskingView = v14;

  v16 = self->__previewContainerMaskingView;
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPreviewContainerMaskingView setBackgroundColor:](v16, "setBackgroundColor:", v17);

  -[CAMPreviewContainerMaskingView addSubview:](self->__previewContainerMaskingView, "addSubview:", self->__previewContainerView);
  -[CAMViewfinderView _updateModernLayout](self, "_updateModernLayout");
  -[CAMViewfinderView addSubview:](self, "addSubview:", self->__previewContainerMaskingView);
  v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  descriptionOverlayViewByKey = self->__descriptionOverlayViewByKey;
  self->__descriptionOverlayViewByKey = v18;

}

- (void)setPreviewView:(id)a3
{
  CAMPreviewView *v5;
  CAMPreviewView **p_previewView;
  void *v7;
  CAMPreviewView *v8;

  v5 = (CAMPreviewView *)a3;
  p_previewView = &self->_previewView;
  if (self->_previewView != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_previewView, a3);
    -[CAMViewfinderView _previewContainerView](self, "_previewContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", *p_previewView);

    v5 = v8;
  }

}

- (UIView)_previewContainerView
{
  return self->__previewContainerView;
}

- (void)setTopBar:(id)a3
{
  CAMTopBar *v5;
  CAMTopBar *topBar;
  CAMTopBar *v7;

  v5 = (CAMTopBar *)a3;
  topBar = self->_topBar;
  if (topBar != v5)
  {
    v7 = v5;
    -[CAMTopBar removeFromSuperview](topBar, "removeFromSuperview");
    objc_storeStrong((id *)&self->_topBar, a3);
    -[CAMViewfinderView addSubview:](self, "addSubview:", self->_topBar);
    v5 = v7;
  }

}

- (void)setBottomBar:(id)a3
{
  CAMBottomBar *v5;
  CAMBottomBar *bottomBar;
  CAMBottomBar *v7;

  v5 = (CAMBottomBar *)a3;
  bottomBar = self->_bottomBar;
  if (bottomBar != v5)
  {
    v7 = v5;
    -[CAMBottomBar removeFromSuperview](bottomBar, "removeFromSuperview");
    objc_storeStrong((id *)&self->_bottomBar, a3);
    -[CAMViewfinderView addSubview:](self, "addSubview:", self->_bottomBar);
    v5 = v7;
  }

}

- (void)setVisibilityDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_visibilityDelegate, a3);
}

- (void)setUseCreativeControls:(BOOL)a3
{
  self->_useCreativeControls = a3;
}

- (CAMBottomBar)bottomBar
{
  return self->_bottomBar;
}

- (void)setShutterButton:(id)a3
{
  CUShutterButton *v5;
  CUShutterButton *shutterButton;
  CUShutterButton *v7;

  v5 = (CUShutterButton *)a3;
  shutterButton = self->_shutterButton;
  if (shutterButton != v5)
  {
    v7 = v5;
    -[CUShutterButton removeFromSuperview](shutterButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_shutterButton, a3);
    -[CAMViewfinderView addSubview:](self, "addSubview:", self->_shutterButton);
    v5 = v7;
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
    -[CAMViewfinderView addSubview:](self, "addSubview:", v8);
  }

}

- (void)setShutterIndicatorView:(id)a3
{
  CAMShutterIndicatorView *v5;
  CAMShutterIndicatorView *shutterIndicatorView;
  CAMShutterIndicatorView *v7;

  v5 = (CAMShutterIndicatorView *)a3;
  shutterIndicatorView = self->_shutterIndicatorView;
  v7 = v5;
  if (shutterIndicatorView != v5)
  {
    -[CAMShutterIndicatorView removeFromSuperview](shutterIndicatorView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_shutterIndicatorView, a3);
    -[CAMViewfinderView addSubview:](self, "addSubview:", v7);
  }

}

- (void)setFocusAndExposureLockBadge:(id)a3
{
  CAMFocusLockBadge *v5;
  CAMFocusLockBadge **p_focusAndExposureLockBadge;
  CAMFocusLockBadge *focusAndExposureLockBadge;
  CAMViewfinderView *v8;
  void *v9;
  char v10;
  CAMFocusLockBadge *v11;

  v5 = (CAMFocusLockBadge *)a3;
  p_focusAndExposureLockBadge = &self->_focusAndExposureLockBadge;
  focusAndExposureLockBadge = self->_focusAndExposureLockBadge;
  if (focusAndExposureLockBadge != v5)
  {
    v11 = v5;
    -[CAMFocusLockBadge removeFromSuperview](focusAndExposureLockBadge, "removeFromSuperview");
    -[CEKBadgeView delegate](*p_focusAndExposureLockBadge, "delegate");
    v8 = (CAMViewfinderView *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[CEKBadgeView setDelegate:](*p_focusAndExposureLockBadge, "setDelegate:", 0);
    -[CAMFocusLockBadge setAlpha:](*p_focusAndExposureLockBadge, "setAlpha:", 1.0);
    objc_storeStrong((id *)&self->_focusAndExposureLockBadge, a3);
    -[CEKBadgeView setDelegate:](*p_focusAndExposureLockBadge, "setDelegate:", self);
    -[CAMViewfinderView visibleTopBadges](self, "visibleTopBadges");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", *p_focusAndExposureLockBadge);

    if ((v10 & 1) == 0)
      -[CAMFocusLockBadge setAlpha:](*p_focusAndExposureLockBadge, "setAlpha:", 0.0);
    -[CAMViewfinderView addSubview:](self, "addSubview:", v11);
    v5 = v11;
  }

}

- (NSArray)visibleTopBadges
{
  return self->_visibleTopBadges;
}

- (void)setVisibleTopBadges:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *visibleTopBadges;
  void *v10;
  id v11;
  id v12;

  v4 = a4;
  v12 = a3;
  if ((objc_msgSend(v12, "isEqualToArray:", self->_visibleTopBadges) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", self->_visibleTopBadges);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSArray *)objc_msgSend(v12, "copy");
    visibleTopBadges = self->_visibleTopBadges;
    self->_visibleTopBadges = v8;

    v10 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v10, "minusSet:", v7);
    v11 = v7;
    objc_msgSend(v11, "minusSet:", v6);
    -[CAMViewfinderView _enforceBadgeSubviewOrderingWithAppearingBadges:](self, "_enforceBadgeSubviewOrderingWithAppearingBadges:", v11);
    -[CAMViewfinderView _layoutTopBadgesForLayoutStyle:appearingBadges:disappearingBadges:animated:](self, "_layoutTopBadgesForLayoutStyle:appearingBadges:disappearingBadges:animated:", -[CAMViewfinderView layoutStyle](self, "layoutStyle"), v11, v10, v4);

  }
}

- (void)_enforceBadgeSubviewOrderingWithAppearingBadges:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E20];
  -[CAMViewfinderView visibleTopBadges](self, "visibleTopBadges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "minusSet:", v4);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        -[CAMViewfinderView bringSubviewToFront:](self, "bringSubviewToFront:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v10);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        -[CAMViewfinderView bringSubviewToFront:](self, "bringSubviewToFront:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v17++), (_QWORD)v19);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v15);
  }

  -[CAMViewfinderView timerIndicatorView](self, "timerIndicatorView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    -[CAMViewfinderView bringSubviewToFront:](self, "bringSubviewToFront:", v18);

}

- (CAMTimerIndicatorView)timerIndicatorView
{
  return self->_timerIndicatorView;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)_layoutTopBadgesForLayoutStyle:(int64_t)a3 appearingBadges:(id)a4 disappearingBadges:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  id v12;

  v6 = a6;
  v12 = a4;
  v10 = a5;
  if ((unint64_t)a3 < 2)
    goto LABEL_4;
  if (a3 == 2)
  {
    -[CAMViewfinderView livePhotoBadge](self, "livePhotoBadge");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMViewfinderView _layoutBadgeForTinyLayoutStyle:animated:](self, "_layoutBadgeForTinyLayoutStyle:animated:", v11, v6);

    goto LABEL_6;
  }
  if (a3 == 4)
LABEL_4:
    -[CAMViewfinderView _layoutBadgeTrayForLayoutStyle:appearingBadges:disappearingBadges:animated:](self, "_layoutBadgeTrayForLayoutStyle:appearingBadges:disappearingBadges:animated:", a3, v12, v10, v6);
LABEL_6:

}

- (void)_layoutBadgeTrayForLayoutStyle:(int64_t)a3 appearingBadges:(id)a4 disappearingBadges:(id)a5 animated:(BOOL)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  double v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _BOOL4 v24;
  _QWORD v25[4];
  id v26;
  id v27;
  CAMViewfinderView *v28;
  int64_t v29;
  _QWORD v30[5];
  id v31;
  int64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v24 = a6;
  v38 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[CAMViewfinderView visibleTopBadges](self, "visibleTopBadges");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v34 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (objc_msgSend(v9, "containsObject:", v17))
          objc_msgSend(v11, "addObject:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v14);
  }
  if (v24)
    v18 = 0.25;
  else
    v18 = 0.0;

  v19 = MEMORY[0x1E0C809B0];
  v20 = (void *)MEMORY[0x1E0DC3F10];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __96__CAMViewfinderView__layoutBadgeTrayForLayoutStyle_appearingBadges_disappearingBadges_animated___block_invoke;
  v30[3] = &unk_1EA32A7C0;
  v30[4] = self;
  v21 = v11;
  v31 = v21;
  v32 = a3;
  objc_msgSend(v20, "performWithoutAnimation:", v30);
  v25[0] = v19;
  v25[1] = 3221225472;
  v25[2] = __96__CAMViewfinderView__layoutBadgeTrayForLayoutStyle_appearingBadges_disappearingBadges_animated___block_invoke_2;
  v25[3] = &unk_1EA3292E8;
  v26 = v10;
  v27 = v21;
  v28 = self;
  v29 = a3;
  v22 = v21;
  v23 = v10;
  +[CAMView animateIfNeededWithDuration:options:animations:completion:](CAMView, "animateIfNeededWithDuration:options:animations:completion:", 0, v25, 0, v18);

}

uint64_t __96__CAMViewfinderView__layoutBadgeTrayForLayoutStyle_appearingBadges_disappearingBadges_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutBadgeTrayWithBadges:layoutStyle:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_layoutBadgeTrayWithBadges:(id)a3 layoutStyle:(int64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  double v15;
  uint64_t v16;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v21;
  double v22;
  double v23;
  double MinX;
  double MaxX;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  double v36;
  uint64_t v37;
  id v38;
  _BOOL4 v39;
  id obj;
  __int128 v41;
  _OWORD v43[3];
  _QWORD v44[5];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v7 = v6;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v38 = v5;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    v10 = 0.0;
    v11 = 0.0;
    if (v9)
    {
      v12 = v9;
      v13 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v58 != v13)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "intrinsicContentSize");
          v11 = v11 + v15;
        }
        v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
      }
      while (v12);
    }

    v16 = -[CAMViewfinderView orientation](self, "orientation");
    v39 = +[CAMBottomBar wantsVerticalBarForLayoutStyle:](CAMBottomBar, "wantsVerticalBarForLayoutStyle:", a4);
    -[CAMViewfinderView _frameForBadgeTrayForLayoutStyle:orientation:](self, "_frameForBadgeTrayForLayoutStyle:orientation:", a4, v16);
    x = v64.origin.x;
    y = v64.origin.y;
    width = v64.size.width;
    height = v64.size.height;
    v21 = CGRectGetWidth(v64);
    v65.origin.x = x;
    v65.origin.y = y;
    v65.size.width = width;
    v65.size.height = height;
    v22 = CGRectGetHeight(v65);
    if (v21 >= v22)
      v22 = v21;
    v23 = (v22 - (v11 + (double)(unint64_t)(v7 - 1) * 5.0)) * 0.5;
    switch(v16)
    {
      case 0:
      case 1:
        goto LABEL_12;
      case 2:
        if (v39)
        {
          v67.origin.x = x;
          v67.origin.y = y;
          v67.size.width = width;
          v67.size.height = height;
          MaxX = CGRectGetMaxX(v67);
LABEL_18:
          v10 = MaxX - v23;
        }
        else
        {
LABEL_12:
          v66.origin.x = x;
          v66.origin.y = y;
          v66.size.width = width;
          v66.size.height = height;
          MinX = CGRectGetMinX(v66);
LABEL_16:
          v10 = v23 + MinX;
        }
LABEL_19:
        v55 = 0u;
        v56 = 0u;
        v54 = 0u;
        CAMOrientationTransform(v16, (uint64_t)&v54);
        UIRectGetCenter();
        v27 = v26;
        v29 = v28;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        obj = v8;
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v51;
          v41 = *MEMORY[0x1E0C9D538];
          v33 = MEMORY[0x1E0C809B0];
LABEL_21:
          v34 = 0;
          while (2)
          {
            if (*(_QWORD *)v51 != v32)
              objc_enumerationMutation(obj);
            v35 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v34);
            objc_msgSend(v35, "intrinsicContentSize");
            v47 = v41;
            v48 = v41;
            *(double *)&v49 = v36;
            *((_QWORD *)&v49 + 1) = v37;
            switch(v16)
            {
              case 0:
              case 1:
                goto LABEL_25;
              case 2:
                if (v39)
                {
                  *(double *)&v47 = v10 + v36 * -0.5;
                  *((double *)&v47 + 1) = v29;
LABEL_31:
                  v10 = v10 - (v36 + 5.0);
                }
                else
                {
LABEL_25:
                  *(double *)&v47 = v10 + v36 * 0.5;
                  *((double *)&v47 + 1) = v29 + -2.0;
LABEL_29:
                  v10 = v10 + v36 + 5.0;
                }
LABEL_32:
                +[CAMView ceilBounds:andRoundCenter:toViewScale:](CAMView, "ceilBounds:andRoundCenter:toViewScale:", &v48, &v47, self);
                v44[0] = v33;
                v44[1] = 3221225472;
                v44[2] = __60__CAMViewfinderView__layoutBadgeTrayWithBadges_layoutStyle___block_invoke;
                v44[3] = &unk_1EA328D90;
                v44[4] = v35;
                v45 = v48;
                v46 = v49;
                objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v44);
                objc_msgSend(v35, "setCenter:", v47);
                v43[0] = v54;
                v43[1] = v55;
                v43[2] = v56;
                objc_msgSend(v35, "setTransform:", v43);
                if (v31 != ++v34)
                  continue;
                v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
                if (!v31)
                  goto LABEL_34;
                goto LABEL_21;
              case 3:
                *(_QWORD *)&v47 = v27;
                *((double *)&v47 + 1) = v10 + v36 * 0.5;
                goto LABEL_29;
              case 4:
                *(_QWORD *)&v47 = v27;
                *((double *)&v47 + 1) = v10 + v36 * -0.5;
                goto LABEL_31;
              default:
                goto LABEL_32;
            }
          }
        }
LABEL_34:

        v5 = v38;
        break;
      case 3:
        v68.origin.x = x;
        v68.origin.y = y;
        v68.size.width = width;
        v68.size.height = height;
        MinX = CGRectGetMinY(v68);
        goto LABEL_16;
      case 4:
        v69.origin.x = x;
        v69.origin.y = y;
        v69.size.width = width;
        v69.size.height = height;
        MaxX = CGRectGetMaxY(v69);
        goto LABEL_18;
      default:
        goto LABEL_19;
    }
  }

}

- (void)setFlashBadge:(id)a3
{
  CAMFlashBadge *v5;
  CAMFlashBadge **p_flashBadge;
  CAMFlashBadge *flashBadge;
  CAMViewfinderView *v8;
  void *v9;
  char v10;
  CAMFlashBadge *v11;

  v5 = (CAMFlashBadge *)a3;
  p_flashBadge = &self->_flashBadge;
  flashBadge = self->_flashBadge;
  if (flashBadge != v5)
  {
    v11 = v5;
    -[CAMFlashBadge removeFromSuperview](flashBadge, "removeFromSuperview");
    -[CEKBadgeView delegate](*p_flashBadge, "delegate");
    v8 = (CAMViewfinderView *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[CEKBadgeView setDelegate:](*p_flashBadge, "setDelegate:", 0);
    -[CAMFlashBadge setAlpha:](*p_flashBadge, "setAlpha:", 1.0);
    objc_storeStrong((id *)&self->_flashBadge, a3);
    -[CEKBadgeView setDelegate:](*p_flashBadge, "setDelegate:", self);
    -[CAMViewfinderView visibleTopBadges](self, "visibleTopBadges");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", *p_flashBadge);

    if ((v10 & 1) == 0)
      -[CAMFlashBadge setAlpha:](*p_flashBadge, "setAlpha:", 0.0);
    -[CAMViewfinderView addSubview:](self, "addSubview:", v11);
    v5 = v11;
  }

}

- (void)setTimerIndicatorView:(id)a3
{
  CAMTimerIndicatorView *v5;
  CAMTimerIndicatorView *timerIndicatorView;
  CAMTimerIndicatorView *v7;

  v5 = (CAMTimerIndicatorView *)a3;
  timerIndicatorView = self->_timerIndicatorView;
  v7 = v5;
  if (timerIndicatorView != v5)
  {
    -[CAMTimerIndicatorView removeFromSuperview](timerIndicatorView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_timerIndicatorView, a3);
    -[CAMViewfinderView addSubview:](self, "addSubview:", v7);
    -[CAMViewfinderView _enforceBadgeSubviewOrderingWithAppearingBadges:](self, "_enforceBadgeSubviewOrderingWithAppearingBadges:", 0);
  }

}

- (void)setHDRBadge:(id)a3
{
  CAMHDRBadge *v5;
  CAMHDRBadge **p_HDRBadge;
  CAMHDRBadge *HDRBadge;
  CAMViewfinderView *v8;
  void *v9;
  char v10;
  CAMHDRBadge *v11;

  v5 = (CAMHDRBadge *)a3;
  p_HDRBadge = &self->_HDRBadge;
  HDRBadge = self->_HDRBadge;
  if (HDRBadge != v5)
  {
    v11 = v5;
    -[CAMHDRBadge removeFromSuperview](HDRBadge, "removeFromSuperview");
    -[CEKBadgeView delegate](*p_HDRBadge, "delegate");
    v8 = (CAMViewfinderView *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[CEKBadgeView setDelegate:](*p_HDRBadge, "setDelegate:", 0);
    -[CAMHDRBadge setAlpha:](*p_HDRBadge, "setAlpha:", 1.0);
    objc_storeStrong((id *)&self->_HDRBadge, a3);
    -[CEKBadgeView setDelegate:](*p_HDRBadge, "setDelegate:", self);
    -[CAMViewfinderView visibleTopBadges](self, "visibleTopBadges");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", *p_HDRBadge);

    if ((v10 & 1) == 0)
      -[CAMHDRBadge setAlpha:](*p_HDRBadge, "setAlpha:", 0.0);
    -[CAMViewfinderView addSubview:](self, "addSubview:", v11);
    v5 = v11;
  }

}

- (void)setBurstIndicatorView:(id)a3
{
  CAMBurstIndicatorView *v5;
  CAMBurstIndicatorView *burstIndicatorView;
  CAMBurstIndicatorView *v7;

  v5 = (CAMBurstIndicatorView *)a3;
  burstIndicatorView = self->_burstIndicatorView;
  v7 = v5;
  if (burstIndicatorView != v5)
  {
    -[CAMBurstIndicatorView removeFromSuperview](burstIndicatorView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_burstIndicatorView, a3);
    -[CAMViewfinderView addSubview:](self, "addSubview:", v7);
  }

}

- (CAMTopBar)topBar
{
  return self->_topBar;
}

- (void)setQrCodeInstructionLabel:(id)a3
{
  CAMQRCodeInstructionLabel *v5;
  CAMQRCodeInstructionLabel **p_qrCodeInstructionLabel;
  CAMQRCodeInstructionLabel *qrCodeInstructionLabel;
  CAMViewfinderView *v8;
  CAMQRCodeInstructionLabel *v9;

  v5 = (CAMQRCodeInstructionLabel *)a3;
  p_qrCodeInstructionLabel = &self->_qrCodeInstructionLabel;
  qrCodeInstructionLabel = self->_qrCodeInstructionLabel;
  if (qrCodeInstructionLabel != v5)
  {
    v9 = v5;
    -[CAMQRCodeInstructionLabel removeFromSuperview](qrCodeInstructionLabel, "removeFromSuperview");
    -[CAMInstructionLabel delegate](*p_qrCodeInstructionLabel, "delegate");
    v8 = (CAMViewfinderView *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[CAMInstructionLabel setDelegate:](*p_qrCodeInstructionLabel, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_qrCodeInstructionLabel, a3);
    -[CAMInstructionLabel setDelegate:](*p_qrCodeInstructionLabel, "setDelegate:", self);
    -[CAMViewfinderView addSubview:](self, "addSubview:", v9);
    v5 = v9;
  }

}

- (void)setDesiredAspectRatio:(int64_t)a3
{
  if (self->_desiredAspectRatio != a3)
  {
    self->_desiredAspectRatio = a3;
    -[CAMViewfinderView _updateBarExtensionViewsIfNecessary](self, "_updateBarExtensionViewsIfNecessary");
    -[CAMViewfinderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMaskingAspectRatio:(int64_t)a3
{
  -[CAMViewfinderView setMaskingAspectRatio:animated:](self, "setMaskingAspectRatio:animated:", a3, 0);
}

- (void)setMaskingAspectRatio:(int64_t)a3 animated:(BOOL)a4
{
  _QWORD v6[5];

  if (self->_maskingAspectRatio != a3)
  {
    if (a4)
    {
      -[CAMViewfinderView layoutIfNeeded](self, "layoutIfNeeded");
      self->_maskingAspectRatio = a3;
      -[CAMViewfinderView setNeedsLayout](self, "setNeedsLayout");
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __52__CAMViewfinderView_setMaskingAspectRatio_animated___block_invoke;
      v6[3] = &unk_1EA328868;
      v6[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 6, v6, 0, 0.5, 0.0, 400.0, 0.0);
    }
    else
    {
      self->_maskingAspectRatio = a3;
      -[CAMViewfinderView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (CAMPreviewView)previewView
{
  return self->_previewView;
}

- (void)setPreviewViewOrientation:(int64_t)a3
{
  self->_previewViewOrientation = a3;
}

- (void)setAutomaticallyAdjustsTopBarOrientation:(BOOL)a3
{
  if (self->_automaticallyAdjustsTopBarOrientation != a3)
  {
    self->_automaticallyAdjustsTopBarOrientation = a3;
    -[CAMViewfinderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  int64_t orientation;
  _BOOL4 v5;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[5];
  _QWORD v31[5];
  BOOL v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  orientation = self->_orientation;
  if (orientation != a3)
  {
    v5 = a4;
    v8 = -[CAMViewfinderView layoutStyle](self, "layoutStyle");
    if (v5)
    {
      -[CAMViewfinderView layoutIfNeeded](self, "layoutIfNeeded");
      self->_orientation = a3;
      if (v8 <= 4 && ((1 << v8) & 0x15) != 0 && (unint64_t)(a3 - 1) < 2)
      {
        if ((unint64_t)(orientation - 1) > 1)
        {
          v10 = 0.0;
          v9 = 0.2;
          v12 = 0.3;
          v11 = 0.25;
        }
        else
        {
          v9 = 0.0;
          v10 = 0.1;
          v11 = 0.2;
          v12 = 0.2;
        }
      }
      else
      {
        v11 = 0.25;
        v10 = 0.0;
        v9 = 0.2;
        v12 = 0.3;
      }
      v13 = (void *)MEMORY[0x1E0C99E20];
      -[CAMViewfinderView visibleTopBadges](self, "visibleTopBadges");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setWithArray:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v16 = v15;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v34;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v34 != v19)
              objc_enumerationMutation(v16);
            -[CAMViewfinderView _createPlaceholderSnapshotAndPerformDoubleSidedFadeForView:fadeOutDuration:fadeOutDelay:fadeInDuration:fadeInDelay:](self, "_createPlaceholderSnapshotAndPerformDoubleSidedFadeForView:fadeOutDuration:fadeOutDelay:fadeInDuration:fadeInDelay:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v20++), v12, v10, v11, v9);
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v18);
      }

      -[CAMViewfinderView visibilityDelegate](self, "visibilityDelegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "shouldHidePortraitModeInstructionLabel") & 1) == 0)
      {
        -[CAMViewfinderView portraitModeInstructionLabel](self, "portraitModeInstructionLabel");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMViewfinderView _createPlaceholderSnapshotAndPerformDoubleSidedFadeForView:fadeOutDuration:fadeOutDelay:fadeInDuration:fadeInDelay:](self, "_createPlaceholderSnapshotAndPerformDoubleSidedFadeForView:fadeOutDuration:fadeOutDelay:fadeInDuration:fadeInDelay:", v22, v12, v10, v11, v9);

      }
      if ((objc_msgSend(v21, "shouldHideQRCodeInstructionLabel") & 1) == 0)
      {
        -[CAMViewfinderView qrCodeInstructionLabel](self, "qrCodeInstructionLabel");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMViewfinderView _createPlaceholderSnapshotAndPerformDoubleSidedFadeForView:fadeOutDuration:fadeOutDelay:fadeInDuration:fadeInDelay:](self, "_createPlaceholderSnapshotAndPerformDoubleSidedFadeForView:fadeOutDuration:fadeOutDelay:fadeInDuration:fadeInDelay:", v23, v12, v10, v11, v9);

      }
      if ((objc_msgSend(v21, "shouldHideFilterNameBadge") & 1) == 0)
      {
        -[CAMViewfinderView filterNameBadge](self, "filterNameBadge");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMViewfinderView _createPlaceholderSnapshotAndPerformDoubleSidedFadeForView:fadeOutDuration:fadeOutDelay:fadeInDuration:fadeInDelay:](self, "_createPlaceholderSnapshotAndPerformDoubleSidedFadeForView:fadeOutDuration:fadeOutDelay:fadeInDuration:fadeInDelay:", v24, v12, v10, v11, v9);

      }
      if ((objc_msgSend(v21, "shouldHideLightingNameBadgeForOrientation:", orientation) & 1) == 0)
      {
        if ((unint64_t)(a3 - 3) >= 2)
        {
          if ((unint64_t)(a3 - 1) >= 2)
          {
            -[CAMViewfinderView lightingNameBadge](self, "lightingNameBadge");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            -[CAMViewfinderView lightingNameBadge](self, "lightingNameBadge");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if ((unint64_t)(orientation - 3) <= 0xFFFFFFFFFFFFFFFDLL)
              -[CAMViewfinderView _createPlaceholderSnapshotAndPerformSingleSidedFadeForView:fadeOutDuration:fadeOutDelay:](self, "_createPlaceholderSnapshotAndPerformSingleSidedFadeForView:fadeOutDuration:fadeOutDelay:", v25, v12, v10);
          }
        }
        else
        {
          -[CAMViewfinderView lightingNameBadge](self, "lightingNameBadge");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)(orientation - 3) <= 1)
            -[CAMViewfinderView _createPlaceholderSnapshotAndPerformDoubleSidedFadeForView:fadeOutDuration:fadeOutDelay:fadeInDuration:fadeInDelay:](self, "_createPlaceholderSnapshotAndPerformDoubleSidedFadeForView:fadeOutDuration:fadeOutDelay:fadeInDuration:fadeInDelay:", v25, v12, v10, v11, v9);
        }

      }
      v26 = objc_msgSend(v21, "shouldHideTopBar");
      if (((orientation - 1) | (unint64_t)(a3 - 1)) >= 2
        && (v26 & 1) == 0
        && -[CAMViewfinderView automaticallyAdjustsTopBarOrientation](self, "automaticallyAdjustsTopBarOrientation"))
      {
        -[CAMViewfinderView topBar](self, "topBar");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMViewfinderView _createPlaceholderSnapshotAndPerformDoubleSidedFadeForView:fadeOutDuration:fadeOutDelay:fadeInDuration:fadeInDelay:](self, "_createPlaceholderSnapshotAndPerformDoubleSidedFadeForView:fadeOutDuration:fadeOutDelay:fadeInDuration:fadeInDelay:", v27, 0.3, 0.0, 0.25, 0.2);

      }
    }
    else
    {
      self->_orientation = a3;
    }
    -[CAMViewfinderView _descriptionOverlayViewByKey](self, "_descriptionOverlayViewByKey");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __45__CAMViewfinderView_setOrientation_animated___block_invoke;
    v31[3] = &__block_descriptor_41_e55_v32__0___NSCopying__8__CAMDescriptionOverlayView_16_B24l;
    v31[4] = a3;
    v32 = v5;
    objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", v31);

    -[CAMViewfinderView setNeedsLayout](self, "setNeedsLayout");
    -[CAMViewfinderView _layoutPortraitModeInstructionLabelForLayoutStyle:](self, "_layoutPortraitModeInstructionLabelForLayoutStyle:", v8);
    -[CAMViewfinderView _layoutQRCodeInstructionLabelForLayoutStyle:](self, "_layoutQRCodeInstructionLabelForLayoutStyle:", v8);
    -[CAMViewfinderView _layoutTopBadgesForLayoutStyle:animated:](self, "_layoutTopBadgesForLayoutStyle:animated:", v8, 0);
    -[CAMViewfinderView _layoutBottomBadgesForLayoutStyle:](self, "_layoutBottomBadgesForLayoutStyle:", v8);
    if (v5)
    {
      v30[0] = v29;
      v30[1] = 3221225472;
      v30[2] = __45__CAMViewfinderView_setOrientation_animated___block_invoke_2;
      v30[3] = &unk_1EA328868;
      v30[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 6, v30, 0, 0.25, 0.0);
    }
  }
}

- (void)_layoutPortraitModeInstructionLabelForLayoutStyle:(int64_t)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  id v8;

  -[CAMViewfinderView visibilityDelegate](self, "visibilityDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[CAMViewfinderView _shouldLayoutPortraitInstructionsAtTop](self, "_shouldLayoutPortraitInstructionsAtTop");
  -[CAMViewfinderView portraitModeInstructionLabel](self, "portraitModeInstructionLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CAMViewfinderView _layoutInstructionLabelOnTop:forLayoutStyle:](self, "_layoutInstructionLabelOnTop:forLayoutStyle:", v6, a3);
  }
  else
  {
    if ((objc_msgSend(v8, "shouldHideFilterNameBadge") & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      -[CAMViewfinderView filterNameBadge](self, "filterNameBadge");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[CAMViewfinderView _layoutBottomCenteredView:aboveView:aboveViewSpacing:forLayoutStyle:](self, "_layoutBottomCenteredView:aboveView:aboveViewSpacing:forLayoutStyle:", v6, v7, a3, 15.0);

  }
  objc_msgSend(v6, "setStyle:", 1);

}

- (CAMControlVisibilityDelegate)visibilityDelegate
{
  return (CAMControlVisibilityDelegate *)objc_loadWeakRetained((id *)&self->_visibilityDelegate);
}

- (BOOL)_shouldLayoutPortraitInstructionsAtTop
{
  void *v3;
  int v4;
  void *v5;
  BOOL v6;

  -[CAMViewfinderView visibilityDelegate](self, "visibilityDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldHideLightingControl") ^ 1;
  -[CAMViewfinderView lightingControl](self, "lightingControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = 1;
  else
    v6 = v4;

  return v6;
}

- (CEKLightingControl)lightingControl
{
  return self->_lightingControl;
}

- (CAMPortraitModeInstructionLabel)portraitModeInstructionLabel
{
  return self->_portraitModeInstructionLabel;
}

- (void)_layoutBottomCenteredView:(id)a3 aboveView:(id)a4 aboveViewSpacing:(double)a5 forLayoutStyle:(int64_t)a6
{
  id v10;
  id v11;
  double v12;
  void *v13;
  void *v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  unint64_t v25;
  uint64_t v26;
  double MinY;
  double v28;
  double v29;
  double MinX;
  double v31;
  double v32;
  double v33;
  double MaxY;
  double v35;
  _OWORD v36[3];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  double v41;
  double v42;
  double v43;
  double v44;
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
  CGRect v58;

  v10 = a3;
  v11 = a4;
  if ((unint64_t)(a6 - 2) >= 2)
  {
    v35 = a5;
    if (a6 == 1)
      v12 = 31.0;
    else
      v12 = 15.0;
    -[CAMViewfinderView previewView](self, "previewView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMViewfinderView topBar](self, "topBar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    MaxY = CGRectGetMaxY(v45);

    objc_msgSend(v13, "frame");
    x = v46.origin.x;
    y = v46.origin.y;
    width = v46.size.width;
    height = v46.size.height;
    v47 = CGRectInset(v46, v12, v12);
    objc_msgSend(v10, "sizeThatFits:", v47.size.width, v47.size.height);
    v20 = v19;
    v22 = v21;
    UIRoundToViewScale();
    UIRoundToViewScale();
    v24 = v23;
    v41 = 0.0;
    v42 = 0.0;
    v43 = v20;
    v44 = v22;
    v40 = *MEMORY[0x1E0C9D538];
    v25 = -[CAMViewfinderView orientation](self, "orientation");
    v26 = v25;
    if (v25 < 3)
    {
      v48.origin.x = x;
      v48.origin.y = y;
      v48.size.width = width;
      v48.size.height = height;
      *(_QWORD *)&v40 = CGRectGetMidX(v48);
      if (v11)
      {
        objc_msgSend(v11, "frame");
        objc_msgSend(v11, "alignmentRectForFrame:");
        MinY = CGRectGetMinY(v49);
        v28 = v24 + v35;
      }
      else
      {
        v53.origin.x = x;
        v53.origin.y = y;
        v53.size.width = width;
        v53.size.height = height;
        MinY = CGRectGetMaxY(v53);
        v28 = v12 + v24;
      }
      *((double *)&v40 + 1) = MinY - v28;
      goto LABEL_21;
    }
    if (v25 == 3)
    {
      v54.origin.x = x;
      v54.origin.y = y;
      v54.size.width = width;
      v54.size.height = height;
      v31 = CGRectGetMinY(v54);
      v55.origin.x = x;
      v55.origin.y = y;
      v55.size.width = width;
      v55.size.height = height;
      *((double *)&v40 + 1) = (fmax(MaxY, v31) + CGRectGetMaxY(v55)) * 0.5;
      if (v11)
      {
        objc_msgSend(v11, "frame");
        objc_msgSend(v11, "alignmentRectForFrame:");
        v12 = v24 + CGRectGetMaxX(v56);
        v32 = v35;
      }
      else
      {
        v57.origin.x = x;
        v57.origin.y = y;
        v57.size.width = width;
        v57.size.height = height;
        v32 = v24 + CGRectGetMinX(v57);
      }
      v33 = v12 + v32;
    }
    else
    {
      if (v25 != 4)
      {
LABEL_21:
        +[CAMView ceilBounds:andRoundCenter:toViewScale:](CAMView, "ceilBounds:andRoundCenter:toViewScale:", &v41, &v40, self, *(_QWORD *)&MaxY);
        objc_msgSend(v10, "setBounds:", v41, v42, v43, v44);
        objc_msgSend(v10, "setCenter:", v40);
        v38 = 0u;
        v39 = 0u;
        v37 = 0u;
        CAMOrientationTransform(v26, (uint64_t)&v37);
        v36[0] = v37;
        v36[1] = v38;
        v36[2] = v39;
        objc_msgSend(v10, "setTransform:", v36);

        goto LABEL_22;
      }
      v50.origin.x = x;
      v50.origin.y = y;
      v50.size.width = width;
      v50.size.height = height;
      v29 = CGRectGetMinY(v50);
      v51.origin.x = x;
      v51.origin.y = y;
      v51.size.width = width;
      v51.size.height = height;
      *((double *)&v40 + 1) = (fmax(MaxY, v29) + CGRectGetMaxY(v51)) * 0.5;
      if (v11)
      {
        objc_msgSend(v11, "frame");
        objc_msgSend(v11, "alignmentRectForFrame:");
        MinX = CGRectGetMinX(v52);
        v12 = v35;
      }
      else
      {
        v58.origin.x = x;
        v58.origin.y = y;
        v58.size.width = width;
        v58.size.height = height;
        MinX = CGRectGetMaxX(v58);
      }
      v33 = MinX - v24 - v12;
    }
    *(double *)&v40 = v33;
    goto LABEL_21;
  }
LABEL_22:

}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)_layoutQRCodeInstructionLabelForLayoutStyle:(int64_t)a3
{
  id v5;

  -[CAMViewfinderView qrCodeInstructionLabel](self, "qrCodeInstructionLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMViewfinderView _layoutInstructionLabelOnTop:forLayoutStyle:](self, "_layoutInstructionLabelOnTop:forLayoutStyle:", v5, a3);
  objc_msgSend(v5, "setStyle:", 1);

}

- (CAMQRCodeInstructionLabel)qrCodeInstructionLabel
{
  return self->_qrCodeInstructionLabel;
}

- (void)_layoutInstructionLabelOnTop:(id)a3 forLayoutStyle:(int64_t)a4
{
  id v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  int64_t v15;
  unint64_t v16;
  double v17;
  double v18;
  double *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  CGFloat MaxY;
  void *v25;
  char v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  _OWORD v38[3];
  _OWORD v39[3];
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v5 = a3;
  -[CAMViewfinderView previewView](self, "previewView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = -[CAMViewfinderView orientation](self, "orientation");
  v16 = v15;
  if ((unint64_t)(v15 - 3) >= 2)
    v17 = v14;
  else
    v17 = v12;
  if ((unint64_t)(v15 - 3) >= 2)
    v18 = v12;
  else
    v18 = v14;
  v19 = (double *)MEMORY[0x1E0C9D648];
  objc_msgSend(v5, "sizeThatFits:", v18 + -25.0, v17 + -25.0);
  v37 = v20;
  v22 = v21;
  -[CAMViewfinderView topBar](self, "topBar");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "frame");
  MaxY = CGRectGetMaxY(v40);

  -[CAMViewfinderView visibilityDelegate](self, "visibilityDelegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "shouldLayoutLightingNameBadgeAtBottom");

  if ((v26 & 1) != 0)
  {
    v34 = MaxY;
  }
  else
  {
    -[CAMViewfinderView lightingNameBadge](self, "lightingNameBadge");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "frame");
    v34 = CGRectGetMaxY(v41);

  }
  v35 = v19[1];
  v36 = *v19;
  UIRectGetCenter();
  v29 = v28;
  v31 = v30;
  v32 = v22;
  v33 = v22 * 0.5 + CAMPixelWidthForView(self) + 10.0;
  if (v16 >= 3)
  {
    if (v16 == 3)
    {
      v44.origin.x = v8;
      v44.origin.y = v10;
      v44.size.width = v12;
      v44.size.height = v14;
      v29 = CGRectGetMaxX(v44) - v33;
    }
    else if (v16 == 4)
    {
      v43.origin.x = v8;
      v43.origin.y = v10;
      v43.size.width = v12;
      v43.size.height = v14;
      v29 = v33 + CGRectGetMinX(v43);
    }
  }
  else
  {
    v42.origin.x = v8;
    v42.origin.y = v10;
    v42.size.width = v12;
    v42.size.height = v14;
    v31 = v33 + fmax(v34, CGRectGetMinY(v42));
  }
  objc_msgSend(v5, "setBounds:", v36, v35, v37, v32, *(_QWORD *)&v34);
  objc_msgSend(v5, "setCenter:", v29, v31);
  CAMOrientationTransform(v16, (uint64_t)v39);
  v38[0] = v39[0];
  v38[1] = v39[1];
  v38[2] = v39[2];
  objc_msgSend(v5, "setTransform:", v38);

}

- (void)_layoutTopBadgesForLayoutStyle:(int64_t)a3 animated:(BOOL)a4
{
  -[CAMViewfinderView _layoutTopBadgesForLayoutStyle:appearingBadges:disappearingBadges:animated:](self, "_layoutTopBadgesForLayoutStyle:appearingBadges:disappearingBadges:animated:", a3, 0, 0, a4);
}

- (void)_layoutBottomBadgesForLayoutStyle:(int64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  id v8;

  -[CAMViewfinderView filterNameBadge](self, "filterNameBadge");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMViewfinderView _layoutBottomCenteredView:aboveView:aboveViewSpacing:forLayoutStyle:](self, "_layoutBottomCenteredView:aboveView:aboveViewSpacing:forLayoutStyle:", 0.0);
  -[CAMViewfinderView visibilityDelegate](self, "visibilityDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldLayoutLightingNameBadgeAtBottom");

  if (v6)
  {
    -[CAMViewfinderView lightingNameBadge](self, "lightingNameBadge");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMViewfinderView _layoutBottomCenteredView:aboveView:aboveViewSpacing:forLayoutStyle:](self, "_layoutBottomCenteredView:aboveView:aboveViewSpacing:forLayoutStyle:", v7, 0, a3, 0.0);

  }
}

- (CAMFilterNameBadge)filterNameBadge
{
  return self->_filterNameBadge;
}

- (CEKLightingNameBadge)lightingNameBadge
{
  return self->_lightingNameBadge;
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat v4;
  CGFloat width;
  CGFloat v6;
  double MidY;
  int64_t v8;
  void *v9;
  uint64_t v10;
  int64_t v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  __int128 v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  void *v25;
  int64_t v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double height;
  double v54;
  double MidX;
  double y;
  double v57;
  _QWORD v58[5];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  objc_super v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;

  v66.receiver = self;
  v66.super_class = (Class)CAMViewfinderView;
  -[CAMViewfinderView layoutSubviews](&v66, sel_layoutSubviews);
  -[CAMViewfinderView bounds](self, "bounds");
  x = v67.origin.x;
  y = v67.origin.y;
  v57 = v67.origin.x;
  v4 = v67.origin.y;
  width = v67.size.width;
  height = v67.size.height;
  v54 = v67.size.width;
  v6 = v67.size.height;
  MidX = CGRectGetMidX(v67);
  v68.origin.x = x;
  v68.origin.y = v4;
  v68.size.width = width;
  v68.size.height = v6;
  MidY = CGRectGetMidY(v68);
  v8 = -[CAMViewfinderView layoutStyle](self, "layoutStyle");
  -[CAMViewfinderView _updateModernLayout](self, "_updateModernLayout");
  -[CAMViewfinderView visibilityDelegate](self, "visibilityDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "shouldShiftPreviewForUtilityBar");

  v11 = -[CAMViewfinderView desiredAspectRatio](self, "desiredAspectRatio");
  v12 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v64 = *MEMORY[0x1E0C9D648];
  v65 = v12;
  v13 = *MEMORY[0x1E0C9D538];
  v62 = v12;
  v63 = v13;
  v60 = v12;
  v61 = v64;
  v59 = v64;
  -[CAMViewfinderView _previewLayoutForAspectRatio:shouldShiftPreviewForUtilityBar:outPreviewBounds:outPreviewCenter:outFourThreeTopBarFrame:outBottomBarFrame:](self, "_previewLayoutForAspectRatio:shouldShiftPreviewForUtilityBar:outPreviewBounds:outPreviewCenter:outFourThreeTopBarFrame:outBottomBarFrame:", v11, v10, &v64, &v63, &v61, &v59);
  -[CAMViewfinderView bottomBar](self, "bottomBar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v59, v60);
  -[CAMViewfinderView _utilityBarExtensionDistanceForLayoutStyle:](self, "_utilityBarExtensionDistanceForLayoutStyle:", v8);
  objc_msgSend(v14, "setUtilityBarExtensionDistance:");
  v15 = v64;
  v16 = v65;
  -[CAMViewfinderView previewView](self, "previewView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBounds:", v15, v16);

  v18 = v63;
  -[CAMViewfinderView previewView](self, "previewView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCenter:", v18);

  v20 = v64;
  v21 = v65;
  -[CAMViewfinderView previewView](self, "previewView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setViewportFrame:", v20, v21);

  v23 = v64;
  v24 = v65;
  -[CAMViewfinderView previewView](self, "previewView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setOverlayFrame:", v23, v24);

  v26 = -[CAMViewfinderView maskingAspectRatio](self, "maskingAspectRatio");
  -[CAMViewfinderView _previewSizeForAspectRatio:](self, "_previewSizeForAspectRatio:", v26);
  v28 = v27;
  v52 = v29;
  -[CAMViewfinderView _previewFrameForAspectRatio:topBarFrame:bottomBarFrame:shouldShiftPreviewForUtilityBar:](self, "_previewFrameForAspectRatio:topBarFrame:bottomBarFrame:shouldShiftPreviewForUtilityBar:", v26, v10, v61, v62, v59, v60);
  v30 = v69.origin.x;
  v31 = v69.origin.y;
  v32 = v69.size.width;
  v33 = v69.size.height;
  v34 = CGRectGetMidX(v69);
  v70.origin.x = v30;
  v70.origin.y = v31;
  v70.size.width = v32;
  v70.size.height = v33;
  v35 = CGRectGetMidY(v70);
  -[CAMViewfinderView _previewContainerMaskingView](self, "_previewContainerMaskingView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  v38 = MidY;
  if (v26 == 3)
    v39 = v35;
  else
    v39 = MidY;
  if (v26 == 3)
    v40 = v34;
  else
    v40 = MidX;
  if (v26 == 3)
    v41 = 0.0;
  else
    v41 = v57;
  if (v26 == 3)
    v42 = 0.0;
  else
    v42 = y;
  if (v26 == 3)
    v43 = v28;
  else
    v43 = v54;
  if (v26 == 3)
    v44 = v52;
  else
    v44 = height;
  objc_msgSend(v36, "setCenter:", v40, v39);
  objc_msgSend(v37, "setBounds:", v41, v42, v43, v44);
  -[CAMViewfinderView convertPoint:toView:](self, "convertPoint:toView:", v37, MidX, v38);
  v46 = v45;
  v48 = v47;
  -[CAMViewfinderView _previewContainerView](self, "_previewContainerView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setBounds:", v57, y, v54, height);
  objc_msgSend(v49, "setCenter:", v46, v48);
  -[CAMViewfinderView _layoutTopBarForLayoutStyle:](self, "_layoutTopBarForLayoutStyle:", v8);
  -[CAMViewfinderView _layoutBarExtensionViews](self, "_layoutBarExtensionViews");
  -[CAMViewfinderView _layoutElapsedTimeViewForLayoutStyle:](self, "_layoutElapsedTimeViewForLayoutStyle:", v8);
  -[CAMViewfinderView _layoutShutterIndicatorForLayoutStyle:](self, "_layoutShutterIndicatorForLayoutStyle:", v8);
  -[CAMViewfinderView _layoutBurstIndicatorForLayoutStyle:](self, "_layoutBurstIndicatorForLayoutStyle:", v8);
  -[CAMViewfinderView _layoutTimerIndicatorViewForLayoutStyle:](self, "_layoutTimerIndicatorViewForLayoutStyle:", v8);
  -[CAMViewfinderView _layoutVideoConfigurationStatusIndicatorForLayoutStyle:](self, "_layoutVideoConfigurationStatusIndicatorForLayoutStyle:", v8);
  -[CAMViewfinderView _layoutPanoramaViewForLayoutStyle:](self, "_layoutPanoramaViewForLayoutStyle:", v8);
  -[CAMViewfinderView _layoutSnapshotsOfPreviewView](self, "_layoutSnapshotsOfPreviewView");
  -[CAMViewfinderView _layoutLightingControlForLayoutStyle:](self, "_layoutLightingControlForLayoutStyle:", v8);
  -[CAMViewfinderView _descriptionOverlayViewByKey](self, "_descriptionOverlayViewByKey");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __35__CAMViewfinderView_layoutSubviews__block_invoke;
  v58[3] = &unk_1EA32CAF0;
  v58[4] = self;
  objc_msgSend(v50, "enumerateKeysAndObjectsUsingBlock:", v58);

  -[CAMViewfinderView _layoutPortraitModeInstructionLabelForLayoutStyle:](self, "_layoutPortraitModeInstructionLabelForLayoutStyle:", v8);
  -[CAMViewfinderView _layoutQRCodeInstructionLabelForLayoutStyle:](self, "_layoutQRCodeInstructionLabelForLayoutStyle:", v8);
  -[CAMViewfinderView _layoutImageAnalysisInstructionLabelForLayoutStyle:](self, "_layoutImageAnalysisInstructionLabelForLayoutStyle:", v8);
  -[CAMViewfinderView _layoutTopBadgesForLayoutStyle:animated:](self, "_layoutTopBadgesForLayoutStyle:animated:", v8, 0);
  -[CAMViewfinderView _layoutBottomBadgesForLayoutStyle:](self, "_layoutBottomBadgesForLayoutStyle:", v8);
  -[CAMViewfinderView _layoutZoomSliderForLayoutStyle:](self, "_layoutZoomSliderForLayoutStyle:", v8);
  -[CAMViewfinderView _layoutZoomControlForLayoutStyle:](self, "_layoutZoomControlForLayoutStyle:", v8);
  -[CAMViewfinderView _layoutShutterButtonForLayoutStyle:](self, "_layoutShutterButtonForLayoutStyle:", v8);
  -[CAMViewfinderView _layoutFlipButtonForLayoutStyle:](self, "_layoutFlipButtonForLayoutStyle:", v8);
  -[CAMViewfinderView disabledModeOverlayView](self, "disabledModeOverlayView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setFrame:", v41, v42, v43, v44);
  objc_msgSend(v51, "setViewportFrame:", v41, v42, v43, v44);
  -[CAMViewfinderView _layoutTextInteractionInsertAndActionInfoView](self, "_layoutTextInteractionInsertAndActionInfoView");
  -[CAMViewfinderView _layoutMachineReadableCodeButton](self, "_layoutMachineReadableCodeButton");

}

- (int64_t)desiredAspectRatio
{
  return self->_desiredAspectRatio;
}

- (BOOL)useCreativeControls
{
  return self->_useCreativeControls;
}

- (UIEdgeInsets)_layoutMarginInsetsForLayoutStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  CGFloat MinY;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect v28;
  CGRect v29;
  UIEdgeInsets result;

  if (a3 == 4)
  {
    -[CAMViewfinderView _modernLayout](self, "_modernLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[CAMViewfinderView visibilityDelegate](self, "visibilityDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "shouldShiftPreviewForUtilityBar");

      objc_msgSend(v4, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 1, -[CAMViewfinderView useCreativeControls](self, "useCreativeControls"), v6);
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      -[CAMViewfinderView bounds](self, "bounds");
      v16 = v15;
      v28.origin.x = v8;
      v28.origin.y = v10;
      v28.size.width = v12;
      v28.size.height = v14;
      v17 = v16 - CGRectGetMaxY(v28);
      objc_msgSend(v4, "frameForControlStatusBar");
      MinY = CGRectGetMinY(v29);
      v19 = 0.0;
    }
    else
    {
      -[CAMViewfinderView window](self, "window");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "screen");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_referenceBounds");
      v24 = v23;

      v17 = v24 * 16.0 / 39.0 + -86.8461538;
      v19 = 0.0;
      MinY = 33.0;
    }

    v20 = 0.0;
  }
  else
  {
    MinY = *MEMORY[0x1E0DC49E8];
    v19 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v17 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v20 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  v25 = MinY;
  v26 = v19;
  v27 = v17;
  result.right = v20;
  result.bottom = v27;
  result.left = v26;
  result.top = v25;
  return result;
}

- (CGSize)_previewSizeForAspectRatio:(int64_t)a3
{
  void *v5;
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
  CGFloat v20;
  int64_t v21;
  double Width;
  double Height;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  int64_t v32;
  double v33;
  double v34;
  char v35;
  double v36;
  double v37;
  CGSize result;
  CGRect v39;
  CGRect v40;

  -[CAMViewfinderView _modernLayout](self, "_modernLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CAMViewfinderView _modernLayout](self, "_modernLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewportSizeForAspectRatio:", a3);
    v8 = v7;
    v10 = v9;

    v11 = v8;
    v12 = v10;
  }
  else
  {
    -[CAMViewfinderView bounds](self, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v21 = -[CAMViewfinderView layoutStyle](self, "layoutStyle");
    -[CAMViewfinderView _multiplierForAspectRatio:](self, "_multiplierForAspectRatio:", a3);
    v39.origin.x = v14;
    v39.origin.y = v16;
    v39.size.width = v18;
    v39.size.height = v20;
    Width = CGRectGetWidth(v39);
    v40.origin.x = v14;
    v40.origin.y = v16;
    v40.size.width = v18;
    v40.size.height = v20;
    Height = CGRectGetHeight(v40);
    v24 = -[CAMViewfinderView _wantsFullScreenPreviewRegardlessOfLayoutForLayoutStyle:](self, "_wantsFullScreenPreviewRegardlessOfLayoutForLayoutStyle:", v21);
    UIRoundToViewScale();
    v26 = v25;
    UIRoundToViewScale();
    v28 = v27;
    UIRoundToViewScale();
    v30 = v29;
    if (-[CAMViewfinderView _wantsInterfaceOrientedPreviewForLayoutStyle:](self, "_wantsInterfaceOrientedPreviewForLayoutStyle:", v21))
    {
      -[CAMViewfinderView window](self, "window");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CAMInterfaceOrientationForWindow(v31);

      if ((unint64_t)(v32 - 3) >= 2)
        v12 = v28;
      else
        v12 = v30;
      if (Width >= Height)
        v33 = Height;
      else
        v33 = Width;
      if (a3 == 3)
        v11 = v33;
      else
        v11 = Width;
      if (a3 == 3)
        v12 = v33;
      v34 = v12 / Height;
    }
    else
    {
      v34 = v28 / Height;
      if (Height <= Width)
        v11 = v26;
      else
        v11 = Width;
      if (Height <= Width)
        v12 = Height;
      else
        v12 = v28;
      if (Height <= Width)
        v34 = v26 / Width;
    }
    if (v34 > 0.85)
      v35 = 1;
    else
      v35 = v24;
    if ((v35 & 1) != 0)
      v36 = Width;
    else
      v36 = v11;
    if ((v35 & 1) != 0)
      v37 = Height;
    else
      v37 = v12;
    if (a3 != 3)
    {
      v11 = v36;
      v12 = v37;
    }
  }
  result.height = v12;
  result.width = v11;
  return result;
}

- (double)_multiplierForAspectRatio:(int64_t)a3
{
  double result;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  _BOOL4 v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  switch(a3)
  {
    case 0:
      result = 1.33333333;
      break;
    case 1:
      result = 1.77777778;
      break;
    case 2:
      result = 1.5;
      break;
    case 3:
      result = 1.0;
      break;
    case 4:
      -[CAMViewfinderView bounds](self, "bounds");
      x = v24.origin.x;
      y = v24.origin.y;
      width = v24.size.width;
      height = v24.size.height;
      v9 = CGRectGetWidth(v24);
      v25.origin.x = x;
      v25.origin.y = y;
      v25.size.width = width;
      v25.size.height = height;
      v10 = CGRectGetHeight(v25);
      -[CAMViewfinderView window](self, "window");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "screen");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;

      v26.origin.x = v14;
      v26.origin.y = v16;
      v26.size.width = v18;
      v26.size.height = v20;
      v21 = CGRectGetWidth(v26);
      v27.origin.x = v14;
      v27.origin.y = v16;
      v27.size.width = v18;
      v27.size.height = v20;
      v22 = CGRectGetHeight(v27);
      result = 1.33333333;
      if (v9 > 0.0 && v10 > 0.0 && v21 > 0.0 && v22 > 0.0)
      {
        v23 = -[CAMViewfinderView _wantsInterfaceOrientedPreviewForLayoutStyle:](self, "_wantsInterfaceOrientedPreviewForLayoutStyle:", -[CAMViewfinderView layoutStyle](self, "layoutStyle", 1.33333333));
        result = v10 / v9;
        if (!((v10 / v9 <= 1.0) ^ (v22 / v21 > 1.0) | !v23))
          result = 1.0 / result;
      }
      break;
    default:
      result = 0.0;
      break;
  }
  return result;
}

- (BOOL)_wantsFullScreenPreviewRegardlessOfLayoutForLayoutStyle:(int64_t)a3
{
  return +[CAMBottomBar wantsVerticalBarForLayoutStyle:](CAMBottomBar, "wantsVerticalBarForLayoutStyle:", a3);
}

- (BOOL)_wantsInterfaceOrientedPreviewForLayoutStyle:(int64_t)a3
{
  void *v4;
  char v5;
  BOOL v6;
  BOOL v7;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSplitScreenSupported");
  if (a3)
    v6 = 0;
  else
    v6 = v5;
  if (a3 == 4)
    v6 = v5;
  v7 = (unint64_t)(a3 - 1) < 3 || v6;

  return v7;
}

- (CGSize)_topBarSizeForLayoutStyle:(int64_t)a3
{
  double Width;
  double v6;
  double v7;
  _BOOL4 v8;
  double v9;
  double v10;
  CGSize result;
  CGRect v12;

  -[CAMViewfinderView bounds](self, "bounds");
  Width = CGRectGetWidth(v12);
  -[CAMViewfinderView _interpolatedTopBarHeight](self, "_interpolatedTopBarHeight");
  v7 = v6;
  v8 = +[CAMBottomBar wantsVerticalBarForLayoutStyle:](CAMBottomBar, "wantsVerticalBarForLayoutStyle:", a3);
  v9 = *MEMORY[0x1E0C9D820];
  v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (!v8)
  {
    v10 = v7;
    v9 = Width;
  }
  result.height = v10;
  result.width = v9;
  return result;
}

- (double)_interpolatedTopBarHeight
{
  void *v3;
  double result;
  CGRect v5;

  -[CAMViewfinderView bounds](self, "bounds");
  CGRectGetWidth(v5);
  -[CAMViewfinderView layoutStyle](self, "layoutStyle");
  -[CAMViewfinderView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInterfaceIdiom");

  UIRoundToViewScale();
  return result;
}

- (CGSize)_bottomBarSizeForLayoutStyle:(int64_t)a3 withProposedSize:(CGSize)a4
{
  double height;
  double width;
  CGFloat x;
  CGFloat y;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _BOOL4 v18;
  double v19;
  double v20;
  CGSize result;
  CGRect v22;
  CGRect v23;

  height = a4.height;
  width = a4.width;
  -[CAMViewfinderView bounds](self, "bounds");
  x = v22.origin.x;
  y = v22.origin.y;
  v10 = v22.size.width;
  v11 = v22.size.height;
  v12 = CGRectGetWidth(v22);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = v10;
  v23.size.height = v11;
  v13 = CGRectGetHeight(v23);
  -[CAMViewfinderView _interpolatedBottomBarWidthWithProposedWidth:](self, "_interpolatedBottomBarWidthWithProposedWidth:", width);
  v15 = v14;
  -[CAMViewfinderView _interpolatedBottomBarHeightWithProposedHeight:](self, "_interpolatedBottomBarHeightWithProposedHeight:", height);
  v17 = v16;
  v18 = +[CAMBottomBar wantsVerticalBarForLayoutStyle:](CAMBottomBar, "wantsVerticalBarForLayoutStyle:", a3);
  if (v18)
    v19 = v15;
  else
    v19 = v12;
  if (v18)
    v20 = v13;
  else
    v20 = v17;
  result.height = v20;
  result.width = v19;
  return result;
}

- (double)_interpolatedBottomBarWidthWithProposedWidth:(double)a3
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double result;
  CGRect v14;

  -[CAMViewfinderView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_referenceBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v14.origin.x = v6;
  v14.origin.y = v8;
  v14.size.width = v10;
  v14.size.height = v12;
  CGRectGetWidth(v14);
  UIRoundToViewScale();
  return result;
}

- (double)_interpolatedBottomBarHeightWithProposedHeight:(double)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  int64_t v12;
  void *v13;
  double result;
  CGRect v15;

  -[CAMViewfinderView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = -[CAMViewfinderView layoutStyle](self, "layoutStyle");
  v15.origin.x = v5;
  v15.origin.y = v7;
  v15.size.width = v9;
  v15.size.height = v11;
  CGRectGetWidth(v15);
  CAMPixelWidthForView(self);
  -[CAMViewfinderView traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = +[CAMBottomBar shouldUseSafeAreaInsetForLayoutStyle:traitCollection:](CAMBottomBar, "shouldUseSafeAreaInsetForLayoutStyle:traitCollection:", v12, v13);

  if ((_DWORD)v12)
    -[CAMViewfinderView safeAreaInsets](self, "safeAreaInsets");
  UIRoundToViewScale();
  return result;
}

- (CGRect)_previewFrameForAspectRatio:(int64_t)a3 topBarFrame:(CGRect)a4 bottomBarFrame:(CGRect)a5 shouldShiftPreviewForUtilityBar:(BOOL)a6
{
  uint64_t v6;
  double height;
  double width;
  double y;
  double x;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
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
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGRect result;

  v6 = a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4.size.height;
  v12 = a4.size.width;
  v13 = a4.origin.y;
  v14 = a4.origin.x;
  -[CAMViewfinderView _modernLayout](self, "_modernLayout");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    if (a3 == 3)
      v6 = 0;
    else
      v6 = v6;
    -[CAMViewfinderView _modernLayout](self, "_modernLayout");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", a3, -[CAMViewfinderView useCreativeControls](self, "useCreativeControls"), v6);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

  }
  else
  {
    if (-[CAMViewfinderView useCreativeControls](self, "useCreativeControls"))
    {
      -[CAMViewfinderView bounds](self, "bounds");
      v28 = v27;
      v30 = v29;
      v32 = v31;
      v34 = v33;
      -[CAMViewfinderView _previewSizeForAspectRatio:](self, "_previewSizeForAspectRatio:", a3);
      objc_msgSend(MEMORY[0x1E0D7D240], "cameraContentGeometryForReferenceBounds:forContentSize:withOrientation:shouldShiftPreviewForUtilityBar:", -[CAMViewfinderView orientation](self, "orientation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), v6, v28,
        v30,
        v32,
        v34,
        v35,
        v36);
      UIRectCenteredAboutPointScale();
    }
    else
    {
      -[CAMViewfinderView _cameraPreviewFrameForAspectRatio:topBarFrame:bottomBarFrame:shouldShiftPreviewForUtilityBar:](self, "_cameraPreviewFrameForAspectRatio:topBarFrame:bottomBarFrame:shouldShiftPreviewForUtilityBar:", a3, v6, v14, v13, v12, v11, x, y, width, height);
    }
    v20 = v37;
    v22 = v38;
    v24 = v39;
    v26 = v40;
  }
  v41 = v20;
  v42 = v22;
  v43 = v24;
  v44 = v26;
  result.size.height = v44;
  result.size.width = v43;
  result.origin.y = v42;
  result.origin.x = v41;
  return result;
}

- (CGRect)_cameraPreviewFrameForAspectRatio:(int64_t)a3 topBarFrame:(CGRect)a4 bottomBarFrame:(CGRect)a5 shouldShiftPreviewForUtilityBar:(BOOL)a6
{
  _BOOL4 v6;
  CGFloat y;
  double v8;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  _BOOL4 v28;
  _BOOL4 v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double MinY;
  double v39;
  double v40;
  double v41;
  BOOL v42;
  CGFloat MinX;
  double v44;
  double v45;
  double v46;
  int v47;
  double v48;
  double v49;
  CGFloat v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double MaxY;
  double v56;
  double v57;
  double v58;
  double v59;
  CGFloat v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  double v75;
  double v76;
  CGFloat rect;
  double v78;
  double height;
  double x;
  double v81;
  double v82;
  double v83;
  double v84;
  double width;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect result;

  v6 = a6;
  height = a5.size.height;
  x = a5.origin.x;
  width = a5.size.width;
  y = a5.origin.y;
  v8 = a4.size.height;
  v82 = a4.origin.y;
  v83 = a4.size.width;
  v81 = a4.origin.x;
  -[CAMViewfinderView bounds](self, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = -[CAMViewfinderView layoutStyle](self, "layoutStyle");
  v84 = y;
  if ((unint64_t)a3 > 3)
  {
    v20 = *MEMORY[0x1E0DC49E8];
    v21 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v22 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v23 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  else
  {
    -[CAMViewfinderView _layoutMarginInsetsForLayoutStyle:](self, "_layoutMarginInsetsForLayoutStyle:", v19);
  }
  v24 = v12 + v21;
  v25 = v14 + v20;
  v26 = v16 - (v21 + v23);
  v27 = v18 - (v20 + v22);
  v86.origin.x = v12 + v21;
  v86.origin.y = v25;
  v86.size.width = v26;
  v86.size.height = v27;
  v70 = CGRectGetWidth(v86);
  v87.origin.x = v24;
  v87.origin.y = v25;
  v87.size.width = v26;
  v87.size.height = v27;
  v75 = CGRectGetHeight(v87);
  v28 = +[CAMBottomBar wantsVerticalBarForLayoutStyle:](CAMBottomBar, "wantsVerticalBarForLayoutStyle:", v19);
  rect = v8;
  v29 = -[CAMViewfinderView _wantsPreviewOnlyLayoutForTopBarFrame:bottomBarFrame:](self, "_wantsPreviewOnlyLayoutForTopBarFrame:bottomBarFrame:", v81, v82, v83, v8, x, v84, width, height);
  -[CAMViewfinderView _previewSizeForAspectRatio:](self, "_previewSizeForAspectRatio:", a3);
  v31 = v30;
  v33 = v32;
  v72 = v24;
  v73 = v26;
  v74 = v25;
  v34 = v27;
  UIRectCenteredIntegralRectScale();
  v76 = v37;
  MinY = v35;
  v78 = v39;
  if (v28)
  {
    v40 = v36;
    v88.origin.x = x;
    v88.origin.y = v84;
    v88.size.width = width;
    v88.size.height = height;
    v41 = v70 - v31 - CGRectGetWidth(v88);
    v42 = v41 >= 0.0 && v41 < 0.00000011920929;
    MinX = v76;
    if (v42)
    {
      v89.origin.x = v72;
      v89.origin.y = v74;
      v89.size.width = v73;
      v89.size.height = v34;
      MinX = CGRectGetMinX(v89);
      v90.origin.x = v72;
      v90.origin.y = v74;
      v90.size.width = v73;
      v90.size.height = v34;
      MinY = CGRectGetMinY(v90);
    }
    goto LABEL_29;
  }
  v69 = v35;
  v71 = v36;
  v91.origin.x = v81;
  v91.origin.y = v82;
  v91.size.width = v83;
  v91.size.height = rect;
  v44 = v75 - CGRectGetHeight(v91) - v33;
  v92.origin.x = x;
  v92.size.width = width;
  v92.origin.y = v84;
  v92.size.height = height;
  v45 = CGRectGetHeight(v92);
  -[CAMViewfinderView _badgeTrayHeightForLayoutStyle:](self, "_badgeTrayHeightForLayoutStyle:", v19, 0);
  v47 = vabdd_f64(v44, v45) < 2.22044605e-16 || v29;
  if (v47 != 1)
  {
    v49 = v44 - v45;
    if (vabdd_f64(v49, v46) >= 2.0)
    {
      v40 = v71;
      if (v49 <= 0.0)
      {
        v97.origin.x = v81;
        v97.origin.y = v82;
        v97.size.width = v83;
        v97.size.height = rect;
        v60 = CGRectGetHeight(v97);
        v61 = width;
        if (vabdd_f64(v75 - v60, v33) >= 2.0)
        {
          if (v19 != 4)
          {
            MinX = v76;
            MinY = v69;
            goto LABEL_29;
          }
          v66 = x;
          v67 = v84;
          v68 = height;
          MinY = fmax(CGRectGetMaxY(*(CGRect *)(&v61 - 2)) - v33, 0.0);
          goto LABEL_28;
        }
        v53 = v81;
        v54 = v82;
        v51 = v83;
        v50 = rect;
        goto LABEL_27;
      }
      v96.origin.x = v81;
      v96.origin.y = v82;
      v96.size.width = v83;
      v96.size.height = rect;
      MaxY = CGRectGetMaxY(v96);
      UIRoundToViewScale();
      MinY = MaxY + v56;
    }
    else
    {
      v40 = v71;
      v50 = rect;
      v51 = v83;
      v52 = x;
      if (v6)
      {
        v53 = v81;
        v54 = v82;
LABEL_27:
        MinY = CGRectGetMaxY(*(CGRect *)(&v51 - 2));
        goto LABEL_28;
      }
      v57 = v84;
      v58 = width;
      v59 = height;
      MinY = CGRectGetMinY(*(CGRect *)&v52) - v33;
    }
LABEL_28:
    MinX = v76;
    goto LABEL_29;
  }
  v93.origin.x = v72;
  v93.origin.y = v25;
  v93.size.width = v73;
  v93.size.height = v34;
  MinX = CGRectGetMinX(v93);
  if (v6)
  {
    v94.origin.x = v72;
    v94.origin.y = v25;
    v94.size.width = v73;
    v94.size.height = v34;
    v48 = CGRectGetMinY(v94);
  }
  else
  {
    v95.origin.x = v81;
    v95.origin.y = v82;
    v95.size.width = v83;
    v95.size.height = rect;
    v48 = CGRectGetMaxY(v95);
  }
  MinY = v48;
  v40 = v71;
LABEL_29:
  v62 = MinX;
  v63 = MinY;
  v64 = v40;
  v65 = v78;
  result.size.height = v65;
  result.size.width = v64;
  result.origin.y = v63;
  result.origin.x = v62;
  return result;
}

- (double)_badgeTrayHeightForLayoutStyle:(int64_t)a3
{
  double result;

  result = 0.0;
  if ((unint64_t)a3 <= 4)
    return dbl_1DB9A7060[a3];
  return result;
}

- (int64_t)maskingAspectRatio
{
  return self->_maskingAspectRatio;
}

- (CAMPreviewContainerMaskingView)_previewContainerMaskingView
{
  return self->__previewContainerMaskingView;
}

- (void)_layoutTopBarForLayoutStyle:(int64_t)a3
{
  _BOOL8 v5;
  __int128 v6;
  __int128 v7;
  void *v8;
  _OWORD v9[3];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v5 = -[CAMViewfinderView _isAdjustingTopBarOrientationForLayoutStyle:](self, "_isAdjustingTopBarOrientationForLayoutStyle:");
  v6 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v14 = *MEMORY[0x1E0C9D648];
  v15 = v6;
  v13 = *MEMORY[0x1E0C9D538];
  v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v10 = *MEMORY[0x1E0C9BAA8];
  v11 = v7;
  v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[CAMViewfinderView _topBarForLayoutForLayoutStyle:shouldAdjustTopBarOrientation:bounds:center:transform:](self, "_topBarForLayoutForLayoutStyle:shouldAdjustTopBarOrientation:bounds:center:transform:", a3, v5, &v14, &v13, &v10);
  -[CAMViewfinderView topBar](self, "topBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBounds:", v14, v15);
  objc_msgSend(v8, "setCenter:", v13);
  v9[0] = v10;
  v9[1] = v11;
  v9[2] = v12;
  objc_msgSend(v8, "setTransform:", v9);

}

- (BOOL)_isAdjustingTopBarOrientationForLayoutStyle:(int64_t)a3
{
  BOOL v4;

  v4 = -[CAMViewfinderView automaticallyAdjustsTopBarOrientation](self, "automaticallyAdjustsTopBarOrientation");
  return v4 & !+[CAMBottomBar wantsVerticalBarForLayoutStyle:](CAMBottomBar, "wantsVerticalBarForLayoutStyle:", a3);
}

- (BOOL)automaticallyAdjustsTopBarOrientation
{
  return self->_automaticallyAdjustsTopBarOrientation;
}

- (void)_topBarForLayoutForLayoutStyle:(int64_t)a3 shouldAdjustTopBarOrientation:(BOOL)a4 bounds:(CGRect *)a5 center:(CGPoint *)a6 transform:(CGAffineTransform *)a7
{
  _BOOL8 v10;
  _BOOL4 v13;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  uint64_t v22;
  __int128 v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  int64_t v32;
  void *v33;
  double v34;
  double v35;

  v10 = a4;
  v13 = !a4 || (unint64_t)(-[CAMViewfinderView orientation](self, "orientation") - 5) < 0xFFFFFFFFFFFFFFFELL;
  -[CAMViewfinderView _modernLayout](self, "_modernLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 && v13)
  {
    -[CAMViewfinderView _modernLayout](self, "_modernLayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frameForControlStatusBar");
    v17 = v16;
    v19 = v18;

    if (a5)
    {
      a5->size.width = v17;
      a5->size.height = v19;
      a5->origin = (CGPoint)*MEMORY[0x1E0C9D538];
    }
    if (a6)
    {
      UIRectGetCenter();
      a6->x = v20;
      a6->y = v21;
    }
    if (a7)
    {
      v22 = MEMORY[0x1E0C9BAA8];
      v23 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&a7->a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&a7->c = v23;
      *(_OWORD *)&a7->tx = *(_OWORD *)(v22 + 32);
    }
  }
  else if (-[CAMViewfinderView useCreativeControls](self, "useCreativeControls"))
  {
    -[CAMViewfinderView bounds](self, "bounds");
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    if (v10)
      v32 = -[CAMViewfinderView orientation](self, "orientation");
    else
      v32 = 1;
    -[CAMViewfinderView previewView](self, "previewView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "frame");
    objc_msgSend(MEMORY[0x1E0D7D240], "cameraTopBarGeometryForReferenceBounds:forContentSize:withOrientation:", v32, v25, v27, v29, v31, v34, v35);
    if (a5)
    {
      a5->origin = 0u;
      a5->size = 0u;
    }
    if (a6)
      *a6 = 0u;
    if (a7)
    {
      *(_OWORD *)&a7->a = 0u;
      *(_OWORD *)&a7->c = 0u;
      *(_OWORD *)&a7->tx = 0u;
    }

  }
  else
  {
    -[CAMViewfinderView _cameraTopBarForLayoutForLayoutStyle:shouldAdjustTopBarOrientation:bounds:center:transform:](self, "_cameraTopBarForLayoutForLayoutStyle:shouldAdjustTopBarOrientation:bounds:center:transform:", a3, v10, a5, a6, a7);
  }
}

- (void)_cameraTopBarForLayoutForLayoutStyle:(int64_t)a3 shouldAdjustTopBarOrientation:(BOOL)a4 bounds:(CGRect *)a5 center:(CGPoint *)a6 transform:(CGAffineTransform *)a7
{
  _BOOL4 v10;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
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
  double v35;
  double v36;
  double v37;
  __int128 v38;
  unint64_t v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double MidX;
  double MidY;
  __int128 v47;
  uint64_t v48;
  CGFloat v49;
  CGFloat v50;
  double v51;
  CGRect v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  CGRect v56;

  v10 = a4;
  -[CAMViewfinderView previewView](self, "previewView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v52.origin.x = v14;
  v52.origin.y = v15;
  v52.size.width = v16;
  v52.size.height = v17;
  -[CAMViewfinderView _topBarSizeForLayoutStyle:](self, "_topBarSizeForLayoutStyle:", a3);
  v49 = v18;
  v20 = v19;
  -[CAMViewfinderView _layoutMarginInsetsForLayoutStyle:](self, "_layoutMarginInsetsForLayoutStyle:", a3);
  v22 = v21;
  v24 = v23;
  v51 = v25;
  v27 = v26;
  -[CAMViewfinderView bounds](self, "bounds");
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v50 = v20;
  UIRoundToViewScale();
  v37 = v36;
  v38 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v53 = *MEMORY[0x1E0C9BAA8];
  v54 = v38;
  v55 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  if (!v10 || (v39 = -[CAMViewfinderView orientation](self, "orientation"), v39 < 3))
  {
    v40 = v24 + v29;
    v41 = v22 + v31;
    v42 = v33 - (v24 + v27);
    v43 = v37;
    v44 = v35 - (v22 + v51);
    MidX = CGRectGetMidX(v52);
    v56.origin.x = v40;
    v56.origin.y = v41;
    v56.size.width = v42;
    v56.size.height = v44;
    MidY = v43 + CGRectGetMinY(v56);
    goto LABEL_4;
  }
  if (v39 == 3)
  {
    MidX = CGRectGetMaxX(v52) + -8.0 - v37;
    MidY = CGRectGetMidY(v52);
    v48 = 3;
    goto LABEL_15;
  }
  if (v39 == 4)
  {
    MidX = v37 + CGRectGetMinX(v52) + 8.0;
    MidY = CGRectGetMidY(v52);
    v48 = 4;
LABEL_15:
    CAMOrientationTransform(v48, (uint64_t)&v53);
    goto LABEL_4;
  }
  MidX = *MEMORY[0x1E0C9D538];
  MidY = *(double *)(MEMORY[0x1E0C9D538] + 8);
LABEL_4:
  if (a5)
  {
    a5->origin.x = 0.0;
    a5->origin.y = 0.0;
    a5->size.width = v49;
    a5->size.height = v50;
  }
  if (a6)
  {
    a6->x = MidX;
    a6->y = MidY;
  }
  if (a7)
  {
    v47 = v54;
    *(_OWORD *)&a7->a = v53;
    *(_OWORD *)&a7->c = v47;
    *(_OWORD *)&a7->tx = v55;
  }

}

- (void)_layoutBarExtensionViews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGRect v18;

  -[CAMViewfinderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMViewfinderView _layoutMarginInsetsForLayoutStyle:](self, "_layoutMarginInsetsForLayoutStyle:", -[CAMViewfinderView layoutStyle](self, "layoutStyle"));
  v12 = v11;
  v14 = v13;
  v15 = *MEMORY[0x1E0C9D648];
  v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  v17 = CGRectGetMaxY(v18) - v14;
  -[UIView setFrame:](self->__topBarExtensionView, "setFrame:", v15, v16, v8, v12);
  -[UIView setFrame:](self->__bottomBarExtensionView, "setFrame:", v15, v17, v8, v14);
}

- (void)_layoutElapsedTimeViewForLayoutStyle:(int64_t)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  id v12;
  CGRect v13;

  if (+[CAMBottomBar wantsVerticalBarForLayoutStyle:](CAMBottomBar, "wantsVerticalBarForLayoutStyle:", a3))
  {
    -[CAMViewfinderView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[CAMViewfinderView elapsedTimeView](self, "elapsedTimeView");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "intrinsicContentSize");
    v13.origin.x = v5;
    v13.origin.y = v7;
    v13.size.width = v9;
    v13.size.height = v11;
    CGRectGetMidX(v13);
    UIRoundToViewScale();
    objc_msgSend(v12, "frameForAlignmentRect:");
    objc_msgSend(v12, "setFrame:");

  }
}

- (void)_layoutShutterIndicatorForLayoutStyle:(int64_t)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double MidX;
  double MidY;
  CGFloat v20;
  id v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  -[CAMViewfinderView bounds](self, "bounds", a3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CAMViewfinderView shutterIndicatorView](self, "shutterIndicatorView");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  +[CAMView rotateView:toInterfaceOrientation:animated:](CAMView, "rotateView:toInterfaceOrientation:animated:", v21, 3, 0);
  objc_msgSend(v21, "intrinsicContentSize");
  v13 = v12;
  v15 = v14;
  objc_msgSend(v21, "setBounds:", 0.0, 0.0, v12, v14);
  -[CAMViewfinderView _interpolatedVerticalOffsetForShutterIndicator](self, "_interpolatedVerticalOffsetForShutterIndicator");
  v17 = v16;
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  v22.size.width = v13;
  v22.size.height = v15;
  MidX = CGRectGetMidX(v22);
  v23.origin.x = 0.0;
  v23.origin.y = 0.0;
  v23.size.width = v13;
  v23.size.height = v15;
  MidY = CGRectGetMidY(v23);
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  v20 = CGRectGetMaxX(v24) - MidY;
  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  objc_msgSend(v21, "setCenter:", v20, MidX + v17 + CGRectGetMinY(v25));

}

- (CAMShutterIndicatorView)shutterIndicatorView
{
  return self->_shutterIndicatorView;
}

- (double)_interpolatedVerticalOffsetForShutterIndicator
{
  double v3;
  double v4;
  double result;
  double v6;
  CGRect v7;

  -[CAMViewfinderView bounds](self, "bounds");
  CGRectGetWidth(v7);
  UIRoundToViewScale();
  v4 = v3;
  result = CAMPixelWidthForView(self) + 71.0;
  v6 = 62.0;
  if (v4 >= 62.0)
    v6 = v4;
  if (v6 < result)
    return v6;
  return result;
}

- (void)_layoutBurstIndicatorForLayoutStyle:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL4 v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  double MinX;
  double v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  double MinY;
  double MaxY;
  double v38;
  double v39;
  double v40;
  double MidY;
  double v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat MidX;
  CGFloat v47;
  double v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  id v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  -[CAMViewfinderView bottomBar](self, "bottomBar");
  v55 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v55, "backgroundStyle");
  -[CAMViewfinderView previewView](self, "previewView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "shutterButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v6, "frame");
  v51 = v17;
  v53 = v16;
  v47 = v19;
  v49 = v18;
  v20 = +[CAMBottomBar wantsVerticalBarForLayoutStyle:](CAMBottomBar, "wantsVerticalBarForLayoutStyle:", a3);
  -[CAMViewfinderView burstIndicatorView](self, "burstIndicatorView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *MEMORY[0x1E0C9D538];
  v23 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v21, "intrinsicContentSize");
  v25 = v24;
  v27 = v26;
  if (v20)
  {
    v52 = v9;
    v54 = v11;
    v28 = v13;
    v50 = v15;
    v29 = v24;
    if (v55 && v5 == 1 && v7)
    {
      objc_msgSend(v7, "frame");
      objc_msgSend(v7, "alignmentRectForFrame:");
      objc_msgSend(v55, "convertRect:toView:", self);
      MinX = CGRectGetMinX(v56);
      v57.origin.x = v22;
      v57.origin.y = v23;
      v57.size.width = v29;
      v57.size.height = v27;
      CGRectGetWidth(v57);
      UIRoundToViewScale();
      v32 = MinX - v31 + -30.0;
      v33 = v50;
      v34 = v52;
      v35 = v54;
    }
    else
    {
      v34 = v52;
      v35 = v54;
      v62.origin.x = v52;
      v62.origin.y = v54;
      v62.size.width = v28;
      v62.size.height = v15;
      v48 = CGRectGetMinX(v62);
      v63.origin.x = v22;
      v63.origin.y = v23;
      v63.size.width = v29;
      v63.size.height = v27;
      CGRectGetWidth(v63);
      UIRoundToViewScale();
      v33 = v15;
      v32 = v48 - v42 + -9.0;
    }
    v43 = v34;
    v44 = v35;
    v45 = v28;
    MidY = CGRectGetMidY(*(CGRect *)(&v33 - 3));
  }
  else
  {
    v58.origin.x = v9;
    v58.origin.y = v11;
    v58.size.width = v13;
    v58.size.height = v15;
    MidX = CGRectGetMidX(v58);
    v59.origin.x = v9;
    v59.origin.y = v11;
    v59.size.width = v13;
    v59.size.height = v15;
    MinY = CGRectGetMinY(v59);
    v60.origin.y = v51;
    v60.origin.x = v53;
    v60.size.height = v47;
    v60.size.width = v49;
    MaxY = CGRectGetMaxY(v60);
    if (MaxY <= MinY)
      v38 = MaxY;
    else
      v38 = MinY;
    v32 = MidX;
    v39 = 21.0 - CAMPixelWidthForView(self);
    v61.origin.x = v22;
    v61.origin.y = v23;
    v61.size.width = v25;
    v61.size.height = v27;
    CGRectGetHeight(v61);
    UIRoundToViewScale();
    MidY = v38 - v40 - v39;
    v29 = v25;
  }
  objc_msgSend(v21, "setBounds:", v22, v23, v29, v27, *(_QWORD *)&MidX);
  objc_msgSend(v21, "setCenter:", v32, MidY);

}

- (CAMBurstIndicatorView)burstIndicatorView
{
  return self->_burstIndicatorView;
}

- (void)_layoutTimerIndicatorViewForLayoutStyle:(int64_t)a3
{
  double x;
  double y;
  double width;
  double height;
  double MidX;
  double MidY;
  void *v11;
  double v12;
  double v13;
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
  id v24;
  CGRect v25;
  CGRect v26;

  -[CAMViewfinderView timerIndicatorView](self, "timerIndicatorView");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if (+[CAMBottomBar wantsVerticalBarForLayoutStyle:](CAMBottomBar, "wantsVerticalBarForLayoutStyle:", a3))
  {
    -[CAMViewfinderView bounds](self, "bounds");
    x = v25.origin.x;
    y = v25.origin.y;
    width = v25.size.width;
    height = v25.size.height;
    MidX = CGRectGetMidX(v25);
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    MidY = CGRectGetMidY(v26);
    objc_msgSend(v24, "setBounds:", x, y, width, height);
    objc_msgSend(v24, "setCenter:", MidX, MidY);
  }
  else
  {
    -[CAMViewfinderView previewView](self, "previewView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    objc_msgSend(v11, "center");
    v21 = v20;
    v23 = v22;
    objc_msgSend(v24, "setBounds:", v13, v15, v17, v19);
    objc_msgSend(v24, "setCenter:", v21, v23);

  }
}

- (void)_layoutPanoramaViewForLayoutStyle:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
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
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  _OWORD v48[3];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  CGRect v52;
  CGRect v53;

  -[CAMViewfinderView panoramaView](self, "panoramaView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMViewfinderView bounds](self, "bounds");
  v42 = v6;
  v43 = v7;
  v44 = v8;
  v45 = v9;
  v10 = *MEMORY[0x1E0C9D648];
  v46 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v47 = *MEMORY[0x1E0C9D538];
  v14 = -[CAMViewfinderView previewViewOrientation](self, "previewViewOrientation");
  v50 = 0u;
  v51 = 0u;
  v49 = 0u;
  -[CAMViewfinderView window](self, "window", CAMTransformCorrectingForOrientation(v14, (uint64_t)&v49));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "screen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_referenceBounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v25 = v46;
  switch(a3)
  {
    case 0:
    case 2:
    case 4:
      -[CAMViewfinderView previewView](self, "previewView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "center");
      v47 = v27;
      v13 = v28;
      objc_msgSend(v5, "panoramaCaptureSize");
      +[CAMPanoramaUtilities panoramaViewSizeForCaptureSize:referenceBounds:layoutStyle:](CAMPanoramaUtilities, "panoramaViewSizeForCaptureSize:referenceBounds:layoutStyle:", a3);
      v11 = v29;
      v12 = v30;

      v25 = 0.0;
      goto LABEL_8;
    case 1:
      objc_msgSend(v5, "panoramaCaptureSize");
      +[CAMPanoramaUtilities panoramaViewSizeForCaptureSize:referenceBounds:layoutStyle:](CAMPanoramaUtilities, "panoramaViewSizeForCaptureSize:referenceBounds:layoutStyle:", 1);
      v40 = v32;
      v41 = v31;
      if (v14 >= 3)
      {
        v35 = v46;
        if (v14 - 3 < 2)
        {
          v10 = v42;
          v35 = v43;
          v11 = v44;
          v12 = v45;
        }
      }
      else
      {
        +[CAMPanoramaUtilities panoramaViewLayoutInsetsForLayoutStyle:referenceBounds:](CAMPanoramaUtilities, "panoramaViewLayoutInsetsForLayoutStyle:referenceBounds:", 1, v18, v20, v22, v24);
        v10 = v42 + v33;
        v35 = v43 + v34;
        v11 = v44 - (v33 + v36);
        v12 = v45 - (v34 + v37);
      }
      v52.origin.x = v10;
      v52.origin.y = v35;
      v52.size.width = v11;
      v52.size.height = v12;
      CGRectGetMidX(v52);
      UIRoundToViewScale();
      v47 = v38;
      v53.origin.x = v10;
      v53.origin.y = v35;
      v53.size.width = v11;
      v53.size.height = v12;
      CGRectGetMidY(v53);
      UIRoundToViewScale();
      v13 = v39;
      v25 = 0.0;
      v12 = v40;
      v11 = v41;
LABEL_8:
      v10 = 0.0;
      break;
    case 3:
      break;
    default:
      v25 = v46;
      break;
  }
  objc_msgSend(v5, "setBounds:", v10, v25, v11, v12, *(_QWORD *)&v40, *(_QWORD *)&v41);
  objc_msgSend(v5, "setCenter:", v47, v13);
  v48[0] = v49;
  v48[1] = v50;
  v48[2] = v51;
  objc_msgSend(v5, "setTransform:", v48);

}

- (CAMPanoramaView)panoramaView
{
  return self->_panoramaView;
}

- (int64_t)previewViewOrientation
{
  return self->_previewViewOrientation;
}

- (void)_layoutSnapshotsOfPreviewView
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 *v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  void *v17;
  void *v18;
  id obj;
  _OWORD v20[3];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[CAMViewfinderView previewView](self, "previewView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v29 = 0u;
  v30 = 0u;
  v28 = 0u;
  if (v3)
    objc_msgSend(v3, "transform");
  v18 = v4;
  -[CAMViewfinderView _previewContainerView](self, "_previewContainerView");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "subviews");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    v8 = (__int128 *)MEMORY[0x1E0C9D648];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          objc_msgSend(v11, "snapshotView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "desiredAspectRatio");

          -[CAMViewfinderView visibilityDelegate](self, "visibilityDelegate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "shouldShiftPreviewForUtilityBar");

          v16 = v8[1];
          v22 = *v8;
          v23 = v16;
          v21 = *MEMORY[0x1E0C9D538];
          -[CAMViewfinderView _previewLayoutForAspectRatio:shouldShiftPreviewForUtilityBar:outPreviewBounds:outPreviewCenter:outFourThreeTopBarFrame:outBottomBarFrame:](self, "_previewLayoutForAspectRatio:shouldShiftPreviewForUtilityBar:outPreviewBounds:outPreviewCenter:outFourThreeTopBarFrame:outBottomBarFrame:", v13, v15, &v22, &v21, 0, 0);
          objc_msgSend(v12, "setBounds:", v22, v23);
          objc_msgSend(v12, "setCenter:", v21);
          v20[0] = v28;
          v20[1] = v29;
          v20[2] = v30;
          objc_msgSend(v12, "setTransform:", v20);

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    }
    while (v6);
  }

}

- (void)_layoutLightingControlForLayoutStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
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
  double v24;
  double v25;
  void *v26;
  int v27;
  double v28;
  CGAffineTransform v29;
  CGAffineTransform v30;

  -[CAMViewfinderView lightingControl](self, "lightingControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CAMViewfinderView bottomBar](self, "bottomBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    if (+[CAMBottomBar wantsVerticalBarForLayoutStyle:](CAMBottomBar, "wantsVerticalBarForLayoutStyle:", a3))
    {
      v13 = *MEMORY[0x1E0C9D648];
      v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      -[CAMViewfinderView bounds](self, "bounds");
      objc_msgSend(v5, "sizeThatFits:", v15, v16);
      v18 = v17;
      v20 = v19;
      -[CAMViewfinderView bounds](self, "bounds");
      UIRectGetCenter();
      v22 = v21;
      objc_msgSend(v5, "setBounds:", v13, v14, v18, v20);
      objc_msgSend(v5, "setCenter:", v20 * 0.5, v22);
      CGAffineTransformMakeRotation(&v30, 1.57079633);
      v29 = v30;
      objc_msgSend(v5, "setTransform:", &v29);
    }
    else
    {
      objc_msgSend(v5, "contentHeightForWidth:", v12);
      v24 = v23;
      v25 = v10 - v23;
      -[CAMViewfinderView visibilityDelegate](self, "visibilityDelegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "shouldShiftPreviewForUtilityBar");

      if (v27)
      {
        objc_msgSend(v6, "utilityBarExtensionDistance");
        v25 = v25 - v28;
      }
      objc_msgSend(v5, "frameForAlignmentRect:", v8, v25, v12, v24);
      objc_msgSend(v5, "setFrame:");
    }

  }
}

- (void)_layoutDescriptionOverlayView:(id)a3
{
  id v4;
  int64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  double v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v4 = a3;
  if (v4)
  {
    v5 = -[CAMViewfinderView layoutStyle](self, "layoutStyle");
    if (!v5 || v5 == 4)
    {
      v12 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
      v17 = *MEMORY[0x1E0C9D648];
      v18 = v12;
      v16 = *MEMORY[0x1E0C9D538];
      -[CAMViewfinderView _previewLayoutForAspectRatio:shouldShiftPreviewForUtilityBar:outPreviewBounds:outPreviewCenter:outFourThreeTopBarFrame:outBottomBarFrame:](self, "_previewLayoutForAspectRatio:shouldShiftPreviewForUtilityBar:outPreviewBounds:outPreviewCenter:outFourThreeTopBarFrame:outBottomBarFrame:", 0, 0, &v17, &v16, 0, 0);
      v13 = v18;
      v14 = *(double *)&v16 - *(double *)&v18 * 0.5;
      v15 = *((double *)&v16 + 1) - *((double *)&v18 + 1) * 0.5;
      -[CAMViewfinderView bounds](self, "bounds");
      objc_msgSend(v4, "setFrame:");
      objc_msgSend(v4, "setViewportFrame:", v14, v15, v13);
      v10 = v4;
      v11 = 1;
      goto LABEL_7;
    }
    if (v5 == 1)
    {
      -[CAMViewfinderView bounds](self, "bounds");
      v7 = v6;
      -[CAMViewfinderView bounds](self, "bounds");
      v9 = v8;
      objc_msgSend(v4, "setFrame:", 0.0, 0.0, v7);
      objc_msgSend(v4, "setViewportFrame:", 0.0, 0.0, v7, v9);
      v10 = v4;
      v11 = 0;
LABEL_7:
      objc_msgSend(v10, "setBlackoutFrameVisible:", v11);
    }
  }

}

- (void)_layoutZoomSliderForLayoutStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[CAMViewfinderView zoomSlider](self, "zoomSlider");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMViewfinderView bottomBar](self, "bottomBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMViewfinderView previewView](self, "previewView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMZoomSliderUtilities layoutZoomSlider:forLayoutStyle:bottomBar:previewView:viewfinderView:](CAMZoomSliderUtilities, "layoutZoomSlider:forLayoutStyle:bottomBar:previewView:viewfinderView:", v7, a3, v5, v6, self);

}

- (CAMZoomSlider)zoomSlider
{
  return self->_zoomSlider;
}

- (void)_layoutZoomControlForLayoutStyle:(int64_t)a3
{
  double v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CAMViewfinderView zoomControl](self, "zoomControl");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMViewfinderView bounds](self, "bounds");
  switch(a3)
  {
    case 4:
      goto LABEL_4;
    case 1:
      +[CAMZoomControlUtilities layoutZoomControl:layoutSide:forLayoutStyle:width:marginForZoomButtonFromEdge:marginForZoomDialFromEdge:zoomDialContentMaskingHeight:centerOfZoomControlInContainerView:](CAMZoomControlUtilities, "layoutZoomControl:layoutSide:forLayoutStyle:width:marginForZoomButtonFromEdge:marginForZoomDialFromEdge:zoomDialContentMaskingHeight:centerOfZoomControlInContainerView:", v9, 1, 1, 375.0, 20.5, 0.0, 0.0, -82.5, v5 * 0.5);
      break;
    case 0:
LABEL_4:
      -[CAMViewfinderView zoomControl](self, "zoomControl");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMViewfinderView bottomBar](self, "bottomBar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMViewfinderView previewView](self, "previewView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[CAMZoomControlUtilities layoutZoomControl:forLayoutStyle:bottomBar:previewView:](CAMZoomControlUtilities, "layoutZoomControl:forLayoutStyle:bottomBar:previewView:", v6, a3, v7, v8);

      break;
  }

}

- (CAMZoomControl)zoomControl
{
  return self->_zoomControl;
}

- (void)_layoutShutterButtonForLayoutStyle:(int64_t)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double MinY;
  double v34;
  double MaxX;
  double MinX;
  double v37;
  double MaxY;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  id v44;
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

  -[CAMViewfinderView shutterButton](self, "shutterButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v44 = v4;
    -[CAMViewfinderView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[CAMViewfinderView window](self, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CAMInterfaceOrientationForWindow(v13) - 3;

    objc_msgSend(v44, "intrinsicContentSize");
    v16 = v15;
    v18 = v17;
    UIRectCenteredIntegralRectScale();
    v41 = v22;
    v42 = v21;
    if (v14 > 1)
    {
      v43 = v19;
      v47.origin.x = v6;
      v47.origin.y = v8;
      v47.size.width = v10;
      v47.size.height = v12;
      v40 = CGRectGetMaxY(v47) + -8.0 - v18;
      UIRectCenteredIntegralRectScale();
      v29 = v30;
      v26 = v31;
      v28 = v32;
      v48.origin.x = v6;
      v48.origin.y = v8;
      v48.size.width = v10;
      v48.size.height = v12;
      v24 = CGRectGetMaxY(v48) + -150.0;
    }
    else
    {
      v45.origin.x = v6;
      v40 = v20;
      v45.origin.y = v8;
      v45.size.width = v10;
      v45.size.height = v12;
      v43 = CGRectGetMaxX(v45) + -8.0 - v16;
      UIRectCenteredIntegralRectScale();
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v46.origin.x = v6;
      v46.origin.y = v8;
      v46.size.width = v10;
      v46.size.height = v12;
      v29 = CGRectGetMaxX(v46) + -150.0;
    }
    v49.origin.x = v29;
    v49.origin.y = v24;
    v49.size.width = v26;
    v49.size.height = v28;
    MaxY = CGRectGetMaxY(v49);
    v50.origin.x = v43;
    v50.origin.y = v40;
    v50.size.width = v42;
    v50.size.height = v41;
    v39 = MaxY - CGRectGetMaxY(v50);
    v51.origin.x = v43;
    v51.origin.y = v40;
    v51.size.width = v42;
    v51.size.height = v41;
    MinX = CGRectGetMinX(v51);
    v52.origin.x = v29;
    v52.origin.y = v24;
    v52.size.width = v26;
    v52.size.height = v28;
    v37 = MinX - CGRectGetMinX(v52);
    v53.origin.x = v43;
    v53.origin.y = v40;
    v53.size.width = v42;
    v53.size.height = v41;
    MinY = CGRectGetMinY(v53);
    v54.origin.x = v29;
    v54.origin.y = v24;
    v54.size.width = v26;
    v54.size.height = v28;
    v34 = MinY - CGRectGetMinY(v54);
    v55.origin.x = v29;
    v55.origin.y = v24;
    v55.size.width = v26;
    v55.size.height = v28;
    MaxX = CGRectGetMaxX(v55);
    v56.origin.x = v43;
    v56.origin.y = v40;
    v56.size.width = v42;
    v56.size.height = v41;
    objc_msgSend(v44, "setTappableEdgeInsets:", v34, v37, v39, MaxX - CGRectGetMaxX(v56), 0);
    objc_msgSend(v44, "frameForAlignmentRect:", v43, v40, v42, v41);
    objc_msgSend(v44, "setFrame:");
    v4 = v44;
  }

}

- (CUShutterButton)shutterButton
{
  return self->_shutterButton;
}

- (void)_layoutFlipButtonForLayoutStyle:(int64_t)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double MinY;
  double MinX;
  CGFloat v25;
  double MaxY;
  double v27;
  double v28;
  double v29;
  double MaxX;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  id v45;
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
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  -[CAMViewfinderView flipButton](self, "flipButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v45 = v4;
    -[CAMViewfinderView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[CAMViewfinderView window](self, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CAMInterfaceOrientationForWindow(v13) - 3;

    objc_msgSend(v45, "intrinsicContentSize");
    v16 = v15;
    v44 = v17;
    v18 = v6;
    v19 = v8;
    v20 = v10;
    v21 = v12;
    if (v14 > 1)
    {
      v22 = CGRectGetMaxX(*(CGRect *)&v18) + -10.0 - v16;
      v48.origin.x = v6;
      v48.origin.y = v8;
      v48.size.width = v10;
      v48.size.height = v12;
      MinY = CGRectGetMinY(v48);
      v49.origin.x = v6;
      v49.origin.y = v8;
      v49.size.width = v10;
      v49.size.height = v12;
      MinX = CGRectGetMaxX(v49) + -70.0;
    }
    else
    {
      v22 = CGRectGetMinX(*(CGRect *)&v18) + 10.0;
      v46.origin.x = v6;
      v46.origin.y = v8;
      v46.size.width = v10;
      v46.size.height = v12;
      MinY = CGRectGetMinY(v46);
      v47.origin.x = v6;
      v47.origin.y = v8;
      v47.size.width = v10;
      v47.size.height = v12;
      MinX = CGRectGetMinX(v47);
    }
    v50.origin.x = v6;
    v50.origin.y = v8;
    v50.size.width = v10;
    v50.size.height = v12;
    v25 = CGRectGetMinY(v50);
    v51.origin.x = MinX;
    v51.origin.y = v25;
    v51.size.width = 70.0;
    v51.size.height = 70.0;
    MaxY = CGRectGetMaxY(v51);
    v52.origin.x = v22;
    v52.origin.y = MinY + 10.0;
    v52.size.width = v16;
    v52.size.height = v44;
    v43 = MaxY - CGRectGetMaxY(v52);
    v53.origin.x = v22;
    v53.origin.y = MinY + 10.0;
    v53.size.width = v16;
    v53.size.height = v44;
    v27 = CGRectGetMinX(v53);
    v54.origin.x = MinX;
    v54.origin.y = v25;
    v54.size.width = 70.0;
    v54.size.height = 70.0;
    v42 = v27 - CGRectGetMinX(v54);
    v55.origin.x = v22;
    v55.origin.y = MinY + 10.0;
    v55.size.width = v16;
    v55.size.height = v44;
    v28 = CGRectGetMinY(v55);
    v56.origin.x = MinX;
    v56.origin.y = v25;
    v56.size.width = 70.0;
    v56.size.height = 70.0;
    v29 = v28 - CGRectGetMinY(v56);
    v57.origin.x = MinX;
    v57.origin.y = v25;
    v57.size.width = 70.0;
    v57.size.height = 70.0;
    MaxX = CGRectGetMaxX(v57);
    v58.origin.x = v22;
    v58.origin.y = MinY + 10.0;
    v58.size.width = v16;
    v58.size.height = v44;
    objc_msgSend(v45, "setTappableEdgeInsets:", v29, v42, v43, MaxX - CGRectGetMaxX(v58));
    objc_msgSend(v45, "frameForAlignmentRect:", v22, MinY + 10.0, v16, v44);
    x = v59.origin.x;
    y = v59.origin.y;
    width = v59.size.width;
    height = v59.size.height;
    v35 = CGRectGetMinX(v59);
    v60.origin.x = x;
    v60.origin.y = y;
    v60.size.width = width;
    v60.size.height = height;
    CGRectGetWidth(v60);
    UIRoundToViewScale();
    v37 = v35 + v36;
    v61.origin.x = x;
    v61.origin.y = y;
    v61.size.width = width;
    v61.size.height = height;
    v38 = CGRectGetMinY(v61);
    v62.origin.x = x;
    v62.origin.y = y;
    v62.size.width = width;
    v62.size.height = height;
    CGRectGetHeight(v62);
    UIRoundToViewScale();
    v40 = v38 + v39;
    objc_msgSend(v45, "setBounds:", 0.0, 0.0, width, height);
    objc_msgSend(v45, "setCenter:", v37, v40);
    -[CAMViewfinderView shutterButton](self, "shutterButton");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
      -[CAMViewfinderView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v45, v41);

    v4 = v45;
  }

}

- (CAMFlipButton)flipButton
{
  return self->_flipButton;
}

- (CAMDisabledModeOverlayView)disabledModeOverlayView
{
  return self->_disabledModeOverlayView;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
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
  CGFloat v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  id v23;
  objc_super v25;
  CGPoint v26;
  CGRect v27;

  y = a3.y;
  x = a3.x;
  v25.receiver = self;
  v25.super_class = (Class)CAMViewfinderView;
  -[CAMViewfinderView hitTest:withEvent:](&v25, sel_hitTest_withEvent_, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMViewfinderView _previewContainerView](self, "_previewContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    -[CAMViewfinderView bounds](self, "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[CAMViewfinderView _layoutMarginInsetsForLayoutStyle:](self, "_layoutMarginInsetsForLayoutStyle:", -[CAMViewfinderView layoutStyle](self, "layoutStyle"));
    v18 = v12 + v17;
    v21 = v14 - (v19 + v20);
    v27.size.height = v16 - (v17 + v22);
    v27.origin.x = v10 + v19;
    v27.origin.y = v18;
    v27.size.width = v21;
    v26.x = x;
    v26.y = y;
    if (!CGRectContainsPoint(v27, v26))
    {

      v7 = 0;
    }
  }
  v23 = v7;

  return v23;
}

- (CGRect)_frameForBadgeTrayForLayoutStyle:(int64_t)a3 orientation:(int64_t)a4
{
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  void *v15;
  uint64_t v16;
  int64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  _BOOL4 v31;
  double v32;
  double v33;
  double MaxY;
  double v35;
  double MinY;
  double MinX;
  double MaxX;
  double v39;
  double v40;
  double v41;
  double v42;
  CGFloat rect;
  __int128 v44;
  __int128 v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect result;

  -[CAMViewfinderView _viewToLayoutBadgesBelowForLayoutStyle:orientation:](self, "_viewToLayoutBadgesBelowForLayoutStyle:orientation:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  rect = v14;
  v44 = 0u;
  v45 = 0u;
  -[CAMViewfinderView visibilityDelegate](self, "visibilityDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "shouldShiftPreviewForUtilityBar");

  -[CAMViewfinderView _previewLayoutForAspectRatio:shouldShiftPreviewForUtilityBar:outPreviewBounds:outPreviewCenter:outFourThreeTopBarFrame:outBottomBarFrame:](self, "_previewLayoutForAspectRatio:shouldShiftPreviewForUtilityBar:outPreviewBounds:outPreviewCenter:outFourThreeTopBarFrame:outBottomBarFrame:", -[CAMViewfinderView desiredAspectRatio](self, "desiredAspectRatio"), v16, 0, 0, &v44, 0);
  v17 = -[CAMViewfinderView maskingAspectRatio](self, "maskingAspectRatio");
  -[CAMViewfinderView bottomBar](self, "bottomBar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frame");
  -[CAMViewfinderView _previewFrameForAspectRatio:topBarFrame:bottomBarFrame:shouldShiftPreviewForUtilityBar:](self, "_previewFrameForAspectRatio:topBarFrame:bottomBarFrame:shouldShiftPreviewForUtilityBar:", v17, v16, v44, v45, v19, v20, v21, v22);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;

  v31 = +[CAMBottomBar wantsVerticalBarForLayoutStyle:](CAMBottomBar, "wantsVerticalBarForLayoutStyle:", a3);
  -[CAMViewfinderView _badgeTrayHeightForLayoutStyle:](self, "_badgeTrayHeightForLayoutStyle:", a3);
  v33 = v32;
  switch(a4)
  {
    case 0:
    case 1:
      goto LABEL_2;
    case 2:
      if (v31)
      {
        if (v7)
        {
          v48.origin.x = v9;
          v48.origin.y = v11;
          v48.size.width = v13;
          v48.size.height = rect;
          MinY = CGRectGetMinY(v48);
        }
        else
        {
          v53.origin.x = v24;
          v53.origin.y = v26;
          v53.size.width = v28;
          v53.size.height = v30;
          MinY = CGRectGetMaxY(v53);
        }
        v26 = MinY - v33;
      }
      else
      {
LABEL_2:
        v46.origin.x = v9;
        v46.origin.y = v11;
        v46.size.width = v13;
        v46.size.height = rect;
        MaxY = CGRectGetMaxY(v46);
        v47.origin.x = v24;
        v47.origin.y = v26;
        v47.size.width = v28;
        v47.size.height = v30;
        v35 = CGRectGetMinY(v47) - v33;
        if (v35 >= MaxY)
          v26 = v35;
        else
          v26 = MaxY;
      }
      v30 = v33;
      break;
    case 3:
      if (v7)
      {
        v49.origin.x = v9;
        v49.origin.y = v11;
        v49.size.width = v13;
        v49.size.height = rect;
        MinX = CGRectGetMinX(v49);
      }
      else
      {
        v52.origin.x = v24;
        v52.origin.y = v26;
        v52.size.width = v28;
        v52.size.height = v30;
        MinX = CGRectGetMaxX(v52);
      }
      v24 = MinX - v33;
      goto LABEL_17;
    case 4:
      if (v7)
      {
        v50.origin.x = v9;
        v50.origin.y = v11;
        v50.size.width = v13;
        v50.size.height = rect;
        MaxX = CGRectGetMaxX(v50);
      }
      else
      {
        v51.origin.x = v24;
        v51.origin.y = v26;
        v51.size.width = v28;
        v51.size.height = v30;
        MaxX = CGRectGetMinX(v51);
      }
      v24 = MaxX;
LABEL_17:
      v28 = v33;
      break;
    default:
      break;
  }

  v39 = v24;
  v40 = v26;
  v41 = v28;
  v42 = v30;
  result.size.height = v42;
  result.size.width = v41;
  result.origin.y = v40;
  result.origin.x = v39;
  return result;
}

- (id)_viewToLayoutBadgesBelowForLayoutStyle:(int64_t)a3 orientation:(int64_t)a4
{
  void *v7;
  char v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  BOOL v16;
  char v17;
  void *v18;
  int v19;
  char v20;
  char v21;
  id v22;
  char v24;
  BOOL v25;
  int v26;

  -[CAMViewfinderView visibilityDelegate](self, "visibilityDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v7, "shouldHideElapsedTimeView");
  v24 = objc_msgSend(v7, "shouldHideTopBar");
  v8 = objc_msgSend(v7, "shouldShiftPreviewForUtilityBar");
  v9 = objc_msgSend(v7, "shouldHidePortraitModeInstructionLabel");
  v10 = objc_msgSend(v7, "shouldHideQRCodeInstructionLabel");
  v25 = -[CAMViewfinderView _shouldLayoutPortraitInstructionsAtTop](self, "_shouldLayoutPortraitInstructionsAtTop");
  -[CAMViewfinderView topBar](self, "topBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMViewfinderView elapsedTimeView](self, "elapsedTimeView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 & 1) != 0
    || (-[CAMViewfinderView portraitModeInstructionLabel](self, "portraitModeInstructionLabel"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        !v13))
  {
    if ((v10 & 1) != 0)
    {
      v14 = 0;
    }
    else
    {
      -[CAMViewfinderView qrCodeInstructionLabel](self, "qrCodeInstructionLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        -[CAMViewfinderView qrCodeInstructionLabel](self, "qrCodeInstructionLabel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 1;
      }
    }
  }
  else
  {
    -[CAMViewfinderView portraitModeInstructionLabel](self, "portraitModeInstructionLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a3)
  {
    if (a3 != 4)
      v8 = 0;
  }
  else
  {
    v8 = 1;
  }
  if ((unint64_t)a4 >= 3)
  {
    if ((unint64_t)(a4 - 3) > 1)
    {
      LOBYTE(v15) = 0;
    }
    else
    {
      v15 = !-[CAMViewfinderView _isAdjustingTopBarOrientationForLayoutStyle:](self, "_isAdjustingTopBarOrientationForLayoutStyle:", a3);
      v8 = 1;
    }
  }
  else
  {
    LOBYTE(v15) = +[CAMBottomBar wantsVerticalBarForLayoutStyle:](CAMBottomBar, "wantsVerticalBarForLayoutStyle:", a3);
  }
  if ((v10 & v9 & 1) == 0)
  {
    v16 = v25;
    if (!v14)
      v16 = 0;
    v17 = v16 & v8;
    v18 = v14;
    if ((v17 & 1) != 0)
      goto LABEL_29;
  }
  v19 = v12 ? v26 : 1;
  v18 = v12;
  if (v19 != 1)
    goto LABEL_29;
  v20 = v24;
  if (!v11)
    v20 = 1;
  v21 = v20 | v15;
  v18 = v11;
  if ((v21 & 1) != 0)
    v22 = 0;
  else
LABEL_29:
    v22 = v18;

  return v22;
}

- (CAMElapsedTimeView)elapsedTimeView
{
  return self->_elapsedTimeView;
}

uint64_t __60__CAMViewfinderView__layoutBadgeTrayWithBadges_layoutStyle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (CAMViewfinderOpenAndCloseTransition)_openAndCloseTransition
{
  return self->__openAndCloseTransition;
}

- (void)_setOpenAndCloseTransition:(id)a3
{
  objc_storeStrong((id *)&self->__openAndCloseTransition, a3);
}

- (void)removeInflightBlurAnimations
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[CAMViewfinderView _previewContainerView](self, "_previewContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v2, "subviews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v8, "removeInflightBlurAnimations");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)prepareForResumingUsingCrossfade
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[CAMViewfinderView _previewContainerView](self, "_previewContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v2, "subviews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v8, "prepareForResumingUsingCrossfade");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (CAMViewfinderView)initWithFrame:(CGRect)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return -[CAMViewfinderView initWithLayoutStyle:](self, "initWithLayoutStyle:", v5);
}

- (CAMViewfinderView)initWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return -[CAMViewfinderView initWithLayoutStyle:](self, "initWithLayoutStyle:", v5);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[CAMViewfinderView systemLayoutSizeFittingSize:forAspectRatio:](self, "systemLayoutSizeFittingSize:forAspectRatio:", -[CAMViewfinderView desiredAspectRatio](self, "desiredAspectRatio"), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 forAspectRatio:(int64_t)a4
{
  double height;
  double width;
  void *v7;
  int64_t v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CAMViewfinderView _multiplierForAspectRatio:](self, "_multiplierForAspectRatio:", a4);
  -[CAMViewfinderView window](self, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CAMInterfaceOrientationForWindow(v7);

  if (width >= height)
    v9 = height;
  else
    v9 = width;
  UIRoundToViewScale();
  if ((unint64_t)(v8 - 3) >= 2)
    v11 = v10;
  else
    v11 = v9;
  if ((unint64_t)(v8 - 3) < 2)
    v9 = v10;
  if (v9 > width || v11 > height)
  {
    UIRoundToViewScale();
    v9 = v13;
    UIRoundToViewScale();
    v11 = v14;
  }
  v15 = v9;
  v16 = v11;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    -[CAMViewfinderView _updateModernLayout](self, "_updateModernLayout");
    -[CAMViewfinderView _updateBarExtensionViewsIfNecessary](self, "_updateBarExtensionViewsIfNecessary");
    -[CAMViewfinderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)_wantsPreviewOnlyLayoutForTopBarFrame:(CGRect)a3 bottomBarFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  _BOOL4 v12;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v15.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
  v15.origin.y = v9;
  v15.size.width = v10;
  v15.size.height = v11;
  v12 = CGRectEqualToRect(a3, v15);
  if (v12)
  {
    v14.origin.x = x;
    v14.origin.y = y;
    v14.size.width = width;
    v14.size.height = height;
    v16.origin.x = v8;
    v16.origin.y = v9;
    v16.size.width = v10;
    v16.size.height = v11;
    LOBYTE(v12) = CGRectEqualToRect(v14, v16);
  }
  return v12;
}

- (void)_updateBarExtensionViewsIfNecessary
{
  int64_t v3;
  int64_t v4;
  UIView *topBarExtensionView;
  UIView *v6;
  UIView *bottomBarExtensionView;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIView *v13;
  UIView *v14;
  UIView *v15;
  UIView *v16;
  UIView *v17;

  v3 = -[CAMViewfinderView layoutStyle](self, "layoutStyle");
  v4 = -[CAMViewfinderView desiredAspectRatio](self, "desiredAspectRatio");
  topBarExtensionView = self->__topBarExtensionView;
  if (v3 != 4 || v4 != 4)
  {
    -[UIView removeFromSuperview](topBarExtensionView, "removeFromSuperview");
    v6 = self->__topBarExtensionView;
    self->__topBarExtensionView = 0;

    -[UIView removeFromSuperview](self->__bottomBarExtensionView, "removeFromSuperview");
    bottomBarExtensionView = self->__bottomBarExtensionView;
    self->__bottomBarExtensionView = 0;
LABEL_7:

    return;
  }
  if (!topBarExtensionView)
  {
    v8 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v9 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v13 = (UIView *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], v10, v11, v12);
    v14 = self->__topBarExtensionView;
    self->__topBarExtensionView = v13;

    v15 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v9, v10, v11, v12);
    v16 = self->__bottomBarExtensionView;
    self->__bottomBarExtensionView = v15;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.3);
    v17 = (UIView *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->__topBarExtensionView, "setBackgroundColor:", v17);
    -[UIView setBackgroundColor:](self->__bottomBarExtensionView, "setBackgroundColor:", v17);
    -[CAMViewfinderView addSubview:](self, "addSubview:", self->__topBarExtensionView);
    -[CAMViewfinderView addSubview:](self, "addSubview:", self->__bottomBarExtensionView);
    bottomBarExtensionView = v17;
    goto LABEL_7;
  }
}

void __52__CAMViewfinderView_setMaskingAspectRatio_animated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_previewContainerMaskingView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClipsToBounds:", 1);
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");

}

- (void)_updateModernLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  BOOL v26;
  void *v27;
  int v28;
  double v29;
  void *v30;
  void *v31;
  CAMFullscreenViewfinderLayout *v32;
  double v33[5];

  -[CAMViewfinderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[CAMViewfinderView layoutStyle](self, "layoutStyle");
  -[CAMViewfinderView topBar](self, "topBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[CAMViewfinderView bottomBar](self, "bottomBar");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "frame");
  v26 = -[CAMViewfinderView _wantsPreviewOnlyLayoutForTopBarFrame:bottomBarFrame:](self, "_wantsPreviewOnlyLayoutForTopBarFrame:bottomBarFrame:", v14, v16, v18, v20, v22, v23, v24, v25);

  if (!v26
    && (v11 == 4 && v8 < 350.0
     || (+[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities"),
         v27 = (void *)objc_claimAutoreleasedReturnValue(),
         v28 = objc_msgSend(v27, "imagePickerUsesModernLayout"),
         v27,
         v28)))
  {
    CAMShutterButtonSpecForLayoutStyle(v11, (uint64_t)v33);
    v29 = v33[0];
    -[CAMViewfinderView _modernLayout](self, "_modernLayout");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v30)
    {
      objc_msgSend(v30, "setShutterIntrinsicSize:", v29, v29);
      objc_msgSend(v31, "setReferenceBounds:", v4, v6, v8, v10);
    }
    else
    {
      v32 = -[CAMFullscreenViewfinderLayout initWithReferenceBounds:shutterIntrinsicSize:]([CAMFullscreenViewfinderLayout alloc], "initWithReferenceBounds:shutterIntrinsicSize:", v4, v6, v8, v10, v29, v29);
      -[CAMViewfinderView _setModernLayout:](self, "_setModernLayout:", v32);

    }
  }
  else
  {
    -[CAMViewfinderView _setModernLayout:](self, "_setModernLayout:", 0);
  }
}

- (void)_layoutVideoConfigurationStatusIndicatorForLayoutStyle:(int64_t)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  id v19;
  CGRect v20;
  CGRect v21;

  if (+[CAMBottomBar wantsVerticalBarForLayoutStyle:](CAMBottomBar, "wantsVerticalBarForLayoutStyle:", a3))
  {
    -[CAMViewfinderView videoConfigurationStatusIndicator](self, "videoConfigurationStatusIndicator");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    -[CAMViewfinderView elapsedTimeView](self, "elapsedTimeView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    objc_msgSend(v4, "alignmentRectForFrame:");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v19, "intrinsicContentSize");
    v14 = v13;
    v16 = v15;
    v20.origin.x = v6;
    v20.origin.y = v8;
    v20.size.width = v10;
    v20.size.height = v12;
    v17 = CGRectGetMaxX(v20) + 16.0;
    v21.origin.x = v6;
    v21.origin.y = v8;
    v21.size.width = v10;
    v21.size.height = v12;
    CGRectGetMidY(v21);
    UIRoundToViewScale();
    objc_msgSend(v19, "frameForAlignmentRect:", v17, v18 + CAMPixelWidthForView(self), v14, v16);
    objc_msgSend(v19, "setFrame:");

  }
}

- (void)_layoutImageAnalysisInstructionLabelForLayoutStyle:(int64_t)a3
{
  id v5;

  -[CAMViewfinderView imageAnalysisInstructionLabel](self, "imageAnalysisInstructionLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStyle:", 1);
  -[CAMViewfinderView _layoutInstructionLabelOnTop:forLayoutStyle:](self, "_layoutInstructionLabelOnTop:forLayoutStyle:", v5, a3);

}

void __96__CAMViewfinderView__layoutBadgeTrayForLayoutStyle_appearingBadges_disappearingBadges_animated___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v6++), "setAlpha:", 0.0);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v4);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = *(id *)(a1 + 40);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11++), "setAlpha:", 1.0, (_QWORD)v13);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v9);
  }

  objc_msgSend(*(id *)(a1 + 48), "visibleTopBadges");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_layoutBadgeTrayWithBadges:layoutStyle:", v12, *(_QWORD *)(a1 + 56));

}

- (void)_layoutBadgeForTinyLayoutStyle:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  unint64_t v24;
  double v25;
  __int128 v26;
  void *v27;
  int v28;
  double v29;
  double v30;
  id v31;
  _QWORD v32[4];
  id v33;
  double v34;
  _OWORD v35[3];
  __int128 v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v4 = a4;
  v6 = a3;
  -[CAMViewfinderView bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v16 = v15;
  v18 = v17;
  UIRoundToViewScale();
  v20 = v19;
  UIRoundToViewScale();
  v22 = v21;
  v37 = 0.0;
  v38 = 0.0;
  v39 = v16;
  v40 = v18;
  v36 = *MEMORY[0x1E0C9D538];
  -[CAMViewfinderView window](self, "window");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = CAMInterfaceOrientationForWindow(v23);

  if (v24 >= 3)
  {
    if (v24 - 3 >= 2)
      goto LABEL_6;
    v43.origin.x = v8;
    v43.origin.y = v10;
    v43.size.width = v12;
    v43.size.height = v14;
    *(double *)&v36 = v20 + CGRectGetMinX(v43) + 10.0;
    v44.origin.x = v8;
    v44.origin.y = v10;
    v44.size.width = v12;
    v44.size.height = v14;
    v25 = CGRectGetMaxY(v44) - v22 + -10.0;
  }
  else
  {
    v41.origin.x = v8;
    v41.origin.y = v10;
    v41.size.width = v12;
    v41.size.height = v14;
    *(double *)&v36 = v20 + CGRectGetMinX(v41) + 10.0;
    v42.origin.x = v8;
    v42.origin.y = v10;
    v42.size.width = v12;
    v42.size.height = v14;
    v25 = v22 + CGRectGetMinY(v42) + 10.0;
  }
  *((double *)&v36 + 1) = v25;
LABEL_6:
  +[CAMView ceilBounds:andRoundCenter:toViewScale:](CAMView, "ceilBounds:andRoundCenter:toViewScale:", &v37, &v36, self);
  objc_msgSend(v6, "setBounds:", v37, v38, v39, v40);
  objc_msgSend(v6, "setCenter:", v36);
  v26 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v35[0] = *MEMORY[0x1E0C9BAA8];
  v35[1] = v26;
  v35[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v6, "setTransform:", v35);
  -[CAMViewfinderView visibleTopBadges](self, "visibleTopBadges");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "containsObject:", v6);
  v29 = 1.0;
  if (!v28)
    v29 = 0.0;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __61__CAMViewfinderView__layoutBadgeForTinyLayoutStyle_animated___block_invoke;
  v32[3] = &unk_1EA328B18;
  if (v4)
    v30 = 0.25;
  else
    v30 = 0.0;
  v33 = v6;
  v34 = v29;
  v31 = v6;
  +[CAMView animateIfNeededWithDuration:animations:](CAMView, "animateIfNeededWithDuration:animations:", v32, v30);

}

uint64_t __61__CAMViewfinderView__layoutBadgeForTinyLayoutStyle_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

- (void)_layoutTextInteractionInsertAndActionInfoView
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  CGFloat v51;
  CGFloat rect;
  void *rect_24;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  -[CAMViewfinderView textInteractionInsert](self, "textInteractionInsert");
  rect_24 = (void *)objc_claimAutoreleasedReturnValue();
  if (rect_24)
  {
    -[CAMViewfinderView previewView](self, "previewView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "videoPreviewLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "rectForMetadataOutputRectOfInterest:", 0.0, 0.0, 1.0, 1.0);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[CAMViewfinderView layer](self, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "convertRect:fromLayer:", v4, v6, v8, v10, v12);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    objc_msgSend(rect_24, "setFrame:", v15, v17, v19, v21);
    -[CAMViewfinderView bounds](self, "bounds");
    v23 = v22;
    v51 = v24;
    rect = v22;
    v26 = v25;
    v28 = v27;
    v54.origin.x = v15;
    v54.origin.y = v17;
    v54.size.width = v19;
    v54.size.height = v21;
    CGRectGetMaxX(v54);
    v55.origin.x = v23;
    v55.origin.y = v51;
    v55.size.width = v26;
    v55.size.height = v28;
    CGRectGetMaxX(v55);
    v56.origin.x = v15;
    v56.origin.y = v17;
    v56.size.width = v19;
    v56.size.height = v21;
    CGRectGetMaxY(v56);
    v57.origin.x = rect;
    v57.origin.y = v51;
    v57.size.width = v26;
    v57.size.height = v28;
    CGRectGetMaxY(v57);
    UIEdgeInsetsMakeWithEdges();
    UIEdgeInsetsAdd();
    UIEdgeInsetsMax();
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    -[CAMViewfinderView bottomBar](self, "bottomBar");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "frame");
    v39 = v36 + v38;

    -[CAMViewfinderView bottomBar](self, "bottomBar");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "imageAnalysisButton");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "backgroundDiameter");
    v43 = v42;

    objc_msgSend(rect_24, "setPreferredQuickActionButtonHeight:", v43);
    objc_msgSend(rect_24, "actionInfoView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      objc_msgSend(rect_24, "bounds");
      v58.origin.y = v30 + v45;
      v58.size.height = v46 - (v30 + v34);
      v58.origin.x = v32 + v47;
      v58.size.width = v48 - (v32 + v39);
      objc_msgSend(v44, "setFrame:", v58.origin.x, CGRectGetMaxY(v58) - v43, v58.size.width, v43);
    }
    -[CAMViewfinderView imageAnalysisInstructionLabel](self, "imageAnalysisInstructionLabel");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "frame");
    v50 = v30 + CGRectGetMaxY(v59);

    objc_msgSend(rect_24, "setContentInsets:", v50, v32, v34 + v43, v39);
  }

}

- (void)_layoutMachineReadableCodeButton
{
  id v3;

  -[CAMViewfinderView machineReadableCodeButton](self, "machineReadableCodeButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMViewfinderView _layoutBottomCenteredView:aboveView:aboveViewSpacing:forLayoutStyle:](self, "_layoutBottomCenteredView:aboveView:aboveViewSpacing:forLayoutStyle:", v3, 0, 1, 0.0);

}

uint64_t __35__CAMViewfinderView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutDescriptionOverlayView:");
}

- (void)_previewLayoutForAspectRatio:(int64_t)a3 shouldShiftPreviewForUtilityBar:(BOOL)a4 outPreviewBounds:(CGRect *)a5 outPreviewCenter:(CGPoint *)a6 outFourThreeTopBarFrame:(CGRect *)a7 outBottomBarFrame:(CGRect *)a8
{
  _BOOL8 v12;
  void *v15;
  _BOOL8 v16;
  uint64_t v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  void *v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  void *v30;
  double MaxY;
  void *v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double v61;
  double v62;
  CGRect v63;
  CGRect v64;

  v12 = a4;
  -[CAMViewfinderView _modernLayout](self, "_modernLayout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = a3 != 3 && v12;
    v17 = -[CAMViewfinderView useCreativeControls](self, "useCreativeControls") & !v12;
    -[CAMViewfinderView _modernLayout](self, "_modernLayout");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", a3, v17, v16);
    v20 = v19;
    v22 = v21;

    if (a5)
    {
      a5->size.width = v20;
      a5->size.height = v22;
      a5->origin = (CGPoint)*MEMORY[0x1E0C9D538];
    }
    if (a6)
    {
      UIRectGetCenter();
      a6->x = v23;
      a6->y = v24;
    }
    if (a7)
    {
      -[CAMViewfinderView _modernLayout](self, "_modernLayout");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "frameForControlStatusBar");
      a7->origin.x = v26;
      a7->origin.y = v27;
      a7->size.width = v28;
      a7->size.height = v29;

    }
    if (a8)
    {
      -[CAMViewfinderView _modernLayout](self, "_modernLayout");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 0, -[CAMViewfinderView useCreativeControls](self, "useCreativeControls"), 0);
      MaxY = CGRectGetMaxY(v63);

      -[CAMViewfinderView _modernLayout](self, "_modernLayout");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 1, -[CAMViewfinderView useCreativeControls](self, "useCreativeControls"), 0);
      v33 = CGRectGetMaxY(v64);

      a8->origin.x = 0.0;
      a8->origin.y = MaxY;
      -[CAMViewfinderView bounds](self, "bounds");
      a8->size.width = v34;
      a8->size.height = v33 - MaxY;
    }
  }
  else if (-[CAMViewfinderView useCreativeControls](self, "useCreativeControls"))
  {
    -[CAMViewfinderView bounds](self, "bounds");
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v42 = v41;
    -[CAMViewfinderView _previewSizeForAspectRatio:](self, "_previewSizeForAspectRatio:", a3);
    objc_msgSend(MEMORY[0x1E0D7D240], "cameraContentGeometryForReferenceBounds:forContentSize:withOrientation:shouldShiftPreviewForUtilityBar:", -[CAMViewfinderView orientation](self, "orientation", 0, 0), v12, v36, v38, v40, v42, v43, v44);
    objc_msgSend(MEMORY[0x1E0D7D240], "cameraTopBarFrameForReferenceBounds:", v36, v38, v40, v42);
    v46 = v45;
    v48 = v47;
    v50 = v49;
    v52 = v51;
    objc_msgSend(MEMORY[0x1E0D7D240], "cameraBottomBarFrameForReferenceBounds:", v36, v38, v40, v42);
    v54 = v53;
    v56 = v55;
    v58 = v57;
    v60 = v59;
    if (a5)
    {
      a5->origin.x = 0.0;
      a5->origin.y = 0.0;
      a5->size.width = fmin(0.0, 0.0);
      a5->size.height = fmax(0.0, 0.0);
    }
    if (a6)
    {
      -[CAMViewfinderView _previewOffset](self, "_previewOffset");
      a6->x = v61 + 0.0;
      a6->y = v62 + 0.0;
    }
    if (a7)
    {
      a7->origin.x = v46;
      a7->origin.y = v48;
      a7->size.width = v50;
      a7->size.height = v52;
    }
    if (a8)
    {
      a8->origin.x = v54;
      a8->origin.y = v56;
      a8->size.width = v58;
      a8->size.height = v60;
    }
  }
  else
  {
    -[CAMViewfinderView _cameraAppPreviewLayoutForAspectRatio:shouldShiftPreviewForUtilityBar:outPreviewBounds:outPreviewCenter:outFourThreeTopBarFrame:outBottomBarFrame:](self, "_cameraAppPreviewLayoutForAspectRatio:shouldShiftPreviewForUtilityBar:outPreviewBounds:outPreviewCenter:outFourThreeTopBarFrame:outBottomBarFrame:", a3, v12, a5, a6, a7, a8);
  }
}

- (void)_cameraAppPreviewLayoutForAspectRatio:(int64_t)a3 shouldShiftPreviewForUtilityBar:(BOOL)a4 outPreviewBounds:(CGRect *)a5 outPreviewCenter:(CGPoint *)a6 outFourThreeTopBarFrame:(CGRect *)a7 outBottomBarFrame:(CGRect *)a8
{
  _BOOL8 v12;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat Width;
  double Height;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double MaxY;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat x;
  CGFloat y;
  CGFloat v60;
  CGFloat v61;
  double MidY;
  void *v63;
  int64_t v64;
  void *v65;
  void *v66;
  char v67;
  double v68;
  double v69;
  double v70;
  double MidX;
  double v72;
  CGFloat v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double MinX;
  double MinY;
  id v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;

  v12 = a4;
  -[CAMViewfinderView bounds](self, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = -[CAMViewfinderView layoutStyle](self, "layoutStyle");
  -[CAMViewfinderView _layoutMarginInsetsForLayoutStyle:](self, "_layoutMarginInsetsForLayoutStyle:", v23);
  v25 = v16 + v24;
  v27 = v18 + v26;
  v29 = v20 - (v24 + v28);
  v31 = v22 - (v26 + v30);
  v81.origin.x = v25;
  v81.origin.y = v27;
  v81.size.width = v29;
  v81.size.height = v31;
  Width = CGRectGetWidth(v81);
  v82.origin.x = v25;
  v82.origin.y = v27;
  v82.size.width = v29;
  v82.size.height = v31;
  Height = CGRectGetHeight(v82);
  -[CAMViewfinderView topBar](self, "topBar");
  v80 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMViewfinderView _previewSizeForAspectRatio:](self, "_previewSizeForAspectRatio:", 0);
  v72 = v34;
  v74 = Width;
  v36 = v35;
  if (v80)
  {
    -[CAMViewfinderView _topBarSizeForLayoutStyle:](self, "_topBarSizeForLayoutStyle:", v23);
    v38 = v37;
    v40 = v39;
    v83.origin.x = v25;
    v83.origin.y = v27;
    v83.size.width = v29;
    v83.size.height = v31;
    MinY = CGRectGetMinY(v83);
    v84.origin.x = v25;
    v84.origin.y = v27;
    v84.size.width = v29;
    v84.size.height = v31;
    v77 = v38;
    MinX = CGRectGetMinX(v84);
    v76 = v40;
  }
  else
  {
    v38 = *MEMORY[0x1E0C9D820];
    v40 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v85.origin.x = v25;
    v85.origin.y = v27;
    v85.size.width = v29;
    v85.size.height = v31;
    CGRectGetMinY(v85);
    MinX = *MEMORY[0x1E0C9D648];
    MinY = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v76 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v77 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  }
  -[CAMViewfinderView bottomBar](self, "bottomBar");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    -[CAMViewfinderView _bottomBarSizeForLayoutStyle:withProposedSize:](self, "_bottomBarSizeForLayoutStyle:withProposedSize:", v23, v74 - (v72 + v38), Height - (v36 + v40));
    v43 = v42;
    v45 = v44;
    v86.origin.x = v25;
    v86.origin.y = v27;
    v86.size.width = v29;
    v86.size.height = v31;
    MaxY = CGRectGetMaxY(v86);
    v87.origin.x = v25;
    v87.origin.y = v27;
    v47 = v43;
    v87.size.width = v29;
    v87.size.height = v31;
    v48 = CGRectGetMaxX(v87) - v43;
    v49 = MaxY - v45;
    v50 = v45;
  }
  else
  {
    v88.origin.x = v25;
    v88.origin.y = v27;
    v88.size.width = v29;
    v88.size.height = v31;
    CGRectGetMaxY(v88);
    v48 = *MEMORY[0x1E0C9D648];
    v49 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v47 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v50 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  -[CAMViewfinderView _previewSizeForAspectRatio:](self, "_previewSizeForAspectRatio:", a3);
  v73 = v49;
  v75 = v51;
  v53 = v52;
  v54 = v48;
  v55 = v49;
  v56 = v47;
  v57 = v50;
  -[CAMViewfinderView _previewFrameForAspectRatio:topBarFrame:bottomBarFrame:shouldShiftPreviewForUtilityBar:](self, "_previewFrameForAspectRatio:topBarFrame:bottomBarFrame:shouldShiftPreviewForUtilityBar:", a3, v12, MinX, MinY, v77, v76, v48, v55, v47, v50);
  x = v89.origin.x;
  y = v89.origin.y;
  v60 = v89.size.width;
  v61 = v89.size.height;
  MidX = CGRectGetMidX(v89);
  v90.origin.x = x;
  v90.origin.y = y;
  v90.size.width = v60;
  v90.size.height = v61;
  MidY = CGRectGetMidY(v90);
  if (!-[CAMViewfinderView _wantsInterfaceOrientedPreviewForLayoutStyle:](self, "_wantsInterfaceOrientedPreviewForLayoutStyle:", v23))
  {
    v68 = v75;
    if (!a5)
      goto LABEL_19;
    goto LABEL_18;
  }
  -[CAMViewfinderView window](self, "window");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = CAMInterfaceOrientationForWindow(v63);

  -[CAMViewfinderView window](self, "window");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "screen");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v66, "_isEmbeddedScreen");

  if ((v67 & 1) == 0)
    v64 = -[CAMViewfinderView externalDisplayPreviewOrientation](self, "externalDisplayPreviewOrientation");
  if ((unint64_t)(v64 - 3) >= 2)
    v68 = v75;
  else
    v68 = v53;
  if ((unint64_t)(v64 - 3) < 2)
    v53 = v75;
  if (a5)
  {
LABEL_18:
    a5->origin.x = 0.0;
    a5->origin.y = 0.0;
    a5->size.width = v68;
    a5->size.height = v53;
  }
LABEL_19:
  if (a6)
  {
    -[CAMViewfinderView _previewOffset](self, "_previewOffset", v68);
    a6->x = MidX + v69;
    a6->y = MidY + v70;
  }
  if (a7)
  {
    a7->origin.x = MinX;
    a7->origin.y = MinY;
    a7->size.width = v77;
    a7->size.height = v76;
  }
  if (a8)
  {
    a8->origin.x = v54;
    a8->origin.y = v73;
    a8->size.width = v56;
    a8->size.height = v57;
  }

}

- (UIOffset)_previewOffset
{
  int64_t v3;
  double v4;
  double v5;
  void *v6;
  int64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v21;
  double v22;
  UIOffset result;

  v3 = -[CAMViewfinderView layoutStyle](self, "layoutStyle");
  v5 = *MEMORY[0x1E0DC51A8];
  v4 = *(double *)(MEMORY[0x1E0DC51A8] + 8);
  if (v3 == 1)
  {
    -[CAMViewfinderView window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CAMInterfaceOrientationForWindow(v6);

    v8 = v7 - 1;
    -[CAMViewfinderView window](self, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "screen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_referenceBounds");
    v12 = v11;
    v14 = v13;

    if (v14 == 0.0)
      v15 = 1.0;
    else
      v15 = v12 / v14;
    -[CAMViewfinderView previewView](self, "previewView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "videoPreviewView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "previewViewAspectMode");

    v19 = -15.0;
    if (v8 >= 2)
      v19 = v5;
    if (v15 != 0.75 && v18 == 1)
      v5 = v19;
  }
  v21 = v5;
  v22 = v4;
  result.vertical = v22;
  result.horizontal = v21;
  return result;
}

- (double)_utilityBarExtensionDistanceForLayoutStyle:(int64_t)a3
{
  CGSize v5;
  __int128 v6;
  CGRect v7;
  __int128 v8;
  CGPoint v9;
  CGSize v10;

  if (+[CAMBottomBar wantsVerticalBarForLayoutStyle:](CAMBottomBar, "wantsVerticalBarForLayoutStyle:", a3))
  {
    return 110.0;
  }
  v5 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v9 = (CGPoint)*MEMORY[0x1E0C9D648];
  v10 = v5;
  v6 = *MEMORY[0x1E0C9D538];
  v7.size = v5;
  v8 = v6;
  v7.origin = v9;
  -[CAMViewfinderView _previewLayoutForAspectRatio:shouldShiftPreviewForUtilityBar:outPreviewBounds:outPreviewCenter:outFourThreeTopBarFrame:outBottomBarFrame:](self, "_previewLayoutForAspectRatio:shouldShiftPreviewForUtilityBar:outPreviewBounds:outPreviewCenter:outFourThreeTopBarFrame:outBottomBarFrame:", -[CAMViewfinderView desiredAspectRatio](self, "desiredAspectRatio"), 1, &v9, &v8, 0, &v7);
  return CGRectGetMinY(v7) - (*((double *)&v8 + 1) + v10.height * 0.5);
}

- (void)setDisabledModeOverlayView:(id)a3
{
  CAMDisabledModeOverlayView *v5;
  CAMDisabledModeOverlayView *disabledModeOverlayView;
  void *v7;
  CAMDisabledModeOverlayView *v8;

  v5 = (CAMDisabledModeOverlayView *)a3;
  disabledModeOverlayView = self->_disabledModeOverlayView;
  v8 = v5;
  if (disabledModeOverlayView != v5)
  {
    -[CAMDisabledModeOverlayView removeFromSuperview](disabledModeOverlayView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_disabledModeOverlayView, a3);
    -[CAMViewfinderView _previewContainerMaskingView](self, "_previewContainerMaskingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);
    -[CAMViewfinderView setNeedsLayout](self, "setNeedsLayout");

  }
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
    -[CAMViewfinderView addSubview:](self, "addSubview:", v7);
  }

}

- (void)setVideoConfigurationStatusIndicator:(id)a3
{
  CAMVideoConfigurationStatusIndicator *v5;
  CAMVideoConfigurationStatusIndicator **p_videoConfigurationStatusIndicator;
  CAMVideoConfigurationStatusIndicator *videoConfigurationStatusIndicator;
  CAMViewfinderView *v8;
  CAMViewfinderView *v9;
  CAMVideoConfigurationStatusIndicator *v10;

  v5 = (CAMVideoConfigurationStatusIndicator *)a3;
  p_videoConfigurationStatusIndicator = &self->_videoConfigurationStatusIndicator;
  videoConfigurationStatusIndicator = self->_videoConfigurationStatusIndicator;
  if (videoConfigurationStatusIndicator != v5)
  {
    v10 = v5;
    -[CAMVideoConfigurationStatusIndicator superview](videoConfigurationStatusIndicator, "superview");
    v8 = (CAMViewfinderView *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[CAMVideoConfigurationStatusIndicator removeFromSuperview](*p_videoConfigurationStatusIndicator, "removeFromSuperview");
    -[CAMControlStatusIndicator delegate](*p_videoConfigurationStatusIndicator, "delegate");
    v9 = (CAMViewfinderView *)objc_claimAutoreleasedReturnValue();

    if (v9 == self)
      -[CAMControlStatusIndicator setDelegate:](*p_videoConfigurationStatusIndicator, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_videoConfigurationStatusIndicator, a3);
    -[CAMControlStatusIndicator setDelegate:](*p_videoConfigurationStatusIndicator, "setDelegate:", self);
    -[CAMViewfinderView addSubview:](self, "addSubview:", *p_videoConfigurationStatusIndicator);
    v5 = v10;
  }

}

- (void)setLivePhotoBadge:(id)a3
{
  CAMLivePhotoBadge *v5;
  CAMLivePhotoBadge **p_livePhotoBadge;
  CAMLivePhotoBadge *livePhotoBadge;
  CAMViewfinderView *v8;
  void *v9;
  char v10;
  CAMLivePhotoBadge *v11;

  v5 = (CAMLivePhotoBadge *)a3;
  p_livePhotoBadge = &self->_livePhotoBadge;
  livePhotoBadge = self->_livePhotoBadge;
  if (livePhotoBadge != v5)
  {
    v11 = v5;
    -[CAMLivePhotoBadge removeFromSuperview](livePhotoBadge, "removeFromSuperview");
    -[CEKBadgeView delegate](*p_livePhotoBadge, "delegate");
    v8 = (CAMViewfinderView *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[CEKBadgeView setDelegate:](*p_livePhotoBadge, "setDelegate:", 0);
    -[CAMLivePhotoBadge setAlpha:](*p_livePhotoBadge, "setAlpha:", 1.0);
    objc_storeStrong((id *)&self->_livePhotoBadge, a3);
    -[CEKBadgeView setDelegate:](*p_livePhotoBadge, "setDelegate:", self);
    -[CAMViewfinderView visibleTopBadges](self, "visibleTopBadges");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", *p_livePhotoBadge);

    if ((v10 & 1) == 0)
      -[CAMLivePhotoBadge setAlpha:](*p_livePhotoBadge, "setAlpha:", 0.0);
    -[CAMViewfinderView addSubview:](self, "addSubview:", v11);
    v5 = v11;
  }

}

- (void)setShallowDepthOfFieldBadge:(id)a3
{
  CAMShallowDepthOfFieldBadge *v5;
  CAMShallowDepthOfFieldBadge **p_shallowDepthOfFieldBadge;
  CAMShallowDepthOfFieldBadge *shallowDepthOfFieldBadge;
  void *v8;
  char v9;
  CAMShallowDepthOfFieldBadge *v10;

  v5 = (CAMShallowDepthOfFieldBadge *)a3;
  p_shallowDepthOfFieldBadge = &self->_shallowDepthOfFieldBadge;
  shallowDepthOfFieldBadge = self->_shallowDepthOfFieldBadge;
  if (shallowDepthOfFieldBadge != v5)
  {
    v10 = v5;
    -[CAMShallowDepthOfFieldBadge removeFromSuperview](shallowDepthOfFieldBadge, "removeFromSuperview");
    -[CAMShallowDepthOfFieldBadge setAlpha:](*p_shallowDepthOfFieldBadge, "setAlpha:", 1.0);
    objc_storeStrong((id *)&self->_shallowDepthOfFieldBadge, a3);
    -[CAMViewfinderView visibleTopBadges](self, "visibleTopBadges");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", *p_shallowDepthOfFieldBadge);

    if ((v9 & 1) == 0)
      -[CAMShallowDepthOfFieldBadge setAlpha:](*p_shallowDepthOfFieldBadge, "setAlpha:", 0.0);
    -[CAMViewfinderView addSubview:](self, "addSubview:", v10);
    v5 = v10;
  }

}

- (void)setPortraitModeInstructionLabel:(id)a3
{
  CAMPortraitModeInstructionLabel *v5;
  CAMPortraitModeInstructionLabel **p_portraitModeInstructionLabel;
  CAMPortraitModeInstructionLabel *portraitModeInstructionLabel;
  CAMViewfinderView *v8;
  CAMPortraitModeInstructionLabel *v9;

  v5 = (CAMPortraitModeInstructionLabel *)a3;
  p_portraitModeInstructionLabel = &self->_portraitModeInstructionLabel;
  portraitModeInstructionLabel = self->_portraitModeInstructionLabel;
  if (portraitModeInstructionLabel != v5)
  {
    v9 = v5;
    -[CAMPortraitModeInstructionLabel removeFromSuperview](portraitModeInstructionLabel, "removeFromSuperview");
    -[CAMInstructionLabel delegate](*p_portraitModeInstructionLabel, "delegate");
    v8 = (CAMViewfinderView *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[CAMInstructionLabel setDelegate:](*p_portraitModeInstructionLabel, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_portraitModeInstructionLabel, a3);
    -[CAMInstructionLabel setDelegate:](*p_portraitModeInstructionLabel, "setDelegate:", self);
    -[CAMViewfinderView addSubview:](self, "addSubview:", v9);
    v5 = v9;
  }

}

- (void)setSharedLibraryBadge:(id)a3
{
  CAMSharedLibraryBadge *v5;
  CAMSharedLibraryBadge **p_sharedLibraryBadge;
  CAMSharedLibraryBadge *sharedLibraryBadge;
  CAMViewfinderView *v8;
  void *v9;
  char v10;
  CAMSharedLibraryBadge *v11;

  v5 = (CAMSharedLibraryBadge *)a3;
  p_sharedLibraryBadge = &self->_sharedLibraryBadge;
  sharedLibraryBadge = self->_sharedLibraryBadge;
  if (sharedLibraryBadge != v5)
  {
    v11 = v5;
    -[CAMSharedLibraryBadge removeFromSuperview](sharedLibraryBadge, "removeFromSuperview");
    -[CEKBadgeView delegate](*p_sharedLibraryBadge, "delegate");
    v8 = (CAMViewfinderView *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[CEKBadgeView setDelegate:](*p_sharedLibraryBadge, "setDelegate:", 0);
    -[CAMSharedLibraryBadge setAlpha:](*p_sharedLibraryBadge, "setAlpha:", 1.0);
    objc_storeStrong((id *)&self->_sharedLibraryBadge, a3);
    -[CEKBadgeView setDelegate:](*p_sharedLibraryBadge, "setDelegate:", self);
    -[CAMViewfinderView visibleTopBadges](self, "visibleTopBadges");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", *p_sharedLibraryBadge);

    if ((v10 & 1) == 0)
      -[CAMSharedLibraryBadge setAlpha:](*p_sharedLibraryBadge, "setAlpha:", 0.0);
    -[CAMViewfinderView addSubview:](self, "addSubview:", v11);
    v5 = v11;
  }

}

- (void)setDescriptionOverlayView:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;
  CAMViewfinderView *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[CAMViewfinderView _descriptionOverlayViewByKey](self, "_descriptionOverlayViewByKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 != v11)
  {
    objc_msgSend(v8, "superview");
    v9 = (CAMViewfinderView *)objc_claimAutoreleasedReturnValue();

    if (v9 == self)
      objc_msgSend(v8, "removeFromSuperview");
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, v6);
    objc_msgSend(v11, "setOrientation:", -[CAMViewfinderView orientation](self, "orientation"));
    -[CAMViewfinderView _previewContainerMaskingView](self, "_previewContainerMaskingView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMViewfinderView insertSubview:above:](self, "insertSubview:above:", v11, v10);

  }
}

- (id)descriptionOverlayViewForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CAMViewfinderView _descriptionOverlayViewByKey](self, "_descriptionOverlayViewByKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setFilterNameBadge:(id)a3
{
  CAMFilterNameBadge *v5;
  CAMFilterNameBadge **p_filterNameBadge;
  CAMFilterNameBadge *filterNameBadge;
  CAMViewfinderView *v8;
  CAMFilterNameBadge *v9;

  v5 = (CAMFilterNameBadge *)a3;
  p_filterNameBadge = &self->_filterNameBadge;
  filterNameBadge = self->_filterNameBadge;
  if (filterNameBadge != v5)
  {
    v9 = v5;
    -[CEKBadgeView delegate](filterNameBadge, "delegate");
    v8 = (CAMViewfinderView *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[CEKBadgeView setDelegate:](*p_filterNameBadge, "setDelegate:", 0);
    -[CAMFilterNameBadge removeFromSuperview](*p_filterNameBadge, "removeFromSuperview");
    objc_storeStrong((id *)&self->_filterNameBadge, a3);
    -[CEKBadgeView setDelegate:](*p_filterNameBadge, "setDelegate:", self);
    -[CAMViewfinderView addSubview:](self, "addSubview:", v9);
    v5 = v9;
  }

}

- (void)controlStatusIndicatorDidChangeIntrinsicContentSize:(id)a3 animated:(BOOL)a4
{
  -[CAMViewfinderView _layoutVideoConfigurationStatusIndicatorForLayoutStyle:](self, "_layoutVideoConfigurationStatusIndicatorForLayoutStyle:", -[CAMViewfinderView layoutStyle](self, "layoutStyle", a3, a4));
}

- (void)badgeViewDidChangeIntrinsicContentSize:(id)a3
{
  int64_t v4;

  v4 = -[CAMViewfinderView layoutStyle](self, "layoutStyle", a3);
  -[CAMViewfinderView _layoutPortraitModeInstructionLabelForLayoutStyle:](self, "_layoutPortraitModeInstructionLabelForLayoutStyle:", v4);
  -[CAMViewfinderView _layoutQRCodeInstructionLabelForLayoutStyle:](self, "_layoutQRCodeInstructionLabelForLayoutStyle:", v4);
  -[CAMViewfinderView _layoutTopBadgesForLayoutStyle:animated:](self, "_layoutTopBadgesForLayoutStyle:animated:", v4, 1);
  -[CAMViewfinderView _layoutBottomBadgesForLayoutStyle:](self, "_layoutBottomBadgesForLayoutStyle:", v4);
}

- (void)instructionLabelDidChangeIntrinsicContentSize:(id)a3
{
  int64_t v4;

  v4 = -[CAMViewfinderView layoutStyle](self, "layoutStyle", a3);
  -[CAMViewfinderView _layoutPortraitModeInstructionLabelForLayoutStyle:](self, "_layoutPortraitModeInstructionLabelForLayoutStyle:", v4);
  -[CAMViewfinderView _layoutQRCodeInstructionLabelForLayoutStyle:](self, "_layoutQRCodeInstructionLabelForLayoutStyle:", v4);
  -[CAMViewfinderView _layoutTopBadgesForLayoutStyle:animated:](self, "_layoutTopBadgesForLayoutStyle:animated:", v4, 1);
  -[CAMViewfinderView _layoutBottomBadgesForLayoutStyle:](self, "_layoutBottomBadgesForLayoutStyle:", v4);
}

- (void)setPanoramaView:(id)a3
{
  CAMPanoramaView *v5;
  CAMPanoramaView *panoramaView;
  CAMPanoramaView *v7;

  v5 = (CAMPanoramaView *)a3;
  panoramaView = self->_panoramaView;
  v7 = v5;
  if (panoramaView != v5)
  {
    -[CAMPanoramaView removeFromSuperview](panoramaView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_panoramaView, a3);
    -[CAMViewfinderView addSubview:](self, "addSubview:", v7);
  }

}

- (void)setZoomSlider:(id)a3
{
  CAMZoomSlider *v5;
  CAMZoomSlider *zoomSlider;
  CAMZoomSlider *v7;

  v5 = (CAMZoomSlider *)a3;
  zoomSlider = self->_zoomSlider;
  v7 = v5;
  if (zoomSlider != v5)
  {
    -[CAMZoomSlider removeFromSuperview](zoomSlider, "removeFromSuperview");
    objc_storeStrong((id *)&self->_zoomSlider, a3);
    -[CAMViewfinderView addSubview:](self, "addSubview:", v7);
  }

}

- (void)setZoomControl:(id)a3
{
  CAMZoomControl *v5;
  CAMZoomControl *zoomControl;
  void *v7;
  CAMZoomControl *v8;

  v5 = (CAMZoomControl *)a3;
  zoomControl = self->_zoomControl;
  if (zoomControl != v5)
  {
    v8 = v5;
    -[CAMZoomControl removeFromSuperview](zoomControl, "removeFromSuperview");
    objc_storeStrong((id *)&self->_zoomControl, a3);
    -[CAMViewfinderView bottomBar](self, "bottomBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[CAMViewfinderView insertSubview:below:](self, "insertSubview:below:", v8, v7);
    else
      -[CAMViewfinderView addSubview:](self, "addSubview:", v8);
    -[CAMViewfinderView setNeedsLayout](self, "setNeedsLayout");

    v5 = v8;
  }

}

- (void)setLightingControl:(id)a3
{
  CEKLightingControl *v5;
  CEKLightingControl *lightingControl;
  CEKLightingControl *v7;

  v5 = (CEKLightingControl *)a3;
  lightingControl = self->_lightingControl;
  v7 = v5;
  if (lightingControl != v5)
  {
    -[CEKLightingControl removeFromSuperview](lightingControl, "removeFromSuperview");
    objc_storeStrong((id *)&self->_lightingControl, a3);
    -[CEKLightingControl setOrientation:](self->_lightingControl, "setOrientation:", -[CAMViewfinderView orientation](self, "orientation"));
    -[CAMViewfinderView addSubview:](self, "addSubview:", v7);
  }

}

- (void)setLightingNameBadge:(id)a3
{
  CEKLightingNameBadge *v5;
  CEKLightingNameBadge **p_lightingNameBadge;
  CEKLightingNameBadge *lightingNameBadge;
  CAMViewfinderView *v8;
  CEKLightingNameBadge *v9;

  v5 = (CEKLightingNameBadge *)a3;
  p_lightingNameBadge = &self->_lightingNameBadge;
  lightingNameBadge = self->_lightingNameBadge;
  if (lightingNameBadge != v5)
  {
    v9 = v5;
    -[CEKLightingNameBadge delegate](lightingNameBadge, "delegate");
    v8 = (CAMViewfinderView *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[CEKLightingNameBadge setDelegate:](*p_lightingNameBadge, "setDelegate:", 0);
    -[CEKLightingNameBadge removeFromSuperview](*p_lightingNameBadge, "removeFromSuperview");
    objc_storeStrong((id *)&self->_lightingNameBadge, a3);
    -[CEKLightingNameBadge setDelegate:](*p_lightingNameBadge, "setDelegate:", self);
    -[CAMViewfinderView addSubview:](self, "addSubview:", v9);
    v5 = v9;
  }

}

- (void)setOrientation:(int64_t)a3
{
  -[CAMViewfinderView setOrientation:animated:](self, "setOrientation:animated:", a3, 0);
}

uint64_t __45__CAMViewfinderView_setOrientation_animated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setOrientation:animated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __45__CAMViewfinderView_setOrientation_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)prepareForAutorotation
{
  id v3;

  -[CAMViewfinderView _previewContainerMaskingView](self, "_previewContainerMaskingView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClipsToBounds:", 0);
  -[CAMViewfinderView _layoutSnapshotsOfPreviewView](self, "_layoutSnapshotsOfPreviewView");

}

- (void)_createPlaceholderSnapshotAndPerformSingleSidedFadeForView:(id)a3 fadeOutDuration:(double)a4 fadeOutDelay:(double)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v7 = a3;
  objc_msgSend(v7, "snapshotViewAfterScreenUpdates:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DC3F10];
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __109__CAMViewfinderView__createPlaceholderSnapshotAndPerformSingleSidedFadeForView_fadeOutDuration_fadeOutDelay___block_invoke;
  v19[3] = &unk_1EA328A40;
  v11 = v8;
  v20 = v11;
  v21 = v7;
  v12 = v7;
  objc_msgSend(v9, "performWithoutAnimation:", v19);
  v13 = (void *)MEMORY[0x1E0DC3F10];
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __109__CAMViewfinderView__createPlaceholderSnapshotAndPerformSingleSidedFadeForView_fadeOutDuration_fadeOutDelay___block_invoke_2;
  v17[3] = &unk_1EA328868;
  v18 = v11;
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __109__CAMViewfinderView__createPlaceholderSnapshotAndPerformSingleSidedFadeForView_fadeOutDuration_fadeOutDelay___block_invoke_3;
  v15[3] = &unk_1EA328A68;
  v16 = v18;
  v14 = v18;
  objc_msgSend(v13, "animateWithDuration:delay:options:animations:completion:", 327682, v17, v15, a4, a5);

}

void __109__CAMViewfinderView__createPlaceholderSnapshotAndPerformSingleSidedFadeForView_fadeOutDuration_fadeOutDelay___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _OWORD v8[3];

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  objc_msgSend(v2, "setBounds:");
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "center");
  objc_msgSend(v3, "setCenter:");
  v5 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  if (v4)
    objc_msgSend(v4, "transform");
  else
    memset(v8, 0, sizeof(v8));
  objc_msgSend(v5, "setTransform:", v8);
  objc_msgSend(*(id *)(a1 + 40), "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 40), "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllAnimations");

}

uint64_t __109__CAMViewfinderView__createPlaceholderSnapshotAndPerformSingleSidedFadeForView_fadeOutDuration_fadeOutDelay___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __109__CAMViewfinderView__createPlaceholderSnapshotAndPerformSingleSidedFadeForView_fadeOutDuration_fadeOutDelay___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)_createPlaceholderSnapshotAndPerformDoubleSidedFadeForView:(id)a3 fadeOutDuration:(double)a4 fadeOutDelay:(double)a5 fadeInDuration:(double)a6 fadeInDelay:(double)a7
{
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v12 = a3;
  -[CAMViewfinderView _createPlaceholderSnapshotAndPerformSingleSidedFadeForView:fadeOutDuration:fadeOutDelay:](self, "_createPlaceholderSnapshotAndPerformSingleSidedFadeForView:fadeOutDuration:fadeOutDelay:", v12, a4, a5);
  v13 = (void *)MEMORY[0x1E0DC3F10];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __136__CAMViewfinderView__createPlaceholderSnapshotAndPerformDoubleSidedFadeForView_fadeOutDuration_fadeOutDelay_fadeInDuration_fadeInDelay___block_invoke;
  v15[3] = &unk_1EA328868;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "animateWithDuration:delay:options:animations:completion:", 2, v15, 0, a6, a7);

}

uint64_t __136__CAMViewfinderView__createPlaceholderSnapshotAndPerformDoubleSidedFadeForView_fadeOutDuration_fadeOutDelay_fadeInDuration_fadeInDelay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)setTextInteractionInsert:(id)a3
{
  VKTextLiftingView *v4;
  VKTextLiftingView *textInteractionInsert;
  void *v6;
  VKTextLiftingView *v7;

  v4 = (VKTextLiftingView *)a3;
  textInteractionInsert = self->_textInteractionInsert;
  if (textInteractionInsert != v4)
  {
    v7 = v4;
    -[VKTextLiftingView removeFromSuperview](textInteractionInsert, "removeFromSuperview");
    v4 = v7;
    self->_textInteractionInsert = v7;
    if (v7)
    {
      -[CAMViewfinderView addSubview:](self, "addSubview:", v7);
      -[CAMViewfinderView _layoutTextInteractionInsertAndActionInfoView](self, "_layoutTextInteractionInsertAndActionInfoView");
      -[CAMViewfinderView imageAnalysisInstructionLabel](self, "imageAnalysisInstructionLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMViewfinderView bringSubviewToFront:](self, "bringSubviewToFront:", v6);

      v4 = v7;
    }
  }

}

- (void)setImageAnalysisInstructionLabel:(id)a3
{
  CAMImageAnalysisInstructionLabel *v5;
  CAMImageAnalysisInstructionLabel *imageAnalysisInstructionLabel;
  CAMImageAnalysisInstructionLabel *v7;

  v5 = (CAMImageAnalysisInstructionLabel *)a3;
  imageAnalysisInstructionLabel = self->_imageAnalysisInstructionLabel;
  v7 = v5;
  if (imageAnalysisInstructionLabel != v5)
  {
    -[CAMImageAnalysisInstructionLabel removeFromSuperview](imageAnalysisInstructionLabel, "removeFromSuperview");
    objc_storeStrong((id *)&self->_imageAnalysisInstructionLabel, a3);
    -[CAMViewfinderView addSubview:](self, "addSubview:", v7);
  }

}

- (void)adoptMachineReadableCodeButton:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  double v9;
  _QWORD v10[4];
  id v11;

  v4 = a4;
  v6 = a3;
  -[CAMViewfinderView machineReadableCodeButton](self, "machineReadableCodeButton");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if ((id)v7 != v6)
  {
    if (v7)
      -[CAMViewfinderView dismissMachineReadableCodeButtonAnimated:](self, "dismissMachineReadableCodeButtonAnimated:", v4);
    -[CAMViewfinderView setMachineReadableCodeButton:](self, "setMachineReadableCodeButton:", v6);
    v9 = 0.0;
    if (v4)
    {
      objc_msgSend(v6, "setAlpha:", 0.0);
      v9 = 0.3;
    }
    -[CAMViewfinderView addSubview:](self, "addSubview:", v6);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__CAMViewfinderView_adoptMachineReadableCodeButton_animated___block_invoke;
    v10[3] = &unk_1EA328868;
    v11 = v6;
    +[CAMView animateIfNeededWithDuration:animations:](CAMView, "animateIfNeededWithDuration:animations:", v10, v9);

  }
}

uint64_t __61__CAMViewfinderView_adoptMachineReadableCodeButton_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)dismissMachineReadableCodeButtonAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  -[CAMViewfinderView machineReadableCodeButton](self, "machineReadableCodeButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CAMViewfinderView setMachineReadableCodeButton:](self, "setMachineReadableCodeButton:", 0);
    if (v3)
      v6 = 0.3;
    else
      v6 = 0.0;
    v7 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __62__CAMViewfinderView_dismissMachineReadableCodeButtonAnimated___block_invoke;
    v10[3] = &unk_1EA328868;
    v11 = v5;
    v8[0] = v7;
    v8[1] = 3221225472;
    v8[2] = __62__CAMViewfinderView_dismissMachineReadableCodeButtonAnimated___block_invoke_2;
    v8[3] = &unk_1EA32A948;
    v8[4] = self;
    v9 = v11;
    +[CAMView animateIfNeededWithDuration:animations:completion:](CAMView, "animateIfNeededWithDuration:animations:completion:", v10, v8, v6);

  }
}

uint64_t __62__CAMViewfinderView_dismissMachineReadableCodeButtonAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __62__CAMViewfinderView_dismissMachineReadableCodeButtonAnimated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "machineReadableCodeButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 != v3)
    objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
}

- (int64_t)externalDisplayPreviewOrientation
{
  return self->_externalDisplayPreviewOrientation;
}

- (void)setExternalDisplayPreviewOrientation:(int64_t)a3
{
  self->_externalDisplayPreviewOrientation = a3;
}

- (void)setVisibleTopBadges:(id)a3
{
  objc_storeStrong((id *)&self->_visibleTopBadges, a3);
}

- (CAMFlashBadge)flashBadge
{
  return self->_flashBadge;
}

- (CAMHDRBadge)HDRBadge
{
  return self->_HDRBadge;
}

- (CAMFocusLockBadge)focusAndExposureLockBadge
{
  return self->_focusAndExposureLockBadge;
}

- (CAMLivePhotoBadge)livePhotoBadge
{
  return self->_livePhotoBadge;
}

- (CAMShallowDepthOfFieldBadge)shallowDepthOfFieldBadge
{
  return self->_shallowDepthOfFieldBadge;
}

- (CAMSharedLibraryBadge)sharedLibraryBadge
{
  return self->_sharedLibraryBadge;
}

- (CAMVideoConfigurationStatusIndicator)videoConfigurationStatusIndicator
{
  return self->_videoConfigurationStatusIndicator;
}

- (VKTextLiftingView)textInteractionInsert
{
  return self->_textInteractionInsert;
}

- (CAMImageAnalysisInstructionLabel)imageAnalysisInstructionLabel
{
  return self->_imageAnalysisInstructionLabel;
}

- (CAMMachineReadableCodeButton)machineReadableCodeButton
{
  return self->_machineReadableCodeButton;
}

- (void)setMachineReadableCodeButton:(id)a3
{
  objc_storeStrong((id *)&self->_machineReadableCodeButton, a3);
}

- (CAMViewfinderFlipTransition)_flipTransition
{
  return self->__flipTransition;
}

- (void)_setFlipTransition:(id)a3
{
  objc_storeStrong((id *)&self->__flipTransition, a3);
}

- (UIView)_topBarExtensionView
{
  return self->__topBarExtensionView;
}

- (void)_setTopBarExtensionView:(id)a3
{
  objc_storeStrong((id *)&self->__topBarExtensionView, a3);
}

- (UIView)_bottomBarExtensionView
{
  return self->__bottomBarExtensionView;
}

- (void)_setBottomBarExtensionView:(id)a3
{
  objc_storeStrong((id *)&self->__bottomBarExtensionView, a3);
}

- (CAMFullscreenViewfinderLayout)_modernLayout
{
  return self->__modernLayout;
}

- (void)_setModernLayout:(id)a3
{
  objc_storeStrong((id *)&self->__modernLayout, a3);
}

- (NSMutableDictionary)_descriptionOverlayViewByKey
{
  return self->__descriptionOverlayViewByKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__descriptionOverlayViewByKey, 0);
  objc_storeStrong((id *)&self->__modernLayout, 0);
  objc_storeStrong((id *)&self->__bottomBarExtensionView, 0);
  objc_storeStrong((id *)&self->__topBarExtensionView, 0);
  objc_storeStrong((id *)&self->__flipTransition, 0);
  objc_storeStrong((id *)&self->__openAndCloseTransition, 0);
  objc_storeStrong((id *)&self->__previewContainerView, 0);
  objc_storeStrong((id *)&self->__previewContainerMaskingView, 0);
  objc_storeStrong((id *)&self->_machineReadableCodeButton, 0);
  objc_storeStrong((id *)&self->_imageAnalysisInstructionLabel, 0);
  objc_storeStrong((id *)&self->_disabledModeOverlayView, 0);
  objc_storeStrong((id *)&self->_lightingNameBadge, 0);
  objc_storeStrong((id *)&self->_lightingControl, 0);
  objc_storeStrong((id *)&self->_zoomControl, 0);
  objc_storeStrong((id *)&self->_zoomSlider, 0);
  objc_storeStrong((id *)&self->_panoramaView, 0);
  objc_storeStrong((id *)&self->_timerIndicatorView, 0);
  objc_storeStrong((id *)&self->_burstIndicatorView, 0);
  objc_storeStrong((id *)&self->_videoConfigurationStatusIndicator, 0);
  objc_storeStrong((id *)&self->_elapsedTimeView, 0);
  objc_storeStrong((id *)&self->_shutterIndicatorView, 0);
  objc_storeStrong((id *)&self->_sharedLibraryBadge, 0);
  objc_storeStrong((id *)&self->_filterNameBadge, 0);
  objc_storeStrong((id *)&self->_qrCodeInstructionLabel, 0);
  objc_storeStrong((id *)&self->_portraitModeInstructionLabel, 0);
  objc_storeStrong((id *)&self->_shallowDepthOfFieldBadge, 0);
  objc_storeStrong((id *)&self->_livePhotoBadge, 0);
  objc_storeStrong((id *)&self->_focusAndExposureLockBadge, 0);
  objc_storeStrong((id *)&self->_HDRBadge, 0);
  objc_storeStrong((id *)&self->_flashBadge, 0);
  objc_storeStrong((id *)&self->_visibleTopBadges, 0);
  objc_storeStrong((id *)&self->_flipButton, 0);
  objc_storeStrong((id *)&self->_shutterButton, 0);
  objc_storeStrong((id *)&self->_bottomBar, 0);
  objc_storeStrong((id *)&self->_topBar, 0);
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_destroyWeak((id *)&self->_visibilityDelegate);
}

@end
