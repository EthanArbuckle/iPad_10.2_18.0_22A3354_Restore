@implementation NTKUpNextFaceView

+ (double)suggestedCellHeightForDevice:(id)a3
{
  _BYTE v4[136];
  double v5;

  _LayoutConstants_0(a3, v4);
  return v5;
}

- (NTKUpNextFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8;
  id v9;
  NTKUpNextFaceView *v10;
  NTKUpNextFaceView *v11;
  uint64_t v12;
  NSSet *dwellIndexPathes;
  uint64_t v14;
  NSMutableSet *reloadedElements;
  NTKUtilityComplicationFactory *v16;
  NTKUtilityComplicationFactory *utilityComplicationFactory;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  REUpNextScheduler *applicationIdentifierUpdateScheduler;
  id v23;
  double Width;
  uint64_t v25;
  UIView *scalableView;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v35;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t);
  void *v40;
  id v41;
  id location;
  objc_super v43;
  CGRect v44;
  CGRect v45;

  v8 = a4;
  v9 = a5;
  v43.receiver = self;
  v43.super_class = (Class)NTKUpNextFaceView;
  v10 = -[NTKFaceView initWithFaceStyle:forDevice:clientIdentifier:](&v43, sel_initWithFaceStyle_forDevice_clientIdentifier_, a3, v8, v9);
  v11 = v10;
  if (v10)
  {
    v10->_interactiveState = 0;
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    dwellIndexPathes = v11->_dwellIndexPathes;
    v11->_dwellIndexPathes = (NSSet *)v12;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    reloadedElements = v11->_reloadedElements;
    v11->_reloadedElements = (NSMutableSet *)v14;

    v16 = -[NTKUtilityComplicationFactory initForDevice:]([NTKUtilityComplicationFactory alloc], "initForDevice:", v8);
    utilityComplicationFactory = v11->_utilityComplicationFactory;
    v11->_utilityComplicationFactory = v16;

    -[NTKUtilityComplicationFactory setForegroundAlpha:](v11->_utilityComplicationFactory, "setForegroundAlpha:", 1.0);
    -[NTKUtilityComplicationFactory setForegroundImageAlpha:](v11->_utilityComplicationFactory, "setForegroundImageAlpha:", 1.0);
    -[NTKUpNextFaceView setClipsToBounds:](v11, "setClipsToBounds:", 1);
    -[NTKUpNextFaceView _setSiriBlurColor](v11, "_setSiriBlurColor");
    objc_initWeak(&location, v11);
    v18 = (void *)MEMORY[0x1E0D84398];
    v19 = MEMORY[0x1E0C80D38];
    v20 = MEMORY[0x1E0C80D38];
    v37 = MEMORY[0x1E0C809B0];
    v38 = 3221225472;
    v39 = __66__NTKUpNextFaceView_initWithFaceStyle_forDevice_clientIdentifier___block_invoke;
    v40 = &unk_1E6BCD7F0;
    objc_copyWeak(&v41, &location);
    objc_msgSend(v18, "schedulerWithQueue:updateBlock:", v19, &v37);
    v21 = objc_claimAutoreleasedReturnValue();
    applicationIdentifierUpdateScheduler = v11->_applicationIdentifierUpdateScheduler;
    v11->_applicationIdentifierUpdateScheduler = (REUpNextScheduler *)v21;

    v23 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[NTKUpNextFaceView bounds](v11, "bounds", v37, v38, v39, v40);
    Width = CGRectGetWidth(v44);
    -[NTKUpNextFaceView bounds](v11, "bounds");
    v25 = objc_msgSend(v23, "initWithFrame:", 0.0, 0.0, Width, CGRectGetHeight(v45));
    scalableView = v11->_scalableView;
    v11->_scalableView = (UIView *)v25;

    -[UIView setAutoresizingMask:](v11->_scalableView, "setAutoresizingMask:", 18);
    -[NTKFaceView contentView](v11, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSubview:", v11->_scalableView);

    -[UIView setOpaque:](v11->_scalableView, "setOpaque:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v11->_scalableView, "setBackgroundColor:", v28);

    -[NTKUpNextFaceView _updateCrownInvertedSetting](v11, "_updateCrownInvertedSetting");
    objc_msgSend(MEMORY[0x1E0C94518], "sharedMonitor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSensitiveUIObserver:", v11);

    -[NTKFaceView device](v11, "device");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "deviceCategory");

    if (v31 != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObserver:selector:name:object:", v11, sel_updateTimeLabelBackground, *MEMORY[0x1E0DC45B8], 0);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObserver:selector:name:object:", v11, sel__availableDataSourcesDidChange, *MEMORY[0x1E0D843A8], 0);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v11, (CFNotificationCallback)_updateDisabledDataSources, CFSTR("com.apple.NanoTimeKit.NPS.NTKSiriDefaultsDisabledDataSourcesDidChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v35 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v35, v11, (CFNotificationCallback)_thirdPartyDataSourcesDidChange, CFSTR("com.apple.NanoTimeKit.NPS.NTKSiriDefaultsThirdPartyDataSourcesDidChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __66__NTKUpNextFaceView_initWithFaceStyle_forDevice_clientIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateApplicationIdentifiersAndLocationAuthorization");

}

- (void)_showSiriUnavailableAlert:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = -[NTKFaceView dataMode](self, "dataMode") == 1;
  v5 = v8;
  if (v4)
  {
    objc_msgSend(v8, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NTKFaceView delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "faceViewWantsToPresentViewController:", v6);

    }
    v5 = v8;
  }

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v10;

  objc_msgSend(MEMORY[0x1E0C94518], "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeSensitiveUIObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("NTKUpNextRelevanceEngineCacheDidUpdateEngine"), 0);

  -[NTKFaceView device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "deviceCategory");

  if (v6 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x1E0DC45B8], 0);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:name:object:", self, *MEMORY[0x1E0D843A8], 0);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, 0, 0);
  v10.receiver = self;
  v10.super_class = (Class)NTKUpNextFaceView;
  -[NTKFaceView dealloc](&v10, sel_dealloc);
}

- (void)screenWillTurnOnAnimated:(BOOL)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__NTKUpNextFaceView_screenWillTurnOnAnimated___block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __46__NTKUpNextFaceView_screenWillTurnOnAnimated___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1049) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_startPositiveDwellForTopElementsTimerIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "_updateVisibilityForCells");
}

- (void)screenDidTurnOffAnimated:(BOOL)a3
{
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD block[5];

  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__NTKUpNextFaceView_screenDidTurnOffAnimated___block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  if (!a3)
  {
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __46__NTKUpNextFaceView_screenDidTurnOffAnimated___block_invoke_2;
    v7[3] = &unk_1E6BCD5F0;
    v7[4] = self;
    v6 = (void *)MEMORY[0x1E0C80D38];
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

uint64_t __46__NTKUpNextFaceView_screenDidTurnOffAnimated___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1049) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_resetVisibilityForCells");
  return objc_msgSend(*(id *)(a1 + 32), "_updateVisibilityForCells");
}

uint64_t __46__NTKUpNextFaceView_screenDidTurnOffAnimated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_dismissPresentedViewControllerIfNecessary:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_switchViewModeToDefault");
  return objc_msgSend(*(id *)(a1 + 32), "_stopPositiveDwellForTopElementsTimer");
}

- (void)_loadEngineController
{
  -[NTKUpNextFaceView _loadSnapshotContent:](self, "_loadSnapshotContent:", &__block_literal_global_73);
}

void __42__NTKUpNextFaceView__loadEngineController__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B72A3000, v0, OS_LOG_TYPE_DEFAULT, "Loaded 'engine' content", v1, 2u);
  }

}

- (void)layoutSubviews
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  void *v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  CGFloat v16;
  uint64_t v17;
  _BYTE v18[240];
  double v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  if (!-[NTKFaceView zooming](self, "zooming") && !self->_isAnimating)
  {
    v20.receiver = self;
    v20.super_class = (Class)NTKUpNextFaceView;
    -[NTKDigitalFaceView layoutSubviews](&v20, sel_layoutSubviews);
    -[NTKUpNextFaceView _layoutTimeLabelForViewMode:](self, "_layoutTimeLabelForViewMode:", -[NTKDigitalFaceView viewMode](self, "viewMode"));
    -[NTKUpNextFaceView _layoutTimeLabelPlatterViewMode:](self, "_layoutTimeLabelPlatterViewMode:", -[NTKDigitalFaceView viewMode](self, "viewMode"));
    -[UIView bounds](self->_scalableView, "bounds");
    x = v3;
    y = v5;
    width = v7;
    height = v9;
    -[NTKFaceView device](self, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_0(v11, v18);
    v12 = v19;

    if (v12 > 0.0)
    {
      v13 = v12 * 0.5;
      v21.origin.x = x;
      v21.origin.y = y;
      v21.size.width = width;
      v21.size.height = height;
      v22 = CGRectInset(v21, 0.0, v13);
      v23 = CGRectOffset(v22, 0.0, v13);
      x = v23.origin.x;
      y = v23.origin.y;
      width = v23.size.width;
      height = v23.size.height;
    }
    -[NTKFaceView device](self, "device");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_0(v14, &v17);
    -[NTKUpNextFaceView bounds](self, "bounds");
    CGRectGetWidth(v24);
    CLKRoundForDevice();
    v16 = v15;
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    v26 = CGRectInset(v25, v16, 0.0);
    -[NTKUpNextCollectionView setFrame:](self->_collectionView, "setFrame:", v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  NTKDigitalTimeLabelStyle *timeLabelDefaultStyle;
  id v5;
  NTKDigitalTimeLabelStyle *timeLabelSmallInUpperRightCornerStyle;
  objc_super v7;

  timeLabelDefaultStyle = self->_timeLabelDefaultStyle;
  self->_timeLabelDefaultStyle = 0;
  v5 = a3;

  timeLabelSmallInUpperRightCornerStyle = self->_timeLabelSmallInUpperRightCornerStyle;
  self->_timeLabelSmallInUpperRightCornerStyle = 0;

  v7.receiver = self;
  v7.super_class = (Class)NTKUpNextFaceView;
  -[NTKUpNextFaceView traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v5);

}

- (id)_detachedComplicationDisplays
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[REUIRelevanceEngineController engine](self->_engineController, "engine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSourceCatalog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__NTKUpNextFaceView__detachedComplicationDisplays__block_invoke;
  v8[3] = &unk_1E6BCDD68;
  v6 = v3;
  v9 = v6;
  objc_msgSend(v5, "enumerateDataSources:", v8);

  return v6;
}

void __50__NTKUpNextFaceView__detachedComplicationDisplays__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "complicationDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  id v8;
  id v9;
  id v10;
  objc_super v12;

  v8 = a5;
  v9 = a3;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("top-right")))
  {
    v10 = -[NTKUtilityComplicationFactory newViewForComplication:family:forSlot:](self->_utilityComplicationFactory, "newViewForComplication:family:forSlot:", v9, a4, 13);

    -[NTKUpNextFaceView _configureComplicationView:forSlot:](self, "_configureComplicationView:forSlot:", v10, v8);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)NTKUpNextFaceView;
    v10 = -[NTKFaceView _newLegacyViewForComplication:family:slot:](&v12, sel__newLegacyViewForComplication_family_slot_, v9, a4, v8);

  }
  return v10;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _BYTE v19[48];
  double v20;

  v18 = a3;
  v6 = a4;
  -[NTKFaceView faceColorPalette](self, "faceColorPalette");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKPigmentEditOption pigmentNamed:](NTKPigmentEditOption, "pigmentNamed:", CFSTR("special.multicolor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "copyWithOption:", v8);

  LODWORD(v7) = objc_msgSend(v6, "isEqualToString:", CFSTR("top-right"));
  if ((_DWORD)v7)
  {
    v10 = *MEMORY[0x1E0DC1420];
    v11 = v18;
    objc_msgSend(v11, "setFontWeight:", v10);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setForegroundColor:", v12);

    objc_msgSend(v11, "setShadowColor:", 0);
    objc_msgSend(v11, "setForegroundAlpha:", 1.0);
    objc_msgSend(v11, "setForegroundImageAlpha:", 1.0);
    objc_msgSend(v11, "setUsesLegibility:", 0);
    objc_msgSend(v11, "setPlacement:", +[NTKUtilityComplicationFactory placementForSlot:](NTKUtilityComplicationFactory, "placementForSlot:", 5));
    objc_msgSend(v11, "setSuppressesInternalColorOverrides:", 1);
    objc_msgSend(v11, "setHidden:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v13);
LABEL_5:

    objc_msgSend(v18, "applyFaceColorPalette:units:", v9, 1095);
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = (void *)MEMORY[0x1E0DC3658];
    v15 = v18;
    objc_msgSend(v14, "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v16);

    -[NTKFaceView device](self, "device");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_0(v17, v19);
    objc_msgSend(v15, "setContentHeight:", v20);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setForegroundColor:", v13);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_reloadContentIfNeeded
{
  NSObject *v3;
  _BOOL4 needsReloadedContent;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_engineInitiallyLoaded
    && (!NTKIsDaemonOrFaceSnapshotService() || self->_engineInitiallyLoaded))
  {
    _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      needsReloadedContent = self->_needsReloadedContent;
      *(_DWORD *)buf = 67109120;
      v9 = needsReloadedContent;
      _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "[datasource] requested full reload with (_needsReloadedContent=%d)", buf, 8u);
    }

    if (self->_isApplyingSnapshot)
    {
      _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "[datasource] deferring full reload to completion block of current reload", buf, 2u);
      }

    }
    else if (self->_needsReloadedContent)
    {
      _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "[datasource] non-animated reload being performed", buf, 2u);
      }

      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __43__NTKUpNextFaceView__reloadContentIfNeeded__block_invoke;
      v7[3] = &unk_1E6BCD5F0;
      v7[4] = self;
      -[NTKUpNextFaceView updateCollectionViewSnapshotAnimated:completion:](self, "updateCollectionViewSnapshotAnimated:completion:", 0, v7);
    }
  }
}

uint64_t __43__NTKUpNextFaceView__reloadContentIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 896), "layoutIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "schedule");
  result = objc_msgSend(*(id *)(a1 + 32), "viewMode");
  if (!result)
    result = objc_msgSend(*(id *)(a1 + 32), "_switchViewModeToDefault");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1040) = 0;
  return result;
}

- (double)_verticalPaddingForStatusBar
{
  return 0.0;
}

- (BOOL)_needsForegroundContainerView
{
  return 1;
}

- (void)_loadSnapshotContentViews
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKUpNextFaceView;
  -[NTKDigitalFaceView _loadSnapshotContentViews](&v4, sel__loadSnapshotContentViews);
  -[NTKUpNextFaceView _loadEngineController](self, "_loadEngineController");
  -[NTKUpNextFaceView _loadContentViews](self, "_loadContentViews");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__NTKUpNextFaceView__loadSnapshotContentViews__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __46__NTKUpNextFaceView__loadSnapshotContentViews__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "viewMode");
  if (!result)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 896), "layoutIfNeeded");
    return objc_msgSend(*(id *)(a1 + 32), "_switchViewModeToDefault");
  }
  return result;
}

- (void)_loadContentViews
{
  void *v3;
  NTKUpNextCollectionViewFlowLayout *v4;
  NTKUpNextCollectionViewFlowLayout *layout;
  NTKUpNextCollectionViewFlowLayout *v6;
  NTKUpNextCollectionViewFlowLayout *v7;
  void *v8;
  NTKUpNextCollectionViewFlowLayout *v9;
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
  NTKUpNextCollectionView *v20;
  NTKUpNextCollectionView *collectionView;
  NTKUpNextCollectionView *v22;
  void *v23;
  void *v24;
  void *v25;
  NTKUpNextCollectionViewFlowLayout *v26;
  id v27;
  UIView *v28;
  UIView *timeLabelPlatter;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  UITapGestureRecognizer *v38;
  UITapGestureRecognizer *viewModeTapGesture;
  _OWORD v40[2];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  if (!self->_collectionView)
  {
    v55 = 0;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    memset(v40, 0, sizeof(v40));
    -[NTKFaceView device](self, "device");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_0(v3, v40);

    v4 = objc_alloc_init(NTKUpNextCollectionViewFlowLayout);
    layout = self->_layout;
    self->_layout = v4;

    -[UICollectionViewFlowLayout setScrollDirection:](self->_layout, "setScrollDirection:", 0);
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](self->_layout, "setMinimumLineSpacing:", *((double *)&v41 + 1));
    v6 = self->_layout;
    if (NTKUpNextDemoPrerenderAllCells_onceToken != -1)
      dispatch_once(&NTKUpNextDemoPrerenderAllCells_onceToken, &__block_literal_global_8);
    -[NTKUpNextCollectionViewFlowLayout setShowingAllAttributes:](v6, "setShowingAllAttributes:", NTKUpNextDemoPrerenderAllCells_prerenderAllCells != 0);
    v7 = self->_layout;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKUpNextCollectionViewFlowLayout setTopElementIndexPath:](v7, "setTopElementIndexPath:", v8);

    v9 = self->_layout;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 1, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKUpNextCollectionViewFlowLayout setBottomElementIndexPath:](v9, "setBottomElementIndexPath:", v10);

    -[NTKUpNextCollectionViewFlowLayout setTopOffsetForSnapping:](self->_layout, "setTopOffsetForSnapping:", *((double *)&v45 + 1));
    -[NTKUpNextCollectionViewFlowLayout setTopOffsetForScrolling:](self->_layout, "setTopOffsetForScrolling:", *((double *)&v43 + 1));
    -[NTKUpNextCollectionViewFlowLayout setStatusBarDecorationHeight:](self->_layout, "setStatusBarDecorationHeight:", *((double *)&v48 + 1));
    -[NTKUpNextCollectionViewFlowLayout setLowTransitionScale:](self->_layout, "setLowTransitionScale:", *((double *)&v49 + 1));
    -[NTKUpNextCollectionViewFlowLayout setHighTransitionScale:](self->_layout, "setHighTransitionScale:", *((double *)&v50 + 1));
    -[NTKUpNextCollectionViewFlowLayout setHighTransitionShift:](self->_layout, "setHighTransitionShift:", *((double *)&v51 + 1));
    -[NTKUpNextCollectionViewFlowLayout setLowTransitionShift:](self->_layout, "setLowTransitionShift:", *((double *)&v52 + 1));
    -[NTKUpNextCollectionViewFlowLayout setTopOffsetForScrolling:](self->_layout, "setTopOffsetForScrolling:", *(double *)&v44);
    -[NTKUpNextFaceView bounds](self, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    -[NTKUpNextFaceView bounds](self, "bounds");
    v19 = (CGRectGetWidth(v56) - *(double *)&v48) * 0.5;
    v57.origin.x = v12;
    v57.origin.y = v14;
    v57.size.width = v16;
    v57.size.height = v18;
    v58 = CGRectInset(v57, v19, 0.0);
    v20 = -[NTKUpNextCollectionView initWithFrame:collectionViewLayout:]([NTKUpNextCollectionView alloc], "initWithFrame:collectionViewLayout:", self->_layout, v58.origin.x, v58.origin.y, v58.size.width, v58.size.height);
    collectionView = self->_collectionView;
    self->_collectionView = v20;

    v22 = self->_collectionView;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKUpNextCollectionView setBackgroundColor:](v22, "setBackgroundColor:", v23);

    -[NTKUpNextCollectionView _setAutomaticContentOffsetAdjustmentEnabled:](self->_collectionView, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);
    -[NTKUpNextCollectionView layer](self->_collectionView, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAllowsGroupOpacity:", 1);

    -[NTKUpNextCollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
    -[NTKUpNextCollectionView setPrefetchingEnabled:](self->_collectionView, "setPrefetchingEnabled:", 0);
    -[NTKUpNextCollectionView setShowsVerticalScrollIndicator:](self->_collectionView, "setShowsVerticalScrollIndicator:", 0);
    -[NTKUpNextCollectionView setClipsToBounds:](self->_collectionView, "setClipsToBounds:", 0);
    -[NTKUpNextCollectionView _setResetsBoundingPathForSubtree:](self->_collectionView, "_setResetsBoundingPathForSubtree:", 0);
    -[NTKUpNextCollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("NTKUpNextLargeTextCellReuseIdentifier"));
    -[NTKUpNextCollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("NTKUpNextMultilineCellReuseIdentifier"));
    -[NTKUpNextCollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("NTKUpNextMatchupCellReuseIdentifier"));
    -[NTKUpNextCollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("NTKUpNextPhotoCellReuseIdentifier"));
    -[NTKUpNextCollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("NTKUpNextThumbnailCellReuseIdentifier"));
    -[NTKUpNextCollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("NTKUpNextLargeWithDetailTextCellReuseIdentifier"));
    -[NTKUpNextCollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](self->_collectionView, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0DC48A8], CFSTR("NTKUpNextHeaderReuseIdentifier"));
    -[NTKUpNextCollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("NTKUpNextGaugeCellReuseIdentifier"));
    -[NTKFaceView device](self, "device");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "deviceCategory");

    -[NTKUpNextCollectionViewFlowLayout registerClass:forDecorationViewOfKind:](self->_layout, "registerClass:forDecorationViewOfKind:", objc_opt_class(), CFSTR("NTKUpNextCollectionViewFlowLayoutStatusBarDecorationKind"));
    v26 = self->_layout;
    -[NTKUpNextCollectionView bounds](self->_collectionView, "bounds");
    -[UICollectionViewFlowLayout setItemSize:](v26, "setItemSize:", CGRectGetWidth(v59), *((double *)&v47 + 1));
    -[NTKUpNextCollectionView setDecelerationRate:](self->_collectionView, "setDecelerationRate:", *MEMORY[0x1E0DC5360]);
    -[UIView addSubview:](self->_scalableView, "addSubview:", self->_collectionView);
    -[NTKUpNextCollectionView setAlwaysBounceVertical:](self->_collectionView, "setAlwaysBounceVertical:", 1);
    -[NTKUpNextFaceView _configureCollectionViewDataSource](self, "_configureCollectionViewDataSource");
    -[NTKUpNextFaceView _reloadCollectionViewData](self, "_reloadCollectionViewData");
    v27 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v28 = (UIView *)objc_msgSend(v27, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    timeLabelPlatter = self->_timeLabelPlatter;
    self->_timeLabelPlatter = v28;

    -[UIView layer](self->_timeLabelPlatter, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setCornerRadius:", *(double *)v40);

    -[UIView layer](self->_timeLabelPlatter, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

    -[UIView layer](self->_timeLabelPlatter, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setMasksToBounds:", 1);

    -[NTKFaceView device](self, "device");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "deviceCategory");

    if (v34 == 1)
    {
      -[UIView layer](self->_timeLabelPlatter, "layer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "_externalSystemDarkGrayColor");
      v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v35, "setBackgroundColor:", objc_msgSend(v36, "CGColor"));

    }
    else
    {
      -[NTKUpNextFaceView updateTimeLabelBackground](self, "updateTimeLabelBackground");
    }
    -[UIView addSubview:](self->_scalableView, "addSubview:", self->_timeLabelPlatter);
    -[NTKFaceView timeView](self, "timeView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKUpNextFaceView addSubview:](self, "addSubview:", v37);

    v38 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleViewModeTapGesture_);
    viewModeTapGesture = self->_viewModeTapGesture;
    self->_viewModeTapGesture = v38;

    -[UITapGestureRecognizer setNumberOfTouchesRequired:](self->_viewModeTapGesture, "setNumberOfTouchesRequired:", 1);
    -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_viewModeTapGesture, "setNumberOfTapsRequired:", 1);
    -[UITapGestureRecognizer setEnabled:](self->_viewModeTapGesture, "setEnabled:", 1);
    -[UITapGestureRecognizer setCancelsTouchesInView:](self->_viewModeTapGesture, "setCancelsTouchesInView:", 0);
    -[UITapGestureRecognizer setDelegate:](self->_viewModeTapGesture, "setDelegate:", self);
    -[NTKUpNextFaceView addGestureRecognizer:](self, "addGestureRecognizer:", self->_viewModeTapGesture);
  }
}

- (void)_unloadSnapshotContentViews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKUpNextFaceView;
  -[NTKDigitalFaceView _unloadSnapshotContentViews](&v3, sel__unloadSnapshotContentViews);
  -[NTKUpNextFaceView _unloadContentViews](self, "_unloadContentViews");
}

- (void)_unloadContentViews
{
  NTKUpNextCollectionView *collectionView;
  NTKUpNextCollectionView *v4;
  UICollectionViewDiffableDataSource *collectionViewDataSource;
  NTKUpNextCollectionViewFlowLayout *layout;
  UIView *timeLabelPlatter;
  UITapGestureRecognizer *viewModeTapGesture;

  collectionView = self->_collectionView;
  if (collectionView)
  {
    -[NTKUpNextCollectionView removeFromSuperview](collectionView, "removeFromSuperview");
    v4 = self->_collectionView;
    self->_collectionView = 0;

    collectionViewDataSource = self->_collectionViewDataSource;
    self->_collectionViewDataSource = 0;

    layout = self->_layout;
    self->_layout = 0;

    -[UIView removeFromSuperview](self->_timeLabelPlatter, "removeFromSuperview");
    timeLabelPlatter = self->_timeLabelPlatter;
    self->_timeLabelPlatter = 0;

    -[NTKUpNextFaceView removeGestureRecognizer:](self, "removeGestureRecognizer:", self->_viewModeTapGesture);
    viewModeTapGesture = self->_viewModeTapGesture;
    self->_viewModeTapGesture = 0;

  }
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  double v6;
  double v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKUpNextFaceView;
  -[NTKDigitalFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v9, sel__configureForTransitionFraction_fromEditMode_toEditMode_);
  CLKInterpolateBetweenFloatsClipped();
  v7 = v6;
  -[NTKUpNextCollectionView setAlpha:](self->_collectionView, "setAlpha:");
  -[NTKFaceView timeView](self, "timeView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v7);

}

- (void)_switchViewModeToDefault
{
  -[NTKUpNextFaceView _defaultPointForDefaultMode](self, "_defaultPointForDefaultMode");
  -[NTKUpNextFaceView _setViewMode:scroll:scrollToPoint:secondaryPoint:force:velocity:animated:](self, "_setViewMode:scroll:scrollToPoint:secondaryPoint:force:velocity:animated:", 0, 1, 0, 0);
}

- (void)performScrollTestNamed:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  dispatch_time_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  -[NTKUpNextFaceView _setViewMode:scroll:scrollToPoint:secondaryPoint:force:velocity:animated:](self, "_setViewMode:scroll:scrollToPoint:secondaryPoint:force:velocity:animated:", 2, 0, 1, 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 0.0);
  -[NTKUpNextFaceView setNeedsLayout](self, "setNeedsLayout");
  -[NTKUpNextFaceView layoutIfNeeded](self, "layoutIfNeeded");
  objc_initWeak(&location, self);
  v8 = dispatch_time(0, 5000000000);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__NTKUpNextFaceView_performScrollTestNamed_completion___block_invoke;
  v11[3] = &unk_1E6BCDDB8;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  dispatch_after(v8, MEMORY[0x1E0C80D38], v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __55__NTKUpNextFaceView_performScrollTestNamed_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 112);
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "contentSize");
    v8 = (int)v7;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__NTKUpNextFaceView_performScrollTestNamed_completion___block_invoke_2;
    v10[3] = &unk_1E6BCDD90;
    objc_copyWeak(&v12, v2);
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v5, "_performScrollTest:iterations:delta:length:scrollAxis:extraResultsBlock:completionBlock:", v6, 2, 16, v8, 2, 0, v10);

    objc_destroyWeak(&v12);
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      (*(void (**)(void))(v9 + 16))();
  }

}

void __55__NTKUpNextFaceView_performScrollTestNamed_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_defaultPointForDefaultMode");
    objc_msgSend(v4, "_setViewMode:scroll:scrollToPoint:secondaryPoint:force:velocity:animated:", 0, 0, 1, 0);
    objc_msgSend(v4, "setNeedsLayout");
    objc_msgSend(v4, "layoutIfNeeded");
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(void))(v3 + 16))();

}

- (void)collectionViewDeferralStateChanged
{
  NSObject *v3;
  uint8_t v4[16];

  -[NTKUpNextFaceView _shouldDeferUpdate](self, "_shouldDeferUpdate");
  if (self->_needsReloadedContent)
  {
    _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "[datasource] applying a deferred reload", v4, 2u);
    }

    -[NTKUpNextFaceView _reloadContentIfNeeded](self, "_reloadContentIfNeeded");
  }
  else if (self->_hasDeferredUpdate)
  {
    self->_hasDeferredUpdate = 0;
    self->_needsReloadedContent = 1;
    -[NTKUpNextFaceView _reloadContentIfNeeded](self, "_reloadContentIfNeeded");
  }
}

- (void)_applyCollectionViewSnapshot:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  NTKUpNextCollectionViewFlowLayout *layout;
  void *v12;
  NTKUpNextCollectionViewFlowLayout *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint8_t v18[8];
  _QWORD aBlock[4];
  id v20;
  id v21;
  BOOL v22;
  id location;
  _BYTE v24[72];
  double v25;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (self->_collectionView)
  {
    if (!-[NTKDigitalFaceView viewMode](self, "viewMode"))
    {
      layout = self->_layout;
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKUpNextCollectionViewFlowLayout setIndexPathToSnapTo:](layout, "setIndexPathToSnapTo:", v12);

      v13 = self->_layout;
      -[NTKFaceView device](self, "device");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      _LayoutConstants_0(v14, v24);
      -[NTKUpNextCollectionViewFlowLayout setSnappingOffset:](v13, "setSnappingOffset:", -v25);

    }
    -[NTKUpNextFaceView _allowContentViewInteractive:](self, "_allowContentViewInteractive:", -[NTKDigitalFaceView viewMode](self, "viewMode") != 0);
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __70__NTKUpNextFaceView__applyCollectionViewSnapshot_animated_completion___block_invoke;
    aBlock[3] = &unk_1E6BCDDE0;
    v22 = v6;
    objc_copyWeak(&v21, &location);
    v20 = v10;
    v15 = _Block_copy(aBlock);
    _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1B72A3000, v16, OS_LOG_TYPE_DEFAULT, "[datasource] snapshot reload", v18, 2u);
    }

    -[UICollectionViewDiffableDataSource snapshot](self->_collectionViewDataSource, "snapshot");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKUpNextFaceView _logDataSourceSnapshot:withName:](self, "_logDataSourceSnapshot:withName:", v17, CFSTR("(old_snapshot)"));

    -[NTKUpNextFaceView _logDataSourceSnapshot:withName:](self, "_logDataSourceSnapshot:withName:", v8, CFSTR("(new_snapshot)"));
    self->_isApplyingSnapshot = 1;
    -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:completion:](self->_collectionViewDataSource, "applySnapshot:animatingDifferences:completion:", v8, v6, v15);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }

}

void __70__NTKUpNextFaceView__applyCollectionViewSnapshot_animated_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  id WeakRetained;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD block[5];
  uint8_t buf[4];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)buf = 67109120;
    v10 = v3;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "[datasource] reloaded collection view data (animated=%d)", buf, 8u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(*((id *)WeakRetained + 134), "schedule");
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      (*(void (**)(void))(v6 + 16))();
    v5[1042] = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__NTKUpNextFaceView__applyCollectionViewSnapshot_animated_completion___block_invoke_105;
    block[3] = &unk_1E6BCD5F0;
    block[4] = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      (*(void (**)(void))(v7 + 16))();
  }

}

uint64_t __70__NTKUpNextFaceView__applyCollectionViewSnapshot_animated_completion___block_invoke_105(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "collectionViewDeferralStateChanged");
}

- (BOOL)_snapshotHasChangesToVisibleItems:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UICollectionViewDiffableDataSource snapshot](self->_collectionViewDataSource, "snapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NTKUpNextCollectionView indexPathsForVisibleItems](self->_collectionView, "indexPathsForVisibleItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(obj);
        -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_collectionViewDataSource, "itemIdentifierForIndexPath:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v5, "indexOfItemIdentifier:", v10);
        v12 = objc_msgSend(v4, "indexOfItemIdentifier:", v10);

        if (v11 != v12)
        {
          v13 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (void)updateCollectionViewSnapshotAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSDiffableDataSourceSnapshot *snapshotSnapshot;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSMutableSet *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  id v35;
  id obj;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD block[5];
  id v54;
  BOOL v55;
  void *v56;
  _BYTE v57[128];
  void *v58;
  _BYTE v59[128];
  uint8_t v60[128];
  uint8_t buf[4];
  _BOOL4 v62;
  uint64_t v63;

  v4 = a3;
  v63 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[NTKUpNextFaceView updateCollectionViewSnapshotAnimated:completion:].cold.1(v10);

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__NTKUpNextFaceView_updateCollectionViewSnapshotAnimated_completion___block_invoke;
    block[3] = &unk_1E6BCDE08;
    block[4] = self;
    v55 = v4;
    v54 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v11 = v54;
    goto LABEL_37;
  }
  snapshotSnapshot = self->_snapshotSnapshot;
  _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!snapshotSnapshot)
  {
    v35 = v6;
    if (v9)
    {
      *(_DWORD *)buf = 67109120;
      v62 = v4;
      _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "[datasource] performing a reload of collection view data (animated=%d)", buf, 8u);
    }
    v34 = v4;

    -[REUIRelevanceEngineController generateDiffableSnapshot](self->_engineController, "generateDiffableSnapshot");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v13 = self->_reloadedElements;
    v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v50 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(v18, "element");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKey:", v19, v18);

        }
        v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
      }
      while (v15);
    }

    -[NSMutableSet removeAllObjects](self->_reloadedElements, "removeAllObjects");
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v12, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc_init(MEMORY[0x1E0DC3398]);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    objc_msgSend(v37, "sectionIdentifiers");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
    if (v39)
    {
      v38 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v39; ++j)
        {
          if (*(_QWORD *)v46 != v38)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
          if (NTKSectionForSectionIdentifier(v23) != -1)
          {
            v40 = j;
            v58 = v23;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "appendSectionsWithIdentifiers:", v24);

            v43 = 0u;
            v44 = 0u;
            v41 = 0u;
            v42 = 0u;
            objc_msgSend(v37, "itemIdentifiersInSectionWithIdentifier:", v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
            if (v26)
            {
              v27 = v26;
              v28 = *(_QWORD *)v42;
              do
              {
                for (k = 0; k != v27; ++k)
                {
                  if (*(_QWORD *)v42 != v28)
                    objc_enumerationMutation(v25);
                  +[NTKUpNextElement elementWithREElement:](NTKUpNextElement, "elementWithREElement:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * k));
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v56 = v30;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "appendItemsWithIdentifiers:", v31);

                  objc_msgSend(v12, "objectForKey:", v30);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v32)
                  {
                    -[NTKUpNextFaceView _replaceDataSourceElement:withReloadedREElement:](self, "_replaceDataSourceElement:withReloadedREElement:", v30, v32);
                    objc_msgSend(v20, "addObject:", v30);
                  }

                }
                v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
              }
              while (v27);
            }

            j = v40;
          }
        }
        v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
      }
      while (v39);
    }

    objc_msgSend(v20, "allObjects");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "reloadItemsWithIdentifiers:", v33);

    v6 = v35;
    -[NTKUpNextFaceView _applyCollectionViewSnapshot:animated:completion:](self, "_applyCollectionViewSnapshot:animated:completion:", v21, v34, v35);

    v11 = v37;
LABEL_37:

    goto LABEL_38;
  }
  if (v9)
  {
    *(_DWORD *)buf = 67109120;
    v62 = v4;
    _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "[datasource] performing override of collection view data (animated=%d)", buf, 8u);
  }

  -[NTKUpNextFaceView _applyCollectionViewSnapshot:animated:completion:](self, "_applyCollectionViewSnapshot:animated:completion:", self->_snapshotSnapshot, v4, v6);
LABEL_38:

}

uint64_t __69__NTKUpNextFaceView_updateCollectionViewSnapshotAnimated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateCollectionViewSnapshotAnimated:completion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_replaceDataSourceElement:(id)a3 withReloadedREElement:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](self->_collectionViewDataSource, "indexPathForItemIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_collectionViewDataSource, "itemIdentifierForIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412802;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1B72A3000, v10, OS_LOG_TYPE_DEFAULT, "Replacing element %@ with element %@ for index path %@", (uint8_t *)&v11, 0x20u);
  }

  objc_msgSend(v9, "setElement:", v7);
}

- (void)_availableDataSourcesDidChange
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__NTKUpNextFaceView__availableDataSourcesDidChange__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __51__NTKUpNextFaceView__availableDataSourcesDidChange__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "schedule");
  return objc_msgSend(*(id *)(a1 + 32), "_updateDisabledDataSources");
}

- (id)_sectionEnumerationOrder
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  -[REUIRelevanceEngineController sectionOrder](self->_engineController, "sectionOrder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D843D8];
  if (objc_msgSend(v2, "containsObject:", *MEMORY[0x1E0D843D8]))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v2, "indexOfObject:", v4));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__NTKUpNextFaceView__sectionEnumerationOrder__block_invoke;
  v9[3] = &unk_1E6BCD930;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v9);
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

void __45__NTKUpNextFaceView__sectionEnumerationOrder__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  if ((objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D843D8]) & 1) == 0)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

- (void)_updateApplicationIdentifiersAndLocationAuthorization
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t i;
  float v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  BOOL v21;
  unint64_t v22;
  float v23;
  void *v24;
  float v25;
  float v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  _BOOL4 v49;
  NSOrderedSet *v50;
  NSOrderedSet *currentApplicationIdentifiers;
  void *v52;
  id obj;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  unint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v3 = -[REUIRelevanceEngineController numberOfSections](self->_engineController, "numberOfSections");
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    for (i = 0; i != v4; ++i)
      v5 += -[REUIRelevanceEngineController numberOfItemsInSectionAtIndex:](self->_engineController, "numberOfItemsInSectionAtIndex:", i);
  }
  else
  {
    v5 = 0;
  }
  v58 = v5;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  -[NTKUpNextFaceView _sectionEnumerationOrder](self, "_sectionEnumerationOrder");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
  if (v55)
  {
    v54 = *(_QWORD *)v68;
    v7 = (float)v5;
    v60 = *MEMORY[0x1E0D84430];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v68 != v54)
          objc_enumerationMutation(obj);
        v57 = v8;
        v62 = objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * v8), "unsignedIntegerValue");
        v9 = -[REUIRelevanceEngineController numberOfItemsInSectionAtIndex:](self->_engineController, "numberOfItemsInSectionAtIndex:");
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v9;
        if (v9)
        {
          v10 = 0;
          do
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithElement:inUpNextSection:", v10, v62);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[REUIRelevanceEngineController identifierForElementAtIndexPath:](self->_engineController, "identifierForElementAtIndexPath:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[REUIRelevanceEngineController metadataForElementWithIdentifier:](self->_engineController, "metadataForElementWithIdentifier:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", v60);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            -[REUIRelevanceEngineController engine](self->_engineController, "engine");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "dataSourceCatalog");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "applicationIdentifierForDataSourceWithIdentifier:", v14);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            -[REUIRelevanceEngineController engine](self->_engineController, "engine");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "dataSourceCatalog");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "wantsApplicationPrewarmForDataSourceWithIdentifier:", v14);

            if (v17)
              v21 = v20 == 0;
            else
              v21 = 1;
            if (!v21)
            {
              v22 = -[NTKUpNextFaceView _distanceForIndexPathFromNow:](self, "_distanceForIndexPathFromNow:", v11);
              v23 = (float)((float)(v58 - v22) / v7) * (float)((float)(v58 - v22) / v7);
              objc_msgSend(v59, "objectForKeyedSubscript:", v17);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "floatValue");
              v26 = v25 + v23;

              *(float *)&v27 = v26;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "setObject:forKeyedSubscript:", v28, v17);

            }
            ++v10;
          }
          while (v61 != v10);
        }
        objc_msgSend(v59, "keysSortedByValueUsingComparator:", &__block_literal_global_119);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "addObjectsFromArray:", v29);

        v8 = v57 + 1;
      }
      while (v57 + 1 != v55);
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
    }
    while (v55);
  }

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  -[REUIRelevanceEngineController engine](self->_engineController, "engine");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "dataSourceCatalog");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "dataSourceIdentifiers");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v64;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v64 != v35)
          objc_enumerationMutation(v32);
        v37 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j);
        -[REUIRelevanceEngineController disabledDataSources](self->_engineController, "disabledDataSources");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "containsObject:", v37);

        if ((v39 & 1) == 0)
        {
          -[REUIRelevanceEngineController engine](self->_engineController, "engine");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "dataSourceCatalog");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "requiresLocationInUseAssertonForDataSourceWithIdentifier:", v37);

          if (v42)
          {
            -[REUIRelevanceEngineController engine](self->_engineController, "engine");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "dataSourceCatalog");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "applicationIdentifierForDataSourceWithIdentifier:", v37);
            v45 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v56, "addObject:", v45);
          }
        }
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
    }
    while (v34);
  }

  objc_msgSend(v56, "set");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSOrderedSet set](self->_currentApplicationIdentifiers, "set");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v46, "isEqualToSet:", v47);

  v49 = -[NTKFaceView dataMode](self, "dataMode") != 1 && -[NTKFaceView dataMode](self, "dataMode") != 2;
  v50 = (NSOrderedSet *)objc_msgSend(v56, "copy");
  currentApplicationIdentifiers = self->_currentApplicationIdentifiers;
  self->_currentApplicationIdentifiers = v50;

  if (((v48 | v49) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C94150], "sharedObserver");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "complicationListDidChange");

  }
}

uint64_t __74__NTKUpNextFaceView__updateApplicationIdentifiersAndLocationAuthorization__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (unint64_t)_distanceForIndexPathFromNow:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  switch(objc_msgSend(v4, "upNextSection"))
  {
    case 0:
      v5 = -[REUIRelevanceEngineController numberOfItemsInSectionAtIndex:](self->_engineController, "numberOfItemsInSectionAtIndex:", 0);
      v6 = v5 - objc_msgSend(v4, "element");
      v7 = v6
         + -[REUIRelevanceEngineController numberOfItemsInSectionAtIndex:](self->_engineController, "numberOfItemsInSectionAtIndex:", 1);
      break;
    case 1:
      v8 = -[REUIRelevanceEngineController numberOfItemsInSectionAtIndex:](self->_engineController, "numberOfItemsInSectionAtIndex:", 1);
      v7 = v8 - objc_msgSend(v4, "element");
      break;
    case 2:
      v7 = objc_msgSend(v4, "element");
      break;
    case 3:
      v9 = objc_msgSend(v4, "element");
      v7 = -[REUIRelevanceEngineController numberOfItemsInSectionAtIndex:](self->_engineController, "numberOfItemsInSectionAtIndex:", 2)+ v9;
      break;
    case 4:
      v10 = -[REUIRelevanceEngineController numberOfItemsInSectionAtIndex:](self->_engineController, "numberOfItemsInSectionAtIndex:", 4);
      v11 = v10 - objc_msgSend(v4, "element");
      v12 = -[REUIRelevanceEngineController numberOfItemsInSectionAtIndex:](self->_engineController, "numberOfItemsInSectionAtIndex:", 2);
      v7 = v11
         + v12
         + -[REUIRelevanceEngineController numberOfItemsInSectionAtIndex:](self->_engineController, "numberOfItemsInSectionAtIndex:", 3);
      break;
    default:
      v7 = 0;
      break;
  }

  return v7;
}

- (void)_startViewResetTimer
{
  NSTimer *viewResetTimer;
  double v4;
  void *v5;
  NSTimer *v6;
  NSTimer *v7;
  _QWORD v8[4];
  id v9;
  id location;

  viewResetTimer = self->_viewResetTimer;
  if (viewResetTimer)
    -[NSTimer invalidate](viewResetTimer, "invalidate");
  if (NTKUpNextDemoTimeoutDuration_onceToken != -1)
    dispatch_once(&NTKUpNextDemoTimeoutDuration_onceToken, &__block_literal_global_3);
  if (NTKUpNextDemoTimeoutDuration_defaultTimeout <= 0)
    v4 = 30.0;
  else
    v4 = (double)NTKUpNextDemoTimeoutDuration_defaultTimeout;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0C99E88];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__NTKUpNextFaceView__startViewResetTimer__block_invoke;
  v8[3] = &unk_1E6BCDE70;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "scheduledTimerWithTimeInterval:repeats:block:", 0, v8, v4);
  v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  v7 = self->_viewResetTimer;
  self->_viewResetTimer = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __41__NTKUpNextFaceView__startViewResetTimer__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_dismissPresentedViewControllerIfNecessary:", 0);
    if (objc_msgSend(v4, "viewMode") == 2 && objc_msgSend(v4, "dataMode") == 2)
    {
      objc_msgSend(v4, "_switchViewModeForCurrentMode:animated:", 2, 0);
      objc_msgSend(v5, "invalidate");
    }
  }

}

- (void)_stopViewResetTimer
{
  NSTimer *viewResetTimer;

  -[NSTimer invalidate](self->_viewResetTimer, "invalidate");
  viewResetTimer = self->_viewResetTimer;
  self->_viewResetTimer = 0;

}

- (BOOL)_dismissPresentedViewControllerIfNecessary:(BOOL)a3
{
  return 0;
}

- (void)_configureCollectionViewDataSource
{
  id v3;
  NTKUpNextCollectionView *collectionView;
  uint64_t v5;
  UICollectionViewDiffableDataSource *v6;
  UICollectionViewDiffableDataSource *collectionViewDataSource;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x1E0DC35E8]);
  collectionView = self->_collectionView;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__NTKUpNextFaceView__configureCollectionViewDataSource__block_invoke;
  v10[3] = &unk_1E6BCDE98;
  objc_copyWeak(&v11, &location);
  v6 = (UICollectionViewDiffableDataSource *)objc_msgSend(v3, "initWithCollectionView:cellProvider:", collectionView, v10);
  collectionViewDataSource = self->_collectionViewDataSource;
  self->_collectionViewDataSource = v6;

  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __55__NTKUpNextFaceView__configureCollectionViewDataSource__block_invoke_2;
  v8[3] = &unk_1E6BCDEC0;
  objc_copyWeak(&v9, &location);
  -[UICollectionViewDiffableDataSource setSupplementaryViewProvider:](self->_collectionViewDataSource, "setSupplementaryViewProvider:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

id __55__NTKUpNextFaceView__configureCollectionViewDataSource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(v7, "element");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_configureCellForItemWithElement:atIndexPath:inCollectionView:", v11, v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __55__NTKUpNextFaceView__configureCollectionViewDataSource__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_configureSupplementaryViewForSupplementaryElementOfKind:atIndexPath:inCollectionView:", v8, v9, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_reloadCollectionViewData
{
  self->_needsReloadedContent = 1;
  -[NTKUpNextFaceView _reloadContentIfNeeded](self, "_reloadContentIfNeeded");
}

- (void)_logDataSourceSnapshot:(id)a3 withName:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  void *v17;
  id obj;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint8_t v32[128];
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v34 = v6;
    v35 = 2112;
    v36 = v5;
    _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "[datasource] (%@):(%@)", buf, 0x16u);
  }
  v17 = v6;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v5, "sectionIdentifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v21)
  {
    v19 = *(_QWORD *)v28;
    v20 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(obj);
        v22 = v8;
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v8);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v5, "itemIdentifiersInSectionWithIdentifier:", v9, v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v24 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
              _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v34 = v9;
                v35 = 2112;
                v36 = v15;
                _os_log_impl(&dword_1B72A3000, v16, OS_LOG_TYPE_DEFAULT, "[datasource] %@:%@", buf, 0x16u);
              }

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v12);
        }

        v8 = v22 + 1;
        v5 = v20;
      }
      while (v22 + 1 != v21);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v21);
  }

}

- (void)_logContent:(id)a3 withIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  int v20;
  id v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "headerTextProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "description1TextProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attributedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "string");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "description2TextProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "attributedString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "string");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "description3TextProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "attributedString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "string");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138413570;
    v21 = v6;
    v22 = 1024;
    v23 = objc_msgSend(v5, "style");
    v24 = 2112;
    v25 = v9;
    v26 = 2112;
    v27 = v12;
    v28 = 2112;
    v29 = v15;
    v30 = 2112;
    v31 = v18;
    _os_log_impl(&dword_1B72A3000, v19, OS_LOG_TYPE_DEFAULT, "[datasource] %@ content=(style=%d, headerText=%@, description1=%@, description2=%@, description3=%@)", (uint8_t *)&v20, 0x3Au);
  }

}

- (id)_configureCellForItemWithElement:(id)a3 atIndexPath:(id)a4 inCollectionView:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NTKUpNextFaceView _contentAtIndexPath:](self, "_contentAtIndexPath:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412546;
    v20 = v13;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEFAULT, "[datasource] loaded identifier (%@) into cell at index path: (%@)", (uint8_t *)&v19, 0x16u);

  }
  objc_msgSend(v8, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextFaceView _logContent:withIdentifier:](self, "_logContent:withIdentifier:", v11, v14);

  +[NTKUpNextFaceView _reuseIdentifierForContent:](NTKUpNextFaceView, "_reuseIdentifierForContent:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v15, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextFaceView _setupCell:withContent:representedIdentifier:](self, "_setupCell:withContent:representedIdentifier:", v16, v11, v17);

  return v16;
}

- (id)_configureSupplementaryViewForSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4 inCollectionView:(id)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;

  v6 = *MEMORY[0x1E0DC48A8];
  v7 = a4;
  objc_msgSend(a5, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v6, CFSTR("NTKUpNextHeaderReuseIdentifier"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "upNextSection");

  switch(v9)
  {
    case -1:
      v10 = &stru_1E6BDC918;
      break;
    case 0:
      v11 = CFSTR("UP_NEXT_ALL_DAY_HEADER");
      v12 = CFSTR("All-Day");
      goto LABEL_9;
    case 1:
      v11 = CFSTR("UP_NEXT_RECENT_HEADER");
      v12 = CFSTR("Recent");
      goto LABEL_9;
    case 2:
      v11 = CFSTR("UP_NEXT_HEADER");
      v12 = CFSTR("Up Next");
      goto LABEL_9;
    case 3:
      v11 = CFSTR("UP_NEXT_TOMORROW_HEADER");
      v12 = CFSTR("Tomorrow");
      goto LABEL_9;
    case 4:
      v11 = CFSTR("UP_NEXT_UPCOMING_HEADER");
      v12 = CFSTR("Upcoming");
LABEL_9:
      NTKClockFaceLocalizedString(v11, v12);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v10 = 0;
      break;
  }
  objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "finalize");
  objc_msgSend(v8, "setTextProvider:", v13);

  return v8;
}

- (void)_configureVisibleCell:(id)a3
{
  UIImage *cellContentBackground;
  id v5;

  cellContentBackground = self->_cellContentBackground;
  v5 = a3;
  objc_msgSend(v5, "setContentImage:animated:", cellContentBackground, 0);
  objc_msgSend(v5, "setFilterProvider:", self);

}

- (int64_t)_numberOfSectionsInCollectionView
{
  return -[REUIRelevanceEngineController numberOfSections](self->_engineController, "numberOfSections");
}

- (int64_t)_numberOfItemsInCollectionViewSection:(int64_t)a3
{
  return -[REUIRelevanceEngineController numberOfItemsInSectionAtIndex:](self->_engineController, "numberOfItemsInSectionAtIndex:", a3);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7;
  CGFloat Width;
  void *v9;
  double v10;
  double v11;
  double v12;
  char v13[112];
  double v14;
  CGSize result;
  CGRect v16;

  v7 = a3;
  if (objc_msgSend(v7, "numberOfItemsInSection:", a5))
  {
    objc_msgSend(v7, "bounds");
    Width = CGRectGetWidth(v16);
    -[NTKFaceView device](self, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_0(v9, v13);
    v10 = v14;

  }
  else
  {
    Width = *MEMORY[0x1E0C9D820];
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v11 = Width;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6;

  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[NTKUpNextFaceView _configureVisibleCell:](self, "_configureVisibleCell:", v6);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[NTKUpNextFaceView _updateVisibilityForCells](self, "_updateVisibilityForCells", a3);
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  double v5;
  double v6;
  int v7;
  id v9;

  v9 = a3;
  -[NTKUpNextFaceView _updateVisibilityForCells](self, "_updateVisibilityForCells");
  if (self->_isInflightScroll
    && !self->_isProgramaticScrollEvent
    && self->_modeTransitionApplier
    && self->_modeTransitionCompletion)
  {
    self->_cancelInflightScroll = 1;
    objc_msgSend(v9, "contentOffset");
    CLKReverseInterpolateFromFloats();
    v5 = v4;
    objc_msgSend(v9, "contentOffset");
    CLKReverseInterpolateFromFloats();
    if (v5 < v6)
      v5 = v6;
    (*((void (**)(double))self->_modeTransitionApplier + 2))(v5);
    v7 = CLKFloatEqualsFloat();
    if (v5 > 1.0 || v7 != 0)
    {
      (*((void (**)(void))self->_modeTransitionCompletion + 2))();
      self->_scrollingStoppedTransition = 1;
    }
  }

}

- (void)_startPositiveDwellForTopElementsTimerIfNeeded
{
  -[NTKUpNextFaceView _stopPositiveDwellForTopElementsTimer](self, "_stopPositiveDwellForTopElementsTimer");
  -[NTKFaceView dataMode](self, "dataMode");
}

- (void)_stopPositiveDwellForTopElementsTimer
{
  NSTimer *positiveDwellForTopElementsTimer;

  -[NSTimer invalidate](self->_positiveDwellForTopElementsTimer, "invalidate");
  positiveDwellForTopElementsTimer = self->_positiveDwellForTopElementsTimer;
  self->_positiveDwellForTopElementsTimer = 0;

}

+ (id)_reuseIdentifierForContent:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "style");
  if (v3 > 6)
    return CFSTR("NTKUpNextMultilineCellReuseIdentifier");
  else
    return off_1E6BCE058[v3];
}

- (id)_contentAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_collectionViewDataSource, "itemIdentifierForIndexPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "element");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[REUIRelevanceEngineController wantsIdealizedContent](self->_engineController, "wantsIdealizedContent"))
  {
    objc_msgSend(v5, "idealizedContent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(v5, "content");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

  }
  else
  {
    objc_msgSend(v5, "content");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)_setupCell:(id)a3 withContent:(id)a4 representedIdentifier:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "configureWithContent:", a4);
  objc_msgSend(v9, "setRepresentedElementIdentifier:", v8);

  objc_msgSend(v9, "setContentImage:animated:", self->_cellContentBackground, 0);
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  void *v4;
  BOOL v5;

  -[REUIRelevanceEngineController actionAtIndexPath:](self->_engineController, "actionAtIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  NTKUpNextCollectionView *collectionView;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  CATransform3D v13;
  CATransform3D v14;
  CATransform3D v15;
  CATransform3D v16;

  collectionView = self->_collectionView;
  v6 = a4;
  -[NTKUpNextCollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextCollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](self->_layout, "layoutAttributesForItemAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  memset(&v16, 0, sizeof(v16));
  if (v8)
    objc_msgSend(v8, "transform3D");
  v14 = v16;
  CATransform3DScale(&v15, &v14, 0.95, 0.95, 1.0);
  v16 = v15;
  v11[1] = 3221225472;
  v13 = v15;
  v9 = (void *)MEMORY[0x1E0DC3F10];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[2] = __64__NTKUpNextFaceView_collectionView_didHighlightItemAtIndexPath___block_invoke;
  v11[3] = &unk_1E6BCDEE8;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "animateWithDuration:animations:", v11, 0.1);

}

void __64__NTKUpNextFaceView_collectionView_didHighlightItemAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v7[8];

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(a1 + 120);
  v7[4] = *(_OWORD *)(a1 + 104);
  v7[5] = v3;
  v4 = *(_OWORD *)(a1 + 152);
  v7[6] = *(_OWORD *)(a1 + 136);
  v7[7] = v4;
  v5 = *(_OWORD *)(a1 + 56);
  v7[0] = *(_OWORD *)(a1 + 40);
  v7[1] = v5;
  v6 = *(_OWORD *)(a1 + 88);
  v7[2] = *(_OWORD *)(a1 + 72);
  v7[3] = v6;
  objc_msgSend(v2, "setTransform:", v7);

}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  NTKUpNextCollectionView *collectionView;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  collectionView = self->_collectionView;
  v6 = a4;
  -[NTKUpNextCollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextCollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](self->_layout, "layoutAttributesForItemAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  if (v8)
    objc_msgSend(v8, "transform3D");
  v11[1] = 3221225472;
  v17 = v25;
  v18 = v26;
  v19 = v27;
  v20 = v28;
  v13 = v21;
  v14 = v22;
  v15 = v23;
  v9 = (void *)MEMORY[0x1E0DC3F10];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[2] = __66__NTKUpNextFaceView_collectionView_didUnhighlightItemAtIndexPath___block_invoke;
  v11[3] = &unk_1E6BCDEE8;
  v12 = v7;
  v16 = v24;
  v10 = v7;
  objc_msgSend(v9, "animateWithDuration:animations:", v11, 0.2);

}

void __66__NTKUpNextFaceView_collectionView_didUnhighlightItemAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v7[8];

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(a1 + 120);
  v7[4] = *(_OWORD *)(a1 + 104);
  v7[5] = v3;
  v4 = *(_OWORD *)(a1 + 152);
  v7[6] = *(_OWORD *)(a1 + 136);
  v7[7] = v4;
  v5 = *(_OWORD *)(a1 + 56);
  v7[0] = *(_OWORD *)(a1 + 40);
  v7[1] = v5;
  v6 = *(_OWORD *)(a1 + 88);
  v7[2] = *(_OWORD *)(a1 + 72);
  v7[3] = v6;
  objc_msgSend(v2, "setTransform:", v7);

}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16[33];
  _BYTE v17[160];
  double v18;
  UIEdgeInsets result;

  v7 = a3;
  v8 = 0.0;
  if (objc_msgSend(v7, "numberOfItemsInSection:", a5) >= 1 && objc_msgSend(v7, "numberOfSections") - 1 != a5)
  {
    -[NTKFaceView device](self, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_0(v9, v17);
    v10 = v18;
    -[NTKFaceView device](self, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_0(v11, v16);
    v8 = v10 + v16[5];

  }
  v12 = 0.0;
  v13 = 0.0;
  v14 = 0.0;
  v15 = v8;
  result.right = v14;
  result.bottom = v15;
  result.left = v13;
  result.top = v12;
  return result;
}

- (id)_additionalPrelaunchApplicationIdentifiers
{
  return self->_currentApplicationIdentifiers;
}

- (void)_loadLayoutRules
{
  void *v3;
  void *v4;
  NTKUtilityComplicationFactory *utilityComplicationFactory;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  _OWORD v13[3];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = 0;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  memset(v13, 0, sizeof(v13));
  -[NTKFaceView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_0(v3, v13);

  -[NTKFaceView complicationLayoutforSlot:](self, "complicationLayoutforSlot:", CFSTR("top-right"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  utilityComplicationFactory = self->_utilityComplicationFactory;
  -[NTKUpNextFaceView bounds](self, "bounds");
  -[NTKUtilityComplicationFactory configureComplicationLayout:forSlot:withBounds:](utilityComplicationFactory, "configureComplicationLayout:forSlot:withBounds:", v4, 13);
  -[NTKFaceView complicationLayoutforSlot:](self, "complicationLayoutforSlot:", CFSTR("top-left"));
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v6 = *((double *)&v25 + 1);
  v8 = *((double *)&v14 + 1);
  v7 = *(double *)&v15;
  v9 = *(double *)&v14;
  -[NTKFaceView device](self, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v10, 3, 3, v6, v7, v8, v9, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setDefaultLayoutRule:forState:", v11, 0);
}

- (BOOL)_wantsStatusBarHidden
{
  return -[NTKDigitalFaceView viewMode](self, "viewMode") == 2;
}

- (void)_applyDataMode
{
  int64_t v3;
  int64_t v4;
  char v5;
  BOOL v6;
  BOOL v7;

  v3 = -[NTKFaceView dataMode](self, "dataMode");
  if (v3 != self->_previousDataMode)
  {
    v4 = v3;
    switch(v3)
    {
      case 1:
        -[REUIRelevanceEngineController setWantsLiveDataSources:](self->_engineController, "setWantsLiveDataSources:", 1);
        -[UITapGestureRecognizer setEnabled:](self->_viewModeTapGesture, "setEnabled:", 1);
        -[NTKUpNextCollectionView setUserInteractionEnabled:](self->_collectionView, "setUserInteractionEnabled:", 1);
        if (-[NTKDigitalFaceView viewMode](self, "viewMode") == 2)
        {
          -[NTKUpNextFaceView _allowContentViewInteractive:](self, "_allowContentViewInteractive:", 1);
        }
        else
        {
          -[NTKUpNextFaceView _allowContentViewInteractive:](self, "_allowContentViewInteractive:", 0);
          -[NTKUpNextFaceView _switchViewModeToDefault](self, "_switchViewModeToDefault");
        }
        -[NTKUpNextFaceView _stopViewResetTimer](self, "_stopViewResetTimer");
        -[REUIRelevanceEngineController makeCurrent](self->_engineController, "makeCurrent");
        goto LABEL_13;
      case 2:
        -[REUIRelevanceEngineController setWantsLiveDataSources:](self->_engineController, "setWantsLiveDataSources:", 0);
        -[UITapGestureRecognizer setEnabled:](self->_viewModeTapGesture, "setEnabled:", 0);
        -[NTKUpNextFaceView _allowContentViewInteractive:](self, "_allowContentViewInteractive:", 0);
        -[NTKUpNextCollectionView setUserInteractionEnabled:](self->_collectionView, "setUserInteractionEnabled:", 0);
        -[NTKUpNextFaceView _startViewResetTimer](self, "_startViewResetTimer");
        goto LABEL_10;
      case 3:
        -[UITapGestureRecognizer setEnabled:](self->_viewModeTapGesture, "setEnabled:", 0);
        -[NTKUpNextCollectionView setUserInteractionEnabled:](self->_collectionView, "setUserInteractionEnabled:", 0);
        -[NTKUpNextFaceView _allowContentViewInteractive:](self, "_allowContentViewInteractive:", 0);
        -[NTKUpNextFaceView _switchViewModeToDefault](self, "_switchViewModeToDefault");
        -[REUIRelevanceEngineController setWantsLiveDataSources:](self->_engineController, "setWantsLiveDataSources:", 0);
        -[NTKUpNextFaceView _stopPositiveDwellForTopElementsTimer](self, "_stopPositiveDwellForTopElementsTimer");
        goto LABEL_6;
      case 4:
        -[REUIRelevanceEngineController setWantsLiveDataSources:](self->_engineController, "setWantsLiveDataSources:", 0);
        -[UITapGestureRecognizer setEnabled:](self->_viewModeTapGesture, "setEnabled:", 0);
        -[NTKUpNextCollectionView setUserInteractionEnabled:](self->_collectionView, "setUserInteractionEnabled:", 0);
        -[NTKUpNextFaceView _allowContentViewInteractive:](self, "_allowContentViewInteractive:", 0);
        -[NTKUpNextFaceView _switchViewModeToDefault](self, "_switchViewModeToDefault");
LABEL_10:
        -[REUIRelevanceEngineController resignCurrent](self->_engineController, "resignCurrent");
        -[NTKUpNextFaceView _stopPositiveDwellForTopElementsTimer](self, "_stopPositiveDwellForTopElementsTimer");
LABEL_13:
        v5 = 0;
        break;
      case 5:
        v5 = 1;
        -[REUIRelevanceEngineController setWantsLiveDataSources:](self->_engineController, "setWantsLiveDataSources:", 1);
        -[UITapGestureRecognizer setEnabled:](self->_viewModeTapGesture, "setEnabled:", 0);
        -[NTKUpNextCollectionView setUserInteractionEnabled:](self->_collectionView, "setUserInteractionEnabled:", 0);
        -[NTKUpNextFaceView _allowContentViewInteractive:](self, "_allowContentViewInteractive:", 0);
        -[NTKUpNextFaceView _switchViewModeToDefault](self, "_switchViewModeToDefault");
        break;
      default:
LABEL_6:
        v5 = 1;
        break;
    }
    -[NTKUpNextFaceView _updateVisibilityForCells](self, "_updateVisibilityForCells");
    v6 = -[NTKUpNextFaceView _applyShouldUseCanonicalContent](self, "_applyShouldUseCanonicalContent");
    v7 = -[NTKUpNextFaceView _applyShowIdealizedContent](self, "_applyShowIdealizedContent");
    if ((v5 & 1) != 0 || v6 || v7)
      -[NTKUpNextFaceView collectionViewDeferralStateChanged](self, "collectionViewDeferralStateChanged");
    else
      -[NTKUpNextFaceView _reloadContentIfNeeded](self, "_reloadContentIfNeeded");
    self->_previousDataMode = v4;
  }
}

- (BOOL)presentedViewControllerShouldBecomeFirstResponder:(id)a3
{
  return a3 != 0;
}

- (void)_handleOrdinaryScreenWake
{
  -[NTKUpNextFaceView _prepareWristRaiseAnimation](self, "_prepareWristRaiseAnimation");
  -[NTKUpNextFaceView _performWristRaiseAnimation](self, "_performWristRaiseAnimation");
}

- (void)_prepareWristRaiseAnimation
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[NTKUpNextCollectionView visibleCells](self->_collectionView, "visibleCells");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setContentBrightness:animated:", 0, 0.25);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_performWristRaiseAnimation
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[NTKUpNextCollectionView visibleCells](self->_collectionView, "visibleCells");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setContentBrightness:animated:", 1, 1.0);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_loadSnapshotContent:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  dispatch_group_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD block[5];
  void (**v14)(_QWORD);
  _QWORD *v15;
  uint8_t *v16;
  _QWORD v17[4];
  __CFString *v18;
  NSObject *v19;
  __CFString *v20;
  _QWORD *v21;
  uint8_t *v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[8];
  uint8_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v4 = (void (**)(_QWORD))a3;
  if (self->_snapshotSnapshot)
  {
    _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "NTKUpNextFaceView reload data and immediatly call completion", buf, 2u);
    }

    self->_needsReloadedContent = 1;
    -[NTKUpNextFaceView _reloadContentIfNeeded](self, "_reloadContentIfNeeded");
    -[NTKUpNextFaceView setNeedsLayout](self, "setNeedsLayout");
    -[NTKUpNextFaceView layoutIfNeeded](self, "layoutIfNeeded");
    -[NTKUpNextCollectionView setNeedsLayout](self->_collectionView, "setNeedsLayout");
    -[NTKUpNextCollectionView layoutIfNeeded](self->_collectionView, "layoutIfNeeded");
    if (v4)
      v4[2](v4);
  }
  else
  {
    +[NTKRelevanceEngineCache sharedCache](NTKRelevanceEngineCache, "sharedCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "canonicalRelevanceEngineIgnoringAppInstallations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)buf = 0;
    v26 = buf;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__0;
    v29 = __Block_byref_object_dispose__0;
    v30 = 0;
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x3032000000;
    v23[3] = __Block_byref_object_copy__0;
    v23[4] = __Block_byref_object_dispose__0;
    v24 = 0;
    v8 = dispatch_group_create();
    objc_msgSend(v7, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dataSourceLoader");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __42__NTKUpNextFaceView__loadSnapshotContent___block_invoke;
    v17[3] = &unk_1E6BCDF38;
    v18 = CFSTR("com.apple.weather.relevance-engine");
    v12 = v8;
    v19 = v12;
    v20 = CFSTR("com.apple.NanoCalendar");
    v21 = v23;
    v22 = buf;
    objc_msgSend(v10, "enumerateDataSourceClassesWithBlock:", v17);
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __42__NTKUpNextFaceView__loadSnapshotContent___block_invoke_4;
    block[3] = &unk_1E6BCDF88;
    v15 = v23;
    v16 = buf;
    block[4] = self;
    v14 = v4;
    dispatch_group_notify(v12, MEMORY[0x1E0C80D38], block);

    _Block_object_dispose(v23, 8);
    _Block_object_dispose(buf, 8);

  }
}

void __42__NTKUpNextFaceView__loadSnapshotContent___block_invoke(uint64_t a1, objc_class *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  objc_msgSend((id)objc_opt_class(), "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__0;
    v21 = __Block_byref_object_dispose__0;
    v22 = objc_alloc_init(a2);
    v5 = (void *)v18[5];
    v6 = *MEMORY[0x1E0D843D8];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __42__NTKUpNextFaceView__loadSnapshotContent___block_invoke_2;
    v13[3] = &unk_1E6BCDF10;
    v15 = *(_QWORD *)(a1 + 56);
    v16 = &v17;
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v5, "getElementsInSection:withHandler:", v6, v13);

    _Block_object_dispose(&v17, 8);
  }
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 48)))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__0;
    v21 = __Block_byref_object_dispose__0;
    v22 = objc_alloc_init(a2);
    v7 = (void *)v18[5];
    v8 = *MEMORY[0x1E0D843D8];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42__NTKUpNextFaceView__loadSnapshotContent___block_invoke_3;
    v9[3] = &unk_1E6BCDF10;
    v11 = *(_QWORD *)(a1 + 64);
    v12 = &v17;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v7, "getElementsInSection:withHandler:", v8, v9);

    _Block_object_dispose(&v17, 8);
  }

}

void __42__NTKUpNextFaceView__loadSnapshotContent___block_invoke_2(uint64_t a1, void *a2)
{
  NTKUpNextElement *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "firstObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v3 = -[NTKUpNextElement initWithREElement:]([NTKUpNextElement alloc], "initWithREElement:", v8);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __42__NTKUpNextFaceView__loadSnapshotContent___block_invoke_3(uint64_t a1, void *a2)
{
  NTKUpNextElement *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "firstObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v3 = -[NTKUpNextElement initWithREElement:]([NTKUpNextElement alloc], "initWithREElement:", v8);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __42__NTKUpNextFaceView__loadSnapshotContent___block_invoke_4(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  _QWORD block[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  NTKOrderedUpNextSections();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        NTKIdentifierForUpNextSection(objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v9), "unsignedIntegerValue"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v2, "appendSectionsWithIdentifiers:", v11);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    objc_msgSend(v12, "addObject:");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    objc_msgSend(v13, "addObject:");
  NTKIdentifierForUpNextSection(2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v2, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v15, v14);

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1176) = 1;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 1184);
  *(_QWORD *)(v16 + 1184) = v2;
  v18 = v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1040) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_reloadContentIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__NTKUpNextFaceView__loadSnapshotContent___block_invoke_5;
  block[3] = &unk_1E6BCDF60;
  v20 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __42__NTKUpNextFaceView__loadSnapshotContent___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_prepareForSnapshotting
{
  -[REUIRelevanceEngineController setDelegate:](self->_engineController, "setDelegate:", 0);
}

- (void)_finalizeForSnapshotting:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "NTKUpNextFaceView _finalizeForSnapshotting", buf, 2u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__NTKUpNextFaceView__finalizeForSnapshotting___block_invoke;
  v7[3] = &unk_1E6BCDF60;
  v8 = v4;
  v6 = v4;
  -[NTKUpNextFaceView _loadSnapshotContent:](self, "_loadSnapshotContent:", v7);

}

uint64_t __46__NTKUpNextFaceView__finalizeForSnapshotting___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "NTKUpNextFaceView generated snapshot snapshot", v4, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a4 == 10)
  {
    -[NTKUpNextFaceView _setSiriBlurColor](self, "_setSiriBlurColor", a3, 10, a5);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NTKUpNextCollectionView visibleCells](self->_collectionView, "visibleCells", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
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
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v11, "setContentImage:animated:", self->_cellContentBackground, 0);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (void)_updateDisabledDataSources
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E20];
  +[NTKSiriDefaults sharedInstance](NTKSiriDefaults, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disabledDataSources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[REUIRelevanceEngineController disabledDataSources](self->_engineController, "disabledDataSources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v8, "minusSet:", v7);
  v9 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v9, "minusSet:", v6);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        -[REUIRelevanceEngineController setDataSource:enabled:](self->_engineController, "setDataSource:enabled:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v14++), 0);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = v9;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        -[REUIRelevanceEngineController setDataSource:enabled:](self->_engineController, "setDataSource:enabled:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19++), 1, (_QWORD)v20);
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v17);
  }

  self->_needsReloadedContent = 1;
  -[NTKUpNextFaceView _reloadContentIfNeeded](self, "_reloadContentIfNeeded");

}

- (BOOL)_shouldUseCanonicalContent
{
  _BOOL4 v3;

  if (self->_collectionView)
  {
    v3 = -[NTKFaceView showsCanonicalContent](self, "showsCanonicalContent");
    if (v3)
      LOBYTE(v3) = -[NTKFaceView dataMode](self, "dataMode") == 3;
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)_applyShouldUseCanonicalContent
{
  return 0;
}

- (BOOL)_applyShowIdealizedContent
{
  int64_t v3;
  unsigned int v4;

  v3 = -[NTKFaceView dataMode](self, "dataMode");
  v4 = (v3 == 3) ^ -[REUIRelevanceEngineController wantsIdealizedContent](self->_engineController, "wantsIdealizedContent");
  if (v4 == 1)
  {
    -[REUIRelevanceEngineController setWantsIdealizedContent:](self->_engineController, "setWantsIdealizedContent:", v3 == 3);
    self->_needsReloadedContent = 1;
    -[NTKUpNextFaceView _reloadContentIfNeeded](self, "_reloadContentIfNeeded");
  }
  return v4;
}

- (void)_applyShowsLockedUI
{
  if (-[NTKFaceView showsLockedUI](self, "showsLockedUI") && -[NTKDigitalFaceView viewMode](self, "viewMode") == 2)
    -[NTKUpNextFaceView _switchViewModeForCurrentMode:animated:](self, "_switchViewModeForCurrentMode:animated:", 2, 0);
  -[NTKUpNextFaceView _dismissPresentedViewControllerIfNecessary:](self, "_dismissPresentedViewControllerIfNecessary:", 0);
}

- (void)_becameActiveFace
{
  -[REUIRelevanceEngineController setAllowsLocationUse:](self->_engineController, "setAllowsLocationUse:", 1);
  -[REUIRelevanceEngineController makeCurrent](self->_engineController, "makeCurrent");
}

- (void)_becameInactiveFace
{
  -[REUIRelevanceEngineController setAllowsLocationUse:](self->_engineController, "setAllowsLocationUse:", 0);
  -[REUIRelevanceEngineController resignCurrent](self->_engineController, "resignCurrent");
}

- (BOOL)allowsHomeScreenTransition
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  void *v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  BOOL v14;
  CGPoint v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v5 = a4;
  if (-[NTKDigitalFaceView viewMode](self, "viewMode") == 2)
  {
    -[NTKFaceView timeView](self, "timeView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v18 = CGRectInset(v17, -6.0, -6.0);
    x = v18.origin.x;
    y = v18.origin.y;
    width = v18.size.width;
    height = v18.size.height;
    -[NTKFaceView timeView](self, "timeView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locationInView:", v11);
    v16.x = v12;
    v16.y = v13;
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    v14 = CGRectContainsPoint(v19, v16);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)setViewMode:(int64_t)a3
{
  -[NTKUpNextFaceView _setViewMode:scroll:scrollToPoint:secondaryPoint:force:velocity:animated:](self, "_setViewMode:scroll:scrollToPoint:secondaryPoint:force:velocity:animated:", a3, 0, 0, 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 0.0);
}

- (void)_applyShowContentForUnadornedSnapshot
{
  id v2;

  -[NTKFaceView timeView](self, "timeView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 0);

}

- (BOOL)_shouldDeferUpdate
{
  unint64_t v3;

  v3 = -[NTKFaceView dataMode](self, "dataMode");
  if (v3 <= 4 && ((1 << v3) & 0x16) != 0)
  {
    -[NTKFaceView isFrozen](self, "isFrozen");
  }
  else if (-[NTKFaceView isFrozen](self, "isFrozen"))
  {
    return 1;
  }
  if (self->_collectionView && !self->_isInflightScroll)
    return self->_isApplyingSnapshot;
  return 1;
}

- (void)engineController:(id)a3 performBatchUpdateBlock:(id)a4 completion:(id)a5
{
  void (**v7)(_QWORD);
  void (**v8)(_QWORD);
  NSObject *v9;
  uint8_t v10[16];

  v7 = (void (**)(_QWORD))a4;
  v8 = (void (**)(_QWORD))a5;
  _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "[datasource] engine requested batch update", v10, 2u);
  }

  if (v7)
  {
    self->_isApplyingBatchUpdate = 1;
    v7[2](v7);
    self->_isApplyingBatchUpdate = 0;
  }
  if (v8)
    v8[2](v8);
  self->_hasDeferredUpdate = 1;
  -[NTKUpNextFaceView collectionViewDeferralStateChanged](self, "collectionViewDeferralStateChanged");

}

- (BOOL)engineController:(id)a3 isElementAtIndexPathVisible:(id)a4
{
  void *v5;
  NTKUpNextCollectionView *collectionView;
  id v7;
  void *v8;
  void *v9;

  if (self->_needsReloadedContent)
    return 0;
  v5 = (void *)MEMORY[0x1E0C99E60];
  collectionView = self->_collectionView;
  v7 = a4;
  -[NTKUpNextCollectionView indexPathsForVisibleItems](collectionView, "indexPathsForVisibleItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v8) = objc_msgSend(v9, "containsObject:", v7);
  return (char)v8;
}

- (void)engineController:(id)a3 didReloadContent:(id)a4 withIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v17, "indexPathForElementWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_elementAtIndexPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    +[NTKUpNextElement elementWithREElement:](NTKUpNextElement, "elementWithREElement:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_isApplyingBatchUpdate)
    {
      -[NSMutableSet addObject:](self->_reloadedElements, "addObject:", v12);
    }
    else
    {
      -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](self->_collectionViewDataSource, "indexPathForItemIdentifier:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKUpNextCollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "configureWithContent:", v8);
      objc_msgSend(v17, "indexPathForElementWithIdentifier:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "elementAtIndexPath:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKUpNextFaceView _replaceDataSourceElement:withReloadedREElement:](self, "_replaceDataSourceElement:withReloadedREElement:", v12, v16);

    }
  }

}

- (void)engineController:(id)a3 didReloadElement:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v6)
  {
    if (self->_isApplyingBatchUpdate)
    {
      +[NTKUpNextElement elementWithREElement:](NTKUpNextElement, "elementWithREElement:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](self->_reloadedElements, "addObject:", v7);

    }
    else
    {
      self->_hasDeferredUpdate = 1;
      -[NTKUpNextFaceView collectionViewDeferralStateChanged](self, "collectionViewDeferralStateChanged");
    }
  }

}

- (void)engineController:(id)a3 didRemoveContent:(id)a4 atIndexPath:(id)a5
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "_elementAtIndexPath:", a5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v8 = v6;
    +[NTKUpNextElement elementWithREElement:](NTKUpNextElement, "elementWithREElement:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet removeObject:](self->_reloadedElements, "removeObject:", v7);

    v6 = v8;
  }

}

- (void)engineControllerDidFinishUpdatingRelevance:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if (!self->_engineInitiallyLoaded)
  {
    self->_engineInitiallyLoaded = 1;
    _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "NTKUpNextFaceView engine loaded, can snapshot now", v5, 2u);
    }

    self->_needsReloadedContent = 1;
    -[NTKUpNextFaceView _reloadContentIfNeeded](self, "_reloadContentIfNeeded");
  }
}

- (CGPoint)_defaultPointForDefaultMode
{
  void *v3;
  double v4;
  NTKUpNextCollectionViewFlowLayout *layout;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  char v14[72];
  double v15;
  CGPoint result;

  if (self->_engineInitiallyLoaded
    && (!NTKIsDaemonOrFaceSnapshotService() || self->_engineInitiallyLoaded)
    && -[NTKUpNextCollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", 2))
  {
    -[NTKFaceView device](self, "device");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_0(v3, v14);
    v4 = v15;

    layout = self->_layout;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKUpNextCollectionViewFlowLayout flowLayoutAttributesForItemAtIndexPath:](layout, "flowLayoutAttributesForItemAtIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v9 = v8;
    v11 = v10;

    v12 = v11 - v4;
  }
  else
  {
    v9 = *MEMORY[0x1E0C9D538];
    v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  v13 = v9;
  result.y = v12;
  result.x = v13;
  return result;
}

- (void)_setViewMode:(int64_t)a3 scroll:(BOOL)a4 scrollToPoint:(CGPoint)a5 secondaryPoint:(CGPoint)a6 force:(BOOL)a7 velocity:(double)a8 animated:(BOOL)a9
{
  double y;
  double x;
  _BOOL8 v11;
  void (**modeTransitionCompletion)(id, uint64_t);

  y = a5.y;
  x = a5.x;
  v11 = a4;
  if (!a3 || a7 || -[NTKDigitalFaceView viewMode](self, "viewMode", a5.x, a5.y, a6.x, a6.y, a8) != a3)
  {
    self->_previousViewMode = -[NTKDigitalFaceView viewMode](self, "viewMode", a5.x, a5.y, a6.x, a6.y, a8);
    -[NTKDigitalFaceView setViewMode:updateTimeViewStyle:](self, "setViewMode:updateTimeViewStyle:", a3, 0);
    if (self->_collectionView)
    {
      -[NTKUpNextCollectionViewFlowLayout setSnappingEnabled:](self->_layout, "setSnappingEnabled:", a3 == 2);
      if (a3 == 2)
      {
        -[NTKUpNextCollectionViewFlowLayout setIndexPathToSnapTo:](self->_layout, "setIndexPathToSnapTo:", 0);
        -[NTKUpNextFaceView _stopPositiveDwellForTopElementsTimer](self, "_stopPositiveDwellForTopElementsTimer");
      }
      else
      {
        -[NTKUpNextFaceView _resetVisibilityForCells](self, "_resetVisibilityForCells");
      }
      modeTransitionCompletion = (void (**)(id, uint64_t))self->_modeTransitionCompletion;
      if (modeTransitionCompletion)
        modeTransitionCompletion[2](modeTransitionCompletion, 1);
      else
        -[NTKUpNextFaceView _cleanupAfterSettingViewMode:scroll:targetOffset:needsLayout:](self, "_cleanupAfterSettingViewMode:scroll:targetOffset:needsLayout:", a3, v11, 1, x, y);
    }
  }
}

- (void)_cleanupAfterSettingViewMode:(int64_t)a3 scroll:(BOOL)a4 targetOffset:(CGPoint)a5 needsLayout:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  double y;
  double x;
  _BOOL4 isInflightScroll;
  id modeTransitionCompletion;
  id modeTransitionApplier;
  void *v15;
  double *v16;
  double *v17;
  double *v18;
  double *v19;
  double v20;
  double v21;
  NTKUpNextCollectionViewFlowLayout *layout;
  id v23;
  id WeakRetained;
  int *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  id v31;
  uint64_t v32;
  double v33;
  void *v34;
  __int128 v35;
  double *v36;
  void *v37;
  _OWORD v38[3];
  _OWORD v39[4];
  __int128 v40;
  _OWORD v41[3];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _OWORD v48[2];
  uint64_t v49;

  v6 = a6;
  v7 = a4;
  y = a5.y;
  x = a5.x;
  self->_cancelInflightScroll = 0;
  isInflightScroll = self->_isInflightScroll;
  self->_isInflightScroll = 0;
  self->_isAnimating = 0;
  modeTransitionCompletion = self->_modeTransitionCompletion;
  self->_modeTransitionCompletion = 0;

  modeTransitionApplier = self->_modeTransitionApplier;
  self->_modeTransitionApplier = 0;

  -[NTKUpNextFaceView _allowContentViewInteractive:](self, "_allowContentViewInteractive:", a3 == 2);
  v49 = 0;
  memset(v48, 0, sizeof(v48));
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  memset(v41, 0, sizeof(v41));
  memset(v39, 0, sizeof(v39));
  -[NTKFaceView device](self, "device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_0(v15, v39);

  -[NTKUpNextCollectionViewFlowLayout setUseFixedLowTransitionLayout:](self->_layout, "setUseFixedLowTransitionLayout:", 0);
  if (!v6)
    goto LABEL_26;
  v16 = (double *)&v44 + 1;
  if (a3)
  {
    v16 = (double *)&v45;
    v17 = (double *)&v46;
  }
  else
  {
    v17 = (double *)&v45 + 1;
  }
  if (a3)
    v18 = (double *)&v47;
  else
    v18 = (double *)&v46 + 1;
  if (a3)
    v19 = (double *)v48;
  else
    v19 = (double *)&v47 + 1;
  v20 = 1.0;
  if (a3)
    v21 = 1.0;
  else
    v21 = 0.0;
  -[NTKUpNextCollectionViewFlowLayout setLowTransitionScale:](self->_layout, "setLowTransitionScale:", *v16);
  -[NTKUpNextCollectionViewFlowLayout setHighTransitionScale:](self->_layout, "setHighTransitionScale:", *v17);
  -[NTKUpNextCollectionViewFlowLayout setHighTransitionShift:](self->_layout, "setHighTransitionShift:", *v18);
  -[NTKUpNextCollectionViewFlowLayout setLowTransitionShift:](self->_layout, "setLowTransitionShift:", *v19);
  -[NTKUpNextCollectionViewFlowLayout setTopItemsAlpha:](self->_layout, "setTopItemsAlpha:", v21);
  -[NTKUpNextCollectionViewFlowLayout setHeaderAlpha:](self->_layout, "setHeaderAlpha:", v21);
  layout = self->_layout;
  if (a3)
  {
    -[NTKFaceView device](self, "device");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)&InteractiveModeTopItemShift___lock);
    WeakRetained = objc_loadWeakRetained(&InteractiveModeTopItemShift___cachedDevice);
    v25 = &dword_1EF172000;
    if (WeakRetained)
    {
      v26 = WeakRetained;
      v27 = objc_loadWeakRetained(&InteractiveModeTopItemShift___cachedDevice);
      if (v27 == v23)
      {
        v28 = objc_msgSend(v23, "version");
        v29 = InteractiveModeTopItemShift___previousCLKDeviceVersion;

        v30 = v28 == v29;
        v25 = &dword_1EF172000;
        if (v30)
        {
LABEL_21:
          os_unfair_lock_unlock((os_unfair_lock_t)&InteractiveModeTopItemShift___lock);
          v33 = *(double *)&InteractiveModeTopItemShift_interactiveModeShiftValue;

          -[NTKUpNextCollectionViewFlowLayout setTopItemsShift:](layout, "setTopItemsShift:", v33);
          v20 = 0.0;
          goto LABEL_22;
        }
      }
      else
      {

      }
    }
    v31 = objc_storeWeak(&InteractiveModeTopItemShift___cachedDevice, v23);
    *((_QWORD *)v25 + 120) = objc_msgSend(v23, "version");

    __InteractiveModeTopItemShift_block_invoke(v32, v23);
    goto LABEL_21;
  }
  -[NTKUpNextCollectionViewFlowLayout setTopItemsShift:](self->_layout, "setTopItemsShift:", *((double *)&v42 + 1));
LABEL_22:
  -[NTKFaceView complicationContainerView](self, "complicationContainerView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v38[0] = *MEMORY[0x1E0C9BAA8];
  v38[1] = v35;
  v38[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v34, "setTransform:", v38);

  -[NTKUpNextFaceView _layoutTimeLabelForViewMode:](self, "_layoutTimeLabelForViewMode:", a3);
  -[NTKUpNextFaceView _layoutTimeLabelPlatterViewMode:](self, "_layoutTimeLabelPlatterViewMode:", a3);
  v36 = (double *)v41;
  if (!a3)
    v36 = (double *)&v40 + 1;
  -[NTKUpNextCollectionViewFlowLayout setTopOffsetForScrolling:](self->_layout, "setTopOffsetForScrolling:", *v36);
  -[NTKFaceView complicationContainerView](self, "complicationContainerView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setAlpha:", v20);

  if (v7)
    -[NTKUpNextCollectionView setContentOffset:animated:](self->_collectionView, "setContentOffset:animated:", 0, x, y);
LABEL_26:
  -[NTKUpNextFaceView _updateVisibilityForCells](self, "_updateVisibilityForCells");
  if (isInflightScroll)
    -[NTKUpNextFaceView collectionViewDeferralStateChanged](self, "collectionViewDeferralStateChanged");
}

- (void)_allowContentViewInteractive:(BOOL)a3
{
  -[NTKUpNextCollectionView setScrollEnabled:](self->_collectionView, "setScrollEnabled:", a3);
}

- (void)_layoutTimeLabelPlatterViewMode:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  int v32;
  double v33;
  id v34;
  _BYTE v35[8];
  double v36;
  double v37;
  double v38;
  double v39;

  -[NTKUpNextFaceView bounds](self, "bounds");
  -[NTKUpNextFaceView _digitalTimeLabelStyleFromViewMode:faceBounds:](self, "_digitalTimeLabelStyleFromViewMode:faceBounds:", a3);
  v34 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKFaceView timeView](self, "timeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[NTKFaceView device](self, "device");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_0(v14, v35);
  v15 = v7 + v37;
  v16 = v9 + v36;
  v17 = v11 - (v37 + v39);
  v18 = v13 - (v36 + v38);

  -[UIView setFrame:](self->_timeLabelPlatter, "setFrame:", v15, v16, v17, v18);
  -[UIView layer](self->_timeLabelPlatter, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView frame](self->_timeLabelPlatter, "frame");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[NTKUpNextFaceView bounds](self, "bounds");
  objc_msgSend(v19, "setContentsRect:", NTKUpNextUnitRectForFrameInBounds(v21, v23, v25, v27, v28, v29, v30, v31));

  v32 = objc_msgSend(v34, "isEqual:", self->_timeLabelSmallInUpperRightCornerStyle);
  v33 = 0.0;
  if (v32)
    v33 = 1.0;
  -[UIView setAlpha:](self->_timeLabelPlatter, "setAlpha:", v33);

}

- (void)_layoutTimeLabelForViewMode:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;

  -[NTKUpNextFaceView bounds](self, "bounds");
  -[NTKUpNextFaceView _digitalTimeLabelStyleFromViewMode:faceBounds:](self, "_digitalTimeLabelStyleFromViewMode:faceBounds:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKFaceView timeView](self, "timeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStyle:", v11);

  -[NTKFaceView timeView](self, "timeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutRule");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceView timeView](self, "timeView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "calculateLayoutFrameForBoundsSize:", v9, v10);
  objc_msgSend(v6, "ntk_setBoundsAndPositionFromFrame:");

}

- (void)updateTimeLabelBackground
{
  UIView *v2;
  _BOOL4 IsReduceTransparencyEnabled;
  id v4;
  id v5;

  v2 = self->_timeLabelPlatter;
  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  -[UIView layer](v2, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (IsReduceTransparencyEnabled)
    objc_msgSend(MEMORY[0x1E0DC3658], "_externalSystemDarkGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.333, 0.75);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));

}

- (void)_handleViewModeTapGesture:(id)a3
{
  if (objc_msgSend(a3, "state") == 3 && !self->_isAnimating)
    -[NTKUpNextFaceView _switchViewModeForCurrentMode:animated:](self, "_switchViewModeForCurrentMode:animated:", -[NTKDigitalFaceView viewMode](self, "viewMode"), 1);
}

- (void)_switchViewModeForCurrentMode:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;
  NTKUpNextCollectionViewFlowLayout *layout;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  NTKUpNextCollectionViewFlowLayout *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _BOOL4 v24;
  _BOOL4 v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  id v31;

  v4 = a4;
  if (a3 == 2)
  {
    -[NTKUpNextFaceView _defaultPointForDefaultMode](self, "_defaultPointForDefaultMode");
    -[NTKUpNextFaceView _setViewMode:scroll:scrollToPoint:secondaryPoint:force:velocity:animated:](self, "_setViewMode:scroll:scrollToPoint:secondaryPoint:force:velocity:animated:", 0, 1, 0, v4);
    -[NTKUpNextFaceView _allowContentViewInteractive:](self, "_allowContentViewInteractive:", 0);
  }
  else if (!a3)
  {
    -[NTKUpNextCollectionViewFlowLayout setSnappingEnabled:](self->_layout, "setSnappingEnabled:", 1);
    -[NTKUpNextFaceView _allowContentViewInteractive:](self, "_allowContentViewInteractive:", 1);
    if (-[NTKUpNextCollectionView numberOfSections](self->_collectionView, "numberOfSections") < 1)
    {
      v30 = 0;
    }
    else
    {
      v30 = 0;
      v6 = 0;
      do
      {
        v7 = -[NTKUpNextCollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", v6);
        -[NTKUpNextCollectionViewFlowLayout topElementIndexPath](self->_layout, "topElementIndexPath");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "section");

        if (v6 < v9 && v7 >= 1)
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v7 - 1, v6);
          v11 = objc_claimAutoreleasedReturnValue();

          v30 = (id)v11;
        }
        ++v6;
      }
      while (v6 < -[NTKUpNextCollectionView numberOfSections](self->_collectionView, "numberOfSections"));
    }
    layout = self->_layout;
    -[NTKUpNextCollectionView contentOffset](self->_collectionView, "contentOffset");
    -[NTKUpNextCollectionViewFlowLayout targetContentOffsetForProposedContentOffset:](layout, "targetContentOffsetForProposedContentOffset:");
    v15 = v13;
    v16 = v14;
    v17 = v30;
    if (v30)
    {
      -[NTKUpNextCollectionViewFlowLayout flowLayoutAttributesForItemAtIndexPath:](self->_layout, "flowLayoutAttributesForItemAtIndexPath:", v30);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = self->_layout;
      objc_msgSend(v18, "frame");
      -[NTKUpNextCollectionViewFlowLayout targetContentOffsetForProposedContentOffset:](v19, "targetContentOffsetForProposedContentOffset:");
      v21 = v20;
      v23 = v22;

      v17 = v30;
    }
    else
    {
      v23 = v14;
      v21 = v13;
    }
    v31 = v17;
    v24 = v17 != 0;
    v25 = self->_lastCrownVelocity < 0.0;
    if (v24 && v25)
      v26 = v15;
    else
      v26 = v21;
    if (v24 && v25)
      v27 = v16;
    else
      v27 = v23;
    if (v24 && v25)
      v28 = v23;
    else
      v28 = v16;
    if (v24 && v25)
      v29 = v21;
    else
      v29 = v15;
    -[NTKUpNextFaceView _setViewMode:scroll:scrollToPoint:secondaryPoint:force:velocity:animated:](self, "_setViewMode:scroll:scrollToPoint:secondaryPoint:force:velocity:animated:", 2, 1, 0, v4, v29, v28, v26, v27);

  }
}

- (void)elementAction:(id)a3 didFinishTask:(BOOL)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "setDelegate:", 0);
  if (NTKInternalBuild(v5, v6))
  {
    if (CFPreferencesGetAppBooleanValue(CFSTR("EnableDemoMode"), CFSTR("com.apple.NanoTimeKit.face"), 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        REUpNextDemoUserDefaults();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "arrayForKey:", CFSTR("IntentsPerformed"));
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        v10 = (void *)MEMORY[0x1E0C9AA60];
        if (v8)
          v10 = (void *)v8;
        v11 = v10;

        objc_msgSend(v4, "bundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v13 = v11;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v21;
          while (2)
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v21 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v17);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && (objc_msgSend(v18, "isEqualToString:", v12, (_QWORD)v20) & 1) != 0)
              {
                v19 = v13;
                goto LABEL_17;
              }
              ++v17;
            }
            while (v15 != v17);
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
            if (v15)
              continue;
            break;
          }
        }

        objc_msgSend(v13, "arrayByAddingObject:", v12);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "willChangeValueForKey:", CFSTR("IntentsPerformed"));
        objc_msgSend(v7, "setObject:forKey:", v19, CFSTR("IntentsPerformed"));
        objc_msgSend(v7, "didChangeValueForKey:", CFSTR("IntentsPerformed"));
LABEL_17:

      }
    }
  }

}

- (void)elementAction:(id)a3 wantsViewControllerDisplayed:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[NTKFaceView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "faceViewWantsToPresentViewController:", v5);

}

- (void)elementAction:(id)a3 wantsToPerformTapActionForComplicationSlot:(id)a4
{
  id v4;

  -[NTKFaceView detachedComplicationDisplayWrapperForSlot:](self, "detachedComplicationDisplayWrapperForSlot:", a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performTap");

}

- (id)intentActionWantsBackgroundImageForAlert:(id)a3
{
  return self->_cellContentBackground;
}

- (id)intentActionWantsViewToBlurForAlert:(id)a3
{
  return 0;
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  double v8;
  void *v9;
  UIView *scalableView;
  CGAffineTransform v11;
  CGAffineTransform v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NTKUpNextFaceView;
  -[NTKFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v13, sel__applyBreathingFraction_forCustomEditMode_slot_, a4, a5);
  if (a4 != 10)
  {
    v8 = NTKLargeElementScaleForBreathingFraction(a3);
    memset(&v12, 0, sizeof(v12));
    CGAffineTransformMakeScale(&v12, v8, v8);
    -[NTKFaceView foregroundContainerView](self, "foregroundContainerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v12;
    objc_msgSend(v9, "setTransform:", &v11);

    scalableView = self->_scalableView;
    v11 = v12;
    -[UIView setTransform:](scalableView, "setTransform:", &v11);
  }
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  double v8;
  void *v9;
  UIView *scalableView;
  double v11;
  void *v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NTKUpNextFaceView;
  -[NTKFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v15, sel__applyRubberBandingFraction_forCustomEditMode_slot_, a4, a5);
  if (a4)
  {
    v8 = NTKScaleForRubberBandingFraction(a3);
    memset(&v14, 0, sizeof(v14));
    CGAffineTransformMakeScale(&v14, v8, v8);
    -[NTKFaceView foregroundContainerView](self, "foregroundContainerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v14;
    objc_msgSend(v9, "setTransform:", &v13);

    scalableView = self->_scalableView;
    v13 = v14;
    -[UIView setTransform:](scalableView, "setTransform:", &v13);
    v11 = NTKAlphaForRubberBandingFraction(a3);
    -[NTKFaceView foregroundContainerView](self, "foregroundContainerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAlpha:", v11);

    -[UIView setAlpha:](self->_scalableView, "setAlpha:", v11);
  }
}

- (void)_setSiriBlurColor
{
  void *v3;
  UIImage *v4;
  UIImage *cellContentBackground;
  NTKUpNextCollectionViewFlowLayout *layout;
  void *v7;
  int v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  -[NTKFaceView faceColorPalette](self, "faceColorPalette");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SiriBlurImageForColor(v3);
  v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
  cellContentBackground = self->_cellContentBackground;
  self->_cellContentBackground = v4;

  layout = self->_layout;
  -[NTKFaceView faceColorPalette](self, "faceColorPalette");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSiriColor");
  v9 = 0.25;
  if (v8)
    v9 = 0.5;
  -[NTKUpNextCollectionViewFlowLayout setMaximumDarkeningAmount:](layout, "setMaximumDarkeningAmount:", v9);

  -[NTKFaceView faceColorPalette](self, "faceColorPalette");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "isSiriColor");

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceView setInterpolatedComplicationColor:](self, "setInterpolatedComplicationColor:", v11);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKFaceView setComplicationColor:](self, "setComplicationColor:", v12);

}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a6 == 10)
  {
    CLKCompressFraction();
    v9 = v8;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[NTKUpNextCollectionView visibleCells](self->_collectionView, "visibleCells", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v14);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v16 = v15;
            -[NTKFaceView interpolatedColorPalette](self, "interpolatedColorPalette");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[NTKUpNextFaceView _applyTransitionWithFraction:interpolatedPalette:onCell:](self, "_applyTransitionWithFraction:interpolatedPalette:onCell:", v17, v16, v9);

          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

  }
}

- (void)_prepareForEditing
{
  UIView *scalableView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKUpNextFaceView;
  -[NTKFaceView _prepareForEditing](&v5, sel__prepareForEditing);
  scalableView = self->_scalableView;
  -[NTKFaceView timeView](self, "timeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](scalableView, "addSubview:", v4);

}

- (void)_cleanupAfterEditing
{
  void *v3;
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
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)NTKUpNextFaceView;
  -[NTKFaceView _cleanupAfterEditing](&v14, sel__cleanupAfterEditing);
  -[NTKFaceView timeView](self, "timeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextFaceView addSubview:](self, "addSubview:", v3);

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NTKUpNextCollectionView visibleCells](self->_collectionView, "visibleCells", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
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
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v9, "enumerateContentsLayersWithBlock:", &__block_literal_global_176);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }

}

uint64_t __41__NTKUpNextFaceView__cleanupAfterEditing__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAnimationForKey:", CFSTR("colorTransition"));
}

- (void)_applyTransitionWithFraction:(double)a3 interpolatedPalette:(id)a4 onCell:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v7 = a5;
  v8 = a4;
  objc_msgSend(v8, "fromPalette");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SiriBlurImageForColor(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "toPalette");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  SiriBlurImageForColor(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "enumerateContentsLayersWithBlock:", &__block_literal_global_179);
  if (a3 > 1.0 || fabs(a3 + -1.0) < 2.22044605e-16)
  {
    objc_msgSend(v7, "setContentImage:animated:", v12, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("contents"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDuration:", 1.0);
    LODWORD(v14) = 0;
    objc_msgSend(v13, "setSpeed:", v14);
    objc_msgSend(v13, "setToValue:", objc_msgSend(objc_retainAutorelease(v12), "CGImage"));
    objc_msgSend(v13, "setFromValue:", objc_msgSend(objc_retainAutorelease(v10), "CGImage"));
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTimingFunction:", v15);

    objc_msgSend(v13, "setBeginTime:", CACurrentMediaTime());
    objc_msgSend(v13, "setTimeOffset:", a3);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __77__NTKUpNextFaceView__applyTransitionWithFraction_interpolatedPalette_onCell___block_invoke_2;
    v17[3] = &unk_1E6BCE010;
    v18 = v13;
    v16 = v13;
    objc_msgSend(v7, "enumerateContentsLayersWithBlock:", v17);

  }
}

uint64_t __77__NTKUpNextFaceView__applyTransitionWithFraction_interpolatedPalette_onCell___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAnimationForKey:", CFSTR("colorTransition"));
}

uint64_t __77__NTKUpNextFaceView__applyTransitionWithFraction_interpolatedPalette_onCell___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addAnimation:forKey:", *(_QWORD *)(a1 + 32), CFSTR("colorTransition"));
}

- (unint64_t)_timeLabelOptions
{
  return 1;
}

- (id)_digitalTimeLabelStyleFromViewMode:(int64_t)a3 faceBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  NTKDigitalTimeLabelStyle *v11;
  NTKDigitalTimeLabelStyle **p_timeLabelSmallInUpperRightCornerStyle;
  NTKDigitalTimeLabelStyle *timeLabelSmallInUpperRightCornerStyle;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  NTKDigitalTimeLabelStyle *v20;
  double v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  CGRect v37;
  CGRect v38;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v36 = 0;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v25 = 0u;
  -[NTKFaceView device](self, "device", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_0(v10, &v24);

  if ((unint64_t)(a3 - 2) < 2)
  {
    p_timeLabelSmallInUpperRightCornerStyle = &self->_timeLabelSmallInUpperRightCornerStyle;
    timeLabelSmallInUpperRightCornerStyle = self->_timeLabelSmallInUpperRightCornerStyle;
    if (!timeLabelSmallInUpperRightCornerStyle)
    {
      objc_msgSend(MEMORY[0x1E0C944D0], "compactSoftFontOfSize:weight:", *(double *)&v26, *MEMORY[0x1E0DC1448]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (*((double *)&v35 + 1) > 0.0)
      {
        v37.origin.x = x;
        v37.origin.y = y;
        v37.size.width = width;
        v37.size.height = height;
        v38 = CGRectInset(v37, *((double *)&v35 + 1) * 0.5, 0.0);
        x = v38.origin.x;
        y = v38.origin.y;
        width = v38.size.width;
        height = v38.size.height;
      }
      v21 = *(double *)&v28;
      -[NTKFaceView device](self, "device");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKDigitalTimeLabelStyle smallInUpperRightCornerStyleForBounds:withBaselineY:withFont:forDevice:](NTKDigitalTimeLabelStyle, "smallInUpperRightCornerStyleForBounds:withBaselineY:withFont:forDevice:", v14, v15, x, y, width, height, v21);
      v22 = objc_claimAutoreleasedReturnValue();
      v18 = *p_timeLabelSmallInUpperRightCornerStyle;
      *p_timeLabelSmallInUpperRightCornerStyle = (NTKDigitalTimeLabelStyle *)v22;
      goto LABEL_9;
    }
  }
  else
  {
    if ((unint64_t)a3 > 1)
      return v11;
    p_timeLabelSmallInUpperRightCornerStyle = &self->_timeLabelDefaultStyle;
    timeLabelSmallInUpperRightCornerStyle = self->_timeLabelDefaultStyle;
    if (!timeLabelSmallInUpperRightCornerStyle)
    {
      objc_msgSend(MEMORY[0x1E0C944D0], "compactSoftFontOfSize:weight:", *((double *)&v25 + 1), *MEMORY[0x1E0DC1438]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKFaceView device](self, "device");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = NTKDigitalTimeLabelStyleWideRightSideMargin(v15);
      v17 = *((double *)&v27 + 1);
      -[NTKFaceView device](self, "device");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKDigitalTimeLabelStyle defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:](NTKDigitalTimeLabelStyle, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:", 1, v14, v18, x, y, width, height, v16, v17);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = *p_timeLabelSmallInUpperRightCornerStyle;
      *p_timeLabelSmallInUpperRightCornerStyle = (NTKDigitalTimeLabelStyle *)v19;

LABEL_9:
      timeLabelSmallInUpperRightCornerStyle = *p_timeLabelSmallInUpperRightCornerStyle;
    }
  }
  v11 = timeLabelSmallInUpperRightCornerStyle;
  return v11;
}

- (id)_swatchImageForColorOption:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  objc_super v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  objc_msgSend(v7, "pigmentEditOption");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  -[NTKFaceView faceColorPalette](self, "faceColorPalette");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __53__NTKUpNextFaceView__swatchImageForColorOption_size___block_invoke;
  v16[3] = &unk_1E6BCE038;
  v16[4] = &v17;
  objc_msgSend(v9, "executeWithOption:block:", v8, v16);

  v10 = (void *)v18[5];
  if (!v10)
  {
    v15.receiver = self;
    v15.super_class = (Class)NTKUpNextFaceView;
    -[NTKFaceView _swatchImageForColorOption:size:](&v15, sel__swatchImageForColorOption_size_, v8, width, height);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v18[5];
    v18[5] = v11;

    v10 = (void *)v18[5];
  }
  v13 = v10;
  _Block_object_dispose(&v17, 8);

  return v13;
}

void __53__NTKUpNextFaceView__swatchImageForColorOption_size___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (objc_msgSend(a2, "isSiriColor"))
  {
    NTKImageNamed(CFSTR("SiriColorSwatch"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotSnapshot, 0);
  objc_storeStrong(&self->_modeTransitionCompletion, 0);
  objc_storeStrong(&self->_modeTransitionApplier, 0);
  objc_storeStrong((id *)&self->_dwellIndexPathes, 0);
  objc_storeStrong((id *)&self->_applicationIdentifierUpdateScheduler, 0);
  objc_storeStrong((id *)&self->_currentApplicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_reloadedElements, 0);
  objc_storeStrong((id *)&self->_scalableView, 0);
  objc_storeStrong((id *)&self->_timeLabelPlatter, 0);
  objc_storeStrong((id *)&self->_cellContentBackground, 0);
  objc_storeStrong((id *)&self->_complicationDisplays, 0);
  objc_storeStrong((id *)&self->_buttonPressTimer, 0);
  objc_storeStrong((id *)&self->_wheelDelayTimer, 0);
  objc_storeStrong((id *)&self->_wakeWheelTimer, 0);
  objc_storeStrong((id *)&self->_positiveDwellForTopElementsTimer, 0);
  objc_storeStrong((id *)&self->_viewResetTimer, 0);
  objc_storeStrong((id *)&self->_viewModeTapGesture, 0);
  objc_storeStrong((id *)&self->_engineController, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_collectionViewDataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_utilityComplicationFactory, 0);
  objc_storeStrong((id *)&self->_timeLabelSmallInUpperRightCornerStyle, 0);
  objc_storeStrong((id *)&self->_timeLabelDefaultStyle, 0);
}

- (void)updateCollectionViewSnapshotAnimated:(os_log_t)log completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B72A3000, log, OS_LOG_TYPE_FAULT, "NTKUpNextUpdateOffMainThread: UpNext updates need to occur on the main queue", v1, 2u);
}

@end
