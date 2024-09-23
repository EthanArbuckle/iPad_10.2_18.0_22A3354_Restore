@implementation CSHomeAffordanceViewController

- (CSHomeAffordanceViewController)initWithCoverSheetContext:(id)a3
{
  id v5;
  CSHomeAffordanceViewController *v6;
  CSHomeAffordanceViewController *v7;
  uint64_t v8;
  SBFHomeGrabberSettings *settings;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSHomeAffordanceViewController;
  v6 = -[CSCoverSheetViewControllerBase initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coverSheetContext, a3);
    v7->_homeAffordanceScale = 1.0;
    objc_msgSend(MEMORY[0x1E0DA9E28], "rootSettings");
    v8 = objc_claimAutoreleasedReturnValue();
    settings = v7->_settings;
    v7->_settings = (SBFHomeGrabberSettings *)v8;

  }
  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  UIView *v4;
  UIView *counterRotationView;
  NSMutableArray *v6;
  NSMutableArray *rotationWrapperViews;
  void *v8;
  CSHomeAffordanceView *v9;
  CSHomeAffordanceView *homeAffordanceView;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CSHomeAffordanceViewController;
  -[CSCoverSheetViewControllerBase viewDidLoad](&v11, sel_viewDidLoad);
  -[CSHomeAffordanceViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
  counterRotationView = self->_counterRotationView;
  self->_counterRotationView = v4;

  objc_msgSend(v3, "addSubview:", self->_counterRotationView);
  v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  rotationWrapperViews = self->_rotationWrapperViews;
  self->_rotationWrapperViews = v6;

  -[CSHomeAffordanceViewController _addWrapperViewWithOrientation:](self, "_addWrapperViewWithOrientation:", self->_orientation);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CSHomeAffordanceView initWithCoverSheetContext:]([CSHomeAffordanceView alloc], "initWithCoverSheetContext:", self->_coverSheetContext);
  homeAffordanceView = self->_homeAffordanceView;
  self->_homeAffordanceView = v9;

  objc_msgSend(v8, "addSubview:", self->_homeAffordanceView);
  -[CSHomeAffordanceViewController _updateHomeAffordanceInteraction](self, "_updateHomeAffordanceInteraction");

}

- (void)viewDidLayoutSubviews
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)CSHomeAffordanceViewController;
  -[CSCoverSheetViewControllerBase viewDidLayoutSubviews](&v29, sel_viewDidLayoutSubviews);
  -[CSHomeAffordanceViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIView setFrame:](self->_counterRotationView, "setFrame:", v5, v7, v9, v11);
  -[UIView bounds](self->_counterRotationView, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = self->_rotationWrapperViews;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v24++), "setFrame:", v13, v15, v17, v19, (_QWORD)v25);
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v22);
  }

  -[CSHomeAffordanceViewController _layoutHomeAffordance](self, "_layoutHomeAffordance");
}

- (void)viewDidAppear:(BOOL)a3
{
  UIHoverGestureRecognizer *v4;
  UIHoverGestureRecognizer *suppressAnimationForPointerGestureRecognizer;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSHomeAffordanceViewController;
  -[CSCoverSheetViewControllerBase viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  if (!self->_suppressAnimationForPointerGestureRecognizer)
  {
    v4 = (UIHoverGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA628]), "initWithTarget:action:", self, sel__handleSuppressAnimationForPointerGesture_);
    suppressAnimationForPointerGestureRecognizer = self->_suppressAnimationForPointerGestureRecognizer;
    self->_suppressAnimationForPointerGestureRecognizer = v4;

  }
  -[CSHomeAffordanceViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addGestureRecognizer:", self->_suppressAnimationForPointerGestureRecognizer);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSHomeAffordanceViewController;
  -[CSCoverSheetViewControllerBase viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  -[CSHomeAffordanceViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeGestureRecognizer:", self->_suppressAnimationForPointerGestureRecognizer);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  uint64_t v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  UIView *counterRotationView;
  void *v27;
  void *v28;
  id v29;
  _BYTE v30[48];
  _BYTE v31[48];
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[6];
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  CSHomeAffordanceViewController *v46;
  id v47;
  objc_super v48;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v48.receiver = self;
  v48.super_class = (Class)CSHomeAffordanceViewController;
  -[CSCoverSheetViewControllerBase viewWillTransitionToSize:withTransitionCoordinator:](&v48, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  SBFWindowForViewControllerTransition();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_toWindowOrientation");

  v10 = objc_msgSend(v7, "isAnimated");
  -[NSMutableArray firstObject](self->_rotationWrapperViews, "firstObject");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[CSHomeAffordanceViewController _addWrapperViewWithOrientation:](self, "_addWrapperViewWithOrientation:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAlpha:", 0.0);
    v13 = (void *)objc_opt_new();
    v14 = (void *)objc_opt_new();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __85__CSHomeAffordanceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v43[3] = &unk_1E8E30168;
    v15 = v13;
    v44 = v15;
    v16 = v14;
    v45 = v16;
    v46 = self;
    v17 = v12;
    v47 = v17;
    v18 = (void *)MEMORY[0x1D17E1614](v43);
    -[SBFHomeGrabberSettings rotationFadeOutAnimationSettings](self->_settings, "rotationFadeOutAnimationSettings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "BSAnimationSettings");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0D01908];
    v21 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __85__CSHomeAffordanceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
    v41[3] = &unk_1E8E2DB38;
    v42 = v11;
    v36[0] = v21;
    v36[1] = 3221225472;
    v36[2] = __85__CSHomeAffordanceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4;
    v36[3] = &unk_1E8E30190;
    v36[4] = self;
    v37 = v17;
    v38 = v42;
    v39 = v15;
    v22 = v18;
    v40 = v22;
    v29 = v15;
    v23 = v42;
    v11 = v17;
    objc_msgSend(v20, "animateWithSettings:actions:completion:", v28, v41, v36);
    v34 = v22;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __85__CSHomeAffordanceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_5;
    v35[3] = &unk_1E8E301B8;
    v35[4] = self;
    v35[5] = v9;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __85__CSHomeAffordanceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_6;
    v32[3] = &unk_1E8E301E0;
    v33 = v16;
    v24 = v22;
    v25 = v16;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v35, v32);

  }
  else
  {
    counterRotationView = self->_counterRotationView;
    SBFTransformFromOrientationToOrientation();
    -[UIView setTransform:](counterRotationView, "setTransform:", v31);
    SBFTransformFromOrientationToOrientation();
    objc_msgSend(v11, "setTransform:", v30);
  }

  -[CSHomeAffordanceViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setNeedsLayout");

}

void __85__CSHomeAffordanceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  if (objc_msgSend(*(id *)(a1 + 32), "hasBeenSignalled")
    && objc_msgSend(*(id *)(a1 + 40), "hasBeenSignalled"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1048), "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(void **)(a1 + 56);

    if (v2 == v3)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1064), "rotationFadeInAnimationSettings");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "BSAnimationSettings");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      v5 = (void *)MEMORY[0x1E0D01908];
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __85__CSHomeAffordanceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
      v7[3] = &unk_1E8E2DB38;
      v8 = *(id *)(a1 + 56);
      objc_msgSend(v5, "animateWithSettings:actions:", v6, v7);

    }
  }
}

uint64_t __85__CSHomeAffordanceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __85__CSHomeAffordanceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __85__CSHomeAffordanceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1112));
    objc_msgSend(*(id *)(a1 + 32), "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "removeObject:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 56), "signal");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void __85__CSHomeAffordanceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1040);
  SBFTransformFromOrientationToOrientation();
  objc_msgSend(v2, "setTransform:", &v5);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

uint64_t __85__CSHomeAffordanceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "signal");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  char v5;
  char v6;
  char v7;
  char v8;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_msgSend(WeakRetained, "isEqual:", obj);

  if ((v5 & 1) == 0)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 2;
    else
      v6 = 0;
    *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xFD | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 4;
    else
      v7 = 0;
    *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xFB | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 8;
    else
      v8 = 0;
    *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xF7 | v8;
  }

}

- (BOOL)isHomeAffordanceInteractionEnabled
{
  return -[SBFHomeAffordanceInteraction isEnabled](self->_homeAffordanceInteraction, "isEnabled");
}

- (void)setHomeAffordanceInteractionEnabled:(BOOL)a3
{
  -[SBFHomeAffordanceInteraction setEnabled:](self->_homeAffordanceInteraction, "setEnabled:", a3);
}

- (void)setHomeAffordanceOffset:(CGPoint)a3
{
  if (self->_homeAffordanceOffset.x != a3.x || self->_homeAffordanceOffset.y != a3.y)
  {
    self->_homeAffordanceOffset = a3;
    -[CSHomeAffordanceViewController _layoutHomeAffordance](self, "_layoutHomeAffordance");
  }
}

- (void)setHomeAffordanceScale:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_homeAffordanceScale = a3;
    -[CSHomeAffordanceViewController _layoutHomeAffordance](self, "_layoutHomeAffordance");
  }
}

- (void)setHomeAffordanceOffset:(CGPoint)a3 scale:(double)a4
{
  double *p_homeAffordanceScale;

  if (self->_homeAffordanceOffset.x == a3.x && self->_homeAffordanceOffset.y == a3.y)
  {
    p_homeAffordanceScale = &self->_homeAffordanceScale;
    if ((BSFloatEqualToFloat() & 1) != 0)
      return;
  }
  else
  {
    self->_homeAffordanceOffset = a3;
    p_homeAffordanceScale = &self->_homeAffordanceScale;
    if ((BSFloatEqualToFloat() & 1) != 0)
      goto LABEL_9;
  }
  *p_homeAffordanceScale = a4;
LABEL_9:
  -[CSHomeAffordanceViewController _layoutHomeAffordance](self, "_layoutHomeAffordance");
}

- (void)setLegibilitySettings:(id)a3
{
  -[CSHomeAffordanceView setLegibilitySettings:](self->_homeAffordanceView, "setLegibilitySettings:", a3);
}

- (void)_layoutHomeAffordance
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
  double v14;
  __int128 v15;
  void *v16;
  CSHomeAffordanceView *homeAffordanceView;
  _OWORD v18[3];
  __int128 v19;
  __int128 v20;
  __int128 v21;

  -[CSHomeAffordanceViewController _homeAffordanceRestingFrame](self, "_homeAffordanceRestingFrame");
  v4 = v3;
  v6 = v5;
  UIRectGetCenter();
  v8 = v7;
  v10 = v9;
  v11 = *MEMORY[0x1E0C9D538];
  v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[CSHomeAffordanceViewController homeAffordanceOffset](self, "homeAffordanceOffset");
  -[CSHomeAffordanceView setCenter:](self->_homeAffordanceView, "setCenter:", v8 + v13, v10 + v14);
  -[CSHomeAffordanceView setBounds:](self->_homeAffordanceView, "setBounds:", v11, v12, v4, v6);
  -[CSHomeAffordanceViewController homeAffordanceScale](self, "homeAffordanceScale");
  v20 = 0u;
  v21 = 0u;
  v19 = 0u;
  if ((BSFloatIsOne() & 1) != 0)
  {
    v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v19 = *MEMORY[0x1E0C9BAA8];
    v20 = v15;
    v21 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  else
  {
    -[CSHomeAffordanceView superview](self->_homeAffordanceView, "superview");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    UIRectGetCenter();

    SBFTransformForScalingAboutPointInSuperview();
  }
  homeAffordanceView = self->_homeAffordanceView;
  v18[0] = v19;
  v18[1] = v20;
  v18[2] = v21;
  -[CSHomeAffordanceView setTransform:](homeAffordanceView, "setTransform:", v18);
  -[SBFHomeAffordanceInteraction setNeedsUpdate](self->_homeAffordanceInteraction, "setNeedsUpdate");
}

- (CGRect)_homeAffordanceRestingFrame
{
  void *v3;
  double v4;
  double v5;
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
  CGRect result;

  -[CSHomeAffordanceView superview](self->_homeAffordanceView, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  -[CSHomeAffordanceViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayScale");

  -[CSHomeAffordanceView suggestedSizeForContentWidth:](self->_homeAffordanceView, "suggestedSizeForContentWidth:", v5);
  -[CSHomeAffordanceView suggestedEdgeSpacing](self->_homeAffordanceView, "suggestedEdgeSpacing");
  BSRectRoundForScale();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)_addWrapperViewWithOrientation:(int64_t)a3
{
  id v4;
  uint64_t v6;

  v4 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  -[NSMutableArray insertObject:atIndex:](self->_rotationWrapperViews, "insertObject:atIndex:", v4, 0);
  SBFTransformFromOrientationToOrientation();
  objc_msgSend(v4, "setTransform:", &v6);
  -[UIView addSubview:](self->_counterRotationView, "addSubview:", v4);
  return v4;
}

- (void)_handleSuppressAnimationForPointerGesture:(id)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  _BOOL4 v9;
  id v10;
  CGPoint v11;
  CGRect v12;

  v10 = a3;
  if ((unint64_t)(objc_msgSend(v10, "state") - 6) > 0xFFFFFFFFFFFFFFFCLL)
  {
    v9 = 0;
  }
  else
  {
    -[CSHomeAffordanceViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locationInView:", v4);
    v6 = v5;
    v8 = v7;

    -[CSHomeAffordanceView extendedFrameForPointerAnimationSuppression](self->_homeAffordanceView, "extendedFrameForPointerAnimationSuppression");
    v11.x = v6;
    v11.y = v8;
    v9 = CGRectContainsPoint(v12, v11);
  }
  if (self->_suppressAnimationForPointer != v9)
  {
    self->_suppressAnimationForPointer = v9;
    -[CSCoverSheetViewControllerBase rebuildAppearance](self, "rebuildAppearance");
  }

}

- (void)_updateHomeAffordanceInteraction
{
  void *v3;
  int v4;
  SBFHomeAffordanceInteraction *homeAffordanceInteraction;
  void *v6;
  SBFHomeAffordanceInteraction *v7;
  SBFHomeAffordanceInteraction *v8;
  SBFHomeAffordanceInteraction *v9;

  -[CSCoverSheetContextProviding assistantController](self->_coverSheetContext, "assistantController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled");

  homeAffordanceInteraction = self->_homeAffordanceInteraction;
  if (v4)
  {
    if (!homeAffordanceInteraction)
    {
      -[CSCoverSheetContextProviding homeAffordanceInteractionProvider](self->_coverSheetContext, "homeAffordanceInteractionProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (SBFHomeAffordanceInteraction *)objc_msgSend(v6, "newHomeAffordanceInteraction");
      v8 = self->_homeAffordanceInteraction;
      self->_homeAffordanceInteraction = v7;

      -[SBFHomeAffordanceInteraction setDelegate:](self->_homeAffordanceInteraction, "setDelegate:", self);
      -[CSHomeAffordanceView addInteraction:](self->_homeAffordanceView, "addInteraction:", self->_homeAffordanceInteraction);
    }
  }
  else if (homeAffordanceInteraction)
  {
    -[CSHomeAffordanceView removeInteraction:](self->_homeAffordanceView, "removeInteraction:");
    v9 = self->_homeAffordanceInteraction;
    self->_homeAffordanceInteraction = 0;

  }
}

- (void)aggregateAppearance:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSHomeAffordanceViewController;
  v3 = a3;
  -[CSCoverSheetViewControllerBase aggregateAppearance:](&v7, sel_aggregateAppearance_, v3);
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "priority:", 10, v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suppressTeachableMomentsAnimation:", BSSettingFlagIfYes());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addComponent:", v6);

}

- (CGRect)homeAffordanceFrameForHomeAffordanceInteraction:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[CSHomeAffordanceView bounds](self->_homeAffordanceView, "bounds", a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)homeAffordanceInteractionDidRecognizeSingleTap:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  char delegateRespondsTo;
  CSHomeAffordanceView *homeAffordanceView;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  BOOL v13;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = WeakRetained;
  delegateRespondsTo = (char)self->_delegateRespondsTo;
  if ((delegateRespondsTo & 1) != 0)
    objc_msgSend(WeakRetained, "homeAffordanceViewControllerDidRecognizeSingleTap:", self);
  homeAffordanceView = self->_homeAffordanceView;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__CSHomeAffordanceViewController_homeAffordanceInteractionDidRecognizeSingleTap___block_invoke;
  v10[3] = &unk_1E8E30208;
  v13 = (delegateRespondsTo & 8) != 0;
  v9 = v6;
  v11 = v9;
  objc_copyWeak(&v12, &location);
  -[CSHomeAffordanceView performHintAnimationWithCompletionHandler:](homeAffordanceView, "performHintAnimationWithCompletionHandler:", v10);
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

void __81__CSHomeAffordanceViewController_homeAffordanceInteractionDidRecognizeSingleTap___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id WeakRetained;

  if (*(_BYTE *)(a1 + 48))
  {
    v3 = *(void **)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v3, "homeAffordanceViewController:didCompleteHomeAffordanceHintAnimation:", WeakRetained, a2);

  }
}

- (void)homeAffordanceInteractionDidRecognizeDoubleTap:(id)a3
{
  id WeakRetained;

  if ((*(_BYTE *)&self->_delegateRespondsTo & 2) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "homeAffordanceViewControllerDidRecognizeDoubleTap:", self);

  }
}

- (void)homeAffordanceInteractionDidFailToRecognizeDoubleTap:(id)a3
{
  id WeakRetained;

  if ((*(_BYTE *)&self->_delegateRespondsTo & 4) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "homeAffordanceViewControllerDidFailToRecognizeDoubleTap:", self);

  }
}

- (CSHomeAffordanceViewControllerDelegate)delegate
{
  return (CSHomeAffordanceViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CSCoverSheetContextProviding)coverSheetContext
{
  return self->_coverSheetContext;
}

- (CSHomeAffordanceView)homeAffordanceView
{
  return self->_homeAffordanceView;
}

- (CGPoint)homeAffordanceOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_homeAffordanceOffset.x;
  y = self->_homeAffordanceOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)homeAffordanceScale
{
  return self->_homeAffordanceScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeAffordanceView, 0);
  objc_storeStrong((id *)&self->_coverSheetContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_homeAffordanceInteraction, 0);
  objc_storeStrong((id *)&self->_suppressAnimationForPointerGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_rotationWrapperViews, 0);
  objc_storeStrong((id *)&self->_counterRotationView, 0);
}

@end
