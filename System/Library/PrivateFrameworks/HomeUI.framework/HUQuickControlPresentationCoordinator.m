@implementation HUQuickControlPresentationCoordinator

uint64_t __82__HUQuickControlPresentationCoordinator_initWithTargetView_delegate_cornerRadius___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prepareForTapticFeedback");
}

- (void)_installGestureRecognizer
{
  void *v3;
  void *v4;
  void *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HUTouchGestureRecognizer *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__handleDoubleTapGesture_);
    -[HUQuickControlPresentationCoordinator setDoubleTapGestureRecognizer:](self, "setDoubleTapGestureRecognizer:", v3);

    -[HUQuickControlPresentationCoordinator doubleTapGestureRecognizer](self, "doubleTapGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNumberOfTapsRequired:", 2);

    -[HUQuickControlPresentationCoordinator doubleTapGestureRecognizer](self, "doubleTapGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setName:", CFSTR("doubleTapGestureRecognizer"));

    -[HUQuickControlPresentationCoordinator doubleTapGestureRecognizer](self, "doubleTapGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMaximumIntervalBetweenSuccessiveTaps:", 0.15);

    -[HUQuickControlPresentationCoordinator doubleTapGestureRecognizer](self, "doubleTapGestureRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", self);

    -[HUQuickControlPresentationCoordinator _gestureInstallationView](self, "_gestureInstallationView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator doubleTapGestureRecognizer](self, "doubleTapGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addGestureRecognizer:", v9);
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEACA8]), "initWithDelegate:", self);
    -[HUQuickControlPresentationCoordinator setPresentationInteraction:](self, "setPresentationInteraction:", v10);

    -[HUQuickControlPresentationCoordinator presentationInteraction](self, "presentationInteraction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "gestureRecognizerForExclusionRelationship");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", self);

    -[HUQuickControlPresentationCoordinator presentationInteraction](self, "presentationInteraction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAllowSimultaneousRecognition:", 1);

    -[HUQuickControlPresentationCoordinator _gestureInstallationView](self, "_gestureInstallationView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator presentationInteraction](self, "presentationInteraction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addInteraction:", v9);
  }

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__handleSingleTapGesture_);
  -[HUQuickControlPresentationCoordinator setSingleTapGestureRecognizer:](self, "setSingleTapGestureRecognizer:", v14);

  -[HUQuickControlPresentationCoordinator singleTapGestureRecognizer](self, "singleTapGestureRecognizer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDelegate:", self);

  -[HUQuickControlPresentationCoordinator singleTapGestureRecognizer](self, "singleTapGestureRecognizer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelaysTouchesEnded:", 1);

  -[HUQuickControlPresentationCoordinator singleTapGestureRecognizer](self, "singleTapGestureRecognizer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setName:", CFSTR("singleTapGestureRecognizer"));

  -[HUQuickControlPresentationCoordinator _gestureInstallationView](self, "_gestureInstallationView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator singleTapGestureRecognizer](self, "singleTapGestureRecognizer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addGestureRecognizer:", v19);

  v20 = -[HUTouchGestureRecognizer initWithTarget:action:]([HUTouchGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleTouchGesture_);
  -[HUQuickControlPresentationCoordinator setTouchGestureRecognizer:](self, "setTouchGestureRecognizer:", v20);

  -[HUQuickControlPresentationCoordinator touchGestureRecognizer](self, "touchGestureRecognizer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDelegate:", self);

  -[HUQuickControlPresentationCoordinator touchGestureRecognizer](self, "touchGestureRecognizer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDelaysTouchesEnded:", 1);

  -[HUQuickControlPresentationCoordinator touchGestureRecognizer](self, "touchGestureRecognizer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setName:", CFSTR("touchGestureRecognizer"));

  -[HUQuickControlPresentationCoordinator _gestureInstallationView](self, "_gestureInstallationView");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator touchGestureRecognizer](self, "touchGestureRecognizer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addGestureRecognizer:", v24);

}

- (HUTouchGestureRecognizer)touchGestureRecognizer
{
  return self->_touchGestureRecognizer;
}

- (UITapGestureRecognizer)singleTapGestureRecognizer
{
  return self->_singleTapGestureRecognizer;
}

- (UIView)targetView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_targetView);
}

- (_UIClickPresentationInteraction)presentationInteraction
{
  return self->_presentationInteraction;
}

- (void)setTouchGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_touchGestureRecognizer, a3);
}

- (void)setSingleTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_singleTapGestureRecognizer, a3);
}

- (void)setPresentationInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_presentationInteraction, a3);
}

- (void)_prepareForTapticFeedback
{
  void *v3;
  void *v4;
  id v5;

  -[HUQuickControlPresentationCoordinator feedbackGenerator](self, "feedbackGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA660]), "initWithStyle:", 4);
    -[HUQuickControlPresentationCoordinator setFeedbackGenerator:](self, "setFeedbackGenerator:", v4);

    -[HUQuickControlPresentationCoordinator feedbackGenerator](self, "feedbackGenerator");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prepare");

  }
}

- (UIImpactFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackGenerator, a3);
}

- (HUQuickControlPresentationCoordinator)initWithTargetView:(id)a3 delegate:(id)a4 cornerRadius:(double)a5
{
  id v8;
  id v9;
  HUQuickControlPresentationCoordinator *v10;
  HUQuickControlPresentationCoordinator *v11;
  uint64_t v12;
  NSMapTable *pressedItemContexts;
  uint64_t v14;
  NSMutableSet *mutuallyExclusiveGestureRecognizers;
  void *v16;
  _QWORD v18[4];
  HUQuickControlPresentationCoordinator *v19;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HUQuickControlPresentationCoordinator;
  v10 = -[HUQuickControlPresentationCoordinator init](&v20, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_targetView, v8);
    objc_storeWeak((id *)&v11->_delegate, v9);
    v11->_cornerRadius = a5;
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 512, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    pressedItemContexts = v11->_pressedItemContexts;
    v11->_pressedItemContexts = (NSMapTable *)v12;

    v14 = objc_opt_new();
    mutuallyExclusiveGestureRecognizers = v11->_mutuallyExclusiveGestureRecognizers;
    v11->_mutuallyExclusiveGestureRecognizers = (NSMutableSet *)v14;

    -[HUQuickControlPresentationCoordinator _installGestureRecognizer](v11, "_installGestureRecognizer");
    objc_msgSend(MEMORY[0x1E0D519E8], "globalAsyncScheduler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __82__HUQuickControlPresentationCoordinator_initWithTargetView_delegate_cornerRadius___block_invoke;
    v18[3] = &unk_1E6F4D988;
    v19 = v11;
    objc_msgSend(v16, "performBlock:", v18);

  }
  return v11;
}

- (HUQuickControlPresentationCoordinator)initWithTargetView:(id)a3 delegate:(id)a4
{
  return -[HUQuickControlPresentationCoordinator initWithTargetView:delegate:cornerRadius:](self, "initWithTargetView:delegate:cornerRadius:", a3, a4, 20.0);
}

- (void)addMutuallyExclusiveGestureRecognizer:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HUQuickControlPresentationCoordinator mutuallyExclusiveGestureRecognizers](self, "mutuallyExclusiveGestureRecognizers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v7);

  if ((v5 & 1) == 0)
  {
    -[HUQuickControlPresentationCoordinator mutuallyExclusiveGestureRecognizers](self, "mutuallyExclusiveGestureRecognizers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

    objc_msgSend(v7, "addTarget:action:", self, sel__handleMutuallyExclusiveGesture_);
  }

}

- (NSMutableSet)mutuallyExclusiveGestureRecognizers
{
  return self->_mutuallyExclusiveGestureRecognizers;
}

- (HUQuickControlPresentationCoordinator)initWithCornerRadius:(double)a3
{
  return -[HUQuickControlPresentationCoordinator initWithTargetView:delegate:cornerRadius:](self, "initWithTargetView:delegate:cornerRadius:", 0, 0, a3);
}

- (UITraitCollection)traitCollection
{
  void *v3;
  void *v4;

  -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollectionForPresentationCoordinator:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITraitCollection *)v4;
}

- (UIViewController)presentingViewController
{
  void *v2;
  void *v3;

  -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewController *)v3;
}

- (HUPressedItemContext)activePressedItemContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HUQuickControlPresentationCoordinator pressedItemContexts](self, "pressedItemContexts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (HUPressedItemContext *)v6;
}

- (void)setPresentationContext:(id)a3
{
  HUQuickControlPresentationContext *v4;
  void *v5;
  void *v6;
  HUQuickControlPresentationContext *presentationContext;

  v4 = (HUQuickControlPresentationContext *)a3;
  if (v4)
    -[HUQuickControlPresentationCoordinator _validatePresentationContext:](self, "_validatePresentationContext:", v4);
  -[HUQuickControlPresentationContext itemManager](self->_presentationContext, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", 0);

  -[HUQuickControlPresentationContext itemManager](v4, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  presentationContext = self->_presentationContext;
  self->_presentationContext = v4;

}

- (void)removeMutuallyExclusiveGestureRecognizer:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HUQuickControlPresentationCoordinator mutuallyExclusiveGestureRecognizers](self, "mutuallyExclusiveGestureRecognizers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v7);

  if (v5)
  {
    -[HUQuickControlPresentationCoordinator mutuallyExclusiveGestureRecognizers](self, "mutuallyExclusiveGestureRecognizers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v7);

    objc_msgSend(v7, "removeTarget:action:", self, sel__handleMutuallyExclusiveGesture_);
  }

}

- (void)setIsEditing:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;

  if (self->_isEditing != a3)
  {
    v3 = a3;
    self->_isEditing = a3;
    -[HUQuickControlPresentationCoordinator presentationInteraction](self, "presentationInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[HUQuickControlPresentationCoordinator _gestureInstallationView](self, "_gestureInstallationView");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlPresentationCoordinator presentationInteraction](self, "presentationInteraction");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
        objc_msgSend(v7, "removeInteraction:", v6);
      else
        objc_msgSend(v7, "addInteraction:", v6);

    }
  }
}

- (id)createNavigationControllerForPresentationContext:(id)a3
{
  -[HUQuickControlPresentationCoordinator setPresentationContext:](self, "setPresentationContext:", a3);
  return -[HUQuickControlPresentationCoordinator _buildCardNavigationController](self, "_buildCardNavigationController");
}

- (void)playBounceForItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[HUQuickControlPresentationCoordinator pressedItemContexts](self, "pressedItemContexts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "isUserInitiated") || (objc_msgSend(v5, "isActive") & 1) == 0)
  {
    if (v5)
    {
      -[HUQuickControlPresentationCoordinator _configureInitialStateForPressedItemContext:userInitiated:](self, "_configureInitialStateForPressedItemContext:userInitiated:", v5, 0);
    }
    else
    {
      -[HUQuickControlPresentationCoordinator _createPressedContextForItem:userInitiated:](self, "_createPressedContextForItem:userInitiated:", v8, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlPresentationCoordinator pressedItemContexts](self, "pressedItemContexts");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v5, v8);

      objc_msgSend(v5, "applier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "start");

    }
    -[HUQuickControlPresentationCoordinator _initiateProgrammaticBounceForItem:](self, "_initiateProgrammaticBounceForItem:", v8);
  }

}

- (void)_handleMutuallyExclusiveGesture:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (objc_msgSend(a3, "state") == 1)
  {
    -[HUQuickControlPresentationCoordinator presentationInteraction](self, "presentationInteraction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gestureRecognizerForExclusionRelationship");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", 0);

    -[HUQuickControlPresentationCoordinator presentationInteraction](self, "presentationInteraction");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "gestureRecognizerForExclusionRelationship");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", 1);

  }
}

- (void)_handleSingleTapGesture:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  objc_class *v8;
  void *v9;
  const char *v10;
  objc_class *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char isKindOfClass;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  int v53;
  void *v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
  {
    v5 = -[HUQuickControlPresentationCoordinator isQuickControlPresented](self, "isQuickControlPresented");
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = 138412546;
        v54 = v9;
        v55 = 2112;
        v56 = v4;
        v10 = "%@+Controls ignoring single tap gesture %@ because quick control is presented";
LABEL_7:
        _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v53, 0x16u);

      }
    }
    else
    {
      if (v7)
      {
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = 138412546;
        v54 = v13;
        v55 = 2112;
        v56 = v4;
        _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@+Controls handling single tap gesture %@", (uint8_t *)&v53, 0x16u);

      }
      -[HUQuickControlPresentationCoordinator targetView](self, "targetView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "locationInView:", v14);
      v16 = v15;
      v18 = v17;

      -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "presentationCoordinator:contextForPresentationAtPoint:", self, v16, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlPresentationCoordinator setPresentationContext:](self, "setPresentationContext:", v20);

      v21 = (void *)MEMORY[0x1E0D31170];
      -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
      v22 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "logAndSendTileInteractionEventOfType:withPresentationContext:presentationCoordinator:", 1, v22, self);

      -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v22) = objc_opt_respondsToSelector();

      if ((v22 & 1) != 0)
      {
        -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "presentationCoordinatorSendTileInteractionEventOfType:withPresentationContext:presentationCoordinator:", 1, v25, self);

      }
      -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "item");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        +[HUEnergyAnalytics saveTapEvent:withInteractionType:](HUEnergyAnalytics, "saveTapEvent:withInteractionType:", 46, 1);
      -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "item");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlPresentationCoordinator _preparePressedItemContextForItem:startApplier:](self, "_preparePressedItemContextForItem:startApplier:", v30, 1);

      -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "item");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlPresentationCoordinator _initiateProgrammaticBounceForItem:](self, "_initiateProgrammaticBounceForItem:", v32);

      objc_opt_class();
      -[HUQuickControlPresentationCoordinator _gestureInstallationView](self, "_gestureInstallationView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v34 = v33;
      else
        v34 = 0;
      v6 = v34;

      if (v6)
      {
        -[NSObject indexPathForItemAtPoint:](v6, "indexPathForItemAtPoint:", v16, v18);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35)
        {
          -[NSObject cellForItemAtIndexPath:](v6, "cellForItemAtIndexPath:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseLegacyQuickControlPresentation") & 1) != 0)
          {
            -[HUQuickControlPresentationCoordinator setPressedTile_legacy:](self, "setPressedTile_legacy:", v36);
          }
          else
          {
            v37 = v36;
            if (objc_msgSend(v37, "conformsToProtocol:", &unk_1EF253B20))
              v38 = v37;
            else
              v38 = 0;
            v39 = v38;

            -[HUQuickControlPresentationCoordinator setPressedTile:](self, "setPressedTile:", v39);
          }

        }
      }
      -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_opt_respondsToSelector();

      if ((v41 & 1) != 0)
      {
        -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "item");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "tappedArea");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "presentationCoordinator:didRecognizeTapForItem:tappedArea:", self, v44, v46);

      }
      -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_opt_respondsToSelector();

      if ((v48 & 1) == 0)
        goto LABEL_31;
      -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "item");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v49, "presentationCoordinator:shouldAllowTapticFeedbackForItem:", self, v51);

      if (v52)
LABEL_31:
        -[HUQuickControlPresentationCoordinator _actuateTapticFeedback](self, "_actuateTapticFeedback");
    }
  }
  else
  {
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = 138412546;
      v54 = v9;
      v55 = 2112;
      v56 = v4;
      v10 = "%@+Controls ignoring single tap gesture %@ because its state isn't recognized";
      goto LABEL_7;
    }
  }

}

- (void)_handleTouchGesture:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v4 = objc_msgSend(v24, "state");
  if ((unint64_t)(v4 - 3) >= 2)
  {
    if (v4 == 1)
    {
      objc_opt_class();
      -[HUQuickControlPresentationCoordinator _gestureInstallationView](self, "_gestureInstallationView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
      v14 = v13;

      -[HUQuickControlPresentationCoordinator targetView](self, "targetView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "locationInView:", v15);
      v17 = v16;
      v19 = v18;

      objc_msgSend(v14, "indexPathForItemAtPoint:", v17, v19);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        goto LABEL_12;
      -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "presentationCoordinator:contextForPresentationAtPoint:", self, v17, v19);
      v21 = objc_claimAutoreleasedReturnValue();
      -[HUQuickControlPresentationCoordinator setPresentationContext:](self, "setPresentationContext:", v21);

      -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v21) = objc_opt_respondsToSelector();

      if ((v21 & 1) == 0)
        goto LABEL_12;
      -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "item");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "tappedArea");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "presentationCoordinator:touchDidBeginForItem:tappedArea:", self, v10, v23);

LABEL_11:
LABEL_12:

    }
  }
  else
  {
    -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "item");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "tappedArea");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "presentationCoordinator:touchDidEndForItem:tappedArea:", self, v9, v11);
      goto LABEL_11;
    }
  }

}

- (void)_handleDoubleTapGesture:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;

  v26 = a3;
  if (objc_msgSend(v26, "state") == 3)
  {
    -[HUQuickControlPresentationCoordinator targetView](self, "targetView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "locationInView:", v4);
    v6 = v5;
    v8 = v7;

    -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presentationCoordinator:contextForPresentationAtPoint:", self, v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
LABEL_24:

      goto LABEL_25;
    }
    objc_msgSend(MEMORY[0x1E0D31170], "logAndSendTileInteractionEventOfType:withPresentationContext:presentationCoordinator:", 2, v10, self);
    -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "presentationCoordinatorSendTileInteractionEventOfType:withPresentationContext:presentationCoordinator:", 2, v10, self);

    }
    objc_opt_class();
    -[HUQuickControlPresentationCoordinator _gestureInstallationView](self, "_gestureInstallationView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    if (v16)
    {
      objc_msgSend(v16, "indexPathForItemAtPoint:", v6, v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(v16, "cellForItemAtIndexPath:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUQuickControlPresentationCoordinator setPressedTile_legacy:](self, "setPressedTile_legacy:", v18);
        if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseLegacyQuickControlPresentation") & 1) != 0)
        {
          -[HUQuickControlPresentationCoordinator setPressedTile_legacy:](self, "setPressedTile_legacy:", v18);
        }
        else
        {
          v19 = v18;
          if (objc_msgSend(v19, "conformsToProtocol:", &unk_1EF253B20))
            v20 = v19;
          else
            v20 = 0;
          v21 = v20;

          if (!objc_msgSend(v21, "recognizeDoubleClickGesture"))
          {

            goto LABEL_23;
          }
          v22 = v19;
          if (objc_msgSend(v22, "conformsToProtocol:", &unk_1EF253B20))
            v23 = v22;
          else
            v23 = 0;
          v24 = v23;

          -[HUQuickControlPresentationCoordinator setPressedTile:](self, "setPressedTile:", v24);
        }

      }
    }
    v25 = -[HUQuickControlPresentationCoordinator presentQuickControlWithContext:animated:](self, "presentQuickControlWithContext:animated:", v10, 1);
LABEL_23:

    goto LABEL_24;
  }
LABEL_25:

}

- (void)_handlePressGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  HUQuickControlPresentationCoordinator *v11;
  uint64_t v12;

  v4 = a3;
  -[HUQuickControlPresentationCoordinator targetView](self, "targetView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  v10 = objc_msgSend(v4, "state");
  switch(v10)
  {
    case 4:
      v11 = self;
      v12 = 0;
LABEL_7:
      -[HUQuickControlPresentationCoordinator _pressGestureDidEnd:](v11, "_pressGestureDidEnd:", v12);
      return;
    case 3:
      v11 = self;
      v12 = 1;
      goto LABEL_7;
    case 1:
      -[HUQuickControlPresentationCoordinator _pressGestureDidBeginWithLocation:](self, "_pressGestureDidBeginWithLocation:", v7, v9);
      break;
  }
}

- (void)_pressGestureDidBeginWithLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  y = a3.y;
  x = a3.x;
  -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentationCoordinator:contextForPresentationAtPoint:", self, x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator setPresentationContext:](self, "setPresentationContext:", v7);

  -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator _preparePressedItemContextForItem:startApplier:](self, "_preparePressedItemContextForItem:startApplier:", v9, 1);

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __75__HUQuickControlPresentationCoordinator__pressGestureDidBeginWithLocation___block_invoke;
  v15 = &unk_1E6F4DD08;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v10, "afterDelay:performBlock:", &v12, 0.15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator setPressGestureActiveTimerCancellationToken:](self, "setPressGestureActiveTimerCancellationToken:", v11, v12, v13, v14, v15);

  -[HUQuickControlPresentationCoordinator _prepareForTapticFeedback](self, "_prepareForTapticFeedback");
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __75__HUQuickControlPresentationCoordinator__pressGestureDidBeginWithLocation___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_pressGestureDidBecomeActive");

}

- (void)_pressGestureDidBecomeActive
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[HUQuickControlPresentationCoordinator mutuallyExclusiveGestureRecognizers](self, "mutuallyExclusiveGestureRecognizers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "isEnabled"))
        {
          objc_msgSend(v7, "setEnabled:", 0);
          objc_msgSend(v7, "setEnabled:", 1);
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_pressGestureDidEnd:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v3 = a3;
  -[HUQuickControlPresentationCoordinator pressGestureActiveTimerCancellationToken](self, "pressGestureActiveTimerCancellationToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  -[HUQuickControlPresentationCoordinator setPressGestureActiveTimerCancellationToken:](self, "setPressGestureActiveTimerCancellationToken:", 0);
  -[HUQuickControlPresentationCoordinator activePressedItemContext](self, "activePressedItemContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v26 = v6;
    objc_msgSend(v6, "applier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCompletesWhenAtRest:", 1);

    objc_msgSend(v26, "setActive:", 0);
    v8 = CACurrentMediaTime();
    objc_msgSend(v26, "beginTime");
    v6 = v26;
    if (v3)
    {
      v10 = v8 - v9;
      v11 = (void *)MEMORY[0x1E0D31170];
      -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 <= 0.25)
      {
        objc_msgSend(v11, "logAndSendTileInteractionEventOfType:withPresentationContext:presentationCoordinator:", 1, v12, self);

        -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_opt_respondsToSelector();

        if ((v18 & 1) != 0)
        {
          -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "presentationCoordinatorSendTileInteractionEventOfType:withPresentationContext:presentationCoordinator:", 1, v20, self);

        }
        -[HUQuickControlPresentationCoordinator quickControlViewController](self, "quickControlViewController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          goto LABEL_12;
        -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_opt_respondsToSelector();

        v6 = v26;
        if ((v22 & 1) != 0)
        {
          -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "item");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "tappedArea");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "presentationCoordinator:didRecognizeTapForItem:tappedArea:", self, v23, v25);

          goto LABEL_11;
        }
      }
      else
      {
        objc_msgSend(v11, "logAndSendTileInteractionEventOfType:withPresentationContext:presentationCoordinator:", 3, v12, self);

        -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_opt_respondsToSelector();

        v6 = v26;
        if ((v14 & 1) != 0)
        {
          -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "presentationCoordinatorSendTileInteractionEventOfType:withPresentationContext:presentationCoordinator:", 3, v16, self);
LABEL_11:

LABEL_12:
          v6 = v26;
        }
      }
    }
  }

}

- (id)_sheetPresentationControllerViewForTouchContinuation:(id)a3
{
  return 0;
}

- (BOOL)clickPresentationInteractionShouldBegin:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  BOOL v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;

  v4 = a3;
  -[HUQuickControlPresentationCoordinator targetView](self, "targetView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  objc_msgSend(v4, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0
    && (-[HUQuickControlPresentationCoordinator delegate](self, "delegate"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "presentationCoordinator:shouldBeginInteractivePresentationWithTouchLocation:view:", self, v10, v7, v9), v13, !v14))
  {
    v20 = 0;
  }
  else
  {
    objc_opt_class();
    -[HUQuickControlPresentationCoordinator _gestureInstallationView](self, "_gestureInstallationView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    if (v17)
    {
      objc_msgSend(v17, "indexPathForItemAtPoint:", v7, v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(v17, "cellForItemAtIndexPath:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseLegacyQuickControlPresentation") & 1) != 0)
        {
          -[HUQuickControlPresentationCoordinator setPressedTile_legacy:](self, "setPressedTile_legacy:", v19);
        }
        else
        {
          v21 = v19;
          if (objc_msgSend(v21, "conformsToProtocol:", &unk_1EF253B20))
            v22 = v21;
          else
            v22 = 0;
          v23 = v22;

          -[HUQuickControlPresentationCoordinator setPressedTile:](self, "setPressedTile:", v23);
        }
        -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "presentationCoordinator:contextForPresentationAtPoint:", self, v7, v9);
        v25 = objc_claimAutoreleasedReturnValue();
        -[HUQuickControlPresentationCoordinator setPresentationContext:](self, "setPresentationContext:", v25);

        -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v25) = objc_opt_respondsToSelector();

        if ((v25 & 1) != 0
          && (-[HUQuickControlPresentationCoordinator delegate](self, "delegate"),
              v27 = (void *)objc_claimAutoreleasedReturnValue(),
              -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext"),
              v28 = (void *)objc_claimAutoreleasedReturnValue(),
              v29 = objc_msgSend(v27, "presentationCoordinator:shouldBeginLongPressPresentationWithContext:", self, v28),
              v28,
              v27,
              !v29))
        {
          v20 = 0;
        }
        else
        {
          -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "item");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUQuickControlPresentationCoordinator _preparePressedItemContextForItem:startApplier:](self, "_preparePressedItemContextForItem:startApplier:", v31, 0);

          v20 = 1;
        }

      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }

  }
  return v20;
}

- (id)clickPresentationInteraction:(id)a3 previewForHighlightingAtLocation:(CGPoint)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;

  if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseLegacyQuickControlPresentation", a3, a4.x, a4.y) & 1) != 0)
  {
    -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0CEAF20]);
      -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v8 = (void *)v7;
      v5 = (void *)objc_msgSend(v6, "initWithView:", v7);

    }
  }
  else
  {
    -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0CEAF20]);
      -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  return v5;
}

- (BOOL)clickPresentationInteractionShouldPresent:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v15;

  -[HUQuickControlPresentationCoordinator delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "presentationCoordinator:shouldBeginLongPressPresentationWithContext:", self, v7);

    if (!v8)
      return 0;
  }
  v9 = (void *)MEMORY[0x1E0D31170];
  -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logAndSendTileInteractionEventOfType:withPresentationContext:presentationCoordinator:", 3, v10, self);

  -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "presentationCoordinatorSendTileInteractionEventOfType:withPresentationContext:presentationCoordinator:", 3, v13, self);

  }
  v14 = 1;
  v15 = -[HUQuickControlPresentationCoordinator _beginControlPresentationAnimated:](self, "_beginControlPresentationAnimated:", 1);
  return v14;
}

- (void)clickPresentationInteractionEnded:(id)a3 wasCancelled:(BOOL)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (a4 && !-[HUQuickControlPresentationCoordinator isQuickControlPresented](self, "isQuickControlPresented", a3))
  {
    -[HUQuickControlPresentationCoordinator singleTapGestureRecognizer](self, "singleTapGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "state");

    if (v6 == 5)
    {
      -[HUQuickControlPresentationCoordinator activePressedItemContext](self, "activePressedItemContext");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "item");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlPresentationCoordinator _updateOverrideAttributesWithScale:forItem:](self, "_updateOverrideAttributesWithScale:forItem:", v7, 1.0);

    }
  }
}

- (id)clickPresentationInteraction:(id)a3 presentationForPresentingViewController:(id)a4
{
  return 0;
}

- (unint64_t)activationStyleForClickPresentationInteraction:(id)a3
{
  if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials", a3))
    return 2;
  else
    return 0;
}

- (BOOL)shouldDismissWholePresentationHierarchy
{
  return 0;
}

- (void)_createTransitionViewsForPresentation
{
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseLegacyQuickControlPresentation") & 1) != 0)
    -[HUQuickControlPresentationCoordinator __createLegacyTransitionViewsForPresentation](self, "__createLegacyTransitionViewsForPresentation");
  else
    -[HUQuickControlPresentationCoordinator __createTransitionViewsForPresentation](self, "__createTransitionViewsForPresentation");
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  v8 = (void *)MEMORY[0x1E0D319D0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  if ((objc_msgSend(v8, "shouldUseLegacyQuickControlPresentation") & 1) != 0)
    -[HUQuickControlPresentationCoordinator _legacyAnimationControllerForPresentedController:presentingController:sourceController:](self, "_legacyAnimationControllerForPresentedController:presentingController:sourceController:", v11, v10, v9);
  else
    -[HUQuickControlPresentationCoordinator _animationControllerForPresentedController:presentingController:sourceController:](self, "_animationControllerForPresentedController:presentingController:sourceController:", v11, v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_createTransitionViewsForDismissal
{
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseLegacyQuickControlPresentation") & 1) != 0)
    -[HUQuickControlPresentationCoordinator __createLegacyTransitionViewsForDismissal](self, "__createLegacyTransitionViewsForDismissal");
  else
    -[HUQuickControlPresentationCoordinator __createTransitionViewsForDismissal](self, "__createTransitionViewsForDismissal");
}

- (id)animationControllerForDismissedController:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0D319D0];
  v5 = a3;
  if ((objc_msgSend(v4, "shouldUseLegacyQuickControlPresentation") & 1) != 0)
    -[HUQuickControlPresentationCoordinator _legacyAnimationControllerForDismissedController:](self, "_legacyAnimationControllerForDismissedController:", v5);
  else
    -[HUQuickControlPresentationCoordinator _animationControllerForDismissedController:](self, "_animationControllerForDismissedController:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)__createTransitionViewsForPresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  HUBaseIconView *v85;
  void *v86;
  void *v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  double v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  void *v192;
  void *v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  id v217;

  -[HUQuickControlPresentationCoordinator removeAllTransitionSubviews](self, "removeAllTransitionSubviews");
  -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateUIWithAnimation:", 0);

  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBarTitleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "summaryView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 1);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationBarTitleView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v7);

  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlpha:", 0.0);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v12);

  if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials") & 1) == 0)
  {
    v15 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    -[HUQuickControlPresentationCoordinator setTransitionBackgroundView:](self, "setTransitionBackgroundView:", v15);

    -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "backgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionBackgroundView](self, "transitionBackgroundView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBackgroundColor:", v17);

    -[HUQuickControlPresentationCoordinator transitionBackgroundView](self, "transitionBackgroundView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHidden:", 1);

    -[HUQuickControlPresentationCoordinator transitionBackgroundView](self, "transitionBackgroundView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAlpha:", 1.0);

    -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "tileFrame");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    -[HUQuickControlPresentationCoordinator transitionBackgroundView](self, "transitionBackgroundView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFrame:", v23, v25, v27, v29);

    -[HUQuickControlPresentationCoordinator transitionBackgroundView](self, "transitionBackgroundView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setNeedsLayout");

    -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionBackgroundView](self, "transitionBackgroundView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addSubview:", v34);

    -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "createBackgroundBlurView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator setPressedTileBlurEffectView:](self, "setPressedTileBlurEffectView:", v36);

    -[HUQuickControlPresentationCoordinator pressedTileBlurEffectView](self, "pressedTileBlurEffectView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setHidden:", 1);

    -[HUQuickControlPresentationCoordinator pressedTileBlurEffectView](self, "pressedTileBlurEffectView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setAlpha:", 1.0);

    -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "tileFrame");
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v47 = v46;
    -[HUQuickControlPresentationCoordinator pressedTileBlurEffectView](self, "pressedTileBlurEffectView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setFrame:", v41, v43, v45, v47);

    -[HUQuickControlPresentationCoordinator pressedTileBlurEffectView](self, "pressedTileBlurEffectView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setNeedsLayout");

    -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "view");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator pressedTileBlurEffectView](self, "pressedTileBlurEffectView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "insertSubview:atIndex:", v52, 0);

  }
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithBlurRadius:", 0.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v53);
  -[HUQuickControlPresentationCoordinator setTransitionBlurView:](self, "setTransitionBlurView:", v54);

  -[HUQuickControlPresentationCoordinator transitionBlurView](self, "transitionBlurView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setAutoresizingMask:", 18);

  if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "bounds");
    v58 = v57;
    v60 = v59;
    v62 = v61;
    v64 = v63;
    -[HUQuickControlPresentationCoordinator transitionBlurView](self, "transitionBlurView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setFrame:", v58, v60, v62, v64);

    -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "view");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionBlurView](self, "transitionBlurView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "insertSubview:atIndex:", v68, 0);
  }
  else
  {
    -[HUQuickControlPresentationCoordinator presentingViewController](self, "presentingViewController");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "view");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "bounds");
    v72 = v71;
    v74 = v73;
    v76 = v75;
    v78 = v77;
    -[HUQuickControlPresentationCoordinator transitionBlurView](self, "transitionBlurView");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setFrame:", v72, v74, v76, v78);

    -[HUQuickControlPresentationCoordinator presentingViewController](self, "presentingViewController");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "tabBarController");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "view");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionBlurView](self, "transitionBlurView");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "addSubview:", v80);

  }
  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "closeButton");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setAlpha:", 0.0);

  -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "baseIconViewConfiguration");
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  v85 = objc_alloc_init(HUBaseIconView);
  -[HUQuickControlPresentationCoordinator setTransitionBaseIconView:](self, "setTransitionBaseIconView:", v85);

  -[HUQuickControlPresentationCoordinator transitionBaseIconView](self, "transitionBaseIconView");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setConfiguration:", v84);

  -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "iconViewTileFrame");
  v89 = v88;
  v91 = v90;
  v93 = v92;
  v95 = v94;
  -[HUQuickControlPresentationCoordinator transitionBaseIconView](self, "transitionBaseIconView");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "setFrame:", v89, v91, v93, v95);

  -[HUQuickControlPresentationCoordinator transitionBaseIconView](self, "transitionBaseIconView");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setHidden:", 1);

  -[HUQuickControlPresentationCoordinator transitionBaseIconView](self, "transitionBaseIconView");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "setNeedsLayout");

  -[HUQuickControlPresentationCoordinator transitionBaseIconView](self, "transitionBaseIconView");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "layoutIfNeeded");

  -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "view");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator transitionBaseIconView](self, "transitionBaseIconView");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "addSubview:", v102);

  -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "prefixString");
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  if (v104)
  {
    v105 = (void *)objc_opt_new();
    -[HUQuickControlPresentationCoordinator setTransitionPrefixLabel:](self, "setTransitionPrefixLabel:", v105);

    -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "prefixString");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionPrefixLabel](self, "transitionPrefixLabel");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "setText:", v107);

    -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "prefixLabelFont");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionPrefixLabel](self, "transitionPrefixLabel");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "setFont:", v110);

    -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "prefixLabelTextColor");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionPrefixLabel](self, "transitionPrefixLabel");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "setTextColor:", v113);

    -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "prefixLabelTileFrame");
    v117 = v116;
    v119 = v118;
    v121 = v120;
    v123 = v122;
    -[HUQuickControlPresentationCoordinator transitionPrefixLabel](self, "transitionPrefixLabel");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "setFrame:", v117, v119, v121, v123);

    -[HUQuickControlPresentationCoordinator transitionPrefixLabel](self, "transitionPrefixLabel");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "setNumberOfLines:", 1);

    -[HUQuickControlPresentationCoordinator transitionPrefixLabel](self, "transitionPrefixLabel");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "setHidden:", 1);

    -[HUQuickControlPresentationCoordinator transitionPrefixLabel](self, "transitionPrefixLabel");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "setAllowsDefaultTighteningForTruncation:", 1);

    -[HUQuickControlPresentationCoordinator transitionPrefixLabel](self, "transitionPrefixLabel");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "setContentMode:", 1);

    -[HUQuickControlPresentationCoordinator transitionPrefixLabel](self, "transitionPrefixLabel");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "setAlpha:", 1.0);

    -[HUQuickControlPresentationCoordinator transitionPrefixLabel](self, "transitionPrefixLabel");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "setNeedsLayout");

    -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "view");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionPrefixLabel](self, "transitionPrefixLabel");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "addSubview:", v133);

  }
  -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "primaryString");
  v135 = (void *)objc_claimAutoreleasedReturnValue();

  if (v135)
  {
    v136 = (void *)objc_opt_new();
    -[HUQuickControlPresentationCoordinator setTransitionPrimaryLabel:](self, "setTransitionPrimaryLabel:", v136);

    -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "primaryString");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionPrimaryLabel](self, "transitionPrimaryLabel");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "setText:", v138);

    -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "primaryLabelFont");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionPrimaryLabel](self, "transitionPrimaryLabel");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "setFont:", v141);

    -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "primaryLabelTextColor");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionPrimaryLabel](self, "transitionPrimaryLabel");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "setTextColor:", v144);

    -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "primaryLabelTileFrame");
    v148 = v147;
    v150 = v149;
    v152 = v151;
    v154 = v153;
    -[HUQuickControlPresentationCoordinator transitionPrimaryLabel](self, "transitionPrimaryLabel");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "setFrame:", v148, v150, v152, v154);

    -[HUQuickControlPresentationCoordinator transitionPrimaryLabel](self, "transitionPrimaryLabel");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "setNumberOfLines:", 0);

    -[HUQuickControlPresentationCoordinator transitionPrimaryLabel](self, "transitionPrimaryLabel");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "setHidden:", 1);

    -[HUQuickControlPresentationCoordinator transitionPrimaryLabel](self, "transitionPrimaryLabel");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "setAllowsDefaultTighteningForTruncation:", 1);

    -[HUQuickControlPresentationCoordinator transitionPrimaryLabel](self, "transitionPrimaryLabel");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "setContentMode:", 1);

    -[HUQuickControlPresentationCoordinator transitionPrimaryLabel](self, "transitionPrimaryLabel");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "setNeedsLayout");

    -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "view");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionPrimaryLabel](self, "transitionPrimaryLabel");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "addSubview:", v163);

  }
  -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "secondaryString");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  if (v165)
  {

  }
  else
  {
    -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "secondaryAttributedString");
    v167 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v167)
      return;
  }
  v168 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", 0);
  -[HUQuickControlPresentationCoordinator setTransitionSecondaryLabelVibrantEffectView:](self, "setTransitionSecondaryLabelVibrantEffectView:", v168);

  v169 = (void *)objc_opt_new();
  -[HUQuickControlPresentationCoordinator setTransitionSecondaryLabel:](self, "setTransitionSecondaryLabel:", v169);

  -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "secondaryString");
  v171 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v173 = v172;
  if (v171)
  {
    objc_msgSend(v172, "secondaryString");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v175, "setText:", v174);
  }
  else
  {
    objc_msgSend(v172, "secondaryAttributedString");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v175, "setAttributedText:", v174);
  }

  -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v176, "secondaryLabelFont");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "setFont:", v177);

  -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "secondaryLabelTextColor");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "setTextColor:", v180);

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabelVibrantEffectView](self, "transitionSecondaryLabelVibrantEffectView");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "setHidden:", 1);

  -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "secondaryLabelTileFrame");
  v185 = v184;
  v187 = v186;
  v189 = v188;
  v191 = v190;
  -[HUQuickControlPresentationCoordinator transitionSecondaryLabelVibrantEffectView](self, "transitionSecondaryLabelVibrantEffectView");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "setFrame:", v185, v187, v189, v191);

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabelVibrantEffectView](self, "transitionSecondaryLabelVibrantEffectView");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v193, "bounds");
  v195 = v194;
  v197 = v196;
  v199 = v198;
  v201 = v200;
  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v202, "setFrame:", v195, v197, v199, v201);

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v203, "setHidden:", 1);

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v204, "setNumberOfLines:", 0);

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v205, "setAdjustsFontSizeToFitWidth:", 1);

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v206, "setMinimumScaleFactor:", 0.8);

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v207, "setAllowsDefaultTighteningForTruncation:", 1);

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v208, "setContentMode:", 1);

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v209, "sizeToFit");

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v210, "setNeedsLayout");

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabelVibrantEffectView](self, "transitionSecondaryLabelVibrantEffectView");
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v211, "contentView");
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v212, "addSubview:", v213);

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabelVibrantEffectView](self, "transitionSecondaryLabelVibrantEffectView");
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v214, "setNeedsLayout");

  -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
  v217 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v217, "view");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator transitionSecondaryLabelVibrantEffectView](self, "transitionSecondaryLabelVibrantEffectView");
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v215, "addSubview:", v216);

}

- (id)_animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v6;
  uint64_t v7;
  _QWORD v9[5];
  _QWORD v10[5];

  -[HUQuickControlPresentationCoordinator _createTransitionViewsForPresentation](self, "_createTransitionViewsForPresentation", a3, a4, a5);
  v6 = objc_alloc_init(MEMORY[0x1E0CEAEA8]);
  objc_msgSend(v6, "setIsReversed:", 0);
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __122__HUQuickControlPresentationCoordinator__animationControllerForPresentedController_presentingController_sourceController___block_invoke;
  v10[3] = &unk_1E6F4D988;
  v10[4] = self;
  objc_msgSend(v6, "setNoninteractiveAnimations:", v10);
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __122__HUQuickControlPresentationCoordinator__animationControllerForPresentedController_presentingController_sourceController___block_invoke_4;
  v9[3] = &unk_1E6F4E300;
  v9[4] = self;
  objc_msgSend(v6, "setNoninteractiveCompletion:", v9);
  -[HUQuickControlPresentationCoordinator sourceFrameForAnimationController](self, "sourceFrameForAnimationController");
  objc_msgSend(v6, "setSourceFrame:");
  return v6;
}

uint64_t __122__HUQuickControlPresentationCoordinator__animationControllerForPresentedController_presentingController_sourceController___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];
  CAFrameRateRange v5;

  v2 = (void *)MEMORY[0x1E0CEABB0];
  v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __122__HUQuickControlPresentationCoordinator__animationControllerForPresentedController_presentingController_sourceController___block_invoke_2;
  v4[3] = &unk_1E6F4D988;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1769473, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

void __122__HUQuickControlPresentationCoordinator__animationControllerForPresentedController_presentingController_sourceController___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  void *v132;
  void *v133;
  _QWORD v134[5];

  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationBarTitleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "summaryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  objc_msgSend(*(id *)(a1 + 32), "cardNavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationBar");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentationCoordinatorWillBeginTransition:presenting:", *(_QWORD *)(a1 + 32), 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "transitionBackgroundView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "transitionBackgroundView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "cardNavigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(*(id *)(a1 + 32), "transitionBackgroundView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "backgroundColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transitionBackgroundView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBackgroundColor:", v24);

  objc_msgSend(*(id *)(a1 + 32), "transitionBackgroundView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "pressedTileBlurEffectView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "cardNavigationController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "frame");
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  objc_msgSend(*(id *)(a1 + 32), "pressedTileBlurEffectView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);

  objc_msgSend(*(id *)(a1 + 32), "pressedTileBlurEffectView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "layoutIfNeeded");

  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithBlurRadius:", 20.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transitionBlurView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setEffect:", v42);

  v134[0] = MEMORY[0x1E0C809B0];
  v134[1] = 3221225472;
  v134[2] = __122__HUQuickControlPresentationCoordinator__animationControllerForPresentedController_presentingController_sourceController___block_invoke_3;
  v134[3] = &unk_1E6F4D988;
  v134[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v134, 0, 0.5, 0.115);
  objc_msgSend(*(id *)(a1 + 32), "transitionBaseIconView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "baseIconFrameInNavigationBar");
  v46 = v45;
  v48 = v47;
  v50 = v49;
  v52 = v51;
  objc_msgSend(*(id *)(a1 + 32), "transitionBaseIconView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setFrame:", v46, v48, v50, v52);

  objc_msgSend(*(id *)(a1 + 32), "transitionBaseIconView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "startTransitionToTargetViewState:", 3);

  objc_msgSend(*(id *)(a1 + 32), "transitionBaseIconView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "transitionPrefixLabel");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "transitionPrefixLabel");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "navigationBarTitleView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "summaryView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "primaryLabel");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "font");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transitionPrimaryLabel");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setFont:", v62);

  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "navigationBarTitleView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "summaryView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "primaryLabel");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "text");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transitionPrimaryLabel");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setText:", v68);

  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "navigationBarTitleView");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "summaryView");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "primaryLabel");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "textColor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transitionPrimaryLabel");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setTextColor:", v74);

  objc_msgSend(*(id *)(a1 + 32), "transitionPrimaryLabel");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "primaryLabelFrameInNavigationBar");
  v78 = v77;
  v80 = v79;
  v82 = v81;
  v84 = v83;
  objc_msgSend(*(id *)(a1 + 32), "transitionPrimaryLabel");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setFrame:", v78, v80, v82, v84);

  objc_msgSend(*(id *)(a1 + 32), "transitionPrimaryLabel");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "navigationBarTitleView");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "summaryView");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "secondaryLabel");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "font");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabel");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setFont:", v91);

  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "navigationBarTitleView");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "summaryView");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "secondaryLabel");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "textColor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabel");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "setTextColor:", v97);

  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "navigationBarTitleView");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "summaryView");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "secondaryLabel");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "text");
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "navigationBarTitleView");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "summaryView");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "secondaryLabel");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = v107;
  if (v103)
  {
    objc_msgSend(v107, "text");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabel");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setText:", v109);
  }
  else
  {
    objc_msgSend(v107, "attributedText");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabel");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setAttributedText:", v109);
  }

  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabelVibrantEffectView");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "secondaryLabelFrameInNavigationBar");
  v113 = v112;
  v115 = v114;
  v117 = v116;
  v119 = v118;
  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabelVibrantEffectView");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "setFrame:", v113, v115, v117, v119);

  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabelVibrantEffectView");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabel");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabelVibrantEffectView");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "bounds");
  v125 = v124;
  v127 = v126;
  v129 = v128;
  v131 = v130;
  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabel");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "setFrame:", v125, v127, v129, v131);

  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabel");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "layoutIfNeeded");

}

void __122__HUQuickControlPresentationCoordinator__animationControllerForPresentedController_presentingController_sourceController___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "closeButton");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __122__HUQuickControlPresentationCoordinator__animationControllerForPresentedController_presentingController_sourceController___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationBarTitleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "summaryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

  return objc_msgSend(*(id *)(a1 + 32), "removeAllTransitionSubviews");
}

- (void)__createTransitionViewsForDismissal
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  HUBaseIconView *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  id v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  double v176;
  double v177;
  void *v178;
  void *v179;
  void *v180;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  double v186;
  double v187;
  double v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  id v197;

  -[HUQuickControlPresentationCoordinator removeAllTransitionSubviews](self, "removeAllTransitionSubviews");
  -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateUIWithAnimation:", 0);

  -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  v5 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  -[HUQuickControlPresentationCoordinator setTransitionBackgroundView:](self, "setTransitionBackgroundView:", v5);

  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator transitionBackgroundView](self, "transitionBackgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

  -[HUQuickControlPresentationCoordinator transitionBackgroundView](self, "transitionBackgroundView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 1);

  -[HUQuickControlPresentationCoordinator transitionBackgroundView](self, "transitionBackgroundView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", 0.0);

  -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[HUQuickControlPresentationCoordinator transitionBackgroundView](self, "transitionBackgroundView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

  -[HUQuickControlPresentationCoordinator transitionBackgroundView](self, "transitionBackgroundView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setNeedsLayout");

  -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator transitionBackgroundView](self, "transitionBackgroundView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSubview:", v25);

  -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "createBackgroundBlurView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator setPressedTileBlurEffectView:](self, "setPressedTileBlurEffectView:", v27);

  -[HUQuickControlPresentationCoordinator pressedTileBlurEffectView](self, "pressedTileBlurEffectView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setHidden:", 1);

  -[HUQuickControlPresentationCoordinator pressedTileBlurEffectView](self, "pressedTileBlurEffectView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setAlpha:", 1.0);

  -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "frame");
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  -[HUQuickControlPresentationCoordinator pressedTileBlurEffectView](self, "pressedTileBlurEffectView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);

  -[HUQuickControlPresentationCoordinator pressedTileBlurEffectView](self, "pressedTileBlurEffectView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setNeedsLayout");

  -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator pressedTileBlurEffectView](self, "pressedTileBlurEffectView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "insertSubview:atIndex:", v44, 0);

  -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "baseIconViewConfiguration");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = objc_msgSend(v46, "appearance");
  objc_msgSend(v46, "setAppearance:", 3);
  v48 = objc_alloc_init(HUBaseIconView);
  -[HUQuickControlPresentationCoordinator setTransitionBaseIconView:](self, "setTransitionBaseIconView:", v48);

  -[HUQuickControlPresentationCoordinator transitionBaseIconView](self, "transitionBaseIconView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setConfiguration:", v46);

  -[HUQuickControlPresentationCoordinator transitionBaseIconView](self, "transitionBaseIconView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "prepareForTransitionToTargetViewState:", v47);

  -[HUQuickControlPresentationCoordinator baseIconFrameInNavigationBar](self, "baseIconFrameInNavigationBar");
  v52 = v51;
  v54 = v53;
  v56 = v55;
  v58 = v57;
  -[HUQuickControlPresentationCoordinator transitionBaseIconView](self, "transitionBaseIconView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setFrame:", v52, v54, v56, v58);

  -[HUQuickControlPresentationCoordinator transitionBaseIconView](self, "transitionBaseIconView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setHidden:", 1);

  -[HUQuickControlPresentationCoordinator transitionBaseIconView](self, "transitionBaseIconView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setNeedsLayout");

  -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "view");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator transitionBaseIconView](self, "transitionBaseIconView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "addSubview:", v64);

  -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "prefixString");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  if (v66)
  {
    v67 = (void *)objc_opt_new();
    -[HUQuickControlPresentationCoordinator setTransitionPrefixLabel:](self, "setTransitionPrefixLabel:", v67);

    -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "prefixString");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionPrefixLabel](self, "transitionPrefixLabel");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setText:", v69);

    -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "prefixLabelFont");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionPrefixLabel](self, "transitionPrefixLabel");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setFont:", v72);

    -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "prefixLabelTextColor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionPrefixLabel](self, "transitionPrefixLabel");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setTextColor:", v75);

    -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "prefixLabelTileFrame");
    v79 = v78;
    v81 = v80;
    v83 = v82;
    v85 = v84;
    -[HUQuickControlPresentationCoordinator transitionPrefixLabel](self, "transitionPrefixLabel");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setFrame:", v79, v81, v83, v85);

    -[HUQuickControlPresentationCoordinator transitionPrefixLabel](self, "transitionPrefixLabel");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setNumberOfLines:", 1);

    -[HUQuickControlPresentationCoordinator transitionPrefixLabel](self, "transitionPrefixLabel");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setHidden:", 1);

    -[HUQuickControlPresentationCoordinator transitionPrefixLabel](self, "transitionPrefixLabel");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "setContentMode:", 1);

    -[HUQuickControlPresentationCoordinator transitionPrefixLabel](self, "transitionPrefixLabel");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setAlpha:", 0.0);

    -[HUQuickControlPresentationCoordinator transitionPrefixLabel](self, "transitionPrefixLabel");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "setNeedsLayout");

    -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "view");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionPrefixLabel](self, "transitionPrefixLabel");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "addSubview:", v94);

  }
  -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "primaryString");
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  if (v96)
  {
    v97 = (void *)objc_opt_new();
    -[HUQuickControlPresentationCoordinator setTransitionPrimaryLabel:](self, "setTransitionPrimaryLabel:", v97);

    -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "navigationBarTitleView");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "summaryView");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "primaryLabel");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "font");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionPrimaryLabel](self, "transitionPrimaryLabel");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "setFont:", v102);

    -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "navigationBarTitleView");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "summaryView");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "primaryLabel");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "text");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionPrimaryLabel](self, "transitionPrimaryLabel");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "setText:", v108);

    -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "navigationBarTitleView");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "summaryView");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "primaryLabel");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "textColor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionPrimaryLabel](self, "transitionPrimaryLabel");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "setTextColor:", v114);

    -[HUQuickControlPresentationCoordinator transitionPrimaryLabel](self, "transitionPrimaryLabel");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "setNumberOfLines:", 0);

    -[HUQuickControlPresentationCoordinator primaryLabelFrameInNavigationBar](self, "primaryLabelFrameInNavigationBar");
    v118 = v117;
    v120 = v119;
    v122 = v121;
    v124 = v123;
    -[HUQuickControlPresentationCoordinator transitionPrimaryLabel](self, "transitionPrimaryLabel");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "setFrame:", v118, v120, v122, v124);

    -[HUQuickControlPresentationCoordinator transitionPrimaryLabel](self, "transitionPrimaryLabel");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "setHidden:", 1);

    -[HUQuickControlPresentationCoordinator transitionPrimaryLabel](self, "transitionPrimaryLabel");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "setContentMode:", 1);

    -[HUQuickControlPresentationCoordinator transitionPrimaryLabel](self, "transitionPrimaryLabel");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "sizeToFit");

    -[HUQuickControlPresentationCoordinator transitionPrimaryLabel](self, "transitionPrimaryLabel");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "setNeedsLayout");

    -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "view");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionPrimaryLabel](self, "transitionPrimaryLabel");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "addSubview:", v132);

  }
  -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "secondaryString");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  if (v134)
  {

  }
  else
  {
    -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "secondaryAttributedString");
    v136 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v136)
      return;
  }
  v137 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", 0);
  -[HUQuickControlPresentationCoordinator setTransitionSecondaryLabelVibrantEffectView:](self, "setTransitionSecondaryLabelVibrantEffectView:", v137);

  v138 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  -[HUQuickControlPresentationCoordinator setTransitionSecondaryLabel:](self, "setTransitionSecondaryLabel:", v138);

  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "navigationBarTitleView");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "summaryView");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "secondaryLabel");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "font");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "setFont:", v143);

  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "navigationBarTitleView");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "summaryView");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "secondaryLabel");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "textColor");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "setTextColor:", v149);

  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "navigationBarTitleView");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "summaryView");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "secondaryLabel");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "text");
  v155 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "navigationBarTitleView");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "summaryView");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "secondaryLabel");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = v159;
  if (v155)
  {
    objc_msgSend(v159, "text");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "setText:", v161);
  }
  else
  {
    objc_msgSend(v159, "attributedText");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "setAttributedText:", v161);
  }

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabelVibrantEffectView](self, "transitionSecondaryLabelVibrantEffectView");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "setHidden:", 1);

  -[HUQuickControlPresentationCoordinator secondaryLabelFrameInNavigationBar](self, "secondaryLabelFrameInNavigationBar");
  v165 = v164;
  v167 = v166;
  v169 = v168;
  v171 = v170;
  -[HUQuickControlPresentationCoordinator transitionSecondaryLabelVibrantEffectView](self, "transitionSecondaryLabelVibrantEffectView");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "setFrame:", v165, v167, v169, v171);

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "setNumberOfLines:", 1);

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "setAllowsDefaultTighteningForTruncation:", 1);

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "setAdjustsFontSizeToFitWidth:", 1);

  +[HUGridServiceCellTextView minimumDescriptionScaleFactor](HUGridServiceCellTextView, "minimumDescriptionScaleFactor");
  v177 = v176;
  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "setMinimumScaleFactor:", v177);

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "sizeToFit");

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabelVibrantEffectView](self, "transitionSecondaryLabelVibrantEffectView");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "bounds");
  v182 = v181;
  v184 = v183;
  v186 = v185;
  v188 = v187;
  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v189, "setFrame:", v182, v184, v186, v188);

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "setNeedsLayout");

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabelVibrantEffectView](self, "transitionSecondaryLabelVibrantEffectView");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "contentView");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "addSubview:", v193);

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabelVibrantEffectView](self, "transitionSecondaryLabelVibrantEffectView");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v194, "setNeedsLayout");

  -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
  v197 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v197, "view");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator transitionSecondaryLabelVibrantEffectView](self, "transitionSecondaryLabelVibrantEffectView");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v195, "addSubview:", v196);

}

- (id)_animationControllerForDismissedController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  id v8;
  uint64_t v9;
  _QWORD v11[5];
  _QWORD v12[5];

  -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[HUQuickControlPresentationCoordinator _createTransitionViewsForDismissal](self, "_createTransitionViewsForDismissal");
    v8 = objc_alloc_init(MEMORY[0x1E0CEAEA8]);
    objc_msgSend(v8, "setIsReversed:", 1);
    v9 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __84__HUQuickControlPresentationCoordinator__animationControllerForDismissedController___block_invoke;
    v12[3] = &unk_1E6F4D988;
    v12[4] = self;
    objc_msgSend(v8, "setNoninteractiveAnimations:", v12);
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __84__HUQuickControlPresentationCoordinator__animationControllerForDismissedController___block_invoke_4;
    v11[3] = &unk_1E6F4E300;
    v11[4] = self;
    objc_msgSend(v8, "setNoninteractiveCompletion:", v11);
    -[HUQuickControlPresentationCoordinator sourceFrameForAnimationController](self, "sourceFrameForAnimationController");
    objc_msgSend(v8, "setSourceFrame:");
  }
  return v8;
}

uint64_t __84__HUQuickControlPresentationCoordinator__animationControllerForDismissedController___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];
  CAFrameRateRange v5;

  v2 = (void *)MEMORY[0x1E0CEABB0];
  v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __84__HUQuickControlPresentationCoordinator__animationControllerForDismissedController___block_invoke_2;
  v4[3] = &unk_1E6F4D988;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1769473, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

void __84__HUQuickControlPresentationCoordinator__animationControllerForDismissedController___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
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
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
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
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  void *v135;
  void *v136;
  _QWORD v137[5];

  objc_msgSend(*(id *)(a1 + 32), "cardNavigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v5 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "cardViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShowsVerticalScrollIndicator:", 0);

    objc_msgSend(*(id *)(a1 + 32), "cardViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationBarTitleView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "summaryView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 1);

    objc_msgSend(*(id *)(a1 + 32), "cardViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "quickControlViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "controlContainerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", 1);

  }
  else
  {
    objc_msgSend(v5, "cardNavigationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHidden:", 1);

    objc_msgSend(*(id *)(a1 + 32), "cardNavigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "navigationBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", 1);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "presentationCoordinatorWillBeginTransition:presenting:", *(_QWORD *)(a1 + 32), 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "navigationItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_setManualScrollEdgeAppearanceProgress:", 0.0);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBackgroundColor:", v24);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cardNavigationController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setBackgroundColor:", v26);

  objc_msgSend(*(id *)(a1 + 32), "transitionBackgroundView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "pressedTile");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "tileFrame");
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  objc_msgSend(*(id *)(a1 + 32), "transitionBackgroundView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setFrame:", v32, v34, v36, v38);

  objc_msgSend(*(id *)(a1 + 32), "transitionBackgroundView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "pressedTile");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "backgroundColor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transitionBackgroundView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setBackgroundColor:", v42);

  objc_msgSend(*(id *)(a1 + 32), "transitionBackgroundView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "pressedTileBlurEffectView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "pressedTile");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "tileFrame");
  v48 = v47;
  v50 = v49;
  v52 = v51;
  v54 = v53;
  objc_msgSend(*(id *)(a1 + 32), "pressedTileBlurEffectView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setFrame:", v48, v50, v52, v54);

  objc_msgSend(*(id *)(a1 + 32), "pressedTileBlurEffectView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setNeedsLayout");

  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithBlurRadius:", 0.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transitionBlurView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setEffect:", v57);

  v137[0] = MEMORY[0x1E0C809B0];
  v137[1] = 3221225472;
  v137[2] = __84__HUQuickControlPresentationCoordinator__animationControllerForDismissedController___block_invoke_3;
  v137[3] = &unk_1E6F4D988;
  v137[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v137, 0, 0.1, 0.0);
  objc_msgSend(*(id *)(a1 + 32), "transitionBaseIconView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "pressedTile");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "baseIconViewConfiguration");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "transitionBaseIconView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "startTransitionToTargetViewState:", objc_msgSend(v61, "appearance"));

  objc_msgSend(*(id *)(a1 + 32), "pressedTile");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "iconViewTileFrame");
  v65 = v64;
  v67 = v66;
  v69 = v68;
  v71 = v70;
  objc_msgSend(*(id *)(a1 + 32), "transitionBaseIconView");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setFrame:", v65, v67, v69, v71);

  objc_msgSend(*(id *)(a1 + 32), "transitionBaseIconView");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "transitionPrefixLabel");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "transitionPrefixLabel");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "pressedTile");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "primaryLabelFont");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transitionPrimaryLabel");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setFont:", v77);

  objc_msgSend(*(id *)(a1 + 32), "pressedTile");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "primaryLabelTextColor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transitionPrimaryLabel");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setTextColor:", v80);

  objc_msgSend(*(id *)(a1 + 32), "pressedTile");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "primaryString");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transitionPrimaryLabel");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setText:", v83);

  objc_msgSend(*(id *)(a1 + 32), "transitionPrimaryLabel");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "pressedTile");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "primaryLabelTileFrame");
  v88 = v87;
  v90 = v89;
  v92 = v91;
  v94 = v93;
  objc_msgSend(*(id *)(a1 + 32), "transitionPrimaryLabel");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setFrame:", v88, v90, v92, v94);

  objc_msgSend(*(id *)(a1 + 32), "transitionPrimaryLabel");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "pressedTile");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "secondaryString");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  if (v98)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "pressedTile");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "secondaryAttributedString");
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v100)
      return;
  }
  objc_msgSend(*(id *)(a1 + 32), "pressedTile");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "secondaryLabelFont");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabel");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "setFont:", v102);

  objc_msgSend(*(id *)(a1 + 32), "pressedTile");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "secondaryLabelTextColor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabel");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setTextColor:", v105);

  objc_msgSend(*(id *)(a1 + 32), "pressedTile");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "secondaryString");
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "pressedTile");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = v109;
  if (v108)
  {
    objc_msgSend(v109, "secondaryString");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabel");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "setText:", v111);
  }
  else
  {
    objc_msgSend(v109, "secondaryAttributedString");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabel");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "setAttributedText:", v111);
  }

  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabelVibrantEffectView");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "pressedTile");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "secondaryLabelTileFrame");
  v116 = v115;
  v118 = v117;
  v120 = v119;
  v122 = v121;
  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabelVibrantEffectView");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "setFrame:", v116, v118, v120, v122);

  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabelVibrantEffectView");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabel");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabelVibrantEffectView");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "bounds");
  v128 = v127;
  v130 = v129;
  v132 = v131;
  v134 = v133;
  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabel");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "setFrame:", v128, v130, v132, v134);

  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabel");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "layoutIfNeeded");

}

void __84__HUQuickControlPresentationCoordinator__animationControllerForDismissedController___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "closeButton");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __84__HUQuickControlPresentationCoordinator__animationControllerForDismissedController___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "pressedTile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "setPressedTile:", 0);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentationCoordinatorWillEndTransition:presenting:", *(_QWORD *)(a1 + 32), 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "removeAllTransitionSubviews");
  objc_msgSend(*(id *)(a1 + 32), "_restoreOriginalTile");
  objc_msgSend(*(id *)(a1 + 32), "transitionBlurView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

}

- (void)__createLegacyTransitionViewsForPresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  unint64_t v97;
  void *v98;
  double v99;
  double v100;
  double v101;
  double v102;
  unint64_t v103;
  void *v104;
  double v105;
  double v106;
  double v107;
  double v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  void *v115;
  unint64_t v116;
  void *v117;
  double v118;
  double v119;
  double v120;
  double v121;
  unint64_t v122;
  void *v123;
  double v124;
  double v125;
  double v126;
  double v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  double v186;
  double v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  double v209;
  double v210;
  double v211;
  double v212;
  double v213;
  double v214;
  double v215;
  double v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  double v229;
  double v230;
  double v231;
  double v232;
  double v233;
  double v234;
  double v235;
  double v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  double v246;
  double v247;
  double v248;
  double v249;
  double v250;
  double v251;
  double v252;
  double v253;
  void *v254;
  void *v255;
  double v256;
  double v257;
  double v258;
  double v259;
  double v260;
  double v261;
  double v262;
  double v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  id v272;

  -[HUQuickControlPresentationCoordinator removeAllTransitionSubviews](self, "removeAllTransitionSubviews");
  -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateUIWithAnimation:", 0);

  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBarTitleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "summaryView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 1);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationBarTitleView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v7);

  if (-[HUQuickControlPresentationCoordinator isTileOff](self, "isTileOff"))
  {
    if (+[HUGraphicsUtilities shouldReduceVisualEffects](HUGraphicsUtilities, "shouldReduceVisualEffects"))
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", 0);
      -[HUQuickControlPresentationCoordinator setPressedTileBlurEffectView:](self, "setPressedTileBlurEffectView:", v10);

      -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "gridBackgroundView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "frame");
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;
      -[HUQuickControlPresentationCoordinator pressedTilePrerenderedView](self, "pressedTilePrerenderedView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

      objc_msgSend(v12, "layer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "contentsRect");
      v26 = v25;
      v28 = v27;
      v30 = v29;
      v32 = v31;
      -[HUQuickControlPresentationCoordinator pressedTilePrerenderedView](self, "pressedTilePrerenderedView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "layer");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setContentsRect:", v26, v28, v30, v32);

      -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "view");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlPresentationCoordinator pressedTilePrerenderedView](self, "pressedTilePrerenderedView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "insertSubview:atIndex:", v37, 0);

    }
    else
    {
      if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
      {
        if ((objc_msgSend(MEMORY[0x1E0D313C8], "isSpringBoard") & 1) != 0)
          objc_msgSend(MEMORY[0x1E0D14788], "controlCenterModuleBackgroundMaterial");
        else
          objc_msgSend(MEMORY[0x1E0D14788], "controlCenterTertiaryMaterial");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUQuickControlPresentationCoordinator setPressedTileBlurEffectView:](self, "setPressedTileBlurEffectView:", v38);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 1202);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v38);
        -[HUQuickControlPresentationCoordinator setPressedTileBlurEffectView:](self, "setPressedTileBlurEffectView:", v39);

      }
      -[HUQuickControlPresentationCoordinator pressedTileBlurEffectView](self, "pressedTileBlurEffectView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setHidden:", 1);

      -[HUQuickControlPresentationCoordinator pressedTileBlurEffectView](self, "pressedTileBlurEffectView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setAlpha:", 1.0);

      -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "view");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "frame");
      v45 = v44;
      v47 = v46;
      v49 = v48;
      v51 = v50;
      -[HUQuickControlPresentationCoordinator pressedTileBlurEffectView](self, "pressedTileBlurEffectView");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setFrame:", v45, v47, v49, v51);

      -[HUQuickControlPresentationCoordinator pressedTileBlurEffectView](self, "pressedTileBlurEffectView");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setNeedsLayout");

      -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "view");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlPresentationCoordinator pressedTileBlurEffectView](self, "pressedTileBlurEffectView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "insertSubview:atIndex:", v36, 0);
    }

    -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "view");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setAlpha:", 0.0);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "view");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setBackgroundColor:", v56);

  }
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithBlurRadius:", 0.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v59);
  -[HUQuickControlPresentationCoordinator setTransitionBlurView:](self, "setTransitionBlurView:", v60);

  -[HUQuickControlPresentationCoordinator transitionBlurView](self, "transitionBlurView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setAutoresizingMask:", 18);

  if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "bounds");
    v64 = v63;
    v66 = v65;
    v68 = v67;
    v70 = v69;
    -[HUQuickControlPresentationCoordinator transitionBlurView](self, "transitionBlurView");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setFrame:", v64, v66, v68, v70);

    -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "view");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionBlurView](self, "transitionBlurView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "insertSubview:atIndex:", v74, 0);
  }
  else
  {
    -[HUQuickControlPresentationCoordinator presentingViewController](self, "presentingViewController");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "view");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "bounds");
    v78 = v77;
    v80 = v79;
    v82 = v81;
    v84 = v83;
    -[HUQuickControlPresentationCoordinator transitionBlurView](self, "transitionBlurView");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "setFrame:", v78, v80, v82, v84);

    -[HUQuickControlPresentationCoordinator presentingViewController](self, "presentingViewController");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "tabBarController");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "view");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionBlurView](self, "transitionBlurView");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "addSubview:", v86);

  }
  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "closeButton");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setAlpha:", 0.0);

  v89 = objc_alloc_init(MEMORY[0x1E0D33720]);
  -[HUQuickControlPresentationCoordinator setTransitionIconView:](self, "setTransitionIconView:", v89);

  -[HUQuickControlPresentationCoordinator transitionIconView](self, "transitionIconView");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = 1;
  objc_msgSend(v90, "setContentMode:", 1);

  -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "item");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "latestResults");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C60]);
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HUQuickControlPresentationCoordinator isTileOff](self, "isTileOff"))
  {
    if (-[HUQuickControlPresentationCoordinator isActionSetTile](self, "isActionSetTile"))
      v91 = 1;
    else
      v91 = 3;
  }
  -[HUQuickControlPresentationCoordinator transitionIconView](self, "transitionIconView");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "updateWithIconDescriptor:displayStyle:animated:", v95, v91, 0);

  if (-[HUQuickControlPresentationCoordinator isActionSetTile](self, "isActionSetTile"))
  {
    v97 = -[HUQuickControlPresentationCoordinator iconSizeInActionSetTile](self, "iconSizeInActionSetTile");
    -[HUQuickControlPresentationCoordinator transitionIconView](self, "transitionIconView");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "setIconSize:", v97);

    -[HUQuickControlPresentationCoordinator iconFrameInActionSetTile](self, "iconFrameInActionSetTile");
  }
  else
  {
    v103 = -[HUQuickControlPresentationCoordinator iconSizeInTile](self, "iconSizeInTile");
    -[HUQuickControlPresentationCoordinator transitionIconView](self, "transitionIconView");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "setIconSize:", v103);

    -[HUQuickControlPresentationCoordinator iconFrameInTile](self, "iconFrameInTile");
  }
  v105 = v99;
  v106 = v100;
  v107 = v101;
  v108 = v102;
  -[HUQuickControlPresentationCoordinator transitionIconView](self, "transitionIconView");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "setFrame:", v105, v106, v107, v108);

  -[HUQuickControlPresentationCoordinator transitionIconView](self, "transitionIconView");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "setHidden:", 1);

  -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "view");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator transitionIconView](self, "transitionIconView");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "addSubview:", v113);

  v114 = objc_alloc_init(MEMORY[0x1E0D33720]);
  -[HUQuickControlPresentationCoordinator setTransitionIconViewVibrant:](self, "setTransitionIconViewVibrant:", v114);

  -[HUQuickControlPresentationCoordinator transitionIconViewVibrant](self, "transitionIconViewVibrant");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "setContentMode:", 1);

  if (-[HUQuickControlPresentationCoordinator isActionSetTile](self, "isActionSetTile"))
  {
    v116 = -[HUQuickControlPresentationCoordinator iconSizeInActionSetTile](self, "iconSizeInActionSetTile");
    -[HUQuickControlPresentationCoordinator transitionIconViewVibrant](self, "transitionIconViewVibrant");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "setIconSize:", v116);

    -[HUQuickControlPresentationCoordinator iconFrameInActionSetTile](self, "iconFrameInActionSetTile");
  }
  else
  {
    v122 = -[HUQuickControlPresentationCoordinator iconSizeInTile](self, "iconSizeInTile");
    -[HUQuickControlPresentationCoordinator transitionIconViewVibrant](self, "transitionIconViewVibrant");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "setIconSize:", v122);

    -[HUQuickControlPresentationCoordinator iconFrameInTile](self, "iconFrameInTile");
  }
  v124 = v118;
  v125 = v119;
  v126 = v120;
  v127 = v121;
  -[HUQuickControlPresentationCoordinator transitionIconViewVibrant](self, "transitionIconViewVibrant");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setFrame:", v124, v125, v126, v127);

  -[HUQuickControlPresentationCoordinator transitionIconViewVibrant](self, "transitionIconViewVibrant");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "setHidden:", 1);

  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "navigationBarTitleView");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "summaryView");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "iconView");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "tintColor");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator transitionIconView](self, "transitionIconView");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "setTintColor:", v134);

  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "navigationBarTitleView");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "summaryView");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "iconView");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "tintColor");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator transitionIconViewVibrant](self, "transitionIconViewVibrant");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "setTintColor:", v140);

  if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
  {
    objc_msgSend(MEMORY[0x1E0CEABA8], "controlCenterSecondaryVibrancyEffect");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionIconViewVibrant](self, "transitionIconViewVibrant");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "setVibrancyEffect:", v142);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 7);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEABA8], "effectForBlurEffect:style:", v142, 4);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionIconViewVibrant](self, "transitionIconViewVibrant");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "setVibrancyEffect:", v143);

  }
  -[HUQuickControlPresentationCoordinator transitionIconViewVibrant](self, "transitionIconViewVibrant");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "updateWithIconDescriptor:displayStyle:animated:", v95, 2, 0);

  -[HUQuickControlPresentationCoordinator transitionIconView](self, "transitionIconView");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "layoutIfNeeded");

  -[HUQuickControlPresentationCoordinator transitionIconViewVibrant](self, "transitionIconViewVibrant");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "layoutIfNeeded");

  -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "view");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator transitionIconViewVibrant](self, "transitionIconViewVibrant");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator transitionIconView](self, "transitionIconView");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "insertSubview:above:", v150, v151);

  v152 = (void *)objc_opt_new();
  -[HUQuickControlPresentationCoordinator setTransitionPrimaryLabel:](self, "setTransitionPrimaryLabel:", v152);

  LODWORD(v148) = -[HUQuickControlPresentationCoordinator isActionSetTile](self, "isActionSetTile");
  -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = v153;
  if ((_DWORD)v148)
  {
    objc_msgSend(v153, "titleAndDescriptionView");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "titleLabel");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "font");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionPrimaryLabel](self, "transitionPrimaryLabel");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "setFont:", v157);

    objc_msgSend(v154, "titleAndDescriptionView");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "titleLabel");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "text");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionPrimaryLabel](self, "transitionPrimaryLabel");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "setText:", v161);

    -[HUQuickControlPresentationCoordinator primaryLabelFrameInActionSetTile](self, "primaryLabelFrameInActionSetTile");
    v164 = v163;
    v166 = v165;
    v168 = v167;
    v170 = v169;
    -[HUQuickControlPresentationCoordinator transitionPrimaryLabel](self, "transitionPrimaryLabel");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v171, "setFrame:", v164, v166, v168, v170);

  }
  else
  {
    objc_msgSend(v153, "serviceTextView");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "font");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionPrimaryLabel](self, "transitionPrimaryLabel");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v174, "setFont:", v173);

    -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v175, "item");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v176, "latestResults");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v177, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionPrimaryLabel](self, "transitionPrimaryLabel");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v179, "setText:", v178);

    -[HUQuickControlPresentationCoordinator primaryLabelFrameInTile](self, "primaryLabelFrameInTile");
    v181 = v180;
    v183 = v182;
    v185 = v184;
    v187 = v186;
    -[HUQuickControlPresentationCoordinator transitionPrimaryLabel](self, "transitionPrimaryLabel");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "setFrame:", v181, v183, v185, v187);
  }

  -[HUQuickControlPresentationCoordinator transitionPrimaryLabel](self, "transitionPrimaryLabel");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "setHidden:", 1);

  -[HUQuickControlPresentationCoordinator transitionPrimaryLabel](self, "transitionPrimaryLabel");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v189, "setNumberOfLines:", 2);

  -[HUQuickControlPresentationCoordinator transitionPrimaryLabel](self, "transitionPrimaryLabel");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "setContentMode:", 1);

  -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "view");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator transitionPrimaryLabel](self, "transitionPrimaryLabel");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "addSubview:", v193);

  v194 = (void *)objc_opt_new();
  -[HUQuickControlPresentationCoordinator setTransitionSecondaryLabel:](self, "setTransitionSecondaryLabel:", v194);

  LODWORD(v192) = -[HUQuickControlPresentationCoordinator isActionSetTile](self, "isActionSetTile");
  -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v196 = v195;
  if ((_DWORD)v192)
  {
    objc_msgSend(v195, "titleAndDescriptionView");
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v197, "descriptionLabel");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v198, "font");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v200, "setFont:", v199);

    objc_msgSend(v196, "titleAndDescriptionView");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "descriptionLabel");
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v202, "text");
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v204, "setText:", v203);

    objc_msgSend(v196, "titleAndDescriptionView");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v205, "descriptionLabel");
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v206, "textColor");
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v208, "setTextColor:", v207);

    -[HUQuickControlPresentationCoordinator secondaryLabelFrameInActionSetTile](self, "secondaryLabelFrameInActionSetTile");
    v210 = v209;
    v212 = v211;
    v214 = v213;
    v216 = v215;
    -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v217, "setFrame:", v210, v212, v214, v216);

  }
  else
  {
    objc_msgSend(v195, "coloredDescriptionLabel");
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v218, "font");
    v219 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v220, "setFont:", v219);

    -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v221, "coloredDescriptionLabel");
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v222, "text");
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v224, "setText:", v223);

    -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v225, "coloredDescriptionLabel");
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v226, "textColor");
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v228, "setTextColor:", v227);

    -[HUQuickControlPresentationCoordinator secondaryLabelFrameInTile](self, "secondaryLabelFrameInTile");
    v230 = v229;
    v232 = v231;
    v234 = v233;
    v236 = v235;
    -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "setFrame:", v230, v232, v234, v236);
  }

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v237, "setHidden:", 1);

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v238, "setNumberOfLines:", 0);

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v239, "setContentMode:", 1);

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v240, "sizeToFit");

  v241 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", 0);
  -[HUQuickControlPresentationCoordinator setTransitionSecondaryLabelVibrantEffectView:](self, "setTransitionSecondaryLabelVibrantEffectView:", v241);

  if (-[HUQuickControlPresentationCoordinator isTileOff](self, "isTileOff"))
  {
    if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
    {
      objc_msgSend(MEMORY[0x1E0CEABA8], "controlCenterSecondaryVibrancyEffect");
      v242 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlPresentationCoordinator transitionSecondaryLabelVibrantEffectView](self, "transitionSecondaryLabelVibrantEffectView");
      v243 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v243, "setEffect:", v242);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 7);
      v242 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEABA8], "effectForBlurEffect:style:", v242, 2);
      v243 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlPresentationCoordinator transitionSecondaryLabelVibrantEffectView](self, "transitionSecondaryLabelVibrantEffectView");
      v244 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v244, "setEffect:", v243);

    }
  }
  -[HUQuickControlPresentationCoordinator transitionSecondaryLabelVibrantEffectView](self, "transitionSecondaryLabelVibrantEffectView");
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v245, "setHidden:", 1);

  -[HUQuickControlPresentationCoordinator secondaryLabelFrameInTile](self, "secondaryLabelFrameInTile");
  v247 = v246;
  v249 = v248;
  v251 = v250;
  v253 = v252;
  -[HUQuickControlPresentationCoordinator transitionSecondaryLabelVibrantEffectView](self, "transitionSecondaryLabelVibrantEffectView");
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v254, "setFrame:", v247, v249, v251, v253);

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabelVibrantEffectView](self, "transitionSecondaryLabelVibrantEffectView");
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v255, "bounds");
  v257 = v256;
  v259 = v258;
  v261 = v260;
  v263 = v262;
  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v264, "setFrame:", v257, v259, v261, v263);

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v265, "setNeedsLayout");

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabelVibrantEffectView](self, "transitionSecondaryLabelVibrantEffectView");
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v266, "setNeedsLayout");

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabelVibrantEffectView](self, "transitionSecondaryLabelVibrantEffectView");
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v267, "contentView");
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v268, "addSubview:", v269);

  -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
  v272 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v272, "view");
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator transitionSecondaryLabelVibrantEffectView](self, "transitionSecondaryLabelVibrantEffectView");
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v270, "addSubview:", v271);

}

- (id)_legacyAnimationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v6;
  uint64_t v7;
  _QWORD v9[5];
  _QWORD v10[5];

  -[HUQuickControlPresentationCoordinator _createTransitionViewsForPresentation](self, "_createTransitionViewsForPresentation", a3, a4, a5);
  v6 = objc_alloc_init(MEMORY[0x1E0CEAEA8]);
  objc_msgSend(v6, "setIsReversed:", 0);
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __128__HUQuickControlPresentationCoordinator__legacyAnimationControllerForPresentedController_presentingController_sourceController___block_invoke;
  v10[3] = &unk_1E6F4D988;
  v10[4] = self;
  objc_msgSend(v6, "setNoninteractiveAnimations:", v10);
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __128__HUQuickControlPresentationCoordinator__legacyAnimationControllerForPresentedController_presentingController_sourceController___block_invoke_4;
  v9[3] = &unk_1E6F4E300;
  v9[4] = self;
  objc_msgSend(v6, "setNoninteractiveCompletion:", v9);
  -[HUQuickControlPresentationCoordinator sourceFrameForAnimationController](self, "sourceFrameForAnimationController");
  objc_msgSend(v6, "setSourceFrame:");
  return v6;
}

uint64_t __128__HUQuickControlPresentationCoordinator__legacyAnimationControllerForPresentedController_presentingController_sourceController___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];
  CAFrameRateRange v5;

  v2 = (void *)MEMORY[0x1E0CEABB0];
  v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __128__HUQuickControlPresentationCoordinator__legacyAnimationControllerForPresentedController_presentingController_sourceController___block_invoke_2;
  v4[3] = &unk_1E6F4D988;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1769473, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

void __128__HUQuickControlPresentationCoordinator__legacyAnimationControllerForPresentedController_presentingController_sourceController___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  void *v110;
  void *v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  void *v120;
  void *v121;
  void *v122;
  _QWORD v123[5];

  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationBarTitleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "summaryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  objc_msgSend(*(id *)(a1 + 32), "cardNavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationBar");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentationCoordinatorWillBeginTransition:presenting:", *(_QWORD *)(a1 + 32), 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "pressedTileBlurEffectView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 0);

  if (objc_msgSend(*(id *)(a1 + 32), "isTileOff"))
  {
    objc_msgSend(*(id *)(a1 + 32), "cardNavigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    objc_msgSend(*(id *)(a1 + 32), "pressedTileBlurEffectView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

    objc_msgSend(*(id *)(a1 + 32), "pressedTileBlurEffectView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "layoutIfNeeded");

    objc_msgSend(*(id *)(a1 + 32), "pressedTileBlurEffectView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAlpha:", 0.0);

  }
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithBlurRadius:", 20.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transitionBlurView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setEffect:", v23);

  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setAlpha:", 1.0);

  v123[0] = MEMORY[0x1E0C809B0];
  v123[1] = 3221225472;
  v123[2] = __128__HUQuickControlPresentationCoordinator__legacyAnimationControllerForPresentedController_presentingController_sourceController___block_invoke_3;
  v123[3] = &unk_1E6F4D988;
  v123[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v123, 0, 0.5, 0.115);
  objc_msgSend(*(id *)(a1 + 32), "transitionIconView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setHidden:", 0);

  v28 = objc_msgSend(*(id *)(a1 + 32), "iconSizeInNavigationBar");
  objc_msgSend(*(id *)(a1 + 32), "transitionIconView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setIconSize:", v28);

  objc_msgSend(*(id *)(a1 + 32), "iconFrameInNavigationBar");
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  objc_msgSend(*(id *)(a1 + 32), "transitionIconView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setFrame:", v31, v33, v35, v37);

  objc_msgSend(*(id *)(a1 + 32), "transitionIconView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "layoutIfNeeded");

  if (objc_msgSend(*(id *)(a1 + 32), "isTileOff"))
  {
    objc_msgSend(*(id *)(a1 + 32), "transitionIconViewVibrant");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setHidden:", 0);

    v41 = objc_msgSend(*(id *)(a1 + 32), "iconSizeInNavigationBar");
    objc_msgSend(*(id *)(a1 + 32), "transitionIconViewVibrant");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setIconSize:", v41);

    objc_msgSend(*(id *)(a1 + 32), "iconFrameInNavigationBar");
    v44 = v43;
    v46 = v45;
    v48 = v47;
    v50 = v49;
    objc_msgSend(*(id *)(a1 + 32), "transitionIconViewVibrant");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setFrame:", v44, v46, v48, v50);

    objc_msgSend(*(id *)(a1 + 32), "transitionIconViewVibrant");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "layoutIfNeeded");

  }
  v53 = objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials");
  v54 = *(void **)(a1 + 32);
  if (v53)
  {
    objc_msgSend(v54, "transitionIconView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setAlpha:", 0.0);

    objc_msgSend(*(id *)(a1 + 32), "transitionIconViewVibrant");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v56;
    v58 = 1.0;
  }
  else
  {
    objc_msgSend(v54, "transitionIconViewVibrant");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v56;
    v58 = 0.0;
  }
  objc_msgSend(v56, "setAlpha:", v58);

  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "navigationBarTitleView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "summaryView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "primaryLabel");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "font");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transitionPrimaryLabel");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setFont:", v63);

  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "navigationBarTitleView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "summaryView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "primaryLabel");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "text");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transitionPrimaryLabel");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setText:", v69);

  objc_msgSend(*(id *)(a1 + 32), "transitionPrimaryLabel");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "primaryLabelFrameInNavigationBar");
  v73 = v72;
  v75 = v74;
  v77 = v76;
  v79 = v78;
  objc_msgSend(*(id *)(a1 + 32), "transitionPrimaryLabel");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setFrame:", v73, v75, v77, v79);

  objc_msgSend(*(id *)(a1 + 32), "transitionPrimaryLabel");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "navigationBarTitleView");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "summaryView");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "secondaryLabel");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "font");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabel");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setFont:", v86);

  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "navigationBarTitleView");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "summaryView");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "secondaryLabel");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "text");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabel");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "setText:", v92);

  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "navigationBarTitleView");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "summaryView");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "secondaryLabel");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "textColor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabel");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "setTextColor:", v98);

  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabel");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabelVibrantEffectView");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "secondaryLabelFrameInNavigationBar");
  v103 = v102;
  v105 = v104;
  v107 = v106;
  v109 = v108;
  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabelVibrantEffectView");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "setFrame:", v103, v105, v107, v109);

  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabelVibrantEffectView");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "bounds");
  v113 = v112;
  v115 = v114;
  v117 = v116;
  v119 = v118;
  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabel");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "setFrame:", v113, v115, v117, v119);

  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabel");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabelVibrantEffectView");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "layoutIfNeeded");

}

void __128__HUQuickControlPresentationCoordinator__legacyAnimationControllerForPresentedController_presentingController_sourceController___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "closeButton");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __128__HUQuickControlPresentationCoordinator__legacyAnimationControllerForPresentedController_presentingController_sourceController___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationBarTitleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "summaryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

  return objc_msgSend(*(id *)(a1 + 32), "removeAllTransitionSubviews");
}

- (void)__createLegacyTransitionViewsForDismissal
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  unint64_t v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  unint64_t v75;
  id v76;
  void *v77;
  unint64_t v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  __objc2_class **v107;
  void *v108;
  uint64_t v109;
  _BOOL4 v110;
  id v111;
  void *v112;
  void *v113;
  void *v114;
  HUGridServiceCellTextView *v115;
  void *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  double v121;
  double v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  double v132;
  double v133;
  double v134;
  double v135;
  void *v136;
  void *v137;
  double v138;
  double v139;
  void *v140;
  void *v141;
  double v142;
  double v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  HUGridServiceCellTextView *v150;
  void *v151;
  uint64_t v152;
  void *v153;
  void *v154;
  void *v155;
  double v156;
  double v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  double v177;
  double v178;
  void *v179;
  double v180;
  double v181;
  double v182;
  double v183;
  void *v184;
  double v185;
  double v186;
  void *v187;
  double v188;
  double v189;
  void *v190;
  void *v191;
  void *v192;
  HUGridActionSetTitleAndDescriptionView *v193;
  void *v194;
  void *v195;
  HUGridActionSetTitleAndDescriptionView *v196;
  void *v197;
  uint64_t v198;
  void *v199;
  void *v200;
  double v201;
  double v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  double v219;
  double v220;
  double v221;
  double v222;
  double v223;
  double v224;
  double v225;
  double v226;
  void *v227;
  void *v228;
  double v229;
  double v230;
  double v231;
  double v232;
  double v233;
  double v234;
  double v235;
  double v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  id v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  double v261;
  double v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  double v270;
  double v271;
  double v272;
  double v273;
  double v274;
  double v275;
  double v276;
  double v277;
  void *v278;
  void *v279;
  double v280;
  double v281;
  double v282;
  double v283;
  double v284;
  double v285;
  double v286;
  double v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  _QWORD v298[3];

  v298[2] = *MEMORY[0x1E0C80C00];
  -[HUQuickControlPresentationCoordinator removeAllTransitionSubviews](self, "removeAllTransitionSubviews");
  -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateUIWithAnimation:", 0);

  v4 = 0x1E0CEA000uLL;
  if (-[HUQuickControlPresentationCoordinator isTileOff](self, "isTileOff"))
  {
    if (+[HUGraphicsUtilities shouldReduceVisualEffects](HUGraphicsUtilities, "shouldReduceVisualEffects"))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", 0);
      -[HUQuickControlPresentationCoordinator setPressedTileBlurEffectView:](self, "setPressedTileBlurEffectView:", v5);

      -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "gridBackgroundView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "frame");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      -[HUQuickControlPresentationCoordinator pressedTilePrerenderedView](self, "pressedTilePrerenderedView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

      objc_msgSend(v7, "layer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "contentsRect");
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v27 = v26;
      -[HUQuickControlPresentationCoordinator pressedTilePrerenderedView](self, "pressedTilePrerenderedView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "layer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setContentsRect:", v21, v23, v25, v27);

      -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "view");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlPresentationCoordinator pressedTilePrerenderedView](self, "pressedTilePrerenderedView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "insertSubview:atIndex:", v32, 0);

    }
    else
    {
      if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
      {
        if ((objc_msgSend(MEMORY[0x1E0D313C8], "isSpringBoard") & 1) != 0)
          objc_msgSend(MEMORY[0x1E0D14788], "controlCenterModuleBackgroundMaterial");
        else
          objc_msgSend(MEMORY[0x1E0D14788], "controlCenterTertiaryMaterial");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUQuickControlPresentationCoordinator setPressedTileBlurEffectView:](self, "setPressedTileBlurEffectView:", v35);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 1202);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v35);
        -[HUQuickControlPresentationCoordinator setPressedTileBlurEffectView:](self, "setPressedTileBlurEffectView:", v36);

      }
      -[HUQuickControlPresentationCoordinator pressedTileBlurEffectView](self, "pressedTileBlurEffectView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setHidden:", 1);

      -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "view");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "frame");
      v41 = v40;
      v43 = v42;
      v45 = v44;
      v47 = v46;
      -[HUQuickControlPresentationCoordinator pressedTileBlurEffectView](self, "pressedTileBlurEffectView");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setFrame:", v41, v43, v45, v47);

      -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "view");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlPresentationCoordinator pressedTileBlurEffectView](self, "pressedTileBlurEffectView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "insertSubview:atIndex:", v31, 0);
    }
  }
  else
  {
    if (!objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
      goto LABEL_14;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setBackgroundColor:", v33);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setBackgroundColor:", v7);
  }

LABEL_14:
  v49 = objc_alloc_init(MEMORY[0x1E0D33720]);
  -[HUQuickControlPresentationCoordinator setTransitionIconView:](self, "setTransitionIconView:", v49);

  -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "item");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "latestResults");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C60]);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUQuickControlPresentationCoordinator transitionIconView](self, "transitionIconView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setContentMode:", 1);

  v55 = -[HUQuickControlPresentationCoordinator iconSizeInNavigationBar](self, "iconSizeInNavigationBar");
  -[HUQuickControlPresentationCoordinator transitionIconView](self, "transitionIconView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setIconSize:", v55);

  -[HUQuickControlPresentationCoordinator iconFrameInNavigationBar](self, "iconFrameInNavigationBar");
  v58 = v57;
  v60 = v59;
  v62 = v61;
  v64 = v63;
  -[HUQuickControlPresentationCoordinator transitionIconView](self, "transitionIconView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setFrame:", v58, v60, v62, v64);

  -[HUQuickControlPresentationCoordinator transitionIconView](self, "transitionIconView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setHidden:", 1);

  -[HUQuickControlPresentationCoordinator transitionIconView](self, "transitionIconView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "navigationBarTitleView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "summaryView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "iconView");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "updateWithIconDescriptor:displayStyle:animated:", v53, objc_msgSend(v71, "displayStyle"), 0);

  -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "view");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator transitionIconView](self, "transitionIconView");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "addSubview:", v74);

  v75 = 0x1E0D31000uLL;
  v76 = objc_alloc_init(MEMORY[0x1E0D33720]);
  -[HUQuickControlPresentationCoordinator setTransitionIconViewVibrant:](self, "setTransitionIconViewVibrant:", v76);

  -[HUQuickControlPresentationCoordinator transitionIconViewVibrant](self, "transitionIconViewVibrant");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setContentMode:", 1);

  v78 = -[HUQuickControlPresentationCoordinator iconSizeInNavigationBar](self, "iconSizeInNavigationBar");
  -[HUQuickControlPresentationCoordinator transitionIconViewVibrant](self, "transitionIconViewVibrant");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setIconSize:", v78);

  -[HUQuickControlPresentationCoordinator iconFrameInNavigationBar](self, "iconFrameInNavigationBar");
  v81 = v80;
  v83 = v82;
  v85 = v84;
  v87 = v86;
  -[HUQuickControlPresentationCoordinator transitionIconViewVibrant](self, "transitionIconViewVibrant");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setFrame:", v81, v83, v85, v87);

  -[HUQuickControlPresentationCoordinator transitionIconViewVibrant](self, "transitionIconViewVibrant");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setHidden:", 1);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator transitionIconView](self, "transitionIconView");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setTintColor:", v90);

  if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
  {
    if (objc_msgSend(MEMORY[0x1E0D313C8], "isHomeControlService"))
    {
      v92 = (void *)MEMORY[0x1E0CEA480];
      objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "colorEffectMonochromeTint:blendingAmount:brightnessAdjustment:", v93, 1.0, 0.45);
      v94 = (void *)objc_claimAutoreleasedReturnValue();

      v95 = (void *)MEMORY[0x1E0CEABE0];
      v298[0] = v94;
      objc_msgSend(MEMORY[0x1E0CEABA8], "controlCenterPrimaryVibrancyEffect");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v298[1] = v96;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v298, 2);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "effectCombiningEffects:", v97);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlPresentationCoordinator transitionIconViewVibrant](self, "transitionIconViewVibrant");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "setVibrancyEffect:", v98);

      goto LABEL_20;
    }
    objc_msgSend(MEMORY[0x1E0CEABA8], "controlCenterSecondaryVibrancyEffect");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionIconViewVibrant](self, "transitionIconViewVibrant");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "setVibrancyEffect:", v94);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 7);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEABA8], "effectForBlurEffect:style:", v94, 4);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionIconViewVibrant](self, "transitionIconViewVibrant");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "setVibrancyEffect:", v100);

  }
LABEL_20:

  -[HUQuickControlPresentationCoordinator transitionIconViewVibrant](self, "transitionIconViewVibrant");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "updateWithIconDescriptor:displayStyle:animated:", v53, 2, 0);

  -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "view");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator transitionIconViewVibrant](self, "transitionIconViewVibrant");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator transitionIconView](self, "transitionIconView");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "insertSubview:below:", v105, v106);

  v107 = off_1E6F3C000;
  if (-[HUQuickControlPresentationCoordinator isActionSetTile](self, "isActionSetTile"))
  {
    -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 7);
    v109 = objc_claimAutoreleasedReturnValue();
    v110 = -[HUQuickControlPresentationCoordinator isTileOff](self, "isTileOff");
    v111 = objc_alloc(MEMORY[0x1E0CEABE8]);
    v112 = v111;
    v297 = (void *)v109;
    if (v110)
    {
      objc_msgSend(MEMORY[0x1E0CEABA8], "effectForBlurEffect:style:", v109, 4);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = (void *)objc_msgSend(v112, "initWithEffect:", v113);
      -[HUQuickControlPresentationCoordinator setTransitionTitleAndDescriptionVibrantEffectView:](self, "setTransitionTitleAndDescriptionVibrantEffectView:", v114);

    }
    else
    {
      v113 = (void *)objc_msgSend(v111, "initWithEffect:", 0);
      -[HUQuickControlPresentationCoordinator setTransitionTitleAndDescriptionVibrantEffectView:](self, "setTransitionTitleAndDescriptionVibrantEffectView:", v113);
    }

    -[HUQuickControlPresentationCoordinator titleAndDescriptionViewFrameInActionSetTile](self, "titleAndDescriptionViewFrameInActionSetTile");
    v172 = v171;
    v174 = v173;
    v176 = v175;
    v178 = v177;
    -[HUQuickControlPresentationCoordinator transitionTitleAndDescriptionVibrantEffectView](self, "transitionTitleAndDescriptionVibrantEffectView");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v179, "setFrame:", v172, v174, v176, v178);

    -[HUQuickControlPresentationCoordinator primaryLabelFrameInNavigationBar](self, "primaryLabelFrameInNavigationBar");
    v181 = v180;
    -[HUQuickControlPresentationCoordinator primaryLabelFrameInNavigationBar](self, "primaryLabelFrameInNavigationBar");
    v183 = v182;
    objc_msgSend(v108, "titleAndDescriptionView");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "frame");
    v186 = v185;
    objc_msgSend(v108, "titleAndDescriptionView");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "frame");
    v189 = v188;

    -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v190, "view");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionTitleAndDescriptionVibrantEffectView](self, "transitionTitleAndDescriptionVibrantEffectView");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v191, "addSubview:", v192);

    v193 = [HUGridActionSetTitleAndDescriptionView alloc];
    -[HUQuickControlPresentationCoordinator transitionTitleAndDescriptionVibrantEffectView](self, "transitionTitleAndDescriptionVibrantEffectView");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v194, "contentView");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    v196 = -[HUGridActionSetTitleAndDescriptionView initWithFrame:titleLabelSuperview:](v193, "initWithFrame:titleLabelSuperview:", v195, v181, v183, v186, v189);
    -[HUQuickControlPresentationCoordinator setTransitionTitleAndDescriptionView:](self, "setTransitionTitleAndDescriptionView:", v196);

    objc_msgSend(v108, "sceneCellLayoutOptions");
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    v198 = objc_msgSend(v197, "numberOfTitleLines");
    -[HUQuickControlPresentationCoordinator transitionTitleAndDescriptionView](self, "transitionTitleAndDescriptionView");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v199, "titleLabel");
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v200, "setNumberOfLines:", v198);

    objc_msgSend(v197, "titleDescriptionLineSpacing");
    v202 = v201;
    -[HUQuickControlPresentationCoordinator transitionTitleAndDescriptionView](self, "transitionTitleAndDescriptionView");
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v203, "setTitleDescriptionLineSpacing:", v202);

    -[HUQuickControlPresentationCoordinator transitionTitleAndDescriptionView](self, "transitionTitleAndDescriptionView");
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "titleAndDescriptionView");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v205, "titleLabel");
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v206, "attributedText");
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "titleAndDescriptionView");
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v208, "descriptionLabel");
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v209, "attributedText");
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v204, "updateTitleText:descriptionText:", v207, v210);

    -[HUQuickControlPresentationCoordinator transitionTitleAndDescriptionView](self, "transitionTitleAndDescriptionView");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v211, "setHidden:", 1);

    -[HUQuickControlPresentationCoordinator transitionTitleAndDescriptionVibrantEffectView](self, "transitionTitleAndDescriptionVibrantEffectView");
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v212, "setHidden:", 1);

    -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v213, "view");
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionTitleAndDescriptionView](self, "transitionTitleAndDescriptionView");
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v214, "addSubview:", v215);

    v4 = 0x1E0CEA000;
    v75 = 0x1E0D31000;
    v107 = off_1E6F3C000;
    v216 = v297;
  }
  else
  {
    v115 = objc_alloc_init(HUGridServiceCellTextView);
    -[HUQuickControlPresentationCoordinator setTransitionTextView:](self, "setTransitionTextView:", v115);

    -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = objc_msgSend(v116, "shouldShowRoomName");
    -[HUQuickControlPresentationCoordinator transitionTextView](self, "transitionTextView");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "setShouldShowRoomName:", v117);

    -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "serviceTextView");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "lineHeight");
    v122 = v121;
    -[HUQuickControlPresentationCoordinator transitionTextView](self, "transitionTextView");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "setLineHeight:", v122);

    -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "serviceTextView");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "font");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionTextView](self, "transitionTextView");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "setFont:", v126);

    -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "serviceTextView");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "serviceNameComponents");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionTextView](self, "transitionTextView");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "setServiceNameComponents:", v130);

    -[HUQuickControlPresentationCoordinator primaryLabelFrameInNavigationBar](self, "primaryLabelFrameInNavigationBar");
    v133 = v132;
    -[HUQuickControlPresentationCoordinator primaryLabelFrameInNavigationBar](self, "primaryLabelFrameInNavigationBar");
    v135 = v134;
    -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "serviceTextView");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "frame");
    v139 = v138;
    -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "serviceTextView");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "frame");
    v143 = v142;
    -[HUQuickControlPresentationCoordinator transitionTextView](self, "transitionTextView");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "setFrame:", v133, v135, v139, v143);

    -[HUQuickControlPresentationCoordinator transitionTextView](self, "transitionTextView");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "setHidden:", 1);

    -[HUQuickControlPresentationCoordinator transitionTextView](self, "transitionTextView");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "setNeedsLayout");

    -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "view");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionTextView](self, "transitionTextView");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "addSubview:", v149);

    v150 = objc_alloc_init(HUGridServiceCellTextView);
    -[HUQuickControlPresentationCoordinator setTransitionTextViewVibrant:](self, "setTransitionTextViewVibrant:", v150);

    -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v152 = objc_msgSend(v151, "shouldShowRoomName");
    -[HUQuickControlPresentationCoordinator transitionTextViewVibrant](self, "transitionTextViewVibrant");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "setShouldShowRoomName:", v152);

    -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "serviceTextView");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "lineHeight");
    v157 = v156;
    -[HUQuickControlPresentationCoordinator transitionTextViewVibrant](self, "transitionTextViewVibrant");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "setLineHeight:", v157);

    -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "serviceTextView");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "font");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionTextViewVibrant](self, "transitionTextViewVibrant");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "setFont:", v161);

    -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "serviceTextView");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "serviceNameComponents");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionTextViewVibrant](self, "transitionTextViewVibrant");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "setServiceNameComponents:", v165);

    -[HUQuickControlPresentationCoordinator transitionTextViewVibrant](self, "transitionTextViewVibrant");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "sizeToFit");

    v168 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", 0);
    -[HUQuickControlPresentationCoordinator setTransitionTextViewVibrantEffectView:](self, "setTransitionTextViewVibrantEffectView:", v168);

    if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
    {
      objc_msgSend(MEMORY[0x1E0CEABA8], "controlCenterPrimaryVibrancyEffect");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlPresentationCoordinator transitionTextViewVibrantEffectView](self, "transitionTextViewVibrantEffectView");
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v170, "setEffect:", v169);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 7);
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEABA8], "effectForBlurEffect:style:", v169, 4);
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlPresentationCoordinator transitionTextViewVibrantEffectView](self, "transitionTextViewVibrantEffectView");
      v217 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v217, "setEffect:", v170);

    }
    -[HUQuickControlPresentationCoordinator transitionTextView](self, "transitionTextView");
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v218, "frame");
    v220 = v219;
    v222 = v221;
    v224 = v223;
    v226 = v225;
    -[HUQuickControlPresentationCoordinator transitionTextViewVibrantEffectView](self, "transitionTextViewVibrantEffectView");
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v227, "setFrame:", v220, v222, v224, v226);

    -[HUQuickControlPresentationCoordinator transitionTextViewVibrantEffectView](self, "transitionTextViewVibrantEffectView");
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v228, "bounds");
    v230 = v229;
    v232 = v231;
    v234 = v233;
    v236 = v235;
    -[HUQuickControlPresentationCoordinator transitionTextViewVibrant](self, "transitionTextViewVibrant");
    v237 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v237, "setFrame:", v230, v232, v234, v236);

    -[HUQuickControlPresentationCoordinator transitionTextViewVibrantEffectView](self, "transitionTextViewVibrantEffectView");
    v238 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v238, "setHidden:", 1);

    -[HUQuickControlPresentationCoordinator transitionTextViewVibrantEffectView](self, "transitionTextViewVibrantEffectView");
    v239 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v239, "contentView");
    v240 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionTextViewVibrant](self, "transitionTextViewVibrant");
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v240, "addSubview:", v241);

    -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "view");
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionTextViewVibrantEffectView](self, "transitionTextViewVibrantEffectView");
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionTextView](self, "transitionTextView");
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v216, "insertSubview:below:", v197, v213);
  }

  if (!-[HUQuickControlPresentationCoordinator isActionSetTile](self, "isActionSetTile"))
  {
    v242 = objc_alloc_init(MEMORY[0x1E0CEA700]);
    -[HUQuickControlPresentationCoordinator setTransitionSecondaryLabel:](self, "setTransitionSecondaryLabel:", v242);

    -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
    v243 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v243, "setNumberOfLines:", 1);

    if (!-[HUQuickControlPresentationCoordinator isTileOff](self, "isTileOff"))
      goto LABEL_33;
    -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v244, "serviceTextView");
    v245 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v245, "descriptionText");
    v246 = (void *)objc_claimAutoreleasedReturnValue();

    if (v246)
    {
      -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
      v247 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v247, "serviceTextView");
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v248, "font");
      v249 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
      v250 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v250, "setFont:", v249);

      -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
      v251 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v251, "serviceTextView");
      v252 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v252, "descriptionText");
      v253 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
      v254 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v254, "setText:", v253);
    }
    else
    {
LABEL_33:
      -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy", v297);
      v255 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "coloredDescriptionLabel");
      v256 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v256, "attributedText");
      v257 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
      v258 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v258, "setAttributedText:", v257);

      -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
      v251 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v251, "coloredDescriptionLabel");
      v252 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v252, "textColor");
      v253 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
      v254 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v254, "setTextColor:", v253);
    }

    -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v259, "setAllowsDefaultTighteningForTruncation:", 1);

    -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
    v260 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v260, "setAdjustsFontSizeToFitWidth:", 1);

    -[__objc2_class minimumDescriptionScaleFactor](v107[300], "minimumDescriptionScaleFactor");
    v262 = v261;
    -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
    v263 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v263, "setMinimumScaleFactor:", v262);

    -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
    v264 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v264, "sizeToFit");

    v265 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", 0);
    -[HUQuickControlPresentationCoordinator setTransitionSecondaryLabelVibrantEffectView:](self, "setTransitionSecondaryLabelVibrantEffectView:", v265);

    if (-[HUQuickControlPresentationCoordinator isTileOff](self, "isTileOff"))
    {
      if (objc_msgSend(*(id *)(v75 + 2512), "shouldUseControlCenterMaterials"))
      {
        objc_msgSend(MEMORY[0x1E0CEABA8], "controlCenterSecondaryVibrancyEffect");
        v266 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUQuickControlPresentationCoordinator transitionSecondaryLabelVibrantEffectView](self, "transitionSecondaryLabelVibrantEffectView");
        v267 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v267, "setEffect:", v266);
      }
      else
      {
        objc_msgSend(*(id *)(v4 + 920), "effectWithStyle:", 7);
        v266 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEABA8], "effectForBlurEffect:style:", v266, 2);
        v267 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUQuickControlPresentationCoordinator transitionSecondaryLabelVibrantEffectView](self, "transitionSecondaryLabelVibrantEffectView");
        v268 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v268, "setEffect:", v267);

      }
    }
    -[HUQuickControlPresentationCoordinator transitionSecondaryLabelVibrantEffectView](self, "transitionSecondaryLabelVibrantEffectView", v297);
    v269 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v269, "setHidden:", 1);

    -[HUQuickControlPresentationCoordinator secondaryLabelFrameInNavigationBar](self, "secondaryLabelFrameInNavigationBar");
    v271 = v270;
    v273 = v272;
    v275 = v274;
    v277 = v276;
    -[HUQuickControlPresentationCoordinator transitionSecondaryLabelVibrantEffectView](self, "transitionSecondaryLabelVibrantEffectView");
    v278 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v278, "setFrame:", v271, v273, v275, v277);

    -[HUQuickControlPresentationCoordinator transitionSecondaryLabelVibrantEffectView](self, "transitionSecondaryLabelVibrantEffectView");
    v279 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v279, "bounds");
    v281 = v280;
    v283 = v282;
    v285 = v284;
    v287 = v286;
    -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
    v288 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v288, "setFrame:", v281, v283, v285, v287);

    -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
    v289 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v289, "setNeedsLayout");

    -[HUQuickControlPresentationCoordinator transitionSecondaryLabelVibrantEffectView](self, "transitionSecondaryLabelVibrantEffectView");
    v290 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v290, "setNeedsLayout");

    -[HUQuickControlPresentationCoordinator transitionSecondaryLabelVibrantEffectView](self, "transitionSecondaryLabelVibrantEffectView");
    v291 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v291, "contentView");
    v292 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
    v293 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v292, "addSubview:", v293);

    -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
    v294 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v294, "view");
    v295 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator transitionSecondaryLabelVibrantEffectView](self, "transitionSecondaryLabelVibrantEffectView");
    v296 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v295, "addSubview:", v296);

  }
}

- (id)_legacyAnimationControllerForDismissedController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  id v8;
  uint64_t v9;
  _QWORD v11[5];
  _QWORD v12[5];

  -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[HUQuickControlPresentationCoordinator _createTransitionViewsForDismissal](self, "_createTransitionViewsForDismissal");
    v8 = objc_alloc_init(MEMORY[0x1E0CEAEA8]);
    objc_msgSend(v8, "setIsReversed:", 1);
    v9 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __90__HUQuickControlPresentationCoordinator__legacyAnimationControllerForDismissedController___block_invoke;
    v12[3] = &unk_1E6F4D988;
    v12[4] = self;
    objc_msgSend(v8, "setNoninteractiveAnimations:", v12);
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __90__HUQuickControlPresentationCoordinator__legacyAnimationControllerForDismissedController___block_invoke_4;
    v11[3] = &unk_1E6F4E300;
    v11[4] = self;
    objc_msgSend(v8, "setNoninteractiveCompletion:", v11);
    -[HUQuickControlPresentationCoordinator sourceFrameForAnimationController](self, "sourceFrameForAnimationController");
    objc_msgSend(v8, "setSourceFrame:");
  }
  return v8;
}

uint64_t __90__HUQuickControlPresentationCoordinator__legacyAnimationControllerForDismissedController___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];
  CAFrameRateRange v5;

  v2 = (void *)MEMORY[0x1E0CEABB0];
  v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __90__HUQuickControlPresentationCoordinator__legacyAnimationControllerForDismissedController___block_invoke_2;
  v4[3] = &unk_1E6F4D988;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1769473, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

void __90__HUQuickControlPresentationCoordinator__legacyAnimationControllerForDismissedController___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
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
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  uint64_t v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  uint64_t v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  void *v68;
  uint64_t v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  uint64_t v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  int v83;
  void *v84;
  void *v85;
  void *v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  void *v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  void *v135;
  int v136;
  void *v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  void *v146;
  void *v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  void *v156;
  void *v157;
  void *v158;
  _QWORD v159[5];

  objc_msgSend(*(id *)(a1 + 32), "cardNavigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v5 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "cardViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShowsVerticalScrollIndicator:", 0);

    objc_msgSend(*(id *)(a1 + 32), "cardViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationBarTitleView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "summaryView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 1);

    objc_msgSend(*(id *)(a1 + 32), "cardViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "quickControlViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "controlContainerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", 1);

  }
  else
  {
    objc_msgSend(v5, "cardNavigationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHidden:", 1);

    objc_msgSend(*(id *)(a1 + 32), "cardNavigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "navigationBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", 1);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "presentationCoordinatorWillBeginTransition:presenting:", *(_QWORD *)(a1 + 32), 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "pressedTile_legacy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "backgroundState");

  if (v21 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "cardViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBackgroundColor:", v22);

    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "cardViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setBackgroundColor:", v24);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cardNavigationController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setBackgroundColor:", v26);

  objc_msgSend(*(id *)(a1 + 32), "pressedTileBlurEffectView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setHidden:", 0);

  if (objc_msgSend(*(id *)(a1 + 32), "isTileOff"))
  {
    objc_msgSend(*(id *)(a1 + 32), "cardNavigationController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "frame");
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v39 = v38;
    objc_msgSend(*(id *)(a1 + 32), "pressedTileBlurEffectView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);

    objc_msgSend(*(id *)(a1 + 32), "pressedTileBlurEffectView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setNeedsLayout");

  }
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithBlurRadius:", 0.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transitionBlurView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setEffect:", v42);

  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "view");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "navigationItem");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "_setManualScrollEdgeAppearanceProgress:", 0.0);

  v159[0] = MEMORY[0x1E0C809B0];
  v159[1] = 3221225472;
  v159[2] = __90__HUQuickControlPresentationCoordinator__legacyAnimationControllerForDismissedController___block_invoke_3;
  v159[3] = &unk_1E6F4D988;
  v159[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v159, 0, 0.1, 0.0);
  objc_msgSend(*(id *)(a1 + 32), "transitionIconView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setHidden:", 0);

  v49 = objc_msgSend(*(id *)(a1 + 32), "isActionSetTile");
  v50 = *(void **)(a1 + 32);
  if (v49)
  {
    v51 = objc_msgSend(v50, "iconSizeInActionSetTile");
    objc_msgSend(*(id *)(a1 + 32), "transitionIconView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setIconSize:", v51);

    objc_msgSend(*(id *)(a1 + 32), "iconFrameInActionSetTile");
  }
  else
  {
    v57 = objc_msgSend(v50, "iconSizeInTile");
    objc_msgSend(*(id *)(a1 + 32), "transitionIconView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setIconSize:", v57);

    objc_msgSend(*(id *)(a1 + 32), "iconFrameInTile");
  }
  v59 = v53;
  v60 = v54;
  v61 = v55;
  v62 = v56;
  objc_msgSend(*(id *)(a1 + 32), "transitionIconView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setFrame:", v59, v60, v61, v62);

  objc_msgSend(*(id *)(a1 + 32), "transitionIconView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setNeedsLayout");

  if (objc_msgSend(*(id *)(a1 + 32), "isTileOff"))
  {
    objc_msgSend(*(id *)(a1 + 32), "transitionIconView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setAlpha:", 0.0);

    objc_msgSend(*(id *)(a1 + 32), "transitionIconViewVibrant");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setHidden:", 0);

    v67 = objc_msgSend(*(id *)(a1 + 32), "isActionSetTile");
    v68 = *(void **)(a1 + 32);
    if (v67)
    {
      v69 = objc_msgSend(v68, "iconSizeInActionSetTile");
      objc_msgSend(*(id *)(a1 + 32), "transitionIconViewVibrant");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setIconSize:", v69);

      objc_msgSend(*(id *)(a1 + 32), "iconFrameInActionSetTile");
    }
    else
    {
      v75 = objc_msgSend(v68, "iconSizeInTile");
      objc_msgSend(*(id *)(a1 + 32), "transitionIconViewVibrant");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "setIconSize:", v75);

      objc_msgSend(*(id *)(a1 + 32), "iconFrameInTile");
    }
    v77 = v71;
    v78 = v72;
    v79 = v73;
    v80 = v74;
    objc_msgSend(*(id *)(a1 + 32), "transitionIconViewVibrant");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setFrame:", v77, v78, v79, v80);

    objc_msgSend(*(id *)(a1 + 32), "transitionIconViewVibrant");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setNeedsLayout");

  }
  v83 = objc_msgSend(*(id *)(a1 + 32), "isActionSetTile");
  v84 = *(void **)(a1 + 32);
  if (v83)
  {
    objc_msgSend(v84, "transitionTitleAndDescriptionView");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "setHidden:", 0);

    objc_msgSend(*(id *)(a1 + 32), "transitionTitleAndDescriptionVibrantEffectView");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setHidden:", 0);

    objc_msgSend(*(id *)(a1 + 32), "titleAndDescriptionViewFrameInActionSetTile");
    v88 = v87;
    v90 = v89;
    v92 = v91;
    v94 = v93;
    objc_msgSend(*(id *)(a1 + 32), "transitionTitleAndDescriptionView");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "setFrame:", v88, v90, v92, v94);

    if ((objc_msgSend(*(id *)(a1 + 32), "isTileOff") & 1) != 0)
      goto LABEL_25;
    objc_msgSend(*(id *)(a1 + 32), "pressedTile_legacy");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "titleAndDescriptionView");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "titleLabel");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "textColor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "transitionTitleAndDescriptionView");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "titleLabel");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "setTextColor:", v99);

  }
  else
  {
    objc_msgSend(v84, "transitionTextView");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setHidden:", 0);

    objc_msgSend(*(id *)(a1 + 32), "primaryLabelFrameInTile");
    v104 = v103;
    v106 = v105;
    v108 = v107;
    v110 = v109;
    objc_msgSend(*(id *)(a1 + 32), "transitionTextView");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "setFrame:", v104, v106, v108, v110);

    objc_msgSend(*(id *)(a1 + 32), "pressedTile_legacy");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "serviceTextView");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "textColor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "transitionTextView");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "setTextColor:", v114);

    if (!objc_msgSend(*(id *)(a1 + 32), "isTileOff"))
      goto LABEL_25;
    objc_msgSend(*(id *)(a1 + 32), "transitionTextView");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "setAlpha:", 0.0);

    objc_msgSend(*(id *)(a1 + 32), "transitionTextViewVibrantEffectView");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "setHidden:", 0);

    objc_msgSend(*(id *)(a1 + 32), "primaryLabelFrameInTile");
    v119 = v118;
    v121 = v120;
    v123 = v122;
    v125 = v124;
    objc_msgSend(*(id *)(a1 + 32), "transitionTextViewVibrantEffectView");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "setFrame:", v119, v121, v123, v125);

    objc_msgSend(*(id *)(a1 + 32), "transitionTextViewVibrantEffectView");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "bounds");
    v128 = v127;
    v130 = v129;
    v132 = v131;
    v134 = v133;
    objc_msgSend(*(id *)(a1 + 32), "transitionTextViewVibrant");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "setFrame:", v128, v130, v132, v134);
  }

LABEL_25:
  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabelVibrantEffectView");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "setHidden:", 0);

  v136 = objc_msgSend(*(id *)(a1 + 32), "isActionSetTile");
  v137 = *(void **)(a1 + 32);
  if (v136)
    objc_msgSend(v137, "secondaryLabelFrameInActionSetTile");
  else
    objc_msgSend(v137, "secondaryLabelFrameInTile");
  v142 = v138;
  v143 = v139;
  v144 = v140;
  v145 = v141;
  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabelVibrantEffectView");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "setFrame:", v142, v143, v144, v145);

  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabelVibrantEffectView");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "bounds");
  v149 = v148;
  v151 = v150;
  v153 = v152;
  v155 = v154;
  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabel");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "setFrame:", v149, v151, v153, v155);

  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabel");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "transitionSecondaryLabelVibrantEffectView");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "layoutIfNeeded");

}

void __90__HUQuickControlPresentationCoordinator__legacyAnimationControllerForDismissedController___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "closeButton");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __90__HUQuickControlPresentationCoordinator__legacyAnimationControllerForDismissedController___block_invoke_4(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentationCoordinatorWillEndTransition:presenting:", *(_QWORD *)(a1 + 32), 0);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "isTileOff"))
    objc_msgSend(*(id *)(a1 + 32), "removeAllTransitionSubviews");
  objc_msgSend(*(id *)(a1 + 32), "_restoreOriginalTile");
  objc_msgSend(*(id *)(a1 + 32), "transitionBlurView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

}

- (void)removeAllTransitionSubviews
{
  void *v3;
  void *v4;
  void *v5;
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

  -[HUQuickControlPresentationCoordinator pressedTileBlurEffectView](self, "pressedTileBlurEffectView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[HUQuickControlPresentationCoordinator transitionIconView](self, "transitionIconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[HUQuickControlPresentationCoordinator transitionIconViewVibrant](self, "transitionIconViewVibrant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  -[HUQuickControlPresentationCoordinator transitionPrimaryLabel](self, "transitionPrimaryLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabelVibrantEffectView](self, "transitionSecondaryLabelVibrantEffectView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromSuperview");

  -[HUQuickControlPresentationCoordinator transitionTextView](self, "transitionTextView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeFromSuperview");

  -[HUQuickControlPresentationCoordinator transitionTextViewVibrant](self, "transitionTextViewVibrant");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeFromSuperview");

  -[HUQuickControlPresentationCoordinator transitionTextViewVibrantEffectView](self, "transitionTextViewVibrantEffectView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeFromSuperview");

  -[HUQuickControlPresentationCoordinator transitionTitleAndDescriptionView](self, "transitionTitleAndDescriptionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeFromSuperview");

  -[HUQuickControlPresentationCoordinator transitionTitleAndDescriptionVibrantEffectView](self, "transitionTitleAndDescriptionVibrantEffectView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeFromSuperview");

  -[HUQuickControlPresentationCoordinator transitionPrefixLabel](self, "transitionPrefixLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeFromSuperview");

  -[HUQuickControlPresentationCoordinator transitionBaseIconView](self, "transitionBaseIconView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeFromSuperview");

  -[HUQuickControlPresentationCoordinator transitionBackgroundView](self, "transitionBackgroundView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeFromSuperview");

}

- (BOOL)isTileOff
{
  void *v3;
  BOOL v4;
  void *v5;

  -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "primaryState") == 1)
  {
    v4 = 1;
  }
  else
  {
    -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "primaryState") == 0;

  }
  return v4;
}

- (BOOL)isActionSetTile
{
  void *v3;
  char isKindOfClass;

  if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseLegacyQuickControlPresentation") & 1) != 0)
    -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
  else
    -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isCameraTile
{
  void *v3;
  char isKindOfClass;

  if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseLegacyQuickControlPresentation") & 1) != 0)
    -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
  else
    -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)iconSizeInTile
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "iconSize");

  return v4;
}

- (unint64_t)iconSizeInActionSetTile
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "iconSize");

  return v4;
}

- (CGRect)iconFrameInTile
{
  void *v2;
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
  CGRect result;

  -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)iconFrameInActionSetTile
{
  void *v2;
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
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneCellLayoutOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;

  objc_msgSend(v3, "iconInnerHorizontalMargin");
  v10 = v9;
  objc_msgSend(v3, "cellHeight");
  v12 = v11 * 0.5 - v8 * 0.5;

  v13 = v10;
  v14 = v12;
  v15 = v6;
  v16 = v8;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (unint64_t)iconSizeInNavigationBar
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationBarTitleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "summaryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "iconSize");

  return v6;
}

- (CGRect)iconFrameInNavigationBar
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[HUQuickControlPresentationCoordinator iconSizeInNavigationBar](self, "iconSizeInNavigationBar");
  HUDefaultSizeForIconSize();
  v4 = v3;
  v6 = v5;
  v7 = 14.0;
  if (-[HUQuickControlPresentationCoordinator _isRTL](self, "_isRTL"))
  {
    -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationBarTitleView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v7 = v10 + -14.0 - v4;

  }
  v11 = v7;
  v12 = 22.0;
  v13 = v4;
  v14 = v6;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)primaryLabelFrameInTile
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double MaxY;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGRect v36;
  CGRect v37;
  CGRect result;

  -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellInnerMargin");
  v9 = v5 + v8 * -2.0;

  -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serviceTextView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;

  -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cellInnerMargin");
  v17 = v16;

  -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  MaxY = CGRectGetMaxY(v36);
  -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layoutOptions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "cellInnerMargin");
  v24 = MaxY - v23;

  -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "serviceTextView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "frame");
  v27 = v24 - CGRectGetHeight(v37);
  -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "serviceTextView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "lastBaselineToBottomDistance");
  v31 = HURoundToScreenScale(v27 + v30);

  v32 = v17;
  v33 = v31;
  v34 = v9;
  v35 = v13;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (CGRect)primaryLabelFrameInActionSetTile
{
  void *v2;
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
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleAndDescriptionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)baseIconFrameInNavigationBar
{
  void *v3;
  void *v4;
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
  void *v15;
  void *v16;
  double v17;
  double v18;
  _BOOL4 v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBarTitleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "summaryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "baseIconView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "navigationBarTitleView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v18 = v17;

  v19 = -[HUQuickControlPresentationCoordinator _isRTL](self, "_isRTL");
  v20 = v18 - v12 + -14.0;
  if (!v19)
    v20 = v8;
  v21 = v10;
  v22 = v12;
  v23 = v14;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)primaryLabelFrameInNavigationBar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect v35;
  CGRect result;

  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBarTitleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "summaryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;

  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationBarTitleView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "summaryView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "primaryLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;

  if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseLegacyQuickControlPresentation") & 1) != 0)
  {
    if (!-[HUQuickControlPresentationCoordinator _isRTL](self, "_isRTL"))
    {
      -[HUQuickControlPresentationCoordinator transitionIconView](self, "transitionIconView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "frame");
      v28 = v27;
      -[HUQuickControlPresentationCoordinator transitionIconView](self, "transitionIconView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "frame");
      v25 = v28 + v30 + 14.0;

      goto LABEL_9;
    }
    -[HUQuickControlPresentationCoordinator iconFrameInNavigationBar](self, "iconFrameInNavigationBar");
    v16 = v15 + -14.0;
  }
  else
  {
    -[HUQuickControlPresentationCoordinator baseIconFrameInNavigationBar](self, "baseIconFrameInNavigationBar");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    if (!-[HUQuickControlPresentationCoordinator _isRTL](self, "_isRTL"))
    {
      v35.origin.x = v18;
      v35.origin.y = v20;
      v35.size.width = v22;
      v35.size.height = v24;
      v25 = CGRectGetMaxX(v35) + 14.0;
      goto LABEL_9;
    }
    v16 = v18 + -14.0;
  }
  v25 = v16 - v8;
LABEL_9:
  v31 = 16.0;
  v32 = v25;
  v33 = v8;
  v34 = v14;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v31;
  result.origin.x = v32;
  return result;
}

- (CGRect)secondaryLabelFrameInTile
{
  void *v3;
  void *v4;
  double Width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  CGFloat Height;
  void *v12;
  void *v13;
  double MinX;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double MaxY;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect result;

  -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  Width = CGRectGetWidth(v33);
  -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellInnerMargin");
  v9 = Width + v8 * -2.0;

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  Height = CGRectGetHeight(v34);

  -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  MinX = CGRectGetMinX(v35);
  -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layoutOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "cellInnerMargin");
  v18 = MinX + v17;

  -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  MaxY = CGRectGetMaxY(v36);
  -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "layoutOptions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "cellInnerMargin");
  v25 = MaxY - v24;

  -[HUQuickControlPresentationCoordinator transitionSecondaryLabel](self, "transitionSecondaryLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_lastLineBaseline");
  v28 = HURoundToScreenScale(v25 - v27);

  v29 = v18;
  v30 = v28;
  v31 = v9;
  v32 = Height;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (CGRect)secondaryLabelFrameInActionSetTile
{
  void *v2;
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
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleAndDescriptionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)secondaryLabelFrameInNavigationBar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  CGFloat v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGRect v41;
  CGRect result;

  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBarTitleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "summaryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "secondaryLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;

  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationBarTitleView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "summaryView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "secondaryLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;

  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "navigationBarTitleView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "summaryView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "primaryLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frame");
  v20 = v19;

  if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseLegacyQuickControlPresentation") & 1) != 0)
  {
    if (!-[HUQuickControlPresentationCoordinator _isRTL](self, "_isRTL"))
    {
      -[HUQuickControlPresentationCoordinator transitionIconView](self, "transitionIconView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "frame");
      v34 = v33;
      -[HUQuickControlPresentationCoordinator transitionIconView](self, "transitionIconView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "frame");
      v31 = v34 + v36 + 14.0;

      goto LABEL_9;
    }
    -[HUQuickControlPresentationCoordinator iconFrameInNavigationBar](self, "iconFrameInNavigationBar");
    v22 = v21 + -14.0;
  }
  else
  {
    -[HUQuickControlPresentationCoordinator baseIconFrameInNavigationBar](self, "baseIconFrameInNavigationBar");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    if (!-[HUQuickControlPresentationCoordinator _isRTL](self, "_isRTL"))
    {
      v41.origin.x = v24;
      v41.origin.y = v26;
      v41.size.width = v28;
      v41.size.height = v30;
      v31 = CGRectGetMaxX(v41) + 14.0;
      goto LABEL_9;
    }
    v22 = v24 + -14.0;
  }
  v31 = v22 - v8;
LABEL_9:
  v37 = v20 + 16.0;
  v38 = v31;
  v39 = v8;
  v40 = v14;
  result.size.height = v40;
  result.size.width = v39;
  result.origin.y = v37;
  result.origin.x = v38;
  return result;
}

- (CGRect)titleAndDescriptionViewFrameInActionSetTile
{
  void *v2;
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
  CGRect result;

  -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleAndDescriptionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)_preparePressedItemContextForItem:(id)a3 startApplier:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  -[HUQuickControlPresentationCoordinator pressedItemContexts](self, "pressedItemContexts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HUQuickControlPresentationCoordinator _configureInitialStateForPressedItemContext:userInitiated:](self, "_configureInitialStateForPressedItemContext:userInitiated:", v7, 1);
  }
  else
  {
    -[HUQuickControlPresentationCoordinator _createPressedContextForItem:userInitiated:](self, "_createPressedContextForItem:userInitiated:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator pressedItemContexts](self, "pressedItemContexts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v7, v10);

    if (v4)
    {
      objc_msgSend(v7, "applier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "start");

    }
  }

}

- (void)_configureInitialStateForPressedItemContext:(id)a3 userInitiated:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  objc_msgSend(v8, "setBeginTime:", CACurrentMediaTime());
  objc_msgSend(v8, "setRawInputProgress:", 0.433333333);
  objc_msgSend(v8, "applier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCompletesWhenAtRest:", 0);

  objc_msgSend(v8, "setActive:", 1);
  objc_msgSend(v8, "setIsUserInitiated:", v4);
  objc_msgSend(v8, "programmaticBounceTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v8, "programmaticBounceTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");

    objc_msgSend(v8, "setProgrammaticBounceTimer:", 0);
  }

}

- (void)_initiateProgrammaticBounceForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HUQuickControlPresentationCoordinator pressedItemContexts](self, "pressedItemContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C99E88];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__HUQuickControlPresentationCoordinator__initiateProgrammaticBounceForItem___block_invoke;
  v10[3] = &unk_1E6F60518;
  v11 = v6;
  v8 = v6;
  objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 0, v10, 0.17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProgrammaticBounceTimer:", v9);

}

void __76__HUQuickControlPresentationCoordinator__initiateProgrammaticBounceForItem___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setActive:", 0);
  objc_msgSend(*(id *)(a1 + 32), "applier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCompletesWhenAtRest:", 1);

}

- (id)_createPressedContextForItem:(id)a3 userInitiated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  HUPressedItemContext *v9;
  HUElasticApplier *v10;
  uint64_t v11;
  HUElasticApplier *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD v26[4];
  id from;
  id location[2];

  v4 = a4;
  v6 = a3;
  -[HUQuickControlPresentationCoordinator pressedItemContexts](self, "pressedItemContexts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    NSLog(CFSTR("Pressed item context already exists for item %@"), v6);
  v9 = objc_alloc_init(HUPressedItemContext);
  -[HUPressedItemContext setItem:](v9, "setItem:", v6);
  -[HUPressedItemContext setIsUserInitiated:](v9, "setIsUserInitiated:", v4);
  objc_initWeak(location, self);
  objc_initWeak(&from, v9);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  v10 = [HUElasticApplier alloc];
  v11 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __84__HUQuickControlPresentationCoordinator__createPressedContextForItem_userInitiated___block_invoke;
  v23[3] = &unk_1E6F60568;
  v23[4] = v26;
  objc_copyWeak(&v24, location);
  objc_copyWeak(&v25, &from);
  v12 = -[HUElasticApplier initWithProgressInputBlock:](v10, "initWithProgressInputBlock:", v23);
  -[HUElasticApplier setTension:](v12, "setTension:", 600.0);
  -[HUElasticApplier setFriction:](v12, "setFriction:", 10.0);
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __84__HUQuickControlPresentationCoordinator__createPressedContextForItem_userInitiated___block_invoke_3;
  v19[3] = &unk_1E6F60590;
  objc_copyWeak(&v21, location);
  objc_copyWeak(&v22, &from);
  v13 = v6;
  v20 = v13;
  -[HUApplier addApplierBlock:](v12, "addApplierBlock:", v19);
  -[HUElasticApplier setCompletesWhenAtRest:](v12, "setCompletesWhenAtRest:", 0);
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __84__HUQuickControlPresentationCoordinator__createPressedContextForItem_userInitiated___block_invoke_4;
  v16[3] = &unk_1E6F5B3A8;
  objc_copyWeak(&v18, location);
  v14 = v13;
  v17 = v14;
  -[HUApplier addCompletionBlock:](v12, "addCompletionBlock:", v16);
  -[HUPressedItemContext setApplier:](v9, "setApplier:", v12);
  -[HUQuickControlPresentationCoordinator _configureInitialStateForPressedItemContext:userInitiated:](self, "_configureInitialStateForPressedItemContext:userInitiated:", v9, v4);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v24);
  _Block_object_dispose(v26, 8);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);

  return v9;
}

double __84__HUQuickControlPresentationCoordinator__createPressedContextForItem_userInitiated___block_invoke(uint64_t a1, double a2)
{
  void (**v4)(_QWORD);
  id WeakRetained;
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
  _QWORD v17[6];

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __84__HUQuickControlPresentationCoordinator__createPressedContextForItem_userInitiated___block_invoke_2;
  v17[3] = &unk_1E6F60540;
  v17[4] = *(_QWORD *)(a1 + 32);
  *(double *)&v17[5] = a2;
  v4 = (void (**)(_QWORD))_Block_copy(v17);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = v6;
  if (WeakRetained && (objc_msgSend(v6, "isActive") & 1) != 0)
  {
    objc_msgSend(WeakRetained, "pressGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentForceMultiplier");
    v10 = v9;

    v11 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    objc_msgSend(v7, "rawInputProgress");
    objc_msgSend(v7, "setRawInputProgress:", v12 + (a2 - v11) / 0.2 * v10);
  }
  else
  {
    objc_msgSend(v7, "setRawInputProgress:", 0.0);
  }
  objc_msgSend(v7, "rawInputProgress");
  v14 = v13;

  if (v4)
    v4[2](v4);
  v15 = HURubberBandedValue(v14, 0.0, 0.333333333, 0.0, 1.5);

  return v15;
}

double __84__HUQuickControlPresentationCoordinator__createPressedContextForItem_userInitiated___block_invoke_2(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __84__HUQuickControlPresentationCoordinator__createPressedContextForItem_userInitiated___block_invoke_3(uint64_t a1, double a2)
{
  id v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_updateOverrideAttributesWithScale:forItem:", *(_QWORD *)(a1 + 32), (1.0 - a2) * 0.2 + 0.8);
  v5 = CACurrentMediaTime();
  objc_msgSend(v4, "beginTime");
  v7 = v6;
  objc_msgSend(WeakRetained, "pressGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "overallForceMultiplier");
  v10 = v9;

  if (objc_msgSend(v4, "isUserInitiated")
    && objc_msgSend(v4, "isActive")
    && (v5 - v7) * v10 >= 0.5)
  {
    v11 = (id)objc_msgSend(WeakRetained, "_beginControlPresentationAnimated:", 1);
  }

}

void __84__HUQuickControlPresentationCoordinator__createPressedContextForItem_userInitiated___block_invoke_4(uint64_t a1, int a2)
{
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_pressedStateDidEndForItem:clearPresentationContext:", *(_QWORD *)(a1 + 32), 1);

  }
}

- (void)_updateOverrideAttributesWithScale:(double)a3 forItem:(id)a4
{
  id v6;
  CGAffineTransform v7;

  v6 = a4;
  CGAffineTransformMakeScale(&v7, a3, a3);
  -[HUQuickControlPresentationCoordinator _updateOverrideAttributesWithTransform:alpha:forItem:](self, "_updateOverrideAttributesWithTransform:alpha:forItem:", &v7, v6, 1.0);

}

- (void)_updateOverrideAttributesWithTransform:(CGAffineTransform *)a3 alpha:(double)a4 forItem:(id)a5
{
  id v8;
  HUControllableCollectionViewLayoutOverrideAttributes *v9;
  __int128 v10;
  void *v11;
  void *v12;
  void *v13;
  _OWORD v14[3];

  v8 = a5;
  v9 = objc_alloc_init(HUControllableCollectionViewLayoutOverrideAttributes);
  v10 = *(_OWORD *)&a3->c;
  v14[0] = *(_OWORD *)&a3->a;
  v14[1] = v10;
  v14[2] = *(_OWORD *)&a3->tx;
  -[HUControllableCollectionViewLayoutOverrideAttributes setTransform:](v9, "setTransform:", v14);
  -[HUControllableCollectionViewLayoutOverrideAttributes setAlpha:](v9, "setAlpha:", a4);
  -[HUControllableCollectionViewLayoutOverrideAttributes setZIndex:](v9, "setZIndex:", 1000);
  -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentationCoordinator:applyOverrideAttributes:toItem:", self, v9, v8);

  -[HUQuickControlPresentationCoordinator pressedItemContexts](self, "pressedItemContexts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v13, "setCurrentViewScale:", a3->a);

}

- (void)_pressedStateDidEndForItem:(id)a3 clearPresentationContext:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = a4;
  v14 = a3;
  -[HUQuickControlPresentationCoordinator pressedItemContexts](self, "pressedItemContexts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CEABB0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __93__HUQuickControlPresentationCoordinator__pressedStateDidEndForItem_clearPresentationContext___block_invoke;
    v15[3] = &unk_1E6F4C638;
    v15[4] = self;
    v9 = v14;
    v16 = v9;
    objc_msgSend(v8, "performWithoutAnimation:", v15);
    -[HUQuickControlPresentationCoordinator pressedItemContexts](self, "pressedItemContexts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v9);

    if (v4)
    {
      -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "item");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqual:", v9);

      if (v13)
        -[HUQuickControlPresentationCoordinator setPresentationContext:](self, "setPresentationContext:", 0);
    }

  }
  else
  {
    NSLog(CFSTR("Missing pressed item context for item %@!"), v14);
  }

}

void __93__HUQuickControlPresentationCoordinator__pressedStateDidEndForItem_clearPresentationContext___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationCoordinator:clearOverrideAttributesForItem:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_actuateTapticFeedback
{
  void *v3;
  id v4;

  -[HUQuickControlPresentationCoordinator feedbackGenerator](self, "feedbackGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "impactOccurred");

  -[HUQuickControlPresentationCoordinator feedbackGenerator](self, "feedbackGenerator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepare");

}

- (id)presentQuickControlWithContext:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  -[HUQuickControlPresentationCoordinator setPresentationContext:](self, "setPresentationContext:", v6);
  objc_msgSend(v6, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "item");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator _preparePressedItemContextForItem:startApplier:](self, "_preparePressedItemContextForItem:startApplier:", v8, 0);

  }
  -[HUQuickControlPresentationCoordinator _beginControlPresentationAnimated:](self, "_beginControlPresentationAnimated:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_shouldCancelPresentation
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "presentationCoordinator:shouldBeginPresentationWithContext:", self, v6);

  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v10;
    v15 = 1024;
    v16 = v7;
    v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@+Controls _shouldCancelPresentation: delegate responded to shouldBeginPresentationWithContext with %{BOOL}d delegate %@", (uint8_t *)&v13, 0x1Cu);

  }
  return v7 ^ 1;
}

- (id)_beginControlPresentationAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  objc_class *v10;
  void *v11;
  objc_class *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[HUQuickControlPresentationCoordinator quickControlViewController](self, "quickControlViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    NSLog(CFSTR("Attempting to begin presentation while a previous presentation is already in progress"));
  -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    NSLog(CFSTR("Attempting to begin presentation with no active context!"));
  -[HUQuickControlPresentationCoordinator activePressedItemContext](self, "activePressedItemContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancel");

  LODWORD(v7) = -[HUQuickControlPresentationCoordinator _shouldCancelPresentation](self, "_shouldCancelPresentation");
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v7)
  {
    if (v9)
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v11;
      _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@+Controls canceling presentation", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v9)
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v14;
      _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@+Controls beginning control presentation", buf, 0xCu);

    }
    -[HUQuickControlPresentationCoordinator _viewControllerToPresent](self, "_viewControllerToPresent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    if (v15)
    {
      -[HUQuickControlPresentationCoordinator presentingViewController](self, "presentingViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "hu_presentPreloadableViewController:animated:", v15, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __75__HUQuickControlPresentationCoordinator__beginControlPresentationAnimated___block_invoke;
      v22[3] = &unk_1E6F589D0;
      v22[4] = self;
      v19 = v16;
      v23 = v19;
      v24 = v15;
      v20 = (id)objc_msgSend(v18, "addCompletionBlock:", v22);

      v21 = v19;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }

    return v21;
  }
}

uint64_t __75__HUQuickControlPresentationCoordinator__beginControlPresentationAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "presentationContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentationCoordinator:didBeginPresentationWithContext:", v5, v6);

  }
  return objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", *(_QWORD *)(a1 + 48));
}

- (id)_viewControllerToPresent
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[HUQuickControlPresentationCoordinator _buildSoftwareUpdateNavigationController](self, "_buildSoftwareUpdateNavigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "item");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v9 = objc_opt_isKindOfClass();

    if ((v9 & 1) != 0)
      -[HUQuickControlPresentationCoordinator _buildStatusDetailsNavigationController](self, "_buildStatusDetailsNavigationController");
    else
      -[HUQuickControlPresentationCoordinator _buildCardNavigationController](self, "_buildCardNavigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)_buildQuickControlViewController
{
  HUQuickControlContainerViewController *v3;
  void *v4;
  HUQuickControlContainerViewController *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;

  v3 = [HUQuickControlContainerViewController alloc];
  -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HUQuickControlContainerViewController initWithPresentationContext:](v3, "initWithPresentationContext:", v4);

  -[HUQuickControlContainerViewController setDelegate:](v5, "setDelegate:", self);
  -[HUQuickControlContainerViewController setPresentationDelegate:](v5, "setPresentationDelegate:", self);
  -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "detailViewURLHandlerForPresentationCoordinator:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlContainerViewController setDetailViewURLHandler:](v5, "setDetailViewURLHandler:", v9);

  }
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
  {
    -[HUQuickControlContainerViewController presentControlForMacAnimated:](v5, "presentControlForMacAnimated:", 1);
  }
  else
  {
    -[HUQuickControlContainerViewController view](v5, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sourceRect");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    -[HUQuickControlPresentationCoordinator targetView](self, "targetView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "convertRect:fromView:", v20, v13, v15, v17, v19);
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;

    -[HUQuickControlContainerViewController presentControlFromSourceRect:animated:](v5, "presentControlFromSourceRect:animated:", 1, v22, v24, v26, v28);
  }
  return v5;
}

- (void)_updateCardController
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HUBaseIconViewConfiguration *v28;
  HUBaseIconView *v29;
  void *v30;
  void *v31;
  void *v32;
  HUBaseIconViewConfiguration *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  int v44;
  NSObject *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint8_t v50[16];

  -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "item");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sourceItem");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "item");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sourceItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 == v12)
        return;
      goto LABEL_7;
    }

  }
LABEL_7:
  -[HUQuickControlPresentationCoordinator _buildQuickControlViewController](self, "_buildQuickControlViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator setQuickControlViewController:](self, "setQuickControlViewController:", v13);

  -[HUQuickControlPresentationCoordinator quickControlViewController](self, "quickControlViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "item");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HUQuickControlPresentationCoordinator hasDetailsActionForQuickControlViewController:item:](self, "hasDetailsActionForQuickControlViewController:item:", v14, v16);

  if (v17
    || (-[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v18, "item"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v19, "conformsToProtocol:", &unk_1EF2AC470),
        v19,
        v18,
        (v20 & 1) == 0))
  {
    -[HUQuickControlPresentationCoordinator _prepareSettingsViewController](self, "_prepareSettingsViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator setSettingsViewController:](self, "setSettingsViewController:", v21);

  }
  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator quickControlViewController](self, "quickControlViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator settingsViewController](self, "settingsViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "updateWithQuickControlViewController:settingsViewController:presentationContext:", v23, v24, v25);

  if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseLegacyQuickControlPresentation") & 1) == 0)
  {
    -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "baseIconViewConfiguration");
      v28 = (HUBaseIconViewConfiguration *)objc_claimAutoreleasedReturnValue();

      -[HUBaseIconViewConfiguration setAppearance:](v28, "setAppearance:", 3);
      v29 = objc_alloc_init(HUBaseIconView);
      -[HUBaseIconView setConfiguration:](v29, "setConfiguration:", v28);
      -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "navigationBarTitleView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "summaryView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setBaseIconView:", v29);
    }
    else
    {
      v33 = [HUBaseIconViewConfiguration alloc];
      -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "item");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[HUBaseIconViewConfiguration initWithItem:appearance:](v33, "initWithItem:appearance:", v35, 3);

      -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
      v29 = (HUBaseIconView *)objc_claimAutoreleasedReturnValue();
      -[HUBaseIconView navigationBarTitleView](v29, "navigationBarTitleView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "summaryView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "baseIconView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setConfiguration:", v28);
    }

  }
  -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "item");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v38 = 0;
  }
  else
  {
    -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "controlItems");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v40, "count") != 0;

  }
  -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "controlItems");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "na_any:", &__block_literal_global_293);

  v44 = objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isInternalInstall") && HFHideQuickControls())
  {
    HFLogForCategory();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v50 = 0;
      _os_log_impl(&dword_1B8E1E000, v45, OS_LOG_TYPE_DEFAULT, "Hiding all quick controls because pref is set (see Internal Settings)", v50, 2u);
    }

    v46 = 1;
  }
  else
  {
    v46 = 0;
  }
  v47 = v46 | v38 & (v44 ^ 1 | v43) ^ 1u;
  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setHideControls:", v47);

  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setHideSettings:", !v17);

}

BOOL __62__HUQuickControlPresentationCoordinator__updateCardController__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (id)_buildCardNavigationController
{
  void *v4;
  int v5;
  HUCardViewController *v6;
  void *v7;
  void *v8;
  HUCardViewController *v9;
  void *v10;
  void *v11;
  HUCardViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  HUQuickControlNavigationController *v45;
  void *v46;
  HUQuickControlNavigationController *v47;
  void *v48;
  HUQuickControlPresentationCoordinator *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  char isKindOfClass;
  void *v64;
  void *v65;
  void *v66;
  char v67;
  void *v68;
  void *v69;
  char v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  int v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;

  -[HUQuickControlPresentationCoordinator setCardViewController:](self, "setCardViewController:", 0);
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isProxHandOffV2Config"))
  {
    -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isConfiguredForNonHomeUser");

    if (v5)
    {
      v6 = [HUCardViewController alloc];
      -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "controlItems");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[HUCardViewController initWithControlItems:](v6, "initWithControlItems:", v8);
      -[HUQuickControlPresentationCoordinator setCardViewController:](self, "setCardViewController:", v9);

      -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setIsConfiguredForNonHomeUser:", 1);

      -[HUQuickControlPresentationCoordinator _updateCardController](self, "_updateCardController");
    }
  }
  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = objc_alloc_init(HUCardViewController);
    -[HUQuickControlPresentationCoordinator setCardViewController:](self, "setCardViewController:", v12);

  }
  -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "item");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[HUQuickControlPresentationCoordinator _updateCardController](self, "_updateCardController");
  }
  else
  {
    -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "itemManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v16, "reloadAndUpdateAllItemsFromSenderSelector:", a2);

  }
  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDelegate:", self);

  -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_respondsToSelector();

  if ((v20 & 1) != 0)
  {
    -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "presentationCoordinator:willBeginPresentationWithContext:", self, v22);

  }
  -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_opt_respondsToSelector();

  if ((v24 & 1) != 0)
  {
    -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "presentationCoordinatorShouldDisablePullToUnlockSettings:", self);
    -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setDisablePullToUnlockSettings:", v26);

  }
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
  {
    v28 = objc_alloc(MEMORY[0x1E0CEA7B8]);
    -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v28, "initWithRootViewController:", v29);

    objc_msgSend(v30, "setModalPresentationStyle:", 2);
    -[HUQuickControlPresentationCoordinator quickControlViewController](self, "quickControlViewController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "controlContainerView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setNeedsLayout");

    -[HUQuickControlPresentationCoordinator quickControlViewController](self, "quickControlViewController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "controlContainerView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "layoutIfNeeded");

    -[HUQuickControlPresentationCoordinator quickControlViewController](self, "quickControlViewController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "controlContainerView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0CEB980], *(double *)(MEMORY[0x1E0CEB980] + 8));
    v38 = v37;
    v40 = v39;

    objc_msgSend(v30, "navigationBar");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "bounds");
    v43 = v40 + v42;

    if (v43 > 621.0)
    {
      if (v43 <= 671.0)
        v44 = v43;
      else
        v44 = 671.0;
      objc_msgSend(v30, "setPreferredContentSize:", v38, v44);
    }
    if (objc_msgSend(MEMORY[0x1E0D313C8], "isMacShortcuts"))
    {
      objc_msgSend(v30, "preferredContentSize");
      objc_msgSend(v30, "setPreferredContentSize:", 668.0);
    }
    return v30;
  }
  v45 = [HUQuickControlNavigationController alloc];
  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = -[HUQuickControlNavigationController initWithRootViewController:](v45, "initWithRootViewController:", v46);
  -[HUQuickControlPresentationCoordinator setCardNavigationController:](self, "setCardNavigationController:", v47);

  -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v48, "prefersSystemTransitions"))
    v49 = 0;
  else
    v49 = self;
  -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setTransitioningDelegate:", v49);

  -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "presentationController");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setDelegate:", self);

  -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setDelegate:", self);

  -[HUQuickControlPresentationCoordinator settingsViewController](self, "settingsViewController");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v54, "conformsToProtocol:", &unk_1EF347CD0))
    v55 = v54;
  else
    v55 = 0;
  v56 = v55;

  if (v56)
  {
    -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "item");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "recreateDetailsViewFor:navigationController:dismiss:", v58, v59, 0);

  }
  -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v60, "prefersSystemTransitions") & 1) == 0)
  {
    -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "presentationController");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      goto LABEL_48;
    -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "presentationController");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseLegacyQuickControlPresentation") & 1) != 0)
      -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
    else
      -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator presentingViewController](self, "presentingViewController");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v67 = objc_opt_isKindOfClass();

    if ((v67 & 1) != 0)
    {
      -[HUQuickControlPresentationCoordinator presentingViewController](self, "presentingViewController");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "presentationController");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v70 = objc_opt_isKindOfClass();

      if ((v70 & 1) != 0)
      {
        objc_msgSend(v68, "presentationController");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "_sourceView");
        v72 = (void *)objc_claimAutoreleasedReturnValue();

        if (v72)
        {
          objc_msgSend(v71, "_sourceView");
          v73 = objc_claimAutoreleasedReturnValue();

          v65 = (void *)v73;
        }

      }
    }
    objc_msgSend(v60, "_setSourceView:", v65);
    if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseLegacyQuickControlPresentation") & 1) != 0)
    {
      -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "layoutOptions");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "cellCornerRadius");
      objc_msgSend(v60, "_setCornerRadiusForPresentationAndDismissal:");

    }
    else
    {
      -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "backgroundCornerRadius");
      objc_msgSend(v60, "_setCornerRadiusForPresentationAndDismissal:");
    }

    -[HUQuickControlPresentationCoordinator cornerRadius](self, "cornerRadius");
    objc_msgSend(v60, "_setPreferredCornerRadius:");
    objc_msgSend(v60, "_setShouldDismissWhenTappedOutside:", 1);
    if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials")
      && objc_msgSend(MEMORY[0x1E0D319D0], "isAnIPad"))
    {
      objc_msgSend(v60, "_setIndexOfLastUndimmedDetent:", 0);
    }

  }
LABEL_48:
  -[HUQuickControlPresentationCoordinator presentingViewController](self, "presentingViewController");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "view");
  v77 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v77, "window");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "_rootSheetPresentationController");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "_setShouldScaleDownBehindDescendantSheets:", 0);

  -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v77) = objc_opt_respondsToSelector();

  if ((v77 & 1) != 0)
  {
    -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v81, "shouldOverrideTraitCollectionForPresentationCoordinator:", self);

    if (v82)
    {
      -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "traitCollectionForPresentationCoordinator:", self);
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      v85 = objc_msgSend(v84, "userInterfaceStyle");
      -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "setOverrideUserInterfaceStyle:", v85);

    }
  }
  -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (id)_buildStatusDetailsNavigationController
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  HUStatusDetailsViewController *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_opt_class();
  -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v7 = -[HUStatusDetailsViewController initWithStatusItem:delegate:]([HUStatusDetailsViewController alloc], "initWithStatusItem:delegate:", v6, self);
  -[HUQuickControlPresentationCoordinator setStatusDetailsViewController:](self, "setStatusDetailsViewController:", v7);

  v8 = objc_alloc(MEMORY[0x1E0CEA7B8]);
  -[HUQuickControlPresentationCoordinator statusDetailsViewController](self, "statusDetailsViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithRootViewController:", v9);
  -[HUQuickControlPresentationCoordinator setStatusDetailsNavigationController:](self, "setStatusDetailsNavigationController:", v10);

  -[HUQuickControlPresentationCoordinator statusDetailsNavigationController](self, "statusDetailsNavigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setModalPresentationStyle:", 2);

  -[HUQuickControlPresentationCoordinator presentingViewController](self, "presentingViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_rootSheetPresentationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_setShouldScaleDownBehindDescendantSheets:", 0);

  return -[HUQuickControlPresentationCoordinator statusDetailsNavigationController](self, "statusDetailsNavigationController");
}

- (id)_buildSoftwareUpdateNavigationController
{
  HUSoftwareUpdateStandaloneViewController *v3;
  void *v4;
  void *v5;
  HUSoftwareUpdateStandaloneViewController *v6;
  void *v7;

  v3 = [HUSoftwareUpdateStandaloneViewController alloc];
  -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HUSoftwareUpdateStandaloneViewController initWithHome:](v3, "initWithHome:", v5);

  -[HUSoftwareUpdateStandaloneViewController setShowDoneButtonInNavBar:](v6, "setShowDoneButtonInNavBar:", 1);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v6);
  objc_msgSend(v7, "setModalPresentationStyle:", 2);

  return v7;
}

- (void)_validatePresentationContext:(id)a3
{
  char v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  CGRect v13;

  v12 = a3;
  if (!v12)
    NSLog(CFSTR("presentationContext is nil"));
  v3 = objc_msgSend(MEMORY[0x1E0D319D0], "isProxHandOffV2Config");
  v4 = v12;
  if ((v3 & 1) == 0)
  {
    v5 = objc_msgSend(v12, "isConfiguredForNonHomeUser");
    v4 = v12;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(v12, "item");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {

      }
      else
      {
        objc_msgSend(v12, "itemManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "homeKitObjectUUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
          NSLog(CFSTR("Context %@ must include a valid HFItem or NSUUID"), v12);
      }
      objc_msgSend(v12, "home");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v12;
      if (!v9)
      {
        NSLog(CFSTR("Context %@ must include a valid home"), v12);
        v4 = v12;
      }
    }
  }
  objc_msgSend(v4, "item");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_msgSend(v12, "sourceRect"), CGRectIsEmpty(v13)))
  {
    v11 = objc_msgSend(v12, "prefersSystemTransitions");

    if ((v11 & 1) == 0)
      NSLog(CFSTR("Context %@ must include a valid source rect"), v12);
  }
  else
  {

  }
}

- (id)dismissQuickControlAnimated:(BOOL)a3 wasDismissed:(BOOL *)a4
{
  _BOOL8 v4;

  v4 = a3;
  if (a4)
    *a4 = -[HUQuickControlPresentationCoordinator isQuickControlPresented](self, "isQuickControlPresented");
  return -[HUQuickControlPresentationCoordinator dismissQuickControlAnimated:](self, "dismissQuickControlAnimated:", v4);
}

- (id)dismissQuickControlAnimated:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  -[HUQuickControlPresentationCoordinator quickControlViewController](self, "quickControlViewController");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[HUQuickControlPresentationCoordinator quickControlViewController](self, "quickControlViewController"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isControlDismissedOrDismissing"),
        v7,
        v6,
        (v8 & 1) == 0))
  {
    -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "presentationCoordinator:willEndPresentationWithContext:", self, v13);

    }
    -[HUQuickControlPresentationCoordinator quickControlViewController](self, "quickControlViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dismissControlAnimated:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HUQuickControlPresentationCoordinator _dismissQuickControlViewControllerAnimated:](self, "_dismissQuickControlViewControllerAnimated:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)_dismissQuickControlViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[5];
  id v20;

  v3 = a3;
  -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentationCoordinator:willEndPresentationWithContext:", self, v5);

  }
  -[HUQuickControlPresentationCoordinator quickControlViewController](self, "quickControlViewController");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9
    && (v10 = (void *)v9,
        -[HUQuickControlPresentationCoordinator quickControlViewController](self, "quickControlViewController"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isBeingDismissed"),
        v11,
        v10,
        !v12))
  {
    v14 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HUQuickControlPresentationCoordinator quickControlViewController](self, "quickControlViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __84__HUQuickControlPresentationCoordinator__dismissQuickControlViewControllerAnimated___block_invoke;
    v19[3] = &unk_1E6F4C638;
    v19[4] = self;
    v16 = v14;
    v20 = v16;
    objc_msgSend(v15, "dismissViewControllerAnimated:completion:", v3, v19);

    v17 = v20;
    v13 = v16;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

void __84__HUQuickControlPresentationCoordinator__dismissQuickControlViewControllerAnimated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  void (**v10)(_QWORD);
  _QWORD aBlock[5];
  id v12;

  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__HUQuickControlPresentationCoordinator__dismissQuickControlViewControllerAnimated___block_invoke_2;
  aBlock[3] = &unk_1E6F4C638;
  v3 = *(void **)(a1 + 40);
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "quickControlViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "quickControlViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v2;
    v9[1] = 3221225472;
    v9[2] = __84__HUQuickControlPresentationCoordinator__dismissQuickControlViewControllerAnimated___block_invoke_3;
    v9[3] = &unk_1E6F4D9B0;
    v10 = v4;
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, v9);

  }
  else
  {
    v4[2](v4);
  }

}

uint64_t __84__HUQuickControlPresentationCoordinator__dismissQuickControlViewControllerAnimated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "cardNavigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitioningDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);

  if (v3 == v4)
    objc_msgSend(*(id *)(a1 + 32), "_restoreOriginalTile");
  return objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
}

uint64_t __84__HUQuickControlPresentationCoordinator__dismissQuickControlViewControllerAnimated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_restoreOriginalTile
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  CGAffineTransform v18;
  CGAffineTransform v19;

  if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseLegacyQuickControlPresentation") & 1) != 0)
  {
    -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        CGAffineTransformMakeScale(&v18, 1.0, 1.0);
        -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "item");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUQuickControlPresentationCoordinator _updateOverrideAttributesWithTransform:alpha:forItem:](self, "_updateOverrideAttributesWithTransform:alpha:forItem:", &v18, v7, 1.0);

        -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
        v15 = v8;
        objc_msgSend(v8, "item");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUQuickControlPresentationCoordinator _pressedStateDidEndForItem:clearPresentationContext:](self, "_pressedStateDidEndForItem:clearPresentationContext:", v16, 1);

      }
    }
  }
  else
  {
    -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v17 = (id)v9;
      -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
      {

        return;
      }
      v11 = (void *)v10;
      v12 = -[HUQuickControlPresentationCoordinator isActionSetTile](self, "isActionSetTile");

      if (!v12)
      {
        CGAffineTransformMakeScale(&v19, 1.0, 1.0);
        -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "item");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUQuickControlPresentationCoordinator _updateOverrideAttributesWithTransform:alpha:forItem:](self, "_updateOverrideAttributesWithTransform:alpha:forItem:", &v19, v14, 1.0);

        -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
    }
  }
}

- (void)_cleanupForQuickControlDismissal
{
  -[HUQuickControlPresentationCoordinator setQuickControlViewController:](self, "setQuickControlViewController:", 0);
  -[HUQuickControlPresentationCoordinator setSettingsViewController:](self, "setSettingsViewController:", 0);
  -[HUQuickControlPresentationCoordinator setPresentationContext:](self, "setPresentationContext:", 0);
  -[HUQuickControlPresentationCoordinator setPressedTile_legacy:](self, "setPressedTile_legacy:", 0);
}

- (BOOL)isQuickControlPresented
{
  void *v3;
  void *v4;
  int v5;

  -[HUQuickControlPresentationCoordinator quickControlViewController](self, "quickControlViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HUQuickControlPresentationCoordinator quickControlViewController](self, "quickControlViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isBeingDismissed") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)_prepareSettingsViewController
{
  void (**v3)(void *, id);
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  HUSceneActionEditorViewController *v11;
  HUSceneActionEditorViewController *v12;
  HUSceneActionEditorViewController *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  HUSceneActionEditorViewController *v20;
  HUSceneActionEditorViewController *v21;
  HUSceneActionEditorViewController *v22;
  void *v23;
  void *v24;
  void *v25;
  int isKindOfClass;
  void *v27;
  void *v28;
  void *v29;
  HUSceneActionEditorViewController *v30;
  HUSceneActionEditorViewController *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  HUSceneActionEditorViewController *v52;
  void *v53;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__HUQuickControlPresentationCoordinator__prepareSettingsViewController__block_invoke;
  aBlock[3] = &unk_1E6F605D8;
  aBlock[4] = self;
  v3 = (void (**)(void *, id))_Block_copy(aBlock);
  -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_1EF2AC470);

  if (v6)
  {
    -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "item");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EF2AC470))
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    objc_opt_class();
    v11 = (HUSceneActionEditorViewController *)v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    if (v13)
    {
      -[HUSceneActionEditorViewController accessory](v13, "accessory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "hf_isSingleServiceLikeAccessory");

      if (v15)
      {
        -[HUSceneActionEditorViewController accessory](v13, "accessory");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "hf_primaryService");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUSceneActionEditorViewController serviceItemForService:](v13, "serviceItemForService:", v17);
        v18 = objc_claimAutoreleasedReturnValue();

        v11 = (HUSceneActionEditorViewController *)v18;
      }
    }
    v3[2](v3, v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v20 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
    v22 = v21;

    if (v22)
    {
      -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUSceneActionEditorViewController setShouldIncludeRoomNameInHeaderTitle:](v22, "setShouldIncludeRoomNameInHeaderTitle:", objc_msgSend(v23, "shouldIncludeRoomNameInHeaderTitle"));

    }
  }
  else
  {
    -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "item");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "item");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v3[2](v3, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      v11 = v29;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v30 = v11;
      else
        v30 = 0;
      v31 = v30;

      v20 = v11;
      if (!v31)
      {
        objc_opt_class();
        -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "item");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v34 = v33;
        else
          v34 = 0;
        v35 = v34;

        v36 = objc_alloc(MEMORY[0x1E0D31140]);
        objc_msgSend(v35, "actionSet");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "home");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)objc_msgSend(v36, "initWithExistingObject:inHome:", v37, v39);

        v20 = -[HUSceneActionEditorViewController initWithActionSetBuilder:mode:]([HUSceneActionEditorViewController alloc], "initWithActionSetBuilder:mode:", v40, 0);
      }
      -[HUSceneActionEditorViewController setShowCancelButton:](v20, "setShowCancelButton:", 0);
    }
    else
    {
      -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "item");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v43 = objc_opt_isKindOfClass();

      if ((v43 & 1) == 0)
      {
        v20 = 0;
        goto LABEL_40;
      }
      objc_opt_class();
      -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "item");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v46 = v45;
      else
        v46 = 0;
      v47 = v46;

      objc_msgSend(v47, "sourceItem");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v48, "conformsToProtocol:", &unk_1EF2AC470))
        v49 = v48;
      else
        v49 = 0;
      v50 = v49;

      v3[2](v3, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      v20 = v51;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v52 = v20;
      else
        v52 = 0;
      v11 = v52;

      if (v11)
      {
        -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUSceneActionEditorViewController setShouldIncludeRoomNameInHeaderTitle:](v11, "setShouldIncludeRoomNameInHeaderTitle:", objc_msgSend(v53, "shouldIncludeRoomNameInHeaderTitle"));

        v11 = v20;
      }
    }
  }

LABEL_40:
  -[HUSceneActionEditorViewController setPresentationDelegate:](v20, "setPresentationDelegate:", self);

  return v20;
}

id __71__HUQuickControlPresentationCoordinator__prepareSettingsViewController__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "presentationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailsViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v6, "presentationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "detailsViewController");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "delegate");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10
      || (v11 = (void *)v10,
          objc_msgSend(*(id *)(a1 + 32), "delegate"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_opt_respondsToSelector(),
          v12,
          v11,
          (v13 & 1) == 0))
    {
      v9 = 0;
      goto LABEL_8;
    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "detailsViewControllerForPresentationCoordinator:item:", *(_QWORD *)(a1 + 32), v3);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

LABEL_8:
  return v9;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v6;
  char isKindOfClass;
  void *v8;
  id v9;

  v6 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationBarTitleView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", (isKindOfClass & 1) == 0);

}

- (void)presentationControllerWillDismiss:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  -[HUQuickControlPresentationCoordinator presentingViewController](self, "presentingViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transitionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HUQuickControlPresentationCoordinator presentingViewController](self, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transitionCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[4] = self;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __75__HUQuickControlPresentationCoordinator_presentationControllerWillDismiss___block_invoke;
    v9[3] = &unk_1E6F4CB78;
    v9[4] = self;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __75__HUQuickControlPresentationCoordinator_presentationControllerWillDismiss___block_invoke_2;
    v8[3] = &unk_1E6F4CB78;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, v8);

  }
}

void __75__HUQuickControlPresentationCoordinator_presentationControllerWillDismiss___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithBlurRadius:", 0.0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transitionBlurView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEffect:", v3);

}

void __75__HUQuickControlPresentationCoordinator_presentationControllerWillDismiss___block_invoke_2(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  id v8;
  id v9;

  v3 = objc_msgSend(a2, "isCancelled");
  v4 = *(void **)(a1 + 32);
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "presentationCoordinatorDidCancelDismissalTransition:", *(_QWORD *)(a1 + 32));

    }
  }
  else
  {
    v7 = (id)objc_msgSend(v4, "_dismissChildViewController");
    v8 = (id)objc_msgSend(*(id *)(a1 + 32), "dismissQuickControlAnimated:", 0);
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;

  v5 = a4;
  -[HUQuickControlPresentationCoordinator targetView](self, "targetView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  objc_msgSend(v5, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v12, "presentationCoordinator:shouldBeginInteractivePresentationWithTouchLocation:view:", self, v11, v8, v10);

  return (char)self;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  BOOL v12;
  objc_class *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[HUQuickControlPresentationCoordinator singleTapGestureRecognizer](self, "singleTapGestureRecognizer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 != v7)
  {

LABEL_4:
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412546;
      v21 = v15;
      v22 = 2112;
      v23 = v16;
      _os_log_debug_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEBUG, "%@+Controls: %@ returning NO", (uint8_t *)&v20, 0x16u);

    }
    v12 = 0;
    goto LABEL_7;
  }
  -[HUQuickControlPresentationCoordinator doubleTapGestureRecognizer](self, "doubleTapGestureRecognizer");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 != v8)
    goto LABEL_4;
  HFLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412546;
    v21 = v18;
    v22 = 2112;
    v23 = v19;
    _os_log_debug_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEBUG, "%@+Controls: %@ returning YES", (uint8_t *)&v20, 0x16u);

  }
  v12 = 1;
LABEL_7:

  return v12;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  BOOL v15;
  void *v16;
  int v17;
  objc_class *v18;
  void *v19;
  void *v20;
  const char *v21;
  objc_class *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[HUQuickControlPresentationCoordinator touchGestureRecognizer](self, "touchGestureRecognizer");
  v9 = objc_claimAutoreleasedReturnValue();
  if ((id)v9 == v7)
  {

LABEL_6:
    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138413058;
      v28 = v19;
      v29 = 2112;
      v30 = v20;
      v31 = 2112;
      v32 = v7;
      v33 = 2112;
      v34 = v8;
      v21 = "%@+Controls: %@ returning YES (first case) %@ %@";
      goto LABEL_16;
    }
LABEL_7:
    v15 = 1;
    goto LABEL_14;
  }
  v10 = (void *)v9;
  -[HUQuickControlPresentationCoordinator touchGestureRecognizer](self, "touchGestureRecognizer");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v8)
    goto LABEL_6;
  -[HUQuickControlPresentationCoordinator presentationInteraction](self, "presentationInteraction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "gestureRecognizerForExclusionRelationship");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13 == v7)
  {
    -[HUQuickControlPresentationCoordinator mutuallyExclusiveGestureRecognizers](self, "mutuallyExclusiveGestureRecognizers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsObject:", v8);

    if (!v17)
      goto LABEL_11;
    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138413058;
      v28 = v19;
      v29 = 2112;
      v30 = v20;
      v31 = 2112;
      v32 = v7;
      v33 = 2112;
      v34 = v8;
      v21 = "%@+Controls: %@ returning YES (second case) %@, %@";
LABEL_16:
      _os_log_debug_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEBUG, v21, (uint8_t *)&v27, 0x2Au);

      goto LABEL_7;
    }
    goto LABEL_7;
  }

LABEL_11:
  HFLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138412546;
    v28 = v25;
    v29 = 2112;
    v30 = v26;
    _os_log_debug_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEBUG, "%@+Controls: %@ returning NO", (uint8_t *)&v27, 0x16u);

  }
  v15 = 0;
LABEL_14:

  return v15;
}

- (double)quickControlViewController:(id)a3 sourceViewInitialScaleForPresentation:(BOOL)a4
{
  void *v4;
  double v5;
  double v6;

  if (!a4)
    return 1.0;
  -[HUQuickControlPresentationCoordinator activePressedItemContext](self, "activePressedItemContext", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentViewScale");
  v6 = v5;

  return v6;
}

- (id)quickControlViewController:(id)a3 applierForSourceViewTransitionWithAnimationSettings:(id)a4 presenting:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  BOOL v15;

  v7 = a4;
  -[HUQuickControlPresentationCoordinator activePressedItemContext](self, "activePressedItemContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[HUAnimationApplier dynamicApplierWithAnimationSettings:](HUAnimationApplier, "dynamicApplierWithAnimationSettings:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __131__HUQuickControlPresentationCoordinator_quickControlViewController_applierForSourceViewTransitionWithAnimationSettings_presenting___block_invoke;
  v13[3] = &unk_1E6F60600;
  v15 = a5;
  v13[4] = self;
  v14 = v9;
  v11 = v9;
  objc_msgSend(v10, "addApplierBlock:", v13);

  return v10;
}

uint64_t __131__HUQuickControlPresentationCoordinator_quickControlViewController_applierForSourceViewTransitionWithAnimationSettings_presenting___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;
  CGAffineTransform v3;

  if (*(_BYTE *)(result + 48))
  {
    v1 = result;
    v2 = *(void **)(result + 32);
    CGAffineTransformMakeScale(&v3, 1.0, 1.0);
    return objc_msgSend(v2, "_updateOverrideAttributesWithTransform:alpha:forItem:", &v3, *(_QWORD *)(v1 + 40), 0.0);
  }
  return result;
}

- (BOOL)hasDetailsActionForQuickControlViewController:(id)a3 item:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v6, "hasDetailsActionForPresentationCoordinator:item:", self, v5);

  return (char)self;
}

- (id)detailsViewControllerForQuickControlViewController:(id)a3 item:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "detailsViewControllerForPresentationCoordinator:item:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)quickControlViewControllerWillDismissDetailsViewController:(id)a3 shouldDismissQuickControl:(BOOL)a4
{
  void *v5;
  id v6;

  if (a4)
  {
    -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "item");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator _pressedStateDidEndForItem:clearPresentationContext:](self, "_pressedStateDidEndForItem:clearPresentationContext:", v5, 0);

  }
}

- (void)quickControlViewControllerDidTapDetailsButton:(id)a3
{
  id v3;

  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollToDetailsViewAnimated:", 1);

}

- (void)statusDetailsViewControllerDidFinish:(id)a3
{
  id v3;

  -[HUQuickControlPresentationCoordinator statusDetailsNavigationController](self, "statusDetailsNavigationController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  _QWORD v22[5];

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
  {
    -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      isKindOfClass = 0;
    }
    else
    {
      objc_msgSend(v6, "parentViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

    }
  }
  else
  {
    isKindOfClass = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_14;
  -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "topViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

      goto LABEL_11;
    }
    -[HUQuickControlPresentationCoordinator cardNavigationController](self, "cardNavigationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_12;
LABEL_14:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & isKindOfClass & 1) != 0)
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __69__HUQuickControlPresentationCoordinator_finishPresentation_animated___block_invoke;
      v22[3] = &unk_1E6F4D988;
      v22[4] = self;
      objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v22);
    }
    else
    {
      v16 = v6;
      if (objc_msgSend(v16, "conformsToProtocol:", &unk_1EF2578B8))
        v17 = v16;
      else
        v17 = 0;
      v18 = v17;

      v19 = objc_msgSend(v18, "requiresPresentingViewControllerDismissal");
      if (v19)
      {
        -[HUQuickControlPresentationCoordinator _dismissCardViewController](self, "_dismissCardViewController");
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
    }
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
LABEL_11:

LABEL_12:
  -[HUQuickControlPresentationCoordinator _dismissServiceDetailsViewController:animated:](self, "_dismissServiceDetailsViewController:animated:", v6, v4);
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_22:
  v20 = (void *)v14;

  return v20;
}

void __69__HUQuickControlPresentationCoordinator_finishPresentation_animated___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_cleanupForQuickControlDismissal");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "presentationContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentationCoordinator:didEndPresentationWithContext:", v4, v5);

  }
}

- (void)itemManager:(id)a3 didChangeSourceItem:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v12)
  {
    -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setItem:", v6);

    objc_msgSend(v12, "childItemsForItem:ofClass:", v6, objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setControlItems:", v10);

    -[HUQuickControlPresentationCoordinator _updateCardController](self, "_updateCardController");
  }

}

- (id)_dismissChildViewController
{
  void *v3;
  char isKindOfClass;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;

  -[HUQuickControlPresentationCoordinator settingsViewController](self, "settingsViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[HUQuickControlPresentationCoordinator settingsViewController](self, "settingsViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "commitChanges");
    goto LABEL_10;
  }
  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hideSettings") & 1) != 0)
    goto LABEL_10;
  -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_9:

    goto LABEL_10;
  }
  -[HUQuickControlPresentationCoordinator settingsViewController](self, "settingsViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_9;
  }
  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "settingsUnlocked");

  if (!v11)
    goto LABEL_11;
  -[HUQuickControlPresentationCoordinator settingsViewController](self, "settingsViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commitChanges");
LABEL_10:

LABEL_11:
  -[HUQuickControlPresentationCoordinator settingsViewController](self, "settingsViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "conformsToProtocol:", &unk_1EF2578B8))
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  objc_msgSend(v14, "setRequiresPresentingViewControllerDismissal:", 0);
  return -[HUQuickControlPresentationCoordinator _dismissCardViewController](self, "_dismissCardViewController");
}

- (id)_dismissCardViewController
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v3 = -[HUQuickControlPresentationCoordinator dismissQuickControlAnimated:](self, "dismissQuickControlAnimated:", 0);
  -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator _dismissQuickControlViewControllerAnimated:](self, "_dismissQuickControlViewControllerAnimated:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__HUQuickControlPresentationCoordinator__dismissCardViewController__block_invoke;
  v9[3] = &unk_1E6F4DB40;
  objc_copyWeak(&v11, &location);
  v6 = v4;
  v10 = v6;
  v7 = (id)objc_msgSend(v5, "addCompletionBlock:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v5;
}

void __67__HUQuickControlPresentationCoordinator__dismissCardViewController__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_cleanupForQuickControlDismissal");
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentationCoordinator:didEndPresentationWithContext:", WeakRetained, *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(WeakRetained, "setCardViewController:", 0);
  objc_msgSend(WeakRetained, "setCardNavigationController:", 0);

}

- (id)_dismissServiceDetailsViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  HUQuickControlPresentationCoordinator *v22;
  id v23;

  v4 = a4;
  v6 = a3;
  -[HUQuickControlPresentationCoordinator presentationContext](self, "presentationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presentationCoordinator:willEndPresentationWithContext:", self, v7);

  }
  -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[HUQuickControlPresentationCoordinator delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "presentationCoordinatorWillBeginTransition:presenting:", self, 0);

  }
  -[HUQuickControlPresentationCoordinator transitionBlurView](self, "transitionBlurView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeFromSuperview");

  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __87__HUQuickControlPresentationCoordinator__dismissServiceDetailsViewController_animated___block_invoke;
  v21 = &unk_1E6F4C638;
  v22 = self;
  v23 = v7;
  v15 = v7;
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", v4, &v18);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult", v18, v19, v20, v21, v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __87__HUQuickControlPresentationCoordinator__dismissServiceDetailsViewController_animated___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_cleanupForQuickControlDismissal");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentationCoordinator:didEndPresentationWithContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (BOOL)_isRTL
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HUQuickControlPresentationCoordinator cardViewController](self, "cardViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layoutDirection") == 1;

  return v4;
}

- (CGRect)sourceFrameForAnimationController
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  CGFloat x;
  double v22;
  CGFloat y;
  double v24;
  CGFloat width;
  double v26;
  CGFloat height;
  void *v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGRect v37;
  CGRect v38;
  CGRect result;

  -[HUQuickControlPresentationCoordinator presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(MEMORY[0x1E0D313C8], "isHomeControlService");

    if ((v4 & 1) == 0)
    {
      -[HUQuickControlPresentationCoordinator presentingViewController](self, "presentingViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {

  }
  -[HUQuickControlPresentationCoordinator presentingViewController](self, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  objc_msgSend(v5, "splitViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseLegacyQuickControlPresentation") & 1) != 0)
  {
    -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator pressedTile_legacy](self, "pressedTile_legacy");
  }
  else
  {
    -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationCoordinator pressedTile](self, "pressedTile");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  if (v7)
    v18 = v7;
  else
    v18 = v5;
  objc_msgSend(v18, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertRect:toView:", v19, v11, v13, v15, v17);
  x = v20;
  y = v22;
  width = v24;
  height = v26;

  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) == 0)
  {
    objc_msgSend(v5, "presentationController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "frameOfPresentedViewInContainerView");
    v30 = v29;
    v32 = v31;

    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = width;
    v37.size.height = height;
    v38 = CGRectOffset(v37, v30, v32);
    x = v38.origin.x;
    y = v38.origin.y;
    width = v38.size.width;
    height = v38.size.height;
  }

  v33 = x;
  v34 = y;
  v35 = width;
  v36 = height;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (HUCardViewController)cardViewController
{
  return self->_cardViewController;
}

- (void)setCardViewController:(id)a3
{
  objc_storeStrong((id *)&self->_cardViewController, a3);
}

- (HUQuickControlPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (HUQuickControlContainerViewController)quickControlViewController
{
  return self->_quickControlViewController;
}

- (void)setQuickControlViewController:(id)a3
{
  objc_storeStrong((id *)&self->_quickControlViewController, a3);
}

- (HUGridServiceCell)pressedTile_legacy
{
  return self->_pressedTile_legacy;
}

- (void)setPressedTile_legacy:(id)a3
{
  objc_storeStrong((id *)&self->_pressedTile_legacy, a3);
}

- (HUQuickControlPresentationTransitionDelegate)pressedTile
{
  return self->_pressedTile;
}

- (void)setPressedTile:(id)a3
{
  objc_storeStrong((id *)&self->_pressedTile, a3);
}

- (HUQuickControlPresentationCoordinatorDelegate)delegate
{
  return (HUQuickControlPresentationCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isEditing
{
  return self->_isEditing;
}

- (HUQuickControlNavigationController)cardNavigationController
{
  return self->_cardNavigationController;
}

- (void)setCardNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_cardNavigationController, a3);
}

- (UIViewController)settingsViewController
{
  return self->_settingsViewController;
}

- (void)setSettingsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_settingsViewController, a3);
}

- (UINavigationController)statusDetailsNavigationController
{
  return self->_statusDetailsNavigationController;
}

- (void)setStatusDetailsNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_statusDetailsNavigationController, a3);
}

- (UIViewController)statusDetailsViewController
{
  return self->_statusDetailsViewController;
}

- (void)setStatusDetailsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_statusDetailsViewController, a3);
}

- (UITapGestureRecognizer)doubleTapGestureRecognizer
{
  return self->_doubleTapGestureRecognizer;
}

- (void)setDoubleTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, a3);
}

- (HUForceInterpolatedPressGestureRecognizer)pressGestureRecognizer
{
  return self->_pressGestureRecognizer;
}

- (void)setPressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_pressGestureRecognizer, a3);
}

- (NACancelable)pressGestureActiveTimerCancellationToken
{
  return self->_pressGestureActiveTimerCancellationToken;
}

- (void)setPressGestureActiveTimerCancellationToken:(id)a3
{
  objc_storeStrong((id *)&self->_pressGestureActiveTimerCancellationToken, a3);
}

- (NSMapTable)pressedItemContexts
{
  return self->_pressedItemContexts;
}

- (UIView)pressedTileBlurEffectView
{
  return self->_pressedTileBlurEffectView;
}

- (void)setPressedTileBlurEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_pressedTileBlurEffectView, a3);
}

- (UIView)pressedTilePrerenderedView
{
  return self->_pressedTilePrerenderedView;
}

- (void)setPressedTilePrerenderedView:(id)a3
{
  objc_storeStrong((id *)&self->_pressedTilePrerenderedView, a3);
}

- (HUIconView)transitionIconView
{
  return self->_transitionIconView;
}

- (void)setTransitionIconView:(id)a3
{
  objc_storeStrong((id *)&self->_transitionIconView, a3);
}

- (HUIconView)transitionIconViewVibrant
{
  return self->_transitionIconViewVibrant;
}

- (void)setTransitionIconViewVibrant:(id)a3
{
  objc_storeStrong((id *)&self->_transitionIconViewVibrant, a3);
}

- (UILabel)transitionPrimaryLabel
{
  return self->_transitionPrimaryLabel;
}

- (void)setTransitionPrimaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_transitionPrimaryLabel, a3);
}

- (HUGridServiceCellTextView)transitionTextView
{
  return self->_transitionTextView;
}

- (void)setTransitionTextView:(id)a3
{
  objc_storeStrong((id *)&self->_transitionTextView, a3);
}

- (HUGridServiceCellTextView)transitionTextViewVibrant
{
  return self->_transitionTextViewVibrant;
}

- (void)setTransitionTextViewVibrant:(id)a3
{
  objc_storeStrong((id *)&self->_transitionTextViewVibrant, a3);
}

- (UIVisualEffectView)transitionTextViewVibrantEffectView
{
  return self->_transitionTextViewVibrantEffectView;
}

- (void)setTransitionTextViewVibrantEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_transitionTextViewVibrantEffectView, a3);
}

- (HUGridActionSetTitleAndDescriptionView)transitionTitleAndDescriptionView
{
  return self->_transitionTitleAndDescriptionView;
}

- (void)setTransitionTitleAndDescriptionView:(id)a3
{
  objc_storeStrong((id *)&self->_transitionTitleAndDescriptionView, a3);
}

- (UIVisualEffectView)transitionTitleAndDescriptionVibrantEffectView
{
  return self->_transitionTitleAndDescriptionVibrantEffectView;
}

- (void)setTransitionTitleAndDescriptionVibrantEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_transitionTitleAndDescriptionVibrantEffectView, a3);
}

- (UILabel)transitionSecondaryLabel
{
  return self->_transitionSecondaryLabel;
}

- (void)setTransitionSecondaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_transitionSecondaryLabel, a3);
}

- (UIVisualEffectView)transitionSecondaryLabelVibrantEffectView
{
  return self->_transitionSecondaryLabelVibrantEffectView;
}

- (void)setTransitionSecondaryLabelVibrantEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_transitionSecondaryLabelVibrantEffectView, a3);
}

- (UIVisualEffectView)transitionBlurView
{
  return self->_transitionBlurView;
}

- (void)setTransitionBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_transitionBlurView, a3);
}

- (HUBaseIconView)transitionBaseIconView
{
  return self->_transitionBaseIconView;
}

- (void)setTransitionBaseIconView:(id)a3
{
  objc_storeStrong((id *)&self->_transitionBaseIconView, a3);
}

- (UIView)transitionBackgroundView
{
  return self->_transitionBackgroundView;
}

- (void)setTransitionBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_transitionBackgroundView, a3);
}

- (UILabel)transitionPrefixLabel
{
  return self->_transitionPrefixLabel;
}

- (void)setTransitionPrefixLabel:(id)a3
{
  objc_storeStrong((id *)&self->_transitionPrefixLabel, a3);
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_transitionPrefixLabel, 0);
  objc_storeStrong((id *)&self->_transitionBackgroundView, 0);
  objc_storeStrong((id *)&self->_transitionBaseIconView, 0);
  objc_storeStrong((id *)&self->_transitionBlurView, 0);
  objc_storeStrong((id *)&self->_transitionSecondaryLabelVibrantEffectView, 0);
  objc_storeStrong((id *)&self->_transitionSecondaryLabel, 0);
  objc_storeStrong((id *)&self->_transitionTitleAndDescriptionVibrantEffectView, 0);
  objc_storeStrong((id *)&self->_transitionTitleAndDescriptionView, 0);
  objc_storeStrong((id *)&self->_transitionTextViewVibrantEffectView, 0);
  objc_storeStrong((id *)&self->_transitionTextViewVibrant, 0);
  objc_storeStrong((id *)&self->_transitionTextView, 0);
  objc_storeStrong((id *)&self->_transitionPrimaryLabel, 0);
  objc_storeStrong((id *)&self->_transitionIconViewVibrant, 0);
  objc_storeStrong((id *)&self->_transitionIconView, 0);
  objc_storeStrong((id *)&self->_pressedTilePrerenderedView, 0);
  objc_storeStrong((id *)&self->_pressedTileBlurEffectView, 0);
  objc_storeStrong((id *)&self->_presentationInteraction, 0);
  objc_storeStrong((id *)&self->_pressedItemContexts, 0);
  objc_storeStrong((id *)&self->_touchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pressGestureActiveTimerCancellationToken, 0);
  objc_storeStrong((id *)&self->_mutuallyExclusiveGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_pressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_singleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_statusDetailsViewController, 0);
  objc_storeStrong((id *)&self->_statusDetailsNavigationController, 0);
  objc_storeStrong((id *)&self->_settingsViewController, 0);
  objc_storeStrong((id *)&self->_cardNavigationController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_targetView);
  objc_storeStrong((id *)&self->_pressedTile, 0);
  objc_storeStrong((id *)&self->_pressedTile_legacy, 0);
  objc_storeStrong((id *)&self->_quickControlViewController, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_cardViewController, 0);
}

@end
