@implementation CSMagSafeAccessoryViewController

- (CSMagSafeAccessoryViewController)initWithAccessory:(id)a3
{
  id v5;
  CSMagSafeAccessoryViewController *v6;
  CSMagSafeAccessoryViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSMagSafeAccessoryViewController;
  v6 = -[CSMagSafeAccessoryViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accessory, a3);

  return v7;
}

- (void)performDismissalAnimationWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSMagSafeAccessoryViewController accessoryView](self, "accessoryView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performAnimation:completionHandler:", 1, v4);

}

- (CSMagSafeAccessory)accessory
{
  return self->_accessory;
}

- (BOOL)isStatic
{
  return 0;
}

- (BOOL)hasChargingAnimation
{
  return 0;
}

- (BOOL)showingChargingAnimation
{
  return 0;
}

- (BOOL)allowsQuickDismissal
{
  return 1;
}

- (double)chargingAnimationDuration
{
  return 0.0;
}

- (void)aggregateAppearance:(id)a3
{
  id v4;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;

  v4 = a3;
  +[CSComponent statusBar](CSComponent, "statusBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "priority:", 40);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hidden:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v7);

  +[CSComponent dateView](CSComponent, "dateView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "priority:", 40);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hidden:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v10);

  +[CSComponent backgroundContent](CSComponent, "backgroundContent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "priority:", 40);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hidden:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v13);

  +[CSComponent pageContent](CSComponent, "pageContent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "priority:", 40);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hidden:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v16);

  +[CSComponent pageControl](CSComponent, "pageControl");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "priority:", 40);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "hidden:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v19);

  +[CSComponent proudLock](CSComponent, "proudLock");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "priority:", 40);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "hidden:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v22);

  +[CSComponent quickActions](CSComponent, "quickActions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "priority:", 40);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "hidden:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v25);

  +[CSComponent controlCenterGrabber](CSComponent, "controlCenterGrabber");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "priority:", 40);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "hidden:", 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v28);

  +[CSComponent homeAffordance](CSComponent, "homeAffordance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "priority:", 40);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "hidden:", 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v31);

  +[CSComponent complicationContainer](CSComponent, "complicationContainer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "priority:", 40);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "hidden:", 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v34);

  v35.receiver = self;
  v35.super_class = (Class)CSMagSafeAccessoryViewController;
  -[CSCoverSheetViewControllerBase aggregateAppearance:](&v35, sel_aggregateAppearance_, v4);

}

- (void)aggregateBehavior:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSMagSafeAccessoryViewController;
  -[CSCoverSheetViewControllerBase aggregateBehavior:](&v10, sel_aggregateBehavior_, v4);
  objc_msgSend(v4, "addRestrictedCapabilities:", 4344);
  if (!-[CSMagSafeAccessoryViewController allowsQuickDismissal](self, "allowsQuickDismissal"))
    objc_msgSend(v4, "addRestrictedCapabilities:", 4);
  objc_msgSend(v4, "setScrollingStrategy:", 3);
  +[CSLockScreenDomain rootSettings](CSLockScreenDomain, "rootSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chargingSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "warnForIdleDim");

  if ((-[CSMagSafeAccessoryViewController isStatic](self, "isStatic") & (v7 ^ 1)) != 0)
    v8 = 1;
  else
    v8 = 2;
  objc_msgSend(v4, "setIdleWarnMode:", v8);
  objc_msgSend(v4, "setIdleTimerMode:", 1);
  if (-[CSMagSafeAccessoryViewController isStatic](self, "isStatic"))
    v9 = 11;
  else
    v9 = 0;
  objc_msgSend(v4, "setIdleTimerDuration:", v9);

}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSMagSafeAccessoryViewController;
  if (-[CSCoverSheetViewControllerBase handleEvent:](&v8, sel_handleEvent_, v4)
    && (objc_msgSend(v4, "isConsumable") & 1) != 0)
  {
    goto LABEL_11;
  }
  v5 = objc_msgSend(v4, "type");
  if (v5 == 28)
  {
    if (!-[CSMagSafeAccessoryViewController isStatic](self, "isStatic")
      && !-[CSMagSafeAccessoryViewController isAnimatingPresentation](self, "isAnimatingPresentation"))
    {
      goto LABEL_10;
    }
  }
  else if (v5 == 25 && !-[CSMagSafeAccessoryViewController isStatic](self, "isStatic"))
  {
LABEL_10:
    -[CSCoverSheetViewControllerBase dismiss](self, "dismiss");
LABEL_11:
    v6 = objc_msgSend(v4, "isConsumable");
    goto LABEL_12;
  }
  v6 = 0;
LABEL_12:

  return v6;
}

- (int64_t)presentationType
{
  return 2;
}

- (int64_t)presentationPriority
{
  return 500;
}

- (int64_t)presentationStyle
{
  return 2;
}

- (CSMagSafeAccessoryView)accessoryView
{
  return 0;
}

- (double)animationDurationBeforeDismissal
{
  return 0.0;
}

- (void)addGrabberView:(id)a3
{
  _BOOL4 v5;
  uint64_t v6;
  UIView **p_grabberView;
  UIView *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = -[CSMagSafeAccessoryViewController allowsQuickDismissal](self, "allowsQuickDismissal");
  v6 = SBFEffectiveHomeButtonType();
  if (v5 && v6 == 2)
  {
    p_grabberView = &self->_grabberView;
    if ((BSEqualObjects() & 1) == 0)
    {
      -[UIView removeFromSuperview](*p_grabberView, "removeFromSuperview");
      objc_storeStrong((id *)&self->_grabberView, a3);
      -[CSMagSafeAccessoryViewController loadViewIfNeeded](self, "loadViewIfNeeded");
      v8 = *p_grabberView;
      -[CSMagSafeAccessoryViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bounds");
      -[UIView setFrame:](v8, "setFrame:");

      -[UIView setAutoresizingMask:](*p_grabberView, "setAutoresizingMask:", 18);
      -[CSMagSafeAccessoryViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", *p_grabberView);

    }
  }

}

- (void)_dismissIfAllowed
{
  if (-[CSMagSafeAccessoryViewController allowsQuickDismissal](self, "allowsQuickDismissal"))
    -[CSCoverSheetViewControllerBase dismiss](self, "dismiss");
}

- (void)setAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_accessory, a3);
}

- (BOOL)isAnimatingPresentation
{
  return self->_isAnimatingPresentation;
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
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_grabberView, 0);
}

@end
