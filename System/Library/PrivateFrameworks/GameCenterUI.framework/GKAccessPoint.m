@implementation GKAccessPoint

+ (GKAccessPoint)shared
{
  if (shared_onceToken_0 != -1)
    dispatch_once(&shared_onceToken_0, &__block_literal_global_13);
  return (GKAccessPoint *)(id)shared_sShared_0;
}

uint64_t __23__GKAccessPoint_shared__block_invoke()
{
  GKAccessPoint *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v0 = objc_alloc_init(GKAccessPoint);
  v1 = (void *)shared_sShared_0;
  shared_sShared_0 = (uint64_t)v0;

  objc_msgSend((id)shared_sShared_0, "setDelay:", 1.0);
  objc_msgSend(MEMORY[0x1E0D253B0], "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessPointShowHighlights");
  objc_msgSend((id)shared_sShared_0, "setShowHighlights:", v3);

  objc_msgSend(MEMORY[0x1E0D253B0], "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "accessPointLocation");
  objc_msgSend((id)shared_sShared_0, "setLocation:", v5);

  return objc_msgSend((id)shared_sShared_0, "setWillBecomeActive:", 0);
}

- (void)setIsPresentingGameCenter:(BOOL)a3
{
  self->_isPresentingGameCenter = a3;
}

- (void)showAccessPoint
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__GKAccessPoint_showAccessPoint__block_invoke;
  v5[3] = &unk_1E59C4430;
  v5[4] = self;
  objc_msgSend(v4, "isAppUnlistedAndDisallowed:", v5);

}

void __32__GKAccessPoint_showAccessPoint__block_invoke(uint64_t a1, int a2)
{
  NSObject **v2;
  NSObject *v3;
  id v4;
  id *v5;
  double Current;
  void *v7;
  NSObject **v8;
  NSObject *v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  double v16;
  dispatch_time_t v17;

  if (a2)
  {
    v2 = (NSObject **)MEMORY[0x1E0D25460];
    v3 = *MEMORY[0x1E0D25460];
    if (!*MEMORY[0x1E0D25460])
    {
      v4 = (id)GKOSLoggers();
      v3 = *v2;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __32__GKAccessPoint_showAccessPoint__block_invoke_cold_1(v3);
  }
  else
  {
    v5 = (id *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 32), "configureIfNeeded");
    Current = CFAbsoluteTimeGetCurrent();
    +[GKAccessPoint shared](GKAccessPoint, "shared");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTimeLastShown:", Current);

    if (objc_msgSend(MEMORY[0x1E0D25330], "usesGameOverlayUI"))
      objc_msgSend(MEMORY[0x1E0D25330], "showAccessPointInOverlay");
    else
      objc_msgSend(*v5, "decrementHideCount");
    v8 = (NSObject **)MEMORY[0x1E0D25460];
    v9 = *MEMORY[0x1E0D25460];
    if (!*MEMORY[0x1E0D25460])
    {
      v10 = (id)GKOSLoggers();
      v9 = *v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __32__GKAccessPoint_showAccessPoint__block_invoke_cold_2(v5, v9);
    if (objc_msgSend(*v5, "hideCount") <= 0)
    {
      objc_msgSend(MEMORY[0x1E0D253B0], "shared");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "accessPointIsOnAutomatically")
        && (objc_msgSend(MEMORY[0x1E0D252C0], "isGameCenter") & 1) == 0
        && !*MEMORY[0x1E0D253F8]
        && (objc_msgSend(MEMORY[0x1E0D252C0], "isPreferences") & 1) == 0)
      {
        v12 = objc_msgSend(MEMORY[0x1E0D252C0], "isFirstParty");

        if ((v12 & 1) != 0)
          return;
        +[GKAccessPoint shared](GKAccessPoint, "shared");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v11, "isActive"))
        {
          +[GKAccessPoint shared](GKAccessPoint, "shared");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "willBecomeActive");

          if ((v14 & 1) != 0)
            return;
          +[GKAccessPoint shared](GKAccessPoint, "shared");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setWillBecomeActive:", 1);

          +[GKAccessPoint shared](GKAccessPoint, "shared");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "delay");
          v17 = dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
          dispatch_after(v17, MEMORY[0x1E0C80D38], &__block_literal_global_18);
        }
      }

    }
  }
}

void __32__GKAccessPoint_showAccessPoint__block_invoke_17()
{
  void *v0;
  id v1;

  +[GKAccessPoint shared](GKAccessPoint, "shared");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setActive:", 1);

  +[GKAccessPoint shared](GKAccessPoint, "shared");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWillBecomeActive:", 0);

}

- (void)hideAccessPoint
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = a1;
  objc_msgSend(a2, "hideCount");
  _gkTabStringForTabLevel();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "hideCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1AB361000, v6, v7, "****** %@ - hideCount++  --> %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_1_0();
}

- (void)incrementHideCount
{
  -[GKAccessPoint setHideCount:](self, "setHideCount:", -[GKAccessPoint hideCount](self, "hideCount") + 1);
  if (-[GKAccessPoint hideCount](self, "hideCount") >= 1)
    -[GKAccessPoint setIsPresentingGameCenter:](self, "setIsPresentingGameCenter:", 1);
}

- (void)decrementHideCount
{
  -[GKAccessPoint setHideCount:](self, "setHideCount:", -[GKAccessPoint hideCount](self, "hideCount") - 1);
  if (-[GKAccessPoint hideCount](self, "hideCount") <= 0)
  {
    -[GKAccessPoint setHideCount:](self, "setHideCount:", 0);
    -[GKAccessPoint setIsPresentingGameCenter:](self, "setIsPresentingGameCenter:", 0);
  }
}

- (void)dismissGameCenter
{
  id v3;

  -[GKAccessPoint gameCenterViewController](self, "gameCenterViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[GKAccessPoint gameCenterViewControllerDidFinish:](self, "gameCenterViewControllerDidFinish:", v3);

}

- (void)triggerAccessPointWithHandler:(void *)handler
{
  id v4;

  v4 = handler;
  -[GKAccessPoint recordAccessPointClick](self, "recordAccessPointClick");
  -[GKAccessPoint showDashboardWithState:handler:](self, "showDashboardWithState:handler:", -1, v4);

}

- (void)triggerAccessPointWithState:(GKGameCenterViewControllerState)state handler:(void *)handler
{
  id v6;

  v6 = handler;
  -[GKAccessPoint recordAccessPointClick](self, "recordAccessPointClick");
  -[GKAccessPoint showDashboardWithState:handler:](self, "showDashboardWithState:handler:", state, v6);

}

- (void)setLocation:(GKAccessPointLocation)location
{
  if (self->_location != location)
  {
    self->_location = location;
    -[GKAccessPoint didUpdateLocation:](self, "didUpdateLocation:");
  }
}

- (void)setParentWindow:(UIWindow *)parentWindow
{
  UIWindow *WeakRetained;
  UIWindow *obj;

  obj = parentWindow;
  WeakRetained = (UIWindow *)objc_loadWeakRetained((id *)&self->_parentWindow);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_parentWindow, obj);
    -[GKAccessPoint didUpdateParentWindow:](self, "didUpdateParentWindow:", obj);
  }

}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)active
{
  self->_active = active;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (BOOL)willBecomeActive
{
  return self->_willBecomeActive;
}

- (void)setWillBecomeActive:(BOOL)a3
{
  self->_willBecomeActive = a3;
}

- (BOOL)showHighlights
{
  return self->_showHighlights;
}

- (void)setShowHighlights:(BOOL)showHighlights
{
  self->_showHighlights = showHighlights;
}

- (GKAccessPointLocation)location
{
  return self->_location;
}

- (UIWindow)parentWindow
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_parentWindow);
}

- (CGRect)frameInScreenCoordinates
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frameInScreenCoordinates.origin.x;
  y = self->_frameInScreenCoordinates.origin.y;
  width = self->_frameInScreenCoordinates.size.width;
  height = self->_frameInScreenCoordinates.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrameInScreenCoordinates:(CGRect)a3
{
  self->_frameInScreenCoordinates = a3;
}

- (id)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong(&self->_viewController, a3);
}

- (BOOL)isFocused
{
  return self->_focused;
}

- (void)setFocused:(BOOL)focused
{
  self->_focused = focused;
}

- (BOOL)isPresentingGameCenter
{
  return self->_isPresentingGameCenter;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (int64_t)hideCount
{
  return self->_hideCount;
}

- (void)setHideCount:(int64_t)a3
{
  self->_hideCount = a3;
}

- (BOOL)isShowingTriggeredPresentation
{
  return self->_isShowingTriggeredPresentation;
}

- (void)setIsShowingTriggeredPresentation:(BOOL)a3
{
  self->_isShowingTriggeredPresentation = a3;
}

- (GKGameCenterViewController)gameCenterViewController
{
  return self->_gameCenterViewController;
}

- (void)setGameCenterViewController:(id)a3
{
  objc_storeStrong((id *)&self->_gameCenterViewController, a3);
}

- (NSObject)privateImplementation
{
  return self->_privateImplementation;
}

- (void)setPrivateImplementation:(id)a3
{
  objc_storeStrong((id *)&self->_privateImplementation, a3);
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (double)timeLastShown
{
  return self->_timeLastShown;
}

- (void)setTimeLastShown:(double)a3
{
  self->_timeLastShown = a3;
}

- (UIGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_privateImplementation, 0);
  objc_storeStrong((id *)&self->_gameCenterViewController, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong(&self->_viewController, 0);
  objc_destroyWeak((id *)&self->_parentWindow);
}

- (void)configureIfNeeded
{
  GKAccessPoint *v2;

  v2 = self;
  GKAccessPoint.configureIfNeeded()();

}

- (void)showWindow
{
  GKAccessPoint *v2;

  v2 = self;
  GKAccessPoint.showWindow()();

}

- (void)removeWindow
{
  GKAccessPoint *v2;

  v2 = self;
  GKAccessPoint.removeWindow()();

}

- (void)updateUI
{
  self;
  GKAccessPoint.updateUI()();
}

- (void)resetUI
{
  GKAccessPoint *v2;

  v2 = self;
  GKAccessPoint.resetUI()();

}

- (void)loadModels
{
  GKAccessPoint *v2;

  v2 = self;
  GKAccessPoint.loadModels()();

}

- (void)didUpdateLocation:(int64_t)a3
{
  GKAccessPoint *v4;

  v4 = self;
  GKAccessPoint.didUpdateLocation(_:)((GKAccessPointLocation)a3);

}

- (void)didUpdateParentWindow:(id)a3
{
  id v4;
  GKAccessPoint *v5;

  v4 = a3;
  v5 = self;
  GKAccessPoint.didUpdateParentWindow(_:)((UIWindow_optional *)v5);

}

- (void)didTapAccessPoint
{
  GKAccessPoint *v2;

  v2 = self;
  GKAccessPoint.didTapAccessPoint()();

}

- (void)showDashboardWithState:(int64_t)a3 handler:(id)a4
{
  void *v5;

  v5 = _Block_copy(a4);
  if (v5)
    *(_QWORD *)(swift_allocObject() + 16) = v5;
  self;
  GKAccessPoint.showDashboard(state:handler:)();
}

- (void)showDashboardWithAchievementID:(id)a3 handler:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  GKAccessPoint *v10;

  v5 = _Block_copy(a4);
  v6 = sub_1AB7DAF90();
  v8 = v7;
  if (v5)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v5;
    v5 = sub_1AB4E3E6C;
  }
  else
  {
    v9 = 0;
  }
  v10 = self;
  GKAccessPoint.showDashboard(achievementID:handler:)(v6, v8, (uint64_t)v5, v9);
  sub_1AB46A9C4((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)showDashboardWithLeaderboardSetID:(id)a3 handler:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  GKAccessPoint *v10;

  v5 = _Block_copy(a4);
  v6 = sub_1AB7DAF90();
  v8 = v7;
  if (v5)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v5;
    v5 = sub_1AB4E3E6C;
  }
  else
  {
    v9 = 0;
  }
  v10 = self;
  GKAccessPoint.showDashboard(leaderboardSetID:handler:)(v6, v8, (uint64_t)v5, v9);
  sub_1AB46A9C4((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)showDashboardWithLeaderboardID:(id)a3 playerScope:(int64_t)a4 timeScope:(int64_t)a5 handler:(id)a6
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  GKAccessPoint *v14;

  v9 = _Block_copy(a6);
  v10 = sub_1AB7DAF90();
  v12 = v11;
  if (v9)
  {
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = v9;
    v9 = sub_1AB4E3E6C;
  }
  else
  {
    v13 = 0;
  }
  v14 = self;
  GKAccessPoint.showDashboard(leaderboardID:playerScope:timeScope:handler:)(v10, v12, a4, a5, (uint64_t)v9, v13);
  sub_1AB46A9C4((uint64_t)v9);

  swift_bridgeObjectRelease();
}

- (void)showDashboardWithPlayer:(id)a3 handler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  GKAccessPoint *v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1AB48638C;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  GKAccessPoint.showDashboard(player:handler:)((uint64_t)v8, (uint64_t)v6, v7);
  sub_1AB46A9C4((uint64_t)v6);

}

- (void)gameCenterViewControllerDidFinish:(id)a3
{
  GKGameCenterViewController *v4;

  v4 = (GKGameCenterViewController *)a3;
  self;
  GKAccessPoint.gameCenterViewControllerDidFinish(_:)(v4);
}

- (void)recordAccessPointClick
{
  GKAccessPoint *v2;

  v2 = self;
  GKAccessPoint.recordAccessPointClick()();

}

void __32__GKAccessPoint_showAccessPoint__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1AB361000, log, OS_LOG_TYPE_DEBUG, "Not showing the access point as Game Center is disabled.", v1, 2u);
}

void __32__GKAccessPoint_showAccessPoint__block_invoke_cold_2(id *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v3 = *a1;
  v4 = a2;
  objc_msgSend(v3, "hideCount");
  _gkTabStringForTabLevel();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*a1, "hideCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1AB361000, v7, v8, "****** %@ - hideCount--  --> %@", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_1_0();
}

@end
