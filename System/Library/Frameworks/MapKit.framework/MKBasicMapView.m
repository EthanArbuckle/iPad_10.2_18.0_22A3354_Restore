@implementation MKBasicMapView

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MKBasicMapView bounds](self, "bounds");
  v14.origin.x = v8;
  v14.origin.y = v9;
  v14.size.width = v10;
  v14.size.height = v11;
  v13.origin.x = 0.0;
  v13.origin.y = 0.0;
  v13.size.width = width;
  v13.size.height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    if (objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_shouldAdoptImplicitAnimationParameters"))
    {
      -[MKBasicMapView _animateCanvasForBounds:](self, "_animateCanvasForBounds:", 0.0, 0.0, width, height);
    }
    else
    {
      -[MKBasicMapView _beginChangingViewSize](self, "_beginChangingViewSize");
      -[UIView setFrame:](self->_hostView, "setFrame:", 0.0, 0.0, width, height);
      if (self->_hasRenderedSomething && !self->_inBackground)
        -[VKMapView forceFrame](self->_mapView, "forceFrame");
      -[MKBasicMapView _finishChangingViewSize](self, "_finishChangingViewSize");
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)MKBasicMapView;
  -[MKBasicMapView setFrame:](&v12, sel_setFrame_, x, y, width, height);
}

- (void)_finishChangingViewSize
{
  int64_t changingViewSizeCount;

  changingViewSizeCount = self->_changingViewSizeCount;
  if (changingViewSizeCount)
    self->_changingViewSizeCount = changingViewSizeCount - 1;
}

- (void)_beginChangingViewSize
{
  ++self->_changingViewSizeCount;
}

- (void)updateStatsForTrafficEnabledTime
{
  -[MKBasicMapView _updateStatsForTrafficEnabledTime:](self, "_updateStatsForTrafficEnabledTime:", 0);
}

- (void)updateStatsForEnablingTraffic:(BOOL)a3
{
  ADClientAddValueForScalarKey();
}

- (void)_updateStatsForTrafficEnabledTime:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  v3 = a3;
  -[MKBasicMapView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v5 || v3) && CFAbsoluteTimeGetCurrent() - self->_trafficStartTime >= 1.0)
  {
    if ((-[VKMapView trafficEnabled](self->_mapView, "trafficEnabled") & 1) == 0)
      -[VKMapView hasTraffic](self->_mapView, "hasTraffic");
    ADClientAddValueForScalarKey();
    self->_trafficStartTime = CFAbsoluteTimeGetCurrent();
  }
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MKBasicMapView;
  -[MKBasicMapView didMoveToWindow](&v8, sel_didMoveToWindow);
  -[MKBasicMapView _updateMapViewHidden](self, "_updateMapViewHidden");
  -[MKBasicMapView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else if (-[MKBasicMapView isChangingViewSize](self, "isChangingViewSize"))
  {
    -[MKBasicMapView bounds](self, "bounds");
    -[UIView setFrame:](self->_hostView, "setFrame:");
  }
  -[MKBasicMapView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MKBasicMapView _registerSceneNotifications](self, "_registerSceneNotifications");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0CEBE08];
    -[MKBasicMapView window](self, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__updateForCurrentScreen, v6, v7);

    self->_mapModeStartTime = CFAbsoluteTimeGetCurrent();
    self->_trafficStartTime = CFAbsoluteTimeGetCurrent();
  }
  else
  {
    -[MKBasicMapView _updateStatsForTimeSpentInCurrentMapTypeIsShowingFlyover:ignoreIfViewInWindow:](self, "_updateStatsForTimeSpentInCurrentMapTypeIsShowingFlyover:ignoreIfViewInWindow:", 0, 1);
    -[MKBasicMapView _updateStatsForTrafficEnabledTime:](self, "_updateStatsForTrafficEnabledTime:", 1);
  }
  -[MKBasicMapView _updateBackgroundState](self, "_updateBackgroundState");
  -[MKBasicMapView _updateForCurrentScreen](self, "_updateForCurrentScreen");
}

- (void)_registerSceneNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[MKBasicMapView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__sceneWillEnterForeground_, *MEMORY[0x1E0CEBB70], v7);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__sceneDidEnterBackground_, *MEMORY[0x1E0CEBB50], v7);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__finishedSnapshot_, *MEMORY[0x1E0CEC150], v7);

  }
}

- (void)setRendersInBackground:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  MKBasicMapView *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  MKGetMKDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = objc_opt_class();
    v7 = -[VKMapView rendersInBackground](self->_mapView, "rendersInBackground");
    v8 = 138413058;
    v9 = v6;
    v10 = 2048;
    v11 = self;
    v12 = 1024;
    v13 = v7;
    v14 = 1024;
    v15 = v3;
    _os_log_impl(&dword_18B0B0000, v5, OS_LOG_TYPE_INFO, "%@<%p> setRendersInBackground: %d -> %d", (uint8_t *)&v8, 0x22u);
  }

  -[VKMapView setRendersInBackground:](self->_mapView, "setRendersInBackground:", v3);
  -[MKBasicMapView _updateBackgroundState](self, "_updateBackgroundState");
  -[MKBasicMapView _updateMapViewHidden](self, "_updateMapViewHidden");
}

- (void)_updateMapViewHidden
{
  uint64_t v3;
  id v4;

  if ((-[MKBasicMapView isHidden](self, "isHidden") & 1) != 0)
  {
    -[VKMapView setHidden:](self->_mapView, "setHidden:", 1);
  }
  else
  {
    -[MKBasicMapView window](self, "window");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4)
      v3 = 0;
    else
      v3 = -[MKBasicMapView rendersInBackground](self, "rendersInBackground") ^ 1;
    -[VKMapView setHidden:](self->_mapView, "setHidden:", v3);

  }
}

- (void)_updateBackgroundState
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  MKBasicMapView *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[MKBasicMapView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (v5 = objc_msgSend(v4, "activationState") + 1, v5 <= 3))
    v6 = qword_18B2A9D58[v5];
  else
    v6 = 0;
  MKGetMKDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 138413058;
    v9 = objc_opt_class();
    v10 = 2048;
    v11 = self;
    v12 = 2048;
    v13 = objc_msgSend(v4, "activationState");
    v14 = 2048;
    v15 = v6;
    _os_log_impl(&dword_18B0B0000, v7, OS_LOG_TYPE_INFO, "%@<%p> updateBackgroundState: determined activation state %ld == map scene state %ld", (uint8_t *)&v8, 0x2Au);
  }

  -[MKBasicMapView _updateBackgroundState:](self, "_updateBackgroundState:", v6);
}

- (void)_updateBackgroundState:(int64_t)a3
{
  _BOOL4 v5;
  unint64_t v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  _BOOL4 inBackground;
  _BOOL4 inactive;
  int v13;
  uint64_t v14;
  __int16 v15;
  MKBasicMapView *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  int64_t v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (self->_inactive)
  {
    v5 = 1;
  }
  else
  {
    v6 = a3 & 0xFFFFFFFFFFFFFFFDLL;
    v7 = -[VKMapView rendersInBackground](self->_mapView, "rendersInBackground") ^ 1;
    if (v6 == 1)
      v5 = v7;
    else
      v5 = 0;
  }
  MKGetMKDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_opt_class();
    if (v5)
      v10 = "";
    else
      v10 = " not";
    inBackground = self->_inBackground;
    inactive = self->_inactive;
    v13 = 138413826;
    v14 = v9;
    v15 = 2048;
    v16 = self;
    v17 = 2080;
    v18 = v10;
    v19 = 1024;
    v20 = inBackground;
    v21 = 2048;
    v22 = a3;
    v23 = 1024;
    v24 = inactive;
    v25 = 1024;
    v26 = -[MKBasicMapView rendersInBackground](self, "rendersInBackground");
    _os_log_impl(&dword_18B0B0000, v8, OS_LOG_TYPE_INFO, "%@<%p> updateBackgroundState: determined is%s in background (was background: %d, scene state: %ld, inactive: %d, rendersInBackground: %d)", (uint8_t *)&v13, 0x3Cu);
  }

  if (self->_inBackground != v5)
  {
    self->_inBackground = v5;
    if (v5)
    {
      -[MKBasicMapView _didEnterBackground](self, "_didEnterBackground");
    }
    else
    {
      -[VKMapView openLoaderConnection](self->_mapView, "openLoaderConnection");
      -[VKMapView willEnterForeground](self->_mapView, "willEnterForeground");
    }
  }
}

- (BOOL)rendersInBackground
{
  return -[VKMapView rendersInBackground](self->_mapView, "rendersInBackground");
}

- (void)updateStatsForSwitchingToMapType:(int)a3
{
  if (a3 <= 8)
    ADClientAddValueForScalarKey();
}

- (void)updateStatsForTimeSpentInCurrentMapTypeIsShowingFlyover:(BOOL)a3
{
  -[MKBasicMapView _updateStatsForTimeSpentInCurrentMapTypeIsShowingFlyover:ignoreIfViewInWindow:](self, "_updateStatsForTimeSpentInCurrentMapTypeIsShowingFlyover:ignoreIfViewInWindow:", a3, 0);
}

- (VKMapView)mapView
{
  return self->_mapView;
}

- (void)_updateStatsForTimeSpentInCurrentMapTypeIsShowingFlyover:(BOOL)a3 ignoreIfViewInWindow:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  int v9;
  int v10;
  __CFString *v11;
  const __CFString *v12;
  BOOL v13;
  const __CFString *v14;
  const __CFString *v15;
  __CFString *v16;

  v4 = a4;
  v5 = a3;
  -[MKBasicMapView window](self, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v7 || v4) && CFAbsoluteTimeGetCurrent() - self->_mapModeStartTime >= 1.0)
  {
    -[MKBasicMapView mapView](self, "mapView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "mapType");

    v10 = -[VKMapView isPitched](self->_mapView, "isPitched");
    switch(v9)
    {
      case 0:
      case 6:
        v11 = CFSTR("com.apple.maps.standardMode.time");
        v12 = CFSTR("com.apple.maps.standardPitchedMode.time");
        goto LABEL_22;
      case 1:
      case 7:
        v11 = CFSTR("com.apple.maps.satelliteMode.time");
        v12 = CFSTR("com.apple.maps.satellitePitchedMode.time");
        goto LABEL_22;
      case 2:
        v11 = CFSTR("com.apple.maps.hybridMode.time");
        v12 = CFSTR("com.apple.maps.hybridPitchedMode.time");
        goto LABEL_22;
      case 3:
        v11 = CFSTR("com.apple.maps.satelliteGlobeMode.time");
        v13 = !v5;
        v14 = CFSTR("com.apple.maps.satelliteGlobePitchedMode.time");
        if (v5)
          v11 = CFSTR("com.apple.maps.satelliteGlobeFlyoverMode.time");
        v15 = CFSTR("com.apple.maps.satelliteGlobePitchedFlyoverMode.time");
        goto LABEL_14;
      case 4:
        v11 = CFSTR("com.apple.maps.hybridGlobeMode.time");
        v13 = !v5;
        v14 = CFSTR("com.apple.maps.hybridGlobePitchedMode.time");
        if (v5)
          v11 = CFSTR("com.apple.maps.hybridGlobeFlyoverMode.time");
        v15 = CFSTR("com.apple.maps.hybridGlobePitchedFlyoverMode.time");
LABEL_14:
        if (v13)
          v15 = v14;
        if (v10)
          v11 = (__CFString *)v15;
        goto LABEL_24;
      case 5:
        v11 = CFSTR("com.apple.maps.navigationMode.time");
        v12 = CFSTR("com.apple.maps.navigationPitchedMode.time");
        goto LABEL_22;
      case 8:
        v11 = CFSTR("com.apple.maps.transitMode.time");
        v12 = CFSTR("com.apple.maps.transitPitchedMode.time");
LABEL_22:
        if (v10)
          v11 = (__CFString *)v12;
LABEL_24:
        v16 = v11;
        ADClientAddValueForScalarKey();

        break;
      default:
        break;
    }
    self->_mapModeStartTime = CFAbsoluteTimeGetCurrent();
  }
}

uint64_t __91__MKBasicMapView_initWithFrame_andGlobe_shouldRasterize_allowsAntialiasing_carDisplayType___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0DC6570], "setDragCoefficientGetter:", &__block_literal_global_6_0);
}

- (void)_updateForCurrentScreen
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  double v19;
  void *v20;
  id v21;

  -[MKBasicMapView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v21;
  if (v21)
  {
    objc_msgSend(v21, "nativeScale");
    v6 = v5;
    v7 = GEOResourceFilterScaleForScale();
    objc_msgSend(v21, "scale");
    v8 = GEOResourceFilterScaleForScale();
    v9 = objc_msgSend(v21, "_userInterfaceIdiom");
    objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activateResourceScale:", v8);

    if ((_DWORD)v8 != (_DWORD)v7)
    {
      objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "activateResourceScale:", v7);

    }
    if (v9 == 3)
    {
      objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "activateResourceScenario:", 1);

    }
    objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activeTileGroup");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scale");
    v16 = GEOResourceFilterScaleForScale();

    if (v9 == 3 && v14 && (_DWORD)v7 != v16)
    {
      if (objc_msgSend(v14, "activeScalesCount"))
      {
        v17 = 0;
        while (objc_msgSend(v14, "activeScaleAtIndex:", v17) != (_DWORD)v7)
        {
          if (++v17 >= (unint64_t)objc_msgSend(v14, "activeScalesCount"))
            goto LABEL_13;
        }
      }
      else
      {
LABEL_13:
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "nativeScale");
        v6 = v19;

      }
    }
    -[VKMapView setContentsScale:](self->_mapView, "setContentsScale:", v6);
    -[VKMapView setTargetDisplay:](self->_mapView, "setTargetDisplay:", v9 == 3);
    objc_msgSend(v21, "_mapkit_display");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKMapView setHostDisplay:](self->_mapView, "setHostDisplay:", v20);

    v4 = v21;
  }

}

- (MKBasicMapView)initWithFrame:(CGRect)a3 andGlobe:(BOOL)a4 shouldRasterize:(BOOL)a5 allowsAntialiasing:(BOOL)a6 carDisplayType:(int64_t)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  MKBasicMapView *v10;
  _MKMapLayerHostingView *v11;
  _MKMapLayerHostingView *v12;
  UIView *hostView;
  void *v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  VKMapView *mapView;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _MKMapLayerHostingView *v29;
  objc_super v30;
  _QWORD v31[4];
  _QWORD v32[5];

  v8 = a6;
  v9 = a5;
  v32[4] = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)MKBasicMapView;
  v10 = -[MKBasicMapView initWithFrame:](&v30, sel_initWithFrame_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v10)
  {
    if (initWithFrame_andGlobe_shouldRasterize_allowsAntialiasing_carDisplayType__once != -1)
      dispatch_once(&initWithFrame_andGlobe_shouldRasterize_allowsAntialiasing_carDisplayType__once, &__block_literal_global_47);
    -[MKBasicMapView _updateBackgroundState:](v10, "_updateBackgroundState:", 0);
    v11 = [_MKMapLayerHostingView alloc];
    -[MKBasicMapView bounds](v10, "bounds");
    v12 = -[_MKMapLayerHostingView initWithFrame:](v11, "initWithFrame:");
    hostView = v10->_hostView;
    v10->_hostView = &v12->super;
    v29 = v12;

    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "nativeScale");
    v16 = v15;

    objc_msgSend(MEMORY[0x1E0DC6528], "descriptorWithShouldRasterize:inBackground:contentScale:auditToken:mapViewPurpose:allowsAntialiasing:", v9, v10->_inBackground, 0, 0, v8, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCarDisplayType:", a7);
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC6520]), "initWithDescriptor:", v17);
    mapView = v10->_mapView;
    v10->_mapView = (VKMapView *)v18;

    -[_MKMapLayerHostingView setMapView:](v29, "setMapView:", v10->_mapView);
    v31[0] = CFSTR("bounds");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v20;
    v31[1] = CFSTR("position");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v21;
    v31[2] = CFSTR("hidden");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v22;
    v31[3] = CFSTR("sublayers");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32[3] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKMapView setActions:](v10->_mapView, "setActions:", v24);

    -[UIView bounds](v10->_hostView, "bounds");
    -[VKMapView setFrame:](v10->_mapView, "setFrame:");
    -[VKMapView setHidden:](v10->_mapView, "setHidden:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v10, sel__updateForCurrentLocale, *MEMORY[0x1E0C99720], 0);

    -[MKBasicMapView _updateForCurrentLocale](v10, "_updateForCurrentLocale");
    -[UIView layer](v10->_hostView, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSublayer:", v10->_mapView);

    -[MKBasicMapView addSubview:](v10, "addSubview:", v10->_hostView);
    -[MKBasicMapView setClipsToBounds:](v10, "setClipsToBounds:", 1);
    v10->_mapModeStartTime = CFAbsoluteTimeGetCurrent();
    v10->_trafficStartTime = CFAbsoluteTimeGetCurrent();
    objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "addTileGroupObserver:queue:", v10, MEMORY[0x1E0C80D38]);
  }
  return v10;
}

- (void)_updateForCurrentLocale
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[VKMapView setPreferredUnits:](self->_mapView, "setPreferredUnits:", objc_msgSend(v3, "usesMetricSystem"));

}

- (void)setTrafficStartTime:(double)a3
{
  self->_trafficStartTime = a3;
}

- (void)setMapModeStartTime:(double)a3
{
  self->_mapModeStartTime = a3;
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[MKBasicMapView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MKBasicMapView _unregisterSceneNotifications](self, "_unregisterSceneNotifications");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0CEBE08];
    -[MKBasicMapView window](self, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, v7, v8);

  }
  v9.receiver = self;
  v9.super_class = (Class)MKBasicMapView;
  -[MKBasicMapView willMoveToWindow:](&v9, sel_willMoveToWindow_, v4);

}

- (BOOL)isChangingViewSize
{
  return self->_changingViewSizeCount > 0;
}

- (void)_didEnterBackground
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[VKMapView closeLoaderConnection](self->_mapView, "closeLoaderConnection");
  -[VKMapView didEnterBackground](self->_mapView, "didEnterBackground");
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForInfoDictionaryKey:", CFSTR("CAProcessCanAccessGPU"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 || (v4 = objc_msgSend(v6, "BOOLValue"), v5 = v6, (v4 & 1) == 0))
  {
    -[VKMapView flushTileLoads](self->_mapView, "flushTileLoads");
    v5 = v6;
  }

}

- (void)_finishedSnapshot:(id)a3
{
  -[VKMapView didFinishSnapshotting](self->_mapView, "didFinishSnapshotting", a3);
}

- (MKBasicMapView)initWithFrame:(CGRect)a3 andGlobe:(BOOL)a4 shouldRasterize:(BOOL)a5
{
  return -[MKBasicMapView initWithFrame:andGlobe:shouldRasterize:allowsAntialiasing:](self, "initWithFrame:andGlobe:shouldRasterize:allowsAntialiasing:", a4, a5, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MKBasicMapView)initWithFrame:(CGRect)a3 andGlobe:(BOOL)a4 shouldRasterize:(BOOL)a5 allowsAntialiasing:(BOOL)a6
{
  return -[MKBasicMapView initWithFrame:andGlobe:shouldRasterize:allowsAntialiasing:carDisplayType:](self, "initWithFrame:andGlobe:shouldRasterize:allowsAntialiasing:carDisplayType:", a4, a5, a6, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTileGroupObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)MKBasicMapView;
  -[MKBasicMapView dealloc](&v5, sel_dealloc);
}

- (UIEdgeInsets)edgeInsets
{
  float v2;
  double v3;
  float v4;
  double v5;
  float v6;
  double v7;
  float v8;
  double v9;
  UIEdgeInsets result;

  -[VKMapView edgeInsets](self->_mapView, "edgeInsets");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  result.right = v9;
  result.bottom = v7;
  result.left = v5;
  result.top = v3;
  return result;
}

- (void)addCalloutSubview:(id)a3
{
  -[UIView addSubview:](self->_hostView, "addSubview:", a3);
}

- (CGSize)calloutContainerCanvasSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[UIView frame](self->_hostView, "frame");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (double)calloutContainerCanvasScale
{
  double result;

  -[VKMapView contentsScale](self->_mapView, "contentsScale");
  return result;
}

- (void)setInactive:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  uint64_t v6;
  _BOOL4 inactive;
  int v8;
  uint64_t v9;
  __int16 v10;
  MKBasicMapView *v11;
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  MKGetMKDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = objc_opt_class();
    inactive = self->_inactive;
    v8 = 138413058;
    v9 = v6;
    v10 = 2048;
    v11 = self;
    v12 = 1024;
    v13 = inactive;
    v14 = 1024;
    v15 = v3;
    _os_log_impl(&dword_18B0B0000, v5, OS_LOG_TYPE_INFO, "%@<%p> setInactive: %d -> %d", (uint8_t *)&v8, 0x22u);
  }

  if (self->_inactive != v3)
  {
    self->_inactive = v3;
    -[MKBasicMapView _updateBackgroundState](self, "_updateBackgroundState");
  }
}

- (void)_animateCanvasForBounds:(CGRect)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  uint64_t v14;
  _QWORD v15[5];
  _QWORD v16[9];
  _QWORD v17[9];
  CGRect v18;
  CGRect v19;

  height = a3.size.height;
  width = a3.size.width;
  -[MKBasicMapView frame](self, "frame", a3.origin.x, a3.origin.y);
  v6 = width;
  if (width <= v7)
  {
    -[MKBasicMapView frame](self, "frame");
    v6 = v8;
  }
  -[MKBasicMapView frame](self, "frame");
  v9 = height;
  if (height <= v10)
  {
    -[MKBasicMapView frame](self, "frame");
    v9 = v11;
  }
  -[MKBasicMapView bounds](self, "bounds");
  v12 = CGRectGetMidX(v18) - v6 * 0.5;
  -[MKBasicMapView bounds](self, "bounds");
  v13 = CGRectGetMidY(v19) - v9 * 0.5;
  -[MKBasicMapView _beginChangingViewSize](self, "_beginChangingViewSize");
  v14 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __42__MKBasicMapView__animateCanvasForBounds___block_invoke;
  v17[3] = &unk_1E20D8E40;
  v17[4] = self;
  *(CGFloat *)&v17[5] = v12;
  *(CGFloat *)&v17[6] = v13;
  *(double *)&v17[7] = v6;
  *(double *)&v17[8] = v9;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v17);
  v15[4] = self;
  v16[0] = v14;
  v16[1] = 3221225472;
  v16[2] = __42__MKBasicMapView__animateCanvasForBounds___block_invoke_2;
  v16[3] = &unk_1E20D8E40;
  v16[4] = self;
  *(double *)&v16[5] = width * 0.5 - v6 * 0.5;
  *(double *)&v16[6] = height * 0.5 - v9 * 0.5;
  *(double *)&v16[7] = v6;
  *(double *)&v16[8] = v9;
  v15[0] = v14;
  v15[1] = 3221225472;
  v15[2] = __42__MKBasicMapView__animateCanvasForBounds___block_invoke_3;
  v15[3] = &unk_1E20D82F8;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v16, v15, 0.0);
}

uint64_t __42__MKBasicMapView__animateCanvasForBounds___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "forceLayout");
}

uint64_t __42__MKBasicMapView__animateCanvasForBounds___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __42__MKBasicMapView__animateCanvasForBounds___block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "bounds");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setFrame:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "forceLayout");
  }
  return objc_msgSend(*(id *)(a1 + 32), "_finishChangingViewSize");
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MKBasicMapView bounds](self, "bounds");
  v14.origin.x = v8;
  v14.origin.y = v9;
  v14.size.width = v10;
  v14.size.height = v11;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    if (objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_shouldAdoptImplicitAnimationParameters"))
    {
      -[MKBasicMapView _animateCanvasForBounds:](self, "_animateCanvasForBounds:", x, y, width, height);
    }
    else
    {
      -[MKBasicMapView _beginChangingViewSize](self, "_beginChangingViewSize");
      -[UIView setFrame:](self->_hostView, "setFrame:", x, y, width, height);
      if (self->_hasRenderedSomething && !self->_inBackground)
        -[VKMapView forceFrame](self->_mapView, "forceFrame");
      -[MKBasicMapView _finishChangingViewSize](self, "_finishChangingViewSize");
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)MKBasicMapView;
  -[MKBasicMapView setBounds:](&v12, sel_setBounds_, x, y, width, height);
}

- (CLLocationCoordinate2D)convertPoint:(CGPoint)a3 toCoordinateFromView:(id)a4
{
  double y;
  double x;
  VKMapView *mapView;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CLLocationCoordinate2D result;

  y = a3.y;
  x = a3.x;
  mapView = self->_mapView;
  objc_msgSend(a4, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapView convertPoint:toCoordinateFromLayer:](mapView, "convertPoint:toCoordinateFromLayer:", v7, x, y);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.longitude = v13;
  result.latitude = v12;
  return result;
}

- (CGPoint)convertCoordinate:(CLLocationCoordinate2D)a3 toPointToView:(id)a4
{
  double longitude;
  double latitude;
  VKMapView *mapView;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  longitude = a3.longitude;
  latitude = a3.latitude;
  mapView = self->_mapView;
  objc_msgSend(a4, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapView convertCoordinate:toPointToLayer:](mapView, "convertCoordinate:toPointToLayer:", v7, latitude, longitude);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGPoint)convertCoordinate:(CLLocationCoordinate2D)a3 toCameraModelPointToView:(id)a4
{
  double longitude;
  double latitude;
  VKMapView *mapView;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  longitude = a3.longitude;
  latitude = a3.latitude;
  mapView = self->_mapView;
  objc_msgSend(a4, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapView convertCoordinate:toCameraModelPointToLayer:](mapView, "convertCoordinate:toCameraModelPointToLayer:", v7, latitude, longitude);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (BOOL)isPointValidForGesturing:(CGPoint)a3
{
  return -[VKMapView isPointValidForGesturing:](self->_mapView, "isPointValidForGesturing:", a3.x, a3.y);
}

- (void)_sceneWillEnterForeground:(id)a3
{
  -[MKBasicMapView _updateBackgroundState:](self, "_updateBackgroundState:", 2);
}

- (void)_sceneDidEnterBackground:(id)a3
{
  -[MKBasicMapView _updateBackgroundState:](self, "_updateBackgroundState:", 3);
}

- (void)_unregisterSceneNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[MKBasicMapView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0CEBB70], v7);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0CEBB50], v7);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0CEC150], v7);

  }
}

- (void)setHidden:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKBasicMapView;
  -[MKBasicMapView setHidden:](&v4, sel_setHidden_, a3);
  -[MKBasicMapView _updateMapViewHidden](self, "_updateMapViewHidden");
}

- (double)mapModeStartTime
{
  return self->_mapModeStartTime;
}

- (double)trafficStartTime
{
  return self->_trafficStartTime;
}

- (BOOL)hasRenderedSomething
{
  return self->_hasRenderedSomething;
}

- (void)setHasRenderedSomething:(BOOL)a3
{
  self->_hasRenderedSomething = a3;
}

- (BOOL)inactive
{
  return self->_inactive;
}

- (BOOL)isInBackground
{
  return self->_inBackground;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_hostView, 0);
}

@end
