@implementation NTKWhistlerSubdialsFaceView

- (BOOL)showGossamerUI
{
  int v3;
  void *v4;
  char v5;

  v3 = -[NTKWhistlerSubdialsFaceView isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class());
  if (v3)
  {
    -[NTKFaceView device](self, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = NTKShowGossamerUI(v4);

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (NTKWhistlerSubdialsFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8;
  id v9;
  NTKMonochromeModel *v10;
  NTKMonochromeModel *topFilterProvider;
  NTKMonochromeModel *v12;
  NTKMonochromeModel *centerFilterProvider;
  NTKMonochromeModel *v14;
  NTKMonochromeModel *bottomFilterProvider;
  NTKWhistlerSubdialsFaceView *v16;
  uint64_t v17;
  UIView *timeViewContainerView;
  void *v19;
  void *v20;
  objc_super v22;

  v8 = a5;
  v9 = a4;
  v10 = -[NTKMonochromeModel initWithDevice:]([NTKMonochromeModel alloc], "initWithDevice:", v9);
  topFilterProvider = self->_topFilterProvider;
  self->_topFilterProvider = v10;

  v12 = -[NTKMonochromeModel initWithDevice:]([NTKMonochromeModel alloc], "initWithDevice:", v9);
  centerFilterProvider = self->_centerFilterProvider;
  self->_centerFilterProvider = v12;

  v14 = -[NTKMonochromeModel initWithDevice:]([NTKMonochromeModel alloc], "initWithDevice:", v9);
  bottomFilterProvider = self->_bottomFilterProvider;
  self->_bottomFilterProvider = v14;

  v22.receiver = self;
  v22.super_class = (Class)NTKWhistlerSubdialsFaceView;
  v16 = -[NTKFaceView initWithFaceStyle:forDevice:clientIdentifier:](&v22, sel_initWithFaceStyle_forDevice_clientIdentifier_, a3, v9, v8);

  if (v16)
  {
    v17 = objc_opt_new();
    timeViewContainerView = v16->_timeViewContainerView;
    v16->_timeViewContainerView = (UIView *)v17;

    -[NTKFaceView contentView](v16, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v16->_timeViewContainerView);

    objc_msgSend(MEMORY[0x1E0C94518], "sharedMonitor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSensitiveUIObserver:", v16);

    v16->_numberSystem = -1;
  }
  return v16;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0C94518], "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeSensitiveUIObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)NTKWhistlerSubdialsFaceView;
  -[NTKFaceView dealloc](&v4, sel_dealloc);
}

- (id)createFaceColorPalette
{
  id WeakRetained;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  NTKGossamerColorPalette *v13;
  _QWORD v15[5];

  os_unfair_lock_lock((os_unfair_lock_t)&createFaceColorPalette___lock);
  WeakRetained = objc_loadWeakRetained(&createFaceColorPalette___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v4 = WeakRetained;
  -[NTKFaceView device](self, "device");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(&createFaceColorPalette___cachedDevice);
  if (v5 != v6)
  {

LABEL_5:
    -[NTKFaceView device](self, "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&createFaceColorPalette___cachedDevice, v10);

    v11 = objc_loadWeakRetained(&createFaceColorPalette___cachedDevice);
    createFaceColorPalette___previousCLKDeviceVersion = objc_msgSend(v11, "version");

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __53__NTKWhistlerSubdialsFaceView_createFaceColorPalette__block_invoke;
    v15[3] = &unk_1E6BD0658;
    v15[4] = self;
    -[NTKFaceView device](self, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    __53__NTKWhistlerSubdialsFaceView_createFaceColorPalette__block_invoke((uint64_t)v15);

    goto LABEL_6;
  }
  -[NTKFaceView device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "version");
  v9 = createFaceColorPalette___previousCLKDeviceVersion;

  if (v8 != v9)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&createFaceColorPalette___lock);
  v13 = objc_alloc_init(NTKGossamerColorPalette);
  -[NTKGossamerColorPalette setBackgroundStyle:](v13, "setBackgroundStyle:", self->_backgroundStyle);
  -[NTKGossamerColorPalette setApproximateComplicationPositions:](v13, "setApproximateComplicationPositions:", *(double *)&createFaceColorPalette__approximateComplicationPositions_0, *(double *)&createFaceColorPalette__approximateComplicationPositions_1, *(double *)&createFaceColorPalette__approximateComplicationPositions_2);
  return v13;
}

void __53__NTKWhistlerSubdialsFaceView_createFaceColorPalette__block_invoke(uint64_t a1)
{
  uint64_t v2;
  double (**v3)(void *, const __CFString *);
  _QWORD v4[6];

  objc_msgSend(*(id *)(a1 + 32), "_loadLayoutRules");
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__NTKWhistlerSubdialsFaceView_createFaceColorPalette__block_invoke_2;
  v4[3] = &unk_1E6BD9950;
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[5] = v2;
  v3 = (double (**)(void *, const __CFString *))_Block_copy(v4);
  createFaceColorPalette__approximateComplicationPositions_0 = v3[2](v3, CFSTR("top"));
  createFaceColorPalette__approximateComplicationPositions_1 = v3[2](v3, CFSTR("center"));
  createFaceColorPalette__approximateComplicationPositions_2 = v3[2](v3, CFSTR("bottom"));

}

CGFloat __53__NTKWhistlerSubdialsFaceView_createFaceColorPalette__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  CGFloat v5;
  CGRect v7;

  objc_msgSend(*(id *)(a1 + 32), "complicationLayoutforSlot:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultLayoutRuleForState:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "referenceFrame");
  v5 = CGRectGetMidY(v7) / *(double *)(a1 + 40);

  return v5;
}

- (id)_paletteApplyingTritiumFractionToPalette:(id)a3
{
  id v4;
  void *v5;
  double paletteTritiumFraction;
  id v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  paletteTritiumFraction = self->_paletteTritiumFraction;
  if (paletteTritiumFraction == 1.0)
  {
    objc_msgSend(v4, "tritiumPalette");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (paletteTritiumFraction == 0.0)
  {
    v7 = v4;
  }
  else
  {
    objc_msgSend(v4, "tritiumPaletteWithProgress:");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  id v7;
  id v8;
  __objc2_class **v9;
  void *v10;

  v7 = a3;
  v8 = a5;
  if (a4 == 11)
  {
    v9 = off_1E6BCBB00;
  }
  else
  {
    if (a4 != 10)
    {
      v10 = 0;
      goto LABEL_7;
    }
    v9 = off_1E6BCB9A8;
  }
  -[__objc2_class viewWithLegacyComplicationType:](*v9, "viewWithLegacyComplicationType:", objc_msgSend(v7, "complicationType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v10;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v7, "setDelegate:", self);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v7;
    objc_msgSend(v5, "transitThemeFromTheme:toTheme:fraction:", 1, 1, 1.0);
    if (-[NTKWhistlerSubdialsFaceView showGossamerUI](self, "showGossamerUI"))
    {
      if (objc_msgSend(v5, "conformsToProtocol:", &unk_1F8E0B098))
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setPlatterColor:", v6);

      }
      if (objc_msgSend(v5, "conformsToProtocol:", &unk_1F8E31BD0))
        objc_msgSend(v5, "setTintedFraction:", self->_tintedFraction);
      objc_msgSend(v5, "transitionToMonochromeWithFraction:", self->_monochromeFraction);
    }
    else
    {
      -[NTKWhistlerSubdialsFaceView updateMonochromeColorForRichComplicationView:](self, "updateMonochromeColorForRichComplicationView:", v5);
    }

  }
}

- (id)_filterProviderForSlot:(id)a3
{
  id v4;
  int *v5;
  NTKWhistlerSubdialsFaceView *v6;

  v4 = a3;
  if (-[NTKWhistlerSubdialsFaceView showGossamerUI](self, "showGossamerUI"))
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("top")) & 1) != 0)
    {
      v5 = &OBJC_IVAR___NTKWhistlerSubdialsFaceView__topFilterProvider;
LABEL_8:
      self = *(NTKWhistlerSubdialsFaceView **)((char *)&self->super.super.super.super.isa + *v5);
      goto LABEL_9;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("center")) & 1) != 0)
    {
      v5 = &OBJC_IVAR___NTKWhistlerSubdialsFaceView__centerFilterProvider;
      goto LABEL_8;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("bottom")))
    {
      v5 = &OBJC_IVAR___NTKWhistlerSubdialsFaceView__bottomFilterProvider;
      goto LABEL_8;
    }
  }
LABEL_9:
  v6 = self;

  return v6;
}

- (void)updateMonochromeColorForRichComplicationView:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[NTKFaceView faceColorPalette](self, "faceColorPalette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isWhiteColor"))
  {

  }
  else
  {
    -[NTKFaceView faceColorPalette](self, "faceColorPalette");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isBlackColor");

    if ((v6 & 1) == 0)
    {
      objc_msgSend(v7, "updateMonochromeColor");
      goto LABEL_6;
    }
  }
  objc_msgSend(v7, "transitionToMonochromeWithFraction:", 0.0);
LABEL_6:

}

- (void)_loadSnapshotContentViews
{
  void *v3;
  NTKGradientComposedView *v4;
  void *v5;
  NTKGradientComposedView *v6;
  NTKGradientComposedView *composedView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKWhistlerSubdialsFaceView;
  -[NTKFaceView _loadSnapshotContentViews](&v8, sel__loadSnapshotContentViews);
  if (!self->_composedView && -[NTKWhistlerSubdialsFaceView showGossamerUI](self, "showGossamerUI"))
  {
    -[NTKFaceView rootContainerView](self, "rootContainerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");
    v4 = [NTKGradientComposedView alloc];
    -[NTKFaceView device](self, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NTKGradientComposedView initWithDevice:](v4, "initWithDevice:", v5);
    composedView = self->_composedView;
    self->_composedView = v6;

    -[NTKGradientComposedView setRootContainerView:](self->_composedView, "setRootContainerView:", v3);
    -[NTKWhistlerSubdialsFaceView addSubview:](self, "addSubview:", self->_composedView);

  }
  -[NTKWhistlerSubdialsFaceView _setupDialView](self, "_setupDialView");
}

- (void)_unloadSnapshotContentViews
{
  NTKGradientComposedView *composedView;
  NTKGradientComposedView *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKWhistlerSubdialsFaceView;
  -[NTKFaceView _unloadSnapshotContentViews](&v7, sel__unloadSnapshotContentViews);
  composedView = self->_composedView;
  if (composedView)
  {
    -[NTKGradientComposedView removeFromSuperview](composedView, "removeFromSuperview");
    v4 = self->_composedView;
    self->_composedView = 0;

    -[NTKFaceView rootContainerView](self, "rootContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");
    -[NTKFaceView timeView](self, "timeView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKWhistlerSubdialsFaceView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v5, v6);

  }
  -[NTKWhistlerSubdialsFaceView _removeDialView](self, "_removeDialView");
}

- (void)_setupDialView
{
  void *v3;
  UIView *timeViewContainerView;
  void *v5;
  UIView *v6;
  id v7;

  -[NTKWhistlerSubdialsFaceView dialView](self, "dialView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceView setTimeView:](self, "setTimeView:", v3);

  timeViewContainerView = self->_timeViewContainerView;
  -[NTKFaceView timeView](self, "timeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](timeViewContainerView, "addSubview:", v5);

  v6 = self->_timeViewContainerView;
  -[NTKFaceView timeView](self, "timeView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  -[UIView setBounds:](v6, "setBounds:");

}

- (id)dialView
{
  void *v3;
  double v4;
  NTKWhistlerSubdialsTimeView *v5;
  void *v6;
  NTKWhistlerSubdialsTimeView *v7;
  _BOOL4 v8;
  void *v9;
  double v11[21];

  -[NTKFaceView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_46(v3, (uint64_t)v11);
  v4 = v11[0];

  v5 = [NTKWhistlerSubdialsTimeView alloc];
  -[NTKFaceView device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NTKWhistlerSubdialsTimeView initWithFrame:style:andDevice:](v5, "initWithFrame:style:andDevice:", 0, v6, 0.0, 0.0, v4, v4);

  v8 = -[NTKWhistlerSubdialsFaceView showGossamerUI](self, "showGossamerUI");
  -[NTKFaceView faceColorPalette](self, "faceColorPalette");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    -[NTKDualTimeView applyGossamerColorPalette:](v7, "applyGossamerColorPalette:", v9);
  else
    -[NTKDualTimeView setColorPalette:](v7, "setColorPalette:", v9);

  -[NTKWhistlerSubdialsTimeView setForcedNumberSystemForDigitalTimeLabel:](v7, "setForcedNumberSystemForDigitalTimeLabel:", self->_numberSystem);
  return v7;
}

- (void)_removeDialView
{
  void *v3;

  -[NTKFaceView timeView](self, "timeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[NTKFaceView setTimeView:](self, "setTimeView:", 0);
}

- (BOOL)_isAnalog
{
  void *v2;
  BOOL v3;

  -[NTKFaceView optionForCustomEditMode:slot:](self, "optionForCustomEditMode:slot:", 15, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "style") == 0;

  return v3;
}

- (void)updateWithColorPalette:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NTKWhistlerSubdialsFaceView _applyTransitionFraction:fromPalette:toPalette:](self, "_applyTransitionFraction:fromPalette:toPalette:", v4, v4, 0.0);
  -[NTKFaceView timeView](self, "timeView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColorPalette:", v4);

}

- (BOOL)_wantsStatusBarIconShadow
{
  return self->_backgroundStyle != 0;
}

- (void)_loadLayoutRules
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __47__NTKWhistlerSubdialsFaceView__loadLayoutRules__block_invoke;
  v2[3] = &unk_1E6BD1F38;
  v2[4] = self;
  NTKEnumerateComplicationStates(v2);
}

void __47__NTKWhistlerSubdialsFaceView__loadLayoutRules__block_invoke(uint64_t a1, uint64_t a2)
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  double v14;
  __int128 v15;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double MaxY;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  CGFloat sx[2];
  __int128 v58;
  uint64_t v59;
  CGRect v60;
  CGRect v61;

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v59 = 0;
  *(_OWORD *)sx = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_46(v12, (uint64_t)&v49);

  v45 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v46 = *MEMORY[0x1E0DC49E8];
  v43 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  v44 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v13 = *((double *)&v53 + 1);
  v15 = v54;
  v14 = *(double *)&v55;
  v16 = a2 & 0xFFFFFFFFFFFFFFFELL;
  v41 = sx[0];
  v60.origin.x = v5;
  v60.origin.y = v7;
  v60.size.width = v9;
  v60.size.height = v11;
  MaxY = CGRectGetMaxY(v60);
  v17 = *(double *)&v53;
  v18 = *((double *)&v50 + 1);
  v38 = *(double *)&v51;
  v39 = *((double *)&v52 + 1);
  v20 = *((double *)&v51 + 1);
  v19 = *(double *)&v52;
  objc_msgSend(*(id *)(a1 + 32), "device");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v14;
  +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v21, 3, 3, v17, v18, v20, v19, v13, v15, v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "complicationLayoutforSlot:", CFSTR("top"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setDefaultLayoutRule:forState:", v22, a2);

  v61.origin.x = v17;
  v61.origin.y = v18;
  v61.size.width = v20;
  v61.size.height = v19;
  v24 = CGRectGetMaxY(v61);
  v25 = 0.0;
  if ((a2 & 0xFFFFFFFFFFFFFFFELL) == 2)
    v25 = v41;
  v26 = MaxY - v38 - v25 - v39;
  if (v16 == 2)
    v27 = (v26 + v39 * (1.0 - sx[1]) * 0.5 - v24 - v19) * 0.5;
  else
    v27 = *(double *)&v50;
  v28 = v24 + v27;
  objc_msgSend(*(id *)(a1 + 32), "device");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v29, 3, 3, v17, v28, v20, v19, v13, v15, v42);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "complicationLayoutforSlot:", CFSTR("center"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setDefaultLayoutRule:forState:", v30, a2);

  objc_msgSend(*(id *)(a1 + 32), "device");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "screenBounds");
  v34 = v33;

  objc_msgSend(*(id *)(a1 + 32), "device");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v35, 3, 3, 0.0, v26, v34, v39, v46, v45, v44, v43);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 == 2)
  {
    CGAffineTransformMakeScale(&v48, sx[1], sx[1]);
    v47 = v48;
    objc_msgSend(v36, "setEditingTransform:", &v47);
  }
  objc_msgSend(*(id *)(a1 + 32), "complicationLayoutforSlot:", CFSTR("bottom"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setDefaultLayoutRule:forState:", v36, a2);

}

- (int64_t)_keylineStyleForComplicationSlot:(id)a3
{
  id v4;
  int64_t v5;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("bottom")))
  {
    v7.receiver = self;
    v7.super_class = (Class)NTKWhistlerSubdialsFaceView;
    v5 = -[NTKFaceView _keylineStyleForComplicationSlot:](&v7, sel__keylineStyleForComplicationSlot_, v4);
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  objc_super v19;
  CGRect v20;

  v19.receiver = self;
  v19.super_class = (Class)NTKWhistlerSubdialsFaceView;
  -[NTKFaceView layoutSubviews](&v19, sel_layoutSubviews);
  v18 = 0;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NTKFaceView device](self, "device", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_46(v3, (uint64_t)&v13);

  -[NTKFaceView timeView](self, "timeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  -[NTKWhistlerSubdialsFaceView bounds](self, "bounds");
  -[UIView setCenter:](self->_timeViewContainerView, "setCenter:", CGRectGetMaxX(v20) - *(double *)&v15 - v6 * 0.5, v8 * 0.5 + *((double *)&v14 + 1));
  v9 = MEMORY[0x1BCCA72B8](-[UIView bounds](self->_timeViewContainerView, "bounds"));
  v11 = v10;
  -[NTKFaceView timeView](self, "timeView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCenter:", v9, v11);

}

- (double)_horizontalPaddingForStatusBar
{
  void *v2;
  double v3;
  _BYTE v5[144];
  double v6;

  -[NTKFaceView device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_46(v2, (uint64_t)v5);
  v3 = v6;

  return v3;
}

- (double)_verticalPaddingForStatusBar
{
  double v3;
  double v4;
  void *v5;
  _BYTE v7[160];
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKWhistlerSubdialsFaceView;
  -[NTKFaceView _verticalPaddingForStatusBar](&v9, sel__verticalPaddingForStatusBar);
  v4 = v3;
  if (self->_backgroundStyle == 1)
  {
    -[NTKFaceView device](self, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_46(v5, (uint64_t)v7);
    v4 = v4 + v8;

  }
  return v4;
}

- (double)_keylineCornerRadiusForComplicationSlot:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("bottom")))
  {
    -[NTKFaceView device](self, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKModuleView cornerRadiusForComplicationFamily:forDevice:](NTKModuleView, "cornerRadiusForComplicationFamily:forDevice:", 1, v5);
    v7 = v6;

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)NTKWhistlerSubdialsFaceView;
    -[NTKFaceView _keylineCornerRadiusForComplicationSlot:](&v10, sel__keylineCornerRadiusForComplicationSlot_, v4);
    v7 = v8;
  }

  return v7;
}

- (double)_minimumBreathingScaleForComplicationSlot:(id)a3
{
  int v3;
  double *v4;

  v3 = objc_msgSend(a3, "isEqualToString:", CFSTR("bottom"));
  v4 = (double *)&NTKLargeElementMinimumBreathingScale;
  if (!v3)
    v4 = (double *)&NTKSmallElementMinimumBreathingScale;
  return *v4;
}

- (void)_prepareForEditing
{
  void *v3;

  -[NTKFaceView timeView](self, "timeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEditing:", 1);

  -[NTKFaceView enumerateComplicationDisplayWrappersWithBlock:](self, "enumerateComplicationDisplayWrappersWithBlock:", &__block_literal_global_158);
}

void __49__NTKWhistlerSubdialsFaceView__prepareForEditing__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  objc_msgSend(a3, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsGroupOpacity:", 1);

}

- (void)_cleanupAfterEditing
{
  void *v3;

  -[NTKFaceView timeView](self, "timeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEditing:", 0);

  -[NTKFaceView enumerateComplicationDisplayWrappersWithBlock:](self, "enumerateComplicationDisplayWrappersWithBlock:", &__block_literal_global_46_0);
}

void __51__NTKWhistlerSubdialsFaceView__cleanupAfterEditing__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  objc_msgSend(a3, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsGroupOpacity:", 0);

}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  if (-[NTKWhistlerSubdialsFaceView showGossamerUI](self, "showGossamerUI"))
  {
    if (a4 != 15)
    {
      -[NTKFaceView faceColorPalette](self, "faceColorPalette");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (self->_complicationPlaceholderViews)
        objc_msgSend(v7, "setIsSwatchPreview:", 1);
      switch(a4)
      {
        case 10:
          -[NTKWhistlerSubdialsFaceView _applyColorsFromPalette:](self, "_applyColorsFromPalette:", v8);
          break;
        case 19:
          -[NTKWhistlerSubdialsFaceView _setNumerals:](self, "_setNumerals:", objc_msgSend(v15, "numeralOption"));
          break;
        case 17:
          v9 = objc_msgSend(v15, "backgroundStyle");
          objc_msgSend(v8, "setBackgroundStyle:", v9);
          -[NTKWhistlerSubdialsFaceView setBackgroundStyle:](self, "setBackgroundStyle:", v9);
          -[NTKWhistlerSubdialsFaceView _applyColorsFromPalette:](self, "_applyColorsFromPalette:", v8);
          -[NTKFaceView delegate](self, "delegate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "faceViewWantsComplicationKeylineFramesReloaded");

          -[NTKFaceView delegate](self, "delegate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "faceViewDidChangeWantsStatusBarIconShadow");

          -[NTKFaceView delegate](self, "delegate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "faceViewDidChangePaddingForStatusBar");

          break;
      }
      goto LABEL_17;
    }
    goto LABEL_13;
  }
  if (a4 == 19)
  {
    -[NTKWhistlerSubdialsFaceView _setNumerals:](self, "_setNumerals:", objc_msgSend(v15, "numeralOption"));
    goto LABEL_18;
  }
  if (a4 == 15)
  {
LABEL_13:
    -[NTKFaceView timeView](self, "timeView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setStyle:", objc_msgSend(v15, "style"));

LABEL_18:
    v13 = v15;
    goto LABEL_19;
  }
  v13 = v15;
  if (a4 == 10)
  {
    -[NTKFaceView faceColorPalette](self, "faceColorPalette");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKWhistlerSubdialsFaceView updateWithColorPalette:](self, "updateWithColorPalette:", v8);
LABEL_17:

    goto LABEL_18;
  }
LABEL_19:

}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  id v26;

  v26 = a4;
  v11 = a5;
  if (-[NTKWhistlerSubdialsFaceView showGossamerUI](self, "showGossamerUI"))
  {
    if (a6 != 15)
    {
      -[NTKFaceView interpolatedColorPalette](self, "interpolatedColorPalette");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fromPalette");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "toPalette");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_complicationPlaceholderViews)
      {
        objc_msgSend(v13, "setIsSwatchPreview:", 1);
        objc_msgSend(v14, "setIsSwatchPreview:", 1);
      }
      switch(a6)
      {
        case 10:
          v25 = -[NTKWhistlerSubdialsFaceView backgroundStyle](self, "backgroundStyle");
          objc_msgSend(v13, "setBackgroundStyle:", v25);
          objc_msgSend(v14, "setBackgroundStyle:", v25);
          -[NTKWhistlerSubdialsFaceView _applyColorsFromPalette:](self, "_applyColorsFromPalette:", v12);
          break;
        case 19:
          -[NTKWhistlerSubdialsFaceView _applyTransitionFraction:fromNumeralOption:toNumeralOption:](self, "_applyTransitionFraction:fromNumeralOption:toNumeralOption:", objc_msgSend(v26, "numeralOption"), objc_msgSend(v11, "numeralOption"), a3);
          break;
        case 17:
          v15 = objc_msgSend(v26, "backgroundStyle");
          v16 = objc_msgSend(v11, "backgroundStyle");
          -[NTKFaceView faceColorPalette](self, "faceColorPalette");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "pigmentEditOption");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "setPigmentEditOption:", v18);
          objc_msgSend(v13, "setBackgroundStyle:", v15);
          objc_msgSend(v14, "setPigmentEditOption:", v18);
          objc_msgSend(v14, "setBackgroundStyle:", v16);
          objc_msgSend(v12, "setTransitionFraction:", a3);
          -[NTKWhistlerSubdialsFaceView _applyColorsFromPalette:](self, "_applyColorsFromPalette:", v12);

          break;
      }

      goto LABEL_18;
    }
LABEL_13:
    -[NTKFaceView timeView](self, "timeView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "applyTransitionFraction:fromStyle:toStyle:", objc_msgSend(v26, "style"), objc_msgSend(v11, "style"), a3);

    goto LABEL_18;
  }
  switch(a6)
  {
    case 19:
      -[NTKWhistlerSubdialsFaceView _applyTransitionFraction:fromNumeralOption:toNumeralOption:](self, "_applyTransitionFraction:fromNumeralOption:toNumeralOption:", objc_msgSend(v26, "numeralOption"), objc_msgSend(v11, "numeralOption"), a3);
      break;
    case 15:
      goto LABEL_13;
    case 10:
      -[NTKFaceView interpolatedColorPalette](self, "interpolatedColorPalette");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "fromPalette");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[NTKFaceView interpolatedColorPalette](self, "interpolatedColorPalette");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "toPalette");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      -[NTKFaceView timeView](self, "timeView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "applyTransitionFraction:fromColorPalette:toColorPalette:", v20, v22, a3);

      -[NTKWhistlerSubdialsFaceView _applyTransitionFraction:fromPalette:toPalette:](self, "_applyTransitionFraction:fromPalette:toPalette:", v20, v22, a3);
      break;
  }
LABEL_18:

}

- (void)_applyTransitionFraction:(double)a3 fromNumeralOption:(unint64_t)a4 toNumeralOption:(unint64_t)a5
{
  NTKWhistlerSubdialsFaceView *v9;
  unint64_t v10;
  double v11;
  double v12;
  CGFloat v13;
  void *v14;
  void *v15;
  CGAffineTransform v16;
  CGAffineTransform v17;

  if (-[NTKFaceView isAnalog](self, "isAnalog"))
  {
    v9 = self;
    v10 = a5;
LABEL_5:
    -[NTKWhistlerSubdialsFaceView _setNumerals:](v9, "_setNumerals:", v10);
    return;
  }
  if (a4 == a5)
  {
    v9 = self;
    v10 = a4;
    goto LABEL_5;
  }
  CLKMapFractionIntoRange();
  if (a3 >= 0.5)
  {
    v12 = v11;
    a4 = a5;
  }
  else
  {
    v12 = v11;
  }
  CLKMapFractionIntoRange();
  memset(&v17, 0, sizeof(v17));
  CGAffineTransformMakeScale(&v17, v13, v13);
  -[NTKWhistlerSubdialsFaceView _setNumerals:](self, "_setNumerals:", a4);
  -[NTKFaceView timeView](self, "timeView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "digitalTimeLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setAlpha:", v12);
  v16 = v17;
  objc_msgSend(v15, "setTransform:", &v16);

}

- (void)_applyColorsFromPalette:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  NTKMonochromeModel *topFilterProvider;
  void *v11;
  NTKMonochromeModel *v12;
  void *v13;
  NTKMonochromeModel *centerFilterProvider;
  void *v15;
  NTKMonochromeModel *v16;
  void *v17;
  NTKMonochromeModel *bottomFilterProvider;
  void *v19;
  NTKMonochromeModel *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  double monochromeFraction;
  double tintedFraction;
  void *v28;
  NSArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[6];
  CGAffineTransform v39;
  CGAffineTransform v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "scaleFactor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  self->_scaleFactor = v6;

  memset(&v40, 0, sizeof(v40));
  CGAffineTransformMakeScale(&v40, self->_scaleFactor, self->_scaleFactor);
  -[NTKFaceView rootContainerView](self, "rootContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v40;
  objc_msgSend(v7, "setTransform:", &v39);

  -[NTKGradientComposedView applyGossamerColorPalette:](self->_composedView, "applyGossamerColorPalette:", v4);
  -[NTKFaceView timeView](self, "timeView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applyGossamerColorPalette:", v4);

  objc_msgSend(v4, "foregroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  topFilterProvider = self->_topFilterProvider;
  objc_msgSend(v4, "topAccentColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKMonochromeModel setAccentColor:](topFilterProvider, "setAccentColor:", v11);

  -[NTKMonochromeModel setNonAccentColor:](self->_topFilterProvider, "setNonAccentColor:", v9);
  v12 = self->_topFilterProvider;
  objc_msgSend(v4, "topApproximateBackgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKMonochromeModel setBackgroundColor:](v12, "setBackgroundColor:", v13);

  centerFilterProvider = self->_centerFilterProvider;
  objc_msgSend(v4, "centerAccentColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKMonochromeModel setAccentColor:](centerFilterProvider, "setAccentColor:", v15);

  -[NTKMonochromeModel setNonAccentColor:](self->_centerFilterProvider, "setNonAccentColor:", v9);
  v16 = self->_centerFilterProvider;
  objc_msgSend(v4, "centerApproximateBackgroundColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKMonochromeModel setBackgroundColor:](v16, "setBackgroundColor:", v17);

  bottomFilterProvider = self->_bottomFilterProvider;
  objc_msgSend(v4, "bottomAccentColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKMonochromeModel setAccentColor:](bottomFilterProvider, "setAccentColor:", v19);

  -[NTKMonochromeModel setNonAccentColor:](self->_bottomFilterProvider, "setNonAccentColor:", v9);
  v20 = self->_bottomFilterProvider;
  objc_msgSend(v4, "bottomApproximateBackgroundColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKMonochromeModel setBackgroundColor:](v20, "setBackgroundColor:", v21);

  objc_msgSend(v4, "monochromeFraction");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "doubleValue");
  self->_monochromeFraction = v23;

  objc_msgSend(v4, "tintedFraction");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "doubleValue");
  self->_tintedFraction = v25;

  monochromeFraction = self->_monochromeFraction;
  tintedFraction = self->_tintedFraction;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __55__NTKWhistlerSubdialsFaceView__applyColorsFromPalette___block_invoke;
  v38[3] = &__block_descriptor_48_e56_v24__0__NSString_8__NTKComplicationDisplayWrapperView_16l;
  *(double *)&v38[4] = tintedFraction;
  *(double *)&v38[5] = monochromeFraction;
  -[NTKFaceView enumerateComplicationDisplayWrappersWithBlock:](self, "enumerateComplicationDisplayWrappersWithBlock:", v38);
  if (self->_complicationPlaceholderViews)
  {
    objc_msgSend(v4, "swatchComplicationPlaceholderColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v29 = self->_complicationPlaceholderViews;
    v30 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v35;
      do
      {
        v33 = 0;
        do
        {
          if (*(_QWORD *)v35 != v32)
            objc_enumerationMutation(v29);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v33++), "setBackgroundColor:", v28, (_QWORD)v34);
        }
        while (v31 != v33);
        v31 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      }
      while (v31);
    }

  }
}

void __55__NTKWhistlerSubdialsFaceView__applyColorsFromPalette___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "display");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1F8E31BD0))
    objc_msgSend(v4, "setTintedFraction:", *(double *)(a1 + 32));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "transitionToMonochromeWithFraction:", *(double *)(a1 + 40));

}

- (void)loadComplicationPlaceholderViews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double MinX;
  double MinY;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSArray *v27;
  NSArray *complicationPlaceholderViews;
  NSArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[152];
  double v44;
  _BYTE v45[128];
  _QWORD v46[5];
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v46[3] = *MEMORY[0x1E0C80C00];
  if (!self->_complicationPlaceholderViews)
  {
    -[NTKFaceView normalComplicationDisplayWrapperForSlot:](self, "normalComplicationDisplayWrapperForSlot:", CFSTR("top"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceView normalComplicationDisplayWrapperForSlot:](self, "normalComplicationDisplayWrapperForSlot:", CFSTR("center"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceView normalComplicationDisplayWrapperForSlot:](self, "normalComplicationDisplayWrapperForSlot:", CFSTR("bottom"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v7 = v6 * 0.5;
    objc_msgSend(v3, "frame");
    MinX = CGRectGetMinX(v47);
    objc_msgSend(v4, "frame");
    MinY = CGRectGetMinY(v48);
    objc_msgSend(v3, "frame");
    v10 = MinY - CGRectGetMaxY(v49);
    objc_msgSend(v5, "bounds");
    v12 = v11;
    v36 = v5;
    objc_msgSend(v5, "bounds");
    v14 = v12 / v13;
    -[NTKWhistlerSubdialsFaceView bounds](self, "bounds");
    v16 = v15 + MinX * -2.0;
    objc_msgSend(v4, "frame");
    v17 = v10 + CGRectGetMaxY(v50);
    v18 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v38 = v3;
    objc_msgSend(v3, "frame");
    v19 = (void *)objc_msgSend(v18, "initWithFrame:");
    v20 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v37 = v4;
    objc_msgSend(v4, "frame");
    v21 = (void *)objc_msgSend(v20, "initWithFrame:");
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", MinX, v17, v16, v16 / v14);
    objc_msgSend(v19, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setCornerRadius:", v7);

    objc_msgSend(v21, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setCornerRadius:", v7);

    objc_msgSend(v22, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceView device](self, "device");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_46(v26, (uint64_t)v43);
    objc_msgSend(v25, "setCornerRadius:", v44);

    v46[0] = v19;
    v46[1] = v21;
    v46[2] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 3);
    v27 = (NSArray *)objc_claimAutoreleasedReturnValue();
    complicationPlaceholderViews = self->_complicationPlaceholderViews;
    self->_complicationPlaceholderViews = v27;

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v29 = self->_complicationPlaceholderViews;
    v30 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v40;
      do
      {
        v33 = 0;
        do
        {
          if (*(_QWORD *)v40 != v32)
            objc_enumerationMutation(v29);
          v34 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v33);
          -[NTKFaceView complicationContainerView](self, "complicationContainerView");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "addSubview:", v34);

          ++v33;
        }
        while (v31 != v33);
        v31 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      }
      while (v31);
    }

  }
}

- (void)_applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  char v14;
  char v15;
  double v16;
  double v17;
  double v18;
  NTKWhistlerSubdialsFaceView *v19;
  void *v20;
  void *v21;
  _QWORD v22[6];
  char v23;
  char v24;

  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "primaryColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "primaryColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isBlackColor") & 1) != 0)
    v12 = 1;
  else
    v12 = objc_msgSend(v8, "isWhiteColor");
  if ((objc_msgSend(v9, "isBlackColor") & 1) != 0)
    v13 = 1;
  else
    v13 = objc_msgSend(v9, "isWhiteColor");
  v14 = v12 & v13;
  v15 = v12 ^ v13;
  v16 = 1.0 - a3;
  v17 = 0.0;
  if ((v12 & v13) == 0)
    v17 = a3;
  if (v13 & (v12 ^ v13) ^ 1 | v12)
    v18 = v17;
  else
    v18 = 1.0 - a3;
  if (((v12 | v13) & 1) != 0)
  {
    if (v12)
    {
      -[NTKFaceView setInterpolatedComplicationColor:](self, "setInterpolatedComplicationColor:", v11, v16);
      v19 = self;
      v20 = v11;
LABEL_18:
      -[NTKFaceView setComplicationColor:](v19, "setComplicationColor:", v20);
      goto LABEL_19;
    }
    if (v13)
    {
      -[NTKFaceView setInterpolatedComplicationColor:](self, "setInterpolatedComplicationColor:", v10, v16);
      v19 = self;
      v20 = v10;
      goto LABEL_18;
    }
  }
  else
  {
    NTKInterpolateBetweenColors(v10, v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceView setInterpolatedComplicationColor:](self, "setInterpolatedComplicationColor:", v21);
    -[NTKFaceView setComplicationColor:](self, "setComplicationColor:", v21);

  }
LABEL_19:
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __78__NTKWhistlerSubdialsFaceView__applyTransitionFraction_fromPalette_toPalette___block_invoke;
  v22[3] = &unk_1E6BD99F8;
  v22[4] = self;
  v23 = v15;
  v24 = v14 & 1;
  *(double *)&v22[5] = v18;
  -[NTKFaceView enumerateComplicationDisplayWrappersWithBlock:](self, "enumerateComplicationDisplayWrappersWithBlock:", v22);

}

void __78__NTKWhistlerSubdialsFaceView__applyTransitionFraction_fromPalette_toPalette___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "normalComplicationDisplayWrapperForSlot:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "display");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v5 = v8;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v8, "display");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (*(_BYTE *)(a1 + 48) || *(_BYTE *)(a1 + 49))
      objc_msgSend(v6, "transitionToMonochromeWithFraction:", *(double *)(a1 + 40));
    else
      objc_msgSend(v6, "updateMonochromeColor");

    v5 = v8;
  }

}

- (void)_configureForEditMode:(int64_t)a3
{
  CGFloat v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NTKInterpolatedColorPalette *editingComplicationsPalette;
  void *v12;
  void *v13;
  NTKInterpolatedColorPalette *v14;
  NTKInterpolatedColorPalette *v15;
  void *v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  _BYTE v19[136];
  double v20;

  v5 = 1.0;
  if (a3 == 15)
  {
    -[NTKFaceView device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_46(v6, (uint64_t)v19);
    v5 = v20;

  }
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeScale(&v18, v5, v5);
  -[NTKFaceView timeView](self, "timeView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v18;
  objc_msgSend(v7, "setTransform:", &v17);

  -[NTKFaceView timeView](self, "timeView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKWhistlerSubdialsFaceView _timeViewAlphaForEditMode:](self, "_timeViewAlphaForEditMode:", a3);
  objc_msgSend(v8, "setAlpha:");

  -[NTKFaceView complicationContainerView](self, "complicationContainerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKWhistlerSubdialsFaceView _complicationAlphaForEditMode:](self, "_complicationAlphaForEditMode:", a3);
  objc_msgSend(v9, "setAlpha:");

  if (-[NTKWhistlerSubdialsFaceView showGossamerUI](self, "showGossamerUI"))
  {
    -[NTKFaceView delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "faceViewWantsCustomKeylineFramesReloadedForEditMode:", 15);

    editingComplicationsPalette = self->_editingComplicationsPalette;
    if (a3 == 1)
    {
      if (!editingComplicationsPalette)
      {
        -[NTKFaceView faceColorPalette](self, "faceColorPalette");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "copy");
        objc_msgSend(v13, "setIsEditingComplications:", 1);
        v14 = -[NTKInterpolatedColorPalette initWithFromPalette:toPalette:]([NTKInterpolatedColorPalette alloc], "initWithFromPalette:toPalette:", v12, v13);
        v15 = self->_editingComplicationsPalette;
        self->_editingComplicationsPalette = v14;

        editingComplicationsPalette = self->_editingComplicationsPalette;
      }
      -[NTKInterpolatedColorPalette setTransitionFraction:](editingComplicationsPalette, "setTransitionFraction:", 1.0);
      -[NTKWhistlerSubdialsFaceView _applyColorsFromPalette:](self, "_applyColorsFromPalette:", self->_editingComplicationsPalette);
    }
    else if (editingComplicationsPalette)
    {
      self->_editingComplicationsPalette = 0;

      -[NTKFaceView faceColorPalette](self, "faceColorPalette");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKWhistlerSubdialsFaceView _applyColorsFromPalette:](self, "_applyColorsFromPalette:", v16);

    }
  }
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  void *v8;
  CGFloat v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NTKInterpolatedColorPalette *editingComplicationsPalette;
  void *v15;
  void *v16;
  void *v17;
  NTKInterpolatedColorPalette *v18;
  NTKInterpolatedColorPalette *v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  _BYTE v22[136];

  -[NTKFaceView device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_46(v8, (uint64_t)v22);

  CLKInterpolateBetweenFloatsClipped();
  memset(&v21, 0, sizeof(v21));
  CGAffineTransformMakeScale(&v21, v9, v9);
  -[NTKFaceView timeView](self, "timeView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v21;
  objc_msgSend(v10, "setTransform:", &v20);

  -[NTKFaceView timeView](self, "timeView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKWhistlerSubdialsFaceView _timeViewAlphaForEditMode:](self, "_timeViewAlphaForEditMode:", a4);
  -[NTKWhistlerSubdialsFaceView _timeViewAlphaForEditMode:](self, "_timeViewAlphaForEditMode:", a5);
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v11, "setAlpha:");

  -[NTKFaceView complicationContainerView](self, "complicationContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKWhistlerSubdialsFaceView _complicationAlphaForEditMode:](self, "_complicationAlphaForEditMode:", a4);
  -[NTKWhistlerSubdialsFaceView _complicationAlphaForEditMode:](self, "_complicationAlphaForEditMode:", a5);
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v12, "setAlpha:");

  if (-[NTKWhistlerSubdialsFaceView showGossamerUI](self, "showGossamerUI"))
  {
    -[NTKFaceView delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "faceViewWantsCustomKeylineFramesReloadedForEditMode:", 15);

    editingComplicationsPalette = self->_editingComplicationsPalette;
    if (a4 == 1 || a5 == 1)
    {
      if (!editingComplicationsPalette)
      {
        -[NTKFaceView faceColorPalette](self, "faceColorPalette");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v16, "copy");
        objc_msgSend(v17, "setIsEditingComplications:", 1);
        v18 = -[NTKInterpolatedColorPalette initWithFromPalette:toPalette:]([NTKInterpolatedColorPalette alloc], "initWithFromPalette:toPalette:", v16, v17);
        v19 = self->_editingComplicationsPalette;
        self->_editingComplicationsPalette = v18;

      }
      CLKInterpolateBetweenFloatsClipped();
      -[NTKInterpolatedColorPalette setTransitionFraction:](self->_editingComplicationsPalette, "setTransitionFraction:");
      -[NTKWhistlerSubdialsFaceView _applyColorsFromPalette:](self, "_applyColorsFromPalette:", self->_editingComplicationsPalette);
    }
    else if (editingComplicationsPalette)
    {
      self->_editingComplicationsPalette = 0;

      -[NTKFaceView faceColorPalette](self, "faceColorPalette");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKWhistlerSubdialsFaceView _applyColorsFromPalette:](self, "_applyColorsFromPalette:", v15);

    }
  }
}

- (double)_timeViewAlphaForEditMode:(int64_t)a3
{
  double result;

  result = 0.2;
  if (a3 != 1)
    return 1.0;
  return result;
}

- (double)_complicationAlphaForEditMode:(int64_t)a3
{
  BOOL v3;
  double result;

  v3 = a3 == 19 || a3 == 15;
  result = 0.2;
  if (!v3)
    return 1.0;
  return result;
}

- (id)_keylineViewForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  uint64_t v11;
  void *v12;
  double v14[21];
  objc_super v15;

  v6 = a4;
  if (a3 == 15 || a3 == 19)
  {
    -[NTKFaceView _faceEditingScaleForEditMode:slot:](self, "_faceEditingScaleForEditMode:slot:", a3, v6);
    v8 = v7;
    -[NTKFaceView device](self, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_46(v9, (uint64_t)v14);
    v10 = v14[0];

    if (-[NTKWhistlerSubdialsFaceView showGossamerUI](self, "showGossamerUI"))
      v10 = v10 * self->_scaleFactor;
    NTKKeylineViewWithCircle(v10, v8);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)NTKWhistlerSubdialsFaceView;
    -[NTKFaceView _keylineViewForCustomEditMode:slot:](&v15, sel__keylineViewForCustomEditMode_slot_, a3, v6);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;

  return v12;
}

- (unint64_t)_keylineLabelAlignmentForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6;
  unint64_t v7;
  objc_super v9;

  v6 = a4;
  v7 = 148;
  if (a3 != 15 && a3 != 19)
  {
    v9.receiver = self;
    v9.super_class = (Class)NTKWhistlerSubdialsFaceView;
    v7 = -[NTKFaceView _keylineLabelAlignmentForCustomEditMode:slot:](&v9, sel__keylineLabelAlignmentForCustomEditMode_slot_, a3, v6);
  }

  return v7;
}

- (CGRect)_relativeKeylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6;
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
  double v17;
  double v18;
  objc_super v19;
  CGRect result;

  v6 = a4;
  if (a3 == 19 || a3 == 15)
  {
    -[NTKWhistlerSubdialsFaceView _timeViewFrameRelativeToFaceView](self, "_timeViewFrameRelativeToFaceView");
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)NTKWhistlerSubdialsFaceView;
    -[NTKFaceView _relativeKeylineFrameForCustomEditMode:slot:](&v19, sel__relativeKeylineFrameForCustomEditMode_slot_, a3, v6);
  }
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;

  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)_timeViewFrameRelativeToFaceView
{
  double scaleFactor;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double MidX;
  double MidY;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  CGRect v32;
  CGRect v33;
  CGRect result;

  scaleFactor = 1.0;
  if (-[NTKWhistlerSubdialsFaceView showGossamerUI](self, "showGossamerUI"))
    scaleFactor = self->_scaleFactor;
  v31 = 0;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[NTKFaceView device](self, "device", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_46(v4, (uint64_t)&v26);

  -[NTKFaceView device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screenBounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v32.origin.x = v7;
  v32.origin.y = v9;
  v32.size.width = v11;
  v32.size.height = v13;
  MidX = CGRectGetMidX(v32);
  v33.origin.x = v7;
  v33.origin.y = v9;
  v33.size.width = v11;
  v33.size.height = v13;
  MidY = CGRectGetMidY(v33);
  v16 = *(double *)&v26;
  -[NTKFaceView device](self, "device");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "screenBounds");
  v19 = v18 - *(double *)&v28 - v16 * 0.5;
  v20 = v16 * 0.5 + *((double *)&v27 + 1);

  v21 = scaleFactor * v16;
  v22 = scaleFactor * v16 * 0.5;
  v23 = MidX + (v19 - MidX) * scaleFactor - v22;
  v24 = MidY + (v20 - MidY) * scaleFactor - v22;
  v25 = scaleFactor * v16;
  result.size.height = v25;
  result.size.width = v21;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  double v7;
  NTKGradientComposedView *composedView;
  NTKWhistlerSubdialsFaceView *timeViewContainerView;
  __int128 v10;
  __int128 v11;
  UIView *v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  __int128 v16;
  CGAffineTransform v17;
  CGAffineTransform v18;

  v7 = NTKLargeElementScaleForBreathingFraction(a3);
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeScale(&v18, v7, v7);
  if (-[NTKWhistlerSubdialsFaceView showGossamerUI](self, "showGossamerUI"))
  {
    switch(a4)
    {
      case 10:
      case 17:
        composedView = self->_composedView;
        v17 = v18;
        -[NTKGradientComposedView setTransform:](composedView, "setTransform:", &v17);
        timeViewContainerView = (NTKWhistlerSubdialsFaceView *)self->_timeViewContainerView;
        v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)&v17.a = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&v17.c = v10;
        v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        goto LABEL_11;
      case 15:
      case 19:
        v15 = self->_composedView;
        v16 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)&v17.a = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&v17.c = v16;
        *(_OWORD *)&v17.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        goto LABEL_10;
      default:
        return;
    }
  }
  else
  {
    if (a4 == 19 || a4 == 15)
    {
      v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v17.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v17.c = v14;
      *(_OWORD *)&v17.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v15 = self;
LABEL_10:
      objc_msgSend(v15, "setTransform:", &v17, *(_OWORD *)&v17.a, *(_OWORD *)&v17.c, *(_OWORD *)&v17.tx);
      timeViewContainerView = (NTKWhistlerSubdialsFaceView *)self->_timeViewContainerView;
      *(_OWORD *)&v17.a = *(_OWORD *)&v18.a;
      *(_OWORD *)&v17.c = *(_OWORD *)&v18.c;
      v11 = *(_OWORD *)&v18.tx;
LABEL_11:
      *(_OWORD *)&v17.tx = v11;
    }
    else
    {
      if (a4 != 10)
        return;
      v12 = self->_timeViewContainerView;
      v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v17.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v17.c = v13;
      *(_OWORD *)&v17.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      -[UIView setTransform:](v12, "setTransform:", &v17);
      v17 = v18;
      timeViewContainerView = self;
    }
    -[NTKWhistlerSubdialsFaceView setTransform:](timeViewContainerView, "setTransform:", &v17, *(_OWORD *)&v17.a, *(_OWORD *)&v17.c, *(_OWORD *)&v17.tx);
  }
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  double v7;
  NTKGradientComposedView *composedView;
  UIView *timeViewContainerView;
  __int128 v10;
  __int128 v11;
  void *v12;
  NTKGradientComposedView *v13;
  __int128 v14;
  CGAffineTransform v15;
  CGAffineTransform v16;

  v7 = NTKScaleForRubberBandingFraction(a3);
  memset(&v16, 0, sizeof(v16));
  CGAffineTransformMakeScale(&v16, v7, v7);
  if (-[NTKWhistlerSubdialsFaceView showGossamerUI](self, "showGossamerUI"))
  {
    switch(a4)
    {
      case 10:
      case 17:
        composedView = self->_composedView;
        v15 = v16;
        -[NTKGradientComposedView setTransform:](composedView, "setTransform:", &v15);
        timeViewContainerView = self->_timeViewContainerView;
        v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)&v15.a = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&v15.c = v10;
        v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        goto LABEL_10;
      case 15:
      case 19:
        v13 = self->_composedView;
        v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)&v15.a = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&v15.c = v14;
        *(_OWORD *)&v15.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        -[NTKGradientComposedView setTransform:](v13, "setTransform:", &v15);
        goto LABEL_9;
      default:
        return;
    }
  }
  else if (a4 == 19 || a4 == 15)
  {
LABEL_9:
    timeViewContainerView = self->_timeViewContainerView;
    *(_OWORD *)&v15.a = *(_OWORD *)&v16.a;
    *(_OWORD *)&v15.c = *(_OWORD *)&v16.c;
    v11 = *(_OWORD *)&v16.tx;
LABEL_10:
    *(_OWORD *)&v15.tx = v11;
    -[UIView setTransform:](timeViewContainerView, "setTransform:", &v15);
  }
  else if (a4 == 10)
  {
    -[NTKFaceView contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v16;
    objc_msgSend(v12, "setTransform:", &v15);

  }
}

- (void)_setNumerals:(unint64_t)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  int v7;
  void *v8;

  v4 = CLKLocaleNumberSystemFromNumeralOption(a3);
  if (self->_numberSystem != v4)
  {
    v5 = v4;
    self->_numberSystem = v4;
    -[NTKFaceView device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = NTKShowIndicScriptNumerals(v6);

    if (v7)
    {
      -[NTKFaceView timeView](self, "timeView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setForcedNumberSystemForDigitalTimeLabel:", v5);

      -[NTKWhistlerSubdialsFaceView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)sensitiveUIStateChanged
{
  unint64_t numberSystem;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;

  numberSystem = self->_numberSystem;
  -[NTKFaceView device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = NTKShowIndicScriptNumerals(v4);

  if (v5)
    v6 = numberSystem;
  else
    v6 = -1;
  -[NTKFaceView timeView](self, "timeView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setForcedNumberSystemForDigitalTimeLabel:", v6);

  -[NTKWhistlerSubdialsFaceView setNeedsLayout](self, "setNeedsLayout");
}

- (void)rectangularViewDidBecomeInteractive:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[NTKFaceView timeView](self, "timeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsGroupOpacity:", 1);

  v7 = (void *)MEMORY[0x1E0DC3F10];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__NTKWhistlerSubdialsFaceView_rectangularViewDidBecomeInteractive___block_invoke;
  v9[3] = &unk_1E6BCD778;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "animateWithDuration:delay:options:animations:completion:", 4, v9, &__block_literal_global_58, 0.3, 0.0);

}

void __67__NTKWhistlerSubdialsFaceView_rectangularViewDidBecomeInteractive___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "timeView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.33);

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__NTKWhistlerSubdialsFaceView_rectangularViewDidBecomeInteractive___block_invoke_2;
  v4[3] = &unk_1E6BD8C68;
  v3 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "enumerateComplicationDisplayWrappersWithBlock:", v4);

}

void __67__NTKWhistlerSubdialsFaceView_rectangularViewDidBecomeInteractive___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "display");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);

  if (v4 != v5)
    objc_msgSend(v6, "setAlpha:", 0.33);

}

- (void)rectangularViewDidEndInteractive:(id)a3
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__NTKWhistlerSubdialsFaceView_rectangularViewDidEndInteractive___block_invoke;
  v4[3] = &unk_1E6BCD5F0;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__NTKWhistlerSubdialsFaceView_rectangularViewDidEndInteractive___block_invoke_3;
  v3[3] = &unk_1E6BD05C8;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v4, v3, 0.3, 0.0);
}

uint64_t __64__NTKWhistlerSubdialsFaceView_rectangularViewDidEndInteractive___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "timeView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  return objc_msgSend(*(id *)(a1 + 32), "enumerateComplicationDisplayWrappersWithBlock:", &__block_literal_global_59_0);
}

uint64_t __64__NTKWhistlerSubdialsFaceView_rectangularViewDidEndInteractive___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setAlpha:", 1.0);
}

void __64__NTKWhistlerSubdialsFaceView_rectangularViewDidEndInteractive___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "timeView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAllowsGroupOpacity:", 0);

}

- (NSCache)backgroundSwatchesCache
{
  NSCache *backgroundSwatchesCache;
  NSCache *v4;
  NSCache *v5;

  backgroundSwatchesCache = self->_backgroundSwatchesCache;
  if (!backgroundSwatchesCache)
  {
    v4 = (NSCache *)objc_opt_new();
    v5 = self->_backgroundSwatchesCache;
    self->_backgroundSwatchesCache = v4;

    backgroundSwatchesCache = self->_backgroundSwatchesCache;
  }
  return backgroundSwatchesCache;
}

- (NSCache)styleSwatchesCache
{
  NSCache *styleSwatchesCache;
  NSCache *v4;
  NSCache *v5;

  styleSwatchesCache = self->_styleSwatchesCache;
  if (!styleSwatchesCache)
  {
    v4 = (NSCache *)objc_opt_new();
    v5 = self->_styleSwatchesCache;
    self->_styleSwatchesCache = v4;

    styleSwatchesCache = self->_styleSwatchesCache;
  }
  return styleSwatchesCache;
}

- (NTKFace)swatchesFace
{
  NTKFace *swatchesFace;
  void *v4;
  NTKFace *v5;
  NTKFace *v6;
  NTKFace *v7;
  _QWORD v9[5];

  swatchesFace = self->_swatchesFace;
  if (!swatchesFace)
  {
    -[NTKFaceView device](self, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKFace defaultFaceOfStyle:forDevice:](NTKFace, "defaultFaceOfStyle:forDevice:", 34, v4);
    v5 = (NTKFace *)objc_claimAutoreleasedReturnValue();
    v6 = self->_swatchesFace;
    self->_swatchesFace = v5;

    v7 = self->_swatchesFace;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__NTKWhistlerSubdialsFaceView_swatchesFace__block_invoke;
    v9[3] = &unk_1E6BD2138;
    v9[4] = self;
    -[NTKFace enumerateComplicationSlotsWithBlock:](v7, "enumerateComplicationSlotsWithBlock:", v9);
    swatchesFace = self->_swatchesFace;
  }
  return swatchesFace;
}

void __43__NTKWhistlerSubdialsFaceView_swatchesFace__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 904);
  v3 = a2;
  +[NTKComplication nullComplication](NTKComplication, "nullComplication");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setComplication:forSlot:", v4, v3);

}

- (NTKFaceViewController)swatchesFaceViewController
{
  NTKFaceViewController *swatchesFaceViewController;
  void *v4;
  NTKFaceViewController *v5;
  NTKFaceViewController *v6;
  void *v7;
  void *v8;
  void *v9;

  swatchesFaceViewController = self->_swatchesFaceViewController;
  if (!swatchesFaceViewController)
  {
    -[NTKWhistlerSubdialsFaceView swatchesFace](self, "swatchesFace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[NTKFaceViewController initWithFace:configuration:]([NTKFaceViewController alloc], "initWithFace:configuration:", v4, &__block_literal_global_66);
    v6 = self->_swatchesFaceViewController;
    self->_swatchesFaceViewController = v5;

    -[NTKFaceViewController freeze](self->_swatchesFaceViewController, "freeze");
    -[NTKFaceViewController view](self->_swatchesFaceViewController, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsLayout");

    -[NTKFaceViewController view](self->_swatchesFaceViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutIfNeeded");

    -[NTKFaceViewController faceView](self->_swatchesFaceViewController, "faceView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loadComplicationPlaceholderViews");
    objc_msgSend(v9, "populateFaceViewEditOptionsFromFace:forced:", v4, 1);

    swatchesFaceViewController = self->_swatchesFaceViewController;
  }
  return swatchesFaceViewController;
}

void __57__NTKWhistlerSubdialsFaceView_swatchesFaceViewController__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setDataMode:", 3);
  objc_msgSend(v2, "setShowsCanonicalContent:", 1);
  objc_msgSend(v2, "setShowContentForUnadornedSnapshot:", 1);
  objc_msgSend(v2, "setShowsLockedUI:", 0);
  objc_msgSend(v2, "setIgnoreSnapshotImages:", 1);
  objc_msgSend(v2, "setShouldUseSampleTemplate:", 1);

}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  void *v4;

  v4 = &unk_1E6CAA5B8;
  if (a3 != 15)
    v4 = 0;
  if (a3 == 17)
    return &unk_1E6CAA5A0;
  else
    return v4;
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
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
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  CGContext *CurrentContext;
  void *v51;
  void *v52;
  id v53;
  const CGPath *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  objc_super v65;
  CGSize v66;
  CGSize v67;
  CGRect v68;
  CGRect v69;

  v8 = a3;
  v9 = a5;
  if (-[NTKWhistlerSubdialsFaceView showGossamerUI](self, "showGossamerUI"))
  {
    if (a4 == 15)
    {
LABEL_5:
      if (a4 == 17)
      {
        v10 = v8;
        objc_msgSend(v9, "objectForKeyedSubscript:", &unk_1E6CA17E8);
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", &unk_1E6CA1800);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v11 = v8;
      }
      v25 = v11;
      objc_msgSend(v9, "objectForKeyedSubscript:", &unk_1E6CA17D0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "pigmentEditOption");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)MEMORY[0x1E0CB3940];
      v64 = v27;
      objc_msgSend(v27, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringWithFormat:", CFSTR("%@-%@-%@"), v10, v25, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (a4 == 17)
        -[NTKWhistlerSubdialsFaceView backgroundSwatchesCache](self, "backgroundSwatchesCache");
      else
        -[NTKWhistlerSubdialsFaceView styleSwatchesCache](self, "styleSwatchesCache");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKey:", v30);
      v20 = (id)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        -[NTKWhistlerSubdialsFaceView swatchesFaceViewController](self, "swatchesFaceViewController");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "faceView");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKWhistlerSubdialsFaceView swatchesFace](self, "swatchesFace");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "selectOption:forCustomEditMode:slot:", v64, 10, 0);
        objc_msgSend(v61, "selectOption:forCustomEditMode:slot:", v25, 15, 0);
        objc_msgSend(v61, "selectOption:forCustomEditMode:slot:", v10, 17, 0);
        objc_msgSend(v60, "bounds");
        v33 = v32;
        v35 = v34;
        v37 = v36;
        v39 = v38;
        objc_msgSend(v60, "_timeViewFrameRelativeToFaceView");
        v41 = v40;
        v43 = v42;
        v45 = v44;
        v47 = v46;
        v66.width = v37;
        v66.height = v39;
        UIGraphicsBeginImageContextWithOptions(v66, 0, 0.0);
        objc_msgSend(v60, "layer");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "renderInContext:", UIGraphicsGetCurrentContext());

        UIGraphicsGetImageFromCurrentImageContext();
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        UIGraphicsEndImageContext();
        -[NTKWhistlerSubdialsFaceView backgroundSwatchesCache](self, "backgroundSwatchesCache");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setObject:forKey:", v59, v30);

        v67.width = v45;
        v67.height = v47;
        UIGraphicsBeginImageContextWithOptions(v67, 0, 0.0);
        CurrentContext = UIGraphicsGetCurrentContext();
        objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v45, v47, v45 * 0.5);
        v51 = v26;
        v52 = v25;
        v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v63 = v10;
        v54 = (const CGPath *)objc_msgSend(v53, "CGPath");

        v25 = v52;
        v26 = v51;
        CGContextAddPath(CurrentContext, v54);
        CGContextClip(CurrentContext);
        v68.origin.x = v33;
        v68.origin.y = v35;
        v68.size.width = v37;
        v68.size.height = v39;
        v69 = CGRectOffset(v68, -v41, -v43);
        objc_msgSend(v59, "drawInRect:", v69.origin.x, v69.origin.y, v69.size.width, v69.size.height);
        UIGraphicsGetImageFromCurrentImageContext();
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        UIGraphicsEndImageContext();
        -[NTKWhistlerSubdialsFaceView styleSwatchesCache](self, "styleSwatchesCache");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setObject:forKey:", v55, v30);

        if (a4 == 17)
          v57 = v59;
        else
          v57 = v55;
        v20 = v57;

        v10 = v63;
      }

      goto LABEL_24;
    }
    if (a4 != 19)
    {
      if (a4 == 17)
        goto LABEL_5;
LABEL_13:
      v65.receiver = self;
      v65.super_class = (Class)NTKWhistlerSubdialsFaceView;
      -[NTKFaceView _swatchImageForEditOption:mode:withSelectedOptions:](&v65, sel__swatchImageForEditOption_mode_withSelectedOptions_, v8, a4, v9);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
LABEL_12:
    v21 = v8;
    -[NTKFaceView timeView](self, "timeView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_digitalLabelFont");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceView device](self, "device");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "swatchImageWithFont:device:baseline:", v23, v24, 0.0);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_24;
  }
  if (a4 == 19)
    goto LABEL_12;
  if (a4 != 15)
    goto LABEL_13;
  -[NTKWhistlerSubdialsFaceView styleSwatchesCache](self, "styleSwatchesCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "style");
  objc_msgSend(v9, "objectForKeyedSubscript:", &unk_1E6CA17D0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pigmentEditOption");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@-%@"), v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKey:", v19);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    -[NTKWhistlerSubdialsFaceView _renderDialSwatchImageForStyle:colorOption:](self, "_renderDialSwatchImageForStyle:colorOption:", v13, v15);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v20, v19);
  }

LABEL_24:
  return v20;
}

- (id)_renderDialSwatchImageForStyle:(unint64_t)a3 colorOption:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v6 = a4;
  -[NTKFaceView timeView](self, "timeView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    -[NTKWhistlerSubdialsFaceView _loadSnapshotContentViews](self, "_loadSnapshotContentViews");
  -[NTKFaceView setOption:forCustomEditMode:slot:](self, "setOption:forCustomEditMode:slot:", v6, 10, 0);
  -[NTKFaceView timeView](self, "timeView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "style");
  objc_msgSend(v8, "setStyle:", a3);
  objc_msgSend(v8, "bounds");
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithBounds:", v10, v11, v12, v13);
  -[NTKWhistlerSubdialsFaceView layoutIfNeeded](self, "layoutIfNeeded");
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __74__NTKWhistlerSubdialsFaceView__renderDialSwatchImageForStyle_colorOption___block_invoke;
  v18[3] = &unk_1E6BD2F50;
  v19 = v8;
  v15 = v8;
  objc_msgSend(v14, "imageWithActions:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setStyle:", v9);

  return v16;
}

void __74__NTKWhistlerSubdialsFaceView__renderDialSwatchImageForStyle_colorOption___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "CGContext");

  objc_msgSend(v5, "renderInContext:", v4);
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  self->_backgroundStyle = a3;
}

- (NTKGradientComposedView)composedView
{
  return (NTKGradientComposedView *)objc_getProperty(self, a2, 928, 1);
}

- (void)setComposedView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 928);
}

- (NTKInterpolatedColorPalette)editingComplicationsPalette
{
  return (NTKInterpolatedColorPalette *)objc_getProperty(self, a2, 936, 1);
}

- (void)setEditingComplicationsPalette:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 936);
}

- (NTKMonochromeModel)topFilterProvider
{
  return self->_topFilterProvider;
}

- (NTKMonochromeModel)centerFilterProvider
{
  return self->_centerFilterProvider;
}

- (NTKMonochromeModel)bottomFilterProvider
{
  return self->_bottomFilterProvider;
}

- (double)monochromeFraction
{
  return self->_monochromeFraction;
}

- (void)setMonochromeFraction:(double)a3
{
  self->_monochromeFraction = a3;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(double)a3
{
  self->_scaleFactor = a3;
}

- (double)tintedFraction
{
  return self->_tintedFraction;
}

- (void)setTintedFraction:(double)a3
{
  self->_tintedFraction = a3;
}

- (NSArray)complicationPlaceholderViews
{
  return self->_complicationPlaceholderViews;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationPlaceholderViews, 0);
  objc_storeStrong((id *)&self->_bottomFilterProvider, 0);
  objc_storeStrong((id *)&self->_centerFilterProvider, 0);
  objc_storeStrong((id *)&self->_topFilterProvider, 0);
  objc_storeStrong((id *)&self->_editingComplicationsPalette, 0);
  objc_storeStrong((id *)&self->_composedView, 0);
  objc_storeStrong((id *)&self->_swatchesFaceViewController, 0);
  objc_storeStrong((id *)&self->_swatchesFace, 0);
  objc_storeStrong((id *)&self->_styleSwatchesCache, 0);
  objc_storeStrong((id *)&self->_backgroundSwatchesCache, 0);
  objc_storeStrong((id *)&self->_timeViewContainerView, 0);
}

@end
