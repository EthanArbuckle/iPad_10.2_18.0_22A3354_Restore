@implementation CSInlineWidgetContainerViewController

- (CSInlineWidgetContainerViewController)initWithComplicationManager:(id)a3
{
  return -[CSInlineWidgetContainerViewController initWithComplicationManager:inlineTextAlignment:](self, "initWithComplicationManager:inlineTextAlignment:", a3, 0);
}

- (CSInlineWidgetContainerViewController)initWithComplicationManager:(id)a3 inlineTextAlignment:(unint64_t)a4
{
  id v7;
  CSInlineWidgetContainerViewController *v8;
  CSInlineWidgetContainerViewController *v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSInlineWidgetContainerViewController;
  v8 = -[CSCoverSheetViewControllerBase initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_complicationManager, a3);
    v9->_inlineTextAlignment = a4;
    v9->_layoutStyle = 0;
    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)-[CSInlineWidgetContainerViewController registerForTraitChanges:withAction:](v9, "registerForTraitChanges:withAction:", v11, sel__backlightLuminanceDidChange_previousTraitCollection_);

  }
  return v9;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSInlineWidgetContainerViewController;
  -[CSCoverSheetViewControllerBase viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CSInlineWidgetContainerViewController setVisible:](self, "setVisible:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSInlineWidgetContainerViewController;
  -[CSCoverSheetViewControllerBase viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[CSInlineWidgetContainerViewController setVisible:](self, "setVisible:", 0);
}

- (void)setScreenOff:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_screenOff != a3)
  {
    self->_screenOff = a3;
    v4 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromBOOL();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("setScreenOff:%@"), v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSInlineWidgetContainerViewController _updatePresentationStyleForReason:](self, "_updatePresentationStyleForReason:", v5);

  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSInlineWidgetContainerViewController;
  v7 = a4;
  -[CSInlineWidgetContainerViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v11, sel_willTransitionToTraitCollection_withTransitionCoordinator_, v6, v7);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __99__CSInlineWidgetContainerViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E8E2F138;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, &__block_literal_global_9);

}

uint64_t __99__CSInlineWidgetContainerViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePresentationStyleForTransitionToNewTraitCollection:reason:", *(_QWORD *)(a1 + 40), CFSTR("willTransitionToTraitCollection:withTransitionCoordinator:"));
}

- (void)_backlightLuminanceDidChange:(id)a3 previousTraitCollection:(id)a4
{
  void *v6;
  id v7;

  objc_msgSend(a3, "traitCollection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSInlineWidgetContainerViewController _updatePresentationStyleForTransitionToNewTraitCollection:reason:](self, "_updatePresentationStyleForTransitionToNewTraitCollection:reason:", v7, v6);

}

- (void)setVisible:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_isVisible != a3)
  {
    self->_isVisible = a3;
    v4 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromBOOL();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("setVisible:%@"), v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSInlineWidgetContainerViewController _updatePresentationStyleForReason:](self, "_updatePresentationStyleForReason:", v5);

  }
}

- (void)setLayoutStyle:(int64_t)a3
{
  id v3;

  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    -[CSInlineWidgetContainerViewController view](self, "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsLayout");

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CSInlineWidgetContainerViewController;
  -[CSCoverSheetViewControllerBase viewDidLayoutSubviews](&v11, sel_viewDidLayoutSubviews);
  -[CSComplicationWrapperViewController view](self->_widgetViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSInlineWidgetContainerViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[CSComplicationDescriptor widget](self->_widgetDescriptor, "widget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extensionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSComplicationDescriptor widget](self->_widgetDescriptor, "widget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "kind");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@:%@"), v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setAccessibilityIdentifier:", v10);
  objc_msgSend(v3, "setAccessibilityValue:", CFSTR("Widget"));

}

- (void)setWidgetDescriptor:(id)a3
{
  CSComplicationDescriptor **p_widgetDescriptor;
  CSComplicationWrapperViewController *widgetViewController;
  CSComplicationWrapperViewController *v8;
  CSComplicationWrapperViewController *v9;
  CSComplicationWrapperViewController *v10;
  void *v11;
  void *v12;
  id v13;

  p_widgetDescriptor = &self->_widgetDescriptor;
  v13 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    if (*p_widgetDescriptor)
    {
      -[CSInlineWidgetContainerViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", self->_widgetViewController);
      widgetViewController = self->_widgetViewController;
      self->_widgetViewController = 0;

    }
    objc_storeStrong((id *)&self->_widgetDescriptor, a3);
    -[CSInlineWidgetContainerViewController _hostViewControllerForComplicationDescriptor:](self, "_hostViewControllerForComplicationDescriptor:", v13);
    v8 = (CSComplicationWrapperViewController *)objc_claimAutoreleasedReturnValue();
    v9 = self->_widgetViewController;
    self->_widgetViewController = v8;

    -[CSInlineWidgetContainerViewController loadViewIfNeeded](self, "loadViewIfNeeded");
    v10 = self->_widgetViewController;
    -[CSInlineWidgetContainerViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSInlineWidgetContainerViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", v10, v11);

    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSInlineWidgetContainerViewController _updatePresentationStyleForReason:](self, "_updatePresentationStyleForReason:", v12);

  }
}

- (id)sceneHostEnvironmentEntriesForBacklightSession
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[CSComplicationWrapperViewController widgetHostViewController](self->_widgetViewController, "widgetHostViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backlightHostEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSComplicationWrapperViewController widgetHostViewController](self->_widgetViewController, "widgetHostViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "widget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extensionIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DA9DB0], "entryWithSceneHostEnvironment:bundleIdentifier:", v4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setTintColor:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_tintColor, a3);
    -[CSInlineWidgetContainerViewController _widgetTintParameters](self, "_widgetTintParameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSComplicationWrapperViewController widgetHostViewController](self->_widgetViewController, "widgetHostViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTintParameters:", v5);

  }
}

- (void)beginCancellingTouches
{
  void *v3;
  NSMutableDictionary *cancelTouchesAssertionsByUniqueIdentifier;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  -[CSComplicationWrapperViewController widgetHostViewController](self->_widgetViewController, "widgetHostViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cancelTouchesForCurrentEventInHostedContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    cancelTouchesAssertionsByUniqueIdentifier = self->_cancelTouchesAssertionsByUniqueIdentifier;
    if (!cancelTouchesAssertionsByUniqueIdentifier)
    {
      v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v6 = self->_cancelTouchesAssertionsByUniqueIdentifier;
      self->_cancelTouchesAssertionsByUniqueIdentifier = v5;

      cancelTouchesAssertionsByUniqueIdentifier = self->_cancelTouchesAssertionsByUniqueIdentifier;
    }
    -[CSComplicationDescriptor uniqueIdentifier](self->_widgetDescriptor, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](cancelTouchesAssertionsByUniqueIdentifier, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v8, "invalidate");
    v9 = self->_cancelTouchesAssertionsByUniqueIdentifier;
    -[CSComplicationDescriptor uniqueIdentifier](self->_widgetDescriptor, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v3, v10);

  }
}

- (void)endCancellingTouches
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  v3 = self->_cancelTouchesAssertionsByUniqueIdentifier;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKey:](self->_cancelTouchesAssertionsByUniqueIdentifier, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7), (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "invalidate");

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_cancelTouchesAssertionsByUniqueIdentifier, "removeAllObjects");
}

- (BOOL)interpretsViewAsContent:(id)a3
{
  CSComplicationWrapperViewController *widgetViewController;
  id v4;
  void *v5;
  char v6;

  if (!a3)
    return 0;
  widgetViewController = self->_widgetViewController;
  v4 = a3;
  -[CSComplicationWrapperViewController view](widgetViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsView:", v4);

  return v6;
}

- (void)handleComplicationSelectionGesture:(id)a3
{
  _BOOL8 v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  v14 = a3;
  v4 = objc_msgSend(v14, "state") == 1 || objc_msgSend(v14, "state") == 2;
  if (objc_msgSend(v14, "state") == 3 || objc_msgSend(v14, "state") == 4)
  {
    -[CSComplicationWrapperViewController setHighlighted:](self->_widgetViewController, "setHighlighted:", 0);
  }
  else
  {
    -[CSInlineWidgetContainerViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "locationInView:", v5);
    v7 = v6;
    v9 = v8;

    -[CSInlineWidgetContainerViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hitTest:withEvent:", 0, v7, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[CSComplicationWrapperViewController view](self->_widgetViewController, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsView:", v11);

    if (v13)
      -[CSComplicationWrapperViewController setHighlighted:](self->_widgetViewController, "setHighlighted:", v4);

  }
}

- (id)_widgetTintParameters
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D10258]), "initWithPrimaryTintColor:secondaryTintColor:filterStyle:fallbackFilterStyle:fraction:", 0, 0, 2, 2, 1.0);
}

- (void)_setTextParametersAndFontForWidgetController:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x1E0D10040];
  v5 = a3;
  v8 = objc_alloc_init(v4);
  objc_msgSend(v8, "setSize:", &unk_1E8E87D30);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CEB5E8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWeight:", v6);

  v7 = objc_alloc_init(MEMORY[0x1E0D10058]);
  objc_msgSend(v7, "setFontSpecification:", v8);
  objc_msgSend(v7, "setSymbolScale:", 1);
  objc_msgSend(v7, "setShowsDateAlongsideText:", 1);
  objc_msgSend(v7, "setHorizontalAlignment:", self->_inlineTextAlignment);
  objc_msgSend(v5, "setInlineTextParameters:", v7);

}

- (id)_hostViewControllerForComplicationDescriptor:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CSComplicationWrapperViewController *v13;

  v4 = (objc_class *)MEMORY[0x1E0D10310];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "widget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v6, "initWithWidget:metrics:widgetConfigurationIdentifier:", v7, v8, v9);
  -[CSInlineWidgetContainerViewController _setTextParametersAndFontForWidgetController:](self, "_setTextParametersAndFontForWidgetController:", v10);
  objc_msgSend(v10, "setDrawSystemBackgroundMaterialIfNecessary:", 0);
  objc_msgSend(v10, "setVisibility:", 2);
  objc_msgSend(v10, "setCanAppearInSecureEnvironment:", 1);
  objc_msgSend(v10, "setShouldShareTouchesWithHost:", 1);
  objc_msgSend(v10, "setSupportsLowLuminance:", 1);
  objc_msgSend(v10, "setPrefersUnredactedContentInLowLuminanceEnvironment:", 1);
  objc_msgSend(v10, "setColorScheme:", 2);
  objc_msgSend(v10, "setContentType:", 0);
  objc_msgSend(v10, "setDelegate:", self);
  -[CSInlineWidgetContainerViewController _widgetTintParameters](self, "_widgetTintParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v10, "setTintParameters:", v11);
  -[CSInlineWidgetContainerViewController _currentState](self, "_currentState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPresentationMode:", -[CSComplicationPresentationState suggestedComplicationPresentationMode]((uint64_t)v12));

  v13 = -[CSComplicationWrapperViewController initWithWidgetHostViewController:]([CSComplicationWrapperViewController alloc], "initWithWidgetHostViewController:", v10);
  return v13;
}

- (id)_currentState
{
  CSComplicationPresentationState *lastKnownComplicationPresentationState;
  void *v4;
  CSComplicationPresentationState *v5;
  CSComplicationPresentationState *v6;

  lastKnownComplicationPresentationState = self->_lastKnownComplicationPresentationState;
  if (!lastKnownComplicationPresentationState)
  {
    -[CSInlineWidgetContainerViewController traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSInlineWidgetContainerViewController _buildComplicationPresentationStateForTraitCollection:](self, "_buildComplicationPresentationStateForTraitCollection:", v4);
    v5 = (CSComplicationPresentationState *)objc_claimAutoreleasedReturnValue();
    v6 = self->_lastKnownComplicationPresentationState;
    self->_lastKnownComplicationPresentationState = v5;

    lastKnownComplicationPresentationState = self->_lastKnownComplicationPresentationState;
  }
  return lastKnownComplicationPresentationState;
}

- (id)_buildComplicationPresentationStateForTraitCollection:(id)a3
{
  id v4;
  CSComplicationPresentationState *v5;
  char isVisible;
  char screenOff;
  uint64_t v8;

  v4 = a3;
  v5 = [CSComplicationPresentationState alloc];
  isVisible = self->_isVisible;
  screenOff = self->_screenOff;
  v8 = objc_msgSend(v4, "_backlightLuminance");

  return -[CSComplicationPresentationState initWithVisibility:isScreenOff:backlightLuminance:interfaceOrientation:](v5, isVisible, screenOff, v8, -[CSInlineWidgetContainerViewController interfaceOrientation](self, "interfaceOrientation"));
}

- (void)_updatePresentationStyleForReason:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSInlineWidgetContainerViewController traitCollection](self, "traitCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CSInlineWidgetContainerViewController _updatePresentationStyleForTransitionToNewTraitCollection:reason:](self, "_updatePresentationStyleForTransitionToNewTraitCollection:reason:", v5, v4);

}

- (void)_updatePresentationStyleForTransitionToNewTraitCollection:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  CSComplicationPresentationState *lastKnownComplicationPresentationState;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  NSObject *v14;
  unint64_t v15;
  _BOOL8 v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD block[5];
  uint8_t buf[4];
  CSInlineWidgetContainerViewController *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__CSInlineWidgetContainerViewController__updatePresentationStyleForTransitionToNewTraitCollection_reason___block_invoke;
  block[3] = &unk_1E8E2DB38;
  block[4] = self;
  if (_updatePresentationStyleForTransitionToNewTraitCollection_reason__onceToken != -1)
    dispatch_once(&_updatePresentationStyleForTransitionToNewTraitCollection_reason__onceToken, block);
  lastKnownComplicationPresentationState = self->_lastKnownComplicationPresentationState;
  -[CSInlineWidgetContainerViewController _buildComplicationPresentationStateForTraitCollection:](self, "_buildComplicationPresentationStateForTraitCollection:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSInlineWidgetContainerViewController _currentState](self, "_currentState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (BSEqualObjects() && lastKnownComplicationPresentationState)
  {
    SBLogCoverSheetWidgets();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134219010;
      v24 = self;
      v25 = 2114;
      v26 = _updatePresentationStyleForTransitionToNewTraitCollection_reason__className;
      v27 = 2114;
      v28 = v10;
      v29 = 2114;
      v30 = v9;
      v31 = 2114;
      v32 = v7;
      v12 = "[%p/%{public}@] Bailing (equal state) on Presentation mode transition from %{public}@ -> %{public}@ for reason: %{public}@";
LABEL_17:
      _os_log_impl(&dword_1D0337000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0x34u);
    }
  }
  else
  {
    if (!lastKnownComplicationPresentationState)
    {
      SBLogCoverSheetWidgets();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134219010;
        v24 = self;
        v25 = 2114;
        v26 = _updatePresentationStyleForTransitionToNewTraitCollection_reason__className;
        v27 = 2114;
        v28 = v10;
        v29 = 2114;
        v30 = v9;
        v31 = 2114;
        v32 = v7;
        _os_log_impl(&dword_1D0337000, v13, OS_LOG_TYPE_DEFAULT, "[%p/%{public}@] Proceeding w/ Presentation mode transition because we haven't done one yet, from %{public}@ -> %{public}@ for reason: %{public}@", buf, 0x34u);
      }

    }
    objc_storeStrong((id *)&self->_lastKnownComplicationPresentationState, v9);
    SBLogCoverSheetWidgets();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134219010;
      v24 = self;
      v25 = 2114;
      v26 = _updatePresentationStyleForTransitionToNewTraitCollection_reason__className;
      v27 = 2114;
      v28 = v10;
      v29 = 2114;
      v30 = v9;
      v31 = 2114;
      v32 = v7;
      _os_log_impl(&dword_1D0337000, v14, OS_LOG_TYPE_DEFAULT, "[%p/%{public}@] Begin Presentation mode transition from %{public}@ -> %{public}@ for reason: %{public}@", buf, 0x34u);
    }

    v15 = -[CSComplicationPresentationState suggestedComplicationPresentationMode]((uint64_t)v9);
    v16 = (v15 & 0xFFFFFFFFFFFFFFFELL) == 2;
    -[CSInlineWidgetContainerViewController bs_beginAppearanceTransitionForChildViewController:toVisible:animated:](self, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", self->_widgetViewController, v16, 0);
    -[CSComplicationWrapperViewController widgetHostViewController](self->_widgetViewController, "widgetHostViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPresentationMode:", v15);

    -[CSInlineWidgetContainerViewController bs_endAppearanceTransitionForChildViewController:toVisible:](self, "bs_endAppearanceTransitionForChildViewController:toVisible:", self->_widgetViewController, v16);
    SBLogCoverSheetWidgets();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = _updatePresentationStyleForTransitionToNewTraitCollection_reason__className;
      NSStringFromWidgetPresentationMode(v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSComplicationWrapperViewController widgetHostViewController](self->_widgetViewController, "widgetHostViewController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v24 = self;
      v25 = 2114;
      v26 = v19;
      v27 = 2114;
      v28 = v20;
      v29 = 2114;
      v30 = v21;
      _os_log_impl(&dword_1D0337000, v18, OS_LOG_TYPE_DEFAULT, "[%p/%{public}@] Updating Presentation mode to '%{public}@' for %{public}@", buf, 0x2Au);

    }
    SBLogCoverSheetWidgets();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134219010;
      v24 = self;
      v25 = 2114;
      v26 = _updatePresentationStyleForTransitionToNewTraitCollection_reason__className;
      v27 = 2114;
      v28 = v10;
      v29 = 2114;
      v30 = v9;
      v31 = 2114;
      v32 = v7;
      v12 = "[%p/%{public}@] End Presentation mode transition from %{public}@ -> %{public}@ completed for reason: %{public}@";
      goto LABEL_17;
    }
  }

}

void __106__CSInlineWidgetContainerViewController__updatePresentationStyleForTransitionToNewTraitCollection_reason___block_invoke()
{
  objc_class *v0;
  uint64_t v1;
  void *v2;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_updatePresentationStyleForTransitionToNewTraitCollection_reason__className;
  _updatePresentationStyleForTransitionToNewTraitCollection_reason__className = v1;

}

- (void)widgetHostViewController:(id)a3 requestsLaunchWithAction:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  CSComplicationManager *complicationManager;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = WeakRetained;
  if (!WeakRetained || (objc_msgSend(WeakRetained, "preventsLaunchFromWidgetWithAction:", v6) & 1) == 0)
  {
    complicationManager = self->_complicationManager;
    objc_msgSend(v11, "widget");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSComplicationManager handleLaunchRequestForWidget:withAction:](complicationManager, "handleLaunchRequestForWidget:withAction:", v10, v6);

  }
}

- (CSComplicationDescriptor)widgetDescriptor
{
  return self->_widgetDescriptor;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (CSInlineWidgetContainerViewControllerDelegate)delegate
{
  return (CSInlineWidgetContainerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isScreenOff
{
  return self->_screenOff;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (UIView)complicationSuperview
{
  return self->_complicationSuperview;
}

- (CSComplicationManager)complicationManager
{
  return self->_complicationManager;
}

- (void)setComplicationManager:(id)a3
{
  objc_storeStrong((id *)&self->_complicationManager, a3);
}

- (CSComplicationWrapperViewController)widgetViewController
{
  return self->_widgetViewController;
}

- (void)setWidgetViewController:(id)a3
{
  objc_storeStrong((id *)&self->_widgetViewController, a3);
}

- (NSMutableDictionary)cancelTouchesAssertionsByUniqueIdentifier
{
  return self->_cancelTouchesAssertionsByUniqueIdentifier;
}

- (void)setCancelTouchesAssertionsByUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cancelTouchesAssertionsByUniqueIdentifier, a3);
}

- (unint64_t)inlineTextAlignment
{
  return self->_inlineTextAlignment;
}

- (void)setInlineTextAlignment:(unint64_t)a3
{
  self->_inlineTextAlignment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelTouchesAssertionsByUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_widgetViewController, 0);
  objc_storeStrong((id *)&self->_complicationManager, 0);
  objc_storeStrong((id *)&self->_complicationSuperview, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_widgetDescriptor, 0);
  objc_storeStrong((id *)&self->_lastKnownComplicationPresentationState, 0);
}

@end
