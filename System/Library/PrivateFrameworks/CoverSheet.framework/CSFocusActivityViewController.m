@implementation CSFocusActivityViewController

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSFocusActivityViewController;
  -[CSCoverSheetViewControllerBase viewDidLoad](&v6, sel_viewDidLoad);
  +[CSLockScreenDomain rootSettings](CSLockScreenDomain, "rootSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addKeyObserver:", self);

  -[CSFocusActivityViewController _updateActivityViewBehavior](self, "_updateActivityViewBehavior");
  -[CSFocusActivityViewController _updateActivityViewActivity](self, "_updateActivityViewActivity");
  -[CSFocusActivityViewController _updateActivityViewLegibility](self, "_updateActivityViewLegibility");
  -[CSFocusActivityViewController _activityViewIfLoaded](self, "_activityViewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSFocusActivityViewController;
  -[CSCoverSheetViewControllerBase viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
  -[CSFocusActivityViewController _activityViewIfLoaded](self, "_activityViewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSFocusActivityViewController preferredContentSize](self, "preferredContentSize");
  objc_msgSend(v3, "setSize:");

}

- (void)focusActivityViewIndicatorPressed:(id)a3
{
  id v4;

  objc_storeWeak((id *)&self->_customFocusActivityPickerPresentingView, 0);
  +[CSAction actionWithType:](CSAction, "actionWithType:", 12);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase sendAction:](self, "sendAction:", v4);

}

- (void)focusActivityViewIndicatorDidChangeToVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CSFocusActivityViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusActivityViewIndicatorDidChangeToVisible:", v3);

}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSFocusActivityViewController;
  if (-[CSCoverSheetViewControllerBase handleEvent:](&v9, sel_handleEvent_, v4)
    && (objc_msgSend(v4, "isConsumable") & 1) != 0)
  {
    v5 = objc_msgSend(v4, "isConsumable");
  }
  else
  {
    v6 = objc_msgSend(v4, "type");
    switch(v6)
    {
      case 25:
        if (!self->_activity)
        {
          -[CSFocusActivityViewController _activityViewIfLoaded](self, "_activityViewIfLoaded");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "removeIndicator");

        }
        break;
      case 2:
        -[CSFocusActivityViewController _updateActivityViewBehavior](self, "_updateActivityViewBehavior");
        break;
      case 1:
        -[CSFocusActivityViewController _updateActivityViewLegibility](self, "_updateActivityViewLegibility");
        break;
    }
    v5 = 0;
  }

  return v5;
}

- (void)setContainerSize:(CGSize)a3
{
  if (self->_containerSize.width != a3.width || self->_containerSize.height != a3.height)
  {
    self->_containerSize = a3;
    -[CSFocusActivityViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
  }
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)usesBackgroundView
{
  return 0;
}

- (id)activityPickerViewControllerPresentingView:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[CSFocusActivityViewController customFocusActivityPickerPresentingView](self, "customFocusActivityPickerPresentingView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[CSFocusActivityViewController activityIndicator](self, "activityIndicator");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)activityPickerViewControllerRepresentedActivityForPresentation:(id)a3
{
  return self->_activity;
}

- (id)activityPickerViewControllerRepresentedActivityForDismissal:(id)a3
{
  return self->_activity;
}

- (BOOL)isActivityIndicatorVisible
{
  void *v2;
  char v3;

  -[CSFocusActivityViewController _activityViewIfLoaded](self, "_activityViewIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isActivityIndicatorVisible");

  return v3;
}

- (void)setActivity:(id)a3
{
  FCActivityDescribing *v5;
  FCActivityDescribing *v6;

  v5 = (FCActivityDescribing *)a3;
  if (self->_activity != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_activity, a3);
    -[CSFocusActivityViewController _updateActivityViewActivity](self, "_updateActivityViewActivity");
    -[CSFocusActivityViewController _removeActivityViewIndicatorIfNecessary](self, "_removeActivityViewIndicatorIfNecessary");
    v5 = v6;
  }

}

- (UIView)activityIndicator
{
  void *v2;
  void *v3;

  -[CSFocusActivityViewController _activityViewIfLoaded](self, "_activityViewIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activityIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (CSActivityPickerViewController)activityPickerViewController
{
  CSActivityPickerViewController **p_activityPickerViewController;
  CSActivityPickerViewController *WeakRetained;

  p_activityPickerViewController = &self->_activityPickerViewController;
  WeakRetained = (CSActivityPickerViewController *)objc_loadWeakRetained((id *)&self->_activityPickerViewController);
  if (!WeakRetained)
  {
    WeakRetained = objc_alloc_init(CSActivityPickerViewController);
    -[CSActivityPickerViewController setDelegate:](WeakRetained, "setDelegate:", self);
    objc_storeWeak((id *)p_activityPickerViewController, WeakRetained);
  }
  return WeakRetained;
}

- (void)_updatePreferredContentSize
{
  +[CSFocusActivityView activityViewSize](CSFocusActivityView, "activityViewSize");
  -[CSFocusActivityViewController setPreferredContentSize:](self, "setPreferredContentSize:", self->_containerSize.width);
}

- (void)presentFocusActivityPickerViewControllerFromView:(id)a3 coverSheetViewPresenting:(id)a4
{
  UIView **p_customFocusActivityPickerPresentingView;
  id v7;
  id v8;

  p_customFocusActivityPickerPresentingView = &self->_customFocusActivityPickerPresentingView;
  v7 = a4;
  objc_storeWeak((id *)p_customFocusActivityPickerPresentingView, a3);
  +[CSAction actionWithType:](CSAction, "actionWithType:", 12);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleAction:fromSender:", v8, self);

}

- (void)_updateActivityViewBehavior
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  -[CSCoverSheetViewControllerBase activeBehavior](self, "activeBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "areRestrictedCapabilities:", 0x400000);

  +[CSLockScreenDomain rootSettings](CSLockScreenDomain, "rootSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "gatesOnControlCenterAccess");

  -[CSFocusActivityViewController _activityViewIfLoaded](self, "_activityViewIfLoaded");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v4 & v7 ^ 1u);

}

- (void)_updateActivityViewActivity
{
  id v3;

  -[CSFocusActivityViewController _activityViewIfLoaded](self, "_activityViewIfLoaded");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActivity:", self->_activity);

}

- (void)_updateActivityViewLegibility
{
  void *v3;
  void *v4;
  id v5;

  -[CSFocusActivityViewController _activityViewIfLoaded](self, "_activityViewIfLoaded");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase activeAppearance](self, "activeAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "legibilitySettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLegibilitySettings:", v4);

}

- (void)_removeActivityViewIndicatorIfNecessary
{
  void *v3;
  int v4;
  id v5;

  -[CSFocusActivityViewController activityPickerViewController](self, "activityPickerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_appearState");

  if (v4 != 2 && !self->_activity)
  {
    -[CSFocusActivityViewController _activityViewIfLoaded](self, "_activityViewIfLoaded");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeIndicator");

  }
}

- (id)_activityViewIfLoaded
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  -[CSFocusActivityViewController viewIfLoaded](self, "viewIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("gatesOnControlCenterAccess")))
    -[CSFocusActivityViewController _updateActivityViewBehavior](self, "_updateActivityViewBehavior");
}

- (FCActivityDescribing)activity
{
  return self->_activity;
}

- (CSFocusActivityViewControllerDelegate)delegate
{
  return (CSFocusActivityViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)customFocusActivityPickerPresentingView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_customFocusActivityPickerPresentingView);
}

- (void)setCustomFocusActivityPickerPresentingView:(id)a3
{
  objc_storeWeak((id *)&self->_customFocusActivityPickerPresentingView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_customFocusActivityPickerPresentingView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_destroyWeak((id *)&self->_activityPickerViewController);
}

@end
