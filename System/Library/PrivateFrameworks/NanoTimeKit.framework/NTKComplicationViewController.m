@implementation NTKComplicationViewController

- (NTKComplicationViewController)initWithVariant:(id)a3 device:(id)a4 complication:(id)a5 displayProperties:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NTKComplicationViewController *v15;
  void *v16;
  uint64_t v17;
  NTKComplicationStyle *style;
  NTKMonochromeModel *v19;
  NTKMonochromeModel *monochromeModel;
  uint64_t v21;
  NTKComplicationControllerDisplayProperties *displayProperties;
  NTKComplication *complication;
  void *v24;
  objc_super v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)NTKComplicationViewController;
  v15 = -[NTKComplicationViewController initWithNibName:bundle:](&v26, sel_initWithNibName_bundle_, 0, 0);
  +[NTKWidgetDescriptorProvider sharedInstance](NTKWidgetDescriptorProvider, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "registerObserver:", v15);

  if (v15)
  {
    objc_storeStrong((id *)&v15->_variant, a3);
    objc_storeStrong((id *)&v15->_device, a4);
    objc_storeStrong((id *)&v15->_complication, a5);
    v17 = objc_opt_new();
    style = v15->_style;
    v15->_style = (NTKComplicationStyle *)v17;

    v19 = -[NTKMonochromeModel initWithDevice:]([NTKMonochromeModel alloc], "initWithDevice:", v12);
    monochromeModel = v15->_monochromeModel;
    v15->_monochromeModel = v19;

    v15->_presentationState = 2;
    v15->_forceLivePresentationState = 0;
    v21 = objc_msgSend(v14, "copy");
    displayProperties = v15->_displayProperties;
    v15->_displayProperties = (NTKComplicationControllerDisplayProperties *)v21;

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    complication = v15->_complication;
    +[NTKWidgetDescriptorProvider sharedInstance](NTKWidgetDescriptorProvider, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKComplicationViewController _updateWidgetDescriptorForComplication:withProvider:](v15, "_updateWidgetDescriptorForComplication:withProvider:", complication, v24);

  }
  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[NTKComplicationController removeDisplayWrapper:](self->_controller, "removeDisplayWrapper:", self->_wrapperView);
  v3.receiver = self;
  v3.super_class = (Class)NTKComplicationViewController;
  -[NTKComplicationViewController dealloc](&v3, sel_dealloc);
}

- (void)setComplication:(id)a3 displayProperties:(id)a4
{
  id v6;
  NTKComplicationControllerDisplayProperties *v7;
  NTKComplicationControllerDisplayProperties *displayProperties;

  v6 = a3;
  v7 = (NTKComplicationControllerDisplayProperties *)objc_msgSend(a4, "copy");
  displayProperties = self->_displayProperties;
  self->_displayProperties = v7;

  -[NTKComplicationViewController setComplication:](self, "setComplication:", v6);
  -[NTKComplicationController setDisplayProperties:forDisplayWrapper:](self->_controller, "setDisplayProperties:forDisplayWrapper:", self->_displayProperties, self->_wrapperView);
}

- (void)loadView
{
  NTKComplicationDisplayWrapperView *v3;
  NTKComplicationDisplayWrapperView *wrapperView;
  NTKComplicationDisplayWrapperView *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NTKComplicationViewController;
  -[NTKComplicationViewController loadView](&v13, sel_loadView);
  v3 = -[NTKComplicationDisplayWrapperView initWithFamily:]([NTKComplicationDisplayWrapperView alloc], "initWithFamily:", -[NTKComplicationVariant family](self->_variant, "family"));
  wrapperView = self->_wrapperView;
  self->_wrapperView = v3;

  objc_initWeak(&location, self);
  v5 = self->_wrapperView;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __41__NTKComplicationViewController_loadView__block_invoke;
  v10 = &unk_1E6BD9900;
  objc_copyWeak(&v11, &location);
  -[NTKComplicationDisplayWrapperView setDisplayConfigurationHandler:](v5, "setDisplayConfigurationHandler:", &v7);
  -[NTKComplicationDisplayWrapperView addBackgroundObserver:](self->_wrapperView, "addBackgroundObserver:", self, v7, v8, v9, v10);
  -[NTKComplicationViewController _updatePresentationState](self, "_updatePresentationState");
  -[NTKComplicationViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_wrapperView);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __41__NTKComplicationViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_applyStyleToDisplay:", v5);

}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  NTKComplicationDisplayWrapperView *wrapperView;
  void *v9;
  double MidX;
  void *v11;
  _OWORD v12[6];
  objc_super v13;
  CGRect v14;
  CGRect v15;

  v13.receiver = self;
  v13.super_class = (Class)NTKComplicationViewController;
  -[NTKComplicationViewController viewDidLayoutSubviews](&v13, sel_viewDidLayoutSubviews);
  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[NTKComplicationViewController _effectiveMetrics](self, "_effectiveMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  -[NTKComplicationDisplayWrapperView setBounds:](self->_wrapperView, "setBounds:", v3, v4, v6, v7);

  -[NTKComplicationViewController _contentTransform](self, "_contentTransform");
  wrapperView = self->_wrapperView;
  v12[0] = v12[3];
  v12[1] = v12[4];
  v12[2] = v12[5];
  -[NTKComplicationDisplayWrapperView setContentTransform:](wrapperView, "setContentTransform:", v12);
  -[NTKComplicationViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  MidX = CGRectGetMidX(v14);
  -[NTKComplicationViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  -[NTKComplicationDisplayWrapperView setCenter:](self->_wrapperView, "setCenter:", MidX, CGRectGetMidY(v15));

}

- (void)performTapAction
{
  -[NTKComplicationDisplayWrapperView performTap](self->_wrapperView, "performTap");
}

- (id)takeTouchCancellationAssertion
{
  return 0;
}

- (void)setStyle:(id)a3
{
  NTKComplicationStyle *v4;
  NTKComplicationStyle *style;
  id v6;

  v6 = a3;
  if (!-[NTKComplicationStyle isEqual:](self->_style, "isEqual:"))
  {
    v4 = (NTKComplicationStyle *)objc_msgSend(v6, "copy");
    style = self->_style;
    self->_style = v4;

    -[NTKComplicationViewController _applyStyleIfPossible](self, "_applyStyleIfPossible");
  }

}

- (void)setComplication:(id)a3
{
  void *v4;
  NTKComplication *v5;
  NTKComplication *complication;
  void *v7;
  id v8;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[NTKWidgetDescriptorProvider sharedInstance](NTKWidgetDescriptorProvider, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKComplicationViewController _updateWidgetDescriptorForComplication:withProvider:](self, "_updateWidgetDescriptorForComplication:withProvider:", v8, v4);

  }
  if ((objc_msgSend(v8, "isEqual:", self->_complication) & 1) == 0)
  {
    v5 = (NTKComplication *)objc_msgSend(v8, "copy");
    complication = self->_complication;
    self->_complication = v5;

    -[NTKComplicationViewController _updatePresentationState](self, "_updatePresentationState");
    -[NTKComplicationViewController _updateController](self, "_updateController");
    -[NTKComplicationViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsLayout");

  }
}

- (void)setDisplayProperties:(id)a3
{
  NTKComplicationControllerDisplayProperties *v4;
  NTKComplicationControllerDisplayProperties *displayProperties;
  id v6;

  v6 = a3;
  if ((NTKEqualObjects(self->_displayProperties, v6) & 1) == 0)
  {
    v4 = (NTKComplicationControllerDisplayProperties *)objc_msgSend(v6, "copy");
    displayProperties = self->_displayProperties;
    self->_displayProperties = v4;

    -[NTKComplicationController setDisplayProperties:forDisplayWrapper:](self->_controller, "setDisplayProperties:forDisplayWrapper:", self->_displayProperties, self->_wrapperView);
  }

}

- (void)updateDisplayPropertiesWithBlock:(id)a3
{
  NTKComplicationControllerDisplayProperties *displayProperties;
  void (**v5)(id, id);
  id v6;

  displayProperties = self->_displayProperties;
  v5 = (void (**)(id, id))a3;
  v6 = (id)-[NTKComplicationControllerDisplayProperties mutableCopy](displayProperties, "mutableCopy");
  v5[2](v5, v6);

  -[NTKComplicationViewController setDisplayProperties:](self, "setDisplayProperties:", v6);
}

- (void)setForceLivePresentationState:(BOOL)a3
{
  void *v4;

  if (self->_forceLivePresentationState != a3)
    self->_forceLivePresentationState = a3;
  -[NTKComplicationViewController viewIfLoaded](self, "viewIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[NTKComplicationViewController _updatePresentationState](self, "_updatePresentationState");
}

- (void)_updateWidgetDescriptorForComplication:(id)a3 withProvider:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NTKComplicationViewController *v23;
  id v24;
  id v25;
  int v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v23 = self;
  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "descriptorsByExtensionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    v24 = v9;
    v25 = v5;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v5, "kind", v23);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "kind");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v15, "isEqual:", v16))
          goto LABEL_11;
        objc_msgSend(v5, "containerBundleIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "containerBundleIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v17, "isEqual:", v18))
        {

LABEL_11:
          continue;
        }
        objc_msgSend(v5, "extensionBundleIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "extensionBundleIdentifier");
        v20 = v11;
        v21 = v12;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v19, "isEqual:", v22);

        v12 = v21;
        v11 = v20;

        v9 = v24;
        v5 = v25;

        if (v26)
        {
          objc_storeStrong((id *)&v23->_widgetDescriptor, v14);
          -[NTKComplicationViewController displayWrapperTemplateBackgroundChanged](v23, "displayWrapperTemplateBackgroundChanged");
          goto LABEL_14;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v11);
  }
LABEL_14:

}

- (void)_updatePresentationState
{
  int64_t v3;
  void *v4;
  NTKComplication *complication;
  void *v6;
  void *v7;
  NSObject *v8;
  NTKComplication *v9;
  unint64_t v10;
  int v11;
  NTKComplication *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = -[NTKComplicationVariant family](self->_variant, "family");
  +[NTKComplicationProvider providerForDevice:](NTKComplicationProvider, "providerForDevice:", self->_device);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  complication = self->_complication;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(complication) = objc_msgSend(v4, "isComplicationAvailable:forFamilies:", complication, v7);

  if ((complication & 1) != 0 || self->_forceLivePresentationState)
  {
    _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_complication;
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "Presentation state update for %@", (uint8_t *)&v11, 0xCu);
    }

    v10 = 0;
  }
  else
  {
    v10 = 1;
  }
  if (self->_presentationState != v10)
  {
    self->_presentationState = v10;
    -[NTKComplicationViewController _applyPresentationState](self, "_applyPresentationState");
  }
}

- (void)_applyPresentationState
{
  unint64_t presentationState;
  id v4;

  -[NTKComplicationViewController _updateController](self, "_updateController");
  presentationState = self->_presentationState;
  if (presentationState == 2)
  {
    -[NTKComplicationDisplayWrapperView setCustomDisplay:](self->_wrapperView, "setCustomDisplay:", 0);
  }
  else if (presentationState == 1)
  {
    +[NTKComplicationPlaceholderController templateForFamily:complication:variant:](NTKComplicationPlaceholderController, "templateForFamily:complication:variant:", -[NTKComplicationVariant family](self->_variant, "family"), self->_complication, self->_variant);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[NTKComplicationDisplayWrapperView setComplicationTemplate:reason:animation:](self->_wrapperView, "setComplicationTemplate:reason:animation:", v4, 0, 0);

  }
}

- (void)_updateController
{
  NTKComplicationController *v3;
  NTKComplicationController **p_controller;
  NTKComplicationController *controller;
  NTKComplicationController *obj;

  if (self->_presentationState)
  {
    v3 = 0;
  }
  else
  {
    +[NTKComplicationController controllerForComplication:variant:device:](NTKComplicationController, "controllerForComplication:variant:device:", self->_complication, self->_variant, self->_device);
    v3 = (NTKComplicationController *)objc_claimAutoreleasedReturnValue();
  }
  p_controller = &self->_controller;
  controller = self->_controller;
  if (controller != v3)
  {
    obj = v3;
    if (controller && self->_wrapperView)
      -[NTKComplicationController removeDisplayWrapper:](controller, "removeDisplayWrapper:");
    objc_storeStrong((id *)&self->_controller, obj);
    -[NTKComplicationViewController _recreateDisplayIfNecessary](self, "_recreateDisplayIfNecessary");
    -[NTKComplicationController addDisplayWrapper:withDisplayProperties:](*p_controller, "addDisplayWrapper:withDisplayProperties:", self->_wrapperView, self->_displayProperties);
    -[NTKComplicationController setTouchObserver:forDisplayWrapper:](*p_controller, "setTouchObserver:forDisplayWrapper:", self, self->_wrapperView);
    v3 = obj;
  }

}

- (void)_recreateDisplayIfNecessary
{
  objc_class *v3;
  objc_class *v4;
  id v5;
  id v6;

  v3 = -[NTKComplicationController richComplicationDisplayViewClass](self->_controller, "richComplicationDisplayViewClass");
  if (v3)
  {
    v4 = v3;
    if (-[objc_class instancesRespondToSelector:](v3, "instancesRespondToSelector:", sel_initWithFamily_))
      v5 = (id)objc_msgSend([v4 alloc], "initWithFamily:", -[NTKComplicationVariant family](self->_variant, "family"));
    else
      v5 = objc_alloc_init(v4);
    v6 = v5;
    -[NTKComplicationDisplayWrapperView setCustomDisplay:](self->_wrapperView, "setCustomDisplay:", v5);

  }
}

- (void)_applyStyleIfPossible
{
  NTKComplicationDisplayWrapperView *wrapperView;
  id v4;

  wrapperView = self->_wrapperView;
  if (wrapperView)
  {
    -[NTKComplicationDisplayWrapperView display](wrapperView, "display");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[NTKComplicationViewController _applyStyleToDisplay:](self, "_applyStyleToDisplay:", v4);

  }
}

- (void)_applyStyleToDisplay:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "conformsToProtocol:", &unk_1F8E0B098))
  {
    v4 = v9;
    -[NTKComplicationViewController style](self, "style");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "circularPlatterColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPlatterColor:", v6);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v9;
    -[NTKComplicationViewController style](self, "style");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFontStyle:", objc_msgSend(v8, "fontStyle"));

    objc_msgSend(v7, "setFilterProvider:", self->_monochromeModel);
    objc_msgSend(v7, "transitionToMonochromeWithFraction:", 0.0);

  }
}

- (CGAffineTransform)_contentTransform
{
  CGAffineTransform *result;
  uint64_t v6;
  __int128 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;

  result = -[NTKComplication complicationType](self->_complication, "complicationType");
  if (result == (CGAffineTransform *)56)
  {
    v6 = MEMORY[0x1E0C9BAA8];
    v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v7;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v6 + 32);
  }
  else
  {
    -[NTKComplicationViewController variant](self, "variant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "family");
    -[NTKComplicationViewController device](self, "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKComplicationMetrics defaultMetricsForFamily:device:](NTKComplicationMetrics, "defaultMetricsForFamily:device:", v9, v10);
    v33 = (id)objc_claimAutoreleasedReturnValue();

    -[NTKComplicationViewController variant](self, "variant");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "metrics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "size");
    v14 = v13;
    objc_msgSend(v33, "size");
    v16 = v15;
    objc_msgSend(v33, "safeAreaInsets");
    v19 = v14 - (v17 + v18);
    v22 = v16 - (v20 + v21);
    objc_msgSend(v12, "size");
    v24 = v23;
    objc_msgSend(v12, "size");
    v26 = v25;
    objc_msgSend(v12, "safeAreaInsets");
    v31 = (v24 - (v27 + v28)) / v19;
    v32 = (v26 - (v29 + v30)) / v22;
    if (v31 < v32)
      v32 = v31;
    CGAffineTransformMakeScale(retstr, v32, v32);

  }
  return result;
}

- (id)_effectiveMetrics
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (-[NTKComplication complicationType](self->_complication, "complicationType") == 56)
  {
    -[NTKComplicationViewController variant](self, "variant");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "metrics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NTKComplicationViewController variant](self, "variant");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "family");
    -[NTKComplicationViewController device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKComplicationMetrics defaultMetricsForFamily:device:](NTKComplicationMetrics, "defaultMetricsForFamily:device:", v5, v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)displayWrapperTemplateBackgroundChanged
{
  id v3;

  -[NTKComplicationViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "complicationViewControllerBackgroundChanged:", self);

}

- (CLKComplicationBackgroundDescriptor)backgroundDescriptor
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  id v8;
  void *v9;

  -[NTKComplicationDisplayWrapperView complicationTemplate](self->_wrapperView, "complicationTemplate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[NTKComplicationVariant metrics](self->_variant, "metrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "opaque");

    v8 = objc_alloc(MEMORY[0x1E0C94140]);
    if (v7)
      v5 = (id)objc_msgSend(v8, "initWithMaterialBackground");
    else
      v5 = (id)objc_msgSend(v8, "initWithClearBackground");
  }
  v9 = v5;

  return (CLKComplicationBackgroundDescriptor *)v9;
}

- (void)descriptorsDidChangeForDescriptorProvider:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__NTKComplicationViewController_descriptorsDidChangeForDescriptorProvider___block_invoke;
  v6[3] = &unk_1E6BCD778;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __75__NTKComplicationViewController_descriptorsDidChangeForDescriptorProvider___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "_updateWidgetDescriptorForComplication:withProvider:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1008), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)complicationController:(id)a3 touchedUpForDisplayWrapper:(id)a4
{
  id WeakRetained;

  -[NTKComplicationViewController setTouchedDown:](self, "setTouchedDown:", 0, a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "complicationViewControllerTouchedDownChanged:", self);

}

- (void)complicationController:(id)a3 touchedDownForDisplayWrapper:(id)a4
{
  id WeakRetained;

  -[NTKComplicationViewController setTouchedDown:](self, "setTouchedDown:", 1, a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "complicationViewControllerTouchedDownChanged:", self);

}

- (void)willLaunchAppForComplicationDisplayWrapper:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "complicationViewControllerWillPerformAppLaunch:", self);

}

- (NTKComplication)complication
{
  return self->_complication;
}

- (NTKComplicationVariant)variant
{
  return self->_variant;
}

- (CLKDevice)device
{
  return self->_device;
}

- (NTKComplicationStyle)style
{
  return self->_style;
}

- (NTKComplicationControllerDisplayProperties)displayProperties
{
  return self->_displayProperties;
}

- (NTKComplicationViewControllerDelegate)delegate
{
  return (NTKComplicationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)presentationState
{
  return self->_presentationState;
}

- (BOOL)forceLivePresentationState
{
  return self->_forceLivePresentationState;
}

- (BOOL)touchedDown
{
  return self->_touchedDown;
}

- (void)setTouchedDown:(BOOL)a3
{
  self->_touchedDown = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayProperties, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_variant, 0);
  objc_storeStrong((id *)&self->_complication, 0);
  objc_storeStrong((id *)&self->_widgetDescriptor, 0);
  objc_storeStrong((id *)&self->_monochromeModel, 0);
  objc_storeStrong((id *)&self->_wrapperView, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
