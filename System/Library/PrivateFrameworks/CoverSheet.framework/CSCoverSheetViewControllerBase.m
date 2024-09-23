@implementation CSCoverSheetViewControllerBase

- (void)rebuildBehavior
{
  -[CSCoverSheetViewControllerBase updateBehaviorForController:](self, "updateBehaviorForController:", self);
}

- (void)updateBehaviorForController:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (-[CSCoverSheetViewControllerBase _rebuildBehavior](self, "_rebuildBehavior"))
  {
    -[CSCoverSheetViewControllerBase _presenter](self, "_presenter");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject updateBehaviorForController:](v5, "updateBehaviorForController:", self);
  }
  else
  {
    SBLogDashBoard();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[CSCoverSheetViewControllerBase updateBehaviorForController:].cold.1((uint64_t)self, v4);
  }

}

- (BOOL)_rebuildBehavior
{
  void *v3;
  CSBehavior **p_behavior;
  BOOL v5;

  +[CSBehavior behavior](CSBehavior, "behavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase aggregateBehavior:](self, "aggregateBehavior:", v3);
  p_behavior = &self->_behavior;
  v5 = -[CSBehavior isEqual:](*p_behavior, "isEqual:", v3);
  if (!v5)
    objc_storeStrong((id *)p_behavior, v3);

  return !v5;
}

- (int64_t)scrollingStrategy
{
  return -[CSBehavior scrollingStrategy](self->_behavior, "scrollingStrategy");
}

- (unint64_t)restrictedCapabilities
{
  return -[CSBehavior restrictedCapabilities](self->_behavior, "restrictedCapabilities");
}

- (int64_t)proximityDetectionMode
{
  return -[CSBehavior proximityDetectionMode](self->_behavior, "proximityDetectionMode");
}

- (int64_t)notificationBehavior
{
  return -[CSBehavior notificationBehavior](self->_behavior, "notificationBehavior");
}

- (int64_t)idleWarnMode
{
  return -[CSBehavior idleWarnMode](self->_behavior, "idleWarnMode");
}

- (int64_t)idleTimerMode
{
  return -[CSBehavior idleTimerMode](self->_behavior, "idleTimerMode");
}

- (int64_t)idleTimerDuration
{
  return -[CSBehavior idleTimerDuration](self->_behavior, "idleTimerDuration");
}

- (id)_presenter
{
  void *WeakRetained;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;

  WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  if (!WeakRetained)
  {
    -[CSCoverSheetViewControllerBase parentViewController](self, "parentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0
      || (-[CSCoverSheetViewControllerBase parentViewController](self, "parentViewController"),
          (WeakRetained = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[CSCoverSheetViewControllerBase presentingViewController](self, "presentingViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) == 0
        || (-[CSCoverSheetViewControllerBase presentingViewController](self, "presentingViewController"),
            (WeakRetained = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        -[CSCoverSheetViewControllerBase navigationController](self, "navigationController");
        WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
        if (WeakRetained)
        {
          -[CSCoverSheetViewControllerBase navigationController](self, "navigationController");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "parentViewController");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_opt_respondsToSelector();

          if ((v11 & 1) != 0)
          {
            -[CSCoverSheetViewControllerBase navigationController](self, "navigationController");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "parentViewController");
            WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            WeakRetained = 0;
          }
        }
      }
    }
  }
  return WeakRetained;
}

- (BOOL)isDisappeared
{
  return -[CSCoverSheetViewControllerBase _appearState](self, "_appearState") == 0;
}

- (CSCoverSheetViewControllerBase)initWithNibName:(id)a3 bundle:(id)a4
{
  CSCoverSheetViewControllerBase *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  CSAppearance *appearance;
  uint64_t v9;
  CSBehavior *behavior;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CSCoverSheetViewControllerBase;
  v4 = -[CSCoverSheetViewControllerBase initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    SBLogDashBoard();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[CSCoverSheetViewControllerBase initWithNibName:bundle:].cold.1();

    objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSAppearance appearanceWithIdentifier:](CSAppearance, "appearanceWithIdentifier:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    appearance = v4->_appearance;
    v4->_appearance = (CSAppearance *)v7;

    +[CSBehavior behavior](CSBehavior, "behavior");
    v9 = objc_claimAutoreleasedReturnValue();
    behavior = v4->_behavior;
    v4->_behavior = (CSBehavior *)v9;

  }
  return v4;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;

  -[BSInvalidatable invalidate](self->_displayLayoutElementAssertion, "invalidate");
  SBLogDashBoard();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[CSCoverSheetViewControllerBase initWithNibName:bundle:].cold.1();

  v4.receiver = self;
  v4.super_class = (Class)CSCoverSheetViewControllerBase;
  -[CSCoverSheetViewControllerBase dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id v8;

  v3 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "viewClass"));
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v8 = (id)objc_msgSend(v3, "initWithFrame:");

  objc_msgSend(v8, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v7);

  objc_msgSend(v8, "setAutoresizingMask:", 18);
  objc_msgSend(v8, "setAutoresizesSubviews:", 1);
  -[CSCoverSheetViewControllerBase setView:](self, "setView:", v8);

}

- (void)viewDidLoad
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_8_0();
  v1 = v0;
  OUTLINED_FUNCTION_7_0();
  _SBFLoggingMethodProem();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D01748];
  objc_msgSend(v1, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1D0337000, v6, v7, "%@ %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_4();
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)CSCoverSheetViewControllerBase;
  -[CSCoverSheetViewControllerBase viewWillAppear:](&v17, sel_viewWillAppear_);
  SBLogDashBoard();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    _SBFLoggingMethodProem();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v20 = v11;
    v21 = 2112;
    v22 = v12;
    _os_log_debug_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEBUG, "%@ animated: %@", buf, 0x16u);

  }
  if ((-[CSCoverSheetViewControllerBase shouldAutomaticallyForwardAppearanceMethods](self, "shouldAutomaticallyForwardAppearanceMethods") & 1) == 0&& -[CSCoverSheetViewControllerBase sendAppearanceTransitionForChildViewControllers](self, "sendAppearanceTransitionForChildViewControllers"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[CSCoverSheetViewControllerBase childViewControllers](self, "childViewControllers", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          -[CSCoverSheetViewControllerBase bs_beginAppearanceTransitionForChildViewController:toVisible:animated:](self, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10++), 1, v3);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v8);
    }

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)CSCoverSheetViewControllerBase;
  -[CSCoverSheetViewControllerBase viewDidAppear:](&v16, sel_viewDidAppear_);
  SBLogDashBoard();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    _SBFLoggingMethodProem();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v10;
    v20 = 2112;
    v21 = v11;
    _os_log_debug_impl(&dword_1D0337000, v4, OS_LOG_TYPE_DEBUG, "%@ animated: %@", buf, 0x16u);

  }
  -[CSCoverSheetViewControllerBase setDisplayLayoutElementActive:](self, "setDisplayLayoutElementActive:", 1);
  if ((-[CSCoverSheetViewControllerBase shouldAutomaticallyForwardAppearanceMethods](self, "shouldAutomaticallyForwardAppearanceMethods") & 1) == 0&& -[CSCoverSheetViewControllerBase sendAppearanceTransitionForChildViewControllers](self, "sendAppearanceTransitionForChildViewControllers"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[CSCoverSheetViewControllerBase childViewControllers](self, "childViewControllers", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          -[CSCoverSheetViewControllerBase bs_endAppearanceTransitionForChildViewController:toVisible:](self, "bs_endAppearanceTransitionForChildViewController:toVisible:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++), 1);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v7);
    }

  }
  -[CSCoverSheetViewControllerBase rebuildEverythingForReason:](self, "rebuildEverythingForReason:", CFSTR("ViewController Did Appear"));
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)CSCoverSheetViewControllerBase;
  -[CSCoverSheetViewControllerBase viewWillDisappear:](&v17, sel_viewWillDisappear_);
  SBLogDashBoard();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    _SBFLoggingMethodProem();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v20 = v11;
    v21 = 2112;
    v22 = v12;
    _os_log_debug_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEBUG, "%@ animated: %@", buf, 0x16u);

  }
  -[CSCoverSheetViewControllerBase setDisplayLayoutElementActive:](self, "setDisplayLayoutElementActive:", 0);
  if ((-[CSCoverSheetViewControllerBase shouldAutomaticallyForwardAppearanceMethods](self, "shouldAutomaticallyForwardAppearanceMethods") & 1) == 0&& -[CSCoverSheetViewControllerBase sendAppearanceTransitionForChildViewControllers](self, "sendAppearanceTransitionForChildViewControllers"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[CSCoverSheetViewControllerBase childViewControllers](self, "childViewControllers", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          -[CSCoverSheetViewControllerBase bs_beginAppearanceTransitionForChildViewController:toVisible:animated:](self, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10++), 0, v3);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v8);
    }

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)CSCoverSheetViewControllerBase;
  -[CSCoverSheetViewControllerBase viewDidDisappear:](&v16, sel_viewDidDisappear_);
  SBLogDashBoard();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    _SBFLoggingMethodProem();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v10;
    v20 = 2112;
    v21 = v11;
    _os_log_debug_impl(&dword_1D0337000, v4, OS_LOG_TYPE_DEBUG, "%@ animated: %@", buf, 0x16u);

  }
  if ((-[CSCoverSheetViewControllerBase shouldAutomaticallyForwardAppearanceMethods](self, "shouldAutomaticallyForwardAppearanceMethods") & 1) == 0&& -[CSCoverSheetViewControllerBase sendAppearanceTransitionForChildViewControllers](self, "sendAppearanceTransitionForChildViewControllers"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[CSCoverSheetViewControllerBase childViewControllers](self, "childViewControllers", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          -[CSCoverSheetViewControllerBase bs_endAppearanceTransitionForChildViewController:toVisible:](self, "bs_endAppearanceTransitionForChildViewController:toVisible:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++), 0);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v7);
    }

  }
}

- (void)viewWillLayoutSubviews
{
  NSObject *v3;
  objc_super v4;

  SBLogDashBoard();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[CSCoverSheetViewControllerBase initWithNibName:bundle:].cold.1();

  v4.receiver = self;
  v4.super_class = (Class)CSCoverSheetViewControllerBase;
  -[CSCoverSheetViewControllerBase viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
}

- (void)viewDidLayoutSubviews
{
  NSObject *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSCoverSheetViewControllerBase;
  -[CSCoverSheetViewControllerBase viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  SBLogDashBoard();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[CSCoverSheetViewControllerBase initWithNibName:bundle:].cold.1();

  if (-[CSCoverSheetViewControllerBase _presentationParticipant](self, "_presentationParticipant"))
  {
    if (!self->_forcingLayoutForPresentation)
      -[CSCoverSheetViewControllerBase rebuildAppearance](self, "rebuildAppearance");
  }
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
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CSCoverSheetViewControllerBase;
  -[CSCoverSheetViewControllerBase viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (-[CSCoverSheetViewControllerBase _presentationParticipant](self, "_presentationParticipant"))
  {
    v8[4] = self;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __85__CSCoverSheetViewControllerBase_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v9[3] = &unk_1E8E2EEA0;
    v9[4] = self;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __85__CSCoverSheetViewControllerBase_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v8[3] = &unk_1E8E2EEA0;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, v8);
  }

}

uint64_t __85__CSCoverSheetViewControllerBase_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "rebuildAppearance");
}

uint64_t __85__CSCoverSheetViewControllerBase_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "rebuildAppearance");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (void)registerView:(id)a3 forRole:(int64_t)a4
{
  -[CSCoverSheetViewControllerBase registerView:forRole:options:](self, "registerView:forRole:options:", a3, a4, 0);
}

- (void)registerView:(id)a3 forRole:(int64_t)a4 options:(unint64_t)a5
{
  char v5;
  id v9;
  NSHashTable *v10;
  NSHashTable *regionProviders;
  void *v12;
  id v13;
  id v14;

  v5 = a5;
  v9 = a3;
  if (a4)
  {
    if (!v9)
      goto LABEL_6;
  }
  else
  {
    v14 = v9;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSCoverSheetViewControllerBase.m"), 193, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("role != CSRegionRoleNone"));

    v9 = v14;
    if (!v14)
      goto LABEL_6;
  }
  v13 = v9;
  if (!self->_regionProviders)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    regionProviders = self->_regionProviders;
    self->_regionProviders = v10;

  }
  objc_msgSend(v13, "setCoverSheetRegionRole:", a4);
  objc_msgSend(v13, "setCoverSheetRegionReservedForHorizontalScrolling:", v5 & 1);
  -[NSHashTable addObject:](self->_regionProviders, "addObject:", v13);
  v9 = v13;
LABEL_6:

}

- (void)unregisterView:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setCoverSheetRegionRole:", 0);
  objc_msgSend(v4, "setCoverSheetRegionReservedForHorizontalScrolling:", 0);
  -[NSHashTable removeObject:](self->_regionProviders, "removeObject:", v4);

}

- (void)unregisterAllViews
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_regionProviders;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "setCoverSheetRegionRole:", 0, (_QWORD)v9);
        objc_msgSend(v8, "setCoverSheetRegionReservedForHorizontalScrolling:", 0);
      }
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSHashTable removeAllObjects](self->_regionProviders, "removeAllObjects");
}

- (void)rebuildAppearance
{
  -[CSCoverSheetViewControllerBase updateAppearanceForController:](self, "updateAppearanceForController:", self);
}

- (void)rebuildEverythingForReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogDashBoard();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    _SBFLoggingMethodProem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v4;
    _os_log_debug_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEBUG, "%@ reason = %@", (uint8_t *)&v7, 0x16u);

  }
  -[CSCoverSheetViewControllerBase rebuildAppearance](self, "rebuildAppearance");
  -[CSCoverSheetViewControllerBase rebuildBehavior](self, "rebuildBehavior");

}

- (void)updateAppearance:(id)a3
{
  -[CSCoverSheetViewControllerBase updateAppearance:completion:](self, "updateAppearance:completion:", a3, 0);
}

- (void)updateAppearance:(id)a3 completion:(id)a4
{
  id v6;

  v6 = a4;
  if (a3)
  {
    (*((void (**)(id, CSAppearance *))a3 + 2))(a3, self->_appearance);
    a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[CSCoverSheetViewControllerBase updateAppearanceForController:withAnimationSettings:completion:](self, "updateAppearanceForController:withAnimationSettings:completion:", self, a3, v6);

}

- (void)updateBehavior:(id)a3
{
  id v4;

  if (a3)
    (*((void (**)(id, CSBehavior *))a3 + 2))(a3, self->_behavior);
  -[CSCoverSheetViewControllerBase _presenter](self, "_presenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateBehaviorForController:", self);

}

- (void)sendAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSCoverSheetViewControllerBase _presenter](self, "_presenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleAction:fromSender:", v4, self);

}

- (void)dismiss
{
  if (dismiss_onceToken != -1)
    dispatch_once(&dismiss_onceToken, &__block_literal_global_20);
  -[CSCoverSheetViewControllerBase sendAction:](self, "sendAction:", dismiss___DismissAction);
}

void __41__CSCoverSheetViewControllerBase_dismiss__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CSAction actionWithType:](CSAction, "actionWithType:", 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)dismiss___DismissAction;
  dismiss___DismissAction = v0;

}

- (BOOL)presentationCancelsTouches
{
  return 1;
}

- (UIViewController)kitPresentedViewController
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSCoverSheetViewControllerBase;
  -[CSCoverSheetViewControllerBase presentedViewController](&v3, sel_presentedViewController);
  return (UIViewController *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)willTransitionToPresented:(BOOL)a3
{
  NSObject *v5;
  BOOL v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  SBLogDashBoard();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    _SBFLoggingMethodProem();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_debug_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEBUG, "%@ presented = %@", (uint8_t *)&v9, 0x16u);

  }
  v6 = a3 || self->_isBeingPresented;
  self->_isBeingPresented = v6;
}

- (void)didTransitionToPresented:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  SBLogDashBoard();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    _SBFLoggingMethodProem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_debug_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEBUG, "%@ presented = %@", (uint8_t *)&v8, 0x16u);

  }
  self->_isBeingPresented = a3;
}

- (void)updateForPresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  NSHashTable *regionProviders;
  void *v19;
  void *v20;
  NSObject *v21;
  double v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  _BOOL4 v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  const char *v30;
  uint32_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "presentationForRole:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v4;
  objc_msgSend(v4, "presentationForRole:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v5;
  objc_msgSend(v5, "unionPresentation:", v6);

  -[CSCoverSheetViewControllerBase _rebuildPresentation](self, "_rebuildPresentation");
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[CSCoverSheetViewControllerBase presentationRegions](self, "presentationRegions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v39;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v39 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v11);
        objc_msgSend(v12, "identity");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_opt_class();
        v15 = v13;
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

        if (v17)
        {
          regionProviders = self->_regionProviders;
          objc_msgSend(v12, "provider");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(regionProviders) = -[NSHashTable containsObject:](regionProviders, "containsObject:", v19);

          if ((_DWORD)regionProviders)
          {
            if (objc_msgSend(v12, "role") == 2)
              objc_msgSend(v37, "firstRegionIntersectingCoordinateSpace:excludingRegionsWithRole:", v17, 3);
            else
              objc_msgSend(v37, "firstRegionIntersectingCoordinateSpace:", v17);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              SBLogDashBoard();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", v17);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v43 = v32;
                v44 = 2112;
                v45 = (uint64_t)v20;
                _os_log_debug_impl(&dword_1D0337000, v21, OS_LOG_TYPE_DEBUG, "View %@ intersects %@.", buf, 0x16u);

              }
              v22 = 0.0;
            }
            else
            {
              v22 = 1.0;
            }
            objc_msgSend(v17, "alpha");
            if ((BSFloatEqualToFloat() & 1) == 0)
            {
              objc_msgSend(v17, "setAlpha:", v22);
              SBLogDashBoard();
              v23 = objc_claimAutoreleasedReturnValue();
              v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);

              if (v24)
              {
                SBLogDashBoard();
                v25 = objc_claimAutoreleasedReturnValue();
                v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);
                if (v20)
                {
                  if (v26)
                  {
                    objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", v17);
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v37, "identifier");
                    v27 = objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    v43 = v36;
                    v44 = 2112;
                    v45 = (uint64_t)v20;
                    v46 = 2112;
                    v47 = v27;
                    v28 = (void *)v27;
                    v29 = v25;
                    v30 = "Hiding view %@ because it intersects %@ within %@";
                    v31 = 32;
                    goto LABEL_32;
                  }
                }
                else if (v26)
                {
                  objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", v17);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "identifier");
                  v33 = objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v43 = v36;
                  v44 = 2112;
                  v45 = v33;
                  v28 = (void *)v33;
                  v29 = v25;
                  v30 = "Showing view %@ because it doesn't intersect any regions within %@.";
                  v31 = 22;
LABEL_32:
                  _os_log_debug_impl(&dword_1D0337000, v29, OS_LOG_TYPE_DEBUG, v30, buf, v31);

                }
              }
            }

          }
        }

        ++v11;
      }
      while (v9 != v11);
      v34 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
      v9 = v34;
    }
    while (v34);
  }

  -[CSCoverSheetViewControllerBase _rebuildPresentation](self, "_rebuildPresentation");
}

- (void)aggregateAppearance:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "legibilitySettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(v8, "componentForType:property:", 19, 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    CSGetLegibilitySettingsForBackgroundStyle(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v8, "setLegibilitySettings:", v7);

  }
}

- (void)aggregatePresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CSCoverSheetViewControllerBase externalPresentation](self, "externalPresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionPresentation:", v5);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_regionProviders;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        -[CSCoverSheetViewControllerBase _regionsForView:](self, "_regionsForView:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11), (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObjectsFromArray:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  objc_msgSend(v4, "addRegions:", v6);
}

- (void)performCustomTransitionToVisible:(BOOL)a3 withAnimationSettings:(id)a4 completion:(id)a5
{
  if (a5)
    (*((void (**)(id))a5 + 2))(a5);
}

- (BOOL)handleAction:(id)a3 fromController:(id)a4
{
  return 0;
}

- (BOOL)sendAppearanceTransitionForChildViewControllers
{
  return 1;
}

- (id)_newDisplayLayoutElement
{
  return 0;
}

- (void)_updateDisplayLayoutElementForActivation:(id)a3
{
  id v4;
  void *v5;
  double v6;
  id v7;

  v4 = a3;
  -[CSCoverSheetViewControllerBase view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "level");
  objc_msgSend(v4, "setLevel:", (uint64_t)v6);

}

- (void)_setDisplayLayoutElementActive:(BOOL)a3 immediately:(BOOL)a4
{
  _BOOL4 v4;
  id v6;

  v4 = a4;
  -[CSCoverSheetViewControllerBase setDisplayLayoutElementActive:](self, "setDisplayLayoutElementActive:", a3);
  if (v4)
  {
    if (self->_displayLayoutElement)
    {
      -[CSCoverSheetViewControllerBase _displayLayoutPublisher](self, "_displayLayoutPublisher");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "flush");

    }
  }
}

- (id)_displayLayoutPublisher
{
  return (id)objc_msgSend(MEMORY[0x1E0D22910], "sharedInstance");
}

- (void)_layoutIfNeededForPresentation
{
  void *v3;

  if (-[CSCoverSheetViewControllerBase _appearState](self, "_appearState"))
  {
    self->_forcingLayoutForPresentation = 1;
    -[CSCoverSheetViewControllerBase view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layoutIfNeeded");

    self->_forcingLayoutForPresentation = 0;
  }
}

- (BOOL)_rebuildAppearance
{
  CSAppearance **p_appearance;
  void *v4;
  void *v5;
  BOOL v6;

  p_appearance = &self->_appearance;
  -[CSAppearance identifier](self->_appearance, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSAppearance appearanceWithIdentifier:](CSAppearance, "appearanceWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSCoverSheetViewControllerBase aggregateAppearance:](self, "aggregateAppearance:", v5);
  v6 = -[CSCoverSheetViewControllerBase _rebuildPresentation](self, "_rebuildPresentation");
  if (!-[CSAppearance isEqualToAppearance:](*p_appearance, "isEqualToAppearance:", v5))
  {
    objc_storeStrong((id *)p_appearance, v5);
    v6 = 1;
  }

  return v6;
}

- (BOOL)_rebuildPresentation
{
  id *p_presentation;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  char v15;

  if (!-[CSCoverSheetViewControllerBase _presentationParticipant](self, "_presentationParticipant"))
    return 0;
  p_presentation = (id *)&self->_presentation;
  -[CSPresentation coordinateSpace](self->_presentation, "coordinateSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[CSCoverSheetViewControllerBase view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSPresentation presentationWithCoordinateSpace:](CSPresentation, "presentationWithCoordinateSpace:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *p_presentation;
    *p_presentation = (id)v9;

    v11 = *p_presentation;
    -[CSCoverSheetViewControllerBase coverSheetIdentifier](self, "coverSheetIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIdentifier:", v12);

  }
  objc_msgSend(*p_presentation, "presentationForRole:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase _layoutIfNeededForPresentation](self, "_layoutIfNeededForPresentation");
  -[CSCoverSheetViewControllerBase aggregatePresentation:](self, "aggregatePresentation:", v13);
  v14 = objc_msgSend(*p_presentation, "isEqual:", v13);
  if ((v14 & 1) == 0)
    objc_storeStrong(p_presentation, v13);
  v15 = v14 ^ 1;

  return v15;
}

- (void)_rebuildDisposition
{
  -[CSCoverSheetViewControllerBase _rebuildAppearance](self, "_rebuildAppearance");
  -[CSCoverSheetViewControllerBase _rebuildBehavior](self, "_rebuildBehavior");
}

- (SBSDisplayLayoutElement)_displayLayoutElement
{
  SBSDisplayLayoutElement *displayLayoutElement;
  SBSDisplayLayoutElement *v4;
  SBSDisplayLayoutElement *v5;

  displayLayoutElement = self->_displayLayoutElement;
  if (!displayLayoutElement)
  {
    v4 = -[CSCoverSheetViewControllerBase _newDisplayLayoutElement](self, "_newDisplayLayoutElement");
    v5 = self->_displayLayoutElement;
    self->_displayLayoutElement = v4;

    displayLayoutElement = self->_displayLayoutElement;
  }
  return displayLayoutElement;
}

- (id)_timelinesForDateInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CSCoverSheetViewControllerBase;
  -[CSCoverSheetViewControllerBase _timelinesForDateInterval:](&v18, sel__timelinesForDateInterval_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CSCoverSheetViewControllerBase childViewControllers](self, "childViewControllers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "_timelinesForDateInterval:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v6, "addObjectsFromArray:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v9);
  }

  return v6;
}

- (void)_updateWithFrameSpecifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSCoverSheetViewControllerBase;
  -[CSCoverSheetViewControllerBase _updateWithFrameSpecifier:](&v14, sel__updateWithFrameSpecifier_, v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[CSCoverSheetViewControllerBase childViewControllers](self, "childViewControllers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_updateWithFrameSpecifier:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (NSString)coverSheetIdentifier
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "coverSheetIdentifier");
}

- (int64_t)participantState
{
  if (-[CSCoverSheetViewControllerBase isDisappeared](self, "isDisappeared"))
    return 1;
  else
    return 2;
}

- (CSAppearance)activeAppearance
{
  void *v2;
  void *v3;

  -[CSCoverSheetViewControllerBase _presenter](self, "_presenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CSAppearance *)v3;
}

- (CSBehavior)activeBehavior
{
  void *v2;
  void *v3;

  -[CSCoverSheetViewControllerBase _presenter](self, "_presenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CSBehavior *)v3;
}

- (CSPresentation)externalPresentation
{
  void *v2;
  void *v3;

  -[CSCoverSheetViewControllerBase _presenter](self, "_presenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "externalPresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CSPresentation *)v3;
}

- (void)updateAppearanceForController:(id)a3
{
  -[CSCoverSheetViewControllerBase updateAppearanceForController:withAnimationSettings:completion:](self, "updateAppearanceForController:withAnimationSettings:completion:", a3, 0, 0);
}

- (void)updateAppearanceForController:(id)a3 withAnimationSettings:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  id v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEABB0], "_currentAnimationSettings");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  v17 = v11;
  v13 = -[CSCoverSheetViewControllerBase handleAppearanceUpdateFromController:animationSettings:](self, "handleAppearanceUpdateFromController:animationSettings:", v8, &v17);
  v14 = v17;

  if (v13)
  {
    -[CSCoverSheetViewControllerBase _presenter](self, "_presenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateAppearanceForController:withAnimationSettings:completion:", self, v14, v10);

  }
  else
  {
    SBLogDashBoard();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[CSCoverSheetViewControllerBase updateAppearanceForController:withAnimationSettings:completion:].cold.1((uint64_t)self, v8);

    if (v10)
      v10[2](v10, 0);
  }

}

- (void)handleAction:(id)a3 fromSender:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && !-[CSCoverSheetViewControllerBase handleAction:fromController:](self, "handleAction:fromController:", v8, v6))
  {
    -[CSCoverSheetViewControllerBase _presenter](self, "_presenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleAction:fromSender:", v8, v6);

  }
}

- (int64_t)presentationStyle
{
  return 0;
}

- (int64_t)presentationType
{
  return 0;
}

- (int64_t)presentationPriority
{
  return 0;
}

- (int64_t)presentationTransition
{
  return 0;
}

- (int64_t)presentationAltitude
{
  return 0;
}

- (CAFrameRateRange)presentationPreferredFrameRateRange
{
  float v2;
  float v3;
  float v4;
  CAFrameRateRange result;

  v2 = *MEMORY[0x1E0CD23C0];
  v3 = *(float *)(MEMORY[0x1E0CD23C0] + 4);
  v4 = *(float *)(MEMORY[0x1E0CD23C0] + 8);
  result.preferred = v4;
  result.maximum = v3;
  result.minimum = v2;
  return result;
}

- (unsigned)presentationFrameRateRangeReason
{
  return 0;
}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  BSInvalidatable *displayLayoutElementAssertion;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((unint64_t)(objc_msgSend(v4, "type") - 5) <= 2)
  {
    -[BSInvalidatable invalidate](self->_displayLayoutElementAssertion, "invalidate");
    displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;

  }
  if ((objc_msgSend(v4, "isConsumable") & 1) == 0)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[CSCoverSheetViewControllerBase childViewControllers](self, "childViewControllers", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "handleEvent:", v4);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  return 0;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (NSString)appearanceIdentifier
{
  return -[CSAppearance identifier](self->_appearance, "identifier");
}

- (NSSet)components
{
  return -[CSAppearance components](self->_appearance, "components");
}

- (_UILegibilitySettings)legibilitySettings
{
  return -[CSAppearance legibilitySettings](self->_appearance, "legibilitySettings");
}

- (UICoordinateSpace)presentationCoordinateSpace
{
  return -[CSPresentation coordinateSpace](self->_presentation, "coordinateSpace");
}

- (NSArray)presentationRegions
{
  return -[CSPresentation regions](self->_presentation, "regions");
}

- (void)updateDisplayLayoutElementWithBuilder:(id)a3
{
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  BSInvalidatable *displayLayoutElementAssertion;
  BSInvalidatable *v11;
  BSInvalidatable *v12;
  void *v13;
  void (**v14)(id, void *);

  v14 = (void (**)(id, void *))a3;
  -[CSCoverSheetViewControllerBase _displayLayoutElement](self, "_displayLayoutElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (self->_displayLayoutElementAssertion)
    {
      -[CSCoverSheetViewControllerBase _displayLayoutPublisher](self, "_displayLayoutPublisher");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSCoverSheetViewControllerBase.m"), 713, CFSTR("No publisher"));

      }
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "transitionAssertionWithReason:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[BSInvalidatable invalidate](self->_displayLayoutElementAssertion, "invalidate");
      displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
      self->_displayLayoutElementAssertion = 0;

      v14[2](v14, v5);
      objc_msgSend(v6, "addElement:", v5);
      v11 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      v12 = self->_displayLayoutElementAssertion;
      self->_displayLayoutElementAssertion = v11;

      objc_msgSend(v9, "invalidate");
    }
    else
    {
      v14[2](v14, v5);
    }
  }

}

- (void)setDisplayLayoutElementActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  BSInvalidatable *displayLayoutElementAssertion;
  BSInvalidatable *v12;
  BSInvalidatable *v13;
  void *v14;
  id v15;

  v3 = a3;
  -[CSCoverSheetViewControllerBase _displayLayoutElement](self, "_displayLayoutElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v15 = v6;
    -[CSCoverSheetViewControllerBase _displayLayoutPublisher](self, "_displayLayoutPublisher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSCoverSheetViewControllerBase.m"), 740, CFSTR("No publisher"));

    }
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transitionAssertionWithReason:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[BSInvalidatable invalidate](self->_displayLayoutElementAssertion, "invalidate");
    displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;

    if (v3)
    {
      -[CSCoverSheetViewControllerBase _updateDisplayLayoutElementForActivation:](self, "_updateDisplayLayoutElementForActivation:", v15);
      objc_msgSend(v7, "addElement:", v15);
      v12 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      v13 = self->_displayLayoutElementAssertion;
      self->_displayLayoutElementAssertion = v12;

    }
    objc_msgSend(v10, "invalidate");

    v6 = v15;
  }

}

- (BOOL)isDisplayLayoutElementActive
{
  return self->_displayLayoutElementAssertion != 0;
}

- (NSString)description
{
  return (NSString *)-[CSCoverSheetViewControllerBase descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[CSCoverSheetViewControllerBase succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase _displayLayoutElement](self, "_displayLayoutElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v5, CFSTR("layoutID"), 1);

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[CSCoverSheetViewControllerBase descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  CSCoverSheetViewControllerBase *v11;

  v4 = a3;
  -[CSCoverSheetViewControllerBase succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__CSCoverSheetViewControllerBase_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E2DC00;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __72__CSCoverSheetViewControllerBase_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;

  v2 = (void *)MEMORY[0x1E0D01748];
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_presenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptionForObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("presenter"));

  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "viewIfLoaded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v7, "appendObject:withName:", v8, CFSTR("view"));

  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_appearState");
  SBFStringForAppearState();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v10, "appendObject:withName:", v11, CFSTR("appearState"));

  v13 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "childViewControllers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendArraySection:withName:skipIfEmpty:", v14, CFSTR("childViewControllers"), 1);

  v15 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "presentationStyle"), CFSTR("presentationStyle"));
  v16 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "presentationType"), CFSTR("presentationType"));
  v17 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "presentationPriority"), CFSTR("presentationPriority"));
  v18 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "presentationTransition"), CFSTR("presentationTransition"));
  v19 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1016), "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "activeMultilinePrefix");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "appendArraySection:withName:multilinePrefix:skipIfEmpty:objectTransformer:", v20, CFSTR("regionProviders"), v21, 1, &__block_literal_global_80);

  v22 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 968), CFSTR("appearance"));
  v23 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 976), CFSTR("behavior"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 984), CFSTR("presentation"), 1);
}

uint64_t __72__CSCoverSheetViewControllerBase_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", a2);
}

- (BOOL)_presentationParticipant
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!self->_isBeingPresented)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 0;
  }
  -[CSCoverSheetViewControllerBase viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (id)_regionsForView:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  void *v44;
  _QWORD v45[3];
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v45[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "superview");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = 0;
  if (v4 && v5)
  {
    if (objc_msgSend(v4, "isCoverSheetView"))
    {
      objc_msgSend(v4, "presentationRegions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v4;
        objc_msgSend(v9, "superview");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSCoverSheetViewControllerBase effectiveContentSizeForScrollView:](self, "effectiveContentSizeForScrollView:", v9);
        BSRectWithSize();
        objc_msgSend(v9, "convertRect:toView:", v10);
        v12 = v11;
        v14 = v13;
        v16 = v15;
        v18 = v17;
        objc_msgSend(v9, "frame");
        v48.origin.x = v19;
        v48.origin.y = v20;
        v48.size.width = v21;
        v48.size.height = v22;
        v46.origin.x = v12;
        v46.origin.y = v14;
        v46.size.width = v16;
        v46.size.height = v18;
        v47 = CGRectIntersection(v46, v48);
        objc_msgSend(v9, "convertRect:fromView:", v10, v47.origin.x, v47.origin.y, v47.size.width, v47.size.height);
        +[CSRegion regionForCoordinateSpace:withExtent:](CSRegion, "regionForCoordinateSpace:withExtent:", v9);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v45[0] = v23;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v4, "bounds");
        +[CSRegion regionForCoordinateSpace:withExtent:](CSRegion, "regionForCoordinateSpace:withExtent:", v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    v38 = objc_msgSend(v4, "coverSheetRegionRole", v6);
    v24 = objc_msgSend(v4, "coverSheetRegionIsReservedForHorizontalScrolling");
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v7 = v8;
    v25 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v40 != v27)
            objc_enumerationMutation(v7);
          v29 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v29, "identity");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_opt_class();
          v32 = v30;
          if (v31)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v33 = v32;
            else
              v33 = 0;
          }
          else
          {
            v33 = 0;
          }
          v34 = v33;

          if (objc_msgSend(v29, "role"))
          {
            if (v34)
              goto LABEL_23;
          }
          else
          {
            objc_msgSend(v29, "setRole:", v38);
            if (v34)
            {
LABEL_23:
              objc_msgSend(v34, "alpha");
              if ((BSFloatIsZero() & 1) != 0)
                v35 = 1;
              else
                v35 = objc_msgSend(v34, "isHidden");
              objc_msgSend(v29, "setHidden:", v35);
            }
          }
          if ((objc_msgSend(v29, "isReservedForHorizontalScrolling") & 1) == 0)
            objc_msgSend(v29, "setReservedForHorizontalScrolling:", v24);
          objc_msgSend(v29, "setProvider:", v4);

        }
        v26 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v26);
    }

    v6 = v37;
  }

  return v7;
}

- (CGSize)effectiveContentSizeForScrollView:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "collectionViewLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "collectionViewContentSize");
    v6 = v5;
    v8 = v7;
    v3 = v4;
  }
  else
  {
    objc_msgSend(v3, "contentSize");
    v6 = v9;
    v8 = v10;
  }

  v11 = v6;
  v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (BOOL)isPresentation
{
  return self->_isBeingPresented;
}

- (CSCoverSheetViewPresenting)presenter
{
  return (CSCoverSheetViewPresenting *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (void)setPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_presenter, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_regionProviders, 0);
  objc_storeStrong((id *)&self->_displayLayoutElementAssertion, 0);
  objc_storeStrong((id *)&self->_displayLayoutElement, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_presentation, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_appearance, 0);
}

- (void)initWithNibName:bundle:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_7_0();
  _SBFLoggingMethodProem();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2_1(&dword_1D0337000, v1, v2, "%@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_10();
}

- (void)updateBehaviorForController:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "coverSheetIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1D0337000, v6, v7, "%@: Ignoring behavior update from %@.", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_4();
}

- (void)updateAppearanceForController:(uint64_t)a1 withAnimationSettings:(void *)a2 completion:.cold.1(uint64_t a1, void *a2)
{
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "coverSheetIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1D0337000, v6, v7, "%@: Ignoring appearance update from %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_4();
}

@end
