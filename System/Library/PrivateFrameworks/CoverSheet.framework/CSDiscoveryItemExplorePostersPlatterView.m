@implementation CSDiscoveryItemExplorePostersPlatterView

- (CSDiscoveryItemExplorePostersPlatterView)init
{
  CSDiscoveryItemExplorePostersPlatterView *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  CSDiscoveryItemExplorePostersPlatterView *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(id *);
  void *v15;
  id v16;
  CSDiscoveryItemExplorePostersPlatterView *v17;
  id v18;
  id location;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CSDiscoveryItemExplorePostersPlatterView;
  v2 = -[PLPlatterDiscoveryView init](&v20, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DISCOVERY_LIST_ITEM_PLATTER_EXPLORE_POSTERS_TITLE"), &stru_1E8E30B28, CFSTR("CoverSheet"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DISCOVERY_LIST_ITEM_PLATTER_EXPLORE_POSTERS_BODY"), &stru_1E8E30B28, CFSTR("CoverSheet"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPlatterDiscoveryView setTitleText:](v2, "setTitleText:", v4);
    -[PLPlatterDiscoveryView setBodyText:](v2, "setBodyText:", v5);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=Wallpaper"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v2);
    v7 = (void *)MEMORY[0x1E0CEA2A8];
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __48__CSDiscoveryItemExplorePostersPlatterView_init__block_invoke;
    v15 = &unk_1E8E2F298;
    objc_copyWeak(&v18, &location);
    v8 = v6;
    v16 = v8;
    v9 = v2;
    v17 = v9;
    objc_msgSend(v7, "actionWithHandler:", &v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPlatterDiscoveryView setDefaultAction:](v9, "setDefaultAction:", v10, v12, v13, v14, v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
  return v2;
}

void __48__CSDiscoveryItemExplorePostersPlatterView_init__block_invoke(id *a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  id v5;
  id v6;

  dispatch_get_global_queue(25, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CSDiscoveryItemExplorePostersPlatterView_init__block_invoke_2;
  block[3] = &unk_1E8E2E908;
  objc_copyWeak(&v6, a1 + 6);
  v4 = a1[4];
  v5 = a1[5];
  dispatch_async(v2, block);

  objc_destroyWeak(&v6);
}

void __48__CSDiscoveryItemExplorePostersPlatterView_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];
  id v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *MEMORY[0x1E0D22840];
  v14[0] = *MEMORY[0x1E0D22838];
  v14[1] = v5;
  v15[0] = MEMORY[0x1E0C9AAB0];
  v15[1] = MEMORY[0x1E0C9AAB0];
  v14[2] = *MEMORY[0x1E0D22830];
  v15[2] = CFSTR("CSDiscoveryItemAppLaunchOriginExplorePostersPlatterView");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v7 = objc_msgSend(v3, "openSensitiveURL:withOptions:error:", v4, v6, &v13);
  v8 = v13;

  SBLogDashBoard();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1D0337000, v10, OS_LOG_TYPE_DEFAULT, "ExplorePosters Launched URL", v12, 2u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    __48__CSDiscoveryItemExplorePostersPlatterView_init__block_invoke_2_cold_1((uint64_t)v8, v10);
  }

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "explorePostersPlatterViewWasTapped:", WeakRetained);

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSDiscoveryItemExplorePostersPlatterView;
  -[PLPlatterDiscoveryView layoutSubviews](&v5, sel_layoutSubviews);
  -[CSDiscoveryItemExplorePostersPlatterView _configureGraphicViewIfNecessary](self, "_configureGraphicViewIfNecessary");
  -[CSDiscoveryItemExplorePostersPlatterView rootAnimationLayer](self, "rootAnimationLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPlatterDiscoveryView graphicView](self, "graphicView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "center");
  objc_msgSend(v3, "setPosition:");

}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v4 = objc_msgSend(a3, "userInterfaceStyle");
  -[CSDiscoveryItemExplorePostersPlatterView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");

  if (v4 != v6)
    -[CSDiscoveryItemExplorePostersPlatterView _reconfigureGraphicView](self, "_reconfigureGraphicView");
}

- (void)_reconfigureGraphicView
{
  CAStateController *graphicStateController;
  CALayer *rootAnimationLayer;

  -[PLPlatterDiscoveryView setGraphicView:](self, "setGraphicView:", 0);
  graphicStateController = self->_graphicStateController;
  self->_graphicStateController = 0;

  rootAnimationLayer = self->_rootAnimationLayer;
  self->_rootAnimationLayer = 0;

  -[CSDiscoveryItemExplorePostersPlatterView _configureGraphicViewIfNecessary](self, "_configureGraphicViewIfNecessary");
}

- (void)_configureGraphicViewIfNecessary
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_2_0(&dword_1D0337000, v0, v1, "ExplorePosters graphic view already configured", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)pauseAnimations
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_2_0(&dword_1D0337000, v0, v1, "ExplorePosters graphic view pausing animations", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)resumeAnimations
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_2_0(&dword_1D0337000, v0, v1, "ExplorePosters graphic view resuming animations", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_pauseLayer:(id)a3
{
  double v3;
  double v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "convertTime:fromLayer:", 0, CACurrentMediaTime());
  v4 = v3;
  LODWORD(v3) = 0;
  objc_msgSend(v5, "setSpeed:", v3);
  objc_msgSend(v5, "setTimeOffset:", v4);

}

- (void)_resumeLayer:(id)a3
{
  double v3;
  double v4;
  double v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "timeOffset");
  v4 = v3;
  LODWORD(v3) = 1.0;
  objc_msgSend(v6, "setSpeed:", v3);
  objc_msgSend(v6, "setTimeOffset:", 0.0);
  objc_msgSend(v6, "setBeginTime:", 0.0);
  objc_msgSend(v6, "convertTime:fromLayer:", 0, CACurrentMediaTime());
  objc_msgSend(v6, "setBeginTime:", v5 - v4);

}

- (CSDiscoveryItemExplorePostersPlatterViewDelegate)delegate
{
  return (CSDiscoveryItemExplorePostersPlatterViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CAStateController)graphicStateController
{
  return self->_graphicStateController;
}

- (void)setGraphicStateController:(id)a3
{
  objc_storeStrong((id *)&self->_graphicStateController, a3);
}

- (CALayer)rootAnimationLayer
{
  return self->_rootAnimationLayer;
}

- (void)setRootAnimationLayer:(id)a3
{
  objc_storeStrong((id *)&self->_rootAnimationLayer, a3);
}

- (BOOL)isAnimationPaused
{
  return self->_animationPaused;
}

- (void)setAnimationPaused:(BOOL)a3
{
  self->_animationPaused = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootAnimationLayer, 0);
  objc_storeStrong((id *)&self->_graphicStateController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __48__CSDiscoveryItemExplorePostersPlatterView_init__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D0337000, a2, OS_LOG_TYPE_ERROR, "ExplorePosters Failed to launch URL: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
