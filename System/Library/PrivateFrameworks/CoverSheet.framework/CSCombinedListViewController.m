@implementation CSCombinedListViewController

- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sectionIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v11;
    v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_1D0337000, v9, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ updating notification section settings for section %@", (uint8_t *)&v13, 0x16u);

  }
  -[NCNotificationStructuredListViewController updateNotificationSectionSettings:previousSectionSettings:](self->_structuredListViewController, "updateNotificationSectionSettings:previousSectionSettings:", v6, v7);

}

- (void)notificationsLoadedForSectionIdentifier:(id)a3
{
  -[NCNotificationStructuredListViewController notificationsLoadedForSectionIdentifier:](self->_structuredListViewController, "notificationsLoadedForSectionIdentifier:", a3);
}

- (void)_publishVisibleNotificationCountOnContentChange
{
  id v3;

  -[CSCombinedListViewController notificationObserver](self, "notificationObserver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v3, "combinedListViewController:didUpdateVisibleNotificationCount:", self, -[CSCombinedListViewController visibleNotificationCount](self, "visibleNotificationCount"));

}

- (unint64_t)visibleNotificationCount
{
  return -[NCNotificationStructuredListViewController visibleNotificationCount](self->_structuredListViewController, "visibleNotificationCount");
}

- (CSCombinedListViewControllerNotificationObserver)notificationObserver
{
  return (CSCombinedListViewControllerNotificationObserver *)objc_loadWeakRetained((id *)&self->_notificationObserver);
}

- (void)structuredListContentChanged:(BOOL)a3
{
  _BOOL8 v5;
  uint64_t v6;

  v5 = -[CSCombinedListViewController hasContent](self, "hasContent");
  if (a3
    || -[CSNotificationAdjunctListViewController isPresentingTransientContent](self->_adjunctListViewController, "isPresentingTransientContent"))
  {
    v6 = 1;
  }
  else
  {
    v6 = 0;
    if (self->_listDismissingContent)
      goto LABEL_5;
  }
  -[CSCombinedListViewController _setListHasContent:](self, "_setListHasContent:", v6);
LABEL_5:
  -[CSCombinedListViewController _noteListContentsPotentiallyChangedAfterTransitionFrom:to:](self, "_noteListContentsPotentiallyChangedAfterTransitionFrom:to:", v5, v6);
  -[CSCombinedListViewController _publishVisibleNotificationCountOnContentChange](self, "_publishVisibleNotificationCountOnContentChange");
}

- (BOOL)hasContent
{
  return self->_listPresentingContent;
}

- (void)_setListHasContent:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  self->_listDismissingContent = 0;
  if (self->_listPresentingContent != a3)
  {
    v3 = a3;
    v5 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = CFSTR("NO");
      if (v3)
        v10 = CFSTR("YES");
      v12 = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_1D0337000, v6, OS_LOG_TYPE_DEFAULT, "%@: Setting notification list has content to %@", (uint8_t *)&v12, 0x16u);

    }
    self->_listPresentingContent = v3;
    -[CSCombinedListViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "combinedListViewController:hasContent:", self, v3);

    -[CSCoverSheetViewControllerBase rebuildBehavior](self, "rebuildBehavior");
    -[CSCombinedListViewController _updateFaceDetectMonitoring](self, "_updateFaceDetectMonitoring");
    -[CSCombinedListViewController _updateNotificationLongPressProximitySensorAssertion](self, "_updateNotificationLongPressProximitySensorAssertion");
    -[CSListItemManager setListHasNotificationContent:](self->_supplementaryItemManager, "setListHasNotificationContent:", -[NCNotificationStructuredListViewController hasVisibleContent](self->_structuredListViewController, "hasVisibleContent"));
  }
}

- (void)_noteListContentsPotentiallyChangedAfterTransitionFrom:(BOOL)a3 to:(BOOL)a4
{
  if (a3 || a4)
    -[CSCombinedListViewController _noteListContentsPotentiallyChanged](self, "_noteListContentsPotentiallyChanged");
}

- (void)proximitySensorProvider:(id)a3 objectWithinProximityDidChange:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  os_log_t *v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  BSInvalidatable *deviceWakeProximitySensorAssertion;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (os_log_t *)MEMORY[0x1E0DC5F70];
  v8 = *MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 67109120;
    LODWORD(v13) = v4;
    _os_log_impl(&dword_1D0337000, v8, OS_LOG_TYPE_DEFAULT, "[Notification Long Press Gesture] Proximity Sensor changed to objectWithinProximity: %{BOOL}d", (uint8_t *)&v12, 8u);
  }
  v9 = self->_proximitySensorCoveredSinceWake && v4;
  self->_proximitySensorCoveredSinceWake = v9;
  if (self->_deviceWakeProximitySensorAssertion)
  {
    v10 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = CFSTR("NotificationDeviceWake");
      _os_log_impl(&dword_1D0337000, v10, OS_LOG_TYPE_DEFAULT, "[Notification Long Press Gesture] Invalidating proximity sensor assertion for %@", (uint8_t *)&v12, 0xCu);
    }
    -[BSInvalidatable invalidate](self->_deviceWakeProximitySensorAssertion, "invalidate");
    deviceWakeProximitySensorAssertion = self->_deviceWakeProximitySensorAssertion;
    self->_deviceWakeProximitySensorAssertion = 0;

  }
}

- (CSCombinedListViewController)initWithDNDBedtimeController:(id)a3
{
  return -[CSCombinedListViewController initWithNibName:bundle:dndBedtimeController:](self, "initWithNibName:bundle:dndBedtimeController:", 0, 0, a3);
}

- (CSCombinedListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  CSDNDBedtimeController *v8;
  void *v9;
  CSDNDBedtimeController *v10;
  CSCombinedListViewController *v11;

  v6 = a4;
  v7 = a3;
  v8 = [CSDNDBedtimeController alloc];
  objc_msgSend(MEMORY[0x1E0D1D758], "serviceForClientIdentifier:", CFSTR("com.apple.springboard.dashboard.bedtime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CSDNDBedtimeController initWithStateService:initialObserver:](v8, "initWithStateService:initialObserver:", v9, self);

  v11 = -[CSCombinedListViewController initWithNibName:bundle:dndBedtimeController:](self, "initWithNibName:bundle:dndBedtimeController:", v7, v6, v10);
  return v11;
}

- (CSCombinedListViewController)initWithNibName:(id)a3 bundle:(id)a4 dndBedtimeController:(id)a5
{
  id v9;
  CSCombinedListViewController *v10;
  uint64_t v11;
  CSLockScreenSettings *lockScreenSettings;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  CSComponent *dateViewComponent;
  void *v18;
  void *v19;
  uint64_t v20;
  CSComponent *complicationContainerComponent;
  void *v22;
  void *v23;
  uint64_t v24;
  CSComponent *remoteInlineContentComponent;
  void *v26;
  void *v27;
  uint64_t v28;
  CSStatusBarBackgroundComponent *statusBarBackgroundComponent;
  void *v30;
  void *v31;
  uint64_t v32;
  CSStatusBarComponent *statusBarComponent;
  void *v34;
  void *v35;
  uint64_t v36;
  CSComponent *proudLockComponent;
  void *v38;
  void *v39;
  uint64_t v40;
  CSWallpaperFloatingLayerComponent *wallpaperFloatingLayerComponent;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  CSQuickActionsComponent *quickActionsComponent;
  NCNotificationStructuredListViewController *v47;
  NCNotificationStructuredListViewController *structuredListViewController;
  CSNotificationAdjunctListViewController *v49;
  CSNotificationAdjunctListViewController *adjunctListViewController;
  uint64_t v51;
  CSListItemManager *supplementaryItemManager;
  uint64_t v53;
  SBUIBiometricResource *biometricResource;
  void *v55;
  void *v56;
  uint64_t v57;
  NSHashTable *breakthroughContentObservers;
  uint64_t v59;
  FCActivityManager *focusActivityManager;
  objc_super v62;

  v9 = a5;
  v62.receiver = self;
  v62.super_class = (Class)CSCombinedListViewController;
  v10 = -[CSCoverSheetViewControllerBase initWithNibName:bundle:](&v62, sel_initWithNibName_bundle_, a3, a4);
  if (v10)
  {
    +[CSLockScreenDomain rootSettings](CSLockScreenDomain, "rootSettings");
    v11 = objc_claimAutoreleasedReturnValue();
    lockScreenSettings = v10->_lockScreenSettings;
    v10->_lockScreenSettings = (CSLockScreenSettings *)v11;

    -[PTSettings addKeyObserver:](v10->_lockScreenSettings, "addKeyObserver:", v10);
    -[CSLockScreenSettings dashBoardNotificationScrollSettings](v10->_lockScreenSettings, "dashBoardNotificationScrollSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addKeyObserver:", v10);

    +[CSComponent dateView](CSComponent, "dateView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSCoverSheetViewControllerBase appearanceIdentifier](v10, "appearanceIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    dateViewComponent = v10->_dateViewComponent;
    v10->_dateViewComponent = (CSComponent *)v16;

    v18 = (void *)objc_opt_new();
    -[CSCoverSheetViewControllerBase appearanceIdentifier](v10, "appearanceIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identifier:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    complicationContainerComponent = v10->_complicationContainerComponent;
    v10->_complicationContainerComponent = (CSComponent *)v20;

    v22 = (void *)objc_opt_new();
    -[CSCoverSheetViewControllerBase appearanceIdentifier](v10, "appearanceIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "identifier:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    remoteInlineContentComponent = v10->_remoteInlineContentComponent;
    v10->_remoteInlineContentComponent = (CSComponent *)v24;

    v26 = (void *)objc_opt_new();
    -[CSCoverSheetViewControllerBase appearanceIdentifier](v10, "appearanceIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "identifier:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
    statusBarBackgroundComponent = v10->_statusBarBackgroundComponent;
    v10->_statusBarBackgroundComponent = (CSStatusBarBackgroundComponent *)v28;

    -[CSStatusBarBackgroundComponent setShowBackgroundWhileTransitioning:](v10->_statusBarBackgroundComponent, "setShowBackgroundWhileTransitioning:", 1);
    -[CSComponent setHidden:](v10->_statusBarBackgroundComponent, "setHidden:", 1);
    v30 = (void *)objc_opt_new();
    -[CSCoverSheetViewControllerBase appearanceIdentifier](v10, "appearanceIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "identifier:", v31);
    v32 = objc_claimAutoreleasedReturnValue();
    statusBarComponent = v10->_statusBarComponent;
    v10->_statusBarComponent = (CSStatusBarComponent *)v32;

    +[CSComponent proudLock](CSComponent, "proudLock");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSCoverSheetViewControllerBase appearanceIdentifier](v10, "appearanceIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "identifier:", v35);
    v36 = objc_claimAutoreleasedReturnValue();
    proudLockComponent = v10->_proudLockComponent;
    v10->_proudLockComponent = (CSComponent *)v36;

    v38 = (void *)objc_opt_new();
    -[CSCoverSheetViewControllerBase appearanceIdentifier](v10, "appearanceIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "identifier:", v39);
    v40 = objc_claimAutoreleasedReturnValue();
    wallpaperFloatingLayerComponent = v10->_wallpaperFloatingLayerComponent;
    v10->_wallpaperFloatingLayerComponent = (CSWallpaperFloatingLayerComponent *)v40;

    v42 = (void *)objc_opt_new();
    -[CSCoverSheetViewControllerBase appearanceIdentifier](v10, "appearanceIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "identifier:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "suppressVisibleChanges:", 1);
    v45 = objc_claimAutoreleasedReturnValue();
    quickActionsComponent = v10->_quickActionsComponent;
    v10->_quickActionsComponent = (CSQuickActionsComponent *)v45;

    v47 = (NCNotificationStructuredListViewController *)objc_alloc_init(MEMORY[0x1E0DC6190]);
    structuredListViewController = v10->_structuredListViewController;
    v10->_structuredListViewController = v47;

    -[NCNotificationStructuredListViewController setDelegate:](v10->_structuredListViewController, "setDelegate:", v10);
    -[NCNotificationStructuredListViewController setDeviceAuthenticated:](v10->_structuredListViewController, "setDeviceAuthenticated:", 0);
    -[NCNotificationStructuredListViewController addContentObserver:](v10->_structuredListViewController, "addContentObserver:", v10);
    v49 = objc_alloc_init(CSNotificationAdjunctListViewController);
    adjunctListViewController = v10->_adjunctListViewController;
    v10->_adjunctListViewController = v49;

    -[CSNotificationAdjunctListViewController setDelegate:](v10->_adjunctListViewController, "setDelegate:", v10);
    +[CSListItemManager itemManagerWithItemContainer:](CSListItemManager, "itemManagerWithItemContainer:", v10);
    v51 = objc_claimAutoreleasedReturnValue();
    supplementaryItemManager = v10->_supplementaryItemManager;
    v10->_supplementaryItemManager = (CSListItemManager *)v51;

    -[CSCoverSheetViewControllerBase setPresenter:](v10->_adjunctListViewController, "setPresenter:", v10);
    objc_storeStrong((id *)&v10->_dndBedtimeController, a5);
    if (v9)
      v10->_allowsDNDStateService = 1;
    -[CSCombinedListViewController setDefinesPresentationContext:](v10, "setDefinesPresentationContext:", 1);
    objc_msgSend(MEMORY[0x1E0DAC5A0], "sharedInstance");
    v53 = objc_claimAutoreleasedReturnValue();
    biometricResource = v10->_biometricResource;
    v10->_biometricResource = (SBUIBiometricResource *)v53;

    objc_msgSend(MEMORY[0x1E0D00D58], "sharedInstance");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "sensorCharacteristics");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_hasProximitySensor = objc_msgSend(v56, "hasDiscreteProximitySensor");

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v57 = objc_claimAutoreleasedReturnValue();
    breakthroughContentObservers = v10->_breakthroughContentObservers;
    v10->_breakthroughContentObservers = (NSHashTable *)v57;

    objc_msgSend(MEMORY[0x1E0D22368], "sharedActivityManager");
    v59 = objc_claimAutoreleasedReturnValue();
    focusActivityManager = v10->_focusActivityManager;
    v10->_focusActivityManager = (FCActivityManager *)v59;

    -[FCActivityManager addObserver:](v10->_focusActivityManager, "addObserver:", v10);
    -[CSCombinedListViewController _addStateCaptureHandlers](v10, "_addStateCaptureHandlers");
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[PTSettings removeKeyObserver:](self->_lockScreenSettings, "removeKeyObserver:", self);
  -[CSLockScreenSettings dashBoardNotificationScrollSettings](self->_lockScreenSettings, "dashBoardNotificationScrollSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeKeyObserver:", self);

  -[BSAbsoluteMachTimer invalidate](self->_significantUserInteractionTimer, "invalidate");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DAC348], 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DAC350], 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DAC358], 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB098], 0);
  -[CSCombinedListViewController dndStateService](self, "dndStateService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeStateUpdateListener:", self);

  -[FCActivityManager removeObserver:](self->_focusActivityManager, "removeObserver:", self);
  v6.receiver = self;
  v6.super_class = (Class)CSCombinedListViewController;
  -[CSCoverSheetViewControllerBase dealloc](&v6, sel_dealloc);
}

- (UIViewController)notificationListViewController
{
  return (UIViewController *)self->_structuredListViewController;
}

- (UIScrollView)notificationListScrollView
{
  return (UIScrollView *)-[NCNotificationStructuredListViewController scrollView](self->_structuredListViewController, "scrollView");
}

- (void)_addStateCaptureHandlers
{
  id v2;
  id v3;
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = MEMORY[0x1E0C80D38];
  objc_copyWeak(&v4, &location);
  v3 = (id)BSLogAddStateCaptureBlockWithTitle();

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

__CFString *__56__CSCombinedListViewController__addStateCaptureHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained;
  __CFString *v2;
  __CFString *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "_disableScrolling"))
    v2 = CFSTR("Scrolling Disabled");
  else
    v2 = &stru_1E8E30B28;
  v3 = v2;

  return v3;
}

- (BOOL)_allowsNotificationListTopInset
{
  void *v2;
  int v3;

  -[CSLockScreenSettings dashBoardRemoteContentSettings](self->_lockScreenSettings, "dashBoardRemoteContentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "shouldHostContentInNotificationList"))
    v3 = objc_msgSend(v2, "includesDateTimeStandinInAdjunctList") ^ 1;
  else
    LOBYTE(v3) = 1;

  return v3;
}

- (BOOL)_allowsSeparateAdjunctList
{
  void *v2;
  int v3;

  -[CSLockScreenSettings dashBoardRemoteContentSettings](self->_lockScreenSettings, "dashBoardRemoteContentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "shouldHostContentInNotificationList"))
    v3 = objc_msgSend(v2, "hostsInlineContentNativelyInNotificationList") ^ 1;
  else
    LOBYTE(v3) = 1;

  return v3;
}

- (BOOL)hasVisibleContentToReveal
{
  return -[NCNotificationStructuredListViewController hasVisibleContentToReveal](self->_structuredListViewController, "hasVisibleContentToReveal");
}

- (BOOL)hasVisibleBreakthroughContent
{
  return -[NCNotificationStructuredListViewController hasVisibleUrgentBreakthroughContent](self->_structuredListViewController, "hasVisibleUrgentBreakthroughContent");
}

- (BOOL)isShowingMediaControls
{
  BOOL v3;
  void *v4;

  if (-[CSNotificationAdjunctListViewController isShowingMediaControls](self->_adjunctListViewController, "isShowingMediaControls"))
  {
    return 1;
  }
  -[CSListItemManager nowPlayingItem](self->_supplementaryItemManager, "nowPlayingItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

- (double)itemSpacing
{
  double result;

  -[NCNotificationStructuredListViewController itemSpacing](self->_structuredListViewController, "itemSpacing");
  return result;
}

- (double)horizontalInsetMargin
{
  double v2;

  -[NCNotificationStructuredListViewController insetMargins](self->_structuredListViewController, "insetMargins");
  return v2;
}

- (void)resetContentOffset
{
  id v2;

  -[CSCombinedListViewController notificationListScrollView](self, "notificationListScrollView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scrollToTopIfPossible:", 0);

}

- (void)settleContentOffset
{
  id v3;

  -[CSCombinedListViewController notificationListScrollView](self, "notificationListScrollView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CSCombinedListViewController _snapScrollView:toAcceptableOffsetAnimated:](self, "_snapScrollView:toAcceptableOffsetAnimated:", v3, 0);

}

- (NSString)listViewControllerBackgroundGroupName
{
  return (NSString *)-[NCNotificationStructuredListViewController backgroundGroupNameBase](self->_structuredListViewController, "backgroundGroupNameBase");
}

- (SBFActionProviding)contentActionProvider
{
  return -[CSNotificationAdjunctListViewController contentActionProvider](self->_adjunctListViewController, "contentActionProvider");
}

- (void)setContentActionProvider:(id)a3
{
  -[CSNotificationAdjunctListViewController setContentActionProvider:](self->_adjunctListViewController, "setContentActionProvider:", a3);
}

- (void)setApplicationInformer:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_applicationInformer);
  if (WeakRetained != obj)
  {
    objc_msgSend(WeakRetained, "removeApplicationInformationObserver:", self);
    objc_storeWeak((id *)&self->_applicationInformer, obj);
    objc_msgSend(obj, "addApplicationInformationObserver:", self);
  }

}

- (BOOL)interpretsViewAsContent:(id)a3
{
  id v4;
  char v5;
  void *v6;
  char v7;
  char v8;

  v4 = a3;
  v5 = -[NCNotificationStructuredListViewController interpretsViewAsContent:](self->_structuredListViewController, "interpretsViewAsContent:", v4);
  if (-[CSCombinedListViewController _allowsSeparateAdjunctList](self, "_allowsSeparateAdjunctList"))
  {
    -[CSNotificationAdjunctListViewController view](self->_adjunctListViewController, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsView:", v4);

  }
  else
  {
    v7 = 0;
  }
  if (v4)
    v8 = v5 | v7;
  else
    v8 = 0;

  return v8;
}

- (BOOL)interpretsViewAsAdjunctContent:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (-[CSCombinedListViewController _allowsSeparateAdjunctList](self, "_allowsSeparateAdjunctList"))
  {
    -[CSNotificationAdjunctListViewController view](self->_adjunctListViewController, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsView:", v4);

  }
  else
  {
    v6 = 0;
  }
  if (!v4)
    v6 = 0;

  return v6;
}

- (BOOL)isTouchLocationInRestrictedRect:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  BOOL v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;
  CGPoint v43;
  CGRect v44;

  y = a3.y;
  x = a3.x;
  v42 = *MEMORY[0x1E0C80C00];
  -[CSListItemManager nowPlayingItem](self->_supplementaryItemManager, "nowPlayingItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentHost");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
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

  objc_msgSend(v11, "activityHostTouchRestrictedRects");
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v38;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v38 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "CGRectValue", (_QWORD)v37);
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v24 = v23;
        -[CSCombinedListViewController view](self, "view");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "view");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "convertRect:fromView:", v26, v18, v20, v22, v24);
        v28 = v27;
        v30 = v29;
        v32 = v31;
        v34 = v33;

        v44.origin.x = v28;
        v44.origin.y = v30;
        v44.size.width = v32;
        v44.size.height = v34;
        v43.x = x;
        v43.y = y;
        if (CGRectContainsPoint(v44, v43))
        {
          v35 = 1;
          goto LABEL_16;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v14)
        continue;
      break;
    }
  }
  v35 = 0;
LABEL_16:

  return v35;
}

- (void)setProximitySensorProvider:(id)a3
{
  CSProximitySensorProviding **p_proximitySensorProvider;
  id v5;

  p_proximitySensorProvider = &self->_proximitySensorProvider;
  v5 = a3;
  objc_storeWeak((id *)p_proximitySensorProvider, v5);
  objc_msgSend(v5, "addProximitySensorProviderObserver:", self);

}

- (void)setRemoteContentInlineProvider:(id)a3
{
  CSRemoteContentInlineProviding **p_remoteContentInlineProvider;
  id v5;

  p_remoteContentInlineProvider = &self->_remoteContentInlineProvider;
  v5 = a3;
  objc_storeWeak((id *)p_remoteContentInlineProvider, v5);
  -[CSNotificationAdjunctListViewController setRemoteContentInlineProvider:](self->_adjunctListViewController, "setRemoteContentInlineProvider:", v5);

}

- (void)setWidgetMetricsProvider:(id)a3
{
  -[CSNotificationAdjunctListViewController setWidgetMetricsProvider:](self->_adjunctListViewController, "setWidgetMetricsProvider:", a3);
}

- (PRWidgetMetricsProvider)widgetMetricsProvider
{
  return -[CSNotificationAdjunctListViewController widgetMetricsProvider](self->_adjunctListViewController, "widgetMetricsProvider");
}

- (id)acquireOverrideNotificationListDisplayStyleAssertionWithStyle:(int64_t)a3 hideNotificationCount:(BOOL)a4 reason:(id)a5
{
  _BOOL8 v5;
  id v8;
  NSMapTable *overrideNotificationListDisplayStyleAssertions;
  NSMapTable *v10;
  NSMapTable *v11;
  void *v12;
  void *v13;
  CSOverrideNotificationListDisplayStyleAssertion *v14;
  id v15;
  CSOverrideNotificationListDisplayStyleAssertion *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  CSCombinedListViewController *v22;
  id v23;

  v5 = a4;
  v8 = a5;
  overrideNotificationListDisplayStyleAssertions = self->_overrideNotificationListDisplayStyleAssertions;
  if (!overrideNotificationListDisplayStyleAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v10 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v11 = self->_overrideNotificationListDisplayStyleAssertions;
    self->_overrideNotificationListDisplayStyleAssertions = v10;

    overrideNotificationListDisplayStyleAssertions = self->_overrideNotificationListDisplayStyleAssertions;
  }
  -[NSMapTable objectForKey:](overrideNotificationListDisplayStyleAssertions, "objectForKey:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    objc_msgSend(v12, "cancel");
  v14 = [CSOverrideNotificationListDisplayStyleAssertion alloc];
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __123__CSCombinedListViewController_acquireOverrideNotificationListDisplayStyleAssertionWithStyle_hideNotificationCount_reason___block_invoke;
  v21 = &unk_1E8E2DC00;
  v22 = self;
  v23 = v8;
  v15 = v8;
  v16 = -[CSOverrideNotificationListDisplayStyleAssertion initWithNotificationListDisplayStyle:hideNotificationCount:reason:invalidationHandler:](v14, "initWithNotificationListDisplayStyle:hideNotificationCount:reason:invalidationHandler:", a3, v5, v15, &v18);

  -[NSMapTable setObject:forKey:](self->_overrideNotificationListDisplayStyleAssertions, "setObject:forKey:", v16, v15, v18, v19, v20, v21, v22);
  -[NCNotificationStructuredListViewController setOverrideNotificationListDisplayStyleSetting:forReason:hideNotificationCount:](self->_structuredListViewController, "setOverrideNotificationListDisplayStyleSetting:forReason:hideNotificationCount:", a3, v15, v5);

  return v16;
}

uint64_t __123__CSCombinedListViewController_acquireOverrideNotificationListDisplayStyleAssertionWithStyle_hideNotificationCount_reason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "removeOverrideNotificationListDisplayStyleSettingForReason:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isScrollingListContent
{
  return -[NCNotificationStructuredListViewController isScrollingListContent](self->_structuredListViewController, "isScrollingListContent");
}

- (void)handleDisplayWake
{
  -[NCNotificationStructuredListViewController handleTapToWake](self->_structuredListViewController, "handleTapToWake");
}

- (void)addVisibleBreakthroughContentObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[NSHashTable count](self->_breakthroughContentObservers, "count"))
    self->_hadBreakthroughContent = -[CSCombinedListViewController hasVisibleBreakthroughContent](self, "hasVisibleBreakthroughContent");
  -[NSHashTable addObject:](self->_breakthroughContentObservers, "addObject:", v4);

}

- (void)removeVisibleBreakthroughContentObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_breakthroughContentObservers, "removeObject:", a3);
}

- (BOOL)isNotificationHistoryRevealed
{
  return self->_historyWasRevealed;
}

- (void)revealNotificationHistory:(BOOL)a3 animated:(BOOL)a4
{
  -[NCNotificationStructuredListViewController revealNotificationHistory:animated:](self->_structuredListViewController, "revealNotificationHistory:animated:", a3, a4);
}

- (void)setRestrictsTouchesForRemoteView:(BOOL)a3
{
  -[CSListItemManager restrictsTouchesOnAllHostedScenes:](self->_supplementaryItemManager, "restrictsTouchesOnAllHostedScenes:", a3);
}

- (void)setShowNotificationsInAlwaysOn:(BOOL)a3
{
  -[NCNotificationStructuredListViewController setShowNotificationsInAlwaysOn:](self->_structuredListViewController, "setShowNotificationsInAlwaysOn:", a3);
}

- (void)setUserPresenceMonitor:(id)a3
{
  CSUserPresenceMonitor *v5;
  CSUserPresenceMonitor *v6;

  v5 = (CSUserPresenceMonitor *)a3;
  if (self->_userPresenceMonitor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_userPresenceMonitor, a3);
    -[CSCombinedListViewController _updateFaceDetectMonitoring](self, "_updateFaceDetectMonitoring");
    v5 = v6;
  }

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NCNotificationStructuredListViewController *structuredListViewController;
  id WeakRetained;
  DNDStateService *v17;
  DNDStateService *dndStateService;
  DNDStateService *v19;
  objc_super v20;
  _QWORD v21[5];
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;

  -[CSCombinedListViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCombinedListViewController notificationListViewController](self, "notificationListViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCombinedListViewController notificationListScrollView](self, "notificationListScrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __43__CSCombinedListViewController_viewDidLoad__block_invoke;
  v24[3] = &unk_1E8E2F730;
  v24[4] = self;
  v7 = v3;
  v25 = v7;
  v8 = v4;
  v26 = v8;
  -[CSCombinedListViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", v8, 0, v24);
  v22[0] = v6;
  v22[1] = 3221225472;
  v22[2] = __43__CSCombinedListViewController_viewDidLoad__block_invoke_2;
  v22[3] = &unk_1E8E2DF58;
  v22[4] = self;
  v9 = v5;
  v23 = v9;
  v10 = (void *)MEMORY[0x1D17E1614](v22);
  if (-[CSCombinedListViewController _allowsSeparateAdjunctList](self, "_allowsSeparateAdjunctList"))
    objc_msgSend(v8, "bs_addChildViewController:withSuperview:animated:transitionBlock:", self->_adjunctListViewController, v9, 0, v10);
  objc_msgSend(v9, "setClipsToBounds:", 0);
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1
      || SBFEffectiveHomeButtonType() != 2)
    {
      goto LABEL_12;
    }
LABEL_11:
    -[CSCombinedListViewController _statusBarHeight](self, "_statusBarHeight");
    objc_msgSend(v9, "setScrollIndicatorInsets:");
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "userInterfaceIdiom"))
  {

    goto LABEL_12;
  }
  v12 = SBFEffectiveHomeButtonType();

  if (v12 == 2)
    goto LABEL_11;
LABEL_12:
  -[CSCoverSheetViewControllerBase registerView:forRole:options:](self, "registerView:forRole:options:", v9, 2, 1);
  if (-[CSCombinedListViewController _allowsSeparateAdjunctList](self, "_allowsSeparateAdjunctList"))
  {
    -[CSNotificationAdjunctListViewController view](self->_adjunctListViewController, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSCoverSheetViewControllerBase registerView:forRole:options:](self, "registerView:forRole:options:", v13, 2, 1);

  }
  -[CSCombinedListViewController _updatePresentation](self, "_updatePresentation");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__updateCaptureOnlyMaterialView, *MEMORY[0x1E0CEB098], 0);
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__liftToWakeGestureDetected, *MEMORY[0x1E0DAC348], 0);
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__lockButtonPressDetected, *MEMORY[0x1E0DAC350], 0);
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__homeButtonPressDetected, *MEMORY[0x1E0DAC358], 0);
  structuredListViewController = self->_structuredListViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_authenticationStatusProvider);
  -[NCNotificationStructuredListViewController setDeviceAuthenticated:](structuredListViewController, "setDeviceAuthenticated:", objc_msgSend(WeakRetained, "isAuthenticated"));

  if (self->_allowsDNDStateService)
  {
    objc_msgSend(MEMORY[0x1E0D1D758], "serviceForClientIdentifier:", CFSTR("com.apple.springboard.SBDashBoardCombinedListViewController"));
    v17 = (DNDStateService *)objc_claimAutoreleasedReturnValue();
    dndStateService = self->_dndStateService;
    self->_dndStateService = v17;

    -[DNDStateService addStateUpdateListener:withCompletionHandler:](self->_dndStateService, "addStateUpdateListener:withCompletionHandler:", self, 0);
    v19 = self->_dndStateService;
    v21[0] = v6;
    v21[1] = 3221225472;
    v21[2] = __43__CSCombinedListViewController_viewDidLoad__block_invoke_3;
    v21[3] = &unk_1E8E2F758;
    v21[4] = self;
    -[DNDStateService queryCurrentStateWithCompletionHandler:](v19, "queryCurrentStateWithCompletionHandler:", v21);
  }
  v20.receiver = self;
  v20.super_class = (Class)CSCombinedListViewController;
  -[CSCoverSheetViewControllerBase viewDidLoad](&v20, sel_viewDidLoad);

}

void __43__CSCombinedListViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(void);

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "_layoutListView");
  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  objc_msgSend(*(id *)(a1 + 32), "_updateCaptureOnlyMaterialView");
  v6[2]();

}

void __43__CSCombinedListViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD);
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
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1552);
  v4 = a2;
  objc_msgSend(v3, "view");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "frameLayoutGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  objc_msgSend(v18, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  objc_msgSend(*(id *)(a1 + 40), "contentLayoutGuide");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 1584);
  *(_QWORD *)(v16 + 1584) = v15;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1584), "setActive:", 1);
  objc_msgSend(v18, "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 32), "_layoutListView");
  v4[2](v4);

}

void __43__CSCombinedListViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__CSCombinedListViewController_viewDidLoad__block_invoke_4;
  v5[3] = &unk_1E8E2DC00;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __43__CSCombinedListViewController_viewDidLoad__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateActiveDNDState:", *(_QWORD *)(a1 + 40));
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSCombinedListViewController;
  -[CSCoverSheetViewControllerBase viewWillLayoutSubviews](&v7, sel_viewWillLayoutSubviews);
  -[CSCombinedListViewController _layoutListView](self, "_layoutListView");
  -[CSCombinedListViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationStructuredListViewController view](self->_structuredListViewController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendSubviewToBack:", v4);

  -[CSCombinedListViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self->_captureOnlyMaterialViewController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendSubviewToBack:", v6);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CSNotificationAdjunctListViewController *adjunctListViewController;
  double v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CSCombinedListViewController;
  -[CSCoverSheetViewControllerBase viewWillAppear:](&v16, sel_viewWillAppear_, a3);
  -[CSCombinedListViewController _updateFaceDetectMonitoring](self, "_updateFaceDetectMonitoring");
  -[CSCombinedListViewController _updateNotificationLongPressProximitySensorAssertion](self, "_updateNotificationLongPressProximitySensorAssertion");
  -[CSCombinedListViewController activeRaiseToListenNotificationRequest](self, "activeRaiseToListenNotificationRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCombinedListViewController _updateRaiseGestureDetectionForNotificationRequest:](self, "_updateRaiseGestureDetectionForNotificationRequest:", v4);

  -[CSCombinedListViewController notificationListScrollView](self, "notificationListScrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CSCombinedListViewController _integratesAdjunctListIntoFullList](self, "_integratesAdjunctListIntoFullList"))
  {
    objc_msgSend(v5, "contentOffset");
    v7 = v6;
    v9 = v8;
    objc_msgSend(v5, "contentInset");
    -[CSCombinedListViewController _sanitizedContentOffset:forContentInset:](self, "_sanitizedContentOffset:forContentInset:", v9, v10, v11, v12, v13);
    if ((BSFloatEqualToFloat() & 1) == 0)
      objc_msgSend(v5, "setContentOffset:animated:", 0, v7, v9);
  }
  -[CSCombinedListViewController _updateQuickActionsVisibilityForScrollView:](self, "_updateQuickActionsVisibilityForScrollView:", v5);
  adjunctListViewController = self->_adjunctListViewController;
  -[CSCombinedListViewController _listViewDefaultContentInsets](self, "_listViewDefaultContentInsets");
  -[CSNotificationAdjunctListViewController setProminentElementHeightToMimic:](adjunctListViewController, "setProminentElementHeightToMimic:", v15 + -8.666666);
  -[CSCombinedListViewController _updateListItemAppearanceState](self, "_updateListItemAppearanceState");
  -[CSCombinedListViewController _updatePresentation](self, "_updatePresentation");
  -[CSCoverSheetViewControllerBase rebuildAppearance](self, "rebuildAppearance");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSCombinedListViewController;
  -[CSCoverSheetViewControllerBase viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  -[CSCombinedListViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sb_coronaAnimationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addParticipant:", self);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  BSAbsoluteMachTimer *significantUserInteractionTimer;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CSCombinedListViewController;
  -[CSCoverSheetViewControllerBase viewWillDisappear:](&v12, sel_viewWillDisappear_);
  if (!self->_listSuppressLongLookDismissal)
    -[NCNotificationStructuredListViewController dismissModalFullScreenAnimated:](self->_structuredListViewController, "dismissModalFullScreenAnimated:", v3);
  -[CSCombinedListViewController _updateFaceDetectMonitoring](self, "_updateFaceDetectMonitoring");
  -[CSCombinedListViewController _updateNotificationLongPressProximitySensorAssertion](self, "_updateNotificationLongPressProximitySensorAssertion");
  -[CSCombinedListViewController activeRaiseToListenNotificationRequest](self, "activeRaiseToListenNotificationRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCombinedListViewController _updateRaiseGestureDetectionForNotificationRequest:](self, "_updateRaiseGestureDetectionForNotificationRequest:", v5);

  v6 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEBUG))
    -[CSCombinedListViewController viewWillDisappear:].cold.1(v6);
  objc_msgSend(MEMORY[0x1E0DA9E90], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeGestureObserver:", self);

  -[BSAbsoluteMachTimer invalidate](self->_significantUserInteractionTimer, "invalidate");
  significantUserInteractionTimer = self->_significantUserInteractionTimer;
  self->_significantUserInteractionTimer = 0;

  -[CSCombinedListViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sb_coronaAnimationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "removeParticipant:", self);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSCombinedListViewController;
  -[CSCoverSheetViewControllerBase viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[CSCombinedListViewController _updateListItemAppearanceState](self, "_updateListItemAppearanceState");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)CSCombinedListViewController;
  v7 = a4;
  -[CSCoverSheetViewControllerBase viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__CSCombinedListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E8E2EEA0;
  v9[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__CSCombinedListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_1E8E2EEA0;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, v8);

}

uint64_t __83__CSCombinedListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePresentation");
}

uint64_t __83__CSCombinedListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePresentation");
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSCombinedListViewController;
  -[CSCombinedListViewController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[CSCombinedListViewController _updateStructuredListOverrideUserInterfaceStyle](self, "_updateStructuredListOverrideUserInterfaceStyle");
}

- (void)aggregateAppearance:(id)a3
{
  id v4;
  void *v5;
  CSComponent *dateViewComponent;
  CSStatusBarComponent *statusBarComponent;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  _QWORD v37[6];

  v37[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CSCombinedListViewController;
  -[CSCoverSheetViewControllerBase aggregateAppearance:](&v35, sel_aggregateAppearance_, v4);
  v5 = (void *)MEMORY[0x1E0C99E60];
  dateViewComponent = self->_dateViewComponent;
  v37[0] = self->_statusBarBackgroundComponent;
  v37[1] = dateViewComponent;
  statusBarComponent = self->_statusBarComponent;
  v37[2] = self->_complicationContainerComponent;
  v37[3] = statusBarComponent;
  v37[4] = self->_proudLockComponent;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CSComponent isHidden](self->_remoteInlineContentComponent, "isHidden"))
  {
    objc_msgSend(v9, "setByAddingObject:", self->_remoteInlineContentComponent);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  if (-[CSComponent isHidden](self->_quickActionsComponent, "isHidden"))
  {
    objc_msgSend(v9, "setByAddingObject:", self->_quickActionsComponent);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  if (self->_homeAffordanceComponent)
  {
    objc_msgSend(v9, "setByAddingObject:");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[NCNotificationStructuredListViewController isOverlayFooterContentVisible](self->_structuredListViewController, "isOverlayFooterContentVisible"))goto LABEL_10;
    v13 = (void *)objc_opt_new();
    -[CSCoverSheetViewControllerBase appearanceIdentifier](self, "appearanceIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "suppressTeachableMomentsAnimation:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setByAddingObject:", v16);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = v13;
  }

  v9 = (void *)v12;
LABEL_10:
  if (self->_footerCallToActionLabelComponent)
  {
    objc_msgSend(v9, "setByAddingObject:");
    v17 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v17;
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v18 = v9;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "setPriority:", 10, (_QWORD)v31);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v20);
  }

  if (-[DNDState sb_isDimmingModeActive](self->_activeDNDState, "sb_isDimmingModeActive"))
  {
    v23 = (void *)objc_opt_new();
    objc_msgSend(v23, "priority:", 10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 7);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "style:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addComponent:", v26);

    CSGetLegibilitySettingsForBackgroundStyle(7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLegibilitySettings:", v27);

  }
  if (-[CSWallpaperFloatingLayerComponent shouldRenderInline](self->_wallpaperFloatingLayerComponent, "shouldRenderInline", (_QWORD)v31))
  {
    objc_msgSend(v18, "setByAddingObject:", self->_wallpaperFloatingLayerComponent);
    v28 = objc_claimAutoreleasedReturnValue();

    v18 = (id)v28;
  }
  objc_msgSend(v4, "components");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setByAddingObjectsFromSet:", v18);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setComponents:", v30);

}

- (void)aggregateBehavior:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSCombinedListViewController;
  -[CSCoverSheetViewControllerBase aggregateBehavior:](&v11, sel_aggregateBehavior_, v4);
  -[CSLockScreenSettings idleTimerSettings](self->_lockScreenSettings, "idleTimerSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "increaseNotificationScrollLogging");

  if (-[CSCombinedListViewController _hasUserInteraction](self, "_hasUserInteraction"))
  {
    if (v6)
    {
      SBLogIdleTimer();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1D0337000, v7, OS_LOG_TYPE_DEFAULT, "[CSCombinedList][AggBehavior] has user interaction - automatic", v10, 2u);
      }

    }
    objc_msgSend(v4, "setIdleTimerDuration:", 10);
    objc_msgSend(v4, "setIdleTimerMode:", 1);
    objc_msgSend(v4, "addRestrictedCapabilities:", 256);
  }
  else if (-[CSCombinedListViewController hasContent](self, "hasContent"))
  {
    if (v6)
    {
      SBLogIdleTimer();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1D0337000, v8, OS_LOG_TYPE_DEFAULT, "[CSCombinedList][AggBehavior] has content", v10, 2u);
      }

    }
    objc_msgSend(v4, "setIdleTimerDuration:", 4);
    objc_msgSend(v4, "removeRestrictedCapabilities:", 256);
  }
  if (v6
    && -[NSMutableSet containsObject:](self->_quickActionsHiddenReasons, "containsObject:", CFSTR("CSQuickActionsScrolledSignificantlyReason")))
  {
    SBLogIdleTimer();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D0337000, v9, OS_LOG_TYPE_DEFAULT, "[CSCombinedList][AggBehavior] has scrolled significantly - noop", v10, 2u);
    }

  }
  if (-[CSCombinedListViewController _disableScrolling](self, "_disableScrolling"))
    objc_msgSend(v4, "setScrollingStrategy:", 3);
  if (self->_dismissGestureDisabled)
    objc_msgSend(v4, "addRestrictedCapabilities:", 4096);
  else
    objc_msgSend(v4, "removeRestrictedCapabilities:", 4096);

}

- (void)rebuildEverythingForReason:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[CSCombinedListViewController _updatePresentation](self, "_updatePresentation");
  v5.receiver = self;
  v5.super_class = (Class)CSCombinedListViewController;
  -[CSCoverSheetViewControllerBase rebuildEverythingForReason:](&v5, sel_rebuildEverythingForReason_, v4);

}

- (void)performCustomTransitionToVisible:(BOOL)a3 withAnimationSettings:(id)a4 completion:(id)a5
{
  if (a5)
    (*((void (**)(id))a5 + 2))(a5);
}

- (CGSize)effectiveContentSizeForScrollView:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGSize result;

  v4 = a3;
  -[CSCombinedListViewController notificationListScrollView](self, "notificationListScrollView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {
    objc_msgSend(v4, "contentSize");
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CSCombinedListViewController;
    -[CSCoverSheetViewControllerBase effectiveContentSizeForScrollView:](&v12, sel_effectiveContentSizeForScrollView_, v4);
  }
  v8 = v6;
  v9 = v7;

  v10 = v8;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)postNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "un_logDigest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v8;
    v19 = 2114;
    v20 = v10;
    v21 = 2114;
    v22 = v12;
    _os_log_impl(&dword_1D0337000, v6, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ posting notification %{public}@ to %{public}@", buf, 0x20u);

  }
  if (self->_dndBedtimeGreetingViewController)
  {
    -[CSCombinedListViewController _dismissDNDBedtimeGreetingViewAnimated:](self, "_dismissDNDBedtimeGreetingViewAnimated:", 1);
    SBLogDoNotDisturbBedtime();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0337000, v13, OS_LOG_TYPE_DEFAULT, "Post notification request dismissed greeting view.", buf, 2u);
    }

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__CSCombinedListViewController_postNotificationRequest___block_invoke;
  v15[3] = &unk_1E8E2DC00;
  v15[4] = self;
  v16 = v4;
  v14 = v4;
  -[CSCombinedListViewController _performSelfCorrectingListViewAction:](self, "_performSelfCorrectingListViewAction:", v15);

}

uint64_t __56__CSCombinedListViewController_postNotificationRequest___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "insertNotificationRequest:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateNotificationListOffsetForExternalUpdate");
  return objc_msgSend(*(id *)(a1 + 32), "_publishVisibleNotificationCountOnContentChange");
}

- (void)updateNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "un_logDigest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v8;
    v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_1D0337000, v6, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ updating notification %{public}@", buf, 0x16u);

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__CSCombinedListViewController_updateNotificationRequest___block_invoke;
  v12[3] = &unk_1E8E2DC00;
  v12[4] = self;
  v13 = v4;
  v11 = v4;
  -[CSCombinedListViewController _performSelfCorrectingListViewAction:](self, "_performSelfCorrectingListViewAction:", v12);

}

uint64_t __58__CSCombinedListViewController_updateNotificationRequest___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "modifyNotificationRequest:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateNotificationListOffsetForExternalUpdate");
  return objc_msgSend(*(id *)(a1 + 32), "_publishVisibleNotificationCountOnContentChange");
}

- (void)withdrawNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "un_logDigest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v8;
    v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_1D0337000, v6, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ withdrawing notification %{public}@", buf, 0x16u);

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__CSCombinedListViewController_withdrawNotificationRequest___block_invoke;
  v12[3] = &unk_1E8E2DC00;
  v12[4] = self;
  v13 = v4;
  v11 = v4;
  -[CSCombinedListViewController _performSelfCorrectingListViewAction:](self, "_performSelfCorrectingListViewAction:", v12);

}

uint64_t __60__CSCombinedListViewController_withdrawNotificationRequest___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "removeNotificationRequest:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateNotificationListOffsetForExternalUpdate");
  return objc_msgSend(*(id *)(a1 + 32), "_publishVisibleNotificationCountOnContentChange");
}

- (void)_updateNotificationListOffsetForExternalUpdate
{
  void *v3;
  _QWORD v4[5];

  -[CSCombinedListViewController notificationListScrollView](self, "notificationListScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CSCombinedListViewController _shouldPadBottomSpacing](self, "_shouldPadBottomSpacing"))
  {
    if (!-[CSCombinedListViewController _integratesAdjunctListIntoFullList](self, "_integratesAdjunctListIntoFullList"))
    {
      objc_msgSend(v3, "contentOffset");
      -[CSCombinedListViewController defaultRestingOffsetExcludingAdjunct](self, "defaultRestingOffsetExcludingAdjunct");
      CSAdjustTargetContentOffset(v3);
      objc_msgSend(v3, "setContentOffset:animated:", 1);
    }
  }
  else
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __78__CSCombinedListViewController__updateNotificationListOffsetForExternalUpdate__block_invoke;
    v4[3] = &unk_1E8E2DB38;
    v4[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingDefaultTimingWithOptions:animations:completion:", 2, v4, 0);
  }

}

void __78__CSCombinedListViewController__updateNotificationListOffsetForExternalUpdate__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "notificationListScrollView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_scrollToTopIfPossible:", 0);

}

- (void)updateNotificationSystemSettings:(id)a3 previousSystemSettings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_1D0337000, v9, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ updating notification system settings", (uint8_t *)&v12, 0xCu);

  }
  -[NCNotificationStructuredListViewController updateNotificationSystemSettings:previousSystemSettings:](self->_structuredListViewController, "updateNotificationSystemSettings:previousSystemSettings:", v6, v7);

}

- (void)applicationInformer:(id)a3 updatedApplications:(id)a4
{
  -[CSCombinedListViewController _screenTimeExpirationApplicationsDidChange:](self, "_screenTimeExpirationApplicationsDidChange:", a4);
}

- (id)groupNameBaseForAdjunctListViewController:(id)a3
{
  return (id)-[NCNotificationStructuredListViewController backgroundGroupNameBase](self->_structuredListViewController, "backgroundGroupNameBase", a3);
}

- (CGSize)sizeToMimicForAdjunctListViewController:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[NCNotificationStructuredListViewController view](self->_structuredListViewController, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (UIEdgeInsets)insetMarginsToMimicForAdjunctListViewController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  -[NCNotificationStructuredListViewController insetMargins](self->_structuredListViewController, "insetMargins", a3);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)interItemSpacingToMimicForAdjunctListViewController:(id)a3
{
  double result;

  -[NCNotificationStructuredListViewController itemSpacing](self->_structuredListViewController, "itemSpacing", a3);
  return result;
}

- (void)adjunctListViewController:(id)a3 didUpdateWithSize:(CGSize)a4
{
  CGFloat height;
  int v6;
  _BOOL4 v7;
  double v8;
  double v9;

  if (self->_adjunctListViewController == a3)
  {
    height = a4.height;
    v6 = -[NCNotificationStructuredListViewController hasVisibleContent](self->_structuredListViewController, "hasVisibleContent", a4.width);
    v7 = -[CSCombinedListViewController _allowsSeparateAdjunctList](self, "_allowsSeparateAdjunctList");
    if (v7)
      v7 = -[CSNotificationAdjunctListViewController isPresentingTransientContent](self->_adjunctListViewController, "isPresentingTransientContent");
    -[CSCombinedListViewController _setListHasContent:](self, "_setListHasContent:", v6 | v7);
    -[CSCombinedListViewController _adjunctListViewSizeIncludingSpacing](self, "_adjunctListViewSizeIncludingSpacing");
    v9 = v8;
    if (!-[CSCombinedListViewController _allowsSeparateAdjunctList](self, "_allowsSeparateAdjunctList"))
      height = v9;
    if ((BSFloatEqualToFloat() & 1) == 0)
    {
      self->_cachedAdjunctHeight = height;
      -[CSCombinedListViewController _updateListViewContentInset](self, "_updateListViewContentInset");
      -[CSCombinedListViewController _updatePresentation](self, "_updatePresentation");
    }
  }
}

- (void)adjunctListViewController:(id)a3 didAddSectionWithIdentifier:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *supplementaryItemContainersByIdentifier;
  NSMutableDictionary *v9;
  NSMutableDictionary *adjunctViewControllersByIdentifier;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CSNotificationAdjunctListViewController *v16;

  v16 = (CSNotificationAdjunctListViewController *)a3;
  v6 = a4;
  if (self->_adjunctListViewController == v16)
  {
    if (!self->_supplementaryItemContainersByIdentifier)
    {
      v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      supplementaryItemContainersByIdentifier = self->_supplementaryItemContainersByIdentifier;
      self->_supplementaryItemContainersByIdentifier = v7;

    }
    if (!self->_adjunctViewControllersByIdentifier)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      adjunctViewControllersByIdentifier = self->_adjunctViewControllersByIdentifier;
      self->_adjunctViewControllersByIdentifier = v9;

    }
    if (!-[CSCombinedListViewController _allowsSeparateAdjunctList](self, "_allowsSeparateAdjunctList"))
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_supplementaryItemContainersByIdentifier, "objectForKeyedSubscript:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CoverSheet supplementary items - %@"), v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationStructuredListViewController insertSupplementaryViewsContainerAtListPosition:identifier:withDescription:](self->_structuredListViewController, "insertSupplementaryViewsContainerAtListPosition:identifier:withDescription:", 1, v6, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setSupplementaryContainerDelegate:", v16);
        -[CSNotificationAdjunctListViewController itemsGroupSortComparatorForListSectionIdentifier:](v16, "itemsGroupSortComparatorForListSectionIdentifier:", v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setGroupSortComparator:", v14);

        -[CSNotificationAdjunctListViewController itemsViewControllerSortComparatorForListSectionIdentifier:](v16, "itemsViewControllerSortComparatorForListSectionIdentifier:", v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setViewControllerSortComparator:", v15);

        -[NSMutableDictionary setObject:forKey:](self->_supplementaryItemContainersByIdentifier, "setObject:forKey:", v13, v6);
      }
    }
  }

}

- (void)adjunctListViewController:(id)a3 didAddViewController:(id)a4 withIdentifier:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  const __CFString *v12;
  void *v13;
  id v14;
  id v15;

  v15 = a4;
  v8 = a5;
  if (self->_adjunctListViewController == a3)
  {
    -[NSMutableDictionary objectForKey:](self->_supplementaryItemContainersByIdentifier, "objectForKey:", CFSTR("AdjunctTopSticky"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_adjunctViewControllersByIdentifier, "setObject:forKey:", v15, v8);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v8;
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.SpringBoard.prominentUI")))
      v12 = CFSTR("PROMINENT_NOTIFICATION_GROUP_NAME");
    else
      v12 = CFSTR("SLEEP_NOTIFICATION_GROUP_NAME");
    objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_1E8E30B28, CFSTR("CoverSheet"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(MEMORY[0x1E0DC6168]);
    objc_msgSend(v14, "setGroupName:", v13);
    objc_msgSend(v14, "setGroupingIdentifier:", v11);

    objc_msgSend(v14, "setMaterialRecipe:", 0);
    objc_msgSend(v14, "setPreventsUserDismissal:", 1);
    objc_msgSend(v9, "insertSupplementaryViewController:withConfiguration:", v15, v14);

  }
}

- (void)adjunctListViewController:(id)a3 willRemoveViewWithIdentifier:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_adjunctListViewController == a3)
  {
    SBLogDashBoard();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = v6;
      _os_log_impl(&dword_1D0337000, v7, OS_LOG_TYPE_DEFAULT, "Removing adjunct with identifier: %{public}@ from notification list", (uint8_t *)&v10, 0xCu);
    }

    -[NSMutableDictionary objectForKey:](self->_supplementaryItemContainersByIdentifier, "objectForKey:", CFSTR("AdjunctTopSticky"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_adjunctViewControllersByIdentifier, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v8, "removeSupplementaryViewController:", v9);

  }
}

- (void)focusActivityViewChangedToVisible:(BOOL)a3
{
  -[CSCombinedListViewController setShowingFocusActivityView:](self, "setShowingFocusActivityView:", a3);
  -[CSCombinedListViewController layoutListView](self, "layoutListView");
}

- (void)adjunctListViewController:(id)a3 updatedNowPlayingVisbility:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[CSCombinedListViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "combinedListViewController:isShowingMediaControls:", self, v4);

}

- (void)itemManager:(id)a3 insertSection:(id)a4
{
  void *v6;
  NSMutableDictionary *supplementaryItemContainersByIdentifier;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(a4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  supplementaryItemContainersByIdentifier = self->_supplementaryItemContainersByIdentifier;
  if (!supplementaryItemContainersByIdentifier)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_supplementaryItemContainersByIdentifier;
    self->_supplementaryItemContainersByIdentifier = v8;

    supplementaryItemContainersByIdentifier = self->_supplementaryItemContainersByIdentifier;
  }
  -[NSMutableDictionary objectForKey:](supplementaryItemContainersByIdentifier, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CoverSheet supplementary items - %@"), v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationStructuredListViewController insertSupplementaryViewsContainerAtListPosition:identifier:withDescription:](self->_structuredListViewController, "insertSupplementaryViewsContainerAtListPosition:identifier:withDescription:", 0, v6, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSupplementaryContainerDelegate:", v15);
    objc_msgSend(v15, "itemsGroupSortComparatorForListSectionIdentifier:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setGroupSortComparator:", v13);

    objc_msgSend(v15, "itemsViewControllerSortComparatorForListSectionIdentifier:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setViewControllerSortComparator:", v14);

    -[NSMutableDictionary setObject:forKey:](self->_supplementaryItemContainersByIdentifier, "setObject:forKey:", v12, v6);
  }

}

- (void)itemManager:(id)a3 insertItem:(id)a4
{
  id v6;
  NSObject *v7;
  NSMutableDictionary *supplementaryItemContainersByIdentifier;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_supplementaryItemManager == a3)
  {
    SBLogDashBoard();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138543362;
      v19 = v6;
      _os_log_impl(&dword_1D0337000, v7, OS_LOG_TYPE_DEFAULT, "Inserting supplementary item: %{public}@ into notification list", (uint8_t *)&v18, 0xCu);
    }

    supplementaryItemContainersByIdentifier = self->_supplementaryItemContainersByIdentifier;
    objc_msgSend(v6, "sectionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](supplementaryItemContainersByIdentifier, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "contentHost");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v11, "setScreenOn:", self->_screenOn);
    objc_msgSend(v6, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertSupplementaryViewController:withConfiguration:", v11, v12);

    -[CSCombinedListViewController _noteListContentsPotentiallyChanged](self, "_noteListContentsPotentiallyChanged");
    v13 = -[CSCombinedListViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v11, "setListAppeared:", v13);
    objc_opt_self();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v11;
    if (v14)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
    }
    else
    {
      v16 = 0;
    }
    v17 = v16;

    objc_msgSend(v17, "setDelegate:", self);
    if ((_DWORD)v13 && -[CSCombinedListViewController _isScreenOn](self, "_isScreenOn"))
      objc_msgSend(v17, "setPresentationMode:", 1);

  }
}

- (void)itemManager:(id)a3 updateItem:(id)a4
{
  id v6;
  NSObject *v7;
  NSMutableDictionary *supplementaryItemContainersByIdentifier;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_supplementaryItemManager == a3)
  {
    SBLogDashBoard();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_impl(&dword_1D0337000, v7, OS_LOG_TYPE_DEFAULT, "Updating supplementary item: %@ in notification list", (uint8_t *)&v14, 0xCu);
    }

    supplementaryItemContainersByIdentifier = self->_supplementaryItemContainersByIdentifier;
    objc_msgSend(v6, "sectionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](supplementaryItemContainersByIdentifier, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "contentHost");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateSupplementaryViewController:withConfiguration:", v11, v12);

    objc_msgSend(v6, "contentHost");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updatePositionIfNeededForSupplementaryViewController:", v13);

    -[CSCombinedListViewController _noteListContentsPotentiallyChanged](self, "_noteListContentsPotentiallyChanged");
  }

}

- (void)itemManager:(id)a3 removeItem:(id)a4
{
  id v6;
  NSObject *v7;
  NSMutableDictionary *supplementaryItemContainersByIdentifier;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_supplementaryItemManager == a3)
  {
    SBLogDashBoard();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = v6;
      _os_log_impl(&dword_1D0337000, v7, OS_LOG_TYPE_DEFAULT, "Removing supplementary item from: %{public}@ into notification list", (uint8_t *)&v12, 0xCu);
    }

    supplementaryItemContainersByIdentifier = self->_supplementaryItemContainersByIdentifier;
    objc_msgSend(v6, "sectionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](supplementaryItemContainersByIdentifier, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "contentHost");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeSupplementaryViewController:", v11);

    -[CSCombinedListViewController _noteListContentsPotentiallyChanged](self, "_noteListContentsPotentiallyChanged");
  }

}

- (void)itemManager:(id)a3 requestsModalPresentationOfViewController:(id)a4 forItem:(id)a5 animated:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v7;
  NSMutableDictionary *supplementaryItemContainersByIdentifier;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v7 = a6;
  supplementaryItemContainersByIdentifier = self->_supplementaryItemContainersByIdentifier;
  v11 = a7;
  v12 = a5;
  v13 = a4;
  objc_msgSend(v12, "sectionIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](supplementaryItemContainersByIdentifier, "objectForKey:", v14);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "contentHost");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "presentViewControllerModally:fromSupplementaryViewController:animated:completion:", v13, v15, v7, v11);
}

- (CGSize)sizeToMimicForItemContentHost
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[NCNotificationStructuredListViewController view](self->_structuredListViewController, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)itemManager:(id)a3 setNowPlayingItem:(id)a4
{
  _BOOL8 v5;
  id v6;

  v5 = a4 != 0;
  -[CSCombinedListViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "combinedListViewController:isShowingMediaControls:", self, v5);

}

- (void)itemManager:(id)a3 requestsAuthenticationAndPerformBlock:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__CSCombinedListViewController_itemManager_requestsAuthenticationAndPerformBlock___block_invoke;
  v7[3] = &unk_1E8E2DFA8;
  v8 = v5;
  v6 = v5;
  -[CSCombinedListViewController _requestAuthenticationWithCompletion:](self, "_requestAuthenticationWithCompletion:", v7);

}

uint64_t __82__CSCombinedListViewController_itemManager_requestsAuthenticationAndPerformBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)itemManager:(id)a3 cancelTouchesForInteractionWithItem:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CSCombinedListViewController coverSheetGestureHandling](self, "coverSheetGestureHandling", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v9, "contentRequestCancellingGesture");
  -[NCNotificationStructuredListViewController scrollView](self->_structuredListViewController, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "panGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", 0);

  -[NCNotificationStructuredListViewController scrollView](self->_structuredListViewController, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "panGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", 1);

}

- (void)itemManager:(id)a3 significantUserInteractionBeganWithItem:(id)a4
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  SBLogCoverSheetActivities();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v7, 0xCu);

  }
  -[CSCombinedListViewController _triggerSignificantUserInteractionIfNeeded](self, "_triggerSignificantUserInteractionIfNeeded");
}

- (void)itemManager:(id)a3 significantUserInteractionEndedWithItem:(id)a4
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  SBLogCoverSheetActivities();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v7, 0xCu);

  }
  -[CSCombinedListViewController _triggerSignificantUserInteractionIfNeeded](self, "_triggerSignificantUserInteractionIfNeeded");
}

- (void)itemManagerDidAddNewSceneHostEnvironment
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;

  -[CSCombinedListViewController activityItemObserver](self, "activityItemObserver");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v5 = (void *)v2;
    v4 = objc_opt_respondsToSelector();
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "didAddNewActivityItemSceneHostEnvironment");
      v3 = v5;
    }
  }

}

- (BOOL)isNotificationContentExtensionVisible:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[NCNotificationStructuredListViewController hasVisibleContent](self->_structuredListViewController, "hasVisibleContent"))v5 = -[NCNotificationStructuredListViewController isContentExtensionVisible:](self->_structuredListViewController, "isContentExtensionVisible:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)isPresentingNotificationInLongLook
{
  int v3;

  v3 = -[NCNotificationStructuredListViewController hasVisibleContent](self->_structuredListViewController, "hasVisibleContent");
  if (v3)
    LOBYTE(v3) = -[NCNotificationStructuredListViewController isPresentingNotificationInLongLook](self->_structuredListViewController, "isPresentingNotificationInLongLook");
  return v3;
}

- (BOOL)dismissNotificationInLongLookAnimated:(BOOL)a3
{
  _BOOL8 v3;
  int v5;

  v3 = a3;
  v5 = -[NCNotificationStructuredListViewController hasVisibleContent](self->_structuredListViewController, "hasVisibleContent");
  if (v5)
    LOBYTE(v5) = -[NCNotificationStructuredListViewController dismissModalFullScreenAnimated:](self->_structuredListViewController, "dismissModalFullScreenAnimated:", v3);
  return v5;
}

- (void)notificationStructuredListViewController:(id)a3 requestPermissionToExecuteAction:(id)a4 forNotificationRequest:(id)a5 withParameters:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v11 = a7;
  self->_listSuppressLongLookDismissal = 1;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  -[CSCombinedListViewController dispatcher](self, "dispatcher");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __155__CSCombinedListViewController_notificationStructuredListViewController_requestPermissionToExecuteAction_forNotificationRequest_withParameters_completion___block_invoke;
  v17[3] = &unk_1E8E2E5A0;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "destination:requestPermissionToExecuteAction:forNotificationRequest:withParameters:completion:", self, v14, v13, v12, v17);

}

uint64_t __155__CSCombinedListViewController_notificationStructuredListViewController_requestPermissionToExecuteAction_forNotificationRequest_withParameters_completion___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1112) = 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)notificationStructuredListViewController:(id)a3 requestsExecuteAction:(id)a4 forNotificationRequest:(id)a5 requestAuthentication:(BOOL)a6 withParameters:(id)a7 completion:(id)a8
{
  _BOOL8 v9;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;

  v9 = a6;
  v13 = a8;
  self->_listSuppressLongLookDismissal = 1;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  -[CSCombinedListViewController dispatcher](self, "dispatcher");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __166__CSCombinedListViewController_notificationStructuredListViewController_requestsExecuteAction_forNotificationRequest_requestAuthentication_withParameters_completion___block_invoke;
  v19[3] = &unk_1E8E2E5A0;
  v19[4] = self;
  v20 = v13;
  v18 = v13;
  objc_msgSend(v17, "destination:performAction:forNotificationRequest:requestAuthentication:withParameters:completion:", self, v16, v15, v9, v14, v19);

}

uint64_t __166__CSCombinedListViewController_notificationStructuredListViewController_requestsExecuteAction_forNotificationRequest_requestAuthentication_withParameters_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1112) = 0;
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)notificationStructuredListViewController:(id)a3 containerViewProviderForExpandedContentForViewController:(id)a4
{
  UIView *v5;
  int v6;
  id v7;
  os_log_t *v8;
  NSObject *v9;
  NSHashTable *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  UIView *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  UIView *v27;
  UIView *containerViewForExpandedNotificationContent;
  void *v29;
  NSObject *v30;
  UIView *v31;
  NSHashTable *v32;
  NSHashTable *notificationContainerViewAssertions;
  id v34;
  UIView *v35;
  _QWORD v37[5];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  UIView *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = (UIView *)a4;
  v6 = -[CSCombinedListViewController isViewLoaded](self, "isViewLoaded");
  v7 = 0;
  if (v5 && v6)
  {
    v8 = (os_log_t *)MEMORY[0x1E0DC5F70];
    v9 = *MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v44 = v5;
      _os_log_impl(&dword_1D0337000, v9, OS_LOG_TYPE_DEFAULT, "Notification structured list view controller requesting container view for view controller: %{public}@", buf, 0xCu);
    }
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v10 = self->_notificationContainerViewAssertions;
    v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v39;
LABEL_7:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v39 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v14);
        objc_msgSend(v15, "requester");
        v16 = (UIView *)objc_claimAutoreleasedReturnValue();

        if (v16 == v5)
          break;
        if (v12 == ++v14)
        {
          v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
          if (v12)
            goto LABEL_7;
          goto LABEL_13;
        }
      }
      v7 = v15;

      if (v7)
        goto LABEL_22;
    }
    else
    {
LABEL_13:

    }
    if (!self->_containerViewForExpandedNotificationContent)
    {
      -[CSCombinedListViewController view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "superview");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "frame");
      objc_msgSend(v18, "convertRect:toView:", 0);
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;

      v27 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9F28]), "initWithFrame:", v20, v22, v24, v26);
      containerViewForExpandedNotificationContent = self->_containerViewForExpandedNotificationContent;
      self->_containerViewForExpandedNotificationContent = v27;

      -[UIView setAutoresizingMask:](self->_containerViewForExpandedNotificationContent, "setAutoresizingMask:", 18);
      objc_msgSend(v17, "window");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addSubview:", self->_containerViewForExpandedNotificationContent);

      v30 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        v31 = self->_containerViewForExpandedNotificationContent;
        *(_DWORD *)buf = 138543362;
        v44 = v31;
        _os_log_impl(&dword_1D0337000, v30, OS_LOG_TYPE_DEFAULT, "Instantiated new container view for expanded notification content: %{public}@", buf, 0xCu);
      }

    }
    if (!self->_notificationContainerViewAssertions)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v32 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      notificationContainerViewAssertions = self->_notificationContainerViewAssertions;
      self->_notificationContainerViewAssertions = v32;

    }
    v34 = objc_alloc(MEMORY[0x1E0DAC288]);
    v35 = self->_containerViewForExpandedNotificationContent;
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __130__CSCombinedListViewController_notificationStructuredListViewController_containerViewProviderForExpandedContentForViewController___block_invoke;
    v37[3] = &unk_1E8E2F780;
    v37[4] = self;
    v7 = (id)objc_msgSend(v34, "initWithRequester:containerView:reason:invalidationBlock:", v5, v35, CFSTR("Container view requested for notification view controller"), v37);
    -[NSHashTable addObject:](self->_notificationContainerViewAssertions, "addObject:", v7);
  }
LABEL_22:

  return v7;
}

uint64_t __130__CSCombinedListViewController_notificationStructuredListViewController_containerViewProviderForExpandedContentForViewController___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "removeObject:", a2);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "count");
  if (!result)
    return objc_msgSend(*(id *)(a1 + 32), "_tearDownContainerViewForExpandedNotificationContent");
  return result;
}

- (void)notificationStructuredListViewController:(id)a3 shouldFinishLongLookTransitionForNotificationRequest:(id)a4 trigger:(int64_t)a5 withCompletionBlock:(id)a6
{
  id v8;
  void (**v9)(id, uint64_t);
  id WeakRetained;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  int v19;
  _BOOL4 coverSheetWasDismissed;
  int v21;
  void *v22;
  uint64_t v23;
  BOOL v25;
  int v26;
  int v27;
  os_log_t *v28;
  void *v29;
  id v30;
  void (**v31)(id, uint64_t);
  _BOOL4 v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  os_log_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  _BOOL4 historyWasRevealed;
  _BOOL4 v43;
  int v44;
  _BOOL4 v45;
  _BOOL4 v46;
  uint64_t v47;
  int v49;
  void *v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  _BYTE v54[10];
  _BYTE v55[6];
  _BOOL4 v56;
  __int16 v57;
  _BOOL4 v58;
  __int16 v59;
  _BOOL4 v60;
  __int16 v61;
  _BOOL4 v62;
  __int16 v63;
  _BOOL4 v64;
  __int16 v65;
  int v66;
  __int16 v67;
  _BOOL4 v68;
  __int16 v69;
  int v70;
  __int16 v71;
  int v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_authenticationStatusProvider);
  objc_msgSend(MEMORY[0x1E0DA9FB8], "standardDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v11, "alwaysAllowLongLookGesture");

  -[CSCoverSheetViewControllerBase activeBehavior](self, "activeBehavior");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "areRestrictedCapabilities:", 0x20000);

  v14 = objc_msgSend(WeakRetained, "hasAuthenticatedAtLeastOnceSinceBoot");
  v15 = -[SBUIBiometricResource hasBiometricAuthenticationCapabilityEnabled](self->_biometricResource, "hasBiometricAuthenticationCapabilityEnabled");
  v43 = -[CSUserPresenceMonitor isDetectionEnabled](self->_userPresenceMonitor, "isDetectionEnabled");
  objc_msgSend(v8, "defaultAction");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = v8;
  objc_msgSend(v8, "options");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v17, "contentPreviewSetting");
  v18 = v47 == 0;

  v19 = objc_msgSend(WeakRetained, "isAuthenticated");
  v46 = -[CSUserPresenceMonitor userPresenceDetectedSinceWake](self->_userPresenceMonitor, "userPresenceDetectedSinceWake");
  v45 = self->_hasProximitySensor && !self->_proximitySensorCoveredSinceWake;
  coverSheetWasDismissed = self->_coverSheetWasDismissed;
  historyWasRevealed = self->_historyWasRevealed;
  v49 = v19;
  if (((v13 | v14 ^ 1) & 1) != 0)
  {
    v21 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "userInterfaceIdiom");

    v25 = (a5 & 0xFFFFFFFFFFFFFFFELL) != 2 && (v23 & 0xFFFFFFFFFFFFFFFBLL) != 1 && !coverSheetWasDismissed;
    v26 = v46;
    if (!v25)
      v26 = 1;
    if (v47)
      v27 = v15;
    else
      v27 = 0;
    v21 = v26 | v27 | v19 | v45;
  }
  v28 = (os_log_t *)MEMORY[0x1E0DC5F70];
  v29 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v30 = WeakRetained;
    v31 = v9;
    v32 = v16 != 0;
    v33 = v29;
    NCStringFromLongLookPresentationTrigger();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "notificationIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "un_logDigest");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138546178;
    v52 = v34;
    v53 = 2114;
    *(_QWORD *)v54 = v36;
    *(_WORD *)&v54[8] = 1024;
    *(_DWORD *)v55 = coverSheetWasDismissed;
    *(_WORD *)&v55[4] = 1024;
    v56 = historyWasRevealed;
    v57 = 1024;
    v58 = v43;
    v59 = 1024;
    v60 = v46;
    v61 = 1024;
    v62 = v32;
    v9 = v31;
    WeakRetained = v30;
    v18 = v47 == 0;
    v63 = 1024;
    v64 = v18;
    v65 = 1024;
    v66 = v49;
    v67 = 1024;
    v68 = v45;
    v69 = 1024;
    v70 = v44;
    v71 = 1024;
    v72 = v21;
    _os_log_impl(&dword_1D0337000, v33, OS_LOG_TYPE_DEFAULT, "[Notification Long Press Gesture] Should finish long look transition via %{public}@ for notification %{public}@: [ pulled-down: %{BOOL}d revealed-history: %{BOOL}d face-detecting: %{BOOL}d face-detected: %{BOOL}d default-action: %{BOOL}d content-preview-always: %{BOO}d authenticated: %{BOOL}d proximity-uncovered-after-wake: %{BOOL}d override: %{BOOL}d ]: %{BOOL}d", buf, 0x52u);

    v28 = (os_log_t *)MEMORY[0x1E0DC5F70];
  }
  if (v21)
  {
    if (v47)
      v37 = v49;
    else
      v37 = 1;
    v38 = *v28;
    if (os_log_type_enabled(*v28, OS_LOG_TYPE_DEFAULT))
    {
      v39 = v38;
      objc_msgSend(v50, "notificationIdentifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "un_logDigest");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v52 = v41;
      v53 = 1024;
      *(_DWORD *)v54 = v49;
      *(_WORD *)&v54[4] = 1024;
      *(_DWORD *)&v54[6] = v18;
      *(_WORD *)v55 = 1024;
      *(_DWORD *)&v55[2] = v37 ^ 1;
      _os_log_impl(&dword_1D0337000, v39, OS_LOG_TYPE_DEFAULT, "[Notification Long Press Gesture] Should request authentication for notification %{public}@: [ authenticated: %{BOOL}d content-preview-always: %{BOOL}d]: %{BOOL}d", buf, 0x1Eu);

    }
    if ((v37 & 1) != 0)
    {
      v9[2](v9, 1);
    }
    else
    {
      self->_confirmedNotInPocket = 1;
      -[CSCombinedListViewController _requestAuthenticationWithCompletion:](self, "_requestAuthenticationWithCompletion:", v9);
    }
  }
  else if (v9)
  {
    v9[2](v9, 0);
  }

}

- (Class)notificationStructuredListViewControllerNotificationViewControllerClass:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)notificationStructuredListViewControllerDidSignificantUserInteraction:(id)a3
{
  NSObject *v5;

  SBLogDashBoard();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CSCombinedListViewController notificationStructuredListViewControllerDidSignificantUserInteraction:].cold.1((uint64_t)self, (uint64_t)a2, v5);

  -[CSCombinedListViewController _triggerSignificantUserInteractionIfNeeded](self, "_triggerSignificantUserInteractionIfNeeded");
  self->_interactingWithNotificationList = 1;
}

- (void)notificationStructuredListViewControllerDidBeginUserInteraction:(id)a3
{
  -[CSCombinedListViewController _setHasUserInteraction:forReason:](self, "_setHasUserInteraction:forReason:", 1, CFSTR("NotificationInteraction"));
  -[CSCoverSheetViewControllerBase rebuildBehavior](self, "rebuildBehavior");
}

- (void)notificationStructuredListViewControllerDidEndUserInteraction:(id)a3
{
  -[CSCombinedListViewController _setHasUserInteraction:forReason:](self, "_setHasUserInteraction:forReason:", 0, CFSTR("NotificationInteraction"));
  -[CSCoverSheetViewControllerBase rebuildBehavior](self, "rebuildBehavior");
}

- (void)notificationStructuredListViewControllerDidUpdateVisibleContentExtent:(id)a3
{
  void *v4;
  int v5;
  int v6;
  _BOOL4 listBeingLaidOut;
  NSObject *v8;
  NSObject *v9;
  _DWORD v10[2];
  __int16 v11;
  int v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[CSCombinedListViewController notificationListScrollView](self, "notificationListScrollView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isDragging") & 1) != 0 || (objc_msgSend(v4, "isDecelerating") & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isScrollAnimating");
  v6 = objc_msgSend(MEMORY[0x1E0CEABB0], "_isInAnimationBlock");
  listBeingLaidOut = self->_listBeingLaidOut;
  SBLogDashBoard();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v6 & 1) != 0 || (v5 & 1) != 0 || listBeingLaidOut)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67240704;
      v10[1] = v6;
      v11 = 1026;
      v12 = v5;
      v13 = 1026;
      v14 = listBeingLaidOut;
      _os_log_impl(&dword_1D0337000, v9, OS_LOG_TYPE_DEFAULT, "Early exiting notificationStructuredListViewControllerDidUpdateVisibleContentExtent. isInAnimationBlock: %{public}d. isScrolling: %{public}d. _listBeingLaidOut: %{public}d", (uint8_t *)v10, 0x14u);
    }

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CSCombinedListViewController notificationStructuredListViewControllerDidUpdateVisibleContentExtent:].cold.1(v9);

    -[CSCombinedListViewController _updatePresentation](self, "_updatePresentation");
  }

}

- (void)notificationStructuredListViewController:(id)a3 didBeginUserInteractionWithViewController:(id)a4
{
  -[CSStatusBarComponent setFakeStatusBar:](self->_statusBarComponent, "setFakeStatusBar:", 1, a4);
  -[CSStatusBarComponent setFakeStatusBarLevel:](self->_statusBarComponent, "setFakeStatusBarLevel:", &unk_1E8E8A420);
  -[CSCoverSheetViewControllerBase rebuildAppearance](self, "rebuildAppearance");
  -[CSCombinedListViewController _setHasUserInteraction:forReason:](self, "_setHasUserInteraction:forReason:", 1, CFSTR("NotificationInteraction"));
}

- (void)notificationStructuredListViewController:(id)a3 didEndUserInteractionWithViewController:(id)a4
{
  -[CSStatusBarComponent setFakeStatusBar:](self->_statusBarComponent, "setFakeStatusBar:", 0, a4);
  -[CSStatusBarComponent setFakeStatusBarLevel:](self->_statusBarComponent, "setFakeStatusBarLevel:", 0);
  -[CSCoverSheetViewControllerBase rebuildAppearance](self, "rebuildAppearance");
  -[CSCombinedListViewController _setHasUserInteraction:forReason:](self, "_setHasUserInteraction:forReason:", 0, CFSTR("NotificationInteraction"));
}

- (void)notificationStructuredListViewControllerWillExpandNotificationListCount:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "combinedListViewControllerWillExpandNotificationListCount:", self);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  CSScrollablePageViewControllerProtocol **p_scrollablePage;
  id v5;
  id WeakRetained;

  p_scrollablePage = &self->_scrollablePage;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_scrollablePage);
  objc_msgSend(WeakRetained, "scrollViewWillBeginDragging:", v5);

  self->_shouldPadBottomSpacingWhileDragging = -[CSCombinedListViewController _shouldPadBottomSpacingIsDragging:](self, "_shouldPadBottomSpacingIsDragging:", 0);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  id v10;
  id WeakRetained;
  NSObject *v12;
  CGFloat v13;
  CGFloat v14;

  y = a4.y;
  x = a4.x;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollablePage);
  objc_msgSend(WeakRetained, "scrollViewWillEndDragging:withVelocity:", v10, x, y);

  if (!self->_listBeingLaidOut)
  {
    SBLogDashBoard();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[CSCombinedListViewController notificationStructuredListViewControllerDidSignificantUserInteraction:].cold.1((uint64_t)self, (uint64_t)a2, v12);

    if (-[CSCombinedListViewController _allowsDateViewOrProudLockScroll](self, "_allowsDateViewOrProudLockScroll")
      && !-[CSCombinedListViewController _integratesAdjunctListIntoFullList](self, "_integratesAdjunctListIntoFullList"))
    {
      -[CSCombinedListViewController defaultRestingOffsetExcludingAdjunct](self, "defaultRestingOffsetExcludingAdjunct");
      CSAdjustTargetContentOffset(v10);
      a5->x = v13;
      a5->y = v14;
    }
  }

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[CSCombinedListViewController _snapScrollView:toAcceptableOffsetAnimated:](self, "_snapScrollView:toAcceptableOffsetAnimated:", a3, 1);
}

- (void)_snapToAcceptableOffsetForScrollView:(id)a3
{
  -[CSCombinedListViewController _snapScrollView:toAcceptableOffsetAnimated:](self, "_snapScrollView:toAcceptableOffsetAnimated:", a3, 0);
}

- (void)_snapScrollView:(id)a3 toAcceptableOffsetAnimated:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v4 = a4;
  v10 = a3;
  if (!-[CSCombinedListViewController _integratesAdjunctListIntoFullList](self, "_integratesAdjunctListIntoFullList"))
  {
    objc_msgSend(v10, "contentOffset");
    -[CSCombinedListViewController defaultRestingOffsetExcludingAdjunct](self, "defaultRestingOffsetExcludingAdjunct");
    CSAdjustTargetContentOffset(v10);
    v7 = v6;
    v9 = v8;
    objc_msgSend(v10, "contentOffset");
    if ((BSPointEqualToPoint() & 1) == 0)
      objc_msgSend(v10, "setContentOffset:animated:", v4, v7, v9);
  }

}

- (double)defaultRestingOffsetExcludingAdjunct
{
  double v3;

  -[CSCombinedListViewController clippingOffset](self, "clippingOffset");
  return v3 - self->_cachedAdjunctHeight;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  int v8;
  _BOOL8 v9;
  void *v10;
  int v11;
  NSObject *v12;
  const char *v13;
  uint8_t *v14;
  _BOOL8 v15;
  uint64_t v17;
  uint8_t buf[2];

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollablePage);
  objc_msgSend(WeakRetained, "scrollViewDidScroll:", v5);

  if (self->_listBeingLaidOut)
    goto LABEL_21;
  SBLogDashBoard();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CSCombinedListViewController notificationStructuredListViewControllerDidSignificantUserInteraction:].cold.1((uint64_t)self, (uint64_t)a2, v7);

  -[CSCombinedListViewController _updatePresentation](self, "_updatePresentation");
  v8 = -[NSMutableSet containsObject:](self->_quickActionsHiddenReasons, "containsObject:", CFSTR("CSQuickActionsScrolledSignificantlyReason"));
  v9 = -[CSCombinedListViewController _hasExperiencedSignificantScrollingOnScrollView:](self, "_hasExperiencedSignificantScrollingOnScrollView:", v5);
  -[CSLockScreenSettings idleTimerSettings](self->_lockScreenSettings, "idleTimerSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "increaseNotificationScrollLogging");

  if (v11)
  {
    if (!(!v9 | v8))
    {
      SBLogIdleTimer();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v13 = "Switching to scrolling significantly";
        v14 = buf;
        goto LABEL_11;
      }
LABEL_12:

      goto LABEL_13;
    }
    if (!(v9 | v8 ^ 1u))
    {
      SBLogIdleTimer();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        v13 = "No longer scrolling significantly";
        v14 = (uint8_t *)&v17;
LABEL_11:
        _os_log_impl(&dword_1D0337000, v12, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
LABEL_13:
  v15 = v9
     && -[CSCombinedListViewController _notificationListExpandsVisibleRegionOnSignificantScroll](self, "_notificationListExpandsVisibleRegionOnSignificantScroll");
  -[CSCombinedListViewController _updateHidingQuickActionsForSignificantScrolling:](self, "_updateHidingQuickActionsForSignificantScrolling:", v15, v17);
  -[CSCombinedListViewController _setInlineContentHidden:](self, "_setInlineContentHidden:", v9);
  if ((unint64_t)(-[CSCombinedListViewController interfaceOrientation](self, "interfaceOrientation") - 1) < 2
    && v9)
  {
    -[CSCombinedListViewController _dismissDNDBedtimeGreetingViewAnimated:](self, "_dismissDNDBedtimeGreetingViewAnimated:", 1);
  }
LABEL_21:

}

- (void)_updateQuickActionsVisibilityForScrollView:(id)a3
{
  _BOOL8 v4;

  if (-[CSCombinedListViewController _hasExperiencedSignificantScrollingOnScrollView:](self, "_hasExperiencedSignificantScrollingOnScrollView:", a3))
  {
    v4 = -[CSCombinedListViewController _notificationListExpandsVisibleRegionOnSignificantScroll](self, "_notificationListExpandsVisibleRegionOnSignificantScroll");
  }
  else
  {
    v4 = 0;
  }
  -[CSCombinedListViewController _updateHidingQuickActionsForSignificantScrolling:](self, "_updateHidingQuickActionsForSignificantScrolling:", v4);
}

- (void)_updateHidingQuickActionsForSignificantScrolling:(BOOL)a3
{
  -[CSCombinedListViewController _setQuickActionsHidden:forReason:](self, "_setQuickActionsHidden:forReason:", a3, CFSTR("CSQuickActionsScrolledSignificantlyReason"));
}

- (BOOL)_hasExperiencedSignificantScrollingOnScrollView:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "contentOffset");
  objc_msgSend(v3, "contentInset");

  return BSFloatGreaterThanFloat();
}

- (BOOL)isNotificationListSignificantlyScrolled
{
  CSCombinedListViewController *v2;
  void *v3;

  v2 = self;
  -[CSCombinedListViewController notificationListScrollView](self, "notificationListScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[CSCombinedListViewController _hasExperiencedSignificantScrollingOnScrollView:](v2, "_hasExperiencedSignificantScrollingOnScrollView:", v3);

  return (char)v2;
}

- (BOOL)_notificationListExpandsVisibleRegionOnSignificantScroll
{
  return -[NCNotificationStructuredListViewController notificationListExpandsVisibleRegionOnSignificantScroll](self->_structuredListViewController, "notificationListExpandsVisibleRegionOnSignificantScroll");
}

- (void)notificationStructuredListViewController:(id)a3 isPresentingLongLookForViewController:(id)a4
{
  _BOOL8 v6;
  id WeakRetained;
  id v8;
  void *v9;
  void *v10;
  NCNotificationViewController *activePlatterHomeAffordanceOwningNotificationViewController;
  id v12;

  v12 = a4;
  v6 = v12 != 0;
  -[CSCombinedListViewController _setDisableScrolling:](self, "_setDisableScrolling:", v6);
  -[CSCombinedListViewController _setDisableBackgroundAnimation:forReason:](self, "_setDisableBackgroundAnimation:forReason:", v6, CFSTR("Long Look"));
  -[CSCombinedListViewController _setDismissGestureDisabled:forReason:](self, "_setDismissGestureDisabled:forReason:", v6, CFSTR("Long Look"));
  -[CSCombinedListViewController _setHasUserInteraction:forReason:](self, "_setHasUserInteraction:forReason:", v6, CFSTR("NotificationLongLook"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_homeAffordanceController);
  v8 = objc_loadWeakRetained((id *)&self->_platterHomeGestureManager);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "emitEvent:", 41);

    if (SBFEffectiveHomeButtonType() == 2)
    {
      objc_msgSend(v8, "homeGestureContextForViewController:", v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v12, "setHomeGestureContext:", v10);
        objc_storeStrong((id *)&self->_activePlatterHomeAffordanceOwningNotificationViewController, a4);
      }
      else
      {
        objc_msgSend(WeakRetained, "registerHomeGestureParticipant:withIdentifier:", self, 0);
      }

    }
  }
  else if (SBFEffectiveHomeButtonType() == 2)
  {
    if (self->_activePlatterHomeAffordanceOwningNotificationViewController)
    {
      objc_msgSend(v8, "unregisterHomeGestureContextForViewController:");
      activePlatterHomeAffordanceOwningNotificationViewController = self->_activePlatterHomeAffordanceOwningNotificationViewController;
      self->_activePlatterHomeAffordanceOwningNotificationViewController = 0;

    }
    else
    {
      objc_msgSend(WeakRetained, "unregisterHomeGestureParticipant:withIdentifier:", self, 0);
    }
  }

}

- (id)notificationStructuredListViewController:(id)a3 requestsSectionSettingsForSectionIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[CSCombinedListViewController dispatcher](self, "dispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "destination:settingsForSectionIdentifier:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)notificationStructuredListViewControllerRequestsSystemSettings:(id)a3
{
  void *v4;
  void *v5;

  -[CSCombinedListViewController dispatcher](self, "dispatcher", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationSystemSettingsForDestination:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)notificationStructuredListViewController:(id)a3 requestsClearingNotificationRequestsInSections:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[CSCombinedListViewController dispatcher](self, "dispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "destination:clearNotificationRequestsInSections:", self, v5);

  objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "emitEvent:", 40);

}

- (void)notificationStructuredListViewController:(id)a3 requestsClearingNotificationRequests:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CSCombinedListViewController dispatcher](self, "dispatcher");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "destination:clearNotificationRequests:", self, v5);

}

- (BOOL)notificationStructuredListViewController:(id)a3 shouldFilterNotificationRequest:(id)a4
{
  return -[CSCombinedListViewController _shouldFilterNotificationRequest:](self, "_shouldFilterNotificationRequest:", a4);
}

- (void)notificationStructuredListViewController:(id)a3 requestsAuthenticationAndPerformBlock:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __111__CSCombinedListViewController_notificationStructuredListViewController_requestsAuthenticationAndPerformBlock___block_invoke;
  v7[3] = &unk_1E8E2DFA8;
  v8 = v5;
  v6 = v5;
  -[CSCombinedListViewController _requestAuthenticationWithCompletion:](self, "_requestAuthenticationWithCompletion:", v7);

}

uint64_t __111__CSCombinedListViewController_notificationStructuredListViewController_requestsAuthenticationAndPerformBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)notificationStructuredListViewController:(id)a3 shouldAllowInteractionsForNotificationRequest:(id)a4
{
  int v5;
  int v6;
  int v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  const __CFString *v13;
  const __CFString *v14;
  _BOOL4 hasProximitySensor;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  char v19;
  BOOL v20;
  void *v21;
  char v22;
  int v24;
  const __CFString *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  const __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = -[SBUIBiometricResource hasBiometricAuthenticationCapabilityEnabled](self->_biometricResource, "hasBiometricAuthenticationCapabilityEnabled", a3, a4);
  v6 = -[SBUIBiometricResource hasPearlSupport](self->_biometricResource, "hasPearlSupport");
  v7 = _AXSAttentionAwarenessFeaturesEnabled();
  if (v7)
    v8 = 1;
  else
    v8 = v6 & v5;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "forceTouchCapability");

  v12 = *MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v13 = CFSTR("off");
    if (v5)
      v13 = CFSTR("on");
    v14 = CFSTR("noPearl");
    hasProximitySensor = self->_hasProximitySensor;
    if (v6)
      v14 = CFSTR("hasPearl");
    v16 = CFSTR("attentionAware");
    v24 = 138413314;
    v25 = v13;
    v17 = CFSTR("forceTouch");
    if (!v7)
      v16 = CFSTR("noAttention");
    if (v11 != 2)
      v17 = CFSTR("noForce");
    v26 = 2112;
    v27 = v14;
    v28 = 2112;
    v29 = v16;
    v30 = 2112;
    v31 = v17;
    if (hasProximitySensor)
      v18 = CFSTR("hasProx");
    else
      v18 = CFSTR("noProx");
    v32 = 2112;
    v33 = v18;
    _os_log_impl(&dword_1D0337000, v12, OS_LOG_TYPE_DEFAULT, "shouldAllowInteractions biometric %@ - %@ - %@ - %@ - %@", (uint8_t *)&v24, 0x34u);
  }
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2)
      v19 = 1;
    else
      v19 = v8;
    v20 = 1;
    if ((v19 & 1) == 0 && v11 != 2)
      return self->_hasProximitySensor;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "userInterfaceIdiom") == 1)
      v22 = 1;
    else
      v22 = v8;
    v20 = 1;
    if ((v22 & 1) == 0 && v11 != 2)
      v20 = self->_hasProximitySensor;

  }
  return v20;
}

- (BOOL)notificationStructuredListViewControllerShouldAllowLongPressGesture:(id)a3
{
  int v4;
  int v5;
  char v6;
  char v7;
  BOOL v8;
  void *v9;
  char v10;

  v4 = -[SBUIBiometricResource hasBiometricAuthenticationCapabilityEnabled](self->_biometricResource, "hasBiometricAuthenticationCapabilityEnabled", a3);
  v5 = -[SBUIBiometricResource hasPearlSupport](self->_biometricResource, "hasPearlSupport") & v4;
  if (_AXSAttentionAwarenessFeaturesEnabled())
    v6 = 1;
  else
    v6 = v5;
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2)
      v7 = 1;
    else
      v7 = v6;
    return (v7 & 1) != 0 || self->_hasProximitySensor;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "userInterfaceIdiom") == 1)
      v10 = 1;
    else
      v10 = v6;
    v8 = (v10 & 1) != 0 || self->_hasProximitySensor;

  }
  return v8;
}

- (BOOL)notificationStructuredListViewController:(id)a3 isClockNotificationRequest:(id)a4
{
  return -[CSCombinedListViewController _isClockSnoozeAlarmNotificationRequest:](self, "_isClockSnoozeAlarmNotificationRequest:", a4);
}

- (id)legibilitySettingsForNotificationStructuredListViewController:(id)a3
{
  void *v3;
  void *v4;

  -[CSCoverSheetViewControllerBase activeAppearance](self, "activeAppearance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "legibilitySettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)notificationStructuredListViewControllerShouldHintForDefaultAction:(id)a3
{
  int v3;
  void *v4;
  int v5;
  NSObject *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  int v12;
  const __CFString *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = -[SBUIBiometricResource hasBiometricAuthenticationCapabilityEnabled](self->_biometricResource, "hasBiometricAuthenticationCapabilityEnabled", a3);
  objc_msgSend(MEMORY[0x1E0DA9FB8], "standardDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "alwaysAllowDefaultAction");

  v6 = *MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("notCape");
    if (v3)
      v7 = CFSTR("capable");
    v8 = CFSTR("allowsDefault");
    if (!v5)
      v8 = CFSTR("doesn'tForceDefault");
    v12 = 138412546;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_1D0337000, v6, OS_LOG_TYPE_DEFAULT, "shouldHintForDefault hinting %@ - %@", (uint8_t *)&v12, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return 0;
  else
    return (v3 | v5) ^ 1;
}

- (BOOL)notificationStructuredListViewControllerShouldAllowNotificationHistoryReveal:(id)a3
{
  BOOL v4;

  v4 = -[CSCombinedListViewController _allowNotificationsRevealPolicy](self, "_allowNotificationsRevealPolicy", a3);
  return v4 & !-[CSCombinedListViewController _shouldPreventNotificationHistoryRevealForActiveDNDState](self, "_shouldPreventNotificationHistoryRevealForActiveDNDState");
}

- (void)notificationStructuredListViewControllerDidScrollToRevealNotificationHistory:(id)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emitEvent:", 39);

  self->_historyWasRevealed = 1;
}

- (void)notificationStructuredListViewController:(id)a3 requestsClearingFromIncomingSectionNotificationRequests:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[CSCombinedListViewController dispatcher](self, "dispatcher");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "destination:clearNotificationRequestsFromIncomingSection:", self, v6);
}

- (void)notificationStructuredListViewController:(id)a3 setAllowsNotifications:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a4;
  v7 = a5;
  -[CSCombinedListViewController dispatcher](self, "dispatcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "destination:setAllowsNotifications:forSectionIdentifier:", self, v5, v7);

}

- (void)notificationStructuredListViewController:(id)a3 setDeliverQuietly:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a4;
  v7 = a5;
  -[CSCombinedListViewController dispatcher](self, "dispatcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "destination:setDeliverQuietly:forSectionIdentifier:", self, v5, v7);

}

- (void)notificationStructuredListViewController:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forSectionIdentifier:(id)a6 threadIdentifier:(id)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  id v13;
  id v14;

  v9 = a4;
  v11 = a7;
  v12 = a6;
  v13 = a5;
  -[CSCombinedListViewController dispatcher](self, "dispatcher");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "destination:setMuted:untilDate:forSectionIdentifier:threadIdentifier:", self, v9, v13, v12, v11);

}

- (void)notificationStructuredListViewController:(id)a3 setAllowsCriticalAlerts:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a4;
  v7 = a5;
  -[CSCombinedListViewController dispatcher](self, "dispatcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "destination:setAllowsCriticalAlerts:forSectionIdentifier:", self, v5, v7);

}

- (void)notificationStructuredListViewController:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a4;
  v7 = a5;
  -[CSCombinedListViewController dispatcher](self, "dispatcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "destination:setAllowsTimeSensitive:forSectionIdentifier:", self, v5, v7);

}

- (void)notificationStructuredListViewController:(id)a3 setAllowsDirectMessages:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a4;
  v7 = a5;
  -[CSCombinedListViewController dispatcher](self, "dispatcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "destination:setAllowsDirectMessages:forSectionIdentifier:", self, v5, v7);

}

- (void)notificationStructuredListViewController:(id)a3 setScheduledDelivery:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a4;
  v7 = a5;
  -[CSCombinedListViewController dispatcher](self, "dispatcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "destination:setScheduledDelivery:forSectionIdentifier:", self, v5, v7);

}

- (void)notificationStructuredListViewController:(id)a3 setSystemScheduledDeliveryEnabled:(BOOL)a4 scheduledDeliveryTimes:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a4;
  v7 = a5;
  -[CSCombinedListViewController dispatcher](self, "dispatcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "destination:setSystemScheduledDeliveryEnabled:scheduledDeliveryTimes:", self, v5, v7);

}

- (void)notificationStructuredListViewController:(id)a3 setNotificationSystemSettings:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CSCombinedListViewController dispatcher](self, "dispatcher");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "destination:setNotificationSystemSettings:", self, v5);

}

- (id)notificationStructuredListViewController:(id)a3 notificationRequestForUUID:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[CSCombinedListViewController dispatcher](self, "dispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "destination:notificationRequestForUUID:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)notificationUsageTrackingStateForNotificationStructuredListViewController:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0DC60C8];
  v5 = *MEMORY[0x1E0DC6108];
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)notificationStructuredListViewController:(id)a3 keyboardAssertionForGestureWindow:(id)a4
{
  id v5;
  id WeakRetained;
  void *v7;

  v5 = a4;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_homeAffordanceController);
    objc_msgSend(WeakRetained, "keyboardAssertionForGestureWindow:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)hideHomeAffordanceAnimationSettingsForNotificationStructuredListViewController:(id)a3
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_homeAffordanceController);
  objc_msgSend(WeakRetained, "hideHomeAffordanceAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)unhideHomeAffordanceAnimationSettingsForNotificationStructuredListViewController:(id)a3
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_homeAffordanceController);
  objc_msgSend(WeakRetained, "unhideHomeAffordanceAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)settleHomeAffordanceAnimationBehaviorDescriptionForNotificationStructuredListViewController:(id)a3
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_homeAffordanceController);
  objc_msgSend(WeakRetained, "settleHomeAffordanceAnimationBehaviorDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)notificationStructuredListViewController:(id)a3 requestsPresentingDigestOnboardingSuggestionViewController:(id)a4
{
  UIViewController *v6;
  SBSLockScreenContentAssertion *v7;
  SBSLockScreenContentAssertion *digestOnboardingSuggestionViewControllerAssertion;
  id v9;

  v9 = a3;
  v6 = (UIViewController *)a4;
  if (self->_digestOnboardingSuggestionViewController != v6)
  {
    objc_storeStrong((id *)&self->_digestOnboardingSuggestionViewController, a4);
    -[CSNotificationAdjunctListViewController setDigestOnboardingSuggestionViewController:](self->_adjunctListViewController, "setDigestOnboardingSuggestionViewController:", v6);
    if (self->_digestOnboardingSuggestionViewController)
    {
      objc_msgSend(MEMORY[0x1E0DAAEF0], "acquireContentProviderAssertionForType:slot:identifier:errorHandler:", 1, *MEMORY[0x1E0DAB7C8], *MEMORY[0x1E0DAB118], 0);
      v7 = (SBSLockScreenContentAssertion *)objc_claimAutoreleasedReturnValue();
      digestOnboardingSuggestionViewControllerAssertion = self->_digestOnboardingSuggestionViewControllerAssertion;
      self->_digestOnboardingSuggestionViewControllerAssertion = v7;
    }
    else
    {
      -[SBSLockScreenContentAssertion invalidate](self->_digestOnboardingSuggestionViewControllerAssertion, "invalidate");
      digestOnboardingSuggestionViewControllerAssertion = self->_digestOnboardingSuggestionViewControllerAssertion;
      self->_digestOnboardingSuggestionViewControllerAssertion = 0;
    }

  }
}

- (UIEdgeInsets)notificationStructuredListViewControllerRequestsEdgeInsetsForOverlayFooterView:(id)a3 forOrientation:(int64_t)a4
{
  id v6;
  int v7;
  int v8;
  int v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  double v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  void *v26;
  double v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  uint64_t *v38;
  double v39;
  int v40;
  double v41;
  double v42;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  int v53;
  int v54;
  int v55;
  int v56;
  unsigned int v57;
  int v58;
  int v59;
  unsigned int v60;
  double v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  uint64_t *v69;
  double v70;
  int v71;
  double v72;
  double v73;
  double v74;
  double v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  uint64_t v81;
  int v82;
  int v83;
  int v84;
  int v85;
  unsigned int v86;
  int v87;
  int v88;
  unsigned int v89;
  double v90;
  int v91;
  int v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  uint64_t *v98;
  double v99;
  int v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  int v111;
  double v112;
  int v113;
  double v114;
  int v115;
  double v116;
  int v117;
  double v118;
  int v119;
  double v120;
  int v121;
  double v122;
  double v123;
  double v124;
  double v125;
  int v126;
  int v127;
  double v128;
  int v129;
  int v130;
  double v131;
  int v132;
  int v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  int v141;
  double v142;
  int v143;
  double v144;
  int v145;
  int v146;
  int v147;
  int v148;
  double v149;
  double v150;
  double v151;
  double v152;
  int v153;
  double v154;
  int v155;
  double v156;
  int v157;
  int v158;
  int v159;
  int v160;
  double v161;
  int v162;
  int v163;
  int v164;
  int v165;
  double v166;
  int v167;
  int v168;
  int v169;
  int v170;
  double v171;
  int v172;
  double v173;
  double v174;
  double v175;
  double v176;
  int v177;
  int v178;
  double v179;
  int v180;
  int v181;
  double v182;
  int v183;
  int v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  int v192;
  double v193;
  int v194;
  double v195;
  int v196;
  int v197;
  int v198;
  int v199;
  int v200;
  double v201;
  double v202;
  double v203;
  double v204;
  double v205;
  double v206;
  int v207;
  int v208;
  int v209;
  int v210;
  int v211;
  int v212;
  int v213;
  int v214;
  double v215;
  int v216;
  double v217;
  double v218;
  double v219;
  double v220;
  double v221;
  double v222;
  double v223;
  double v224;
  int v225;
  double v226;
  int v227;
  double v228;
  int v229;
  double v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
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
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  int v281;
  int v282;
  void *v283;
  int v284;
  int v285;
  void *v286;
  int v287;
  int v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  int v304;
  int v305;
  int v306;
  int v307;
  int v308;
  int v309;
  int v310;
  int v311;
  int v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  _BYTE v316[12];
  _BYTE v317[68];
  unint64_t v318;
  unint64_t v319;
  _BYTE v320[12];
  int v321;
  int v322;
  id v323;
  UIEdgeInsets result;

  v6 = a3;
  if (!+[CSQuickActionsViewController deviceSupportsButtons](CSQuickActionsViewController, "deviceSupportsButtons"))
  {
    -[CSCombinedListViewController _listViewDefaultContentInsets](self, "_listViewDefaultContentInsets");
    v11 = v10;
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceIdiom");

    if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      if ((unint64_t)(a4 - 3) >= 2)
        v14 = 80.0;
      else
        v14 = 46.0;
    }
    else
    {
      v14 = 50.0;
    }
    v16 = v14;
    goto LABEL_515;
  }
  v7 = __sb__runningInSpringBoard();
  v323 = v6;
  if (v7)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v8 = 0;
      v9 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v286 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v286, "userInterfaceIdiom") != 1)
    {
      v8 = 0;
      v9 = 1;
      goto LABEL_17;
    }
  }
  v9 = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v15 = __sb__runningInSpringBoard();
    if ((_DWORD)v15)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v273 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v273, "_referenceBounds");
    }
    v8 = v15 ^ 1;
    BSSizeRoundForScale();
    if (v42 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v41 == *(double *)(MEMORY[0x1E0DAB260] + 280))
    {
      v321 = v15 ^ 1;
      v322 = v9;
      v29 = 0;
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v289 = 0;
      v292 = 0;
      v295 = 0;
      v298 = 0;
      v304 = 0;
      v301 = 0;
      v313 = 0;
      v307 = 0;
      v310 = 0;
      memset(v316, 0, sizeof(v316));
      memset(v317, 0, sizeof(v317));
      v318 = 0;
      v319 = 0;
      memset(v320, 0, sizeof(v320));
      v38 = &qword_1D048F9A8;
      goto LABEL_74;
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_17:
  v17 = __sb__runningInSpringBoard();
  v321 = v8;
  v322 = v9;
  if (v17)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v18 = 0;
      v19 = 0;
      goto LABEL_26;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v283 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v283, "userInterfaceIdiom") != 1)
    {
      v18 = 0;
      v19 = 1;
      goto LABEL_26;
    }
  }
  v19 = v17 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v15 = __sb__runningInSpringBoard();
    if ((_DWORD)v15)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v272 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v272, "_referenceBounds");
    }
    v18 = v15 ^ 1;
    BSSizeRoundForScale();
    if (v44 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
    {
      HIDWORD(v319) = v15 ^ 1;
      *(_DWORD *)v320 = v19;
      v29 = 0;
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v289 = 0;
      v292 = 0;
      v295 = 0;
      v298 = 0;
      v304 = 0;
      v301 = 0;
      v313 = 0;
      v307 = 0;
      v310 = 0;
      memset(v316, 0, sizeof(v316));
      memset(v317, 0, sizeof(v317));
      *(_QWORD *)&v320[4] = 0;
      v318 = 0;
      LODWORD(v319) = 0;
      v38 = &qword_1D048F9D0;
      goto LABEL_74;
    }
  }
  else
  {
    v18 = 0;
  }
LABEL_26:
  v20 = __sb__runningInSpringBoard();
  HIDWORD(v319) = v18;
  *(_DWORD *)v320 = v19;
  if (v20)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v21 = 0;
      v22 = 0;
      goto LABEL_35;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v280 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v280, "userInterfaceIdiom") != 1)
    {
      v21 = 0;
      v22 = 1;
      goto LABEL_35;
    }
  }
  v22 = v20 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v15 = __sb__runningInSpringBoard();
    if ((_DWORD)v15)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v271 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v271, "_referenceBounds");
    }
    v21 = v15 ^ 1;
    BSSizeRoundForScale();
    if (v45 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
    {
      HIDWORD(v318) = v15 ^ 1;
      LODWORD(v319) = v22;
      v29 = 0;
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v289 = 0;
      v292 = 0;
      v295 = 0;
      v298 = 0;
      v304 = 0;
      v301 = 0;
      v313 = 0;
      v307 = 0;
      v310 = 0;
      memset(v316, 0, sizeof(v316));
      memset(v317, 0, sizeof(v317));
      *(_QWORD *)&v320[4] = 0;
      LODWORD(v318) = 0;
      v38 = &qword_1D048F9C0;
      goto LABEL_74;
    }
  }
  else
  {
    v21 = 0;
  }
LABEL_35:
  v23 = __sb__runningInSpringBoard();
  HIDWORD(v318) = v21;
  LODWORD(v319) = v22;
  if (v23)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v24 = 0;
      v25 = 0;
      goto LABEL_44;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v279 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v279, "userInterfaceIdiom") != 1)
    {
      v24 = 0;
      v25 = 1;
      goto LABEL_44;
    }
  }
  v25 = v23 ^ 1;
  v15 = __sb__runningInSpringBoard();
  if ((_DWORD)v15)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v276 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v276, "_referenceBounds");
  }
  v24 = v15 ^ 1;
  BSSizeRoundForScale();
  if (v27 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    *(_DWORD *)&v317[64] = v15 ^ 1;
    LODWORD(v318) = v25;
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v289 = 0;
    v292 = 0;
    v295 = 0;
    v298 = 0;
    v304 = 0;
    v301 = 0;
    v313 = 0;
    v307 = 0;
    v310 = 0;
    memset(v316, 0, sizeof(v316));
    memset(v317, 0, 64);
    *(_QWORD *)&v320[4] = 0;
    v38 = &qword_1D048F9C8;
    goto LABEL_74;
  }
LABEL_44:
  v28 = __sb__runningInSpringBoard();
  *(_DWORD *)&v317[64] = v24;
  LODWORD(v318) = v25;
  if (v28)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_QWORD *)&v320[4] = 0;
      goto LABEL_54;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v278 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v278, "userInterfaceIdiom") != 1)
    {
      *(_QWORD *)&v320[4] = 0x100000000;
      goto LABEL_54;
    }
  }
  *(_DWORD *)&v320[8] = v28 ^ 1;
  v15 = __sb__runningInSpringBoard();
  if ((_DWORD)v15)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v274 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v274, "_referenceBounds");
  }
  *(_DWORD *)&v320[4] = v15 ^ 1;
  BSSizeRoundForScale();
  if (v39 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
  {
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v289 = 0;
    v292 = 0;
    v295 = 0;
    v298 = 0;
    v304 = 0;
    v301 = 0;
    v313 = 0;
    v307 = 0;
    v310 = 0;
    memset(v316, 0, sizeof(v316));
    memset(v317, 0, 64);
    v38 = &qword_1D048F9B8;
    goto LABEL_74;
  }
LABEL_54:
  v40 = __sb__runningInSpringBoard();
  if (v40)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_QWORD *)&v317[56] = 0;
      goto LABEL_526;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v277 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v277, "userInterfaceIdiom") != 1)
    {
      *(_QWORD *)&v317[56] = 0x100000000;
      goto LABEL_526;
    }
  }
  *(_DWORD *)&v317[60] = v40 ^ 1;
  v15 = __sb__runningInSpringBoard();
  if ((_DWORD)v15)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v270 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v270, "_referenceBounds");
  }
  *(_DWORD *)&v317[56] = v15 ^ 1;
  BSSizeRoundForScale();
  if (v110 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
  {
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v289 = 0;
    v292 = 0;
    v295 = 0;
    v298 = 0;
    v304 = 0;
    v301 = 0;
    v313 = 0;
    v307 = 0;
    v310 = 0;
    memset(v316, 0, sizeof(v316));
    memset(v317, 0, 56);
    v38 = &qword_1D048F9B0;
    goto LABEL_74;
  }
LABEL_526:
  v15 = __sb__runningInSpringBoard();
  if ((_DWORD)v15)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_528;
LABEL_534:
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v289 = 0;
    v292 = 0;
    v295 = 0;
    v298 = 0;
    v304 = 0;
    v301 = 0;
    v313 = 0;
    v307 = 0;
    v310 = 0;
    memset(v316, 0, sizeof(v316));
    memset(v317, 0, 52);
    v38 = &qword_1D048F9A0;
    *(_DWORD *)&v317[52] = v15 ^ 1;
    goto LABEL_74;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v275, "userInterfaceIdiom") == 1)
    goto LABEL_534;
LABEL_528:
  *(_DWORD *)&v317[52] = v15 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_532:
    *(_QWORD *)&v317[40] = 0;
    goto LABEL_572;
  }
  v111 = __sb__runningInSpringBoard();
  if (v111)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_532;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v268, "userInterfaceIdiom"))
    {
      *(_QWORD *)&v317[40] = 1;
      goto LABEL_572;
    }
  }
  *(_DWORD *)&v317[40] = v111 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v15 = __sb__runningInSpringBoard();
    if ((_DWORD)v15)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v261 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v261, "_referenceBounds");
    }
    *(_DWORD *)&v317[44] = v15 ^ 1;
    BSSizeRoundForScale();
    if (v122 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
    {
      v29 = 0;
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v289 = 0;
      v292 = 0;
      v295 = 0;
      v298 = 0;
      v304 = 0;
      v301 = 0;
      v313 = 0;
      v307 = 0;
      v310 = 0;
      memset(v316, 0, sizeof(v316));
      memset(v317, 0, 40);
      *(_DWORD *)&v317[48] = 0;
      v38 = &qword_1D048F980;
      goto LABEL_74;
    }
  }
  else
  {
    *(_DWORD *)&v317[44] = 0;
  }
LABEL_572:
  v15 = __sb__runningInSpringBoard();
  if ((_DWORD)v15)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v317[36] = 0;
      *(_DWORD *)&v317[48] = 0;
      goto LABEL_582;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v269 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v269, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v317[36] = 0;
      *(_DWORD *)&v317[48] = 1;
      goto LABEL_582;
    }
  }
  *(_DWORD *)&v317[48] = v15 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v15 = __sb__runningInSpringBoard();
    if ((_DWORD)v15)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v264 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v264, "_referenceBounds");
    }
    *(_DWORD *)&v317[36] = v15 ^ 1;
    BSSizeRoundForScale();
    if (v116 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
      goto LABEL_586;
  }
  else
  {
    *(_DWORD *)&v317[36] = 0;
  }
LABEL_582:
  if ((_SBF_Private_IsD94Like() & 1) != 0)
  {
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v289 = 0;
    v292 = 0;
    v295 = 0;
    v298 = 0;
    v304 = 0;
    v301 = 0;
    v313 = 0;
    v307 = 0;
    v310 = 0;
    memset(v316, 0, sizeof(v316));
    memset(v317, 0, 36);
    v38 = &qword_1D048F988;
    goto LABEL_74;
  }
LABEL_586:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_590:
    *(_QWORD *)&v317[28] = 0;
    goto LABEL_656;
  }
  v117 = __sb__runningInSpringBoard();
  if (v117)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_590;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v265 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v265, "userInterfaceIdiom"))
    {
      *(_QWORD *)&v317[28] = 0x100000000;
      goto LABEL_656;
    }
  }
  *(_DWORD *)&v317[32] = v117 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v15 = __sb__runningInSpringBoard();
    if ((_DWORD)v15)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v256 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v256, "_referenceBounds");
    }
    *(_DWORD *)&v317[28] = v15 ^ 1;
    BSSizeRoundForScale();
    if (v137 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      v29 = 0;
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v289 = 0;
      v292 = 0;
      v295 = 0;
      v298 = 0;
      v304 = 0;
      v301 = 0;
      v313 = 0;
      v307 = 0;
      v310 = 0;
      memset(v316, 0, sizeof(v316));
      memset(v317, 0, 28);
      v38 = &qword_1D048F990;
      goto LABEL_74;
    }
  }
  else
  {
    *(_DWORD *)&v317[28] = 0;
  }
LABEL_656:
  v15 = __sb__runningInSpringBoard();
  if ((_DWORD)v15)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v317[16] = 0;
      *(_DWORD *)&v317[24] = 0;
      goto LABEL_666;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v267 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v267, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v317[16] = 0;
      *(_DWORD *)&v317[24] = 1;
      goto LABEL_666;
    }
  }
  *(_DWORD *)&v317[24] = v15 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v15 = __sb__runningInSpringBoard();
    if ((_DWORD)v15)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v260 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v260, "_referenceBounds");
    }
    *(_DWORD *)&v317[16] = v15 ^ 1;
    BSSizeRoundForScale();
    if (v125 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_670;
  }
  else
  {
    *(_DWORD *)&v317[16] = 0;
  }
LABEL_666:
  if ((_SBF_Private_IsD64Like() & 1) != 0)
  {
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v289 = 0;
    v292 = 0;
    v295 = 0;
    v298 = 0;
    v304 = 0;
    v301 = 0;
    v313 = 0;
    v307 = 0;
    v310 = 0;
    *(_QWORD *)&v317[4] = 0;
    memset(v316, 0, sizeof(v316));
    *(_DWORD *)v317 = 0;
    *(_DWORD *)&v317[12] = 0;
    *(_DWORD *)&v317[20] = 0;
    v38 = &qword_1D048F998;
    goto LABEL_74;
  }
LABEL_670:
  v126 = __sb__runningInSpringBoard();
  if (v126)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v317[12] = 0;
      *(_DWORD *)&v317[20] = 0;
      goto LABEL_680;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v266 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v266, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v317[12] = 0;
      *(_DWORD *)&v317[20] = 1;
      goto LABEL_680;
    }
  }
  *(_DWORD *)&v317[20] = v126 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v127 = __sb__runningInSpringBoard();
    if (v127)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v257 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v257, "_referenceBounds");
    }
    v15 = v127 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v317[12] = v15;
    if (v134 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      v29 = 0;
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v289 = 0;
      v292 = 0;
      v295 = 0;
      v298 = 0;
      v304 = 0;
      v301 = 0;
      v313 = 0;
      v307 = 0;
      v310 = 0;
      *(_QWORD *)&v317[4] = 0;
      memset(v316, 0, sizeof(v316));
      *(_DWORD *)v317 = 0;
      v38 = &qword_1D048F970;
      goto LABEL_74;
    }
  }
  else
  {
    *(_DWORD *)&v317[12] = 0;
  }
LABEL_680:
  v15 = __sb__runningInSpringBoard();
  if ((_DWORD)v15)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)v316 = 0;
      *(_DWORD *)v317 = 0;
      goto LABEL_758;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v263 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v263, "userInterfaceIdiom"))
    {
      *(_DWORD *)v316 = 0;
      *(_DWORD *)v317 = 1;
      goto LABEL_758;
    }
  }
  *(_DWORD *)v317 = v15 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v15 = __sb__runningInSpringBoard();
    if ((_DWORD)v15)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v255 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "_referenceBounds");
    }
    *(_DWORD *)v316 = v15 ^ 1;
    BSSizeRoundForScale();
    if (v140 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_792;
  }
  else
  {
    *(_DWORD *)v316 = 0;
  }
LABEL_758:
  if ((_SBF_Private_IsD54() & 1) != 0)
  {
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v289 = 0;
    v292 = 0;
    v295 = 0;
    v298 = 0;
    v304 = 0;
    v301 = 0;
    v313 = 0;
    v307 = 0;
    v310 = 0;
    *(_QWORD *)&v316[4] = 0;
    *(_QWORD *)&v317[4] = 0;
    v38 = &qword_1D048F978;
    goto LABEL_74;
  }
LABEL_792:
  v141 = __sb__runningInSpringBoard();
  if (v141)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)&v317[4] = 0;
      goto LABEL_818;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v262 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v262, "userInterfaceIdiom"))
    {
      *(_QWORD *)&v317[4] = 0x100000000;
      goto LABEL_818;
    }
  }
  *(_DWORD *)&v317[8] = v141 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v146 = __sb__runningInSpringBoard();
    if (v146)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v252 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v252, "_referenceBounds");
    }
    v15 = v146 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v317[4] = v15;
    if (v149 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      v29 = 0;
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v289 = 0;
      v292 = 0;
      v295 = 0;
      v298 = 0;
      v304 = 0;
      v301 = 0;
      v313 = 0;
      v307 = 0;
      v310 = 0;
      *(_QWORD *)&v316[4] = 0;
      v38 = &qword_1D048F940;
      goto LABEL_74;
    }
  }
  else
  {
    *(_DWORD *)&v317[4] = 0;
  }
LABEL_818:
  v15 = __sb__runningInSpringBoard();
  if ((_DWORD)v15)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)&v316[4] = 0;
      goto LABEL_848;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v259, "userInterfaceIdiom"))
    {
      *(_QWORD *)&v316[4] = 0x100000000;
      goto LABEL_848;
    }
  }
  *(_DWORD *)&v316[8] = v15 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v15 = __sb__runningInSpringBoard();
    if ((_DWORD)v15)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v251 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v251, "_referenceBounds");
    }
    *(_DWORD *)&v316[4] = v15 ^ 1;
    BSSizeRoundForScale();
    if (v152 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_879;
  }
  else
  {
    *(_DWORD *)&v316[4] = 0;
  }
LABEL_848:
  if (_SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
  {
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v289 = 0;
    v292 = 0;
    v295 = 0;
    v298 = 0;
    v304 = 0;
    v301 = 0;
    v313 = 0;
    v307 = 0;
    v310 = 0;
    v38 = &qword_1D048F948;
    goto LABEL_74;
  }
LABEL_879:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_883:
    v307 = 0;
    v310 = 0;
    goto LABEL_908;
  }
  v153 = __sb__runningInSpringBoard();
  if (v153)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_883;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v254 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v254, "userInterfaceIdiom"))
    {
      v307 = 0;
      v310 = 1;
      goto LABEL_908;
    }
  }
  v310 = v153 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v158 = __sb__runningInSpringBoard();
    if (v158)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v245 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v245, "_referenceBounds");
    }
    v15 = v158 ^ 1u;
    BSSizeRoundForScale();
    v307 = v15;
    if (v173 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
    {
      v29 = 0;
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v289 = 0;
      v292 = 0;
      v295 = 0;
      v298 = 0;
      v304 = 0;
      v301 = 0;
      v313 = 0;
      v38 = &qword_1D048F930;
      goto LABEL_74;
    }
  }
  else
  {
    v307 = 0;
  }
LABEL_908:
  v159 = __sb__runningInSpringBoard();
  if (v159)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v15 = 0;
      HIDWORD(v313) = 0;
      goto LABEL_918;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v258 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v258, "userInterfaceIdiom"))
    {
      v15 = 0;
      HIDWORD(v313) = 1;
      goto LABEL_918;
    }
  }
  HIDWORD(v313) = v159 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v160 = __sb__runningInSpringBoard();
    if (v160)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v248, "_referenceBounds");
    }
    v15 = v160 ^ 1u;
    BSSizeRoundForScale();
    if (v161 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
      goto LABEL_922;
  }
  else
  {
    v15 = 0;
  }
LABEL_918:
  if ((_SBF_Private_IsD93Like() & 1) != 0)
  {
    LODWORD(v313) = v15;
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v289 = 0;
    v292 = 0;
    v295 = 0;
    v298 = 0;
    v304 = 0;
    v301 = 0;
    v38 = &qword_1D048F938;
    goto LABEL_74;
  }
LABEL_922:
  LODWORD(v313) = v15;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_926:
    v301 = 0;
    goto LABEL_992;
  }
  v162 = __sb__runningInSpringBoard();
  if (v162)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_926;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v249 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v249, "userInterfaceIdiom"))
    {
      v301 = 0x100000000;
      goto LABEL_992;
    }
  }
  HIDWORD(v301) = v162 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v15 = __sb__runningInSpringBoard();
    if ((_DWORD)v15)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v241 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v241, "_referenceBounds");
    }
    LODWORD(v301) = v15 ^ 1;
    BSSizeRoundForScale();
    if (v188 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v29 = 0;
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v289 = 0;
      v292 = 0;
      v295 = 0;
      v298 = 0;
      v304 = 0;
      v38 = &qword_1D048F960;
      goto LABEL_74;
    }
  }
  else
  {
    LODWORD(v301) = 0;
  }
LABEL_992:
  v15 = __sb__runningInSpringBoard();
  if ((_DWORD)v15)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v298) = 0;
      v304 = 0;
      goto LABEL_1002;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v253, "userInterfaceIdiom"))
    {
      HIDWORD(v298) = 0;
      v304 = 1;
      goto LABEL_1002;
    }
  }
  v304 = v15 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v15 = __sb__runningInSpringBoard();
    if ((_DWORD)v15)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v244 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v244, "_referenceBounds");
    }
    HIDWORD(v298) = v15 ^ 1;
    BSSizeRoundForScale();
    if (v176 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_1006;
  }
  else
  {
    HIDWORD(v298) = 0;
  }
LABEL_1002:
  if ((_SBF_Private_IsD63Like() & 1) != 0)
  {
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v289 = 0;
    v292 = 0;
    v295 = 0;
    LODWORD(v298) = 0;
    v38 = &qword_1D048F968;
    goto LABEL_74;
  }
LABEL_1006:
  v177 = __sb__runningInSpringBoard();
  if (v177)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v292) = 0;
      LODWORD(v298) = 0;
      goto LABEL_1016;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v250, "userInterfaceIdiom"))
    {
      LODWORD(v292) = 0;
      LODWORD(v298) = 1;
      goto LABEL_1016;
    }
  }
  LODWORD(v298) = v177 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v178 = __sb__runningInSpringBoard();
    if (v178)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v242 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v242, "_referenceBounds");
    }
    v15 = v178 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v292) = v15;
    if (v185 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
    {
      v29 = 0;
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v289 = 0;
      HIDWORD(v292) = 0;
      v295 = 0;
      v38 = &qword_1D048F950;
      goto LABEL_74;
    }
  }
  else
  {
    LODWORD(v292) = 0;
  }
LABEL_1016:
  v15 = __sb__runningInSpringBoard();
  if ((_DWORD)v15)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v295 = 0;
      goto LABEL_1094;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v247 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v247, "userInterfaceIdiom"))
    {
      v295 = 0x100000000;
      goto LABEL_1094;
    }
  }
  HIDWORD(v295) = v15 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v15 = __sb__runningInSpringBoard();
    if ((_DWORD)v15)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v240 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v240, "_referenceBounds");
    }
    LODWORD(v295) = v15 ^ 1;
    BSSizeRoundForScale();
    if (v191 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_1128;
  }
  else
  {
    LODWORD(v295) = 0;
  }
LABEL_1094:
  if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
  {
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v289 = 0;
    HIDWORD(v292) = 0;
    v38 = &qword_1D048F958;
    goto LABEL_74;
  }
LABEL_1128:
  v192 = __sb__runningInSpringBoard();
  if (v192)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v289) = 0;
      HIDWORD(v292) = 0;
      goto LABEL_1154;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v246 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v246, "userInterfaceIdiom"))
    {
      HIDWORD(v289) = 0;
      HIDWORD(v292) = 1;
      goto LABEL_1154;
    }
  }
  HIDWORD(v292) = v192 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v15 = __sb__runningInSpringBoard();
    if ((_DWORD)v15)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v239, "_referenceBounds");
    }
    HIDWORD(v289) = v15 ^ 1;
    BSSizeRoundForScale();
    if (v201 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v29 = 0;
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      LODWORD(v289) = 0;
      v38 = &qword_1D048F920;
      goto LABEL_74;
    }
  }
  else
  {
    HIDWORD(v289) = 0;
  }
LABEL_1154:
  v15 = __sb__runningInSpringBoard();
  if ((_DWORD)v15)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v37 = 0;
      LODWORD(v289) = 0;
      goto LABEL_1184;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v243 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v243, "userInterfaceIdiom"))
    {
      v37 = 0;
      LODWORD(v289) = 1;
      goto LABEL_1184;
    }
  }
  LODWORD(v289) = v15 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v15 = __sb__runningInSpringBoard();
    if ((_DWORD)v15)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v238, "_referenceBounds");
    }
    v37 = v15 ^ 1;
    BSSizeRoundForScale();
    if (v204 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_1209;
  }
  else
  {
    v37 = 0;
  }
LABEL_1184:
  if ((_SBF_Private_IsD53() & 1) != 0)
  {
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v38 = &qword_1D048F928;
    goto LABEL_74;
  }
LABEL_1209:
  if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v38 = &qword_1D048F900;
    goto LABEL_74;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
  {
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v38 = &qword_1D048F908;
    goto LABEL_74;
  }
  if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v38 = &qword_1D048F8F0;
    goto LABEL_74;
  }
  if ((_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
  {
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v38 = &qword_1D048F8F8;
    goto LABEL_74;
  }
  v207 = __sb__runningInSpringBoard();
  if (v207)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v35 = 0;
      v36 = 0;
      goto LABEL_1265;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v237 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v237, "userInterfaceIdiom"))
    {
      v35 = 0;
      v36 = 1;
      goto LABEL_1265;
    }
  }
  v36 = v207 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v15 = __sb__runningInSpringBoard();
    if ((_DWORD)v15)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v233, "_referenceBounds");
    }
    v35 = v15 ^ 1;
    BSSizeRoundForScale();
    if (v219 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
    {
      v29 = 0;
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v38 = &qword_1D048F910;
      goto LABEL_74;
    }
  }
  else
  {
    v35 = 0;
  }
LABEL_1265:
  v15 = __sb__runningInSpringBoard();
  if ((_DWORD)v15)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v33 = 0;
      v34 = 0;
      goto LABEL_1295;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v236, "userInterfaceIdiom"))
    {
      v33 = 0;
      v34 = 1;
      goto LABEL_1295;
    }
  }
  v34 = v15 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v210 = __sb__runningInSpringBoard();
    if (v210)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v232, "_referenceBounds");
    }
    v33 = v210 ^ 1;
    BSSizeRoundForScale();
    if (v222 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
    {
      v29 = 0;
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v38 = &qword_1D048F918;
      goto LABEL_74;
    }
  }
  else
  {
    v33 = 0;
  }
LABEL_1295:
  v211 = __sb__runningInSpringBoard();
  if (v211)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v31 = 0;
      v32 = 0;
      goto LABEL_1325;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v235, "userInterfaceIdiom"))
    {
      v31 = 0;
      v32 = 1;
      goto LABEL_1325;
    }
  }
  v32 = v211 ^ 1;
  v214 = __sb__runningInSpringBoard();
  if (v214)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v234, "_referenceBounds");
  }
  v31 = v214 ^ 1;
  BSSizeRoundForScale();
  if (v215 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
  {
    v29 = 0;
    v30 = 0;
    v38 = &qword_1D048F8E8;
    goto LABEL_74;
  }
LABEL_1325:
  v216 = __sb__runningInSpringBoard();
  if (v216)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v29 = 0;
      v30 = 0;
      goto LABEL_1376;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v15 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v15, "userInterfaceIdiom"))
    {
      v29 = 0;
      v30 = 1;
      goto LABEL_1376;
    }
  }
  v30 = v216 ^ 1;
  v225 = __sb__runningInSpringBoard();
  if (v225)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v231, "_referenceBounds");
  }
  v29 = v225 ^ 1;
  BSSizeRoundForScale();
  if (v226 >= *(double *)(MEMORY[0x1E0DAB260] + 40))
  {
    v38 = &qword_1D048F8E0;
    goto LABEL_1378;
  }
LABEL_1376:
  v38 = &CSQuickActionButtonDiameter;
LABEL_1378:
  v26 = v231;
LABEL_74:
  v46 = *(double *)v38;
  if (v29)
  {

    if (!v30)
      goto LABEL_76;
  }
  else if (!v30)
  {
LABEL_76:
    if (!v31)
      goto LABEL_78;
    goto LABEL_77;
  }

  if (v31)
LABEL_77:

LABEL_78:
  if (v32)

  if (v33)
  if (v34)

  if (v35)
  if (v36)

  v47 = v319;
  if (v37)

  if ((_DWORD)v289)
  if (HIDWORD(v289))

  if (HIDWORD(v292))
  if ((_DWORD)v295)

  if (HIDWORD(v295))
  if ((_DWORD)v292)

  if ((_DWORD)v298)
  if (HIDWORD(v298))

  if (v304)
  if ((_DWORD)v301)

  if (HIDWORD(v301))
  if ((_DWORD)v313)

  if (HIDWORD(v313))
  if (v307)

  if (v310)
  if (*(_DWORD *)&v316[4])

  if (*(_DWORD *)&v316[8])
  if (*(_DWORD *)&v317[4])

  if (*(_DWORD *)&v317[8])
  if (*(_DWORD *)v316)

  if (*(_DWORD *)v317)
  if (*(_DWORD *)&v317[12])

  if (*(_DWORD *)&v317[20])
  if (*(_DWORD *)&v317[16])

  if (*(_DWORD *)&v317[24])
  if (*(_DWORD *)&v317[28])

  if (*(_DWORD *)&v317[32])
  if (*(_DWORD *)&v317[36])

  if (*(_DWORD *)&v317[48])
  if (*(_DWORD *)&v317[44])

  if (*(_DWORD *)&v317[40])
  if (*(_DWORD *)&v317[52])

  if (*(_DWORD *)&v317[56])
  if (*(_DWORD *)&v317[60])

  if (*(_DWORD *)&v320[4])
  if (*(_DWORD *)&v320[8])
  {

    if (!*(_DWORD *)&v317[64])
      goto LABEL_162;
  }
  else if (!*(_DWORD *)&v317[64])
  {
LABEL_162:
    if ((_DWORD)v318)
      goto LABEL_163;
    goto LABEL_178;
  }

  if ((_DWORD)v318)
  {
LABEL_163:

    if (!HIDWORD(v318))
      goto LABEL_164;
    goto LABEL_179;
  }
LABEL_178:
  if (!HIDWORD(v318))
  {
LABEL_164:
    if ((_DWORD)v319)
      goto LABEL_165;
    goto LABEL_180;
  }
LABEL_179:

  if ((_DWORD)v319)
  {
LABEL_165:

    if (!HIDWORD(v319))
      goto LABEL_166;
    goto LABEL_181;
  }
LABEL_180:
  if (!HIDWORD(v319))
  {
LABEL_166:
    if (*(_DWORD *)v320)
      goto LABEL_167;
    goto LABEL_182;
  }
LABEL_181:

  if (*(_DWORD *)v320)
  {
LABEL_167:

    if (!v321)
      goto LABEL_168;
    goto LABEL_183;
  }
LABEL_182:
  if (!v321)
  {
LABEL_168:
    if (!v322)
      goto LABEL_170;
    goto LABEL_169;
  }
LABEL_183:

  if (v322)
LABEL_169:

LABEL_170:
  v48 = __sb__runningInSpringBoard();
  v49 = (uint64_t)&CSQuickActionButtonInsetY;
  if (v48)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v50 = 0;
      v51 = 0;
      goto LABEL_191;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v278 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v278, "userInterfaceIdiom") != 1)
    {
      v51 = 0;
      v50 = 1;
      goto LABEL_191;
    }
  }
  v50 = v48 ^ 1u;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v52 = __sb__runningInSpringBoard();
    if ((_DWORD)v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v279 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v279, "_referenceBounds");
    }
    v51 = v52 ^ 1;
    BSSizeRoundForScale();
    if (v73 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v72 == *(double *)(MEMORY[0x1E0DAB260] + 280))
    {
      v321 = v52 ^ 1;
      v322 = v50;
      memset(v320, 0, sizeof(v320));
      v319 = 0;
      v318 = 0;
      memset(v317, 0, sizeof(v317));
      memset(v316, 0, sizeof(v316));
      v311 = 0;
      v308 = 0;
      v314 = 0;
      v299 = 0;
      v302 = 0;
      v305 = 0;
      v290 = 0;
      v293 = 0;
      v296 = 0;
      v287 = 0;
      v284 = 0;
      v281 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v67 = 0;
      v68 = 0;
      v69 = &qword_1D048FBA8;
      goto LABEL_245;
    }
  }
  else
  {
    v51 = 0;
  }
LABEL_191:
  v53 = __sb__runningInSpringBoard();
  v321 = v51;
  v322 = v50;
  if (v53)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v54 = 0;
      v47 = 0;
      goto LABEL_200;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v277 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v277, "userInterfaceIdiom") != 1)
    {
      v47 = 0;
      v54 = 1;
      goto LABEL_200;
    }
  }
  v54 = v53 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v52 = __sb__runningInSpringBoard();
    if ((_DWORD)v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v269 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v269, "_referenceBounds");
    }
    v47 = v52 ^ 1;
    BSSizeRoundForScale();
    if (v74 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
    {
      *(_QWORD *)v320 = __PAIR64__(v54, v47);
      v319 = 0;
      v318 = 0;
      *(_DWORD *)&v320[8] = 0;
      memset(v317, 0, sizeof(v317));
      memset(v316, 0, sizeof(v316));
      v311 = 0;
      v308 = 0;
      v314 = 0;
      v299 = 0;
      v302 = 0;
      v305 = 0;
      v290 = 0;
      v293 = 0;
      v296 = 0;
      v287 = 0;
      v284 = 0;
      v281 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v67 = 0;
      v68 = 0;
      v69 = &qword_1D048FBD0;
      goto LABEL_245;
    }
  }
  else
  {
    v47 = 0;
  }
LABEL_200:
  v55 = __sb__runningInSpringBoard();
  *(_QWORD *)v320 = __PAIR64__(v54, v47);
  if (v55)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v56 = 0;
      v57 = 0;
      goto LABEL_209;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v276 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v276, "userInterfaceIdiom") != 1)
    {
      v57 = 0;
      v56 = 1;
      goto LABEL_209;
    }
  }
  v56 = v55 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v52 = __sb__runningInSpringBoard();
    if ((_DWORD)v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v268 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v268, "_referenceBounds");
    }
    v57 = v52 ^ 1;
    BSSizeRoundForScale();
    if (v75 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
    {
      LODWORD(v319) = v52 ^ 1;
      HIDWORD(v319) = v56;
      v318 = 0;
      *(_DWORD *)&v320[8] = 0;
      memset(v317, 0, sizeof(v317));
      memset(v316, 0, sizeof(v316));
      v311 = 0;
      v308 = 0;
      v314 = 0;
      v299 = 0;
      v302 = 0;
      v305 = 0;
      v290 = 0;
      v293 = 0;
      v296 = 0;
      v287 = 0;
      v284 = 0;
      v281 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v67 = 0;
      v68 = 0;
      v69 = &qword_1D048FBC0;
      goto LABEL_245;
    }
  }
  else
  {
    v57 = 0;
  }
LABEL_209:
  v58 = __sb__runningInSpringBoard();
  v319 = __PAIR64__(v56, v57);
  if (v58)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v59 = 0;
      v60 = 0;
      goto LABEL_218;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v275 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v275, "userInterfaceIdiom") != 1)
    {
      v60 = 0;
      v59 = 1;
      goto LABEL_218;
    }
  }
  v59 = v58 ^ 1;
  v52 = __sb__runningInSpringBoard();
  if ((_DWORD)v52)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v272 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v272, "_referenceBounds");
  }
  v60 = v52 ^ 1;
  BSSizeRoundForScale();
  if (v61 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    LODWORD(v318) = v52 ^ 1;
    HIDWORD(v318) = v59;
    *(_DWORD *)&v320[8] = 0;
    memset(v317, 0, sizeof(v317));
    memset(v316, 0, sizeof(v316));
    v311 = 0;
    v308 = 0;
    v314 = 0;
    v299 = 0;
    v302 = 0;
    v305 = 0;
    v290 = 0;
    v293 = 0;
    v296 = 0;
    v287 = 0;
    v284 = 0;
    v281 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 0;
    v67 = 0;
    v68 = 0;
    v69 = &qword_1D048FBC8;
    goto LABEL_245;
  }
LABEL_218:
  v62 = __sb__runningInSpringBoard();
  v318 = __PAIR64__(v59, v60);
  if (v62)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v49 = 0;
      *(_DWORD *)&v320[8] = 0;
      goto LABEL_228;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v274 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v274, "userInterfaceIdiom") != 1)
    {
      *(_DWORD *)&v320[8] = 0;
      v49 = 1;
      goto LABEL_228;
    }
  }
  v49 = v62 ^ 1u;
  v52 = __sb__runningInSpringBoard();
  if ((_DWORD)v52)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v270 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v270, "_referenceBounds");
  }
  *(_DWORD *)&v320[8] = v52 ^ 1;
  BSSizeRoundForScale();
  if (v70 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
  {
    *(_DWORD *)&v317[64] = v49;
    memset(v317, 0, 64);
    memset(v316, 0, sizeof(v316));
    v311 = 0;
    v308 = 0;
    v314 = 0;
    v299 = 0;
    v302 = 0;
    v305 = 0;
    v290 = 0;
    v293 = 0;
    v296 = 0;
    v287 = 0;
    v284 = 0;
    v281 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 0;
    v67 = 0;
    v68 = 0;
    v69 = &qword_1D048FBB8;
    goto LABEL_245;
  }
LABEL_228:
  v71 = __sb__runningInSpringBoard();
  *(_DWORD *)&v317[64] = v49;
  if (v71)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_QWORD *)&v317[56] = 0;
      goto LABEL_538;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v273 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v273, "userInterfaceIdiom") != 1)
    {
      *(_DWORD *)&v317[56] = 0;
      *(_DWORD *)&v317[60] = 1;
      goto LABEL_538;
    }
  }
  *(_DWORD *)&v317[60] = v71 ^ 1;
  v52 = __sb__runningInSpringBoard();
  if ((_DWORD)v52)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v267 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v267, "_referenceBounds");
  }
  *(_DWORD *)&v317[56] = v52 ^ 1;
  BSSizeRoundForScale();
  if (v112 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
  {
    memset(v317, 0, 56);
    memset(v316, 0, sizeof(v316));
    v311 = 0;
    v308 = 0;
    v314 = 0;
    v299 = 0;
    v302 = 0;
    v305 = 0;
    v290 = 0;
    v293 = 0;
    v296 = 0;
    v287 = 0;
    v284 = 0;
    v281 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 0;
    v67 = 0;
    v68 = 0;
    v69 = &qword_1D048FBB0;
    goto LABEL_245;
  }
LABEL_538:
  v52 = __sb__runningInSpringBoard();
  if ((_DWORD)v52)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_540;
LABEL_546:
    memset(v317, 0, 52);
    memset(v316, 0, sizeof(v316));
    v311 = 0;
    v308 = 0;
    v314 = 0;
    v299 = 0;
    v302 = 0;
    v305 = 0;
    v290 = 0;
    v293 = 0;
    v296 = 0;
    v287 = 0;
    v284 = 0;
    v281 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 0;
    v67 = 0;
    v68 = 0;
    v69 = &qword_1D048FBA0;
    *(_DWORD *)&v317[52] = v52 ^ 1;
    goto LABEL_245;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v271, "userInterfaceIdiom") == 1)
    goto LABEL_546;
LABEL_540:
  *(_DWORD *)&v317[52] = v52 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_544:
    *(_QWORD *)&v317[40] = 0;
    goto LABEL_597;
  }
  v113 = __sb__runningInSpringBoard();
  if (v113)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_544;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v265 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v265, "userInterfaceIdiom"))
    {
      *(_QWORD *)&v317[40] = 1;
      goto LABEL_597;
    }
  }
  *(_DWORD *)&v317[40] = v113 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v52 = __sb__runningInSpringBoard();
    if ((_DWORD)v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v258 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v258, "_referenceBounds");
    }
    *(_DWORD *)&v317[44] = v52 ^ 1;
    BSSizeRoundForScale();
    if (v123 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
    {
      *(_DWORD *)&v317[48] = 0;
      memset(v317, 0, 40);
      memset(v316, 0, sizeof(v316));
      v311 = 0;
      v308 = 0;
      v314 = 0;
      v299 = 0;
      v302 = 0;
      v305 = 0;
      v290 = 0;
      v293 = 0;
      v296 = 0;
      v287 = 0;
      v284 = 0;
      v281 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v67 = 0;
      v68 = 0;
      v69 = &qword_1D048FB80;
      goto LABEL_245;
    }
  }
  else
  {
    *(_DWORD *)&v317[44] = 0;
  }
LABEL_597:
  v52 = __sb__runningInSpringBoard();
  if ((_DWORD)v52)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v317[48] = 0;
      *(_DWORD *)&v317[36] = 0;
      goto LABEL_607;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v266 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v266, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v317[36] = 0;
      *(_DWORD *)&v317[48] = 1;
      goto LABEL_607;
    }
  }
  *(_DWORD *)&v317[48] = v52 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v52 = __sb__runningInSpringBoard();
    if ((_DWORD)v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v261 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v261, "_referenceBounds");
    }
    *(_DWORD *)&v317[36] = v52 ^ 1;
    BSSizeRoundForScale();
    if (v118 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
      goto LABEL_611;
  }
  else
  {
    *(_DWORD *)&v317[36] = 0;
  }
LABEL_607:
  if ((_SBF_Private_IsD94Like() & 1) != 0)
  {
    memset(v317, 0, 36);
    memset(v316, 0, sizeof(v316));
    v311 = 0;
    v308 = 0;
    v314 = 0;
    v299 = 0;
    v302 = 0;
    v305 = 0;
    v290 = 0;
    v293 = 0;
    v296 = 0;
    v287 = 0;
    v284 = 0;
    v281 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 0;
    v67 = 0;
    v68 = 0;
    v69 = &qword_1D048FB88;
    goto LABEL_245;
  }
LABEL_611:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_615:
    *(_QWORD *)&v317[28] = 0;
    goto LABEL_690;
  }
  v119 = __sb__runningInSpringBoard();
  if (v119)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_615;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v262 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v262, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v317[28] = 0;
      *(_DWORD *)&v317[32] = 1;
      goto LABEL_690;
    }
  }
  *(_DWORD *)&v317[32] = v119 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v52 = __sb__runningInSpringBoard();
    if ((_DWORD)v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v253 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v253, "_referenceBounds");
    }
    *(_DWORD *)&v317[28] = v52 ^ 1;
    BSSizeRoundForScale();
    if (v138 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      memset(v317, 0, 28);
      memset(v316, 0, sizeof(v316));
      v311 = 0;
      v308 = 0;
      v314 = 0;
      v299 = 0;
      v302 = 0;
      v305 = 0;
      v290 = 0;
      v293 = 0;
      v296 = 0;
      v287 = 0;
      v284 = 0;
      v281 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v67 = 0;
      v68 = 0;
      v69 = &qword_1D048FB90;
      goto LABEL_245;
    }
  }
  else
  {
    *(_DWORD *)&v317[28] = 0;
  }
LABEL_690:
  v52 = __sb__runningInSpringBoard();
  if ((_DWORD)v52)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v317[24] = 0;
      *(_DWORD *)&v317[16] = 0;
      goto LABEL_700;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v264 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v264, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v317[16] = 0;
      *(_DWORD *)&v317[24] = 1;
      goto LABEL_700;
    }
  }
  *(_DWORD *)&v317[24] = v52 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v52 = __sb__runningInSpringBoard();
    if ((_DWORD)v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v257 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v257, "_referenceBounds");
    }
    *(_DWORD *)&v317[16] = v52 ^ 1;
    BSSizeRoundForScale();
    if (v128 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_704;
  }
  else
  {
    *(_DWORD *)&v317[16] = 0;
  }
LABEL_700:
  if ((_SBF_Private_IsD64Like() & 1) != 0)
  {
    *(_DWORD *)&v317[20] = 0;
    *(_QWORD *)v317 = 0;
    *(_QWORD *)&v317[8] = 0;
    memset(v316, 0, sizeof(v316));
    v311 = 0;
    v308 = 0;
    v314 = 0;
    v299 = 0;
    v302 = 0;
    v305 = 0;
    v290 = 0;
    v293 = 0;
    v296 = 0;
    v287 = 0;
    v284 = 0;
    v281 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 0;
    v67 = 0;
    v68 = 0;
    v69 = &qword_1D048FB98;
    goto LABEL_245;
  }
LABEL_704:
  v129 = __sb__runningInSpringBoard();
  if (v129)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v317[20] = 0;
      *(_DWORD *)&v317[12] = 0;
      goto LABEL_714;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v263 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v263, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v317[12] = 0;
      *(_DWORD *)&v317[20] = 1;
      goto LABEL_714;
    }
  }
  *(_DWORD *)&v317[20] = v129 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v130 = __sb__runningInSpringBoard();
    if (v130)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v254 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v254, "_referenceBounds");
    }
    v52 = v130 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v317[12] = v52;
    if (v135 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      *(_QWORD *)v317 = 0;
      memset(v316, 0, sizeof(v316));
      *(_DWORD *)&v317[8] = 0;
      v311 = 0;
      v308 = 0;
      v314 = 0;
      v299 = 0;
      v302 = 0;
      v305 = 0;
      v290 = 0;
      v293 = 0;
      v296 = 0;
      v287 = 0;
      v284 = 0;
      v281 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v67 = 0;
      v68 = 0;
      v69 = &qword_1D048FB70;
      goto LABEL_245;
    }
  }
  else
  {
    *(_DWORD *)&v317[12] = 0;
  }
LABEL_714:
  v52 = __sb__runningInSpringBoard();
  if ((_DWORD)v52)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)v317 = 0;
      *(_DWORD *)v316 = 0;
      goto LABEL_764;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v260 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v260, "userInterfaceIdiom"))
    {
      *(_DWORD *)v316 = 0;
      *(_DWORD *)v317 = 1;
      goto LABEL_764;
    }
  }
  *(_DWORD *)v317 = v52 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v52 = __sb__runningInSpringBoard();
    if ((_DWORD)v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v252 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v252, "_referenceBounds");
    }
    *(_DWORD *)v316 = v52 ^ 1;
    BSSizeRoundForScale();
    if (v142 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_800;
  }
  else
  {
    *(_DWORD *)v316 = 0;
  }
LABEL_764:
  if ((_SBF_Private_IsD54() & 1) != 0)
  {
    *(_QWORD *)&v317[4] = 0;
    *(_QWORD *)&v316[4] = 0;
    v311 = 0;
    v308 = 0;
    v314 = 0;
    v299 = 0;
    v302 = 0;
    v305 = 0;
    v290 = 0;
    v293 = 0;
    v296 = 0;
    v287 = 0;
    v284 = 0;
    v281 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 0;
    v67 = 0;
    v68 = 0;
    v69 = &qword_1D048FB78;
    goto LABEL_245;
  }
LABEL_800:
  v143 = __sb__runningInSpringBoard();
  if (v143)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)&v317[4] = 0;
      goto LABEL_828;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v259, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v317[4] = 0;
      *(_DWORD *)&v317[8] = 1;
      goto LABEL_828;
    }
  }
  *(_DWORD *)&v317[8] = v143 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v147 = __sb__runningInSpringBoard();
    if (v147)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v249 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v249, "_referenceBounds");
    }
    v52 = v147 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v317[4] = v52;
    if (v150 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      *(_QWORD *)&v316[4] = 0;
      v311 = 0;
      v308 = 0;
      v314 = 0;
      v299 = 0;
      v302 = 0;
      v305 = 0;
      v290 = 0;
      v293 = 0;
      v296 = 0;
      v287 = 0;
      v284 = 0;
      v281 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v67 = 0;
      v68 = 0;
      v69 = &qword_1D048FB40;
      goto LABEL_245;
    }
  }
  else
  {
    *(_DWORD *)&v317[4] = 0;
  }
LABEL_828:
  v52 = __sb__runningInSpringBoard();
  if ((_DWORD)v52)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)&v316[4] = 0;
      goto LABEL_855;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v256 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v256, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v316[4] = 0;
      *(_DWORD *)&v316[8] = 1;
      goto LABEL_855;
    }
  }
  *(_DWORD *)&v316[8] = v52 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v52 = __sb__runningInSpringBoard();
    if ((_DWORD)v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v248, "_referenceBounds");
    }
    *(_DWORD *)&v316[4] = v52 ^ 1;
    BSSizeRoundForScale();
    if (v154 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_888;
  }
  else
  {
    *(_DWORD *)&v316[4] = 0;
  }
LABEL_855:
  if (_SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
  {
    v311 = 0;
    v308 = 0;
    v314 = 0;
    v299 = 0;
    v302 = 0;
    v305 = 0;
    v290 = 0;
    v293 = 0;
    v296 = 0;
    v287 = 0;
    v284 = 0;
    v281 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 0;
    v67 = 0;
    v68 = 0;
    v69 = &qword_1D048FB48;
    goto LABEL_245;
  }
LABEL_888:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_892:
    v311 = 0;
    v308 = 0;
    goto LABEL_933;
  }
  v155 = __sb__runningInSpringBoard();
  if (v155)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_892;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v251 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v251, "userInterfaceIdiom"))
    {
      v308 = 0;
      v311 = 1;
      goto LABEL_933;
    }
  }
  v311 = v155 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v163 = __sb__runningInSpringBoard();
    if (v163)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v242 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v242, "_referenceBounds");
    }
    v52 = v163 ^ 1u;
    BSSizeRoundForScale();
    v308 = v52;
    if (v174 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
    {
      v314 = 0;
      v299 = 0;
      v302 = 0;
      v305 = 0;
      v290 = 0;
      v293 = 0;
      v296 = 0;
      v287 = 0;
      v284 = 0;
      v281 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v67 = 0;
      v68 = 0;
      v69 = &qword_1D048FB30;
      goto LABEL_245;
    }
  }
  else
  {
    v308 = 0;
  }
LABEL_933:
  v164 = __sb__runningInSpringBoard();
  if (v164)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v314) = 0;
      v52 = 0;
      goto LABEL_943;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v255, "userInterfaceIdiom"))
    {
      v52 = 0;
      HIDWORD(v314) = 1;
      goto LABEL_943;
    }
  }
  HIDWORD(v314) = v164 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v165 = __sb__runningInSpringBoard();
    if (v165)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v245 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v245, "_referenceBounds");
    }
    v52 = v165 ^ 1u;
    BSSizeRoundForScale();
    if (v166 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
      goto LABEL_947;
  }
  else
  {
    v52 = 0;
  }
LABEL_943:
  if ((_SBF_Private_IsD93Like() & 1) != 0)
  {
    LODWORD(v314) = v52;
    v299 = 0;
    v302 = 0;
    v305 = 0;
    v290 = 0;
    v293 = 0;
    v296 = 0;
    v287 = 0;
    v284 = 0;
    v281 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 0;
    v67 = 0;
    v68 = 0;
    v69 = &qword_1D048FB38;
    goto LABEL_245;
  }
LABEL_947:
  LODWORD(v314) = v52;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_951:
    v302 = 0;
    goto LABEL_1026;
  }
  v167 = __sb__runningInSpringBoard();
  if (v167)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_951;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v246 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v246, "userInterfaceIdiom"))
    {
      v302 = 0x100000000;
      goto LABEL_1026;
    }
  }
  HIDWORD(v302) = v167 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v52 = __sb__runningInSpringBoard();
    if ((_DWORD)v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v238, "_referenceBounds");
    }
    LODWORD(v302) = v52 ^ 1;
    BSSizeRoundForScale();
    if (v189 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v305 = 0;
      v296 = 0;
      v299 = 0;
      v290 = 0;
      v293 = 0;
      v287 = 0;
      v284 = 0;
      v281 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v67 = 0;
      v68 = 0;
      v69 = &qword_1D048FB60;
      goto LABEL_245;
    }
  }
  else
  {
    LODWORD(v302) = 0;
  }
LABEL_1026:
  v52 = __sb__runningInSpringBoard();
  if ((_DWORD)v52)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v305 = 0;
      HIDWORD(v299) = 0;
      goto LABEL_1036;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v250, "userInterfaceIdiom"))
    {
      HIDWORD(v299) = 0;
      v305 = 1;
      goto LABEL_1036;
    }
  }
  v305 = v52 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v52 = __sb__runningInSpringBoard();
    if ((_DWORD)v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v241 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v241, "_referenceBounds");
    }
    HIDWORD(v299) = v52 ^ 1;
    BSSizeRoundForScale();
    if (v179 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_1040;
  }
  else
  {
    HIDWORD(v299) = 0;
  }
LABEL_1036:
  if ((_SBF_Private_IsD63Like() & 1) != 0)
  {
    LODWORD(v299) = 0;
    v290 = 0;
    v293 = 0;
    v296 = 0;
    v287 = 0;
    v284 = 0;
    v281 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 0;
    v67 = 0;
    v68 = 0;
    v69 = &qword_1D048FB68;
    goto LABEL_245;
  }
LABEL_1040:
  v180 = __sb__runningInSpringBoard();
  if (v180)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v299) = 0;
      HIDWORD(v290) = 0;
      goto LABEL_1050;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v247 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v247, "userInterfaceIdiom"))
    {
      HIDWORD(v290) = 0;
      LODWORD(v299) = 1;
      goto LABEL_1050;
    }
  }
  LODWORD(v299) = v180 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v181 = __sb__runningInSpringBoard();
    if (v181)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v239, "_referenceBounds");
    }
    v52 = v181 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v290) = v52;
    if (v186 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
    {
      v293 = 0;
      v296 = 0;
      LODWORD(v290) = 0;
      v287 = 0;
      v284 = 0;
      v281 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v67 = 0;
      v68 = 0;
      v69 = &qword_1D048FB50;
      goto LABEL_245;
    }
  }
  else
  {
    HIDWORD(v290) = 0;
  }
LABEL_1050:
  v52 = __sb__runningInSpringBoard();
  if ((_DWORD)v52)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v296 = 0;
      goto LABEL_1100;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v244, "userInterfaceIdiom"))
    {
      v296 = 0x100000000;
      goto LABEL_1100;
    }
  }
  HIDWORD(v296) = v52 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v52 = __sb__runningInSpringBoard();
    if ((_DWORD)v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v237 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v237, "_referenceBounds");
    }
    LODWORD(v296) = v52 ^ 1;
    BSSizeRoundForScale();
    if (v193 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_1136;
  }
  else
  {
    LODWORD(v296) = 0;
  }
LABEL_1100:
  if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
  {
    v293 = 0;
    LODWORD(v290) = 0;
    v287 = 0;
    v284 = 0;
    v281 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 0;
    v67 = 0;
    v68 = 0;
    v69 = &qword_1D048FB58;
    goto LABEL_245;
  }
LABEL_1136:
  v194 = __sb__runningInSpringBoard();
  if (v194)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v293) = 0;
      LODWORD(v290) = 0;
      goto LABEL_1164;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v243 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v243, "userInterfaceIdiom"))
    {
      LODWORD(v290) = 0;
      HIDWORD(v293) = 1;
      goto LABEL_1164;
    }
  }
  HIDWORD(v293) = v194 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v52 = __sb__runningInSpringBoard();
    if ((_DWORD)v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v236 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v236, "_referenceBounds");
    }
    LODWORD(v290) = v52 ^ 1;
    BSSizeRoundForScale();
    if (v202 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v287 = 0;
      LODWORD(v293) = 0;
      v284 = 0;
      v281 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v67 = 0;
      v68 = 0;
      v69 = &qword_1D048FB20;
      goto LABEL_245;
    }
  }
  else
  {
    LODWORD(v290) = 0;
  }
LABEL_1164:
  v197 = __sb__runningInSpringBoard();
  if (v197)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v287 = 0;
      v52 = 0;
      goto LABEL_1190;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v240 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v240, "userInterfaceIdiom"))
    {
      v52 = 0;
      v287 = 1;
      goto LABEL_1190;
    }
  }
  v287 = v197 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v199 = __sb__runningInSpringBoard();
    if (v199)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v235 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v235, "_referenceBounds");
    }
    v52 = v199 ^ 1u;
    BSSizeRoundForScale();
    if (v205 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_1221;
  }
  else
  {
    v52 = 0;
  }
LABEL_1190:
  if ((_SBF_Private_IsD53() & 1) != 0)
  {
    LODWORD(v293) = v52;
    v284 = 0;
    v281 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 0;
    v67 = 0;
    v68 = 0;
    v69 = &qword_1D048FB28;
    goto LABEL_245;
  }
LABEL_1221:
  LODWORD(v293) = v52;
  if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
    v284 = 0;
    v281 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 0;
    v67 = 0;
    v68 = 0;
    v69 = &qword_1D048FB00;
    goto LABEL_245;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
  {
    v284 = 0;
    v281 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 0;
    v67 = 0;
    v68 = 0;
    v69 = &qword_1D048FB08;
    goto LABEL_245;
  }
  if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
    v284 = 0;
    v281 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 0;
    v67 = 0;
    v68 = 0;
    v69 = &qword_1D048FAF0;
    goto LABEL_245;
  }
  if ((_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
  {
    v284 = 0;
    v281 = 0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 0;
    v67 = 0;
    v68 = 0;
    v69 = &qword_1D048FAF8;
    goto LABEL_245;
  }
  v208 = __sb__runningInSpringBoard();
  if (v208)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v284 = 0;
      v281 = 0;
      goto LABEL_1275;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v234, "userInterfaceIdiom"))
    {
      v281 = 0;
      v284 = 1;
      goto LABEL_1275;
    }
  }
  v284 = v208 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v52 = __sb__runningInSpringBoard();
    if ((_DWORD)v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v232, "_referenceBounds");
    }
    v281 = v52 ^ 1;
    BSSizeRoundForScale();
    if (v220 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
    {
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v67 = 0;
      v68 = 0;
      v69 = &qword_1D048FB10;
      goto LABEL_245;
    }
  }
  else
  {
    v281 = 0;
  }
LABEL_1275:
  v52 = __sb__runningInSpringBoard();
  if ((_DWORD)v52)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v63 = 0;
      v64 = 0;
      goto LABEL_1305;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v233 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v233, "userInterfaceIdiom"))
    {
      v64 = 0;
      v63 = 1;
      goto LABEL_1305;
    }
  }
  v63 = v52 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v50 = __sb__runningInSpringBoard();
    if ((_DWORD)v50)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v231 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v231, "_referenceBounds");
    }
    v64 = v50 ^ 1;
    BSSizeRoundForScale();
    if (v223 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
    {
      v65 = 0;
      v66 = 0;
      v67 = 0;
      v68 = 0;
      v69 = &qword_1D048FB18;
      goto LABEL_245;
    }
  }
  else
  {
    v64 = 0;
  }
LABEL_1305:
  v212 = __sb__runningInSpringBoard();
  if (v212)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v65 = 0;
      v66 = 0;
      goto LABEL_1336;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v52 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v52, "userInterfaceIdiom"))
    {
      v66 = 0;
      v65 = 1;
      goto LABEL_1336;
    }
  }
  v65 = v212 ^ 1;
  v50 = __sb__runningInSpringBoard();
  if ((_DWORD)v50)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v49 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v49, "_referenceBounds");
  }
  v66 = v50 ^ 1;
  BSSizeRoundForScale();
  if (v217 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
  {
    v67 = 0;
    v68 = 0;
    v69 = &qword_1D048FAE8;
    goto LABEL_245;
  }
LABEL_1336:
  v50 = __sb__runningInSpringBoard();
  if ((_DWORD)v50)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v67 = 0;
      v68 = 0;
LABEL_1383:
      v69 = &CSQuickActionButtonInsetY;
      goto LABEL_245;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v47 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v47, "userInterfaceIdiom"))
    {
      v68 = 0;
      v67 = 1;
      goto LABEL_1383;
    }
  }
  v67 = v50 ^ 1;
  v227 = __sb__runningInSpringBoard();
  if (v227)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v50 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v50, "_referenceBounds");
  }
  v68 = v227 ^ 1;
  BSSizeRoundForScale();
  if (v228 < *(double *)(MEMORY[0x1E0DAB260] + 40))
    goto LABEL_1383;
  v69 = &qword_1D048FAE0;
LABEL_245:
  v16 = *(double *)v69;
  if (v68)

  if (v67)
  if (v66)

  v76 = *(unsigned int *)v320;
  if (v65)

  if (v64)
  if (v63)

  if (v281)
  if (v284)

  if ((_DWORD)v293)
  if (v287)

  if ((_DWORD)v290)
  if (HIDWORD(v293))

  if ((_DWORD)v296)
  if (HIDWORD(v296))

  if (HIDWORD(v290))
  if ((_DWORD)v299)

  if (HIDWORD(v299))
  if (v305)

  if ((_DWORD)v302)
  if (HIDWORD(v302))

  if ((_DWORD)v314)
  if (HIDWORD(v314))

  if (v308)
  if (v311)

  if (*(_DWORD *)&v316[4])
  if (*(_DWORD *)&v316[8])

  if (*(_DWORD *)&v317[4])
  if (*(_DWORD *)&v317[8])

  if (*(_DWORD *)v316)
  if (*(_DWORD *)v317)

  if (*(_DWORD *)&v317[12])
  if (*(_DWORD *)&v317[20])

  if (*(_DWORD *)&v317[16])
  if (*(_DWORD *)&v317[24])

  if (*(_DWORD *)&v317[28])
  if (*(_DWORD *)&v317[32])

  if (*(_DWORD *)&v317[36])
  if (*(_DWORD *)&v317[48])

  if (*(_DWORD *)&v317[44])
  if (*(_DWORD *)&v317[40])

  if (*(_DWORD *)&v317[52])
  if (*(_DWORD *)&v317[56])

  if (*(_DWORD *)&v317[60])
  if (*(_DWORD *)&v320[8])
  {

    if (!*(_DWORD *)&v317[64])
      goto LABEL_333;
  }
  else if (!*(_DWORD *)&v317[64])
  {
LABEL_333:
    if ((_DWORD)v318)
      goto LABEL_334;
    goto LABEL_344;
  }

  if ((_DWORD)v318)
  {
LABEL_334:

    if (!HIDWORD(v318))
      goto LABEL_335;
    goto LABEL_345;
  }
LABEL_344:
  if (!HIDWORD(v318))
  {
LABEL_335:
    if ((_DWORD)v319)
      goto LABEL_336;
    goto LABEL_346;
  }
LABEL_345:

  if ((_DWORD)v319)
  {
LABEL_336:

    if (!HIDWORD(v319))
      goto LABEL_337;
    goto LABEL_347;
  }
LABEL_346:
  if (!HIDWORD(v319))
  {
LABEL_337:
    if (*(_DWORD *)v320)
      goto LABEL_338;
    goto LABEL_348;
  }
LABEL_347:

  if (*(_DWORD *)v320)
  {
LABEL_338:

    if (!*(_DWORD *)&v320[4])
      goto LABEL_339;
    goto LABEL_349;
  }
LABEL_348:
  if (!*(_DWORD *)&v320[4])
  {
LABEL_339:
    if (v321)
      goto LABEL_340;
LABEL_350:
    if (!v322)
      goto LABEL_352;
    goto LABEL_351;
  }
LABEL_349:

  if (!v321)
    goto LABEL_350;
LABEL_340:

  if (v322)
LABEL_351:

LABEL_352:
  v77 = __sb__runningInSpringBoard();
  v78 = (uint64_t)&CSQuickActionButtonInsetX;
  if (v77)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v79 = 0;
      v80 = 0;
      goto LABEL_361;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v278 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v278, "userInterfaceIdiom") != 1)
    {
      v80 = 0;
      v79 = 1;
      goto LABEL_361;
    }
  }
  v79 = v77 ^ 1u;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v81 = __sb__runningInSpringBoard();
    if ((_DWORD)v81)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v279 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v279, "_referenceBounds");
    }
    v80 = v81 ^ 1;
    BSSizeRoundForScale();
    if (v102 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v101 == *(double *)(MEMORY[0x1E0DAB260] + 280))
    {
      v321 = v81 ^ 1;
      v322 = v79;
      memset(v320, 0, sizeof(v320));
      v319 = 0;
      v318 = 0;
      memset(v317, 0, sizeof(v317));
      memset(v316, 0, sizeof(v316));
      v312 = 0;
      v309 = 0;
      v315 = 0;
      v300 = 0;
      v303 = 0;
      v306 = 0;
      v291 = 0;
      v294 = 0;
      v297 = 0;
      v288 = 0;
      v285 = 0;
      v282 = 0;
      v92 = 0;
      v93 = 0;
      v94 = 0;
      v95 = 0;
      v96 = 0;
      v97 = 0;
      v98 = &qword_1D048FAA8;
      goto LABEL_415;
    }
  }
  else
  {
    v80 = 0;
  }
LABEL_361:
  v82 = __sb__runningInSpringBoard();
  v321 = v80;
  v322 = v79;
  if (v82)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v83 = 0;
      v76 = 0;
      goto LABEL_370;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v277 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v277, "userInterfaceIdiom") != 1)
    {
      v76 = 0;
      v83 = 1;
      goto LABEL_370;
    }
  }
  v83 = v82 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v81 = __sb__runningInSpringBoard();
    if ((_DWORD)v81)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v269 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v269, "_referenceBounds");
    }
    v76 = v81 ^ 1;
    BSSizeRoundForScale();
    if (v103 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
    {
      *(_QWORD *)v320 = __PAIR64__(v83, v76);
      v319 = 0;
      v318 = 0;
      *(_DWORD *)&v320[8] = 0;
      memset(v317, 0, sizeof(v317));
      memset(v316, 0, sizeof(v316));
      v312 = 0;
      v309 = 0;
      v315 = 0;
      v300 = 0;
      v303 = 0;
      v306 = 0;
      v291 = 0;
      v294 = 0;
      v297 = 0;
      v288 = 0;
      v285 = 0;
      v282 = 0;
      v92 = 0;
      v93 = 0;
      v94 = 0;
      v95 = 0;
      v96 = 0;
      v97 = 0;
      v98 = &qword_1D048FAD0;
      goto LABEL_415;
    }
  }
  else
  {
    v76 = 0;
  }
LABEL_370:
  v84 = __sb__runningInSpringBoard();
  *(_QWORD *)v320 = __PAIR64__(v83, v76);
  if (v84)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v85 = 0;
      v86 = 0;
      goto LABEL_379;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v276 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v276, "userInterfaceIdiom") != 1)
    {
      v86 = 0;
      v85 = 1;
      goto LABEL_379;
    }
  }
  v85 = v84 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v81 = __sb__runningInSpringBoard();
    if ((_DWORD)v81)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v268 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v268, "_referenceBounds");
    }
    v86 = v81 ^ 1;
    BSSizeRoundForScale();
    if (v104 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
    {
      LODWORD(v319) = v81 ^ 1;
      HIDWORD(v319) = v85;
      v318 = 0;
      *(_DWORD *)&v320[8] = 0;
      memset(v317, 0, sizeof(v317));
      memset(v316, 0, sizeof(v316));
      v312 = 0;
      v309 = 0;
      v315 = 0;
      v300 = 0;
      v303 = 0;
      v306 = 0;
      v291 = 0;
      v294 = 0;
      v297 = 0;
      v288 = 0;
      v285 = 0;
      v282 = 0;
      v92 = 0;
      v93 = 0;
      v94 = 0;
      v95 = 0;
      v96 = 0;
      v97 = 0;
      v98 = &qword_1D048FAC0;
      goto LABEL_415;
    }
  }
  else
  {
    v86 = 0;
  }
LABEL_379:
  v87 = __sb__runningInSpringBoard();
  v319 = __PAIR64__(v85, v86);
  if (v87)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v88 = 0;
      v89 = 0;
      goto LABEL_388;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v275 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v275, "userInterfaceIdiom") != 1)
    {
      v89 = 0;
      v88 = 1;
      goto LABEL_388;
    }
  }
  v88 = v87 ^ 1;
  v81 = __sb__runningInSpringBoard();
  if ((_DWORD)v81)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v272 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v272, "_referenceBounds");
  }
  v89 = v81 ^ 1;
  BSSizeRoundForScale();
  if (v90 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    LODWORD(v318) = v81 ^ 1;
    HIDWORD(v318) = v88;
    *(_DWORD *)&v320[8] = 0;
    memset(v317, 0, sizeof(v317));
    memset(v316, 0, sizeof(v316));
    v312 = 0;
    v309 = 0;
    v315 = 0;
    v300 = 0;
    v303 = 0;
    v306 = 0;
    v291 = 0;
    v294 = 0;
    v297 = 0;
    v288 = 0;
    v285 = 0;
    v282 = 0;
    v92 = 0;
    v93 = 0;
    v94 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    v98 = &qword_1D048FAC8;
    goto LABEL_415;
  }
LABEL_388:
  v91 = __sb__runningInSpringBoard();
  v318 = __PAIR64__(v88, v89);
  if (v91)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v78 = 0;
      *(_DWORD *)&v320[8] = 0;
      goto LABEL_398;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v274 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v274, "userInterfaceIdiom") != 1)
    {
      *(_DWORD *)&v320[8] = 0;
      v78 = 1;
      goto LABEL_398;
    }
  }
  v78 = v91 ^ 1u;
  v81 = __sb__runningInSpringBoard();
  if ((_DWORD)v81)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v270 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v270, "_referenceBounds");
  }
  *(_DWORD *)&v320[8] = v81 ^ 1;
  BSSizeRoundForScale();
  if (v99 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
  {
    *(_DWORD *)&v317[64] = v78;
    memset(v317, 0, 64);
    memset(v316, 0, sizeof(v316));
    v312 = 0;
    v309 = 0;
    v315 = 0;
    v300 = 0;
    v303 = 0;
    v306 = 0;
    v291 = 0;
    v294 = 0;
    v297 = 0;
    v288 = 0;
    v285 = 0;
    v282 = 0;
    v92 = 0;
    v93 = 0;
    v94 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    v98 = &qword_1D048FAB8;
    goto LABEL_415;
  }
LABEL_398:
  v100 = __sb__runningInSpringBoard();
  *(_DWORD *)&v317[64] = v78;
  if (v100)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_QWORD *)&v317[56] = 0;
      goto LABEL_550;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v273 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v273, "userInterfaceIdiom") != 1)
    {
      *(_DWORD *)&v317[56] = 0;
      *(_DWORD *)&v317[60] = 1;
      goto LABEL_550;
    }
  }
  *(_DWORD *)&v317[60] = v100 ^ 1;
  v81 = __sb__runningInSpringBoard();
  if ((_DWORD)v81)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v267 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v267, "_referenceBounds");
  }
  *(_DWORD *)&v317[56] = v81 ^ 1;
  BSSizeRoundForScale();
  if (v114 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
  {
    memset(v317, 0, 56);
    memset(v316, 0, sizeof(v316));
    v312 = 0;
    v309 = 0;
    v315 = 0;
    v300 = 0;
    v303 = 0;
    v306 = 0;
    v291 = 0;
    v294 = 0;
    v297 = 0;
    v288 = 0;
    v285 = 0;
    v282 = 0;
    v92 = 0;
    v93 = 0;
    v94 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    v98 = &qword_1D048FAB0;
    goto LABEL_415;
  }
LABEL_550:
  v81 = __sb__runningInSpringBoard();
  if ((_DWORD)v81)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_552;
LABEL_558:
    memset(v317, 0, 52);
    memset(v316, 0, sizeof(v316));
    v312 = 0;
    v309 = 0;
    v315 = 0;
    v300 = 0;
    v303 = 0;
    v306 = 0;
    v291 = 0;
    v294 = 0;
    v297 = 0;
    v288 = 0;
    v285 = 0;
    v282 = 0;
    v92 = 0;
    v93 = 0;
    v94 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    v98 = &qword_1D048FAA0;
    *(_DWORD *)&v317[52] = v81 ^ 1;
    goto LABEL_415;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v271, "userInterfaceIdiom") == 1)
    goto LABEL_558;
LABEL_552:
  *(_DWORD *)&v317[52] = v81 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_556:
    *(_QWORD *)&v317[40] = 0;
    goto LABEL_622;
  }
  v115 = __sb__runningInSpringBoard();
  if (v115)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_556;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v265 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v265, "userInterfaceIdiom"))
    {
      *(_QWORD *)&v317[40] = 1;
      goto LABEL_622;
    }
  }
  *(_DWORD *)&v317[40] = v115 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v81 = __sb__runningInSpringBoard();
    if ((_DWORD)v81)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v258 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v258, "_referenceBounds");
    }
    *(_DWORD *)&v317[44] = v81 ^ 1;
    BSSizeRoundForScale();
    if (v124 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
    {
      *(_DWORD *)&v317[48] = 0;
      memset(v317, 0, 40);
      memset(v316, 0, sizeof(v316));
      v312 = 0;
      v309 = 0;
      v315 = 0;
      v300 = 0;
      v303 = 0;
      v306 = 0;
      v291 = 0;
      v294 = 0;
      v297 = 0;
      v288 = 0;
      v285 = 0;
      v282 = 0;
      v92 = 0;
      v93 = 0;
      v94 = 0;
      v95 = 0;
      v96 = 0;
      v97 = 0;
      v98 = &qword_1D048FA80;
      goto LABEL_415;
    }
  }
  else
  {
    *(_DWORD *)&v317[44] = 0;
  }
LABEL_622:
  v81 = __sb__runningInSpringBoard();
  if ((_DWORD)v81)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v317[48] = 0;
      *(_DWORD *)&v317[36] = 0;
      goto LABEL_632;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v266 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v266, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v317[36] = 0;
      *(_DWORD *)&v317[48] = 1;
      goto LABEL_632;
    }
  }
  *(_DWORD *)&v317[48] = v81 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v81 = __sb__runningInSpringBoard();
    if ((_DWORD)v81)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v261 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v261, "_referenceBounds");
    }
    *(_DWORD *)&v317[36] = v81 ^ 1;
    BSSizeRoundForScale();
    if (v120 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
      goto LABEL_636;
  }
  else
  {
    *(_DWORD *)&v317[36] = 0;
  }
LABEL_632:
  if ((_SBF_Private_IsD94Like() & 1) != 0)
  {
    memset(v317, 0, 36);
    memset(v316, 0, sizeof(v316));
    v312 = 0;
    v309 = 0;
    v315 = 0;
    v300 = 0;
    v303 = 0;
    v306 = 0;
    v291 = 0;
    v294 = 0;
    v297 = 0;
    v288 = 0;
    v285 = 0;
    v282 = 0;
    v92 = 0;
    v93 = 0;
    v94 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    v98 = &qword_1D048FA88;
    goto LABEL_415;
  }
LABEL_636:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_640:
    *(_QWORD *)&v317[28] = 0;
    goto LABEL_724;
  }
  v121 = __sb__runningInSpringBoard();
  if (v121)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_640;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v262 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v262, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v317[28] = 0;
      *(_DWORD *)&v317[32] = 1;
      goto LABEL_724;
    }
  }
  *(_DWORD *)&v317[32] = v121 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v81 = __sb__runningInSpringBoard();
    if ((_DWORD)v81)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v253 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v253, "_referenceBounds");
    }
    *(_DWORD *)&v317[28] = v81 ^ 1;
    BSSizeRoundForScale();
    if (v139 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      memset(v317, 0, 28);
      memset(v316, 0, sizeof(v316));
      v312 = 0;
      v309 = 0;
      v315 = 0;
      v300 = 0;
      v303 = 0;
      v306 = 0;
      v291 = 0;
      v294 = 0;
      v297 = 0;
      v288 = 0;
      v285 = 0;
      v282 = 0;
      v92 = 0;
      v93 = 0;
      v94 = 0;
      v95 = 0;
      v96 = 0;
      v97 = 0;
      v98 = &qword_1D048FA90;
      goto LABEL_415;
    }
  }
  else
  {
    *(_DWORD *)&v317[28] = 0;
  }
LABEL_724:
  v81 = __sb__runningInSpringBoard();
  if ((_DWORD)v81)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v317[24] = 0;
      *(_DWORD *)&v317[16] = 0;
      goto LABEL_734;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v264 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v264, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v317[16] = 0;
      *(_DWORD *)&v317[24] = 1;
      goto LABEL_734;
    }
  }
  *(_DWORD *)&v317[24] = v81 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v81 = __sb__runningInSpringBoard();
    if ((_DWORD)v81)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v257 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v257, "_referenceBounds");
    }
    *(_DWORD *)&v317[16] = v81 ^ 1;
    BSSizeRoundForScale();
    if (v131 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_738;
  }
  else
  {
    *(_DWORD *)&v317[16] = 0;
  }
LABEL_734:
  if ((_SBF_Private_IsD64Like() & 1) != 0)
  {
    *(_DWORD *)&v317[20] = 0;
    *(_QWORD *)v317 = 0;
    *(_QWORD *)&v317[8] = 0;
    memset(v316, 0, sizeof(v316));
    v312 = 0;
    v309 = 0;
    v315 = 0;
    v300 = 0;
    v303 = 0;
    v306 = 0;
    v291 = 0;
    v294 = 0;
    v297 = 0;
    v288 = 0;
    v285 = 0;
    v282 = 0;
    v92 = 0;
    v93 = 0;
    v94 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    v98 = &qword_1D048FA98;
    goto LABEL_415;
  }
LABEL_738:
  v132 = __sb__runningInSpringBoard();
  if (v132)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v317[20] = 0;
      *(_DWORD *)&v317[12] = 0;
      goto LABEL_748;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v263 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v263, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v317[12] = 0;
      *(_DWORD *)&v317[20] = 1;
      goto LABEL_748;
    }
  }
  *(_DWORD *)&v317[20] = v132 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v133 = __sb__runningInSpringBoard();
    if (v133)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v254 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v254, "_referenceBounds");
    }
    v81 = v133 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v317[12] = v81;
    if (v136 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      *(_QWORD *)v317 = 0;
      memset(v316, 0, sizeof(v316));
      *(_DWORD *)&v317[8] = 0;
      v312 = 0;
      v309 = 0;
      v315 = 0;
      v300 = 0;
      v303 = 0;
      v306 = 0;
      v291 = 0;
      v294 = 0;
      v297 = 0;
      v288 = 0;
      v285 = 0;
      v282 = 0;
      v92 = 0;
      v93 = 0;
      v94 = 0;
      v95 = 0;
      v96 = 0;
      v97 = 0;
      v98 = &qword_1D048FA70;
      goto LABEL_415;
    }
  }
  else
  {
    *(_DWORD *)&v317[12] = 0;
  }
LABEL_748:
  v81 = __sb__runningInSpringBoard();
  if ((_DWORD)v81)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)v317 = 0;
      *(_DWORD *)v316 = 0;
      goto LABEL_770;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v260 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v260, "userInterfaceIdiom"))
    {
      *(_DWORD *)v316 = 0;
      *(_DWORD *)v317 = 1;
      goto LABEL_770;
    }
  }
  *(_DWORD *)v317 = v81 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v81 = __sb__runningInSpringBoard();
    if ((_DWORD)v81)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v252 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v252, "_referenceBounds");
    }
    *(_DWORD *)v316 = v81 ^ 1;
    BSSizeRoundForScale();
    if (v144 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_808;
  }
  else
  {
    *(_DWORD *)v316 = 0;
  }
LABEL_770:
  if ((_SBF_Private_IsD54() & 1) != 0)
  {
    *(_QWORD *)&v317[4] = 0;
    *(_QWORD *)&v316[4] = 0;
    v312 = 0;
    v309 = 0;
    v315 = 0;
    v300 = 0;
    v303 = 0;
    v306 = 0;
    v291 = 0;
    v294 = 0;
    v297 = 0;
    v288 = 0;
    v285 = 0;
    v282 = 0;
    v92 = 0;
    v93 = 0;
    v94 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    v98 = &qword_1D048FA78;
    goto LABEL_415;
  }
LABEL_808:
  v145 = __sb__runningInSpringBoard();
  if (v145)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)&v317[4] = 0;
      goto LABEL_838;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v259, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v317[4] = 0;
      *(_DWORD *)&v317[8] = 1;
      goto LABEL_838;
    }
  }
  *(_DWORD *)&v317[8] = v145 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v148 = __sb__runningInSpringBoard();
    if (v148)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v249 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v249, "_referenceBounds");
    }
    v81 = v148 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v317[4] = v81;
    if (v151 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      *(_QWORD *)&v316[4] = 0;
      v312 = 0;
      v309 = 0;
      v315 = 0;
      v300 = 0;
      v303 = 0;
      v306 = 0;
      v291 = 0;
      v294 = 0;
      v297 = 0;
      v288 = 0;
      v285 = 0;
      v282 = 0;
      v92 = 0;
      v93 = 0;
      v94 = 0;
      v95 = 0;
      v96 = 0;
      v97 = 0;
      v98 = &qword_1D048FA40;
      goto LABEL_415;
    }
  }
  else
  {
    *(_DWORD *)&v317[4] = 0;
  }
LABEL_838:
  v81 = __sb__runningInSpringBoard();
  if ((_DWORD)v81)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)&v316[4] = 0;
      goto LABEL_862;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v256 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v256, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v316[4] = 0;
      *(_DWORD *)&v316[8] = 1;
      goto LABEL_862;
    }
  }
  *(_DWORD *)&v316[8] = v81 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v81 = __sb__runningInSpringBoard();
    if ((_DWORD)v81)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v248, "_referenceBounds");
    }
    *(_DWORD *)&v316[4] = v81 ^ 1;
    BSSizeRoundForScale();
    if (v156 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_897;
  }
  else
  {
    *(_DWORD *)&v316[4] = 0;
  }
LABEL_862:
  if (_SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
  {
    v312 = 0;
    v309 = 0;
    v315 = 0;
    v300 = 0;
    v303 = 0;
    v306 = 0;
    v291 = 0;
    v294 = 0;
    v297 = 0;
    v288 = 0;
    v285 = 0;
    v282 = 0;
    v92 = 0;
    v93 = 0;
    v94 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    v98 = &qword_1D048FA48;
    goto LABEL_415;
  }
LABEL_897:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_901:
    v312 = 0;
    v309 = 0;
    goto LABEL_958;
  }
  v157 = __sb__runningInSpringBoard();
  if (v157)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_901;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v251 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v251, "userInterfaceIdiom"))
    {
      v309 = 0;
      v312 = 1;
      goto LABEL_958;
    }
  }
  v312 = v157 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v168 = __sb__runningInSpringBoard();
    if (v168)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v242 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v242, "_referenceBounds");
    }
    v81 = v168 ^ 1u;
    BSSizeRoundForScale();
    v309 = v81;
    if (v175 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
    {
      v315 = 0;
      v300 = 0;
      v303 = 0;
      v306 = 0;
      v291 = 0;
      v294 = 0;
      v297 = 0;
      v288 = 0;
      v285 = 0;
      v282 = 0;
      v92 = 0;
      v93 = 0;
      v94 = 0;
      v95 = 0;
      v96 = 0;
      v97 = 0;
      v98 = &qword_1D048FA30;
      goto LABEL_415;
    }
  }
  else
  {
    v309 = 0;
  }
LABEL_958:
  v169 = __sb__runningInSpringBoard();
  if (v169)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v315) = 0;
      v81 = 0;
      goto LABEL_968;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v255, "userInterfaceIdiom"))
    {
      v81 = 0;
      HIDWORD(v315) = 1;
      goto LABEL_968;
    }
  }
  HIDWORD(v315) = v169 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v170 = __sb__runningInSpringBoard();
    if (v170)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v245 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v245, "_referenceBounds");
    }
    v81 = v170 ^ 1u;
    BSSizeRoundForScale();
    if (v171 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
      goto LABEL_972;
  }
  else
  {
    v81 = 0;
  }
LABEL_968:
  if ((_SBF_Private_IsD93Like() & 1) != 0)
  {
    LODWORD(v315) = v81;
    v300 = 0;
    v303 = 0;
    v306 = 0;
    v291 = 0;
    v294 = 0;
    v297 = 0;
    v288 = 0;
    v285 = 0;
    v282 = 0;
    v92 = 0;
    v93 = 0;
    v94 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    v98 = &qword_1D048FA38;
    goto LABEL_415;
  }
LABEL_972:
  LODWORD(v315) = v81;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_976:
    v303 = 0;
    goto LABEL_1060;
  }
  v172 = __sb__runningInSpringBoard();
  if (v172)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_976;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v246 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v246, "userInterfaceIdiom"))
    {
      v303 = 0x100000000;
      goto LABEL_1060;
    }
  }
  HIDWORD(v303) = v172 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v81 = __sb__runningInSpringBoard();
    if ((_DWORD)v81)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v238, "_referenceBounds");
    }
    LODWORD(v303) = v81 ^ 1;
    BSSizeRoundForScale();
    if (v190 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v306 = 0;
      v297 = 0;
      v300 = 0;
      v291 = 0;
      v294 = 0;
      v288 = 0;
      v285 = 0;
      v282 = 0;
      v92 = 0;
      v93 = 0;
      v94 = 0;
      v95 = 0;
      v96 = 0;
      v97 = 0;
      v98 = &qword_1D048FA60;
      goto LABEL_415;
    }
  }
  else
  {
    LODWORD(v303) = 0;
  }
LABEL_1060:
  v81 = __sb__runningInSpringBoard();
  if ((_DWORD)v81)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v306 = 0;
      HIDWORD(v300) = 0;
      goto LABEL_1070;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v250, "userInterfaceIdiom"))
    {
      HIDWORD(v300) = 0;
      v306 = 1;
      goto LABEL_1070;
    }
  }
  v306 = v81 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v81 = __sb__runningInSpringBoard();
    if ((_DWORD)v81)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v241 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v241, "_referenceBounds");
    }
    HIDWORD(v300) = v81 ^ 1;
    BSSizeRoundForScale();
    if (v182 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_1074;
  }
  else
  {
    HIDWORD(v300) = 0;
  }
LABEL_1070:
  if ((_SBF_Private_IsD63Like() & 1) != 0)
  {
    LODWORD(v300) = 0;
    v291 = 0;
    v294 = 0;
    v297 = 0;
    v288 = 0;
    v285 = 0;
    v282 = 0;
    v92 = 0;
    v93 = 0;
    v94 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    v98 = &qword_1D048FA68;
    goto LABEL_415;
  }
LABEL_1074:
  v183 = __sb__runningInSpringBoard();
  if (v183)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v300) = 0;
      HIDWORD(v291) = 0;
      goto LABEL_1084;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v247 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v247, "userInterfaceIdiom"))
    {
      HIDWORD(v291) = 0;
      LODWORD(v300) = 1;
      goto LABEL_1084;
    }
  }
  LODWORD(v300) = v183 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v184 = __sb__runningInSpringBoard();
    if (v184)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v239, "_referenceBounds");
    }
    v81 = v184 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v291) = v81;
    if (v187 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
    {
      v294 = 0;
      v297 = 0;
      LODWORD(v291) = 0;
      v288 = 0;
      v285 = 0;
      v282 = 0;
      v92 = 0;
      v93 = 0;
      v94 = 0;
      v95 = 0;
      v96 = 0;
      v97 = 0;
      v98 = &qword_1D048FA50;
      goto LABEL_415;
    }
  }
  else
  {
    HIDWORD(v291) = 0;
  }
LABEL_1084:
  v81 = __sb__runningInSpringBoard();
  if ((_DWORD)v81)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v297 = 0;
      goto LABEL_1106;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v244, "userInterfaceIdiom"))
    {
      v297 = 0x100000000;
      goto LABEL_1106;
    }
  }
  HIDWORD(v297) = v81 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v81 = __sb__runningInSpringBoard();
    if ((_DWORD)v81)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v237 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v237, "_referenceBounds");
    }
    LODWORD(v297) = v81 ^ 1;
    BSSizeRoundForScale();
    if (v195 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_1144;
  }
  else
  {
    LODWORD(v297) = 0;
  }
LABEL_1106:
  if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
  {
    v294 = 0;
    LODWORD(v291) = 0;
    v288 = 0;
    v285 = 0;
    v282 = 0;
    v92 = 0;
    v93 = 0;
    v94 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    v98 = &qword_1D048FA58;
    goto LABEL_415;
  }
LABEL_1144:
  v196 = __sb__runningInSpringBoard();
  if (v196)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v294) = 0;
      LODWORD(v291) = 0;
      goto LABEL_1174;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v243 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v243, "userInterfaceIdiom"))
    {
      LODWORD(v291) = 0;
      HIDWORD(v294) = 1;
      goto LABEL_1174;
    }
  }
  HIDWORD(v294) = v196 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v81 = __sb__runningInSpringBoard();
    if ((_DWORD)v81)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v236 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v236, "_referenceBounds");
    }
    LODWORD(v291) = v81 ^ 1;
    BSSizeRoundForScale();
    if (v203 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v288 = 0;
      LODWORD(v294) = 0;
      v285 = 0;
      v282 = 0;
      v92 = 0;
      v93 = 0;
      v94 = 0;
      v95 = 0;
      v96 = 0;
      v97 = 0;
      v98 = &qword_1D048FA20;
      goto LABEL_415;
    }
  }
  else
  {
    LODWORD(v291) = 0;
  }
LABEL_1174:
  v198 = __sb__runningInSpringBoard();
  if (v198)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v288 = 0;
      v81 = 0;
      goto LABEL_1196;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v240 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v240, "userInterfaceIdiom"))
    {
      v81 = 0;
      v288 = 1;
      goto LABEL_1196;
    }
  }
  v288 = v198 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v200 = __sb__runningInSpringBoard();
    if (v200)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v235 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v235, "_referenceBounds");
    }
    v81 = v200 ^ 1u;
    BSSizeRoundForScale();
    if (v206 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_1233;
  }
  else
  {
    v81 = 0;
  }
LABEL_1196:
  if ((_SBF_Private_IsD53() & 1) != 0)
  {
    LODWORD(v294) = v81;
    v285 = 0;
    v282 = 0;
    v92 = 0;
    v93 = 0;
    v94 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    v98 = &qword_1D048FA28;
    goto LABEL_415;
  }
LABEL_1233:
  LODWORD(v294) = v81;
  if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
    v285 = 0;
    v282 = 0;
    v92 = 0;
    v93 = 0;
    v94 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    v98 = &qword_1D048FA00;
    goto LABEL_415;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
  {
    v285 = 0;
    v282 = 0;
    v92 = 0;
    v93 = 0;
    v94 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    v98 = &qword_1D048FA08;
    goto LABEL_415;
  }
  if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
    v285 = 0;
    v282 = 0;
    v92 = 0;
    v93 = 0;
    v94 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    v98 = &qword_1D048F9F0;
    goto LABEL_415;
  }
  if ((_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
  {
    v285 = 0;
    v282 = 0;
    v92 = 0;
    v93 = 0;
    v94 = 0;
    v95 = 0;
    v96 = 0;
    v97 = 0;
    v98 = &qword_1D048F9F8;
    goto LABEL_415;
  }
  v209 = __sb__runningInSpringBoard();
  if (v209)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v285 = 0;
      v282 = 0;
      goto LABEL_1285;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v234, "userInterfaceIdiom"))
    {
      v282 = 0;
      v285 = 1;
      goto LABEL_1285;
    }
  }
  v285 = v209 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v81 = __sb__runningInSpringBoard();
    if ((_DWORD)v81)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v232, "_referenceBounds");
    }
    v282 = v81 ^ 1;
    BSSizeRoundForScale();
    if (v221 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
    {
      v92 = 0;
      v93 = 0;
      v94 = 0;
      v95 = 0;
      v96 = 0;
      v97 = 0;
      v98 = &qword_1D048FA10;
      goto LABEL_415;
    }
  }
  else
  {
    v282 = 0;
  }
LABEL_1285:
  v81 = __sb__runningInSpringBoard();
  if ((_DWORD)v81)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v92 = 0;
      v93 = 0;
      goto LABEL_1315;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v233 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v233, "userInterfaceIdiom"))
    {
      v93 = 0;
      v92 = 1;
      goto LABEL_1315;
    }
  }
  v92 = v81 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v79 = __sb__runningInSpringBoard();
    if ((_DWORD)v79)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v231 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v231, "_referenceBounds");
    }
    v93 = v79 ^ 1;
    BSSizeRoundForScale();
    if (v224 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
    {
      v94 = 0;
      v95 = 0;
      v96 = 0;
      v97 = 0;
      v98 = &qword_1D048FA18;
      goto LABEL_415;
    }
  }
  else
  {
    v93 = 0;
  }
LABEL_1315:
  v213 = __sb__runningInSpringBoard();
  if (v213)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v94 = 0;
      v95 = 0;
      goto LABEL_1347;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v81 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v81, "userInterfaceIdiom"))
    {
      v95 = 0;
      v94 = 1;
      goto LABEL_1347;
    }
  }
  v94 = v213 ^ 1;
  v79 = __sb__runningInSpringBoard();
  if ((_DWORD)v79)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v78 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v78, "_referenceBounds");
  }
  v95 = v79 ^ 1;
  BSSizeRoundForScale();
  if (v218 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
  {
    v96 = 0;
    v97 = 0;
    v98 = &qword_1D048F9E8;
    goto LABEL_415;
  }
LABEL_1347:
  v79 = __sb__runningInSpringBoard();
  if ((_DWORD)v79)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v96 = 0;
      v97 = 0;
LABEL_1389:
      v98 = &CSQuickActionButtonInsetX;
      goto LABEL_415;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v76 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v76, "userInterfaceIdiom"))
    {
      v97 = 0;
      v96 = 1;
      goto LABEL_1389;
    }
  }
  v96 = v79 ^ 1;
  v229 = __sb__runningInSpringBoard();
  if (v229)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v79 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v79, "_referenceBounds");
  }
  v97 = v229 ^ 1;
  BSSizeRoundForScale();
  if (v230 < *(double *)(MEMORY[0x1E0DAB260] + 40))
    goto LABEL_1389;
  v98 = &qword_1D048F9E0;
LABEL_415:
  v105 = *(double *)v98;
  if (v97)

  if (v96)
  v6 = v323;
  if (v95)

  if (v94)
  if (v93)

  if (v92)
  if (v282)

  if (v285)
  if ((_DWORD)v294)

  if (v288)
  if ((_DWORD)v291)

  if (HIDWORD(v294))
  if ((_DWORD)v297)

  if (HIDWORD(v297))
  if (HIDWORD(v291))

  if ((_DWORD)v300)
  if (HIDWORD(v300))

  if (v306)
  if ((_DWORD)v303)

  if (HIDWORD(v303))
  if ((_DWORD)v315)

  if (HIDWORD(v315))
  if (v309)

  if (v312)
  if (*(_DWORD *)&v316[4])

  if (*(_DWORD *)&v316[8])
  if (*(_DWORD *)&v317[4])

  if (*(_DWORD *)&v317[8])
  if (*(_DWORD *)v316)

  if (*(_DWORD *)v317)
  if (*(_DWORD *)&v317[12])

  if (*(_DWORD *)&v317[20])
  if (*(_DWORD *)&v317[16])

  if (*(_DWORD *)&v317[24])
  if (*(_DWORD *)&v317[28])

  if (*(_DWORD *)&v317[32])
  if (*(_DWORD *)&v317[36])

  if (*(_DWORD *)&v317[48])
  if (*(_DWORD *)&v317[44])

  if (*(_DWORD *)&v317[40])
  if (*(_DWORD *)&v317[52])

  if (*(_DWORD *)&v317[56])
  if (*(_DWORD *)&v317[60])

  if (*(_DWORD *)&v320[8])
  {

    if (!*(_DWORD *)&v317[64])
      goto LABEL_503;
  }
  else if (!*(_DWORD *)&v317[64])
  {
LABEL_503:
    if ((_DWORD)v318)
      goto LABEL_504;
    goto LABEL_518;
  }

  if ((_DWORD)v318)
  {
LABEL_504:

    if (!HIDWORD(v318))
      goto LABEL_505;
    goto LABEL_519;
  }
LABEL_518:
  if (!HIDWORD(v318))
  {
LABEL_505:
    if ((_DWORD)v319)
      goto LABEL_506;
    goto LABEL_520;
  }
LABEL_519:

  if ((_DWORD)v319)
  {
LABEL_506:

    if (!HIDWORD(v319))
      goto LABEL_507;
LABEL_521:

    if (!*(_DWORD *)v320)
      goto LABEL_509;
    goto LABEL_508;
  }
LABEL_520:
  if (HIDWORD(v319))
    goto LABEL_521;
LABEL_507:
  if (*(_DWORD *)v320)
LABEL_508:

LABEL_509:
  if (*(_DWORD *)&v320[4])

  if (v321)
  v14 = v46 + v16;
  v11 = v46 + v105;
  if (v322)

LABEL_515:
  v106 = v14;
  v107 = v11;
  v108 = v16;
  v109 = v11;
  result.right = v109;
  result.bottom = v108;
  result.left = v107;
  result.top = v106;
  return result;
}

- (void)notificationStructuredListViewController:(id)a3 didUpdateOverlayFooterContentVisibility:(BOOL)a4
{
  -[CSCoverSheetViewControllerBase updateAppearanceForController:](self, "updateAppearanceForController:", self, a4);
}

- (void)notificationStructuredListViewController:(id)a3 requestsPresentingFocusActivityPickerFromView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEBUG))
    -[CSCombinedListViewController notificationStructuredListViewController:requestsPresentingFocusActivityPickerFromView:].cold.1(v6);
  -[CSNotificationAdjunctListViewController focusActivityManager](self->_adjunctListViewController, "focusActivityManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCombinedListViewController coverSheetViewPresenting](self, "coverSheetViewPresenting");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentFocusActivityPickerViewControllerFromView:coverSheetViewPresenting:", v5, v8);

}

- (void)notificationStructuredListViewController:(id)a3 requestsClearingSupplementaryViewControllers:(id)a4
{
  -[CSListItemManager handleRemovedItemsWithContentHosts:](self->_supplementaryItemManager, "handleRemovedItemsWithContentHosts:", a4);
}

- (void)notificationStructuredListViewController:(id)a3 requestsCancelTouches:(BOOL)a4 onSupplementaryViewController:(id)a5
{
  -[CSListItemManager restrictsTouches:onHostedSceneOfContentHost:](self->_supplementaryItemManager, "restrictsTouches:onHostedSceneOfContentHost:", a4, a5);
}

- (void)homeGestureParticipantOwningHomeGestureDidChange:(id)a3 ownsHomeGesture:(BOOL)a4
{
  _BOOL8 v5;
  id WeakRetained;
  id v7;

  if (a4)
  {
    v5 = SBFEffectiveHomeButtonType() == 2;
    WeakRetained = objc_loadWeakRetained((id *)&self->_homeAffordanceController);
    objc_msgSend(WeakRetained, "screenEdgePanGesture");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
    v5 = 0;
  }
  -[NCNotificationStructuredListViewController setHomeAffordanceVisible:](self->_structuredListViewController, "setHomeAffordanceVisible:", v5);
  -[NCNotificationStructuredListViewController setHomeAffordancePanGesture:](self->_structuredListViewController, "setHomeAffordancePanGesture:", v7);

}

- (void)didReceiveRaiseGesture
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_4_0(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1_0(&dword_1D0337000, v1, v4, "%{public}@ received raise gesture", v5);

  OUTLINED_FUNCTION_10();
}

- (int64_t)presentationType
{
  return 1;
}

- (int64_t)presentationPriority
{
  return 4;
}

- (int64_t)presentationTransition
{
  return 1;
}

- (void)coverSheetViewControllerWillPresentPosterSwitcher:(id)a3
{
  id v3;

  -[CSCombinedListViewController supplementaryItemManager](self, "supplementaryItemManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "willPresentPosterSwitcher");

}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  char v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  CSDNDBedtimeGreetingViewController *dndBedtimeGreetingViewController;
  _QWORD v22[5];
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CSCombinedListViewController;
  if (-[CSCoverSheetViewControllerBase handleEvent:](&v23, sel_handleEvent_, v4))
    v5 = objc_msgSend(v4, "isConsumable");
  else
    v5 = 0;
  if ((objc_msgSend(v4, "isConsumable") & 1) == 0)
    -[CSNotificationAdjunctListViewController handleEvent:](self->_adjunctListViewController, "handleEvent:", v4);
  if ((v5 & 1) == 0)
  {
    v6 = 0;
    switch(objc_msgSend(v4, "type"))
    {
      case 1:
        -[CSCoverSheetViewControllerBase activeAppearance](self, "activeAppearance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "legibilitySettings");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        -[CSCombinedListViewController updateForLegibilitySettings:](self, "updateForLegibilitySettings:", v15);
        goto LABEL_35;
      case 5:
        v6 = 0;
        self->_coverSheetWasDismissed = 1;
        goto LABEL_36;
      case 6:
        -[NCNotificationStructuredListViewController dismissModalFullScreenAnimated:](self->_structuredListViewController, "dismissModalFullScreenAnimated:", 0);
        goto LABEL_35;
      case 9:
        v6 = 0;
        self->_homeButtonPressDetected = 0;
        self->_lockButtonPressDetected = 0;
        self->_liftDetected = 0;
        v16 = 1333;
        goto LABEL_40;
      case 10:
        self->_coverSheetResignedActive = 1;
        goto LABEL_25;
      case 11:
        self->_coverSheetResignedActive = 0;
LABEL_25:
        -[CSCombinedListViewController _updateFaceDetectMonitoring](self, "_updateFaceDetectMonitoring");
        goto LABEL_35;
      case 12:
      case 22:
        -[CSCombinedListViewController _dismissDNDBedtimeGreetingViewAnimated:](self, "_dismissDNDBedtimeGreetingViewAnimated:", 1);
        goto LABEL_35;
      case 13:
        objc_msgSend(v4, "value");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "BOOLValue");

        -[NCNotificationStructuredListViewController setDeviceAuthenticated:](self->_structuredListViewController, "setDeviceAuthenticated:", v18);
        if ((v18 & 1) == 0
          && !-[CSCombinedListViewController _allowNotificationsRevealPolicy](self, "_allowNotificationsRevealPolicy"))
        {
          -[NCNotificationStructuredListViewController revealNotificationHistory:animated:](self->_structuredListViewController, "revealNotificationHistory:animated:", 0, 0);
        }
        goto LABEL_35;
      case 24:
        -[CSCombinedListViewController _setScreenOn:](self, "_setScreenOn:", 1);
        if (-[CSCombinedListViewController _hasUserInteraction](self, "_hasUserInteraction"))
        {
          v19 = (void *)*MEMORY[0x1E0DC5F70];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_ERROR))
            -[CSCombinedListViewController handleEvent:].cold.1(v19);
          -[CSCombinedListViewController _removeAllUserInteractionReasons](self, "_removeAllUserInteractionReasons");
        }
        -[CSCombinedListViewController _updateFaceDetectMonitoring](self, "_updateFaceDetectMonitoring");
        -[CSCombinedListViewController _updateDeviceWakeProximitySensorAssertion](self, "_updateDeviceWakeProximitySensorAssertion");
        -[CSCombinedListViewController _updateNotificationLongPressProximitySensorAssertion](self, "_updateNotificationLongPressProximitySensorAssertion");
        -[CSCombinedListViewController _updatePresentation](self, "_updatePresentation");
        -[NCNotificationStructuredListViewController revealNotificationHistory:animated:](self->_structuredListViewController, "revealNotificationHistory:animated:", 0, 0);
        goto LABEL_34;
      case 25:
        -[CSCombinedListViewController _setScreenOn:](self, "_setScreenOn:", 0);
        self->_homeButtonPressDetected = 0;
        self->_lockButtonPressDetected = 0;
        self->_liftDetected = 0;
        self->_historyWasRevealed = 0;
        self->_coverSheetWasDismissed = 0;
        self->_interactingWithNotificationList = 0;
        self->_proximitySensorCoveredSinceWake = self->_hasProximitySensor;
        -[CSCombinedListViewController _updateFaceDetectMonitoring](self, "_updateFaceDetectMonitoring");
        -[CSCombinedListViewController _updateDeviceWakeProximitySensorAssertion](self, "_updateDeviceWakeProximitySensorAssertion");
        -[CSCombinedListViewController _updateNotificationLongPressProximitySensorAssertion](self, "_updateNotificationLongPressProximitySensorAssertion");
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __44__CSCombinedListViewController_handleEvent___block_invoke;
        v22[3] = &unk_1E8E2DB38;
        v22[4] = self;
        -[CSCombinedListViewController _performSelfCorrectingListViewAction:](self, "_performSelfCorrectingListViewAction:", v22);
        objc_msgSend(MEMORY[0x1E0D00F58], "sharedBacklight");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSCombinedListViewController _updateStructuredListOverrideUserInterfaceStyleWithBacklightLuminance:](self, "_updateStructuredListOverrideUserInterfaceStyleWithBacklightLuminance:", -[CSCombinedListViewController _uiBacklightLuminanceForBLSBacklightState:](self, "_uiBacklightLuminanceForBLSBacklightState:", objc_msgSend(v7, "backlightState")));

        -[NCNotificationStructuredListViewController scrollView](self->_structuredListViewController, "scrollView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_scrollToTopIfPossible:", 0);

        -[NCNotificationStructuredListViewController dismissModalFullScreenAnimated:](self->_structuredListViewController, "dismissModalFullScreenAnimated:", 0);
        self->_confirmedNotInPocket = 0;
        -[CSCombinedListViewController _stopScreenOnTimer](self, "_stopScreenOnTimer");
        goto LABEL_35;
      case 26:
        -[NCNotificationStructuredListViewController listViewControllerPresentedByUserAction](self->_structuredListViewController, "listViewControllerPresentedByUserAction");
LABEL_34:
        -[CSCombinedListViewController _startScreenOnTimer](self, "_startScreenOnTimer");
        goto LABEL_35;
      case 27:
        if (-[NCNotificationStructuredListViewController dismissModalFullScreenAnimated:](self->_structuredListViewController, "dismissModalFullScreenAnimated:", 1))
        {
          v9 = (void *)*MEMORY[0x1E0DC5F70];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
          {
            v10 = v9;
            v11 = (objc_class *)objc_opt_class();
            NSStringFromClass(v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v25 = v12;
            _os_log_impl(&dword_1D0337000, v10, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ handled home button tap dismissing long look", buf, 0xCu);

          }
          SBLogDashBoard();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            -[CSCombinedListViewController handleEvent:].cold.2((uint64_t)self, v13);

        }
        else
        {
          dndBedtimeGreetingViewController = self->_dndBedtimeGreetingViewController;
          if (!dndBedtimeGreetingViewController
            || !-[CSDNDBedtimeGreetingViewController handleEvent:](dndBedtimeGreetingViewController, "handleEvent:", v4))
          {
LABEL_35:
            v6 = 0;
            goto LABEL_36;
          }
        }
        break;
      case 35:
        -[NCNotificationStructuredListViewController migrateNotifications](self->_structuredListViewController, "migrateNotifications");
        goto LABEL_35;
      case 36:
        if (-[CSCombinedListViewController _allowNotificationsRevealPolicy](self, "_allowNotificationsRevealPolicy"))
          -[NCNotificationStructuredListViewController revealNotificationHistory:animated:](self->_structuredListViewController, "revealNotificationHistory:animated:", 1, 0);
        v6 = 0;
        v16 = 1370;
LABEL_40:
        *((_BYTE *)&self->super.super.super.super.isa + v16) = 0;
        goto LABEL_36;
      default:
        goto LABEL_36;
    }
  }
  v6 = objc_msgSend(v4, "isConsumable");
LABEL_36:

  return v6;
}

void __44__CSCombinedListViewController_handleEvent___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "revealNotificationHistory:animated:", 0, 0);
  if ((objc_msgSend(MEMORY[0x1E0CEABB0], "areAnimationsEnabled") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "view");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "layoutIfNeeded");
    objc_msgSend(v2, "_removeAllRetargetableAnimations:", 1);

  }
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSCombinedListViewController;
  return -[CSCoverSheetViewControllerBase wouldHandleButtonEvent:](&v4, sel_wouldHandleButtonEvent_, a3);
}

- (id)metadataForTriggeredInteraction:(id)a3
{
  id v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  if (self->_gestureStudyInteraction == a3)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[CSCombinedListViewController deviceOrientationProvider](self, "deviceOrientationProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "rawDeviceOrientationIgnoringOrientationLocks"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CEBF98]);

    -[CSCombinedListViewController proximitySensorProvider](self, "proximitySensorProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isObjectInProximity");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CEBFD0]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_proximitySensorCoveredSinceWake);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CEBFC8]);

    WeakRetained = objc_loadWeakRetained((id *)&self->_authenticationStatusProvider);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(WeakRetained, "isAuthenticated"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CEBF88]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(WeakRetained, "hasPasscodeSet"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CEBFC0]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CSUserPresenceMonitor userPresenceDetectedSinceWake](self->_userPresenceMonitor, "userPresenceDetectedSinceWake"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CEBFA0]);

    if (self->_screenOnTime)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceDate:", self->_screenOnTime);
      v17 = v16;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0CEBFD8]);

    }
    objc_msgSend(MEMORY[0x1E0DA9FC8], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activeWakeSourceDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0CEBFE0]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_liftDetected);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0CEBFB0]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_homeButtonPressDetected);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0CEBFA8]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_lockButtonPressDetected);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0CEBFB8]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_coverSheetWasDismissed);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0CEBF90]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_historyWasRevealed);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0CEBF80]);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)sceneHostEnvironmentEntriesForBacklightSession
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id obj;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[NSMutableDictionary allValues](self->_supplementaryItemContainersByIdentifier, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v4)
  {
    v5 = v4;
    v17 = *(_QWORD *)v23;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v6);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v7, "supplementaryViewControllers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v19;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v19 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v13, "sceneHostEnvironmentEntriesForBacklightSession");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                if (v14)
                  objc_msgSend(v3, "unionSet:", v14);

              }
              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v5);
  }

  return v3;
}

- (void)_performSelfCorrectingListViewAction:(id)a3
{
  _BOOL8 v4;
  uint64_t v5;
  _BOOL8 v6;
  void (**v7)(void);

  v7 = (void (**)(void))a3;
  v4 = (-[NCNotificationStructuredListViewController hasVisibleContent](self->_structuredListViewController, "hasVisibleContent") & 1) != 0|| -[CSNotificationAdjunctListViewController isPresentingTransientContent](self->_adjunctListViewController, "isPresentingTransientContent");
  if (v7)
    v7[2]();
  if (-[NCNotificationStructuredListViewController hasVisibleContent](self->_structuredListViewController, "hasVisibleContent"))
  {
    v5 = 1;
    if (v4)
      goto LABEL_14;
    goto LABEL_13;
  }
  v6 = -[CSNotificationAdjunctListViewController isPresentingTransientContent](self->_adjunctListViewController, "isPresentingTransientContent");
  v5 = v6;
  if (v4 != v6)
  {
    if (v6)
    {
      v5 = 1;
LABEL_13:
      -[CSCombinedListViewController _setListHasContent:](self, "_setListHasContent:", v5);
      goto LABEL_14;
    }
    v5 = 0;
    if (!self->_listDismissingContent)
      goto LABEL_13;
  }
LABEL_14:
  -[CSCombinedListViewController _noteListContentsPotentiallyChangedAfterTransitionFrom:to:](self, "_noteListContentsPotentiallyChangedAfterTransitionFrom:to:", v4, v5);
  -[CSCoverSheetViewControllerBase rebuildAppearance](self, "rebuildAppearance");

}

- (void)_updatePresentation
{
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  double cachedAdjunctHeight;
  double v20;
  double v21;
  double v22;
  id v23;

  -[CSCombinedListViewController _minInsetsToPushDateOffScreen](self, "_minInsetsToPushDateOffScreen");
  v4 = v3;
  if (-[CSCombinedListViewController _shouldPadBottomSpacing](self, "_shouldPadBottomSpacing"))
    v5 = v4;
  else
    v5 = 0.0;
  -[CSLayoutStrategy persistentLayout](self->_layoutStrategy, "persistentLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bottomContentInset");
  v8 = v7;

  v9 = fmax(v5 - v8, 0.0);
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_footerOffset = v9;
    -[CSCombinedListViewController _updateListViewContentInset](self, "_updateListViewContentInset");
    -[CSCombinedListViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNeedsLayout");

  }
  -[CSCombinedListViewController notificationListScrollView](self, "notificationListScrollView");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "contentOffset");
  v12 = v11;
  -[NCNotificationStructuredListViewController scrollViewVisibleContentLayoutOffset](self->_structuredListViewController, "scrollViewVisibleContentLayoutOffset");
  v14 = v13;
  objc_msgSend(v23, "contentInset");
  v16 = -v15;
  v17 = v12 - v14 - v15;
  if (v17 <= v16)
    v17 = v16;
  v18 = v12 >= v16 && v14 <= 0.0;
  cachedAdjunctHeight = self->_cachedAdjunctHeight;
  self->_presentationDirtiedAppearance = 0;
  if (v18)
    v20 = v12;
  else
    v20 = v17;
  -[NSLayoutConstraint setConstant:](self->_adjunctListViewTopConstraint, "setConstant:", -cachedAdjunctHeight);
  -[CSCombinedListViewController _listViewDefaultContentInsets](self, "_listViewDefaultContentInsets");
  v22 = v21;
  if (-[CSCombinedListViewController _allowsDateViewOrProudLockScroll](self, "_allowsDateViewOrProudLockScroll"))
  {
    -[CSCombinedListViewController _listViewAdjustedContentInsets](self, "_listViewAdjustedContentInsets");
    -[CSCombinedListViewController clippingOffset](self, "clippingOffset");
    -[CSCombinedListViewController updateAppearanceForHidden:offset:](self, "updateAppearanceForHidden:offset:", BSFloatGreaterThanOrEqualToFloat(), cachedAdjunctHeight + v20);
  }
  else
  {
    -[CSCombinedListViewController updateAppearanceForHidden:offset:](self, "updateAppearanceForHidden:offset:", 0, 0.0);
  }
  -[CSNotificationAdjunctListViewController setProminentElementHeightToMimic:](self->_adjunctListViewController, "setProminentElementHeightToMimic:", v22 + -8.666666);
  CSUpdateStatusBarBackgroundComponent(self);
  if (self->_presentationDirtiedAppearance)
    -[CSCoverSheetViewControllerBase rebuildAppearance](self, "rebuildAppearance");

}

- (void)_layoutListView
{
  void *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  self->_listBeingLaidOut = 1;
  -[CSCombinedListViewController notificationListViewController](self, "notificationListViewController");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[CSCombinedListViewController notificationListScrollView](self, "notificationListScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCombinedListViewController _suggestedListViewFrame](self, "_suggestedListViewFrame");
  x = v15.origin.x;
  y = v15.origin.y;
  width = v15.size.width;
  height = v15.size.height;
  MinX = CGRectGetMinX(v15);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v9 = CGRectGetWidth(v16);
  -[CSCombinedListViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v11 = CGRectGetHeight(v17);

  -[UIViewController view](self->_captureOnlyMaterialViewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", MinX, 0.0, v9, v11);

  objc_msgSend(v14, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", MinX, 0.0, v9, v11);

  objc_msgSend(v3, "setFrame:", 0.0, 0.0, v9, v11);
  -[CSCombinedListViewController _updateListViewContentInset](self, "_updateListViewContentInset");
  self->_listBeingLaidOut = 0;
  -[CSCombinedListViewController _updatePresentation](self, "_updatePresentation");

}

- (void)_updateListViewContentInset
{
  void *v3;
  uint64_t v4;
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
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  int v21;
  char v22;
  int v23;
  BOOL v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[5];
  BOOL v35;
  _QWORD v36[5];
  id v37;
  uint64_t v38;
  double v39;
  uint64_t v40;

  -[CSCombinedListViewController notificationListScrollView](self, "notificationListScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v33 = v4;
  v6 = v5;
  objc_msgSend(v3, "contentInset");
  v8 = v7;
  -[CSCombinedListViewController _listViewAdjustedContentInsets](self, "_listViewAdjustedContentInsets");
  v10 = v9;
  v12 = v11;
  v14 = v13 + self->_cachedAdjunctHeight;
  v16 = v15 + self->_footerOffset;
  -[CSCombinedListViewController _sanitizedContentOffset:forContentInset:](self, "_sanitizedContentOffset:forContentInset:", v6 - (v14 - v8), v14, v9, v16, v11);
  v32 = v17;
  v18 = BSFloatEqualToFloat();
  v19 = BSFloatEqualToFloat();
  v20 = BSFloatEqualToFloat();
  v21 = BSFloatEqualToFloat();
  if ((objc_msgSend(v3, "isDragging") & 1) != 0)
  {
    objc_msgSend(v3, "setContentInset:", v14, v10, v16, v12);
  }
  else
  {
    v22 = objc_msgSend(v3, "isDecelerating");
    objc_msgSend(v3, "setContentInset:", v14, v10, v16, v12);
    if ((v22 & 1) == 0 && (v19 & v20 & v21 & v18 & 1) == 0)
    {
      v23 = v19 & ~v20 & v21 & v18;
      v24 = -[CSCombinedListViewController _shouldPadBottomSpacing](self, "_shouldPadBottomSpacing");
      v25 = MEMORY[0x1E0C809B0];
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __59__CSCombinedListViewController__updateListViewContentInset__block_invoke;
      v36[3] = &unk_1E8E2F7A8;
      v36[4] = self;
      v26 = v3;
      v37 = v26;
      v38 = v33;
      v39 = v6 - (v14 - v8);
      v40 = v32;
      v27 = (void *)MEMORY[0x1D17E1614](v36);
      if (v23 == 1 && v24)
      {
        objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v27);
      }
      else
      {
        if (v23 && !v24)
          objc_msgSend(v26, "_scrollToTopIfPossible:", 1);
        v28 = (void *)MEMORY[0x1E0CEABB0];
        -[CSNotificationAdjunctListViewController listViewContentAnimationDuration](self->_adjunctListViewController, "listViewContentAnimationDuration");
        v30 = v29;
        -[CSNotificationAdjunctListViewController listViewContentAnimationDampingRatio](self->_adjunctListViewController, "listViewContentAnimationDampingRatio");
        v34[0] = v25;
        v34[1] = 3221225472;
        v34[2] = __59__CSCombinedListViewController__updateListViewContentInset__block_invoke_2;
        v34[3] = &unk_1E8E2F7D0;
        v35 = v24;
        v34[4] = self;
        objc_msgSend(v28, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v27, v34, v30, 0.0, v31, 0.0);
      }

    }
  }

}

uint64_t __59__CSCombinedListViewController__updateListViewContentInset__block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "_integratesAdjunctListIntoFullList") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "setContentOffset:", *(double *)(a1 + 48), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "_updateQuickActionsVisibilityForScrollView:", *(_QWORD *)(a1 + 40));
}

uint64_t __59__CSCombinedListViewController__updateListViewContentInset__block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_updatePresentation");
  return result;
}

- (double)_sanitizedContentOffset:(double)a3 forContentInset:(UIEdgeInsets)a4
{
  double top;
  double v6;
  double v7;
  double v8;
  int v9;
  double result;
  double v11;

  top = a4.top;
  -[CSCombinedListViewController _determineMaxContentOffsetForContentInset:](self, "_determineMaxContentOffsetForContentInset:", a4.top, a4.left, a4.bottom, a4.right);
  v7 = v6;
  v8 = -top;
  v9 = BSFloatGreaterThanFloat();
  if (v7 >= a3)
    result = v7;
  else
    result = a3;
  if (result >= v8)
    result = v8;
  if (v7 <= a3)
    v11 = v7;
  else
    v11 = a3;
  if (v9)
    return v11;
  return result;
}

- (CGPoint)_determineMaxContentOffsetForContentInset:(UIEdgeInsets)a3
{
  double bottom;
  double left;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  bottom = a3.bottom;
  left = a3.left;
  -[CSCombinedListViewController notificationListScrollView](self, "notificationListScrollView", a3.top, a3.left, a3.bottom, a3.right);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationStructuredListViewController effectiveContentSize](self->_structuredListViewController, "effectiveContentSize");
  v8 = v7;
  objc_msgSend(v6, "bounds");
  v10 = bottom + v8 - v9;

  v11 = -left;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (BOOL)_allowNotificationsRevealPolicy
{
  void *v2;
  char v3;

  -[CSCoverSheetViewControllerBase activeBehavior](self, "activeBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "areRestrictedCapabilities:", 0x10000) ^ 1;

  return v3;
}

- (void)_updateCaptureOnlyMaterialView
{
  UIViewController *v3;
  UIViewController *captureOnlyMaterialViewController;
  UIViewController *v5;
  _QWORD v6[5];

  if (!self->_captureOnlyMaterialViewController)
  {
    -[NCNotificationStructuredListViewController captureOnlyMaterialViewController](self->_structuredListViewController, "captureOnlyMaterialViewController");
    v3 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    captureOnlyMaterialViewController = self->_captureOnlyMaterialViewController;
    self->_captureOnlyMaterialViewController = v3;

    v5 = self->_captureOnlyMaterialViewController;
    if (v5)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __62__CSCombinedListViewController__updateCaptureOnlyMaterialView__block_invoke;
      v6[3] = &unk_1E8E2DB60;
      v6[4] = self;
      -[CSCombinedListViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", v5, 0, v6);
    }
  }
}

void __62__CSCombinedListViewController__updateCaptureOnlyMaterialView__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubview:", v3);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

- (void)_setDisableScrolling:(BOOL)a3
{
  if (self->_disableScrolling != a3)
  {
    self->_disableScrolling = a3;
    -[CSCoverSheetViewControllerBase rebuildBehavior](self, "rebuildBehavior");
  }
}

- (void)_setScreenOn:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_screenOn != a3)
  {
    v3 = a3;
    self->_screenOn = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[CSListItemManager allItems](self->_supplementaryItemManager, "allItems", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "contentHost");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "setScreenOn:", v3);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)_updateListItemAppearanceState
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = -[CSCombinedListViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CSListItemManager allItems](self->_supplementaryItemManager, "allItems", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "contentHost");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "setListAppeared:", v3);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)_setDisableBackgroundAnimation:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableSet *backgroundAnimationDisabledReasons;
  NSMutableSet *v8;
  NSMutableSet *v9;
  uint64_t v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  CSComponent *v15;
  CSComponent *homeAffordanceComponent;
  id v17;

  v4 = a3;
  v6 = a4;
  if (v6)
  {
    backgroundAnimationDisabledReasons = self->_backgroundAnimationDisabledReasons;
    v17 = v6;
    if (v4)
    {
      if (!backgroundAnimationDisabledReasons)
      {
        v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        v9 = self->_backgroundAnimationDisabledReasons;
        self->_backgroundAnimationDisabledReasons = v8;

        v6 = v17;
        backgroundAnimationDisabledReasons = self->_backgroundAnimationDisabledReasons;
      }
      -[NSMutableSet addObject:](backgroundAnimationDisabledReasons, "addObject:", v6);
    }
    else
    {
      -[NSMutableSet removeObject:](backgroundAnimationDisabledReasons, "removeObject:", v6);
    }
    v10 = -[NSMutableSet count](self->_backgroundAnimationDisabledReasons, "count");
    v11 = v10 != 0;
    v6 = v17;
    if (self->_disableBackgroundAnimation != v11)
    {
      self->_disableBackgroundAnimation = v11;
      if (v10)
      {
        v12 = (void *)objc_opt_new();
        -[CSCoverSheetViewControllerBase appearanceIdentifier](self, "appearanceIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "suppressTeachableMomentsAnimation:", 1);
        v15 = (CSComponent *)objc_claimAutoreleasedReturnValue();
        homeAffordanceComponent = self->_homeAffordanceComponent;
        self->_homeAffordanceComponent = v15;

      }
      else
      {
        v12 = self->_homeAffordanceComponent;
        self->_homeAffordanceComponent = 0;
      }

      -[CSCoverSheetViewControllerBase rebuildAppearance](self, "rebuildAppearance");
      v6 = v17;
    }
  }

}

- (void)_setFooterCallToActionLabelHidden:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableSet *footerCallToActionHiddenReasons;
  NSMutableSet *v8;
  NSMutableSet *v9;
  uint64_t v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  CSComponent *v15;
  CSComponent *footerCallToActionLabelComponent;
  id v17;

  v4 = a3;
  v6 = a4;
  if (v6)
  {
    footerCallToActionHiddenReasons = self->_footerCallToActionHiddenReasons;
    v17 = v6;
    if (v4)
    {
      if (!footerCallToActionHiddenReasons)
      {
        v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        v9 = self->_footerCallToActionHiddenReasons;
        self->_footerCallToActionHiddenReasons = v8;

        v6 = v17;
        footerCallToActionHiddenReasons = self->_footerCallToActionHiddenReasons;
      }
      -[NSMutableSet addObject:](footerCallToActionHiddenReasons, "addObject:", v6);
    }
    else
    {
      -[NSMutableSet removeObject:](footerCallToActionHiddenReasons, "removeObject:", v6);
    }
    v10 = -[NSMutableSet count](self->_footerCallToActionHiddenReasons, "count");
    v11 = v10 != 0;
    v6 = v17;
    if (self->_footerCallToActionLabelHidden != v11)
    {
      self->_footerCallToActionLabelHidden = v11;
      if (v10)
      {
        +[CSComponent footerCallToActionLabel](CSComponent, "footerCallToActionLabel");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSCoverSheetViewControllerBase appearanceIdentifier](self, "appearanceIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "hidden:", 1);
        v15 = (CSComponent *)objc_claimAutoreleasedReturnValue();
        footerCallToActionLabelComponent = self->_footerCallToActionLabelComponent;
        self->_footerCallToActionLabelComponent = v15;

      }
      else
      {
        v12 = self->_footerCallToActionLabelComponent;
        self->_footerCallToActionLabelComponent = 0;
      }

      -[CSCoverSheetViewControllerBase rebuildAppearance](self, "rebuildAppearance");
      v6 = v17;
    }
  }

}

- (void)_setNotificationListHidden:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableSet *notificationListHiddenReasons;
  NSMutableSet *v8;
  NSMutableSet *v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  id v16;

  v4 = a3;
  v6 = a4;
  if (v6)
  {
    notificationListHiddenReasons = self->_notificationListHiddenReasons;
    v16 = v6;
    if (v4)
    {
      if (!notificationListHiddenReasons)
      {
        v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        v9 = self->_notificationListHiddenReasons;
        self->_notificationListHiddenReasons = v8;

        v6 = v16;
        notificationListHiddenReasons = self->_notificationListHiddenReasons;
      }
      -[NSMutableSet addObject:](notificationListHiddenReasons, "addObject:", v6);
    }
    else
    {
      -[NSMutableSet removeObject:](notificationListHiddenReasons, "removeObject:", v6);
    }
    v10 = -[NSMutableSet count](self->_notificationListHiddenReasons, "count");
    v11 = v10 != 0;
    v6 = v16;
    if (self->_notificationListHidden != v11)
    {
      v12 = v10;
      self->_notificationListHidden = v11;
      -[NCNotificationStructuredListViewController view](self->_structuredListViewController, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = 1.0;
      if (v12)
        v15 = 0.0;
      objc_msgSend(v13, "setAlpha:", v15);

      v6 = v16;
    }
  }

}

- (void)_setDismissGestureDisabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableSet *dismissGestureDisabledReasons;
  NSMutableSet *v8;
  NSMutableSet *v9;
  _BOOL4 v10;
  id v11;

  v4 = a3;
  v6 = a4;
  if (v6)
  {
    dismissGestureDisabledReasons = self->_dismissGestureDisabledReasons;
    v11 = v6;
    if (v4)
    {
      if (!dismissGestureDisabledReasons)
      {
        v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        v9 = self->_dismissGestureDisabledReasons;
        self->_dismissGestureDisabledReasons = v8;

        v6 = v11;
        dismissGestureDisabledReasons = self->_dismissGestureDisabledReasons;
      }
      -[NSMutableSet addObject:](dismissGestureDisabledReasons, "addObject:", v6);
    }
    else
    {
      -[NSMutableSet removeObject:](dismissGestureDisabledReasons, "removeObject:", v6);
    }
    v10 = -[NSMutableSet count](self->_dismissGestureDisabledReasons, "count") != 0;
    v6 = v11;
    if (self->_dismissGestureDisabled != v10)
    {
      self->_dismissGestureDisabled = v10;
      -[CSCoverSheetViewControllerBase rebuildBehavior](self, "rebuildBehavior");
      v6 = v11;
    }
  }

}

- (double)_statusBarHeight
{
  double result;

  objc_msgSend(MEMORY[0x1E0CEA9E8], "heightForStyle:orientation:", 1, -[CSCombinedListViewController interfaceOrientation](self, "interfaceOrientation"));
  return result;
}

- (void)_requestAuthenticationWithCompletion:(id)a3
{
  CSUnlockRequesting **p_unlockRequester;
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  id WeakRetained;

  p_unlockRequester = &self->_unlockRequester;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_unlockRequester);
  objc_msgSend(WeakRetained, "createUnlockRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSource:", 10);
  objc_msgSend(v6, "setIntent:", 2);
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setName:", v8);

  objc_msgSend(v6, "setWantsBiometricPresentation:", 1);
  objc_msgSend(v6, "setConfirmedNotInPocket:", self->_confirmedNotInPocket);
  objc_msgSend(WeakRetained, "unlockWithRequest:completion:", v6, v5);

}

- (BOOL)_isClockSnoozeAlarmNotificationRequest:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_applicationInformer);
  objc_msgSend(v4, "sectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(WeakRetained, "isBundleIdentifierClock:", v6))
  {
    objc_msgSend(v4, "categoryIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("AlarmSnoozeCountdown"));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_updateFaceDetectMonitoring
{
  _BOOL4 v3;
  int v4;
  int v5;
  BOOL v6;
  int v7;
  os_log_t *v8;
  NSObject *v9;
  _BOOL4 screenOn;
  _BOOL4 listPresentingContent;
  _BOOL4 coverSheetWasDismissed;
  _BOOL4 coverSheetResignedActive;
  NSObject *v14;
  NSObject *v15;
  _DWORD v16[2];
  __int16 v17;
  int v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = -[CSUserPresenceMonitor userPresenceDetectedSinceWake](self->_userPresenceMonitor, "userPresenceDetectedSinceWake");
  v4 = -[CSCombinedListViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared");
  v5 = v4;
  v6 = !self->_screenOn || v4 == 0;
  if (v6 || !self->_listPresentingContent || self->_coverSheetWasDismissed)
    v7 = 0;
  else
    v7 = !self->_coverSheetResignedActive && !v3;
  v8 = (os_log_t *)MEMORY[0x1E0DC5F70];
  v9 = *MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    screenOn = self->_screenOn;
    listPresentingContent = self->_listPresentingContent;
    coverSheetWasDismissed = self->_coverSheetWasDismissed;
    coverSheetResignedActive = self->_coverSheetResignedActive;
    v16[0] = 67110656;
    v16[1] = screenOn;
    v17 = 1024;
    v18 = v5;
    v19 = 1024;
    v20 = listPresentingContent;
    v21 = 1024;
    v22 = coverSheetWasDismissed;
    v23 = 1024;
    v24 = coverSheetResignedActive;
    v25 = 1024;
    v26 = v3;
    v27 = 1024;
    v28 = v7;
    _os_log_impl(&dword_1D0337000, v9, OS_LOG_TYPE_DEFAULT, "[Notification Long Press Gesture] Wants face detect monitoring [ screen: %{BOOL}d view: %{BOOL}d notifications: %{BOOL}d pull-down: %{BOOL}d resigned-active: %{BOOL}d user-presence-detetected-since-wake: %{BOOL}d ]: %{BOOL}d", (uint8_t *)v16, 0x2Cu);
  }
  if (v7)
  {
    v14 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16[0]) = 0;
      _os_log_impl(&dword_1D0337000, v14, OS_LOG_TYPE_DEFAULT, "[Notification Long Press Gesture] Monitoring face detection", (uint8_t *)v16, 2u);
    }
    -[CSUserPresenceMonitor enableDetectionForReason:](self->_userPresenceMonitor, "enableDetectionForReason:", CFSTR("CSCombinedListViewController"));
  }
  else if (self->_userPresenceMonitor)
  {
    v15 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16[0]) = 0;
      _os_log_impl(&dword_1D0337000, v15, OS_LOG_TYPE_DEFAULT, "[Notification Long Press Gesture] Stopped monitoring face detection", (uint8_t *)v16, 2u);
    }
    -[CSUserPresenceMonitor disableDetectionForReason:](self->_userPresenceMonitor, "disableDetectionForReason:", CFSTR("CSCombinedListViewController"));
  }
}

- (void)_updateNotificationLongPressProximitySensorAssertion
{
  int v3;
  int v4;
  int v5;
  _BOOL8 v6;
  NSObject *v7;
  _BOOL4 hasProximitySensor;
  _BOOL4 screenOn;
  _BOOL4 listPresentingContent;
  _BOOL4 coverSheetWasDismissed;
  BSInvalidatable *v12;
  BSInvalidatable *notificationLongPressProximitySensorAssertion;
  int v14;
  const __CFString *v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  int v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = -[CSCombinedListViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared");
  v4 = v3;
  v6 = self->_hasProximitySensor
    && (self->_screenOn ? (v5 = v3) : (v5 = 0), v5 == 1 && self->_listPresentingContent)
    && !self->_coverSheetWasDismissed;
  v7 = *MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    hasProximitySensor = self->_hasProximitySensor;
    screenOn = self->_screenOn;
    listPresentingContent = self->_listPresentingContent;
    coverSheetWasDismissed = self->_coverSheetWasDismissed;
    v14 = 138413826;
    v15 = CFSTR("NotificationLongPress");
    v16 = 1024;
    v17 = hasProximitySensor;
    v18 = 1024;
    v19 = screenOn;
    v20 = 1024;
    v21 = v4;
    v22 = 1024;
    v23 = listPresentingContent;
    v24 = 1024;
    v25 = coverSheetWasDismissed;
    v26 = 1024;
    v27 = v6;
    _os_log_impl(&dword_1D0337000, v7, OS_LOG_TYPE_DEFAULT, "[Notification Long Press Gesture] Wants proximity sensor assertion for %@ [ proximity-sensor: %{BOOL}d screen: %{BOOL}d view: %{BOOL}d notifications: %{BOOL}d pull-down: %{BOOL}d ]: %{BOOL}d", (uint8_t *)&v14, 0x30u);
  }
  -[CSCombinedListViewController _updateProximitySensorAssertion:wantsAssertion:forReason:](self, "_updateProximitySensorAssertion:wantsAssertion:forReason:", self->_notificationLongPressProximitySensorAssertion, v6, CFSTR("NotificationLongPress"));
  v12 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  notificationLongPressProximitySensorAssertion = self->_notificationLongPressProximitySensorAssertion;
  self->_notificationLongPressProximitySensorAssertion = v12;

}

- (void)_updateDeviceWakeProximitySensorAssertion
{
  int v3;
  int v4;
  int v5;
  _BOOL8 v6;
  NSObject *v7;
  _BOOL4 hasProximitySensor;
  _BOOL4 screenOn;
  _BOOL4 proximitySensorCoveredSinceWake;
  BSInvalidatable *v11;
  BSInvalidatable *deviceWakeProximitySensorAssertion;
  int v13;
  const __CFString *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  int v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  _BOOL4 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = -[CSCombinedListViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared");
  v4 = v3;
  v6 = self->_hasProximitySensor
    && (self->_screenOn ? (v5 = v3) : (v5 = 0), v5 == 1)
    && self->_proximitySensorCoveredSinceWake;
  v7 = *MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    hasProximitySensor = self->_hasProximitySensor;
    screenOn = self->_screenOn;
    proximitySensorCoveredSinceWake = self->_proximitySensorCoveredSinceWake;
    v13 = 138413570;
    v14 = CFSTR("NotificationDeviceWake");
    v15 = 1024;
    v16 = hasProximitySensor;
    v17 = 1024;
    v18 = screenOn;
    v19 = 1024;
    v20 = v4;
    v21 = 1024;
    v22 = proximitySensorCoveredSinceWake;
    v23 = 1024;
    v24 = v6;
    _os_log_impl(&dword_1D0337000, v7, OS_LOG_TYPE_DEFAULT, "[Notification Long Press Gesture] Wants proximity sensor assertion for %@ [ proximity-sensor: %{BOOL}d screen: %{BOOL}d view: %{BOOL}d covered-since-wake: %{BOOL}d ]: %{BOOL}d", (uint8_t *)&v13, 0x2Au);
  }
  -[CSCombinedListViewController _updateProximitySensorAssertion:wantsAssertion:forReason:](self, "_updateProximitySensorAssertion:wantsAssertion:forReason:", self->_deviceWakeProximitySensorAssertion, v6, CFSTR("NotificationDeviceWake"));
  v11 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  deviceWakeProximitySensorAssertion = self->_deviceWakeProximitySensorAssertion;
  self->_deviceWakeProximitySensorAssertion = v11;

}

- (id)_updateProximitySensorAssertion:(id)a3 wantsAssertion:(BOOL)a4 forReason:(id)a5
{
  _BOOL4 v6;
  id WeakRetained;
  id v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  int v14;
  id v15;
  uint64_t v16;

  v6 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = a3;
  v9 = a5;
  if (!WeakRetained && v6)
  {
    v10 = *MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v9;
      _os_log_impl(&dword_1D0337000, v10, OS_LOG_TYPE_DEFAULT, "[Notification Long Press Gesture] Acquiring proximity sensor assertion for %@", (uint8_t *)&v14, 0xCu);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_proximitySensorProvider);
    objc_msgSend(WeakRetained, "requestProximityMode:forReason:", 13, v9);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_11:

    WeakRetained = (id)v11;
    goto LABEL_12;
  }
  if (WeakRetained && !v6)
  {
    v12 = *MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v9;
      _os_log_impl(&dword_1D0337000, v12, OS_LOG_TYPE_DEFAULT, "[Notification Long Press Gesture] Invalidating proximity sensor assertion for reason %@", (uint8_t *)&v14, 0xCu);
    }
    objc_msgSend(WeakRetained, "invalidate");
    v11 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return WeakRetained;
}

- (void)_homeButtonPressDetected
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = *MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0337000, v3, OS_LOG_TYPE_DEFAULT, "[Notification Long Press Gesture] Home button pressed", v4, 2u);
  }
  self->_homeButtonPressDetected = 1;
}

- (void)_lockButtonPressDetected
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = *MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0337000, v3, OS_LOG_TYPE_DEFAULT, "[Notification Long Press Gesture] Lock button pressed", v4, 2u);
  }
  self->_lockButtonPressDetected = 1;
}

- (void)_liftToWakeGestureDetected
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = *MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0337000, v3, OS_LOG_TYPE_DEFAULT, "[Notification Long Press Gesture] Lift detected", v4, 2u);
  }
  self->_liftDetected = 1;
}

- (void)_tearDownContainerViewForExpandedNotificationContent
{
  NSObject *v3;
  UIView *containerViewForExpandedNotificationContent;
  UIView *v5;
  int v6;
  UIView *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_containerViewForExpandedNotificationContent)
  {
    v3 = *MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      containerViewForExpandedNotificationContent = self->_containerViewForExpandedNotificationContent;
      v6 = 138543362;
      v7 = containerViewForExpandedNotificationContent;
      _os_log_impl(&dword_1D0337000, v3, OS_LOG_TYPE_DEFAULT, "Tearing down container view for expanded notification content: %{public}@", (uint8_t *)&v6, 0xCu);
    }
    -[UIView removeFromSuperview](self->_containerViewForExpandedNotificationContent, "removeFromSuperview");
    v5 = self->_containerViewForExpandedNotificationContent;
    self->_containerViewForExpandedNotificationContent = 0;

  }
}

- (void)_noteListContentsPotentiallyChanged
{
  void *v3;
  id v4;

  -[CSCombinedListViewController _noteVisibleBreakthroughContentPotentiallyChanged](self, "_noteVisibleBreakthroughContentPotentiallyChanged");
  +[CSAction actionWithType:animated:](CSAction, "actionWithType:animated:", 13, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase sendAction:](self, "sendAction:", v3);

  -[CSCombinedListViewController activityItemObserver](self, "activityItemObserver");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "activityItemsMayHaveChanged");
  -[CSCombinedListViewController _updateAudioCategoriesDisablingVolumeHUD](self, "_updateAudioCategoriesDisablingVolumeHUD");

}

- (void)_noteVisibleBreakthroughContentPotentiallyChanged
{
  _BOOL8 v3;
  _BOOL8 v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[NSHashTable count](self->_breakthroughContentObservers, "count"))
  {
    v3 = -[CSCombinedListViewController hasVisibleBreakthroughContent](self, "hasVisibleBreakthroughContent");
    if (self->_hadBreakthroughContent != v3)
    {
      v4 = v3;
      self->_hadBreakthroughContent = v3;
      v10 = 0u;
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      v5 = self->_breakthroughContentObservers;
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v11;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v11 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "combinedListViewController:didChangeVisibleBreakthroughContent:", self, v4, (_QWORD)v10);
          }
          while (v7 != v9);
          v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }

    }
  }
}

- (void)_triggerSignificantUserInteractionIfNeeded
{
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  BSAbsoluteMachTimer *v7;
  BSAbsoluteMachTimer *significantUserInteractionTimer;
  BSAbsoluteMachTimer *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  char v14;
  id buf[2];

  -[CSLockScreenSettings idleTimerSettings](self->_lockScreenSettings, "idleTimerSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "increaseNotificationScrollLogging");

  if (self->_significantUserInteractionTimer)
  {
    if (v4)
    {
      SBLogIdleTimer();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEFAULT, "[SignificantUserInteraction] dropped, timer already active", (uint8_t *)buf, 2u);
      }

    }
  }
  else
  {
    if (v4)
    {
      SBLogIdleTimer();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1D0337000, v6, OS_LOG_TYPE_DEFAULT, "[SignificantUserInteraction] Creating new timer", (uint8_t *)buf, 2u);
      }

    }
    objc_initWeak(buf, self);
    v7 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("CSCombinedListViewController.significantUserInteractionTimer"));
    significantUserInteractionTimer = self->_significantUserInteractionTimer;
    self->_significantUserInteractionTimer = v7;

    v9 = self->_significantUserInteractionTimer;
    v10 = MEMORY[0x1E0C80D38];
    v11 = MEMORY[0x1E0C80D38];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __74__CSCombinedListViewController__triggerSignificantUserInteractionIfNeeded__block_invoke;
    v12[3] = &unk_1E8E2F7F8;
    objc_copyWeak(&v13, buf);
    v14 = v4;
    -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v9, "scheduleWithFireInterval:leewayInterval:queue:handler:", v10, v12, 1.0, 0.0);

    objc_destroyWeak(&v13);
    objc_destroyWeak(buf);
  }
}

void __74__CSCombinedListViewController__triggerSignificantUserInteractionIfNeeded__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  void *v4;
  id v5;
  uint8_t v6[16];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (*(_BYTE *)(a1 + 40))
  {
    SBLogIdleTimer();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D0337000, v3, OS_LOG_TYPE_DEFAULT, "[SignificantUserInteraction] 1s timer fired", v6, 2u);
    }

  }
  if (objc_msgSend(WeakRetained, "participantState") == 2)
  {
    +[CSAction actionWithType:](CSAction, "actionWithType:", 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "sendAction:", v4);

  }
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[138], "invalidate");
    v5 = WeakRetained[138];
    WeakRetained[138] = 0;

  }
}

- (void)_updateAudioCategoriesDisablingVolumeHUD
{
  void *v2;
  uint64_t i;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  void *v10;
  void *v11;
  char isKindOfClass;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  id obj;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  CSCombinedListViewController *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[NSMutableDictionary allValues](self->_supplementaryItemContainersByIdentifier, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
  v2 = 0;
  if (v23)
  {
    v22 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v4, "supplementaryViewControllers");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v25;
          do
          {
            for (j = 0; j != v7; ++j)
            {
              if (*(_QWORD *)v25 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
              objc_opt_self();
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) != 0)
              {
                v13 = v10;
                objc_msgSend(v13, "audioCategoriesDisablingVolumeHUD");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                SBFAudioCategoriesDisablingVolumeHUDUnion();
                v15 = objc_claimAutoreleasedReturnValue();

                v2 = (void *)v15;
              }
            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
          }
          while (v7);
        }

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
    }
    while (v23);
  }

  if ((BSEqualSets() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_audioCategoriesDisablingVolumeHUD, v2);
    SBLogDashBoard();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412802;
      v33 = v17;
      v34 = 2048;
      v35 = self;
      v36 = 2114;
      v37 = v2;
      v18 = v17;
      _os_log_impl(&dword_1D0337000, v16, OS_LOG_TYPE_DEFAULT, "(%@:%p) Updating audioCategoriesDisablingVolumeHUD to '%{public}@'", buf, 0x20u);

    }
    -[CSCombinedListViewController audioCategoriesObserver](self, "audioCategoriesObserver");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "combinedListViewControllerDidUpdateAudioCategoriesDisablingVolumeHUD:", self);

  }
}

- (BOOL)_integratesAdjunctListIntoFullList
{
  return _os_feature_enabled_impl();
}

- (double)clippingOffset
{
  double v2;

  -[CSCombinedListViewController _statusBarHeight](self, "_statusBarHeight");
  return -v2;
}

- (void)updateAppearanceForHidden:(BOOL)a3 offset:(double)a4
{
  _BOOL8 v5;
  _BOOL8 v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  double v14;
  double v15;
  int v16;
  int v17;
  double v18;
  double v19;
  CSComponent *dateViewComponent;
  CSComponent *complicationContainerComponent;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  v5 = a3;
  v7 = -[CSCombinedListViewController _allowsDateViewOrProudLockScroll](self, "_allowsDateViewOrProudLockScroll");
  -[CSCoverSheetViewControllerBase activeAppearance](self, "activeAppearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 1;
  objc_msgSend(v8, "componentForType:property:", 1, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSCoverSheetViewControllerBase activeAppearance](self, "activeAppearance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentForType:property:", 1, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v9 = objc_msgSend(v12, "isHidden") ^ 1;
    v13 = v7;
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v10, "offset");
  if (v15 == 0.0)
    v16 = v9;
  else
    v16 = 1;
  if (v14 == a4)
    v17 = v16;
  else
    v17 = 1;
  -[CSComponent setHidden:](self->_dateViewComponent, "setHidden:", v13);
  v18 = 0.0;
  if (v7)
  {
    -[CSCombinedListViewController topContentInset](self, "topContentInset");
    v18 = v19 + a4;
  }
  v26 = 0u;
  v27 = 0u;
  v25 = 0u;
  CSComponentTransitionInputsMake(0, (uint64_t)&v25, 0.0, 0.0, v18, 0.0, 0.0);
  -[CSComponent setTransitionModifiers:](self->_dateViewComponent, "setTransitionModifiers:", 12);
  dateViewComponent = self->_dateViewComponent;
  v22 = v25;
  v23 = v26;
  v24 = v27;
  -[CSComponent setTransitionInputs:](dateViewComponent, "setTransitionInputs:", &v22);
  -[CSCombinedListViewController _updateProudLockForHidden:scrollOffset:](self, "_updateProudLockForHidden:scrollOffset:", v5, v18);
  -[CSComponent setTransitionModifiers:](self->_complicationContainerComponent, "setTransitionModifiers:", 8);
  complicationContainerComponent = self->_complicationContainerComponent;
  v22 = v25;
  v23 = v26;
  v24 = v27;
  -[CSComponent setTransitionInputs:](complicationContainerComponent, "setTransitionInputs:", &v22);
  if (v17)
    self->_presentationDirtiedAppearance = 1;

}

- (void)_updateProudLockForHidden:(BOOL)a3 scrollOffset:(double)a4
{
  CSComponent *proudLockComponent;
  _BOOL8 v7;
  void *v8;
  void *v9;
  _OWORD v10[3];
  __int128 v11;
  __int128 v12;
  __int128 v13;

  if (a4 <= 0.0)
  {
    -[CSComponent setTransitionModifiers:](self->_proudLockComponent, "setTransitionModifiers:", 0);
    if (!a3)
      goto LABEL_3;
LABEL_5:
    v7 = 1;
    goto LABEL_6;
  }
  v12 = 0u;
  v13 = 0u;
  v11 = 0u;
  CSComponentTransitionInputsMake(0, (uint64_t)&v11, 0.0, 0.0, -a4, 0.0, 0.0);
  -[CSComponent setTransitionModifiers:](self->_proudLockComponent, "setTransitionModifiers:", 8);
  proudLockComponent = self->_proudLockComponent;
  v10[0] = v11;
  v10[1] = v12;
  v10[2] = v13;
  -[CSComponent setTransitionInputs:](proudLockComponent, "setTransitionInputs:", v10);
  if (a3)
    goto LABEL_5;
LABEL_3:
  v7 = -[CSCombinedListViewController _shouldHideProudLockForScroll](self, "_shouldHideProudLockForScroll");
LABEL_6:
  -[CSComponent setHidden:](self->_proudLockComponent, "setHidden:", v7);
  -[CSCoverSheetViewControllerBase activeAppearance](self, "activeAppearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentForType:property:", 11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 || (objc_msgSend(v9, "isHidden") & 1) == 0)
    self->_presentationDirtiedAppearance = 1;

}

- (BOOL)_shouldHideProudLockForScroll
{
  void *v3;

  -[CSCombinedListViewController notificationListScrollView](self, "notificationListScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");

  -[CSCombinedListViewController clippingOffset](self, "clippingOffset");
  return BSFloatGreaterThanOrEqualToFloat();
}

- (double)distanceFromBarToContent
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  double result;

  v3 = SBFEffectiveHomeButtonType();
  if (!__sb__runningInSpringBoard())
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5)
      v6 = 0;
    else
      v6 = v3 == 2;
    if (v6)
      goto LABEL_5;
LABEL_10:
    -[CSLayoutStrategy persistentLayout](self->_layoutStrategy, "persistentLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeLabelBaselineY");
    objc_msgSend(MEMORY[0x1E0DA9E58], "timeFontMetrics");

    goto LABEL_11;
  }
  if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1 || v3 != 2)
    goto LABEL_10;
LABEL_5:
  -[CSCombinedListViewController _listViewAdjustedContentInsets](self, "_listViewAdjustedContentInsets");
LABEL_11:
  -[CSCombinedListViewController _statusBarHeight](self, "_statusBarHeight");
  SBFMainScreenScale();
  BSFloatRoundForScale();
  return result;
}

- (void)updateAppearanceForStatusBarBackgroundHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[CSCoverSheetViewControllerBase activeAppearance](self, "activeAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentForType:property:", 8, 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v6, "isHidden");
  -[CSComponent setHidden:](self->_statusBarBackgroundComponent, "setHidden:", v3);
  if ((_DWORD)v5 != v3)
    self->_presentationDirtiedAppearance = 1;

}

- (CGRect)_suggestedListViewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CSLayoutStrategy *layoutStrategy;
  id WeakRetained;
  void *v9;
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
  double v20;
  double v21;
  CGRect result;

  -[NCNotificationStructuredListViewController insetMargins](self->_structuredListViewController, "insetMargins");
  v4 = v3;
  v6 = v5;
  layoutStrategy = self->_layoutStrategy;
  WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  -[CSCombinedListViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  -[CSLayoutStrategy suggestedFrameForListForPage:bounds:](layoutStrategy, "suggestedFrameForListForPage:bounds:", WeakRetained);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11 - v4;
  v19 = v13 + 0.0;
  v20 = v15 - (-v6 - v4);
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (UIEdgeInsets)_listViewDefaultContentInsets
{
  CSLayoutStrategy *layoutStrategy;
  id WeakRetained;
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
  UIEdgeInsets result;

  layoutStrategy = self->_layoutStrategy;
  WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  -[CSLayoutStrategy suggestedContentInsetsForListForPage:](layoutStrategy, "suggestedContentInsetsForListForPage:", WeakRetained);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (UIEdgeInsets)_listViewAdjustedContentInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  -[CSCombinedListViewController _listViewDefaultContentInsets](self, "_listViewDefaultContentInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[CSCombinedListViewController _allowsNotificationListTopInset](self, "_allowsNotificationListTopInset");
  v12 = 0.0;
  if (v11)
    v12 = v4;
  v13 = v6;
  v14 = v8;
  v15 = v10;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (CGSize)_adjunctListViewSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  if (-[CSCombinedListViewController _allowsSeparateAdjunctList](self, "_allowsSeparateAdjunctList"))
  {
    -[CSNotificationAdjunctListViewController view](self->_adjunctListViewController, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0CEB980], *(double *)(MEMORY[0x1E0CEB980] + 8));
    v5 = v4;
    v7 = v6;

  }
  else
  {
    v5 = *MEMORY[0x1E0C9D820];
    v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)_adjunctListViewSizeIncludingSpacing
{
  double v3;
  double v4;
  double v5;
  double v6;
  _BOOL4 v7;
  double v8;
  int v9;
  double v10;
  double v11;
  CGSize result;

  if (-[CSCombinedListViewController _allowsSeparateAdjunctList](self, "_allowsSeparateAdjunctList"))
  {
    -[CSCombinedListViewController _adjunctListViewSize](self, "_adjunctListViewSize");
    v4 = v3;
    v6 = v5;
    v7 = -[CSNotificationAdjunctListViewController isPresentingContent](self->_adjunctListViewController, "isPresentingContent");
    v8 = 0.0;
    if (v7)
    {
      v9 = BSFloatGreaterThanFloat();
      v8 = 8.0;
      if (!v9)
        v8 = 0.0;
    }
    v10 = v6 + v8;
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D820];
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v11 = v4;
  result.height = v10;
  result.width = v11;
  return result;
}

- (double)_minInsetsToPushDateOffScreen
{
  void *v3;
  double Height;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  CGRect v11;

  -[CSCombinedListViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Height = CGRectGetHeight(v11);

  -[CSCombinedListViewController clippingOffset](self, "clippingOffset");
  v6 = v5;
  -[CSCombinedListViewController notificationListScrollView](self, "notificationListScrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentSize");
  v9 = v8;

  return Height + v6 - v9 - self->_cachedAdjunctHeight;
}

- (BOOL)_shouldPadBottomSpacing
{
  CSCombinedListViewController *v2;
  void *v3;

  v2 = self;
  -[CSCombinedListViewController notificationListScrollView](self, "notificationListScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[CSCombinedListViewController _shouldPadBottomSpacingIsDragging:](v2, "_shouldPadBottomSpacingIsDragging:", objc_msgSend(v3, "isDragging"));

  return (char)v2;
}

- (BOOL)_shouldPadBottomSpacingIsDragging:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  v3 = a3;
  -[CSCombinedListViewController notificationListScrollView](self, "notificationListScrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentSize");

  if (v3)
    return self->_shouldPadBottomSpacingWhileDragging;
  -[CSCombinedListViewController _minListHeightForPadding](self, "_minListHeightForPadding");
  return BSFloatGreaterThanFloat();
}

- (double)_minListHeightForPadding
{
  void *v3;
  double Height;
  double v5;
  double v6;
  double v7;
  CGRect v9;

  -[CSCombinedListViewController notificationListScrollView](self, "notificationListScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Height = CGRectGetHeight(v9);
  -[CSCombinedListViewController _listViewDefaultContentInsets](self, "_listViewDefaultContentInsets");
  v7 = Height - (v5 + v6);

  return v7;
}

- (id)_identifierForNotificationRequest:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v4, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_threadIdentifierForNotificationRequest:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v4, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_allowsDateViewOrProudLockScroll
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  return (v3 & 0xFFFFFFFFFFFFFFFBLL) == 1
      || (unint64_t)(objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation") - 1) < 2;
}

- (BOOL)_hasUserInteraction
{
  return -[NSMutableSet count](self->_hasUserInteractionReasons, "count") != 0;
}

- (void)_removeAllUserInteractionReasons
{
  -[NSMutableSet removeAllObjects](self->_hasUserInteractionReasons, "removeAllObjects");
  -[CSCombinedListViewController _didUpdateSetHasUserInteraction](self, "_didUpdateSetHasUserInteraction");
}

- (void)_setHasUserInteraction:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableSet *hasUserInteractionReasons;
  NSMutableSet *v8;
  NSMutableSet *v9;
  id v10;

  v4 = a3;
  v6 = a4;
  hasUserInteractionReasons = self->_hasUserInteractionReasons;
  v10 = v6;
  if (v4)
  {
    if (hasUserInteractionReasons)
    {
      v8 = hasUserInteractionReasons;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    }
    v9 = self->_hasUserInteractionReasons;
    self->_hasUserInteractionReasons = v8;

    -[NSMutableSet addObject:](self->_hasUserInteractionReasons, "addObject:", v10);
  }
  else
  {
    -[NSMutableSet removeObject:](hasUserInteractionReasons, "removeObject:", v6);
  }
  -[CSCombinedListViewController _didUpdateSetHasUserInteraction](self, "_didUpdateSetHasUserInteraction");

}

- (void)_didUpdateSetHasUserInteraction
{
  -[CSCombinedListViewController _setQuickActionsHidden:forReason:](self, "_setQuickActionsHidden:forReason:", -[CSCombinedListViewController _hasUserInteraction](self, "_hasUserInteraction"), CFSTR("CSQuickActionsUserInteractionReason"));
  -[CSCoverSheetViewControllerBase rebuildBehavior](self, "rebuildBehavior");
}

- (void)_updateRaiseGestureDetectionForNotificationRequest:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4)
    v5 = -[CSCombinedListViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared");
  else
    v5 = 0;
  v6 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEBUG))
    -[CSCombinedListViewController _updateRaiseGestureDetectionForNotificationRequest:].cold.1(v6);
  objc_msgSend(MEMORY[0x1E0DA9E90], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
    objc_msgSend(v7, "addGestureObserver:", self);
  else
    objc_msgSend(v7, "removeGestureObserver:", self);

  -[CSCombinedListViewController setActiveRaiseToListenNotificationRequest:](self, "setActiveRaiseToListenNotificationRequest:", v4);
}

- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(v5, "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSCombinedListViewController _modeIdentifierForDNDState:](self, "_modeIdentifierForDNDState:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "previousState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSCombinedListViewController _modeIdentifierForDNDState:](self, "_modeIdentifierForDNDState:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v9;
    v17 = 2114;
    v18 = v11;
    _os_log_impl(&dword_1D0337000, v7, OS_LOG_TYPE_DEFAULT, "Received DND state update for current mode %{public}@ and previous mode %{public}@", buf, 0x16u);

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__CSCombinedListViewController_stateService_didReceiveDoNotDisturbStateUpdate___block_invoke;
  v13[3] = &unk_1E8E2DC00;
  v13[4] = self;
  v14 = v5;
  v12 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

}

void __79__CSCombinedListViewController_stateService_didReceiveDoNotDisturbStateUpdate___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "state");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_updateActiveDNDState:", v2);

}

- (void)_updateActiveDNDState:(id)a3
{
  DNDState *v4;
  DNDState *activeDNDState;

  v4 = (DNDState *)a3;
  BSDispatchQueueAssertMain();
  activeDNDState = self->_activeDNDState;
  self->_activeDNDState = v4;

  -[CSCombinedListViewController _updateStructuredListOverrideUserInterfaceStyle](self, "_updateStructuredListOverrideUserInterfaceStyle");
}

- (int64_t)_uiBacklightLuminanceForBLSBacklightState:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return -1;
  else
    return qword_1D048F8B8[a3];
}

- (void)_updateStructuredListOverrideUserInterfaceStyle
{
  id v3;

  -[CSCombinedListViewController traitCollection](self, "traitCollection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CSCombinedListViewController _updateStructuredListOverrideUserInterfaceStyleWithBacklightLuminance:](self, "_updateStructuredListOverrideUserInterfaceStyleWithBacklightLuminance:", objc_msgSend(v3, "_backlightLuminance"));

}

- (void)_updateStructuredListOverrideUserInterfaceStyleWithBacklightLuminance:(int64_t)a3
{
  void *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  char v15;

  -[CSCombinedListViewController overrideTraitCollectionForChildViewController:](self, "overrideTraitCollectionForChildViewController:", self->_structuredListViewController);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle") != 2;

  v7 = -[DNDState sb_isDimmingModeActive](self->_activeDNDState, "sb_isDimmingModeActive");
  v8 = a3 == 1 || v7;
  if (((v6 ^ v8) & 1) == 0)
  {
    v9 = objc_msgSend(MEMORY[0x1E0CEABB0], "areAnimationsEnabled");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __102__CSCombinedListViewController__updateStructuredListOverrideUserInterfaceStyleWithBacklightLuminance___block_invoke;
    v14[3] = &unk_1E8E2E190;
    v15 = v8;
    v14[4] = self;
    v10 = MEMORY[0x1D17E1614](v14);
    v11 = (void *)v10;
    if (v9)
    {
      v12 = (void *)MEMORY[0x1E0CEABB0];
      -[CSCombinedListViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "transitionWithView:duration:options:animations:completion:", v13, 5242880, v11, 0, 0.2);

    }
    else
    {
      (*(void (**)(uint64_t))(v10 + 16))(v10);
    }

  }
}

void __102__CSCombinedListViewController__updateStructuredListOverrideUserInterfaceStyleWithBacklightLuminance___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 2);
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  v3 = (id)v2;
  objc_msgSend(*(id *)(a1 + 32), "setOverrideTraitCollection:forChildViewController:", v2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048));
  objc_msgSend(*(id *)(a1 + 32), "setOverrideTraitCollection:forChildViewController:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1200), "setShouldRenderInline:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "updateAppearanceForController:", *(_QWORD *)(a1 + 32));

}

- (void)activeActivityDidChangeForManager:(id)a3
{
  id v4;

  if (self->_focusActivityManager == a3)
  {
    objc_msgSend(a3, "activeActivity");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CSCombinedListViewController _setFooterCallToActionLabelHidden:forReason:](self, "_setFooterCallToActionLabelHidden:forReason:", v4 != 0, CFSTR("Focus Activity"));

  }
}

- (BOOL)_shouldFilterNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "overridesDowntime") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "sectionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CSCombinedListViewController _shouldScreenTimeSuppressNotificationsForBundleIdentifier:](self, "_shouldScreenTimeSuppressNotificationsForBundleIdentifier:", v7);

  }
  return v6;
}

- (BOOL)_shouldScreenTimeSuppressNotificationsForBundleIdentifier:(id)a3
{
  CSApplicationInforming **p_applicationInformer;
  id v4;
  id WeakRetained;
  char v6;

  p_applicationInformer = &self->_applicationInformer;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_applicationInformer);
  v6 = objc_msgSend(WeakRetained, "shouldScreenTimeSuppressNotificationsForBundleIdentifier:", v4);

  return v6;
}

- (void)_screenTimeExpirationApplicationsDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  os_log_t *v11;
  uint64_t i;
  uint64_t v13;
  _BOOL8 v14;
  os_log_t v15;
  _BOOL4 v16;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  __int128 v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v27;
    v11 = (os_log_t *)MEMORY[0x1E0DC5F90];
    *(_QWORD *)&v8 = 138412546;
    v24 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        v14 = -[CSCombinedListViewController _shouldScreenTimeSuppressNotificationsForBundleIdentifier:](self, "_shouldScreenTimeSuppressNotificationsForBundleIdentifier:", v13, v24);
        v15 = *v11;
        v16 = os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT);
        if (v14)
        {
          v17 = v5;
          if (v16)
          {
            v18 = v15;
            v19 = (objc_class *)objc_opt_class();
            NSStringFromClass(v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v24;
            v31 = v20;
            v32 = 2112;
            v33 = v13;
            _os_log_impl(&dword_1D0337000, v18, OS_LOG_TYPE_DEFAULT, "%@ received blocked event for screen time expiration for section: %@", buf, 0x16u);

            v11 = (os_log_t *)MEMORY[0x1E0DC5F90];
            v17 = v5;
          }
        }
        else
        {
          v17 = v6;
          if (v16)
          {
            v21 = v15;
            v22 = (objc_class *)objc_opt_class();
            NSStringFromClass(v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v24;
            v31 = v23;
            v32 = 2112;
            v33 = v13;
            _os_log_impl(&dword_1D0337000, v21, OS_LOG_TYPE_DEFAULT, "%@ received unblocked event for screen time expiration for section: %@", buf, 0x16u);

            v11 = (os_log_t *)MEMORY[0x1E0DC5F90];
            v17 = v6;
          }
        }
        objc_msgSend(v17, "addObject:", v13);
        -[NCNotificationStructuredListViewController toggleFilteringForSectionIdentifier:shouldFilter:](self->_structuredListViewController, "toggleFilteringForSectionIdentifier:shouldFilter:", v13, v14);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v9);
  }

}

- (void)dismissDNDBedtimeGreetingViewController:(id)a3 animated:(BOOL)a4
{
  -[CSCombinedListViewController _dismissDNDBedtimeGreetingViewAnimated:](self, "_dismissDNDBedtimeGreetingViewAnimated:", a4);
}

- (void)_evaluateShouldShowGreeting:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CSDNDBedtimeGreetingViewController *v14;
  CSDNDBedtimeGreetingViewController *dndBedtimeGreetingViewController;
  NSObject *v16;
  CSDNDBedtimeGreetingViewController *v17;
  CSDNDBedtimeGreetingViewController *v18;
  _QWORD v19[5];
  uint8_t buf[4];
  CSDNDBedtimeGreetingViewController *v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation");
  v8 = objc_msgSend(v6, "shouldShowGreeting");
  if (!-[CSCombinedListViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared"))
    goto LABEL_15;
  if ((unint64_t)(v7 - 1) < 2)
  {
LABEL_5:
    v9 = objc_msgSend(v6, "isGreetingDisabled") ^ 1;
    goto LABEL_10;
  }
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
LABEL_15:
      -[CSCombinedListViewController _dismissDNDBedtimeGreetingViewAnimated:](self, "_dismissDNDBedtimeGreetingViewAnimated:", v4);
      goto LABEL_16;
    }
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "userInterfaceIdiom") == 1)
    v9 = objc_msgSend(v6, "isGreetingDisabled") ^ 1;
  else
    v9 = 0;

LABEL_10:
  if ((v8 & v9) != 1)
    goto LABEL_15;
  if (!self->_dndBedtimeGreetingViewController)
  {
    -[CSCoverSheetViewControllerBase activeAppearance](self, "activeAppearance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "legibilitySettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "primaryColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[CSDNDBedtimeGreetingViewController initWithLegibilityPrimaryColor:]([CSDNDBedtimeGreetingViewController alloc], "initWithLegibilityPrimaryColor:", v13);
    dndBedtimeGreetingViewController = self->_dndBedtimeGreetingViewController;
    self->_dndBedtimeGreetingViewController = v14;

    SBLogDoNotDisturbBedtime();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_dndBedtimeGreetingViewController;
      *(_DWORD *)buf = 138543362;
      v21 = v17;
      _os_log_impl(&dword_1D0337000, v16, OS_LOG_TYPE_DEFAULT, "Presenting greeting view: %{public}@", buf, 0xCu);
    }

    v18 = self->_dndBedtimeGreetingViewController;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __69__CSCombinedListViewController__evaluateShouldShowGreeting_animated___block_invoke;
    v19[3] = &unk_1E8E2DB60;
    v19[4] = self;
    -[CSCombinedListViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", v18, v4, v19);

  }
LABEL_16:

}

void __69__CSCombinedListViewController__evaluateShouldShowGreeting_animated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(void);

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1232);
  v7 = a2;
  objc_msgSend(v4, "setDelegate:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_setNotificationListHidden:forReason:", 1, CFSTR("Bedtime Greeting"));
  objc_msgSend(*(id *)(a1 + 32), "_setDisableBackgroundAnimation:forReason:", 1, CFSTR("Bedtime Greeting"));
  objc_msgSend(*(id *)(a1 + 32), "_setFooterCallToActionLabelHidden:forReason:", 1, CFSTR("Bedtime Greeting"));
  v5 = *(void **)(a1 + 32);
  +[CSAction actionWithType:](CSAction, "actionWithType:", 7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendAction:", v6);

  v7[2]();
}

- (void)_dismissDNDBedtimeGreetingViewAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  CSDNDBedtimeGreetingViewController *dndBedtimeGreetingViewController;
  double v7;
  CSDNDBedtimeGreetingViewController *v8;
  _QWORD v9[6];
  BOOL v10;
  uint8_t buf[4];
  CSDNDBedtimeGreetingViewController *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_dndBedtimeGreetingViewController)
  {
    v3 = a3;
    SBLogDoNotDisturbBedtime();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      dndBedtimeGreetingViewController = self->_dndBedtimeGreetingViewController;
      *(_DWORD *)buf = 138543362;
      v12 = dndBedtimeGreetingViewController;
      _os_log_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEFAULT, "Dismissing greeting view: %{public}@", buf, 0xCu);
    }

    v7 = 0.3;
    if (!v3)
      v7 = 0.0;
    v8 = self->_dndBedtimeGreetingViewController;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __71__CSCombinedListViewController__dismissDNDBedtimeGreetingViewAnimated___block_invoke;
    v9[3] = &unk_1E8E2F820;
    *(double *)&v9[5] = v7;
    v9[4] = self;
    v10 = v3;
    -[CSCombinedListViewController bs_removeChildViewController:animated:transitionBlock:](self, "bs_removeChildViewController:animated:transitionBlock:", v8, v3, v9);
  }
}

void __71__CSCombinedListViewController__dismissDNDBedtimeGreetingViewAnimated___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  void (**v4)(_QWORD);
  _QWORD v5[5];
  _QWORD v6[4];
  uint64_t v7;
  char v8;

  v2 = (void *)MEMORY[0x1E0CEABB0];
  v3 = *(double *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__CSCombinedListViewController__dismissDNDBedtimeGreetingViewAnimated___block_invoke_2;
  v6[3] = &unk_1E8E2E190;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_BYTE *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__CSCombinedListViewController__dismissDNDBedtimeGreetingViewAnimated___block_invoke_3;
  v5[3] = &unk_1E8E2DDE0;
  v5[4] = v7;
  v4 = a2;
  objc_msgSend(v2, "animateWithDuration:animations:completion:", v6, v5, v3);
  v4[2](v4);

}

uint64_t __71__CSCombinedListViewController__dismissDNDBedtimeGreetingViewAnimated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  +[CSAction actionWithType:animated:](CSAction, "actionWithType:animated:", 8, *(unsigned __int8 *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendAction:", v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1232), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  return objc_msgSend(*(id *)(a1 + 32), "_setNotificationListHidden:forReason:", 0, CFSTR("Bedtime Greeting"));
}

void __71__CSCombinedListViewController__dismissDNDBedtimeGreetingViewAnimated___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_setDisableBackgroundAnimation:forReason:", 0, CFSTR("Bedtime Greeting"));
  objc_msgSend(*(id *)(a1 + 32), "_setFooterCallToActionLabelHidden:forReason:", 0, CFSTR("Bedtime Greeting"));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1232);
  *(_QWORD *)(v2 + 1232) = 0;

}

- (void)coronaAnimationController:(id)a3 willAnimateCoronaTransitionWithAnimator:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __98__CSCombinedListViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke;
  v4[3] = &unk_1E8E2DB38;
  v4[4] = self;
  objc_msgSend(a4, "addAnimations:", v4);
}

void __98__CSCombinedListViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CEABB0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __98__CSCombinedListViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke_2;
  v7[3] = &unk_1E8E2DC00;
  v8 = v3;
  v9 = v2;
  v5 = v2;
  v6 = v3;
  objc_msgSend(v4, "performWithoutAnimation:", v7);
  objc_msgSend(v5, "pl_performCrossFadeIfNecessary");

}

uint64_t __98__CSCombinedListViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
}

- (void)_setInlineContentHidden:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[CSComponent isHidden](self->_remoteInlineContentComponent, "isHidden") != a3)
  {
    -[CSComponent setHidden:](self->_remoteInlineContentComponent, "setHidden:", v3);
    -[CSCoverSheetViewControllerBase rebuildAppearance](self, "rebuildAppearance");
  }
}

- (void)_setQuickActionsHidden:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  uint64_t v6;
  NSMutableSet *quickActionsHiddenReasons;
  NSMutableSet *v8;
  NSMutableSet *v9;
  NSMutableSet *v10;
  _BOOL8 v11;
  id v12;

  v4 = a3;
  v12 = a4;
  if (v12)
  {
    v6 = -[NSMutableSet count](self->_quickActionsHiddenReasons, "count");
    quickActionsHiddenReasons = self->_quickActionsHiddenReasons;
    if (v4)
    {
      if (!quickActionsHiddenReasons)
      {
        v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        v9 = self->_quickActionsHiddenReasons;
        self->_quickActionsHiddenReasons = v8;

        quickActionsHiddenReasons = self->_quickActionsHiddenReasons;
      }
      -[NSMutableSet addObject:](quickActionsHiddenReasons, "addObject:", v12);
    }
    else
    {
      -[NSMutableSet removeObject:](quickActionsHiddenReasons, "removeObject:", v12);
    }
    v10 = self->_quickActionsHiddenReasons;
    if (v10)
    {
      v11 = -[NSMutableSet count](v10, "count") != 0;
      if ((v6 == 0) != v11)
        goto LABEL_13;
      goto LABEL_12;
    }
    if (v6)
    {
      v11 = 0;
LABEL_12:
      -[CSComponent setHidden:](self->_quickActionsComponent, "setHidden:", v11);
      -[CSCoverSheetViewControllerBase rebuildAppearance](self, "rebuildAppearance");
    }
  }
LABEL_13:

}

- (void)updateForLegibilitySettings:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](self->_legibilitySettings, "sb_isEqualToLegibilitySettings:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[NCNotificationStructuredListViewController adjustForLegibilitySettingsChange:](self->_structuredListViewController, "adjustForLegibilitySettingsChange:", v5);
  }

}

- (id)_modeIdentifierForDNDState:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "activeModeConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_shouldPreventNotificationHistoryRevealForActiveDNDState
{
  DNDState *activeDNDState;

  activeDNDState = self->_activeDNDState;
  if (activeDNDState)
    LOBYTE(activeDNDState) = -[DNDState sb_isDrivingModeActive](activeDNDState, "sb_isDrivingModeActive");
  return (char)activeDNDState;
}

- (void)_toggleGestureStudyInteractionIfNecessary
{
  BOOL v3;
  _UIGestureStudyInteraction *gestureStudyInteraction;
  void *v5;
  _UIGestureStudyInteraction *v6;
  _UIGestureStudyInteraction *v7;
  _UIGestureStudyInteraction *v8;
  id v9;

  v3 = -[CSCombinedListViewController hasContent](self, "hasContent");
  gestureStudyInteraction = self->_gestureStudyInteraction;
  if (v3)
  {
    if (gestureStudyInteraction)
    {
      -[CSCombinedListViewController view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeInteraction:", self->_gestureStudyInteraction);

      v6 = self->_gestureStudyInteraction;
      self->_gestureStudyInteraction = 0;
LABEL_7:

    }
  }
  else if (!gestureStudyInteraction)
  {
    v7 = (_UIGestureStudyInteraction *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAD30]), "initWithDelegate:", self);
    v8 = self->_gestureStudyInteraction;
    self->_gestureStudyInteraction = v7;

    -[CSCombinedListViewController view](self, "view");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addInteraction:", self->_gestureStudyInteraction);
    v6 = (_UIGestureStudyInteraction *)v9;
    goto LABEL_7;
  }
}

- (void)_startScreenOnTimer
{
  NSDate *v3;
  NSDate *screenOnTime;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  screenOnTime = self->_screenOnTime;
  self->_screenOnTime = v3;

}

- (void)_stopScreenOnTimer
{
  NSDate *screenOnTime;

  screenOnTime = self->_screenOnTime;
  self->_screenOnTime = 0;

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  -[CSLockScreenSettings dashBoardNotificationScrollSettings](self->_lockScreenSettings, "dashBoardNotificationScrollSettings", a3, a4);

}

- (void)forceNotificationHistoryRevealed:(BOOL)a3 animated:(BOOL)a4
{
  -[NCNotificationStructuredListViewController revealNotificationHistory:animated:](self->_structuredListViewController, "revealNotificationHistory:animated:", a3, a4);
}

- (void)migrateIncomingNotificationsToNotificationCenter
{
  -[NCNotificationStructuredListViewController migrateNotifications](self->_structuredListViewController, "migrateNotifications");
}

- (id)_testingNotificationRequestWithIdentifier:(id)a3 sectionIdentifier:(id)a4
{
  return (id)-[NCNotificationStructuredListViewController notificationRequestWithNotificationIdentifier:sectionIdentifier:](self->_structuredListViewController, "notificationRequestWithNotificationIdentifier:sectionIdentifier:", a3, a4);
}

- (void)_testingExpandCoalescedBundleForNotificationRequest:(id)a3 withCompletion:(id)a4
{
  -[NCNotificationStructuredListViewController expandGroupForNotificationRequest:withCompletion:](self->_structuredListViewController, "expandGroupForNotificationRequest:withCompletion:", a3, a4);
}

- (void)_testingCoalesceExpandedBundleForNotificationRequest:(id)a3 withCompletion:(id)a4
{
  -[NCNotificationStructuredListViewController collapseGroupForNotificationRequest:withCompletion:](self->_structuredListViewController, "collapseGroupForNotificationRequest:withCompletion:", a3, a4);
}

- (void)_testingClearAllNotificationRequests
{
  void *v3;
  void *v4;
  id v5;

  -[CSCombinedListViewController dispatcher](self, "dispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationSectionSettingsForDestination:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_map:", &__block_literal_global_12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "destination:clearNotificationRequestsInSections:", self, v4);

}

uint64_t __68__CSCombinedListViewController__testingClearAllNotificationRequests__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sectionIdentifier");
}

- (void)setOverrideNotificationListDisplayStyleSetting:(int64_t)a3
{
  -[NCNotificationStructuredListViewController setOverrideNotificationListDisplayStyleSetting:forReason:hideNotificationCount:](self->_structuredListViewController, "setOverrideNotificationListDisplayStyleSetting:forReason:hideNotificationCount:", a3, CFSTR("NCNotificationListDisplayStyleReasonInteractiveTransition"), 0);
}

- (void)resetOverrideNotificationListDisplayStyleSetting
{
  -[NCNotificationStructuredListViewController removeOverrideNotificationListDisplayStyleSettingForReason:](self->_structuredListViewController, "removeOverrideNotificationListDisplayStyleSettingForReason:", CFSTR("NCNotificationListDisplayStyleReasonInteractiveTransition"));
}

- (CSCombinedListViewControllerDelegate)delegate
{
  return (CSCombinedListViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CSApplicationInforming)applicationInformer
{
  return (CSApplicationInforming *)objc_loadWeakRetained((id *)&self->_applicationInformer);
}

- (CSUserPresenceMonitor)userPresenceMonitor
{
  return self->_userPresenceMonitor;
}

- (CSNotificationDispatcher)dispatcher
{
  return (CSNotificationDispatcher *)objc_loadWeakRetained((id *)&self->_dispatcher);
}

- (void)setDispatcher:(id)a3
{
  objc_storeWeak((id *)&self->_dispatcher, a3);
}

- (CSLayoutStrategy)layoutStrategy
{
  return self->_layoutStrategy;
}

- (void)setLayoutStrategy:(id)a3
{
  objc_storeStrong((id *)&self->_layoutStrategy, a3);
}

- (BOOL)isShowingFocusActivityView
{
  return self->_showingFocusActivityView;
}

- (void)setShowingFocusActivityView:(BOOL)a3
{
  self->_showingFocusActivityView = a3;
}

- (CSPageViewControllerProtocol)page
{
  return (CSPageViewControllerProtocol *)objc_loadWeakRetained((id *)&self->_page);
}

- (void)setPage:(id)a3
{
  objc_storeWeak((id *)&self->_page, a3);
}

- (CSScrollablePageViewControllerProtocol)scrollablePage
{
  return (CSScrollablePageViewControllerProtocol *)objc_loadWeakRetained((id *)&self->_scrollablePage);
}

- (void)setScrollablePage:(id)a3
{
  objc_storeWeak((id *)&self->_scrollablePage, a3);
}

- (CSHomeAffordanceControlling)homeAffordanceController
{
  return (CSHomeAffordanceControlling *)objc_loadWeakRetained((id *)&self->_homeAffordanceController);
}

- (void)setHomeAffordanceController:(id)a3
{
  objc_storeWeak((id *)&self->_homeAffordanceController, a3);
}

- (CSPlatterHomeGestureManaging)platterHomeGestureManager
{
  return (CSPlatterHomeGestureManaging *)objc_loadWeakRetained((id *)&self->_platterHomeGestureManager);
}

- (void)setPlatterHomeGestureManager:(id)a3
{
  objc_storeWeak((id *)&self->_platterHomeGestureManager, a3);
}

- (CSUnlockRequesting)unlockRequester
{
  return (CSUnlockRequesting *)objc_loadWeakRetained((id *)&self->_unlockRequester);
}

- (void)setUnlockRequester:(id)a3
{
  objc_storeWeak((id *)&self->_unlockRequester, a3);
}

- (CSNotificationPresenting)notificationPresenter
{
  return (CSNotificationPresenting *)objc_loadWeakRetained((id *)&self->_notificationPresenter);
}

- (void)setNotificationPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_notificationPresenter, a3);
}

- (SBFAuthenticationStatusProvider)authenticationStatusProvider
{
  return (SBFAuthenticationStatusProvider *)objc_loadWeakRetained((id *)&self->_authenticationStatusProvider);
}

- (void)setAuthenticationStatusProvider:(id)a3
{
  objc_storeWeak((id *)&self->_authenticationStatusProvider, a3);
}

- (CSProximitySensorProviding)proximitySensorProvider
{
  return (CSProximitySensorProviding *)objc_loadWeakRetained((id *)&self->_proximitySensorProvider);
}

- (CSDeviceOrientationProviding)deviceOrientationProvider
{
  return (CSDeviceOrientationProviding *)objc_loadWeakRetained((id *)&self->_deviceOrientationProvider);
}

- (void)setDeviceOrientationProvider:(id)a3
{
  objc_storeWeak((id *)&self->_deviceOrientationProvider, a3);
}

- (CSRemoteContentInlineProviding)remoteContentInlineProvider
{
  return (CSRemoteContentInlineProviding *)objc_loadWeakRetained((id *)&self->_remoteContentInlineProvider);
}

- (CSCoverSheetViewPresenting)coverSheetViewPresenting
{
  return (CSCoverSheetViewPresenting *)objc_loadWeakRetained((id *)&self->_coverSheetViewPresenting);
}

- (void)setCoverSheetViewPresenting:(id)a3
{
  objc_storeWeak((id *)&self->_coverSheetViewPresenting, a3);
}

- (CSCoverSheetGestureHandling)coverSheetGestureHandling
{
  return (CSCoverSheetGestureHandling *)objc_loadWeakRetained((id *)&self->_coverSheetGestureHandling);
}

- (void)setCoverSheetGestureHandling:(id)a3
{
  objc_storeWeak((id *)&self->_coverSheetGestureHandling, a3);
}

- (CSActivityItemObserving)activityItemObserver
{
  return (CSActivityItemObserving *)objc_loadWeakRetained((id *)&self->_activityItemObserver);
}

- (void)setActivityItemObserver:(id)a3
{
  objc_storeWeak((id *)&self->_activityItemObserver, a3);
}

- (BOOL)showNotificationsInAlwaysOn
{
  return self->_showNotificationsInAlwaysOn;
}

- (BOOL)isInteractingWithNotificationList
{
  return self->_interactingWithNotificationList;
}

- (void)setNotificationObserver:(id)a3
{
  objc_storeWeak((id *)&self->_notificationObserver, a3);
}

- (NSSet)audioCategoriesDisablingVolumeHUD
{
  return self->_audioCategoriesDisablingVolumeHUD;
}

- (CSCombinedListViewControllerAudioCategoriesObserver)audioCategoriesObserver
{
  return (CSCombinedListViewControllerAudioCategoriesObserver *)objc_loadWeakRetained((id *)&self->_audioCategoriesObserver);
}

- (void)setAudioCategoriesObserver:(id)a3
{
  objc_storeWeak((id *)&self->_audioCategoriesObserver, a3);
}

- (CSNotificationAdjunctListViewController)adjunctListViewController
{
  return self->_adjunctListViewController;
}

- (void)setAdjunctListViewController:(id)a3
{
  objc_storeStrong((id *)&self->_adjunctListViewController, a3);
}

- (CSListItemManager)supplementaryItemManager
{
  return self->_supplementaryItemManager;
}

- (void)setSupplementaryItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryItemManager, a3);
}

- (NSMutableDictionary)adjunctViewControllersByIdentifier
{
  return self->_adjunctViewControllersByIdentifier;
}

- (void)setAdjunctViewControllersByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_adjunctViewControllersByIdentifier, a3);
}

- (NSMutableDictionary)supplementaryItemContainersByIdentifier
{
  return self->_supplementaryItemContainersByIdentifier;
}

- (void)setSupplementaryItemContainersByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryItemContainersByIdentifier, a3);
}

- (NSLayoutConstraint)adjunctListViewTopConstraint
{
  return self->_adjunctListViewTopConstraint;
}

- (void)setAdjunctListViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_adjunctListViewTopConstraint, a3);
}

- (NCNotificationRequest)activeRaiseToListenNotificationRequest
{
  return self->_activeRaiseToListenNotificationRequest;
}

- (void)setActiveRaiseToListenNotificationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_activeRaiseToListenNotificationRequest, a3);
}

- (NCNotificationViewController)activePlatterHomeAffordanceOwningNotificationViewController
{
  return self->_activePlatterHomeAffordanceOwningNotificationViewController;
}

- (void)setActivePlatterHomeAffordanceOwningNotificationViewController:(id)a3
{
  objc_storeStrong((id *)&self->_activePlatterHomeAffordanceOwningNotificationViewController, a3);
}

- (DNDEventBehaviorResolutionService)dndEventBehaviorResolutionService
{
  return self->_dndEventBehaviorResolutionService;
}

- (void)setDndEventBehaviorResolutionService:(id)a3
{
  objc_storeStrong((id *)&self->_dndEventBehaviorResolutionService, a3);
}

- (DNDStateService)dndStateService
{
  return self->_dndStateService;
}

- (void)setDndStateService:(id)a3
{
  objc_storeStrong((id *)&self->_dndStateService, a3);
}

- (CSLockScreenSettings)lockScreenSettings
{
  return self->_lockScreenSettings;
}

- (void)setLockScreenSettings:(id)a3
{
  objc_storeStrong((id *)&self->_lockScreenSettings, a3);
}

- (SBFTouchPassThroughView)debugViewLeft
{
  return self->_debugViewLeft;
}

- (void)setDebugViewLeft:(id)a3
{
  objc_storeStrong((id *)&self->_debugViewLeft, a3);
}

- (SBFTouchPassThroughView)debugViewRight
{
  return self->_debugViewRight;
}

- (void)setDebugViewRight:(id)a3
{
  objc_storeStrong((id *)&self->_debugViewRight, a3);
}

- (NSMutableSet)hasUserInteractionReasons
{
  return self->_hasUserInteractionReasons;
}

- (void)setHasUserInteractionReasons:(id)a3
{
  objc_storeStrong((id *)&self->_hasUserInteractionReasons, a3);
}

- (BOOL)_disableScrolling
{
  return self->_disableScrolling;
}

- (BOOL)_isScreenOn
{
  return self->_screenOn;
}

- (BOOL)disableBackgroundAnimation
{
  return self->_disableBackgroundAnimation;
}

- (BOOL)footerCallToActionLabelHidden
{
  return self->_footerCallToActionLabelHidden;
}

- (BOOL)notificationListHidden
{
  return self->_notificationListHidden;
}

- (BOOL)dismissGestureDisabled
{
  return self->_dismissGestureDisabled;
}

- (BOOL)hasPresentationDirtiedAppearance
{
  return self->_presentationDirtiedAppearance;
}

- (void)setPresentationDirtiedAppearance:(BOOL)a3
{
  self->_presentationDirtiedAppearance = a3;
}

- (UIViewController)digestOnboardingSuggestionViewController
{
  return self->_digestOnboardingSuggestionViewController;
}

- (void)setDigestOnboardingSuggestionViewController:(id)a3
{
  objc_storeStrong((id *)&self->_digestOnboardingSuggestionViewController, a3);
}

- (SBSLockScreenContentAssertion)digestOnboardingSuggestionViewControllerAssertion
{
  return self->_digestOnboardingSuggestionViewControllerAssertion;
}

- (void)setDigestOnboardingSuggestionViewControllerAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_digestOnboardingSuggestionViewControllerAssertion, a3);
}

- (BOOL)allowsDNDStateService
{
  return self->_allowsDNDStateService;
}

- (void)setAllowsDNDStateService:(BOOL)a3
{
  self->_allowsDNDStateService = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digestOnboardingSuggestionViewControllerAssertion, 0);
  objc_storeStrong((id *)&self->_digestOnboardingSuggestionViewController, 0);
  objc_storeStrong((id *)&self->_hasUserInteractionReasons, 0);
  objc_storeStrong((id *)&self->_debugViewRight, 0);
  objc_storeStrong((id *)&self->_debugViewLeft, 0);
  objc_storeStrong((id *)&self->_lockScreenSettings, 0);
  objc_storeStrong((id *)&self->_dndStateService, 0);
  objc_storeStrong((id *)&self->_dndEventBehaviorResolutionService, 0);
  objc_storeStrong((id *)&self->_activePlatterHomeAffordanceOwningNotificationViewController, 0);
  objc_storeStrong((id *)&self->_activeRaiseToListenNotificationRequest, 0);
  objc_storeStrong((id *)&self->_adjunctListViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_supplementaryItemContainersByIdentifier, 0);
  objc_storeStrong((id *)&self->_adjunctViewControllersByIdentifier, 0);
  objc_storeStrong((id *)&self->_supplementaryItemManager, 0);
  objc_storeStrong((id *)&self->_adjunctListViewController, 0);
  objc_destroyWeak((id *)&self->_audioCategoriesObserver);
  objc_storeStrong((id *)&self->_audioCategoriesDisablingVolumeHUD, 0);
  objc_destroyWeak((id *)&self->_notificationObserver);
  objc_destroyWeak((id *)&self->_activityItemObserver);
  objc_destroyWeak((id *)&self->_coverSheetGestureHandling);
  objc_destroyWeak((id *)&self->_coverSheetViewPresenting);
  objc_destroyWeak((id *)&self->_remoteContentInlineProvider);
  objc_destroyWeak((id *)&self->_deviceOrientationProvider);
  objc_destroyWeak((id *)&self->_proximitySensorProvider);
  objc_destroyWeak((id *)&self->_authenticationStatusProvider);
  objc_destroyWeak((id *)&self->_notificationPresenter);
  objc_destroyWeak((id *)&self->_unlockRequester);
  objc_destroyWeak((id *)&self->_platterHomeGestureManager);
  objc_destroyWeak((id *)&self->_homeAffordanceController);
  objc_destroyWeak((id *)&self->_scrollablePage);
  objc_destroyWeak((id *)&self->_page);
  objc_storeStrong((id *)&self->_layoutStrategy, 0);
  objc_destroyWeak((id *)&self->_dispatcher);
  objc_storeStrong((id *)&self->_userPresenceMonitor, 0);
  objc_destroyWeak((id *)&self->_applicationInformer);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_focusActivityManager, 0);
  objc_storeStrong((id *)&self->_breakthroughContentObservers, 0);
  objc_storeStrong((id *)&self->_activeDNDState, 0);
  objc_storeStrong((id *)&self->_deviceWakeProximitySensorAssertion, 0);
  objc_storeStrong((id *)&self->_notificationLongPressProximitySensorAssertion, 0);
  objc_storeStrong((id *)&self->_biometricResource, 0);
  objc_storeStrong((id *)&self->_screenOnTime, 0);
  objc_storeStrong((id *)&self->_gestureStudyInteraction, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_dismissGestureDisabledReasons, 0);
  objc_storeStrong((id *)&self->_notificationListHiddenReasons, 0);
  objc_storeStrong((id *)&self->_footerCallToActionHiddenReasons, 0);
  objc_storeStrong((id *)&self->_backgroundAnimationDisabledReasons, 0);
  objc_storeStrong((id *)&self->_dndBedtimeGreetingViewController, 0);
  objc_storeStrong((id *)&self->_dndBedtimeController, 0);
  objc_storeStrong((id *)&self->_quickActionsComponent, 0);
  objc_storeStrong((id *)&self->_quickActionsHiddenReasons, 0);
  objc_storeStrong((id *)&self->_wallpaperFloatingLayerComponent, 0);
  objc_storeStrong((id *)&self->_statusBarComponent, 0);
  objc_storeStrong((id *)&self->_footerCallToActionLabelComponent, 0);
  objc_storeStrong((id *)&self->_homeAffordanceComponent, 0);
  objc_storeStrong((id *)&self->_proudLockComponent, 0);
  objc_storeStrong((id *)&self->_statusBarBackgroundComponent, 0);
  objc_storeStrong((id *)&self->_remoteInlineContentComponent, 0);
  objc_storeStrong((id *)&self->_complicationContainerComponent, 0);
  objc_storeStrong((id *)&self->_dateViewComponent, 0);
  objc_storeStrong((id *)&self->_overrideNotificationListDisplayStyleAssertions, 0);
  objc_storeStrong((id *)&self->_significantUserInteractionTimer, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_storeStrong((id *)&self->_notificationContainerViewAssertions, 0);
  objc_storeStrong((id *)&self->_containerViewForExpandedNotificationContent, 0);
  objc_storeStrong((id *)&self->_structuredListViewController, 0);
  objc_storeStrong((id *)&self->_captureOnlyMaterialViewController, 0);
}

- (void)viewWillDisappear:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_4_0(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1_0(&dword_1D0337000, v1, v4, "%{public}@ stopped listening to raise gesture", v5);

  OUTLINED_FUNCTION_10();
}

- (void)notificationStructuredListViewControllerDidSignificantUserInteraction:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _SBFLoggingMethodProem();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1_0(&dword_1D0337000, a3, v5, "%@", v6);

  OUTLINED_FUNCTION_10();
}

- (void)notificationStructuredListViewControllerDidUpdateVisibleContentExtent:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0337000, log, OS_LOG_TYPE_DEBUG, "Updating presentation because visible Notification List View Controller visible content extent changed", v1, 2u);
}

- (void)notificationStructuredListViewController:(void *)a1 requestsPresentingFocusActivityPickerFromView:.cold.1(void *a1)
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_4_0(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1_0(&dword_1D0337000, v1, v4, "%{public}@ presenting focus activity picker from notification list", v5);

  OUTLINED_FUNCTION_10();
}

- (void)handleEvent:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_4_0(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(&dword_1D0337000, v1, OS_LOG_TYPE_ERROR, "Destination %{public}@ resetting user interaction on screen ON", v4, 0xCu);

  OUTLINED_FUNCTION_10();
}

- (void)handleEvent:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1_0(&dword_1D0337000, a2, v5, "Destination %@ handled home button tap dismissing long look", v6);

  OUTLINED_FUNCTION_10();
}

- (void)_updateRaiseGestureDetectionForNotificationRequest:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[12];
  __int16 v6;
  uint64_t v7;

  v1 = OUTLINED_FUNCTION_4_0(a1);
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  v6 = 2114;
  v7 = v4;
  _os_log_debug_impl(&dword_1D0337000, v1, OS_LOG_TYPE_DEBUG, "%{public}@ %{public}@ to raise gesture", v5, 0x16u);

}

@end
