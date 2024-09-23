@implementation CSHostedEntityViewController

- (void)dealloc
{
  objc_super v3;

  -[BSCompoundAssertion invalidate](self->_liveContentAssertions, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CSHostedEntityViewController;
  -[CSCoverSheetViewControllerBase dealloc](&v3, sel_dealloc);
}

- (void)setHostedEntity:(id)a3
{
  CSHostableEntity *v5;
  CSCoverSheetViewPresenting **p_entityViewController;
  NSSet *v7;
  void **p_pendingActionsToDeliverToHostableEntity;
  void *v9;
  uint64_t v10;
  CSCoverSheetViewPresenting *v11;
  CSHostableEntity *v12;

  v5 = (CSHostableEntity *)a3;
  if (self->_hostedEntity != v5)
  {
    v12 = v5;
    p_entityViewController = &self->_entityViewController;
    if (self->_entityViewController)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[CSCoverSheetViewPresenting actionsToDeliverToHostableEntity](*p_entityViewController, "actionsToDeliverToHostableEntity");
        v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
        -[CSCoverSheetViewPresenting setActionsToDeliverToHostableEntity:](*p_entityViewController, "setActionsToDeliverToHostableEntity:", 0);
      }
      else
      {
        v7 = 0;
      }
      -[CSHostedEntityViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", *p_entityViewController);
      if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
        -[CSCoverSheetViewPresenting invalidateForReplacementByEntity:](*p_entityViewController, "invalidateForReplacementByEntity:", v12);
      else
        -[CSCoverSheetViewPresenting invalidate](*p_entityViewController, "invalidate");
      p_pendingActionsToDeliverToHostableEntity = (void **)&self->_entityViewController;
    }
    else
    {
      p_pendingActionsToDeliverToHostableEntity = (void **)&self->_pendingActionsToDeliverToHostableEntity;
      v7 = self->_pendingActionsToDeliverToHostableEntity;
    }
    v9 = *p_pendingActionsToDeliverToHostableEntity;
    *p_pendingActionsToDeliverToHostableEntity = 0;

    objc_storeStrong((id *)&self->_hostedEntity, a3);
    -[CSHostableEntity hostingViewController](self->_hostedEntity, "hostingViewController");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *p_entityViewController;
    *p_entityViewController = (CSCoverSheetViewPresenting *)v10;

    -[CSCoverSheetViewPresenting setEntityPresenterDelegate:](*p_entityViewController, "setEntityPresenterDelegate:", self);
    -[CSHostedEntityViewController _addEntityViewControllerIfNeeded](self, "_addEntityViewControllerIfNeeded");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[CSCoverSheetViewPresenting setActionsToDeliverToHostableEntity:](*p_entityViewController, "setActionsToDeliverToHostableEntity:", v7);
    else
      objc_storeStrong((id *)&self->_pendingActionsToDeliverToHostableEntity, v7);
    -[CSCoverSheetViewControllerBase rebuildBehavior](self, "rebuildBehavior");
    -[CSCoverSheetViewControllerBase rebuildAppearance](self, "rebuildAppearance");

    v5 = v12;
  }

}

- (id)acquireLiveContentAssertionForReason:(id)a3
{
  id v4;
  BSCompoundAssertion *liveContentAssertions;
  void *v6;
  objc_class *v7;
  void *v8;
  BSCompoundAssertion *v9;
  BSCompoundAssertion *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id location;

  v4 = a3;
  liveContentAssertions = self->_liveContentAssertions;
  if (!liveContentAssertions)
  {
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x1E0D01718];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __69__CSHostedEntityViewController_acquireLiveContentAssertionForReason___block_invoke;
    v16 = &unk_1E8E30768;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v6, "assertionWithIdentifier:stateDidChangeHandler:", v8, &v13);
    v9 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue();
    v10 = self->_liveContentAssertions;
    self->_liveContentAssertions = v9;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    liveContentAssertions = self->_liveContentAssertions;
  }
  -[BSCompoundAssertion acquireForReason:](liveContentAssertions, "acquireForReason:", v4, v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __69__CSHostedEntityViewController_acquireLiveContentAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  BSDispatchMain();
  objc_destroyWeak(&v4);

}

void __69__CSHostedEntityViewController_acquireLiveContentAssertionForReason___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateContentMode");

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSHostedEntityViewController;
  -[CSCoverSheetViewControllerBase viewDidLoad](&v3, sel_viewDidLoad);
  -[CSHostedEntityViewController _addEntityViewControllerIfNeeded](self, "_addEntityViewControllerIfNeeded");
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)aggregateBehavior:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSHostedEntityViewController;
  v4 = a3;
  -[CSCoverSheetViewControllerBase aggregateBehavior:](&v5, sel_aggregateBehavior_, v4);
  objc_msgSend(v4, "unionBehavior:", self->_entityViewController, v5.receiver, v5.super_class);

}

- (void)aggregateAppearance:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSHostedEntityViewController;
  v4 = a3;
  -[CSCoverSheetViewControllerBase aggregateAppearance:](&v5, sel_aggregateAppearance_, v4);
  objc_msgSend(v4, "unionAppearance:", self->_entityViewController, v5.receiver, v5.super_class);

}

- (void)aggregatePresentation:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSHostedEntityViewController;
  v4 = a3;
  -[CSCoverSheetViewControllerBase aggregatePresentation:](&v5, sel_aggregatePresentation_, v4);
  objc_msgSend(v4, "unionPresentation:", self->_entityViewController, v5.receiver, v5.super_class);

}

- (BOOL)canHostAnApp
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[CSCoverSheetViewPresenting canHostAnApp](self->_entityViewController, "canHostAnApp");
  else
    return 1;
}

- (BOOL)isHostingAnApp
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[CSCoverSheetViewPresenting isHostingAnApp](self->_entityViewController, "isHostingAnApp");
  else
    return !-[CSCoverSheetViewControllerBase isDisappeared](self, "isDisappeared");
}

- (id)hostedAppSceneHandle
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CSCoverSheetViewPresenting hostedAppSceneHandle](self->_entityViewController, "hostedAppSceneHandle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)hostedAppSceneHandles
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CSCoverSheetViewPresenting hostedAppSceneHandles](self->_entityViewController, "hostedAppSceneHandles");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setInvalidationHandler:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CSCoverSheetViewPresenting setInvalidationHandler:](self->_entityViewController, "setInvalidationHandler:", v4);

}

- (id)traitsParticipantForSceneHandle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CSCoverSheetViewPresenting traitsParticipantForSceneHandle:](self->_entityViewController, "traitsParticipantForSceneHandle:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setHostedAppReferenceSize:(CGSize)a3 withInterfaceOrientation:(int64_t)a4
{
  double height;
  double width;

  height = a3.height;
  width = a3.width;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CSCoverSheetViewPresenting setHostedAppReferenceSize:withInterfaceOrientation:](self->_entityViewController, "setHostedAppReferenceSize:withInterfaceOrientation:", a4, width, height);
}

- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CSCoverSheetViewPresenting hostedAppWillRotateToInterfaceOrientation:](self->_entityViewController, "hostedAppWillRotateToInterfaceOrientation:", a3);
}

- (BOOL)handlesRotationIndependentOfCoverSheet
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[CSCoverSheetViewPresenting handlesRotationIndependentOfCoverSheet](self->_entityViewController, "handlesRotationIndependentOfCoverSheet");
  else
    return 0;
}

- (int64_t)hostableEntityContentMode
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[CSCoverSheetViewPresenting hostableEntityContentMode](self->_entityViewController, "hostableEntityContentMode");
  else
    return 2;
}

- (void)setHostableEntityContentMode:(int64_t)a3
{
  self->_desiredContentMode = a3;
  -[CSHostedEntityViewController _updateContentMode](self, "_updateContentMode");
}

- (NSSet)actionsToDeliverToHostableEntity
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CSCoverSheetViewPresenting actionsToDeliverToHostableEntity](self->_entityViewController, "actionsToDeliverToHostableEntity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSSet *)v3;
}

- (void)setActionsToDeliverToHostableEntity:(id)a3
{
  char v4;
  CSCoverSheetViewPresenting *entityViewController;
  NSSet *v6;
  NSSet *pendingActionsToDeliverToHostableEntity;
  id v8;

  v8 = a3;
  v4 = objc_opt_respondsToSelector();
  entityViewController = self->_entityViewController;
  if ((v4 & 1) != 0)
  {
    -[CSCoverSheetViewPresenting setActionsToDeliverToHostableEntity:](entityViewController, "setActionsToDeliverToHostableEntity:", v8);
  }
  else if (!entityViewController)
  {
    v6 = (NSSet *)objc_msgSend(v8, "copy");
    pendingActionsToDeliverToHostableEntity = self->_pendingActionsToDeliverToHostableEntity;
    self->_pendingActionsToDeliverToHostableEntity = v6;

  }
}

- (int64_t)hostableEntityOrientation
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[CSCoverSheetViewPresenting hostableEntityOrientation](self->_entityViewController, "hostableEntityOrientation");
  else
    return 0;
}

- (SBApplicationSceneHandle)sceneHandleForTraitsParticipant
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CSCoverSheetViewPresenting sceneHandleForTraitsParticipant](self->_entityViewController, "sceneHandleForTraitsParticipant");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (SBApplicationSceneHandle *)v3;
}

- (FBScene)sceneForTraitsParticipant
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CSCoverSheetViewPresenting sceneForTraitsParticipant](self->_entityViewController, "sceneForTraitsParticipant");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FBScene *)v3;
}

- (SBHomeGrabberView)homeGrabberView
{
  return (SBHomeGrabberView *)self->_grabberView;
}

- (void)setHomeGrabberView:(id)a3
{
  UIView **p_grabberView;
  void *v6;
  UIView *v7;
  id v8;

  p_grabberView = &self->_grabberView;
  v8 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    -[UIView removeFromSuperview](*p_grabberView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_grabberView, a3);
    -[CSHostedEntityViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *p_grabberView;
    objc_msgSend(v6, "bounds");
    -[UIView setFrame:](v7, "setFrame:");
    -[UIView setAutoresizingMask:](*p_grabberView, "setAutoresizingMask:", 18);
    objc_msgSend(v6, "addSubview:", *p_grabberView);

  }
}

- (void)hostableEntityPresenter:(id)a3 didBeginHosting:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[CSHostedEntityViewController entityPresenterDelegate](self, "entityPresenterDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "hostableEntityPresenter:didBeginHosting:", self, v6);

}

- (void)hostableEntityPresenter:(id)a3 didEndHosting:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[CSHostedEntityViewController entityPresenterDelegate](self, "entityPresenterDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "hostableEntityPresenter:didEndHosting:", self, v6);

}

- (void)hostableEntityPresenter:(id)a3 didFailToActivate:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[CSHostedEntityViewController entityPresenterDelegate](self, "entityPresenterDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "hostableEntityPresenter:didFailToActivate:", self, v6);

}

- (SBApplicationSceneHandle)applicationSceneHandle
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CSCoverSheetViewPresenting applicationSceneHandle](self->_entityViewController, "applicationSceneHandle");
  else
    -[CSHostedEntityViewController hostedAppSceneHandle](self, "hostedAppSceneHandle");
  return (SBApplicationSceneHandle *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)addGrabberView:(id)a3
{
  id v4;
  Class v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v5 = NSClassFromString(CFSTR("SBHomeGrabberView"));
  v8 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v8;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7)
    -[CSHostedEntityViewController setHomeGrabberView:](self, "setHomeGrabberView:", v7);

}

- (BOOL)wantsDefaultModalDismissalBehavior
{
  return 1;
}

- (void)invalidate
{
  CSCoverSheetViewPresenting *entityViewController;
  CSHostableEntity *hostedEntity;

  -[CSCoverSheetViewPresenting invalidate](self->_entityViewController, "invalidate");
  entityViewController = self->_entityViewController;
  self->_entityViewController = 0;

  hostedEntity = self->_hostedEntity;
  self->_hostedEntity = 0;

}

- (int64_t)_effectiveContentMode
{
  int64_t desiredContentMode;

  desiredContentMode = self->_desiredContentMode;
  if (-[BSCompoundAssertion isActive](self->_liveContentAssertions, "isActive")
    && self->_entityViewController)
  {
    return 2;
  }
  return desiredContentMode;
}

- (void)_updateContentMode
{
  int64_t v3;

  v3 = -[CSHostedEntityViewController _effectiveContentMode](self, "_effectiveContentMode");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CSCoverSheetViewPresenting setHostableEntityContentMode:](self->_entityViewController, "setHostableEntityContentMode:", v3);
}

- (void)_addEntityViewControllerIfNeeded
{
  void *v3;
  CSHostedEntityViewController *v4;
  void *v6;
  CSCoverSheetViewPresenting *entityViewController;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  CSHostedEntityViewController *v12;

  -[CSHostedEntityViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewPresenting parentViewController](self->_entityViewController, "parentViewController");
  v4 = (CSHostedEntityViewController *)objc_claimAutoreleasedReturnValue();

  if (v4 != self && v3 != 0)
  {
    -[CSHostedEntityViewController _updateContentMode](self, "_updateContentMode");
    -[CSCoverSheetViewPresenting view](self->_entityViewController, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    entityViewController = self->_entityViewController;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__CSHostedEntityViewController__addEntityViewControllerIfNeeded__block_invoke;
    v9[3] = &unk_1E8E2F730;
    v10 = v6;
    v11 = v3;
    v12 = self;
    v8 = v6;
    -[CSHostedEntityViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", entityViewController, 0, v9);

  }
}

void __64__CSHostedEntityViewController__addEntityViewControllerIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(void);

  v4 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  objc_msgSend(v3, "setFrame:");
  objc_msgSend(*(id *)(a1 + 32), "setAutoresizingMask:", 18);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 48) + 1064))
    objc_msgSend(*(id *)(a1 + 40), "bringSubviewToFront:");
  v4[2]();

}

- (CSHostableEntity)hostedEntity
{
  return self->_hostedEntity;
}

- (CSHostableEntityPresenterDelegate)entityPresenterDelegate
{
  return (CSHostableEntityPresenterDelegate *)objc_loadWeakRetained((id *)&self->_entityPresenterDelegate);
}

- (void)setEntityPresenterDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_entityPresenterDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_entityPresenterDelegate);
  objc_storeStrong((id *)&self->_hostedEntity, 0);
  objc_storeStrong((id *)&self->_liveContentAssertions, 0);
  objc_storeStrong((id *)&self->_pendingActionsToDeliverToHostableEntity, 0);
  objc_storeStrong((id *)&self->_grabberView, 0);
  objc_storeStrong((id *)&self->_entityViewController, 0);
}

@end
