@implementation CSRemoteContentModalViewController

- (CSRemoteContentModalViewController)initWithContentDefinition:(id)a3 preferences:(id)a4 hostViewController:(id)a5 authenticationStatusProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CSRemoteContentModalViewController *v15;
  CSRemoteContentModalViewController *v16;
  uint64_t v17;
  CSLockScreenSettings *lockScreenSettings;
  uint64_t v19;
  UIImpactFeedbackGenerator *rubberBandFeedbackGenerator;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  CSContentComponent *content;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  CSDateViewComponent *dateTimeComponent;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  CSProudLockComponent *proudLockComponent;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  CSQuickActionsComponent *quickActionsComponent;
  uint64_t v41;
  NSArray *components;
  void *v43;
  uint64_t v44;
  CSDashBoardRemoteContentSettings *remoteContentSettings;
  CSRemoteContentModalViewController *v46;
  NSObject *v47;
  objc_super v49;
  _QWORD v50[4];
  uint8_t buf[4];
  CSRemoteContentModalViewController *v52;
  __int16 v53;
  _BOOL4 v54;
  __int16 v55;
  _BOOL4 v56;
  __int16 v57;
  _BOOL4 v58;
  __int16 v59;
  _BOOL4 v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v49.receiver = self;
  v49.super_class = (Class)CSRemoteContentModalViewController;
  v15 = -[CSRemoteContentModalViewController init](&v49, sel_init);
  v16 = v15;
  if (!v15)
    goto LABEL_7;
  if (v11 && v12 && v13 && v14)
  {
    objc_storeStrong((id *)&v15->_definition, a3);
    objc_storeStrong((id *)&v16->_remoteContentPreferences, a4);
    objc_storeStrong((id *)&v16->_authenticationStatusProvider, a6);
    objc_storeWeak((id *)&v16->_hostViewController, v13);
    +[CSLockScreenDomain rootSettings](CSLockScreenDomain, "rootSettings");
    v17 = objc_claimAutoreleasedReturnValue();
    lockScreenSettings = v16->_lockScreenSettings;
    v16->_lockScreenSettings = (CSLockScreenSettings *)v17;

    -[PTSettings addKeyObserver:](v16->_lockScreenSettings, "addKeyObserver:", v16);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA660]), "initWithStyle:", -[CSLockScreenSettings unlockRubberBandFeedbackIntensity](v16->_lockScreenSettings, "unlockRubberBandFeedbackIntensity"));
    rubberBandFeedbackGenerator = v16->_rubberBandFeedbackGenerator;
    v16->_rubberBandFeedbackGenerator = (UIImpactFeedbackGenerator *)v19;

    v21 = (void *)objc_opt_new();
    objc_msgSend(v21, "priority:", 40);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSCoverSheetViewControllerBase appearanceIdentifier](v16, "appearanceIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "identifier:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    content = v16->_content;
    v16->_content = (CSContentComponent *)v24;

    v26 = (void *)objc_opt_new();
    objc_msgSend(v26, "priority:", 40);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSCoverSheetViewControllerBase appearanceIdentifier](v16, "appearanceIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "identifier:", v28);
    v29 = objc_claimAutoreleasedReturnValue();
    dateTimeComponent = v16->_dateTimeComponent;
    v16->_dateTimeComponent = (CSDateViewComponent *)v29;

    v31 = (void *)objc_opt_new();
    objc_msgSend(v31, "priority:", 40);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSCoverSheetViewControllerBase appearanceIdentifier](v16, "appearanceIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "identifier:", v33);
    v34 = objc_claimAutoreleasedReturnValue();
    proudLockComponent = v16->_proudLockComponent;
    v16->_proudLockComponent = (CSProudLockComponent *)v34;

    v36 = (void *)objc_opt_new();
    objc_msgSend(v36, "priority:", 40);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSCoverSheetViewControllerBase appearanceIdentifier](v16, "appearanceIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "identifier:", v38);
    v39 = objc_claimAutoreleasedReturnValue();
    quickActionsComponent = v16->_quickActionsComponent;
    v16->_quickActionsComponent = (CSQuickActionsComponent *)v39;

    v50[0] = v16->_content;
    v50[1] = v16->_dateTimeComponent;
    v50[2] = v16->_proudLockComponent;
    v50[3] = v16->_quickActionsComponent;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 4);
    v41 = objc_claimAutoreleasedReturnValue();
    components = v16->_components;
    v16->_components = (NSArray *)v41;

    +[CSLockScreenDomain rootSettings](CSLockScreenDomain, "rootSettings");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "dashBoardRemoteContentSettings");
    v44 = objc_claimAutoreleasedReturnValue();
    remoteContentSettings = v16->_remoteContentSettings;
    v16->_remoteContentSettings = (CSDashBoardRemoteContentSettings *)v44;

    -[PTSettings addKeyObserver:](v16->_remoteContentSettings, "addKeyObserver:", v16);
LABEL_7:
    v46 = v16;
    goto LABEL_11;
  }
  SBLogDashBoard();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544386;
    v52 = v16;
    v53 = 1024;
    v54 = v11 != 0;
    v55 = 1024;
    v56 = v12 != 0;
    v57 = 1024;
    v58 = v13 != 0;
    v59 = 1024;
    v60 = v14 != 0;
    _os_log_impl(&dword_1D0337000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@: Missing required parameters for init; definition: %d, preferences: %d, hostVC: %d, authenticationStatusProvider: %d",
      buf,
      0x24u);
  }

  v46 = 0;
LABEL_11:

  return v46;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  if (-[CSRemoteContentModalViewController isViewLoaded](self, "isViewLoaded") && WeakRetained)
    -[CSRemoteContentModalViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", WeakRetained);

  v4.receiver = self;
  v4.super_class = (Class)CSRemoteContentModalViewController;
  -[CSCoverSheetViewControllerBase dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  CSRemoteContentModalView *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  CSRemoteContentModalView *v7;

  -[CSRemoteContentModalViewController _createProperties](self, "_createProperties");
  v3 = [CSRemoteContentModalView alloc];
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v7 = -[CSRemoteContentModalView initWithFrame:](v3, "initWithFrame:");

  -[CSRemoteContentModalView setTouchDelegate:](v7, "setTouchDelegate:", self);
  -[CSModalView setShowsStatusText:](v7, "setShowsStatusText:", 0);
  -[CSModalView setDelegate:](v7, "setDelegate:", self);
  -[CSRemoteContentModalView setAutoresizingMask:](v7, "setAutoresizingMask:", 18);
  -[CSModalView setWantsEnhancedSecondaryActionButton:](v7, "setWantsEnhancedSecondaryActionButton:", 1);
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSModalView setSecondaryActionButtonTextColor:](v7, "setSecondaryActionButtonTextColor:", v5);

  -[CSRemoteContentModalViewController setView:](self, "setView:", v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  if (WeakRetained)
    -[CSRemoteContentModalViewController _addChildHostViewController:](self, "_addChildHostViewController:", WeakRetained);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSRemoteContentModalViewController;
  -[CSModalViewControllerBase viewDidLoad](&v3, sel_viewDidLoad);
  -[CSRemoteContentModalViewController _updateSecondaryActionButtonText](self, "_updateSecondaryActionButtonText");
}

- (int64_t)preferredNotificationListMode
{
  return -[SBSRemoteContentPreferences preferredNotificationListMode](self->_remoteContentPreferences, "preferredNotificationListMode");
}

- (BOOL)suppressesDismissalForNotification
{
  return -[SBSRemoteContentPreferences suppressesNotifications](self->_remoteContentPreferences, "suppressesNotifications");
}

- (BOOL)suppressesDismissalGesture
{
  return (unint64_t)(-[CSRemoteContentModalViewController _homeGestureMode](self, "_homeGestureMode") - 1) < 2;
}

- (BOOL)shouldHideHomeAffordance
{
  return -[CSRemoteContentModalViewController _homeGestureMode](self, "_homeGestureMode") == 1;
}

- (BOOL)shouldCaptureHomeGesture
{
  return -[CSRemoteContentModalViewController _homeGestureMode](self, "_homeGestureMode") != 4;
}

- (BOOL)isInUnlockGestureMode
{
  return -[CSRemoteContentModalViewController _homeGestureMode](self, "_homeGestureMode") == 4;
}

- (void)setHostViewController:(id)a3
{
  void *v4;
  int v5;
  id obj;

  obj = a3;
  -[CSRemoteContentModalViewController _removeChildHostViewController](self, "_removeChildHostViewController");
  v4 = obj;
  if (obj)
  {
    objc_storeWeak((id *)&self->_hostViewController, obj);
    v5 = -[CSRemoteContentModalViewController isViewLoaded](self, "isViewLoaded");
    v4 = obj;
    if (v5)
    {
      -[CSRemoteContentModalViewController _addChildHostViewController:](self, "_addChildHostViewController:", obj);
      v4 = obj;
    }
  }

}

- (BOOL)dismissForDismissType:(int64_t)a3 completion:(id)a4
{
  CSRemoteContentHostViewController **p_hostViewController;
  id v7;
  id WeakRetained;
  id v9;

  p_hostViewController = &self->_hostViewController;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_hostViewController);
  objc_msgSend(WeakRetained, "didDismissForDismissType:", a3);

  v9 = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(a3) = objc_msgSend(v9, "remoteContentViewController:requestsDismissalForType:completion:", self, a3, v7);

  return a3;
}

- (int64_t)contentPresentationType
{
  return 0;
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
    if (-[CSRemoteContentModalViewController _suppressesBottomEdgeContent](self, "_suppressesBottomEdgeContent"))
      -[CSRemoteContentModalViewController _setUserHasInteractedSinceWake:](self, "_setUserHasInteractedSinceWake:", 1);
  }
  -[CSRemoteContentModalViewController _updateGrabberViewVisibility](self, "_updateGrabberViewVisibility");
  +[CSAction actionWithType:](CSAction, "actionWithType:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase sendAction:](self, "sendAction:", v4);

  -[CSRemoteContentModalViewController _updateSecondaryActionButtonText](self, "_updateSecondaryActionButtonText");
  -[CSCoverSheetViewControllerBase updateAppearanceForController:](self, "updateAppearanceForController:", self);
  -[CSCoverSheetViewControllerBase updateBehaviorForController:](self, "updateBehaviorForController:", self);

}

- (void)aggregateAppearance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
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
  int64_t v32;
  int64_t v33;
  int64_t v34;
  int v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  CSDateViewComponent *dateTimeComponent;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  objc_super v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)CSRemoteContentModalViewController;
  -[CSModalViewControllerBase aggregateAppearance:](&v61, sel_aggregateAppearance_, v4);
  if (!self->_remoteContentPreferences)
    goto LABEL_45;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  objc_msgSend(v4, "components");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v58 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "type");
        if (v12 > 0x1B || ((1 << v12) & 0xFFFADED) == 0)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
    }
    while (v8);
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v14 = v5;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v54;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v54 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(v4, "removeComponent:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
    }
    while (v16);
  }

  +[CSComponent footerCallToActionLabel](CSComponent, "footerCallToActionLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "priority:", 40);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "hidden:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v21);

  LODWORD(v21) = -[CSRemoteContentModalViewController shouldHideHomeAffordance](self, "shouldHideHomeAffordance");
  v22 = (void *)objc_opt_new();
  objc_msgSend(v22, "priority:", 40);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if ((_DWORD)v21)
    objc_msgSend(v23, "hidden:", 1);
  else
    objc_msgSend(v23, "suppressTeachableMomentsAnimation:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v25);

  objc_msgSend(v4, "addComponent:", self->_content);
  objc_msgSend(v4, "addComponent:", self->_proudLockComponent);
  objc_msgSend(v4, "addComponent:", self->_quickActionsComponent);
  +[CSComponent backgroundContent](CSComponent, "backgroundContent");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "priority:", 40);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "hidden:", 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v28);

  +[CSComponent pageContent](CSComponent, "pageContent");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "priority:", 40);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "hidden:", 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v31);

  v32 = -[CSRemoteContentModalViewController _backgroundStyle](self, "_backgroundStyle");
  v33 = -[CSRemoteContentModalViewController _dateTimeStyle](self, "_dateTimeStyle");
  if (self->_remoteContentPreferences)
  {
    v34 = v33;
    switch(v32)
    {
      case 0:
        v35 = 0;
        v36 = 1;
        break;
      case 1:
        v35 = 0;
        v36 = 5;
        break;
      case 2:
        v35 = 1;
        v36 = 6;
        break;
      case 3:
      case 4:
        v35 = 1;
        v36 = 7;
        break;
      default:
        v36 = 0;
        v35 = 0;
        break;
    }
    v37 = (void *)objc_opt_new();
    objc_msgSend(v37, "priority:", 40);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v36);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "style:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addComponent:", v40);

    if (v35)
    {
      v41 = objc_alloc(MEMORY[0x1E0CEADE8]);
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)objc_msgSend(v41, "initWithStyle:contentColor:", 1, v42);
      objc_msgSend(v4, "setLegibilitySettings:", v43);

    }
    if (v34 == 2)
    {
      dateTimeComponent = self->_dateTimeComponent;
      v45 = 1;
    }
    else
    {
      if (v34 == 1)
      {
        -[CSDateViewComponent setVibrantAndCentered:](self->_dateTimeComponent, "setVibrantAndCentered:", 1);
LABEL_40:
        if (-[CSRemoteContentModalViewController _suppressesBottomEdgeContent](self, "_suppressesBottomEdgeContent"))
        {
          +[CSComponent quickActions](CSComponent, "quickActions");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "priority:", 40);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "hidden:", 1);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addComponent:", v48);

        }
        goto LABEL_42;
      }
      if (v34)
        goto LABEL_40;
      -[CSDateViewComponent setVibrantAndCentered:](self->_dateTimeComponent, "setVibrantAndCentered:", 0);
      dateTimeComponent = self->_dateTimeComponent;
      v45 = 0;
    }
    -[CSComponent setHidden:](dateTimeComponent, "setHidden:", v45);
    goto LABEL_40;
  }
LABEL_42:
  objc_msgSend(v4, "addComponent:", self->_dateTimeComponent);
  if (-[CSRemoteContentModalViewController _reducesWhitePoint](self, "_reducesWhitePoint"))
  {
    -[CSRemoteContentModalViewController _backgroundStyle](self, "_backgroundStyle");
    v49 = (void *)objc_opt_new();
    objc_msgSend(v49, "priority:", 40);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "lighterReduction:", BSSettingFlagForBool());
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "hidden:", 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addComponent:", v52);

  }
LABEL_45:

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
  v8.super_class = (Class)CSRemoteContentModalViewController;
  -[CSModalViewControllerBase aggregateBehavior:](&v8, sel_aggregateBehavior_, v4);
  objc_msgSend(v4, "addRestrictedCapabilities:", 0x2000);
  if (-[CSRemoteContentModalViewController shouldCaptureHomeGesture](self, "shouldCaptureHomeGesture"))
    objc_msgSend(v4, "addRestrictedCapabilities:", 4096);
  else
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
  v5.super_class = (Class)CSRemoteContentModalViewController;
  v4 = a3;
  -[CSCoverSheetViewControllerBase _updateDisplayLayoutElementForActivation:](&v5, sel__updateDisplayLayoutElementForActivation_, v4);
  objc_msgSend(v4, "sb_setTransitioning:", (-[CSRemoteContentModalViewController _appearState](self, "_appearState", v5.receiver, v5.super_class) & 0xFFFFFFFD) == 1);

}

- (void)handleSecondaryActionForView:(id)a3
{
  void *v4;

  +[CSAction actionWithType:](CSAction, "actionWithType:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase sendAction:](self, "sendAction:", v4);

  -[CSRemoteContentModalViewController _dismissForced:animated:](self, "_dismissForced:animated:", 1, 1);
}

- (void)didReceiveTouch
{
  id v3;

  if (-[CSRemoteContentModalViewController _dismissesOnTap](self, "_dismissesOnTap"))
  {
    +[CSAction actionWithType:](CSAction, "actionWithType:", 1);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[CSCoverSheetViewControllerBase sendAction:](self, "sendAction:", v3);

  }
  else if (-[CSDashBoardRemoteContentSettings undimsOnTap](self->_remoteContentSettings, "undimsOnTap"))
  {
    -[CSRemoteContentModalViewController _setUserHasInteractedSinceWake:](self, "_setUserHasInteractedSinceWake:", 1);
  }
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

- (void)_createProperties
{
  UIViewFloatAnimatableProperty *v3;
  UIViewFloatAnimatableProperty **p_scaleProperty;
  UIViewFloatAnimatableProperty *scaleProperty;
  SBFFluidBehaviorSettings *v6;
  SBFFluidBehaviorSettings *scaleSettings;
  UIViewFloatAnimatableProperty *v8;
  UIViewFloatAnimatableProperty **p_alphaProperty;
  UIViewFloatAnimatableProperty *alphaProperty;
  SBFFluidBehaviorSettings *v11;
  SBFFluidBehaviorSettings *alphaSettings;
  void *v13;
  UIViewFloatAnimatableProperty *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id location;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v3 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
  p_scaleProperty = &self->_scaleProperty;
  scaleProperty = self->_scaleProperty;
  self->_scaleProperty = v3;

  -[UIViewFloatAnimatableProperty setValue:](self->_scaleProperty, "setValue:", 1.0);
  v6 = (SBFFluidBehaviorSettings *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
  scaleSettings = self->_scaleSettings;
  self->_scaleSettings = v6;

  -[SBFFluidBehaviorSettings setBehaviorType:](self->_scaleSettings, "setBehaviorType:", 2);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_scaleSettings, "setDampingRatio:", 1.0);
  -[SBFFluidBehaviorSettings setResponse:](self->_scaleSettings, "setResponse:", 0.5);
  v8 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
  p_alphaProperty = &self->_alphaProperty;
  alphaProperty = self->_alphaProperty;
  self->_alphaProperty = v8;

  -[UIViewFloatAnimatableProperty setValue:](self->_alphaProperty, "setValue:", 1.0);
  v11 = (SBFFluidBehaviorSettings *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
  alphaSettings = self->_alphaSettings;
  self->_alphaSettings = v11;

  -[SBFFluidBehaviorSettings setBehaviorType:](self->_alphaSettings, "setBehaviorType:", 1);
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_alphaSettings, "setDampingRatio:", 1.0);
  -[SBFFluidBehaviorSettings setResponse:](self->_alphaSettings, "setResponse:", 0.25);
  objc_initWeak(&location, self);
  v13 = (void *)MEMORY[0x1E0CEABB0];
  v14 = *p_alphaProperty;
  v19[0] = *p_scaleProperty;
  v19[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __55__CSRemoteContentModalViewController__createProperties__block_invoke;
  v16[3] = &unk_1E8E2E868;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v13, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v15, v16);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __55__CSRemoteContentModalViewController__createProperties__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateForPropertyChanged");

}

- (void)_updateForPropertyChanged
{
  double v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  double v11;
  id WeakRetained;
  void *v13;
  _OWORD v14[3];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!-[CSRemoteContentModalViewController shouldHideHomeAffordance](self, "shouldHideHomeAffordance"))
  {
    v20 = 0u;
    v21 = 0u;
    v19 = 0u;
    -[UIViewFloatAnimatableProperty presentationValue](self->_scaleProperty, "presentationValue");
    CSComponentTransitionInputsMake(0, (uint64_t)&v19, 0.0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v3, 0.0);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = self->_components;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v9, "setTransitionModifiers:", 16);
          v14[0] = v19;
          v14[1] = v20;
          v14[2] = v21;
          objc_msgSend(v9, "setTransitionInputs:", v14);
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
      }
      while (v6);
    }

    v10 = 1.0;
    if (!UIAccessibilityIsReduceTransparencyEnabled())
    {
      -[UIViewFloatAnimatableProperty presentationValue](self->_alphaProperty, "presentationValue");
      v10 = v11;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
    objc_msgSend(WeakRetained, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAlpha:", v10);

  }
  -[CSCoverSheetViewControllerBase updateAppearanceForController:](self, "updateAppearanceForController:", self);
}

- (void)addGrabberView:(id)a3
{
  id *p_grabberView;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_grabberView = (id *)&self->_grabberView;
  objc_storeStrong((id *)&self->_grabberView, a3);
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v6 = *p_grabberView;
    -[CSModalViewControllerBase view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    objc_msgSend(v6, "setFrame:");

    objc_msgSend(*p_grabberView, "setAutoresizingMask:", 18);
    -[CSModalViewControllerBase view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", *p_grabberView);

  }
  -[CSRemoteContentModalViewController _updateGrabberViewVisibility](self, "_updateGrabberViewVisibility");

}

- (void)_updateGrabberViewVisibility
{
  id v3;

  if (-[CSRemoteContentModalViewController shouldHideHomeAffordance](self, "shouldHideHomeAffordance"))
  {
    -[UIView removeFromSuperview](self->_grabberView, "removeFromSuperview");
  }
  else
  {
    -[CSModalViewControllerBase view](self, "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addSubview:", self->_grabberView);

  }
}

- (void)handleBottomEdgeGestureBegan:(id)a3
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;

  v4 = a3;
  -[CSRemoteContentModalViewController _setCornerRounded:](self, "_setCornerRounded:", 1);
  -[CSModalViewControllerBase view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:", v5);
  v7 = v6;
  v9 = v8;

  self->_previousTranslation.x = v7;
  self->_previousTranslation.y = v9;

  if (-[CSRemoteContentModalViewController suppressesDismissalGesture](self, "suppressesDismissalGesture"))
  {
    if (!-[CSRemoteContentModalViewController shouldHideHomeAffordance](self, "shouldHideHomeAffordance"))
      -[UIImpactFeedbackGenerator prepare](self->_rubberBandFeedbackGenerator, "prepare");
  }
}

- (void)handleBottomEdgeGestureChanged:(id)a3
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;

  v4 = a3;
  -[CSModalViewControllerBase view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:", v5);
  v7 = v6;
  v9 = v8;

  self->_previousTranslation.x = v7;
  self->_previousTranslation.y = v9;
  -[UIViewFloatAnimatableProperty presentationValue](self->_scaleProperty, "presentationValue");
  BSUIInvertRubberBandValueForInterval();
  BSUIConstrainValueToIntervalWithRubberBand();
  -[CSRemoteContentModalViewController _updateContentScale:interactive:](self, "_updateContentScale:interactive:", 1, 0x3FEB333333333333, 1, 0x3FF0000000000000, 1);
  -[UIViewFloatAnimatableProperty presentationValue](self->_alphaProperty, "presentationValue");
  BSUIInvertRubberBandValueForInterval();
  BSUIConstrainValueToIntervalWithRubberBand();
  -[CSRemoteContentModalViewController _updateContentAlpha:interactive:](self, "_updateContentAlpha:interactive:", 1, 0x3FEB333333333333, 1, 0x3FF0000000000000, 1);
}

- (void)handleBottomEdgeGestureEnded:(id)a3
{
  -[CSRemoteContentModalViewController _updateContentScale:interactive:](self, "_updateContentScale:interactive:", 0, 1.0);
  -[CSRemoteContentModalViewController _updateContentAlpha:interactive:](self, "_updateContentAlpha:interactive:", 0, 1.0);
  if (!-[CSRemoteContentModalViewController _shouldCancelInteractiveDismissGesture](self, "_shouldCancelInteractiveDismissGesture"))
  {
    if (!-[CSRemoteContentModalViewController shouldHideHomeAffordance](self, "shouldHideHomeAffordance"))
    {
      if (-[CSRemoteContentModalViewController suppressesDismissalGesture](self, "suppressesDismissalGesture"))
      {
        -[UIImpactFeedbackGenerator impactOccurred](self->_rubberBandFeedbackGenerator, "impactOccurred");
      }
      else if (-[CSRemoteContentModalViewController shouldCaptureHomeGesture](self, "shouldCaptureHomeGesture"))
      {
        -[UIImpactFeedbackGenerator impactOccurredWithIntensity:](self->_rubberBandFeedbackGenerator, "impactOccurredWithIntensity:", 0.5);
      }
    }
    -[CSRemoteContentModalViewController _dismissForced:animated:](self, "_dismissForced:animated:", 0, 1);
  }
}

- (void)dismissForHomeButton
{
  -[CSRemoteContentModalViewController _dismissForced:animated:](self, "_dismissForced:animated:", 0, 1);
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6;
  UIImpactFeedbackGenerator *v7;
  UIImpactFeedbackGenerator *rubberBandFeedbackGenerator;
  CSDashBoardRemoteContentSettings *v9;

  v9 = (CSDashBoardRemoteContentSettings *)a3;
  v6 = a4;
  if ((CSDashBoardRemoteContentSettings *)self->_lockScreenSettings == v9)
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("unlockRubberBandFeedbackIntensity")))
    {
      v7 = (UIImpactFeedbackGenerator *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA660]), "initWithStyle:", -[CSLockScreenSettings unlockRubberBandFeedbackIntensity](self->_lockScreenSettings, "unlockRubberBandFeedbackIntensity"));
      rubberBandFeedbackGenerator = self->_rubberBandFeedbackGenerator;
      self->_rubberBandFeedbackGenerator = v7;

    }
  }
  else if (self->_remoteContentSettings == v9)
  {
    -[CSCoverSheetViewControllerBase updateAppearanceForController:](self, "updateAppearanceForController:", self);
  }

}

- (void)_setCornerRounded:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  -[CSModalViewControllerBase view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayCornerRadius");
    objc_msgSend(v6, "_setContinuousCornerRadius:");

  }
  else
  {
    objc_msgSend(v5, "_setContinuousCornerRadius:", 0.0);
  }

  -[CSModalViewControllerBase view](self, "view");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClipsToBounds:", v3);

}

- (void)_updateContentScale:(double)a3 interactive:(BOOL)a4
{
  SBFFluidBehaviorSettings *scaleSettings;
  uint64_t v5;
  _QWORD v6[5];
  BOOL v7;
  _QWORD v8[6];

  scaleSettings = self->_scaleSettings;
  v8[0] = MEMORY[0x1E0C809B0];
  if (a4)
    v5 = 5;
  else
    v5 = 3;
  v8[1] = 3221225472;
  v8[2] = __70__CSRemoteContentModalViewController__updateContentScale_interactive___block_invoke;
  v8[3] = &unk_1E8E2EDD0;
  v8[4] = self;
  *(double *)&v8[5] = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__CSRemoteContentModalViewController__updateContentScale_interactive___block_invoke_2;
  v6[3] = &unk_1E8E30340;
  v7 = a4;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "sb_animateWithSettings:mode:animations:completion:", scaleSettings, v5, v8, v6);
}

uint64_t __70__CSRemoteContentModalViewController__updateContentScale_interactive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "setValue:", *(double *)(a1 + 40));
}

uint64_t __70__CSRemoteContentModalViewController__updateContentScale_interactive___block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_setCornerRounded:", 0);
  return result;
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
  v6[2] = __70__CSRemoteContentModalViewController__updateContentAlpha_interactive___block_invoke;
  v6[3] = &unk_1E8E2EDD0;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  objc_msgSend(MEMORY[0x1E0CEABB0], "sb_animateWithSettings:mode:animations:completion:", alphaSettings, v4, v6, 0);
}

uint64_t __70__CSRemoteContentModalViewController__updateContentAlpha_interactive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "setValue:", *(double *)(a1 + 40));
}

- (BOOL)_shouldCancelInteractiveDismissGesture
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
  double v14;

  -[UIViewFloatAnimatableProperty presentationValue](self->_scaleProperty, "presentationValue");
  v4 = v3;
  -[UIViewFloatAnimatableProperty velocity](self->_scaleProperty, "velocity");
  v6 = v5;
  if (-[CSDashBoardRemoteContentSettings usesLegacyDismissalLogic](self->_remoteContentSettings, "usesLegacyDismissalLogic"))
  {
    v7 = 1000.0;
  }
  else
  {
    -[CSDashBoardRemoteContentSettings directFlingDampeningFactor](self->_remoteContentSettings, "directFlingDampeningFactor");
    v7 = v8 * 1000.0;
  }
  v9 = v4 + v6 / v7 * 0.99 / 0.01;
  if (-[CSDashBoardRemoteContentSettings usesLegacyDismissalLogic](self->_remoteContentSettings, "usesLegacyDismissalLogic"))
  {
    v10 = 0.0;
    if (v9 <= 1.0)
      v10 = 1.0 - v9;
    v11 = fabs(v10);
    -[CSDashBoardRemoteContentSettings legacyThreshold](self->_remoteContentSettings, "legacyThreshold");
    return v11 < vabdd_f64(v12, v9);
  }
  else
  {
    -[CSDashBoardRemoteContentSettings directThreshold](self->_remoteContentSettings, "directThreshold");
    return v9 > v14;
  }
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
  if (!-[CSRemoteContentModalViewController suppressesDismissalGesture](self, "suppressesDismissalGesture") || v5)
  {
    self->_dismissing = 1;
    v7 = 0.3;
    if (!v4)
      v7 = 0.0;
    v8[4] = self;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__CSRemoteContentModalViewController__dismissForced_animated___block_invoke;
    v9[3] = &unk_1E8E2DB38;
    v9[4] = self;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __62__CSRemoteContentModalViewController__dismissForced_animated___block_invoke_2;
    v8[3] = &unk_1E8E2DDE0;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v9, v8, v7);
  }
}

void __62__CSRemoteContentModalViewController__dismissForced_animated___block_invoke(uint64_t a1)
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

void __62__CSRemoteContentModalViewController__dismissForced_animated___block_invoke_2(uint64_t a1)
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

- (void)_updateSecondaryActionButtonText
{
  void *v3;
  void *v4;
  id v5;

  if (-[CSRemoteContentModalViewController _suppressesBottomEdgeContent](self, "_suppressesBottomEdgeContent"))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("BEDTIME_DISMISS"), &stru_1E8E30B28, CFSTR("CoverSheet"));
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[CSModalViewControllerBase viewIfLoaded](self, "viewIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSecondaryActionButtonText:", v5);

}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSRemoteContentModalViewController;
  if (-[CSCoverSheetViewControllerBase handleEvent:](&v8, sel_handleEvent_, v4)
    && (objc_msgSend(v4, "isConsumable") & 1) != 0)
  {
    goto LABEL_6;
  }
  v5 = objc_msgSend(v4, "type");
  if (v5 == 22)
  {
    -[CSRemoteContentModalViewController didReceiveTouch](self, "didReceiveTouch");
    goto LABEL_8;
  }
  if (v5 != 25)
  {
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  -[CSRemoteContentModalViewController _setUserHasInteractedSinceWake:](self, "_setUserHasInteractedSinceWake:", 0);
LABEL_6:
  v6 = 1;
LABEL_9:

  return v6;
}

- (void)_addChildHostViewController:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CSRemoteContentModalViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__CSRemoteContentModalViewController__addChildHostViewController___block_invoke;
  v6[3] = &unk_1E8E2DF58;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[CSRemoteContentModalViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", v5, 1, v6);

}

void __66__CSRemoteContentModalViewController__addChildHostViewController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v2, "setFrame:");

  objc_msgSend(*(id *)(a1 + 40), "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendSubviewToBack:", v4);

}

- (void)_removeChildHostViewController
{
  id WeakRetained;

  if (-[CSRemoteContentModalViewController isViewLoaded](self, "isViewLoaded"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
    if (WeakRetained)
      -[CSRemoteContentModalViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", WeakRetained);

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
  return !self->_userHasInteractedSinceWake
      && (-[CSDashBoardRemoteContentSettings forceLuminanceReduction](self->_remoteContentSettings, "forceLuminanceReduction")|| -[SBSRemoteContentPreferences reducesWhitePoint](self->_remoteContentPreferences, "reducesWhitePoint"))&& -[CSRemoteContentModalViewController _supportsLuminanceReductionForCurrentBackgroundStyle](self, "_supportsLuminanceReductionForCurrentBackgroundStyle");
}

- (BOOL)_supportsLuminanceReductionForCurrentBackgroundStyle
{
  return (unint64_t)(-[CSRemoteContentModalViewController _backgroundStyle](self, "_backgroundStyle") - 2) < 3;
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

- (CSLockScreenSettings)lockScreenSettings
{
  return self->_lockScreenSettings;
}

- (void)setLockScreenSettings:(id)a3
{
  objc_storeStrong((id *)&self->_lockScreenSettings, a3);
}

- (UIImpactFeedbackGenerator)rubberBandFeedbackGenerator
{
  return self->_rubberBandFeedbackGenerator;
}

- (void)setRubberBandFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_rubberBandFeedbackGenerator, a3);
}

- (CSContentComponent)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (CSDateViewComponent)dateTimeComponent
{
  return self->_dateTimeComponent;
}

- (void)setDateTimeComponent:(id)a3
{
  objc_storeStrong((id *)&self->_dateTimeComponent, a3);
}

- (CSProudLockComponent)proudLockComponent
{
  return self->_proudLockComponent;
}

- (void)setProudLockComponent:(id)a3
{
  objc_storeStrong((id *)&self->_proudLockComponent, a3);
}

- (CSQuickActionsComponent)quickActionsComponent
{
  return self->_quickActionsComponent;
}

- (void)setQuickActionsComponent:(id)a3
{
  objc_storeStrong((id *)&self->_quickActionsComponent, a3);
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
  objc_storeStrong((id *)&self->_quickActionsComponent, 0);
  objc_storeStrong((id *)&self->_proudLockComponent, 0);
  objc_storeStrong((id *)&self->_dateTimeComponent, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_rubberBandFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_lockScreenSettings, 0);
  objc_destroyWeak((id *)&self->_hostViewController);
  objc_storeStrong((id *)&self->_authenticationStatusProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_remoteContentPreferences, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_grabberView, 0);
  objc_storeStrong((id *)&self->_alphaSettings, 0);
  objc_storeStrong((id *)&self->_alphaProperty, 0);
  objc_storeStrong((id *)&self->_scaleSettings, 0);
  objc_storeStrong((id *)&self->_scaleProperty, 0);
}

@end
