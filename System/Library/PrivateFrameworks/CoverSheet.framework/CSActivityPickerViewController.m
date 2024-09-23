@implementation CSActivityPickerViewController

- (void)viewDidLoad
{
  void *v3;
  id v4;
  UIView *v5;
  UIView *contentView;
  UITapGestureRecognizer *v7;
  UITapGestureRecognizer *tapGesture;
  MTMaterialView *v9;
  MTMaterialView *backgroundMaterialView;
  MTMaterialView *v11;
  FCUIActivityPickerViewController *v12;
  FCUIActivityPickerViewController *activityPickerViewController;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CSActivityPickerViewController;
  -[CSCoverSheetViewControllerBase viewDidLoad](&v17, sel_viewDidLoad);
  -[CSActivityPickerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
  objc_msgSend(v3, "bounds");
  v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
  contentView = self->_contentView;
  self->_contentView = v5;

  -[UIView setClipsToBounds:](self->_contentView, "setClipsToBounds:", 1);
  objc_msgSend(v3, "addSubview:", self->_contentView);
  -[UIView setAutoresizingMask:](self->_contentView, "setAutoresizingMask:", 18);
  v7 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel_handleTap_);
  tapGesture = self->_tapGesture;
  self->_tapGesture = v7;

  -[UIView addGestureRecognizer:](self->_contentView, "addGestureRecognizer:", self->_tapGesture);
  objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:options:initialWeighting:", 20, 2, 0.0);
  v9 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
  backgroundMaterialView = self->_backgroundMaterialView;
  self->_backgroundMaterialView = v9;

  v11 = self->_backgroundMaterialView;
  objc_msgSend(v3, "bounds");
  -[MTMaterialView setFrame:](v11, "setFrame:");
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_backgroundMaterialView);
  -[MTMaterialView setAutoresizingMask:](self->_backgroundMaterialView, "setAutoresizingMask:", 18);
  v12 = (FCUIActivityPickerViewController *)objc_alloc_init(MEMORY[0x1E0D22388]);
  activityPickerViewController = self->_activityPickerViewController;
  self->_activityPickerViewController = v12;

  -[CSActivityPickerViewController traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "userInterfaceIdiom");

  if (v15 == 1)
    -[FCUIActivityPickerViewController setFooterPinnedToBottom:](self->_activityPickerViewController, "setFooterPinnedToBottom:", 0);
  -[CSActivityPickerViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", self->_activityPickerViewController, self->_contentView);
  -[FCUIActivityPickerViewController view](self->_activityPickerViewController, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v16, "setFrame:");
  objc_msgSend(v16, "setAlpha:", 0.0);

}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double v4;
  double v5;
  objc_super v6;
  CGSize result;

  if (self->_activityPickerViewController == a3)
  {
    CCUIDefaultExpandedContentModuleWidth();
    UISizeRoundToScale();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CSActivityPickerViewController;
    -[CSActivityPickerViewController sizeForChildContentContainer:withParentContainerSize:](&v6, sel_sizeForChildContentContainer_withParentContainerSize_, a4.width, a4.height);
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[7];
  CGAffineTransform v9;
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CSActivityPickerViewController;
  -[CSCoverSheetViewControllerBase viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (v7)
    objc_msgSend(v7, "targetTransform");
  else
    memset(&v9, 0, sizeof(v9));
  if (!CGAffineTransformIsIdentity(&v9))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __85__CSActivityPickerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v8[3] = &unk_1E8E30000;
    v8[4] = self;
    *(double *)&v8[5] = width;
    *(double *)&v8[6] = height;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);
  }

}

void __85__CSActivityPickerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "sizeForChildContentContainer:withParentContainerSize:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1072), *(double *)(a1 + 40), *(double *)(a1 + 48));
  BSRectWithSize();
  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "view", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "view");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutIfNeeded");

}

- (void)performCustomTransitionToVisible:(BOOL)a3 withAnimationSettings:(id)a4 completion:(id)a5
{
  _BOOL4 v6;
  void (**v8)(_QWORD);
  id WeakRetained;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  void (**v26)(_QWORD);
  _QWORD v27[4];
  id v28;
  CSActivityPickerViewController *v29;
  id v30;
  id v31;
  BOOL v32;

  v6 = a3;
  v8 = (void (**)(_QWORD))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentContainer);
  if (a4)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0CEAF60]);
    objc_msgSend(v10, "_setDuration:", 0.55);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "activityPickerViewControllerTransitionContainerView:", self);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v10, "_setContainerView:", v11);
    a4 = objc_alloc_init(_CSActivityPickerAnimator);
    objc_msgSend(v10, "_setAnimator:", a4);

  }
  else
  {
    v10 = 0;
  }
  v12 = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "activityPickerViewControllerPresentingView:", self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_9;
  }
  else
  {
    v13 = 0;
    if (!v6)
    {
LABEL_9:
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v12, "activityPickerViewControllerRepresentedActivityForDismissal:", self);
        v14 = objc_claimAutoreleasedReturnValue();
LABEL_14:
        v15 = (void *)v14;
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "activityPickerViewControllerRepresentedActivityForPresentation:", self);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
LABEL_15:
  v15 = 0;
LABEL_16:
  v16 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __100__CSActivityPickerViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke;
  v27[3] = &unk_1E8E30028;
  v32 = v6;
  v17 = v13;
  v28 = v17;
  v29 = self;
  v18 = v15;
  v30 = v18;
  v19 = v10;
  v31 = v19;
  v20 = MEMORY[0x1D17E1614](v27);
  v21 = (void *)v20;
  if (v19)
  {
    v22[0] = v16;
    v22[1] = 3221225472;
    v22[2] = __100__CSActivityPickerViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke_2;
    v22[3] = &unk_1E8E30078;
    v23 = v19;
    v25 = v21;
    v26 = v8;
    v24 = a4;
    dispatch_async(MEMORY[0x1E0C80D38], v22);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v20 + 16))(v20, 0);
    v8[2](v8);
  }

}

void __100__CSActivityPickerViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  if (!*(_BYTE *)(a1 + 64))
  {
    v10 = v3;
    v8 = *(void **)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "_transitionCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_dismissWithRepresentedActivity:transitionCoordinator:", v9, v7);
    goto LABEL_5;
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v10 = v3;
    v5 = *(void **)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "_transitionCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_presentFromView:representedActivity:transitionCoordinator:", v4, v6, v7);
LABEL_5:

    v3 = v10;
  }

}

void __100__CSActivityPickerViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_transitionCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __100__CSActivityPickerViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke_3;
  v4[3] = &unk_1E8E30050;
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v2, "animateAlongsideTransition:completion:", v3, v4);

  objc_msgSend(*(id *)(a1 + 40), "animateTransition:", *(_QWORD *)(a1 + 32));
}

uint64_t __100__CSActivityPickerViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)dismiss
{
  id WeakRetained;
  void *v4;
  objc_super v5;
  _QWORD v6[4];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_modalPresenter);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __41__CSActivityPickerViewController_dismiss__block_invoke;
    v6[3] = &unk_1E8E2DB38;
    v7 = WeakRetained;
    objc_msgSend(v7, "dismissContentViewController:animated:completion:", self, 1, v6);

  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CSActivityPickerViewController;
    -[CSCoverSheetViewControllerBase dismiss](&v5, sel_dismiss);
  }

}

uint64_t __41__CSActivityPickerViewController_dismiss__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismiss");
}

- (void)aggregateAppearance:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CSActivityPickerViewController;
  v3 = a3;
  -[CSCoverSheetViewControllerBase aggregateAppearance:](&v11, sel_aggregateAppearance_, v3);
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "priority:", 40, v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fakeStatusBar:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fakeStatusBarLevel:", &unk_1E8E8A438);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addComponent:", v7);

  +[CSComponent homeAffordance](CSComponent, "homeAffordance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "priority:", 40);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hidden:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addComponent:", v10);

}

- (void)aggregateBehavior:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSActivityPickerViewController;
  v3 = a3;
  -[CSCoverSheetViewControllerBase aggregateBehavior:](&v4, sel_aggregateBehavior_, v3);
  objc_msgSend(v3, "setScrollingStrategy:", 3, v4.receiver, v4.super_class);
  objc_msgSend(v3, "setIdleTimerMode:", 1);
  objc_msgSend(v3, "setIdleTimerDuration:", 9);
  objc_msgSend(v3, "setIdleWarnMode:", 2);

}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CSActivityPickerViewController;
  if (-[CSCoverSheetViewControllerBase handleEvent:](&v7, sel_handleEvent_, v4)
    && (objc_msgSend(v4, "isConsumable") & 1) != 0)
  {
    goto LABEL_7;
  }
  if ((objc_msgSend(v4, "type") | 2) == 0x1B
    && (-[CSActivityPickerViewController bs_isDisappearingOrDisappeared](self, "bs_isDisappearingOrDisappeared") & 1) == 0)
  {
    -[CSActivityPickerViewController dismiss](self, "dismiss");
LABEL_7:
    v5 = objc_msgSend(v4, "isConsumable");
    goto LABEL_8;
  }
  v5 = 0;
LABEL_8:

  return v5;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "type") == 27 || objc_msgSend(v3, "type") == 25;

  return v4;
}

- (int64_t)presentationStyle
{
  return 2;
}

- (int64_t)presentationType
{
  return 2;
}

- (int64_t)presentationTransition
{
  return 1;
}

- (int64_t)presentationPriority
{
  return 500;
}

- (void)addGrabberView:(id)a3
{
  UIView **p_grabberView;
  UIView *v6;
  id v7;

  v7 = a3;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    p_grabberView = &self->_grabberView;
    if ((BSEqualObjects() & 1) == 0)
    {
      -[UIView removeFromSuperview](*p_grabberView, "removeFromSuperview");
      objc_storeStrong((id *)&self->_grabberView, a3);
      -[CSActivityPickerViewController loadViewIfNeeded](self, "loadViewIfNeeded");
      v6 = *p_grabberView;
      -[UIView bounds](self->_contentView, "bounds");
      -[UIView setFrame:](v6, "setFrame:");
      -[UIView setAutoresizingMask:](*p_grabberView, "setAutoresizingMask:", 18);
      -[UIView addSubview:](self->_contentView, "addSubview:", *p_grabberView);
    }
  }

}

- (void)_presentFromView:(id)a3 representedActivity:(id)a4 transitionCoordinator:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  CSActivityPickerViewController *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t);
  void *v38;
  CSActivityPickerViewController *v39;
  id v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_UIPortalView removeFromSuperview](self->_presentingPortalView, "removeFromSuperview");
  v11 = MEMORY[0x1E0C809B0];
  v12 = (void *)MEMORY[0x1E0CEABB0];
  v35 = MEMORY[0x1E0C809B0];
  v36 = 3221225472;
  v37 = __93__CSActivityPickerViewController__presentFromView_representedActivity_transitionCoordinator___block_invoke;
  v38 = &unk_1E8E2DC00;
  v39 = self;
  v13 = v8;
  v40 = v13;
  objc_msgSend(v12, "performWithoutAnimation:", &v35);
  -[UIView bounds](self->_contentView, "bounds");
  -[CSActivityPickerViewController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", self->_activityPickerViewController, v14, v15);
  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  v24 = v11;
  v25 = 3221225472;
  v26 = __93__CSActivityPickerViewController__presentFromView_representedActivity_transitionCoordinator___block_invoke_2;
  v27 = &unk_1E8E2E1E0;
  v31 = v16;
  v32 = v17;
  v33 = v18;
  v34 = v19;
  v28 = self;
  v29 = v9;
  v20 = v10;
  v30 = v20;
  v21 = v9;
  v22 = MEMORY[0x1D17E1614](&v24);
  v23 = (void *)v22;
  if (v20)
    objc_msgSend(v20, "animateAlongsideTransition:completion:", v22, 0, 0, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37,
      v38,
      v39);
  else
    (*(void (**)(uint64_t, _QWORD))(v22 + 16))(v22, 0);

}

void __93__CSActivityPickerViewController__presentFromView_representedActivity_transitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAE58]), "initWithSourceView:", *(_QWORD *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 1056);
  *(_QWORD *)(v4 + 1056) = v3;

  v6 = (_QWORD *)(*(_QWORD *)(a1 + 32) + 1088);
  objc_msgSend(*(id *)(a1 + 40), "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "frame");
  objc_msgSend(v7, "convertRect:toView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040));
  *v6 = v8;
  v6[1] = v9;
  v6[2] = v10;
  v6[3] = v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "setFrame:", *(double *)(*(_QWORD *)(a1 + 32) + 1088), *(double *)(*(_QWORD *)(a1 + 32) + 1096), *(double *)(*(_QWORD *)(a1 + 32) + 1104), *(double *)(*(_QWORD *)(a1 + 32) + 1112));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "setHidesSourceView:", 1);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 1040);
  v14 = *(_QWORD *)(v12 + 1056);
  objc_msgSend(*(id *)(v12 + 1072), "view");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "insertSubview:belowSubview:", v14, v15);

}

uint64_t __93__CSActivityPickerViewController__presentFromView_representedActivity_transitionCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double Height;
  CGFloat v22;
  void *v23;
  double v25;
  _QWORD v26[5];
  CGAffineTransform v27;
  CGRect v28;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 0);

  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(v3 + 1072), "setExpandedFrame:initialFrame:representedActivity:presentationStyle:transitionCoordinator:", *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(v3 + 1088), *(double *)(v3 + 1096), *(double *)(v3 + 1104), *(double *)(v3 + 1112));
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "convertRect:fromView:", 0);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  UIDistanceBetweenRects();
  v25 = round(v20 / 100.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "setFrame:", v13, v15, v17, v19);
  v28.origin.x = v5;
  v28.origin.y = v7;
  v28.size.width = v9;
  v28.size.height = v11;
  Height = CGRectGetHeight(v28);
  v22 = CGRectGetHeight(*(CGRect *)(*(_QWORD *)(a1 + 32) + 1088));
  v23 = *(void **)(*(_QWORD *)(a1 + 32) + 1056);
  CGAffineTransformMakeScale(&v27, Height / v22, Height / v22);
  objc_msgSend(v23, "setTransform:", &v27);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "setWeighting:", 1.0);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __93__CSActivityPickerViewController__presentFromView_representedActivity_transitionCoordinator___block_invoke_3;
  v26[3] = &unk_1E8E2DB38;
  v26[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 34, v26, 0, v25 * 0.0916666667 + 0.0916666667, 0.0, 2.0, 300.0, 38.0, 0.0);
}

uint64_t __93__CSActivityPickerViewController__presentFromView_representedActivity_transitionCoordinator___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "setAlpha:", 0.0);
}

- (void)_dismissWithRepresentedActivity:(id)a3 transitionCoordinator:(id)a4
{
  id v6;
  id v7;
  _UIPortalView *v8;
  uint64_t v9;
  id v10;
  id v11;
  _UIPortalView *v12;
  void (**v13)(_QWORD, _QWORD);
  _UIPortalView *v14;
  void (**v15)(_QWORD, _QWORD);
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  _UIPortalView *v20;
  CSActivityPickerViewController *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  _UIPortalView *v25;

  v6 = a3;
  v7 = a4;
  v8 = self->_presentingPortalView;
  v9 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __88__CSActivityPickerViewController__dismissWithRepresentedActivity_transitionCoordinator___block_invoke;
  v22[3] = &unk_1E8E300C8;
  v22[4] = self;
  v10 = v6;
  v23 = v10;
  v11 = v7;
  v24 = v11;
  v12 = v8;
  v25 = v12;
  v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E1614](v22);
  v16 = v9;
  v17 = 3221225472;
  v18 = __88__CSActivityPickerViewController__dismissWithRepresentedActivity_transitionCoordinator___block_invoke_3;
  v19 = &unk_1E8E2F138;
  v14 = v12;
  v20 = v14;
  v21 = self;
  v15 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E1614](&v16);
  if (v11)
  {
    objc_msgSend(v11, "animateAlongsideTransition:completion:", v13, v15, v16, v17, v18, v19);
  }
  else
  {
    v13[2](v13, 0);
    v15[2](v15, 0);
  }

}

void __88__CSActivityPickerViewController__dismissWithRepresentedActivity_transitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  _OWORD v14[3];
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "setContractedFrame:representedActivity:presentationStyle:transitionCoordinator:", *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48), *(double *)(*(_QWORD *)(a1 + 32) + 1088), *(double *)(*(_QWORD *)(a1 + 32) + 1096), *(double *)(*(_QWORD *)(a1 + 32) + 1104), *(double *)(*(_QWORD *)(a1 + 32) + 1112));
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", 0.0);

  v11 = (void *)MEMORY[0x1E0CEABB0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __88__CSActivityPickerViewController__dismissWithRepresentedActivity_transitionCoordinator___block_invoke_2;
  v15[3] = &unk_1E8E300A0;
  v15[4] = *(_QWORD *)(a1 + 32);
  v17 = v3;
  v18 = v5;
  v19 = v7;
  v20 = v9;
  v16 = *(id *)(a1 + 56);
  objc_msgSend(v11, "performWithoutAnimation:", v15);
  v12 = *(void **)(a1 + 56);
  v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v14[0] = *MEMORY[0x1E0C9BAA8];
  v14[1] = v13;
  v14[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v12, "setTransform:", v14);
  objc_msgSend(*(id *)(a1 + 56), "setFrame:", *(double *)(*(_QWORD *)(a1 + 32) + 1088), *(double *)(*(_QWORD *)(a1 + 32) + 1096), *(double *)(*(_QWORD *)(a1 + 32) + 1104), *(double *)(*(_QWORD *)(a1 + 32) + 1112));
  objc_msgSend(*(id *)(a1 + 56), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "setWeighting:", 0.0);

}

uint64_t __88__CSActivityPickerViewController__dismissWithRepresentedActivity_transitionCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int IsValid;
  int v12;
  int v13;
  char v14;
  BOOL v15;
  BOOL v16;
  void *v17;
  double v18;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "convertRect:fromView:", 0, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  IsValid = CGFloatIsValid();
  v12 = CGFloatIsValid();
  v13 = CGFloatIsValid();
  v14 = CGFloatIsValid();
  if (IsValid)
    v15 = v12 == 0;
  else
    v15 = 1;
  v16 = v15 || v13 == 0;
  if (!v16 && (v14 & 1) != 0)
    goto LABEL_14;
  if ((IsValid & 1) != 0)
  {
    if ((v12 & 1) != 0)
      goto LABEL_11;
  }
  else
  {
    v8 = *(double *)(a1 + 64);
    if ((v12 & 1) != 0)
    {
LABEL_11:
      if ((v14 & 1) != 0)
        goto LABEL_12;
LABEL_17:
      v6 = *(double *)(a1 + 56);
      if ((v13 & 1) != 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  v10 = *(double *)(a1 + 72);
  if ((v14 & 1) == 0)
    goto LABEL_17;
LABEL_12:
  if ((v13 & 1) == 0)
  {
LABEL_13:
    objc_msgSend(*(id *)(a1 + 32), "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "size");
    v4 = (v18 - v8) * 0.5;

  }
LABEL_14:
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", v4, v6, v8, v10);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "bringSubviewToFront:", *(_QWORD *)(a1 + 40));
}

void __88__CSActivityPickerViewController__dismissWithRepresentedActivity_transitionCoordinator___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  if (v2 == *(void **)(*(_QWORD *)(a1 + 40) + 1056))
  {
    objc_msgSend(v2, "removeFromSuperview");
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(v3 + 1056);
    *(_QWORD *)(v3 + 1056) = 0;

  }
}

- (void)handleTap:(id)a3
{
  if (self->_tapGesture == a3)
    -[CSActivityPickerViewController dismiss](self, "dismiss");
}

- (CSActivityPickerViewControllerDelegate)delegate
{
  return (CSActivityPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CSActivityPickerViewControllerParentContainer)parentContainer
{
  return (CSActivityPickerViewControllerParentContainer *)objc_loadWeakRetained((id *)&self->_parentContainer);
}

- (void)setParentContainer:(id)a3
{
  objc_storeWeak((id *)&self->_parentContainer, a3);
}

- (CSDismissableModalViewController)modalPresenter
{
  return (CSDismissableModalViewController *)objc_loadWeakRetained((id *)&self->_modalPresenter);
}

- (void)setModalPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_modalPresenter, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_modalPresenter);
  objc_destroyWeak((id *)&self->_parentContainer);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_activityPickerViewController, 0);
  objc_storeStrong((id *)&self->_grabberView, 0);
  objc_storeStrong((id *)&self->_presentingPortalView, 0);
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
