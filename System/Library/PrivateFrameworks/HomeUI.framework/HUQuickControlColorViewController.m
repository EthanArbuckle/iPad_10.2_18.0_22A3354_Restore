@implementation HUQuickControlColorViewController

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
  -[HUQuickControlSingleControlViewController invalidateViewProfile](self, "invalidateViewProfile");
}

+ (Class)controlItemClass
{
  return (Class)objc_opt_class();
}

- (void)updateValueFromControlItem
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DC0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v5, "BOOLValue");
    -[HUQuickControlSingleControlViewController viewProfile](self, "viewProfile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNaturalLightingEnabled:", v6);

  }
  v8.receiver = self;
  v8.super_class = (Class)HUQuickControlColorViewController;
  -[HUQuickControlSingleControlViewController updateValueFromControlItem](&v8, sel_updateValueFromControlItem);

}

- (unint64_t)_paletteType
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  unint64_t v7;
  unint64_t v8;

  -[HUQuickControlSingleControlViewController viewProfile](self, "viewProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsNaturalLighting");

  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsRGBColor");

  v7 = 2;
  if (!v4)
    v7 = 0;
  v8 = 3;
  if (!v4)
    v8 = 1;
  if (v6)
    return v7;
  else
    return v8;
}

- (id)createInteractionCoordinator
{
  void *v3;
  void *v4;
  HUQuickControlColorView *v5;
  void *v6;
  HUQuickControlColorView *v7;
  HUQuickControlColorInteractionCoordinator *v8;

  -[HUQuickControlViewController home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_colorPaletteOfType:", -[HUQuickControlColorViewController _paletteType](self, "_paletteType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = [HUQuickControlColorView alloc];
  -[HUQuickControlSingleControlViewController viewProfile](self, "viewProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HUQuickControlColorView initWithProfile:colorPalette:](v5, "initWithProfile:colorPalette:", v6, v4);

  v8 = -[HUQuickControlColorInteractionCoordinator initWithControlView:colorPalette:delegate:]([HUQuickControlColorInteractionCoordinator alloc], "initWithControlView:colorPalette:delegate:", v7, v4, self);
  -[HUQuickControlSimpleInteractionCoordinator setShouldDismissAutomatically:](v8, "setShouldDismissAutomatically:", 0);

  return v8;
}

- (id)createViewProfile
{
  HUQuickControlColorViewProfile *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(HUQuickControlColorViewProfile);
  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlColorViewProfile setSupportsRGBColor:](v3, "setSupportsRGBColor:", objc_msgSend(v4, "supportsRGBColor"));

  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlColorViewProfile setSupportsNaturalLighting:](v3, "setSupportsNaturalLighting:", objc_msgSend(v5, "supportsNaturalLighting"));

  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlColorViewProfile setNaturalLightingEnabled:](v3, "setNaturalLightingEnabled:", objc_msgSend(v6, "naturalLightingEnabled"));

  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlColorViewProfile setColorProfile:](v3, "setColorProfile:", v8);

  -[HUQuickControlColorViewProfile setMode:](v3, "setMode:", -[HUQuickControlColorViewController mode](self, "mode"));
  -[HUQuickControlViewProfile setOrientation:](v3, "setOrientation:", 1);
  return v3;
}

- (id)controlToViewValueTransformer
{
  return (id)objc_msgSend(MEMORY[0x1E0D319D8], "transformerForValueClass:transformBlock:reverseTransformBlock:", objc_opt_class(), &__block_literal_global_18, &__block_literal_global_8);
}

id __66__HUQuickControlColorViewController_controlToViewValueTransformer__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  if (a2)
  {
    v2 = (objc_class *)MEMORY[0x1E0D31300];
    v3 = a2;
    v4 = (void *)objc_msgSend([v2 alloc], "initWithColorCollection:", v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t __66__HUQuickControlColorViewController_controlToViewValueTransformer__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "colorValue");
}

- (void)interactionCoordinator:(id)a3 colorPaletteDidChange:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  -[HUQuickControlViewController home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "hf_updateColorPalette:type:", v5, -[HUQuickControlColorViewController _paletteType](self, "_paletteType"));

  -[HUQuickControlSingleControlViewController interactionCoordinator](self, "interactionCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "controlView");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setColorPalette:", v5);
  if (objc_msgSend(v10, "isSelectedColorInPalette"))
  {
    -[HUQuickControlViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "quickControlViewControllerDidUpdateStatusOverrides:", self);

  }
}

- (void)presentFullColorViewForInteractionCoordinator:(id)a3 selectedColorIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  HUQuickControlColorViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  HUQuickControlColorViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;

  objc_opt_class();
  -[HUQuickControlSingleControlViewController interactionCoordinator](self, "interactionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "controlView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v40 = v7;

  if (v40)
    objc_msgSend(v40, "storeCurrentColorInformationAsOriginalValues");
  v8 = [HUQuickControlColorViewController alloc];
  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlViewController home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlViewController itemUpdater](self, "itemUpdater");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HUQuickControlSingleControlViewController initWithControlItem:home:itemUpdater:controlOrientation:preferredControl:](v8, "initWithControlItem:home:itemUpdater:controlOrientation:preferredControl:", v9, v10, v11, -[HUQuickControlViewController controlOrientation](self, "controlOrientation"), -[HUQuickControlViewController preferredControl](self, "preferredControl"));
  -[HUQuickControlColorViewController setColorViewController:](self, "setColorViewController:", v12);

  -[HUQuickControlColorViewController colorViewController](self, "colorViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMode:", 1);

  -[HUQuickControlColorViewController colorViewController](self, "colorViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPresentingColorViewController:", self);

  objc_opt_class();
  -[HUQuickControlColorViewController colorViewController](self, "colorViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "interactionCoordinator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "controlView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  if (v19)
  {
    objc_msgSend(v40, "linearPaletteViewSelectedColorIndexPath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updateSelectedColorIndexPathToIndexPath:", v20);

    objc_msgSend(v40, "value");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setValue:", v21);

    objc_msgSend(v19, "storeCurrentColorInformationAsOriginalValues");
  }
  v22 = objc_alloc(MEMORY[0x1E0CEA7B8]);
  -[HUQuickControlColorViewController colorViewController](self, "colorViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v22, "initWithRootViewController:", v23);

  v25 = 2;
  objc_msgSend(v24, "setModalPresentationStyle:", 2);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelButtonTapped);
  -[HUQuickControlColorViewController colorViewController](self, "colorViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "navigationItem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setLeftBarButtonItem:", v26);

  _HULocalizedStringWithDefaultValue(CFSTR("HUQuickControlColorFullPickerModeViewControllerTitle"), CFSTR("HUQuickControlColorFullPickerModeViewControllerTitle"), 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlColorViewController colorViewController](self, "colorViewController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setTitle:", v29);

  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_doneButtonTapped);
  -[HUQuickControlColorViewController colorViewController](self, "colorViewController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "navigationItem");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setRightBarButtonItem:", v31);

  if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials") & 1) == 0)
  {
    -[HUQuickControlColorViewController view](self, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "traitCollection");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v35, "userInterfaceStyle");

  }
  +[HUQuickControlUtilities backgroundColorForUserInterfaceStyle:](HUQuickControlUtilities, "backgroundColorForUserInterfaceStyle:", v25);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlColorViewController colorViewController](self, "colorViewController");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setBackgroundColor:", v36);

  objc_msgSend(v24, "setOverrideUserInterfaceStyle:", v25);
  v39 = -[UIViewController hu_presentPreloadableViewController:animated:](self, "hu_presentPreloadableViewController:animated:", v24, 1);

}

- (void)interactionCoordinator:(id)a3 didSelectColorAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a4;
  objc_opt_class();
  -[HUQuickControlSingleControlViewController interactionCoordinator](self, "interactionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "controlView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8 && objc_msgSend(v8, "mode") == 1)
  {
    -[HUQuickControlColorViewController presentingColorViewController](self, "presentingColorViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didSelectColorAtIndexPath:", v10);

  }
}

- (void)interactionCoordinator:(id)a3 viewValueDidChange:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v7, "isUserInteractionActive") & 1) == 0)
    NSLog(CFSTR("Received a value change from interactionCoordinator %@ when user interaction is not active! This doesn't make any sense and is likely a bug."), v7);
  -[HUQuickControlColorViewController controlToViewValueTransformer](self, "controlToViewValueTransformer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForTransformedValue:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v11 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  objc_opt_class();
  v14 = v11;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  if (v13)
  {
    -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setNaturalLightingEnabled:", 0);

    v20.receiver = self;
    v20.super_class = (Class)HUQuickControlColorViewController;
    -[HUQuickControlSingleControlViewController interactionCoordinator:viewValueDidChange:](&v20, sel_interactionCoordinator_viewValueDidChange_, v7, v8);
  }
  else if (v16)
  {
    -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setNaturalLightingEnabled:", 1);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUQuickControlColorViewController.m"), 205, CFSTR("Unknown color value: %@"), v14);

  }
}

- (void)didSelectColorAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  objc_opt_class();
  -[HUQuickControlSingleControlViewController interactionCoordinator](self, "interactionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controlView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7 && !objc_msgSend(v7, "mode"))
    objc_msgSend(v7, "updateSelectedColorIndexPathToIndexPath:", v8);

}

- (void)cancelButtonTapped
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  HUQuickControlColorViewController *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = self;
    v9 = 2080;
    v10 = "-[HUQuickControlColorViewController cancelButtonTapped]";
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped cancel button", (uint8_t *)&v7, 0x16u);
  }

  -[HUQuickControlSingleControlViewController interactionCoordinator](self, "interactionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelButtonTappedToDismissColorViewController");

  -[HUQuickControlColorViewController colorViewController](self, "colorViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interactionCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancelButtonTappedToDismissColorViewController");

  -[HUQuickControlColorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)doneButtonTapped
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  BOOL v19;
  int v20;
  HUQuickControlColorViewController *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412546;
    v21 = self;
    v22 = 2080;
    v23 = "-[HUQuickControlColorViewController doneButtonTapped]";
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped done button", (uint8_t *)&v20, 0x16u);
  }

  objc_opt_class();
  -[HUQuickControlSingleControlViewController interactionCoordinator](self, "interactionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v7 = v6;
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EF2FFBF8))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_opt_class();
  objc_msgSend(v9, "controlView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_opt_class();
  -[HUQuickControlColorViewController colorViewController](self, "colorViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "interactionCoordinator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "controlView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  objc_msgSend(v17, "colorPalette");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (v12)
      v19 = v18 == 0;
    else
      v19 = 1;
    if (!v19)
      objc_msgSend(v9, "controlView:colorPaletteDidChange:", v12, v18);
  }
  -[HUQuickControlColorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)quickControlItemUpdater:(id)a3 didUpdateResultsForControlItems:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HUQuickControlColorViewController;
  -[HUQuickControlSingleControlViewController quickControlItemUpdater:didUpdateResultsForControlItems:](&v10, sel_quickControlItemUpdater_didUpdateResultsForControlItems_, v6, v7);
  -[HUQuickControlColorViewController colorViewController](self, "colorViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HUQuickControlColorViewController colorViewController](self, "colorViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "quickControlItemUpdater:didUpdateResultsForControlItems:", v6, v7);

  }
}

- (CGSize)preferredContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[HUQuickControlColorViewController presentingViewController](self, "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (NSIndexPath)selectedColorIndexPath
{
  return self->_selectedColorIndexPath;
}

- (void)setSelectedColorIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_selectedColorIndexPath, a3);
}

- (HUQuickControlColorViewController)colorViewController
{
  return self->_colorViewController;
}

- (void)setColorViewController:(id)a3
{
  objc_storeStrong((id *)&self->_colorViewController, a3);
}

- (HUQuickControlColorViewController)presentingColorViewController
{
  return (HUQuickControlColorViewController *)objc_loadWeakRetained((id *)&self->_presentingColorViewController);
}

- (void)setPresentingColorViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingColorViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingColorViewController);
  objc_storeStrong((id *)&self->_colorViewController, 0);
  objc_storeStrong((id *)&self->_selectedColorIndexPath, 0);
}

@end
