@implementation CSDismissableModalViewController

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSDismissableModalViewController;
  -[CSCoverSheetViewControllerBase viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CSDismissableModalViewController _addOrRemoveGestureForCurrentSettings](self, "_addOrRemoveGestureForCurrentSettings");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSDismissableModalViewController;
  -[CSCoverSheetViewControllerBase viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[CSDismissableModalViewController _addOrRemoveGestureForCurrentSettings](self, "_addOrRemoveGestureForCurrentSettings");
}

- (void)setHomeAffordanceController:(id)a3
{
  CSModalHomeAffordanceControlling *v5;
  CSModalHomeAffordanceControlling **p_homeAffordanceController;
  CSModalHomeAffordanceControlling *homeAffordanceController;
  CSModalHomeAffordanceControlling *v8;

  v5 = (CSModalHomeAffordanceControlling *)a3;
  p_homeAffordanceController = &self->_homeAffordanceController;
  homeAffordanceController = self->_homeAffordanceController;
  if (homeAffordanceController != v5)
  {
    v8 = v5;
    -[CSModalHomeAffordanceControlling unregisterHomeGestureParticipant](homeAffordanceController, "unregisterHomeGestureParticipant");
    -[CSModalHomeAffordanceControlling setHomeGestureRecognizer:](*p_homeAffordanceController, "setHomeGestureRecognizer:", 0);
    objc_storeStrong((id *)&self->_homeAffordanceController, a3);
    if (self->_bottomEdgeRecognizer)
    {
      -[CSModalHomeAffordanceControlling setHomeGestureRecognizer:](*p_homeAffordanceController, "setHomeGestureRecognizer:");
      -[CSModalHomeAffordanceControlling registerHomeGestureParticipant:](*p_homeAffordanceController, "registerHomeGestureParticipant:", self);
    }
    -[CSDismissableModalViewController _addOrRemoveGestureForCurrentSettings](self, "_addOrRemoveGestureForCurrentSettings");
    v5 = v8;
  }

}

- (BOOL)presentationCancelsTouches
{
  return 0;
}

- (void)setNeedsUpdateZStackPreferencesWithReason:(id)a3
{
  -[CSModalHomeAffordanceControlling setNeedsUpdateZStackPreferencesWithReason:](self->_homeAffordanceController, "setNeedsUpdateZStackPreferencesWithReason:", a3);
}

- (void)_addOrRemoveGestureForCurrentSettings
{
  void *v3;
  uint64_t v4;
  int v5;
  UIScreenEdgePanGestureRecognizer *bottomEdgeRecognizer;
  _CSScreenEdgePanGestureRecognizer *v7;
  UIScreenEdgePanGestureRecognizer *v8;
  void *v9;
  void *v10;
  UIScreenEdgePanGestureRecognizer *v11;
  UIScreenEdgePanGestureRecognizer *v12;
  int v13;
  CSModalHomeAffordanceControlling *homeAffordanceController;
  UIScreenEdgePanGestureRecognizer *v15;
  id v16;

  if (SBFEffectiveHomeButtonType() == 2
    || (objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "userInterfaceIdiom"),
        v3,
        (v4 & 0xFFFFFFFFFFFFFFFBLL) == 1))
  {
    v5 = -[CSDismissableModalViewController _appearState](self, "_appearState");
    bottomEdgeRecognizer = self->_bottomEdgeRecognizer;
    if (v5)
    {
      if (!bottomEdgeRecognizer)
      {
        v7 = -[UIScreenEdgePanGestureRecognizer initWithTarget:action:]([_CSScreenEdgePanGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleBottomEdgeGestureRecognizer_);
        v8 = self->_bottomEdgeRecognizer;
        self->_bottomEdgeRecognizer = &v7->super;

        -[UIScreenEdgePanGestureRecognizer setEdges:](self->_bottomEdgeRecognizer, "setEdges:", 4);
        -[UIScreenEdgePanGestureRecognizer setDelegate:](self->_bottomEdgeRecognizer, "setDelegate:", self);
        -[UIScreenEdgePanGestureRecognizer setAllowedTouchTypes:](self->_bottomEdgeRecognizer, "setAllowedTouchTypes:", &unk_1E8E89310);
        -[UIScreenEdgePanGestureRecognizer _setHysteresis:](self->_bottomEdgeRecognizer, "_setHysteresis:", 10.0);
        if ((_SBF_Private_IsD16() & 1) != 0
          || (_SBF_Private_IsD17() & 1) != 0
          || (_SBF_Private_IsD63() & 1) != 0
          || _SBF_Private_IsD64())
        {
          +[CSLockScreenDomain rootSettings](CSLockScreenDomain, "rootSettings");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "coverSheetDismissGestureSettings");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = self->_bottomEdgeRecognizer;
          objc_msgSend(v10, "edgeRegionSize");
          -[UIScreenEdgePanGestureRecognizer _setEdgeRegionSize:](v11, "_setEdgeRegionSize:");
          v12 = self->_bottomEdgeRecognizer;
          objc_msgSend(v10, "edgeRegionSize");
          -[UIScreenEdgePanGestureRecognizer _setBottomEdgeRegionSize:](v12, "_setBottomEdgeRegionSize:");

        }
        v13 = -[CSModalHomeAffordanceControlling registerHomeGestureParticipant:](self->_homeAffordanceController, "registerHomeGestureParticipant:", self);
        homeAffordanceController = self->_homeAffordanceController;
        if (v13)
        {
          if (-[CSModalHomeAffordanceControlling ownsHomeGesture](homeAffordanceController, "ownsHomeGesture"))-[CSModalHomeAffordanceControlling setHomeGestureRecognizer:](self->_homeAffordanceController, "setHomeGestureRecognizer:", self->_bottomEdgeRecognizer);
        }
        else if (homeAffordanceController)
        {
          -[CSDismissableModalViewController delegate](self, "delegate");
          v16 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "dismissForHomeButton");

        }
      }
    }
    else if (bottomEdgeRecognizer)
    {
      -[CSModalHomeAffordanceControlling setHomeGestureRecognizer:](self->_homeAffordanceController, "setHomeGestureRecognizer:", 0);
      -[CSModalHomeAffordanceControlling unregisterHomeGestureParticipant](self->_homeAffordanceController, "unregisterHomeGestureParticipant");
      v15 = self->_bottomEdgeRecognizer;
      self->_bottomEdgeRecognizer = 0;

    }
  }
}

- (void)_handleBottomEdgeGestureRecognizer:(id)a3
{
  uint64_t v4;
  BOOL v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "state");
  if ((unint64_t)(v4 - 3) >= 3)
  {
    if (v4 == 2)
    {
      -[CSDismissableModalViewController _handleBottomEdgeGestureChanged:](self, "_handleBottomEdgeGestureChanged:", v7);
    }
    else
    {
      v5 = v4 == 1;
      v6 = v7;
      if (!v5)
        goto LABEL_9;
      -[CSDismissableModalViewController _handleBottomEdgeGestureBegan:](self, "_handleBottomEdgeGestureBegan:", v7);
    }
  }
  else
  {
    -[CSDismissableModalViewController _handleBottomEdgeGestureEnded:](self, "_handleBottomEdgeGestureEnded:", v7);
  }
  v6 = v7;
LABEL_9:

}

- (void)_handleBottomEdgeGestureBegan:(id)a3
{
  UIScreenEdgePanGestureRecognizer *v4;
  id WeakRetained;
  UIScreenEdgePanGestureRecognizer *v6;

  v4 = (UIScreenEdgePanGestureRecognizer *)a3;
  if (self->_bottomEdgeRecognizer == v4)
  {
    v6 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "handleBottomEdgeGestureBegan:", v6);
    -[SBFBarSwipeBehavior barSwipeInteractionBegan:](self->_barSwipeBehavior, "barSwipeInteractionBegan:", v6);

    v4 = v6;
  }

}

- (void)_handleBottomEdgeGestureChanged:(id)a3
{
  UIScreenEdgePanGestureRecognizer *v4;
  id WeakRetained;
  UIScreenEdgePanGestureRecognizer *v6;

  v4 = (UIScreenEdgePanGestureRecognizer *)a3;
  if (self->_bottomEdgeRecognizer == v4)
  {
    v6 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "handleBottomEdgeGestureChanged:", v6);
    -[SBFBarSwipeBehavior barSwipeInteractionChanged:](self->_barSwipeBehavior, "barSwipeInteractionChanged:", v6);

    v4 = v6;
  }

}

- (void)_handleBottomEdgeGestureEnded:(id)a3
{
  UIScreenEdgePanGestureRecognizer *v4;
  id WeakRetained;
  UIScreenEdgePanGestureRecognizer *v6;

  v4 = (UIScreenEdgePanGestureRecognizer *)a3;
  if (self->_bottomEdgeRecognizer == v4)
  {
    v6 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "handleBottomEdgeGestureEnded:", v6);
    -[SBFBarSwipeBehavior barSwipeInteractionEnded:](self->_barSwipeBehavior, "barSwipeInteractionEnded:", v6);

    v4 = v6;
  }

}

- (void)_configureBarSwipeBehaviorWithGrabberViewIfNecessary:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  SBFBarSwipeBehavior *v7;
  SBFBarSwipeBehavior *barSwipeBehavior;
  id v9;

  v4 = a3;
  if (!self->_barSwipeBehavior)
  {
    v9 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_opt_respondsToSelector();

    v4 = v9;
    if ((v6 & 1) != 0)
    {
      v7 = (SBFBarSwipeBehavior *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9DB8]), "initWithGrabberView:settleAffordanceAnimationBehaviorDescription:", v9, 0);
      barSwipeBehavior = self->_barSwipeBehavior;
      self->_barSwipeBehavior = v7;

      -[SBFBarSwipeBehavior setDelegate:](self->_barSwipeBehavior, "setDelegate:", self);
      v4 = v9;
    }
  }

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return -[CSModalHomeAffordanceControlling ownsHomeGesture](self->_homeAffordanceController, "ownsHomeGesture", a3);
}

- (void)homeGestureParticipantOwningHomeGestureDidChange:(BOOL)a3
{
  UIScreenEdgePanGestureRecognizer *bottomEdgeRecognizer;

  -[CSCoverSheetViewControllerBase updateAppearanceForController:](self, "updateAppearanceForController:", self);
  if (-[CSModalHomeAffordanceControlling ownsHomeGesture](self->_homeAffordanceController, "ownsHomeGesture"))bottomEdgeRecognizer = self->_bottomEdgeRecognizer;
  else
    bottomEdgeRecognizer = 0;
  -[CSModalHomeAffordanceControlling setHomeGestureRecognizer:](self->_homeAffordanceController, "setHomeGestureRecognizer:", bottomEdgeRecognizer);
}

- (void)addGrabberView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSDismissableModalViewController _configureBarSwipeBehaviorWithGrabberViewIfNecessary:](self, "_configureBarSwipeBehaviorWithGrabberViewIfNecessary:", v4);
  -[CSDismissableModalViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addGrabberView:", v4);

}

- (double)additionalEdgeSpacingForGrabberView:(id)a3
{
  double result;

  -[SBFBarSwipeBehavior grabberViewAdditionalEdgeSpacing](self->_barSwipeBehavior, "grabberViewAdditionalEdgeSpacing", a3);
  return result;
}

- (void)homeGestureParticipantUpdateZStackPreferences:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "dismissableModalViewController:updateZStackPreferences:", self, v5);

}

- (void)barSwipeBehaviorActionPerformed:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "handleBarSwipeHomeGesturePerformed");

}

- (BOOL)handleAction:(id)a3 fromController:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id WeakRetained;
  void *v13;
  int v14;
  BOOL v15;
  _QWORD v17[5];

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  v9 = v7;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(WeakRetained, "wantsDefaultModalDismissalBehavior")
    && objc_msgSend(v6, "type") == 1)
  {
    -[CSPresentationViewController contentViewControllers](self, "contentViewControllers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "containsObject:", v11);

    if (v14)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __64__CSDismissableModalViewController_handleAction_fromController___block_invoke;
      v17[3] = &unk_1E8E2DB38;
      v17[4] = self;
      v15 = 1;
      -[CSPresentationViewController dismissContentViewController:animated:completion:](self, "dismissContentViewController:animated:completion:", v11, 1, v17);
    }
    else
    {
      -[CSCoverSheetViewControllerBase dismiss](self, "dismiss");
      v15 = 1;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __64__CSDismissableModalViewController_handleAction_fromController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismiss");
}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  void *v5;
  char v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSDismissableModalViewController;
  if (!-[CSPresentationViewController handleEvent:](&v8, sel_handleEvent_, v4)
    || (objc_msgSend(v4, "isConsumable") & 1) == 0)
  {
    if (objc_msgSend(v4, "type") != 27)
    {
      v6 = 0;
      goto LABEL_7;
    }
    -[CSDismissableModalViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissForHomeButton");

  }
  v6 = objc_msgSend(v4, "isConsumable");
LABEL_7:

  return v6;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return objc_msgSend(a3, "type") == 27;
}

- (CSDismissableModalViewControllerDelegate)delegate
{
  return (CSDismissableModalViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CSModalHomeAffordanceControlling)homeAffordanceController
{
  return self->_homeAffordanceController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeAffordanceController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_barSwipeBehavior, 0);
  objc_storeStrong((id *)&self->_bottomEdgeRecognizer, 0);
}

@end
