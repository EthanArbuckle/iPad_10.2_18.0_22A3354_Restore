@implementation CSCoverSheetView

- (CSCoverSheetView)initWithFrame:(CGRect)a3
{
  CSCoverSheetView *v3;
  CSCoverSheetView *v4;
  _UILegibilitySettings *legibilitySettings;
  void *v6;
  uint64_t v7;
  CSLookSettings *lookSettings;
  CSScrollModifier *v9;
  CSScrollModifier *scrollModifier;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CSCoverSheetView;
  v3 = -[CSCoverSheetView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    legibilitySettings = v3->_legibilitySettings;
    v3->_legibilitySettings = 0;

    v4->_statusBarLegibilityEnabled = 1;
    v4->_dateViewPageAlignment = 0x7FFFFFFFFFFFFFFFLL;
    v4->_targetPageIndexForDraggingEnded = 0x7FFFFFFFFFFFFFFFLL;
    +[CSLockScreenDomain rootSettings](CSLockScreenDomain, "rootSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lookSettings");
    v7 = objc_claimAutoreleasedReturnValue();
    lookSettings = v4->_lookSettings;
    v4->_lookSettings = (CSLookSettings *)v7;

    -[PTSettings addKeyObserver:](v4->_lookSettings, "addKeyObserver:", v4);
    -[CSCoverSheetView setClipsToBounds:](v4, "setClipsToBounds:", 1);
    -[CSCoverSheetView _addBackgroundContainerView](v4, "_addBackgroundContainerView");
    -[CSCoverSheetView _addBackgroundView](v4, "_addBackgroundView");
    -[CSCoverSheetView _addSlideableContentView](v4, "_addSlideableContentView");
    -[CSCoverSheetView _addHigherSlideableContentView](v4, "_addHigherSlideableContentView");
    -[CSCoverSheetView _addDateTimeContainer](v4, "_addDateTimeContainer");
    -[CSCoverSheetView _addWallpaperFloatingLayerContainerView](v4, "_addWallpaperFloatingLayerContainerView");
    -[CSCoverSheetView _addScrollView](v4, "_addScrollView");
    -[CSCoverSheetView _addAuthIndicator](v4, "_addAuthIndicator");
    -[CSCoverSheetView _addTintingView](v4, "_addTintingView");
    -[CSCoverSheetView _addStatusBarLegibilityView](v4, "_addStatusBarLegibilityView");
    v9 = -[CSScrollModifier initWithView:]([CSScrollModifier alloc], "initWithView:", v4);
    scrollModifier = v4->_scrollModifier;
    v4->_scrollModifier = v9;

  }
  return v4;
}

- (void)setFakeStatusBar:(id)a3
{
  UIView *v5;
  UIView *fakeStatusBar;
  CSPropertyAnimatingTouchPassThroughView *fakeStatusBarWrapperView;
  CSPropertyAnimatingTouchPassThroughView *v8;
  CSPropertyAnimatingTouchPassThroughView *v9;
  CSPropertyAnimatingTouchPassThroughView *v10;
  UIView *v11;

  v5 = (UIView *)a3;
  fakeStatusBar = self->_fakeStatusBar;
  if (fakeStatusBar != v5)
  {
    v11 = v5;
    -[UIView removeFromSuperview](fakeStatusBar, "removeFromSuperview");
    objc_storeStrong((id *)&self->_fakeStatusBar, a3);
    fakeStatusBarWrapperView = self->_fakeStatusBarWrapperView;
    if (!fakeStatusBarWrapperView)
    {
      v8 = [CSPropertyAnimatingTouchPassThroughView alloc];
      v9 = -[CSPropertyAnimatingTouchPassThroughView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v10 = self->_fakeStatusBarWrapperView;
      self->_fakeStatusBarWrapperView = v9;

      -[CSCoverSheetView addSubview:](self, "addSubview:", self->_fakeStatusBarWrapperView);
      -[CSCoverSheetView _prepareBlursForView:withHardEdges:](self, "_prepareBlursForView:withHardEdges:", self->_fakeStatusBarWrapperView, 1);
      fakeStatusBarWrapperView = self->_fakeStatusBarWrapperView;
    }
    -[CSPropertyAnimatingTouchPassThroughView addSubview:](fakeStatusBarWrapperView, "addSubview:", self->_fakeStatusBar);
    -[CSCoverSheetView _layoutFakeStatusBar](self, "_layoutFakeStatusBar");
    v5 = v11;
  }

}

- (void)setFakeStatusBarLevel:(unint64_t)a3
{
  if (self->_fakeStatusBarLevel != a3)
  {
    self->_fakeStatusBarLevel = a3;
    -[CSCoverSheetView _orderSubviews](self, "_orderSubviews");
  }
}

- (void)setFakeStatusBarBlurRadius:(double)a3
{
  if (self->_fakeStatusBarBlurRadius != a3)
  {
    self->_fakeStatusBarBlurRadius = a3;
    if (self->_fakeStatusBarWrapperView)
      -[CSCoverSheetView _updateBlurForView:toRadius:](self, "_updateBlurForView:toRadius:");
  }
}

- (void)setFakeStatusBarScale:(double)a3
{
  if (self->_fakeStatusBarScale != a3)
  {
    self->_fakeStatusBarScale = a3;
    -[CSCoverSheetView _layoutFakeStatusBar](self, "_layoutFakeStatusBar");
  }
}

- (void)setStatusBarBackgroundView:(id)a3
{
  UIView *v5;
  UIView **p_statusBarBackgroundView;
  UIView *statusBarBackgroundView;
  UIView *v8;

  v5 = (UIView *)a3;
  p_statusBarBackgroundView = &self->_statusBarBackgroundView;
  statusBarBackgroundView = self->_statusBarBackgroundView;
  v8 = v5;
  if (statusBarBackgroundView != v5)
  {
    -[UIView removeFromSuperview](statusBarBackgroundView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_statusBarBackgroundView, a3);
    if (*p_statusBarBackgroundView)
    {
      -[CSCoverSheetView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", *p_statusBarBackgroundView, self->_scrollView);
      -[CSCoverSheetView _layoutStatusBarBackgroundView](self, "_layoutStatusBarBackgroundView");
    }
  }

}

- (void)setControlCenterGrabberScale:(double)a3
{
  if (self->_controlCenterGrabberScale != a3)
  {
    self->_controlCenterGrabberScale = a3;
    -[CSCoverSheetView _layoutTeachableMomentsContainerView](self, "_layoutTeachableMomentsContainerView");
  }
}

- (void)setControlCenterGrabberBlurRadius:(double)a3
{
  void *v4;
  id v5;

  if (self->_controlCenterGrabberBlurRadius != a3)
  {
    self->_controlCenterGrabberBlurRadius = a3;
    -[CSTeachableMomentsContainerView controlCenterGrabberContainerView](self->_teachableMomentsContainerView, "controlCenterGrabberContainerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[CSTeachableMomentsContainerView controlCenterGrabberContainerView](self->_teachableMomentsContainerView, "controlCenterGrabberContainerView");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[CSCoverSheetView _updateBlurForView:toRadius:](self, "_updateBlurForView:toRadius:", v5, self->_controlCenterGrabberBlurRadius);

    }
  }
}

- (void)setWallpaperGestureRecognizer:(id)a3
{
  UIGestureRecognizer *v5;
  unint64_t v6;
  BOOL v7;
  UIGestureRecognizer *v8;

  v5 = (UIGestureRecognizer *)a3;
  if (self->_wallpaperGestureRecognizer != v5)
  {
    v8 = v5;
    -[CSCoverSheetView _setupWallpaperGestureOnScrollView:](self, "_setupWallpaperGestureOnScrollView:", 0);
    objc_storeStrong((id *)&self->_wallpaperGestureRecognizer, a3);
    v6 = -[SBFPagedScrollView currentPageIndex](self->_scrollView, "currentPageIndex");
    v7 = v6 == -[CSCoverSheetView _indexOfMainPage](self, "_indexOfMainPage");
    v5 = v8;
    if (v7)
    {
      -[CSCoverSheetView _setupWallpaperGestureOnScrollView:](self, "_setupWallpaperGestureOnScrollView:", 1);
      v5 = v8;
    }
  }

}

- (void)setBackgroundContentGestureRecognizer:(id)a3
{
  UITapGestureRecognizer *v5;
  unint64_t v6;
  BOOL v7;
  UITapGestureRecognizer *v8;

  v5 = (UITapGestureRecognizer *)a3;
  if (self->_backgroundContentGestureRecognizer != v5)
  {
    v8 = v5;
    -[CSCoverSheetView _setupBackgroundContentGestureOnScrollView:](self, "_setupBackgroundContentGestureOnScrollView:", 0);
    objc_storeStrong((id *)&self->_backgroundContentGestureRecognizer, a3);
    v6 = -[SBFPagedScrollView currentPageIndex](self->_scrollView, "currentPageIndex");
    v7 = v6 == -[CSCoverSheetView _indexOfMainPage](self, "_indexOfMainPage");
    v5 = v8;
    if (v7)
    {
      -[CSCoverSheetView _setupBackgroundContentGestureOnScrollView:](self, "_setupBackgroundContentGestureOnScrollView:", 1);
      v5 = v8;
    }
  }

}

- (void)setQuickNoteGestureRecognizer:(id)a3
{
  UITapGestureRecognizer *v5;
  unint64_t v6;
  BOOL v7;
  UITapGestureRecognizer *v8;

  v5 = (UITapGestureRecognizer *)a3;
  if (self->_quickNoteGestureRecognizer != v5)
  {
    v8 = v5;
    -[CSCoverSheetView _setupQuickNoteGestureOnScrollView:](self, "_setupQuickNoteGestureOnScrollView:", 0);
    objc_storeStrong((id *)&self->_quickNoteGestureRecognizer, a3);
    v6 = -[SBFPagedScrollView currentPageIndex](self->_scrollView, "currentPageIndex");
    v7 = v6 == -[CSCoverSheetView _indexOfMainPage](self, "_indexOfMainPage");
    v5 = v8;
    if (v7)
    {
      -[CSCoverSheetView _setupQuickNoteGestureOnScrollView:](self, "_setupQuickNoteGestureOnScrollView:", 1);
      v5 = v8;
    }
  }

}

- (void)setSearchGesture:(id)a3
{
  SBSearchGesture *v5;
  SBSearchGesture *searchGesture;
  SBSearchGesture *v7;

  v5 = (SBSearchGesture *)a3;
  searchGesture = self->_searchGesture;
  v7 = v5;
  if (searchGesture != v5)
  {
    -[SBSearchGesture setTargetView:](searchGesture, "setTargetView:", 0);
    objc_storeStrong((id *)&self->_searchGesture, a3);
    -[SBSearchGesture setTargetView:](v7, "setTargetView:", self->_scrollView);
  }

}

- (void)setDateViewOffset:(CGPoint)a3
{
  if (self->_dateViewOffset.x != a3.x || self->_dateViewOffset.y != a3.y)
  {
    self->_dateViewOffset = a3;
    -[CSCoverSheetView _layoutDateView](self, "_layoutDateView");
  }
}

- (void)setDateViewScale:(double)a3
{
  if (self->_dateViewScale != a3)
  {
    self->_dateViewScale = a3;
    -[CSCoverSheetView _layoutDateView](self, "_layoutDateView");
  }
}

- (void)setDateViewStretch:(BOOL)a3
{
  if (self->_dateViewStretch != a3)
  {
    self->_dateViewStretch = a3;
    -[CSCoverSheetView _layoutDateView](self, "_layoutDateView");
  }
}

- (void)setContentViewOffset:(CGPoint)a3
{
  if (self->_contentViewOffset.x != a3.x || self->_contentViewOffset.y != a3.y)
  {
    self->_contentViewOffset = a3;
    -[CSCoverSheetView _layoutContentView](self, "_layoutContentView");
  }
}

- (void)setContentViewScale:(double)a3
{
  if (self->_contentViewScale != a3)
  {
    self->_contentViewScale = a3;
    -[CSCoverSheetView _layoutContentView](self, "_layoutContentView");
  }
}

- (void)setProudLockIconViewOffset:(CGPoint)a3
{
  if (self->_proudLockIconViewOffset.x != a3.x || self->_proudLockIconViewOffset.y != a3.y)
  {
    self->_proudLockIconViewOffset = a3;
    -[CSCoverSheetView _layoutProudLockView](self, "_layoutProudLockView");
  }
}

- (void)setProudLockIconViewScale:(double)a3
{
  if (self->_proudLockIconViewScale != a3)
  {
    self->_proudLockIconViewScale = a3;
    -[CSCoverSheetView _layoutProudLockView](self, "_layoutProudLockView");
  }
}

- (void)setProudLockPrefersLowerPresentationLevel:(BOOL)a3
{
  if (self->_proudLockPrefersLowerPresentationLevel != a3)
  {
    self->_proudLockPrefersLowerPresentationLevel = a3;
    -[CSCoverSheetView _layoutProudLockView](self, "_layoutProudLockView");
  }
}

- (void)setProudLockIconBlurRadius:(double)a3
{
  if (self->_proudLockIconBlurRadius != a3)
  {
    self->_proudLockIconBlurRadius = a3;
    if (self->_proudLockContainerWrapperView)
      -[CSCoverSheetView _updateBlurForView:toRadius:](self, "_updateBlurForView:toRadius:");
  }
}

- (void)setForceDateViewCentered:(BOOL)a3
{
  if (self->_forceDateViewCentered != a3)
  {
    self->_forceDateViewCentered = a3;
    -[CSCoverSheetView _layoutDateView](self, "_layoutDateView");
  }
}

- (void)setDateViewIsVibrant:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_dateViewIsVibrant != a3)
  {
    self->_dateViewIsVibrant = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __41__CSCoverSheetView_setDateViewIsVibrant___block_invoke;
    v3[3] = &unk_1E8E2E190;
    v4 = a3;
    v3[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v3);
  }
}

uint64_t __41__CSCoverSheetView_setDateViewIsVibrant___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
  {
    v3 = *(void **)(v2 + 464);
    if (!v3)
    {
      v4 = objc_alloc(MEMORY[0x1E0CEABE8]);
      v5 = (void *)objc_opt_new();
      v6 = objc_msgSend(v4, "initWithEffect:", v5);
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 464);
      *(_QWORD *)(v7 + 464) = v6;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setClipsToBounds:", 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "contentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setClipsToBounds:", 0);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464));
      v3 = *(void **)(*(_QWORD *)(a1 + 32) + 464);
    }
    objc_msgSend(v3, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 648));
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(v2 + 432), "addSubview:", *(_QWORD *)(v2 + 648));
  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 464);
  if (v11)
  {
    objc_msgSend(v11, "removeFromSuperview");
    v12 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v12 + 464);
    *(_QWORD *)(v12 + 464) = 0;
LABEL_7:

  }
  return objc_msgSend(*(id *)(a1 + 32), "_layoutDateView");
}

- (void)setDateViewGestureRecognizer:(id)a3
{
  UIGestureRecognizer *v5;
  unint64_t v6;
  BOOL v7;
  UIGestureRecognizer *v8;

  v5 = (UIGestureRecognizer *)a3;
  if (self->_dateViewGestureRecognizer != v5)
  {
    v8 = v5;
    -[CSCoverSheetView _setupDateViewGestureOnScrollView:](self, "_setupDateViewGestureOnScrollView:", 0);
    objc_storeStrong((id *)&self->_dateViewGestureRecognizer, a3);
    v6 = -[SBFPagedScrollView currentPageIndex](self->_scrollView, "currentPageIndex");
    v7 = v6 == -[CSCoverSheetView _indexOfMainPage](self, "_indexOfMainPage");
    v5 = v8;
    if (v7)
    {
      -[CSCoverSheetView _setupDateViewGestureOnScrollView:](self, "_setupDateViewGestureOnScrollView:", 1);
      v5 = v8;
    }
  }

}

- (void)setComplicationGestureRecognizer:(id)a3
{
  UILongPressGestureRecognizer *v5;
  unint64_t v6;
  BOOL v7;
  UILongPressGestureRecognizer *v8;

  v5 = (UILongPressGestureRecognizer *)a3;
  if (self->_complicationGestureRecognizer != v5)
  {
    v8 = v5;
    -[CSCoverSheetView _setupComplicationGestureOnScrollView:](self, "_setupComplicationGestureOnScrollView:", 0);
    objc_storeStrong((id *)&self->_complicationGestureRecognizer, a3);
    v6 = -[SBFPagedScrollView currentPageIndex](self->_scrollView, "currentPageIndex");
    v7 = v6 == -[CSCoverSheetView _indexOfMainPage](self, "_indexOfMainPage");
    v5 = v8;
    if (v7)
    {
      -[CSCoverSheetView _setupComplicationGestureOnScrollView:](self, "_setupComplicationGestureOnScrollView:", 1);
      v5 = v8;
    }
  }

}

- (void)setLegibilitySettings:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](self->_legibilitySettings, "sb_isEqualToLegibilitySettings:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[CSCoverSheetView _updateLegibility](self, "_updateLegibility");
  }

}

- (void)setModalPresentationView:(id)a3
{
  UIView *v5;
  UIView **p_modalPresentationView;
  UIView *modalPresentationView;
  UIView *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  p_modalPresentationView = &self->_modalPresentationView;
  modalPresentationView = self->_modalPresentationView;
  if (modalPresentationView != v5)
  {
    v9 = v5;
    -[UIView removeFromSuperview](modalPresentationView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_modalPresentationView, a3);
    v8 = *p_modalPresentationView;
    -[CSCoverSheetView bounds](self, "bounds");
    -[UIView setFrame:](v8, "setFrame:");
    -[CSCoverSheetView addSubview:](self, "addSubview:", *p_modalPresentationView);
    -[CSCoverSheetView setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

}

- (void)setModalPresentationLevel:(unint64_t)a3
{
  if (self->_modalPresentationLevel != a3)
  {
    self->_modalPresentationLevel = a3;
    -[CSCoverSheetView _orderSubviews](self, "_orderSubviews");
  }
}

- (void)setWallpaperPresentationLevel:(unint64_t)a3
{
  if (self->_wallpaperPresentationLevel != a3)
  {
    self->_wallpaperPresentationLevel = a3;
    -[CSCoverSheetView _orderSubviews](self, "_orderSubviews");
  }
}

- (void)setWallpaperFloatingLayerPresentationLevel:(unint64_t)a3
{
  if (self->_wallpaperFloatingLayerPresentationLevel != a3)
  {
    self->_wallpaperFloatingLayerPresentationLevel = a3;
    -[CSCoverSheetView _orderSubviews](self, "_orderSubviews");
  }
}

- (void)setDateTimePresentationLevel:(unint64_t)a3
{
  if (self->_dateTimePresentationLevel != a3)
  {
    self->_dateTimePresentationLevel = a3;
    -[CSCoverSheetView _orderSubviews](self, "_orderSubviews");
  }
}

- (void)setBackgroundContentPresentationLevel:(unint64_t)a3
{
  if (self->_backgroundContentPresentationLevel != a3)
  {
    self->_backgroundContentPresentationLevel = a3;
    -[CSCoverSheetView _orderSubviews](self, "_orderSubviews");
  }
}

- (void)updateStatusBarLegibilityForForceLegibilityGradientHidden:(BOOL)a3
{
  -[SBFStatusBarLegibilityView setForceLegibilityGradientHidden:](self->_statusBarLegibilityView, "setForceLegibilityGradientHidden:", a3);
}

- (void)setWallpaperFloatingLayerContainerViewOffset:(CGPoint)a3
{
  if (self->_wallpaperFloatingLayerContainerViewOffset.x != a3.x
    || self->_wallpaperFloatingLayerContainerViewOffset.y != a3.y)
  {
    self->_wallpaperFloatingLayerContainerViewOffset = a3;
    -[CSCoverSheetView _layoutWallpaperFloatingLayerContainerView](self, "_layoutWallpaperFloatingLayerContainerView");
  }
}

- (void)setWallpaperFloatingLayerContainerViewScale:(double)a3
{
  if (self->_wallpaperFloatingLayerContainerViewScale != a3)
  {
    self->_wallpaperFloatingLayerContainerViewScale = a3;
    -[CSCoverSheetView _layoutWallpaperFloatingLayerContainerView](self, "_layoutWallpaperFloatingLayerContainerView");
  }
}

- (void)setBackgroundContentViewOffset:(CGPoint)a3
{
  if (self->_backgroundContentViewOffset.x != a3.x || self->_backgroundContentViewOffset.y != a3.y)
  {
    self->_backgroundContentViewOffset = a3;
    -[CSCoverSheetView _layoutBackgroundContentView](self, "_layoutBackgroundContentView");
  }
}

- (void)setBackgroundContentViewScale:(double)a3
{
  if (self->_backgroundContentViewScale != a3)
  {
    self->_backgroundContentViewScale = a3;
    -[CSCoverSheetView _layoutBackgroundContentView](self, "_layoutBackgroundContentView");
  }
}

- (void)setBackgroundContentViewAlpha:(double)a3
{
  if (self->_backgroundContentViewAlpha != a3)
  {
    self->_backgroundContentViewAlpha = a3;
    -[CSBackgroundContentView setAlpha:](self->_backgroundContentView, "setAlpha:");
  }
}

- (void)setBottomPage:(id)a3
{
  UIView *v5;
  UIView *bottomPage;
  UIView *v7;

  v5 = (UIView *)a3;
  bottomPage = self->_bottomPage;
  if (bottomPage != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](bottomPage, "removeFromSuperview");
    objc_storeStrong((id *)&self->_bottomPage, a3);
    v5 = v7;
    if (v7)
    {
      -[UIView addSubview:](self->_slideableContentView, "addSubview:", v7);
      -[CSCoverSheetView _layoutBottomPage](self, "_layoutBottomPage");
      v5 = v7;
    }
  }

}

- (void)setDateView:(id)a3
{
  -[CSCoverSheetView _setDateView:forTesting:](self, "_setDateView:forTesting:", a3, 0);
}

- (void)setTeachableMomentsContainerView:(id)a3
{
  CSTeachableMomentsContainerView *v5;
  CSTeachableMomentsContainerView **p_teachableMomentsContainerView;
  CSTeachableMomentsContainerView *teachableMomentsContainerView;
  void *v8;
  CSTeachableMomentsContainerView *v9;

  v5 = (CSTeachableMomentsContainerView *)a3;
  p_teachableMomentsContainerView = &self->_teachableMomentsContainerView;
  teachableMomentsContainerView = self->_teachableMomentsContainerView;
  if (teachableMomentsContainerView != v5)
  {
    v9 = v5;
    -[CSTeachableMomentsContainerView removeFromSuperview](teachableMomentsContainerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_teachableMomentsContainerView, a3);
    -[UIView addSubview:](self->_higherSlideableContentView, "addSubview:", *p_teachableMomentsContainerView);
    -[CSTeachableMomentsContainerView controlCenterGrabberContainerView](*p_teachableMomentsContainerView, "controlCenterGrabberContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSCoverSheetView _prepareBlursForView:withHardEdges:](self, "_prepareBlursForView:withHardEdges:", v8, 0);

    -[CSCoverSheetView setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

}

- (void)setSidebarComplicationContainerView:(id)a3
{
  UIView *v5;
  UIView *sidebarComplicationContainerView;
  UIView *v7;

  v5 = (UIView *)a3;
  sidebarComplicationContainerView = self->_sidebarComplicationContainerView;
  if (sidebarComplicationContainerView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](sidebarComplicationContainerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_sidebarComplicationContainerView, a3);
    -[UIView addSubview:](self->_slideableContentView, "addSubview:", self->_sidebarComplicationContainerView);
    -[CSCoverSheetView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setFixedFooterView:(id)a3
{
  CSFixedFooterView *v5;
  CSFixedFooterView **p_fixedFooterView;
  CSFixedFooterView *fixedFooterView;
  CSFixedFooterView *v8;
  void *v9;
  CSFixedFooterView *v10;

  v5 = (CSFixedFooterView *)a3;
  p_fixedFooterView = &self->_fixedFooterView;
  fixedFooterView = self->_fixedFooterView;
  if (fixedFooterView != v5)
  {
    v10 = v5;
    -[CSFixedFooterView removeFromSuperview](fixedFooterView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_fixedFooterView, a3);
    v8 = *p_fixedFooterView;
    -[CSCoverSheetView scrollView](self, "scrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSFixedFooterView setTrackingScrollViewForPageControl:](v8, "setTrackingScrollViewForPageControl:", v9);

    -[UIView insertSubview:atIndex:](self->_slideableContentView, "insertSubview:atIndex:", *p_fixedFooterView, 0);
    -[CSCoverSheetView setNeedsLayout](self, "setNeedsLayout");
    v5 = v10;
  }

}

- (void)setProudLockContainerView:(id)a3
{
  UIView *v5;
  UIView *proudLockContainerView;
  UIView *v7;

  v5 = (UIView *)a3;
  proudLockContainerView = self->_proudLockContainerView;
  if (proudLockContainerView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](proudLockContainerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_proudLockContainerView, a3);
    -[CSCoverSheetView _createProudLockContainerWrapperIfNecessary](self, "_createProudLockContainerWrapperIfNecessary");
    -[CSPropertyAnimatingTouchPassThroughView addSubview:](self->_proudLockContainerWrapperView, "addSubview:", self->_proudLockContainerView);
    -[CSCoverSheetView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setCameraCoveredView:(id)a3
{
  UIView *v5;
  UIView *cameraCoveredView;
  UIView *v7;

  v5 = (UIView *)a3;
  cameraCoveredView = self->_cameraCoveredView;
  if (cameraCoveredView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](cameraCoveredView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_cameraCoveredView, a3);
    -[CSCoverSheetView _createProudLockContainerWrapperIfNecessary](self, "_createProudLockContainerWrapperIfNecessary");
    -[CSPropertyAnimatingTouchPassThroughView addSubview:](self->_proudLockContainerWrapperView, "addSubview:", self->_cameraCoveredView);
    -[CSCoverSheetView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)_createProudLockContainerWrapperIfNecessary
{
  CSPropertyAnimatingTouchPassThroughView *v3;
  CSPropertyAnimatingTouchPassThroughView *v4;
  CSPropertyAnimatingTouchPassThroughView *proudLockContainerWrapperView;

  if (!self->_proudLockContainerWrapperView)
  {
    v3 = [CSPropertyAnimatingTouchPassThroughView alloc];
    v4 = -[CSPropertyAnimatingTouchPassThroughView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    proudLockContainerWrapperView = self->_proudLockContainerWrapperView;
    self->_proudLockContainerWrapperView = v4;

    -[CSCoverSheetView _prepareBlursForView:withHardEdges:](self, "_prepareBlursForView:withHardEdges:", self->_proudLockContainerWrapperView, 1);
    -[CSCoverSheetView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPoseidonContainerView:(id)a3
{
  UIView *v5;
  UIView *poseidonContainerView;
  UIView *v7;

  v5 = (UIView *)a3;
  poseidonContainerView = self->_poseidonContainerView;
  if (poseidonContainerView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](poseidonContainerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_poseidonContainerView, a3);
    -[UIView addSubview:](self->_higherSlideableContentView, "addSubview:", self->_poseidonContainerView);
    -[CSCoverSheetView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setWallpaperEffectView:(id)a3
{
  CSWallpaperView *v5;
  CSWallpaperView **p_wallpaperEffectView;
  CSWallpaperView *wallpaperEffectView;
  CSWallpaperView *v8;

  v5 = (CSWallpaperView *)a3;
  p_wallpaperEffectView = &self->_wallpaperEffectView;
  wallpaperEffectView = self->_wallpaperEffectView;
  if (wallpaperEffectView != v5)
  {
    v8 = v5;
    -[CSWallpaperView removeFromSuperview](wallpaperEffectView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_wallpaperEffectView, a3);
    if (*p_wallpaperEffectView)
    {
      -[UIView addSubview:](self->_slideableContentView, "addSubview:");
      -[UIView sendSubviewToBack:](self->_slideableContentView, "sendSubviewToBack:", *p_wallpaperEffectView);
    }
    -[CSCoverSheetView setNeedsLayout](self, "setNeedsLayout");
    v5 = v8;
  }

}

- (void)setBackgroundContentView:(id)a3
{
  CSBackgroundContentView *v5;
  CSBackgroundContentView **p_backgroundContentView;
  CSBackgroundContentView *backgroundContentView;
  CSBackgroundContentView *v8;

  v5 = (CSBackgroundContentView *)a3;
  p_backgroundContentView = &self->_backgroundContentView;
  backgroundContentView = self->_backgroundContentView;
  if (backgroundContentView != v5)
  {
    v8 = v5;
    -[CSBackgroundContentView removeFromSuperview](backgroundContentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_backgroundContentView, a3);
    if (*p_backgroundContentView)
    {
      -[UIView addSubview:](self->_slideableContentView, "addSubview:");
      -[UIView sendSubviewToBack:](self->_slideableContentView, "sendSubviewToBack:", *p_backgroundContentView);
    }
    -[CSCoverSheetView setNeedsLayout](self, "setNeedsLayout");
    v5 = v8;
  }

}

- (void)setWakeEffectView:(id)a3
{
  UIView *v5;
  UIView **p_wakeEffectView;
  UIView *wakeEffectView;
  UIView *v8;

  v5 = (UIView *)a3;
  p_wakeEffectView = &self->_wakeEffectView;
  wakeEffectView = self->_wakeEffectView;
  if (wakeEffectView != v5)
  {
    v8 = v5;
    -[UIView removeFromSuperview](wakeEffectView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_wakeEffectView, a3);
    if (*p_wakeEffectView)
    {
      -[UIView addSubview:](self->_slideableContentView, "addSubview:");
      -[UIView sendSubviewToBack:](self->_slideableContentView, "sendSubviewToBack:", *p_wakeEffectView);
    }
    -[CSCoverSheetView setNeedsLayout](self, "setNeedsLayout");
    v5 = v8;
  }

}

- (void)setPageViews:(id)a3
{
  -[SBFPagedScrollView setPageViews:](self->_scrollView, "setPageViews:", a3);
  -[CSFixedFooterView updatePageControl](self->_fixedFooterView, "updatePageControl");
}

- (NSArray)pageViews
{
  return -[SBFPagedScrollView pageViews](self->_scrollView, "pageViews");
}

- (void)setBackgroundView:(id)a3
{
  SBUIBackgroundView *v5;
  SBUIBackgroundView **p_backgroundView;
  SBUIBackgroundView *backgroundView;
  SBUIBackgroundView *v8;
  BSUIOrientationTransformWrapperView *v9;
  BSUIOrientationTransformWrapperView *backgroundContainerView;
  SBUIBackgroundView *v11;

  v5 = (SBUIBackgroundView *)a3;
  p_backgroundView = &self->_backgroundView;
  backgroundView = self->_backgroundView;
  v8 = v5;
  v11 = v5;
  if (backgroundView != v5)
  {
    if (backgroundView)
      -[SBUIBackgroundView removeFromSuperview](backgroundView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_backgroundView, a3);
    -[SBUIBackgroundView setUserInteractionEnabled:](*p_backgroundView, "setUserInteractionEnabled:", 0);
    -[SBUIBackgroundView setReduceTransparencyBackingColor:](*p_backgroundView, "setReduceTransparencyBackingColor:", self->_reduceTransparencyBackingColor);
    v8 = *p_backgroundView;
  }
  -[SBUIBackgroundView superview](v8, "superview");
  v9 = (BSUIOrientationTransformWrapperView *)objc_claimAutoreleasedReturnValue();
  backgroundContainerView = self->_backgroundContainerView;

  if (v9 != backgroundContainerView)
  {
    -[BSUIOrientationTransformWrapperView addContentView:](self->_backgroundContainerView, "addContentView:", *p_backgroundView);
    -[CSCoverSheetView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)updateContainerOrientationForBackgroundViews:(int64_t)a3
{
  -[BSUIOrientationTransformWrapperView setContainerOrientation:](self->_backgroundContainerView, "setContainerOrientation:", a3);
  -[BSUIOrientationTransformWrapperView layoutIfNeeded](self->_backgroundContainerView, "layoutIfNeeded");
}

- (void)setBedtimeGreetingViewBackgroundView:(id)a3
{
  SBUIBackgroundView *v5;
  SBUIBackgroundView **p_bedtimeGreetingViewBackgroundView;
  SBUIBackgroundView *bedtimeGreetingViewBackgroundView;
  SBUIBackgroundView *v8;

  v5 = (SBUIBackgroundView *)a3;
  p_bedtimeGreetingViewBackgroundView = &self->_bedtimeGreetingViewBackgroundView;
  bedtimeGreetingViewBackgroundView = self->_bedtimeGreetingViewBackgroundView;
  if (bedtimeGreetingViewBackgroundView != v5)
  {
    v8 = v5;
    if (bedtimeGreetingViewBackgroundView)
      -[SBUIBackgroundView removeFromSuperview](bedtimeGreetingViewBackgroundView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_bedtimeGreetingViewBackgroundView, a3);
    -[SBUIBackgroundView setUserInteractionEnabled:](*p_bedtimeGreetingViewBackgroundView, "setUserInteractionEnabled:", 0);
    -[SBUIBackgroundView setReduceTransparencyBackingColor:](*p_bedtimeGreetingViewBackgroundView, "setReduceTransparencyBackingColor:", self->_reduceTransparencyBackingColor);
    -[BSUIOrientationTransformWrapperView addContentView:](self->_backgroundContainerView, "addContentView:", *p_bedtimeGreetingViewBackgroundView);
    v5 = v8;
  }

}

- (void)setReduceTransparencyBackingColor:(id)a3
{
  id v5;
  UIColor **p_reduceTransparencyBackingColor;
  char v7;
  id v8;

  v5 = a3;
  if (v5)
  {
    p_reduceTransparencyBackingColor = &self->_reduceTransparencyBackingColor;
    v8 = v5;
    v7 = -[UIColor isEqual:](self->_reduceTransparencyBackingColor, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_reduceTransparencyBackingColor, a3);
      -[SBUIBackgroundView setReduceTransparencyBackingColor:](self->_bedtimeGreetingViewBackgroundView, "setReduceTransparencyBackingColor:", *p_reduceTransparencyBackingColor);
      -[SBUIBackgroundView setReduceTransparencyBackingColor:](self->_backgroundView, "setReduceTransparencyBackingColor:", *p_reduceTransparencyBackingColor);
      v5 = v8;
    }
  }

}

- (void)setQuickActionsView:(id)a3
{
  CSQuickActionsView *v5;
  CSQuickActionsView **p_quickActionsView;
  CSQuickActionsView *quickActionsView;
  CSCoverSheetView *v8;
  CSQuickActionsView *v9;

  v5 = (CSQuickActionsView *)a3;
  p_quickActionsView = &self->_quickActionsView;
  quickActionsView = self->_quickActionsView;
  v9 = v5;
  if (quickActionsView != v5)
    goto LABEL_4;
  -[CSQuickActionsView superview](v5, "superview");
  v8 = (CSCoverSheetView *)objc_claimAutoreleasedReturnValue();

  if (v8 != self)
  {
    quickActionsView = *p_quickActionsView;
LABEL_4:
    -[CSQuickActionsView removeFromSuperview](quickActionsView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_quickActionsView, a3);
    -[CSCoverSheetView addSubview:](self, "addSubview:", *p_quickActionsView);
    -[CSCoverSheetView _prepareBlursForView:withHardEdges:](self, "_prepareBlursForView:withHardEdges:", *p_quickActionsView, 0);
  }

}

- (void)setQuickActionsViewOffset:(CGPoint)a3
{
  if (self->_quickActionsViewOffset.x != a3.x || self->_quickActionsViewOffset.y != a3.y)
  {
    self->_quickActionsViewOffset = a3;
    -[CSCoverSheetView _layoutQuickActionsView](self, "_layoutQuickActionsView");
  }
}

- (void)setQuickActionsViewScale:(double)a3
{
  if (self->_quickActionsViewScale != a3)
  {
    self->_quickActionsViewScale = a3;
    -[CSCoverSheetView _layoutQuickActionsView](self, "_layoutQuickActionsView");
  }
}

- (void)setQuickActionsViewBlurRadius:(double)a3
{
  if (self->_quickActionsViewBlurRadius != a3)
  {
    self->_quickActionsViewBlurRadius = a3;
    if (self->_quickActionsView)
      -[CSCoverSheetView _updateBlurForView:toRadius:](self, "_updateBlurForView:toRadius:");
  }
}

- (void)setQuickActionsViewOffset:(CGPoint)a3 scale:(double)a4
{
  double *p_quickActionsViewScale;

  if (self->_quickActionsViewOffset.x != a3.x || self->_quickActionsViewOffset.y != a3.y)
  {
    self->_quickActionsViewOffset = a3;
    p_quickActionsViewScale = &self->_quickActionsViewScale;
    if (self->_quickActionsViewScale == a4)
    {
LABEL_6:
      -[CSCoverSheetView _layoutQuickActionsView](self, "_layoutQuickActionsView");
      return;
    }
LABEL_8:
    *p_quickActionsViewScale = a4;
    goto LABEL_6;
  }
  p_quickActionsViewScale = &self->_quickActionsViewScale;
  if (self->_quickActionsViewScale != a4)
    goto LABEL_8;
}

- (void)setDateViewOffset:(CGPoint)a3 scale:(double)a4
{
  double *p_dateViewScale;

  if (self->_dateViewOffset.x != a3.x || self->_dateViewOffset.y != a3.y)
  {
    self->_dateViewOffset = a3;
    p_dateViewScale = &self->_dateViewScale;
    if (self->_dateViewScale == a4)
    {
LABEL_6:
      -[CSCoverSheetView _layoutDateView](self, "_layoutDateView");
      return;
    }
LABEL_8:
    *p_dateViewScale = a4;
    goto LABEL_6;
  }
  p_dateViewScale = &self->_dateViewScale;
  if (self->_dateViewScale != a4)
    goto LABEL_8;
}

- (void)setContentViewOffset:(CGPoint)a3 scale:(double)a4
{
  double *p_contentViewScale;

  if (self->_contentViewOffset.x != a3.x || self->_contentViewOffset.y != a3.y)
  {
    self->_contentViewOffset = a3;
    p_contentViewScale = &self->_contentViewScale;
    if (self->_contentViewScale == a4)
    {
LABEL_6:
      -[CSCoverSheetView _layoutContentView](self, "_layoutContentView");
      return;
    }
LABEL_8:
    *p_contentViewScale = a4;
    goto LABEL_6;
  }
  p_contentViewScale = &self->_contentViewScale;
  if (self->_contentViewScale != a4)
    goto LABEL_8;
}

- (void)setProudLockIconViewOffset:(CGPoint)a3 scale:(double)a4
{
  double *p_proudLockIconViewScale;

  if (self->_proudLockIconViewOffset.x != a3.x || self->_proudLockIconViewOffset.y != a3.y)
  {
    self->_proudLockIconViewOffset = a3;
    p_proudLockIconViewScale = &self->_proudLockIconViewScale;
    if (self->_proudLockIconViewScale == a4)
    {
LABEL_6:
      -[CSCoverSheetView _layoutProudLockView](self, "_layoutProudLockView");
      return;
    }
LABEL_8:
    *p_proudLockIconViewScale = a4;
    goto LABEL_6;
  }
  p_proudLockIconViewScale = &self->_proudLockIconViewScale;
  if (self->_proudLockIconViewScale != a4)
    goto LABEL_8;
}

- (void)setWallpaperFloatingLayerContainerViewOffset:(CGPoint)a3 scale:(double)a4
{
  double *p_wallpaperFloatingLayerContainerViewScale;

  if (self->_wallpaperFloatingLayerContainerViewOffset.x != a3.x
    || self->_wallpaperFloatingLayerContainerViewOffset.y != a3.y)
  {
    self->_wallpaperFloatingLayerContainerViewOffset = a3;
    p_wallpaperFloatingLayerContainerViewScale = &self->_wallpaperFloatingLayerContainerViewScale;
    if (self->_wallpaperFloatingLayerContainerViewScale == a4)
    {
LABEL_6:
      -[CSCoverSheetView _layoutWallpaperFloatingLayerContainerView](self, "_layoutWallpaperFloatingLayerContainerView");
      return;
    }
LABEL_8:
    *p_wallpaperFloatingLayerContainerViewScale = a4;
    goto LABEL_6;
  }
  p_wallpaperFloatingLayerContainerViewScale = &self->_wallpaperFloatingLayerContainerViewScale;
  if (self->_wallpaperFloatingLayerContainerViewScale != a4)
    goto LABEL_8;
}

- (void)setBackgroundContentViewOffset:(CGPoint)a3 scale:(double)a4
{
  double *p_backgroundContentViewScale;

  if (self->_backgroundContentViewOffset.x != a3.x || self->_backgroundContentViewOffset.y != a3.y)
  {
    self->_backgroundContentViewOffset = a3;
    p_backgroundContentViewScale = &self->_backgroundContentViewScale;
    if (self->_backgroundContentViewScale == a4)
    {
LABEL_6:
      -[CSCoverSheetView _layoutBackgroundContentView](self, "_layoutBackgroundContentView");
      return;
    }
LABEL_8:
    *p_backgroundContentViewScale = a4;
    goto LABEL_6;
  }
  p_backgroundContentViewScale = &self->_backgroundContentViewScale;
  if (self->_backgroundContentViewScale != a4)
    goto LABEL_8;
}

- (BOOL)resetScrollViewToMainPageAnimated:(BOOL)a3 withCompletion:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = a3;
  v6 = a4;
  -[CSCoverSheetView scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v7, "scrollToPageAtIndex:animated:withCompletion:", -[CSCoverSheetView _indexOfMainPage](self, "_indexOfMainPage"), v4, v6);

  return v4;
}

- (BOOL)resetScrollViewToMainPageAnimated:(BOOL)a3 withAnimationSettings:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a5;
  v8 = a4;
  -[CSCoverSheetView scrollView](self, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v9, "scrollToPageAtIndex:withAnimationSettings:withCompletion:", -[CSCoverSheetView _indexOfMainPage](self, "_indexOfMainPage"), v8, v7);

  return (char)self;
}

- (BOOL)scrollToPageAtIndex:(unint64_t)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v5;
  id v8;
  SBFPagedScrollView *v9;
  id v10;
  SBFPagedScrollView *v11;
  _QWORD v13[4];
  SBFPagedScrollView *v14;
  id v15;

  v5 = a4;
  v8 = a5;
  v9 = self->_scrollView;
  -[SBFPagedScrollView setGestureEnabled:](v9, "setGestureEnabled:", 0);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__CSCoverSheetView_scrollToPageAtIndex_animated_withCompletion___block_invoke;
  v13[3] = &unk_1E8E2DF80;
  v14 = v9;
  v15 = v8;
  v10 = v8;
  v11 = v9;
  LOBYTE(v5) = -[SBFPagedScrollView scrollToPageAtIndex:animated:withCompletion:](v11, "scrollToPageAtIndex:animated:withCompletion:", a3, v5, v13);

  return v5;
}

uint64_t __64__CSCoverSheetView_scrollToPageAtIndex_animated_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setGestureEnabled:", 1);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateUIForAuthenticated:(BOOL)a3
{
  double v4;
  double v5;
  id v6;

  if (a3)
  {
    v4 = 0.0;
    v5 = 1.0;
  }
  else
  {
    v4 = 1.0;
    v5 = 0.0;
  }
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v4, v5, 0.0, 0.5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_authIndicator, "setBackgroundColor:", v6);

}

- (void)setForegroundViewPositionOffset:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CSCoverSheetView *slideableContentView;
  SBFPagedScrollView *scrollView;
  UIView *v9;
  UIView *higherSlideableContentView;
  CGAffineTransform *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CGAffineTransform v15;
  CGAffineTransform v16;

  y = a3.y;
  x = a3.x;
  if (self->_foregroundViewPositionOffset.x != a3.x || self->_foregroundViewPositionOffset.y != a3.y)
  {
    self->_foregroundViewPositionOffset = a3;
    if ((BSFloatIsZero() & 1) != 0)
    {
      slideableContentView = (CSCoverSheetView *)self->_slideableContentView;
      scrollView = self->_scrollView;
    }
    else
    {
      scrollView = self->_scrollView;
      slideableContentView = self;
    }
    -[CSCoverSheetView addSubview:](slideableContentView, "addSubview:", scrollView);
    -[CSCoverSheetView _orderSubviews](self, "_orderSubviews");
    if ((BSPointEqualToPoint() & 1) != 0)
    {
      v9 = self->_slideableContentView;
      v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v16.a = *MEMORY[0x1E0C9BAA8];
      v13 = *(_OWORD *)&v16.a;
      *(_OWORD *)&v16.c = v14;
      *(_OWORD *)&v16.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v12 = *(_OWORD *)&v16.tx;
      -[UIView setTransform:](v9, "setTransform:", &v16);
      higherSlideableContentView = self->_higherSlideableContentView;
      *(_OWORD *)&v16.a = v13;
      *(_OWORD *)&v16.c = v14;
      *(_OWORD *)&v16.tx = v12;
      v11 = &v16;
    }
    else
    {
      memset(&v16, 0, sizeof(v16));
      CGAffineTransformMakeTranslation(&v16, x, y);
      higherSlideableContentView = self->_slideableContentView;
      v15 = v16;
      v11 = &v15;
    }
    -[UIView setTransform:](higherSlideableContentView, "setTransform:", v11);
    -[CSCoverSheetView _layoutFakeStatusBar](self, "_layoutFakeStatusBar");
    -[CSCoverSheetView _layoutHigherSlideableContentView](self, "_layoutHigherSlideableContentView");
  }
}

- (void)viewControllerWillAppear
{
  unint64_t v3;

  self->_viewControllerAppearingOrAppeared = 1;
  v3 = -[SBFPagedScrollView currentPageIndex](self->_scrollView, "currentPageIndex");
  if (v3 == -[CSCoverSheetView _indexOfMainPage](self, "_indexOfMainPage"))
  {
    -[CSCoverSheetView _setupAllGesturesOnScrollView:](self, "_setupAllGesturesOnScrollView:", 1);
    -[SBSearchGesture setTargetView:](self->_searchGesture, "setTargetView:", self->_scrollView);
  }
}

- (void)viewControllerDidDisappear
{
  self->_viewControllerAppearingOrAppeared = 0;
  -[CSCoverSheetView _setupAllGesturesOnScrollView:](self, "_setupAllGesturesOnScrollView:", 0);
  -[SBSearchGesture setTargetView:](self->_searchGesture, "setTargetView:", 0);
  -[CSCoverSheetView cancelTransition](self, "cancelTransition");
  self->_shouldModifyPageScrolling = 1;
}

- (CGRect)dateViewPresentationExtentForPageRelativeScrollOffset:(double)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGRect v9;

  v8 = 0.0;
  -[CSCoverSheetView _dateViewFrameForPageAlignment:pageRelativeScrollOffset:outAlignmentPercent:](self, "_dateViewFrameForPageAlignment:pageRelativeScrollOffset:outAlignmentPercent:", 0, &v8, a3);
  v5 = v4;
  v7 = v6;
  -[SBFLockScreenDateView presentationExtentForAlignmentPercent:](self->_dateView, "presentationExtentForAlignmentPercent:", v8);
  return CGRectOffset(v9, v5, v7);
}

- (void)_setLockScreenDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_cachedLockScreenDefaults, a3);
}

- (id)_lockScreenDefaults
{
  SBLockScreenDefaults *cachedLockScreenDefaults;
  SBLockScreenDefaults *v4;
  SBLockScreenDefaults *v5;

  cachedLockScreenDefaults = self->_cachedLockScreenDefaults;
  if (!cachedLockScreenDefaults)
  {
    v4 = (SBLockScreenDefaults *)objc_alloc_init(MEMORY[0x1E0DA9FA8]);
    v5 = self->_cachedLockScreenDefaults;
    self->_cachedLockScreenDefaults = v4;

    cachedLockScreenDefaults = self->_cachedLockScreenDefaults;
  }
  return cachedLockScreenDefaults;
}

- (void)didAddSubview:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSCoverSheetView;
  -[CSCoverSheetView didAddSubview:](&v4, sel_didAddSubview_, a3);
  -[CSCoverSheetView _orderSubviews](self, "_orderSubviews");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSCoverSheetView;
  -[CSCoverSheetView layoutSubviews](&v3, sel_layoutSubviews);
  -[CSCoverSheetView _layoutFullScreenViews](self, "_layoutFullScreenViews");
  -[CSCoverSheetView _layoutDateTimeViewClippingView](self, "_layoutDateTimeViewClippingView");
  -[CSCoverSheetView _layoutDateView](self, "_layoutDateView");
  -[CSCoverSheetView _layoutSidebarComplicationContainerView](self, "_layoutSidebarComplicationContainerView");
  -[CSCoverSheetView _layoutFakeStatusBar](self, "_layoutFakeStatusBar");
  -[CSCoverSheetView _layoutAuthIndicator](self, "_layoutAuthIndicator");
  -[CSCoverSheetView _layoutBottomPage](self, "_layoutBottomPage");
  -[CSCoverSheetView _layoutWallpaperEffectView](self, "_layoutWallpaperEffectView");
  -[CSCoverSheetView _layoutTintingView](self, "_layoutTintingView");
  -[CSCoverSheetView _layoutProudLockView](self, "_layoutProudLockView");
  -[CSCoverSheetView _layoutHigherSlideableContentView](self, "_layoutHigherSlideableContentView");
  -[CSCoverSheetView _layoutTeachableMomentsContainerView](self, "_layoutTeachableMomentsContainerView");
  -[CSCoverSheetView _layoutQuickActionsView](self, "_layoutQuickActionsView");
  -[CSCoverSheetView _layoutStatusBarLegibilityView](self, "_layoutStatusBarLegibilityView");
  -[CSCoverSheetView _layoutBackgroundContentView](self, "_layoutBackgroundContentView");
  -[CSCoverSheetView _layoutWallpaperFloatingLayerContainerView](self, "_layoutWallpaperFloatingLayerContainerView");
  -[SBSearchGesture updateForRotation](self->_searchGesture, "updateForRotation");
  -[CSCoverSheetView _orderSubviews](self, "_orderSubviews");
}

- (void)setClipsToBounds:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CSCoverSheetView;
  -[CSCoverSheetView setClipsToBounds:](&v5, sel_setClipsToBounds_);
  -[UIView setClipsToBounds:](self->_dateTimeClippingView, "setClipsToBounds:", v3);
}

- (CGPoint)_scrollView:(id)a3 adjustedOffsetForOffset:(CGPoint)a4 translation:(CGPoint)a5 startPoint:(CGPoint)a6 locationInView:(CGPoint)a7 horizontalVelocity:(double *)a8 verticalVelocity:(double *)a9
{
  double y;
  double x;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v20;
  unint64_t initialPageIndex;
  double v22;
  double v23;
  double v24;
  double v25;
  CGPoint result;

  y = a7.y;
  x = a7.x;
  v13 = a6.y;
  v14 = a6.x;
  v15 = a5.y;
  v16 = a5.x;
  v17 = a4.y;
  v18 = a4.x;
  v20 = a3;
  initialPageIndex = self->_initialPageIndex;
  if (initialPageIndex == -[CSCoverSheetView _indexOfMainPage](self, "_indexOfMainPage")
    && self->_shouldModifyPageScrolling)
  {
    -[CSScrollModifier scrollView:adjustedOffsetForOffset:translation:startPoint:locationInView:horizontalVelocity:verticalVelocity:](self->_scrollModifier, "scrollView:adjustedOffsetForOffset:translation:startPoint:locationInView:horizontalVelocity:verticalVelocity:", v20, a8, a9, v18, v17, v16, v15, v14, v13, x, y);
    v18 = v22;
    v17 = v23;
  }

  v24 = v18;
  v25 = v17;
  result.y = v25;
  result.x = v24;
  return result;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  unint64_t v4;
  id v5;

  v5 = a3;
  v4 = -[SBFPagedScrollView currentPageIndex](self->_scrollView, "currentPageIndex");
  self->_initialPageIndex = v4;
  if (v4 == -[CSCoverSheetView _indexOfMainPage](self, "_indexOfMainPage") && self->_shouldModifyPageScrolling)
    -[CSScrollModifier scrollViewWillBeginDragging:](self->_scrollModifier, "scrollViewWillBeginDragging:", v5);
  if (-[UIGestureRecognizer isEnabled](self->_wallpaperGestureRecognizer, "isEnabled"))
  {
    -[UIGestureRecognizer setEnabled:](self->_wallpaperGestureRecognizer, "setEnabled:", 0);
    -[UIGestureRecognizer setEnabled:](self->_wallpaperGestureRecognizer, "setEnabled:", 1);
  }

}

- (void)scrollViewWillBeginScrolling:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id WeakRetained;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v4 = a3;
  kdebug_trace();
  -[CSCoverSheetView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_shouldModifyPageScrolling = objc_msgSend(v5, "shouldModifyPageScrolling");

  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
  {
    objc_msgSend(v4, "contentSize");
    v7 = v6;
    objc_msgSend(v4, "frame");
    v9 = v7 - v8;
    objc_msgSend(v4, "contentOffset");
    v11 = v9 - v10;
  }
  else
  {
    objc_msgSend(v4, "contentOffset");
  }
  self->_scrollViewStartingXOffset = v11;
  -[CSCoverSheetView _currentTransitionContext](self, "_currentTransitionContext");
  *(_OWORD *)&self->_transitionContext.value = v13;
  *(_OWORD *)&self->_transitionContext.interval.start.inclusive = v14;
  *(_OWORD *)&self->_transitionContext.interval.end.inclusive = v15;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "transitionSource:willBeginWithType:", self, 2);
  objc_msgSend(WeakRetained, "setRestrictsTouchesForRemoteView:", 1);

}

- (void)scrollViewDidScroll:(id)a3 withContext:(id *)a4
{
  $F577ECF5B7B65387364E98B1FF69FDFC *p_transitionContext;
  double value;
  double v7;
  int64_t mode;
  __int128 v9;
  id WeakRetained;
  $DCA72CBAB2CDF67DA9370D0153CCCF3D end;
  __int128 v12;
  NSObject *v13;
  int64_t v14;
  __int128 v15;
  _OWORD v16[3];
  _BYTE v17[48];
  _BYTE buf[32];
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[CSFixedFooterView updatePageControl](self->_fixedFooterView, "updatePageControl", a3, a4);
  p_transitionContext = &self->_transitionContext;
  value = self->_transitionContext.interval.start.value;
  v7 = self->_transitionContext.value;
  v20 = *(_OWORD *)&self->_transitionContext.interval.start.inclusive;
  mode = self->_transitionContext.mode;
  v21 = *(_QWORD *)&self->_transitionContext.interval.end.inclusive;
  -[CSCoverSheetView _currentTransitionContext](self, "_currentTransitionContext");
  v9 = *(_OWORD *)&buf[16];
  *(_OWORD *)&self->_transitionContext.value = *(_OWORD *)buf;
  *(_OWORD *)&self->_transitionContext.interval.start.inclusive = v9;
  *(_OWORD *)&self->_transitionContext.interval.end.inclusive = v19;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (mode)
  {
    if (self->_transitionContext.mode)
    {
      if ((BSFloatEqualToFloat() & 1) == 0)
      {
        *(double *)buf = value;
        *(_OWORD *)&buf[8] = v20;
        *(_QWORD *)&buf[24] = v21;
        if (BSIntervalOrder())
        {
          end = self->_transitionContext.interval.end;
          *($DCA72CBAB2CDF67DA9370D0153CCCF3D *)buf = self->_transitionContext.interval.start;
          *($DCA72CBAB2CDF67DA9370D0153CCCF3D *)&buf[16] = end;
          if (BSIntervalOrder())
          {
            *(double *)buf = v7;
            *(double *)&buf[8] = value;
            *(_OWORD *)&buf[16] = v20;
            *(_QWORD *)&v19 = v21;
            *((_QWORD *)&v19 + 1) = mode;
            v12 = *(_OWORD *)&self->_transitionContext.interval.start.inclusive;
            v16[0] = *(_OWORD *)&p_transitionContext->value;
            v16[1] = v12;
            v16[2] = *(_OWORD *)&self->_transitionContext.interval.end.inclusive;
            -[CSCoverSheetView _completedTransitionContextForPreviousTransitionContext:newTransitionContext:](self, "_completedTransitionContextForPreviousTransitionContext:newTransitionContext:", buf, v16);
            objc_msgSend(WeakRetained, "transitionSource:didEndWithContext:", self, v17);
            objc_msgSend(WeakRetained, "transitionSource:willBeginWithType:", self, 2);
            SBLogDashBoard();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              v14 = self->_transitionContext.mode;
              *(_DWORD *)buf = 134217984;
              *(_QWORD *)&buf[4] = v14;
              _os_log_impl(&dword_1D0337000, v13, OS_LOG_TYPE_DEFAULT, "Scroll context did change to transitionContext.mode: %ld", buf, 0xCu);
            }

          }
        }
      }
    }
  }
  v15 = *(_OWORD *)&self->_transitionContext.interval.start.inclusive;
  *(_OWORD *)buf = *(_OWORD *)&p_transitionContext->value;
  *(_OWORD *)&buf[16] = v15;
  v19 = *(_OWORD *)&self->_transitionContext.interval.end.inclusive;
  objc_msgSend(WeakRetained, "transitionSource:didUpdateTransitionWithContext:", self, buf);
  -[CSCoverSheetView _layoutQuickActionsView](self, "_layoutQuickActionsView");
  -[CSCoverSheetView _layoutDateView](self, "_layoutDateView");
  -[CSCoverSheetView _layoutStatusBarBackgroundView](self, "_layoutStatusBarBackgroundView");
  -[CSCoverSheetView _layoutHigherSlideableContentView](self, "_layoutHigherSlideableContentView");

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  id v9;
  unint64_t initialPageIndex;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  unint64_t v23;
  CGFloat v24;
  void *v25;
  CGFloat v26;
  NSObject *v27;
  unint64_t targetPageIndexForDraggingEnded;
  int v29;
  unint64_t v30;
  uint64_t v31;

  y = a4.y;
  x = a4.x;
  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  initialPageIndex = self->_initialPageIndex;
  if (initialPageIndex == -[CSCoverSheetView _indexOfMainPage](self, "_indexOfMainPage")
    && self->_shouldModifyPageScrolling)
  {
    -[CSScrollModifier scrollViewWillEndDragging:withVelocity:targetContentOffset:](self->_scrollModifier, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v9, a5, x, y);
    v11 = -[SBFPagedScrollView currentPageIndex](self->_scrollView, "currentPageIndex");
    v12 = self->_initialPageIndex;
    -[SBFPagedScrollView pageViews](self->_scrollView, "pageViews");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count") - 1;

    if (v14 >= v11 + 1)
      v14 = v11 + 1;
    v15 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
    v16 = -[CSScrollModifier scrollFromRightToLeft](self->_scrollModifier, "scrollFromRightToLeft");
    if (v16)
      v17 = v11;
    else
      v17 = v14;
    if (v16)
      v18 = v14;
    else
      v18 = v11;
    if (v15 == 1)
      v19 = v17;
    else
      v19 = v18;
    v20 = -[CSScrollModifier recognized](self->_scrollModifier, "recognized");
    -[CSCoverSheetView scrollView](self, "scrollView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v20)
      v23 = v19;
    else
      v23 = v12;
    objc_msgSend(v21, "contentOffsetForPageAtIndex:", v23);
    a5->x = v24;

  }
  if (self->_targetPageIndexForDraggingEnded != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CSCoverSheetView scrollView](self, "scrollView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "contentOffsetForPageAtIndex:", self->_targetPageIndexForDraggingEnded);
    a5->x = v26;

    SBLogDashBoard();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      targetPageIndexForDraggingEnded = self->_targetPageIndexForDraggingEnded;
      v29 = 134217984;
      v30 = targetPageIndexForDraggingEnded;
      _os_log_impl(&dword_1D0337000, v27, OS_LOG_TYPE_DEFAULT, "Scroll did end dragging with no clear destination, moving to index: %lu", (uint8_t *)&v29, 0xCu);
    }

  }
}

- (void)scrollViewDidEndScrolling:(id)a3
{
  __int128 v4;
  id WeakRetained;
  __int128 v6;
  unint64_t initialPageIndex;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  kdebug_trace();
  -[CSFixedFooterView updatePageControl](self->_fixedFooterView, "updatePageControl");
  -[CSCoverSheetView _currentTransitionContext](self, "_currentTransitionContext");
  v4 = v10;
  *(_OWORD *)&self->_transitionContext.value = v9;
  *(_OWORD *)&self->_transitionContext.interval.start.inclusive = v4;
  *(_OWORD *)&self->_transitionContext.interval.end.inclusive = v11;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = *(_OWORD *)&self->_transitionContext.interval.start.inclusive;
  v9 = *(_OWORD *)&self->_transitionContext.value;
  v10 = v6;
  v11 = *(_OWORD *)&self->_transitionContext.interval.end.inclusive;
  objc_msgSend(WeakRetained, "transitionSource:didEndWithContext:", self, &v9);
  objc_msgSend(WeakRetained, "setRestrictsTouchesForRemoteView:", 0);
  initialPageIndex = self->_initialPageIndex;
  if (initialPageIndex == -[CSCoverSheetView _indexOfMainPage](self, "_indexOfMainPage")
    && self->_shouldModifyPageScrolling)
  {
    -[CSScrollModifier reset](self->_scrollModifier, "reset");
  }
  -[CSCoverSheetView _setupAllGesturesOnScrollView:](self, "_setupAllGesturesOnScrollView:", 0);
  if (self->_viewControllerAppearingOrAppeared)
  {
    v8 = -[SBFPagedScrollView currentPageIndex](self->_scrollView, "currentPageIndex");
    if (v8 == -[CSCoverSheetView _indexOfMainPage](self, "_indexOfMainPage"))
      -[CSCoverSheetView _setupAllGesturesOnScrollView:](self, "_setupAllGesturesOnScrollView:", 1);
  }

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  -[CSCoverSheetView setTargetPageIndexForDraggingEnded:](self, "setTargetPageIndexForDraggingEnded:", 0x7FFFFFFFFFFFFFFFLL, a4);
}

- (BOOL)coverSheetScrollView:(id)a3 shouldSetContentOffset:(CGPoint)a4 animated:(BOOL)a5
{
  double x;
  void *v7;
  double v8;
  double v9;

  x = a4.x;
  if (!-[CSCoverSheetView ignoresOverscrollOnMainPage](self, "ignoresOverscrollOnMainPage", a3, a5, a4.x, a4.y))
    return 1;
  -[CSCoverSheetView scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentOffsetForPageAtIndex:", -[CSCoverSheetView _indexOfMainPage](self, "_indexOfMainPage"));
  v9 = v8;

  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    return x <= v9;
  else
    return x >= v9;
}

- (BOOL)coverSheetScrollView:(id)a3 gestureRecognizerShouldBegin:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;

  v5 = a4;
  objc_msgSend(v5, "locationInView:", self);
  v7 = v6;
  v9 = v8;
  -[CSCoverSheetView delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v10, "isTouchLocation:inRestrictedRectForGestureView:", v11, v7, v9);
  return v5 ^ 1;
}

- (NSString)coverSheetIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  return 2;
}

- (BOOL)isTransitioning
{
  void *v2;
  char v3;

  -[CSCoverSheetView scrollView](self, "scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isScrolling");

  return v3;
}

- ($C89AE587F4FC9517FD26718A5F681357)transitionContext
{
  __int128 v3;

  v3 = *(_OWORD *)&self[11].var0;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[10].var1.var1.var1;
  *(_OWORD *)&retstr->var1.var0.var1 = v3;
  *(_OWORD *)&retstr->var1.var1.var1 = *(_OWORD *)&self[11].var1.var0.var1;
  return self;
}

- (void)cancelTransition
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  __int128 v10;
  __int128 v11;
  double v12;

  -[CSCoverSheetView scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isScrolling");

  if (v4)
  {
    -[CSCoverSheetView scrollView](self, "scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSCoverSheetView scrollView](self, "scrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "currentScrollContext");
      v8 = *((double *)&v11 + 1);
      v9 = v12;
    }
    else
    {
      v12 = 0.0;
      v10 = 0u;
      v11 = 0u;
      v9 = 0.0;
      v8 = 0.0;
    }
    objc_msgSend(v5, "setContentOffset:", v8, v9, v10, v11, *(_QWORD *)&v12);

  }
}

- (BOOL)isTransitioningBackgroundStyle
{
  return -[SBUIBackgroundView isTransitioningBackgroundStyle](self->_backgroundView, "isTransitioningBackgroundStyle");
}

- (int64_t)backgroundStyle
{
  return -[SBUIBackgroundView backgroundStyle](self->_backgroundView, "backgroundStyle");
}

- (void)setBackgroundStyle:(int64_t)a3
{
  -[SBUIBackgroundView setBackgroundStyle:](self->_backgroundView, "setBackgroundStyle:", a3);
}

- (void)beginTransitionToBackgroundStyle:(int64_t)a3
{
  -[SBUIBackgroundView beginTransitionToBackgroundStyle:](self->_backgroundView, "beginTransitionToBackgroundStyle:", a3);
}

- (void)updateBackgroundStyleTransitionProgress:(double)a3
{
  -[SBUIBackgroundView updateBackgroundStyleTransitionProgress:](self->_backgroundView, "updateBackgroundStyleTransitionProgress:", a3);
}

- (void)completeTransitionToBackgroundStyle:(int64_t)a3
{
  -[SBUIBackgroundView completeTransitionToBackgroundStyle:](self->_backgroundView, "completeTransitionToBackgroundStyle:", a3);
}

- (void)_setDateView:(id)a3 forTesting:(BOOL)a4
{
  SBFLockScreenDateView *v7;
  SBFLockScreenDateView *dateView;
  UIVisualEffectView *dateEffectView;
  void *v10;
  SBFLockScreenDateView *v11;

  v7 = (SBFLockScreenDateView *)a3;
  dateView = self->_dateView;
  if (dateView != v7)
  {
    v11 = v7;
    -[SBFLockScreenDateView removeFromSuperview](dateView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_dateView, a3);
    -[CSCoverSheetView _updateDateFont](self, "_updateDateFont");
    if (!a4)
    {
      dateEffectView = self->_dateEffectView;
      if (dateEffectView)
      {
        -[UIVisualEffectView contentView](dateEffectView, "contentView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addSubview:", v11);

      }
      else
      {
        -[UIView addSubview:](self->_dateTimeClippingView, "addSubview:", v11);
      }
    }
    -[CSCoverSheetView _dateViewFrameForPageAlignment:pageRelativeScrollOffset:outAlignmentPercent:](self, "_dateViewFrameForPageAlignment:pageRelativeScrollOffset:outAlignmentPercent:", 1, 0, 0.0);
    -[SBFLockScreenDateView setRestingFrame:](self->_dateView, "setRestingFrame:");
    -[CSCoverSheetView _layoutDateView](self, "_layoutDateView");
    v7 = v11;
  }

}

- (void)_updateDateFont
{
  SBFLockScreenDateView *dateView;
  void *v4;
  SBFLockScreenDateView *v5;
  _BOOL8 v6;
  SBFLockScreenDateView *v7;
  SBFLockScreenDateView *v8;
  void *v9;

  if (-[CSLookSettings useSettingsDateTime](self->_lookSettings, "useSettingsDateTime")
    && -[CSLookSettings customizesDateTime](self->_lookSettings, "customizesDateTime"))
  {
    dateView = self->_dateView;
    -[CSLookSettings customTimeFont](self->_lookSettings, "customTimeFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFLockScreenDateView setCustomTimeFont:](dateView, "setCustomTimeFont:", v4);

    v5 = self->_dateView;
    v6 = -[CSLookSettings subtitleAboveTime](self->_lookSettings, "subtitleAboveTime");
    v7 = v5;
  }
  else
  {
    v8 = self->_dateView;
    objc_msgSend(MEMORY[0x1E0DA9E58], "timeFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFLockScreenDateView setCustomTimeFont:](v8, "setCustomTimeFont:", v9);

    v7 = self->_dateView;
    v6 = 0;
  }
  -[SBFLockScreenDateView setSubtitleOnTop:](v7, "setSubtitleOnTop:", v6);
}

- (void)setRegionsDebugView:(id)a3
{
  CSRegionsDebugView *v5;
  CSRegionsDebugView *regionsDebugView;
  CSRegionsDebugView *v7;

  v5 = (CSRegionsDebugView *)a3;
  regionsDebugView = self->_regionsDebugView;
  v7 = v5;
  if (regionsDebugView != v5)
  {
    -[CSRegionsDebugView removeFromSuperview](regionsDebugView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_regionsDebugView, a3);
    -[CSCoverSheetView addSubview:](self, "addSubview:", v7);
    -[CSCoverSheetView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_layoutFullScreenViews
{
  double v3;
  double v4;
  double v5;
  double v6;
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
  NSObject *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;
  CGRect v31;
  CGRect v32;

  v30 = *MEMORY[0x1E0C80C00];
  -[CSCoverSheetView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CSCoverSheetView center](self, "center");
  v24 = v12;
  v25 = v11;
  -[BSUIOrientationTransformWrapperView setFrame:](self->_backgroundContainerView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_modalPresentationView, "setFrame:", v4, v6, v8, v10);
  -[CSFixedFooterView setFrame:](self->_fixedFooterView, "setFrame:", v4, v6, v8, v10);
  -[SBFPagedScrollView frame](self->_scrollView, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  if ((BSRectEqualToRect() & 1) == 0)
  {
    SBLogDashBoard();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v31.origin.x = v14;
      v31.origin.y = v16;
      v31.size.width = v18;
      v31.size.height = v20;
      NSStringFromCGRect(v31);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v32.origin.x = v4;
      v32.origin.y = v6;
      v32.size.width = v8;
      v32.size.height = v10;
      NSStringFromCGRect(v32);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v27 = v22;
      v28 = 2112;
      v29 = v23;
      _os_log_impl(&dword_1D0337000, v21, OS_LOG_TYPE_INFO, "CoverSheetView scrollView frame will change from %@ to %@", buf, 0x16u);

    }
    -[SBFPagedScrollView setFrame:](self->_scrollView, "setFrame:", v4, v6, v8, v10);
  }
  -[UIView setBounds:](self->_slideableContentView, "setBounds:", v4, v6, v8, v10);
  -[UIView setCenter:](self->_slideableContentView, "setCenter:", v25, v24);
  -[UIView setBounds:](self->_higherSlideableContentView, "setBounds:", v4, v6, v8, v10);
  -[UIView setCenter:](self->_higherSlideableContentView, "setCenter:", v25, v24);
  -[CSCoverSheetView bringSubviewToFront:](self, "bringSubviewToFront:", self->_regionsDebugView);
  -[CSRegionsDebugView setFrame:](self->_regionsDebugView, "setFrame:", v4, v6, v8, v10);
}

- (void)_layoutDateTimeViewClippingView
{
  if (self->_dateTimeClippingView)
  {
    if (self->_dateView)
    {
      -[CSCoverSheetView _overlayClippingFrame](self, "_overlayClippingFrame");
      -[UIView setFrame:](self->_dateTimeClippingView, "setFrame:");
      -[UIView setClipsToBounds:](self->_dateTimeClippingView, "setClipsToBounds:", -[CSCoverSheetView clipsToBounds](self, "clipsToBounds"));
    }
  }
}

- (void)_layoutWallpaperEffectView
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CSWallpaperView *wallpaperEffectView;
  CSWallpaperView *v12;
  double MidX;
  CSWallpaperView *v14;
  CSWallpaperView *v15;
  id v16;
  _BYTE v17[48];
  CGRect v18;
  CGRect v19;

  if (self->_wallpaperEffectView)
  {
    if (-[CSCoverSheetView _maglevActive](self, "_maglevActive"))
    {
      -[CSCoverSheetView bounds](self, "bounds");
      v4 = v3;
      v6 = v5;
      v8 = v7;
      v10 = v9;
      wallpaperEffectView = self->_wallpaperEffectView;
      -[CSCoverSheetView _wallpaperOrientationEnforcingBounds](self, "_wallpaperOrientationEnforcingBounds");
      -[CSWallpaperView setBounds:](wallpaperEffectView, "setBounds:");
      v12 = self->_wallpaperEffectView;
      v18.origin.x = v4;
      v18.origin.y = v6;
      v18.size.width = v8;
      v18.size.height = v10;
      MidX = CGRectGetMidX(v18);
      v19.origin.x = v4;
      v19.origin.y = v6;
      v19.size.width = v8;
      v19.size.height = v10;
      -[CSWallpaperView setCenter:](v12, "setCenter:", MidX, CGRectGetMidY(v19));
      v14 = self->_wallpaperEffectView;
      -[CSCoverSheetView _portraitEnforcingTransform](self, "_portraitEnforcingTransform");
      -[CSWallpaperView setTransform:](v14, "setTransform:", v17);
    }
    else
    {
      v15 = self->_wallpaperEffectView;
      -[CSCoverSheetView scrollView](self, "scrollView");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "size");
      BSRectWithSize();
      -[CSWallpaperView setFrame:](v15, "setFrame:");

    }
  }
}

- (void)_layoutTintingView
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  if (self->_tintingView)
  {
    -[CSCoverSheetView mainPageView](self, "mainPageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[CSCoverSheetView mainPageView](self, "mainPageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSCoverSheetView convertRect:fromView:](self, "convertRect:fromView:", v12, v5, v7, v9, v11);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    -[UIView setFrame:](self->_tintingView, "setFrame:", v14, v16, v18, v20);
  }
}

- (void)_layoutDateView
{
  int64_t dateViewPageAlignment;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  SBFLockScreenDateView *dateView;
  __int128 v13;
  UIVisualEffectView *dateEffectView;
  SBFLockScreenDateView *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  SBFLockScreenDateView *v20;
  double dateViewScale;
  double v22;
  double v23;
  double y;
  double v25;
  BOOL v26;
  double v27;
  uint64_t v28;
  _OWORD v29[3];
  double v30;

  v30 = 0.0;
  dateViewPageAlignment = self->_dateViewPageAlignment;
  -[SBFPagedScrollView unclippedPageRelativeScrollOffset](self->_scrollView, "unclippedPageRelativeScrollOffset");
  -[CSCoverSheetView _dateViewFrameForPageAlignment:pageRelativeScrollOffset:outAlignmentPercent:](self, "_dateViewFrameForPageAlignment:pageRelativeScrollOffset:outAlignmentPercent:", dateViewPageAlignment, &v30);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  dateView = self->_dateView;
  v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v29[0] = *MEMORY[0x1E0C9BAA8];
  v29[1] = v13;
  v29[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[SBFLockScreenDateView setTransform:](dateView, "setTransform:", v29);
  dateEffectView = self->_dateEffectView;
  if (dateEffectView)
  {
    -[UIVisualEffectView setFrame:](dateEffectView, "setFrame:", v5, v7, v9, v11);
    v15 = self->_dateView;
    -[UIVisualEffectView bounds](self->_dateEffectView, "bounds");
    v5 = v16;
    v7 = v17;
    v9 = v18;
    v11 = v19;
  }
  else
  {
    v15 = self->_dateView;
  }
  -[SBFLockScreenDateView setFrame:](v15, "setFrame:", v5, v7, v9, v11);
  v20 = self->_dateView;
  dateViewScale = self->_dateViewScale;
  -[CSCoverSheetView center](self, "center");
  -[CSCoverSheetView _transformScaling:byScale:aboutPointInSelf:](self, "_transformScaling:byScale:aboutPointInSelf:", v20, dateViewScale, v22, v23);
  -[SBFLockScreenDateView setTransform:](v20, "setTransform:", &v28);
  if (self->_dateViewStretch)
  {
    y = self->_dateViewOffset.y;
    v25 = y * -0.125;
    v26 = y <= 0.0;
    v27 = 0.0;
    if (v26)
      v27 = v25;
    -[SBFLockScreenDateView setDateToTimeStretch:](self->_dateView, "setDateToTimeStretch:", v27);
  }
  -[SBFLockScreenDateView setAlignmentPercent:](self->_dateView, "setAlignmentPercent:", v30);
  -[SBFLockScreenDateView layoutIfNeeded](self->_dateView, "layoutIfNeeded");
}

- (CGAffineTransform)_transformScaling:(SEL)a3 byScale:(id)a4 aboutPointInSelf:(double)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v7 = a4;
  objc_msgSend(v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "center");
  v10 = v9;
  v12 = v11;

  objc_msgSend(v8, "convertPoint:toView:", self, v10, v12);
  return (CGAffineTransform *)SBFTransformForScalingAboutPointInSuperview();
}

- (CGRect)_dateViewFrameForPageAlignment:(int64_t)a3 pageRelativeScrollOffset:(double)a4 outAlignmentPercent:(double *)a5
{
  double y;
  double v10;
  unint64_t v11;
  int64_t dateViewPageAlignment;
  id WeakRetained;
  void *v14;
  uint64_t v15;
  double v16;
  void *v17;
  uint64_t v18;
  char v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
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
  CGRect v46;
  CGRect result;

  y = self->_dateViewOffset.y;
  v10 = -y;
  if (self->_dateViewStretch && BSFloatLessThanFloat())
    v10 = y * -0.4;
  v11 = -[CSCoverSheetView _indexOfMainPage](self, "_indexOfMainPage");
  dateViewPageAlignment = self->_dateViewPageAlignment;
  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutStrategy);
  v14 = WeakRetained;
  v15 = 0;
  if (!self->_forceDateViewCentered)
  {
    if (dateViewPageAlignment == 0x7FFFFFFFFFFFFFFFLL)
      v16 = a4 - (double)v11;
    else
      v16 = (double)a3;
    objc_msgSend(WeakRetained, "persistentLayout");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeLabelOffsetForScrollPercent:", v16);
    v15 = v18;

  }
  v19 = _os_feature_enabled_impl();
  -[CSCoverSheetView bounds](self, "bounds");
  v24 = v20;
  v25 = v21;
  v26 = v22;
  v27 = v23;
  if ((v19 & 1) == 0)
  {
    objc_msgSend(v14, "suggestedFrameForDateTimeViewInScreenCoordinates:forceCenteredX:", self->_forceDateViewCentered, v20, v21, v22, v23);
    v24 = v28;
    v25 = v29;
    v26 = v30;
    v27 = v31;
  }
  -[UIView origin](self->_dateTimeClippingView, "origin");
  v33 = v10 - v32;
  v46.origin.x = v24;
  v46.origin.y = v25;
  v46.size.width = v26;
  v46.size.height = v27;
  CGRectOffset(v46, 0.0, v33);
  if (a5)
    *(_QWORD *)a5 = v15;
  SBFMainScreenScale();
  BSRectRoundForScale();
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;

  v42 = v35;
  v43 = v37;
  v44 = v39;
  v45 = v41;
  result.size.height = v45;
  result.size.width = v44;
  result.origin.y = v43;
  result.origin.x = v42;
  return result;
}

- (void)_layoutSidebarComplicationContainerView
{
  UIView *sidebarComplicationContainerView;
  objc_class *v4;
  UIView *v5;
  id v6;

  sidebarComplicationContainerView = self->_sidebarComplicationContainerView;
  if (sidebarComplicationContainerView)
  {
    v4 = (objc_class *)MEMORY[0x1E0D1BCB0];
    v5 = sidebarComplicationContainerView;
    v6 = (id)objc_msgSend([v4 alloc], "initWithTraitEnvironment:", self);
    -[CSCoverSheetView bounds](self, "bounds");
    objc_msgSend(v6, "frameForElements:withBoundingRect:", 16);
    -[UIView setFrame:](v5, "setFrame:");

  }
}

- (void)_layoutFakeStatusBar
{
  UIView *v3;
  UIView *v4;
  double v5;
  double v6;
  CSPropertyAnimatingTouchPassThroughView *fakeStatusBarWrapperView;
  CSPropertyAnimatingTouchPassThroughView *v8;
  CSPropertyAnimatingTouchPassThroughView *v9;
  CSCoverSheetView *v10;
  CSPropertyAnimatingTouchPassThroughView *v11;
  double fakeStatusBarScale;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGRect v19;

  v3 = self->_fakeStatusBar;
  v4 = v3;
  if (v3)
  {
    v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v18.a = *MEMORY[0x1E0C9BAA8];
    v15 = *(_OWORD *)&v18.a;
    *(_OWORD *)&v18.c = v14;
    *(_OWORD *)&v18.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v13 = *(_OWORD *)&v18.tx;
    -[UIView setTransform:](v3, "setTransform:", &v18);
    -[CSCoverSheetView bounds](self, "bounds");
    v6 = v5;
    -[UIView frame](v4, "frame");
    -[UIView setFrame:](v4, "setFrame:", 0.0, 0.0, v6, CGRectGetHeight(v19));
    fakeStatusBarWrapperView = self->_fakeStatusBarWrapperView;
    *(_OWORD *)&v18.a = v15;
    *(_OWORD *)&v18.c = v14;
    *(_OWORD *)&v18.tx = v13;
    -[CSPropertyAnimatingTouchPassThroughView setTransform:](fakeStatusBarWrapperView, "setTransform:", &v18);
    v8 = self->_fakeStatusBarWrapperView;
    -[CSCoverSheetView bounds](self, "bounds");
    -[CSPropertyAnimatingTouchPassThroughView setBounds:](v8, "setBounds:");
    v9 = self->_fakeStatusBarWrapperView;
    -[CSCoverSheetView bounds](self, "bounds");
    BSRectGetCenter();
    -[CSPropertyAnimatingTouchPassThroughView setCenter:](v9, "setCenter:");
    -[CSPropertyAnimatingTouchPassThroughView superview](self->_fakeStatusBarWrapperView, "superview");
    v10 = (CSCoverSheetView *)objc_claimAutoreleasedReturnValue();

    if (v10 == self)
    {
      memset(&v18, 0, sizeof(v18));
      if ((BSPointEqualToPoint() & 1) != 0)
      {
        *(_OWORD *)&v18.a = v15;
        *(_OWORD *)&v18.c = v14;
        *(_OWORD *)&v18.tx = v13;
      }
      else
      {
        CGAffineTransformMakeTranslation(&v18, self->_foregroundViewPositionOffset.x, self->_foregroundViewPositionOffset.y);
      }
      v11 = self->_fakeStatusBarWrapperView;
      fakeStatusBarScale = self->_fakeStatusBarScale;
      v16 = v18;
      CGAffineTransformScale(&v17, &v16, fakeStatusBarScale, fakeStatusBarScale);
      -[CSPropertyAnimatingTouchPassThroughView setTransform:](v11, "setTransform:", &v17);
    }
    -[UIView layoutIfNeeded](v4, "layoutIfNeeded");
  }

}

- (void)_layoutStatusBarBackgroundView
{
  double v3;
  double v4;
  unint64_t v5;
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
  CGRect v22;

  -[SBFPagedScrollView unclippedPageRelativeScrollOffset](self->_scrollView, "unclippedPageRelativeScrollOffset");
  v4 = v3;
  v5 = -[CSCoverSheetView _indexOfMainPage](self, "_indexOfMainPage");
  v6 = 0.0;
  if (self->_statusBarBackgroundPageAlignment != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = (double)v5;
    -[CSCoverSheetView bounds](self, "bounds");
    v6 = CGRectGetWidth(v22) * (v7 - v4 + (double)self->_statusBarBackgroundPageAlignment);
  }
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    v8 = -v6;
  else
    v8 = v6;
  -[CSCoverSheetView bounds](self, "bounds");
  v10 = v9;
  -[UIView intrinsicContentSize](self->_statusBarBackgroundView, "intrinsicContentSize");
  v12 = v11;
  -[UIView superview](self->_statusBarBackgroundView, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetView convertRect:toView:](self, "convertRect:toView:", v13, v8, 0.0, v10, v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  -[UIView setFrame:](self->_statusBarBackgroundView, "setFrame:", v15, v17, v19, v21);
}

- (void)_layoutAuthIndicator
{
  CGRect v3;

  -[CSCoverSheetView frame](self, "frame");
  -[UIView setFrame:](self->_authIndicator, "setFrame:", 0.0, 0.0, CGRectGetWidth(v3), 2.0);
}

- (void)_layoutBottomPage
{
  double Height;
  double Width;
  id v5;
  CGRect v6;
  CGRect v7;
  CGRect v8;

  -[CSCoverSheetView bottomPage](self, "bottomPage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CSCoverSheetView frame](self, "frame");
    Height = CGRectGetHeight(v6);
    -[CSCoverSheetView frame](self, "frame");
    Width = CGRectGetWidth(v7);
    -[CSCoverSheetView frame](self, "frame");
    objc_msgSend(v5, "setFrame:", 0.0, Height, Width, CGRectGetHeight(v8));
  }

}

- (void)_layoutContentView
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  UIView *contentView;
  double MidX;
  int v13;
  double contentViewScale;
  BOOL v15;
  UIView *v16;
  CGAffineTransform *v17;
  UIView *v18;
  __int128 v19;
  CGAffineTransform v20;
  CGAffineTransform t1;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGRect v25;
  CGRect v26;

  -[CSCoverSheetView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setBounds:](self->_contentView, "setBounds:");
  contentView = self->_contentView;
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  MidX = CGRectGetMidX(v25);
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  -[UIView setCenter:](contentView, "setCenter:", MidX, CGRectGetMidY(v26));
  v13 = BSPointEqualToPoint();
  contentViewScale = self->_contentViewScale;
  if (v13)
    v15 = contentViewScale == 1.0;
  else
    v15 = 0;
  if (v15)
  {
    v18 = self->_contentView;
    v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v24.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v24.c = v19;
    *(_OWORD *)&v24.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v17 = &v24;
  }
  else
  {
    memset(&v24, 0, sizeof(v24));
    CGAffineTransformMakeTranslation(&v24, self->_contentViewOffset.x, self->_contentViewOffset.y);
    memset(&v23, 0, sizeof(v23));
    CGAffineTransformMakeScale(&v23, contentViewScale, contentViewScale);
    v16 = self->_contentView;
    t1 = v23;
    v20 = v24;
    CGAffineTransformConcat(&v22, &t1, &v20);
    v17 = &v22;
    v18 = v16;
  }
  -[UIView setTransform:](v18, "setTransform:", v17);
}

- (void)_layoutProudLockView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double Width;
  CGFloat v14;
  double MidX;
  double proudLockIconViewScale;
  double v17;
  double v18;
  CSPropertyAnimatingTouchPassThroughView *v19;
  CGAffineTransform *v20;
  CSPropertyAnimatingTouchPassThroughView *proudLockContainerWrapperView;
  __int128 v22;
  int *v23;
  CGAffineTransform v24;
  CGAffineTransform t1;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  if (!-[UIView isHidden](self->_proudLockContainerView, "isHidden"))
  {
    -[CSCoverSheetView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    objc_msgSend(MEMORY[0x1E0DA9E68], "proudLockCenterFromTopOfScreen");
    v12 = v11;
    v29.origin.x = v4;
    v29.origin.y = v6;
    v29.size.width = v8;
    v29.size.height = v10;
    Width = CGRectGetWidth(v29);
    v30.origin.x = v4;
    v30.origin.y = v6;
    v30.size.width = v8;
    v30.size.height = v10;
    v14 = CGRectGetMidX(v30) + Width * -0.5;
    -[CSPropertyAnimatingTouchPassThroughView setBounds:](self->_proudLockContainerWrapperView, "setBounds:", v14, 0.0, Width, v12 + v12);
    v31.origin.x = v4;
    v31.origin.y = v6;
    v31.size.width = v8;
    v31.size.height = v10;
    -[CSPropertyAnimatingTouchPassThroughView setCenter:](self->_proudLockContainerWrapperView, "setCenter:", CGRectGetMidX(v31), v12);
    -[UIView setFrame:](self->_proudLockContainerView, "setFrame:", v14, 0.0, Width, v12 + v12);
    -[UIView setFrame:](self->_cameraCoveredView, "setFrame:", v4, v6, v8, v10);
    if (BSPointEqualToPoint() && self->_proudLockIconViewScale == 1.0)
    {
      proudLockContainerWrapperView = self->_proudLockContainerWrapperView;
      v22 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v28.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v28.c = v22;
      *(_OWORD *)&v28.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v20 = &v28;
    }
    else
    {
      memset(&v28, 0, sizeof(v28));
      CGAffineTransformMakeTranslation(&v28, self->_proudLockIconViewOffset.x, self->_proudLockIconViewOffset.y);
      v32.origin.x = v4;
      v32.origin.y = v6;
      v32.size.width = v8;
      v32.size.height = v10;
      MidX = CGRectGetMidX(v32);
      proudLockIconViewScale = self->_proudLockIconViewScale;
      objc_msgSend(MEMORY[0x1E0DA9E68], "proudLockScaleFactor");
      v18 = proudLockIconViewScale / v17;
      if (v18 > 1.0)
        v18 = 1.0;
      memset(&v27, 0, sizeof(v27));
      -[CSCoverSheetView _transformScaling:byScale:aboutPointInSelf:](self, "_transformScaling:byScale:aboutPointInSelf:", self->_proudLockContainerWrapperView, v18, MidX, v12);
      v19 = self->_proudLockContainerWrapperView;
      t1 = v28;
      v24 = v27;
      CGAffineTransformConcat(&v26, &t1, &v24);
      v20 = &v26;
      proudLockContainerWrapperView = v19;
    }
    -[CSPropertyAnimatingTouchPassThroughView setTransform:](proudLockContainerWrapperView, "setTransform:", v20);
    if (self->_proudLockPrefersLowerPresentationLevel)
      v23 = &OBJC_IVAR___CSCoverSheetView__slideableContentView;
    else
      v23 = &OBJC_IVAR___CSCoverSheetView__higherSlideableContentView;
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v23), "addSubview:", self->_proudLockContainerWrapperView);
  }
}

- (void)_layoutHigherSlideableContentView
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  -[UIView frame](self->_slideableContentView, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView superview](self->_higherSlideableContentView, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetView convertRect:toView:](self, "convertRect:toView:", v11, v4, v6, v8, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  -[UIView setFrame:](self->_higherSlideableContentView, "setFrame:", v13, v15, v17, v19);
}

- (void)_layoutTeachableMomentsContainerView
{
  void *v3;
  void *v4;
  CGAffineTransform v5;
  CGAffineTransform v6;

  -[CSCoverSheetView teachableMomentsContainerView](self, "teachableMomentsContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CSCoverSheetView bounds](self, "bounds");
    objc_msgSend(v3, "setBounds:");
    BSRectGetCenter();
    objc_msgSend(v3, "setCenter:");
    memset(&v6, 0, sizeof(v6));
    CGAffineTransformMakeScale(&v6, self->_controlCenterGrabberScale, self->_controlCenterGrabberScale);
    objc_msgSend(v3, "controlCenterGrabberContainerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6;
    objc_msgSend(v4, "setTransform:", &v5);

  }
}

- (void)_layoutQuickActionsView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double Width;
  double v13;
  CSQuickActionsView *v14;
  __int128 v15;
  CSQuickActionsView *v16;
  CSQuickActionsView *quickActionsView;
  __int128 v18;
  CGAffineTransform v19;
  CGAffineTransform t1;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGRect v24;

  -[CSCoverSheetView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = (double)-[CSCoverSheetView _indexOfMainPage](self, "_indexOfMainPage");
  -[SBFPagedScrollView unclippedPageRelativeScrollOffset](self->_scrollView, "unclippedPageRelativeScrollOffset");
  v11 = v9 - v10;
  -[CSCoverSheetView bounds](self, "bounds");
  Width = CGRectGetWidth(v24);
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    v13 = -(v11 * Width);
  else
    v13 = v11 * Width;
  if (BSPointEqualToPoint() && self->_quickActionsViewScale == 1.0)
  {
    quickActionsView = self->_quickActionsView;
    v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v23.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v23.c = v18;
    *(_OWORD *)&v23.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[CSQuickActionsView setTransform:](quickActionsView, "setTransform:", &v23);
    -[CSQuickActionsView setFrame:](self->_quickActionsView, "setFrame:", v13, v4, v6, v8);
  }
  else
  {
    v14 = self->_quickActionsView;
    v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v23.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v23.c = v15;
    *(_OWORD *)&v23.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[CSQuickActionsView setTransform:](v14, "setTransform:", &v23);
    -[CSQuickActionsView setFrame:](self->_quickActionsView, "setFrame:", v13, v4, v6, v8);
    memset(&v23, 0, sizeof(v23));
    CGAffineTransformMakeTranslation(&v23, self->_quickActionsViewOffset.x, self->_quickActionsViewOffset.y);
    memset(&v22, 0, sizeof(v22));
    CGAffineTransformMakeScale(&v22, self->_quickActionsViewScale, self->_quickActionsViewScale);
    v16 = self->_quickActionsView;
    t1 = v22;
    v19 = v23;
    CGAffineTransformConcat(&v21, &t1, &v19);
    -[CSQuickActionsView setTransform:](v16, "setTransform:", &v21);
  }
}

- (void)_layoutStatusBarLegibilityView
{
  -[CSCoverSheetView bounds](self, "bounds");
  -[SBFStatusBarLegibilityView setFrame:](self->_statusBarLegibilityView, "setFrame:");
}

- (BOOL)_maglevActive
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return _os_feature_enabled_impl();
  else
    return 0;
}

- (CGRect)_wallpaperOrientationEnforcingBounds
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double Height;
  double Width;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  -[CSCoverSheetView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[CSCoverSheetView _forcingPortraitForWallpaperContent](self, "_forcingPortraitForWallpaperContent"))
  {
    v17.origin.x = v4;
    v17.origin.y = v6;
    v17.size.width = v8;
    v17.size.height = v10;
    Height = CGRectGetHeight(v17);
    v18.origin.x = v4;
    v18.origin.y = v6;
    v18.size.width = v8;
    v18.size.height = v10;
    Width = CGRectGetWidth(v18);
    if (Height < Width)
    {
      v6 = 0.0;
      v10 = Width;
      v8 = Height;
      v4 = 0.0;
    }
  }
  v13 = v4;
  v14 = v6;
  v15 = v8;
  v16 = v10;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGAffineTransform)_portraitEnforcingTransform
{
  CGAffineTransform *result;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  CGAffineTransform v20;
  CGAffineTransform t1;
  CGAffineTransform v22;
  CGAffineTransform v23;

  result = (CGAffineTransform *)-[CSCoverSheetView _forcingPortraitForWallpaperContent](self, "_forcingPortraitForWallpaperContent");
  if ((_DWORD)result)
  {
    -[CSCoverSheetView window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "interfaceOrientation");

    switch(v7)
    {
      case 1:
        v8 = 0.0;
        break;
      case 3:
        v8 = 1.57079633;
        break;
      case 4:
        v8 = -1.57079633;
        break;
      default:
        v8 = 3.14159265;
        if (v7 != 2)
          v8 = 0.0;
        break;
    }
    memset(&v23, 0, sizeof(v23));
    CGAffineTransformMakeRotation(&v23, -v8);
    t1 = v23;
    memset(&v22, 0, sizeof(v22));
    UIIntegralTransform();
    -[CSCoverSheetView window](self, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isRotating");

    if (v13)
    {
      -[CSCoverSheetView window](self, "window");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "_fromWindowOrientation");

      -[CSCoverSheetView window](self, "window");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "_toWindowOrientation");

      if ((unint64_t)(v15 - 3) < 2)
      {
        v18 = -3;
LABEL_16:
        if (v15 != v17 && (unint64_t)(v17 + v18) <= 1)
        {
          v20.tx = 0.0;
          v20.ty = 0.0;
          t1 = v22;
          *(_OWORD *)&v20.a = xmmword_1D048FBF0;
          *(_OWORD *)&v20.c = xmmword_1D048FC00;
          return CGAffineTransformConcat(retstr, &t1, &v20);
        }
        goto LABEL_19;
      }
      if ((unint64_t)(v15 - 1) <= 1)
      {
        v18 = -1;
        goto LABEL_16;
      }
    }
LABEL_19:
    v19 = *(_OWORD *)&v22.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v22.a;
    *(_OWORD *)&retstr->c = v19;
    v11 = *(_OWORD *)&v22.tx;
    goto LABEL_20;
  }
  v9 = MEMORY[0x1E0C9BAA8];
  v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v10;
  v11 = *(_OWORD *)(v9 + 32);
LABEL_20:
  *(_OWORD *)&retstr->tx = v11;
  return result;
}

- (void)_layoutWallpaperFloatingLayerContainerView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIView *wallpaperFloatingLayerContainerView;
  double MidX;
  __int128 v13;
  int v14;
  double wallpaperFloatingLayerContainerViewScale;
  BOOL v16;
  UIView *v17;
  CGAffineTransform *v18;
  UIView *v19;
  UIView *v20;
  double v21;
  int v22;
  double v23;
  BOOL v24;
  UIView *v25;
  __int128 v26;
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  -[CSCoverSheetView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[CSCoverSheetView _maglevActive](self, "_maglevActive"))
  {
    -[CSCoverSheetView _wallpaperOrientationEnforcingBounds](self, "_wallpaperOrientationEnforcingBounds");
    -[UIView setBounds:](self->_wallpaperFloatingLayerContainerView, "setBounds:");
    wallpaperFloatingLayerContainerView = self->_wallpaperFloatingLayerContainerView;
    v35.origin.x = v4;
    v35.origin.y = v6;
    v35.size.width = v8;
    v35.size.height = v10;
    MidX = CGRectGetMidX(v35);
    v36.origin.x = v4;
    v36.origin.y = v6;
    v36.size.width = v8;
    v36.size.height = v10;
    -[UIView setCenter:](wallpaperFloatingLayerContainerView, "setCenter:", MidX, CGRectGetMidY(v36));
    v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v34.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v34.c = v13;
    *(_OWORD *)&v34.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v14 = BSPointEqualToPoint();
    wallpaperFloatingLayerContainerViewScale = self->_wallpaperFloatingLayerContainerViewScale;
    if (v14)
      v16 = wallpaperFloatingLayerContainerViewScale == 1.0;
    else
      v16 = 0;
    if (!v16)
    {
      memset(&v33, 0, sizeof(v33));
      CGAffineTransformMakeTranslation(&v33, self->_wallpaperFloatingLayerContainerViewOffset.x, self->_wallpaperFloatingLayerContainerViewOffset.y);
      memset(&v32, 0, sizeof(v32));
      CGAffineTransformMakeScale(&v32, wallpaperFloatingLayerContainerViewScale, wallpaperFloatingLayerContainerViewScale);
      t1 = v32;
      t2 = v33;
      CGAffineTransformConcat(&v34, &t1, &t2);
    }
    v17 = self->_wallpaperFloatingLayerContainerView;
    -[CSCoverSheetView _portraitEnforcingTransform](self, "_portraitEnforcingTransform");
    v33 = v34;
    CGAffineTransformConcat(&v29, &v33, &v28);
    v18 = &v29;
    v19 = v17;
  }
  else
  {
    -[UIView setBounds:](self->_wallpaperFloatingLayerContainerView, "setBounds:", v4, v6, v8, v10);
    v20 = self->_wallpaperFloatingLayerContainerView;
    v37.origin.x = v4;
    v37.origin.y = v6;
    v37.size.width = v8;
    v37.size.height = v10;
    v21 = CGRectGetMidX(v37);
    v38.origin.x = v4;
    v38.origin.y = v6;
    v38.size.width = v8;
    v38.size.height = v10;
    -[UIView setCenter:](v20, "setCenter:", v21, CGRectGetMidY(v38));
    v22 = BSPointEqualToPoint();
    v23 = self->_wallpaperFloatingLayerContainerViewScale;
    if (v22)
      v24 = v23 == 1.0;
    else
      v24 = 0;
    if (v24)
    {
      v19 = self->_wallpaperFloatingLayerContainerView;
      v26 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v34.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v34.c = v26;
      *(_OWORD *)&v34.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v18 = &v34;
    }
    else
    {
      memset(&v34, 0, sizeof(v34));
      CGAffineTransformMakeTranslation(&v34, self->_wallpaperFloatingLayerContainerViewOffset.x, self->_wallpaperFloatingLayerContainerViewOffset.y);
      memset(&v33, 0, sizeof(v33));
      CGAffineTransformMakeScale(&v33, v23, v23);
      v25 = self->_wallpaperFloatingLayerContainerView;
      v32 = v33;
      t1 = v34;
      CGAffineTransformConcat(&v27, &v32, &t1);
      v18 = &v27;
      v19 = v25;
    }
  }
  -[UIView setTransform:](v19, "setTransform:", v18);
}

- (void)_layoutBackgroundContentView
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CSBackgroundContentView *backgroundContentView;
  double MidX;
  int v13;
  double backgroundContentViewScale;
  BOOL v15;
  CSBackgroundContentView *v16;
  CGAffineTransform *v17;
  CSBackgroundContentView *v18;
  __int128 v19;
  CGAffineTransform v20;
  CGAffineTransform t1;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGRect v25;
  CGRect v26;

  -[CSCoverSheetView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CSBackgroundContentView setBounds:](self->_backgroundContentView, "setBounds:");
  backgroundContentView = self->_backgroundContentView;
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  MidX = CGRectGetMidX(v25);
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  -[CSBackgroundContentView setCenter:](backgroundContentView, "setCenter:", MidX, CGRectGetMidY(v26));
  v13 = BSPointEqualToPoint();
  backgroundContentViewScale = self->_backgroundContentViewScale;
  if (v13)
    v15 = backgroundContentViewScale == 1.0;
  else
    v15 = 0;
  if (v15)
  {
    v18 = self->_backgroundContentView;
    v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v24.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v24.c = v19;
    *(_OWORD *)&v24.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v17 = &v24;
  }
  else
  {
    memset(&v24, 0, sizeof(v24));
    CGAffineTransformMakeTranslation(&v24, self->_backgroundContentViewOffset.x, self->_backgroundContentViewOffset.y);
    memset(&v23, 0, sizeof(v23));
    CGAffineTransformMakeScale(&v23, backgroundContentViewScale, backgroundContentViewScale);
    v16 = self->_backgroundContentView;
    t1 = v23;
    v20 = v24;
    CGAffineTransformConcat(&v22, &t1, &v20);
    v17 = &v22;
    v18 = v16;
  }
  -[CSBackgroundContentView setTransform:](v18, "setTransform:", v17);
}

- (void)_orderSubviews
{
  CSCoverSheetView *v3;
  UIView *wallpaperFloatingLayerContainerView;
  BOOL v5;
  void *v6;
  CSCoverSheetView *v7;
  CSBackgroundContentView *backgroundContentView;
  CSCoverSheetView *v9;
  CSWallpaperView *wallpaperEffectView;
  void *v11;
  CSCoverSheetView *v12;
  UIView *statusBarBackgroundView;
  CSCoverSheetView *v14;
  UIView *higherSlideableContentView;
  uint64_t v16;
  CSCoverSheetView *v17;
  CSPropertyAnimatingTouchPassThroughView *fakeStatusBarWrapperView;
  id v19;

  if (self->_fixedFooterView)
    -[UIView bringSubviewToFront:](self->_slideableContentView, "bringSubviewToFront:");
  if (!self->_dateTimePresentationLevel)
    -[UIView sendSubviewToBack:](self->_slideableContentView, "sendSubviewToBack:", self->_dateTimeClippingView);
  if (!self->_backgroundContentPresentationLevel)
    -[UIView insertSubview:atIndex:](self->_slideableContentView, "insertSubview:atIndex:", self->_backgroundContentView, 0);
  if (!self->_wallpaperPresentationLevel)
    -[UIView insertSubview:atIndex:](self->_slideableContentView, "insertSubview:atIndex:", self->_wallpaperEffectView, 0);
  if (!self->_wallpaperFloatingLayerPresentationLevel)
    -[UIView insertSubview:aboveSubview:](self->_slideableContentView, "insertSubview:aboveSubview:", self->_wallpaperFloatingLayerContainerView, self->_dateTimeClippingView);
  -[CSCoverSheetView sendSubviewToBack:](self, "sendSubviewToBack:", self->_statusBarLegibilityView);
  if (self->_modalPresentationLevel == 1)
    -[CSCoverSheetView sendSubviewToBack:](self, "sendSubviewToBack:", self->_modalPresentationView);
  if (self->_wallpaperFloatingLayerPresentationLevel == 1)
  {
    -[UIView superview](self->_wallpaperFloatingLayerContainerView, "superview");
    v3 = (CSCoverSheetView *)objc_claimAutoreleasedReturnValue();

    wallpaperFloatingLayerContainerView = self->_wallpaperFloatingLayerContainerView;
    v5 = v3 != self;
    if (v3 == self)
    {
      -[CSCoverSheetView sendSubviewToBack:](self, "sendSubviewToBack:", wallpaperFloatingLayerContainerView);
      -[UIView superview](self->_dateTimeClippingView, "superview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSCoverSheetView sendSubviewToBack:](self, "sendSubviewToBack:", v6);
    }
    else
    {
      -[UIView superview](self->_dateTimeClippingView, "superview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSCoverSheetView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", wallpaperFloatingLayerContainerView, v6);
    }

  }
  else
  {
    v5 = 0;
  }
  if (self->_backgroundContentPresentationLevel == 1)
  {
    -[CSBackgroundContentView superview](self->_backgroundContentView, "superview");
    v7 = (CSCoverSheetView *)objc_claimAutoreleasedReturnValue();

    backgroundContentView = self->_backgroundContentView;
    if (v7 == self)
    {
      -[CSCoverSheetView sendSubviewToBack:](self, "sendSubviewToBack:", backgroundContentView);
    }
    else
    {
      -[CSCoverSheetView insertSubview:atIndex:](self, "insertSubview:atIndex:", backgroundContentView, 0);
      v5 = 1;
    }
  }
  if (self->_wallpaperPresentationLevel == 1)
  {
    -[CSWallpaperView superview](self->_wallpaperEffectView, "superview");
    v9 = (CSCoverSheetView *)objc_claimAutoreleasedReturnValue();

    wallpaperEffectView = self->_wallpaperEffectView;
    if (v9 != self)
    {
      -[CSCoverSheetView insertSubview:atIndex:](self, "insertSubview:atIndex:", wallpaperEffectView, 0);
      -[CSCoverSheetView sendSubviewToBack:](self, "sendSubviewToBack:", self->_backgroundContainerView);
      return;
    }
    -[CSCoverSheetView sendSubviewToBack:](self, "sendSubviewToBack:", wallpaperEffectView);
  }
  -[CSCoverSheetView sendSubviewToBack:](self, "sendSubviewToBack:", self->_backgroundContainerView);
  if (!v5)
  {
    -[CSCoverSheetView bringSubviewToFront:](self, "bringSubviewToFront:", self->_quickActionsView);
    -[CSCoverSheetView bringSubviewToFront:](self, "bringSubviewToFront:", self->_tintingView);
    if (!self->_modalPresentationLevel)
      -[CSCoverSheetView bringSubviewToFront:](self, "bringSubviewToFront:", self->_modalPresentationView);
    if (self->_fakeStatusBar && self->_fakeStatusBarLevel == 1)
    {
      -[CSCoverSheetView referenceViewForBelowPresentationContext](self, "referenceViewForBelowPresentationContext");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "superview");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "insertSubview:aboveSubview:", self->_higherSlideableContentView, v19);
      objc_msgSend(v11, "insertSubview:belowSubview:", self->_fakeStatusBarWrapperView, self->_higherSlideableContentView);
      objc_msgSend(v11, "insertSubview:belowSubview:", self->_statusBarBackgroundView, self->_fakeStatusBarWrapperView);

LABEL_43:
      return;
    }
    -[UIView superview](self->_statusBarBackgroundView, "superview");
    v12 = (CSCoverSheetView *)objc_claimAutoreleasedReturnValue();

    statusBarBackgroundView = self->_statusBarBackgroundView;
    if (v12 == self)
      -[CSCoverSheetView bringSubviewToFront:](self, "bringSubviewToFront:", statusBarBackgroundView);
    else
      -[CSCoverSheetView addSubview:](self, "addSubview:", statusBarBackgroundView);
    -[UIView superview](self->_higherSlideableContentView, "superview");
    v14 = (CSCoverSheetView *)objc_claimAutoreleasedReturnValue();

    higherSlideableContentView = self->_higherSlideableContentView;
    if (v14 == self)
      -[CSCoverSheetView bringSubviewToFront:](self, "bringSubviewToFront:", higherSlideableContentView);
    else
      -[CSCoverSheetView addSubview:](self, "addSubview:", higherSlideableContentView);
    if (self->_fakeStatusBar && self->_fakeStatusBarLevel == 1)
    {
      -[CSCoverSheetView subviews](self, "subviews");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v19, "indexOfObject:", self->_fakeStatusBarWrapperView);
      if (v16 != objc_msgSend(v19, "indexOfObject:", self->_slideableContentView) - 1)
      {
        -[CSCoverSheetView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_fakeStatusBarWrapperView, self->_slideableContentView);
        -[CSCoverSheetView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_statusBarBackgroundView, self->_fakeStatusBarWrapperView);
      }
      goto LABEL_43;
    }
    -[CSPropertyAnimatingTouchPassThroughView superview](self->_fakeStatusBarWrapperView, "superview");
    v17 = (CSCoverSheetView *)objc_claimAutoreleasedReturnValue();

    fakeStatusBarWrapperView = self->_fakeStatusBarWrapperView;
    if (v17 == self)
      -[CSCoverSheetView bringSubviewToFront:](self, "bringSubviewToFront:", fakeStatusBarWrapperView);
    else
      -[CSCoverSheetView addSubview:](self, "addSubview:", fakeStatusBarWrapperView);
  }
}

- (void)_addBackgroundContainerView
{
  id v3;
  BSUIOrientationTransformWrapperView *v4;
  BSUIOrientationTransformWrapperView *backgroundContainerView;

  v3 = objc_alloc(MEMORY[0x1E0D01940]);
  -[CSCoverSheetView bounds](self, "bounds");
  v4 = (BSUIOrientationTransformWrapperView *)objc_msgSend(v3, "initWithFrame:");
  backgroundContainerView = self->_backgroundContainerView;
  self->_backgroundContainerView = v4;

  -[BSUIOrientationTransformWrapperView setContainerOrientation:](self->_backgroundContainerView, "setContainerOrientation:", 1);
  -[BSUIOrientationTransformWrapperView setContentOrientation:](self->_backgroundContainerView, "setContentOrientation:", 1);
  -[BSUIOrientationTransformWrapperView setCounterTransformView:](self->_backgroundContainerView, "setCounterTransformView:", 1);
  -[CSCoverSheetView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backgroundContainerView, 0);
}

- (void)_addBackgroundView
{
  id v3;
  SBUIBackgroundView *v4;
  SBUIBackgroundView *backgroundView;

  v3 = objc_alloc(MEMORY[0x1E0DAC270]);
  -[CSCoverSheetView bounds](self, "bounds");
  v4 = (SBUIBackgroundView *)objc_msgSend(v3, "initWithFrame:");
  backgroundView = self->_backgroundView;
  self->_backgroundView = v4;

  -[SBUIBackgroundView setGroupName:](self->_backgroundView, "setGroupName:", CFSTR("CSBackgroundView"));
  -[BSUIOrientationTransformWrapperView addContentView:](self->_backgroundContainerView, "addContentView:", self->_backgroundView);
}

- (void)_addSlideableContentView
{
  id v3;
  UIView *v4;
  UIView *slideableContentView;

  v3 = objc_alloc(MEMORY[0x1E0DA9F28]);
  -[CSCoverSheetView bounds](self, "bounds");
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  slideableContentView = self->_slideableContentView;
  self->_slideableContentView = v4;

  -[UIView setAutoresizingMask:](self->_slideableContentView, "setAutoresizingMask:", 18);
  -[CSCoverSheetView addSubview:](self, "addSubview:", self->_slideableContentView);
}

- (void)_addHigherSlideableContentView
{
  id v3;
  UIView *v4;
  UIView *higherSlideableContentView;

  v3 = objc_alloc(MEMORY[0x1E0DA9F28]);
  -[CSCoverSheetView bounds](self, "bounds");
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  higherSlideableContentView = self->_higherSlideableContentView;
  self->_higherSlideableContentView = v4;

  -[UIView setAutoresizingMask:](self->_higherSlideableContentView, "setAutoresizingMask:", 18);
  -[CSCoverSheetView addSubview:](self, "addSubview:", self->_higherSlideableContentView);
}

- (void)_addContentView
{
  -[CSCoverSheetView _addContentViewWithContentView:](self, "_addContentViewWithContentView:", self->_scrollView);
}

- (void)_addContentViewWithContentView:(id)a3
{
  id v4;
  UIView *contentView;
  id v6;
  UIView *v7;
  UIView *v8;
  id v9;

  v4 = a3;
  if (!self->_hasSubviewModifyingView)
  {
    v9 = v4;
    self->_hasSubviewModifyingView = 1;
    contentView = self->_contentView;
    if (!contentView)
    {
      v6 = objc_alloc(MEMORY[0x1E0DA9F28]);
      -[CSCoverSheetView bounds](self, "bounds");
      v7 = (UIView *)objc_msgSend(v6, "initWithFrame:");
      v8 = self->_contentView;
      self->_contentView = v7;

      -[UIView setAutoresizingMask:](self->_contentView, "setAutoresizingMask:", 18);
      contentView = self->_contentView;
    }
    -[CSCoverSheetView addSubview:](self, "addSubview:", contentView);
    -[UIView addSubview:](self->_contentView, "addSubview:", v9);
    v4 = v9;
  }

}

- (void)_removeContentView
{
  UIView *contentView;

  -[UIView removeFromSuperview](self->_contentView, "removeFromSuperview");
  -[UIView addSubview:](self->_slideableContentView, "addSubview:", self->_scrollView);
  contentView = self->_contentView;
  self->_contentView = 0;

  self->_hasSubviewModifyingView = 0;
}

- (void)_addScrollView
{
  CSScrollView *v3;
  void *v4;
  CSScrollView *v5;

  v3 = [CSScrollView alloc];
  -[CSCoverSheetView bounds](self, "bounds");
  v5 = -[SBFPagedScrollView initWithFrame:](v3, "initWithFrame:");
  -[BSUIScrollView setDelegate:](v5, "setDelegate:", self);
  -[CSScrollView panGestureRecognizer](v5, "panGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", CFSTR("CoverSheetPagedPanGestureRecognizer"));

  -[CSScrollView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
  -[CSScrollView setContentInsetAdjustmentBehavior:](v5, "setContentInsetAdjustmentBehavior:", 2);
  -[CSScrollView setAllowsKeyboardScrolling:](v5, "setAllowsKeyboardScrolling:", 0);
  -[UIView addSubview:](self->_slideableContentView, "addSubview:", v5);
  -[CSCoverSheetView setScrollView:](self, "setScrollView:", v5);

}

- (void)_addDateTimeContainer
{
  id v3;
  UIView *v4;
  UIView *dateTimeClippingView;

  v3 = objc_alloc(MEMORY[0x1E0CEABB0]);
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  dateTimeClippingView = self->_dateTimeClippingView;
  self->_dateTimeClippingView = v4;

  -[UIView setUserInteractionEnabled:](self->_dateTimeClippingView, "setUserInteractionEnabled:", 0);
  -[UIView addSubview:](self->_slideableContentView, "addSubview:", self->_dateTimeClippingView);
}

- (void)_addWallpaperFloatingLayerContainerView
{
  id v3;
  UIView *v4;
  UIView *wallpaperFloatingLayerContainerView;

  v3 = objc_alloc(MEMORY[0x1E0DA9F28]);
  -[CSCoverSheetView bounds](self, "bounds");
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  wallpaperFloatingLayerContainerView = self->_wallpaperFloatingLayerContainerView;
  self->_wallpaperFloatingLayerContainerView = v4;

  -[UIView setAccessibilityIgnoresInvertColors:](self->_wallpaperFloatingLayerContainerView, "setAccessibilityIgnoresInvertColors:", 1);
  -[UIView addSubview:](self->_slideableContentView, "addSubview:", self->_wallpaperFloatingLayerContainerView);
}

- (void)_addAuthIndicator
{
  void *v3;
  int v4;
  UIView *v5;
  UIView *authIndicator;

  -[CSCoverSheetView _lockScreenDefaults](self, "_lockScreenDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showAuthenticationEngineeringUI");

  if (v4)
  {
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    authIndicator = self->_authIndicator;
    self->_authIndicator = v5;

    -[UIView setUserInteractionEnabled:](self->_authIndicator, "setUserInteractionEnabled:", 0);
    -[UIView addSubview:](self->_slideableContentView, "addSubview:", self->_authIndicator);
    -[CSCoverSheetView setNeedsLayout](self, "setNeedsLayout");
    -[CSCoverSheetView updateUIForAuthenticated:](self, "updateUIForAuthenticated:", 0);
  }
}

- (void)_addTintingView
{
  UIView *v3;
  UIView *tintingView;
  UIView *v5;
  void *v6;

  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DA9F28]);
  tintingView = self->_tintingView;
  self->_tintingView = v3;

  v5 = self->_tintingView;
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

  -[UIView setHidden:](self->_tintingView, "setHidden:", 1);
  -[CSCoverSheetView addSubview:](self, "addSubview:", self->_tintingView);
}

- (void)_addStatusBarLegibilityView
{
  SBFStatusBarLegibilityView *v3;
  SBFStatusBarLegibilityView *statusBarLegibilityView;

  v3 = (SBFStatusBarLegibilityView *)objc_alloc_init(MEMORY[0x1E0DA9EF8]);
  statusBarLegibilityView = self->_statusBarLegibilityView;
  self->_statusBarLegibilityView = v3;

  -[CSCoverSheetView addSubview:](self, "addSubview:", self->_statusBarLegibilityView);
}

- ($C89AE587F4FC9517FD26718A5F681357)_currentTransitionContext
{
  __int128 v5;
  SBFPagedScrollView *scrollView;
  SBFPagedScrollView *v7;
  uint64_t v8;
  SBFPagedScrollView *v9;
  $C89AE587F4FC9517FD26718A5F681357 *result;
  _OWORD v11[2];
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;

  v5 = 0uLL;
  v15 = 0u;
  v16 = 0u;
  scrollView = self->_scrollView;
  if (scrollView
    && (-[SBFPagedScrollView currentScrollInterval](scrollView, "currentScrollInterval"),
        v5 = 0uLL,
        (v7 = self->_scrollView) != 0))
  {
    -[SBFPagedScrollView currentScrollContext](v7, "currentScrollContext", 0.0);
    v8 = v12;
    v9 = self->_scrollView;
  }
  else
  {
    v9 = 0;
    v8 = 0;
    v14 = 0;
    v12 = v5;
    v13 = v5;
  }
  -[SBFPagedScrollView pageRelativeScrollOffset](v9, "pageRelativeScrollOffset");
  v11[0] = v15;
  v11[1] = v16;
  CSCoverSheetTransitionContextMake((uint64_t)v11, v8, (uint64_t)retstr);
  return result;
}

- ($C89AE587F4FC9517FD26718A5F681357)_completedTransitionContextForPreviousTransitionContext:(SEL)a3 newTransitionContext:(id *)a4
{
  __int128 v5;
  __int128 v6;

  v5 = *(_OWORD *)&a4->var1.var1.var1;
  v6 = *(_OWORD *)&a4->var0;
  *(_OWORD *)&retstr->var1.var0.var1 = *(_OWORD *)&a4->var1.var0.var1;
  *(_OWORD *)&retstr->var1.var1.var1 = v5;
  *(_OWORD *)&retstr->var0 = v6;
  retstr->var1.var1 = a5->var1.var0;
  retstr->var0 = a4->var1.var1.var0;
  return self;
}

- (unint64_t)_indexOfMainPage
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[CSCoverSheetView scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pageViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetView mainPageView](self, "mainPageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  return v6;
}

- (void)_updateLegibility
{
  -[SBFLockScreenDateView setLegibilitySettings:](self->_dateView, "setLegibilitySettings:", self->_legibilitySettings);
  -[SBFStatusBarLegibilityView setLegibilitySettings:](self->_statusBarLegibilityView, "setLegibilitySettings:", self->_legibilitySettings);
}

- (void)_setupAllGesturesOnScrollView:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[CSCoverSheetView _setupWallpaperGestureOnScrollView:](self, "_setupWallpaperGestureOnScrollView:");
  -[CSCoverSheetView _setupBackgroundContentGestureOnScrollView:](self, "_setupBackgroundContentGestureOnScrollView:", v3);
  -[CSCoverSheetView _setupQuickNoteGestureOnScrollView:](self, "_setupQuickNoteGestureOnScrollView:", v3);
  -[CSCoverSheetView _setupDateViewGestureOnScrollView:](self, "_setupDateViewGestureOnScrollView:", v3);
  -[CSCoverSheetView _setupComplicationGestureOnScrollView:](self, "_setupComplicationGestureOnScrollView:", v3);
}

- (void)_setupWallpaperGestureOnScrollView:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (self->_wallpaperGestureRecognizer)
  {
    v3 = a3;
    SBLogDashBoard();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0337000, v5, OS_LOG_TYPE_INFO, "DashBoardView installed wallpaper gesture recognizer", buf, 2u);
      }

      -[SBFPagedScrollView addGestureRecognizer:](self->_scrollView, "addGestureRecognizer:", self->_wallpaperGestureRecognizer);
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1D0337000, v5, OS_LOG_TYPE_INFO, "DashBoardView removed wallpaper gesture recognizer", v7, 2u);
      }

      -[SBFPagedScrollView removeGestureRecognizer:](self->_scrollView, "removeGestureRecognizer:", self->_wallpaperGestureRecognizer);
    }
  }
}

- (void)_setupBackgroundContentGestureOnScrollView:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (self->_backgroundContentGestureRecognizer)
  {
    v3 = a3;
    SBLogDashBoard();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEFAULT, "DashBoardView installed background content gesture recognizer", buf, 2u);
      }

      -[SBFPagedScrollView addGestureRecognizer:](self->_scrollView, "addGestureRecognizer:", self->_backgroundContentGestureRecognizer);
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEFAULT, "DashBoardView removed background content gesture recognizer", v7, 2u);
      }

      -[SBFPagedScrollView removeGestureRecognizer:](self->_scrollView, "removeGestureRecognizer:", self->_backgroundContentGestureRecognizer);
    }
  }
}

- (void)_setupQuickNoteGestureOnScrollView:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (self->_quickNoteGestureRecognizer)
  {
    v3 = a3;
    SBLogDashBoard();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEFAULT, "DashBoardView installed quicknote gesture recognizer", buf, 2u);
      }

      -[SBFPagedScrollView addGestureRecognizer:](self->_scrollView, "addGestureRecognizer:", self->_quickNoteGestureRecognizer);
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEFAULT, "DashBoardView removed quicknote gesture recognizer", v7, 2u);
      }

      -[SBFPagedScrollView removeGestureRecognizer:](self->_scrollView, "removeGestureRecognizer:", self->_quickNoteGestureRecognizer);
    }
  }
}

- (void)_setupDateViewGestureOnScrollView:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (self->_dateViewGestureRecognizer)
  {
    v3 = a3;
    SBLogDashBoard();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEFAULT, "DashBoardView installed dateview gesture recognizer", buf, 2u);
      }

      -[SBFPagedScrollView addGestureRecognizer:](self->_scrollView, "addGestureRecognizer:", self->_dateViewGestureRecognizer);
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEFAULT, "DashBoardView removed dateview gesture recognizer", v7, 2u);
      }

      -[SBFPagedScrollView removeGestureRecognizer:](self->_scrollView, "removeGestureRecognizer:", self->_dateViewGestureRecognizer);
    }
  }
}

- (void)_setupComplicationGestureOnScrollView:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (self->_complicationGestureRecognizer)
  {
    v3 = a3;
    SBLogDashBoard();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEFAULT, "DashBoardView installed complication gesture recognizer", buf, 2u);
      }

      -[SBFPagedScrollView addGestureRecognizer:](self->_scrollView, "addGestureRecognizer:", self->_complicationGestureRecognizer);
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEFAULT, "DashBoardView removed complication gesture recognizer", v7, 2u);
      }

      -[SBFPagedScrollView removeGestureRecognizer:](self->_scrollView, "removeGestureRecognizer:", self->_complicationGestureRecognizer);
    }
  }
}

- (void)_prepareBlursForView:(id)a3 withHardEdges:(BOOL)a4
{
  _BOOL4 v4;
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
  id v16;
  void *v17;
  _QWORD v18[2];

  v4 = a4;
  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForKeyPath:", CFSTR("filters.coverSheetBlurContents"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v4)
        objc_msgSend(v9, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("inputHardEdges"));
      objc_msgSend(v10, "setName:", CFSTR("coverSheetBlurContents"));
      objc_msgSend(v7, "filters");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v7, "mutableArrayValueForKeyPath:", CFSTR("filters"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v10);
      }
      else
      {
        v18[0] = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setFilters:", v12);
      }

    }
    objc_msgSend(v6, "animatedLayerProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");
    v15 = v14;
    if (v14)
      v16 = v14;
    else
      v16 = (id)objc_opt_new();
    v17 = v16;

    objc_msgSend(v17, "addObject:", CFSTR("filters.coverSheetBlurContents.inputRadius"));
    objc_msgSend(v6, "setAnimatedLayerProperties:", v17);

  }
}

- (void)_updateBlurForView:(id)a3 toRadius:(double)a4
{
  void *v5;
  id v6;

  objc_msgSend(a3, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKeyPath:", v5, CFSTR("filters.coverSheetBlurContents.inputRadius"));

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_lookSettings == a3)
  {
    -[CSCoverSheetView _updateDateFont](self, "_updateDateFont");
    -[CSCoverSheetView _layoutDateView](self, "_layoutDateView");
  }
}

- (UIView)bottomPage
{
  return self->_bottomPage;
}

- (CSCoverSheetViewDelegate)delegate
{
  return (CSCoverSheetViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CSLayoutStrategy)layoutStrategy
{
  return (CSLayoutStrategy *)objc_loadWeakRetained((id *)&self->_layoutStrategy);
}

- (void)setLayoutStrategy:(id)a3
{
  objc_storeWeak((id *)&self->_layoutStrategy, a3);
}

- (SBFPagedScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (UIView)mainPageView
{
  return self->_mainPageView;
}

- (void)setMainPageView:(id)a3
{
  objc_storeStrong((id *)&self->_mainPageView, a3);
}

- (BOOL)ignoresOverscrollOnMainPage
{
  return self->_ignoresOverscrollOnMainPage;
}

- (void)setIgnoresOverscrollOnMainPage:(BOOL)a3
{
  self->_ignoresOverscrollOnMainPage = a3;
}

- (SBFLockScreenDateView)dateView
{
  return self->_dateView;
}

- (UIView)sidebarComplicationContainerView
{
  return self->_sidebarComplicationContainerView;
}

- (CSFixedFooterView)fixedFooterView
{
  return self->_fixedFooterView;
}

- (UIView)proudLockContainerView
{
  return self->_proudLockContainerView;
}

- (UIView)cameraCoveredView
{
  return self->_cameraCoveredView;
}

- (UIView)poseidonContainerView
{
  return self->_poseidonContainerView;
}

- (CSTeachableMomentsContainerView)teachableMomentsContainerView
{
  return self->_teachableMomentsContainerView;
}

- (CSQuickActionsView)quickActionsView
{
  return self->_quickActionsView;
}

- (CGPoint)quickActionsViewOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_quickActionsViewOffset.x;
  y = self->_quickActionsViewOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)quickActionsViewScale
{
  return self->_quickActionsViewScale;
}

- (double)quickActionsViewBlurRadius
{
  return self->_quickActionsViewBlurRadius;
}

- (CGPoint)dateViewOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_dateViewOffset.x;
  y = self->_dateViewOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)dateViewScale
{
  return self->_dateViewScale;
}

- (BOOL)dateViewStretch
{
  return self->_dateViewStretch;
}

- (CGPoint)complicationContainerViewOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_complicationContainerViewOffset.x;
  y = self->_complicationContainerViewOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setComplicationContainerViewOffset:(CGPoint)a3
{
  self->_complicationContainerViewOffset = a3;
}

- (double)complicationContainerViewScale
{
  return self->_complicationContainerViewScale;
}

- (void)setComplicationContainerViewScale:(double)a3
{
  self->_complicationContainerViewScale = a3;
}

- (CGPoint)proudLockIconViewOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_proudLockIconViewOffset.x;
  y = self->_proudLockIconViewOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)proudLockIconViewScale
{
  return self->_proudLockIconViewScale;
}

- (BOOL)proudLockPrefersLowerPresentationLevel
{
  return self->_proudLockPrefersLowerPresentationLevel;
}

- (double)proudLockIconBlurRadius
{
  return self->_proudLockIconBlurRadius;
}

- (int64_t)dateViewPageAlignment
{
  return self->_dateViewPageAlignment;
}

- (void)setDateViewPageAlignment:(int64_t)a3
{
  self->_dateViewPageAlignment = a3;
}

- (BOOL)forceDateViewCentered
{
  return self->_forceDateViewCentered;
}

- (BOOL)dateViewIsVibrant
{
  return self->_dateViewIsVibrant;
}

- (UIGestureRecognizer)dateViewGestureRecognizer
{
  return self->_dateViewGestureRecognizer;
}

- (UILongPressGestureRecognizer)complicationGestureRecognizer
{
  return self->_complicationGestureRecognizer;
}

- (UIView)fakeStatusBar
{
  return self->_fakeStatusBar;
}

- (unint64_t)fakeStatusBarLevel
{
  return self->_fakeStatusBarLevel;
}

- (double)fakeStatusBarBlurRadius
{
  return self->_fakeStatusBarBlurRadius;
}

- (double)fakeStatusBarScale
{
  return self->_fakeStatusBarScale;
}

- (UIView)statusBarBackgroundView
{
  return self->_statusBarBackgroundView;
}

- (int64_t)statusBarBackgroundPageAlignment
{
  return self->_statusBarBackgroundPageAlignment;
}

- (void)setStatusBarBackgroundPageAlignment:(int64_t)a3
{
  self->_statusBarBackgroundPageAlignment = a3;
}

- (double)controlCenterGrabberScale
{
  return self->_controlCenterGrabberScale;
}

- (double)controlCenterGrabberBlurRadius
{
  return self->_controlCenterGrabberBlurRadius;
}

- (UIGestureRecognizer)wallpaperGestureRecognizer
{
  return self->_wallpaperGestureRecognizer;
}

- (UITapGestureRecognizer)backgroundContentGestureRecognizer
{
  return self->_backgroundContentGestureRecognizer;
}

- (UITapGestureRecognizer)quickNoteGestureRecognizer
{
  return self->_quickNoteGestureRecognizer;
}

- (SBSearchGesture)searchGesture
{
  return self->_searchGesture;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (CGPoint)contentViewOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_contentViewOffset.x;
  y = self->_contentViewOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)contentViewScale
{
  return self->_contentViewScale;
}

- (UIView)wallpaperFloatingLayerContainerView
{
  return self->_wallpaperFloatingLayerContainerView;
}

- (UIView)slideableContentView
{
  return self->_slideableContentView;
}

- (UIView)modalPresentationView
{
  return self->_modalPresentationView;
}

- (unint64_t)modalPresentationLevel
{
  return self->_modalPresentationLevel;
}

- (unint64_t)wallpaperPresentationLevel
{
  return self->_wallpaperPresentationLevel;
}

- (unint64_t)wallpaperFloatingLayerPresentationLevel
{
  return self->_wallpaperFloatingLayerPresentationLevel;
}

- (unint64_t)dateTimePresentationLevel
{
  return self->_dateTimePresentationLevel;
}

- (unint64_t)backgroundContentPresentationLevel
{
  return self->_backgroundContentPresentationLevel;
}

- (UIView)wakeEffectView
{
  return self->_wakeEffectView;
}

- (CSWallpaperView)wallpaperEffectView
{
  return self->_wallpaperEffectView;
}

- (UIView)tintingView
{
  return self->_tintingView;
}

- (void)setTintingView:(id)a3
{
  objc_storeStrong((id *)&self->_tintingView, a3);
}

- (SBUIBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (SBUIBackgroundView)bedtimeGreetingViewBackgroundView
{
  return self->_bedtimeGreetingViewBackgroundView;
}

- (UIColor)reduceTransparencyBackingColor
{
  return self->_reduceTransparencyBackingColor;
}

- (CGPoint)wallpaperFloatingLayerContainerViewOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_wallpaperFloatingLayerContainerViewOffset.x;
  y = self->_wallpaperFloatingLayerContainerViewOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)wallpaperFloatingLayerContainerViewScale
{
  return self->_wallpaperFloatingLayerContainerViewScale;
}

- (CGPoint)backgroundContentViewOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_backgroundContentViewOffset.x;
  y = self->_backgroundContentViewOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)backgroundContentViewScale
{
  return self->_backgroundContentViewScale;
}

- (double)backgroundContentViewAlpha
{
  return self->_backgroundContentViewAlpha;
}

- (CSBackgroundContentView)backgroundContentView
{
  return self->_backgroundContentView;
}

- (CGPoint)foregroundViewPositionOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_foregroundViewPositionOffset.x;
  y = self->_foregroundViewPositionOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (UIView)referenceViewForBelowPresentationContext
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_referenceViewForBelowPresentationContext);
}

- (void)setReferenceViewForBelowPresentationContext:(id)a3
{
  objc_storeWeak((id *)&self->_referenceViewForBelowPresentationContext, a3);
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (BOOL)legibilitySettingsOverrideVibrancy
{
  return self->_legibilitySettingsOverrideVibrancy;
}

- (void)setLegibilitySettingsOverrideVibrancy:(BOOL)a3
{
  self->_legibilitySettingsOverrideVibrancy = a3;
}

- (BOOL)statusBarLegibilityEnabled
{
  return self->_statusBarLegibilityEnabled;
}

- (void)setStatusBarLegibilityEnabled:(BOOL)a3
{
  self->_statusBarLegibilityEnabled = a3;
}

- (unint64_t)targetPageIndexForDraggingEnded
{
  return self->_targetPageIndexForDraggingEnded;
}

- (void)setTargetPageIndexForDraggingEnded:(unint64_t)a3
{
  self->_targetPageIndexForDraggingEnded = a3;
}

- (CSRegionsDebugView)regionsDebugView
{
  return self->_regionsDebugView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionsDebugView, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_destroyWeak((id *)&self->_referenceViewForBelowPresentationContext);
  objc_storeStrong((id *)&self->_backgroundContentView, 0);
  objc_storeStrong((id *)&self->_reduceTransparencyBackingColor, 0);
  objc_storeStrong((id *)&self->_bedtimeGreetingViewBackgroundView, 0);
  objc_storeStrong((id *)&self->_tintingView, 0);
  objc_storeStrong((id *)&self->_wallpaperEffectView, 0);
  objc_storeStrong((id *)&self->_wakeEffectView, 0);
  objc_storeStrong((id *)&self->_modalPresentationView, 0);
  objc_storeStrong((id *)&self->_wallpaperFloatingLayerContainerView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_searchGesture, 0);
  objc_storeStrong((id *)&self->_quickNoteGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_backgroundContentGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_wallpaperGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_statusBarBackgroundView, 0);
  objc_storeStrong((id *)&self->_fakeStatusBar, 0);
  objc_storeStrong((id *)&self->_complicationGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dateViewGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_quickActionsView, 0);
  objc_storeStrong((id *)&self->_teachableMomentsContainerView, 0);
  objc_storeStrong((id *)&self->_poseidonContainerView, 0);
  objc_storeStrong((id *)&self->_cameraCoveredView, 0);
  objc_storeStrong((id *)&self->_proudLockContainerView, 0);
  objc_storeStrong((id *)&self->_fixedFooterView, 0);
  objc_storeStrong((id *)&self->_sidebarComplicationContainerView, 0);
  objc_storeStrong((id *)&self->_dateView, 0);
  objc_storeStrong((id *)&self->_mainPageView, 0);
  objc_destroyWeak((id *)&self->_layoutStrategy);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bottomPage, 0);
  objc_storeStrong((id *)&self->_lookSettings, 0);
  objc_storeStrong((id *)&self->_cachedLockScreenDefaults, 0);
  objc_storeStrong((id *)&self->_scrollModifier, 0);
  objc_storeStrong((id *)&self->_backgroundContainerView, 0);
  objc_storeStrong((id *)&self->_proudLockContainerWrapperView, 0);
  objc_storeStrong((id *)&self->_fakeStatusBarWrapperView, 0);
  objc_storeStrong((id *)&self->_statusBarLegibilityView, 0);
  objc_storeStrong((id *)&self->_dateEffectView, 0);
  objc_storeStrong((id *)&self->_higherSlideableContentView, 0);
  objc_storeStrong((id *)&self->_slideableContentView, 0);
  objc_storeStrong((id *)&self->_authIndicator, 0);
  objc_storeStrong((id *)&self->_dateTimeClippingView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
