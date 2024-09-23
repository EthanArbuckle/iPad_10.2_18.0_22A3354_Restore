@implementation CSRemoteContentInlineViewController

- (CSRemoteContentInlineViewController)initWithContentDefinition:(id)a3 preferences:(id)a4 hostViewController:(id)a5 authenticationStatusProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CSRemoteContentInlineViewController *v15;
  CSRemoteContentInlineViewController *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  CSDateViewComponent *dateTimeComponent;
  void *v22;
  uint64_t v23;
  CSDashBoardRemoteContentSettings *remoteContentSettings;
  CSRemoteContentInlineViewController *v25;
  NSObject *v26;
  objc_super v28;
  uint8_t buf[4];
  CSRemoteContentInlineViewController *v30;
  __int16 v31;
  _BOOL4 v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  _BOOL4 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v28.receiver = self;
  v28.super_class = (Class)CSRemoteContentInlineViewController;
  v15 = -[CSRemoteContentInlineViewController init](&v28, sel_init);
  v16 = v15;
  if (!v15)
    goto LABEL_7;
  if (v11 && v12 && v13 && v14)
  {
    v15->_containerSize = (CGSize)*MEMORY[0x1E0C9D820];
    objc_storeStrong((id *)&v15->_definition, a3);
    objc_storeStrong((id *)&v16->_remoteContentPreferences, a4);
    objc_storeStrong((id *)&v16->_authenticationStatusProvider, a6);
    objc_storeWeak((id *)&v16->_hostViewController, v13);
    v17 = (void *)objc_opt_new();
    objc_msgSend(v17, "priority:", 30);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSCoverSheetViewControllerBase appearanceIdentifier](v16, "appearanceIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identifier:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    dateTimeComponent = v16->_dateTimeComponent;
    v16->_dateTimeComponent = (CSDateViewComponent *)v20;

    +[CSLockScreenDomain rootSettings](CSLockScreenDomain, "rootSettings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dashBoardRemoteContentSettings");
    v23 = objc_claimAutoreleasedReturnValue();
    remoteContentSettings = v16->_remoteContentSettings;
    v16->_remoteContentSettings = (CSDashBoardRemoteContentSettings *)v23;

    -[PTSettings addKeyObserver:](v16->_remoteContentSettings, "addKeyObserver:", v16);
LABEL_7:
    v25 = v16;
    goto LABEL_11;
  }
  SBLogDashBoard();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544386;
    v30 = v16;
    v31 = 1024;
    v32 = v11 != 0;
    v33 = 1024;
    v34 = v12 != 0;
    v35 = 1024;
    v36 = v13 != 0;
    v37 = 1024;
    v38 = v14 != 0;
    _os_log_impl(&dword_1D0337000, v26, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Missing required parameters for init; definition: %d, preferences: %d, hostVC: %d, aut"
      "henticationStatusProvider: %d",
      buf,
      0x24u);
  }

  v25 = 0;
LABEL_11:

  return v25;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  if (-[CSRemoteContentInlineViewController isViewLoaded](self, "isViewLoaded") && WeakRetained)
    -[CSRemoteContentInlineViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", WeakRetained);

  v4.receiver = self;
  v4.super_class = (Class)CSRemoteContentInlineViewController;
  -[CSCoverSheetViewControllerBase dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  CSRemoteContentInlineView *v3;
  void *v4;
  id WeakRetained;
  CSRemoteContentInlineView *v6;

  v3 = [CSRemoteContentInlineView alloc];
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = -[CSRemoteContentInlineView initWithFrame:](v3, "initWithFrame:");

  -[CSRemoteContentInlineView setAutoresizingMask:](v6, "setAutoresizingMask:", 0);
  -[CSRemoteContentInlineViewController setView:](self, "setView:", v6);
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  if (WeakRetained)
    -[CSRemoteContentInlineViewController _addChildHostViewController:](self, "_addChildHostViewController:", WeakRetained);

}

- (void)viewDidLayoutSubviews
{
  id WeakRetained;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  unsigned int v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CSRemoteContentInlineViewController;
  -[CSCoverSheetViewControllerBase viewDidLayoutSubviews](&v15, sel_viewDidLayoutSubviews);
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  LODWORD(v4) = (unint64_t)(-[CSRemoteContentInlineViewController interfaceOrientation](self, "interfaceOrientation")- 1) < 2;
  objc_msgSend(WeakRetained, "safeAreaForRemote");
  v10 = (v8 < v6) ^ v4;
  if (v10)
    v11 = v8;
  else
    v11 = v6;
  if (!v10)
    v6 = v8;
  v12 = -self->_horizontalInsetMargin;
  v13 = -(v9 + 8.0);
  objc_msgSend(WeakRetained, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v12, v13, v6, v11);

}

- (BOOL)suppressesDismissalForNotification
{
  return -[SBSRemoteContentPreferences suppressesNotifications](self->_remoteContentPreferences, "suppressesNotifications");
}

- (int64_t)preferredNotificationListMode
{
  return -[SBSRemoteContentPreferences preferredNotificationListMode](self->_remoteContentPreferences, "preferredNotificationListMode");
}

- (BOOL)suppressesDismissalGesture
{
  return (unint64_t)(-[CSRemoteContentInlineViewController _homeGestureMode](self, "_homeGestureMode") - 1) < 2;
}

- (BOOL)isInUnlockGestureMode
{
  return -[CSRemoteContentInlineViewController _homeGestureMode](self, "_homeGestureMode") == 4;
}

- (double)remoteContentHeight
{
  BOOL IsNull;
  double result;
  id WeakRetained;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double MaxY;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  -[CSRemoteContentInlineViewController inlineContentFrame](self, "inlineContentFrame");
  IsNull = CGRectIsNull(v15);
  result = 0.0;
  if (!IsNull)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
    objc_msgSend(WeakRetained, "safeAreaForRemote");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    -[CSRemoteContentInlineViewController inlineContentFrame](self, "inlineContentFrame");
    v17 = CGRectIntegral(v16);
    MaxY = CGRectGetMaxY(v17);
    v18.origin.x = v7;
    v18.origin.y = v9;
    v18.size.width = v11;
    v18.size.height = v13;
    v19 = CGRectIntegral(v18);
    return MaxY - CGRectGetMinY(v19);
  }
  return result;
}

- (void)setRemoteContentHidden:(BOOL)a3
{
  id WeakRetained;

  self->_remoteContentHidden = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  objc_msgSend(WeakRetained, "setHidden:", self->_remoteContentHidden);

}

- (void)setHorizontalInsetMargin:(double)a3
{
  id v3;

  if (self->_horizontalInsetMargin != a3)
  {
    self->_horizontalInsetMargin = a3;
    -[CSRemoteContentInlineViewController view](self, "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsLayout");

  }
}

- (void)setHostViewController:(id)a3
{
  void *v4;
  int v5;
  id obj;

  obj = a3;
  -[CSRemoteContentInlineViewController _removeChildHostViewController](self, "_removeChildHostViewController");
  v4 = obj;
  if (obj)
  {
    objc_storeWeak((id *)&self->_hostViewController, obj);
    v5 = -[CSRemoteContentInlineViewController isViewLoaded](self, "isViewLoaded");
    v4 = obj;
    if (v5)
    {
      -[CSRemoteContentInlineViewController _addChildHostViewController:](self, "_addChildHostViewController:", obj);
      v4 = obj;
    }
  }

}

- (BOOL)dismissForDismissType:(int64_t)a3 completion:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;

  self->_dismissing = 1;
  v6 = a4;
  -[CSCoverSheetViewControllerBase updateAppearanceForController:](self, "updateAppearanceForController:", self);
  -[CSCoverSheetViewControllerBase updateBehaviorForController:](self, "updateBehaviorForController:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  objc_msgSend(WeakRetained, "didDismissForDismissType:", a3);

  v8 = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(a3) = objc_msgSend(v8, "remoteContentViewController:requestsDismissalForType:completion:", self, a3, v6);

  return a3;
}

- (int64_t)contentPresentationType
{
  return 1;
}

- (void)hostDidChangeContentBounds
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  objc_msgSend(WeakRetained, "hostDidChangeContentBounds");

  -[CSRemoteContentInlineViewController viewIfLoaded](self, "viewIfLoaded");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

- (void)remoteDidChangeStyle
{
  id WeakRetained;
  void *v4;
  id obj;

  WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  objc_msgSend(WeakRetained, "contentPreferences");
  obj = (id)objc_claimAutoreleasedReturnValue();

  if (obj)
  {
    objc_storeStrong((id *)&self->_remoteContentPreferences, obj);
    if (-[CSRemoteContentInlineViewController _suppressesBottomEdgeContent](self, "_suppressesBottomEdgeContent"))
      -[CSRemoteContentInlineViewController _setUserHasInteractedSinceWake:](self, "_setUserHasInteractedSinceWake:", 1);
  }
  +[CSAction actionWithType:](CSAction, "actionWithType:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase sendAction:](self, "sendAction:", v4);

  -[CSCoverSheetViewControllerBase updateAppearanceForController:](self, "updateAppearanceForController:", self);
  -[CSCoverSheetViewControllerBase updateBehaviorForController:](self, "updateBehaviorForController:", self);

}

- (void)aggregateAppearance:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  char v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  CSDateViewComponent *v20;
  uint64_t v21;
  CSDateViewComponent *dateTimeComponent;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CSRemoteContentInlineViewController;
  -[CSCoverSheetViewControllerBase aggregateAppearance:](&v31, sel_aggregateAppearance_, v4);
  if (!self->_remoteContentPreferences || self->_dismissing)
    goto LABEL_25;
  v5 = -[CSRemoteContentInlineViewController _backgroundStyle](self, "_backgroundStyle");
  v6 = -[CSRemoteContentInlineViewController _dateTimeStyle](self, "_dateTimeStyle");
  switch(v5)
  {
    case 0:
      v8 = 0;
      v7 = 1;
      v9 = 1;
      break;
    case 1:
      v7 = 0;
      v8 = 0;
      v9 = 5;
      break;
    case 2:
      v7 = 0;
      v8 = 1;
      v9 = 6;
      break;
    case 3:
    case 4:
      v7 = 0;
      v8 = 1;
      v9 = 7;
      break;
    default:
      v7 = 0;
      v9 = 0;
      v8 = 0;
      break;
  }
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "priority:", 30);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "style:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v13);

  if ((v7 & 1) == 0)
  {
    v14 = (void *)objc_opt_new();
    objc_msgSend(v14, "priority:", 30);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "shouldRenderInline:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addComponent:", v16);

  }
  if (v8)
  {
    v17 = objc_alloc(MEMORY[0x1E0CEADE8]);
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithStyle:contentColor:", 1, v18);
    objc_msgSend(v4, "setLegibilitySettings:", v19);

  }
  switch(v6)
  {
    case 0:
      dateTimeComponent = self->_dateTimeComponent;
      v23 = 0;
LABEL_19:
      -[CSDateViewComponent setVibrantAndCentered:](dateTimeComponent, "setVibrantAndCentered:", v23);
      v20 = self->_dateTimeComponent;
      v21 = 0;
      goto LABEL_20;
    case 1:
      dateTimeComponent = self->_dateTimeComponent;
      v23 = 1;
      goto LABEL_19;
    case 2:
      -[CSDateViewComponent setVibrantAndCentered:](self->_dateTimeComponent, "setVibrantAndCentered:", 0);
      v20 = self->_dateTimeComponent;
      v21 = 1;
LABEL_20:
      -[CSDateViewComponent setHidesTime:](v20, "setHidesTime:", v21);
      break;
  }
  objc_msgSend(v4, "addComponent:", self->_dateTimeComponent);
  if (-[CSRemoteContentInlineViewController _suppressesBottomEdgeContent](self, "_suppressesBottomEdgeContent"))
  {
    +[CSComponent quickActions](CSComponent, "quickActions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "priority:", 30);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "hidden:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addComponent:", v26);

  }
  if (-[CSRemoteContentInlineViewController _reducesWhitePoint](self, "_reducesWhitePoint"))
  {
    -[CSRemoteContentInlineViewController _backgroundStyle](self, "_backgroundStyle");
    v27 = (void *)objc_opt_new();
    objc_msgSend(v27, "priority:", 30);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "lighterReduction:", BSSettingFlagForBool());
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "hidden:", 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addComponent:", v30);

  }
LABEL_25:

}

- (void)aggregateBehavior:(id)a3
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSRemoteContentInlineViewController;
  -[CSCoverSheetViewControllerBase aggregateBehavior:](&v8, sel_aggregateBehavior_, v4);
  objc_msgSend(v4, "addRestrictedCapabilities:", 0x2000);
  objc_msgSend(v4, "removeRestrictedCapabilities:", 4096);
  objc_msgSend(v4, "removeRestrictedCapabilities:", 130);
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);

  if (WeakRetained)
  {
    if (-[CSDashBoardRemoteContentSettings autoExtendsIdleTimer](self->_remoteContentSettings, "autoExtendsIdleTimer"))
      v6 = 1;
    else
      v6 = 2;
    if (self->_userHasInteractedSinceWake)
      v7 = 4;
    else
      v7 = 1;
  }
  else
  {
    v6 = 2;
    v7 = 2;
  }
  objc_msgSend(v4, "setIdleTimerMode:", v6);
  objc_msgSend(v4, "setIdleTimerDuration:", v7);

}

- (id)_newDisplayLayoutElement
{
  void *v2;
  void *v3;

  -[SBSRemoteContentDefinition serviceName](self->_definition, "serviceName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAE30]), "initWithIdentifier:", v2);
    objc_msgSend(v3, "setFillsDisplayBounds:", 1);
    objc_msgSend(v3, "setLayoutRole:", 6);
    objc_msgSend(v3, "setUIApplicationElement:", 1);
    objc_msgSend(v3, "setBundleIdentifier:", v2);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_updateDisplayLayoutElementForActivation:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSRemoteContentInlineViewController;
  v4 = a3;
  -[CSCoverSheetViewControllerBase _updateDisplayLayoutElementForActivation:](&v5, sel__updateDisplayLayoutElementForActivation_, v4);
  objc_msgSend(v4, "sb_setTransitioning:", (-[CSRemoteContentInlineViewController _appearState](self, "_appearState", v5.receiver, v5.super_class) & 0xFFFFFFFD) == 1);

}

- (BOOL)shouldDismissInlineContentForNowPlaying
{
  return (unint64_t)(-[CSRemoteContentInlineViewController interfaceOrientation](self, "interfaceOrientation") - 3) < 2
      || -[CSRemoteContentInlineViewController _dismissesOnTap](self, "_dismissesOnTap");
}

- (BOOL)shouldInlineContentReceiveBackgroundTouches
{
  return -[CSRemoteContentInlineViewController _dismissesOnTap](self, "_dismissesOnTap")
      || -[CSDashBoardRemoteContentSettings undimsOnTap](self->_remoteContentSettings, "undimsOnTap");
}

- (CGRect)inlineContentFrame
{
  id WeakRetained;
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
  CGRect result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  objc_msgSend(WeakRetained, "contentFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setContainerSize:(CGSize)a3
{
  if (self->_containerSize.width != a3.width || self->_containerSize.height != a3.height)
  {
    self->_containerSize = a3;
    -[CSRemoteContentInlineViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
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

- (BOOL)insetsMargins
{
  return 0;
}

- (void)_didReceiveTouch
{
  id v3;

  if (-[CSRemoteContentInlineViewController _dismissesOnTap](self, "_dismissesOnTap"))
  {
    +[CSAction actionWithType:](CSAction, "actionWithType:", 1);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[CSCoverSheetViewControllerBase sendAction:](self, "sendAction:", v3);

  }
  else if (-[CSDashBoardRemoteContentSettings undimsOnTap](self->_remoteContentSettings, "undimsOnTap"))
  {
    -[CSRemoteContentInlineViewController _setUserHasInteractedSinceWake:](self, "_setUserHasInteractedSinceWake:", 1);
  }
}

- (void)_didReceiveScroll
{
  if (-[CSDashBoardRemoteContentSettings undimsOnTap](self->_remoteContentSettings, "undimsOnTap"))
    -[CSRemoteContentInlineViewController _setUserHasInteractedSinceWake:](self, "_setUserHasInteractedSinceWake:", 1);
}

- (void)_setUserHasInteractedSinceWake:(BOOL)a3
{
  if (self->_userHasInteractedSinceWake != a3)
  {
    self->_userHasInteractedSinceWake = a3;
    -[CSCoverSheetViewControllerBase updateAppearanceForController:](self, "updateAppearanceForController:", self);
    -[CSCoverSheetViewControllerBase updateBehaviorForController:](self, "updateBehaviorForController:", self);
  }
}

- (void)beginCancelTouchesForCurrentEventInHostedContent
{
  void *v3;
  id cancelInlineContentTouchesAssertion;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  objc_msgSend(WeakRetained, "_cancelTouchesForCurrentEventInHostedContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  cancelInlineContentTouchesAssertion = self->_cancelInlineContentTouchesAssertion;
  self->_cancelInlineContentTouchesAssertion = v3;

}

- (void)endCancelTouchesForCurrentEventInHostedContent
{
  id cancelInlineContentTouchesAssertion;

  cancelInlineContentTouchesAssertion = self->_cancelInlineContentTouchesAssertion;
  self->_cancelInlineContentTouchesAssertion = 0;

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_remoteContentSettings == a3)
    -[CSCoverSheetViewControllerBase updateAppearanceForController:](self, "updateAppearanceForController:", self, a4);
}

- (void)_updateContentAlpha:(double)a3 interactive:(BOOL)a4
{
  uint64_t v4;
  SBFFluidBehaviorSettings *alphaSettings;
  _QWORD v6[6];

  if (a4)
    v4 = 5;
  else
    v4 = 3;
  alphaSettings = self->_alphaSettings;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__CSRemoteContentInlineViewController__updateContentAlpha_interactive___block_invoke;
  v6[3] = &unk_1E8E2EDD0;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  objc_msgSend(MEMORY[0x1E0CEABB0], "sb_animateWithSettings:mode:animations:completion:", alphaSettings, v4, v6, 0);
}

uint64_t __71__CSRemoteContentInlineViewController__updateContentAlpha_interactive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "setValue:", *(double *)(a1 + 40));
}

- (void)_dismissForced:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  double v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v4 = a4;
  v5 = a3;
  if (!-[CSRemoteContentInlineViewController suppressesDismissalGesture](self, "suppressesDismissalGesture") || v5)
  {
    self->_dismissing = 1;
    v7 = 0.3;
    if (!v4)
      v7 = 0.0;
    v8[4] = self;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__CSRemoteContentInlineViewController__dismissForced_animated___block_invoke;
    v9[3] = &unk_1E8E2DB38;
    v9[4] = self;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__CSRemoteContentInlineViewController__dismissForced_animated___block_invoke_2;
    v8[3] = &unk_1E8E2DDE0;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v9, v8, v7);
  }
}

void __63__CSRemoteContentInlineViewController__dismissForced_animated___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", 0);

}

void __63__CSRemoteContentInlineViewController__dismissForced_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  v3 = *(void **)(a1 + 32);
  +[CSAction actionWithType:](CSAction, "actionWithType:", 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendAction:", v4);

}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSRemoteContentInlineViewController;
  if (-[CSCoverSheetViewControllerBase handleEvent:](&v8, sel_handleEvent_, v4)
    && (objc_msgSend(v4, "isConsumable") & 1) != 0)
  {
    goto LABEL_6;
  }
  v5 = objc_msgSend(v4, "type");
  if (v5 == 22)
  {
    if (-[CSDashBoardRemoteContentSettings undimsOnTap](self->_remoteContentSettings, "undimsOnTap"))
      -[CSRemoteContentInlineViewController _setUserHasInteractedSinceWake:](self, "_setUserHasInteractedSinceWake:", 1);
    goto LABEL_9;
  }
  if (v5 != 25)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  -[CSRemoteContentInlineViewController _setUserHasInteractedSinceWake:](self, "_setUserHasInteractedSinceWake:", 0);
LABEL_6:
  v6 = 1;
LABEL_10:

  return v6;
}

- (void)_addChildHostViewController:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CSRemoteContentInlineViewController *v8;

  v4 = a3;
  objc_msgSend(v4, "setServiceViewShouldShareTouchesWithHost:", 1);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__CSRemoteContentInlineViewController__addChildHostViewController___block_invoke;
  v6[3] = &unk_1E8E2DF58;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[CSRemoteContentInlineViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", v5, 1, v6);

}

void __67__CSRemoteContentInlineViewController__addChildHostViewController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  CGAffineTransform v10;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v2, "setFrame:");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutoresizingMask:", 0);

  objc_msgSend(*(id *)(a1 + 32), "safeAreaForRemote");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeTranslation(&v10, 0.0, -v6);
  objc_msgSend(v7, "setTransform:", &v10);

  objc_msgSend(*(id *)(a1 + 40), "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendSubviewToBack:", v9);

}

- (void)_removeChildHostViewController
{
  id WeakRetained;

  if (-[CSRemoteContentInlineViewController isViewLoaded](self, "isViewLoaded"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
    if (WeakRetained)
      -[CSRemoteContentInlineViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", WeakRetained);

  }
  objc_storeWeak((id *)&self->_hostViewController, 0);
}

- (int64_t)_dateTimeStyle
{
  if (-[CSDashBoardRemoteContentSettings overrideContentPreferences](self->_remoteContentSettings, "overrideContentPreferences"))
  {
    return -[CSDashBoardRemoteContentSettings dateTimeStyleOverride](self->_remoteContentSettings, "dateTimeStyleOverride");
  }
  else
  {
    return -[SBSRemoteContentPreferences dateTimeStyle](self->_remoteContentPreferences, "dateTimeStyle");
  }
}

- (int64_t)_backgroundStyle
{
  if (-[CSDashBoardRemoteContentSettings overrideContentPreferences](self->_remoteContentSettings, "overrideContentPreferences"))
  {
    return -[CSDashBoardRemoteContentSettings backgroundStyleOverride](self->_remoteContentSettings, "backgroundStyleOverride");
  }
  else
  {
    return -[SBSRemoteContentPreferences backgroundStyle](self->_remoteContentPreferences, "backgroundStyle");
  }
}

- (int64_t)_homeGestureMode
{
  if (-[CSDashBoardRemoteContentSettings overrideContentPreferences](self->_remoteContentSettings, "overrideContentPreferences"))
  {
    return -[CSDashBoardRemoteContentSettings homeGestureModeOverride](self->_remoteContentSettings, "homeGestureModeOverride");
  }
  if (-[SBFAuthenticationStatusProvider hasAuthenticatedAtLeastOnceSinceBoot](self->_authenticationStatusProvider, "hasAuthenticatedAtLeastOnceSinceBoot"))return -[SBSRemoteContentPreferences homeGestureMode](self->_remoteContentPreferences, "homeGestureMode");
  return 4;
}

- (BOOL)_suppressesBottomEdgeContent
{
  return -[SBSRemoteContentPreferences suppressesBottomEdgeContent](self->_remoteContentPreferences, "suppressesBottomEdgeContent");
}

- (BOOL)_dismissesOnTap
{
  if (-[CSDashBoardRemoteContentSettings overrideContentPreferences](self->_remoteContentSettings, "overrideContentPreferences"))
  {
    return -[CSDashBoardRemoteContentSettings dismissesOnTapOverride](self->_remoteContentSettings, "dismissesOnTapOverride");
  }
  else
  {
    return -[SBSRemoteContentPreferences dismissesOnTap](self->_remoteContentPreferences, "dismissesOnTap");
  }
}

- (BOOL)_reducesWhitePoint
{
  int v3;

  if (-[CSDashBoardRemoteContentSettings forceLuminanceReduction](self->_remoteContentSettings, "forceLuminanceReduction")|| (v3 = -[SBSRemoteContentPreferences reducesWhitePoint](self->_remoteContentPreferences, "reducesWhitePoint")) != 0)
  {
    LOBYTE(v3) = -[CSRemoteContentInlineViewController _supportsLuminanceReductionForCurrentBackgroundStyle](self, "_supportsLuminanceReductionForCurrentBackgroundStyle");
  }
  return v3;
}

- (BOOL)_supportsLuminanceReductionForCurrentBackgroundStyle
{
  return (unint64_t)(-[CSRemoteContentInlineViewController _backgroundStyle](self, "_backgroundStyle") - 2) < 3;
}

- (void)_updatePreferredContentSize
{
  double v3;
  double v4;
  id v5;

  -[CSRemoteContentInlineViewController remoteContentHeight](self, "remoteContentHeight");
  v4 = v3;
  -[CSRemoteContentInlineViewController setPreferredContentSize:](self, "setPreferredContentSize:", self->_containerSize.width, v3);
  -[CSRemoteContentInlineViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, self->_containerSize.width, v4);

}

- (double)horizontalInsetMargin
{
  return self->_horizontalInsetMargin;
}

- (CSRemoteContentViewControllerDelegate)delegate
{
  return (CSRemoteContentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBFAuthenticationStatusProvider)authenticationStatusProvider
{
  return self->_authenticationStatusProvider;
}

- (CSRemoteContentHostViewController)hostViewController
{
  return (CSRemoteContentHostViewController *)objc_loadWeakRetained((id *)&self->_hostViewController);
}

- (BOOL)remoteContentHidden
{
  return self->_remoteContentHidden;
}

- (CSDateViewComponent)dateTimeComponent
{
  return self->_dateTimeComponent;
}

- (void)setDateTimeComponent:(id)a3
{
  objc_storeStrong((id *)&self->_dateTimeComponent, a3);
}

- (CSDashBoardRemoteContentSettings)remoteContentSettings
{
  return self->_remoteContentSettings;
}

- (void)setRemoteContentSettings:(id)a3
{
  objc_storeStrong((id *)&self->_remoteContentSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteContentSettings, 0);
  objc_storeStrong((id *)&self->_dateTimeComponent, 0);
  objc_destroyWeak((id *)&self->_hostViewController);
  objc_storeStrong((id *)&self->_authenticationStatusProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_cancelInlineContentTouchesAssertion, 0);
  objc_storeStrong((id *)&self->_remoteContentPreferences, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_alphaSettings, 0);
  objc_storeStrong((id *)&self->_alphaProperty, 0);
}

@end
