@implementation MKMapItemView

- (MKMapItemView)initWithFrame:(CGRect)a3
{
  MKMapItemView *v3;
  MKMapItemView *v4;
  NSObject *v5;
  void *v6;
  id v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)MKMapItemView;
  v3 = -[MKMapItemView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_shouldResolveMapItem = 1;
    MKGetMKMapItemViewLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v4->_signpostID = os_signpost_id_generate(v5);

    v10[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)-[MKMapItemView registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v6, sel_traitEnvironment_didChangeTraitCollection_);

  }
  return v4;
}

- (void)infoCardThemeChanged
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MKMapItemView;
  -[UIView infoCardThemeChanged](&v11, sel_infoCardThemeChanged);
  -[UIView mk_theme](self, "mk_theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "separatorLineColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "CGColor");
  -[MKLookAroundContainerView layer](self->_lookAroundContainerView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBorderColor:", v5);

  -[UIView mk_theme](self, "mk_theme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "separatorLineColor");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "CGColor");
  -[MKMapSnapshotView layer](self->_snapshotView, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBorderColor:", v9);

}

- (void)setShouldShowBorders:(BOOL)a3
{
  if (self->_shouldShowBorders != a3)
  {
    self->_shouldShowBorders = a3;
    -[MKMapItemView _updateBorders](self, "_updateBorders");
  }
}

- (void)_updateBorders
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  id v12;

  if (self->_shouldShowBorders)
  {
    -[MKMapItemView window](self, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "screen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "nativeScale");
      v7 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "nativeScale");
      v7 = v10;

    }
    if (v7 <= 1.0)
      v8 = 1.0;
    else
      v8 = 1.0 / v7;
  }
  else
  {
    v8 = 0.0;
  }
  -[MKLookAroundContainerView layer](self->_lookAroundContainerView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBorderWidth:", v8);

  -[MKMapSnapshotView layer](self->_snapshotView, "layer");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBorderWidth:", v8);

}

- (void)loadMapItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MKMapItemView bounds](self, "bounds");
  +[MKMapCamera cameraLookingAtMapItem:forViewSize:allowPitch:](MKMapCamera, "cameraLookingAtMapItem:forViewSize:allowPitch:", v6, 1, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  MKGetMKMapItemViewLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    _MKDebugNameForMapItem(v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138478083;
    v15 = v12;
    v16 = 2113;
    v17 = v13;
    _os_log_impl(&dword_18B0B0000, v11, OS_LOG_TYPE_INFO, "BEGIN loadMapItem: \"%{private}@\" camera: %{private}@", (uint8_t *)&v14, 0x16u);

  }
  -[MKMapItemView _loadMapItem:camera:coordinateSpan:completionHandler:](self, "_loadMapItem:camera:coordinateSpan:completionHandler:", v6, v10, v7, NAN, NAN);

}

- (void)loadMapItem:(id)a3 coordinateSpan:(id)a4 completionHandler:(id)a5
{
  double var1;
  double var0;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  var1 = a4.var1;
  var0 = a4.var0;
  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "_coordinate");
  v12 = v11;
  v14 = v13;
  MKGetMKMapItemViewLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    _MKDebugNameForMapItem(v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), v12, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("<center:%@ span:%+.8f, %+.8f>"), v18, *(_QWORD *)&var0, *(_QWORD *)&var1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    *(_DWORD *)buf = 138478083;
    v21 = v16;
    v22 = 2113;
    v23 = v19;
    _os_log_impl(&dword_18B0B0000, v15, OS_LOG_TYPE_INFO, "BEGIN loadMapItem: \"%{private}@\" region: %{private}@", buf, 0x16u);

  }
  -[MKMapItemView _loadMapItem:camera:coordinateSpan:completionHandler:](self, "_loadMapItem:camera:coordinateSpan:completionHandler:", v9, 0, v10, var0, var1);

}

- (void)_loadMapItem:(id)a3 camera:(id)a4 coordinateSpan:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t signpostID;
  void *v18;
  id mapItemloadedCompletionHandler;
  double v20;
  double v21;
  _QWORD v22[4];
  id v23;
  id buf[2];

  var1 = a5.var1;
  var0 = a5.var0;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  MKGetMKMapItemViewLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v16, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "Load", (const char *)&unk_18B2CC343, (uint8_t *)buf, 2u);
  }

  v18 = (void *)MEMORY[0x18D778DB8](v14);
  mapItemloadedCompletionHandler = self->_mapItemloadedCompletionHandler;
  self->_mapItemloadedCompletionHandler = v18;

  if (-[MKMapItemView _areBoundsValid](self, "_areBoundsValid"))
  {
    if (v13 || var0 >= 0.0 && var0 <= 180.0 && var1 >= 0.0 && var1 <= 360.0)
    {
      self->_loadCalledOnce = 1;
      objc_storeStrong((id *)&self->_mapItem, a3);
      objc_storeStrong((id *)&self->_camera, a4);
      -[MKMapItemView _clampCoordinateSpan:](self, "_clampCoordinateSpan:", var0, var1);
      self->_coordinateSpan.latitudeDelta = v20;
      self->_coordinateSpan.longitudeDelta = v21;
      -[MKMapItemView cancel](self, "cancel");
      objc_initWeak(buf, self);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __70__MKMapItemView__loadMapItem_camera_coordinateSpan_completionHandler___block_invoke;
      v22[3] = &unk_1E20D8D18;
      objc_copyWeak(&v23, buf);
      -[MKMapItemView _takeSnapshotWithCompletionHandler:isReload:](self, "_takeSnapshotWithCompletionHandler:isReload:", v22, 0);
      -[MKMapItemView _getParentItem](self, "_getParentItem");
      objc_destroyWeak(&v23);
      objc_destroyWeak(buf);
    }
    else
    {
      -[MKMapItemView _callCompletionHandlerWithInvalidCoordinateSpanError](self, "_callCompletionHandlerWithInvalidCoordinateSpanError");
    }
  }
  else
  {
    -[MKMapItemView _callCompletionHandlerWithInvalidBoundsError](self, "_callCompletionHandlerWithInvalidBoundsError");
  }

}

void __70__MKMapItemView__loadMapItem_camera_coordinateSpan_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_takeSnapshotCompleted");

}

- (BOOL)_areBoundsValid
{
  double v3;
  double v4;

  -[MKMapItemView bounds](self, "bounds");
  if (v3 <= 0.0)
    return 0;
  -[MKMapItemView bounds](self, "bounds");
  return v4 > 0.0;
}

- (void)_callCompletionHandlerWithInvalidBoundsError
{
  id v3;
  NSString *v4;
  void *v5;
  NSError *v6;
  NSError *snapshotError;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v4 = MKErrorDomain;
  v8 = *MEMORY[0x1E0CB2938];
  v9[0] = CFSTR("Height or width cannot be zero");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSError *)objc_msgSend(v3, "initWithDomain:code:userInfo:", v4, 1, v5);
  snapshotError = self->_snapshotError;
  self->_snapshotError = v6;

  -[MKMapItemView _callCompletionHandler](self, "_callCompletionHandler");
}

- (void)_callCompletionHandlerWithInvalidCoordinateSpanError
{
  id v3;
  NSString *v4;
  void *v5;
  NSError *v6;
  NSError *snapshotError;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v4 = MKErrorDomain;
  v8 = *MEMORY[0x1E0CB2938];
  v9[0] = CFSTR("CoordinateSpan is invalid");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSError *)objc_msgSend(v3, "initWithDomain:code:userInfo:", v4, 1, v5);
  snapshotError = self->_snapshotError;
  self->_snapshotError = v6;

  -[MKMapItemView _callCompletionHandler](self, "_callCompletionHandler");
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_clampCoordinateSpan:(id)result
{
  BOOL v3;
  double var1;
  double var0;

  v3 = result.var0 >= 0.0;
  var1 = 0.02;
  if (result.var0 <= 0.0)
    var0 = 0.02;
  else
    var0 = result.var0;
  if (result.var0 > 180.0)
    v3 = 0;
  if (result.var1 < 0.0)
    v3 = 0;
  if (result.var1 > 0.0)
    var1 = result.var1;
  if (v3 && result.var1 <= 360.0)
  {
    result.var0 = var0;
    result.var1 = var1;
  }
  return result;
}

- (void)_getParentItem
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  MKMapItem *mapItem;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (-[MKMapItem _hasLookAroundStorefront](self->_mapItem, "_hasLookAroundStorefront"))
  {
    -[MKMapItemView _fetchLookAroundViewforMapItem:](self, "_fetchLookAroundViewforMapItem:", self->_mapItem);
  }
  else if (-[MKMapItemView shouldResolveMapItem](self, "shouldResolveMapItem"))
  {
    -[MKMapItem _identifier](self->_mapItem, "_identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 == 0;

    +[MKMapService sharedService](MKMapService, "sharedService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    mapItem = self->_mapItem;
    if (v4)
    {
      -[MKMapItem _coordinate](mapItem, "_coordinate");
      objc_msgSend(v5, "ticketForReverseGeocodeCoordinate:traits:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[MKMapItem _identifier](mapItem, "_identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ticketForIdentifiers:traits:", v8, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __31__MKMapItemView__getParentItem__block_invoke;
    v10[3] = &unk_1E20D8438;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v9, "submitWithHandler:networkActivity:", v10, 0);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
}

void __31__MKMapItemView__getParentItem__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 || !objc_msgSend(v5, "count"))
  {
    MKGetMKMapItemViewLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_18B0B0000, v7, OS_LOG_TYPE_ERROR, "Unable to resolve MapItem %@", (uint8_t *)&v10, 0xCu);
    }

    v8 = 0;
  }
  else
  {
    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_fetchLookAroundViewforMapItem:", v8);

}

- (void)_fetchLookAroundViewforMapItem:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t signpostID;
  MKLookAroundContainerView *v13;
  MKLookAroundContainerView *lookAroundContainerView;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMuninEnabled");
  if (!v4 || !v6)
  {
LABEL_11:

    goto LABEL_12;
  }
  v7 = objc_msgSend(v4, "_hasLookAroundStorefront");

  if (v7 && !self->_hideLookAroundView)
  {
    MKGetMKMapItemViewLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      _MKDebugNameForMapItem(v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138477827;
      v17 = v9;
      _os_log_impl(&dword_18B0B0000, v8, OS_LOG_TYPE_INFO, "BEGIN _fetchLookAroundViewforMapItem: \"%{private}@\", (uint8_t *)&v16, 0xCu);

    }
    MKGetMKMapItemViewLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    signpostID = self->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      LOWORD(v16) = 0;
      _os_signpost_emit_with_name_impl(&dword_18B0B0000, v11, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "LoadLookAround", (const char *)&unk_18B2CC343, (uint8_t *)&v16, 2u);
    }

    v13 = objc_alloc_init(MKLookAroundContainerView);
    lookAroundContainerView = self->_lookAroundContainerView;
    self->_lookAroundContainerView = v13;

    -[MKLookAroundContainerView setMapItem:](self->_lookAroundContainerView, "setMapItem:", v4);
    -[MKLookAroundContainerView setClipsToBounds:](self->_lookAroundContainerView, "setClipsToBounds:", 1);
    -[MKLookAroundContainerView layer](self->_lookAroundContainerView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCornerRadius:", 8.0);

    -[MKLookAroundContainerView setTranslatesAutoresizingMaskIntoConstraints:](self->_lookAroundContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MKLookAroundContainerView setHidden:](self->_lookAroundContainerView, "setHidden:", 1);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__handleTapOnLookAroundView_);
    -[MKLookAroundContainerView addGestureRecognizer:](self->_lookAroundContainerView, "addGestureRecognizer:", v5);
    -[MKMapItemView addSubview:](self, "addSubview:", self->_lookAroundContainerView);
    -[MKMapItemView _setupLookAroundConstraints](self, "_setupLookAroundConstraints");
    -[MKMapItemView _setupObserver](self, "_setupObserver");
    -[MKMapItemView infoCardThemeChanged](self, "infoCardThemeChanged");
    -[MKMapItemView _updateBorders](self, "_updateBorders");
    goto LABEL_11;
  }
LABEL_12:

}

- (void)_takeSnapshotWithCompletionHandler:(id)a3 isReload:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  CGFloat v7;
  CGFloat v8;
  MKMapSnapshotView *v9;
  MKMapSnapshotView *snapshotView;
  void *v11;
  void *v12;
  NSObject *v13;
  const __CFString *v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t signpostID;
  void *v18;
  void *v19;
  MKMapSnapshotView *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25[2];
  BOOL v26;
  id location;
  uint8_t buf[4];
  const __CFString *v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MKMapItemView bounds](self, "bounds");
  self->_sizeWhenLastLoaded.width = v7;
  self->_sizeWhenLastLoaded.height = v8;
  if (!self->_snapshotView)
  {
    v9 = objc_alloc_init(MKMapSnapshotView);
    snapshotView = self->_snapshotView;
    self->_snapshotView = v9;

    -[MKMapSnapshotView setClipsToBounds:](self->_snapshotView, "setClipsToBounds:", 1);
    -[MKMapSnapshotView layer](self->_snapshotView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCornerRadius:", 8.0);

    -[MKMapSnapshotView setHidden:](self->_snapshotView, "setHidden:", 1);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__handleTapOnSnapshot_);
    -[MKMapSnapshotView addGestureRecognizer:](self->_snapshotView, "addGestureRecognizer:", v12);
    -[MKMapItemView addSubview:](self, "addSubview:", self->_snapshotView);
    -[MKMapItemView _setupSnapshotConstraints](self, "_setupSnapshotConstraints");
    -[MKMapItemView infoCardThemeChanged](self, "infoCardThemeChanged");
    -[MKMapItemView _updateBorders](self, "_updateBorders");

  }
  -[MKMapItemView _resetAttributionViewState](self, "_resetAttributionViewState");
  if (self->_shouldShowMapAttribution)
    -[MKMapItemView _addAttributionViews](self, "_addAttributionViews");
  objc_initWeak(&location, self);
  MKGetMKMapItemViewLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = CFSTR("NO");
    if (v4)
      v14 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v29 = v14;
    _os_log_impl(&dword_18B0B0000, v13, OS_LOG_TYPE_INFO, "BEGIN _takeSnapshotWithCompletionHandler:isReload: %@", buf, 0xCu);
  }

  MKGetMKMapItemViewLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v16, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "MapSnapshot", (const char *)&unk_18B2CC343, buf, 2u);
  }

  if (v4)
  {
    -[MKMapItemView _deriveSnapshotOptions:](self, "_deriveSnapshotOptions:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  v19 = (void *)self->_signpostID;
  v20 = self->_snapshotView;
  -[MKMapItemView _deriveSnapshotOptions:](self, "_deriveSnapshotOptions:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __61__MKMapItemView__takeSnapshotWithCompletionHandler_isReload___block_invoke;
  v23[3] = &unk_1E20DC200;
  objc_copyWeak(v25, &location);
  v26 = v4;
  v25[1] = v19;
  v22 = v6;
  v24 = v22;
  -[MKMapSnapshotView takeSnapshotWithOptions:gridOptions:completionHandler:](v20, "takeSnapshotWithOptions:gridOptions:completionHandler:", v21, v18, v23);

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);

}

void __61__MKMapItemView__takeSnapshotWithCompletionHandler_isReload___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id *WeakRetained;
  id *v6;
  NSObject *v7;
  const __CFString *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  const __CFString *v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  uint64_t v17;
  int v18;
  const __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 66, a2);
    if (!v4)
    {
      objc_msgSend(v6[59], "setHidden:", 0);
      goto LABEL_9;
    }
  }
  else if (!v4)
  {
LABEL_9:
    MKGetMKMapItemViewLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      if (*(_BYTE *)(a1 + 56))
        v13 = CFSTR("YES");
      else
        v13 = CFSTR("NO");
      v18 = 138412290;
      v19 = v13;
      v9 = "END _takeSnapshotWithCompletionHandler:isReload: %@ didCompleteSuccessfully";
      v10 = v7;
      v11 = OS_LOG_TYPE_INFO;
      v12 = 12;
LABEL_14:
      _os_log_impl(&dword_18B0B0000, v10, v11, v9, (uint8_t *)&v18, v12);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  MKGetMKMapItemViewLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = CFSTR("YES");
    if (!*(_BYTE *)(a1 + 56))
      v8 = CFSTR("NO");
    v18 = 138412546;
    v19 = v8;
    v20 = 2112;
    v21 = v4;
    v9 = "END _takeSnapshotWithCompletionHandler:isReload: %@ didCompleteWithError: %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
    goto LABEL_14;
  }
LABEL_15:

  MKGetMKMapItemViewLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = *(_QWORD *)(a1 + 48);
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v15, OS_SIGNPOST_INTERVAL_END, v16, "MapSnapshot", (const char *)&unk_18B2CC343, (uint8_t *)&v18, 2u);
  }

  v17 = *(_QWORD *)(a1 + 32);
  if (v17)
    (*(void (**)(uint64_t, id))(v17 + 16))(v17, v4);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MKMapItemView;
  -[MKMapItemView layoutSubviews](&v8, sel_layoutSubviews);
  if (self->_loadCalledOnce)
  {
    -[MKMapItemView bounds](self, "bounds");
    if (v4 != self->_sizeWhenLastLoaded.width || v3 != self->_sizeWhenLastLoaded.height)
    {
      -[MKMapItemView bounds](self, "bounds");
      if (v6 != 0.0)
      {
        -[MKMapItemView bounds](self, "bounds");
        if (v7 != 0.0)
        {
          -[MKMapSnapshotView setHidden:](self->_snapshotView, "setHidden:", 1);
          -[MKMapSnapshotView cancel](self->_snapshotView, "cancel");
          +[MKMapItemView cancelPreviousPerformRequestsWithTarget:selector:object:](MKMapItemView, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__reloadSnapshot, 0);
          -[MKMapItemView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__reloadSnapshot, 0, 0.1);
        }
      }
    }
  }
}

- (id)_deriveSnapshotOptions:(BOOL)a3
{
  _BOOL4 v3;
  MKMapSnapshotOptions *v5;
  MKMapSnapshotOptions *v6;
  MKStandardMapConfiguration *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  _QWORD v14[2];

  v3 = a3;
  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MKMapSnapshotOptions);
  v6 = v5;
  if (v3)
  {
    -[MKMapSnapshotOptions setMapType:](v5, "setMapType:", 105);
  }
  else
  {
    v7 = -[MKStandardMapConfiguration initWithElevationStyle:]([MKStandardMapConfiguration alloc], "initWithElevationStyle:", 1);
    -[MKMapSnapshotOptions setPreferredConfiguration:](v6, "setPreferredConfiguration:", v7);
    -[MKMapItemView _customAnnotation](self, "_customAnnotation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapSnapshotOptions _setCustomFeatureAnnotations:](v6, "_setCustomFeatureAnnotations:", v9);

  }
  if (self->_camera)
  {
    -[MKMapSnapshotOptions setCamera:](v6, "setCamera:");
  }
  else
  {
    -[MKMapItem _coordinate](self->_mapItem, "_coordinate");
    -[MKMapSnapshotOptions setRegion:](v6, "setRegion:");
  }
  -[MKMapItemView bounds](self, "bounds");
  -[MKMapSnapshotOptions setSize:](v6, "setSize:", v10, v11);
  -[MKMapItemView traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapSnapshotOptions setTraitCollection:](v6, "setTraitCollection:", v12);

  -[MKMapSnapshotOptions _setSearchResultsType:](v6, "_setSearchResultsType:", 1);
  -[MKMapSnapshotOptions _setShowsAppleLogo:](v6, "_setShowsAppleLogo:", 0);
  -[MKMapSnapshotOptions _setAuditToken:](v6, "_setAuditToken:", self->_auditToken);
  return v6;
}

- (id)_customAnnotation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _MKAnnotationViewCustomFeatureAnnotation *v8;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC64D8]);
  -[MKMapItem _coordinate](self->_mapItem, "_coordinate");
  v4 = (void *)objc_msgSend(v3, "initWithCoordinate:");
  -[MKMapItem name](self->_mapItem, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:locale:", v5, 0);

  -[MKMapItem _styleAttributes](self->_mapItem, "_styleAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0D270A8], "markerStyleAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = xmmword_18B2A9E60;
  objc_msgSend(v7, "replaceAttributes:count:", &v10, 2);
  objc_msgSend(v4, "setStyleAttributes:", v7);
  v8 = objc_alloc_init(_MKAnnotationViewCustomFeatureAnnotation);
  -[MKMapItem _coordinate](self->_mapItem, "_coordinate");
  -[_MKAnnotationViewCustomFeatureAnnotation setCoordinate:](v8, "setCoordinate:");
  -[_MKAnnotationViewCustomFeatureAnnotation setCustomFeature:](v8, "setCustomFeature:", v4);

  return v8;
}

- (id)_annotationView
{
  MKPointAnnotation *v3;
  void *v4;
  MKMarkerAnnotationView *v5;
  void *v6;

  v3 = objc_alloc_init(MKPointAnnotation);
  -[MKMapItem _coordinate](self->_mapItem, "_coordinate");
  -[MKPointAnnotation setCoordinate:](v3, "setCoordinate:");
  -[MKMapItem name](self->_mapItem, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKShape setTitle:](v3, "setTitle:", v4);

  v5 = -[MKMarkerAnnotationView initWithAnnotation:reuseIdentifier:]([MKMarkerAnnotationView alloc], "initWithAnnotation:reuseIdentifier:", v3, 0);
  -[MKMapItem _styleAttributes](self->_mapItem, "_styleAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMarkerAnnotationView _setStyleAttributes:](v5, "_setStyleAttributes:", v6);

  return v5;
}

- (void)_handleTapOnSnapshot:(id)a3
{
  -[MKMapItem openInMapsWithLaunchOptions:completionHandler:](self->_mapItem, "openInMapsWithLaunchOptions:completionHandler:", 0, &__block_literal_global_72);
}

void __38__MKMapItemView__handleTapOnSnapshot___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  NSObject *v7;
  os_log_type_t v8;
  __int16 v9;
  __int16 v10;

  MKGetMKMapItemViewLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (a2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v10 = 0;
      v5 = "Punch into Maps successful";
      v6 = (uint8_t *)&v10;
      v7 = v4;
      v8 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_18B0B0000, v7, v8, v5, v6, 2u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v9 = 0;
    v5 = "Punch into Maps was not successful";
    v6 = (uint8_t *)&v9;
    v7 = v4;
    v8 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

}

- (void)_handleTapOnAttribution:(id)a3
{
  id v4;

  if (self->_attributionURL)
  {
    +[MKSystemController sharedInstance](MKSystemController, "sharedInstance", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "openURL:completionHandler:", self->_attributionURL, 0);

  }
}

- (void)_handleTapOnLookAroundView:(id)a3
{
  id v3;

  -[MKLookAroundContainerView lookAroundViewIfPresent](self->_lookAroundContainerView, "lookAroundViewIfPresent", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openInMapsWithCompletionHandler:", 0);

}

- (void)_setupObserver
{
  void *v3;
  id v4;

  -[MKLookAroundContainerView lookAroundViewIfPresent](self->_lookAroundContainerView, "lookAroundViewIfPresent");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__receivedFullyDrawnNotification_, CFSTR("MKLookAroundViewDidBecomeFullyDrawn"), v4);

  }
}

- (void)_receivedFullyDrawnNotification:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t signpostID;
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[MKLookAroundContainerView lookAroundViewIfPresent](self->_lookAroundContainerView, "lookAroundViewIfPresent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isLoading");

  MKGetMKMapItemViewLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_18B0B0000, v8, OS_LOG_TYPE_ERROR, "Received fully-drawn notification, but view still claims to be loading", v11, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B0B0000, v8, OS_LOG_TYPE_INFO, "END _fetchLookAroundViewforMapItem: (Received fully-drawn notification)", buf, 2u);
    }

    MKGetMKMapItemViewLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v8 = v9;
    signpostID = self->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_18B0B0000, v8, OS_SIGNPOST_INTERVAL_END, signpostID, "LoadLookAround", (const char *)&unk_18B2CC343, v12, 2u);
    }
  }

}

- (void)_setupLookAroundConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  NSMutableArray *lookAroundConstraints;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[7];

  v23[6] = *MEMORY[0x1E0C80C00];
  v16 = (void *)MEMORY[0x1E0C99DE8];
  -[MKLookAroundContainerView topAnchor](self->_lookAroundContainerView, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapItemView topAnchor](self, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintGreaterThanOrEqualToAnchor:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v20;
  -[MKLookAroundContainerView bottomAnchor](self->_lookAroundContainerView, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapItemView bottomAnchor](self, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v18, -8.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v17;
  -[MKLookAroundContainerView leadingAnchor](self->_lookAroundContainerView, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapItemView leadingAnchor](self, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v14, 8.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v13;
  -[MKLookAroundContainerView widthAnchor](self->_lookAroundContainerView, "widthAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToConstant:", 124.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v4;
  -[MKLookAroundContainerView heightAnchor](self->_lookAroundContainerView, "heightAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToConstant:", 91.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v6;
  -[MKLookAroundContainerView trailingAnchor](self->_lookAroundContainerView, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapItemView trailingAnchor](self, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintLessThanOrEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "arrayWithArray:", v10);
  v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  lookAroundConstraints = self->_lookAroundConstraints;
  self->_lookAroundConstraints = v11;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_lookAroundConstraints);
}

- (void)_addTapRecognizerForAttributionView:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0CEAA88];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithTarget:action:", self, sel__handleTapOnAttribution_);
  objc_msgSend(v5, "addGestureRecognizer:", v6);

}

- (void)_addAttributionViews
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  UIImageView *v7;
  UIImageView *attributionBadgeView;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  _BOOL8 v17;
  MKAppleLogoLabel *v18;
  MKAppleLogoLabel *attributionAppleLogo;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSURL *v31;
  NSURL *attributionURL;
  MKAttributionLabel *v33;
  MKAttributionLabel *attributionLabel;
  double v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  UIImageView *v49;
  _QWORD v50[4];
  _QWORD v51[2];
  _QWORD v52[3];

  v52[2] = *MEMORY[0x1E0C80C00];
  if (self->_snapshotView)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKMapAttributionImage badgeImageForView:](MKMapAttributionImage, "badgeImageForView:", self);
    v4 = objc_claimAutoreleasedReturnValue();
    v48 = (void *)v4;
    if (v4)
    {
      v5 = (void *)v4;
      v6 = objc_alloc(MEMORY[0x1E0CEA658]);
      v7 = (UIImageView *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      attributionBadgeView = self->_attributionBadgeView;
      self->_attributionBadgeView = v7;

      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_attributionBadgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIImageView setImage:](self->_attributionBadgeView, "setImage:", v5);
      -[MKMapSnapshotView addSubview:](self->_snapshotView, "addSubview:", self->_attributionBadgeView);
      v49 = self->_attributionBadgeView;
      -[UIImageView widthAnchor](self->_attributionBadgeView, "widthAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "size");
      objc_msgSend(v9, "constraintEqualToConstant:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = v10;
      -[UIImageView heightAnchor](self->_attributionBadgeView, "heightAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "size");
      objc_msgSend(v11, "constraintEqualToConstant:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v52[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v14);

      v15 = 10.0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEAB40], "currentTraitCollection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "userInterfaceStyle") == 2;

      v18 = -[MKAppleLogoLabel initForMapType:forDarkMode:alternativeStringDrawing:]([MKAppleLogoLabel alloc], "initForMapType:forDarkMode:alternativeStringDrawing:", 0, v17, 1);
      attributionAppleLogo = self->_attributionAppleLogo;
      self->_attributionAppleLogo = v18;

      -[MKAppleLogoLabel setTranslatesAutoresizingMaskIntoConstraints:](self->_attributionAppleLogo, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[MKMapSnapshotView addSubview:](self->_snapshotView, "addSubview:", self->_attributionAppleLogo);
      v49 = self->_attributionAppleLogo;
      v15 = 7.0;
    }
    v20 = v3;
    -[UIImageView leadingAnchor](v49, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapSnapshotView leadingAnchor](self->_snapshotView, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, 10.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v23;
    -[MKMapSnapshotView bottomAnchor](self->_snapshotView, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](v49, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, v15);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObjectsFromArray:", v27);

    objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activeTileGroup");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v20;
    -[MKMapItem _coordinate](self->_mapItem, "_coordinate");
    objc_msgSend(v29, "mapAttributionURLForCoordinate:");
    v31 = (NSURL *)objc_claimAutoreleasedReturnValue();
    attributionURL = self->_attributionURL;
    self->_attributionURL = v31;

    if (self->_attributionURL)
    {
      v33 = objc_alloc_init(MKAttributionLabel);
      attributionLabel = self->_attributionLabel;
      self->_attributionLabel = v33;

      -[MKAttributionLabel setMapType:](self->_attributionLabel, "setMapType:", 0);
      -[MKAttributionLabel sizeToFit](self->_attributionLabel, "sizeToFit");
      -[MKAttributionLabel setTranslatesAutoresizingMaskIntoConstraints:](self->_attributionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[MKMapSnapshotView addSubview:](self->_snapshotView, "addSubview:", self->_attributionLabel);
      -[MKMapItemView _addTapRecognizerForAttributionView:](self, "_addTapRecognizerForAttributionView:", self->_attributionLabel);
      -[MKAttributionLabel widthAnchor](self->_attributionLabel, "widthAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKAttributionLabel bounds](self->_attributionLabel, "bounds");
      objc_msgSend(v47, "constraintEqualToConstant:", v35);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = v46;
      -[MKAttributionLabel heightAnchor](self->_attributionLabel, "heightAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKAttributionLabel bounds](self->_attributionLabel, "bounds");
      objc_msgSend(v36, "constraintEqualToConstant:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v50[1] = v38;
      -[MKAttributionLabel leadingAnchor](self->_attributionLabel, "leadingAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView trailingAnchor](v49, "trailingAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40, 10.0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v50[2] = v41;
      -[MKMapSnapshotView bottomAnchor](self->_snapshotView, "bottomAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKAttributionLabel bottomAnchor](self->_attributionLabel, "bottomAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "constraintEqualToAnchor:constant:", v43, 10.0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v50[3] = v44;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 4);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addObjectsFromArray:", v45);

    }
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v30);

  }
}

- (void)setShouldShowMapAttribution:(BOOL)a3
{
  if (self->_shouldShowMapAttribution != a3)
  {
    self->_shouldShowMapAttribution = a3;
    -[MKMapItemView _resetAttributionViewState](self, "_resetAttributionViewState");
    if (self->_shouldShowMapAttribution)
      -[MKMapItemView _addAttributionViews](self, "_addAttributionViews");
  }
}

- (void)_setupSnapshotConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  NSMutableArray *snapshotConstraints;
  void *v13;
  void *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *snapshotWidthConstraint;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[MKMapSnapshotView topAnchor](self->_snapshotView, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapItemView topAnchor](self, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v17;
  -[MKMapSnapshotView trailingAnchor](self->_snapshotView, "trailingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapItemView trailingAnchor](self, "trailingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v6;
  -[MKMapSnapshotView heightAnchor](self->_snapshotView, "heightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapItemView heightAnchor](self, "heightAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v10);
  v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  snapshotConstraints = self->_snapshotConstraints;
  self->_snapshotConstraints = v11;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_snapshotConstraints);
  -[MKMapSnapshotView widthAnchor](self->_snapshotView, "widthAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapItemView widthAnchor](self, "widthAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  snapshotWidthConstraint = self->_snapshotWidthConstraint;
  self->_snapshotWidthConstraint = v15;

  -[NSLayoutConstraint setActive:](self->_snapshotWidthConstraint, "setActive:", 1);
}

- (void)_reloadSnapshot
{
  _QWORD v3[4];
  id v4;
  id location;

  if (-[MKMapItemView _areBoundsValid](self, "_areBoundsValid"))
  {
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __32__MKMapItemView__reloadSnapshot__block_invoke;
    v3[3] = &unk_1E20D8D18;
    objc_copyWeak(&v4, &location);
    -[MKMapItemView _takeSnapshotWithCompletionHandler:isReload:](self, "_takeSnapshotWithCompletionHandler:isReload:", v3, 1);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
  else
  {
    -[MKMapItemView _callCompletionHandlerWithInvalidBoundsError](self, "_callCompletionHandlerWithInvalidBoundsError");
  }
}

void __32__MKMapItemView__reloadSnapshot__block_invoke(uint64_t a1, uint64_t a2)
{
  id *v3;
  id *WeakRetained;
  id v5;
  id *v6;

  v3 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (!a2 && WeakRetained)
    objc_msgSend(WeakRetained[59], "setHidden:", 0);
  v5 = objc_loadWeakRetained(v3);
  objc_msgSend(v5, "_takeSnapshotCompleted");

}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v5 = a4;
  MKGetMKMapItemViewLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18B0B0000, v6, OS_LOG_TYPE_INFO, "BEGIN traitCollectionDidChange", buf, 2u);
  }

  if (self->_loadCalledOnce)
  {
    -[MKMapItemView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceStyle");
    if (v8 == objc_msgSend(v5, "userInterfaceStyle") || (-[MKMapItemView bounds](self, "bounds"), v9 == 0.0))
    {

    }
    else
    {
      -[MKMapItemView bounds](self, "bounds");
      v11 = v10;

      if (v11 != 0.0)
        -[MKMapItemView _reloadSnapshot](self, "_reloadSnapshot");
    }
  }
  MKGetMKMapItemViewLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_18B0B0000, v12, OS_LOG_TYPE_INFO, "END traitCollectionDidChange", v13, 2u);
  }

}

- (void)_takeSnapshotCompleted
{
  -[MKMapItemView _renderMapItem](self, "_renderMapItem");
  -[MKMapItemView _callCompletionHandler](self, "_callCompletionHandler");
}

- (void)_renderMapItem
{
  void *v3;
  void *v4;
  MKLookAroundContainerView *lookAroundContainerView;
  void *v6;
  MKLookAroundContainerView *v7;

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapItemView setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[MKMapSnapshotView image](self->_snapshotView, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    lookAroundContainerView = self->_lookAroundContainerView;

    if (lookAroundContainerView)
    {
      -[NSLayoutConstraint setActive:](self->_snapshotWidthConstraint, "setActive:", 0);
      -[MKLookAroundContainerView setHidden:](self->_lookAroundContainerView, "setHidden:", 0);
LABEL_7:
      -[MKMapSnapshotView setHidden:](self->_snapshotView, "setHidden:", 0);
      return;
    }
  }
  -[MKMapSnapshotView image](self->_snapshotView, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = self->_lookAroundContainerView;

    if (!v7)
      goto LABEL_7;
  }
}

- (void)_callCompletionHandler
{
  NSObject *v3;
  const __CFString *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t signpostID;
  void (**v8)(_QWORD, _QWORD);
  id mapItemloadedCompletionHandler;
  NSObject *v10;
  NSError *snapshotError;
  NSError *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_mapItemloadedCompletionHandler)
  {
    MKGetMKMapItemViewLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      if (self->_snapshotError)
        v4 = CFSTR("(with error)");
      else
        v4 = CFSTR("(with success)");
      v13 = 138412290;
      v14 = (void *)v4;
      _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_INFO, "END loadMapItem: %@", (uint8_t *)&v13, 0xCu);
    }

    MKGetMKMapItemViewLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    signpostID = self->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      LOWORD(v13) = 0;
      _os_signpost_emit_with_name_impl(&dword_18B0B0000, v6, OS_SIGNPOST_INTERVAL_END, signpostID, "Load", (const char *)&unk_18B2CC343, (uint8_t *)&v13, 2u);
    }

    v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x18D778DB8](self->_mapItemloadedCompletionHandler);
    mapItemloadedCompletionHandler = self->_mapItemloadedCompletionHandler;
    self->_mapItemloadedCompletionHandler = 0;

    if (self->_snapshotError)
    {
      MKGetMKMapItemViewLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        snapshotError = self->_snapshotError;
        v13 = 138412290;
        v14 = snapshotError;
        _os_log_impl(&dword_18B0B0000, v10, OS_LOG_TYPE_ERROR, "SnapshotError: %@", (uint8_t *)&v13, 0xCu);
      }

      v12 = self->_snapshotError;
    }
    else
    {
      v12 = 0;
    }
    ((void (**)(_QWORD, NSError *))v8)[2](v8, v12);

  }
}

- (void)cancel
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  MKGetMKMapItemViewLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_INFO, "BEGIN cancel", buf, 2u);
  }

  -[MKLookAroundContainerView cancelIfPresent](self->_lookAroundContainerView, "cancelIfPresent");
  -[MKMapSnapshotView cancel](self->_snapshotView, "cancel");
  -[MKMapItemView _resetState](self, "_resetState");
  MKGetMKMapItemViewLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18B0B0000, v4, OS_LOG_TYPE_INFO, "END cancel", v5, 2u);
  }

}

- (void)_resetState
{
  NSError *snapshotError;

  snapshotError = self->_snapshotError;
  self->_snapshotError = 0;

  -[MKMapSnapshotView setHidden:](self->_snapshotView, "setHidden:", 1);
  -[MKMapSnapshotView setImage:](self->_snapshotView, "setImage:", 0);
  -[NSLayoutConstraint setActive:](self->_snapshotWidthConstraint, "setActive:", 1);
  -[MKMapItemView _resetLookAroundContainerViewState](self, "_resetLookAroundContainerViewState");
  -[MKMapItemView _resetAttributionViewState](self, "_resetAttributionViewState");
  +[MKMapItemView cancelPreviousPerformRequestsWithTarget:selector:object:](MKMapItemView, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__reloadSnapshot, 0);
}

- (void)_resetLookAroundContainerViewState
{
  void *v3;
  void *v4;
  MKLookAroundContainerView *lookAroundContainerView;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLookAroundContainerView lookAroundViewIfPresent](self->_lookAroundContainerView, "lookAroundViewIfPresent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("MKLookAroundViewDidBecomeFullyDrawn"), v4);

  -[MKMapItemView removeConstraints:](self, "removeConstraints:", self->_lookAroundConstraints);
  -[MKLookAroundContainerView removeFromSuperview](self->_lookAroundContainerView, "removeFromSuperview");
  lookAroundContainerView = self->_lookAroundContainerView;
  self->_lookAroundContainerView = 0;

}

- (void)_resetAttributionViewState
{
  NSURL *attributionURL;
  MKAppleLogoLabel *attributionAppleLogo;
  MKAttributionLabel *attributionLabel;
  UIImageView *attributionBadgeView;

  attributionURL = self->_attributionURL;
  self->_attributionURL = 0;

  -[MKAppleLogoLabel removeFromSuperview](self->_attributionAppleLogo, "removeFromSuperview");
  attributionAppleLogo = self->_attributionAppleLogo;
  self->_attributionAppleLogo = 0;

  -[MKAttributionLabel removeFromSuperview](self->_attributionLabel, "removeFromSuperview");
  attributionLabel = self->_attributionLabel;
  self->_attributionLabel = 0;

  -[UIImageView removeFromSuperview](self->_attributionBadgeView, "removeFromSuperview");
  attributionBadgeView = self->_attributionBadgeView;
  self->_attributionBadgeView = 0;

}

- (void)triggerAnimation
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  MKGetMKMapItemViewLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_INFO, "BEGIN triggerAnimation", buf, 2u);
  }

  -[MKLookAroundContainerView lookAroundViewIfPresent](self->_lookAroundContainerView, "lookAroundViewIfPresent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "moveToCloseUpView");

  MKGetMKMapItemViewLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_18B0B0000, v5, OS_LOG_TYPE_INFO, "END triggerAnimation", v6, 2u);
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MKMapItemView;
  -[MKMapItemView dealloc](&v4, sel_dealloc);
}

- (BOOL)shouldResolveMapItem
{
  return self->_shouldResolveMapItem;
}

- (void)setShouldResolveMapItem:(BOOL)a3
{
  self->_shouldResolveMapItem = a3;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (BOOL)shouldShowBorders
{
  return self->_shouldShowBorders;
}

- (BOOL)hideLookAroundView
{
  return self->_hideLookAroundView;
}

- (void)setHideLookAroundView:(BOOL)a3
{
  self->_hideLookAroundView = a3;
}

- (BOOL)shouldShowMapAttribution
{
  return self->_shouldShowMapAttribution;
}

- (GEOApplicationAuditToken)_auditToken
{
  return self->_auditToken;
}

- (void)_setAuditToken:(id)a3
{
  objc_storeStrong((id *)&self->_auditToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_loadTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_snapshotError, 0);
  objc_storeStrong((id *)&self->_snapshotWidthConstraint, 0);
  objc_storeStrong((id *)&self->_snapshotConstraints, 0);
  objc_storeStrong(&self->_mapItemloadedCompletionHandler, 0);
  objc_storeStrong((id *)&self->_camera, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_attributionURL, 0);
  objc_storeStrong((id *)&self->_attributionConstraints, 0);
  objc_storeStrong((id *)&self->_attributionBadgeView, 0);
  objc_storeStrong((id *)&self->_attributionLabel, 0);
  objc_storeStrong((id *)&self->_attributionAppleLogo, 0);
  objc_storeStrong((id *)&self->_lookAroundConstraints, 0);
  objc_storeStrong((id *)&self->_lookAroundContainerView, 0);
}

@end
