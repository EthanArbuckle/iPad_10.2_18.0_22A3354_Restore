@implementation NTKFaceView

- (void)updateRichCornerComplicationsInnerColor:(id)a3 outerColor:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__NTKFaceView_ComplicationColor__updateRichCornerComplicationsInnerColor_outerColor___block_invoke;
  v10[3] = &unk_1E6BD53B0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[NTKFaceView enumerateComplicationDisplayWrappersWithBlock:](self, "enumerateComplicationDisplayWrappersWithBlock:", v10);

}

void __85__NTKFaceView_ComplicationColor__updateRichCornerComplicationsInnerColor_outerColor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(v5, "display");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("top-left")) & 1) != 0
      || (objc_msgSend(v9, "isEqualToString:", CFSTR("top-right")) & 1) != 0
      || (objc_msgSend(v9, "isEqualToString:", CFSTR("bottom-left")) & 1) != 0)
    {

    }
    else
    {
      v8 = objc_msgSend(v9, "isEqualToString:", CFSTR("bottom-right"));

      if ((v8 & 1) == 0)
        goto LABEL_10;
    }
    objc_msgSend(*(id *)(a1 + 32), "setComplicationColor:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "complicationColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setInterpolatedComplicationColor:", v7);

    if (*(_QWORD *)(a1 + 48))
      objc_msgSend(*(id *)(a1 + 32), "setAlternateComplicationColor:");
    objc_msgSend(v5, "display");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateMonochromeColor");
  }

LABEL_10:
}

+ (id)newFaceViewForFace:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_alloc((Class)ViewClassForFace(v3));
  v5 = objc_msgSend(v3, "faceStyle");
  objc_msgSend(v3, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v4, "initWithFaceStyle:forDevice:clientIdentifier:", v5, v6, v7);
  return v8;
}

- (NTKFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v9;
  id v10;
  NTKFaceView *v11;
  NTKFaceView *v12;
  uint64_t v13;
  NSString *clientIdentifier;
  NSMutableDictionary *v15;
  NSMutableDictionary *complicationDisplayWrappers;
  NSMutableDictionary *v17;
  NSMutableDictionary *complicationLayouts;
  NSMutableDictionary *v19;
  NSMutableDictionary *editConfigurations;
  NSMutableSet *v21;
  NSMutableSet *hiddenComplicationSlots;
  uint64_t v23;
  CAFilter *complicationEditingSaturationFilter;
  uint64_t v25;
  UIColor *complicationColor;
  uint64_t v27;
  UIColor *interpolatedComplicationColor;
  uint64_t v29;
  UIColor *alternateComplicationColor;
  UIColor *complicationBackgroundColor;
  NSMutableSet *v32;
  NSMutableSet *allSubQuadViews;
  id v34;
  uint64_t v35;
  UIView *rootContainerView;
  void *v37;
  id v38;
  uint64_t v39;
  UIView *contentView;
  ComplicationContainerView *v41;
  uint64_t v42;
  UIView *complicationContainerView;
  NTKContainerView *v44;
  NTKContainerView *foregroundContainerView;
  void *v46;
  NTKRoundedCornerOverlayView *v47;
  uint64_t v48;
  NTKRoundedCornerOverlayView *cornerOverlayView;
  _BOOL4 v50;
  NTKExtraLargeTimeView *sensitiveUIShieldView;
  NTKExtraLargeTimeView *v52;
  void *v53;
  uint64_t v54;
  NTKExtraLargeTimeView *v55;
  NTKExtraLargeTimeView *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  NTKExtraLargeTimeView *v61;
  void *v62;
  NTKCrownAssertionHandler *v63;
  NTKCrownAssertionHandler *crownHandler;
  objc_super v66;

  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "screenBounds");
  v66.receiver = self;
  v66.super_class = (Class)NTKFaceView;
  v11 = -[NTKFaceView initWithFrame:](&v66, sel_initWithFrame_);
  v12 = v11;
  if (v11)
  {
    -[NTKFaceView setAccessibilityIdentifier:](v11, "setAccessibilityIdentifier:", CFSTR("Watch Face"));
    v12->_faceStyle = a3;
    objc_storeStrong((id *)&v12->_device, a4);
    v13 = objc_msgSend(v10, "copy");
    clientIdentifier = v12->_clientIdentifier;
    v12->_clientIdentifier = (NSString *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    complicationDisplayWrappers = v12->_complicationDisplayWrappers;
    v12->_complicationDisplayWrappers = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    complicationLayouts = v12->_complicationLayouts;
    v12->_complicationLayouts = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    editConfigurations = v12->_editConfigurations;
    v12->_editConfigurations = v19;

    v21 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    hiddenComplicationSlots = v12->_hiddenComplicationSlots;
    v12->_hiddenComplicationSlots = v21;

    v12->_complicationEditingSaturationValue = 1.0;
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C00]);
    v23 = objc_claimAutoreleasedReturnValue();
    complicationEditingSaturationFilter = v12->_complicationEditingSaturationFilter;
    v12->_complicationEditingSaturationFilter = (CAFilter *)v23;

    -[CAFilter setName:](v12->_complicationEditingSaturationFilter, "setName:", CFSTR("EditingSaturationFilter"));
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v25 = objc_claimAutoreleasedReturnValue();
    complicationColor = v12->_complicationColor;
    v12->_complicationColor = (UIColor *)v25;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v27 = objc_claimAutoreleasedReturnValue();
    interpolatedComplicationColor = v12->_interpolatedComplicationColor;
    v12->_interpolatedComplicationColor = (UIColor *)v27;

    CLKUIDefaultAlternateComplicationColor();
    v29 = objc_claimAutoreleasedReturnValue();
    alternateComplicationColor = v12->_alternateComplicationColor;
    v12->_alternateComplicationColor = (UIColor *)v29;

    complicationBackgroundColor = v12->_complicationBackgroundColor;
    v12->_complicationBackgroundColor = 0;

    v32 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    allSubQuadViews = v12->_allSubQuadViews;
    v12->_allSubQuadViews = v32;

    v34 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[NTKFaceView bounds](v12, "bounds");
    v35 = objc_msgSend(v34, "initWithFrame:");
    rootContainerView = v12->_rootContainerView;
    v12->_rootContainerView = (UIView *)v35;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v12->_rootContainerView, "setBackgroundColor:", v37);

    -[NTKFaceView addSubview:](v12, "addSubview:", v12->_rootContainerView);
    v38 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[NTKFaceView bounds](v12, "bounds");
    v39 = objc_msgSend(v38, "initWithFrame:");
    contentView = v12->_contentView;
    v12->_contentView = (UIView *)v39;

    -[UIView addSubview:](v12->_rootContainerView, "addSubview:", v12->_contentView);
    v41 = [ComplicationContainerView alloc];
    -[NTKFaceView bounds](v12, "bounds");
    v42 = -[ComplicationContainerView initWithFrame:](v41, "initWithFrame:");
    complicationContainerView = v12->_complicationContainerView;
    v12->_complicationContainerView = (UIView *)v42;

    -[UIView addSubview:](v12->_rootContainerView, "addSubview:", v12->_complicationContainerView);
    if (-[NTKFaceView _needsForegroundContainerView](v12, "_needsForegroundContainerView"))
    {
      v44 = objc_alloc_init(NTKContainerView);
      foregroundContainerView = v12->_foregroundContainerView;
      v12->_foregroundContainerView = v44;

      -[NTKContainerView setLayoutDelegate:](v12->_foregroundContainerView, "setLayoutDelegate:", v12);
      -[NTKFaceView contentView](v12, "contentView");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addSubview:", v12->_foregroundContainerView);

    }
    if (-[NTKFaceView _applyRoundedCornerOverlay](v12, "_applyRoundedCornerOverlay"))
    {
      v47 = [NTKRoundedCornerOverlayView alloc];
      -[NTKFaceView bounds](v12, "bounds");
      v48 = -[NTKRoundedCornerOverlayView initWithFrame:forDeviceCornerRadius:](v47, "initWithFrame:forDeviceCornerRadius:", v12->_device);
      cornerOverlayView = v12->_cornerOverlayView;
      v12->_cornerOverlayView = (NTKRoundedCornerOverlayView *)v48;

      -[NTKFaceView insertSubview:aboveSubview:](v12, "insertSubview:aboveSubview:", v12->_cornerOverlayView, v12->_rootContainerView);
    }
    v50 = -[NTKFaceView _shouldHideUI](v12, "_shouldHideUI");
    sensitiveUIShieldView = v12->_sensitiveUIShieldView;
    if (sensitiveUIShieldView || !v50)
    {
      if (!sensitiveUIShieldView)
        LOBYTE(v50) = 1;
      if (v50)
        goto LABEL_14;
      -[NTKExtraLargeTimeView removeFromSuperview](sensitiveUIShieldView, "removeFromSuperview");
      v61 = v12->_sensitiveUIShieldView;
      v12->_sensitiveUIShieldView = 0;

      -[NTKFaceView layer](v12, "layer");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v58;
      v60 = 0;
    }
    else
    {
      v52 = [NTKExtraLargeTimeView alloc];
      -[NTKFaceView device](v12, "device");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = -[NTKExtraLargeTimeView initWithFrame:forDevice:](v52, "initWithFrame:forDevice:", v53, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v55 = v12->_sensitiveUIShieldView;
      v12->_sensitiveUIShieldView = (NTKExtraLargeTimeView *)v54;

      v56 = v12->_sensitiveUIShieldView;
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKExtraLargeTimeView setBackgroundColor:](v56, "setBackgroundColor:", v57);

      -[NTKFaceView addSubview:](v12, "addSubview:", v12->_sensitiveUIShieldView);
      -[NTKFaceView layer](v12, "layer");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v58;
      v60 = 1;
    }
    objc_msgSend(v58, "setAllowsGroupOpacity:", v60);

LABEL_14:
    -[NTKFaceView setClipsToBounds:](v12, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "addObserver:selector:name:object:", v12, sel__handleLocaleDidChange, *MEMORY[0x1E0C99720], 0);

    v63 = objc_alloc_init(NTKCrownAssertionHandler);
    crownHandler = v12->_crownHandler;
    v12->_crownHandler = v63;

  }
  return v12;
}

- (void)performScrollTestNamed:(id)a3 completion:(id)a4
{
  void *v4;
  void *v5;
  id v6;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NTKPPTInvalidFace"), CFSTR("Only Siri face supports scrolling."), MEMORY[0x1E0C9AA70]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise");

  v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    v5 = v6;
  }

}

- (void)_handleLocaleDidChange
{
  if (-[NTKFaceView timeScrubbing](self, "timeScrubbing"))
    -[NTKFaceView endScrubbingAnimated:](self, "endScrubbingAnimated:", 0);
}

+ (int64_t)uiSensitivity
{
  return 0;
}

- (BOOL)monochromeRichComplicationsEnabled
{
  void *v2;
  char v3;

  -[NTKFaceView device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = NTKMonochromeComplicationsEnabledForDevice();

  return v3;
}

- (BOOL)_shouldHideUI
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend((id)objc_opt_class(), "uiSensitivity");
  objc_msgSend(MEMORY[0x1E0C94518], "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "shouldHideForSensitivity:", v2);

  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  if (self->_crownAssertionToken)
    -[NTKCrownAssertionHandler relinquishCrownAssertionForToken:](self->_crownHandler, "relinquishCrownAssertionForToken:");
  v4.receiver = self;
  v4.super_class = (Class)NTKFaceView;
  -[NTKFaceView dealloc](&v4, sel_dealloc);
}

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  double height;
  NTKContainerView *foregroundContainerView;
  UIView *unadornedSnapshotView;
  NTKExtraLargeTimeView *sensitiveUIShieldView;
  UIImageView *switcherSnapshotView;
  objc_super v12;
  CGRect v13;

  v12.receiver = self;
  v12.super_class = (Class)NTKFaceView;
  -[NTKFaceView layoutSubviews](&v12, sel_layoutSubviews);
  -[NTKFaceView bounds](self, "bounds");
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  if (!CGRectIsEmpty(v13)
    && (width != self->_boundsSizeForComputedLayouts.width || height != self->_boundsSizeForComputedLayouts.height))
  {
    -[NSMutableDictionary removeAllObjects](self->_complicationLayouts, "removeAllObjects");
    -[NTKFaceView _loadLayoutRules](self, "_loadLayoutRules");
    -[NTKFaceView _updateComplicationMaxSize](self, "_updateComplicationMaxSize");
    -[NTKFaceView _adjustUIForBoundsChange](self, "_adjustUIForBoundsChange");
    self->_boundsSizeForComputedLayouts.width = width;
    self->_boundsSizeForComputedLayouts.height = height;
  }
  foregroundContainerView = self->_foregroundContainerView;
  if (foregroundContainerView)
  {
    -[NTKFaceView bounds](self, "bounds");
    -[UIView ntk_setBoundsAndPositionFromFrame:](foregroundContainerView, "ntk_setBoundsAndPositionFromFrame:");
  }
  else
  {
    -[NTKFaceView _layoutComplicationViews](self, "_layoutComplicationViews");
  }
  -[NTKFaceView _bringForegroundViewsToFront](self, "_bringForegroundViewsToFront");
  unadornedSnapshotView = self->_unadornedSnapshotView;
  if (unadornedSnapshotView)
  {
    -[CLKDevice screenBounds](self->_device, "screenBounds");
    -[UIView setFrame:](unadornedSnapshotView, "setFrame:");
  }
  sensitiveUIShieldView = self->_sensitiveUIShieldView;
  if (sensitiveUIShieldView)
  {
    -[NTKExtraLargeTimeView setFrame:](sensitiveUIShieldView, "setFrame:", x, y, width, height);
    -[NTKFaceView bringSubviewToFront:](self, "bringSubviewToFront:", self->_sensitiveUIShieldView);
  }
  switcherSnapshotView = self->_switcherSnapshotView;
  -[NTKFaceView bounds](self, "bounds");
  -[UIImageView setFrame:](switcherSnapshotView, "setFrame:");
  -[NTKFaceView _reorderSwitcherSnapshotView](self, "_reorderSwitcherSnapshotView");
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKFaceView;
  -[NTKFaceView willMoveToWindow:](&v13, sel_willMoveToWindow_, v4);
  -[NTKFaceView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && v5)
  {
    self->_removedFromWindowDuringThisTransaction = 1;
    objc_initWeak(&location, self);
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __32__NTKFaceView_willMoveToWindow___block_invoke;
    v10 = &unk_1E6BCD7F0;
    objc_copyWeak(&v11, &location);
    +[NTKTransactionCommitCoordinator addTransactionCommitHandler:](NTKTransactionCommitCoordinator, "addTransactionCommitHandler:", &v7);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  -[NTKFaceView window](self, "window", v7, v8, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || v6)
  {

  }
  else if (!self->_removedFromWindowDuringThisTransaction)
  {
    -[NTKFaceView setNeedsRender](self, "setNeedsRender");
    self->_needsImageQueueDiscardOnRender = 1;
  }

}

void __32__NTKFaceView_willMoveToWindow___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    WeakRetained[650] = 0;

}

- (void)setShouldShowUnsnapshotableContent:(BOOL)a3
{
  NSMutableDictionary *editConfigurations;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *, void *);
  void *v9;
  id v10;
  id location;

  if (self->_shouldShowUnsnapshotableContent != a3)
  {
    self->_shouldShowUnsnapshotableContent = a3;
    if (a3)
    {
      -[NTKFaceView _loadSnapshotContentViews](self, "_loadSnapshotContentViews");
      objc_initWeak(&location, self);
      editConfigurations = self->_editConfigurations;
      v6 = MEMORY[0x1E0C809B0];
      v7 = 3221225472;
      v8 = __50__NTKFaceView_setShouldShowUnsnapshotableContent___block_invoke;
      v9 = &unk_1E6BDA0B0;
      objc_copyWeak(&v10, &location);
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](editConfigurations, "enumerateKeysAndObjectsUsingBlock:", &v6);
      -[NTKFaceView _updateTimeOffset](self, "_updateTimeOffset", v6, v7, v8, v9);
      -[NTKFaceView _applyFrozen](self, "_applyFrozen");
      -[NTKFaceView _applySlow](self, "_applySlow");
      -[NTKFaceView _applyDataMode](self, "_applyDataMode");
      -[NTKFaceView _updateStatusIconVisibility](self, "_updateStatusIconVisibility");
      -[NTKFaceView _applyShowsCanonicalContent](self, "_applyShowsCanonicalContent");
      -[NTKFaceView setNeedsRender](self, "setNeedsRender");
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "faceViewWillUnloadSnapshotContentViews");

      -[NTKFaceView _unloadSnapshotContentViews](self, "_unloadSnapshotContentViews");
    }
  }
}

void __50__NTKFaceView_setShouldShowUnsnapshotableContent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_msgSend(v5, "integerValue");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__NTKFaceView_setShouldShowUnsnapshotableContent___block_invoke_2;
  v9[3] = &unk_1E6BDA088;
  objc_copyWeak(v11, (id *)(a1 + 32));
  v8 = v6;
  v10 = v8;
  v11[1] = v7;
  objc_msgSend(v8, "enumerateSlotsWithBlock:", v9);

  objc_destroyWeak(v11);
}

void __50__NTKFaceView_setShouldShowUnsnapshotableContent___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(*(id *)(a1 + 32), "editOptionForSlot:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_updateFaceColorPaletteWithOption:mode:", v5, *(_QWORD *)(a1 + 48));
  objc_msgSend(WeakRetained, "_applyOption:forCustomEditMode:slot:", v5, *(_QWORD *)(a1 + 48), v4);

}

- (void)setDataMode:(int64_t)a3
{
  if (self->_dataMode != a3)
  {
    kdebug_trace();
    self->_dataMode = a3;
    -[NTKFaceView _applyDataMode](self, "_applyDataMode");
    -[NTKFaceView _updateStatusIconVisibility](self, "_updateStatusIconVisibility");
  }
}

- (void)setShowsCanonicalContent:(BOOL)a3
{
  if (self->_showsCanonicalContent != a3)
  {
    self->_showsCanonicalContent = a3;
    -[NTKFaceView _applyShowsCanonicalContent](self, "_applyShowsCanonicalContent");
  }
}

- (void)setShowContentForUnadornedSnapshot:(BOOL)a3
{
  if (self->_showContentForUnadornedSnapshot != a3)
  {
    self->_showContentForUnadornedSnapshot = a3;
    -[NTKFaceView _applyShowContentForUnadornedSnapshot](self, "_applyShowContentForUnadornedSnapshot");
  }
}

- (void)setShowsLockedUI:(BOOL)a3
{
  if (self->_showsLockedUI != a3)
  {
    self->_showsLockedUI = a3;
    -[NTKFaceView _applyShowsLockedUI](self, "_applyShowsLockedUI");
  }
}

- (NSDate)currentDisplayDate
{
  NSDate *v2;
  void *v3;

  v2 = self->_overrideDate;
  if (!v2)
  {
    +[NTKTimeOffsetManager sharedManager](NTKTimeOffsetManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "faceDisplayTime");
    v2 = (NSDate *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (void)setResourceDirectory:(id)a3
{
  void *v4;
  NSString *v5;
  NSString *resourceDirectory;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isEqualToString:", self->_resourceDirectory) & 1) == 0)
  {
    v4 = (void *)-[NSString copy](self->_resourceDirectory, "copy");
    v5 = (NSString *)objc_msgSend(v7, "copy");
    resourceDirectory = self->_resourceDirectory;
    self->_resourceDirectory = v5;

    -[NTKFaceView _updateForResourceDirectoryChange:](self, "_updateForResourceDirectoryChange:", v4);
  }

}

- (id)optionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  NSMutableDictionary *editConfigurations;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  editConfigurations = self->_editConfigurations;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](editConfigurations, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "editOptionForSlot:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  -[NTKFaceView setOption:forCustomEditMode:slot:forceApply:](self, "setOption:forCustomEditMode:slot:forceApply:", a3, a4, a5, 0);
}

- (void)setOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5 forceApply:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  NSMutableDictionary *editConfigurations;
  void *v12;
  NTKEditModeConfiguration *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  BOOL v17;
  id v18;

  v6 = a6;
  v18 = a3;
  v10 = a5;
  -[NTKFaceView _updateFaceColorPaletteWithOption:mode:](self, "_updateFaceColorPaletteWithOption:mode:", v18, a4);
  editConfigurations = self->_editConfigurations;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](editConfigurations, "objectForKey:", v12);
  v13 = (NTKEditModeConfiguration *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v13 = objc_alloc_init(NTKEditModeConfiguration);
    v14 = self->_editConfigurations;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v13, v15);

  }
  -[NTKEditModeConfiguration editOptionForSlot:](v13, "editOptionForSlot:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (NTKEqualObjects(v18, v16))
    v17 = !v6;
  else
    v17 = 0;
  if (!v17)
  {
    -[NTKEditModeConfiguration setEditOption:forSlot:](v13, "setEditOption:forSlot:", v18, v10);
    if (a4 != 10)
      -[NTKFaceView hideAppropriateComplicationsForCurrentConfigurationInEditMode:](self, "hideAppropriateComplicationsForCurrentConfigurationInEditMode:", a4);
    -[NTKFaceView _applyOption:forCustomEditMode:slot:](self, "_applyOption:forCustomEditMode:slot:", v18, a4, v10);
  }

}

- (id)newLegacyComplicationViewForSlot:(id)a3 family:(int64_t)a4 complication:(id)a5
{
  return -[NTKFaceView _newLegacyViewForComplication:family:slot:](self, "_newLegacyViewForComplication:family:slot:", a5, a4, a3);
}

- (int64_t)legacyComplicationLayoutOverrideForSlot:(id)a3 complication:(id)a4
{
  id v6;
  int64_t v7;

  v6 = a3;
  v7 = -[NTKFaceView _legacyLayoutOverrideforComplicationType:slot:](self, "_legacyLayoutOverrideforComplicationType:slot:", objc_msgSend(a4, "complicationType"), v6);

  return v7;
}

- (void)configureComplicationViewDisplayWrapper:(id)a3 forSlot:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  -[NTKFaceView _updateMaxSizeForDisplayWrapper:slot:](self, "_updateMaxSizeForDisplayWrapper:slot:", v6, v7);
  objc_msgSend(v6, "setEditing:", self->_complicationsShowEditingContent);
  -[NTKFaceView alphaForDimmedState](self, "alphaForDimmedState");
  objc_msgSend(v6, "setAlphaForDimmedState:");
  objc_msgSend(v6, "setTextLayoutStyle:", -[NTKFaceView layoutStyleForSlot:](self, "layoutStyleForSlot:", v7));
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__NTKFaceView_configureComplicationViewDisplayWrapper_forSlot___block_invoke;
  v9[3] = &unk_1E6BDA0D8;
  objc_copyWeak(&v11, &location);
  v8 = v7;
  v10 = v8;
  objc_msgSend(v6, "setDisplayConfigurationHandler:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __63__NTKFaceView_configureComplicationViewDisplayWrapper_forSlot___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "filterProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(WeakRetained, "_filterProviderForSlot:", *(_QWORD *)(a1 + 32));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setFilterProvider:", v5);

    }
  }
  objc_msgSend(WeakRetained, "configureComplicationView:forSlot:", v6, *(_QWORD *)(a1 + 32));

}

- (void)setNormalComplicationDisplayWrapper:(id)a3 forSlot:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKey:](self->_complicationDisplayWrappers, "objectForKey:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 != v6)
  {
    if (v8)
    {
      objc_msgSend(v8, "setNeedsResizeHandler:", 0);
      objc_msgSend(v9, "removeFromSuperview");
      -[NSMutableDictionary removeObjectForKey:](self->_complicationDisplayWrappers, "removeObjectForKey:", v7);
    }
    if (v6)
    {
      objc_initWeak(&location, self);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __59__NTKFaceView_setNormalComplicationDisplayWrapper_forSlot___block_invoke;
      v12[3] = &unk_1E6BCF6D8;
      objc_copyWeak(&v14, &location);
      v10 = v7;
      v13 = v10;
      objc_msgSend(v6, "setNeedsResizeHandler:", v12);
      -[NTKFaceView _complicationContainerViewForSlot:](self, "_complicationContainerViewForSlot:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", v6);

      -[NSMutableDictionary setObject:forKey:](self->_complicationDisplayWrappers, "setObject:forKey:", v6, v10);
      -[NTKContainerView setNeedsLayout](self->_foregroundContainerView, "setNeedsLayout");
      -[NTKFaceView _updateMaxSizeForDisplayWrapper:slot:](self, "_updateMaxSizeForDisplayWrapper:slot:", v6, v10);
      objc_msgSend(v6, "setEditing:", self->_complicationsShowEditingContent);
      -[NTKFaceView alphaForDimmedState](self, "alphaForDimmedState");
      objc_msgSend(v6, "setAlphaForDimmedState:");
      objc_msgSend(v6, "setAnimationDelegate:", self);
      if (self->_complicationsShowEditingContent)
        -[NTKFaceView _updateSaturationForComplicationEditing](self, "_updateSaturationForComplicationEditing");

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }

}

void __59__NTKFaceView_setNormalComplicationDisplayWrapper_forSlot___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_layoutComplicationViewForSlot:", *(_QWORD *)(a1 + 32));

}

- (id)normalComplicationDisplayWrapperForSlot:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_complicationDisplayWrappers, "objectForKey:", a3);
}

- (void)setDetachedComplicationDisplayWrapper:(id)a3 forSlot:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKey:](self->_complicationDisplayWrappers, "objectForKey:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v10;
  v9 = (void *)v7;
  if ((id)v7 != v10)
  {
    if (v7)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_complicationDisplayWrappers, "removeObjectForKey:", v6);
      v8 = v10;
    }
    if (v8)
      -[NSMutableDictionary setObject:forKey:](self->_complicationDisplayWrappers, "setObject:forKey:", v10, v6);
  }

}

- (id)detachedComplicationDisplayWrapperForSlot:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_complicationDisplayWrappers, "objectForKey:", a3);
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
  -[NTKFaceView _applyFrozen](self, "_applyFrozen");
}

- (void)setSlow:(BOOL)a3
{
  if (self->_slow != a3)
  {
    self->_slow = a3;
    -[NTKFaceView _applySlow](self, "_applySlow");
  }
}

- (BOOL)renderIfNeeded
{
  NSObject *v3;

  if (-[NTKFaceView dataMode](self, "dataMode") != 2
    && -[NTKFaceView dataMode](self, "dataMode") != 4
    && ((NTKIsScreenOn() & 1) != 0 || (NTKIsDaemonOrFaceSnapshotService() & 1) != 0))
  {
    return -[NTKFaceView _renderSynchronouslyIfNeededInGroup:](self, "_renderSynchronouslyIfNeededInGroup:", 0);
  }
  _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[NTKFaceView renderIfNeeded].cold.1(self, v3);

  self->_needsRender = 0;
  return 0;
}

- (void)setNeedsRender
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "%@ setNeedsRender failed. ***** PLEASE FILE A RADAR ON Watch Faces *****", (uint8_t *)&v2, 0xCu);
}

void __29__NTKFaceView_setNeedsRender__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "renderIfNeeded");
  objc_msgSend(WeakRetained, "faceStyle");
  kdebug_trace();

}

- (BOOL)needsImageQueueDiscardOnRender
{
  return self->_needsImageQueueDiscardOnRender;
}

- (void)prepareWristRaiseAnimation
{
  -[NTKExtraLargeTimeView prepareWristRaiseAnimation](self->_sensitiveUIShieldView, "prepareWristRaiseAnimation");
  -[NTKFaceView _prepareWristRaiseAnimation](self, "_prepareWristRaiseAnimation");
}

- (void)performWristRaiseAnimation
{
  -[NTKExtraLargeTimeView performWristRaiseAnimation](self->_sensitiveUIShieldView, "performWristRaiseAnimation");
  -[NTKFaceView _performWristRaiseAnimation](self, "_performWristRaiseAnimation");
}

- (void)setComplicationsShowEditingContent:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  if (self->_complicationsShowEditingContent != a3)
  {
    self->_complicationsShowEditingContent = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __50__NTKFaceView_setComplicationsShowEditingContent___block_invoke;
    v3[3] = &__block_descriptor_33_e56_v24__0__NSString_8__NTKComplicationDisplayWrapperView_16l;
    v4 = a3;
    -[NTKFaceView enumerateComplicationDisplayWrappersWithBlock:](self, "enumerateComplicationDisplayWrappersWithBlock:", v3);
  }
}

uint64_t __50__NTKFaceView_setComplicationsShowEditingContent___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setEditing:", *(unsigned __int8 *)(a1 + 32));
}

- (void)prepareForOrb
{
  self->_orbing = 1;
  -[NTKFaceView _prepareForOrb](self, "_prepareForOrb");
}

- (void)cleanupAfterOrb:(BOOL)a3
{
  self->_orbing = 0;
  -[NTKFaceView _cleanupAfterOrb:](self, "_cleanupAfterOrb:", a3);
}

- (void)prepareForEditing
{
  void *v3;

  self->_editing = 1;
  -[NTKFaceView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "faceViewWantsUnadornedSnapshotViewRemoved");

  -[NTKFaceView _setupComplicationViewsIfHidden](self, "_setupComplicationViewsIfHidden");
  -[NTKFaceView _prepareForEditing](self, "_prepareForEditing");
}

- (void)cleanupAfterEditing
{
  id v3;

  self->_editing = 0;
  self->_toEditMode = 0;
  self->_fromEditMode = 0;
  self->_editModeTransitionFraction = 0.0;
  -[NTKFaceView _teardownComplicationViewsIfNeeded](self, "_teardownComplicationViewsIfNeeded");
  -[NTKFaceView _cleanupAfterEditing](self, "_cleanupAfterEditing");
  -[NTKFaceView faceColorPalette](self, "faceColorPalette");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetColorCache");

}

- (void)populateFaceViewEditOptionsFromFace:(id)a3 forced:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NTKFaceView *v10;
  BOOL v11;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__NTKFaceView_populateFaceViewEditOptionsFromFace_forced___block_invoke;
  v8[3] = &unk_1E6BDA148;
  v9 = v6;
  v10 = self;
  v11 = a4;
  v7 = v6;
  objc_msgSend(v7, "enumerateCustomEditModesWithBlock:", v8);

}

void __58__NTKFaceView_populateFaceViewEditOptionsFromFace_forced___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__NTKFaceView_populateFaceViewEditOptionsFromFace_forced___block_invoke_2;
  v7[3] = &unk_1E6BDA120;
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  v8 = v5;
  v9 = v6;
  v10 = a2;
  v11 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v5, "enumerateSlotsForCustomEditMode:withBlock:", a2, v7);

}

void __58__NTKFaceView_populateFaceViewEditOptionsFromFace_forced___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "selectedOptionForCustomEditMode:slot:", *(_QWORD *)(a1 + 48), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "setOption:forCustomEditMode:slot:forceApply:", v4, *(_QWORD *)(a1 + 48), v3, *(unsigned __int8 *)(a1 + 56));
  }
  else
  {
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      v8 = 138543874;
      v9 = v6;
      v10 = 2048;
      v11 = v7;
      v12 = 2048;
      v13 = v3;
      _os_log_error_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_ERROR, "Missing option for face %{public}@, %lu, %lu", (uint8_t *)&v8, 0x20u);
    }

  }
}

- (void)populateFaceViewEditOptionsFromFace:(id)a3
{
  -[NTKFaceView populateFaceViewEditOptionsFromFace:forced:](self, "populateFaceViewEditOptionsFromFace:forced:", a3, 0);
}

- (void)configureForEditMode:(int64_t)a3
{
  -[NTKFaceView _setTransitionFraction:fromEditMode:toEditMode:](self, "_setTransitionFraction:fromEditMode:toEditMode:", a3, a3, 0.0);
  -[NTKFaceView _configureForEditMode:](self, "_configureForEditMode:", a3);
}

- (void)configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  -[NTKFaceView _setTransitionFraction:fromEditMode:toEditMode:](self, "_setTransitionFraction:fromEditMode:toEditMode:");
  -[NTKFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](self, "_configureForTransitionFraction:fromEditMode:toEditMode:", a4, a5, a3);
}

- (void)setTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 customEditMode:(int64_t)a6 slot:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id WeakRetained;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a7;
  -[NTKFaceView faceColorPalette](self, "faceColorPalette");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (a6 == 10 && v15)
  {
    objc_msgSend((id)objc_opt_class(), "pigmentFromOption:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceView interpolatedColorPalette](self, "interpolatedColorPalette");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fromPalette");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPigmentEditOption:", v16);

    objc_msgSend((id)objc_opt_class(), "pigmentFromOption:", v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceView interpolatedColorPalette](self, "interpolatedColorPalette");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "toPalette");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setPigmentEditOption:", v19);

    -[NTKFaceView interpolatedColorPalette](self, "interpolatedColorPalette");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTransitionFraction:", a3);

  }
  -[NTKFaceView _applyTransitionFraction:fromOption:toOption:forCustomEditMode:slot:](self, "_applyTransitionFraction:fromOption:toOption:forCustomEditMode:slot:", v12, v13, a6, v14, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "faceViewComplicationSlots");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v25 = v24;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v31;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v31 != v28)
          objc_enumerationMutation(v25);
        -[NTKFaceView _setComplicationAlphaForTransitionFraction:fromOption:toOption:customEditMode:slot:](self, "_setComplicationAlphaForTransitionFraction:fromOption:toOption:customEditMode:slot:", v12, v13, a6, *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v29++), a3, (_QWORD)v30);
      }
      while (v27 != v29);
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v27);
  }

}

- (CGRect)keylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4 selectedSlot:(id)a5
{
  id v8;
  id v9;
  void *v10;
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
  double v22;
  CGRect result;

  v8 = a5;
  v9 = a4;
  -[NTKFaceView optionForCustomEditMode:slot:](self, "optionForCustomEditMode:slot:", a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceView _keylineFrameForEditMode:option:slot:selectedSlot:](self, "_keylineFrameForEditMode:option:slot:selectedSlot:", a3, v10, v9, v8);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)keylineFrameForCustomEditMode:(int64_t)a3 option:(id)a4 slot:(id)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[NTKFaceView _keylineFrameForEditMode:option:slot:selectedSlot:](self, "_keylineFrameForEditMode:option:slot:selectedSlot:", a3, a4, a5, a5);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)_keylineFrameForEditMode:(int64_t)a3 option:(id)a4 slot:(id)a5 selectedSlot:(id)a6
{
  id v10;
  id v11;
  id v12;
  double x;
  double y;
  double width;
  double height;
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
  CGRect v29;
  CGRect result;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[NTKFaceView _relativeKeylineFrameForCustomEditMode:slot:](self, "_relativeKeylineFrameForCustomEditMode:slot:", a3, v11);
  x = v29.origin.x;
  y = v29.origin.y;
  width = v29.size.width;
  height = v29.size.height;
  if (CGRectIsNull(v29))
    -[NTKFaceView _keylineFrameForCustomEditMode:option:slot:selectedSlot:](self, "_keylineFrameForCustomEditMode:option:slot:selectedSlot:", a3, v12, v11, v10);
  else
    -[NTKFaceView _keylineFrameFromRelativeFrame:forEditingMode:option:slot:](self, "_keylineFrameFromRelativeFrame:forEditingMode:option:slot:", a3, v12, v11, x, y, width, height);
  v21 = v17;
  v22 = v18;
  v23 = v19;
  v24 = v20;

  v25 = v21;
  v26 = v22;
  v27 = v23;
  v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)_keylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6;
  void *v7;
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
  double v19;
  CGRect result;

  v6 = a4;
  -[NTKFaceView optionForCustomEditMode:slot:](self, "optionForCustomEditMode:slot:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceView _keylineFrameForEditMode:option:slot:selectedSlot:](self, "_keylineFrameForEditMode:option:slot:selectedSlot:", a3, v7, v6, v6);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)_keylineFrameForCustomEditMode:(int64_t)a3 option:(id)a4 slot:(id)a5 selectedSlot:(id)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (double)_faceEditingScaleForEditMode:(int64_t)a3 slot:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;

  v6 = a4;
  -[NTKFaceView optionForCustomEditMode:slot:](self, "optionForCustomEditMode:slot:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceView faceViewFrameForEditMode:option:slot:](self, "faceViewFrameForEditMode:option:slot:", a3, v7, v6);
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "screenBounds");
  v12 = v11;

  return v9 / v12;
}

- (CGRect)_keylineFrameFromRelativeFrame:(CGRect)a3 forEditingMode:(int64_t)a4 option:(id)a5 slot:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v13;
  id v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGAffineTransform v39;
  CGRect v40;
  CGRect v41;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = (void *)MEMORY[0x1E0C944B0];
  v14 = a6;
  v15 = a5;
  objc_msgSend(v13, "currentDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "screenBounds");
  v18 = v17;

  -[NTKFaceView faceViewFrameForEditMode:option:slot:](self, "faceViewFrameForEditMode:option:slot:", a4, v15, v14);
  v20 = v19;

  -[NTKFaceView device](self, "device");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  CLKPointRoundForDevice();
  v23 = v22;
  v25 = v24;

  CGAffineTransformMakeScale(&v39, v20 / v18, v20 / v18);
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  v41 = CGRectApplyAffineTransform(v40, &v39);
  CGRectOffset(v41, v23, v25);
  -[NTKFaceView device](self, "device");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  CLKPixelAlignRectForDevice();
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;

  v35 = v28;
  v36 = v30;
  v37 = v32;
  v38 = v34;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (BOOL)presentedViewControllerShouldBecomeFirstResponder:(id)a3
{
  return 0;
}

- (BOOL)canBecomeFirstResponder
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[NTKFaceView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "faceViewComplicationSlots");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        -[NTKFaceView normalComplicationDisplayWrapperForSlot:](self, "normalComplicationDisplayWrapperForSlot:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "display");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "canBecomeFirstResponder");

        if ((v12 & 1) != 0)
        {
          v13 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[NTKFaceView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "faceViewComplicationSlots");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        -[NTKFaceView normalComplicationDisplayWrapperForSlot:](self, "normalComplicationDisplayWrapperForSlot:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "display");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "canBecomeFirstResponder")
          && (objc_msgSend(v11, "becomeFirstResponder") & 1) != 0)
        {

          v12 = 1;
          goto LABEL_12;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (id)customEditingViewController
{
  return 0;
}

- (void)setSelectedComplicationSlot:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_selectedComplicationSlot) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedComplicationSlot, a3);
    -[NTKFaceView _updateSaturationForComplicationEditing](self, "_updateSaturationForComplicationEditing");
    -[NTKFaceView setNeedsLayout](self, "setNeedsLayout");
  }
  -[NTKFaceView shiftSelectedComplicationSlotIfHidden](self, "shiftSelectedComplicationSlotIfHidden");

}

- (id)closestVisibleSlotToSlot:(id)a3 editMode:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = v6;
  if (a4 == 1)
  {
    -[NTKFaceView closestVisibleComplicationSlotToSlot:](self, "closestVisibleComplicationSlotToSlot:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v6;
  }
  v9 = v8;

  return v9;
}

- (id)closestVisibleComplicationSlotToSlot:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (v4 && -[NTKFaceView complicationIsHiddenAtSlot:](self, "complicationIsHiddenAtSlot:", v4))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "faceViewComplicationSlots");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "indexOfObject:", v4);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      v8 = 0;
    else
      v8 = v7;
    v9 = (v8 + 1) % (unint64_t)objc_msgSend(v6, "count");
    while (1)
    {
      if (v9 == v8)
      {
        v11 = 0;
        goto LABEL_12;
      }
      objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NTKFaceView complicationIsHiddenAtSlot:](self, "complicationIsHiddenAtSlot:", v10))
        break;
      v9 = (v9 + 1) % objc_msgSend(v6, "count");

    }
    if (v9 == v8)
    {
      v11 = 0;
      v4 = v10;
    }
    else
    {
      v4 = v10;
      v11 = v4;
    }
LABEL_12:

  }
  else
  {
    v4 = v4;
    v11 = v4;
  }

  return v11;
}

- (void)shiftSelectedComplicationSlotIfHidden
{
  void *v3;
  id v4;

  -[NTKFaceView selectedComplicationSlot](self, "selectedComplicationSlot");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (-[NTKFaceView complicationIsHiddenAtSlot:](self, "complicationIsHiddenAtSlot:"))
  {
    -[NTKFaceView closestVisibleComplicationSlotToSlot:](self, "closestVisibleComplicationSlotToSlot:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceView setSelectedComplicationSlot:](self, "setSelectedComplicationSlot:", v3);

  }
}

- (int64_t)complicationPickerStyleForSlot:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  if (-[CLKDevice deviceCategory](self->_device, "deviceCategory") != 1
    && (-[NTKFaceView layoutStyleForSlot:](self, "layoutStyleForSlot:", v4) == 1
     || -[NTKFaceView layoutStyleForSlot:](self, "layoutStyleForSlot:", v4) == 2))
  {
    v5 = 2;
  }
  else
  {
    v5 = -[NTKFaceView _complicationPickerStyleForSlot:](self, "_complicationPickerStyleForSlot:", v4);
  }

  return v5;
}

- (id)layoutRuleForComplicationSlot:(id)a3 inState:(int64_t)a4 layoutOverride:(int64_t)a5
{
  void *v7;
  void *v8;

  -[NSMutableDictionary objectForKey:](self->_complicationLayouts, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutRuleForComplicationState:layoutOverride:", a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  CGRect result;

  v4 = a4;
  v24 = 0u;
  v25 = 0u;
  v6 = a3;
  -[NTKFaceView _getKeylineFrame:padding:forComplicationSlot:selected:](self, "_getKeylineFrame:padding:forComplicationSlot:selected:", &v24, 0, v6, v4);
  -[NTKFaceView _complicationContainerViewForSlot:](self, "_complicationContainerViewForSlot:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceView convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", v7, v24, v25);
  *(_QWORD *)&v24 = v8;
  *((_QWORD *)&v24 + 1) = v9;
  *(_QWORD *)&v25 = v10;
  *((_QWORD *)&v25 + 1) = v11;

  -[NTKFaceView _keylineFrameFromRelativeFrame:forEditingMode:option:slot:](self, "_keylineFrameFromRelativeFrame:forEditingMode:option:slot:", 1, 0, v6, v24, v25);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void)applyBreathingFraction:(double)a3 forComplicationSlot:(id)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  CGAffineTransform v10;
  CGAffineTransform v11;
  CGAffineTransform v12;

  v6 = a4;
  -[NTKFaceView _minimumBreathingScaleForComplicationSlot:](self, "_minimumBreathingScaleForComplicationSlot:", v6);
  v8 = NTKScaleForBreathingFraction(a3, v7);
  -[NTKFaceView normalComplicationDisplayWrapperForSlot:](self, "normalComplicationDisplayWrapperForSlot:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    memset(&v12, 0, sizeof(v12));
    -[NTKFaceView _displayEditingTransformForComplicationSlot:displayWrapper:](self, "_displayEditingTransformForComplicationSlot:displayWrapper:", v6, v9);
    v10 = v12;
    CGAffineTransformScale(&v11, &v10, v8, v8);
    v12 = v11;
    objc_msgSend(v9, "setEditingTransform:", &v11);
  }

}

- (void)setSwitcherSnapshotView:(id)a3
{
  UIImageView *v5;
  UIImageView *switcherSnapshotView;
  UIImageView *v7;

  v5 = (UIImageView *)a3;
  switcherSnapshotView = self->_switcherSnapshotView;
  v7 = v5;
  if (switcherSnapshotView != v5)
  {
    -[UIImageView removeFromSuperview](switcherSnapshotView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_switcherSnapshotView, a3);
    if (self->_switcherSnapshotView)
      -[NTKFaceView addSubview:](self, "addSubview:");
  }

}

- (BOOL)_isAnalog
{
  return 0;
}

- (void)layoutContainerView:(id)a3
{
  -[NTKFaceView _layoutComplicationViews](self, "_layoutComplicationViews", a3);
  -[NTKFaceView _layoutForegroundContainerView](self, "_layoutForegroundContainerView");
  -[NTKFaceView _bringForegroundViewsToFront](self, "_bringForegroundViewsToFront");
  if (self->_sensitiveUIShieldView)
    -[NTKFaceView bringSubviewToFront:](self, "bringSubviewToFront:");
}

- (id)complicationLayoutforSlot:(id)a3
{
  id v4;
  NTKComplicationLayout *v5;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_complicationLayouts, "objectForKey:", v4);
  v5 = (NTKComplicationLayout *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(NTKComplicationLayout);
    -[NSMutableDictionary setObject:forKey:](self->_complicationLayouts, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (void)enumerateComplicationDisplayWrappersWithBlock:(id)a3
{
  id v4;
  NSMutableDictionary *complicationDisplayWrappers;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  complicationDisplayWrappers = self->_complicationDisplayWrappers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__NTKFaceView_enumerateComplicationDisplayWrappersWithBlock___block_invoke;
  v7[3] = &unk_1E6BDA170;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](complicationDisplayWrappers, "enumerateKeysAndObjectsUsingBlock:", v7);

}

uint64_t __61__NTKFaceView_enumerateComplicationDisplayWrappersWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)invalidateComplicationLayout
{
  self->_boundsSizeForComputedLayouts = (CGSize)*MEMORY[0x1E0C9D820];
  -[NTKFaceView setNeedsLayout](self, "setNeedsLayout");
}

- (void)reconfigureComplicationViews
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __43__NTKFaceView_reconfigureComplicationViews__block_invoke;
  v2[3] = &unk_1E6BD8C68;
  v2[4] = self;
  -[NTKFaceView enumerateComplicationDisplayWrappersWithBlock:](self, "enumerateComplicationDisplayWrappersWithBlock:", v2);
}

void __43__NTKFaceView_reconfigureComplicationViews__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "display");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configureComplicationView:forSlot:", v6, v5);

}

- (void)reloadSnapshotContentViews
{
  id WeakRetained;

  if (self->_shouldShowUnsnapshotableContent)
  {
    -[NTKFaceView setShouldShowUnsnapshotableContent:](self, "setShouldShowUnsnapshotableContent:", 0);
    -[NTKFaceView setShouldShowUnsnapshotableContent:](self, "setShouldShowUnsnapshotableContent:", 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "faceViewDidReloadSnapshotContentViews");

  }
}

- (void)_loadSnapshotContentViews
{
  if (-[NTKFaceView _supportsUnadornedSnapshot](self, "_supportsUnadornedSnapshot"))
  {
    if (self->_unadornedSnapshotRemoved)
      -[NTKFaceView loadContentToReplaceUnadornedSnapshot](self, "loadContentToReplaceUnadornedSnapshot");
  }
}

- (BOOL)supportsUnadornedSnapshot
{
  _BOOL4 v3;

  v3 = -[NTKFaceView _supportsUnadornedSnapshot](self, "_supportsUnadornedSnapshot");
  if (v3)
    LOBYTE(v3) = !self->_unadornedSnapshotRemoved;
  return v3;
}

- (BOOL)_supportsUnadornedSnapshot
{
  return 0;
}

- (void)_applyEditConfigurationsWithForce:(BOOL)a3
{
  NSMutableDictionary *editConfigurations;
  _QWORD v6[5];
  id v7;
  BOOL v8;
  id location;

  objc_initWeak(&location, self);
  editConfigurations = self->_editConfigurations;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__NTKFaceView__applyEditConfigurationsWithForce___block_invoke;
  v6[3] = &unk_1E6BDA1C0;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  v8 = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](editConfigurations, "enumerateKeysAndObjectsUsingBlock:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __49__NTKFaceView__applyEditConfigurationsWithForce___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id WeakRetained;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint64_t v12;
  char v13;

  v5 = a3;
  v6 = objc_msgSend(a2, "integerValue");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__NTKFaceView__applyEditConfigurationsWithForce___block_invoke_2;
  v9[3] = &unk_1E6BDA198;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v13 = *(_BYTE *)(a1 + 48);
  v11 = WeakRetained;
  v12 = v6;
  v8 = v5;
  objc_msgSend(v8, "enumerateSlotsWithBlock:", v9);

}

void __49__NTKFaceView__applyEditConfigurationsWithForce___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "optionForCustomEditMode:slot:", *(_QWORD *)(a1 + 56), v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "editOptionForSlot:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 64) || (objc_msgSend(v3, "isEqual:", v4) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "_updateFaceColorPaletteWithOption:mode:", v4, *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 48), "_applyOption:forCustomEditMode:slot:", v4, *(_QWORD *)(a1 + 56), v5);
  }

}

- (void)loadContentToReplaceUnadornedSnapshot
{
  -[NTKFaceView _loadContentToReplaceUnadornedSnapshot](self, "_loadContentToReplaceUnadornedSnapshot");
  -[NTKFaceView _updateTimeOffset](self, "_updateTimeOffset");
  -[NTKFaceView _applyFrozen](self, "_applyFrozen");
  -[NTKFaceView _applySlow](self, "_applySlow");
  -[NTKFaceView _applyDataMode](self, "_applyDataMode");
  -[NTKFaceView _updateStatusIconVisibility](self, "_updateStatusIconVisibility");
  -[NTKFaceView _applyEditConfigurationsWithForce:](self, "_applyEditConfigurationsWithForce:", 0);
  -[NTKFaceView setNeedsRender](self, "setNeedsRender");
}

- (void)handleUnadornedSnapshotRemoved
{
  self->_unadornedSnapshotRemoved = 1;
}

- (void)_reorderSwitcherSnapshotView
{
  if (self->_switcherSnapshotView)
    -[NTKFaceView sendSubviewToBack:](self, "sendSubviewToBack:");
}

- (void)enumerateQuadViewsWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  NSMutableSet *v5;
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
  v4 = (void (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_allSubQuadViews;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  _BOOL4 v4;
  id v6;
  BOOL v7;
  NSObject *v8;
  objc_class *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v4 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[NTKFaceView setNeedsRender](self, "setNeedsRender");
  v7 = self->_needsImageQueueDiscardOnRender || v4;
  self->_needsImageQueueDiscardOnRender = v7;
  -[NTKFaceView _renderSynchronouslyIfNeededInGroup:](self, "_renderSynchronouslyIfNeededInGroup:", v6);

  _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = CFSTR("NO");
    if (v4)
      v12 = CFSTR("YES");
    v13 = 138412546;
    v14 = v10;
    v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_INFO, "Render Synchronously - FaceView: %@, DiscardContents: %@", (uint8_t *)&v13, 0x16u);

  }
}

- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__NTKFaceView__renderSynchronouslyWithImageQueueDiscard_inGroup___block_invoke;
  v8[3] = &unk_1E6BD0500;
  v10 = a3;
  v9 = v6;
  v7 = v6;
  -[NTKFaceView enumerateComplicationDisplayWrappersWithBlock:](self, "enumerateComplicationDisplayWrappersWithBlock:", v8);

}

void __65__NTKFaceView__renderSynchronouslyWithImageQueueDiscard_inGroup___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "display");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "display");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "renderSynchronouslyWithImageQueueDiscard:inGroup:", *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(a1 + 32));

  }
}

- (BOOL)_renderSynchronouslyIfNeededInGroup:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (self->_needsRender)
  {
    -[NTKFaceView window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[NTKFaceView _renderSynchronouslyWithImageQueueDiscard:inGroup:](self, "_renderSynchronouslyWithImageQueueDiscard:inGroup:", self->_needsImageQueueDiscardOnRender, v4);
      self->_needsImageQueueDiscardOnRender = 0;
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  self->_needsRender = 0;

  return (char)v5;
}

- (void)quadViewWillEnterSubtree:(id)a3
{
  -[NSMutableSet addObject:](self->_allSubQuadViews, "addObject:", a3);
}

- (void)quadViewWillLeaveSubtree:(id)a3
{
  -[NSMutableSet removeObject:](self->_allSubQuadViews, "removeObject:", a3);
}

- (id)_blurSourceImage
{
  return 0;
}

- (BOOL)_wantsStatusBarHidden
{
  return 0;
}

- (BOOL)_wantsStatusBarIconShadow
{
  return 0;
}

- (void)_prepareForStatusChange:(BOOL)a3
{
  -[NTKExtraLargeTimeView setStatusBarVisible:animated:](self->_sensitiveUIShieldView, "setStatusBarVisible:animated:", a3, self->_dataMode == 1);
}

- (double)_verticalPaddingForStatusBar
{
  uint64_t v2;
  double result;

  v2 = -[CLKDevice sizeClass](self->_device, "sizeClass");
  result = 2.0;
  if (!v2)
    return 2.5;
  return result;
}

- (double)_horizontalPaddingForStatusBar
{
  return 0.0;
}

- (id)_overrideColorForStatusBar
{
  return 0;
}

- (BOOL)_supportsTimeScrubbing
{
  return 0;
}

- (BOOL)_canStartTimeScrubbing
{
  return 1;
}

- (BOOL)_wantsOpportunisticLiveFaceLoading
{
  return 0;
}

- (void)_becameActiveFace
{
  if (-[NTKFaceView canBecomeFirstResponder](self, "canBecomeFirstResponder"))
    -[NTKFaceView becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)prepareToZoom
{
  void *v3;

  -[NTKFaceView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "faceViewWantsUnadornedSnapshotViewRemoved");

  self->_zooming = 1;
  -[NTKFaceView _prepareToZoom](self, "_prepareToZoom");
}

- (void)cleanupAfterZoom
{
  self->_zooming = 0;
  -[NTKFaceView _cleanupAfterZoom](self, "_cleanupAfterZoom");
}

- (BOOL)_applyRoundedCornerOverlay
{
  return 0;
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  id v7;

  objc_storeStrong((id *)&self->_overrideDate, a3);
  v7 = a3;
  -[NTKTimeView setOverrideDate:duration:](self->_timeView, "setOverrideDate:duration:", v7, a4);
  -[NTKExtraLargeTimeView setOverrideDate:duration:](self->_sensitiveUIShieldView, "setOverrideDate:duration:", v7, a4);

}

- (void)setTimeOffset:(double)a3
{
  -[NTKTimeView setTimeOffset:](self->_timeView, "setTimeOffset:", a3);
}

- (void)setTimeView:(id)a3
{
  objc_storeStrong((id *)&self->_timeView, a3);
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a3;
  -[NTKFaceView complicationFactory](self, "complicationFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "newLegacyViewForComplication:family:slot:", v9, a4, v8);

  return v11;
}

- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int64_t v12;

  v6 = a4;
  -[NTKFaceView complicationFactory](self, "complicationFactory");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        -[NTKFaceView complicationFactory](self, "complicationFactory"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_opt_respondsToSelector(),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    -[NTKFaceView complicationFactory](self, "complicationFactory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "legacyLayoutOverrideforComplicationType:slot:", a3, v6);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[NTKFaceView complicationFactory](self, "complicationFactory");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configureComplicationView:forSlot:", v7, v6);

}

- (unint64_t)_layoutStyleForSlot:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  -[NTKFaceView complicationFactory](self, "complicationFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[NTKFaceView complicationFactory](self, "complicationFactory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "layoutStyleForSlot:", v4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_curvedComplicationCircleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 circleCenter:(CGPoint *)a6 interior:(BOOL *)a7 forSlot:(id)a8
{
  void *v14;
  char v15;
  void *v16;
  id v17;

  v17 = a8;
  if (a3)
    *a3 = 0.0;
  if (a4)
    *a4 = 0.0;
  if (a5)
    *a5 = 0.0;
  if (a7)
    *a7 = 0;
  if (a6)
    *a6 = *(CGPoint *)MEMORY[0x1E0C9D538];
  -[NTKFaceView complicationFactory](self, "complicationFactory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    -[NTKFaceView complicationFactory](self, "complicationFactory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "curvedComplicationCircleRadius:centerAngle:maxAngularWidth:circleCenter:interior:forSlot:", a3, a4, a5, a6, a7, v17);

  }
}

- (id)_detachedComplicationDisplays
{
  return 0;
}

- (void)_loadLayoutRules
{
  id v2;

  -[NTKFaceView complicationFactory](self, "complicationFactory");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadLayoutRules");

}

- (void)_bringForegroundViewsToFront
{
  id v3;

  if (self->_foregroundContainerView)
  {
    -[NTKFaceView contentView](self, "contentView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bringSubviewToFront:", self->_foregroundContainerView);

  }
}

- (BOOL)_needsForegroundContainerView
{
  return 0;
}

- (void)_applyFrozen
{
  void *v3;

  -[NTKFaceView timeView](self, "timeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFrozen:", -[NTKFaceView isFrozen](self, "isFrozen"));

  -[NTKExtraLargeTimeView setFrozen:](self->_sensitiveUIShieldView, "setFrozen:", -[NTKFaceView isFrozen](self, "isFrozen"));
}

+ (id)_prewarmSharedData
{
  return 0;
}

- (id)_accessPrewarmedData
{
  void *v2;
  void *v3;

  +[NTKFaceViewClassPrewarmCache sharedInstance](NTKFaceViewClassPrewarmCache, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prewarmDataForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_usesCustomZoom
{
  return 0;
}

- (BOOL)_usesSimplifiedZoom
{
  return 0;
}

- (CGRect)_relativeKeylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v4 = *MEMORY[0x1E0C9D628];
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)_keylineFrameForCustomEditMode:(int64_t)a3 option:(id)a4 slot:(id)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[NTKFaceView _keylineFrameForCustomEditMode:option:slot:selectedSlot:](self, "_keylineFrameForCustomEditMode:option:slot:selectedSlot:", a3, a4, a5, a5);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3
{
  return 1;
}

- (unint64_t)_keylineLabelAlignmentForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 1)
    return 0;
  else
    return 272;
}

- (double)_editSpeedForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  return 400.0;
}

- (unint64_t)_detentTypeForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  return 2;
}

- (id)_editOptionsThatHideEditModes
{
  void *v2;
  void *v3;

  -[NTKFaceView delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "faceViewEditOptionsThatHideEditModes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)allVisibleComplicationsForCurrentConfiguration
{
  void *v2;
  void *v3;

  -[NTKFaceView delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "faceViewAllVisibleComplicationsForCurrentConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_editOptionThatHidesAllComplications
{
  void *v2;
  void *v3;

  -[NTKFaceView delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "faceViewEditOptionThatHidesAllComplications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_complicationSlotsHiddenByEditOption:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id WeakRetained;
  void *v8;
  void *v9;

  v4 = a3;
  -[NTKFaceView _editOptionThatHidesAllComplications](self, "_editOptionThatHidesAllComplications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = WeakRetained;
  if (v6)
    objc_msgSend(WeakRetained, "faceViewComplicationSlots");
  else
    objc_msgSend(WeakRetained, "faceViewComplicationSlotsHiddenByEditOption:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_complicationSlotsHiddenByCurrentConfiguration
{
  NSMutableDictionary *editConfigurations;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__53;
  v11 = __Block_byref_object_dispose__53;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  editConfigurations = self->_editConfigurations;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__NTKFaceView__complicationSlotsHiddenByCurrentConfiguration__block_invoke;
  v6[3] = &unk_1E6BDA210;
  v6[4] = self;
  v6[5] = &v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](editConfigurations, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __61__NTKFaceView__complicationSlotsHiddenByCurrentConfiguration__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  __int128 v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__NTKFaceView__complicationSlotsHiddenByCurrentConfiguration__block_invoke_2;
  v6[3] = &unk_1E6BDA1E8;
  v7 = v4;
  v8 = *(_OWORD *)(a1 + 32);
  v5 = v4;
  objc_msgSend(v5, "enumerateSlotsWithBlock:", v6);

}

void __61__NTKFaceView__complicationSlotsHiddenByCurrentConfiguration__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "editOptionForSlot:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(v3, "_complicationSlotsHiddenByEditOption:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

}

- (BOOL)complicationIsHiddenAtSlot:(id)a3
{
  return -[NSMutableSet containsObject:](self->_hiddenComplicationSlots, "containsObject:", a3);
}

- (void)setComplicationHidden:(BOOL)a3 atSlot:(id)a4
{
  _BOOL4 v4;
  NSMutableSet *hiddenComplicationSlots;
  id WeakRetained;
  id v8;

  v4 = a3;
  v8 = a4;
  if (-[NTKFaceView complicationIsHiddenAtSlot:](self, "complicationIsHiddenAtSlot:") != v4)
  {
    hiddenComplicationSlots = self->_hiddenComplicationSlots;
    if (v4)
      -[NSMutableSet addObject:](hiddenComplicationSlots, "addObject:", v8);
    else
      -[NSMutableSet removeObject:](hiddenComplicationSlots, "removeObject:", v8);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "faceViewDidHideOrShowComplicationSlot");

  }
}

- (void)_setupComplicationViewsIfHidden
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "faceViewDidHideOrShowComplicationSlot");

}

- (void)_teardownComplicationViewsIfNeeded
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "faceViewDidHideOrShowComplicationSlot");

}

- (void)_setComplicationAlphaForTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 customEditMode:(int64_t)a6 slot:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22[3];
  id location;

  v12 = a4;
  v13 = a5;
  v14 = a7;
  -[NTKFaceView _complicationSlotsHiddenByEditOption:](self, "_complicationSlotsHiddenByEditOption:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "containsObject:", v14);

  -[NTKFaceView _complicationSlotsHiddenByEditOption:](self, "_complicationSlotsHiddenByEditOption:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "containsObject:", v14);

  if (v16 != v18)
  {
    if (!self->_editing)
      a3 = 1.0;
    objc_initWeak(&location, self);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __98__NTKFaceView__setComplicationAlphaForTransitionFraction_fromOption_toOption_customEditMode_slot___block_invoke;
    v19[3] = &unk_1E6BDA238;
    objc_copyWeak(v22, &location);
    v20 = v12;
    v22[1] = (id)a6;
    v21 = v13;
    v22[2] = *(id *)&a3;
    -[NTKFaceView enumerateComplicationDisplayWrappersWithBlock:](self, "enumerateComplicationDisplayWrappersWithBlock:", v19);

    objc_destroyWeak(v22);
    objc_destroyWeak(&location);
  }

}

void __98__NTKFaceView__setComplicationAlphaForTransitionFraction_fromOption_toOption_customEditMode_slot___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 6);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_alphaForComplicationSlot:inEditOption:ofEditMode:", v7, a1[4], a1[7]);
  objc_msgSend(WeakRetained, "_alphaForComplicationSlot:inEditOption:ofEditMode:", v7, a1[5], a1[7]);

  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v6, "setAlpha:");

}

- (BOOL)allFontsHidden
{
  void *v2;
  char v3;

  -[NTKFaceView _editModesDisabledByCurrentConfiguration](self, "_editModesDisabledByCurrentConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", &unk_1E6CA1C80);

  return v3;
}

- (id)_editModesNotDisabledByCurrentConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E20];
  -[NSMutableDictionary allKeys](self->_editConfigurations, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKFaceView _editModesDisabledByCurrentConfiguration](self, "_editModesDisabledByCurrentConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "removeObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_editModesDisabledByCurrentConfiguration
{
  void *v3;
  void *v4;
  NSMutableDictionary *editConfigurations;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  -[NTKFaceView _editOptionsThatHideEditModes](self, "_editOptionsThatHideEditModes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__53;
  v16 = __Block_byref_object_dispose__53;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  editConfigurations = self->_editConfigurations;
  v17 = v4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__NTKFaceView__editModesDisabledByCurrentConfiguration__block_invoke;
  v9[3] = &unk_1E6BDA260;
  v9[4] = self;
  v6 = v3;
  v10 = v6;
  v11 = &v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](editConfigurations, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __55__NTKFaceView__editModesDisabledByCurrentConfiguration__block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;

  v4 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__NTKFaceView__editModesDisabledByCurrentConfiguration__block_invoke_2;
  v10[3] = &unk_1E6BD4F58;
  v5 = a1[4];
  v6 = (void *)a1[5];
  v11 = v4;
  v12 = v5;
  v7 = v6;
  v8 = a1[6];
  v13 = v7;
  v14 = v8;
  v9 = v4;
  objc_msgSend(v9, "enumerateSlotsWithBlock:", v10);

}

void __55__NTKFaceView__editModesDisabledByCurrentConfiguration__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "editOptionForSlot:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 48);
  v5 = *(void **)(*(_QWORD *)(a1 + 40) + 600);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = __55__NTKFaceView__editModesDisabledByCurrentConfiguration__block_invoke_3;
  v7[3] = &unk_1E6BDA260;
  v7[1] = 3221225472;
  v8 = v4;
  v9 = v3;
  v10 = *(_QWORD *)(a1 + 56);
  v6 = v3;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __55__NTKFaceView__editModesDisabledByCurrentConfiguration__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v4)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v5);

}

- (void)hideAppropriateComplicationsForCurrentConfigurationInEditMode:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id location;

  objc_initWeak(&location, self);
  -[NTKFaceView _complicationSlotsHiddenByCurrentConfiguration](self, "_complicationSlotsHiddenByCurrentConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "faceViewComplicationSlots");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_everyComplicationHidden = v5 == objc_msgSend(v7, "count");

  v8 = (void *)-[NSMutableSet copy](self->_hiddenComplicationSlots, "copy");
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __77__NTKFaceView_hideAppropriateComplicationsForCurrentConfigurationInEditMode___block_invoke;
  v17[3] = &unk_1E6BD2138;
  v17[4] = self;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v17);

  v11 = v9;
  v12 = 3221225472;
  v13 = __77__NTKFaceView_hideAppropriateComplicationsForCurrentConfigurationInEditMode___block_invoke_2;
  v14 = &unk_1E6BDA288;
  objc_copyWeak(&v16, &location);
  v10 = v4;
  v15 = v10;
  -[NTKFaceView enumerateComplicationDisplayWrappersWithBlock:](self, "enumerateComplicationDisplayWrappersWithBlock:", &v11);
  -[NTKFaceView shiftSelectedComplicationSlotIfHidden](self, "shiftSelectedComplicationSlotIfHidden", v11, v12, v13, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

uint64_t __77__NTKFaceView_hideAppropriateComplicationsForCurrentConfigurationInEditMode___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setComplicationHidden:atSlot:", 0, a2);
}

void __77__NTKFaceView_hideAppropriateComplicationsForCurrentConfigurationInEditMode___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  int v7;
  double v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v9);
  v8 = 1.0;
  if (v7)
  {
    objc_msgSend(WeakRetained, "setComplicationHidden:atSlot:", 1, v9, 1.0);
    v8 = 0.0;
  }
  objc_msgSend(v5, "setAlpha:", v8);

}

- (int64_t)_complicationPickerStyleForSlot:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int64_t v10;

  v4 = a3;
  -[NTKFaceView complicationFactory](self, "complicationFactory");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[NTKFaceView complicationFactory](self, "complicationFactory"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    -[NTKFaceView complicationFactory](self, "complicationFactory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "complicationPickerStyleForSlot:", v4);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_keylineViewForComplicationSlot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[NTKFaceView complicationFactory](self, "complicationFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5
    || (-[NTKFaceView complicationFactory](self, "complicationFactory"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "keylineViewForComplicationSlot:", v4),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    -[NTKFaceView _defaultKeylineViewForComplicationSlot:](self, "_defaultKeylineViewForComplicationSlot:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)_defaultKeylineViewForComplicationSlot:(id)a3
{
  id v4;
  double v5;
  void *v6;

  v4 = a3;
  if (-[NTKFaceView _keylineStyleForComplicationSlot:](self, "_keylineStyleForComplicationSlot:", v4))
  {
    NTKFittedCircleKeylineView();
  }
  else
  {
    -[NTKFaceView _keylineCornerRadiusForComplicationSlot:](self, "_keylineCornerRadiusForComplicationSlot:", v4);
    NTKKeylineViewWithContinuousCurveCornerRadius(v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)_keylineStyleForComplicationSlot:(id)a3
{
  return 0;
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return 0;
}

- (double)_minimumBreathingScaleForComplicationSlot:(id)a3
{
  return 0.9;
}

- (void)_finalizeForSnapshotting:(id)a3
{
  void (**v3)(_QWORD);
  NSObject *v4;
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(_QWORD))a3;
  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "NTKFaceView(%@) _finalizeForSnapshotting just immediatly call completion", (uint8_t *)&v7, 0xCu);

  }
  if (v3)
    v3[2](v3);

}

- (void)_performPrewarmRoutine:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (CGRect)_faceViewFrameForEditMode:(int64_t)a3 option:(id)a4 slot:(id)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (int64_t)_swatchImageContentMode
{
  return 1;
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  uint64_t v5;
  uint64_t v6;

  if (a4 != 10)
    return 0;
  -[NTKFaceView _swatchImageForColorOption:size:](self, "_swatchImageForColorOption:size:", a3, 10, a5, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), v5, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  return 0;
}

- (BOOL)_allowsEditingSliderEditableColorsForSlot:(id)a3
{
  return 1;
}

- (id)swatchImageForColorOption:(id)a3
{
  return -[NTKFaceView swatchImageForColorOption:size:](self, "swatchImageForColorOption:size:", a3, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (id)_swatchImageForColorOption:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__53;
  v22 = __Block_byref_object_dispose__53;
  v23 = 0;
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1F8E91518))
  {
    -[NTKFaceView faceColorPalette](self, "faceColorPalette");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[NTKFaceView faceColorPalette](self, "faceColorPalette");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pigmentEditOption");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __47__NTKFaceView__swatchImageForColorOption_size___block_invoke;
      v17[3] = &unk_1E6BDA2B0;
      v17[4] = &v18;
      *(double *)&v17[5] = width;
      *(double *)&v17[6] = height;
      objc_msgSend(v9, "executeWithOption:block:", v10, v17);

    }
  }
  v11 = (void *)v19[5];
  if (!v11)
  {
    -[NTKFaceView _swatchColorForColorOption:](self, "_swatchColorForColorOption:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_swatchImageForColorOption:forDevice:color:size:", v7, self->_device, v12, width, height);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v19[5];
    v19[5] = v13;

    v11 = (void *)v19[5];
  }
  v15 = v11;
  _Block_object_dispose(&v18, 8);

  return v15;
}

void __47__NTKFaceView__swatchImageForColorOption_size___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "swatchImageForSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (id)_swatchImageForColorOption:(id)a3 forDevice:(id)a4 color:(id)a5 size:(CGSize)a6
{
  double height;
  double width;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  double v24;
  double v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  CGSize v36;

  height = a6.height;
  width = a6.width;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!_swatchImageForColorOption_forDevice_color_size__swatches)
  {
    v13 = objc_opt_new();
    v14 = (void *)_swatchImageForColorOption_forDevice_color_size__swatches;
    _swatchImageForColorOption_forDevice_color_size__swatches = v13;

  }
  v34 = 0;
  v35 = 0;
  v32 = 0;
  v33 = 0;
  objc_msgSend(v12, "getRed:green:blue:alpha:", &v35, &v34, &v33, &v32);
  v15 = (void *)MEMORY[0x1E0CB3940];
  v17 = v34;
  v16 = v35;
  v19 = v32;
  v18 = v33;
  v36.width = width;
  v36.height = height;
  NSStringFromCGSize(v36);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%f-%f-%f-%f-%@"), v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)_swatchImageForColorOption_forDevice_color_size__swatches, "objectForKey:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      +[NTKEditOption sizeForSwatchStyle:](NTKEditOption, "sizeForSwatchStyle:", objc_msgSend(v10, "swatchStyle"));
      width = v24;
      height = v25;
    }
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", width, height);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __63__NTKFaceView__swatchImageForColorOption_forDevice_color_size___block_invoke;
    v28[3] = &unk_1E6BD1528;
    v29 = v12;
    v30 = width;
    v31 = height;
    objc_msgSend(v26, "imageWithActions:", v28);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_swatchImageForColorOption_forDevice_color_size__swatches, "setObject:forKey:", v22, v21);

  }
  return v22;
}

void __63__NTKFaceView__swatchImageForColorOption_forDevice_color_size___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setFill");
  objc_msgSend(v4, "format");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = MEMORY[0x1BCCA72B8](objc_msgSend(v5, "bounds"));
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  v11 = -1.0 / v10;

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v6, v8, (*(double *)(a1 + 40) + v11) * 0.5, 0.0, 6.28318531);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fill");

}

- (id)swatchPrimaryColorForColorOption:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__53;
  v16 = __Block_byref_object_dispose__53;
  v17 = 0;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1F8E91518)
    && (-[NTKFaceView faceColorPalette](self, "faceColorPalette"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[NTKFaceView faceColorPalette](self, "faceColorPalette");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pigmentEditOption");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __48__NTKFaceView_swatchPrimaryColorForColorOption___block_invoke;
    v11[3] = &unk_1E6BCE038;
    v11[4] = &v12;
    objc_msgSend(v6, "executeWithOption:block:", v7, v11);

  }
  else
  {
    -[NTKFaceView _swatchColorForColorOption:](self, "_swatchColorForColorOption:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v13[5];
    v13[5] = v8;
  }

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __48__NTKFaceView_swatchPrimaryColorForColorOption___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "swatchPrimaryColor");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_swatchColorForColorOption:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  CLKDevice *device;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1F8E91518)
    && (-[NTKFaceView faceColorPalette](self, "faceColorPalette"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__53;
    v21 = __Block_byref_object_dispose__53;
    v22 = 0;
    -[NTKFaceView faceColorPalette](self, "faceColorPalette");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pigmentEditOption");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __42__NTKFaceView__swatchColorForColorOption___block_invoke;
    v16[3] = &unk_1E6BCE038;
    v16[4] = &v17;
    objc_msgSend(v6, "executeWithOption:block:", v7, v16);

    v8 = (id)v18[5];
    _Block_object_dispose(&v17, 8);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      device = self->_device;
      v10 = v4;
      -[NTKFaceView faceColorPalette](self, "faceColorPalette");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pigmentEditOption");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)objc_msgSend(v11, "copyWithOption:", v12);
      +[NTKFaceColorScheme colorSchemeForDevice:withFaceColorPalette:units:](NTKFaceColorScheme, "colorSchemeForDevice:withFaceColorPalette:units:", device, v13, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "foregroundColor");
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v8;
}

void __42__NTKFaceView__swatchColorForColorOption___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "swatch");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)prepareForStatusChange:(BOOL)a3
{
  self->_statusIconVisible = a3;
  -[NTKFaceView _updateStatusIconVisibility](self, "_updateStatusIconVisibility");
}

- (void)_updateStatusIconVisibility
{
  _BOOL4 wasScrubbingAtStartOfTransition;
  _BOOL8 v3;

  if (self->_timeScrubbing)
  {
    wasScrubbingAtStartOfTransition = 0;
    if (!self->_editing)
      goto LABEL_9;
LABEL_6:
    v3 = 0;
    goto LABEL_7;
  }
  if (self->_transitioningBetweenLiveAndScrubbing)
  {
    wasScrubbingAtStartOfTransition = self->_wasScrubbingAtStartOfTransition;
    if (self->_editing)
      goto LABEL_6;
  }
  else
  {
    wasScrubbingAtStartOfTransition = 1;
    if (self->_editing)
      goto LABEL_6;
  }
LABEL_9:
  if (self->_dataMode == 3)
    wasScrubbingAtStartOfTransition = 0;
  v3 = self->_statusIconVisible && wasScrubbingAtStartOfTransition;
LABEL_7:
  -[NTKFaceView _prepareForStatusChange:](self, "_prepareForStatusChange:", v3);
}

- (BOOL)complicationDisplayWrapperView:(id)a3 shouldStartCustomDataAnimationFromEarlierView:(id)a4 laterView:(id)a5 isForward:(BOOL)a6 animationType:(unint64_t)a7
{
  id v9;
  id v10;
  uint64_t v11;
  char isKindOfClass;

  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(a3, "family");
  isKindOfClass = 1;
  if ((unint64_t)(v11 - 10) >= 3 && v11 != 8)
  {
    if (v11 == 9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      isKindOfClass = 0;
    }
  }

  return isKindOfClass & 1;
}

- (void)complicationDisplayWrapperView:(id)a3 updateCustomDataAnimationFromEarlierView:(id)a4 laterView:(id)a5 isForward:(BOOL)a6 animationType:(unint64_t)a7 animationDuration:(double)a8 animationFraction:(float)a9
{
  _BOOL8 v12;
  id v15;
  double v16;
  __objc2_class *v17;
  id v18;

  v12 = a6;
  v18 = a4;
  v15 = a5;
  switch(objc_msgSend(a3, "family"))
  {
    case 8:
      v17 = NTKRichComplicationCornerUtilities;
      goto LABEL_4;
    case 10:
    case 11:
    case 12:
      v17 = (__objc2_class *)objc_opt_class();
LABEL_4:
      *(float *)&v16 = a9;
      -[__objc2_class updateCustomDataAnimationFromEarlierView:laterView:isForward:animationType:animationDuration:animationFraction:](v17, "updateCustomDataAnimationFromEarlierView:laterView:isForward:animationType:animationDuration:animationFraction:", v18, v15, v12, a7, a8, v16);
      break;
    default:
      break;
  }

}

- (double)alphaForDimmedState
{
  return 0.2;
}

- (BOOL)_legacyShouldSwapGraphicCircularComplicationColors
{
  return 0;
}

- (BOOL)_useAlternateComplicationColorForGraphicCircularComplicationInView:(id)a3
{
  uint64_t v3;
  id v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  v6 = -[NTKFaceView _legacyShouldSwapGraphicCircularComplicationColors](self, "_legacyShouldSwapGraphicCircularComplicationColors");
  if (!v5 || !v6)
    goto LABEL_11;
  while (!objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(v5, "superview");
    v3 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v3;
    if (!v3)
      goto LABEL_11;
  }
  v5 = v5;
  v7 = objc_msgSend(v5, "family");
  v8 = v7;
  if (v7 == 12 || v7 == 10)
  {
    objc_msgSend(v5, "complicationSlotIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v3) = -[NTKFaceView _useAlternateComplicationColorForGraphicCircularComplicationInSlot:](self, "_useAlternateComplicationColorForGraphicCircularComplicationInSlot:", v9);

  }
  if (v8 != 10 && v8 != 12)
LABEL_11:
    LOBYTE(v3) = 0;

  return v3 & 1;
}

- (BOOL)_useAlternateComplicationColorForGraphicCircularComplicationInSlot:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NTKFaceView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "faceViewComplicationForSlot:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[NTKFaceView _useAlternateComplicationColorForGraphicCircularComplication:](self, "_useAlternateComplicationColorForGraphicCircularComplication:", v6);
  return (char)self;
}

- (BOOL)_useAlternateComplicationColorForGraphicCircularComplication:(id)a3
{
  id v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "complicationType");
  v5 = 0;
  if (v4 > 37)
  {
    if (v4 != 38)
    {
      if (v4 != 48)
        goto LABEL_10;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_10;
      objc_msgSend(v3, "complication");
      v6 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v6, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v6) = objc_msgSend(&unk_1E6CAA750, "containsObject:", v7);
      if ((v6 & 1) == 0)
        goto LABEL_10;
      v5 = 0;
    }
  }
  else if (v4 != 1 && v4 != 5)
  {
LABEL_10:
    v5 = 1;
  }

  return v5;
}

- (void)_updateTimeOffset
{
  -[NTKFaceView setTimeOffset:](self, "setTimeOffset:", 0.0);
}

- (void)_setTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  _QWORD v9[8];

  self->_editModeTransitionFraction = a3;
  self->_fromEditMode = a4;
  self->_toEditMode = a5;
  -[NTKFaceView _updateComplicationMaxSize](self, "_updateComplicationMaxSize");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__NTKFaceView__setTransitionFraction_fromEditMode_toEditMode___block_invoke;
  v9[3] = &unk_1E6BDA2D8;
  v9[4] = self;
  v9[5] = a4;
  v9[6] = a5;
  *(double *)&v9[7] = a3;
  -[NTKFaceView enumerateComplicationDisplayWrappersWithBlock:](self, "enumerateComplicationDisplayWrappersWithBlock:", v9);
  -[NTKFaceView setNeedsLayout](self, "setNeedsLayout");
  -[NTKContainerView setNeedsLayout](self->_foregroundContainerView, "setNeedsLayout");
}

void __62__NTKFaceView__setTransitionFraction_fromEditMode_toEditMode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = 0.0;
  if ((objc_msgSend(*(id *)(a1 + 32), "complicationIsHiddenAtSlot:", v10) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "optionForCustomEditMode:slot:", *(_QWORD *)(a1 + 40), v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "optionForCustomEditMode:slot:", *(_QWORD *)(a1 + 48), v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_alphaForComplicationSlot:inEditOption:ofEditMode:", v10, v7, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_alphaForComplicationSlot:inEditOption:ofEditMode:", v10, v8, *(_QWORD *)(a1 + 48));
    CLKInterpolateBetweenFloatsClipped();
    v6 = v9;

  }
  objc_msgSend(v5, "setAlpha:", v6);

}

- (double)_alphaForComplicationSlot:(id)a3 inEditOption:(id)a4 ofEditMode:(int64_t)a5
{
  id v8;
  void *v9;
  char v10;
  double v11;

  v8 = a3;
  -[NTKFaceView _complicationSlotsHiddenByEditOption:](self, "_complicationSlotsHiddenByEditOption:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v8);

  v11 = 0.0;
  if ((v10 & 1) == 0)
  {
    if (-[NTKFaceView _fadesComplicationSlot:inEditMode:](self, "_fadesComplicationSlot:inEditMode:", v8, a5))
      v11 = 0.2;
    else
      v11 = 1.0;
  }

  return v11;
}

- (CGRect)_frameForComplicationDisplayWrapper:(id)a3 inSlot:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
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
  double v33;
  double v34;
  double v35;
  CGRect result;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "preferredSize");
  v9 = v8;
  v11 = v10;
  v12 = objc_msgSend(v7, "layoutOverride");

  if (self->_editing)
  {
    -[NTKFaceView _layoutRuleForComplicationSlot:withOverride:inEditMode:](self, "_layoutRuleForComplicationSlot:withOverride:inEditMode:", v6, v12, self->_fromEditMode);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceView _layoutRuleForComplicationSlot:withOverride:inEditMode:](self, "_layoutRuleForComplicationSlot:withOverride:inEditMode:", v6, v12, self->_toEditMode);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqual:", v14);
    objc_msgSend(v13, "calculateLayoutFrameForBoundsSize:", v9, v11);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    if ((v15 & 1) == 0)
    {
      objc_msgSend(v14, "calculateLayoutFrameForBoundsSize:", v9, v11);
      CLKInterpolateBetweenRects();
      v17 = v24;
      v19 = v25;
      v21 = v26;
      v23 = v27;
    }

  }
  else
  {
    -[NTKFaceView layoutRuleForComplicationSlot:inState:layoutOverride:](self, "layoutRuleForComplicationSlot:inState:layoutOverride:", v6, 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "calculateLayoutFrameForBoundsSize:", v9, v11);
    v17 = v28;
    v19 = v29;
    v21 = v30;
    v23 = v31;
  }

  v32 = v17;
  v33 = v19;
  v34 = v21;
  v35 = v23;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (CGAffineTransform)_displayEditingTransformForComplicationSlot:(SEL)a3 displayWrapper:(id)a4
{
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  CGAffineTransform *result;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v8 = a4;
  v9 = MEMORY[0x1E0C9BAA8];
  v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v10;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v9 + 32);
  v11 = objc_msgSend(a5, "layoutOverride");
  if (self->_editing)
  {
    -[NTKFaceView _layoutRuleForComplicationSlot:withOverride:inEditMode:](self, "_layoutRuleForComplicationSlot:withOverride:inEditMode:", v8, v11, self->_fromEditMode);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceView _layoutRuleForComplicationSlot:withOverride:inEditMode:](self, "_layoutRuleForComplicationSlot:withOverride:inEditMode:", v8, v11, self->_toEditMode);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqual:", v13))
    {
      if (v13)
      {
        objc_msgSend(v13, "editingTransform");
      }
      else
      {
        v17 = 0u;
        v18 = 0u;
        v16 = 0u;
      }
      goto LABEL_15;
    }
    if (v12)
    {
      objc_msgSend(v12, "editingTransform");
      if (!v13)
      {
LABEL_14:
        CLKInterpolateBetweenTransform();
LABEL_15:
        *(_OWORD *)&retstr->a = v16;
        *(_OWORD *)&retstr->c = v17;
        *(_OWORD *)&retstr->tx = v18;

        goto LABEL_16;
      }
    }
    else if (!v13)
    {
      goto LABEL_14;
    }
    objc_msgSend(v13, "editingTransform");
    goto LABEL_14;
  }
  -[NTKFaceView layoutRuleForComplicationSlot:inState:layoutOverride:](self, "layoutRuleForComplicationSlot:inState:layoutOverride:", v8, 0, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v14;
  if (v14)
  {
    objc_msgSend(v14, "editingTransform");
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v16 = 0u;
  }
  *(_OWORD *)&retstr->a = v16;
  *(_OWORD *)&retstr->c = v17;
  *(_OWORD *)&retstr->tx = v18;
LABEL_16:

  return result;
}

- (CGAffineTransform)_displayContentTransformForComplicationSlot:(SEL)a3 displayWrapper:(id)a4
{
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  CGAffineTransform *result;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v8 = a4;
  v9 = MEMORY[0x1E0C9BAA8];
  v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v10;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v9 + 32);
  v11 = objc_msgSend(a5, "layoutOverride");
  if (self->_editing)
  {
    -[NTKFaceView _layoutRuleForComplicationSlot:withOverride:inEditMode:](self, "_layoutRuleForComplicationSlot:withOverride:inEditMode:", v8, v11, self->_fromEditMode);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceView _layoutRuleForComplicationSlot:withOverride:inEditMode:](self, "_layoutRuleForComplicationSlot:withOverride:inEditMode:", v8, v11, self->_toEditMode);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqual:", v13))
    {
      if (v13)
      {
        objc_msgSend(v13, "contentTransform");
      }
      else
      {
        v17 = 0u;
        v18 = 0u;
        v16 = 0u;
      }
      goto LABEL_15;
    }
    if (v12)
    {
      objc_msgSend(v12, "contentTransform");
      if (!v13)
      {
LABEL_14:
        CLKInterpolateBetweenTransform();
LABEL_15:
        *(_OWORD *)&retstr->a = v16;
        *(_OWORD *)&retstr->c = v17;
        *(_OWORD *)&retstr->tx = v18;

        goto LABEL_16;
      }
    }
    else if (!v13)
    {
      goto LABEL_14;
    }
    objc_msgSend(v13, "contentTransform");
    goto LABEL_14;
  }
  -[NTKFaceView layoutRuleForComplicationSlot:inState:layoutOverride:](self, "layoutRuleForComplicationSlot:inState:layoutOverride:", v8, 0, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v14;
  if (v14)
  {
    objc_msgSend(v14, "contentTransform");
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v16 = 0u;
  }
  *(_OWORD *)&retstr->a = v16;
  *(_OWORD *)&retstr->c = v17;
  *(_OWORD *)&retstr->tx = v18;
LABEL_16:

  return result;
}

- (void)_updateComplicationMaxSize
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__NTKFaceView__updateComplicationMaxSize__block_invoke;
  v3[3] = &unk_1E6BDA300;
  objc_copyWeak(&v4, &location);
  -[NTKFaceView enumerateComplicationDisplayWrappersWithBlock:](self, "enumerateComplicationDisplayWrappersWithBlock:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __41__NTKFaceView__updateComplicationMaxSize__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_updateMaxSizeForDisplayWrapper:slot:", v5, v6);

}

- (void)_updateMaxSizeForDisplayWrapper:(id)a3 slot:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v6 = a4;
  v11 = a3;
  -[NTKFaceView _maxSizeForComplicationSlot:layoutOverride:](self, "_maxSizeForComplicationSlot:layoutOverride:", v6, objc_msgSend(v11, "layoutOverride"));
  v8 = v7;
  v10 = v9;

  objc_msgSend(v11, "setMaxSize:", v8, v10);
}

- (CGSize)_maxSizeForComplicationSlot:(id)a3 layoutOverride:(int64_t)a4
{
  int64_t fromEditMode;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  if (self->_editing)
  {
    fromEditMode = self->_fromEditMode;
    v7 = a3;
    -[NTKFaceView _layoutRuleForComplicationSlot:withOverride:inEditMode:](self, "_layoutRuleForComplicationSlot:withOverride:inEditMode:", v7, a4, fromEditMode);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceView _layoutRuleForComplicationSlot:withOverride:inEditMode:](self, "_layoutRuleForComplicationSlot:withOverride:inEditMode:", v7, a4, self->_toEditMode);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v7) = objc_msgSend(v8, "isEqual:", v9);
    objc_msgSend(v8, "maximumSize");
    v11 = v10;
    v13 = v12;
    if ((v7 & 1) == 0)
    {
      objc_msgSend(v9, "maximumSize");
      CLKInterpolateBetweenSizes();
      v11 = v14;
      v13 = v15;
    }

  }
  else
  {
    v16 = a3;
    -[NTKFaceView layoutRuleForComplicationSlot:inState:layoutOverride:](self, "layoutRuleForComplicationSlot:inState:layoutOverride:", v16, 0, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "maximumSize");
    v11 = v17;
    v13 = v18;
  }

  v19 = v11;
  v20 = v13;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)_getKeylineFrame:(CGRect *)a3 padding:(UIEdgeInsets *)a4 forComplicationSlot:(id)a5 selected:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
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
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v38;

  v6 = a6;
  v10 = a5;
  v38 = v10;
  if (v6)
  {
    -[NSMutableDictionary objectForKey:](self->_complicationLayouts, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "defaultLayoutRuleForState:", 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "referenceFrame");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(v12, "keylinePadding");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
  }
  else
  {
    -[NSMutableDictionary objectForKey:](self->_complicationDisplayWrappers, "objectForKey:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceView layoutRuleForComplicationSlot:inState:layoutOverride:](self, "layoutRuleForComplicationSlot:inState:layoutOverride:", v38, 2, objc_msgSend(v12, "layoutOverride"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NTKFaceView _layoutStyleForSlot:](self, "_layoutStyleForSlot:", v38) == 1
      || -[NTKFaceView _layoutStyleForSlot:](self, "_layoutStyleForSlot:", v38) == 2)
    {
      objc_msgSend(v29, "referenceFrame");
    }
    else
    {
      objc_msgSend(v12, "preferredSize");
      objc_msgSend(v29, "calculateLayoutFrameForBoundsSize:");
    }
    v14 = v30;
    v16 = v31;
    v18 = v32;
    v20 = v33;
    objc_msgSend(v29, "keylinePadding");
    v22 = v34;
    v24 = v35;
    v26 = v36;
    v28 = v37;

  }
  if (a3)
  {
    a3->origin.x = v14 - v24;
    a3->origin.y = v16 - v22;
    a3->size.width = v18 - (-v28 - v24);
    a3->size.height = v20 - (-v26 - v22);
  }
  if (a4)
  {
    a4->top = v22;
    a4->left = v24;
    a4->bottom = v26;
    a4->right = v28;
  }

}

- (id)_layoutRuleForComplicationSlot:(id)a3 withOverride:(int64_t)a4 inEditMode:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  v9 = v8;
  if (a5)
  {
    if (a5 == 1)
    {
      if (objc_msgSend(v8, "isEqual:", self->_selectedComplicationSlot))
        a5 = 3;
      else
        a5 = 2;
    }
    else
    {
      a5 = 1;
    }
  }
  -[NTKFaceView layoutRuleForComplicationSlot:inState:layoutOverride:](self, "layoutRuleForComplicationSlot:inState:layoutOverride:", v9, a5, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_layoutComplicationViews
{
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, void *, void *);
  void *v6;
  id v7;
  id location;

  kdebug_trace();
  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  v4 = 3221225472;
  v5 = __39__NTKFaceView__layoutComplicationViews__block_invoke;
  v6 = &unk_1E6BDA300;
  objc_copyWeak(&v7, &location);
  -[NTKFaceView enumerateComplicationDisplayWrappersWithBlock:](self, "enumerateComplicationDisplayWrappersWithBlock:", &v3);
  -[NTKFaceView _didLayoutComplicationViews](self, "_didLayoutComplicationViews", v3, v4, v5, v6);
  kdebug_trace();
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __39__NTKFaceView__layoutComplicationViews__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_layoutComplicationViewWithWrapper:forSlot:", v5, v6);

}

- (void)_layoutComplicationViewForSlot:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NTKFaceView normalComplicationDisplayWrapperForSlot:](self, "normalComplicationDisplayWrapperForSlot:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKFaceView _layoutComplicationViewWithWrapper:forSlot:](self, "_layoutComplicationViewWithWrapper:forSlot:", v5, v4);

}

- (void)_layoutComplicationViewWithWrapper:(id)a3 forSlot:(id)a4
{
  id v6;
  id v7;
  __int128 *v8;
  __int128 v9;
  void *v10;
  uint64_t v11;
  _OWORD v12[3];
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v6 = a3;
  v7 = a4;
  -[NTKFaceView _frameForComplicationDisplayWrapper:inSlot:](self, "_frameForComplicationDisplayWrapper:inSlot:", v6, v7);
  objc_msgSend(v6, "ntk_setBoundsAndPositionFromFrame:");
  if (self->_editing)
  {
    v14 = 0u;
    v15 = 0u;
    v13 = 0u;
    -[NTKFaceView _displayEditingTransformForComplicationSlot:displayWrapper:](self, "_displayEditingTransformForComplicationSlot:displayWrapper:", v7, v6);
    v12[0] = v13;
    v12[1] = v14;
    v12[2] = v15;
    v8 = v12;
  }
  else
  {
    v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v13 = *MEMORY[0x1E0C9BAA8];
    v14 = v9;
    v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v8 = &v13;
  }
  objc_msgSend(v6, "setEditingTransform:", v8);
  -[NTKFaceView _displayContentTransformForComplicationSlot:displayWrapper:](self, "_displayContentTransformForComplicationSlot:displayWrapper:", v7, v6);
  objc_msgSend(v6, "setContentTransform:", &v11);
  -[NTKFaceView _complicationContainerViewForSlot:](self, "_complicationContainerViewForSlot:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bringSubviewToFront:", v6);

}

- (id)_complicationContainerViewForSlot:(id)a3
{
  return self->_complicationContainerView;
}

- (BOOL)_wantsDimWithDesaturationFilterDuringComplicationEditing
{
  return 0;
}

- (id)_additonalViewsToApplyDesaturationDuringComplicationEditing
{
  return 0;
}

- (void)startScrubbingAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSDate *v5;
  NSDate *analyticsTimeTravelSessionStart;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  analyticsTimeTravelSessionStart = self->_analyticsTimeTravelSessionStart;
  self->_analyticsTimeTravelSessionStart = v5;

  -[NTKFaceView startScrubbingAnimated:withCompletion:](self, "startScrubbingAnimated:withCompletion:", v3, 0);
}

- (void)startScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4
{
  void (**v5)(_QWORD);
  void *v6;
  _QWORD v7[4];
  void (**v8)(_QWORD);
  id v9;
  id location;

  v5 = (void (**)(_QWORD))a4;
  if (-[NTKFaceView _supportsTimeScrubbing](self, "_supportsTimeScrubbing") && !self->_timeScrubbing)
  {
    self->_transitioningBetweenLiveAndScrubbing = 1;
    self->_wasScrubbingAtStartOfTransition = 0;
    -[NTKFaceView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "faceViewWillEnterTimeTravel");

    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__NTKFaceView_startScrubbingAnimated_withCompletion___block_invoke;
    v7[3] = &unk_1E6BD1890;
    objc_copyWeak(&v9, &location);
    v8 = v5;
    -[NTKFaceView _startScrubbingAnimated:withCompletion:](self, "_startScrubbingAnimated:withCompletion:", 1, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else if (v5)
  {
    v5[2](v5);
  }

}

void __53__NTKFaceView_startScrubbingAnimated_withCompletion___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  v7 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 682) = 1;
    *((_BYTE *)WeakRetained + 441) = 0;
    +[NTKDate faceDate](NTKDate, "faceDate");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v7[57];
    v7[57] = (id)v4;

    objc_storeStrong(v7 + 56, v7[57]);
    v3 = v7;
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    (*(void (**)(uint64_t, id *))(v6 + 16))(v6, v3);
    v3 = v7;
  }

}

- (void)_startScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)endScrubbingAnimated:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[4];

  v12 = a3;
  v16[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", self->_analyticsTimeTravelSessionStart);
  v6 = v5;
  NTKFaceStyleDescription(-[NTKFaceView faceStyle](self, "faceStyle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("eventName");
  v15[1] = CFSTR("face");
  v16[0] = CFSTR("sessionduration");
  v16[1] = v7;
  v15[2] = CFSTR("value");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

  v13[0] = CFSTR("eventName");
  v13[1] = CFSTR("face");
  v14[0] = CFSTR("maximumoffset");
  v14[1] = v7;
  v13[2] = CFSTR("value");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_analyticsTimeTravelMaximumOffset);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

  self->_analyticsTimeTravelMaximumOffset = 0.0;
  -[NTKFaceView endScrubbingAnimated:withCompletion:](self, "endScrubbingAnimated:withCompletion:", v12, 0);

}

- (void)endScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSDate *scrubDate;
  void *v9;
  id WeakRetained;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  v6 = a4;
  v7 = v6;
  if (self->_transitioningBetweenLiveAndScrubbing)
  {
    if (v6)
      (*((void (**)(id))v6 + 2))(v6);
  }
  else
  {
    -[NTKFaceView _resetSequencerBoundaries](self, "_resetSequencerBoundaries");
    scrubDate = self->_scrubDate;
    self->_scrubDate = 0;

    self->_transitioningBetweenLiveAndScrubbing = 1;
    self->_timeScrubbing = 0;
    self->_wasScrubbingAtStartOfTransition = 1;
    -[NTKFaceView delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "faceViewWillExitTimeTravel");

    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __51__NTKFaceView_endScrubbingAnimated_withCompletion___block_invoke;
    v11[3] = &unk_1E6BD1890;
    objc_copyWeak(&v13, &location);
    v12 = v7;
    -[NTKFaceView _endScrubbingAnimated:withCompletion:](self, "_endScrubbingAnimated:withCompletion:", v4, v11);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "faceViewDidScrubToDate:forced:", 0, 1);

    -[NTKFaceView applyRubberBandingFraction:forCustomEditMode:slot:](self, "applyRubberBandingFraction:forCustomEditMode:slot:", 0, 0, 0.0);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __51__NTKFaceView_endScrubbingAnimated_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
    *((_BYTE *)WeakRetained + 441) = 0;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)_endScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)_enableCrown
{
  -[NTKFaceView enableCrownEventReception](self, "enableCrownEventReception");
  self->_canHandleHardwareEvents = 1;
}

- (void)_disableCrown
{
  -[NTKFaceView disableCrownEventReception](self, "disableCrownEventReception");
  self->_canHandleHardwareEvents = 0;
}

- (void)enableCrownEventReception
{
  NSObject *v3;
  NSUUID *v4;
  NSUUID *crownAssertionToken;
  int v6;
  NTKFaceView *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "[CROWN] Face %@ taking crown assertion", (uint8_t *)&v6, 0xCu);
  }

  -[NTKCrownAssertionHandler takeCrownAssertionForToken:](self->_crownHandler, "takeCrownAssertionForToken:", self->_crownAssertionToken);
  v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  crownAssertionToken = self->_crownAssertionToken;
  self->_crownAssertionToken = v4;

}

- (void)disableCrownEventReception
{
  NSObject *v3;
  NSUUID *crownAssertionToken;
  int v5;
  NTKFaceView *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_crownAssertionToken)
  {
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = self;
      _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "Face %@ releasing crown assertion", (uint8_t *)&v5, 0xCu);
    }

    -[NTKCrownAssertionHandler relinquishCrownAssertionForToken:](self->_crownHandler, "relinquishCrownAssertionForToken:", self->_crownAssertionToken);
    crownAssertionToken = self->_crownAssertionToken;
    self->_crownAssertionToken = 0;

  }
}

- (BOOL)_wheelChangedWithEvent:(id)a3
{
  return 0;
}

- (BOOL)_handlePhysicalButton:(unint64_t)a3 event:(unint64_t)a4
{
  return 0;
}

- (id)_allViewsWithComplicationEditingDesaturationFilter
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableDictionary *complicationDisplayWrappers;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  if (!-[NTKFaceView _wantsDimWithDesaturationFilterDuringComplicationEditing](self, "_wantsDimWithDesaturationFilterDuringComplicationEditing"))return MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceView timeView](self, "timeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NTKFaceView timeView](self, "timeView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  complicationDisplayWrappers = self->_complicationDisplayWrappers;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__NTKFaceView__allViewsWithComplicationEditingDesaturationFilter__block_invoke;
  v11[3] = &unk_1E6BD9928;
  v7 = v3;
  v12 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](complicationDisplayWrappers, "enumerateKeysAndObjectsUsingBlock:", v11);
  -[NTKFaceView _additonalViewsToApplyDesaturationDuringComplicationEditing](self, "_additonalViewsToApplyDesaturationDuringComplicationEditing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v7, "addObjectsFromArray:", v8);
  v9 = v7;

  return v9;
}

uint64_t __65__NTKFaceView__allViewsWithComplicationEditingDesaturationFilter__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (void)_addSaturationFilterToViews:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CAFilter *complicationEditingSaturationFilter;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v3)
  {
    v4 = v3;
    v22 = *(_QWORD *)v28;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v5);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v6, "layer");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "filters");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v24;
LABEL_8:
          v12 = 0;
          while (1)
          {
            if (*(_QWORD *)v24 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v12), "name");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("EditingSaturationFilter"));

            if ((v14 & 1) != 0)
              break;
            if (v10 == ++v12)
            {
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
              if (v10)
                goto LABEL_8;
              goto LABEL_14;
            }
          }
        }
        else
        {
LABEL_14:

          objc_msgSend(v6, "layer");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "filters");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v6, "layer");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "filters");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = (void *)objc_msgSend(v18, "mutableCopy");

            objc_msgSend(v8, "addObject:", self->_complicationEditingSaturationFilter);
          }
          else
          {
            complicationEditingSaturationFilter = self->_complicationEditingSaturationFilter;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &complicationEditingSaturationFilter, 1);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v6, "layer");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setFilters:", v8);

        }
        ++v5;
      }
      while (v5 != v4);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v4);
  }

}

- (void)_updateSaturationForComplicationEditing
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[NTKFaceView _allViewsWithComplicationEditingDesaturationFilter](self, "_allViewsWithComplicationEditingDesaturationFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceView _addSaturationFilterToViews:](self, "_addSaturationFilterToViews:", v3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("filters.%@.inputAmount"), CFSTR("EditingSaturationFilter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceView selectedComplicationSlot](self, "selectedComplicationSlot");
  v5 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v5;
  if (v5)
  {
    -[NTKFaceView normalComplicationDisplayWrapperForSlot:](self, "normalComplicationDisplayWrapperForSlot:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (v12 == v6)
        {
          objc_msgSend(v6, "layer");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setValue:forKeyPath:", &unk_1E6CA59F8, v4);
        }
        else
        {
          objc_msgSend(v12, "layer");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v14 = self->_complicationEditingSaturationValue;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setValue:forKeyPath:", v15, v4);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

}

- (void)_setComplicationEditingSaturationValue:(float)a3
{
  self->_complicationEditingSaturationValue = a3;
  -[NTKFaceView _updateSaturationForComplicationEditing](self, "_updateSaturationForComplicationEditing");
}

+ (int64_t)numberOfDetailModesForFaceStyle:(int64_t)a3
{
  return 0;
}

- (id)_additionalPrelaunchApplicationIdentifiers
{
  return 0;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  -[NTKFaceView device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = NTKShowGossamerUI(v7);

  if ((v8 & 1) != 0
    || !-[NTKFaceView _useAlternateComplicationColorForGraphicCircularComplicationInView:](self, "_useAlternateComplicationColorForGraphicCircularComplicationInView:", v6))
  {
    -[NTKFaceView alternateComplicationColor](self, "alternateComplicationColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceView complicationColor](self, "complicationColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceView complicationBackgroundColor](self, "complicationBackgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CLKUIMonochromeFiltersForStyleWithTintedBackground();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NTKFaceView complicationColor](self, "complicationColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceView alternateComplicationColor](self, "alternateComplicationColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CLKUIMonochromeFiltersForStyle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  -[NTKFaceView device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = NTKShowGossamerUI(v6);

  if ((v7 & 1) != 0
    || !-[NTKFaceView _useAlternateComplicationColorForGraphicCircularComplicationInView:](self, "_useAlternateComplicationColorForGraphicCircularComplicationInView:", v5))
  {
    -[NTKFaceView alternateComplicationColor](self, "alternateComplicationColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceView interpolatedComplicationColor](self, "interpolatedComplicationColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceView complicationBackgroundColor](self, "complicationBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CLKUIMonochromeFiltersForStyleWithTintedBackground();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NTKFaceView interpolatedComplicationColor](self, "interpolatedComplicationColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceView alternateComplicationColor](self, "alternateComplicationColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CLKUIMonochromeFiltersForStyle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  void *v6;
  void *v7;
  void *v8;

  -[NTKFaceView alternateComplicationColor](self, "alternateComplicationColor", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceView complicationColor](self, "complicationColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NTKMonochromeFilterForStyle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)filterForView:(id)a3 style:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[NTKFaceView alternateComplicationColor](self, "alternateComplicationColor", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceView interpolatedComplicationColor](self, "interpolatedComplicationColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NTKMonochromeFilterForStyle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)colorForView:(id)a3 accented:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  -[NTKFaceView device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = NTKShowGossamerUI(v7);

  if ((v8 & 1) != 0
    || !-[NTKFaceView _useAlternateComplicationColorForGraphicCircularComplicationInView:](self, "_useAlternateComplicationColorForGraphicCircularComplicationInView:", v6))
  {
    if (v4)
      goto LABEL_4;
LABEL_6:
    -[NTKFaceView alternateComplicationColor](self, "alternateComplicationColor");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v4)
    goto LABEL_6;
LABEL_4:
  -[NTKFaceView complicationColor](self, "complicationColor");
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v10 = (void *)v9;

  return v10;
}

- (id)interpolatedColorForView:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  -[NTKFaceView device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = NTKShowGossamerUI(v5);

  if ((v6 & 1) != 0
    || !-[NTKFaceView _useAlternateComplicationColorForGraphicCircularComplicationInView:](self, "_useAlternateComplicationColorForGraphicCircularComplicationInView:", v4))
  {
    -[NTKFaceView interpolatedComplicationColor](self, "interpolatedComplicationColor");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NTKFaceView alternateComplicationColor](self, "alternateComplicationColor");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

- (id)backgroundColorForView:(id)a3
{
  return 0;
}

- (void)changeComplicationsAlpha:(double)a3
{
  id v4;

  -[NTKFaceView complicationContainerView](self, "complicationContainerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", a3);

}

- (id)createFaceColorPalette
{
  void *v2;
  void *v3;

  -[NTKFaceView delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "faceViewWantsFaceColorPalette");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)pigmentFromOption:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1F8E91518))
  {
    objc_msgSend(v3, "pigmentEditOption");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_updateFaceColorPaletteWithOption:(id)a3 mode:(int64_t)a4
{
  void *v6;
  void *v7;
  NTKInterpolatedColorPalette *interpolatedColorPalette;
  id v9;

  v9 = a3;
  -[NTKFaceView faceColorPalette](self, "faceColorPalette");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 == 10 && v6)
  {
    objc_msgSend((id)objc_opt_class(), "pigmentFromOption:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceColorPalette setPigmentEditOption:](self->_faceColorPalette, "setPigmentEditOption:", v7);
    interpolatedColorPalette = self->_interpolatedColorPalette;
    if (interpolatedColorPalette)
    {
      -[NTKInterpolatedColorPalette setFromPalette:](interpolatedColorPalette, "setFromPalette:", self->_faceColorPalette);
      -[NTKInterpolatedColorPalette setToPalette:](self->_interpolatedColorPalette, "setToPalette:", self->_faceColorPalette);
    }

  }
}

- (NTKFaceColorPalette)faceColorPalette
{
  NTKFaceColorPalette *faceColorPalette;
  NTKFaceColorPalette *v4;
  NTKFaceColorPalette *v5;
  void *v6;
  void *v7;

  faceColorPalette = self->_faceColorPalette;
  if (!faceColorPalette)
  {
    -[NTKFaceView createFaceColorPalette](self, "createFaceColorPalette");
    v4 = (NTKFaceColorPalette *)objc_claimAutoreleasedReturnValue();
    v5 = self->_faceColorPalette;
    self->_faceColorPalette = v4;

    if (self->_faceColorPalette)
    {
      -[NTKFaceView optionForCustomEditMode:slot:](self, "optionForCustomEditMode:slot:", 10, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend((id)objc_opt_class(), "pigmentFromOption:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKFaceColorPalette setPigmentEditOption:](self->_faceColorPalette, "setPigmentEditOption:", v7);

      }
      faceColorPalette = self->_faceColorPalette;
    }
    else
    {
      faceColorPalette = 0;
    }
  }
  return faceColorPalette;
}

- (NTKInterpolatedColorPalette)interpolatedColorPalette
{
  void *v3;
  NTKInterpolatedColorPalette *v4;
  void *v5;
  NTKInterpolatedColorPalette *v6;
  NTKInterpolatedColorPalette *interpolatedColorPalette;

  if (!self->_interpolatedColorPalette)
  {
    -[NTKFaceView faceColorPalette](self, "faceColorPalette");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = [NTKInterpolatedColorPalette alloc];
      -[NTKFaceView faceColorPalette](self, "faceColorPalette");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[NTKInterpolatedColorPalette initWithColorPalette:](v4, "initWithColorPalette:", v5);
      interpolatedColorPalette = self->_interpolatedColorPalette;
      self->_interpolatedColorPalette = v6;

    }
  }
  return self->_interpolatedColorPalette;
}

- (BOOL)allowsHomeScreenTransition
{
  return 1;
}

- (UIView)foregroundContainerView
{
  return &self->_foregroundContainerView->super;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UIView)complicationContainerView
{
  return self->_complicationContainerView;
}

- (void)setComplicationContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_complicationContainerView, a3);
}

- (UIView)rootContainerView
{
  return self->_rootContainerView;
}

- (void)setRootContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_rootContainerView, a3);
}

- (UIColor)alternateComplicationColor
{
  return self->_alternateComplicationColor;
}

- (void)setAlternateComplicationColor:(id)a3
{
  objc_storeStrong((id *)&self->_alternateComplicationColor, a3);
}

- (UIColor)complicationColor
{
  return self->_complicationColor;
}

- (void)setComplicationColor:(id)a3
{
  objc_storeStrong((id *)&self->_complicationColor, a3);
}

- (UIColor)interpolatedComplicationColor
{
  return self->_interpolatedComplicationColor;
}

- (void)setInterpolatedComplicationColor:(id)a3
{
  objc_storeStrong((id *)&self->_interpolatedComplicationColor, a3);
}

- (UIColor)complicationBackgroundColor
{
  return self->_complicationBackgroundColor;
}

- (void)setComplicationBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_complicationBackgroundColor, a3);
}

- (int64_t)faceStyle
{
  return self->_faceStyle;
}

- (CLKDevice)device
{
  return self->_device;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 760);
}

- (BOOL)shouldShowUnsnapshotableContent
{
  return self->_shouldShowUnsnapshotableContent;
}

- (int64_t)dataMode
{
  return self->_dataMode;
}

- (BOOL)showsCanonicalContent
{
  return self->_showsCanonicalContent;
}

- (BOOL)showContentForUnadornedSnapshot
{
  return self->_showContentForUnadornedSnapshot;
}

- (BOOL)showsLockedUI
{
  return self->_showsLockedUI;
}

- (NTKFaceViewDelegate)delegate
{
  return (NTKFaceViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)unadornedSnapshotView
{
  return self->_unadornedSnapshotView;
}

- (void)setUnadornedSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->_unadornedSnapshotView, a3);
}

- (UIImageView)switcherSnapshotView
{
  return self->_switcherSnapshotView;
}

- (BOOL)zooming
{
  return self->_zooming;
}

- (NTKFaceViewComplicationFactory)complicationFactory
{
  return self->_complicationFactory;
}

- (void)setComplicationFactory:(id)a3
{
  objc_storeStrong((id *)&self->_complicationFactory, a3);
}

- (NSString)resourceDirectory
{
  return self->_resourceDirectory;
}

- (BOOL)isEveryComplicationHidden
{
  return self->_everyComplicationHidden;
}

- (void)setEveryComplicationHidden:(BOOL)a3
{
  self->_everyComplicationHidden = a3;
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (BOOL)isSlow
{
  return self->_slow;
}

- (BOOL)orbing
{
  return self->_orbing;
}

- (BOOL)complicationsShowEditingContent
{
  return self->_complicationsShowEditingContent;
}

- (NSMutableDictionary)editConfigurations
{
  return self->_editConfigurations;
}

- (void)setEditConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_editConfigurations, a3);
}

- (NSString)selectedComplicationSlot
{
  return self->_selectedComplicationSlot;
}

- (BOOL)timeScrubbing
{
  return self->_timeScrubbing;
}

- (int64_t)detailMode
{
  return self->_detailMode;
}

- (void)setDetailMode:(int64_t)a3
{
  self->_detailMode = a3;
}

- (NTKTimeView)timeView
{
  return self->_timeView;
}

- (BOOL)editing
{
  return self->_editing;
}

- (int64_t)fromEditMode
{
  return self->_fromEditMode;
}

- (int64_t)toEditMode
{
  return self->_toEditMode;
}

- (double)editModeTransitionFraction
{
  return self->_editModeTransitionFraction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeView, 0);
  objc_storeStrong((id *)&self->_selectedComplicationSlot, 0);
  objc_storeStrong((id *)&self->_resourceDirectory, 0);
  objc_storeStrong((id *)&self->_complicationFactory, 0);
  objc_storeStrong((id *)&self->_switcherSnapshotView, 0);
  objc_storeStrong((id *)&self->_unadornedSnapshotView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_complicationBackgroundColor, 0);
  objc_storeStrong((id *)&self->_interpolatedComplicationColor, 0);
  objc_storeStrong((id *)&self->_complicationColor, 0);
  objc_storeStrong((id *)&self->_alternateComplicationColor, 0);
  objc_storeStrong((id *)&self->_rootContainerView, 0);
  objc_storeStrong((id *)&self->_complicationContainerView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_cornerOverlayView, 0);
  objc_storeStrong((id *)&self->_complicationEditingSaturationFilter, 0);
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_foregroundContainerView, 0);
  objc_storeStrong((id *)&self->_hiddenComplicationSlots, 0);
  objc_storeStrong((id *)&self->_editConfigurations, 0);
  objc_storeStrong((id *)&self->_complicationLayouts, 0);
  objc_storeStrong((id *)&self->_complicationDisplayWrappers, 0);
  objc_storeStrong((id *)&self->_crownAssertionToken, 0);
  objc_storeStrong((id *)&self->_crownHandler, 0);
  objc_storeStrong((id *)&self->_allSubQuadViews, 0);
  objc_storeStrong((id *)&self->_interpolatedColorPalette, 0);
  objc_storeStrong((id *)&self->_faceColorPalette, 0);
  objc_storeStrong((id *)&self->_sensitiveUIShieldView, 0);
  objc_storeStrong((id *)&self->_analyticsTimeTravelSessionStart, 0);
  objc_storeStrong((id *)&self->_crownIdleTimer, 0);
  objc_storeStrong((id *)&self->_tomorrowEnd, 0);
  objc_storeStrong((id *)&self->_yesterdayStart, 0);
  objc_storeStrong((id *)&self->_scrubDate, 0);
  objc_storeStrong((id *)&self->_timeTravelEnterDate, 0);
  objc_storeStrong((id *)&self->_fastCrownModeTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_accumulateTimeTravelEntryRotationTimeoutTimer, 0);
}

- (void)renderIfNeeded
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 134218496;
  v4 = objc_msgSend(a1, "dataMode");
  v5 = 1024;
  v6 = NTKIsScreenOn();
  v7 = 1024;
  v8 = NTKIsDaemonOrFaceSnapshotService();
  _os_log_debug_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_DEBUG, "renderWasIgnored dataMode:%ld NTKIsScreenOn:%d NTKIsDaemonOrFaceSnapshotService:%d)", (uint8_t *)&v3, 0x18u);
}

@end
