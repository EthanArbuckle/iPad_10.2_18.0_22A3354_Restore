@implementation CSWidgetGridViewController

- (CSWidgetGridViewController)initWithComplicationManager:(id)a3 type:(unint64_t)a4 applicationInformer:(id)a5
{
  id v9;
  id v10;
  CSWidgetGridViewController *v11;
  CSWidgetGridViewController *v12;
  CSWidgetGridModel *v13;
  CSWidgetGridModel *v14;
  uint64_t v15;
  PRWidgetGridViewController *widgetGridViewController;
  void *v17;
  void *v18;
  id v19;
  objc_super v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CSWidgetGridViewController;
  v11 = -[CSWidgetGridViewController init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_complicationManager, a3);
    v12->_needsNestedVibrancyEffectView = a4 == 1;
    v13 = [CSWidgetGridModel alloc];
    v14 = -[CSWidgetGridModel initWithComplicationDescriptors:iconLayout:type:](v13, "initWithComplicationDescriptors:iconLayout:type:", MEMORY[0x1E0C9AA60], 0, a4);
    -[CSWidgetGridModel setApplicationInformer:](v14, "setApplicationInformer:", v10);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7FBC8]), "initWithModel:", v14);
    widgetGridViewController = v12->_widgetGridViewController;
    v12->_widgetGridViewController = (PRWidgetGridViewController *)v15;

    -[PRWidgetGridViewController setDelegate:](v12->_widgetGridViewController, "setDelegate:", v12);
    -[CSWidgetGridViewController _updateGridViewControllerOccluded:](v12, "_updateGridViewControllerOccluded:", 1);
    objc_opt_self();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)-[CSWidgetGridViewController registerForTraitChanges:withAction:](v12, "registerForTraitChanges:withAction:", v18, sel__backlightLuminanceDidChange_previousTraitCollection_);

  }
  return v12;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewDidLoad
{
  BSUIVibrancyEffectView *v3;
  BSUIVibrancyEffectView *vibrancyEffectView;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSWidgetGridViewController;
  -[CSCoverSheetViewControllerBase viewDidLoad](&v6, sel_viewDidLoad);
  if (self->_needsNestedVibrancyEffectView)
  {
    v3 = (BSUIVibrancyEffectView *)objc_alloc_init(MEMORY[0x1E0D01960]);
    vibrancyEffectView = self->_vibrancyEffectView;
    self->_vibrancyEffectView = v3;

    -[CSWidgetGridViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", self->_vibrancyEffectView);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSWidgetGridViewController;
  -[CSCoverSheetViewControllerBase viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CSWidgetGridViewController setVisible:](self, "setVisible:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSWidgetGridViewController;
  -[CSCoverSheetViewControllerBase viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[CSWidgetGridViewController setVisible:](self, "setVisible:", 0);
}

- (UIView)widgetGridContentView
{
  void *v2;
  void *v3;

  -[CSWidgetGridViewController widgetGridViewController](self, "widgetGridViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (void)setComplicationDescriptors:(id)a3 iconLayout:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[CSWidgetGridViewController widgetGridViewController](self, "widgetGridViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setComplicationDescriptors:iconLayout:", v7, v6);

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
    -[CSWidgetGridViewController _updatePresentationStyleForReason:](self, "_updatePresentationStyleForReason:", v5);

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
  v11.super_class = (Class)CSWidgetGridViewController;
  v7 = a4;
  -[CSWidgetGridViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v11, sel_willTransitionToTraitCollection_withTransitionCoordinator_, v6, v7);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __88__CSWidgetGridViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E8E2F138;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, &__block_literal_global_21);

}

void __88__CSWidgetGridViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "_buildComplicationPresentationStateForTraitCollection:interfaceOrientation:", *(_QWORD *)(a1 + 40), objc_msgSend(v1, "interfaceOrientation"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_updateComplicationPresentationState:reason:", v2, CFSTR("willTransitionToTraitCollection:withTransitionCoordinator:"));

}

- (void)_backlightLuminanceDidChange:(id)a3 previousTraitCollection:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "traitCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CSWidgetGridViewController _buildComplicationPresentationStateForTraitCollection:interfaceOrientation:](self, "_buildComplicationPresentationStateForTraitCollection:interfaceOrientation:", v8, -[CSWidgetGridViewController interfaceOrientation](self, "interfaceOrientation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSWidgetGridViewController _updateComplicationPresentationState:reason:](self, "_updateComplicationPresentationState:reason:", v6, v7);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  CSWidgetGridViewController *v16;
  _QWORD v17[4];
  id v18;
  CSWidgetGridViewController *v19;
  objc_super v20;

  height = a3.height;
  width = a3.width;
  v20.receiver = self;
  v20.super_class = (Class)CSWidgetGridViewController;
  v7 = a4;
  -[CSCoverSheetViewControllerBase viewWillTransitionToSize:withTransitionCoordinator:](&v20, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  SBFWindowForViewControllerTransition();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_toWindowOrientation");

  -[CSWidgetGridViewController traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSWidgetGridViewController _buildComplicationPresentationStateForTraitCollection:interfaceOrientation:](self, "_buildComplicationPresentationStateForTraitCollection:interfaceOrientation:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __81__CSWidgetGridViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v17[3] = &unk_1E8E2F138;
  v18 = v11;
  v19 = self;
  v14[0] = v12;
  v14[1] = 3221225472;
  v14[2] = __81__CSWidgetGridViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v14[3] = &unk_1E8E2F138;
  v15 = v18;
  v16 = self;
  v13 = v18;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v17, v14);

}

uint64_t __81__CSWidgetGridViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = -[CSComplicationPresentationState shouldPresentLandscapeComplications](*(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "_updateComplicationPresentationState:reason:", *(_QWORD *)(a1 + 32), CFSTR("viewWillTransitionToSize:withTransitionCoordinator: - transition"));
  return result;
}

uint64_t __81__CSWidgetGridViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = -[CSComplicationPresentationState shouldPresentLandscapeComplications](*(_QWORD *)(a1 + 32));
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "_updateComplicationPresentationState:reason:", *(_QWORD *)(a1 + 32), CFSTR("viewWillTransitionToSize:withTransitionCoordinator: - completion"));
  return result;
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
    -[CSWidgetGridViewController _updatePresentationStyleForReason:](self, "_updatePresentationStyleForReason:", v5);

  }
}

- (void)viewDidLayoutSubviews
{
  BSUIVibrancyEffectView *vibrancyEffectView;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSWidgetGridViewController;
  -[CSCoverSheetViewControllerBase viewDidLayoutSubviews](&v7, sel_viewDidLayoutSubviews);
  vibrancyEffectView = self->_vibrancyEffectView;
  -[CSWidgetGridViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[BSUIVibrancyEffectView setFrame:](vibrancyEffectView, "setFrame:");

  -[PRWidgetGridViewController view](self->_widgetGridViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSWidgetGridViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v5, "setFrame:");

}

- (BOOL)interpretsViewAsContent:(id)a3
{
  return -[PRWidgetGridViewController interpretsViewAsContent:](self->_widgetGridViewController, "interpretsViewAsContent:", a3);
}

- (void)beginCancellingTouches
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *cancelTouchesAssertionsByUniqueIdentifier;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[PRWidgetGridViewController model](self->_widgetGridViewController, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "complicationDescriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[PRWidgetGridViewController widgetHostViewControllerForComplicationDescriptor:](self->_widgetGridViewController, "widgetHostViewControllerForComplicationDescriptor:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "cancelTouchesForCurrentEventInHostedContent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          if (!self->_cancelTouchesAssertionsByUniqueIdentifier)
          {
            v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
            cancelTouchesAssertionsByUniqueIdentifier = self->_cancelTouchesAssertionsByUniqueIdentifier;
            self->_cancelTouchesAssertionsByUniqueIdentifier = v12;

          }
          objc_msgSend(v9, "uniqueIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](self->_cancelTouchesAssertionsByUniqueIdentifier, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
            objc_msgSend(v15, "invalidate");
          -[NSMutableDictionary setObject:forKey:](self->_cancelTouchesAssertionsByUniqueIdentifier, "setObject:forKey:", v11, v14);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
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

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setVibrancyConfiguration:(id)a3
{
  id v5;

  v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_vibrancyConfiguration, a3);
    -[CSWidgetGridViewController _updateColors](self, "_updateColors");
  }

}

- (void)setContentStyle:(id)a3
{
  id v5;

  v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contentStyle, a3);
    -[CSWidgetGridViewController _updateColors](self, "_updateColors");
  }

}

- (void)_updateColors
{
  id v3;
  BSUIVibrancyEffectView *vibrancyEffectView;
  CSVibrantContentStyleRenderer *v5;
  CSVibrantContentStyleRenderer *contentStyleRenderer;
  uint64_t v7;
  CSVibrantContentStyleRenderer *v8;
  id v9;

  if (!self->_contentStyleRenderer)
  {
    v3 = objc_alloc(MEMORY[0x1E0D1BCB8]);
    vibrancyEffectView = self->_vibrancyEffectView;
    -[BSUIVibrancyEffectView frame](vibrancyEffectView, "frame");
    v5 = (CSVibrantContentStyleRenderer *)objc_msgSend(v3, "initWithVibrancyView:styleBoundingRect:", vibrancyEffectView);
    contentStyleRenderer = self->_contentStyleRenderer;
    self->_contentStyleRenderer = v5;

  }
  v7 = -[PRPosterContentStyle type](self->_contentStyle, "type");
  v8 = self->_contentStyleRenderer;
  if (v7 == 1)
  {
    -[CSVibrantContentStyleRenderer clearAllStyling](v8, "clearAllStyling");
    v9 = objc_alloc_init(MEMORY[0x1E0D7FAE8]);
    -[CSVibrantContentStyleRenderer applyStyle:](self->_contentStyleRenderer, "applyStyle:", v9);

  }
  else
  {
    -[CSVibrantContentStyleRenderer setVibrancyConfiguration:](v8, "setVibrancyConfiguration:", self->_vibrancyConfiguration);
    -[CSVibrantContentStyleRenderer applyStyle:](self->_contentStyleRenderer, "applyStyle:", self->_contentStyle);
  }
}

- (BOOL)containsIconsInRow:(unint64_t)a3
{
  return -[PRWidgetGridViewController containsIconsInRow:](self->_widgetGridViewController, "containsIconsInRow:", a3);
}

- (id)_widgetTintParameters
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D10258]), "initWithPrimaryTintColor:secondaryTintColor:filterStyle:fallbackFilterStyle:fraction:", 0, 0, 2, 2, 1.0);
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
    -[CSWidgetGridViewController traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSWidgetGridViewController _buildComplicationPresentationStateForTraitCollection:interfaceOrientation:](self, "_buildComplicationPresentationStateForTraitCollection:interfaceOrientation:", v4, -[CSWidgetGridViewController interfaceOrientation](self, "interfaceOrientation"));
    v5 = (CSComplicationPresentationState *)objc_claimAutoreleasedReturnValue();
    v6 = self->_lastKnownComplicationPresentationState;
    self->_lastKnownComplicationPresentationState = v5;

    lastKnownComplicationPresentationState = self->_lastKnownComplicationPresentationState;
  }
  return lastKnownComplicationPresentationState;
}

- (id)_buildComplicationPresentationStateForTraitCollection:(id)a3 interfaceOrientation:(int64_t)a4
{
  id v6;
  CSComplicationPresentationState *v7;
  char isVisible;
  uint64_t v9;

  v6 = a3;
  v7 = [CSComplicationPresentationState alloc];
  isVisible = self->_isVisible;
  LOBYTE(self) = self->_screenOff;
  v9 = objc_msgSend(v6, "_backlightLuminance");

  return -[CSComplicationPresentationState initWithVisibility:isScreenOff:backlightLuminance:interfaceOrientation:](v7, isVisible, (char)self, v9, a4);
}

- (void)_updatePresentationStyleForReason:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CSWidgetGridViewController traitCollection](self, "traitCollection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CSWidgetGridViewController _buildComplicationPresentationStateForTraitCollection:interfaceOrientation:](self, "_buildComplicationPresentationStateForTraitCollection:interfaceOrientation:", v6, -[CSWidgetGridViewController interfaceOrientation](self, "interfaceOrientation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSWidgetGridViewController _updateComplicationPresentationState:reason:](self, "_updateComplicationPresentationState:reason:", v5, v4);

}

- (void)_updatePresentationStyleForNewOrientation:(int64_t)a3
{
  void *v4;
  id v5;

  -[CSWidgetGridViewController traitCollection](self, "traitCollection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSWidgetGridViewController _buildComplicationPresentationStateForTraitCollection:interfaceOrientation:](self, "_buildComplicationPresentationStateForTraitCollection:interfaceOrientation:", v4, -[CSWidgetGridViewController interfaceOrientation](self, "interfaceOrientation"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[CSWidgetGridViewController _updateComplicationPresentationState:reason:](self, "_updateComplicationPresentationState:reason:", v5, CFSTR("Orientation Change"));
}

- (void)_updateComplicationPresentationState:(id)a3 reason:(id)a4
{
  __CFString *v7;
  __CFString *v8;
  CSComplicationPresentationState *lastKnownComplicationPresentationState;
  __CFString *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  NSObject *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _BOOL8 v20;
  NSObject *v21;
  const __CFString *v22;
  const __CFString *v23;
  _QWORD v24[5];
  _QWORD block[5];
  uint8_t buf[4];
  CSWidgetGridViewController *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  __CFString *v33;
  __int16 v34;
  __CFString *v35;
  __int16 v36;
  __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = (__CFString *)a3;
  v8 = (__CFString *)a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__CSWidgetGridViewController__updateComplicationPresentationState_reason___block_invoke;
  block[3] = &unk_1E8E2DB38;
  block[4] = self;
  if (_updateComplicationPresentationState_reason__onceToken != -1)
    dispatch_once(&_updateComplicationPresentationState_reason__onceToken, block);
  lastKnownComplicationPresentationState = self->_lastKnownComplicationPresentationState;
  -[CSWidgetGridViewController _currentState](self, "_currentState");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (BSEqualObjects() && lastKnownComplicationPresentationState)
  {
    SBLogCoverSheetWidgets();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134219010;
      v27 = self;
      v28 = 2114;
      v29 = _updateComplicationPresentationState_reason__className;
      v30 = 2114;
      v31 = v10;
      v32 = 2114;
      v33 = v7;
      v34 = 2114;
      v35 = v8;
      v12 = "[%p/%{public}@] Bailing (equal state) on Presentation mode transition from %{public}@ -> %{public}@ for reason: %{public}@";
      v13 = v11;
      v14 = 52;
LABEL_29:
      _os_log_impl(&dword_1D0337000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    }
  }
  else
  {
    if (!lastKnownComplicationPresentationState)
    {
      SBLogCoverSheetWidgets();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134219010;
        v27 = self;
        v28 = 2114;
        v29 = _updateComplicationPresentationState_reason__className;
        v30 = 2114;
        v31 = v10;
        v32 = 2114;
        v33 = v7;
        v34 = 2114;
        v35 = v8;
        _os_log_impl(&dword_1D0337000, v15, OS_LOG_TYPE_DEFAULT, "[%p/%{public}@] Proceeding w/ Presentation mode transition because we haven't done one yet, from %{public}@ -> %{public}@ for reason: %{public}@", buf, 0x34u);
      }

    }
    objc_storeStrong((id *)&self->_lastKnownComplicationPresentationState, a3);
    v16 = -[CSComplicationPresentationState suggestedComplicationPresentationMode]((uint64_t)v7) & 0xFFFFFFFFFFFFFFFELL;
    -[CSWidgetGridViewController widgetGridViewController](self, "widgetGridViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "model");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "type");

    v20 = v16 == 2 && v19 != 1;
    if (v19 == 1 && v16 == 2)
      v20 = -[CSComplicationPresentationState shouldPresentLandscapeComplications]((_BOOL8)v7);
    SBLogCoverSheetWidgets();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = CFSTR("OCCLUDED");
      if (v20)
        v22 = CFSTR("VISIBLE");
      *(_DWORD *)buf = 134219266;
      v27 = self;
      v28 = 2114;
      v29 = _updateComplicationPresentationState_reason__className;
      v30 = 2114;
      v31 = v22;
      v32 = 2114;
      v33 = v10;
      v34 = 2114;
      v35 = v7;
      v36 = 2114;
      v37 = v8;
      _os_log_impl(&dword_1D0337000, v21, OS_LOG_TYPE_DEFAULT, "[%p/%{public}@] Begin Presentation mode transition to %{public}@ for %{public}@ -> %{public}@ for reason: %{public}@", buf, 0x3Eu);
    }

    if (v20)
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __74__CSWidgetGridViewController__updateComplicationPresentationState_reason___block_invoke_42;
      v24[3] = &unk_1E8E2DB38;
      v24[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v24);
    }
    -[PRWidgetGridViewController bs_beginAppearanceTransition:animated:](self->_widgetGridViewController, "bs_beginAppearanceTransition:animated:", v20, 0);
    -[CSWidgetGridViewController _updateGridViewControllerOccluded:](self, "_updateGridViewControllerOccluded:", v20 ^ 1);
    -[PRWidgetGridViewController bs_endAppearanceTransition:](self->_widgetGridViewController, "bs_endAppearanceTransition:", v20);
    if (!v20)
      -[CSWidgetGridViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", self->_widgetGridViewController);
    SBLogCoverSheetWidgets();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v23 = CFSTR("OCCLUDED");
      if (v20)
        v23 = CFSTR("VISIBLE");
      *(_DWORD *)buf = 134219266;
      v27 = self;
      v28 = 2114;
      v29 = _updateComplicationPresentationState_reason__className;
      v30 = 2114;
      v31 = v23;
      v32 = 2114;
      v33 = v10;
      v34 = 2114;
      v35 = v7;
      v36 = 2114;
      v37 = v8;
      v12 = "[%p/%{public}@] End Presentation mode transition to %{public}@ from %{public}@ -> %{public}@ completed for r"
            "eason: %{public}@";
      v13 = v11;
      v14 = 62;
      goto LABEL_29;
    }
  }

}

void __74__CSWidgetGridViewController__updateComplicationPresentationState_reason___block_invoke()
{
  objc_class *v0;
  uint64_t v1;
  void *v2;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_updateComplicationPresentationState_reason__className;
  _updateComplicationPresentationState_reason__className = v1;

}

void __74__CSWidgetGridViewController__updateComplicationPresentationState_reason___block_invoke_42(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 1041))
    objc_msgSend(*(id *)(v2 + 1096), "contentView");
  else
    objc_msgSend((id)v2, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bs_addChildViewController:withSuperview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1112), v3);

}

- (void)_updateGridViewControllerOccluded:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  -[PRWidgetGridViewController view](self->_widgetGridViewController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "setOccluded:", v3);

}

- (id)sceneHostEnvironmentEntriesForBacklightSession
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[PRWidgetGridViewController model](self->_widgetGridViewController, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "complicationDescriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        -[PRWidgetGridViewController widgetHostViewControllerForComplicationDescriptor:](self->_widgetGridViewController, "widgetHostViewControllerForComplicationDescriptor:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "backlightHostEnvironment");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v9, "widget");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "extensionIdentity");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "containerBundleIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0DA9DB0], "entryWithSceneHostEnvironment:bundleIdentifier:", v10, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v14);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  v15 = (void *)objc_msgSend(v18, "copy");
  return v15;
}

- (void)widgetGridViewController:(id)a3 didRequestLaunchForComplicationDescriptor:(id)a4 withAction:(id)a5
{
  id v7;
  void *v8;
  id WeakRetained;
  char v10;
  CSComplicationManager *complicationManager;
  void *v12;
  id v13;

  v13 = a4;
  v7 = a5;
  -[CSWidgetGridViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8
    || (WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        v10 = objc_msgSend(WeakRetained, "widgetGridViewControllerShouldPreventLaunchFromWidget:", self),
        WeakRetained,
        (v10 & 1) == 0))
  {
    complicationManager = self->_complicationManager;
    objc_msgSend(v13, "widget");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSComplicationManager handleLaunchRequestForWidget:withAction:](complicationManager, "handleLaunchRequestForWidget:withAction:", v12, v7);

  }
}

- (CSWidgetGridViewControllerDelegate)delegate
{
  return (CSWidgetGridViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isScreenOff
{
  return self->_screenOff;
}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  return self->_vibrancyConfiguration;
}

- (PRPosterContentStyle)contentStyle
{
  return self->_contentStyle;
}

- (BSUIVibrancyEffectView)vibrancyEffectView
{
  return self->_vibrancyEffectView;
}

- (void)setVibrancyEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_vibrancyEffectView, a3);
}

- (CSComplicationManager)complicationManager
{
  return self->_complicationManager;
}

- (void)setComplicationManager:(id)a3
{
  objc_storeStrong((id *)&self->_complicationManager, a3);
}

- (PRWidgetGridViewController)widgetGridViewController
{
  return self->_widgetGridViewController;
}

- (void)setWidgetGridViewController:(id)a3
{
  objc_storeStrong((id *)&self->_widgetGridViewController, a3);
}

- (NSMutableDictionary)cancelTouchesAssertionsByUniqueIdentifier
{
  return self->_cancelTouchesAssertionsByUniqueIdentifier;
}

- (void)setCancelTouchesAssertionsByUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cancelTouchesAssertionsByUniqueIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelTouchesAssertionsByUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_widgetGridViewController, 0);
  objc_storeStrong((id *)&self->_complicationManager, 0);
  objc_storeStrong((id *)&self->_vibrancyEffectView, 0);
  objc_storeStrong((id *)&self->_contentStyle, 0);
  objc_storeStrong((id *)&self->_vibrancyConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentStyleRenderer, 0);
  objc_storeStrong((id *)&self->_lastKnownComplicationPresentationState, 0);
}

@end
